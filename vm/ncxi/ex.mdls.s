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
	call NS_E_471
	call NS_E_737
	call NS_E_788
	call NS_E_926
	call NS_E_1059
	call NS_E_1082
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
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
NS_E_67:
NS_E_RDI_67:
NS_E_67_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_68
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_68:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_70_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_70_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_71_LB_0
	cmp r11,57
	ja NS_E_71_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_71_LB_0:
	mov rax,0
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_73_LB_0
	cmp r11,122
	ja NS_E_73_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_73_LB_0:
	mov rax,0
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_72_LB_0
	cmp r11,90
	ja NS_E_72_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_72_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
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
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_75
	bt QWORD [rdi],17
	jnc LB_75
	bt QWORD [rdi],0
	jc LB_77
	btr r12,2
	clc
	jmp LB_78
LB_77:
	bts r12,2
	stc
LB_78:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_76
LB_75:
	btr r12,2
	clc
	call dcp
LB_76:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_74
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_74:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
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
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
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
	jz NS_E_69_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_69_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_92:
; 	|» { 0' 1' }
NS_E_RDI_92:
MTC_LB_93:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_94
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
	jnc LB_95
	bt QWORD [rdi],0
	jc LB_96
	btr r12,4
	clc
	jmp LB_97
LB_96:
	bts r12,4
	stc
LB_97:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_95:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_100
	btr r12,5
	clc
	jmp LB_101
LB_100:
	bts r12,5
	stc
LB_101:
	mov r8,r11
	bt r12,5
	jc LB_98
	btr r12,2
	jmp LB_99
LB_98:
	bts r12,2
LB_99:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_104
	btr r12,5
	clc
	jmp LB_105
LB_104:
	bts r12,5
	stc
LB_105:
	mov r9,r11
	bt r12,5
	jc LB_102
	btr r12,3
	jmp LB_103
LB_102:
	bts r12,3
