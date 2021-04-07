%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 151
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_32_H: dq 0x4
LB_32: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_35_H: dq 0x1
LB_35: db 123,0,0,0,0,0,0,0,0,0
LB_38_H: dq 0x1
LB_38: db 32,0,0,0,0,0,0,0,0,0
LB_43_H: dq 0x7
LB_43: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_49_H: dq 0x1
LB_49: db 34,0,0,0,0,0,0,0,0,0
LB_54_H: dq 0x7
LB_54: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
LB_58_H: dq 0x2
LB_58: db 32,125,0,0,0,0,0,0,0,0,0
LB_61_H: dq 0x1
LB_61: db 10,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_17: ;; 
	MOV_RBX rdi,GLX(0x88)
	cmp rdi,0x0
	jz LB_19
	MOV_RBX rax,GLX(0x87)
	mov SRC_REG,rax
	MOV_RDI GLX(0x89),SX(0x0)
	MOV_RBX rax,GLX(0x87)
LB_20:
	mov rdi,0x8
	add rax,rdi
LB_21:
	MOV_RBX GLX(0x87),rax
	MOV_RBX rax,GLX(0x89)
LB_22:
 mov rdi,rax
 call free_opq
LB_23:
	MOV_RBX rax,GLX(0x88)
LB_24:
 sub rax,1 
LB_25:
	MOV_RBX GLX(0x88),rax
	jmp LB_17
LB_19:
 ret 
LB_18:
LB_8: ;; 
	MOV_RBX rdi,GLX(0x85)
	cmp rdi,0x0
	jz LB_10
	MOV_RBX rax,GLX(0x84)
	mov SRC_REG,rax
	MOV_RDI GLX(0x86),SX(0x0)
	MOV_RBX rax,GLX(0x84)
LB_11:
	mov rdi,0x8
	add rax,rdi
LB_12:
	MOV_RBX GLX(0x84),rax
	MOV_RBX rax,GLX(0x86)
LB_13:
 mov rdi,rax
 call free_opq
LB_14:
	MOV_RBX rax,GLX(0x85)
LB_15:
 sub rax,1 
LB_16:
	MOV_RBX GLX(0x85),rax
	MOV_RBX GLX(0x87),GLX(0x84)
	MOV_RBX GLX(0x88),GLX(0x85)
	jmp LB_17
LB_10:
 ret 
LB_9:
LB_1: ;; 
	MOV_RBX rax,GLX(0x81)
LB_2:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_3:
	MOV_RBX GLX(0x82),rdi
	MOV_RBX rax,GLX(0x81)
LB_4:
	mov rdi,rax
LB_5:
	MOV_RBX GLX(0x83),rdi
	MOV_RBX rax,GLX(0x83)
LB_6:
	mov rdi,0x8
	add rax,rdi
LB_7:
	MOV_RBX GLX(0x83),rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x81)
	push EXH_28
	MOV_RBX GLX(0x84),GLX(0x83)
	MOV_RBX GLX(0x85),GLX(0x82)
	call LB_8
	add rsp,8
	MOV_RDI GLX(0x81),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX rax,GLX(0x81)
LB_29:
 mov rdi,rax
 call free_opq
LB_30:
 ret 
EXH_28:
	add rsp,0x8
	pop rax
	jmp rax
LB_48: ;; 
	mov GLX(0x92),LB_49
	MOV_RBX rax,GLX(0x92)
LB_50:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_51:
	MOV_RBX rax,GLX(0x91)
LB_52:
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
LB_53:
	mov GLX(0x93),LB_54
	MOV_RBX rax,GLX(0x93)
LB_55:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_56:
	MOV_RBX GLX(0x0),GLX(0x91)
 ret 
LB_0: ;; 
	push EXH_31
	MOV_RBX GLX(0x81),GLX(0x80)
	call LB_1
	add rsp,8
	mov rax,0x21
	MOV_RBX GLX(0x8a),rax
	mov rsi,1  
	mov rdi,0x10
	xor rax,rax 
	CALLOC_SF
	mov QWORD [rax],0x2
	lea rdi,[rax+8]
	mov BYTE [rdi],0x4c
	add rdi,1 
	mov BYTE [rdi],0x4c
	add rdi,1 
	MOV_RBX GLX(0x8b),rax
	MOV_RBX GLX(0x0),GLX(0x8a)
	MOV_RBX GLX(0x1),GLX(0x8b)
	mov GLX(0x8c),LB_32
	MOV_RBX rax,GLX(0x8c)
LB_33:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_34:
	mov GLX(0x8d),LB_35
	MOV_RBX rax,GLX(0x8d)
LB_36:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_37:
	mov GLX(0x8e),LB_38
	MOV_RBX rax,GLX(0x8e)
LB_39:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_40:
	MOV_RBX rax,GLX(0x0)
