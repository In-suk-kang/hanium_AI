
$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8, !dbg !0

define linkonce_odr dso_local i32 @sprintf(ptr noundef %0, ptr noundef %1, ...) #0 comdat !dbg !23 {
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

define dso_local void @a_1() #0 !dbg !87 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata ptr %2, metadata !93, metadata !DIExpression()), !dbg !94
  %4 = alloca i8, i64 10, align 16, !dbg !94
  store ptr %4, ptr %2, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata ptr %3, metadata !95, metadata !DIExpression()), !dbg !96
  %5 = alloca i8, i64 11, align 16, !dbg !96
  store ptr %5, ptr %3, align 8, !dbg !96
  %6 = load ptr, ptr %2, align 8, !dbg !97
  store ptr %6, ptr %1, align 8, !dbg !97
  %7 = load ptr, ptr %1, align 8, !dbg !98
  %8 = getelementptr inbounds i8, ptr %7, i64 0, !dbg !98
  store i8 0, ptr %8, align 1, !dbg !98
  %9 = load ptr, ptr %1, align 8, !dbg !99
  call void @a_2(ptr noundef %9), !dbg !99
  ret void, !dbg !100
}

declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @a_2(ptr noundef) #2

define dso_local void @a_3() #0 !dbg !101 {
  call void @a_4(), !dbg !102
  ret void, !dbg !103
}

declare void @llvm.va_start(ptr) #3

define linkonce_odr dso_local i32 @_vsprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat !dbg !104 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !120, metadata !DIExpression()), !dbg !121
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !122, metadata !DIExpression()), !dbg !123
  store ptr %1, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !124, metadata !DIExpression()), !dbg !125
  store ptr %0, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !126, metadata !DIExpression()), !dbg !127
  %9 = load ptr, ptr %5, align 8, !dbg !128
  %10 = load ptr, ptr %6, align 8, !dbg !128
  %11 = load ptr, ptr %7, align 8, !dbg !128
  %12 = load ptr, ptr %8, align 8, !dbg !128
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef -1, ptr noundef %11, ptr noundef %10, ptr noundef %9), !dbg !128
  ret i32 %13, !dbg !128
}

declare void @llvm.va_end(ptr) #3

define linkonce_odr dso_local i32 @_vsnprintf_l(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 comdat !dbg !129 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %4, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !132, metadata !DIExpression()), !dbg !133
  store ptr %3, ptr %7, align 8
  call void @llvm.dbg.declare(metadata ptr %7, metadata !134, metadata !DIExpression()), !dbg !135
  store ptr %2, ptr %8, align 8
  call void @llvm.dbg.declare(metadata ptr %8, metadata !136, metadata !DIExpression()), !dbg !137
  store i64 %1, ptr %9, align 8
  call void @llvm.dbg.declare(metadata ptr %9, metadata !138, metadata !DIExpression()), !dbg !139
  store ptr %0, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %10, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata ptr %11, metadata !142, metadata !DIExpression()), !dbg !144
  %12 = load ptr, ptr %6, align 8, !dbg !144
  %13 = load ptr, ptr %7, align 8, !dbg !144
  %14 = load ptr, ptr %8, align 8, !dbg !144
  %15 = load i64, ptr %9, align 8, !dbg !144
  %16 = load ptr, ptr %10, align 8, !dbg !144
  %17 = call ptr @__local_stdio_printf_options(), !dbg !144
  %18 = load i64, ptr %17, align 8, !dbg !144
  %19 = or i64 %18, 1, !dbg !144
  %20 = call i32 @__stdio_common_vsprintf(i64 noundef %19, ptr noundef %16, i64 noundef %15, ptr noundef %14, ptr noundef %13, ptr noundef %12), !dbg !144
  store i32 %20, ptr %11, align 4, !dbg !144
  %21 = load i32, ptr %11, align 4, !dbg !145
  %22 = icmp slt i32 %21, 0, !dbg !145
  br i1 %22, label %23, label %24, !dbg !145

23:                                               ; preds = %5
  br label %26, !dbg !145

24:                                               ; preds = %5
  %25 = load i32, ptr %11, align 4, !dbg !145
  br label %26, !dbg !145

26:                                               ; preds = %24, %23
  %27 = phi i32 [ -1, %23 ], [ %25, %24 ], !dbg !145
  ret i32 %27, !dbg !145
}

declare dso_local i32 @__stdio_common_vsprintf(i64 noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef) #2

define linkonce_odr dso_local ptr @__local_stdio_printf_options() #0 comdat !dbg !2 {
  ret ptr @__local_stdio_printf_options._OptionsStorage, !dbg !146
}

define internal void @a_4() #0 !dbg !147 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata ptr %2, metadata !150, metadata !DIExpression()), !dbg !151
  %4 = alloca i8, i64 10, align 16, !dbg !151
  store ptr %4, ptr %2, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata ptr %3, metadata !152, metadata !DIExpression()), !dbg !153
  %5 = alloca i8, i64 11, align 16, !dbg !153
  store ptr %5, ptr %3, align 8, !dbg !153
  %6 = load ptr, ptr %3, align 8, !dbg !154
  store ptr %6, ptr %1, align 8, !dbg !154
  %7 = load ptr, ptr %1, align 8, !dbg !155
  %8 = getelementptr inbounds i8, ptr %7, i64 0, !dbg !155
  store i8 0, ptr %8, align 1, !dbg !155
  %9 = load ptr, ptr %1, align 8, !dbg !156
  call void @a_5(ptr noundef %9), !dbg !156
  ret void, !dbg !157
}

declare dso_local void @a_5(ptr noundef) #2

