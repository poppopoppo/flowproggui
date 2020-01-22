bits 64 
extern exit 
section .bss 
	ret_vct: resq 64
section .text
global _start              
_start:
	jmp RTM_0
ETR_24: ; f0 0t' ⊢ 0t' : (_r64→_r64)
; _inc 0t' ⊢ 0t'
	add r13,1
; ∎ 0t'
; .mov_ptn 0t' ⊢ 0t'
	mov r14,r13
	mov r13,r14
	ret
ETR_25: ; f1 { 0t' 1t' } ⊢ { 0t' 1t' } : ({ _r64 _r64 }→{ _r64 _r64 })
; _inc 0t' ⊢ 0t'
	add r13,1
; _inc 1t' ⊢ 1t'
	add r14,1
; _inc 1t' ⊢ 1t'
	add r14,1
; ∎ { 0t' 1t' }
; .mov_ptn { 0t' 1t' } ⊢ { 0t' 1t' }
	mov r8,r13
	mov r9,r14
	mov r13,r8
	mov r14,r9
	ret
RTM_0:
	push RTM_1
; $ %[ 0r ] ⊢ %[ 0r ]
; _inc %[ 0r ] ⊢ 0t'
	mov r13,1
; #24 0t' ⊢ 0t'
	lea rsp,[rsp-8*0]
	lea rsp,[rsp-8*0]
; .mov_ptn 0t' ⊢ 0t'
	mov r14,r13
	mov r13,r14
	call ETR_24
; $ %[ 3r ] ⊢ %[ 3r ]
; #25 { 0t' %[ 3r ] } ⊢ { 0t' 1t' }
	lea rsp,[rsp-8*0]
	lea rsp,[rsp-8*0]
; .mov_ptn { 0t' %[ 3r ] } ⊢ { 0t' 1t' }
	mov r8,r13
	mov r13,r8
	call ETR_25
; ∎ { }
; .mov_ptn { } ⊢ { }
	ret
RTM_1:
	mov rdi,0
	mov QWORD rdi,rsp
	and rsp,~0xf
	push rdi
	call exit
	pop rdi
	mov rsp,rdi
