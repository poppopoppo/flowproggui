%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1271
	call NS_E_2079
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
; c0
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
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
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
NS_E_670:
NS_E_RDI_670:
NS_E_670_ETR_TBL:
NS_E_670_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_774
	jmp LB_775
LB_774:
	jmp NS_E_670_MTC_0_failed
LB_775:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_671_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_779
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_780:
	jmp NS_E_670_MTC_0_failed
LB_779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_785
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_786
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_786:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_787:
	jmp NS_E_670_MTC_0_failed
LB_785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_767
	btr r12,2
	jmp LB_768
LB_767:
	bts r12,2
LB_768:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_765
	btr r12,1
	jmp LB_766
LB_765:
	bts r12,1
LB_766:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_763
	btr r12,0
	jmp LB_764
LB_763:
	bts r12,0
LB_764:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_760
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_789
	btr r12,3
	jmp LB_790
LB_789:
	bts r12,3
LB_790:
	mov r13,r14
	bt r12,1
	jc LB_791
	btr r12,0
	jmp LB_792
LB_791:
	bts r12,0
LB_792:
	mov r10,r8
	bt r12,2
	jc LB_793
	btr r12,4
	jmp LB_794
LB_793:
	bts r12,4
LB_794:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_797
	btr r12,5
	jmp LB_798
LB_797:
	bts r12,5
LB_798:
	mov r14,r11
	bt r12,5
	jc LB_795
	btr r12,1
	jmp LB_796
LB_795:
	bts r12,1
LB_796:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_801
	btr r12,5
	jmp LB_802
LB_801:
	bts r12,5
LB_802:
	mov r8,r11
	bt r12,5
	jc LB_799
	btr r12,2
	jmp LB_800
LB_799:
	bts r12,2
LB_800:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_676 : %_676
 ; {>  %_674~1':_r64 %_675~2':(_lst)◂(_p667) %_673~0':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_676
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_676 %_673 } ⊢ { %_677 %_678 } : { %_677 %_678 }
 ; {>  %_674~1':_r64 %_675~2':(_lst)◂(_p667) %_673~0':_r64 %_676~3':_r64 }
	add r9,r13
; _f668 %_677 ⊢ %_679 : %_679
 ; {>  %_678~0':_r64 %_674~1':_r64 %_675~2':(_lst)◂(_p667) %_677~3':_r64 }
