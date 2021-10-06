%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 134
%define GLV_2 GLV+8*0x80
 
section .bss 
	GLV: resq GLV_N
%include "BSS.s"

section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_11: ;; t #732,i=0x3
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
LB_7: ;; dlt_i #877,i=0x2
	mov rdi,QWORD [GLV+8*0x81]
	cmp rdi,0x0
	jz LB_70
	jmp LB_8
LB_70:
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
LB_1: ;; dlt #914,i=0x1
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
	jnz LB_71
	jmp LB_4
LB_71:
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
LB_20: ;; emt_cst #1890,i=0x4
	mov QWORD [GLV+8*0x80],LB_21
	mov rax,QWORD [GLV+8*0x80]
LB_22:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_23:
 ret 
LB_26: ;; emt_cst #1890,i=0x6
	mov QWORD [GLV+8*0x80],LB_27
	mov rax,QWORD [GLV+8*0x80]
LB_28:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_29:
 ret 
LB_30: ;; emt_cst #1890,i=0x7
	mov QWORD [GLV+8*0x84],LB_31
	mov rax,QWORD [GLV+8*0x84]
LB_32:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_33:
 ret 
LB_34: ;; emt_cst #1890,i=0x8
	mov QWORD [GLV+8*0x84],LB_35
	mov rax,QWORD [GLV+8*0x84]
LB_36:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_37:
 ret 
LB_39: ;; emt_cst #1890,i=0x9
	mov QWORD [GLV+8*0x82],LB_40
	mov rax,QWORD [GLV+8*0x82]
LB_41:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_42:
 ret 
LB_45: ;; emt_cst #1890,i=0xb
	mov QWORD [GLV+8*0x84],LB_46
	mov rax,QWORD [GLV+8*0x84]
LB_47:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_48:
 ret 
LB_49: ;; emt_cst #1890,i=0xc
	mov QWORD [GLV+8*0x84],LB_50
	mov rax,QWORD [GLV+8*0x84]
LB_51:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_52:
 ret 
LB_54: ;; emt_cst #1890,i=0xd
	mov QWORD [GLV+8*0x80],LB_55
	mov rax,QWORD [GLV+8*0x80]
LB_56:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_57:
 ret 
LB_43: ;; lst #2250,i=0xa
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	jmp QWORD [LB_73+8*rdi]
LB_73: dq LB_72_0,LB_72_1,LB_72_2
LB_72_0:
	mov rdi,QWORD [GLV+8*0x81]
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x83],rbx
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x82],rbx
	mov rbx,QWORD [SRC_REG+(8*0x3)]
	mov QWORD [GLV+8*0x85],rbx
	mov rbx,QWORD [SRC_REG+(8*0x2)]
	mov QWORD [GLV+8*0x84],rbx
LB_74:
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
	mov rax,QWORD [SRC_REG+(8*0x0)]
	mov rdi,QWORD [SRC_REG+(8*0x1)]
	call rpc_dyn_adt 
	mov QWORD [SRC_REG+(8*0x0)],rax
	mov QWORD [GLV+8*0x82],rax
	mov rax,QWORD [SRC_REG+(8*0x2)]
	mov rdi,QWORD [SRC_REG+(8*0x3)]
	call rpc_dyn_adt 
	mov QWORD [SRC_REG+(8*0x2)],rax
	mov QWORD [GLV+8*0x84],rax
	jmp .LB1
.LB0:
	lea rdi,[SRC_REG-8]
	mov rax,0x4
	call free_rcd_n
.LB1:
	jmp LB_44
LB_72_1:
LB_75:
	jmp LB_53
LB_72_2:
	mov QWORD [GLV+8*0x84],0x1
	mov QWORD [GLV+8*0x82],0x2
LB_76:
	jmp LB_44
