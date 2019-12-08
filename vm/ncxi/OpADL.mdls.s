%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1383
	call NS_E_2180
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
	jg LB_810
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_810
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_810
	jmp LB_811
LB_810:
	jmp NS_E_670_MTC_0_failed
LB_811:
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
	jz LB_815
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_816:
	jmp NS_E_670_MTC_0_failed
LB_815:
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
	jz LB_821
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_822
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_822:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_823
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_823:
	jmp NS_E_670_MTC_0_failed
LB_821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_803
	btr r12,2
	jmp LB_804
LB_803:
	bts r12,2
LB_804:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_801
	btr r12,1
	jmp LB_802
LB_801:
	bts r12,1
LB_802:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_799
	btr r12,0
	jmp LB_800
LB_799:
	bts r12,0
LB_800:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_796
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_825
	btr r12,3
	jmp LB_826
LB_825:
	bts r12,3
LB_826:
	mov r13,r14
	bt r12,1
	jc LB_827
	btr r12,0
	jmp LB_828
LB_827:
	bts r12,0
LB_828:
	mov r10,r8
	bt r12,2
	jc LB_829
	btr r12,4
	jmp LB_830
LB_829:
	bts r12,4
LB_830:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_833
	btr r12,5
	jmp LB_834
LB_833:
	bts r12,5
LB_834:
	mov r14,r11
	bt r12,5
	jc LB_831
	btr r12,1
	jmp LB_832
LB_831:
	bts r12,1
LB_832:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_837
	btr r12,5
	jmp LB_838
LB_837:
	bts r12,5
LB_838:
	mov r8,r11
	bt r12,5
	jc LB_835
	btr r12,2
	jmp LB_836
LB_835:
	bts r12,2
LB_836:
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
	jc LB_747
	btr r12,3
	jmp LB_748
LB_747:
	bts r12,3
LB_748:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_751
	btr r12,4
	jmp LB_752
LB_751:
	bts r12,4
LB_752:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_749
	btr QWORD [rdi],0
	jmp LB_750
LB_749:
	bts QWORD [rdi],0
LB_750:
	mov r10,r14
	bt r12,1
	jc LB_755
	btr r12,4
	jmp LB_756
LB_755:
	bts r12,4
LB_756:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_753
	btr QWORD [rdi],1
	jmp LB_754
LB_753:
	bts QWORD [rdi],1
LB_754:
	mov r10,r8
	bt r12,2
	jc LB_759
	btr r12,4
	jmp LB_760
LB_759:
	bts r12,4
LB_760:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_757
	btr QWORD [rdi],2
	jmp LB_758
LB_757:
	bts QWORD [rdi],2
LB_758:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_761
	btr r12,3
	jmp LB_762
LB_761:
	bts r12,3
LB_762:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_765
	btr r12,4
	jmp LB_766
LB_765:
	bts r12,4
LB_766:
	mov r13,r10
	bt r12,4
	jc LB_763
	btr r12,0
	jmp LB_764
LB_763:
	bts r12,0
LB_764:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_769
	btr r12,4
	jmp LB_770
LB_769:
	bts r12,4
LB_770:
	mov r14,r10
	bt r12,4
	jc LB_767
	btr r12,1
	jmp LB_768
LB_767:
	bts r12,1
LB_768:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_773
	btr r12,4
	jmp LB_774
LB_773:
	bts r12,4
LB_774:
	mov r8,r10
	bt r12,4
	jc LB_771
	btr r12,2
	jmp LB_772
LB_771:
	bts r12,2
LB_772:
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
	jc LB_775
	mov rdi,r13
	call dlt
LB_775:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_776
	btr r12,0
	jmp LB_777
LB_776:
	bts r12,0
LB_777:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_780
	btr r12,4
	jmp LB_781
LB_780:
	bts r12,4
LB_781:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_778
	btr QWORD [rdi],0
	jmp LB_779
LB_778:
	bts QWORD [rdi],0
LB_779:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_790
	btr r12,1
	jmp LB_791
LB_790:
	bts r12,1
LB_791:
	mov rsi,1
	bt r12,1
	jc LB_788
	mov rsi,0
	bt r14,0
	jc LB_788
	jmp LB_789
LB_788:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_789:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_786
	btr QWORD [rdi],0
	jmp LB_787
LB_786:
	bts QWORD [rdi],0
LB_787:
	mov r14,r8
	bt r12,2
	jc LB_794
	btr r12,1
	jmp LB_795
LB_794:
	bts r12,1
LB_795:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_792
	btr QWORD [rdi],1
	jmp LB_793
LB_792:
	bts QWORD [rdi],1
LB_793:
	mov rsi,1
	bt r12,4
	jc LB_784
	mov rsi,0
	bt r10,0
	jc LB_784
	jmp LB_785
LB_784:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_785:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_782
	btr QWORD [rdi],1
	jmp LB_783
LB_782:
	bts QWORD [rdi],1
LB_783:
	mov r8,0
	bts r12,2
	ret
LB_796:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_798
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_797
LB_798:
	add rsp,8
	ret
NS_E_670_MTC_0_failed:
	add rsp,48
	pop r14
LB_797:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_882
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_882
	jmp LB_883
LB_882:
	jmp NS_E_670_MTC_1_failed
LB_883:
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
	jmp NS_E_670_MTC_1_failed
LB_887:
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
	jz LB_893
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_894
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_894:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_895
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_895:
	jmp NS_E_670_MTC_1_failed
LB_893:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_875
	btr r12,2
	jmp LB_876
LB_875:
	bts r12,2
LB_876:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_873
	btr r12,1
	jmp LB_874
LB_873:
	bts r12,1
LB_874:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_871
	btr r12,0
	jmp LB_872
LB_871:
	bts r12,0
LB_872:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_868
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_897
	btr r12,3
	jmp LB_898
LB_897:
	bts r12,3
LB_898:
	mov r13,r14
	bt r12,1
	jc LB_899
	btr r12,0
	jmp LB_900
LB_899:
	bts r12,0
LB_900:
	mov r10,r8
	bt r12,2
	jc LB_901
	btr r12,4
	jmp LB_902
LB_901:
	bts r12,4
LB_902:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_905
	btr r12,5
	jmp LB_906
LB_905:
	bts r12,5
LB_906:
	mov r14,r11
	bt r12,5
	jc LB_903
	btr r12,1
	jmp LB_904
LB_903:
	bts r12,1
LB_904:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_909
	btr r12,5
	jmp LB_910
LB_909:
	bts r12,5
LB_910:
	mov r8,r11
	bt r12,5
	jc LB_907
	btr r12,2
	jmp LB_908
LB_907:
	bts r12,2
