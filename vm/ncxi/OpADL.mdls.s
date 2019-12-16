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
	call NS_E_2558
	call NS_E_7272
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
	mov rbx,QWORD [rbx]
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
	mov rbx,QWORD [rbx]
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
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_68:
; 	|» { 0' 1' }
NS_E_RDI_68:
MTC_LB_69:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_70
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
	jnc LB_71
	bt QWORD [rax],0
	jc LB_72
	btr r12,2
	jmp LB_73
LB_72:
	bts r12,2
LB_73:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_71:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_74:
	cmp r15,0
	jz LB_75
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_74
LB_75:
; ∎ %_62
 ; {>  %_62~0':(_lst)◂(t55'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_70:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_76
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
	jnc LB_77
	bt QWORD [rax],0
	jc LB_78
	btr r12,4
	jmp LB_79
LB_78:
	bts r12,4
LB_79:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_77:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_82
	btr r12,5
	jmp LB_83
LB_82:
	bts r12,5
LB_83:
	mov r8,r11
	bt r12,5
	jc LB_80
	btr r12,2
	jmp LB_81
LB_80:
	bts r12,2
LB_81:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_86
	btr r12,5
	jmp LB_87
LB_86:
	bts r12,5
LB_87:
	mov r9,r11
	bt r12,5
	jc LB_84
	btr r12,3
	jmp LB_85
LB_84:
	bts r12,3
LB_85:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_88:
	cmp r15,0
	jz LB_89
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_88
LB_89:
; _cns { %_64 %_62 } ⊢ %_66 : %_66
 ; {>  %_62~0':(_lst)◂(t55'(-1)) %_65~3':(_lst)◂(t55'(-1)) %_64~2':t55'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f68 { %_66 %_65 } ⊢ %_67 : %_67
 ; {>  %_65~3':(_lst)◂(t55'(-1)) %_66~°0◂{ 2' 0' }:(_lst)◂(t55'(-1)) }
; _f68 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_90
	btr r12,1
	jmp LB_91
LB_90:
	bts r12,1
LB_91:
	mov r9,r13
	bt r12,0
	jc LB_92
	btr r12,3
	jmp LB_93
LB_92:
	bts r12,3
LB_93:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_98
	btr r12,4
	jmp LB_99
LB_98:
	bts r12,4
LB_99:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_96
	btr QWORD [rdi],0
	jmp LB_97
LB_96:
	bts QWORD [rdi],0
LB_97:
	mov r10,r9
	bt r12,3
	jc LB_102
	btr r12,4
	jmp LB_103
LB_102:
	bts r12,4
LB_103:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_100
	btr QWORD [rdi],1
	jmp LB_101
LB_100:
	bts QWORD [rdi],1
LB_101:
	mov rsi,1
	bt r12,0
	jc LB_94
	mov rsi,0
	bt r13,0
	jc LB_94
	jmp LB_95
LB_94:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_95:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_68
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_67
 ; {>  %_67~0':(_lst)◂(t55'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_76:
NS_E_107:
; 	|» 0'
NS_E_RDI_107:
; _nil {  } ⊢ %_105 : %_105
 ; {>  %_104~0':(_lst)◂(t76'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f68 { %_105 %_104 } ⊢ %_106 : %_106
 ; {>  %_105~°1◂{  }:(_lst)◂(t73'(0)) %_104~0':(_lst)◂(t76'(-1)) }
; _f68 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_108
	btr r12,1
	jmp LB_109
LB_108:
	bts r12,1
LB_109:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_110
	mov rsi,0
	bt r13,0
	jc LB_110
	jmp LB_111
LB_110:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_111:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_68
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_106
 ; {>  %_106~0':(_lst)◂(t76'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_125:
; 	|» { 0' 1' }
NS_E_RDI_125:
MTC_LB_126:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_127
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
	jnc LB_128
	bt QWORD [rax],0
	jc LB_129
	btr r12,4
	jmp LB_130
LB_129:
	bts r12,4
LB_130:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_128:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_133
	btr r12,5
	jmp LB_134
LB_133:
	bts r12,5
LB_134:
	mov r8,r11
	bt r12,5
	jc LB_131
	btr r12,2
	jmp LB_132
LB_131:
	bts r12,2
LB_132:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_137
	btr r12,5
	jmp LB_138
LB_137:
	bts r12,5
LB_138:
	mov r9,r11
	bt r12,5
	jc LB_135
	btr r12,3
	jmp LB_136
LB_135:
	bts r12,3
LB_136:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_139:
	cmp r15,0
	jz LB_140
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_139
LB_140:
; _f44 %_112 ⊢ %_116 : %_116
 ; {>  %_115~3':(_lst)◂(_r64) %_114~2':_r64 %_112~0':_r64 }
	add r13,1
; _f125 { %_116 %_115 } ⊢ { %_117 %_118 } : { %_117 %_118 }
 ; {>  %_116~0':_r64 %_115~3':(_lst)◂(_r64) %_114~2':_r64 }
; _f125 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_143
	btr r12,1
	jmp LB_144
LB_143:
	bts r12,1
LB_144:
	call NS_E_125
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_141
	btr r12,2
	jmp LB_142
LB_141:
	bts r12,2
LB_142:
	add rsp,16
; _f43 %_117 ⊢ %_119 : %_119
 ; {>  %_118~1':_stg %_117~0':_r64 %_114~2':_r64 }
	sub r13,1
; _f21 { %_118 %_119 %_114 } ⊢ { %_120 %_121 %_122 } : { %_120 %_121 %_122 }
 ; {>  %_118~1':_stg %_114~2':_r64 %_119~0':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_145
	btr r12,3
	jmp LB_146
LB_145:
	bts r12,3
LB_146:
	mov r14,r13
	bt r12,0
	jc LB_147
	btr r12,1
	jmp LB_148
LB_147:
	bts r12,1
LB_148:
	mov r13,r9
	bt r12,3
	jc LB_149
	btr r12,0
	jmp LB_150
LB_149:
	bts r12,0
LB_150:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_121 %_120 }
 ; {>  %_120~0':_stg %_122~2':_r64 %_121~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_151
	mov rdi,r8
	call dlt
LB_151:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_152
	btr r12,2
	jmp LB_153
LB_152:
	bts r12,2
LB_153:
	mov r14,r13
	bt r12,0
	jc LB_154
	btr r12,1
	jmp LB_155
LB_154:
	bts r12,1
LB_155:
	mov r13,r8
	bt r12,2
	jc LB_156
	btr r12,0
	jmp LB_157
LB_156:
	bts r12,0
LB_157:
	ret
MTC_LB_127:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_158
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
	jnc LB_159
	bt QWORD [rax],0
	jc LB_160
	btr r12,2
	jmp LB_161
LB_160:
	bts r12,2
LB_161:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_159:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_162:
	cmp r15,0
	jz LB_163
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_162
LB_163:
; _f19 %_112 ⊢ { %_123 %_124 } : { %_123 %_124 }
 ; {>  %_112~0':_r64 }
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
; ∎ { %_123 %_124 }
 ; {>  %_123~0':_r64 %_124~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_158:
NS_E_168:
; 	|» 0'
NS_E_RDI_168:
; » 0xr0 |~ {  } ⊢ %_165 : %_165
 ; {>  %_164~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_165
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f125 { %_165 %_164 } ⊢ { %_166 %_167 } : { %_166 %_167 }
 ; {>  %_164~0':(_lst)◂(_r64) %_165~1':_r64 }
; _f125 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_169
	btr r12,2
	jmp LB_170
LB_169:
	bts r12,2
LB_170:
	mov r14,r13
	bt r12,0
	jc LB_171
	btr r12,1
	jmp LB_172
LB_171:
	bts r12,1
LB_172:
	mov r13,r8
	bt r12,2
	jc LB_173
	btr r12,0
	jmp LB_174
LB_173:
	bts r12,0
LB_174:
	call NS_E_125
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_167
 ; {>  %_166~0':_r64 %_167~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_175
	mov rdi,r13
	call dlt
LB_175:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_176
	btr r12,0
	jmp LB_177
LB_176:
	bts r12,0
LB_177:
	ret
NS_E_178:
NS_E_RDI_178:
NS_E_178_ETR_TBL:
NS_E_178_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_219
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_219
	jmp LB_220
LB_219:
	jmp LB_209
LB_220:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_179_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_224
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_225:
	jmp LB_209
LB_224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_212
	btr r12,1
	jmp LB_213
LB_212:
	bts r12,1
LB_213:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_210
	btr r12,0
	jmp LB_211
LB_210:
	bts r12,0
LB_211:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_206
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_227
	btr r12,2
	jmp LB_228
LB_227:
	bts r12,2
LB_228:
	mov r13,r14
	bt r12,1
	jc LB_229
	btr r12,0
	jmp LB_230
LB_229:
	bts r12,0
LB_230:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f168 %_181 ⊢ %_182 : %_182
 ; {>  %_181~0':(_lst)◂(_r64) }
; _f168 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_168
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_182 ⊢ %_183 : %_183
 ; {>  %_182~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_183
 ; {>  %_183~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_204
	btr r12,3
	jmp LB_205
LB_204:
	bts r12,3
LB_205:
	mov r8,0
	bts r12,2
	ret
LB_206:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_208
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_207
LB_208:
	add rsp,8
	ret
LB_209:
	add rsp,32
	pop r14
LB_207:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_179:
NS_E_RDI_179:
NS_E_179_ETR_TBL:
NS_E_179_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_256
	jmp LB_257
LB_256:
	jmp LB_244
LB_257:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_180_ETR_TBL
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
	jmp LB_244
LB_261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_179_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_267
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_268
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_268:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_269
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_269:
	jmp LB_244
LB_267:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_249
	btr r12,2
	jmp LB_250
LB_249:
	bts r12,2
LB_250:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_247
	btr r12,1
	jmp LB_248
LB_247:
	bts r12,1
LB_248:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_245
	btr r12,0
	jmp LB_246
LB_245:
	bts r12,0
LB_246:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_241
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_271
	btr r12,3
	jmp LB_272
LB_271:
	bts r12,3
LB_272:
	mov r14,r8
	bt r12,2
	jc LB_273
	btr r12,1
	jmp LB_274
LB_273:
	bts r12,1
LB_274:
	mov r8,r13
	bt r12,0
	jc LB_275
	btr r12,2
	jmp LB_276
LB_275:
	bts r12,2
LB_276:
	mov r13,r9
	bt r12,3
	jc LB_277
	btr r12,0
	jmp LB_278
LB_277:
	bts r12,0
LB_278:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_184 %_185 } ⊢ %_186 : %_186
 ; {>  %_185~1':(_lst)◂(_r64) %_184~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_186 ⊢ %_187 : %_187
 ; {>  %_186~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_187
 ; {>  %_187~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_235
	btr r12,2
	jmp LB_236
LB_235:
	bts r12,2
LB_236:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_233
	btr QWORD [rdi],0
	jmp LB_234
LB_233:
	bts QWORD [rdi],0
LB_234:
	mov r8,r14
	bt r12,1
	jc LB_239
	btr r12,2
	jmp LB_240
LB_239:
	bts r12,2
LB_240:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_237
	btr QWORD [rdi],1
	jmp LB_238
LB_237:
	bts QWORD [rdi],1
LB_238:
	mov rsi,1
	bt r12,3
	jc LB_231
	mov rsi,0
	bt r9,0
	jc LB_231
	jmp LB_232
LB_231:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_232:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_241:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_243
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_242
LB_243:
	add rsp,8
	ret
LB_244:
	add rsp,48
	pop r14
LB_242:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_292
	jmp LB_293
LB_292:
	jmp LB_284
LB_293:
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
	jc LB_285
	btr r12,0
	jmp LB_286
LB_285:
	bts r12,0
LB_286:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_281
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_188 : %_188
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_188 ⊢ %_189 : %_189
 ; {>  %_188~°1◂{  }:(_lst)◂(t134'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_189
 ; {>  %_189~°0◂°1◂{  }:(_opn)◂((_lst)◂(t137'(0))) }
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
	jc LB_279
	mov rsi,0
	bt r9,0
	jc LB_279
	jmp LB_280
LB_279:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_280:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_281:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_283
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_282
LB_283:
	add rsp,8
	ret
LB_284:
	add rsp,16
	pop r14
LB_282:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_315
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_307
LB_315:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_179_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_320
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_321
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_321:
	jmp LB_307
LB_320:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_310
	btr r12,1
	jmp LB_311
LB_310:
	bts r12,1
LB_311:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_308
	btr r12,0
	jmp LB_309
LB_308:
	bts r12,0
LB_309:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_304
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_190 %_191 } ⊢ %_192 : %_192
 ; {>  %_191~1':(_lst)◂(_r64) %_190~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_192 ⊢ %_193 : %_193
 ; {>  %_192~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_193
 ; {>  %_193~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_298
	btr r12,2
	jmp LB_299
LB_298:
	bts r12,2
LB_299:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_296
	btr QWORD [rdi],0
	jmp LB_297
LB_296:
	bts QWORD [rdi],0
LB_297:
	mov r8,r14
	bt r12,1
	jc LB_302
	btr r12,2
	jmp LB_303
LB_302:
	bts r12,2
LB_303:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_300
	btr QWORD [rdi],1
	jmp LB_301
LB_300:
	bts QWORD [rdi],1
LB_301:
	mov rsi,1
	bt r12,3
	jc LB_294
	mov rsi,0
	bt r9,0
	jc LB_294
	jmp LB_295
LB_294:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_295:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_304:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_306
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_305
LB_306:
	add rsp,8
	ret
LB_307:
	add rsp,32
	pop r14
LB_305:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_180:
NS_E_RDI_180:
NS_E_180_ETR_TBL:
NS_E_180_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_336
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_336
	jmp LB_337
LB_336:
	jmp LB_328
LB_337:
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
	jc LB_329
	btr r12,0
	jmp LB_330
LB_329:
	bts r12,0
LB_330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_325
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_194 : %_194
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_194
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_194 ⊢ %_195 : %_195
 ; {>  %_194~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_195
 ; {>  %_195~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_323
	btr r12,3
	jmp LB_324
LB_323:
	bts r12,3
LB_324:
	mov r8,0
	bts r12,2
	ret
LB_325:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_327
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_326
LB_327:
	add rsp,8
	ret
LB_328:
	add rsp,16
	pop r14
LB_326:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_351
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_351
	jmp LB_352
LB_351:
	jmp LB_343
LB_352:
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
	jc LB_344
	btr r12,0
	jmp LB_345
LB_344:
	bts r12,0
LB_345:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_340
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_196 : %_196
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_196
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_196 ⊢ %_197 : %_197
 ; {>  %_196~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_197
 ; {>  %_197~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_338
	btr r12,3
	jmp LB_339
LB_338:
	bts r12,3
LB_339:
	mov r8,0
	bts r12,2
	ret
LB_340:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_342
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_341
LB_342:
	add rsp,8
	ret
LB_343:
	add rsp,16
	pop r14
LB_341:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_366
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_366
	jmp LB_367
LB_366:
	jmp LB_358
LB_367:
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
	push LB_355
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_198 : %_198
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_198
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_198 ⊢ %_199 : %_199
 ; {>  %_198~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_199
 ; {>  %_199~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_353
	btr r12,3
	jmp LB_354
LB_353:
	bts r12,3
LB_354:
	mov r8,0
	bts r12,2
	ret
LB_355:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_357
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_356
LB_357:
	add rsp,8
	ret
LB_358:
	add rsp,16
	pop r14
LB_356:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_381
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_381
	jmp LB_382
LB_381:
	jmp LB_373
LB_382:
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
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_200 : %_200
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_200
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_200 ⊢ %_201 : %_201
 ; {>  %_200~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_201
 ; {>  %_201~°0◂0':(_opn)◂(_r64) }
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
	mov QWORD [rdi],rbx
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
; "0"
	add r14,1
	cmp r14,r10
	jg LB_396
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_396
	jmp LB_397
LB_396:
	jmp LB_388
LB_397:
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
	jc LB_389
	btr r12,0
	jmp LB_390
LB_389:
	bts r12,0
LB_390:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_385
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_202 : %_202
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_202
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_202 ⊢ %_203 : %_203
 ; {>  %_202~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_203
 ; {>  %_203~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_383
	btr r12,3
	jmp LB_384
LB_383:
	bts r12,3
LB_384:
	mov r8,0
	bts r12,2
	ret
LB_385:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_387
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_386
LB_387:
	add rsp,8
	ret
LB_388:
	add rsp,16
	pop r14
LB_386:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_398:
NS_E_RDI_398:
NS_E_398_ETR_TBL:
NS_E_398_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_435
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_429
LB_435:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_430
	btr r12,0
	jmp LB_431
LB_430:
	bts r12,0
LB_431:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_426
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_400 : %_400
 ; {>  %_399~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_400
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_401 : %_401
 ; {>  %_399~0':_r64 %_400~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_401
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_399 %_400 } ⊢ { %_402 %_403 %_404 } : { %_402 %_403 %_404 }
 ; {>  %_401~2':_r64 %_399~0':_r64 %_400~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_401 %_402 } ⊢ { %_405 %_406 %_407 } : { %_405 %_406 %_407 }
 ; {>  %_404~3':_r64 %_401~2':_r64 %_402~0':_r64 %_403~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_410:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_411
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_411
LB_412:
	cmp r15,0
	jz LB_413
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_412
LB_413:
; _some %_406 ⊢ %_408 : %_408
 ; {>  %_406~0':_r64 %_405~2':_r64 %_403~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_408
 ; {>  %_405~2':_r64 %_403~1':_r64 %_408~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_414
	mov rdi,r8
	call dlt
LB_414:
	bt r12,1
	jc LB_415
	mov rdi,r14
	call dlt
LB_415:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_416
	btr r12,3
	jmp LB_417
LB_416:
	bts r12,3
LB_417:
	mov r8,0
	bts r12,2
	ret
MTC_LB_411:
	mov r15,0
LB_419:
	cmp r15,0
	jz LB_420
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_419
LB_420:
; _none {  } ⊢ %_409 : %_409
 ; {>  %_406~0':_r64 %_404~3':_r64 %_405~2':_r64 %_407~4':_r64 %_403~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_409
 ; {>  %_406~0':_r64 %_404~3':_r64 %_405~2':_r64 %_409~°1◂{  }:(_opn)◂(t213'(0)) %_407~4':_r64 %_403~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_421
	mov rdi,r13
	call dlt
LB_421:
	bt r12,3
	jc LB_422
	mov rdi,r9
	call dlt
LB_422:
	bt r12,2
	jc LB_423
	mov rdi,r8
	call dlt
LB_423:
	bt r12,4
	jc LB_424
	mov rdi,r10
	call dlt
LB_424:
	bt r12,1
	jc LB_425
	mov rdi,r14
	call dlt
LB_425:
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
MTC_LB_418:
LB_426:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_428
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_427
LB_428:
	add rsp,8
	ret
LB_429:
	add rsp,16
	pop r14
LB_427:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_437:
NS_E_RDI_437:
NS_E_437_ETR_TBL:
NS_E_437_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_468
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
	push LB_465
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_439 : %_439
 ; {>  %_438~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_439
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_440 : %_440
 ; {>  %_438~0':_r64 %_439~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_440
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_438 %_439 } ⊢ { %_441 %_442 %_443 } : { %_441 %_442 %_443 }
 ; {>  %_440~2':_r64 %_438~0':_r64 %_439~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_440 %_441 } ⊢ { %_444 %_445 %_446 } : { %_444 %_445 %_446 }
 ; {>  %_440~2':_r64 %_442~1':_r64 %_441~0':_r64 %_443~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_449:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_450
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_450
LB_451:
	cmp r15,0
	jz LB_452
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_451
LB_452:
; _some %_445 ⊢ %_447 : %_447
 ; {>  %_442~1':_r64 %_445~0':_r64 %_444~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_447
 ; {>  %_447~°0◂0':(_opn)◂(_r64) %_442~1':_r64 %_444~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_453
	mov rdi,r14
	call dlt
LB_453:
	bt r12,2
	jc LB_454
	mov rdi,r8
	call dlt
LB_454:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_455
	btr r12,3
	jmp LB_456
LB_455:
	bts r12,3
LB_456:
	mov r8,0
	bts r12,2
	ret
MTC_LB_450:
	mov r15,0
LB_458:
	cmp r15,0
	jz LB_459
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_458
LB_459:
; _none {  } ⊢ %_448 : %_448
 ; {>  %_442~1':_r64 %_446~4':_r64 %_445~0':_r64 %_443~3':_r64 %_444~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_448
 ; {>  %_448~°1◂{  }:(_opn)◂(t240'(0)) %_442~1':_r64 %_446~4':_r64 %_445~0':_r64 %_443~3':_r64 %_444~2':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_460
	mov rdi,r14
	call dlt
LB_460:
	bt r12,4
	jc LB_461
	mov rdi,r10
	call dlt
LB_461:
	bt r12,0
	jc LB_462
	mov rdi,r13
	call dlt
LB_462:
	bt r12,3
	jc LB_463
	mov rdi,r9
	call dlt
LB_463:
	bt r12,2
	jc LB_464
	mov rdi,r8
	call dlt
LB_464:
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
MTC_LB_457:
LB_465:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_467
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_466
LB_467:
	add rsp,8
	ret
LB_468:
	add rsp,16
	pop r14
LB_466:
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
	sub rsp,16
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_513
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_507
LB_513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_508
	btr r12,0
	jmp LB_509
LB_508:
	bts r12,0
LB_509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_504
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_478 : %_478
 ; {>  %_477~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_478
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_479 : %_479
 ; {>  %_478~1':_r64 %_477~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_479
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_477 %_478 } ⊢ { %_480 %_481 %_482 } : { %_480 %_481 %_482 }
 ; {>  %_479~2':_r64 %_478~1':_r64 %_477~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_479 %_480 } ⊢ { %_483 %_484 %_485 } : { %_483 %_484 %_485 }
 ; {>  %_480~0':_r64 %_482~3':_r64 %_479~2':_r64 %_481~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_488:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_489
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_489
LB_490:
	cmp r15,0
	jz LB_491
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_490
LB_491:
; _some %_484 ⊢ %_486 : %_486
 ; {>  %_484~0':_r64 %_483~2':_r64 %_481~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_486
 ; {>  %_486~°0◂0':(_opn)◂(_r64) %_483~2':_r64 %_481~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_492
	mov rdi,r8
	call dlt
LB_492:
	bt r12,1
	jc LB_493
	mov rdi,r14
	call dlt
LB_493:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_494
	btr r12,3
	jmp LB_495
LB_494:
	bts r12,3
LB_495:
	mov r8,0
	bts r12,2
	ret
MTC_LB_489:
	mov r15,0
LB_497:
	cmp r15,0
	jz LB_498
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_497
LB_498:
; _none {  } ⊢ %_487 : %_487
 ; {>  %_484~0':_r64 %_482~3':_r64 %_485~4':_r64 %_483~2':_r64 %_481~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_487
 ; {>  %_484~0':_r64 %_482~3':_r64 %_487~°1◂{  }:(_opn)◂(t267'(0)) %_485~4':_r64 %_483~2':_r64 %_481~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_499
	mov rdi,r13
	call dlt
LB_499:
	bt r12,3
	jc LB_500
	mov rdi,r9
	call dlt
LB_500:
	bt r12,4
	jc LB_501
	mov rdi,r10
	call dlt
LB_501:
	bt r12,2
	jc LB_502
	mov rdi,r8
	call dlt
LB_502:
	bt r12,1
	jc LB_503
	mov rdi,r14
	call dlt
LB_503:
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
MTC_LB_496:
LB_504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_506
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_505
LB_506:
	add rsp,8
	ret
LB_507:
	add rsp,16
	pop r14
LB_505:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_515:
NS_E_RDI_515:
NS_E_515_ETR_TBL:
NS_E_515_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_476_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_531
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_525
LB_531:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_526
	btr r12,0
	jmp LB_527
LB_526:
	bts r12,0
LB_527:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_522
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_516 ⊢ %_517 : %_517
 ; {>  %_516~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_517
 ; {>  %_517~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_520
	btr r12,3
	jmp LB_521
LB_520:
	bts r12,3
LB_521:
	mov r8,0
	bts r12,2
	ret
LB_522:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_524
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_523
LB_524:
	add rsp,8
	ret
LB_525:
	add rsp,16
	pop r14
LB_523:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_437_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_544
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_538
LB_544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_539
	btr r12,0
	jmp LB_540
LB_539:
	bts r12,0
LB_540:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_535
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_518 ⊢ %_519 : %_519
 ; {>  %_518~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_519
 ; {>  %_519~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_533
	btr r12,3
	jmp LB_534
LB_533:
	bts r12,3
LB_534:
	mov r8,0
	bts r12,2
	ret
LB_535:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_537
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_536
LB_537:
	add rsp,8
	ret
LB_538:
	add rsp,16
	pop r14
LB_536:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_546:
NS_E_RDI_546:
NS_E_546_ETR_TBL:
NS_E_546_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_515_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_591
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_583
LB_591:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_547_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_596
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_597
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_597:
	jmp LB_583
LB_596:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_586
	btr r12,1
	jmp LB_587
LB_586:
	bts r12,1
LB_587:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_584
	btr r12,0
	jmp LB_585
LB_584:
	bts r12,0
LB_585:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_580
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_549 %_550 } ⊢ %_551 : %_551
 ; {>  %_549~0':_r64 %_550~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f168 %_551 ⊢ %_552 : %_552
 ; {>  %_551~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f168 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_566
	btr r12,2
	jmp LB_567
LB_566:
	bts r12,2
LB_567:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_572
	btr r12,3
	jmp LB_573
LB_572:
	bts r12,3
LB_573:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_570
	btr QWORD [rdi],0
	jmp LB_571
LB_570:
	bts QWORD [rdi],0
LB_571:
	mov r9,r14
	bt r12,1
	jc LB_576
	btr r12,3
	jmp LB_577
LB_576:
	bts r12,3
LB_577:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_574
	btr QWORD [rdi],1
	jmp LB_575
LB_574:
	bts QWORD [rdi],1
LB_575:
	mov rsi,1
	bt r12,0
	jc LB_568
	mov rsi,0
	bt r13,0
	jc LB_568
	jmp LB_569
LB_568:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_569:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_168
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_552 ⊢ %_553 : %_553
 ; {>  %_552~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_553
 ; {>  %_553~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_578
	btr r12,3
	jmp LB_579
LB_578:
	bts r12,3
LB_579:
	mov r8,0
	bts r12,2
	ret
LB_580:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_582
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_581
LB_582:
	add rsp,8
	ret
LB_583:
	add rsp,32
	pop r14
LB_581:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_547:
NS_E_RDI_547:
NS_E_547_ETR_TBL:
NS_E_547_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_620
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_612
LB_620:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_547_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_625
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_626
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_626:
	jmp LB_612
LB_625:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_615
	btr r12,1
	jmp LB_616
LB_615:
	bts r12,1
LB_616:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_613
	btr r12,0
	jmp LB_614
LB_613:
	bts r12,0
LB_614:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_609
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_554 %_555 } ⊢ %_556 : %_556
 ; {>  %_555~1':(_lst)◂(_r64) %_554~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_556 ⊢ %_557 : %_557
 ; {>  %_556~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_557
 ; {>  %_557~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_603
	btr r12,2
	jmp LB_604
LB_603:
	bts r12,2
LB_604:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_601
	btr QWORD [rdi],0
	jmp LB_602
LB_601:
	bts QWORD [rdi],0
LB_602:
	mov r8,r14
	bt r12,1
	jc LB_607
	btr r12,2
	jmp LB_608
LB_607:
	bts r12,2
LB_608:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_605
	btr QWORD [rdi],1
	jmp LB_606
LB_605:
	bts QWORD [rdi],1
LB_606:
	mov rsi,1
	bt r12,3
	jc LB_599
	mov rsi,0
	bt r9,0
	jc LB_599
	jmp LB_600
LB_599:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_600:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_609:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_611
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_610
LB_611:
	add rsp,8
	ret
LB_612:
	add rsp,32
	pop r14
LB_610:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_630
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_558 : %_558
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_558 ⊢ %_559 : %_559
 ; {>  %_558~°1◂{  }:(_lst)◂(t311'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_559
 ; {>  %_559~°0◂°1◂{  }:(_opn)◂((_lst)◂(t314'(0))) }
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
	jc LB_628
	mov rsi,0
	bt r9,0
	jc LB_628
	jmp LB_629
LB_628:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_629:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_630:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_632
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_631
LB_632:
	add rsp,8
	ret
LB_633:
	add rsp,0
	pop r14
LB_631:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_548:
NS_E_RDI_548:
NS_E_548_ETR_TBL:
NS_E_548_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_515_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_645
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_639
LB_645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_640
	btr r12,0
	jmp LB_641
LB_640:
	bts r12,0
LB_641:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_636
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_560 ⊢ %_561 : %_561
 ; {>  %_560~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_561
 ; {>  %_561~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_634
	btr r12,3
	jmp LB_635
LB_634:
	bts r12,3
LB_635:
	mov r8,0
	bts r12,2
	ret
LB_636:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_638
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_637
LB_638:
	add rsp,8
	ret
LB_639:
	add rsp,16
	pop r14
LB_637:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_398_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_658
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_652
LB_658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_653
	btr r12,0
	jmp LB_654
LB_653:
	bts r12,0
LB_654:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_649
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_562 ⊢ %_563 : %_563
 ; {>  %_562~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_563
 ; {>  %_563~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_647
	btr r12,3
	jmp LB_648
LB_647:
	bts r12,3
LB_648:
	mov r8,0
	bts r12,2
	ret
LB_649:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_651
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_650
LB_651:
	add rsp,8
	ret
LB_652:
	add rsp,16
	pop r14
LB_650:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_673
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_673
	jmp LB_674
LB_673:
	jmp LB_665
LB_674:
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
	jc LB_666
	btr r12,0
	jmp LB_667
LB_666:
	bts r12,0
LB_667:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_662
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_564 : %_564
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_564
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_564 ⊢ %_565 : %_565
 ; {>  %_564~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_565
 ; {>  %_565~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_660
	btr r12,3
	jmp LB_661
LB_660:
	bts r12,3
LB_661:
	mov r8,0
	bts r12,2
	ret
LB_662:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_664
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_663
LB_664:
	add rsp,8
	ret
LB_665:
	add rsp,16
	pop r14
LB_663:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_675:
NS_E_RDI_675:
NS_E_675_ETR_TBL:
NS_E_675_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_696
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_696
	jmp LB_697
LB_696:
	jmp LB_686
LB_697:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_547_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_701
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_702:
	jmp LB_686
LB_701:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_689
	btr r12,1
	jmp LB_690
LB_689:
	bts r12,1
LB_690:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_687
	btr r12,0
	jmp LB_688
LB_687:
	bts r12,0
LB_688:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_683
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_704
	btr r12,2
	jmp LB_705
LB_704:
	bts r12,2
LB_705:
	mov r13,r14
	bt r12,1
	jc LB_706
	btr r12,0
	jmp LB_707
LB_706:
	bts r12,0
LB_707:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f168 %_676 ⊢ %_677 : %_677
 ; {>  %_676~0':(_lst)◂(_r64) }
; _f168 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_168
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_677 ⊢ %_678 : %_678
 ; {>  %_677~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_678
 ; {>  %_678~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_681
	btr r12,3
	jmp LB_682
LB_681:
	bts r12,3
LB_682:
	mov r8,0
	bts r12,2
	ret
LB_683:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_685
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_684
LB_685:
	add rsp,8
	ret
LB_686:
	add rsp,32
	pop r14
LB_684:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_719
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_713
LB_719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_714
	btr r12,0
	jmp LB_715
LB_714:
	bts r12,0
LB_715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_710
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_679 ⊢ %_680 : %_680
 ; {>  %_679~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_680
 ; {>  %_680~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_708
	btr r12,3
	jmp LB_709
LB_708:
	bts r12,3
LB_709:
	mov r8,0
	bts r12,2
	ret
LB_710:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_712
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_711
LB_712:
	add rsp,8
	ret
LB_713:
	add rsp,16
	pop r14
LB_711:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_722:
NS_E_RDI_722:
NS_E_722_ETR_TBL:
NS_E_722_TBL:
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
LB_731:
	jmp LB_728
LB_727:
	add r14,1
LB_728:
	cmp r14,r10
	jge LB_729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_727
	cmp al,10
	jz LB_727
	cmp al,32
	jz LB_727
LB_729:
	push r10
	push rsi
	call NS_E_546_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_730
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_732
	bts QWORD [rax],0
LB_732:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_731
LB_730:
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
	jc LB_725
	btr QWORD [rdi],0
LB_725:
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
LB_724:
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
NS_E_744:
; 	|» 0'
NS_E_RDI_744:
MTC_LB_745:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_746
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_747
	bt QWORD [rax],0
	jc LB_748
	btr r12,3
	jmp LB_749
LB_748:
	bts r12,3
LB_749:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_747:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_752
	btr r12,4
	jmp LB_753
LB_752:
	bts r12,4
LB_753:
	mov r14,r10
	bt r12,4
	jc LB_750
	btr r12,1
	jmp LB_751
LB_750:
	bts r12,1
LB_751:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_756
	btr r12,4
	jmp LB_757
LB_756:
	bts r12,4
LB_757:
	mov r8,r10
	bt r12,4
	jc LB_754
	btr r12,2
	jmp LB_755
LB_754:
	bts r12,2
LB_755:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_758:
	cmp r15,0
	jz LB_759
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_758
LB_759:
; _f744 %_738 ⊢ %_739 : %_739
 ; {>  %_738~2':_p733 %_737~1':_stg }
; _f744 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_762
	btr r12,0
	jmp LB_763
LB_762:
	bts r12,0
LB_763:
	call NS_E_744
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_760
	btr r12,1
	jmp LB_761
LB_760:
	bts r12,1
LB_761:
	add rsp,16
; » _^ ..
	mov rax,1
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_742
 ; {>  %_741~0':_stg %_740~1':_stg %_742~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_764
	mov rdi,r13
	call dlt
LB_764:
	bt r12,1
	jc LB_765
	mov rdi,r14
	call dlt
LB_765:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_766
	btr r12,0
	jmp LB_767
LB_766:
	bts r12,0
LB_767:
	ret
MTC_LB_746:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_768
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_769
	bt QWORD [rax],0
	jc LB_770
	btr r12,2
	jmp LB_771
LB_770:
	bts r12,2
LB_771:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_769:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_772
	btr r12,1
	jmp LB_773
LB_772:
	bts r12,1
LB_773:
LB_774:
	cmp r15,0
	jz LB_775
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_774
LB_775:
; ∎ %_743
 ; {>  %_743~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_776
	btr r12,0
	jmp LB_777
LB_776:
	bts r12,0
LB_777:
	ret
MTC_LB_768:
NS_E_887:
; 	|» 0'
NS_E_RDI_887:
MTC_LB_888:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_889
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_890
	bt QWORD [rax],0
	jc LB_891
	btr r12,2
	jmp LB_892
LB_891:
	bts r12,2
LB_892:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_890:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_893
	btr r12,1
	jmp LB_894
LB_893:
	bts r12,1
LB_894:
LB_895:
	cmp r15,0
	jz LB_896
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_895
LB_896:
; 	» "??r" _ ⊢ 0' : %_882
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_882
 ; {>  %_882~0':_stg %_881~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_897
	mov rdi,r14
	call dlt
LB_897:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_889:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_898
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_899
	bt QWORD [rax],0
	jc LB_900
	btr r12,2
	jmp LB_901
LB_900:
	bts r12,2
LB_901:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_899:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_902
	btr r12,1
	jmp LB_903
LB_902:
	bts r12,1
LB_903:
LB_904:
	cmp r15,0
	jz LB_905
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_904
LB_905:
; 	» ".." _ ⊢ 0' : %_884
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_884
 ; {>  %_884~0':_stg %_883~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_906
	mov rdi,r14
	call dlt
LB_906:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_898:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_907
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_908
	bt QWORD [rax],0
	jc LB_909
	btr r12,2
	jmp LB_910
LB_909:
	bts r12,2
LB_910:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_908:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_911
	btr r12,1
	jmp LB_912
LB_911:
	bts r12,1
LB_912:
LB_913:
	cmp r15,0
	jz LB_914
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_913
LB_914:
; _f744 %_885 ⊢ %_886 : %_886
 ; {>  %_885~1':_p733 }
; _f744 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_915
	btr r12,0
	jmp LB_916
LB_915:
	bts r12,0
LB_916:
	call NS_E_744
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_886
 ; {>  %_886~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_907:
NS_E_1079:
; 	|» 0'
NS_E_RDI_1079:
MTC_LB_1080:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1081
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' 3' }
; 0' ⊢ °0◂{ 1' 2' 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1082
	bt QWORD [rax],0
	jc LB_1083
	btr r12,4
	jmp LB_1084
LB_1083:
	bts r12,4
LB_1084:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1082:
	mov r10,rax
; 4' ⊢ { 1' 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1087
	btr r12,5
	jmp LB_1088
LB_1087:
	bts r12,5
LB_1088:
	mov r14,r11
	bt r12,5
	jc LB_1085
	btr r12,1
	jmp LB_1086
LB_1085:
	bts r12,1
LB_1086:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1091
	btr r12,5
	jmp LB_1092
LB_1091:
	bts r12,5
LB_1092:
	mov r8,r11
	bt r12,5
	jc LB_1089
	btr r12,2
	jmp LB_1090
LB_1089:
	bts r12,2
LB_1090:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_1095
	btr r12,5
	jmp LB_1096
LB_1095:
	bts r12,5
LB_1096:
	mov r9,r11
	bt r12,5
	jc LB_1093
	btr r12,3
	jmp LB_1094
LB_1093:
	bts r12,3
LB_1094:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1097:
	cmp r15,0
	jz LB_1098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1097
LB_1098:
; _f1079 %_1057 ⊢ %_1058 : %_1058
 ; {>  %_1057~3':_p801 %_1056~2':_p802 %_1055~1':(_lst)◂(_p803) }
; _f1079 3' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1103
	btr r12,0
	jmp LB_1104
LB_1103:
	bts r12,0
LB_1104:
	call NS_E_1079
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1101
	btr r12,2
	jmp LB_1102
LB_1101:
	bts r12,2
LB_1102:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1099
	btr r12,1
	jmp LB_1100
LB_1099:
	bts r12,1
LB_1100:
	add rsp,24
MTC_LB_1105:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1106
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂3'
; 2' ⊢ °0◂3'
	btr r12,4
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1107
	bt QWORD [rax],0
	jc LB_1108
	btr r12,4
	jmp LB_1109
LB_1108:
	bts r12,4
LB_1109:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1107:
	mov r10,rax
	mov r9,r10
	bt r12,4
	jc LB_1110
	btr r12,3
	jmp LB_1111
LB_1110:
	bts r12,3
LB_1111:
LB_1112:
	cmp r15,0
	jz LB_1113
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1112
LB_1113:
; _f1079 %_1059 ⊢ %_1060 : %_1060
 ; {>  %_1058~0':_stg %_1059~3':_p801 %_1055~1':(_lst)◂(_p803) }
; _f1079 3' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1118
	btr r12,0
	jmp LB_1119
LB_1118:
	bts r12,0
LB_1119:
	call NS_E_1079
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1120
	btr r12,2
	jmp LB_1121
LB_1120:
	bts r12,2
LB_1121:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1116
	btr r12,1
	jmp LB_1117
LB_1116:
	bts r12,1
LB_1117:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1114
	btr r12,0
	jmp LB_1115
LB_1114:
	bts r12,0
LB_1115:
	add rsp,24
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_1063
 ; {>  %_1062~2':_stg %_1063~3':_stg %_1055~1':(_lst)◂(_p803) %_1061~0':_stg }
; 	∎ 3'
	bt r12,2
	jc LB_1122
	mov rdi,r8
	call dlt
LB_1122:
	bt r12,1
	jc LB_1123
	mov rdi,r14
	call dlt
LB_1123:
	bt r12,0
	jc LB_1124
	mov rdi,r13
	call dlt
LB_1124:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1125
	btr r12,0
	jmp LB_1126
LB_1125:
	bts r12,0
LB_1126:
	ret
MTC_LB_1106:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1127
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂3'
; 2' ⊢ °1◂3'
	btr r12,4
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1128
	bt QWORD [rax],0
	jc LB_1129
	btr r12,4
	jmp LB_1130
LB_1129:
	bts r12,4
LB_1130:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1128:
	mov r10,rax
	mov r9,r10
	bt r12,4
	jc LB_1131
	btr r12,3
	jmp LB_1132
LB_1131:
	bts r12,3
LB_1132:
LB_1133:
	cmp r15,0
	jz LB_1134
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1133
LB_1134:
; _f1053 %_1064 ⊢ %_1065 : %_1065
 ; {>  %_1058~0':_stg %_1064~3':_p800 %_1055~1':(_lst)◂(_p803) }
; _f1053 3' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1139
	btr r12,0
	jmp LB_1140
LB_1139:
	bts r12,0
LB_1140:
	call NS_E_1053
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1141
	btr r12,2
	jmp LB_1142
LB_1141:
	bts r12,2
LB_1142:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1137
	btr r12,1
	jmp LB_1138
LB_1137:
	bts r12,1
LB_1138:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1135
	btr r12,0
	jmp LB_1136
LB_1135:
	bts r12,0
LB_1136:
	add rsp,24
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_1068
 ; {>  %_1068~3':_stg %_1066~0':_stg %_1067~2':_stg %_1055~1':(_lst)◂(_p803) }
; 	∎ 3'
	bt r12,0
	jc LB_1143
	mov rdi,r13
	call dlt
LB_1143:
	bt r12,2
	jc LB_1144
	mov rdi,r8
	call dlt
LB_1144:
	bt r12,1
	jc LB_1145
	mov rdi,r14
	call dlt
LB_1145:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1146
	btr r12,0
	jmp LB_1147
LB_1146:
	bts r12,0
LB_1147:
	ret
MTC_LB_1127:
MTC_LB_1081:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1148
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' }
; 0' ⊢ °1◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1149
	bt QWORD [rax],0
	jc LB_1150
	btr r12,3
	jmp LB_1151
LB_1150:
	bts r12,3
LB_1151:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1149:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1154
	btr r12,4
	jmp LB_1155
LB_1154:
	bts r12,4
LB_1155:
	mov r14,r10
	bt r12,4
	jc LB_1152
	btr r12,1
	jmp LB_1153
LB_1152:
	bts r12,1
LB_1153:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1158
	btr r12,4
	jmp LB_1159
LB_1158:
	bts r12,4
LB_1159:
	mov r8,r10
	bt r12,4
	jc LB_1156
	btr r12,2
	jmp LB_1157
LB_1156:
	bts r12,2
LB_1157:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1160:
	cmp r15,0
	jz LB_1161
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1160
LB_1161:
MTC_LB_1162:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1163
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °0◂0'
; 2' ⊢ °0◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1164
	bt QWORD [rax],0
	jc LB_1165
	btr r12,3
	jmp LB_1166
LB_1165:
	bts r12,3
LB_1166:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1164:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_1167
	btr r12,0
	jmp LB_1168
LB_1167:
	bts r12,0
LB_1168:
LB_1169:
	cmp r15,0
	jz LB_1170
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1169
LB_1170:
; _f1079 %_1071 ⊢ %_1072 : %_1072
 ; {>  %_1071~0':_p801 %_1069~1':(_lst)◂(_p803) }
; _f1079 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1079
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1171
	btr r12,1
	jmp LB_1172
LB_1171:
	bts r12,1
LB_1172:
	add rsp,16
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_1074
 ; {>  %_1074~2':_stg %_1073~0':_stg %_1069~1':(_lst)◂(_p803) }
; 	∎ 2'
	bt r12,0
	jc LB_1173
	mov rdi,r13
	call dlt
LB_1173:
	bt r12,1
	jc LB_1174
	mov rdi,r14
	call dlt
LB_1174:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1175
	btr r12,0
	jmp LB_1176
LB_1175:
	bts r12,0
LB_1176:
	ret
MTC_LB_1163:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1177
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °1◂0'
; 2' ⊢ °1◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1178
	bt QWORD [rax],0
	jc LB_1179
	btr r12,3
	jmp LB_1180
LB_1179:
	bts r12,3
LB_1180:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1178:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_1181
	btr r12,0
	jmp LB_1182
LB_1181:
	bts r12,0
LB_1182:
LB_1183:
	cmp r15,0
	jz LB_1184
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1183
LB_1184:
; _f1053 %_1075 ⊢ %_1076 : %_1076
 ; {>  %_1069~1':(_lst)◂(_p803) %_1075~0':_p800 }
; _f1053 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_1053
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1185
	btr r12,1
	jmp LB_1186
LB_1185:
	bts r12,1
LB_1186:
	add rsp,16
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_1078
 ; {>  %_1078~2':_stg %_1077~0':_stg %_1069~1':(_lst)◂(_p803) }
; 	∎ 2'
	bt r12,0
	jc LB_1187
	mov rdi,r13
	call dlt
LB_1187:
	bt r12,1
	jc LB_1188
	mov rdi,r14
	call dlt
LB_1188:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1189
	btr r12,0
	jmp LB_1190
LB_1189:
	bts r12,0
LB_1190:
	ret
MTC_LB_1177:
MTC_LB_1148:
NS_E_1053:
; 	|» 0'
NS_E_RDI_1053:
MTC_LB_1191:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1192
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' 3' } 4' }
; 0' ⊢ °0◂{ { 1' 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1193
	bt QWORD [rax],0
	jc LB_1194
	btr r12,5
	jmp LB_1195
LB_1194:
	bts r12,5
LB_1195:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1193:
	mov r11,rax
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1208
	btr r12,6
	jmp LB_1209
LB_1208:
	bts r12,6
LB_1209:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1198
	btr r12,4
	jmp LB_1199
LB_1198:
	bts r12,4
LB_1199:
	mov r14,r10
	bt r12,4
	jc LB_1196
	btr r12,1
	jmp LB_1197
LB_1196:
	bts r12,1
LB_1197:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1202
	btr r12,4
	jmp LB_1203
LB_1202:
	bts r12,4
LB_1203:
	mov r8,r10
	bt r12,4
	jc LB_1200
	btr r12,2
	jmp LB_1201
LB_1200:
	bts r12,2
LB_1201:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_1206
	btr r12,4
	jmp LB_1207
LB_1206:
	bts r12,4
LB_1207:
	mov r9,r10
	bt r12,4
	jc LB_1204
	btr r12,3
	jmp LB_1205
LB_1204:
	bts r12,3
LB_1205:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1212
	btr r12,6
	jmp LB_1213
LB_1212:
	bts r12,6
LB_1213:
	mov r10,rcx
	bt r12,6
	jc LB_1210
	btr r12,4
	jmp LB_1211
LB_1210:
	bts r12,4
LB_1211:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1214:
	cmp r15,0
	jz LB_1215
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1214
LB_1215:
; _f1053 %_1045 ⊢ %_1046 : %_1046
 ; {>  %_1045~4':_p800 %_1044~{ 1' 2' 3' }:{ _p805 _p796 _p797 } }
; _f1053 4' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1222
	btr r12,0
	jmp LB_1223
LB_1222:
	bts r12,0
LB_1223:
	call NS_E_1053
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1220
	btr r12,3
	jmp LB_1221
LB_1220:
	bts r12,3
LB_1221:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1218
	btr r12,2
	jmp LB_1219
LB_1218:
	bts r12,2
LB_1219:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1216
	btr r12,1
	jmp LB_1217
LB_1216:
	bts r12,1
LB_1217:
	add rsp,32
; » _^ ..
	mov rax,13
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; ".. .. \226\138\162 ..\n"
	mov rsi,0x_8a_e2_20_2e_2e_20_2e_2e
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r10,rax
	btr r12,4
; ∎ %_1048
 ; {>  %_1047~0':_stg %_1044~{ 1' 2' 3' }:{ _p805 _p796 _p797 } %_1048~4':_stg }
; 	∎ 4'
	bt r12,0
	jc LB_1224
	mov rdi,r13
	call dlt
LB_1224:
	bt r12,1
	jc LB_1225
	mov rdi,r14
	call dlt
LB_1225:
	bt r12,2
	jc LB_1226
	mov rdi,r8
	call dlt
LB_1226:
	bt r12,3
	jc LB_1227
	mov rdi,r9
	call dlt
LB_1227:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1228
	btr r12,0
	jmp LB_1229
LB_1228:
	bts r12,0
LB_1229:
	ret
MTC_LB_1192:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1230
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1231
	bt QWORD [rax],0
	jc LB_1232
	btr r12,2
	jmp LB_1233
LB_1232:
	bts r12,2
LB_1233:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1231:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1234
	btr r12,1
	jmp LB_1235
LB_1234:
	bts r12,1
LB_1235:
LB_1236:
	cmp r15,0
	jz LB_1237
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1236
LB_1237:
; _f1079 %_1049 ⊢ %_1050 : %_1050
 ; {>  %_1049~1':_p801 }
; _f1079 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1238
	btr r12,0
	jmp LB_1239
LB_1238:
	bts r12,0
LB_1239:
	call NS_E_1079
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1050
 ; {>  %_1050~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1230:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1240
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1241
	bt QWORD [rax],0
	jc LB_1242
	btr r12,2
	jmp LB_1243
LB_1242:
	bts r12,2
LB_1243:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1241:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1244
	btr r12,1
	jmp LB_1245
LB_1244:
	bts r12,1
LB_1245:
LB_1246:
	cmp r15,0
	jz LB_1247
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1246
LB_1247:
; 	» "\226\136\142 ..\n" _ ⊢ 0' : %_1052
	mov rdi,7
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_0a_2e_2e_20_8e_88_e2
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1052
 ; {>  %_1051~1':_p796 %_1052~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1248
	mov rdi,r14
	call dlt
LB_1248:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1240:
NS_E_1042:
; 	|» 0'
NS_E_RDI_1042:
MTC_LB_1249:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1250
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' } 3' }
; 0' ⊢ °0◂{ { 1' 2' } 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1251
	bt QWORD [rax],0
	jc LB_1252
	btr r12,4
	jmp LB_1253
LB_1252:
	bts r12,4
LB_1253:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1251:
	mov r10,rax
; 4' ⊢ { { 1' 2' } 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1262
	btr r12,5
	jmp LB_1263
LB_1262:
	bts r12,5
LB_1263:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1256
	btr r12,3
	jmp LB_1257
LB_1256:
	bts r12,3
LB_1257:
	mov r14,r9
	bt r12,3
	jc LB_1254
	btr r12,1
	jmp LB_1255
LB_1254:
	bts r12,1
LB_1255:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1260
	btr r12,3
	jmp LB_1261
LB_1260:
	bts r12,3
LB_1261:
	mov r8,r9
	bt r12,3
	jc LB_1258
	btr r12,2
	jmp LB_1259
LB_1258:
	bts r12,2
LB_1259:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1266
	btr r12,5
	jmp LB_1267
LB_1266:
	bts r12,5
LB_1267:
	mov r9,r11
	bt r12,5
	jc LB_1264
	btr r12,3
	jmp LB_1265
LB_1264:
	bts r12,3
LB_1265:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1268:
	cmp r15,0
	jz LB_1269
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1268
LB_1269:
; _f1042 %_1036 ⊢ %_1037 : %_1037
 ; {>  %_1034~1':_stg %_1036~3':(_lst)◂({ _stg t515'(-1) }) %_1035~2':t515'(-1) }
; _f1042 3' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1274
	btr r12,0
	jmp LB_1275
LB_1274:
	bts r12,0
LB_1275:
	call NS_E_1042
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1272
	btr r12,2
	jmp LB_1273
LB_1272:
	bts r12,2
LB_1273:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1270
	btr r12,1
	jmp LB_1271
LB_1270:
	bts r12,1
LB_1271:
	add rsp,24
; » _^ ..
	mov rax,5
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_1040
 ; {>  %_1040~3':_stg %_1039~0':_stg %_1038~1':_stg %_1035~2':t515'(-1) }
; 	∎ 3'
	bt r12,0
	jc LB_1276
	mov rdi,r13
	call dlt
LB_1276:
	bt r12,1
	jc LB_1277
	mov rdi,r14
	call dlt
LB_1277:
	bt r12,2
	jc LB_1278
	mov rdi,r8
	call dlt
LB_1278:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1279
	btr r12,0
	jmp LB_1280
LB_1279:
	bts r12,0
LB_1280:
	ret
MTC_LB_1250:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1281
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1282
	bt QWORD [rax],0
	jc LB_1283
	btr r12,1
	jmp LB_1284
LB_1283:
	bts r12,1
LB_1284:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1282:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1285:
	cmp r15,0
	jz LB_1286
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1285
LB_1286:
; 	» "" _ ⊢ 0' : %_1041
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1041
 ; {>  %_1041~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1281:
NS_E_1032:
; 	|» 0'
NS_E_RDI_1032:
MTC_LB_1287:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1288
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' 3' } 4' }
; 0' ⊢ °0◂{ { 1' 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1289
	bt QWORD [rax],0
	jc LB_1290
	btr r12,5
	jmp LB_1291
LB_1290:
	bts r12,5
LB_1291:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1289:
	mov r11,rax
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1304
	btr r12,6
	jmp LB_1305
LB_1304:
	bts r12,6
LB_1305:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1294
	btr r12,4
	jmp LB_1295
LB_1294:
	bts r12,4
LB_1295:
	mov r14,r10
	bt r12,4
	jc LB_1292
	btr r12,1
	jmp LB_1293
LB_1292:
	bts r12,1
LB_1293:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1298
	btr r12,4
	jmp LB_1299
LB_1298:
	bts r12,4
LB_1299:
	mov r8,r10
	bt r12,4
	jc LB_1296
	btr r12,2
	jmp LB_1297
LB_1296:
	bts r12,2
LB_1297:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_1302
	btr r12,4
	jmp LB_1303
LB_1302:
	bts r12,4
LB_1303:
	mov r9,r10
	bt r12,4
	jc LB_1300
	btr r12,3
	jmp LB_1301
LB_1300:
	bts r12,3
LB_1301:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1308
	btr r12,6
	jmp LB_1309
LB_1308:
	bts r12,6
LB_1309:
	mov r10,rcx
	bt r12,6
	jc LB_1306
	btr r12,4
	jmp LB_1307
LB_1306:
	bts r12,4
LB_1307:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1310:
	cmp r15,0
	jz LB_1311
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1310
LB_1311:
; _f1032 %_1026 ⊢ %_1027 : %_1027
 ; {>  %_1026~4':(_lst)◂({ _stg _p797 _p800 }) %_1023~1':_stg %_1025~3':_p800 %_1024~2':_p797 }
; _f1032 4' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1318
	btr r12,0
	jmp LB_1319
LB_1318:
	bts r12,0
LB_1319:
	call NS_E_1032
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1316
	btr r12,3
	jmp LB_1317
LB_1316:
	bts r12,3
LB_1317:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1314
	btr r12,2
	jmp LB_1315
LB_1314:
	bts r12,2
LB_1315:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1312
	btr r12,1
	jmp LB_1313
LB_1312:
	bts r12,1
LB_1313:
	add rsp,32
; » _^ ..
	mov rax,5
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r10,rax
	btr r12,4
; ∎ %_1030
 ; {>  %_1025~3':_p800 %_1030~4':_stg %_1028~1':_stg %_1029~0':_stg %_1024~2':_p797 }
; 	∎ 4'
	bt r12,3
	jc LB_1320
	mov rdi,r9
	call dlt
LB_1320:
	bt r12,1
	jc LB_1321
	mov rdi,r14
	call dlt
LB_1321:
	bt r12,0
	jc LB_1322
	mov rdi,r13
	call dlt
LB_1322:
	bt r12,2
	jc LB_1323
	mov rdi,r8
	call dlt
LB_1323:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1324
	btr r12,0
	jmp LB_1325
LB_1324:
	bts r12,0
LB_1325:
	ret
MTC_LB_1288:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1326
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1327
	bt QWORD [rax],0
	jc LB_1328
	btr r12,1
	jmp LB_1329
LB_1328:
	bts r12,1
LB_1329:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1327:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1330:
	cmp r15,0
	jz LB_1331
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1330
LB_1331:
; 	» "" _ ⊢ 0' : %_1031
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1031
 ; {>  %_1031~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1326:
NS_E_1021:
; 	|» 0'
NS_E_RDI_1021:
MTC_LB_1332:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1333
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1334
	bt QWORD [rax],0
	jc LB_1335
	btr r12,3
	jmp LB_1336
LB_1335:
	bts r12,3
LB_1336:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1334:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1339
	btr r12,4
	jmp LB_1340
LB_1339:
	bts r12,4
LB_1340:
	mov r14,r10
	bt r12,4
	jc LB_1337
	btr r12,1
	jmp LB_1338
LB_1337:
	bts r12,1
LB_1338:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1343
	btr r12,4
	jmp LB_1344
LB_1343:
	bts r12,4
LB_1344:
	mov r8,r10
	bt r12,4
	jc LB_1341
	btr r12,2
	jmp LB_1342
LB_1341:
	bts r12,2
LB_1342:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1345:
	cmp r15,0
	jz LB_1346
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1345
LB_1346:
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; " .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; " ..\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov r13,rax
	btr r12,0
; ∎ %_1014
 ; {>  %_1014~0':_stg %_1012~1':_p797 %_1013~2':_p800 }
; 	∎ 0'
	bt r12,1
	jc LB_1347
	mov rdi,r14
	call dlt
LB_1347:
	bt r12,2
	jc LB_1348
	mov rdi,r8
	call dlt
LB_1348:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1333:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1349
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1350
	bt QWORD [rax],0
	jc LB_1351
	btr r12,2
	jmp LB_1352
LB_1351:
	bts r12,2
LB_1352:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1350:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1353
	btr r12,1
	jmp LB_1354
LB_1353:
	bts r12,1
LB_1354:
LB_1355:
	cmp r15,0
	jz LB_1356
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1355
LB_1356:
; _f887 %_1015 ⊢ %_1016 : %_1016
 ; {>  %_1015~1':_p799 }
; _f887 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1357
	btr r12,0
	jmp LB_1358
LB_1357:
	bts r12,0
LB_1358:
	call NS_E_887
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,4
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r14,rax
	btr r12,1
; ∎ %_1018
 ; {>  %_1017~0':_stg %_1018~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1359
	mov rdi,r13
	call dlt
LB_1359:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1360
	btr r12,0
	jmp LB_1361
LB_1360:
	bts r12,0
LB_1361:
	ret
MTC_LB_1349:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1362
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1363
	bt QWORD [rax],0
	jc LB_1364
	btr r12,2
	jmp LB_1365
LB_1364:
	bts r12,2
LB_1365:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1363:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1366
	btr r12,1
	jmp LB_1367
LB_1366:
	bts r12,1
LB_1367:
LB_1368:
	cmp r15,0
	jz LB_1369
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1368
LB_1369:
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; " .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; //
	mov r13,rax
	btr r12,0
; ∎ %_1020
 ; {>  %_1019~1':_p800 %_1020~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1370
	mov rdi,r14
	call dlt
LB_1370:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1362:
NS_E_1010:
; 	|» 0'
NS_E_RDI_1010:
MTC_LB_1371:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1372
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' 3' 4' 5' 6' }
; 0' ⊢ °0◂{ 1' 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1373
	bt QWORD [rax],0
	jc LB_1374
	btr r12,7
	jmp LB_1375
LB_1374:
	bts r12,7
LB_1375:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1373:
	mov rdx,rax
; 7' ⊢ { 1' 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_1378
	btr r12,8
	jmp LB_1379
LB_1378:
	bts r12,8
LB_1379:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1376
	btr r12,1
	jmp LB_1377
LB_1376:
	bts r12,1
LB_1377:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_1382
	btr r12,8
	jmp LB_1383
LB_1382:
	bts r12,8
LB_1383:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1380
	btr r12,2
	jmp LB_1381
LB_1380:
	bts r12,2
LB_1381:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_1386
	btr r12,8
	jmp LB_1387
LB_1386:
	bts r12,8
LB_1387:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1384
	btr r12,3
	jmp LB_1385
LB_1384:
	bts r12,3
LB_1385:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_1390
	btr r12,8
	jmp LB_1391
LB_1390:
	bts r12,8
LB_1391:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_1388
	btr r12,4
	jmp LB_1389
LB_1388:
	bts r12,4
LB_1389:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
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
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],5
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
; _f1010 %_1000 ⊢ %_1001 : %_1001
 ; {>  %_999~5':(_opn)◂(_p787) %_1000~6':_p787 %_998~4':_p789 %_997~3':_p788 %_995~1':_p797 %_996~2':_p800 }
; _f1010 6' ⊢ 0'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_1412
	btr r12,0
	jmp LB_1413
LB_1412:
	bts r12,0
LB_1413:
	call NS_E_1010
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_1410
	btr r12,5
	jmp LB_1411
LB_1410:
	bts r12,5
LB_1411:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_1408
	btr r12,4
	jmp LB_1409
LB_1408:
	bts r12,4
LB_1409:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1406
	btr r12,3
	jmp LB_1407
LB_1406:
	bts r12,3
LB_1407:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1404
	btr r12,2
	jmp LB_1405
LB_1404:
	bts r12,2
LB_1405:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1402
	btr r12,1
	jmp LB_1403
LB_1402:
	bts r12,1
LB_1403:
	add rsp,48
; » _^ ..
	mov rax,15
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. \226\138\162 .. \n"
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov rcx,rax
	btr r12,6
; ∎ %_1003
 ; {>  %_999~5':(_opn)◂(_p787) %_1003~6':_stg %_998~4':_p789 %_997~3':_p788 %_995~1':_p797 %_996~2':_p800 %_1002~0':_stg }
; 	∎ 6'
	bt r12,5
	jc LB_1414
	mov rdi,r11
	call dlt
LB_1414:
	bt r12,4
	jc LB_1415
	mov rdi,r10
	call dlt
LB_1415:
	bt r12,3
	jc LB_1416
	mov rdi,r9
	call dlt
LB_1416:
	bt r12,1
	jc LB_1417
	mov rdi,r14
	call dlt
LB_1417:
	bt r12,2
	jc LB_1418
	mov rdi,r8
	call dlt
LB_1418:
	bt r12,0
	jc LB_1419
	mov rdi,r13
	call dlt
LB_1419:
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_1420
	btr r12,0
	jmp LB_1421
LB_1420:
	bts r12,0
LB_1421:
	ret
MTC_LB_1372:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1422
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' 3' 4' 5' }
; 0' ⊢ °1◂{ 1' 2' 3' 4' 5' }
	btr r12,6
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1423
	bt QWORD [rax],0
	jc LB_1424
	btr r12,6
	jmp LB_1425
LB_1424:
	bts r12,6
LB_1425:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1423:
	mov rcx,rax
; 6' ⊢ { 1' 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_1428
	btr r12,7
	jmp LB_1429
LB_1428:
	bts r12,7
LB_1429:
	mov r14,rdx
	bt r12,7
	jc LB_1426
	btr r12,1
	jmp LB_1427
LB_1426:
	bts r12,1
LB_1427:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_1432
	btr r12,7
	jmp LB_1433
LB_1432:
	bts r12,7
LB_1433:
	mov r8,rdx
	bt r12,7
	jc LB_1430
	btr r12,2
	jmp LB_1431
LB_1430:
	bts r12,2
LB_1431:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_1436
	btr r12,7
	jmp LB_1437
LB_1436:
	bts r12,7
LB_1437:
	mov r9,rdx
	bt r12,7
	jc LB_1434
	btr r12,3
	jmp LB_1435
LB_1434:
	bts r12,3
LB_1435:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_1440
	btr r12,7
	jmp LB_1441
LB_1440:
	bts r12,7
LB_1441:
	mov r10,rdx
	bt r12,7
	jc LB_1438
	btr r12,4
	jmp LB_1439
LB_1438:
	bts r12,4
LB_1439:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*4]
	mov rdx,rax
	bt QWORD [rdi],4
	jc LB_1444
	btr r12,7
	jmp LB_1445
LB_1444:
	bts r12,7
LB_1445:
	mov r11,rdx
	bt r12,7
	jc LB_1442
	btr r12,5
	jmp LB_1443
LB_1442:
	bts r12,5
LB_1443:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1446:
	cmp r15,0
	jz LB_1447
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1446
LB_1447:
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. \n"
	mov rsi,0x_0a_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; ∎ %_1009
 ; {>  %_1009~0':_stg %_1006~3':_p788 %_1007~4':_p789 %_1008~5':(_opn)◂(_p787) %_1004~1':_p797 %_1005~2':_p800 }
; 	∎ 0'
	bt r12,3
	jc LB_1448
	mov rdi,r9
	call dlt
LB_1448:
	bt r12,4
	jc LB_1449
	mov rdi,r10
	call dlt
LB_1449:
	bt r12,5
	jc LB_1450
	mov rdi,r11
	call dlt
LB_1450:
	bt r12,1
	jc LB_1451
	mov rdi,r14
	call dlt
LB_1451:
	bt r12,2
	jc LB_1452
	mov rdi,r8
	call dlt
LB_1452:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1422:
NS_E_993:
; 	|» 0'
NS_E_RDI_993:
MTC_LB_1453:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1454
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' 3' 4' 5' }
; 0' ⊢ °0◂{ 1' 2' 3' 4' 5' }
	btr r12,6
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1455
	bt QWORD [rax],0
	jc LB_1456
	btr r12,6
	jmp LB_1457
LB_1456:
	bts r12,6
LB_1457:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1455:
	mov rcx,rax
; 6' ⊢ { 1' 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_1460
	btr r12,7
	jmp LB_1461
LB_1460:
	bts r12,7
LB_1461:
	mov r14,rdx
	bt r12,7
	jc LB_1458
	btr r12,1
	jmp LB_1459
LB_1458:
	bts r12,1
LB_1459:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_1464
	btr r12,7
	jmp LB_1465
LB_1464:
	bts r12,7
LB_1465:
	mov r8,rdx
	bt r12,7
	jc LB_1462
	btr r12,2
	jmp LB_1463
LB_1462:
	bts r12,2
LB_1463:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_1468
	btr r12,7
	jmp LB_1469
LB_1468:
	bts r12,7
LB_1469:
	mov r9,rdx
	bt r12,7
	jc LB_1466
	btr r12,3
	jmp LB_1467
LB_1466:
	bts r12,3
LB_1467:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_1472
	btr r12,7
	jmp LB_1473
LB_1472:
	bts r12,7
LB_1473:
	mov r10,rdx
	bt r12,7
	jc LB_1470
	btr r12,4
	jmp LB_1471
LB_1470:
	bts r12,4
LB_1471:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*4]
	mov rdx,rax
	bt QWORD [rdi],4
	jc LB_1476
	btr r12,7
	jmp LB_1477
LB_1476:
	bts r12,7
LB_1477:
	mov r11,rdx
	bt r12,7
	jc LB_1474
	btr r12,5
	jmp LB_1475
LB_1474:
	bts r12,5
LB_1475:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1478:
	cmp r15,0
	jz LB_1479
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1478
LB_1479:
; _f993 %_984 ⊢ %_985 : %_985
 ; {>  %_982~3':_p789 %_980~1':(_opn)◂(_stg) %_983~4':(_opn)◂(_p786) %_984~5':_p786 %_981~2':_p788 }
; _f993 5' ⊢ 0'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_1488
	btr r12,0
	jmp LB_1489
LB_1488:
	bts r12,0
LB_1489:
	call NS_E_993
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_1486
	btr r12,4
	jmp LB_1487
LB_1486:
	bts r12,4
LB_1487:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1484
	btr r12,3
	jmp LB_1485
LB_1484:
	bts r12,3
LB_1485:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1482
	btr r12,2
	jmp LB_1483
LB_1482:
	bts r12,2
LB_1483:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1480
	btr r12,1
	jmp LB_1481
LB_1480:
	bts r12,1
LB_1481:
	add rsp,40
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r11,rax
	btr r12,5
; ∎ %_987
 ; {>  %_982~3':_p789 %_987~5':_stg %_980~1':(_opn)◂(_stg) %_983~4':(_opn)◂(_p786) %_986~0':_stg %_981~2':_p788 }
; 	∎ 5'
	bt r12,3
	jc LB_1490
	mov rdi,r9
	call dlt
LB_1490:
	bt r12,1
	jc LB_1491
	mov rdi,r14
	call dlt
LB_1491:
	bt r12,4
	jc LB_1492
	mov rdi,r10
	call dlt
LB_1492:
	bt r12,0
	jc LB_1493
	mov rdi,r13
	call dlt
LB_1493:
	bt r12,2
	jc LB_1494
	mov rdi,r8
	call dlt
LB_1494:
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_1495
	btr r12,0
	jmp LB_1496
LB_1495:
	bts r12,0
LB_1496:
	ret
MTC_LB_1454:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1497
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' 3' 4' }
; 0' ⊢ °1◂{ 1' 2' 3' 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
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
; 5' ⊢ { 1' 2' 3' 4' }
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
	mov r14,rcx
	bt r12,6
	jc LB_1501
	btr r12,1
	jmp LB_1502
LB_1501:
	bts r12,1
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
	mov r8,rcx
	bt r12,6
	jc LB_1505
	btr r12,2
	jmp LB_1506
LB_1505:
	bts r12,2
LB_1506:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_1511
	btr r12,6
	jmp LB_1512
LB_1511:
	bts r12,6
LB_1512:
	mov r9,rcx
	bt r12,6
	jc LB_1509
	btr r12,3
	jmp LB_1510
LB_1509:
	bts r12,3
LB_1510:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*3]
	mov rcx,rax
	bt QWORD [rdi],3
	jc LB_1515
	btr r12,6
	jmp LB_1516
LB_1515:
	bts r12,6
LB_1516:
	mov r10,rcx
	bt r12,6
	jc LB_1513
	btr r12,4
	jmp LB_1514
LB_1513:
	bts r12,4
LB_1514:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1517:
	cmp r15,0
	jz LB_1518
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1517
LB_1518:
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. \n"
	mov rsi,0x_0a_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; ∎ %_992
 ; {>  %_990~3':_p789 %_992~0':_stg %_988~1':(_opn)◂(_stg) %_991~4':(_opn)◂(_p786) %_989~2':_p788 }
; 	∎ 0'
	bt r12,3
	jc LB_1519
	mov rdi,r9
	call dlt
LB_1519:
	bt r12,1
	jc LB_1520
	mov rdi,r14
	call dlt
LB_1520:
	bt r12,4
	jc LB_1521
	mov rdi,r10
	call dlt
LB_1521:
	bt r12,2
	jc LB_1522
	mov rdi,r8
	call dlt
LB_1522:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1497:
NS_E_978:
; 	|» 0'
NS_E_RDI_978:
MTC_LB_1523:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1524
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1525
	bt QWORD [rax],0
	jc LB_1526
	btr r12,2
	jmp LB_1527
LB_1526:
	bts r12,2
LB_1527:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1525:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1528
	btr r12,1
	jmp LB_1529
LB_1528:
	bts r12,1
LB_1529:
LB_1530:
	cmp r15,0
	jz LB_1531
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1530
LB_1531:
; _f993 %_974 ⊢ %_975 : %_975
 ; {>  %_974~1':_p786 }
; _f993 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1532
	btr r12,0
	jmp LB_1533
LB_1532:
	bts r12,0
LB_1533:
	call NS_E_993
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_975
 ; {>  %_975~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1524:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1534
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1535
	bt QWORD [rax],0
	jc LB_1536
	btr r12,2
	jmp LB_1537
LB_1536:
	bts r12,2
LB_1537:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1535:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1538
	btr r12,1
	jmp LB_1539
LB_1538:
	bts r12,1
LB_1539:
LB_1540:
	cmp r15,0
	jz LB_1541
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1540
LB_1541:
; _f1010 %_976 ⊢ %_977 : %_977
 ; {>  %_976~1':_p787 }
; _f1010 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1542
	btr r12,0
	jmp LB_1543
LB_1542:
	bts r12,0
LB_1543:
	call NS_E_1010
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_977
 ; {>  %_977~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1534:
NS_E_972:
; 	|» 0'
NS_E_RDI_972:
MTC_LB_1544:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1545
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' } 3' }
; 0' ⊢ °0◂{ { 1' 2' } 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1546
	bt QWORD [rax],0
	jc LB_1547
	btr r12,4
	jmp LB_1548
LB_1547:
	bts r12,4
LB_1548:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1546:
	mov r10,rax
; 4' ⊢ { { 1' 2' } 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1557
	btr r12,5
	jmp LB_1558
LB_1557:
	bts r12,5
LB_1558:
; 5' ⊢ { 1' 2' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1551
	btr r12,3
	jmp LB_1552
LB_1551:
	bts r12,3
LB_1552:
	mov r14,r9
	bt r12,3
	jc LB_1549
	btr r12,1
	jmp LB_1550
LB_1549:
	bts r12,1
LB_1550:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1555
	btr r12,3
	jmp LB_1556
LB_1555:
	bts r12,3
LB_1556:
	mov r8,r9
	bt r12,3
	jc LB_1553
	btr r12,2
	jmp LB_1554
LB_1553:
	bts r12,2
LB_1554:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1561
	btr r12,5
	jmp LB_1562
LB_1561:
	bts r12,5
LB_1562:
	mov r9,r11
	bt r12,5
	jc LB_1559
	btr r12,3
	jmp LB_1560
LB_1559:
	bts r12,3
LB_1560:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1563:
	cmp r15,0
	jz LB_1564
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1563
LB_1564:
; _f978 %_963 ⊢ %_965 : %_965
 ; {>  %_962~1':_stg %_963~2':_p785 %_964~3':(_lst)◂({ _stg _p785 }) }
; _f978 2' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1569
	btr r12,0
	jmp LB_1570
LB_1569:
	bts r12,0
LB_1570:
	call NS_E_978
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1567
	btr r12,3
	jmp LB_1568
LB_1567:
	bts r12,3
LB_1568:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1565
	btr r12,1
	jmp LB_1566
LB_1565:
	bts r12,1
LB_1566:
	add rsp,24
; _f972 %_964 ⊢ %_966 : %_966
 ; {>  %_965~0':_stg %_962~1':_stg %_964~3':(_lst)◂({ _stg _p785 }) }
; _f972 3' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1575
	btr r12,0
	jmp LB_1576
LB_1575:
	bts r12,0
LB_1576:
	call NS_E_972
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1577
	btr r12,2
	jmp LB_1578
LB_1577:
	bts r12,2
LB_1578:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1573
	btr r12,1
	jmp LB_1574
LB_1573:
	bts r12,1
LB_1574:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1571
	btr r12,0
	jmp LB_1572
LB_1571:
	bts r12,0
LB_1572:
	add rsp,24
; » _^ ..
	mov rax,3
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,3
; ∎ %_970
 ; {>  %_968~0':_stg %_969~2':_stg %_967~1':_stg %_970~3':_stg }
; 	∎ 3'
	bt r12,0
	jc LB_1579
	mov rdi,r13
	call dlt
LB_1579:
	bt r12,2
	jc LB_1580
	mov rdi,r8
	call dlt
LB_1580:
	bt r12,1
	jc LB_1581
	mov rdi,r14
	call dlt
LB_1581:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1582
	btr r12,0
	jmp LB_1583
LB_1582:
	bts r12,0
LB_1583:
	ret
MTC_LB_1545:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1584
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1585
	bt QWORD [rax],0
	jc LB_1586
	btr r12,1
	jmp LB_1587
LB_1586:
	bts r12,1
LB_1587:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1585:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1588:
	cmp r15,0
	jz LB_1589
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1588
LB_1589:
; 	» "" _ ⊢ 0' : %_971
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_971
 ; {>  %_971~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1584:
NS_E_960:
; 	|» 0'
NS_E_RDI_960:
MTC_LB_1590:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1592
	bt QWORD [rax],0
	jc LB_1593
	btr r12,3
	jmp LB_1594
LB_1593:
	bts r12,3
LB_1594:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1592:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1597
	btr r12,4
	jmp LB_1598
LB_1597:
	bts r12,4
LB_1598:
	mov r14,r10
	bt r12,4
	jc LB_1595
	btr r12,1
	jmp LB_1596
LB_1595:
	bts r12,1
LB_1596:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1601
	btr r12,4
	jmp LB_1602
LB_1601:
	bts r12,4
LB_1602:
	mov r8,r10
	bt r12,4
	jc LB_1599
	btr r12,2
	jmp LB_1600
LB_1599:
	bts r12,2
LB_1600:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1603:
	cmp r15,0
	jz LB_1604
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1603
LB_1604:
MTC_LB_1605:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1606
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °0◂0'
; 2' ⊢ °0◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1607
	bt QWORD [rax],0
	jc LB_1608
	btr r12,3
	jmp LB_1609
LB_1608:
	bts r12,3
LB_1609:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1607:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_1610
	btr r12,0
	jmp LB_1611
LB_1610:
	bts r12,0
LB_1611:
LB_1612:
	cmp r15,0
	jz LB_1613
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1612
LB_1613:
; _f926 %_930 ⊢ %_931 : %_931
 ; {>  %_930~0':(_lst)◂(_p781) %_928~1':_stg }
; _f926 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_926
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1614
	btr r12,1
	jmp LB_1615
LB_1614:
	bts r12,1
LB_1615:
	add rsp,16
; » _^ ..
	mov rax,13
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
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
; //
	mov r8,rax
	btr r12,2
; ∎ %_934
 ; {>  %_934~2':_stg %_933~0':_stg %_932~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1616
	mov rdi,r13
	call dlt
LB_1616:
	bt r12,1
	jc LB_1617
	mov rdi,r14
	call dlt
LB_1617:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1618
	btr r12,0
	jmp LB_1619
LB_1618:
	bts r12,0
LB_1619:
	ret
MTC_LB_1606:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1620
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °1◂0'
; 2' ⊢ °1◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1621
	bt QWORD [rax],0
	jc LB_1622
	btr r12,3
	jmp LB_1623
LB_1622:
	bts r12,3
LB_1623:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1621:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_1624
	btr r12,0
	jmp LB_1625
LB_1624:
	bts r12,0
LB_1625:
LB_1626:
	cmp r15,0
	jz LB_1627
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1626
LB_1627:
; _f744 %_935 ⊢ %_936 : %_936
 ; {>  %_935~0':_p733 %_928~1':_stg }
; _f744 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_744
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1628
	btr r12,1
	jmp LB_1629
LB_1628:
	bts r12,1
LB_1629:
	add rsp,16
; » _^ ..
	mov rax,9
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r8,rax
	btr r12,2
; ∎ %_939
 ; {>  %_937~1':_stg %_938~0':_stg %_939~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1630
	mov rdi,r14
	call dlt
LB_1630:
	bt r12,0
	jc LB_1631
	mov rdi,r13
	call dlt
LB_1631:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1632
	btr r12,0
	jmp LB_1633
LB_1632:
	bts r12,0
LB_1633:
	ret
MTC_LB_1620:
MTC_LB_1591:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1634
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1635
	bt QWORD [rax],0
	jc LB_1636
	btr r12,2
	jmp LB_1637
LB_1636:
	bts r12,2
LB_1637:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1635:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1638
	btr r12,1
	jmp LB_1639
LB_1638:
	bts r12,1
LB_1639:
LB_1640:
	cmp r15,0
	jz LB_1641
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1640
LB_1641:
; _f972 %_940 ⊢ %_941 : %_941
 ; {>  %_940~1':(_lst)◂({ _stg _p785 }) }
; _f972 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1642
	btr r12,0
	jmp LB_1643
LB_1642:
	bts r12,0
LB_1643:
	call NS_E_972
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r14,rax
	btr r12,1
; ∎ %_943
 ; {>  %_942~0':_stg %_943~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1644
	mov rdi,r13
	call dlt
LB_1644:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1645
	btr r12,0
	jmp LB_1646
LB_1645:
	bts r12,0
LB_1646:
	ret
MTC_LB_1634:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1647
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1648
	bt QWORD [rax],0
	jc LB_1649
	btr r12,3
	jmp LB_1650
LB_1649:
	bts r12,3
LB_1650:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1648:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1653
	btr r12,4
	jmp LB_1654
LB_1653:
	bts r12,4
LB_1654:
	mov r14,r10
	bt r12,4
	jc LB_1651
	btr r12,1
	jmp LB_1652
LB_1651:
	bts r12,1
LB_1652:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1657
	btr r12,4
	jmp LB_1658
LB_1657:
	bts r12,4
LB_1658:
	mov r8,r10
	bt r12,4
	jc LB_1655
	btr r12,2
	jmp LB_1656
LB_1655:
	bts r12,2
LB_1656:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1659:
	cmp r15,0
	jz LB_1660
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1659
LB_1660:
; _f1021 %_945 ⊢ %_946 : %_946
 ; {>  %_945~2':_p783 %_944~1':_stg }
; _f1021 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1663
	btr r12,0
	jmp LB_1664
LB_1663:
	bts r12,0
LB_1664:
	call NS_E_1021
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1661
	btr r12,1
	jmp LB_1662
LB_1661:
	bts r12,1
LB_1662:
	add rsp,16
; » _^ ..
	mov rax,3
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_949
 ; {>  %_948~0':_stg %_949~2':_stg %_947~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1665
	mov rdi,r13
	call dlt
LB_1665:
	bt r12,1
	jc LB_1666
	mov rdi,r14
	call dlt
LB_1666:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1667
	btr r12,0
	jmp LB_1668
LB_1667:
	bts r12,0
LB_1668:
	ret
MTC_LB_1647:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_1669
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1670
	bt QWORD [rax],0
	jc LB_1671
	btr r12,2
	jmp LB_1672
LB_1671:
	bts r12,2
LB_1672:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1670:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1673
	btr r12,1
	jmp LB_1674
LB_1673:
	bts r12,1
LB_1674:
LB_1675:
	cmp r15,0
	jz LB_1676
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1675
LB_1676:
; _f1032 %_950 ⊢ %_951 : %_951
 ; {>  %_950~1':(_lst)◂({ _stg _p797 _p800 }) }
; _f1032 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1677
	btr r12,0
	jmp LB_1678
LB_1677:
	bts r12,0
LB_1678:
	call NS_E_1032
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	mov rax,4
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; //
	mov r14,rax
	btr r12,1
; ∎ %_953
 ; {>  %_953~1':_stg %_952~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1679
	mov rdi,r13
	call dlt
LB_1679:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1680
	btr r12,0
	jmp LB_1681
LB_1680:
	bts r12,0
LB_1681:
	ret
MTC_LB_1669:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_1682
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂{ 1' 2' }
; 0' ⊢ °4◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1683
	bt QWORD [rax],0
	jc LB_1684
	btr r12,3
	jmp LB_1685
LB_1684:
	bts r12,3
LB_1685:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1683:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1688
	btr r12,4
	jmp LB_1689
LB_1688:
	bts r12,4
LB_1689:
	mov r14,r10
	bt r12,4
	jc LB_1686
	btr r12,1
	jmp LB_1687
LB_1686:
	bts r12,1
LB_1687:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1692
	btr r12,4
	jmp LB_1693
LB_1692:
	bts r12,4
LB_1693:
	mov r8,r10
	bt r12,4
	jc LB_1690
	btr r12,2
	jmp LB_1691
LB_1690:
	bts r12,2
LB_1691:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1694:
	cmp r15,0
	jz LB_1695
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1694
LB_1695:
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_957
 ; {>  %_956~1':_stg %_955~2':_p784 %_957~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_1696
	mov rdi,r14
	call dlt
LB_1696:
	bt r12,2
	jc LB_1697
	mov rdi,r8
	call dlt
LB_1697:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1682:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz MTC_LB_1698
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °5◂1'
; 0' ⊢ °5◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1699
	bt QWORD [rax],0
	jc LB_1700
	btr r12,2
	jmp LB_1701
LB_1700:
	bts r12,2
LB_1701:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1699:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_1702
	btr r12,1
	jmp LB_1703
LB_1702:
	bts r12,1
LB_1703:
LB_1704:
	cmp r15,0
	jz LB_1705
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1704
LB_1705:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 @..."
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_40
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_959
 ; {>  %_959~0':_stg %_958~1':(_lst)◂({ _stg _p784 }) }
; 	∎ 0'
	bt r12,1
	jc LB_1706
	mov rdi,r14
	call dlt
LB_1706:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1698:
NS_E_926:
; 	|» 0'
NS_E_RDI_926:
MTC_LB_1707:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1708
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1709
	bt QWORD [rax],0
	jc LB_1710
	btr r12,1
	jmp LB_1711
LB_1710:
	bts r12,1
LB_1711:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1709:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1712:
	cmp r15,0
	jz LB_1713
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1712
LB_1713:
; 	» "" _ ⊢ 0' : %_918
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_918
 ; {>  %_918~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1708:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1714
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1715
	bt QWORD [rax],0
	jc LB_1716
	btr r12,3
	jmp LB_1717
LB_1716:
	bts r12,3
LB_1717:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1715:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1720
	btr r12,4
	jmp LB_1721
LB_1720:
	bts r12,4
LB_1721:
	mov r14,r10
	bt r12,4
	jc LB_1718
	btr r12,1
	jmp LB_1719
LB_1718:
	bts r12,1
LB_1719:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1724
	btr r12,4
	jmp LB_1725
LB_1724:
	bts r12,4
LB_1725:
	mov r8,r10
	bt r12,4
	jc LB_1722
	btr r12,2
	jmp LB_1723
LB_1722:
	bts r12,2
LB_1723:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1726:
	cmp r15,0
	jz LB_1727
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1726
LB_1727:
; _f960 %_919 ⊢ %_921 : %_921
 ; {>  %_919~1':_p781 %_920~2':(_lst)◂(_p781) }
; _f960 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1730
	btr r12,0
	jmp LB_1731
LB_1730:
	bts r12,0
LB_1731:
	call NS_E_960
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1728
	btr r12,2
	jmp LB_1729
LB_1728:
	bts r12,2
LB_1729:
	add rsp,16
; _f926 %_920 ⊢ %_922 : %_922
 ; {>  %_921~0':_stg %_920~2':(_lst)◂(_p781) }
; _f926 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1734
	btr r12,0
	jmp LB_1735
LB_1734:
	bts r12,0
LB_1735:
	call NS_E_926
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1736
	btr r12,1
	jmp LB_1737
LB_1736:
	bts r12,1
LB_1737:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1732
	btr r12,0
	jmp LB_1733
LB_1732:
	bts r12,0
LB_1733:
	add rsp,16
; » _^ ..
	mov rax,0
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_925
 ; {>  %_924~1':_stg %_923~0':_stg %_925~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_1738
	mov rdi,r14
	call dlt
LB_1738:
	bt r12,0
	jc LB_1739
	mov rdi,r13
	call dlt
LB_1739:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1740
	btr r12,0
	jmp LB_1741
LB_1740:
	bts r12,0
LB_1741:
	ret
MTC_LB_1714:
NS_E_1745:
NS_E_RDI_1745:
NS_E_1745_ETR_TBL:
NS_E_1745_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1849
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1849
	jmp LB_1850
LB_1849:
	jmp LB_1841
LB_1850:
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
	jc LB_1842
	btr r12,0
	jmp LB_1843
LB_1842:
	bts r12,0
LB_1843:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1838
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_1749 : %_1749
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_1749
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_1749 ⊢ %_1750 : %_1750
 ; {>  %_1749~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1750
 ; {>  %_1750~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1836
	btr r12,3
	jmp LB_1837
LB_1836:
	bts r12,3
LB_1837:
	mov r8,0
	bts r12,2
	ret
LB_1838:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1840
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1839
LB_1840:
	add rsp,8
	ret
LB_1841:
	add rsp,16
	pop r14
LB_1839:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1865
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1857
LB_1865:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_1745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1870
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1871:
	jmp LB_1857
LB_1870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1860
	btr r12,1
	jmp LB_1861
LB_1860:
	bts r12,1
LB_1861:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1858
	btr r12,0
	jmp LB_1859
LB_1858:
	bts r12,0
LB_1859:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1854
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_1752 ⊢ %_1753 : %_1753
 ; {>  %_1752~1':_r64 %_1751~0':_r64 }
	add r14,1
; _some %_1753 ⊢ %_1754 : %_1754
 ; {>  %_1751~0':_r64 %_1753~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_1754
 ; {>  %_1754~°0◂1':(_opn)◂(_r64) %_1751~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_1851
	mov rdi,r13
	call dlt
LB_1851:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_1852
	btr r12,3
	jmp LB_1853
LB_1852:
	bts r12,3
LB_1853:
	mov r8,0
	bts r12,2
	ret
LB_1854:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1856
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1855
LB_1856:
	add rsp,8
	ret
LB_1857:
	add rsp,32
	pop r14
LB_1855:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1746:
NS_E_RDI_1746:
NS_E_1746_ETR_TBL:
NS_E_1746_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_1888
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_1888
	jmp LB_1889
LB_1888:
	jmp LB_1878
LB_1889:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1893
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1894
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1894:
	jmp LB_1878
LB_1893:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1881
	btr r12,1
	jmp LB_1882
LB_1881:
	bts r12,1
LB_1882:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1879
	btr r12,0
	jmp LB_1880
LB_1879:
	bts r12,0
LB_1880:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1875
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1896
	btr r12,2
	jmp LB_1897
LB_1896:
	bts r12,2
LB_1897:
	mov r13,r14
	bt r12,1
	jc LB_1898
	btr r12,0
	jmp LB_1899
LB_1898:
	bts r12,0
LB_1899:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f44 %_1755 ⊢ %_1756 : %_1756
 ; {>  %_1755~0':_r64 }
	add r13,1
; _some %_1756 ⊢ %_1757 : %_1757
 ; {>  %_1756~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1757
 ; {>  %_1757~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1873
	btr r12,3
	jmp LB_1874
LB_1873:
	bts r12,3
LB_1874:
	mov r8,0
	bts r12,2
	ret
LB_1875:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1877
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1876
LB_1877:
	add rsp,8
	ret
LB_1878:
	add rsp,32
	pop r14
LB_1876:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_1915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_1915
	jmp LB_1916
LB_1915:
	jmp LB_1905
LB_1916:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1920
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1921:
	jmp LB_1905
LB_1920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1908
	btr r12,1
	jmp LB_1909
LB_1908:
	bts r12,1
LB_1909:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1906
	btr r12,0
	jmp LB_1907
LB_1906:
	bts r12,0
LB_1907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1902
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1923
	btr r12,2
	jmp LB_1924
LB_1923:
	bts r12,2
LB_1924:
	mov r13,r14
	bt r12,1
	jc LB_1925
	btr r12,0
	jmp LB_1926
LB_1925:
	bts r12,0
LB_1926:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f44 %_1758 ⊢ %_1759 : %_1759
 ; {>  %_1758~0':_r64 }
	add r13,1
; _some %_1759 ⊢ %_1760 : %_1760
 ; {>  %_1759~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1760
 ; {>  %_1760~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1900
	btr r12,3
	jmp LB_1901
LB_1900:
	bts r12,3
LB_1901:
	mov r8,0
	bts r12,2
	ret
LB_1902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1904
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1903
LB_1904:
	add rsp,8
	ret
LB_1905:
	add rsp,32
	pop r14
LB_1903:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_1929
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_1761 : %_1761
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_1761
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_1761 ⊢ %_1762 : %_1762
 ; {>  %_1761~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1762
 ; {>  %_1762~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1927
	btr r12,3
	jmp LB_1928
LB_1927:
	bts r12,3
LB_1928:
	mov r8,0
	bts r12,2
	ret
LB_1929:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1931
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1930
LB_1931:
	add rsp,8
	ret
LB_1932:
	add rsp,0
	pop r14
LB_1930:
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
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2012
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1959
LB_2012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_2020
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_2020
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_2020
	jmp LB_2021
LB_2020:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2018:
	jmp LB_1959
LB_2021:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
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
	jmp LB_1960
LB_1976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_1988
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_1988
	jmp LB_1989
LB_1988:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1984
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1984:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1985
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1985:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1986
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1986:
	jmp LB_1960
LB_1989:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_1748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1993
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_1994
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_1994:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_1995
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_1995:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1996
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1996:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1997:
	jmp LB_1960
LB_1993:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_1747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2002
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_2003
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_2003:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2004
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2004:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2005
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2005:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2006
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2006:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2007
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2007:
	jmp LB_1960
LB_2002:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_1971
	btr r12,5
	jmp LB_1972
LB_1971:
	bts r12,5
LB_1972:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_1969
	btr r12,4
	jmp LB_1970
LB_1969:
	bts r12,4
LB_1970:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_1967
	btr r12,3
	jmp LB_1968
LB_1967:
	bts r12,3
LB_1968:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1965
	btr r12,2
	jmp LB_1966
LB_1965:
	bts r12,2
LB_1966:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1963
	btr r12,1
	jmp LB_1964
LB_1963:
	bts r12,1
LB_1964:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1961
	btr r12,0
	jmp LB_1962
LB_1961:
	bts r12,0
LB_1962:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_1956
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_2022
	btr r12,6
	jmp LB_2023
LB_2022:
	bts r12,6
LB_2023:
	mov r8,r10
	bt r12,4
	jc LB_2024
	btr r12,2
	jmp LB_2025
LB_2024:
	bts r12,2
LB_2025:
	mov rdx,r14
	bt r12,1
	jc LB_2026
	btr r12,7
	jmp LB_2027
LB_2026:
	bts r12,7
LB_2027:
	mov r14,rcx
	bt r12,6
	jc LB_2028
	btr r12,1
	jmp LB_2029
LB_2028:
	bts r12,1
LB_2029:
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2032
	btr r12,6
	jmp LB_2033
LB_2032:
	bts r12,6
LB_2033:
	mov r9,rcx
	bt r12,6
	jc LB_2030
	btr r12,3
	jmp LB_2031
LB_2030:
	bts r12,3
LB_2031:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2036
	btr r12,6
	jmp LB_2037
LB_2036:
	bts r12,6
LB_2037:
	mov r10,rcx
	bt r12,6
	jc LB_2034
	btr r12,4
	jmp LB_2035
LB_2034:
	bts r12,4
LB_2035:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_1768 : %_1768
 ; {>  %_1767~4':(_lst)◂(_p1742) %_1766~3':_r64 %_1765~2':_r64 %_1764~1':_r64 %_1763~0':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_1768
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_1768 %_1763 } ⊢ { %_1769 %_1770 } : { %_1769 %_1770 }
 ; {>  %_1767~4':(_lst)◂(_p1742) %_1766~3':_r64 %_1768~5':_r64 %_1765~2':_r64 %_1764~1':_r64 %_1763~0':_r64 }
	add r11,r13
; _f39 { %_1769 %_1764 } ⊢ { %_1771 %_1772 } : { %_1771 %_1772 }
 ; {>  %_1767~4':(_lst)◂(_p1742) %_1766~3':_r64 %_1770~0':_r64 %_1769~5':_r64 %_1765~2':_r64 %_1764~1':_r64 }
	add r11,r14
; _f39 { %_1771 %_1765 } ⊢ { %_1773 %_1774 } : { %_1773 %_1774 }
 ; {>  %_1767~4':(_lst)◂(_p1742) %_1771~5':_r64 %_1772~1':_r64 %_1766~3':_r64 %_1770~0':_r64 %_1765~2':_r64 }
	add r11,r8
; _f1743 %_1773 ⊢ %_1775 : %_1775
 ; {>  %_1767~4':(_lst)◂(_p1742) %_1772~1':_r64 %_1766~3':_r64 %_1774~2':_r64 %_1773~5':_r64 %_1770~0':_r64 }
; _f1743 5' ⊢ °0◂5'
; _cns { %_1775 %_1767 } ⊢ %_1776 : %_1776
 ; {>  %_1767~4':(_lst)◂(_p1742) %_1772~1':_r64 %_1766~3':_r64 %_1774~2':_r64 %_1770~0':_r64 %_1775~°0◂5':_p1742 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_1766 %_1776 } ⊢ %_1777 : %_1777
 ; {>  %_1776~°0◂{ °0◂5' 4' }:(_lst)◂(_p1742) %_1772~1':_r64 %_1766~3':_r64 %_1774~2':_r64 %_1770~0':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_1777
 ; {>  %_1772~1':_r64 %_1774~2':_r64 %_1770~0':_r64 %_1777~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p1742) }) }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_1933
	mov rdi,r14
	call dlt
LB_1933:
	bt r12,2
	jc LB_1934
	mov rdi,r8
	call dlt
LB_1934:
	bt r12,0
	jc LB_1935
	mov rdi,r13
	call dlt
LB_1935:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_1936
	btr r12,0
	jmp LB_1937
LB_1936:
	bts r12,0
LB_1937:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_1940
	btr r12,1
	jmp LB_1941
LB_1940:
	bts r12,1
LB_1941:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1938
	btr QWORD [rdi],0
	jmp LB_1939
LB_1938:
	bts QWORD [rdi],0
LB_1939:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_1950
	btr r12,0
	jmp LB_1951
LB_1950:
	bts r12,0
LB_1951:
	mov rsi,1
	bt r12,0
	jc LB_1948
	mov rsi,0
	bt r13,0
	jc LB_1948
	jmp LB_1949
LB_1948:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_1949:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_1946
	btr QWORD [rdi],0
	jmp LB_1947
LB_1946:
	bts QWORD [rdi],0
LB_1947:
	mov r13,r10
	bt r12,4
	jc LB_1954
	btr r12,0
	jmp LB_1955
LB_1954:
	bts r12,0
LB_1955:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_1952
	btr QWORD [rdi],1
	jmp LB_1953
LB_1952:
	bts QWORD [rdi],1
LB_1953:
	mov rsi,1
	bt r12,1
	jc LB_1944
	mov rsi,0
	bt r14,0
	jc LB_1944
	jmp LB_1945
LB_1944:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_1945:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1942
	btr QWORD [rdi],1
	jmp LB_1943
LB_1942:
	bts QWORD [rdi],1
LB_1943:
	mov r8,0
	bts r12,2
	ret
LB_1956:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1958
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_1957
LB_1958:
	add rsp,8
	ret
LB_1960:
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
LB_1959:
	add rsp,96
	pop r14
LB_1957:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2091
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2063
LB_2091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_2099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_2099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_2099
	jmp LB_2100
LB_2099:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2097
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2097:
	jmp LB_2063
LB_2100:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_1745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2076
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2077
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2077:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2078
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2078:
	jmp LB_2064
LB_2076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_1747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2083
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2084
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2084:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2085
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2085:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2086
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2086:
	jmp LB_2064
LB_2083:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2071
	btr r12,3
	jmp LB_2072
LB_2071:
	bts r12,3
LB_2072:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2069
	btr r12,2
	jmp LB_2070
LB_2069:
	bts r12,2
LB_2070:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2067
	btr r12,1
	jmp LB_2068
LB_2067:
	bts r12,1
LB_2068:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2065
	btr r12,0
	jmp LB_2066
LB_2065:
	bts r12,0
LB_2066:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_2060
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_2101
	btr r12,4
	jmp LB_2102
LB_2101:
	bts r12,4
LB_2102:
	mov r14,r8
	bt r12,2
	jc LB_2103
	btr r12,1
	jmp LB_2104
LB_2103:
	bts r12,1
LB_2104:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_2105
	btr r12,4
	jmp LB_2106
LB_2105:
	bts r12,4
LB_2106:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2109
	btr r12,5
	jmp LB_2110
LB_2109:
	bts r12,5
LB_2110:
	mov r8,r11
	bt r12,5
	jc LB_2107
	btr r12,2
	jmp LB_2108
LB_2107:
	bts r12,2
LB_2108:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2113
	btr r12,5
	jmp LB_2114
LB_2113:
	bts r12,5
LB_2114:
	mov r9,r11
	bt r12,5
	jc LB_2111
	btr r12,3
	jmp LB_2112
LB_2111:
	bts r12,3
LB_2112:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_1782 : %_1782
 ; {>  %_1781~3':(_lst)◂(_p1742) %_1780~2':_r64 %_1779~1':_r64 %_1778~0':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_1782
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_1782 %_1778 } ⊢ { %_1783 %_1784 } : { %_1783 %_1784 }
 ; {>  %_1781~3':(_lst)◂(_p1742) %_1780~2':_r64 %_1782~4':_r64 %_1779~1':_r64 %_1778~0':_r64 }
	add r10,r13
; _f39 { %_1783 %_1779 } ⊢ { %_1785 %_1786 } : { %_1785 %_1786 }
 ; {>  %_1784~0':_r64 %_1781~3':(_lst)◂(_p1742) %_1780~2':_r64 %_1779~1':_r64 %_1783~4':_r64 }
	add r10,r14
; _f1743 %_1785 ⊢ %_1787 : %_1787
 ; {>  %_1784~0':_r64 %_1781~3':(_lst)◂(_p1742) %_1780~2':_r64 %_1786~1':_r64 %_1785~4':_r64 }
; _f1743 4' ⊢ °0◂4'
; _cns { %_1787 %_1781 } ⊢ %_1788 : %_1788
 ; {>  %_1784~0':_r64 %_1781~3':(_lst)◂(_p1742) %_1780~2':_r64 %_1786~1':_r64 %_1787~°0◂4':_p1742 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_1780 %_1788 } ⊢ %_1789 : %_1789
 ; {>  %_1784~0':_r64 %_1780~2':_r64 %_1786~1':_r64 %_1788~°0◂{ °0◂4' 3' }:(_lst)◂(_p1742) }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_1789
 ; {>  %_1784~0':_r64 %_1789~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p1742) }) %_1786~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_2038
	mov rdi,r13
	call dlt
LB_2038:
	bt r12,1
	jc LB_2039
	mov rdi,r14
	call dlt
LB_2039:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_2040
	btr r12,0
	jmp LB_2041
LB_2040:
	bts r12,0
LB_2041:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_2044
	btr r12,1
	jmp LB_2045
LB_2044:
	bts r12,1
LB_2045:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2042
	btr QWORD [rdi],0
	jmp LB_2043
LB_2042:
	bts QWORD [rdi],0
LB_2043:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_2054
	btr r12,2
	jmp LB_2055
LB_2054:
	bts r12,2
LB_2055:
	mov rsi,1
	bt r12,2
	jc LB_2052
	mov rsi,0
	bt r8,0
	jc LB_2052
	jmp LB_2053
LB_2052:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_2053:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2050
	btr QWORD [rdi],0
	jmp LB_2051
LB_2050:
	bts QWORD [rdi],0
LB_2051:
	mov r8,r13
	bt r12,0
	jc LB_2058
	btr r12,2
	jmp LB_2059
LB_2058:
	bts r12,2
LB_2059:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2056
	btr QWORD [rdi],1
	jmp LB_2057
LB_2056:
	bts QWORD [rdi],1
LB_2057:
	mov rsi,1
	bt r12,1
	jc LB_2048
	mov rsi,0
	bt r14,0
	jc LB_2048
	jmp LB_2049
LB_2048:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_2049:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2046
	btr QWORD [rdi],1
	jmp LB_2047
LB_2046:
	bts QWORD [rdi],1
LB_2047:
	mov r8,0
	bts r12,2
	ret
LB_2060:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2062
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2061
LB_2062:
	add rsp,8
	ret
LB_2064:
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
LB_2063:
	add rsp,64
	pop r14
LB_2061:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_1745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2186
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2178
LB_2186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_1747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2191
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2192:
	jmp LB_2178
LB_2191:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2181
	btr r12,1
	jmp LB_2182
LB_2181:
	bts r12,1
LB_2182:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2179
	btr r12,0
	jmp LB_2180
LB_2179:
	bts r12,0
LB_2180:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2175
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_2194
	btr r12,3
	jmp LB_2195
LB_2194:
	bts r12,3
LB_2195:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2198
	btr r12,4
	jmp LB_2199
LB_2198:
	bts r12,4
LB_2199:
	mov r14,r10
	bt r12,4
	jc LB_2196
	btr r12,1
	jmp LB_2197
LB_2196:
	bts r12,1
LB_2197:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2202
	btr r12,4
	jmp LB_2203
LB_2202:
	bts r12,4
LB_2203:
	mov r8,r10
	bt r12,4
	jc LB_2200
	btr r12,2
	jmp LB_2201
LB_2200:
	bts r12,2
LB_2201:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f39 { %_1791 %_1790 } ⊢ { %_1793 %_1794 } : { %_1793 %_1794 }
 ; {>  %_1790~0':_r64 %_1792~2':(_lst)◂(_p1742) %_1791~1':_r64 }
	add r14,r13
MTC_LB_2115:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2116
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
	jnc LB_2117
	bt QWORD [rax],0
	jc LB_2118
	btr r12,5
	jmp LB_2119
LB_2118:
	bts r12,5
LB_2119:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2117:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2122
	btr r12,6
	jmp LB_2123
LB_2122:
	bts r12,6
LB_2123:
	mov r9,rcx
	bt r12,6
	jc LB_2120
	btr r12,3
	jmp LB_2121
LB_2120:
	bts r12,3
LB_2121:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2126
	btr r12,6
	jmp LB_2127
LB_2126:
	bts r12,6
LB_2127:
	mov r10,rcx
	bt r12,6
	jc LB_2124
	btr r12,4
	jmp LB_2125
LB_2124:
	bts r12,4
LB_2125:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2116
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
	jnc LB_2128
	bt QWORD [rax],0
	jc LB_2129
	btr r12,6
	jmp LB_2130
LB_2129:
	bts r12,6
LB_2130:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2128:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_2131
	btr r12,5
	jmp LB_2132
LB_2131:
	bts r12,5
LB_2132:
LB_2133:
	cmp r15,0
	jz LB_2134
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2133
LB_2134:
; _f39 { %_1797 %_1794 } ⊢ { %_1798 %_1799 } : { %_1798 %_1799 }
 ; {>  %_1797~5':_r64 %_1794~0':_r64 %_1793~1':_r64 %_1796~4':(_lst)◂(_p1742) }
	add r11,r13
; _f1744 %_1798 ⊢ %_1800 : %_1800
 ; {>  %_1799~0':_r64 %_1793~1':_r64 %_1798~5':_r64 %_1796~4':(_lst)◂(_p1742) }
; _f1744 5' ⊢ °1◂5'
; _cns { %_1800 %_1796 } ⊢ %_1801 : %_1801
 ; {>  %_1799~0':_r64 %_1793~1':_r64 %_1800~°1◂5':_p1742 %_1796~4':(_lst)◂(_p1742) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_1793 %_1801 } ⊢ %_1802 : %_1802
 ; {>  %_1799~0':_r64 %_1801~°0◂{ °1◂5' 4' }:(_lst)◂(_p1742) %_1793~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_1802
 ; {>  %_1799~0':_r64 %_1802~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p1742) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_2135
	mov rdi,r13
	call dlt
LB_2135:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_2138
	btr r12,0
	jmp LB_2139
LB_2138:
	bts r12,0
LB_2139:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_2136
	btr QWORD [rdi],0
	jmp LB_2137
LB_2136:
	bts QWORD [rdi],0
LB_2137:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_2148
	btr r12,1
	jmp LB_2149
LB_2148:
	bts r12,1
LB_2149:
	mov rsi,1
	bt r12,1
	jc LB_2146
	mov rsi,0
	bt r14,0
	jc LB_2146
	jmp LB_2147
LB_2146:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_2147:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2144
	btr QWORD [rdi],0
	jmp LB_2145
LB_2144:
	bts QWORD [rdi],0
LB_2145:
	mov r14,r10
	bt r12,4
	jc LB_2152
	btr r12,1
	jmp LB_2153
LB_2152:
	bts r12,1
LB_2153:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2150
	btr QWORD [rdi],1
	jmp LB_2151
LB_2150:
	bts QWORD [rdi],1
LB_2151:
	mov rsi,1
	bt r12,0
	jc LB_2142
	mov rsi,0
	bt r13,0
	jc LB_2142
	jmp LB_2143
LB_2142:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_2143:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_2140
	btr QWORD [rdi],1
	jmp LB_2141
LB_2140:
	bts QWORD [rdi],1
LB_2141:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2116:
	mov r15,0
LB_2155:
	cmp r15,0
	jz LB_2156
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2155
LB_2156:
; _f1744 %_1794 ⊢ %_1803 : %_1803
 ; {>  %_1792~2':(_lst)◂(_p1742) %_1794~0':_r64 %_1793~1':_r64 }
; _f1744 0' ⊢ °1◂0'
; _cns { %_1803 %_1792 } ⊢ %_1804 : %_1804
 ; {>  %_1792~2':(_lst)◂(_p1742) %_1793~1':_r64 %_1803~°1◂0':_p1742 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_1793 %_1804 } ⊢ %_1805 : %_1805
 ; {>  %_1804~°0◂{ °1◂0' 2' }:(_lst)◂(_p1742) %_1793~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_1805
 ; {>  %_1805~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p1742) }) }
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
	jc LB_2159
	btr r12,4
	jmp LB_2160
LB_2159:
	bts r12,4
LB_2160:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_2157
	btr QWORD [rdi],0
	jmp LB_2158
LB_2157:
	bts QWORD [rdi],0
LB_2158:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_2169
	btr r12,1
	jmp LB_2170
LB_2169:
	bts r12,1
LB_2170:
	mov rsi,1
	bt r12,1
	jc LB_2167
	mov rsi,0
	bt r14,0
	jc LB_2167
	jmp LB_2168
LB_2167:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_2168:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2165
	btr QWORD [rdi],0
	jmp LB_2166
LB_2165:
	bts QWORD [rdi],0
LB_2166:
	mov r14,r8
	bt r12,2
	jc LB_2173
	btr r12,1
	jmp LB_2174
LB_2173:
	bts r12,1
LB_2174:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2171
	btr QWORD [rdi],1
	jmp LB_2172
LB_2171:
	bts QWORD [rdi],1
LB_2172:
	mov rsi,1
	bt r12,4
	jc LB_2163
	mov rsi,0
	bt r10,0
	jc LB_2163
	jmp LB_2164
LB_2163:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_2164:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_2161
	btr QWORD [rdi],1
	jmp LB_2162
LB_2161:
	bts QWORD [rdi],1
LB_2162:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2154:
LB_2175:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2177
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2176
LB_2177:
	add rsp,8
	ret
LB_2178:
	add rsp,32
	pop r14
LB_2176:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_2212
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_1806 : %_1806
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_1807 : %_1807
 ; {>  %_1806~°1◂{  }:(_lst)◂(t791'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_1807
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_1807 %_1806 } ⊢ %_1808 : %_1808
 ; {>  %_1807~0':_r64 %_1806~°1◂{  }:(_lst)◂(t791'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_1808
 ; {>  %_1808~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t795'(0)) }) }
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
	jc LB_2206
	btr r12,1
	jmp LB_2207
LB_2206:
	bts r12,1
LB_2207:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2204
	btr QWORD [rdi],0
	jmp LB_2205
LB_2204:
	bts QWORD [rdi],0
LB_2205:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_2210
	mov rsi,0
	bt r14,0
	jc LB_2210
	jmp LB_2211
LB_2210:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_2211:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2208
	btr QWORD [rdi],1
	jmp LB_2209
LB_2208:
	bts QWORD [rdi],1
LB_2209:
	mov r8,0
	bts r12,2
	ret
LB_2212:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2214
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2213
LB_2214:
	add rsp,8
	ret
LB_2215:
	add rsp,0
	pop r14
LB_2213:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1748:
NS_E_RDI_1748:
NS_E_1748_ETR_TBL:
NS_E_1748_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2253
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2223
LB_2253:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_2261
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_2261
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_2261
	jmp LB_2262
LB_2261:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2259:
	jmp LB_2223
LB_2262:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2236
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2237
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2237:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2238
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2238:
	jmp LB_2224
LB_2236:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_2248
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2248
	jmp LB_2249
LB_2248:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2244
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2244:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2245
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2245:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2246
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2246:
	jmp LB_2224
LB_2249:
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
	jc LB_2231
	btr r12,3
	jmp LB_2232
LB_2231:
	bts r12,3
LB_2232:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2229
	btr r12,2
	jmp LB_2230
LB_2229:
	bts r12,2
LB_2230:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2227
	btr r12,1
	jmp LB_2228
LB_2227:
	bts r12,1
LB_2228:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2225
	btr r12,0
	jmp LB_2226
LB_2225:
	bts r12,0
LB_2226:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_2220
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_2263
	btr r12,4
	jmp LB_2264
LB_2263:
	bts r12,4
LB_2264:
	mov r14,r8
	bt r12,2
	jc LB_2265
	btr r12,1
	jmp LB_2266
LB_2265:
	bts r12,1
LB_2266:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_1811 : %_1811
 ; {>  %_1809~0':_r64 %_1810~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_1811
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_1811 %_1809 } ⊢ { %_1812 %_1813 } : { %_1812 %_1813 }
 ; {>  %_1811~2':_r64 %_1809~0':_r64 %_1810~1':_r64 }
	add r8,r13
; _f39 { %_1812 %_1810 } ⊢ { %_1814 %_1815 } : { %_1814 %_1815 }
 ; {>  %_1812~2':_r64 %_1813~0':_r64 %_1810~1':_r64 }
	add r8,r14
; _some %_1814 ⊢ %_1816 : %_1816
 ; {>  %_1814~2':_r64 %_1815~1':_r64 %_1813~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_1816
 ; {>  %_1815~1':_r64 %_1813~0':_r64 %_1816~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_2216
	mov rdi,r14
	call dlt
LB_2216:
	bt r12,0
	jc LB_2217
	mov rdi,r13
	call dlt
LB_2217:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_2218
	btr r12,3
	jmp LB_2219
LB_2218:
	bts r12,3
LB_2219:
	mov r8,0
	bts r12,2
	ret
LB_2220:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2222
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2221
LB_2222:
	add rsp,8
	ret
LB_2224:
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
LB_2223:
	add rsp,64
	pop r14
LB_2221:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2329
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2276
LB_2329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_2337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_2337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_2337
	jmp LB_2338
LB_2337:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2335:
	jmp LB_2276
LB_2338:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_1746_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2293
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2294
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2294:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2295:
	jmp LB_2277
LB_2293:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_2305
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2305
	jmp LB_2306
LB_2305:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2301
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2301:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2302
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2302:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2303
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2303:
	jmp LB_2277
LB_2306:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_1748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2310
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2311
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2311:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2312
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2312:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2313
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2313:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2314
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2314:
	jmp LB_2277
LB_2310:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_1748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2319
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_2320
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_2320:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_2321
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_2321:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_2322
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_2322:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2323
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2324
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2324:
	jmp LB_2277
LB_2319:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_2288
	btr r12,5
	jmp LB_2289
LB_2288:
	bts r12,5
LB_2289:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_2286
	btr r12,4
	jmp LB_2287
LB_2286:
	bts r12,4
LB_2287:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_2284
	btr r12,3
	jmp LB_2285
LB_2284:
	bts r12,3
LB_2285:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2282
	btr r12,2
	jmp LB_2283
LB_2282:
	bts r12,2
LB_2283:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2280
	btr r12,1
	jmp LB_2281
LB_2280:
	bts r12,1
LB_2281:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2278
	btr r12,0
	jmp LB_2279
LB_2278:
	bts r12,0
LB_2279:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_2273
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_2339
	btr r12,6
	jmp LB_2340
LB_2339:
	bts r12,6
LB_2340:
	mov r9,r11
	bt r12,5
	jc LB_2341
	btr r12,3
	jmp LB_2342
LB_2341:
	bts r12,3
LB_2342:
	mov r11,r8
	bt r12,2
	jc LB_2343
	btr r12,5
	jmp LB_2344
LB_2343:
	bts r12,5
LB_2344:
	mov r8,r10
	bt r12,4
	jc LB_2345
	btr r12,2
	jmp LB_2346
LB_2345:
	bts r12,2
LB_2346:
	mov r10,r14
	bt r12,1
	jc LB_2347
	btr r12,4
	jmp LB_2348
LB_2347:
	bts r12,4
LB_2348:
	mov r14,r11
	bt r12,5
	jc LB_2349
	btr r12,1
	jmp LB_2350
LB_2349:
	bts r12,1
LB_2350:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_1821 : %_1821
 ; {>  %_1819~2':_r64 %_1818~1':_r64 %_1817~0':_r64 %_1820~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_1821
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_1821 %_1817 } ⊢ { %_1822 %_1823 } : { %_1822 %_1823 }
 ; {>  %_1819~2':_r64 %_1818~1':_r64 %_1817~0':_r64 %_1820~3':_r64 %_1821~4':_r64 }
	add r10,r13
; _f39 { %_1822 %_1818 } ⊢ { %_1824 %_1825 } : { %_1824 %_1825 }
 ; {>  %_1823~0':_r64 %_1819~2':_r64 %_1818~1':_r64 %_1822~4':_r64 %_1820~3':_r64 }
	add r10,r14
; _f39 { %_1824 %_1819 } ⊢ { %_1826 %_1827 } : { %_1826 %_1827 }
 ; {>  %_1825~1':_r64 %_1823~0':_r64 %_1824~4':_r64 %_1819~2':_r64 %_1820~3':_r64 }
	add r10,r8
; _f39 { %_1826 %_1820 } ⊢ { %_1828 %_1829 } : { %_1828 %_1829 }
 ; {>  %_1825~1':_r64 %_1823~0':_r64 %_1827~2':_r64 %_1820~3':_r64 %_1826~4':_r64 }
	add r10,r9
; _some %_1828 ⊢ %_1830 : %_1830
 ; {>  %_1829~3':_r64 %_1825~1':_r64 %_1823~0':_r64 %_1827~2':_r64 %_1828~4':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_1830
 ; {>  %_1829~3':_r64 %_1825~1':_r64 %_1823~0':_r64 %_1827~2':_r64 %_1830~°0◂4':(_opn)◂(_r64) }
; 	∎ °0◂4'
	bt r12,3
	jc LB_2267
	mov rdi,r9
	call dlt
LB_2267:
	bt r12,1
	jc LB_2268
	mov rdi,r14
	call dlt
LB_2268:
	bt r12,0
	jc LB_2269
	mov rdi,r13
	call dlt
LB_2269:
	bt r12,2
	jc LB_2270
	mov rdi,r8
	call dlt
LB_2270:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_2271
	btr r12,3
	jmp LB_2272
LB_2271:
	bts r12,3
LB_2272:
	mov r8,0
	bts r12,2
	ret
LB_2273:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2275
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2274
LB_2275:
	add rsp,8
	ret
LB_2277:
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
LB_2276:
	add rsp,96
	pop r14
LB_2274:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_1745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2365
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2357
LB_2365:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_1748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2370
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2371:
	jmp LB_2357
LB_2370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2360
	btr r12,1
	jmp LB_2361
LB_2360:
	bts r12,1
LB_2361:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2358
	btr r12,0
	jmp LB_2359
LB_2358:
	bts r12,0
LB_2359:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2354
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_1831 %_1832 } ⊢ { %_1833 %_1834 } : { %_1833 %_1834 }
 ; {>  %_1832~1':_r64 %_1831~0':_r64 }
	add r13,r14
; _some %_1833 ⊢ %_1835 : %_1835
 ; {>  %_1833~0':_r64 %_1834~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1835
 ; {>  %_1835~°0◂0':(_opn)◂(_r64) %_1834~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_2351
	mov rdi,r14
	call dlt
LB_2351:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2352
	btr r12,3
	jmp LB_2353
LB_2352:
	bts r12,3
LB_2353:
	mov r8,0
	bts r12,2
	ret
LB_2354:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2356
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2355
LB_2356:
	add rsp,8
	ret
LB_2357:
	add rsp,32
	pop r14
LB_2355:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2395:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_2395:
MTC_LB_2396:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2397
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
	jnc LB_2398
	bt QWORD [rax],0
	jc LB_2399
	btr r12,7
	jmp LB_2400
LB_2399:
	bts r12,7
LB_2400:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2398:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_2403
	btr r12,8
	jmp LB_2404
LB_2403:
	bts r12,8
LB_2404:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2401
	btr r12,5
	jmp LB_2402
LB_2401:
	bts r12,5
LB_2402:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_2407
	btr r12,8
	jmp LB_2408
LB_2407:
	bts r12,8
LB_2408:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2405
	btr r12,6
	jmp LB_2406
LB_2405:
	bts r12,6
LB_2406:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2409:
	cmp r15,0
	jz LB_2410
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2409
LB_2410:
MTC_LB_2411:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2412
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
	jnc LB_2413
	bt QWORD [rax],0
	jc LB_2414
	btr r12,7
	jmp LB_2415
LB_2414:
	bts r12,7
LB_2415:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2413:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_2416
	btr r12,4
	jmp LB_2417
LB_2416:
	bts r12,4
LB_2417:
LB_2418:
	cmp r15,0
	jz LB_2419
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2418
LB_2419:
; _f41 %_2380 ⊢ { %_2381 %_2382 } : { %_2381 %_2382 }
 ; {>  %_2379~6':(_lst)◂(_p1742) %_2380~4':_r64 %_2375~2':_stg %_2376~3':_r64 %_2373~0':_stg %_2374~1':_r64 }
	mov r11,r10
	bts r12,5
; _f23 { %_2382 %_2373 %_2374 %_2375 %_2376 } ⊢ { %_2383 %_2384 %_2385 %_2386 %_2387 } : { %_2383 %_2384 %_2385 %_2386 %_2387 }
 ; {>  %_2381~4':_r64 %_2379~6':(_lst)◂(_p1742) %_2375~2':_stg %_2382~5':_r64 %_2376~3':_r64 %_2373~0':_stg %_2374~1':_r64 }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_2424
	btr r12,4
	jmp LB_2425
LB_2424:
	bts r12,4
LB_2425:
	mov r9,r8
	bt r12,2
	jc LB_2426
	btr r12,3
	jmp LB_2427
LB_2426:
	bts r12,3
LB_2427:
	mov r8,r14
	bt r12,1
	jc LB_2428
	btr r12,2
	jmp LB_2429
LB_2428:
	bts r12,2
LB_2429:
	mov r14,r13
	bt r12,0
	jc LB_2430
	btr r12,1
	jmp LB_2431
LB_2430:
	bts r12,1
LB_2431:
	mov r13,r11
	bt r12,5
	jc LB_2432
	btr r12,0
	jmp LB_2433
LB_2432:
	bts r12,0
LB_2433:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_2434
	btr r12,5
	jmp LB_2435
LB_2434:
	bts r12,5
LB_2435:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_2422
	btr r12,6
	jmp LB_2423
LB_2422:
	bts r12,6
LB_2423:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_2420
	btr r12,4
	jmp LB_2421
LB_2420:
	bts r12,4
LB_2421:
	add rsp,24
; _f2395 { %_2384 %_2385 %_2386 %_2387 %_2379 } ⊢ { %_2388 %_2389 } : { %_2388 %_2389 }
 ; {>  %_2381~4':_r64 %_2379~6':(_lst)◂(_p1742) %_2386~3':_stg %_2385~2':_r64 %_2383~0':_r64 %_2384~1':_stg %_2387~5':_r64 }
; _f2395 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_2440
	btr r12,0
	jmp LB_2441
LB_2440:
	bts r12,0
LB_2441:
	mov r14,r8
	bt r12,2
	jc LB_2442
	btr r12,1
	jmp LB_2443
LB_2442:
	bts r12,1
LB_2443:
	mov r8,r9
	bt r12,3
	jc LB_2444
	btr r12,2
	jmp LB_2445
LB_2444:
	bts r12,2
LB_2445:
	mov r9,r11
	bt r12,5
	jc LB_2446
	btr r12,3
	jmp LB_2447
LB_2446:
	bts r12,3
LB_2447:
	mov r10,rcx
	bt r12,6
	jc LB_2448
	btr r12,4
	jmp LB_2449
LB_2448:
	bts r12,4
LB_2449:
	call NS_E_2395
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2450
	btr r12,2
	jmp LB_2451
LB_2450:
	bts r12,2
LB_2451:
	mov r14,r13
	bt r12,0
	jc LB_2452
	btr r12,1
	jmp LB_2453
LB_2452:
	bts r12,1
LB_2453:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_2438
	btr r12,4
	jmp LB_2439
LB_2438:
	bts r12,4
LB_2439:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2436
	btr r12,0
	jmp LB_2437
LB_2436:
	bts r12,0
LB_2437:
	add rsp,24
; ∎ { %_2388 %_2389 }
 ; {>  %_2389~2':_stg %_2381~4':_r64 %_2388~1':_stg %_2383~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_2454
	mov rdi,r10
	call dlt
LB_2454:
	bt r12,0
	jc LB_2455
	mov rdi,r13
	call dlt
LB_2455:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_2456
	btr r12,0
	jmp LB_2457
LB_2456:
	bts r12,0
LB_2457:
	mov r14,r8
	bt r12,2
	jc LB_2458
	btr r12,1
	jmp LB_2459
LB_2458:
	bts r12,1
LB_2459:
	ret
MTC_LB_2412:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2460
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
	jnc LB_2461
	bt QWORD [rax],0
	jc LB_2462
	btr r12,7
	jmp LB_2463
LB_2462:
	bts r12,7
LB_2463:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2461:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_2464
	btr r12,4
	jmp LB_2465
LB_2464:
	bts r12,4
LB_2465:
LB_2466:
	cmp r15,0
	jz LB_2467
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2466
LB_2467:
; _f39 { %_2374 %_2390 } ⊢ { %_2391 %_2392 } : { %_2391 %_2392 }
 ; {>  %_2379~6':(_lst)◂(_p1742) %_2390~4':_r64 %_2375~2':_stg %_2376~3':_r64 %_2373~0':_stg %_2374~1':_r64 }
	add r14,r10
; _f2395 { %_2373 %_2391 %_2375 %_2376 %_2379 } ⊢ { %_2393 %_2394 } : { %_2393 %_2394 }
 ; {>  %_2379~6':(_lst)◂(_p1742) %_2375~2':_stg %_2392~4':_r64 %_2391~1':_r64 %_2376~3':_r64 %_2373~0':_stg }
; _f2395 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_2470
	btr r12,4
	jmp LB_2471
LB_2470:
	bts r12,4
LB_2471:
	call NS_E_2395
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_2468
	btr r12,4
	jmp LB_2469
LB_2468:
	bts r12,4
LB_2469:
	add rsp,16
; ∎ { %_2393 %_2394 }
 ; {>  %_2394~1':_stg %_2393~0':_stg %_2392~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_2472
	mov rdi,r10
	call dlt
LB_2472:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2460:
MTC_LB_2397:
	mov r15,0
LB_2474:
	cmp r15,0
	jz LB_2475
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2474
LB_2475:
; ∎ { %_2373 %_2375 }
 ; {>  %_2377~4':(_lst)◂(_p1742) %_2375~2':_stg %_2376~3':_r64 %_2373~0':_stg %_2374~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_2476
	mov rdi,r10
	call dlt
LB_2476:
	bt r12,3
	jc LB_2477
	mov rdi,r9
	call dlt
LB_2477:
	bt r12,1
	jc LB_2478
	mov rdi,r14
	call dlt
LB_2478:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2479
	btr r12,1
	jmp LB_2480
LB_2479:
	bts r12,1
LB_2480:
	ret
MTC_LB_2473:
NS_E_2496:
; 	|» 0'
NS_E_RDI_2496:
; » 0xr0 |~ {  } ⊢ %_2482 : %_2482
 ; {>  %_2481~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_2482
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f1747 { %_2481 %_2482 } ⊢ { %_2483 %_2484 %_2485 } : { %_2483 %_2484 %_2485 }
 ; {>  %_2481~0':_stg %_2482~1':_r64 }
; _f1747 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1747
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_2497
	btr r12,4
	jmp LB_2498
LB_2497:
	bts r12,4
LB_2498:
	mov r8,r9
	bt r12,3
	jc LB_2501
	btr r12,2
	jmp LB_2502
LB_2501:
	bts r12,2
LB_2502:
	mov rsi,1
	bt r12,2
	jc LB_2499
	mov rsi,0
	bt r8,0
	jc LB_2499
	jmp LB_2500
LB_2499:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_2500:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_2503:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2504
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
	jnc LB_2505
	bt QWORD [rax],0
	jc LB_2506
	btr r12,5
	jmp LB_2507
LB_2506:
	bts r12,5
LB_2507:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2505:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2510
	btr r12,6
	jmp LB_2511
LB_2510:
	bts r12,6
LB_2511:
	mov r9,rcx
	bt r12,6
	jc LB_2508
	btr r12,3
	jmp LB_2509
LB_2508:
	bts r12,3
LB_2509:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2514
	btr r12,6
	jmp LB_2515
LB_2514:
	bts r12,6
LB_2515:
	mov r10,rcx
	bt r12,6
	jc LB_2512
	btr r12,4
	jmp LB_2513
LB_2512:
	bts r12,4
LB_2513:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2516:
	cmp r15,0
	jz LB_2517
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2516
LB_2517:
; _f19 %_2486 ⊢ { %_2488 %_2489 } : { %_2488 %_2489 }
 ; {>  %_2484~1':_r64 %_2486~3':_r64 %_2487~4':(_lst)◂(_p1742) %_2483~0':_stg }
; _f19 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2524
	btr r12,0
	jmp LB_2525
LB_2524:
	bts r12,0
LB_2525:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_2526
	btr r12,2
	jmp LB_2527
LB_2526:
	bts r12,2
LB_2527:
	mov r9,r14
	bt r12,1
	jc LB_2528
	btr r12,3
	jmp LB_2529
LB_2528:
	bts r12,3
LB_2529:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2522
	btr r12,4
	jmp LB_2523
LB_2522:
	bts r12,4
LB_2523:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2520
	btr r12,1
	jmp LB_2521
LB_2520:
	bts r12,1
LB_2521:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2518
	btr r12,0
	jmp LB_2519
LB_2518:
	bts r12,0
LB_2519:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_2490 : %_2490
 ; {>  %_2488~2':_r64 %_2484~1':_r64 %_2489~3':_stg %_2487~4':(_lst)◂(_p1742) %_2483~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_2490
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_2491 : %_2491
 ; {>  %_2490~5':_r64 %_2488~2':_r64 %_2484~1':_r64 %_2489~3':_stg %_2487~4':(_lst)◂(_p1742) %_2483~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_2491
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f2395 { %_2483 %_2490 %_2489 %_2491 %_2487 } ⊢ { %_2492 %_2493 } : { %_2492 %_2493 }
 ; {>  %_2490~5':_r64 %_2488~2':_r64 %_2484~1':_r64 %_2489~3':_stg %_2487~4':(_lst)◂(_p1742) %_2491~6':_r64 %_2483~0':_stg }
; _f2395 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_2534
	btr r12,1
	jmp LB_2535
LB_2534:
	bts r12,1
LB_2535:
	mov r8,r9
	bt r12,3
	jc LB_2536
	btr r12,2
	jmp LB_2537
LB_2536:
	bts r12,2
LB_2537:
	mov r9,rcx
	bt r12,6
	jc LB_2538
	btr r12,3
	jmp LB_2539
LB_2538:
	bts r12,3
LB_2539:
	call NS_E_2395
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2540
	btr r12,3
	jmp LB_2541
LB_2540:
	bts r12,3
LB_2541:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2532
	btr r12,2
	jmp LB_2533
LB_2532:
	bts r12,2
LB_2533:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2530
	btr r12,1
	jmp LB_2531
LB_2530:
	bts r12,1
LB_2531:
	add rsp,24
; _some %_2493 ⊢ %_2494 : %_2494
 ; {>  %_2492~0':_stg %_2488~2':_r64 %_2484~1':_r64 %_2493~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_2492 %_2494 }
 ; {>  %_2492~0':_stg %_2494~°0◂3':(_opn)◂(_stg) %_2488~2':_r64 %_2484~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_2542
	mov rdi,r8
	call dlt
LB_2542:
	bt r12,1
	jc LB_2543
	mov rdi,r14
	call dlt
LB_2543:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2546
	btr r12,1
	jmp LB_2547
LB_2546:
	bts r12,1
LB_2547:
	mov rsi,1
	bt r12,1
	jc LB_2544
	mov rsi,0
	bt r14,0
	jc LB_2544
	jmp LB_2545
LB_2544:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_2545:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_2504:
	mov r15,0
LB_2549:
	cmp r15,0
	jz LB_2550
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2549
LB_2550:
; _none {  } ⊢ %_2495 : %_2495
 ; {>  %_2485~2':(_opn)◂({ _r64 (_lst)◂(_p1742) }) %_2484~1':_r64 %_2483~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_2483 %_2495 }
 ; {>  %_2485~2':(_opn)◂({ _r64 (_lst)◂(_p1742) }) %_2495~°1◂{  }:(_opn)◂(t982'(0)) %_2484~1':_r64 %_2483~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_2551
	mov rdi,r8
	call dlt
LB_2551:
	bt r12,1
	jc LB_2552
	mov rdi,r14
	call dlt
LB_2552:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_2553
	mov rsi,0
	bt r14,0
	jc LB_2553
	jmp LB_2554
LB_2553:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_2554:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_2548:
NS_E_2558:
NS_E_RDI_2558:
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
; _f2496 %_2555 ⊢ { %_2556 %_2557 } : { %_2556 %_2557 }
 ; {>  %_2555~0':_stg }
; _f2496 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_2556~0':_stg %_2557~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_2559
	mov rdi,r13
	call dlt
LB_2559:
	bt r12,1
	jc LB_2560
	mov rdi,r14
	call dlt
LB_2560:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_2561:
NS_E_RDI_2561:
NS_E_2561_ETR_TBL:
NS_E_2561_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_2590
LB_2589:
	add r14,1
LB_2590:
	cmp r14,r10
	jge LB_2591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2589
	cmp al,10
	jz LB_2589
	cmp al,32
	jz LB_2589
LB_2591:
	push r10
	call NS_E_675_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2592
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2582
LB_2592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_2595
LB_2594:
	add r14,1
LB_2595:
	cmp r14,r10
	jge LB_2596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2594
	cmp al,10
	jz LB_2594
	cmp al,32
	jz LB_2594
LB_2596:
	add r14,1
	cmp r14,r10
	jg LB_2600
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_2600
	jmp LB_2601
LB_2600:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2598
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2598:
	jmp LB_2582
LB_2601:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
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
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2605
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
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
	jmp LB_2582
LB_2605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2587
	btr r12,2
	jmp LB_2588
LB_2587:
	bts r12,2
LB_2588:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2585
	btr r12,1
	jmp LB_2586
LB_2585:
	bts r12,1
LB_2586:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2583
	btr r12,0
	jmp LB_2584
LB_2583:
	bts r12,0
LB_2584:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2579
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_2609
	btr r12,3
	jmp LB_2610
LB_2609:
	bts r12,3
LB_2610:
	mov r14,r8
	bt r12,2
	jc LB_2611
	btr r12,1
	jmp LB_2612
LB_2611:
	bts r12,1
LB_2612:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f734 { %_2562 %_2563 } ⊢ %_2564 : %_2564
 ; {>  %_2563~1':_p733 %_2562~0':_stg }
; _f734 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2564 ⊢ %_2565 : %_2565
 ; {>  %_2564~°0◂{ 0' 1' }:_p733 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2565
 ; {>  %_2565~°0◂°0◂{ 0' 1' }:(_opn)◂(_p733) }
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
	jc LB_2573
	btr r12,2
	jmp LB_2574
LB_2573:
	bts r12,2
LB_2574:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2571
	btr QWORD [rdi],0
	jmp LB_2572
LB_2571:
	bts QWORD [rdi],0
LB_2572:
	mov r8,r14
	bt r12,1
	jc LB_2577
	btr r12,2
	jmp LB_2578
LB_2577:
	bts r12,2
LB_2578:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2575
	btr QWORD [rdi],1
	jmp LB_2576
LB_2575:
	bts QWORD [rdi],1
LB_2576:
	mov rsi,1
	bt r12,3
	jc LB_2569
	mov rsi,0
	bt r9,0
	jc LB_2569
	jmp LB_2570
LB_2569:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2570:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2579:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2581
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2580
LB_2581:
	add rsp,8
	ret
LB_2582:
	add rsp,48
	pop r14
LB_2580:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_2624
LB_2623:
	add r14,1
LB_2624:
	cmp r14,r10
	jge LB_2625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2623
	cmp al,32
	jz LB_2623
LB_2625:
	push r10
	call NS_E_675_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2626
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2620
LB_2626:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2621
	btr r12,0
	jmp LB_2622
LB_2621:
	bts r12,0
LB_2622:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2617
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f735 %_2566 ⊢ %_2567 : %_2567
 ; {>  %_2566~0':_stg }
; _f735 0' ⊢ °1◂0'
; _some %_2567 ⊢ %_2568 : %_2568
 ; {>  %_2567~°1◂0':_p733 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_2568
 ; {>  %_2568~°0◂°1◂0':(_opn)◂(_p733) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2615
	btr r12,3
	jmp LB_2616
LB_2615:
	bts r12,3
LB_2616:
	mov rsi,1
	bt r12,3
	jc LB_2613
	mov rsi,0
	bt r9,0
	jc LB_2613
	jmp LB_2614
LB_2613:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2614:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2617:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2619
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2618
LB_2619:
	add rsp,8
	ret
LB_2620:
	add rsp,16
	pop r14
LB_2618:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2628:
NS_E_RDI_2628:
NS_E_2628_ETR_TBL:
NS_E_2628_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_57_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2653
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2645
LB_2653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_2661
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_2661
	jmp LB_2662
LB_2661:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2659:
	jmp LB_2645
LB_2662:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2648
	btr r12,1
	jmp LB_2649
LB_2648:
	bts r12,1
LB_2649:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2646
	btr r12,0
	jmp LB_2647
LB_2646:
	bts r12,0
LB_2647:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2642
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f854 %_2629 ⊢ %_2630 : %_2630
 ; {>  %_2629~0':_r64 }
; _f854 0' ⊢ °0◂0'
; _some %_2630 ⊢ %_2631 : %_2631
 ; {>  %_2630~°0◂0':_p799 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_2631
 ; {>  %_2631~°0◂°0◂0':(_opn)◂(_p799) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2640
	btr r12,3
	jmp LB_2641
LB_2640:
	bts r12,3
LB_2641:
	mov rsi,1
	bt r12,3
	jc LB_2638
	mov rsi,0
	bt r9,0
	jc LB_2638
	jmp LB_2639
LB_2638:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2639:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2642:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2644
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2643
LB_2644:
	add rsp,8
	ret
LB_2645:
	add rsp,32
	pop r14
LB_2643:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_178_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2676
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2670
LB_2676:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2671
	btr r12,0
	jmp LB_2672
LB_2671:
	bts r12,0
LB_2672:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2667
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f855 %_2632 ⊢ %_2633 : %_2633
 ; {>  %_2632~0':_stg }
; _f855 0' ⊢ °1◂0'
; _some %_2633 ⊢ %_2634 : %_2634
 ; {>  %_2633~°1◂0':_p799 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_2634
 ; {>  %_2634~°0◂°1◂0':(_opn)◂(_p799) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2665
	btr r12,3
	jmp LB_2666
LB_2665:
	bts r12,3
LB_2666:
	mov rsi,1
	bt r12,3
	jc LB_2663
	mov rsi,0
	bt r9,0
	jc LB_2663
	jmp LB_2664
LB_2663:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2664:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2667:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2669
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2668
LB_2669:
	add rsp,8
	ret
LB_2670:
	add rsp,16
	pop r14
LB_2668:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2691
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2685
LB_2691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2686
	btr r12,0
	jmp LB_2687
LB_2686:
	bts r12,0
LB_2687:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2682
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f856 %_2635 ⊢ %_2636 : %_2636
 ; {>  %_2635~0':_p733 }
; _f856 0' ⊢ °2◂0'
; _some %_2636 ⊢ %_2637 : %_2637
 ; {>  %_2636~°2◂0':_p799 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_2637
 ; {>  %_2637~°0◂°2◂0':(_opn)◂(_p799) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2680
	btr r12,3
	jmp LB_2681
LB_2680:
	bts r12,3
LB_2681:
	mov rsi,1
	bt r12,3
	jc LB_2678
	mov rsi,0
	bt r9,0
	jc LB_2678
	jmp LB_2679
LB_2678:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2679:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2682:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2684
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2683
LB_2684:
	add rsp,8
	ret
LB_2685:
	add rsp,16
	pop r14
LB_2683:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2694:
NS_E_RDI_2694:
NS_E_2694_ETR_TBL:
NS_E_2694_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_2701
LB_2700:
	add r14,1
LB_2701:
	cmp r14,r10
	jge LB_2702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2700
	cmp al,32
	jz LB_2700
LB_2702:
	add r14,1
	cmp r14,r10
	jg LB_2705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2705
	jmp LB_2706
LB_2705:
	jmp LB_2696
LB_2706:
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
LB_2711:
	jmp LB_2708
LB_2707:
	add r14,1
LB_2708:
	cmp r14,r10
	jge LB_2709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2707
	cmp al,32
	jz LB_2707
LB_2709:
	add r14,1
	cmp r14,r10
	jg LB_2710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2710
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
	jmp LB_2711
LB_2710:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2697
	btr QWORD [rdi],1
LB_2697:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2698
	btr QWORD [rdi],0
LB_2698:
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
LB_2696:
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
NS_E_2721:
; 	|» { 0' 1' }
NS_E_RDI_2721:
MTC_LB_2722:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2723
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
	jnc LB_2724
	bt QWORD [rax],0
	jc LB_2725
	btr r12,4
	jmp LB_2726
LB_2725:
	bts r12,4
LB_2726:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2724:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2729
	btr r12,5
	jmp LB_2730
LB_2729:
	bts r12,5
LB_2730:
	mov r8,r11
	bt r12,5
	jc LB_2727
	btr r12,2
	jmp LB_2728
LB_2727:
	bts r12,2
LB_2728:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2733
	btr r12,5
	jmp LB_2734
LB_2733:
	bts r12,5
LB_2734:
	mov r9,r11
	bt r12,5
	jc LB_2731
	btr r12,3
	jmp LB_2732
LB_2731:
	bts r12,3
LB_2732:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2735:
	cmp r15,0
	jz LB_2736
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2735
LB_2736:
; _f851 { %_2715 %_2717 } ⊢ %_2719 : %_2719
 ; {>  %_2718~3':(_lst)◂(_p798) %_2715~0':_p798 %_2717~2':_p798 }
; _f851 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f2721 { %_2719 %_2718 } ⊢ %_2720 : %_2720
 ; {>  %_2719~°2◂{ 0' 2' }:_p798 %_2718~3':(_lst)◂(_p798) }
; _f2721 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2737
	btr r12,1
	jmp LB_2738
LB_2737:
	bts r12,1
LB_2738:
	mov r9,r13
	bt r12,0
	jc LB_2739
	btr r12,3
	jmp LB_2740
LB_2739:
	bts r12,3
LB_2740:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_2745
	btr r12,4
	jmp LB_2746
LB_2745:
	bts r12,4
LB_2746:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_2743
	btr QWORD [rdi],0
	jmp LB_2744
LB_2743:
	bts QWORD [rdi],0
LB_2744:
	mov r10,r8
	bt r12,2
	jc LB_2749
	btr r12,4
	jmp LB_2750
LB_2749:
	bts r12,4
LB_2750:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_2747
	btr QWORD [rdi],1
	jmp LB_2748
LB_2747:
	bts QWORD [rdi],1
LB_2748:
	mov rsi,1
	bt r12,0
	jc LB_2741
	mov rsi,0
	bt r13,0
	jc LB_2741
	jmp LB_2742
LB_2741:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_2742:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_2721
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2720
 ; {>  %_2720~0':_p798 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2723:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2751
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
	jnc LB_2752
	bt QWORD [rax],0
	jc LB_2753
	btr r12,2
	jmp LB_2754
LB_2753:
	bts r12,2
LB_2754:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2752:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2755:
	cmp r15,0
	jz LB_2756
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2755
LB_2756:
; ∎ %_2715
 ; {>  %_2715~0':_p798 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2751:
NS_E_2757:
NS_E_RDI_2757:
NS_E_2757_ETR_TBL:
NS_E_2757_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_2804
LB_2803:
	add r14,1
LB_2804:
	cmp r14,r10
	jge LB_2805
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2803
	cmp al,10
	jz LB_2803
	cmp al,32
	jz LB_2803
LB_2805:
	add r14,1
	cmp r14,r10
	jg LB_2808
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_2808
	jmp LB_2809
LB_2808:
	jmp LB_2796
LB_2809:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_2811
LB_2810:
	add r14,1
LB_2811:
	cmp r14,r10
	jge LB_2812
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2810
	cmp al,10
	jz LB_2810
	cmp al,32
	jz LB_2810
LB_2812:
	push r10
	call NS_E_2758_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2813
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2814
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2814:
	jmp LB_2796
LB_2813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_2817
LB_2816:
	add r14,1
LB_2817:
	cmp r14,r10
	jge LB_2818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2816
	cmp al,10
	jz LB_2816
	cmp al,32
	jz LB_2816
LB_2818:
	add r14,1
	cmp r14,r10
	jg LB_2823
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_2823
	jmp LB_2824
LB_2823:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2820
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2820:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2821:
	jmp LB_2796
LB_2824:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2801
	btr r12,2
	jmp LB_2802
LB_2801:
	bts r12,2
LB_2802:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2799
	btr r12,1
	jmp LB_2800
LB_2799:
	bts r12,1
LB_2800:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2797
	btr r12,0
	jmp LB_2798
LB_2797:
	bts r12,0
LB_2798:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2793
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_2825
	btr r12,3
	jmp LB_2826
LB_2825:
	bts r12,3
LB_2826:
	mov r13,r14
	bt r12,1
	jc LB_2827
	btr r12,0
	jmp LB_2828
LB_2827:
	bts r12,0
LB_2828:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f845 %_2761 ⊢ %_2762 : %_2762
 ; {>  %_2761~0':(_lst)◂(_p796) }
; _f845 0' ⊢ °0◂0'
; _some %_2762 ⊢ %_2763 : %_2763
 ; {>  %_2762~°0◂0':_p796 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_2763
 ; {>  %_2763~°0◂°0◂0':(_opn)◂(_p796) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2791
	btr r12,3
	jmp LB_2792
LB_2791:
	bts r12,3
LB_2792:
	mov rsi,1
	bt r12,3
	jc LB_2789
	mov rsi,0
	bt r9,0
	jc LB_2789
	jmp LB_2790
LB_2789:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2790:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2793:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2795
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2794
LB_2795:
	add rsp,8
	ret
LB_2796:
	add rsp,48
	pop r14
LB_2794:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; src
	jmp LB_2840
LB_2839:
	add r14,1
LB_2840:
	cmp r14,r10
	jge LB_2841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2839
	cmp al,10
	jz LB_2839
	cmp al,32
	jz LB_2839
LB_2841:
	push r10
	call NS_E_2760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2836
LB_2842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2837
	btr r12,0
	jmp LB_2838
LB_2837:
	bts r12,0
LB_2838:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2833
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f846 %_2764 ⊢ %_2765 : %_2765
 ; {>  %_2764~0':_p794 }
; _f846 0' ⊢ °1◂0'
; _some %_2765 ⊢ %_2766 : %_2766
 ; {>  %_2765~°1◂0':_p796 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_2766
 ; {>  %_2766~°0◂°1◂0':(_opn)◂(_p796) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2831
	btr r12,3
	jmp LB_2832
LB_2831:
	bts r12,3
LB_2832:
	mov rsi,1
	bt r12,3
	jc LB_2829
	mov rsi,0
	bt r9,0
	jc LB_2829
	jmp LB_2830
LB_2829:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2830:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2833:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2835
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2834
LB_2835:
	add rsp,8
	ret
LB_2836:
	add rsp,16
	pop r14
LB_2834:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2758:
NS_E_RDI_2758:
NS_E_2758_ETR_TBL:
NS_E_2758_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; src_ptn
	jmp LB_2863
LB_2862:
	add r14,1
LB_2863:
	cmp r14,r10
	jge LB_2864
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2862
	cmp al,10
	jz LB_2862
	cmp al,32
	jz LB_2862
LB_2864:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2865
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2857
LB_2865:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_2868
LB_2867:
	add r14,1
LB_2868:
	cmp r14,r10
	jge LB_2869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2867
	cmp al,10
	jz LB_2867
	cmp al,32
	jz LB_2867
LB_2869:
	push r10
	call NS_E_2758_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2870
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2871:
	jmp LB_2857
LB_2870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2860
	btr r12,1
	jmp LB_2861
LB_2860:
	bts r12,1
LB_2861:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2858
	btr r12,0
	jmp LB_2859
LB_2858:
	bts r12,0
LB_2859:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2854
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_2767 %_2768 } ⊢ %_2769 : %_2769
 ; {>  %_2767~0':_p796 %_2768~1':(_lst)◂(_p796) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2769 ⊢ %_2770 : %_2770
 ; {>  %_2769~°0◂{ 0' 1' }:(_lst)◂(_p796) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2770
 ; {>  %_2770~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p796)) }
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
	jc LB_2848
	btr r12,2
	jmp LB_2849
LB_2848:
	bts r12,2
LB_2849:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2846
	btr QWORD [rdi],0
	jmp LB_2847
LB_2846:
	bts QWORD [rdi],0
LB_2847:
	mov r8,r14
	bt r12,1
	jc LB_2852
	btr r12,2
	jmp LB_2853
LB_2852:
	bts r12,2
LB_2853:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2850
	btr QWORD [rdi],1
	jmp LB_2851
LB_2850:
	bts QWORD [rdi],1
LB_2851:
	mov rsi,1
	bt r12,3
	jc LB_2844
	mov rsi,0
	bt r9,0
	jc LB_2844
	jmp LB_2845
LB_2844:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2845:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2854:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2856
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2855
LB_2856:
	add rsp,8
	ret
LB_2857:
	add rsp,32
	pop r14
LB_2855:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_2875
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_2771 : %_2771
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_2771 ⊢ %_2772 : %_2772
 ; {>  %_2771~°1◂{  }:(_lst)◂(t1088'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_2772
 ; {>  %_2772~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1091'(0))) }
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
	jc LB_2873
	mov rsi,0
	bt r9,0
	jc LB_2873
	jmp LB_2874
LB_2873:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2874:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2875:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2877
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2876
LB_2877:
	add rsp,8
	ret
LB_2878:
	add rsp,0
	pop r14
LB_2876:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2759:
NS_E_RDI_2759:
NS_E_2759_ETR_TBL:
NS_E_2759_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_2916
LB_2915:
	add r14,1
LB_2916:
	cmp r14,r10
	jge LB_2917
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2915
	cmp al,10
	jz LB_2915
	cmp al,32
	jz LB_2915
LB_2917:
	add r14,1
	cmp r14,r10
	jg LB_2920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_2920
	jmp LB_2921
LB_2920:
	jmp LB_2894
LB_2921:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_2903
LB_2902:
	add r14,1
LB_2903:
	cmp r14,r10
	jge LB_2904
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2902
	cmp al,10
	jz LB_2902
	cmp al,32
	jz LB_2902
LB_2904:
	push r10
	call NS_E_2760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2905
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2906
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2906:
	jmp LB_2895
LB_2905:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_2909
LB_2908:
	add r14,1
LB_2909:
	cmp r14,r10
	jge LB_2910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2908
	cmp al,10
	jz LB_2908
	cmp al,32
	jz LB_2908
LB_2910:
	push r10
	call NS_E_2759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2911
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2912
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2912:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2913
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2913:
	jmp LB_2895
LB_2911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2900
	btr r12,2
	jmp LB_2901
LB_2900:
	bts r12,2
LB_2901:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2898
	btr r12,1
	jmp LB_2899
LB_2898:
	bts r12,1
LB_2899:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2896
	btr r12,0
	jmp LB_2897
LB_2896:
	bts r12,0
LB_2897:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2891
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_2922
	btr r12,3
	jmp LB_2923
LB_2922:
	bts r12,3
LB_2923:
	mov r14,r8
	bt r12,2
	jc LB_2924
	btr r12,1
	jmp LB_2925
LB_2924:
	bts r12,1
LB_2925:
	mov r8,r13
	bt r12,0
	jc LB_2926
	btr r12,2
	jmp LB_2927
LB_2926:
	bts r12,2
LB_2927:
	mov r13,r9
	bt r12,3
	jc LB_2928
	btr r12,0
	jmp LB_2929
LB_2928:
	bts r12,0
LB_2929:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f846 %_2773 ⊢ %_2775 : %_2775
 ; {>  %_2774~1':(_lst)◂(_p796) %_2773~0':_p794 }
; _f846 0' ⊢ °1◂0'
; _cns { %_2775 %_2774 } ⊢ %_2776 : %_2776
 ; {>  %_2774~1':(_lst)◂(_p796) %_2775~°1◂0':_p796 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_2776 ⊢ %_2777 : %_2777
 ; {>  %_2776~°0◂{ °1◂0' 1' }:(_lst)◂(_p796) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_2777
 ; {>  %_2777~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p796)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_2885
	btr r12,2
	jmp LB_2886
LB_2885:
	bts r12,2
LB_2886:
	mov rsi,1
	bt r12,2
	jc LB_2883
	mov rsi,0
	bt r8,0
	jc LB_2883
	jmp LB_2884
LB_2883:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_2884:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2881
	btr QWORD [rdi],0
	jmp LB_2882
LB_2881:
	bts QWORD [rdi],0
LB_2882:
	mov r8,r14
	bt r12,1
	jc LB_2889
	btr r12,2
	jmp LB_2890
LB_2889:
	bts r12,2
LB_2890:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2887
	btr QWORD [rdi],1
	jmp LB_2888
LB_2887:
	bts QWORD [rdi],1
LB_2888:
	mov rsi,1
	bt r12,3
	jc LB_2879
	mov rsi,0
	bt r9,0
	jc LB_2879
	jmp LB_2880
LB_2879:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2880:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2891:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2893
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2892
LB_2893:
	add rsp,8
	ret
LB_2895:
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
LB_2894:
	add rsp,48
	pop r14
LB_2892:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_2932
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_2778 : %_2778
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_2778 ⊢ %_2779 : %_2779
 ; {>  %_2778~°1◂{  }:(_lst)◂(t1102'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_2779
 ; {>  %_2779~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1105'(0))) }
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
	jc LB_2930
	mov rsi,0
	bt r9,0
	jc LB_2930
	jmp LB_2931
LB_2930:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2931:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2932:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2934
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2933
LB_2934:
	add rsp,8
	ret
LB_2935:
	add rsp,0
	pop r14
LB_2933:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2760:
NS_E_RDI_2760:
NS_E_2760_ETR_TBL:
NS_E_2760_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "%["
	jmp LB_2951
LB_2950:
	add r14,1
LB_2951:
	cmp r14,r10
	jge LB_2952
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2950
	cmp al,10
	jz LB_2950
	cmp al,32
	jz LB_2950
LB_2952:
	add r14,2
	cmp r14,r10
	jg LB_2955
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_2955
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_2955
	jmp LB_2956
LB_2955:
	jmp LB_2943
LB_2956:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_2958
LB_2957:
	add r14,1
LB_2958:
	cmp r14,r10
	jge LB_2959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2957
	cmp al,10
	jz LB_2957
	cmp al,32
	jz LB_2957
LB_2959:
	push r10
	call NS_E_2628_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2960
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2961
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2961:
	jmp LB_2943
LB_2960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_2964
LB_2963:
	add r14,1
LB_2964:
	cmp r14,r10
	jge LB_2965
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2963
	cmp al,10
	jz LB_2963
	cmp al,32
	jz LB_2963
LB_2965:
	add r14,1
	cmp r14,r10
	jg LB_2970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_2970
	jmp LB_2971
LB_2970:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2967
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2967:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2968:
	jmp LB_2943
LB_2971:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2948
	btr r12,2
	jmp LB_2949
LB_2948:
	bts r12,2
LB_2949:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2946
	btr r12,1
	jmp LB_2947
LB_2946:
	bts r12,1
LB_2947:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2944
	btr r12,0
	jmp LB_2945
LB_2944:
	bts r12,0
LB_2945:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2940
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_2972
	btr r12,3
	jmp LB_2973
LB_2972:
	bts r12,3
LB_2973:
	mov r13,r14
	bt r12,1
	jc LB_2974
	btr r12,0
	jmp LB_2975
LB_2974:
	bts r12,0
LB_2975:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f841 %_2780 ⊢ %_2781 : %_2781
 ; {>  %_2780~0':_p799 }
; _f841 0' ⊢ °0◂0'
; _some %_2781 ⊢ %_2782 : %_2782
 ; {>  %_2781~°0◂0':_p794 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_2782
 ; {>  %_2782~°0◂°0◂0':(_opn)◂(_p794) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2938
	btr r12,3
	jmp LB_2939
LB_2938:
	bts r12,3
LB_2939:
	mov rsi,1
	bt r12,3
	jc LB_2936
	mov rsi,0
	bt r9,0
	jc LB_2936
	jmp LB_2937
LB_2936:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2937:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2940:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2942
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2941
LB_2942:
	add rsp,8
	ret
LB_2943:
	add rsp,48
	pop r14
LB_2941:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_3000
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_3000
	jmp LB_3001
LB_3000:
	jmp LB_2983
LB_3001:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_675_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2992
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2993:
	jmp LB_2984
LB_2992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2987
	btr r12,1
	jmp LB_2988
LB_2987:
	bts r12,1
LB_2988:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2985
	btr r12,0
	jmp LB_2986
LB_2985:
	bts r12,0
LB_2986:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2980
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3002
	btr r12,2
	jmp LB_3003
LB_3002:
	bts r12,2
LB_3003:
	mov r13,r14
	bt r12,1
	jc LB_3004
	btr r12,0
	jmp LB_3005
LB_3004:
	bts r12,0
LB_3005:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f842 %_2783 ⊢ %_2784 : %_2784
 ; {>  %_2783~0':_stg }
; _f842 0' ⊢ °1◂0'
; _some %_2784 ⊢ %_2785 : %_2785
 ; {>  %_2784~°1◂0':_p794 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_2785
 ; {>  %_2785~°0◂°1◂0':(_opn)◂(_p794) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2978
	btr r12,3
	jmp LB_2979
LB_2978:
	bts r12,3
LB_2979:
	mov rsi,1
	bt r12,3
	jc LB_2976
	mov rsi,0
	bt r9,0
	jc LB_2976
	jmp LB_2977
LB_2976:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_2977:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2980:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2982
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2981
LB_2982:
	add rsp,8
	ret
LB_2984:
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
LB_2983:
	add rsp,32
	pop r14
LB_2981:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_3017
LB_3016:
	add r14,1
LB_3017:
	cmp r14,r10
	jge LB_3018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3016
	cmp al,10
	jz LB_3016
	cmp al,32
	jz LB_3016
LB_3018:
	push r10
	call NS_E_675_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3019
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3013
LB_3019:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3014
	btr r12,0
	jmp LB_3015
LB_3014:
	bts r12,0
LB_3015:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3010
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f842 %_2786 ⊢ %_2787 : %_2787
 ; {>  %_2786~0':_stg }
; _f842 0' ⊢ °1◂0'
; _some %_2787 ⊢ %_2788 : %_2788
 ; {>  %_2787~°1◂0':_p794 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_2788
 ; {>  %_2788~°0◂°1◂0':(_opn)◂(_p794) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3008
	btr r12,3
	jmp LB_3009
LB_3008:
	bts r12,3
LB_3009:
	mov rsi,1
	bt r12,3
	jc LB_3006
	mov rsi,0
	bt r9,0
	jc LB_3006
	jmp LB_3007
LB_3006:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3007:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3010:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3012
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3011
LB_3012:
	add rsp,8
	ret
LB_3013:
	add rsp,16
	pop r14
LB_3011:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3021:
NS_E_RDI_3021:
NS_E_3021_ETR_TBL:
NS_E_3021_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_3071
LB_3070:
	add r14,1
LB_3071:
	cmp r14,r10
	jge LB_3072
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3070
	cmp al,10
	jz LB_3070
	cmp al,32
	jz LB_3070
LB_3072:
	add r14,1
	cmp r14,r10
	jg LB_3075
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_3075
	jmp LB_3076
LB_3075:
	jmp LB_3063
LB_3076:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
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
	call NS_E_3022_ETR_TBL
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
	jmp LB_3063
LB_3080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
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
	add r14,1
	cmp r14,r10
	jg LB_3090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_3090
	jmp LB_3091
LB_3090:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3087
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3087:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3088
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3088:
	jmp LB_3063
LB_3091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3068
	btr r12,2
	jmp LB_3069
LB_3068:
	bts r12,2
LB_3069:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3066
	btr r12,1
	jmp LB_3067
LB_3066:
	bts r12,1
LB_3067:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3064
	btr r12,0
	jmp LB_3065
LB_3064:
	bts r12,0
LB_3065:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3060
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_3092
	btr r12,3
	jmp LB_3093
LB_3092:
	bts r12,3
LB_3093:
	mov r13,r14
	bt r12,1
	jc LB_3094
	btr r12,0
	jmp LB_3095
LB_3094:
	bts r12,0
LB_3095:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f847 %_3027 ⊢ %_3028 : %_3028
 ; {>  %_3027~0':(_lst)◂(_p797) }
; _f847 0' ⊢ °0◂0'
; _some %_3028 ⊢ %_3029 : %_3029
 ; {>  %_3028~°0◂0':_p797 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3029
 ; {>  %_3029~°0◂°0◂0':(_opn)◂(_p797) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3058
	btr r12,3
	jmp LB_3059
LB_3058:
	bts r12,3
LB_3059:
	mov rsi,1
	bt r12,3
	jc LB_3056
	mov rsi,0
	bt r9,0
	jc LB_3056
	jmp LB_3057
LB_3056:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3057:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3060:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3062
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3061
LB_3062:
	add rsp,8
	ret
LB_3063:
	add rsp,48
	pop r14
LB_3061:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dst
	jmp LB_3107
LB_3106:
	add r14,1
LB_3107:
	cmp r14,r10
	jge LB_3108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3106
	cmp al,10
	jz LB_3106
	cmp al,32
	jz LB_3106
LB_3108:
	push r10
	call NS_E_3026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3109
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3103
LB_3109:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3104
	btr r12,0
	jmp LB_3105
LB_3104:
	bts r12,0
LB_3105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3100
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f848 %_3030 ⊢ %_3031 : %_3031
 ; {>  %_3030~0':_p795 }
; _f848 0' ⊢ °1◂0'
; _some %_3031 ⊢ %_3032 : %_3032
 ; {>  %_3031~°1◂0':_p797 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3032
 ; {>  %_3032~°0◂°1◂0':(_opn)◂(_p797) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3098
	btr r12,3
	jmp LB_3099
LB_3098:
	bts r12,3
LB_3099:
	mov rsi,1
	bt r12,3
	jc LB_3096
	mov rsi,0
	bt r9,0
	jc LB_3096
	jmp LB_3097
LB_3096:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3097:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3102
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3101
LB_3102:
	add rsp,8
	ret
LB_3103:
	add rsp,16
	pop r14
LB_3101:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3022:
NS_E_RDI_3022:
NS_E_3022_ETR_TBL:
NS_E_3022_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_3130
LB_3129:
	add r14,1
LB_3130:
	cmp r14,r10
	jge LB_3131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3129
	cmp al,10
	jz LB_3129
	cmp al,32
	jz LB_3129
LB_3131:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3132
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3124
LB_3132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_3135
LB_3134:
	add r14,1
LB_3135:
	cmp r14,r10
	jge LB_3136
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3134
	cmp al,10
	jz LB_3134
	cmp al,32
	jz LB_3134
LB_3136:
	push r10
	call NS_E_3022_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3137
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3138
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3138:
	jmp LB_3124
LB_3137:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3127
	btr r12,1
	jmp LB_3128
LB_3127:
	bts r12,1
LB_3128:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3125
	btr r12,0
	jmp LB_3126
LB_3125:
	bts r12,0
LB_3126:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3121
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3033 %_3034 } ⊢ %_3035 : %_3035
 ; {>  %_3034~1':(_lst)◂(_p797) %_3033~0':_p797 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3035 ⊢ %_3036 : %_3036
 ; {>  %_3035~°0◂{ 0' 1' }:(_lst)◂(_p797) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3036
 ; {>  %_3036~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p797)) }
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
	jc LB_3115
	btr r12,2
	jmp LB_3116
LB_3115:
	bts r12,2
LB_3116:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3113
	btr QWORD [rdi],0
	jmp LB_3114
LB_3113:
	bts QWORD [rdi],0
LB_3114:
	mov r8,r14
	bt r12,1
	jc LB_3119
	btr r12,2
	jmp LB_3120
LB_3119:
	bts r12,2
LB_3120:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3117
	btr QWORD [rdi],1
	jmp LB_3118
LB_3117:
	bts QWORD [rdi],1
LB_3118:
	mov rsi,1
	bt r12,3
	jc LB_3111
	mov rsi,0
	bt r9,0
	jc LB_3111
	jmp LB_3112
LB_3111:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3112:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3121:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3123
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3122
LB_3123:
	add rsp,8
	ret
LB_3124:
	add rsp,32
	pop r14
LB_3122:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3142
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3037 : %_3037
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3037 ⊢ %_3038 : %_3038
 ; {>  %_3037~°1◂{  }:(_lst)◂(t1190'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3038
 ; {>  %_3038~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1193'(0))) }
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
	jc LB_3140
	mov rsi,0
	bt r9,0
	jc LB_3140
	jmp LB_3141
LB_3140:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3141:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3144
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3143
LB_3144:
	add rsp,8
	ret
LB_3145:
	add rsp,0
	pop r14
LB_3143:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3024:
NS_E_RDI_3024:
NS_E_3024_ETR_TBL:
NS_E_3024_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_3168
LB_3167:
	add r14,1
LB_3168:
	cmp r14,r10
	jge LB_3169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3167
	cmp al,10
	jz LB_3167
	cmp al,32
	jz LB_3167
LB_3169:
	add r14,1
	cmp r14,r10
	jg LB_3172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_3172
	jmp LB_3173
LB_3172:
	jmp LB_3146
LB_3173:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_3155
LB_3154:
	add r14,1
LB_3155:
	cmp r14,r10
	jge LB_3156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3154
	cmp al,10
	jz LB_3154
	cmp al,32
	jz LB_3154
LB_3156:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3157
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3158
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3158:
	jmp LB_3147
LB_3157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_3161
LB_3160:
	add r14,1
LB_3161:
	cmp r14,r10
	jge LB_3162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3160
	cmp al,10
	jz LB_3160
	cmp al,32
	jz LB_3160
LB_3162:
	push r10
	call NS_E_3024_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3163
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3164
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3164:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3165
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3165:
	jmp LB_3147
LB_3163:
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
	jc LB_3150
	btr QWORD [rdi],2
LB_3150:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3151
	btr QWORD [rdi],1
LB_3151:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3152
	btr QWORD [rdi],0
LB_3152:
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
LB_3147:
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
LB_3146:
	add rsp,48
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
LB_3148:
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
NS_E_3025:
NS_E_RDI_3025:
NS_E_3025_ETR_TBL:
NS_E_3025_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
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
	jg LB_3215
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_3215
	jmp LB_3216
LB_3215:
	jmp LB_3189
LB_3216:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
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
	push r10
	call NS_E_3026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3200
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3201:
	jmp LB_3190
LB_3200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_3204
LB_3203:
	add r14,1
LB_3204:
	cmp r14,r10
	jge LB_3205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3203
	cmp al,10
	jz LB_3203
	cmp al,32
	jz LB_3203
LB_3205:
	push r10
	call NS_E_3025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3206
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3207
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3207:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3208:
	jmp LB_3190
LB_3206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3195
	btr r12,2
	jmp LB_3196
LB_3195:
	bts r12,2
LB_3196:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3193
	btr r12,1
	jmp LB_3194
LB_3193:
	bts r12,1
LB_3194:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3191
	btr r12,0
	jmp LB_3192
LB_3191:
	bts r12,0
LB_3192:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3186
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3217
	btr r12,3
	jmp LB_3218
LB_3217:
	bts r12,3
LB_3218:
	mov r14,r8
	bt r12,2
	jc LB_3219
	btr r12,1
	jmp LB_3220
LB_3219:
	bts r12,1
LB_3220:
	mov r8,r13
	bt r12,0
	jc LB_3221
	btr r12,2
	jmp LB_3222
LB_3221:
	bts r12,2
LB_3222:
	mov r13,r9
	bt r12,3
	jc LB_3223
	btr r12,0
	jmp LB_3224
LB_3223:
	bts r12,0
LB_3224:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f848 %_3041 ⊢ %_3043 : %_3043
 ; {>  %_3042~1':(_lst)◂(_p797) %_3041~0':_p795 }
; _f848 0' ⊢ °1◂0'
; _cns { %_3043 %_3042 } ⊢ %_3044 : %_3044
 ; {>  %_3042~1':(_lst)◂(_p797) %_3043~°1◂0':_p797 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_3044 ⊢ %_3045 : %_3045
 ; {>  %_3044~°0◂{ °1◂0' 1' }:(_lst)◂(_p797) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_3045
 ; {>  %_3045~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p797)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3180
	btr r12,2
	jmp LB_3181
LB_3180:
	bts r12,2
LB_3181:
	mov rsi,1
	bt r12,2
	jc LB_3178
	mov rsi,0
	bt r8,0
	jc LB_3178
	jmp LB_3179
LB_3178:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3179:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3176
	btr QWORD [rdi],0
	jmp LB_3177
LB_3176:
	bts QWORD [rdi],0
LB_3177:
	mov r8,r14
	bt r12,1
	jc LB_3184
	btr r12,2
	jmp LB_3185
LB_3184:
	bts r12,2
LB_3185:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3182
	btr QWORD [rdi],1
	jmp LB_3183
LB_3182:
	bts QWORD [rdi],1
LB_3183:
	mov rsi,1
	bt r12,3
	jc LB_3174
	mov rsi,0
	bt r9,0
	jc LB_3174
	jmp LB_3175
LB_3174:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3175:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3186:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3188
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3187
LB_3188:
	add rsp,8
	ret
LB_3190:
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
LB_3189:
	add rsp,48
	pop r14
LB_3187:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3227
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3046 : %_3046
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3046 ⊢ %_3047 : %_3047
 ; {>  %_3046~°1◂{  }:(_lst)◂(t1204'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3047
 ; {>  %_3047~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1207'(0))) }
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
	jc LB_3225
	mov rsi,0
	bt r9,0
	jc LB_3225
	jmp LB_3226
LB_3225:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3226:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3227:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3229
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3228
LB_3229:
	add rsp,8
	ret
LB_3230:
	add rsp,0
	pop r14
LB_3228:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3026:
NS_E_RDI_3026:
NS_E_3026_ETR_TBL:
NS_E_3026_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_3255
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_3255
	jmp LB_3256
LB_3255:
	jmp LB_3238
LB_3256:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3248
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3248:
	jmp LB_3239
LB_3247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3242
	btr r12,1
	jmp LB_3243
LB_3242:
	bts r12,1
LB_3243:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3240
	btr r12,0
	jmp LB_3241
LB_3240:
	bts r12,0
LB_3241:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3235
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3257
	btr r12,2
	jmp LB_3258
LB_3257:
	bts r12,2
LB_3258:
	mov r13,r14
	bt r12,1
	jc LB_3259
	btr r12,0
	jmp LB_3260
LB_3259:
	bts r12,0
LB_3260:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f844 %_3048 ⊢ %_3049 : %_3049
 ; {>  %_3048~0':_stg }
; _f844 0' ⊢ °1◂0'
; _some %_3049 ⊢ %_3050 : %_3050
 ; {>  %_3049~°1◂0':_p795 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3050
 ; {>  %_3050~°0◂°1◂0':(_opn)◂(_p795) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3233
	btr r12,3
	jmp LB_3234
LB_3233:
	bts r12,3
LB_3234:
	mov rsi,1
	bt r12,3
	jc LB_3231
	mov rsi,0
	bt r9,0
	jc LB_3231
	jmp LB_3232
LB_3231:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3232:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3235:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3237
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3236
LB_3237:
	add rsp,8
	ret
LB_3239:
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
LB_3238:
	add rsp,32
	pop r14
LB_3236:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3274
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3268
LB_3274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3269
	btr r12,0
	jmp LB_3270
LB_3269:
	bts r12,0
LB_3270:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3265
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f844 %_3051 ⊢ %_3052 : %_3052
 ; {>  %_3051~0':_stg }
; _f844 0' ⊢ °1◂0'
; _some %_3052 ⊢ %_3053 : %_3053
 ; {>  %_3052~°1◂0':_p795 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3053
 ; {>  %_3053~°0◂°1◂0':(_opn)◂(_p795) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3263
	btr r12,3
	jmp LB_3264
LB_3263:
	bts r12,3
LB_3264:
	mov rsi,1
	bt r12,3
	jc LB_3261
	mov rsi,0
	bt r9,0
	jc LB_3261
	jmp LB_3262
LB_3261:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3262:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3265:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3267
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3266
LB_3267:
	add rsp,8
	ret
LB_3268:
	add rsp,16
	pop r14
LB_3266:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_3289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_3289
	jmp LB_3290
LB_3289:
	jmp LB_3281
LB_3290:
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
	jc LB_3282
	btr r12,0
	jmp LB_3283
LB_3282:
	bts r12,0
LB_3283:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3278
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f843 {  } ⊢ %_3054 : %_3054
 ; {>  }
; _f843 {  } ⊢ °0◂{  }
; _some %_3054 ⊢ %_3055 : %_3055
 ; {>  %_3054~°0◂{  }:_p795 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_3055
 ; {>  %_3055~°0◂°0◂{  }:(_opn)◂(_p795) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_3276
	mov rsi,0
	bt r9,0
	jc LB_3276
	jmp LB_3277
LB_3276:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3277:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3278:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3280
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3279
LB_3280:
	add rsp,8
	ret
LB_3281:
	add rsp,16
	pop r14
LB_3279:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3291:
NS_E_RDI_3291:
NS_E_3291_ETR_TBL:
NS_E_3291_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_3369
LB_3368:
	add r14,1
LB_3369:
	cmp r14,r10
	jge LB_3370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3368
	cmp al,10
	jz LB_3368
	cmp al,32
	jz LB_3368
LB_3370:
	push r10
	call NS_E_3294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3371
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3361
LB_3371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_3374
LB_3373:
	add r14,1
LB_3374:
	cmp r14,r10
	jge LB_3375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3373
	cmp al,10
	jz LB_3373
	cmp al,32
	jz LB_3373
LB_3375:
	push r10
	call NS_E_3293_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3376
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3377
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3377:
	jmp LB_3361
LB_3376:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_3380
LB_3379:
	add r14,1
LB_3380:
	cmp r14,r10
	jge LB_3381
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3379
	cmp al,10
	jz LB_3379
	cmp al,32
	jz LB_3379
LB_3381:
	push r10
	call NS_E_3292_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3382
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3383
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3383:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3384
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3384:
	jmp LB_3361
LB_3382:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3366
	btr r12,2
	jmp LB_3367
LB_3366:
	bts r12,2
LB_3367:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3364
	btr r12,1
	jmp LB_3365
LB_3364:
	bts r12,1
LB_3365:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3362
	btr r12,0
	jmp LB_3363
LB_3362:
	bts r12,0
LB_3363:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3358
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f2721 { %_3296 %_3297 } ⊢ %_3299 : %_3299
 ; {>  %_3297~1':(_lst)◂(_p798) %_3296~0':_p798 %_3298~2':(_opn)◂(_p798) }
; _f2721 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2721
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3329
	btr r12,2
	jmp LB_3330
LB_3329:
	bts r12,2
LB_3330:
	add rsp,16
MTC_LB_3331:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3332
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_3333
	bt QWORD [rax],0
	jc LB_3334
	btr r12,3
	jmp LB_3335
LB_3334:
	bts r12,3
LB_3335:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3333:
	mov r9,rax
	mov r14,r9
	bt r12,3
	jc LB_3336
	btr r12,1
	jmp LB_3337
LB_3336:
	bts r12,1
LB_3337:
LB_3338:
	cmp r15,0
	jz LB_3339
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3338
LB_3339:
; _f850 { %_3299 %_3300 } ⊢ %_3301 : %_3301
 ; {>  %_3300~1':_p798 %_3299~0':_p798 }
; _f850 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_3301 ⊢ %_3302 : %_3302
 ; {>  %_3301~°1◂{ 0' 1' }:_p798 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_3302
 ; {>  %_3302~°0◂°1◂{ 0' 1' }:(_opn)◂(_p798) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3344
	btr r12,2
	jmp LB_3345
LB_3344:
	bts r12,2
LB_3345:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3342
	btr QWORD [rdi],0
	jmp LB_3343
LB_3342:
	bts QWORD [rdi],0
LB_3343:
	mov r8,r14
	bt r12,1
	jc LB_3348
	btr r12,2
	jmp LB_3349
LB_3348:
	bts r12,2
LB_3349:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3346
	btr QWORD [rdi],1
	jmp LB_3347
LB_3346:
	bts QWORD [rdi],1
LB_3347:
	mov rsi,1
	bt r12,3
	jc LB_3340
	mov rsi,0
	bt r9,0
	jc LB_3340
	jmp LB_3341
LB_3340:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3341:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_3332:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3350
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_3351
	bt QWORD [rax],0
	jc LB_3352
	btr r12,1
	jmp LB_3353
LB_3352:
	bts r12,1
LB_3353:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3351:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3354:
	cmp r15,0
	jz LB_3355
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3354
LB_3355:
; _some %_3299 ⊢ %_3303 : %_3303
 ; {>  %_3299~0':_p798 }
; _some 0' ⊢ °0◂0'
; ∎ %_3303
 ; {>  %_3303~°0◂0':(_opn)◂(_p798) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3356
	btr r12,3
	jmp LB_3357
LB_3356:
	bts r12,3
LB_3357:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3350:
LB_3358:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3360
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3359
LB_3360:
	add rsp,8
	ret
LB_3361:
	add rsp,48
	pop r14
LB_3359:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3292:
NS_E_RDI_3292:
NS_E_3292_ETR_TBL:
NS_E_3292_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_3399
LB_3398:
	add r14,1
LB_3399:
	cmp r14,r10
	jge LB_3400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3398
	cmp al,10
	jz LB_3398
	cmp al,32
	jz LB_3398
LB_3400:
	add r14,3
	cmp r14,r10
	jg LB_3403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_3403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_3403
	jmp LB_3404
LB_3403:
	jmp LB_3393
LB_3404:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_3406
LB_3405:
	add r14,1
LB_3406:
	cmp r14,r10
	jge LB_3407
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3405
	cmp al,10
	jz LB_3405
	cmp al,32
	jz LB_3405
LB_3407:
	push r10
	call NS_E_3291_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3408
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3409:
	jmp LB_3393
LB_3408:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3396
	btr r12,1
	jmp LB_3397
LB_3396:
	bts r12,1
LB_3397:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3394
	btr r12,0
	jmp LB_3395
LB_3394:
	bts r12,0
LB_3395:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3390
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3411
	btr r12,2
	jmp LB_3412
LB_3411:
	bts r12,2
LB_3412:
	mov r13,r14
	bt r12,1
	jc LB_3413
	btr r12,0
	jmp LB_3414
LB_3413:
	bts r12,0
LB_3414:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3304 ⊢ %_3305 : %_3305
 ; {>  %_3304~0':_p798 }
; _some 0' ⊢ °0◂0'
; _some %_3305 ⊢ %_3306 : %_3306
 ; {>  %_3305~°0◂0':(_opn)◂(_p798) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3306
 ; {>  %_3306~°0◂°0◂0':(_opn)◂((_opn)◂(_p798)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3388
	btr r12,3
	jmp LB_3389
LB_3388:
	bts r12,3
LB_3389:
	mov rsi,1
	bt r12,3
	jc LB_3386
	mov rsi,0
	bt r9,0
	jc LB_3386
	jmp LB_3387
LB_3386:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3387:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3390:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3392
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3391
LB_3392:
	add rsp,8
	ret
LB_3393:
	add rsp,32
	pop r14
LB_3391:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3417
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_3307 : %_3307
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_3307 ⊢ %_3308 : %_3308
 ; {>  %_3307~°1◂{  }:(_opn)◂(t1298'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3308
 ; {>  %_3308~°0◂°1◂{  }:(_opn)◂((_opn)◂(t1301'(0))) }
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
	jc LB_3415
	mov rsi,0
	bt r9,0
	jc LB_3415
	jmp LB_3416
LB_3415:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3416:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3417:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3419
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3418
LB_3419:
	add rsp,8
	ret
LB_3420:
	add rsp,0
	pop r14
LB_3418:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3293:
NS_E_RDI_3293:
NS_E_3293_ETR_TBL:
NS_E_3293_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_3442
LB_3441:
	add r14,1
LB_3442:
	cmp r14,r10
	jge LB_3443
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3441
	cmp al,10
	jz LB_3441
	cmp al,32
	jz LB_3441
LB_3443:
	add r14,3
	cmp r14,r10
	jg LB_3446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_3446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_3446
	jmp LB_3447
LB_3446:
	jmp LB_3434
LB_3447:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_3449
LB_3448:
	add r14,1
LB_3449:
	cmp r14,r10
	jge LB_3450
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3448
	cmp al,10
	jz LB_3448
	cmp al,32
	jz LB_3448
LB_3450:
	push r10
	call NS_E_3294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3451
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3452
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3452:
	jmp LB_3434
LB_3451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_3455
LB_3454:
	add r14,1
LB_3455:
	cmp r14,r10
	jge LB_3456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3454
	cmp al,10
	jz LB_3454
	cmp al,32
	jz LB_3454
LB_3456:
	push r10
	call NS_E_3293_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3457
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3458
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3458:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3459
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3459:
	jmp LB_3434
LB_3457:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3439
	btr r12,2
	jmp LB_3440
LB_3439:
	bts r12,2
LB_3440:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3437
	btr r12,1
	jmp LB_3438
LB_3437:
	bts r12,1
LB_3438:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3435
	btr r12,0
	jmp LB_3436
LB_3435:
	bts r12,0
LB_3436:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3431
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3461
	btr r12,3
	jmp LB_3462
LB_3461:
	bts r12,3
LB_3462:
	mov r14,r8
	bt r12,2
	jc LB_3463
	btr r12,1
	jmp LB_3464
LB_3463:
	bts r12,1
LB_3464:
	mov r8,r13
	bt r12,0
	jc LB_3465
	btr r12,2
	jmp LB_3466
LB_3465:
	bts r12,2
LB_3466:
	mov r13,r9
	bt r12,3
	jc LB_3467
	btr r12,0
	jmp LB_3468
LB_3467:
	bts r12,0
LB_3468:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3309 %_3310 } ⊢ %_3311 : %_3311
 ; {>  %_3310~1':(_lst)◂(_p798) %_3309~0':_p798 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3311 ⊢ %_3312 : %_3312
 ; {>  %_3311~°0◂{ 0' 1' }:(_lst)◂(_p798) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3312
 ; {>  %_3312~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p798)) }
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
	jc LB_3425
	btr r12,2
	jmp LB_3426
LB_3425:
	bts r12,2
LB_3426:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3423
	btr QWORD [rdi],0
	jmp LB_3424
LB_3423:
	bts QWORD [rdi],0
LB_3424:
	mov r8,r14
	bt r12,1
	jc LB_3429
	btr r12,2
	jmp LB_3430
LB_3429:
	bts r12,2
LB_3430:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3427
	btr QWORD [rdi],1
	jmp LB_3428
LB_3427:
	bts QWORD [rdi],1
LB_3428:
	mov rsi,1
	bt r12,3
	jc LB_3421
	mov rsi,0
	bt r9,0
	jc LB_3421
	jmp LB_3422
LB_3421:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3422:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3431:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3433
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3432
LB_3433:
	add rsp,8
	ret
LB_3434:
	add rsp,48
	pop r14
LB_3432:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3471
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3313 : %_3313
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3313 ⊢ %_3314 : %_3314
 ; {>  %_3313~°1◂{  }:(_lst)◂(t1311'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3314
 ; {>  %_3314~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1314'(0))) }
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
	jc LB_3469
	mov rsi,0
	bt r9,0
	jc LB_3469
	jmp LB_3470
LB_3469:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3470:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3471:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3473
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3472
LB_3473:
	add rsp,8
	ret
LB_3474:
	add rsp,0
	pop r14
LB_3472:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3294:
NS_E_RDI_3294:
NS_E_3294_ETR_TBL:
NS_E_3294_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_3490
LB_3489:
	add r14,1
LB_3490:
	cmp r14,r10
	jge LB_3491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3489
	cmp al,10
	jz LB_3489
	cmp al,32
	jz LB_3489
LB_3491:
	add r14,1
	cmp r14,r10
	jg LB_3494
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_3494
	jmp LB_3495
LB_3494:
	jmp LB_3482
LB_3495:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_3500:
	jmp LB_3497
LB_3496:
	add r14,1
LB_3497:
	cmp r14,r10
	jge LB_3498
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3496
	cmp al,10
	jz LB_3496
	cmp al,32
	jz LB_3496
LB_3498:
	push r10
	push rsi
	call NS_E_3291_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_3499
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_3501
	bts QWORD [rax],0
LB_3501:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3500
LB_3499:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_3503
LB_3502:
	add r14,1
LB_3503:
	cmp r14,r10
	jge LB_3504
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3502
	cmp al,10
	jz LB_3502
	cmp al,32
	jz LB_3502
LB_3504:
	add r14,1
	cmp r14,r10
	jg LB_3509
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_3509
	jmp LB_3510
LB_3509:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3506
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3506:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3507
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3507:
	jmp LB_3482
LB_3510:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3487
	btr r12,2
	jmp LB_3488
LB_3487:
	bts r12,2
LB_3488:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3485
	btr r12,1
	jmp LB_3486
LB_3485:
	bts r12,1
LB_3486:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3483
	btr r12,0
	jmp LB_3484
LB_3483:
	bts r12,0
LB_3484:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3479
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_3511
	btr r12,3
	jmp LB_3512
LB_3511:
	bts r12,3
LB_3512:
	mov r13,r14
	bt r12,1
	jc LB_3513
	btr r12,0
	jmp LB_3514
LB_3513:
	bts r12,0
LB_3514:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f107 %_3315 ⊢ %_3316 : %_3316
 ; {>  %_3315~0':(_lst)◂(_p798) }
; _f107 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_107
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f849 %_3316 ⊢ %_3317 : %_3317
 ; {>  %_3316~0':(_lst)◂(_p798) }
; _f849 0' ⊢ °0◂0'
; _some %_3317 ⊢ %_3318 : %_3318
 ; {>  %_3317~°0◂0':_p798 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3318
 ; {>  %_3318~°0◂°0◂0':(_opn)◂(_p798) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3477
	btr r12,3
	jmp LB_3478
LB_3477:
	bts r12,3
LB_3478:
	mov rsi,1
	bt r12,3
	jc LB_3475
	mov rsi,0
	bt r9,0
	jc LB_3475
	jmp LB_3476
LB_3475:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3476:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3481
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3480
LB_3481:
	add rsp,8
	ret
LB_3482:
	add rsp,48
	pop r14
LB_3480:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
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
	add r14,1
	cmp r14,r10
	jg LB_3532
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_3532
	jmp LB_3533
LB_3532:
	jmp LB_3520
LB_3533:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_3535
LB_3534:
	add r14,1
LB_3535:
	cmp r14,r10
	jge LB_3536
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3534
	cmp al,10
	jz LB_3534
	cmp al,32
	jz LB_3534
LB_3536:
	push r10
	call NS_E_3291_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3537
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3538
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3538:
	jmp LB_3520
LB_3537:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_3541
LB_3540:
	add r14,1
LB_3541:
	cmp r14,r10
	jge LB_3542
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3540
	cmp al,10
	jz LB_3540
	cmp al,32
	jz LB_3540
LB_3542:
	add r14,1
	cmp r14,r10
	jg LB_3547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_3547
	jmp LB_3548
LB_3547:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3544
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3544:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3545
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3545:
	jmp LB_3520
LB_3548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3525
	btr r12,2
	jmp LB_3526
LB_3525:
	bts r12,2
LB_3526:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3523
	btr r12,1
	jmp LB_3524
LB_3523:
	bts r12,1
LB_3524:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3521
	btr r12,0
	jmp LB_3522
LB_3521:
	bts r12,0
LB_3522:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3517
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_3549
	btr r12,3
	jmp LB_3550
LB_3549:
	bts r12,3
LB_3550:
	mov r13,r14
	bt r12,1
	jc LB_3551
	btr r12,0
	jmp LB_3552
LB_3551:
	bts r12,0
LB_3552:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3319 ⊢ %_3320 : %_3320
 ; {>  %_3319~0':_p798 }
; _some 0' ⊢ °0◂0'
; ∎ %_3320
 ; {>  %_3320~°0◂0':(_opn)◂(_p798) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3515
	btr r12,3
	jmp LB_3516
LB_3515:
	bts r12,3
LB_3516:
	mov r8,0
	bts r12,2
	ret
LB_3517:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3519
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3518
LB_3519:
	add rsp,8
	ret
LB_3520:
	add rsp,48
	pop r14
LB_3518:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_3564
LB_3563:
	add r14,1
LB_3564:
	cmp r14,r10
	jge LB_3565
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3563
	cmp al,10
	jz LB_3563
	cmp al,32
	jz LB_3563
LB_3565:
	push r10
	call NS_E_3295_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3566
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3560
LB_3566:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3561
	btr r12,0
	jmp LB_3562
LB_3561:
	bts r12,0
LB_3562:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3557
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f853 %_3321 ⊢ %_3322 : %_3322
 ; {>  %_3321~0':_stg }
; _f853 0' ⊢ °4◂0'
; _some %_3322 ⊢ %_3323 : %_3323
 ; {>  %_3322~°4◂0':_p798 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_3323
 ; {>  %_3323~°0◂°4◂0':(_opn)◂(_p798) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3555
	btr r12,3
	jmp LB_3556
LB_3555:
	bts r12,3
LB_3556:
	mov rsi,1
	bt r12,3
	jc LB_3553
	mov rsi,0
	bt r9,0
	jc LB_3553
	jmp LB_3554
LB_3553:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3554:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3557:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3559
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3558
LB_3559:
	add rsp,8
	ret
LB_3560:
	add rsp,16
	pop r14
LB_3558:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_3579
LB_3578:
	add r14,1
LB_3579:
	cmp r14,r10
	jge LB_3580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3578
	cmp al,10
	jz LB_3578
	cmp al,32
	jz LB_3578
LB_3580:
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3581
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3575
LB_3581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3576
	btr r12,0
	jmp LB_3577
LB_3576:
	bts r12,0
LB_3577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3572
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f852 %_3324 ⊢ %_3325 : %_3325
 ; {>  %_3324~0':_p733 }
; _f852 0' ⊢ °3◂0'
; _some %_3325 ⊢ %_3326 : %_3326
 ; {>  %_3325~°3◂0':_p798 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_3326
 ; {>  %_3326~°0◂°3◂0':(_opn)◂(_p798) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3570
	btr r12,3
	jmp LB_3571
LB_3570:
	bts r12,3
LB_3571:
	mov rsi,1
	bt r12,3
	jc LB_3568
	mov rsi,0
	bt r9,0
	jc LB_3568
	jmp LB_3569
LB_3568:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3569:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3574
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3573
LB_3574:
	add rsp,8
	ret
LB_3575:
	add rsp,16
	pop r14
LB_3573:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3295:
NS_E_RDI_3295:
NS_E_3295_ETR_TBL:
NS_E_3295_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3596
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3588
LB_3596:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_3604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_3604
	jmp LB_3605
LB_3604:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3602:
	jmp LB_3588
LB_3605:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3591
	btr r12,1
	jmp LB_3592
LB_3591:
	bts r12,1
LB_3592:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3589
	btr r12,0
	jmp LB_3590
LB_3589:
	bts r12,0
LB_3590:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3585
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3327 ⊢ %_3328 : %_3328
 ; {>  %_3327~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3328
 ; {>  %_3328~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3583
	btr r12,3
	jmp LB_3584
LB_3583:
	bts r12,3
LB_3584:
	mov r8,0
	bts r12,2
	ret
LB_3585:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3587
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3586
LB_3587:
	add rsp,8
	ret
LB_3588:
	add rsp,32
	pop r14
LB_3586:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3606:
NS_E_RDI_3606:
NS_E_3606_ETR_TBL:
NS_E_3606_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_4010
LB_4009:
	add r14,1
LB_4010:
	cmp r14,r10
	jge LB_4011
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4009
	cmp al,10
	jz LB_4009
	cmp al,32
	jz LB_4009
LB_4011:
	push r10
	call NS_E_3607_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4012
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4004
LB_4012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_4015
LB_4014:
	add r14,1
LB_4015:
	cmp r14,r10
	jge LB_4016
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4014
	cmp al,10
	jz LB_4014
	cmp al,32
	jz LB_4014
LB_4016:
	push r10
	call NS_E_3606_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4017
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4018:
	jmp LB_4004
LB_4017:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4007
	btr r12,1
	jmp LB_4008
LB_4007:
	bts r12,1
LB_4008:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4005
	btr r12,0
	jmp LB_4006
LB_4005:
	bts r12,0
LB_4006:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4001
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3647 %_3648 } ⊢ %_3649 : %_3649
 ; {>  %_3648~1':(_lst)◂(_p781) %_3647~0':_p781 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3649 ⊢ %_3650 : %_3650
 ; {>  %_3649~°0◂{ 0' 1' }:(_lst)◂(_p781) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3650
 ; {>  %_3650~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p781)) }
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
	jc LB_3995
	btr r12,2
	jmp LB_3996
LB_3995:
	bts r12,2
LB_3996:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3993
	btr QWORD [rdi],0
	jmp LB_3994
LB_3993:
	bts QWORD [rdi],0
LB_3994:
	mov r8,r14
	bt r12,1
	jc LB_3999
	btr r12,2
	jmp LB_4000
LB_3999:
	bts r12,2
LB_4000:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3997
	btr QWORD [rdi],1
	jmp LB_3998
LB_3997:
	bts QWORD [rdi],1
LB_3998:
	mov rsi,1
	bt r12,3
	jc LB_3991
	mov rsi,0
	bt r9,0
	jc LB_3991
	jmp LB_3992
LB_3991:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3992:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4003
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4002
LB_4003:
	add rsp,8
	ret
LB_4004:
	add rsp,32
	pop r14
LB_4002:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4022
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3651 : %_3651
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3651 ⊢ %_3652 : %_3652
 ; {>  %_3651~°1◂{  }:(_lst)◂(t1439'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3652
 ; {>  %_3652~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1442'(0))) }
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
	jc LB_4020
	mov rsi,0
	bt r9,0
	jc LB_4020
	jmp LB_4021
LB_4020:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4021:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4022:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4024
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4023
LB_4024:
	add rsp,8
	ret
LB_4025:
	add rsp,0
	pop r14
LB_4023:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3607:
NS_E_RDI_3607:
NS_E_3607_ETR_TBL:
NS_E_3607_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_4044
LB_4043:
	add r14,1
LB_4044:
	cmp r14,r10
	jge LB_4045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4043
	cmp al,10
	jz LB_4043
	cmp al,32
	jz LB_4043
LB_4045:
	add r14,7
	cmp r14,r10
	jg LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_4048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_4048
	jmp LB_4049
LB_4048:
	jmp LB_4031
LB_4049:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_4038
LB_4037:
	add r14,1
LB_4038:
	cmp r14,r10
	jge LB_4039
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4037
	cmp al,10
	jz LB_4037
	cmp al,32
	jz LB_4037
LB_4039:
	push r10
	call NS_E_3608_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4040
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4041
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4041:
	jmp LB_4032
LB_4040:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4035
	btr r12,1
	jmp LB_4036
LB_4035:
	bts r12,1
LB_4036:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4033
	btr r12,0
	jmp LB_4034
LB_4033:
	bts r12,0
LB_4034:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4028
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4050
	btr r12,2
	jmp LB_4051
LB_4050:
	bts r12,2
LB_4051:
	mov r13,r14
	bt r12,1
	jc LB_4052
	btr r12,0
	jmp LB_4053
LB_4052:
	bts r12,0
LB_4053:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3653 ⊢ %_3654 : %_3654
 ; {>  %_3653~0':_p781 }
; _some 0' ⊢ °0◂0'
; ∎ %_3654
 ; {>  %_3654~°0◂0':(_opn)◂(_p781) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4026
	btr r12,3
	jmp LB_4027
LB_4026:
	bts r12,3
LB_4027:
	mov r8,0
	bts r12,2
	ret
LB_4028:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4030
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4029
LB_4030:
	add rsp,8
	ret
LB_4032:
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
LB_4031:
	add rsp,32
	pop r14
LB_4029:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4055
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_3655
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3655 ⊢ %_3656 : %_3656
 ; {>  %_3655~0':_stg }
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
; _none {  } ⊢ %_3657 : %_3657
 ; {>  %_3656~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3657
 ; {>  %_3657~°1◂{  }:(_opn)◂(t1452'(0)) %_3656~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4054
	mov rdi,r13
	call dlt
LB_4054:
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
LB_4055:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4057
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4056
LB_4057:
	add rsp,8
	ret
LB_4058:
	add rsp,0
	pop r14
LB_4056:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_4094
LB_4093:
	add r14,1
LB_4094:
	cmp r14,r10
	jge LB_4095
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4093
	cmp al,10
	jz LB_4093
	cmp al,32
	jz LB_4093
LB_4095:
	add r14,4
	cmp r14,r10
	jg LB_4098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_4098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_4098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_4098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_4098
	jmp LB_4099
LB_4098:
	jmp LB_4072
LB_4099:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_4081
LB_4080:
	add r14,1
LB_4081:
	cmp r14,r10
	jge LB_4082
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4080
	cmp al,10
	jz LB_4080
	cmp al,32
	jz LB_4080
LB_4082:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4083
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4084
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4084:
	jmp LB_4073
LB_4083:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_4087
LB_4086:
	add r14,1
LB_4087:
	cmp r14,r10
	jge LB_4088
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4086
	cmp al,10
	jz LB_4086
	cmp al,32
	jz LB_4086
LB_4088:
	push r10
	call NS_E_3609_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4089
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4090
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4090:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4091:
	jmp LB_4073
LB_4089:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4078
	btr r12,2
	jmp LB_4079
LB_4078:
	bts r12,2
LB_4079:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4076
	btr r12,1
	jmp LB_4077
LB_4076:
	bts r12,1
LB_4077:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4074
	btr r12,0
	jmp LB_4075
LB_4074:
	bts r12,0
LB_4075:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4069
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4100
	btr r12,3
	jmp LB_4101
LB_4100:
	bts r12,3
LB_4101:
	mov r14,r8
	bt r12,2
	jc LB_4102
	btr r12,1
	jmp LB_4103
LB_4102:
	bts r12,1
LB_4103:
	mov r8,r13
	bt r12,0
	jc LB_4104
	btr r12,2
	jmp LB_4105
LB_4104:
	bts r12,2
LB_4105:
	mov r13,r9
	bt r12,3
	jc LB_4106
	btr r12,0
	jmp LB_4107
LB_4106:
	bts r12,0
LB_4107:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f808 { %_3658 %_3659 } ⊢ %_3660 : %_3660
 ; {>  %_3658~0':_stg %_3659~1':_p782 }
; _f808 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3660 ⊢ %_3661 : %_3661
 ; {>  %_3660~°0◂{ 0' 1' }:_p781 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3661
 ; {>  %_3661~°0◂°0◂{ 0' 1' }:(_opn)◂(_p781) }
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
	jc LB_4063
	btr r12,2
	jmp LB_4064
LB_4063:
	bts r12,2
LB_4064:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4061
	btr QWORD [rdi],0
	jmp LB_4062
LB_4061:
	bts QWORD [rdi],0
LB_4062:
	mov r8,r14
	bt r12,1
	jc LB_4067
	btr r12,2
	jmp LB_4068
LB_4067:
	bts r12,2
LB_4068:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4065
	btr QWORD [rdi],1
	jmp LB_4066
LB_4065:
	bts QWORD [rdi],1
LB_4066:
	mov rsi,1
	bt r12,3
	jc LB_4059
	mov rsi,0
	bt r9,0
	jc LB_4059
	jmp LB_4060
LB_4059:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4060:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4069:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4071
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4070
LB_4071:
	add rsp,8
	ret
LB_4073:
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
LB_4072:
	add rsp,48
	pop r14
LB_4070:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4109
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_3662
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3662 ⊢ %_3663 : %_3663
 ; {>  %_3662~0':_stg }
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
; _none {  } ⊢ %_3664 : %_3664
 ; {>  %_3663~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3664
 ; {>  %_3663~0':_stg %_3664~°1◂{  }:(_opn)◂(t1464'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4108
	mov rdi,r13
	call dlt
LB_4108:
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
LB_4109:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4111
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4110
LB_4111:
	add rsp,8
	ret
LB_4112:
	add rsp,0
	pop r14
LB_4110:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_4131
LB_4130:
	add r14,1
LB_4131:
	cmp r14,r10
	jge LB_4132
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4130
	cmp al,10
	jz LB_4130
	cmp al,32
	jz LB_4130
LB_4132:
	add r14,2
	cmp r14,r10
	jg LB_4135
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_4135
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_4135
	jmp LB_4136
LB_4135:
	jmp LB_4118
LB_4136:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_4125
LB_4124:
	add r14,1
LB_4125:
	cmp r14,r10
	jge LB_4126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4124
	cmp al,10
	jz LB_4124
	cmp al,32
	jz LB_4124
LB_4126:
	push r10
	call NS_E_3617_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4127
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4128
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4128:
	jmp LB_4119
LB_4127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4122
	btr r12,1
	jmp LB_4123
LB_4122:
	bts r12,1
LB_4123:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4120
	btr r12,0
	jmp LB_4121
LB_4120:
	bts r12,0
LB_4121:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4115
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4137
	btr r12,2
	jmp LB_4138
LB_4137:
	bts r12,2
LB_4138:
	mov r13,r14
	bt r12,1
	jc LB_4139
	btr r12,0
	jmp LB_4140
LB_4139:
	bts r12,0
LB_4140:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3665 ⊢ %_3666 : %_3666
 ; {>  %_3665~0':_p781 }
; _some 0' ⊢ °0◂0'
; ∎ %_3666
 ; {>  %_3666~°0◂0':(_opn)◂(_p781) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4113
	btr r12,3
	jmp LB_4114
LB_4113:
	bts r12,3
LB_4114:
	mov r8,0
	bts r12,2
	ret
LB_4115:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4117
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4116
LB_4117:
	add rsp,8
	ret
LB_4119:
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
LB_4118:
	add rsp,32
	pop r14
LB_4116:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4142
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_3667
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3667 ⊢ %_3668 : %_3668
 ; {>  %_3667~0':_stg }
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
; _none {  } ⊢ %_3669 : %_3669
 ; {>  %_3668~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3669
 ; {>  %_3668~0':_stg %_3669~°1◂{  }:(_opn)◂(t1474'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4141
	mov rdi,r13
	call dlt
LB_4141:
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
LB_4142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4144
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4143
LB_4144:
	add rsp,8
	ret
LB_4145:
	add rsp,0
	pop r14
LB_4143:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_4164
LB_4163:
	add r14,1
LB_4164:
	cmp r14,r10
	jge LB_4165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4163
	cmp al,10
	jz LB_4163
	cmp al,32
	jz LB_4163
LB_4165:
	add r14,2
	cmp r14,r10
	jg LB_4168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_4168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_4168
	jmp LB_4169
LB_4168:
	jmp LB_4151
LB_4169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_4158
LB_4157:
	add r14,1
LB_4158:
	cmp r14,r10
	jge LB_4159
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4157
	cmp al,10
	jz LB_4157
	cmp al,32
	jz LB_4157
LB_4159:
	push r10
	call NS_E_3611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4160
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4161
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4161:
	jmp LB_4152
LB_4160:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4155
	btr r12,1
	jmp LB_4156
LB_4155:
	bts r12,1
LB_4156:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4153
	btr r12,0
	jmp LB_4154
LB_4153:
	bts r12,0
LB_4154:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4148
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4170
	btr r12,2
	jmp LB_4171
LB_4170:
	bts r12,2
LB_4171:
	mov r13,r14
	bt r12,1
	jc LB_4172
	btr r12,0
	jmp LB_4173
LB_4172:
	bts r12,0
LB_4173:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3670 ⊢ %_3671 : %_3671
 ; {>  %_3670~0':_p781 }
; _some 0' ⊢ °0◂0'
; ∎ %_3671
 ; {>  %_3671~°0◂0':(_opn)◂(_p781) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4146
	btr r12,3
	jmp LB_4147
LB_4146:
	bts r12,3
LB_4147:
	mov r8,0
	bts r12,2
	ret
LB_4148:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4150
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4149
LB_4150:
	add rsp,8
	ret
LB_4152:
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
LB_4151:
	add rsp,32
	pop r14
LB_4149:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3608:
NS_E_RDI_3608:
NS_E_3608_ETR_TBL:
NS_E_3608_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_etr
	jmp LB_4209
LB_4208:
	add r14,1
LB_4209:
	cmp r14,r10
	jge LB_4210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4208
	cmp al,10
	jz LB_4208
	cmp al,32
	jz LB_4208
LB_4210:
	push r10
	call NS_E_3634_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4211
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4203
LB_4211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_4217:
	jmp LB_4214
LB_4213:
	add r14,1
LB_4214:
	cmp r14,r10
	jge LB_4215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4213
	cmp al,10
	jz LB_4213
	cmp al,32
	jz LB_4213
LB_4215:
	push r10
	push rsi
	call NS_E_3634_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_4216
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_4218
	bts QWORD [rax],0
LB_4218:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_4217
LB_4216:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4206
	btr r12,1
	jmp LB_4207
LB_4206:
	bts r12,1
LB_4207:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4204
	btr r12,0
	jmp LB_4205
LB_4204:
	bts r12,0
LB_4205:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4200
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_4219
	btr r12,2
	jmp LB_4220
LB_4219:
	bts r12,2
LB_4220:
	mov r9,r13
	bt r12,0
	jc LB_4221
	btr r12,3
	jmp LB_4222
LB_4221:
	bts r12,3
LB_4222:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4225
	btr r12,4
	jmp LB_4226
LB_4225:
	bts r12,4
LB_4226:
	mov r13,r10
	bt r12,4
	jc LB_4223
	btr r12,0
	jmp LB_4224
LB_4223:
	bts r12,0
LB_4224:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4229
	btr r12,4
	jmp LB_4230
LB_4229:
	bts r12,4
LB_4230:
	mov r14,r10
	bt r12,4
	jc LB_4227
	btr r12,1
	jmp LB_4228
LB_4227:
	bts r12,1
LB_4228:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f107 %_3673 ⊢ %_3674 : %_3674
 ; {>  %_3673~2':(_lst)◂({ _stg _p785 }) %_3672~{ 0' 1' }:{ _stg _p785 } }
; _f107 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4178
	btr r12,0
	jmp LB_4179
LB_4178:
	bts r12,0
LB_4179:
	call NS_E_107
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_4180
	btr r12,2
	jmp LB_4181
LB_4180:
	bts r12,2
LB_4181:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4176
	btr r12,1
	jmp LB_4177
LB_4176:
	bts r12,1
LB_4177:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4174
	btr r12,0
	jmp LB_4175
LB_4174:
	bts r12,0
LB_4175:
	add rsp,24
; _cns { %_3672 %_3674 } ⊢ %_3675 : %_3675
 ; {>  %_3674~2':(_lst)◂({ _stg _p785 }) %_3672~{ 0' 1' }:{ _stg _p785 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f809 %_3675 ⊢ %_3676 : %_3676
 ; {>  %_3675~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p785 }) }
; _f809 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_3676 ⊢ %_3677 : %_3677
 ; {>  %_3676~°1◂°0◂{ { 0' 1' } 2' }:_p781 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_3677
 ; {>  %_3677~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p781) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_4190
	btr r12,5
	jmp LB_4191
LB_4190:
	bts r12,5
LB_4191:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_4188
	btr QWORD [rdi],0
	jmp LB_4189
LB_4188:
	bts QWORD [rdi],0
LB_4189:
	mov r11,r14
	bt r12,1
	jc LB_4194
	btr r12,5
	jmp LB_4195
LB_4194:
	bts r12,5
LB_4195:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_4192
	btr QWORD [rdi],1
	jmp LB_4193
LB_4192:
	bts QWORD [rdi],1
LB_4193:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4186
	btr QWORD [rdi],0
	jmp LB_4187
LB_4186:
	bts QWORD [rdi],0
LB_4187:
	mov r10,r8
	bt r12,2
	jc LB_4198
	btr r12,4
	jmp LB_4199
LB_4198:
	bts r12,4
LB_4199:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4196
	btr QWORD [rdi],1
	jmp LB_4197
LB_4196:
	bts QWORD [rdi],1
LB_4197:
	mov rsi,1
	bt r12,3
	jc LB_4184
	mov rsi,0
	bt r9,0
	jc LB_4184
	jmp LB_4185
LB_4184:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4185:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_4182
	mov rsi,0
	bt r9,0
	jc LB_4182
	jmp LB_4183
LB_4182:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4183:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4200:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4202
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4201
LB_4202:
	add rsp,8
	ret
LB_4203:
	add rsp,32
	pop r14
LB_4201:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4232
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_3678
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3678 ⊢ %_3679 : %_3679
 ; {>  %_3678~0':_stg }
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
; _none {  } ⊢ %_3680 : %_3680
 ; {>  %_3679~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3680
 ; {>  %_3680~°1◂{  }:(_opn)◂(t1493'(0)) %_3679~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4231
	mov rdi,r13
	call dlt
LB_4231:
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
LB_4232:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4234
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4233
LB_4234:
	add rsp,8
	ret
LB_4235:
	add rsp,0
	pop r14
LB_4233:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3609:
NS_E_RDI_3609:
NS_E_3609_ETR_TBL:
NS_E_3609_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_4256
LB_4255:
	add r14,1
LB_4256:
	cmp r14,r10
	jge LB_4257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4255
	cmp al,10
	jz LB_4255
	cmp al,32
	jz LB_4255
LB_4257:
	add r14,1
	cmp r14,r10
	jg LB_4260
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_4260
	jmp LB_4261
LB_4260:
	jmp LB_4243
LB_4261:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_4250
LB_4249:
	add r14,1
LB_4250:
	cmp r14,r10
	jge LB_4251
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4249
	cmp al,10
	jz LB_4249
	cmp al,32
	jz LB_4249
LB_4251:
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4252
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4253:
	jmp LB_4244
LB_4252:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4247
	btr r12,1
	jmp LB_4248
LB_4247:
	bts r12,1
LB_4248:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4245
	btr r12,0
	jmp LB_4246
LB_4245:
	bts r12,0
LB_4246:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4240
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4262
	btr r12,2
	jmp LB_4263
LB_4262:
	bts r12,2
LB_4263:
	mov r13,r14
	bt r12,1
	jc LB_4264
	btr r12,0
	jmp LB_4265
LB_4264:
	bts r12,0
LB_4265:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f815 %_3681 ⊢ %_3682 : %_3682
 ; {>  %_3681~0':_p733 }
; _f815 0' ⊢ °1◂0'
; _some %_3682 ⊢ %_3683 : %_3683
 ; {>  %_3682~°1◂0':_p782 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3683
 ; {>  %_3683~°0◂°1◂0':(_opn)◂(_p782) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4238
	btr r12,3
	jmp LB_4239
LB_4238:
	bts r12,3
LB_4239:
	mov rsi,1
	bt r12,3
	jc LB_4236
	mov rsi,0
	bt r9,0
	jc LB_4236
	jmp LB_4237
LB_4236:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4237:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4240:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4242
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4241
LB_4242:
	add rsp,8
	ret
LB_4244:
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
LB_4243:
	add rsp,32
	pop r14
LB_4241:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_4277
LB_4276:
	add r14,1
LB_4277:
	cmp r14,r10
	jge LB_4278
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4276
	cmp al,10
	jz LB_4276
	cmp al,32
	jz LB_4276
LB_4278:
	push r10
	call NS_E_3610_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4279
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4273
LB_4279:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4274
	btr r12,0
	jmp LB_4275
LB_4274:
	bts r12,0
LB_4275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4270
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f814 %_3684 ⊢ %_3685 : %_3685
 ; {>  %_3684~0':(_lst)◂(_p781) }
; _f814 0' ⊢ °0◂0'
; _some %_3685 ⊢ %_3686 : %_3686
 ; {>  %_3685~°0◂0':_p782 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3686
 ; {>  %_3686~°0◂°0◂0':(_opn)◂(_p782) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4268
	btr r12,3
	jmp LB_4269
LB_4268:
	bts r12,3
LB_4269:
	mov rsi,1
	bt r12,3
	jc LB_4266
	mov rsi,0
	bt r9,0
	jc LB_4266
	jmp LB_4267
LB_4266:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4267:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4270:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4272
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4271
LB_4272:
	add rsp,8
	ret
LB_4273:
	add rsp,16
	pop r14
LB_4271:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4282
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_3687
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3687 ⊢ %_3688 : %_3688
 ; {>  %_3687~0':_stg }
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
; _none {  } ⊢ %_3689 : %_3689
 ; {>  %_3688~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3689
 ; {>  %_3688~0':_stg %_3689~°1◂{  }:(_opn)◂(t1508'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4281
	mov rdi,r13
	call dlt
LB_4281:
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
LB_4282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4284
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4283
LB_4284:
	add rsp,8
	ret
LB_4285:
	add rsp,0
	pop r14
LB_4283:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3610:
NS_E_RDI_3610:
NS_E_3610_ETR_TBL:
NS_E_3610_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_4295
LB_4294:
	add r14,1
LB_4295:
	cmp r14,r10
	jge LB_4296
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4294
	cmp al,10
	jz LB_4294
	cmp al,32
	jz LB_4294
LB_4296:
	add r14,6
	cmp r14,r10
	jg LB_4299
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_4299
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_4299
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_4299
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_4299
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_4299
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_4299
	jmp LB_4300
LB_4299:
	jmp LB_4291
LB_4300:
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
	jc LB_4292
	btr r12,0
	jmp LB_4293
LB_4292:
	bts r12,0
LB_4293:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4288
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3690 : %_3690
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3690 ⊢ %_3691 : %_3691
 ; {>  %_3690~°1◂{  }:(_lst)◂(t1512'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3691
 ; {>  %_3691~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1515'(0))) }
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
	jc LB_4286
	mov rsi,0
	bt r9,0
	jc LB_4286
	jmp LB_4287
LB_4286:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4287:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4288:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4290
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4289
LB_4290:
	add rsp,8
	ret
LB_4291:
	add rsp,16
	pop r14
LB_4289:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_4320
LB_4319:
	add r14,1
LB_4320:
	cmp r14,r10
	jge LB_4321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4319
	cmp al,10
	jz LB_4319
	cmp al,32
	jz LB_4319
LB_4321:
	push r10
	call NS_E_3607_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4322
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4314
LB_4322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_4325
LB_4324:
	add r14,1
LB_4325:
	cmp r14,r10
	jge LB_4326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4324
	cmp al,10
	jz LB_4324
	cmp al,32
	jz LB_4324
LB_4326:
	push r10
	call NS_E_3610_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4327
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4328:
	jmp LB_4314
LB_4327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4317
	btr r12,1
	jmp LB_4318
LB_4317:
	bts r12,1
LB_4318:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4315
	btr r12,0
	jmp LB_4316
LB_4315:
	bts r12,0
LB_4316:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4311
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3692 %_3693 } ⊢ %_3694 : %_3694
 ; {>  %_3693~1':(_lst)◂(_p781) %_3692~0':_p781 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3694 ⊢ %_3695 : %_3695
 ; {>  %_3694~°0◂{ 0' 1' }:(_lst)◂(_p781) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3695
 ; {>  %_3695~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p781)) }
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
	jc LB_4305
	btr r12,2
	jmp LB_4306
LB_4305:
	bts r12,2
LB_4306:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4303
	btr QWORD [rdi],0
	jmp LB_4304
LB_4303:
	bts QWORD [rdi],0
LB_4304:
	mov r8,r14
	bt r12,1
	jc LB_4309
	btr r12,2
	jmp LB_4310
LB_4309:
	bts r12,2
LB_4310:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4307
	btr QWORD [rdi],1
	jmp LB_4308
LB_4307:
	bts QWORD [rdi],1
LB_4308:
	mov rsi,1
	bt r12,3
	jc LB_4301
	mov rsi,0
	bt r9,0
	jc LB_4301
	jmp LB_4302
LB_4301:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4302:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4311:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4313
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4312
LB_4313:
	add rsp,8
	ret
LB_4314:
	add rsp,32
	pop r14
LB_4312:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3611:
NS_E_RDI_3611:
NS_E_3611_ETR_TBL:
NS_E_3611_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_4385
LB_4384:
	add r14,1
LB_4385:
	cmp r14,r10
	jge LB_4386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4384
	cmp al,10
	jz LB_4384
	cmp al,32
	jz LB_4384
LB_4386:
	add r14,1
	cmp r14,r10
	jg LB_4389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_4389
	jmp LB_4390
LB_4389:
	jmp LB_4351
LB_4390:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_4362
LB_4361:
	add r14,1
LB_4362:
	cmp r14,r10
	jge LB_4363
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4361
	cmp al,10
	jz LB_4361
	cmp al,32
	jz LB_4361
LB_4363:
	add r14,1
	cmp r14,r10
	jg LB_4367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4367
	jmp LB_4368
LB_4367:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4365
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4365:
	jmp LB_4352
LB_4368:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_4370
LB_4369:
	add r14,1
LB_4370:
	cmp r14,r10
	jge LB_4371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4369
	cmp al,10
	jz LB_4369
	cmp al,32
	jz LB_4369
LB_4371:
	push r10
	call NS_E_3612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4372
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4373
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4373:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4374
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4374:
	jmp LB_4352
LB_4372:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_4377
LB_4376:
	add r14,1
LB_4377:
	cmp r14,r10
	jge LB_4378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4376
	cmp al,10
	jz LB_4376
	cmp al,32
	jz LB_4376
LB_4378:
	push r10
	call NS_E_3615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4379
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4380
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4380:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4381
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4381:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4382
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4382:
	jmp LB_4352
LB_4379:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4359
	btr r12,3
	jmp LB_4360
LB_4359:
	bts r12,3
LB_4360:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4357
	btr r12,2
	jmp LB_4358
LB_4357:
	bts r12,2
LB_4358:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4355
	btr r12,1
	jmp LB_4356
LB_4355:
	bts r12,1
LB_4356:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4353
	btr r12,0
	jmp LB_4354
LB_4353:
	bts r12,0
LB_4354:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4348
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_4391
	btr r12,4
	jmp LB_4392
LB_4391:
	bts r12,4
LB_4392:
	mov r8,r9
	bt r12,3
	jc LB_4393
	btr r12,2
	jmp LB_4394
LB_4393:
	bts r12,2
LB_4394:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_4397
	btr r12,3
	jmp LB_4398
LB_4397:
	bts r12,3
LB_4398:
	mov r13,r9
	bt r12,3
	jc LB_4395
	btr r12,0
	jmp LB_4396
LB_4395:
	bts r12,0
LB_4396:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_4401
	btr r12,3
	jmp LB_4402
LB_4401:
	bts r12,3
LB_4402:
	mov r14,r9
	bt r12,3
	jc LB_4399
	btr r12,1
	jmp LB_4400
LB_4399:
	bts r12,1
LB_4400:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3696 %_3697 } ⊢ %_3698 : %_3698
 ; {>  %_3697~2':(_lst)◂({ _stg _p784 }) %_3696~{ 0' 1' }:{ _stg _p784 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f813 %_3698 ⊢ %_3699 : %_3699
 ; {>  %_3698~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p784 }) }
; _f813 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_3699 ⊢ %_3700 : %_3700
 ; {>  %_3699~°5◂°0◂{ { 0' 1' } 2' }:_p781 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_3700
 ; {>  %_3700~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p781) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_4338
	btr r12,5
	jmp LB_4339
LB_4338:
	bts r12,5
LB_4339:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_4336
	btr QWORD [rdi],0
	jmp LB_4337
LB_4336:
	bts QWORD [rdi],0
LB_4337:
	mov r11,r14
	bt r12,1
	jc LB_4342
	btr r12,5
	jmp LB_4343
LB_4342:
	bts r12,5
LB_4343:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_4340
	btr QWORD [rdi],1
	jmp LB_4341
LB_4340:
	bts QWORD [rdi],1
LB_4341:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4334
	btr QWORD [rdi],0
	jmp LB_4335
LB_4334:
	bts QWORD [rdi],0
LB_4335:
	mov r10,r8
	bt r12,2
	jc LB_4346
	btr r12,4
	jmp LB_4347
LB_4346:
	bts r12,4
LB_4347:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4344
	btr QWORD [rdi],1
	jmp LB_4345
LB_4344:
	bts QWORD [rdi],1
LB_4345:
	mov rsi,1
	bt r12,3
	jc LB_4332
	mov rsi,0
	bt r9,0
	jc LB_4332
	jmp LB_4333
LB_4332:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4333:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_4330
	mov rsi,0
	bt r9,0
	jc LB_4330
	jmp LB_4331
LB_4330:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4331:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4348:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4350
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4349
LB_4350:
	add rsp,8
	ret
LB_4352:
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
LB_4351:
	add rsp,64
	pop r14
LB_4349:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_4420
LB_4419:
	add r14,1
LB_4420:
	cmp r14,r10
	jge LB_4421
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4419
	cmp al,10
	jz LB_4419
	cmp al,32
	jz LB_4419
LB_4421:
	push r10
	call NS_E_3612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4422
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4416
LB_4422:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4417
	btr r12,0
	jmp LB_4418
LB_4417:
	bts r12,0
LB_4418:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4413
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_4424
	btr r12,2
	jmp LB_4425
LB_4424:
	bts r12,2
LB_4425:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_4428
	btr r12,3
	jmp LB_4429
LB_4428:
	bts r12,3
LB_4429:
	mov r13,r9
	bt r12,3
	jc LB_4426
	btr r12,0
	jmp LB_4427
LB_4426:
	bts r12,0
LB_4427:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_4432
	btr r12,3
	jmp LB_4433
LB_4432:
	bts r12,3
LB_4433:
	mov r14,r9
	bt r12,3
	jc LB_4430
	btr r12,1
	jmp LB_4431
LB_4430:
	bts r12,1
LB_4431:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f812 %_3701 ⊢ %_3702 : %_3702
 ; {>  %_3701~{ 0' 1' }:{ _stg _p784 } }
; _f812 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_3702 ⊢ %_3703 : %_3703
 ; {>  %_3702~°4◂{ 0' 1' }:_p781 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_3703
 ; {>  %_3703~°0◂°4◂{ 0' 1' }:(_opn)◂(_p781) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4407
	btr r12,2
	jmp LB_4408
LB_4407:
	bts r12,2
LB_4408:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4405
	btr QWORD [rdi],0
	jmp LB_4406
LB_4405:
	bts QWORD [rdi],0
LB_4406:
	mov r8,r14
	bt r12,1
	jc LB_4411
	btr r12,2
	jmp LB_4412
LB_4411:
	bts r12,2
LB_4412:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4409
	btr QWORD [rdi],1
	jmp LB_4410
LB_4409:
	bts QWORD [rdi],1
LB_4410:
	mov rsi,1
	bt r12,3
	jc LB_4403
	mov rsi,0
	bt r9,0
	jc LB_4403
	jmp LB_4404
LB_4403:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4404:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4413:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4415
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4414
LB_4415:
	add rsp,8
	ret
LB_4416:
	add rsp,16
	pop r14
LB_4414:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4435
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_3704
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3704 ⊢ %_3705 : %_3705
 ; {>  %_3704~0':_stg }
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
; _none {  } ⊢ %_3706 : %_3706
 ; {>  %_3705~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3706
 ; {>  %_3705~0':_stg %_3706~°1◂{  }:(_opn)◂(t1539'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4434
	mov rdi,r13
	call dlt
LB_4434:
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
LB_4435:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4437
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4436
LB_4437:
	add rsp,8
	ret
LB_4438:
	add rsp,0
	pop r14
LB_4436:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3612:
NS_E_RDI_3612:
NS_E_3612_ETR_TBL:
NS_E_3612_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; word
	jmp LB_4472
LB_4471:
	add r14,1
LB_4472:
	cmp r14,r10
	jge LB_4473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4471
	cmp al,10
	jz LB_4471
	cmp al,32
	jz LB_4471
LB_4473:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4453
LB_4474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_4477
LB_4476:
	add r14,1
LB_4477:
	cmp r14,r10
	jge LB_4478
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4476
	cmp al,10
	jz LB_4476
	cmp al,32
	jz LB_4476
LB_4478:
	push r10
	call NS_E_3614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4479
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4480
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4480:
	jmp LB_4453
LB_4479:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_4483
LB_4482:
	add r14,1
LB_4483:
	cmp r14,r10
	jge LB_4484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4482
	cmp al,10
	jz LB_4482
	cmp al,32
	jz LB_4482
LB_4484:
	add r14,1
	cmp r14,r10
	jg LB_4489
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_4489
	jmp LB_4490
LB_4489:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4486
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4486:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4487
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4487:
	jmp LB_4453
LB_4490:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_4464
LB_4463:
	add r14,1
LB_4464:
	cmp r14,r10
	jge LB_4465
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4463
	cmp al,10
	jz LB_4463
	cmp al,32
	jz LB_4463
LB_4465:
	push r10
	call NS_E_3291_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4466
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4467
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4467:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4468
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4468:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4469
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4469:
	jmp LB_4454
LB_4466:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4461
	btr r12,3
	jmp LB_4462
LB_4461:
	bts r12,3
LB_4462:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4459
	btr r12,2
	jmp LB_4460
LB_4459:
	bts r12,2
LB_4460:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4457
	btr r12,1
	jmp LB_4458
LB_4457:
	bts r12,1
LB_4458:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4455
	btr r12,0
	jmp LB_4456
LB_4455:
	bts r12,0
LB_4456:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4450
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_4491
	btr r12,4
	jmp LB_4492
LB_4491:
	bts r12,4
LB_4492:
	mov r8,r9
	bt r12,3
	jc LB_4493
	btr r12,2
	jmp LB_4494
LB_4493:
	bts r12,2
LB_4494:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f820 %_3709 ⊢ %_3710 : %_3710
 ; {>  %_3708~1':_p3613 %_3709~2':_p798 %_3707~0':_stg }
; _f820 2' ⊢ °1◂2'
; _some { %_3707 %_3710 } ⊢ %_3711 : %_3711
 ; {>  %_3708~1':_p3613 %_3707~0':_stg %_3710~°1◂2':_p784 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_3711
 ; {>  %_3711~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p784 }) %_3708~1':_p3613 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_4439
	mov rdi,r14
	call dlt
LB_4439:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_4442
	btr r12,1
	jmp LB_4443
LB_4442:
	bts r12,1
LB_4443:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_4440
	btr QWORD [rdi],0
	jmp LB_4441
LB_4440:
	bts QWORD [rdi],0
LB_4441:
	mov r14,r8
	bt r12,2
	jc LB_4448
	btr r12,1
	jmp LB_4449
LB_4448:
	bts r12,1
LB_4449:
	mov rsi,1
	bt r12,1
	jc LB_4446
	mov rsi,0
	bt r14,0
	jc LB_4446
	jmp LB_4447
LB_4446:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_4447:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_4444
	btr QWORD [rdi],1
	jmp LB_4445
LB_4444:
	bts QWORD [rdi],1
LB_4445:
	mov r8,0
	bts r12,2
	ret
LB_4450:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4452
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4451
LB_4452:
	add rsp,8
	ret
LB_4454:
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
LB_4453:
	add rsp,64
	pop r14
LB_4451:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; word
	jmp LB_4541
LB_4540:
	add r14,1
LB_4541:
	cmp r14,r10
	jge LB_4542
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4540
	cmp al,10
	jz LB_4540
	cmp al,32
	jz LB_4540
LB_4542:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4543
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4525
LB_4543:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_4546
LB_4545:
	add r14,1
LB_4546:
	cmp r14,r10
	jge LB_4547
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4545
	cmp al,10
	jz LB_4545
	cmp al,32
	jz LB_4545
LB_4547:
	push r10
	call NS_E_3614_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4548
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4549
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4549:
	jmp LB_4525
LB_4548:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_4552
LB_4551:
	add r14,1
LB_4552:
	cmp r14,r10
	jge LB_4553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4551
	cmp al,10
	jz LB_4551
	cmp al,32
	jz LB_4551
LB_4553:
	add r14,3
	cmp r14,r10
	jg LB_4558
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4558
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_4558
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_4558
	jmp LB_4559
LB_4558:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4555
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4555:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4556
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4556:
	jmp LB_4525
LB_4559:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_4561
LB_4560:
	add r14,1
LB_4561:
	cmp r14,r10
	jge LB_4562
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4560
	cmp al,10
	jz LB_4560
	cmp al,32
	jz LB_4560
LB_4562:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4563
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4564
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4564:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4565
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4565:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4566
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4566:
	jmp LB_4525
LB_4563:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_4569
LB_4568:
	add r14,1
LB_4569:
	cmp r14,r10
	jge LB_4570
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4568
	cmp al,10
	jz LB_4568
	cmp al,32
	jz LB_4568
LB_4570:
	add r14,1
	cmp r14,r10
	jg LB_4577
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_4577
	jmp LB_4578
LB_4577:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4572
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4572:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4573
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4573:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4574
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4574:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4575:
	jmp LB_4525
LB_4578:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_4580
LB_4579:
	add r14,1
LB_4580:
	cmp r14,r10
	jge LB_4581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4579
	cmp al,10
	jz LB_4579
	cmp al,32
	jz LB_4579
LB_4581:
	push r10
	call NS_E_3291_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4583
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4583:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4584
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4584:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4585
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4585:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4586
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4586:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4587
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4587:
	jmp LB_4525
LB_4582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_4590
LB_4589:
	add r14,1
LB_4590:
	cmp r14,r10
	jge LB_4591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4589
	cmp al,10
	jz LB_4589
	cmp al,32
	jz LB_4589
LB_4591:
	push r10
	call NS_E_3616_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4592
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_4593
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_4593:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_4594
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_4594:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4595
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4595:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4596
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4596:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4597
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4597:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4598
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4598:
	jmp LB_4525
LB_4592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_4538
	btr r12,6
	jmp LB_4539
LB_4538:
	bts r12,6
LB_4539:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4536
	btr r12,5
	jmp LB_4537
LB_4536:
	bts r12,5
LB_4537:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4534
	btr r12,4
	jmp LB_4535
LB_4534:
	bts r12,4
LB_4535:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4532
	btr r12,3
	jmp LB_4533
LB_4532:
	bts r12,3
LB_4533:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4530
	btr r12,2
	jmp LB_4531
LB_4530:
	bts r12,2
LB_4531:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4528
	btr r12,1
	jmp LB_4529
LB_4528:
	bts r12,1
LB_4529:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4526
	btr r12,0
	jmp LB_4527
LB_4526:
	bts r12,0
LB_4527:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_4522
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_4600
	btr r12,7
	jmp LB_4601
LB_4600:
	bts r12,7
LB_4601:
	mov r10,rcx
	bt r12,6
	jc LB_4602
	btr r12,4
	jmp LB_4603
LB_4602:
	bts r12,4
LB_4603:
	mov rcx,r9
	bt r12,3
	jc LB_4604
	btr r12,6
	jmp LB_4605
LB_4604:
	bts r12,6
LB_4605:
	mov r9,r11
	bt r12,5
	jc LB_4606
	btr r12,3
	jmp LB_4607
LB_4606:
	bts r12,3
LB_4607:
	mov r11,r8
	bt r12,2
	jc LB_4608
	btr r12,5
	jmp LB_4609
LB_4608:
	bts r12,5
LB_4609:
	mov r8,rcx
	bt r12,6
	jc LB_4610
	btr r12,2
	jmp LB_4611
LB_4610:
	bts r12,2
LB_4611:
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_3714 %_3715 } %_3716 } ⊢ %_3717 : %_3717
 ; {>  %_3716~4':(_lst)◂({ _stg _p798 }) %_3712~0':_stg %_3715~3':_p798 %_3713~1':_p3613 %_3714~2':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f819 %_3717 ⊢ %_3718 : %_3718
 ; {>  %_3717~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p798 }) %_3712~0':_stg %_3713~1':_p3613 }
; _f819 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_3712 %_3718 } ⊢ %_3719 : %_3719
 ; {>  %_3718~°0◂°0◂{ { 2' 3' } 4' }:_p784 %_3712~0':_stg %_3713~1':_p3613 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_3719
 ; {>  %_3713~1':_p3613 %_3719~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p784 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_4495
	mov rdi,r14
	call dlt
LB_4495:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_4496
	btr r12,1
	jmp LB_4497
LB_4496:
	bts r12,1
LB_4497:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_4500
	btr r12,5
	jmp LB_4501
LB_4500:
	bts r12,5
LB_4501:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_4498
	btr QWORD [rdi],0
	jmp LB_4499
LB_4498:
	bts QWORD [rdi],0
LB_4499:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_4512
	btr r12,6
	jmp LB_4513
LB_4512:
	bts r12,6
LB_4513:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_4510
	btr QWORD [rdi],0
	jmp LB_4511
LB_4510:
	bts QWORD [rdi],0
LB_4511:
	mov rcx,r14
	bt r12,1
	jc LB_4516
	btr r12,6
	jmp LB_4517
LB_4516:
	bts r12,6
LB_4517:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_4514
	btr QWORD [rdi],1
	jmp LB_4515
LB_4514:
	bts QWORD [rdi],1
LB_4515:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_4508
	btr QWORD [rdi],0
	jmp LB_4509
LB_4508:
	bts QWORD [rdi],0
LB_4509:
	mov r13,r10
	bt r12,4
	jc LB_4520
	btr r12,0
	jmp LB_4521
LB_4520:
	bts r12,0
LB_4521:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_4518
	btr QWORD [rdi],1
	jmp LB_4519
LB_4518:
	bts QWORD [rdi],1
LB_4519:
	mov rsi,1
	bt r12,5
	jc LB_4506
	mov rsi,0
	bt r11,0
	jc LB_4506
	jmp LB_4507
LB_4506:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_4507:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_4504
	mov rsi,0
	bt r11,0
	jc LB_4504
	jmp LB_4505
LB_4504:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_4505:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_4502
	btr QWORD [rdi],1
	jmp LB_4503
LB_4502:
	bts QWORD [rdi],1
LB_4503:
	mov r8,0
	bts r12,2
	ret
LB_4522:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4524
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4523
LB_4524:
	add rsp,8
	ret
LB_4525:
	add rsp,112
	pop r14
LB_4523:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3614:
NS_E_RDI_3614:
NS_E_3614_ETR_TBL:
NS_E_3614_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_4626
LB_4625:
	add r14,1
LB_4626:
	cmp r14,r10
	jge LB_4627
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4625
	cmp al,10
	jz LB_4625
	cmp al,32
	jz LB_4625
LB_4627:
	add r14,3
	cmp r14,r10
	jg LB_4630
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4630
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_4630
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_4630
	jmp LB_4631
LB_4630:
	jmp LB_4612
LB_4631:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_4620
LB_4619:
	add r14,1
LB_4620:
	cmp r14,r10
	jge LB_4621
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4619
	cmp al,10
	jz LB_4619
	cmp al,32
	jz LB_4619
LB_4621:
	push r10
	call NS_E_3295_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4622
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4623
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4623:
	jmp LB_4613
LB_4622:
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
	jc LB_4616
	btr QWORD [rdi],1
LB_4616:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4617
	btr QWORD [rdi],0
LB_4617:
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
LB_4613:
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
LB_4612:
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
LB_4614:
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
NS_E_3615:
NS_E_RDI_3615:
NS_E_3615_ETR_TBL:
NS_E_3615_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_4685
LB_4684:
	add r14,1
LB_4685:
	cmp r14,r10
	jge LB_4686
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4684
	cmp al,10
	jz LB_4684
	cmp al,32
	jz LB_4684
LB_4686:
	add r14,1
	cmp r14,r10
	jg LB_4689
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_4689
	jmp LB_4690
LB_4689:
	jmp LB_4651
LB_4690:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_4662
LB_4661:
	add r14,1
LB_4662:
	cmp r14,r10
	jge LB_4663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4661
	cmp al,10
	jz LB_4661
	cmp al,32
	jz LB_4661
LB_4663:
	add r14,1
	cmp r14,r10
	jg LB_4667
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4667
	jmp LB_4668
LB_4667:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4665
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4665:
	jmp LB_4652
LB_4668:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_4670
LB_4669:
	add r14,1
LB_4670:
	cmp r14,r10
	jge LB_4671
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4669
	cmp al,10
	jz LB_4669
	cmp al,32
	jz LB_4669
LB_4671:
	push r10
	call NS_E_3612_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4672
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4673
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4673:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4674
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4674:
	jmp LB_4652
LB_4672:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_4677
LB_4676:
	add r14,1
LB_4677:
	cmp r14,r10
	jge LB_4678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4676
	cmp al,10
	jz LB_4676
	cmp al,32
	jz LB_4676
LB_4678:
	push r10
	call NS_E_3615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4679
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4680
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4680:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4681
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4681:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4682
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4682:
	jmp LB_4652
LB_4679:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4659
	btr r12,3
	jmp LB_4660
LB_4659:
	bts r12,3
LB_4660:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4657
	btr r12,2
	jmp LB_4658
LB_4657:
	bts r12,2
LB_4658:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4655
	btr r12,1
	jmp LB_4656
LB_4655:
	bts r12,1
LB_4656:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4653
	btr r12,0
	jmp LB_4654
LB_4653:
	bts r12,0
LB_4654:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_4648
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_4691
	btr r12,4
	jmp LB_4692
LB_4691:
	bts r12,4
LB_4692:
	mov r8,r9
	bt r12,3
	jc LB_4693
	btr r12,2
	jmp LB_4694
LB_4693:
	bts r12,2
LB_4694:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_4697
	btr r12,3
	jmp LB_4698
LB_4697:
	bts r12,3
LB_4698:
	mov r13,r9
	bt r12,3
	jc LB_4695
	btr r12,0
	jmp LB_4696
LB_4695:
	bts r12,0
LB_4696:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_4701
	btr r12,3
	jmp LB_4702
LB_4701:
	bts r12,3
LB_4702:
	mov r14,r9
	bt r12,3
	jc LB_4699
	btr r12,1
	jmp LB_4700
LB_4699:
	bts r12,1
LB_4700:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3722 %_3723 } ⊢ %_3724 : %_3724
 ; {>  %_3722~{ 0' 1' }:{ _stg _p784 } %_3723~2':(_lst)◂({ _stg _p784 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_3724 ⊢ %_3725 : %_3725
 ; {>  %_3724~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p784 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_3725
 ; {>  %_3725~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p784 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_4638
	btr r12,5
	jmp LB_4639
LB_4638:
	bts r12,5
LB_4639:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_4636
	btr QWORD [rdi],0
	jmp LB_4637
LB_4636:
	bts QWORD [rdi],0
LB_4637:
	mov r11,r14
	bt r12,1
	jc LB_4642
	btr r12,5
	jmp LB_4643
LB_4642:
	bts r12,5
LB_4643:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_4640
	btr QWORD [rdi],1
	jmp LB_4641
LB_4640:
	bts QWORD [rdi],1
LB_4641:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4634
	btr QWORD [rdi],0
	jmp LB_4635
LB_4634:
	bts QWORD [rdi],0
LB_4635:
	mov r10,r8
	bt r12,2
	jc LB_4646
	btr r12,4
	jmp LB_4647
LB_4646:
	bts r12,4
LB_4647:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4644
	btr QWORD [rdi],1
	jmp LB_4645
LB_4644:
	bts QWORD [rdi],1
LB_4645:
	mov rsi,1
	bt r12,3
	jc LB_4632
	mov rsi,0
	bt r9,0
	jc LB_4632
	jmp LB_4633
LB_4632:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4633:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4648:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4650
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4649
LB_4650:
	add rsp,8
	ret
LB_4652:
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
LB_4651:
	add rsp,64
	pop r14
LB_4649:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4705
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3726 : %_3726
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3726 ⊢ %_3727 : %_3727
 ; {>  %_3726~°1◂{  }:(_lst)◂(t1566'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3727
 ; {>  %_3727~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1569'(0))) }
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
	jc LB_4703
	mov rsi,0
	bt r9,0
	jc LB_4703
	jmp LB_4704
LB_4703:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4704:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4705:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4707
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4706
LB_4707:
	add rsp,8
	ret
LB_4708:
	add rsp,0
	pop r14
LB_4706:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3616:
NS_E_RDI_3616:
NS_E_3616_ETR_TBL:
NS_E_3616_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_4773
LB_4772:
	add r14,1
LB_4773:
	cmp r14,r10
	jge LB_4774
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4772
	cmp al,10
	jz LB_4772
	cmp al,32
	jz LB_4772
LB_4774:
	add r14,3
	cmp r14,r10
	jg LB_4777
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4777
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_4777
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_4777
	jmp LB_4778
LB_4777:
	jmp LB_4728
LB_4778:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_4741
LB_4740:
	add r14,1
LB_4741:
	cmp r14,r10
	jge LB_4742
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4740
	cmp al,10
	jz LB_4740
	cmp al,32
	jz LB_4740
LB_4742:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4743
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4744:
	jmp LB_4729
LB_4743:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_4747
LB_4746:
	add r14,1
LB_4747:
	cmp r14,r10
	jge LB_4748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4746
	cmp al,10
	jz LB_4746
	cmp al,32
	jz LB_4746
LB_4748:
	add r14,1
	cmp r14,r10
	jg LB_4753
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_4753
	jmp LB_4754
LB_4753:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4750
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4750:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4751
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4751:
	jmp LB_4729
LB_4754:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_4756
LB_4755:
	add r14,1
LB_4756:
	cmp r14,r10
	jge LB_4757
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4755
	cmp al,10
	jz LB_4755
	cmp al,32
	jz LB_4755
LB_4757:
	push r10
	call NS_E_3291_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4758
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4759
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4759:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4760
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4760:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4761
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4761:
	jmp LB_4729
LB_4758:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_4764
LB_4763:
	add r14,1
LB_4764:
	cmp r14,r10
	jge LB_4765
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4763
	cmp al,10
	jz LB_4763
	cmp al,32
	jz LB_4763
LB_4765:
	push r10
	call NS_E_3616_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4766
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4767
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4767:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4768
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4768:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4769
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4769:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4770
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4770:
	jmp LB_4729
LB_4766:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4738
	btr r12,4
	jmp LB_4739
LB_4738:
	bts r12,4
LB_4739:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4736
	btr r12,3
	jmp LB_4737
LB_4736:
	bts r12,3
LB_4737:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4734
	btr r12,2
	jmp LB_4735
LB_4734:
	bts r12,2
LB_4735:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4732
	btr r12,1
	jmp LB_4733
LB_4732:
	bts r12,1
LB_4733:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4730
	btr r12,0
	jmp LB_4731
LB_4730:
	bts r12,0
LB_4731:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_4725
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_4779
	btr r12,5
	jmp LB_4780
LB_4779:
	bts r12,5
LB_4780:
	mov r8,r10
	bt r12,4
	jc LB_4781
	btr r12,2
	jmp LB_4782
LB_4781:
	bts r12,2
LB_4782:
	mov r10,r14
	bt r12,1
	jc LB_4783
	btr r12,4
	jmp LB_4784
LB_4783:
	bts r12,4
LB_4784:
	mov r14,r9
	bt r12,3
	jc LB_4785
	btr r12,1
	jmp LB_4786
LB_4785:
	bts r12,1
LB_4786:
	mov r9,r13
	bt r12,0
	jc LB_4787
	btr r12,3
	jmp LB_4788
LB_4787:
	bts r12,3
LB_4788:
	mov r13,r10
	bt r12,4
	jc LB_4789
	btr r12,0
	jmp LB_4790
LB_4789:
	bts r12,0
LB_4790:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_3728 %_3729 } %_3730 } ⊢ %_3731 : %_3731
 ; {>  %_3728~0':_stg %_3730~2':(_lst)◂({ _stg _p798 }) %_3729~1':_p798 }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_3731 ⊢ %_3732 : %_3732
 ; {>  %_3731~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p798 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_3732
 ; {>  %_3732~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p798 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_4715
	btr r12,5
	jmp LB_4716
LB_4715:
	bts r12,5
LB_4716:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_4713
	btr QWORD [rdi],0
	jmp LB_4714
LB_4713:
	bts QWORD [rdi],0
LB_4714:
	mov r11,r14
	bt r12,1
	jc LB_4719
	btr r12,5
	jmp LB_4720
LB_4719:
	bts r12,5
LB_4720:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_4717
	btr QWORD [rdi],1
	jmp LB_4718
LB_4717:
	bts QWORD [rdi],1
LB_4718:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4711
	btr QWORD [rdi],0
	jmp LB_4712
LB_4711:
	bts QWORD [rdi],0
LB_4712:
	mov r10,r8
	bt r12,2
	jc LB_4723
	btr r12,4
	jmp LB_4724
LB_4723:
	bts r12,4
LB_4724:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4721
	btr QWORD [rdi],1
	jmp LB_4722
LB_4721:
	bts QWORD [rdi],1
LB_4722:
	mov rsi,1
	bt r12,3
	jc LB_4709
	mov rsi,0
	bt r9,0
	jc LB_4709
	jmp LB_4710
LB_4709:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4710:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4725:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4727
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4726
LB_4727:
	add rsp,8
	ret
LB_4729:
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
LB_4728:
	add rsp,80
	pop r14
LB_4726:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4793
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3733 : %_3733
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3733 ⊢ %_3734 : %_3734
 ; {>  %_3733~°1◂{  }:(_lst)◂(t1580'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3734
 ; {>  %_3734~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1583'(0))) }
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
	jc LB_4791
	mov rsi,0
	bt r9,0
	jc LB_4791
	jmp LB_4792
LB_4791:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4792:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4793:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4795
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4794
LB_4795:
	add rsp,8
	ret
LB_4796:
	add rsp,0
	pop r14
LB_4794:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3617:
NS_E_RDI_3617:
NS_E_3617_ETR_TBL:
NS_E_3617_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_4861
LB_4860:
	add r14,1
LB_4861:
	cmp r14,r10
	jge LB_4862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4860
	cmp al,10
	jz LB_4860
	cmp al,32
	jz LB_4860
LB_4862:
	add r14,1
	cmp r14,r10
	jg LB_4865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_4865
	jmp LB_4866
LB_4865:
	jmp LB_4808
LB_4866:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_4823
LB_4822:
	add r14,1
LB_4823:
	cmp r14,r10
	jge LB_4824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4822
	cmp al,10
	jz LB_4822
	cmp al,32
	jz LB_4822
LB_4824:
	add r14,1
	cmp r14,r10
	jg LB_4828
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4828
	jmp LB_4829
LB_4828:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4826
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4826:
	jmp LB_4809
LB_4829:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_4831
LB_4830:
	add r14,1
LB_4831:
	cmp r14,r10
	jge LB_4832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4830
	cmp al,10
	jz LB_4830
	cmp al,32
	jz LB_4830
LB_4832:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4833
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4834
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4834:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4835
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4835:
	jmp LB_4809
LB_4833:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_4838
LB_4837:
	add r14,1
LB_4838:
	cmp r14,r10
	jge LB_4839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4837
	cmp al,10
	jz LB_4837
	cmp al,32
	jz LB_4837
LB_4839:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4840
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4841
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4841:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4842
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4842:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4843:
	jmp LB_4809
LB_4840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_4846
LB_4845:
	add r14,1
LB_4846:
	cmp r14,r10
	jge LB_4847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4845
	cmp al,10
	jz LB_4845
	cmp al,32
	jz LB_4845
LB_4847:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4848
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4849
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4849:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4850
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4850:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4851
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4851:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4852
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4852:
	jmp LB_4809
LB_4848:
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
LB_4858:
	jmp LB_4855
LB_4854:
	add r14,1
LB_4855:
	cmp r14,r10
	jge LB_4856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4854
	cmp al,10
	jz LB_4854
	cmp al,32
	jz LB_4854
LB_4856:
	push r10
	push rsi
	call NS_E_3619_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_4857
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_4859
	bts QWORD [rax],0
LB_4859:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_4858
LB_4857:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_4820
	btr r12,5
	jmp LB_4821
LB_4820:
	bts r12,5
LB_4821:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_4818
	btr r12,4
	jmp LB_4819
LB_4818:
	bts r12,4
LB_4819:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4816
	btr r12,3
	jmp LB_4817
LB_4816:
	bts r12,3
LB_4817:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4814
	btr r12,2
	jmp LB_4815
LB_4814:
	bts r12,2
LB_4815:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4812
	btr r12,1
	jmp LB_4813
LB_4812:
	bts r12,1
LB_4813:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4810
	btr r12,0
	jmp LB_4811
LB_4810:
	bts r12,0
LB_4811:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_4805
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_4867
	btr r12,6
	jmp LB_4868
LB_4867:
	bts r12,6
LB_4868:
	mov r9,r11
	bt r12,5
	jc LB_4869
	btr r12,3
	jmp LB_4870
LB_4869:
	bts r12,3
LB_4870:
	mov r11,r8
	bt r12,2
	jc LB_4871
	btr r12,5
	jmp LB_4872
LB_4871:
	bts r12,5
LB_4872:
	mov r8,r10
	bt r12,4
	jc LB_4873
	btr r12,2
	jmp LB_4874
LB_4873:
	bts r12,2
LB_4874:
	mov r10,r14
	bt r12,1
	jc LB_4875
	btr r12,4
	jmp LB_4876
LB_4875:
	bts r12,4
LB_4876:
	mov r14,rcx
	bt r12,6
	jc LB_4877
	btr r12,1
	jmp LB_4878
LB_4877:
	bts r12,1
LB_4878:
	mov rcx,r13
	bt r12,0
	jc LB_4879
	btr r12,6
	jmp LB_4880
LB_4879:
	bts r12,6
LB_4880:
	mov r13,r11
	bt r12,5
	jc LB_4881
	btr r12,0
	jmp LB_4882
LB_4881:
	bts r12,0
LB_4882:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3739 : %_3739
 ; {>  %_3737~2':_p800 %_3738~3':(_lst)◂(_p3618) %_3735~0':_stg %_3736~1':_p797 }
; _nil {  } ⊢ °1◂{  }
; _f811 %_3739 ⊢ %_3740 : %_3740
 ; {>  %_3737~2':_p800 %_3739~°1◂{  }:(_lst)◂(t1592'(0)) %_3738~3':(_lst)◂(_p3618) %_3735~0':_stg %_3736~1':_p797 }
; _f811 °1◂{  } ⊢ °3◂°1◂{  }
; _some %_3740 ⊢ %_3741 : %_3741
 ; {>  %_3737~2':_p800 %_3738~3':(_lst)◂(_p3618) %_3740~°3◂°1◂{  }:_p781 %_3735~0':_stg %_3736~1':_p797 }
; _some °3◂°1◂{  } ⊢ °0◂°3◂°1◂{  }
; ∎ %_3741
 ; {>  %_3737~2':_p800 %_3741~°0◂°3◂°1◂{  }:(_opn)◂(_p781) %_3738~3':(_lst)◂(_p3618) %_3735~0':_stg %_3736~1':_p797 }
; 	∎ °0◂°3◂°1◂{  }
	bt r12,2
	jc LB_4797
	mov rdi,r8
	call dlt
LB_4797:
	bt r12,3
	jc LB_4798
	mov rdi,r9
	call dlt
LB_4798:
	bt r12,0
	jc LB_4799
	mov rdi,r13
	call dlt
LB_4799:
	bt r12,1
	jc LB_4800
	mov rdi,r14
	call dlt
LB_4800:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°3◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4803
	mov rsi,0
	bt r9,0
	jc LB_4803
	jmp LB_4804
LB_4803:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4804:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_4801
	mov rsi,0
	bt r9,0
	jc LB_4801
	jmp LB_4802
LB_4801:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4802:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4805:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4807
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4806
LB_4807:
	add rsp,8
	ret
LB_4809:
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
LB_4808:
	add rsp,96
	pop r14
LB_4806:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_4902
LB_4901:
	add r14,1
LB_4902:
	cmp r14,r10
	jge LB_4903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4901
	cmp al,10
	jz LB_4901
	cmp al,32
	jz LB_4901
LB_4903:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4904
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4896
LB_4904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_4907
LB_4906:
	add r14,1
LB_4907:
	cmp r14,r10
	jge LB_4908
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4906
	cmp al,10
	jz LB_4906
	cmp al,32
	jz LB_4906
LB_4908:
	push r10
	call NS_E_3620_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4909
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4910
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4910:
	jmp LB_4896
LB_4909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4899
	btr r12,1
	jmp LB_4900
LB_4899:
	bts r12,1
LB_4900:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4897
	btr r12,0
	jmp LB_4898
LB_4897:
	bts r12,0
LB_4898:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4893
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f810 { %_3742 %_3743 } ⊢ %_3744 : %_3744
 ; {>  %_3742~0':_stg %_3743~1':_p783 }
; _f810 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_3744 ⊢ %_3745 : %_3745
 ; {>  %_3744~°2◂{ 0' 1' }:_p781 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_3745
 ; {>  %_3745~°0◂°2◂{ 0' 1' }:(_opn)◂(_p781) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4887
	btr r12,2
	jmp LB_4888
LB_4887:
	bts r12,2
LB_4888:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4885
	btr QWORD [rdi],0
	jmp LB_4886
LB_4885:
	bts QWORD [rdi],0
LB_4886:
	mov r8,r14
	bt r12,1
	jc LB_4891
	btr r12,2
	jmp LB_4892
LB_4891:
	bts r12,2
LB_4892:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4889
	btr QWORD [rdi],1
	jmp LB_4890
LB_4889:
	bts QWORD [rdi],1
LB_4890:
	mov rsi,1
	bt r12,3
	jc LB_4883
	mov rsi,0
	bt r9,0
	jc LB_4883
	jmp LB_4884
LB_4883:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4884:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4893:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4895
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4894
LB_4895:
	add rsp,8
	ret
LB_4896:
	add rsp,32
	pop r14
LB_4894:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4913
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_3746
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_3746 ⊢ %_3747 : %_3747
 ; {>  %_3746~0':_stg }
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
; _none {  } ⊢ %_3748 : %_3748
 ; {>  %_3747~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_3748
 ; {>  %_3747~0':_stg %_3748~°1◂{  }:(_opn)◂(t1606'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4912
	mov rdi,r13
	call dlt
LB_4912:
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
LB_4913:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4915
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4914
LB_4915:
	add rsp,8
	ret
LB_4916:
	add rsp,0
	pop r14
LB_4914:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3619:
NS_E_RDI_3619:
NS_E_3619_ETR_TBL:
NS_E_3619_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_4925
LB_4924:
	add r14,1
LB_4925:
	cmp r14,r10
	jge LB_4926
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4924
	cmp al,10
	jz LB_4924
	cmp al,32
	jz LB_4924
LB_4926:
	add r14,1
	cmp r14,r10
	jg LB_4929
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_4929
	jmp LB_4930
LB_4929:
	jmp LB_4917
LB_4930:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_4932
LB_4931:
	add r14,1
LB_4932:
	cmp r14,r10
	jge LB_4933
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4931
	cmp al,10
	jz LB_4931
	cmp al,32
	jz LB_4931
LB_4933:
	add r14,1
	cmp r14,r10
	jg LB_4937
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4937
	jmp LB_4938
LB_4937:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4935
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4935:
	jmp LB_4917
LB_4938:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_4940
LB_4939:
	add r14,1
LB_4940:
	cmp r14,r10
	jge LB_4941
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4939
	cmp al,10
	jz LB_4939
	cmp al,32
	jz LB_4939
LB_4941:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4942
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4943
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4943:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4944:
	jmp LB_4917
LB_4942:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_4947
LB_4946:
	add r14,1
LB_4947:
	cmp r14,r10
	jge LB_4948
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4946
	cmp al,10
	jz LB_4946
	cmp al,32
	jz LB_4946
LB_4948:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4949
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4950
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4950:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4951
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4951:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4952
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4952:
	jmp LB_4917
LB_4949:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_4955
LB_4954:
	add r14,1
LB_4955:
	cmp r14,r10
	jge LB_4956
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4954
	cmp al,10
	jz LB_4954
	cmp al,32
	jz LB_4954
LB_4956:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4957
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_4958
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_4958:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_4959
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_4959:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4960
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4960:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4961
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4961:
	jmp LB_4917
LB_4957:
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
	jc LB_4918
	btr QWORD [rdi],4
LB_4918:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_4919
	btr QWORD [rdi],3
LB_4919:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4920
	btr QWORD [rdi],2
LB_4920:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4921
	btr QWORD [rdi],1
LB_4921:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4922
	btr QWORD [rdi],0
LB_4922:
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
LB_4917:
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
NS_E_3620:
NS_E_RDI_3620:
NS_E_3620_ETR_TBL:
NS_E_3620_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_4983
LB_4982:
	add r14,1
LB_4983:
	cmp r14,r10
	jge LB_4984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4982
	cmp al,10
	jz LB_4982
	cmp al,32
	jz LB_4982
LB_4984:
	add r14,1
	cmp r14,r10
	jg LB_4987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_4987
	jmp LB_4988
LB_4987:
	jmp LB_4970
LB_4988:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_4977
LB_4976:
	add r14,1
LB_4977:
	cmp r14,r10
	jge LB_4978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4976
	cmp al,10
	jz LB_4976
	cmp al,32
	jz LB_4976
LB_4978:
	push r10
	call NS_E_2628_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4980:
	jmp LB_4971
LB_4979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4974
	btr r12,1
	jmp LB_4975
LB_4974:
	bts r12,1
LB_4975:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4972
	btr r12,0
	jmp LB_4973
LB_4972:
	bts r12,0
LB_4973:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4967
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4989
	btr r12,2
	jmp LB_4990
LB_4989:
	bts r12,2
LB_4990:
	mov r13,r14
	bt r12,1
	jc LB_4991
	btr r12,0
	jmp LB_4992
LB_4991:
	bts r12,0
LB_4992:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f817 %_3750 ⊢ %_3751 : %_3751
 ; {>  %_3750~0':_p799 }
; _f817 0' ⊢ °1◂0'
; _some %_3751 ⊢ %_3752 : %_3752
 ; {>  %_3751~°1◂0':_p783 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3752
 ; {>  %_3752~°0◂°1◂0':(_opn)◂(_p783) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4965
	btr r12,3
	jmp LB_4966
LB_4965:
	bts r12,3
LB_4966:
	mov rsi,1
	bt r12,3
	jc LB_4963
	mov rsi,0
	bt r9,0
	jc LB_4963
	jmp LB_4964
LB_4963:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4964:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4967:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4969
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4968
LB_4969:
	add rsp,8
	ret
LB_4971:
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
LB_4970:
	add rsp,32
	pop r14
LB_4968:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_5013
LB_5012:
	add r14,1
LB_5013:
	cmp r14,r10
	jge LB_5014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5012
	cmp al,10
	jz LB_5012
	cmp al,32
	jz LB_5012
LB_5014:
	add r14,2
	cmp r14,r10
	jg LB_5017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_5017
	jmp LB_5018
LB_5017:
	jmp LB_5000
LB_5018:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_5007
LB_5006:
	add r14,1
LB_5007:
	cmp r14,r10
	jge LB_5008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5006
	cmp al,10
	jz LB_5006
	cmp al,32
	jz LB_5006
LB_5008:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5009
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5010
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5010:
	jmp LB_5001
LB_5009:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5004
	btr r12,1
	jmp LB_5005
LB_5004:
	bts r12,1
LB_5005:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5002
	btr r12,0
	jmp LB_5003
LB_5002:
	bts r12,0
LB_5003:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4997
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5019
	btr r12,2
	jmp LB_5020
LB_5019:
	bts r12,2
LB_5020:
	mov r13,r14
	bt r12,1
	jc LB_5021
	btr r12,0
	jmp LB_5022
LB_5021:
	bts r12,0
LB_5022:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f818 %_3753 ⊢ %_3754 : %_3754
 ; {>  %_3753~0':_p800 }
; _f818 0' ⊢ °2◂0'
; _some %_3754 ⊢ %_3755 : %_3755
 ; {>  %_3754~°2◂0':_p783 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_3755
 ; {>  %_3755~°0◂°2◂0':(_opn)◂(_p783) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4995
	btr r12,3
	jmp LB_4996
LB_4995:
	bts r12,3
LB_4996:
	mov rsi,1
	bt r12,3
	jc LB_4993
	mov rsi,0
	bt r9,0
	jc LB_4993
	jmp LB_4994
LB_4993:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4994:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4997:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4999
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4998
LB_4999:
	add rsp,8
	ret
LB_5001:
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
LB_5000:
	add rsp,32
	pop r14
LB_4998:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_5042
LB_5041:
	add r14,1
LB_5042:
	cmp r14,r10
	jge LB_5043
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5041
	cmp al,10
	jz LB_5041
	cmp al,32
	jz LB_5041
LB_5043:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5044
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5036
LB_5044:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_5047
LB_5046:
	add r14,1
LB_5047:
	cmp r14,r10
	jge LB_5048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5046
	cmp al,10
	jz LB_5046
	cmp al,32
	jz LB_5046
LB_5048:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5049
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5050
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5050:
	jmp LB_5036
LB_5049:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5039
	btr r12,1
	jmp LB_5040
LB_5039:
	bts r12,1
LB_5040:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5037
	btr r12,0
	jmp LB_5038
LB_5037:
	bts r12,0
LB_5038:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5033
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f816 { %_3756 %_3757 } ⊢ %_3758 : %_3758
 ; {>  %_3757~1':_p800 %_3756~0':_p797 }
; _f816 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3758 ⊢ %_3759 : %_3759
 ; {>  %_3758~°0◂{ 0' 1' }:_p783 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3759
 ; {>  %_3759~°0◂°0◂{ 0' 1' }:(_opn)◂(_p783) }
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
	jc LB_5027
	btr r12,2
	jmp LB_5028
LB_5027:
	bts r12,2
LB_5028:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5025
	btr QWORD [rdi],0
	jmp LB_5026
LB_5025:
	bts QWORD [rdi],0
LB_5026:
	mov r8,r14
	bt r12,1
	jc LB_5031
	btr r12,2
	jmp LB_5032
LB_5031:
	bts r12,2
LB_5032:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5029
	btr QWORD [rdi],1
	jmp LB_5030
LB_5029:
	bts QWORD [rdi],1
LB_5030:
	mov rsi,1
	bt r12,3
	jc LB_5023
	mov rsi,0
	bt r9,0
	jc LB_5023
	jmp LB_5024
LB_5023:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5024:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5033:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5035
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5034
LB_5035:
	add rsp,8
	ret
LB_5036:
	add rsp,32
	pop r14
LB_5034:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3621:
NS_E_RDI_3621:
NS_E_3621_ETR_TBL:
NS_E_3621_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_5065
LB_5064:
	add r14,1
LB_5065:
	cmp r14,r10
	jge LB_5066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5064
	cmp al,10
	jz LB_5064
	cmp al,32
	jz LB_5064
LB_5066:
	add r14,3
	cmp r14,r10
	jg LB_5069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_5069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_5069
	jmp LB_5070
LB_5069:
	jmp LB_5059
LB_5070:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_5072
LB_5071:
	add r14,1
LB_5072:
	cmp r14,r10
	jge LB_5073
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5071
	cmp al,10
	jz LB_5071
	cmp al,32
	jz LB_5071
LB_5073:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5074
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5075:
	jmp LB_5059
LB_5074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5062
	btr r12,1
	jmp LB_5063
LB_5062:
	bts r12,1
LB_5063:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5060
	btr r12,0
	jmp LB_5061
LB_5060:
	bts r12,0
LB_5061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5056
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5077
	btr r12,2
	jmp LB_5078
LB_5077:
	bts r12,2
LB_5078:
	mov r13,r14
	bt r12,1
	jc LB_5079
	btr r12,0
	jmp LB_5080
LB_5079:
	bts r12,0
LB_5080:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f859 %_3760 ⊢ %_3761 : %_3761
 ; {>  %_3760~0':_p796 }
; _f859 0' ⊢ °2◂0'
; _some %_3761 ⊢ %_3762 : %_3762
 ; {>  %_3761~°2◂0':_p800 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_3762
 ; {>  %_3762~°0◂°2◂0':(_opn)◂(_p800) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5054
	btr r12,3
	jmp LB_5055
LB_5054:
	bts r12,3
LB_5055:
	mov rsi,1
	bt r12,3
	jc LB_5052
	mov rsi,0
	bt r9,0
	jc LB_5052
	jmp LB_5053
LB_5052:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5053:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5056:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5058
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5057
LB_5058:
	add rsp,8
	ret
LB_5059:
	add rsp,32
	pop r14
LB_5057:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_5092
LB_5091:
	add r14,1
LB_5092:
	cmp r14,r10
	jge LB_5093
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5091
	cmp al,10
	jz LB_5091
	cmp al,32
	jz LB_5091
LB_5093:
	push r10
	call NS_E_3629_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5094
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5088
LB_5094:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5089
	btr r12,0
	jmp LB_5090
LB_5089:
	bts r12,0
LB_5090:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5085
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f858 %_3763 ⊢ %_3764 : %_3764
 ; {>  %_3763~0':_p801 }
; _f858 0' ⊢ °1◂0'
; _some %_3764 ⊢ %_3765 : %_3765
 ; {>  %_3764~°1◂0':_p800 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3765
 ; {>  %_3765~°0◂°1◂0':(_opn)◂(_p800) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5083
	btr r12,3
	jmp LB_5084
LB_5083:
	bts r12,3
LB_5084:
	mov rsi,1
	bt r12,3
	jc LB_5081
	mov rsi,0
	bt r9,0
	jc LB_5081
	jmp LB_5082
LB_5081:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5082:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5085:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5087
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5086
LB_5087:
	add rsp,8
	ret
LB_5088:
	add rsp,16
	pop r14
LB_5086:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_5108
LB_5107:
	add r14,1
LB_5108:
	cmp r14,r10
	jge LB_5109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5107
	cmp al,10
	jz LB_5107
	cmp al,32
	jz LB_5107
LB_5109:
	push r10
	call NS_E_3622_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5110
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5102
LB_5110:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_5113
LB_5112:
	add r14,1
LB_5113:
	cmp r14,r10
	jge LB_5114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5112
	cmp al,10
	jz LB_5112
	cmp al,32
	jz LB_5112
LB_5114:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5115
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5116:
	jmp LB_5102
LB_5115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5105
	btr r12,1
	jmp LB_5106
LB_5105:
	bts r12,1
LB_5106:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5103
	btr r12,0
	jmp LB_5104
LB_5103:
	bts r12,0
LB_5104:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5099
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_5118
	btr r12,3
	jmp LB_5119
LB_5118:
	bts r12,3
LB_5119:
	mov r10,r13
	bt r12,0
	jc LB_5120
	btr r12,4
	jmp LB_5121
LB_5120:
	bts r12,4
LB_5121:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_5124
	btr r12,5
	jmp LB_5125
LB_5124:
	bts r12,5
LB_5125:
	mov r13,r11
	bt r12,5
	jc LB_5122
	btr r12,0
	jmp LB_5123
LB_5122:
	bts r12,0
LB_5123:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_5128
	btr r12,5
	jmp LB_5129
LB_5128:
	bts r12,5
LB_5129:
	mov r14,r11
	bt r12,5
	jc LB_5126
	btr r12,1
	jmp LB_5127
LB_5126:
	bts r12,1
LB_5127:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_5132
	btr r12,5
	jmp LB_5133
LB_5132:
	bts r12,5
LB_5133:
	mov r8,r11
	bt r12,5
	jc LB_5130
	btr r12,2
	jmp LB_5131
LB_5130:
	bts r12,2
LB_5131:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3767 ⊢ %_3768 : %_3768
 ; {>  %_3767~3':_p800 %_3766~{ 0' 1' 2' }:{ _p805 _p796 _p797 } }
; _some 3' ⊢ °0◂3'
; ∎ %_3768
 ; {>  %_3768~°0◂3':(_opn)◂(_p800) %_3766~{ 0' 1' 2' }:{ _p805 _p796 _p797 } }
; 	∎ °0◂3'
	bt r12,0
	jc LB_5096
	mov rdi,r13
	call dlt
LB_5096:
	bt r12,1
	jc LB_5097
	mov rdi,r14
	call dlt
LB_5097:
	bt r12,2
	jc LB_5098
	mov rdi,r8
	call dlt
LB_5098:
; _emt_mov_ptn_to_ptn:{| 00010.. |},°0◂3' ⊢ 2'◂3'
	mov r8,0
	bts r12,2
	ret
LB_5099:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5101
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5100
LB_5101:
	add rsp,8
	ret
LB_5102:
	add rsp,32
	pop r14
LB_5100:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3622:
NS_E_RDI_3622:
NS_E_3622_ETR_TBL:
NS_E_3622_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_5199
LB_5198:
	add r14,1
LB_5199:
	cmp r14,r10
	jge LB_5200
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5198
	cmp al,10
	jz LB_5198
	cmp al,32
	jz LB_5198
LB_5200:
	add r14,1
	cmp r14,r10
	jg LB_5203
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_5203
	jmp LB_5204
LB_5203:
	jmp LB_5154
LB_5204:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_5167
LB_5166:
	add r14,1
LB_5167:
	cmp r14,r10
	jge LB_5168
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5166
	cmp al,10
	jz LB_5166
	cmp al,32
	jz LB_5166
LB_5168:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5169
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5170
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5170:
	jmp LB_5155
LB_5169:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_5173
LB_5172:
	add r14,1
LB_5173:
	cmp r14,r10
	jge LB_5174
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5172
	cmp al,10
	jz LB_5172
	cmp al,32
	jz LB_5172
LB_5174:
	add r14,3
	cmp r14,r10
	jg LB_5179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5179
	jmp LB_5180
LB_5179:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5176
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5176:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5177:
	jmp LB_5155
LB_5180:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_5182
LB_5181:
	add r14,1
LB_5182:
	cmp r14,r10
	jge LB_5183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5181
	cmp al,10
	jz LB_5181
	cmp al,32
	jz LB_5181
LB_5183:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5184
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5185
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5185:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5186
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5186:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5187
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5187:
	jmp LB_5155
LB_5184:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_5190
LB_5189:
	add r14,1
LB_5190:
	cmp r14,r10
	jge LB_5191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5189
	cmp al,10
	jz LB_5189
	cmp al,32
	jz LB_5189
LB_5191:
	push r10
	call NS_E_3024_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5192
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5193
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5193:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5194
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5194:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5195
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5196
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5196:
	jmp LB_5155
LB_5192:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5164
	btr r12,4
	jmp LB_5165
LB_5164:
	bts r12,4
LB_5165:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5162
	btr r12,3
	jmp LB_5163
LB_5162:
	bts r12,3
LB_5163:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5160
	btr r12,2
	jmp LB_5161
LB_5160:
	bts r12,2
LB_5161:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5158
	btr r12,1
	jmp LB_5159
LB_5158:
	bts r12,1
LB_5159:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5156
	btr r12,0
	jmp LB_5157
LB_5156:
	bts r12,0
LB_5157:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_5151
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_5205
	btr r12,5
	jmp LB_5206
LB_5205:
	bts r12,5
LB_5206:
	mov r8,r10
	bt r12,4
	jc LB_5207
	btr r12,2
	jmp LB_5208
LB_5207:
	bts r12,2
LB_5208:
	mov r10,r14
	bt r12,1
	jc LB_5209
	btr r12,4
	jmp LB_5210
LB_5209:
	bts r12,4
LB_5210:
	mov r14,r9
	bt r12,3
	jc LB_5211
	btr r12,1
	jmp LB_5212
LB_5211:
	bts r12,1
LB_5212:
	mov r9,r13
	bt r12,0
	jc LB_5213
	btr r12,3
	jmp LB_5214
LB_5213:
	bts r12,3
LB_5214:
	mov r13,r10
	bt r12,4
	jc LB_5215
	btr r12,0
	jmp LB_5216
LB_5215:
	bts r12,0
LB_5216:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_3772 : %_3772
 ; {>  %_3769~0':_p796 %_3771~2':_p3023 %_3770~1':_p797 }
; 	» 0xr1 _ ⊢ 3' : %_3772
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f869 %_3772 ⊢ %_3773 : %_3773
 ; {>  %_3769~0':_p796 %_3771~2':_p3023 %_3770~1':_p797 %_3772~3':_r64 }
; _f869 3' ⊢ °1◂3'
; _some { %_3773 %_3769 %_3770 } ⊢ %_3774 : %_3774
 ; {>  %_3769~0':_p796 %_3773~°1◂3':_p805 %_3771~2':_p3023 %_3770~1':_p797 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_3774
 ; {>  %_3771~2':_p3023 %_3774~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p805 _p796 _p797 }) }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_5134
	mov rdi,r8
	call dlt
LB_5134:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_5135
	btr r12,4
	jmp LB_5136
LB_5135:
	bts r12,4
LB_5136:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_5141
	btr r12,2
	jmp LB_5142
LB_5141:
	bts r12,2
LB_5142:
	mov rsi,1
	bt r12,2
	jc LB_5139
	mov rsi,0
	bt r8,0
	jc LB_5139
	jmp LB_5140
LB_5139:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5140:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5137
	btr QWORD [rdi],0
	jmp LB_5138
LB_5137:
	bts QWORD [rdi],0
LB_5138:
	mov r8,r13
	bt r12,0
	jc LB_5145
	btr r12,2
	jmp LB_5146
LB_5145:
	bts r12,2
LB_5146:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5143
	btr QWORD [rdi],1
	jmp LB_5144
LB_5143:
	bts QWORD [rdi],1
LB_5144:
	mov r8,r14
	bt r12,1
	jc LB_5149
	btr r12,2
	jmp LB_5150
LB_5149:
	bts r12,2
LB_5150:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_5147
	btr QWORD [rdi],2
	jmp LB_5148
LB_5147:
	bts QWORD [rdi],2
LB_5148:
	mov r8,0
	bts r12,2
	ret
LB_5151:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5153
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5152
LB_5153:
	add rsp,8
	ret
LB_5155:
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
LB_5154:
	add rsp,80
	pop r14
LB_5152:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_5309
LB_5308:
	add r14,1
LB_5309:
	cmp r14,r10
	jge LB_5310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5308
	cmp al,10
	jz LB_5308
	cmp al,32
	jz LB_5308
LB_5310:
	add r14,3
	cmp r14,r10
	jg LB_5313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5313
	jmp LB_5314
LB_5313:
	jmp LB_5250
LB_5314:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_5265
LB_5264:
	add r14,1
LB_5265:
	cmp r14,r10
	jge LB_5266
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5264
	cmp al,10
	jz LB_5264
	cmp al,32
	jz LB_5264
LB_5266:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5267
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5268
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5268:
	jmp LB_5251
LB_5267:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_5271
LB_5270:
	add r14,1
LB_5271:
	cmp r14,r10
	jge LB_5272
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5270
	cmp al,10
	jz LB_5270
	cmp al,32
	jz LB_5270
LB_5272:
	add r14,1
	cmp r14,r10
	jg LB_5277
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5277
	jmp LB_5278
LB_5277:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5274
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5274:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5275
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5275:
	jmp LB_5251
LB_5278:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_5280
LB_5279:
	add r14,1
LB_5280:
	cmp r14,r10
	jge LB_5281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5279
	cmp al,10
	jz LB_5279
	cmp al,32
	jz LB_5279
LB_5281:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5282
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5283
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5283:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5284
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5284:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5285
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5285:
	jmp LB_5251
LB_5282:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_5288
LB_5287:
	add r14,1
LB_5288:
	cmp r14,r10
	jge LB_5289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5287
	cmp al,10
	jz LB_5287
	cmp al,32
	jz LB_5287
LB_5289:
	add r14,3
	cmp r14,r10
	jg LB_5296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5296
	jmp LB_5297
LB_5296:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5291
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5291:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5292
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5292:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5293
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5293:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5294
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5294:
	jmp LB_5251
LB_5297:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_5299
LB_5298:
	add r14,1
LB_5299:
	cmp r14,r10
	jge LB_5300
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5298
	cmp al,10
	jz LB_5298
	cmp al,32
	jz LB_5298
LB_5300:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5301
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_5302
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_5302:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5303
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5303:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5304
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5304:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5305
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5305:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5306
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5306:
	jmp LB_5251
LB_5301:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_5262
	btr r12,5
	jmp LB_5263
LB_5262:
	bts r12,5
LB_5263:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5260
	btr r12,4
	jmp LB_5261
LB_5260:
	bts r12,4
LB_5261:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5258
	btr r12,3
	jmp LB_5259
LB_5258:
	bts r12,3
LB_5259:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5256
	btr r12,2
	jmp LB_5257
LB_5256:
	bts r12,2
LB_5257:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5254
	btr r12,1
	jmp LB_5255
LB_5254:
	bts r12,1
LB_5255:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5252
	btr r12,0
	jmp LB_5253
LB_5252:
	bts r12,0
LB_5253:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_5247
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_5315
	btr r12,6
	jmp LB_5316
LB_5315:
	bts r12,6
LB_5316:
	mov r8,r11
	bt r12,5
	jc LB_5317
	btr r12,2
	jmp LB_5318
LB_5317:
	bts r12,2
LB_5318:
	mov r11,r14
	bt r12,1
	jc LB_5319
	btr r12,5
	jmp LB_5320
LB_5319:
	bts r12,5
LB_5320:
	mov r14,r9
	bt r12,3
	jc LB_5321
	btr r12,1
	jmp LB_5322
LB_5321:
	bts r12,1
LB_5322:
	mov r9,r13
	bt r12,0
	jc LB_5323
	btr r12,3
	jmp LB_5324
LB_5323:
	bts r12,3
LB_5324:
	mov r13,r11
	bt r12,5
	jc LB_5325
	btr r12,0
	jmp LB_5326
LB_5325:
	bts r12,0
LB_5326:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f870 {  } ⊢ %_3778 : %_3778
 ; {>  %_3777~2':_p797 %_3775~0':_p796 %_3776~1':_p796 }
; _f870 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_3779 : %_3779
 ; {>  %_3777~2':_p797 %_3778~°2◂{  }:_p805 %_3775~0':_p796 %_3776~1':_p796 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_3776 %_3779 } ⊢ %_3780 : %_3780
 ; {>  %_3777~2':_p797 %_3778~°2◂{  }:_p805 %_3775~0':_p796 %_3779~°1◂{  }:(_lst)◂(t1647'(0)) %_3776~1':_p796 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_3775 %_3780 } ⊢ %_3781 : %_3781
 ; {>  %_3777~2':_p797 %_3780~°0◂{ 1' °1◂{  } }:(_lst)◂(_p796) %_3778~°2◂{  }:_p805 %_3775~0':_p796 }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f845 %_3781 ⊢ %_3782 : %_3782
 ; {>  %_3777~2':_p797 %_3778~°2◂{  }:_p805 %_3781~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p796) }
; _f845 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_3778 %_3782 %_3777 } ⊢ %_3783 : %_3783
 ; {>  %_3777~2':_p797 %_3778~°2◂{  }:_p805 %_3782~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p796 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_3783
 ; {>  %_3783~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p805 _p796 _p797 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_5219
	mov rsi,0
	bt r10,0
	jc LB_5219
	jmp LB_5220
LB_5219:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_5220:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5217
	btr QWORD [rdi],0
	jmp LB_5218
LB_5217:
	bts QWORD [rdi],0
LB_5218:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_5229
	btr r12,5
	jmp LB_5230
LB_5229:
	bts r12,5
LB_5230:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5227
	btr QWORD [rdi],0
	jmp LB_5228
LB_5227:
	bts QWORD [rdi],0
LB_5228:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_5237
	btr r12,0
	jmp LB_5238
LB_5237:
	bts r12,0
LB_5238:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_5235
	btr QWORD [rdi],0
	jmp LB_5236
LB_5235:
	bts QWORD [rdi],0
LB_5236:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_5241
	mov rsi,0
	bt r13,0
	jc LB_5241
	jmp LB_5242
LB_5241:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_5242:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_5239
	btr QWORD [rdi],1
	jmp LB_5240
LB_5239:
	bts QWORD [rdi],1
LB_5240:
	mov rsi,1
	bt r12,5
	jc LB_5233
	mov rsi,0
	bt r11,0
	jc LB_5233
	jmp LB_5234
LB_5233:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_5234:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5231
	btr QWORD [rdi],1
	jmp LB_5232
LB_5231:
	bts QWORD [rdi],1
LB_5232:
	mov rsi,1
	bt r12,4
	jc LB_5225
	mov rsi,0
	bt r10,0
	jc LB_5225
	jmp LB_5226
LB_5225:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_5226:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_5223
	mov rsi,0
	bt r10,0
	jc LB_5223
	jmp LB_5224
LB_5223:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_5224:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5221
	btr QWORD [rdi],1
	jmp LB_5222
LB_5221:
	bts QWORD [rdi],1
LB_5222:
	mov r10,r8
	bt r12,2
	jc LB_5245
	btr r12,4
	jmp LB_5246
LB_5245:
	bts r12,4
LB_5246:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_5243
	btr QWORD [rdi],2
	jmp LB_5244
LB_5243:
	bts QWORD [rdi],2
LB_5244:
	mov r8,0
	bts r12,2
	ret
LB_5247:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5249
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5248
LB_5249:
	add rsp,8
	ret
LB_5251:
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
LB_5250:
	add rsp,96
	pop r14
LB_5248:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_5355
LB_5354:
	add r14,1
LB_5355:
	cmp r14,r10
	jge LB_5356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5354
	cmp al,10
	jz LB_5354
	cmp al,32
	jz LB_5354
LB_5356:
	add r14,2
	cmp r14,r10
	jg LB_5359
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5359
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_5359
	jmp LB_5360
LB_5359:
	jmp LB_5342
LB_5360:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_5349
LB_5348:
	add r14,1
LB_5349:
	cmp r14,r10
	jge LB_5350
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5348
	cmp al,10
	jz LB_5348
	cmp al,32
	jz LB_5348
LB_5350:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5351
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5352
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5352:
	jmp LB_5343
LB_5351:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5346
	btr r12,1
	jmp LB_5347
LB_5346:
	bts r12,1
LB_5347:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5344
	btr r12,0
	jmp LB_5345
LB_5344:
	bts r12,0
LB_5345:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5339
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_5361
	btr r12,3
	jmp LB_5362
LB_5361:
	bts r12,3
LB_5362:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_5365
	btr r12,4
	jmp LB_5366
LB_5365:
	bts r12,4
LB_5366:
	mov r13,r10
	bt r12,4
	jc LB_5363
	btr r12,0
	jmp LB_5364
LB_5363:
	bts r12,0
LB_5364:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_5369
	btr r12,4
	jmp LB_5370
LB_5369:
	bts r12,4
LB_5370:
	mov r14,r10
	bt r12,4
	jc LB_5367
	btr r12,1
	jmp LB_5368
LB_5367:
	bts r12,1
LB_5368:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_5373
	btr r12,4
	jmp LB_5374
LB_5373:
	bts r12,4
LB_5374:
	mov r8,r10
	bt r12,4
	jc LB_5371
	btr r12,2
	jmp LB_5372
LB_5371:
	bts r12,2
LB_5372:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3784 ⊢ %_3785 : %_3785
 ; {>  %_3784~{ 0' 1' 2' }:{ _p805 _p796 _p797 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_3785
 ; {>  %_3785~°0◂{ 0' 1' 2' }:(_opn)◂({ _p805 _p796 _p797 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_5329
	btr r12,4
	jmp LB_5330
LB_5329:
	bts r12,4
LB_5330:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5327
	btr QWORD [rdi],0
	jmp LB_5328
LB_5327:
	bts QWORD [rdi],0
LB_5328:
	mov r10,r14
	bt r12,1
	jc LB_5333
	btr r12,4
	jmp LB_5334
LB_5333:
	bts r12,4
LB_5334:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5331
	btr QWORD [rdi],1
	jmp LB_5332
LB_5331:
	bts QWORD [rdi],1
LB_5332:
	mov r10,r8
	bt r12,2
	jc LB_5337
	btr r12,4
	jmp LB_5338
LB_5337:
	bts r12,4
LB_5338:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_5335
	btr QWORD [rdi],2
	jmp LB_5336
LB_5335:
	bts QWORD [rdi],2
LB_5336:
	mov r8,0
	bts r12,2
	ret
LB_5339:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5341
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5340
LB_5341:
	add rsp,8
	ret
LB_5343:
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
LB_5342:
	add rsp,32
	pop r14
LB_5340:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_5402
LB_5401:
	add r14,1
LB_5402:
	cmp r14,r10
	jge LB_5403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5401
	cmp al,10
	jz LB_5401
	cmp al,32
	jz LB_5401
LB_5403:
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5404
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5392
LB_5404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_5407
LB_5406:
	add r14,1
LB_5407:
	cmp r14,r10
	jge LB_5408
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5406
	cmp al,10
	jz LB_5406
	cmp al,32
	jz LB_5406
LB_5408:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5409
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5410
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5410:
	jmp LB_5392
LB_5409:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_5413
LB_5412:
	add r14,1
LB_5413:
	cmp r14,r10
	jge LB_5414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5412
	cmp al,10
	jz LB_5412
	cmp al,32
	jz LB_5412
LB_5414:
	add r14,3
	cmp r14,r10
	jg LB_5419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5419
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5419
	jmp LB_5420
LB_5419:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5416
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5416:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5417
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5417:
	jmp LB_5392
LB_5420:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_5422
LB_5421:
	add r14,1
LB_5422:
	cmp r14,r10
	jge LB_5423
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5421
	cmp al,10
	jz LB_5421
	cmp al,32
	jz LB_5421
LB_5423:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5424
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5425
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5425:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5426
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5426:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5427
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5427:
	jmp LB_5392
LB_5424:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5399
	btr r12,3
	jmp LB_5400
LB_5399:
	bts r12,3
LB_5400:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5397
	btr r12,2
	jmp LB_5398
LB_5397:
	bts r12,2
LB_5398:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5395
	btr r12,1
	jmp LB_5396
LB_5395:
	bts r12,1
LB_5396:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5393
	btr r12,0
	jmp LB_5394
LB_5393:
	bts r12,0
LB_5394:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_5389
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_5429
	btr r12,4
	jmp LB_5430
LB_5429:
	bts r12,4
LB_5430:
	mov r8,r9
	bt r12,3
	jc LB_5431
	btr r12,2
	jmp LB_5432
LB_5431:
	bts r12,2
LB_5432:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f868 %_3786 ⊢ %_3789 : %_3789
 ; {>  %_3788~2':_p797 %_3787~1':_p796 %_3786~0':_p733 }
; _f868 0' ⊢ °0◂0'
; _some { %_3789 %_3787 %_3788 } ⊢ %_3790 : %_3790
 ; {>  %_3788~2':_p797 %_3787~1':_p796 %_3789~°0◂0':_p805 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_3790
 ; {>  %_3790~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p805 _p796 _p797 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_5379
	btr r12,4
	jmp LB_5380
LB_5379:
	bts r12,4
LB_5380:
	mov rsi,1
	bt r12,4
	jc LB_5377
	mov rsi,0
	bt r10,0
	jc LB_5377
	jmp LB_5378
LB_5377:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_5378:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5375
	btr QWORD [rdi],0
	jmp LB_5376
LB_5375:
	bts QWORD [rdi],0
LB_5376:
	mov r10,r14
	bt r12,1
	jc LB_5383
	btr r12,4
	jmp LB_5384
LB_5383:
	bts r12,4
LB_5384:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5381
	btr QWORD [rdi],1
	jmp LB_5382
LB_5381:
	bts QWORD [rdi],1
LB_5382:
	mov r10,r8
	bt r12,2
	jc LB_5387
	btr r12,4
	jmp LB_5388
LB_5387:
	bts r12,4
LB_5388:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_5385
	btr QWORD [rdi],2
	jmp LB_5386
LB_5385:
	bts QWORD [rdi],2
LB_5386:
	mov r8,0
	bts r12,2
	ret
LB_5389:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5391
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5390
LB_5391:
	add rsp,8
	ret
LB_5392:
	add rsp,64
	pop r14
LB_5390:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3623:
NS_E_RDI_3623:
NS_E_3623_ETR_TBL:
NS_E_3623_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "_^"
	jmp LB_5491
LB_5490:
	add r14,1
LB_5491:
	cmp r14,r10
	jge LB_5492
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5490
	cmp al,10
	jz LB_5490
	cmp al,32
	jz LB_5490
LB_5492:
	add r14,2
	cmp r14,r10
	jg LB_5495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_5495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_5495
	jmp LB_5496
LB_5495:
	jmp LB_5458
LB_5496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_5469
LB_5468:
	add r14,1
LB_5469:
	cmp r14,r10
	jge LB_5470
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5468
	cmp al,10
	jz LB_5468
	cmp al,32
	jz LB_5468
LB_5470:
	push r10
	call NS_E_3624_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5471
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5472:
	jmp LB_5459
LB_5471:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5478:
	jmp LB_5475
LB_5474:
	add r14,1
LB_5475:
	cmp r14,r10
	jge LB_5476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5474
	cmp al,10
	jz LB_5474
	cmp al,32
	jz LB_5474
LB_5476:
	push r10
	push rsi
	call NS_E_3625_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5477
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5479
	bts QWORD [rax],0
LB_5479:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5478
LB_5477:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_5481
LB_5480:
	add r14,1
LB_5481:
	cmp r14,r10
	jge LB_5482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5480
	cmp al,10
	jz LB_5480
	cmp al,32
	jz LB_5480
LB_5482:
	add r14,2
	cmp r14,r10
	jg LB_5488
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_5488
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_5488
	jmp LB_5489
LB_5488:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5484
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5484:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5485
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5485:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5486
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5486:
	jmp LB_5459
LB_5489:
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
	jc LB_5466
	btr r12,3
	jmp LB_5467
LB_5466:
	bts r12,3
LB_5467:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5464
	btr r12,2
	jmp LB_5465
LB_5464:
	bts r12,2
LB_5465:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5462
	btr r12,1
	jmp LB_5463
LB_5462:
	bts r12,1
LB_5463:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5460
	btr r12,0
	jmp LB_5461
LB_5460:
	bts r12,0
LB_5461:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_5455
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_5497
	btr r12,4
	jmp LB_5498
LB_5497:
	bts r12,4
LB_5498:
	mov r9,r8
	bt r12,2
	jc LB_5499
	btr r12,3
	jmp LB_5500
LB_5499:
	bts r12,3
LB_5500:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_5501
	btr r12,4
	jmp LB_5502
LB_5501:
	bts r12,4
LB_5502:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_5505
	btr r12,5
	jmp LB_5506
LB_5505:
	bts r12,5
LB_5506:
	mov r13,r11
	bt r12,5
	jc LB_5503
	btr r12,0
	jmp LB_5504
LB_5503:
	bts r12,0
LB_5504:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_5509
	btr r12,5
	jmp LB_5510
LB_5509:
	bts r12,5
LB_5510:
	mov r14,r11
	bt r12,5
	jc LB_5507
	btr r12,1
	jmp LB_5508
LB_5507:
	bts r12,1
LB_5508:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_5513
	btr r12,5
	jmp LB_5514
LB_5513:
	bts r12,5
LB_5514:
	mov r8,r11
	bt r12,5
	jc LB_5511
	btr r12,2
	jmp LB_5512
LB_5511:
	bts r12,2
LB_5512:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f872 { %_3791 %_3794 } ⊢ %_3795 : %_3795
 ; {>  %_3792~1':_p796 %_3794~3':(_lst)◂(_p806) %_3793~2':_p797 %_3791~0':_r64 }
; _f872 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_3795 %_3792 %_3793 } ⊢ %_3796 : %_3796
 ; {>  %_3795~°4◂{ 0' 3' }:_p805 %_3792~1':_p796 %_3793~2':_p797 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_3796
 ; {>  %_3796~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p805 _p796 _p797 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_5433
	btr r12,4
	jmp LB_5434
LB_5433:
	bts r12,4
LB_5434:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_5441
	btr r12,6
	jmp LB_5442
LB_5441:
	bts r12,6
LB_5442:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_5439
	btr QWORD [rdi],0
	jmp LB_5440
LB_5439:
	bts QWORD [rdi],0
LB_5440:
	mov rcx,r10
	bt r12,4
	jc LB_5445
	btr r12,6
	jmp LB_5446
LB_5445:
	bts r12,6
LB_5446:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_5443
	btr QWORD [rdi],1
	jmp LB_5444
LB_5443:
	bts QWORD [rdi],1
LB_5444:
	mov rsi,1
	bt r12,5
	jc LB_5437
	mov rsi,0
	bt r11,0
	jc LB_5437
	jmp LB_5438
LB_5437:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_5438:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5435
	btr QWORD [rdi],0
	jmp LB_5436
LB_5435:
	bts QWORD [rdi],0
LB_5436:
	mov r11,r14
	bt r12,1
	jc LB_5449
	btr r12,5
	jmp LB_5450
LB_5449:
	bts r12,5
LB_5450:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5447
	btr QWORD [rdi],1
	jmp LB_5448
LB_5447:
	bts QWORD [rdi],1
LB_5448:
	mov r11,r8
	bt r12,2
	jc LB_5453
	btr r12,5
	jmp LB_5454
LB_5453:
	bts r12,5
LB_5454:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_5451
	btr QWORD [rdi],2
	jmp LB_5452
LB_5451:
	bts QWORD [rdi],2
LB_5452:
	mov r8,0
	bts r12,2
	ret
LB_5455:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5457
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5456
LB_5457:
	add rsp,8
	ret
LB_5459:
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
LB_5458:
	add rsp,64
	pop r14
LB_5456:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_5544
LB_5543:
	add r14,1
LB_5544:
	cmp r14,r10
	jge LB_5545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5543
	cmp al,10
	jz LB_5543
	cmp al,32
	jz LB_5543
LB_5545:
	push r10
	call NS_E_2628_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5546
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5534
LB_5546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_5549
LB_5548:
	add r14,1
LB_5549:
	cmp r14,r10
	jge LB_5550
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5548
	cmp al,10
	jz LB_5548
	cmp al,32
	jz LB_5548
LB_5550:
	add r14,1
	cmp r14,r10
	jg LB_5554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5554
	jmp LB_5555
LB_5554:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5552
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5552:
	jmp LB_5534
LB_5555:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_5557
LB_5556:
	add r14,1
LB_5557:
	cmp r14,r10
	jge LB_5558
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5556
	cmp al,10
	jz LB_5556
	cmp al,32
	jz LB_5556
LB_5558:
	add r14,3
	cmp r14,r10
	jg LB_5563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5563
	jmp LB_5564
LB_5563:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5560
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5560:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5561
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5561:
	jmp LB_5534
LB_5564:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_5566
LB_5565:
	add r14,1
LB_5566:
	cmp r14,r10
	jge LB_5567
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5565
	cmp al,10
	jz LB_5565
	cmp al,32
	jz LB_5565
LB_5567:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5568
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5569
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5569:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5570
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5570:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5571:
	jmp LB_5534
LB_5568:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5541
	btr r12,3
	jmp LB_5542
LB_5541:
	bts r12,3
LB_5542:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5539
	btr r12,2
	jmp LB_5540
LB_5539:
	bts r12,2
LB_5540:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5537
	btr r12,1
	jmp LB_5538
LB_5537:
	bts r12,1
LB_5538:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5535
	btr r12,0
	jmp LB_5536
LB_5535:
	bts r12,0
LB_5536:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_5531
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_5573
	btr r12,4
	jmp LB_5574
LB_5573:
	bts r12,4
LB_5574:
	mov r14,r9
	bt r12,3
	jc LB_5575
	btr r12,1
	jmp LB_5576
LB_5575:
	bts r12,1
LB_5576:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f871 %_3797 ⊢ %_3799 : %_3799
 ; {>  %_3798~1':_p797 %_3797~0':_p799 }
; _f871 0' ⊢ °3◂0'
; _nil {  } ⊢ %_3800 : %_3800
 ; {>  %_3798~1':_p797 %_3799~°3◂0':_p805 }
; _nil {  } ⊢ °1◂{  }
; _f845 %_3800 ⊢ %_3801 : %_3801
 ; {>  %_3798~1':_p797 %_3799~°3◂0':_p805 %_3800~°1◂{  }:(_lst)◂(t1676'(0)) }
; _f845 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_3799 %_3801 %_3798 } ⊢ %_3802 : %_3802
 ; {>  %_3798~1':_p797 %_3799~°3◂0':_p805 %_3801~°0◂°1◂{  }:_p796 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_3802
 ; {>  %_3802~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p805 _p796 _p797 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5519
	btr r12,2
	jmp LB_5520
LB_5519:
	bts r12,2
LB_5520:
	mov rsi,1
	bt r12,2
	jc LB_5517
	mov rsi,0
	bt r8,0
	jc LB_5517
	jmp LB_5518
LB_5517:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5518:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5515
	btr QWORD [rdi],0
	jmp LB_5516
LB_5515:
	bts QWORD [rdi],0
LB_5516:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_5525
	mov rsi,0
	bt r8,0
	jc LB_5525
	jmp LB_5526
LB_5525:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5526:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_5523
	mov rsi,0
	bt r8,0
	jc LB_5523
	jmp LB_5524
LB_5523:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5524:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5521
	btr QWORD [rdi],1
	jmp LB_5522
LB_5521:
	bts QWORD [rdi],1
LB_5522:
	mov r8,r14
	bt r12,1
	jc LB_5529
	btr r12,2
	jmp LB_5530
LB_5529:
	bts r12,2
LB_5530:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_5527
	btr QWORD [rdi],2
	jmp LB_5528
LB_5527:
	bts QWORD [rdi],2
LB_5528:
	mov r8,0
	bts r12,2
	ret
LB_5531:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5533
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5532
LB_5533:
	add rsp,8
	ret
LB_5534:
	add rsp,64
	pop r14
LB_5532:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3624:
NS_E_RDI_3624:
NS_E_3624_ETR_TBL:
NS_E_3624_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "_"
	jmp LB_5630
LB_5629:
	add r14,1
LB_5630:
	cmp r14,r10
	jge LB_5631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5629
	cmp al,10
	jz LB_5629
	cmp al,32
	jz LB_5629
LB_5631:
	add r14,1
	cmp r14,r10
	jg LB_5634
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5634
	jmp LB_5635
LB_5634:
	jmp LB_5606
LB_5635:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_5615
LB_5614:
	add r14,1
LB_5615:
	cmp r14,r10
	jge LB_5616
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5614
	cmp al,10
	jz LB_5614
	cmp al,32
	jz LB_5614
LB_5616:
	add r14,3
	cmp r14,r10
	jg LB_5620
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5620
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5620
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5620
	jmp LB_5621
LB_5620:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5618
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5618:
	jmp LB_5607
LB_5621:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_5623
LB_5622:
	add r14,1
LB_5623:
	cmp r14,r10
	jge LB_5624
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5622
	cmp al,10
	jz LB_5622
	cmp al,32
	jz LB_5622
LB_5624:
	push r10
	call NS_E_3026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5625
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5626
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5626:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5627
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5627:
	jmp LB_5607
LB_5625:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5612
	btr r12,2
	jmp LB_5613
LB_5612:
	bts r12,2
LB_5613:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5610
	btr r12,1
	jmp LB_5611
LB_5610:
	bts r12,1
LB_5611:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5608
	btr r12,0
	jmp LB_5609
LB_5608:
	bts r12,0
LB_5609:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5603
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_5636
	btr r12,3
	jmp LB_5637
LB_5636:
	bts r12,3
LB_5637:
	mov r13,r8
	bt r12,2
	jc LB_5638
	btr r12,0
	jmp LB_5639
LB_5638:
	bts r12,0
LB_5639:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_3804 : %_3804
 ; {>  %_3803~0':_p795 }
; 	» 0xr0 _ ⊢ 1' : %_3804
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_3805 : %_3805
 ; {>  %_3803~0':_p795 %_3804~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f845 %_3805 ⊢ %_3806 : %_3806
 ; {>  %_3803~0':_p795 %_3804~1':_r64 %_3805~°1◂{  }:(_lst)◂(t1684'(0)) }
; _f845 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_3807 : %_3807
 ; {>  %_3803~0':_p795 %_3804~1':_r64 %_3806~°0◂°1◂{  }:_p796 }
; _nil {  } ⊢ °1◂{  }
; _f848 %_3803 ⊢ %_3808 : %_3808
 ; {>  %_3803~0':_p795 %_3807~°1◂{  }:(_lst)◂(t1688'(0)) %_3804~1':_r64 %_3806~°0◂°1◂{  }:_p796 }
; _f848 0' ⊢ °1◂0'
; _cns { %_3808 %_3807 } ⊢ %_3809 : %_3809
 ; {>  %_3808~°1◂0':_p797 %_3807~°1◂{  }:(_lst)◂(t1688'(0)) %_3804~1':_r64 %_3806~°0◂°1◂{  }:_p796 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f847 %_3809 ⊢ %_3810 : %_3810
 ; {>  %_3809~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p797) %_3804~1':_r64 %_3806~°0◂°1◂{  }:_p796 }
; _f847 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_3804 %_3806 %_3810 } ⊢ %_3811 : %_3811
 ; {>  %_3804~1':_r64 %_3806~°0◂°1◂{  }:_p796 %_3810~°0◂°0◂{ °1◂0' °1◂{  } }:_p797 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_3811
 ; {>  %_3811~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p796 _p797 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_5579
	btr r12,2
	jmp LB_5580
LB_5579:
	bts r12,2
LB_5580:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5577
	btr QWORD [rdi],0
	jmp LB_5578
LB_5577:
	bts QWORD [rdi],0
LB_5578:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_5585
	mov rsi,0
	bt r8,0
	jc LB_5585
	jmp LB_5586
LB_5585:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5586:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_5583
	mov rsi,0
	bt r8,0
	jc LB_5583
	jmp LB_5584
LB_5583:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5584:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5581
	btr QWORD [rdi],1
	jmp LB_5582
LB_5581:
	bts QWORD [rdi],1
LB_5582:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_5597
	btr r12,1
	jmp LB_5598
LB_5597:
	bts r12,1
LB_5598:
	mov rsi,1
	bt r12,1
	jc LB_5595
	mov rsi,0
	bt r14,0
	jc LB_5595
	jmp LB_5596
LB_5595:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5596:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5593
	btr QWORD [rdi],0
	jmp LB_5594
LB_5593:
	bts QWORD [rdi],0
LB_5594:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_5601
	mov rsi,0
	bt r14,0
	jc LB_5601
	jmp LB_5602
LB_5601:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5602:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5599
	btr QWORD [rdi],1
	jmp LB_5600
LB_5599:
	bts QWORD [rdi],1
LB_5600:
	mov rsi,1
	bt r12,2
	jc LB_5591
	mov rsi,0
	bt r8,0
	jc LB_5591
	jmp LB_5592
LB_5591:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5592:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_5589
	mov rsi,0
	bt r8,0
	jc LB_5589
	jmp LB_5590
LB_5589:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_5590:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_5587
	btr QWORD [rdi],2
	jmp LB_5588
LB_5587:
	bts QWORD [rdi],2
LB_5588:
	mov r8,0
	bts r12,2
	ret
LB_5603:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5605
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5604
LB_5605:
	add rsp,8
	ret
LB_5607:
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
LB_5606:
	add rsp,48
	pop r14
LB_5604:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src
	jmp LB_5693
LB_5692:
	add r14,1
LB_5693:
	cmp r14,r10
	jge LB_5694
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5692
	cmp al,10
	jz LB_5692
	cmp al,32
	jz LB_5692
LB_5694:
	push r10
	call NS_E_2760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5695
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5681
LB_5695:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_5698
LB_5697:
	add r14,1
LB_5698:
	cmp r14,r10
	jge LB_5699
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5697
	cmp al,10
	jz LB_5697
	cmp al,32
	jz LB_5697
LB_5699:
	push r10
	call NS_E_2759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5700
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5701
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5701:
	jmp LB_5681
LB_5700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_5704
LB_5703:
	add r14,1
LB_5704:
	cmp r14,r10
	jge LB_5705
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5703
	cmp al,10
	jz LB_5703
	cmp al,32
	jz LB_5703
LB_5705:
	add r14,3
	cmp r14,r10
	jg LB_5710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5710
	jmp LB_5711
LB_5710:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5708:
	jmp LB_5681
LB_5711:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_5713
LB_5712:
	add r14,1
LB_5713:
	cmp r14,r10
	jge LB_5714
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5712
	cmp al,10
	jz LB_5712
	cmp al,32
	jz LB_5712
LB_5714:
	push r10
	call NS_E_3026_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5715
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5716
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5716:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5717
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5717:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5718
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5718:
	jmp LB_5681
LB_5715:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_5721
LB_5720:
	add r14,1
LB_5721:
	cmp r14,r10
	jge LB_5722
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5720
	cmp al,10
	jz LB_5720
	cmp al,32
	jz LB_5720
LB_5722:
	push r10
	call NS_E_3025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5723
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5724
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5724:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5725
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5725:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5726
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5726:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5727
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5727:
	jmp LB_5681
LB_5723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5690
	btr r12,4
	jmp LB_5691
LB_5690:
	bts r12,4
LB_5691:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5688
	btr r12,3
	jmp LB_5689
LB_5688:
	bts r12,3
LB_5689:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5686
	btr r12,2
	jmp LB_5687
LB_5686:
	bts r12,2
LB_5687:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5684
	btr r12,1
	jmp LB_5685
LB_5684:
	bts r12,1
LB_5685:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5682
	btr r12,0
	jmp LB_5683
LB_5682:
	bts r12,0
LB_5683:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_5678
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_5729
	btr r12,5
	jmp LB_5730
LB_5729:
	bts r12,5
LB_5730:
	mov r9,r10
	bt r12,4
	jc LB_5731
	btr r12,3
	jmp LB_5732
LB_5731:
	bts r12,3
LB_5732:
	mov r10,r8
	bt r12,2
	jc LB_5733
	btr r12,4
	jmp LB_5734
LB_5733:
	bts r12,4
LB_5734:
	mov r8,r11
	bt r12,5
	jc LB_5735
	btr r12,2
	jmp LB_5736
LB_5735:
	bts r12,2
LB_5736:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f846 %_3812 ⊢ %_3816 : %_3816
 ; {>  %_3815~3':(_lst)◂(_p797) %_3812~0':_p794 %_3813~1':(_lst)◂(_p796) %_3814~2':_p795 }
; _f846 0' ⊢ °1◂0'
; _f848 %_3814 ⊢ %_3817 : %_3817
 ; {>  %_3815~3':(_lst)◂(_p797) %_3816~°1◂0':_p796 %_3813~1':(_lst)◂(_p796) %_3814~2':_p795 }
; _f848 2' ⊢ °1◂2'
; _cns { %_3816 %_3813 } ⊢ %_3818 : %_3818
 ; {>  %_3815~3':(_lst)◂(_p797) %_3817~°1◂2':_p797 %_3816~°1◂0':_p796 %_3813~1':(_lst)◂(_p796) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_3817 %_3815 } ⊢ %_3819 : %_3819
 ; {>  %_3815~3':(_lst)◂(_p797) %_3818~°0◂{ °1◂0' 1' }:(_lst)◂(_p796) %_3817~°1◂2':_p797 }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f845 %_3818 ⊢ %_3820 : %_3820
 ; {>  %_3818~°0◂{ °1◂0' 1' }:(_lst)◂(_p796) %_3819~°0◂{ °1◂2' 3' }:(_lst)◂(_p797) }
; _f845 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f847 %_3819 ⊢ %_3821 : %_3821
 ; {>  %_3819~°0◂{ °1◂2' 3' }:(_lst)◂(_p797) %_3820~°0◂°0◂{ °1◂0' 1' }:_p796 }
; _f847 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_3822 : %_3822
 ; {>  %_3821~°0◂°0◂{ °1◂2' 3' }:_p797 %_3820~°0◂°0◂{ °1◂0' 1' }:_p796 }
; 	» 0xr1 _ ⊢ 4' : %_3822
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_3822 %_3820 %_3821 } ⊢ %_3823 : %_3823
 ; {>  %_3822~4':_r64 %_3821~°0◂°0◂{ °1◂2' 3' }:_p797 %_3820~°0◂°0◂{ °1◂0' 1' }:_p796 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_3823
 ; {>  %_3823~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p796 _p797 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_5640
	btr r12,5
	jmp LB_5641
LB_5640:
	bts r12,5
LB_5641:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_5644
	btr r12,6
	jmp LB_5645
LB_5644:
	bts r12,6
LB_5645:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_5642
	btr QWORD [rdi],0
	jmp LB_5643
LB_5642:
	bts QWORD [rdi],0
LB_5643:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_5656
	btr r12,4
	jmp LB_5657
LB_5656:
	bts r12,4
LB_5657:
	mov rsi,1
	bt r12,4
	jc LB_5654
	mov rsi,0
	bt r10,0
	jc LB_5654
	jmp LB_5655
LB_5654:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_5655:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5652
	btr QWORD [rdi],0
	jmp LB_5653
LB_5652:
	bts QWORD [rdi],0
LB_5653:
	mov r10,r14
	bt r12,1
	jc LB_5660
	btr r12,4
	jmp LB_5661
LB_5660:
	bts r12,4
LB_5661:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5658
	btr QWORD [rdi],1
	jmp LB_5659
LB_5658:
	bts QWORD [rdi],1
LB_5659:
	mov rsi,1
	bt r12,6
	jc LB_5650
	mov rsi,0
	bt rcx,0
	jc LB_5650
	jmp LB_5651
LB_5650:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_5651:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_5648
	mov rsi,0
	bt rcx,0
	jc LB_5648
	jmp LB_5649
LB_5648:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_5649:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_5646
	btr QWORD [rdi],1
	jmp LB_5647
LB_5646:
	bts QWORD [rdi],1
LB_5647:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_5672
	btr r12,0
	jmp LB_5673
LB_5672:
	bts r12,0
LB_5673:
	mov rsi,1
	bt r12,0
	jc LB_5670
	mov rsi,0
	bt r13,0
	jc LB_5670
	jmp LB_5671
LB_5670:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_5671:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_5668
	btr QWORD [rdi],0
	jmp LB_5669
LB_5668:
	bts QWORD [rdi],0
LB_5669:
	mov r13,r11
	bt r12,5
	jc LB_5676
	btr r12,0
	jmp LB_5677
LB_5676:
	bts r12,0
LB_5677:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_5674
	btr QWORD [rdi],1
	jmp LB_5675
LB_5674:
	bts QWORD [rdi],1
LB_5675:
	mov rsi,1
	bt r12,6
	jc LB_5666
	mov rsi,0
	bt rcx,0
	jc LB_5666
	jmp LB_5667
LB_5666:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_5667:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_5664
	mov rsi,0
	bt rcx,0
	jc LB_5664
	jmp LB_5665
LB_5664:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_5665:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_5662
	btr QWORD [rdi],2
	jmp LB_5663
LB_5662:
	bts QWORD [rdi],2
LB_5663:
	mov r8,0
	bts r12,2
	ret
LB_5678:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5680
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5679
LB_5680:
	add rsp,8
	ret
LB_5681:
	add rsp,80
	pop r14
LB_5679:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3625:
NS_E_RDI_3625:
NS_E_3625_ETR_TBL:
NS_E_3625_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_5748
LB_5747:
	add r14,1
LB_5748:
	cmp r14,r10
	jge LB_5749
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5747
	cmp al,10
	jz LB_5747
	cmp al,32
	jz LB_5747
LB_5749:
	push r10
	call NS_E_3627_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5750
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5744
LB_5750:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5745
	btr r12,0
	jmp LB_5746
LB_5745:
	bts r12,0
LB_5746:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5741
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f873 %_3824 ⊢ %_3825 : %_3825
 ; {>  %_3824~0':_stg }
; _f873 0' ⊢ °0◂0'
; _some %_3825 ⊢ %_3826 : %_3826
 ; {>  %_3825~°0◂0':_p806 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3826
 ; {>  %_3826~°0◂°0◂0':(_opn)◂(_p806) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5739
	btr r12,3
	jmp LB_5740
LB_5739:
	bts r12,3
LB_5740:
	mov rsi,1
	bt r12,3
	jc LB_5737
	mov rsi,0
	bt r9,0
	jc LB_5737
	jmp LB_5738
LB_5737:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5738:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5741:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5743
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5742
LB_5743:
	add rsp,8
	ret
LB_5744:
	add rsp,16
	pop r14
LB_5742:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_5763
LB_5762:
	add r14,1
LB_5763:
	cmp r14,r10
	jge LB_5764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5762
	cmp al,10
	jz LB_5762
	cmp al,32
	jz LB_5762
LB_5764:
	push r10
	call NS_E_178_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5765
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5759
LB_5765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5760
	btr r12,0
	jmp LB_5761
LB_5760:
	bts r12,0
LB_5761:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5756
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f873 %_3827 ⊢ %_3828 : %_3828
 ; {>  %_3827~0':_stg }
; _f873 0' ⊢ °0◂0'
; _some %_3828 ⊢ %_3829 : %_3829
 ; {>  %_3828~°0◂0':_p806 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3829
 ; {>  %_3829~°0◂°0◂0':(_opn)◂(_p806) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5754
	btr r12,3
	jmp LB_5755
LB_5754:
	bts r12,3
LB_5755:
	mov rsi,1
	bt r12,3
	jc LB_5752
	mov rsi,0
	bt r9,0
	jc LB_5752
	jmp LB_5753
LB_5752:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5753:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5756:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5758
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5757
LB_5758:
	add rsp,8
	ret
LB_5759:
	add rsp,16
	pop r14
LB_5757:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_5778
LB_5777:
	add r14,1
LB_5778:
	cmp r14,r10
	jge LB_5779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5777
	cmp al,10
	jz LB_5777
	cmp al,32
	jz LB_5777
LB_5779:
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5780
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5774
LB_5780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5775
	btr r12,0
	jmp LB_5776
LB_5775:
	bts r12,0
LB_5776:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5771
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f874 %_3830 ⊢ %_3831 : %_3831
 ; {>  %_3830~0':_p733 }
; _f874 0' ⊢ °1◂0'
; _some %_3831 ⊢ %_3832 : %_3832
 ; {>  %_3831~°1◂0':_p806 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3832
 ; {>  %_3832~°0◂°1◂0':(_opn)◂(_p806) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5769
	btr r12,3
	jmp LB_5770
LB_5769:
	bts r12,3
LB_5770:
	mov rsi,1
	bt r12,3
	jc LB_5767
	mov rsi,0
	bt r9,0
	jc LB_5767
	jmp LB_5768
LB_5767:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5768:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5771:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5773
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5772
LB_5773:
	add rsp,8
	ret
LB_5774:
	add rsp,16
	pop r14
LB_5772:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_5799
LB_5798:
	add r14,1
LB_5799:
	cmp r14,r10
	jge LB_5800
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5798
	cmp al,10
	jz LB_5798
	cmp al,32
	jz LB_5798
LB_5800:
	push r10
	call NS_E_3626_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5801
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5795
LB_5801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5796
	btr r12,0
	jmp LB_5797
LB_5796:
	bts r12,0
LB_5797:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5792
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_5803
	btr r12,2
	jmp LB_5804
LB_5803:
	bts r12,2
LB_5804:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_5807
	btr r12,3
	jmp LB_5808
LB_5807:
	bts r12,3
LB_5808:
	mov r13,r9
	bt r12,3
	jc LB_5805
	btr r12,0
	jmp LB_5806
LB_5805:
	bts r12,0
LB_5806:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_5811
	btr r12,3
	jmp LB_5812
LB_5811:
	bts r12,3
LB_5812:
	mov r14,r9
	bt r12,3
	jc LB_5809
	btr r12,1
	jmp LB_5810
LB_5809:
	bts r12,1
LB_5810:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f875 %_3833 ⊢ %_3834 : %_3834
 ; {>  %_3833~{ 0' 1' }:{ _p807 _r64 } }
; _f875 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_3834 ⊢ %_3835 : %_3835
 ; {>  %_3834~°2◂{ 0' 1' }:_p806 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_3835
 ; {>  %_3835~°0◂°2◂{ 0' 1' }:(_opn)◂(_p806) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5786
	btr r12,2
	jmp LB_5787
LB_5786:
	bts r12,2
LB_5787:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5784
	btr QWORD [rdi],0
	jmp LB_5785
LB_5784:
	bts QWORD [rdi],0
LB_5785:
	mov r8,r14
	bt r12,1
	jc LB_5790
	btr r12,2
	jmp LB_5791
LB_5790:
	bts r12,2
LB_5791:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5788
	btr QWORD [rdi],1
	jmp LB_5789
LB_5788:
	bts QWORD [rdi],1
LB_5789:
	mov rsi,1
	bt r12,3
	jc LB_5782
	mov rsi,0
	bt r9,0
	jc LB_5782
	jmp LB_5783
LB_5782:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5783:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5792:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5794
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5793
LB_5794:
	add rsp,8
	ret
LB_5795:
	add rsp,16
	pop r14
LB_5793:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3626:
NS_E_RDI_3626:
NS_E_3626_ETR_TBL:
NS_E_3626_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_57_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5832
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5824
LB_5832:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_5840
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_5840
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_5840
	jmp LB_5841
LB_5840:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5838
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5838:
	jmp LB_5824
LB_5841:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5827
	btr r12,1
	jmp LB_5828
LB_5827:
	bts r12,1
LB_5828:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5825
	btr r12,0
	jmp LB_5826
LB_5825:
	bts r12,0
LB_5826:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5821
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f877 {  } ⊢ %_3837 : %_3837
 ; {>  %_3836~0':_r64 }
; _f877 {  } ⊢ °1◂{  }
; _some { %_3837 %_3836 } ⊢ %_3838 : %_3838
 ; {>  %_3837~°1◂{  }:_p807 %_3836~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_3838
 ; {>  %_3838~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p807 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_5815
	mov rsi,0
	bt r14,0
	jc LB_5815
	jmp LB_5816
LB_5815:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5816:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5813
	btr QWORD [rdi],0
	jmp LB_5814
LB_5813:
	bts QWORD [rdi],0
LB_5814:
	mov r14,r13
	bt r12,0
	jc LB_5819
	btr r12,1
	jmp LB_5820
LB_5819:
	bts r12,1
LB_5820:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5817
	btr QWORD [rdi],1
	jmp LB_5818
LB_5817:
	bts QWORD [rdi],1
LB_5818:
	mov r8,0
	bts r12,2
	ret
LB_5821:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5823
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5822
LB_5823:
	add rsp,8
	ret
LB_5824:
	add rsp,32
	pop r14
LB_5822:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_57_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5861
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5853
LB_5861:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_5869
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_5869
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_5869
	jmp LB_5870
LB_5869:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5867
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5867:
	jmp LB_5853
LB_5870:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5856
	btr r12,1
	jmp LB_5857
LB_5856:
	bts r12,1
LB_5857:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5854
	btr r12,0
	jmp LB_5855
LB_5854:
	bts r12,0
LB_5855:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5850
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f878 {  } ⊢ %_3840 : %_3840
 ; {>  %_3839~0':_r64 }
; _f878 {  } ⊢ °2◂{  }
; _some { %_3840 %_3839 } ⊢ %_3841 : %_3841
 ; {>  %_3840~°2◂{  }:_p807 %_3839~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_3841
 ; {>  %_3841~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p807 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_5844
	mov rsi,0
	bt r14,0
	jc LB_5844
	jmp LB_5845
LB_5844:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5845:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5842
	btr QWORD [rdi],0
	jmp LB_5843
LB_5842:
	bts QWORD [rdi],0
LB_5843:
	mov r14,r13
	bt r12,0
	jc LB_5848
	btr r12,1
	jmp LB_5849
LB_5848:
	bts r12,1
LB_5849:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5846
	btr QWORD [rdi],1
	jmp LB_5847
LB_5846:
	bts QWORD [rdi],1
LB_5847:
	mov r8,0
	bts r12,2
	ret
LB_5850:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5852
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5851
LB_5852:
	add rsp,8
	ret
LB_5853:
	add rsp,32
	pop r14
LB_5851:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_57_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5890
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5882
LB_5890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_5898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_5898
	jmp LB_5899
LB_5898:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5896
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5896:
	jmp LB_5882
LB_5899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5885
	btr r12,1
	jmp LB_5886
LB_5885:
	bts r12,1
LB_5886:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5883
	btr r12,0
	jmp LB_5884
LB_5883:
	bts r12,0
LB_5884:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5879
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f876 {  } ⊢ %_3843 : %_3843
 ; {>  %_3842~0':_r64 }
; _f876 {  } ⊢ °0◂{  }
; _some { %_3843 %_3842 } ⊢ %_3844 : %_3844
 ; {>  %_3843~°0◂{  }:_p807 %_3842~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_3844
 ; {>  %_3844~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p807 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_5873
	mov rsi,0
	bt r14,0
	jc LB_5873
	jmp LB_5874
LB_5873:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5874:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5871
	btr QWORD [rdi],0
	jmp LB_5872
LB_5871:
	bts QWORD [rdi],0
LB_5872:
	mov r14,r13
	bt r12,0
	jc LB_5877
	btr r12,1
	jmp LB_5878
LB_5877:
	bts r12,1
LB_5878:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5875
	btr QWORD [rdi],1
	jmp LB_5876
LB_5875:
	bts QWORD [rdi],1
LB_5876:
	mov r8,0
	bts r12,2
	ret
LB_5879:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5881
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5880
LB_5881:
	add rsp,8
	ret
LB_5882:
	add rsp,32
	pop r14
LB_5880:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3627:
NS_E_RDI_3627:
NS_E_3627_ETR_TBL:
NS_E_3627_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_5915
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_5915
	jmp LB_5916
LB_5915:
	jmp LB_5905
LB_5916:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_3628_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5920
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5921:
	jmp LB_5905
LB_5920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5908
	btr r12,1
	jmp LB_5909
LB_5908:
	bts r12,1
LB_5909:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5906
	btr r12,0
	jmp LB_5907
LB_5906:
	bts r12,0
LB_5907:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5902
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5923
	btr r12,2
	jmp LB_5924
LB_5923:
	bts r12,2
LB_5924:
	mov r13,r14
	bt r12,1
	jc LB_5925
	btr r12,0
	jmp LB_5926
LB_5925:
	bts r12,0
LB_5926:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f168 %_3845 ⊢ %_3846 : %_3846
 ; {>  %_3845~0':(_lst)◂(_r64) }
; _f168 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_168
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_3846 ⊢ %_3847 : %_3847
 ; {>  %_3846~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3847
 ; {>  %_3847~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5900
	btr r12,3
	jmp LB_5901
LB_5900:
	bts r12,3
LB_5901:
	mov r8,0
	bts r12,2
	ret
LB_5902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5904
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5903
LB_5904:
	add rsp,8
	ret
LB_5905:
	add rsp,32
	pop r14
LB_5903:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3628:
NS_E_RDI_3628:
NS_E_3628_ETR_TBL:
NS_E_3628_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_5948
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_5948
	jmp LB_5949
LB_5948:
	jmp LB_5940
LB_5949:
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
	jc LB_5941
	btr r12,0
	jmp LB_5942
LB_5941:
	bts r12,0
LB_5942:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5937
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_3848 : %_3848
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_3848
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_3849 : %_3849
 ; {>  %_3848~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_3848 %_3849 } ⊢ %_3850 : %_3850
 ; {>  %_3849~°1◂{  }:(_lst)◂(t1745'(0)) %_3848~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_3850 ⊢ %_3851 : %_3851
 ; {>  %_3850~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_3851
 ; {>  %_3851~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_5931
	btr r12,1
	jmp LB_5932
LB_5931:
	bts r12,1
LB_5932:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5929
	btr QWORD [rdi],0
	jmp LB_5930
LB_5929:
	bts QWORD [rdi],0
LB_5930:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_5935
	mov rsi,0
	bt r14,0
	jc LB_5935
	jmp LB_5936
LB_5935:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5936:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5933
	btr QWORD [rdi],1
	jmp LB_5934
LB_5933:
	bts QWORD [rdi],1
LB_5934:
	mov rsi,1
	bt r12,3
	jc LB_5927
	mov rsi,0
	bt r9,0
	jc LB_5927
	jmp LB_5928
LB_5927:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5928:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5937:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5939
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5938
LB_5939:
	add rsp,8
	ret
LB_5940:
	add rsp,16
	pop r14
LB_5938:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5971
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5963
LB_5971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_3628_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5976
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5977:
	jmp LB_5963
LB_5976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5966
	btr r12,1
	jmp LB_5967
LB_5966:
	bts r12,1
LB_5967:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5964
	btr r12,0
	jmp LB_5965
LB_5964:
	bts r12,0
LB_5965:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5960
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3852 %_3853 } ⊢ %_3854 : %_3854
 ; {>  %_3853~1':(_lst)◂(_r64) %_3852~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3854 ⊢ %_3855 : %_3855
 ; {>  %_3854~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3855
 ; {>  %_3855~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_5954
	btr r12,2
	jmp LB_5955
LB_5954:
	bts r12,2
LB_5955:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5952
	btr QWORD [rdi],0
	jmp LB_5953
LB_5952:
	bts QWORD [rdi],0
LB_5953:
	mov r8,r14
	bt r12,1
	jc LB_5958
	btr r12,2
	jmp LB_5959
LB_5958:
	bts r12,2
LB_5959:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5956
	btr QWORD [rdi],1
	jmp LB_5957
LB_5956:
	bts QWORD [rdi],1
LB_5957:
	mov rsi,1
	bt r12,3
	jc LB_5950
	mov rsi,0
	bt r9,0
	jc LB_5950
	jmp LB_5951
LB_5950:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5951:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5960:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5962
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5961
LB_5962:
	add rsp,8
	ret
LB_5963:
	add rsp,32
	pop r14
LB_5961:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3629:
NS_E_RDI_3629:
NS_E_3629_ETR_TBL:
NS_E_3629_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_6017
LB_6016:
	add r14,1
LB_6017:
	cmp r14,r10
	jge LB_6018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6016
	cmp al,10
	jz LB_6016
	cmp al,32
	jz LB_6016
LB_6018:
	add r14,4
	cmp r14,r10
	jg LB_6021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_6021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_6021
	jmp LB_6022
LB_6021:
	jmp LB_5995
LB_6022:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_6004
LB_6003:
	add r14,1
LB_6004:
	cmp r14,r10
	jge LB_6005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6003
	cmp al,10
	jz LB_6003
	cmp al,32
	jz LB_6003
LB_6005:
	push r10
	call NS_E_3630_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6006
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6007
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6007:
	jmp LB_5996
LB_6006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_6010
LB_6009:
	add r14,1
LB_6010:
	cmp r14,r10
	jge LB_6011
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6009
	cmp al,10
	jz LB_6009
	cmp al,32
	jz LB_6009
LB_6011:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6012
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6013
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6013:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6014
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6014:
	jmp LB_5996
LB_6012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6001
	btr r12,2
	jmp LB_6002
LB_6001:
	bts r12,2
LB_6002:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5999
	btr r12,1
	jmp LB_6000
LB_5999:
	bts r12,1
LB_6000:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5997
	btr r12,0
	jmp LB_5998
LB_5997:
	bts r12,0
LB_5998:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5992
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6023
	btr r12,3
	jmp LB_6024
LB_6023:
	bts r12,3
LB_6024:
	mov r14,r8
	bt r12,2
	jc LB_6025
	btr r12,1
	jmp LB_6026
LB_6025:
	bts r12,1
LB_6026:
	mov r8,r13
	bt r12,0
	jc LB_6027
	btr r12,2
	jmp LB_6028
LB_6027:
	bts r12,2
LB_6028:
	mov r13,r9
	bt r12,3
	jc LB_6029
	btr r12,0
	jmp LB_6030
LB_6029:
	bts r12,0
LB_6030:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3858 : %_3858
 ; {>  %_3856~0':(_lst)◂(_p803) %_3857~1':_p800 }
; _nil {  } ⊢ °1◂{  }
; _f863 %_3857 ⊢ %_3859 : %_3859
 ; {>  %_3858~°1◂{  }:(_lst)◂(t1760'(0)) %_3856~0':(_lst)◂(_p803) %_3857~1':_p800 }
; _f863 1' ⊢ °1◂1'
; _f861 { %_3858 %_3859 } ⊢ %_3860 : %_3860
 ; {>  %_3859~°1◂1':_p802 %_3858~°1◂{  }:(_lst)◂(t1760'(0)) %_3856~0':(_lst)◂(_p803) }
; _f861 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_3860 ⊢ %_3861 : %_3861
 ; {>  %_3860~°1◂{ °1◂{  } °1◂1' }:_p801 %_3856~0':(_lst)◂(_p803) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_3861
 ; {>  %_3861~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p801) %_3856~0':(_lst)◂(_p803) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_5979
	mov rdi,r13
	call dlt
LB_5979:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_5984
	mov rsi,0
	bt r13,0
	jc LB_5984
	jmp LB_5985
LB_5984:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_5985:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_5982
	btr QWORD [rdi],0
	jmp LB_5983
LB_5982:
	bts QWORD [rdi],0
LB_5983:
	mov r13,r14
	bt r12,1
	jc LB_5990
	btr r12,0
	jmp LB_5991
LB_5990:
	bts r12,0
LB_5991:
	mov rsi,1
	bt r12,0
	jc LB_5988
	mov rsi,0
	bt r13,0
	jc LB_5988
	jmp LB_5989
LB_5988:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_5989:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_5986
	btr QWORD [rdi],1
	jmp LB_5987
LB_5986:
	bts QWORD [rdi],1
LB_5987:
	mov rsi,1
	bt r12,3
	jc LB_5980
	mov rsi,0
	bt r9,0
	jc LB_5980
	jmp LB_5981
LB_5980:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5981:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5992:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5994
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_5993
LB_5994:
	add rsp,8
	ret
LB_5996:
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
LB_5995:
	add rsp,48
	pop r14
LB_5993:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_6061
LB_6060:
	add r14,1
LB_6061:
	cmp r14,r10
	jge LB_6062
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6060
	cmp al,10
	jz LB_6060
	cmp al,32
	jz LB_6060
LB_6062:
	add r14,3
	cmp r14,r10
	jg LB_6065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6065
	jmp LB_6066
LB_6065:
	jmp LB_6051
LB_6066:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_6068
LB_6067:
	add r14,1
LB_6068:
	cmp r14,r10
	jge LB_6069
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6067
	cmp al,10
	jz LB_6067
	cmp al,32
	jz LB_6067
LB_6069:
	push r10
	call NS_E_3630_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6070
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6071
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6071:
	jmp LB_6051
LB_6070:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_6074
LB_6073:
	add r14,1
LB_6074:
	cmp r14,r10
	jge LB_6075
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6073
	cmp al,10
	jz LB_6073
	cmp al,32
	jz LB_6073
LB_6075:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6076
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6077
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6077:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6078
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6078:
	jmp LB_6051
LB_6076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_6081
LB_6080:
	add r14,1
LB_6081:
	cmp r14,r10
	jge LB_6082
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6080
	cmp al,10
	jz LB_6080
	cmp al,32
	jz LB_6080
LB_6082:
	push r10
	call NS_E_3629_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6083
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6084
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6084:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6085
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6085:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6086
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6086:
	jmp LB_6051
LB_6083:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6058
	btr r12,3
	jmp LB_6059
LB_6058:
	bts r12,3
LB_6059:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6056
	btr r12,2
	jmp LB_6057
LB_6056:
	bts r12,2
LB_6057:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6054
	btr r12,1
	jmp LB_6055
LB_6054:
	bts r12,1
LB_6055:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6052
	btr r12,0
	jmp LB_6053
LB_6052:
	bts r12,0
LB_6053:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6048
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_6088
	btr r12,4
	jmp LB_6089
LB_6088:
	bts r12,4
LB_6089:
	mov r8,r9
	bt r12,3
	jc LB_6090
	btr r12,2
	jmp LB_6091
LB_6090:
	bts r12,2
LB_6091:
	mov r9,r14
	bt r12,1
	jc LB_6092
	btr r12,3
	jmp LB_6093
LB_6092:
	bts r12,3
LB_6093:
	mov r14,r10
	bt r12,4
	jc LB_6094
	btr r12,1
	jmp LB_6095
LB_6094:
	bts r12,1
LB_6095:
	mov r10,r13
	bt r12,0
	jc LB_6096
	btr r12,4
	jmp LB_6097
LB_6096:
	bts r12,4
LB_6097:
	mov r13,r9
	bt r12,3
	jc LB_6098
	btr r12,0
	jmp LB_6099
LB_6098:
	bts r12,0
LB_6099:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3865 : %_3865
 ; {>  %_3864~2':_p801 %_3862~0':(_lst)◂(_p803) %_3863~1':_p800 }
; _nil {  } ⊢ °1◂{  }
; _f863 %_3863 ⊢ %_3866 : %_3866
 ; {>  %_3864~2':_p801 %_3862~0':(_lst)◂(_p803) %_3863~1':_p800 %_3865~°1◂{  }:(_lst)◂(t1770'(0)) }
; _f863 1' ⊢ °1◂1'
; _f860 { %_3865 %_3866 %_3864 } ⊢ %_3867 : %_3867
 ; {>  %_3864~2':_p801 %_3862~0':(_lst)◂(_p803) %_3866~°1◂1':_p802 %_3865~°1◂{  }:(_lst)◂(t1770'(0)) }
; _f860 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_3867 ⊢ %_3868 : %_3868
 ; {>  %_3862~0':(_lst)◂(_p803) %_3867~°0◂{ °1◂{  } °1◂1' 2' }:_p801 }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_3868
 ; {>  %_3868~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p801) %_3862~0':(_lst)◂(_p803) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_6031
	mov rdi,r13
	call dlt
LB_6031:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_6036
	mov rsi,0
	bt r13,0
	jc LB_6036
	jmp LB_6037
LB_6036:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_6037:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_6034
	btr QWORD [rdi],0
	jmp LB_6035
LB_6034:
	bts QWORD [rdi],0
LB_6035:
	mov r13,r14
	bt r12,1
	jc LB_6042
	btr r12,0
	jmp LB_6043
LB_6042:
	bts r12,0
LB_6043:
	mov rsi,1
	bt r12,0
	jc LB_6040
	mov rsi,0
	bt r13,0
	jc LB_6040
	jmp LB_6041
LB_6040:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_6041:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_6038
	btr QWORD [rdi],1
	jmp LB_6039
LB_6038:
	bts QWORD [rdi],1
LB_6039:
	mov r13,r8
	bt r12,2
	jc LB_6046
	btr r12,0
	jmp LB_6047
LB_6046:
	bts r12,0
LB_6047:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_6044
	btr QWORD [rdi],2
	jmp LB_6045
LB_6044:
	bts QWORD [rdi],2
LB_6045:
	mov rsi,1
	bt r12,3
	jc LB_6032
	mov rsi,0
	bt r9,0
	jc LB_6032
	jmp LB_6033
LB_6032:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6033:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6048:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6050
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6049
LB_6050:
	add rsp,8
	ret
LB_6051:
	add rsp,64
	pop r14
LB_6049:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3630:
NS_E_RDI_3630:
NS_E_3630_ETR_TBL:
NS_E_3630_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_6119
LB_6118:
	add r14,1
LB_6119:
	cmp r14,r10
	jge LB_6120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6118
	cmp al,10
	jz LB_6118
	cmp al,32
	jz LB_6118
LB_6120:
	push r10
	call NS_E_3631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6121
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6113
LB_6121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_6124
LB_6123:
	add r14,1
LB_6124:
	cmp r14,r10
	jge LB_6125
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6123
	cmp al,10
	jz LB_6123
	cmp al,32
	jz LB_6123
LB_6125:
	push r10
	call NS_E_3632_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6126
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6127
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6127:
	jmp LB_6113
LB_6126:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6116
	btr r12,1
	jmp LB_6117
LB_6116:
	bts r12,1
LB_6117:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6114
	btr r12,0
	jmp LB_6115
LB_6114:
	bts r12,0
LB_6115:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6110
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3869 %_3870 } ⊢ %_3871 : %_3871
 ; {>  %_3870~1':(_lst)◂(_p803) %_3869~0':_p803 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3871 ⊢ %_3872 : %_3872
 ; {>  %_3871~°0◂{ 0' 1' }:(_lst)◂(_p803) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3872
 ; {>  %_3872~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p803)) }
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
	jc LB_6104
	btr r12,2
	jmp LB_6105
LB_6104:
	bts r12,2
LB_6105:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6102
	btr QWORD [rdi],0
	jmp LB_6103
LB_6102:
	bts QWORD [rdi],0
LB_6103:
	mov r8,r14
	bt r12,1
	jc LB_6108
	btr r12,2
	jmp LB_6109
LB_6108:
	bts r12,2
LB_6109:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6106
	btr QWORD [rdi],1
	jmp LB_6107
LB_6106:
	bts QWORD [rdi],1
LB_6107:
	mov rsi,1
	bt r12,3
	jc LB_6100
	mov rsi,0
	bt r9,0
	jc LB_6100
	jmp LB_6101
LB_6100:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6101:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6110:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6112
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6111
LB_6112:
	add rsp,8
	ret
LB_6113:
	add rsp,32
	pop r14
LB_6111:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_6140
LB_6139:
	add r14,1
LB_6140:
	cmp r14,r10
	jge LB_6141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6139
	cmp al,32
	jz LB_6139
LB_6141:
	add r14,1
	cmp r14,r10
	jg LB_6144
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6144
	jmp LB_6145
LB_6144:
	jmp LB_6134
LB_6145:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_6147
LB_6146:
	add r14,1
LB_6147:
	cmp r14,r10
	jge LB_6148
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6146
	cmp al,32
	jz LB_6146
LB_6148:
	add r14,1
	cmp r14,r10
	jg LB_6152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_6152
	jmp LB_6153
LB_6152:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6150
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6150:
	jmp LB_6134
LB_6153:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6137
	btr r12,1
	jmp LB_6138
LB_6137:
	bts r12,1
LB_6138:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6135
	btr r12,0
	jmp LB_6136
LB_6135:
	bts r12,0
LB_6136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6131
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3873 : %_3873
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3873 ⊢ %_3874 : %_3874
 ; {>  %_3873~°1◂{  }:(_lst)◂(t1783'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3874
 ; {>  %_3874~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1786'(0))) }
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
	jc LB_6129
	mov rsi,0
	bt r9,0
	jc LB_6129
	jmp LB_6130
LB_6129:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6130:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6131:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6133
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6132
LB_6133:
	add rsp,8
	ret
LB_6134:
	add rsp,32
	pop r14
LB_6132:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3631:
NS_E_RDI_3631:
NS_E_3631_ETR_TBL:
NS_E_3631_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src_ptn
	jmp LB_6210
LB_6209:
	add r14,1
LB_6210:
	cmp r14,r10
	jge LB_6211
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6209
	cmp al,10
	jz LB_6209
	cmp al,32
	jz LB_6209
LB_6211:
	push r10
	call NS_E_2757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6212
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6171
LB_6212:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_6215
LB_6214:
	add r14,1
LB_6215:
	cmp r14,r10
	jge LB_6216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6214
	cmp al,10
	jz LB_6214
	cmp al,32
	jz LB_6214
LB_6216:
	add r14,3
	cmp r14,r10
	jg LB_6220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6220
	jmp LB_6221
LB_6220:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6218:
	jmp LB_6171
LB_6221:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_6184
LB_6183:
	add r14,1
LB_6184:
	cmp r14,r10
	jge LB_6185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6183
	cmp al,10
	jz LB_6183
	cmp al,32
	jz LB_6183
LB_6185:
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6186
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6187
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6187:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6188
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6188:
	jmp LB_6172
LB_6186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_6191
LB_6190:
	add r14,1
LB_6191:
	cmp r14,r10
	jge LB_6192
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6190
	cmp al,10
	jz LB_6190
	cmp al,32
	jz LB_6190
LB_6192:
	add r14,3
	cmp r14,r10
	jg LB_6198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6198
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6198
	jmp LB_6199
LB_6198:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6194
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6194:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6195
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6195:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6196
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6196:
	jmp LB_6172
LB_6199:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_6201
LB_6200:
	add r14,1
LB_6201:
	cmp r14,r10
	jge LB_6202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6200
	cmp al,10
	jz LB_6200
	cmp al,32
	jz LB_6200
LB_6202:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6203
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6204
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6204:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6205
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6205:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6206
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6206:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6207:
	jmp LB_6172
LB_6203:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6181
	btr r12,4
	jmp LB_6182
LB_6181:
	bts r12,4
LB_6182:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6179
	btr r12,3
	jmp LB_6180
LB_6179:
	bts r12,3
LB_6180:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6177
	btr r12,2
	jmp LB_6178
LB_6177:
	bts r12,2
LB_6178:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6175
	btr r12,1
	jmp LB_6176
LB_6175:
	bts r12,1
LB_6176:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6173
	btr r12,0
	jmp LB_6174
LB_6173:
	bts r12,0
LB_6174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6168
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_6222
	btr r12,5
	jmp LB_6223
LB_6222:
	bts r12,5
LB_6223:
	mov r8,r10
	bt r12,4
	jc LB_6224
	btr r12,2
	jmp LB_6225
LB_6224:
	bts r12,2
LB_6225:
	mov r10,r14
	bt r12,1
	jc LB_6226
	btr r12,4
	jmp LB_6227
LB_6226:
	bts r12,4
LB_6227:
	mov r14,r11
	bt r12,5
	jc LB_6228
	btr r12,1
	jmp LB_6229
LB_6228:
	bts r12,1
LB_6229:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f864 { %_3875 %_3876 %_3877 } ⊢ %_3878 : %_3878
 ; {>  %_3875~0':_p796 %_3877~2':_p797 %_3876~1':_p733 }
; _f864 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_3878 ⊢ %_3879 : %_3879
 ; {>  %_3878~°0◂{ 0' 1' 2' }:_p803 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_3879
 ; {>  %_3879~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p803) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_6158
	btr r12,4
	jmp LB_6159
LB_6158:
	bts r12,4
LB_6159:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6156
	btr QWORD [rdi],0
	jmp LB_6157
LB_6156:
	bts QWORD [rdi],0
LB_6157:
	mov r10,r14
	bt r12,1
	jc LB_6162
	btr r12,4
	jmp LB_6163
LB_6162:
	bts r12,4
LB_6163:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6160
	btr QWORD [rdi],1
	jmp LB_6161
LB_6160:
	bts QWORD [rdi],1
LB_6161:
	mov r10,r8
	bt r12,2
	jc LB_6166
	btr r12,4
	jmp LB_6167
LB_6166:
	bts r12,4
LB_6167:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6164
	btr QWORD [rdi],2
	jmp LB_6165
LB_6164:
	bts QWORD [rdi],2
LB_6165:
	mov rsi,1
	bt r12,3
	jc LB_6154
	mov rsi,0
	bt r9,0
	jc LB_6154
	jmp LB_6155
LB_6154:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6155:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6168:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6170
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6169
LB_6170:
	add rsp,8
	ret
LB_6172:
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
LB_6171:
	add rsp,80
	pop r14
LB_6169:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_6251
LB_6250:
	add r14,1
LB_6251:
	cmp r14,r10
	jge LB_6252
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6250
	cmp al,32
	jz LB_6250
LB_6252:
	push r10
	call NS_E_3633_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6253
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6243
LB_6253:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_6256
LB_6255:
	add r14,1
LB_6256:
	cmp r14,r10
	jge LB_6257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6255
	cmp al,32
	jz LB_6255
LB_6257:
	add r14,1
	cmp r14,r10
	jg LB_6261
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6261
	jmp LB_6262
LB_6261:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6259:
	jmp LB_6243
LB_6262:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_6264
LB_6263:
	add r14,1
LB_6264:
	cmp r14,r10
	jge LB_6265
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6263
	cmp al,32
	jz LB_6263
LB_6265:
	push r10
	call NS_E_3633_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6266
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6267
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6267:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6268
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6268:
	jmp LB_6243
LB_6266:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6248
	btr r12,2
	jmp LB_6249
LB_6248:
	bts r12,2
LB_6249:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6246
	btr r12,1
	jmp LB_6247
LB_6246:
	bts r12,1
LB_6247:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6244
	btr r12,0
	jmp LB_6245
LB_6244:
	bts r12,0
LB_6245:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6240
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_6270
	btr r12,3
	jmp LB_6271
LB_6270:
	bts r12,3
LB_6271:
	mov r14,r8
	bt r12,2
	jc LB_6272
	btr r12,1
	jmp LB_6273
LB_6272:
	bts r12,1
LB_6273:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f865 { %_3880 %_3881 } ⊢ %_3882 : %_3882
 ; {>  %_3880~0':_p804 %_3881~1':_p804 }
; _f865 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_3882 ⊢ %_3883 : %_3883
 ; {>  %_3882~°1◂{ 0' 1' }:_p803 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_3883
 ; {>  %_3883~°0◂°1◂{ 0' 1' }:(_opn)◂(_p803) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6234
	btr r12,2
	jmp LB_6235
LB_6234:
	bts r12,2
LB_6235:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6232
	btr QWORD [rdi],0
	jmp LB_6233
LB_6232:
	bts QWORD [rdi],0
LB_6233:
	mov r8,r14
	bt r12,1
	jc LB_6238
	btr r12,2
	jmp LB_6239
LB_6238:
	bts r12,2
LB_6239:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6236
	btr QWORD [rdi],1
	jmp LB_6237
LB_6236:
	bts QWORD [rdi],1
LB_6237:
	mov rsi,1
	bt r12,3
	jc LB_6230
	mov rsi,0
	bt r9,0
	jc LB_6230
	jmp LB_6231
LB_6230:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6231:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6240:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6242
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6241
LB_6242:
	add rsp,8
	ret
LB_6243:
	add rsp,48
	pop r14
LB_6241:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3632:
NS_E_RDI_3632:
NS_E_3632_ETR_TBL:
NS_E_3632_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_6309
LB_6308:
	add r14,1
LB_6309:
	cmp r14,r10
	jge LB_6310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6308
	cmp al,10
	jz LB_6308
	cmp al,32
	jz LB_6308
LB_6310:
	add r14,1
	cmp r14,r10
	jg LB_6313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6313
	jmp LB_6314
LB_6313:
	jmp LB_6287
LB_6314:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_6296
LB_6295:
	add r14,1
LB_6296:
	cmp r14,r10
	jge LB_6297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6295
	cmp al,10
	jz LB_6295
	cmp al,32
	jz LB_6295
LB_6297:
	push r10
	call NS_E_3631_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6298
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6299:
	jmp LB_6288
LB_6298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_6302
LB_6301:
	add r14,1
LB_6302:
	cmp r14,r10
	jge LB_6303
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6301
	cmp al,10
	jz LB_6301
	cmp al,32
	jz LB_6301
LB_6303:
	push r10
	call NS_E_3632_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6304
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6305
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6305:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6306
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6306:
	jmp LB_6288
LB_6304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6293
	btr r12,2
	jmp LB_6294
LB_6293:
	bts r12,2
LB_6294:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6291
	btr r12,1
	jmp LB_6292
LB_6291:
	bts r12,1
LB_6292:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6289
	btr r12,0
	jmp LB_6290
LB_6289:
	bts r12,0
LB_6290:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6284
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6315
	btr r12,3
	jmp LB_6316
LB_6315:
	bts r12,3
LB_6316:
	mov r14,r8
	bt r12,2
	jc LB_6317
	btr r12,1
	jmp LB_6318
LB_6317:
	bts r12,1
LB_6318:
	mov r8,r13
	bt r12,0
	jc LB_6319
	btr r12,2
	jmp LB_6320
LB_6319:
	bts r12,2
LB_6320:
	mov r13,r9
	bt r12,3
	jc LB_6321
	btr r12,0
	jmp LB_6322
LB_6321:
	bts r12,0
LB_6322:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3884 %_3885 } ⊢ %_3886 : %_3886
 ; {>  %_3885~1':(_lst)◂(_p803) %_3884~0':_p803 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3886 ⊢ %_3887 : %_3887
 ; {>  %_3886~°0◂{ 0' 1' }:(_lst)◂(_p803) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3887
 ; {>  %_3887~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p803)) }
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
	jc LB_6278
	btr r12,2
	jmp LB_6279
LB_6278:
	bts r12,2
LB_6279:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6276
	btr QWORD [rdi],0
	jmp LB_6277
LB_6276:
	bts QWORD [rdi],0
LB_6277:
	mov r8,r14
	bt r12,1
	jc LB_6282
	btr r12,2
	jmp LB_6283
LB_6282:
	bts r12,2
LB_6283:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6280
	btr QWORD [rdi],1
	jmp LB_6281
LB_6280:
	bts QWORD [rdi],1
LB_6281:
	mov rsi,1
	bt r12,3
	jc LB_6274
	mov rsi,0
	bt r9,0
	jc LB_6274
	jmp LB_6275
LB_6274:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6275:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6284:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6286
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6285
LB_6286:
	add rsp,8
	ret
LB_6288:
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
LB_6287:
	add rsp,48
	pop r14
LB_6285:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_6334
LB_6333:
	add r14,1
LB_6334:
	cmp r14,r10
	jge LB_6335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6333
	cmp al,32
	jz LB_6333
LB_6335:
	add r14,1
	cmp r14,r10
	jg LB_6338
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6338
	jmp LB_6339
LB_6338:
	jmp LB_6328
LB_6339:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_6341
LB_6340:
	add r14,1
LB_6341:
	cmp r14,r10
	jge LB_6342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6340
	cmp al,32
	jz LB_6340
LB_6342:
	add r14,1
	cmp r14,r10
	jg LB_6346
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_6346
	jmp LB_6347
LB_6346:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6344
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6344:
	jmp LB_6328
LB_6347:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6331
	btr r12,1
	jmp LB_6332
LB_6331:
	bts r12,1
LB_6332:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6329
	btr r12,0
	jmp LB_6330
LB_6329:
	bts r12,0
LB_6330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6325
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3888 : %_3888
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3888 ⊢ %_3889 : %_3889
 ; {>  %_3888~°1◂{  }:(_lst)◂(t1807'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3889
 ; {>  %_3889~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1810'(0))) }
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
	jc LB_6323
	mov rsi,0
	bt r9,0
	jc LB_6323
	jmp LB_6324
LB_6323:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6324:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6325:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6327
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6326
LB_6327:
	add rsp,8
	ret
LB_6328:
	add rsp,32
	pop r14
LB_6326:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3633:
NS_E_RDI_3633:
NS_E_3633_ETR_TBL:
NS_E_3633_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6363
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6355
LB_6363:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_6371
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_6371
	jmp LB_6372
LB_6371:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6369
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6369:
	jmp LB_6355
LB_6372:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6358
	btr r12,1
	jmp LB_6359
LB_6358:
	bts r12,1
LB_6359:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6356
	btr r12,0
	jmp LB_6357
LB_6356:
	bts r12,0
LB_6357:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6352
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f867 %_3890 ⊢ %_3891 : %_3891
 ; {>  %_3890~0':_stg }
; _f867 0' ⊢ °1◂0'
; _some %_3891 ⊢ %_3892 : %_3892
 ; {>  %_3891~°1◂0':_p804 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3892
 ; {>  %_3892~°0◂°1◂0':(_opn)◂(_p804) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6350
	btr r12,3
	jmp LB_6351
LB_6350:
	bts r12,3
LB_6351:
	mov rsi,1
	bt r12,3
	jc LB_6348
	mov rsi,0
	bt r9,0
	jc LB_6348
	jmp LB_6349
LB_6348:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6349:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6352:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6354
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6353
LB_6354:
	add rsp,8
	ret
LB_6355:
	add rsp,32
	pop r14
LB_6353:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_2628_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6386
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6380
LB_6386:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6381
	btr r12,0
	jmp LB_6382
LB_6381:
	bts r12,0
LB_6382:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6377
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f866 %_3893 ⊢ %_3894 : %_3894
 ; {>  %_3893~0':_p799 }
; _f866 0' ⊢ °0◂0'
; _some %_3894 ⊢ %_3895 : %_3895
 ; {>  %_3894~°0◂0':_p804 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3895
 ; {>  %_3895~°0◂°0◂0':(_opn)◂(_p804) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6375
	btr r12,3
	jmp LB_6376
LB_6375:
	bts r12,3
LB_6376:
	mov rsi,1
	bt r12,3
	jc LB_6373
	mov rsi,0
	bt r9,0
	jc LB_6373
	jmp LB_6374
LB_6373:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6374:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6377:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6379
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6378
LB_6379:
	add rsp,8
	ret
LB_6380:
	add rsp,16
	pop r14
LB_6378:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3634:
NS_E_RDI_3634:
NS_E_3634_ETR_TBL:
NS_E_3634_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_6409
LB_6408:
	add r14,1
LB_6409:
	cmp r14,r10
	jge LB_6410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6408
	cmp al,10
	jz LB_6408
	cmp al,32
	jz LB_6408
LB_6410:
	add r14,1
	cmp r14,r10
	jg LB_6413
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6413
	jmp LB_6414
LB_6413:
	jmp LB_6399
LB_6414:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6416
LB_6415:
	add r14,1
LB_6416:
	cmp r14,r10
	jge LB_6417
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6415
	cmp al,10
	jz LB_6415
	cmp al,32
	jz LB_6415
LB_6417:
	add r14,1
	cmp r14,r10
	jg LB_6421
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6421
	jmp LB_6422
LB_6421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6419
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6419:
	jmp LB_6399
LB_6422:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6424
LB_6423:
	add r14,1
LB_6424:
	cmp r14,r10
	jge LB_6425
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6423
	cmp al,10
	jz LB_6423
	cmp al,32
	jz LB_6423
LB_6425:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6426
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6427
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6427:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6428
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6428:
	jmp LB_6399
LB_6426:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_6431
LB_6430:
	add r14,1
LB_6431:
	cmp r14,r10
	jge LB_6432
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6430
	cmp al,10
	jz LB_6430
	cmp al,32
	jz LB_6430
LB_6432:
	push r10
	call NS_E_3635_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6433
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6434
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6434:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6435
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6435:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6436:
	jmp LB_6399
LB_6433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6406
	btr r12,3
	jmp LB_6407
LB_6406:
	bts r12,3
LB_6407:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6404
	btr r12,2
	jmp LB_6405
LB_6404:
	bts r12,2
LB_6405:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6402
	btr r12,1
	jmp LB_6403
LB_6402:
	bts r12,1
LB_6403:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6400
	btr r12,0
	jmp LB_6401
LB_6400:
	bts r12,0
LB_6401:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6396
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_6438
	btr r12,4
	jmp LB_6439
LB_6438:
	bts r12,4
LB_6439:
	mov r14,r9
	bt r12,3
	jc LB_6440
	btr r12,1
	jmp LB_6441
LB_6440:
	bts r12,1
LB_6441:
	mov r9,r13
	bt r12,0
	jc LB_6442
	btr r12,3
	jmp LB_6443
LB_6442:
	bts r12,3
LB_6443:
	mov r13,r8
	bt r12,2
	jc LB_6444
	btr r12,0
	jmp LB_6445
LB_6444:
	bts r12,0
LB_6445:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some { %_3896 %_3897 } ⊢ %_3898 : %_3898
 ; {>  %_3897~1':_p785 %_3896~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_3898
 ; {>  %_3898~°0◂{ 0' 1' }:(_opn)◂({ _stg _p785 }) }
; 	∎ °0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6390
	btr r12,2
	jmp LB_6391
LB_6390:
	bts r12,2
LB_6391:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6388
	btr QWORD [rdi],0
	jmp LB_6389
LB_6388:
	bts QWORD [rdi],0
LB_6389:
	mov r8,r14
	bt r12,1
	jc LB_6394
	btr r12,2
	jmp LB_6395
LB_6394:
	bts r12,2
LB_6395:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6392
	btr QWORD [rdi],1
	jmp LB_6393
LB_6392:
	bts QWORD [rdi],1
LB_6393:
	mov r8,0
	bts r12,2
	ret
LB_6396:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6398
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6397
LB_6398:
	add rsp,8
	ret
LB_6399:
	add rsp,64
	pop r14
LB_6397:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3635:
NS_E_RDI_3635:
NS_E_3635_ETR_TBL:
NS_E_3635_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_6457
LB_6456:
	add r14,1
LB_6457:
	cmp r14,r10
	jge LB_6458
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6456
	cmp al,10
	jz LB_6456
	cmp al,32
	jz LB_6456
LB_6458:
	push r10
	call NS_E_3636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6459
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6453
LB_6459:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6454
	btr r12,0
	jmp LB_6455
LB_6454:
	bts r12,0
LB_6455:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6450
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f822 %_3899 ⊢ %_3900 : %_3900
 ; {>  %_3899~0':_p787 }
; _f822 0' ⊢ °1◂0'
; _some %_3900 ⊢ %_3901 : %_3901
 ; {>  %_3900~°1◂0':_p785 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3901
 ; {>  %_3901~°0◂°1◂0':(_opn)◂(_p785) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6448
	btr r12,3
	jmp LB_6449
LB_6448:
	bts r12,3
LB_6449:
	mov rsi,1
	bt r12,3
	jc LB_6446
	mov rsi,0
	bt r9,0
	jc LB_6446
	jmp LB_6447
LB_6446:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6447:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6450:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6452
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6451
LB_6452:
	add rsp,8
	ret
LB_6453:
	add rsp,16
	pop r14
LB_6451:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_6472
LB_6471:
	add r14,1
LB_6472:
	cmp r14,r10
	jge LB_6473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6471
	cmp al,10
	jz LB_6471
	cmp al,32
	jz LB_6471
LB_6473:
	push r10
	call NS_E_3644_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6468
LB_6474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6469
	btr r12,0
	jmp LB_6470
LB_6469:
	bts r12,0
LB_6470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6465
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f821 %_3902 ⊢ %_3903 : %_3903
 ; {>  %_3902~0':_p786 }
; _f821 0' ⊢ °0◂0'
; _some %_3903 ⊢ %_3904 : %_3904
 ; {>  %_3903~°0◂0':_p785 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3904
 ; {>  %_3904~°0◂°0◂0':(_opn)◂(_p785) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6463
	btr r12,3
	jmp LB_6464
LB_6463:
	bts r12,3
LB_6464:
	mov rsi,1
	bt r12,3
	jc LB_6461
	mov rsi,0
	bt r9,0
	jc LB_6461
	jmp LB_6462
LB_6461:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6462:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6465:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6467
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6466
LB_6467:
	add rsp,8
	ret
LB_6468:
	add rsp,16
	pop r14
LB_6466:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3636:
NS_E_RDI_3636:
NS_E_3636_ETR_TBL:
NS_E_3636_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_6525
LB_6524:
	add r14,1
LB_6525:
	cmp r14,r10
	jge LB_6526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6524
	cmp al,10
	jz LB_6524
	cmp al,32
	jz LB_6524
LB_6526:
	push r10
	call NS_E_3643_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6527
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6503
LB_6527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_6512
LB_6511:
	add r14,1
LB_6512:
	cmp r14,r10
	jge LB_6513
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6511
	cmp al,10
	jz LB_6511
	cmp al,32
	jz LB_6511
LB_6513:
	push r10
	call NS_E_3638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6514
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6515
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6515:
	jmp LB_6504
LB_6514:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_6518
LB_6517:
	add r14,1
LB_6518:
	cmp r14,r10
	jge LB_6519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6517
	cmp al,10
	jz LB_6517
	cmp al,32
	jz LB_6517
LB_6519:
	push r10
	call NS_E_3637_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6520
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6521
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6521:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6522
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6522:
	jmp LB_6504
LB_6520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6509
	btr r12,2
	jmp LB_6510
LB_6509:
	bts r12,2
LB_6510:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6507
	btr r12,1
	jmp LB_6508
LB_6507:
	bts r12,1
LB_6508:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6505
	btr r12,0
	jmp LB_6506
LB_6505:
	bts r12,0
LB_6506:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6500
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_6529
	btr r12,5
	jmp LB_6530
LB_6529:
	bts r12,5
LB_6530:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_6533
	btr r12,6
	jmp LB_6534
LB_6533:
	bts r12,6
LB_6534:
	mov r8,rcx
	bt r12,6
	jc LB_6531
	btr r12,2
	jmp LB_6532
LB_6531:
	bts r12,2
LB_6532:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_6537
	btr r12,6
	jmp LB_6538
LB_6537:
	bts r12,6
LB_6538:
	mov r9,rcx
	bt r12,6
	jc LB_6535
	btr r12,3
	jmp LB_6536
LB_6535:
	bts r12,3
LB_6536:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_6541
	btr r12,6
	jmp LB_6542
LB_6541:
	bts r12,6
LB_6542:
	mov r10,rcx
	bt r12,6
	jc LB_6539
	btr r12,4
	jmp LB_6540
LB_6539:
	bts r12,4
LB_6540:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f826 { %_3907 %_3908 %_3905 %_3906 %_3909 } ⊢ %_3910 : %_3910
 ; {>  %_3906~1':_p789 %_3905~0':_p788 %_3909~4':(_opn)◂(_p787) %_3908~3':_p800 %_3907~2':_p797 }
; _f826 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_3910 ⊢ %_3911 : %_3911
 ; {>  %_3910~°1◂{ 2' 3' 0' 1' 4' }:_p787 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_3911
 ; {>  %_3911~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p787) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_6476
	btr r12,5
	jmp LB_6477
LB_6476:
	bts r12,5
LB_6477:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_6482
	btr r12,6
	jmp LB_6483
LB_6482:
	bts r12,6
LB_6483:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6480
	btr QWORD [rdi],0
	jmp LB_6481
LB_6480:
	bts QWORD [rdi],0
LB_6481:
	mov rcx,r11
	bt r12,5
	jc LB_6486
	btr r12,6
	jmp LB_6487
LB_6486:
	bts r12,6
LB_6487:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6484
	btr QWORD [rdi],1
	jmp LB_6485
LB_6484:
	bts QWORD [rdi],1
LB_6485:
	mov rcx,r13
	bt r12,0
	jc LB_6490
	btr r12,6
	jmp LB_6491
LB_6490:
	bts r12,6
LB_6491:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_6488
	btr QWORD [rdi],2
	jmp LB_6489
LB_6488:
	bts QWORD [rdi],2
LB_6489:
	mov rcx,r14
	bt r12,1
	jc LB_6494
	btr r12,6
	jmp LB_6495
LB_6494:
	bts r12,6
LB_6495:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_6492
	btr QWORD [rdi],3
	jmp LB_6493
LB_6492:
	bts QWORD [rdi],3
LB_6493:
	mov rcx,r10
	bt r12,4
	jc LB_6498
	btr r12,6
	jmp LB_6499
LB_6498:
	bts r12,6
LB_6499:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_6496
	btr QWORD [rdi],4
	jmp LB_6497
LB_6496:
	bts QWORD [rdi],4
LB_6497:
	mov rsi,1
	bt r12,3
	jc LB_6478
	mov rsi,0
	bt r9,0
	jc LB_6478
	jmp LB_6479
LB_6478:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6479:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6500:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6502
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6501
LB_6502:
	add rsp,8
	ret
LB_6504:
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
LB_6503:
	add rsp,48
	pop r14
LB_6501:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord
	jmp LB_6584
LB_6583:
	add r14,1
LB_6584:
	cmp r14,r10
	jge LB_6585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6583
	cmp al,10
	jz LB_6583
	cmp al,32
	jz LB_6583
LB_6585:
	push r10
	call NS_E_3642_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6586
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6574
LB_6586:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_6589
LB_6588:
	add r14,1
LB_6589:
	cmp r14,r10
	jge LB_6590
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6588
	cmp al,10
	jz LB_6588
	cmp al,32
	jz LB_6588
LB_6590:
	push r10
	call NS_E_3638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6591
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6592
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6592:
	jmp LB_6574
LB_6591:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_6595
LB_6594:
	add r14,1
LB_6595:
	cmp r14,r10
	jge LB_6596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6594
	cmp al,10
	jz LB_6594
	cmp al,32
	jz LB_6594
LB_6596:
	push r10
	call NS_E_3637_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6597
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6598
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6598:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6599
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6599:
	jmp LB_6574
LB_6597:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_6602
LB_6601:
	add r14,1
LB_6602:
	cmp r14,r10
	jge LB_6603
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6601
	cmp al,10
	jz LB_6601
	cmp al,32
	jz LB_6601
LB_6603:
	push r10
	call NS_E_3636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6604
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6605
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6605:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6606
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6606:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6607
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6607:
	jmp LB_6574
LB_6604:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6581
	btr r12,3
	jmp LB_6582
LB_6581:
	bts r12,3
LB_6582:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6579
	btr r12,2
	jmp LB_6580
LB_6579:
	bts r12,2
LB_6580:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6577
	btr r12,1
	jmp LB_6578
LB_6577:
	bts r12,1
LB_6578:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6575
	btr r12,0
	jmp LB_6576
LB_6575:
	bts r12,0
LB_6576:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6571
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_6609
	btr r12,5
	jmp LB_6610
LB_6609:
	bts r12,5
LB_6610:
	mov rcx,r8
	bt r12,2
	jc LB_6611
	btr r12,6
	jmp LB_6612
LB_6611:
	bts r12,6
LB_6612:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_6615
	btr r12,7
	jmp LB_6616
LB_6615:
	bts r12,7
LB_6616:
	mov r8,rdx
	bt r12,7
	jc LB_6613
	btr r12,2
	jmp LB_6614
LB_6613:
	bts r12,2
LB_6614:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_6619
	btr r12,7
	jmp LB_6620
LB_6619:
	bts r12,7
LB_6620:
	mov r9,rdx
	bt r12,7
	jc LB_6617
	btr r12,3
	jmp LB_6618
LB_6617:
	bts r12,3
LB_6618:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_6623
	btr r12,7
	jmp LB_6624
LB_6623:
	bts r12,7
LB_6624:
	mov r10,rdx
	bt r12,7
	jc LB_6621
	btr r12,4
	jmp LB_6622
LB_6621:
	bts r12,4
LB_6622:
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f825 { %_3914 %_3915 %_3912 %_3913 %_3916 %_3917 } ⊢ %_3918 : %_3918
 ; {>  %_3912~0':_p788 %_3915~3':_p800 %_3914~2':_p797 %_3913~1':_p789 %_3917~5':_p787 %_3916~4':(_opn)◂(_p787) }
; _f825 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_3918 ⊢ %_3919 : %_3919
 ; {>  %_3918~°0◂{ 2' 3' 0' 1' 4' 5' }:_p787 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_3919
 ; {>  %_3919~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p787) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_6543
	btr r12,6
	jmp LB_6544
LB_6543:
	bts r12,6
LB_6544:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_6549
	btr r12,7
	jmp LB_6550
LB_6549:
	bts r12,7
LB_6550:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_6547
	btr QWORD [rdi],0
	jmp LB_6548
LB_6547:
	bts QWORD [rdi],0
LB_6548:
	mov rdx,rcx
	bt r12,6
	jc LB_6553
	btr r12,7
	jmp LB_6554
LB_6553:
	bts r12,7
LB_6554:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_6551
	btr QWORD [rdi],1
	jmp LB_6552
LB_6551:
	bts QWORD [rdi],1
LB_6552:
	mov rdx,r13
	bt r12,0
	jc LB_6557
	btr r12,7
	jmp LB_6558
LB_6557:
	bts r12,7
LB_6558:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_6555
	btr QWORD [rdi],2
	jmp LB_6556
LB_6555:
	bts QWORD [rdi],2
LB_6556:
	mov rdx,r14
	bt r12,1
	jc LB_6561
	btr r12,7
	jmp LB_6562
LB_6561:
	bts r12,7
LB_6562:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_6559
	btr QWORD [rdi],3
	jmp LB_6560
LB_6559:
	bts QWORD [rdi],3
LB_6560:
	mov rdx,r10
	bt r12,4
	jc LB_6565
	btr r12,7
	jmp LB_6566
LB_6565:
	bts r12,7
LB_6566:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_6563
	btr QWORD [rdi],4
	jmp LB_6564
LB_6563:
	bts QWORD [rdi],4
LB_6564:
	mov rdx,r11
	bt r12,5
	jc LB_6569
	btr r12,7
	jmp LB_6570
LB_6569:
	bts r12,7
LB_6570:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_6567
	btr QWORD [rdi],5
	jmp LB_6568
LB_6567:
	bts QWORD [rdi],5
LB_6568:
	mov rsi,1
	bt r12,3
	jc LB_6545
	mov rsi,0
	bt r9,0
	jc LB_6545
	jmp LB_6546
LB_6545:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6546:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6571:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6573
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6572
LB_6573:
	add rsp,8
	ret
LB_6574:
	add rsp,64
	pop r14
LB_6572:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3637:
NS_E_RDI_3637:
NS_E_3637_ETR_TBL:
NS_E_3637_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_6679
LB_6678:
	add r14,1
LB_6679:
	cmp r14,r10
	jge LB_6680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6678
	cmp al,10
	jz LB_6678
	cmp al,32
	jz LB_6678
LB_6680:
	add r14,1
	cmp r14,r10
	jg LB_6683
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6683
	jmp LB_6684
LB_6683:
	jmp LB_6642
LB_6684:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_6686
LB_6685:
	add r14,1
LB_6686:
	cmp r14,r10
	jge LB_6687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6685
	cmp al,10
	jz LB_6685
	cmp al,32
	jz LB_6685
LB_6687:
	add r14,3
	cmp r14,r10
	jg LB_6691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6691
	jmp LB_6692
LB_6691:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6689
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6689:
	jmp LB_6642
LB_6692:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_6655
LB_6654:
	add r14,1
LB_6655:
	cmp r14,r10
	jge LB_6656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6654
	cmp al,10
	jz LB_6654
	cmp al,32
	jz LB_6654
LB_6656:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6657
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6658
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6658:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6659:
	jmp LB_6643
LB_6657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_6662
LB_6661:
	add r14,1
LB_6662:
	cmp r14,r10
	jge LB_6663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6661
	cmp al,10
	jz LB_6661
	cmp al,32
	jz LB_6661
LB_6663:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6664
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6665
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6665:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6666
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6666:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6667
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6667:
	jmp LB_6643
LB_6664:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_6670
LB_6669:
	add r14,1
LB_6670:
	cmp r14,r10
	jge LB_6671
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6669
	cmp al,10
	jz LB_6669
	cmp al,32
	jz LB_6669
LB_6671:
	push r10
	call NS_E_3636_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6672
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6673
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6673:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6674
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6674:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6675
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6675:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6676
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6676:
	jmp LB_6643
LB_6672:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6652
	btr r12,4
	jmp LB_6653
LB_6652:
	bts r12,4
LB_6653:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6650
	btr r12,3
	jmp LB_6651
LB_6650:
	bts r12,3
LB_6651:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6648
	btr r12,2
	jmp LB_6649
LB_6648:
	bts r12,2
LB_6649:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6646
	btr r12,1
	jmp LB_6647
LB_6646:
	bts r12,1
LB_6647:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6644
	btr r12,0
	jmp LB_6645
LB_6644:
	bts r12,0
LB_6645:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6639
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6693
	btr r12,5
	jmp LB_6694
LB_6693:
	bts r12,5
LB_6694:
	mov r8,r10
	bt r12,4
	jc LB_6695
	btr r12,2
	jmp LB_6696
LB_6695:
	bts r12,2
LB_6696:
	mov r10,r14
	bt r12,1
	jc LB_6697
	btr r12,4
	jmp LB_6698
LB_6697:
	bts r12,4
LB_6698:
	mov r14,r9
	bt r12,3
	jc LB_6699
	btr r12,1
	jmp LB_6700
LB_6699:
	bts r12,1
LB_6700:
	mov r9,r13
	bt r12,0
	jc LB_6701
	btr r12,3
	jmp LB_6702
LB_6701:
	bts r12,3
LB_6702:
	mov r13,r11
	bt r12,5
	jc LB_6703
	btr r12,0
	jmp LB_6704
LB_6703:
	bts r12,0
LB_6704:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3922 ⊢ %_3923 : %_3923
 ; {>  %_3922~2':_p787 %_3920~0':_p797 %_3921~1':_p800 }
; _some 2' ⊢ °0◂2'
; _some { %_3920 %_3921 %_3923 } ⊢ %_3924 : %_3924
 ; {>  %_3923~°0◂2':(_opn)◂(_p787) %_3920~0':_p797 %_3921~1':_p800 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_3924
 ; {>  %_3924~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p797 _p800 (_opn)◂(_p787) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_6627
	btr r12,4
	jmp LB_6628
LB_6627:
	bts r12,4
LB_6628:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6625
	btr QWORD [rdi],0
	jmp LB_6626
LB_6625:
	bts QWORD [rdi],0
LB_6626:
	mov r10,r14
	bt r12,1
	jc LB_6631
	btr r12,4
	jmp LB_6632
LB_6631:
	bts r12,4
LB_6632:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6629
	btr QWORD [rdi],1
	jmp LB_6630
LB_6629:
	bts QWORD [rdi],1
LB_6630:
	mov r10,r8
	bt r12,2
	jc LB_6637
	btr r12,4
	jmp LB_6638
LB_6637:
	bts r12,4
LB_6638:
	mov rsi,1
	bt r12,4
	jc LB_6635
	mov rsi,0
	bt r10,0
	jc LB_6635
	jmp LB_6636
LB_6635:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6636:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6633
	btr QWORD [rdi],2
	jmp LB_6634
LB_6633:
	bts QWORD [rdi],2
LB_6634:
	mov r8,0
	bts r12,2
	ret
LB_6639:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6641
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6640
LB_6641:
	add rsp,8
	ret
LB_6643:
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
LB_6642:
	add rsp,80
	pop r14
LB_6640:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_6742
LB_6741:
	add r14,1
LB_6742:
	cmp r14,r10
	jge LB_6743
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6741
	cmp al,10
	jz LB_6741
	cmp al,32
	jz LB_6741
LB_6743:
	add r14,3
	cmp r14,r10
	jg LB_6746
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6746
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6746
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6746
	jmp LB_6747
LB_6746:
	jmp LB_6720
LB_6747:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_6729
LB_6728:
	add r14,1
LB_6729:
	cmp r14,r10
	jge LB_6730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6728
	cmp al,10
	jz LB_6728
	cmp al,32
	jz LB_6728
LB_6730:
	push r10
	call NS_E_3021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6731
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6732
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6732:
	jmp LB_6721
LB_6731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_6735
LB_6734:
	add r14,1
LB_6735:
	cmp r14,r10
	jge LB_6736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6734
	cmp al,10
	jz LB_6734
	cmp al,32
	jz LB_6734
LB_6736:
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6737
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6738
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6738:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6739
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6739:
	jmp LB_6721
LB_6737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6726
	btr r12,2
	jmp LB_6727
LB_6726:
	bts r12,2
LB_6727:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6724
	btr r12,1
	jmp LB_6725
LB_6724:
	bts r12,1
LB_6725:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6722
	btr r12,0
	jmp LB_6723
LB_6722:
	bts r12,0
LB_6723:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6717
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_6748
	btr r12,3
	jmp LB_6749
LB_6748:
	bts r12,3
LB_6749:
	mov r14,r8
	bt r12,2
	jc LB_6750
	btr r12,1
	jmp LB_6751
LB_6750:
	bts r12,1
LB_6751:
	mov r8,r13
	bt r12,0
	jc LB_6752
	btr r12,2
	jmp LB_6753
LB_6752:
	bts r12,2
LB_6753:
	mov r13,r9
	bt r12,3
	jc LB_6754
	btr r12,0
	jmp LB_6755
LB_6754:
	bts r12,0
LB_6755:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_3927 : %_3927
 ; {>  %_3926~1':_p800 %_3925~0':_p797 }
; _none {  } ⊢ °1◂{  }
; _some { %_3925 %_3926 %_3927 } ⊢ %_3928 : %_3928
 ; {>  %_3926~1':_p800 %_3925~0':_p797 %_3927~°1◂{  }:(_opn)◂(t1860'(0)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_3928
 ; {>  %_3928~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p797 _p800 (_opn)◂(t1863'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6707
	btr r12,2
	jmp LB_6708
LB_6707:
	bts r12,2
LB_6708:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6705
	btr QWORD [rdi],0
	jmp LB_6706
LB_6705:
	bts QWORD [rdi],0
LB_6706:
	mov r8,r14
	bt r12,1
	jc LB_6711
	btr r12,2
	jmp LB_6712
LB_6711:
	bts r12,2
LB_6712:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6709
	btr QWORD [rdi],1
	jmp LB_6710
LB_6709:
	bts QWORD [rdi],1
LB_6710:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_6715
	mov rsi,0
	bt r8,0
	jc LB_6715
	jmp LB_6716
LB_6715:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6716:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_6713
	btr QWORD [rdi],2
	jmp LB_6714
LB_6713:
	bts QWORD [rdi],2
LB_6714:
	mov r8,0
	bts r12,2
	ret
LB_6717:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6719
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6718
LB_6719:
	add rsp,8
	ret
LB_6721:
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
LB_6720:
	add rsp,48
	pop r14
LB_6718:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3638:
NS_E_RDI_3638:
NS_E_3638_ETR_TBL:
NS_E_3638_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_6776
LB_6775:
	add r14,1
LB_6776:
	cmp r14,r10
	jge LB_6777
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6775
	cmp al,10
	jz LB_6775
	cmp al,32
	jz LB_6775
LB_6777:
	add r14,2
	cmp r14,r10
	jg LB_6780
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_6780
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_6780
	jmp LB_6781
LB_6780:
	jmp LB_6763
LB_6781:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_6770
LB_6769:
	add r14,1
LB_6770:
	cmp r14,r10
	jge LB_6771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6769
	cmp al,10
	jz LB_6769
	cmp al,32
	jz LB_6769
LB_6771:
	push r10
	call NS_E_3639_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6772
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6773
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6773:
	jmp LB_6764
LB_6772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6767
	btr r12,1
	jmp LB_6768
LB_6767:
	bts r12,1
LB_6768:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6765
	btr r12,0
	jmp LB_6766
LB_6765:
	bts r12,0
LB_6766:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6760
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6782
	btr r12,2
	jmp LB_6783
LB_6782:
	bts r12,2
LB_6783:
	mov r13,r14
	bt r12,1
	jc LB_6784
	btr r12,0
	jmp LB_6785
LB_6784:
	bts r12,0
LB_6785:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f830 %_3929 ⊢ %_3930 : %_3930
 ; {>  %_3929~0':_p790 }
; _f830 0' ⊢ °0◂0'
; _some %_3930 ⊢ %_3931 : %_3931
 ; {>  %_3930~°0◂0':_p789 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3931
 ; {>  %_3931~°0◂°0◂0':(_opn)◂(_p789) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6758
	btr r12,3
	jmp LB_6759
LB_6758:
	bts r12,3
LB_6759:
	mov rsi,1
	bt r12,3
	jc LB_6756
	mov rsi,0
	bt r9,0
	jc LB_6756
	jmp LB_6757
LB_6756:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6757:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6760:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6762
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6761
LB_6762:
	add rsp,8
	ret
LB_6764:
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
LB_6763:
	add rsp,32
	pop r14
LB_6761:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_6805
LB_6804:
	add r14,1
LB_6805:
	cmp r14,r10
	jge LB_6806
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6804
	cmp al,10
	jz LB_6804
	cmp al,32
	jz LB_6804
LB_6806:
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6807
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6799
LB_6807:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_6810
LB_6809:
	add r14,1
LB_6810:
	cmp r14,r10
	jge LB_6811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6809
	cmp al,10
	jz LB_6809
	cmp al,32
	jz LB_6809
LB_6811:
	push r10
	call NS_E_3638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6812
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6813
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6813:
	jmp LB_6799
LB_6812:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6802
	btr r12,1
	jmp LB_6803
LB_6802:
	bts r12,1
LB_6803:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6800
	btr r12,0
	jmp LB_6801
LB_6800:
	bts r12,0
LB_6801:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6796
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f831 { %_3932 %_3933 } ⊢ %_3934 : %_3934
 ; {>  %_3933~1':_p789 %_3932~0':_p791 }
; _f831 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_3934 ⊢ %_3935 : %_3935
 ; {>  %_3934~°1◂{ 0' 1' }:_p789 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_3935
 ; {>  %_3935~°0◂°1◂{ 0' 1' }:(_opn)◂(_p789) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6790
	btr r12,2
	jmp LB_6791
LB_6790:
	bts r12,2
LB_6791:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6788
	btr QWORD [rdi],0
	jmp LB_6789
LB_6788:
	bts QWORD [rdi],0
LB_6789:
	mov r8,r14
	bt r12,1
	jc LB_6794
	btr r12,2
	jmp LB_6795
LB_6794:
	bts r12,2
LB_6795:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6792
	btr QWORD [rdi],1
	jmp LB_6793
LB_6792:
	bts QWORD [rdi],1
LB_6793:
	mov rsi,1
	bt r12,3
	jc LB_6786
	mov rsi,0
	bt r9,0
	jc LB_6786
	jmp LB_6787
LB_6786:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6787:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6796:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6798
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6797
LB_6798:
	add rsp,8
	ret
LB_6799:
	add rsp,32
	pop r14
LB_6797:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6817
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f832 {  } ⊢ %_3936 : %_3936
 ; {>  }
; _f832 {  } ⊢ °2◂{  }
; _some %_3936 ⊢ %_3937 : %_3937
 ; {>  %_3936~°2◂{  }:_p789 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_3937
 ; {>  %_3937~°0◂°2◂{  }:(_opn)◂(_p789) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6815
	mov rsi,0
	bt r9,0
	jc LB_6815
	jmp LB_6816
LB_6815:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6816:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6817:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6819
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6818
LB_6819:
	add rsp,8
	ret
LB_6820:
	add rsp,0
	pop r14
LB_6818:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3639:
NS_E_RDI_3639:
NS_E_3639_ETR_TBL:
NS_E_3639_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_6840
LB_6839:
	add r14,1
LB_6840:
	cmp r14,r10
	jge LB_6841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6839
	cmp al,10
	jz LB_6839
	cmp al,32
	jz LB_6839
LB_6841:
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6834
LB_6842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_6845
LB_6844:
	add r14,1
LB_6845:
	cmp r14,r10
	jge LB_6846
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6844
	cmp al,10
	jz LB_6844
	cmp al,32
	jz LB_6844
LB_6846:
	push r10
	call NS_E_3639_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6847
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6848:
	jmp LB_6834
LB_6847:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6837
	btr r12,1
	jmp LB_6838
LB_6837:
	bts r12,1
LB_6838:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6835
	btr r12,0
	jmp LB_6836
LB_6835:
	bts r12,0
LB_6836:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6831
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f833 { %_3938 %_3939 } ⊢ %_3940 : %_3940
 ; {>  %_3939~1':_p790 %_3938~0':_p791 }
; _f833 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3940 ⊢ %_3941 : %_3941
 ; {>  %_3940~°0◂{ 0' 1' }:_p790 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3941
 ; {>  %_3941~°0◂°0◂{ 0' 1' }:(_opn)◂(_p790) }
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
	jc LB_6825
	btr r12,2
	jmp LB_6826
LB_6825:
	bts r12,2
LB_6826:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6823
	btr QWORD [rdi],0
	jmp LB_6824
LB_6823:
	bts QWORD [rdi],0
LB_6824:
	mov r8,r14
	bt r12,1
	jc LB_6829
	btr r12,2
	jmp LB_6830
LB_6829:
	bts r12,2
LB_6830:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6827
	btr QWORD [rdi],1
	jmp LB_6828
LB_6827:
	bts QWORD [rdi],1
LB_6828:
	mov rsi,1
	bt r12,3
	jc LB_6821
	mov rsi,0
	bt r9,0
	jc LB_6821
	jmp LB_6822
LB_6821:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6822:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6831:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6833
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6832
LB_6833:
	add rsp,8
	ret
LB_6834:
	add rsp,32
	pop r14
LB_6832:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6852
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f834 {  } ⊢ %_3942 : %_3942
 ; {>  }
; _f834 {  } ⊢ °1◂{  }
; _some %_3942 ⊢ %_3943 : %_3943
 ; {>  %_3942~°1◂{  }:_p790 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3943
 ; {>  %_3943~°0◂°1◂{  }:(_opn)◂(_p790) }
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
	jc LB_6850
	mov rsi,0
	bt r9,0
	jc LB_6850
	jmp LB_6851
LB_6850:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6851:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6852:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6854
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6853
LB_6854:
	add rsp,8
	ret
LB_6855:
	add rsp,0
	pop r14
LB_6853:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3640:
NS_E_RDI_3640:
NS_E_3640_ETR_TBL:
NS_E_3640_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_6871
LB_6870:
	add r14,1
LB_6871:
	cmp r14,r10
	jge LB_6872
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6870
	cmp al,10
	jz LB_6870
	cmp al,32
	jz LB_6870
LB_6872:
	add r14,3
	cmp r14,r10
	jg LB_6875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_6875
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_6875
	jmp LB_6876
LB_6875:
	jmp LB_6863
LB_6876:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_6878
LB_6877:
	add r14,1
LB_6878:
	cmp r14,r10
	jge LB_6879
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6877
	cmp al,10
	jz LB_6877
	cmp al,32
	jz LB_6877
LB_6879:
	push r10
	call NS_E_3641_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6880
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6881
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6881:
	jmp LB_6863
LB_6880:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_6884
LB_6883:
	add r14,1
LB_6884:
	cmp r14,r10
	jge LB_6885
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6883
	cmp al,10
	jz LB_6883
	cmp al,32
	jz LB_6883
LB_6885:
	add r14,3
	cmp r14,r10
	jg LB_6890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_6890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_6890
	jmp LB_6891
LB_6890:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6887
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6887:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6888
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6888:
	jmp LB_6863
LB_6891:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6868
	btr r12,2
	jmp LB_6869
LB_6868:
	bts r12,2
LB_6869:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6866
	btr r12,1
	jmp LB_6867
LB_6866:
	bts r12,1
LB_6867:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6864
	btr r12,0
	jmp LB_6865
LB_6864:
	bts r12,0
LB_6865:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6860
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_6892
	btr r12,3
	jmp LB_6893
LB_6892:
	bts r12,3
LB_6893:
	mov r13,r14
	bt r12,1
	jc LB_6894
	btr r12,0
	jmp LB_6895
LB_6894:
	bts r12,0
LB_6895:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f835 %_3944 ⊢ %_3945 : %_3945
 ; {>  %_3944~0':_p792 }
; _f835 0' ⊢ °0◂0'
; _some %_3945 ⊢ %_3946 : %_3946
 ; {>  %_3945~°0◂0':_p791 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3946
 ; {>  %_3946~°0◂°0◂0':(_opn)◂(_p791) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6858
	btr r12,3
	jmp LB_6859
LB_6858:
	bts r12,3
LB_6859:
	mov rsi,1
	bt r12,3
	jc LB_6856
	mov rsi,0
	bt r9,0
	jc LB_6856
	jmp LB_6857
LB_6856:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6857:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6860:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6862
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6861
LB_6862:
	add rsp,8
	ret
LB_6863:
	add rsp,48
	pop r14
LB_6861:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_6907
LB_6906:
	add r14,1
LB_6907:
	cmp r14,r10
	jge LB_6908
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6906
	cmp al,10
	jz LB_6906
	cmp al,32
	jz LB_6906
LB_6908:
	push r10
	call NS_E_3641_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6909
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6903
LB_6909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6904
	btr r12,0
	jmp LB_6905
LB_6904:
	bts r12,0
LB_6905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6900
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f836 %_3947 ⊢ %_3948 : %_3948
 ; {>  %_3947~0':_p792 }
; _f836 0' ⊢ °1◂0'
; _some %_3948 ⊢ %_3949 : %_3949
 ; {>  %_3948~°1◂0':_p791 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3949
 ; {>  %_3949~°0◂°1◂0':(_opn)◂(_p791) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6898
	btr r12,3
	jmp LB_6899
LB_6898:
	bts r12,3
LB_6899:
	mov rsi,1
	bt r12,3
	jc LB_6896
	mov rsi,0
	bt r9,0
	jc LB_6896
	jmp LB_6897
LB_6896:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6897:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6902
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6901
LB_6902:
	add rsp,8
	ret
LB_6903:
	add rsp,16
	pop r14
LB_6901:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3641:
NS_E_RDI_3641:
NS_E_3641_ETR_TBL:
NS_E_3641_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_6922
LB_6921:
	add r14,1
LB_6922:
	cmp r14,r10
	jge LB_6923
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6921
	cmp al,10
	jz LB_6921
	cmp al,32
	jz LB_6921
LB_6923:
	push r10
	call NS_E_178_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6924
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6918
LB_6924:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6919
	btr r12,0
	jmp LB_6920
LB_6919:
	bts r12,0
LB_6920:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6915
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f838 %_3950 ⊢ %_3951 : %_3951
 ; {>  %_3950~0':_stg }
; _f838 0' ⊢ °1◂0'
; _some %_3951 ⊢ %_3952 : %_3952
 ; {>  %_3951~°1◂0':_p792 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3952
 ; {>  %_3952~°0◂°1◂0':(_opn)◂(_p792) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6913
	btr r12,3
	jmp LB_6914
LB_6913:
	bts r12,3
LB_6914:
	mov rsi,1
	bt r12,3
	jc LB_6911
	mov rsi,0
	bt r9,0
	jc LB_6911
	jmp LB_6912
LB_6911:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6912:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6917
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6916
LB_6917:
	add rsp,8
	ret
LB_6918:
	add rsp,16
	pop r14
LB_6916:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_6937
LB_6936:
	add r14,1
LB_6937:
	cmp r14,r10
	jge LB_6938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6936
	cmp al,10
	jz LB_6936
	cmp al,32
	jz LB_6936
LB_6938:
	push r10
	call NS_E_2561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6939
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6933
LB_6939:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6934
	btr r12,0
	jmp LB_6935
LB_6934:
	bts r12,0
LB_6935:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6930
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f837 %_3953 ⊢ %_3954 : %_3954
 ; {>  %_3953~0':_p733 }
; _f837 0' ⊢ °0◂0'
; _some %_3954 ⊢ %_3955 : %_3955
 ; {>  %_3954~°0◂0':_p792 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3955
 ; {>  %_3955~°0◂°0◂0':(_opn)◂(_p792) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6928
	btr r12,3
	jmp LB_6929
LB_6928:
	bts r12,3
LB_6929:
	mov rsi,1
	bt r12,3
	jc LB_6926
	mov rsi,0
	bt r9,0
	jc LB_6926
	jmp LB_6927
LB_6926:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6927:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6930:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6932
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6931
LB_6932:
	add rsp,8
	ret
LB_6933:
	add rsp,16
	pop r14
LB_6931:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3642:
NS_E_RDI_3642:
NS_E_3642_ETR_TBL:
NS_E_3642_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_6950
LB_6949:
	add r14,1
LB_6950:
	cmp r14,r10
	jge LB_6951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6949
	cmp al,10
	jz LB_6949
	cmp al,32
	jz LB_6949
LB_6951:
	add r14,4
	cmp r14,r10
	jg LB_6954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_6954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_6954
	jmp LB_6955
LB_6954:
	jmp LB_6946
LB_6955:
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
	jc LB_6947
	btr r12,0
	jmp LB_6948
LB_6947:
	bts r12,0
LB_6948:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6943
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f828 {  } ⊢ %_3956 : %_3956
 ; {>  }
; _f828 {  } ⊢ °1◂{  }
; _some %_3956 ⊢ %_3957 : %_3957
 ; {>  %_3956~°1◂{  }:_p788 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3957
 ; {>  %_3957~°0◂°1◂{  }:(_opn)◂(_p788) }
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
	jc LB_6941
	mov rsi,0
	bt r9,0
	jc LB_6941
	jmp LB_6942
LB_6941:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6942:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6943:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6945
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6944
LB_6945:
	add rsp,8
	ret
LB_6946:
	add rsp,16
	pop r14
LB_6944:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_6965
LB_6964:
	add r14,1
LB_6965:
	cmp r14,r10
	jge LB_6966
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6964
	cmp al,10
	jz LB_6964
	cmp al,32
	jz LB_6964
LB_6966:
	add r14,4
	cmp r14,r10
	jg LB_6969
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6969
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6969
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_6969
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_6969
	jmp LB_6970
LB_6969:
	jmp LB_6961
LB_6970:
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
	jc LB_6962
	btr r12,0
	jmp LB_6963
LB_6962:
	bts r12,0
LB_6963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6958
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f829 {  } ⊢ %_3958 : %_3958
 ; {>  }
; _f829 {  } ⊢ °2◂{  }
; _some %_3958 ⊢ %_3959 : %_3959
 ; {>  %_3958~°2◂{  }:_p788 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_3959
 ; {>  %_3959~°0◂°2◂{  }:(_opn)◂(_p788) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6956
	mov rsi,0
	bt r9,0
	jc LB_6956
	jmp LB_6957
LB_6956:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6957:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6958:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6960
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6959
LB_6960:
	add rsp,8
	ret
LB_6961:
	add rsp,16
	pop r14
LB_6959:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_6980
LB_6979:
	add r14,1
LB_6980:
	cmp r14,r10
	jge LB_6981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6979
	cmp al,10
	jz LB_6979
	cmp al,32
	jz LB_6979
LB_6981:
	add r14,3
	cmp r14,r10
	jg LB_6984
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6984
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6984
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6984
	jmp LB_6985
LB_6984:
	jmp LB_6976
LB_6985:
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
	jc LB_6977
	btr r12,0
	jmp LB_6978
LB_6977:
	bts r12,0
LB_6978:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6973
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f827 {  } ⊢ %_3960 : %_3960
 ; {>  }
; _f827 {  } ⊢ °0◂{  }
; _some %_3960 ⊢ %_3961 : %_3961
 ; {>  %_3960~°0◂{  }:_p788 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_3961
 ; {>  %_3961~°0◂°0◂{  }:(_opn)◂(_p788) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_6971
	mov rsi,0
	bt r9,0
	jc LB_6971
	jmp LB_6972
LB_6971:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6972:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6973:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6975
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6974
LB_6975:
	add rsp,8
	ret
LB_6976:
	add rsp,16
	pop r14
LB_6974:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3643:
NS_E_RDI_3643:
NS_E_3643_ETR_TBL:
NS_E_3643_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_6995
LB_6994:
	add r14,1
LB_6995:
	cmp r14,r10
	jge LB_6996
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6994
	cmp al,10
	jz LB_6994
	cmp al,32
	jz LB_6994
LB_6996:
	add r14,5
	cmp r14,r10
	jg LB_6999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_6999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_6999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_6999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_6999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_6999
	jmp LB_7000
LB_6999:
	jmp LB_6991
LB_7000:
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
	jc LB_6992
	btr r12,0
	jmp LB_6993
LB_6992:
	bts r12,0
LB_6993:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6988
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f828 {  } ⊢ %_3962 : %_3962
 ; {>  }
; _f828 {  } ⊢ °1◂{  }
; _some %_3962 ⊢ %_3963 : %_3963
 ; {>  %_3962~°1◂{  }:_p788 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3963
 ; {>  %_3963~°0◂°1◂{  }:(_opn)◂(_p788) }
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
	jc LB_6986
	mov rsi,0
	bt r9,0
	jc LB_6986
	jmp LB_6987
LB_6986:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6987:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6988:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6990
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_6989
LB_6990:
	add rsp,8
	ret
LB_6991:
	add rsp,16
	pop r14
LB_6989:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_7010
LB_7009:
	add r14,1
LB_7010:
	cmp r14,r10
	jge LB_7011
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7009
	cmp al,10
	jz LB_7009
	cmp al,32
	jz LB_7009
LB_7011:
	add r14,5
	cmp r14,r10
	jg LB_7014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_7014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_7014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_7014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_7014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_7014
	jmp LB_7015
LB_7014:
	jmp LB_7006
LB_7015:
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
	jc LB_7007
	btr r12,0
	jmp LB_7008
LB_7007:
	bts r12,0
LB_7008:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7003
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f829 {  } ⊢ %_3964 : %_3964
 ; {>  }
; _f829 {  } ⊢ °2◂{  }
; _some %_3964 ⊢ %_3965 : %_3965
 ; {>  %_3964~°2◂{  }:_p788 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_3965
 ; {>  %_3965~°0◂°2◂{  }:(_opn)◂(_p788) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_7001
	mov rsi,0
	bt r9,0
	jc LB_7001
	jmp LB_7002
LB_7001:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7002:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7003:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7005
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7004
LB_7005:
	add rsp,8
	ret
LB_7006:
	add rsp,16
	pop r14
LB_7004:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_7025
LB_7024:
	add r14,1
LB_7025:
	cmp r14,r10
	jge LB_7026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7024
	cmp al,10
	jz LB_7024
	cmp al,32
	jz LB_7024
LB_7026:
	add r14,4
	cmp r14,r10
	jg LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_7029
	jmp LB_7030
LB_7029:
	jmp LB_7021
LB_7030:
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
	jc LB_7022
	btr r12,0
	jmp LB_7023
LB_7022:
	bts r12,0
LB_7023:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7018
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f827 {  } ⊢ %_3966 : %_3966
 ; {>  }
; _f827 {  } ⊢ °0◂{  }
; _some %_3966 ⊢ %_3967 : %_3967
 ; {>  %_3966~°0◂{  }:_p788 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_3967
 ; {>  %_3967~°0◂°0◂{  }:(_opn)◂(_p788) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_7016
	mov rsi,0
	bt r9,0
	jc LB_7016
	jmp LB_7017
LB_7016:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7017:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7020
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7019
LB_7020:
	add rsp,8
	ret
LB_7021:
	add rsp,16
	pop r14
LB_7019:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3644:
NS_E_RDI_3644:
NS_E_3644_ETR_TBL:
NS_E_3644_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_7086
LB_7085:
	add r14,1
LB_7086:
	cmp r14,r10
	jge LB_7087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7085
	cmp al,10
	jz LB_7085
	cmp al,32
	jz LB_7085
LB_7087:
	push r10
	call NS_E_3643_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7088
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7054
LB_7088:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_7065
LB_7064:
	add r14,1
LB_7065:
	cmp r14,r10
	jge LB_7066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7064
	cmp al,10
	jz LB_7064
	cmp al,32
	jz LB_7064
LB_7066:
	push r10
	call NS_E_3646_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7067
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7068
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7068:
	jmp LB_7055
LB_7067:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_7071
LB_7070:
	add r14,1
LB_7071:
	cmp r14,r10
	jge LB_7072
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7070
	cmp al,10
	jz LB_7070
	cmp al,32
	jz LB_7070
LB_7072:
	push r10
	call NS_E_3638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7073
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7074
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7074:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7075
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7075:
	jmp LB_7055
LB_7073:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_7078
LB_7077:
	add r14,1
LB_7078:
	cmp r14,r10
	jge LB_7079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7077
	cmp al,10
	jz LB_7077
	cmp al,32
	jz LB_7077
LB_7079:
	push r10
	call NS_E_3645_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7080
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7081
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7081:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7082
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7082:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7083
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7083:
	jmp LB_7055
LB_7080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7062
	btr r12,3
	jmp LB_7063
LB_7062:
	bts r12,3
LB_7063:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7060
	btr r12,2
	jmp LB_7061
LB_7060:
	bts r12,2
LB_7061:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7058
	btr r12,1
	jmp LB_7059
LB_7058:
	bts r12,1
LB_7059:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7056
	btr r12,0
	jmp LB_7057
LB_7056:
	bts r12,0
LB_7057:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7051
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f824 { %_3969 %_3968 %_3970 %_3971 } ⊢ %_3972 : %_3972
 ; {>  %_3969~1':(_opn)◂(_stg) %_3971~3':(_opn)◂(_p786) %_3970~2':_p789 %_3968~0':_p788 }
; _f824 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_3972 ⊢ %_3973 : %_3973
 ; {>  %_3972~°1◂{ 1' 0' 2' 3' }:_p786 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_3973
 ; {>  %_3973~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p786) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_7031
	btr r12,4
	jmp LB_7032
LB_7031:
	bts r12,4
LB_7032:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_7037
	btr r12,5
	jmp LB_7038
LB_7037:
	bts r12,5
LB_7038:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_7035
	btr QWORD [rdi],0
	jmp LB_7036
LB_7035:
	bts QWORD [rdi],0
LB_7036:
	mov r11,r13
	bt r12,0
	jc LB_7041
	btr r12,5
	jmp LB_7042
LB_7041:
	bts r12,5
LB_7042:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_7039
	btr QWORD [rdi],1
	jmp LB_7040
LB_7039:
	bts QWORD [rdi],1
LB_7040:
	mov r11,r8
	bt r12,2
	jc LB_7045
	btr r12,5
	jmp LB_7046
LB_7045:
	bts r12,5
LB_7046:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_7043
	btr QWORD [rdi],2
	jmp LB_7044
LB_7043:
	bts QWORD [rdi],2
LB_7044:
	mov r11,r10
	bt r12,4
	jc LB_7049
	btr r12,5
	jmp LB_7050
LB_7049:
	bts r12,5
LB_7050:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_7047
	btr QWORD [rdi],3
	jmp LB_7048
LB_7047:
	bts QWORD [rdi],3
LB_7048:
	mov rsi,1
	bt r12,3
	jc LB_7033
	mov rsi,0
	bt r9,0
	jc LB_7033
	jmp LB_7034
LB_7033:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7034:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7051:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7053
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7052
LB_7053:
	add rsp,8
	ret
LB_7055:
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
LB_7054:
	add rsp,64
	pop r14
LB_7052:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; grm_ord
	jmp LB_7129
LB_7128:
	add r14,1
LB_7129:
	cmp r14,r10
	jge LB_7130
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7128
	cmp al,10
	jz LB_7128
	cmp al,32
	jz LB_7128
LB_7130:
	push r10
	call NS_E_3642_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7131
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7117
LB_7131:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_7134
LB_7133:
	add r14,1
LB_7134:
	cmp r14,r10
	jge LB_7135
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7133
	cmp al,10
	jz LB_7133
	cmp al,32
	jz LB_7133
LB_7135:
	push r10
	call NS_E_3646_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7136
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7137
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7137:
	jmp LB_7117
LB_7136:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_7140
LB_7139:
	add r14,1
LB_7140:
	cmp r14,r10
	jge LB_7141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7139
	cmp al,10
	jz LB_7139
	cmp al,32
	jz LB_7139
LB_7141:
	push r10
	call NS_E_3638_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7142
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7143
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7143:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7144
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7144:
	jmp LB_7117
LB_7142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_7147
LB_7146:
	add r14,1
LB_7147:
	cmp r14,r10
	jge LB_7148
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7146
	cmp al,10
	jz LB_7146
	cmp al,32
	jz LB_7146
LB_7148:
	push r10
	call NS_E_3645_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7149
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7150
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7150:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7151
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7151:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7152
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7152:
	jmp LB_7117
LB_7149:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_7155
LB_7154:
	add r14,1
LB_7155:
	cmp r14,r10
	jge LB_7156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7154
	cmp al,10
	jz LB_7154
	cmp al,32
	jz LB_7154
LB_7156:
	push r10
	call NS_E_3644_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7157
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7158
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7158:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7159
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7159:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7160
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7160:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7161
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7161:
	jmp LB_7117
LB_7157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7126
	btr r12,4
	jmp LB_7127
LB_7126:
	bts r12,4
LB_7127:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7124
	btr r12,3
	jmp LB_7125
LB_7124:
	bts r12,3
LB_7125:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7122
	btr r12,2
	jmp LB_7123
LB_7122:
	bts r12,2
LB_7123:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7120
	btr r12,1
	jmp LB_7121
LB_7120:
	bts r12,1
LB_7121:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7118
	btr r12,0
	jmp LB_7119
LB_7118:
	bts r12,0
LB_7119:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7114
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f823 { %_3975 %_3974 %_3976 %_3977 %_3978 } ⊢ %_3979 : %_3979
 ; {>  %_3976~2':_p789 %_3978~4':_p786 %_3977~3':(_opn)◂(_p786) %_3974~0':_p788 %_3975~1':(_opn)◂(_stg) }
; _f823 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_3979 ⊢ %_3980 : %_3980
 ; {>  %_3979~°0◂{ 1' 0' 2' 3' 4' }:_p786 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_3980
 ; {>  %_3980~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p786) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_7090
	btr r12,5
	jmp LB_7091
LB_7090:
	bts r12,5
LB_7091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_7096
	btr r12,6
	jmp LB_7097
LB_7096:
	bts r12,6
LB_7097:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_7094
	btr QWORD [rdi],0
	jmp LB_7095
LB_7094:
	bts QWORD [rdi],0
LB_7095:
	mov rcx,r13
	bt r12,0
	jc LB_7100
	btr r12,6
	jmp LB_7101
LB_7100:
	bts r12,6
LB_7101:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_7098
	btr QWORD [rdi],1
	jmp LB_7099
LB_7098:
	bts QWORD [rdi],1
LB_7099:
	mov rcx,r8
	bt r12,2
	jc LB_7104
	btr r12,6
	jmp LB_7105
LB_7104:
	bts r12,6
LB_7105:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_7102
	btr QWORD [rdi],2
	jmp LB_7103
LB_7102:
	bts QWORD [rdi],2
LB_7103:
	mov rcx,r11
	bt r12,5
	jc LB_7108
	btr r12,6
	jmp LB_7109
LB_7108:
	bts r12,6
LB_7109:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_7106
	btr QWORD [rdi],3
	jmp LB_7107
LB_7106:
	bts QWORD [rdi],3
LB_7107:
	mov rcx,r10
	bt r12,4
	jc LB_7112
	btr r12,6
	jmp LB_7113
LB_7112:
	bts r12,6
LB_7113:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_7110
	btr QWORD [rdi],4
	jmp LB_7111
LB_7110:
	bts QWORD [rdi],4
LB_7111:
	mov rsi,1
	bt r12,3
	jc LB_7092
	mov rsi,0
	bt r9,0
	jc LB_7092
	jmp LB_7093
LB_7092:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7093:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7114:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7116
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7115
LB_7116:
	add rsp,8
	ret
LB_7117:
	add rsp,80
	pop r14
LB_7115:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3645:
NS_E_RDI_3645:
NS_E_3645_ETR_TBL:
NS_E_3645_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_7176
LB_7175:
	add r14,1
LB_7176:
	cmp r14,r10
	jge LB_7177
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7175
	cmp al,10
	jz LB_7175
	cmp al,32
	jz LB_7175
LB_7177:
	add r14,1
	cmp r14,r10
	jg LB_7180
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_7180
	jmp LB_7181
LB_7180:
	jmp LB_7170
LB_7181:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_7183
LB_7182:
	add r14,1
LB_7183:
	cmp r14,r10
	jge LB_7184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7182
	cmp al,10
	jz LB_7182
	cmp al,32
	jz LB_7182
LB_7184:
	push r10
	call NS_E_3644_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7185
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7186:
	jmp LB_7170
LB_7185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7173
	btr r12,1
	jmp LB_7174
LB_7173:
	bts r12,1
LB_7174:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7171
	btr r12,0
	jmp LB_7172
LB_7171:
	bts r12,0
LB_7172:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7167
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7188
	btr r12,2
	jmp LB_7189
LB_7188:
	bts r12,2
LB_7189:
	mov r13,r14
	bt r12,1
	jc LB_7190
	btr r12,0
	jmp LB_7191
LB_7190:
	bts r12,0
LB_7191:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3981 ⊢ %_3982 : %_3982
 ; {>  %_3981~0':_p786 }
; _some 0' ⊢ °0◂0'
; _some %_3982 ⊢ %_3983 : %_3983
 ; {>  %_3982~°0◂0':(_opn)◂(_p786) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3983
 ; {>  %_3983~°0◂°0◂0':(_opn)◂((_opn)◂(_p786)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7165
	btr r12,3
	jmp LB_7166
LB_7165:
	bts r12,3
LB_7166:
	mov rsi,1
	bt r12,3
	jc LB_7163
	mov rsi,0
	bt r9,0
	jc LB_7163
	jmp LB_7164
LB_7163:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7164:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7167:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7169
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7168
LB_7169:
	add rsp,8
	ret
LB_7170:
	add rsp,32
	pop r14
LB_7168:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_7194
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_3984 : %_3984
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_3984 ⊢ %_3985 : %_3985
 ; {>  %_3984~°1◂{  }:(_opn)◂(t1941'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3985
 ; {>  %_3985~°0◂°1◂{  }:(_opn)◂((_opn)◂(t1944'(0))) }
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
	jc LB_7192
	mov rsi,0
	bt r9,0
	jc LB_7192
	jmp LB_7193
LB_7192:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7193:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7194:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7196
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7195
LB_7196:
	add rsp,8
	ret
LB_7197:
	add rsp,0
	pop r14
LB_7195:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3646:
NS_E_RDI_3646:
NS_E_3646_ETR_TBL:
NS_E_3646_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_7211
LB_7210:
	add r14,1
LB_7211:
	cmp r14,r10
	jge LB_7212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7210
	cmp al,10
	jz LB_7210
	cmp al,32
	jz LB_7210
LB_7212:
	push r10
	call NS_E_546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7213
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7205
LB_7213:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_7216
LB_7215:
	add r14,1
LB_7216:
	cmp r14,r10
	jge LB_7217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7215
	cmp al,10
	jz LB_7215
	cmp al,32
	jz LB_7215
LB_7217:
	add r14,1
	cmp r14,r10
	jg LB_7221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_7221
	jmp LB_7222
LB_7221:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7219:
	jmp LB_7205
LB_7222:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7208
	btr r12,1
	jmp LB_7209
LB_7208:
	bts r12,1
LB_7209:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7206
	btr r12,0
	jmp LB_7207
LB_7206:
	bts r12,0
LB_7207:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7202
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_3986 ⊢ %_3987 : %_3987
 ; {>  %_3986~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_3987 ⊢ %_3988 : %_3988
 ; {>  %_3987~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3988
 ; {>  %_3988~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7200
	btr r12,3
	jmp LB_7201
LB_7200:
	bts r12,3
LB_7201:
	mov rsi,1
	bt r12,3
	jc LB_7198
	mov rsi,0
	bt r9,0
	jc LB_7198
	jmp LB_7199
LB_7198:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7199:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7202:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7204
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7203
LB_7204:
	add rsp,8
	ret
LB_7205:
	add rsp,32
	pop r14
LB_7203:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_7225
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_3989 : %_3989
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_3989 ⊢ %_3990 : %_3990
 ; {>  %_3989~°1◂{  }:(_opn)◂(t1953'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3990
 ; {>  %_3990~°0◂°1◂{  }:(_opn)◂((_opn)◂(t1956'(0))) }
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
	jc LB_7223
	mov rsi,0
	bt r9,0
	jc LB_7223
	jmp LB_7224
LB_7223:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7224:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7227
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_7226
LB_7227:
	add rsp,8
	ret
LB_7228:
	add rsp,0
	pop r14
LB_7226:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_7272:
NS_E_RDI_7272:
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
; » 0xr0 |~ {  } ⊢ %_7230 : %_7230
 ; {>  %_7229~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_7230
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_7231 : %_7231
 ; {>  %_7230~1':_r64 %_7229~0':_stg }
; 	» _args _ ⊢ 2' : %_7231
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r8,rax
	btr r12,2
MTC_LB_7273:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7274
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
	jnc LB_7275
	bt QWORD [rax],0
	jc LB_7276
	btr r12,5
	jmp LB_7277
LB_7276:
	bts r12,5
LB_7277:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_7275:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_7280
	btr r12,6
	jmp LB_7281
LB_7280:
	bts r12,6
LB_7281:
	mov r9,rcx
	bt r12,6
	jc LB_7278
	btr r12,3
	jmp LB_7279
LB_7278:
	bts r12,3
LB_7279:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_7284
	btr r12,6
	jmp LB_7285
LB_7284:
	bts r12,6
LB_7285:
	mov r10,rcx
	bt r12,6
	jc LB_7282
	btr r12,4
	jmp LB_7283
LB_7282:
	bts r12,4
LB_7283:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7274
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
	jnc LB_7286
	bt QWORD [rax],0
	jc LB_7287
	btr r12,7
	jmp LB_7288
LB_7287:
	bts r12,7
LB_7288:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_7286:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_7291
	btr r12,8
	jmp LB_7292
LB_7291:
	bts r12,8
LB_7292:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7289
	btr r12,5
	jmp LB_7290
LB_7289:
	bts r12,5
LB_7290:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_7295
	btr r12,8
	jmp LB_7296
LB_7295:
	bts r12,8
LB_7296:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7293
	btr r12,6
	jmp LB_7294
LB_7293:
	bts r12,6
LB_7294:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_7274
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_7297
	bt QWORD [rax],0
	jc LB_7298
	btr r12,7
	jmp LB_7299
LB_7298:
	bts r12,7
LB_7299:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_7297:
	mov rdx,rax
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_7300:
	cmp r15,0
	jz LB_7301
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7300
LB_7301:
; _f25 %_7234 ⊢ { %_7236 %_7237 } : { %_7236 %_7237 }
 ; {>  %_7230~1':_r64 %_7232~3':_stg %_7229~0':_stg %_7234~5':_stg }
; _f25 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_7308
	btr r12,0
	jmp LB_7309
LB_7308:
	bts r12,0
LB_7309:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_7310
	btr r12,2
	jmp LB_7311
LB_7310:
	bts r12,2
LB_7311:
	mov r10,r14
	bt r12,1
	jc LB_7312
	btr r12,4
	jmp LB_7313
LB_7312:
	bts r12,4
LB_7313:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_7306
	btr r12,3
	jmp LB_7307
LB_7306:
	bts r12,3
LB_7307:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7304
	btr r12,1
	jmp LB_7305
LB_7304:
	bts r12,1
LB_7305:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7302
	btr r12,0
	jmp LB_7303
LB_7302:
	bts r12,0
LB_7303:
	add rsp,32
; _f2496 %_7237 ⊢ { %_7238 %_7239 } : { %_7238 %_7239 }
 ; {>  %_7236~2':_stg %_7237~4':_stg %_7230~1':_r64 %_7232~3':_stg %_7229~0':_stg }
; _f2496 4' ⊢ { 4' 5' }
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
	jc LB_7322
	btr r12,0
	jmp LB_7323
LB_7322:
	bts r12,0
LB_7323:
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_7324
	btr r12,4
	jmp LB_7325
LB_7324:
	bts r12,4
LB_7325:
	mov r11,r14
	bt r12,1
	jc LB_7326
	btr r12,5
	jmp LB_7327
LB_7326:
	bts r12,5
LB_7327:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7320
	btr r12,3
	jmp LB_7321
LB_7320:
	bts r12,3
LB_7321:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7318
	btr r12,2
	jmp LB_7319
LB_7318:
	bts r12,2
LB_7319:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7316
	btr r12,1
	jmp LB_7317
LB_7316:
	bts r12,1
LB_7317:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7314
	btr r12,0
	jmp LB_7315
LB_7314:
	bts r12,0
LB_7315:
	add rsp,40
MTC_LB_7328:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7329
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
	jnc LB_7330
	bt QWORD [rax],0
	jc LB_7331
	btr r12,7
	jmp LB_7332
LB_7331:
	bts r12,7
LB_7332:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_7330:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_7333
	btr r12,6
	jmp LB_7334
LB_7333:
	bts r12,6
LB_7334:
LB_7335:
	cmp r15,0
	jz LB_7336
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7335
LB_7336:
; » 0xr0 |~ {  } ⊢ %_7241 : %_7241
 ; {>  %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7240~6':_stg %_7238~4':_stg %_7229~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_7241
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f3606 { %_7240 %_7241 } ⊢ { %_7242 %_7243 %_7244 } : { %_7242 %_7243 %_7244 }
 ; {>  %_7236~2':_stg %_7241~5':_r64 %_7230~1':_r64 %_7232~3':_stg %_7240~6':_stg %_7238~4':_stg %_7229~0':_stg }
; _f3606 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_7347
	btr r12,0
	jmp LB_7348
LB_7347:
	bts r12,0
LB_7348:
	mov r14,r11
	bt r12,5
	jc LB_7349
	btr r12,1
	jmp LB_7350
LB_7349:
	bts r12,1
LB_7350:
	call NS_E_3606
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_7351
	btr r12,5
	jmp LB_7352
LB_7351:
	bts r12,5
LB_7352:
	mov rcx,r14
	bt r12,1
	jc LB_7353
	btr r12,6
	jmp LB_7354
LB_7353:
	bts r12,6
LB_7354:
	mov rdx,r9
	bt r12,3
	jc LB_7357
	btr r12,7
	jmp LB_7358
LB_7357:
	bts r12,7
LB_7358:
	mov rsi,1
	bt r12,7
	jc LB_7355
	mov rsi,0
	bt rdx,0
	jc LB_7355
	jmp LB_7356
LB_7355:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_7356:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7345
	btr r12,4
	jmp LB_7346
LB_7345:
	bts r12,4
LB_7346:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7343
	btr r12,3
	jmp LB_7344
LB_7343:
	bts r12,3
LB_7344:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7341
	btr r12,2
	jmp LB_7342
LB_7341:
	bts r12,2
LB_7342:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7339
	btr r12,1
	jmp LB_7340
LB_7339:
	bts r12,1
LB_7340:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7337
	btr r12,0
	jmp LB_7338
LB_7337:
	bts r12,0
LB_7338:
	add rsp,48
MTC_LB_7359:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7360
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rdx
	bt QWORD [rax],17
	jnc LB_7361
	bt QWORD [rax],0
	jc LB_7362
	btr r12,9
	jmp LB_7363
LB_7362:
	bts r12,9
LB_7363:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_7361:
	mov QWORD [st_vct+8*9],rax
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_7364
	btr r12,8
	jmp LB_7365
LB_7364:
	bts r12,8
LB_7365:
LB_7366:
	cmp r15,0
	jz LB_7367
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7366
LB_7367:
; _f926 %_7245 ⊢ %_7246 : %_7246
 ; {>  %_7245~8':(_lst)◂(_p781) %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7243~6':_r64 %_7238~4':_stg %_7229~0':_stg %_7242~5':_stg }
; _f926 8' ⊢ 7'
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7382
	btr r12,0
	jmp LB_7383
LB_7382:
	bts r12,0
LB_7383:
	call NS_E_926
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 7'
	mov rdx,r13
	bt r12,0
	jc LB_7384
	btr r12,7
	jmp LB_7385
LB_7384:
	bts r12,7
LB_7385:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_7380
	btr r12,6
	jmp LB_7381
LB_7380:
	bts r12,6
LB_7381:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_7378
	btr r12,5
	jmp LB_7379
LB_7378:
	bts r12,5
LB_7379:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7376
	btr r12,4
	jmp LB_7377
LB_7376:
	bts r12,4
LB_7377:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7374
	btr r12,3
	jmp LB_7375
LB_7374:
	bts r12,3
LB_7375:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7372
	btr r12,2
	jmp LB_7373
LB_7372:
	bts r12,2
LB_7373:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7370
	btr r12,1
	jmp LB_7371
LB_7370:
	bts r12,1
LB_7371:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7368
	btr r12,0
	jmp LB_7369
LB_7368:
	bts r12,0
LB_7369:
	add rsp,64
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,rdx
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "START\n"
	mov rsi,0x_53
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_41
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,rdx
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "END\n"
	mov rsi,0x_45
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov QWORD [st_vct+8*8],rax
	btr r12,8
; _f26 %_7248 ⊢ %_7249 : %_7249
 ; {>  %_7247~7':_stg %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7243~6':_r64 %_7238~4':_stg %_7229~0':_stg %_7242~5':_stg %_7248~8':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7402
	btr r12,0
	jmp LB_7403
LB_7402:
	bts r12,0
LB_7403:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_7404
	btr r12,8
	jmp LB_7405
LB_7404:
	bts r12,8
LB_7405:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_7400
	btr r12,7
	jmp LB_7401
LB_7400:
	bts r12,7
LB_7401:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_7398
	btr r12,6
	jmp LB_7399
LB_7398:
	bts r12,6
LB_7399:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_7396
	btr r12,5
	jmp LB_7397
LB_7396:
	bts r12,5
LB_7397:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7394
	btr r12,4
	jmp LB_7395
LB_7394:
	bts r12,4
LB_7395:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7392
	btr r12,3
	jmp LB_7393
LB_7392:
	bts r12,3
LB_7393:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7390
	btr r12,2
	jmp LB_7391
LB_7390:
	bts r12,2
LB_7391:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7388
	btr r12,1
	jmp LB_7389
LB_7388:
	bts r12,1
LB_7389:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7386
	btr r12,0
	jmp LB_7387
LB_7386:
	bts r12,0
LB_7387:
	add rsp,72
; ∎ {  }
 ; {>  %_7247~7':_stg %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7243~6':_r64 %_7238~4':_stg %_7229~0':_stg %_7242~5':_stg %_7249~8':_stg }
; 	∎ {  }
	bt r12,7
	jc LB_7406
	mov rdi,rdx
	call dlt
LB_7406:
	bt r12,2
	jc LB_7407
	mov rdi,r8
	call dlt
LB_7407:
	bt r12,1
	jc LB_7408
	mov rdi,r14
	call dlt
LB_7408:
	bt r12,3
	jc LB_7409
	mov rdi,r9
	call dlt
LB_7409:
	bt r12,6
	jc LB_7410
	mov rdi,rcx
	call dlt
LB_7410:
	bt r12,4
	jc LB_7411
	mov rdi,r10
	call dlt
LB_7411:
	bt r12,0
	jc LB_7412
	mov rdi,r13
	call dlt
LB_7412:
	bt r12,5
	jc LB_7413
	mov rdi,r11
	call dlt
LB_7413:
	bt r12,8
	jc LB_7414
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_7414:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_7360:
	mov r15,0
LB_7416:
	cmp r15,0
	jz LB_7417
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7416
LB_7417:
; 	» "H0\n" _ ⊢ 8' : %_7250
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f26 %_7250 ⊢ %_7251 : %_7251
 ; {>  %_7250~8':_stg %_7244~7':(_opn)◂((_lst)◂(_p781)) %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7243~6':_r64 %_7238~4':_stg %_7229~0':_stg %_7242~5':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7434
	btr r12,0
	jmp LB_7435
LB_7434:
	bts r12,0
LB_7435:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_7436
	btr r12,8
	jmp LB_7437
LB_7436:
	bts r12,8
LB_7437:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_7432
	btr r12,7
	jmp LB_7433
LB_7432:
	bts r12,7
LB_7433:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_7430
	btr r12,6
	jmp LB_7431
LB_7430:
	bts r12,6
LB_7431:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_7428
	btr r12,5
	jmp LB_7429
LB_7428:
	bts r12,5
LB_7429:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7426
	btr r12,4
	jmp LB_7427
LB_7426:
	bts r12,4
LB_7427:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7424
	btr r12,3
	jmp LB_7425
LB_7424:
	bts r12,3
LB_7425:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7422
	btr r12,2
	jmp LB_7423
LB_7422:
	bts r12,2
LB_7423:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7420
	btr r12,1
	jmp LB_7421
LB_7420:
	bts r12,1
LB_7421:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7418
	btr r12,0
	jmp LB_7419
LB_7418:
	bts r12,0
LB_7419:
	add rsp,72
; ∎ {  }
 ; {>  %_7244~7':(_opn)◂((_lst)◂(_p781)) %_7236~2':_stg %_7251~8':_stg %_7230~1':_r64 %_7232~3':_stg %_7243~6':_r64 %_7238~4':_stg %_7229~0':_stg %_7242~5':_stg }
; 	∎ {  }
	bt r12,7
	jc LB_7438
	mov rdi,rdx
	call dlt
LB_7438:
	bt r12,2
	jc LB_7439
	mov rdi,r8
	call dlt
LB_7439:
	bt r12,8
	jc LB_7440
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_7440:
	bt r12,1
	jc LB_7441
	mov rdi,r14
	call dlt
LB_7441:
	bt r12,3
	jc LB_7442
	mov rdi,r9
	call dlt
LB_7442:
	bt r12,6
	jc LB_7443
	mov rdi,rcx
	call dlt
LB_7443:
	bt r12,4
	jc LB_7444
	mov rdi,r10
	call dlt
LB_7444:
	bt r12,0
	jc LB_7445
	mov rdi,r13
	call dlt
LB_7445:
	bt r12,5
	jc LB_7446
	mov rdi,r11
	call dlt
LB_7446:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_7415:
MTC_LB_7329:
	mov r15,0
LB_7448:
	cmp r15,0
	jz LB_7449
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7448
LB_7449:
; 	» "H1\n" _ ⊢ 6' : %_7252
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f26 %_7252 ⊢ %_7253 : %_7253
 ; {>  %_7252~6':_stg %_7239~5':(_opn)◂(_stg) %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7238~4':_stg %_7229~0':_stg }
; _f26 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_7462
	btr r12,0
	jmp LB_7463
LB_7462:
	bts r12,0
LB_7463:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_7464
	btr r12,6
	jmp LB_7465
LB_7464:
	bts r12,6
LB_7465:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_7460
	btr r12,5
	jmp LB_7461
LB_7460:
	bts r12,5
LB_7461:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7458
	btr r12,4
	jmp LB_7459
LB_7458:
	bts r12,4
LB_7459:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7456
	btr r12,3
	jmp LB_7457
LB_7456:
	bts r12,3
LB_7457:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7454
	btr r12,2
	jmp LB_7455
LB_7454:
	bts r12,2
LB_7455:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7452
	btr r12,1
	jmp LB_7453
LB_7452:
	bts r12,1
LB_7453:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7450
	btr r12,0
	jmp LB_7451
LB_7450:
	bts r12,0
LB_7451:
	add rsp,56
; ∎ {  }
 ; {>  %_7239~5':(_opn)◂(_stg) %_7236~2':_stg %_7230~1':_r64 %_7232~3':_stg %_7253~6':_stg %_7238~4':_stg %_7229~0':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_7466
	mov rdi,r11
	call dlt
LB_7466:
	bt r12,2
	jc LB_7467
	mov rdi,r8
	call dlt
LB_7467:
	bt r12,1
	jc LB_7468
	mov rdi,r14
	call dlt
LB_7468:
	bt r12,3
	jc LB_7469
	mov rdi,r9
	call dlt
LB_7469:
	bt r12,6
	jc LB_7470
	mov rdi,rcx
	call dlt
LB_7470:
	bt r12,4
	jc LB_7471
	mov rdi,r10
	call dlt
LB_7471:
	bt r12,0
	jc LB_7472
	mov rdi,r13
	call dlt
LB_7472:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_7447:
MTC_LB_7274:
	mov r15,0
LB_7474:
	cmp r15,0
	jz LB_7475
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7474
LB_7475:
; _f3606 { %_7229 %_7230 } ⊢ { %_7254 %_7255 %_7256 } : { %_7254 %_7255 %_7256 }
 ; {>  %_7231~2':(_lst)◂(_stg) %_7230~1':_r64 %_7229~0':_stg }
; _f3606 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3606
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_7478
	btr r12,4
	jmp LB_7479
LB_7478:
	bts r12,4
LB_7479:
	mov r9,r10
	bt r12,4
	jc LB_7482
	btr r12,3
	jmp LB_7483
LB_7482:
	bts r12,3
LB_7483:
	mov rsi,1
	bt r12,3
	jc LB_7480
	mov rsi,0
	bt r9,0
	jc LB_7480
	jmp LB_7481
LB_7480:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7481:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_7476
	btr r12,2
	jmp LB_7477
LB_7476:
	bts r12,2
LB_7477:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_7257
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_7257 ⊢ { %_7258 %_7259 } : { %_7258 %_7259 }
 ; {>  %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7257~4':_stg %_7254~0':_stg }
; _f25 4' ⊢ { 4' 5' }
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
	jc LB_7492
	btr r12,0
	jmp LB_7493
LB_7492:
	bts r12,0
LB_7493:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_7494
	btr r12,4
	jmp LB_7495
LB_7494:
	bts r12,4
LB_7495:
	mov r11,r14
	bt r12,1
	jc LB_7496
	btr r12,5
	jmp LB_7497
LB_7496:
	bts r12,5
LB_7497:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7490
	btr r12,3
	jmp LB_7491
LB_7490:
	bts r12,3
LB_7491:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7488
	btr r12,2
	jmp LB_7489
LB_7488:
	bts r12,2
LB_7489:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7486
	btr r12,1
	jmp LB_7487
LB_7486:
	bts r12,1
LB_7487:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7484
	btr r12,0
	jmp LB_7485
LB_7484:
	bts r12,0
LB_7485:
	add rsp,40
; _f26 { %_7258 %_7259 } ⊢ { %_7260 %_7261 } : { %_7260 %_7261 }
 ; {>  %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7258~4':_stg %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7259~5':_stg %_7254~0':_stg }
; _f26 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_7508
	btr r12,1
	jmp LB_7509
LB_7508:
	bts r12,1
LB_7509:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7506
	btr QWORD [rdi],0
	jmp LB_7507
LB_7506:
	bts QWORD [rdi],0
LB_7507:
	mov r14,r11
	bt r12,5
	jc LB_7512
	btr r12,1
	jmp LB_7513
LB_7512:
	bts r12,1
LB_7513:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7510
	btr QWORD [rdi],1
	jmp LB_7511
LB_7510:
	bts QWORD [rdi],1
LB_7511:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_7516
	btr r12,1
	jmp LB_7517
LB_7516:
	bts r12,1
LB_7517:
	mov r10,r14
	bt r12,1
	jc LB_7514
	btr r12,4
	jmp LB_7515
LB_7514:
	bts r12,4
LB_7515:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_7520
	btr r12,1
	jmp LB_7521
LB_7520:
	bts r12,1
LB_7521:
	mov r11,r14
	bt r12,1
	jc LB_7518
	btr r12,5
	jmp LB_7519
LB_7518:
	bts r12,5
LB_7519:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7504
	btr r12,3
	jmp LB_7505
LB_7504:
	bts r12,3
LB_7505:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7502
	btr r12,2
	jmp LB_7503
LB_7502:
	bts r12,2
LB_7503:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7500
	btr r12,1
	jmp LB_7501
LB_7500:
	bts r12,1
LB_7501:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7498
	btr r12,0
	jmp LB_7499
LB_7498:
	bts r12,0
LB_7499:
	add rsp,40
; _f2496 %_7261 ⊢ { %_7262 %_7263 } : { %_7262 %_7263 }
 ; {>  %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7260~4':_stg %_7261~5':_stg %_7254~0':_stg }
; _f2496 5' ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_7532
	btr r12,0
	jmp LB_7533
LB_7532:
	bts r12,0
LB_7533:
	call NS_E_2496
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_7534
	btr r12,5
	jmp LB_7535
LB_7534:
	bts r12,5
LB_7535:
	mov rcx,r14
	bt r12,1
	jc LB_7536
	btr r12,6
	jmp LB_7537
LB_7536:
	bts r12,6
LB_7537:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7530
	btr r12,4
	jmp LB_7531
LB_7530:
	bts r12,4
LB_7531:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7528
	btr r12,3
	jmp LB_7529
LB_7528:
	bts r12,3
LB_7529:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7526
	btr r12,2
	jmp LB_7527
LB_7526:
	bts r12,2
LB_7527:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7524
	btr r12,1
	jmp LB_7525
LB_7524:
	bts r12,1
LB_7525:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7522
	btr r12,0
	jmp LB_7523
LB_7522:
	bts r12,0
LB_7523:
	add rsp,48
MTC_LB_7538:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_7539
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_7540
	bt QWORD [rax],0
	jc LB_7541
	btr r12,8
	jmp LB_7542
LB_7541:
	bts r12,8
LB_7542:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_7540:
	mov QWORD [st_vct+8*8],rax
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7543
	btr r12,7
	jmp LB_7544
LB_7543:
	bts r12,7
LB_7544:
LB_7545:
	cmp r15,0
	jz LB_7546
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7545
LB_7546:
; » 0xr0 |~ {  } ⊢ %_7265 : %_7265
 ; {>  %_7264~7':_stg %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7262~5':_stg %_7260~4':_stg %_7254~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_7265
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f3606 { %_7264 %_7265 } ⊢ { %_7266 %_7267 %_7268 } : { %_7266 %_7267 %_7268 }
 ; {>  %_7264~7':_stg %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7262~5':_stg %_7260~4':_stg %_7265~6':_r64 %_7254~0':_stg }
; _f3606 { 7' 6' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000000110.. |},{ 7' 6' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_7559
	btr r12,0
	jmp LB_7560
LB_7559:
	bts r12,0
LB_7560:
	mov r14,rcx
	bt r12,6
	jc LB_7561
	btr r12,1
	jmp LB_7562
LB_7561:
	bts r12,1
LB_7562:
	call NS_E_3606
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_7563
	btr r12,6
	jmp LB_7564
LB_7563:
	bts r12,6
LB_7564:
	mov rdx,r14
	bt r12,1
	jc LB_7565
	btr r12,7
	jmp LB_7566
LB_7565:
	bts r12,7
LB_7566:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_7569
	btr r12,8
	jmp LB_7570
LB_7569:
	bts r12,8
LB_7570:
	mov rsi,1
	bt r12,8
	jc LB_7567
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_7567
	jmp LB_7568
LB_7567:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_7568:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_7557
	btr r12,5
	jmp LB_7558
LB_7557:
	bts r12,5
LB_7558:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7555
	btr r12,4
	jmp LB_7556
LB_7555:
	bts r12,4
LB_7556:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7553
	btr r12,3
	jmp LB_7554
LB_7553:
	bts r12,3
LB_7554:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7551
	btr r12,2
	jmp LB_7552
LB_7551:
	bts r12,2
LB_7552:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7549
	btr r12,1
	jmp LB_7550
LB_7549:
	bts r12,1
LB_7550:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7547
	btr r12,0
	jmp LB_7548
LB_7547:
	bts r12,0
LB_7548:
	add rsp,56
; _f26 { %_7266 %_7267 %_7268 } ⊢ { %_7269 %_7270 %_7271 } : { %_7269 %_7270 %_7271 }
 ; {>  %_7266~6':_stg %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7268~8':(_opn)◂((_lst)◂(_p781)) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7262~5':_stg %_7260~4':_stg %_7267~7':_r64 %_7254~0':_stg }
; _f26 { 6' 7' 8' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000001110.. |},{ 6' 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_7585
	btr r12,1
	jmp LB_7586
LB_7585:
	bts r12,1
LB_7586:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7583
	btr QWORD [rdi],0
	jmp LB_7584
LB_7583:
	bts QWORD [rdi],0
LB_7584:
	mov r14,rdx
	bt r12,7
	jc LB_7589
	btr r12,1
	jmp LB_7590
LB_7589:
	bts r12,1
LB_7590:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7587
	btr QWORD [rdi],1
	jmp LB_7588
LB_7587:
	bts QWORD [rdi],1
LB_7588:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_7593
	btr r12,1
	jmp LB_7594
LB_7593:
	bts r12,1
LB_7594:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_7591
	btr QWORD [rdi],2
	jmp LB_7592
LB_7591:
	bts QWORD [rdi],2
LB_7592:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_7597
	btr r12,1
	jmp LB_7598
LB_7597:
	bts r12,1
LB_7598:
	mov rcx,r14
	bt r12,1
	jc LB_7595
	btr r12,6
	jmp LB_7596
LB_7595:
	bts r12,6
LB_7596:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_7601
	btr r12,1
	jmp LB_7602
LB_7601:
	bts r12,1
LB_7602:
	mov rdx,r14
	bt r12,1
	jc LB_7599
	btr r12,7
	jmp LB_7600
LB_7599:
	bts r12,7
LB_7600:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_7605
	btr r12,1
	jmp LB_7606
LB_7605:
	bts r12,1
LB_7606:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_7603
	btr r12,8
	jmp LB_7604
LB_7603:
	bts r12,8
LB_7604:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_7581
	btr r12,5
	jmp LB_7582
LB_7581:
	bts r12,5
LB_7582:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_7579
	btr r12,4
	jmp LB_7580
LB_7579:
	bts r12,4
LB_7580:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_7577
	btr r12,3
	jmp LB_7578
LB_7577:
	bts r12,3
LB_7578:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_7575
	btr r12,2
	jmp LB_7576
LB_7575:
	bts r12,2
LB_7576:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_7573
	btr r12,1
	jmp LB_7574
LB_7573:
	bts r12,1
LB_7574:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_7571
	btr r12,0
	jmp LB_7572
LB_7571:
	bts r12,0
LB_7572:
	add rsp,56
; ∎ {  }
 ; {>  %_7271~8':(_opn)◂((_lst)◂(_p781)) %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7262~5':_stg %_7260~4':_stg %_7270~7':_r64 %_7269~6':_stg %_7254~0':_stg }
; 	∎ {  }
	bt r12,8
	jc LB_7607
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_7607:
	bt r12,1
	jc LB_7608
	mov rdi,r14
	call dlt
LB_7608:
	bt r12,2
	jc LB_7609
	mov rdi,r8
	call dlt
LB_7609:
	bt r12,3
	jc LB_7610
	mov rdi,r9
	call dlt
LB_7610:
	bt r12,5
	jc LB_7611
	mov rdi,r11
	call dlt
LB_7611:
	bt r12,4
	jc LB_7612
	mov rdi,r10
	call dlt
LB_7612:
	bt r12,7
	jc LB_7613
	mov rdi,rdx
	call dlt
LB_7613:
	bt r12,6
	jc LB_7614
	mov rdi,rcx
	call dlt
LB_7614:
	bt r12,0
	jc LB_7615
	mov rdi,r13
	call dlt
LB_7615:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_7539:
	mov r15,0
LB_7617:
	cmp r15,0
	jz LB_7618
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7617
LB_7618:
; ∎ {  }
 ; {>  %_7255~1':_r64 %_7231~2':(_lst)◂(_stg) %_7256~3':(_opn)◂((_lst)◂(_p781)) %_7262~5':_stg %_7260~4':_stg %_7263~6':(_opn)◂(_stg) %_7254~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_7619
	mov rdi,r14
	call dlt
LB_7619:
	bt r12,2
	jc LB_7620
	mov rdi,r8
	call dlt
LB_7620:
	bt r12,3
	jc LB_7621
	mov rdi,r9
	call dlt
LB_7621:
	bt r12,5
	jc LB_7622
	mov rdi,r11
	call dlt
LB_7622:
	bt r12,4
	jc LB_7623
	mov rdi,r10
	call dlt
LB_7623:
	bt r12,6
	jc LB_7624
	mov rdi,rcx
	call dlt
LB_7624:
	bt r12,0
	jc LB_7625
	mov rdi,r13
	call dlt
LB_7625:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_7616:
MTC_LB_7473:
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
	NS_E_DYN_68:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_68
	NS_E_DYN_107:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_107
	NS_E_DYN_125:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_125
	NS_E_DYN_168:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_168
	NS_E_DYN_178:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_178
	NS_E_DYN_179:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_179
	NS_E_DYN_180:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_180
	NS_E_DYN_398:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_398
	NS_E_DYN_437:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_437
	NS_E_DYN_476:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_476
	NS_E_DYN_515:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_515
	NS_E_DYN_546:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_546
	NS_E_DYN_547:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_547
	NS_E_DYN_548:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_548
	NS_E_DYN_675:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_675
	NS_E_DYN_734:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_735:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_744:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_744
	NS_E_DYN_779:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_780:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_860:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_861:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_862:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_863:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_864:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_865:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_866:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_867:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_868:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_869:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_870:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_871:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_872:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_873:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_874:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_875:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_876:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_877:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_878:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_879:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_887:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_887
	NS_E_DYN_1079:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1079
	NS_E_DYN_1053:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1053
	NS_E_DYN_1042:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1042
	NS_E_DYN_1032:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1032
	NS_E_DYN_1021:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1021
	NS_E_DYN_1010:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1010
	NS_E_DYN_993:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_993
	NS_E_DYN_978:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_978
	NS_E_DYN_972:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_972
	NS_E_DYN_960:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_960
	NS_E_DYN_926:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_926
	NS_E_DYN_1743:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1744:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1745:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1745
	NS_E_DYN_1746:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1746
	NS_E_DYN_1747:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1747
	NS_E_DYN_1748:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1748
	NS_E_DYN_2395:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2395
	NS_E_DYN_2496:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2496
	CST_DYN_2558:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_2561:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2561
	NS_E_DYN_2628:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2628
	NS_E_DYN_2713:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2714:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2721:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2721
	NS_E_DYN_2757:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2757
	NS_E_DYN_2758:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2758
	NS_E_DYN_2759:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2759
	NS_E_DYN_2760:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2760
	NS_E_DYN_3021:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3021
	NS_E_DYN_3022:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3022
	NS_E_DYN_3025:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3025
	NS_E_DYN_3026:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3026
	NS_E_DYN_3291:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3291
	NS_E_DYN_3292:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3292
	NS_E_DYN_3293:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3293
	NS_E_DYN_3294:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3294
	NS_E_DYN_3295:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3295
	NS_E_DYN_3606:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3606
	NS_E_DYN_3607:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3607
	NS_E_DYN_3608:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3608
	NS_E_DYN_3609:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3609
	NS_E_DYN_3610:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3610
	NS_E_DYN_3611:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3611
	NS_E_DYN_3612:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3612
	NS_E_DYN_3615:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3615
	NS_E_DYN_3616:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3616
	NS_E_DYN_3617:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3617
	NS_E_DYN_3620:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3620
	NS_E_DYN_3621:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3621
	NS_E_DYN_3622:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3622
	NS_E_DYN_3623:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3623
	NS_E_DYN_3624:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3624
	NS_E_DYN_3625:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3625
	NS_E_DYN_3626:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3626
	NS_E_DYN_3627:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3627
	NS_E_DYN_3628:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3628
	NS_E_DYN_3629:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3629
	NS_E_DYN_3630:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3630
	NS_E_DYN_3631:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3631
	NS_E_DYN_3632:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3632
	NS_E_DYN_3633:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3633
	NS_E_DYN_3634:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3634
	NS_E_DYN_3635:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3635
	NS_E_DYN_3636:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3636
	NS_E_DYN_3637:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3637
	NS_E_DYN_3638:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3638
	NS_E_DYN_3639:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3639
	NS_E_DYN_3640:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3640
	NS_E_DYN_3641:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3641
	NS_E_DYN_3642:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3642
	NS_E_DYN_3643:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3643
	NS_E_DYN_3644:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3644
	NS_E_DYN_3645:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3645
	NS_E_DYN_3646:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3646
	CST_DYN_7272:
		dq 0x0000_0001_00_82_ffff
		dq 1
