%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1518
	call NS_E_2315
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
	jge err
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
	cmp r10,rax
	jge err
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
	jnz err
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
	jnz err
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
	jg LB_823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_823
	jmp LB_824
LB_823:
	jmp NS_E_670_MTC_0_failed
LB_824:
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
	jz LB_828
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_829:
	jmp NS_E_670_MTC_0_failed
LB_828:
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
	jz LB_834
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_835
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_835:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_836
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_836:
	jmp NS_E_670_MTC_0_failed
LB_834:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_816
	btr r12,2
	jmp LB_817
LB_816:
	bts r12,2
LB_817:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_814
	btr r12,1
	jmp LB_815
LB_814:
	bts r12,1
LB_815:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_812
	btr r12,0
	jmp LB_813
LB_812:
	bts r12,0
LB_813:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_809
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_838
	btr r12,3
	jmp LB_839
LB_838:
	bts r12,3
LB_839:
	mov r13,r14
	bt r12,1
	jc LB_840
	btr r12,0
	jmp LB_841
LB_840:
	bts r12,0
LB_841:
	mov r10,r8
	bt r12,2
	jc LB_842
	btr r12,4
	jmp LB_843
LB_842:
	bts r12,4
LB_843:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_846
	btr r12,5
	jmp LB_847
LB_846:
	bts r12,5
LB_847:
	mov r14,r11
	bt r12,5
	jc LB_844
	btr r12,1
	jmp LB_845
LB_844:
	bts r12,1
LB_845:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_850
	btr r12,5
	jmp LB_851
LB_850:
	bts r12,5
LB_851:
	mov r8,r11
	bt r12,5
	jc LB_848
	btr r12,2
	jmp LB_849
LB_848:
	bts r12,2
