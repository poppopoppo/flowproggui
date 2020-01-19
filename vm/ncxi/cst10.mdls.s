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
	call NS_E_131
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
NS_E_ID_40: dq 0
NS_E_40:
NS_E_RDI_40:
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
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_70
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_70:
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
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_72_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_72_LB_0:
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
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_73_LB_0
	cmp r11,57
	ja NS_E_73_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_73_LB_0:
	mov rax,0
	ret
NS_E_76:
NS_E_RDI_76:
NS_E_76_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb LB_77
	cmp r11,122
	ja LB_77
	add rsi,1
	mov rax,1
	ret
LB_77:
	mov rax,0
	ret
NS_E_74:
NS_E_RDI_74:
NS_E_74_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb LB_75
	cmp r11,90
	ja LB_75
	add rsi,1
	mov rax,1
	ret
LB_75:
	mov rax,0
	ret
NS_E_47:
	mov rdi,r13
	bt r12,0
NS_E_RDI_47:
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
NS_E_ID_61: dq 0
NS_E_61:
NS_E_RDI_61:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_108
	bt QWORD [rdi],17
	jnc LB_108
	bt QWORD [rdi],0
	jc LB_110
	btr r12,2
	clc
	jmp LB_111
LB_110:
	bts r12,2
	stc
LB_111:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_109
LB_108:
	btr r12,2
	clc
	call dcp
LB_109:
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
	jge LB_103
	mov rsi,QWORD [rdi+8+8*rax]
	mov QWORD [rdi+8+8*rax],NULL
	mov rdi,rsi
	bt rdi,0
	jc LB_102
	mov rax,[rdi]
	bt rax,17
	jnc LB_100
	bt QWORD rax,0
	jc LB_105
	btr r12,2
	clc
	jmp LB_106
LB_105:
	bts r12,2
	stc
LB_106:
	mov rsi,QWORD [rdi+8]
	push rsi
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rdi
	jmp LB_101
LB_102:
	cmp rdi,NULL
	jz LB_104
LB_100:
	btr r12,2
LB_101:
	mov r8,rdi
	ret
LB_103:
	mov QWORD [err_n],5
	jmp err
LB_104:
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
	jge LB_95
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_94
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_92
	bt QWORD rax,0
	jc LB_97
	btr r12,2
	clc
	jmp LB_98
LB_97:
	bts r12,2
	stc
LB_98:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_93
LB_94:
	cmp rdi,NULL
	jz LB_96
LB_92:
	btr r12,2
	clc
	call dcp
LB_93:
	mov r8,rax
	pop r14
	pop r13
	ret
LB_95:
	mov rdi,rax
	bt r12,1
	call pp0
	mov QWORD [err_n],4
	jmp err
LB_96:
	mov QWORD [err_n],8
	jmp err
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_89
	bt QWORD [rdi+8+8*rax],63
	jnc LB_90
	bt r12,2
	jc LB_88
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_88:
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	mov QWORD [r13+8+8*r14],rax
	mov QWORD [rax+8],r8
	mov rdi,0x0000_0001_0102_ffff
	mov QWORD [rax],rdi
	ret
LB_89:
	mov rdi,rax
	bt r12,1
	call pp0
	mov QWORD [err_n],3
	jmp err
LB_90:
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
NS_E_ID_50: dq 0
NS_E_50:
NS_E_RDI_50:
	mov rdi,r13
	add rdi,8
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call system
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_ID_39: dq 0
NS_E_39:
NS_E_RDI_39:
	mov rdi,r13
	mov rax,2
	mov rsi,0x42
	add rdi,8
	syscall
	push rax
	mov rdi,rax
	mov rsi,r14
	mov edx,DWORD [r14+4]
	add rsi,8
	mov rax,1
	syscall
	pop rdi
	mov rax,3
	syscall
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
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
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
	jz NS_E_71_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_71_LB_0:
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
NS_E_131:
NS_E_RDI_131:
; » _^ ..
	xor rax,rax
	add rax,5
	add rax,5
	add rax,12
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; "TEST\n"
	mov rsi,0x_54
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_53
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; " JJJ\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_4a
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; "OJF OIEJ OJ\n"
	mov rsi,0x_4a_45_49_4f_20_46_4a_4f
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_4a
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
	add rsp,0
; 	» "FF.txt" _ ⊢ 1' : %_114
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_74_78_74_2e_46_46
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f39 { %_114 %_113 } ⊢ { %_115 %_116 } : { %_115 %_116 }
 ; {>  %_114~1':_stg %_113~0':_stg }
; _f39 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_134
	btr r12,2
	jmp LB_135
LB_134:
	bts r12,2
LB_135:
	mov r13,r14
	bt r12,1
	jc LB_136
	btr r12,0
	jmp LB_137
LB_136:
	bts r12,0
LB_137:
	mov r14,r8
	bt r12,2
	jc LB_138
	btr r12,1
	jmp LB_139
LB_138:
	bts r12,1
LB_139:
	push -1
	push LB_140
	call NS_E_39
LB_140:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "ls -a\n" _ ⊢ 2' : %_117
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_0a_61_2d_20_73_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,2
; _f50 %_117 ⊢ %_118 : %_118
 ; {>  %_117~2':_stg %_115~0':_stg %_116~1':_stg }
; _f50 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_147
	btr r12,0
	jmp LB_148
LB_147:
	bts r12,0
LB_148:
	push -1
	push LB_151
	call NS_E_50
LB_151:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_149
	btr r12,2
	jmp LB_150
LB_149:
	bts r12,2
LB_150:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_145
	btr r12,1
	clc
	jmp LB_146
LB_145:
	bts r12,1
	stc
LB_146:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_143
	btr r12,0
	clc
	jmp LB_144
LB_143:
	bts r12,0
	stc
LB_144:
	add rsp,24
; ∎ {  }
 ; {>  %_118~2':_stg %_115~0':_stg %_116~1':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_152
	mov rdi,r8
	call dlt
LB_152:
	bt r12,0
	jc LB_153
	mov rdi,r13
	call dlt
LB_153:
	bt r12,1
	jc LB_154
	mov rdi,r14
	call dlt
LB_154:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
MOV_TBL:
	CST_DYN_131:
		dq 0x0000_0001_00_82_ffff
		dq 1
