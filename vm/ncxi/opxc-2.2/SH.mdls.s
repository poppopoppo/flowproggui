%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 167
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_5_H: dq 0x4
LB_5: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_11_H: dq 0x5
LB_11: db 99,48,226,151,130,0,0,0,0,0,0,0,0,0
LB_13_H: dq 0x7
LB_13: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_15_H: dq 0x5
LB_15: db 99,49,226,151,130,0,0,0,0,0,0,0,0,0
LB_17_H: dq 0x1
LB_17: db 34,0,0,0,0,0,0,0,0,0
LB_18_H: dq 0x7
LB_18: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
LB_21_H: dq 0x1
LB_21: db 10,0,0,0,0,0,0,0,0,0
LB_33_H: dq 0x5
LB_33: db 99,50,226,151,130,0,0,0,0,0,0,0,0,0
LB_34_H: dq 0x1
LB_34: db 123,0,0,0,0,0,0,0,0,0
LB_35_H: dq 0x2
LB_35: db 32,125,0,0,0,0,0,0,0,0,0
LB_36_H: dq 0x5
LB_36: db 99,51,226,151,130,0,0,0,0,0,0,0,0,0
LB_37_H: dq 0x1
LB_37: db 32,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_12: ;; #0x◂◂(_none◂{}) 133'(= r ) ⊢ 0'(= r ) : ((_r64◂)→(_r64◂))
JMP_12:
	MOV_RBX rax,GLX(0x85)
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
	mov GLX(0x86),LB_13
	MOV_RBX rax,GLX(0x86)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX GLX(0x0),GLX(0x85)
 ret 
LB_16: ;; #0x◂◂(_none◂{}) 138'(= {| r8 |} ) ⊢ 0'(= {| r8 |} ) : ((_arr◂(_r8◂)◂{  })→(_arr◂(_r8◂)◂{  }))
JMP_16:
	mov GLX(0x8b),LB_17
	MOV_RBX rax,GLX(0x8b)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX rax,GLX(0x8a)
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
	mov GLX(0x8c),LB_18
	MOV_RBX rax,GLX(0x8c)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX GLX(0x0),GLX(0x8a)
 ret 
LB_6: ;; #0x◂◂(_none◂{}) 130'◂131'' ⊢ 0'◂1'' : ((.a5◂)→(.a5◂))
JMP_6:
	MOV_RBX rdi,GLX(0x82)
	jmp QWORD [LB_10+8*rdi]
LB_10: dq LB_8,LB_9
LB_8:
	mov GLX(0x84),LB_11
	MOV_RBX rax,GLX(0x84)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	push EXH_14
	MOV_RBX GLX(0x85),GLX(0x83)
	call LB_12
	add rsp,8
	mov GLX(0x87),0x0
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0x0)
	pop rax
	MOV_RBX GLX(0x88),rax
	MOV_RBX GLX(0x0),GLX(0x87)
	MOV_RBX GLX(0x1),GLX(0x88)
 ret 
LB_9:
	mov GLX(0x89),LB_15
	MOV_RBX rax,GLX(0x89)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	push EXH_19
	MOV_RBX GLX(0x8a),GLX(0x83)
	call LB_16
	add rsp,8
	mov GLX(0x8d),0x1
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0x0)
	pop rax
	MOV_RBX GLX(0x8e),rax
	MOV_RBX GLX(0x0),GLX(0x8d)
	MOV_RBX GLX(0x1),GLX(0x8e)
 ret 
LB_7:
EXH_14:
	add rsp,0x8
	pop rax
	jmp rax
EXH_19:
	add rsp,0x8
	pop rax
	jmp rax
LB_22: ;; 
	jmp QWORD [LB_25+8*r10]
LB_25: dq LB_23,LB_24
LB_23:
	jmp LB_26
LB_24:
	MOV_RBX rdi,r8
	FREE_OPQ 27
	jmp LB_26
LB_26:
 ret 
LB_28: ;; #0x◂◂(_none◂{}) 147'◂148'' ⊢ 0'◂1'' : ((.a6◂)→(.a6◂))
JMP_28:
	MOV_RBX rdi,GLX(0x93)
	jmp QWORD [LB_32+8*rdi]
LB_32: dq LB_30,LB_31
LB_30:
	mov GLX(0x95),LB_33
	MOV_RBX rax,GLX(0x95)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	mov GLX(0x96),LB_34
	MOV_RBX rax,GLX(0x96)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	mov GLX(0x97),LB_35
	MOV_RBX rax,GLX(0x97)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	mov GLX(0x98),0x0
	MOV_RBX GLX(0x0),GLX(0x98)
 ret 
