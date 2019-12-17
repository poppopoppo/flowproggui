%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_454
	call NS_E_720
	call NS_E_771
	call NS_E_909
	call NS_E_1042
	call NS_E_1065
	call exec_out
	jmp _end
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_26: dq 0
NS_E_26:
NS_E_RDI_26:
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
NS_E_55:
NS_E_RDI_55:
NS_E_55_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_56
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_56:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_58:
NS_E_RDI_58:
NS_E_58_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_58_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_58_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_59:
NS_E_RDI_59:
NS_E_59_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_59_LB_0
	cmp r11,57
	ja NS_E_59_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_59_LB_0:
	mov rax,0
	ret
NS_E_61:
NS_E_RDI_61:
NS_E_61_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_61_LB_0
	cmp r11,122
	ja NS_E_61_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_61_LB_0:
	mov rax,0
	ret
NS_E_60:
NS_E_RDI_60:
NS_E_60_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_60_LB_0
	cmp r11,90
	ja NS_E_60_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_60_LB_0:
	mov rax,0
	ret
NS_E_33:
	mov rdi,r13
	bt r12,0
NS_E_RDI_33:
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
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_25: dq 0
NS_E_25:
NS_E_RDI_25:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_57:
NS_E_RDI_57:
NS_E_57_ETR_TBL:
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
	jz NS_E_57_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_57_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_75:
; 	|» { 0' 1' }
NS_E_RDI_75:
MTC_LB_76:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_77
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_78
	bt QWORD [rdi],0
	jc LB_79
	btr r12,4
	jmp LB_80
LB_79:
	bts r12,4
LB_80:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_78:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_83
	btr r12,5
	jmp LB_84
LB_83:
	bts r12,5
LB_84:
	mov r8,r11
	bt r12,5
	jc LB_81
	btr r12,2
	jmp LB_82
LB_81:
	bts r12,2
LB_82:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_87
	btr r12,5
	jmp LB_88
LB_87:
	bts r12,5
LB_88:
	mov r9,r11
	bt r12,5
	jc LB_85
	btr r12,3
	jmp LB_86
LB_85:
	bts r12,3
