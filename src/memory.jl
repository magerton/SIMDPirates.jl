

function valloc(::Type{T}, N::Int, sz::Int) where T
    @assert N > 0
    @assert sz >= 0
    # We use padding to align the address of the first element, and
    # also to ensure that we can access past the last element up to
    # the next full vector width
    padding = N-1 + mod(-sz, N)
    mem = Vector{T}(undef, sz + padding)
    addr = Int(pointer(mem))
    off = mod(-addr, N * sizeof(T))
    @assert mod(off, sizeof(T)) == 0
    off = fld(off, sizeof(T))
    @assert 0 <= off <= padding
    res = view(mem, off+1 : off+sz)
    addr2 = Int(pointer(res))
    @assert mod(addr2, N * sizeof(T)) == 0
    res
end
function valloc(f, ::Type{T}, N::Int, sz::Int) where T
    mem = valloc(T, N, sz)
    @inbounds for i in 1:sz
        mem[i] = f(i)
    end
    mem
end


@generated function vload(::Type{Vec{N,T}}, ptr::Ptr{T},
                          ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned}
    @assert isa(Aligned, Bool)
    ptyp = llvmtype(Int)
    typ = llvmtype(T)
    vtyp = "<$N x $typ>"
    decls = []
    instrs = []
    if Aligned
        align = N * sizeof(T)
    else
        align = sizeof(T)   # This is overly optimistic
    end
    flags = [""]
    if align > 0
        push!(flags, "align $align")
    end
    if VERSION < v"v0.7.0-DEV"
        push!(instrs, "%ptr = bitcast $typ* %0 to $vtyp*")
    else
        push!(instrs, "%ptr = inttoptr $ptyp %0 to $vtyp*")
    end
    push!(instrs, "%res = load $vtyp, $vtyp* %ptr" * join(flags, ", "))
    push!(instrs, "ret $vtyp %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            Vec{N,T}, Tuple{Ptr{T}}, ptr)
    end
end

@inline vloada(::Type{Vec{N,T}}, ptr::Ptr{T}) where {N,T} =
    vload(Vec{N,T}, ptr, Val{true})

@inline function vload(::Type{Vec{N,T}},
                       arr::Union{Array{T,D},SubArray{T,D}},
                       i::Integer,
                       ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned,D}
    #TODO @boundscheck 1 <= i <= length(arr) - (N-1) || throw(BoundsError())
    vload(Vec{N,T}, pointer(arr, i), Val{Aligned})
end
@inline function vloada(::Type{Vec{N,T}},
                        arr::Union{Array{T,1},SubArray{T,1}},
                        i::Integer) where {N,T}
    vload(Vec{N,T}, arr, i, Val{true})
end

@generated function vload(::Type{Vec{N,T}}, ptr::Ptr{T},
                          mask::Vec{N,Bool},
                          ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned}
    @assert isa(Aligned, Bool)
    ptyp = llvmtype(Int)
    typ = llvmtype(T)
    vtyp = "<$N x $typ>"
    btyp = llvmtype(Bool)
    vbtyp = "<$N x $btyp>"
    decls = []
    instrs = []
    if Aligned
        align = N * sizeof(T)
    else
        align = sizeof(T)   # This is overly optimistic
    end

    if VERSION < v"v0.7.0-DEV"
        push!(instrs, "%ptr = bitcast $typ* %0 to $vtyp*")
    else
        push!(instrs, "%ptr = inttoptr $ptyp %0 to $vtyp*")
    end
    push!(instrs, "%mask = trunc $vbtyp %1 to <$N x i1>")
    push!(decls,
        "declare $vtyp @llvm.masked.load.$(suffix(N,T))($vtyp*, i32, " *
            "<$N x i1>, $vtyp)")
    push!(instrs,
        "%res = call $vtyp @llvm.masked.load.$(suffix(N,T))($vtyp* %ptr, " *
            "i32 $align, <$N x i1> %mask, $vtyp $(llvmconst(N, T, 0)))")
    push!(instrs, "ret $vtyp %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            Vec{N,T}, Tuple{Ptr{T}, Vec{N,Bool}}, ptr, mask)
    end
end

@inline vloada(::Type{Vec{N,T}}, ptr::Ptr{T}, mask::Vec{N,Bool}) where {N,T} =
    vload(Vec{N,T}, ptr, mask, Val{true})

@inline function vload(::Type{Vec{N,T}},
                       arr::Union{Array{T,1},SubArray{T,1}},
                       i::Integer, mask::Vec{N,Bool},
                       ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned}
    #TODO @boundscheck 1 <= i <= length(arr) - (N-1) || throw(BoundsError())
    vload(Vec{N,T}, pointer(arr, i), mask, Val{Aligned})
end
@inline function vloada(::Type{Vec{N,T}},
                        arr::Union{Array{T,1},SubArray{T,1}}, i::Integer,
                        mask::Vec{N,Bool}) where {N,T}
    vload(Vec{N,T}, arr, i, mask, Val{true})
end


@generated function vstore(v::Vec{N,T}, ptr::Ptr{T},
                           ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned}
    @assert isa(Aligned, Bool)
    ptyp = llvmtype(Int)
    typ = llvmtype(T)
    vtyp = "<$N x $typ>"
    decls = []
    instrs = []
    if Aligned
        align = N * sizeof(T)
    else
        align = sizeof(T)   # This is overly optimistic
    end
    flags = [""]
    if align > 0
        push!(flags, "align $align")
    end
    if VERSION < v"v0.7.0-DEV"
        push!(instrs, "%ptr = bitcast $typ* %1 to $vtyp*")
    else
        push!(instrs, "%ptr = inttoptr $ptyp %1 to $vtyp*")
    end
    push!(instrs, "store $vtyp %0, $vtyp* %ptr" * join(flags, ", "))
    push!(instrs, "ret void")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
                      Cvoid, Tuple{Vec{N,T}, Ptr{T}}, v, ptr)
    end
end

@inline vstorea(v::Vec{N,T}, ptr::Ptr{T}) where {N,T} = vstore(v, ptr, Val{true})

@inline function vstore(v::Vec{N,T},
                        arr::Union{Array{T,D},SubArray{T,D}},
                        i::Integer,
                        ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned,D}
    @boundscheck 1 <= i <= length(arr) - (N-1) || throw(BoundsError())
    vstore(v, pointer(arr, i), Val{Aligned})
end
@inline function vstorea(v::Vec{N,T}, arr::Union{Array{T,1},SubArray{T,1}},
                         i::Integer) where {N,T}
    vstore(v, arr, i, Val{true})
end

@generated function vstore(v::Vec{N,T}, ptr::Ptr{T},
                           mask::Vec{N,Bool},
                           ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned}
    @assert isa(Aligned, Bool)
    ptyp = llvmtype(Int)
    typ = llvmtype(T)
    vtyp = "<$N x $typ>"
    btyp = llvmtype(Bool)
    vbtyp = "<$N x $btyp>"
    decls = []
    instrs = []
    if Aligned
        align = N * sizeof(T)
    else
        align = sizeof(T)   # This is overly optimistic
    end
    if VERSION < v"v0.7.0-DEV"
        push!(instrs, "%ptr = bitcast $typ* %1 to $vtyp*")
    else
        push!(instrs, "%ptr = inttoptr $ptyp %1 to $vtyp*")
    end
    push!(instrs, "%mask = trunc $vbtyp %2 to <$N x i1>")
    push!(decls,
        "declare void @llvm.masked.store.$(suffix(N,T))($vtyp, $vtyp*, i32, " *
            "<$N x i1>)")
    push!(instrs,
        "call void @llvm.masked.store.$(suffix(N,T))($vtyp %0, $vtyp* %ptr, " *
            "i32 $align, <$N x i1> %mask)")
    push!(instrs, "ret void")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            Cvoid, Tuple{Vec{N,T}, Ptr{T}, Vec{N,Bool}},
            v, ptr, mask)
    end
end

@inline vstorea(v::Vec{N,T}, ptr::Ptr{T}, mask::Vec{N,Bool}) where {N,T} =
    vstore(v, ptr, mask, Val{true})

@inline function vstore(v::Vec{N,T},
                        arr::Union{Array{T,D},SubArray{T,D}},
                        i::Integer,
                        mask::Vec{N,Bool},
                        ::Type{Val{Aligned}} = Val{false}) where {N,T,Aligned,D}
    #TODO @boundscheck 1 <= i <= length(arr) - (N-1) || throw(BoundsError())
    vstore(v, pointer(arr, i), mask, Val{Aligned})
end
@inline function vstorea(v::Vec{N,T},
                         arr::Union{Array{T,1},SubArray{T,1}},
                         i::Integer, mask::Vec{N,Bool}) where {N,T}
    vstore(v, arr, i, mask, Val{true})
end