LB_849:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f21 { %_673 %_674 %_675 } ⊢ { %_676 %_677 %_678 } : { %_676 %_677 %_678 }
 ; {>  %_674~1':_r64 %_675~2':(_lst)◂(_p667) %_673~0':_r64 }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_760
	btr r12,3
	jmp LB_761
LB_760:
	bts r12,3
LB_761:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_764
	btr r12,4
	jmp LB_765
LB_764:
	bts r12,4
LB_765:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_762
	btr QWORD [rdi],0
	jmp LB_763
LB_762:
	bts QWORD [rdi],0
LB_763:
	mov r10,r14
	bt r12,1
	jc LB_768
	btr r12,4
	jmp LB_769
LB_768:
	bts r12,4
LB_769:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_766
	btr QWORD [rdi],1
	jmp LB_767
LB_766:
	bts QWORD [rdi],1
LB_767:
	mov r10,r8
	bt r12,2
	jc LB_772
	btr r12,4
	jmp LB_773
LB_772:
	bts r12,4
LB_773:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_770
	btr QWORD [rdi],2
	jmp LB_771
LB_770:
	bts QWORD [rdi],2
LB_771:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_774
	btr r12,3
	jmp LB_775
LB_774:
	bts r12,3
LB_775:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_778
	btr r12,4
	jmp LB_779
LB_778:
	bts r12,4
LB_779:
	mov r13,r10
	bt r12,4
	jc LB_776
	btr r12,0
	jmp LB_777
LB_776:
	bts r12,0
LB_777:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_782
	btr r12,4
	jmp LB_783
LB_782:
	bts r12,4
LB_783:
	mov r14,r10
	bt r12,4
	jc LB_780
	btr r12,1
	jmp LB_781
LB_780:
	bts r12,1
LB_781:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_786
	btr r12,4
	jmp LB_787
LB_786:
	bts r12,4
LB_787:
	mov r8,r10
	bt r12,4
	jc LB_784
	btr r12,2
	jmp LB_785
LB_784:
	bts r12,2
LB_785:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr2 |~ {  } ⊢ %_679 : %_679
 ; {>  %_678~2':(_lst)◂(_p667) %_676~0':_r64 %_677~1':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_679
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_679 %_676 } ⊢ { %_680 %_681 } : { %_680 %_681 }
 ; {>  %_678~2':(_lst)◂(_p667) %_679~3':_r64 %_676~0':_r64 %_677~1':_r64 }
	add r9,r13
; _f668 %_680 ⊢ %_682 : %_682
 ; {>  %_681~0':_r64 %_678~2':(_lst)◂(_p667) %_680~3':_r64 %_677~1':_r64 }
; _f668 3' ⊢ °0◂3'
; _cns { %_682 %_678 } ⊢ %_683 : %_683
 ; {>  %_681~0':_r64 %_678~2':(_lst)◂(_p667) %_682~°0◂3':_p667 %_677~1':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_677 %_683 } ⊢ %_684 : %_684
 ; {>  %_681~0':_r64 %_683~°0◂{ °0◂3' 2' }:(_lst)◂(_p667) %_677~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_684
 ; {>  %_681~0':_r64 %_684~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_788
	mov rdi,r13
	call dlt
LB_788:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_789
	btr r12,0
	jmp LB_790
LB_789:
	bts r12,0
LB_790:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_793
	btr r12,4
	jmp LB_794
LB_793:
	bts r12,4
LB_794:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_791
	btr QWORD [rdi],0
	jmp LB_792
LB_791:
	bts QWORD [rdi],0
LB_792:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_803
	btr r12,1
	jmp LB_804
LB_803:
	bts r12,1
LB_804:
	mov rsi,1
	bt r12,1
	jc LB_801
	mov rsi,0
	bt r14,0
	jc LB_801
	jmp LB_802
LB_801:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_802:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_799
	btr QWORD [rdi],0
	jmp LB_800
LB_799:
	bts QWORD [rdi],0
LB_800:
	mov r14,r8
	bt r12,2
	jc LB_807
	btr r12,1
	jmp LB_808
LB_807:
	bts r12,1
LB_808:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_805
	btr QWORD [rdi],1
	jmp LB_806
LB_805:
	bts QWORD [rdi],1
LB_806:
	mov rsi,1
	bt r12,4
	jc LB_797
	mov rsi,0
	bt r10,0
	jc LB_797
	jmp LB_798
LB_797:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_798:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_795
	btr QWORD [rdi],1
	jmp LB_796
LB_795:
	bts QWORD [rdi],1
LB_796:
	mov r8,0
	bts r12,2
	ret
LB_809:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_811
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_810
LB_811:
	add rsp,8
	ret
NS_E_670_MTC_0_failed:
	add rsp,48
	pop r14
LB_810:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_915
	jmp LB_916
LB_915:
	jmp NS_E_670_MTC_1_failed
LB_916:
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
	jz LB_920
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_921:
	jmp NS_E_670_MTC_1_failed
LB_920:
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
	jz LB_926
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_927
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_927:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_928
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_928:
	jmp NS_E_670_MTC_1_failed
LB_926:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_908
	btr r12,2
	jmp LB_909
LB_908:
	bts r12,2
LB_909:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_906
	btr r12,1
	jmp LB_907
LB_906:
	bts r12,1
LB_907:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_904
	btr r12,0
	jmp LB_905
LB_904:
	bts r12,0
LB_905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_901
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_930
	btr r12,3
	jmp LB_931
LB_930:
	bts r12,3
LB_931:
	mov r13,r14
	bt r12,1
	jc LB_932
	btr r12,0
	jmp LB_933
LB_932:
	bts r12,0
LB_933:
	mov r10,r8
	bt r12,2
	jc LB_934
	btr r12,4
	jmp LB_935
LB_934:
	bts r12,4
LB_935:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_938
	btr r12,5
	jmp LB_939
LB_938:
	bts r12,5
LB_939:
	mov r14,r11
	bt r12,5
	jc LB_936
	btr r12,1
	jmp LB_937
LB_936:
	bts r12,1
LB_937:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_942
	btr r12,5
	jmp LB_943
LB_942:
	bts r12,5
LB_943:
	mov r8,r11
	bt r12,5
	jc LB_940
	btr r12,2
	jmp LB_941
LB_940:
	bts r12,2
LB_941:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f21 { %_685 %_686 %_687 } ⊢ { %_688 %_689 %_690 } : { %_688 %_689 %_690 }
 ; {>  %_686~1':_r64 %_687~2':(_lst)◂(_p667) %_685~0':_r64 }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_852
	btr r12,3
	jmp LB_853
LB_852:
	bts r12,3
LB_853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_856
	btr r12,4
	jmp LB_857
LB_856:
	bts r12,4
LB_857:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_854
	btr QWORD [rdi],0
	jmp LB_855
LB_854:
	bts QWORD [rdi],0
LB_855:
	mov r10,r14
	bt r12,1
	jc LB_860
	btr r12,4
	jmp LB_861
LB_860:
	bts r12,4
LB_861:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_858
	btr QWORD [rdi],1
	jmp LB_859
LB_858:
	bts QWORD [rdi],1
LB_859:
	mov r10,r8
	bt r12,2
	jc LB_864
	btr r12,4
	jmp LB_865
LB_864:
	bts r12,4
LB_865:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_862
	btr QWORD [rdi],2
	jmp LB_863
LB_862:
	bts QWORD [rdi],2
LB_863:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_866
	btr r12,3
	jmp LB_867
LB_866:
	bts r12,3
LB_867:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_870
	btr r12,4
	jmp LB_871
LB_870:
	bts r12,4
LB_871:
	mov r13,r10
	bt r12,4
	jc LB_868
	btr r12,0
	jmp LB_869
LB_868:
	bts r12,0
LB_869:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_874
	btr r12,4
	jmp LB_875
LB_874:
	bts r12,4
LB_875:
	mov r14,r10
	bt r12,4
	jc LB_872
	btr r12,1
	jmp LB_873
LB_872:
	bts r12,1
LB_873:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_878
	btr r12,4
	jmp LB_879
LB_878:
	bts r12,4
LB_879:
	mov r8,r10
	bt r12,4
	jc LB_876
	btr r12,2
	jmp LB_877
LB_876:
	bts r12,2
LB_877:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr2 |~ {  } ⊢ %_691 : %_691
 ; {>  %_689~1':_r64 %_688~0':_r64 %_690~2':(_lst)◂(_p667) }
; 	» 0xr2 _ ⊢ 3' : %_691
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_691 %_688 } ⊢ { %_692 %_693 } : { %_692 %_693 }
 ; {>  %_691~3':_r64 %_689~1':_r64 %_688~0':_r64 %_690~2':(_lst)◂(_p667) }
	add r9,r13
; _f668 %_692 ⊢ %_694 : %_694
 ; {>  %_692~3':_r64 %_689~1':_r64 %_690~2':(_lst)◂(_p667) %_693~0':_r64 }
; _f668 3' ⊢ °0◂3'
; _cns { %_694 %_690 } ⊢ %_695 : %_695
 ; {>  %_694~°0◂3':_p667 %_689~1':_r64 %_690~2':(_lst)◂(_p667) %_693~0':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_689 %_695 } ⊢ %_696 : %_696
 ; {>  %_695~°0◂{ °0◂3' 2' }:(_lst)◂(_p667) %_689~1':_r64 %_693~0':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_696
 ; {>  %_696~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_693~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_880
	mov rdi,r13
	call dlt
LB_880:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_881
	btr r12,0
	jmp LB_882
LB_881:
	bts r12,0
LB_882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_885
	btr r12,4
	jmp LB_886
LB_885:
	bts r12,4
LB_886:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_883
	btr QWORD [rdi],0
	jmp LB_884
LB_883:
	bts QWORD [rdi],0
LB_884:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_895
	btr r12,1
	jmp LB_896
LB_895:
	bts r12,1
LB_896:
	mov rsi,1
	bt r12,1
	jc LB_893
	mov rsi,0
	bt r14,0
	jc LB_893
	jmp LB_894
LB_893:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_894:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_891
	btr QWORD [rdi],0
	jmp LB_892
LB_891:
	bts QWORD [rdi],0
LB_892:
	mov r14,r8
	bt r12,2
	jc LB_899
	btr r12,1
	jmp LB_900
LB_899:
	bts r12,1
LB_900:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_897
	btr QWORD [rdi],1
	jmp LB_898
LB_897:
	bts QWORD [rdi],1
LB_898:
	mov rsi,1
	bt r12,4
	jc LB_889
	mov rsi,0
	bt r10,0
	jc LB_889
	jmp LB_890
LB_889:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_890:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_887
	btr QWORD [rdi],1
	jmp LB_888
LB_887:
	bts QWORD [rdi],1
LB_888:
	mov r8,0
	bts r12,2
	ret
LB_901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_903
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_902
LB_903:
	add rsp,8
	ret
NS_E_670_MTC_1_failed:
	add rsp,48
	pop r14
LB_902:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1151
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_670_MTC_2_failed
LB_1151:
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
	jz LB_1156
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1157
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1157:
	jmp NS_E_670_MTC_2_failed
LB_1156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1146
	btr r12,1
	jmp LB_1147
LB_1146:
	bts r12,1
LB_1147:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1144
	btr r12,0
	jmp LB_1145
LB_1144:
	bts r12,0
LB_1145:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1141
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_1159
	btr r12,3
	jmp LB_1160
LB_1159:
	bts r12,3
LB_1160:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1163
	btr r12,4
	jmp LB_1164
LB_1163:
	bts r12,4
LB_1164:
	mov r14,r10
	bt r12,4
	jc LB_1161
	btr r12,1
	jmp LB_1162
LB_1161:
	bts r12,1
LB_1162:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1167
	btr r12,4
	jmp LB_1168
LB_1167:
	bts r12,4
LB_1168:
	mov r8,r10
	bt r12,4
	jc LB_1165
	btr r12,2
	jmp LB_1166
LB_1165:
	bts r12,2
LB_1166:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f21 { %_697 %_698 %_699 } ⊢ { %_700 %_701 %_702 } : { %_700 %_701 %_702 }
 ; {>  %_698~1':_r64 %_699~2':(_lst)◂(_p667) %_697~0':_r64 }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_944
	btr r12,3
	jmp LB_945
LB_944:
	bts r12,3
LB_945:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_948
	btr r12,4
	jmp LB_949
LB_948:
	bts r12,4
LB_949:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_946
	btr QWORD [rdi],0
	jmp LB_947
LB_946:
	bts QWORD [rdi],0
LB_947:
	mov r10,r14
	bt r12,1
	jc LB_952
	btr r12,4
	jmp LB_953
LB_952:
	bts r12,4
LB_953:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_950
	btr QWORD [rdi],1
	jmp LB_951
LB_950:
	bts QWORD [rdi],1
LB_951:
	mov r10,r8
	bt r12,2
	jc LB_956
	btr r12,4
	jmp LB_957
LB_956:
	bts r12,4
LB_957:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_954
	btr QWORD [rdi],2
	jmp LB_955
LB_954:
	bts QWORD [rdi],2
LB_955:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_958
	btr r12,3
	jmp LB_959
LB_958:
	bts r12,3
LB_959:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_962
	btr r12,4
	jmp LB_963
LB_962:
	bts r12,4
LB_963:
	mov r13,r10
	bt r12,4
	jc LB_960
	btr r12,0
	jmp LB_961
LB_960:
	bts r12,0
LB_961:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_966
	btr r12,4
	jmp LB_967
LB_966:
	bts r12,4
LB_967:
	mov r14,r10
	bt r12,4
	jc LB_964
	btr r12,1
	jmp LB_965
LB_964:
	bts r12,1
LB_965:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_970
	btr r12,4
	jmp LB_971
LB_970:
	bts r12,4
LB_971:
	mov r8,r10
	bt r12,4
	jc LB_968
	btr r12,2
	jmp LB_969
LB_968:
	bts r12,2
LB_969:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_702 ⊢ %_703 : %_703
 ; {>  %_701~1':_r64 %_700~0':_r64 %_702~2':(_lst)◂(_p667) }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_976
	btr r12,0
	jmp LB_977
LB_976:
	bts r12,0
LB_977:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_978
	btr r12,2
	jmp LB_979
LB_978:
	bts r12,2
LB_979:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_974
	btr r12,1
	jmp LB_975
LB_974:
	bts r12,1
LB_975:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_972
	btr r12,0
	jmp LB_973
LB_972:
	bts r12,0
LB_973:
	add rsp,24
MTC_LB_980:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_981
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_982
	bt QWORD [rax],0
	jc LB_983
	btr r12,5
	jmp LB_984
LB_983:
	bts r12,5
LB_984:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_982:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_987
	btr r12,6
	jmp LB_988
LB_987:
	bts r12,6
LB_988:
	mov r9,rcx
	bt r12,6
	jc LB_985
	btr r12,3
	jmp LB_986
LB_985:
	bts r12,3
LB_986:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_991
	btr r12,6
	jmp LB_992
LB_991:
	bts r12,6
LB_992:
	mov r10,rcx
	bt r12,6
	jc LB_989
	btr r12,4
	jmp LB_990
LB_989:
	bts r12,4
LB_990:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_981
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_993
	bt QWORD [rax],0
	jc LB_994
	btr r12,6
	jmp LB_995
LB_994:
	bts r12,6
LB_995:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_993:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_996
	btr r12,5
	jmp LB_997
LB_996:
	bts r12,5
LB_997:
LB_998:
	cmp r15,0
	jz LB_999
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_998
LB_999:
; _f21 { %_706 %_705 } ⊢ { %_707 %_708 } : { %_707 %_708 }
 ; {>  %_701~1':_r64 %_706~5':_r64 %_700~0':_r64 %_705~4':(_lst)◂(_p667) }
; _f21 { 5' 4' } ⊢ { 2' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 5' 4' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_1006
	btr r12,1
	jmp LB_1007
LB_1006:
	bts r12,1
LB_1007:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1004
	btr QWORD [rdi],0
	jmp LB_1005
LB_1004:
	bts QWORD [rdi],0
LB_1005:
	mov r14,r10
	bt r12,4
	jc LB_1010
	btr r12,1
	jmp LB_1011
LB_1010:
	bts r12,1
LB_1011:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1008
	btr QWORD [rdi],1
	jmp LB_1009
LB_1008:
	bts QWORD [rdi],1
LB_1009:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 2' 3' }
; 0' ⊢ { 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_1014
	btr r12,1
	jmp LB_1015
LB_1014:
	bts r12,1
LB_1015:
	mov r8,r14
	bt r12,1
	jc LB_1012
	btr r12,2
	jmp LB_1013
LB_1012:
	bts r12,2
LB_1013:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_1018
	btr r12,1
	jmp LB_1019
LB_1018:
	bts r12,1
LB_1019:
	mov r9,r14
	bt r12,1
	jc LB_1016
	btr r12,3
	jmp LB_1017
LB_1016:
	bts r12,3
LB_1017:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1002
	btr r12,1
	jmp LB_1003
LB_1002:
	bts r12,1
LB_1003:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1000
	btr r12,0
	jmp LB_1001
LB_1000:
	bts r12,0
LB_1001:
	add rsp,24
; » 0xr1 |~ {  } ⊢ %_709 : %_709
 ; {>  %_701~1':_r64 %_700~0':_r64 %_708~3':(_lst)◂(_p667) %_707~2':_r64 }
; 	» 0xr1 _ ⊢ 4' : %_709
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _f34 { %_707 %_709 } ⊢ { %_710 %_711 } : { %_710 %_711 }
 ; {>  %_701~1':_r64 %_709~4':_r64 %_700~0':_r64 %_708~3':(_lst)◂(_p667) %_707~2':_r64 }
	add r8,r10
; _f34 { %_701 %_711 } ⊢ { %_712 %_713 } : { %_712 %_713 }
 ; {>  %_710~2':_r64 %_701~1':_r64 %_711~4':_r64 %_700~0':_r64 %_708~3':(_lst)◂(_p667) }
	add r14,r10
; _f669 %_710 ⊢ %_714 : %_714
 ; {>  %_710~2':_r64 %_713~4':_r64 %_712~1':_r64 %_700~0':_r64 %_708~3':(_lst)◂(_p667) }
; _f669 2' ⊢ °1◂2'
; _cns { %_714 %_708 } ⊢ %_715 : %_715
 ; {>  %_713~4':_r64 %_712~1':_r64 %_714~°1◂2':_p667 %_700~0':_r64 %_708~3':(_lst)◂(_p667) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _some { %_712 %_715 } ⊢ %_716 : %_716
 ; {>  %_713~4':_r64 %_712~1':_r64 %_715~°0◂{ °1◂2' 3' }:(_lst)◂(_p667) %_700~0':_r64 }
; _some { 1' °0◂{ °1◂2' 3' } } ⊢ °0◂{ 1' °0◂{ °1◂2' 3' } }
; ∎ %_716
 ; {>  %_713~4':_r64 %_716~°0◂{ 1' °0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_700~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂2' 3' } }
	bt r12,4
	jc LB_1020
	mov rdi,r10
	call dlt
LB_1020:
	bt r12,0
	jc LB_1021
	mov rdi,r13
	call dlt
LB_1021:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_1022
	btr r12,0
	jmp LB_1023
LB_1022:
	bts r12,0
LB_1023:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_1026
	btr r12,4
	jmp LB_1027
LB_1026:
	bts r12,4
LB_1027:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1024
	btr QWORD [rdi],0
	jmp LB_1025
LB_1024:
	bts QWORD [rdi],0
LB_1025:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r8
	bt r12,2
	jc LB_1036
	btr r12,1
	jmp LB_1037
LB_1036:
	bts r12,1
LB_1037:
	mov rsi,1
	bt r12,1
	jc LB_1034
	mov rsi,0
	bt r14,0
	jc LB_1034
	jmp LB_1035
LB_1034:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1035:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1032
	btr QWORD [rdi],0
	jmp LB_1033
LB_1032:
	bts QWORD [rdi],0
LB_1033:
	mov r14,r13
	bt r12,0
	jc LB_1040
	btr r12,1
	jmp LB_1041
LB_1040:
	bts r12,1
LB_1041:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1038
	btr QWORD [rdi],1
	jmp LB_1039
LB_1038:
	bts QWORD [rdi],1
LB_1039:
	mov rsi,1
	bt r12,4
	jc LB_1030
	mov rsi,0
	bt r10,0
	jc LB_1030
	jmp LB_1031
LB_1030:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_1031:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1028
	btr QWORD [rdi],1
	jmp LB_1029
LB_1028:
	bts QWORD [rdi],1
LB_1029:
	mov r8,0
	bts r12,2
	ret
MTC_LB_981:
	mov r15,0
LB_1043:
	cmp r15,0
	jz LB_1044
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1043
LB_1044:
; _f21 %_703 ⊢ %_717 : %_717
 ; {>  %_701~1':_r64 %_700~0':_r64 %_703~2':(_lst)◂(_p667) }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1049
	btr r12,0
	jmp LB_1050
LB_1049:
	bts r12,0
LB_1050:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1051
	btr r12,2
	jmp LB_1052
LB_1051:
	bts r12,2
LB_1052:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1047
	btr r12,1
	jmp LB_1048
LB_1047:
	bts r12,1
LB_1048:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1045
	btr r12,0
	jmp LB_1046
LB_1045:
	bts r12,0
LB_1046:
	add rsp,24
; » 0xr1 |~ {  } ⊢ %_718 : %_718
 ; {>  %_701~1':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_718
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f21 %_718 ⊢ %_719 : %_719
 ; {>  %_701~1':_r64 %_718~3':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 }
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
	jc LB_1059
	btr r12,0
	jmp LB_1060
LB_1059:
	bts r12,0
LB_1060:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_1061
	btr r12,3
	jmp LB_1062
LB_1061:
	bts r12,3
LB_1062:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1057
	btr r12,2
	jmp LB_1058
LB_1057:
	bts r12,2
LB_1058:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1055
	btr r12,1
	jmp LB_1056
LB_1055:
	bts r12,1
LB_1056:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1053
	btr r12,0
	jmp LB_1054
LB_1053:
	bts r12,0
LB_1054:
	add rsp,32
; _f34 { %_701 %_719 } ⊢ { %_720 %_721 } : { %_720 %_721 }
 ; {>  %_701~1':_r64 %_719~3':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 }
	add r14,r9
; _f21 { %_720 %_721 } ⊢ { %_722 %_723 } : { %_722 %_723 }
 ; {>  %_720~1':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 %_721~3':_r64 }
; _f21 { 1' 3' } ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 1' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_1069
	btr r12,2
	jmp LB_1070
LB_1069:
	bts r12,2
LB_1070:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_1067
	btr QWORD [rdi],0
	jmp LB_1068
LB_1067:
	bts QWORD [rdi],0
LB_1068:
	mov r8,r9
	bt r12,3
	jc LB_1073
	btr r12,2
	jmp LB_1074
LB_1073:
	bts r12,2
LB_1074:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_1071
	btr QWORD [rdi],1
	jmp LB_1072
LB_1071:
	bts QWORD [rdi],1
LB_1072:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 3' }
; 0' ⊢ { 1' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1077
	btr r12,2
	jmp LB_1078
LB_1077:
	bts r12,2
LB_1078:
	mov r14,r8
	bt r12,2
	jc LB_1075
	btr r12,1
	jmp LB_1076
LB_1075:
	bts r12,1
LB_1076:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_1081
	btr r12,2
	jmp LB_1082
LB_1081:
	bts r12,2
LB_1082:
	mov r9,r8
	bt r12,2
	jc LB_1079
	btr r12,3
	jmp LB_1080
LB_1079:
	bts r12,3
LB_1080:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1065
	btr r12,2
	jmp LB_1066
LB_1065:
	bts r12,2
LB_1066:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1063
	btr r12,0
	jmp LB_1064
LB_1063:
	bts r12,0
LB_1064:
	add rsp,24
; _f669 %_723 ⊢ %_724 : %_724
 ; {>  %_723~3':_r64 %_722~1':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 }
; _f669 3' ⊢ °1◂3'
; _f21 %_724 ⊢ %_725 : %_725
 ; {>  %_722~1':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 %_724~°1◂3':_p667 }
; _f21 °1◂3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},°1◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1091
	btr r12,0
	jmp LB_1092
LB_1091:
	bts r12,0
LB_1092:
	mov rsi,1
	bt r12,0
	jc LB_1089
	mov rsi,0
	bt r13,0
	jc LB_1089
	jmp LB_1090
LB_1089:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1090:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_1093
	btr r12,3
	jmp LB_1094
LB_1093:
	bts r12,3
LB_1094:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1087
	btr r12,2
	jmp LB_1088
LB_1087:
	bts r12,2
LB_1088:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1085
	btr r12,1
	jmp LB_1086
LB_1085:
	bts r12,1
LB_1086:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1083
	btr r12,0
	jmp LB_1084
LB_1083:
	bts r12,0
LB_1084:
	add rsp,32
; _f21 %_717 ⊢ %_726 : %_726
 ; {>  %_725~3':_p667 %_722~1':_r64 %_717~2':(_lst)◂(_p667) %_700~0':_r64 }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1101
	btr r12,0
	jmp LB_1102
LB_1101:
	bts r12,0
LB_1102:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1103
	btr r12,2
	jmp LB_1104
LB_1103:
	bts r12,2
LB_1104:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1099
	btr r12,3
	jmp LB_1100
LB_1099:
	bts r12,3
LB_1100:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1097
	btr r12,1
	jmp LB_1098
LB_1097:
	bts r12,1
LB_1098:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1095
	btr r12,0
	jmp LB_1096
LB_1095:
	bts r12,0
LB_1096:
	add rsp,32
; _cns { %_725 %_726 } ⊢ %_727 : %_727
 ; {>  %_725~3':_p667 %_722~1':_r64 %_700~0':_r64 %_726~2':(_lst)◂(_p667) }
; _cns { 3' 2' } ⊢ °0◂{ 3' 2' }
; _f21 %_727 ⊢ %_728 : %_728
 ; {>  %_722~1':_r64 %_727~°0◂{ 3' 2' }:(_lst)◂(_p667) %_700~0':_r64 }
; _f21 °0◂{ 3' 2' } ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},°0◂{ 3' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r9
	bt r12,3
	jc LB_1113
	btr r12,1
	jmp LB_1114
LB_1113:
	bts r12,1
LB_1114:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1111
	btr QWORD [rdi],0
	jmp LB_1112
LB_1111:
	bts QWORD [rdi],0
LB_1112:
	mov r14,r8
	bt r12,2
	jc LB_1117
	btr r12,1
	jmp LB_1118
LB_1117:
	bts r12,1
LB_1118:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1115
	btr QWORD [rdi],1
	jmp LB_1116
LB_1115:
	bts QWORD [rdi],1
LB_1116:
	mov rsi,1
	bt r12,0
	jc LB_1109
	mov rsi,0
	bt r13,0
	jc LB_1109
	jmp LB_1110
LB_1109:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1110:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1119
	btr r12,2
	jmp LB_1120
LB_1119:
	bts r12,2
LB_1120:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1107
	btr r12,1
	jmp LB_1108
LB_1107:
	bts r12,1
LB_1108:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1105
	btr r12,0
	jmp LB_1106
LB_1105:
	bts r12,0
LB_1106:
	add rsp,24
; _some { %_722 %_728 } ⊢ %_729 : %_729
 ; {>  %_722~1':_r64 %_728~2':(_lst)◂(_p667) %_700~0':_r64 }
; _some { 1' 2' } ⊢ °0◂{ 1' 2' }
; _f21 %_729 ⊢ %_730 : %_730
 ; {>  %_729~°0◂{ 1' 2' }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_700~0':_r64 }
; _f21 °0◂{ 1' 2' } ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂{ 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_1127
	btr r12,3
	jmp LB_1128
LB_1127:
	bts r12,3
LB_1128:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1125
	btr QWORD [rdi],0
	jmp LB_1126
LB_1125:
	bts QWORD [rdi],0
LB_1126:
	mov r9,r8
	bt r12,2
	jc LB_1131
	btr r12,3
	jmp LB_1132
LB_1131:
	bts r12,3
LB_1132:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1129
	btr QWORD [rdi],1
	jmp LB_1130
LB_1129:
	bts QWORD [rdi],1
LB_1130:
	mov rsi,1
	bt r12,0
	jc LB_1123
	mov rsi,0
	bt r13,0
	jc LB_1123
	jmp LB_1124
LB_1123:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1124:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1133
	btr r12,1
	jmp LB_1134
LB_1133:
	bts r12,1
LB_1134:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1121
	btr r12,0
	jmp LB_1122
LB_1121:
	bts r12,0
LB_1122:
	add rsp,16
; ∎ %_730
 ; {>  %_700~0':_r64 %_730~1':(_opn)◂({ _r64 (_lst)◂(_p667) }) }
; 	∎ 1'
	bt r12,0
	jc LB_1135
	mov rdi,r13
	call dlt
LB_1135:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 2'◂3'
; 1' ⊢ 2'◂3'
	btr r12,0
	mov r8,r14
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_1136
	bt QWORD [rax],0
	jc LB_1137
	btr r12,0
	jmp LB_1138
LB_1137:
	bts r12,0
LB_1138:
	mov rdi,QWORD [rax+8*1]
	mov QWORD [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_1136:
	mov r13,rax
	mov r9,r13
	bt r12,0
	jc LB_1139
	btr r12,3
	jmp LB_1140
LB_1139:
	bts r12,3
LB_1140:
	ret
MTC_LB_1042:
LB_1141:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1143
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1142
LB_1143:
	add rsp,8
	ret
NS_E_670_MTC_2_failed:
	add rsp,32
	pop r14
LB_1142:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_1178
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_731
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_731 ⊢ %_732 : %_732
 ; {>  %_731~0':_stg }
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
; _nil {  } ⊢ %_733 : %_733
 ; {>  %_732~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_734 : %_734
 ; {>  %_732~0':_stg %_733~°1◂{  }:(_lst)◂(t400'(0)) }
; 	» 0xr0 _ ⊢ 1' : %_734
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_734 %_733 } ⊢ %_735 : %_735
 ; {>  %_732~0':_stg %_734~1':_r64 %_733~°1◂{  }:(_lst)◂(t400'(0)) }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_735
 ; {>  %_735~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t404'(0)) }) %_732~0':_stg }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_1169
	mov rdi,r13
	call dlt
LB_1169:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_1172
	btr r12,0
	jmp LB_1173
LB_1172:
	bts r12,0
LB_1173:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_1170
	btr QWORD [rdi],0
	jmp LB_1171
LB_1170:
	bts QWORD [rdi],0
LB_1171:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_1176
	mov rsi,0
	bt r13,0
	jc LB_1176
	jmp LB_1177
LB_1176:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1177:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_1174
	btr QWORD [rdi],1
	jmp LB_1175
LB_1174:
	bts QWORD [rdi],1
LB_1175:
	mov r8,0
	bts r12,2
	ret
LB_1178:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1180
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1179
LB_1180:
	add rsp,8
	ret
NS_E_670_MTC_3_failed:
	add rsp,0
	pop r14
LB_1179:
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
	jg LB_1193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_1193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_1193
	jmp LB_1194
LB_1193:
	jmp NS_E_671_MTC_0_failed
LB_1194:
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
	jc LB_1186
	btr r12,0
	jmp LB_1187
LB_1186:
	bts r12,0
LB_1187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1183
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_736 : %_736
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_736
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_736 ⊢ %_737 : %_737
 ; {>  %_736~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_737
 ; {>  %_737~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1181
	btr r12,3
	jmp LB_1182
LB_1181:
	bts r12,3
LB_1182:
	mov r8,0
	bts r12,2
	ret
LB_1183:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1185
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1184
LB_1185:
	add rsp,8
	ret
NS_E_671_MTC_0_failed:
	add rsp,16
	pop r14
LB_1184:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_1213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_1213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_1213
	jmp LB_1214
LB_1213:
	jmp NS_E_671_MTC_1_failed
LB_1214:
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
	jz LB_1218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1219:
	jmp NS_E_671_MTC_1_failed
LB_1218:
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
	jz LB_1224
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1225
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1225:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1226
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1226:
	jmp NS_E_671_MTC_1_failed
LB_1224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1206
	btr r12,2
	jmp LB_1207
LB_1206:
	bts r12,2
LB_1207:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1204
	btr r12,1
	jmp LB_1205
LB_1204:
	bts r12,1
LB_1205:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1202
	btr r12,0
	jmp LB_1203
LB_1202:
	bts r12,0
LB_1203:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_1199
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_1228
	btr r12,3
	jmp LB_1229
LB_1228:
	bts r12,3
LB_1229:
	mov r14,r8
	bt r12,2
	jc LB_1230
	btr r12,1
	jmp LB_1231
LB_1230:
	bts r12,1
LB_1231:
	mov r8,r13
	bt r12,0
	jc LB_1232
	btr r12,2
	jmp LB_1233
LB_1232:
	bts r12,2
LB_1233:
	mov r13,r9
	bt r12,3
	jc LB_1234
	btr r12,0
	jmp LB_1235
LB_1234:
	bts r12,0
LB_1235:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_740 : %_740
 ; {>  %_738~0':_r64 %_739~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_740
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_740 %_738 } ⊢ { %_741 %_742 } : { %_741 %_742 }
 ; {>  %_738~0':_r64 %_739~1':_r64 %_740~2':_r64 }
	add r8,r13
; _f34 { %_741 %_739 } ⊢ { %_743 %_744 } : { %_743 %_744 }
 ; {>  %_739~1':_r64 %_741~2':_r64 %_742~0':_r64 }
	add r8,r14
; _some %_743 ⊢ %_745 : %_745
 ; {>  %_743~2':_r64 %_742~0':_r64 %_744~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_745
 ; {>  %_745~°0◂2':(_opn)◂(_r64) %_742~0':_r64 %_744~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_1195
	mov rdi,r13
	call dlt
LB_1195:
	bt r12,1
	jc LB_1196
	mov rdi,r14
	call dlt
LB_1196:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1197
	btr r12,3
	jmp LB_1198
LB_1197:
	bts r12,3
LB_1198:
	mov r8,0
	bts r12,2
	ret
LB_1199:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1201
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1200
LB_1201:
	add rsp,8
	ret
NS_E_671_MTC_1_failed:
	add rsp,48
	pop r14
LB_1200:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1250
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_671_MTC_2_failed
LB_1250:
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
	jz LB_1255
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1256
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1256:
	jmp NS_E_671_MTC_2_failed
LB_1255:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1245
	btr r12,1
	jmp LB_1246
LB_1245:
	bts r12,1
LB_1246:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1243
	btr r12,0
	jmp LB_1244
LB_1243:
	bts r12,0
LB_1244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1240
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_748 : %_748
 ; {>  %_747~1':_r64 %_746~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_748
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_748 %_747 } ⊢ { %_749 %_750 } : { %_749 %_750 }
 ; {>  %_748~2':_r64 %_747~1':_r64 %_746~0':_r64 }
	add r8,r14
; _some %_749 ⊢ %_751 : %_751
 ; {>  %_749~2':_r64 %_750~1':_r64 %_746~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_751
 ; {>  %_751~°0◂2':(_opn)◂(_r64) %_750~1':_r64 %_746~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1236
	mov rdi,r14
	call dlt
LB_1236:
	bt r12,0
	jc LB_1237
	mov rdi,r13
	call dlt
LB_1237:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1238
	btr r12,3
	jmp LB_1239
LB_1238:
	bts r12,3
LB_1239:
	mov r8,0
	bts r12,2
	ret
LB_1240:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1242
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1241
LB_1242:
	add rsp,8
	ret
NS_E_671_MTC_2_failed:
	add rsp,32
	pop r14
LB_1241:
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
	jg LB_1270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1270
	jmp LB_1271
LB_1270:
	jmp NS_E_672_MTC_0_failed
LB_1271:
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
	jc LB_1263
	btr r12,0
	jmp LB_1264
LB_1263:
	bts r12,0
LB_1264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1260
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_752 : %_752
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_752
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_752 ⊢ %_753 : %_753
 ; {>  %_752~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_753
 ; {>  %_753~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1258
	btr r12,3
	jmp LB_1259
LB_1258:
	bts r12,3
LB_1259:
	mov r8,0
	bts r12,2
	ret
LB_1260:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1262
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1261
LB_1262:
	add rsp,8
	ret
NS_E_672_MTC_0_failed:
	add rsp,16
	pop r14
LB_1261:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1286
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_672_MTC_1_failed
LB_1286:
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
	jz LB_1291
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1292
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1292:
	jmp NS_E_672_MTC_1_failed
LB_1291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1281
	btr r12,1
	jmp LB_1282
LB_1281:
	bts r12,1
LB_1282:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1279
	btr r12,0
	jmp LB_1280
LB_1279:
	bts r12,0
LB_1280:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1276
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_756 : %_756
 ; {>  %_754~0':_r64 %_755~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_756
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_756 %_755 } ⊢ { %_757 %_758 } : { %_757 %_758 }
 ; {>  %_754~0':_r64 %_756~2':_r64 %_755~1':_r64 }
	add r8,r14
; _some %_757 ⊢ %_759 : %_759
 ; {>  %_758~1':_r64 %_754~0':_r64 %_757~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_759
 ; {>  %_758~1':_r64 %_754~0':_r64 %_759~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1272
	mov rdi,r14
	call dlt
LB_1272:
	bt r12,0
	jc LB_1273
	mov rdi,r13
	call dlt
LB_1273:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1274
	btr r12,3
	jmp LB_1275
LB_1274:
	bts r12,3
LB_1275:
	mov r8,0
	bts r12,2
	ret
LB_1276:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1278
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1277
LB_1278:
	add rsp,8
	ret
NS_E_672_MTC_1_failed:
	add rsp,32
	pop r14
LB_1277:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1322:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_1322:
; _f21 %_1298 ⊢ %_1299 : %_1299
 ; {>  %_1294~0':_stg %_1296~2':_stg %_1295~1':_r64 %_1298~4':(_lst)◂(_p667) %_1297~3':_r64 }
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
	jc LB_1331
	btr r12,0
	jmp LB_1332
LB_1331:
	bts r12,0
LB_1332:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_1333
	btr r12,4
	jmp LB_1334
LB_1333:
	bts r12,4
LB_1334:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1329
	btr r12,3
	jmp LB_1330
LB_1329:
	bts r12,3
LB_1330:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1327
	btr r12,2
	jmp LB_1328
LB_1327:
	bts r12,2
LB_1328:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1325
	btr r12,1
	jmp LB_1326
LB_1325:
	bts r12,1
LB_1326:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1323
	btr r12,0
	jmp LB_1324
LB_1323:
	bts r12,0
LB_1324:
	add rsp,40
MTC_LB_1335:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1336
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_1337
	bt QWORD [rax],0
	jc LB_1338
	btr r12,7
	jmp LB_1339
LB_1338:
	bts r12,7
LB_1339:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1337:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1342
	btr r12,8
	jmp LB_1343
LB_1342:
	bts r12,8
LB_1343:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1340
	btr r12,5
	jmp LB_1341
LB_1340:
	bts r12,5
LB_1341:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1346
	btr r12,8
	jmp LB_1347
LB_1346:
	bts r12,8
LB_1347:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1344
	btr r12,6
	jmp LB_1345
LB_1344:
	bts r12,6
LB_1345:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1348:
	cmp r15,0
	jz LB_1349
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1348
LB_1349:
; _f21 %_1301 ⊢ %_1302 : %_1302
 ; {>  %_1294~0':_stg %_1296~2':_stg %_1300~5':_p667 %_1295~1':_r64 %_1301~6':(_lst)◂(_p667) %_1297~3':_r64 }
; _f21 6' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_1360
	btr r12,0
	jmp LB_1361
LB_1360:
	bts r12,0
LB_1361:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_1362
	btr r12,4
	jmp LB_1363
LB_1362:
	bts r12,4
LB_1363:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_1358
	btr r12,5
	jmp LB_1359
LB_1358:
	bts r12,5
LB_1359:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1356
	btr r12,3
	jmp LB_1357
LB_1356:
	bts r12,3
LB_1357:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1354
	btr r12,2
	jmp LB_1355
LB_1354:
	bts r12,2
LB_1355:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1352
	btr r12,1
	jmp LB_1353
LB_1352:
	bts r12,1
LB_1353:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1350
	btr r12,0
	jmp LB_1351
LB_1350:
	bts r12,0
LB_1351:
	add rsp,48
MTC_LB_1364:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1365
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °1◂6'
; 5' ⊢ °1◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_1366
	bt QWORD [rax],0
	jc LB_1367
	btr r12,7
	jmp LB_1368
LB_1367:
	bts r12,7
LB_1368:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1366:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_1369
	btr r12,6
	jmp LB_1370
LB_1369:
	bts r12,6
LB_1370:
LB_1371:
	cmp r15,0
	jz LB_1372
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1371
LB_1372:
; _f36 %_1303 ⊢ { %_1304 %_1305 } : { %_1304 %_1305 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1294~0':_stg %_1296~2':_stg %_1295~1':_r64 %_1303~6':_r64 %_1297~3':_r64 }
	mov r11,rcx
	bts r12,5
; _f18 { %_1305 %_1294 %_1295 %_1296 %_1297 } ⊢ { %_1306 %_1307 %_1308 %_1309 %_1310 } : { %_1306 %_1307 %_1308 %_1309 %_1310 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1294~0':_stg %_1304~6':_r64 %_1296~2':_stg %_1295~1':_r64 %_1305~5':_r64 %_1297~3':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_1377
	btr r12,4
	jmp LB_1378
LB_1377:
	bts r12,4
LB_1378:
	mov r9,r8
	bt r12,2
	jc LB_1379
	btr r12,3
	jmp LB_1380
LB_1379:
	bts r12,3
LB_1380:
	mov r8,r14
	bt r12,1
	jc LB_1381
	btr r12,2
	jmp LB_1382
LB_1381:
	bts r12,2
LB_1382:
	mov r14,r13
	bt r12,0
	jc LB_1383
	btr r12,1
	jmp LB_1384
LB_1383:
	bts r12,1
LB_1384:
	mov r13,r11
	bt r12,5
	jc LB_1385
	btr r12,0
	jmp LB_1386
LB_1385:
	bts r12,0
LB_1386:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_1387
	btr r12,5
	jmp LB_1388
LB_1387:
	bts r12,5
LB_1388:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1375
	btr r12,6
	jmp LB_1376
LB_1375:
	bts r12,6
LB_1376:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1373
	btr r12,4
	jmp LB_1374
LB_1373:
	bts r12,4
LB_1374:
	add rsp,24
; _f34 { %_1308 %_1304 } ⊢ { %_1311 %_1312 } : { %_1311 %_1312 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1304~6':_r64 %_1308~2':_r64 %_1309~3':_stg %_1306~0':_r64 %_1310~5':_r64 %_1307~1':_stg }
	add r8,rcx
; _f34 { %_1310 %_1312 } ⊢ { %_1313 %_1314 } : { %_1313 %_1314 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1312~6':_r64 %_1311~2':_r64 %_1309~3':_stg %_1306~0':_r64 %_1310~5':_r64 %_1307~1':_stg }
	add r11,rcx
; _f1322 { %_1307 %_1311 %_1309 %_1313 %_1302 } ⊢ { %_1315 %_1316 } : { %_1315 %_1316 }
 ; {>  %_1314~6':_r64 %_1302~4':(_lst)◂(_p667) %_1311~2':_r64 %_1309~3':_stg %_1306~0':_r64 %_1313~5':_r64 %_1307~1':_stg }
; _f1322 { 1' 2' 3' 5' 4' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0111110.. |},{ 1' 2' 3' 5' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_1393
	btr r12,0
	jmp LB_1394
LB_1393:
	bts r12,0
LB_1394:
	mov r14,r8
	bt r12,2
	jc LB_1395
	btr r12,1
	jmp LB_1396
LB_1395:
	bts r12,1
LB_1396:
	mov r8,r9
	bt r12,3
	jc LB_1397
	btr r12,2
	jmp LB_1398
LB_1397:
	bts r12,2
LB_1398:
	mov r9,r11
	bt r12,5
	jc LB_1399
	btr r12,3
	jmp LB_1400
LB_1399:
	bts r12,3
LB_1400:
	call NS_E_1322
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1401
	btr r12,2
	jmp LB_1402
LB_1401:
	bts r12,2
LB_1402:
	mov r14,r13
	bt r12,0
	jc LB_1403
	btr r12,1
	jmp LB_1404
LB_1403:
	bts r12,1
LB_1404:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1391
	btr r12,6
	jmp LB_1392
LB_1391:
	bts r12,6
LB_1392:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1389
	btr r12,0
	jmp LB_1390
LB_1389:
	bts r12,0
LB_1390:
	add rsp,24
; ∎ { %_1315 %_1316 }
 ; {>  %_1314~6':_r64 %_1315~1':_stg %_1316~2':_stg %_1306~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,6
	jc LB_1405
	mov rdi,rcx
	call dlt
LB_1405:
	bt r12,0
	jc LB_1406
	mov rdi,r13
	call dlt
LB_1406:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_1407
	btr r12,0
	jmp LB_1408
LB_1407:
	bts r12,0
LB_1408:
	mov r14,r8
	bt r12,2
	jc LB_1409
	btr r12,1
	jmp LB_1410
LB_1409:
	bts r12,1
LB_1410:
	ret
MTC_LB_1365:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1411
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_1412
	bt QWORD [rax],0
	jc LB_1413
	btr r12,7
	jmp LB_1414
LB_1413:
	bts r12,7
LB_1414:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1412:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_1415
	btr r12,6
	jmp LB_1416
LB_1415:
	bts r12,6
LB_1416:
LB_1417:
	cmp r15,0
	jz LB_1418
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1417
LB_1418:
; _f34 { %_1295 %_1317 } ⊢ { %_1318 %_1319 } : { %_1318 %_1319 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1294~0':_stg %_1296~2':_stg %_1295~1':_r64 %_1317~6':_r64 %_1297~3':_r64 }
	add r14,rcx
; _f1322 { %_1294 %_1318 %_1296 %_1297 %_1302 } ⊢ { %_1320 %_1321 } : { %_1320 %_1321 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1294~0':_stg %_1319~6':_r64 %_1296~2':_stg %_1318~1':_r64 %_1297~3':_r64 }
; _f1322 { 0' 1' 2' 3' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
	call NS_E_1322
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*0]
	bt QWORD rax,6
	jc LB_1419
	btr r12,6
	jmp LB_1420
LB_1419:
	bts r12,6
LB_1420:
	add rsp,16
; ∎ { %_1320 %_1321 }
 ; {>  %_1319~6':_r64 %_1320~0':_stg %_1321~1':_stg }
; 	∎ { 0' 1' }
	bt r12,6
	jc LB_1421
	mov rdi,rcx
	call dlt
LB_1421:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1411:
MTC_LB_1336:
	mov r15,0
LB_1423:
	cmp r15,0
	jz LB_1424
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1423
LB_1424:
; ∎ { %_1294 %_1296 }
 ; {>  %_1294~0':_stg %_1296~2':_stg %_1295~1':_r64 %_1299~4':(_lst)◂(_p667) %_1297~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_1425
	mov rdi,r14
	call dlt
LB_1425:
	bt r12,4
	jc LB_1426
	mov rdi,r10
	call dlt
LB_1426:
	bt r12,3
	jc LB_1427
	mov rdi,r9
	call dlt
LB_1427:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1428
	btr r12,1
	jmp LB_1429
LB_1428:
	bts r12,1
LB_1429:
	ret
MTC_LB_1422:
NS_E_1446:
; 	|» 0'
NS_E_RDI_1446:
; » 0xr0 |~ {  } ⊢ %_1431 : %_1431
 ; {>  %_1430~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1431
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f670 { %_1430 %_1431 } ⊢ { %_1432 %_1433 %_1434 } : { %_1432 %_1433 %_1434 }
 ; {>  %_1431~1':_r64 %_1430~0':_stg }
; _f670 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_670
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1447
	btr r12,4
	jmp LB_1448
LB_1447:
	bts r12,4
LB_1448:
	mov r8,r9
	bt r12,3
	jc LB_1451
	btr r12,2
	jmp LB_1452
LB_1451:
	bts r12,2
LB_1452:
	mov rsi,1
	bt r12,2
	jc LB_1449
	mov rsi,0
	bt r8,0
	jc LB_1449
	jmp LB_1450
LB_1449:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1450:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_1434 ⊢ %_1435 : %_1435
 ; {>  %_1432~0':_stg %_1434~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1433~1':_r64 }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1457
	btr r12,0
	jmp LB_1458
LB_1457:
	bts r12,0
LB_1458:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1459
	btr r12,2
	jmp LB_1460
LB_1459:
	bts r12,2
LB_1460:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1455
	btr r12,1
	jmp LB_1456
LB_1455:
	bts r12,1
LB_1456:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1453
	btr r12,0
	jmp LB_1454
LB_1453:
	bts r12,0
LB_1454:
	add rsp,24
MTC_LB_1461:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1462
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1463
	bt QWORD [rax],0
	jc LB_1464
	btr r12,5
	jmp LB_1465
LB_1464:
	bts r12,5
LB_1465:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1463:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1468
	btr r12,6
	jmp LB_1469
LB_1468:
	bts r12,6
LB_1469:
	mov r9,rcx
	bt r12,6
	jc LB_1466
	btr r12,3
	jmp LB_1467
LB_1466:
	bts r12,3
LB_1467:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1472
	btr r12,6
	jmp LB_1473
LB_1472:
	bts r12,6
LB_1473:
	mov r10,rcx
	bt r12,6
	jc LB_1470
	btr r12,4
	jmp LB_1471
LB_1470:
	bts r12,4
LB_1471:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1474:
	cmp r15,0
	jz LB_1475
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1474
LB_1475:
; _f14 %_1436 ⊢ { %_1438 %_1439 } : { %_1438 %_1439 }
 ; {>  %_1437~4':(_lst)◂(_p667) %_1432~0':_stg %_1433~1':_r64 %_1436~3':_r64 }
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
	jc LB_1482
	btr r12,0
	jmp LB_1483
LB_1482:
	bts r12,0
LB_1483:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_1484
	btr r12,2
	jmp LB_1485
LB_1484:
	bts r12,2
LB_1485:
	mov r9,r14
	bt r12,1
	jc LB_1486
	btr r12,3
	jmp LB_1487
LB_1486:
	bts r12,3
LB_1487:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_1480
	btr r12,4
	jmp LB_1481
LB_1480:
	bts r12,4
LB_1481:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1478
	btr r12,1
	jmp LB_1479
LB_1478:
	bts r12,1
LB_1479:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1476
	btr r12,0
	jmp LB_1477
LB_1476:
	bts r12,0
LB_1477:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_1440 : %_1440
 ; {>  %_1439~3':_stg %_1437~4':(_lst)◂(_p667) %_1432~0':_stg %_1433~1':_r64 %_1438~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_1440
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_1441 : %_1441
 ; {>  %_1440~5':_r64 %_1439~3':_stg %_1437~4':(_lst)◂(_p667) %_1432~0':_stg %_1433~1':_r64 %_1438~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_1441
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f1322 { %_1432 %_1440 %_1439 %_1441 %_1437 } ⊢ { %_1442 %_1443 } : { %_1442 %_1443 }
 ; {>  %_1440~5':_r64 %_1439~3':_stg %_1437~4':(_lst)◂(_p667) %_1432~0':_stg %_1441~6':_r64 %_1433~1':_r64 %_1438~2':_r64 }
; _f1322 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_1492
	btr r12,1
	jmp LB_1493
LB_1492:
	bts r12,1
LB_1493:
	mov r8,r9
	bt r12,3
	jc LB_1494
	btr r12,2
	jmp LB_1495
LB_1494:
	bts r12,2
LB_1495:
	mov r9,rcx
	bt r12,6
	jc LB_1496
	btr r12,3
	jmp LB_1497
LB_1496:
	bts r12,3
LB_1497:
	call NS_E_1322
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1498
	btr r12,3
	jmp LB_1499
LB_1498:
	bts r12,3
LB_1499:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1490
	btr r12,2
	jmp LB_1491
LB_1490:
	bts r12,2
LB_1491:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1488
	btr r12,1
	jmp LB_1489
LB_1488:
	bts r12,1
LB_1489:
	add rsp,24
; _some %_1443 ⊢ %_1444 : %_1444
 ; {>  %_1442~0':_stg %_1433~1':_r64 %_1438~2':_r64 %_1443~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_1442 %_1444 }
 ; {>  %_1442~0':_stg %_1433~1':_r64 %_1438~2':_r64 %_1444~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_1500
	mov rdi,r14
	call dlt
LB_1500:
	bt r12,2
	jc LB_1501
	mov rdi,r8
	call dlt
LB_1501:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1504
	btr r12,1
	jmp LB_1505
LB_1504:
	bts r12,1
LB_1505:
	mov rsi,1
	bt r12,1
	jc LB_1502
	mov rsi,0
	bt r14,0
	jc LB_1502
	jmp LB_1503
LB_1502:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1503:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1462:
	mov r15,0
LB_1507:
	cmp r15,0
	jz LB_1508
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1507
LB_1508:
; _none {  } ⊢ %_1445 : %_1445
 ; {>  %_1432~0':_stg %_1433~1':_r64 %_1435~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1432 %_1445 }
 ; {>  %_1432~0':_stg %_1433~1':_r64 %_1435~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1445~°1◂{  }:(_opn)◂(t623'(0)) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_1509
	mov rdi,r14
	call dlt
LB_1509:
	bt r12,2
	jc LB_1510
	mov rdi,r8
	call dlt
LB_1510:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_1511
	mov rsi,0
	bt r14,0
	jc LB_1511
	jmp LB_1512
LB_1511:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1512:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1506:
NS_E_1518:
NS_E_RDI_1518:
; » _^ ..
	mov rax,8
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
; "[##]"
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov r13,rax
	btr r12,0
; _f1446 %_1513 ⊢ { %_1514 %_1515 } : { %_1514 %_1515 }
 ; {>  %_1513~0':_stg }
; _f1446 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_1514 %_1515 } ⊢ { %_1516 %_1517 } : { %_1516 %_1517 }
 ; {>  %_1514~0':_stg %_1515~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1519
	btr r12,2
	jmp LB_1520
LB_1519:
	bts r12,2
LB_1520:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1523
	btr r12,3
	jmp LB_1524
LB_1523:
	bts r12,3
LB_1524:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1521
	btr QWORD [rdi],0
	jmp LB_1522
LB_1521:
	bts QWORD [rdi],0
LB_1522:
	mov r9,r14
	bt r12,1
	jc LB_1527
	btr r12,3
	jmp LB_1528
LB_1527:
	bts r12,3
LB_1528:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1525
	btr QWORD [rdi],1
	jmp LB_1526
LB_1525:
	bts QWORD [rdi],1
LB_1526:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1529
	btr r12,2
	jmp LB_1530
LB_1529:
	bts r12,2
LB_1530:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1533
	btr r12,3
	jmp LB_1534
LB_1533:
	bts r12,3
LB_1534:
	mov r13,r9
	bt r12,3
	jc LB_1531
	btr r12,0
	jmp LB_1532
LB_1531:
	bts r12,0
LB_1532:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1537
	btr r12,3
	jmp LB_1538
LB_1537:
	bts r12,3
LB_1538:
	mov r14,r9
	bt r12,3
	jc LB_1535
	btr r12,1
	jmp LB_1536
LB_1535:
	bts r12,1
LB_1536:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1517~1':(_opn)◂(_stg) %_1516~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_1539
	mov rdi,r14
	call dlt
LB_1539:
	bt r12,0
	jc LB_1540
	mov rdi,r13
	call dlt
LB_1540:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1542:
NS_E_RDI_1542:
NS_E_1542_ETR_TBL:
NS_E_1542_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_1544_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1614
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1542_MTC_0_failed
LB_1614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_1542_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1619
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1620
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1620:
	jmp NS_E_1542_MTC_0_failed
LB_1619:
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
	jc LB_1608
	btr QWORD [rdi],1
LB_1608:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1609
	btr QWORD [rdi],0
LB_1609:
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
NS_E_1542_MTC_0_failed:
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
NS_E_1542_MTC_1_failed:
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
NS_E_1544:
NS_E_RDI_1544:
NS_E_1544_ETR_TBL:
NS_E_1544_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1825
LB_1824:
	add r14,1
LB_1825:
	cmp r14,r10
	jge LB_1826
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1824
	cmp al,10
	jz LB_1824
	cmp al,32
	jz LB_1824
LB_1826:
	add r14,4
	cmp r14,r10
	jg LB_1829
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1829
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1829
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1829
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1829
	jmp LB_1830
LB_1829:
	jmp NS_E_1544_MTC_0_failed
LB_1830:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1832
LB_1831:
	add r14,1
LB_1832:
	cmp r14,r10
	jge LB_1833
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1831
	cmp al,10
	jz LB_1831
	cmp al,32
	jz LB_1831
LB_1833:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1834
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1835
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1835:
	jmp NS_E_1544_MTC_0_failed
LB_1834:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1838
LB_1837:
	add r14,1
LB_1838:
	cmp r14,r10
	jge LB_1839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1837
	cmp al,10
	jz LB_1837
	cmp al,32
	jz LB_1837
LB_1839:
	add r14,1
	cmp r14,r10
	jg LB_1844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1844
	jmp LB_1845
LB_1844:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1841
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1841:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1842
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1842:
	jmp NS_E_1544_MTC_0_failed
LB_1845:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1847
LB_1846:
	add r14,1
LB_1847:
	cmp r14,r10
	jge LB_1848
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1846
	cmp al,10
	jz LB_1846
	cmp al,32
	jz LB_1846
LB_1848:
	push r10
	call NS_E_1548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1849
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1850
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1850:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1851
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1851:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1852
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1852:
	jmp NS_E_1544_MTC_0_failed
LB_1849:
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
	jc LB_1819
	btr QWORD [rdi],3
LB_1819:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1820
	btr QWORD [rdi],2
LB_1820:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1821
	btr QWORD [rdi],1
LB_1821:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1822
	btr QWORD [rdi],0
LB_1822:
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
NS_E_1544_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1790
LB_1789:
	add r14,1
LB_1790:
	cmp r14,r10
	jge LB_1791
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1789
	cmp al,10
	jz LB_1789
	cmp al,32
	jz LB_1789
LB_1791:
	add r14,4
	cmp r14,r10
	jg LB_1794
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1794
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1794
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1794
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1794
	jmp LB_1795
LB_1794:
	jmp NS_E_1544_MTC_1_failed
LB_1795:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1797
LB_1796:
	add r14,1
LB_1797:
	cmp r14,r10
	jge LB_1798
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1796
	cmp al,10
	jz LB_1796
	cmp al,32
	jz LB_1796
LB_1798:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1799
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1800
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1800:
	jmp NS_E_1544_MTC_1_failed
LB_1799:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_1803
LB_1802:
	add r14,1
LB_1803:
	cmp r14,r10
	jge LB_1804
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1802
	cmp al,10
	jz LB_1802
	cmp al,32
	jz LB_1802
LB_1804:
	push r10
	call NS_E_1542_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1805
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1806
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1806:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1807
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1807:
	jmp NS_E_1544_MTC_1_failed
LB_1805:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_1810
LB_1809:
	add r14,1
LB_1810:
	cmp r14,r10
	jge LB_1811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1809
	cmp al,10
	jz LB_1809
	cmp al,32
	jz LB_1809
LB_1811:
	add r14,6
	cmp r14,r10
	jg LB_1817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1817
	jmp LB_1818
LB_1817:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1813
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1813:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1814
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1814:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1815:
	jmp NS_E_1544_MTC_1_failed
LB_1818:
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
	jc LB_1784
	btr QWORD [rdi],3
LB_1784:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1785
	btr QWORD [rdi],2
LB_1785:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1786
	btr QWORD [rdi],1
LB_1786:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1787
	btr QWORD [rdi],0
LB_1787:
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
NS_E_1544_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1755
LB_1754:
	add r14,1
LB_1755:
	cmp r14,r10
	jge LB_1756
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1754
	cmp al,10
	jz LB_1754
	cmp al,32
	jz LB_1754
LB_1756:
	add r14,2
	cmp r14,r10
	jg LB_1759
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1759
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1759
	jmp LB_1760
LB_1759:
	jmp NS_E_1544_MTC_2_failed
LB_1760:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1762
LB_1761:
	add r14,1
LB_1762:
	cmp r14,r10
	jge LB_1763
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1761
	cmp al,10
	jz LB_1761
	cmp al,32
	jz LB_1761
LB_1763:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1764
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1765
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1765:
	jmp NS_E_1544_MTC_2_failed
LB_1764:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1768
LB_1767:
	add r14,1
LB_1768:
	cmp r14,r10
	jge LB_1769
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1767
	cmp al,10
	jz LB_1767
	cmp al,32
	jz LB_1767
LB_1769:
	add r14,1
	cmp r14,r10
	jg LB_1774
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1774
	jmp LB_1775
LB_1774:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1771
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1771:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1772
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1772:
	jmp NS_E_1544_MTC_2_failed
LB_1775:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_1777
LB_1776:
	add r14,1
LB_1777:
	cmp r14,r10
	jge LB_1778
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1776
	cmp al,10
	jz LB_1776
	cmp al,32
	jz LB_1776
LB_1778:
	push r10
	call NS_E_1546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1779
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1780
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1780:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1781
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1781:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1782:
	jmp NS_E_1544_MTC_2_failed
LB_1779:
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
	jc LB_1749
	btr QWORD [rdi],3
LB_1749:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1750
	btr QWORD [rdi],2
LB_1750:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1751
	btr QWORD [rdi],1
LB_1751:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1752
	btr QWORD [rdi],0
LB_1752:
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
NS_E_1544_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1720
LB_1719:
	add r14,1
LB_1720:
	cmp r14,r10
	jge LB_1721
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1719
	cmp al,10
	jz LB_1719
	cmp al,32
	jz LB_1719
LB_1721:
	add r14,2
	cmp r14,r10
	jg LB_1724
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1724
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1724
	jmp LB_1725
LB_1724:
	jmp NS_E_1544_MTC_3_failed
LB_1725:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1727
LB_1726:
	add r14,1
LB_1727:
	cmp r14,r10
	jge LB_1728
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1726
	cmp al,10
	jz LB_1726
	cmp al,32
	jz LB_1726
LB_1728:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1729
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1730
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1730:
	jmp NS_E_1544_MTC_3_failed
LB_1729:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_1733
LB_1732:
	add r14,1
LB_1733:
	cmp r14,r10
	jge LB_1734
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1732
	cmp al,10
	jz LB_1732
	cmp al,32
	jz LB_1732
LB_1734:
	add r14,2
	cmp r14,r10
	jg LB_1739
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1739
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1739
	jmp LB_1740
LB_1739:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1736
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1736:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1737
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1737:
	jmp NS_E_1544_MTC_3_failed
LB_1740:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_1742
LB_1741:
	add r14,1
LB_1742:
	cmp r14,r10
	jge LB_1743
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1741
	cmp al,10
	jz LB_1741
	cmp al,32
	jz LB_1741
LB_1743:
	push r10
	call NS_E_1554_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1744
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1745
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1745:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1746
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1746:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1747:
	jmp NS_E_1544_MTC_3_failed
LB_1744:
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
	jc LB_1714
	btr QWORD [rdi],3
LB_1714:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1715
	btr QWORD [rdi],2
LB_1715:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1716
	btr QWORD [rdi],1
LB_1716:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1717
	btr QWORD [rdi],0
LB_1717:
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
NS_E_1544_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1687
LB_1686:
	add r14,1
LB_1687:
	cmp r14,r10
	jge LB_1688
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1686
	cmp al,10
	jz LB_1686
	cmp al,32
	jz LB_1686
LB_1688:
	add r14,2
	cmp r14,r10
	jg LB_1691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1691
	jmp LB_1692
LB_1691:
	jmp NS_E_1544_MTC_4_failed
LB_1692:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1694
LB_1693:
	add r14,1
LB_1694:
	cmp r14,r10
	jge LB_1695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1693
	cmp al,10
	jz LB_1693
	cmp al,32
	jz LB_1693
LB_1695:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1696
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1697
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1697:
	jmp NS_E_1544_MTC_4_failed
LB_1696:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_1700
LB_1699:
	add r14,1
LB_1700:
	cmp r14,r10
	jge LB_1701
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1699
	cmp al,10
	jz LB_1699
	cmp al,32
	jz LB_1699
LB_1701:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1702
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1703
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1703:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1704
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1704:
	jmp NS_E_1544_MTC_4_failed
LB_1702:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_1707
LB_1706:
	add r14,1
LB_1707:
	cmp r14,r10
	jge LB_1708
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1706
	cmp al,10
	jz LB_1706
	cmp al,32
	jz LB_1706
LB_1708:
	push r10
	call NS_E_1554_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1709
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1710
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1710:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1711
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1711:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1712
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1712:
	jmp NS_E_1544_MTC_4_failed
LB_1709:
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
	jc LB_1681
	btr QWORD [rdi],3
LB_1681:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1682
	btr QWORD [rdi],2
LB_1682:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1683
	btr QWORD [rdi],1
LB_1683:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1684
	btr QWORD [rdi],0
LB_1684:
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
NS_E_1544_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_1652
LB_1651:
	add r14,1
LB_1652:
	cmp r14,r10
	jge LB_1653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1651
	cmp al,10
	jz LB_1651
	cmp al,32
	jz LB_1651
LB_1653:
	add r14,2
	cmp r14,r10
	jg LB_1656
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1656
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1656
	jmp LB_1657
LB_1656:
	jmp NS_E_1544_MTC_5_failed
LB_1657:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1659
LB_1658:
	add r14,1
LB_1659:
	cmp r14,r10
	jge LB_1660
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1658
	cmp al,10
	jz LB_1658
	cmp al,32
	jz LB_1658
LB_1660:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1661
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1662
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1662:
	jmp NS_E_1544_MTC_5_failed
LB_1661:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1665
LB_1664:
	add r14,1
LB_1665:
	cmp r14,r10
	jge LB_1666
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1664
	cmp al,10
	jz LB_1664
	cmp al,32
	jz LB_1664
LB_1666:
	add r14,1
	cmp r14,r10
	jg LB_1671
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1671
	jmp LB_1672
LB_1671:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1668
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1668:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1669
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1669:
	jmp NS_E_1544_MTC_5_failed
LB_1672:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1674
LB_1673:
	add r14,1
LB_1674:
	cmp r14,r10
	jge LB_1675
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1673
	cmp al,10
	jz LB_1673
	cmp al,32
	jz LB_1673
LB_1675:
	push r10
	call NS_E_1548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1676
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1677
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1677:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1678
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1678:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1679
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1679:
	jmp NS_E_1544_MTC_5_failed
LB_1676:
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
	jc LB_1646
	btr QWORD [rdi],3
LB_1646:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1647
	btr QWORD [rdi],2
LB_1647:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1648
	btr QWORD [rdi],1
LB_1648:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1649
	btr QWORD [rdi],0
LB_1649:
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
NS_E_1544_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
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
	add r14,2
	cmp r14,r10
	jg LB_1631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1631
	jmp LB_1632
LB_1631:
	jmp NS_E_1544_MTC_6_failed
LB_1632:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1634
LB_1633:
	add r14,1
LB_1634:
	cmp r14,r10
	jge LB_1635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1633
	cmp al,10
	jz LB_1633
	cmp al,32
	jz LB_1633
LB_1635:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1636
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1637
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1637:
	jmp NS_E_1544_MTC_6_failed
LB_1636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_1640
LB_1639:
	add r14,1
LB_1640:
	cmp r14,r10
	jge LB_1641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1639
	cmp al,10
	jz LB_1639
	cmp al,32
	jz LB_1639
LB_1641:
	push r10
	call NS_E_1550_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1643
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1643:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1644
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1644:
	jmp NS_E_1544_MTC_6_failed
LB_1642:
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
	jc LB_1622
	btr QWORD [rdi],2
LB_1622:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1623
	btr QWORD [rdi],1
LB_1623:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1624
	btr QWORD [rdi],0
LB_1624:
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
NS_E_1544_MTC_6_failed:
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
NS_E_1546:
NS_E_RDI_1546:
NS_E_1546_ETR_TBL:
NS_E_1546_TBL:
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
	jz LB_1874
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1546_MTC_0_failed
LB_1874:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1882
	jmp LB_1883
LB_1882:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1880:
	jmp NS_E_1546_MTC_0_failed
LB_1883:
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
	jc LB_1868
	btr QWORD [rdi],1
LB_1868:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1869
	btr QWORD [rdi],0
LB_1869:
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
NS_E_1546_MTC_0_failed:
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
	jz LB_1866
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1546_MTC_1_failed
LB_1866:
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
	jc LB_1861
	btr QWORD [rdi],0
LB_1861:
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
NS_E_1546_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1859
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1546_MTC_2_failed
LB_1859:
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
	jc LB_1854
	btr QWORD [rdi],0
LB_1854:
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
NS_E_1546_MTC_2_failed:
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
NS_E_1548:
NS_E_RDI_1548:
NS_E_1548_ETR_TBL:
NS_E_1548_TBL:
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
	jz LB_1929
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1548_MTC_0_failed
LB_1929:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1937
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1937
	jmp LB_1938
LB_1937:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1935
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1935:
	jmp NS_E_1548_MTC_0_failed
LB_1938:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1942
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1943
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1943:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1944:
	jmp NS_E_1548_MTC_0_failed
LB_1942:
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
	jc LB_1922
	btr QWORD [rdi],2
LB_1922:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1923
	btr QWORD [rdi],1
LB_1923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1924
	btr QWORD [rdi],0
LB_1924:
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
NS_E_1548_MTC_0_failed:
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
	jz LB_1905
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1548_MTC_1_failed
LB_1905:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1913
	jmp LB_1914
LB_1913:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1911
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1911:
	jmp NS_E_1548_MTC_1_failed
LB_1914:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1918
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1919
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1919:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1920
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1920:
	jmp NS_E_1548_MTC_1_failed
LB_1918:
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
	jc LB_1898
	btr QWORD [rdi],2
LB_1898:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1899
	btr QWORD [rdi],1
LB_1899:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1900
	btr QWORD [rdi],0
LB_1900:
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
NS_E_1548_MTC_1_failed:
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
	jz LB_1896
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1548_MTC_2_failed
LB_1896:
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
	jc LB_1891
	btr QWORD [rdi],0
LB_1891:
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
NS_E_1548_MTC_2_failed:
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
	jz LB_1889
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1548_MTC_3_failed
LB_1889:
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
	jc LB_1884
	btr QWORD [rdi],0
LB_1884:
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
NS_E_1548_MTC_3_failed:
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
NS_E_1550:
NS_E_RDI_1550:
NS_E_1550_ETR_TBL:
NS_E_1550_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_1958
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1958
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1958
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1958
	jmp LB_1959
LB_1958:
	jmp NS_E_1550_MTC_0_failed
LB_1959:
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
	jz LB_1963
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1964
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1964:
	jmp NS_E_1550_MTC_0_failed
LB_1963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_1973
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1973
	jmp LB_1974
LB_1973:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1970
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1970:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1971
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1971:
	jmp NS_E_1550_MTC_0_failed
LB_1974:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_1558_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1978
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1979
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1979:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1980
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1980:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1981:
	jmp NS_E_1550_MTC_0_failed
LB_1978:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_1552_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1986
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1987
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1987:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1988
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1988:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1989
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1989:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1990
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1990:
	jmp NS_E_1550_MTC_0_failed
LB_1986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_1552_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1995
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1996
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1996:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1997
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1997:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1998
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1998:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1999
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1999:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2000
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2000:
	jmp NS_E_1550_MTC_0_failed
LB_1995:
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
	jc LB_1946
	btr QWORD [rdi],5
LB_1946:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1947
	btr QWORD [rdi],4
LB_1947:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1948
	btr QWORD [rdi],3
LB_1948:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1949
	btr QWORD [rdi],2
LB_1949:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1950
	btr QWORD [rdi],1
LB_1950:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1951
	btr QWORD [rdi],0
LB_1951:
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
NS_E_1550_MTC_0_failed:
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
NS_E_1552:
NS_E_RDI_1552:
NS_E_1552_ETR_TBL:
NS_E_1552_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_2010
LB_2009:
	add r14,1
LB_2010:
	cmp r14,r10
	jge LB_2011
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2009
	cmp al,10
	jz LB_2009
	cmp al,32
	jz LB_2009
LB_2011:
	add r14,3
	cmp r14,r10
	jg LB_2014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_2014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_2014
	jmp LB_2015
LB_2014:
	jmp NS_E_1552_MTC_0_failed
LB_2015:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_2017
LB_2016:
	add r14,1
LB_2017:
	cmp r14,r10
	jge LB_2018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2016
	cmp al,10
	jz LB_2016
	cmp al,32
	jz LB_2016
LB_2018:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2019
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2020
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2020:
	jmp NS_E_1552_MTC_0_failed
LB_2019:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_2023
LB_2022:
	add r14,1
LB_2023:
	cmp r14,r10
	jge LB_2024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2022
	cmp al,10
	jz LB_2022
	cmp al,32
	jz LB_2022
LB_2024:
	add r14,1
	cmp r14,r10
	jg LB_2029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_2029
	jmp LB_2030
LB_2029:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2026
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2026:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2027
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2027:
	jmp NS_E_1552_MTC_0_failed
LB_2030:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_2032
LB_2031:
	add r14,1
LB_2032:
	cmp r14,r10
	jge LB_2033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2031
	cmp al,10
	jz LB_2031
	cmp al,32
	jz LB_2031
LB_2033:
	push r10
	call NS_E_1558_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2034
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2035
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2035:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2036
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2036:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2037
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2037:
	jmp NS_E_1552_MTC_0_failed
LB_2034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_2040
LB_2039:
	add r14,1
LB_2040:
	cmp r14,r10
	jge LB_2041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2039
	cmp al,10
	jz LB_2039
	cmp al,32
	jz LB_2039
LB_2041:
	push r10
	call NS_E_1552_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2042
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2043
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2043:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2044
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2044:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2045
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2045:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2046
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2046:
	jmp NS_E_1552_MTC_0_failed
LB_2042:
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
	jc LB_2003
	btr QWORD [rdi],4
LB_2003:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2004
	btr QWORD [rdi],3
LB_2004:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2005
	btr QWORD [rdi],2
LB_2005:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2006
	btr QWORD [rdi],1
LB_2006:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2007
	btr QWORD [rdi],0
LB_2007:
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
NS_E_1552_MTC_0_failed:
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
NS_E_1552_MTC_1_failed:
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
NS_E_1554:
NS_E_RDI_1554:
NS_E_1554_ETR_TBL:
NS_E_1554_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_2115
LB_2114:
	add r14,1
LB_2115:
	cmp r14,r10
	jge LB_2116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2114
	cmp al,10
	jz LB_2114
	cmp al,32
	jz LB_2114
LB_2116:
	push r10
	call NS_E_1548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2117
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1554_MTC_0_failed
LB_2117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_2120
LB_2119:
	add r14,1
LB_2120:
	cmp r14,r10
	jge LB_2121
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2119
	cmp al,10
	jz LB_2119
	cmp al,32
	jz LB_2119
LB_2121:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2122
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2123:
	jmp NS_E_1554_MTC_0_failed
LB_2122:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_2126
LB_2125:
	add r14,1
LB_2126:
	cmp r14,r10
	jge LB_2127
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2125
	cmp al,10
	jz LB_2125
	cmp al,32
	jz LB_2125
LB_2127:
	add r14,3
	cmp r14,r10
	jg LB_2132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2132
	jmp LB_2133
LB_2132:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2129
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2129:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2130
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2130:
	jmp NS_E_1554_MTC_0_failed
LB_2133:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2135
LB_2134:
	add r14,1
LB_2135:
	cmp r14,r10
	jge LB_2136
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2134
	cmp al,10
	jz LB_2134
	cmp al,32
	jz LB_2134
LB_2136:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2137
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2138
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2138:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2139
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2139:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2140:
	jmp NS_E_1554_MTC_0_failed
LB_2137:
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
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1554_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_2071
LB_2070:
	add r14,1
LB_2071:
	cmp r14,r10
	jge LB_2072
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2070
	cmp al,10
	jz LB_2070
	cmp al,32
	jz LB_2070
LB_2072:
	add r14,1
	cmp r14,r10
	jg LB_2075
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_2075
	jmp LB_2076
LB_2075:
	jmp NS_E_1554_MTC_1_failed
LB_2076:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2078
LB_2077:
	add r14,1
LB_2078:
	cmp r14,r10
	jge LB_2079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2077
	cmp al,10
	jz LB_2077
	cmp al,32
	jz LB_2077
LB_2079:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2080
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2081:
	jmp NS_E_1554_MTC_1_failed
LB_2080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_2084
LB_2083:
	add r14,1
LB_2084:
	cmp r14,r10
	jge LB_2085
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2083
	cmp al,10
	jz LB_2083
	cmp al,32
	jz LB_2083
LB_2085:
	add r14,3
	cmp r14,r10
	jg LB_2090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_2090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_2090
	jmp LB_2091
LB_2090:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2087
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2087:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2088
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2088:
	jmp NS_E_1554_MTC_1_failed
LB_2091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_2093
LB_2092:
	add r14,1
LB_2093:
	cmp r14,r10
	jge LB_2094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2092
	cmp al,10
	jz LB_2092
	cmp al,32
	jz LB_2092
LB_2094:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2095
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2096
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2096:
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
	jmp NS_E_1554_MTC_1_failed
LB_2095:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_2101
LB_2100:
	add r14,1
LB_2101:
	cmp r14,r10
	jge LB_2102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2100
	cmp al,10
	jz LB_2100
	cmp al,32
	jz LB_2100
LB_2102:
	push r10
	call NS_E_1556_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2103
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2104
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2104:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2105
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2105:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2106
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2106:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2107
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2107:
	jmp NS_E_1554_MTC_1_failed
LB_2103:
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
	jc LB_2064
	btr QWORD [rdi],4
LB_2064:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2065
	btr QWORD [rdi],3
LB_2065:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2066
	btr QWORD [rdi],2
LB_2066:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2067
	btr QWORD [rdi],1
LB_2067:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2068
	btr QWORD [rdi],0
LB_2068:
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
NS_E_1554_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
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
	jg LB_2056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_2056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_2056
	jmp LB_2057
LB_2056:
	jmp NS_E_1554_MTC_2_failed
LB_2057:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2059
LB_2058:
	add r14,1
LB_2059:
	cmp r14,r10
	jge LB_2060
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2058
	cmp al,10
	jz LB_2058
	cmp al,32
	jz LB_2058
LB_2060:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2061
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2062:
	jmp NS_E_1554_MTC_2_failed
LB_2061:
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
	jc LB_2048
	btr QWORD [rdi],1
LB_2048:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2049
	btr QWORD [rdi],0
LB_2049:
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
NS_E_1554_MTC_2_failed:
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
NS_E_1556:
NS_E_RDI_1556:
NS_E_1556_ETR_TBL:
NS_E_1556_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_2146
LB_2145:
	add r14,1
LB_2146:
	cmp r14,r10
	jge LB_2147
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2145
	cmp al,10
	jz LB_2145
	cmp al,32
	jz LB_2145
LB_2147:
	add r14,1
	cmp r14,r10
	jg LB_2150
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_2150
	jmp LB_2151
LB_2150:
	jmp NS_E_1556_MTC_0_failed
LB_2151:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2153
LB_2152:
	add r14,1
LB_2153:
	cmp r14,r10
	jge LB_2154
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2152
	cmp al,10
	jz LB_2152
	cmp al,32
	jz LB_2152
LB_2154:
	push r10
	call NS_E_1566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2155
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2156
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2156:
	jmp NS_E_1556_MTC_0_failed
LB_2155:
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
	jc LB_2142
	btr QWORD [rdi],1
LB_2142:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2143
	btr QWORD [rdi],0
LB_2143:
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
NS_E_1556_MTC_0_failed:
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
NS_E_1558:
NS_E_RDI_1558:
NS_E_1558_ETR_TBL:
NS_E_1558_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_1560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2163
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1558_MTC_0_failed
LB_2163:
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
	jc LB_2158
	btr QWORD [rdi],0
LB_2158:
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
NS_E_1558_MTC_0_failed:
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
NS_E_1560:
NS_E_RDI_1560:
NS_E_1560_ETR_TBL:
NS_E_1560_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_2177
LB_2176:
	add r14,1
LB_2177:
	cmp r14,r10
	jge LB_2178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2176
	cmp al,10
	jz LB_2176
	cmp al,32
	jz LB_2176
LB_2178:
	push r10
	call NS_E_1562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2179
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1560_MTC_0_failed
LB_2179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_2182
LB_2181:
	add r14,1
LB_2182:
	cmp r14,r10
	jge LB_2183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2181
	cmp al,10
	jz LB_2181
	cmp al,32
	jz LB_2181
LB_2183:
	add r14,3
	cmp r14,r10
	jg LB_2187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_2187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_2187
	jmp LB_2188
LB_2187:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2185
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2185:
	jmp NS_E_1560_MTC_0_failed
LB_2188:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_2190
LB_2189:
	add r14,1
LB_2190:
	cmp r14,r10
	jge LB_2191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2189
	cmp al,10
	jz LB_2189
	cmp al,32
	jz LB_2189
LB_2191:
	push r10
	call NS_E_1560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2192
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2193
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2193:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2194
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2194:
	jmp NS_E_1560_MTC_0_failed
LB_2192:
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
	jc LB_2172
	btr QWORD [rdi],2
LB_2172:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2173
	btr QWORD [rdi],1
LB_2173:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2174
	btr QWORD [rdi],0
LB_2174:
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
NS_E_1560_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_2168
LB_2167:
	add r14,1
LB_2168:
	cmp r14,r10
	jge LB_2169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2167
	cmp al,10
	jz LB_2167
	cmp al,32
	jz LB_2167
LB_2169:
	push r10
	call NS_E_1562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2170
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1560_MTC_1_failed
LB_2170:
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
	jc LB_2165
	btr QWORD [rdi],0
LB_2165:
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
NS_E_1560_MTC_1_failed:
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
NS_E_1562:
NS_E_RDI_1562:
NS_E_1562_ETR_TBL:
NS_E_1562_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_2208
LB_2207:
	add r14,1
LB_2208:
	cmp r14,r10
	jge LB_2209
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2207
	cmp al,10
	jz LB_2207
	cmp al,32
	jz LB_2207
LB_2209:
	push r10
	call NS_E_1564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2210
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1562_MTC_0_failed
LB_2210:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_2213
LB_2212:
	add r14,1
LB_2213:
	cmp r14,r10
	jge LB_2214
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2212
	cmp al,10
	jz LB_2212
	cmp al,32
	jz LB_2212
LB_2214:
	add r14,3
	cmp r14,r10
	jg LB_2218
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2218
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_2218
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_2218
	jmp LB_2219
LB_2218:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2216
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2216:
	jmp NS_E_1562_MTC_0_failed
LB_2219:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
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
	call NS_E_1564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2223
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2224
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2224:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2225:
	jmp NS_E_1562_MTC_0_failed
LB_2223:
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
	jc LB_2203
	btr QWORD [rdi],2
LB_2203:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2204
	btr QWORD [rdi],1
LB_2204:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2205
	btr QWORD [rdi],0
LB_2205:
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
NS_E_1562_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_2199
LB_2198:
	add r14,1
LB_2199:
	cmp r14,r10
	jge LB_2200
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2198
	cmp al,10
	jz LB_2198
	cmp al,32
	jz LB_2198
LB_2200:
	push r10
	call NS_E_1564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2201
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1562_MTC_1_failed
LB_2201:
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
	jc LB_2196
	btr QWORD [rdi],0
LB_2196:
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
NS_E_1562_MTC_1_failed:
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
NS_E_1564:
NS_E_RDI_1564:
NS_E_1564_ETR_TBL:
NS_E_1564_TBL:
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
	jz LB_2232
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1564_MTC_0_failed
LB_2232:
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
	jc LB_2227
	btr QWORD [rdi],0
LB_2227:
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
NS_E_1564_MTC_0_failed:
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
NS_E_1566:
NS_E_RDI_1566:
NS_E_1566_ETR_TBL:
NS_E_1566_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_2246
LB_2245:
	add r14,1
LB_2246:
	cmp r14,r10
	jge LB_2247
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2245
	cmp al,10
	jz LB_2245
	cmp al,32
	jz LB_2245
LB_2247:
	add r14,1
	cmp r14,r10
	jg LB_2250
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_2250
	jmp LB_2251
LB_2250:
	jmp NS_E_1566_MTC_0_failed
LB_2251:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_2253
LB_2252:
	add r14,1
LB_2253:
	cmp r14,r10
	jge LB_2254
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2252
	cmp al,10
	jz LB_2252
	cmp al,32
	jz LB_2252
LB_2254:
	push r10
	call NS_E_1568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2255
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2256
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2256:
	jmp NS_E_1566_MTC_0_failed
LB_2255:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_2259
LB_2258:
	add r14,1
LB_2259:
	cmp r14,r10
	jge LB_2260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2258
	cmp al,10
	jz LB_2258
	cmp al,32
	jz LB_2258
LB_2260:
	add r14,1
	cmp r14,r10
	jg LB_2265
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_2265
	jmp LB_2266
LB_2265:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2262
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2262:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2263:
	jmp NS_E_1566_MTC_0_failed
LB_2266:
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
	jc LB_2241
	btr QWORD [rdi],2
LB_2241:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2242
	btr QWORD [rdi],1
LB_2242:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2243
	btr QWORD [rdi],0
LB_2243:
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
NS_E_1566_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_2237
LB_2236:
	add r14,1
LB_2237:
	cmp r14,r10
	jge LB_2238
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2236
	cmp al,10
	jz LB_2236
	cmp al,32
	jz LB_2236
LB_2238:
	push r10
	call NS_E_1570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2239
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1566_MTC_1_failed
LB_2239:
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
	jc LB_2234
	btr QWORD [rdi],0
LB_2234:
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
NS_E_1566_MTC_1_failed:
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
NS_E_1568:
NS_E_RDI_1568:
NS_E_1568_ETR_TBL:
NS_E_1568_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_2272
LB_2271:
	add r14,1
LB_2272:
	cmp r14,r10
	jge LB_2273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2271
	cmp al,10
	jz LB_2271
	cmp al,32
	jz LB_2271
LB_2273:
	push r10
	call NS_E_1570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2274
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1568_MTC_0_failed
LB_2274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_2277
LB_2276:
	add r14,1
LB_2277:
	cmp r14,r10
	jge LB_2278
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2276
	cmp al,10
	jz LB_2276
	cmp al,32
	jz LB_2276
LB_2278:
	push r10
	call NS_E_1568_ETR_TBL
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
	jmp NS_E_1568_MTC_0_failed
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
	jc LB_2268
	btr QWORD [rdi],1
LB_2268:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2269
	btr QWORD [rdi],0
LB_2269:
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
NS_E_1568_MTC_0_failed:
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
NS_E_1568_MTC_1_failed:
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
NS_E_1570:
NS_E_RDI_1570:
NS_E_1570_ETR_TBL:
NS_E_1570_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_2306
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_2306
	jmp LB_2307
LB_2306:
	jmp NS_E_1570_MTC_0_failed
LB_2307:
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
	jz LB_2311
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2312
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2312:
	jmp NS_E_1570_MTC_0_failed
LB_2311:
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
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1570_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_2294
LB_2293:
	add r14,1
LB_2294:
	cmp r14,r10
	jge LB_2295
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2293
	cmp al,10
	jz LB_2293
	cmp al,32
	jz LB_2293
LB_2295:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2296
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1570_MTC_1_failed
LB_2296:
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
	jc LB_2291
	btr QWORD [rdi],0
LB_2291:
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
NS_E_1570_MTC_1_failed:
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
	jg LB_2289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2289
	jmp LB_2290
LB_2289:
	jmp NS_E_1570_MTC_2_failed
LB_2290:
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
	jc LB_2282
	btr QWORD [rdi],0
LB_2282:
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
NS_E_1570_MTC_2_failed:
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
NS_E_2315:
NS_E_RDI_2315:
; 	» "a" _ ⊢ 0' : %_2314
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ {  }
 ; {>  %_2314~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_2316
	mov rdi,r13
	call dlt
LB_2316:
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
	NS_E_DYN_1322:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1322
	NS_E_DYN_1446:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1446
	CST_DYN_1518:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1571:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1572:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1542:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1542
	NS_E_DYN_1573:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1574:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1575:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1576:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1577:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_1578:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_1579:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_1544:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1544
	NS_E_DYN_1580:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1581:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1582:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1546:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1546
	NS_E_DYN_1583:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1584:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1585:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1586:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1548:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1548
	NS_E_DYN_1587:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1550:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1550
	NS_E_DYN_1588:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1589:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1552:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1552
	NS_E_DYN_1590:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1591:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1592:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1554:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1554
	NS_E_DYN_1593:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1556:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1556
	NS_E_DYN_1594:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1558:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1558
	NS_E_DYN_1595:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1596:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1560:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1560
	NS_E_DYN_1597:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1598:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1562:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1562
	NS_E_DYN_1599:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1564:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1564
	NS_E_DYN_1600:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1601:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1566:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1566
	NS_E_DYN_1602:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1603:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1568:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1568
	NS_E_DYN_1604:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1605:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1606:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1570:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1570
	CST_DYN_2315:
		dq 0x0000_0001_00_82_ffff
		dq 1
