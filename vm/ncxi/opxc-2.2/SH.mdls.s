%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 176
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_32_H: dq 0x4
LB_32: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_35_H: dq 0x3
LB_35: db 42,91,32,0,0,0,0,0,0,0,0,0
LB_42_H: dq 0x3
LB_42: db 32,124,32,0,0,0,0,0,0,0,0,0
LB_53_H: dq 0x1
LB_53: db 123,0,0,0,0,0,0,0,0,0
LB_56_H: dq 0x1
LB_56: db 32,0,0,0,0,0,0,0,0,0
LB_60_H: dq 0x1
LB_60: db 34,0,0,0,0,0,0,0,0,0
LB_65_H: dq 0x7
LB_65: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
LB_73_H: dq 0x7
LB_73: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_76_H: dq 0x2
LB_76: db 32,125,0,0,0,0,0,0,0,0,0
LB_81_H: dq 0x2
LB_81: db 32,93,0,0,0,0,0,0,0,0,0
LB_84_H: dq 0x1
LB_84: db 10,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_8: ;; arr_i
	MOV_RBX rdi,GLX(0x85)
	cmp rdi,0x0
	jz LB_10
	MOV_RBX rax,GLX(0x84)
	push SRC_REG 
	mov SRC_REG,rax
	add rax,(8*0x1)
	MOV_RBX GLX(0x84),rax
	MOV_RDI GLX(0x86),SX(0x0)
	pop SRC_REG
	MOV_RBX rax,GLX(0x86)
LB_11:
 mov rdi,rax
 call free_opq
LB_12:
	MOV_RBX rax,GLX(0x85)
LB_13:
 sub rax,1 
LB_14:
	MOV_RBX GLX(0x85),rax
	jmp LB_8
LB_10:
 ret 
LB_9:
LB_1: ;; arr
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
	push EXH_16
	MOV_RBX GLX(0x84),GLX(0x83)
	MOV_RBX GLX(0x85),GLX(0x82)
	call LB_8
	add rsp,8
	MOV_RDI GLX(0x81),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX rax,GLX(0x81)
LB_17:
 mov rdi,rax
 call free_opq
LB_18:
 ret 
EXH_16:
	add rsp,0x8
	pop rax
	jmp rax
LB_59: ;; s8
	mov GLX(0x95),LB_60
	MOV_RBX rax,GLX(0x95)
LB_61:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_62:
	MOV_RBX rax,GLX(0x94)
LB_63:
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
LB_64:
	mov GLX(0x96),LB_65
	MOV_RBX rax,GLX(0x96)
LB_66:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_67:
	MOV_RBX GLX(0x0),GLX(0x94)
 ret 
LB_87: ;; dlt
	MOV_RBX rax,GLX(0x9c)
LB_88:
 mov rdi,QWORD [rax] 
 sub rdi,1 
 mov QWORD [rax],rdi 
LB_89:
	MOV_RBX GLX(0x9d),rdi
	MOV_RBX rdi,GLX(0x9d)
	cmp rdi,0x0
	jnz LB_91
	MOV_RBX rax,GLX(0x9c)
LB_92:
	mov rdi,rax
LB_93:
	MOV_RBX GLX(0x9e),rdi
	MOV_RBX rax,GLX(0x9e)
LB_94:
	mov rdi,0x8
	add rax,rdi
LB_95:
	MOV_RBX GLX(0x9e),rax
	MOV_RBX rax,GLX(0x9e)
	push SRC_REG 
	mov SRC_REG,rax
	add rax,(8*0x2)
	MOV_RBX GLX(0x9e),rax
	MOV_RDI GLX(0x9f),SX(0x0)
	MOV_RDI GLX(0xa0),SX(0x1)
	pop SRC_REG
	MOV_RBX rax,GLX(0x9f)
LB_96:
 mov rdi,rax
 call free_opq
LB_97:
	MOV_RBX rax,GLX(0x9c)
LB_98:
	FREE_RCD 8,rax
LB_99:
 ret 
LB_91:
 ret 
LB_90:
LB_0: ;; m35
	push EXH_19
	MOV_RBX GLX(0x81),GLX(0x80)
	call LB_1
	add rsp,8
LB_20:
	ALC_RCD 8,rax
