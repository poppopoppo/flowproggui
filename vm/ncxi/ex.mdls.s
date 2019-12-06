%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_206
	call NS_E_471
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
	push r14
	sub rsp,16
; _byt
	call NS_E_49_ETR_TBL
	cmp r8,0
	jz LB_158
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_122_MTC_0_failed
LB_158:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,16
	push rdi
	push rsi
	push LB_150
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_124 : %_124
 ; {>  %_123~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_124
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_125 : %_125
 ; {>  %_123~0':_r64 %_124~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_125
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f32 { %_123 %_124 } ⊢ { %_126 %_127 %_128 } : { %_126 %_127 %_128 }
 ; {>  %_125~2':_r64 %_123~0':_r64 %_124~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_125 %_126 } ⊢ { %_129 %_130 %_131 } : { %_129 %_130 %_131 }
 ; {>  %_125~2':_r64 %_128~3':_r64 %_126~0':_r64 %_127~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_134:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_135
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_135
LB_136:
	cmp r15,0
	jz LB_137
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_136
LB_137:
; _some %_130 ⊢ %_132 : %_132
 ; {>  %_129~2':_r64 %_130~0':_r64 %_127~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_132
 ; {>  %_132~°0◂0':(_opn)◂(_r64) %_129~2':_r64 %_127~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_138
	mov rdi,r8
	call dlt
LB_138:
	bt r12,1
	jc LB_139
	mov rdi,r14
	call dlt
LB_139:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_140
	btr r12,3
	jmp LB_141
LB_140:
	bts r12,3
LB_141:
	mov r8,0
	bts r12,2
	ret
MTC_LB_135:
LB_143:
	cmp r15,0
	jz LB_144
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_143
LB_144:
; _none {  } ⊢ %_133 : %_133
 ; {>  %_131~4':_r64 %_128~3':_r64 %_129~2':_r64 %_130~0':_r64 %_127~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_133
 ; {>  %_131~4':_r64 %_133~°1◂{  }:(_opn)◂(t59'(0)) %_128~3':_r64 %_129~2':_r64 %_130~0':_r64 %_127~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_145
	mov rdi,r10
	call dlt
LB_145:
	bt r12,3
	jc LB_146
	mov rdi,r9
	call dlt
LB_146:
	bt r12,2
	jc LB_147
	mov rdi,r8
	call dlt
LB_147:
	bt r12,0
	jc LB_148
	mov rdi,r13
	call dlt
LB_148:
	bt r12,1
	jc LB_149
	mov rdi,r14
	call dlt
LB_149:
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
MTC_LB_142:
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
	add rsp,16
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
NS_E_160:
NS_E_RDI_160:
NS_E_160_ETR_TBL:
NS_E_160_TBL:
	push r14
	sub rsp,16
; _byt
	call NS_E_49_ETR_TBL
	cmp r8,0
	jz LB_196
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_160_MTC_0_failed
LB_196:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_191
	btr r12,0
	jmp LB_192
LB_191:
	bts r12,0
LB_192:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_188
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_162 : %_162
 ; {>  %_161~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_162
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_163 : %_163
 ; {>  %_162~1':_r64 %_161~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_163
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f32 { %_161 %_162 } ⊢ { %_164 %_165 %_166 } : { %_164 %_165 %_166 }
 ; {>  %_163~2':_r64 %_162~1':_r64 %_161~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_163 %_164 } ⊢ { %_167 %_168 %_169 } : { %_167 %_168 %_169 }
 ; {>  %_164~0':_r64 %_163~2':_r64 %_166~3':_r64 %_165~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_172:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_173
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_173
LB_174:
	cmp r15,0
	jz LB_175
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_174
LB_175:
; _some %_168 ⊢ %_170 : %_170
 ; {>  %_167~2':_r64 %_165~1':_r64 %_168~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_170
 ; {>  %_170~°0◂0':(_opn)◂(_r64) %_167~2':_r64 %_165~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_176
	mov rdi,r8
	call dlt
LB_176:
	bt r12,1
	jc LB_177
	mov rdi,r14
	call dlt
LB_177:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_178
	btr r12,3
	jmp LB_179
LB_178:
	bts r12,3
LB_179:
	mov r8,0
	bts r12,2
	ret
MTC_LB_173:
LB_181:
	cmp r15,0
	jz LB_182
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_181
LB_182:
; _none {  } ⊢ %_171 : %_171
 ; {>  %_166~3':_r64 %_167~2':_r64 %_165~1':_r64 %_169~4':_r64 %_168~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_171
 ; {>  %_166~3':_r64 %_171~°1◂{  }:(_opn)◂(t86'(0)) %_167~2':_r64 %_165~1':_r64 %_169~4':_r64 %_168~0':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_183
	mov rdi,r9
	call dlt
LB_183:
	bt r12,2
	jc LB_184
	mov rdi,r8
	call dlt
LB_184:
	bt r12,1
	jc LB_185
	mov rdi,r14
	call dlt
LB_185:
	bt r12,4
	jc LB_186
	mov rdi,r10
	call dlt
LB_186:
	bt r12,0
	jc LB_187
	mov rdi,r13
	call dlt
LB_187:
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
MTC_LB_180:
LB_188:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_190
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_189
LB_190:
	add rsp,8
	ret
NS_E_160_MTC_0_failed:
	add rsp,16
	pop r14
LB_189:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_206:
NS_E_RDI_206:
; 	» "a04" _ ⊢ 0' : %_198
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_34_30_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_199 : %_199
 ; {>  %_198~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_199
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f122 { %_198 %_199 } ⊢ { %_200 %_201 %_202 } : { %_200 %_201 %_202 }
 ; {>  %_198~0':_stg %_199~1':_r64 }
; _f122 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_122
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_207
	btr r12,4
	jmp LB_208
LB_207:
	bts r12,4
LB_208:
	mov r8,r9
	bt r12,3
	jc LB_211
	btr r12,2
	jmp LB_212
LB_211:
	bts r12,2
LB_212:
	mov rsi,1
	bt r12,2
	jc LB_209
	mov rsi,0
	bt r8,0
	jc LB_209
	jmp LB_210
LB_209:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_210:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_200 %_201 %_202 } ⊢ { %_203 %_204 %_205 } : { %_203 %_204 %_205 }
 ; {>  %_202~2':(_opn)◂(_r64) %_201~1':_r64 %_200~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_213
	btr r12,3
	jmp LB_214
LB_213:
	bts r12,3
LB_214:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_217
	btr r12,4
	jmp LB_218
LB_217:
	bts r12,4
LB_218:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_215
	btr QWORD [rdi],0
	jmp LB_216
LB_215:
	bts QWORD [rdi],0
LB_216:
	mov r10,r14
	bt r12,1
	jc LB_221
	btr r12,4
	jmp LB_222
LB_221:
	bts r12,4
LB_222:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_219
	btr QWORD [rdi],1
	jmp LB_220
LB_219:
	bts QWORD [rdi],1
LB_220:
	mov r10,r8
	bt r12,2
	jc LB_225
	btr r12,4
	jmp LB_226
LB_225:
	bts r12,4
LB_226:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_223
	btr QWORD [rdi],2
	jmp LB_224
LB_223:
	bts QWORD [rdi],2
LB_224:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_227
	btr r12,3
	jmp LB_228
LB_227:
	bts r12,3
LB_228:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_231
	btr r12,4
	jmp LB_232
LB_231:
	bts r12,4
LB_232:
	mov r13,r10
	bt r12,4
	jc LB_229
	btr r12,0
	jmp LB_230
LB_229:
	bts r12,0
LB_230:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_235
	btr r12,4
	jmp LB_236
LB_235:
	bts r12,4
LB_236:
	mov r14,r10
	bt r12,4
	jc LB_233
	btr r12,1
	jmp LB_234
LB_233:
	bts r12,1
LB_234:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_239
	btr r12,4
	jmp LB_240
LB_239:
	bts r12,4
LB_240:
	mov r8,r10
	bt r12,4
	jc LB_237
	btr r12,2
	jmp LB_238
LB_237:
	bts r12,2
LB_238:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_204~1':_r64 %_205~2':(_opn)◂(_r64) %_203~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_241
	mov rdi,r14
	call dlt
LB_241:
	bt r12,2
	jc LB_242
	mov rdi,r8
	call dlt
LB_242:
	bt r12,0
	jc LB_243
	mov rdi,r13
	call dlt
LB_243:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_244:
NS_E_RDI_244:
NS_E_244_ETR_TBL:
NS_E_244_TBL:
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jge LB_283
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jz LB_284
LB_283:
	jmp NS_E_244_MTC_0_failed
LB_284:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	call NS_E_245_ETR_TBL
	cmp r8,0
	jz LB_290
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_291
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_291:
	jmp NS_E_244_MTC_0_failed
LB_290:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_277
	btr r12,1
	jmp LB_278
LB_277:
	bts r12,1
LB_278:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_275
	btr r12,0
	jmp LB_276
LB_275:
	bts r12,0
LB_276:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_272
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_293
	btr r12,2
	jmp LB_294
LB_293:
	bts r12,2
LB_294:
	mov r13,r14
	bt r12,1
	jc LB_295
	btr r12,0
	jmp LB_296
LB_295:
	bts r12,0
LB_296:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f112 %_247 ⊢ %_248 : %_248
 ; {>  %_247~0':(_lst)◂(_r64) }
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
; _some %_248 ⊢ %_249 : %_249
 ; {>  %_248~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_249
 ; {>  %_249~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_270
	btr r12,3
	jmp LB_271
LB_270:
	bts r12,3
LB_271:
	mov r8,0
	bts r12,2
	ret
LB_272:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_274
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_273
LB_274:
	add rsp,8
	ret
NS_E_244_MTC_0_failed:
	add rsp,32
	pop r14
LB_273:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_245:
NS_E_RDI_245:
NS_E_245_ETR_TBL:
NS_E_245_TBL:
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jge LB_320
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jz LB_321
LB_320:
	jmp NS_E_245_MTC_0_failed
LB_321:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	call NS_E_246_ETR_TBL
	cmp r8,0
	jz LB_327
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_328:
	jmp NS_E_245_MTC_0_failed
LB_327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	call NS_E_245_ETR_TBL
	cmp r8,0
	jz LB_333
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_334
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_335:
	jmp NS_E_245_MTC_0_failed
LB_333:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_314
	btr r12,2
	jmp LB_315
LB_314:
	bts r12,2
LB_315:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_312
	btr r12,1
	jmp LB_313
LB_312:
	bts r12,1
LB_313:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,48
	push rdi
	push rsi
	push LB_307
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_337
	btr r12,3
	jmp LB_338
LB_337:
	bts r12,3
LB_338:
	mov r14,r8
	bt r12,2
	jc LB_339
	btr r12,1
	jmp LB_340
LB_339:
	bts r12,1
LB_340:
	mov r8,r13
	bt r12,0
	jc LB_341
	btr r12,2
	jmp LB_342
LB_341:
	bts r12,2
LB_342:
	mov r13,r9
	bt r12,3
	jc LB_343
	btr r12,0
	jmp LB_344
LB_343:
	bts r12,0
LB_344:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_250 %_251 } ⊢ %_252 : %_252
 ; {>  %_250~0':_r64 %_251~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_252 ⊢ %_253 : %_253
 ; {>  %_252~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_253
 ; {>  %_253~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_301
	btr r12,2
	jmp LB_302
LB_301:
	bts r12,2
LB_302:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_299
	btr QWORD [rdi],0
	jmp LB_300
LB_299:
	bts QWORD [rdi],0
LB_300:
	mov r8,r14
	bt r12,1
	jc LB_305
	btr r12,2
	jmp LB_306
LB_305:
	bts r12,2
LB_306:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_303
	btr QWORD [rdi],1
	jmp LB_304
LB_303:
	bts QWORD [rdi],1
LB_304:
	mov rsi,1
	bt r12,3
	jc LB_297
	mov rsi,0
	bt r9,0
	jc LB_297
	jmp LB_298
LB_297:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_298:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
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
NS_E_245_MTC_0_failed:
	add rsp,48
	pop r14
LB_308:
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jge LB_356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jz LB_357
LB_356:
	jmp NS_E_245_MTC_1_failed
LB_357:
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
	jc LB_350
	btr r12,0
	jmp LB_351
LB_350:
	bts r12,0
LB_351:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_347
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_254 : %_254
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_254 ⊢ %_255 : %_255
 ; {>  %_254~°1◂{  }:(_lst)◂(t128'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_255
 ; {>  %_255~°0◂°1◂{  }:(_opn)◂((_lst)◂(t131'(0))) }
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
	jc LB_345
	mov rsi,0
	bt r9,0
	jc LB_345
	jmp LB_346
LB_345:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_346:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_347:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_349
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_348
LB_349:
	add rsp,8
	ret
NS_E_245_MTC_1_failed:
	add rsp,16
	pop r14
LB_348:
	push r14
	sub rsp,32
; _byt
	call NS_E_49_ETR_TBL
	cmp r8,0
	jz LB_380
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_245_MTC_2_failed
LB_380:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	call NS_E_245_ETR_TBL
	cmp r8,0
	jz LB_385
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_386:
	jmp NS_E_245_MTC_2_failed
LB_385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_375
	btr r12,1
	jmp LB_376
LB_375:
	bts r12,1
LB_376:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_373
	btr r12,0
	jmp LB_374
LB_373:
	bts r12,0
LB_374:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_370
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_256 %_257 } ⊢ %_258 : %_258
 ; {>  %_257~1':(_lst)◂(_r64) %_256~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_258 ⊢ %_259 : %_259
 ; {>  %_258~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_259
 ; {>  %_259~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_364
	btr r12,2
	jmp LB_365
LB_364:
	bts r12,2
LB_365:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_362
	btr QWORD [rdi],0
	jmp LB_363
LB_362:
	bts QWORD [rdi],0
LB_363:
	mov r8,r14
	bt r12,1
	jc LB_368
	btr r12,2
	jmp LB_369
LB_368:
	bts r12,2
LB_369:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_366
	btr QWORD [rdi],1
	jmp LB_367
LB_366:
	bts QWORD [rdi],1
LB_367:
	mov rsi,1
	bt r12,3
	jc LB_360
	mov rsi,0
	bt r9,0
	jc LB_360
	jmp LB_361
LB_360:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_361:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_370:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_372
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_371
LB_372:
	add rsp,8
	ret
NS_E_245_MTC_2_failed:
	add rsp,32
	pop r14
LB_371:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_246:
NS_E_RDI_246:
NS_E_246_ETR_TBL:
NS_E_246_TBL:
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jge LB_399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jz LB_400
LB_399:
	jmp NS_E_246_MTC_0_failed
LB_400:
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
	jc LB_393
	btr r12,0
	jmp LB_394
LB_393:
	bts r12,0
LB_394:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_390
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_260 : %_260
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_260
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_260 ⊢ %_261 : %_261
 ; {>  %_260~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_261
 ; {>  %_261~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_388
	btr r12,3
	jmp LB_389
LB_388:
	bts r12,3
LB_389:
	mov r8,0
	bts r12,2
	ret
LB_390:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_392
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_391
LB_392:
	add rsp,8
	ret
NS_E_246_MTC_0_failed:
	add rsp,16
	pop r14
LB_391:
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jge LB_414
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jz LB_415
LB_414:
	jmp NS_E_246_MTC_1_failed
LB_415:
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
	jc LB_408
	btr r12,0
	jmp LB_409
LB_408:
	bts r12,0
LB_409:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_405
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_262 : %_262
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_262
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_262 ⊢ %_263 : %_263
 ; {>  %_262~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_263
 ; {>  %_263~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_403
	btr r12,3
	jmp LB_404
LB_403:
	bts r12,3
LB_404:
	mov r8,0
	bts r12,2
	ret
LB_405:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_407
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_406
LB_407:
	add rsp,8
	ret
NS_E_246_MTC_1_failed:
	add rsp,16
	pop r14
LB_406:
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jge LB_429
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jz LB_430
LB_429:
	jmp NS_E_246_MTC_2_failed
LB_430:
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
	jc LB_423
	btr r12,0
	jmp LB_424
LB_423:
	bts r12,0
LB_424:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_420
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_264 : %_264
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_264
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_264 ⊢ %_265 : %_265
 ; {>  %_264~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_265
 ; {>  %_265~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_418
	btr r12,3
	jmp LB_419
LB_418:
	bts r12,3
LB_419:
	mov r8,0
	bts r12,2
	ret
LB_420:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_422
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_421
LB_422:
	add rsp,8
	ret
NS_E_246_MTC_2_failed:
	add rsp,16
	pop r14
LB_421:
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jge LB_444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jz LB_445
LB_444:
	jmp NS_E_246_MTC_3_failed
LB_445:
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
	jc LB_438
	btr r12,0
	jmp LB_439
LB_438:
	bts r12,0
LB_439:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_435
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_266 : %_266
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_266
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_266 ⊢ %_267 : %_267
 ; {>  %_266~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_267
 ; {>  %_267~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_433
	btr r12,3
	jmp LB_434
LB_433:
	bts r12,3
LB_434:
	mov r8,0
	bts r12,2
	ret
LB_435:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_437
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_436
LB_437:
	add rsp,8
	ret
NS_E_246_MTC_3_failed:
	add rsp,16
	pop r14
LB_436:
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jge LB_459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jz LB_460
LB_459:
	jmp NS_E_246_MTC_4_failed
LB_460:
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
	push LB_450
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_268 : %_268
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_268
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_268 ⊢ %_269 : %_269
 ; {>  %_268~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_269
 ; {>  %_269~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_448
	btr r12,3
	jmp LB_449
LB_448:
	bts r12,3
LB_449:
	mov r8,0
	bts r12,2
	ret
LB_450:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_452
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_451
LB_452:
	add rsp,8
	ret
NS_E_246_MTC_4_failed:
	add rsp,16
	pop r14
LB_451:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_471:
NS_E_RDI_471:
; » _^ ..
	mov rax,19
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\"Hello\\tWorld !!\" \n"
	mov rsi,0x_74_5c_6f_6c_6c_65_48_22
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_21_21_20_64_6c_72_6f_57
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_00_00_00_00_00_0a_20_22
	mov QWORD [rdi+8*2],rsi
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_464 : %_464
 ; {>  %_463~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_464
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f244 { %_463 %_464 } ⊢ { %_465 %_466 %_467 } : { %_465 %_466 %_467 }
 ; {>  %_463~0':_stg %_464~1':_r64 }
; _f244 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_244
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_472
	btr r12,4
	jmp LB_473
LB_472:
	bts r12,4
LB_473:
	mov r8,r9
	bt r12,3
	jc LB_476
	btr r12,2
	jmp LB_477
LB_476:
	bts r12,2
LB_477:
	mov rsi,1
	bt r12,2
	jc LB_474
	mov rsi,0
	bt r8,0
	jc LB_474
	jmp LB_475
LB_474:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_475:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_465 %_466 %_467 } ⊢ { %_468 %_469 %_470 } : { %_468 %_469 %_470 }
 ; {>  %_466~1':_r64 %_467~2':(_opn)◂(_stg) %_465~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_478
	btr r12,3
	jmp LB_479
LB_478:
	bts r12,3
LB_479:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_482
	btr r12,4
	jmp LB_483
LB_482:
	bts r12,4
LB_483:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_480
	btr QWORD [rdi],0
	jmp LB_481
LB_480:
	bts QWORD [rdi],0
LB_481:
	mov r10,r14
	bt r12,1
	jc LB_486
	btr r12,4
	jmp LB_487
LB_486:
	bts r12,4
LB_487:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_484
	btr QWORD [rdi],1
	jmp LB_485
LB_484:
	bts QWORD [rdi],1
LB_485:
	mov r10,r8
	bt r12,2
	jc LB_490
	btr r12,4
	jmp LB_491
LB_490:
	bts r12,4
LB_491:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_488
	btr QWORD [rdi],2
	jmp LB_489
LB_488:
	bts QWORD [rdi],2
LB_489:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_492
	btr r12,3
	jmp LB_493
LB_492:
	bts r12,3
LB_493:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_496
	btr r12,4
	jmp LB_497
LB_496:
	bts r12,4
LB_497:
	mov r13,r10
	bt r12,4
	jc LB_494
	btr r12,0
	jmp LB_495
LB_494:
	bts r12,0
LB_495:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_500
	btr r12,4
	jmp LB_501
LB_500:
	bts r12,4
LB_501:
	mov r14,r10
	bt r12,4
	jc LB_498
	btr r12,1
	jmp LB_499
LB_498:
	bts r12,1
LB_499:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_504
	btr r12,4
	jmp LB_505
LB_504:
	bts r12,4
LB_505:
	mov r8,r10
	bt r12,4
	jc LB_502
	btr r12,2
	jmp LB_503
LB_502:
	bts r12,2
LB_503:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_468~0':_stg %_469~1':_r64 %_470~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_506
	mov rdi,r13
	call dlt
LB_506:
	bt r12,1
	jc LB_507
	mov rdi,r14
	call dlt
LB_507:
	bt r12,2
	jc LB_508
	mov rdi,r8
	call dlt
LB_508:
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
	NS_E_DYN_160:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_160
	CST_DYN_206:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_244:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_244
	NS_E_DYN_245:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_245
	NS_E_DYN_246:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_246
	CST_DYN_471:
		dq 0x0000_0001_00_82_ffff
		dq 1
