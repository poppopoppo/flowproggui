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
ETR_25: ; fact 0t' ⊢ 0t' : (_r64→_r64)
;; rsp=0 , %0~0t' 
	mov rdi,0
	cmp r13,rdi
	jnz LB_0
;; rsp=0 , %0~0t' 
; ∎ %[ 1r ]
; .mov_ptn2 %[ 1r ] ⊢ 0t'
; .mov_ptn %[ 1r ] ⊢ 0t'
	mov r13,1
	ret
LB_0:
	mov rdi,1
	cmp r13,rdi
	jnz LB_1
;; rsp=0 , %0~0t' 
; ∎ %[ 1r ]
; .mov_ptn2 %[ 1r ] ⊢ 0t'
; .mov_ptn %[ 1r ] ⊢ 0t'
	mov r13,1
	ret
LB_1:
;; rsp=0 , %0~0t' 
; $ 0t' ⊢ 0t',1t'
	mov r14,r13
;; rsp=0 , %2~1t' %1~0t' 
; _sub 0t' ⊢ 0t'
	sub r13,1
;; rsp=0 , %3~0t' %2~1t' 
; #25 0t' ⊢ 0t'
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0t' ⊢ 0t'
	mov r14,r13
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
	call ETR_25
	mov r14,[rsp+8*0]
	lea rsp,[rsp+8*1]
;; rsp=0 , %4~0t' %2~1t' 
; _imul { 1t' 0t' } ⊢ { 1t' 0t' }
	imul r14,r13
;; rsp=0 , %6~0t' %5~1t' 
; ∎ 1t'
; .mov_ptn2 1t' ⊢ 0t'
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
	ret
ETR_26: ; tak { 0t' 1t' 2t' } ⊢ 0t' : ({ _r64 _r64 _r64 }→_r64)
;; rsp=0 , %9~2t' %8~1t' %7~0t' 
	mov rdi,r14
	cmp r13,rdi
	jg LB_2
;; rsp=0 , %9~2t' %8~1t' %7~0t' 
; ∎ 2t'
; .mov_ptn2 2t' ⊢ 0t'
; .mov_ptn 2t' ⊢ 0t'
	mov r13,r8
	ret
LB_2:
;; rsp=0 , %9~2t' %8~1t' %7~0t' 
; $ 0t' ⊢ 0t',3t'
	mov r9,r13
;; rsp=0 , %11~3t' %10~0t' %9~2t' %8~1t' 
; $ 1t' ⊢ 1t',4t'
	mov r10,r14
;; rsp=0 , %13~4t' %12~1t' %11~3t' %10~0t' %9~2t' 
; $ 2t' ⊢ 2t',5t'
	mov r11,r8
;; rsp=0 , %15~5t' %14~2t' %13~4t' %12~1t' %11~3t' %10~0t' 
; _sub 3t' ⊢ 3t'
	sub r9,1
;; rsp=0 , %16~3t' %15~5t' %14~2t' %13~4t' %12~1t' %10~0t' 
; #26 { 3t' 4t' 5t' } ⊢ 3t'
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 { 3t' 4t' 5t' } ⊢ { 0t' 1t' 2t' }
; .mov_ptn 5t' ⊢ 2t'
	mov r8,r11
; .mov_ptn 4t' ⊢ 1t'
	mov r14,r10
; .mov_ptn 3t' ⊢ 0t'
	mov r13,r9
	call ETR_26
	mov r9,r13
	mov r13,[rsp+8*0]
	mov r14,[rsp+8*1]
	mov r8,[rsp+8*2]
	lea rsp,[rsp+8*3]
;; rsp=0 , %17~3t' %14~2t' %12~1t' %10~0t' 
; $ 0t' ⊢ 0t',4t'
	mov r10,r13
;; rsp=0 , %19~4t' %18~0t' %17~3t' %14~2t' %12~1t' 
; $ 1t' ⊢ 1t',5t'
	mov r11,r14
;; rsp=0 , %21~5t' %20~1t' %19~4t' %18~0t' %17~3t' %14~2t' 
; $ 2t' ⊢ 2t',6t'
	mov rcx,r8
;; rsp=0 , %23~6t' %22~2t' %21~5t' %20~1t' %19~4t' %18~0t' %17~3t' 
; _sub 5t' ⊢ 5t'
	sub r11,1
;; rsp=0 , %24~5t' %23~6t' %22~2t' %20~1t' %19~4t' %18~0t' %17~3t' 
; #26 { 5t' 6t' 4t' } ⊢ 4t'
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
; .mov_ptn2 { 5t' 6t' 4t' } ⊢ { 0t' 1t' 2t' }
; .mov_ptn 4t' ⊢ 2t'
	mov r8,r10
; .mov_ptn 6t' ⊢ 1t'
	mov r14,rcx
; .mov_ptn 5t' ⊢ 0t'
	mov r13,r11
	call ETR_26
	mov r10,r13
	mov r13,[rsp+8*0]
	mov r14,[rsp+8*1]
	mov r8,[rsp+8*2]
	mov r9,[rsp+8*3]
	lea rsp,[rsp+8*4]
;; rsp=0 , %25~4t' %22~2t' %20~1t' %18~0t' %17~3t' 
; _sub 2t' ⊢ 2t'
	sub r8,1
;; rsp=0 , %26~2t' %25~4t' %20~1t' %18~0t' %17~3t' 
; #26 { 2t' 0t' 1t' } ⊢ 0t'
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 2t' 0t' 1t' } ⊢ { 0t' 1t' 2t' }
	mov r9,r8
