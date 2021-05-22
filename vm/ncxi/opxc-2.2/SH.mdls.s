%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 134
%define GLV_2 GLV+8*0x80
 
section .bss 
	GLV: resq GLV_N
%include "BSS.s"

section .data
%include "DATA.s"
LB_79_H: dq 0x1
LB_79: db 10,0,0,0,0,0,0,0,0,0
LB_143_H: dq 0x1
LB_143: db 34,0,0,0,0,0,0,0,0,0
LB_63_H: dq 0x1
LB_63: db 32,0,0,0,0,0,0,0,0,0
LB_113_H: dq 0x1
LB_113: db 123,0,0,0,0,0,0,0,0,0
LB_76_H: dq 0x1
LB_76: db 125,0,0,0,0,0,0,0,0,0
LB_165_H: dq 0x2
LB_165: db 32,125,0,0,0,0,0,0,0,0,0
LB_41_H: dq 0x3
LB_41: db 123,43,32,0,0,0,0,0,0,0,0,0
LB_36_H: dq 0x4
LB_36: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_60_H: dq 0x7
LB_60: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_148_H: dq 0x7
LB_148: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
	mov rdi,NULL 
	C_CALL ini_prc 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 
	mov QWORD [SIG_ETR],sig_dft 
	mov QWORD [SIG_FLG],0 
	mov rdi,0 
ini_ss_rcd:
	mov QWORD [SS_RCD_N+8*rdi],0 
	mov QWORD [SS_RCD_C+8*rdi],0
	mov QWORD [SS_RCD_TOP+8*rdi],0
	add rdi,1 
	cmp rdi,RCD_N
	jnz ini_ss_rcd  
; _args 
	mov rdi,QWORD [rsp]
	lea rdi,[rdi+1]
	mov rsi,8 
	xor rax,rax 
	C_CALL calloc
	pop r13
	mov QWORD [rax],r13
	xor r14,r14
	mov rbx,rax
	args_lp:
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [rbx+8+8*r14],rax
	add r14,1 
	jmp args_lp 
	args_lp_end:
	mov QWORD [GLV_2],rbx
	push exn_dft 
	push exn_dft
	jmp RTM_0
LB_7: ;; dlt_i,i=1
	mov     rdi,QWORD [GLV+8*0x82]
	cmp rdi,0x0
	jz LB_8
	mov     rax,QWORD [GLV+8*0x81]
	mov SRC_REG,rax
	MOV_RBX QWORD [GLV+8*0x83],SX(0x0)
	mov     rax,QWORD [GLV+8*0x81]
LB_9:
	mov rdi,0x8
	add rax,rdi
LB_10:
	mov     QWORD [GLV+8*0x81],rax
	mov     rax,QWORD [GLV+8*0x83]
LB_11:
 mov rdi,rax
 call free_opq
LB_12:
	mov     rax,QWORD [GLV+8*0x82]
LB_13:
 sub rax,1 
LB_14:
	mov     QWORD [GLV+8*0x82],rax
	jmp LB_7
LB_8:
 ret 
LB_28: ;; mk_i,i=3
	mov     rdi,QWORD [GLV+8*0x82]
	cmp rdi,0x0
	jz LB_29
	mov     rax,QWORD [GLV+8*0x80]
LB_30:
	mov rdi,rax
LB_31:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x81]
	mov DST_REG,rax
	MOV_RBX DX(0x0),QWORD [GLV+8*0x83]
	mov     rax,QWORD [GLV+8*0x81]
LB_32:
	mov rdi,0x8
	add rax,rdi
LB_33:
	mov     QWORD [GLV+8*0x81],rax
	mov     rax,QWORD [GLV+8*0x82]
LB_34:
 sub rax,1 
LB_35:
	mov     QWORD [GLV+8*0x82],rax
	jmp LB_28
LB_29:
	mov     r12,QWORD [GLV+8*0x80]
 ret 
