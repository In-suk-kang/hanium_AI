
$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

@a_1 = internal global ptr null, align 8, !dbg !0
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8, !dbg !13
@__const.a_2.source = private unnamed_addr constant [11 x i16] [i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 0], align 16
@a_3 = internal global ptr null, align 8, !dbg !20
@__const.a_4.source = private unnamed_addr constant [11 x i16] [i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 0], align 16

define linkonce_odr dso_local i32 @sprintf(ptr noundef %0, ptr noundef %1, ...) #0 comdat !dbg !30 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !42, metadata !DIExpression()), !dbg !43
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata ptr %5, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %6, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.va_start(ptr %6), !dbg !52
  %7 = load ptr, ptr %6, align 8, !dbg !53
  %8 = load ptr, ptr %3, align 8, !dbg !53
  %9 = load ptr, ptr %4, align 8, !dbg !53
  %10 = call i32 @_vsprintf_l(ptr noundef %9, ptr noundef %8, ptr noundef null, ptr noundef %7), !dbg !53
  store i32 %10, ptr %5, align 4, !dbg !53
  call void @llvm.va_end(ptr %6), !dbg !54
  %11 = load i32, ptr %5, align 4, !dbg !55
  ret i32 %11, !dbg !55
}

define linkonce_odr dso_local i32 @vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 comdat !dbg !56 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !59, metadata !DIExpression()), !dbg !60
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !61, metadata !DIExpression()), !dbg !62
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !63, metadata !DIExpression()), !dbg !64
  %7 = load ptr, ptr %4, align 8, !dbg !65
  %8 = load ptr, ptr %5, align 8, !dbg !65
  %9 = load ptr, ptr %6, align 8, !dbg !65
  %10 = call i32 @_vsnprintf_l(ptr noundef %9, i64 noundef -1, ptr noundef %8, ptr noundef null, ptr noundef %7), !dbg !65
  ret i32 %10, !dbg !65
}

define linkonce_odr dso_local i32 @_snprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ...) #0 comdat !dbg !66 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !70, metadata !DIExpression()), !dbg !71
  store i64 %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !72, metadata !DIExpression()), !dbg !73
  store ptr %0, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %7, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata ptr %8, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.va_start(ptr %8), !dbg !80
  %9 = load ptr, ptr %8, align 8, !dbg !81
  %10 = load ptr, ptr %4, align 8, !dbg !81
  %11 = load i64, ptr %5, align 8, !dbg !81
  %12 = load ptr, ptr %6, align 8, !dbg !81
  %13 = call i32 @_vsnprintf(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef %9), !dbg !81
  store i32 %13, ptr %7, align 4, !dbg !81
  call void @llvm.va_end(ptr %8), !dbg !82
  %14 = load i32, ptr %7, align 4, !dbg !83
  ret i32 %14, !dbg !83
}

define linkonce_odr dso_local i32 @_vsnprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat !dbg !84 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !87, metadata !DIExpression()), !dbg !88
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !89, metadata !DIExpression()), !dbg !90
  store i64 %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !91, metadata !DIExpression()), !dbg !92
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !93, metadata !DIExpression()), !dbg !94
  %9 = load ptr, ptr %5, align 8, !dbg !95
  %10 = load ptr, ptr %6, align 8, !dbg !95
  %11 = load i64, ptr %7, align 8, !dbg !95
  %12 = load ptr, ptr %8, align 8, !dbg !95
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef null, ptr noundef %9), !dbg !95
  ret i32 %13, !dbg !95
}

define dso_local void @a_5() #0 !dbg !96 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata ptr %2, metadata !101, metadata !DIExpression()), !dbg !102
  %4 = alloca i8, i64 20, align 16, !dbg !102
  store ptr %4, ptr %2, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata ptr %3, metadata !103, metadata !DIExpression()), !dbg !104
  %5 = alloca i8, i64 22, align 16, !dbg !104
  store ptr %5, ptr %3, align 8, !dbg !104
  %6 = load ptr, ptr %2, align 8, !dbg !105
  store ptr %6, ptr %1, align 8, !dbg !105
  %7 = load ptr, ptr %1, align 8, !dbg !106
  %8 = getelementptr inbounds i16, ptr %7, i64 0, !dbg !106
  store i16 0, ptr %8, align 2, !dbg !106
  %9 = load ptr, ptr %1, align 8, !dbg !107
  store ptr %9, ptr @a_1, align 8, !dbg !107
  call void @a_2(), !dbg !108
  ret void, !dbg !109
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

