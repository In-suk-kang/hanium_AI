
$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

@__const.a_1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.a_2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8, !dbg !0

define linkonce_odr dso_local i32 @sprintf(ptr noundef %0, ptr noundef %1, ...) #0 comdat !dbg !21 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !33, metadata !DIExpression()), !dbg !34
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata ptr %5, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata ptr %6, metadata !39, metadata !DIExpression()), !dbg !42
  call void @llvm.va_start(ptr %6), !dbg !43
  %7 = load ptr, ptr %6, align 8, !dbg !44
  %8 = load ptr, ptr %3, align 8, !dbg !44
  %9 = load ptr, ptr %4, align 8, !dbg !44
  %10 = call i32 @_vsprintf_l(ptr noundef %9, ptr noundef %8, ptr noundef null, ptr noundef %7), !dbg !44
  store i32 %10, ptr %5, align 4, !dbg !44
  call void @llvm.va_end(ptr %6), !dbg !45
  %11 = load i32, ptr %5, align 4, !dbg !46
  ret i32 %11, !dbg !46
}

define linkonce_odr dso_local i32 @vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 comdat !dbg !47 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !50, metadata !DIExpression()), !dbg !51
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !52, metadata !DIExpression()), !dbg !53
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !54, metadata !DIExpression()), !dbg !55
  %7 = load ptr, ptr %4, align 8, !dbg !56
  %8 = load ptr, ptr %5, align 8, !dbg !56
  %9 = load ptr, ptr %6, align 8, !dbg !56
  %10 = call i32 @_vsnprintf_l(ptr noundef %9, i64 noundef -1, ptr noundef %8, ptr noundef null, ptr noundef %7), !dbg !56
  ret i32 %10, !dbg !56
}

define linkonce_odr dso_local i32 @_snprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ...) #0 comdat !dbg !57 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !61, metadata !DIExpression()), !dbg !62
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !63, metadata !DIExpression()), !dbg !64
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %7, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata ptr %8, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.va_start(ptr %8), !dbg !71
  %9 = load ptr, ptr %8, align 8, !dbg !72
  %10 = load ptr, ptr %4, align 8, !dbg !72
  %11 = load i64, ptr %5, align 8, !dbg !72
  %12 = load ptr, ptr %6, align 8, !dbg !72
  %13 = call i32 @_vsnprintf(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef %9), !dbg !72
  store i32 %13, ptr %7, align 4, !dbg !72
  call void @llvm.va_end(ptr %8), !dbg !73
  %14 = load i32, ptr %7, align 4, !dbg !74
  ret i32 %14, !dbg !74
}

define linkonce_odr dso_local i32 @_vsnprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat !dbg !75 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !78, metadata !DIExpression()), !dbg !79
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !80, metadata !DIExpression()), !dbg !81
  store i64 %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !82, metadata !DIExpression()), !dbg !83
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !84, metadata !DIExpression()), !dbg !85
  %9 = load ptr, ptr %5, align 8, !dbg !86
  %10 = load ptr, ptr %6, align 8, !dbg !86
  %11 = load i64, ptr %7, align 8, !dbg !86
  %12 = load ptr, ptr %8, align 8, !dbg !86
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef null, ptr noundef %9), !dbg !86
  ret i32 %13, !dbg !86
}

define dso_local void @a_1(ptr noundef %0) #0 !dbg !87 {
  %2 = alloca ptr, align 8
  %3 = alloca [11 x i8], align 1
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata ptr %3, metadata !93, metadata !DIExpression()), !dbg !98
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.a_1.source, i64 11, i1 false), !dbg !98
  call void @llvm.dbg.declare(metadata ptr %4, metadata !99, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata ptr %5, metadata !103, metadata !DIExpression()), !dbg !102
  %6 = getelementptr inbounds [11 x i8], ptr %3, i64 0, i64 0, !dbg !104
  %7 = call i64 @strlen(ptr noundef %6), !dbg !104
  store i64 %7, ptr %5, align 8, !dbg !104
  store i64 0, ptr %4, align 8, !dbg !105
  br label %8, !dbg !105

8:                                                ; preds = %20, %1
  %9 = load i64, ptr %4, align 8, !dbg !105
  %10 = load i64, ptr %5, align 8, !dbg !105
  %11 = add i64 %10, 1, !dbg !105
  %12 = icmp ult i64 %9, %11, !dbg !105
  br i1 %12, label %13, label %23, !dbg !105

13:                                               ; preds = %8
  %14 = load i64, ptr %4, align 8, !dbg !107
  %15 = getelementptr inbounds [11 x i8], ptr %3, i64 0, i64 %14, !dbg !107
  %16 = load i8, ptr %15, align 1, !dbg !107
  %17 = load ptr, ptr %2, align 8, !dbg !107
  %18 = load i64, ptr %4, align 8, !dbg !107
  %19 = getelementptr inbounds i8, ptr %17, i64 %18, !dbg !107
  store i8 %16, ptr %19, align 1, !dbg !107
  br label %20, !dbg !110

20:                                               ; preds = %13
  %21 = load i64, ptr %4, align 8, !dbg !111
  %22 = add i64 %21, 1, !dbg !111
  store i64 %22, ptr %4, align 8, !dbg !111
  br label %8, !dbg !111, !llvm.loop !112

