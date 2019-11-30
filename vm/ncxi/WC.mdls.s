%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_164
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
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
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
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
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_42_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_42_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_43:
NS_E_RDI_43:
NS_E_43_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_43_LB_0
	cmp r11,57
	ja NS_E_43_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43_LB_0:
	mov rax,0
	ret
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_45_LB_0
	cmp r11,122
	ja NS_E_45_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_45_LB_0:
	mov rax,0
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_44_LB_0
	cmp r11,90
	ja NS_E_44_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_44_LB_0:
	mov rax,0
	ret
NS_E_17:
NS_E_RDI_17:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_21:
	mov rdi,r8
	bt r12,0
NS_E_RDI_21:
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
NS_E_73:
; 	|» { 0' 1' 2' }
NS_E_RDI_73:
; _f26 { %_47 %_46 } ⊢ { %_49 %_50 %_51 } : { %_49 %_50 %_51 }
 ; {>  %_47~1':_r64 %_48~2':_r64 %_46~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_140
	bt r12,3
	jc LB_139
	mov rdi,r8
	call dlt
LB_139:
	jmp MTC_LB_138
LB_140:
; _emt_mov_ptn_to_ptn 3' ⊢ 4'
	mov r9,r8
	bt r12,3
	jc LB_141
	btr r12,4
	jmp LB_142
LB_141:
	bts r12,4
LB_142:
; /0/
	jmp MTC_LB_137
MTC_LB_138:
; _f29 %_50 ⊢ { %_53 %_54 } : { %_53 %_54 }
 ; {>  %_51~3':_r64 %_49~1':_r64 %_48~2':_r64 %_50~0':_r64 }
	mov r9,r13
; _f29 %_49 ⊢ { %_55 %_56 } : { %_55 %_56 }
 ; {>  %_51~3':_r64 %_54~4':_r64 %_49~1':_r64 %_53~0':_r64 %_48~2':_r64 }
	mov r10,r14
; _f29 %_48 ⊢ { %_57 %_58 } : { %_57 %_58 }
 ; {>  %_55~1':_r64 %_51~3':_r64 %_54~4':_r64 %_53~0':_r64 %_48~2':_r64 %_56~5':_r64 }
	mov r11,r15
; _f31 %_54 ⊢ %_59 : %_59
 ; {>  %_55~1':_r64 %_51~3':_r64 %_54~4':_r64 %_53~0':_r64 %_58~6':_r64 %_57~2':_r64 %_56~5':_r64 }
	sub r9,1
; _f73 { %_59 %_56 %_58 } ⊢ %_60 : %_60
 ; {>  %_55~1':_r64 %_51~3':_r64 %_53~0':_r64 %_59~4':_r64 %_58~6':_r64 %_57~2':_r64 %_56~5':_r64 }
; _f73 { 4' 5' 6' } ⊢ 4'
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
	jc LB_82
	btr r12,0
	jmp LB_83
LB_82:
	bts r12,0
LB_83:
	mov r14,r10
	bt r12,5
	jc LB_84
	btr r12,1
	jmp LB_85
LB_84:
	bts r12,1
LB_85:
	mov r15,r11
	bt r12,6
	jc LB_86
	btr r12,2
	jmp LB_87
LB_86:
	bts r12,2
LB_87:
	call NS_E_73
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_88
	btr r12,4
	jmp LB_89
LB_88:
	bts r12,4
LB_89:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_80
	btr r12,3
	jmp LB_81
LB_80:
	bts r12,3
LB_81:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_78
	btr r12,2
	jmp LB_79
LB_78:
	bts r12,2
LB_79:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_76
	btr r12,1
	jmp LB_77
LB_76:
	bts r12,1
LB_77:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_74
	btr r12,0
	jmp LB_75
LB_74:
	bts r12,0
LB_75:
	add rsp,40
; _f29 %_53 ⊢ { %_61 %_62 } : { %_61 %_62 }
 ; {>  %_55~1':_r64 %_51~3':_r64 %_60~4':_r64 %_53~0':_r64 %_57~2':_r64 }
	mov r10,r13
; _f29 %_55 ⊢ { %_63 %_64 } : { %_63 %_64 }
 ; {>  %_62~5':_r64 %_55~1':_r64 %_51~3':_r64 %_60~4':_r64 %_57~2':_r64 %_61~0':_r64 }
	mov r11,r14
; _f29 %_57 ⊢ { %_65 %_66 } : { %_65 %_66 }
 ; {>  %_62~5':_r64 %_51~3':_r64 %_64~6':_r64 %_60~4':_r64 %_57~2':_r64 %_61~0':_r64 %_63~1':_r64 }
	mov rcx,r15
; _f31 %_64 ⊢ %_67 : %_67
 ; {>  %_62~5':_r64 %_51~3':_r64 %_65~2':_r64 %_64~6':_r64 %_60~4':_r64 %_61~0':_r64 %_66~7':_r64 %_63~1':_r64 }
	sub r11,1
; _f73 { %_67 %_66 %_62 } ⊢ %_68 : %_68
 ; {>  %_62~5':_r64 %_51~3':_r64 %_65~2':_r64 %_60~4':_r64 %_67~6':_r64 %_61~0':_r64 %_66~7':_r64 %_63~1':_r64 }
; _f73 { 6' 7' 5' } ⊢ 5'
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
	jc LB_100
	btr r12,0
	jmp LB_101
LB_100:
	bts r12,0
LB_101:
	mov r14,rcx
	bt r12,7
	jc LB_102
	btr r12,1
	jmp LB_103
LB_102:
	bts r12,1
LB_103:
	mov r15,r10
	bt r12,5
	jc LB_104
	btr r12,2
	jmp LB_105
LB_104:
	bts r12,2
LB_105:
	call NS_E_73
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_106
	btr r12,5
	jmp LB_107
LB_106:
	bts r12,5
LB_107:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_98
	btr r12,4
	jmp LB_99
LB_98:
	bts r12,4
LB_99:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_96
	btr r12,3
	jmp LB_97
LB_96:
	bts r12,3
LB_97:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_94
	btr r12,2
	jmp LB_95
LB_94:
	bts r12,2
LB_95:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_92
	btr r12,1
	jmp LB_93
LB_92:
	bts r12,1
LB_93:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_90
	btr r12,0
	jmp LB_91
LB_90:
	bts r12,0
LB_91:
	add rsp,48
; _f31 %_65 ⊢ %_69 : %_69
 ; {>  %_51~3':_r64 %_65~2':_r64 %_60~4':_r64 %_68~5':_r64 %_61~0':_r64 %_63~1':_r64 }
	sub r15,1
; _f73 { %_69 %_61 %_63 } ⊢ %_70 : %_70
 ; {>  %_51~3':_r64 %_60~4':_r64 %_68~5':_r64 %_69~2':_r64 %_61~0':_r64 %_63~1':_r64 }
; _f73 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_114
	btr r12,3
	jmp LB_115
LB_114:
	bts r12,3
LB_115:
	mov r15,r14
	bt r12,1
	jc LB_116
	btr r12,2
	jmp LB_117
LB_116:
	bts r12,2
LB_117:
	mov r14,r13
	bt r12,0
	jc LB_118
	btr r12,1
	jmp LB_119
LB_118:
	bts r12,1
LB_119:
	mov r13,r8
	bt r12,3
	jc LB_120
	btr r12,0
	jmp LB_121
LB_120:
	bts r12,0
LB_121:
	call NS_E_73
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_112
	btr r12,5
	jmp LB_113
LB_112:
	bts r12,5
LB_113:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_110
	btr r12,4
	jmp LB_111
LB_110:
	bts r12,4
LB_111:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_108
	btr r12,3
	jmp LB_109
LB_108:
	bts r12,3
LB_109:
	add rsp,32
; _f73 { %_60 %_68 %_70 } ⊢ %_71 : %_71
 ; {>  %_51~3':_r64 %_60~4':_r64 %_68~5':_r64 %_70~0':_r64 }
; _f73 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_124
	btr r12,1
	jmp LB_125
LB_124:
	bts r12,1
LB_125:
	mov r15,r13
	bt r12,0
	jc LB_126
	btr r12,2
	jmp LB_127
LB_126:
	bts r12,2
LB_127:
	mov r13,r9
	bt r12,4
	jc LB_128
	btr r12,0
	jmp LB_129
LB_128:
	bts r12,0
LB_129:
	call NS_E_73
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_122
	btr r12,3
	jmp LB_123
LB_122:
	bts r12,3
LB_123:
	add rsp,16
; ∎ %_71
 ; {>  %_51~3':_r64 %_71~0':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_130
	mov rdi,r8
	call dlt
LB_130:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_137:
; ∎ %_48
 ; {>  %_72~4':_r64 %_51~3':_r64 %_49~1':_r64 %_48~2':_r64 %_50~0':_r64 }
; 	∎ 2'
	bt r12,4
	jc LB_131
	mov rdi,r9
	call dlt
LB_131:
	bt r12,3
	jc LB_132
	mov rdi,r8
	call dlt
LB_132:
	bt r12,1
	jc LB_133
	mov rdi,r14
	call dlt
LB_133:
	bt r12,0
	jc LB_134
	mov rdi,r13
	call dlt
LB_134:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_135
	btr r12,0
	jmp LB_136
LB_135:
	bts r12,0
LB_136:
	ret
NS_E_164:
NS_E_RDI_164:
; » 0xraa |~ {  } ⊢ %_143 : %_143
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_143
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; » 0xr87 |~ {  } ⊢ %_144 : %_144
 ; {>  %_143~0':_r64 }
; 	» 0xr87 _ ⊢ 1' : %_144
	mov rdi,0x87
	mov r14,rdi
	bts r12,1
; _f26 { %_143 %_144 } ⊢ { %_145 %_146 %_147 } : { %_145 %_146 %_147 }
 ; {>  %_144~1':_r64 %_143~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r15,rsi
	bts r12,2
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_267
	bt r12,0
	jc LB_266
	mov rdi,r13
	call dlt
LB_266:
	jmp MTC_LB_265
LB_267:
; /0/0
	mov QWORD rax,0xab
	cmp rax,r13
	jnz LB_269
	bt r12,0
	jc LB_268
	mov rdi,r13
	call dlt
LB_268:
	jmp MTC_LB_264
LB_269:
; /0/0/0
	mov QWORD rax,0xaa
	cmp rax,r13
	jnz LB_271
	bt r12,0
	jc LB_270
	mov rdi,r13
	call dlt
LB_270:
	jmp MTC_LB_263
LB_271:
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_272
	btr r12,3
	jmp LB_273
LB_272:
	bts r12,3
LB_273:
; /0/0/0/
	jmp MTC_LB_262
MTC_LB_265:
; ∎ {  }
 ; {>  %_145~0':_r64 %_147~2':_r64 %_146~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_165
	mov rdi,r13
	call dlt
LB_165:
	bt r12,2
	jc LB_166
	mov rdi,r15
	call dlt
LB_166:
	bt r12,1
	jc LB_167
	mov rdi,r14
	call dlt
LB_167:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_264:
; ∎ {  }
 ; {>  %_145~0':_r64 %_147~2':_r64 %_146~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_168
	mov rdi,r13
	call dlt
LB_168:
	bt r12,2
	jc LB_169
	mov rdi,r15
	call dlt
LB_169:
	bt r12,1
	jc LB_170
	mov rdi,r14
	call dlt
LB_170:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_263:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "AA"
	mov rsi,0x_00_00_00_00_00_00_41_41
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r8,rax
	btr r12,3
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,3
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167"
	mov rsi,0x_00_00_00_00_00_00_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; "Qjjjjj"
	mov rsi,0x_00_00_6a_6a_6a_6a_6a_51
	mov QWORD [rdi+8*0],rsi
	add rdi,6
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,4
; _f14 %_152 ⊢ %_154 : %_154
 ; {>  %_152~3':_stg %_145~0':_r64 %_147~2':_r64 %_153~4':_stg %_146~1':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_179
	btr r12,0
	jmp LB_180
LB_179:
	bts r12,0
LB_180:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_181
	btr r12,3
	jmp LB_182
LB_181:
	bts r12,3
LB_182:
; pop_iv
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD [rsp],4
	jc LB_177
	btr r12,4
	jmp LB_178
LB_177:
	bts r12,4
LB_178:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_175
	btr r12,2
	jmp LB_176
LB_175:
	bts r12,2
LB_176:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_173
	btr r12,1
	jmp LB_174
LB_173:
	bts r12,1
LB_174:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_171
	btr r12,0
	jmp LB_172
LB_171:
	bts r12,0
LB_172:
	add rsp,40
; _f14 %_153 ⊢ %_155 : %_155
 ; {>  %_145~0':_r64 %_154~3':_stg %_147~2':_r64 %_153~4':_stg %_146~1':_r64 }
; _f14 4' ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 4' ⊢ 0'
	mov r13,r9
	bt r12,4
	jc LB_191
	btr r12,0
	jmp LB_192
LB_191:
	bts r12,0
LB_192:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_193
	btr r12,4
	jmp LB_194
LB_193:
	bts r12,4
LB_194:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_189
	btr r12,3
	jmp LB_190
LB_189:
	bts r12,3
LB_190:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_187
	btr r12,2
	jmp LB_188
LB_187:
	bts r12,2
LB_188:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_185
	btr r12,1
	jmp LB_186
LB_185:
	bts r12,1
LB_186:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_183
	btr r12,0
	jmp LB_184
LB_183:
	bts r12,0
LB_184:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_156 : %_156
 ; {>  %_145~0':_r64 %_154~3':_stg %_155~4':_stg %_147~2':_r64 %_146~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_156
	mov rdi,0x0
	mov r10,rdi
	bts r12,5
; _f42 { %_155 %_156 } ⊢ { %_157 %_158 %_159 } : { %_157 %_158 %_159 }
 ; {>  %_156~5':_r64 %_145~0':_r64 %_154~3':_stg %_155~4':_stg %_147~2':_r64 %_146~1':_r64 }
; _f42 { 4' 5' } ⊢ { 4' 5' 6' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,4
	jc LB_203
	btr r12,0
	jmp LB_204
LB_203:
	bts r12,0
LB_204:
	mov r14,r10
	bt r12,5
	jc LB_205
	btr r12,1
	jmp LB_206
LB_205:
	bts r12,1
LB_206:
	call NS_E_42
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 4' 5' 6' }
	mov r9,r13
	bt r12,0
	jc LB_207
	btr r12,4
	jmp LB_208
LB_207:
	bts r12,4
LB_208:
	mov r10,r14
	bt r12,1
	jc LB_209
	btr r12,5
	jmp LB_210
LB_209:
	bts r12,5
LB_210:
	mov r11,r8
	bt r12,3
	jc LB_213
	btr r12,6
	jmp LB_214
LB_213:
	bts r12,6
LB_214:
	mov rsi,0
	bt r12,6
	jc LB_211
	bts rsi,17
	bt r11,0
	jc LB_211
	jmp LB_212
LB_211:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,6
LB_212:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r11,rdi
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_201
	btr r12,3
	jmp LB_202
LB_201:
	bts r12,3
LB_202:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_199
	btr r12,2
	jmp LB_200
LB_199:
	bts r12,2
LB_200:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_197
	btr r12,1
	jmp LB_198
LB_197:
	bts r12,1
LB_198:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_195
	btr r12,0
	jmp LB_196
LB_195:
	bts r12,0
LB_196:
	add rsp,40
; _f14 { %_158 %_159 } ⊢ { %_160 %_161 } : { %_160 %_161 }
 ; {>  %_159~6':(_opn)◂(_stg) %_157~4':_stg %_158~5':_r64 %_145~0':_r64 %_154~3':_stg %_147~2':_r64 %_146~1':_r64 }
; _f14 { 5' 6' } ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 5' 6' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,5
	jc LB_227
	btr r12,1
	jmp LB_228
LB_227:
	bts r12,1
LB_228:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_225
	btr QWORD [rdi],0
	jmp LB_226
LB_225:
	bts QWORD [rdi],0
LB_226:
	mov r14,r11
	bt r12,6
	jc LB_231
	btr r12,1
	jmp LB_232
LB_231:
	bts r12,1
LB_232:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_229
	btr QWORD [rdi],1
	jmp LB_230
LB_229:
	bts QWORD [rdi],1
LB_230:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 5' 6' }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_235
	btr r12,1
	jmp LB_236
LB_235:
	bts r12,1
LB_236:
	mov r10,r14
	bt r12,1
	jc LB_233
	btr r12,5
	jmp LB_234
LB_233:
	bts r12,5
LB_234:
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_239
	btr r12,1
	jmp LB_240
LB_239:
	bts r12,1
LB_240:
	mov r11,r14
	bt r12,1
	jc LB_237
	btr r12,6
	jmp LB_238
LB_237:
	bts r12,6
LB_238:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_223
	btr r12,4
	jmp LB_224
LB_223:
	bts r12,4
LB_224:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_221
	btr r12,3
	jmp LB_222
LB_221:
	bts r12,3
LB_222:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_219
	btr r12,2
	jmp LB_220
LB_219:
	bts r12,2
LB_220:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_217
	btr r12,1
	jmp LB_218
LB_217:
	bts r12,1
LB_218:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_215
	btr r12,0
	jmp LB_216
LB_215:
	bts r12,0
LB_216:
	add rsp,48
; ∎ {  }
 ; {>  %_157~4':_stg %_145~0':_r64 %_161~6':(_opn)◂(_stg) %_154~3':_stg %_160~5':_r64 %_147~2':_r64 %_146~1':_r64 }
; 	∎ {  }
	bt r12,4
	jc LB_241
	mov rdi,r9
	call dlt
LB_241:
	bt r12,0
	jc LB_242
	mov rdi,r13
	call dlt
LB_242:
	bt r12,6
	jc LB_243
	mov rdi,r11
	call dlt
LB_243:
	bt r12,3
	jc LB_244
	mov rdi,r8
	call dlt
LB_244:
	bt r12,5
	jc LB_245
	mov rdi,r10
	call dlt
LB_245:
	bt r12,2
	jc LB_246
	mov rdi,r15
	call dlt
LB_246:
	bt r12,1
	jc LB_247
	mov rdi,r14
	call dlt
LB_247:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_262:
; _f14 %_162 ⊢ %_163 : %_163
 ; {>  %_162~3':_r64 %_145~0':_r64 %_147~2':_r64 %_146~1':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_254
	btr r12,0
	jmp LB_255
LB_254:
	bts r12,0
LB_255:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_256
	btr r12,3
	jmp LB_257
LB_256:
	bts r12,3
LB_257:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_252
	btr r12,2
	jmp LB_253
LB_252:
	bts r12,2
LB_253:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_250
	btr r12,1
	jmp LB_251
LB_250:
	bts r12,1
LB_251:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_248
	btr r12,0
	jmp LB_249
LB_248:
	bts r12,0
LB_249:
	add rsp,32
; ∎ {  }
 ; {>  %_163~3':_r64 %_145~0':_r64 %_147~2':_r64 %_146~1':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_258
	mov rdi,r8
	call dlt
LB_258:
	bt r12,0
	jc LB_259
	mov rdi,r13
	call dlt
LB_259:
	bt r12,2
	jc LB_260
	mov rdi,r15
	call dlt
LB_260:
	bt r12,1
	jc LB_261
	mov rdi,r14
	call dlt
LB_261:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	CST_DYN_164:
		dq 0x0001_0001_00_82_ffff
		dq 1