; _f668 3' ⊢ °0◂3'
; _cns { %_679 %_675 } ⊢ %_680 : %_680
 ; {>  %_678~0':_r64 %_674~1':_r64 %_675~2':(_lst)◂(_p667) %_679~°0◂3':_p667 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_674 %_680 } ⊢ %_681 : %_681
 ; {>  %_678~0':_r64 %_674~1':_r64 %_680~°0◂{ °0◂3' 2' }:(_lst)◂(_p667) }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_681
 ; {>  %_681~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_678~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_739
	mov rdi,r13
	call dlt
LB_739:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_740
	btr r12,0
	jmp LB_741
LB_740:
	bts r12,0
LB_741:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_744
	btr r12,4
	jmp LB_745
LB_744:
	bts r12,4
LB_745:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_742
	btr QWORD [rdi],0
	jmp LB_743
LB_742:
	bts QWORD [rdi],0
LB_743:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_754
	btr r12,1
	jmp LB_755
LB_754:
	bts r12,1
LB_755:
	mov rsi,1
	bt r12,1
	jc LB_752
	mov rsi,0
	bt r14,0
	jc LB_752
	jmp LB_753
LB_752:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_753:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_750
	btr QWORD [rdi],0
	jmp LB_751
LB_750:
	bts QWORD [rdi],0
LB_751:
	mov r14,r8
	bt r12,2
	jc LB_758
	btr r12,1
	jmp LB_759
LB_758:
	bts r12,1
LB_759:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_756
	btr QWORD [rdi],1
	jmp LB_757
LB_756:
	bts QWORD [rdi],1
LB_757:
	mov rsi,1
	bt r12,4
	jc LB_748
	mov rsi,0
	bt r10,0
	jc LB_748
	jmp LB_749
LB_748:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_749:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_746
	btr QWORD [rdi],1
	jmp LB_747
LB_746:
	bts QWORD [rdi],1
LB_747:
	mov r8,0
	bts r12,2
	ret
LB_760:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_762
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_761
LB_762:
	add rsp,8
	ret
NS_E_670_MTC_0_failed:
	add rsp,48
	pop r14
LB_761:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_838
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_838
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_838
	jmp LB_839
LB_838:
	jmp NS_E_670_MTC_1_failed
LB_839:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_672_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_843
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_844
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_844:
	jmp NS_E_670_MTC_1_failed
LB_843:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_849
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_850
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_850:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_851
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_851:
	jmp NS_E_670_MTC_1_failed
LB_849:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_831
	btr r12,2
	jmp LB_832
LB_831:
	bts r12,2
LB_832:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_829
	btr r12,1
	jmp LB_830
LB_829:
	bts r12,1
LB_830:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_827
	btr r12,0
	jmp LB_828
LB_827:
	bts r12,0
LB_828:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_824
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_853
	btr r12,3
	jmp LB_854
LB_853:
	bts r12,3
LB_854:
	mov r13,r14
	bt r12,1
	jc LB_855
	btr r12,0
	jmp LB_856
LB_855:
	bts r12,0
LB_856:
	mov r10,r8
	bt r12,2
	jc LB_857
	btr r12,4
	jmp LB_858
LB_857:
	bts r12,4
LB_858:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_861
	btr r12,5
	jmp LB_862
LB_861:
	bts r12,5
LB_862:
	mov r14,r11
	bt r12,5
	jc LB_859
	btr r12,1
	jmp LB_860
LB_859:
	bts r12,1
LB_860:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_865
	btr r12,5
	jmp LB_866
LB_865:
	bts r12,5
LB_866:
	mov r8,r11
	bt r12,5
	jc LB_863
	btr r12,2
	jmp LB_864
LB_863:
	bts r12,2
LB_864:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_685 : %_685
 ; {>  %_682~0':_r64 %_684~2':(_lst)◂(_p667) %_683~1':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_685
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_685 %_682 } ⊢ { %_686 %_687 } : { %_686 %_687 }
 ; {>  %_682~0':_r64 %_684~2':(_lst)◂(_p667) %_683~1':_r64 %_685~3':_r64 }
	add r9,r13
; _f668 %_686 ⊢ %_688 : %_688
 ; {>  %_684~2':(_lst)◂(_p667) %_686~3':_r64 %_687~0':_r64 %_683~1':_r64 }
; _f668 3' ⊢ °0◂3'
; _cns { %_688 %_684 } ⊢ %_689 : %_689
 ; {>  %_684~2':(_lst)◂(_p667) %_688~°0◂3':_p667 %_687~0':_r64 %_683~1':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_683 %_689 } ⊢ %_690 : %_690
 ; {>  %_689~°0◂{ °0◂3' 2' }:(_lst)◂(_p667) %_687~0':_r64 %_683~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_690
 ; {>  %_690~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_687~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_803
	mov rdi,r13
	call dlt
LB_803:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_804
	btr r12,0
	jmp LB_805
LB_804:
	bts r12,0
LB_805:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_808
	btr r12,4
	jmp LB_809
LB_808:
	bts r12,4
LB_809:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_806
	btr QWORD [rdi],0
	jmp LB_807
LB_806:
	bts QWORD [rdi],0
LB_807:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_818
	btr r12,1
	jmp LB_819
LB_818:
	bts r12,1
LB_819:
	mov rsi,1
	bt r12,1
	jc LB_816
	mov rsi,0
	bt r14,0
	jc LB_816
	jmp LB_817
LB_816:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_817:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_814
	btr QWORD [rdi],0
	jmp LB_815
LB_814:
	bts QWORD [rdi],0
LB_815:
	mov r14,r8
	bt r12,2
	jc LB_822
	btr r12,1
	jmp LB_823
LB_822:
	bts r12,1
LB_823:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_820
	btr QWORD [rdi],1
	jmp LB_821
LB_820:
	bts QWORD [rdi],1
LB_821:
	mov rsi,1
	bt r12,4
	jc LB_812
	mov rsi,0
	bt r10,0
	jc LB_812
	jmp LB_813
LB_812:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_813:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_810
	btr QWORD [rdi],1
	jmp LB_811
LB_810:
	bts QWORD [rdi],1
LB_811:
	mov r8,0
	bts r12,2
	ret
LB_824:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_826
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_825
LB_826:
	add rsp,8
	ret
NS_E_670_MTC_1_failed:
	add rsp,48
	pop r14
LB_825:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_670_MTC_2_failed
LB_941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_946
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_947:
	jmp NS_E_670_MTC_2_failed
LB_946:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_936
	btr r12,1
	jmp LB_937
LB_936:
	bts r12,1
LB_937:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_934
	btr r12,0
	jmp LB_935
LB_934:
	bts r12,0
LB_935:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_931
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_949
	btr r12,3
	jmp LB_950
LB_949:
	bts r12,3
LB_950:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_953
	btr r12,4
	jmp LB_954
LB_953:
	bts r12,4
LB_954:
	mov r14,r10
	bt r12,4
	jc LB_951
	btr r12,1
	jmp LB_952
LB_951:
	bts r12,1
LB_952:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_957
	btr r12,4
	jmp LB_958
LB_957:
	bts r12,4
LB_958:
	mov r8,r10
	bt r12,4
	jc LB_955
	btr r12,2
	jmp LB_956
LB_955:
	bts r12,2
LB_956:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_867:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_868
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
	jnc LB_869
	bt QWORD [rax],0
	jc LB_870
	btr r12,5
	jmp LB_871
LB_870:
	bts r12,5
LB_871:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_869:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_874
	btr r12,6
	jmp LB_875
LB_874:
	bts r12,6
LB_875:
	mov r9,rcx
	bt r12,6
	jc LB_872
	btr r12,3
	jmp LB_873
LB_872:
	bts r12,3
LB_873:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_878
	btr r12,6
	jmp LB_879
LB_878:
	bts r12,6
LB_879:
	mov r10,rcx
	bt r12,6
	jc LB_876
	btr r12,4
	jmp LB_877
LB_876:
	bts r12,4
LB_877:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_868
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
	jnc LB_880
	bt QWORD [rax],0
	jc LB_881
	btr r12,6
	jmp LB_882
LB_881:
	bts r12,6
LB_882:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_880:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_883
	btr r12,5
	jmp LB_884
LB_883:
	bts r12,5
LB_884:
LB_885:
	cmp r15,0
	jz LB_886
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_885
LB_886:
; » 0xr1 |~ {  } ⊢ %_697 : %_697
 ; {>  %_691~0':_r64 %_692~1':_r64 %_695~4':(_lst)◂(_p667) %_696~5':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_697
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_696 %_697 } ⊢ { %_698 %_699 } : { %_698 %_699 }
 ; {>  %_691~0':_r64 %_692~1':_r64 %_695~4':(_lst)◂(_p667) %_696~5':_r64 %_697~2':_r64 }
	add r11,r8
; _f34 { %_692 %_699 } ⊢ { %_700 %_701 } : { %_700 %_701 }
 ; {>  %_691~0':_r64 %_692~1':_r64 %_698~5':_r64 %_695~4':(_lst)◂(_p667) %_699~2':_r64 }
	add r14,r8
; _f669 %_698 ⊢ %_702 : %_702
 ; {>  %_701~2':_r64 %_691~0':_r64 %_698~5':_r64 %_695~4':(_lst)◂(_p667) %_700~1':_r64 }
; _f669 5' ⊢ °1◂5'
; _cns { %_702 %_695 } ⊢ %_703 : %_703
 ; {>  %_701~2':_r64 %_691~0':_r64 %_695~4':(_lst)◂(_p667) %_700~1':_r64 %_702~°1◂5':_p667 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_700 %_703 } ⊢ %_704 : %_704
 ; {>  %_701~2':_r64 %_691~0':_r64 %_700~1':_r64 %_703~°0◂{ °1◂5' 4' }:(_lst)◂(_p667) }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_704
 ; {>  %_701~2':_r64 %_691~0':_r64 %_704~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,2
	jc LB_887
	mov rdi,r8
	call dlt
LB_887:
	bt r12,0
	jc LB_888
	mov rdi,r13
	call dlt
LB_888:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_891
	btr r12,0
	jmp LB_892
LB_891:
	bts r12,0
LB_892:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_889
	btr QWORD [rdi],0
	jmp LB_890
LB_889:
	bts QWORD [rdi],0
LB_890:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_901
	btr r12,1
	jmp LB_902
LB_901:
	bts r12,1
LB_902:
	mov rsi,1
	bt r12,1
	jc LB_899
	mov rsi,0
	bt r14,0
	jc LB_899
	jmp LB_900
LB_899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_900:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_897
	btr QWORD [rdi],0
	jmp LB_898
LB_897:
	bts QWORD [rdi],0
LB_898:
	mov r14,r10
	bt r12,4
	jc LB_905
	btr r12,1
	jmp LB_906
LB_905:
	bts r12,1
LB_906:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_903
	btr QWORD [rdi],1
	jmp LB_904
LB_903:
	bts QWORD [rdi],1
LB_904:
	mov rsi,1
	bt r12,0
	jc LB_895
	mov rsi,0
	bt r13,0
	jc LB_895
	jmp LB_896
LB_895:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_896:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_893
	btr QWORD [rdi],1
	jmp LB_894
LB_893:
	bts QWORD [rdi],1
LB_894:
	mov r8,0
	bts r12,2
	ret
MTC_LB_868:
	mov r15,0
LB_908:
	cmp r15,0
	jz LB_909
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_908
LB_909:
; » 0xr1 |~ {  } ⊢ %_705 : %_705
 ; {>  %_691~0':_r64 %_692~1':_r64 %_693~2':(_lst)◂(_p667) }
; 	» 0xr1 _ ⊢ 3' : %_705
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_692 %_705 } ⊢ { %_706 %_707 } : { %_706 %_707 }
 ; {>  %_691~0':_r64 %_692~1':_r64 %_705~3':_r64 %_693~2':(_lst)◂(_p667) }
	add r14,r9
; _f669 %_707 ⊢ %_708 : %_708
 ; {>  %_691~0':_r64 %_706~1':_r64 %_707~3':_r64 %_693~2':(_lst)◂(_p667) }
; _f669 3' ⊢ °1◂3'
; _cns { %_708 %_693 } ⊢ %_709 : %_709
 ; {>  %_691~0':_r64 %_706~1':_r64 %_708~°1◂3':_p667 %_693~2':(_lst)◂(_p667) }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_706 %_709 } ⊢ %_710 : %_710
 ; {>  %_691~0':_r64 %_709~°0◂{ °1◂3' 2' }:(_lst)◂(_p667) %_706~1':_r64 }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_710
 ; {>  %_710~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_691~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_910
	mov rdi,r13
	call dlt
LB_910:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_911
	btr r12,0
	jmp LB_912
LB_911:
	bts r12,0
LB_912:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_915
	btr r12,4
	jmp LB_916
LB_915:
	bts r12,4
LB_916:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_913
	btr QWORD [rdi],0
	jmp LB_914
LB_913:
	bts QWORD [rdi],0
LB_914:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_925
	btr r12,1
	jmp LB_926
LB_925:
	bts r12,1
LB_926:
	mov rsi,1
	bt r12,1
	jc LB_923
	mov rsi,0
	bt r14,0
	jc LB_923
	jmp LB_924
LB_923:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_924:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_921
	btr QWORD [rdi],0
	jmp LB_922
LB_921:
	bts QWORD [rdi],0
LB_922:
	mov r14,r8
	bt r12,2
	jc LB_929
	btr r12,1
	jmp LB_930
LB_929:
	bts r12,1
LB_930:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_927
	btr QWORD [rdi],1
	jmp LB_928
LB_927:
	bts QWORD [rdi],1
LB_928:
	mov rsi,1
	bt r12,4
	jc LB_919
	mov rsi,0
	bt r10,0
	jc LB_919
	jmp LB_920
LB_919:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_920:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_917
	btr QWORD [rdi],1
	jmp LB_918
LB_917:
	bts QWORD [rdi],1
LB_918:
	mov r8,0
	bts r12,2
	ret
MTC_LB_907:
LB_931:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_933
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_932
LB_933:
	add rsp,8
	ret
NS_E_670_MTC_2_failed:
	add rsp,32
	pop r14
LB_932:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_968
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_711
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _nil {  } ⊢ %_712 : %_712
 ; {>  %_711~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_713 : %_713
 ; {>  %_711~0':_stg %_712~°1◂{  }:(_lst)◂(t366'(0)) }
; 	» 0xr0 _ ⊢ 1' : %_713
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_713 %_712 } ⊢ %_714 : %_714
 ; {>  %_713~1':_r64 %_711~0':_stg %_712~°1◂{  }:(_lst)◂(t366'(0)) }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_714
 ; {>  %_711~0':_stg %_714~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t370'(0)) }) }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_959
	mov rdi,r13
	call dlt
LB_959:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_962
	btr r12,0
	jmp LB_963
LB_962:
	bts r12,0
LB_963:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_960
	btr QWORD [rdi],0
	jmp LB_961
LB_960:
	bts QWORD [rdi],0
LB_961:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_966
	mov rsi,0
	bt r13,0
	jc LB_966
	jmp LB_967
LB_966:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_967:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_964
	btr QWORD [rdi],1
	jmp LB_965
LB_964:
	bts QWORD [rdi],1
LB_965:
	mov r8,0
	bts r12,2
	ret
LB_968:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_970
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_969
LB_970:
	add rsp,8
	ret
NS_E_670_MTC_3_failed:
	add rsp,0
	pop r14
LB_969:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_671:
NS_E_RDI_671:
NS_E_671_ETR_TBL:
NS_E_671_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_983
	jmp LB_984
LB_983:
	jmp NS_E_671_MTC_0_failed
LB_984:
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
	jc LB_976
	btr r12,0
	jmp LB_977
LB_976:
	bts r12,0
LB_977:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_973
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_715 : %_715
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_715
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_715 ⊢ %_716 : %_716
 ; {>  %_715~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_716
 ; {>  %_716~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_971
	btr r12,3
	jmp LB_972
LB_971:
	bts r12,3
LB_972:
	mov r8,0
	bts r12,2
	ret
LB_973:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_975
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_974
LB_975:
	add rsp,8
	ret
NS_E_671_MTC_0_failed:
	add rsp,16
	pop r14
LB_974:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_1003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_1003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_1003
	jmp LB_1004
LB_1003:
	jmp NS_E_671_MTC_1_failed
LB_1004:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_671_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1008
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1009
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1009:
	jmp NS_E_671_MTC_1_failed
LB_1008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_671_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1014
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1015
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1015:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1016
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1016:
	jmp NS_E_671_MTC_1_failed
LB_1014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_996
	btr r12,2
	jmp LB_997
LB_996:
	bts r12,2
LB_997:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_994
	btr r12,1
	jmp LB_995
LB_994:
	bts r12,1
LB_995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_992
	btr r12,0
	jmp LB_993
LB_992:
	bts r12,0
LB_993:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_989
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_1018
	btr r12,3
	jmp LB_1019
LB_1018:
	bts r12,3
LB_1019:
	mov r14,r8
	bt r12,2
	jc LB_1020
	btr r12,1
	jmp LB_1021
LB_1020:
	bts r12,1
LB_1021:
	mov r8,r13
	bt r12,0
	jc LB_1022
	btr r12,2
	jmp LB_1023
LB_1022:
	bts r12,2
LB_1023:
	mov r13,r9
	bt r12,3
	jc LB_1024
	btr r12,0
	jmp LB_1025
LB_1024:
	bts r12,0
LB_1025:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_719 : %_719
 ; {>  %_718~1':_r64 %_717~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_719
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_719 %_717 } ⊢ { %_720 %_721 } : { %_720 %_721 }
 ; {>  %_718~1':_r64 %_719~2':_r64 %_717~0':_r64 }
	add r8,r13
; _f34 { %_720 %_718 } ⊢ { %_722 %_723 } : { %_722 %_723 }
 ; {>  %_720~2':_r64 %_718~1':_r64 %_721~0':_r64 }
	add r8,r14
; _some %_722 ⊢ %_724 : %_724
 ; {>  %_723~1':_r64 %_722~2':_r64 %_721~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_724
 ; {>  %_723~1':_r64 %_724~°0◂2':(_opn)◂(_r64) %_721~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_985
	mov rdi,r14
	call dlt
LB_985:
	bt r12,0
	jc LB_986
	mov rdi,r13
	call dlt
LB_986:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_987
	btr r12,3
	jmp LB_988
LB_987:
	bts r12,3
LB_988:
	mov r8,0
	bts r12,2
	ret
LB_989:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_991
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_990
LB_991:
	add rsp,8
	ret
NS_E_671_MTC_1_failed:
	add rsp,48
	pop r14
LB_990:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1040
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_671_MTC_2_failed
LB_1040:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_671_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1045
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1046
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1046:
	jmp NS_E_671_MTC_2_failed
LB_1045:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1035
	btr r12,1
	jmp LB_1036
LB_1035:
	bts r12,1
LB_1036:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1033
	btr r12,0
	jmp LB_1034
LB_1033:
	bts r12,0
LB_1034:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1030
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_727 : %_727
 ; {>  %_725~0':_r64 %_726~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_727
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_727 %_726 } ⊢ { %_728 %_729 } : { %_728 %_729 }
 ; {>  %_725~0':_r64 %_727~2':_r64 %_726~1':_r64 }
	add r8,r14
; _some %_728 ⊢ %_730 : %_730
 ; {>  %_725~0':_r64 %_729~1':_r64 %_728~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_730
 ; {>  %_725~0':_r64 %_729~1':_r64 %_730~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1026
	mov rdi,r13
	call dlt
LB_1026:
	bt r12,1
	jc LB_1027
	mov rdi,r14
	call dlt
LB_1027:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1028
	btr r12,3
	jmp LB_1029
LB_1028:
	bts r12,3
LB_1029:
	mov r8,0
	bts r12,2
	ret
LB_1030:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1032
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1031
LB_1032:
	add rsp,8
	ret
NS_E_671_MTC_2_failed:
	add rsp,32
	pop r14
LB_1031:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_672:
NS_E_RDI_672:
NS_E_672_ETR_TBL:
NS_E_672_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1060
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1060
	jmp LB_1061
LB_1060:
	jmp NS_E_672_MTC_0_failed
LB_1061:
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
	jc LB_1053
	btr r12,0
	jmp LB_1054
LB_1053:
	bts r12,0
LB_1054:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1050
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_731 : %_731
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_731
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_731 ⊢ %_732 : %_732
 ; {>  %_731~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_732
 ; {>  %_732~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1048
	btr r12,3
	jmp LB_1049
LB_1048:
	bts r12,3
LB_1049:
	mov r8,0
	bts r12,2
	ret
LB_1050:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1052
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1051
LB_1052:
	add rsp,8
	ret
NS_E_672_MTC_0_failed:
	add rsp,16
	pop r14
LB_1051:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1076
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_672_MTC_1_failed
LB_1076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_672_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1081
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1082
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1082:
	jmp NS_E_672_MTC_1_failed
LB_1081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1071
	btr r12,1
	jmp LB_1072
LB_1071:
	bts r12,1
LB_1072:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1069
	btr r12,0
	jmp LB_1070
LB_1069:
	bts r12,0
LB_1070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1066
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_735 : %_735
 ; {>  %_734~1':_r64 %_733~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_735
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_735 %_734 } ⊢ { %_736 %_737 } : { %_736 %_737 }
 ; {>  %_735~2':_r64 %_734~1':_r64 %_733~0':_r64 }
	add r8,r14
; _some %_736 ⊢ %_738 : %_738
 ; {>  %_736~2':_r64 %_737~1':_r64 %_733~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_738
 ; {>  %_738~°0◂2':(_opn)◂(_r64) %_737~1':_r64 %_733~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1062
	mov rdi,r14
	call dlt
LB_1062:
	bt r12,0
	jc LB_1063
	mov rdi,r13
	call dlt
LB_1063:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1064
	btr r12,3
	jmp LB_1065
LB_1064:
	bts r12,3
LB_1065:
	mov r8,0
	bts r12,2
	ret
LB_1066:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1068
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1067
LB_1068:
	add rsp,8
	ret
NS_E_672_MTC_1_failed:
	add rsp,32
	pop r14
LB_1067:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1106:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_1106:
MTC_LB_1107:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1108
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
	jnc LB_1109
	bt QWORD [rax],0
	jc LB_1110
	btr r12,7
	jmp LB_1111
LB_1110:
	bts r12,7
LB_1111:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1109:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1114
	btr r12,8
	jmp LB_1115
LB_1114:
	bts r12,8
LB_1115:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1112
	btr r12,5
	jmp LB_1113
LB_1112:
	bts r12,5
LB_1113:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1118
	btr r12,8
	jmp LB_1119
LB_1118:
	bts r12,8
LB_1119:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1116
	btr r12,6
	jmp LB_1117
LB_1116:
	bts r12,6
LB_1117:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1120:
	cmp r15,0
	jz LB_1121
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1120
LB_1121:
MTC_LB_1122:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1123
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
	jnc LB_1124
	bt QWORD [rax],0
	jc LB_1125
	btr r12,7
	jmp LB_1126
LB_1125:
	bts r12,7
LB_1126:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1124:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_1127
	btr r12,4
	jmp LB_1128
LB_1127:
	bts r12,4
LB_1128:
LB_1129:
	cmp r15,0
	jz LB_1130
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1129
LB_1130:
; _f36 %_1091 ⊢ { %_1092 %_1093 } : { %_1092 %_1093 }
 ; {>  %_1087~3':_r64 %_1090~6':(_lst)◂(_p667) %_1085~1':_r64 %_1084~0':_stg %_1086~2':_stg %_1091~4':_r64 }
	mov r11,r10
	bts r12,5
; _f18 { %_1093 %_1084 %_1085 %_1086 %_1087 } ⊢ { %_1094 %_1095 %_1096 %_1097 %_1098 } : { %_1094 %_1095 %_1096 %_1097 %_1098 }
 ; {>  %_1087~3':_r64 %_1093~5':_r64 %_1090~6':(_lst)◂(_p667) %_1085~1':_r64 %_1092~4':_r64 %_1084~0':_stg %_1086~2':_stg }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_1135
	btr r12,4
	jmp LB_1136
LB_1135:
	bts r12,4
LB_1136:
	mov r9,r8
	bt r12,2
	jc LB_1137
	btr r12,3
	jmp LB_1138
LB_1137:
	bts r12,3
LB_1138:
	mov r8,r14
	bt r12,1
	jc LB_1139
	btr r12,2
	jmp LB_1140
LB_1139:
	bts r12,2
LB_1140:
	mov r14,r13
	bt r12,0
	jc LB_1141
	btr r12,1
	jmp LB_1142
LB_1141:
	bts r12,1
LB_1142:
	mov r13,r11
	bt r12,5
	jc LB_1143
	btr r12,0
	jmp LB_1144
LB_1143:
	bts r12,0
LB_1144:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_1145
	btr r12,5
	jmp LB_1146
LB_1145:
	bts r12,5
LB_1146:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1133
	btr r12,6
	jmp LB_1134
LB_1133:
	bts r12,6
LB_1134:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1131
	btr r12,4
	jmp LB_1132
LB_1131:
	bts r12,4
LB_1132:
	add rsp,24
; _f1106 { %_1095 %_1096 %_1097 %_1098 %_1090 } ⊢ { %_1099 %_1100 } : { %_1099 %_1100 }
 ; {>  %_1090~6':(_lst)◂(_p667) %_1098~5':_r64 %_1095~1':_stg %_1094~0':_r64 %_1092~4':_r64 %_1096~2':_r64 %_1097~3':_stg }
; _f1106 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_1151
	btr r12,0
	jmp LB_1152
LB_1151:
	bts r12,0
LB_1152:
	mov r14,r8
	bt r12,2
	jc LB_1153
	btr r12,1
	jmp LB_1154
LB_1153:
	bts r12,1
LB_1154:
	mov r8,r9
	bt r12,3
	jc LB_1155
	btr r12,2
	jmp LB_1156
LB_1155:
	bts r12,2
LB_1156:
	mov r9,r11
	bt r12,5
	jc LB_1157
	btr r12,3
	jmp LB_1158
LB_1157:
	bts r12,3
LB_1158:
	mov r10,rcx
	bt r12,6
	jc LB_1159
	btr r12,4
	jmp LB_1160
LB_1159:
	bts r12,4
LB_1160:
	call NS_E_1106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1161
	btr r12,2
	jmp LB_1162
LB_1161:
	bts r12,2
LB_1162:
	mov r14,r13
	bt r12,0
	jc LB_1163
	btr r12,1
	jmp LB_1164
LB_1163:
	bts r12,1
LB_1164:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_1149
	btr r12,4
	jmp LB_1150
LB_1149:
	bts r12,4
LB_1150:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1147
	btr r12,0
	jmp LB_1148
LB_1147:
	bts r12,0
LB_1148:
	add rsp,24
; ∎ { %_1099 %_1100 }
 ; {>  %_1100~2':_stg %_1094~0':_r64 %_1092~4':_r64 %_1099~1':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_1165
	mov rdi,r13
	call dlt
LB_1165:
	bt r12,4
	jc LB_1166
	mov rdi,r10
	call dlt
LB_1166:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_1167
	btr r12,0
	jmp LB_1168
LB_1167:
	bts r12,0
LB_1168:
	mov r14,r8
	bt r12,2
	jc LB_1169
	btr r12,1
	jmp LB_1170
LB_1169:
	bts r12,1
LB_1170:
	ret
MTC_LB_1123:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1171
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
	jnc LB_1172
	bt QWORD [rax],0
	jc LB_1173
	btr r12,7
	jmp LB_1174
LB_1173:
	bts r12,7
LB_1174:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1172:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_1175
	btr r12,4
	jmp LB_1176
LB_1175:
	bts r12,4
LB_1176:
LB_1177:
	cmp r15,0
	jz LB_1178
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1177
LB_1178:
; _f34 { %_1085 %_1101 } ⊢ { %_1102 %_1103 } : { %_1102 %_1103 }
 ; {>  %_1087~3':_r64 %_1090~6':(_lst)◂(_p667) %_1085~1':_r64 %_1101~4':_r64 %_1084~0':_stg %_1086~2':_stg }
	add r14,r10
; _f1106 { %_1084 %_1102 %_1086 %_1087 %_1090 } ⊢ { %_1104 %_1105 } : { %_1104 %_1105 }
 ; {>  %_1087~3':_r64 %_1090~6':(_lst)◂(_p667) %_1103~4':_r64 %_1084~0':_stg %_1102~1':_r64 %_1086~2':_stg }
; _f1106 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_1181
	btr r12,4
	jmp LB_1182
LB_1181:
	bts r12,4
LB_1182:
	call NS_E_1106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1179
	btr r12,4
	jmp LB_1180
LB_1179:
	bts r12,4
LB_1180:
	add rsp,16
; ∎ { %_1104 %_1105 }
 ; {>  %_1104~0':_stg %_1103~4':_r64 %_1105~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_1183
	mov rdi,r10
	call dlt
LB_1183:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1171:
MTC_LB_1108:
	mov r15,0
LB_1185:
	cmp r15,0
	jz LB_1186
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1185
LB_1186:
; ∎ { %_1084 %_1086 }
 ; {>  %_1087~3':_r64 %_1085~1':_r64 %_1084~0':_stg %_1088~4':(_lst)◂(_p667) %_1086~2':_stg }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_1187
	mov rdi,r9
	call dlt
LB_1187:
	bt r12,1
	jc LB_1188
	mov rdi,r14
	call dlt
LB_1188:
	bt r12,4
	jc LB_1189
	mov rdi,r10
	call dlt
LB_1189:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1190
	btr r12,1
	jmp LB_1191
LB_1190:
	bts r12,1
LB_1191:
	ret
MTC_LB_1184:
NS_E_1207:
; 	|» 0'
NS_E_RDI_1207:
; » 0xr0 |~ {  } ⊢ %_1193 : %_1193
 ; {>  %_1192~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1193
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f670 { %_1192 %_1193 } ⊢ { %_1194 %_1195 %_1196 } : { %_1194 %_1195 %_1196 }
 ; {>  %_1192~0':_stg %_1193~1':_r64 }
; _f670 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_670
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1208
	btr r12,4
	jmp LB_1209
LB_1208:
	bts r12,4
LB_1209:
	mov r8,r9
	bt r12,3
	jc LB_1212
	btr r12,2
	jmp LB_1213
LB_1212:
	bts r12,2
LB_1213:
	mov rsi,1
	bt r12,2
	jc LB_1210
	mov rsi,0
	bt r8,0
	jc LB_1210
	jmp LB_1211
LB_1210:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1211:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_1214:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1215
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
	jnc LB_1216
	bt QWORD [rax],0
	jc LB_1217
	btr r12,5
	jmp LB_1218
LB_1217:
	bts r12,5
LB_1218:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1216:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1221
	btr r12,6
	jmp LB_1222
LB_1221:
	bts r12,6
LB_1222:
	mov r9,rcx
	bt r12,6
	jc LB_1219
	btr r12,3
	jmp LB_1220
LB_1219:
	bts r12,3
LB_1220:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1225
	btr r12,6
	jmp LB_1226
LB_1225:
	bts r12,6
LB_1226:
	mov r10,rcx
	bt r12,6
	jc LB_1223
	btr r12,4
	jmp LB_1224
LB_1223:
	bts r12,4
LB_1224:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1227:
	cmp r15,0
	jz LB_1228
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1227
LB_1228:
; _f14 %_1197 ⊢ { %_1199 %_1200 } : { %_1199 %_1200 }
 ; {>  %_1194~0':_stg %_1197~3':_r64 %_1195~1':_r64 %_1198~4':(_lst)◂(_p667) }
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
	jc LB_1235
	btr r12,0
	jmp LB_1236
LB_1235:
	bts r12,0
LB_1236:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_1237
	btr r12,2
	jmp LB_1238
LB_1237:
	bts r12,2
LB_1238:
	mov r9,r14
	bt r12,1
	jc LB_1239
	btr r12,3
	jmp LB_1240
LB_1239:
	bts r12,3
LB_1240:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_1233
	btr r12,4
	jmp LB_1234
LB_1233:
	bts r12,4
LB_1234:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1231
	btr r12,1
	jmp LB_1232
LB_1231:
	bts r12,1
LB_1232:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1229
	btr r12,0
	jmp LB_1230
LB_1229:
	bts r12,0
LB_1230:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_1201 : %_1201
 ; {>  %_1199~2':_r64 %_1194~0':_stg %_1195~1':_r64 %_1198~4':(_lst)◂(_p667) %_1200~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_1201
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_1202 : %_1202
 ; {>  %_1199~2':_r64 %_1194~0':_stg %_1195~1':_r64 %_1198~4':(_lst)◂(_p667) %_1201~5':_r64 %_1200~3':_stg }
; 	» 0xr0 _ ⊢ 6' : %_1202
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f1106 { %_1194 %_1201 %_1200 %_1202 %_1198 } ⊢ { %_1203 %_1204 } : { %_1203 %_1204 }
 ; {>  %_1199~2':_r64 %_1194~0':_stg %_1195~1':_r64 %_1198~4':(_lst)◂(_p667) %_1201~5':_r64 %_1202~6':_r64 %_1200~3':_stg }
; _f1106 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_1245
	btr r12,1
	jmp LB_1246
LB_1245:
	bts r12,1
LB_1246:
	mov r8,r9
	bt r12,3
	jc LB_1247
	btr r12,2
	jmp LB_1248
LB_1247:
	bts r12,2
LB_1248:
	mov r9,rcx
	bt r12,6
	jc LB_1249
	btr r12,3
	jmp LB_1250
LB_1249:
	bts r12,3
LB_1250:
	call NS_E_1106
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1251
	btr r12,3
	jmp LB_1252
LB_1251:
	bts r12,3
LB_1252:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1243
	btr r12,2
	jmp LB_1244
LB_1243:
	bts r12,2
LB_1244:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1241
	btr r12,1
	jmp LB_1242
LB_1241:
	bts r12,1
LB_1242:
	add rsp,24
; _some %_1204 ⊢ %_1205 : %_1205
 ; {>  %_1199~2':_r64 %_1195~1':_r64 %_1203~0':_stg %_1204~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_1203 %_1205 }
 ; {>  %_1199~2':_r64 %_1195~1':_r64 %_1203~0':_stg %_1205~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_1253
	mov rdi,r8
	call dlt
LB_1253:
	bt r12,1
	jc LB_1254
	mov rdi,r14
	call dlt
LB_1254:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1257
	btr r12,1
	jmp LB_1258
LB_1257:
	bts r12,1
LB_1258:
	mov rsi,1
	bt r12,1
	jc LB_1255
	mov rsi,0
	bt r14,0
	jc LB_1255
	jmp LB_1256
LB_1255:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1256:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1215:
	mov r15,0
LB_1260:
	cmp r15,0
	jz LB_1261
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1260
LB_1261:
; _none {  } ⊢ %_1206 : %_1206
 ; {>  %_1196~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1194~0':_stg %_1195~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1194 %_1206 }
 ; {>  %_1196~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1194~0':_stg %_1206~°1◂{  }:(_opn)◂(t530'(0)) %_1195~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_1262
	mov rdi,r8
	call dlt
LB_1262:
	bt r12,1
	jc LB_1263
	mov rdi,r14
	call dlt
LB_1263:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_1264
	mov rsi,0
	bt r14,0
	jc LB_1264
	jmp LB_1265
LB_1264:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1265:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1259:
NS_E_1271:
NS_E_RDI_1271:
; » _^ ..
	mov rax,45
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
; "FF## huugugugu\n"
	mov rsi,0x_75_75_68_20_23_23_46_46
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_67
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_75
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_67
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_75
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_67
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_75
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; //
	mov r13,rax
	btr r12,0
; _f1207 %_1266 ⊢ { %_1267 %_1268 } : { %_1267 %_1268 }
 ; {>  %_1266~0':_stg }
; _f1207 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1207
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_1267 %_1268 } ⊢ { %_1269 %_1270 } : { %_1269 %_1270 }
 ; {>  %_1268~1':(_opn)◂(_stg) %_1267~0':_stg }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1272
	btr r12,2
	jmp LB_1273
LB_1272:
	bts r12,2
LB_1273:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1276
	btr r12,3
	jmp LB_1277
LB_1276:
	bts r12,3
LB_1277:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1274
	btr QWORD [rdi],0
	jmp LB_1275
LB_1274:
	bts QWORD [rdi],0
LB_1275:
	mov r9,r14
	bt r12,1
	jc LB_1280
	btr r12,3
	jmp LB_1281
LB_1280:
	bts r12,3
LB_1281:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1278
	btr QWORD [rdi],1
	jmp LB_1279
LB_1278:
	bts QWORD [rdi],1
LB_1279:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1282
	btr r12,2
	jmp LB_1283
LB_1282:
	bts r12,2
LB_1283:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1286
	btr r12,3
	jmp LB_1287
LB_1286:
	bts r12,3
LB_1287:
	mov r13,r9
	bt r12,3
	jc LB_1284
	btr r12,0
	jmp LB_1285
LB_1284:
	bts r12,0
LB_1285:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1290
	btr r12,3
	jmp LB_1291
LB_1290:
	bts r12,3
LB_1291:
	mov r14,r9
	bt r12,3
	jc LB_1288
	btr r12,1
	jmp LB_1289
LB_1288:
	bts r12,1
LB_1289:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1270~1':(_opn)◂(_stg) %_1269~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_1292
	mov rdi,r14
	call dlt
LB_1292:
	bt r12,0
	jc LB_1293
	mov rdi,r13
	call dlt
LB_1293:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1295:
NS_E_RDI_1295:
NS_E_1295_ETR_TBL:
NS_E_1295_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_1297_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1367
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1295_MTC_0_failed
LB_1367:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_1295_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1372
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1373
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1373:
	jmp NS_E_1295_MTC_0_failed
LB_1372:
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
	jc LB_1361
	btr QWORD [rdi],1
LB_1361:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1362
	btr QWORD [rdi],0
LB_1362:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1295_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1295_MTC_1_failed:
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
NS_E_1297:
NS_E_RDI_1297:
NS_E_1297_ETR_TBL:
NS_E_1297_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1578
LB_1577:
	add r14,1
LB_1578:
	cmp r14,r10
	jge LB_1579
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1577
	cmp al,10
	jz LB_1577
	cmp al,32
	jz LB_1577
LB_1579:
	add r14,4
	cmp r14,r10
	jg LB_1582
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1582
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1582
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1582
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1582
	jmp LB_1583
LB_1582:
	jmp NS_E_1297_MTC_0_failed
LB_1583:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1585
LB_1584:
	add r14,1
LB_1585:
	cmp r14,r10
	jge LB_1586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1584
	cmp al,10
	jz LB_1584
	cmp al,32
	jz LB_1584
LB_1586:
	push r10
	call NS_E_477_ETR_TBL
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
	jmp NS_E_1297_MTC_0_failed
LB_1587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1591
LB_1590:
	add r14,1
LB_1591:
	cmp r14,r10
	jge LB_1592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1590
	cmp al,10
	jz LB_1590
	cmp al,32
	jz LB_1590
LB_1592:
	add r14,1
	cmp r14,r10
	jg LB_1597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1597
	jmp LB_1598
LB_1597:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1594
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1594:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1595
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1595:
	jmp NS_E_1297_MTC_0_failed
LB_1598:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1600
LB_1599:
	add r14,1
LB_1600:
	cmp r14,r10
	jge LB_1601
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1599
	cmp al,10
	jz LB_1599
	cmp al,32
	jz LB_1599
LB_1601:
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1602
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1603
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1603:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1604
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1604:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1605
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1605:
	jmp NS_E_1297_MTC_0_failed
LB_1602:
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
	jc LB_1572
	btr QWORD [rdi],3
LB_1572:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1573
	btr QWORD [rdi],2
LB_1573:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1574
	btr QWORD [rdi],1
LB_1574:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1575
	btr QWORD [rdi],0
LB_1575:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1543
LB_1542:
	add r14,1
LB_1543:
	cmp r14,r10
	jge LB_1544
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1542
	cmp al,10
	jz LB_1542
	cmp al,32
	jz LB_1542
LB_1544:
	add r14,4
	cmp r14,r10
	jg LB_1547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1547
	jmp LB_1548
LB_1547:
	jmp NS_E_1297_MTC_1_failed
LB_1548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1550
LB_1549:
	add r14,1
LB_1550:
	cmp r14,r10
	jge LB_1551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1549
	cmp al,10
	jz LB_1549
	cmp al,32
	jz LB_1549
LB_1551:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1552
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1553
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1553:
	jmp NS_E_1297_MTC_1_failed
LB_1552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_1556
LB_1555:
	add r14,1
LB_1556:
	cmp r14,r10
	jge LB_1557
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1555
	cmp al,10
	jz LB_1555
	cmp al,32
	jz LB_1555
LB_1557:
	push r10
	call NS_E_1295_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1558
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1559
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1559:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1560
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1560:
	jmp NS_E_1297_MTC_1_failed
LB_1558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_1563
LB_1562:
	add r14,1
LB_1563:
	cmp r14,r10
	jge LB_1564
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1562
	cmp al,10
	jz LB_1562
	cmp al,32
	jz LB_1562
LB_1564:
	add r14,6
	cmp r14,r10
	jg LB_1570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1570
	jmp LB_1571
LB_1570:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1566
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1566:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1567
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1567:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1568
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1568:
	jmp NS_E_1297_MTC_1_failed
LB_1571:
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
	jc LB_1537
	btr QWORD [rdi],3
LB_1537:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1538
	btr QWORD [rdi],2
LB_1538:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1539
	btr QWORD [rdi],1
LB_1539:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1540
	btr QWORD [rdi],0
LB_1540:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1508
LB_1507:
	add r14,1
LB_1508:
	cmp r14,r10
	jge LB_1509
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1507
	cmp al,10
	jz LB_1507
	cmp al,32
	jz LB_1507
LB_1509:
	add r14,2
	cmp r14,r10
	jg LB_1512
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1512
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1512
	jmp LB_1513
LB_1512:
	jmp NS_E_1297_MTC_2_failed
LB_1513:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1515
LB_1514:
	add r14,1
LB_1515:
	cmp r14,r10
	jge LB_1516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1514
	cmp al,10
	jz LB_1514
	cmp al,32
	jz LB_1514
LB_1516:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1517
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1518
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1518:
	jmp NS_E_1297_MTC_2_failed
LB_1517:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1521
LB_1520:
	add r14,1
LB_1521:
	cmp r14,r10
	jge LB_1522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1520
	cmp al,10
	jz LB_1520
	cmp al,32
	jz LB_1520
LB_1522:
	add r14,1
	cmp r14,r10
	jg LB_1527
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1527
	jmp LB_1528
LB_1527:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1524
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1524:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1525:
	jmp NS_E_1297_MTC_2_failed
LB_1528:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_1530
LB_1529:
	add r14,1
LB_1530:
	cmp r14,r10
	jge LB_1531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1529
	cmp al,10
	jz LB_1529
	cmp al,32
	jz LB_1529
LB_1531:
	push r10
	call NS_E_1299_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1532
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1533
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1533:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1534
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1534:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1535
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1535:
	jmp NS_E_1297_MTC_2_failed
LB_1532:
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
	jc LB_1502
	btr QWORD [rdi],3
LB_1502:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1503
	btr QWORD [rdi],2
LB_1503:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1504
	btr QWORD [rdi],1
LB_1504:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1505
	btr QWORD [rdi],0
LB_1505:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1473
LB_1472:
	add r14,1
LB_1473:
	cmp r14,r10
	jge LB_1474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1472
	cmp al,10
	jz LB_1472
	cmp al,32
	jz LB_1472
LB_1474:
	add r14,2
	cmp r14,r10
	jg LB_1477
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1477
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1477
	jmp LB_1478
LB_1477:
	jmp NS_E_1297_MTC_3_failed
LB_1478:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1480
LB_1479:
	add r14,1
LB_1480:
	cmp r14,r10
	jge LB_1481
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1479
	cmp al,10
	jz LB_1479
	cmp al,32
	jz LB_1479
LB_1481:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1482
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1483:
	jmp NS_E_1297_MTC_3_failed
LB_1482:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_1486
LB_1485:
	add r14,1
LB_1486:
	cmp r14,r10
	jge LB_1487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1485
	cmp al,10
	jz LB_1485
	cmp al,32
	jz LB_1485
LB_1487:
	add r14,2
	cmp r14,r10
	jg LB_1492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1492
	jmp LB_1493
LB_1492:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1489
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1489:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1490:
	jmp NS_E_1297_MTC_3_failed
LB_1493:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_1495
LB_1494:
	add r14,1
LB_1495:
	cmp r14,r10
	jge LB_1496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1494
	cmp al,10
	jz LB_1494
	cmp al,32
	jz LB_1494
LB_1496:
	push r10
	call NS_E_1307_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1497
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1498
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1498:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1499
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1499:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1500
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1500:
	jmp NS_E_1297_MTC_3_failed
LB_1497:
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
	jc LB_1467
	btr QWORD [rdi],3
LB_1467:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1468
	btr QWORD [rdi],2
LB_1468:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1469
	btr QWORD [rdi],1
LB_1469:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1470
	btr QWORD [rdi],0
LB_1470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1440
LB_1439:
	add r14,1
LB_1440:
	cmp r14,r10
	jge LB_1441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1439
	cmp al,10
	jz LB_1439
	cmp al,32
	jz LB_1439
LB_1441:
	add r14,2
	cmp r14,r10
	jg LB_1444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1444
	jmp LB_1445
LB_1444:
	jmp NS_E_1297_MTC_4_failed
LB_1445:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1447
LB_1446:
	add r14,1
LB_1447:
	cmp r14,r10
	jge LB_1448
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1446
	cmp al,10
	jz LB_1446
	cmp al,32
	jz LB_1446
LB_1448:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1449
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1450
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1450:
	jmp NS_E_1297_MTC_4_failed
LB_1449:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_1453
LB_1452:
	add r14,1
LB_1453:
	cmp r14,r10
	jge LB_1454
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1452
	cmp al,10
	jz LB_1452
	cmp al,32
	jz LB_1452
LB_1454:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1455
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1456
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1456:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1457
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1457:
	jmp NS_E_1297_MTC_4_failed
LB_1455:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_1460
LB_1459:
	add r14,1
LB_1460:
	cmp r14,r10
	jge LB_1461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1459
	cmp al,10
	jz LB_1459
	cmp al,32
	jz LB_1459
LB_1461:
	push r10
	call NS_E_1307_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1462
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1463
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1463:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1464
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1464:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1465:
	jmp NS_E_1297_MTC_4_failed
LB_1462:
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
	jc LB_1434
	btr QWORD [rdi],3
LB_1434:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1435
	btr QWORD [rdi],2
LB_1435:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1436
	btr QWORD [rdi],1
LB_1436:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1437
	btr QWORD [rdi],0
LB_1437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0400_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_1405
LB_1404:
	add r14,1
LB_1405:
	cmp r14,r10
	jge LB_1406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1404
	cmp al,10
	jz LB_1404
	cmp al,32
	jz LB_1404
LB_1406:
	add r14,2
	cmp r14,r10
	jg LB_1409
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1409
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1409
	jmp LB_1410
LB_1409:
	jmp NS_E_1297_MTC_5_failed
LB_1410:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1412
LB_1411:
	add r14,1
LB_1412:
	cmp r14,r10
	jge LB_1413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1411
	cmp al,10
	jz LB_1411
	cmp al,32
	jz LB_1411
LB_1413:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1414
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1415
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1415:
	jmp NS_E_1297_MTC_5_failed
LB_1414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1418
LB_1417:
	add r14,1
LB_1418:
	cmp r14,r10
	jge LB_1419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1417
	cmp al,10
	jz LB_1417
	cmp al,32
	jz LB_1417
LB_1419:
	add r14,1
	cmp r14,r10
	jg LB_1424
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1424
	jmp LB_1425
LB_1424:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1421
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1422:
	jmp NS_E_1297_MTC_5_failed
LB_1425:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1427
LB_1426:
	add r14,1
LB_1427:
	cmp r14,r10
	jge LB_1428
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1426
	cmp al,10
	jz LB_1426
	cmp al,32
	jz LB_1426
LB_1428:
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1429
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1430
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1430:
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
	jmp NS_E_1297_MTC_5_failed
LB_1429:
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
	jc LB_1399
	btr QWORD [rdi],3
LB_1399:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1400
	btr QWORD [rdi],2
LB_1400:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1401
	btr QWORD [rdi],1
LB_1401:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1402
	btr QWORD [rdi],0
LB_1402:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0500_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_1380
LB_1379:
	add r14,1
LB_1380:
	cmp r14,r10
	jge LB_1381
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1379
	cmp al,10
	jz LB_1379
	cmp al,32
	jz LB_1379
LB_1381:
	add r14,2
	cmp r14,r10
	jg LB_1384
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1384
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1384
	jmp LB_1385
LB_1384:
	jmp NS_E_1297_MTC_6_failed
LB_1385:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1387
LB_1386:
	add r14,1
LB_1387:
	cmp r14,r10
	jge LB_1388
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1386
	cmp al,10
	jz LB_1386
	cmp al,32
	jz LB_1386
LB_1388:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1389
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1390
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1390:
	jmp NS_E_1297_MTC_6_failed
LB_1389:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_1393
LB_1392:
	add r14,1
LB_1393:
	cmp r14,r10
	jge LB_1394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1392
	cmp al,10
	jz LB_1392
	cmp al,32
	jz LB_1392
LB_1394:
	push r10
	call NS_E_1303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1395
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1397:
	jmp NS_E_1297_MTC_6_failed
LB_1395:
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
	jc LB_1375
	btr QWORD [rdi],2
LB_1375:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1376
	btr QWORD [rdi],1
LB_1376:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1377
	btr QWORD [rdi],0
LB_1377:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0600_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1297_MTC_6_failed:
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
NS_E_1299:
NS_E_RDI_1299:
NS_E_1299_ETR_TBL:
NS_E_1299_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_52_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1627
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1299_MTC_0_failed
LB_1627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1635
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1635
	jmp LB_1636
LB_1635:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1633:
	jmp NS_E_1299_MTC_0_failed
LB_1636:
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
	jc LB_1621
	btr QWORD [rdi],1
LB_1621:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1622
	btr QWORD [rdi],0
LB_1622:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1299_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1619
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1299_MTC_1_failed
LB_1619:
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
	jc LB_1614
	btr QWORD [rdi],0
LB_1614:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1299_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1612
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1299_MTC_2_failed
LB_1612:
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
	jc LB_1607
	btr QWORD [rdi],0
LB_1607:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1299_MTC_2_failed:
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
NS_E_1301:
NS_E_RDI_1301:
NS_E_1301_ETR_TBL:
NS_E_1301_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1682
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1301_MTC_0_failed
LB_1682:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1690
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1690
	jmp LB_1691
LB_1690:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1688
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1688:
	jmp NS_E_1301_MTC_0_failed
LB_1691:
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
	jz LB_1695
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1696
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1696:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1697
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1697:
	jmp NS_E_1301_MTC_0_failed
LB_1695:
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
	jc LB_1675
	btr QWORD [rdi],2
LB_1675:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1676
	btr QWORD [rdi],1
LB_1676:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1677
	btr QWORD [rdi],0
LB_1677:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1301_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1658
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1301_MTC_1_failed
LB_1658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1666
	jmp LB_1667
LB_1666:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1664
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1664:
	jmp NS_E_1301_MTC_1_failed
LB_1667:
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
	jz LB_1671
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1672
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1672:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1673
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1673:
	jmp NS_E_1301_MTC_1_failed
LB_1671:
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
	jc LB_1651
	btr QWORD [rdi],2
LB_1651:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1652
	btr QWORD [rdi],1
LB_1652:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1653
	btr QWORD [rdi],0
LB_1653:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1301_MTC_1_failed:
	add rsp,48
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1649
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1301_MTC_2_failed
LB_1649:
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
	jc LB_1644
	btr QWORD [rdi],0
LB_1644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1301_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1301_MTC_3_failed
LB_1642:
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
	jc LB_1637
	btr QWORD [rdi],0
LB_1637:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1301_MTC_3_failed:
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
NS_E_1303:
NS_E_RDI_1303:
NS_E_1303_ETR_TBL:
NS_E_1303_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_1711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1711
	jmp LB_1712
LB_1711:
	jmp NS_E_1303_MTC_0_failed
LB_1712:
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
	jz LB_1716
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1717
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1717:
	jmp NS_E_1303_MTC_0_failed
LB_1716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_1726
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1726
	jmp LB_1727
LB_1726:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1723
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1723:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1724
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1724:
	jmp NS_E_1303_MTC_0_failed
LB_1727:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_1311_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1731
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1732
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1732:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1733
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1733:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1734
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1734:
	jmp NS_E_1303_MTC_0_failed
LB_1731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_1305_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1739
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1740
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1740:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1741
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1741:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1742
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1742:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1743:
	jmp NS_E_1303_MTC_0_failed
LB_1739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_1305_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1748
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1749
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1749:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1750
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1750:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1751
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1751:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1752
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1752:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1753
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1753:
	jmp NS_E_1303_MTC_0_failed
LB_1748:
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
	jc LB_1699
	btr QWORD [rdi],5
LB_1699:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1700
	btr QWORD [rdi],4
LB_1700:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1701
	btr QWORD [rdi],3
LB_1701:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1702
	btr QWORD [rdi],2
LB_1702:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1703
	btr QWORD [rdi],1
LB_1703:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1704
	btr QWORD [rdi],0
LB_1704:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,96
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1303_MTC_0_failed:
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
NS_E_1305:
NS_E_RDI_1305:
NS_E_1305_ETR_TBL:
NS_E_1305_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_1763
LB_1762:
	add r14,1
LB_1763:
	cmp r14,r10
	jge LB_1764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1762
	cmp al,10
	jz LB_1762
	cmp al,32
	jz LB_1762
LB_1764:
	add r14,3
	cmp r14,r10
	jg LB_1767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1767
	jmp LB_1768
LB_1767:
	jmp NS_E_1305_MTC_0_failed
LB_1768:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1770
LB_1769:
	add r14,1
LB_1770:
	cmp r14,r10
	jge LB_1771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1769
	cmp al,10
	jz LB_1769
	cmp al,32
	jz LB_1769
LB_1771:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1772
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1773
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1773:
	jmp NS_E_1305_MTC_0_failed
LB_1772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_1776
LB_1775:
	add r14,1
LB_1776:
	cmp r14,r10
	jge LB_1777
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1775
	cmp al,10
	jz LB_1775
	cmp al,32
	jz LB_1775
LB_1777:
	add r14,1
	cmp r14,r10
	jg LB_1782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1782
	jmp LB_1783
LB_1782:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1779
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1779:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1780:
	jmp NS_E_1305_MTC_0_failed
LB_1783:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_1785
LB_1784:
	add r14,1
LB_1785:
	cmp r14,r10
	jge LB_1786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1784
	cmp al,10
	jz LB_1784
	cmp al,32
	jz LB_1784
LB_1786:
	push r10
	call NS_E_1311_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1788
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1788:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1789
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1789:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1790
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1790:
	jmp NS_E_1305_MTC_0_failed
LB_1787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
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
	push r10
	call NS_E_1305_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1795
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1796
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1796:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1797
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1797:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1798
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1798:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1799:
	jmp NS_E_1305_MTC_0_failed
LB_1795:
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
	jc LB_1756
	btr QWORD [rdi],4
LB_1756:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1757
	btr QWORD [rdi],3
LB_1757:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1758
	btr QWORD [rdi],2
LB_1758:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1759
	btr QWORD [rdi],1
LB_1759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1760
	btr QWORD [rdi],0
LB_1760:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1305_MTC_0_failed:
	add rsp,80
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1305_MTC_1_failed:
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
NS_E_1307:
NS_E_RDI_1307:
NS_E_1307_ETR_TBL:
NS_E_1307_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_1868
LB_1867:
	add r14,1
LB_1868:
	cmp r14,r10
	jge LB_1869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1867
	cmp al,10
	jz LB_1867
	cmp al,32
	jz LB_1867
LB_1869:
	push r10
	call NS_E_1301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1870
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1307_MTC_0_failed
LB_1870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_1873
LB_1872:
	add r14,1
LB_1873:
	cmp r14,r10
	jge LB_1874
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1872
	cmp al,10
	jz LB_1872
	cmp al,32
	jz LB_1872
LB_1874:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1875
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1876
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1876:
	jmp NS_E_1307_MTC_0_failed
LB_1875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_1879
LB_1878:
	add r14,1
LB_1879:
	cmp r14,r10
	jge LB_1880
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1878
	cmp al,10
	jz LB_1878
	cmp al,32
	jz LB_1878
LB_1880:
	add r14,3
	cmp r14,r10
	jg LB_1885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_1885
	jmp LB_1886
LB_1885:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1882
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1882:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1883
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1883:
	jmp NS_E_1307_MTC_0_failed
LB_1886:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_1888
LB_1887:
	add r14,1
LB_1888:
	cmp r14,r10
	jge LB_1889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1887
	cmp al,10
	jz LB_1887
	cmp al,32
	jz LB_1887
LB_1889:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1890
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1891
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1891:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1892
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1892:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1893
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1893:
	jmp NS_E_1307_MTC_0_failed
LB_1890:
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
	jc LB_1862
	btr QWORD [rdi],3
LB_1862:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1863
	btr QWORD [rdi],2
LB_1863:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1864
	btr QWORD [rdi],1
LB_1864:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1865
	btr QWORD [rdi],0
LB_1865:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1307_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_1824
LB_1823:
	add r14,1
LB_1824:
	cmp r14,r10
	jge LB_1825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1823
	cmp al,10
	jz LB_1823
	cmp al,32
	jz LB_1823
LB_1825:
	add r14,1
	cmp r14,r10
	jg LB_1828
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_1828
	jmp LB_1829
LB_1828:
	jmp NS_E_1307_MTC_1_failed
LB_1829:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1831
LB_1830:
	add r14,1
LB_1831:
	cmp r14,r10
	jge LB_1832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1830
	cmp al,10
	jz LB_1830
	cmp al,32
	jz LB_1830
LB_1832:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1833
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1834
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1834:
	jmp NS_E_1307_MTC_1_failed
LB_1833:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_1837
LB_1836:
	add r14,1
LB_1837:
	cmp r14,r10
	jge LB_1838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1836
	cmp al,10
	jz LB_1836
	cmp al,32
	jz LB_1836
LB_1838:
	add r14,3
	cmp r14,r10
	jg LB_1843
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1843
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1843
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_1843
	jmp LB_1844
LB_1843:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1840
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1840:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1841
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1841:
	jmp NS_E_1307_MTC_1_failed
LB_1844:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_1846
LB_1845:
	add r14,1
LB_1846:
	cmp r14,r10
	jge LB_1847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1845
	cmp al,10
	jz LB_1845
	cmp al,32
	jz LB_1845
LB_1847:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1848
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1849
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1849:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1850
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1850:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1851
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1851:
	jmp NS_E_1307_MTC_1_failed
LB_1848:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_1854
LB_1853:
	add r14,1
LB_1854:
	cmp r14,r10
	jge LB_1855
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1853
	cmp al,10
	jz LB_1853
	cmp al,32
	jz LB_1853
LB_1855:
	push r10
	call NS_E_1309_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1856
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1857
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1857:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1858
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1858:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1859
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1860
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1860:
	jmp NS_E_1307_MTC_1_failed
LB_1856:
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
	jc LB_1817
	btr QWORD [rdi],4
LB_1817:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1818
	btr QWORD [rdi],3
LB_1818:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1819
	btr QWORD [rdi],2
LB_1819:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1820
	btr QWORD [rdi],1
LB_1820:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1821
	btr QWORD [rdi],0
LB_1821:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1307_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_1805
LB_1804:
	add r14,1
LB_1805:
	cmp r14,r10
	jge LB_1806
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1804
	cmp al,10
	jz LB_1804
	cmp al,32
	jz LB_1804
LB_1806:
	add r14,3
	cmp r14,r10
	jg LB_1809
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1809
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1809
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_1809
	jmp LB_1810
LB_1809:
	jmp NS_E_1307_MTC_2_failed
LB_1810:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1812
LB_1811:
	add r14,1
LB_1812:
	cmp r14,r10
	jge LB_1813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1811
	cmp al,10
	jz LB_1811
	cmp al,32
	jz LB_1811
LB_1813:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1815:
	jmp NS_E_1307_MTC_2_failed
LB_1814:
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
	jc LB_1801
	btr QWORD [rdi],1
LB_1801:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1802
	btr QWORD [rdi],0
LB_1802:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1307_MTC_2_failed:
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
NS_E_1309:
NS_E_RDI_1309:
NS_E_1309_ETR_TBL:
NS_E_1309_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
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
	add r14,1
	cmp r14,r10
	jg LB_1903
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_1903
	jmp LB_1904
LB_1903:
	jmp NS_E_1309_MTC_0_failed
LB_1904:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1906
LB_1905:
	add r14,1
LB_1906:
	cmp r14,r10
	jge LB_1907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1905
	cmp al,10
	jz LB_1905
	cmp al,32
	jz LB_1905
LB_1907:
	push r10
	call NS_E_1319_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1908
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1909
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1909:
	jmp NS_E_1309_MTC_0_failed
LB_1908:
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
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1309_MTC_0_failed:
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
NS_E_1311:
NS_E_RDI_1311:
NS_E_1311_ETR_TBL:
NS_E_1311_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_1313_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1916
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1311_MTC_0_failed
LB_1916:
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
	jc LB_1911
	btr QWORD [rdi],0
LB_1911:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1311_MTC_0_failed:
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
NS_E_1313:
NS_E_RDI_1313:
NS_E_1313_ETR_TBL:
NS_E_1313_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_1930
LB_1929:
	add r14,1
LB_1930:
	cmp r14,r10
	jge LB_1931
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1929
	cmp al,10
	jz LB_1929
	cmp al,32
	jz LB_1929
LB_1931:
	push r10
	call NS_E_1315_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1932
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1313_MTC_0_failed
LB_1932:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_1935
LB_1934:
	add r14,1
LB_1935:
	cmp r14,r10
	jge LB_1936
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1934
	cmp al,10
	jz LB_1934
	cmp al,32
	jz LB_1934
LB_1936:
	add r14,3
	cmp r14,r10
	jg LB_1940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_1940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_1940
	jmp LB_1941
LB_1940:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1938
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1938:
	jmp NS_E_1313_MTC_0_failed
LB_1941:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
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
	call NS_E_1313_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1946
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1947:
	jmp NS_E_1313_MTC_0_failed
LB_1945:
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
	jc LB_1925
	btr QWORD [rdi],2
LB_1925:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1926
	btr QWORD [rdi],1
LB_1926:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1927
	btr QWORD [rdi],0
LB_1927:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1313_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_1921
LB_1920:
	add r14,1
LB_1921:
	cmp r14,r10
	jge LB_1922
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1920
	cmp al,10
	jz LB_1920
	cmp al,32
	jz LB_1920
LB_1922:
	push r10
	call NS_E_1315_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1923
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1313_MTC_1_failed
LB_1923:
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
	jc LB_1918
	btr QWORD [rdi],0
LB_1918:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1313_MTC_1_failed:
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
NS_E_1315:
NS_E_RDI_1315:
NS_E_1315_ETR_TBL:
NS_E_1315_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_1961
LB_1960:
	add r14,1
LB_1961:
	cmp r14,r10
	jge LB_1962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1960
	cmp al,10
	jz LB_1960
	cmp al,32
	jz LB_1960
LB_1962:
	push r10
	call NS_E_1317_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1963
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1315_MTC_0_failed
LB_1963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_1966
LB_1965:
	add r14,1
LB_1966:
	cmp r14,r10
	jge LB_1967
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1965
	cmp al,10
	jz LB_1965
	cmp al,32
	jz LB_1965
LB_1967:
	add r14,3
	cmp r14,r10
	jg LB_1971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_1971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_1971
	jmp LB_1972
LB_1971:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1969
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1969:
	jmp NS_E_1315_MTC_0_failed
LB_1972:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_1974
LB_1973:
	add r14,1
LB_1974:
	cmp r14,r10
	jge LB_1975
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1973
	cmp al,10
	jz LB_1973
	cmp al,32
	jz LB_1973
LB_1975:
	push r10
	call NS_E_1317_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1976
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1977
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1977:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1978
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1978:
	jmp NS_E_1315_MTC_0_failed
LB_1976:
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
	jc LB_1956
	btr QWORD [rdi],2
LB_1956:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
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
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1315_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_1952
LB_1951:
	add r14,1
LB_1952:
	cmp r14,r10
	jge LB_1953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1951
	cmp al,10
	jz LB_1951
	cmp al,32
	jz LB_1951
LB_1953:
	push r10
	call NS_E_1317_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1954
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1315_MTC_1_failed
LB_1954:
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
	jc LB_1949
	btr QWORD [rdi],0
LB_1949:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1315_MTC_1_failed:
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
NS_E_1317:
NS_E_RDI_1317:
NS_E_1317_ETR_TBL:
NS_E_1317_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1985
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1317_MTC_0_failed
LB_1985:
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
	jc LB_1980
	btr QWORD [rdi],0
LB_1980:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1317_MTC_0_failed:
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
NS_E_1319:
NS_E_RDI_1319:
NS_E_1319_ETR_TBL:
NS_E_1319_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_1999
LB_1998:
	add r14,1
LB_1999:
	cmp r14,r10
	jge LB_2000
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1998
	cmp al,10
	jz LB_1998
	cmp al,32
	jz LB_1998
LB_2000:
	add r14,1
	cmp r14,r10
	jg LB_2003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_2003
	jmp LB_2004
LB_2003:
	jmp NS_E_1319_MTC_0_failed
LB_2004:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_2006
LB_2005:
	add r14,1
LB_2006:
	cmp r14,r10
	jge LB_2007
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2005
	cmp al,10
	jz LB_2005
	cmp al,32
	jz LB_2005
LB_2007:
	push r10
	call NS_E_1321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2008
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2009
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2009:
	jmp NS_E_1319_MTC_0_failed
LB_2008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_2012
LB_2011:
	add r14,1
LB_2012:
	cmp r14,r10
	jge LB_2013
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2011
	cmp al,10
	jz LB_2011
	cmp al,32
	jz LB_2011
LB_2013:
	add r14,1
	cmp r14,r10
	jg LB_2018
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_2018
	jmp LB_2019
LB_2018:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2015
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2015:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2016
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2016:
	jmp NS_E_1319_MTC_0_failed
LB_2019:
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
	jc LB_1994
	btr QWORD [rdi],2
LB_1994:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1995
	btr QWORD [rdi],1
LB_1995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1996
	btr QWORD [rdi],0
LB_1996:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1319_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_1990
LB_1989:
	add r14,1
LB_1990:
	cmp r14,r10
	jge LB_1991
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1989
	cmp al,10
	jz LB_1989
	cmp al,32
	jz LB_1989
LB_1991:
	push r10
	call NS_E_1323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1992
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1319_MTC_1_failed
LB_1992:
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
	jc LB_1987
	btr QWORD [rdi],0
LB_1987:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1319_MTC_1_failed:
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
NS_E_1321:
NS_E_RDI_1321:
NS_E_1321_ETR_TBL:
NS_E_1321_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_2025
LB_2024:
	add r14,1
LB_2025:
	cmp r14,r10
	jge LB_2026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2024
	cmp al,10
	jz LB_2024
	cmp al,32
	jz LB_2024
LB_2026:
	push r10
	call NS_E_1323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2027
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1321_MTC_0_failed
LB_2027:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_2030
LB_2029:
	add r14,1
LB_2030:
	cmp r14,r10
	jge LB_2031
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2029
	cmp al,10
	jz LB_2029
	cmp al,32
	jz LB_2029
LB_2031:
	push r10
	call NS_E_1321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2032
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2033
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2033:
	jmp NS_E_1321_MTC_0_failed
LB_2032:
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
	jc LB_2021
	btr QWORD [rdi],1
LB_2021:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2022
	btr QWORD [rdi],0
LB_2022:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1321_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1321_MTC_1_failed:
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
NS_E_1323:
NS_E_RDI_1323:
NS_E_1323_ETR_TBL:
NS_E_1323_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_2059
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_2059
	jmp LB_2060
LB_2059:
	jmp NS_E_1323_MTC_0_failed
LB_2060:
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
	jz LB_2064
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2065
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2065:
	jmp NS_E_1323_MTC_0_failed
LB_2064:
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
	jc LB_2051
	btr QWORD [rdi],1
LB_2051:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2052
	btr QWORD [rdi],0
LB_2052:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1323_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_2047
LB_2046:
	add r14,1
LB_2047:
	cmp r14,r10
	jge LB_2048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2046
	cmp al,10
	jz LB_2046
	cmp al,32
	jz LB_2046
LB_2048:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2049
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1323_MTC_1_failed
LB_2049:
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
	jc LB_2044
	btr QWORD [rdi],0
LB_2044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1323_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_2042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2042
	jmp LB_2043
LB_2042:
	jmp NS_E_1323_MTC_2_failed
LB_2043:
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
	jc LB_2035
	btr QWORD [rdi],0
LB_2035:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1323_MTC_2_failed:
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
NS_E_2079:
NS_E_RDI_2079:
; 	» "in0.mdls" _ ⊢ 0' : %_2067
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_73_6c_64_6d_2e_30_6e_69
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f20 %_2067 ⊢ { %_2068 %_2069 } : { %_2068 %_2069 }
 ; {>  %_2067~0':_stg }
; _f20 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_2069 ⊢ %_2070 : %_2070
 ; {>  %_2069~1':_stg %_2068~0':_stg }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2082
	btr r12,0
	jmp LB_2083
LB_2082:
	bts r12,0
LB_2083:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2084
	btr r12,1
	jmp LB_2085
LB_2084:
	bts r12,1
LB_2085:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2080
	btr r12,0
	jmp LB_2081
LB_2080:
	bts r12,0
LB_2081:
	add rsp,16
; » 0xr0 |~ {  } ⊢ %_2071 : %_2071
 ; {>  %_2070~1':_stg %_2068~0':_stg }
; 	» 0xr0 _ ⊢ 2' : %_2071
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f670 { %_2070 %_2071 } ⊢ { %_2072 %_2073 %_2074 } : { %_2072 %_2073 %_2074 }
 ; {>  %_2071~2':_r64 %_2070~1':_stg %_2068~0':_stg }
; _f670 { 1' 2' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_2088
	btr r12,0
	jmp LB_2089
LB_2088:
	bts r12,0
LB_2089:
	mov r14,r8
	bt r12,2
	jc LB_2090
	btr r12,1
	jmp LB_2091
LB_2090:
	bts r12,1
LB_2091:
	call NS_E_670
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 1' 2' 3' }
	mov r10,r9
	bt r12,3
	jc LB_2092
	btr r12,4
	jmp LB_2093
LB_2092:
	bts r12,4
LB_2093:
	mov r9,r10
	bt r12,4
	jc LB_2096
	btr r12,3
	jmp LB_2097
LB_2096:
	bts r12,3
LB_2097:
	mov rsi,1
	bt r12,3
	jc LB_2094
	mov rsi,0
	bt r9,0
	jc LB_2094
	jmp LB_2095
LB_2094:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2095:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
	mov r8,r14
	bt r12,1
	jc LB_2098
	btr r12,2
	jmp LB_2099
LB_2098:
	bts r12,2
LB_2099:
	mov r14,r13
	bt r12,0
	jc LB_2100
	btr r12,1
	jmp LB_2101
LB_2100:
	bts r12,1
LB_2101:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2086
	btr r12,0
	jmp LB_2087
LB_2086:
	bts r12,0
LB_2087:
	add rsp,16
; _f21 %_2074 ⊢ %_2075 : %_2075
 ; {>  %_2074~3':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_2073~2':_r64 %_2072~1':_stg %_2068~0':_stg }
; _f21 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2108
	btr r12,0
	jmp LB_2109
LB_2108:
	bts r12,0
LB_2109:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2110
	btr r12,3
	jmp LB_2111
LB_2110:
	bts r12,3
LB_2111:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2106
	btr r12,2
	jmp LB_2107
LB_2106:
	bts r12,2
LB_2107:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2104
	btr r12,1
	jmp LB_2105
LB_2104:
	bts r12,1
LB_2105:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2102
	btr r12,0
	jmp LB_2103
LB_2102:
	bts r12,0
LB_2103:
	add rsp,32
; _f1207 %_2072 ⊢ { %_2076 %_2077 } : { %_2076 %_2077 }
 ; {>  %_2073~2':_r64 %_2075~3':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_2072~1':_stg %_2068~0':_stg }
; _f1207 1' ⊢ { 1' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2118
	btr r12,0
	jmp LB_2119
LB_2118:
	bts r12,0
LB_2119:
	call NS_E_1207
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_2120
	btr r12,4
	jmp LB_2121
LB_2120:
	bts r12,4
LB_2121:
	mov r14,r13
	bt r12,0
	jc LB_2122
	btr r12,1
	jmp LB_2123
LB_2122:
	bts r12,1
LB_2123:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_2116
	btr r12,3
	jmp LB_2117
LB_2116:
	bts r12,3
LB_2117:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2114
	btr r12,2
	jmp LB_2115
LB_2114:
	bts r12,2
LB_2115:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2112
	btr r12,0
	jmp LB_2113
LB_2112:
	bts r12,0
LB_2113:
	add rsp,32
; _f21 %_2077 ⊢ %_2078 : %_2078
 ; {>  %_2073~2':_r64 %_2077~4':(_opn)◂(_stg) %_2076~1':_stg %_2075~3':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_2068~0':_stg }
; _f21 4' ⊢ 4'
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
	jc LB_2132
	btr r12,0
	jmp LB_2133
LB_2132:
	bts r12,0
LB_2133:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_2134
	btr r12,4
	jmp LB_2135
LB_2134:
	bts r12,4
LB_2135:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_2130
	btr r12,3
	jmp LB_2131
LB_2130:
	bts r12,3
LB_2131:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2128
	btr r12,2
	jmp LB_2129
LB_2128:
	bts r12,2
LB_2129:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2126
	btr r12,1
	jmp LB_2127
LB_2126:
	bts r12,1
LB_2127:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2124
	btr r12,0
	jmp LB_2125
LB_2124:
	bts r12,0
LB_2125:
	add rsp,40
; ∎ {  }
 ; {>  %_2073~2':_r64 %_2076~1':_stg %_2078~4':(_opn)◂(_stg) %_2075~3':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_2068~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_2136
	mov rdi,r8
	call dlt
LB_2136:
	bt r12,1
	jc LB_2137
	mov rdi,r14
	call dlt
LB_2137:
	bt r12,4
	jc LB_2138
	mov rdi,r10
	call dlt
LB_2138:
	bt r12,3
	jc LB_2139
	mov rdi,r9
	call dlt
LB_2139:
	bt r12,0
	jc LB_2140
	mov rdi,r13
	call dlt
LB_2140:
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
	NS_E_DYN_658:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_657:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_657
	NS_E_DYN_668:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_669:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_670:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_670
	NS_E_DYN_671:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_671
	NS_E_DYN_672:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_672
	NS_E_DYN_1106:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1106
	NS_E_DYN_1207:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1207
	CST_DYN_1271:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1324:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1325:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1295:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1295
	NS_E_DYN_1326:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1327:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1328:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1329:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1330:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_1331:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_1332:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_1297:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1297
	NS_E_DYN_1333:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1334:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1335:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1299:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1299
	NS_E_DYN_1336:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1337:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1338:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1339:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1301:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1301
	NS_E_DYN_1340:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1303:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1303
	NS_E_DYN_1341:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1342:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1305:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1305
	NS_E_DYN_1343:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1344:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1345:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1307:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1307
	NS_E_DYN_1346:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1309:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1309
	NS_E_DYN_1347:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1311:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1311
	NS_E_DYN_1348:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1349:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1313:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1313
	NS_E_DYN_1350:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1351:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1315:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1315
	NS_E_DYN_1352:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1317:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1317
	NS_E_DYN_1353:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1354:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1319:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1319
	NS_E_DYN_1355:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1356:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1321:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1321
	NS_E_DYN_1357:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1358:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1359:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1323:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1323
	CST_DYN_2079:
		dq 0x0000_0001_00_82_ffff
		dq 1
