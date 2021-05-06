%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 153
 
section .bss
%include "BSS.s"

	 GLV_0: resq 128
	 GLV_1: resq 0
	 GLV_2: resq 5
	 GLV_3: resq 7
	 GLV_4: resq 3
section .data
%include "DATA.s"
LB_81_H: dq 0x1
LB_81: db 10,0,0,0,0,0,0,0,0,0
LB_41_H: dq 0x1
LB_41: db 34,0,0,0,0,0,0,0,0,0
LB_37_H: dq 0x1
LB_37: db 32,0,0,0,0,0,0,0,0,0
LB_34_H: dq 0x1
LB_34: db 123,0,0,0,0,0,0,0,0,0
LB_69_H: dq 0x2
LB_69: db 32,125,0,0,0,0,0,0,0,0,0
LB_31_H: dq 0x4
LB_31: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_64_H: dq 0x7
LB_64: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_46_H: dq 0x7
LB_46: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
LB_55_H: dq 0x7
LB_55: db 95,99,110,115,226,151,130,0,0,0,0,0,0,0,0,0
LB_72_H: dq 0x7
LB_72: db 95,110,105,108,226,151,130,0,0,0,0,0,0,0,0,0
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
	mov QWORD [SS_RCD_TOP+8*rdi],~0
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
LB_7: ;; dlt_i,h=3
	MOV_RBX rdi,QWORD [(GLV_3+8*0x1)]
	cmp rdi,0x0
	jz LB_8
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
	mov SRC_REG,rax
	MOV_RBX QWORD [(GLV_3+8*0x2)],SX(0x0)
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
LB_9:
	mov rdi,0x8
	add rax,rdi
LB_10:
	MOV_RBX QWORD [(GLV_3+8*0x0)],rax
	MOV_RBX rax,QWORD [(GLV_3+8*0x2)]
LB_11:
 mov rdi,rax
 call free_opq
LB_12:
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_13:
 sub rax,1 
LB_14:
	MOV_RBX QWORD [(GLV_3+8*0x1)],rax
	jmp LB_7
LB_8:
 ret 
LB_40: ;; s8,h=3
	MOV_RBX QWORD [(GLV_3+8*0x1)],LB_41
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_42:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_43:
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
LB_44:
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
LB_45:
	MOV_RBX QWORD [(GLV_3+8*0x1)],LB_46
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_47:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_48:
	MOV_RBX QWORD [(GLV_0+8*0x0)],QWORD [(GLV_3+8*0x0)]
 ret 
LB_51: ;; lst,h=3
	MOV_RBX rdi,QWORD [(GLV_3+8*0x0)]
	jmp QWORD [LB_54+8*rdi]
LB_54: dq LB_52,LB_53
LB_52:
	MOV_RBX rdi,QWORD [(GLV_3+8*0x1)]
	lea SRC_REG,[rdi+8]
	MOV_RBX QWORD [(GLV_3+8*0x1)],SX(0x0)
	MOV_RBX QWORD [(GLV_3+8*0x0)],SX(0x1)
	MOV_RBX QWORD [(GLV_3+8*0x2)],SX(0x2)
	lea rdi,[SRC_REG-8]
	FREE_RCD 4,rdi
	MOV_RBX QWORD [(GLV_3+8*0x3)],LB_55
	MOV_RBX rax,QWORD [(GLV_3+8*0x3)]
LB_56:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_57:
	MOV_RBX QWORD [(GLV_3+8*0x3)],LB_34
	MOV_RBX rax,QWORD [(GLV_3+8*0x3)]
LB_58:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_59:
	MOV_RBX QWORD [(GLV_3+8*0x3)],LB_37
	MOV_RBX rax,QWORD [(GLV_3+8*0x3)]
LB_60:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_61:
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_62:
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
LB_63:
	MOV_RBX QWORD [(GLV_3+8*0x3)],LB_64
	MOV_RBX rax,QWORD [(GLV_3+8*0x3)]
LB_65:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_66:
	MOV_RBX QWORD [(GLV_3+8*0x3)],LB_37
	MOV_RBX rax,QWORD [(GLV_3+8*0x3)]
LB_67:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_68:
	lea rsp,[rsp-(8*0x1)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [(GLV_3+8*0x1)]
	sub rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x1)],QWORD [(GLV_3+8*0x2)]
	call LB_51
	add rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x1)],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX QWORD [(GLV_3+8*0x2)],LB_69
	MOV_RBX rax,QWORD [(GLV_3+8*0x2)]
