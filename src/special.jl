

@generated function vexp(v::Vec{W,Float64}) where {W}
    decls = """
attributes #0 = { nounwind readnone speculatable }
declare <$(W) x double> @llvm.rint.v$(W)f64(<$(W) x double>) #0
declare <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double>, <$(W) x double>, <$(W) x double>) #0
"""
    const00 = join(("double 0x3FF71547652B82FE" for w ∈ 1:W), ", ")
    const01 = join(("double 0xBFE62E42FEFA3000" for w ∈ 1:W), ", ")
    const02 = join(("double 0xBD53DE6AF278ECE6" for w ∈ 1:W), ", ")
    const03 = join(("double 0x3FC555555555555C" for w ∈ 1:W), ", ")
    const04 = join(("double 5.000000e-01" for w ∈ 1:W), ", ")
    const05 = join(("double 0x3F8111111110EB39" for w ∈ 1:W), ", ")
    const06 = join(("double 0x3FA555555555553E" for w ∈ 1:W), ", ")
    const07 = join(("double 0x3F2A01A01B3603F5" for w ∈ 1:W), ", ")
    const08 = join(("double 0x3F56C16C16C20BA0" for w ∈ 1:W), ", ")
    const09 = join(("double 0x3EC71DDF1629E6CE" for w ∈ 1:W), ", ")
    const10 = join(("double 0x3EFA01A01780879E" for w ∈ 1:W), ", ")
    const11 = join(("double 0x3E5AF68A28CC800A" for w ∈ 1:W), ", ")
    const12 = join(("double 0x3E927E52E0FCD573" for w ∈ 1:W), ", ")
    const13 = join(("double 0x3E21F0E4C4ECD775" for w ∈ 1:W), ", ")
    const14 = join(("double 1.000000e+00" for w ∈ 1:W), ", ")
    const15 = join(("i64 4607182418800017408" for w ∈ 1:W), ", ")
    const16 = join(("i64 52" for w ∈ 1:W), ", ")
    const17 = join(("i64 4607182418800017408" for w ∈ 1:W), ", ")
    const18 = join(("double 0x40862E42FE102C83" for w ∈ 1:W), ", ")
    const19 = join(("double 0x7FF0000000000000" for w ∈ 1:W), ", ")
    const20 = join(("double 0xC0874910D52D3052" for w ∈ 1:W), ", ")
    const21 = join(("i64 1" for w ∈ 1:W), ", ")
    # const00 = join(("" for w ∈ 1:W), ", ")
    instr = """
  %res.i = fmul fast <$(W) x double> %0, <$const00>
  %res.i36 = call <$(W) x double> @llvm.rint.v$(W)f64(<$(W) x double> %res.i)
  %2 = fptosi <$(W) x double> %res.i36 to <$(W) x i64>
  %res.i35 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i36, <$(W) x double> <$const01>, <$(W) x double> %0)
  %res.i34 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i36, <$(W) x double> <$const02>, <$(W) x double> %res.i35)
  %res.i33 = fmul fast <$(W) x double> %res.i34, %res.i34
  %res.i32 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i34, <$(W) x double> <$const03>, <$(W) x double> <$const04>)
  %res.i31 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i34, <$(W) x double> <$const05>, <$(W) x double> <$const06>)
  %res.i30 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i34, <$(W) x double> <$const07>, <$(W) x double> <$const08>)
  %res.i29 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i34, <$(W) x double> <$const09>, <$(W) x double> <$const10>)
  %res.i28 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i34, <$(W) x double> <$const11>, <$(W) x double> <$const12>)
  %res.i27 = fmul fast <$(W) x double> %res.i33, %res.i33
  %res.i26 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i31, <$(W) x double> %res.i33, <$(W) x double> %res.i32)
  %res.i25 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i29, <$(W) x double> %res.i33, <$(W) x double> %res.i30)
  %res.i24 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i33, <$(W) x double> <$const13>, <$(W) x double> %res.i28)
  %res.i23 = fmul fast <$(W) x double> %res.i27, %res.i27
  %res.i22 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i25, <$(W) x double> %res.i27, <$(W) x double> %res.i26)
  %res.i21 = call <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %res.i24, <$(W) x double> %res.i23, <$(W) x double> %res.i22)
  %res.i19 = fmul fast <$(W) x double> %res.i33, %res.i21
  %res.i18 = fadd fast <$(W) x double> %res.i34, <$const14>
  %res.i17 = fadd fast <$(W) x double> %res.i18, %res.i19
  %3 = lshr <$(W) x i64> %2, <$const21>
  %res.i16 = shl <$(W) x i64> %3, <$const16>
  %tmp.i15 = add <$(W) x i64> %res.i16, <$const15>
  %res.i13 = bitcast <$(W) x i64> %tmp.i15 to <$(W) x double>
  %res.i12 = fmul <$(W) x double> %res.i17, %res.i13
  %res.i11 = sub nsw <$(W) x i64> %2, %3
  %res.i10 = shl <$(W) x i64> %res.i11, <$const16>
  %tmp.i = add <$(W) x i64> %res.i10, <$const17>
  %res.i8 = bitcast <$(W) x i64> %tmp.i to <$(W) x double>
  %res.i7 = fmul <$(W) x double> %res.i12, %res.i8
  %res.i5 = fcmp ogt <$(W) x double> %0, <$const18>
  %res.i4 = select <$(W) x i1> %res.i5, <$(W) x double> <$const19>, <$(W) x double> %res.i7
  %res.i2 = fcmp olt <$(W) x double> %0, <$const20>
  %res.i1 = select <$(W) x i1> %res.i2, <$(W) x double> zeroinitializer, <$(W) x double> %res.i4
  ret <$(W) x double> %res.i1
"""
    quote
        $(Expr(:meta,:inline))
        Base.llvmcall(
            ($decls, $instr),
            Vec{$W,Float64}, Tuple{Vec{$W,Float64}}, v
        )
    end
end
@inline vexp(v::SVec) = SVec(vexp(extract_data(v)))
@inline Base.exp(v::SVec) = SVec(vexp(extract_data(v)))
@inline vexp(x::Float64) = exp(x)

# @inline function vexp(v::Vec{8,Float64})
#     Base.llvmcall(("""
# attributes #0 = { nounwind readnone }
# attributes #1 = { nounwind readnone speculatable }
# declare <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double>, i32, <8 x double>, i8, i32) #0
# declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>) #1
# declare <8 x i32> @llvm.x86.avx512.mask.cvttpd2dq.512(<8 x double>, <8 x i32>, i8, i32) #0
# ""","""
#   %2 = fmul fast <8 x double> %0, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
#   %3 = tail call fast <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %2, i32 0, <8 x double> zeroinitializer, i8 -1, i32 4)
#   %4 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %3, <8 x double> <double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000>, <8 x double> %0) #1
#   %5 = fmul fast <8 x double> %3, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
#   %6 = fsub fast <8 x double> %4, %5
#   %7 = fmul fast <8 x double> %6, %6
#   %8 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> <double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0>, <8 x double> <double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1>) #1
#   %9 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> %8, <8 x double> <double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C>) #1
#   %10 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> %9, <8 x double> <double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93>) #1
#   %11 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> %10, <8 x double> <double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E>) #1
#   %12 = fsub fast <8 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %11
#   %13 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> %12, <8 x double> %6) #1
#   %14 = fmul fast <8 x double> %13, %6
#   %15 = fsub fast <8 x double> <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>, %13
#   %16 = fdiv fast <8 x double> %14, %15
#   %17 = fsub fast <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %5
#   %18 = fadd fast <8 x double> %17, %4
#   %19 = fadd fast <8 x double> %18, %16
#   %20 = fcmp fast ole <8 x double> %0, <double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2>
#   %21 = tail call <8 x i32> @llvm.x86.avx512.mask.cvttpd2dq.512(<8 x double> %3, <8 x i32> zeroinitializer, i8 -1, i32 4) #0
#   %22 = zext <8 x i32> %21 to <8 x i64>
#   %23 = shl <8 x i64> %22, <i64 52, i64 52, i64 52, i64 52, i64 52, i64 52, i64 52, i64 52>
#   %24 = add <8 x i64> %23, <i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408>
#   %25 = bitcast <8 x i64> %24 to <8 x double>
#   %26 = fmul fast <8 x double> %19, %25
#   %27 = select <8 x i1> %20, <8 x double> zeroinitializer, <8 x double> %26
#   %28 = fcmp fast oge <8 x double> %0, <double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF>
#   %29 = select <8 x i1> %28, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <8 x double> %27
#   ret <8 x double> %29
# """),
#         Vec{8,Float64}, Tuple{Vec{8,Float64}}, v
#     )
# end

