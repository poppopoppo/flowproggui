%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1277
	call NS_E_1471
	call NS_E_2282
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
	jg LB_163
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_163
	jmp LB_164
LB_163:
	jmp NS_E_123_MTC_0_failed
LB_164:
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
	jz LB_168
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_169
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_169:
	jmp NS_E_123_MTC_0_failed
LB_168:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_156
	btr r12,1
	jmp LB_157
LB_156:
	bts r12,1
LB_157:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_154
	btr r12,0
	jmp LB_155
LB_154:
	bts r12,0
LB_155:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_151
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_171
	btr r12,2
	jmp LB_172
LB_171:
	bts r12,2
LB_172:
	mov r13,r14
	bt r12,1
	jc LB_173
	btr r12,0
	jmp LB_174
LB_173:
	bts r12,0
LB_174:
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
NS_E_123_MTC_0_failed:
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
	jg LB_199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_199
	jmp LB_200
LB_199:
	jmp NS_E_124_MTC_0_failed
LB_200:
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
	jz LB_204
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_205
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_205:
	jmp NS_E_124_MTC_0_failed
LB_204:
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
	jz LB_210
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_211
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_211:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_212
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_212:
	jmp NS_E_124_MTC_0_failed
LB_210:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_192
	btr r12,2
	jmp LB_193
LB_192:
	bts r12,2
LB_193:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_190
	btr r12,1
	jmp LB_191
LB_190:
	bts r12,1
LB_191:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_188
	btr r12,0
	jmp LB_189
LB_188:
	bts r12,0
LB_189:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_185
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_214
	btr r12,3
	jmp LB_215
LB_214:
	bts r12,3
LB_215:
	mov r14,r8
	bt r12,2
	jc LB_216
	btr r12,1
	jmp LB_217
LB_216:
	bts r12,1
LB_217:
	mov r8,r13
	bt r12,0
	jc LB_218
	btr r12,2
	jmp LB_219
LB_218:
	bts r12,2
LB_219:
	mov r13,r9
	bt r12,3
	jc LB_220
	btr r12,0
	jmp LB_221
LB_220:
	bts r12,0
LB_221:
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
	jc LB_179
	btr r12,2
	jmp LB_180
LB_179:
	bts r12,2
LB_180:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_177
	btr QWORD [rdi],0
	jmp LB_178
LB_177:
	bts QWORD [rdi],0
LB_178:
	mov r8,r14
	bt r12,1
	jc LB_183
	btr r12,2
	jmp LB_184
LB_183:
	bts r12,2
LB_184:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_181
	btr QWORD [rdi],1
	jmp LB_182
LB_181:
	bts QWORD [rdi],1
LB_182:
	mov rsi,1
	bt r12,3
	jc LB_175
	mov rsi,0
	bt r9,0
	jc LB_175
	jmp LB_176
LB_175:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_176:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_185:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_187
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_186
LB_187:
	add rsp,8
	ret
NS_E_124_MTC_0_failed:
	add rsp,48
	pop r14
LB_186:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_234
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_234
	jmp LB_235
LB_234:
	jmp NS_E_124_MTC_1_failed
LB_235:
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
	jc LB_227
	btr r12,0
	jmp LB_228
LB_227:
	bts r12,0
LB_228:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_224
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
	jc LB_222
	mov rsi,0
	bt r9,0
	jc LB_222
	jmp LB_223
LB_222:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_223:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_224:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_226
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_225
LB_226:
	add rsp,8
	ret
NS_E_124_MTC_1_failed:
	add rsp,16
	pop r14
LB_225:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_256
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_124_MTC_2_failed
LB_256:
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
	jz LB_261
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_262:
	jmp NS_E_124_MTC_2_failed
LB_261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_251
	btr r12,1
	jmp LB_252
LB_251:
	bts r12,1
LB_252:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_249
	btr r12,0
	jmp LB_250
LB_249:
	bts r12,0
LB_250:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_246
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
	jc LB_240
	btr r12,2
	jmp LB_241
LB_240:
	bts r12,2
LB_241:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_238
	btr QWORD [rdi],0
	jmp LB_239
LB_238:
	bts QWORD [rdi],0
LB_239:
	mov r8,r14
	bt r12,1
	jc LB_244
	btr r12,2
	jmp LB_245
LB_244:
	bts r12,2
LB_245:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_242
	btr QWORD [rdi],1
	jmp LB_243
LB_242:
	bts QWORD [rdi],1
LB_243:
	mov rsi,1
	bt r12,3
	jc LB_236
	mov rsi,0
	bt r9,0
	jc LB_236
	jmp LB_237
LB_236:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_237:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_246:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_248
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_247
LB_248:
	add rsp,8
	ret
NS_E_124_MTC_2_failed:
	add rsp,32
	pop r14
LB_247:
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
	jg LB_276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_276
	jmp LB_277
LB_276:
	jmp NS_E_125_MTC_0_failed
LB_277:
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
	jc LB_269
	btr r12,0
	jmp LB_270
LB_269:
	bts r12,0
LB_270:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_266
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
	jc LB_264
	btr r12,3
	jmp LB_265
LB_264:
	bts r12,3
LB_265:
	mov r8,0
	bts r12,2
	ret
LB_266:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_268
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_267
LB_268:
	add rsp,8
	ret
NS_E_125_MTC_0_failed:
	add rsp,16
	pop r14
LB_267:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_290
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_290
	jmp LB_291
LB_290:
	jmp NS_E_125_MTC_1_failed
LB_291:
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
	jc LB_283
	btr r12,0
	jmp LB_284
LB_283:
	bts r12,0
LB_284:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_280
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
	jc LB_278
	btr r12,3
	jmp LB_279
LB_278:
	bts r12,3
LB_279:
	mov r8,0
	bts r12,2
	ret
LB_280:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_282
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_281
LB_282:
	add rsp,8
	ret
NS_E_125_MTC_1_failed:
	add rsp,16
	pop r14
LB_281:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_304
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_304
	jmp LB_305
LB_304:
	jmp NS_E_125_MTC_2_failed
LB_305:
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
	jc LB_297
	btr r12,0
	jmp LB_298
LB_297:
	bts r12,0
LB_298:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_294
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
	jc LB_292
	btr r12,3
	jmp LB_293
LB_292:
	bts r12,3
LB_293:
	mov r8,0
	bts r12,2
	ret
LB_294:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_296
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_295
LB_296:
	add rsp,8
	ret
NS_E_125_MTC_2_failed:
	add rsp,16
	pop r14
LB_295:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_318
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_318
	jmp LB_319
LB_318:
	jmp NS_E_125_MTC_3_failed
LB_319:
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
	jc LB_311
	btr r12,0
	jmp LB_312
LB_311:
	bts r12,0
LB_312:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_308
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
	jc LB_306
	btr r12,3
	jmp LB_307
LB_306:
	bts r12,3
LB_307:
	mov r8,0
	bts r12,2
	ret
LB_308:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_310
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_309
LB_310:
	add rsp,8
	ret
NS_E_125_MTC_3_failed:
	add rsp,16
	pop r14
LB_309:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_332
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_332
	jmp LB_333
LB_332:
	jmp NS_E_125_MTC_4_failed
LB_333:
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
	jc LB_325
	btr r12,0
	jmp LB_326
LB_325:
	bts r12,0
LB_326:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_322
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
	jc LB_320
	btr r12,3
	jmp LB_321
LB_320:
	bts r12,3
LB_321:
	mov r8,0
	bts r12,2
	ret
LB_322:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_324
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_323
LB_324:
	add rsp,8
	ret
NS_E_125_MTC_4_failed:
	add rsp,16
	pop r14
LB_323:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_334:
NS_E_RDI_334:
NS_E_334_ETR_TBL:
NS_E_334_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_370
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_334_MTC_0_failed
LB_370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_365
	btr r12,0
	jmp LB_366
LB_365:
	bts r12,0