LB_44:
	mov rbx,QWORD [GLV+8*0x84]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x85]
	mov QWORD [GLV+8*0x81],rbx
	sub rsp,8
	call LB_45
	add rsp,8
	sub rsp,8
	call LB_30
	add rsp,8
	sub rsp,8
	call LB_49
	add rsp,8
	lea rsp,[rsp-(8*0x2)]
	mov rbx,QWORD [GLV+8*0x80]
	mov QWORD [rsp+8*0x0],rbx
	mov rbx,QWORD [GLV+8*0x81]
	mov QWORD [rsp+8*0x1],rbx
	sub rsp,8
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x83]
	mov QWORD [GLV+8*0x81],rbx
	call LB_24
	add rsp,8
	mov rbx,QWORD [rsp+8*0x0]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [rsp+8*0x1]
	mov QWORD [GLV+8*0x81],rbx
	lea rsp,[rsp+(8*0x2)]
	mov QWORD [GLV+8*0x82],r12
	mov QWORD [GLV+8*0x83],r13
	sub rsp,8
	call LB_49
	add rsp,8
	lea rsp,[rsp-(8*0x2)]
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [rsp+8*0x0],rbx
	mov rbx,QWORD [GLV+8*0x83]
	mov QWORD [rsp+8*0x1],rbx
	sub rsp,8
	call LB_43
	add rsp,8
	mov rbx,QWORD [rsp+8*0x0]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [rsp+8*0x1]
	mov QWORD [GLV+8*0x81],rbx
	lea rsp,[rsp+(8*0x2)]
	mov QWORD [GLV+8*0x82],r12
	mov QWORD [GLV+8*0x83],r13
	sub rsp,8
	call LB_34
	add rsp,8
LB_77: ; alc_rcd
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
	mov rbx,QWORD [GLV+8*0x83]
	mov QWORD [DST_REG+(8*0x3)],rbx
	mov rbx,0x100000000
	mov r12,rbx
	pop rax
	mov r13,rax
 ret 
LB_53:
	sub rsp,8
	call LB_54
	add rsp,8
	sub rsp,8
	call LB_30
	add rsp,8
	sub rsp,8
	call LB_34
	add rsp,8
	mov r12,0x1
 ret 
LB_24: ;; .emt_adt #3979,i=0x5
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	jmp QWORD [LB_79+8*rdi]
LB_79: dq LB_78_0,LB_78_1,LB_78_2,LB_78_3
LB_78_0:
	mov rdi,QWORD [GLV+8*0x81]
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x83],rbx
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x82],rbx
LB_80:
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
	mov rax,QWORD [SRC_REG+(8*0x0)]
	mov rdi,QWORD [SRC_REG+(8*0x1)]
	call rpc_dyn_adt 
	mov QWORD [SRC_REG+(8*0x0)],rax
	mov QWORD [GLV+8*0x82],rax
	jmp .LB1
.LB0:
	lea rdi,[SRC_REG-8]
	mov rax,0x2
	call free_rcd_n
.LB1:
	jmp LB_38
LB_78_1:
LB_81:
	jmp LB_25
LB_78_2:
	mov QWORD [GLV+8*0x82],0x1
LB_82:
	jmp LB_38
LB_78_3:
	mov QWORD [GLV+8*0x82],0x2
LB_83:
	jmp LB_38
LB_25:
	sub rsp,8
	call LB_26
	add rsp,8
	sub rsp,8
	call LB_30
	add rsp,8
	sub rsp,8
	call LB_34
	add rsp,8
	mov r12,0x1
 ret 
LB_38:
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [GLV+8*0x83]
	mov QWORD [GLV+8*0x81],rbx
	sub rsp,8
	call LB_39
	add rsp,8
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	call LB_43
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
LB_84: ; alc_rcd
	mov rdi,0x2
	call alc_rcd_n
	push rax
	lea DST_REG,[rax+8]
	mov QWORD [DST_REG+(8*0x0)],r12
	mov QWORD [DST_REG+(8*0x1)],r13
	mov rbx,0x100000000
	mov r12,rbx
	pop rax
	mov r13,rax
 ret 
LB_58: ;; emt_cst #1890,i=0xe
	mov QWORD [GLV+8*0x82],LB_59
	mov rax,QWORD [GLV+8*0x82]
LB_60:
 mov rdi,rax 
 mov esi,DWORD [rax]
 lea rdi,[rax+8] 
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call fw
	mov rsp,rbx 
	pop rbx
LB_61:
 ret 
LB_65: ;; adt #2439,i=0x10
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	mov rsi,0 
	cmp rdi,0x3
	cmovl rsi,rsp 
	mov rsi,QWORD [rsi]
	jmp QWORD [LB_86+8*rdi]
