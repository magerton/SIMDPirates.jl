
# Type-dependent optimization flags
function fastflags(@nospecialize(T))
    if T <: IntTypes
        s = "nsw"
    elseif T <: UIntTypes
        s = "nuw"
    else#if T <: FloatingTypes
        s = "fast"
    end
    return s
end

function suffix(N::Int, @nospecialize(T))
    if T <: Ptr
        if T <: Ptr{<:IntegerTypes}
            t = "p0i"
        else#if T <: Ptr{<:FloatingTypes}
            t = "p0f"
        end
    elseif T <: IntegerTypes
        t = "i"
    else#if T <: FloatingTypes
        t = "f"
    end
    "v$(N)$(t)$(8sizeof(T))"
end


# Type-dependent LLVM constants
function llvmconst(T, val)
    T(val) === T(0) && return "zeroinitializer"
    typ = llvmtype(T)
    "$typ $val"
end
function llvmconst(::Type{Bool}, val)
    Bool(val) === false && return "zeroinitializer"
    typ = "i1"
    "$typ $(Int(val))"
end
function llvmconst(N::Integer, T, val)
    T(val) === T(0) && return "zeroinitializer"
    typ = llvmtype(T)
    "<" * join(["$typ $val" for i in 1:N], ", ") * ">"
end
function llvmconst(N::Integer, ::Type{Bool}, val)
    Bool(val) === false && return "zeroinitializer"
    typ = "i1"
    "<" * join(["$typ $(Int(val))" for i in 1:N], ", ") * ">"
end
function llvmtypedconst(T, val)
    typ = llvmtype(T)
    T(val) === T(0) && return "$typ zeroinitializer"
    "$typ $val"
end
function llvmtypedconst(::Type{Bool}, val)
    typ = "i1"
    Bool(val) === false && return "$typ zeroinitializer"
    "$typ $(Int(val))"
end

# Type-dependent LLVM intrinsics
const LLVM_INS_Integer = Dict{Symbol,String}()
const LLVM_INS_Int = Dict{Symbol,String}()
const LLVM_INS_UInt = Dict{Symbol,String}()
const LLVM_INS = Dict{Symbol,String}()
const LLVM_OVERLOADED_INS = Dict{Symbol,String}()



LLVM_INS_Integer[:+] = "add"
LLVM_INS_Integer[:-] = "sub"
LLVM_INS_Integer[:*] = "mul"
LLVM_INS_Int[:div] = "sdiv"
LLVM_INS_Int[:rem] = "srem"
LLVM_INS_UInt[:div] = "udiv"
LLVM_INS_UInt[:rem] = "urem"

LLVM_INS_Integer[:~] = "xor"
LLVM_INS_Integer[:&] = "and"
LLVM_INS_Integer[:|] = "or"
LLVM_INS_Integer[:⊻] = "xor"

LLVM_INS_Integer[:<<] = "shl"
LLVM_INS_Integer[:>>>] = "lshr"
LLVM_INS_UInt[:>>] = "lshr"
LLVM_INS_Int[:>>] = "ashr"

LLVM_INS_Integer[:(==)] = "icmp eq"
LLVM_INS_Integer[:(!=)] = "icmp ne"
LLVM_INS_Int[:(>)] = "icmp sgt"
LLVM_INS_Int[:(>=)] = "icmp sge"
LLVM_INS_Int[:(<)] = "icmp slt"
LLVM_INS_Int[:(<=)] = "icmp sle"
LLVM_INS_UInt[:(>)] = "icmp ugt"
LLVM_INS_UInt[:(>=)] = "icmp uge"
LLVM_INS_UInt[:(<)] = "icmp ult"
LLVM_INS_UInt[:(<=)] = "icmp ule"

LLVM_INS[:vifelse] = "select"

LLVM_INS[:+] = "fadd"
LLVM_INS[:-] = "fsub"
LLVM_INS[:*] = "fmul"
LLVM_INS[:/] = "fdiv"
LLVM_INS[:inv] = "fdiv"
LLVM_INS[:rem] = "frem"

