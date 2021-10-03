%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 133
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
	jz LB_63
	jmp LB_8
LB_63:
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
	jnz LB_64
	jmp LB_4
LB_64:
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
LB_21: ;; emt_cst #1877,i=0x5
	mov QWORD [GLV+8*0x82],LB_22
	mov rax,QWORD [GLV+8*0x82]
LB_23:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_24:
 ret 
LB_27: ;; emt_cst #1877,i=0x7
	mov QWORD [GLV+8*0x83],LB_28
	mov rax,QWORD [GLV+8*0x83]
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
	mov QWORD [GLV+8*0x83],LB_32
	mov rax,QWORD [GLV+8*0x83]
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
LB_35: ;; emt_cst #1877,i=0x9
	mov QWORD [GLV+8*0x83],LB_36
	mov rax,QWORD [GLV+8*0x83]
LB_37:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_38:
 ret 
LB_39: ;; r640 #2139,i=0xa
	mov rax,QWORD [GLV+8*0x82]
LB_40:
 sub rsp,32 
 mov rdi,rsp 
 mov BYTE [rdi],'0'
 mov BYTE [rdi+1],'x' 
 add rdi,2 
 call pf_x 
 mov BYTE [rdi+rax],'r' 
 sub rdi,2  
 add rax,3 
 mov rsi,rax  
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
 add rsp,32 
LB_41:
	mov r12,QWORD [GLV+8*0x82]
 ret 
LB_42: ;; emt_cst #1877,i=0xb
	mov QWORD [GLV+8*0x83],LB_43
	mov rax,QWORD [GLV+8*0x83]
LB_44:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_45:
 ret 
LB_46: ;; emt_cst #1877,i=0xc
	mov QWORD [GLV+8*0x83],LB_47
	mov rax,QWORD [GLV+8*0x83]
LB_48:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_49:
 ret 
LB_51: ;; emt_cst #1877,i=0xd
	mov QWORD [GLV+8*0x80],LB_52
	mov rax,QWORD [GLV+8*0x80]
LB_53:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_54:
 ret 
LB_25: ;; lst #2237,i=0x6
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	jmp QWORD [LB_66+8*rdi]
LB_66: dq LB_65_0,LB_65_1,LB_65_2
LB_65_0:
	mov rdi,QWORD [GLV+8*0x81]
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x82],rbx
	mov rbx,QWORD [SRC_REG+(8*0x2)]
	mov QWORD [GLV+8*0x84],rbx
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x83],rbx
LB_67:
	mov rax,QWORD [GLV+8*0x80]
	mov rdi,QWORD [GLV+8*0x81]
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
	mov rax,QWORD [SRC_REG+(8*0x1)]
	mov rdi,QWORD [SRC_REG+(8*0x2)]
	call rpc_dyn_adt 
	mov QWORD [SRC_REG+(8*0x1)],rax
	mov QWORD [GLV+8*0x83],rax
	jmp .LB1
.LB0:
	lea rdi,[SRC_REG-8]
	mov rax,0x4
	call free_rcd_n
.LB1:
	jmp LB_26
LB_65_1:
LB_68:
	jmp LB_50
LB_65_2:
	mov QWORD [GLV+8*0x83],0x1
LB_69:
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [GLV+8*0x82],rbx
	jmp LB_26
LB_26:
	mov rbx,QWORD [GLV+8*0x83]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x84]
	mov QWORD [GLV+8*0x81],rbx
	sub rsp,8
	call LB_27
	add rsp,8
	sub rsp,8
	call LB_31
	add rsp,8
	sub rsp,8
	call LB_35
	add rsp,8
	sub rsp,8
	call LB_39
	add rsp,8
	mov QWORD [GLV+8*0x82],r12
	sub rsp,8
	call LB_42
	add rsp,8
	sub rsp,8
	call LB_35
	add rsp,8
	lea rsp,[rsp-(8*0x1)]
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [rsp+8*0x0],rbx
	sub rsp,8
	call LB_25
	add rsp,8
	mov rbx,QWORD [rsp+8*0x0]
	mov QWORD [GLV+8*0x80],rbx
	lea rsp,[rsp+(8*0x1)]
	mov QWORD [GLV+8*0x81],r12
	mov QWORD [GLV+8*0x82],r13
	sub rsp,8
	call LB_46
	add rsp,8
