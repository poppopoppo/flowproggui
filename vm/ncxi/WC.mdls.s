%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_167
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
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
NS_E_43:
NS_E_RDI_43:
NS_E_43_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_44
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_44:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_45_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_45_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46:
NS_E_RDI_46:
NS_E_46_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_46_LB_0
	cmp r11,57
	ja NS_E_46_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_46_LB_0:
	mov rax,0
	ret
NS_E_48:
NS_E_RDI_48:
NS_E_48_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_48_LB_0
	cmp r11,122
	ja NS_E_48_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_48_LB_0:
	mov rax,0
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_47_LB_0
	cmp r11,90
	ja NS_E_47_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47_LB_0:
	mov rax,0
	ret
NS_E_18:
NS_E_RDI_18:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_22:
	mov rdi,r8
	bt r12,0
NS_E_RDI_22:
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
NS_E_76:
; 	|» { 0' 1' 2' }
NS_E_RDI_76:
; _f27 { %_50 %_49 } ⊢ { %_52 %_53 %_54 } : { %_52 %_53 %_54 }
 ; {>  %_51~2':_r64 %_49~0':_r64 %_50~1':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_143
	bt r12,3
	jc LB_142
	mov rdi,r8
	call dlt
LB_142:
	jmp MTC_LB_141
LB_143:
; _emt_mov_ptn_to_ptn 3' ⊢ 4'
	mov r9,r8
	bt r12,3
	jc LB_144
	btr r12,4
	jmp LB_145
LB_144:
	bts r12,4
LB_145:
; /0/
	jmp MTC_LB_140
MTC_LB_141:
; _f30 %_53 ⊢ { %_56 %_57 } : { %_56 %_57 }
 ; {>  %_51~2':_r64 %_54~3':_r64 %_53~0':_r64 %_52~1':_r64 }
	mov r9,r13
; _f30 %_52 ⊢ { %_58 %_59 } : { %_58 %_59 }
 ; {>  %_51~2':_r64 %_54~3':_r64 %_57~4':_r64 %_52~1':_r64 %_56~0':_r64 }
	mov r10,r14
; _f30 %_51 ⊢ { %_60 %_61 } : { %_60 %_61 }
 ; {>  %_51~2':_r64 %_54~3':_r64 %_59~5':_r64 %_58~1':_r64 %_57~4':_r64 %_56~0':_r64 }
	mov r11,r15
; _f32 %_57 ⊢ %_62 : %_62
 ; {>  %_60~2':_r64 %_54~3':_r64 %_59~5':_r64 %_58~1':_r64 %_57~4':_r64 %_61~6':_r64 %_56~0':_r64 }
	sub r9,1
; _f76 { %_62 %_59 %_61 } ⊢ %_63 : %_63
 ; {>  %_62~4':_r64 %_60~2':_r64 %_54~3':_r64 %_59~5':_r64 %_58~1':_r64 %_61~6':_r64 %_56~0':_r64 }
; _f76 { 4' 5' 6' } ⊢ 4'
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
	jc LB_85
	btr r12,0
	jmp LB_86
LB_85:
	bts r12,0
LB_86:
	mov r14,r10
	bt r12,5
	jc LB_87
	btr r12,1
	jmp LB_88
LB_87:
	bts r12,1
LB_88:
	mov r15,r11
	bt r12,6
	jc LB_89
	btr r12,2
	jmp LB_90
LB_89:
	bts r12,2
LB_90:
	call NS_E_76
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_91
	btr r12,4
	jmp LB_92
LB_91:
	bts r12,4
LB_92:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_83
	btr r12,3
	jmp LB_84
LB_83:
	bts r12,3
LB_84:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_81
	btr r12,2
	jmp LB_82
LB_81:
	bts r12,2
LB_82:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_79
	btr r12,1
	jmp LB_80
LB_79:
	bts r12,1
LB_80:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_77
	btr r12,0
	jmp LB_78
LB_77:
	bts r12,0
LB_78:
	add rsp,40
; _f30 %_56 ⊢ { %_64 %_65 } : { %_64 %_65 }
 ; {>  %_60~2':_r64 %_54~3':_r64 %_58~1':_r64 %_56~0':_r64 %_63~4':_r64 }
	mov r10,r13
; _f30 %_58 ⊢ { %_66 %_67 } : { %_66 %_67 }
 ; {>  %_65~5':_r64 %_64~0':_r64 %_60~2':_r64 %_54~3':_r64 %_58~1':_r64 %_63~4':_r64 }
	mov r11,r14
; _f30 %_60 ⊢ { %_68 %_69 } : { %_68 %_69 }
 ; {>  %_65~5':_r64 %_64~0':_r64 %_60~2':_r64 %_54~3':_r64 %_67~6':_r64 %_66~1':_r64 %_63~4':_r64 }
	mov rcx,r15
; _f32 %_67 ⊢ %_70 : %_70
 ; {>  %_65~5':_r64 %_64~0':_r64 %_54~3':_r64 %_68~2':_r64 %_69~7':_r64 %_67~6':_r64 %_66~1':_r64 %_63~4':_r64 }
	sub r11,1
; _f76 { %_70 %_69 %_65 } ⊢ %_71 : %_71
 ; {>  %_65~5':_r64 %_64~0':_r64 %_54~3':_r64 %_68~2':_r64 %_69~7':_r64 %_70~6':_r64 %_66~1':_r64 %_63~4':_r64 }
; _f76 { 6' 7' 5' } ⊢ 5'
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
	jc LB_103
	btr r12,0
	jmp LB_104
LB_103:
	bts r12,0
LB_104:
	mov r14,rcx
	bt r12,7
	jc LB_105
	btr r12,1
	jmp LB_106
LB_105:
	bts r12,1
LB_106:
	mov r15,r10
	bt r12,5
	jc LB_107
	btr r12,2
	jmp LB_108
LB_107:
	bts r12,2
LB_108:
	call NS_E_76
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_109
	btr r12,5
	jmp LB_110
LB_109:
	bts r12,5
LB_110:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_101
	btr r12,4
	jmp LB_102
LB_101:
	bts r12,4
LB_102:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_99
	btr r12,3
	jmp LB_100
LB_99:
	bts r12,3
LB_100:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_97
	btr r12,2
	jmp LB_98
LB_97:
	bts r12,2
LB_98:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_95
	btr r12,1
	jmp LB_96
LB_95:
	bts r12,1
LB_96:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_93
	btr r12,0
	jmp LB_94
LB_93:
	bts r12,0
LB_94:
	add rsp,48
; _f32 %_68 ⊢ %_72 : %_72
 ; {>  %_64~0':_r64 %_54~3':_r64 %_68~2':_r64 %_66~1':_r64 %_71~5':_r64 %_63~4':_r64 }
	sub r15,1
; _f76 { %_72 %_64 %_66 } ⊢ %_73 : %_73
 ; {>  %_72~2':_r64 %_64~0':_r64 %_54~3':_r64 %_66~1':_r64 %_71~5':_r64 %_63~4':_r64 }
; _f76 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_117
	btr r12,3
	jmp LB_118
LB_117:
	bts r12,3
LB_118:
	mov r15,r14
	bt r12,1
	jc LB_119
	btr r12,2
	jmp LB_120
LB_119:
	bts r12,2
LB_120:
	mov r14,r13
	bt r12,0
	jc LB_121
	btr r12,1
	jmp LB_122
LB_121:
	bts r12,1
LB_122:
	mov r13,r8
	bt r12,3
	jc LB_123
	btr r12,0
	jmp LB_124
LB_123:
	bts r12,0
LB_124:
	call NS_E_76
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_115
	btr r12,5
	jmp LB_116
LB_115:
	bts r12,5
LB_116:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_113
	btr r12,4
	jmp LB_114
LB_113:
	bts r12,4
LB_114:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_111
	btr r12,3
	jmp LB_112
LB_111:
	bts r12,3
LB_112:
	add rsp,32
; _f76 { %_63 %_71 %_73 } ⊢ %_74 : %_74
 ; {>  %_54~3':_r64 %_71~5':_r64 %_73~0':_r64 %_63~4':_r64 }
; _f76 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_127
	btr r12,1
	jmp LB_128
LB_127:
	bts r12,1
LB_128:
	mov r15,r13
	bt r12,0
	jc LB_129
	btr r12,2
	jmp LB_130
LB_129:
	bts r12,2
LB_130:
	mov r13,r9
	bt r12,4
	jc LB_131
	btr r12,0
	jmp LB_132
LB_131:
	bts r12,0
LB_132:
	call NS_E_76
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_125
	btr r12,3
	jmp LB_126
LB_125:
	bts r12,3
LB_126:
	add rsp,16
; ∎ %_74
 ; {>  %_54~3':_r64 %_74~0':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_133
	mov rdi,r8
	call dlt
LB_133:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_140:
; ∎ %_51
 ; {>  %_51~2':_r64 %_75~4':_r64 %_54~3':_r64 %_53~0':_r64 %_52~1':_r64 }
; 	∎ 2'
	bt r12,4
	jc LB_134
	mov rdi,r9
	call dlt
LB_134:
	bt r12,3
	jc LB_135
	mov rdi,r8
	call dlt
LB_135:
	bt r12,0
	jc LB_136
	mov rdi,r13
	call dlt
LB_136:
	bt r12,1
	jc LB_137
	mov rdi,r14
	call dlt
LB_137:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_138
	btr r12,0
	jmp LB_139
LB_138:
	bts r12,0
LB_139:
	ret
NS_E_167:
NS_E_RDI_167:
; » 0xraa |~ {  } ⊢ %_146 : %_146
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_146
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; » 0xr87 |~ {  } ⊢ %_147 : %_147
 ; {>  %_146~0':_r64 }
; 	» 0xr87 _ ⊢ 1' : %_147
	mov rdi,0x87
	mov r14,rdi
	bts r12,1
; _f27 { %_146 %_147 } ⊢ { %_148 %_149 %_150 } : { %_148 %_149 %_150 }
 ; {>  %_147~1':_r64 %_146~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r15,rsi
	bts r12,2
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_270
	bt r12,0
	jc LB_269
	mov rdi,r13
	call dlt
LB_269:
	jmp MTC_LB_268
LB_270:
; /0/0
	mov QWORD rax,0xab
	cmp rax,r13
	jnz LB_272
	bt r12,0
	jc LB_271
	mov rdi,r13
	call dlt
LB_271:
	jmp MTC_LB_267
LB_272:
; /0/0/0
	mov QWORD rax,0xaa
	cmp rax,r13
	jnz LB_274
	bt r12,0
	jc LB_273
	mov rdi,r13
	call dlt
LB_273:
	jmp MTC_LB_266
LB_274:
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_275
	btr r12,3
	jmp LB_276
LB_275:
	bts r12,3
LB_276:
; /0/0/0/
	jmp MTC_LB_265
MTC_LB_268:
; ∎ {  }
 ; {>  %_149~1':_r64 %_148~0':_r64 %_150~2':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_168
	mov rdi,r14
	call dlt
LB_168:
	bt r12,0
	jc LB_169
	mov rdi,r13
	call dlt
LB_169:
	bt r12,2
	jc LB_170
	mov rdi,r15
	call dlt
LB_170:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_267:
; ∎ {  }
 ; {>  %_149~1':_r64 %_148~0':_r64 %_150~2':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_171
	mov rdi,r14
	call dlt
LB_171:
	bt r12,0
	jc LB_172
	mov rdi,r13
	call dlt
LB_172:
	bt r12,2
	jc LB_173
	mov rdi,r15
	call dlt
LB_173:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_266:
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
; _f15 %_155 ⊢ %_157 : %_157
 ; {>  %_149~1':_r64 %_156~4':_stg %_148~0':_r64 %_150~2':_r64 %_155~3':_stg }
; _f15 3' ⊢ 3'
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
	jc LB_182
	btr r12,0
	jmp LB_183
LB_182:
	bts r12,0
LB_183:
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_184
	btr r12,3
	jmp LB_185
LB_184:
	bts r12,3
LB_185:
; pop_iv
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD [rsp],4
	jc LB_180
	btr r12,4
	jmp LB_181
LB_180:
	bts r12,4
LB_181:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_178
	btr r12,2
	jmp LB_179
LB_178:
	bts r12,2
LB_179:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_176
	btr r12,1
	jmp LB_177
LB_176:
	bts r12,1
LB_177:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_174
	btr r12,0
	jmp LB_175
LB_174:
	bts r12,0
LB_175:
	add rsp,40
; _f15 %_156 ⊢ %_158 : %_158
 ; {>  %_149~1':_r64 %_157~3':_stg %_156~4':_stg %_148~0':_r64 %_150~2':_r64 }
; _f15 4' ⊢ 4'
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
	jc LB_194
	btr r12,0
	jmp LB_195
LB_194:
	bts r12,0
LB_195:
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_196
	btr r12,4
	jmp LB_197
LB_196:
	bts r12,4
LB_197:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_192
	btr r12,3
	jmp LB_193
LB_192:
	bts r12,3
LB_193:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_190
	btr r12,2
	jmp LB_191
LB_190:
	bts r12,2
LB_191:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_188
	btr r12,1
	jmp LB_189
LB_188:
	bts r12,1
LB_189:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_186
	btr r12,0
	jmp LB_187
LB_186:
	bts r12,0
LB_187:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_159 : %_159
 ; {>  %_149~1':_r64 %_157~3':_stg %_158~4':_stg %_148~0':_r64 %_150~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_159
	mov rdi,0x0
	mov r10,rdi
	bts r12,5
; _f45 { %_158 %_159 } ⊢ { %_160 %_161 %_162 } : { %_160 %_161 %_162 }
 ; {>  %_159~5':_r64 %_149~1':_r64 %_157~3':_stg %_158~4':_stg %_148~0':_r64 %_150~2':_r64 }
; _f45 { 4' 5' } ⊢ { 4' 5' 6' }
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
	jc LB_206
	btr r12,0
	jmp LB_207
LB_206:
	bts r12,0
LB_207:
	mov r14,r10
	bt r12,5
	jc LB_208
	btr r12,1
	jmp LB_209
LB_208:
	bts r12,1
LB_209:
	call NS_E_45
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 4' 5' 6' }
	mov r9,r13
	bt r12,0
	jc LB_210
	btr r12,4
	jmp LB_211
LB_210:
	bts r12,4
LB_211:
	mov r10,r14
	bt r12,1
	jc LB_212
	btr r12,5
	jmp LB_213
LB_212:
	bts r12,5
LB_213:
	mov r11,r8
	bt r12,3
	jc LB_216
	btr r12,6
	jmp LB_217
LB_216:
	bts r12,6
LB_217:
	mov rsi,0
	bt r12,6
	jc LB_214
	bts rsi,17
	bt r11,0
	jc LB_214
	jmp LB_215
LB_214:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,6
LB_215:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r11,rdi
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_204
	btr r12,3
	jmp LB_205
LB_204:
	bts r12,3
LB_205:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_202
	btr r12,2
	jmp LB_203
LB_202:
	bts r12,2
LB_203:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_200
	btr r12,1
	jmp LB_201
LB_200:
	bts r12,1
LB_201:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_198
	btr r12,0
	jmp LB_199
LB_198:
	bts r12,0
LB_199:
	add rsp,40
; _f15 { %_161 %_162 } ⊢ { %_163 %_164 } : { %_163 %_164 }
 ; {>  %_149~1':_r64 %_157~3':_stg %_162~6':(_opn)◂(_stg) %_148~0':_r64 %_150~2':_r64 %_161~5':_r64 %_160~4':_stg }
; _f15 { 5' 6' } ⊢ { 5' 6' }
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
	jc LB_230
	btr r12,1
	jmp LB_231
LB_230:
	bts r12,1
LB_231:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_228
	btr QWORD [rdi],0
	jmp LB_229
LB_228:
	bts QWORD [rdi],0
LB_229:
	mov r14,r11
	bt r12,6
	jc LB_234
	btr r12,1
	jmp LB_235
LB_234:
	bts r12,1
LB_235:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_232
	btr QWORD [rdi],1
	jmp LB_233
LB_232:
	bts QWORD [rdi],1
LB_233:
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ { 5' 6' }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_238
	btr r12,1
	jmp LB_239
LB_238:
	bts r12,1
LB_239:
	mov r10,r14
	bt r12,1
	jc LB_236
	btr r12,5
	jmp LB_237
LB_236:
	bts r12,5
LB_237:
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_242
	btr r12,1
	jmp LB_243
LB_242:
	bts r12,1
LB_243:
	mov r11,r14
	bt r12,1
	jc LB_240
	btr r12,6
	jmp LB_241
LB_240:
	bts r12,6
LB_241:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_226
	btr r12,4
	jmp LB_227
LB_226:
	bts r12,4
LB_227:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_224
	btr r12,3
	jmp LB_225
LB_224:
	bts r12,3
LB_225:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_222
	btr r12,2
	jmp LB_223
LB_222:
	bts r12,2
LB_223:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_220
	btr r12,1
	jmp LB_221
LB_220:
	bts r12,1
LB_221:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_218
	btr r12,0
	jmp LB_219
LB_218:
	bts r12,0
LB_219:
	add rsp,48
; ∎ {  }
 ; {>  %_164~6':(_opn)◂(_stg) %_163~5':_r64 %_149~1':_r64 %_157~3':_stg %_148~0':_r64 %_150~2':_r64 %_160~4':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_244
	mov rdi,r11
	call dlt
LB_244:
	bt r12,5
	jc LB_245
	mov rdi,r10
	call dlt
LB_245:
	bt r12,1
	jc LB_246
	mov rdi,r14
	call dlt
LB_246:
	bt r12,3
	jc LB_247
	mov rdi,r8
	call dlt
LB_247:
	bt r12,0
	jc LB_248
	mov rdi,r13
	call dlt
LB_248:
	bt r12,2
	jc LB_249
	mov rdi,r15
	call dlt
LB_249:
	bt r12,4
	jc LB_250
	mov rdi,r9
	call dlt
LB_250:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_265:
; _f15 %_165 ⊢ %_166 : %_166
 ; {>  %_149~1':_r64 %_165~3':_r64 %_148~0':_r64 %_150~2':_r64 }
; _f15 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_257
	btr r12,0
	jmp LB_258
LB_257:
	bts r12,0
LB_258:
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_259
	btr r12,3
	jmp LB_260
LB_259:
	bts r12,3
LB_260:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_255
	btr r12,2
	jmp LB_256
LB_255:
	bts r12,2
LB_256:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_253
	btr r12,1
	jmp LB_254
LB_253:
	bts r12,1
LB_254:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_251
	btr r12,0
	jmp LB_252
LB_251:
	bts r12,0
LB_252:
	add rsp,32
; ∎ {  }
 ; {>  %_166~3':_r64 %_149~1':_r64 %_148~0':_r64 %_150~2':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_261
	mov rdi,r8
	call dlt
LB_261:
	bt r12,1
	jc LB_262
	mov rdi,r14
	call dlt
LB_262:
	bt r12,0
	jc LB_263
	mov rdi,r13
	call dlt
LB_263:
	bt r12,2
	jc LB_264
	mov rdi,r15
	call dlt
LB_264:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_46:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_46
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48
	NS_E_DYN_76:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_76
	CST_DYN_167:
		dq 0x0001_0001_00_82_ffff
		dq 1