LLVM_INS[:(==)] = "fcmp oeq"
LLVM_INS[:(!=)] = "fcmp une"
LLVM_INS[:(>)] = "fcmp ogt"
LLVM_INS[:(>=)] = "fcmp oge"
LLVM_INS[:(<)] = "fcmp olt"
LLVM_INS[:(<=)] = "fcmp ole"

LLVM_OVERLOADED_INS[:^] = "@llvm.pow."
LLVM_OVERLOADED_INS[:abs] = "@llvm.fabs."
LLVM_OVERLOADED_INS[:ceil] = "@llvm.ceil."
LLVM_OVERLOADED_INS[:copysign] = "@llvm.copysign."
LLVM_OVERLOADED_INS[:cos] = "@llvm.cos."
LLVM_OVERLOADED_INS[:exp] = "@llvm.exp."
LLVM_OVERLOADED_INS[:exp2] = "@llvm.exp2."
LLVM_OVERLOADED_INS[:floor] = "@llvm.floor."
LLVM_OVERLOADED_INS[:fma] = "@llvm.fma."
LLVM_OVERLOADED_INS[:log] = "@llvm.log."
LLVM_OVERLOADED_INS[:log10] = "@llvm.log10."
LLVM_OVERLOADED_INS[:log2] = "@llvm.log2."
LLVM_OVERLOADED_INS[:max] = "@llvm.maxnum."
LLVM_OVERLOADED_INS[:min] = "@llvm.minnum."
LLVM_OVERLOADED_INS[:muladd] = "@llvm.fmuladd."
LLVM_OVERLOADED_INS[:powi] = "@llvm.powi."
LLVM_OVERLOADED_INS[:round] = "@llvm.rint."
LLVM_OVERLOADED_INS[:sin] = "@llvm.sin."
LLVM_OVERLOADED_INS[:sqrt] =  "@llvm.sqrt."
LLVM_OVERLOADED_INS[:trunc] = "@llvm.trunc."

function llvmins(func::Symbol, N::Int, T)::String
    ins = get(LLVM_OVERLOADED_INS, func, nothing)
    ins === nothing || return ins * suffix(N, T)
    if T <: IntegerTypes
        d = T <: IntTypes ? LLVM_INS_Int : LLVM_INS_UInt
        return get(d, func) do
            LLVM_INS_Integer[func]
        end
    else
        return LLVM_INS[func]
    end
end


# Convert between LLVM scalars, vectors, and arrays

function scalar2vector(vec, siz, typ, sca)
    instrs = String[]
    accum(nam, i) = i<0 ? "undef" : i==siz-1 ? nam : "$(nam)_iter$i"
    for i in 0:siz-1
        push!(instrs,
            "$(accum(vec,i)) = " *
                "insertelement <$siz x $typ> $(accum(vec,i-1)), " *
                "$typ $sca, i32 $i")
    end
    instrs
end

function array2vector(vec, siz, typ, arr, tmp="$(arr)_av")
    instrs = String[]
    accum(nam, i) = i<0 ? "undef" : i==siz-1 ? nam : "$(nam)_iter$i"
    for i in 0:siz-1
        push!(instrs, "$(tmp)_elem$i = extractvalue [$siz x $typ] $arr, $i")
        push!(instrs,
            "$(accum(vec,i)) = " *
                "insertelement <$siz x $typ> $(accum(vec,i-1)), " *
                "$typ $(tmp)_elem$i, i32 $i")
    end
    instrs
end

function vector2array(arr, siz, typ, vec, tmp="$(vec)_va")
    instrs = String[]
    accum(nam, i) = i<0 ? "undef" : i==siz-1 ? nam : "$(nam)_iter$i"
    for i in 0:siz-1
        push!(instrs,
            "$(tmp)_elem$i = extractelement <$siz x $typ> $vec, i32 $i")
        push!(instrs,
            "$(accum(arr,i)) = "*
                "insertvalue [$siz x $typ] $(accum(arr,i-1)), " *
                "$typ $(tmp)_elem$i, $i")
    end
    instrs