LB_70: ; alc_rcd
	mov rdi,0x4
	call alc_rcd_n
	push rax
	lea DST_REG,[rax+8]
	mov rbx,QWORD [GLV+8*0x80]
	mov QWORD [DST_REG+(8*0x0)],rbx
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [DST_REG+(8*0x1)],rbx
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [DST_REG+(8*0x2)],rbx
	mov rbx,0x100000000
	mov r12,rbx
	pop rax
	mov r13,rax
 ret 
LB_50:
	sub rsp,8
	call LB_51
	add rsp,8
	sub rsp,8
	call LB_31
	add rsp,8
	sub rsp,8
	call LB_46
	add rsp,8
	mov r12,0x1
 ret 
LB_55: ;; emt_cst #1877,i=0xe
	mov QWORD [GLV+8*0x82],LB_56
	mov rax,QWORD [GLV+8*0x82]
LB_57:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_58:
 ret 
LB_59: ;; adt #2426,i=0xf
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	cmp rdi,0x3
	jge err_bc
	jmp QWORD [LB_72+8*rdi]
LB_72: dq LB_71_0,LB_71_1,LB_71_2
LB_71_0:
	mov rdi,QWORD [GLV+8*0x81]
	shr rax,16 
	mov rcx,rax 
	mov rax,0x0001_0000_0000_0000 
	shr rax,cl 
	mov rsi,QWORD [rdi]
	sub rsi,rax 
	mov QWORD [rdi],rsi
	cmp rsi,0
	jnz LB_60
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x81],rbx
	mov rbx,QWORD [SRC_REG+(8*0x2)]
	mov QWORD [GLV+8*0x82],rbx
	lea rdi,[SRC_REG-8]
	mov rax,0x4
	call free_rcd_n
	jmp LB_61
LB_71_1:
	jmp LB_60
LB_71_2:
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [GLV+8*0x80],rbx
	mov QWORD [GLV+8*0x81],0x1
	jmp LB_61
LB_61:
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [GLV+8*0x81],rbx
	call LB_59
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
 ret 
LB_62:
 ret 
LB_60:
 ret 
LB_0: ;; m51 #3837,i=0x0
	sub rsp,8
	call LB_1
	add rsp,8
	sub rsp,8
	mov QWORD [GLV+8*0x81],0x2
	mov QWORD [GLV+8*0x80],0x2
	call LB_20
	add rsp,8
	mov QWORD [GLV+8*0x80],r12
	mov QWORD [GLV+8*0x81],r13
	sub rsp,8
	call LB_21
	add rsp,8
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	call LB_25
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
	mov QWORD [GLV+8*0x80],r12
	mov QWORD [GLV+8*0x81],r13
	sub rsp,8
	call LB_55
	add rsp,8
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	call LB_59
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
LB_22: dq (0x0800_0000_0000_0000+0x4)
LB_22_DB: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_32: dq (0x0800_0000_0000_0000+0x1)
LB_32_DB: db 123,0,0,0,0,0,0,0,0,0
LB_36: dq (0x0800_0000_0000_0000+0x1)
LB_36_DB: db 32,0,0,0,0,0,0,0,0,0
LB_56: dq (0x0800_0000_0000_0000+0x1)
LB_56_DB: db 10,0,0,0,0,0,0,0,0,0
LB_47: dq (0x0800_0000_0000_0000+0x2)
LB_47_DB: db 32,125,0,0,0,0,0,0,0,0,0
LB_28: dq (0x0800_0000_0000_0000+0x7)
LB_28_DB: db 95,99,110,115,226,151,130,0,0,0,0,0,0,0,0,0
LB_43: dq (0x0800_0000_0000_0000+0x7)
LB_43_DB: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_52: dq (0x0800_0000_0000_0000+0x7)
LB_52_DB: db 95,110,105,108,226,151,130,0,0,0,0,0,0,0,0,0
