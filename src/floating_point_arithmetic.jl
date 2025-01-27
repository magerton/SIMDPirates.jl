
# Floating point arithmetic functions

for op ∈ (
    :(+), #:(-),
    :abs, :floor, :ceil, :round,
    :sin, :cos,
    :exp2, :inv, :log10, :log2,
    :sqrt, :trunc
    # :exp, :log
    )
    rename = VECTOR_SYMBOLS[op]
    @eval begin
        @inline $rename(s1::FloatingTypes) = @fastmath $op(s1)

        @vectordef $rename function Base.$op(v1) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1))
        end

        # @inline $rename(v1::Vec{N,T}) where {N,T<:FloatingTypes} =
        #     llvmwrap(Val{$(QuoteNode(op))}(), v1)
        # @inline $rename(v1::AbstractStructVec{N,T}) where {N,T<:FloatingTypes} =
        #     SVec(llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1)))
        # @inline Base.$op(v1::AbstractStructVec{N,T}) where {N,T<:FloatingTypes} =
        #     SVec(llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1)))
    end
end
@inline vexp10(s1::FloatingTypes) = exp10(s1)
@vectordef vexp10 function Base.exp10(v1) where {N,T <: FloatingTypes}
    vpow(vbroadcast(Vec{N,T}, 10), extract_data(v1))
end
# @inline vexp10(v1::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes} = vpow(vbroadcast(Vec{N,T}, 10), v1)
@inline vsign(s1::FloatingTypes) = sign(s1)
@vectordef vsign function Base.sign(v1) where {N,T<:FloatingTypes}
    vifelse(
        extract_data(v1) == vbroadcast(Vec{N,T}, zero(T)),
        vbroadcast(Vec{N,T}, zero(T)),
        copysign(vbroadcast(Vec{N,T}, one(T)), extract_data(v1))
    )
end
# @inline function vsign(v1::AbstractStructVec{N,T}) where {N,T<:FloatingTypes}
#     SVec(vsign(extract_data(v1)))
# end
# @inline function Base.sign(v1::AbstractStructVec{N,T}) where {N,T<:FloatingTypes}
#     SVec(vsign(extract_data(v1)))
# end

for op ∈ (
        :(+), :(-), :(*), :(/), :(%), :(^),
        :copysign#, :max, :min
    )
    rename = VECTOR_SYMBOLS[op]
    # exact / explicit version
    erename = Symbol(:e, rename)
    @eval begin
        @inline $rename(s1::FloatingTypes, s2::FloatingTypes) = @fastmath $op(s1, s2)

        @vectordef $rename function Base.$op(v1, v2) where {N,T <: FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2))
        end


        @inline $erename(s1::FloatingTypes, s2::FloatingTypes) = $op(s1, s2)

        @evectordef $erename function Base.$op(v1, v2) where {N,T <: FloatingTypes}
            llvmwrap_notfast(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2))
        end

        # @inline $rename(v1::Vec{N,T}, v2::Vec{N,T}) where {N,T<:FloatingTypes} =
        #     llvmwrap(Val{$(QuoteNode(op))}(), v1, v2)
        # @inline $rename(v1::AbstractSIMDVector{N,T}, v2::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes} =
        #     SVec(llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2)))
        # @inline Base.$op(v1::AbstractSIMDVector{N,T}, v2::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes} =
        #     SVec(llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2)))
    end
end
@inline vmax(x, y) = max(x,y)
@vectordef vmax function Base.max(v1, v2) where {N,T<:FloatingTypes}
    vifelse(vgreater(extract_data(v1), extract_data(v2)), extract_data(v1), extract_data(v2))
end
@inline vmin(x, y) = min(x,y)
@vectordef vmin function Base.min(v1, v2) where {N,T<:FloatingTypes}
    vifelse(vless(extract_data(v1), extract_data(v2)), extract_data(v1), extract_data(v2))