LB_366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_362
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_336 : %_336
 ; {>  %_335~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_336
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_337 : %_337
 ; {>  %_335~0':_r64 %_336~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_337
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_335 %_336 } ⊢ { %_338 %_339 %_340 } : { %_338 %_339 %_340 }
 ; {>  %_335~0':_r64 %_337~2':_r64 %_336~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_337 %_338 } ⊢ { %_341 %_342 %_343 } : { %_341 %_342 %_343 }
 ; {>  %_340~3':_r64 %_339~1':_r64 %_337~2':_r64 %_338~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_346:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_347
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_347
LB_348:
	cmp r15,0
	jz LB_349
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_348
LB_349:
; _some %_342 ⊢ %_344 : %_344
 ; {>  %_339~1':_r64 %_341~2':_r64 %_342~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_344
 ; {>  %_344~°0◂0':(_opn)◂(_r64) %_339~1':_r64 %_341~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_350
	mov rdi,r14
	call dlt
LB_350:
	bt r12,2
	jc LB_351
	mov rdi,r8
	call dlt
LB_351:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_352
	btr r12,3
	jmp LB_353
LB_352:
	bts r12,3
LB_353:
	mov r8,0
	bts r12,2
	ret
MTC_LB_347:
	mov r15,0
LB_355:
	cmp r15,0
	jz LB_356
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_355
LB_356:
; _none {  } ⊢ %_345 : %_345
 ; {>  %_343~4':_r64 %_340~3':_r64 %_339~1':_r64 %_341~2':_r64 %_342~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_345
 ; {>  %_343~4':_r64 %_340~3':_r64 %_339~1':_r64 %_345~°1◂{  }:(_opn)◂(t141'(0)) %_341~2':_r64 %_342~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_357
	mov rdi,r10
	call dlt
LB_357:
	bt r12,3
	jc LB_358
	mov rdi,r9
	call dlt
LB_358:
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
	bt r12,0
	jc LB_361
	mov rdi,r13
	call dlt
LB_361:
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
MTC_LB_354:
LB_362:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_364
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_363
LB_364:
	add rsp,8
	ret
NS_E_334_MTC_0_failed:
	add rsp,16
	pop r14
LB_363:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_372:
NS_E_RDI_372:
NS_E_372_ETR_TBL:
NS_E_372_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_408
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_372_MTC_0_failed
LB_408:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_403
	btr r12,0
	jmp LB_404
LB_403:
	bts r12,0
LB_404:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_400
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_374 : %_374
 ; {>  %_373~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_374
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_375 : %_375
 ; {>  %_374~1':_r64 %_373~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_375
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_373 %_374 } ⊢ { %_376 %_377 %_378 } : { %_376 %_377 %_378 }
 ; {>  %_375~2':_r64 %_374~1':_r64 %_373~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_375 %_376 } ⊢ { %_379 %_380 %_381 } : { %_379 %_380 %_381 }
 ; {>  %_378~3':_r64 %_377~1':_r64 %_375~2':_r64 %_376~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_384:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_385
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_385
LB_386:
	cmp r15,0
	jz LB_387
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_386
LB_387:
; _some %_380 ⊢ %_382 : %_382
 ; {>  %_380~0':_r64 %_377~1':_r64 %_379~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_382
 ; {>  %_382~°0◂0':(_opn)◂(_r64) %_377~1':_r64 %_379~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_388
	mov rdi,r14
	call dlt
LB_388:
	bt r12,2
	jc LB_389
	mov rdi,r8
	call dlt
LB_389:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_390
	btr r12,3
	jmp LB_391
LB_390:
	bts r12,3
LB_391:
	mov r8,0
	bts r12,2
	ret
MTC_LB_385:
	mov r15,0
LB_393:
	cmp r15,0
	jz LB_394
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_393
LB_394:
; _none {  } ⊢ %_383 : %_383
 ; {>  %_380~0':_r64 %_378~3':_r64 %_377~1':_r64 %_379~2':_r64 %_381~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_383
 ; {>  %_380~0':_r64 %_378~3':_r64 %_377~1':_r64 %_383~°1◂{  }:(_opn)◂(t168'(0)) %_379~2':_r64 %_381~4':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_395
	mov rdi,r13
	call dlt
LB_395:
	bt r12,3
	jc LB_396
	mov rdi,r9
	call dlt
LB_396:
	bt r12,1
	jc LB_397
	mov rdi,r14
	call dlt
LB_397:
	bt r12,2
	jc LB_398
	mov rdi,r8
	call dlt
LB_398:
	bt r12,4
	jc LB_399
	mov rdi,r10
	call dlt
LB_399:
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
MTC_LB_392:
LB_400:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_402
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_401
LB_402:
	add rsp,8
	ret
NS_E_372_MTC_0_failed:
	add rsp,16
	pop r14
LB_401:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_410:
NS_E_RDI_410:
NS_E_410_ETR_TBL:
NS_E_410_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_446
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_410_MTC_0_failed
LB_446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_441
	btr r12,0
	jmp LB_442
LB_441:
	bts r12,0
LB_442:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_438
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_412 : %_412
 ; {>  %_411~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_412
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_413 : %_413
 ; {>  %_411~0':_r64 %_412~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_413
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_411 %_412 } ⊢ { %_414 %_415 %_416 } : { %_414 %_415 %_416 }
 ; {>  %_411~0':_r64 %_413~2':_r64 %_412~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_413 %_414 } ⊢ { %_417 %_418 %_419 } : { %_417 %_418 %_419 }
 ; {>  %_416~3':_r64 %_414~0':_r64 %_413~2':_r64 %_415~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_422:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_423
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_423
LB_424:
	cmp r15,0
	jz LB_425
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_424
LB_425:
; _some %_418 ⊢ %_420 : %_420
 ; {>  %_415~1':_r64 %_417~2':_r64 %_418~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_420
 ; {>  %_420~°0◂0':(_opn)◂(_r64) %_415~1':_r64 %_417~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_426
	mov rdi,r14
	call dlt
LB_426:
	bt r12,2
	jc LB_427
	mov rdi,r8
	call dlt
LB_427:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_428
	btr r12,3
	jmp LB_429
LB_428:
	bts r12,3
LB_429:
	mov r8,0
	bts r12,2
	ret
MTC_LB_423:
	mov r15,0
LB_431:
	cmp r15,0
	jz LB_432
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_431
LB_432:
; _none {  } ⊢ %_421 : %_421
 ; {>  %_419~4':_r64 %_416~3':_r64 %_415~1':_r64 %_417~2':_r64 %_418~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_421
 ; {>  %_419~4':_r64 %_416~3':_r64 %_421~°1◂{  }:(_opn)◂(t195'(0)) %_415~1':_r64 %_417~2':_r64 %_418~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_433
	mov rdi,r10
	call dlt
LB_433:
	bt r12,3
	jc LB_434
	mov rdi,r9
	call dlt
LB_434:
	bt r12,1
	jc LB_435
	mov rdi,r14
	call dlt
LB_435:
	bt r12,2
	jc LB_436
	mov rdi,r8
	call dlt
LB_436:
	bt r12,0
	jc LB_437
	mov rdi,r13
	call dlt
LB_437:
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
MTC_LB_430:
LB_438:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_440
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_439
LB_440:
	add rsp,8
	ret
NS_E_410_MTC_0_failed:
	add rsp,16
	pop r14
LB_439:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_448:
NS_E_RDI_448:
NS_E_448_ETR_TBL:
NS_E_448_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_410_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_463
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_448_MTC_0_failed
LB_463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_458
	btr r12,0
	jmp LB_459
LB_458:
	bts r12,0
LB_459:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_455
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_449 ⊢ %_450 : %_450
 ; {>  %_449~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_450
 ; {>  %_450~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_453
	btr r12,3
	jmp LB_454
LB_453:
	bts r12,3
LB_454:
	mov r8,0
	bts r12,2
	ret
LB_455:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_457
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_456
LB_457:
	add rsp,8
	ret
NS_E_448_MTC_0_failed:
	add rsp,16
	pop r14
LB_456:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_372_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_475
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_448_MTC_1_failed
LB_475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_470
	btr r12,0
	jmp LB_471
LB_470:
	bts r12,0
LB_471:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_467
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_451 ⊢ %_452 : %_452
 ; {>  %_451~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_452
 ; {>  %_452~°0◂0':(_opn)◂(_r64) }
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
NS_E_448_MTC_1_failed:
	add rsp,16
	pop r14
LB_468:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_477:
NS_E_RDI_477:
NS_E_477_ETR_TBL:
NS_E_477_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_448_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_525
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_477_MTC_0_failed
LB_525:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_530
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_531:
	jmp NS_E_477_MTC_0_failed
LB_530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_520
	btr r12,1
	jmp LB_521
LB_520:
	bts r12,1
LB_521:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_518
	btr r12,0
	jmp LB_519
LB_518:
	bts r12,0
LB_519:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_515
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_480 %_481 } ⊢ %_482 : %_482
 ; {>  %_480~0':_r64 %_481~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f113 %_482 ⊢ %_483 : %_483
 ; {>  %_482~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f113 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_501
	btr r12,2
	jmp LB_502
LB_501:
	bts r12,2
LB_502:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_507
	btr r12,3
	jmp LB_508
LB_507:
	bts r12,3
LB_508:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_505
	btr QWORD [rdi],0
	jmp LB_506
LB_505:
	bts QWORD [rdi],0
LB_506:
	mov r9,r14
	bt r12,1
	jc LB_511
	btr r12,3
	jmp LB_512
LB_511:
	bts r12,3
LB_512:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_509
	btr QWORD [rdi],1
	jmp LB_510
LB_509:
	bts QWORD [rdi],1
LB_510:
	mov rsi,1
	bt r12,0
	jc LB_503
	mov rsi,0
	bt r13,0
	jc LB_503
	jmp LB_504
LB_503:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_504:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_113
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_483 ⊢ %_484 : %_484
 ; {>  %_483~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_484
 ; {>  %_484~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_513
	btr r12,3
	jmp LB_514
LB_513:
	bts r12,3
LB_514:
	mov r8,0
	bts r12,2
	ret
LB_515:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_517
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_516
LB_517:
	add rsp,8
	ret
NS_E_477_MTC_0_failed:
	add rsp,32
	pop r14
LB_516:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_478:
NS_E_RDI_478:
NS_E_478_ETR_TBL:
NS_E_478_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_479_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_553
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_478_MTC_0_failed
LB_553:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_558
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_559
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_559:
	jmp NS_E_478_MTC_0_failed
LB_558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_548
	btr r12,1
	jmp LB_549
LB_548:
	bts r12,1
LB_549:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_546
	btr r12,0
	jmp LB_547
LB_546:
	bts r12,0
LB_547:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_543
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_485 %_486 } ⊢ %_487 : %_487
 ; {>  %_486~1':(_lst)◂(_r64) %_485~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_487 ⊢ %_488 : %_488
 ; {>  %_487~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_488
 ; {>  %_488~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_537
	btr r12,2
	jmp LB_538
LB_537:
	bts r12,2
LB_538:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_535
	btr QWORD [rdi],0
	jmp LB_536
LB_535:
	bts QWORD [rdi],0
LB_536:
	mov r8,r14
	bt r12,1
	jc LB_541
	btr r12,2
	jmp LB_542
LB_541:
	bts r12,2
LB_542:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_539
	btr QWORD [rdi],1
	jmp LB_540
LB_539:
	bts QWORD [rdi],1
LB_540:
	mov rsi,1
	bt r12,3
	jc LB_533
	mov rsi,0
	bt r9,0
	jc LB_533
	jmp LB_534
LB_533:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_534:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_543:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_545
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_544
LB_545:
	add rsp,8
	ret
NS_E_478_MTC_0_failed:
	add rsp,32
	pop r14
LB_544:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_563
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_489 : %_489
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_489 ⊢ %_490 : %_490
 ; {>  %_489~°1◂{  }:(_lst)◂(t239'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_490
 ; {>  %_490~°0◂°1◂{  }:(_opn)◂((_lst)◂(t242'(0))) }
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
	jc LB_561
	mov rsi,0
	bt r9,0
	jc LB_561
	jmp LB_562
LB_561:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_562:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_563:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_565
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_564
LB_565:
	add rsp,8
	ret
NS_E_478_MTC_1_failed:
	add rsp,0
	pop r14
LB_564:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_479:
NS_E_RDI_479:
NS_E_479_ETR_TBL:
NS_E_479_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_448_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_576
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_479_MTC_0_failed
LB_576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_571
	btr r12,0
	jmp LB_572
LB_571:
	bts r12,0
LB_572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_568
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_491 ⊢ %_492 : %_492
 ; {>  %_491~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_492
 ; {>  %_492~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_566
	btr r12,3
	jmp LB_567
LB_566:
	bts r12,3
LB_567:
	mov r8,0
	bts r12,2
	ret
LB_568:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_570
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_569
LB_570:
	add rsp,8
	ret
NS_E_479_MTC_0_failed:
	add rsp,16
	pop r14
LB_569:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_334_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_595
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_479_MTC_1_failed
LB_595:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_590
	btr r12,0
	jmp LB_591
LB_590:
	bts r12,0
LB_591:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_587
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_494
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f21 %_494 ⊢ %_495 : %_495
 ; {>  %_494~1':_stg %_493~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_580
	btr r12,0
	jmp LB_581
LB_580:
	bts r12,0
LB_581:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_582
	btr r12,1
	jmp LB_583
LB_582:
	bts r12,1
LB_583:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_578
	btr r12,0
	jmp LB_579
LB_578:
	bts r12,0
LB_579:
	add rsp,16
; _some %_493 ⊢ %_496 : %_496
 ; {>  %_495~1':_stg %_493~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_496
 ; {>  %_496~°0◂0':(_opn)◂(_r64) %_495~1':_stg }
; 	∎ °0◂0'
	bt r12,1
	jc LB_584
	mov rdi,r14
	call dlt
LB_584:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_585
	btr r12,3
	jmp LB_586
LB_585:
	bts r12,3
LB_586:
	mov r8,0
	bts r12,2
	ret
LB_587:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_589
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_588
LB_589:
	add rsp,8
	ret
NS_E_479_MTC_1_failed:
	add rsp,16
	pop r14
LB_588:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_610
	jmp LB_611
LB_610:
	jmp NS_E_479_MTC_2_failed
LB_611:
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
	jc LB_603
	btr r12,0
	jmp LB_604
LB_603:
	bts r12,0
LB_604:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_600
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_497
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_497 ⊢ %_498 : %_498
 ; {>  %_497~0':_stg }
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
; » 0xr5f |~ {  } ⊢ %_499 : %_499
 ; {>  %_498~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_499
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_499 ⊢ %_500 : %_500
 ; {>  %_499~1':_r64 %_498~0':_stg }
; _some 1' ⊢ °0◂1'
; ∎ %_500
 ; {>  %_500~°0◂1':(_opn)◂(_r64) %_498~0':_stg }
; 	∎ °0◂1'
	bt r12,0
	jc LB_597
	mov rdi,r13
	call dlt
LB_597:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_598
	btr r12,3
	jmp LB_599
LB_598:
	bts r12,3
LB_599:
	mov r8,0
	bts r12,2
	ret
LB_600:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_602
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_601
LB_602:
	add rsp,8
	ret
NS_E_479_MTC_2_failed:
	add rsp,16
	pop r14
LB_601:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_612:
NS_E_RDI_612:
NS_E_612_ETR_TBL:
NS_E_612_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_632
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_632
	jmp LB_633
LB_632:
	jmp NS_E_612_MTC_0_failed
LB_633:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_637
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_638
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_638:
	jmp NS_E_612_MTC_0_failed
LB_637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_625
	btr r12,1
	jmp LB_626
LB_625:
	bts r12,1
LB_626:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_623
	btr r12,0
	jmp LB_624
LB_623:
	bts r12,0
LB_624:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_620
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_640
	btr r12,2
	jmp LB_641
LB_640:
	bts r12,2
LB_641:
	mov r13,r14
	bt r12,1
	jc LB_642
	btr r12,0
	jmp LB_643
LB_642:
	bts r12,0
LB_643:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f113 %_613 ⊢ %_614 : %_614
 ; {>  %_613~0':(_lst)◂(_r64) }
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
; _some %_614 ⊢ %_615 : %_615
 ; {>  %_614~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_615
 ; {>  %_615~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_618
	btr r12,3
	jmp LB_619
LB_618:
	bts r12,3
LB_619:
	mov r8,0
	bts r12,2
	ret
LB_620:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_622
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_621
LB_622:
	add rsp,8
	ret
NS_E_612_MTC_0_failed:
	add rsp,32
	pop r14
LB_621:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_654
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_612_MTC_1_failed
LB_654:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_649
	btr r12,0
	jmp LB_650
LB_649:
	bts r12,0
LB_650:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_646
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_616 ⊢ %_617 : %_617
 ; {>  %_616~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_617
 ; {>  %_617~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_644
	btr r12,3
	jmp LB_645
LB_644:
	bts r12,3
LB_645:
	mov r8,0
	bts r12,2
	ret
LB_646:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_648
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_647
LB_648:
	add rsp,8
	ret
NS_E_612_MTC_1_failed:
	add rsp,16
	pop r14
LB_647:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_657:
NS_E_RDI_657:
NS_E_657_ETR_TBL:
NS_E_657_TBL:
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
LB_665:
	jmp LB_662
LB_661:
	add r14,1
LB_662:
	cmp r14,r10
	jge LB_663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_661
	cmp al,10
	jz LB_661
	cmp al,32
	jz LB_661
LB_663:
	push r10
	push rsi
	call NS_E_477_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_664
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_666
	bts QWORD [rax],0
LB_666:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_665
LB_664:
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
	jc LB_659
	btr QWORD [rdi],0
LB_659:
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
NS_E_657_MTC_0_failed:
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
NS_E_676:
NS_E_RDI_676:
NS_E_676_ETR_TBL:
NS_E_676_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_780
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_780
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_780
	jmp LB_781
LB_780:
	jmp NS_E_676_MTC_0_failed
LB_781:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_785
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_786
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_786:
	jmp NS_E_676_MTC_0_failed
LB_785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_791
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_792
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_792:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_793
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_793:
	jmp NS_E_676_MTC_0_failed
LB_791:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_773
	btr r12,2
	jmp LB_774
LB_773:
	bts r12,2
LB_774:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_771
	btr r12,1
	jmp LB_772
LB_771:
	bts r12,1
LB_772:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_769
	btr r12,0
	jmp LB_770
LB_769:
	bts r12,0
LB_770:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_766
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_795
	btr r12,3
	jmp LB_796
LB_795:
	bts r12,3
LB_796:
	mov r13,r14
	bt r12,1
	jc LB_797
	btr r12,0
	jmp LB_798
LB_797:
	bts r12,0
LB_798:
	mov r10,r8
	bt r12,2
	jc LB_799
	btr r12,4
	jmp LB_800
LB_799:
	bts r12,4
LB_800:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_803
	btr r12,5
	jmp LB_804
LB_803:
	bts r12,5
LB_804:
	mov r14,r11
	bt r12,5
	jc LB_801
	btr r12,1
	jmp LB_802
LB_801:
	bts r12,1
LB_802:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_807
	btr r12,5
	jmp LB_808
LB_807:
	bts r12,5
LB_808:
	mov r8,r11
	bt r12,5
	jc LB_805
	btr r12,2
	jmp LB_806
LB_805:
	bts r12,2
LB_806:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_682 : %_682
 ; {>  %_681~2':(_lst)◂(_p673) %_679~0':_r64 %_680~1':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_682
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_682 %_679 } ⊢ { %_683 %_684 } : { %_683 %_684 }
 ; {>  %_681~2':(_lst)◂(_p673) %_682~3':_r64 %_679~0':_r64 %_680~1':_r64 }
	add r9,r13
; _f674 %_683 ⊢ %_685 : %_685
 ; {>  %_681~2':(_lst)◂(_p673) %_684~0':_r64 %_683~3':_r64 %_680~1':_r64 }
; _f674 3' ⊢ °0◂3'
; _cns { %_685 %_681 } ⊢ %_686 : %_686
 ; {>  %_681~2':(_lst)◂(_p673) %_684~0':_r64 %_685~°0◂3':_p673 %_680~1':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_680 %_686 } ⊢ %_687 : %_687
 ; {>  %_684~0':_r64 %_686~°0◂{ °0◂3' 2' }:(_lst)◂(_p673) %_680~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_687
 ; {>  %_684~0':_r64 %_687~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p673) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_745
	mov rdi,r13
	call dlt
LB_745:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_746
	btr r12,0
	jmp LB_747
LB_746:
	bts r12,0
LB_747:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_750
	btr r12,4
	jmp LB_751
LB_750:
	bts r12,4
LB_751:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_748
	btr QWORD [rdi],0
	jmp LB_749
LB_748:
	bts QWORD [rdi],0
LB_749:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_760
	btr r12,1
	jmp LB_761
LB_760:
	bts r12,1
LB_761:
	mov rsi,1
	bt r12,1
	jc LB_758
	mov rsi,0
	bt r14,0
	jc LB_758
	jmp LB_759
LB_758:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_759:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_756
	btr QWORD [rdi],0
	jmp LB_757
LB_756:
	bts QWORD [rdi],0
LB_757:
	mov r14,r8
	bt r12,2
	jc LB_764
	btr r12,1
	jmp LB_765
LB_764:
	bts r12,1
LB_765:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_762
	btr QWORD [rdi],1
	jmp LB_763
LB_762:
	bts QWORD [rdi],1
LB_763:
	mov rsi,1
	bt r12,4
	jc LB_754
	mov rsi,0
	bt r10,0
	jc LB_754
	jmp LB_755
LB_754:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_755:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_752
	btr QWORD [rdi],1
	jmp LB_753
LB_752:
	bts QWORD [rdi],1
LB_753:
	mov r8,0
	bts r12,2
	ret
LB_766:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_768
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_767
LB_768:
	add rsp,8
	ret
NS_E_676_MTC_0_failed:
	add rsp,48
	pop r14
LB_767:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_844
	jmp LB_845
LB_844:
	jmp NS_E_676_MTC_1_failed
LB_845:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_849
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_850:
	jmp NS_E_676_MTC_1_failed
LB_849:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_855
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_856
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_856:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_857
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_857:
	jmp NS_E_676_MTC_1_failed
LB_855:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_837
	btr r12,2
	jmp LB_838
LB_837:
	bts r12,2
LB_838:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_835
	btr r12,1
	jmp LB_836
LB_835:
	bts r12,1
LB_836:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_833
	btr r12,0
	jmp LB_834
LB_833:
	bts r12,0
LB_834:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_830
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_859
	btr r12,3
	jmp LB_860
LB_859:
	bts r12,3
LB_860:
	mov r13,r14
	bt r12,1
	jc LB_861
	btr r12,0
	jmp LB_862
LB_861:
	bts r12,0
LB_862:
	mov r10,r8
	bt r12,2
	jc LB_863
	btr r12,4
	jmp LB_864
LB_863:
	bts r12,4
LB_864:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_867
	btr r12,5
	jmp LB_868
LB_867:
	bts r12,5
LB_868:
	mov r14,r11
	bt r12,5
	jc LB_865
	btr r12,1
	jmp LB_866
LB_865:
	bts r12,1
LB_866:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_871
	btr r12,5
	jmp LB_872
LB_871:
	bts r12,5
LB_872:
	mov r8,r11
	bt r12,5
	jc LB_869
	btr r12,2
	jmp LB_870
LB_869:
	bts r12,2
LB_870:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_691 : %_691
 ; {>  %_689~1':_r64 %_688~0':_r64 %_690~2':(_lst)◂(_p673) }
; 	» 0xr2 _ ⊢ 3' : %_691
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_691 %_688 } ⊢ { %_692 %_693 } : { %_692 %_693 }
 ; {>  %_691~3':_r64 %_689~1':_r64 %_688~0':_r64 %_690~2':(_lst)◂(_p673) }
	add r9,r13
; _f674 %_692 ⊢ %_694 : %_694
 ; {>  %_692~3':_r64 %_689~1':_r64 %_690~2':(_lst)◂(_p673) %_693~0':_r64 }
; _f674 3' ⊢ °0◂3'
; _cns { %_694 %_690 } ⊢ %_695 : %_695
 ; {>  %_694~°0◂3':_p673 %_689~1':_r64 %_690~2':(_lst)◂(_p673) %_693~0':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_689 %_695 } ⊢ %_696 : %_696
 ; {>  %_695~°0◂{ °0◂3' 2' }:(_lst)◂(_p673) %_689~1':_r64 %_693~0':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_696
 ; {>  %_696~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p673) }) %_693~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_809
	mov rdi,r13
	call dlt
LB_809:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_810
	btr r12,0
	jmp LB_811
LB_810:
	bts r12,0
LB_811:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_814
	btr r12,4
	jmp LB_815
LB_814:
	bts r12,4
LB_815:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_812
	btr QWORD [rdi],0
	jmp LB_813
LB_812:
	bts QWORD [rdi],0
LB_813:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_824
	btr r12,1
	jmp LB_825
LB_824:
	bts r12,1
LB_825:
	mov rsi,1
	bt r12,1
	jc LB_822
	mov rsi,0
	bt r14,0
	jc LB_822
	jmp LB_823
LB_822:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_823:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_820
	btr QWORD [rdi],0
	jmp LB_821
LB_820:
	bts QWORD [rdi],0
LB_821:
	mov r14,r8
	bt r12,2
	jc LB_828
	btr r12,1
	jmp LB_829
LB_828:
	bts r12,1
LB_829:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_826
	btr QWORD [rdi],1
	jmp LB_827
LB_826:
	bts QWORD [rdi],1
LB_827:
	mov rsi,1
	bt r12,4
	jc LB_818
	mov rsi,0
	bt r10,0
	jc LB_818
	jmp LB_819
LB_818:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_819:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_816
	btr QWORD [rdi],1
	jmp LB_817
LB_816:
	bts QWORD [rdi],1
LB_817:
	mov r8,0
	bts r12,2
	ret
LB_830:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_832
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_831
LB_832:
	add rsp,8
	ret
NS_E_676_MTC_1_failed:
	add rsp,48
	pop r14
LB_831:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_947
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_676_MTC_2_failed
LB_947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_952
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_953
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_953:
	jmp NS_E_676_MTC_2_failed
LB_952:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_942
	btr r12,1
	jmp LB_943
LB_942:
	bts r12,1
LB_943:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_940
	btr r12,0
	jmp LB_941
LB_940:
	bts r12,0
LB_941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_937
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_955
	btr r12,3
	jmp LB_956
LB_955:
	bts r12,3
LB_956:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_959
	btr r12,4
	jmp LB_960
LB_959:
	bts r12,4
LB_960:
	mov r14,r10
	bt r12,4
	jc LB_957
	btr r12,1
	jmp LB_958
LB_957:
	bts r12,1
LB_958:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_963
	btr r12,4
	jmp LB_964
LB_963:
	bts r12,4
LB_964:
	mov r8,r10
	bt r12,4
	jc LB_961
	btr r12,2
	jmp LB_962
LB_961:
	bts r12,2
LB_962:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_873:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_874
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
	jnc LB_875
	bt QWORD [rax],0
	jc LB_876
	btr r12,5
	jmp LB_877
LB_876:
	bts r12,5
LB_877:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_875:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_880
	btr r12,6
	jmp LB_881
LB_880:
	bts r12,6
LB_881:
	mov r9,rcx
	bt r12,6
	jc LB_878
	btr r12,3
	jmp LB_879
LB_878:
	bts r12,3
LB_879:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_884
	btr r12,6
	jmp LB_885
LB_884:
	bts r12,6
LB_885:
	mov r10,rcx
	bt r12,6
	jc LB_882
	btr r12,4
	jmp LB_883
LB_882:
	bts r12,4
LB_883:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_874
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
	jnc LB_886
	bt QWORD [rax],0
	jc LB_887
	btr r12,6
	jmp LB_888
LB_887:
	bts r12,6
LB_888:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_886:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_889
	btr r12,5
	jmp LB_890
LB_889:
	bts r12,5
LB_890:
LB_891:
	cmp r15,0
	jz LB_892
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_891
LB_892:
; » 0xr1 |~ {  } ⊢ %_703 : %_703
 ; {>  %_701~4':(_lst)◂(_p673) %_698~1':_r64 %_702~5':_r64 %_697~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_703
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_702 %_703 } ⊢ { %_704 %_705 } : { %_704 %_705 }
 ; {>  %_701~4':(_lst)◂(_p673) %_698~1':_r64 %_703~2':_r64 %_702~5':_r64 %_697~0':_r64 }
	add r11,r8
; _f34 { %_698 %_705 } ⊢ { %_706 %_707 } : { %_706 %_707 }
 ; {>  %_701~4':(_lst)◂(_p673) %_704~5':_r64 %_698~1':_r64 %_705~2':_r64 %_697~0':_r64 }
	add r14,r8
; _f675 %_704 ⊢ %_708 : %_708
 ; {>  %_701~4':(_lst)◂(_p673) %_706~1':_r64 %_704~5':_r64 %_707~2':_r64 %_697~0':_r64 }
; _f675 5' ⊢ °1◂5'
; _cns { %_708 %_701 } ⊢ %_709 : %_709
 ; {>  %_701~4':(_lst)◂(_p673) %_706~1':_r64 %_708~°1◂5':_p673 %_707~2':_r64 %_697~0':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_706 %_709 } ⊢ %_710 : %_710
 ; {>  %_709~°0◂{ °1◂5' 4' }:(_lst)◂(_p673) %_706~1':_r64 %_707~2':_r64 %_697~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_710
 ; {>  %_710~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p673) }) %_707~2':_r64 %_697~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,2
	jc LB_893
	mov rdi,r8
	call dlt
LB_893:
	bt r12,0
	jc LB_894
	mov rdi,r13
	call dlt
LB_894:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_897
	btr r12,0
	jmp LB_898
LB_897:
	bts r12,0
LB_898:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_895
	btr QWORD [rdi],0
	jmp LB_896
LB_895:
	bts QWORD [rdi],0
LB_896:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_907
	btr r12,1
	jmp LB_908
LB_907:
	bts r12,1
LB_908:
	mov rsi,1
	bt r12,1
	jc LB_905
	mov rsi,0
	bt r14,0
	jc LB_905
	jmp LB_906
LB_905:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_906:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_903
	btr QWORD [rdi],0
	jmp LB_904
LB_903:
	bts QWORD [rdi],0
LB_904:
	mov r14,r10
	bt r12,4
	jc LB_911
	btr r12,1
	jmp LB_912
LB_911:
	bts r12,1
LB_912:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_909
	btr QWORD [rdi],1
	jmp LB_910
LB_909:
	bts QWORD [rdi],1
LB_910:
	mov rsi,1
	bt r12,0
	jc LB_901
	mov rsi,0
	bt r13,0
	jc LB_901
	jmp LB_902
LB_901:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_902:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_899
	btr QWORD [rdi],1
	jmp LB_900
LB_899:
	bts QWORD [rdi],1
LB_900:
	mov r8,0
	bts r12,2
	ret
MTC_LB_874:
	mov r15,0
LB_914:
	cmp r15,0
	jz LB_915
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_914
LB_915:
; » 0xr1 |~ {  } ⊢ %_711 : %_711
 ; {>  %_698~1':_r64 %_699~2':(_lst)◂(_p673) %_697~0':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_711
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_698 %_711 } ⊢ { %_712 %_713 } : { %_712 %_713 }
 ; {>  %_711~3':_r64 %_698~1':_r64 %_699~2':(_lst)◂(_p673) %_697~0':_r64 }
	add r14,r9
; _f675 %_713 ⊢ %_714 : %_714
 ; {>  %_713~3':_r64 %_712~1':_r64 %_699~2':(_lst)◂(_p673) %_697~0':_r64 }
; _f675 3' ⊢ °1◂3'
; _cns { %_714 %_699 } ⊢ %_715 : %_715
 ; {>  %_712~1':_r64 %_714~°1◂3':_p673 %_699~2':(_lst)◂(_p673) %_697~0':_r64 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_712 %_715 } ⊢ %_716 : %_716
 ; {>  %_712~1':_r64 %_715~°0◂{ °1◂3' 2' }:(_lst)◂(_p673) %_697~0':_r64 }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_716
 ; {>  %_716~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p673) }) %_697~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_916
	mov rdi,r13
	call dlt
LB_916:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_917
	btr r12,0
	jmp LB_918
LB_917:
	bts r12,0
LB_918:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_921
	btr r12,4
	jmp LB_922
LB_921:
	bts r12,4
LB_922:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_919
	btr QWORD [rdi],0
	jmp LB_920
LB_919:
	bts QWORD [rdi],0
LB_920:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_931
	btr r12,1
	jmp LB_932
LB_931:
	bts r12,1
LB_932:
	mov rsi,1
	bt r12,1
	jc LB_929
	mov rsi,0
	bt r14,0
	jc LB_929
	jmp LB_930
LB_929:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_930:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_927
	btr QWORD [rdi],0
	jmp LB_928
LB_927:
	bts QWORD [rdi],0
LB_928:
	mov r14,r8
	bt r12,2
	jc LB_935
	btr r12,1
	jmp LB_936
LB_935:
	bts r12,1
LB_936:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_933
	btr QWORD [rdi],1
	jmp LB_934
LB_933:
	bts QWORD [rdi],1
LB_934:
	mov rsi,1
	bt r12,4
	jc LB_925
	mov rsi,0
	bt r10,0
	jc LB_925
	jmp LB_926
LB_925:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_926:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_923
	btr QWORD [rdi],1
	jmp LB_924
LB_923:
	bts QWORD [rdi],1
LB_924:
	mov r8,0
	bts r12,2
	ret
MTC_LB_913:
LB_937:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_939
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_938
LB_939:
	add rsp,8
	ret
NS_E_676_MTC_2_failed:
	add rsp,32
	pop r14
LB_938:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_974
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_717
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _nil {  } ⊢ %_718 : %_718
 ; {>  %_717~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_719 : %_719
 ; {>  %_718~°1◂{  }:(_lst)◂(t370'(0)) %_717~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_719
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_719 %_718 } ⊢ %_720 : %_720
 ; {>  %_718~°1◂{  }:(_lst)◂(t370'(0)) %_719~1':_r64 %_717~0':_stg }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_720
 ; {>  %_720~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t374'(0)) }) %_717~0':_stg }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_965
	mov rdi,r13
	call dlt
LB_965:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_968
	btr r12,0
	jmp LB_969
LB_968:
	bts r12,0
LB_969:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_966
	btr QWORD [rdi],0
	jmp LB_967
LB_966:
	bts QWORD [rdi],0
LB_967:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_972
	mov rsi,0
	bt r13,0
	jc LB_972
	jmp LB_973
LB_972:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_973:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_970
	btr QWORD [rdi],1
	jmp LB_971
LB_970:
	bts QWORD [rdi],1
LB_971:
	mov r8,0
	bts r12,2
	ret
LB_974:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_976
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_975
LB_976:
	add rsp,8
	ret
NS_E_676_MTC_3_failed:
	add rsp,0
	pop r14
LB_975:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_677:
NS_E_RDI_677:
NS_E_677_ETR_TBL:
NS_E_677_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_989
	jmp LB_990
LB_989:
	jmp NS_E_677_MTC_0_failed
LB_990:
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
	jc LB_982
	btr r12,0
	jmp LB_983
LB_982:
	bts r12,0
LB_983:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_979
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_721 : %_721
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_721
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_721 ⊢ %_722 : %_722
 ; {>  %_721~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_722
 ; {>  %_722~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_977
	btr r12,3
	jmp LB_978
LB_977:
	bts r12,3
LB_978:
	mov r8,0
	bts r12,2
	ret
LB_979:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_981
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_980
LB_981:
	add rsp,8
	ret
NS_E_677_MTC_0_failed:
	add rsp,16
	pop r14
LB_980:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_1009
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_1009
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_1009
	jmp LB_1010
LB_1009:
	jmp NS_E_677_MTC_1_failed
LB_1010:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1014
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1015
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1015:
	jmp NS_E_677_MTC_1_failed
LB_1014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1020
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1021
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1021:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1022
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1022:
	jmp NS_E_677_MTC_1_failed
LB_1020:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1002
	btr r12,2
	jmp LB_1003
LB_1002:
	bts r12,2
LB_1003:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1000
	btr r12,1
	jmp LB_1001
LB_1000:
	bts r12,1
LB_1001:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_998
	btr r12,0
	jmp LB_999
LB_998:
	bts r12,0
LB_999:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_995
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_1024
	btr r12,3
	jmp LB_1025
LB_1024:
	bts r12,3
LB_1025:
	mov r14,r8
	bt r12,2
	jc LB_1026
	btr r12,1
	jmp LB_1027
LB_1026:
	bts r12,1
LB_1027:
	mov r8,r13
	bt r12,0
	jc LB_1028
	btr r12,2
	jmp LB_1029
LB_1028:
	bts r12,2
LB_1029:
	mov r13,r9
	bt r12,3
	jc LB_1030
	btr r12,0
	jmp LB_1031
LB_1030:
	bts r12,0
LB_1031:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_725 : %_725
 ; {>  %_723~0':_r64 %_724~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_725
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_725 %_723 } ⊢ { %_726 %_727 } : { %_726 %_727 }
 ; {>  %_723~0':_r64 %_725~2':_r64 %_724~1':_r64 }
	add r8,r13
; _f34 { %_726 %_724 } ⊢ { %_728 %_729 } : { %_728 %_729 }
 ; {>  %_727~0':_r64 %_726~2':_r64 %_724~1':_r64 }
	add r8,r14
; _some %_728 ⊢ %_730 : %_730
 ; {>  %_729~1':_r64 %_728~2':_r64 %_727~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_730
 ; {>  %_729~1':_r64 %_727~0':_r64 %_730~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_991
	mov rdi,r14
	call dlt
LB_991:
	bt r12,0
	jc LB_992
	mov rdi,r13
	call dlt
LB_992:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_993
	btr r12,3
	jmp LB_994
LB_993:
	bts r12,3
LB_994:
	mov r8,0
	bts r12,2
	ret
LB_995:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_997
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_996
LB_997:
	add rsp,8
	ret
NS_E_677_MTC_1_failed:
	add rsp,48
	pop r14
LB_996:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1046
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_677_MTC_2_failed
LB_1046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1051
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1052
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1052:
	jmp NS_E_677_MTC_2_failed
LB_1051:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1041
	btr r12,1
	jmp LB_1042
LB_1041:
	bts r12,1
LB_1042:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1039
	btr r12,0
	jmp LB_1040
LB_1039:
	bts r12,0
LB_1040:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1036
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_733 : %_733
 ; {>  %_731~0':_r64 %_732~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_733
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_733 %_732 } ⊢ { %_734 %_735 } : { %_734 %_735 }
 ; {>  %_731~0':_r64 %_732~1':_r64 %_733~2':_r64 }
	add r8,r14
; _some %_734 ⊢ %_736 : %_736
 ; {>  %_731~0':_r64 %_735~1':_r64 %_734~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_736
 ; {>  %_731~0':_r64 %_735~1':_r64 %_736~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1032
	mov rdi,r13
	call dlt
LB_1032:
	bt r12,1
	jc LB_1033
	mov rdi,r14
	call dlt
LB_1033:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1034
	btr r12,3
	jmp LB_1035
LB_1034:
	bts r12,3
LB_1035:
	mov r8,0
	bts r12,2
	ret
LB_1036:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1038
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1037
LB_1038:
	add rsp,8
	ret
NS_E_677_MTC_2_failed:
	add rsp,32
	pop r14
LB_1037:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_678:
NS_E_RDI_678:
NS_E_678_ETR_TBL:
NS_E_678_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1066
	jmp LB_1067
LB_1066:
	jmp NS_E_678_MTC_0_failed
LB_1067:
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
	jc LB_1059
	btr r12,0
	jmp LB_1060
LB_1059:
	bts r12,0
LB_1060:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1056
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_737 : %_737
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_737
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_737 ⊢ %_738 : %_738
 ; {>  %_737~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_738
 ; {>  %_738~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1054
	btr r12,3
	jmp LB_1055
LB_1054:
	bts r12,3
LB_1055:
	mov r8,0
	bts r12,2
	ret
LB_1056:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1058
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1057
LB_1058:
	add rsp,8
	ret
NS_E_678_MTC_0_failed:
	add rsp,16
	pop r14
LB_1057:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1082
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_678_MTC_1_failed
LB_1082:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1087
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1088
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1088:
	jmp NS_E_678_MTC_1_failed
LB_1087:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1077
	btr r12,1
	jmp LB_1078
LB_1077:
	bts r12,1
LB_1078:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1075
	btr r12,0
	jmp LB_1076
LB_1075:
	bts r12,0
LB_1076:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1072
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_741 : %_741
 ; {>  %_739~0':_r64 %_740~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_741
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_741 %_740 } ⊢ { %_742 %_743 } : { %_742 %_743 }
 ; {>  %_739~0':_r64 %_741~2':_r64 %_740~1':_r64 }
	add r8,r14
; _some %_742 ⊢ %_744 : %_744
 ; {>  %_739~0':_r64 %_743~1':_r64 %_742~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_744
 ; {>  %_739~0':_r64 %_743~1':_r64 %_744~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1068
	mov rdi,r13
	call dlt
LB_1068:
	bt r12,1
	jc LB_1069
	mov rdi,r14
	call dlt
LB_1069:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1070
	btr r12,3
	jmp LB_1071
LB_1070:
	bts r12,3
LB_1071:
	mov r8,0
	bts r12,2
	ret
LB_1072:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1074
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1073
LB_1074:
	add rsp,8
	ret
NS_E_678_MTC_1_failed:
	add rsp,32
	pop r14
LB_1073:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1112:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_1112:
MTC_LB_1113:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1114
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
	jnc LB_1115
	bt QWORD [rax],0
	jc LB_1116
	btr r12,7
	jmp LB_1117
LB_1116:
	bts r12,7
LB_1117:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1115:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1120
	btr r12,8
	jmp LB_1121
LB_1120:
	bts r12,8
LB_1121:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1118
	btr r12,5
	jmp LB_1119
LB_1118:
	bts r12,5
LB_1119:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1124
	btr r12,8
	jmp LB_1125
LB_1124:
	bts r12,8
LB_1125:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1122
	btr r12,6
	jmp LB_1123
LB_1122:
	bts r12,6
LB_1123:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1126:
	cmp r15,0
	jz LB_1127
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1126
LB_1127:
MTC_LB_1128:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1129
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
	jnc LB_1130
	bt QWORD [rax],0
	jc LB_1131
	btr r12,7
	jmp LB_1132
LB_1131:
	bts r12,7
LB_1132:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1130:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_1133
	btr r12,4
	jmp LB_1134
LB_1133:
	bts r12,4
LB_1134:
LB_1135:
	cmp r15,0
	jz LB_1136
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1135
LB_1136:
; _f36 %_1097 ⊢ { %_1098 %_1099 } : { %_1098 %_1099 }
 ; {>  %_1093~3':_r64 %_1090~0':_stg %_1092~2':_stg %_1096~6':(_lst)◂(_p673) %_1091~1':_r64 %_1097~4':_r64 }
	mov r11,r10
	bts r12,5
; _f18 { %_1099 %_1090 %_1091 %_1092 %_1093 } ⊢ { %_1100 %_1101 %_1102 %_1103 %_1104 } : { %_1100 %_1101 %_1102 %_1103 %_1104 }
 ; {>  %_1093~3':_r64 %_1090~0':_stg %_1098~4':_r64 %_1092~2':_stg %_1096~6':(_lst)◂(_p673) %_1099~5':_r64 %_1091~1':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_1141
	btr r12,4
	jmp LB_1142
LB_1141:
	bts r12,4
LB_1142:
	mov r9,r8
	bt r12,2
	jc LB_1143
	btr r12,3
	jmp LB_1144
LB_1143:
	bts r12,3
LB_1144:
	mov r8,r14
	bt r12,1
	jc LB_1145
	btr r12,2
	jmp LB_1146
LB_1145:
	bts r12,2
LB_1146:
	mov r14,r13
	bt r12,0
	jc LB_1147
	btr r12,1
	jmp LB_1148
LB_1147:
	bts r12,1
LB_1148:
	mov r13,r11
	bt r12,5
	jc LB_1149
	btr r12,0
	jmp LB_1150
LB_1149:
	bts r12,0
LB_1150:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_1151
	btr r12,5
	jmp LB_1152
LB_1151:
	bts r12,5
LB_1152:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1139
	btr r12,6
	jmp LB_1140
LB_1139:
	bts r12,6
LB_1140:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1137
	btr r12,4
	jmp LB_1138
LB_1137:
	bts r12,4
LB_1138:
	add rsp,24
; _f1112 { %_1101 %_1102 %_1103 %_1104 %_1096 } ⊢ { %_1105 %_1106 } : { %_1105 %_1106 }
 ; {>  %_1100~0':_r64 %_1098~4':_r64 %_1104~5':_r64 %_1101~1':_stg %_1103~3':_stg %_1102~2':_r64 %_1096~6':(_lst)◂(_p673) }
; _f1112 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_1157
	btr r12,0
	jmp LB_1158
LB_1157:
	bts r12,0
LB_1158:
	mov r14,r8
	bt r12,2
	jc LB_1159
	btr r12,1
	jmp LB_1160
LB_1159:
	bts r12,1
LB_1160:
	mov r8,r9
	bt r12,3
	jc LB_1161
	btr r12,2
	jmp LB_1162
LB_1161:
	bts r12,2
LB_1162:
	mov r9,r11
	bt r12,5
	jc LB_1163
	btr r12,3
	jmp LB_1164
LB_1163:
	bts r12,3
LB_1164:
	mov r10,rcx
	bt r12,6
	jc LB_1165
	btr r12,4
	jmp LB_1166
LB_1165:
	bts r12,4
LB_1166:
	call NS_E_1112
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1167
	btr r12,2
	jmp LB_1168
LB_1167:
	bts r12,2
LB_1168:
	mov r14,r13
	bt r12,0
	jc LB_1169
	btr r12,1
	jmp LB_1170
LB_1169:
	bts r12,1
LB_1170:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_1155
	btr r12,4
	jmp LB_1156
LB_1155:
	bts r12,4
LB_1156:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1153
	btr r12,0
	jmp LB_1154
LB_1153:
	bts r12,0
LB_1154:
	add rsp,24
; ∎ { %_1105 %_1106 }
 ; {>  %_1106~2':_stg %_1100~0':_r64 %_1098~4':_r64 %_1105~1':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_1171
	mov rdi,r13
	call dlt
LB_1171:
	bt r12,4
	jc LB_1172
	mov rdi,r10
	call dlt
LB_1172:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_1173
	btr r12,0
	jmp LB_1174
LB_1173:
	bts r12,0
LB_1174:
	mov r14,r8
	bt r12,2
	jc LB_1175
	btr r12,1
	jmp LB_1176
LB_1175:
	bts r12,1
LB_1176:
	ret
MTC_LB_1129:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1177
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
	jnc LB_1178
	bt QWORD [rax],0
	jc LB_1179
	btr r12,7
	jmp LB_1180
LB_1179:
	bts r12,7
LB_1180:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1178:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_1181
	btr r12,4
	jmp LB_1182
LB_1181:
	bts r12,4
LB_1182:
LB_1183:
	cmp r15,0
	jz LB_1184
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1183
LB_1184:
; _f34 { %_1091 %_1107 } ⊢ { %_1108 %_1109 } : { %_1108 %_1109 }
 ; {>  %_1093~3':_r64 %_1090~0':_stg %_1092~2':_stg %_1096~6':(_lst)◂(_p673) %_1091~1':_r64 %_1107~4':_r64 }
	add r14,r10
; _f1112 { %_1090 %_1108 %_1092 %_1093 %_1096 } ⊢ { %_1110 %_1111 } : { %_1110 %_1111 }
 ; {>  %_1109~4':_r64 %_1108~1':_r64 %_1093~3':_r64 %_1090~0':_stg %_1092~2':_stg %_1096~6':(_lst)◂(_p673) }
; _f1112 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_1187
	btr r12,4
	jmp LB_1188
LB_1187:
	bts r12,4
LB_1188:
	call NS_E_1112
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1185
	btr r12,4
	jmp LB_1186
LB_1185:
	bts r12,4
LB_1186:
	add rsp,16
; ∎ { %_1110 %_1111 }
 ; {>  %_1109~4':_r64 %_1110~0':_stg %_1111~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_1189
	mov rdi,r10
	call dlt
LB_1189:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1177:
MTC_LB_1114:
	mov r15,0
LB_1191:
	cmp r15,0
	jz LB_1192
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1191
LB_1192:
; ∎ { %_1090 %_1092 }
 ; {>  %_1093~3':_r64 %_1090~0':_stg %_1094~4':(_lst)◂(_p673) %_1092~2':_stg %_1091~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_1193
	mov rdi,r9
	call dlt
LB_1193:
	bt r12,4
	jc LB_1194
	mov rdi,r10
	call dlt
LB_1194:
	bt r12,1
	jc LB_1195
	mov rdi,r14
	call dlt
LB_1195:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1196
	btr r12,1
	jmp LB_1197
LB_1196:
	bts r12,1
LB_1197:
	ret
MTC_LB_1190:
NS_E_1213:
; 	|» 0'
NS_E_RDI_1213:
; » 0xr0 |~ {  } ⊢ %_1199 : %_1199
 ; {>  %_1198~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1199
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f676 { %_1198 %_1199 } ⊢ { %_1200 %_1201 %_1202 } : { %_1200 %_1201 %_1202 }
 ; {>  %_1199~1':_r64 %_1198~0':_stg }
; _f676 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_676
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1214
	btr r12,4
	jmp LB_1215
LB_1214:
	bts r12,4
LB_1215:
	mov r8,r9
	bt r12,3
	jc LB_1218
	btr r12,2
	jmp LB_1219
LB_1218:
	bts r12,2
LB_1219:
	mov rsi,1
	bt r12,2
	jc LB_1216
	mov rsi,0
	bt r8,0
	jc LB_1216
	jmp LB_1217
LB_1216:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1217:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_1220:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1221
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
	jnc LB_1222
	bt QWORD [rax],0
	jc LB_1223
	btr r12,5
	jmp LB_1224
LB_1223:
	bts r12,5
LB_1224:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1222:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1227
	btr r12,6
	jmp LB_1228
LB_1227:
	bts r12,6
LB_1228:
	mov r9,rcx
	bt r12,6
	jc LB_1225
	btr r12,3
	jmp LB_1226
LB_1225:
	bts r12,3
LB_1226:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1231
	btr r12,6
	jmp LB_1232
LB_1231:
	bts r12,6
LB_1232:
	mov r10,rcx
	bt r12,6
	jc LB_1229
	btr r12,4
	jmp LB_1230
LB_1229:
	bts r12,4
LB_1230:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1233:
	cmp r15,0
	jz LB_1234
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1233
LB_1234:
; _f14 %_1203 ⊢ { %_1205 %_1206 } : { %_1205 %_1206 }
 ; {>  %_1203~3':_r64 %_1204~4':(_lst)◂(_p673) %_1201~1':_r64 %_1200~0':_stg }
; _f14 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1241
	btr r12,0
	jmp LB_1242
LB_1241:
	bts r12,0
LB_1242:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_1243
	btr r12,2
	jmp LB_1244
LB_1243:
	bts r12,2
LB_1244:
	mov r9,r14
	bt r12,1
	jc LB_1245
	btr r12,3
	jmp LB_1246
LB_1245:
	bts r12,3
LB_1246:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_1239
	btr r12,4
	jmp LB_1240
LB_1239:
	bts r12,4
LB_1240:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1237
	btr r12,1
	jmp LB_1238
LB_1237:
	bts r12,1
LB_1238:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1235
	btr r12,0
	jmp LB_1236
LB_1235:
	bts r12,0
LB_1236:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_1207 : %_1207
 ; {>  %_1206~3':_stg %_1204~4':(_lst)◂(_p673) %_1201~1':_r64 %_1200~0':_stg %_1205~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_1207
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_1208 : %_1208
 ; {>  %_1207~5':_r64 %_1206~3':_stg %_1204~4':(_lst)◂(_p673) %_1201~1':_r64 %_1200~0':_stg %_1205~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_1208
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f1112 { %_1200 %_1207 %_1206 %_1208 %_1204 } ⊢ { %_1209 %_1210 } : { %_1209 %_1210 }
 ; {>  %_1207~5':_r64 %_1206~3':_stg %_1208~6':_r64 %_1204~4':(_lst)◂(_p673) %_1201~1':_r64 %_1200~0':_stg %_1205~2':_r64 }
; _f1112 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_1251
	btr r12,1
	jmp LB_1252
LB_1251:
	bts r12,1
LB_1252:
	mov r8,r9
	bt r12,3
	jc LB_1253
	btr r12,2
	jmp LB_1254
LB_1253:
	bts r12,2
LB_1254:
	mov r9,rcx
	bt r12,6
	jc LB_1255
	btr r12,3
	jmp LB_1256
LB_1255:
	bts r12,3
LB_1256:
	call NS_E_1112
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1257
	btr r12,3
	jmp LB_1258
LB_1257:
	bts r12,3
LB_1258:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1249
	btr r12,2
	jmp LB_1250
LB_1249:
	bts r12,2
LB_1250:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1247
	btr r12,1
	jmp LB_1248
LB_1247:
	bts r12,1
LB_1248:
	add rsp,24
; _some %_1210 ⊢ %_1211 : %_1211
 ; {>  %_1210~3':_stg %_1209~0':_stg %_1201~1':_r64 %_1205~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_1209 %_1211 }
 ; {>  %_1211~°0◂3':(_opn)◂(_stg) %_1209~0':_stg %_1201~1':_r64 %_1205~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_1259
	mov rdi,r14
	call dlt
LB_1259:
	bt r12,2
	jc LB_1260
	mov rdi,r8
	call dlt
LB_1260:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1263
	btr r12,1
	jmp LB_1264
LB_1263:
	bts r12,1
LB_1264:
	mov rsi,1
	bt r12,1
	jc LB_1261
	mov rsi,0
	bt r14,0
	jc LB_1261
	jmp LB_1262
LB_1261:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1262:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1221:
	mov r15,0
LB_1266:
	cmp r15,0
	jz LB_1267
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1266
LB_1267:
; _none {  } ⊢ %_1212 : %_1212
 ; {>  %_1201~1':_r64 %_1202~2':(_opn)◂({ _r64 (_lst)◂(_p673) }) %_1200~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1200 %_1212 }
 ; {>  %_1212~°1◂{  }:(_opn)◂(t534'(0)) %_1201~1':_r64 %_1202~2':(_opn)◂({ _r64 (_lst)◂(_p673) }) %_1200~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_1268
	mov rdi,r14
	call dlt
LB_1268:
	bt r12,2
	jc LB_1269
	mov rdi,r8
	call dlt
LB_1269:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_1270
	mov rsi,0
	bt r14,0
	jc LB_1270
	jmp LB_1271
LB_1270:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1271:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1265:
NS_E_1277:
NS_E_RDI_1277:
; » _^ ..
	mov rax,51
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "##\n"
	mov rsi,0x_23
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "W"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "[# fdEF [# F #] jfioe 2 #]"
	mov rsi,0x_20_46_45_64_66_20_23_5b
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20_5d_23_20_46_20_23_5b
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_20_32_20_65_6f_69_66_6a
	mov QWORD [rdi+8*2],rsi
	mov rsi,0x_23
	mov BYTE [rdi+8*3+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*3+1],sil
	add rdi,26
; "FF## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_75_68_20_23_23_46_46
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_75_67_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+2],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+4],sil
	add rdi,21
; //
	mov r13,rax
	btr r12,0
; _f1213 %_1272 ⊢ { %_1273 %_1274 } : { %_1273 %_1274 }
 ; {>  %_1272~0':_stg }
; _f1213 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1213
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_1273 %_1274 } ⊢ { %_1275 %_1276 } : { %_1275 %_1276 }
 ; {>  %_1274~1':(_opn)◂(_stg) %_1273~0':_stg }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1278
	btr r12,2
	jmp LB_1279
LB_1278:
	bts r12,2
LB_1279:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1282
	btr r12,3
	jmp LB_1283
LB_1282:
	bts r12,3
LB_1283:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1280
	btr QWORD [rdi],0
	jmp LB_1281
LB_1280:
	bts QWORD [rdi],0
LB_1281:
	mov r9,r14
	bt r12,1
	jc LB_1286
	btr r12,3
	jmp LB_1287
LB_1286:
	bts r12,3
LB_1287:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1284
	btr QWORD [rdi],1
	jmp LB_1285
LB_1284:
	bts QWORD [rdi],1
LB_1285:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1288
	btr r12,2
	jmp LB_1289
LB_1288:
	bts r12,2
LB_1289:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1292
	btr r12,3
	jmp LB_1293
LB_1292:
	bts r12,3
LB_1293:
	mov r13,r9
	bt r12,3
	jc LB_1290
	btr r12,0
	jmp LB_1291
LB_1290:
	bts r12,0
LB_1291:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1296
	btr r12,3
	jmp LB_1297
LB_1296:
	bts r12,3
LB_1297:
	mov r14,r9
	bt r12,3
	jc LB_1294
	btr r12,1
	jmp LB_1295
LB_1294:
	bts r12,1
LB_1295:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1275~0':_stg %_1276~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_1298
	mov rdi,r13
	call dlt
LB_1298:
	bt r12,1
	jc LB_1299
	mov rdi,r14
	call dlt
LB_1299:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1301:
NS_E_RDI_1301:
NS_E_1301_ETR_TBL:
NS_E_1301_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1318
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1301_MTC_0_failed
LB_1318:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1326
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1326
	jmp LB_1327
LB_1326:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1324
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1324:
	jmp NS_E_1301_MTC_0_failed
LB_1327:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1331
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1332
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1332:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1333:
	jmp NS_E_1301_MTC_0_failed
LB_1331:
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
	jc LB_1311
	btr QWORD [rdi],2
LB_1311:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1312
	btr QWORD [rdi],1
LB_1312:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1313
	btr QWORD [rdi],0
LB_1313:
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
NS_E_1301_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1309
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1301_MTC_1_failed
LB_1309:
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
	jc LB_1304
	btr QWORD [rdi],0
LB_1304:
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
NS_E_1301_MTC_1_failed:
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
NS_E_1336:
NS_E_RDI_1336:
NS_E_1336_ETR_TBL:
NS_E_1336_TBL:
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
	jz LB_1360
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1336_MTC_0_failed
LB_1360:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1368
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1368
	jmp LB_1369
LB_1368:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1366
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1366:
	jmp NS_E_1336_MTC_0_failed
LB_1369:
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
	jc LB_1354
	btr QWORD [rdi],1
LB_1354:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1355
	btr QWORD [rdi],0
LB_1355:
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
NS_E_1336_MTC_0_failed:
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
	jz LB_1352
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1336_MTC_1_failed
LB_1352:
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
	jc LB_1347
	btr QWORD [rdi],0
LB_1347:
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
NS_E_1336_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1345
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1336_MTC_2_failed
LB_1345:
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
	jc LB_1340
	btr QWORD [rdi],0
LB_1340:
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
NS_E_1336_MTC_2_failed:
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
NS_E_1371:
NS_E_RDI_1371:
NS_E_1371_ETR_TBL:
NS_E_1371_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_1377
LB_1376:
	add r14,1
LB_1377:
	cmp r14,r10
	jge LB_1378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1376
	cmp al,32
	jz LB_1376
LB_1378:
	add r14,1
	cmp r14,r10
	jg LB_1381
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1381
	jmp LB_1382
LB_1381:
	jmp NS_E_1371_MTC_0_failed
LB_1382:
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
LB_1387:
	jmp LB_1384
LB_1383:
	add r14,1
LB_1384:
	cmp r14,r10
	jge LB_1385
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1383
	cmp al,32
	jz LB_1383
LB_1385:
	add r14,1
	cmp r14,r10
	jg LB_1386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1386
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
	jmp LB_1387
LB_1386:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1373
	btr QWORD [rdi],1
LB_1373:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1374
	btr QWORD [rdi],0
LB_1374:
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
NS_E_1371_MTC_0_failed:
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
NS_E_1389:
NS_E_RDI_1389:
NS_E_1389_ETR_TBL:
NS_E_1389_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_1435
LB_1434:
	add r14,1
LB_1435:
	cmp r14,r10
	jge LB_1436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1434
	cmp al,10
	jz LB_1434
	cmp al,32
	jz LB_1434
LB_1436:
	add r14,4
	cmp r14,r10
	jg LB_1439
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1439
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1439
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1439
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1439
	jmp LB_1440
LB_1439:
	jmp NS_E_1389_MTC_0_failed
LB_1440:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1442
LB_1441:
	add r14,1
LB_1442:
	cmp r14,r10
	jge LB_1443
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1441
	cmp al,10
	jz LB_1441
	cmp al,32
	jz LB_1441
LB_1443:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1444
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1445
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1445:
	jmp NS_E_1389_MTC_0_failed
LB_1444:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	call LB_1398
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1431
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1432
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1432:
NS_E_1389_MTC_0_failed:
	add rsp,32
	pop r14
	jmp LB_1399
LB_1398:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_1419
LB_1418:
	add r14,1
LB_1419:
	cmp r14,r10
	jge LB_1420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1418
	cmp al,10
	jz LB_1418
	cmp al,32
	jz LB_1418
LB_1420:
	add r14,1
	cmp r14,r10
	jg LB_1423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1423
	jmp LB_1424
LB_1423:
	jmp NS_E_1400_MTC_0_failed
LB_1424:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_1426
LB_1425:
	add r14,1
LB_1426:
	cmp r14,r10
	jge LB_1427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1425
	cmp al,10
	jz LB_1425
	cmp al,32
	jz LB_1425
LB_1427:
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1428
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1429:
	jmp NS_E_1400_MTC_0_failed
LB_1428:
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
	jc LB_1412
	btr QWORD [rdi],1
LB_1412:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1413
	btr QWORD [rdi],0
LB_1413:
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
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1415
	btr QWORD [rdi],1
LB_1415:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1416
	btr QWORD [rdi],0
LB_1416:
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
NS_E_1400_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ mdl_glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_1410:
	jmp LB_1407
LB_1406:
	add r14,1
LB_1407:
	cmp r14,r10
	jge LB_1408
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1406
	cmp al,10
	jz LB_1406
	cmp al,32
	jz LB_1406
LB_1408:
	push r10
	push rsi
	call NS_E_1391_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_1409
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_1411
	bts QWORD [rax],0
LB_1411:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_1410
LB_1409:
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
	jc LB_1401
	btr QWORD [rdi],0
LB_1401:
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
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1403
	btr QWORD [rdi],1
LB_1403:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1404
	btr QWORD [rdi],0
LB_1404:
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
NS_E_1400_MTC_1_failed:
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
LB_1399:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1391:
NS_E_RDI_1391:
NS_E_1391_ETR_TBL:
NS_E_1391_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_1457
LB_1456:
	add r14,1
LB_1457:
	cmp r14,r10
	jge LB_1458
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1456
	cmp al,10
	jz LB_1456
	cmp al,32
	jz LB_1456
LB_1458:
	add r14,6
	cmp r14,r10
	jg LB_1461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1461
	jmp LB_1462
LB_1461:
	jmp NS_E_1391_MTC_0_failed
LB_1462:
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
	jc LB_1454
	btr QWORD [rdi],0
LB_1454:
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
NS_E_1391_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; glb_etr
	push r10
	call NS_E_1389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1452
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1391_MTC_1_failed
LB_1452:
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
	jc LB_1447
	btr QWORD [rdi],0
LB_1447:
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
NS_E_1391_MTC_1_failed:
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
NS_E_1471:
NS_E_RDI_1471:
; » _^ ..
	mov rax,14
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 = m1 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+5],sil
	add rdi,14
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_1464 : %_1464
 ; {>  %_1463~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1464
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f1389 { %_1463 %_1464 } ⊢ { %_1465 %_1466 %_1467 } : { %_1465 %_1466 %_1467 }
 ; {>  %_1464~1':_r64 %_1463~0':_stg }
; _f1389 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1389
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1472
	btr r12,4
	jmp LB_1473
LB_1472:
	bts r12,4
LB_1473:
	mov r8,r9
	bt r12,3
	jc LB_1476
	btr r12,2
	jmp LB_1477
LB_1476:
	bts r12,2
LB_1477:
	mov rsi,1
	bt r12,2
	jc LB_1474
	mov rsi,0
	bt r8,0
	jc LB_1474
	jmp LB_1475
LB_1474:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1475:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_1465 %_1466 %_1467 } ⊢ { %_1468 %_1469 %_1470 } : { %_1468 %_1469 %_1470 }
 ; {>  %_1466~1':_r64 %_1467~2':(_opn)◂(_p1388) %_1465~0':_stg }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_1478
	btr r12,3
	jmp LB_1479
LB_1478:
	bts r12,3
LB_1479:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_1482
	btr r12,4
	jmp LB_1483
LB_1482:
	bts r12,4
LB_1483:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1480
	btr QWORD [rdi],0
	jmp LB_1481
LB_1480:
	bts QWORD [rdi],0
LB_1481:
	mov r10,r14
	bt r12,1
	jc LB_1486
	btr r12,4
	jmp LB_1487
LB_1486:
	bts r12,4
LB_1487:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1484
	btr QWORD [rdi],1
	jmp LB_1485
LB_1484:
	bts QWORD [rdi],1
LB_1485:
	mov r10,r8
	bt r12,2
	jc LB_1490
	btr r12,4
	jmp LB_1491
LB_1490:
	bts r12,4
LB_1491:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_1488
	btr QWORD [rdi],2
	jmp LB_1489
LB_1488:
	bts QWORD [rdi],2
LB_1489:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_1492
	btr r12,3
	jmp LB_1493
LB_1492:
	bts r12,3
LB_1493:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1496
	btr r12,4
	jmp LB_1497
LB_1496:
	bts r12,4
LB_1497:
	mov r13,r10
	bt r12,4
	jc LB_1494
	btr r12,0
	jmp LB_1495
LB_1494:
	bts r12,0
LB_1495:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1500
	btr r12,4
	jmp LB_1501
LB_1500:
	bts r12,4
LB_1501:
	mov r14,r10
	bt r12,4
	jc LB_1498
	btr r12,1
	jmp LB_1499
LB_1498:
	bts r12,1
LB_1499:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_1504
	btr r12,4
	jmp LB_1505
LB_1504:
	bts r12,4
LB_1505:
	mov r8,r10
	bt r12,4
	jc LB_1502
	btr r12,2
	jmp LB_1503
LB_1502:
	bts r12,2
LB_1503:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1470~2':(_opn)◂(_p1388) %_1468~0':_stg %_1469~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1506
	mov rdi,r8
	call dlt
LB_1506:
	bt r12,0
	jc LB_1507
	mov rdi,r13
	call dlt
LB_1507:
	bt r12,1
	jc LB_1508
	mov rdi,r14
	call dlt
LB_1508:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1510:
NS_E_RDI_1510:
NS_E_1510_ETR_TBL:
NS_E_1510_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_1512_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1510_MTC_0_failed
LB_1582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_1510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1587
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1588:
	jmp NS_E_1510_MTC_0_failed
LB_1587:
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
	jc LB_1576
	btr QWORD [rdi],1
LB_1576:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1577
	btr QWORD [rdi],0
LB_1577:
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
NS_E_1510_MTC_0_failed:
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
NS_E_1510_MTC_1_failed:
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
NS_E_1512:
NS_E_RDI_1512:
NS_E_1512_ETR_TBL:
NS_E_1512_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1793
LB_1792:
	add r14,1
LB_1793:
	cmp r14,r10
	jge LB_1794
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1792
	cmp al,10
	jz LB_1792
	cmp al,32
	jz LB_1792
LB_1794:
	add r14,4
	cmp r14,r10
	jg LB_1797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1797
	jmp LB_1798
LB_1797:
	jmp NS_E_1512_MTC_0_failed
LB_1798:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1800
LB_1799:
	add r14,1
LB_1800:
	cmp r14,r10
	jge LB_1801
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1799
	cmp al,10
	jz LB_1799
	cmp al,32
	jz LB_1799
LB_1801:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1802
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1803
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1803:
	jmp NS_E_1512_MTC_0_failed
LB_1802:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1806
LB_1805:
	add r14,1
LB_1806:
	cmp r14,r10
	jge LB_1807
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1805
	cmp al,10
	jz LB_1805
	cmp al,32
	jz LB_1805
LB_1807:
	add r14,1
	cmp r14,r10
	jg LB_1812
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1812
	jmp LB_1813
LB_1812:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1809
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1809:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1810:
	jmp NS_E_1512_MTC_0_failed
LB_1813:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1815
LB_1814:
	add r14,1
LB_1815:
	cmp r14,r10
	jge LB_1816
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1814
	cmp al,10
	jz LB_1814
	cmp al,32
	jz LB_1814
LB_1816:
	push r10
	call NS_E_1516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1817
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1818
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1818:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1819
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1819:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1820
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1820:
	jmp NS_E_1512_MTC_0_failed
LB_1817:
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
	jc LB_1787
	btr QWORD [rdi],3
LB_1787:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1788
	btr QWORD [rdi],2
LB_1788:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1789
	btr QWORD [rdi],1
LB_1789:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1790
	btr QWORD [rdi],0
LB_1790:
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
NS_E_1512_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1758
LB_1757:
	add r14,1
LB_1758:
	cmp r14,r10
	jge LB_1759
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1757
	cmp al,10
	jz LB_1757
	cmp al,32
	jz LB_1757
LB_1759:
	add r14,4
	cmp r14,r10
	jg LB_1762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1762
	jmp LB_1763
LB_1762:
	jmp NS_E_1512_MTC_1_failed
LB_1763:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1765
LB_1764:
	add r14,1
LB_1765:
	cmp r14,r10
	jge LB_1766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1764
	cmp al,10
	jz LB_1764
	cmp al,32
	jz LB_1764
LB_1766:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1767
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1768:
	jmp NS_E_1512_MTC_1_failed
LB_1767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_1771
LB_1770:
	add r14,1
LB_1771:
	cmp r14,r10
	jge LB_1772
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1770
	cmp al,10
	jz LB_1770
	cmp al,32
	jz LB_1770
LB_1772:
	push r10
	call NS_E_1510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1773
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1774
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1774:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1775
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1775:
	jmp NS_E_1512_MTC_1_failed
LB_1773:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_1778
LB_1777:
	add r14,1
LB_1778:
	cmp r14,r10
	jge LB_1779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1777
	cmp al,10
	jz LB_1777
	cmp al,32
	jz LB_1777
LB_1779:
	add r14,6
	cmp r14,r10
	jg LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1785
	jmp LB_1786
LB_1785:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1781
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1781:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1782
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1782:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1783
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1783:
	jmp NS_E_1512_MTC_1_failed
LB_1786:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1752
	btr QWORD [rdi],3
LB_1752:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1753
	btr QWORD [rdi],2
LB_1753:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1754
	btr QWORD [rdi],1
LB_1754:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1755
	btr QWORD [rdi],0
LB_1755:
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
NS_E_1512_MTC_1_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1723
LB_1722:
	add r14,1
LB_1723:
	cmp r14,r10
	jge LB_1724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1722
	cmp al,10
	jz LB_1722
	cmp al,32
	jz LB_1722
LB_1724:
	add r14,2
	cmp r14,r10
	jg LB_1727
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1727
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1727
	jmp LB_1728
LB_1727:
	jmp NS_E_1512_MTC_2_failed
LB_1728:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1730
LB_1729:
	add r14,1
LB_1730:
	cmp r14,r10
	jge LB_1731
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1729
	cmp al,10
	jz LB_1729
	cmp al,32
	jz LB_1729
LB_1731:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1732
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1733
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1733:
	jmp NS_E_1512_MTC_2_failed
LB_1732:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1736
LB_1735:
	add r14,1
LB_1736:
	cmp r14,r10
	jge LB_1737
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1735
	cmp al,10
	jz LB_1735
	cmp al,32
	jz LB_1735
LB_1737:
	add r14,1
	cmp r14,r10
	jg LB_1742
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1742
	jmp LB_1743
LB_1742:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1739
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1739:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1740:
	jmp NS_E_1512_MTC_2_failed
LB_1743:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_1745
LB_1744:
	add r14,1
LB_1745:
	cmp r14,r10
	jge LB_1746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1744
	cmp al,10
	jz LB_1744
	cmp al,32
	jz LB_1744
LB_1746:
	push r10
	call NS_E_1514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1747
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1748
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1748:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1749
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1749:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1750
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1750:
	jmp NS_E_1512_MTC_2_failed
LB_1747:
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
	jc LB_1717
	btr QWORD [rdi],3
LB_1717:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1718
	btr QWORD [rdi],2
LB_1718:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1719
	btr QWORD [rdi],1
LB_1719:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1720
	btr QWORD [rdi],0
LB_1720:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1512_MTC_2_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1688
LB_1687:
	add r14,1
LB_1688:
	cmp r14,r10
	jge LB_1689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1687
	cmp al,10
	jz LB_1687
	cmp al,32
	jz LB_1687
LB_1689:
	add r14,2
	cmp r14,r10
	jg LB_1692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1692
	jmp LB_1693
LB_1692:
	jmp NS_E_1512_MTC_3_failed
LB_1693:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1695
LB_1694:
	add r14,1
LB_1695:
	cmp r14,r10
	jge LB_1696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1694
	cmp al,10
	jz LB_1694
	cmp al,32
	jz LB_1694
LB_1696:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1697
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1698:
	jmp NS_E_1512_MTC_3_failed
LB_1697:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_1701
LB_1700:
	add r14,1
LB_1701:
	cmp r14,r10
	jge LB_1702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1700
	cmp al,10
	jz LB_1700
	cmp al,32
	jz LB_1700
LB_1702:
	add r14,2
	cmp r14,r10
	jg LB_1707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1707
	jmp LB_1708
LB_1707:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1704
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1705:
	jmp NS_E_1512_MTC_3_failed
LB_1708:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_1710
LB_1709:
	add r14,1
LB_1710:
	cmp r14,r10
	jge LB_1711
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1709
	cmp al,10
	jz LB_1709
	cmp al,32
	jz LB_1709
LB_1711:
	push r10
	call NS_E_1522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1712
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1713
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1713:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1714
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1714:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1715
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1715:
	jmp NS_E_1512_MTC_3_failed
LB_1712:
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
	jc LB_1682
	btr QWORD [rdi],3
LB_1682:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1683
	btr QWORD [rdi],2
LB_1683:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1684
	btr QWORD [rdi],1
LB_1684:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1685
	btr QWORD [rdi],0
LB_1685:
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
NS_E_1512_MTC_3_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1655
LB_1654:
	add r14,1
LB_1655:
	cmp r14,r10
	jge LB_1656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1654
	cmp al,10
	jz LB_1654
	cmp al,32
	jz LB_1654
LB_1656:
	add r14,2
	cmp r14,r10
	jg LB_1659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1659
	jmp LB_1660
LB_1659:
	jmp NS_E_1512_MTC_4_failed
LB_1660:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1662
LB_1661:
	add r14,1
LB_1662:
	cmp r14,r10
	jge LB_1663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1661
	cmp al,10
	jz LB_1661
	cmp al,32
	jz LB_1661
LB_1663:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1664
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1665
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1665:
	jmp NS_E_1512_MTC_4_failed
LB_1664:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_1668
LB_1667:
	add r14,1
LB_1668:
	cmp r14,r10
	jge LB_1669
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1667
	cmp al,10
	jz LB_1667
	cmp al,32
	jz LB_1667
LB_1669:
	push r10
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1670
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1671
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1671:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1672
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1672:
	jmp NS_E_1512_MTC_4_failed
LB_1670:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_1675
LB_1674:
	add r14,1
LB_1675:
	cmp r14,r10
	jge LB_1676
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1674
	cmp al,10
	jz LB_1674
	cmp al,32
	jz LB_1674
LB_1676:
	push r10
	call NS_E_1522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1677
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1678
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1678:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1679
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1679:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1680
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1680:
	jmp NS_E_1512_MTC_4_failed
LB_1677:
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
	jc LB_1649
	btr QWORD [rdi],3
LB_1649:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1650
	btr QWORD [rdi],2
LB_1650:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1651
	btr QWORD [rdi],1
LB_1651:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1652
	btr QWORD [rdi],0
LB_1652:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0400_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1512_MTC_4_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_1620
LB_1619:
	add r14,1
LB_1620:
	cmp r14,r10
	jge LB_1621
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1619
	cmp al,10
	jz LB_1619
	cmp al,32
	jz LB_1619
LB_1621:
	add r14,2
	cmp r14,r10
	jg LB_1624
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1624
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1624
	jmp LB_1625
LB_1624:
	jmp NS_E_1512_MTC_5_failed
LB_1625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1627
LB_1626:
	add r14,1
LB_1627:
	cmp r14,r10
	jge LB_1628
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1626
	cmp al,10
	jz LB_1626
	cmp al,32
	jz LB_1626
LB_1628:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1629
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1630
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1630:
	jmp NS_E_1512_MTC_5_failed
LB_1629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1633
LB_1632:
	add r14,1
LB_1633:
	cmp r14,r10
	jge LB_1634
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1632
	cmp al,10
	jz LB_1632
	cmp al,32
	jz LB_1632
LB_1634:
	add r14,1
	cmp r14,r10
	jg LB_1639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1639
	jmp LB_1640
LB_1639:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1636
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1636:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1637
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1637:
	jmp NS_E_1512_MTC_5_failed
LB_1640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1642
LB_1641:
	add r14,1
LB_1642:
	cmp r14,r10
	jge LB_1643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1641
	cmp al,10
	jz LB_1641
	cmp al,32
	jz LB_1641
LB_1643:
	push r10
	call NS_E_1516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1644
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1645
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1645:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1646
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1646:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1647
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1647:
	jmp NS_E_1512_MTC_5_failed
LB_1644:
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
	jc LB_1614
	btr QWORD [rdi],3
LB_1614:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1615
	btr QWORD [rdi],2
LB_1615:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1616
	btr QWORD [rdi],1
LB_1616:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1617
	btr QWORD [rdi],0
LB_1617:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0500_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1512_MTC_5_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_1595
LB_1594:
	add r14,1
LB_1595:
	cmp r14,r10
	jge LB_1596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1594
	cmp al,10
	jz LB_1594
	cmp al,32
	jz LB_1594
LB_1596:
	add r14,2
	cmp r14,r10
	jg LB_1599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1599
	jmp LB_1600
LB_1599:
	jmp NS_E_1512_MTC_6_failed
LB_1600:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1602
LB_1601:
	add r14,1
LB_1602:
	cmp r14,r10
	jge LB_1603
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1601
	cmp al,10
	jz LB_1601
	cmp al,32
	jz LB_1601
LB_1603:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1604
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1605
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1605:
	jmp NS_E_1512_MTC_6_failed
LB_1604:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_1608
LB_1607:
	add r14,1
LB_1608:
	cmp r14,r10
	jge LB_1609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1607
	cmp al,10
	jz LB_1607
	cmp al,32
	jz LB_1607
LB_1609:
	push r10
	call NS_E_1518_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1610
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1611
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1611:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1612
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1612:
	jmp NS_E_1512_MTC_6_failed
LB_1610:
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
	jc LB_1590
	btr QWORD [rdi],2
LB_1590:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1591
	btr QWORD [rdi],1
LB_1591:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1592
	btr QWORD [rdi],0
LB_1592:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0600_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1512_MTC_6_failed:
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
NS_E_1514:
NS_E_RDI_1514:
NS_E_1514_ETR_TBL:
NS_E_1514_TBL:
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
	jz LB_1842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1514_MTC_0_failed
LB_1842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1850
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1850
	jmp LB_1851
LB_1850:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1848:
	jmp NS_E_1514_MTC_0_failed
LB_1851:
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
	jc LB_1836
	btr QWORD [rdi],1
LB_1836:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1837
	btr QWORD [rdi],0
LB_1837:
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
NS_E_1514_MTC_0_failed:
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
	jz LB_1834
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1514_MTC_1_failed
LB_1834:
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
	jc LB_1829
	btr QWORD [rdi],0
LB_1829:
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
NS_E_1514_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1827
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1514_MTC_2_failed
LB_1827:
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
	jc LB_1822
	btr QWORD [rdi],0
LB_1822:
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
NS_E_1514_MTC_2_failed:
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
NS_E_1516:
NS_E_RDI_1516:
NS_E_1516_ETR_TBL:
NS_E_1516_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1897
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1516_MTC_0_failed
LB_1897:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1905
	jmp LB_1906
LB_1905:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1903
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1903:
	jmp NS_E_1516_MTC_0_failed
LB_1906:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1910
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1911
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1911:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1912
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1912:
	jmp NS_E_1516_MTC_0_failed
LB_1910:
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
	jc LB_1890
	btr QWORD [rdi],2
LB_1890:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1891
	btr QWORD [rdi],1
LB_1891:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1892
	btr QWORD [rdi],0
LB_1892:
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
NS_E_1516_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1873
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1516_MTC_1_failed
LB_1873:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1881
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1881
	jmp LB_1882
LB_1881:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1879
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1879:
	jmp NS_E_1516_MTC_1_failed
LB_1882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1886
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1887
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1887:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1888
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1888:
	jmp NS_E_1516_MTC_1_failed
LB_1886:
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
	jc LB_1866
	btr QWORD [rdi],2
LB_1866:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1867
	btr QWORD [rdi],1
LB_1867:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1868
	btr QWORD [rdi],0
LB_1868:
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
NS_E_1516_MTC_1_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1864
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1516_MTC_2_failed
LB_1864:
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
	jc LB_1859
	btr QWORD [rdi],0
LB_1859:
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
NS_E_1516_MTC_2_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1857
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1516_MTC_3_failed
LB_1857:
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
	jc LB_1852
	btr QWORD [rdi],0
LB_1852:
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
NS_E_1516_MTC_3_failed:
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
NS_E_1518:
NS_E_RDI_1518:
NS_E_1518_ETR_TBL:
NS_E_1518_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_1926
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1926
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1926
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1926
	jmp LB_1927
LB_1926:
	jmp NS_E_1518_MTC_0_failed
LB_1927:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1931
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1932
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1932:
	jmp NS_E_1518_MTC_0_failed
LB_1931:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_1941
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1941
	jmp LB_1942
LB_1941:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1938
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1938:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1939
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1939:
	jmp NS_E_1518_MTC_0_failed
LB_1942:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_1526_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1946
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1947
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1947:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1949:
	jmp NS_E_1518_MTC_0_failed
LB_1946:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_1520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1954
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1955
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1955:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1956
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1956:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1957
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1957:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1958:
	jmp NS_E_1518_MTC_0_failed
LB_1954:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_1520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1963
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1964
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1964:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1965
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1965:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1966
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1966:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1967
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1967:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1968:
	jmp NS_E_1518_MTC_0_failed
LB_1963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_1914
	btr QWORD [rdi],5
LB_1914:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1915
	btr QWORD [rdi],4
LB_1915:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1916
	btr QWORD [rdi],3
LB_1916:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1917
	btr QWORD [rdi],2
LB_1917:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1918
	btr QWORD [rdi],1
LB_1918:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1919
	btr QWORD [rdi],0
LB_1919:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,104
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1518_MTC_0_failed:
	add rsp,96
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
NS_E_1520:
NS_E_RDI_1520:
NS_E_1520_ETR_TBL:
NS_E_1520_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_1978
LB_1977:
	add r14,1
LB_1978:
	cmp r14,r10
	jge LB_1979
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1977
	cmp al,10
	jz LB_1977
	cmp al,32
	jz LB_1977
LB_1979:
	add r14,3
	cmp r14,r10
	jg LB_1982
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1982
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1982
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1982
	jmp LB_1983
LB_1982:
	jmp NS_E_1520_MTC_0_failed
LB_1983:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1985
LB_1984:
	add r14,1
LB_1985:
	cmp r14,r10
	jge LB_1986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1984
	cmp al,10
	jz LB_1984
	cmp al,32
	jz LB_1984
LB_1986:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1987
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1988
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1988:
	jmp NS_E_1520_MTC_0_failed
LB_1987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_1991
LB_1990:
	add r14,1
LB_1991:
	cmp r14,r10
	jge LB_1992
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1990
	cmp al,10
	jz LB_1990
	cmp al,32
	jz LB_1990
LB_1992:
	add r14,1
	cmp r14,r10
	jg LB_1997
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1997
	jmp LB_1998
LB_1997:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1994
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1994:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1995
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1995:
	jmp NS_E_1520_MTC_0_failed
LB_1998:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_2000
LB_1999:
	add r14,1
LB_2000:
	cmp r14,r10
	jge LB_2001
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1999
	cmp al,10
	jz LB_1999
	cmp al,32
	jz LB_1999
LB_2001:
	push r10
	call NS_E_1526_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2002
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2003
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2003:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2004
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2004:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2005
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2005:
	jmp NS_E_1520_MTC_0_failed
LB_2002:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_2008
LB_2007:
	add r14,1
LB_2008:
	cmp r14,r10
	jge LB_2009
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2007
	cmp al,10
	jz LB_2007
	cmp al,32
	jz LB_2007
LB_2009:
	push r10
	call NS_E_1520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2010
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2011
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2011:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2012
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2012:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2013
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2013:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2014
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2014:
	jmp NS_E_1520_MTC_0_failed
LB_2010:
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
	jc LB_1971
	btr QWORD [rdi],4
LB_1971:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1972
	btr QWORD [rdi],3
LB_1972:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1973
	btr QWORD [rdi],2
LB_1973:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1974
	btr QWORD [rdi],1
LB_1974:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1975
	btr QWORD [rdi],0
LB_1975:
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
NS_E_1520_MTC_0_failed:
	add rsp,80
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
NS_E_1520_MTC_1_failed:
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
NS_E_1522:
NS_E_RDI_1522:
NS_E_1522_ETR_TBL:
NS_E_1522_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_2083
LB_2082:
	add r14,1
LB_2083:
	cmp r14,r10
	jge LB_2084
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2082
	cmp al,10
	jz LB_2082
	cmp al,32
	jz LB_2082
LB_2084:
	push r10
	call NS_E_1516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2085
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1522_MTC_0_failed
LB_2085:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
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
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2090
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2091:
	jmp NS_E_1522_MTC_0_failed
LB_2090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_2094
LB_2093:
	add r14,1
LB_2094:
	cmp r14,r10
	jge LB_2095
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2093
	cmp al,10
	jz LB_2093
	cmp al,32
	jz LB_2093
LB_2095:
	add r14,3
	cmp r14,r10
	jg LB_2100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2100
	jmp LB_2101
LB_2100:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2097
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2097:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2098:
	jmp NS_E_1522_MTC_0_failed
LB_2101:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2103
LB_2102:
	add r14,1
LB_2103:
	cmp r14,r10
	jge LB_2104
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2102
	cmp al,10
	jz LB_2102
	cmp al,32
	jz LB_2102
LB_2104:
	push r10
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2105
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2106
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2106:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2107
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2107:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2108
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2108:
	jmp NS_E_1522_MTC_0_failed
LB_2105:
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
	jc LB_2077
	btr QWORD [rdi],3
LB_2077:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2078
	btr QWORD [rdi],2
LB_2078:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2079
	btr QWORD [rdi],1
LB_2079:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2080
	btr QWORD [rdi],0
LB_2080:
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
NS_E_1522_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_2039
LB_2038:
	add r14,1
LB_2039:
	cmp r14,r10
	jge LB_2040
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2038
	cmp al,10
	jz LB_2038
	cmp al,32
	jz LB_2038
LB_2040:
	add r14,1
	cmp r14,r10
	jg LB_2043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_2043
	jmp LB_2044
LB_2043:
	jmp NS_E_1522_MTC_1_failed
LB_2044:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2046
LB_2045:
	add r14,1
LB_2046:
	cmp r14,r10
	jge LB_2047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2045
	cmp al,10
	jz LB_2045
	cmp al,32
	jz LB_2045
LB_2047:
	push r10
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2048
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2049
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2049:
	jmp NS_E_1522_MTC_1_failed
LB_2048:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
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
	add r14,3
	cmp r14,r10
	jg LB_2058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2058
	jmp LB_2059
LB_2058:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2055
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2055:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2056
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2056:
	jmp NS_E_1522_MTC_1_failed
LB_2059:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2061
LB_2060:
	add r14,1
LB_2061:
	cmp r14,r10
	jge LB_2062
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2060
	cmp al,10
	jz LB_2060
	cmp al,32
	jz LB_2060
LB_2062:
	push r10
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2063
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2064
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2064:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2065
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2065:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2066
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2066:
	jmp NS_E_1522_MTC_1_failed
LB_2063:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_2069
LB_2068:
	add r14,1
LB_2069:
	cmp r14,r10
	jge LB_2070
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2068
	cmp al,10
	jz LB_2068
	cmp al,32
	jz LB_2068
LB_2070:
	push r10
	call NS_E_1524_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2071
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2072
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2072:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2073
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2073:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2074
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2074:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2075:
	jmp NS_E_1522_MTC_1_failed
LB_2071:
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
	jc LB_2032
	btr QWORD [rdi],4
LB_2032:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2033
	btr QWORD [rdi],3
LB_2033:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2034
	btr QWORD [rdi],2
LB_2034:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2035
	btr QWORD [rdi],1
LB_2035:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2036
	btr QWORD [rdi],0
LB_2036:
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
NS_E_1522_MTC_1_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
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
	add r14,3
	cmp r14,r10
	jg LB_2024
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2024
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_2024
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_2024
	jmp LB_2025
LB_2024:
	jmp NS_E_1522_MTC_2_failed
LB_2025:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2027
LB_2026:
	add r14,1
LB_2027:
	cmp r14,r10
	jge LB_2028
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2026
	cmp al,10
	jz LB_2026
	cmp al,32
	jz LB_2026
LB_2028:
	push r10
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2029
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2030:
	jmp NS_E_1522_MTC_2_failed
LB_2029:
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
	jc LB_2016
	btr QWORD [rdi],1
LB_2016:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2017
	btr QWORD [rdi],0
LB_2017:
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
NS_E_1522_MTC_2_failed:
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
NS_E_1524:
NS_E_RDI_1524:
NS_E_1524_ETR_TBL:
NS_E_1524_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_2114
LB_2113:
	add r14,1
LB_2114:
	cmp r14,r10
	jge LB_2115
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2113
	cmp al,10
	jz LB_2113
	cmp al,32
	jz LB_2113
LB_2115:
	add r14,1
	cmp r14,r10
	jg LB_2118
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_2118
	jmp LB_2119
LB_2118:
	jmp NS_E_1524_MTC_0_failed
LB_2119:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2121
LB_2120:
	add r14,1
LB_2121:
	cmp r14,r10
	jge LB_2122
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2120
	cmp al,10
	jz LB_2120
	cmp al,32
	jz LB_2120
LB_2122:
	push r10
	call NS_E_1534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2123
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2124
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2124:
	jmp NS_E_1524_MTC_0_failed
LB_2123:
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
	jc LB_2110
	btr QWORD [rdi],1
LB_2110:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2111
	btr QWORD [rdi],0
LB_2111:
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
NS_E_1524_MTC_0_failed:
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
NS_E_1526:
NS_E_RDI_1526:
NS_E_1526_ETR_TBL:
NS_E_1526_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_1528_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2131
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1526_MTC_0_failed
LB_2131:
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
	jc LB_2126
	btr QWORD [rdi],0
LB_2126:
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
NS_E_1526_MTC_0_failed:
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
NS_E_1528:
NS_E_RDI_1528:
NS_E_1528_ETR_TBL:
NS_E_1528_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_2145
LB_2144:
	add r14,1
LB_2145:
	cmp r14,r10
	jge LB_2146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2144
	cmp al,10
	jz LB_2144
	cmp al,32
	jz LB_2144
LB_2146:
	push r10
	call NS_E_1530_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1528_MTC_0_failed
LB_2147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_2150
LB_2149:
	add r14,1
LB_2150:
	cmp r14,r10
	jge LB_2151
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2149
	cmp al,10
	jz LB_2149
	cmp al,32
	jz LB_2149
LB_2151:
	add r14,3
	cmp r14,r10
	jg LB_2155
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2155
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_2155
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_2155
	jmp LB_2156
LB_2155:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2153
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2153:
	jmp NS_E_1528_MTC_0_failed
LB_2156:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_2158
LB_2157:
	add r14,1
LB_2158:
	cmp r14,r10
	jge LB_2159
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2157
	cmp al,10
	jz LB_2157
	cmp al,32
	jz LB_2157
LB_2159:
	push r10
	call NS_E_1528_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2160
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2161
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2161:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2162
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2162:
	jmp NS_E_1528_MTC_0_failed
LB_2160:
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
	jc LB_2140
	btr QWORD [rdi],2
LB_2140:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2141
	btr QWORD [rdi],1
LB_2141:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2142
	btr QWORD [rdi],0
LB_2142:
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
NS_E_1528_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_2136
LB_2135:
	add r14,1
LB_2136:
	cmp r14,r10
	jge LB_2137
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2135
	cmp al,10
	jz LB_2135
	cmp al,32
	jz LB_2135
LB_2137:
	push r10
	call NS_E_1530_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2138
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1528_MTC_1_failed
LB_2138:
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
	jc LB_2133
	btr QWORD [rdi],0
LB_2133:
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
NS_E_1528_MTC_1_failed:
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
NS_E_1530:
NS_E_RDI_1530:
NS_E_1530_ETR_TBL:
NS_E_1530_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_2176
LB_2175:
	add r14,1
LB_2176:
	cmp r14,r10
	jge LB_2177
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2175
	cmp al,10
	jz LB_2175
	cmp al,32
	jz LB_2175
LB_2177:
	push r10
	call NS_E_1532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2178
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1530_MTC_0_failed
LB_2178:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_2181
LB_2180:
	add r14,1
LB_2181:
	cmp r14,r10
	jge LB_2182
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2180
	cmp al,10
	jz LB_2180
	cmp al,32
	jz LB_2180
LB_2182:
	add r14,3
	cmp r14,r10
	jg LB_2186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_2186
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_2186
	jmp LB_2187
LB_2186:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2184
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2184:
	jmp NS_E_1530_MTC_0_failed
LB_2187:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
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
	call NS_E_1532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2191
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2192
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2192:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2193
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2193:
	jmp NS_E_1530_MTC_0_failed
LB_2191:
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
	jc LB_2171
	btr QWORD [rdi],2
LB_2171:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2172
	btr QWORD [rdi],1
LB_2172:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2173
	btr QWORD [rdi],0
LB_2173:
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
NS_E_1530_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_2167
LB_2166:
	add r14,1
LB_2167:
	cmp r14,r10
	jge LB_2168
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2166
	cmp al,10
	jz LB_2166
	cmp al,32
	jz LB_2166
LB_2168:
	push r10
	call NS_E_1532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2169
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1530_MTC_1_failed
LB_2169:
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
	jc LB_2164
	btr QWORD [rdi],0
LB_2164:
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
NS_E_1530_MTC_1_failed:
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
NS_E_1532:
NS_E_RDI_1532:
NS_E_1532_ETR_TBL:
NS_E_1532_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2200
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1532_MTC_0_failed
LB_2200:
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
	jc LB_2195
	btr QWORD [rdi],0
LB_2195:
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
NS_E_1532_MTC_0_failed:
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
NS_E_1534:
NS_E_RDI_1534:
NS_E_1534_ETR_TBL:
NS_E_1534_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_2214
LB_2213:
	add r14,1
LB_2214:
	cmp r14,r10
	jge LB_2215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2213
	cmp al,10
	jz LB_2213
	cmp al,32
	jz LB_2213
LB_2215:
	add r14,1
	cmp r14,r10
	jg LB_2218
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_2218
	jmp LB_2219
LB_2218:
	jmp NS_E_1534_MTC_0_failed
LB_2219:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_2221
LB_2220:
	add r14,1
LB_2221:
	cmp r14,r10
	jge LB_2222
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2220
	cmp al,10
	jz LB_2220
	cmp al,32
	jz LB_2220
LB_2222:
	push r10
	call NS_E_1536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2223
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2224:
	jmp NS_E_1534_MTC_0_failed
LB_2223:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_2227
LB_2226:
	add r14,1
LB_2227:
	cmp r14,r10
	jge LB_2228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2226
	cmp al,10
	jz LB_2226
	cmp al,32
	jz LB_2226
LB_2228:
	add r14,1
	cmp r14,r10
	jg LB_2233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_2233
	jmp LB_2234
LB_2233:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2230
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2230:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2231
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2231:
	jmp NS_E_1534_MTC_0_failed
LB_2234:
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
	jc LB_2209
	btr QWORD [rdi],2
LB_2209:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2210
	btr QWORD [rdi],1
LB_2210:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2211
	btr QWORD [rdi],0
LB_2211:
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
NS_E_1534_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_2205
LB_2204:
	add r14,1
LB_2205:
	cmp r14,r10
	jge LB_2206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2204
	cmp al,10
	jz LB_2204
	cmp al,32
	jz LB_2204
LB_2206:
	push r10
	call NS_E_1538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2207
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1534_MTC_1_failed
LB_2207:
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
	jc LB_2202
	btr QWORD [rdi],0
LB_2202:
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
NS_E_1534_MTC_1_failed:
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
NS_E_1536:
NS_E_RDI_1536:
NS_E_1536_ETR_TBL:
NS_E_1536_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_2240
LB_2239:
	add r14,1
LB_2240:
	cmp r14,r10
	jge LB_2241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2239
	cmp al,10
	jz LB_2239
	cmp al,32
	jz LB_2239
LB_2241:
	push r10
	call NS_E_1538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2242
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1536_MTC_0_failed
LB_2242:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_2245
LB_2244:
	add r14,1
LB_2245:
	cmp r14,r10
	jge LB_2246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2244
	cmp al,10
	jz LB_2244
	cmp al,32
	jz LB_2244
LB_2246:
	push r10
	call NS_E_1536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2248
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2248:
	jmp NS_E_1536_MTC_0_failed
LB_2247:
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
	jc LB_2236
	btr QWORD [rdi],1
LB_2236:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2237
	btr QWORD [rdi],0
LB_2237:
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
NS_E_1536_MTC_0_failed:
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
NS_E_1536_MTC_1_failed:
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
NS_E_1538:
NS_E_RDI_1538:
NS_E_1538_ETR_TBL:
NS_E_1538_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_2274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_2274
	jmp LB_2275
LB_2274:
	jmp NS_E_1538_MTC_0_failed
LB_2275:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2279
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2280
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2280:
	jmp NS_E_1538_MTC_0_failed
LB_2279:
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
	jc LB_2266
	btr QWORD [rdi],1
LB_2266:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2267
	btr QWORD [rdi],0
LB_2267:
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
NS_E_1538_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_2262
LB_2261:
	add r14,1
LB_2262:
	cmp r14,r10
	jge LB_2263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2261
	cmp al,10
	jz LB_2261
	cmp al,32
	jz LB_2261
LB_2263:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2264
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1538_MTC_1_failed
LB_2264:
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
	jc LB_2259
	btr QWORD [rdi],0
LB_2259:
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
NS_E_1538_MTC_1_failed:
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
	jg LB_2257
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2257
	jmp LB_2258
LB_2257:
	jmp NS_E_1538_MTC_2_failed
LB_2258:
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
	jc LB_2250
	btr QWORD [rdi],0
LB_2250:
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
NS_E_1538_MTC_2_failed:
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
NS_E_2282:
NS_E_RDI_2282:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
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
	NS_E_DYN_334:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_334
	NS_E_DYN_372:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_372
	NS_E_DYN_410:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_410
	NS_E_DYN_448:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_448
	NS_E_DYN_477:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_477
	NS_E_DYN_478:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_478
	NS_E_DYN_479:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_479
	NS_E_DYN_612:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_612
	NS_E_DYN_668:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_669:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_671:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_672:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_674:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_675:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_676:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_676
	NS_E_DYN_677:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_677
	NS_E_DYN_678:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_678
	NS_E_DYN_1112:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1112
	NS_E_DYN_1213:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1213
	CST_DYN_1277:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_1471:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_2282:
		dq 0x0000_0001_00_82_ffff
		dq 1
