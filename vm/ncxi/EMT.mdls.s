bits 64 
extern exit 
extern printf 
section .bss 
	ret_vct: resq 64
 rsp_tmp: resq 1
section .data
	err_n: dq 0
	fmt_err_line: db "err:%d",10,0
	fmt_r64: db "%dr",10,0
section .text
global _start              
_start:
	jmp RTM_0
ETR_25: ; f0 { 0t' 1t' 2t' 3t' 4t' 5t' 6t' } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
;; rsp=0 , %6~6t' %5~5t' %4~4t' %3~3t' %2~2t' %1~1t' %0~0t' 
; ∎ { 5t' 3t' 6t' 2t' 0t' 1t' 4t' }
; .mov_ptn2 { 5t' 3t' 6t' 2t' 0t' 1t' 4t' } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' }
	mov rdx,rcx
; .mov_ptn 4t' ⊢ 6t'
	mov rcx,r10
	lea rsp,[rsp-8*1]
	mov QWORD [rsp-8+8*1],r11
; .mov_ptn 1t' ⊢ 5t'
	mov r11,r14
; .mov_ptn 0t' ⊢ 4t'
	mov r10,r13
	lea rsp,[rsp-8*1]
	mov QWORD [rsp-8+8*1],r9
; .mov_ptn 2t' ⊢ 3t'
	mov r9,r8
; .mov_ptn 7t' ⊢ 2t'
	mov r8,rdx
; .mov_ptn 9t' ⊢ 1t'
	mov r14,QWORD [rsp-8+8*1]
; .mov_ptn 8t' ⊢ 0t'
	mov r13,QWORD [rsp-8+8*2]
	lea rsp,[rsp+8*2]
	ret
ETR_26: ; f1 0t' ⊢ 0t' : (_r64→_r64)
;; rsp=0 , %7~0t' 
; ∎ 0t'
; .mov_ptn2 0t' ⊢ 0t'
	ret
ETR_27: ; f2 { 0t' 1t' 2t' } ⊢ { 0t' 1t' 2t' } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %10~2t' %9~1t' %8~0t' 
; ∎ { 1t' 2t' 0t' }
; .mov_ptn2 { 1t' 2t' 0t' } ⊢ { 0t' 1t' 2t' }
	mov r9,r8
; .mov_ptn 0t' ⊢ 2t'
	mov r8,r13
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
; .mov_ptn 3t' ⊢ 1t'
	mov r14,r9
	ret
ETR_28: ; f3 { } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 8t' } : ({ }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
;; rsp=0 , 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %11~%[ 0r ] 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 2r ] ⊢ %[ 2r ]
;; rsp=0 , %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 5r ] ⊢ %[ 5r ]
;; rsp=0 , %16~%[ 5r ] %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 6r ] ⊢ %[ 6r ]
;; rsp=0 , %17~%[ 6r ] %16~%[ 5r ] %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 7r ] ⊢ %[ 7r ]
;; rsp=0 , %18~%[ 7r ] %17~%[ 6r ] %16~%[ 5r ] %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 8r ] ⊢ %[ 8r ]
;; rsp=0 , %19~%[ 8r ] %18~%[ 7r ] %17~%[ 6r ] %16~%[ 5r ] %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %20~%[ 9r ] %19~%[ 8r ] %18~%[ 7r ] %17~%[ 6r ] %16~%[ 5r ] %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %21~%[ 10r ] %20~%[ 9r ] %19~%[ 8r ] %18~%[ 7r ] %17~%[ 6r ] %16~%[ 5r ] %15~%[ 4r ] %14~%[ 3r ] %13~%[ 2r ] %12~%[ 1r ] %11~%[ 0r ] 
; ∎ { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] %[ 7r ] %[ 8r ] }
	lea rsp,[rsp-8*1]
; .mov_ptn2 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] %[ 7r ] %[ 8r ] } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 8t' }
; .mov_ptn %[ 8r ] ⊢ 8t'
	mov QWORD [rsp-8+8*1],8
; .mov_ptn %[ 7r ] ⊢ 7t'
	mov rdx,7
; .mov_ptn %[ 6r ] ⊢ 6t'
	mov rcx,6
; .mov_ptn %[ 5r ] ⊢ 5t'
	mov r11,5
; .mov_ptn %[ 4r ] ⊢ 4t'
	mov r10,4
; .mov_ptn %[ 3r ] ⊢ 3t'
	mov r9,3
; .mov_ptn %[ 2r ] ⊢ 2t'
	mov r8,2
; .mov_ptn %[ 1r ] ⊢ 1t'
	mov r14,1
; .mov_ptn %[ 0r ] ⊢ 0t'
	mov r13,0
	push QWORD [rsp+8*1]
	ret
