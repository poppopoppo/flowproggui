%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_79
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
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
NS_E_68:
NS_E_RDI_68:
NS_E_68_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_68_LB_0
	bt r11,7
	jc LB_69
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,1
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_69:
	add rsi,1
	bt r11,6
	jc LB_70
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,2
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_70:
	add rsi,1
	bt r11,5
	jc LB_71
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,3
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_71:
	add rsi,1
	bt r11,5
	jc LB_71
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,4
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11b,[rdi+rsi+8*1+3]
	mov BYTE [r10+8*1+3],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
	add rsi,1
	mov rax,1
	ret
NS_E_68_LB_0:
	mov rax,0
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_72_LB_0
	cmp r11,57
	ja NS_E_72_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_72_LB_0:
	mov rax,0
	ret
NS_E_74:
NS_E_RDI_74:
NS_E_74_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_74_LB_0
	cmp r11,122
	ja NS_E_74_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_74_LB_0:
	mov rax,0
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_73_LB_0
	cmp r11,90
	ja NS_E_73_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_73_LB_0:
	mov rax,0
	ret
NS_E_17:
NS_E_RDI_17:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_21:
	mov rdi,r8
	bt r12,0
NS_E_RDI_21:
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
NS_E_79:
NS_E_RDI_79:
; » 0xraa |~ {  } ⊢ %_75 : %_75
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_75
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_91
	bt r12,0
	jc LB_92
	mov rdi,r13
	call dlt
LB_92:
	jmp MTC_LB_90
LB_91:
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_93
	btr r12,1
	jmp LB_94
LB_93:
	bts r12,1
LB_94:
; /0/
	jmp MTC_LB_89
MTC_LB_90:
; ∎ {  }
 ; {>  %_75~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_80
	mov rdi,r13
	call dlt
LB_80:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_89:
; _f14 %_77 ⊢ %_78 : %_78
 ; {>  %_75~0':_r64 %_77~1':_r64 }
; _f14 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_83
	btr r12,0
	jmp LB_84
LB_83:
	bts r12,0
LB_84:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_85
	btr r12,1
	jmp LB_86
LB_85:
	bts r12,1
LB_86:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_81
	btr r12,0
	jmp LB_82
LB_81:
	bts r12,0
LB_82:
	add rsp,16
; ∎ {  }
 ; {>  %_75~0':_r64 %_78~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_87
	mov rdi,r13
	call dlt
LB_87:
	bt r12,1
	jc LB_88
	mov rdi,r14
	call dlt
LB_88:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_68:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_68
	NS_E_DYN_72:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_72
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	NS_E_DYN_74:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_74
	CST_DYN_79:
		dq 0x0001_0001_00_82_ffff
		dq 1