; .mov_ptn 1t' ⊢ 2t'
	mov r8,r14
; .mov_ptn 0t' ⊢ 1t'
	mov r14,r13
; .mov_ptn 3t' ⊢ 0t'
	mov r13,r9
	call ETR_26
	mov r9,[rsp+8*0]
	mov r10,[rsp+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %27~0t' %25~4t' %17~3t' 
; #26 { 3t' 4t' 0t' } ⊢ 0t'
; .mov_ptn2 { 3t' 4t' 0t' } ⊢ { 0t' 1t' 2t' }
; .mov_ptn 0t' ⊢ 2t'
	mov r8,r13
; .mov_ptn 4t' ⊢ 1t'
	mov r14,r10
; .mov_ptn 3t' ⊢ 0t'
	mov r13,r9
	call ETR_26
;; rsp=0 , %28~0t' 
; ∎ 0t'
; .mov_ptn2 0t' ⊢ 0t'
	mov r14,r13
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
	ret
ETR_27: ; tak_v { 0t' 1t' 2t' } ⊢ { 0t' 1t' 2t' 3t' } : ({ _r64 _r64 _r64 }→{ _r64 _r64 _r64 _r64 })
;; rsp=0 , %31~2t' %30~1t' %29~0t' 
	mov rdi,r14
	cmp r13,rdi
	jg LB_3
;; rsp=0 , %31~2t' %30~1t' %29~0t' 
; $ 2t' ⊢ 2t',3t'
	mov r9,r8
;; rsp=0 , %55~3t' %54~2t' %30~1t' %29~0t' 
; ∎ { 0t' 1t' 2t' 3t' }
; .mov_ptn2 { 0t' 1t' 2t' 3t' } ⊢ { 0t' 1t' 2t' 3t' }
	mov r10,r9
; .mov_ptn 4t' ⊢ 3t'
	mov r9,r10
	mov r11,r8
; .mov_ptn 5t' ⊢ 2t'
	mov r8,r11
	mov rcx,r14
; .mov_ptn 6t' ⊢ 1t'
	mov r14,rcx
	mov rdx,r13
; .mov_ptn 7t' ⊢ 0t'
	mov r13,rdx
	ret
LB_3:
;; rsp=0 , %31~2t' %30~1t' %29~0t' 
; _sub 0t' ⊢ 0t'
	sub r13,1
;; rsp=0 , %32~0t' %31~2t' %30~1t' 
; #27 { 0t' 1t' 2t' } ⊢ { 0t' 1t' 2t' 3t' }
; .mov_ptn2 { 0t' 1t' 2t' } ⊢ { 0t' 1t' 2t' }
	mov r9,r8
; .mov_ptn 3t' ⊢ 2t'
	mov r8,r9
	mov r10,r14
; .mov_ptn 4t' ⊢ 1t'
	mov r14,r10
	mov r11,r13
; .mov_ptn 5t' ⊢ 0t'
	mov r13,r11
	call ETR_27
;; rsp=0 , %36~3t' %35~2t' %34~1t' %33~0t' 
; _inc 0t' ⊢ 0t'
	add r13,1
;; rsp=0 , %37~0t' %36~3t' %35~2t' %34~1t' 
; _sub 1t' ⊢ 1t'
	sub r14,1
;; rsp=0 , %38~1t' %37~0t' %36~3t' %35~2t' 
; #27 { 1t' 2t' 0t' } ⊢ { 0t' 1t' 2t' 4t' }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r9
; .mov_ptn2 { 1t' 2t' 0t' } ⊢ { 0t' 1t' 2t' }
	mov r9,r8
; .mov_ptn 0t' ⊢ 2t'
	mov r8,r13
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
; .mov_ptn 3t' ⊢ 1t'
	mov r14,r9
	call ETR_27
	mov r10,r9
	mov r9,[rsp+8*0]
	lea rsp,[rsp+8*1]
;; rsp=0 , %42~4t' %41~2t' %40~1t' %39~0t' %36~3t' 
; _inc 0t' ⊢ 0t'
	add r13,1
;; rsp=0 , %43~0t' %42~4t' %41~2t' %40~1t' %36~3t' 
; _sub 1t' ⊢ 1t'
	sub r14,1
;; rsp=0 , %44~1t' %43~0t' %42~4t' %41~2t' %36~3t' 
; #27 { 1t' 2t' 0t' } ⊢ { 0t' 1t' 2t' 5t' }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 1t' 2t' 0t' } ⊢ { 0t' 1t' 2t' }
	mov r9,r8
; .mov_ptn 0t' ⊢ 2t'
	mov r8,r13
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
; .mov_ptn 3t' ⊢ 1t'
	mov r14,r9
	call ETR_27
	mov r11,r9
	mov r9,[rsp+8*0]
	mov r10,[rsp+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %48~5t' %47~2t' %46~1t' %45~0t' %42~4t' %36~3t' 
; _inc 0t' ⊢ 0t'
	add r13,1
;; rsp=0 , %49~0t' %48~5t' %47~2t' %46~1t' %42~4t' %36~3t' 
; #27 { 3t' 4t' 5t' } ⊢ { 4t' 5t' 6t' 3t' }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 { 3t' 4t' 5t' } ⊢ { 0t' 1t' 2t' }
; .mov_ptn 5t' ⊢ 2t'
	mov r8,r11
; .mov_ptn 4t' ⊢ 1t'
	mov r14,r10
; .mov_ptn 3t' ⊢ 0t'
	mov r13,r9
	call ETR_27
	mov r10,r13
	mov r13,[rsp+8*0]
	mov r11,r14
	mov r14,[rsp+8*1]
	mov rcx,r8
	mov r8,[rsp+8*2]
	lea rsp,[rsp+8*3]
;; rsp=0 , %53~3t' %52~6t' %51~5t' %50~4t' %49~0t' %47~2t' %46~1t' 
; ∎ { 1t' 2t' 0t' 3t' }
; .mov_ptn2 { 1t' 2t' 0t' 3t' } ⊢ { 0t' 1t' 2t' 3t' }
	mov r10,r9
; .mov_ptn 4t' ⊢ 3t'
	mov r9,r10
	mov r11,r8
; .mov_ptn 0t' ⊢ 2t'
	mov r8,r13
; .mov_ptn 1t' ⊢ 0t'
	mov r13,r14
; .mov_ptn 5t' ⊢ 1t'
	mov r14,r11
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; #25 %[ 5r ] ⊢ 0t'
; .mov_ptn2 %[ 5r ] ⊢ 0t'
; .mov_ptn %[ 5r ] ⊢ 0t'
	mov r13,5
	call ETR_25
;; rsp=0 , %56~0t' 
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
;; rsp=0 , %57~0t' 
; #27 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 4t' 1t' 2t' 3t' }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { %[ 20r ] %[ 10r ] %[ 0r ] } ⊢ { 0t' 1t' 2t' }
; .mov_ptn %[ 0r ] ⊢ 2t'
	mov r8,0
; .mov_ptn %[ 10r ] ⊢ 1t'
	mov r14,10
; .mov_ptn %[ 20r ] ⊢ 0t'
	mov r13,20
	call ETR_27
	mov r10,r13
	mov r13,[rsp+8*0]
	lea rsp,[rsp+8*1]
;; rsp=0 , %61~3t' %60~2t' %59~1t' %58~4t' %57~0t' 
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
;; rsp=0 , %62~3t' %60~2t' %59~1t' %58~4t' %57~0t' 
; ∎ { }
; .mov_ptn2 { } ⊢ { }
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