@generated function vlog(v::Vec{W,Float64}) where {W}
    declr = """
attributes #0 = { nounwind readnone speculatable }
declare <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double>, <$(W) x double>, <$(W) x double>) #0
"""
    const00 = join(("i64 32" for w ∈ 1:W), ", ")
    const01 = join(("i64 614242" for w ∈ 1:W), ", ")
    const02 = join(("i64 20" for w ∈ 1:W), ", ")
    const03 = join(("i64 -1023" for w ∈ 1:W), ", ")
    const04 = join(("i64 4503595332403200" for w ∈ 1:W), ", ")
    const05 = join(("i64 4604544269498187776" for w ∈ 1:W), ", ")
    const06 = join(("i64 4294967295" for w ∈ 1:W), ", ")
    const07 = join(("double -1.000000e+00" for w ∈ 1:W), ", ")
    const08 = join(("double 5.000000e-01" for w ∈ 1:W), ", ")
    const09 = join(("double 1.000000e+00" for w ∈ 1:W), ", ")
    const10 = join(("double 0x3FC39A09D078C69F" for w ∈ 1:W), ", ")
    const11 = join(("double 0x3FCC71C51D8E78AF" for w ∈ 1:W), ", ")
    const12 = join(("double 0x3FD999999997FA04" for w ∈ 1:W), ", ")
    const13 = join(("double 0x3FC2F112DF3E5244" for w ∈ 1:W), ", ")
    const14 = join(("double 0x3FC7466496CB03DE" for w ∈ 1:W), ", ")
    const15 = join(("double 0x3FD2492494229359" for w ∈ 1:W), ", ")
    const16 = join(("double 0x3FE5555555555593" for w ∈ 1:W), ", ")
    const17 = join(("double 0x3DEA39EF35793C76" for w ∈ 1:W), ", ")
    const18 = join(("double 0x3FE62E42FEE00000" for w ∈ 1:W), ", ")
    const19 = join(("double 0xFFF0000000000000" for w ∈ 1:W), ", ")
    const20 = join(("double 0xFFFFFFFFFFFFFFFF" for w ∈ 1:W), ", ")
    # const21 = join(("" for w ∈ 1:W), ", ")
    # const22 = join(("" for w ∈ 1:W), ", ")
    instr = """
  %2 = bitcast <$(W) x double> %0 to <$(W) x i64>
  %3 = lshr <$(W) x i64> %2, <$const00>
  %4 = fcmp fast one <$(W) x double> %0, zeroinitializer
  %5 = add nuw nsw <$(W) x i64> %3, <$const01>
  %6 = lshr <$(W) x i64> %5, <$const02>
  %7 = add nsw <$(W) x i64> %6, <$const03>
  %8 = sitofp <$(W) x i64> %7 to <$(W) x double>
  %9 = shl <$(W) x i64> %5, <$const00>
  %10 = and <$(W) x i64> %9, <$const04>
  %11 = add nuw nsw <$(W) x i64> %10, <$const05>
  %12 = and <$(W) x i64> %2, <$const06>
  %13 = or <$(W) x i64> %11, %12
  %14 = bitcast <$(W) x i64> %13 to <$(W) x double>
  %15 = fadd fast <$(W) x double> %14, <$const07>
  %16 = fmul fast <$(W) x double> %15, %15
  %17 = fmul fast <$(W) x double> %16, <$const08>
  %18 = fadd fast <$(W) x double> %14, <$const09>
  %19 = fdiv fast <$(W) x double> %15, %18
  %20 = fmul fast <$(W) x double> %19, %19
  %21 = fmul fast <$(W) x double> %20, %20
  %22 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %21, <$(W) x double> <$const10>, <$(W) x double> <$const11>) #0
  %23 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %21, <$(W) x double> %22, <$(W) x double> <$const12>) #0
  %24 = fmul fast <$(W) x double> %23, %21
  %25 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %21, <$(W) x double> <$const13>, <$(W) x double> <$const14>) #0
  %26 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %21, <$(W) x double> %25, <$(W) x double> <$const15>) #0
  %27 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %21, <$(W) x double> %26, <$(W) x double> <$const16>) #0
  %28 = fmul fast <$(W) x double> %27, %20
  %29 = fadd fast <$(W) x double> %24, %17
  %30 = fadd fast <$(W) x double> %29, %28
  %31 = fmul fast <$(W) x double> %8, <$const17>
  %32 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %19, <$(W) x double> %30, <$(W) x double> %31) #0
  %33 = fsub fast <$(W) x double> %15, %17
  %34 = fadd fast <$(W) x double> %33, %32
  %35 = tail call fast <$(W) x double> @llvm.fmuladd.v$(W)f64(<$(W) x double> %8, <$(W) x double> <$const18>, <$(W) x double> %34) #0
  %36 = select <$(W) x i1> %4, <$(W) x double> %35, <$(W) x double> <$const19>
  %37 = fcmp fast oge <$(W) x double> %0, zeroinitializer
  %38 = bitcast <$(W) x i1> %37 to i$(W)
  %39 = xor i$(W) %38, -1
  %40 = bitcast i$(W) %39 to <$(W) x i1>
  %41 = select <$(W) x i1> %40, <$(W) x double> <$const20>, <$(W) x double> %36
  ret <$(W) x double> %41
"""
    quote
        $(Expr(:meta,:inline))
        Base.llvmcall(($declr,$instr), Vec{$W,Float64}, Tuple{Vec{$W,Float64}}, v)
    end
end
@inline vlog(v::SVec) = SVec(vlog(extract_data(v)))
@inline Base.log(v::SVec) = SVec(vlog(extract_data(v)))
@inline vlog(x::Float64) = log(x)