end


# let op = :(*)
#     rename = VECTOR_SYMBOLS[op]
#     @eval begin
#         @inline $rename(s1::FloatingTypes, s2::FloatingTypes) = $op(s1, s2)
#         # @inline $rename(v1::Vec{N,T}, v2::Vec{N,T}) where {N,T<:FloatingTypes} =
#         #     VecProduct(v1, v2)
#         @inline $rename(v1::Vec{N,T}, v2::Vec{N,T}) where {N,T<:FloatingTypes} =
#             VecProduct(extract_data(v1), extract_data(v2))
#         @inline $rename(v1::AbstractSIMDVector{N,T}, v2::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes} =
#             SVecProduct(extract_data(v1), extract_data(v2))
#         @inline Base.$op(v1::AbstractStructVec{N,T}, v2::AbstractStructVec{N,T}) where {N,T<:FloatingTypes} =
#             SVecProduct(extract_data(v1), extract_data(v2))
#     end
# end


@generated function vfmsub(v1::AbstractSIMDVector{N,T},v2::AbstractSIMDVector{N,T},v3::AbstractSIMDVector{N,T}) where {N,T}
    quote
        $(Expr(:meta,:inline))
        vsub(vmul(v1,v2),v3)
    end
end
@generated function vfnmsub(v1::AbstractSIMDVector{N,T},v2::AbstractSIMDVector{N,T},v3::AbstractSIMDVector{N,T}) where {N,T}
    quote
        $(Expr(:meta,:inline))
        vsub(vsub(v3), vmul(v1,v2))
    end
end
@generated function vfnmadd(v1::AbstractSIMDVector{N,T},v2::AbstractSIMDVector{N,T},v3::AbstractSIMDVector{N,T}) where {N,T}
    quote
        $(Expr(:meta,:inline))
        vsub(v3, vmul(v1,v2))
    end
end



@inline vpow(s1::FloatingTypes, x2::Integer) = s1^x2
@vectordef vpow function Base.:^(v1, x2::Integer) where {N,T<:FloatingTypes}
    llvmwrap(Val{:powi}, extract_data(v1), Int(x2))
end
# @inline function vpow(v1::Vec{N,T}, x2::Integer) where {N,T<:FloatingTypes}
#     llvmwrap(Val{:powi}, v1, Int(x2))
# end
# @inline function vpow(v1::AbstractStructVec{N,T}, x2::Integer) where {N,T<:FloatingTypes}
#     SVec(llvmwrap(Val{:powi}, extract_data(v1), Int(x2)))
# end
# @inline function Base.:^(v1::AbstractStructVec{N,T}, x2::Integer) where {N,T<:FloatingTypes}
#     SVec(llvmwrap(Val{:powi}, extract_data(v1), Int(x2)))
# end

@inline vflipsign(s1::FloatingTypes, s2::FloatingTypes) = flipsign(s1, s2)

@vectordef vflipsign function Base.flipsign(v1, v2) where {N,T<:FloatingTypes}
    vifelse(vsignbit(extract_data(v2)), vsub(extract_data(v1)), extract_data(v1))
end

# @inline vflipsign(v1::Vec{N,T}, v2::Vec{N,T}) where {N,T<:FloatingTypes} =
#     vifelse(vsignbit(v2), -v1, v1)
# @inline vflipsign(v1::AbstractSIMDVector{N,T}, v2::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes} =
#     SVec(vifelse(vsignbit(v2), -v1, v1))
# @inline Base.flipsign(v1::AbstractStructVec{N,T}, v2::AbstractStructVec{N,T}) where {N,T<:FloatingTypes} =
#     SVec(vifelse(vsignbit(v2), -v1, v1))