LB_70:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_71:
	MOV_RBX QWORD [(GLV_3+8*0x2)],0
	ALC_RCD 4,rax
	MOV_RBX QWORD [(GLV_3+8*0x0)],rax
	lea DST_REG,[rax+8]
	MOV_RBX DX(0x0),QWORD [(GLV_3+8*0x1)]
	MOV_RBX DX(0x1),QWORD [(GLV_0+8*0x0)]
	MOV_RBX DX(0x2),QWORD [(GLV_0+8*0x1)]
	MOV_RBX QWORD [(GLV_0+8*0x0)],QWORD [(GLV_3+8*0x2)]
	MOV_RBX QWORD [(GLV_0+8*0x1)],QWORD [(GLV_3+8*0x0)]
 ret 
LB_53:
	MOV_RBX QWORD [(GLV_3+8*0x1)],LB_72
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_73:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_74:
	MOV_RBX QWORD [(GLV_3+8*0x1)],LB_34
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_75:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_76:
	MOV_RBX QWORD [(GLV_3+8*0x1)],LB_69
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_77:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_78:
	MOV_RBX QWORD [(GLV_3+8*0x1)],1
	MOV_RBX QWORD [(GLV_0+8*0x0)],QWORD [(GLV_3+8*0x1)]
 ret 
LB_95: ;; lst,h=4
	MOV_RBX rdi,QWORD [(GLV_4+8*0x0)]
	jmp QWORD [LB_98+8*rdi]
LB_98: dq LB_96,LB_97
LB_96:
	MOV_RBX rdi,QWORD [(GLV_4+8*0x1)]
	lea SRC_REG,[rdi+8]
	MOV_RBX QWORD [(GLV_4+8*0x1)],SX(0x0)
	MOV_RBX QWORD [(GLV_4+8*0x0)],SX(0x1)
	MOV_RBX QWORD [(GLV_4+8*0x2)],SX(0x2)
	lea rdi,[SRC_REG-8]
	FREE_RCD 4,rdi
	lea rsp,[rsp-(8*0x1)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [(GLV_4+8*0x1)]
	sub rsp,8
	MOV_RBX QWORD [(GLV_4+8*0x1)],QWORD [(GLV_4+8*0x2)]
	call LB_95
	add rsp,8
	MOV_RBX QWORD [(GLV_4+8*0x1)],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
 ret 
LB_97:
 ret 
LB_84: ;; dlt,h=3
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
LB_85:
 mov rdi,QWORD [rax] 
 sub rdi,1 
 mov QWORD [rax],rdi 
 xor rsi,rsi
 btr rdi,63 
 setc sil
LB_86:
	MOV_RBX QWORD [(GLV_3+8*0x1)],rdi
	MOV_RBX QWORD [(GLV_3+8*0x2)],rsi
	MOV_RBX rdi,QWORD [(GLV_3+8*0x1)]
	cmp rdi,0x0
	jnz LB_87
	MOV_RBX rdi,QWORD [(GLV_3+8*0x2)]
	cmp rdi,0x0
	jnz LB_88
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
LB_89:
	mov rdi,rax
LB_90:
	MOV_RBX QWORD [(GLV_3+8*0x1)],rdi
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
LB_91:
	mov rdi,0x8
	add rax,rdi
LB_92:
	MOV_RBX QWORD [(GLV_3+8*0x1)],rax
	MOV_RBX rax,QWORD [(GLV_3+8*0x1)]
	mov SRC_REG,rax
	MOV_RBX QWORD [(GLV_3+8*0x3)],SX(0x0)
	MOV_RBX QWORD [(GLV_3+8*0x4)],SX(0x1)
	MOV_RBX QWORD [(GLV_3+8*0x5)],SX(0x2)
	MOV_RBX QWORD [(GLV_3+8*0x6)],SX(0x3)
	MOV_RBX rax,QWORD [(GLV_3+8*0x4)]
LB_93:
 mov rdi,rax
 call free_opq
LB_94:
	lea rsp,[rsp-(8*0x2)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [(GLV_3+8*0x0)]
	MOV_RBX QWORD [rsp+8*0x1],QWORD [(GLV_3+8*0x2)]
	sub rsp,8
	MOV_RBX QWORD [(GLV_4+8*0x0)],QWORD [(GLV_3+8*0x5)]
	MOV_RBX QWORD [(GLV_4+8*0x1)],QWORD [(GLV_3+8*0x6)]
	call LB_95
	add rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x2)],QWORD [rsp+8*0x1]
	MOV_RBX QWORD [(GLV_3+8*0x0)],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x2)]
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
LB_99:
	FREE_RCD 8,rax
LB_100:
 ret 
LB_88:
	MOV_RBX rax,QWORD [(GLV_3+8*0x0)]
LB_101:
	FREE_RCD 8,rax
LB_102:
 ret 
LB_87:
 ret 
LB_0: ;; m41,h=2
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_1:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_2:
	MOV_RBX QWORD [(GLV_2+8*0x1)],rdi
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_3:
	mov rdi,rax
LB_4:
	MOV_RBX QWORD [(GLV_2+8*0x2)],rdi
	MOV_RBX rax,QWORD [(GLV_2+8*0x2)]
