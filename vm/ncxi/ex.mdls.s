%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
	call emt_q
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
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_71
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_71:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_73_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_73_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_74:
NS_E_RDI_74:
NS_E_74_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_74_LB_0
	cmp r11,57
	ja NS_E_74_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_74_LB_0:
	mov rax,0
	ret
NS_E_76:
NS_E_RDI_76:
NS_E_76_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_76_LB_0
	cmp r11,122
	ja NS_E_76_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_76_LB_0:
	mov rax,0
	ret
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_75_LB_0
	cmp r11,90
	ja NS_E_75_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_75_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r8
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,r15
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,r15
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r15,rax
	bts r12,2
	ret
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_72_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_72_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_84:
; 	|» 0'
NS_E_RDI_84:
; /0
;Eq_Agl
;Eq_Agl
;Eq_Agl
; mtc x 1;Eq_Agl
;Eq_Agl
; mtc x 1MTC_LB_95:
; ∎ {  }
 ; {>  %_80~1':t48'(-1) %_77~0':(_lst)◂(t48'(-1)) %_78~3':t48'(-1) %_81~2':(_lst)◂(t48'(-1)) }
; 	∎ {  }
	bt r12,1
	jc LB_85
	mov rdi,r14
	call dlt
LB_85:
	bt r12,0
	jc LB_86
	mov rdi,r13
	call dlt
LB_86:
	bt r12,3
	jc LB_87
	mov rdi,r8
	call dlt
LB_87:
	bt r12,2
	jc LB_88
	mov rdi,r15
	call dlt
LB_88:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_94:
; ∎ {  }
 ; {>  %_83~1':(_lst)◂(t48'(-1)) %_77~0':(_lst)◂(t48'(-1)) %_82~2':t48'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_89
	mov rdi,r14
	call dlt
LB_89:
	bt r12,0
	jc LB_90
	mov rdi,r13
	call dlt
LB_90:
	bt r12,2
	jc LB_91
	mov rdi,r15
	call dlt
LB_91:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_93:
; ∎ {  }
 ; {>  %_77~0':(_lst)◂(t48'(-1)) }
; 	∎ {  }
	bt r12,0
	jc LB_92
	mov rdi,r13
	call dlt
LB_92:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_70:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_70
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	NS_E_DYN_74:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_74
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_76:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_76
	NS_E_DYN_84:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_84
