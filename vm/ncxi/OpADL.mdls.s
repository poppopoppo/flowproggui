%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1575
	call NS_E_3842
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
NS_E_70:
; 	|» { 0' 1' }
NS_E_RDI_70:
MTC_LB_71:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_72
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_73
	bt QWORD [rax],0
	jc LB_74
	btr r12,4
	jmp LB_75
LB_74:
	bts r12,4
LB_75:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_73:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_78
	btr r12,5
	jmp LB_79
LB_78:
	bts r12,5
LB_79:
	mov r8,r11
	bt r12,5
	jc LB_76
	btr r12,2
	jmp LB_77
LB_76:
	bts r12,2
LB_77:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
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
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_84:
	cmp r15,0
	jz LB_85
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_84
LB_85:
; _f39 %_57 ⊢ %_61 : %_61
 ; {>  %_60~3':(_lst)◂(_r64) %_59~2':_r64 %_57~0':_r64 }
	add r13,1
; _f70 { %_61 %_60 } ⊢ { %_62 %_63 } : { %_62 %_63 }
 ; {>  %_60~3':(_lst)◂(_r64) %_59~2':_r64 %_61~0':_r64 }
; _f70 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_88
	btr r12,1
	jmp LB_89
LB_88:
	bts r12,1
LB_89:
	call NS_E_70
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_86
	btr r12,2
	jmp LB_87
LB_86:
	bts r12,2
LB_87:
	add rsp,16
; _f38 %_62 ⊢ %_64 : %_64
 ; {>  %_62~0':_r64 %_59~2':_r64 %_63~1':_stg }
	sub r13,1
; _f16 { %_63 %_64 %_59 } ⊢ { %_65 %_66 %_67 } : { %_65 %_66 %_67 }
 ; {>  %_64~0':_r64 %_59~2':_r64 %_63~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_90
	btr r12,3
	jmp LB_91
LB_90:
	bts r12,3
LB_91:
	mov r14,r13
	bt r12,0
	jc LB_92
	btr r12,1
	jmp LB_93
LB_92:
	bts r12,1
LB_93:
	mov r13,r9
	bt r12,3
	jc LB_94
	btr r12,0
	jmp LB_95
LB_94:
	bts r12,0
LB_95:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_66 %_65 }
 ; {>  %_65~0':_stg %_67~2':_r64 %_66~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_96
	mov rdi,r8
	call dlt
LB_96:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_97
	btr r12,2
	jmp LB_98
LB_97:
	bts r12,2
LB_98:
	mov r14,r13
	bt r12,0
	jc LB_99
	btr r12,1
	jmp LB_100
LB_99:
	bts r12,1
LB_100:
	mov r13,r8
	bt r12,2
	jc LB_101
	btr r12,0
	jmp LB_102
LB_101:
	bts r12,0
LB_102:
	ret
MTC_LB_72:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_103
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_104
	bt QWORD [rax],0
	jc LB_105
	btr r12,2
	jmp LB_106
LB_105:
	bts r12,2
LB_106:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_104:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_107:
	cmp r15,0
	jz LB_108
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_107
LB_108:
; _f14 %_57 ⊢ { %_68 %_69 } : { %_68 %_69 }
 ; {>  %_57~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_68 %_69 }
 ; {>  %_68~0':_r64 %_69~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_103:
NS_E_113:
; 	|» 0'
NS_E_RDI_113:
; » 0xr0 |~ {  } ⊢ %_110 : %_110
 ; {>  %_109~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_110
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f70 { %_110 %_109 } ⊢ { %_111 %_112 } : { %_111 %_112 }
 ; {>  %_110~1':_r64 %_109~0':(_lst)◂(_r64) }
; _f70 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_114
	btr r12,2
	jmp LB_115
LB_114:
	bts r12,2
LB_115:
	mov r14,r13
	bt r12,0
	jc LB_116
	btr r12,1
	jmp LB_117
LB_116:
	bts r12,1
LB_117:
	mov r13,r8
	bt r12,2
	jc LB_118
	btr r12,0
	jmp LB_119
LB_118:
	bts r12,0
LB_119:
	call NS_E_70
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_112
 ; {>  %_112~1':_stg %_111~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_120
	mov rdi,r13
	call dlt
LB_120:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_121
	btr r12,0
	jmp LB_122
LB_121:
	bts r12,0
LB_122:
	ret
NS_E_123:
NS_E_RDI_123:
NS_E_123_ETR_TBL:
NS_E_123_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_164
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_164
	jmp LB_165
LB_164:
	jmp LB_154
LB_165:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_169
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_170
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_170:
	jmp LB_154
LB_169:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_157
	btr r12,1
	jmp LB_158
LB_157:
	bts r12,1
LB_158:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_155
	btr r12,0
	jmp LB_156
LB_155:
	bts r12,0
LB_156:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_151
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_172
	btr r12,2
	jmp LB_173
LB_172:
	bts r12,2
LB_173:
	mov r13,r14
	bt r12,1
	jc LB_174
	btr r12,0
	jmp LB_175
LB_174:
	bts r12,0
LB_175:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f113 %_126 ⊢ %_127 : %_127
 ; {>  %_126~0':(_lst)◂(_r64) }
; _f113 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_113
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_127 ⊢ %_128 : %_128
 ; {>  %_127~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_128
 ; {>  %_128~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_149
	btr r12,3
	jmp LB_150
LB_149:
	bts r12,3
LB_150:
	mov r8,0
	bts r12,2
	ret
LB_151:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_153
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_152
LB_153:
	add rsp,8
	ret
LB_154:
	add rsp,32
	pop r14
LB_152:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_124:
NS_E_RDI_124:
NS_E_124_ETR_TBL:
NS_E_124_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_201
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_201
	jmp LB_202
LB_201:
	jmp LB_189
LB_202:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_125_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_206
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_207:
	jmp LB_189
LB_206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_212
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_213
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_213:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_214
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_214:
	jmp LB_189
LB_212:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_194
	btr r12,2
	jmp LB_195
LB_194:
	bts r12,2
LB_195:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_192
	btr r12,1
	jmp LB_193
LB_192:
	bts r12,1
LB_193:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_190
	btr r12,0
	jmp LB_191
LB_190:
	bts r12,0
LB_191:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_186
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_216
	btr r12,3
	jmp LB_217
LB_216:
	bts r12,3
LB_217:
	mov r14,r8
	bt r12,2
	jc LB_218
	btr r12,1
	jmp LB_219
LB_218:
	bts r12,1
LB_219:
	mov r8,r13
	bt r12,0
	jc LB_220
	btr r12,2
	jmp LB_221
LB_220:
	bts r12,2
LB_221:
	mov r13,r9
	bt r12,3
	jc LB_222
	btr r12,0
	jmp LB_223
LB_222:
	bts r12,0
LB_223:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_129 %_130 } ⊢ %_131 : %_131
 ; {>  %_129~0':_r64 %_130~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_131 ⊢ %_132 : %_132
 ; {>  %_131~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_132
 ; {>  %_132~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_180
	btr r12,2
	jmp LB_181
LB_180:
	bts r12,2
LB_181:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_178
	btr QWORD [rdi],0
	jmp LB_179
LB_178:
	bts QWORD [rdi],0
LB_179:
	mov r8,r14
	bt r12,1
	jc LB_184
	btr r12,2
	jmp LB_185
LB_184:
	bts r12,2
LB_185:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_182
	btr QWORD [rdi],1
	jmp LB_183
LB_182:
	bts QWORD [rdi],1
LB_183:
	mov rsi,1
	bt r12,3
	jc LB_176
	mov rsi,0
	bt r9,0
	jc LB_176
	jmp LB_177
LB_176:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_177:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_186:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_188
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_187
LB_188:
	add rsp,8
	ret
LB_189:
	add rsp,48
	pop r14
LB_187:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_237
	jmp LB_238
LB_237:
	jmp LB_229
LB_238:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_230
	btr r12,0
	jmp LB_231
LB_230:
	bts r12,0
LB_231:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_226
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_133 : %_133
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_133 ⊢ %_134 : %_134
 ; {>  %_133~°1◂{  }:(_lst)◂(t63'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_134
 ; {>  %_134~°0◂°1◂{  }:(_opn)◂((_lst)◂(t66'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_224
	mov rsi,0
	bt r9,0
	jc LB_224
	jmp LB_225
LB_224:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_225:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_226:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_228
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_227
LB_228:
	add rsp,8
	ret
LB_229:
	add rsp,16
	pop r14
LB_227:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_260
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_252
LB_260:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_265
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_266
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_266:
	jmp LB_252
LB_265:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_255
	btr r12,1
	jmp LB_256
LB_255:
	bts r12,1
LB_256:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_253
	btr r12,0
	jmp LB_254
LB_253:
	bts r12,0
LB_254:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_249
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_135 %_136 } ⊢ %_137 : %_137
 ; {>  %_136~1':(_lst)◂(_r64) %_135~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_137 ⊢ %_138 : %_138
 ; {>  %_137~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_138
 ; {>  %_138~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_243
	btr r12,2
	jmp LB_244
LB_243:
	bts r12,2
LB_244:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_241
	btr QWORD [rdi],0
	jmp LB_242
LB_241:
	bts QWORD [rdi],0
LB_242:
	mov r8,r14
	bt r12,1
	jc LB_247
	btr r12,2
	jmp LB_248
LB_247:
	bts r12,2
LB_248:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_245
	btr QWORD [rdi],1
	jmp LB_246
LB_245:
	bts QWORD [rdi],1
LB_246:
	mov rsi,1
	bt r12,3
	jc LB_239
	mov rsi,0
	bt r9,0
	jc LB_239
	jmp LB_240
LB_239:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_240:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_249:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_251
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_250
LB_251:
	add rsp,8
	ret
LB_252:
	add rsp,32
	pop r14
LB_250:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_125:
NS_E_RDI_125:
NS_E_125_ETR_TBL:
NS_E_125_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_281
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_281
	jmp LB_282
LB_281:
	jmp LB_273
LB_282:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_274
	btr r12,0
	jmp LB_275
LB_274:
	bts r12,0
LB_275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_270
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_139 : %_139
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_139
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_139 ⊢ %_140 : %_140
 ; {>  %_139~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_140
 ; {>  %_140~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_268
	btr r12,3
	jmp LB_269
LB_268:
	bts r12,3
LB_269:
	mov r8,0
	bts r12,2
	ret
LB_270:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_272
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_271
LB_272:
	add rsp,8
	ret
LB_273:
	add rsp,16
	pop r14
LB_271:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_296
	jmp LB_297
LB_296:
	jmp LB_288
LB_297:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_289
	btr r12,0
	jmp LB_290
LB_289:
	bts r12,0
LB_290:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_285
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_141 : %_141
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_141
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_141 ⊢ %_142 : %_142
 ; {>  %_141~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_142
 ; {>  %_142~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_283
	btr r12,3
	jmp LB_284
LB_283:
	bts r12,3
LB_284:
	mov r8,0
	bts r12,2
	ret
LB_285:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_287
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_286
LB_287:
	add rsp,8
	ret
LB_288:
	add rsp,16
	pop r14
LB_286:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_311
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_311
	jmp LB_312
LB_311:
	jmp LB_303
LB_312:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_304
	btr r12,0
	jmp LB_305
LB_304:
	bts r12,0
LB_305:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_300
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_143 : %_143
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_143
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_143 ⊢ %_144 : %_144
 ; {>  %_143~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_144
 ; {>  %_144~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_298
	btr r12,3
	jmp LB_299
LB_298:
	bts r12,3
LB_299:
	mov r8,0
	bts r12,2
	ret
LB_300:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_302
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_301
LB_302:
	add rsp,8
	ret
LB_303:
	add rsp,16
	pop r14
LB_301:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_326
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_326
	jmp LB_327
LB_326:
	jmp LB_318
LB_327:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_319
	btr r12,0
	jmp LB_320
LB_319:
	bts r12,0
LB_320:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_315
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_145 : %_145
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_145
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_145 ⊢ %_146 : %_146
 ; {>  %_145~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_146
 ; {>  %_146~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_313
	btr r12,3
	jmp LB_314
LB_313:
	bts r12,3
LB_314:
	mov r8,0
	bts r12,2
	ret
LB_315:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_317
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_316
LB_317:
	add rsp,8
	ret
LB_318:
	add rsp,16
	pop r14
LB_316:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_341
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_341
	jmp LB_342
LB_341:
	jmp LB_333
LB_342:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_334
	btr r12,0
	jmp LB_335
LB_334:
	bts r12,0
LB_335:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_330
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_147 : %_147
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_147
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_147 ⊢ %_148 : %_148
 ; {>  %_147~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_148
 ; {>  %_148~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_328
	btr r12,3
	jmp LB_329
LB_328:
	bts r12,3
LB_329:
	mov r8,0
	bts r12,2
	ret
LB_330:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_332
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_331
LB_332:
	add rsp,8
	ret
LB_333:
	add rsp,16
	pop r14
LB_331:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_343:
NS_E_RDI_343:
NS_E_343_ETR_TBL:
NS_E_343_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_380
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_374
LB_380:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_375
	btr r12,0
	jmp LB_376
LB_375:
	bts r12,0
LB_376:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_371
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_345 : %_345
 ; {>  %_344~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_345
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_346 : %_346
 ; {>  %_344~0':_r64 %_345~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_346
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_344 %_345 } ⊢ { %_347 %_348 %_349 } : { %_347 %_348 %_349 }
 ; {>  %_344~0':_r64 %_346~2':_r64 %_345~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_346 %_347 } ⊢ { %_350 %_351 %_352 } : { %_350 %_351 %_352 }
 ; {>  %_348~1':_r64 %_349~3':_r64 %_346~2':_r64 %_347~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_355:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_356
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_356
LB_357:
	cmp r15,0
	jz LB_358
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_357
LB_358:
; _some %_351 ⊢ %_353 : %_353
 ; {>  %_348~1':_r64 %_350~2':_r64 %_351~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_353
 ; {>  %_348~1':_r64 %_353~°0◂0':(_opn)◂(_r64) %_350~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_359
	mov rdi,r14
	call dlt
LB_359:
	bt r12,2
	jc LB_360
	mov rdi,r8
	call dlt
LB_360:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_361
	btr r12,3
	jmp LB_362
LB_361:
	bts r12,3
LB_362:
	mov r8,0
	bts r12,2
	ret
MTC_LB_356:
	mov r15,0
LB_364:
	cmp r15,0
	jz LB_365
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_364
LB_365:
; _none {  } ⊢ %_354 : %_354
 ; {>  %_348~1':_r64 %_349~3':_r64 %_350~2':_r64 %_352~4':_r64 %_351~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_354
 ; {>  %_348~1':_r64 %_349~3':_r64 %_350~2':_r64 %_354~°1◂{  }:(_opn)◂(t141'(0)) %_352~4':_r64 %_351~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_366
	mov rdi,r14
	call dlt
LB_366:
	bt r12,3
	jc LB_367
	mov rdi,r9
	call dlt
LB_367:
	bt r12,2
	jc LB_368
	mov rdi,r8
	call dlt
LB_368:
	bt r12,4
	jc LB_369
	mov rdi,r10
	call dlt
LB_369:
	bt r12,0
	jc LB_370
	mov rdi,r13
	call dlt
LB_370:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_363:
LB_371:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_373
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_372
LB_373:
	add rsp,8
	ret
LB_374:
	add rsp,16
	pop r14
LB_372:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_382:
NS_E_RDI_382:
NS_E_382_ETR_TBL:
NS_E_382_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_419
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_413
LB_419:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_414
	btr r12,0
	jmp LB_415
LB_414:
	bts r12,0
LB_415:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_410
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_384 : %_384
 ; {>  %_383~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_384
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_385 : %_385
 ; {>  %_383~0':_r64 %_384~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_385
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_383 %_384 } ⊢ { %_386 %_387 %_388 } : { %_386 %_387 %_388 }
 ; {>  %_385~2':_r64 %_383~0':_r64 %_384~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_385 %_386 } ⊢ { %_389 %_390 %_391 } : { %_389 %_390 %_391 }
 ; {>  %_386~0':_r64 %_385~2':_r64 %_387~1':_r64 %_388~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_394:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_395
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_395
LB_396:
	cmp r15,0
	jz LB_397
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_396
LB_397:
; _some %_390 ⊢ %_392 : %_392
 ; {>  %_390~0':_r64 %_387~1':_r64 %_389~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_392
 ; {>  %_392~°0◂0':(_opn)◂(_r64) %_387~1':_r64 %_389~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_398
	mov rdi,r14
	call dlt
LB_398:
	bt r12,2
	jc LB_399
	mov rdi,r8
	call dlt
LB_399:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_400
	btr r12,3
	jmp LB_401
LB_400:
	bts r12,3
LB_401:
	mov r8,0
	bts r12,2
	ret
MTC_LB_395:
	mov r15,0
LB_403:
	cmp r15,0
	jz LB_404
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_403
LB_404:
; _none {  } ⊢ %_393 : %_393
 ; {>  %_391~4':_r64 %_390~0':_r64 %_387~1':_r64 %_389~2':_r64 %_388~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_393
 ; {>  %_391~4':_r64 %_393~°1◂{  }:(_opn)◂(t168'(0)) %_390~0':_r64 %_387~1':_r64 %_389~2':_r64 %_388~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_405
	mov rdi,r10
	call dlt
LB_405:
	bt r12,0
	jc LB_406
	mov rdi,r13
	call dlt
LB_406:
	bt r12,1
	jc LB_407
	mov rdi,r14
	call dlt
LB_407:
	bt r12,2
	jc LB_408
	mov rdi,r8
	call dlt
LB_408:
	bt r12,3
	jc LB_409
	mov rdi,r9
	call dlt
LB_409:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_402:
LB_410:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_412
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_411
LB_412:
	add rsp,8
	ret
LB_413:
	add rsp,16
	pop r14
LB_411:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_421:
NS_E_RDI_421:
NS_E_421_ETR_TBL:
NS_E_421_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_458
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_452
LB_458:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_453
	btr r12,0
	jmp LB_454
LB_453:
	bts r12,0
LB_454:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_449
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_423 : %_423
 ; {>  %_422~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_423
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_424 : %_424
 ; {>  %_423~1':_r64 %_422~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_424
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_422 %_423 } ⊢ { %_425 %_426 %_427 } : { %_425 %_426 %_427 }
 ; {>  %_424~2':_r64 %_423~1':_r64 %_422~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_424 %_425 } ⊢ { %_428 %_429 %_430 } : { %_428 %_429 %_430 }
 ; {>  %_427~3':_r64 %_426~1':_r64 %_425~0':_r64 %_424~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_433:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_434
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_434
LB_435:
	cmp r15,0
	jz LB_436
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_435
LB_436:
; _some %_429 ⊢ %_431 : %_431
 ; {>  %_426~1':_r64 %_428~2':_r64 %_429~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_431
 ; {>  %_426~1':_r64 %_431~°0◂0':(_opn)◂(_r64) %_428~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_437
	mov rdi,r14
	call dlt
LB_437:
	bt r12,2
	jc LB_438
	mov rdi,r8
	call dlt
LB_438:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_439
	btr r12,3
	jmp LB_440
LB_439:
	bts r12,3
LB_440:
	mov r8,0
	bts r12,2
	ret
MTC_LB_434:
	mov r15,0
LB_442:
	cmp r15,0
	jz LB_443
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_442
LB_443:
; _none {  } ⊢ %_432 : %_432
 ; {>  %_430~4':_r64 %_427~3':_r64 %_426~1':_r64 %_428~2':_r64 %_429~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_432
 ; {>  %_430~4':_r64 %_427~3':_r64 %_426~1':_r64 %_432~°1◂{  }:(_opn)◂(t195'(0)) %_428~2':_r64 %_429~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_444
	mov rdi,r10
	call dlt
LB_444:
	bt r12,3
	jc LB_445
	mov rdi,r9
	call dlt
LB_445:
	bt r12,1
	jc LB_446
	mov rdi,r14
	call dlt
LB_446:
	bt r12,2
	jc LB_447
	mov rdi,r8
	call dlt
LB_447:
	bt r12,0
	jc LB_448
	mov rdi,r13
	call dlt
LB_448:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_441:
LB_449:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_451
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_450
LB_451:
	add rsp,8
	ret
LB_452:
	add rsp,16
	pop r14
LB_450:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_460:
NS_E_RDI_460:
NS_E_460_ETR_TBL:
NS_E_460_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_421_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_476
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_470
LB_476:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_471
	btr r12,0
	jmp LB_472
LB_471:
	bts r12,0
LB_472:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_467
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_461 ⊢ %_462 : %_462
 ; {>  %_461~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_462
 ; {>  %_462~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_465
	btr r12,3
	jmp LB_466
LB_465:
	bts r12,3
LB_466:
	mov r8,0
	bts r12,2
	ret
LB_467:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_469
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_468
LB_469:
	add rsp,8
	ret
LB_470:
	add rsp,16
	pop r14
LB_468:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_489
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_483
LB_489:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_484
	btr r12,0
	jmp LB_485
LB_484:
	bts r12,0
LB_485:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_480
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_463 ⊢ %_464 : %_464
 ; {>  %_463~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_464
 ; {>  %_464~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_478
	btr r12,3
	jmp LB_479
LB_478:
	bts r12,3
LB_479:
	mov r8,0
	bts r12,2
	ret
LB_480:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_482
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_481
LB_482:
	add rsp,8
	ret
LB_483:
	add rsp,16
	pop r14
LB_481:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_491:
NS_E_RDI_491:
NS_E_491_ETR_TBL:
NS_E_491_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_460_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_528
LB_536:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_492_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_542:
	jmp LB_528
LB_541:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_531
	btr r12,1
	jmp LB_532
LB_531:
	bts r12,1
LB_532:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_529
	btr r12,0
	jmp LB_530
LB_529:
	bts r12,0
LB_530:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_525
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_494 %_495 } ⊢ %_496 : %_496
 ; {>  %_494~0':_r64 %_495~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f113 %_496 ⊢ %_497 : %_497
 ; {>  %_496~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f113 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_511
	btr r12,2
	jmp LB_512
LB_511:
	bts r12,2
LB_512:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_517
	btr r12,3
	jmp LB_518
LB_517:
	bts r12,3
LB_518:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_515
	btr QWORD [rdi],0
	jmp LB_516
LB_515:
	bts QWORD [rdi],0
LB_516:
	mov r9,r14
	bt r12,1
	jc LB_521
	btr r12,3
	jmp LB_522
LB_521:
	bts r12,3
LB_522:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_519
	btr QWORD [rdi],1
	jmp LB_520
LB_519:
	bts QWORD [rdi],1
LB_520:
	mov rsi,1
	bt r12,0
	jc LB_513
	mov rsi,0
	bt r13,0
	jc LB_513
	jmp LB_514
LB_513:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_514:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_113
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_497 ⊢ %_498 : %_498
 ; {>  %_497~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_498
 ; {>  %_498~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_523
	btr r12,3
	jmp LB_524
LB_523:
	bts r12,3
LB_524:
	mov r8,0
	bts r12,2
	ret
LB_525:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_527
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_526
LB_527:
	add rsp,8
	ret
LB_528:
	add rsp,32
	pop r14
LB_526:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_492:
NS_E_RDI_492:
NS_E_492_ETR_TBL:
NS_E_492_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_493_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_565
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_557
LB_565:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_492_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_570
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_571:
	jmp LB_557
LB_570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_560
	btr r12,1
	jmp LB_561
LB_560:
	bts r12,1
LB_561:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_558
	btr r12,0
	jmp LB_559
LB_558:
	bts r12,0
LB_559:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_554
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_499 %_500 } ⊢ %_501 : %_501
 ; {>  %_500~1':(_lst)◂(_r64) %_499~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_501 ⊢ %_502 : %_502
 ; {>  %_501~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_502
 ; {>  %_502~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_548
	btr r12,2
	jmp LB_549
LB_548:
	bts r12,2
LB_549:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_546
	btr QWORD [rdi],0
	jmp LB_547
LB_546:
	bts QWORD [rdi],0
LB_547:
	mov r8,r14
	bt r12,1
	jc LB_552
	btr r12,2
	jmp LB_553
LB_552:
	bts r12,2
LB_553:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_550
	btr QWORD [rdi],1
	jmp LB_551
LB_550:
	bts QWORD [rdi],1
LB_551:
	mov rsi,1
	bt r12,3
	jc LB_544
	mov rsi,0
	bt r9,0
	jc LB_544
	jmp LB_545
LB_544:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_545:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_554:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_556
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_555
LB_556:
	add rsp,8
	ret
LB_557:
	add rsp,32
	pop r14
LB_555:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_575
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_503 : %_503
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_503 ⊢ %_504 : %_504
 ; {>  %_503~°1◂{  }:(_lst)◂(t239'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_504
 ; {>  %_504~°0◂°1◂{  }:(_opn)◂((_lst)◂(t242'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_573
	mov rsi,0
	bt r9,0
	jc LB_573
	jmp LB_574
LB_573:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_574:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_575:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_577
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_576
LB_577:
	add rsp,8
	ret
LB_578:
	add rsp,0
	pop r14
LB_576:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_493:
NS_E_RDI_493:
NS_E_493_ETR_TBL:
NS_E_493_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_460_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_590
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_584
LB_590:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_585
	btr r12,0
	jmp LB_586
LB_585:
	bts r12,0
LB_586:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_581
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_505 ⊢ %_506 : %_506
 ; {>  %_505~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_506
 ; {>  %_506~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_579
	btr r12,3
	jmp LB_580
LB_579:
	bts r12,3
LB_580:
	mov r8,0
	bts r12,2
	ret
LB_581:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_583
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_582
LB_583:
	add rsp,8
	ret
LB_584:
	add rsp,16
	pop r14
LB_582:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_343_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_603
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_597
LB_603:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_598
	btr r12,0
	jmp LB_599
LB_598:
	bts r12,0
LB_599:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_594
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_507 ⊢ %_508 : %_508
 ; {>  %_507~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_508
 ; {>  %_508~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_592
	btr r12,3
	jmp LB_593
LB_592:
	bts r12,3
LB_593:
	mov r8,0
	bts r12,2
	ret
LB_594:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_596
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_595
LB_596:
	add rsp,8
	ret
LB_597:
	add rsp,16
	pop r14
LB_595:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_618
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_618
	jmp LB_619
LB_618:
	jmp LB_610
LB_619:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_611
	btr r12,0
	jmp LB_612
LB_611:
	bts r12,0
LB_612:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_607
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_509 : %_509
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_509
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_509 ⊢ %_510 : %_510
 ; {>  %_509~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_510
 ; {>  %_510~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_605
	btr r12,3
	jmp LB_606
LB_605:
	bts r12,3
LB_606:
	mov r8,0
	bts r12,2
	ret
LB_607:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_609
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_608
LB_609:
	add rsp,8
	ret
LB_610:
	add rsp,16
	pop r14
LB_608:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_620:
NS_E_RDI_620:
NS_E_620_ETR_TBL:
NS_E_620_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_641
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_641
	jmp LB_642
LB_641:
	jmp LB_631
LB_642:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_492_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_646
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_647
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_647:
	jmp LB_631
LB_646:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_634
	btr r12,1
	jmp LB_635
LB_634:
	bts r12,1
LB_635:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_632
	btr r12,0
	jmp LB_633
LB_632:
	bts r12,0
LB_633:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_628
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_649
	btr r12,2
	jmp LB_650
LB_649:
	bts r12,2
LB_650:
	mov r13,r14
	bt r12,1
	jc LB_651
	btr r12,0
	jmp LB_652
LB_651:
	bts r12,0
LB_652:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f113 %_621 ⊢ %_622 : %_622
 ; {>  %_621~0':(_lst)◂(_r64) }
; _f113 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_113
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_622 ⊢ %_623 : %_623
 ; {>  %_622~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_623
 ; {>  %_623~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_626
	btr r12,3
	jmp LB_627
LB_626:
	bts r12,3
LB_627:
	mov r8,0
	bts r12,2
	ret
LB_628:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_630
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_629
LB_630:
	add rsp,8
	ret
LB_631:
	add rsp,32
	pop r14
LB_629:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_664
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_658
LB_664:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_659
	btr r12,0
	jmp LB_660
LB_659:
	bts r12,0
LB_660:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_655
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_624 ⊢ %_625 : %_625
 ; {>  %_624~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_625
 ; {>  %_625~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_653
	btr r12,3
	jmp LB_654
LB_653:
	bts r12,3
LB_654:
	mov r8,0
	bts r12,2
	ret
LB_655:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_657
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_656
LB_657:
	add rsp,8
	ret
LB_658:
	add rsp,16
	pop r14
LB_656:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_667:
NS_E_RDI_667:
NS_E_667_ETR_TBL:
NS_E_667_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_676:
	jmp LB_673
LB_672:
	add r14,1
LB_673:
	cmp r14,r10
	jge LB_674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_672
	cmp al,10
	jz LB_672
	cmp al,32
	jz LB_672
LB_674:
	push r10
	push rsi
	call NS_E_491_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_675
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_677
	bts QWORD [rax],0
LB_677:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_676
LB_675:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_670
	btr QWORD [rdi],0
LB_670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_669:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_764:
NS_E_RDI_764:
NS_E_764_ETR_TBL:
NS_E_764_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_866
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_866
	jmp LB_867
LB_866:
	jmp LB_858
LB_867:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_859
	btr r12,0
	jmp LB_860
LB_859:
	bts r12,0
LB_860:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_855
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_768 : %_768
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_768
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_768 ⊢ %_769 : %_769
 ; {>  %_768~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_769
 ; {>  %_769~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_853
	btr r12,3
	jmp LB_854
LB_853:
	bts r12,3
LB_854:
	mov r8,0
	bts r12,2
	ret
LB_855:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_857
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_856
LB_857:
	add rsp,8
	ret
LB_858:
	add rsp,16
	pop r14
LB_856:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_882
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_874
LB_882:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_887
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_888
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_888:
	jmp LB_874
LB_887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_877
	btr r12,1
	jmp LB_878
LB_877:
	bts r12,1
LB_878:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_875
	btr r12,0
	jmp LB_876
LB_875:
	bts r12,0
LB_876:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 %_771 ⊢ %_772 : %_772
 ; {>  %_770~0':_r64 %_771~1':_r64 }
	add r14,1
; _some %_772 ⊢ %_773 : %_773
 ; {>  %_770~0':_r64 %_772~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_773
 ; {>  %_770~0':_r64 %_773~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_868
	mov rdi,r13
	call dlt
LB_868:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_869
	btr r12,3
	jmp LB_870
LB_869:
	bts r12,3
LB_870:
	mov r8,0
	bts r12,2
	ret
LB_871:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_873
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_872
LB_873:
	add rsp,8
	ret
LB_874:
	add rsp,32
	pop r14
LB_872:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_765:
NS_E_RDI_765:
NS_E_765_ETR_TBL:
NS_E_765_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_903
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_903
	jmp LB_904
LB_903:
	jmp LB_895
LB_904:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_896
	btr r12,0
	jmp LB_897
LB_896:
	bts r12,0
LB_897:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_892
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_774 : %_774
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_774
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_774 ⊢ %_775 : %_775
 ; {>  %_774~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_775
 ; {>  %_775~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_890
	btr r12,3
	jmp LB_891
LB_890:
	bts r12,3
LB_891:
	mov r8,0
	bts r12,2
	ret
LB_892:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_894
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_893
LB_894:
	add rsp,8
	ret
LB_895:
	add rsp,16
	pop r14
LB_893:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_918
	jmp LB_919
LB_918:
	jmp LB_910
LB_919:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_911
	btr r12,0
	jmp LB_912
LB_911:
	bts r12,0
LB_912:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_907
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_776 : %_776
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_776
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_776 ⊢ %_777 : %_777
 ; {>  %_776~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_777
 ; {>  %_777~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_905
	btr r12,3
	jmp LB_906
LB_905:
	bts r12,3
LB_906:
	mov r8,0
	bts r12,2
	ret
LB_907:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_909
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_908
LB_909:
	add rsp,8
	ret
LB_910:
	add rsp,16
	pop r14
LB_908:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_922
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_778 : %_778
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_778
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_778 ⊢ %_779 : %_779
 ; {>  %_778~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_779
 ; {>  %_779~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_920
	btr r12,3
	jmp LB_921
LB_920:
	bts r12,3
LB_921:
	mov r8,0
	bts r12,2
	ret
LB_922:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_924
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_923
LB_924:
	add rsp,8
	ret
LB_925:
	add rsp,0
	pop r14
LB_923:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_766:
NS_E_RDI_766:
NS_E_766_ETR_TBL:
NS_E_766_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_968
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_952
LB_968:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_976
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_976
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_976
	jmp LB_977
LB_976:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_974
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_974:
	jmp LB_952
LB_977:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_981
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_982
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_982:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_983
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_983:
	jmp LB_952
LB_981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_993
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_993
	jmp LB_994
LB_993:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_989
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_989:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_990
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_990:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_991
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_991:
	jmp LB_952
LB_994:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_998
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_999
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_999:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1000
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1000:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1001
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1001:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1002
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1002:
	jmp LB_952
LB_998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1007
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1008
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1008:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1009
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1009:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1010
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1010:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1011
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1011:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1012
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1012:
	jmp LB_952
LB_1007:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_963
	btr r12,5
	jmp LB_964
LB_963:
	bts r12,5
LB_964:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_961
	btr r12,4
	jmp LB_962
LB_961:
	bts r12,4
LB_962:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_959
	btr r12,3
	jmp LB_960
LB_959:
	bts r12,3
LB_960:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_957
	btr r12,2
	jmp LB_958
LB_957:
	bts r12,2
LB_958:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_955
	btr r12,1
	jmp LB_956
LB_955:
	bts r12,1
LB_956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_953
	btr r12,0
	jmp LB_954
LB_953:
	bts r12,0
LB_954:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_949
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_1014
	btr r12,6
	jmp LB_1015
LB_1014:
	bts r12,6
LB_1015:
	mov r8,r10
	bt r12,4
	jc LB_1016
	btr r12,2
	jmp LB_1017
LB_1016:
	bts r12,2
LB_1017:
	mov rdx,r14
	bt r12,1
	jc LB_1018
	btr r12,7
	jmp LB_1019
LB_1018:
	bts r12,7
LB_1019:
	mov r14,rcx
	bt r12,6
	jc LB_1020
	btr r12,1
	jmp LB_1021
LB_1020:
	bts r12,1
LB_1021:
	mov rcx,r9
	bt r12,3
	jc LB_1022
	btr r12,6
	jmp LB_1023
LB_1022:
	bts r12,6
LB_1023:
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1026
	btr r12,8
	jmp LB_1027
LB_1026:
	bts r12,8
LB_1027:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1024
	btr r12,3
	jmp LB_1025
LB_1024:
	bts r12,3
LB_1025:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1030
	btr r12,8
	jmp LB_1031
LB_1030:
	bts r12,8
LB_1031:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1028
	btr r12,4
	jmp LB_1029
LB_1028:
	bts r12,4
LB_1029:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_785 : %_785
 ; {>  %_781~1':_r64 %_780~0':_r64 %_782~2':_r64 %_784~4':(_lst)◂(_p761) %_783~3':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_785
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f34 { %_785 %_780 } ⊢ { %_786 %_787 } : { %_786 %_787 }
 ; {>  %_781~1':_r64 %_780~0':_r64 %_785~5':_r64 %_782~2':_r64 %_784~4':(_lst)◂(_p761) %_783~3':_r64 }
	add r11,r13
; _f34 { %_786 %_781 } ⊢ { %_788 %_789 } : { %_788 %_789 }
 ; {>  %_781~1':_r64 %_786~5':_r64 %_782~2':_r64 %_784~4':(_lst)◂(_p761) %_787~0':_r64 %_783~3':_r64 }
	add r11,r14
; _f34 { %_788 %_782 } ⊢ { %_790 %_791 } : { %_790 %_791 }
 ; {>  %_789~1':_r64 %_782~2':_r64 %_784~4':(_lst)◂(_p761) %_787~0':_r64 %_783~3':_r64 %_788~5':_r64 }
	add r11,r8
; _f762 %_790 ⊢ %_792 : %_792
 ; {>  %_789~1':_r64 %_791~2':_r64 %_784~4':(_lst)◂(_p761) %_787~0':_r64 %_783~3':_r64 %_790~5':_r64 }
; _f762 5' ⊢ °0◂5'
; _cns { %_792 %_784 } ⊢ %_793 : %_793
 ; {>  %_789~1':_r64 %_792~°0◂5':_p761 %_791~2':_r64 %_784~4':(_lst)◂(_p761) %_787~0':_r64 %_783~3':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_783 %_793 } ⊢ %_794 : %_794
 ; {>  %_789~1':_r64 %_791~2':_r64 %_787~0':_r64 %_783~3':_r64 %_793~°0◂{ °0◂5' 4' }:(_lst)◂(_p761) }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_794
 ; {>  %_789~1':_r64 %_791~2':_r64 %_787~0':_r64 %_794~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p761) }) }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_926
	mov rdi,r14
	call dlt
LB_926:
	bt r12,2
	jc LB_927
	mov rdi,r8
	call dlt
LB_927:
	bt r12,0
	jc LB_928
	mov rdi,r13
	call dlt
LB_928:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_929
	btr r12,0
	jmp LB_930
LB_929:
	bts r12,0
LB_930:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_933
	btr r12,1
	jmp LB_934
LB_933:
	bts r12,1
LB_934:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_931
	btr QWORD [rdi],0
	jmp LB_932
LB_931:
	bts QWORD [rdi],0
LB_932:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_943
	btr r12,0
	jmp LB_944
LB_943:
	bts r12,0
LB_944:
	mov rsi,1
	bt r12,0
	jc LB_941
	mov rsi,0
	bt r13,0
	jc LB_941
	jmp LB_942
LB_941:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_942:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_939
	btr QWORD [rdi],0
	jmp LB_940
LB_939:
	bts QWORD [rdi],0
LB_940:
	mov r13,r10
	bt r12,4
	jc LB_947
	btr r12,0
	jmp LB_948
LB_947:
	bts r12,0
LB_948:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_945
	btr QWORD [rdi],1
	jmp LB_946
LB_945:
	bts QWORD [rdi],1
LB_946:
	mov rsi,1
	bt r12,1
	jc LB_937
	mov rsi,0
	bt r14,0
	jc LB_937
	jmp LB_938
LB_937:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_938:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_935
	btr QWORD [rdi],1
	jmp LB_936
LB_935:
	bts QWORD [rdi],1
LB_936:
	mov r8,0
	bts r12,2
	ret
LB_949:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_951
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_950
LB_951:
	add rsp,8
	ret
LB_952:
	add rsp,96
	pop r14
LB_950:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1069
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1057
LB_1069:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_1077
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_1077
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_1077
	jmp LB_1078
LB_1077:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1075:
	jmp LB_1057
LB_1078:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1082
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1083
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1083:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1084
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1084:
	jmp LB_1057
LB_1082:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1089
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1090
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1090:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1091
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1091:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1092:
	jmp LB_1057
LB_1089:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1064
	btr r12,3
	jmp LB_1065
LB_1064:
	bts r12,3
LB_1065:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1062
	btr r12,2
	jmp LB_1063
LB_1062:
	bts r12,2
LB_1063:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1060
	btr r12,1
	jmp LB_1061
LB_1060:
	bts r12,1
LB_1061:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1058
	btr r12,0
	jmp LB_1059
LB_1058:
	bts r12,0
LB_1059:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_1054
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_1094
	btr r12,4
	jmp LB_1095
LB_1094:
	bts r12,4
LB_1095:
	mov r14,r8
	bt r12,2
	jc LB_1096
	btr r12,1
	jmp LB_1097
LB_1096:
	bts r12,1
LB_1097:
	mov r11,r9
	bt r12,3
	jc LB_1098
	btr r12,5
	jmp LB_1099
LB_1098:
	bts r12,5
LB_1099:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1102
	btr r12,6
	jmp LB_1103
LB_1102:
	bts r12,6
LB_1103:
	mov r8,rcx
	bt r12,6
	jc LB_1100
	btr r12,2
	jmp LB_1101
LB_1100:
	bts r12,2
LB_1101:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1106
	btr r12,6
	jmp LB_1107
LB_1106:
	bts r12,6
LB_1107:
	mov r9,rcx
	bt r12,6
	jc LB_1104
	btr r12,3
	jmp LB_1105
LB_1104:
	bts r12,3
LB_1105:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_799 : %_799
 ; {>  %_798~3':(_lst)◂(_p761) %_796~1':_r64 %_797~2':_r64 %_795~0':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_799
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f34 { %_799 %_795 } ⊢ { %_800 %_801 } : { %_800 %_801 }
 ; {>  %_798~3':(_lst)◂(_p761) %_799~4':_r64 %_796~1':_r64 %_797~2':_r64 %_795~0':_r64 }
	add r10,r13
; _f34 { %_800 %_796 } ⊢ { %_802 %_803 } : { %_802 %_803 }
 ; {>  %_798~3':(_lst)◂(_p761) %_796~1':_r64 %_797~2':_r64 %_801~0':_r64 %_800~4':_r64 }
	add r10,r14
; _f762 %_802 ⊢ %_804 : %_804
 ; {>  %_798~3':(_lst)◂(_p761) %_803~1':_r64 %_797~2':_r64 %_801~0':_r64 %_802~4':_r64 }
; _f762 4' ⊢ °0◂4'
; _cns { %_804 %_798 } ⊢ %_805 : %_805
 ; {>  %_798~3':(_lst)◂(_p761) %_804~°0◂4':_p761 %_803~1':_r64 %_797~2':_r64 %_801~0':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_797 %_805 } ⊢ %_806 : %_806
 ; {>  %_803~1':_r64 %_797~2':_r64 %_801~0':_r64 %_805~°0◂{ °0◂4' 3' }:(_lst)◂(_p761) }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_806
 ; {>  %_803~1':_r64 %_806~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p761) }) %_801~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_1032
	mov rdi,r14
	call dlt
LB_1032:
	bt r12,0
	jc LB_1033
	mov rdi,r13
	call dlt
LB_1033:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_1034
	btr r12,0
	jmp LB_1035
LB_1034:
	bts r12,0
LB_1035:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_1038
	btr r12,1
	jmp LB_1039
LB_1038:
	bts r12,1
LB_1039:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1036
	btr QWORD [rdi],0
	jmp LB_1037
LB_1036:
	bts QWORD [rdi],0
LB_1037:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_1048
	btr r12,2
	jmp LB_1049
LB_1048:
	bts r12,2
LB_1049:
	mov rsi,1
	bt r12,2
	jc LB_1046
	mov rsi,0
	bt r8,0
	jc LB_1046
	jmp LB_1047
LB_1046:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1047:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_1044
	btr QWORD [rdi],0
	jmp LB_1045
LB_1044:
	bts QWORD [rdi],0
LB_1045:
	mov r8,r13
	bt r12,0
	jc LB_1052
	btr r12,2
	jmp LB_1053
LB_1052:
	bts r12,2
LB_1053:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_1050
	btr QWORD [rdi],1
	jmp LB_1051
LB_1050:
	bts QWORD [rdi],1
LB_1051:
	mov rsi,1
	bt r12,1
	jc LB_1042
	mov rsi,0
	bt r14,0
	jc LB_1042
	jmp LB_1043
LB_1042:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1043:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1040
	btr QWORD [rdi],1
	jmp LB_1041
LB_1040:
	bts QWORD [rdi],1
LB_1041:
	mov r8,0
	bts r12,2
	ret
LB_1054:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1056
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1055
LB_1056:
	add rsp,8
	ret
LB_1057:
	add rsp,64
	pop r14
LB_1055:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1179
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1171
LB_1179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1184
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1185
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1185:
	jmp LB_1171
LB_1184:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1174
	btr r12,1
	jmp LB_1175
LB_1174:
	bts r12,1
LB_1175:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1172
	btr r12,0
	jmp LB_1173
LB_1172:
	bts r12,0
LB_1173:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1168
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_1187
	btr r12,3
	jmp LB_1188
LB_1187:
	bts r12,3
LB_1188:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1191
	btr r12,4
	jmp LB_1192
LB_1191:
	bts r12,4
LB_1192:
	mov r14,r10
	bt r12,4
	jc LB_1189
	btr r12,1
	jmp LB_1190
LB_1189:
	bts r12,1
LB_1190:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1195
	btr r12,4
	jmp LB_1196
LB_1195:
	bts r12,4
LB_1196:
	mov r8,r10
	bt r12,4
	jc LB_1193
	btr r12,2
	jmp LB_1194
LB_1193:
	bts r12,2
LB_1194:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f34 { %_808 %_807 } ⊢ { %_810 %_811 } : { %_810 %_811 }
 ; {>  %_808~1':_r64 %_807~0':_r64 %_809~2':(_lst)◂(_p761) }
	add r14,r13
MTC_LB_1108:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1109
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
	jnc LB_1110
	bt QWORD [rax],0
	jc LB_1111
	btr r12,5
	jmp LB_1112
LB_1111:
	bts r12,5
LB_1112:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1110:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1115
	btr r12,6
	jmp LB_1116
LB_1115:
	bts r12,6
LB_1116:
	mov r9,rcx
	bt r12,6
	jc LB_1113
	btr r12,3
	jmp LB_1114
LB_1113:
	bts r12,3
LB_1114:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1119
	btr r12,6
	jmp LB_1120
LB_1119:
	bts r12,6
LB_1120:
	mov r10,rcx
	bt r12,6
	jc LB_1117
	btr r12,4
	jmp LB_1118
LB_1117:
	bts r12,4
LB_1118:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1109
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_1121
	bt QWORD [rax],0
	jc LB_1122
	btr r12,6
	jmp LB_1123
LB_1122:
	bts r12,6
LB_1123:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1121:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_1124
	btr r12,5
	jmp LB_1125
LB_1124:
	bts r12,5
LB_1125:
LB_1126:
	cmp r15,0
	jz LB_1127
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1126
LB_1127:
; _f34 { %_814 %_811 } ⊢ { %_815 %_816 } : { %_815 %_816 }
 ; {>  %_810~1':_r64 %_811~0':_r64 %_814~5':_r64 %_813~4':(_lst)◂(_p761) }
	add r11,r13
; _f763 %_815 ⊢ %_817 : %_817
 ; {>  %_815~5':_r64 %_810~1':_r64 %_816~0':_r64 %_813~4':(_lst)◂(_p761) }
; _f763 5' ⊢ °1◂5'
; _cns { %_817 %_813 } ⊢ %_818 : %_818
 ; {>  %_810~1':_r64 %_816~0':_r64 %_817~°1◂5':_p761 %_813~4':(_lst)◂(_p761) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_810 %_818 } ⊢ %_819 : %_819
 ; {>  %_818~°0◂{ °1◂5' 4' }:(_lst)◂(_p761) %_810~1':_r64 %_816~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_819
 ; {>  %_819~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p761) }) %_816~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_1128
	mov rdi,r13
	call dlt
LB_1128:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_1131
	btr r12,0
	jmp LB_1132
LB_1131:
	bts r12,0
LB_1132:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_1129
	btr QWORD [rdi],0
	jmp LB_1130
LB_1129:
	bts QWORD [rdi],0
LB_1130:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_1141
	btr r12,1
	jmp LB_1142
LB_1141:
	bts r12,1
LB_1142:
	mov rsi,1
	bt r12,1
	jc LB_1139
	mov rsi,0
	bt r14,0
	jc LB_1139
	jmp LB_1140
LB_1139:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1140:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1137
	btr QWORD [rdi],0
	jmp LB_1138
LB_1137:
	bts QWORD [rdi],0
LB_1138:
	mov r14,r10
	bt r12,4
	jc LB_1145
	btr r12,1
	jmp LB_1146
LB_1145:
	bts r12,1
LB_1146:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1143
	btr QWORD [rdi],1
	jmp LB_1144
LB_1143:
	bts QWORD [rdi],1
LB_1144:
	mov rsi,1
	bt r12,0
	jc LB_1135
	mov rsi,0
	bt r13,0
	jc LB_1135
	jmp LB_1136
LB_1135:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1136:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_1133
	btr QWORD [rdi],1
	jmp LB_1134
LB_1133:
	bts QWORD [rdi],1
LB_1134:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1109:
	mov r15,0
LB_1148:
	cmp r15,0
	jz LB_1149
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1148
LB_1149:
; _f763 %_811 ⊢ %_820 : %_820
 ; {>  %_809~2':(_lst)◂(_p761) %_810~1':_r64 %_811~0':_r64 }
; _f763 0' ⊢ °1◂0'
; _cns { %_820 %_809 } ⊢ %_821 : %_821
 ; {>  %_809~2':(_lst)◂(_p761) %_810~1':_r64 %_820~°1◂0':_p761 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_810 %_821 } ⊢ %_822 : %_822
 ; {>  %_821~°0◂{ °1◂0' 2' }:(_lst)◂(_p761) %_810~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_822
 ; {>  %_822~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p761) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_1152
	btr r12,4
	jmp LB_1153
LB_1152:
	bts r12,4
LB_1153:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1150
	btr QWORD [rdi],0
	jmp LB_1151
LB_1150:
	bts QWORD [rdi],0
LB_1151:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_1162
	btr r12,1
	jmp LB_1163
LB_1162:
	bts r12,1
LB_1163:
	mov rsi,1
	bt r12,1
	jc LB_1160
	mov rsi,0
	bt r14,0
	jc LB_1160
	jmp LB_1161
LB_1160:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1161:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1158
	btr QWORD [rdi],0
	jmp LB_1159
LB_1158:
	bts QWORD [rdi],0
LB_1159:
	mov r14,r8
	bt r12,2
	jc LB_1166
	btr r12,1
	jmp LB_1167
LB_1166:
	bts r12,1
LB_1167:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1164
	btr QWORD [rdi],1
	jmp LB_1165
LB_1164:
	bts QWORD [rdi],1
LB_1165:
	mov rsi,1
	bt r12,4
	jc LB_1156
	mov rsi,0
	bt r10,0
	jc LB_1156
	jmp LB_1157
LB_1156:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_1157:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1154
	btr QWORD [rdi],1
	jmp LB_1155
LB_1154:
	bts QWORD [rdi],1
LB_1155:
	mov r8,0
	bts r12,2
	ret
MTC_LB_1147:
LB_1168:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1170
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1169
LB_1170:
	add rsp,8
	ret
LB_1171:
	add rsp,32
	pop r14
LB_1169:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_1205
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_823 : %_823
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_824 : %_824
 ; {>  %_823~°1◂{  }:(_lst)◂(t400'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_824
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_824 %_823 } ⊢ %_825 : %_825
 ; {>  %_824~0':_r64 %_823~°1◂{  }:(_lst)◂(t400'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_825
 ; {>  %_825~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t404'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_1199
	btr r12,1
	jmp LB_1200
LB_1199:
	bts r12,1
LB_1200:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1197
	btr QWORD [rdi],0
	jmp LB_1198
LB_1197:
	bts QWORD [rdi],0
LB_1198:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_1203
	mov rsi,0
	bt r14,0
	jc LB_1203
	jmp LB_1204
LB_1203:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1204:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1201
	btr QWORD [rdi],1
	jmp LB_1202
LB_1201:
	bts QWORD [rdi],1
LB_1202:
	mov r8,0
	bts r12,2
	ret
LB_1205:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1207
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1206
LB_1207:
	add rsp,8
	ret
LB_1208:
	add rsp,0
	pop r14
LB_1206:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_767:
NS_E_RDI_767:
NS_E_767_ETR_TBL:
NS_E_767_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1228
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1216
LB_1228:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_1236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_1236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_1236
	jmp LB_1237
LB_1236:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1234
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1234:
	jmp LB_1216
LB_1237:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1241
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1242
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1242:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1243
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1243:
	jmp LB_1216
LB_1241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1253
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1253
	jmp LB_1254
LB_1253:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1249
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1249:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1250
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1250:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1251
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1251:
	jmp LB_1216
LB_1254:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1223
	btr r12,3
	jmp LB_1224
LB_1223:
	bts r12,3
LB_1224:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1221
	btr r12,2
	jmp LB_1222
LB_1221:
	bts r12,2
LB_1222:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1219
	btr r12,1
	jmp LB_1220
LB_1219:
	bts r12,1
LB_1220:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1217
	btr r12,0
	jmp LB_1218
LB_1217:
	bts r12,0
LB_1218:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_1213
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_1255
	btr r12,4
	jmp LB_1256
LB_1255:
	bts r12,4
LB_1256:
	mov r14,r8
	bt r12,2
	jc LB_1257
	btr r12,1
	jmp LB_1258
LB_1257:
	bts r12,1
LB_1258:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_828 : %_828
 ; {>  %_827~1':_r64 %_826~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_828
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f34 { %_828 %_826 } ⊢ { %_829 %_830 } : { %_829 %_830 }
 ; {>  %_828~2':_r64 %_827~1':_r64 %_826~0':_r64 }
	add r8,r13
; _f34 { %_829 %_827 } ⊢ { %_831 %_832 } : { %_831 %_832 }
 ; {>  %_830~0':_r64 %_829~2':_r64 %_827~1':_r64 }
	add r8,r14
; _some %_831 ⊢ %_833 : %_833
 ; {>  %_830~0':_r64 %_831~2':_r64 %_832~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_833
 ; {>  %_830~0':_r64 %_832~1':_r64 %_833~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1209
	mov rdi,r13
	call dlt
LB_1209:
	bt r12,1
	jc LB_1210
	mov rdi,r14
	call dlt
LB_1210:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1211
	btr r12,3
	jmp LB_1212
LB_1211:
	bts r12,3
LB_1212:
	mov r8,0
	bts r12,2
	ret
LB_1213:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1215
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1214
LB_1215:
	add rsp,8
	ret
LB_1216:
	add rsp,64
	pop r14
LB_1214:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1284
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1268
LB_1284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_1292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_1292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_1292
	jmp LB_1293
LB_1292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1290
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1290:
	jmp LB_1268
LB_1293:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1297
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1298
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1298:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1299:
	jmp LB_1268
LB_1297:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1309
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1309
	jmp LB_1310
LB_1309:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1305
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1305:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1306
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1306:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1307
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1307:
	jmp LB_1268
LB_1310:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1314
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1315
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1315:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1316
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1316:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1317
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1317:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1318:
	jmp LB_1268
LB_1314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1323
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1324
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1324:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1325
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1325:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1326
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1326:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1327
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1327:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1328:
	jmp LB_1268
LB_1323:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_1279
	btr r12,5
	jmp LB_1280
LB_1279:
	bts r12,5
LB_1280:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1277
	btr r12,4
	jmp LB_1278
LB_1277:
	bts r12,4
LB_1278:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1275
	btr r12,3
	jmp LB_1276
LB_1275:
	bts r12,3
LB_1276:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1273
	btr r12,2
	jmp LB_1274
LB_1273:
	bts r12,2
LB_1274:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1271
	btr r12,1
	jmp LB_1272
LB_1271:
	bts r12,1
LB_1272:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1269
	btr r12,0
	jmp LB_1270
LB_1269:
	bts r12,0
LB_1270:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_1265
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_1330
	btr r12,6
	jmp LB_1331
LB_1330:
	bts r12,6
LB_1331:
	mov r9,r11
	bt r12,5
	jc LB_1332
	btr r12,3
	jmp LB_1333
LB_1332:
	bts r12,3
LB_1333:
	mov r11,r8
	bt r12,2
	jc LB_1334
	btr r12,5
	jmp LB_1335
LB_1334:
	bts r12,5
LB_1335:
	mov r8,r10
	bt r12,4
	jc LB_1336
	btr r12,2
	jmp LB_1337
LB_1336:
	bts r12,2
LB_1337:
	mov r10,r14
	bt r12,1
	jc LB_1338
	btr r12,4
	jmp LB_1339
LB_1338:
	bts r12,4
LB_1339:
	mov r14,r11
	bt r12,5
	jc LB_1340
	btr r12,1
	jmp LB_1341
LB_1340:
	bts r12,1
LB_1341:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_838 : %_838
 ; {>  %_834~0':_r64 %_836~2':_r64 %_837~3':_r64 %_835~1':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_838
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f34 { %_838 %_834 } ⊢ { %_839 %_840 } : { %_839 %_840 }
 ; {>  %_834~0':_r64 %_838~4':_r64 %_836~2':_r64 %_837~3':_r64 %_835~1':_r64 }
	add r10,r13
; _f34 { %_839 %_835 } ⊢ { %_841 %_842 } : { %_841 %_842 }
 ; {>  %_839~4':_r64 %_836~2':_r64 %_837~3':_r64 %_840~0':_r64 %_835~1':_r64 }
	add r10,r14
; _f34 { %_841 %_836 } ⊢ { %_843 %_844 } : { %_843 %_844 }
 ; {>  %_836~2':_r64 %_841~4':_r64 %_842~1':_r64 %_837~3':_r64 %_840~0':_r64 }
	add r10,r8
; _f34 { %_843 %_837 } ⊢ { %_845 %_846 } : { %_845 %_846 }
 ; {>  %_843~4':_r64 %_844~2':_r64 %_842~1':_r64 %_837~3':_r64 %_840~0':_r64 }
	add r10,r9
; _some %_845 ⊢ %_847 : %_847
 ; {>  %_846~3':_r64 %_844~2':_r64 %_845~4':_r64 %_842~1':_r64 %_840~0':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_847
 ; {>  %_846~3':_r64 %_844~2':_r64 %_842~1':_r64 %_840~0':_r64 %_847~°0◂4':(_opn)◂(_r64) }
; 	∎ °0◂4'
	bt r12,3
	jc LB_1259
	mov rdi,r9
	call dlt
LB_1259:
	bt r12,2
	jc LB_1260
	mov rdi,r8
	call dlt
LB_1260:
	bt r12,1
	jc LB_1261
	mov rdi,r14
	call dlt
LB_1261:
	bt r12,0
	jc LB_1262
	mov rdi,r13
	call dlt
LB_1262:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_1263
	btr r12,3
	jmp LB_1264
LB_1263:
	bts r12,3
LB_1264:
	mov r8,0
	bts r12,2
	ret
LB_1265:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1267
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1266
LB_1267:
	add rsp,8
	ret
LB_1268:
	add rsp,96
	pop r14
LB_1266:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1356
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1348
LB_1356:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1361
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1362:
	jmp LB_1348
LB_1361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1351
	btr r12,1
	jmp LB_1352
LB_1351:
	bts r12,1
LB_1352:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1349
	btr r12,0
	jmp LB_1350
LB_1349:
	bts r12,0
LB_1350:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1345
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f34 { %_848 %_849 } ⊢ { %_850 %_851 } : { %_850 %_851 }
 ; {>  %_848~0':_r64 %_849~1':_r64 }
	add r13,r14
; _some %_850 ⊢ %_852 : %_852
 ; {>  %_850~0':_r64 %_851~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_852
 ; {>  %_852~°0◂0':(_opn)◂(_r64) %_851~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_1342
	mov rdi,r14
	call dlt
LB_1342:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1343
	btr r12,3
	jmp LB_1344
LB_1343:
	bts r12,3
LB_1344:
	mov r8,0
	bts r12,2
	ret
LB_1345:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1347
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1346
LB_1347:
	add rsp,8
	ret
LB_1348:
	add rsp,32
	pop r14
LB_1346:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1386:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_1386:
MTC_LB_1387:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1388
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_1389
	bt QWORD [rax],0
	jc LB_1390
	btr r12,7
	jmp LB_1391
LB_1390:
	bts r12,7
LB_1391:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1389:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1394
	btr r12,8
	jmp LB_1395
LB_1394:
	bts r12,8
LB_1395:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1392
	btr r12,5
	jmp LB_1393
LB_1392:
	bts r12,5
LB_1393:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1398
	btr r12,8
	jmp LB_1399
LB_1398:
	bts r12,8
LB_1399:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1396
	btr r12,6
	jmp LB_1397
LB_1396:
	bts r12,6
LB_1397:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1400:
	cmp r15,0
	jz LB_1401
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1400
LB_1401:
MTC_LB_1402:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1403
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_1404
	bt QWORD [rax],0
	jc LB_1405
	btr r12,7
	jmp LB_1406
LB_1405:
	bts r12,7
LB_1406:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1404:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_1407
	btr r12,4
	jmp LB_1408
LB_1407:
	bts r12,4
LB_1408:
LB_1409:
	cmp r15,0
	jz LB_1410
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1409
LB_1410:
; _f36 %_1371 ⊢ { %_1372 %_1373 } : { %_1372 %_1373 }
 ; {>  %_1371~4':_r64 %_1364~0':_stg %_1365~1':_r64 %_1370~6':(_lst)◂(_p761) %_1367~3':_r64 %_1366~2':_stg }
	mov r11,r10
	bts r12,5
; _f18 { %_1373 %_1364 %_1365 %_1366 %_1367 } ⊢ { %_1374 %_1375 %_1376 %_1377 %_1378 } : { %_1374 %_1375 %_1376 %_1377 %_1378 }
 ; {>  %_1364~0':_stg %_1372~4':_r64 %_1365~1':_r64 %_1373~5':_r64 %_1370~6':(_lst)◂(_p761) %_1367~3':_r64 %_1366~2':_stg }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_1415
	btr r12,4
	jmp LB_1416
LB_1415:
	bts r12,4
LB_1416:
	mov r9,r8
	bt r12,2
	jc LB_1417
	btr r12,3
	jmp LB_1418
LB_1417:
	bts r12,3
LB_1418:
	mov r8,r14
	bt r12,1
	jc LB_1419
	btr r12,2
	jmp LB_1420
LB_1419:
	bts r12,2
LB_1420:
	mov r14,r13
	bt r12,0
	jc LB_1421
	btr r12,1
	jmp LB_1422
LB_1421:
	bts r12,1
LB_1422:
	mov r13,r11
	bt r12,5
	jc LB_1423
	btr r12,0
	jmp LB_1424
LB_1423:
	bts r12,0
LB_1424:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_1425
	btr r12,5
	jmp LB_1426
LB_1425:
	bts r12,5
LB_1426:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1413
	btr r12,6
	jmp LB_1414
LB_1413:
	bts r12,6
LB_1414:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1411
	btr r12,4
	jmp LB_1412
LB_1411:
	bts r12,4
LB_1412:
	add rsp,24
; _f1386 { %_1375 %_1376 %_1377 %_1378 %_1370 } ⊢ { %_1379 %_1380 } : { %_1379 %_1380 }
 ; {>  %_1376~2':_r64 %_1378~5':_r64 %_1377~3':_stg %_1375~1':_stg %_1372~4':_r64 %_1374~0':_r64 %_1370~6':(_lst)◂(_p761) }
; _f1386 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_1431
	btr r12,0
	jmp LB_1432
LB_1431:
	bts r12,0
LB_1432:
	mov r14,r8
	bt r12,2
	jc LB_1433
	btr r12,1
	jmp LB_1434
LB_1433:
	bts r12,1
LB_1434:
	mov r8,r9
	bt r12,3
	jc LB_1435
	btr r12,2
	jmp LB_1436
LB_1435:
	bts r12,2
LB_1436:
	mov r9,r11
	bt r12,5
	jc LB_1437
	btr r12,3
	jmp LB_1438
LB_1437:
	bts r12,3
LB_1438:
	mov r10,rcx
	bt r12,6
	jc LB_1439
	btr r12,4
	jmp LB_1440
LB_1439:
	bts r12,4
LB_1440:
	call NS_E_1386
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1441
	btr r12,2
	jmp LB_1442
LB_1441:
	bts r12,2
LB_1442:
	mov r14,r13
	bt r12,0
	jc LB_1443
	btr r12,1
	jmp LB_1444
LB_1443:
	bts r12,1
LB_1444:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_1429
	btr r12,4
	jmp LB_1430
LB_1429:
	bts r12,4
LB_1430:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1427
	btr r12,0
	jmp LB_1428
LB_1427:
	bts r12,0
LB_1428:
	add rsp,24
; ∎ { %_1379 %_1380 }
 ; {>  %_1379~1':_stg %_1372~4':_r64 %_1374~0':_r64 %_1380~2':_stg }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_1445
	mov rdi,r10
	call dlt
LB_1445:
	bt r12,0
	jc LB_1446
	mov rdi,r13
	call dlt
LB_1446:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_1447
	btr r12,0
	jmp LB_1448
LB_1447:
	bts r12,0
LB_1448:
	mov r14,r8
	bt r12,2
	jc LB_1449
	btr r12,1
	jmp LB_1450
LB_1449:
	bts r12,1
LB_1450:
	ret
MTC_LB_1403:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1451
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_1452
	bt QWORD [rax],0
	jc LB_1453
	btr r12,7
	jmp LB_1454
LB_1453:
	bts r12,7
LB_1454:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1452:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_1455
	btr r12,4
	jmp LB_1456
LB_1455:
	bts r12,4
LB_1456:
LB_1457:
	cmp r15,0
	jz LB_1458
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1457
LB_1458:
; _f34 { %_1365 %_1381 } ⊢ { %_1382 %_1383 } : { %_1382 %_1383 }
 ; {>  %_1364~0':_stg %_1365~1':_r64 %_1381~4':_r64 %_1370~6':(_lst)◂(_p761) %_1367~3':_r64 %_1366~2':_stg }
	add r14,r10
; _f1386 { %_1364 %_1382 %_1366 %_1367 %_1370 } ⊢ { %_1384 %_1385 } : { %_1384 %_1385 }
 ; {>  %_1364~0':_stg %_1383~4':_r64 %_1382~1':_r64 %_1370~6':(_lst)◂(_p761) %_1367~3':_r64 %_1366~2':_stg }
; _f1386 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_1461
	btr r12,4
	jmp LB_1462
LB_1461:
	bts r12,4
LB_1462:
	call NS_E_1386
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1459
	btr r12,4
	jmp LB_1460
LB_1459:
	bts r12,4
LB_1460:
	add rsp,16
; ∎ { %_1384 %_1385 }
 ; {>  %_1385~1':_stg %_1384~0':_stg %_1383~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_1463
	mov rdi,r10
	call dlt
LB_1463:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1451:
MTC_LB_1388:
	mov r15,0
LB_1465:
	cmp r15,0
	jz LB_1466
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1465
LB_1466:
; ∎ { %_1364 %_1366 }
 ; {>  %_1364~0':_stg %_1365~1':_r64 %_1368~4':(_lst)◂(_p761) %_1367~3':_r64 %_1366~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_1467
	mov rdi,r14
	call dlt
LB_1467:
	bt r12,4
	jc LB_1468
	mov rdi,r10
	call dlt
LB_1468:
	bt r12,3
	jc LB_1469
	mov rdi,r9
	call dlt
LB_1469:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1470
	btr r12,1
	jmp LB_1471
LB_1470:
	bts r12,1
LB_1471:
	ret
MTC_LB_1464:
NS_E_1489:
; 	|» 0'
NS_E_RDI_1489:
; » 0xr0 |~ {  } ⊢ %_1473 : %_1473
 ; {>  %_1472~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1473
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f766 { %_1472 %_1473 } ⊢ { %_1474 %_1475 %_1476 } : { %_1474 %_1475 %_1476 }
 ; {>  %_1472~0':_stg %_1473~1':_r64 }
; _f766 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_766
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1490
	btr r12,4
	jmp LB_1491
LB_1490:
	bts r12,4
LB_1491:
	mov r8,r9
	bt r12,3
	jc LB_1494
	btr r12,2
	jmp LB_1495
LB_1494:
	bts r12,2
LB_1495:
	mov rsi,1
	bt r12,2
	jc LB_1492
	mov rsi,0
	bt r8,0
	jc LB_1492
	jmp LB_1493
LB_1492:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1493:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_1496:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1497
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
	jnc LB_1498
	bt QWORD [rax],0
	jc LB_1499
	btr r12,5
	jmp LB_1500
LB_1499:
	bts r12,5
LB_1500:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1498:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1503
	btr r12,6
	jmp LB_1504
LB_1503:
	bts r12,6
LB_1504:
	mov r9,rcx
	bt r12,6
	jc LB_1501
	btr r12,3
	jmp LB_1502
LB_1501:
	bts r12,3
LB_1502:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1507
	btr r12,6
	jmp LB_1508
LB_1507:
	bts r12,6
LB_1508:
	mov r10,rcx
	bt r12,6
	jc LB_1505
	btr r12,4
	jmp LB_1506
LB_1505:
	bts r12,4
LB_1506:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1509:
	cmp r15,0
	jz LB_1510
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1509
LB_1510:
; _f21 { %_1477 %_1478 } ⊢ { %_1479 %_1480 } : { %_1479 %_1480 }
 ; {>  %_1478~4':(_lst)◂(_p761) %_1477~3':_r64 %_1474~0':_stg %_1475~1':_r64 }
; _f21 { 3' 4' } ⊢ { 2' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000110.. |},{ 3' 4' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r9
	bt r12,3
	jc LB_1517
	btr r12,1
	jmp LB_1518
LB_1517:
	bts r12,1
LB_1518:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1515
	btr QWORD [rdi],0
	jmp LB_1516
LB_1515:
	bts QWORD [rdi],0
LB_1516:
	mov r14,r10
	bt r12,4
	jc LB_1521
	btr r12,1
	jmp LB_1522
LB_1521:
	bts r12,1
LB_1522:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1519
	btr QWORD [rdi],1
	jmp LB_1520
LB_1519:
	bts QWORD [rdi],1
LB_1520:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 2' 3' }
; 0' ⊢ { 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_1525
	btr r12,1
	jmp LB_1526
LB_1525:
	bts r12,1
LB_1526:
	mov r8,r14
	bt r12,1
	jc LB_1523
	btr r12,2
	jmp LB_1524
LB_1523:
	bts r12,2
LB_1524:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_1529
	btr r12,1
	jmp LB_1530
LB_1529:
	bts r12,1
LB_1530:
	mov r9,r14
	bt r12,1
	jc LB_1527
	btr r12,3
	jmp LB_1528
LB_1527:
	bts r12,3
LB_1528:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1513
	btr r12,1
	jmp LB_1514
LB_1513:
	bts r12,1
LB_1514:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1511
	btr r12,0
	jmp LB_1512
LB_1511:
	bts r12,0
LB_1512:
	add rsp,24
; _f14 %_1479 ⊢ { %_1481 %_1482 } : { %_1481 %_1482 }
 ; {>  %_1480~3':(_lst)◂(_p761) %_1479~2':_r64 %_1474~0':_stg %_1475~1':_r64 }
; _f14 2' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1537
	btr r12,0
	jmp LB_1538
LB_1537:
	bts r12,0
LB_1538:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_1539
	btr r12,2
	jmp LB_1540
LB_1539:
	bts r12,2
LB_1540:
	mov r10,r14
	bt r12,1
	jc LB_1541
	btr r12,4
	jmp LB_1542
LB_1541:
	bts r12,4
LB_1542:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1535
	btr r12,3
	jmp LB_1536
LB_1535:
	bts r12,3
LB_1536:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1533
	btr r12,1
	jmp LB_1534
LB_1533:
	bts r12,1
LB_1534:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1531
	btr r12,0
	jmp LB_1532
LB_1531:
	bts r12,0
LB_1532:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_1483 : %_1483
 ; {>  %_1480~3':(_lst)◂(_p761) %_1474~0':_stg %_1482~4':_stg %_1475~1':_r64 %_1481~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_1483
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_1484 : %_1484
 ; {>  %_1480~3':(_lst)◂(_p761) %_1474~0':_stg %_1482~4':_stg %_1475~1':_r64 %_1483~5':_r64 %_1481~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_1484
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f1386 { %_1474 %_1483 %_1482 %_1484 %_1480 } ⊢ { %_1485 %_1486 } : { %_1485 %_1486 }
 ; {>  %_1480~3':(_lst)◂(_p761) %_1474~0':_stg %_1484~6':_r64 %_1482~4':_stg %_1475~1':_r64 %_1483~5':_r64 %_1481~2':_r64 }
; _f1386 { 0' 5' 4' 6' 3' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 4' 6' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_1547
	btr r12,1
	jmp LB_1548
LB_1547:
	bts r12,1
LB_1548:
	mov r8,r10
	bt r12,4
	jc LB_1549
	btr r12,2
	jmp LB_1550
LB_1549:
	bts r12,2
LB_1550:
	mov r10,r9
	bt r12,3
	jc LB_1551
	btr r12,4
	jmp LB_1552
LB_1551:
	bts r12,4
LB_1552:
	mov r9,rcx
	bt r12,6
	jc LB_1553
	btr r12,3
	jmp LB_1554
LB_1553:
	bts r12,3
LB_1554:
	call NS_E_1386
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1555
	btr r12,3
	jmp LB_1556
LB_1555:
	bts r12,3
LB_1556:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1545
	btr r12,2
	jmp LB_1546
LB_1545:
	bts r12,2
LB_1546:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1543
	btr r12,1
	jmp LB_1544
LB_1543:
	bts r12,1
LB_1544:
	add rsp,24
; _some %_1486 ⊢ %_1487 : %_1487
 ; {>  %_1485~0':_stg %_1486~3':_stg %_1475~1':_r64 %_1481~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_1485 %_1487 }
 ; {>  %_1485~0':_stg %_1487~°0◂3':(_opn)◂(_stg) %_1475~1':_r64 %_1481~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_1557
	mov rdi,r14
	call dlt
LB_1557:
	bt r12,2
	jc LB_1558
	mov rdi,r8
	call dlt
LB_1558:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1561
	btr r12,1
	jmp LB_1562
LB_1561:
	bts r12,1
LB_1562:
	mov rsi,1
	bt r12,1
	jc LB_1559
	mov rsi,0
	bt r14,0
	jc LB_1559
	jmp LB_1560
LB_1559:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1560:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1497:
	mov r15,0
LB_1564:
	cmp r15,0
	jz LB_1565
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1564
LB_1565:
; _none {  } ⊢ %_1488 : %_1488
 ; {>  %_1474~0':_stg %_1476~2':(_opn)◂({ _r64 (_lst)◂(_p761) }) %_1475~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1474 %_1488 }
 ; {>  %_1488~°1◂{  }:(_opn)◂(t589'(0)) %_1474~0':_stg %_1476~2':(_opn)◂({ _r64 (_lst)◂(_p761) }) %_1475~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_1566
	mov rdi,r8
	call dlt
LB_1566:
	bt r12,1
	jc LB_1567
	mov rdi,r14
	call dlt
LB_1567:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_1568
	mov rsi,0
	bt r14,0
	jc LB_1568
	jmp LB_1569
LB_1568:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1569:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1563:
NS_E_1575:
NS_E_RDI_1575:
; » _^ ..
	mov rax,70
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "## FEFEF \n"
	mov rsi,0x_46_45_46_45_46_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "HELLO \n"
	mov rsi,0x_48
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "fdEF \n"
	mov rsi,0x_66
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_64
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_46
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "F fe \n"
	mov rsi,0x_46
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_65
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\] \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "\\]\n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "WORlD \n"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_6c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_67_75_75_68_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_09_09_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; _f1489 %_1570 ⊢ { %_1571 %_1572 } : { %_1571 %_1572 }
 ; {>  %_1570~0':_stg }
; _f1489 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1489
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_1571 %_1572 } ⊢ { %_1573 %_1574 } : { %_1573 %_1574 }
 ; {>  %_1571~0':_stg %_1572~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1576
	btr r12,2
	jmp LB_1577
LB_1576:
	bts r12,2
LB_1577:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1580
	btr r12,3
	jmp LB_1581
LB_1580:
	bts r12,3
LB_1581:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1578
	btr QWORD [rdi],0
	jmp LB_1579
LB_1578:
	bts QWORD [rdi],0
LB_1579:
	mov r9,r14
	bt r12,1
	jc LB_1584
	btr r12,3
	jmp LB_1585
LB_1584:
	bts r12,3
LB_1585:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1582
	btr QWORD [rdi],1
	jmp LB_1583
LB_1582:
	bts QWORD [rdi],1
LB_1583:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1586
	btr r12,2
	jmp LB_1587
LB_1586:
	bts r12,2
LB_1587:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1590
	btr r12,3
	jmp LB_1591
LB_1590:
	bts r12,3
LB_1591:
	mov r13,r9
	bt r12,3
	jc LB_1588
	btr r12,0
	jmp LB_1589
LB_1588:
	bts r12,0
LB_1589:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1594
	btr r12,3
	jmp LB_1595
LB_1594:
	bts r12,3
LB_1595:
	mov r14,r9
	bt r12,3
	jc LB_1592
	btr r12,1
	jmp LB_1593
LB_1592:
	bts r12,1
LB_1593:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1574~1':(_opn)◂(_stg) %_1573~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_1596
	mov rdi,r14
	call dlt
LB_1596:
	bt r12,0
	jc LB_1597
	mov rdi,r13
	call dlt
LB_1597:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1599:
NS_E_RDI_1599:
NS_E_1599_ETR_TBL:
NS_E_1599_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_1616
LB_1615:
	add r14,1
LB_1616:
	cmp r14,r10
	jge LB_1617
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1615
	cmp al,10
	jz LB_1615
	cmp al,32
	jz LB_1615
LB_1617:
	push r10
	call NS_E_620_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1618
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1602
LB_1618:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_1621
LB_1620:
	add r14,1
LB_1621:
	cmp r14,r10
	jge LB_1622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1620
	cmp al,10
	jz LB_1620
	cmp al,32
	jz LB_1620
LB_1622:
	add r14,1
	cmp r14,r10
	jg LB_1626
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1626
	jmp LB_1627
LB_1626:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1624
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1624:
	jmp LB_1602
LB_1627:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_1629
LB_1628:
	add r14,1
LB_1629:
	cmp r14,r10
	jge LB_1630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1628
	cmp al,10
	jz LB_1628
	cmp al,32
	jz LB_1628
LB_1630:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1631
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1632
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1632:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1633:
	jmp LB_1602
LB_1631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1611
	btr QWORD [rdi],2
LB_1611:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1612
	btr QWORD [rdi],1
LB_1612:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1613
	btr QWORD [rdi],0
LB_1613:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1602:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_1607
LB_1606:
	add r14,1
LB_1607:
	cmp r14,r10
	jge LB_1608
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1606
	cmp al,32
	jz LB_1606
LB_1608:
	push r10
	call NS_E_620_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1609
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1603
LB_1609:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1604
	btr QWORD [rdi],0
LB_1604:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1603:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1636:
NS_E_RDI_1636:
NS_E_1636_ETR_TBL:
NS_E_1636_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_52_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1663
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1640
LB_1663:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1671
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1671
	jmp LB_1672
LB_1671:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1669
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1669:
	jmp LB_1640
LB_1672:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1657
	btr QWORD [rdi],1
LB_1657:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1658
	btr QWORD [rdi],0
LB_1658:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1640:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1655
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1641
LB_1655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1650
	btr QWORD [rdi],0
LB_1650:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1641:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1648
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1642
LB_1648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1643
	btr QWORD [rdi],0
LB_1643:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1642:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1674:
NS_E_RDI_1674:
NS_E_1674_ETR_TBL:
NS_E_1674_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_1681
LB_1680:
	add r14,1
LB_1681:
	cmp r14,r10
	jge LB_1682
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1680
	cmp al,32
	jz LB_1680
LB_1682:
	add r14,1
	cmp r14,r10
	jg LB_1685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1685
	jmp LB_1686
LB_1685:
	jmp LB_1676
LB_1686:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_1691:
	jmp LB_1688
LB_1687:
	add r14,1
LB_1688:
	cmp r14,r10
	jge LB_1689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1687
	cmp al,32
	jz LB_1687
LB_1689:
	add r14,1
	cmp r14,r10
	jg LB_1690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1690
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_1691
LB_1690:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1677
	btr QWORD [rdi],1
LB_1677:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1678
	btr QWORD [rdi],0
LB_1678:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1676:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1693:
NS_E_RDI_1693:
NS_E_1693_ETR_TBL:
NS_E_1693_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_1884:
	jmp LB_1881
LB_1880:
	add r14,1
LB_1881:
	cmp r14,r10
	jge LB_1882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1880
	cmp al,10
	jz LB_1880
	cmp al,32
	jz LB_1880
LB_1882:
	push r10
	push rsi
	call NS_E_1695_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_1883
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_1885
	bts QWORD [rax],0
LB_1885:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_1884
LB_1883:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1878
	btr QWORD [rdi],0
LB_1878:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1877:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1695:
NS_E_RDI_1695:
NS_E_1695_ETR_TBL:
NS_E_1695_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_2195
LB_2194:
	add r14,1
LB_2195:
	cmp r14,r10
	jge LB_2196
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2194
	cmp al,10
	jz LB_2194
	cmp al,32
	jz LB_2194
LB_2196:
	add r14,7
	cmp r14,r10
	jg LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_2199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_2199
	jmp LB_2200
LB_2199:
	jmp LB_1886
LB_2200:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_2183
LB_2182:
	add r14,1
LB_2183:
	cmp r14,r10
	jge LB_2184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2182
	cmp al,10
	jz LB_2182
	cmp al,32
	jz LB_2182
LB_2184:
	push r10
	call NS_E_1747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2185
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2186:
	jmp LB_1887
LB_2185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2192:
	jmp LB_2189
LB_2188:
	add r14,1
LB_2189:
	cmp r14,r10
	jge LB_2190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2188
	cmp al,10
	jz LB_2188
	cmp al,32
	jz LB_2188
LB_2190:
	push r10
	push rsi
	call NS_E_1747_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2191
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2193
	bts QWORD [rax],0
LB_2193:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2192
LB_2191:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2178
	btr QWORD [rdi],2
LB_2178:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2179
	btr QWORD [rdi],1
LB_2179:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2180
	btr QWORD [rdi],0
LB_2180:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1887:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1886:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_2172
LB_2171:
	add r14,1
LB_2172:
	cmp r14,r10
	jge LB_2173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2171
	cmp al,10
	jz LB_2171
	cmp al,32
	jz LB_2171
LB_2173:
	add r14,4
	cmp r14,r10
	jg LB_2176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_2176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_2176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_2176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_2176
	jmp LB_2177
LB_2176:
	jmp LB_1888
LB_2177:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_2166
LB_2165:
	add r14,1
LB_2166:
	cmp r14,r10
	jge LB_2167
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2165
	cmp al,10
	jz LB_2165
	cmp al,32
	jz LB_2165
LB_2167:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2168
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2169
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2169:
	jmp LB_1889
LB_2168:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_1919
LB_1918:
	add r14,1
LB_1919:
	cmp r14,r10
	jge LB_1920
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1918
	cmp al,10
	jz LB_1918
	cmp al,32
	jz LB_1918
LB_1920:
	add r14,1
	cmp r14,r10
	jg LB_1923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1923
	jmp LB_1924
LB_1923:
	jmp LB_1890
LB_1924:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_1913
LB_1912:
	add r14,1
LB_1913:
	cmp r14,r10
	jge LB_1914
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1912
	cmp al,10
	jz LB_1912
	cmp al,32
	jz LB_1912
LB_1914:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1915
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1916:
	jmp LB_1891
LB_1915:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1906
	btr QWORD [rdi],1
LB_1906:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1907
	btr QWORD [rdi],0
LB_1907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1909
	btr QWORD [rdi],1
LB_1909:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1910
	btr QWORD [rdi],0
LB_1910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1891:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1903
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1903:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1904
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1904:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1890:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_1899
LB_1898:
	add r14,1
LB_1899:
	cmp r14,r10
	jge LB_1900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1898
	cmp al,10
	jz LB_1898
	cmp al,32
	jz LB_1898
LB_1900:
	push r10
	call NS_E_1697_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1901
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1892
LB_1901:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1893
	btr QWORD [rdi],0
LB_1893:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1895
	btr QWORD [rdi],1
LB_1895:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1896
	btr QWORD [rdi],0
LB_1896:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1892:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2162
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2162:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2163:
LB_1889:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1888:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_2156
LB_2155:
	add r14,1
LB_2156:
	cmp r14,r10
	jge LB_2157
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2155
	cmp al,10
	jz LB_2155
	cmp al,32
	jz LB_2155
LB_2157:
	add r14,2
	cmp r14,r10
	jg LB_2160
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_2160
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_2160
	jmp LB_2161
LB_2160:
	jmp LB_1925
LB_2161:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_2058
LB_2057:
	add r14,1
LB_2058:
	cmp r14,r10
	jge LB_2059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2057
	cmp al,10
	jz LB_2057
	cmp al,32
	jz LB_2057
LB_2059:
	add r14,1
	cmp r14,r10
	jg LB_2062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_2062
	jmp LB_2063
LB_2062:
	jmp LB_1927
LB_2063:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_2020
LB_2019:
	add r14,1
LB_2020:
	cmp r14,r10
	jge LB_2021
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2019
	cmp al,10
	jz LB_2019
	cmp al,32
	jz LB_2019
LB_2021:
	add r14,1
	cmp r14,r10
	jg LB_2025
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_2025
	jmp LB_2026
LB_2025:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2023
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2023:
	jmp LB_1928
LB_2026:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_2028
LB_2027:
	add r14,1
LB_2028:
	cmp r14,r10
	jge LB_2029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2027
	cmp al,10
	jz LB_2027
	cmp al,32
	jz LB_2027
LB_2029:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2030
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2031
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2031:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2032
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2032:
	jmp LB_1928
LB_2030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_2035
LB_2034:
	add r14,1
LB_2035:
	cmp r14,r10
	jge LB_2036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2034
	cmp al,10
	jz LB_2034
	cmp al,32
	jz LB_2034
LB_2036:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2037
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2038
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2038:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2039
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2039:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2040
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2040:
	jmp LB_1928
LB_2037:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_2043
LB_2042:
	add r14,1
LB_2043:
	cmp r14,r10
	jge LB_2044
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2042
	cmp al,10
	jz LB_2042
	cmp al,32
	jz LB_2042
LB_2044:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2045
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2046
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2046:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2047
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2047:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2048
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2048:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2049
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2049:
	jmp LB_1928
LB_2045:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2055:
	jmp LB_2052
LB_2051:
	add r14,1
LB_2052:
	cmp r14,r10
	jge LB_2053
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2051
	cmp al,10
	jz LB_2051
	cmp al,32
	jz LB_2051
LB_2053:
	push r10
	push rsi
	call NS_E_1699_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2054
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2056
	bts QWORD [rax],0
LB_2056:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2055
LB_2054:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_2010
	btr QWORD [rdi],5
LB_2010:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2011
	btr QWORD [rdi],4
LB_2011:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2012
	btr QWORD [rdi],3
LB_2012:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2013
	btr QWORD [rdi],2
LB_2013:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2014
	btr QWORD [rdi],1
LB_2014:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2015
	btr QWORD [rdi],0
LB_2015:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,104
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2017
	btr QWORD [rdi],0
LB_2017:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1928:
	add rsp,96
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2008
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2008:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1927:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_2004
LB_2003:
	add r14,1
LB_2004:
	cmp r14,r10
	jge LB_2005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2003
	cmp al,10
	jz LB_2003
	cmp al,32
	jz LB_2003
LB_2005:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2006
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1929
LB_2006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_1995
LB_1994:
	add r14,1
LB_1995:
	cmp r14,r10
	jge LB_1996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1994
	cmp al,10
	jz LB_1994
	cmp al,32
	jz LB_1994
LB_1996:
	add r14,1
	cmp r14,r10
	jg LB_1999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1999
	jmp LB_2000
LB_1999:
	jmp LB_1930
LB_2000:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_1989
LB_1988:
	add r14,1
LB_1989:
	cmp r14,r10
	jge LB_1990
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1988
	cmp al,10
	jz LB_1988
	cmp al,32
	jz LB_1988
LB_1990:
	push r10
	call NS_E_1636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1991
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1992
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1992:
	jmp LB_1931
LB_1991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1981
	btr QWORD [rdi],1
LB_1981:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1982
	btr QWORD [rdi],0
LB_1982:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1986
	btr QWORD [rdi],0
LB_1986:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1984
	btr QWORD [rdi],0
LB_1984:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1931:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1979
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1979:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1977:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1930:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_1971
LB_1970:
	add r14,1
LB_1971:
	cmp r14,r10
	jge LB_1972
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1970
	cmp al,10
	jz LB_1970
	cmp al,32
	jz LB_1970
LB_1972:
	add r14,2
	cmp r14,r10
	jg LB_1975
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1975
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1975
	jmp LB_1976
LB_1975:
	jmp LB_1932
LB_1976:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_1965
LB_1964:
	add r14,1
LB_1965:
	cmp r14,r10
	jge LB_1966
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1964
	cmp al,10
	jz LB_1964
	cmp al,32
	jz LB_1964
LB_1966:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1967
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1968:
	jmp LB_1933
LB_1967:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1957
	btr QWORD [rdi],1
LB_1957:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1958
	btr QWORD [rdi],0
LB_1958:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1962
	btr QWORD [rdi],0
LB_1962:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1960
	btr QWORD [rdi],0
LB_1960:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1933:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1955
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1955:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1953
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1953:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1932:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_1943
LB_1942:
	add r14,1
LB_1943:
	cmp r14,r10
	jge LB_1944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1942
	cmp al,10
	jz LB_1942
	cmp al,32
	jz LB_1942
LB_1944:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1934
LB_1945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_1948
LB_1947:
	add r14,1
LB_1948:
	cmp r14,r10
	jge LB_1949
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1947
	cmp al,10
	jz LB_1947
	cmp al,32
	jz LB_1947
LB_1949:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1950
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1951:
	jmp LB_1934
LB_1950:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1935
	btr QWORD [rdi],1
LB_1935:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1936
	btr QWORD [rdi],0
LB_1936:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1940
	btr QWORD [rdi],0
LB_1940:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1938
	btr QWORD [rdi],0
LB_1938:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_1934:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2001
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2001:
LB_1929:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2153
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2153:
LB_1926:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_1925:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_2147
LB_2146:
	add r14,1
LB_2147:
	cmp r14,r10
	jge LB_2148
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2146
	cmp al,10
	jz LB_2146
	cmp al,32
	jz LB_2146
LB_2148:
	add r14,2
	cmp r14,r10
	jg LB_2151
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_2151
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_2151
	jmp LB_2152
LB_2151:
	jmp LB_2064
LB_2152:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_2138
LB_2137:
	add r14,1
LB_2138:
	cmp r14,r10
	jge LB_2139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2137
	cmp al,10
	jz LB_2137
	cmp al,32
	jz LB_2137
LB_2139:
	add r14,1
	cmp r14,r10
	jg LB_2142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_2142
	jmp LB_2143
LB_2142:
	jmp LB_2065
LB_2143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_2117
LB_2116:
	add r14,1
LB_2117:
	cmp r14,r10
	jge LB_2118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2116
	cmp al,10
	jz LB_2116
	cmp al,32
	jz LB_2116
LB_2118:
	add r14,1
	cmp r14,r10
	jg LB_2122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_2122
	jmp LB_2123
LB_2122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2120
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2120:
	jmp LB_2066
LB_2123:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_2125
LB_2124:
	add r14,1
LB_2125:
	cmp r14,r10
	jge LB_2126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2124
	cmp al,10
	jz LB_2124
	cmp al,32
	jz LB_2124
LB_2126:
	push r10
	call NS_E_1733_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2127
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2128
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2128:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2129
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2129:
	jmp LB_2066
LB_2127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ qlq_dt_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2135:
	jmp LB_2132
LB_2131:
	add r14,1
LB_2132:
	cmp r14,r10
	jge LB_2133
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2131
	cmp al,10
	jz LB_2131
	cmp al,32
	jz LB_2131
LB_2133:
	push r10
	push rsi
	call NS_E_1735_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2134
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2136
	bts QWORD [rax],0
LB_2136:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2135
LB_2134:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2109
	btr QWORD [rdi],3
LB_2109:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2110
	btr QWORD [rdi],2
LB_2110:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2111
	btr QWORD [rdi],1
LB_2111:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2112
	btr QWORD [rdi],0
LB_2112:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2114
	btr QWORD [rdi],0
LB_2114:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2066:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2107
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2107:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2065:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_2095
LB_2094:
	add r14,1
LB_2095:
	cmp r14,r10
	jge LB_2096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2094
	cmp al,10
	jz LB_2094
	cmp al,32
	jz LB_2094
LB_2096:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2097
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2067
LB_2097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_2100
LB_2099:
	add r14,1
LB_2100:
	cmp r14,r10
	jge LB_2101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2099
	cmp al,10
	jz LB_2099
	cmp al,32
	jz LB_2099
LB_2101:
	add r14,1
	cmp r14,r10
	jg LB_2105
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_2105
	jmp LB_2106
LB_2105:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2103
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2103:
	jmp LB_2067
LB_2106:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_2088
LB_2087:
	add r14,1
LB_2088:
	cmp r14,r10
	jge LB_2089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2087
	cmp al,10
	jz LB_2087
	cmp al,32
	jz LB_2087
LB_2089:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2090
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2091
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2091:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2092:
	jmp LB_2068
LB_2090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2081
	btr QWORD [rdi],2
LB_2081:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2082
	btr QWORD [rdi],1
LB_2082:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2083
	btr QWORD [rdi],0
LB_2083:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2085
	btr QWORD [rdi],0
LB_2085:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2068:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2079:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2067:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_2075
LB_2074:
	add r14,1
LB_2075:
	cmp r14,r10
	jge LB_2076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2074
	cmp al,10
	jz LB_2074
	cmp al,32
	jz LB_2074
LB_2076:
	push r10
	call NS_E_1733_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2077
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2069
LB_2077:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2070
	btr QWORD [rdi],0
LB_2070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2072
	btr QWORD [rdi],0
LB_2072:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2069:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2144
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2144:
LB_2064:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1697:
NS_E_RDI_1697:
NS_E_1697_ETR_TBL:
NS_E_1697_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_2220
LB_2219:
	add r14,1
LB_2220:
	cmp r14,r10
	jge LB_2221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2219
	cmp al,10
	jz LB_2219
	cmp al,32
	jz LB_2219
LB_2221:
	add r14,6
	cmp r14,r10
	jg LB_2224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_2224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_2224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_2224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_2224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_2224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_2224
	jmp LB_2225
LB_2224:
	jmp LB_2201
LB_2225:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2217
	btr QWORD [rdi],0
LB_2217:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2201:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_2207
LB_2206:
	add r14,1
LB_2207:
	cmp r14,r10
	jge LB_2208
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2206
	cmp al,10
	jz LB_2206
	cmp al,32
	jz LB_2206
LB_2208:
	push r10
	call NS_E_1695_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2209
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2202
LB_2209:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_2212
LB_2211:
	add r14,1
LB_2212:
	cmp r14,r10
	jge LB_2213
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2211
	cmp al,10
	jz LB_2211
	cmp al,32
	jz LB_2211
LB_2213:
	push r10
	call NS_E_1697_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2214
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2215
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2215:
	jmp LB_2202
LB_2214:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2203
	btr QWORD [rdi],1
LB_2203:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2204
	btr QWORD [rdi],0
LB_2204:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2202:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1699:
NS_E_RDI_1699:
NS_E_1699_ETR_TBL:
NS_E_1699_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_2234
LB_2233:
	add r14,1
LB_2234:
	cmp r14,r10
	jge LB_2235
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2233
	cmp al,10
	jz LB_2233
	cmp al,32
	jz LB_2233
LB_2235:
	add r14,1
	cmp r14,r10
	jg LB_2238
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_2238
	jmp LB_2239
LB_2238:
	jmp LB_2226
LB_2239:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_2241
LB_2240:
	add r14,1
LB_2241:
	cmp r14,r10
	jge LB_2242
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2240
	cmp al,10
	jz LB_2240
	cmp al,32
	jz LB_2240
LB_2242:
	add r14,1
	cmp r14,r10
	jg LB_2246
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_2246
	jmp LB_2247
LB_2246:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2244:
	jmp LB_2226
LB_2247:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_2249
LB_2248:
	add r14,1
LB_2249:
	cmp r14,r10
	jge LB_2250
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2248
	cmp al,10
	jz LB_2248
	cmp al,32
	jz LB_2248
LB_2250:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2251
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2252
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2252:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2253:
	jmp LB_2226
LB_2251:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_2256
LB_2255:
	add r14,1
LB_2256:
	cmp r14,r10
	jge LB_2257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2255
	cmp al,10
	jz LB_2255
	cmp al,32
	jz LB_2255
LB_2257:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2258
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2259
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2259:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2260
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2260:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2261
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2261:
	jmp LB_2226
LB_2258:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_2264
LB_2263:
	add r14,1
LB_2264:
	cmp r14,r10
	jge LB_2265
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2263
	cmp al,10
	jz LB_2263
	cmp al,32
	jz LB_2263
LB_2265:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2266
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2267
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2267:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2268
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2268:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2269
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2269:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2270:
	jmp LB_2226
LB_2266:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2227
	btr QWORD [rdi],4
LB_2227:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2228
	btr QWORD [rdi],3
LB_2228:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2229
	btr QWORD [rdi],2
LB_2229:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2230
	btr QWORD [rdi],1
LB_2230:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2231
	btr QWORD [rdi],0
LB_2231:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2226:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1701:
NS_E_RDI_1701:
NS_E_1701_ETR_TBL:
NS_E_1701_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_2278
LB_2277:
	add r14,1
LB_2278:
	cmp r14,r10
	jge LB_2279
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2277
	cmp al,10
	jz LB_2277
	cmp al,32
	jz LB_2277
LB_2279:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2280
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2272
LB_2280:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_2283
LB_2282:
	add r14,1
LB_2283:
	cmp r14,r10
	jge LB_2284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2282
	cmp al,10
	jz LB_2282
	cmp al,32
	jz LB_2282
LB_2284:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2285
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2286
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2286:
	jmp LB_2272
LB_2285:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_2289
LB_2288:
	add r14,1
LB_2289:
	cmp r14,r10
	jge LB_2290
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2288
	cmp al,10
	jz LB_2288
	cmp al,32
	jz LB_2288
LB_2290:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2291
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2292
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2293:
	jmp LB_2272
LB_2291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2273
	btr QWORD [rdi],2
LB_2273:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2274
	btr QWORD [rdi],1
LB_2274:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2275
	btr QWORD [rdi],0
LB_2275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2272:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1703:
NS_E_RDI_1703:
NS_E_1703_ETR_TBL:
NS_E_1703_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_2323
LB_2322:
	add r14,1
LB_2323:
	cmp r14,r10
	jge LB_2324
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2322
	cmp al,10
	jz LB_2322
	cmp al,32
	jz LB_2322
LB_2324:
	add r14,3
	cmp r14,r10
	jg LB_2327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_2327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_2327
	jmp LB_2328
LB_2327:
	jmp LB_2295
LB_2328:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2330
LB_2329:
	add r14,1
LB_2330:
	cmp r14,r10
	jge LB_2331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2329
	cmp al,10
	jz LB_2329
	cmp al,32
	jz LB_2329
LB_2331:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2332
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2333:
	jmp LB_2295
LB_2332:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2319
	btr QWORD [rdi],1
LB_2319:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2320
	btr QWORD [rdi],0
LB_2320:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2295:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_2315
LB_2314:
	add r14,1
LB_2315:
	cmp r14,r10
	jge LB_2316
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2314
	cmp al,10
	jz LB_2314
	cmp al,32
	jz LB_2314
LB_2316:
	push r10
	call NS_E_1717_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2317
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2296
LB_2317:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2312
	btr QWORD [rdi],0
LB_2312:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2296:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_2302
LB_2301:
	add r14,1
LB_2302:
	cmp r14,r10
	jge LB_2303
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2301
	cmp al,10
	jz LB_2301
	cmp al,32
	jz LB_2301
LB_2303:
	push r10
	call NS_E_1705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2304
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2297
LB_2304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_2307
LB_2306:
	add r14,1
LB_2307:
	cmp r14,r10
	jge LB_2308
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2306
	cmp al,10
	jz LB_2306
	cmp al,32
	jz LB_2306
LB_2308:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2309
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2310:
	jmp LB_2297
LB_2309:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2298
	btr QWORD [rdi],1
LB_2298:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2299
	btr QWORD [rdi],0
LB_2299:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2297:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1705:
NS_E_RDI_1705:
NS_E_1705_ETR_TBL:
NS_E_1705_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
	jmp LB_2620
LB_2619:
	add r14,1
LB_2620:
	cmp r14,r10
	jge LB_2621
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2619
	cmp al,10
	jz LB_2619
	cmp al,32
	jz LB_2619
LB_2621:
	add r14,1
	cmp r14,r10
	jg LB_2624
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_2624
	jmp LB_2625
LB_2624:
	jmp LB_2335
LB_2625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2597
LB_2596:
	add r14,1
LB_2597:
	cmp r14,r10
	jge LB_2598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2596
	cmp al,10
	jz LB_2596
	cmp al,32
	jz LB_2596
LB_2598:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2599
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2600:
	jmp LB_2336
LB_2599:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_2603
LB_2602:
	add r14,1
LB_2603:
	cmp r14,r10
	jge LB_2604
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2602
	cmp al,10
	jz LB_2602
	cmp al,32
	jz LB_2602
LB_2604:
	add r14,3
	cmp r14,r10
	jg LB_2609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2609
	jmp LB_2610
LB_2609:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2606
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2606:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2607
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2607:
	jmp LB_2336
LB_2610:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2612
LB_2611:
	add r14,1
LB_2612:
	cmp r14,r10
	jge LB_2613
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2611
	cmp al,10
	jz LB_2611
	cmp al,32
	jz LB_2611
LB_2613:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2614
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2615
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2615:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2616
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2616:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2617
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2617:
	jmp LB_2336
LB_2614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2591
	btr QWORD [rdi],3
LB_2591:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2592
	btr QWORD [rdi],2
LB_2592:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2593
	btr QWORD [rdi],1
LB_2593:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2594
	btr QWORD [rdi],0
LB_2594:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2336:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2335:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_2585
LB_2584:
	add r14,1
LB_2585:
	cmp r14,r10
	jge LB_2586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2584
	cmp al,10
	jz LB_2584
	cmp al,32
	jz LB_2584
LB_2586:
	add r14,3
	cmp r14,r10
	jg LB_2589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_2589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_2589
	jmp LB_2590
LB_2589:
	jmp LB_2337
LB_2590:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2562
LB_2561:
	add r14,1
LB_2562:
	cmp r14,r10
	jge LB_2563
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2561
	cmp al,10
	jz LB_2561
	cmp al,32
	jz LB_2561
LB_2563:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2564
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2565:
	jmp LB_2338
LB_2564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_2568
LB_2567:
	add r14,1
LB_2568:
	cmp r14,r10
	jge LB_2569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2567
	cmp al,10
	jz LB_2567
	cmp al,32
	jz LB_2567
LB_2569:
	add r14,3
	cmp r14,r10
	jg LB_2574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2574
	jmp LB_2575
LB_2574:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2571
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2571:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2572
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2572:
	jmp LB_2338
LB_2575:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2577
LB_2576:
	add r14,1
LB_2577:
	cmp r14,r10
	jge LB_2578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2576
	cmp al,10
	jz LB_2576
	cmp al,32
	jz LB_2576
LB_2578:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2579
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2580
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2580:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2581
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2581:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2582:
	jmp LB_2338
LB_2579:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2556
	btr QWORD [rdi],3
LB_2556:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2557
	btr QWORD [rdi],2
LB_2557:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2558
	btr QWORD [rdi],1
LB_2558:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2559
	btr QWORD [rdi],0
LB_2559:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2338:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2337:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_2550
LB_2549:
	add r14,1
LB_2550:
	cmp r14,r10
	jge LB_2551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2549
	cmp al,10
	jz LB_2549
	cmp al,32
	jz LB_2549
LB_2551:
	add r14,2
	cmp r14,r10
	jg LB_2554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_2554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_2554
	jmp LB_2555
LB_2554:
	jmp LB_2339
LB_2555:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_^"
	jmp LB_2507
LB_2506:
	add r14,1
LB_2507:
	cmp r14,r10
	jge LB_2508
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2506
	cmp al,10
	jz LB_2506
	cmp al,32
	jz LB_2506
LB_2508:
	add r14,2
	cmp r14,r10
	jg LB_2511
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_2511
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_2511
	jmp LB_2512
LB_2511:
	jmp LB_2341
LB_2512:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "_"
	jmp LB_2458
LB_2457:
	add r14,1
LB_2458:
	cmp r14,r10
	jge LB_2459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2457
	cmp al,10
	jz LB_2457
	cmp al,32
	jz LB_2457
LB_2459:
	add r14,1
	cmp r14,r10
	jg LB_2462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2462
	jmp LB_2463
LB_2462:
	jmp LB_2343
LB_2463:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_2426
LB_2425:
	add r14,1
LB_2426:
	cmp r14,r10
	jge LB_2427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2425
	cmp al,10
	jz LB_2425
	cmp al,32
	jz LB_2425
LB_2427:
	add r14,3
	cmp r14,r10
	jg LB_2431
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2431
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2431
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2431
	jmp LB_2432
LB_2431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2429:
	jmp LB_2344
LB_2432:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_2434
LB_2433:
	add r14,1
LB_2434:
	cmp r14,r10
	jge LB_2435
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2433
	cmp al,10
	jz LB_2433
	cmp al,32
	jz LB_2433
LB_2435:
	push r10
	call NS_E_1731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2436
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2437
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2437:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2438:
	jmp LB_2344
LB_2436:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2444:
	jmp LB_2441
LB_2440:
	add r14,1
LB_2441:
	cmp r14,r10
	jge LB_2442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2440
	cmp al,10
	jz LB_2440
	cmp al,32
	jz LB_2440
LB_2442:
	push r10
	push rsi
	call NS_E_1707_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2443
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2445
	bts QWORD [rax],0
LB_2445:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2444
LB_2443:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_2447
LB_2446:
	add r14,1
LB_2447:
	cmp r14,r10
	jge LB_2448
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2446
	cmp al,10
	jz LB_2446
	cmp al,32
	jz LB_2446
LB_2448:
	add r14,2
	cmp r14,r10
	jg LB_2455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_2455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_2455
	jmp LB_2456
LB_2455:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2450
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2450:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2451
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2451:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2452
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2452:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2453
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2453:
	jmp LB_2344
LB_2456:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2415
	btr QWORD [rdi],4
LB_2415:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2416
	btr QWORD [rdi],3
LB_2416:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2417
	btr QWORD [rdi],2
LB_2417:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2418
	btr QWORD [rdi],1
LB_2418:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2419
	btr QWORD [rdi],0
LB_2419:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2423
	btr QWORD [rdi],0
LB_2423:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2421
	btr QWORD [rdi],0
LB_2421:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2344:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2413:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2411
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2411:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2343:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_2359
LB_2358:
	add r14,1
LB_2359:
	cmp r14,r10
	jge LB_2360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2358
	cmp al,10
	jz LB_2358
	cmp al,32
	jz LB_2358
LB_2360:
	push r10
	call NS_E_1731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2361
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2345
LB_2361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2367:
	jmp LB_2364
LB_2363:
	add r14,1
LB_2364:
	cmp r14,r10
	jge LB_2365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2363
	cmp al,10
	jz LB_2363
	cmp al,32
	jz LB_2363
LB_2365:
	push r10
	push rsi
	call NS_E_1715_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2366
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2368
	bts QWORD [rax],0
LB_2368:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2367
LB_2366:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_2370
LB_2369:
	add r14,1
LB_2370:
	cmp r14,r10
	jge LB_2371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2369
	cmp al,10
	jz LB_2369
	cmp al,32
	jz LB_2369
LB_2371:
	add r14,3
	cmp r14,r10
	jg LB_2376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2376
	jmp LB_2377
LB_2376:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2373
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2373:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2374
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2374:
	jmp LB_2345
LB_2377:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_2379
LB_2378:
	add r14,1
LB_2379:
	cmp r14,r10
	jge LB_2380
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2378
	cmp al,10
	jz LB_2378
	cmp al,32
	jz LB_2378
LB_2380:
	push r10
	call NS_E_1731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2381
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2382
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2382:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2383
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2383:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2384
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2384:
	jmp LB_2345
LB_2381:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2390:
	jmp LB_2387
LB_2386:
	add r14,1
LB_2387:
	cmp r14,r10
	jge LB_2388
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2386
	cmp al,10
	jz LB_2386
	cmp al,32
	jz LB_2386
LB_2388:
	push r10
	push rsi
	call NS_E_1715_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2389
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2391
	bts QWORD [rax],0
LB_2391:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2390
LB_2389:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rsi
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2396:
	jmp LB_2393
LB_2392:
	add r14,1
LB_2393:
	cmp r14,r10
	jge LB_2394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2392
	cmp al,10
	jz LB_2392
	cmp al,32
	jz LB_2392
LB_2394:
	push r10
	push rsi
	call NS_E_1707_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2395
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2397
	bts QWORD [rax],0
LB_2397:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2396
LB_2395:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_2399
LB_2398:
	add r14,1
LB_2399:
	cmp r14,r10
	jge LB_2400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2398
	cmp al,10
	jz LB_2398
	cmp al,32
	jz LB_2398
LB_2400:
	add r14,2
	cmp r14,r10
	jg LB_2409
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_2409
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_2409
	jmp LB_2410
LB_2409:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_2402
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_2402:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_2403
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_2403:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2404
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2404:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2405
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2405:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2406
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2406:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2407
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2407:
	jmp LB_2345
LB_2410:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*6],0
	mov QWORD [rsp+8*1+16*6],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0007_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_2346
	btr QWORD [rdi],6
LB_2346:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_2347
	btr QWORD [rdi],5
LB_2347:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2348
	btr QWORD [rdi],4
LB_2348:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2349
	btr QWORD [rdi],3
LB_2349:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2350
	btr QWORD [rdi],2
LB_2350:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2351
	btr QWORD [rdi],1
LB_2351:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2352
	btr QWORD [rdi],0
LB_2352:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,120
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2356
	btr QWORD [rdi],0
LB_2356:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2354
	btr QWORD [rdi],0
LB_2354:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2345:
	add rsp,112
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2504
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2504:
LB_2342:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2502:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2341:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_2473
LB_2472:
	add r14,1
LB_2473:
	cmp r14,r10
	jge LB_2474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2472
	cmp al,10
	jz LB_2472
	cmp al,32
	jz LB_2472
LB_2474:
	push r10
	call NS_E_1636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2475
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2464
LB_2475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_2478
LB_2477:
	add r14,1
LB_2478:
	cmp r14,r10
	jge LB_2479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2477
	cmp al,10
	jz LB_2477
	cmp al,32
	jz LB_2477
LB_2479:
	add r14,1
	cmp r14,r10
	jg LB_2483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2483
	jmp LB_2484
LB_2483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2481:
	jmp LB_2464
LB_2484:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_2486
LB_2485:
	add r14,1
LB_2486:
	cmp r14,r10
	jge LB_2487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2485
	cmp al,10
	jz LB_2485
	cmp al,32
	jz LB_2485
LB_2487:
	add r14,3
	cmp r14,r10
	jg LB_2492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2492
	jmp LB_2493
LB_2492:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2489
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2489:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2490:
	jmp LB_2464
LB_2493:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2495
LB_2494:
	add r14,1
LB_2495:
	cmp r14,r10
	jge LB_2496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2494
	cmp al,10
	jz LB_2494
	cmp al,32
	jz LB_2494
LB_2496:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2497
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2498
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2498:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2499
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2499:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2500
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2500:
	jmp LB_2464
LB_2497:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2465
	btr QWORD [rdi],3
LB_2465:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2466
	btr QWORD [rdi],2
LB_2466:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2467
	btr QWORD [rdi],1
LB_2467:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2468
	btr QWORD [rdi],0
LB_2468:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2470
	btr QWORD [rdi],0
LB_2470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2464:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2547
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2547:
LB_2340:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2339:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_2520
LB_2519:
	add r14,1
LB_2520:
	cmp r14,r10
	jge LB_2521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2519
	cmp al,10
	jz LB_2519
	cmp al,32
	jz LB_2519
LB_2521:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2522
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2513
LB_2522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_2525
LB_2524:
	add r14,1
LB_2525:
	cmp r14,r10
	jge LB_2526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2524
	cmp al,10
	jz LB_2524
	cmp al,32
	jz LB_2524
LB_2526:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2527
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2528
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2528:
	jmp LB_2513
LB_2527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_2531
LB_2530:
	add r14,1
LB_2531:
	cmp r14,r10
	jge LB_2532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2530
	cmp al,10
	jz LB_2530
	cmp al,32
	jz LB_2530
LB_2532:
	add r14,3
	cmp r14,r10
	jg LB_2537
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2537
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2537
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2537
	jmp LB_2538
LB_2537:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2534
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2534:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2535
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2535:
	jmp LB_2513
LB_2538:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2540
LB_2539:
	add r14,1
LB_2540:
	cmp r14,r10
	jge LB_2541
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2539
	cmp al,10
	jz LB_2539
	cmp al,32
	jz LB_2539
LB_2541:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2542
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2543
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2543:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2544
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2544:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2545
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2545:
	jmp LB_2513
LB_2542:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2514
	btr QWORD [rdi],3
LB_2514:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2515
	btr QWORD [rdi],2
LB_2515:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2516
	btr QWORD [rdi],1
LB_2516:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2517
	btr QWORD [rdi],0
LB_2517:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2513:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1707:
NS_E_RDI_1707:
NS_E_1707_ETR_TBL:
NS_E_1707_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_2654
LB_2653:
	add r14,1
LB_2654:
	cmp r14,r10
	jge LB_2655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2653
	cmp al,10
	jz LB_2653
	cmp al,32
	jz LB_2653
LB_2655:
	push r10
	call NS_E_1711_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2656
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2626
LB_2656:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2651
	btr QWORD [rdi],0
LB_2651:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2626:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_2647
LB_2646:
	add r14,1
LB_2647:
	cmp r14,r10
	jge LB_2648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2646
	cmp al,10
	jz LB_2646
	cmp al,32
	jz LB_2646
LB_2648:
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2649
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2627
LB_2649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2644
	btr QWORD [rdi],0
LB_2644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2627:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_2640
LB_2639:
	add r14,1
LB_2640:
	cmp r14,r10
	jge LB_2641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2639
	cmp al,10
	jz LB_2639
	cmp al,32
	jz LB_2639
LB_2641:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2628
LB_2642:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2637
	btr QWORD [rdi],0
LB_2637:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2628:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_2633
LB_2632:
	add r14,1
LB_2633:
	cmp r14,r10
	jge LB_2634
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2632
	cmp al,10
	jz LB_2632
	cmp al,32
	jz LB_2632
LB_2634:
	push r10
	call NS_E_1709_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2635
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2629
LB_2635:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2630
	btr QWORD [rdi],0
LB_2630:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2629:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1709:
NS_E_RDI_1709:
NS_E_1709_ETR_TBL:
NS_E_1709_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_52_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2699
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2658
LB_2699:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_2707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_2707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_2707
	jmp LB_2708
LB_2707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2705:
	jmp LB_2658
LB_2708:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2693
	btr QWORD [rdi],1
LB_2693:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2694
	btr QWORD [rdi],0
LB_2694:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2658:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_52_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2683
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2659
LB_2683:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_2691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_2691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_2691
	jmp LB_2692
LB_2691:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2689
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2689:
	jmp LB_2659
LB_2692:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2677
	btr QWORD [rdi],1
LB_2677:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2678
	btr QWORD [rdi],0
LB_2678:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2659:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_52_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2667
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2660
LB_2667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_2675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_2675
	jmp LB_2676
LB_2675:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2673
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2673:
	jmp LB_2660
LB_2676:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2661
	btr QWORD [rdi],1
LB_2661:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2662
	btr QWORD [rdi],0
LB_2662:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2660:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1711:
NS_E_RDI_1711:
NS_E_1711_ETR_TBL:
NS_E_1711_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_2718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_2718
	jmp LB_2719
LB_2718:
	jmp LB_2709
LB_2719:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_1713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2723
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2724
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2724:
	jmp LB_2709
LB_2723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2710
	btr QWORD [rdi],1
LB_2710:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2711
	btr QWORD [rdi],0
LB_2711:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2709:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1713:
NS_E_RDI_1713:
NS_E_1713_ETR_TBL:
NS_E_1713_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_2749
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2749
	jmp LB_2750
LB_2749:
	jmp LB_2726
LB_2750:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2742
	btr QWORD [rdi],0
LB_2742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2726:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2734
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2727
LB_2734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_1713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2739
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2740:
	jmp LB_2727
LB_2739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2728
	btr QWORD [rdi],1
LB_2728:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2729
	btr QWORD [rdi],0
LB_2729:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2727:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1715:
NS_E_RDI_1715:
NS_E_1715_ETR_TBL:
NS_E_1715_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_2760
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_2760
	jmp LB_2761
LB_2760:
	jmp LB_2751
LB_2761:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_1731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2765
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2766
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2766:
	jmp LB_2751
LB_2765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2752
	btr QWORD [rdi],1
LB_2752:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2753
	btr QWORD [rdi],0
LB_2753:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2751:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1717:
NS_E_RDI_1717:
NS_E_1717_ETR_TBL:
NS_E_1717_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_2841
LB_2840:
	add r14,1
LB_2841:
	cmp r14,r10
	jge LB_2842
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2840
	cmp al,10
	jz LB_2840
	cmp al,32
	jz LB_2840
LB_2842:
	add r14,4
	cmp r14,r10
	jg LB_2845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_2845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_2845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_2845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_2845
	jmp LB_2846
LB_2845:
	jmp LB_2768
LB_2846:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_2820
LB_2819:
	add r14,1
LB_2820:
	cmp r14,r10
	jge LB_2821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2819
	cmp al,10
	jz LB_2819
	cmp al,32
	jz LB_2819
LB_2821:
	push r10
	call NS_E_1721_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2822
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2823:
	jmp LB_2769
LB_2822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_2826
LB_2825:
	add r14,1
LB_2826:
	cmp r14,r10
	jge LB_2827
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2825
	cmp al,10
	jz LB_2825
	cmp al,32
	jz LB_2825
LB_2827:
	push r10
	call NS_E_1719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2828
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2829
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2829:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2830
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2830:
	jmp LB_2769
LB_2828:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_2833
LB_2832:
	add r14,1
LB_2833:
	cmp r14,r10
	jge LB_2834
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2832
	cmp al,10
	jz LB_2832
	cmp al,32
	jz LB_2832
LB_2834:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2835
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2836
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2836:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2837
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2837:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2838
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2838:
	jmp LB_2769
LB_2835:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2814
	btr QWORD [rdi],3
LB_2814:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2815
	btr QWORD [rdi],2
LB_2815:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2816
	btr QWORD [rdi],1
LB_2816:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2817
	btr QWORD [rdi],0
LB_2817:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2769:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2768:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_2778
LB_2777:
	add r14,1
LB_2778:
	cmp r14,r10
	jge LB_2779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2777
	cmp al,10
	jz LB_2777
	cmp al,32
	jz LB_2777
LB_2779:
	add r14,3
	cmp r14,r10
	jg LB_2782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_2782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_2782
	jmp LB_2783
LB_2782:
	jmp LB_2770
LB_2783:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_2785
LB_2784:
	add r14,1
LB_2785:
	cmp r14,r10
	jge LB_2786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2784
	cmp al,10
	jz LB_2784
	cmp al,32
	jz LB_2784
LB_2786:
	push r10
	call NS_E_1721_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2788
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2788:
	jmp LB_2770
LB_2787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_2791
LB_2790:
	add r14,1
LB_2791:
	cmp r14,r10
	jge LB_2792
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2790
	cmp al,10
	jz LB_2790
	cmp al,32
	jz LB_2790
LB_2792:
	push r10
	call NS_E_1719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2793
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2794
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2794:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2795
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2795:
	jmp LB_2770
LB_2793:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_2798
LB_2797:
	add r14,1
LB_2798:
	cmp r14,r10
	jge LB_2799
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2797
	cmp al,10
	jz LB_2797
	cmp al,32
	jz LB_2797
LB_2799:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2800
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2801
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2801:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2802
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2802:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2803
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2803:
	jmp LB_2770
LB_2800:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_2806
LB_2805:
	add r14,1
LB_2806:
	cmp r14,r10
	jge LB_2807
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2805
	cmp al,10
	jz LB_2805
	cmp al,32
	jz LB_2805
LB_2807:
	push r10
	call NS_E_1717_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2808
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2809
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2809:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2810
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2810:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2811
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2811:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2812:
	jmp LB_2770
LB_2808:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2771
	btr QWORD [rdi],4
LB_2771:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2772
	btr QWORD [rdi],3
LB_2772:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2773
	btr QWORD [rdi],2
LB_2773:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2774
	btr QWORD [rdi],1
LB_2774:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2775
	btr QWORD [rdi],0
LB_2775:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2770:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1719:
NS_E_RDI_1719:
NS_E_1719_ETR_TBL:
NS_E_1719_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_2852
LB_2851:
	add r14,1
LB_2852:
	cmp r14,r10
	jge LB_2853
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2851
	cmp al,32
	jz LB_2851
LB_2853:
	add r14,1
	cmp r14,r10
	jg LB_2856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_2856
	jmp LB_2857
LB_2856:
	jmp LB_2847
LB_2857:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_2859
LB_2858:
	add r14,1
LB_2859:
	cmp r14,r10
	jge LB_2860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2858
	cmp al,32
	jz LB_2858
LB_2860:
	add r14,1
	cmp r14,r10
	jg LB_2864
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2864
	jmp LB_2865
LB_2864:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2862
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2862:
	jmp LB_2847
LB_2865:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2848
	btr QWORD [rdi],1
LB_2848:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2849
	btr QWORD [rdi],0
LB_2849:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2847:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1721:
NS_E_RDI_1721:
NS_E_1721_ETR_TBL:
NS_E_1721_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_2873
LB_2872:
	add r14,1
LB_2873:
	cmp r14,r10
	jge LB_2874
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2872
	cmp al,10
	jz LB_2872
	cmp al,32
	jz LB_2872
LB_2874:
	push r10
	call NS_E_1723_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2875
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2866
LB_2875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ mtc_test_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2881:
	jmp LB_2878
LB_2877:
	add r14,1
LB_2878:
	cmp r14,r10
	jge LB_2879
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2877
	cmp al,10
	jz LB_2877
	cmp al,32
	jz LB_2877
LB_2879:
	push r10
	push rsi
	call NS_E_1725_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2880
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2882
	bts QWORD [rax],0
LB_2882:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2881
LB_2880:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2869
	btr QWORD [rdi],1
LB_2869:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2870
	btr QWORD [rdi],0
LB_2870:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2866:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2867:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1723:
NS_E_RDI_1723:
NS_E_1723_ETR_TBL:
NS_E_1723_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_2943
LB_2942:
	add r14,1
LB_2943:
	cmp r14,r10
	jge LB_2944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2942
	cmp al,10
	jz LB_2942
	cmp al,32
	jz LB_2942
LB_2944:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2883
LB_2945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_2948
LB_2947:
	add r14,1
LB_2948:
	cmp r14,r10
	jge LB_2949
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2947
	cmp al,10
	jz LB_2947
	cmp al,32
	jz LB_2947
LB_2949:
	add r14,3
	cmp r14,r10
	jg LB_2953
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2953
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2953
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2953
	jmp LB_2954
LB_2953:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2951:
	jmp LB_2883
LB_2954:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_2917
LB_2916:
	add r14,1
LB_2917:
	cmp r14,r10
	jge LB_2918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2916
	cmp al,10
	jz LB_2916
	cmp al,32
	jz LB_2916
LB_2918:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2919
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2920
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2920:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2921:
	jmp LB_2884
LB_2919:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_2924
LB_2923:
	add r14,1
LB_2924:
	cmp r14,r10
	jge LB_2925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2923
	cmp al,10
	jz LB_2923
	cmp al,32
	jz LB_2923
LB_2925:
	add r14,3
	cmp r14,r10
	jg LB_2931
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2931
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_2931
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_2931
	jmp LB_2932
LB_2931:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2927
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2927:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2928
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2928:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2929
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2929:
	jmp LB_2884
LB_2932:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
	jmp LB_2934
LB_2933:
	add r14,1
LB_2934:
	cmp r14,r10
	jge LB_2935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2933
	cmp al,10
	jz LB_2933
	cmp al,32
	jz LB_2933
LB_2935:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2936
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2937
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2937:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2938
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2938:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2939
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2939:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2940:
	jmp LB_2884
LB_2936:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2910
	btr QWORD [rdi],4
LB_2910:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2911
	btr QWORD [rdi],3
LB_2911:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2912
	btr QWORD [rdi],2
LB_2912:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2913
	btr QWORD [rdi],1
LB_2913:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2914
	btr QWORD [rdi],0
LB_2914:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2884:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_2883:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_2891
LB_2890:
	add r14,1
LB_2891:
	cmp r14,r10
	jge LB_2892
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2890
	cmp al,10
	jz LB_2890
	cmp al,32
	jz LB_2890
LB_2892:
	push r10
	call NS_E_1727_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2893
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2885
LB_2893:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_2896
LB_2895:
	add r14,1
LB_2896:
	cmp r14,r10
	jge LB_2897
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2895
	cmp al,10
	jz LB_2895
	cmp al,32
	jz LB_2895
LB_2897:
	add r14,1
	cmp r14,r10
	jg LB_2901
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_2901
	jmp LB_2902
LB_2901:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2899
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2899:
	jmp LB_2885
LB_2902:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_2904
LB_2903:
	add r14,1
LB_2904:
	cmp r14,r10
	jge LB_2905
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2903
	cmp al,10
	jz LB_2903
	cmp al,32
	jz LB_2903
LB_2905:
	push r10
	call NS_E_1727_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2906
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2907
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2907:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2908
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2908:
	jmp LB_2885
LB_2906:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2886
	btr QWORD [rdi],2
LB_2886:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2887
	btr QWORD [rdi],1
LB_2887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2888
	btr QWORD [rdi],0
LB_2888:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2885:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1725:
NS_E_RDI_1725:
NS_E_1725_ETR_TBL:
NS_E_1725_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_2960
LB_2959:
	add r14,1
LB_2960:
	cmp r14,r10
	jge LB_2961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2959
	cmp al,10
	jz LB_2959
	cmp al,32
	jz LB_2959
LB_2961:
	add r14,1
	cmp r14,r10
	jg LB_2964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_2964
	jmp LB_2965
LB_2964:
	jmp LB_2955
LB_2965:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_2967
LB_2966:
	add r14,1
LB_2967:
	cmp r14,r10
	jge LB_2968
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2966
	cmp al,10
	jz LB_2966
	cmp al,32
	jz LB_2966
LB_2968:
	push r10
	call NS_E_1723_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2969
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2970
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2970:
	jmp LB_2955
LB_2969:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2956
	btr QWORD [rdi],1
LB_2956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2957
	btr QWORD [rdi],0
LB_2957:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2955:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1727:
NS_E_RDI_1727:
NS_E_1727_ETR_TBL:
NS_E_1727_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_2985
LB_2984:
	add r14,1
LB_2985:
	cmp r14,r10
	jge LB_2986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2984
	cmp al,10
	jz LB_2984
	cmp al,32
	jz LB_2984
LB_2986:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2987
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2972
LB_2987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_2990
LB_2989:
	add r14,1
LB_2990:
	cmp r14,r10
	jge LB_2991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2989
	cmp al,10
	jz LB_2989
	cmp al,32
	jz LB_2989
LB_2991:
	add r14,1
	cmp r14,r10
	jg LB_2995
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_2995
	jmp LB_2996
LB_2995:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2993:
	jmp LB_2972
LB_2996:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2981
	btr QWORD [rdi],1
LB_2981:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2982
	btr QWORD [rdi],0
LB_2982:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2972:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_2977
LB_2976:
	add r14,1
LB_2977:
	cmp r14,r10
	jge LB_2978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2976
	cmp al,10
	jz LB_2976
	cmp al,32
	jz LB_2976
LB_2978:
	push r10
	call NS_E_1636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2973
LB_2979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2974
	btr QWORD [rdi],0
LB_2974:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2973:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1729:
NS_E_RDI_1729:
NS_E_1729_ETR_TBL:
NS_E_1729_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_3011
LB_3010:
	add r14,1
LB_3011:
	cmp r14,r10
	jge LB_3012
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3010
	cmp al,10
	jz LB_3010
	cmp al,32
	jz LB_3010
LB_3012:
	add r14,1
	cmp r14,r10
	jg LB_3015
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_3015
	jmp LB_3016
LB_3015:
	jmp LB_2997
LB_3016:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ reg_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_3021:
	jmp LB_3018
LB_3017:
	add r14,1
LB_3018:
	cmp r14,r10
	jge LB_3019
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3017
	cmp al,10
	jz LB_3017
	cmp al,32
	jz LB_3017
LB_3019:
	push r10
	push rsi
	call NS_E_1729_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_3020
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_3022
	bts QWORD [rax],0
LB_3022:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3021
LB_3020:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_3024
LB_3023:
	add r14,1
LB_3024:
	cmp r14,r10
	jge LB_3025
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3023
	cmp al,10
	jz LB_3023
	cmp al,32
	jz LB_3023
LB_3025:
	add r14,1
	cmp r14,r10
	jg LB_3030
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_3030
	jmp LB_3031
LB_3030:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3027
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3027:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3028
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3028:
	jmp LB_2997
LB_3031:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3006
	btr QWORD [rdi],2
LB_3006:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3007
	btr QWORD [rdi],1
LB_3007:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3008
	btr QWORD [rdi],0
LB_3008:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2997:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_3002
LB_3001:
	add r14,1
LB_3002:
	cmp r14,r10
	jge LB_3003
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3001
	cmp al,10
	jz LB_3001
	cmp al,32
	jz LB_3001
LB_3003:
	push r10
	call NS_E_1731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3004
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2998
LB_3004:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2999
	btr QWORD [rdi],0
LB_2999:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_2998:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1731:
NS_E_RDI_1731:
NS_E_1731_ETR_TBL:
NS_E_1731_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_3059
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_3059
	jmp LB_3060
LB_3059:
	jmp LB_3032
LB_3060:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3064
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3065
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3065:
	jmp LB_3032
LB_3064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3051
	btr QWORD [rdi],1
LB_3051:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3052
	btr QWORD [rdi],0
LB_3052:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3032:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3049
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3033
LB_3049:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3044
	btr QWORD [rdi],0
LB_3044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3033:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_3042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_3042
	jmp LB_3043
LB_3042:
	jmp LB_3034
LB_3043:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3035
	btr QWORD [rdi],0
LB_3035:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3034:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1733:
NS_E_RDI_1733:
NS_E_1733_ETR_TBL:
NS_E_1733_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_3073
LB_3072:
	add r14,1
LB_3073:
	cmp r14,r10
	jge LB_3074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3072
	cmp al,10
	jz LB_3072
	cmp al,32
	jz LB_3072
LB_3074:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3075
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3067
LB_3075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_3078
LB_3077:
	add r14,1
LB_3078:
	cmp r14,r10
	jge LB_3079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3077
	cmp al,10
	jz LB_3077
	cmp al,32
	jz LB_3077
LB_3079:
	push r10
	call NS_E_1737_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3080
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3081:
	jmp LB_3067
LB_3080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ dt_etr_coprd ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_3087:
	jmp LB_3084
LB_3083:
	add r14,1
LB_3084:
	cmp r14,r10
	jge LB_3085
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3083
	cmp al,10
	jz LB_3083
	cmp al,32
	jz LB_3083
LB_3085:
	push r10
	push rsi
	call NS_E_1737_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_3086
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_3088
	bts QWORD [rax],0
LB_3088:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3087
LB_3086:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3068
	btr QWORD [rdi],2
LB_3068:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3069
	btr QWORD [rdi],1
LB_3069:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3070
	btr QWORD [rdi],0
LB_3070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3067:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1735:
NS_E_RDI_1735:
NS_E_1735_ETR_TBL:
NS_E_1735_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_3096
LB_3095:
	add r14,1
LB_3096:
	cmp r14,r10
	jge LB_3097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3095
	cmp al,10
	jz LB_3095
	cmp al,32
	jz LB_3095
LB_3097:
	add r14,1
	cmp r14,r10
	jg LB_3100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_3100
	jmp LB_3101
LB_3100:
	jmp LB_3089
LB_3101:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_3103
LB_3102:
	add r14,1
LB_3103:
	cmp r14,r10
	jge LB_3104
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3102
	cmp al,10
	jz LB_3102
	cmp al,32
	jz LB_3102
LB_3104:
	add r14,1
	cmp r14,r10
	jg LB_3108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_3108
	jmp LB_3109
LB_3108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3106
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3106:
	jmp LB_3089
LB_3109:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_3111
LB_3110:
	add r14,1
LB_3111:
	cmp r14,r10
	jge LB_3112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3110
	cmp al,10
	jz LB_3110
	cmp al,32
	jz LB_3110
LB_3112:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3113
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3114
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3114:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3115
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3115:
	jmp LB_3089
LB_3113:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
	jmp LB_3118
LB_3117:
	add r14,1
LB_3118:
	cmp r14,r10
	jge LB_3119
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3117
	cmp al,10
	jz LB_3117
	cmp al,32
	jz LB_3117
LB_3119:
	push r10
	call NS_E_1737_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3120
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3121
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3121:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3122
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3123:
	jmp LB_3089
LB_3120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3090
	btr QWORD [rdi],3
LB_3090:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3091
	btr QWORD [rdi],2
LB_3091:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3092
	btr QWORD [rdi],1
LB_3092:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3093
	btr QWORD [rdi],0
LB_3093:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3089:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1737:
NS_E_RDI_1737:
NS_E_1737_ETR_TBL:
NS_E_1737_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_3132
LB_3131:
	add r14,1
LB_3132:
	cmp r14,r10
	jge LB_3133
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3131
	cmp al,10
	jz LB_3131
	cmp al,32
	jz LB_3131
LB_3133:
	add r14,3
	cmp r14,r10
	jg LB_3136
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3136
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_3136
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_3136
	jmp LB_3137
LB_3136:
	jmp LB_3125
LB_3137:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3139
LB_3138:
	add r14,1
LB_3139:
	cmp r14,r10
	jge LB_3140
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3138
	cmp al,10
	jz LB_3138
	cmp al,32
	jz LB_3138
LB_3140:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3141
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3142:
	jmp LB_3125
LB_3141:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_3145
LB_3144:
	add r14,1
LB_3145:
	cmp r14,r10
	jge LB_3146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3144
	cmp al,10
	jz LB_3144
	cmp al,32
	jz LB_3144
LB_3146:
	add r14,1
	cmp r14,r10
	jg LB_3151
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_3151
	jmp LB_3152
LB_3151:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3148
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3148:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3149
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3149:
	jmp LB_3125
LB_3152:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_3154
LB_3153:
	add r14,1
LB_3154:
	cmp r14,r10
	jge LB_3155
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3153
	cmp al,10
	jz LB_3153
	cmp al,32
	jz LB_3153
LB_3155:
	push r10
	call NS_E_1739_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3156
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3157
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3157:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3158
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3158:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3159
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3159:
	jmp LB_3125
LB_3156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3126
	btr QWORD [rdi],3
LB_3126:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3127
	btr QWORD [rdi],2
LB_3127:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3128
	btr QWORD [rdi],1
LB_3128:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3129
	btr QWORD [rdi],0
LB_3129:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3125:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1739:
NS_E_RDI_1739:
NS_E_1739_ETR_TBL:
NS_E_1739_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
	jmp LB_3198
LB_3197:
	add r14,1
LB_3198:
	cmp r14,r10
	jge LB_3199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3197
	cmp al,10
	jz LB_3197
	cmp al,32
	jz LB_3197
LB_3199:
	add r14,1
	cmp r14,r10
	jg LB_3202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_3202
	jmp LB_3203
LB_3202:
	jmp LB_3161
LB_3203:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_3205
LB_3204:
	add r14,1
LB_3205:
	cmp r14,r10
	jge LB_3206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3204
	cmp al,10
	jz LB_3204
	cmp al,32
	jz LB_3204
LB_3206:
	push r10
	call NS_E_1739_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3207
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3208:
	jmp LB_3161
LB_3207:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_3211
LB_3210:
	add r14,1
LB_3211:
	cmp r14,r10
	jge LB_3212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3210
	cmp al,10
	jz LB_3210
	cmp al,32
	jz LB_3210
LB_3212:
	add r14,1
	cmp r14,r10
	jg LB_3217
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_3217
	jmp LB_3218
LB_3217:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3214
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3214:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3215
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3215:
	jmp LB_3161
LB_3218:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3193
	btr QWORD [rdi],2
LB_3193:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3194
	btr QWORD [rdi],1
LB_3194:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3195
	btr QWORD [rdi],0
LB_3195:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3161:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_3189
LB_3188:
	add r14,1
LB_3189:
	cmp r14,r10
	jge LB_3190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3188
	cmp al,10
	jz LB_3188
	cmp al,32
	jz LB_3188
LB_3190:
	push r10
	call NS_E_1741_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3191
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3162
LB_3191:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_3174
LB_3173:
	add r14,1
LB_3174:
	cmp r14,r10
	jge LB_3175
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3173
	cmp al,10
	jz LB_3173
	cmp al,32
	jz LB_3173
LB_3175:
	add r14,3
	cmp r14,r10
	jg LB_3178
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3178
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_3178
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_3178
	jmp LB_3179
LB_3178:
	jmp LB_3163
LB_3179:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_3181
LB_3180:
	add r14,1
LB_3181:
	cmp r14,r10
	jge LB_3182
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3180
	cmp al,10
	jz LB_3180
	cmp al,32
	jz LB_3180
LB_3182:
	push r10
	call NS_E_1739_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3183
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3184
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3184:
	jmp LB_3163
LB_3183:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3168
	btr QWORD [rdi],1
LB_3168:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3169
	btr QWORD [rdi],0
LB_3169:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3171
	btr QWORD [rdi],0
LB_3171:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3163:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3166
	btr QWORD [rdi],0
LB_3166:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3164:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3186:
LB_3162:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1741:
NS_E_RDI_1741:
NS_E_1741_ETR_TBL:
NS_E_1741_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_3246
LB_3245:
	add r14,1
LB_3246:
	cmp r14,r10
	jge LB_3247
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3245
	cmp al,10
	jz LB_3245
	cmp al,32
	jz LB_3245
LB_3247:
	push r10
	call NS_E_1743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3248
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3219
LB_3248:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_3231
LB_3230:
	add r14,1
LB_3231:
	cmp r14,r10
	jge LB_3232
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3230
	cmp al,10
	jz LB_3230
	cmp al,32
	jz LB_3230
LB_3232:
	add r14,3
	cmp r14,r10
	jg LB_3235
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3235
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_3235
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_3235
	jmp LB_3236
LB_3235:
	jmp LB_3220
LB_3236:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_3238
LB_3237:
	add r14,1
LB_3238:
	cmp r14,r10
	jge LB_3239
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3237
	cmp al,10
	jz LB_3237
	cmp al,32
	jz LB_3237
LB_3239:
	push r10
	call NS_E_1743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3240
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3241
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3241:
	jmp LB_3220
LB_3240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3225
	btr QWORD [rdi],1
LB_3225:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3226
	btr QWORD [rdi],0
LB_3226:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3228
	btr QWORD [rdi],0
LB_3228:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3220:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3223
	btr QWORD [rdi],0
LB_3223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3221:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3243
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3243:
LB_3219:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1743:
NS_E_RDI_1743:
NS_E_1743_ETR_TBL:
NS_E_1743_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_3262
LB_3261:
	add r14,1
LB_3262:
	cmp r14,r10
	jge LB_3263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3261
	cmp al,10
	jz LB_3261
	cmp al,32
	jz LB_3261
LB_3263:
	push r10
	call NS_E_1745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3264
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3250
LB_3264:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3259
	btr QWORD [rdi],0
LB_3259:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3250:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_3255
LB_3254:
	add r14,1
LB_3255:
	cmp r14,r10
	jge LB_3256
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3254
	cmp al,10
	jz LB_3254
	cmp al,32
	jz LB_3254
LB_3256:
	push r10
	call NS_E_620_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3257
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3251
LB_3257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3252
	btr QWORD [rdi],0
LB_3252:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3251:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1745:
NS_E_RDI_1745:
NS_E_1745_ETR_TBL:
NS_E_1745_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3273
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3266
LB_3273:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_3281
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_3281
	jmp LB_3282
LB_3281:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3279
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3279:
	jmp LB_3266
LB_3282:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3267
	btr QWORD [rdi],1
LB_3267:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3268
	btr QWORD [rdi],0
LB_3268:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3266:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1747:
NS_E_RDI_1747:
NS_E_1747_ETR_TBL:
NS_E_1747_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_3313
LB_3312:
	add r14,1
LB_3313:
	cmp r14,r10
	jge LB_3314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3312
	cmp al,10
	jz LB_3312
	cmp al,32
	jz LB_3312
LB_3314:
	add r14,1
	cmp r14,r10
	jg LB_3317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_3317
	jmp LB_3318
LB_3317:
	jmp LB_3283
LB_3318:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_3320
LB_3319:
	add r14,1
LB_3320:
	cmp r14,r10
	jge LB_3321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3319
	cmp al,10
	jz LB_3319
	cmp al,32
	jz LB_3319
LB_3321:
	add r14,1
	cmp r14,r10
	jg LB_3325
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_3325
	jmp LB_3326
LB_3325:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3323
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3323:
	jmp LB_3283
LB_3326:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_3328
LB_3327:
	add r14,1
LB_3328:
	cmp r14,r10
	jge LB_3329
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3327
	cmp al,10
	jz LB_3327
	cmp al,32
	jz LB_3327
LB_3329:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3330
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3331
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3331:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3332:
	jmp LB_3283
LB_3330:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_3304
LB_3303:
	add r14,1
LB_3304:
	cmp r14,r10
	jge LB_3305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3303
	cmp al,10
	jz LB_3303
	cmp al,32
	jz LB_3303
LB_3305:
	push r10
	call NS_E_1749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3306
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3284
LB_3306:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3297
	btr QWORD [rdi],0
LB_3297:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3299
	btr QWORD [rdi],2
LB_3299:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3300
	btr QWORD [rdi],1
LB_3300:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3301
	btr QWORD [rdi],0
LB_3301:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3284:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_3293
LB_3292:
	add r14,1
LB_3293:
	cmp r14,r10
	jge LB_3294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3292
	cmp al,10
	jz LB_3292
	cmp al,32
	jz LB_3292
LB_3294:
	push r10
	call NS_E_1761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3295
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3285
LB_3295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3286
	btr QWORD [rdi],0
LB_3286:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3288
	btr QWORD [rdi],2
LB_3288:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3289
	btr QWORD [rdi],1
LB_3289:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3290
	btr QWORD [rdi],0
LB_3290:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3285:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3308
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3308:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3309
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3309:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3310:
LB_3283:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1749:
NS_E_RDI_1749:
NS_E_1749_ETR_TBL:
NS_E_1749_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_3523
LB_3522:
	add r14,1
LB_3523:
	cmp r14,r10
	jge LB_3524
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3522
	cmp al,10
	jz LB_3522
	cmp al,32
	jz LB_3522
LB_3524:
	push r10
	call NS_E_1759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3525
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3334
LB_3525:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_3528
LB_3527:
	add r14,1
LB_3528:
	cmp r14,r10
	jge LB_3529
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3527
	cmp al,10
	jz LB_3527
	cmp al,32
	jz LB_3527
LB_3529:
	push r10
	call NS_E_1751_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3530
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3531:
	jmp LB_3334
LB_3530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; ";"
	jmp LB_3396
LB_3395:
	add r14,1
LB_3396:
	cmp r14,r10
	jge LB_3397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3395
	cmp al,10
	jz LB_3395
	cmp al,32
	jz LB_3395
LB_3397:
	add r14,1
	cmp r14,r10
	jg LB_3400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_3400
	jmp LB_3401
LB_3400:
	jmp LB_3335
LB_3401:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_3403
LB_3402:
	add r14,1
LB_3403:
	cmp r14,r10
	jge LB_3404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3402
	cmp al,10
	jz LB_3402
	cmp al,32
	jz LB_3402
LB_3404:
	add r14,3
	cmp r14,r10
	jg LB_3408
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3408
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_3408
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_3408
	jmp LB_3409
LB_3408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3406:
	jmp LB_3335
LB_3409:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_3381
LB_3380:
	add r14,1
LB_3381:
	cmp r14,r10
	jge LB_3382
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3380
	cmp al,10
	jz LB_3380
	cmp al,32
	jz LB_3380
LB_3382:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3383
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3384
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3384:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3385
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3385:
	jmp LB_3336
LB_3383:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_3388
LB_3387:
	add r14,1
LB_3388:
	cmp r14,r10
	jge LB_3389
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3387
	cmp al,10
	jz LB_3387
	cmp al,32
	jz LB_3387
LB_3389:
	push r10
	call NS_E_1749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3390
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3391
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3391:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3392
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3392:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3393
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3393:
	jmp LB_3336
LB_3390:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3372
	btr QWORD [rdi],3
LB_3372:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3373
	btr QWORD [rdi],2
LB_3373:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3374
	btr QWORD [rdi],1
LB_3374:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3375
	btr QWORD [rdi],0
LB_3375:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3377
	btr QWORD [rdi],1
LB_3377:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3378
	btr QWORD [rdi],0
LB_3378:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3336:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3369
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3369:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3370
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3370:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3335:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_3363
LB_3362:
	add r14,1
LB_3363:
	cmp r14,r10
	jge LB_3364
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3362
	cmp al,10
	jz LB_3362
	cmp al,32
	jz LB_3362
LB_3364:
	add r14,3
	cmp r14,r10
	jg LB_3367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_3367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_3367
	jmp LB_3368
LB_3367:
	jmp LB_3337
LB_3368:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_3350
LB_3349:
	add r14,1
LB_3350:
	cmp r14,r10
	jge LB_3351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3349
	cmp al,10
	jz LB_3349
	cmp al,32
	jz LB_3349
LB_3351:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3352
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3353
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3353:
	jmp LB_3338
LB_3352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_3356
LB_3355:
	add r14,1
LB_3356:
	cmp r14,r10
	jge LB_3357
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3355
	cmp al,10
	jz LB_3355
	cmp al,32
	jz LB_3355
LB_3357:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3358
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3359
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3359:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3360:
	jmp LB_3338
LB_3358:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3342
	btr QWORD [rdi],2
LB_3342:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3343
	btr QWORD [rdi],1
LB_3343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3344
	btr QWORD [rdi],0
LB_3344:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3346
	btr QWORD [rdi],1
LB_3346:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3347
	btr QWORD [rdi],0
LB_3347:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3338:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3339
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3339:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3340
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3340:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3337:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3519
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3519:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3520
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3520:
LB_3334:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_3509
LB_3508:
	add r14,1
LB_3509:
	cmp r14,r10
	jge LB_3510
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3508
	cmp al,10
	jz LB_3508
	cmp al,32
	jz LB_3508
LB_3510:
	push r10
	call NS_E_1757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3511
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3410
LB_3511:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_3517:
	jmp LB_3514
LB_3513:
	add r14,1
LB_3514:
	cmp r14,r10
	jge LB_3515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3513
	cmp al,10
	jz LB_3513
	cmp al,32
	jz LB_3513
LB_3515:
	push r10
	push rsi
	call NS_E_1755_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_3516
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_3518
	bts QWORD [rax],0
LB_3518:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3517
LB_3516:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_3491
LB_3490:
	add r14,1
LB_3491:
	cmp r14,r10
	jge LB_3492
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3490
	cmp al,10
	jz LB_3490
	cmp al,32
	jz LB_3490
LB_3492:
	add r14,1
	cmp r14,r10
	jg LB_3495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_3495
	jmp LB_3496
LB_3495:
	jmp LB_3411
LB_3496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_3498
LB_3497:
	add r14,1
LB_3498:
	cmp r14,r10
	jge LB_3499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3497
	cmp al,10
	jz LB_3497
	cmp al,32
	jz LB_3497
LB_3499:
	add r14,3
	cmp r14,r10
	jg LB_3503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_3503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_3503
	jmp LB_3504
LB_3503:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3501
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3501:
	jmp LB_3411
LB_3504:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_3467
LB_3466:
	add r14,1
LB_3467:
	cmp r14,r10
	jge LB_3468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3466
	cmp al,10
	jz LB_3466
	cmp al,32
	jz LB_3466
LB_3468:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3469
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3470
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3470:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3471:
	jmp LB_3412
LB_3469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_3474
LB_3473:
	add r14,1
LB_3474:
	cmp r14,r10
	jge LB_3475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3473
	cmp al,10
	jz LB_3473
	cmp al,32
	jz LB_3473
LB_3475:
	push r10
	call NS_E_1749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3476
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3477
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3477:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3478
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3478:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3479
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3479:
	jmp LB_3412
LB_3476:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_3482
LB_3481:
	add r14,1
LB_3482:
	cmp r14,r10
	jge LB_3483
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3481
	cmp al,10
	jz LB_3481
	cmp al,32
	jz LB_3481
LB_3483:
	push r10
	call NS_E_1749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3484
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3485
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3485:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3486
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3486:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3487
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3487:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3488
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3488:
	jmp LB_3412
LB_3484:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3457
	btr QWORD [rdi],4
LB_3457:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3458
	btr QWORD [rdi],3
LB_3458:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3459
	btr QWORD [rdi],2
LB_3459:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3460
	btr QWORD [rdi],1
LB_3460:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3461
	btr QWORD [rdi],0
LB_3461:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3463
	btr QWORD [rdi],1
LB_3463:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3464
	btr QWORD [rdi],0
LB_3464:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3412:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3455:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3411:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_3448
LB_3447:
	add r14,1
LB_3448:
	cmp r14,r10
	jge LB_3449
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3447
	cmp al,10
	jz LB_3447
	cmp al,32
	jz LB_3447
LB_3449:
	add r14,3
	cmp r14,r10
	jg LB_3452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_3452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_3452
	jmp LB_3453
LB_3452:
	jmp LB_3413
LB_3453:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_3427
LB_3426:
	add r14,1
LB_3427:
	cmp r14,r10
	jge LB_3428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3426
	cmp al,10
	jz LB_3426
	cmp al,32
	jz LB_3426
LB_3428:
	push r10
	call NS_E_1729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3429
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3430
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3430:
	jmp LB_3414
LB_3429:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_3433
LB_3432:
	add r14,1
LB_3433:
	cmp r14,r10
	jge LB_3434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3432
	cmp al,10
	jz LB_3432
	cmp al,32
	jz LB_3432
LB_3434:
	push r10
	call NS_E_1703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3435
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3436
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3436:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3437
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3437:
	jmp LB_3414
LB_3435:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_3440
LB_3439:
	add r14,1
LB_3440:
	cmp r14,r10
	jge LB_3441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3439
	cmp al,10
	jz LB_3439
	cmp al,32
	jz LB_3439
LB_3441:
	push r10
	call NS_E_1749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3442
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3443
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3443:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3444
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3444:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3445
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3445:
	jmp LB_3414
LB_3442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3418
	btr QWORD [rdi],3
LB_3418:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3419
	btr QWORD [rdi],2
LB_3419:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3420
	btr QWORD [rdi],1
LB_3420:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3421
	btr QWORD [rdi],0
LB_3421:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3423
	btr QWORD [rdi],1
LB_3423:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3424
	btr QWORD [rdi],0
LB_3424:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3414:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3415
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3416:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3413:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3505
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3505:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3506
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3506:
LB_3410:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1751:
NS_E_RDI_1751:
NS_E_1751_ETR_TBL:
NS_E_1751_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_3562
LB_3561:
	add r14,1
LB_3562:
	cmp r14,r10
	jge LB_3563
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3561
	cmp al,10
	jz LB_3561
	cmp al,32
	jz LB_3561
LB_3563:
	add r14,2
	cmp r14,r10
	jg LB_3566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_3566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_3566
	jmp LB_3567
LB_3566:
	jmp LB_3533
LB_3567:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_3556
LB_3555:
	add r14,1
LB_3556:
	cmp r14,r10
	jge LB_3557
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3555
	cmp al,10
	jz LB_3555
	cmp al,32
	jz LB_3555
LB_3557:
	push r10
	call NS_E_1753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3558
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3559
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3559:
	jmp LB_3534
LB_3558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3552
	btr QWORD [rdi],1
LB_3552:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3553
	btr QWORD [rdi],0
LB_3553:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3534:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3533:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_3542
LB_3541:
	add r14,1
LB_3542:
	cmp r14,r10
	jge LB_3543
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3541
	cmp al,10
	jz LB_3541
	cmp al,32
	jz LB_3541
LB_3543:
	push r10
	call NS_E_1755_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3544
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3535
LB_3544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_3547
LB_3546:
	add r14,1
LB_3547:
	cmp r14,r10
	jge LB_3548
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3546
	cmp al,10
	jz LB_3546
	cmp al,32
	jz LB_3546
LB_3548:
	push r10
	call NS_E_1751_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3549
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3550:
	jmp LB_3535
LB_3549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3538
	btr QWORD [rdi],1
LB_3538:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3539
	btr QWORD [rdi],0
LB_3539:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3535:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3536:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1753:
NS_E_RDI_1753:
NS_E_1753_ETR_TBL:
NS_E_1753_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_3575
LB_3574:
	add r14,1
LB_3575:
	cmp r14,r10
	jge LB_3576
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3574
	cmp al,10
	jz LB_3574
	cmp al,32
	jz LB_3574
LB_3576:
	push r10
	call NS_E_1755_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3577
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3568
LB_3577:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_3580
LB_3579:
	add r14,1
LB_3580:
	cmp r14,r10
	jge LB_3581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3579
	cmp al,10
	jz LB_3579
	cmp al,32
	jz LB_3579
LB_3581:
	push r10
	call NS_E_1753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3583
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3583:
	jmp LB_3568
LB_3582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3571
	btr QWORD [rdi],1
LB_3571:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3572
	btr QWORD [rdi],0
LB_3572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3568:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3569:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1755:
NS_E_RDI_1755:
NS_E_1755_ETR_TBL:
NS_E_1755_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_3607
LB_3606:
	add r14,1
LB_3607:
	cmp r14,r10
	jge LB_3608
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3606
	cmp al,10
	jz LB_3606
	cmp al,32
	jz LB_3606
LB_3608:
	add r14,3
	cmp r14,r10
	jg LB_3611
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3611
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_3611
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_3611
	jmp LB_3612
LB_3611:
	jmp LB_3585
LB_3612:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_3614
LB_3613:
	add r14,1
LB_3614:
	cmp r14,r10
	jge LB_3615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3613
	cmp al,10
	jz LB_3613
	cmp al,32
	jz LB_3613
LB_3615:
	push r10
	call NS_E_1755_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3616
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3617
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3617:
	jmp LB_3585
LB_3616:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_3620
LB_3619:
	add r14,1
LB_3620:
	cmp r14,r10
	jge LB_3621
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3619
	cmp al,10
	jz LB_3619
	cmp al,32
	jz LB_3619
LB_3621:
	add r14,3
	cmp r14,r10
	jg LB_3626
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3626
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_3626
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_3626
	jmp LB_3627
LB_3626:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3623
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3623:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3624
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3624:
	jmp LB_3585
LB_3627:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3602
	btr QWORD [rdi],2
LB_3602:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3603
	btr QWORD [rdi],1
LB_3603:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3604
	btr QWORD [rdi],0
LB_3604:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3585:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_3598
LB_3597:
	add r14,1
LB_3598:
	cmp r14,r10
	jge LB_3599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3597
	cmp al,10
	jz LB_3597
	cmp al,32
	jz LB_3597
LB_3599:
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3600
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3586
LB_3600:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3595
	btr QWORD [rdi],0
LB_3595:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3586:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_3591
LB_3590:
	add r14,1
LB_3591:
	cmp r14,r10
	jge LB_3592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3590
	cmp al,10
	jz LB_3590
	cmp al,32
	jz LB_3590
LB_3592:
	push r10
	call NS_E_1599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3593
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3587
LB_3593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3588
	btr QWORD [rdi],0
LB_3588:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3587:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1757:
NS_E_RDI_1757:
NS_E_1757_ETR_TBL:
NS_E_1757_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_3652
LB_3651:
	add r14,1
LB_3652:
	cmp r14,r10
	jge LB_3653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3651
	cmp al,10
	jz LB_3651
	cmp al,32
	jz LB_3651
LB_3653:
	add r14,4
	cmp r14,r10
	jg LB_3656
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_3656
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_3656
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_3656
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_3656
	jmp LB_3657
LB_3656:
	jmp LB_3628
LB_3657:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3649
	btr QWORD [rdi],0
LB_3649:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3628:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_3643
LB_3642:
	add r14,1
LB_3643:
	cmp r14,r10
	jge LB_3644
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3642
	cmp al,10
	jz LB_3642
	cmp al,32
	jz LB_3642
LB_3644:
	add r14,4
	cmp r14,r10
	jg LB_3647
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_3647
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_3647
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_3647
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_3647
	jmp LB_3648
LB_3647:
	jmp LB_3629
LB_3648:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3640
	btr QWORD [rdi],0
LB_3640:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3629:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_3634
LB_3633:
	add r14,1
LB_3634:
	cmp r14,r10
	jge LB_3635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3633
	cmp al,10
	jz LB_3633
	cmp al,32
	jz LB_3633
LB_3635:
	add r14,3
	cmp r14,r10
	jg LB_3638
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3638
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_3638
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_3638
	jmp LB_3639
LB_3638:
	jmp LB_3630
LB_3639:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3631
	btr QWORD [rdi],0
LB_3631:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3630:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1759:
NS_E_RDI_1759:
NS_E_1759_ETR_TBL:
NS_E_1759_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_3682
LB_3681:
	add r14,1
LB_3682:
	cmp r14,r10
	jge LB_3683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3681
	cmp al,10
	jz LB_3681
	cmp al,32
	jz LB_3681
LB_3683:
	add r14,5
	cmp r14,r10
	jg LB_3686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_3686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_3686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_3686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_3686
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_3686
	jmp LB_3687
LB_3686:
	jmp LB_3658
LB_3687:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3679
	btr QWORD [rdi],0
LB_3679:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3658:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_3673
LB_3672:
	add r14,1
LB_3673:
	cmp r14,r10
	jge LB_3674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3672
	cmp al,10
	jz LB_3672
	cmp al,32
	jz LB_3672
LB_3674:
	add r14,5
	cmp r14,r10
	jg LB_3677
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_3677
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_3677
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_3677
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_3677
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_3677
	jmp LB_3678
LB_3677:
	jmp LB_3659
LB_3678:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3670
	btr QWORD [rdi],0
LB_3670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3659:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_3664
LB_3663:
	add r14,1
LB_3664:
	cmp r14,r10
	jge LB_3665
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3663
	cmp al,10
	jz LB_3663
	cmp al,32
	jz LB_3663
LB_3665:
	add r14,4
	cmp r14,r10
	jg LB_3668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_3668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_3668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_3668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_3668
	jmp LB_3669
LB_3668:
	jmp LB_3660
LB_3669:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3661
	btr QWORD [rdi],0
LB_3661:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3660:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1761:
NS_E_RDI_1761:
NS_E_1761_ETR_TBL:
NS_E_1761_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_3784
LB_3783:
	add r14,1
LB_3784:
	cmp r14,r10
	jge LB_3785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3783
	cmp al,10
	jz LB_3783
	cmp al,32
	jz LB_3783
LB_3785:
	push r10
	call NS_E_1759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3786
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3688
LB_3786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_3789
LB_3788:
	add r14,1
LB_3789:
	cmp r14,r10
	jge LB_3790
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3788
	cmp al,10
	jz LB_3788
	cmp al,32
	jz LB_3788
LB_3790:
	push r10
	call NS_E_1763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3791
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3792
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3792:
	jmp LB_3688
LB_3791:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_3798:
	jmp LB_3795
LB_3794:
	add r14,1
LB_3795:
	cmp r14,r10
	jge LB_3796
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3794
	cmp al,10
	jz LB_3794
	cmp al,32
	jz LB_3794
LB_3796:
	push r10
	push rsi
	call NS_E_1755_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_3797
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_3799
	bts QWORD [rax],0
LB_3799:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3798
LB_3797:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_3704
LB_3703:
	add r14,1
LB_3704:
	cmp r14,r10
	jge LB_3705
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3703
	cmp al,10
	jz LB_3703
	cmp al,32
	jz LB_3703
LB_3705:
	add r14,1
	cmp r14,r10
	jg LB_3708
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_3708
	jmp LB_3709
LB_3708:
	jmp LB_3689
LB_3709:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_3711
LB_3710:
	add r14,1
LB_3711:
	cmp r14,r10
	jge LB_3712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3710
	cmp al,10
	jz LB_3710
	cmp al,32
	jz LB_3710
LB_3712:
	push r10
	call NS_E_1761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3713
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3714
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3714:
	jmp LB_3689
LB_3713:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3696
	btr QWORD [rdi],1
LB_3696:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3697
	btr QWORD [rdi],0
LB_3697:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3699
	btr QWORD [rdi],2
LB_3699:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3700
	btr QWORD [rdi],1
LB_3700:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3701
	btr QWORD [rdi],0
LB_3701:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3689:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3692
	btr QWORD [rdi],2
LB_3692:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3693
	btr QWORD [rdi],1
LB_3693:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3694
	btr QWORD [rdi],0
LB_3694:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3690:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3779
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3779:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3780
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3780:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3781
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3781:
LB_3688:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_3763
LB_3762:
	add r14,1
LB_3763:
	cmp r14,r10
	jge LB_3764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3762
	cmp al,10
	jz LB_3762
	cmp al,32
	jz LB_3762
LB_3764:
	push r10
	call NS_E_1757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3765
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3716
LB_3765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_3768
LB_3767:
	add r14,1
LB_3768:
	cmp r14,r10
	jge LB_3769
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3767
	cmp al,10
	jz LB_3767
	cmp al,32
	jz LB_3767
LB_3769:
	push r10
	call NS_E_1763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3770
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3771
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3771:
	jmp LB_3716
LB_3770:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_3777:
	jmp LB_3774
LB_3773:
	add r14,1
LB_3774:
	cmp r14,r10
	jge LB_3775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3773
	cmp al,10
	jz LB_3773
	cmp al,32
	jz LB_3773
LB_3775:
	push r10
	push rsi
	call NS_E_1755_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_3776
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_3778
	bts QWORD [rax],0
LB_3778:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3777
LB_3776:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_3739
LB_3738:
	add r14,1
LB_3739:
	cmp r14,r10
	jge LB_3740
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3738
	cmp al,10
	jz LB_3738
	cmp al,32
	jz LB_3738
LB_3740:
	add r14,1
	cmp r14,r10
	jg LB_3743
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_3743
	jmp LB_3744
LB_3743:
	jmp LB_3717
LB_3744:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_3746
LB_3745:
	add r14,1
LB_3746:
	cmp r14,r10
	jge LB_3747
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3745
	cmp al,10
	jz LB_3745
	cmp al,32
	jz LB_3745
LB_3747:
	push r10
	call NS_E_1761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3748
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3749
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3749:
	jmp LB_3717
LB_3748:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_3752
LB_3751:
	add r14,1
LB_3752:
	cmp r14,r10
	jge LB_3753
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3751
	cmp al,10
	jz LB_3751
	cmp al,32
	jz LB_3751
LB_3753:
	push r10
	call NS_E_1761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3754
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3755
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3755:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3756
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3756:
	jmp LB_3717
LB_3754:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3730
	btr QWORD [rdi],2
LB_3730:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3731
	btr QWORD [rdi],1
LB_3731:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3732
	btr QWORD [rdi],0
LB_3732:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3734
	btr QWORD [rdi],2
LB_3734:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3735
	btr QWORD [rdi],1
LB_3735:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3736
	btr QWORD [rdi],0
LB_3736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3717:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_3726
LB_3725:
	add r14,1
LB_3726:
	cmp r14,r10
	jge LB_3727
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3725
	cmp al,10
	jz LB_3725
	cmp al,32
	jz LB_3725
LB_3727:
	push r10
	call NS_E_1761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3728
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3718
LB_3728:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3719
	btr QWORD [rdi],0
LB_3719:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3721
	btr QWORD [rdi],2
LB_3721:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3722
	btr QWORD [rdi],1
LB_3722:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3723
	btr QWORD [rdi],0
LB_3723:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3718:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3758
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3758:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3759
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3759:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3760
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3760:
LB_3716:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1763:
NS_E_RDI_1763:
NS_E_1763_ETR_TBL:
NS_E_1763_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_3807
LB_3806:
	add r14,1
LB_3807:
	cmp r14,r10
	jge LB_3808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3806
	cmp al,10
	jz LB_3806
	cmp al,32
	jz LB_3806
LB_3808:
	push r10
	call NS_E_491_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3809
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3800
LB_3809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_3812
LB_3811:
	add r14,1
LB_3812:
	cmp r14,r10
	jge LB_3813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3811
	cmp al,10
	jz LB_3811
	cmp al,32
	jz LB_3811
LB_3813:
	add r14,1
	cmp r14,r10
	jg LB_3817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_3817
	jmp LB_3818
LB_3817:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3815:
	jmp LB_3800
LB_3818:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3803
	btr QWORD [rdi],1
LB_3803:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3804
	btr QWORD [rdi],0
LB_3804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3800:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_3801:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3842:
NS_E_RDI_3842:
; » _^ ..
	mov rax,104
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_3820 : %_3820
 ; {>  %_3819~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_3820
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f1693 { %_3819 %_3820 } ⊢ { %_3821 %_3822 %_3823 } : { %_3821 %_3822 %_3823 }
 ; {>  %_3819~0':_stg %_3820~1':_r64 }
; _f1693 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1693
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_3843
	btr r12,4
	jmp LB_3844
LB_3843:
	bts r12,4
LB_3844:
	mov r8,r9
	bt r12,3
	jc LB_3847
	btr r12,2
	jmp LB_3848
LB_3847:
	bts r12,2
LB_3848:
	mov rsi,1
	bt r12,2
	jc LB_3845
	mov rsi,0
	bt r8,0
	jc LB_3845
	jmp LB_3846
LB_3845:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_3846:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_3821 %_3822 %_3823 } ⊢ { %_3824 %_3825 %_3826 } : { %_3824 %_3825 %_3826 }
 ; {>  %_3822~1':_r64 %_3821~0':_stg %_3823~2':(_opn)◂(_p1692) }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_3849
	btr r12,3
	jmp LB_3850
LB_3849:
	bts r12,3
LB_3850:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_3853
	btr r12,4
	jmp LB_3854
LB_3853:
	bts r12,4
LB_3854:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3851
	btr QWORD [rdi],0
	jmp LB_3852
LB_3851:
	bts QWORD [rdi],0
LB_3852:
	mov r10,r14
	bt r12,1
	jc LB_3857
	btr r12,4
	jmp LB_3858
LB_3857:
	bts r12,4
LB_3858:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3855
	btr QWORD [rdi],1
	jmp LB_3856
LB_3855:
	bts QWORD [rdi],1
LB_3856:
	mov r10,r8
	bt r12,2
	jc LB_3861
	btr r12,4
	jmp LB_3862
LB_3861:
	bts r12,4
LB_3862:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_3859
	btr QWORD [rdi],2
	jmp LB_3860
LB_3859:
	bts QWORD [rdi],2
LB_3860:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_3863
	btr r12,3
	jmp LB_3864
LB_3863:
	bts r12,3
LB_3864:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3867
	btr r12,4
	jmp LB_3868
LB_3867:
	bts r12,4
LB_3868:
	mov r13,r10
	bt r12,4
	jc LB_3865
	btr r12,0
	jmp LB_3866
LB_3865:
	bts r12,0
LB_3866:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3871
	btr r12,4
	jmp LB_3872
LB_3871:
	bts r12,4
LB_3872:
	mov r14,r10
	bt r12,4
	jc LB_3869
	btr r12,1
	jmp LB_3870
LB_3869:
	bts r12,1
LB_3870:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_3875
	btr r12,4
	jmp LB_3876
LB_3875:
	bts r12,4
LB_3876:
	mov r8,r10
	bt r12,4
	jc LB_3873
	btr r12,2
	jmp LB_3874
LB_3873:
	bts r12,2
LB_3874:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "OpADL.mdls" _ ⊢ 3' : %_3827
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,3
; _f20 %_3827 ⊢ { %_3828 %_3829 } : { %_3828 %_3829 }
 ; {>  %_3825~1':_r64 %_3824~0':_stg %_3827~3':_stg %_3826~2':(_opn)◂(_p1692) }
; _f20 3' ⊢ { 3' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3883
	btr r12,0
	jmp LB_3884
LB_3883:
	bts r12,0
LB_3884:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 4' }
	mov r9,r13
	bt r12,0
	jc LB_3885
	btr r12,3
	jmp LB_3886
LB_3885:
	bts r12,3
LB_3886:
	mov r10,r14
	bt r12,1
	jc LB_3887
	btr r12,4
	jmp LB_3888
LB_3887:
	bts r12,4
LB_3888:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3881
	btr r12,2
	jmp LB_3882
LB_3881:
	bts r12,2
LB_3882:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3879
	btr r12,1
	jmp LB_3880
LB_3879:
	bts r12,1
LB_3880:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3877
	btr r12,0
	jmp LB_3878
LB_3877:
	bts r12,0
LB_3878:
	add rsp,32
; _f21 { %_3828 %_3829 } ⊢ { %_3830 %_3831 } : { %_3830 %_3831 }
 ; {>  %_3828~3':_stg %_3829~4':_stg %_3825~1':_r64 %_3824~0':_stg %_3826~2':(_opn)◂(_p1692) }
; _f21 { 3' 4' } ⊢ { 3' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000110.. |},{ 3' 4' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r9
	bt r12,3
	jc LB_3897
	btr r12,1
	jmp LB_3898
LB_3897:
	bts r12,1
LB_3898:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3895
	btr QWORD [rdi],0
	jmp LB_3896
LB_3895:
	bts QWORD [rdi],0
LB_3896:
	mov r14,r10
	bt r12,4
	jc LB_3901
	btr r12,1
	jmp LB_3902
LB_3901:
	bts r12,1
LB_3902:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3899
	btr QWORD [rdi],1
	jmp LB_3900
LB_3899:
	bts QWORD [rdi],1
LB_3900:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 3' 4' }
; 0' ⊢ { 3' 4' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_3905
	btr r12,1
	jmp LB_3906
LB_3905:
	bts r12,1
LB_3906:
	mov r9,r14
	bt r12,1
	jc LB_3903
	btr r12,3
	jmp LB_3904
LB_3903:
	bts r12,3
LB_3904:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_3909
	btr r12,1
	jmp LB_3910
LB_3909:
	bts r12,1
LB_3910:
	mov r10,r14
	bt r12,1
	jc LB_3907
	btr r12,4
	jmp LB_3908
LB_3907:
	bts r12,4
LB_3908:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3893
	btr r12,2
	jmp LB_3894
LB_3893:
	bts r12,2
LB_3894:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3891
	btr r12,1
	jmp LB_3892
LB_3891:
	bts r12,1
LB_3892:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3889
	btr r12,0
	jmp LB_3890
LB_3889:
	bts r12,0
LB_3890:
	add rsp,32
; _f1489 %_3831 ⊢ { %_3832 %_3833 } : { %_3832 %_3833 }
 ; {>  %_3831~4':_stg %_3825~1':_r64 %_3830~3':_stg %_3824~0':_stg %_3826~2':(_opn)◂(_p1692) }
; _f1489 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_3919
	btr r12,0
	jmp LB_3920
LB_3919:
	bts r12,0
LB_3920:
	call NS_E_1489
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_3921
	btr r12,4
	jmp LB_3922
LB_3921:
	bts r12,4
LB_3922:
	mov r11,r14
	bt r12,1
	jc LB_3923
	btr r12,5
	jmp LB_3924
LB_3923:
	bts r12,5
LB_3924:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_3917
	btr r12,3
	jmp LB_3918
LB_3917:
	bts r12,3
LB_3918:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3915
	btr r12,2
	jmp LB_3916
LB_3915:
	bts r12,2
LB_3916:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3913
	btr r12,1
	jmp LB_3914
LB_3913:
	bts r12,1
LB_3914:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3911
	btr r12,0
	jmp LB_3912
LB_3911:
	bts r12,0
LB_3912:
	add rsp,40
MTC_LB_3925:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3926
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_3927
	bt QWORD [rax],0
	jc LB_3928
	btr r12,7
	jmp LB_3929
LB_3928:
	bts r12,7
LB_3929:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3927:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_3930
	btr r12,6
	jmp LB_3931
LB_3930:
	bts r12,6
LB_3931:
LB_3932:
	cmp r15,0
	jz LB_3933
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3932
LB_3933:
; » 0xr0 |~ {  } ⊢ %_3835 : %_3835
 ; {>  %_3832~4':_stg %_3834~6':_stg %_3825~1':_r64 %_3830~3':_stg %_3824~0':_stg %_3826~2':(_opn)◂(_p1692) }
; 	» 0xr0 _ ⊢ 5' : %_3835
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f1693 { %_3834 %_3835 } ⊢ { %_3836 %_3837 %_3838 } : { %_3836 %_3837 %_3838 }
 ; {>  %_3832~4':_stg %_3834~6':_stg %_3825~1':_r64 %_3830~3':_stg %_3824~0':_stg %_3835~5':_r64 %_3826~2':(_opn)◂(_p1692) }
; _f1693 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_3944
	btr r12,0
	jmp LB_3945
LB_3944:
	bts r12,0
LB_3945:
	mov r14,r11
	bt r12,5
	jc LB_3946
	btr r12,1
	jmp LB_3947
LB_3946:
	bts r12,1
LB_3947:
	call NS_E_1693
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_3948
	btr r12,5
	jmp LB_3949
LB_3948:
	bts r12,5
LB_3949:
	mov rcx,r14
	bt r12,1
	jc LB_3950
	btr r12,6
	jmp LB_3951
LB_3950:
	bts r12,6
LB_3951:
	mov rdx,r9
	bt r12,3
	jc LB_3954
	btr r12,7
	jmp LB_3955
LB_3954:
	bts r12,7
LB_3955:
	mov rsi,1
	bt r12,7
	jc LB_3952
	mov rsi,0
	bt rdx,0
	jc LB_3952
	jmp LB_3953
LB_3952:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rdx
	mov rdx,rax
	btr r12,7
LB_3953:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_3942
	btr r12,4
	jmp LB_3943
LB_3942:
	bts r12,4
LB_3943:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_3940
	btr r12,3
	jmp LB_3941
LB_3940:
	bts r12,3
LB_3941:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3938
	btr r12,2
	jmp LB_3939
LB_3938:
	bts r12,2
LB_3939:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3936
	btr r12,1
	jmp LB_3937
LB_3936:
	bts r12,1
LB_3937:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3934
	btr r12,0
	jmp LB_3935
LB_3934:
	bts r12,0
LB_3935:
	add rsp,48
; _f21 { %_3836 %_3837 %_3838 } ⊢ { %_3839 %_3840 %_3841 } : { %_3839 %_3840 %_3841 }
 ; {>  %_3832~4':_stg %_3838~7':(_opn)◂(_p1692) %_3837~6':_r64 %_3836~5':_stg %_3825~1':_r64 %_3830~3':_stg %_3824~0':_stg %_3826~2':(_opn)◂(_p1692) }
; _f21 { 5' 6' 7' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000001110.. |},{ 5' 6' 7' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_3968
	btr r12,1
	jmp LB_3969
LB_3968:
	bts r12,1
LB_3969:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3966
	btr QWORD [rdi],0
	jmp LB_3967
LB_3966:
	bts QWORD [rdi],0
LB_3967:
	mov r14,rcx
	bt r12,6
	jc LB_3972
	btr r12,1
	jmp LB_3973
LB_3972:
	bts r12,1
LB_3973:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3970
	btr QWORD [rdi],1
	jmp LB_3971
LB_3970:
	bts QWORD [rdi],1
LB_3971:
	mov r14,rdx
	bt r12,7
	jc LB_3976
	btr r12,1
	jmp LB_3977
LB_3976:
	bts r12,1
LB_3977:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_3974
	btr QWORD [rdi],2
	jmp LB_3975
LB_3974:
	bts QWORD [rdi],2
LB_3975:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_3980
	btr r12,1
	jmp LB_3981
LB_3980:
	bts r12,1
LB_3981:
	mov r11,r14
	bt r12,1
	jc LB_3978
	btr r12,5
	jmp LB_3979
LB_3978:
	bts r12,5
LB_3979:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_3984
	btr r12,1
	jmp LB_3985
LB_3984:
	bts r12,1
LB_3985:
	mov rcx,r14
	bt r12,1
	jc LB_3982
	btr r12,6
	jmp LB_3983
LB_3982:
	bts r12,6
LB_3983:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_3988
	btr r12,1
	jmp LB_3989
LB_3988:
	bts r12,1
LB_3989:
	mov rdx,r14
	bt r12,1
	jc LB_3986
	btr r12,7
	jmp LB_3987
LB_3986:
	bts r12,7
LB_3987:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_3964
	btr r12,4
	jmp LB_3965
LB_3964:
	bts r12,4
LB_3965:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_3962
	btr r12,3
	jmp LB_3963
LB_3962:
	bts r12,3
LB_3963:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3960
	btr r12,2
	jmp LB_3961
LB_3960:
	bts r12,2
LB_3961:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3958
	btr r12,1
	jmp LB_3959
LB_3958:
	bts r12,1
LB_3959:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3956
	btr r12,0
	jmp LB_3957
LB_3956:
	bts r12,0
LB_3957:
	add rsp,48
; ∎ {  }
 ; {>  %_3840~6':_r64 %_3832~4':_stg %_3825~1':_r64 %_3841~7':(_opn)◂(_p1692) %_3830~3':_stg %_3824~0':_stg %_3826~2':(_opn)◂(_p1692) %_3839~5':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_3990
	mov rdi,rcx
	call dlt
LB_3990:
	bt r12,4
	jc LB_3991
	mov rdi,r10
	call dlt
LB_3991:
	bt r12,1
	jc LB_3992
	mov rdi,r14
	call dlt
LB_3992:
	bt r12,7
	jc LB_3993
	mov rdi,rdx
	call dlt
LB_3993:
	bt r12,3
	jc LB_3994
	mov rdi,r9
	call dlt
LB_3994:
	bt r12,0
	jc LB_3995
	mov rdi,r13
	call dlt
LB_3995:
	bt r12,2
	jc LB_3996
	mov rdi,r8
	call dlt
LB_3996:
	bt r12,5
	jc LB_3997
	mov rdi,r11
	call dlt
LB_3997:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_3926:
	mov r15,0
LB_3999:
	cmp r15,0
	jz LB_4000
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3999
LB_4000:
; ∎ {  }
 ; {>  %_3832~4':_stg %_3825~1':_r64 %_3830~3':_stg %_3824~0':_stg %_3826~2':(_opn)◂(_p1692) %_3833~5':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,4
	jc LB_4001
	mov rdi,r10
	call dlt
LB_4001:
	bt r12,1
	jc LB_4002
	mov rdi,r14
	call dlt
LB_4002:
	bt r12,3
	jc LB_4003
	mov rdi,r9
	call dlt
LB_4003:
	bt r12,0
	jc LB_4004
	mov rdi,r13
	call dlt
LB_4004:
	bt r12,2
	jc LB_4005
	mov rdi,r8
	call dlt
LB_4005:
	bt r12,5
	jc LB_4006
	mov rdi,r11
	call dlt
LB_4006:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_3998:
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
	NS_E_DYN_70:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_70
	NS_E_DYN_113:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_113
	NS_E_DYN_123:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_123
	NS_E_DYN_124:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_124
	NS_E_DYN_125:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_125
	NS_E_DYN_343:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_343
	NS_E_DYN_382:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_382
	NS_E_DYN_421:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_421
	NS_E_DYN_460:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_460
	NS_E_DYN_491:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_491
	NS_E_DYN_492:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_492
	NS_E_DYN_493:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_493
	NS_E_DYN_620:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_620
	NS_E_DYN_679:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_680:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_701:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_702:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_703:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_704:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_705:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_706:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_707:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_708:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 7
	NS_E_DYN_709:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 8
	NS_E_DYN_710:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 9
	NS_E_DYN_711:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_712:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_713:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_714:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_715:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_716:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_717:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_718:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_719:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_720:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_721:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_722:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_723:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_724:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_725:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_726:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_727:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_728:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_729:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_730:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_731:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_732:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_733:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_734:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_735:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_736:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_737:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_738:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_739:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_740:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_741:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_742:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_743:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_744:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_745:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_746:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_747:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_748:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_749:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_750:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_751:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_752:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_753:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_754:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_755:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_756:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_757:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_758:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_759:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_760:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_762:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_763:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_764:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_764
	NS_E_DYN_765:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_765
	NS_E_DYN_766:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_766
	NS_E_DYN_767:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_767
	NS_E_DYN_1386:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1386
	NS_E_DYN_1489:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1489
	CST_DYN_1575:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_3842:
		dq 0x0000_0001_00_82_ffff
		dq 1
