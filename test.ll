; ModuleID = './files\test.c'
source_filename = "./files\\test.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.40.33811"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData = internal unnamed_addr global ptr null, align 8, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData = internal unnamed_addr global ptr null, align 8, !dbg !20
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i16] [i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 65, i16 0], align 16

; Function Attrs: nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_bad() local_unnamed_addr #0 !dbg !31 {
  %1 = alloca [20 x i8], align 16, !dbg !38
  tail call void @llvm.dbg.value(metadata ptr %1, metadata !36, metadata !DIExpression()), !dbg !39
  tail call void @llvm.dbg.value(metadata ptr undef, metadata !37, metadata !DIExpression()), !dbg !39
  tail call void @llvm.dbg.value(metadata ptr %1, metadata !35, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData, align 8, !dbg !40, !tbaa !41
  call void @llvm.dbg.assign(metadata i1 undef, metadata !45, metadata !DIExpression(), metadata !57, metadata ptr @__const.goodG2BSink.source, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata ptr %1, metadata !49, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.assign(metadata i1 undef, metadata !45, metadata !DIExpression(), metadata !61, metadata ptr @__const.goodG2BSink.source, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata i64 10, metadata !53, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata i64 0, metadata !50, metadata !DIExpression()), !dbg !58
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(22) %1, ptr noundef nonnull align 16 dereferenceable(22) @__const.goodG2BSink.source, i64 22, i1 false), !dbg !62, !tbaa !66
  call void @llvm.dbg.value(metadata i64 poison, metadata !50, metadata !DIExpression()), !dbg !58
  call void @printWLine(ptr noundef nonnull %1) #6, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_good() local_unnamed_addr #0 !dbg !70 {
  %1 = alloca [22 x i8], align 16, !dbg !71
  call void @llvm.lifetime.start.p0(i64 22, ptr nonnull %1), !dbg !78
  call void @llvm.dbg.value(metadata ptr undef, metadata !75, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata ptr %1, metadata !76, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.value(metadata ptr %1, metadata !74, metadata !DIExpression()), !dbg !79
  store ptr %1, ptr @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData, align 8, !dbg !78, !tbaa !41
  call void @llvm.dbg.assign(metadata i1 undef, metadata !80, metadata !DIExpression(), metadata !87, metadata ptr @__const.goodG2BSink.source, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata ptr %1, metadata !84, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.assign(metadata i1 undef, metadata !80, metadata !DIExpression(), metadata !91, metadata ptr @__const.goodG2BSink.source, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata i64 10, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata i64 0, metadata !85, metadata !DIExpression()), !dbg !88
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(22) %1, ptr noundef nonnull align 16 dereferenceable(22) @__const.goodG2BSink.source, i64 22, i1 false), !dbg !92, !tbaa !66
  call void @llvm.dbg.value(metadata i64 poison, metadata !85, metadata !DIExpression()), !dbg !88
  call void @printWLine(ptr noundef nonnull %1) #6, !dbg !96
  call void @llvm.lifetime.end.p0(i64 22, ptr nonnull %1), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.assign(metadata, metadata, metadata, metadata, metadata, metadata) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_badData", scope: !2, file: !22, line: 26, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 18.1.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "files\\test.c", directory: "C:\\Users\\INSEOK\\Desktop\\ai_server", checksumkind: CSK_MD5, checksum: "cb4440eaf1a47fad3faf01f3369a6997")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 24, baseType: !8)
!7 = !DIFile(filename: "Downloads\\clang+llvm-18.1.6-x86_64-pc-windows-msvc\\clang+llvm-18.1.6-x86_64-pc-windows-msvc\\lib\\clang\\18\\include\\__stddef_wchar_t.h", directory: "C:\\Users\\INSEOK", checksumkind: CSK_MD5, checksum: "1bf0c51e90dd5eb05cdcc01afdea587a")
!8 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 188, baseType: !11)
!10 = !DIFile(filename: "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.40.33807\\include\\vcruntime.h", directory: "", checksumkind: CSK_MD5, checksum: "ffeaecc7602ffa5cb829d037e7059d4f")
!11 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!12 = !{!0, !13, !20}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "_OptionsStorage", scope: !15, file: !16, line: 91, type: !11, isLocal: true, isDefinition: true)
!15 = distinct !DISubprogram(name: "__local_stdio_printf_options", scope: !16, file: !16, line: 89, type: !17, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!16 = !DIFile(filename: "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt\\corecrt_stdio_config.h", directory: "", checksumkind: CSK_MD5, checksum: "dacf907bda504afb0b64f53a242bdae6")
!17 = !DISubroutineType(types: !18)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_goodG2BData", scope: !2, file: !22, line: 27, type: !5, isLocal: true, isDefinition: true)
!22 = !DIFile(filename: "./files\\test.c", directory: "C:\\Users\\INSEOK\\Desktop\\ai_server", checksumkind: CSK_MD5, checksum: "cb4440eaf1a47fad3faf01f3369a6997")
!23 = !{i32 2, !"CodeView", i32 1}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 2}
!26 = !{i32 8, !"PIC Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 2}
!28 = !{i32 1, !"MaxTLSAlign", i32 65536}
!29 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!30 = !{!"clang version 18.1.6"}
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_bad", scope: !22, file: !22, line: 48, type: !32, scopeLine: 49, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !34)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !{!35, !36, !37}
!35 = !DILocalVariable(name: "data", scope: !31, file: !22, line: 50, type: !5)
!36 = !DILocalVariable(name: "dataBadBuffer", scope: !31, file: !22, line: 51, type: !5)
!37 = !DILocalVariable(name: "dataGoodBuffer", scope: !31, file: !22, line: 52, type: !5)
!38 = !DILocation(line: 51, scope: !31)
!39 = !DILocation(line: 0, scope: !31)
!40 = !DILocation(line: 57, scope: !31)
!41 = !{!42, !42, i64 0}
!42 = !{!"any pointer", !43, i64 0}
!43 = !{!"omnipotent char", !44, i64 0}
!44 = !{!"Simple C/C++ TBAA"}
!45 = !DILocalVariable(name: "source", scope: !46, file: !22, line: 35, type: !54)
!46 = distinct !DILexicalBlock(scope: !47, file: !22, line: 34)
!47 = distinct !DISubprogram(name: "badSink", scope: !22, file: !22, line: 31, type: !32, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !48)
!48 = !{!49, !45, !50, !53}
!49 = !DILocalVariable(name: "data", scope: !47, file: !22, line: 33, type: !5)
!50 = !DILocalVariable(name: "i", scope: !46, file: !22, line: 36, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 18, baseType: !11)
!52 = !DIFile(filename: "Downloads\\clang+llvm-18.1.6-x86_64-pc-windows-msvc\\clang+llvm-18.1.6-x86_64-pc-windows-msvc\\lib\\clang\\18\\include\\__stddef_size_t.h", directory: "C:\\Users\\INSEOK", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!53 = !DILocalVariable(name: "sourceLen", scope: !46, file: !22, line: 36, type: !51)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 176, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 11)
!57 = distinct !DIAssignID()
!58 = !DILocation(line: 0, scope: !46, inlinedAt: !59)
!59 = distinct !DILocation(line: 58, scope: !31)
!60 = !DILocation(line: 0, scope: !47, inlinedAt: !59)
!61 = distinct !DIAssignID()
!62 = !DILocation(line: 42, scope: !63, inlinedAt: !59)
!63 = distinct !DILexicalBlock(scope: !64, file: !22, line: 41)
!64 = distinct !DILexicalBlock(scope: !65, file: !22, line: 40)
!65 = distinct !DILexicalBlock(scope: !46, file: !22, line: 40)
!66 = !{!67, !67, i64 0}
!67 = !{!"short", !43, i64 0}
!68 = !DILocation(line: 44, scope: !46, inlinedAt: !59)
!69 = !DILocation(line: 59, scope: !31)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_45_good", scope: !22, file: !22, line: 96, type: !32, scopeLine: 97, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!71 = !DILocation(line: 87, scope: !72, inlinedAt: !77)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !22, file: !22, line: 83, type: !32, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !73)
!73 = !{!74, !75, !76}
!74 = !DILocalVariable(name: "data", scope: !72, file: !22, line: 85, type: !5)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !22, line: 86, type: !5)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !22, line: 87, type: !5)
!77 = distinct !DILocation(line: 98, scope: !70)
!78 = !DILocation(line: 92, scope: !72, inlinedAt: !77)
!79 = !DILocation(line: 0, scope: !72, inlinedAt: !77)
!80 = !DILocalVariable(name: "source", scope: !81, file: !22, line: 70, type: !54)
!81 = distinct !DILexicalBlock(scope: !82, file: !22, line: 69)
!82 = distinct !DISubprogram(name: "goodG2BSink", scope: !22, file: !22, line: 66, type: !32, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !83)
!83 = !{!84, !80, !85, !86}
!84 = !DILocalVariable(name: "data", scope: !82, file: !22, line: 68, type: !5)
!85 = !DILocalVariable(name: "i", scope: !81, file: !22, line: 71, type: !51)
!86 = !DILocalVariable(name: "sourceLen", scope: !81, file: !22, line: 71, type: !51)
!87 = distinct !DIAssignID()
!88 = !DILocation(line: 0, scope: !81, inlinedAt: !89)
!89 = distinct !DILocation(line: 93, scope: !72, inlinedAt: !77)
!90 = !DILocation(line: 0, scope: !82, inlinedAt: !89)
!91 = distinct !DIAssignID()
!92 = !DILocation(line: 77, scope: !93, inlinedAt: !89)
!93 = distinct !DILexicalBlock(scope: !94, file: !22, line: 76)
!94 = distinct !DILexicalBlock(scope: !95, file: !22, line: 75)
!95 = distinct !DILexicalBlock(scope: !81, file: !22, line: 75)
!96 = !DILocation(line: 79, scope: !81, inlinedAt: !89)
!97 = !DILocation(line: 94, scope: !72, inlinedAt: !77)
!98 = !DILocation(line: 99, scope: !70)
