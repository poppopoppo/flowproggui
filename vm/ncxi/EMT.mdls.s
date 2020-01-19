section .text
global _start              
_start:
	jmp RTM_0
RTM_0:
	push RTM_1
; $ .. ⊢ ..
; _inc .. ⊢ .. 
; ∎ ..
	ret
RTM_1:
	mov rdi,0
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call exit
	mov rsp,QWORD [rsp_tmp]