LB_31:
	MOV_RBX rdi,GLX(0x94)
	push SRC_REG 
	mov SRC_REG,rdi 
	add SRC_REG,8
	MOV_RDI GLX(0x99),SX(0x0)
	MOV_RDI GLX(0x9a),SX(0x1)
	MOV_RDI GLX(0x9b),SX(0x2)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	pop SRC_REG 
	FREE_RCD 4,rdi
	mov GLX(0x9c),LB_36
	MOV_RBX rax,GLX(0x9c)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	mov GLX(0x9d),LB_34
	MOV_RBX rax,GLX(0x9d)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	mov GLX(0x9e),LB_37
	MOV_RBX rax,GLX(0x9e)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	push EXH_38
	MOV_RBX GLX(0x85),GLX(0x99)
	call LB_12
	add rsp,8
	mov GLX(0x9f),LB_37
	MOV_RBX rax,GLX(0x9f)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x0)
	push EXH_39
	MOV_RBX GLX(0x93),GLX(0x9a)
	MOV_RBX GLX(0x94),GLX(0x9b)
	call LB_28
	add rsp,8
	MOV_RDI GLX(0xa0),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	mov GLX(0xa1),LB_35
	MOV_RBX rax,GLX(0xa1)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	mov GLX(0xa2),0x1
	ALC_RCD 4,rax
	MOV_RBX GLX(0xa3),rax
	lea DST_REG,[rax+8]
	MOV_RDI DX(0x0),GLX(0xa0)
	MOV_RDI DX(0x1),GLX(0x0)
	MOV_RDI DX(0x2),GLX(0x1)
	MOV_RBX GLX(0x0),GLX(0xa2)
	MOV_RBX GLX(0x1),GLX(0xa3)
 ret 
LB_29:
EXH_38:
	add rsp,0x8
	pop rax
	jmp rax
EXH_39:
	add rsp,0x8
	pop rax
	jmp rax
LB_41: ;; 
	jmp QWORD [LB_44+8*r10]
LB_44: dq LB_42,LB_43
LB_42:
	jmp LB_45
LB_43:
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
	MOV_RBX r10,SX(0x1)
	MOV_RBX r8,SX(0x2)
	call LB_41
	pop r8
	FREE_RCD 4,r8
	pop SRC_REG
	jmp LB_45
LB_45:
 ret 
LB_0: ;; #0x◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : ((_arr◂(_arr◂(_r8◂)◂{  })◂{  })→{  })
JMP_0:
	MOV_RBX r8,GLX(0x80)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_1:
	cmp rsi,0
	jz LB_2
	push rsi 
	MOV_RBX rdi,SX(0x0)
	FREE_OPQ 3
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*0x1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 4
	mov GLX(0x81),LB_5
	MOV_RBX rax,GLX(0x81)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	push EXH_20
	mov GLX(0x8f),0x0
	sub rsp,8
	mov DST_REG,rsp
	mov rax,0x3
	mov DX(0x0),rax
	pop rax
	MOV_RBX GLX(0x90),rax
	MOV_RBX GLX(0x82),GLX(0x8f)
	MOV_RBX GLX(0x83),GLX(0x90)
	call LB_6
	add rsp,8
	mov GLX(0x91),LB_21
	MOV_RBX rax,GLX(0x91)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX r10,GLX(0x0)
	MOV_RBX r8,GLX(0x1)
	call LB_22
	mov GLX(0x92),LB_5
	MOV_RBX rax,GLX(0x92)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	lea rsp,[rsp-(8*0x0)]
	push EXH_40
	mov GLX(0xa4),0x1
	ALC_RCD 4,rax
	MOV_RBX GLX(0xa5),rax
	lea DST_REG,[rax+8]
	mov rax,0x4
	mov DX(0x0),rax
	mov DX(0x1),0x0
	MOV_RBX GLX(0x93),GLX(0xa4)
	MOV_RBX GLX(0x94),GLX(0xa5)
	call LB_28
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
	mov GLX(0xa6),LB_21
	MOV_RBX rax,GLX(0xa6)
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
	MOV_RBX r10,GLX(0x0)
	MOV_RBX r8,GLX(0x1)
	call LB_41
 ret 
EXH_20:
	add rsp,0x8
	pop rax
	jmp rax
EXH_40:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_46
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_46:
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
