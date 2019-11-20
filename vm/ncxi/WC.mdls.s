%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_110
	mov QWORD [CST_DYN_110+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_110],rbx
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
NS_E_102:
NS_E_RDI_102:
NS_E_102_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_102_LB_0
	bt r11,7
	jc LB_103
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
LB_103:
	add rsi,1
	bt r11,6
	jc LB_104
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
LB_104:
	add rsi,1
	bt r11,5
	jc LB_105
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
LB_105:
	add rsi,1
	bt r11,5
	jc LB_105
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
NS_E_102_LB_0:
	mov rax,0
	ret
NS_E_106:
NS_E_RDI_106:
NS_E_106_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_106_LB_0
	cmp r11,57
	ja NS_E_106_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_106_LB_0:
	mov rax,0
	ret
NS_E_108:
NS_E_RDI_108:
NS_E_108_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_108_LB_0
	cmp r11,122
	ja NS_E_108_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_108_LB_0:
	mov rax,0
	ret
NS_E_107:
NS_E_RDI_107:
NS_E_107_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_107_LB_0
	cmp r11,90
	ja NS_E_107_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_107_LB_0:
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
NS_E_110:
NS_E_RDI_110:
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
	jc LB_113
	btr QWORD [rdi],0
	jmp LB_114
LB_113:
	bts QWORD [rdi],0
LB_114:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_111
	btr QWORD [rdi],0
	jmp LB_112
LB_111:
	bts QWORD [rdi],0
LB_112:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_115
	btr QWORD [rdi],1
	jmp LB_116
LB_115:
	bts QWORD [rdi],1
LB_116:
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
	jc LB_119
	btr QWORD [rdi],0
	jmp LB_120
LB_119:
	bts QWORD [rdi],0
LB_120:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_117
	btr QWORD [rdi],2
	jmp LB_118
LB_117:
	bts QWORD [rdi],2
LB_118:
	call NS_E_14
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_123
	btr r12,1
	jmp LB_124
LB_123:
	bts r12,1
LB_124:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_121
	btr r12,2
	jmp LB_122
LB_121:
	bts r12,2
LB_122:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_125
	btr r12,1
	jmp LB_126
LB_125:
	bts r12,1
LB_126:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_129
	btr r12,1
	jmp LB_130
LB_129:
	bts r12,1
LB_130:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_127
	btr r12,2
	jmp LB_128
LB_127:
	bts r12,2
LB_128:
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
	NS_E_DYN_102:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_102
	NS_E_DYN_106:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_106
	NS_E_DYN_107:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_107
	NS_E_DYN_108:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_108
	CST_DYN_110:
		dq 0x0001_0001_00_82_ffff
		dq 1
