%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_70
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
	push r13
	mov rdi,r13
	mov rsi,str_ret
	bt r12,0
	call pp
	mov rdi,fmt_emt_q
	mov rsi,str_ret
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	pop r13
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
NS_E_24:
NS_E_RDI_24:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
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
NS_E_70:
NS_E_RDI_70:
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
; » 0xr6 |~ {  } ⊢ %_58 : %_58
 ; {>  %_57~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_58
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr4 |~ {  } ⊢ %_59 : %_59
 ; {>  %_58~1':_r64 %_57~0':_stg }
; 	» 0xr4 _ ⊢ 2' : %_59
	mov rdi,0x4
	mov r8,rdi
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_60 : %_60
 ; {>  %_59~2':_r64 %_58~1':_r64 %_57~0':_stg }
; 	» 0xr0 _ ⊢ 3' : %_60
	mov rdi,0x0
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_61 : %_61
 ; {>  %_60~3':_r64 %_59~2':_r64 %_58~1':_r64 %_57~0':_stg }
; 	» 0xr0 _ ⊢ 4' : %_61
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _f14 %_58 ⊢ { %_62 %_63 } : { %_62 %_63 }
 ; {>  %_60~3':_r64 %_59~2':_r64 %_58~1':_r64 %_57~0':_stg %_61~4':_r64 }
; _f14 1' ⊢ { 1' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_79
	btr r12,0
	jmp LB_80
LB_79:
	bts r12,0
LB_80:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_81
	btr r12,5
	jmp LB_82
LB_81:
	bts r12,5
LB_82:
	mov r14,r13
	bt r12,0
	jc LB_83
	btr r12,1
	jmp LB_84
LB_83:
	bts r12,1
LB_84:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_77
	btr r12,4
	jmp LB_78
LB_77:
	bts r12,4
LB_78:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_75
	btr r12,3
	jmp LB_76
LB_75:
	bts r12,3
LB_76:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_73
	btr r12,2
	jmp LB_74
LB_73:
	bts r12,2
LB_74:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_71
	btr r12,0
	jmp LB_72
LB_71:
	bts r12,0
LB_72:
	add rsp,40
; _f18 { %_59 %_57 %_60 %_63 %_61 } ⊢ { %_64 %_65 %_66 %_67 %_68 } : { %_64 %_65 %_66 %_67 %_68 }
 ; {>  %_62~1':_r64 %_60~3':_r64 %_59~2':_r64 %_57~0':_stg %_61~4':_r64 %_63~5':_stg }
; _f18 { 2' 0' 3' 5' 4' } ⊢ { 0' 2' 3' 4' 5' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1011110.. |},{ 2' 0' 3' 5' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r13
	bt r12,0
	jc LB_87
	btr r12,1
	jmp LB_88
LB_87:
	bts r12,1
LB_88:
	mov r13,r8
	bt r12,2
	jc LB_89
	btr r12,0
	jmp LB_90
LB_89:
	bts r12,0
LB_90:
	mov r8,r9
	bt r12,3
	jc LB_91
	btr r12,2
	jmp LB_92
LB_91:
	bts r12,2
LB_92:
	mov r9,r11
	bt r12,5
	jc LB_93
	btr r12,3
	jmp LB_94
LB_93:
	bts r12,3
LB_94:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 2' 3' 4' 5' }
	mov r11,r10
	bt r12,4
	jc LB_95
	btr r12,5
	jmp LB_96
LB_95:
	bts r12,5
LB_96:
	mov r10,r9
	bt r12,3
	jc LB_97
	btr r12,4
	jmp LB_98
LB_97:
	bts r12,4
LB_98:
	mov r9,r8
	bt r12,2
	jc LB_99
	btr r12,3
	jmp LB_100
LB_99:
	bts r12,3
LB_100:
	mov r8,r14
	bt r12,1
	jc LB_101
	btr r12,2
	jmp LB_102
LB_101:
	bts r12,2
LB_102:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_85
	btr r12,1
	jmp LB_86
LB_85:
	bts r12,1
LB_86:
	add rsp,16
; _f21 %_67 ⊢ %_69 : %_69
 ; {>  %_62~1':_r64 %_65~2':_stg %_64~0':_r64 %_68~5':_r64 %_67~4':_stg %_66~3':_r64 }
; _f21 4' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_113
	btr r12,0
	jmp LB_114
LB_113:
	bts r12,0
LB_114:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_115
	btr r12,4
	jmp LB_116
LB_115:
	bts r12,4
LB_116:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_111
	btr r12,5
	jmp LB_112
LB_111:
	bts r12,5
LB_112:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_109
	btr r12,3
	jmp LB_110
LB_109:
	bts r12,3
LB_110:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_107
	btr r12,2
	jmp LB_108
LB_107:
	bts r12,2
LB_108:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_105
	btr r12,1
	jmp LB_106
LB_105:
	bts r12,1
LB_106:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_103
	btr r12,0
	jmp LB_104
LB_103:
	bts r12,0
LB_104:
	add rsp,48
; ∎ {  }
 ; {>  %_62~1':_r64 %_65~2':_stg %_64~0':_r64 %_68~5':_r64 %_69~4':_stg %_66~3':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_117
	mov rdi,r14
	call dlt
LB_117:
	bt r12,2
	jc LB_118
	mov rdi,r8
	call dlt
LB_118:
	bt r12,0
	jc LB_119
	mov rdi,r13
	call dlt
LB_119:
	bt r12,5
	jc LB_120
	mov rdi,r11
	call dlt
LB_120:
	bt r12,4
	jc LB_121
	mov rdi,r10
	call dlt
LB_121:
	bt r12,3
	jc LB_122
	mov rdi,r9
	call dlt
LB_122:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_130:
; 	|» 0'
NS_E_RDI_130:
MTC_LB_131:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_132
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
	jnc LB_133
	bt QWORD [rax],0
	jc LB_134
	btr r12,3
	jmp LB_135
LB_134:
	bts r12,3
LB_135:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_133:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_138
	btr r12,4
	jmp LB_139
LB_138:
	bts r12,4
LB_139:
	mov r14,r10
	bt r12,4
	jc LB_136
	btr r12,1
	jmp LB_137
LB_136:
	bts r12,1
LB_137:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_142
	btr r12,4
	jmp LB_143
LB_142:
	bts r12,4
LB_143:
	mov r8,r10
	bt r12,4
	jc LB_140
	btr r12,2
	jmp LB_141
LB_140:
	bts r12,2
LB_141:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_132
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
	jnc LB_144
	bt QWORD [rax],0
	jc LB_145
	btr r12,5
	jmp LB_146
LB_145:
	bts r12,5
LB_146:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_144:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_149
	btr r12,6
	jmp LB_150
LB_149:
	bts r12,6
LB_150:
	mov r9,rcx
	bt r12,6
	jc LB_147
	btr r12,3
	jmp LB_148
LB_147:
	bts r12,3
LB_148:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_153
	btr r12,6
	jmp LB_154
LB_153:
	bts r12,6
LB_154:
	mov r10,rcx
	bt r12,6
	jc LB_151
	btr r12,4
	jmp LB_152
LB_151:
	bts r12,4
LB_152:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_155:
	cmp r15,0
	jz LB_156
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_155
LB_156:
; ∎ {  }
 ; {>  %_126~3':t44'(-1) %_127~4':(_lst)◂(t44'(-1)) %_124~1':t44'(-1) }
; 	∎ {  }
	bt r12,3
	jc LB_157
	mov rdi,r9
	call dlt
LB_157:
	bt r12,4
	jc LB_158
	mov rdi,r10
	call dlt
LB_158:
	bt r12,1
	jc LB_159
	mov rdi,r14
	call dlt
LB_159:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_132:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_160
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
	jnc LB_161
	bt QWORD [rax],0
	jc LB_162
	btr r12,3
	jmp LB_163
LB_162:
	bts r12,3
LB_163:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_161:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_166
	btr r12,4
	jmp LB_167
LB_166:
	bts r12,4
LB_167:
	mov r14,r10
	bt r12,4
	jc LB_164
	btr r12,1
	jmp LB_165
LB_164:
	bts r12,1
LB_165:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_170
	btr r12,4
	jmp LB_171
LB_170:
	bts r12,4
LB_171:
	mov r8,r10
	bt r12,4
	jc LB_168
	btr r12,2
	jmp LB_169
LB_168:
	bts r12,2
LB_169:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_160
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
	jnc LB_172
	bt QWORD [rax],0
	jc LB_173
	btr r12,3
	jmp LB_174
LB_173:
	bts r12,3
LB_174:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_172:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_175:
	cmp r15,0
	jz LB_176
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_175
LB_176:
; ∎ {  }
 ; {>  %_128~1':t44'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_177
	mov rdi,r14
	call dlt
LB_177:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_160:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_178
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
	jnc LB_179
	bt QWORD [rax],0
	jc LB_180
	btr r12,1
	jmp LB_181
LB_180:
	bts r12,1
LB_181:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_179:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_182:
	cmp r15,0
	jz LB_183
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_182
LB_183:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_178:
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
	CST_DYN_70:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_130:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_130