23:                                               ; preds = %8
  %24 = load ptr, ptr %2, align 8, !dbg !115
  call void @printLine(ptr noundef %24), !dbg !115
  ret void, !dbg !116
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i64 @strlen(ptr noundef) #3

declare dso_local void @printLine(ptr noundef) #3

define dso_local void @a_2(ptr noundef %0) #0 !dbg !117 {
  %2 = alloca ptr, align 8
  %3 = alloca [11 x i8], align 1
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata ptr %3, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.a_2.source, i64 11, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata ptr %4, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata ptr %5, metadata !125, metadata !DIExpression()), !dbg !124
  %6 = getelementptr inbounds [11 x i8], ptr %3, i64 0, i64 0, !dbg !126
  %7 = call i64 @strlen(ptr noundef %6), !dbg !126
  store i64 %7, ptr %5, align 8, !dbg !126
  store i64 0, ptr %4, align 8, !dbg !127
  br label %8, !dbg !127

8:                                                ; preds = %20, %1
  %9 = load i64, ptr %4, align 8, !dbg !127
  %10 = load i64, ptr %5, align 8, !dbg !127
  %11 = add i64 %10, 1, !dbg !127
  %12 = icmp ult i64 %9, %11, !dbg !127
  br i1 %12, label %13, label %23, !dbg !127

13:                                               ; preds = %8
  %14 = load i64, ptr %4, align 8, !dbg !129
  %15 = getelementptr inbounds [11 x i8], ptr %3, i64 0, i64 %14, !dbg !129
  %16 = load i8, ptr %15, align 1, !dbg !129
  %17 = load ptr, ptr %2, align 8, !dbg !129
  %18 = load i64, ptr %4, align 8, !dbg !129
  %19 = getelementptr inbounds i8, ptr %17, i64 %18, !dbg !129
  store i8 %16, ptr %19, align 1, !dbg !129
  br label %20, !dbg !132

20:                                               ; preds = %13
  %21 = load i64, ptr %4, align 8, !dbg !133
  %22 = add i64 %21, 1, !dbg !133
  store i64 %22, ptr %4, align 8, !dbg !133
  br label %8, !dbg !133, !llvm.loop !134

23:                                               ; preds = %8
  %24 = load ptr, ptr %2, align 8, !dbg !136
  call void @printLine(ptr noundef %24), !dbg !136
  ret void, !dbg !137
}

declare void @llvm.va_start(ptr) #4

define linkonce_odr dso_local i32 @_vsprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat !dbg !138 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !154, metadata !DIExpression()), !dbg !155
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !156, metadata !DIExpression()), !dbg !157
  store ptr %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !158, metadata !DIExpression()), !dbg !159
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !160, metadata !DIExpression()), !dbg !161
  %9 = load ptr, ptr %5, align 8, !dbg !162
  %10 = load ptr, ptr %6, align 8, !dbg !162
  %11 = load ptr, ptr %7, align 8, !dbg !162
  %12 = load ptr, ptr %8, align 8, !dbg !162
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef -1, ptr noundef %11, ptr noundef %10, ptr noundef %9), !dbg !162
  ret i32 %13, !dbg !162
}

declare void @llvm.va_end(ptr) #4

define linkonce_odr dso_local i32 @_vsnprintf_l(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 comdat !dbg !163 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %4, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !166, metadata !DIExpression()), !dbg !167
  store ptr %3, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !168, metadata !DIExpression()), !dbg !169
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !170, metadata !DIExpression()), !dbg !171
  store i64 %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !172, metadata !DIExpression()), !dbg !173
  store ptr %0, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata ptr %11, metadata !176, metadata !DIExpression()), !dbg !178
  %12 = load ptr, ptr %6, align 8, !dbg !178
  %13 = load ptr, ptr %7, align 8, !dbg !178
  %14 = load ptr, ptr %8, align 8, !dbg !178
  %15 = load i64, ptr %9, align 8, !dbg !178
  %16 = load ptr, ptr %10, align 8, !dbg !178
  %17 = call ptr @__local_stdio_printf_options(), !dbg !178
  %18 = load i64, ptr %17, align 8, !dbg !178
  %19 = or i64 %18, 1, !dbg !178
  %20 = call i32 @__stdio_common_vsprintf(i64 noundef %19, ptr noundef %16, i64 noundef %15, ptr noundef %14, ptr noundef %13, ptr noundef %12), !dbg !178
  store i32 %20, ptr %11, align 4, !dbg !178
  %21 = load i32, ptr %11, align 4, !dbg !179
  %22 = icmp slt i32 %21, 0, !dbg !179
  br i1 %22, label %23, label %24, !dbg !179

23:                                               ; preds = %5
  br label %26, !dbg !179

24:                                               ; preds = %5
  %25 = load i32, ptr %11, align 4, !dbg !179
  br label %26, !dbg !179

26:                                               ; preds = %24, %23
  %27 = phi i32 [ -1, %23 ], [ %25, %24 ], !dbg !179
  ret i32 %27, !dbg !179
}

declare dso_local i32 @__stdio_common_vsprintf(i64 noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef) #3

define linkonce_odr dso_local ptr @__local_stdio_printf_options() #0 comdat !dbg !2 {
  ret ptr @__local_stdio_printf_options._OptionsStorage, !dbg !180
}