LB_908:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f21 %_687 ⊢ %_688 : %_688
 ; {>  %_686~1':_r64 %_687~2':(_lst)◂(_p667) %_685~0':_r64 }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_843
	btr r12,0
	jmp LB_844
LB_843:
	bts r12,0
LB_844:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_845
	btr r12,2
	jmp LB_846
LB_845:
	bts r12,2
LB_846:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_841
	btr r12,1
	jmp LB_842
LB_841:
	bts r12,1
LB_842:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_839
	btr r12,0
	jmp LB_840
LB_839:
	bts r12,0
LB_840:
	add rsp,24
; » 0xr2 |~ {  } ⊢ %_689 : %_689
 ; {>  %_686~1':_r64 %_688~2':(_lst)◂(_p667) %_685~0':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_689
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_689 %_685 } ⊢ { %_690 %_691 } : { %_690 %_691 }
 ; {>  %_686~1':_r64 %_689~3':_r64 %_688~2':(_lst)◂(_p667) %_685~0':_r64 }
	add r9,r13
; _f668 %_690 ⊢ %_692 : %_692
 ; {>  %_691~0':_r64 %_686~1':_r64 %_688~2':(_lst)◂(_p667) %_690~3':_r64 }
; _f668 3' ⊢ °0◂3'
; _cns { %_692 %_688 } ⊢ %_693 : %_693
 ; {>  %_691~0':_r64 %_692~°0◂3':_p667 %_686~1':_r64 %_688~2':(_lst)◂(_p667) }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_686 %_693 } ⊢ %_694 : %_694
 ; {>  %_691~0':_r64 %_686~1':_r64 %_693~°0◂{ °0◂3' 2' }:(_lst)◂(_p667) }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_694
 ; {>  %_691~0':_r64 %_694~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_847
	mov rdi,r13
	call dlt
LB_847:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_848
	btr r12,0
	jmp LB_849
LB_848:
	bts r12,0
LB_849:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_852
	btr r12,4
	jmp LB_853
LB_852:
	bts r12,4
LB_853:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_850
	btr QWORD [rdi],0
	jmp LB_851
LB_850:
	bts QWORD [rdi],0
LB_851:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_862
	btr r12,1
	jmp LB_863
LB_862:
	bts r12,1
LB_863:
	mov rsi,1
	bt r12,1
	jc LB_860
	mov rsi,0
	bt r14,0
	jc LB_860
	jmp LB_861
LB_860:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_861:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_858
	btr QWORD [rdi],0
	jmp LB_859
LB_858:
	bts QWORD [rdi],0
LB_859:
	mov r14,r8
	bt r12,2
	jc LB_866
	btr r12,1
	jmp LB_867
LB_866:
	bts r12,1
LB_867:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_864
	btr QWORD [rdi],1
	jmp LB_865
LB_864:
	bts QWORD [rdi],1
LB_865:
	mov rsi,1
	bt r12,4
	jc LB_856
	mov rsi,0
	bt r10,0
	jc LB_856
	jmp LB_857
LB_856:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_857:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_854
	btr QWORD [rdi],1
	jmp LB_855
LB_854:
	bts QWORD [rdi],1
LB_855:
	mov r8,0
	bts r12,2
	ret
LB_868:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_870
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_869
LB_870:
	add rsp,8
	ret
NS_E_670_MTC_1_failed:
	add rsp,48
	pop r14
LB_869:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1016
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_670_MTC_2_failed
LB_1016:
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
	jz LB_1021
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1022
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1022:
	jmp NS_E_670_MTC_2_failed
LB_1021:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1011
	btr r12,1
	jmp LB_1012
LB_1011:
	bts r12,1
LB_1012:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1009
	btr r12,0
	jmp LB_1010
LB_1009:
	bts r12,0
LB_1010:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1006
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_1024
	btr r12,3
	jmp LB_1025
LB_1024:
	bts r12,3
LB_1025:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1028
	btr r12,4
	jmp LB_1029
LB_1028:
	bts r12,4
LB_1029:
	mov r14,r10
	bt r12,4
	jc LB_1026
	btr r12,1
	jmp LB_1027
LB_1026:
	bts r12,1
LB_1027:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1032
	btr r12,4
	jmp LB_1033
LB_1032:
	bts r12,4
LB_1033:
	mov r8,r10
	bt r12,4
	jc LB_1030
	btr r12,2
	jmp LB_1031
LB_1030:
	bts r12,2
LB_1031:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f21 %_697 ⊢ %_698 : %_698
 ; {>  %_695~0':_r64 %_696~1':_r64 %_697~2':(_lst)◂(_p667) }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_915
	btr r12,0
	jmp LB_916
LB_915:
	bts r12,0
LB_916:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_917
	btr r12,2
	jmp LB_918
LB_917:
	bts r12,2
LB_918:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_913
	btr r12,1
	jmp LB_914
LB_913:
	bts r12,1
LB_914:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_911
	btr r12,0
	jmp LB_912
LB_911:
	bts r12,0
LB_912:
	add rsp,24
MTC_LB_919:
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_920
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
	jnc LB_921
	bt QWORD [rax],0
	jc LB_922
	btr r12,5
	jmp LB_923
LB_922:
	bts r12,5
LB_923:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_921:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_926
	btr r12,6
	jmp LB_927
LB_926:
	bts r12,6
LB_927:
	mov r9,rcx
	bt r12,6
	jc LB_924
	btr r12,3
	jmp LB_925
LB_924:
	bts r12,3
LB_925:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_930
	btr r12,6
	jmp LB_931
LB_930:
	bts r12,6
LB_931:
	mov r10,rcx
	bt r12,6
	jc LB_928
	btr r12,4
	jmp LB_929
LB_928:
	bts r12,4
LB_929:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_920
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
	jnc LB_932
	bt QWORD [rax],0
	jc LB_933
	btr r12,6
	jmp LB_934
LB_933:
	bts r12,6
LB_934:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_932:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_935
	btr r12,5
	jmp LB_936
LB_935:
	bts r12,5
LB_936:
LB_937:
	cmp r15,0
	jz LB_938
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_937
LB_938:
; » 0xr1 |~ {  } ⊢ %_702 : %_702
 ; {>  %_701~5':_r64 %_695~0':_r64 %_696~1':_r64 %_700~4':(_lst)◂(_p667) }
; 	» 0xr1 _ ⊢ 2' : %_702
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_701 %_702 } ⊢ { %_703 %_704 } : { %_703 %_704 }
 ; {>  %_701~5':_r64 %_695~0':_r64 %_696~1':_r64 %_700~4':(_lst)◂(_p667) %_702~2':_r64 }
	add r11,r8
; _f34 { %_696 %_704 } ⊢ { %_705 %_706 } : { %_705 %_706 }
 ; {>  %_704~2':_r64 %_695~0':_r64 %_696~1':_r64 %_700~4':(_lst)◂(_p667) %_703~5':_r64 }
	add r14,r8
; _f669 %_703 ⊢ %_707 : %_707
 ; {>  %_706~2':_r64 %_695~0':_r64 %_700~4':(_lst)◂(_p667) %_703~5':_r64 %_705~1':_r64 }
; _f669 5' ⊢ °1◂5'
; _cns { %_707 %_700 } ⊢ %_708 : %_708
 ; {>  %_706~2':_r64 %_695~0':_r64 %_700~4':(_lst)◂(_p667) %_707~°1◂5':_p667 %_705~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _f21 %_708 ⊢ %_709 : %_709
 ; {>  %_706~2':_r64 %_695~0':_r64 %_708~°0◂{ °1◂5' 4' }:(_lst)◂(_p667) %_705~1':_r64 }
; _f21 °0◂{ °1◂5' 4' } ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},°0◂{ °1◂5' 4' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_951
	btr r12,1
	jmp LB_952
LB_951:
	bts r12,1
LB_952:
	mov rsi,1
	bt r12,1
	jc LB_949
	mov rsi,0
	bt r14,0
	jc LB_949
	jmp LB_950
LB_949:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_950:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_947
	btr QWORD [rdi],0
	jmp LB_948
LB_947:
	bts QWORD [rdi],0
LB_948:
	mov r14,r10
	bt r12,4
	jc LB_955
	btr r12,1
	jmp LB_956
LB_955:
	bts r12,1
LB_956:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_953
	btr QWORD [rdi],1
	jmp LB_954
LB_953:
	bts QWORD [rdi],1
LB_954:
	mov rsi,1
	bt r12,0
	jc LB_945
	mov rsi,0
	bt r13,0
	jc LB_945
	jmp LB_946
LB_945:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_946:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_957
	btr r12,3
	jmp LB_958
LB_957:
	bts r12,3
LB_958:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_943
	btr r12,2
	jmp LB_944
LB_943:
	bts r12,2
LB_944:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_941
	btr r12,1
	jmp LB_942
LB_941:
	bts r12,1
LB_942:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_939
	btr r12,0
	jmp LB_940
LB_939:
	bts r12,0
LB_940:
	add rsp,32
; _some { %_705 %_709 } ⊢ %_710 : %_710
 ; {>  %_709~3':(_lst)◂(_p667) %_706~2':_r64 %_695~0':_r64 %_705~1':_r64 }
; _some { 1' 3' } ⊢ °0◂{ 1' 3' }
; _f21 %_710 ⊢ %_711 : %_711
 ; {>  %_710~°0◂{ 1' 3' }:(_opn)◂({ _r64 (_lst)◂(_p667) }) %_706~2':_r64 %_695~0':_r64 }
; _f21 °0◂{ 1' 3' } ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},°0◂{ 1' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_967
	btr r12,2
	jmp LB_968
LB_967:
	bts r12,2
LB_968:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_965
	btr QWORD [rdi],0
	jmp LB_966
LB_965:
	bts QWORD [rdi],0
LB_966:
	mov r8,r9
	bt r12,3
	jc LB_971
	btr r12,2
	jmp LB_972
LB_971:
	bts r12,2
LB_972:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_969
	btr QWORD [rdi],1
	jmp LB_970
LB_969:
	bts QWORD [rdi],1
LB_970:
	mov rsi,1
	bt r12,0
	jc LB_963
	mov rsi,0
	bt r13,0
	jc LB_963
	jmp LB_964
LB_963:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_964:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_973
	btr r12,1
	jmp LB_974
LB_973:
	bts r12,1
LB_974:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_961
	btr r12,2
	jmp LB_962
LB_961:
	bts r12,2
LB_962:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_959
	btr r12,0
	jmp LB_960
LB_959:
	bts r12,0
LB_960:
	add rsp,24
; ∎ %_711
 ; {>  %_711~1':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_706~2':_r64 %_695~0':_r64 }
; 	∎ 1'
	bt r12,2
	jc LB_975
	mov rdi,r8
	call dlt
LB_975:
	bt r12,0
	jc LB_976
	mov rdi,r13
	call dlt
LB_976:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 2'◂3'
; 1' ⊢ 2'◂3'
	btr r12,0
	mov r8,r14
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_977
	bt QWORD [rax],0
	jc LB_978
	btr r12,0
	jmp LB_979
LB_978:
	bts r12,0
LB_979:
	mov rdi,QWORD [rax+8*1]
	mov QWORD [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_977:
	mov r13,rax
	mov r9,r13
	bt r12,0
	jc LB_980
	btr r12,3
	jmp LB_981
LB_980:
	bts r12,3
LB_981:
	ret
MTC_LB_920:
LB_983:
	cmp r15,0
	jz LB_984
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_983
LB_984:
; » 0xr1 |~ {  } ⊢ %_712 : %_712
 ; {>  %_698~2':(_lst)◂(_p667) %_695~0':_r64 %_696~1':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_712
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_696 %_712 } ⊢ { %_713 %_714 } : { %_713 %_714 }
 ; {>  %_712~3':_r64 %_698~2':(_lst)◂(_p667) %_695~0':_r64 %_696~1':_r64 }
	add r14,r9
; _f669 %_714 ⊢ %_715 : %_715
 ; {>  %_713~1':_r64 %_698~2':(_lst)◂(_p667) %_714~3':_r64 %_695~0':_r64 }
; _f669 3' ⊢ °1◂3'
; _cns { %_715 %_698 } ⊢ %_716 : %_716
 ; {>  %_713~1':_r64 %_715~°1◂3':_p667 %_698~2':(_lst)◂(_p667) %_695~0':_r64 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_713 %_716 } ⊢ %_717 : %_717
 ; {>  %_713~1':_r64 %_695~0':_r64 %_716~°0◂{ °1◂3' 2' }:(_lst)◂(_p667) }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_717
 ; {>  %_695~0':_r64 %_717~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p667) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_985
	mov rdi,r13
	call dlt
LB_985:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_986
	btr r12,0
	jmp LB_987
LB_986:
	bts r12,0
LB_987:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_990
	btr r12,4
	jmp LB_991
LB_990:
	bts r12,4
LB_991:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_988
	btr QWORD [rdi],0
	jmp LB_989
LB_988:
	bts QWORD [rdi],0
LB_989:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_1000
	btr r12,1
	jmp LB_1001
LB_1000:
	bts r12,1
LB_1001:
	mov rsi,1
	bt r12,1
	jc LB_998
	mov rsi,0
	bt r14,0
	jc LB_998
	jmp LB_999
LB_998:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_999:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_996
	btr QWORD [rdi],0
	jmp LB_997
LB_996:
	bts QWORD [rdi],0
LB_997:
	mov r14,r8
	bt r12,2
	jc LB_1004
	btr r12,1
	jmp LB_1005
LB_1004:
	bts r12,1
LB_1005:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1002
	btr QWORD [rdi],1
	jmp LB_1003
LB_1002:
	bts QWORD [rdi],1
LB_1003:
	mov rsi,1
	bt r12,4
	jc LB_994
	mov rsi,0
	bt r10,0
	jc LB_994
	jmp LB_995
LB_994:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_995:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_992
	btr QWORD [rdi],1
	jmp LB_993
LB_992:
	bts QWORD [rdi],1
LB_993:
	mov r8,0
	bts r12,2
	ret
MTC_LB_982:
LB_1006:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1008
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1007
LB_1008:
	add rsp,8
	ret
NS_E_670_MTC_2_failed:
	add rsp,32
	pop r14
LB_1007:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_1043
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_718
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_718 ⊢ %_719 : %_719
 ; {>  %_718~0':_stg }
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
; _nil {  } ⊢ %_720 : %_720
 ; {>  %_719~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_721 : %_721
 ; {>  %_720~°1◂{  }:(_lst)◂(t380'(0)) %_719~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_721
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_721 %_720 } ⊢ %_722 : %_722
 ; {>  %_720~°1◂{  }:(_lst)◂(t380'(0)) %_719~0':_stg %_721~1':_r64 }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_722
 ; {>  %_722~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t384'(0)) }) %_719~0':_stg }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_1034
	mov rdi,r13
	call dlt
LB_1034:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_1037
	btr r12,0
	jmp LB_1038
LB_1037:
	bts r12,0
LB_1038:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_1035
	btr QWORD [rdi],0
	jmp LB_1036
LB_1035:
	bts QWORD [rdi],0
LB_1036:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_1041
	mov rsi,0
	bt r13,0
	jc LB_1041
	jmp LB_1042
LB_1041:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1042:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_1039
	btr QWORD [rdi],1
	jmp LB_1040
LB_1039:
	bts QWORD [rdi],1
LB_1040:
	mov r8,0
	bts r12,2
	ret
LB_1043:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1045
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1044
LB_1045:
	add rsp,8
	ret
NS_E_670_MTC_3_failed:
	add rsp,0
	pop r14
LB_1044:
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
	jg LB_1058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_1058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_1058
	jmp LB_1059
LB_1058:
	jmp NS_E_671_MTC_0_failed
LB_1059:
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
	jc LB_1051
	btr r12,0
	jmp LB_1052
LB_1051:
	bts r12,0
LB_1052:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1048
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_723 : %_723
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_723
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_723 ⊢ %_724 : %_724
 ; {>  %_723~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_724
 ; {>  %_724~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1046
	btr r12,3
	jmp LB_1047
LB_1046:
	bts r12,3
LB_1047:
	mov r8,0
	bts r12,2
	ret
LB_1048:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1050
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1049
LB_1050:
	add rsp,8
	ret
NS_E_671_MTC_0_failed:
	add rsp,16
	pop r14
LB_1049:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_1078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_1078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_1078
	jmp LB_1079
LB_1078:
	jmp NS_E_671_MTC_1_failed
LB_1079:
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
	jz LB_1083
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1084
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1084:
	jmp NS_E_671_MTC_1_failed
LB_1083:
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
	jz LB_1089
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1090
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1090:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1091:
	jmp NS_E_671_MTC_1_failed
LB_1089:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1071
	btr r12,2
	jmp LB_1072
LB_1071:
	bts r12,2
LB_1072:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1069
	btr r12,1
	jmp LB_1070
LB_1069:
	bts r12,1
LB_1070:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1067
	btr r12,0
	jmp LB_1068
LB_1067:
	bts r12,0
LB_1068:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_1064
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_1093
	btr r12,3
	jmp LB_1094
LB_1093:
	bts r12,3
LB_1094:
	mov r14,r8
	bt r12,2
	jc LB_1095
	btr r12,1
	jmp LB_1096
LB_1095:
	bts r12,1
LB_1096:
	mov r8,r13
	bt r12,0
	jc LB_1097
	btr r12,2
	jmp LB_1098
LB_1097:
	bts r12,2
LB_1098:
	mov r13,r9
	bt r12,3
	jc LB_1099
	btr r12,0
	jmp LB_1100
LB_1099:
	bts r12,0
LB_1100:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_727 : %_727
 ; {>  %_725~0':_r64 %_726~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_727
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_727 %_725 } ⊢ { %_728 %_729 } : { %_728 %_729 }
 ; {>  %_725~0':_r64 %_727~2':_r64 %_726~1':_r64 }
	add r8,r13
; _f34 { %_728 %_726 } ⊢ { %_730 %_731 } : { %_730 %_731 }
 ; {>  %_729~0':_r64 %_728~2':_r64 %_726~1':_r64 }
	add r8,r14
; _some %_730 ⊢ %_732 : %_732
 ; {>  %_731~1':_r64 %_729~0':_r64 %_730~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_732
 ; {>  %_731~1':_r64 %_729~0':_r64 %_732~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1060
	mov rdi,r14
	call dlt
LB_1060:
	bt r12,0
	jc LB_1061
	mov rdi,r13
	call dlt
LB_1061:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1062
	btr r12,3
	jmp LB_1063
LB_1062:
	bts r12,3
LB_1063:
	mov r8,0
	bts r12,2
	ret
LB_1064:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1066
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1065
LB_1066:
	add rsp,8
	ret
NS_E_671_MTC_1_failed:
	add rsp,48
	pop r14
LB_1065:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_50_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1115
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_671_MTC_2_failed
LB_1115:
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
	jz LB_1120
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1121
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1121:
	jmp NS_E_671_MTC_2_failed
LB_1120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1110
	btr r12,1
	jmp LB_1111
LB_1110:
	bts r12,1
LB_1111:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1108
	btr r12,0
	jmp LB_1109
LB_1108:
	bts r12,0
LB_1109:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1105
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
	jc LB_1101
	mov rdi,r14
	call dlt
LB_1101:
	bt r12,0
	jc LB_1102
	mov rdi,r13
	call dlt
LB_1102:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1103
	btr r12,3
	jmp LB_1104
LB_1103:
	bts r12,3
LB_1104:
	mov r8,0
	bts r12,2
	ret
LB_1105:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1107
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1106
LB_1107:
	add rsp,8
	ret
NS_E_671_MTC_2_failed:
	add rsp,32
	pop r14
LB_1106:
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
	jg LB_1135
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1135
	jmp LB_1136
LB_1135:
	jmp NS_E_672_MTC_0_failed
LB_1136:
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
	jc LB_1128
	btr r12,0
	jmp LB_1129
LB_1128:
	bts r12,0
LB_1129:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1125
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_739 : %_739
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_739
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_739 ⊢ %_740 : %_740
 ; {>  %_739~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_740
 ; {>  %_740~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1123
	btr r12,3
	jmp LB_1124
LB_1123:
	bts r12,3
LB_1124:
	mov r8,0
	bts r12,2
	ret
LB_1125:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1127
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1126
LB_1127:
	add rsp,8
	ret
NS_E_672_MTC_0_failed:
	add rsp,16
	pop r14
LB_1126:
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
	jmp NS_E_672_MTC_1_failed
LB_1151:
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
	jmp NS_E_672_MTC_1_failed
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
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_743 : %_743
 ; {>  %_741~0':_r64 %_742~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_743
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_743 %_742 } ⊢ { %_744 %_745 } : { %_744 %_745 }
 ; {>  %_741~0':_r64 %_743~2':_r64 %_742~1':_r64 }
	add r8,r14
; _some %_744 ⊢ %_746 : %_746
 ; {>  %_745~1':_r64 %_741~0':_r64 %_744~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_746
 ; {>  %_745~1':_r64 %_741~0':_r64 %_746~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_1137
	mov rdi,r14
	call dlt
LB_1137:
	bt r12,0
	jc LB_1138
	mov rdi,r13
	call dlt
LB_1138:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_1139
	btr r12,3
	jmp LB_1140
LB_1139:
	bts r12,3
LB_1140:
	mov r8,0
	bts r12,2
	ret
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
NS_E_672_MTC_1_failed:
	add rsp,32
	pop r14
LB_1142:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1187:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_1187:
; _f21 %_1163 ⊢ %_1164 : %_1164
 ; {>  %_1163~4':(_lst)◂(_p667) %_1162~3':_r64 %_1160~1':_r64 %_1161~2':_stg %_1159~0':_stg }
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
	jc LB_1196
	btr r12,0
	jmp LB_1197
LB_1196:
	bts r12,0
LB_1197:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_1198
	btr r12,4
	jmp LB_1199
LB_1198:
	bts r12,4
LB_1199:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1194
	btr r12,3
	jmp LB_1195
LB_1194:
	bts r12,3
LB_1195:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1192
	btr r12,2
	jmp LB_1193
LB_1192:
	bts r12,2
LB_1193:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1190
	btr r12,1
	jmp LB_1191
LB_1190:
	bts r12,1
LB_1191:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1188
	btr r12,0
	jmp LB_1189
LB_1188:
	bts r12,0
LB_1189:
	add rsp,40
MTC_LB_1200:
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1201
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
	jnc LB_1202
	bt QWORD [rax],0
	jc LB_1203
	btr r12,7
	jmp LB_1204
LB_1203:
	bts r12,7
LB_1204:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1202:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1207
	btr r12,8
	jmp LB_1208
LB_1207:
	bts r12,8
LB_1208:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1205
	btr r12,5
	jmp LB_1206
LB_1205:
	bts r12,5
LB_1206:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1211
	btr r12,8
	jmp LB_1212
LB_1211:
	bts r12,8
LB_1212:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1209
	btr r12,6
	jmp LB_1210
LB_1209:
	bts r12,6
LB_1210:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1213:
	cmp r15,0
	jz LB_1214
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1213
LB_1214:
; _f21 %_1166 ⊢ %_1167 : %_1167
 ; {>  %_1165~5':_p667 %_1166~6':(_lst)◂(_p667) %_1162~3':_r64 %_1160~1':_r64 %_1161~2':_stg %_1159~0':_stg }
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
	jc LB_1225
	btr r12,0
	jmp LB_1226
LB_1225:
	bts r12,0
LB_1226:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_1227
	btr r12,4
	jmp LB_1228
LB_1227:
	bts r12,4
LB_1228:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_1223
	btr r12,5
	jmp LB_1224
LB_1223:
	bts r12,5
LB_1224:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1221
	btr r12,3
	jmp LB_1222
LB_1221:
	bts r12,3
LB_1222:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1219
	btr r12,2
	jmp LB_1220
LB_1219:
	bts r12,2
LB_1220:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1217
	btr r12,1
	jmp LB_1218
LB_1217:
	bts r12,1
LB_1218:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1215
	btr r12,0
	jmp LB_1216
LB_1215:
	bts r12,0
LB_1216:
	add rsp,48
MTC_LB_1229:
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1230
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
	jnc LB_1231
	bt QWORD [rax],0
	jc LB_1232
	btr r12,7
	jmp LB_1233
LB_1232:
	bts r12,7
LB_1233:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1231:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_1234
	btr r12,6
	jmp LB_1235
LB_1234:
	bts r12,6
LB_1235:
LB_1236:
	cmp r15,0
	jz LB_1237
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1236
LB_1237:
; _f36 %_1168 ⊢ { %_1169 %_1170 } : { %_1169 %_1170 }
 ; {>  %_1167~4':(_lst)◂(_p667) %_1162~3':_r64 %_1160~1':_r64 %_1161~2':_stg %_1159~0':_stg %_1168~6':_r64 }
	mov r11,rcx
	bts r12,5
; _f18 { %_1170 %_1159 %_1160 %_1161 %_1162 } ⊢ { %_1171 %_1172 %_1173 %_1174 %_1175 } : { %_1171 %_1172 %_1173 %_1174 %_1175 }
 ; {>  %_1167~4':(_lst)◂(_p667) %_1162~3':_r64 %_1160~1':_r64 %_1161~2':_stg %_1159~0':_stg %_1170~5':_r64 %_1169~6':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_1242
	btr r12,4
	jmp LB_1243
LB_1242:
	bts r12,4
LB_1243:
	mov r9,r8
	bt r12,2
	jc LB_1244
	btr r12,3
	jmp LB_1245
LB_1244:
	bts r12,3
LB_1245:
	mov r8,r14
	bt r12,1
	jc LB_1246
	btr r12,2
	jmp LB_1247
LB_1246:
	bts r12,2
LB_1247:
	mov r14,r13
	bt r12,0
	jc LB_1248
	btr r12,1
	jmp LB_1249
LB_1248:
	bts r12,1
LB_1249:
	mov r13,r11
	bt r12,5
	jc LB_1250
	btr r12,0
	jmp LB_1251
LB_1250:
	bts r12,0
LB_1251:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_1252
	btr r12,5
	jmp LB_1253
LB_1252:
	bts r12,5
LB_1253:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1240
	btr r12,6
	jmp LB_1241
LB_1240:
	bts r12,6
LB_1241:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_1238
	btr r12,4
	jmp LB_1239
LB_1238:
	bts r12,4
LB_1239:
	add rsp,24
; _f34 { %_1173 %_1169 } ⊢ { %_1176 %_1177 } : { %_1176 %_1177 }
 ; {>  %_1172~1':_stg %_1167~4':(_lst)◂(_p667) %_1175~5':_r64 %_1174~3':_stg %_1171~0':_r64 %_1173~2':_r64 %_1169~6':_r64 }
	add r8,rcx
; _f34 { %_1175 %_1177 } ⊢ { %_1178 %_1179 } : { %_1178 %_1179 }
 ; {>  %_1172~1':_stg %_1167~4':(_lst)◂(_p667) %_1176~2':_r64 %_1175~5':_r64 %_1174~3':_stg %_1171~0':_r64 %_1177~6':_r64 }
	add r11,rcx
; _f1187 { %_1172 %_1176 %_1174 %_1178 %_1167 } ⊢ { %_1180 %_1181 } : { %_1180 %_1181 }
 ; {>  %_1172~1':_stg %_1167~4':(_lst)◂(_p667) %_1179~6':_r64 %_1176~2':_r64 %_1174~3':_stg %_1171~0':_r64 %_1178~5':_r64 }
; _f1187 { 1' 2' 3' 5' 4' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0111110.. |},{ 1' 2' 3' 5' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_1258
	btr r12,0
	jmp LB_1259
LB_1258:
	bts r12,0
LB_1259:
	mov r14,r8
	bt r12,2
	jc LB_1260
	btr r12,1
	jmp LB_1261
LB_1260:
	bts r12,1
LB_1261:
	mov r8,r9
	bt r12,3
	jc LB_1262
	btr r12,2
	jmp LB_1263
LB_1262:
	bts r12,2
LB_1263:
	mov r9,r11
	bt r12,5
	jc LB_1264
	btr r12,3
	jmp LB_1265
LB_1264:
	bts r12,3
LB_1265:
	call NS_E_1187
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1266
	btr r12,2
	jmp LB_1267
LB_1266:
	bts r12,2
LB_1267:
	mov r14,r13
	bt r12,0
	jc LB_1268
	btr r12,1
	jmp LB_1269
LB_1268:
	bts r12,1
LB_1269:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_1256
	btr r12,6
	jmp LB_1257
LB_1256:
	bts r12,6
LB_1257:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1254
	btr r12,0
	jmp LB_1255
LB_1254:
	bts r12,0
LB_1255:
	add rsp,24
; ∎ { %_1180 %_1181 }
 ; {>  %_1181~2':_stg %_1180~1':_stg %_1179~6':_r64 %_1171~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,6
	jc LB_1270
	mov rdi,rcx
	call dlt
LB_1270:
	bt r12,0
	jc LB_1271
	mov rdi,r13
	call dlt
LB_1271:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_1272
	btr r12,0
	jmp LB_1273
LB_1272:
	bts r12,0
LB_1273:
	mov r14,r8
	bt r12,2
	jc LB_1274
	btr r12,1
	jmp LB_1275
LB_1274:
	bts r12,1
LB_1275:
	ret
MTC_LB_1230:
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1276
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
	jnc LB_1277
	bt QWORD [rax],0
	jc LB_1278
	btr r12,7
	jmp LB_1279
LB_1278:
	bts r12,7
LB_1279:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1277:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_1280
	btr r12,6
	jmp LB_1281
LB_1280:
	bts r12,6
LB_1281:
LB_1282:
	cmp r15,0
	jz LB_1283
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1282
LB_1283:
; _f34 { %_1160 %_1182 } ⊢ { %_1183 %_1184 } : { %_1183 %_1184 }
 ; {>  %_1167~4':(_lst)◂(_p667) %_1162~3':_r64 %_1160~1':_r64 %_1161~2':_stg %_1159~0':_stg %_1182~6':_r64 }
	add r14,rcx
; _f1187 { %_1159 %_1183 %_1161 %_1162 %_1167 } ⊢ { %_1185 %_1186 } : { %_1185 %_1186 }
 ; {>  %_1183~1':_r64 %_1167~4':(_lst)◂(_p667) %_1162~3':_r64 %_1161~2':_stg %_1159~0':_stg %_1184~6':_r64 }
; _f1187 { 0' 1' 2' 3' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
	call NS_E_1187
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*0]
	bt QWORD rax,6
	jc LB_1284
	btr r12,6
	jmp LB_1285
LB_1284:
	bts r12,6
LB_1285:
	add rsp,16
; ∎ { %_1185 %_1186 }
 ; {>  %_1185~0':_stg %_1184~6':_r64 %_1186~1':_stg }
; 	∎ { 0' 1' }
	bt r12,6
	jc LB_1286
	mov rdi,rcx
	call dlt
LB_1286:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1276:
MTC_LB_1201:
LB_1288:
	cmp r15,0
	jz LB_1289
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1288
LB_1289:
; ∎ { %_1159 %_1161 }
 ; {>  %_1162~3':_r64 %_1160~1':_r64 %_1161~2':_stg %_1159~0':_stg %_1164~4':(_lst)◂(_p667) }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_1290
	mov rdi,r9
	call dlt
LB_1290:
	bt r12,1
	jc LB_1291
	mov rdi,r14
	call dlt
LB_1291:
	bt r12,4
	jc LB_1292
	mov rdi,r10
	call dlt
LB_1292:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1293
	btr r12,1
	jmp LB_1294
LB_1293:
	bts r12,1
LB_1294:
	ret
MTC_LB_1287:
NS_E_1311:
; 	|» 0'
NS_E_RDI_1311:
; » 0xr0 |~ {  } ⊢ %_1296 : %_1296
 ; {>  %_1295~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1296
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f670 { %_1295 %_1296 } ⊢ { %_1297 %_1298 %_1299 } : { %_1297 %_1298 %_1299 }
 ; {>  %_1296~1':_r64 %_1295~0':_stg }
; _f670 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_670
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1312
	btr r12,4
	jmp LB_1313
LB_1312:
	bts r12,4
LB_1313:
	mov r8,r9
	bt r12,3
	jc LB_1316
	btr r12,2
	jmp LB_1317
LB_1316:
	bts r12,2
LB_1317:
	mov rsi,1
	bt r12,2
	jc LB_1314
	mov rsi,0
	bt r8,0
	jc LB_1314
	jmp LB_1315
LB_1314:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1315:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_1299 ⊢ %_1300 : %_1300
 ; {>  %_1299~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1298~1':_r64 %_1297~0':_stg }
; _f21 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1322
	btr r12,0
	jmp LB_1323
LB_1322:
	bts r12,0
LB_1323:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1324
	btr r12,2
	jmp LB_1325
LB_1324:
	bts r12,2
LB_1325:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1320
	btr r12,1
	jmp LB_1321
LB_1320:
	bts r12,1
LB_1321:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1318
	btr r12,0
	jmp LB_1319
LB_1318:
	bts r12,0
LB_1319:
	add rsp,24
MTC_LB_1326:
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1327
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
	jnc LB_1328
	bt QWORD [rax],0
	jc LB_1329
	btr r12,5
	jmp LB_1330
LB_1329:
	bts r12,5
LB_1330:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1328:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1333
	btr r12,6
	jmp LB_1334
LB_1333:
	bts r12,6
LB_1334:
	mov r9,rcx
	bt r12,6
	jc LB_1331
	btr r12,3
	jmp LB_1332
LB_1331:
	bts r12,3
LB_1332:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1337
	btr r12,6
	jmp LB_1338
LB_1337:
	bts r12,6
LB_1338:
	mov r10,rcx
	bt r12,6
	jc LB_1335
	btr r12,4
	jmp LB_1336
LB_1335:
	bts r12,4
LB_1336:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1339:
	cmp r15,0
	jz LB_1340
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1339
LB_1340:
; _f14 %_1301 ⊢ { %_1303 %_1304 } : { %_1303 %_1304 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1298~1':_r64 %_1301~3':_r64 %_1297~0':_stg }
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
	jc LB_1347
	btr r12,0
	jmp LB_1348
LB_1347:
	bts r12,0
LB_1348:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_1349
	btr r12,2
	jmp LB_1350
LB_1349:
	bts r12,2
LB_1350:
	mov r9,r14
	bt r12,1
	jc LB_1351
	btr r12,3
	jmp LB_1352
LB_1351:
	bts r12,3
LB_1352:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_1345
	btr r12,4
	jmp LB_1346
LB_1345:
	bts r12,4
LB_1346:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1343
	btr r12,1
	jmp LB_1344
LB_1343:
	bts r12,1
LB_1344:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1341
	btr r12,0
	jmp LB_1342
LB_1341:
	bts r12,0
LB_1342:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_1305 : %_1305
 ; {>  %_1302~4':(_lst)◂(_p667) %_1304~3':_stg %_1303~2':_r64 %_1298~1':_r64 %_1297~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_1305
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_1306 : %_1306
 ; {>  %_1302~4':(_lst)◂(_p667) %_1304~3':_stg %_1305~5':_r64 %_1303~2':_r64 %_1298~1':_r64 %_1297~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_1306
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f1187 { %_1297 %_1305 %_1304 %_1306 %_1302 } ⊢ { %_1307 %_1308 } : { %_1307 %_1308 }
 ; {>  %_1302~4':(_lst)◂(_p667) %_1304~3':_stg %_1305~5':_r64 %_1306~6':_r64 %_1303~2':_r64 %_1298~1':_r64 %_1297~0':_stg }
; _f1187 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_1357
	btr r12,1
	jmp LB_1358
LB_1357:
	bts r12,1
LB_1358:
	mov r8,r9
	bt r12,3
	jc LB_1359
	btr r12,2
	jmp LB_1360
LB_1359:
	bts r12,2
LB_1360:
	mov r9,rcx
	bt r12,6
	jc LB_1361
	btr r12,3
	jmp LB_1362
LB_1361:
	bts r12,3
LB_1362:
	call NS_E_1187
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1363
	btr r12,3
	jmp LB_1364
LB_1363:
	bts r12,3
LB_1364:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1355
	btr r12,2
	jmp LB_1356
LB_1355:
	bts r12,2
LB_1356:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1353
	btr r12,1
	jmp LB_1354
LB_1353:
	bts r12,1
LB_1354:
	add rsp,24
; _some %_1308 ⊢ %_1309 : %_1309
 ; {>  %_1308~3':_stg %_1303~2':_r64 %_1298~1':_r64 %_1307~0':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_1307 %_1309 }
 ; {>  %_1309~°0◂3':(_opn)◂(_stg) %_1303~2':_r64 %_1298~1':_r64 %_1307~0':_stg }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_1365
	mov rdi,r8
	call dlt
LB_1365:
	bt r12,1
	jc LB_1366
	mov rdi,r14
	call dlt
LB_1366:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1369
	btr r12,1
	jmp LB_1370
LB_1369:
	bts r12,1
LB_1370:
	mov rsi,1
	bt r12,1
	jc LB_1367
	mov rsi,0
	bt r14,0
	jc LB_1367
	jmp LB_1368
LB_1367:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1368:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1327:
LB_1372:
	cmp r15,0
	jz LB_1373
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1372
LB_1373:
; _none {  } ⊢ %_1310 : %_1310
 ; {>  %_1300~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1298~1':_r64 %_1297~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_1297 %_1310 }
 ; {>  %_1300~2':(_opn)◂({ _r64 (_lst)◂(_p667) }) %_1298~1':_r64 %_1310~°1◂{  }:(_opn)◂(t582'(0)) %_1297~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_1374
	mov rdi,r8
	call dlt
LB_1374:
	bt r12,1
	jc LB_1375
	mov rdi,r14
	call dlt
LB_1375:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_1376
	mov rsi,0
	bt r14,0
	jc LB_1376
	jmp LB_1377
LB_1376:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_1377:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_1371:
NS_E_1383:
NS_E_RDI_1383:
; » _^ ..
	mov rax,20
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "## FOI\n"
	mov rsi,0x_23
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_46
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_49
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "HELkP"
	mov rsi,0x_48
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_6b
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_50
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
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
; "eeb\n"
	mov rsi,0x_65
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_65
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_62
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov r13,rax
	btr r12,0
; _f1311 %_1378 ⊢ { %_1379 %_1380 } : { %_1379 %_1380 }
 ; {>  %_1378~0':_stg }
; _f1311 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1311
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_1379 %_1380 } ⊢ { %_1381 %_1382 } : { %_1381 %_1382 }
 ; {>  %_1379~0':_stg %_1380~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1384
	btr r12,2
	jmp LB_1385
LB_1384:
	bts r12,2
LB_1385:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1388
	btr r12,3
	jmp LB_1389
LB_1388:
	bts r12,3
LB_1389:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_1386
	btr QWORD [rdi],0
	jmp LB_1387
LB_1386:
	bts QWORD [rdi],0
LB_1387:
	mov r9,r14
	bt r12,1
	jc LB_1392
	btr r12,3
	jmp LB_1393
LB_1392:
	bts r12,3
LB_1393:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_1390
	btr QWORD [rdi],1
	jmp LB_1391
LB_1390:
	bts QWORD [rdi],1
LB_1391:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1394
	btr r12,2
	jmp LB_1395
LB_1394:
	bts r12,2
LB_1395:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1398
	btr r12,3
	jmp LB_1399
LB_1398:
	bts r12,3
LB_1399:
	mov r13,r9
	bt r12,3
	jc LB_1396
	btr r12,0
	jmp LB_1397
LB_1396:
	bts r12,0
LB_1397:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1402
	btr r12,3
	jmp LB_1403
LB_1402:
	bts r12,3
LB_1403:
	mov r14,r9
	bt r12,3
	jc LB_1400
	btr r12,1
	jmp LB_1401
LB_1400:
	bts r12,1
LB_1401:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1382~1':(_opn)◂(_stg) %_1381~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_1404
	mov rdi,r14
	call dlt
LB_1404:
	bt r12,0
	jc LB_1405
	mov rdi,r13
	call dlt
LB_1405:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1407:
NS_E_RDI_1407:
NS_E_1407_ETR_TBL:
NS_E_1407_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_1409_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1479
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1407_MTC_0_failed
LB_1479:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_1407_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1484
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1485
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1485:
	jmp NS_E_1407_MTC_0_failed
LB_1484:
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
	jc LB_1473
	btr QWORD [rdi],1
LB_1473:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1474
	btr QWORD [rdi],0
LB_1474:
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
NS_E_1407_MTC_0_failed:
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
NS_E_1407_MTC_1_failed:
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
NS_E_1409:
NS_E_RDI_1409:
NS_E_1409_ETR_TBL:
NS_E_1409_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1690
LB_1689:
	add r14,1
LB_1690:
	cmp r14,r10
	jge LB_1691
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1689
	cmp al,10
	jz LB_1689
	cmp al,32
	jz LB_1689
LB_1691:
	add r14,4
	cmp r14,r10
	jg LB_1694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1694
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1694
	jmp LB_1695
LB_1694:
	jmp NS_E_1409_MTC_0_failed
LB_1695:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1697
LB_1696:
	add r14,1
LB_1697:
	cmp r14,r10
	jge LB_1698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1696
	cmp al,10
	jz LB_1696
	cmp al,32
	jz LB_1696
LB_1698:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1699
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1700
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1700:
	jmp NS_E_1409_MTC_0_failed
LB_1699:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1703
LB_1702:
	add r14,1
LB_1703:
	cmp r14,r10
	jge LB_1704
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1702
	cmp al,10
	jz LB_1702
	cmp al,32
	jz LB_1702
LB_1704:
	add r14,1
	cmp r14,r10
	jg LB_1709
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1709
	jmp LB_1710
LB_1709:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1706
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1706:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1707
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1707:
	jmp NS_E_1409_MTC_0_failed
LB_1710:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1712
LB_1711:
	add r14,1
LB_1712:
	cmp r14,r10
	jge LB_1713
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1711
	cmp al,10
	jz LB_1711
	cmp al,32
	jz LB_1711
LB_1713:
	push r10
	call NS_E_1413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1714
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1715
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1715:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1716
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1716:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1717
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1717:
	jmp NS_E_1409_MTC_0_failed
LB_1714:
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
	jc LB_1684
	btr QWORD [rdi],3
LB_1684:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1685
	btr QWORD [rdi],2
LB_1685:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1686
	btr QWORD [rdi],1
LB_1686:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1687
	btr QWORD [rdi],0
LB_1687:
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
NS_E_1409_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
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
	add r14,4
	cmp r14,r10
	jg LB_1659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1659
	jmp LB_1660
LB_1659:
	jmp NS_E_1409_MTC_1_failed
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
	jmp NS_E_1409_MTC_1_failed
LB_1664:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
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
	call NS_E_1407_ETR_TBL
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
	jmp NS_E_1409_MTC_1_failed
LB_1670:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
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
	add r14,6
	cmp r14,r10
	jg LB_1682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1682
	jmp LB_1683
LB_1682:
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
	jmp NS_E_1409_MTC_1_failed
LB_1683:
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
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1409_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
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
	cmp al,167
	jnz LB_1624
	jmp LB_1625
LB_1624:
	jmp NS_E_1409_MTC_2_failed
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
	jmp NS_E_1409_MTC_2_failed
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
	jmp NS_E_1409_MTC_2_failed
LB_1640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
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
	call NS_E_1411_ETR_TBL
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
	jmp NS_E_1409_MTC_2_failed
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
	add rsp,64
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1409_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
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
	add r14,2
	cmp r14,r10
	jg LB_1589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1589
	jmp LB_1590
LB_1589:
	jmp NS_E_1409_MTC_3_failed
LB_1590:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1592
LB_1591:
	add r14,1
LB_1592:
	cmp r14,r10
	jge LB_1593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1591
	cmp al,10
	jz LB_1591
	cmp al,32
	jz LB_1591
LB_1593:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1594
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1595
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1595:
	jmp NS_E_1409_MTC_3_failed
LB_1594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_1598
LB_1597:
	add r14,1
LB_1598:
	cmp r14,r10
	jge LB_1599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1597
	cmp al,10
	jz LB_1597
	cmp al,32
	jz LB_1597
LB_1599:
	add r14,2
	cmp r14,r10
	jg LB_1604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1604
	jmp LB_1605
LB_1604:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1601
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1601:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1602:
	jmp NS_E_1409_MTC_3_failed
LB_1605:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_1607
LB_1606:
	add r14,1
LB_1607:
	cmp r14,r10
	jge LB_1608
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1606
	cmp al,10
	jz LB_1606
	cmp al,32
	jz LB_1606
LB_1608:
	push r10
	call NS_E_1419_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1609
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1610
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1610:
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
	jmp NS_E_1409_MTC_3_failed
LB_1609:
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
	jc LB_1579
	btr QWORD [rdi],3
LB_1579:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1580
	btr QWORD [rdi],2
LB_1580:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1581
	btr QWORD [rdi],1
LB_1581:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1582
	btr QWORD [rdi],0
LB_1582:
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
NS_E_1409_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1552
LB_1551:
	add r14,1
LB_1552:
	cmp r14,r10
	jge LB_1553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1551
	cmp al,10
	jz LB_1551
	cmp al,32
	jz LB_1551
LB_1553:
	add r14,2
	cmp r14,r10
	jg LB_1556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1556
	jmp LB_1557
LB_1556:
	jmp NS_E_1409_MTC_4_failed
LB_1557:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1559
LB_1558:
	add r14,1
LB_1559:
	cmp r14,r10
	jge LB_1560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1558
	cmp al,10
	jz LB_1558
	cmp al,32
	jz LB_1558
LB_1560:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1561
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1562
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1562:
	jmp NS_E_1409_MTC_4_failed
LB_1561:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_1565
LB_1564:
	add r14,1
LB_1565:
	cmp r14,r10
	jge LB_1566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1564
	cmp al,10
	jz LB_1564
	cmp al,32
	jz LB_1564
LB_1566:
	push r10
	call NS_E_1431_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1567
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1568
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1568:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1569
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1569:
	jmp NS_E_1409_MTC_4_failed
LB_1567:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_1572
LB_1571:
	add r14,1
LB_1572:
	cmp r14,r10
	jge LB_1573
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1571
	cmp al,10
	jz LB_1571
	cmp al,32
	jz LB_1571
LB_1573:
	push r10
	call NS_E_1419_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1574
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1575
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1575:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1576
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1576:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1577:
	jmp NS_E_1409_MTC_4_failed
LB_1574:
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
	jc LB_1546
	btr QWORD [rdi],3
LB_1546:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1547
	btr QWORD [rdi],2
LB_1547:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1548
	btr QWORD [rdi],1
LB_1548:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1549
	btr QWORD [rdi],0
LB_1549:
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
NS_E_1409_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_1517
LB_1516:
	add r14,1
LB_1517:
	cmp r14,r10
	jge LB_1518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1516
	cmp al,10
	jz LB_1516
	cmp al,32
	jz LB_1516
LB_1518:
	add r14,2
	cmp r14,r10
	jg LB_1521
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1521
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1521
	jmp LB_1522
LB_1521:
	jmp NS_E_1409_MTC_5_failed
LB_1522:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1524
LB_1523:
	add r14,1
LB_1524:
	cmp r14,r10
	jge LB_1525
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1523
	cmp al,10
	jz LB_1523
	cmp al,32
	jz LB_1523
LB_1525:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1526
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1527
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1527:
	jmp NS_E_1409_MTC_5_failed
LB_1526:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
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
	add r14,1
	cmp r14,r10
	jg LB_1536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1536
	jmp LB_1537
LB_1536:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1533
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1533:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1534
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1534:
	jmp NS_E_1409_MTC_5_failed
LB_1537:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1539
LB_1538:
	add r14,1
LB_1539:
	cmp r14,r10
	jge LB_1540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1538
	cmp al,10
	jz LB_1538
	cmp al,32
	jz LB_1538
LB_1540:
	push r10
	call NS_E_1413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1542
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1542:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1543
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1543:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1544
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1544:
	jmp NS_E_1409_MTC_5_failed
LB_1541:
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
	jc LB_1511
	btr QWORD [rdi],3
LB_1511:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1512
	btr QWORD [rdi],2
LB_1512:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1513
	btr QWORD [rdi],1
LB_1513:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1514
	btr QWORD [rdi],0
LB_1514:
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
NS_E_1409_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_1492
LB_1491:
	add r14,1
LB_1492:
	cmp r14,r10
	jge LB_1493
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1491
	cmp al,10
	jz LB_1491
	cmp al,32
	jz LB_1491
LB_1493:
	add r14,2
	cmp r14,r10
	jg LB_1496
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1496
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1496
	jmp LB_1497
LB_1496:
	jmp NS_E_1409_MTC_6_failed
LB_1497:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1499
LB_1498:
	add r14,1
LB_1499:
	cmp r14,r10
	jge LB_1500
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1498
	cmp al,10
	jz LB_1498
	cmp al,32
	jz LB_1498
LB_1500:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1501
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1502:
	jmp NS_E_1409_MTC_6_failed
LB_1501:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_1505
LB_1504:
	add r14,1
LB_1505:
	cmp r14,r10
	jge LB_1506
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1504
	cmp al,10
	jz LB_1504
	cmp al,32
	jz LB_1504
LB_1506:
	push r10
	call NS_E_1415_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1507
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1508
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1508:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1509
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1509:
	jmp NS_E_1409_MTC_6_failed
LB_1507:
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
	jc LB_1487
	btr QWORD [rdi],2
LB_1487:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1488
	btr QWORD [rdi],1
LB_1488:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1489
	btr QWORD [rdi],0
LB_1489:
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
NS_E_1409_MTC_6_failed:
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
NS_E_1411:
NS_E_RDI_1411:
NS_E_1411_ETR_TBL:
NS_E_1411_TBL:
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
	jz LB_1739
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1411_MTC_0_failed
LB_1739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1747
	jmp LB_1748
LB_1747:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1745
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1745:
	jmp NS_E_1411_MTC_0_failed
LB_1748:
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
	jc LB_1733
	btr QWORD [rdi],1
LB_1733:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1734
	btr QWORD [rdi],0
LB_1734:
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
NS_E_1411_MTC_0_failed:
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
	jz LB_1731
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1411_MTC_1_failed
LB_1731:
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
	jc LB_1726
	btr QWORD [rdi],0
LB_1726:
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
NS_E_1411_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1724
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1411_MTC_2_failed
LB_1724:
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
	jc LB_1719
	btr QWORD [rdi],0
LB_1719:
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
NS_E_1411_MTC_2_failed:
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
NS_E_1413:
NS_E_RDI_1413:
NS_E_1413_ETR_TBL:
NS_E_1413_TBL:
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
	jz LB_1794
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1413_MTC_0_failed
LB_1794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1802
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1802
	jmp LB_1803
LB_1802:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1800
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1800:
	jmp NS_E_1413_MTC_0_failed
LB_1803:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1807
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1808
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1808:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1809
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1809:
	jmp NS_E_1413_MTC_0_failed
LB_1807:
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
	jc LB_1787
	btr QWORD [rdi],2
LB_1787:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1788
	btr QWORD [rdi],1
LB_1788:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1789
	btr QWORD [rdi],0
LB_1789:
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
NS_E_1413_MTC_0_failed:
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
	jz LB_1770
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1413_MTC_1_failed
LB_1770:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1778
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1778
	jmp LB_1779
LB_1778:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1776
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1776:
	jmp NS_E_1413_MTC_1_failed
LB_1779:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1783
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1784
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1784:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1785
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1785:
	jmp NS_E_1413_MTC_1_failed
LB_1783:
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
	jc LB_1763
	btr QWORD [rdi],2
LB_1763:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1764
	btr QWORD [rdi],1
LB_1764:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1765
	btr QWORD [rdi],0
LB_1765:
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
NS_E_1413_MTC_1_failed:
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
	jz LB_1761
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1413_MTC_2_failed
LB_1761:
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
	jc LB_1756
	btr QWORD [rdi],0
LB_1756:
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
NS_E_1413_MTC_2_failed:
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
	jz LB_1754
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1413_MTC_3_failed
LB_1754:
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
	jc LB_1749
	btr QWORD [rdi],0
LB_1749:
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
NS_E_1413_MTC_3_failed:
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
NS_E_1415:
NS_E_RDI_1415:
NS_E_1415_ETR_TBL:
NS_E_1415_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_1823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1823
	jmp LB_1824
LB_1823:
	jmp NS_E_1415_MTC_0_failed
LB_1824:
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
	jz LB_1828
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1829:
	jmp NS_E_1415_MTC_0_failed
LB_1828:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_1838
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1838
	jmp LB_1839
LB_1838:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1835
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1835:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1836
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1836:
	jmp NS_E_1415_MTC_0_failed
LB_1839:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_1423_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1843
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1844
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1844:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1845
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1845:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1846
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1846:
	jmp NS_E_1415_MTC_0_failed
LB_1843:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_1417_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1851
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1852
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1852:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1853
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1853:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1854
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1854:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1855
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1855:
	jmp NS_E_1415_MTC_0_failed
LB_1851:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_1417_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1860
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1861
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1861:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1862
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1862:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1863
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1863:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1864
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1864:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1865
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1865:
	jmp NS_E_1415_MTC_0_failed
LB_1860:
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
	jc LB_1811
	btr QWORD [rdi],5
LB_1811:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1812
	btr QWORD [rdi],4
LB_1812:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1813
	btr QWORD [rdi],3
LB_1813:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1814
	btr QWORD [rdi],2
LB_1814:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1815
	btr QWORD [rdi],1
LB_1815:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1816
	btr QWORD [rdi],0
LB_1816:
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
NS_E_1415_MTC_0_failed:
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
NS_E_1417:
NS_E_RDI_1417:
NS_E_1417_ETR_TBL:
NS_E_1417_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_1875
LB_1874:
	add r14,1
LB_1875:
	cmp r14,r10
	jge LB_1876
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1874
	cmp al,10
	jz LB_1874
	cmp al,32
	jz LB_1874
LB_1876:
	add r14,3
	cmp r14,r10
	jg LB_1879
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1879
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1879
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1879
	jmp LB_1880
LB_1879:
	jmp NS_E_1417_MTC_0_failed
LB_1880:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1882
LB_1881:
	add r14,1
LB_1882:
	cmp r14,r10
	jge LB_1883
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1881
	cmp al,10
	jz LB_1881
	cmp al,32
	jz LB_1881
LB_1883:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1884
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1885:
	jmp NS_E_1417_MTC_0_failed
LB_1884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
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
	add r14,1
	cmp r14,r10
	jg LB_1894
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1894
	jmp LB_1895
LB_1894:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1891
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1891:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1892
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1892:
	jmp NS_E_1417_MTC_0_failed
LB_1895:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_1897
LB_1896:
	add r14,1
LB_1897:
	cmp r14,r10
	jge LB_1898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1896
	cmp al,10
	jz LB_1896
	cmp al,32
	jz LB_1896
LB_1898:
	push r10
	call NS_E_1423_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1899
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1900
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1900:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1901
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1901:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1902:
	jmp NS_E_1417_MTC_0_failed
LB_1899:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_1905
LB_1904:
	add r14,1
LB_1905:
	cmp r14,r10
	jge LB_1906
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1904
	cmp al,10
	jz LB_1904
	cmp al,32
	jz LB_1904
LB_1906:
	push r10
	call NS_E_1417_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1907
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1908
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1908:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1909
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1909:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1910
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1910:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1911
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1911:
	jmp NS_E_1417_MTC_0_failed
LB_1907:
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
	jc LB_1868
	btr QWORD [rdi],4
LB_1868:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1869
	btr QWORD [rdi],3
LB_1869:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1870
	btr QWORD [rdi],2
LB_1870:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1871
	btr QWORD [rdi],1
LB_1871:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1872
	btr QWORD [rdi],0
LB_1872:
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
NS_E_1417_MTC_0_failed:
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
NS_E_1417_MTC_1_failed:
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
NS_E_1419:
NS_E_RDI_1419:
NS_E_1419_ETR_TBL:
NS_E_1419_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_1980
LB_1979:
	add r14,1
LB_1980:
	cmp r14,r10
	jge LB_1981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1979
	cmp al,10
	jz LB_1979
	cmp al,32
	jz LB_1979
LB_1981:
	push r10
	call NS_E_1413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1982
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1419_MTC_0_failed
LB_1982:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
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
	call NS_E_1431_ETR_TBL
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
	jmp NS_E_1419_MTC_0_failed
LB_1987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
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
	add r14,3
	cmp r14,r10
	jg LB_1997
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1997
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1997
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
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
	jmp NS_E_1419_MTC_0_failed
LB_1998:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
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
	call NS_E_1431_ETR_TBL
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
	jmp NS_E_1419_MTC_0_failed
LB_2002:
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
	jc LB_1974
	btr QWORD [rdi],3
LB_1974:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1975
	btr QWORD [rdi],2
LB_1975:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1976
	btr QWORD [rdi],1
LB_1976:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1977
	btr QWORD [rdi],0
LB_1977:
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
NS_E_1419_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_1936
LB_1935:
	add r14,1
LB_1936:
	cmp r14,r10
	jge LB_1937
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1935
	cmp al,10
	jz LB_1935
	cmp al,32
	jz LB_1935
LB_1937:
	add r14,1
	cmp r14,r10
	jg LB_1940
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_1940
	jmp LB_1941
LB_1940:
	jmp NS_E_1419_MTC_1_failed
LB_1941:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
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
	call NS_E_1431_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1946
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1946:
	jmp NS_E_1419_MTC_1_failed
LB_1945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_1949
LB_1948:
	add r14,1
LB_1949:
	cmp r14,r10
	jge LB_1950
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1948
	cmp al,10
	jz LB_1948
	cmp al,32
	jz LB_1948
LB_1950:
	add r14,3
	cmp r14,r10
	jg LB_1955
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1955
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1955
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_1955
	jmp LB_1956
LB_1955:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1952
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1952:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1953
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1953:
	jmp NS_E_1419_MTC_1_failed
LB_1956:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_1958
LB_1957:
	add r14,1
LB_1958:
	cmp r14,r10
	jge LB_1959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1957
	cmp al,10
	jz LB_1957
	cmp al,32
	jz LB_1957
LB_1959:
	push r10
	call NS_E_1431_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1960
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1961
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1961:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1962
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1962:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1963
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1963:
	jmp NS_E_1419_MTC_1_failed
LB_1960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
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
	push r10
	call NS_E_1421_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1968
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1969
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1969:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1970
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1970:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1971
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1971:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1972:
	jmp NS_E_1419_MTC_1_failed
LB_1968:
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
	jc LB_1929
	btr QWORD [rdi],4
LB_1929:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1930
	btr QWORD [rdi],3
LB_1930:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1931
	btr QWORD [rdi],2
LB_1931:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1932
	btr QWORD [rdi],1
LB_1932:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1933
	btr QWORD [rdi],0
LB_1933:
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
NS_E_1419_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_1917
LB_1916:
	add r14,1
LB_1917:
	cmp r14,r10
	jge LB_1918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1916
	cmp al,10
	jz LB_1916
	cmp al,32
	jz LB_1916
LB_1918:
	add r14,3
	cmp r14,r10
	jg LB_1921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1921
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_1921
	jmp LB_1922
LB_1921:
	jmp NS_E_1419_MTC_2_failed
LB_1922:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1924
LB_1923:
	add r14,1
LB_1924:
	cmp r14,r10
	jge LB_1925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1923
	cmp al,10
	jz LB_1923
	cmp al,32
	jz LB_1923
LB_1925:
	push r10
	call NS_E_1431_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1926
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1927
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1927:
	jmp NS_E_1419_MTC_2_failed
LB_1926:
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
	jc LB_1913
	btr QWORD [rdi],1
LB_1913:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1914
	btr QWORD [rdi],0
LB_1914:
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
NS_E_1419_MTC_2_failed:
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
NS_E_1421:
NS_E_RDI_1421:
NS_E_1421_ETR_TBL:
NS_E_1421_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_2011
LB_2010:
	add r14,1
LB_2011:
	cmp r14,r10
	jge LB_2012
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2010
	cmp al,10
	jz LB_2010
	cmp al,32
	jz LB_2010
LB_2012:
	add r14,1
	cmp r14,r10
	jg LB_2015
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_2015
	jmp LB_2016
LB_2015:
	jmp NS_E_1421_MTC_0_failed
LB_2016:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_2018
LB_2017:
	add r14,1
LB_2018:
	cmp r14,r10
	jge LB_2019
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2017
	cmp al,10
	jz LB_2017
	cmp al,32
	jz LB_2017
LB_2019:
	push r10
	call NS_E_1431_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2020
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2021
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2021:
	jmp NS_E_1421_MTC_0_failed
LB_2020:
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
	jc LB_2007
	btr QWORD [rdi],1
LB_2007:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2008
	btr QWORD [rdi],0
LB_2008:
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
NS_E_1421_MTC_0_failed:
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
NS_E_1423:
NS_E_RDI_1423:
NS_E_1423_ETR_TBL:
NS_E_1423_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_1425_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2028
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1423_MTC_0_failed
LB_2028:
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
	jc LB_2023
	btr QWORD [rdi],0
LB_2023:
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
NS_E_1423_MTC_0_failed:
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
NS_E_1425:
NS_E_RDI_1425:
NS_E_1425_ETR_TBL:
NS_E_1425_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_2042
LB_2041:
	add r14,1
LB_2042:
	cmp r14,r10
	jge LB_2043
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2041
	cmp al,10
	jz LB_2041
	cmp al,32
	jz LB_2041
LB_2043:
	push r10
	call NS_E_1427_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2044
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1425_MTC_0_failed
LB_2044:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
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
	add r14,3
	cmp r14,r10
	jg LB_2052
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2052
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_2052
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_2052
	jmp LB_2053
LB_2052:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2050
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2050:
	jmp NS_E_1425_MTC_0_failed
LB_2053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_2055
LB_2054:
	add r14,1
LB_2055:
	cmp r14,r10
	jge LB_2056
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2054
	cmp al,10
	jz LB_2054
	cmp al,32
	jz LB_2054
LB_2056:
	push r10
	call NS_E_1425_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2057
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2058
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2058:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2059
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2059:
	jmp NS_E_1425_MTC_0_failed
LB_2057:
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
	jc LB_2037
	btr QWORD [rdi],2
LB_2037:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2038
	btr QWORD [rdi],1
LB_2038:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2039
	btr QWORD [rdi],0
LB_2039:
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
NS_E_1425_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_2033
LB_2032:
	add r14,1
LB_2033:
	cmp r14,r10
	jge LB_2034
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2032
	cmp al,10
	jz LB_2032
	cmp al,32
	jz LB_2032
LB_2034:
	push r10
	call NS_E_1427_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2035
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1425_MTC_1_failed
LB_2035:
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
	jc LB_2030
	btr QWORD [rdi],0
LB_2030:
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
NS_E_1425_MTC_1_failed:
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
NS_E_1427:
NS_E_RDI_1427:
NS_E_1427_ETR_TBL:
NS_E_1427_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_2073
LB_2072:
	add r14,1
LB_2073:
	cmp r14,r10
	jge LB_2074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2072
	cmp al,10
	jz LB_2072
	cmp al,32
	jz LB_2072
LB_2074:
	push r10
	call NS_E_1429_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2075
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1427_MTC_0_failed
LB_2075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
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
	add r14,3
	cmp r14,r10
	jg LB_2083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_2083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_2083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_2083
	jmp LB_2084
LB_2083:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2081:
	jmp NS_E_1427_MTC_0_failed
LB_2084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_2086
LB_2085:
	add r14,1
LB_2086:
	cmp r14,r10
	jge LB_2087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2085
	cmp al,10
	jz LB_2085
	cmp al,32
	jz LB_2085
LB_2087:
	push r10
	call NS_E_1429_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2088
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2089
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2089:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2090
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2090:
	jmp NS_E_1427_MTC_0_failed
LB_2088:
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
	jc LB_2068
	btr QWORD [rdi],2
LB_2068:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2069
	btr QWORD [rdi],1
LB_2069:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2070
	btr QWORD [rdi],0
LB_2070:
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
NS_E_1427_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_2064
LB_2063:
	add r14,1
LB_2064:
	cmp r14,r10
	jge LB_2065
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2063
	cmp al,10
	jz LB_2063
	cmp al,32
	jz LB_2063
LB_2065:
	push r10
	call NS_E_1429_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2066
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1427_MTC_1_failed
LB_2066:
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
	jc LB_2061
	btr QWORD [rdi],0
LB_2061:
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
NS_E_1427_MTC_1_failed:
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
NS_E_1429:
NS_E_RDI_1429:
NS_E_1429_ETR_TBL:
NS_E_1429_TBL:
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
	jz LB_2097
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1429_MTC_0_failed
LB_2097:
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
	jc LB_2092
	btr QWORD [rdi],0
LB_2092:
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
NS_E_1429_MTC_0_failed:
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
NS_E_1431:
NS_E_RDI_1431:
NS_E_1431_ETR_TBL:
NS_E_1431_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_2111
LB_2110:
	add r14,1
LB_2111:
	cmp r14,r10
	jge LB_2112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2110
	cmp al,10
	jz LB_2110
	cmp al,32
	jz LB_2110
LB_2112:
	add r14,1
	cmp r14,r10
	jg LB_2115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_2115
	jmp LB_2116
LB_2115:
	jmp NS_E_1431_MTC_0_failed
LB_2116:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_2118
LB_2117:
	add r14,1
LB_2118:
	cmp r14,r10
	jge LB_2119
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2117
	cmp al,10
	jz LB_2117
	cmp al,32
	jz LB_2117
LB_2119:
	push r10
	call NS_E_1433_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2120
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2121
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2121:
	jmp NS_E_1431_MTC_0_failed
LB_2120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_2124
LB_2123:
	add r14,1
LB_2124:
	cmp r14,r10
	jge LB_2125
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2123
	cmp al,10
	jz LB_2123
	cmp al,32
	jz LB_2123
LB_2125:
	add r14,1
	cmp r14,r10
	jg LB_2130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_2130
	jmp LB_2131
LB_2130:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2127
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2127:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2128
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2128:
	jmp NS_E_1431_MTC_0_failed
LB_2131:
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
	jc LB_2106
	btr QWORD [rdi],2
LB_2106:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2107
	btr QWORD [rdi],1
LB_2107:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2108
	btr QWORD [rdi],0
LB_2108:
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
NS_E_1431_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_2102
LB_2101:
	add r14,1
LB_2102:
	cmp r14,r10
	jge LB_2103
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2101
	cmp al,10
	jz LB_2101
	cmp al,32
	jz LB_2101
LB_2103:
	push r10
	call NS_E_1435_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2104
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1431_MTC_1_failed
LB_2104:
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
	jc LB_2099
	btr QWORD [rdi],0
LB_2099:
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
NS_E_1431_MTC_1_failed:
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
NS_E_1433:
NS_E_RDI_1433:
NS_E_1433_ETR_TBL:
NS_E_1433_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_2137
LB_2136:
	add r14,1
LB_2137:
	cmp r14,r10
	jge LB_2138
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2136
	cmp al,10
	jz LB_2136
	cmp al,32
	jz LB_2136
LB_2138:
	push r10
	call NS_E_1435_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2139
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1433_MTC_0_failed
LB_2139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_2142
LB_2141:
	add r14,1
LB_2142:
	cmp r14,r10
	jge LB_2143
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2141
	cmp al,10
	jz LB_2141
	cmp al,32
	jz LB_2141
LB_2143:
	push r10
	call NS_E_1433_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2144
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2145
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2145:
	jmp NS_E_1433_MTC_0_failed
LB_2144:
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
	jc LB_2133
	btr QWORD [rdi],1
LB_2133:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2134
	btr QWORD [rdi],0
LB_2134:
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
NS_E_1433_MTC_0_failed:
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
NS_E_1433_MTC_1_failed:
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
NS_E_1435:
NS_E_RDI_1435:
NS_E_1435_ETR_TBL:
NS_E_1435_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_2171
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_2171
	jmp LB_2172
LB_2171:
	jmp NS_E_1435_MTC_0_failed
LB_2172:
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
	jz LB_2176
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2177:
	jmp NS_E_1435_MTC_0_failed
LB_2176:
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
	jc LB_2163
	btr QWORD [rdi],1
LB_2163:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2164
	btr QWORD [rdi],0
LB_2164:
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
NS_E_1435_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_2159
LB_2158:
	add r14,1
LB_2159:
	cmp r14,r10
	jge LB_2160
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2158
	cmp al,10
	jz LB_2158
	cmp al,32
	jz LB_2158
LB_2160:
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2161
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1435_MTC_1_failed
LB_2161:
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
	jc LB_2156
	btr QWORD [rdi],0
LB_2156:
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
NS_E_1435_MTC_1_failed:
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
	jg LB_2154
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2154
	jmp LB_2155
LB_2154:
	jmp NS_E_1435_MTC_2_failed
LB_2155:
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
	jc LB_2147
	btr QWORD [rdi],0
LB_2147:
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
NS_E_1435_MTC_2_failed:
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
NS_E_2180:
NS_E_RDI_2180:
; 	» "a" _ ⊢ 0' : %_2179
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ {  }
 ; {>  %_2179~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_2181
	mov rdi,r13
	call dlt
LB_2181:
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
	NS_E_DYN_1187:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1187
	NS_E_DYN_1311:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1311
	CST_DYN_1383:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1436:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1437:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1407:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1407
	NS_E_DYN_1438:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1439:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1440:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1441:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1442:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_1443:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_1444:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_1409:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1409
	NS_E_DYN_1445:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1446:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1447:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1411:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1411
	NS_E_DYN_1448:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1449:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1450:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1451:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1413:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1413
	NS_E_DYN_1452:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1415:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1415
	NS_E_DYN_1453:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1454:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1417:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1417
	NS_E_DYN_1455:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1456:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1457:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1419:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1419
	NS_E_DYN_1458:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1421:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1421
	NS_E_DYN_1459:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1423:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1423
	NS_E_DYN_1460:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1461:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1425:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1425
	NS_E_DYN_1462:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1463:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1427:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1427
	NS_E_DYN_1464:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1429:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1429
	NS_E_DYN_1465:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1466:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1431:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1431
	NS_E_DYN_1467:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1468:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1433:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1433
	NS_E_DYN_1469:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1470:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1471:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1435:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1435
	CST_DYN_2180:
		dq 0x0000_0001_00_82_ffff
		dq 1