LB_17: ;; mk,i=2
	mov     rax,QWORD [GLV+8*0x80]
LB_18:
	mov rdi,rax
LB_19:
	mov     QWORD [GLV+8*0x82],rdi
	mov     rax,QWORD [GLV+8*0x80]
	mov     rdi,QWORD [GLV+8*0x82]
LB_20:
 push rax
 lea rdi,[8+8*rdi]
 mov rsi,1
 xor rax,rax 
 CALLOC_SF
 pop QWORD [rax]
 mov rdi,rax
LB_21:
	mov     QWORD [GLV+8*0x82],rdi
	mov     rax,QWORD [GLV+8*0x82]
LB_22:
	mov rdi,rax
LB_23:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x83]
LB_24:
	mov rdi,0x8
	add rax,rdi
LB_25:
	mov     QWORD [GLV+8*0x83],rax
	mov     rax,QWORD [GLV+8*0x80]
LB_26:
	mov rdi,rax
LB_27:
	mov     QWORD [GLV+8*0x84],rdi
	lea rsp,[rsp-(8*0x2)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [GLV+8*0x80]
	MOV_RBX QWORD [rsp+8*0x1],QWORD [GLV+8*0x82]
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [GLV+8*0x81]
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x83]
	MOV_RBX QWORD [GLV+8*0x82],QWORD [GLV+8*0x84]
	call LB_28
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [rsp+8*0x0]
	MOV_RBX QWORD [GLV+8*0x81],QWORD [rsp+8*0x1]
	lea rsp,[rsp+(8*0x2)]
	mov     r13,r12
	mov     r12,QWORD [GLV+8*0x80]
	mov     r14,QWORD [GLV+8*0x81]
 ret 
LB_44: ;; arr_i,i=4
	mov     rdi,QWORD [GLV+8*0x82]
	mov     rax,QWORD [GLV+8*0x81]
	cmp rax,rdi
	jz LB_45
	mov     rax,QWORD [GLV+8*0x80]
LB_46:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_47:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x83]
	mov     rdi,QWORD [GLV+8*0x82]
LB_48:
 cmp rdi,rax 
 jge err_alc_o 
LB_49:
	mov     rax,QWORD [GLV+8*0x82]
LB_50:
	mov rdi,rax
LB_51:
	mov     QWORD [GLV+8*0x84],rdi
	mov     rax,QWORD [GLV+8*0x84]
LB_52:
 lea rax,[8+8*rax]
LB_53:
	mov     QWORD [GLV+8*0x84],rax
	mov     rax,QWORD [GLV+8*0x80]
LB_54:
	mov rdi,rax
LB_55:
	mov     QWORD [GLV+8*0x85],rdi
	mov     rax,QWORD [GLV+8*0x85]
	mov     rdi,QWORD [GLV+8*0x84]
LB_56:
	add rax,rdi
LB_57:
	mov     QWORD [GLV+8*0x85],rax
	mov     QWORD [GLV+8*0x84],rdi
	mov     rax,QWORD [GLV+8*0x85]
	mov SRC_REG,rax
	MOV_RBX QWORD [GLV+8*0x84],SX(0x0)
	mov     rax,QWORD [GLV+8*0x84]
LB_58:
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
LB_59:
	MOV_RBX QWORD [GLV+8*0x83],LB_60
	mov     rax,QWORD [GLV+8*0x83]
LB_61:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_62:
	MOV_RBX QWORD [GLV+8*0x83],LB_63
	mov     rax,QWORD [GLV+8*0x83]
LB_64:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_65:
	mov     rax,QWORD [GLV+8*0x82]
LB_66:
	mov rdi,rax
LB_67:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x83]
LB_68:
 lea rax,[8+8*rax]
LB_69:
	mov     QWORD [GLV+8*0x83],rax
	mov     rax,QWORD [GLV+8*0x80]