define dso_local void @a_6() #0 !dbg !110 {
  call void @a_7(), !dbg !111
  ret void, !dbg !112
}

declare void @llvm.va_start(ptr) #2

define linkonce_odr dso_local i32 @_vsprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat !dbg !113 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !129, metadata !DIExpression()), !dbg !130
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !131, metadata !DIExpression()), !dbg !132
  store ptr %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !133, metadata !DIExpression()), !dbg !134
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !135, metadata !DIExpression()), !dbg !136
  %9 = load ptr, ptr %5, align 8, !dbg !137
  %10 = load ptr, ptr %6, align 8, !dbg !137
  %11 = load ptr, ptr %7, align 8, !dbg !137
  %12 = load ptr, ptr %8, align 8, !dbg !137
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef -1, ptr noundef %11, ptr noundef %10, ptr noundef %9), !dbg !137
  ret i32 %13, !dbg !137
}

declare void @llvm.va_end(ptr) #2

define linkonce_odr dso_local i32 @_vsnprintf_l(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 comdat !dbg !138 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %4, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !141, metadata !DIExpression()), !dbg !142
  store ptr %3, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !143, metadata !DIExpression()), !dbg !144
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !145, metadata !DIExpression()), !dbg !146
  store i64 %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !147, metadata !DIExpression()), !dbg !148
  store ptr %0, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata ptr %11, metadata !151, metadata !DIExpression()), !dbg !153
  %12 = load ptr, ptr %6, align 8, !dbg !153
  %13 = load ptr, ptr %7, align 8, !dbg !153
  %14 = load ptr, ptr %8, align 8, !dbg !153
  %15 = load i64, ptr %9, align 8, !dbg !153
  %16 = load ptr, ptr %10, align 8, !dbg !153
  %17 = call ptr @__local_stdio_printf_options(), !dbg !153
  %18 = load i64, ptr %17, align 8, !dbg !153
  %19 = or i64 %18, 1, !dbg !153
  %20 = call i32 @__stdio_common_vsprintf(i64 noundef %19, ptr noundef %16, i64 noundef %15, ptr noundef %14, ptr noundef %13, ptr noundef %12), !dbg !153
  store i32 %20, ptr %11, align 4, !dbg !153
  %21 = load i32, ptr %11, align 4, !dbg !154
  %22 = icmp slt i32 %21, 0, !dbg !154
  br i1 %22, label %23, label %24, !dbg !154

23:                                               ; preds = %5
  br label %26, !dbg !154

24:                                               ; preds = %5
  %25 = load i32, ptr %11, align 4, !dbg !154
  br label %26, !dbg !154

26:                                               ; preds = %24, %23
  %27 = phi i32 [ -1, %23 ], [ %25, %24 ], !dbg !154
  ret i32 %27, !dbg !154
}

declare dso_local i32 @__stdio_common_vsprintf(i64 noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef) #3

define linkonce_odr dso_local ptr @__local_stdio_printf_options() #0 comdat !dbg !15 {
  ret ptr @__local_stdio_printf_options._OptionsStorage, !dbg !155
}

define internal void @a_2() #0 !dbg !156 {
  %1 = alloca ptr, align 8
  %2 = alloca [11 x i16], align 16
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !157, metadata !DIExpression()), !dbg !158
  %5 = load ptr, ptr @a_1, align 8, !dbg !158
  store ptr %5, ptr %1, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata ptr %2, metadata !159, metadata !DIExpression()), !dbg !164
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.a_2.source, i64 22, i1 false), !dbg !164
  call void @llvm.dbg.declare(metadata ptr %3, metadata !165, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata ptr %4, metadata !169, metadata !DIExpression()), !dbg !168
  %6 = getelementptr inbounds [11 x i16], ptr %2, i64 0, i64 0, !dbg !170
  %7 = call i64 @wcslen(ptr noundef %6), !dbg !170
  store i64 %7, ptr %4, align 8, !dbg !170
  store i64 0, ptr %3, align 8, !dbg !171
  br label %8, !dbg !171

8:                                                ; preds = %20, %0
  %9 = load i64, ptr %3, align 8, !dbg !171
  %10 = load i64, ptr %4, align 8, !dbg !171
  %11 = add i64 %10, 1, !dbg !171
  %12 = icmp ult i64 %9, %11, !dbg !171
  br i1 %12, label %13, label %23, !dbg !171