@inline function verf(v::Vec{8,Float64})
    Base.llvmcall(
        ("""
attributes #0 = { nounwind readnone speculatable }
attributes #1 = { nounwind readnone }
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>) #0
declare <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double>, i32, <8 x double>, i8, i32) #1
declare <8 x i32> @llvm.x86.avx512.mask.cvttpd2dq.512(<8 x double>, <8 x i32>, i8, i32) #0
""","""
  %2 = bitcast <8 x double> %0 to <8 x i64>
  %3 = and <8 x i64> %2, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
  %4 = bitcast <8 x i64> %3 to <8 x double>
  %5 = fmul fast <8 x double> %4, %4
  %6 = bitcast <8 x double> %5 to <8 x i64>
  %7 = fcmp fast olt <8 x double> %4, <double 6.500000e-01, double 6.500000e-01, double 6.500000e-01, double 6.500000e-01, double 6.500000e-01, double 6.500000e-01, double 6.500000e-01, double 6.500000e-01>
  %8 = bitcast <8 x i1> %7 to i8
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %22, label %10

; 10:                                               ; preds = %1
  %11 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> <double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332>, <8 x double> <double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A>) #0
  %12 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> %11, <8 x double> <double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C>) #0
  %13 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> %12, <8 x double> <double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5>) #0
  %14 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> %13, <8 x double> <double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61>) #0
  %15 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> <double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252>, <8 x double> <double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1>) #0
  %16 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> %15, <8 x double> <double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F>) #0
  %17 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> %16, <8 x double> <double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867>) #0
  %18 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %5, <8 x double> %17, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #0
  %19 = fmul fast <8 x double> %14, %0
  %20 = fdiv fast <8 x double> %19, %18
  %21 = icmp eq i8 %8, -1
  br i1 %21, label %107, label %22

; 22:                                               ; preds = %10, %1
  %23 = phi <8 x double> [ %20, %10 ], [ zeroinitializer, %1 ]
  %24 = fcmp fast olt <8 x double> %4, <double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00>
  %25 = bitcast <8 x i1> %24 to i8
  %26 = xor i8 %8, -1
  %27 = and i8 %26, %25
  %28 = xor <8 x i64> %6, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %29 = bitcast <8 x i64> %28 to <8 x double>
  %30 = fmul fast <8 x double> %29, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
  %31 = tail call fast <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %30, i32 0, <8 x double> zeroinitializer, i8 -1, i32 4)
  %32 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %31, <8 x double> <double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000, double 0xBFE62E42FEE00000>, <8 x double> %29) #0
  %33 = fmul fast <8 x double> %31, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
  %34 = fsub fast <8 x double> %32, %33
  %35 = fmul fast <8 x double> %34, %34
  %36 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %35, <8 x double> <double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0>, <8 x double> <double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1>) #0
  %37 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %35, <8 x double> %36, <8 x double> <double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C>) #0
  %38 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %35, <8 x double> %37, <8 x double> <double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93>) #0
  %39 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %35, <8 x double> %38, <8 x double> <double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E>) #0
  %40 = fsub fast <8 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %39
  %41 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %35, <8 x double> %40, <8 x double> %34) #0
  %42 = fmul fast <8 x double> %41, %34
  %43 = fsub fast <8 x double> <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>, %41
  %44 = fdiv fast <8 x double> %42, %43
  %45 = fsub fast <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %33
  %46 = fadd fast <8 x double> %45, %32
  %47 = fadd fast <8 x double> %46, %44
  %48 = fcmp fast ole <8 x double> %29, <double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2>
  %49 = tail call <8 x i32> @llvm.x86.avx512.mask.cvttpd2dq.512(<8 x double> %31, <8 x i32> zeroinitializer, i8 -1, i32 4) #0
  %50 = zext <8 x i32> %49 to <8 x i64>
  %51 = shl <8 x i64> %50, <i64 52, i64 52, i64 52, i64 52, i64 52, i64 52, i64 52, i64 52>
  %52 = add <8 x i64> %51, <i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408>
  %53 = bitcast <8 x i64> %52 to <8 x double>
  %54 = fmul fast <8 x double> %47, %53
  %55 = select <8 x i1> %48, <8 x double> zeroinitializer, <8 x double> %54
  %56 = fcmp fast oge <8 x double> %29, <double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF>
  %57 = select <8 x i1> %56, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <8 x double> %55
  %58 = icmp eq i8 %27, 0
  br i1 %58, label %84, label %59

; 59:                                               ; preds = %22
  %60 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> zeroinitializer, <8 x double> <double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4>) #0
  %61 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %60, <8 x double> <double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5>) #0
  %62 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %61, <8 x double> <double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F>) #0
  %63 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %62, <8 x double> <double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B>) #0
  %64 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %63, <8 x double> <double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60>) #0
  %65 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %64, <8 x double> <double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B>) #0
  %66 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> <double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00>, <8 x double> <double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE>) #0
  %67 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %66, <8 x double> <double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772>) #0
  %68 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %67, <8 x double> <double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C>) #0
  %69 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %68, <8 x double> <double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD>) #0
  %70 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %69, <8 x double> <double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708>) #0
  %71 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %70, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #0
  %72 = fmul fast <8 x double> %57, %65
  %73 = fdiv fast <8 x double> %72, %71
  %74 = fsub fast <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %73
  %75 = bitcast <8 x double> %74 to <8 x i64>
  %76 = fcmp fast olt <8 x double> %0, zeroinitializer
  %77 = xor <8 x i64> %75, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %78 = bitcast <8 x i64> %77 to <8 x double>
  %79 = select <8 x i1> %76, <8 x double> %78, <8 x double> %74
  %80 = select <8 x i1> %7, <8 x double> %23, <8 x double> %79
  %81 = or <8 x i1> %24, %7
  %82 = bitcast <8 x i1> %81 to i8
  %83 = icmp eq i8 %82, -1
  br i1 %83, label %107, label %84

; 84:                                               ; preds = %59, %22
  %85 = phi <8 x double> [ %80, %59 ], [ %23, %22 ]
  %86 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> zeroinitializer, <8 x double> <double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92>) #0
  %87 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %86, <8 x double> <double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43>) #0
  %88 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %87, <8 x double> <double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94>) #0
  %89 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %88, <8 x double> <double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE>) #0
  %90 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %89, <8 x double> <double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5>) #0
  %91 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %90, <8 x double> <double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2>) #0
  %92 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> <double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843>, <8 x double> <double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837>) #0
  %93 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %92, <8 x double> <double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F>) #0
  %94 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %93, <8 x double> <double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91>) #0
  %95 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %94, <8 x double> <double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F>) #0
  %96 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %95, <8 x double> <double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6>) #0
  %97 = tail call fast <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %96, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #0
  %98 = fmul fast <8 x double> %57, %91
  %99 = fdiv fast <8 x double> %98, %97
  %100 = fsub fast <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %99
  %101 = bitcast <8 x double> %100 to <8 x i64>
  %102 = fcmp fast olt <8 x double> %0, zeroinitializer
  %103 = xor <8 x i64> %101, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %104 = bitcast <8 x i64> %103 to <8 x double>
  %105 = select <8 x i1> %102, <8 x double> %104, <8 x double> %100
  %106 = select <8 x i1> %24, <8 x double> %85, <8 x double> %105
  br label %107

; 107:                                              ; preds = %10, %59, %84
  %108 = phi <8 x double> [ %20, %10 ], [ %106, %84 ], [ %80, %59 ]
  ret <8 x double> %108
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end

@inline function verf(v::Vec{4,Float64})
    Base.llvmcall(("""
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind readnone speculatable }
declare <4 x double> @llvm.fma.v4f64(<4 x double>, <4 x double>, <4 x double>) #8
declare i32 @llvm.x86.avx.vtestz.pd.256(<4 x double>, <4 x double>) #7
declare i32 @llvm.x86.avx.vtestc.pd.256(<4 x double>, <4 x double>) #7
declare <4 x double> @llvm.x86.avx.round.pd.256(<4 x double>, i32) #7
declare <4 x i32> @llvm.x86.avx.cvtt.pd2dq.256(<4 x double>) #7
""","""
  %2 = bitcast <4 x double> %0 to <4 x i64>
  %3 = and <4 x i64> %2, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
  %4 = bitcast <4 x i64> %3 to <4 x double>
  %5 = fmul fast <4 x double> %4, %4
  %6 = bitcast <4 x double> %5 to <4 x i64>
  %7 = fcmp fast olt <4 x double> %4, <double 6.500000e-01, double 6.500000e-01, double 6.500000e-01, double 6.500000e-01>
  %8 = sext <4 x i1> %7 to <4 x i64>
  %9 = bitcast <4 x i64> %8 to <4 x double>
  %10 = tail call i32 @llvm.x86.avx.vtestz.pd.256(<4 x double> %9, <4 x double> %9) #16
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %25

; 12:                                               ; preds = %1
  %13 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> <double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332, double 0x3F110512D5B20332>, <4 x double> <double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A, double 0x3F53B7664358865A>) #16
  %14 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> %13, <4 x double> <double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C>) #16
  %15 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> %14, <4 x double> <double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5>) #16
  %16 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> %15, <4 x double> <double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61, double 0x3FF20DD750429B61>) #16
  %17 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> <double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252, double 0x3F37EA4332348252>, <4 x double> <double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1>) #16
  %18 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> %17, <4 x double> <double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F>) #16
  %19 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> %18, <4 x double> <double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867>) #16
  %20 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %5, <4 x double> %19, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #16
  %21 = fmul fast <4 x double> %16, %0
  %22 = fdiv fast <4 x double> %21, %20
  %23 = tail call i32 @llvm.x86.avx.vtestc.pd.256(<4 x double> %9, <4 x double> <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>) #16
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %115

; 25:                                               ; preds = %12, %1
  %26 = phi <4 x double> [ %22, %12 ], [ zeroinitializer, %1 ]
  %27 = fcmp fast olt <4 x double> %4, <double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00>
  %28 = xor <4 x i1> %7, <i1 true, i1 true, i1 true, i1 true>
  %29 = and <4 x i1> %27, %28
  %30 = sext <4 x i1> %29 to <4 x i64>
  %31 = bitcast <4 x i64> %30 to <4 x double>
  %32 = xor <4 x i64> %6, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %33 = bitcast <4 x i64> %32 to <4 x double>
  %34 = fmul fast <4 x double> %33, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
  %35 = tail call fast <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %34, i32 0)
  %36 = fsub fast <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %35
  %37 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %36, <4 x double> <double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000>, <4 x double> %33) #16
  %38 = fmul fast <4 x double> %35, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
  %39 = fsub fast <4 x double> %37, %38
  %40 = fmul fast <4 x double> %39, %39
  %41 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %40, <4 x double> <double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0>, <4 x double> <double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1>) #16
  %42 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %40, <4 x double> %41, <4 x double> <double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C>) #16
  %43 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %40, <4 x double> %42, <4 x double> <double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93>) #16
  %44 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %40, <4 x double> %43, <4 x double> <double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E, double 0x3FC555555555553E>) #16
  %45 = fsub fast <4 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, %40
  %46 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %45, <4 x double> %44, <4 x double> %39) #16
  %47 = fmul fast <4 x double> %46, %39
  %48 = fsub fast <4 x double> <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>, %46
  %49 = fdiv fast <4 x double> %47, %48
  %50 = fsub fast <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %38
  %51 = fadd fast <4 x double> %50, %37
  %52 = fadd fast <4 x double> %51, %49
  %53 = fcmp fast ole <4 x double> %33, <double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2>
  %54 = tail call <4 x i32> @llvm.x86.avx.cvtt.pd2dq.256(<4 x double> %35) #16
  %55 = zext <4 x i32> %54 to <4 x i64>
  %56 = shl <4 x i64> %55, <i64 52, i64 52, i64 52, i64 52>
  %57 = add <4 x i64> %56, <i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408>
  %58 = bitcast <4 x i64> %57 to <4 x double>
  %59 = fmul fast <4 x double> %52, %58
  %60 = select <4 x i1> %53, <4 x double> zeroinitializer, <4 x double> %59
  %61 = fcmp fast oge <4 x double> %33, <double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF>
  %62 = select <4 x i1> %61, <4 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <4 x double> %60
  %63 = tail call i32 @llvm.x86.avx.vtestz.pd.256(<4 x double> %31, <4 x double> %31) #16
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %92

; 65:                                               ; preds = %25
  %66 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> zeroinitializer, <4 x double> <double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4>) #16
  %67 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %66, <4 x double> <double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5>) #16
  %68 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %67, <4 x double> <double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F>) #16
  %69 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %68, <4 x double> <double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B, double 0x3FEC1986509E687B>) #16
  %70 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %69, <4 x double> <double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60>) #16
  %71 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %70, <4 x double> <double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B>) #16
  %72 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> <double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00, double 0x3F89A996639B0D00>, <4 x double> <double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE>) #16
  %73 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %72, <4 x double> <double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772, double 0x3FE307622FCFF772>) #16
  %74 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %73, <4 x double> <double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C>) #16
  %75 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %74, <4 x double> <double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD>) #16
  %76 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %75, <4 x double> <double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708>) #16
  %77 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %76, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #16
  %78 = fmul fast <4 x double> %62, %71
  %79 = fdiv fast <4 x double> %78, %77
  %80 = fsub fast <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %79
  %81 = bitcast <4 x double> %80 to <4 x i64>
  %82 = fcmp fast olt <4 x double> %0, zeroinitializer
  %83 = xor <4 x i64> %81, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %84 = bitcast <4 x i64> %83 to <4 x double>
  %85 = select <4 x i1> %82, <4 x double> %84, <4 x double> %80
  %86 = select <4 x i1> %7, <4 x double> %26, <4 x double> %85
  %87 = or <4 x i1> %27, %7
  %88 = sext <4 x i1> %87 to <4 x i64>
  %89 = bitcast <4 x i64> %88 to <4 x double>
  %90 = tail call i32 @llvm.x86.avx.vtestc.pd.256(<4 x double> %89, <4 x double> <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>) #16
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %115

