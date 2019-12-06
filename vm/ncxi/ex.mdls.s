%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_409
	call NS_E_674
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
	sub rsp,16
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
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
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
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
NS_E_198:
NS_E_RDI_198:
NS_E_198_ETR_TBL:
NS_E_198_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_234
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_198_MTC_0_failed
LB_234:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_229
	btr r12,0
	jmp LB_230
LB_229:
	bts r12,0
LB_230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_226
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_200 : %_200
 ; {>  %_199~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_200
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_201 : %_201
 ; {>  %_200~1':_r64 %_199~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_201
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f32 { %_199 %_200 } ⊢ { %_202 %_203 %_204 } : { %_202 %_203 %_204 }
 ; {>  %_201~2':_r64 %_200~1':_r64 %_199~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_201 %_202 } ⊢ { %_205 %_206 %_207 } : { %_205 %_206 %_207 }
 ; {>  %_204~3':_r64 %_202~0':_r64 %_201~2':_r64 %_203~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_210:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_211
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_211
LB_212:
	cmp r15,0
	jz LB_213
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_212
LB_213:
; _some %_206 ⊢ %_208 : %_208
 ; {>  %_206~0':_r64 %_205~2':_r64 %_203~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_208
 ; {>  %_208~°0◂0':(_opn)◂(_r64) %_205~2':_r64 %_203~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_214
	mov rdi,r8
	call dlt
LB_214:
	bt r12,1
	jc LB_215
	mov rdi,r14
	call dlt
LB_215:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_216
	btr r12,3
	jmp LB_217
LB_216:
	bts r12,3
LB_217:
	mov r8,0
	bts r12,2
	ret
MTC_LB_211:
LB_219:
	cmp r15,0
	jz LB_220
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_219
LB_220:
; _none {  } ⊢ %_209 : %_209
 ; {>  %_206~0':_r64 %_204~3':_r64 %_207~4':_r64 %_205~2':_r64 %_203~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_209
 ; {>  %_206~0':_r64 %_204~3':_r64 %_207~4':_r64 %_205~2':_r64 %_209~°1◂{  }:(_opn)◂(t113'(0)) %_203~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_221
	mov rdi,r13
	call dlt
LB_221:
	bt r12,3
	jc LB_222
	mov rdi,r9
	call dlt
LB_222:
	bt r12,4
	jc LB_223
	mov rdi,r10
	call dlt
LB_223:
	bt r12,2
	jc LB_224
	mov rdi,r8
	call dlt
LB_224:
	bt r12,1
	jc LB_225
	mov rdi,r14
	call dlt
LB_225:
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
MTC_LB_218:
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
NS_E_198_MTC_0_failed:
	add rsp,16
	pop r14
LB_227:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_236:
NS_E_RDI_236:
NS_E_236_ETR_TBL:
NS_E_236_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_198_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_251
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_236_MTC_0_failed
LB_251:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_246
	btr r12,0
	jmp LB_247
LB_246:
	bts r12,0
LB_247:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_243
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_237 ⊢ %_238 : %_238
 ; {>  %_237~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_238
 ; {>  %_238~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_241
	btr r12,3
	jmp LB_242
LB_241:
	bts r12,3
LB_242:
	mov r8,0
	bts r12,2
	ret
LB_243:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_245
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_244
LB_245:
	add rsp,8
	ret
NS_E_236_MTC_0_failed:
	add rsp,16
	pop r14
LB_244:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_160_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_263
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_236_MTC_1_failed
LB_263:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_258
	btr r12,0
	jmp LB_259
LB_258:
	bts r12,0
LB_259:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_255
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_239 ⊢ %_240 : %_240
 ; {>  %_239~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_240
 ; {>  %_240~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_253
	btr r12,3
	jmp LB_254
LB_253:
	bts r12,3
LB_254:
	mov r8,0
	bts r12,2
	ret
LB_255:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_257
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_256
LB_257:
	add rsp,8
	ret
NS_E_236_MTC_1_failed:
	add rsp,16
	pop r14
LB_256:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_265:
NS_E_RDI_265:
NS_E_265_ETR_TBL:
NS_E_265_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_236_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_313
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_265_MTC_0_failed
LB_313:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_318
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_319
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_319:
	jmp NS_E_265_MTC_0_failed
LB_318:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_308
	btr r12,1
	jmp LB_309
LB_308:
	bts r12,1
LB_309:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_306
	btr r12,0
	jmp LB_307
LB_306:
	bts r12,0
LB_307:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_303
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_268 %_269 } ⊢ %_270 : %_270
 ; {>  %_269~1':(_lst)◂(_r64) %_268~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f112 %_270 ⊢ %_271 : %_271
 ; {>  %_270~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f112 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_289
	btr r12,2
	jmp LB_290
LB_289:
	bts r12,2
LB_290:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_295
	btr r12,3
	jmp LB_296
LB_295:
	bts r12,3
LB_296:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_293
	btr QWORD [rdi],0
	jmp LB_294
LB_293:
	bts QWORD [rdi],0
LB_294:
	mov r9,r14
	bt r12,1
	jc LB_299
	btr r12,3
	jmp LB_300
LB_299:
	bts r12,3
LB_300:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_297
	btr QWORD [rdi],1
	jmp LB_298
LB_297:
	bts QWORD [rdi],1
LB_298:
	mov rsi,1
	bt r12,0
	jc LB_291
	mov rsi,0
	bt r13,0
	jc LB_291
	jmp LB_292
LB_291:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_292:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_112
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_271 ⊢ %_272 : %_272
 ; {>  %_271~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_272
 ; {>  %_272~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_301
	btr r12,3
	jmp LB_302
LB_301:
	bts r12,3
LB_302:
	mov r8,0
	bts r12,2
	ret
LB_303:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_305
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_304
LB_305:
	add rsp,8
	ret
NS_E_265_MTC_0_failed:
	add rsp,32
	pop r14
LB_304:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_266:
NS_E_RDI_266:
NS_E_266_ETR_TBL:
NS_E_266_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_267_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_341
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_266_MTC_0_failed
LB_341:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_266_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_346
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_347
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_347:
	jmp NS_E_266_MTC_0_failed
LB_346:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_336
	btr r12,1
	jmp LB_337
LB_336:
	bts r12,1
LB_337:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,32
	push rdi
	push rsi
	push LB_331
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_273 %_274 } ⊢ %_275 : %_275
 ; {>  %_274~1':(_lst)◂(_r64) %_273~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_275 ⊢ %_276 : %_276
 ; {>  %_275~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_276
 ; {>  %_276~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_325
	btr r12,2
	jmp LB_326
LB_325:
	bts r12,2
LB_326:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_323
	btr QWORD [rdi],0
	jmp LB_324
LB_323:
	bts QWORD [rdi],0
LB_324:
	mov r8,r14
	bt r12,1
	jc LB_329
	btr r12,2
	jmp LB_330
LB_329:
	bts r12,2
LB_330:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_327
	btr QWORD [rdi],1
	jmp LB_328
LB_327:
	bts QWORD [rdi],1
LB_328:
	mov rsi,1
	bt r12,3
	jc LB_321
	mov rsi,0
	bt r9,0
	jc LB_321
	jmp LB_322
LB_321:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_322:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_331:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_333
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_332
LB_333:
	add rsp,8
	ret
NS_E_266_MTC_0_failed:
	add rsp,32
	pop r14
LB_332:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_351
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_277 : %_277
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_277 ⊢ %_278 : %_278
 ; {>  %_277~°1◂{  }:(_lst)◂(t157'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_278
 ; {>  %_278~°0◂°1◂{  }:(_opn)◂((_lst)◂(t160'(0))) }
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
	jc LB_349
	mov rsi,0
	bt r9,0
	jc LB_349
	jmp LB_350
LB_349:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_350:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_351:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_353
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_352
LB_353:
	add rsp,8
	ret
NS_E_266_MTC_1_failed:
	add rsp,0
	pop r14
LB_352:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_267:
NS_E_RDI_267:
NS_E_267_ETR_TBL:
NS_E_267_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_236_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_364
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_267_MTC_0_failed
LB_364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_359
	btr r12,0
	jmp LB_360
LB_359:
	bts r12,0
LB_360:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_356
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_279 ⊢ %_280 : %_280
 ; {>  %_279~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_280
 ; {>  %_280~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_354
	btr r12,3
	jmp LB_355
LB_354:
	bts r12,3
LB_355:
	mov r8,0
	bts r12,2
	ret
LB_356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_358
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_357
LB_358:
	add rsp,8
	ret
NS_E_267_MTC_0_failed:
	add rsp,16
	pop r14
LB_357:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_383
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_267_MTC_1_failed
LB_383:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_378
	btr r12,0
	jmp LB_379
LB_378:
	bts r12,0
LB_379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_375
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_282
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f20 %_282 ⊢ %_283 : %_283
 ; {>  %_282~1':_stg %_281~0':_r64 }
; _f20 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_368
	btr r12,0
	jmp LB_369
LB_368:
	bts r12,0
LB_369:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_370
	btr r12,1
	jmp LB_371
LB_370:
	bts r12,1
LB_371:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_366
	btr r12,0
	jmp LB_367
LB_366:
	bts r12,0
LB_367:
	add rsp,16
; _some %_281 ⊢ %_284 : %_284
 ; {>  %_283~1':_stg %_281~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_284
 ; {>  %_284~°0◂0':(_opn)◂(_r64) %_283~1':_stg }
; 	∎ °0◂0'
	bt r12,1
	jc LB_372
	mov rdi,r14
	call dlt
LB_372:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_373
	btr r12,3
	jmp LB_374
LB_373:
	bts r12,3
LB_374:
	mov r8,0
	bts r12,2
	ret
LB_375:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_377
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_376
LB_377:
	add rsp,8
	ret
NS_E_267_MTC_1_failed:
	add rsp,16
	pop r14
LB_376:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jge LB_397
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jz LB_398
LB_397:
	jmp NS_E_267_MTC_2_failed
LB_398:
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
	jc LB_391
	btr r12,0
	jmp LB_392
LB_391:
	bts r12,0
LB_392:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_388
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_285
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f20 %_285 ⊢ %_286 : %_286
 ; {>  %_285~0':_stg }
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
; » 0xr5f |~ {  } ⊢ %_287 : %_287
 ; {>  %_286~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_287
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_287 ⊢ %_288 : %_288
 ; {>  %_287~1':_r64 %_286~0':_stg }
; _some 1' ⊢ °0◂1'
; ∎ %_288
 ; {>  %_288~°0◂1':(_opn)◂(_r64) %_286~0':_stg }
; 	∎ °0◂1'
	bt r12,0
	jc LB_385
	mov rdi,r13
	call dlt
LB_385:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_386
	btr r12,3
	jmp LB_387
LB_386:
	bts r12,3
LB_387:
	mov r8,0
	bts r12,2
	ret
LB_388:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_390
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_389
LB_390:
	add rsp,8
	ret
NS_E_267_MTC_2_failed:
	add rsp,16
	pop r14
LB_389:
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
; 	» "aSk7_dD0_4" _ ⊢ 0' : %_401
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_44_64_5f_37_6b_53_61
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_34_5f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_402 : %_402
 ; {>  %_401~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_402
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f265 { %_401 %_402 } ⊢ { %_403 %_404 %_405 } : { %_403 %_404 %_405 }
 ; {>  %_401~0':_stg %_402~1':_r64 }
; _f265 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_265
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_410
	btr r12,4
	jmp LB_411
LB_410:
	bts r12,4
LB_411:
	mov r8,r9
	bt r12,3
	jc LB_414
	btr r12,2
	jmp LB_415
LB_414:
	bts r12,2
LB_415:
	mov rsi,1
	bt r12,2
	jc LB_412
	mov rsi,0
	bt r8,0
	jc LB_412
	jmp LB_413
LB_412:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_413:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_403 %_404 %_405 } ⊢ { %_406 %_407 %_408 } : { %_406 %_407 %_408 }
 ; {>  %_404~1':_r64 %_405~2':(_opn)◂(_stg) %_403~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_416
	btr r12,3
	jmp LB_417
LB_416:
	bts r12,3
LB_417:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_420
	btr r12,4
	jmp LB_421
LB_420:
	bts r12,4
LB_421:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_418
	btr QWORD [rdi],0
	jmp LB_419
LB_418:
	bts QWORD [rdi],0
LB_419:
	mov r10,r14
	bt r12,1
	jc LB_424
	btr r12,4
	jmp LB_425
LB_424:
	bts r12,4
LB_425:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_422
	btr QWORD [rdi],1
	jmp LB_423
LB_422:
	bts QWORD [rdi],1
LB_423:
	mov r10,r8
	bt r12,2
	jc LB_428
	btr r12,4
	jmp LB_429
LB_428:
	bts r12,4
LB_429:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_426
	btr QWORD [rdi],2
	jmp LB_427
LB_426:
	bts QWORD [rdi],2
LB_427:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_430
	btr r12,3
	jmp LB_431
LB_430:
	bts r12,3
LB_431:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_434
	btr r12,4
	jmp LB_435
LB_434:
	bts r12,4
LB_435:
	mov r13,r10
	bt r12,4
	jc LB_432
	btr r12,0
	jmp LB_433
LB_432:
	bts r12,0
LB_433:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_438
	btr r12,4
	jmp LB_439
LB_438:
	bts r12,4
LB_439:
	mov r14,r10
	bt r12,4
	jc LB_436
	btr r12,1
	jmp LB_437
LB_436:
	bts r12,1
LB_437:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_442
	btr r12,4
	jmp LB_443
LB_442:
	bts r12,4
LB_443:
	mov r8,r10
	bt r12,4
	jc LB_440
	btr r12,2
	jmp LB_441
LB_440:
	bts r12,2
LB_441:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_406~0':_stg %_407~1':_r64 %_408~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_444
	mov rdi,r13
	call dlt
LB_444:
	bt r12,1
	jc LB_445
	mov rdi,r14
	call dlt
LB_445:
	bt r12,2
	jc LB_446
	mov rdi,r8
	call dlt
LB_446:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_447:
NS_E_RDI_447:
NS_E_447_ETR_TBL:
NS_E_447_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jge LB_486
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jz LB_487
LB_486:
	jmp NS_E_447_MTC_0_failed
LB_487:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_448_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_493
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_494
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_494:
	jmp NS_E_447_MTC_0_failed
LB_493:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_480
	btr r12,1
	jmp LB_481
LB_480:
	bts r12,1
LB_481:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_478
	btr r12,0
	jmp LB_479
LB_478:
	bts r12,0
LB_479:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_475
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_496
	btr r12,2
	jmp LB_497
LB_496:
	bts r12,2
LB_497:
	mov r13,r14
	bt r12,1
	jc LB_498
	btr r12,0
	jmp LB_499
LB_498:
	bts r12,0
LB_499:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f112 %_450 ⊢ %_451 : %_451
 ; {>  %_450~0':(_lst)◂(_r64) }
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
; _some %_451 ⊢ %_452 : %_452
 ; {>  %_451~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_452
 ; {>  %_452~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_473
	btr r12,3
	jmp LB_474
LB_473:
	bts r12,3
LB_474:
	mov r8,0
	bts r12,2
	ret
LB_475:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_477
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_476
LB_477:
	add rsp,8
	ret
NS_E_447_MTC_0_failed:
	add rsp,32
	pop r14
LB_476:
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
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jge LB_523
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jz LB_524
LB_523:
	jmp NS_E_448_MTC_0_failed
LB_524:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_449_ETR_TBL
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
	jmp NS_E_448_MTC_0_failed
LB_530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_448_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_537
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_537:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_538
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_538:
	jmp NS_E_448_MTC_0_failed
LB_536:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_517
	btr r12,2
	jmp LB_518
LB_517:
	bts r12,2
LB_518:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_515
	btr r12,1
	jmp LB_516
LB_515:
	bts r12,1
LB_516:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_513
	btr r12,0
	jmp LB_514
LB_513:
	bts r12,0
LB_514:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_510
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_540
	btr r12,3
	jmp LB_541
LB_540:
	bts r12,3
LB_541:
	mov r14,r8
	bt r12,2
	jc LB_542
	btr r12,1
	jmp LB_543
LB_542:
	bts r12,1
LB_543:
	mov r8,r13
	bt r12,0
	jc LB_544
	btr r12,2
	jmp LB_545
LB_544:
	bts r12,2
LB_545:
	mov r13,r9
	bt r12,3
	jc LB_546
	btr r12,0
	jmp LB_547
LB_546:
	bts r12,0
LB_547:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_453 %_454 } ⊢ %_455 : %_455
 ; {>  %_454~1':(_lst)◂(_r64) %_453~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_455 ⊢ %_456 : %_456
 ; {>  %_455~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_456
 ; {>  %_456~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_504
	btr r12,2
	jmp LB_505
LB_504:
	bts r12,2
LB_505:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_502
	btr QWORD [rdi],0
	jmp LB_503
LB_502:
	bts QWORD [rdi],0
LB_503:
	mov r8,r14
	bt r12,1
	jc LB_508
	btr r12,2
	jmp LB_509
LB_508:
	bts r12,2
LB_509:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_506
	btr QWORD [rdi],1
	jmp LB_507
LB_506:
	bts QWORD [rdi],1
LB_507:
	mov rsi,1
	bt r12,3
	jc LB_500
	mov rsi,0
	bt r9,0
	jc LB_500
	jmp LB_501
LB_500:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_501:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_510:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_512
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_511
LB_512:
	add rsp,8
	ret
NS_E_448_MTC_0_failed:
	add rsp,48
	pop r14
LB_511:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jge LB_559
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jz LB_560
LB_559:
	jmp NS_E_448_MTC_1_failed
LB_560:
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
	jc LB_553
	btr r12,0
	jmp LB_554
LB_553:
	bts r12,0
LB_554:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_550
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_457 : %_457
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_457 ⊢ %_458 : %_458
 ; {>  %_457~°1◂{  }:(_lst)◂(t240'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_458
 ; {>  %_458~°0◂°1◂{  }:(_opn)◂((_lst)◂(t243'(0))) }
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
	jc LB_548
	mov rsi,0
	bt r9,0
	jc LB_548
	jmp LB_549
LB_548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_549:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_550:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_552
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_551
LB_552:
	add rsp,8
	ret
NS_E_448_MTC_1_failed:
	add rsp,16
	pop r14
LB_551:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_49_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_583
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_448_MTC_2_failed
LB_583:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_448_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_588
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_589
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_589:
	jmp NS_E_448_MTC_2_failed
LB_588:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_578
	btr r12,1
	jmp LB_579
LB_578:
	bts r12,1
LB_579:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_576
	btr r12,0
	jmp LB_577
LB_576:
	bts r12,0
LB_577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_573
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_459 %_460 } ⊢ %_461 : %_461
 ; {>  %_460~1':(_lst)◂(_r64) %_459~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_461 ⊢ %_462 : %_462
 ; {>  %_461~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_462
 ; {>  %_462~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_567
	btr r12,2
	jmp LB_568
LB_567:
	bts r12,2
LB_568:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_565
	btr QWORD [rdi],0
	jmp LB_566
LB_565:
	bts QWORD [rdi],0
LB_566:
	mov r8,r14
	bt r12,1
	jc LB_571
	btr r12,2
	jmp LB_572
LB_571:
	bts r12,2
LB_572:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_569
	btr QWORD [rdi],1
	jmp LB_570
LB_569:
	bts QWORD [rdi],1
LB_570:
	mov rsi,1
	bt r12,3
	jc LB_563
	mov rsi,0
	bt r9,0
	jc LB_563
	jmp LB_564
LB_563:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_564:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_575
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_574
LB_575:
	add rsp,8
	ret
NS_E_448_MTC_2_failed:
	add rsp,32
	pop r14
LB_574:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_449:
NS_E_RDI_449:
NS_E_449_ETR_TBL:
NS_E_449_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jge LB_602
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jz LB_603
LB_602:
	jmp NS_E_449_MTC_0_failed
LB_603:
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
	jc LB_596
	btr r12,0
	jmp LB_597
LB_596:
	bts r12,0
LB_597:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_593
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_463 : %_463
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_463
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_463 ⊢ %_464 : %_464
 ; {>  %_463~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_464
 ; {>  %_464~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_591
	btr r12,3
	jmp LB_592
LB_591:
	bts r12,3
LB_592:
	mov r8,0
	bts r12,2
	ret
LB_593:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_595
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_594
LB_595:
	add rsp,8
	ret
NS_E_449_MTC_0_failed:
	add rsp,16
	pop r14
LB_594:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jge LB_617
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jz LB_618
LB_617:
	jmp NS_E_449_MTC_1_failed
LB_618:
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
	push LB_608
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_465 : %_465
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_465
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_465 ⊢ %_466 : %_466
 ; {>  %_465~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_466
 ; {>  %_466~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_606
	btr r12,3
	jmp LB_607
LB_606:
	bts r12,3
LB_607:
	mov r8,0
	bts r12,2
	ret
LB_608:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_610
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_609
LB_610:
	add rsp,8
	ret
NS_E_449_MTC_1_failed:
	add rsp,16
	pop r14
LB_609:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jge LB_632
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jz LB_633
LB_632:
	jmp NS_E_449_MTC_2_failed
LB_633:
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
	jc LB_626
	btr r12,0
	jmp LB_627
LB_626:
	bts r12,0
LB_627:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_623
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_467 : %_467
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_467
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_467 ⊢ %_468 : %_468
 ; {>  %_467~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_468
 ; {>  %_468~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_621
	btr r12,3
	jmp LB_622
LB_621:
	bts r12,3
LB_622:
	mov r8,0
	bts r12,2
	ret
LB_623:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_625
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_624
LB_625:
	add rsp,8
	ret
NS_E_449_MTC_2_failed:
	add rsp,16
	pop r14
LB_624:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jge LB_647
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jz LB_648
LB_647:
	jmp NS_E_449_MTC_3_failed
LB_648:
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
	jc LB_641
	btr r12,0
	jmp LB_642
LB_641:
	bts r12,0
LB_642:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_638
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_469 : %_469
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_469
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_469 ⊢ %_470 : %_470
 ; {>  %_469~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_470
 ; {>  %_470~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_636
	btr r12,3
	jmp LB_637
LB_636:
	bts r12,3
LB_637:
	mov r8,0
	bts r12,2
	ret
LB_638:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_640
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_639
LB_640:
	add rsp,8
	ret
NS_E_449_MTC_3_failed:
	add rsp,16
	pop r14
LB_639:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jge LB_662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jz LB_663
LB_662:
	jmp NS_E_449_MTC_4_failed
LB_663:
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
	jc LB_656
	btr r12,0
	jmp LB_657
LB_656:
	bts r12,0
LB_657:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_653
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_471 : %_471
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_471
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_471 ⊢ %_472 : %_472
 ; {>  %_471~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_472
 ; {>  %_472~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_651
	btr r12,3
	jmp LB_652
LB_651:
	bts r12,3
LB_652:
	mov r8,0
	bts r12,2
	ret
LB_653:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_655
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_654
LB_655:
	add rsp,8
	ret
NS_E_449_MTC_4_failed:
	add rsp,16
	pop r14
LB_654:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_674:
NS_E_RDI_674:
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
; » 0xr0 |~ {  } ⊢ %_667 : %_667
 ; {>  %_666~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_667
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f447 { %_666 %_667 } ⊢ { %_668 %_669 %_670 } : { %_668 %_669 %_670 }
 ; {>  %_666~0':_stg %_667~1':_r64 }
; _f447 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_447
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_675
	btr r12,4
	jmp LB_676
LB_675:
	bts r12,4
LB_676:
	mov r8,r9
	bt r12,3
	jc LB_679
	btr r12,2
	jmp LB_680
LB_679:
	bts r12,2
LB_680:
	mov rsi,1
	bt r12,2
	jc LB_677
	mov rsi,0
	bt r8,0
	jc LB_677
	jmp LB_678
LB_677:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_678:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_668 %_669 %_670 } ⊢ { %_671 %_672 %_673 } : { %_671 %_672 %_673 }
 ; {>  %_668~0':_stg %_669~1':_r64 %_670~2':(_opn)◂(_stg) }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_681
	btr r12,3
	jmp LB_682
LB_681:
	bts r12,3
LB_682:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_685
	btr r12,4
	jmp LB_686
LB_685:
	bts r12,4
LB_686:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_683
	btr QWORD [rdi],0
	jmp LB_684
LB_683:
	bts QWORD [rdi],0
LB_684:
	mov r10,r14
	bt r12,1
	jc LB_689
	btr r12,4
	jmp LB_690
LB_689:
	bts r12,4
LB_690:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_687
	btr QWORD [rdi],1
	jmp LB_688
LB_687:
	bts QWORD [rdi],1
LB_688:
	mov r10,r8
	bt r12,2
	jc LB_693
	btr r12,4
	jmp LB_694
LB_693:
	bts r12,4
LB_694:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_691
	btr QWORD [rdi],2
	jmp LB_692
LB_691:
	bts QWORD [rdi],2
LB_692:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_695
	btr r12,3
	jmp LB_696
LB_695:
	bts r12,3
LB_696:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_699
	btr r12,4
	jmp LB_700
LB_699:
	bts r12,4
LB_700:
	mov r13,r10
	bt r12,4
	jc LB_697
	btr r12,0
	jmp LB_698
LB_697:
	bts r12,0
LB_698:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_703
	btr r12,4
	jmp LB_704
LB_703:
	bts r12,4
LB_704:
	mov r14,r10
	bt r12,4
	jc LB_701
	btr r12,1
	jmp LB_702
LB_701:
	bts r12,1
LB_702:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_707
	btr r12,4
	jmp LB_708
LB_707:
	bts r12,4
LB_708:
	mov r8,r10
	bt r12,4
	jc LB_705
	btr r12,2
	jmp LB_706
LB_705:
	bts r12,2
LB_706:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_672~1':_r64 %_671~0':_stg %_673~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_709
	mov rdi,r14
	call dlt
LB_709:
	bt r12,0
	jc LB_710
	mov rdi,r13
	call dlt
LB_710:
	bt r12,2
	jc LB_711
	mov rdi,r8
	call dlt
LB_711:
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
	NS_E_DYN_198:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_198
	NS_E_DYN_236:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_236
	NS_E_DYN_265:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_265
	NS_E_DYN_266:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_266
	NS_E_DYN_267:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_267
	CST_DYN_409:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_447:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_447
	NS_E_DYN_448:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_448
	NS_E_DYN_449:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_449
	CST_DYN_674:
		dq 0x0000_0001_00_82_ffff
		dq 1