LB_70:
	mov rdi,rax
LB_71:
	mov     QWORD [GLV+8*0x85],rdi
	mov     rax,QWORD [GLV+8*0x85]
	mov     rdi,QWORD [GLV+8*0x83]
LB_72:
	add rax,rdi
LB_73:
	mov     QWORD [GLV+8*0x85],rax
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x85]
	mov DST_REG,rax
	MOV_RBX DX(0x0),QWORD [GLV+8*0x84]
	mov     rax,QWORD [GLV+8*0x82]
LB_74:
 add rax,1 
LB_75:
	mov     QWORD [GLV+8*0x82],rax
	jmp LB_44
LB_45:
	MOV_RBX QWORD [GLV+8*0x83],LB_76
	mov     rax,QWORD [GLV+8*0x83]
LB_77:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_78:
	mov     r12,QWORD [GLV+8*0x80]
 ret 
LB_97: ;; map_r_e_i,i=6
	mov     rdi,QWORD [GLV+8*0x83]
	mov     rax,QWORD [GLV+8*0x84]
	cmp rax,rdi
	jz LB_98
	mov     rax,QWORD [GLV+8*0x81]
	mov SRC_REG,rax
	MOV_RBX QWORD [GLV+8*0x85],SX(0x0)
	mov     rax,QWORD [GLV+8*0x81]
LB_99:
	mov rdi,0x8
	add rax,rdi
LB_100:
	mov     QWORD [GLV+8*0x81],rax
	mov     rax,QWORD [GLV+8*0x85]
	mov     rdi,QWORD [GLV+8*0x80]
LB_101:
	add rax,rdi
LB_102:
	mov     QWORD [GLV+8*0x85],rax
	mov     QWORD [GLV+8*0x80],rdi
	mov rdi,0
	mov     rax,QWORD [GLV+8*0x85]
	mov rsi,rdi  
	sub rsp,32 
	lea rdi,[rsp+31]
	push rsi 
	call pf_d_rv 
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,0x0
	push rdi 
	call mlc_s8 
	pop rdi
	lea rdi,[rax+7+rdi]
	std 
	mov     QWORD [GLV+8*0x86],rax
	pop rcx 
	lea rsi,[rsp+31] 
	rep movsb
	add rsp,32
	mov     rax,QWORD [GLV+8*0x80]
LB_103:
 add rax,1 
LB_104:
	mov     QWORD [GLV+8*0x80],rax
	mov     rax,QWORD [GLV+8*0x82]
	mov DST_REG,rax
	MOV_RBX DX(0x0),QWORD [GLV+8*0x86]
	mov     rax,QWORD [GLV+8*0x82]
LB_105:
	mov rdi,0x8
	add rax,rdi
LB_106:
	mov     QWORD [GLV+8*0x82],rax
	mov     rax,QWORD [GLV+8*0x84]
LB_107:
 add rax,1 
LB_108:
	mov     QWORD [GLV+8*0x84],rax
	jmp LB_97
LB_98:
	mov     r12,QWORD [GLV+8*0x80]
 ret 
LB_82: ;; map_r_e,i=5
	mov     rax,QWORD [GLV+8*0x81]
LB_83:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_84:
	mov     QWORD [GLV+8*0x82],rdi
	mov     rax,QWORD [GLV+8*0x82]
LB_85:
	mov rdi,rax
LB_86:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x82]
	mov     rdi,QWORD [GLV+8*0x83]
LB_87:
 push rax
 lea rdi,[8+8*rdi]
 mov rsi,1
 xor rax,rax 
 CALLOC_SF
 pop QWORD [rax]
 mov rdi,rax
LB_88:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x83]
LB_89:
	mov rdi,rax
LB_90:
	mov     QWORD [GLV+8*0x84],rdi
	mov     rax,QWORD [GLV+8*0x83]
LB_91:
	mov rdi,0x8
	add rax,rdi