LB_21:
	MOV_RBX GLX(0x87),rax
	MOV_RBX rax,GLX(0x87)
LB_22:
 mov QWORD [rax],1 
LB_23:
	MOV_RBX rax,GLX(0x87)
LB_24:
	mov rdi,rax
LB_25:
	MOV_RBX GLX(0x88),rdi
	MOV_RBX rax,GLX(0x88)
LB_26:
	mov rdi,0x8
	add rax,rdi
LB_27:
	MOV_RBX GLX(0x88),rax
	MOV_RBX rax,GLX(0x88)
	push DST_REG
	mov DST_REG,rax
	add rax,(8*0x2)
	MOV_RBX GLX(0x88),rax
	mov rsi,1  
	mov rdi,0x10
	xor rax,rax 
	CALLOC_SF
	mov QWORD [rax],0x2
	lea rdi,[rax+8]
	mov BYTE [rdi],0x33
	add rdi,1 
	mov BYTE [rdi],0x33
	add rdi,1 
	mov DX(0x0),rax
	mov rax,0x221
	mov DX(0x1),rax
	pop DST_REG
	MOV_RBX rax,GLX(0x87)
LB_28:
 mov rdi,QWORD [rax] 
 add rdi,1 
 mov QWORD [rax],rdi 
LB_29:
	MOV_RBX rax,GLX(0x87)
LB_30:
	mov rdi,rax
LB_31:
	MOV_RBX GLX(0x89),rdi
	mov GLX(0x8a),LB_32
	MOV_RBX rax,GLX(0x8a)
LB_33:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_34:
	mov GLX(0x8b),LB_35
	MOV_RBX rax,GLX(0x8b)
LB_36:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_37:
	MOV_RBX rax,GLX(0x87)
LB_38:
 mov rdi,QWORD [rax]
LB_39:
	MOV_RBX GLX(0x8c),rdi
	MOV_RBX rax,GLX(0x8c)
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
 C_CALL fw
 add rsp,32 
LB_41:
	mov GLX(0x8d),LB_42
	MOV_RBX rax,GLX(0x8d)
LB_43:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_44:
	MOV_RBX rax,GLX(0x87)
LB_45:
 mov rdi,QWORD [rax]
 bts rdi,63 
 jc err_clc_o
 mov QWORD [rax],rdi
LB_46:
	MOV_RBX rax,GLX(0x87)
LB_47:
	mov rdi,rax
LB_48:
	MOV_RBX GLX(0x8e),rdi
	MOV_RBX rax,GLX(0x8e)
LB_49:
	mov rdi,0x8
	add rax,rdi
LB_50:
	MOV_RBX GLX(0x8e),rax
	MOV_RBX rax,GLX(0x8e)
LB_51:
	mov rdi,rax
LB_52:
	MOV_RBX GLX(0x8f),rdi
	MOV_RBX rax,GLX(0x8f)
	push SRC_REG 
	mov SRC_REG,rax
	add rax,(8*0x2)
	MOV_RBX GLX(0x8f),rax
	MOV_RDI GLX(0x90),SX(0x0)
	MOV_RDI GLX(0x91),SX(0x1)
	pop SRC_REG
	mov GLX(0x92),LB_53
	MOV_RBX rax,GLX(0x92)
LB_54:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_55:
	mov GLX(0x93),LB_56
	MOV_RBX rax,GLX(0x93)
LB_57:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_58:
	push EXH_68
	MOV_RBX GLX(0x94),GLX(0x90)
	call LB_59
	add rsp,8
	mov GLX(0x97),LB_56
	MOV_RBX rax,GLX(0x97)
LB_69:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_70:
	MOV_RBX rax,GLX(0x91)
LB_71:
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
LB_72:
	mov GLX(0x98),LB_73
	MOV_RBX rax,GLX(0x98)
LB_74:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_75:
	mov GLX(0x99),LB_76
	MOV_RBX rax,GLX(0x99)
LB_77:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_78:
	MOV_RBX rax,GLX(0x8e)
	push DST_REG
	mov DST_REG,rax
	add rax,(8*0x2)
	MOV_RBX GLX(0x8e),rax
	MOV_RDI DX(0x0),GLX(0x0)
	MOV_RDI DX(0x1),GLX(0x91)
	pop DST_REG
	MOV_RBX rax,GLX(0x87)
