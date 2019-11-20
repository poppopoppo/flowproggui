%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_76
	mov QWORD [CST_DYN_76+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_76],rbx
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
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_69_LB_0
	bt r11,7
	jc LB_70
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
LB_70:
	add rsi,1
	bt r11,6
	jc LB_71
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
LB_71:
	add rsi,1
	bt r11,5
	jc LB_72
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
LB_72:
	add rsi,1
	bt r11,5
	jc LB_72
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
NS_E_69_LB_0:
	mov rax,0
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_73_LB_0
	cmp r11,57
	ja NS_E_73_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_73_LB_0:
	mov rax,0
	ret
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_75_LB_0
	cmp r11,122
	ja NS_E_75_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_75_LB_0:
	mov rax,0
	ret
NS_E_74:
NS_E_RDI_74:
NS_E_74_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_74_LB_0
	cmp r11,90
	ja NS_E_74_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_74_LB_0:
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
NS_E_76:
NS_E_RDI_76:
	sub rsp,8
	mov QWORD [rsp],r12
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
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
	jc LB_79
	btr QWORD [rdi],0
	jmp LB_80
LB_79:
	bts QWORD [rdi],0
LB_80:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_77
	btr QWORD [rdi],0
	jmp LB_78
LB_77:
	bts QWORD [rdi],0
LB_78:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_81
	btr QWORD [rdi],1
	jmp LB_82
LB_81:
	bts QWORD [rdi],1
LB_82:
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
	jc LB_85
	btr QWORD [rdi],0
	jmp LB_86
LB_85:
	bts QWORD [rdi],0
LB_86:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_83
	btr QWORD [rdi],2
	jmp LB_84
LB_83:
	bts QWORD [rdi],2
LB_84:
	call NS_E_14
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_89
	btr r12,1
	jmp LB_90
LB_89:
	bts r12,1
LB_90:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_87
	btr r12,2
	jmp LB_88
LB_87:
	bts r12,2
LB_88:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_91
	btr r12,1
	jmp LB_92
LB_91:
	bts r12,1
LB_92:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_95
	btr r12,1
	jmp LB_96
LB_95:
	bts r12,1
LB_96:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_93
	btr r12,2
	jmp LB_94
LB_93:
	bts r12,2
LB_94:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r12,QWORD [rsp]
	add rsp,8
; 	∎ {  }
	ret
section .data
	NS_E_DYN_69:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_69
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	NS_E_DYN_74:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_74
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	CST_DYN_76:
		dq 0x0001_0001_00_82_ffff
		dq 1
