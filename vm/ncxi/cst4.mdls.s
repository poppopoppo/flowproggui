%define MOV_OFS_0 0
%define MOV_OFS_1 2
%include "cmu.s"
main:
	mov r12,~0
	call SFLS_X_INIT
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
	mov r8,rax
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
 mov r13,rax
    or rax,1
    mov [args],rax
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r8
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r10,rax
    	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
 mov r8,rax
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r10
    sub r14,1
    jmp args_lp
  args_end:
  	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
 mov rcx,0x0000_0000_0000_ffff
    mov [rax],rcx
    mov rcx,0x0100_0000_0000_0001
    or rax,rcx
    mov [r13+16],rax
	call NS_E_175
	call exec_out
	jmp _end
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_39: dq 0
NS_E_39:
NS_E_RDI_39:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_73
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_73:
	mov r8,1
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_75_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_75_LB_0:
	mov r8,1
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rax],rsi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_76:
NS_E_RDI_76:
NS_E_76_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_76_LB_0
	cmp r11,57
	ja NS_E_76_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_76_LB_0:
	mov rax,0
	ret
NS_E_79:
NS_E_RDI_79:
NS_E_79_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb LB_80
	cmp r11,122
	ja LB_80
	add rsi,1
	mov rax,1
	ret
LB_80:
	mov rax,0
	ret
NS_E_77:
NS_E_RDI_77:
NS_E_77_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb LB_78
	cmp r11,90
	ja LB_78
	add rsi,1
	mov rax,1
	ret
LB_78:
	mov rax,0
	ret
NS_E_46:
	mov rdi,r13
	bt r12,0
NS_E_RDI_46:
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
NS_E_ID_60: dq 0
NS_E_60:
NS_E_RDI_60:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_111
	bt QWORD [rdi],17
	jnc LB_111
	bt QWORD [rdi],0
	jc LB_113
	btr r12,2
	clc
	jmp LB_114
LB_113:
	bts r12,2
	stc
LB_114:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_112
LB_111:
	btr r12,2
	clc
	call dcp
LB_112:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_106
	mov rsi,QWORD [rdi+8+8*rax]
	mov QWORD [rdi+8+8*rax],NULL
	mov rdi,rsi
	bt rdi,0
	jc LB_105
	mov rax,[rdi]
	bt rax,17
	jnc LB_103
	bt QWORD rax,0
	jc LB_108
	btr r12,2
	clc
	jmp LB_109
LB_108:
	bts r12,2
	stc
LB_109:
	mov rsi,QWORD [rdi+8]
	push rsi
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rdi
	jmp LB_104
LB_105:
	cmp rdi,NULL
	jz LB_107
LB_103:
	btr r12,2
LB_104:
	mov r8,rdi
	ret
LB_106:
	mov QWORD [err_n],5
	jmp err
LB_107:
	mov QWORD [err_n],8
	jmp err
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_98
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_97
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_95
	bt QWORD rax,0
	jc LB_100
	btr r12,2
	clc
	jmp LB_101
LB_100:
	bts r12,2
	stc
LB_101:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_96
LB_97:
	cmp rdi,NULL
	jz LB_99
LB_95:
	btr r12,2
	clc
	call dcp
LB_96:
	mov r8,rax
	pop r14
	pop r13
	ret
LB_98:
	mov rdi,rax
	bt r12,1
	call pp0
	mov QWORD [err_n],4
	jmp err
LB_99:
	mov QWORD [err_n],8
	jmp err
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_92
	bt QWORD [rdi+8+8*rax],63
	jnc LB_93
	bt r12,2
	jc LB_91
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_91:
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	mov QWORD [r13+8+8*r14],rax
	mov QWORD [rax+8],r8
	mov rdi,0x0000_0001_0102_ffff
	mov QWORD [rax],rdi
	ret
LB_92:
	mov rdi,rax
	bt r12,1
	call pp0
	mov QWORD [err_n],3
	jmp err
LB_93:
	mov QWORD [err_n],7
	jmp err
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,r13
	mov edi,DWORD [rdi+4]
	mov r14,rdi
	bts r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_74:
NS_E_RDI_74:
NS_E_74_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	cmp rdi,0
	jz NS_E_74_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_74_LB_0:
	mov r8,1
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rax],rsi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_120:
; 	|» 0'
NS_E_RDI_120:
; _f120	%_121 ⊢|
 ; {>  %_121~0':t123''(-1) }
; _f120 0' ⊢|
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	mov rdi,[rsp+16]
	mov rax,QWORD [MOV_TBL+8*MOV_OFS_0+8*rdi]
	mov [rsp],rax
	jmp NS_E_120
NS_E_131:
; 	|» 0'
NS_E_RDI_131:
; _f39 %_132 ⊢ %_133 : %_133
 ; {>  %_132~0':_r64 }
; _f39 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_149
	call NS_E_39
LB_149:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_150:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz MTC_LB_151
LB_152:
	cmp r15,0
	jz LB_153
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_152
LB_153:
; ∎ {  }
 ; {>  %_133~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_154
	mov rdi,r13
	call dlt
LB_154:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_151:
	mov r15,0
LB_156:
	cmp r15,0
	jz LB_157
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_156
LB_157:
; _f56 %_133 ⊢ %_134 : %_134
 ; {>  %_133~0':_r64 }
	sub r13,1
; _f131	%_134 ⊢|
 ; {>  %_134~0':_r64 }
; _f131 0' ⊢|
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	mov rdi,[rsp+16]
	mov rax,QWORD [MOV_TBL+8*MOV_OFS_1+8*rdi]
	mov [rsp],rax
	jmp NS_E_131
MTC_LB_155:
NS_E_175:
NS_E_RDI_175:
; » 0xra |~ {  } ⊢ %_162 : %_162
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_162
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _f131 %_162 ⊢ %_163 : %_163
 ; {>  %_162~0':_r64 }
; _f131 0' ⊢ {  }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 1
	push LB_178
	call NS_E_131
LB_178:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _f116 |~ {  } ⊢ %_164 : %_164
 ; {>  %_163~{  }:{ } }
; 	» 0xr0 _ ⊢ 0' : %_164
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _f39 %_164 ⊢ %_165 : %_165
 ; {>  %_163~{  }:{ } %_164~0':_r64 }
; _f39 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_182
	call NS_E_39
LB_182:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_163
 ; {>  %_165~0':_r64 %_163~{  }:{ } }
; 	∎ {  }
	bt r12,0
	jc LB_183
	mov rdi,r13
	call dlt
LB_183:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MOV_0_0:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_0_1:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ {  }
; 0' ⊢ {  }
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp QWORD [rsp]
MOV_1_0:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ 0'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	jmp QWORD [rsp]
MOV_1_1:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	jmp QWORD [rsp]
section .data
MOV_TBL:
	dq MOV_0_0
	dq MOV_0_1
	dq MOV_1_0
	dq MOV_1_1
	CST_DYN_175:
		dq 0x0000_0001_00_82_ffff
		dq 1