for op ∈ (:fma, :muladd)
# let op = :fma
    rename = VECTOR_SYMBOLS[op]
    # if op == :muladd
        # rename = Symbol(:e,rename)
    # end
    @eval begin

        @vectordef $rename function Base.$op(v1, v2, v3) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(s1::T, v2, v3) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), SIMDPirates.vbroadcast(Vec{N,T}, s1), extract_data(v2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(v1, s2::T, v3) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), SIMDPirates.vbroadcast(Vec{N,T}, s2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(v1, v2, s3::T) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2), SIMDPirates.vbroadcast(Vec{N,T}, s3))
        end
        @vectordef $rename function Base.$op(s1::T, s2::T, v3) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), SIMDPirates.vbroadcast(Vec{N,T}, s1), SIMDPirates.vbroadcast(Vec{N,T}, s2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(s1::T, v2, s3::T) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), SIMDPirates.vbroadcast(Vec{N,T}, s1), extract_data(v2), SIMDPirates.vbroadcast(Vec{N,T}, s3))
        end
        @vectordef $rename function Base.$op(v1, s2::T, s3::T) where {N,T<:FloatingTypes}
            llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), SIMDPirates.vbroadcast(Vec{N,T}, s2), SIMDPirates.vbroadcast(Vec{N,T}, s3))
        end

        # scalar default already set in integer_arithmetic.jl
        # @inline function $rename(v1::Vec{N,T},
        #         v2::Vec{N,T}, v3::Vec{N,T}) where {N,T<:FloatingTypes}
        #     llvmwrap(Val{$(QuoteNode(op))}(), v1, v2, v3)
        # end
        # @inline function $rename(v1::AbstractSIMDVector{N,T},
        #         v2::AbstractSIMDVector{N,T}, v3::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes}
        #     SVec(llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2), extract_data(v3)))
        # end
        # @inline function Base.$op(v1::AbstractStructVec{N,T},
        #         v2::AbstractStructVec{N,T}, v3::AbstractStructVec{N,T}) where {N,T<:FloatingTypes}
        #     SVec(llvmwrap(Val{$(QuoteNode(op))}(), extract_data(v1), extract_data(v2), extract_data(v3)))
        # end
    end
end

# Type promotion



# Promote scalars of all ScalarTypes to vectors of FloatingTypes, leaving the
# vector type unchanged

for op ∈ (
        :(==), :(!=), :(<), :(<=), :(>), :(>=),
        :+, :-, :*, :/, :^,
        :copysign, :flipsign, :max, :min, :%
    )
    rename = VECTOR_SYMBOLS[op]
    @eval begin
        @vectordef $rename function Base.$op(s1::ScalarTypes, v2) where {N,T<:FloatingTypes}
            $rename(vbroadcast(Vec{N,T}, s1), extract_data(v2))
        end
        @vectordef $rename function Base.$op(v1, s2::ScalarTypes) where {N,T<:FloatingTypes}
            $rename(extract_data(v1), vbroadcast(Vec{N,T}, s2))
        end
        
        # @inline $rename(s1::ScalarTypes, v2::Vec{N,T}) where {N,T<:FloatingTypes} =
        #     $rename(vbroadcast(Vec{N,T}, s1), v2)
        # @inline $rename(v1::Vec{N,T}, s2::ScalarTypes) where {N,T<:FloatingTypes} =
        #     $rename(v1, vbroadcast(Vec{N,T}, s2))
    end
end
for op ∈ (
        :(+), :(-), :(*), :(/), :(%), :(^),
        :copysign#, :max, :min
    )
    # exact / explicit version
    erename = Symbol(:e, VECTOR_SYMBOLS[op])
    @eval begin

        @evectordef $erename function Base.$op(v1, s2::ScalarTypes) where {N,T <: FloatingTypes}
            $erename(extract_data(v1), vbroadcast(Vec{N,T}, s2))
        end
        @evectordef $erename function Base.$op(s1::ScalarTypes, v2) where {N,T <: FloatingTypes}
            $erename(vbroadcast(Vec{N,T}, s1), extract_data(v2))
        end
    end