LB_92:
	mov     QWORD [GLV+8*0x83],rax
	mov     rax,QWORD [GLV+8*0x81]
LB_93:
	mov rdi,rax
LB_94:
	mov     QWORD [GLV+8*0x85],rdi
	mov     rax,QWORD [GLV+8*0x81]
LB_95:
	mov rdi,0x8
	add rax,rdi
LB_96:
	mov     QWORD [GLV+8*0x81],rax
	lea rsp,[rsp-(8*0x2)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [GLV+8*0x85]
	MOV_RBX QWORD [rsp+8*0x1],QWORD [GLV+8*0x84]
	sub rsp,8
	mov     rax,QWORD [GLV+8*0x83]
	MOV_RBX QWORD [GLV+8*0x83],QWORD [GLV+8*0x82]
	mov     QWORD [GLV+8*0x82],rax
	mov rax,0x0
	mov     QWORD [GLV+8*0x84],rax
	call LB_97
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [rsp+8*0x0]
	MOV_RBX QWORD [GLV+8*0x81],QWORD [rsp+8*0x1]
	lea rsp,[rsp+(8*0x2)]
	mov     rax,QWORD [GLV+8*0x80]
LB_109:
 mov rdi,rax
 call free_opq
LB_110:
	mov     r13,QWORD [GLV+8*0x81]
 ret 
LB_142: ;; s8,i=8
	MOV_RBX QWORD [GLV+8*0x84],LB_143
	mov     rax,QWORD [GLV+8*0x84]
LB_144:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_145:
	mov     rax,QWORD [GLV+8*0x83]
LB_146:
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
LB_147:
	MOV_RBX QWORD [GLV+8*0x84],LB_148
	mov     rax,QWORD [GLV+8*0x84]
LB_149:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_150:
	mov     r12,QWORD [GLV+8*0x83]
 ret 
LB_128: ;; arr_i,i=7
	mov     rdi,QWORD [GLV+8*0x82]
	mov     rax,QWORD [GLV+8*0x81]
	cmp rax,rdi
	jz LB_129
	mov     rax,QWORD [GLV+8*0x80]
LB_130:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_131:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x83]
	mov     rdi,QWORD [GLV+8*0x82]
LB_132:
 cmp rdi,rax 
 jge err_alc_o 
LB_133:
	mov     rax,QWORD [GLV+8*0x82]
LB_134:
	mov rdi,rax
LB_135:
	mov     QWORD [GLV+8*0x84],rdi
	mov     rax,QWORD [GLV+8*0x84]
LB_136:
 lea rax,[8+8*rax]
LB_137:
	mov     QWORD [GLV+8*0x84],rax
	mov     rax,QWORD [GLV+8*0x80]
LB_138:
	mov rdi,rax
LB_139:
	mov     QWORD [GLV+8*0x85],rdi
	mov     rax,QWORD [GLV+8*0x85]
	mov     rdi,QWORD [GLV+8*0x84]
LB_140:
	add rax,rdi
LB_141:
	mov     QWORD [GLV+8*0x85],rax
	mov     QWORD [GLV+8*0x84],rdi
	mov     rax,QWORD [GLV+8*0x85]
	mov SRC_REG,rax
	MOV_RBX QWORD [GLV+8*0x84],SX(0x0)
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x83],QWORD [GLV+8*0x84]
	call LB_142
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x83],LB_63
	mov     rax,QWORD [GLV+8*0x83]
LB_151:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_152:
	mov     rax,QWORD [GLV+8*0x82]
LB_153:
	mov rdi,rax
LB_154:
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x83]
LB_155:
 lea rax,[8+8*rax]
LB_156:
	mov     QWORD [GLV+8*0x83],rax
	mov     rax,QWORD [GLV+8*0x80]
LB_157:
	mov rdi,rax