13:                                               ; preds = %8
  %14 = load i64, ptr %3, align 8, !dbg !173
  %15 = getelementptr inbounds [11 x i16], ptr %2, i64 0, i64 %14, !dbg !173
  %16 = load i16, ptr %15, align 2, !dbg !173
  %17 = load ptr, ptr %1, align 8, !dbg !173
  %18 = load i64, ptr %3, align 8, !dbg !173
  %19 = getelementptr inbounds i16, ptr %17, i64 %18, !dbg !173
  store i16 %16, ptr %19, align 2, !dbg !173
  br label %20, !dbg !176

20:                                               ; preds = %13
  %21 = load i64, ptr %3, align 8, !dbg !177
  %22 = add i64 %21, 1, !dbg !177
  store i64 %22, ptr %3, align 8, !dbg !177
  br label %8, !dbg !177, !llvm.loop !178

23:                                               ; preds = %8
  %24 = load ptr, ptr %1, align 8, !dbg !181
  call void @printWLine(ptr noundef %24), !dbg !181
  ret void, !dbg !182
}

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local i64 @wcslen(ptr noundef) #3

declare dso_local void @printWLine(ptr noundef) #3

define internal void @a_7() #0 !dbg !183 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata ptr %2, metadata !186, metadata !DIExpression()), !dbg !187
  %4 = alloca i8, i64 20, align 16, !dbg !187
  store ptr %4, ptr %2, align 8, !dbg !187
  call void @llvm.dbg.declare(metadata ptr %3, metadata !188, metadata !DIExpression()), !dbg !189
  %5 = alloca i8, i64 22, align 16, !dbg !189
  store ptr %5, ptr %3, align 8, !dbg !189
  %6 = load ptr, ptr %3, align 8, !dbg !190
  store ptr %6, ptr %1, align 8, !dbg !190
  %7 = load ptr, ptr %1, align 8, !dbg !191
  %8 = getelementptr inbounds i16, ptr %7, i64 0, !dbg !191
  store i16 0, ptr %8, align 2, !dbg !191
  %9 = load ptr, ptr %1, align 8, !dbg !192
  store ptr %9, ptr @a_3, align 8, !dbg !192
  call void @a_4(), !dbg !193
  ret void, !dbg !194
}

define internal void @a_4() #0 !dbg !195 {
  %1 = alloca ptr, align 8
  %2 = alloca [11 x i16], align 16
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !196, metadata !DIExpression()), !dbg !197
  %5 = load ptr, ptr @a_3, align 8, !dbg !197
  store ptr %5, ptr %1, align 8, !dbg !197
  call void @llvm.dbg.declare(metadata ptr %2, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.a_4.source, i64 22, i1 false), !dbg !200
  call void @llvm.dbg.declare(metadata ptr %3, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata ptr %4, metadata !203, metadata !DIExpression()), !dbg !202
  %6 = getelementptr inbounds [11 x i16], ptr %2, i64 0, i64 0, !dbg !204
  %7 = call i64 @wcslen(ptr noundef %6), !dbg !204
  store i64 %7, ptr %4, align 8, !dbg !204
  store i64 0, ptr %3, align 8, !dbg !205
  br label %8, !dbg !205

8:                                                ; preds = %20, %0
  %9 = load i64, ptr %3, align 8, !dbg !205
  %10 = load i64, ptr %4, align 8, !dbg !205
  %11 = add i64 %10, 1, !dbg !205
  %12 = icmp ult i64 %9, %11, !dbg !205
  br i1 %12, label %13, label %23, !dbg !205

13:                                               ; preds = %8
  %14 = load i64, ptr %3, align 8, !dbg !207
  %15 = getelementptr inbounds [11 x i16], ptr %2, i64 0, i64 %14, !dbg !207
  %16 = load i16, ptr %15, align 2, !dbg !207
  %17 = load ptr, ptr %1, align 8, !dbg !207
  %18 = load i64, ptr %3, align 8, !dbg !207
  %19 = getelementptr inbounds i16, ptr %17, i64 %18, !dbg !207
  store i16 %16, ptr %19, align 2, !dbg !207
  br label %20, !dbg !210

20:                                               ; preds = %13
  %21 = load i64, ptr %3, align 8, !dbg !211
  %22 = add i64 %21, 1, !dbg !211
  store i64 %22, ptr %3, align 8, !dbg !211
  br label %8, !dbg !211, !llvm.loop !212

23:                                               ; preds = %8
  %24 = load ptr, ptr %1, align 8, !dbg !214
  call void @printWLine(ptr noundef %24), !dbg !214
  ret void, !dbg !215
}