; 92:                                               ; preds = %65, %25
  %93 = phi <4 x double> [ %86, %65 ], [ %26, %25 ]
  %94 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> zeroinitializer, <4 x double> <double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92>) #16
  %95 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %94, <4 x double> <double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43>) #16
  %96 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %95, <4 x double> <double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94>) #16
  %97 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %96, <4 x double> <double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE, double 0x3FF44744306832AE>) #16
  %98 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %97, <4 x double> <double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5>) #16
  %99 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %98, <4 x double> <double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2>) #16
  %100 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> <double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843>, <4 x double> <double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837>) #16
  %101 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %100, <4 x double> <double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F>) #16
  %102 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %101, <4 x double> <double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91>) #16
  %103 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %102, <4 x double> <double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F, double 0x400AFD487397568F>) #16
  %104 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %103, <4 x double> <double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6>) #16
  %105 = tail call fast <4 x double> @llvm.fma.v4f64(<4 x double> %4, <4 x double> %104, <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #16
  %106 = fmul fast <4 x double> %62, %99
  %107 = fdiv fast <4 x double> %106, %105
  %108 = fsub fast <4 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %107
  %109 = bitcast <4 x double> %108 to <4 x i64>
  %110 = fcmp fast olt <4 x double> %0, zeroinitializer
  %111 = xor <4 x i64> %109, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %112 = bitcast <4 x i64> %111 to <4 x double>
  %113 = select <4 x i1> %110, <4 x double> %112, <4 x double> %108
  %114 = select <4 x i1> %27, <4 x double> %93, <4 x double> %113
  br label %115

; 115:                                              ; preds = %12, %65, %92
  %116 = phi <4 x double> [ %22, %12 ], [ %114, %92 ], [ %86, %65 ]
  ret <4 x double> %116
"""), Vec{4,Float64}, Tuple{Vec{4,Float64}}, v)
end

@inline function verf(v::Vec{2,Float64})
    Base.llvmcall(("""
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind readnone speculatable }
declare <2 x double> @llvm.fma.v2f64(<2 x double>, <2 x double>, <2 x double>) #8
declare <2 x double> @llvm.x86.sse41.round.pd(<2 x double>, i32) #7
declare <4 x i32> @llvm.x86.sse2.cvttpd2dq(<2 x double>) #7
""","""
  %2 = bitcast <2 x double> %0 to <2 x i64>
  %3 = and <2 x i64> %2, <i64 9223372036854775807, i64 9223372036854775807>
  %4 = bitcast <2 x i64> %3 to <2 x double>
  %5 = fmul fast <2 x double> %4, %4
  %6 = bitcast <2 x double> %5 to <2 x i64>
  %7 = fcmp fast olt <2 x double> %4, <double 6.500000e-01, double 6.500000e-01>
  %8 = sext <2 x i1> %7 to <2 x i64>
  %9 = bitcast <2 x i1> %7 to i2
  %10 = icmp eq i2 %9, 0
  br i1 %10, label %23, label %11

; 11:                                               ; preds = %1
  %12 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> <double 0x3F110512D5B20332, double 0x3F110512D5B20332>, <2 x double> <double 0x3F53B7664358865A, double 0x3F53B7664358865A>) #16
  %13 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> %12, <2 x double> <double 0x3FA4A59A4F02579C, double 0x3FA4A59A4F02579C>) #16
  %14 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> %13, <2 x double> <double 0x3FC16500F106C0A5, double 0x3FC16500F106C0A5>) #16
  %15 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> %14, <2 x double> <double 0x3FF20DD750429B61, double 0x3FF20DD750429B61>) #16
  %16 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> <double 0x3F37EA4332348252, double 0x3F37EA4332348252>, <2 x double> <double 0x3F8166F75999DBD1, double 0x3F8166F75999DBD1>) #16
  %17 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> %16, <2 x double> <double 0x3FB64536CA92EA2F, double 0x3FB64536CA92EA2F>) #16
  %18 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> %17, <2 x double> <double 0x3FDD0A84EB1CA867, double 0x3FDD0A84EB1CA867>) #16
  %19 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %5, <2 x double> %18, <2 x double> <double 1.000000e+00, double 1.000000e+00>) #16
  %20 = fmul fast <2 x double> %15, %0
  %21 = fdiv fast <2 x double> %20, %19
  %22 = icmp eq i2 %9, -1
  br i1 %22, label %118, label %23

; 23:                                               ; preds = %11, %1
  %24 = phi <2 x double> [ %21, %11 ], [ zeroinitializer, %1 ]
  %25 = fcmp fast olt <2 x double> %4, <double 2.200000e+00, double 2.200000e+00>
  %26 = bitcast <2 x i64> %8 to <4 x i32>
  %27 = icmp eq <4 x i32> %26, zeroinitializer
  %28 = sext <4 x i1> %27 to <4 x i32>
  %29 = bitcast <4 x i32> %28 to <2 x i64>
  %30 = select <2 x i1> %25, <2 x i64> %29, <2 x i64> zeroinitializer
  %31 = xor <2 x i64> %6, <i64 -9223372036854775808, i64 -9223372036854775808>
  %32 = bitcast <2 x i64> %31 to <2 x double>
  %33 = fmul fast <2 x double> %32, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
  %34 = tail call fast <2 x double> @llvm.x86.sse41.round.pd(<2 x double> %33, i32 0)
  %35 = fsub fast <2 x double> <double -0.000000e+00, double -0.000000e+00>, %34
  %36 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %35, <2 x double> <double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000>, <2 x double> %32) #16
  %37 = fmul fast <2 x double> %34, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
  %38 = fsub fast <2 x double> %36, %37
  %39 = fmul fast <2 x double> %38, %38
  %40 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %39, <2 x double> <double 0x3E66376972BEA4D0, double 0x3E66376972BEA4D0>, <2 x double> <double 0xBEBBBD41C5D26BF1, double 0xBEBBBD41C5D26BF1>) #16
  %41 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %39, <2 x double> %40, <2 x double> <double 0x3F11566AAF25DE2C, double 0x3F11566AAF25DE2C>) #16
  %42 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %39, <2 x double> %41, <2 x double> <double 0xBF66C16C16BEBD93, double 0xBF66C16C16BEBD93>) #16
  %43 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %39, <2 x double> %42, <2 x double> <double 0x3FC555555555553E, double 0x3FC555555555553E>) #16
  %44 = fsub fast <2 x double> <double -0.000000e+00, double -0.000000e+00>, %39
  %45 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %44, <2 x double> %43, <2 x double> %38) #16
  %46 = fmul fast <2 x double> %45, %38
  %47 = fsub fast <2 x double> <double 2.000000e+00, double 2.000000e+00>, %45
  %48 = fdiv fast <2 x double> %46, %47
  %49 = fsub fast <2 x double> <double 1.000000e+00, double 1.000000e+00>, %37
  %50 = fadd fast <2 x double> %49, %36
  %51 = fadd fast <2 x double> %50, %48
  %52 = fcmp fast ole <2 x double> %32, <double 0xC086232BDD7ABCD2, double 0xC086232BDD7ABCD2>
  %53 = tail call <4 x i32> @llvm.x86.sse2.cvttpd2dq(<2 x double> %34) #16
  %54 = bitcast <4 x i32> %53 to <2 x i64>
  %55 = ashr <2 x i64> %54, <i64 63, i64 63>
  %56 = bitcast <2 x i64> %55 to <4 x i32>
  %57 = shufflevector <4 x i32> %53, <4 x i32> %56, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %58 = bitcast <4 x i32> %57 to <2 x i64>
  %59 = shl <2 x i64> %58, <i64 52, i64 52>
  %60 = add <2 x i64> %59, <i64 4607182418800017408, i64 4607182418800017408>
  %61 = bitcast <2 x i64> %60 to <2 x double>
  %62 = fmul fast <2 x double> %51, %61
  %63 = select <2 x i1> %52, <2 x double> zeroinitializer, <2 x double> %62
  %64 = fcmp fast oge <2 x double> %32, <double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF>
  %65 = select <2 x i1> %64, <2 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000>, <2 x double> %63
  %66 = icmp slt <2 x i64> %30, zeroinitializer
  %67 = bitcast <2 x i1> %66 to i2
  %68 = icmp eq i2 %67, 0
  br i1 %68, label %95, label %69