LB_158:
	mov     QWORD [GLV+8*0x84],rdi
	mov     rax,QWORD [GLV+8*0x84]
	mov     rdi,QWORD [GLV+8*0x83]
LB_159:
	add rax,rdi
LB_160:
	mov     QWORD [GLV+8*0x84],rax
	mov     QWORD [GLV+8*0x83],rdi
	mov     rax,QWORD [GLV+8*0x84]
	mov DST_REG,rax
	mov     DX(0x0),r12
	mov     rax,QWORD [GLV+8*0x82]
LB_161:
 add rax,1 
LB_162:
	mov     QWORD [GLV+8*0x82],rax
	jmp LB_128
LB_129:
	MOV_RBX QWORD [GLV+8*0x83],LB_76
	mov     rax,QWORD [GLV+8*0x83]
LB_163:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_164:
	mov     r12,QWORD [GLV+8*0x80]
 ret 
LB_179: ;; of_lst_i,i=10
	mov     rdi,QWORD [GLV+8*0x81]
	jmp QWORD [LB_182+8*rdi]
LB_182: dq LB_180,LB_181
LB_180:
	mov     rdi,QWORD [GLV+8*0x82]
	lea SRC_REG,[rdi+8]
	MOV_RBX QWORD [GLV+8*0x81],SX(0x0)
	MOV_RBX QWORD [GLV+8*0x82],SX(0x1)
	MOV_RBX QWORD [GLV+8*0x83],SX(0x2)
	lea rdi,[SRC_REG-8]
	FREE_RCD 4,rdi
	mov     rax,QWORD [GLV+8*0x80]
LB_183:
 add rax,1 
LB_184:
	mov     QWORD [GLV+8*0x80],rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [GLV+8*0x81]
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x82]
	MOV_RBX QWORD [GLV+8*0x82],QWORD [GLV+8*0x83]
	call LB_179
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	mov     rax,r12
LB_185:
	mov rdi,0x8
	sub rax,rdi
LB_186:
	mov     r12,rax
	mov     rax,r12
	mov DST_REG,rax
	MOV_RBX DX(0x0),QWORD [GLV+8*0x80]
 ret 
LB_181:
	mov     rax,QWORD [GLV+8*0x80]
LB_187:
	mov rdi,rax
LB_188:
	mov     QWORD [GLV+8*0x81],rdi
	mov     rax,QWORD [GLV+8*0x80]
	mov     rdi,QWORD [GLV+8*0x81]
LB_189:
 push rax
 lea rdi,[8+8*rdi]
	push rdi 
 mov rsi,1
 xor rax,rax 
 CALLOC_SF
	pop rsi 
 pop QWORD [rax]
 mov rdi,rax
LB_190:
	mov     QWORD [GLV+8*0x81],rdi
	mov     QWORD [GLV+8*0x82],rsi
	mov     rax,QWORD [GLV+8*0x81]
	mov     rdi,QWORD [GLV+8*0x82]
LB_191:
	add rax,rdi
LB_192:
	mov     QWORD [GLV+8*0x81],rax
	mov     QWORD [GLV+8*0x82],rdi
	mov     r12,QWORD [GLV+8*0x81]
 ret 
LB_178: ;; of_lst,i=9
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x82],QWORD [GLV+8*0x81]
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x80]
	mov rax,0x0
	mov     QWORD [GLV+8*0x80],rax
	call LB_179
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
	mov     rax,r12
LB_193:
	mov rdi,0x8
	sub rax,rdi
LB_194:
	mov     r12,rax
 ret 
LB_209: ;; dlt_i,i=11
	mov     rdi,QWORD [GLV+8*0x81]
	cmp rdi,0x0
	jz LB_210
	mov     rax,QWORD [GLV+8*0x80]
	mov SRC_REG,rax
	MOV_RBX QWORD [GLV+8*0x82],SX(0x0)
	mov     rax,QWORD [GLV+8*0x80]