LB_103:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_106:
	cmp r15,0
	jz LB_107
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_106
LB_107:
; _f56 %_79 ⊢ %_83 : %_83
 ; {>  %_79~0':_r64 %_82~3':(_lst)◂(_r64) %_81~2':_r64 }
	add r13,1
; _f92 { %_83 %_82 } ⊢ { %_84 %_85 } : { %_84 %_85 }
 ; {>  %_83~0':_r64 %_82~3':(_lst)◂(_r64) %_81~2':_r64 }
; _f92 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_110
	btr r12,1
	jmp LB_111
LB_110:
	bts r12,1
LB_111:
	call NS_E_92
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_108
	btr r12,2
	clc
	jmp LB_109
LB_108:
	bts r12,2
	stc
LB_109:
	add rsp,16
; _f55 %_84 ⊢ %_86 : %_86
 ; {>  %_84~0':_r64 %_85~1':_stg %_81~2':_r64 }
	sub r13,1
; _f33 { %_85 %_86 %_81 } ⊢ { %_87 %_88 %_89 } : { %_87 %_88 %_89 }
 ; {>  %_86~0':_r64 %_85~1':_stg %_81~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_112
	btr r12,3
	jmp LB_113
LB_112:
	bts r12,3
LB_113:
	mov r14,r13
	bt r12,0
	jc LB_114
	btr r12,1
	jmp LB_115
LB_114:
	bts r12,1
LB_115:
	mov r13,r9
	bt r12,3
	jc LB_116
	btr r12,0
	jmp LB_117
LB_116:
	bts r12,0
LB_117:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_88 %_87 }
 ; {>  %_87~0':_stg %_89~2':_r64 %_88~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_118
	mov rdi,r8
	call dlt
LB_118:
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
	ret
MTC_LB_94:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_125
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
	jnc LB_126
	bt QWORD [rdi],0
	jc LB_127
	btr r12,2
	clc
	jmp LB_128
LB_127:
	bts r12,2
	stc
LB_128:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_126:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_129:
	cmp r15,0
	jz LB_130
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_129
LB_130:
; _f31 %_79 ⊢ { %_90 %_91 } : { %_90 %_91 }
 ; {>  %_79~0':_r64 }
; _f31 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_90 %_91 }
 ; {>  %_90~0':_r64 %_91~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_125:
NS_E_135:
; 	|» 0'
NS_E_RDI_135:
; » 0xr0 |~ {  } ⊢ %_132 : %_132
 ; {>  %_131~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_132
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f92 { %_132 %_131 } ⊢ { %_133 %_134 } : { %_133 %_134 }
 ; {>  %_131~0':(_lst)◂(_r64) %_132~1':_r64 }
; _f92 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_136
	btr r12,2
	jmp LB_137
LB_136:
	bts r12,2
LB_137:
	mov r14,r13
	bt r12,0
	jc LB_138
	btr r12,1
	jmp LB_139
LB_138:
	bts r12,1
LB_139:
	mov r13,r8
	bt r12,2
	jc LB_140
	btr r12,0
	jmp LB_141
LB_140:
	bts r12,0
LB_141:
	call NS_E_92
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_134
 ; {>  %_133~0':_r64 %_134~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_142
	mov rdi,r13
	call dlt
LB_142:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_143
	btr r12,0
	jmp LB_144
LB_143:
	bts r12,0
LB_144:
	ret
NS_E_145:
NS_E_RDI_145:
NS_E_145_ETR_TBL:
NS_E_145_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_182
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_176
LB_182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_177
	btr r12,0
	clc
	jmp LB_178
LB_177:
	bts r12,0
	stc
LB_178:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_173
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_147 : %_147
 ; {>  %_146~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_147
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_148 : %_148
 ; {>  %_147~1':_r64 %_146~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_148
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_146 %_147 } ⊢ { %_149 %_150 %_151 } : { %_149 %_150 %_151 }
 ; {>  %_148~2':_r64 %_147~1':_r64 %_146~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_148 %_149 } ⊢ { %_152 %_153 %_154 } : { %_152 %_153 %_154 }
 ; {>  %_151~3':_r64 %_149~0':_r64 %_148~2':_r64 %_150~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_157:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_158
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_158
LB_159:
	cmp r15,0
	jz LB_160
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_159
LB_160:
; _some %_153 ⊢ %_155 : %_155
 ; {>  %_152~2':_r64 %_150~1':_r64 %_153~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_155
 ; {>  %_152~2':_r64 %_150~1':_r64 %_155~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_161
	mov rdi,r8
	call dlt
LB_161:
	bt r12,1
	jc LB_162
	mov rdi,r14
	call dlt
LB_162:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_163
	btr r12,3
	jmp LB_164
LB_163:
	bts r12,3
LB_164:
	mov r8,0
	bts r12,2
	ret
MTC_LB_158:
	mov r15,0
LB_166:
	cmp r15,0
	jz LB_167
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_166
LB_167:
; _none {  } ⊢ %_156 : %_156
 ; {>  %_152~2':_r64 %_151~3':_r64 %_150~1':_r64 %_154~4':_r64 %_153~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_156
 ; {>  %_152~2':_r64 %_151~3':_r64 %_156~°1◂{  }:(_opn)◂(t71'(0)) %_150~1':_r64 %_154~4':_r64 %_153~0':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_168
	mov rdi,r8
	call dlt
LB_168:
	bt r12,3
	jc LB_169
	mov rdi,r9
	call dlt
LB_169:
	bt r12,1
	jc LB_170
	mov rdi,r14
	call dlt
LB_170:
	bt r12,4
	jc LB_171
	mov rdi,r10
	call dlt
LB_171:
	bt r12,0
	jc LB_172
	mov rdi,r13
	call dlt
LB_172:
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
MTC_LB_165:
LB_173:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_175
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_174
LB_175:
	add rsp,8
	ret
LB_176:
	add rsp,16
	pop r14
LB_174:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_184:
NS_E_RDI_184:
NS_E_184_ETR_TBL:
NS_E_184_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_215
LB_221:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_216
	btr r12,0
	clc
	jmp LB_217
LB_216:
	bts r12,0
	stc
LB_217:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_212
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_186 : %_186
 ; {>  %_185~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_186
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_187 : %_187
 ; {>  %_186~1':_r64 %_185~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_187
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_185 %_186 } ⊢ { %_188 %_189 %_190 } : { %_188 %_189 %_190 }
 ; {>  %_186~1':_r64 %_185~0':_r64 %_187~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_187 %_188 } ⊢ { %_191 %_192 %_193 } : { %_191 %_192 %_193 }
 ; {>  %_190~3':_r64 %_189~1':_r64 %_188~0':_r64 %_187~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_196:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_197
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_197
LB_198:
	cmp r15,0
	jz LB_199
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_198
LB_199:
; _some %_192 ⊢ %_194 : %_194
 ; {>  %_192~0':_r64 %_191~2':_r64 %_189~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_194
 ; {>  %_194~°0◂0':(_opn)◂(_r64) %_191~2':_r64 %_189~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_200
	mov rdi,r8
	call dlt
LB_200:
	bt r12,1
	jc LB_201
	mov rdi,r14
	call dlt
LB_201:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_202
	btr r12,3
	jmp LB_203
LB_202:
	bts r12,3
LB_203:
	mov r8,0
	bts r12,2
	ret
MTC_LB_197:
	mov r15,0
LB_205:
	cmp r15,0
	jz LB_206
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_205
LB_206:
; _none {  } ⊢ %_195 : %_195
 ; {>  %_192~0':_r64 %_191~2':_r64 %_190~3':_r64 %_189~1':_r64 %_193~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_195
 ; {>  %_192~0':_r64 %_191~2':_r64 %_190~3':_r64 %_189~1':_r64 %_195~°1◂{  }:(_opn)◂(t98'(0)) %_193~4':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_207
	mov rdi,r13
	call dlt
LB_207:
	bt r12,2
	jc LB_208
	mov rdi,r8
	call dlt
LB_208:
	bt r12,3
	jc LB_209
	mov rdi,r9
	call dlt
LB_209:
	bt r12,1
	jc LB_210
	mov rdi,r14
	call dlt
LB_210:
	bt r12,4
	jc LB_211
	mov rdi,r10
	call dlt
LB_211:
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
MTC_LB_204:
LB_212:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_214
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_213
LB_214:
	add rsp,8
	ret
LB_215:
	add rsp,16
	pop r14
LB_213:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_223:
NS_E_RDI_223:
NS_E_223_ETR_TBL:
NS_E_223_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_260
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_254
LB_260:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_255
	btr r12,0
	clc
	jmp LB_256
LB_255:
	bts r12,0
	stc
LB_256:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_251
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_225 : %_225
 ; {>  %_224~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_225
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_226 : %_226
 ; {>  %_224~0':_r64 %_225~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_226
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_224 %_225 } ⊢ { %_227 %_228 %_229 } : { %_227 %_228 %_229 }
 ; {>  %_224~0':_r64 %_226~2':_r64 %_225~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_226 %_227 } ⊢ { %_230 %_231 %_232 } : { %_230 %_231 %_232 }
 ; {>  %_226~2':_r64 %_227~0':_r64 %_229~3':_r64 %_228~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_235:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_236
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_236
LB_237:
	cmp r15,0
	jz LB_238
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_237
LB_238:
; _some %_231 ⊢ %_233 : %_233
 ; {>  %_230~2':_r64 %_231~0':_r64 %_228~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_233
 ; {>  %_233~°0◂0':(_opn)◂(_r64) %_230~2':_r64 %_228~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_239
	mov rdi,r8
	call dlt
LB_239:
	bt r12,1
	jc LB_240
	mov rdi,r14
	call dlt
LB_240:
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
MTC_LB_236:
	mov r15,0
LB_244:
	cmp r15,0
	jz LB_245
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_244
LB_245:
; _none {  } ⊢ %_234 : %_234
 ; {>  %_232~4':_r64 %_230~2':_r64 %_231~0':_r64 %_229~3':_r64 %_228~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_234
 ; {>  %_232~4':_r64 %_230~2':_r64 %_231~0':_r64 %_234~°1◂{  }:(_opn)◂(t125'(0)) %_229~3':_r64 %_228~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_246
	mov rdi,r10
	call dlt
LB_246:
	bt r12,2
	jc LB_247
	mov rdi,r8
	call dlt
LB_247:
	bt r12,0
	jc LB_248
	mov rdi,r13
	call dlt
LB_248:
	bt r12,3
	jc LB_249
	mov rdi,r9
	call dlt
LB_249:
	bt r12,1
	jc LB_250
	mov rdi,r14
	call dlt
LB_250:
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
MTC_LB_243:
LB_251:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_253
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_252
LB_253:
	add rsp,8
	ret
LB_254:
	add rsp,16
	pop r14
LB_252:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_262:
NS_E_RDI_262:
NS_E_262_ETR_TBL:
NS_E_262_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_223_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_278
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_272
LB_278:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_273
	btr r12,0
	clc
	jmp LB_274
LB_273:
	bts r12,0
	stc
LB_274:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_269
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_263 ⊢ %_264 : %_264
 ; {>  %_263~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_264
 ; {>  %_264~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_267
	btr r12,3
	jmp LB_268
LB_267:
	bts r12,3
LB_268:
	mov r8,0
	bts r12,2
	ret
LB_269:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_271
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_270
LB_271:
	add rsp,8
	ret
LB_272:
	add rsp,16
	pop r14
LB_270:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_184_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_291
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_285
LB_291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_286
	btr r12,0
	clc
	jmp LB_287
LB_286:
	bts r12,0
	stc
LB_287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_282
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_265 ⊢ %_266 : %_266
 ; {>  %_265~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_266
 ; {>  %_266~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_280
	btr r12,3
	jmp LB_281
LB_280:
	bts r12,3
LB_281:
	mov r8,0
	bts r12,2
	ret
LB_282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_283
LB_284:
	add rsp,8
	ret
LB_285:
	add rsp,16
	pop r14
LB_283:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_293:
NS_E_RDI_293:
NS_E_293_ETR_TBL:
NS_E_293_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_342
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_334
LB_342:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_347
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_348:
	jmp LB_334
LB_347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_337
	btr r12,1
	clc
	jmp LB_338
LB_337:
	bts r12,1
	stc
LB_338:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_335
	btr r12,0
	clc
	jmp LB_336
LB_335:
	bts r12,0
	stc
LB_336:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_331
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_296 %_297 } ⊢ %_298 : %_298
 ; {>  %_297~1':(_lst)◂(_r64) %_296~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f135 %_298 ⊢ %_299 : %_299
 ; {>  %_298~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f135 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_317
	btr r12,2
	jmp LB_318
LB_317:
	bts r12,2
LB_318:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_323
	btr r12,3
	jmp LB_324
LB_323:
	bts r12,3
LB_324:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_321
	btr QWORD [rdi],0
	jmp LB_322
LB_321:
	bts QWORD [rdi],0
LB_322:
	mov r9,r14
	bt r12,1
	jc LB_327
	btr r12,3
	jmp LB_328
LB_327:
	bts r12,3
LB_328:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_325
	btr QWORD [rdi],1
	jmp LB_326
LB_325:
	bts QWORD [rdi],1
LB_326:
	mov rsi,1
	bt r12,0
	jc LB_319
	mov rsi,0
	bt r13,0
	jc LB_319
	jmp LB_320
LB_319:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_320:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_135
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_299 ⊢ %_300 : %_300
 ; {>  %_299~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_300
 ; {>  %_300~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_329
	btr r12,3
	jmp LB_330
LB_329:
	bts r12,3
LB_330:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_332
LB_333:
	add rsp,8
	ret
LB_334:
	add rsp,32
	pop r14
LB_332:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_294:
NS_E_RDI_294:
NS_E_294_ETR_TBL:
NS_E_294_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_295_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_371
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_363
LB_371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_376
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_377
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_377:
	jmp LB_363
LB_376:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_366
	btr r12,1
	clc
	jmp LB_367
LB_366:
	bts r12,1
	stc
LB_367:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_364
	btr r12,0
	clc
	jmp LB_365
LB_364:
	bts r12,0
	stc
LB_365:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_360
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_301 %_302 } ⊢ %_303 : %_303
 ; {>  %_301~0':_r64 %_302~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_303 ⊢ %_304 : %_304
 ; {>  %_303~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_304
 ; {>  %_304~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_354
	btr r12,2
	jmp LB_355
LB_354:
	bts r12,2
LB_355:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_352
	btr QWORD [rdi],0
	jmp LB_353
LB_352:
	bts QWORD [rdi],0
LB_353:
	mov r8,r14
	bt r12,1
	jc LB_358
	btr r12,2
	jmp LB_359
LB_358:
	bts r12,2
LB_359:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_356
	btr QWORD [rdi],1
	jmp LB_357
LB_356:
	bts QWORD [rdi],1
LB_357:
	mov rsi,1
	bt r12,3
	jc LB_350
	mov rsi,0
	bt r9,0
	jc LB_350
	jmp LB_351
LB_350:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_351:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_360:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_362
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_361
LB_362:
	add rsp,8
	ret
LB_363:
	add rsp,32
	pop r14
LB_361:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_381
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_305 : %_305
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_305 ⊢ %_306 : %_306
 ; {>  %_305~°1◂{  }:(_lst)◂(t169'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_306
 ; {>  %_306~°0◂°1◂{  }:(_opn)◂((_lst)◂(t172'(0))) }
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
	jc LB_379
	mov rsi,0
	bt r9,0
	jc LB_379
	jmp LB_380
LB_379:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_380:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_381:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_383
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_382
LB_383:
	add rsp,8
	ret
LB_384:
	add rsp,0
	pop r14
LB_382:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_295:
NS_E_RDI_295:
NS_E_295_ETR_TBL:
NS_E_295_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_262_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_396
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_390
LB_396:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_391
	btr r12,0
	clc
	jmp LB_392
LB_391:
	bts r12,0
	stc
LB_392:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_387
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_307 ⊢ %_308 : %_308
 ; {>  %_307~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_308
 ; {>  %_308~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_385
	btr r12,3
	jmp LB_386
LB_385:
	bts r12,3
LB_386:
	mov r8,0
	bts r12,2
	ret
LB_387:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_389
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_388
LB_389:
	add rsp,8
	ret
LB_390:
	add rsp,16
	pop r14
LB_388:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_145_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_416
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_410
LB_416:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_411
	btr r12,0
	clc
	jmp LB_412
LB_411:
	bts r12,0
	stc
LB_412:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_407
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_310
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f38 %_310 ⊢ %_311 : %_311
 ; {>  %_309~0':_r64 %_310~1':_stg }
; _f38 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_400
	btr r12,0
	jmp LB_401
LB_400:
	bts r12,0
LB_401:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_402
	btr r12,1
	jmp LB_403
LB_402:
	bts r12,1
LB_403:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_398
	btr r12,0
	clc
	jmp LB_399
LB_398:
	bts r12,0
	stc
LB_399:
	add rsp,16
; _some %_309 ⊢ %_312 : %_312
 ; {>  %_311~1':_stg %_309~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_312
 ; {>  %_311~1':_stg %_312~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_404
	mov rdi,r14
	call dlt
LB_404:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_405
	btr r12,3
	jmp LB_406
LB_405:
	bts r12,3
LB_406:
	mov r8,0
	bts r12,2
	ret
LB_407:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_409
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_408
LB_409:
	add rsp,8
	ret
LB_410:
	add rsp,16
	pop r14
LB_408:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_432
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_432
	jmp LB_433
LB_432:
	jmp LB_424
LB_433:
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
	jc LB_425
	btr r12,0
	clc
	jmp LB_426
LB_425:
	bts r12,0
	stc
LB_426:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_421
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_313
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f38 %_313 ⊢ %_314 : %_314
 ; {>  %_313~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr5f |~ {  } ⊢ %_315 : %_315
 ; {>  %_314~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_315
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_315 ⊢ %_316 : %_316
 ; {>  %_315~1':_r64 %_314~0':_stg }
; _some 1' ⊢ °0◂1'
; ∎ %_316
 ; {>  %_314~0':_stg %_316~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_418
	mov rdi,r13
	call dlt
LB_418:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_419
	btr r12,3
	jmp LB_420
LB_419:
	bts r12,3
LB_420:
	mov r8,0
	bts r12,2
	ret
LB_421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_423
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_422
LB_423:
	add rsp,8
	ret
LB_424:
	add rsp,16
	pop r14
LB_422:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_435:
NS_E_RDI_435:
NS_E_435_ETR_TBL:
NS_E_435_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_455
	jmp LB_456
LB_455:
	jmp LB_438
LB_456:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_293_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_460
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_461
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_461:
	jmp LB_438
LB_460:
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
	jc LB_447
	btr QWORD [rdi],1
LB_447:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_448
	btr QWORD [rdi],0
LB_448:
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
LB_438:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_293_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_445
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_439
LB_445:
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
	jc LB_440
	btr QWORD [rdi],0
LB_440:
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
LB_439:
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
NS_E_471:
NS_E_RDI_471:
; 	» "aSk7_dD0_4$ jj " _ ⊢ 0' : %_463
	mov rdi,15
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_44_64_5f_37_6b_53_61
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_20_6a_6a_20_24_34_5f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_464 : %_464
 ; {>  %_463~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_464
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f293 { %_463 %_464 } ⊢ { %_465 %_466 %_467 } : { %_465 %_466 %_467 }
 ; {>  %_463~0':_stg %_464~1':_r64 }
; _f293 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_293
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
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_475:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_465 %_466 %_467 } ⊢ { %_468 %_469 %_470 } : { %_468 %_469 %_470 }
 ; {>  %_466~1':_r64 %_467~2':(_opn)◂(_stg) %_465~0':_stg }
; _f38 { 0' 1' 2' } ⊢ { 0' 1' 2' }
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
	mov rbx,[rax]
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
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
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
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
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
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_488
	btr QWORD [rdi],2
	jmp LB_489
LB_488:
	bts QWORD [rdi],2
LB_489:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_492
	btr r12,3
	jmp LB_493
LB_492:
	bts r12,3
LB_493:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_496
	btr r12,4
	clc
	jmp LB_497
LB_496:
	bts r12,4
	stc
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
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_500
	btr r12,4
	clc
	jmp LB_501
LB_500:
	bts r12,4
	stc
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
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_504
	btr r12,4
	clc
	jmp LB_505
LB_504:
	bts r12,4
	stc
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
	mov [rdi],rbx
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
NS_E_509:
NS_E_RDI_509:
NS_E_509_ETR_TBL:
NS_E_509_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_550
	jmp LB_551
LB_550:
	jmp LB_540
LB_551:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_555
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_556
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_556:
	jmp LB_540
LB_555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_543
	btr r12,1
	clc
	jmp LB_544
LB_543:
	bts r12,1
	stc
LB_544:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_541
	btr r12,0
	clc
	jmp LB_542
LB_541:
	bts r12,0
	stc
LB_542:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_537
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_558
	btr r12,2
	jmp LB_559
LB_558:
	bts r12,2
LB_559:
	mov r13,r14
	bt r12,1
	jc LB_560
	btr r12,0
	jmp LB_561
LB_560:
	bts r12,0
LB_561:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f135 %_512 ⊢ %_513 : %_513
 ; {>  %_512~0':(_lst)◂(_r64) }
; _f135 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_135
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_513 ⊢ %_514 : %_514
 ; {>  %_513~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_514
 ; {>  %_514~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_535
	btr r12,3
	jmp LB_536
LB_535:
	bts r12,3
LB_536:
	mov r8,0
	bts r12,2
	ret
LB_537:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_539
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_538
LB_539:
	add rsp,8
	ret
LB_540:
	add rsp,32
	pop r14
LB_538:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_510:
NS_E_RDI_510:
NS_E_510_ETR_TBL:
NS_E_510_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_587
	jmp LB_588
LB_587:
	jmp LB_575
LB_588:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_592
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_593
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_593:
	jmp LB_575
LB_592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_598
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_599
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_599:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_600:
	jmp LB_575
LB_598:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_580
	btr r12,2
	clc
	jmp LB_581
LB_580:
	bts r12,2
	stc
LB_581:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_578
	btr r12,1
	clc
	jmp LB_579
LB_578:
	bts r12,1
	stc
LB_579:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_576
	btr r12,0
	clc
	jmp LB_577
LB_576:
	bts r12,0
	stc
LB_577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_572
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_602
	btr r12,3
	jmp LB_603
LB_602:
	bts r12,3
LB_603:
	mov r14,r8
	bt r12,2
	jc LB_604
	btr r12,1
	jmp LB_605
LB_604:
	bts r12,1
LB_605:
	mov r8,r13
	bt r12,0
	jc LB_606
	btr r12,2
	jmp LB_607
LB_606:
	bts r12,2
LB_607:
	mov r13,r9
	bt r12,3
	jc LB_608
	btr r12,0
	jmp LB_609
LB_608:
	bts r12,0
LB_609:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_515 %_516 } ⊢ %_517 : %_517
 ; {>  %_516~1':(_lst)◂(_r64) %_515~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_517 ⊢ %_518 : %_518
 ; {>  %_517~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_518
 ; {>  %_518~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_566
	btr r12,2
	jmp LB_567
LB_566:
	bts r12,2
LB_567:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_564
	btr QWORD [rdi],0
	jmp LB_565
LB_564:
	bts QWORD [rdi],0
LB_565:
	mov r8,r14
	bt r12,1
	jc LB_570
	btr r12,2
	jmp LB_571
LB_570:
	bts r12,2
LB_571:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_568
	btr QWORD [rdi],1
	jmp LB_569
LB_568:
	bts QWORD [rdi],1
LB_569:
	mov rsi,1
	bt r12,3
	jc LB_562
	mov rsi,0
	bt r9,0
	jc LB_562
	jmp LB_563
LB_562:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_563:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_574
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_573
LB_574:
	add rsp,8
	ret
LB_575:
	add rsp,48
	pop r14
LB_573:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_623
	jmp LB_624
LB_623:
	jmp LB_615
LB_624:
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
	jc LB_616
	btr r12,0
	clc
	jmp LB_617
LB_616:
	bts r12,0
	stc
LB_617:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_612
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_519 : %_519
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_519 ⊢ %_520 : %_520
 ; {>  %_519~°1◂{  }:(_lst)◂(t253'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_520
 ; {>  %_520~°0◂°1◂{  }:(_opn)◂((_lst)◂(t256'(0))) }
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
	jc LB_610
	mov rsi,0
	bt r9,0
	jc LB_610
	jmp LB_611
LB_610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_611:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_612:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_614
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_613
LB_614:
	add rsp,8
	ret
LB_615:
	add rsp,16
	pop r14
LB_613:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_646
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_638
LB_646:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_651
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_652:
	jmp LB_638
LB_651:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_641
	btr r12,1
	clc
	jmp LB_642
LB_641:
	bts r12,1
	stc
LB_642:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_639
	btr r12,0
	clc
	jmp LB_640
LB_639:
	bts r12,0
	stc
LB_640:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_635
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_521 %_522 } ⊢ %_523 : %_523
 ; {>  %_521~0':_r64 %_522~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_523 ⊢ %_524 : %_524
 ; {>  %_523~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_524
 ; {>  %_524~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_629
	btr r12,2
	jmp LB_630
LB_629:
	bts r12,2
LB_630:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_627
	btr QWORD [rdi],0
	jmp LB_628
LB_627:
	bts QWORD [rdi],0
LB_628:
	mov r8,r14
	bt r12,1
	jc LB_633
	btr r12,2
	jmp LB_634
LB_633:
	bts r12,2
LB_634:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_631
	btr QWORD [rdi],1
	jmp LB_632
LB_631:
	bts QWORD [rdi],1
LB_632:
	mov rsi,1
	bt r12,3
	jc LB_625
	mov rsi,0
	bt r9,0
	jc LB_625
	jmp LB_626
LB_625:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_626:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_635:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_637
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_636
LB_637:
	add rsp,8
	ret
LB_638:
	add rsp,32
	pop r14
LB_636:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_511:
NS_E_RDI_511:
NS_E_511_ETR_TBL:
NS_E_511_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_667
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_667
	jmp LB_668
LB_667:
	jmp LB_659
LB_668:
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
	jc LB_660
	btr r12,0
	clc
	jmp LB_661
LB_660:
	bts r12,0
	stc
LB_661:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_656
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_525 : %_525
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_525
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_525 ⊢ %_526 : %_526
 ; {>  %_525~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_526
 ; {>  %_526~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_654
	btr r12,3
	jmp LB_655
LB_654:
	bts r12,3
LB_655:
	mov r8,0
	bts r12,2
	ret
LB_656:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_658
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_657
LB_658:
	add rsp,8
	ret
LB_659:
	add rsp,16
	pop r14
LB_657:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_682
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_682
	jmp LB_683
LB_682:
	jmp LB_674
LB_683:
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
	jc LB_675
	btr r12,0
	clc
	jmp LB_676
LB_675:
	bts r12,0
	stc
LB_676:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_671
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_527 : %_527
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_527
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_527 ⊢ %_528 : %_528
 ; {>  %_527~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_528
 ; {>  %_528~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_669
	btr r12,3
	jmp LB_670
LB_669:
	bts r12,3
LB_670:
	mov r8,0
	bts r12,2
	ret
LB_671:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_673
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_672
LB_673:
	add rsp,8
	ret
LB_674:
	add rsp,16
	pop r14
LB_672:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_697
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_697
	jmp LB_698
LB_697:
	jmp LB_689
LB_698:
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
	jc LB_690
	btr r12,0
	clc
	jmp LB_691
LB_690:
	bts r12,0
	stc
LB_691:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_686
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_529 : %_529
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_529
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_529 ⊢ %_530 : %_530
 ; {>  %_529~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_530
 ; {>  %_530~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_684
	btr r12,3
	jmp LB_685
LB_684:
	bts r12,3
LB_685:
	mov r8,0
	bts r12,2
	ret
LB_686:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_688
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_687
LB_688:
	add rsp,8
	ret
LB_689:
	add rsp,16
	pop r14
LB_687:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_712
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_712
	jmp LB_713
LB_712:
	jmp LB_704
LB_713:
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
	jc LB_705
	btr r12,0
	clc
	jmp LB_706
LB_705:
	bts r12,0
	stc
LB_706:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_701
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_531 : %_531
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_531
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_531 ⊢ %_532 : %_532
 ; {>  %_531~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_532
 ; {>  %_532~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_699
	btr r12,3
	jmp LB_700
LB_699:
	bts r12,3
LB_700:
	mov r8,0
	bts r12,2
	ret
LB_701:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_703
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_702
LB_703:
	add rsp,8
	ret
LB_704:
	add rsp,16
	pop r14
LB_702:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_727
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_727
	jmp LB_728
LB_727:
	jmp LB_719
LB_728:
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
	jc LB_720
	btr r12,0
	clc
	jmp LB_721
LB_720:
	bts r12,0
	stc
LB_721:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_716
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_533 : %_533
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_533
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_533 ⊢ %_534 : %_534
 ; {>  %_533~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_534
 ; {>  %_534~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_714
	btr r12,3
	jmp LB_715
LB_714:
	bts r12,3
LB_715:
	mov r8,0
	bts r12,2
	ret
LB_716:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_718
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_717
LB_718:
	add rsp,8
	ret
LB_719:
	add rsp,16
	pop r14
LB_717:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_737:
NS_E_RDI_737:
; » _^ ..
	xor rax,rax
	add rax,19
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; » 0xr0 |~ {  } ⊢ %_730 : %_730
 ; {>  %_729~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_730
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f509 { %_729 %_730 } ⊢ { %_731 %_732 %_733 } : { %_731 %_732 %_733 }
 ; {>  %_729~0':_stg %_730~1':_r64 }
; _f509 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_509
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_738
	btr r12,4
	jmp LB_739
LB_738:
	bts r12,4
LB_739:
	mov r8,r9
	bt r12,3
	jc LB_742
	btr r12,2
	jmp LB_743
LB_742:
	bts r12,2
LB_743:
	mov rsi,1
	bt r12,2
	jc LB_740
	mov rsi,0
	bt r8,0
	jc LB_740
	jmp LB_741
LB_740:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_741:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_731 %_732 %_733 } ⊢ { %_734 %_735 %_736 } : { %_734 %_735 %_736 }
 ; {>  %_731~0':_stg %_732~1':_r64 %_733~2':(_opn)◂(_stg) }
; _f38 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_744
	btr r12,3
	jmp LB_745
LB_744:
	bts r12,3
LB_745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_748
	btr r12,4
	jmp LB_749
LB_748:
	bts r12,4
LB_749:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_746
	btr QWORD [rdi],0
	jmp LB_747
LB_746:
	bts QWORD [rdi],0
LB_747:
	mov r10,r14
	bt r12,1
	jc LB_752
	btr r12,4
	jmp LB_753
LB_752:
	bts r12,4
LB_753:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_750
	btr QWORD [rdi],1
	jmp LB_751
LB_750:
	bts QWORD [rdi],1
LB_751:
	mov r10,r8
	bt r12,2
	jc LB_756
	btr r12,4
	jmp LB_757
LB_756:
	bts r12,4
LB_757:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_754
	btr QWORD [rdi],2
	jmp LB_755
LB_754:
	bts QWORD [rdi],2
LB_755:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_758
	btr r12,3
	jmp LB_759
LB_758:
	bts r12,3
LB_759:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_762
	btr r12,4
	clc
	jmp LB_763
LB_762:
	bts r12,4
	stc
LB_763:
	mov r13,r10
	bt r12,4
	jc LB_760
	btr r12,0
	jmp LB_761
LB_760:
	bts r12,0
LB_761:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_766
	btr r12,4
	clc
	jmp LB_767
LB_766:
	bts r12,4
	stc
LB_767:
	mov r14,r10
	bt r12,4
	jc LB_764
	btr r12,1
	jmp LB_765
LB_764:
	bts r12,1
LB_765:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_770
	btr r12,4
	clc
	jmp LB_771
LB_770:
	bts r12,4
	stc
LB_771:
	mov r8,r10
	bt r12,4
	jc LB_768
	btr r12,2
	jmp LB_769
LB_768:
	bts r12,2
LB_769:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_735~1':_r64 %_734~0':_stg %_736~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_772
	mov rdi,r14
	call dlt
LB_772:
	bt r12,0
	jc LB_773
	mov rdi,r13
	call dlt
LB_773:
	bt r12,2
	jc LB_774
	mov rdi,r8
	call dlt
LB_774:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_788:
NS_E_RDI_788:
; » 0xr41 |~ {  } ⊢ %_775 : %_775
 ; {>  }
; 	» 0xr41 _ ⊢ 0' : %_775
	mov rdi,0x41
	mov r13,rdi
	bts r12,0
; » 0xr42 |~ {  } ⊢ %_776 : %_776
 ; {>  %_775~0':_r64 }
; 	» 0xr42 _ ⊢ 1' : %_776
	mov rdi,0x42
	mov r14,rdi
	bts r12,1
; » 0xr43 |~ {  } ⊢ %_777 : %_777
 ; {>  %_775~0':_r64 %_776~1':_r64 }
; 	» 0xr43 _ ⊢ 2' : %_777
	mov rdi,0x43
	mov r8,rdi
	bts r12,2
; » 0xr44 |~ {  } ⊢ %_778 : %_778
 ; {>  %_775~0':_r64 %_776~1':_r64 %_777~2':_r64 }
; 	» 0xr44 _ ⊢ 3' : %_778
	mov rdi,0x44
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_779 : %_779
 ; {>  %_775~0':_r64 %_778~3':_r64 %_776~1':_r64 %_777~2':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_779
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _nil {  } ⊢ %_780 : %_780
 ; {>  %_775~0':_r64 %_778~3':_r64 %_776~1':_r64 %_779~4':_r64 %_777~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_775 %_780 } ⊢ %_781 : %_781
 ; {>  %_775~0':_r64 %_780~°1◂{  }:(_lst)◂(t338'(0)) %_778~3':_r64 %_776~1':_r64 %_779~4':_r64 %_777~2':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_776 %_781 } ⊢ %_782 : %_782
 ; {>  %_781~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_778~3':_r64 %_776~1':_r64 %_779~4':_r64 %_777~2':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _cns { %_777 %_782 } ⊢ %_783 : %_783
 ; {>  %_778~3':_r64 %_782~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) %_779~4':_r64 %_777~2':_r64 }
; _cns { 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }
; _cns { %_778 %_783 } ⊢ %_784 : %_784
 ; {>  %_778~3':_r64 %_783~°0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }:(_lst)◂(_r64) %_779~4':_r64 }
; _cns { 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } ⊢ °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }
; _f92 { %_779 %_784 } ⊢ { %_785 %_786 } : { %_785 %_786 }
 ; {>  %_784~°0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }:(_lst)◂(_r64) %_779~4':_r64 }
; _f92 { 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
	mov r11,r14
	bt r12,1
	jc LB_789
	btr r12,5
	jmp LB_790
LB_789:
	bts r12,5
LB_790:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rcx,r9
	bt r12,3
	jc LB_795
	btr r12,6
	jmp LB_796
LB_795:
	bts r12,6
LB_796:
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_793
	btr QWORD [rdi],0
	jmp LB_794
LB_793:
	bts QWORD [rdi],0
LB_794:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r9,r8
	bt r12,2
	jc LB_803
	btr r12,3
	jmp LB_804
LB_803:
	bts r12,3
LB_804:
	mov rdi,rcx
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_801
	btr QWORD [rdi],0
	jmp LB_802
LB_801:
	bts QWORD [rdi],0
LB_802:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r11
	bt r12,5
	jc LB_811
	btr r12,2
	jmp LB_812
LB_811:
	bts r12,2
LB_812:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_809
	btr QWORD [rdi],0
	jmp LB_810
LB_809:
	bts QWORD [rdi],0
LB_810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r13
	bt r12,0
	jc LB_819
	btr r12,5
	jmp LB_820
LB_819:
	bts r12,5
LB_820:
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_817
	btr QWORD [rdi],0
	jmp LB_818
LB_817:
	bts QWORD [rdi],0
LB_818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_823
	mov rsi,0
	bt r11,0
	jc LB_823
	jmp LB_824
LB_823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_824:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r8
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_821
	btr QWORD [rdi],1
	jmp LB_822
LB_821:
	bts QWORD [rdi],1
LB_822:
	mov rsi,1
	bt r12,2
	jc LB_815
	mov rsi,0
	bt r8,0
	jc LB_815
	jmp LB_816
LB_815:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_816:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_813
	btr QWORD [rdi],1
	jmp LB_814
LB_813:
	bts QWORD [rdi],1
LB_814:
	mov rsi,1
	bt r12,3
	jc LB_807
	mov rsi,0
	bt r9,0
	jc LB_807
	jmp LB_808
LB_807:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_808:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,rcx
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_805
	btr QWORD [rdi],1
	jmp LB_806
LB_805:
	bts QWORD [rdi],1
LB_806:
	mov rsi,1
	bt r12,6
	jc LB_799
	mov rsi,0
	bt rcx,0
	jc LB_799
	jmp LB_800
LB_799:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_800:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r14
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_797
	btr QWORD [rdi],1
	jmp LB_798
LB_797:
	bts QWORD [rdi],1
LB_798:
	mov rsi,1
	bt r12,1
	jc LB_791
	mov rsi,0
	bt r14,0
	jc LB_791
	jmp LB_792
LB_791:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_792:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r10
	bt r12,4
	jc LB_825
	btr r12,0
	jmp LB_826
LB_825:
	bts r12,0
LB_826:
	call NS_E_92
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 %_786 ⊢ %_787 : %_787
 ; {>  %_786~1':_stg %_785~0':_r64 }
; _f38 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_829
	btr r12,0
	jmp LB_830
LB_829:
	bts r12,0
LB_830:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_831
	btr r12,1
	jmp LB_832
LB_831:
	bts r12,1
LB_832:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_827
	btr r12,0
	clc
	jmp LB_828
LB_827:
	bts r12,0
	stc
LB_828:
	add rsp,16
; ∎ {  }
 ; {>  %_785~0':_r64 %_787~1':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_833
	mov rdi,r13
	call dlt
LB_833:
	bt r12,1
	jc LB_834
	mov rdi,r14
	call dlt
LB_834:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_860:
; 	|» { 0' 1' 2' }
NS_E_RDI_860:
; _f50 { %_836 %_835 } ⊢ { %_838 %_839 %_840 } : { %_838 %_839 %_840 }
 ; {>  %_836~1':_r64 %_837~2':_r64 %_835~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_861:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_862
LB_863:
	cmp r15,0
	jz LB_864
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_863
LB_864:
; _f53 %_839 ⊢ { %_841 %_842 } : { %_841 %_842 }
 ; {>  %_839~0':_r64 %_838~1':_r64 %_837~2':_r64 }
	mov r9,r13
	bts r12,3
; _f53 %_838 ⊢ { %_843 %_844 } : { %_843 %_844 }
 ; {>  %_838~1':_r64 %_841~0':_r64 %_842~3':_r64 %_837~2':_r64 }
	mov r10,r14
	bts r12,4
; _f53 %_837 ⊢ { %_845 %_846 } : { %_845 %_846 }
 ; {>  %_843~1':_r64 %_844~4':_r64 %_841~0':_r64 %_842~3':_r64 %_837~2':_r64 }
	mov r11,r8
	bts r12,5
; _f55 %_842 ⊢ %_847 : %_847
 ; {>  %_843~1':_r64 %_846~5':_r64 %_844~4':_r64 %_845~2':_r64 %_841~0':_r64 %_842~3':_r64 }
	sub r9,1
; _f860 { %_847 %_844 %_846 } ⊢ %_848 : %_848
 ; {>  %_843~1':_r64 %_846~5':_r64 %_844~4':_r64 %_845~2':_r64 %_841~0':_r64 %_847~3':_r64 }
; _f860 { 3' 4' 5' } ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_871
	btr r12,0
	jmp LB_872
LB_871:
	bts r12,0
LB_872:
	mov r14,r10
	bt r12,4
	jc LB_873
	btr r12,1
	jmp LB_874
LB_873:
	bts r12,1
LB_874:
	mov r8,r11
	bt r12,5
	jc LB_875
	btr r12,2
	jmp LB_876
LB_875:
	bts r12,2
LB_876:
	call NS_E_860
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_877
	btr r12,3
	jmp LB_878
LB_877:
	bts r12,3
LB_878:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_869
	btr r12,2
	clc
	jmp LB_870
LB_869:
	bts r12,2
	stc
LB_870:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_867
	btr r12,1
	clc
	jmp LB_868
LB_867:
	bts r12,1
	stc
LB_868:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_865
	btr r12,0
	clc
	jmp LB_866
LB_865:
	bts r12,0
	stc
LB_866:
	add rsp,32
; _f53 %_841 ⊢ { %_849 %_850 } : { %_849 %_850 }
 ; {>  %_843~1':_r64 %_848~3':_r64 %_845~2':_r64 %_841~0':_r64 }
	mov r10,r13
	bts r12,4
; _f53 %_843 ⊢ { %_851 %_852 } : { %_851 %_852 }
 ; {>  %_850~4':_r64 %_843~1':_r64 %_848~3':_r64 %_845~2':_r64 %_849~0':_r64 }
	mov r11,r14
	bts r12,5
; _f53 %_845 ⊢ { %_853 %_854 } : { %_853 %_854 }
 ; {>  %_850~4':_r64 %_848~3':_r64 %_852~5':_r64 %_845~2':_r64 %_849~0':_r64 %_851~1':_r64 }
	mov rcx,r8
	bts r12,6
; _f55 %_852 ⊢ %_855 : %_855
 ; {>  %_850~4':_r64 %_853~2':_r64 %_848~3':_r64 %_854~6':_r64 %_852~5':_r64 %_849~0':_r64 %_851~1':_r64 }
	sub r11,1
; _f860 { %_855 %_854 %_850 } ⊢ %_856 : %_856
 ; {>  %_850~4':_r64 %_855~5':_r64 %_853~2':_r64 %_848~3':_r64 %_854~6':_r64 %_849~0':_r64 %_851~1':_r64 }
; _f860 { 5' 6' 4' } ⊢ 4'
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
	jc LB_887
	btr r12,0
	jmp LB_888
LB_887:
	bts r12,0
LB_888:
	mov r14,rcx
	bt r12,6
	jc LB_889
	btr r12,1
	jmp LB_890
LB_889:
	bts r12,1
LB_890:
	mov r8,r10
	bt r12,4
	jc LB_891
	btr r12,2
	jmp LB_892
LB_891:
	bts r12,2
LB_892:
	call NS_E_860
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_893
	btr r12,4
	jmp LB_894
LB_893:
	bts r12,4
LB_894:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_885
	btr r12,3
	clc
	jmp LB_886
LB_885:
	bts r12,3
	stc
LB_886:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_883
	btr r12,2
	clc
	jmp LB_884
LB_883:
	bts r12,2
	stc
LB_884:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_881
	btr r12,1
	clc
	jmp LB_882
LB_881:
	bts r12,1
	stc
LB_882:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_879
	btr r12,0
	clc
	jmp LB_880
LB_879:
	bts r12,0
	stc
LB_880:
	add rsp,40
; _f55 %_853 ⊢ %_857 : %_857
 ; {>  %_856~4':_r64 %_853~2':_r64 %_848~3':_r64 %_849~0':_r64 %_851~1':_r64 }
	sub r8,1
; _f860 { %_857 %_849 %_851 } ⊢ %_858 : %_858
 ; {>  %_856~4':_r64 %_857~2':_r64 %_848~3':_r64 %_849~0':_r64 %_851~1':_r64 }
; _f860 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_899
	btr r12,3
	jmp LB_900
LB_899:
	bts r12,3
LB_900:
	mov r8,r14
	bt r12,1
	jc LB_901
	btr r12,2
	jmp LB_902
LB_901:
	bts r12,2
LB_902:
	mov r14,r13
	bt r12,0
	jc LB_903
	btr r12,1
	jmp LB_904
LB_903:
	bts r12,1
LB_904:
	mov r13,r9
	bt r12,3
	jc LB_905
	btr r12,0
	jmp LB_906
LB_905:
	bts r12,0
LB_906:
	call NS_E_860
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_897
	btr r12,4
	clc
	jmp LB_898
LB_897:
	bts r12,4
	stc
LB_898:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_895
	btr r12,3
	clc
	jmp LB_896
LB_895:
	bts r12,3
	stc
LB_896:
	add rsp,24
; _f860 { %_848 %_856 %_858 } ⊢ %_859 : %_859
 ; {>  %_856~4':_r64 %_858~0':_r64 %_848~3':_r64 }
; _f860 { 3' 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100110.. |},{ 3' 4' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,4
	jc LB_907
	btr r12,1
	jmp LB_908
LB_907:
	bts r12,1
LB_908:
	mov r8,r13
	bt r12,0
	jc LB_909
	btr r12,2
	jmp LB_910
LB_909:
	bts r12,2
LB_910:
	mov r13,r9
	bt r12,3
	jc LB_911
	btr r12,0
	jmp LB_912
LB_911:
	bts r12,0
LB_912:
	call NS_E_860
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_859
 ; {>  %_859~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_862:
	mov r15,0
LB_914:
	cmp r15,0
	jz LB_915
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_914
LB_915:
; ∎ %_837
 ; {>  %_839~0':_r64 %_838~1':_r64 %_837~2':_r64 %_840~3':_r64 }
; 	∎ 2'
	bt r12,0
	jc LB_916
	mov rdi,r13
	call dlt
LB_916:
	bt r12,1
	jc LB_917
	mov rdi,r14
	call dlt
LB_917:
	bt r12,3
	jc LB_918
	mov rdi,r9
	call dlt
LB_918:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_919
	btr r12,0
	jmp LB_920
LB_919:
	bts r12,0
LB_920:
	ret
MTC_LB_913:
NS_E_926:
NS_E_RDI_926:
; » 0xr14 |~ {  } ⊢ %_921 : %_921
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_921
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_922 : %_922
 ; {>  %_921~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_922
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_923 : %_923
 ; {>  %_921~0':_r64 %_922~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_923
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f860 { %_921 %_922 %_923 } ⊢ %_924 : %_924
 ; {>  %_921~0':_r64 %_923~2':_r64 %_922~1':_r64 }
; _f860 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_860
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 %_924 ⊢ %_925 : %_925
 ; {>  %_924~0':_r64 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_925~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_927
	mov rdi,r13
	call dlt
LB_927:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_958:
; 	|» { 0' 1' 2' }
NS_E_RDI_958:
; _f50 { %_929 %_928 } ⊢ { %_931 %_932 %_933 } : { %_931 %_932 %_933 }
 ; {>  %_929~1':_r64 %_930~2':_r64 %_928~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_959:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_960
LB_961:
	cmp r15,0
	jz LB_962
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_961
LB_962:
; _f55 %_932 ⊢ %_934 : %_934
 ; {>  %_930~2':_r64 %_932~0':_r64 %_931~1':_r64 }
	sub r13,1
; _f958 { %_934 %_931 %_930 } ⊢ { %_935 %_936 %_937 %_938 } : { %_935 %_936 %_937 %_938 }
 ; {>  %_934~0':_r64 %_930~2':_r64 %_931~1':_r64 }
; _f958 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_958
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f56 %_935 ⊢ %_939 : %_939
 ; {>  %_935~0':_r64 %_937~2':_r64 %_938~3':_r64 %_936~1':_r64 }
	add r13,1
; _f55 %_936 ⊢ %_940 : %_940
 ; {>  %_937~2':_r64 %_938~3':_r64 %_939~0':_r64 %_936~1':_r64 }
	sub r14,1
; _f958 { %_940 %_937 %_939 } ⊢ { %_941 %_942 %_943 %_944 } : { %_941 %_942 %_943 %_944 }
 ; {>  %_940~1':_r64 %_937~2':_r64 %_938~3':_r64 %_939~0':_r64 }
; _f958 { 1' 2' 0' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_965
	btr r12,3
	jmp LB_966
LB_965:
	bts r12,3
LB_966:
	mov r8,r13
	bt r12,0
	jc LB_967
	btr r12,2
	jmp LB_968
LB_967:
	bts r12,2
LB_968:
	mov r13,r14
	bt r12,1
	jc LB_969
	btr r12,0
	jmp LB_970
LB_969:
	bts r12,0
LB_970:
	mov r14,r9
	bt r12,3
	jc LB_971
	btr r12,1
	jmp LB_972
LB_971:
	bts r12,1
LB_972:
	call NS_E_958
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r10,r9
	bt r12,3
	jc LB_973
	btr r12,4
	jmp LB_974
LB_973:
	bts r12,4
LB_974:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_963
	btr r12,3
	clc
	jmp LB_964
LB_963:
	bts r12,3
	stc
LB_964:
	add rsp,16
; _f56 %_941 ⊢ %_945 : %_945
 ; {>  %_941~0':_r64 %_938~3':_r64 %_942~1':_r64 %_944~4':_r64 %_943~2':_r64 }
	add r13,1
; _f55 %_942 ⊢ %_946 : %_946
 ; {>  %_938~3':_r64 %_945~0':_r64 %_942~1':_r64 %_944~4':_r64 %_943~2':_r64 }
	sub r14,1
; _f958 { %_946 %_943 %_945 } ⊢ { %_947 %_948 %_949 %_950 } : { %_947 %_948 %_949 %_950 }
 ; {>  %_946~1':_r64 %_938~3':_r64 %_945~0':_r64 %_944~4':_r64 %_943~2':_r64 }
; _f958 { 1' 2' 0' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_979
	btr r12,3
	jmp LB_980
LB_979:
	bts r12,3
LB_980:
	mov r8,r13
	bt r12,0
	jc LB_981
	btr r12,2
	jmp LB_982
LB_981:
	bts r12,2
LB_982:
	mov r13,r14
	bt r12,1
	jc LB_983
	btr r12,0
	jmp LB_984
LB_983:
	bts r12,0
LB_984:
	mov r14,r9
	bt r12,3
	jc LB_985
	btr r12,1
	jmp LB_986
LB_985:
	bts r12,1
LB_986:
	call NS_E_958
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r11,r9
	bt r12,3
	jc LB_987
	btr r12,5
	jmp LB_988
LB_987:
	bts r12,5
LB_988:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_977
	btr r12,4
	clc
	jmp LB_978
LB_977:
	bts r12,4
	stc
LB_978:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_975
	btr r12,3
	clc
	jmp LB_976
LB_975:
	bts r12,3
	stc
LB_976:
	add rsp,24
; _f56 %_947 ⊢ %_951 : %_951
 ; {>  %_950~5':_r64 %_938~3':_r64 %_948~1':_r64 %_949~2':_r64 %_947~0':_r64 %_944~4':_r64 }
	add r13,1
; _f958 { %_938 %_944 %_950 } ⊢ { %_952 %_953 %_954 %_955 } : { %_952 %_953 %_954 %_955 }
 ; {>  %_950~5':_r64 %_951~0':_r64 %_938~3':_r64 %_948~1':_r64 %_949~2':_r64 %_944~4':_r64 }
; _f958 { 3' 4' 5' } ⊢ { 3' 4' 5' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_995
	btr r12,0
	jmp LB_996
LB_995:
	bts r12,0
LB_996:
	mov r14,r10
	bt r12,4
	jc LB_997
	btr r12,1
	jmp LB_998
LB_997:
	bts r12,1
LB_998:
	mov r8,r11
	bt r12,5
	jc LB_999
	btr r12,2
	jmp LB_1000
LB_999:
	bts r12,2
LB_1000:
	call NS_E_958
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 3' 4' 5' 6' }
	mov r10,r14
	bt r12,1
	jc LB_1001
	btr r12,4
	jmp LB_1002
LB_1001:
	bts r12,4
LB_1002:
	mov r11,r8
	bt r12,2
	jc LB_1003
	btr r12,5
	jmp LB_1004
LB_1003:
	bts r12,5
LB_1004:
	mov rcx,r9
	bt r12,3
	jc LB_1005
	btr r12,6
	jmp LB_1006
LB_1005:
	bts r12,6
LB_1006:
	mov r9,r13
	bt r12,0
	jc LB_1007
	btr r12,3
	jmp LB_1008
LB_1007:
	bts r12,3
LB_1008:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_993
	btr r12,2
	clc
	jmp LB_994
LB_993:
	bts r12,2
	stc
LB_994:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_991
	btr r12,1
	clc
	jmp LB_992
LB_991:
	bts r12,1
	stc
LB_992:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_989
	btr r12,0
	clc
	jmp LB_990
LB_989:
	bts r12,0
	stc
LB_990:
	add rsp,32
; ∎ { %_948 %_949 %_951 %_955 }
 ; {>  %_953~4':_r64 %_954~5':_r64 %_951~0':_r64 %_948~1':_r64 %_949~2':_r64 %_955~6':_r64 %_952~3':_r64 }
; 	∎ { 1' 2' 0' 6' }
	bt r12,4
	jc LB_1009
	mov rdi,r10
	call dlt
LB_1009:
	bt r12,5
	jc LB_1010
	mov rdi,r11
	call dlt
LB_1010:
	bt r12,3
	jc LB_1011
	mov rdi,r9
	call dlt
LB_1011:
; _emt_mov_ptn_to_ptn:{| 11100010.. |},{ 1' 2' 0' 6' } ⊢ { 0' 1' 2' 3' }
	mov r9,rcx
	bt r12,6
	jc LB_1012
	btr r12,3
	jmp LB_1013
LB_1012:
	bts r12,3
LB_1013:
	mov r10,r8
	bt r12,2
	jc LB_1014
	btr r12,4
	jmp LB_1015
LB_1014:
	bts r12,4
LB_1015:
	mov r8,r13
	bt r12,0
	jc LB_1016
	btr r12,2
	jmp LB_1017
LB_1016:
	bts r12,2
LB_1017:
	mov r13,r14
	bt r12,1
	jc LB_1018
	btr r12,0
	jmp LB_1019
LB_1018:
	bts r12,0
LB_1019:
	mov r14,r10
	bt r12,4
	jc LB_1020
	btr r12,1
	jmp LB_1021
LB_1020:
	bts r12,1
LB_1021:
	ret
MTC_LB_960:
	mov r15,0
LB_1023:
	cmp r15,0
	jz LB_1024
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1023
LB_1024:
; _f53 %_930 ⊢ { %_956 %_957 } : { %_956 %_957 }
 ; {>  %_933~3':_r64 %_930~2':_r64 %_932~0':_r64 %_931~1':_r64 }
	mov r10,r8
	bts r12,4
; ∎ { %_932 %_931 %_956 %_957 }
 ; {>  %_956~2':_r64 %_933~3':_r64 %_932~0':_r64 %_957~4':_r64 %_931~1':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_1025
	mov rdi,r9
	call dlt
LB_1025:
; _emt_mov_ptn_to_ptn:{| 111010.. |},{ 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r9,r10
	bt r12,4
	jc LB_1026
	btr r12,3
	jmp LB_1027
LB_1026:
	bts r12,3
LB_1027:
	ret
MTC_LB_1022:
NS_E_1037:
; 	|» 0'
NS_E_RDI_1037:
MTC_LB_1038:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz MTC_LB_1039
LB_1040:
	cmp r15,0
	jz LB_1041
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1040
LB_1041:
; » 0xr1 |~ {  } ⊢ %_1029 : %_1029
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_1029
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_1029
 ; {>  %_1029~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1039:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r13
	jnz MTC_LB_1042
LB_1043:
	cmp r15,0
	jz LB_1044
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1043
LB_1044:
; » 0xr1 |~ {  } ⊢ %_1030 : %_1030
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_1030
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_1030
 ; {>  %_1030~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1042:
	mov r15,0
LB_1046:
	cmp r15,0
	jz LB_1047
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1046
LB_1047:
; _f53 %_1028 ⊢ { %_1031 %_1032 } : { %_1031 %_1032 }
 ; {>  %_1028~0':_r64 }
	mov r14,r13
	bts r12,1
; _f55 %_1032 ⊢ %_1033 : %_1033
 ; {>  %_1032~1':_r64 %_1031~0':_r64 }
	sub r14,1
; _f1037 %_1033 ⊢ %_1034 : %_1034
 ; {>  %_1033~1':_r64 %_1031~0':_r64 }
; _f1037 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1050
	btr r12,0
	jmp LB_1051
LB_1050:
	bts r12,0
LB_1051:
	call NS_E_1037
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1052
	btr r12,1
	jmp LB_1053
LB_1052:
	bts r12,1
LB_1053:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1048
	btr r12,0
	clc
	jmp LB_1049
LB_1048:
	bts r12,0
	stc
LB_1049:
	add rsp,16
; _f57 { %_1031 %_1034 } ⊢ { %_1035 %_1036 } : { %_1035 %_1036 }
 ; {>  %_1034~1':_r64 %_1031~0':_r64 }
	imul r13,r14
; ∎ %_1035
 ; {>  %_1036~1':_r64 %_1035~0':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1054
	mov rdi,r14
	call dlt
LB_1054:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1045:
NS_E_1059:
NS_E_RDI_1059:
; » 0xr0 |~ {  } ⊢ %_1055 : %_1055
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_1055
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr4 |~ {  } ⊢ %_1056 : %_1056
 ; {>  %_1055~0':_r64 }
; 	» 0xr4 _ ⊢ 1' : %_1056
	mov rdi,0x4
	mov r14,rdi
	bts r12,1
; _f1037 %_1056 ⊢ %_1057 : %_1057
 ; {>  %_1056~1':_r64 %_1055~0':_r64 }
; _f1037 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1062
	btr r12,0
	jmp LB_1063
LB_1062:
	bts r12,0
LB_1063:
	call NS_E_1037
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1064
	btr r12,1
	jmp LB_1065
LB_1064:
	bts r12,1
LB_1065:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1060
	btr r12,0
	clc
	jmp LB_1061
LB_1060:
	bts r12,0
	stc
LB_1061:
	add rsp,16
; _f38 %_1057 ⊢ %_1058 : %_1058
 ; {>  %_1057~1':_r64 %_1055~0':_r64 }
; _f38 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1068
	btr r12,0
	jmp LB_1069
LB_1068:
	bts r12,0
LB_1069:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1070
	btr r12,1
	jmp LB_1071
LB_1070:
	bts r12,1
LB_1071:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1066
	btr r12,0
	clc
	jmp LB_1067
LB_1066:
	bts r12,0
	stc
LB_1067:
	add rsp,16
; ∎ {  }
 ; {>  %_1058~1':_r64 %_1055~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_1072
	mov rdi,r14
	call dlt
LB_1072:
	bt r12,0
	jc LB_1073
	mov rdi,r13
	call dlt
LB_1073:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1082:
NS_E_RDI_1082:
; » 0xr14 |~ {  } ⊢ %_1074 : %_1074
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_1074
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_1075 : %_1075
 ; {>  %_1074~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_1075
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_1076 : %_1076
 ; {>  %_1074~0':_r64 %_1075~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_1076
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f958 { %_1074 %_1075 %_1076 } ⊢ { %_1077 %_1078 %_1079 %_1080 } : { %_1077 %_1078 %_1079 %_1080 }
 ; {>  %_1074~0':_r64 %_1076~2':_r64 %_1075~1':_r64 }
; _f958 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_958
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 %_1080 ⊢ %_1081 : %_1081
 ; {>  %_1080~3':_r64 %_1078~1':_r64 %_1077~0':_r64 %_1079~2':_r64 }
; _f38 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1089
	btr r12,0
	jmp LB_1090
LB_1089:
	bts r12,0
LB_1090:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_1091
	btr r12,3
	jmp LB_1092
LB_1091:
	bts r12,3
LB_1092:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1087
	btr r12,2
	clc
	jmp LB_1088
LB_1087:
	bts r12,2
	stc
LB_1088:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1085
	btr r12,1
	clc
	jmp LB_1086
LB_1085:
	bts r12,1
	stc
LB_1086:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1083
	btr r12,0
	clc
	jmp LB_1084
LB_1083:
	bts r12,0
	stc
LB_1084:
	add rsp,32
; ∎ {  }
 ; {>  %_1081~3':_r64 %_1078~1':_r64 %_1077~0':_r64 %_1079~2':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_1093
	mov rdi,r9
	call dlt
LB_1093:
	bt r12,1
	jc LB_1094
	mov rdi,r14
	call dlt
LB_1094:
	bt r12,0
	jc LB_1095
	mov rdi,r13
	call dlt
LB_1095:
	bt r12,2
	jc LB_1096
	mov rdi,r8
	call dlt
LB_1096:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	CST_DYN_471:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_737:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_788:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_926:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_1059:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_1082:
		dq 0x0000_0001_00_82_ffff
		dq 1