; 69:                                               ; preds = %23
  %70 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> zeroinitializer, <2 x double> <double 0x3F7CF4CFE0AACBB4, double 0x3F7CF4CFE0AACBB4>) #16
  %71 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %70, <2 x double> <double 0x3FB2488A6B5CB5E5, double 0x3FB2488A6B5CB5E5>) #16
  %72 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %71, <2 x double> <double 0x3FD53DD7A67C7E9F, double 0x3FD53DD7A67C7E9F>) #16
  %73 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %72, <2 x double> <double 0x3FEC1986509E687B, double 0x3FEC1986509E687B>) #16
  %74 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %73, <2 x double> <double 0x3FF54DFE9B258A60, double 0x3FF54DFE9B258A60>) #16
  %75 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %74, <2 x double> <double 0x3FEFFFFFFBBB552B, double 0x3FEFFFFFFBBB552B>) #16
  %76 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> <double 0x3F89A996639B0D00, double 0x3F89A996639B0D00>, <2 x double> <double 0x3FC033C113A7DEEE, double 0x3FC033C113A7DEEE>) #16
  %77 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %76, <2 x double> <double 0x3FE307622FCFF772, double 0x3FE307622FCFF772>) #16
  %78 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %77, <2 x double> <double 0x3FF9E677C2777C3C, double 0x3FF9E677C2777C3C>) #16
  %79 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %78, <2 x double> <double 0x40053B1052DCA8BD, double 0x40053B1052DCA8BD>) #16
  %80 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %79, <2 x double> <double 0x4003ADEAE79B9708, double 0x4003ADEAE79B9708>) #16
  %81 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %80, <2 x double> <double 1.000000e+00, double 1.000000e+00>) #16
  %82 = fmul fast <2 x double> %65, %75
  %83 = fdiv fast <2 x double> %82, %81
  %84 = fsub fast <2 x double> <double 1.000000e+00, double 1.000000e+00>, %83
  %85 = bitcast <2 x double> %84 to <2 x i64>
  %86 = fcmp fast olt <2 x double> %0, zeroinitializer
  %87 = xor <2 x i64> %85, <i64 -9223372036854775808, i64 -9223372036854775808>
  %88 = select <2 x i1> %86, <2 x i64> %87, <2 x i64> %85
  %89 = bitcast <2 x i64> %88 to <2 x double>
  %90 = select <2 x i1> %7, <2 x double> %24, <2 x double> %89
  %91 = or <2 x i64> %30, %8
  %92 = icmp slt <2 x i64> %91, zeroinitializer
  %93 = bitcast <2 x i1> %92 to i2
  %94 = icmp eq i2 %93, -1
  br i1 %94, label %118, label %95

; 95:                                               ; preds = %69, %23
  %96 = phi <2 x double> [ %90, %69 ], [ %24, %23 ]
  %97 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> zeroinitializer, <2 x double> <double 0x3F971D0907EA7A92, double 0x3F971D0907EA7A92>) #16
  %98 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %97, <2 x double> <double 0x3FC42210F88B9D43, double 0x3FC42210F88B9D43>) #16
  %99 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %98, <2 x double> <double 0x3FE29BE1CFF90D94, double 0x3FE29BE1CFF90D94>) #16
  %100 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %99, <2 x double> <double 0x3FF44744306832AE, double 0x3FF44744306832AE>) #16
  %101 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %100, <2 x double> <double 0x3FF9FA202DEB88E5, double 0x3FF9FA202DEB88E5>) #16
  %102 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %101, <2 x double> <double 0x3FEFFF5A9E697AE2, double 0x3FEFFF5A9E697AE2>) #16
  %103 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> <double 0x3FA47BD61BBB3843, double 0x3FA47BD61BBB3843>, <2 x double> <double 0x3FD1D7AB774BB837, double 0x3FD1D7AB774BB837>) #16
  %104 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %103, <2 x double> <double 0x3FF0CFD4CB6CDE9F, double 0x3FF0CFD4CB6CDE9F>) #16
  %105 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %104, <2 x double> <double 0x400315FFDFD5CE91, double 0x400315FFDFD5CE91>) #16
  %106 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %105, <2 x double> <double 0x400AFD487397568F, double 0x400AFD487397568F>) #16
  %107 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %106, <2 x double> <double 0x400602F24BF3FDB6, double 0x400602F24BF3FDB6>) #16
  %108 = tail call fast <2 x double> @llvm.fma.v2f64(<2 x double> %4, <2 x double> %107, <2 x double> <double 1.000000e+00, double 1.000000e+00>) #16
  %109 = fmul fast <2 x double> %65, %102
  %110 = fdiv fast <2 x double> %109, %108
  %111 = fsub fast <2 x double> <double 1.000000e+00, double 1.000000e+00>, %110
  %112 = bitcast <2 x double> %111 to <2 x i64>
  %113 = fcmp fast olt <2 x double> %0, zeroinitializer
  %114 = xor <2 x i64> %112, <i64 -9223372036854775808, i64 -9223372036854775808>
  %115 = select <2 x i1> %113, <2 x i64> %114, <2 x i64> %112
  %116 = bitcast <2 x i64> %115 to <2 x double>
  %117 = select <2 x i1> %25, <2 x double> %96, <2 x double> %116
  br label %118

; 118:                                              ; preds = %11, %69, %95
  %119 = phi <2 x double> [ %21, %11 ], [ %117, %95 ], [ %90, %69 ]
  ret <2 x double> %119
"""), Vec{2,Float64}, Tuple{Vec{2,Float64}}, v)
end

@inline verf(v::SVec) = SVec(verf(extract_data(v)))
# @inline SpecialFunctions.erf(v::SVec) = SVec(verf(extract_data(v)))

function bn(n)
    sum(0:n) do k
        sum(0:k) do v
            (isodd(v) ? -1 : 1) * (v+1)^n * binomial(k,v)
        end / (k+1)
    end
end
coef(n) = bn(n+1)/((n+1)*n)
coefb(n) = Float64(coef(big(n)))
const HLN2PI = Float64(log(big(2)π)/2)
const LGAMMA_COEF = ntuple(i -> coefb(31 - 2i), Val(15))
lng(z) = (z-0.5)*log(z) - z + HLN2PI + 1/(12z) - 1/(360z^3) + 1/(1260z^5) - 0.0005952380952380953/z^7 + 0.0008417508417508417 / z^9 - 0.0019175269175269176 / z^11


@inline function loggamma_fast(z::Vec{W,Float64}) where {W}
    logz = vlog(z)
    zp1 = vadd(z, vbroadcast(Vec{W,Float64}, 1.0))
    logzp1 = vlog(zp1)
    lg = vsub(vfmsub(vadd(z, vbroadcast(Vec{W,Float64}, 0.5)), logzp1, logz), zp1)
    invz = vinv(zp1)
    invz² = vmul(invz, invz)
    s_0 = vmuladd(LGAMMA_COEF[1], invz², LGAMMA_COEF[2])
    Base.Cartesian.@nexprs 13 i -> begin
        @inbounds s_i = vmuladd(s_{i-1}, invz², LGAMMA_COEF[i+2])
    end
    vadd(vmuladd(s_13, invz, HLN2PI), lg)
end
@inline function loggamma_core(z::Vec{W,Float64}) where {W}
    logz = vlog(z)
    lg = vfmsub(vsub(z, vbroadcast(Vec{W,Float64}, 0.5)), logz, z)
    invz = vinv(z)
    invz² = vmul(invz, invz)
    s_0 = vmuladd(LGAMMA_COEF[1], invz², LGAMMA_COEF[2])
    Base.Cartesian.@nexprs 13 i -> begin
        @inbounds s_i = vmuladd(s_{i-1}, invz², LGAMMA_COEF[i+2])
    end
    vmuladd(s_13, invz, vadd(HLN2PI, lg))
end

"""
This is a fairly bad (slow, unoptimized, not all that accurate) implementation, but I wanted to have something.
"""
@inline function loggamma(z::Vec{W,Float64}) where {W}
    i = Base.unsafe_trunc(Int, SIMDPirates.vminimum(z))
    min_val = 4
    incr = Base.FastMath.max_fast(min_val - i, 0)
    zincr = vadd(z, vbroadcast(Vec{W,Float64}, Float64(incr)))
    lg = loggamma_core(zincr)
    vone = vbroadcast(Vec{W,Float64}, 1.0)
    for _ ∈ i:min_val - 1
        zincr = vsub(zincr, vone)
        lg = vsub(lg, vlog(zincr))
    end
    lg
end

@inline loggamma(v::SVec) = SVec(loggamma(extract_data(v)))

# @inline function loggamma_fastfast(z::Vec{W,Float64}) where {W}
#     zp1 = vadd(z, vbroadcast(Vec{W,Float64}, 1.0))
#     vsub(loggamma_fastfastfast(zp1), vlog(z))
# end
# @inline function loggamma_fast(z::Vec{W,Float64}) where {W}
#     zp1 = vadd(z, vbroadcast(Vec{W,Float64}, 1.0))
#     vsub(loggamma_fastfast(zp1), vlog(z))
# end
# @inline function loggamma(z::Vec{W,Float64}) where {W}
#     zp1 = vadd(z, vbroadcast(Vec{W,Float64}, 1.0))
#     vsub(loggamma_fast(zp1), vlog(z))
# end



# @inline function lgamma(v::Vec{8,Float64})
#     Base.llvmcall(("""
# attributes #1 = { argmemonly nounwind }
# attributes #3 = { nounwind readnone }
# attributes #4 = { nounwind readnone speculatable }
# declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1
# declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1
# declare <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double>, i32, <8 x double>, i8, i32) #3
# declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>) #4
# $xsimdlgamma = comdat any
# define <8 x double> @xsimdlgamma(i8* dereferenceable(1)) {
#   %2 = alloca <8 x double>, align 64
#   %3 = bitcast i8* %0 to <8 x double>*
#   %4 = load <8 x double>, <8 x double>* %3, align 64, !tbaa !3
#   %5 = fcmp fast ole <8 x double> %4, zeroinitializer
#   %6 = tail call fast <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %4, i32 3, <8 x double> zeroinitializer, i8 -1, i32 4)
#   %7 = fsub fast <8 x double> %4, %6
#   %8 = fcmp fast oeq <8 x double> %7, zeroinitializer
#   %9 = and <8 x i1> %8, %5
#   %10 = bitcast <8 x double> %4 to <8 x i64>
#   %11 = bitcast <8 x double>* %2 to i8*
#   call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %11) #5
#   %12 = and <8 x i64> %10, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
#   %13 = bitcast <8 x i64> %12 to <8 x double>
#   %14 = select <8 x i1> %9, <8 x double> <double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF>, <8 x double> %13
#   %15 = getelementptr inbounds <8 x double>, <8 x double>* %2, i64 0, i32 0, i32 0, i32 0
#   store <8 x double> %14, <8 x double>* %15, align 64
#   %16 = fcmp fast olt <8 x double> %4, <double -3.400000e+01, double -3.400000e+01, double -3.400000e+01, double -3.400000e+01, double -3.400000e+01, double -3.400000e+01, double -3.400000e+01, double -3.400000e+01>
#   %17 = bitcast <8 x i1> %16 to i8
#   %18 = icmp eq i8 %17, 0
#   br i1 %18, label %118, label %19