LB_211:
	mov rdi,0x8
	add rax,rdi
LB_212:
	mov     QWORD [GLV+8*0x80],rax
	mov     rax,QWORD [GLV+8*0x81]
LB_213:
 sub rax,1 
LB_214:
	mov     QWORD [GLV+8*0x81],rax
	jmp LB_209
LB_210:
 ret 
LB_0: ;; m46,i=0
	mov     rax,QWORD [GLV+8*0x80]
LB_1:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_2:
	mov     QWORD [GLV+8*0x81],rdi
	mov     rax,QWORD [GLV+8*0x80]
LB_3:
	mov rdi,rax
LB_4:
	mov     QWORD [GLV+8*0x82],rdi
	mov     rax,QWORD [GLV+8*0x82]
LB_5:
	mov rdi,0x8
	add rax,rdi
LB_6:
	mov     QWORD [GLV+8*0x82],rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [GLV+8*0x80]
	sub rsp,8
	mov     rax,QWORD [GLV+8*0x82]
	MOV_RBX QWORD [GLV+8*0x82],QWORD [GLV+8*0x81]
	mov     QWORD [GLV+8*0x81],rax
	call LB_7
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	mov     rax,QWORD [GLV+8*0x80]
LB_15:
 mov rdi,rax
 call free_opq
LB_16:
	sub rsp,8
	mov rax,0x4
	mov     QWORD [GLV+8*0x81],rax
	mov rax,0x6
	mov     QWORD [GLV+8*0x80],rax
	call LB_17
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],LB_36
	mov     rax,QWORD [GLV+8*0x80]
LB_37:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_38:
	mov     rax,r14
LB_39:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_40:
	mov     QWORD [GLV+8*0x80],rdi
	MOV_RBX QWORD [GLV+8*0x81],LB_41
	mov     rax,QWORD [GLV+8*0x81]
LB_42:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_43:
	lea rsp,[rsp-(8*0x0)]
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x80]
	mov     QWORD [GLV+8*0x80],r14
	mov rax,0x0
	mov     QWORD [GLV+8*0x82],rax
	call LB_44
	add rsp,8
	lea rsp,[rsp+(8*0x0)]
	MOV_RBX QWORD [GLV+8*0x80],LB_79
	mov     rax,QWORD [GLV+8*0x80]
LB_80:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_81:
	sub rsp,8
	mov     QWORD [GLV+8*0x81],r12
	mov rax,0x2
	mov     QWORD [GLV+8*0x80],rax
	call LB_82
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],LB_36
	mov     rax,QWORD [GLV+8*0x80]
LB_111:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_112:
	MOV_RBX QWORD [GLV+8*0x80],LB_113
	mov     rax,QWORD [GLV+8*0x80]
LB_114:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_115:
	MOV_RBX QWORD [GLV+8*0x80],LB_63
	mov     rax,QWORD [GLV+8*0x80]
LB_116:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_117:
	mov     rax,r12
LB_118:
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
LB_119:
	MOV_RBX QWORD [GLV+8*0x80],LB_60
	mov     rax,QWORD [GLV+8*0x80]
LB_120:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_121:
	MOV_RBX QWORD [GLV+8*0x80],LB_63
	mov     rax,QWORD [GLV+8*0x80]
LB_122:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_123:
	mov     rax,r13
LB_124:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_125:
	mov     QWORD [GLV+8*0x80],rdi
	MOV_RBX QWORD [GLV+8*0x81],LB_41
	mov     rax,QWORD [GLV+8*0x81]
LB_126:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_127:
	lea rsp,[rsp-(8*0x1)]
	mov     QWORD [rsp+8*0x0],r12
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x80]
	mov     QWORD [GLV+8*0x80],r13
	mov rax,0x0
	mov     QWORD [GLV+8*0x82],rax
	call LB_128
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX QWORD [GLV+8*0x81],LB_165
	mov     rax,QWORD [GLV+8*0x81]
