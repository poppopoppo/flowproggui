%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_9015
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	ret
NS_E_9007:
NS_E_RDI_9007:
NS_E_9007_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_9008
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_9008:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9009:
NS_E_RDI_9009:
NS_E_9009_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_9009_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_9009_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9010:
NS_E_RDI_9010:
NS_E_9010_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_9010_LB_0
	cmp r11,57
	ja NS_E_9010_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9010_LB_0:
	mov rax,0
	ret
NS_E_9012:
NS_E_RDI_9012:
NS_E_9012_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_9012_LB_0
	cmp r11,122
	ja NS_E_9012_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9012_LB_0:
	mov rax,0
	ret
NS_E_9011:
NS_E_RDI_9011:
NS_E_9011_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_9011_LB_0
	cmp r11,90
	ja NS_E_9011_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9011_LB_0:
	mov rax,0
	ret
NS_E_18:
NS_E_RDI_18:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_22:
	mov rdi,r8
	bt r12,0
NS_E_RDI_22:
	mov rsi,0
	setc sil
	push rsi
	call pp_v
	push rax
	push rdi
	mov rdi,2
	call mlc
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	pop rsi
	btr QWORD [rax],0
	btr QWORD [rax],1
	or QWORD [rax],rsi
	clc
	ret
NS_E_9015:
NS_E_RDI_9015:
; _f14 {  } ⊢ %_9013 : %_9013
 ; {>  }
; _f14 {  } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; _f15 %_9013 ⊢ %_9014 : %_9014
 ; {>  %_9013~0':_stg }
; _f15 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_9014~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_9016
	mov rdi,r13
	call dlt
LB_9016:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_9007:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9007
	NS_E_DYN_9009:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9009
	NS_E_DYN_9010:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9010
	NS_E_DYN_9011:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9011
	NS_E_DYN_9012:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9012
	CST_DYN_9015:
		dq 0x0001_0001_00_82_ffff
		dq 1