LB_79:
 btr QWORD [rax],63
LB_80:
	mov GLX(0x9a),LB_81
	MOV_RBX rax,GLX(0x9a)
LB_82:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_83:
	mov GLX(0x9b),LB_84
	MOV_RBX rax,GLX(0x9b)
LB_85:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_86:
	push EXH_100
	MOV_RBX GLX(0x9c),GLX(0x87)
	call LB_87
	add rsp,8
	mov GLX(0xa1),LB_32
	MOV_RBX rax,GLX(0xa1)
LB_101:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_102:
	mov GLX(0xa2),LB_35
	MOV_RBX rax,GLX(0xa2)
LB_103:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_104:
	MOV_RBX rax,GLX(0x89)
LB_105:
 mov rdi,QWORD [rax]
LB_106:
	MOV_RBX GLX(0xa3),rdi
	MOV_RBX rax,GLX(0xa3)
LB_107:
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
LB_108:
	mov GLX(0xa4),LB_42
	MOV_RBX rax,GLX(0xa4)
LB_109:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_110:
	MOV_RBX rax,GLX(0x89)
LB_111:
 mov rdi,QWORD [rax]
 bts rdi,63 
 jc err_clc_o
 mov QWORD [rax],rdi
LB_112:
	MOV_RBX rax,GLX(0x89)
LB_113:
	mov rdi,rax
LB_114:
	MOV_RBX GLX(0xa5),rdi
	MOV_RBX rax,GLX(0xa5)
LB_115:
	mov rdi,0x8
	add rax,rdi
LB_116:
	MOV_RBX GLX(0xa5),rax
	MOV_RBX rax,GLX(0xa5)
LB_117:
	mov rdi,rax
LB_118:
	MOV_RBX GLX(0xa6),rdi
	MOV_RBX rax,GLX(0xa6)
	push SRC_REG 
	mov SRC_REG,rax
	add rax,(8*0x2)
	MOV_RBX GLX(0xa6),rax
	MOV_RDI GLX(0xa7),SX(0x0)
	MOV_RDI GLX(0xa8),SX(0x1)
	pop SRC_REG
	mov GLX(0xa9),LB_53
	MOV_RBX rax,GLX(0xa9)
LB_119:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_120:
	mov GLX(0xaa),LB_56
	MOV_RBX rax,GLX(0xaa)
LB_121:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_122:
	push EXH_123
	MOV_RBX GLX(0x94),GLX(0xa7)
	call LB_59
	add rsp,8
	mov GLX(0xab),LB_56
	MOV_RBX rax,GLX(0xab)
LB_124:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_125:
	MOV_RBX rax,GLX(0xa8)
LB_126:
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
LB_127:
	mov GLX(0xac),LB_73
	MOV_RBX rax,GLX(0xac)
LB_128:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_129:
	mov GLX(0xad),LB_76
	MOV_RBX rax,GLX(0xad)
LB_130:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_131:
	MOV_RBX rax,GLX(0xa5)
	push DST_REG
	mov DST_REG,rax
	add rax,(8*0x2)
	MOV_RBX GLX(0xa5),rax
	MOV_RDI DX(0x0),GLX(0x0)
	MOV_RDI DX(0x1),GLX(0xa8)
	pop DST_REG
	MOV_RBX rax,GLX(0x89)
LB_132:
 btr QWORD [rax],63
LB_133:
	mov GLX(0xae),LB_81
	MOV_RBX rax,GLX(0xae)
LB_134:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_135:
	mov GLX(0xaf),LB_84
	MOV_RBX rax,GLX(0xaf)
LB_136:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_137:
	push EXH_138
	MOV_RBX GLX(0x9c),GLX(0x89)
	call LB_87
	add rsp,8
 ret 
EXH_19:
	add rsp,0x8
	pop rax
	jmp rax
EXH_68:
	add rsp,0x8
	pop rax
	jmp rax
EXH_100:
	add rsp,0x8
	pop rax
	jmp rax
EXH_123:
	add rsp,0x8
	pop rax
	jmp rax
EXH_138:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_139
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_139:
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
