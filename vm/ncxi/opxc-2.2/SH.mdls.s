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
	jz LB_40
	jmp LB_8
LB_40:
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
	jnz LB_41
	jmp LB_4
LB_41:
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
LB_21: ;; T2 #19602,i=0x5
	mov r12,0x2
 ret 
LB_23: ;; emt_cst #1877,i=0x6
	mov QWORD [GLV+8*0x82],LB_24
	mov rax,QWORD [GLV+8*0x82]
LB_25:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_26:
 ret 
LB_27: ;; emt_cst #1877,i=0x7
	mov QWORD [GLV+8*0x82],LB_28
	mov rax,QWORD [GLV+8*0x82]
LB_29:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_30:
 ret 
LB_31: ;; emt_cst #1877,i=0x8
	mov QWORD [GLV+8*0x82],LB_32
	mov rax,QWORD [GLV+8*0x82]
LB_33:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_34:
 ret 
LB_35: ;; adt #2426,i=0x9
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	mov rsi,0 
	cmp rdi,0x2
	cmovl rsi,rsp 
	mov rsi,QWORD [rsi]
	jmp QWORD [LB_43+8*rdi]
LB_43: dq LB_42_0,LB_42_1
LB_42_0:
	jmp LB_36
LB_42_1:
	jmp LB_36
LB_37:
 ret 
LB_38:
 ret 
LB_36:
 ret 
LB_20: ;; T1 #19611,i=0x4
	sub rsp,8
	call LB_21
	add rsp,8
	mov rdi,r12
	mov eax,edi 
	movzx rdi,di
	jmp QWORD [LB_45+8*rdi]
LB_45: dq LB_44_0,LB_44_1,LB_44_2
LB_44_0:
	mov rdi,r13
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x81],rbx
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x80],rbx
LB_46:
	mov rax,r12
	mov rdi,r13
	mov eax,eax 
	shr rax,16 
	mov rcx,48 
	sub rcx,rax 
	xor rax,rax 
	bts rax,rcx
	mov rsi,QWORD [rdi]
	sub rsi,rax 
	lea SRC_REG,[rdi+8]
	mov QWORD [rdi],rsi
	cmp rsi,0
	jz .LB0
	mov rax,QWORD [SRC_REG+(8*0x0)]
	mov rdi,QWORD [SRC_REG+(8*0x1)]
	call rpc_dyn_adt 
	mov QWORD [SRC_REG+(8*0x0)],rax
	mov QWORD [GLV+8*0x80],rax
	jmp .LB1
.LB0:
	lea rdi,[SRC_REG-8]
	mov rax,0x2
	call free_rcd_n
.LB1:
	jmp LB_22
LB_44_1:
LB_47:
	jmp LB_39
LB_44_2:
	mov QWORD [GLV+8*0x80],0x0
LB_48:
	jmp LB_22
LB_22:
	sub rsp,8
	call LB_23
	add rsp,8
	sub rsp,8
	call LB_27
	add rsp,8
	sub rsp,8
	call LB_31
	add rsp,8
	sub rsp,8
	call LB_35
	add rsp,8
	add rsp,8 
	pop rdi 
	mov rsi,0x2fed6
	jmp exn 
LB_39:
	add rsp,8 
	pop rdi 
	mov rsi,0x2fef0
	jmp exn 
LB_0: ;; main_nls #19685,i=0x0
	sub rsp,8
	call LB_1
	add rsp,8
	sub rsp,8
	call LB_20
	add rsp,8
	RT_ERR 0xefff_ec37
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
LB_24: dq (0x0800_0000_0000_0000+0x7)
LB_24_DB: db 101,109,116,95,105,109,58,0,0,0,0,0,0,0,0,0
LB_32: dq (0x0800_0000_0000_0000+0x1)
LB_32_DB: db 10,0,0,0,0,0,0,0,0,0
LB_28: dq (0x0800_0000_0000_0000+0xd)
LB_28_DB: db 48,120,102,102,48,51,114,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
