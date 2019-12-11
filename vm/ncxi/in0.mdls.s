%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_59
	call exec_out
	jmp _end
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
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
NS_E_50:
NS_E_RDI_50:
NS_E_50_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_51
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_51:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_53:
NS_E_RDI_53:
NS_E_53_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_53_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_53_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_54:
NS_E_RDI_54:
NS_E_54_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_54_LB_0
	cmp r11,57
	ja NS_E_54_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_54_LB_0:
	mov rax,0
	ret
NS_E_56:
NS_E_RDI_56:
NS_E_56_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_56_LB_0
	cmp r11,122
	ja NS_E_56_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_56_LB_0:
	mov rax,0
	ret
NS_E_55:
NS_E_RDI_55:
NS_E_55_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_55_LB_0
	cmp r11,90
	ja NS_E_55_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_55_LB_0:
	mov rax,0
	ret
NS_E_28:
	mov rdi,r13
	bt r12,0
NS_E_RDI_28:
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
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rax,[r14]
	lea r8,[r8-1+r13]
	shr rax,32
	cmp r8,rax
	jge err_s8_ge
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_52:
NS_E_RDI_52:
NS_E_52_ETR_TBL:
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
	jz NS_E_52_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_52_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_59:
NS_E_RDI_59:
; 	» "-27686gg" _ ⊢ 0' : %_57
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f21 %_57 ⊢ %_58 : %_58
 ; {>  %_57~0':_stg }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_58~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_60
	mov rdi,r13
	call dlt
LB_60:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_68:
; 	|» 0'
NS_E_RDI_68:
MTC_LB_69:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_70
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_71
	bt QWORD [rax],0
	jc LB_72
	btr r12,3
	jmp LB_73
LB_72:
	bts r12,3
LB_73:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_71:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_76
	btr r12,4
	jmp LB_77
LB_76:
	bts r12,4
LB_77:
	mov r14,r10
	bt r12,4
	jc LB_74
	btr r12,1
	jmp LB_75
LB_74:
	bts r12,1
LB_75:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_80
	btr r12,4
	jmp LB_81
LB_80:
	bts r12,4
LB_81:
	mov r8,r10
	bt r12,4
	jc LB_78
	btr r12,2
	jmp LB_79
LB_78:
	bts r12,2
LB_79:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_70
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_82
	bt QWORD [rax],0
	jc LB_83
	btr r12,5
	jmp LB_84
LB_83:
	bts r12,5
LB_84:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_82:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_87
	btr r12,6
	jmp LB_88
LB_87:
	bts r12,6
LB_88:
	mov r9,rcx
	bt r12,6
	jc LB_85
	btr r12,3
	jmp LB_86
LB_85:
	bts r12,3
LB_86:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_91
	btr r12,6
	jmp LB_92
LB_91:
	bts r12,6
LB_92:
	mov r10,rcx
	bt r12,6
	jc LB_89
	btr r12,4
	jmp LB_90
LB_89:
	bts r12,4
LB_90:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_93:
	cmp r15,0
	jz LB_94
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_93
LB_94:
; ∎ {  }
 ; {>  %_62~1':t33'(-1) %_65~4':(_lst)◂(t33'(-1)) %_64~3':t33'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_95
	mov rdi,r14
	call dlt
LB_95:
	bt r12,4
	jc LB_96
	mov rdi,r10
	call dlt
LB_96:
	bt r12,3
	jc LB_97
	mov rdi,r9
	call dlt
LB_97:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_70:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_98
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_99
	bt QWORD [rax],0
	jc LB_100
	btr r12,3
	jmp LB_101
LB_100:
	bts r12,3
LB_101:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_99:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_104
	btr r12,4
	jmp LB_105
LB_104:
	bts r12,4
LB_105:
	mov r14,r10
	bt r12,4
	jc LB_102
	btr r12,1
	jmp LB_103
LB_102:
	bts r12,1
LB_103:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_108
	btr r12,4
	jmp LB_109
LB_108:
	bts r12,4
LB_109:
	mov r8,r10
	bt r12,4
	jc LB_106
	btr r12,2
	jmp LB_107
LB_106:
	bts r12,2
LB_107:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_98
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_110
	bt QWORD [rax],0
	jc LB_111
	btr r12,3
	jmp LB_112
LB_111:
	bts r12,3
LB_112:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_110:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_113:
	cmp r15,0
	jz LB_114
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_113
LB_114:
; ∎ {  }
 ; {>  %_66~1':t33'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_115
	mov rdi,r14
	call dlt
LB_115:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_98:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_116
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_117
	bt QWORD [rax],0
	jc LB_118
	btr r12,1
	jmp LB_119
LB_118:
	bts r12,1
LB_119:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_117:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_120:
	cmp r15,0
	jz LB_121
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_120
LB_121:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_116:
section .data
	NS_E_DYN_50:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_50
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_53
	NS_E_DYN_54:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54
	NS_E_DYN_55:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55
	NS_E_DYN_56:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56
	CST_DYN_59:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_68:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_68