LB_86: dq LB_85_0,LB_85_1,LB_85_2
LB_85_0:
	mov rdi,QWORD [GLV+8*0x81]
	shr rax,16 
	mov rcx,rax 
	mov rax,0x0001_0000_0000_0000 
	shr rax,cl 
	mov rsi,QWORD [rdi]
	sub rsi,rax 
	mov QWORD [rdi],rsi
	cmp rsi,0
	jnz LB_66
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x81],rbx
	mov rbx,QWORD [SRC_REG+(8*0x2)]
	mov QWORD [GLV+8*0x82],rbx
	mov rbx,QWORD [SRC_REG+(8*0x3)]
	mov QWORD [GLV+8*0x83],rbx
	lea rdi,[SRC_REG-8]
	mov rax,0x4
	call free_rcd_n
	jmp LB_67
LB_85_1:
	jmp LB_66
LB_85_2:
	jmp LB_66
LB_67:
	lea rsp,[rsp-(8*0x2)]
	mov rbx,QWORD [GLV+8*0x82]
	mov QWORD [rsp+8*0x0],rbx
	mov rbx,QWORD [GLV+8*0x83]
	mov QWORD [rsp+8*0x1],rbx
	sub rsp,8
	call LB_62
	add rsp,8
	mov rbx,QWORD [rsp+8*0x0]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [rsp+8*0x1]
	mov QWORD [GLV+8*0x81],rbx
	lea rsp,[rsp+(8*0x2)]
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	call LB_65
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
 ret 
LB_68:
 ret 
LB_66:
 ret 
LB_62: ;; adt #2439,i=0xf
	mov rdi,QWORD [GLV+8*0x80]
	mov eax,edi 
	movzx rdi,di
	mov rsi,0 
	cmp rdi,0x4
	cmovl rsi,rsp 
	mov rsi,QWORD [rsi]
	jmp QWORD [LB_90+8*rdi]
LB_90: dq LB_89_0,LB_89_1,LB_89_2,LB_89_3
LB_89_0:
	mov rdi,QWORD [GLV+8*0x81]
	shr rax,16 
	mov rcx,rax 
	mov rax,0x0001_0000_0000_0000 
	shr rax,cl 
	mov rsi,QWORD [rdi]
	sub rsi,rax 
	mov QWORD [rdi],rsi
	cmp rsi,0
	jnz LB_63
	lea SRC_REG,[rdi+8]
	mov rbx,QWORD [SRC_REG+(8*0x0)]
	mov QWORD [GLV+8*0x80],rbx
	mov rbx,QWORD [SRC_REG+(8*0x1)]
	mov QWORD [GLV+8*0x81],rbx
	lea rdi,[SRC_REG-8]
	mov rax,0x2
	call free_rcd_n
	jmp LB_64
LB_89_1:
	jmp LB_63
LB_89_2:
	jmp LB_63
LB_89_3:
	jmp LB_63
LB_64:
	jmp LB_65
LB_69:
 ret 
LB_63:
 ret 
LB_0: ;; m57 #4001,i=0x0
	sub rsp,8
	call LB_1
	add rsp,8
	sub rsp,8
	call LB_20
	add rsp,8
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	mov QWORD [GLV+8*0x80],0x3
	call LB_24
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
	mov QWORD [GLV+8*0x80],r12
	mov QWORD [GLV+8*0x81],r13
	sub rsp,8
	call LB_58
	add rsp,8
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	call LB_62
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
LB_21: dq (0x0800_0000_0000_0000+0x4)
LB_21_DB: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_31: dq (0x0800_0000_0000_0000+0x1)
LB_31_DB: db 123,0,0,0,0,0,0,0,0,0
LB_50: dq (0x0800_0000_0000_0000+0x1)
LB_50_DB: db 32,0,0,0,0,0,0,0,0,0
LB_59: dq (0x0800_0000_0000_0000+0x1)
LB_59_DB: db 10,0,0,0,0,0,0,0,0,0
LB_35: dq (0x0800_0000_0000_0000+0x2)
LB_35_DB: db 32,125,0,0,0,0,0,0,0,0,0
LB_27: dq (0x0800_0000_0000_0000+0x6)
LB_27_DB: db 97,116,109,226,151,130,0,0,0,0,0,0,0,0,0
LB_40: dq (0x0800_0000_0000_0000+0x6)
LB_40_DB: db 114,99,100,226,151,130,0,0,0,0,0,0,0,0,0
LB_46: dq (0x0800_0000_0000_0000+0x7)
LB_46_DB: db 95,99,110,115,226,151,130,0,0,0,0,0,0,0,0,0
LB_55: dq (0x0800_0000_0000_0000+0x7)
LB_55_DB: db 95,110,105,108,226,151,130,0,0,0,0,0,0,0,0,0