end

# @vectordef vifelse function Base.ifelse(c::AbstractSIMDVector{N,Bool}, s1::ScalarTypes, v2) where {N,T<:FloatingTypes}
#     vifelse(extract_data(c), vbroadcast(Vec{N,T}, s1), extract_data(v2))
# end
# @vectordef vifelse function Base.ifelse(c::AbstractSIMDVector{N,Bool}, v1, s2::ScalarTypes) where {N,T<:FloatingTypes}
#     vifelse(extract_data(c), extract_data(v1), vbroadcast(Vec{N,T}, s2))
# end
# @inline function vifelse(c::VecOrProd{N,Bool}, s1::ScalarTypes, v2::VecOrProd{N,T}) where {N,T<:FloatingTypes}
#     vifelse(extract_data(c), vbroadcast(Vec{N,T}, s1), extract_data(v2))
# end
# @inline function vifelse(c::VecOrProd{N,Bool}, v1::VecOrProd{N,T}, s2::ScalarTypes) where {N,T<:FloatingTypes}
#     vifelse(extract_data(c), v1, vbroadcast(Vec{N,T}, extract_data(s2)))
# end
@inline function vifelse(c::AbstractSIMDVector{N,Bool}, s1::ScalarTypes, v2::AbstractSIMDVector{N,T}) where {N,T<:FloatingTypes}
    SVec(vifelse(extract_data(c), vbroadcast(Vec{N,T}, s1), extract_data(v2)))
end
@inline function vifelse(c::AbstractSIMDVector{N,Bool}, v1::AbstractSIMDVector{N,T}, s2::ScalarTypes) where {N,T<:FloatingTypes}
    SVec(vifelse(extract_data(c), extract_data(v1), vbroadcast(Vec{N,T}, s2)))
end
# @inline vifelse(c::Vec{N,Bool}, s1::ScalarTypes,
#         v2::Vec{N,T}) where {N,T<:FloatingTypes} =
#     vifelse(c, vbroadcast(Vec{N,T}, s1), v2)
# @inline vifelse(c::Vec{N,Bool}, v1::Vec{N,T},
#         s2::ScalarTypes) where {N,T<:FloatingTypes} =
# vifelse(c, v1, vbroadcast(Vec{N,T}, s2))

