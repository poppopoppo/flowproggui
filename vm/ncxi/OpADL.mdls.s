%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1023
	call NS_E_1835
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
NS_E_69:
; 	|» { 0' 1' }
NS_E_RDI_69:
MTC_LB_70:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_71
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_72
	bt QWORD [rax],0
	jc LB_73
	btr r12,1
	jmp LB_74
LB_73:
	bts r12,1
LB_74:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_72:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_77
	btr r12,4
	jmp LB_78
LB_77:
	bts r12,4
LB_78:
	mov r8,r10
	bt r12,4
	jc LB_75
	btr r12,2
	jmp LB_76
LB_75:
	bts r12,2
LB_76:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_81
	btr r12,4
	jmp LB_82
LB_81:
	bts r12,4
LB_82:
	mov r9,r10
	bt r12,4
	jc LB_79
	btr r12,3
	jmp LB_80
LB_79:
	bts r12,3
LB_80:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_83:
	cmp r15,0
	jz LB_84
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_83
LB_84:
; _f38 %_56 ⊢ %_60 : %_60
 ; {>  %_59~3':(_lst)◂(_r64) %_58~2':_r64 %_56~0':_r64 }
	add r13,1
; _f69 { %_60 %_59 } ⊢ { %_61 %_62 } : { %_61 %_62 }
 ; {>  %_60~0':_r64 %_59~3':(_lst)◂(_r64) %_58~2':_r64 }
; _f69 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_87
	btr r12,1
	jmp LB_88
LB_87:
	bts r12,1
LB_88:
	call NS_E_69
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_85
	btr r12,2
	jmp LB_86
LB_85:
	bts r12,2
LB_86:
	add rsp,16
; _f37 %_61 ⊢ %_63 : %_63
 ; {>  %_62~1':_stg %_58~2':_r64 %_61~0':_r64 }
	sub r13,1
; _f16 { %_62 %_63 %_58 } ⊢ { %_64 %_65 %_66 } : { %_64 %_65 %_66 }
 ; {>  %_62~1':_stg %_58~2':_r64 %_63~0':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_89
	btr r12,3
	jmp LB_90
LB_89:
	bts r12,3
LB_90:
	mov r14,r13
	bt r12,0
	jc LB_91
	btr r12,1
	jmp LB_92
LB_91:
	bts r12,1
LB_92:
	mov r13,r9
	bt r12,3
	jc LB_93
	btr r12,0
	jmp LB_94
LB_93:
	bts r12,0
LB_94:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_65 %_64 }
 ; {>  %_65~1':_r64 %_64~0':_stg %_66~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_95
	mov rdi,r8
	call dlt
LB_95:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_96
	btr r12,2
	jmp LB_97
LB_96:
	bts r12,2
LB_97:
	mov r14,r13
	bt r12,0
	jc LB_98
	btr r12,1
	jmp LB_99
LB_98:
	bts r12,1
LB_99:
	mov r13,r8
	bt r12,2
	jc LB_100
	btr r12,0
	jmp LB_101
LB_100:
	bts r12,0
LB_101:
	ret
MTC_LB_71:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_102
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_103
	bt QWORD [rax],0
	jc LB_104
	btr r12,1
	jmp LB_105
LB_104:
	bts r12,1
LB_105:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_103:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_106:
	cmp r15,0
	jz LB_107
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_106
LB_107:
; _f14 %_56 ⊢ { %_67 %_68 } : { %_67 %_68 }
 ; {>  %_56~0':_r64 }
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
; ∎ { %_67 %_68 }
 ; {>  %_68~1':_stg %_67~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_102:
NS_E_112:
; 	|» 0'
NS_E_RDI_112:
; » 0xr0 |~ {  } ⊢ %_109 : %_109
 ; {>  %_108~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_109
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f69 { %_109 %_108 } ⊢ { %_110 %_111 } : { %_110 %_111 }
 ; {>  %_108~0':(_lst)◂(_r64) %_109~1':_r64 }
; _f69 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_113
	btr r12,2
	jmp LB_114
LB_113:
	bts r12,2
LB_114:
	mov r14,r13
	bt r12,0
	jc LB_115
	btr r12,1
	jmp LB_116
LB_115:
	bts r12,1
LB_116:
	mov r13,r8
	bt r12,2
	jc LB_117
	btr r12,0
	jmp LB_118
LB_117:
	bts r12,0
LB_118:
	call NS_E_69
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_111
 ; {>  %_110~0':_r64 %_111~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_119
	mov rdi,r13
	call dlt
LB_119:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_120
	btr r12,0
	jmp LB_121
LB_120:
	bts r12,0
LB_121:
	ret
NS_E_122:
NS_E_RDI_122:
NS_E_122_ETR_TBL:
NS_E_122_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_162
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_162
	jmp LB_163
LB_162:
	jmp NS_E_122_MTC_0_failed
LB_163:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_167
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_168
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_168:
	jmp NS_E_122_MTC_0_failed
LB_167:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_155
	btr r12,1
	jmp LB_156
LB_155:
	bts r12,1
LB_156:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_153
	btr r12,0
	jmp LB_154
LB_153:
	bts r12,0
LB_154:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_150
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_170
	btr r12,2
	jmp LB_171
LB_170:
	bts r12,2
LB_171:
	mov r13,r14
	bt r12,1
	jc LB_172
	btr r12,0
	jmp LB_173
LB_172:
	bts r12,0
LB_173:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f112 %_125 ⊢ %_126 : %_126
 ; {>  %_125~0':(_lst)◂(_r64) }
; _f112 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_112
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_126 ⊢ %_127 : %_127
 ; {>  %_126~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_127
 ; {>  %_127~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_148
	btr r12,3
	jmp LB_149
LB_148:
	bts r12,3
LB_149:
	mov r8,0
	bts r12,2
	ret
LB_150:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_152
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_151
LB_152:
	add rsp,8
	ret
NS_E_122_MTC_0_failed:
	add rsp,32
	pop r14
LB_151:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_123:
NS_E_RDI_123:
NS_E_123_ETR_TBL:
NS_E_123_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_198
	jmp LB_199
LB_198:
	jmp NS_E_123_MTC_0_failed
LB_199:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_124_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_203
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_204
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_204:
	jmp NS_E_123_MTC_0_failed
LB_203:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_209
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_210
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_210:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_211:
	jmp NS_E_123_MTC_0_failed
LB_209:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_191
	btr r12,2
	jmp LB_192
LB_191:
	bts r12,2
LB_192:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_189
	btr r12,1
	jmp LB_190
LB_189:
	bts r12,1
LB_190:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_187
	btr r12,0
	jmp LB_188
LB_187:
	bts r12,0
LB_188:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_184
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_213
	btr r12,3
	jmp LB_214
LB_213:
	bts r12,3
LB_214:
	mov r14,r8
	bt r12,2
	jc LB_215
	btr r12,1
	jmp LB_216
LB_215:
	bts r12,1
LB_216:
	mov r8,r13
	bt r12,0
	jc LB_217
	btr r12,2
	jmp LB_218
LB_217:
	bts r12,2
LB_218:
	mov r13,r9
	bt r12,3
	jc LB_219
	btr r12,0
	jmp LB_220
LB_219:
	bts r12,0
LB_220:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_128 %_129 } ⊢ %_130 : %_130
 ; {>  %_128~0':_r64 %_129~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_130 ⊢ %_131 : %_131
 ; {>  %_130~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_131
 ; {>  %_131~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_178
	btr r12,2
	jmp LB_179
LB_178:
	bts r12,2
LB_179:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_176
	btr QWORD [rdi],0
	jmp LB_177
LB_176:
	bts QWORD [rdi],0
LB_177:
	mov r8,r14
	bt r12,1
	jc LB_182
	btr r12,2
	jmp LB_183
LB_182:
	bts r12,2
LB_183:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_180
	btr QWORD [rdi],1
	jmp LB_181
LB_180:
	bts QWORD [rdi],1
LB_181:
	mov rsi,1
	bt r12,3
	jc LB_174
	mov rsi,0
	bt r9,0
	jc LB_174
	jmp LB_175
LB_174:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_175:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_184:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_186
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_185
LB_186:
	add rsp,8
	ret
NS_E_123_MTC_0_failed:
	add rsp,48
	pop r14
LB_185:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_233
	jmp LB_234
LB_233:
	jmp NS_E_123_MTC_1_failed
LB_234:
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
	jc LB_226
	btr r12,0
	jmp LB_227
LB_226:
	bts r12,0
LB_227:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_223
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_132 : %_132
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_132 ⊢ %_133 : %_133
 ; {>  %_132~°1◂{  }:(_lst)◂(t59'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_133
 ; {>  %_133~°0◂°1◂{  }:(_opn)◂((_lst)◂(t62'(0))) }
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
	jc LB_221
	mov rsi,0
	bt r9,0
	jc LB_221
	jmp LB_222
LB_221:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_222:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_223:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_225
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_224
LB_225:
	add rsp,8
	ret
NS_E_123_MTC_1_failed:
	add rsp,16
	pop r14
LB_224:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_255
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_123_MTC_2_failed
LB_255:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_123_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_260
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_261
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_261:
	jmp NS_E_123_MTC_2_failed
LB_260:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_250
	btr r12,1
	jmp LB_251
LB_250:
	bts r12,1
LB_251:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_248
	btr r12,0
	jmp LB_249
LB_248:
	bts r12,0
LB_249:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_245
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_134 %_135 } ⊢ %_136 : %_136
 ; {>  %_134~0':_r64 %_135~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_136 ⊢ %_137 : %_137
 ; {>  %_136~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_137
 ; {>  %_137~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_239
	btr r12,2
	jmp LB_240
LB_239:
	bts r12,2
LB_240:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_237
	btr QWORD [rdi],0
	jmp LB_238
LB_237:
	bts QWORD [rdi],0
LB_238:
	mov r8,r14
	bt r12,1
	jc LB_243
	btr r12,2
	jmp LB_244
LB_243:
	bts r12,2
LB_244:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_241
	btr QWORD [rdi],1
	jmp LB_242
LB_241:
	bts QWORD [rdi],1
LB_242:
	mov rsi,1
	bt r12,3
	jc LB_235
	mov rsi,0
	bt r9,0
	jc LB_235
	jmp LB_236
LB_235:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_236:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_245:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_247
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_246
LB_247:
	add rsp,8
	ret
NS_E_123_MTC_2_failed:
	add rsp,32
	pop r14
LB_246:
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
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_275
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_275
	jmp LB_276
LB_275:
	jmp NS_E_124_MTC_0_failed
LB_276:
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
	jc LB_268
	btr r12,0
	jmp LB_269
LB_268:
	bts r12,0
LB_269:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_265
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_138 : %_138
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_138
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_138 ⊢ %_139 : %_139
 ; {>  %_138~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_139
 ; {>  %_139~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_263
	btr r12,3
	jmp LB_264
LB_263:
	bts r12,3
LB_264:
	mov r8,0
	bts r12,2
	ret
LB_265:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_267
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_266
LB_267:
	add rsp,8
	ret
NS_E_124_MTC_0_failed:
	add rsp,16
	pop r14
LB_266:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_289
	jmp LB_290
LB_289:
	jmp NS_E_124_MTC_1_failed
LB_290:
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
	jc LB_282
	btr r12,0
	jmp LB_283
LB_282:
	bts r12,0
LB_283:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_279
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_140 : %_140
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_140
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_140 ⊢ %_141 : %_141
 ; {>  %_140~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_141
 ; {>  %_141~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_277
	btr r12,3
	jmp LB_278
LB_277:
	bts r12,3
LB_278:
	mov r8,0
	bts r12,2
	ret
LB_279:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_281
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_280
LB_281:
	add rsp,8
	ret
NS_E_124_MTC_1_failed:
	add rsp,16
	pop r14
LB_280:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_303
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_303
	jmp LB_304
LB_303:
	jmp NS_E_124_MTC_2_failed
LB_304:
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
	jc LB_296
	btr r12,0
	jmp LB_297
LB_296:
	bts r12,0
LB_297:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_293
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_142 : %_142
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_142
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_142 ⊢ %_143 : %_143
 ; {>  %_142~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_143
 ; {>  %_143~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_291
	btr r12,3
	jmp LB_292
LB_291:
	bts r12,3
LB_292:
	mov r8,0
	bts r12,2
	ret
LB_293:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_295
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_294
LB_295:
	add rsp,8
	ret
NS_E_124_MTC_2_failed:
	add rsp,16
	pop r14
LB_294:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_317
	jmp LB_318
LB_317:
	jmp NS_E_124_MTC_3_failed
LB_318:
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
	jc LB_310
	btr r12,0
	jmp LB_311
LB_310:
	bts r12,0
LB_311:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_307
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_144 : %_144
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_144
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_144 ⊢ %_145 : %_145
 ; {>  %_144~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_145
 ; {>  %_145~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_305
	btr r12,3
	jmp LB_306
LB_305:
	bts r12,3
LB_306:
	mov r8,0
	bts r12,2
	ret
LB_307:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_309
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_308
LB_309:
	add rsp,8
	ret
NS_E_124_MTC_3_failed:
	add rsp,16
	pop r14
LB_308:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_331
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_331
	jmp LB_332
LB_331:
	jmp NS_E_124_MTC_4_failed
LB_332:
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
	jc LB_324
	btr r12,0
	jmp LB_325
LB_324:
	bts r12,0
LB_325:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_321
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_146 : %_146
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_146
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_146 ⊢ %_147 : %_147
 ; {>  %_146~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_147
 ; {>  %_147~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_319
	btr r12,3
	jmp LB_320
LB_319:
	bts r12,3
LB_320:
	mov r8,0
	bts r12,2
	ret
LB_321:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_323
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_322
LB_323:
	add rsp,8
	ret
NS_E_124_MTC_4_failed:
	add rsp,16
	pop r14
LB_322:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_333:
NS_E_RDI_333:
NS_E_333_ETR_TBL:
NS_E_333_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_369
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_333_MTC_0_failed
LB_369:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_364
	btr r12,0
	jmp LB_365
LB_364:
	bts r12,0
LB_365:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_361
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_335 : %_335
 ; {>  %_334~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_335
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_336 : %_336
 ; {>  %_335~1':_r64 %_334~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_336
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f32 { %_334 %_335 } ⊢ { %_337 %_338 %_339 } : { %_337 %_338 %_339 }
 ; {>  %_335~1':_r64 %_334~0':_r64 %_336~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_336 %_337 } ⊢ { %_340 %_341 %_342 } : { %_340 %_341 %_342 }
 ; {>  %_339~3':_r64 %_337~0':_r64 %_338~1':_r64 %_336~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_345:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_346
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_346
LB_347:
	cmp r15,0
	jz LB_348
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_347
LB_348:
; _some %_341 ⊢ %_343 : %_343
 ; {>  %_340~2':_r64 %_338~1':_r64 %_341~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_343
 ; {>  %_343~°0◂0':(_opn)◂(_r64) %_340~2':_r64 %_338~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_349
	mov rdi,r8
	call dlt
LB_349:
	bt r12,1
	jc LB_350
	mov rdi,r14
	call dlt
LB_350:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_351
	btr r12,3
	jmp LB_352
LB_351:
	bts r12,3
LB_352:
	mov r8,0
	bts r12,2
	ret
MTC_LB_346:
LB_354:
	cmp r15,0
	jz LB_355
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_354
LB_355:
; _none {  } ⊢ %_344 : %_344
 ; {>  %_340~2':_r64 %_339~3':_r64 %_338~1':_r64 %_341~0':_r64 %_342~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_344
 ; {>  %_344~°1◂{  }:(_opn)◂(t137'(0)) %_340~2':_r64 %_339~3':_r64 %_338~1':_r64 %_341~0':_r64 %_342~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_356
	mov rdi,r8
	call dlt
LB_356:
	bt r12,3
	jc LB_357
	mov rdi,r9
	call dlt
LB_357:
	bt r12,1
	jc LB_358
	mov rdi,r14
	call dlt
LB_358:
	bt r12,0
	jc LB_359
	mov rdi,r13
	call dlt
LB_359:
	bt r12,4
	jc LB_360
	mov rdi,r10
	call dlt
LB_360:
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
MTC_LB_353:
LB_361:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_363
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_362
LB_363:
	add rsp,8
	ret
NS_E_333_MTC_0_failed:
	add rsp,16
	pop r14
LB_362:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_371:
NS_E_RDI_371:
NS_E_371_ETR_TBL:
NS_E_371_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_407
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_371_MTC_0_failed
LB_407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_402
	btr r12,0
	jmp LB_403
LB_402:
	bts r12,0
LB_403:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_399
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_373 : %_373
 ; {>  %_372~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_373
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_374 : %_374
 ; {>  %_373~1':_r64 %_372~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_374
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f32 { %_372 %_373 } ⊢ { %_375 %_376 %_377 } : { %_375 %_376 %_377 }
 ; {>  %_374~2':_r64 %_373~1':_r64 %_372~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_374 %_375 } ⊢ { %_378 %_379 %_380 } : { %_378 %_379 %_380 }
 ; {>  %_377~3':_r64 %_375~0':_r64 %_376~1':_r64 %_374~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_383:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_384
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_384
LB_385:
	cmp r15,0
	jz LB_386
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_385
LB_386:
; _some %_379 ⊢ %_381 : %_381
 ; {>  %_378~2':_r64 %_379~0':_r64 %_376~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_381
 ; {>  %_378~2':_r64 %_376~1':_r64 %_381~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_387
	mov rdi,r8
	call dlt
LB_387:
	bt r12,1
	jc LB_388
	mov rdi,r14
	call dlt
LB_388:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_389
	btr r12,3
	jmp LB_390
LB_389:
	bts r12,3
LB_390:
	mov r8,0
	bts r12,2
	ret
MTC_LB_384:
LB_392:
	cmp r15,0
	jz LB_393
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_392
LB_393:
; _none {  } ⊢ %_382 : %_382
 ; {>  %_380~4':_r64 %_378~2':_r64 %_377~3':_r64 %_379~0':_r64 %_376~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_382
 ; {>  %_380~4':_r64 %_382~°1◂{  }:(_opn)◂(t164'(0)) %_378~2':_r64 %_377~3':_r64 %_379~0':_r64 %_376~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_394
	mov rdi,r10
	call dlt
LB_394:
	bt r12,2
	jc LB_395
	mov rdi,r8
	call dlt
LB_395:
	bt r12,3
	jc LB_396
	mov rdi,r9
	call dlt
LB_396:
	bt r12,0
	jc LB_397
	mov rdi,r13
	call dlt
LB_397:
	bt r12,1
	jc LB_398
	mov rdi,r14
	call dlt
LB_398:
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
MTC_LB_391:
LB_399:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_401
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_400
LB_401:
	add rsp,8
	ret
NS_E_371_MTC_0_failed:
	add rsp,16
	pop r14
LB_400:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_409:
NS_E_RDI_409:
NS_E_409_ETR_TBL:
NS_E_409_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_445
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_409_MTC_0_failed
LB_445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_440
	btr r12,0
	jmp LB_441
LB_440:
	bts r12,0
LB_441:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_437
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_411 : %_411
 ; {>  %_410~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_411
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_412 : %_412
 ; {>  %_411~1':_r64 %_410~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_412
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f32 { %_410 %_411 } ⊢ { %_413 %_414 %_415 } : { %_413 %_414 %_415 }
 ; {>  %_411~1':_r64 %_412~2':_r64 %_410~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_412 %_413 } ⊢ { %_416 %_417 %_418 } : { %_416 %_417 %_418 }
 ; {>  %_414~1':_r64 %_413~0':_r64 %_412~2':_r64 %_415~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_421:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_422
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_422
LB_423:
	cmp r15,0
	jz LB_424
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_423
LB_424:
; _some %_417 ⊢ %_419 : %_419
 ; {>  %_416~2':_r64 %_414~1':_r64 %_417~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_419
 ; {>  %_419~°0◂0':(_opn)◂(_r64) %_416~2':_r64 %_414~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_425
	mov rdi,r8
	call dlt
LB_425:
	bt r12,1
	jc LB_426
	mov rdi,r14
	call dlt
LB_426:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_427
	btr r12,3
	jmp LB_428
LB_427:
	bts r12,3
LB_428:
	mov r8,0
	bts r12,2
	ret
MTC_LB_422:
LB_430:
	cmp r15,0
	jz LB_431
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_430
LB_431:
; _none {  } ⊢ %_420 : %_420
 ; {>  %_416~2':_r64 %_414~1':_r64 %_415~3':_r64 %_417~0':_r64 %_418~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_420
 ; {>  %_420~°1◂{  }:(_opn)◂(t191'(0)) %_416~2':_r64 %_414~1':_r64 %_415~3':_r64 %_417~0':_r64 %_418~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_432
	mov rdi,r8
	call dlt
LB_432:
	bt r12,1
	jc LB_433
	mov rdi,r14
	call dlt
LB_433:
	bt r12,3
	jc LB_434
	mov rdi,r9
	call dlt
LB_434:
	bt r12,0
	jc LB_435
	mov rdi,r13
	call dlt
LB_435:
	bt r12,4
	jc LB_436
	mov rdi,r10
	call dlt
LB_436:
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
MTC_LB_429:
LB_437:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_439
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_438
LB_439:
	add rsp,8
	ret
NS_E_409_MTC_0_failed:
	add rsp,16
	pop r14
LB_438:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_447:
NS_E_RDI_447:
NS_E_447_ETR_TBL:
NS_E_447_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_409_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_462
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_447_MTC_0_failed
LB_462:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_457
	btr r12,0
	jmp LB_458
LB_457:
	bts r12,0
LB_458:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_454
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_448 ⊢ %_449 : %_449
 ; {>  %_448~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_449
 ; {>  %_449~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_452
	btr r12,3
	jmp LB_453
LB_452:
	bts r12,3
LB_453:
	mov r8,0
	bts r12,2
	ret
LB_454:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_456
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_455
LB_456:
	add rsp,8
	ret
NS_E_447_MTC_0_failed:
	add rsp,16
	pop r14
LB_455:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_371_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_447_MTC_1_failed
LB_474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_469
	btr r12,0
	jmp LB_470
LB_469:
	bts r12,0
LB_470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_466
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_450 ⊢ %_451 : %_451
 ; {>  %_450~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_451
 ; {>  %_451~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_464
	btr r12,3
	jmp LB_465
LB_464:
	bts r12,3
LB_465:
	mov r8,0
	bts r12,2
	ret
LB_466:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_468
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_467
LB_468:
	add rsp,8
	ret
NS_E_447_MTC_1_failed:
	add rsp,16
	pop r14
LB_467:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_476:
NS_E_RDI_476:
NS_E_476_ETR_TBL:
NS_E_476_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_447_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_524
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_476_MTC_0_failed
LB_524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_529
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_530:
	jmp NS_E_476_MTC_0_failed
LB_529:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_519
	btr r12,1
	jmp LB_520
LB_519:
	bts r12,1
LB_520:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_517
	btr r12,0
	jmp LB_518
LB_517:
	bts r12,0
LB_518:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_514
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_479 %_480 } ⊢ %_481 : %_481
 ; {>  %_480~1':(_lst)◂(_r64) %_479~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f112 %_481 ⊢ %_482 : %_482
 ; {>  %_481~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f112 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_500
	btr r12,2
	jmp LB_501
LB_500:
	bts r12,2
LB_501:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_506
	btr r12,3
	jmp LB_507
LB_506:
	bts r12,3
LB_507:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_504
	btr QWORD [rdi],0
	jmp LB_505
LB_504:
	bts QWORD [rdi],0
LB_505:
	mov r9,r14
	bt r12,1
	jc LB_510
	btr r12,3
	jmp LB_511
LB_510:
	bts r12,3
LB_511:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_508
	btr QWORD [rdi],1
	jmp LB_509
LB_508:
	bts QWORD [rdi],1
LB_509:
	mov rsi,1
	bt r12,0
	jc LB_502
	mov rsi,0
	bt r13,0
	jc LB_502
	jmp LB_503
LB_502:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_503:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_112
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_482 ⊢ %_483 : %_483
 ; {>  %_482~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_483
 ; {>  %_483~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_512
	btr r12,3
	jmp LB_513
LB_512:
	bts r12,3
LB_513:
	mov r8,0
	bts r12,2
	ret
LB_514:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_516
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_515
LB_516:
	add rsp,8
	ret
NS_E_476_MTC_0_failed:
	add rsp,32
	pop r14
LB_515:
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
; word_hd
	push r10
	call NS_E_478_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_552
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_477_MTC_0_failed
LB_552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_557
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_558
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_558:
	jmp NS_E_477_MTC_0_failed
LB_557:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_547
	btr r12,1
	jmp LB_548
LB_547:
	bts r12,1
LB_548:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_545
	btr r12,0
	jmp LB_546
LB_545:
	bts r12,0
LB_546:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_542
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_484 %_485 } ⊢ %_486 : %_486
 ; {>  %_484~0':_r64 %_485~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_486 ⊢ %_487 : %_487
 ; {>  %_486~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_487
 ; {>  %_487~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_536
	btr r12,2
	jmp LB_537
LB_536:
	bts r12,2
LB_537:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_534
	btr QWORD [rdi],0
	jmp LB_535
LB_534:
	bts QWORD [rdi],0
LB_535:
	mov r8,r14
	bt r12,1
	jc LB_540
	btr r12,2
	jmp LB_541
LB_540:
	bts r12,2
LB_541:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_538
	btr QWORD [rdi],1
	jmp LB_539
LB_538:
	bts QWORD [rdi],1
LB_539:
	mov rsi,1
	bt r12,3
	jc LB_532
	mov rsi,0
	bt r9,0
	jc LB_532
	jmp LB_533
LB_532:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_533:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_542:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_544
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_543
LB_544:
	add rsp,8
	ret
NS_E_477_MTC_0_failed:
	add rsp,32
	pop r14
LB_543:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_562
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_488 : %_488
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_488 ⊢ %_489 : %_489
 ; {>  %_488~°1◂{  }:(_lst)◂(t235'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_489
 ; {>  %_489~°0◂°1◂{  }:(_opn)◂((_lst)◂(t238'(0))) }
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
	jc LB_560
	mov rsi,0
	bt r9,0
	jc LB_560
	jmp LB_561
LB_560:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_561:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_562:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_564
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_563
LB_564:
	add rsp,8
	ret
NS_E_477_MTC_1_failed:
	add rsp,0
	pop r14
LB_563:
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
	sub rsp,16
; ch_a
	push r10
	call NS_E_447_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_575
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_478_MTC_0_failed
LB_575:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_570
	btr r12,0
	jmp LB_571
LB_570:
	bts r12,0
LB_571:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_567
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_490 ⊢ %_491 : %_491
 ; {>  %_490~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_491
 ; {>  %_491~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_565
	btr r12,3
	jmp LB_566
LB_565:
	bts r12,3
LB_566:
	mov r8,0
	bts r12,2
	ret
LB_567:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_569
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_568
LB_569:
	add rsp,8
	ret
NS_E_478_MTC_0_failed:
	add rsp,16
	pop r14
LB_568:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_594
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_478_MTC_1_failed
LB_594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_589
	btr r12,0
	jmp LB_590
LB_589:
	bts r12,0
LB_590:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_586
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_493
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f20 %_493 ⊢ %_494 : %_494
 ; {>  %_492~0':_r64 %_493~1':_stg }
; _f20 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_579
	btr r12,0
	jmp LB_580
LB_579:
	bts r12,0
LB_580:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_581
	btr r12,1
	jmp LB_582
LB_581:
	bts r12,1
LB_582:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_577
	btr r12,0
	jmp LB_578
LB_577:
	bts r12,0
LB_578:
	add rsp,16
; _some %_492 ⊢ %_495 : %_495
 ; {>  %_494~1':_stg %_492~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_495
 ; {>  %_494~1':_stg %_495~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_583
	mov rdi,r14
	call dlt
LB_583:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_584
	btr r12,3
	jmp LB_585
LB_584:
	bts r12,3
LB_585:
	mov r8,0
	bts r12,2
	ret
LB_586:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_588
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_587
LB_588:
	add rsp,8
	ret
NS_E_478_MTC_1_failed:
	add rsp,16
	pop r14
LB_587:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_609
	jmp LB_610
LB_609:
	jmp NS_E_478_MTC_2_failed
LB_610:
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
	jc LB_602
	btr r12,0
	jmp LB_603
LB_602:
	bts r12,0
LB_603:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_599
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_496
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f20 %_496 ⊢ %_497 : %_497
 ; {>  %_496~0':_stg }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr5f |~ {  } ⊢ %_498 : %_498
 ; {>  %_497~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_498
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_498 ⊢ %_499 : %_499
 ; {>  %_497~0':_stg %_498~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_499
 ; {>  %_497~0':_stg %_499~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_596
	mov rdi,r13
	call dlt
LB_596:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_597
	btr r12,3
	jmp LB_598
LB_597:
	bts r12,3
LB_598:
	mov r8,0
	bts r12,2
	ret
LB_599:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_601
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_600
LB_601:
	add rsp,8
	ret
NS_E_478_MTC_2_failed:
	add rsp,16
	pop r14
LB_600:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_611:
NS_E_RDI_611:
NS_E_611_ETR_TBL:
NS_E_611_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_631
	jmp LB_632
LB_631:
	jmp NS_E_611_MTC_0_failed
LB_632:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_477_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_636
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_637
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_637:
	jmp NS_E_611_MTC_0_failed
LB_636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_624
	btr r12,1
	jmp LB_625
LB_624:
	bts r12,1
LB_625:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_622
	btr r12,0
	jmp LB_623
LB_622:
	bts r12,0
LB_623:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_619
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_639
	btr r12,2
	jmp LB_640
LB_639:
	bts r12,2
LB_640:
	mov r13,r14
	bt r12,1
	jc LB_641
	btr r12,0
	jmp LB_642
LB_641:
	bts r12,0
LB_642:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f112 %_612 ⊢ %_613 : %_613
 ; {>  %_612~0':(_lst)◂(_r64) }
; _f112 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_112
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_613 ⊢ %_614 : %_614
 ; {>  %_613~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_614
 ; {>  %_614~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_617
	btr r12,3
	jmp LB_618
LB_617:
	bts r12,3
LB_618:
	mov r8,0
	bts r12,2
	ret
LB_619:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_621
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_620
LB_621:
	add rsp,8
	ret
NS_E_611_MTC_0_failed:
	add rsp,32
	pop r14
LB_620:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_653
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_611_MTC_1_failed
LB_653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_648
	btr r12,0
	jmp LB_649
LB_648:
	bts r12,0
LB_649:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_645
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_615 ⊢ %_616 : %_616
 ; {>  %_615~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_616
 ; {>  %_616~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_643
	btr r12,3
	jmp LB_644
LB_643:
	bts r12,3
LB_644:
	mov r8,0
	bts r12,2
	ret
LB_645:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_647
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_646
LB_647:
	add rsp,8
	ret
NS_E_611_MTC_1_failed:
	add rsp,16
	pop r14
LB_646:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_656:
NS_E_RDI_656:
NS_E_656_ETR_TBL:
NS_E_656_TBL:
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
LB_664:
	jmp LB_661
LB_660:
	add r14,1
LB_661:
	cmp r14,r10
	jge LB_662
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_660
	cmp al,10
	jz LB_660
	cmp al,32
	jz LB_660
LB_662:
	push r10
	push rsi
	call NS_E_476_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_663
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_665
	bts QWORD [rax],0
LB_665:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_664
LB_663:
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
	jc LB_658
	btr QWORD [rdi],0
LB_658:
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
NS_E_656_MTC_0_failed:
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
NS_E_669:
NS_E_RDI_669:
NS_E_669_ETR_TBL:
NS_E_669_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_756
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_756
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_756
	jmp LB_757
LB_756:
	jmp NS_E_669_MTC_0_failed
LB_757:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_761
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_762
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_762:
	jmp NS_E_669_MTC_0_failed
LB_761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_669_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_767
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_768
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_768:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_769
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_769:
	jmp NS_E_669_MTC_0_failed
LB_767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_749
	btr r12,2
	jmp LB_750
LB_749:
	bts r12,2
LB_750:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_747
	btr r12,1
	jmp LB_748
LB_747:
	bts r12,1
LB_748:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_745
	btr r12,0
	jmp LB_746
LB_745:
	bts r12,0
LB_746:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_742
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_771
	btr r12,3
	jmp LB_772
LB_771:
	bts r12,3
LB_772:
	mov r14,r8
	bt r12,2
	jc LB_773
	btr r12,1
	jmp LB_774
LB_773:
	bts r12,1
LB_774:
	mov r8,r13
	bt r12,0
	jc LB_775
	btr r12,2
	jmp LB_776
LB_775:
	bts r12,2
LB_776:
	mov r13,r9
	bt r12,3
	jc LB_777
	btr r12,0
	jmp LB_778
LB_777:
	bts r12,0
LB_778:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_674 : %_674
 ; {>  %_672~0':_r64 %_673~1':(_lst)◂(_p666) }
; 	» 0xr2 _ ⊢ 2' : %_674
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_674 %_672 } ⊢ { %_675 %_676 } : { %_675 %_676 }
 ; {>  %_672~0':_r64 %_674~2':_r64 %_673~1':(_lst)◂(_p666) }
	add r8,r13
; _f667 %_675 ⊢ %_677 : %_677
 ; {>  %_675~2':_r64 %_673~1':(_lst)◂(_p666) %_676~0':_r64 }
; _f667 2' ⊢ °0◂2'
; _cns { %_677 %_673 } ⊢ %_678 : %_678
 ; {>  %_673~1':(_lst)◂(_p666) %_676~0':_r64 %_677~°0◂2':_p666 }
; _cns { °0◂2' 1' } ⊢ °0◂{ °0◂2' 1' }
; _some %_678 ⊢ %_679 : %_679
 ; {>  %_678~°0◂{ °0◂2' 1' }:(_lst)◂(_p666) %_676~0':_r64 }
; _some °0◂{ °0◂2' 1' } ⊢ °0◂°0◂{ °0◂2' 1' }
; ∎ %_679
 ; {>  %_679~°0◂°0◂{ °0◂2' 1' }:(_opn)◂((_lst)◂(_p666)) %_676~0':_r64 }
; 	∎ °0◂°0◂{ °0◂2' 1' }
	bt r12,0
	jc LB_729
	mov rdi,r13
	call dlt
LB_729:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °0◂2' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_736
	btr r12,0
	jmp LB_737
LB_736:
	bts r12,0
LB_737:
	mov rsi,1
	bt r12,0
	jc LB_734
	mov rsi,0
	bt r13,0
	jc LB_734
	jmp LB_735
LB_734:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_735:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_732
	btr QWORD [rdi],0
	jmp LB_733
LB_732:
	bts QWORD [rdi],0
LB_733:
	mov r13,r14
	bt r12,1
	jc LB_740
	btr r12,0
	jmp LB_741
LB_740:
	bts r12,0
LB_741:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_738
	btr QWORD [rdi],1
	jmp LB_739
LB_738:
	bts QWORD [rdi],1
LB_739:
	mov rsi,1
	bt r12,3
	jc LB_730
	mov rsi,0
	bt r9,0
	jc LB_730
	jmp LB_731
LB_730:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_731:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_742:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_744
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_743
LB_744:
	add rsp,8
	ret
NS_E_669_MTC_0_failed:
	add rsp,48
	pop r14
LB_743:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_806
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_806
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_806
	jmp LB_807
LB_806:
	jmp NS_E_669_MTC_1_failed
LB_807:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_671_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_811
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_812
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_812:
	jmp NS_E_669_MTC_1_failed
LB_811:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_669_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_817
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_818
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_818:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_819
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_819:
	jmp NS_E_669_MTC_1_failed
LB_817:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_799
	btr r12,2
	jmp LB_800
LB_799:
	bts r12,2
LB_800:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_797
	btr r12,1
	jmp LB_798
LB_797:
	bts r12,1
LB_798:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_795
	btr r12,0
	jmp LB_796
LB_795:
	bts r12,0
LB_796:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_792
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_821
	btr r12,3
	jmp LB_822
LB_821:
	bts r12,3
LB_822:
	mov r14,r8
	bt r12,2
	jc LB_823
	btr r12,1
	jmp LB_824
LB_823:
	bts r12,1
LB_824:
	mov r8,r13
	bt r12,0
	jc LB_825
	btr r12,2
	jmp LB_826
LB_825:
	bts r12,2
LB_826:
	mov r13,r9
	bt r12,3
	jc LB_827
	btr r12,0
	jmp LB_828
LB_827:
	bts r12,0
LB_828:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_682 : %_682
 ; {>  %_681~1':(_lst)◂(_p666) %_680~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_682
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_682 %_680 } ⊢ { %_683 %_684 } : { %_683 %_684 }
 ; {>  %_681~1':(_lst)◂(_p666) %_682~2':_r64 %_680~0':_r64 }
	add r8,r13
; _f667 %_683 ⊢ %_685 : %_685
 ; {>  %_681~1':(_lst)◂(_p666) %_684~0':_r64 %_683~2':_r64 }
; _f667 2' ⊢ °0◂2'
; _cns { %_685 %_681 } ⊢ %_686 : %_686
 ; {>  %_681~1':(_lst)◂(_p666) %_684~0':_r64 %_685~°0◂2':_p666 }
; _cns { °0◂2' 1' } ⊢ °0◂{ °0◂2' 1' }
; _some %_686 ⊢ %_687 : %_687
 ; {>  %_684~0':_r64 %_686~°0◂{ °0◂2' 1' }:(_lst)◂(_p666) }
; _some °0◂{ °0◂2' 1' } ⊢ °0◂°0◂{ °0◂2' 1' }
; ∎ %_687
 ; {>  %_684~0':_r64 %_687~°0◂°0◂{ °0◂2' 1' }:(_opn)◂((_lst)◂(_p666)) }
; 	∎ °0◂°0◂{ °0◂2' 1' }
	bt r12,0
	jc LB_779
	mov rdi,r13
	call dlt
LB_779:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °0◂2' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_786
	btr r12,0
	jmp LB_787
LB_786:
	bts r12,0
LB_787:
	mov rsi,1
	bt r12,0
	jc LB_784
	mov rsi,0
	bt r13,0
	jc LB_784
	jmp LB_785
LB_784:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_785:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_782
	btr QWORD [rdi],0
	jmp LB_783
LB_782:
	bts QWORD [rdi],0
LB_783:
	mov r13,r14
	bt r12,1
	jc LB_790
	btr r12,0
	jmp LB_791
LB_790:
	bts r12,0
LB_791:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_788
	btr QWORD [rdi],1
	jmp LB_789
LB_788:
	bts QWORD [rdi],1
LB_789:
	mov rsi,1
	bt r12,3
	jc LB_780
	mov rsi,0
	bt r9,0
	jc LB_780
	jmp LB_781
LB_780:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_781:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_792:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_794
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_793
LB_794:
	add rsp,8
	ret
NS_E_669_MTC_1_failed:
	add rsp,48
	pop r14
LB_793:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_891
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_669_MTC_2_failed
LB_891:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_669_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_896
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_897
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_897:
	jmp NS_E_669_MTC_2_failed
LB_896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_886
	btr r12,1
	jmp LB_887
LB_886:
	bts r12,1
LB_887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_884
	btr r12,0
	jmp LB_885
LB_884:
	bts r12,0
LB_885:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_881
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
MTC_LB_829:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_830
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_831
	bt QWORD [rax],0
	jc LB_832
	btr r12,1
	jmp LB_833
LB_832:
	bts r12,1
LB_833:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_831:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_836
	btr r12,4
	jmp LB_837
LB_836:
	bts r12,4
LB_837:
	mov r8,r10
	bt r12,4
	jc LB_834
	btr r12,2
	jmp LB_835
LB_834:
	bts r12,2
LB_835:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_840
	btr r12,4
	jmp LB_841
LB_840:
	bts r12,4
LB_841:
	mov r9,r10
	bt r12,4
	jc LB_838
	btr r12,3
	jmp LB_839
LB_838:
	bts r12,3
LB_839:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_830
; _emt_mov_ptn_to_ptn:{| 11110.. |},2' ⊢ °1◂4'
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_842
	bt QWORD [rax],0
	jc LB_843
	btr r12,2
	jmp LB_844
LB_843:
	bts r12,2
LB_844:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_842:
	push r8
	mov r8,rax
	mov r10,r8
	bt r12,2
	jc LB_845
	btr r12,4
	jmp LB_846
LB_845:
	bts r12,4
LB_846:
	pop r8
LB_847:
	cmp r15,0
	jz LB_848
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_847
LB_848:
; » 0xr1 |~ {  } ⊢ %_693 : %_693
 ; {>  %_691~3':(_lst)◂(_p666) %_692~4':_r64 %_688~0':_r64 }
; 	» 0xr1 _ ⊢ 1' : %_693
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; _f33 { %_692 %_693 } ⊢ { %_694 %_695 } : { %_694 %_695 }
 ; {>  %_691~3':(_lst)◂(_p666) %_692~4':_r64 %_688~0':_r64 %_693~1':_r64 }
	add r10,r14
; _f668 %_694 ⊢ %_696 : %_696
 ; {>  %_691~3':(_lst)◂(_p666) %_694~4':_r64 %_695~1':_r64 %_688~0':_r64 }
; _f668 4' ⊢ °1◂4'
; _cns { %_696 %_691 } ⊢ %_697 : %_697
 ; {>  %_691~3':(_lst)◂(_p666) %_695~1':_r64 %_696~°1◂4':_p666 %_688~0':_r64 }
; _cns { °1◂4' 3' } ⊢ °0◂{ °1◂4' 3' }
; _some %_697 ⊢ %_698 : %_698
 ; {>  %_695~1':_r64 %_688~0':_r64 %_697~°0◂{ °1◂4' 3' }:(_lst)◂(_p666) }
; _some °0◂{ °1◂4' 3' } ⊢ °0◂°0◂{ °1◂4' 3' }
; ∎ %_698
 ; {>  %_698~°0◂°0◂{ °1◂4' 3' }:(_opn)◂((_lst)◂(_p666)) %_695~1':_r64 %_688~0':_r64 }
; 	∎ °0◂°0◂{ °1◂4' 3' }
	bt r12,1
	jc LB_849
	mov rdi,r14
	call dlt
LB_849:
	bt r12,0
	jc LB_850
	mov rdi,r13
	call dlt
LB_850:
; _emt_mov_ptn_to_ptn:{| 000110.. |},°0◂°0◂{ °1◂4' 3' } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_851
	btr r12,0
	jmp LB_852
LB_851:
	bts r12,0
LB_852:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r10
	bt r12,4
	jc LB_859
	btr r12,1
	jmp LB_860
LB_859:
	bts r12,1
LB_860:
	mov rsi,1
	bt r12,1
	jc LB_857
	mov rsi,0
	bt r14,0
	jc LB_857
	jmp LB_858
LB_857:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_858:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_855
	btr QWORD [rdi],0
	jmp LB_856
LB_855:
	bts QWORD [rdi],0
LB_856:
	mov r14,r13
	bt r12,0
	jc LB_863
	btr r12,1
	jmp LB_864
LB_863:
	bts r12,1
LB_864:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_861
	btr QWORD [rdi],1
	jmp LB_862
LB_861:
	bts QWORD [rdi],1
LB_862:
	mov rsi,1
	bt r12,3
	jc LB_853
	mov rsi,0
	bt r9,0
	jc LB_853
	jmp LB_854
LB_853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_854:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_830:
LB_866:
	cmp r15,0
	jz LB_867
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_866
LB_867:
; » 0xr1 |~ {  } ⊢ %_699 : %_699
 ; {>  %_689~1':(_lst)◂(_p666) %_688~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_699
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f668 %_699 ⊢ %_700 : %_700
 ; {>  %_689~1':(_lst)◂(_p666) %_688~0':_r64 %_699~2':_r64 }
; _f668 2' ⊢ °1◂2'
; _cns { %_700 %_689 } ⊢ %_701 : %_701
 ; {>  %_700~°1◂2':_p666 %_689~1':(_lst)◂(_p666) %_688~0':_r64 }
; _cns { °1◂2' 1' } ⊢ °0◂{ °1◂2' 1' }
; _some %_701 ⊢ %_702 : %_702
 ; {>  %_701~°0◂{ °1◂2' 1' }:(_lst)◂(_p666) %_688~0':_r64 }
; _some °0◂{ °1◂2' 1' } ⊢ °0◂°0◂{ °1◂2' 1' }
; ∎ %_702
 ; {>  %_688~0':_r64 %_702~°0◂°0◂{ °1◂2' 1' }:(_opn)◂((_lst)◂(_p666)) }
; 	∎ °0◂°0◂{ °1◂2' 1' }
	bt r12,0
	jc LB_868
	mov rdi,r13
	call dlt
LB_868:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂2' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_875
	btr r12,0
	jmp LB_876
LB_875:
	bts r12,0
LB_876:
	mov rsi,1
	bt r12,0
	jc LB_873
	mov rsi,0
	bt r13,0
	jc LB_873
	jmp LB_874
LB_873:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_874:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_871
	btr QWORD [rdi],0
	jmp LB_872
LB_871:
	bts QWORD [rdi],0
LB_872:
	mov r13,r14
	bt r12,1
	jc LB_879
	btr r12,0
	jmp LB_880
LB_879:
	bts r12,0
LB_880:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_877
	btr QWORD [rdi],1
	jmp LB_878
LB_877:
	bts QWORD [rdi],1
LB_878:
	mov rsi,1
	bt r12,3
	jc LB_869
	mov rsi,0
	bt r9,0
	jc LB_869
	jmp LB_870
LB_869:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_870:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_865:
LB_881:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_883
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_882
LB_883:
	add rsp,8
	ret
NS_E_669_MTC_2_failed:
	add rsp,32
	pop r14
LB_882:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_901
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_703 : %_703
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_703 ⊢ %_704 : %_704
 ; {>  %_703~°1◂{  }:(_lst)◂(t354'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_704
 ; {>  %_704~°0◂°1◂{  }:(_opn)◂((_lst)◂(t357'(0))) }
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
	jc LB_899
	mov rsi,0
	bt r9,0
	jc LB_899
	jmp LB_900
LB_899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_900:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
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
NS_E_669_MTC_3_failed:
	add rsp,0
	pop r14
LB_902:
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
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_916
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_916
	jmp LB_917
LB_916:
	jmp NS_E_670_MTC_0_failed
LB_917:
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
	jc LB_909
	btr r12,0
	jmp LB_910
LB_909:
	bts r12,0
LB_910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_906
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_705 : %_705
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_705
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_705 ⊢ %_706 : %_706
 ; {>  %_705~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_706
 ; {>  %_706~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_904
	btr r12,3
	jmp LB_905
LB_904:
	bts r12,3
LB_905:
	mov r8,0
	bts r12,2
	ret
LB_906:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_908
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_907
LB_908:
	add rsp,8
	ret
NS_E_670_MTC_0_failed:
	add rsp,16
	pop r14
LB_907:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_936
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_936
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_936
	jmp LB_937
LB_936:
	jmp NS_E_670_MTC_1_failed
LB_937:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_942:
	jmp NS_E_670_MTC_1_failed
LB_941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_947
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_949:
	jmp NS_E_670_MTC_1_failed
LB_947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_929
	btr r12,2
	jmp LB_930
LB_929:
	bts r12,2
LB_930:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_927
	btr r12,1
	jmp LB_928
LB_927:
	bts r12,1
LB_928:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_925
	btr r12,0
	jmp LB_926
LB_925:
	bts r12,0
LB_926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_922
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_951
	btr r12,3
	jmp LB_952
LB_951:
	bts r12,3
LB_952:
	mov r14,r8
	bt r12,2
	jc LB_953
	btr r12,1
	jmp LB_954
LB_953:
	bts r12,1
LB_954:
	mov r8,r13
	bt r12,0
	jc LB_955
	btr r12,2
	jmp LB_956
LB_955:
	bts r12,2
LB_956:
	mov r13,r9
	bt r12,3
	jc LB_957
	btr r12,0
	jmp LB_958
LB_957:
	bts r12,0
LB_958:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_709 : %_709
 ; {>  %_708~1':_r64 %_707~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_709
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_709 %_707 } ⊢ { %_710 %_711 } : { %_710 %_711 }
 ; {>  %_709~2':_r64 %_708~1':_r64 %_707~0':_r64 }
	add r8,r13
; _f33 { %_710 %_708 } ⊢ { %_712 %_713 } : { %_712 %_713 }
 ; {>  %_710~2':_r64 %_711~0':_r64 %_708~1':_r64 }
	add r8,r14
; _some %_712 ⊢ %_714 : %_714
 ; {>  %_713~1':_r64 %_711~0':_r64 %_712~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_714
 ; {>  %_713~1':_r64 %_711~0':_r64 %_714~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_918
	mov rdi,r14
	call dlt
LB_918:
	bt r12,0
	jc LB_919
	mov rdi,r13
	call dlt
LB_919:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
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
NS_E_670_MTC_1_failed:
	add rsp,48
	pop r14
LB_923:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_973
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_670_MTC_2_failed
LB_973:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_978
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_979
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_979:
	jmp NS_E_670_MTC_2_failed
LB_978:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_968
	btr r12,1
	jmp LB_969
LB_968:
	bts r12,1
LB_969:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_966
	btr r12,0
	jmp LB_967
LB_966:
	bts r12,0
LB_967:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_963
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_717 : %_717
 ; {>  %_715~0':_r64 %_716~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_717
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_717 %_716 } ⊢ { %_718 %_719 } : { %_718 %_719 }
 ; {>  %_715~0':_r64 %_717~2':_r64 %_716~1':_r64 }
	add r8,r14
; _some %_718 ⊢ %_720 : %_720
 ; {>  %_718~2':_r64 %_715~0':_r64 %_719~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_720
 ; {>  %_720~°0◂2':(_opn)◂(_r64) %_715~0':_r64 %_719~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_959
	mov rdi,r13
	call dlt
LB_959:
	bt r12,1
	jc LB_960
	mov rdi,r14
	call dlt
LB_960:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_961
	btr r12,3
	jmp LB_962
LB_961:
	bts r12,3
LB_962:
	mov r8,0
	bts r12,2
	ret
LB_963:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_965
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_964
LB_965:
	add rsp,8
	ret
NS_E_670_MTC_2_failed:
	add rsp,32
	pop r14
LB_964:
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
	jmp NS_E_671_MTC_0_failed
LB_994:
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
	jc LB_986
	btr r12,0
	jmp LB_987
LB_986:
	bts r12,0
LB_987:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_983
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_721 : %_721
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_721
	mov rdi,0x1
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
	jc LB_981
	btr r12,3
	jmp LB_982
LB_981:
	bts r12,3
LB_982:
	mov r8,0
	bts r12,2
	ret
LB_983:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_985
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_984
LB_985:
	add rsp,8
	ret
NS_E_671_MTC_0_failed:
	add rsp,16
	pop r14
LB_984:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1009
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_671_MTC_1_failed
LB_1009:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_671_ETR_TBL
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
	jmp NS_E_671_MTC_1_failed
LB_1014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1004
	btr r12,1
	jmp LB_1005
LB_1004:
	bts r12,1
LB_1005:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1002
	btr r12,0
	jmp LB_1003
LB_1002:
	bts r12,0
LB_1003:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_999
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_725 : %_725
 ; {>  %_723~0':_r64 %_724~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_725
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_725 %_724 } ⊢ { %_726 %_727 } : { %_726 %_727 }
 ; {>  %_723~0':_r64 %_725~2':_r64 %_724~1':_r64 }
	add r8,r14
; _some %_726 ⊢ %_728 : %_728
 ; {>  %_723~0':_r64 %_727~1':_r64 %_726~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_728
 ; {>  %_723~0':_r64 %_728~°0◂2':(_opn)◂(_r64) %_727~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_995
	mov rdi,r13
	call dlt
LB_995:
	bt r12,1
	jc LB_996
	mov rdi,r14
	call dlt
LB_996:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_997
	btr r12,3
	jmp LB_998
LB_997:
	bts r12,3
LB_998:
	mov r8,0
	bts r12,2
	ret
LB_999:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1001
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1000
LB_1001:
	add rsp,8
	ret
NS_E_671_MTC_1_failed:
	add rsp,32
	pop r14
LB_1000:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1023:
NS_E_RDI_1023:
; » _^ ..
	mov rax,30
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "[# oije [# F  F #]\n"
	mov rsi,0x_20_65_6a_69_6f_20_23_5b
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20_46_20_20_46_20_23_5b
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_23
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; "hhFe E #] \n"
	mov rsi,0x_23_20_45_20_65_46_68_68
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_5d
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_1018 : %_1018
 ; {>  %_1017~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1018
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f669 { %_1017 %_1018 } ⊢ { %_1019 %_1020 %_1021 } : { %_1019 %_1020 %_1021 }
 ; {>  %_1017~0':_stg %_1018~1':_r64 }
; _f669 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_669
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1024
	btr r12,4
	jmp LB_1025
LB_1024:
	bts r12,4
LB_1025:
	mov r8,r9
	bt r12,3
	jc LB_1028
	btr r12,2
	jmp LB_1029
LB_1028:
	bts r12,2
LB_1029:
	mov rsi,1
	bt r12,2
	jc LB_1026
	mov rsi,0
	bt r8,0
	jc LB_1026
	jmp LB_1027
LB_1026:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_1027:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_1019 %_1020 %_1021 } ⊢ %_1022 : %_1022
 ; {>  %_1019~0':_stg %_1021~2':(_opn)◂((_lst)◂(_p666)) %_1020~1':_r64 }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_1030
	btr r12,3
	jmp LB_1031
LB_1030:
	bts r12,3
LB_1031:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_1034
	btr r12,4
	jmp LB_1035
LB_1034:
	bts r12,4
LB_1035:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1032
	btr QWORD [rdi],0
	jmp LB_1033
LB_1032:
	bts QWORD [rdi],0
LB_1033:
	mov r10,r14
	bt r12,1
	jc LB_1038
	btr r12,4
	jmp LB_1039
LB_1038:
	bts r12,4
LB_1039:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1036
	btr QWORD [rdi],1
	jmp LB_1037
LB_1036:
	bts QWORD [rdi],1
LB_1037:
	mov r10,r8
	bt r12,2
	jc LB_1042
	btr r12,4
	jmp LB_1043
LB_1042:
	bts r12,4
LB_1043:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_1040
	btr QWORD [rdi],2
	jmp LB_1041
LB_1040:
	bts QWORD [rdi],2
LB_1041:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_1044
	btr r12,3
	jmp LB_1045
LB_1044:
	bts r12,3
LB_1045:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1048
	btr r12,4
	jmp LB_1049
LB_1048:
	bts r12,4
LB_1049:
	mov r13,r10
	bt r12,4
	jc LB_1046
	btr r12,0
	jmp LB_1047
LB_1046:
	bts r12,0
LB_1047:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1052
	btr r12,4
	jmp LB_1053
LB_1052:
	bts r12,4
LB_1053:
	mov r14,r10
	bt r12,4
	jc LB_1050
	btr r12,1
	jmp LB_1051
LB_1050:
	bts r12,1
LB_1051:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_1056
	btr r12,4
	jmp LB_1057
LB_1056:
	bts r12,4
LB_1057:
	mov r8,r10
	bt r12,4
	jc LB_1054
	btr r12,2
	jmp LB_1055
LB_1054:
	bts r12,2
LB_1055:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_1022~{ 0' 1' 2' }:{ _stg _r64 (_opn)◂((_lst)◂(_p666)) } }
; 	∎ {  }
	bt r12,0
	jc LB_1058
	mov rdi,r13
	call dlt
LB_1058:
	bt r12,1
	jc LB_1059
	mov rdi,r14
	call dlt
LB_1059:
	bt r12,2
	jc LB_1060
	mov rdi,r8
	call dlt
LB_1060:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1062:
NS_E_RDI_1062:
NS_E_1062_ETR_TBL:
NS_E_1062_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_1064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1134
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1062_MTC_0_failed
LB_1134:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_1062_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1139
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1140:
	jmp NS_E_1062_MTC_0_failed
LB_1139:
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
	jc LB_1128
	btr QWORD [rdi],1
LB_1128:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1129
	btr QWORD [rdi],0
LB_1129:
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
NS_E_1062_MTC_0_failed:
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
NS_E_1062_MTC_1_failed:
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
NS_E_1064:
NS_E_RDI_1064:
NS_E_1064_ETR_TBL:
NS_E_1064_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1345
LB_1344:
	add r14,1
LB_1345:
	cmp r14,r10
	jge LB_1346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1344
	cmp al,10
	jz LB_1344
	cmp al,32
	jz LB_1344
LB_1346:
	add r14,4
	cmp r14,r10
	jg LB_1349
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1349
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1349
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1349
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1349
	jmp LB_1350
LB_1349:
	jmp NS_E_1064_MTC_0_failed
LB_1350:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1352
LB_1351:
	add r14,1
LB_1352:
	cmp r14,r10
	jge LB_1353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1351
	cmp al,10
	jz LB_1351
	cmp al,32
	jz LB_1351
LB_1353:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1354
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1355
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1355:
	jmp NS_E_1064_MTC_0_failed
LB_1354:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1358
LB_1357:
	add r14,1
LB_1358:
	cmp r14,r10
	jge LB_1359
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1357
	cmp al,10
	jz LB_1357
	cmp al,32
	jz LB_1357
LB_1359:
	add r14,1
	cmp r14,r10
	jg LB_1364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1364
	jmp LB_1365
LB_1364:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1361
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1361:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1362:
	jmp NS_E_1064_MTC_0_failed
LB_1365:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1367
LB_1366:
	add r14,1
LB_1367:
	cmp r14,r10
	jge LB_1368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1366
	cmp al,10
	jz LB_1366
	cmp al,32
	jz LB_1366
LB_1368:
	push r10
	call NS_E_1068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1369
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1370
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1370:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1371
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1371:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1372
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1372:
	jmp NS_E_1064_MTC_0_failed
LB_1369:
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
	jc LB_1339
	btr QWORD [rdi],3
LB_1339:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1340
	btr QWORD [rdi],2
LB_1340:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1341
	btr QWORD [rdi],1
LB_1341:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1342
	btr QWORD [rdi],0
LB_1342:
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
NS_E_1064_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_1310
LB_1309:
	add r14,1
LB_1310:
	cmp r14,r10
	jge LB_1311
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1309
	cmp al,10
	jz LB_1309
	cmp al,32
	jz LB_1309
LB_1311:
	add r14,4
	cmp r14,r10
	jg LB_1314
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_1314
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_1314
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_1314
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_1314
	jmp LB_1315
LB_1314:
	jmp NS_E_1064_MTC_1_failed
LB_1315:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1317
LB_1316:
	add r14,1
LB_1317:
	cmp r14,r10
	jge LB_1318
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1316
	cmp al,10
	jz LB_1316
	cmp al,32
	jz LB_1316
LB_1318:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1319
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1320
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1320:
	jmp NS_E_1064_MTC_1_failed
LB_1319:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_1323
LB_1322:
	add r14,1
LB_1323:
	cmp r14,r10
	jge LB_1324
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1322
	cmp al,10
	jz LB_1322
	cmp al,32
	jz LB_1322
LB_1324:
	push r10
	call NS_E_1062_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1325
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1326
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1326:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1327
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1327:
	jmp NS_E_1064_MTC_1_failed
LB_1325:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_1330
LB_1329:
	add r14,1
LB_1330:
	cmp r14,r10
	jge LB_1331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1329
	cmp al,10
	jz LB_1329
	cmp al,32
	jz LB_1329
LB_1331:
	add r14,6
	cmp r14,r10
	jg LB_1337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_1337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_1337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_1337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_1337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_1337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_1337
	jmp LB_1338
LB_1337:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1333
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1333:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1334
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1335:
	jmp NS_E_1064_MTC_1_failed
LB_1338:
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
	jc LB_1304
	btr QWORD [rdi],3
LB_1304:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1305
	btr QWORD [rdi],2
LB_1305:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1306
	btr QWORD [rdi],1
LB_1306:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1307
	btr QWORD [rdi],0
LB_1307:
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
NS_E_1064_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1275
LB_1274:
	add r14,1
LB_1275:
	cmp r14,r10
	jge LB_1276
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1274
	cmp al,10
	jz LB_1274
	cmp al,32
	jz LB_1274
LB_1276:
	add r14,2
	cmp r14,r10
	jg LB_1279
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1279
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1279
	jmp LB_1280
LB_1279:
	jmp NS_E_1064_MTC_2_failed
LB_1280:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1282
LB_1281:
	add r14,1
LB_1282:
	cmp r14,r10
	jge LB_1283
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1281
	cmp al,10
	jz LB_1281
	cmp al,32
	jz LB_1281
LB_1283:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1284
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1285
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1285:
	jmp NS_E_1064_MTC_2_failed
LB_1284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1288
LB_1287:
	add r14,1
LB_1288:
	cmp r14,r10
	jge LB_1289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1287
	cmp al,10
	jz LB_1287
	cmp al,32
	jz LB_1287
LB_1289:
	add r14,1
	cmp r14,r10
	jg LB_1294
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1294
	jmp LB_1295
LB_1294:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1291
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1291:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1292
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1292:
	jmp NS_E_1064_MTC_2_failed
LB_1295:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_1297
LB_1296:
	add r14,1
LB_1297:
	cmp r14,r10
	jge LB_1298
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1296
	cmp al,10
	jz LB_1296
	cmp al,32
	jz LB_1296
LB_1298:
	push r10
	call NS_E_1066_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1299
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1300
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1300:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1301
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1301:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1302
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1302:
	jmp NS_E_1064_MTC_2_failed
LB_1299:
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
	jc LB_1269
	btr QWORD [rdi],3
LB_1269:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1270
	btr QWORD [rdi],2
LB_1270:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1271
	btr QWORD [rdi],1
LB_1271:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1272
	btr QWORD [rdi],0
LB_1272:
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
NS_E_1064_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1240
LB_1239:
	add r14,1
LB_1240:
	cmp r14,r10
	jge LB_1241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1239
	cmp al,10
	jz LB_1239
	cmp al,32
	jz LB_1239
LB_1241:
	add r14,2
	cmp r14,r10
	jg LB_1244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1244
	jmp LB_1245
LB_1244:
	jmp NS_E_1064_MTC_3_failed
LB_1245:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1247
LB_1246:
	add r14,1
LB_1247:
	cmp r14,r10
	jge LB_1248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1246
	cmp al,10
	jz LB_1246
	cmp al,32
	jz LB_1246
LB_1248:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1249
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1250
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1250:
	jmp NS_E_1064_MTC_3_failed
LB_1249:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_1253
LB_1252:
	add r14,1
LB_1253:
	cmp r14,r10
	jge LB_1254
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1252
	cmp al,10
	jz LB_1252
	cmp al,32
	jz LB_1252
LB_1254:
	add r14,2
	cmp r14,r10
	jg LB_1259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_1259
	jmp LB_1260
LB_1259:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1256
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1256:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1257
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1257:
	jmp NS_E_1064_MTC_3_failed
LB_1260:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_1262
LB_1261:
	add r14,1
LB_1262:
	cmp r14,r10
	jge LB_1263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1261
	cmp al,10
	jz LB_1261
	cmp al,32
	jz LB_1261
LB_1263:
	push r10
	call NS_E_1074_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1264
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1265
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1265:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1266
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1266:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1267
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1267:
	jmp NS_E_1064_MTC_3_failed
LB_1264:
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
	jc LB_1234
	btr QWORD [rdi],3
LB_1234:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1235
	btr QWORD [rdi],2
LB_1235:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1236
	btr QWORD [rdi],1
LB_1236:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1237
	btr QWORD [rdi],0
LB_1237:
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
NS_E_1064_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_1207
LB_1206:
	add r14,1
LB_1207:
	cmp r14,r10
	jge LB_1208
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1206
	cmp al,10
	jz LB_1206
	cmp al,32
	jz LB_1206
LB_1208:
	add r14,2
	cmp r14,r10
	jg LB_1211
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1211
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_1211
	jmp LB_1212
LB_1211:
	jmp NS_E_1064_MTC_4_failed
LB_1212:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1214
LB_1213:
	add r14,1
LB_1214:
	cmp r14,r10
	jge LB_1215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1213
	cmp al,10
	jz LB_1213
	cmp al,32
	jz LB_1213
LB_1215:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1216
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1217
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1217:
	jmp NS_E_1064_MTC_4_failed
LB_1216:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_1220
LB_1219:
	add r14,1
LB_1220:
	cmp r14,r10
	jge LB_1221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1219
	cmp al,10
	jz LB_1219
	cmp al,32
	jz LB_1219
LB_1221:
	push r10
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1222
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1223
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1223:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1224:
	jmp NS_E_1064_MTC_4_failed
LB_1222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_1227
LB_1226:
	add r14,1
LB_1227:
	cmp r14,r10
	jge LB_1228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1226
	cmp al,10
	jz LB_1226
	cmp al,32
	jz LB_1226
LB_1228:
	push r10
	call NS_E_1074_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1229
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1230
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1230:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1231
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1231:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1232
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1232:
	jmp NS_E_1064_MTC_4_failed
LB_1229:
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
	jc LB_1201
	btr QWORD [rdi],3
LB_1201:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1202
	btr QWORD [rdi],2
LB_1202:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1203
	btr QWORD [rdi],1
LB_1203:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1204
	btr QWORD [rdi],0
LB_1204:
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
NS_E_1064_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_1172
LB_1171:
	add r14,1
LB_1172:
	cmp r14,r10
	jge LB_1173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1171
	cmp al,10
	jz LB_1171
	cmp al,32
	jz LB_1171
LB_1173:
	add r14,2
	cmp r14,r10
	jg LB_1176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1176
	jmp LB_1177
LB_1176:
	jmp NS_E_1064_MTC_5_failed
LB_1177:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1179
LB_1178:
	add r14,1
LB_1179:
	cmp r14,r10
	jge LB_1180
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1178
	cmp al,10
	jz LB_1178
	cmp al,32
	jz LB_1178
LB_1180:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1181
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1182
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1182:
	jmp NS_E_1064_MTC_5_failed
LB_1181:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_1185
LB_1184:
	add r14,1
LB_1185:
	cmp r14,r10
	jge LB_1186
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1184
	cmp al,10
	jz LB_1184
	cmp al,32
	jz LB_1184
LB_1186:
	add r14,1
	cmp r14,r10
	jg LB_1191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_1191
	jmp LB_1192
LB_1191:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1188
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1188:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1189
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1189:
	jmp NS_E_1064_MTC_5_failed
LB_1192:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_1194
LB_1193:
	add r14,1
LB_1194:
	cmp r14,r10
	jge LB_1195
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1193
	cmp al,10
	jz LB_1193
	cmp al,32
	jz LB_1193
LB_1195:
	push r10
	call NS_E_1068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1196
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1197
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1197:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1198
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1198:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1199:
	jmp NS_E_1064_MTC_5_failed
LB_1196:
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
	jc LB_1166
	btr QWORD [rdi],3
LB_1166:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1167
	btr QWORD [rdi],2
LB_1167:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1168
	btr QWORD [rdi],1
LB_1168:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1169
	btr QWORD [rdi],0
LB_1169:
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
NS_E_1064_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_1147
LB_1146:
	add r14,1
LB_1147:
	cmp r14,r10
	jge LB_1148
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1146
	cmp al,10
	jz LB_1146
	cmp al,32
	jz LB_1146
LB_1148:
	add r14,2
	cmp r14,r10
	jg LB_1151
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_1151
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_1151
	jmp LB_1152
LB_1151:
	jmp NS_E_1064_MTC_6_failed
LB_1152:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1154
LB_1153:
	add r14,1
LB_1154:
	cmp r14,r10
	jge LB_1155
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1153
	cmp al,10
	jz LB_1153
	cmp al,32
	jz LB_1153
LB_1155:
	push r10
	call NS_E_476_ETR_TBL
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
	jmp NS_E_1064_MTC_6_failed
LB_1156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_1160
LB_1159:
	add r14,1
LB_1160:
	cmp r14,r10
	jge LB_1161
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1159
	cmp al,10
	jz LB_1159
	cmp al,32
	jz LB_1159
LB_1161:
	push r10
	call NS_E_1070_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1162
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1163
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1163:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1164
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1164:
	jmp NS_E_1064_MTC_6_failed
LB_1162:
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
	jc LB_1142
	btr QWORD [rdi],2
LB_1142:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1143
	btr QWORD [rdi],1
LB_1143:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1144
	btr QWORD [rdi],0
LB_1144:
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
NS_E_1064_MTC_6_failed:
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
NS_E_1066:
NS_E_RDI_1066:
NS_E_1066_ETR_TBL:
NS_E_1066_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_51_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1394
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1066_MTC_0_failed
LB_1394:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_1402
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_1402
	jmp LB_1403
LB_1402:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1400
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1400:
	jmp NS_E_1066_MTC_0_failed
LB_1403:
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
	jc LB_1388
	btr QWORD [rdi],1
LB_1388:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1389
	btr QWORD [rdi],0
LB_1389:
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
NS_E_1066_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1386
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1066_MTC_1_failed
LB_1386:
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
	jc LB_1381
	btr QWORD [rdi],0
LB_1381:
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
NS_E_1066_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_1068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1379
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1066_MTC_2_failed
LB_1379:
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
	jc LB_1374
	btr QWORD [rdi],0
LB_1374:
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
NS_E_1066_MTC_2_failed:
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
NS_E_1068:
NS_E_RDI_1068:
NS_E_1068_ETR_TBL:
NS_E_1068_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1449
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1068_MTC_0_failed
LB_1449:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1457
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1457
	jmp LB_1458
LB_1457:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1455:
	jmp NS_E_1068_MTC_0_failed
LB_1458:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1462
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1463
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1463:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1464
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1464:
	jmp NS_E_1068_MTC_0_failed
LB_1462:
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
	jc LB_1442
	btr QWORD [rdi],2
LB_1442:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1443
	btr QWORD [rdi],1
LB_1443:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1444
	btr QWORD [rdi],0
LB_1444:
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
NS_E_1068_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1425
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1068_MTC_1_failed
LB_1425:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_1433
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_1433
	jmp LB_1434
LB_1433:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1431
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1431:
	jmp NS_E_1068_MTC_1_failed
LB_1434:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_1068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1438
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1439
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1439:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1440
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1440:
	jmp NS_E_1068_MTC_1_failed
LB_1438:
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
	jc LB_1418
	btr QWORD [rdi],2
LB_1418:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1419
	btr QWORD [rdi],1
LB_1419:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1420
	btr QWORD [rdi],0
LB_1420:
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
NS_E_1068_MTC_1_failed:
	add rsp,48
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1416
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1068_MTC_2_failed
LB_1416:
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
	jc LB_1411
	btr QWORD [rdi],0
LB_1411:
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
NS_E_1068_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1409
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1068_MTC_3_failed
LB_1409:
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
	jc LB_1404
	btr QWORD [rdi],0
LB_1404:
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
NS_E_1068_MTC_3_failed:
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
NS_E_1070:
NS_E_RDI_1070:
NS_E_1070_ETR_TBL:
NS_E_1070_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_1478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1478
	jmp LB_1479
LB_1478:
	jmp NS_E_1070_MTC_0_failed
LB_1479:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1483
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1484
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1484:
	jmp NS_E_1070_MTC_0_failed
LB_1483:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_1493
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1493
	jmp LB_1494
LB_1493:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1490
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1490:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1491
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1491:
	jmp NS_E_1070_MTC_0_failed
LB_1494:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_1078_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1498
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1499
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1499:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1500
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1500:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1501
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1501:
	jmp NS_E_1070_MTC_0_failed
LB_1498:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_1072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1506
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1507
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1507:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1508
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1508:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1509
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1509:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1510
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1510:
	jmp NS_E_1070_MTC_0_failed
LB_1506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_1072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1515
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_1516
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_1516:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1517
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1517:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1518
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1518:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1519
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1519:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1520
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1520:
	jmp NS_E_1070_MTC_0_failed
LB_1515:
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
	jc LB_1466
	btr QWORD [rdi],5
LB_1466:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1467
	btr QWORD [rdi],4
LB_1467:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1468
	btr QWORD [rdi],3
LB_1468:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1469
	btr QWORD [rdi],2
LB_1469:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1470
	btr QWORD [rdi],1
LB_1470:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1471
	btr QWORD [rdi],0
LB_1471:
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
NS_E_1070_MTC_0_failed:
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
NS_E_1072:
NS_E_RDI_1072:
NS_E_1072_ETR_TBL:
NS_E_1072_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
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
	add r14,3
	cmp r14,r10
	jg LB_1534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_1534
	jmp LB_1535
LB_1534:
	jmp NS_E_1072_MTC_0_failed
LB_1535:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_1537
LB_1536:
	add r14,1
LB_1537:
	cmp r14,r10
	jge LB_1538
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1536
	cmp al,10
	jz LB_1536
	cmp al,32
	jz LB_1536
LB_1538:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1539
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1540
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1540:
	jmp NS_E_1072_MTC_0_failed
LB_1539:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
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
	add r14,1
	cmp r14,r10
	jg LB_1549
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_1549
	jmp LB_1550
LB_1549:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1546
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1546:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1547
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1547:
	jmp NS_E_1072_MTC_0_failed
LB_1550:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
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
	push r10
	call NS_E_1078_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1554
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1555
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1555:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1556
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1556:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1557
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1557:
	jmp NS_E_1072_MTC_0_failed
LB_1554:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_1560
LB_1559:
	add r14,1
LB_1560:
	cmp r14,r10
	jge LB_1561
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1559
	cmp al,10
	jz LB_1559
	cmp al,32
	jz LB_1559
LB_1561:
	push r10
	call NS_E_1072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1562
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1563
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1563:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1564
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1564:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1565
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1565:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1566
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1566:
	jmp NS_E_1072_MTC_0_failed
LB_1562:
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
	jc LB_1523
	btr QWORD [rdi],4
LB_1523:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1524
	btr QWORD [rdi],3
LB_1524:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1525
	btr QWORD [rdi],2
LB_1525:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1526
	btr QWORD [rdi],1
LB_1526:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1527
	btr QWORD [rdi],0
LB_1527:
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
NS_E_1072_MTC_0_failed:
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
NS_E_1072_MTC_1_failed:
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
NS_E_1074:
NS_E_RDI_1074:
NS_E_1074_ETR_TBL:
NS_E_1074_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_1635
LB_1634:
	add r14,1
LB_1635:
	cmp r14,r10
	jge LB_1636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1634
	cmp al,10
	jz LB_1634
	cmp al,32
	jz LB_1634
LB_1636:
	push r10
	call NS_E_1068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1637
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1074_MTC_0_failed
LB_1637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
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
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1643
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1643:
	jmp NS_E_1074_MTC_0_failed
LB_1642:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_1646
LB_1645:
	add r14,1
LB_1646:
	cmp r14,r10
	jge LB_1647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1645
	cmp al,10
	jz LB_1645
	cmp al,32
	jz LB_1645
LB_1647:
	add r14,3
	cmp r14,r10
	jg LB_1652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_1652
	jmp LB_1653
LB_1652:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1649
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1649:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1650:
	jmp NS_E_1074_MTC_0_failed
LB_1653:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
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
	push r10
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1657
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1658
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1658:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1659
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1659:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1660
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1660:
	jmp NS_E_1074_MTC_0_failed
LB_1657:
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
	jc LB_1629
	btr QWORD [rdi],3
LB_1629:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1630
	btr QWORD [rdi],2
LB_1630:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1631
	btr QWORD [rdi],1
LB_1631:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1632
	btr QWORD [rdi],0
LB_1632:
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
NS_E_1074_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
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
	jg LB_1595
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_1595
	jmp LB_1596
LB_1595:
	jmp NS_E_1074_MTC_1_failed
LB_1596:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
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
	push r10
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1600
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1601
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1601:
	jmp NS_E_1074_MTC_1_failed
LB_1600:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_1604
LB_1603:
	add r14,1
LB_1604:
	cmp r14,r10
	jge LB_1605
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1603
	cmp al,10
	jz LB_1603
	cmp al,32
	jz LB_1603
LB_1605:
	add r14,3
	cmp r14,r10
	jg LB_1610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_1610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_1610
	jmp LB_1611
LB_1610:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1607
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1607:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1608
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1608:
	jmp NS_E_1074_MTC_1_failed
LB_1611:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_1613
LB_1612:
	add r14,1
LB_1613:
	cmp r14,r10
	jge LB_1614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1612
	cmp al,10
	jz LB_1612
	cmp al,32
	jz LB_1612
LB_1614:
	push r10
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1615
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1616
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1616:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1617
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1617:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1618
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1618:
	jmp NS_E_1074_MTC_1_failed
LB_1615:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
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
	push r10
	call NS_E_1076_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1623
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1624
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1624:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1625
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1625:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1626
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1626:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1627
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1627:
	jmp NS_E_1074_MTC_1_failed
LB_1623:
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
	jc LB_1584
	btr QWORD [rdi],4
LB_1584:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1585
	btr QWORD [rdi],3
LB_1585:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1586
	btr QWORD [rdi],2
LB_1586:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1587
	btr QWORD [rdi],1
LB_1587:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1588
	btr QWORD [rdi],0
LB_1588:
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
NS_E_1074_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
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
	add r14,3
	cmp r14,r10
	jg LB_1576
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1576
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_1576
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_1576
	jmp LB_1577
LB_1576:
	jmp NS_E_1074_MTC_2_failed
LB_1577:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1579
LB_1578:
	add r14,1
LB_1579:
	cmp r14,r10
	jge LB_1580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1578
	cmp al,10
	jz LB_1578
	cmp al,32
	jz LB_1578
LB_1580:
	push r10
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1581
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1582:
	jmp NS_E_1074_MTC_2_failed
LB_1581:
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
	jc LB_1568
	btr QWORD [rdi],1
LB_1568:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1569
	btr QWORD [rdi],0
LB_1569:
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
NS_E_1074_MTC_2_failed:
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
NS_E_1076:
NS_E_RDI_1076:
NS_E_1076_ETR_TBL:
NS_E_1076_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_1666
LB_1665:
	add r14,1
LB_1666:
	cmp r14,r10
	jge LB_1667
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1665
	cmp al,10
	jz LB_1665
	cmp al,32
	jz LB_1665
LB_1667:
	add r14,1
	cmp r14,r10
	jg LB_1670
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_1670
	jmp LB_1671
LB_1670:
	jmp NS_E_1076_MTC_0_failed
LB_1671:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_1673
LB_1672:
	add r14,1
LB_1673:
	cmp r14,r10
	jge LB_1674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1672
	cmp al,10
	jz LB_1672
	cmp al,32
	jz LB_1672
LB_1674:
	push r10
	call NS_E_1086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1675
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1676
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1676:
	jmp NS_E_1076_MTC_0_failed
LB_1675:
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
	jc LB_1662
	btr QWORD [rdi],1
LB_1662:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1663
	btr QWORD [rdi],0
LB_1663:
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
NS_E_1076_MTC_0_failed:
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
NS_E_1078:
NS_E_RDI_1078:
NS_E_1078_ETR_TBL:
NS_E_1078_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_1080_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1683
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1078_MTC_0_failed
LB_1683:
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
	jc LB_1678
	btr QWORD [rdi],0
LB_1678:
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
NS_E_1078_MTC_0_failed:
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
NS_E_1080:
NS_E_RDI_1080:
NS_E_1080_ETR_TBL:
NS_E_1080_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
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
	call NS_E_1082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1699
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1080_MTC_0_failed
LB_1699:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_1702
LB_1701:
	add r14,1
LB_1702:
	cmp r14,r10
	jge LB_1703
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1701
	cmp al,10
	jz LB_1701
	cmp al,32
	jz LB_1701
LB_1703:
	add r14,3
	cmp r14,r10
	jg LB_1707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_1707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_1707
	jmp LB_1708
LB_1707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1705:
	jmp NS_E_1080_MTC_0_failed
LB_1708:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
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
	call NS_E_1080_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1712
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1713
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1713:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1714
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1714:
	jmp NS_E_1080_MTC_0_failed
LB_1712:
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
	jc LB_1692
	btr QWORD [rdi],2
LB_1692:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1693
	btr QWORD [rdi],1
LB_1693:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1694
	btr QWORD [rdi],0
LB_1694:
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
NS_E_1080_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
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
	push r10
	call NS_E_1082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1690
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1080_MTC_1_failed
LB_1690:
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
	jc LB_1685
	btr QWORD [rdi],0
LB_1685:
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
NS_E_1080_MTC_1_failed:
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
NS_E_1082:
NS_E_RDI_1082:
NS_E_1082_ETR_TBL:
NS_E_1082_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_1728
LB_1727:
	add r14,1
LB_1728:
	cmp r14,r10
	jge LB_1729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1727
	cmp al,10
	jz LB_1727
	cmp al,32
	jz LB_1727
LB_1729:
	push r10
	call NS_E_1084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1730
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1082_MTC_0_failed
LB_1730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
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
	add r14,3
	cmp r14,r10
	jg LB_1738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_1738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_1738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_1738
	jmp LB_1739
LB_1738:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1736
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1736:
	jmp NS_E_1082_MTC_0_failed
LB_1739:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_1741
LB_1740:
	add r14,1
LB_1741:
	cmp r14,r10
	jge LB_1742
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1740
	cmp al,10
	jz LB_1740
	cmp al,32
	jz LB_1740
LB_1742:
	push r10
	call NS_E_1084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1743
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1744
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1744:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1745
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1745:
	jmp NS_E_1082_MTC_0_failed
LB_1743:
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
	jc LB_1723
	btr QWORD [rdi],2
LB_1723:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1724
	btr QWORD [rdi],1
LB_1724:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1725
	btr QWORD [rdi],0
LB_1725:
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
NS_E_1082_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_1719
LB_1718:
	add r14,1
LB_1719:
	cmp r14,r10
	jge LB_1720
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1718
	cmp al,10
	jz LB_1718
	cmp al,32
	jz LB_1718
LB_1720:
	push r10
	call NS_E_1084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1721
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1082_MTC_1_failed
LB_1721:
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
	jc LB_1716
	btr QWORD [rdi],0
LB_1716:
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
NS_E_1082_MTC_1_failed:
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
NS_E_1084:
NS_E_RDI_1084:
NS_E_1084_ETR_TBL:
NS_E_1084_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1752
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1084_MTC_0_failed
LB_1752:
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
	jc LB_1747
	btr QWORD [rdi],0
LB_1747:
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
NS_E_1084_MTC_0_failed:
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
NS_E_1086:
NS_E_RDI_1086:
NS_E_1086_ETR_TBL:
NS_E_1086_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_1766
LB_1765:
	add r14,1
LB_1766:
	cmp r14,r10
	jge LB_1767
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1765
	cmp al,10
	jz LB_1765
	cmp al,32
	jz LB_1765
LB_1767:
	add r14,1
	cmp r14,r10
	jg LB_1770
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_1770
	jmp LB_1771
LB_1770:
	jmp NS_E_1086_MTC_0_failed
LB_1771:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_1773
LB_1772:
	add r14,1
LB_1773:
	cmp r14,r10
	jge LB_1774
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1772
	cmp al,10
	jz LB_1772
	cmp al,32
	jz LB_1772
LB_1774:
	push r10
	call NS_E_1088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1775
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1776
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1776:
	jmp NS_E_1086_MTC_0_failed
LB_1775:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_1779
LB_1778:
	add r14,1
LB_1779:
	cmp r14,r10
	jge LB_1780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1778
	cmp al,10
	jz LB_1778
	cmp al,32
	jz LB_1778
LB_1780:
	add r14,1
	cmp r14,r10
	jg LB_1785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_1785
	jmp LB_1786
LB_1785:
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
	jmp NS_E_1086_MTC_0_failed
LB_1786:
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
	jc LB_1761
	btr QWORD [rdi],2
LB_1761:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1762
	btr QWORD [rdi],1
LB_1762:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1763
	btr QWORD [rdi],0
LB_1763:
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
NS_E_1086_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_1757
LB_1756:
	add r14,1
LB_1757:
	cmp r14,r10
	jge LB_1758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1756
	cmp al,10
	jz LB_1756
	cmp al,32
	jz LB_1756
LB_1758:
	push r10
	call NS_E_1090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1759
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1086_MTC_1_failed
LB_1759:
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
	jc LB_1754
	btr QWORD [rdi],0
LB_1754:
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
NS_E_1086_MTC_1_failed:
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
NS_E_1088:
NS_E_RDI_1088:
NS_E_1088_ETR_TBL:
NS_E_1088_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_1792
LB_1791:
	add r14,1
LB_1792:
	cmp r14,r10
	jge LB_1793
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1791
	cmp al,10
	jz LB_1791
	cmp al,32
	jz LB_1791
LB_1793:
	push r10
	call NS_E_1090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1794
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1088_MTC_0_failed
LB_1794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
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
	call NS_E_1088_ETR_TBL
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
	jmp NS_E_1088_MTC_0_failed
LB_1799:
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
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1088_MTC_0_failed:
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
NS_E_1088_MTC_1_failed:
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
NS_E_1090:
NS_E_RDI_1090:
NS_E_1090_ETR_TBL:
NS_E_1090_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_1826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_1826
	jmp LB_1827
LB_1826:
	jmp NS_E_1090_MTC_0_failed
LB_1827:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1831
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1832
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1832:
	jmp NS_E_1090_MTC_0_failed
LB_1831:
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
	jc LB_1818
	btr QWORD [rdi],1
LB_1818:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1819
	btr QWORD [rdi],0
LB_1819:
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
NS_E_1090_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_1814
LB_1813:
	add r14,1
LB_1814:
	cmp r14,r10
	jge LB_1815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1813
	cmp al,10
	jz LB_1813
	cmp al,32
	jz LB_1813
LB_1815:
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1816
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_1090_MTC_1_failed
LB_1816:
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
	jc LB_1811
	btr QWORD [rdi],0
LB_1811:
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
NS_E_1090_MTC_1_failed:
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
	jg LB_1809
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_1809
	jmp LB_1810
LB_1809:
	jmp NS_E_1090_MTC_2_failed
LB_1810:
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
	jc LB_1802
	btr QWORD [rdi],0
LB_1802:
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
NS_E_1090_MTC_2_failed:
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
NS_E_1835:
NS_E_RDI_1835:
; 	» "a" _ ⊢ 0' : %_1834
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ {  }
 ; {>  %_1834~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_1836
	mov rdi,r13
	call dlt
LB_1836:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
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
	NS_E_DYN_69:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_69
	NS_E_DYN_112:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_112
	NS_E_DYN_122:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_122
	NS_E_DYN_123:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_123
	NS_E_DYN_124:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_124
	NS_E_DYN_333:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_333
	NS_E_DYN_371:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_371
	NS_E_DYN_409:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_409
	NS_E_DYN_447:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_447
	NS_E_DYN_476:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_476
	NS_E_DYN_477:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_477
	NS_E_DYN_478:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_478
	NS_E_DYN_611:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_611
	NS_E_DYN_657:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_656:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_656
	NS_E_DYN_667:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_668:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_669:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_669
	NS_E_DYN_670:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_670
	NS_E_DYN_671:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_671
	CST_DYN_1023:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1091:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1092:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1062:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1062
	NS_E_DYN_1093:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1094:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1095:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1096:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1097:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_1098:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_1099:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_1064:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1064
	NS_E_DYN_1100:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1101:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1102:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1066:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1066
	NS_E_DYN_1103:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1104:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1105:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1106:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1068:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1068
	NS_E_DYN_1107:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1070:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1070
	NS_E_DYN_1108:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1109:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1072:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1072
	NS_E_DYN_1110:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1111:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1112:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1074:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1074
	NS_E_DYN_1113:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1076:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1076
	NS_E_DYN_1114:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1078:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1078
	NS_E_DYN_1115:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1116:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1080:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1080
	NS_E_DYN_1117:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1118:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1082:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1082
	NS_E_DYN_1119:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1084:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1084
	NS_E_DYN_1120:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1121:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1086:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1086
	NS_E_DYN_1122:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1123:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1088:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1088
	NS_E_DYN_1124:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1125:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1126:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1090:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1090
	CST_DYN_1835:
		dq 0x0000_0001_00_82_ffff
		dq 1
