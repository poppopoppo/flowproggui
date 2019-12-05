%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_152
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
	push r15
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
	pop r15
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
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_50:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
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
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_52_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
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
	mov rdi,r8
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
	mov rax,r15
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
	mov rax,r15
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
	mov r15,rax
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
	push r15
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
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_51_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_51_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_81:
; 	|» { 0' 1' 2' }
NS_E_RDI_81:
; _f32 { %_57 %_56 } ⊢ { %_59 %_60 %_61 } : { %_59 %_60 %_61 }
 ; {>  %_58~2':_r64 %_57~1':_r64 %_56~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
MTC_LB_82:
	mov QWORD rax,0x0
	cmp rax,r8
	jnz MTC_LB_83
; _f35 %_60 ⊢ { %_62 %_63 } : { %_62 %_63 }
 ; {>  %_60~0':_r64 %_59~1':_r64 %_58~2':_r64 %_61~3':_r64 }
	mov r9,r13
; _f35 %_59 ⊢ { %_64 %_65 } : { %_64 %_65 }
 ; {>  %_62~0':_r64 %_59~1':_r64 %_58~2':_r64 %_61~3':_r64 %_63~4':_r64 }
	mov r10,r14
; _f35 %_58 ⊢ { %_66 %_67 } : { %_66 %_67 }
 ; {>  %_62~0':_r64 %_65~5':_r64 %_64~1':_r64 %_58~2':_r64 %_61~3':_r64 %_63~4':_r64 }
	mov r11,r15
; _f37 %_63 ⊢ %_68 : %_68
 ; {>  %_62~0':_r64 %_65~5':_r64 %_64~1':_r64 %_67~6':_r64 %_61~3':_r64 %_66~2':_r64 %_63~4':_r64 }
	sub r9,1
; _f81 { %_68 %_65 %_67 } ⊢ %_69 : %_69
 ; {>  %_62~0':_r64 %_65~5':_r64 %_64~1':_r64 %_68~4':_r64 %_67~6':_r64 %_61~3':_r64 %_66~2':_r64 }
; _f81 { 4' 5' 6' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_92
	btr r12,0
	jmp LB_93
LB_92:
	bts r12,0
LB_93:
	mov r14,r10
	bt r12,5
	jc LB_94
	btr r12,1
	jmp LB_95
LB_94:
	bts r12,1
LB_95:
	mov r15,r11
	bt r12,6
	jc LB_96
	btr r12,2
	jmp LB_97
LB_96:
	bts r12,2
LB_97:
	call NS_E_81
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_98
	btr r12,4
	jmp LB_99
LB_98:
	bts r12,4
LB_99:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_90
	btr r12,3
	jmp LB_91
LB_90:
	bts r12,3
LB_91:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_88
	btr r12,2
	jmp LB_89
LB_88:
	bts r12,2
LB_89:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_86
	btr r12,1
	jmp LB_87
LB_86:
	bts r12,1
LB_87:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_84
	btr r12,0
	jmp LB_85
LB_84:
	bts r12,0
LB_85:
	add rsp,40
; _f35 %_62 ⊢ { %_70 %_71 } : { %_70 %_71 }
 ; {>  %_62~0':_r64 %_64~1':_r64 %_69~4':_r64 %_61~3':_r64 %_66~2':_r64 }
	mov r10,r13
; _f35 %_64 ⊢ { %_72 %_73 } : { %_72 %_73 }
 ; {>  %_64~1':_r64 %_69~4':_r64 %_61~3':_r64 %_70~0':_r64 %_66~2':_r64 %_71~5':_r64 }
	mov r11,r14
; _f35 %_66 ⊢ { %_74 %_75 } : { %_74 %_75 }
 ; {>  %_72~1':_r64 %_69~4':_r64 %_61~3':_r64 %_70~0':_r64 %_66~2':_r64 %_71~5':_r64 %_73~6':_r64 }
	mov rcx,r15
; _f37 %_73 ⊢ %_76 : %_76
 ; {>  %_72~1':_r64 %_75~7':_r64 %_69~4':_r64 %_61~3':_r64 %_70~0':_r64 %_74~2':_r64 %_71~5':_r64 %_73~6':_r64 }
	sub r11,1
; _f81 { %_76 %_75 %_71 } ⊢ %_77 : %_77
 ; {>  %_76~6':_r64 %_72~1':_r64 %_75~7':_r64 %_69~4':_r64 %_61~3':_r64 %_70~0':_r64 %_74~2':_r64 %_71~5':_r64 }
; _f81 { 6' 7' 5' } ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 6' 7' 5' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,6
	jc LB_110
	btr r12,0
	jmp LB_111
LB_110:
	bts r12,0
LB_111:
	mov r14,rcx
	bt r12,7
	jc LB_112
	btr r12,1
	jmp LB_113
LB_112:
	bts r12,1
LB_113:
	mov r15,r10
	bt r12,5
	jc LB_114
	btr r12,2
	jmp LB_115
LB_114:
	bts r12,2
LB_115:
	call NS_E_81
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_116
	btr r12,5
	jmp LB_117
LB_116:
	bts r12,5
LB_117:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_108
	btr r12,4
	jmp LB_109
LB_108:
	bts r12,4
LB_109:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_106
	btr r12,3
	jmp LB_107
LB_106:
	bts r12,3
LB_107:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_104
	btr r12,2
	jmp LB_105
LB_104:
	bts r12,2
LB_105:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_102
	btr r12,1
	jmp LB_103
LB_102:
	bts r12,1
LB_103:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_100
	btr r12,0
	jmp LB_101
LB_100:
	bts r12,0
LB_101:
	add rsp,48
; _f37 %_74 ⊢ %_78 : %_78
 ; {>  %_72~1':_r64 %_69~4':_r64 %_77~5':_r64 %_61~3':_r64 %_70~0':_r64 %_74~2':_r64 }
	sub r15,1
; _f81 { %_78 %_70 %_72 } ⊢ %_79 : %_79
 ; {>  %_72~1':_r64 %_69~4':_r64 %_77~5':_r64 %_61~3':_r64 %_70~0':_r64 %_78~2':_r64 }
; _f81 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_124
	btr r12,3
	jmp LB_125
LB_124:
	bts r12,3
LB_125:
	mov r15,r14
	bt r12,1
	jc LB_126
	btr r12,2
	jmp LB_127
LB_126:
	bts r12,2
LB_127:
	mov r14,r13
	bt r12,0
	jc LB_128
	btr r12,1
	jmp LB_129
LB_128:
	bts r12,1
LB_129:
	mov r13,r8
	bt r12,3
	jc LB_130
	btr r12,0
	jmp LB_131
LB_130:
	bts r12,0
LB_131:
	call NS_E_81
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_122
	btr r12,5
	jmp LB_123
LB_122:
	bts r12,5
LB_123:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_120
	btr r12,4
	jmp LB_121
LB_120:
	bts r12,4
LB_121:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_118
	btr r12,3
	jmp LB_119
LB_118:
	bts r12,3
LB_119:
	add rsp,32
; _f81 { %_69 %_77 %_79 } ⊢ %_80 : %_80
 ; {>  %_79~0':_r64 %_69~4':_r64 %_77~5':_r64 %_61~3':_r64 }
; _f81 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_134
	btr r12,1
	jmp LB_135
LB_134:
	bts r12,1
LB_135:
	mov r15,r13
	bt r12,0
	jc LB_136
	btr r12,2
	jmp LB_137
LB_136:
	bts r12,2
LB_137:
	mov r13,r9
	bt r12,4
	jc LB_138
	btr r12,0
	jmp LB_139
LB_138:
	bts r12,0
LB_139:
	call NS_E_81
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_132
	btr r12,3
	jmp LB_133
LB_132:
	bts r12,3
LB_133:
	add rsp,16
; ∎ %_80
 ; {>  %_80~0':_r64 %_61~3':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_140
	mov rdi,r8
	call dlt
LB_140:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_83:
; ∎ %_58
 ; {>  %_60~0':_r64 %_59~1':_r64 %_58~2':_r64 %_61~3':_r64 }
; 	∎ 2'
	bt r12,0
	jc LB_142
	mov rdi,r13
	call dlt
LB_142:
	bt r12,1
	jc LB_143
	mov rdi,r14
	call dlt
LB_143:
	bt r12,3
	jc LB_144
	mov rdi,r8
	call dlt
LB_144:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_145
	btr r12,0
	jmp LB_146
LB_145:
	bts r12,0
LB_146:
	ret
; mtc x 1
NS_E_152:
NS_E_RDI_152:
; » 0xr14 |~ {  } ⊢ %_147 : %_147
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_147
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_148 : %_148
 ; {>  %_147~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_148
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_149 : %_149
 ; {>  %_148~1':_r64 %_147~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_149
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f81 { %_147 %_148 %_149 } ⊢ %_150 : %_150
 ; {>  %_149~2':_r64 %_148~1':_r64 %_147~0':_r64 }
; _f81 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_81
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; _f20 %_150 ⊢ %_151 : %_151
 ; {>  %_150~0':_r64 }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_151~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_153
	mov rdi,r13
	call dlt
LB_153:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
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
	NS_E_DYN_81:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_81
	CST_DYN_152:
		dq 0x0001_0001_00_82_ffff
		dq 1