# ; 19:                                               ; preds = %1
#   %20 = bitcast <8 x double>* %2 to i8*
#   %21 = call fast <8 x double> @xsimdlgamma(i8* nonnull dereferenceable(1) %20)
#   %22 = load <8 x double>, <8 x double>* %15, align 64, !tbaa !3
#   %23 = call fast <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %22, i32 1, <8 x double> %22, i8 -1, i32 4) #5
#   %24 = fsub fast <8 x double> %22, %23
#   %25 = fcmp fast olt <8 x double> %24, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
#   %26 = fadd fast <8 x double> %24, <double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00>
#   %27 = select <8 x i1> %25, <8 x double> %26, <8 x double> %24
#   %28 = bitcast <8 x double> %27 to <8 x i64>
#   %29 = and <8 x i64> %28, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
#   %30 = bitcast <8 x i64> %29 to <8 x double>
#   %31 = fmul fast <8 x double> %30, <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>
#   %32 = call fast <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %31, i32 0, <8 x double> zeroinitializer, i8 -1, i32 4)
#   %33 = fmul fast <8 x double> %32, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
#   %34 = fsub fast <8 x double> %30, %33
#   %35 = fmul fast <8 x double> %34, <double 0x400921FB54442D18, double 0x400921FB54442D18, double 0x400921FB54442D18, double 0x400921FB54442D18, double 0x400921FB54442D18, double 0x400921FB54442D18, double 0x400921FB54442D18, double 0x400921FB54442D18>
#   %36 = fmul fast <8 x double> %32, <double 2.500000e-01, double 2.500000e-01, double 2.500000e-01, double 2.500000e-01, double 2.500000e-01, double 2.500000e-01, double 2.500000e-01, double 2.500000e-01>
#   %37 = call fast <8 x double> @llvm.x86.avx512.mask.rndscale.pd.512(<8 x double> %36, i32 1, <8 x double> %36, i8 -1, i32 4) #5
#   %38 = fsub fast <8 x double> %36, %37
#   %39 = fmul fast <8 x double> %38, <double 4.000000e+00, double 4.000000e+00, double 4.000000e+00, double 4.000000e+00, double 4.000000e+00, double 4.000000e+00, double 4.000000e+00, double 4.000000e+00>
#   %40 = fcmp fast oge <8 x double> %39, <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>
#   %41 = select <8 x i1> %40, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, <8 x double> zeroinitializer
#   %42 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %41, <8 x double> <double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00>, <8 x double> %39) #5
#   %43 = and <8 x i64> %28, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
#   %44 = select <8 x i1> %40, <8 x double> <double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00, double -0.000000e+00>, <8 x double> zeroinitializer
#   %45 = bitcast <8 x double> %44 to <8 x i64>
#   %46 = xor <8 x i64> %43, %45
#   %47 = fmul fast <8 x double> %35, %35
#   %48 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> <double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1, double 0x3DE5D8FD1FCF0EC1>, <8 x double> <double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691, double 0xBE5AE5E5A9291691>) #5
#   %49 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %48, <8 x double> <double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896, double 0x3EC71DE3567D4896>) #5
#   %50 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %49, <8 x double> <double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03, double 0xBF2A01A019BFDF03>) #5
#   %51 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %50, <8 x double> <double 0x3F8111111110F7D0, double 0x3F8111111110F7D0, double 0x3F8111111110F7D0, double 0x3F8111111110F7D0, double 0x3F8111111110F7D0, double 0x3F8111111110F7D0, double 0x3F8111111110F7D0, double 0x3F8111111110F7D0>) #5
#   %52 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %51, <8 x double> <double 0xBFC5555555555548, double 0xBFC5555555555548, double 0xBFC5555555555548, double 0xBFC5555555555548, double 0xBFC5555555555548, double 0xBFC5555555555548, double 0xBFC5555555555548, double 0xBFC5555555555548>) #5
#   %53 = fmul fast <8 x double> %52, %47
#   %54 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %53, <8 x double> %35, <8 x double> %35) #5
#   %55 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> <double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219, double 0x3DA8FF831AD9B219>, <8 x double> <double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4, double 0xBE21EEA7C1E514D4>) #5
#   %56 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %55, <8 x double> <double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5, double 0x3E927E4F8E06D9A5>) #5
#   %57 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %56, <8 x double> <double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9, double 0xBEFA01A019DDBCD9>) #5
#   %58 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %57, <8 x double> <double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47, double 0x3F56C16C16C15D47>) #5
#   %59 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %58, <8 x double> <double 0xBFA5555555555551, double 0xBFA5555555555551, double 0xBFA5555555555551, double 0xBFA5555555555551, double 0xBFA5555555555551, double 0xBFA5555555555551, double 0xBFA5555555555551, double 0xBFA5555555555551>) #5
#   %60 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %47, <8 x double> %59, <8 x double> <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>) #5
#   %61 = fmul fast <8 x double> %60, %47
#   %62 = fsub fast <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %61
#   %63 = fcmp fast oeq <8 x double> %42, zeroinitializer
#   %64 = select <8 x i1> %63, <8 x double> %54, <8 x double> %62
#   %65 = bitcast <8 x double> %64 to <8 x i64>
#   %66 = xor <8 x i64> %46, %65
#   %67 = bitcast <8 x i64> %66 to <8 x double>
#   %68 = fmul fast <8 x double> %22, %67
#   %69 = bitcast <8 x double> %68 to <8 x i64>
#   %70 = and <8 x i64> %69, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
#   %71 = bitcast <8 x i64> %70 to <8 x double>
#   %72 = lshr <8 x i64> %70, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
#   %73 = fcmp fast one <8 x double> %71, zeroinitializer
#   %74 = add nuw nsw <8 x i64> %72, <i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242>
#   %75 = lshr <8 x i64> %74, <i64 20, i64 20, i64 20, i64 20, i64 20, i64 20, i64 20, i64 20>
#   %76 = add nsw <8 x i64> %75, <i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023>
#   %77 = sitofp <8 x i64> %76 to <8 x double>
#   %78 = shl nuw <8 x i64> %74, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
#   %79 = and <8 x i64> %78, <i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200>
#   %80 = add nuw nsw <8 x i64> %79, <i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776>
#   %81 = and <8 x i64> %69, <i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295>
#   %82 = or <8 x i64> %80, %81
#   %83 = bitcast <8 x i64> %82 to <8 x double>
#   %84 = fadd fast <8 x double> %83, <double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00>
#   %85 = fmul fast <8 x double> %84, %84
#   %86 = fmul fast <8 x double> %85, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
#   %87 = fadd fast <8 x double> %83, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
#   %88 = fdiv fast <8 x double> %84, %87
#   %89 = fmul fast <8 x double> %88, %88
#   %90 = fmul fast <8 x double> %89, %89
#   %91 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %90, <8 x double> <double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F>, <8 x double> <double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF>) #5
#   %92 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %90, <8 x double> %91, <8 x double> <double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04>) #5
#   %93 = fmul fast <8 x double> %92, %90
#   %94 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %90, <8 x double> <double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244>, <8 x double> <double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE>) #5
#   %95 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %90, <8 x double> %94, <8 x double> <double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359>) #5
#   %96 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %90, <8 x double> %95, <8 x double> <double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593>) #5
#   %97 = fmul fast <8 x double> %96, %89
#   %98 = fadd fast <8 x double> %93, %86
#   %99 = fadd fast <8 x double> %98, %97
#   %100 = fmul fast <8 x double> %77, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
#   %101 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %88, <8 x double> %99, <8 x double> %100) #5
#   %102 = fsub fast <8 x double> %84, %86
#   %103 = fadd fast <8 x double> %102, %101
#   %104 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %77, <8 x double> <double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000>, <8 x double> %103) #5
#   %105 = fcmp fast oge <8 x double> %71, zeroinitializer
#   %106 = bitcast <8 x i1> %105 to i8
#   %107 = xor i8 %106, -1
#   %108 = bitcast i8 %107 to <8 x i1>
#   %109 = fsub fast <8 x double> <double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD, double 0x3FF250D048E7A1BD>, %104
#   %110 = select <8 x i1> %73, <8 x double> %109, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>
#   %111 = select <8 x i1> %108, <8 x double> <double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF, double 0x7FFFFFFFFFFFFFFF>, <8 x double> %110
#   %112 = fsub fast <8 x double> %111, %21
#   %113 = icmp eq i8 %17, -1
#   br i1 %113, label %116, label %114

