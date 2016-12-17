; ModuleID = 'vec_add_hard_float.cl'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-uknown"

; Function Attrs: nounwind
define void @add_hard_float(float* nocapture readonly %in1, float* nocapture readonly %in2, float* nocapture %out) #0 {
entry:
  %0 = tail call i32 asm sideeffect "lid $0, $1", "=r,I,~{$1}"(i32 0) #1, !srcloc !7
  %1 = tail call i32 asm sideeffect "wgoff $0, $1", "=r,I,~{$1}"(i32 0) #1, !srcloc !8
  %add.i = add nsw i32 %1, %0
  %arrayidx = getelementptr inbounds float, float* %in1, i32 %add.i
  %2 = load float, float* %arrayidx, align 4, !tbaa !9
  %arrayidx1 = getelementptr inbounds float, float* %in2, i32 %add.i
  %3 = load float, float* %arrayidx1, align 4, !tbaa !9
  %add = fadd float %2, %3
  %arrayidx2 = getelementptr inbounds float, float* %out, i32 %add.i
  store float %add, float* %arrayidx2, align 4, !tbaa !9
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6}

!0 = !{void (float*, float*, float*)* @add_hard_float, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"float*", !"float*", !"float*"}
!4 = !{!"kernel_arg_base_type", !"float*", !"float*", !"float*"}
!5 = !{!"kernel_arg_type_qual", !"", !"", !""}
!6 = !{!"clang version 3.7.0 (tags/RELEASE_371/final)"}
!7 = !{i32 11554}
!8 = !{i32 11694}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
