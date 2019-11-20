%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_52
	mov QWORD [CST_DYN_52+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_52],rbx
	call exec_out
	jmp _end
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
NS_E_38:
NS_E_RDI_38:
NS_E_38_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_38_LB_0
	bt r11,7
	jc LB_39
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
LB_39:
	add rsi,1
	bt r11,6
	jc LB_40
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
LB_40:
	add rsi,1
	bt r11,5
	jc LB_41
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
LB_41:
	add rsi,1
	bt r11,5
	jc LB_41
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
NS_E_38_LB_0:
	mov rax,0
	ret
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_42_LB_0
	cmp r11,57
	ja NS_E_42_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_42_LB_0:
	mov rax,0
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_44_LB_0
	cmp r11,122
	ja NS_E_44_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_44_LB_0:
	mov rax,0
	ret
NS_E_43:
NS_E_RDI_43:
NS_E_43_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_43_LB_0
	cmp r11,90
	ja NS_E_43_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43_LB_0:
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
NS_E_52:
NS_E_RDI_52:
; » 0xrff |~ {  } ⊢ %_45 : %_45
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_45
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_46 %_47 %_48 } : { %_46 %_47 %_48 }
 ; {>  %_45~0':_r64 }
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { { {  } {  } } {  } { {  } } }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_57
	btr QWORD [rdi],0
	jmp LB_58
LB_57:
	bts QWORD [rdi],0
LB_58:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_59
	btr QWORD [rdi],1
	jmp LB_60
LB_59:
	bts QWORD [rdi],1
LB_60:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_55
	btr QWORD [rdi],0
	jmp LB_56
LB_55:
	bts QWORD [rdi],0
LB_56:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61
	btr QWORD [rdi],1
	jmp LB_62
LB_61:
	bts QWORD [rdi],1
LB_62:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_65
	btr QWORD [rdi],0
	jmp LB_66
LB_65:
	bts QWORD [rdi],0
LB_66:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_63
	btr QWORD [rdi],2
	jmp LB_64
LB_63:
	bts QWORD [rdi],2
LB_64:
	call NS_E_14
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_71
	btr r12,1
	jmp LB_72
LB_71:
	bts r12,1
LB_72:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_67
	btr r12,2
	jmp LB_68
LB_67:
	bts r12,2
LB_68:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_69
	btr r12,2
	jmp LB_70
LB_69:
	bts r12,2
LB_70:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_73
	btr r12,1
	jmp LB_74
LB_73:
	bts r12,1
LB_74:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_77
	btr r12,1
	jmp LB_78
LB_77:
	bts r12,1
LB_78:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_75
	btr r12,2
	jmp LB_76
LB_75:
	bts r12,2
LB_76:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_53
	btr r12,0
	jmp LB_54
LB_53:
	bts r12,0
LB_54:
	add rsp,16
; _f14 %_46 ⊢ %_49 : %_49
 ; {>  %_47~{  }:{ } %_45~0':_r64 %_48~{ {  } }:{ { } } %_46~{ {  } {  } }:{ { } { } } }
; _f14 { {  } {  } } ⊢ { {  } {  } }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_81
	btr QWORD [rdi],0
	jmp LB_82
LB_81:
	bts QWORD [rdi],0
LB_82:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_83
	btr QWORD [rdi],1
	jmp LB_84
LB_83:
	bts QWORD [rdi],1
LB_84:
	call NS_E_14
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_85
	btr r12,1
	jmp LB_86
LB_85:
	bts r12,1
LB_86:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_87
	btr r12,1
	jmp LB_88
LB_87:
	bts r12,1
LB_88:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_79
	btr r12,0
	jmp LB_80
LB_79:
	bts r12,0
LB_80:
	add rsp,16
; _f14 %_47 ⊢ %_50 : %_50
 ; {>  %_47~{  }:{ } %_45~0':_r64 %_49~{ {  } {  } }:{ { } { } } %_48~{ {  } }:{ { } } }
; _f14 {  } ⊢ {  }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	call NS_E_14
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_89
	btr r12,0
	jmp LB_90
LB_89:
	bts r12,0
LB_90:
	add rsp,16
; _f14 %_48 ⊢ _(37) : _(37)
 ; {>  %_45~0':_r64 %_49~{ {  } {  } }:{ { } { } } %_48~{ {  } }:{ { } } %_50~{  }:{ } }
; _f14 { {  } } ⊢ { {  } }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_93
	btr QWORD [rdi],0
	jmp LB_94
LB_93:
	bts QWORD [rdi],0
LB_94:
	call NS_E_14
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_95
	btr r12,1
	jmp LB_96
LB_95:
	bts r12,1
LB_96:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_91
	btr r12,0
	jmp LB_92
LB_91:
	bts r12,0
LB_92:
	add rsp,16
; _f14 %_45 ⊢ %_51 : %_51
 ; {>  %_45~0':_r64 %_49~{ {  } {  } }:{ { } { } } %_50~{  }:{ } }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
	call NS_E_14
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_51~0':_r64 %_49~{ {  } {  } }:{ { } { } } %_50~{  }:{ } }
; 	∎ {  }
	bt r12,0
	jc LB_97
	mov rdi,r13
	call dlt
LB_97:
	ret
section .data
	NS_E_DYN_38:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	CST_DYN_52:
		dq 0x0001_0001_00_82_ffff
		dq 1