# ; 114:                                              ; preds = %19
#   %115 = load <8 x double>, <8 x double>* %3, align 64
#   br label %118

# ; 116:                                              ; preds = %19
#   %117 = select <8 x i1> %9, <8 x double> <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>, <8 x double> %112
#   br label %290

# ; 118:                                              ; preds = %114, %1
#   %119 = phi <8 x double> [ %115, %114 ], [ %4, %1 ]
#   %120 = phi <8 x double> [ %112, %114 ], [ <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>, %1 ]
#   %121 = fcmp fast olt <8 x double> %119, <double 1.300000e+01, double 1.300000e+01, double 1.300000e+01, double 1.300000e+01, double 1.300000e+01, double 1.300000e+01, double 1.300000e+01, double 1.300000e+01>
#   %122 = bitcast <8 x i1> %121 to i8
#   %123 = icmp eq i8 %122, 0
#   br i1 %123, label %230, label %124

# ; 124:                                              ; preds = %118
#   %125 = select <8 x i1> %121, <8 x double> %119, <8 x double> zeroinitializer
#   %126 = fcmp oge <8 x double> %125, <double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00>
#   %127 = bitcast <8 x i1> %126 to i8
#   %128 = icmp eq i8 %127, 0
#   br i1 %128, label %131, label %139

# ; 129:                                              ; preds = %139
#   %130 = bitcast <8 x double> %149 to <8 x i64>
#   br label %131

# ; 131:                                              ; preds = %129, %124
#   %132 = phi <8 x double> [ %147, %129 ], [ %125, %124 ]
#   %133 = phi <8 x double> [ %145, %129 ], [ zeroinitializer, %124 ]
#   %134 = phi <8 x double> [ %149, %129 ], [ <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %124 ]
#   %135 = phi <8 x i64> [ %130, %129 ], [ <i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408, i64 4607182418800017408>, %124 ]
#   %136 = fcmp olt <8 x double> %132, <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>
#   %137 = bitcast <8 x i1> %136 to i8
#   %138 = icmp eq i8 %137, 0
#   br i1 %138, label %169, label %153

# ; 139:                                              ; preds = %124, %139
#   %140 = phi <8 x i1> [ %150, %139 ], [ %126, %124 ]
#   %141 = phi <8 x double> [ %149, %139 ], [ <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %124 ]
#   %142 = phi <8 x double> [ %145, %139 ], [ zeroinitializer, %124 ]
#   %143 = phi <8 x double> [ %147, %139 ], [ %125, %124 ]
#   %144 = fadd fast <8 x double> %142, <double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00>
#   %145 = select <8 x i1> %140, <8 x double> %144, <8 x double> %142
#   %146 = fadd fast <8 x double> %144, %119
#   %147 = select <8 x i1> %140, <8 x double> %146, <8 x double> %143
#   %148 = fmul fast <8 x double> %146, %141
#   %149 = select <8 x i1> %140, <8 x double> %148, <8 x double> %141
#   %150 = fcmp oge <8 x double> %147, <double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00, double 3.000000e+00>
#   %151 = bitcast <8 x i1> %150 to i8
#   %152 = icmp eq i8 %151, 0
#   br i1 %152, label %129, label %139

# ; 153:                                              ; preds = %131, %153
#   %154 = phi <8 x i1> [ %164, %153 ], [ %136, %131 ]
#   %155 = phi <8 x double> [ %159, %153 ], [ %134, %131 ]
#   %156 = phi <8 x double> [ %161, %153 ], [ %133, %131 ]
#   %157 = phi <8 x double> [ %163, %153 ], [ %132, %131 ]
#   %158 = fdiv fast <8 x double> %155, %157
#   %159 = select <8 x i1> %154, <8 x double> %158, <8 x double> %155
#   %160 = fadd fast <8 x double> %156, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
#   %161 = select <8 x i1> %154, <8 x double> %160, <8 x double> %156
#   %162 = fadd fast <8 x double> %160, %119
#   %163 = select <8 x i1> %154, <8 x double> %162, <8 x double> %157
#   %164 = fcmp olt <8 x double> %163, <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>
#   %165 = bitcast <8 x i1> %164 to i8
#   %166 = icmp eq i8 %165, 0
#   br i1 %166, label %167, label %153

# ; 167:                                              ; preds = %153
#   %168 = bitcast <8 x double> %159 to <8 x i64>
#   br label %169

# ; 169:                                              ; preds = %167, %131
#   %170 = phi <8 x double> [ %161, %167 ], [ %133, %131 ]
#   %171 = phi <8 x i64> [ %168, %167 ], [ %135, %131 ]
#   %172 = and <8 x i64> %171, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
#   %173 = bitcast <8 x i64> %172 to <8 x double>
#   %174 = fadd fast <8 x double> %119, <double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00, double -2.000000e+00>
#   %175 = fadd fast <8 x double> %174, %170
#   %176 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> <double 0xC09589018FF36761, double 0xC09589018FF36761, double 0xC09589018FF36761, double 0xC09589018FF36761, double 0xC09589018FF36761, double 0xC09589018FF36761, double 0xC09589018FF36761, double 0xC09589018FF36761>, <8 x double> <double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E, double 0xC0E2F234355BB93E>) #5
#   %177 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %176, <8 x double> <double 0xC1143D73F89089E5, double 0xC1143D73F89089E5, double 0xC1143D73F89089E5, double 0xC1143D73F89089E5, double 0xC1143D73F89089E5, double 0xC1143D73F89089E5, double 0xC1143D73F89089E5, double 0xC1143D73F89089E5>) #5
#   %178 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %177, <8 x double> <double 0xC131BC82F994DB51, double 0xC131BC82F994DB51, double 0xC131BC82F994DB51, double 0xC131BC82F994DB51, double 0xC131BC82F994DB51, double 0xC131BC82F994DB51, double 0xC131BC82F994DB51, double 0xC131BC82F994DB51>) #5
#   %179 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %178, <8 x double> <double 0xC13A45890219F20B, double 0xC13A45890219F20B, double 0xC13A45890219F20B, double 0xC13A45890219F20B, double 0xC13A45890219F20B, double 0xC13A45890219F20B, double 0xC13A45890219F20B, double 0xC13A45890219F20B>) #5
#   %180 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %179, <8 x double> <double 0xC12A0C675418055E, double 0xC12A0C675418055E, double 0xC12A0C675418055E, double 0xC12A0C675418055E, double 0xC12A0C675418055E, double 0xC12A0C675418055E, double 0xC12A0C675418055E, double 0xC12A0C675418055E>) #5
#   %181 = fadd fast <8 x double> %175, <double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2, double 0xC075FD0D1CF312B2>
#   %182 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %181, <8 x double> <double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757, double 0xC0D0AA0D7B89D757>) #5
#   %183 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %182, <8 x double> <double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B, double 0xC10AEB84B9744C9B>) #5
#   %184 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %183, <8 x double> <double 0xC131628671950043, double 0xC131628671950043, double 0xC131628671950043, double 0xC131628671950043, double 0xC131628671950043, double 0xC131628671950043, double 0xC131628671950043, double 0xC131628671950043>) #5
#   %185 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %184, <8 x double> <double 0xC1435255892FF34C, double 0xC1435255892FF34C, double 0xC1435255892FF34C, double 0xC1435255892FF34C, double 0xC1435255892FF34C, double 0xC1435255892FF34C, double 0xC1435255892FF34C, double 0xC1435255892FF34C>) #5
#   %186 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %175, <8 x double> %185, <8 x double> <double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A, double 0xC13ECE4B6A11E14A>) #5
#   %187 = fmul fast <8 x double> %180, %175
#   %188 = fdiv fast <8 x double> %187, %186
#   %189 = lshr <8 x i64> %172, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
#   %190 = fcmp fast one <8 x double> %173, zeroinitializer
#   %191 = add nuw nsw <8 x i64> %189, <i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242>
#   %192 = lshr <8 x i64> %191, <i64 20, i64 20, i64 20, i64 20, i64 20, i64 20, i64 20, i64 20>
#   %193 = add nsw <8 x i64> %192, <i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023>
#   %194 = sitofp <8 x i64> %193 to <8 x double>
#   %195 = shl nuw <8 x i64> %191, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
#   %196 = and <8 x i64> %195, <i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200>
#   %197 = add nuw nsw <8 x i64> %196, <i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776>
#   %198 = and <8 x i64> %171, <i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295>
#   %199 = or <8 x i64> %197, %198
#   %200 = bitcast <8 x i64> %199 to <8 x double>
#   %201 = fadd fast <8 x double> %200, <double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00>
#   %202 = fmul fast <8 x double> %201, %201
#   %203 = fmul fast <8 x double> %202, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
#   %204 = fadd fast <8 x double> %200, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
#   %205 = fdiv fast <8 x double> %201, %204
#   %206 = fmul fast <8 x double> %205, %205
#   %207 = fmul fast <8 x double> %206, %206
#   %208 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %207, <8 x double> <double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F>, <8 x double> <double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF>) #5
#   %209 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %207, <8 x double> %208, <8 x double> <double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04>) #5
#   %210 = fmul fast <8 x double> %209, %207
#   %211 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %207, <8 x double> <double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244>, <8 x double> <double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE>) #5
#   %212 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %207, <8 x double> %211, <8 x double> <double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359>) #5
#   %213 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %207, <8 x double> %212, <8 x double> <double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593>) #5
#   %214 = fmul fast <8 x double> %213, %206
#   %215 = fadd fast <8 x double> %210, %203
#   %216 = fadd fast <8 x double> %215, %214
#   %217 = fmul fast <8 x double> %194, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
#   %218 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %205, <8 x double> %216, <8 x double> %217) #5
#   %219 = fsub fast <8 x double> %201, %203
#   %220 = fadd fast <8 x double> %219, %218
#   %221 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %194, <8 x double> <double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000>, <8 x double> %220) #5
#   %222 = select <8 x i1> %190, <8 x double> %221, <8 x double> <double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000>
#   %223 = fcmp fast oge <8 x double> %173, zeroinitializer
#   %224 = bitcast <8 x i1> %223 to i8
#   %225 = xor i8 %224, -1
#   %226 = bitcast i8 %225 to <8 x i1>
#   %227 = select <8 x i1> %226, <8 x double> <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>, <8 x double> %222
#   %228 = fadd fast <8 x double> %227, %188
#   %229 = icmp eq i8 %122, -1
#   br i1 %229, label %284, label %230