ETR_29: ; f4 { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 8t' 9t' } ⊢ { } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ })
	pop rax
;; rsp=2 , %31~9t' %30~8t' %29~7t' %28~6t' %27~5t' %26~4t' %25~3t' %24~2t' %23~1t' %22~0t' 
; ∎ { }
; .mov_ptn2 { } ⊢ { }
	lea rsp,[rsp+8*2]
	ret
ETR_30: ; f5 { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 8t' 9t' } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 8t' 9t' } : ({ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 _r64 })
	pop rax
;; rsp=2 , %41~9t' %40~8t' %39~7t' %38~6t' %37~5t' %36~4t' %35~3t' %34~2t' %33~1t' %32~0t' 
; ∎ { 5t' 3t' 9t' 7t' 8t' 0t' 1t' 6t' 4t' 2t' }
; .mov_ptn2 { 5t' 3t' 9t' 7t' 8t' 0t' 1t' 6t' 4t' 2t' } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 8t' 9t' }
	lea rsp,[rsp-8*1]
	mov rdi,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*1],rdi
; .mov_ptn 2t' ⊢ 9t'
	mov QWORD [rsp-8+8*2],r8
	lea rsp,[rsp-8*1]
	mov rdi,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*1],rdi
; .mov_ptn 4t' ⊢ 8t'
	mov QWORD [rsp-8+8*4],r10
	lea rsp,[rsp-8*1]
	mov QWORD [rsp-8+8*1],rdx
; .mov_ptn 6t' ⊢ 7t'
	mov rdx,rcx
; .mov_ptn 1t' ⊢ 6t'
	mov rcx,r14
	lea rsp,[rsp-8*1]
	mov QWORD [rsp-8+8*1],r11
; .mov_ptn 0t' ⊢ 5t'
	mov r11,r13
; .mov_ptn 11t' ⊢ 4t'
	mov r10,QWORD [rsp-8+8*3]
	lea rsp,[rsp-8*1]
	mov QWORD [rsp-8+8*1],r9
; .mov_ptn 12t' ⊢ 3t'
	mov r9,QWORD [rsp-8+8*3]
; .mov_ptn 10t' ⊢ 2t'
	mov r8,QWORD [rsp-8+8*5]
; .mov_ptn 14t' ⊢ 1t'
	mov r14,QWORD [rsp-8+8*1]
; .mov_ptn 13t' ⊢ 0t'
	mov r13,QWORD [rsp-8+8*2]
	lea rsp,[rsp+8*5]
	push QWORD [rsp+8*2]
	ret
ETR_31: ; f6 { 0t' 1t' } ⊢ { 0t' 1t' } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %43~1t' %42~0t' 
; _imul { 0t' 1t' } ⊢ { 0t' 1t' }
	imul r13,r14
; ∎ { 0t' 1t' }
; .mov_ptn2 { 0t' 1t' } ⊢ { 0t' 1t' }
	ret
ETR_32: ; f7 { 0t' 1t' } ⊢ { 0t' 1t' } : ({ _r64 _r64 }→{ _r64 _r64 })
;; rsp=0 , %45~1t' %44~0t' 
; _imul { 0t' 1t' } ⊢ { 0t' 1t' }
	imul r13,r14
;; rsp=0 , %47~1t' %46~0t' 
; ∎ { 0t' 1t' }
; .mov_ptn2 { 0t' 1t' } ⊢ { 0t' 1t' }
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %48~%[ 0r ] 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 2r ] ⊢ %[ 2r ]
;; rsp=0 , %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 5r ] ⊢ %[ 5r ]
;; rsp=0 , %53~%[ 5r ] %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 6r ] ⊢ %[ 6r ]
;; rsp=0 , %54~%[ 6r ] %53~%[ 5r ] %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 7r ] ⊢ %[ 7r ]
;; rsp=0 , %55~%[ 7r ] %54~%[ 6r ] %53~%[ 5r ] %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 8r ] ⊢ %[ 8r ]
;; rsp=0 , %56~%[ 8r ] %55~%[ 7r ] %54~%[ 6r ] %53~%[ 5r ] %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %57~%[ 9r ] %56~%[ 8r ] %55~%[ 7r ] %54~%[ 6r ] %53~%[ 5r ] %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %58~%[ 10r ] %57~%[ 9r ] %56~%[ 8r ] %55~%[ 7r ] %54~%[ 6r ] %53~%[ 5r ] %52~%[ 4r ] %51~%[ 3r ] %50~%[ 2r ] %49~%[ 1r ] %48~%[ 0r ] 
; rsp_d=0, #25 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' }
; .mov_ptn2 { %[ 0r ] %[ 1r ] %[ 2r ] %[ 3r ] %[ 4r ] %[ 5r ] %[ 6r ] } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' }
; .mov_ptn %[ 6r ] ⊢ 6t'
	mov rcx,6