end

# TODO: change argument order
function subvector(vec, siz, typ, rvec, rsiz, roff, tmp="$(rvec)_sv")
    instrs = String[]
    accum(nam, i) = i<0 ? "undef" : i==rsiz-1 ? nam : "$(nam)_iter$i"
    @assert 0 <= roff
    @assert roff + rsiz <= siz
    for i in 0:rsiz-1
        push!(instrs,
            "$(tmp)_elem$i = extractelement <$siz x $typ> $vec, i32 $(roff+i)")
        push!(instrs,
            "$(accum(rvec,i)) = " *
                "insertelement <$rsiz x $typ> $(accum(rvec,i-1)), " *
                "$typ $(tmp)_elem$i, i32 $i")
    end
    instrs
end

function extendvector(vec, siz, typ, voff, vsiz, val, rvec, tmp="$(rvec)_ev")
    instrs = String[]
    accum(nam, i) = i<0 ? "undef" : i==siz+vsiz-1 ? nam : "$(nam)_iter$i"
    rsiz = siz + vsiz
    for i in 0:siz-1
        push!(instrs,
            "$(tmp)_elem$i = extractelement <$siz x $typ> $vec, i32 $i")
        push!(instrs,
            "$(accum(rvec,i)) = " *
                "insertelement <$rsiz x $typ> $(accum(rvec,i-1)), " *
                "$typ $(tmp)_elem$i, i32 $i")
    end
    for i in siz:siz+vsiz-1
        push!(instrs,
            "$(accum(rvec,i)) = " *
                "insertelement <$rsiz x $typ> $(accum(rvec,i-1)), $val, i32 $i")
    end
    instrs
end

# Element-wise access

# export setindex
@generated function vsetindex(v::Vec{N,T}, x::Number, ::Type{Val{I}}) where {N,T,I}
    @assert isa(I, Integer)
    1 <= I <= N || throw(BoundsError())
    typ = llvmtype(T)
    ityp = llvmtype(Int)
    vtyp = "<$N x $typ>"
    decls = String[]
    instrs = String[]
    push!(instrs, "%res = insertelement $vtyp %0, $typ %1, $ityp $(I-1)")
    push!(instrs, "ret $vtyp %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            NTuple{N,VE{T}}, Tuple{NTuple{N,VE{T}}, T}, v.elts, T(x))
    end
end

@generated function vsetindex(v::Vec{N,T}, x::Number, i::Int) where {N,T}
    typ = llvmtype(T)
    ityp = llvmtype(Int)
    vtyp = "<$N x $typ>"
    decls = String[]
    instrs = String[]
    push!(instrs, "%res = insertelement $vtyp %0, $typ %2, $ityp %1")
    push!(instrs, "ret $vtyp %res")
    quote
        $(Expr(:meta, :inline))
        @boundscheck 1 <= i <= N || throw(BoundsError())
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            NTuple{N,VE{T}}, Tuple{NTuple{N,VE{T}}, Int, T},
            v.elts, i-1, T(x))
    end
end
setindex(v::Vec{N,T}, x::Number, i) where {N,T} = setindex(v, x, Int(i))
# Type conversion