LB_166:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_167:
	MOV_RBX QWORD [GLV+8*0x81],LB_79
	mov     rax,QWORD [GLV+8*0x81]
LB_168:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_169:
	mov     rax,r12
LB_170:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_171:
	mov     QWORD [GLV+8*0x80],rdi
	mov     rax,r12
LB_172:
	mov rdi,rax
LB_173:
	mov     QWORD [GLV+8*0x81],rdi
	mov     rax,QWORD [GLV+8*0x81]
LB_174:
	mov rdi,0x8
	add rax,rdi
LB_175:
	mov     QWORD [GLV+8*0x81],rax
	MOV_RBX QWORD [GLV+8*0x82],QWORD [GLV+8*0x80]
	mov     QWORD [GLV+8*0x80],r12
	sub rsp,8
	call LB_7
	add rsp,8
	mov     rax,QWORD [GLV+8*0x80]
LB_176:
 mov rdi,rax
 call free_opq
LB_177:
	sub rsp,8
LB_217: ; alc_rcd
	ALC_N 4
	push rax
	lea DST_REG,[rax+8]
	mov rax,0x3
	mov DX(0x0),rax
	mov DX(0x1),0x0
LB_218: ; alc_rcd
	ALC_N 4
	mov DX(0x2),rax
	add rax,8 
	push rax 
	pop DST_REG
	mov rax,0x22b
	mov DX(0x0),rax
	mov DX(0x1),0x0
LB_219: ; alc_rcd
	ALC_N 4
	mov DX(0x2),rax
	add rax,8 
	push rax 
	pop DST_REG
	mov rax,0xc
	mov DX(0x0),rax
	mov DX(0x1),0x0
LB_220: ; alc_rcd
	ALC_N 4
	mov DX(0x2),rax
	add rax,8 
	push rax 
	pop DST_REG
	mov rax,0x0
	mov DX(0x0),rax
	mov DX(0x1),0x1
	mov rax,0x0
	mov     QWORD [GLV+8*0x80],rax
	pop rax
	mov     QWORD [GLV+8*0x81],rax
	call LB_178
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],LB_36
	mov     rax,QWORD [GLV+8*0x80]
LB_195:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_196:
	mov     rax,r12
LB_197:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_198:
	mov     QWORD [GLV+8*0x80],rdi
	MOV_RBX QWORD [GLV+8*0x81],LB_41
	mov     rax,QWORD [GLV+8*0x81]
LB_199:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_200:
	sub rsp,8
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x80]
	mov     QWORD [GLV+8*0x80],r12
	mov rax,0x0
	mov     QWORD [GLV+8*0x82],rax
	call LB_44
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],LB_79
	mov     rax,QWORD [GLV+8*0x80]
LB_201:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_202:
	mov     rax,r12
LB_203:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_204:
	mov     QWORD [GLV+8*0x80],rdi
	mov     rax,r12
LB_205:
	mov rdi,rax
LB_206:
	mov     QWORD [GLV+8*0x81],rdi
	mov     rax,QWORD [GLV+8*0x81]
LB_207:
	mov rdi,0x8
	add rax,rdi
LB_208:
	mov     QWORD [GLV+8*0x81],rax
	lea rsp,[rsp-(8*0x1)]
	mov     QWORD [rsp+8*0x0],r12
	sub rsp,8
	mov     rax,QWORD [GLV+8*0x81]
	MOV_RBX QWORD [GLV+8*0x81],QWORD [GLV+8*0x80]
	mov     QWORD [GLV+8*0x80],rax
	call LB_209
	add rsp,8
	MOV_RBX QWORD [GLV+8*0x80],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	mov     rax,QWORD [GLV+8*0x80]
LB_215:
 mov rdi,rax
 call free_opq
LB_216:
 ret 
RTM_0:
	sub rsp,8
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit

%include "TEXT.s"
