%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 131
%define GLV_2 GLV+8*0x80
 
section .bss 
	GLV: resq GLV_N
%include "BSS.s"

section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_11: ;; t #719,i=0x3
	mov rax,QWORD [GLV+8*0x82]
LB_12:
	mov rdi,QWORD [rax]
	mov rsi,0x0001_0000_0000_0000 
	sub rdi,rsi 
	mov QWORD [rax],rdi 
	shr rdi,32 
	cmp rdi,0 
	jnz .L0 
 mov rdi,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call free
	mov rsp,rbx 
	pop rbx
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop rcx 
	pop rdx
.L0:
LB_13:
 ret 
LB_7: ;; dlt_i #864,i=0x2
	mov rdi,QWORD [GLV+8*0x81]
	cmp rdi,0x0
	jz LB_25
	jmp LB_8
LB_25:
	jmp LB_16
LB_8:
	mov rax,QWORD [GLV+8*0x80]
	mov SRC_REG,rax
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x82],rbx
	mov rax,QWORD [GLV+8*0x80]
LB_9:
	mov rdi,0x8
	add rax,rdi
LB_10:
	mov QWORD [GLV+8*0x80],rax
	sub rsp,8
	call LB_11
	add rsp,8
	mov rax,QWORD [GLV+8*0x81]
LB_14:
 sub rax,1 
LB_15:
	mov QWORD [GLV+8*0x81],rax
	jmp LB_7
LB_16:
 ret 
LB_1: ;; dlt #901,i=0x1
	mov rax,QWORD [GLV+8*0x80]
LB_2:
	mov rdi,QWORD [rax]
	mov rsi,0x0001_0000_0000_0000 
	sub rdi,rsi
	mov QWORD [rax],rdi 
	mov esi,edi
	shr rdi,32
LB_3:
	mov QWORD [GLV+8*0x81],rdi
	mov QWORD [GLV+8*0x82],rsi
	mov rdi,QWORD [GLV+8*0x81]
	cmp rdi,0x0
	jnz LB_26
	jmp LB_4
LB_26:
	jmp LB_19
LB_4:
	mov rbx,QWORD [GLV+8*0x80]
	mov QWORD [GLV+8*0x81],rbx
	mov rax,QWORD [GLV+8*0x81]
LB_5:
	mov rdi,0x8
	add rax,rdi
LB_6:
	mov QWORD [GLV+8*0x81],rax
	lea rsp,[rsp-(8*0x1)]
	mov rbx,QWORD [GLV+8*0x80]
	mov QWORD [rsp+8*0x0],rbx
	sub rsp,8
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [GLV+8*0x81],rbx
	call LB_7
	add rsp,8
	mov rbx,QWORD [rsp+8*0x0]
	mov QWORD [GLV+8*0x80],rbx
	lea rsp,[rsp+(8*0x1)]
	mov rax,QWORD [GLV+8*0x80]
LB_17:
	mov rdi,rax 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call free
	mov rsp,rbx 
	pop rbx
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop rcx 
	pop rdx
LB_18:
 ret 
LB_19:
 ret 
LB_20: ;; f0 #3826,i=0x4
	mov r12,QWORD [GLV+8*0x80]
	mov r13,QWORD [GLV+8*0x81]
 ret 
LB_21: ;; adt #2426,i=0x5
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	cmp rdi,0x2
	jge err_bc
	jmp QWORD [LB_28+8*rdi]
LB_28: dq LB_27_0,LB_27_1
LB_27_0:
	jmp LB_22
LB_27_1:
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [GLV+8*0x80],rbx
	mov QWORD [GLV+8*0x81],0x0
	jmp LB_23
LB_23:
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [GLV+8*0x81],rbx
	call LB_21
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
 ret 
LB_24:
 ret 
LB_22:
 ret 
LB_0: ;; m51 #3835,i=0x0
	sub rsp,8
	call LB_1
	add rsp,8
	sub rsp,8
	mov QWORD [GLV+8*0x81],0x2
	mov QWORD [GLV+8*0x80],0x0
	call LB_20
	add rsp,8
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	mov QWORD [GLV+8*0x80],r12
	mov QWORD [GLV+8*0x81],r13
	call LB_21
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
 ret 
RTM_0:
	sub rsp,8
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call exit
	mov rsp,rbx 
	pop rbx

%include "TEXT.s"
section .data
%include "DATA.s"