LB_5:
	mov rdi,0x8
	add rax,rdi
LB_6:
	MOV_RBX QWORD [(GLV_2+8*0x2)],rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [(GLV_2+8*0x0)]
	sub rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x0)],QWORD [(GLV_2+8*0x2)]
	MOV_RBX QWORD [(GLV_3+8*0x1)],QWORD [(GLV_2+8*0x1)]
	call LB_7
	add rsp,8
	MOV_RBX QWORD [(GLV_2+8*0x0)],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_15:
 mov rdi,rax
 call free_opq
LB_16:
LB_17:
	ALC_RCD 8,rax
LB_18:
	MOV_RBX QWORD [(GLV_2+8*0x0)],rax
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_19:
 mov QWORD [rax],1 
LB_20:
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_21:
	mov rdi,rax
LB_22:
	MOV_RBX QWORD [(GLV_2+8*0x1)],rdi
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
LB_23:
	mov rdi,0x8
	add rax,rdi
LB_24:
	MOV_RBX QWORD [(GLV_2+8*0x1)],rax
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
	mov DST_REG,rax
	mov rax,0x2
	mov DX(0x0),rax
	mov rsi,1  
	mov rdi,0x10
	xor rax,rax 
	CALLOC_SF
	mov QWORD [rax],0x2
	lea rdi,[rax+8]
	mov BYTE [rdi],0x44
	add rdi,1 
	mov BYTE [rdi],0x44
	add rdi,1 
	mov DX(0x1),rax
	mov DX(0x2),0x0
	ALC_RCD 4,rax
	mov DX(0x3),rax
	add rax,8 
	push rax 
	pop DST_REG
	mov rax,0x2
	mov DX(0x0),rax
	mov DX(0x1),0x1
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_25:
 mov rdi,QWORD [rax]
 bts rdi,63 
 jc err_ref_o
 mov QWORD [rax],rdi
LB_26:
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
LB_27:
	mov rdi,rax
LB_28:
	MOV_RBX QWORD [(GLV_2+8*0x1)],rdi
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
LB_29:
	mov rdi,0x8
	add rax,rdi
LB_30:
	MOV_RBX QWORD [(GLV_2+8*0x1)],rax
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
	mov SRC_REG,rax
	MOV_RBX QWORD [(GLV_2+8*0x2)],SX(0x1)
	MOV_RBX QWORD [(GLV_2+8*0x3)],SX(0x2)
	MOV_RBX QWORD [(GLV_2+8*0x4)],SX(0x3)
	MOV_RBX QWORD [(GLV_2+8*0x1)],LB_31
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
LB_32:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_33:
	MOV_RBX QWORD [(GLV_2+8*0x1)],LB_34
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
LB_35:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_36:
	MOV_RBX QWORD [(GLV_2+8*0x1)],LB_37
	MOV_RBX rax,QWORD [(GLV_2+8*0x1)]
LB_38:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_39:
	sub rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x0)],QWORD [(GLV_2+8*0x2)]
	call LB_40
	add rsp,8
	MOV_RBX QWORD [(GLV_2+8*0x2)],LB_37
	MOV_RBX rax,QWORD [(GLV_2+8*0x2)]
LB_49:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_50:
	lea rsp,[rsp-(8*0x2)]
	MOV_RBX QWORD [rsp+8*0x0],QWORD [(GLV_0+8*0x0)]
	MOV_RBX QWORD [rsp+8*0x1],QWORD [(GLV_2+8*0x0)]
	sub rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x0)],QWORD [(GLV_2+8*0x3)]
	MOV_RBX QWORD [(GLV_3+8*0x1)],QWORD [(GLV_2+8*0x4)]
	call LB_51
	add rsp,8
	MOV_RBX QWORD [(GLV_2+8*0x0)],QWORD [rsp+8*0x1]
	MOV_RBX QWORD [(GLV_2+8*0x4)],QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x2)]
	MOV_RBX QWORD [(GLV_2+8*0x3)],LB_69
	MOV_RBX rax,QWORD [(GLV_2+8*0x3)]
LB_79:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_80:
	MOV_RBX QWORD [(GLV_2+8*0x3)],LB_81
	MOV_RBX rax,QWORD [(GLV_2+8*0x3)]
LB_82:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_83:
	MOV_RBX rax,QWORD [(GLV_2+8*0x0)]
	mov DST_REG,rax
	MOV_RBX DX(0x1),QWORD [(GLV_2+8*0x4)]
	MOV_RBX DX(0x2),QWORD [(GLV_0+8*0x0)]
	MOV_RBX DX(0x3),QWORD [(GLV_0+8*0x1)]
	sub rsp,8
	MOV_RBX QWORD [(GLV_3+8*0x0)],QWORD [(GLV_2+8*0x0)]
	call LB_84
	add rsp,8
 ret 
RTM_0:
	sub rsp,8
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
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
