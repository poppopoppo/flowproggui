%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call emt_q
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	ret
NS_E_49:
NS_E_RDI_49:
NS_E_49_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_50
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_50:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_52:
NS_E_RDI_52:
NS_E_52_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_52_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
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
NS_E_53:
NS_E_RDI_53:
NS_E_53_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_53_LB_0
	cmp r11,57
	ja NS_E_53_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_53_LB_0:
	mov rax,0
	ret
NS_E_55:
NS_E_RDI_55:
NS_E_55_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_55_LB_0
	cmp r11,122
	ja NS_E_55_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_55_LB_0:
	mov rax,0
	ret
NS_E_54:
NS_E_RDI_54:
NS_E_54_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_54_LB_0
	cmp r11,90
	ja NS_E_54_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_54_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r13
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
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
	jge err
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
	jge err
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_51:
NS_E_RDI_51:
NS_E_51_ETR_TBL:
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
	jz NS_E_51_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_51_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_63:
; 	|» 0'
NS_E_RDI_63:
MTC_LB_64:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_65
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_66
	bt QWORD [rax],0
	jc LB_67
	btr r12,0
	jmp LB_68
LB_67:
	bts r12,0
LB_68:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_66:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_71
	btr r12,3
	jmp LB_72
LB_71:
	bts r12,3
LB_72:
	mov r14,r9
	bt r12,3
	jc LB_69
	btr r12,1
	jmp LB_70
LB_69:
	bts r12,1
LB_70:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_75
	btr r12,3
	jmp LB_76
LB_75:
	bts r12,3
LB_76:
	mov r8,r9
	bt r12,3
	jc LB_73
	btr r12,2
	jmp LB_74
LB_73:
	bts r12,2
LB_74:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_65
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_77
	bt QWORD [rax],0
	jc LB_78
	btr r12,2
	jmp LB_79
LB_78:
	bts r12,2
LB_79:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_77:
	push r8
	mov r8,rax
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_82
	btr r12,5
	jmp LB_83
LB_82:
	bts r12,5
LB_83:
	mov r9,r11
	bt r12,5
	jc LB_80
	btr r12,3
	jmp LB_81
LB_80:
	bts r12,3
LB_81:
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_86
	btr r12,5
	jmp LB_87
LB_86:
	bts r12,5
LB_87:
	mov r10,r11
	bt r12,5
	jc LB_84
	btr r12,4
	jmp LB_85
LB_84:
	bts r12,4
LB_85:
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_88:
	cmp r15,0
	jz LB_89
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_88
LB_89:
; ∎ {  }
 ; {>  %_60~4':(_lst)◂(t23'(-1)) %_59~3':t23'(-1) %_57~1':t23'(-1) }
; 	∎ {  }
	bt r12,4
	jc LB_90
	mov rdi,r10
	call dlt
LB_90:
	bt r12,3
	jc LB_91
	mov rdi,r9
	call dlt
LB_91:
	bt r12,1
	jc LB_92
	mov rdi,r14
	call dlt
LB_92:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_65:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_93
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_94
	bt QWORD [rax],0
	jc LB_95
	btr r12,0
	jmp LB_96
LB_95:
	bts r12,0
LB_96:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_94:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_99
	btr r12,3
	jmp LB_100
LB_99:
	bts r12,3
LB_100:
	mov r14,r9
	bt r12,3
	jc LB_97
	btr r12,1
	jmp LB_98
LB_97:
	bts r12,1
LB_98:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_103
	btr r12,3
	jmp LB_104
LB_103:
	bts r12,3
LB_104:
	mov r8,r9
	bt r12,3
	jc LB_101
	btr r12,2
	jmp LB_102
LB_101:
	bts r12,2
LB_102:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_93
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_105
	bt QWORD [rax],0
	jc LB_106
	btr r12,2
	jmp LB_107
LB_106:
	bts r12,2
LB_107:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_105:
	push r8
	mov r8,rax
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_108:
	cmp r15,0
	jz LB_109
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_108
LB_109:
; ∎ {  }
 ; {>  %_61~1':t23'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_110
	mov rdi,r14
	call dlt
LB_110:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_93:
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_111
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_112
	bt QWORD [rax],0
	jc LB_113
	btr r12,0
	jmp LB_114
LB_113:
	bts r12,0
LB_114:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_112:
	push r13
	mov r13,rax
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
LB_115:
	cmp r15,0
	jz LB_116
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_115
LB_116:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_111:
section .data
	NS_E_DYN_49:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49
	NS_E_DYN_52:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_52
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_53
	NS_E_DYN_54:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54
	NS_E_DYN_55:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55
	NS_E_DYN_63:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63