@generated function pirate_reinterpret(::Type{Vec{N,R}},
        v1::Vec{N1,T1}) where {N,R,N1,T1}
    if N*sizeof(R) != N1*sizeof(T1)
        throw("N*sizeof(R) == N1*sizeof(T1) is not true; Trying to reinterpret to a size of $N * $(sizeof(R)) from a size of $N1 * $(sizeof(T1))")
    end
    # @assert N*sizeof(R) == N1*sizeof(T1)
    typ1 = llvmtype(T1)
    vtyp1 = "<$N1 x $typ1>"
    typr = R <: Ptr ? llvmtype(Int) : llvmtype(R)
    vtypr = "<$N x $typr>"
    decls = String[]
    instrs = String[]
    push!(instrs, "%res = bitcast $vtyp1 %0 to $vtypr")
    push!(instrs, "ret $vtypr %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            Vec{$N,$R}, Tuple{Vec{$N1,$T1}}, v1)
    end
end
@generated function pirate_reinterpret(::Type{Vec{N,R}},
        v1::Vec{N1,UInt128}) where {N,R,N1}
    T1 = UInt128
    @assert N*sizeof(R) == N1*sizeof(T1)
    typ1 = llvmtype(T1)
    vtyp1 = "[$N1 x $typ1]"
    typr = R <: Ptr ? llvmtype(Int) : llvmtype(R)
    vtypr = "<$N x $typr>"
    decls = String[]
    instrs = String[]
    push!(instrs, "%res = bitcast $vtyp1 %0 to $vtypr")
    push!(instrs, "ret $vtypr %res")
    quote
        $(Expr(:meta, :inline))
        Base.llvmcall($((join(decls, "\n"), join(instrs, "\n"))),
            Vec{$N,$R}, Tuple{Vec{$N1,$T1}}, v1)
    end
end
@inline function Base.reinterpret(::Type{SVec{N,R}}, v1::AbstractStructVec{N1,T1}) where {N,R,N1,T1}
    SVec(pirate_reinterpret(Vec{N,R}, extract_data(v1)))
end
@inline function Base.reinterpret(::Type{SVec{N,R}}, v1::AbstractStructVec{N1,UInt128}) where {N,R,N1}
    SVec(pirate_reinterpret(Vec{N,R}, extract_data(v1)))
end

const FASTOPS = Set((:+, :-, :*, :/, :log, :log2, :log10, :exp, :exp2, :exp10, :muladd, :fma, :sqrt, :pow, :sin, :cos, :inv))

const VECTOR_SYMBOLS = Dict{Symbol,Symbol}(
    :(==) => :visequal,
    :(!=) => :vnot_equal,
    :(<) => :vless,
    :(<=) => :vless_or_equal,
    :(>) => :vgreater,
    :(>=) => :vgreater_or_equal,
    :(<<) => :vleft_bitshift,
    :(>>) => :vright_bitshift,
    :(>>>) => :vuright_bitshift,
    :(&) => :vand,
    :(|) => :vor,
    :(⊻) => :vxor,
    :(+) => :vadd,
    :(-) => :vsub,
    :(*) => :vmul,
    :(/) => :vfdiv,
    :(÷) => :vidiv,
    :(%) => :vrem,
    :div => :vdiv,
    :rem => :vrem,
    :(~) => :vbitwise_not,
    :(!) => :vnot,
    :(^) => :vpow,
    :abs => :vabs,
    :floor => :vfloor,
    :ceil => :vceil,
    :round => :vround,
    :sin => :vsin,
    :cos => :vcos,
    :exp => :vexp,
    :exp2 => :vexp2,
    :exp10 => :vexp10,
    :inv => :vinv,
    :log => :vlog,
    :log10 => :vlog10,
    :log2 => :vlog2,
    :sqrt => :vsqrt,
    :trunc => :vtrunc,
    :sign => :vsign,
    :copysign => :vcopysign,
    :flipsign => :vflipsign,
    :max => :vmax,
    :min => :vmin,
    :fma => :vfma,
    :muladd => :vmuladd,
    :all => :vall,
    :any => :vany,
    :maximum => :vmaximum,
    :minimum => :vminimum,
    :prod => :vprod,
    :sum => :vsum,
    :reduce => :vreduce,
    :isfinite => :visfinite,
    :isinf => :visinf,
    :isnan => :visnan,
    :issubnormal => :vissubnormal,
    :fmadd => :vfmadd,
    :fmsub => :vfmsub,
    :fnmadd => :vfnmadd,
    :fnmsub => :vfnmsub
)
