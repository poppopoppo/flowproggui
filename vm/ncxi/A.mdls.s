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
	call NS_E_125
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
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_74
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_74:
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
NS_E_77:
NS_E_RDI_77:
NS_E_77_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_77_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_77_LB_0:
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
NS_E_78:
NS_E_RDI_78:
NS_E_78_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_78_LB_0
	cmp r11,57
	ja NS_E_78_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_78_LB_0:
	mov rax,0
	ret
NS_E_81:
NS_E_RDI_81:
NS_E_81_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb LB_82
	cmp r11,122
	ja LB_82
	add rsi,1
	mov rax,1
	ret
LB_82:
	mov rax,0
	ret
NS_E_79:
NS_E_RDI_79:
NS_E_79_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb LB_80
	cmp r11,90
	ja LB_80
	add rsi,1
	mov rax,1
	ret
LB_80:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_94
	bt QWORD [rdi+8+8*rax],63
	jnc LB_95
	bt r12,2
	jc LB_93
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_93:
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	mov QWORD [r13+8+8*r14],rax
	mov QWORD [rax+8],r8
	mov rdi,0x0000_0001_0102_ffff
	mov QWORD [rax],rdi
	ret
LB_94:
	mov rdi,rax
	bt r12,1
	call pp0
	mov QWORD [err_n],3
	jmp err
LB_95:
	mov QWORD [err_n],7
	jmp err
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
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_100
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_99
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_97
	bt QWORD rax,0
	jc LB_102
	btr r12,2
	clc
	jmp LB_103
LB_102:
	bts r12,2
	stc
LB_103:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_98
LB_99:
	cmp rdi,NULL
	jz LB_101
LB_97:
	btr r12,2
	clc
	call dcp
LB_98:
	mov r8,rax
	pop r14
	pop r13
	ret
LB_100:
	mov rdi,rax
	bt r12,1
	call pp0
	mov QWORD [err_n],4
	jmp err
LB_101:
	mov QWORD [err_n],8
	jmp err
NS_E_ID_65: dq 0
NS_E_65:
NS_E_RDI_65:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_113
	bt QWORD [rdi],17
	jnc LB_113
	bt QWORD [rdi],0
	jc LB_115
	btr r12,2
	clc
	jmp LB_116
LB_115:
	bts r12,2
	stc
LB_116:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_114
LB_113:
	btr r12,2
	clc
	call dcp
LB_114:
	mov r8,rax
	pop r14
	pop r13
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
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
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
	jz NS_E_75_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
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
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge LB_108
	mov rsi,QWORD [rdi+8+8*rax]
	mov QWORD [rdi+8+8*rax],NULL
	mov rdi,rsi
	bt rdi,0
	jc LB_107
	mov rax,[rdi]
	bt rax,17
	jnc LB_105
	bt QWORD rax,0
	jc LB_110
	btr r12,2
	clc
	jmp LB_111
LB_110:
	bts r12,2
	stc
LB_111:
	mov rsi,QWORD [rdi+8]
	push rsi
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rdi
	jmp LB_106
LB_107:
	cmp rdi,NULL
	jz LB_109
LB_105:
	btr r12,2
LB_106:
	mov r8,rdi
	ret
LB_108:
	mov QWORD [err_n],5
	jmp err
LB_109:
	mov QWORD [err_n],8
	jmp err
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
NS_E_76:
NS_E_RDI_76:
NS_E_76_ETR_TBL:
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
	call scf_x
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	cmp rdi,0
	jz NS_E_76_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_76_LB_0:
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
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,r13
	mov edi,DWORD [rdi+4]
	mov r14,rdi
	bts r12,1
	ret
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
NS_E_125:
NS_E_RDI_125:
; » _f27 |~ {  } ⊢ %_118 : %_118
 ; {>  }
; 	» _args _ ⊢ 0' : %_118
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r13,rax
	btr r12,0
; _f40 %_118 ⊢ %_119 : %_119
 ; {>  %_118~0':(_lst)◂(_stg) }
; _f40 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_129
	call NS_E_40
LB_129:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_119~0':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_130
	mov rdi,r13
	call dlt
LB_130:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
MOV_TBL:
	CST_DYN_125:
		dq 0x0000_0001_00_82_ffff
		dq 1