LB_86:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_89:
	cmp r15,0
	jz LB_90
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_89
LB_90:
; _f44 %_62 ⊢ %_66 : %_66
 ; {>  %_62~0':_r64 %_65~3':(_lst)◂(_r64) %_64~2':_r64 }
	add r13,1
; _f75 { %_66 %_65 } ⊢ { %_67 %_68 } : { %_67 %_68 }
 ; {>  %_65~3':(_lst)◂(_r64) %_64~2':_r64 %_66~0':_r64 }
; _f75 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_93
	btr r12,1
	jmp LB_94
LB_93:
	bts r12,1
LB_94:
	call NS_E_75
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_91
	btr r12,2
	jmp LB_92
LB_91:
	bts r12,2
LB_92:
	add rsp,16
; _f43 %_67 ⊢ %_69 : %_69
 ; {>  %_64~2':_r64 %_68~1':_stg %_67~0':_r64 }
	sub r13,1
; _f21 { %_68 %_69 %_64 } ⊢ { %_70 %_71 %_72 } : { %_70 %_71 %_72 }
 ; {>  %_64~2':_r64 %_68~1':_stg %_69~0':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_95
	btr r12,3
	jmp LB_96
LB_95:
	bts r12,3
LB_96:
	mov r14,r13
	bt r12,0
	jc LB_97
	btr r12,1
	jmp LB_98
LB_97:
	bts r12,1
LB_98:
	mov r13,r9
	bt r12,3
	jc LB_99
	btr r12,0
	jmp LB_100
LB_99:
	bts r12,0
LB_100:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_71 %_70 }
 ; {>  %_72~2':_r64 %_70~0':_stg %_71~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_101
	mov rdi,r8
	call dlt
LB_101:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_102
	btr r12,2
	jmp LB_103
LB_102:
	bts r12,2
LB_103:
	mov r14,r13
	bt r12,0
	jc LB_104
	btr r12,1
	jmp LB_105
LB_104:
	bts r12,1
LB_105:
	mov r13,r8
	bt r12,2
	jc LB_106
	btr r12,0
	jmp LB_107
LB_106:
	bts r12,0
LB_107:
	ret
MTC_LB_77:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_108
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_109
	bt QWORD [rdi],0
	jc LB_110
	btr r12,2
	jmp LB_111
LB_110:
	bts r12,2
LB_111:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_109:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_112:
	cmp r15,0
	jz LB_113
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_112
LB_113:
; _f19 %_62 ⊢ { %_73 %_74 } : { %_73 %_74 }
 ; {>  %_62~0':_r64 }
; _f19 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_73 %_74 }
 ; {>  %_74~1':_stg %_73~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_108:
NS_E_118:
; 	|» 0'
NS_E_RDI_118:
; » 0xr0 |~ {  } ⊢ %_115 : %_115
 ; {>  %_114~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_115
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f75 { %_115 %_114 } ⊢ { %_116 %_117 } : { %_116 %_117 }
 ; {>  %_115~1':_r64 %_114~0':(_lst)◂(_r64) }
; _f75 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
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
	bt r12,2
	jc LB_123
	btr r12,0
	jmp LB_124
LB_123:
	bts r12,0
LB_124:
	call NS_E_75
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_117
 ; {>  %_117~1':_stg %_116~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_125
	mov rdi,r13
	call dlt
LB_125:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_126
	btr r12,0
	jmp LB_127
LB_126:
	bts r12,0
LB_127:
	ret
NS_E_128:
NS_E_RDI_128:
NS_E_128_ETR_TBL:
NS_E_128_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_165
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_159
LB_165:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_160
	btr r12,0
	jmp LB_161
LB_160:
	bts r12,0
LB_161:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_156
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_130 : %_130
 ; {>  %_129~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_130
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_131 : %_131
 ; {>  %_129~0':_r64 %_130~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_131
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_129 %_130 } ⊢ { %_132 %_133 %_134 } : { %_132 %_133 %_134 }
 ; {>  %_131~2':_r64 %_129~0':_r64 %_130~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_131 %_132 } ⊢ { %_135 %_136 %_137 } : { %_135 %_136 %_137 }
 ; {>  %_131~2':_r64 %_132~0':_r64 %_133~1':_r64 %_134~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_140:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_141
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_141
LB_142:
	cmp r15,0
	jz LB_143
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_142
LB_143:
; _some %_136 ⊢ %_138 : %_138
 ; {>  %_133~1':_r64 %_136~0':_r64 %_135~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_138
 ; {>  %_133~1':_r64 %_138~°0◂0':(_opn)◂(_r64) %_135~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_144
	mov rdi,r14
	call dlt
LB_144:
	bt r12,2
	jc LB_145
	mov rdi,r8
	call dlt
LB_145:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_146
	btr r12,3
	jmp LB_147
LB_146:
	bts r12,3
LB_147:
	mov r8,0
	bts r12,2
	ret
MTC_LB_141:
	mov r15,0
LB_149:
	cmp r15,0
	jz LB_150
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_149
LB_150:
; _none {  } ⊢ %_139 : %_139
 ; {>  %_133~1':_r64 %_137~4':_r64 %_134~3':_r64 %_136~0':_r64 %_135~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_139
 ; {>  %_133~1':_r64 %_137~4':_r64 %_134~3':_r64 %_136~0':_r64 %_139~°1◂{  }:(_opn)◂(t67'(0)) %_135~2':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_151
	mov rdi,r14
	call dlt
LB_151:
	bt r12,4
	jc LB_152
	mov rdi,r10
	call dlt
LB_152:
	bt r12,3
	jc LB_153
	mov rdi,r9
	call dlt
LB_153:
	bt r12,0
	jc LB_154
	mov rdi,r13
	call dlt
LB_154:
	bt r12,2
	jc LB_155
	mov rdi,r8
	call dlt
LB_155:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_148:
LB_156:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_158
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_157
LB_158:
	add rsp,8
	ret
LB_159:
	add rsp,16
	pop r14
LB_157:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_167:
NS_E_RDI_167:
NS_E_167_ETR_TBL:
NS_E_167_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_204
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_198
LB_204:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_199
	btr r12,0
	jmp LB_200
LB_199:
	bts r12,0
LB_200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_195
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_169 : %_169
 ; {>  %_168~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_169
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_170 : %_170
 ; {>  %_169~1':_r64 %_168~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_170
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_168 %_169 } ⊢ { %_171 %_172 %_173 } : { %_171 %_172 %_173 }
 ; {>  %_170~2':_r64 %_169~1':_r64 %_168~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_170 %_171 } ⊢ { %_174 %_175 %_176 } : { %_174 %_175 %_176 }
 ; {>  %_170~2':_r64 %_171~0':_r64 %_173~3':_r64 %_172~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_179:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_180
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_180
LB_181:
	cmp r15,0
	jz LB_182
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_181
LB_182:
; _some %_175 ⊢ %_177 : %_177
 ; {>  %_174~2':_r64 %_175~0':_r64 %_172~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_177
 ; {>  %_177~°0◂0':(_opn)◂(_r64) %_174~2':_r64 %_172~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_183
	mov rdi,r8
	call dlt
LB_183:
	bt r12,1
	jc LB_184
	mov rdi,r14
	call dlt
LB_184:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_185
	btr r12,3
	jmp LB_186
LB_185:
	bts r12,3
LB_186:
	mov r8,0
	bts r12,2
	ret
MTC_LB_180:
	mov r15,0
LB_188:
	cmp r15,0
	jz LB_189
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_188
LB_189:
; _none {  } ⊢ %_178 : %_178
 ; {>  %_176~4':_r64 %_174~2':_r64 %_175~0':_r64 %_173~3':_r64 %_172~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_178
 ; {>  %_176~4':_r64 %_178~°1◂{  }:(_opn)◂(t94'(0)) %_174~2':_r64 %_175~0':_r64 %_173~3':_r64 %_172~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_190
	mov rdi,r10
	call dlt
LB_190:
	bt r12,2
	jc LB_191
	mov rdi,r8
	call dlt
LB_191:
	bt r12,0
	jc LB_192
	mov rdi,r13
	call dlt
LB_192:
	bt r12,3
	jc LB_193
	mov rdi,r9
	call dlt
LB_193:
	bt r12,1
	jc LB_194
	mov rdi,r14
	call dlt
LB_194:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_187:
LB_195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_197
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_196
LB_197:
	add rsp,8
	ret
LB_198:
	add rsp,16
	pop r14
LB_196:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_206:
NS_E_RDI_206:
NS_E_206_ETR_TBL:
NS_E_206_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_243
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_237
LB_243:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_238
	btr r12,0
	jmp LB_239
LB_238:
	bts r12,0
LB_239:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_234
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_208 : %_208
 ; {>  %_207~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_208
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_209 : %_209
 ; {>  %_207~0':_r64 %_208~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_209
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_207 %_208 } ⊢ { %_210 %_211 %_212 } : { %_210 %_211 %_212 }
 ; {>  %_207~0':_r64 %_208~1':_r64 %_209~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_209 %_210 } ⊢ { %_213 %_214 %_215 } : { %_213 %_214 %_215 }
 ; {>  %_211~1':_r64 %_210~0':_r64 %_212~3':_r64 %_209~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_218:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_219
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_219
LB_220:
	cmp r15,0
	jz LB_221
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_220
LB_221:
; _some %_214 ⊢ %_216 : %_216
 ; {>  %_211~1':_r64 %_214~0':_r64 %_213~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_216
 ; {>  %_216~°0◂0':(_opn)◂(_r64) %_211~1':_r64 %_213~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_222
	mov rdi,r14
	call dlt
LB_222:
	bt r12,2
	jc LB_223
	mov rdi,r8
	call dlt
LB_223:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_224
	btr r12,3
	jmp LB_225
LB_224:
	bts r12,3
LB_225:
	mov r8,0
	bts r12,2
	ret
MTC_LB_219:
	mov r15,0
LB_227:
	cmp r15,0
	jz LB_228
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_227
LB_228:
; _none {  } ⊢ %_217 : %_217
 ; {>  %_211~1':_r64 %_215~4':_r64 %_214~0':_r64 %_212~3':_r64 %_213~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_217
 ; {>  %_211~1':_r64 %_215~4':_r64 %_217~°1◂{  }:(_opn)◂(t121'(0)) %_214~0':_r64 %_212~3':_r64 %_213~2':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_229
	mov rdi,r14
	call dlt
LB_229:
	bt r12,4
	jc LB_230
	mov rdi,r10
	call dlt
LB_230:
	bt r12,0
	jc LB_231
	mov rdi,r13
	call dlt
LB_231:
	bt r12,3
	jc LB_232
	mov rdi,r9
	call dlt
LB_232:
	bt r12,2
	jc LB_233
	mov rdi,r8
	call dlt
LB_233:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_226:
LB_234:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_236
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_235
LB_236:
	add rsp,8
	ret
LB_237:
	add rsp,16
	pop r14
LB_235:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
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
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_206_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_261
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_255
LB_261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_256
	btr r12,0
	jmp LB_257
LB_256:
	bts r12,0
LB_257:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_252
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_246 ⊢ %_247 : %_247
 ; {>  %_246~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_247
 ; {>  %_247~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_250
	btr r12,3
	jmp LB_251
LB_250:
	bts r12,3
LB_251:
	mov r8,0
	bts r12,2
	ret
LB_252:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_254
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_253
LB_254:
	add rsp,8
	ret
LB_255:
	add rsp,16
	pop r14
LB_253:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_274
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_268
LB_274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
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
	push LB_265
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_248 ⊢ %_249 : %_249
 ; {>  %_248~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_249
 ; {>  %_249~°0◂0':(_opn)◂(_r64) }
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_266
LB_267:
	add rsp,8
	ret
LB_268:
	add rsp,16
	pop r14
LB_266:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_276:
NS_E_RDI_276:
NS_E_276_ETR_TBL:
NS_E_276_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_325
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_317
LB_325:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_277_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_330
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_331
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_331:
	jmp LB_317
LB_330:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_320
	btr r12,1
	jmp LB_321
LB_320:
	bts r12,1
LB_321:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_318
	btr r12,0
	jmp LB_319
LB_318:
	bts r12,0
LB_319:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_314
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_279 %_280 } ⊢ %_281 : %_281
 ; {>  %_279~0':_r64 %_280~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f118 %_281 ⊢ %_282 : %_282
 ; {>  %_281~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f118 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_300
	btr r12,2
	jmp LB_301
LB_300:
	bts r12,2
LB_301:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_306
	btr r12,3
	jmp LB_307
LB_306:
	bts r12,3
LB_307:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_304
	btr QWORD [rdi],0
	jmp LB_305
LB_304:
	bts QWORD [rdi],0
LB_305:
	mov r9,r14
	bt r12,1
	jc LB_310
	btr r12,3
	jmp LB_311
LB_310:
	bts r12,3
LB_311:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_308
	btr QWORD [rdi],1
	jmp LB_309
LB_308:
	bts QWORD [rdi],1
LB_309:
	mov rsi,1
	bt r12,0
	jc LB_302
	mov rsi,0
	bt r13,0
	jc LB_302
	jmp LB_303
LB_302:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_303:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_118
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_282 ⊢ %_283 : %_283
 ; {>  %_282~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_283
 ; {>  %_283~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_312
	btr r12,3
	jmp LB_313
LB_312:
	bts r12,3
LB_313:
	mov r8,0
	bts r12,2
	ret
LB_314:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_316
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_315
LB_316:
	add rsp,8
	ret
LB_317:
	add rsp,32
	pop r14
LB_315:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_277:
NS_E_RDI_277:
NS_E_277_ETR_TBL:
NS_E_277_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_278_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_354
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_346
LB_354:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_277_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_359
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_360:
	jmp LB_346
LB_359:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_349
	btr r12,1
	jmp LB_350
LB_349:
	bts r12,1
LB_350:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_347
	btr r12,0
	jmp LB_348
LB_347:
	bts r12,0
LB_348:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_284 %_285 } ⊢ %_286 : %_286
 ; {>  %_285~1':(_lst)◂(_r64) %_284~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_286 ⊢ %_287 : %_287
 ; {>  %_286~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_287
 ; {>  %_287~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_337
	btr r12,2
	jmp LB_338
LB_337:
	bts r12,2
LB_338:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_335
	btr QWORD [rdi],0
	jmp LB_336
LB_335:
	bts QWORD [rdi],0
LB_336:
	mov r8,r14
	bt r12,1
	jc LB_341
	btr r12,2
	jmp LB_342
LB_341:
	bts r12,2
LB_342:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_339
	btr QWORD [rdi],1
	jmp LB_340
LB_339:
	bts QWORD [rdi],1
LB_340:
	mov rsi,1
	bt r12,3
	jc LB_333
	mov rsi,0
	bt r9,0
	jc LB_333
	jmp LB_334
LB_333:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_334:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_343:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_345
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_344
LB_345:
	add rsp,8
	ret
LB_346:
	add rsp,32
	pop r14
LB_344:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_364
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_288 : %_288
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_288 ⊢ %_289 : %_289
 ; {>  %_288~°1◂{  }:(_lst)◂(t165'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_289
 ; {>  %_289~°0◂°1◂{  }:(_opn)◂((_lst)◂(t168'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_362
	mov rsi,0
	bt r9,0
	jc LB_362
	jmp LB_363
LB_362:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_363:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_364:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_366
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_365
LB_366:
	add rsp,8
	ret
LB_367:
	add rsp,0
	pop r14
LB_365:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_278:
NS_E_RDI_278:
NS_E_278_ETR_TBL:
NS_E_278_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_379
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_373
LB_379:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_374
	btr r12,0
	jmp LB_375
LB_374:
	bts r12,0
LB_375:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_370
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_290 ⊢ %_291 : %_291
 ; {>  %_290~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_291
 ; {>  %_291~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_368
	btr r12,3
	jmp LB_369
LB_368:
	bts r12,3
LB_369:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_371
LB_372:
	add rsp,8
	ret
LB_373:
	add rsp,16
	pop r14
LB_371:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_128_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_399
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_393
LB_399:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_394
	btr r12,0
	jmp LB_395
LB_394:
	bts r12,0
LB_395:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_390
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_293
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f26 %_293 ⊢ %_294 : %_294
 ; {>  %_292~0':_r64 %_293~1':_stg }
; _f26 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_383
	btr r12,0
	jmp LB_384
LB_383:
	bts r12,0
LB_384:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_385
	btr r12,1
	jmp LB_386
LB_385:
	bts r12,1
LB_386:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_381
	btr r12,0
	jmp LB_382
LB_381:
	bts r12,0
LB_382:
	add rsp,16
; _some %_292 ⊢ %_295 : %_295
 ; {>  %_292~0':_r64 %_294~1':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_295
 ; {>  %_295~°0◂0':(_opn)◂(_r64) %_294~1':_stg }
; 	∎ °0◂0'
	bt r12,1
	jc LB_387
	mov rdi,r14
	call dlt
LB_387:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_391
LB_392:
	add rsp,8
	ret
LB_393:
	add rsp,16
	pop r14
LB_391:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_415
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_415
	jmp LB_416
LB_415:
	jmp LB_407
LB_416:
	mov rax,rbx
	mov rbx,[rax]
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
	push LB_404
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_296
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f26 %_296 ⊢ %_297 : %_297
 ; {>  %_296~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr5f |~ {  } ⊢ %_298 : %_298
 ; {>  %_297~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_298
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_298 ⊢ %_299 : %_299
 ; {>  %_297~0':_stg %_298~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_299
 ; {>  %_297~0':_stg %_299~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_401
	mov rdi,r13
	call dlt
LB_401:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_402
	btr r12,3
	jmp LB_403
LB_402:
	bts r12,3
LB_403:
	mov r8,0
	bts r12,2
	ret
LB_404:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_406
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_405
LB_406:
	add rsp,8
	ret
LB_407:
	add rsp,16
	pop r14
LB_405:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_418:
NS_E_RDI_418:
NS_E_418_ETR_TBL:
NS_E_418_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_438
	jmp LB_439
LB_438:
	jmp LB_421
LB_439:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_443
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_444
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_444:
	jmp LB_421
LB_443:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_430
	btr QWORD [rdi],1
LB_430:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_431
	btr QWORD [rdi],0
LB_431:
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
LB_421:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_276_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_428
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_422
LB_428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_423
	btr QWORD [rdi],0
LB_423:
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
LB_422:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_454:
NS_E_RDI_454:
; 	» "aSk7_dD0_4$ jj " _ ⊢ 0' : %_446
	mov rdi,15
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_44_64_5f_37_6b_53_61
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_20_6a_6a_20_24_34_5f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_447 : %_447
 ; {>  %_446~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_447
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f276 { %_446 %_447 } ⊢ { %_448 %_449 %_450 } : { %_448 %_449 %_450 }
 ; {>  %_447~1':_r64 %_446~0':_stg }
; _f276 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_276
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_455
	btr r12,4
	jmp LB_456
LB_455:
	bts r12,4
LB_456:
	mov r8,r9
	bt r12,3
	jc LB_459
	btr r12,2
	jmp LB_460
LB_459:
	bts r12,2
LB_460:
	mov rsi,1
	bt r12,2
	jc LB_457
	mov rsi,0
	bt r8,0
	jc LB_457
	jmp LB_458
LB_457:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_458:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f26 { %_448 %_449 %_450 } ⊢ { %_451 %_452 %_453 } : { %_451 %_452 %_453 }
 ; {>  %_448~0':_stg %_450~2':(_opn)◂(_stg) %_449~1':_r64 }
; _f26 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_461
	btr r12,3
	jmp LB_462
LB_461:
	bts r12,3
LB_462:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_465
	btr r12,4
	jmp LB_466
LB_465:
	bts r12,4
LB_466:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_463
	btr QWORD [rdi],0
	jmp LB_464
LB_463:
	bts QWORD [rdi],0
LB_464:
	mov r10,r14
	bt r12,1
	jc LB_469
	btr r12,4
	jmp LB_470
LB_469:
	bts r12,4
LB_470:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_467
	btr QWORD [rdi],1
	jmp LB_468
LB_467:
	bts QWORD [rdi],1
LB_468:
	mov r10,r8
	bt r12,2
	jc LB_473
	btr r12,4
	jmp LB_474
LB_473:
	bts r12,4
LB_474:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_471
	btr QWORD [rdi],2
	jmp LB_472
LB_471:
	bts QWORD [rdi],2
LB_472:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_475
	btr r12,3
	jmp LB_476
LB_475:
	bts r12,3
LB_476:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_479
	btr r12,4
	jmp LB_480
LB_479:
	bts r12,4
LB_480:
	mov r13,r10
	bt r12,4
	jc LB_477
	btr r12,0
	jmp LB_478
LB_477:
	bts r12,0
LB_478:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_483
	btr r12,4
	jmp LB_484
LB_483:
	bts r12,4
LB_484:
	mov r14,r10
	bt r12,4
	jc LB_481
	btr r12,1
	jmp LB_482
LB_481:
	bts r12,1
LB_482:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_487
	btr r12,4
	jmp LB_488
LB_487:
	bts r12,4
LB_488:
	mov r8,r10
	bt r12,4
	jc LB_485
	btr r12,2
	jmp LB_486
LB_485:
	bts r12,2
LB_486:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_452~1':_r64 %_453~2':(_opn)◂(_stg) %_451~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_489
	mov rdi,r14
	call dlt
LB_489:
	bt r12,2
	jc LB_490
	mov rdi,r8
	call dlt
LB_490:
	bt r12,0
	jc LB_491
	mov rdi,r13
	call dlt
LB_491:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_492:
NS_E_RDI_492:
NS_E_492_ETR_TBL:
NS_E_492_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_533
	jmp LB_534
LB_533:
	jmp LB_523
LB_534:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_493_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_538
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_539:
	jmp LB_523
LB_538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_526
	btr r12,1
	jmp LB_527
LB_526:
	bts r12,1
LB_527:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_524
	btr r12,0
	jmp LB_525
LB_524:
	bts r12,0
LB_525:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_520
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_541
	btr r12,2
	jmp LB_542
LB_541:
	bts r12,2
LB_542:
	mov r13,r14
	bt r12,1
	jc LB_543
	btr r12,0
	jmp LB_544
LB_543:
	bts r12,0
LB_544:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f118 %_495 ⊢ %_496 : %_496
 ; {>  %_495~0':(_lst)◂(_r64) }
; _f118 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_118
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_496 ⊢ %_497 : %_497
 ; {>  %_496~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_497
 ; {>  %_497~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_518
	btr r12,3
	jmp LB_519
LB_518:
	bts r12,3
LB_519:
	mov r8,0
	bts r12,2
	ret
LB_520:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_522
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_521
LB_522:
	add rsp,8
	ret
LB_523:
	add rsp,32
	pop r14
LB_521:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
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
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_570
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_570
	jmp LB_571
LB_570:
	jmp LB_558
LB_571:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_494_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_575
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_576
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_576:
	jmp LB_558
LB_575:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_493_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_581
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_582
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_582:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_583
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_583:
	jmp LB_558
LB_581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_563
	btr r12,2
	jmp LB_564
LB_563:
	bts r12,2
LB_564:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_561
	btr r12,1
	jmp LB_562
LB_561:
	bts r12,1
LB_562:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_559
	btr r12,0
	jmp LB_560
LB_559:
	bts r12,0
LB_560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_555
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_585
	btr r12,3
	jmp LB_586
LB_585:
	bts r12,3
LB_586:
	mov r14,r8
	bt r12,2
	jc LB_587
	btr r12,1
	jmp LB_588
LB_587:
	bts r12,1
LB_588:
	mov r8,r13
	bt r12,0
	jc LB_589
	btr r12,2
	jmp LB_590
LB_589:
	bts r12,2
LB_590:
	mov r13,r9
	bt r12,3
	jc LB_591
	btr r12,0
	jmp LB_592
LB_591:
	bts r12,0
LB_592:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_498 %_499 } ⊢ %_500 : %_500
 ; {>  %_499~1':(_lst)◂(_r64) %_498~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_500 ⊢ %_501 : %_501
 ; {>  %_500~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_501
 ; {>  %_501~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_549
	btr r12,2
	jmp LB_550
LB_549:
	bts r12,2
LB_550:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_547
	btr QWORD [rdi],0
	jmp LB_548
LB_547:
	bts QWORD [rdi],0
LB_548:
	mov r8,r14
	bt r12,1
	jc LB_553
	btr r12,2
	jmp LB_554
LB_553:
	bts r12,2
LB_554:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_551
	btr QWORD [rdi],1
	jmp LB_552
LB_551:
	bts QWORD [rdi],1
LB_552:
	mov rsi,1
	bt r12,3
	jc LB_545
	mov rsi,0
	bt r9,0
	jc LB_545
	jmp LB_546
LB_545:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_546:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_555:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_557
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_556
LB_557:
	add rsp,8
	ret
LB_558:
	add rsp,48
	pop r14
LB_556:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_606
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_606
	jmp LB_607
LB_606:
	jmp LB_598
LB_607:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_599
	btr r12,0
	jmp LB_600
LB_599:
	bts r12,0
LB_600:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_595
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_502 : %_502
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_502 ⊢ %_503 : %_503
 ; {>  %_502~°1◂{  }:(_lst)◂(t249'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_503
 ; {>  %_503~°0◂°1◂{  }:(_opn)◂((_lst)◂(t252'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_593
	mov rsi,0
	bt r9,0
	jc LB_593
	jmp LB_594
LB_593:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_594:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_595:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_597
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_596
LB_597:
	add rsp,8
	ret
LB_598:
	add rsp,16
	pop r14
LB_596:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_629
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_621
LB_629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_493_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_634
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_635
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_635:
	jmp LB_621
LB_634:
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
	push LB_618
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_504 %_505 } ⊢ %_506 : %_506
 ; {>  %_504~0':_r64 %_505~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_506 ⊢ %_507 : %_507
 ; {>  %_506~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_507
 ; {>  %_507~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_612
	btr r12,2
	jmp LB_613
LB_612:
	bts r12,2
LB_613:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_610
	btr QWORD [rdi],0
	jmp LB_611
LB_610:
	bts QWORD [rdi],0
LB_611:
	mov r8,r14
	bt r12,1
	jc LB_616
	btr r12,2
	jmp LB_617
LB_616:
	bts r12,2
LB_617:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_614
	btr QWORD [rdi],1
	jmp LB_615
LB_614:
	bts QWORD [rdi],1
LB_615:
	mov rsi,1
	bt r12,3
	jc LB_608
	mov rsi,0
	bt r9,0
	jc LB_608
	jmp LB_609
LB_608:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_609:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_618:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_620
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_619
LB_620:
	add rsp,8
	ret
LB_621:
	add rsp,32
	pop r14
LB_619:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_494:
NS_E_RDI_494:
NS_E_494_ETR_TBL:
NS_E_494_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_650
	jmp LB_651
LB_650:
	jmp LB_642
LB_651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_643
	btr r12,0
	jmp LB_644
LB_643:
	bts r12,0
LB_644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_639
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_508 : %_508
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_508
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_508 ⊢ %_509 : %_509
 ; {>  %_508~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_509
 ; {>  %_509~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_637
	btr r12,3
	jmp LB_638
LB_637:
	bts r12,3
LB_638:
	mov r8,0
	bts r12,2
	ret
LB_639:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_641
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_640
LB_641:
	add rsp,8
	ret
LB_642:
	add rsp,16
	pop r14
LB_640:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_665
	jmp LB_666
LB_665:
	jmp LB_657
LB_666:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_658
	btr r12,0
	jmp LB_659
LB_658:
	bts r12,0
LB_659:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_654
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_510 : %_510
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_510
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_510 ⊢ %_511 : %_511
 ; {>  %_510~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_511
 ; {>  %_511~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_652
	btr r12,3
	jmp LB_653
LB_652:
	bts r12,3
LB_653:
	mov r8,0
	bts r12,2
	ret
LB_654:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_656
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_655
LB_656:
	add rsp,8
	ret
LB_657:
	add rsp,16
	pop r14
LB_655:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_680
	jmp LB_681
LB_680:
	jmp LB_672
LB_681:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_673
	btr r12,0
	jmp LB_674
LB_673:
	bts r12,0
LB_674:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_669
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_512 : %_512
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_512
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_512 ⊢ %_513 : %_513
 ; {>  %_512~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_513
 ; {>  %_513~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_667
	btr r12,3
	jmp LB_668
LB_667:
	bts r12,3
LB_668:
	mov r8,0
	bts r12,2
	ret
LB_669:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_671
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_670
LB_671:
	add rsp,8
	ret
LB_672:
	add rsp,16
	pop r14
LB_670:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_695
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_695
	jmp LB_696
LB_695:
	jmp LB_687
LB_696:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_688
	btr r12,0
	jmp LB_689
LB_688:
	bts r12,0
LB_689:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_684
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_514 : %_514
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_514
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_514 ⊢ %_515 : %_515
 ; {>  %_514~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_515
 ; {>  %_515~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_682
	btr r12,3
	jmp LB_683
LB_682:
	bts r12,3
LB_683:
	mov r8,0
	bts r12,2
	ret
LB_684:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_686
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_685
LB_686:
	add rsp,8
	ret
LB_687:
	add rsp,16
	pop r14
LB_685:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_710
	jmp LB_711
LB_710:
	jmp LB_702
LB_711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_703
	btr r12,0
	jmp LB_704
LB_703:
	bts r12,0
LB_704:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_699
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_516 : %_516
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_516
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_516 ⊢ %_517 : %_517
 ; {>  %_516~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_517
 ; {>  %_517~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_697
	btr r12,3
	jmp LB_698
LB_697:
	bts r12,3
LB_698:
	mov r8,0
	bts r12,2
	ret
LB_699:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_701
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_700
LB_701:
	add rsp,8
	ret
LB_702:
	add rsp,16
	pop r14
LB_700:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_720:
NS_E_RDI_720:
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
	mov rsi,0x_22
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_713 : %_713
 ; {>  %_712~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_713
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f492 { %_712 %_713 } ⊢ { %_714 %_715 %_716 } : { %_714 %_715 %_716 }
 ; {>  %_713~1':_r64 %_712~0':_stg }
; _f492 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_492
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_721
	btr r12,4
	jmp LB_722
LB_721:
	bts r12,4
LB_722:
	mov r8,r9
	bt r12,3
	jc LB_725
	btr r12,2
	jmp LB_726
LB_725:
	bts r12,2
LB_726:
	mov rsi,1
	bt r12,2
	jc LB_723
	mov rsi,0
	bt r8,0
	jc LB_723
	jmp LB_724
LB_723:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_724:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f26 { %_714 %_715 %_716 } ⊢ { %_717 %_718 %_719 } : { %_717 %_718 %_719 }
 ; {>  %_715~1':_r64 %_714~0':_stg %_716~2':(_opn)◂(_stg) }
; _f26 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_727
	btr r12,3
	jmp LB_728
LB_727:
	bts r12,3
LB_728:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_731
	btr r12,4
	jmp LB_732
LB_731:
	bts r12,4
LB_732:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_729
	btr QWORD [rdi],0
	jmp LB_730
LB_729:
	bts QWORD [rdi],0
LB_730:
	mov r10,r14
	bt r12,1
	jc LB_735
	btr r12,4
	jmp LB_736
LB_735:
	bts r12,4
LB_736:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_733
	btr QWORD [rdi],1
	jmp LB_734
LB_733:
	bts QWORD [rdi],1
LB_734:
	mov r10,r8
	bt r12,2
	jc LB_739
	btr r12,4
	jmp LB_740
LB_739:
	bts r12,4
LB_740:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_737
	btr QWORD [rdi],2
	jmp LB_738
LB_737:
	bts QWORD [rdi],2
LB_738:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_741
	btr r12,3
	jmp LB_742
LB_741:
	bts r12,3
LB_742:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_745
	btr r12,4
	jmp LB_746
LB_745:
	bts r12,4
LB_746:
	mov r13,r10
	bt r12,4
	jc LB_743
	btr r12,0
	jmp LB_744
LB_743:
	bts r12,0
LB_744:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_749
	btr r12,4
	jmp LB_750
LB_749:
	bts r12,4
LB_750:
	mov r14,r10
	bt r12,4
	jc LB_747
	btr r12,1
	jmp LB_748
LB_747:
	bts r12,1
LB_748:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_753
	btr r12,4
	jmp LB_754
LB_753:
	bts r12,4
LB_754:
	mov r8,r10
	bt r12,4
	jc LB_751
	btr r12,2
	jmp LB_752
LB_751:
	bts r12,2
LB_752:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_718~1':_r64 %_719~2':(_opn)◂(_stg) %_717~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_755
	mov rdi,r14
	call dlt
LB_755:
	bt r12,2
	jc LB_756
	mov rdi,r8
	call dlt
LB_756:
	bt r12,0
	jc LB_757
	mov rdi,r13
	call dlt
LB_757:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_771:
NS_E_RDI_771:
; » 0xr41 |~ {  } ⊢ %_758 : %_758
 ; {>  }
; 	» 0xr41 _ ⊢ 0' : %_758
	mov rdi,0x41
	mov r13,rdi
	bts r12,0
; » 0xr42 |~ {  } ⊢ %_759 : %_759
 ; {>  %_758~0':_r64 }
; 	» 0xr42 _ ⊢ 1' : %_759
	mov rdi,0x42
	mov r14,rdi
	bts r12,1
; » 0xr43 |~ {  } ⊢ %_760 : %_760
 ; {>  %_758~0':_r64 %_759~1':_r64 }
; 	» 0xr43 _ ⊢ 2' : %_760
	mov rdi,0x43
	mov r8,rdi
	bts r12,2
; » 0xr44 |~ {  } ⊢ %_761 : %_761
 ; {>  %_758~0':_r64 %_759~1':_r64 %_760~2':_r64 }
; 	» 0xr44 _ ⊢ 3' : %_761
	mov rdi,0x44
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_762 : %_762
 ; {>  %_758~0':_r64 %_761~3':_r64 %_759~1':_r64 %_760~2':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_762
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _nil {  } ⊢ %_763 : %_763
 ; {>  %_758~0':_r64 %_762~4':_r64 %_761~3':_r64 %_759~1':_r64 %_760~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_758 %_763 } ⊢ %_764 : %_764
 ; {>  %_758~0':_r64 %_762~4':_r64 %_761~3':_r64 %_759~1':_r64 %_760~2':_r64 %_763~°1◂{  }:(_lst)◂(t334'(0)) }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_759 %_764 } ⊢ %_765 : %_765
 ; {>  %_764~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_762~4':_r64 %_761~3':_r64 %_759~1':_r64 %_760~2':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _cns { %_760 %_765 } ⊢ %_766 : %_766
 ; {>  %_765~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) %_762~4':_r64 %_761~3':_r64 %_760~2':_r64 }
; _cns { 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }
; _cns { %_761 %_766 } ⊢ %_767 : %_767
 ; {>  %_762~4':_r64 %_761~3':_r64 %_766~°0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }:(_lst)◂(_r64) }
; _cns { 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } ⊢ °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }
; _f75 { %_762 %_767 } ⊢ { %_768 %_769 } : { %_768 %_769 }
 ; {>  %_762~4':_r64 %_767~°0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }:(_lst)◂(_r64) }
; _f75 { 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
	mov r11,r14
	bt r12,1
	jc LB_772
	btr r12,5
	jmp LB_773
LB_772:
	bts r12,5
LB_773:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rcx,r9
	bt r12,3
	jc LB_778
	btr r12,6
	jmp LB_779
LB_778:
	bts r12,6
LB_779:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_776
	btr QWORD [rdi],0
	jmp LB_777
LB_776:
	bts QWORD [rdi],0
LB_777:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r9,r8
	bt r12,2
	jc LB_786
	btr r12,3
	jmp LB_787
LB_786:
	bts r12,3
LB_787:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_784
	btr QWORD [rdi],0
	jmp LB_785
LB_784:
	bts QWORD [rdi],0
LB_785:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r11
	bt r12,5
	jc LB_794
	btr r12,2
	jmp LB_795
LB_794:
	bts r12,2
LB_795:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_792
	btr QWORD [rdi],0
	jmp LB_793
LB_792:
	bts QWORD [rdi],0
LB_793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r13
	bt r12,0
	jc LB_802
	btr r12,5
	jmp LB_803
LB_802:
	bts r12,5
LB_803:
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_800
	btr QWORD [rdi],0
	jmp LB_801
LB_800:
	bts QWORD [rdi],0
LB_801:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_806
	mov rsi,0
	bt r11,0
	jc LB_806
	jmp LB_807
LB_806:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_807:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_804
	btr QWORD [rdi],1
	jmp LB_805
LB_804:
	bts QWORD [rdi],1
LB_805:
	mov rsi,1
	bt r12,2
	jc LB_798
	mov rsi,0
	bt r8,0
	jc LB_798
	jmp LB_799
LB_798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_799:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_796
	btr QWORD [rdi],1
	jmp LB_797
LB_796:
	bts QWORD [rdi],1
LB_797:
	mov rsi,1
	bt r12,3
	jc LB_790
	mov rsi,0
	bt r9,0
	jc LB_790
	jmp LB_791
LB_790:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_791:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_788
	btr QWORD [rdi],1
	jmp LB_789
LB_788:
	bts QWORD [rdi],1
LB_789:
	mov rsi,1
	bt r12,6
	jc LB_782
	mov rsi,0
	bt rcx,0
	jc LB_782
	jmp LB_783
LB_782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_783:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_780
	btr QWORD [rdi],1
	jmp LB_781
LB_780:
	bts QWORD [rdi],1
LB_781:
	mov rsi,1
	bt r12,1
	jc LB_774
	mov rsi,0
	bt r14,0
	jc LB_774
	jmp LB_775
LB_774:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_775:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r10
	bt r12,4
	jc LB_808
	btr r12,0
	jmp LB_809
LB_808:
	bts r12,0
LB_809:
	call NS_E_75
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f26 %_769 ⊢ %_770 : %_770
 ; {>  %_769~1':_stg %_768~0':_r64 }
; _f26 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_812
	btr r12,0
	jmp LB_813
LB_812:
	bts r12,0
LB_813:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_814
	btr r12,1
	jmp LB_815
LB_814:
	bts r12,1
LB_815:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_810
	btr r12,0
	jmp LB_811
LB_810:
	bts r12,0
LB_811:
	add rsp,16
; ∎ {  }
 ; {>  %_770~1':_stg %_768~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_816
	mov rdi,r14
	call dlt
LB_816:
	bt r12,0
	jc LB_817
	mov rdi,r13
	call dlt
LB_817:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_843:
; 	|» { 0' 1' 2' }
NS_E_RDI_843:
; _f38 { %_819 %_818 } ⊢ { %_821 %_822 %_823 } : { %_821 %_822 %_823 }
 ; {>  %_818~0':_r64 %_819~1':_r64 %_820~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_844:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_845
LB_846:
	cmp r15,0
	jz LB_847
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_846
LB_847:
; _f41 %_822 ⊢ { %_824 %_825 } : { %_824 %_825 }
 ; {>  %_822~0':_r64 %_821~1':_r64 %_820~2':_r64 }
	mov r9,r13
	bts r12,3
; _f41 %_821 ⊢ { %_826 %_827 } : { %_826 %_827 }
 ; {>  %_824~0':_r64 %_821~1':_r64 %_825~3':_r64 %_820~2':_r64 }
	mov r10,r14
	bts r12,4
; _f41 %_820 ⊢ { %_828 %_829 } : { %_828 %_829 }
 ; {>  %_824~0':_r64 %_827~4':_r64 %_826~1':_r64 %_825~3':_r64 %_820~2':_r64 }
	mov r11,r8
	bts r12,5
; _f43 %_825 ⊢ %_830 : %_830
 ; {>  %_828~2':_r64 %_824~0':_r64 %_829~5':_r64 %_827~4':_r64 %_826~1':_r64 %_825~3':_r64 }
	sub r9,1
; _f843 { %_830 %_827 %_829 } ⊢ %_831 : %_831
 ; {>  %_828~2':_r64 %_830~3':_r64 %_824~0':_r64 %_829~5':_r64 %_827~4':_r64 %_826~1':_r64 }
; _f843 { 3' 4' 5' } ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_854
	btr r12,0
	jmp LB_855
LB_854:
	bts r12,0
LB_855:
	mov r14,r10
	bt r12,4
	jc LB_856
	btr r12,1
	jmp LB_857
LB_856:
	bts r12,1
LB_857:
	mov r8,r11
	bt r12,5
	jc LB_858
	btr r12,2
	jmp LB_859
LB_858:
	bts r12,2
LB_859:
	call NS_E_843
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_860
	btr r12,3
	jmp LB_861
LB_860:
	bts r12,3
LB_861:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_852
	btr r12,2
	jmp LB_853
LB_852:
	bts r12,2
LB_853:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_850
	btr r12,1
	jmp LB_851
LB_850:
	bts r12,1
LB_851:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_848
	btr r12,0
	jmp LB_849
LB_848:
	bts r12,0
LB_849:
	add rsp,32
; _f41 %_824 ⊢ { %_832 %_833 } : { %_832 %_833 }
 ; {>  %_828~2':_r64 %_824~0':_r64 %_831~3':_r64 %_826~1':_r64 }
	mov r10,r13
	bts r12,4
; _f41 %_826 ⊢ { %_834 %_835 } : { %_834 %_835 }
 ; {>  %_828~2':_r64 %_831~3':_r64 %_832~0':_r64 %_826~1':_r64 %_833~4':_r64 }
	mov r11,r14
	bts r12,5
; _f41 %_828 ⊢ { %_836 %_837 } : { %_836 %_837 }
 ; {>  %_828~2':_r64 %_831~3':_r64 %_834~1':_r64 %_832~0':_r64 %_833~4':_r64 %_835~5':_r64 }
	mov rcx,r8
	bts r12,6
; _f43 %_835 ⊢ %_838 : %_838
 ; {>  %_831~3':_r64 %_834~1':_r64 %_836~2':_r64 %_832~0':_r64 %_837~6':_r64 %_833~4':_r64 %_835~5':_r64 }
	sub r11,1
; _f843 { %_838 %_837 %_833 } ⊢ %_839 : %_839
 ; {>  %_831~3':_r64 %_834~1':_r64 %_838~5':_r64 %_836~2':_r64 %_832~0':_r64 %_837~6':_r64 %_833~4':_r64 }
; _f843 { 5' 6' 4' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00001110.. |},{ 5' 6' 4' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_870
	btr r12,0
	jmp LB_871
LB_870:
	bts r12,0
LB_871:
	mov r14,rcx
	bt r12,6
	jc LB_872
	btr r12,1
	jmp LB_873
LB_872:
	bts r12,1
LB_873:
	mov r8,r10
	bt r12,4
	jc LB_874
	btr r12,2
	jmp LB_875
LB_874:
	bts r12,2
LB_875:
	call NS_E_843
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_876
	btr r12,4
	jmp LB_877
LB_876:
	bts r12,4
LB_877:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_868
	btr r12,3
	jmp LB_869
LB_868:
	bts r12,3
LB_869:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_866
	btr r12,2
	jmp LB_867
LB_866:
	bts r12,2
LB_867:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_864
	btr r12,1
	jmp LB_865
LB_864:
	bts r12,1
LB_865:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_862
	btr r12,0
	jmp LB_863
LB_862:
	bts r12,0
LB_863:
	add rsp,40
; _f43 %_836 ⊢ %_840 : %_840
 ; {>  %_839~4':_r64 %_831~3':_r64 %_834~1':_r64 %_836~2':_r64 %_832~0':_r64 }
	sub r8,1
; _f843 { %_840 %_832 %_834 } ⊢ %_841 : %_841
 ; {>  %_839~4':_r64 %_831~3':_r64 %_834~1':_r64 %_832~0':_r64 %_840~2':_r64 }
; _f843 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_882
	btr r12,3
	jmp LB_883
LB_882:
	bts r12,3
LB_883:
	mov r8,r14
	bt r12,1
	jc LB_884
	btr r12,2
	jmp LB_885
LB_884:
	bts r12,2
LB_885:
	mov r14,r13
	bt r12,0
	jc LB_886
	btr r12,1
	jmp LB_887
LB_886:
	bts r12,1
LB_887:
	mov r13,r9
	bt r12,3
	jc LB_888
	btr r12,0
	jmp LB_889
LB_888:
	bts r12,0
LB_889:
	call NS_E_843
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_880
	btr r12,4
	jmp LB_881
LB_880:
	bts r12,4
LB_881:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_878
	btr r12,3
	jmp LB_879
LB_878:
	bts r12,3
LB_879:
	add rsp,24
; _f843 { %_831 %_839 %_841 } ⊢ %_842 : %_842
 ; {>  %_839~4':_r64 %_831~3':_r64 %_841~0':_r64 }
; _f843 { 3' 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100110.. |},{ 3' 4' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,4
	jc LB_890
	btr r12,1
	jmp LB_891
LB_890:
	bts r12,1
LB_891:
	mov r8,r13
	bt r12,0
	jc LB_892
	btr r12,2
	jmp LB_893
LB_892:
	bts r12,2
LB_893:
	mov r13,r9
	bt r12,3
	jc LB_894
	btr r12,0
	jmp LB_895
LB_894:
	bts r12,0
LB_895:
	call NS_E_843
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_842
 ; {>  %_842~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_845:
	mov r15,0
LB_897:
	cmp r15,0
	jz LB_898
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_897
LB_898:
; ∎ %_820
 ; {>  %_822~0':_r64 %_821~1':_r64 %_823~3':_r64 %_820~2':_r64 }
; 	∎ 2'
	bt r12,0
	jc LB_899
	mov rdi,r13
	call dlt
LB_899:
	bt r12,1
	jc LB_900
	mov rdi,r14
	call dlt
LB_900:
	bt r12,3
	jc LB_901
	mov rdi,r9
	call dlt
LB_901:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_902
	btr r12,0
	jmp LB_903
LB_902:
	bts r12,0
LB_903:
	ret
MTC_LB_896:
NS_E_909:
NS_E_RDI_909:
; » 0xr14 |~ {  } ⊢ %_904 : %_904
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_904
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_905 : %_905
 ; {>  %_904~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_905
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_906 : %_906
 ; {>  %_905~1':_r64 %_904~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_906
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f843 { %_904 %_905 %_906 } ⊢ %_907 : %_907
 ; {>  %_905~1':_r64 %_904~0':_r64 %_906~2':_r64 }
; _f843 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_843
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f26 %_907 ⊢ %_908 : %_908
 ; {>  %_907~0':_r64 }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_908~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_910
	mov rdi,r13
	call dlt
LB_910:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_941:
; 	|» { 0' 1' 2' }
NS_E_RDI_941:
; _f38 { %_912 %_911 } ⊢ { %_914 %_915 %_916 } : { %_914 %_915 %_916 }
 ; {>  %_912~1':_r64 %_911~0':_r64 %_913~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_942:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_943
LB_944:
	cmp r15,0
	jz LB_945
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_944
LB_945:
; _f43 %_915 ⊢ %_917 : %_917
 ; {>  %_915~0':_r64 %_914~1':_r64 %_913~2':_r64 }
	sub r13,1
; _f941 { %_917 %_914 %_913 } ⊢ { %_918 %_919 %_920 %_921 } : { %_918 %_919 %_920 %_921 }
 ; {>  %_917~0':_r64 %_914~1':_r64 %_913~2':_r64 }
; _f941 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f44 %_918 ⊢ %_922 : %_922
 ; {>  %_921~3':_r64 %_919~1':_r64 %_920~2':_r64 %_918~0':_r64 }
	add r13,1
; _f43 %_919 ⊢ %_923 : %_923
 ; {>  %_921~3':_r64 %_919~1':_r64 %_920~2':_r64 %_922~0':_r64 }
	sub r14,1
; _f941 { %_923 %_920 %_922 } ⊢ { %_924 %_925 %_926 %_927 } : { %_924 %_925 %_926 %_927 }
 ; {>  %_921~3':_r64 %_920~2':_r64 %_923~1':_r64 %_922~0':_r64 }
; _f941 { 1' 2' 0' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_948
	btr r12,3
	jmp LB_949
LB_948:
	bts r12,3
LB_949:
	mov r8,r13
	bt r12,0
	jc LB_950
	btr r12,2
	jmp LB_951
LB_950:
	bts r12,2
LB_951:
	mov r13,r14
	bt r12,1
	jc LB_952
	btr r12,0
	jmp LB_953
LB_952:
	bts r12,0
LB_953:
	mov r14,r9
	bt r12,3
	jc LB_954
	btr r12,1
	jmp LB_955
LB_954:
	bts r12,1
LB_955:
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r10,r9
	bt r12,3
	jc LB_956
	btr r12,4
	jmp LB_957
LB_956:
	bts r12,4
LB_957:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_946
	btr r12,3
	jmp LB_947
LB_946:
	bts r12,3
LB_947:
	add rsp,16
; _f44 %_924 ⊢ %_928 : %_928
 ; {>  %_927~4':_r64 %_926~2':_r64 %_921~3':_r64 %_924~0':_r64 %_925~1':_r64 }
	add r13,1
; _f43 %_925 ⊢ %_929 : %_929
 ; {>  %_927~4':_r64 %_926~2':_r64 %_921~3':_r64 %_925~1':_r64 %_928~0':_r64 }
	sub r14,1
; _f941 { %_929 %_926 %_928 } ⊢ { %_930 %_931 %_932 %_933 } : { %_930 %_931 %_932 %_933 }
 ; {>  %_927~4':_r64 %_926~2':_r64 %_921~3':_r64 %_929~1':_r64 %_928~0':_r64 }
; _f941 { 1' 2' 0' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_962
	btr r12,3
	jmp LB_963
LB_962:
	bts r12,3
LB_963:
	mov r8,r13
	bt r12,0
	jc LB_964
	btr r12,2
	jmp LB_965
LB_964:
	bts r12,2
LB_965:
	mov r13,r14
	bt r12,1
	jc LB_966
	btr r12,0
	jmp LB_967
LB_966:
	bts r12,0
LB_967:
	mov r14,r9
	bt r12,3
	jc LB_968
	btr r12,1
	jmp LB_969
LB_968:
	bts r12,1
LB_969:
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r11,r9
	bt r12,3
	jc LB_970
	btr r12,5
	jmp LB_971
LB_970:
	bts r12,5
LB_971:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_960
	btr r12,4
	jmp LB_961
LB_960:
	bts r12,4
LB_961:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_958
	btr r12,3
	jmp LB_959
LB_958:
	bts r12,3
LB_959:
	add rsp,24
; _f44 %_930 ⊢ %_934 : %_934
 ; {>  %_927~4':_r64 %_921~3':_r64 %_933~5':_r64 %_930~0':_r64 %_932~2':_r64 %_931~1':_r64 }
	add r13,1
; _f941 { %_921 %_927 %_933 } ⊢ { %_935 %_936 %_937 %_938 } : { %_935 %_936 %_937 %_938 }
 ; {>  %_927~4':_r64 %_934~0':_r64 %_921~3':_r64 %_933~5':_r64 %_932~2':_r64 %_931~1':_r64 }
; _f941 { 3' 4' 5' } ⊢ { 3' 4' 5' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_978
	btr r12,0
	jmp LB_979
LB_978:
	bts r12,0
LB_979:
	mov r14,r10
	bt r12,4
	jc LB_980
	btr r12,1
	jmp LB_981
LB_980:
	bts r12,1
LB_981:
	mov r8,r11
	bt r12,5
	jc LB_982
	btr r12,2
	jmp LB_983
LB_982:
	bts r12,2
LB_983:
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 3' 4' 5' 6' }
	mov r10,r14
	bt r12,1
	jc LB_984
	btr r12,4
	jmp LB_985
LB_984:
	bts r12,4
LB_985:
	mov r11,r8
	bt r12,2
	jc LB_986
	btr r12,5
	jmp LB_987
LB_986:
	bts r12,5
LB_987:
	mov rcx,r9
	bt r12,3
	jc LB_988
	btr r12,6
	jmp LB_989
LB_988:
	bts r12,6
LB_989:
	mov r9,r13
	bt r12,0
	jc LB_990
	btr r12,3
	jmp LB_991
LB_990:
	bts r12,3
LB_991:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_976
	btr r12,2
	jmp LB_977
LB_976:
	bts r12,2
LB_977:
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
	add rsp,32
; ∎ { %_931 %_932 %_934 %_938 }
 ; {>  %_934~0':_r64 %_935~3':_r64 %_937~5':_r64 %_938~6':_r64 %_932~2':_r64 %_936~4':_r64 %_931~1':_r64 }
; 	∎ { 1' 2' 0' 6' }
	bt r12,3
	jc LB_992
	mov rdi,r9
	call dlt
LB_992:
	bt r12,5
	jc LB_993
	mov rdi,r11
	call dlt
LB_993:
	bt r12,4
	jc LB_994
	mov rdi,r10
	call dlt
LB_994:
; _emt_mov_ptn_to_ptn:{| 11100010.. |},{ 1' 2' 0' 6' } ⊢ { 0' 1' 2' 3' }
	mov r9,rcx
	bt r12,6
	jc LB_995
	btr r12,3
	jmp LB_996
LB_995:
	bts r12,3
LB_996:
	mov r10,r8
	bt r12,2
	jc LB_997
	btr r12,4
	jmp LB_998
LB_997:
	bts r12,4
LB_998:
	mov r8,r13
	bt r12,0
	jc LB_999
	btr r12,2
	jmp LB_1000
LB_999:
	bts r12,2
LB_1000:
	mov r13,r14
	bt r12,1
	jc LB_1001
	btr r12,0
	jmp LB_1002
LB_1001:
	bts r12,0
LB_1002:
	mov r14,r10
	bt r12,4
	jc LB_1003
	btr r12,1
	jmp LB_1004
LB_1003:
	bts r12,1
LB_1004:
	ret
MTC_LB_943:
	mov r15,0
LB_1006:
	cmp r15,0
	jz LB_1007
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1006
LB_1007:
; _f41 %_913 ⊢ { %_939 %_940 } : { %_939 %_940 }
 ; {>  %_915~0':_r64 %_914~1':_r64 %_916~3':_r64 %_913~2':_r64 }
	mov r10,r8
	bts r12,4
; ∎ { %_915 %_914 %_939 %_940 }
 ; {>  %_915~0':_r64 %_914~1':_r64 %_940~4':_r64 %_916~3':_r64 %_939~2':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_1008
	mov rdi,r9
	call dlt
LB_1008:
; _emt_mov_ptn_to_ptn:{| 111010.. |},{ 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r9,r10
	bt r12,4
	jc LB_1009
	btr r12,3
	jmp LB_1010
LB_1009:
	bts r12,3
LB_1010:
	ret
MTC_LB_1005:
NS_E_1020:
; 	|» 0'
NS_E_RDI_1020:
MTC_LB_1021:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz MTC_LB_1022
LB_1023:
	cmp r15,0
	jz LB_1024
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1023
LB_1024:
; » 0xr1 |~ {  } ⊢ %_1012 : %_1012
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_1012
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_1012
 ; {>  %_1012~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1022:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r13
	jnz MTC_LB_1025
LB_1026:
	cmp r15,0
	jz LB_1027
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1026
LB_1027:
; » 0xr1 |~ {  } ⊢ %_1013 : %_1013
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_1013
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_1013
 ; {>  %_1013~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1025:
	mov r15,0
LB_1029:
	cmp r15,0
	jz LB_1030
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1029
LB_1030:
; _f41 %_1011 ⊢ { %_1014 %_1015 } : { %_1014 %_1015 }
 ; {>  %_1011~0':_r64 }
	mov r14,r13
	bts r12,1
; _f43 %_1015 ⊢ %_1016 : %_1016
 ; {>  %_1014~0':_r64 %_1015~1':_r64 }
	sub r14,1
; _f1020 %_1016 ⊢ %_1017 : %_1017
 ; {>  %_1014~0':_r64 %_1016~1':_r64 }
; _f1020 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1033
	btr r12,0
	jmp LB_1034
LB_1033:
	bts r12,0
LB_1034:
	call NS_E_1020
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1035
	btr r12,1
	jmp LB_1036
LB_1035:
	bts r12,1
LB_1036:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1031
	btr r12,0
	jmp LB_1032
LB_1031:
	bts r12,0
LB_1032:
	add rsp,16
; _f45 { %_1014 %_1017 } ⊢ { %_1018 %_1019 } : { %_1018 %_1019 }
 ; {>  %_1014~0':_r64 %_1017~1':_r64 }
	imul r13,r14
; ∎ %_1018
 ; {>  %_1019~1':_r64 %_1018~0':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1037
	mov rdi,r14
	call dlt
LB_1037:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1028:
NS_E_1042:
NS_E_RDI_1042:
; » 0xr0 |~ {  } ⊢ %_1038 : %_1038
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_1038
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr4 |~ {  } ⊢ %_1039 : %_1039
 ; {>  %_1038~0':_r64 }
; 	» 0xr4 _ ⊢ 1' : %_1039
	mov rdi,0x4
	mov r14,rdi
	bts r12,1
; _f1020 %_1039 ⊢ %_1040 : %_1040
 ; {>  %_1039~1':_r64 %_1038~0':_r64 }
; _f1020 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1045
	btr r12,0
	jmp LB_1046
LB_1045:
	bts r12,0
LB_1046:
	call NS_E_1020
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1047
	btr r12,1
	jmp LB_1048
LB_1047:
	bts r12,1
LB_1048:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1043
	btr r12,0
	jmp LB_1044
LB_1043:
	bts r12,0
LB_1044:
	add rsp,16
; _f26 %_1040 ⊢ %_1041 : %_1041
 ; {>  %_1040~1':_r64 %_1038~0':_r64 }
; _f26 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1051
	btr r12,0
	jmp LB_1052
LB_1051:
	bts r12,0
LB_1052:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1053
	btr r12,1
	jmp LB_1054
LB_1053:
	bts r12,1
LB_1054:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1049
	btr r12,0
	jmp LB_1050
LB_1049:
	bts r12,0
LB_1050:
	add rsp,16
; ∎ {  }
 ; {>  %_1041~1':_r64 %_1038~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_1055
	mov rdi,r14
	call dlt
LB_1055:
	bt r12,0
	jc LB_1056
	mov rdi,r13
	call dlt
LB_1056:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1065:
NS_E_RDI_1065:
; » 0xr14 |~ {  } ⊢ %_1057 : %_1057
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_1057
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_1058 : %_1058
 ; {>  %_1057~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_1058
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_1059 : %_1059
 ; {>  %_1058~1':_r64 %_1057~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_1059
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f941 { %_1057 %_1058 %_1059 } ⊢ { %_1060 %_1061 %_1062 %_1063 } : { %_1060 %_1061 %_1062 %_1063 }
 ; {>  %_1058~1':_r64 %_1057~0':_r64 %_1059~2':_r64 }
; _f941 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f26 %_1063 ⊢ %_1064 : %_1064
 ; {>  %_1062~2':_r64 %_1063~3':_r64 %_1060~0':_r64 %_1061~1':_r64 }
; _f26 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1072
	btr r12,0
	jmp LB_1073
LB_1072:
	bts r12,0
LB_1073:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_1074
	btr r12,3
	jmp LB_1075
LB_1074:
	bts r12,3
LB_1075:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1070
	btr r12,2
	jmp LB_1071
LB_1070:
	bts r12,2
LB_1071:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1068
	btr r12,1
	jmp LB_1069
LB_1068:
	bts r12,1
LB_1069:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1066
	btr r12,0
	jmp LB_1067
LB_1066:
	bts r12,0
LB_1067:
	add rsp,32
; ∎ {  }
 ; {>  %_1062~2':_r64 %_1064~3':_r64 %_1060~0':_r64 %_1061~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1076
	mov rdi,r8
	call dlt
LB_1076:
	bt r12,3
	jc LB_1077
	mov rdi,r9
	call dlt
LB_1077:
	bt r12,0
	jc LB_1078
	mov rdi,r13
	call dlt
LB_1078:
	bt r12,1
	jc LB_1079
	mov rdi,r14
	call dlt
LB_1079:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_55:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55
	NS_E_DYN_58:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_58
	NS_E_DYN_59:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_59
	NS_E_DYN_60:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_60
	NS_E_DYN_61:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_61
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_118:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_118
	NS_E_DYN_128:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_128
	NS_E_DYN_167:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_167
	NS_E_DYN_206:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_206
	NS_E_DYN_245:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_245
	NS_E_DYN_276:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_276
	NS_E_DYN_277:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_277
	NS_E_DYN_278:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_278
	CST_DYN_454:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_492:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_492
	NS_E_DYN_493:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_493
	NS_E_DYN_494:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_494
	CST_DYN_720:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_771:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_843:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_843
	CST_DYN_909:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_941:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_941
	NS_E_DYN_1020:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1020
	CST_DYN_1042:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_1065:
		dq 0x0000_0001_00_82_ffff
		dq 1