# ; 230:                                              ; preds = %169, %118
#   %231 = phi <8 x double> [ %228, %169 ], [ zeroinitializer, %118 ]
#   %232 = fadd fast <8 x double> %119, <double -5.000000e-01, double -5.000000e-01, double -5.000000e-01, double -5.000000e-01, double -5.000000e-01, double -5.000000e-01, double -5.000000e-01, double -5.000000e-01>
#   %233 = bitcast <8 x double> %119 to <8 x i64>
#   %234 = lshr <8 x i64> %233, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
#   %235 = fcmp fast one <8 x double> %119, zeroinitializer
#   %236 = add nuw nsw <8 x i64> %234, <i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242, i64 614242>
#   %237 = lshr <8 x i64> %236, <i64 20, i64 20, i64 20, i64 20, i64 20, i64 20, i64 20, i64 20>
#   %238 = add nsw <8 x i64> %237, <i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023, i64 -1023>
#   %239 = sitofp <8 x i64> %238 to <8 x double>
#   %240 = shl <8 x i64> %236, <i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32, i64 32>
#   %241 = and <8 x i64> %240, <i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200, i64 4503595332403200>
#   %242 = add nuw nsw <8 x i64> %241, <i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776, i64 4604544269498187776>
#   %243 = and <8 x i64> %233, <i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295>
#   %244 = or <8 x i64> %242, %243
#   %245 = bitcast <8 x i64> %244 to <8 x double>
#   %246 = fadd fast <8 x double> %245, <double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00>
#   %247 = fmul fast <8 x double> %246, %246
#   %248 = fmul fast <8 x double> %247, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
#   %249 = fadd fast <8 x double> %245, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
#   %250 = fdiv fast <8 x double> %246, %249
#   %251 = fmul fast <8 x double> %250, %250
#   %252 = fmul fast <8 x double> %251, %251
#   %253 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %252, <8 x double> <double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F, double 0x3FC39A09D078C69F>, <8 x double> <double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF, double 0x3FCC71C51D8E78AF>) #5
#   %254 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %252, <8 x double> %253, <8 x double> <double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04, double 0x3FD999999997FA04>) #5
#   %255 = fmul fast <8 x double> %254, %252
#   %256 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %252, <8 x double> <double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244, double 0x3FC2F112DF3E5244>, <8 x double> <double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE, double 0x3FC7466496CB03DE>) #5
#   %257 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %252, <8 x double> %256, <8 x double> <double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359, double 0x3FD2492494229359>) #5
#   %258 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %252, <8 x double> %257, <8 x double> <double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593, double 0x3FE5555555555593>) #5
#   %259 = fmul fast <8 x double> %258, %251
#   %260 = fadd fast <8 x double> %255, %248
#   %261 = fadd fast <8 x double> %260, %259
#   %262 = fmul fast <8 x double> %239, <double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76, double 0x3DEA39EF35793C76>
#   %263 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %250, <8 x double> %261, <8 x double> %262) #5
#   %264 = fsub fast <8 x double> %246, %248
#   %265 = fadd fast <8 x double> %264, %263
#   %266 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %239, <8 x double> <double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000, double 0x3FE62E42FEE00000>, <8 x double> %265) #5
#   %267 = select <8 x i1> %235, <8 x double> %266, <8 x double> <double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000>
#   %268 = fcmp fast oge <8 x double> %119, zeroinitializer
#   %269 = bitcast <8 x i1> %268 to i8
#   %270 = xor i8 %269, -1
#   %271 = bitcast i8 %270 to <8 x i1>
#   %272 = select <8 x i1> %271, <8 x double> <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>, <8 x double> %267
#   %273 = fsub fast <8 x double> <double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5, double 0x3FED67F1C864BEB5>, %119
#   %274 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %232, <8 x double> %272, <8 x double> %273) #5
#   %275 = fmul fast <8 x double> %119, %119
#   %276 = fdiv fast <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %275
#   %277 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %276, <8 x double> <double 0x3F4A985027336661, double 0x3F4A985027336661, double 0x3F4A985027336661, double 0x3F4A985027336661, double 0x3F4A985027336661, double 0x3F4A985027336661, double 0x3F4A985027336661, double 0x3F4A985027336661>, <8 x double> <double 0xBF437FBDB580E943, double 0xBF437FBDB580E943, double 0xBF437FBDB580E943, double 0xBF437FBDB580E943, double 0xBF437FBDB580E943, double 0xBF437FBDB580E943, double 0xBF437FBDB580E943, double 0xBF437FBDB580E943>) #5
#   %278 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %276, <8 x double> %277, <8 x double> <double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB, double 0x3F4A019F20DC5EBB>) #5
#   %279 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %276, <8 x double> %278, <8 x double> <double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1, double 0xBF66C16C16B0A5A1>) #5
#   %280 = call fast <8 x double> @llvm.fma.v8f64(<8 x double> %276, <8 x double> %279, <8 x double> <double 0x3FB555555555554B, double 0x3FB555555555554B, double 0x3FB555555555554B, double 0x3FB555555555554B, double 0x3FB555555555554B, double 0x3FB555555555554B, double 0x3FB555555555554B, double 0x3FB555555555554B>) #5
#   %281 = fdiv fast <8 x double> %280, %119
#   %282 = fadd fast <8 x double> %274, %281
#   %283 = select <8 x i1> %121, <8 x double> %231, <8 x double> %282
#   br label %284

# ; 284:                                              ; preds = %230, %169
#   %285 = phi <8 x double> [ %283, %230 ], [ %228, %169 ]
#   %286 = select <8 x i1> %16, <8 x double> %120, <8 x double> %285
#   %287 = fcmp fast oeq <8 x double> %119, <double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000, double 0xFFF0000000000000>
#   %288 = select <8 x i1> %9, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <8 x double> %286
#   %289 = select <8 x i1> %287, <8 x double> <double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF, double 0xFFFFFFFFFFFFFFFF>, <8 x double> %288
#   br label %290

# ; 290:                                              ; preds = %116, %284
#   %291 = phi <8 x double> [ %117, %116 ], [ %289, %284 ]
#   call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %11) #5
#   ret <8 x double> %291
# }
# ""","""
#   %2 = alloca <8 x double>, align 64
#   %3 = bitcast <8 x double>* %2 to i8*
#   call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #5
#   %4 = getelementptr inbounds <8 x double>, <8 x double>* %2, i64 0, i32 0, i32 0, i32 0
#   store <8 x double> %0, <8 x double>* %4, align 64, !tbaa !3
#   %5 = bitcast <8 x double>* %2 to i8*
#   %6 = call fast <8 x double> @xsimdlgamma(i8* nonnull dereferenceable(1) %5)
#   call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #5
#   ret <8 x double> %6
# """), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
# end

# @inline function vsin(v::Vec{8,Float64})
# ), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
# end