for op ∈ (:fma, :muladd)
# let op = :fma
    rename = VECTOR_SYMBOLS[op]
    @eval begin
        @vectordef $rename function Base.$op(s1::ScalarTypes, v2, v3) where {N,T}
            $rename(vbroadcast(Vec{N,T}, s1), extract_data(v2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(v1, s2::ScalarTypes, v3) where {N,T}
            $rename(extract_data(v1), vbroadcast(Vec{N,T}, s2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(v1, v2, s3::ScalarTypes) where {N,T}
            $rename(extract_data(v1), extract_data(v2), vbroadcast(Vec{N,T}, s3))
        end


        @vectordef $rename function Base.$op(s1::ScalarTypes, s2::ScalarTypes, v3) where {N,T}
            $rename(vbroadcast(Vec{N,T}, s1), vbroadcast(Vec{N,T}, s2), extract_data(v3))
        end
        @vectordef $rename function Base.$op(s1::ScalarTypes, v2, s3::ScalarTypes) where {N,T}
            $rename(vbroadcast(Vec{N,T}, s1), extract_data(v2), vbroadcast(Vec{N,T}, s3))
        end
        @vectordef $rename function Base.$op(v1, s2::ScalarTypes, s3::ScalarTypes) where {N,T}
            $rename(extract_data(v1), vbroadcast(Vec{N,T}, s2), vbroadcast(Vec{N,T}, s3))
        end
    end
end

for op ∈ (:fmadd, :fmsub, :fnmadd, :fnmsub)
    rename = VECTOR_SYMBOLS[op]
    @eval begin
        @vectordef $rename function $op(s1::ScalarTypes, v2, v3) where {N,T}
            $rename(vbroadcast(Vec{N,T}, s1), extract_data(v2), extract_data(v3))
        end
        @vectordef $rename function $op(v1, s2::ScalarTypes, v3) where {N,T}
            $rename(extract_data(v1), vbroadcast(Vec{N,T}, s2), extract_data(v3))
        end
        @vectordef $rename function $op(v1, v2, s3::ScalarTypes) where {N,T}
            $rename(extract_data(v1), extract_data(v2), vbroadcast(Vec{N,T}, s3))
        end


        @vectordef $rename function $op(s1::ScalarTypes, s2::ScalarTypes, v3) where {N,T}
            $rename(vbroadcast(Vec{N,T}, s1), vbroadcast(Vec{N,T}, s2), extract_data(v3))
        end
        @vectordef $rename function $op(s1::ScalarTypes, v2, s3::ScalarTypes) where {N,T}
            $rename(vbroadcast(Vec{N,T}, s1), extract_data(v2), vbroadcast(Vec{N,T}, s3))
        end
        @vectordef $rename function $op(v1, s2::ScalarTypes, s3::ScalarTypes) where {N,T}
            $rename(extract_data(v1), vbroadcast(Vec{N,T}, s2), vbroadcast(Vec{N,T}, s3))
        end
    end
end

# Reduction operations

# TODO: map, mapreduce

function getneutral(op::Symbol, ::Type{T}) where {T}
    if op == :&
        return ~zero(T)
    elseif op == :|
        return zero(T)
    elseif op == :max
        return typemin(T)
    elseif op == :min
        return typemax(T)
    elseif op == :+
        return zero(T)
    elseif op == :*
        return one(T)
    end
    throw("Op $op not recognized.")
end

# We cannot pass in the neutral element via Val{}; if we try, Julia refuses to
# inline this function, which is then disastrous for performance
@generated function llvmwrapreduce(::Val{Op}, v::Vec{N,T}) where {Op,N,T}
    @assert isa(Op, Symbol)
    z = getneutral(Op, T)
    typ = llvmtype(T)
    decls = String[]
    instrs = String[]
    n = N
    nam = "%0"
    nold,n = n, VectorizationBase.nextpow2(n)
    if n > nold
        namold,nam = nam,"%vec_$n"
        append!(instrs,
            extendvector(namold, nold, typ, n, n-nold,
                llvmtypedconst(T,z), nam))
    end
    while n > 1
        nold,n = n, div(n, 2)
        namold,nam = nam,"%vec_$n"
        vtyp = "<$n x $typ>"
        ins = llvmins(Op, n, T)
        append!(instrs, subvector(namold, nold, typ, "$(nam)_1", n, 0))
        append!(instrs, subvector(namold, nold, typ, "$(nam)_2", n, n))
        if ins[1] == '@'
            push!(decls, "declare $vtyp $ins($vtyp, $vtyp)")
            push!(instrs,
                "$nam = call $vtyp $ins($vtyp $(nam)_1, $vtyp $(nam)_2)")
        else
            push!(instrs, "$nam = $ins $vtyp $(nam)_1, $(nam)_2")
        end
    end
    push!(instrs, "%res = extractelement <$n x $typ> $nam, i32 0")
    push!(instrs, "ret $typ %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall(
            $((join(decls, "\n"), join(instrs, "\n"))),
            $T, Tuple{Vec{$N,$T}}, v
        )
    end
end

@static if Base.libllvm_version >= v"9.0.0"
@generated function vsum(v::Vec{N,T}) where {N,T<:Union{Float32,Float64}}
    decls = String[]
    instrs = String[]
    typ = llvmtype(T)
    vtyp = "<$N x $typ>"
    bits = 8sizeof(T)
    ins = "@llvm.experimental.vector.reduce.v2.fadd.f$(bits).v$(N)f$(bits)"
    push!(decls, "declare $(typ) $(ins)($(typ), $(vtyp))")
    push!(instrs, "%res = call fast $typ $ins($typ 0.0, $vtyp %0)")
    push!(instrs, "ret $typ %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall(
            $((join(decls, "\n"), join(instrs, "\n"))),
            $T, Tuple{Vec{$N,$T}}, v
        )
    end
end
    @generated function vsub(v::Vec{W,T}) where {W,T<:FloatingTypes}
        typ = llvmtype(T)
        vtyp = "<$W x $typ>"
        instrs = "%res = fneg fast $vtyp %0\nret $vtyp %res"
        quote
            $(Expr(:meta, :inline))
            Base.llvmcall( $instrs, Vec{$W,$T}, Tuple{Vec{$W,$T}}, v )
        end
    end
    Base.:(-)(v::SVec{W,T}) where {W,T} = SVec(vsub(extract_data(v)))
    vsub(v::SVec{W,T}) where {W,T} = SVec(vsub(extract_data(v)))
else
    rename = VECTOR_SYMBOLS[:-]
    @eval begin
        @vectordef $rename function Base.:(-)(v1) where {N,T<:FloatingTypes}
            llvmwrap(Val{:(-)}(), extract_data(v1))
        end
    end
end
vsub(x::FloatingTypes) = Base.FastMath.sub_fast(x)


for (name, rename, op) ∈ ((:(Base.all),:vall,:&), (:(Base.any),:vany,:|),
                                    (:(Base.maximum), :vmaximum, :max), (:(Base.minimum), :vminimum, :min),
                                    (:(Base.sum),:vsum,:+), (:(Base.prod),:vprod,:*))
    @eval begin
        @inline $rename(v::AbstractSIMDVector{N,T}) where {N,T} = llvmwrapreduce(Val{$(QuoteNode(op))}(), extract_data(v))
        @inline $name(v::AbstractStructVec{N,T}) where {N,T} = llvmwrapreduce(Val{$(QuoteNode(op))}(), extract_data(v))
    end
end

# @inline vall(v::Vec{N,T}) where {N,T<:IntegerTypes} = llvmwrapreduce(Val{:&}, v)
# @inline vany(v::Vec{N,T}) where {N,T<:IntegerTypes} = llvmwrapreduce(Val{:|}, v)
# @inline vmaximum(v::Vec{N,T}) where {N,T<:FloatingTypes} =
#     llvmwrapreduce(Val{:max}, v)
# @inline vminimum(v::Vec{N,T}) where {N,T<:FloatingTypes} =
#     llvmwrapreduce(Val{:min}, v)
# @inline vprod(v::Vec{N,T}) where {N,T} = llvmwrapreduce(Val{:*}, v)
# @inline vsum(v::Vec{N,T}) where {N,T} = llvmwrapreduce(Val{:+}, v)

@generated function vreduce(::Val{Op}, v::Vec{N,T}) where {Op,N,T}
    @assert isa(Op, Symbol)
    z = getneutral(Op, T)
    stmts = String[]
    n = N
    push!(stmts, :($(Symbol(:v,n)) = v))
    nold,n = n,nextpow2(n)
    if n > nold
        push!(stmts,
            :($(Symbol(:v,n)) = $(Expr(:tuple,
                [:($(Symbol(:v,nold))[$i]) for i in 1:nold]...,
                [:(VE($z)) for i in nold+1:n]...))))
    end
    while n > 1
        nold,n = n, div(n, 2)
        push!(stmts,
            :($(Symbol(:v,n,"lo")) = $(Expr(:tuple,
                [:($(Symbol(:v,nold))[$i]) for i in 1:n]...,))))
        push!(stmts,
            :($(Symbol(:v,n,"hi")) = $(Expr(:tuple,
                [:($(Symbol(:v,nold))[$i]) for i in n+1:nold]...))))
        push!(stmts,
            :($(Symbol(:v,n)) =
                $Op($(Symbol(:v,n,"lo")), $(Symbol(:v,n,"hi")))))
    end
    push!(stmts, :(v1[1].value))
    Expr(:block, Expr(:meta, :inline), stmts...)
end

@vectordef vmaximum function Base.maximum(v) where {N,T<:IntegerTypes}
    vreduce(Val{:max}, extract_data(v))
end
@vectordef vminimum function Base.minimum(v) where {N,T<:IntegerTypes}
    vreduce(Val{:min}, extract_data(v))
end

# @inline vmaximum(v::Vec{N,T}) where {N,T<:IntegerTypes} = vreduce(Val{:max}, v)
# @inline vminimum(v::Vec{N,T}) where {N,T<:IntegerTypes} = vreduce(Val{:min}, v)

# TODO: Handle cases with vectors of different lengths correctly!
@inline vmul(x, y) = Base.FastMath.mul_fast(x, y)
@inline vadd(x, y) = Base.FastMath.add_fast(x, y)
@inline vmul(x,y,z...) = vmul(x,vmul(y,z...))
@inline vadd(x,y,z...) = vadd(x,vadd(y,z...))
@inline vmuladd(a, b, c) = SIMDPirates.vadd(SIMDPirates.vmul( a, b), c)
@inline vfmadd(a, b, c) = SIMDPirates.vadd(SIMDPirates.vmul( a, b), c)
@inline vfnmadd(a, b, c) = SIMDPirates.vsub(c, SIMDPirates.vmul( a, b ))
@inline vfmsub(a, b, c) = SIMDPirates.vsub(SIMDPirates.vmul( a, b), c )
@inline vfnmsub(a, b, c) = SIMDPirates.vsub(SIMDPirates.vsub(c), SIMDPirates.vmul( a, b ) )

# Lowers to same split mul-add llvm as the 
# @inline vfmadd(a, b, c) = SIMDPirates.vadd(SIMDPirates.vmul( a, b), c)
# definition, so I wont bother implementing
# vfnmadd, vfmsub, and vfnmsub
# in this manner.
@generated function vfmadd(v1::Vec{W,T}, v2::Vec{W,T}, v3::Vec{W,T}) where {W,T<:FloatingTypes}
    typ = llvmtype(T)
    vtyp = "<$W x $typ>"
    ins = llvmins(:muladd, W, T)
    decls = "declare $vtyp $ins($vtyp, $vtyp, $vtyp)"
    instrs = "%res = call fast $vtyp $ins($vtyp %0, $vtyp %1, $vtyp %2)\nret $vtyp %res"
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall(
            $((decls,instrs)),
            Vec{$W,$T}, Tuple{Vec{$W,$T}, Vec{$W,$T}, Vec{$W,$T}},
            v1, v2, v3
        )
    end
end

@inline Base.:*(a::IntegerTypes, b::SVec{N,T}) where {N,T} = SVec{N,T}(a) * b
@generated function Base.:*(a::T, b::SVec{N,<:IntegerTypes}) where {N,T<:FloatingTypes}
    quote
        $(Expr(:meta,:inline))
        SVec{$N,$T}(a) * SVec{$N,$T}((Base.Cartesian.@ntuple $N n -> Core.VecElement{$T}(b[n])))
    end
end



@generated function rsqrt_fast(x::NTuple{16,Core.VecElement{Float32}})
    if VectorizationBase.REGISTER_SIZE == 64
        return quote
            $(Expr(:meta,:inline))
            Base.llvmcall(
            """ %rs = call <16 x float> asm "vrsqrt14ps \$1, \$0", "=x,x"(<16 x float> %0)
                ret <16 x float> %rs""",
            NTuple{16,Core.VecElement{Float32}}, Tuple{NTuple{16,Core.VecElement{Float32}}}, x)
        end
    else
        return quote
            vinv(vsqrt(x))
        end
    end
end
@inline function rsqrt(x::NTuple{16,Core.VecElement{Float32}})
    r = rsqrt_fast(x)
    # Performs a Newton step to increase accuracy.
    # ns = vmuladd(vmul(-0.5f0, x), vmul(r, r), 1.5f0)
    # vmul(r, ns)
    ns = vfma(vmul(r,r), x, -3.0f0)
    vmul(vmul(-0.5f0, r), ns)
end
@inline rsqrt_fast(x::AbstractStructVec) = SVec(rsqrt_fast(extract_data(x)))
@inline rsqrt(x::AbstractStructVec) = SVec(rsqrt(extract_data(x)))
@inline rsqrt_fast(x) = vinv(vsqrt(x))
@inline rsqrt(x) = vinv(vsqrt(x))
@inline vinv(x::IntegerTypes) = vinv(float(x))
@inline vinv(v::Vec{W,I}) where {W,I<:Union{UInt64,Int64}} = vinv(pirate_convert(Vec{W,Float64}, v))
@inline vinv(v::Vec{W,I}) where {W,I<:Union{UInt32,Int32}} = vinv(pirate_convert(Vec{W,Float32}, v))

for f ∈ (:vadd, :vsub, :vmul)
    @eval @generated function $f(v1::Vec{W1,T}, v2::Vec{W2,T}) where {W1,W2,T}
        if W1 > W2
            largerv = :v1
            littlev = :v2
            Ws, Wl = W2, W1
        else
            largerv = :v2
            littlev = :v1
            Ws, Wl = W1, W2
        end
        ret = Expr(:call, QuoteNode($f), :vse, :vb)
        quote
            $(Expr(:meta,:inline))
            vs = $littlev
            vb = $largerv
            # vse = $(Expr(:tuple,[Core.VecElement(zero(T)) for _ ∈ Ws+1:W2]...,[:(vs[$w]) for w ∈ 1:Ws]...))
            # vse = $(Expr(:tuple,[Core.VecElement(zero(T)) for _ ∈ Ws+1:W2]...,[:(vs[$(1 + Ws - w)]) for w ∈ 1:Ws]...))
            vse = $(Expr(:tuple,[:(vs[$w]) for w ∈ 1:Ws]...,[Core.VecElement(zero(T)) for _ ∈ Ws+1:W2]...))
            # vse = $(Expr(:tuple,[:(vs[$(1+Ws-w)]) for w ∈ 1:Ws]...,[Core.VecElement(zero(T)) for _ ∈ Ws+1:W2]...))
            # $f(vse, vb)
            $ret
        end
    end
    @eval @inline function $f(v1::AbstractSIMDVector{W1,T}, v2::AbstractSIMDVector{W2,T}) where {W1,W2,T}
        SVec(
            $f(extract_data(v1), extract_data(v2))
        )
    end
end

@inline Base.abs2(v::SVec) = vmul(v,v)
@inline vabs2(v) = vmul(v,v)
@inline vsum(s::FloatingTypes) = s
@inline vprod(s::FloatingTypes) = s

@inline reduced_add(v::Vec{W,T}, s::T) where {W,T} = Base.FastMath.add_fast(s, vsum(v))
@inline reduced_add(s::T, v::Vec{W,T}) where {W,T} = Base.FastMath.add_fast(s, vsum(v))
@inline reduced_add(v1::Vec{W,T}, v2::Vec{W,T}) where {W,T} = vadd(v1, v2)
@inline reduced_prod(v::Vec{W,T}, s::T) where {W,T} = Base.FastMath.mul_fast(s, vprod(v))
@inline reduced_prod(s::T, v::Vec{W,T}) where {W,T} = Base.FastMath.mul_fast(s, vprod(v))
@inline reduced_prod(v1::Vec{W,T}, v2::Vec{W,T}) where {W,T} = vmul(v1, v2)