; .mov_ptn %[ 5r ] ⊢ 5t'
	mov r11,5
; .mov_ptn %[ 4r ] ⊢ 4t'
	mov r10,4
; .mov_ptn %[ 3r ] ⊢ 3t'
	mov r9,3
; .mov_ptn %[ 2r ] ⊢ 2t'
	mov r8,2
; .mov_ptn %[ 1r ] ⊢ 1t'
	mov r14,1
; .mov_ptn %[ 0r ] ⊢ 0t'
	mov r13,0
	call ETR_25
;; rsp=0 , %65~6t' %64~5t' %63~4t' %62~3t' %61~2t' %60~1t' %59~0t' %58~%[ 10r ] %57~%[ 9r ] %56~%[ 8r ] %55~%[ 7r ] 
; rsp_d=0, #27 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 9t' 8t' 7t' }
	lea rsp,[rsp-8*7]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
; .mov_ptn2 { %[ 8r ] %[ 9r ] %[ 10r ] } ⊢ { 0t' 1t' 2t' }
; .mov_ptn %[ 10r ] ⊢ 2t'
	mov r8,10
; .mov_ptn %[ 9r ] ⊢ 1t'
	mov r14,9
; .mov_ptn %[ 8r ] ⊢ 0t'
	mov r13,8
	call ETR_27
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov rax,QWORD [rsp-8+8*3]
	mov rdx,r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*7],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=2 , %68~7t' %67~8t' %66~9t' %65~6t' %64~5t' %63~4t' %62~3t' %61~2t' %60~1t' %59~0t' %55~%[ 7r ] 
; rsp_d=0, #27 { %[ 7r ] 4t' 2t' } ⊢ { 10t' 4t' 2t' }
	lea rsp,[rsp-8*6]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 { %[ 7r ] 4t' 2t' } ⊢ { 0t' 1t' 2t' }
; .mov_ptn 4t' ⊢ 1t'
	mov r14,r10
; .mov_ptn %[ 7r ] ⊢ 0t'
	mov r13,7
	call ETR_27
	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov rax,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=3 , %71~2t' %70~4t' %69~10t' %68~7t' %67~8t' %66~9t' %65~6t' %64~5t' %62~3t' %60~1t' %59~0t' 
; #28 { } ⊢ { 18t' 17t' 16t' 15t' 14t' 13t' 12t' 11t' 20t' } / { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 20t' }
	lea rsp,[rsp-8*8]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { } ⊢ { }
	call ETR_28
	mov rax,QWORD [rsp-8+8*10]
	mov QWORD [rsp-8+8*10],rdx
	mov rdx,rax
	mov rax,QWORD [rsp-8+8*9]
	mov QWORD [rsp-8+8*9],rcx
	mov rcx,rax
	mov rax,QWORD [rsp-8+8*8]
	mov QWORD [rsp-8+8*8],r11
	mov r11,rax
	mov rax,QWORD [rsp-8+8*7]
	mov QWORD [rsp-8+8*7],r10
	mov r10,rax
	mov rax,QWORD [rsp-8+8*6]
	mov QWORD [rsp-8+8*6],r9
	mov r9,rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [rsp-8+8*5],r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*4],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*3],r13
	mov r13,rax
;; rsp=13 , %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %75~15t' %74~16t' %73~17t' %72~18t' %71~2t' %70~4t' %69~10t' %68~7t' %67~8t' %66~9t' %65~6t' %64~5t' %62~3t' %60~1t' %59~0t' 
; rsp_d=0, #29 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { }
	lea rsp,[rsp-8*8]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
	push LB_0
	lea rsp,[rsp-8*2]
; .mov_ptn2 { %[ 1r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] %[ 0r ] } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 30t' 31t' }
; .mov_ptn %[ 0r ] ⊢ 31t'
	mov QWORD [rsp-8+8*1],0
; .mov_ptn %[ 0r ] ⊢ 30t'
	mov QWORD [rsp-8+8*2],0
; .mov_ptn %[ 0r ] ⊢ 7t'
	mov rdx,0
; .mov_ptn %[ 0r ] ⊢ 6t'
	mov rcx,0
; .mov_ptn %[ 0r ] ⊢ 5t'
	mov r11,0
; .mov_ptn %[ 0r ] ⊢ 4t'
	mov r10,0
; .mov_ptn %[ 0r ] ⊢ 3t'
	mov r9,0
; .mov_ptn %[ 0r ] ⊢ 2t'
	mov r8,0
; .mov_ptn %[ 0r ] ⊢ 1t'
	mov r14,0
; .mov_ptn %[ 1r ] ⊢ 0t'
	mov r13,1
	call ETR_29