LB_41:
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
 C_CALL fw
 add rsp,32 
LB_42:
	mov GLX(0x8f),LB_43
	MOV_RBX rax,GLX(0x8f)
LB_44:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_45:
	mov GLX(0x90),LB_38
	MOV_RBX rax,GLX(0x90)
LB_46:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_47:
	MOV_RBX GLX(0x94),GLX(0x0)
	push EXH_57
	MOV_RBX GLX(0x91),GLX(0x1)
	call LB_48
	add rsp,8
	mov GLX(0x95),LB_58
	MOV_RBX rax,GLX(0x95)
LB_59:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_60:
	mov GLX(0x96),LB_61
	MOV_RBX rax,GLX(0x96)
LB_62:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_63:
	MOV_RBX GLX(0x1),GLX(0x0)
	MOV_RBX GLX(0x0),GLX(0x94)
	MOV_RBX rax,GLX(0x1)
LB_64:
 mov rdi,rax
 call free_opq
LB_65:
 ret 
EXH_31:
	add rsp,0x8
	pop rax
	jmp rax
EXH_57:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_66
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_66:
	add rsp,0x8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,0x1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,0x2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,0x3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,0x4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,0x5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,0x6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,0x7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,0x8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,0x9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,0xa
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,0xb
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,0xc
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,0xd
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,0xe
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,0xf
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,0x10
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,0x11
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,0x12
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,0x13
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,0x14
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,0x15
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,0x16
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,0x17
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,0x18
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,0x19
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,0x1a
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,0x1b
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,0x1c
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,0x1d
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,0x1e
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,0x1f
	jmp sig_alc_rcd
	sig_alc_rcd_32:
	mov rbx,0x20
	jmp sig_alc_rcd
	sig_alc_rcd_33:
	mov rbx,0x21
	jmp sig_alc_rcd
	sig_alc_rcd_34:
	mov rbx,0x22
	jmp sig_alc_rcd
	sig_alc_rcd_35:
	mov rbx,0x23
	jmp sig_alc_rcd
	sig_alc_rcd_36:
	mov rbx,0x24
	jmp sig_alc_rcd
	sig_alc_rcd_37:
	mov rbx,0x25
	jmp sig_alc_rcd
	sig_alc_rcd_38:
	mov rbx,0x26
	jmp sig_alc_rcd
	sig_alc_rcd_39:
	mov rbx,0x27
	jmp sig_alc_rcd
	sig_alc_rcd_40:
	mov rbx,0x28
	jmp sig_alc_rcd
	sig_alc_rcd_41:
	mov rbx,0x29
	jmp sig_alc_rcd
	sig_alc_rcd_42:
	mov rbx,0x2a
	jmp sig_alc_rcd
	sig_alc_rcd_43:
	mov rbx,0x2b
	jmp sig_alc_rcd
	sig_alc_rcd_44:
	mov rbx,0x2c
	jmp sig_alc_rcd
	sig_alc_rcd_45:
	mov rbx,0x2d
	jmp sig_alc_rcd
	sig_alc_rcd_46:
	mov rbx,0x2e
	jmp sig_alc_rcd
	sig_alc_rcd_47:
	mov rbx,0x2f
	jmp sig_alc_rcd
	sig_alc_rcd_48:
	mov rbx,0x30
	jmp sig_alc_rcd
	sig_alc_rcd_49:
	mov rbx,0x31
	jmp sig_alc_rcd
	sig_alc_rcd_50:
	mov rbx,0x32
	jmp sig_alc_rcd
	sig_alc_rcd_51:
	mov rbx,0x33
	jmp sig_alc_rcd
	sig_alc_rcd_52:
	mov rbx,0x34
	jmp sig_alc_rcd
	sig_alc_rcd_53:
	mov rbx,0x35
	jmp sig_alc_rcd
	sig_alc_rcd_54:
	mov rbx,0x36
	jmp sig_alc_rcd
	sig_alc_rcd_55:
	mov rbx,0x37
	jmp sig_alc_rcd
	sig_alc_rcd_56:
	mov rbx,0x38
	jmp sig_alc_rcd
	sig_alc_rcd_57:
	mov rbx,0x39
	jmp sig_alc_rcd
	sig_alc_rcd_58:
	mov rbx,0x3a
	jmp sig_alc_rcd
	sig_alc_rcd_59:
	mov rbx,0x3b
	jmp sig_alc_rcd
	sig_alc_rcd_60:
	mov rbx,0x3c
	jmp sig_alc_rcd
	sig_alc_rcd_61:
	mov rbx,0x3d
	jmp sig_alc_rcd
	sig_alc_rcd_62:
	mov rbx,0x3e
	jmp sig_alc_rcd
	sig_alc_rcd_63:
	mov rbx,0x3f
	jmp sig_alc_rcd

%include "TEXT.s"