LB_0:
	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r13,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*8]
;; rsp=13 , %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %75~15t' %74~16t' %73~17t' %72~18t' %71~2t' %70~4t' %69~10t' %68~7t' %67~8t' %66~9t' %65~6t' %64~5t' %62~3t' %60~1t' %59~0t' 
; #30 { 18t' 10t' 15t' 9t' 6t' 2t' 17t' 16t' 8t' 7t' } ⊢ { 16t' 15t' 2t' 10t' 9t' 8t' 6t' 7t' 27t' 28t' } / { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 27t' 28t' }
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*4],r11
	push LB_1
	lea rsp,[rsp-8*2]
; .mov_ptn2 { 18t' 10t' 15t' 9t' 6t' 2t' 17t' 16t' 8t' 7t' } ⊢ { 0t' 1t' 2t' 3t' 4t' 5t' 6t' 7t' 27t' 28t' }
; .mov_ptn 7t' ⊢ 28t'
	mov QWORD [rsp-8+8*1],rdx
; .mov_ptn 8t' ⊢ 27t'
	mov rdi,QWORD [rsp-8+8*21]
	mov QWORD [rsp-8+8*2],rdi
; .mov_ptn 16t' ⊢ 7t'
	mov rdx,QWORD [rsp-8+8*13]
	mov QWORD [rsp-8+8*18],rcx
; .mov_ptn 17t' ⊢ 6t'
	mov rcx,QWORD [rsp-8+8*12]
; .mov_ptn 2t' ⊢ 5t'
	mov r11,r8
; .mov_ptn 11t' ⊢ 4t'
	mov r10,QWORD [rsp-8+8*18]
; .mov_ptn 9t' ⊢ 3t'
	mov r9,QWORD [rsp-8+8*20]
; .mov_ptn 15t' ⊢ 2t'
	mov r8,QWORD [rsp-8+8*14]
; .mov_ptn 10t' ⊢ 1t'
	mov r14,QWORD [rsp-8+8*19]
; .mov_ptn 18t' ⊢ 0t'
	mov r13,QWORD [rsp-8+8*11]
	call ETR_30
LB_1:
	mov rax,QWORD [rsp-8+8*8]
	mov QWORD [rsp-8+8*21],r11
	mov r11,rax
	mov rax,QWORD [rsp-8+8*7]
	mov QWORD [rsp-8+8*20],r10
	mov r10,rax
	mov rax,QWORD [rsp-8+8*6]
	mov QWORD [rsp-8+8*19],r9
	mov r9,rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [rsp-8+8*14],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [rsp-8+8*13],r13
	mov r13,rax
;; rsp=21 , %90~28t' %89~27t' %88~7t' %87~6t' %86~8t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %70~4t' %64~5t' %62~3t' %60~1t' %59~0t' 
	mov rsi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %86~8t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %70~4t' %64~5t' %62~3t' %60~1t' 
	mov rsi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %86~8t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %70~4t' %64~5t' %62~3t' 
	mov rsi,QWORD [rsp-8+8*21]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %70~4t' %64~5t' %62~3t' 
	mov rsi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %70~4t' %64~5t' 
	mov rsi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' %64~5t' 
	mov rsi,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %85~9t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,QWORD [rsp-8+8*20]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %84~10t' %83~2t' %82~15t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,QWORD [rsp-8+8*14]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %84~10t' %83~2t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,QWORD [rsp-8+8*19]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %89~27t' %88~7t' %87~6t' %83~2t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %100~27t' %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %90~28t' %88~7t' %87~6t' %83~2t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,QWORD [rsp-8+8*1]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %101~28t' %100~27t' %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %88~7t' %87~6t' %83~2t' %81~16t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,QWORD [rsp-8+8*13]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %102~16t' %101~28t' %100~27t' %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %88~7t' %87~6t' %83~2t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,rcx
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %103~6t' %102~16t' %101~28t' %100~27t' %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %88~7t' %83~2t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,rdx
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %104~7t' %103~6t' %102~16t' %101~28t' %100~27t' %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %83~2t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
	mov rsi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
;; rsp=21 , %105~2t' %104~7t' %103~6t' %102~16t' %101~28t' %100~27t' %99~10t' %98~15t' %97~9t' %96~5t' %95~4t' %94~3t' %93~8t' %92~1t' %91~0t' %80~20t' %79~11t' %78~12t' %77~13t' %76~14t' 
; ∎ { }
; .mov_ptn2 { } ⊢ { }
	lea rsp,[rsp+8*21]
	ret
RTM_1:
	mov rdi,0
	mov QWORD rdi,rsp
	and rsp,~0xf
	push rdi
	call exit
	pop rdi
	mov rsp,rdi

err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rax,1
	mov rbx,0
	int 0x80
