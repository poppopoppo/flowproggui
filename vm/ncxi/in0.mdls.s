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
	call NS_E_81
	call NS_E_262
	call NS_E_281
	call exec_out
	jmp _end
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
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
NS_E_66:
NS_E_RDI_66:
NS_E_66_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_67
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_67:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_69_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
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
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_70_LB_0
	cmp r11,57
	ja NS_E_70_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_70_LB_0:
	mov rax,0
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_72_LB_0
	cmp r11,122
	ja NS_E_72_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_72_LB_0:
	mov rax,0
	ret
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_71_LB_0
	cmp r11,90
	ja NS_E_71_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_71_LB_0:
	mov rax,0
	ret
NS_E_44:
	mov rdi,r13
	bt r12,0
NS_E_RDI_44:
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
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
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_30: dq 0
NS_E_30:
NS_E_RDI_30:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_68:
NS_E_RDI_68:
NS_E_68_ETR_TBL:
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
	jz NS_E_68_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_68_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_81:
NS_E_RDI_81:
; 	» "-27686gg" _ ⊢ 0' : %_73
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » _f26 |~ {  } ⊢ %_74 : %_74
 ; {>  %_73~0':_stg }
; 	» _args _ ⊢ 1' : %_74
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
	mov r14,rax
	btr r12,1
; » _f26 |~ {  } ⊢ %_75 : %_75
 ; {>  %_74~1':(_lst)◂(_stg) %_73~0':_stg }
; 	» _args _ ⊢ 2' : %_75
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
; » _f26 |~ {  } ⊢ %_76 : %_76
 ; {>  %_75~2':(_lst)◂(_stg) %_74~1':(_lst)◂(_stg) %_73~0':_stg }
; 	» _args _ ⊢ 3' : %_76
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
	mov r9,rax
	btr r12,3
; _f37 { %_74 %_75 %_76 } ⊢ { %_77 %_78 %_79 } : { %_77 %_78 %_79 }
 ; {>  %_76~3':(_lst)◂(_stg) %_75~2':(_lst)◂(_stg) %_74~1':(_lst)◂(_stg) %_73~0':_stg }
; _f37 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110.. |},{ 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r14
	bt r12,1
	jc LB_86
	btr r12,4
	jmp LB_87
LB_86:
	bts r12,4
LB_87:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_84
	btr QWORD [rdi],0
	jmp LB_85
LB_84:
	bts QWORD [rdi],0
LB_85:
	mov r10,r8
	bt r12,2
	jc LB_90
	btr r12,4
	jmp LB_91
LB_90:
	bts r12,4
LB_91:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_88
	btr QWORD [rdi],1
	jmp LB_89
LB_88:
	bts QWORD [rdi],1
LB_89:
	mov r10,r9
	bt r12,3
	jc LB_94
	btr r12,4
	jmp LB_95
LB_94:
	bts r12,4
LB_95:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_92
	btr QWORD [rdi],2
	jmp LB_93
LB_92:
	bts QWORD [rdi],2
LB_93:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' 3' }
; 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_98
	btr r12,4
	jmp LB_99
LB_98:
	bts r12,4
LB_99:
	mov r14,r10
	bt r12,4
	jc LB_96
	btr r12,1
	jmp LB_97
LB_96:
	bts r12,1
LB_97:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_102
	btr r12,4
	jmp LB_103
LB_102:
	bts r12,4
LB_103:
	mov r8,r10
	bt r12,4
	jc LB_100
	btr r12,2
	jmp LB_101
LB_100:
	bts r12,2
LB_101:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_106
	btr r12,4
	jmp LB_107
LB_106:
	bts r12,4
LB_107:
	mov r9,r10
	bt r12,4
	jc LB_104
	btr r12,3
	jmp LB_105
LB_104:
	bts r12,3
LB_105:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_82
	btr r12,0
	jmp LB_83
LB_82:
	bts r12,0
LB_83:
	add rsp,16
; _f37 %_73 ⊢ %_80 : %_80
 ; {>  %_79~3':(_lst)◂(_stg) %_77~1':(_lst)◂(_stg) %_78~2':(_lst)◂(_stg) %_73~0':_stg }
; _f37 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_112
	btr r12,3
	jmp LB_113
LB_112:
	bts r12,3
LB_113:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_110
	btr r12,2
	jmp LB_111
LB_110:
	bts r12,2
LB_111:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_108
	btr r12,1
	jmp LB_109
LB_108:
	bts r12,1
LB_109:
	add rsp,32
; ∎ {  }
 ; {>  %_80~0':_stg %_79~3':(_lst)◂(_stg) %_77~1':(_lst)◂(_stg) %_78~2':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_114
	mov rdi,r13
	call dlt
LB_114:
	bt r12,3
	jc LB_115
	mov rdi,r9
	call dlt
LB_115:
	bt r12,1
	jc LB_116
	mov rdi,r14
	call dlt
LB_116:
	bt r12,2
	jc LB_117
	mov rdi,r8
	call dlt
LB_117:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_125:
; 	|» 0'
NS_E_RDI_125:
MTC_LB_126:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_127
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_128
	bt QWORD [rdi],0
	jc LB_129
	btr r12,3
	jmp LB_130
LB_129:
	bts r12,3
LB_130:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_128:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_133
	btr r12,4
	jmp LB_134
LB_133:
	bts r12,4
LB_134:
	mov r14,r10
	bt r12,4
	jc LB_131
	btr r12,1
	jmp LB_132
LB_131:
	bts r12,1
LB_132:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_137
	btr r12,4
	jmp LB_138
LB_137:
	bts r12,4
LB_138:
	mov r8,r10
	bt r12,4
	jc LB_135
	btr r12,2
	jmp LB_136
LB_135:
	bts r12,2
LB_136:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_127
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_139
	bt QWORD [rdi],0
	jc LB_140
	btr r12,5
	jmp LB_141
LB_140:
	bts r12,5
LB_141:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_139:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_144
	btr r12,6
	jmp LB_145
LB_144:
	bts r12,6
LB_145:
	mov r9,rcx
	bt r12,6
	jc LB_142
	btr r12,3
	jmp LB_143
LB_142:
	bts r12,3
LB_143:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_148
	btr r12,6
	jmp LB_149
LB_148:
	bts r12,6
LB_149:
	mov r10,rcx
	bt r12,6
	jc LB_146
	btr r12,4
	jmp LB_147
LB_146:
	bts r12,4
LB_147:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_150:
	cmp r15,0
	jz LB_151
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_150
LB_151:
; ∎ {  }
 ; {>  %_122~4':(_lst)◂(t47'(-1)) %_121~3':t47'(-1) %_119~1':t47'(-1) }
; 	∎ {  }
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
	bt r12,1
	jc LB_154
	mov rdi,r14
	call dlt
LB_154:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_127:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_155
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_156
	bt QWORD [rdi],0
	jc LB_157
	btr r12,3
	jmp LB_158
LB_157:
	bts r12,3
LB_158:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_156:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_161
	btr r12,4
	jmp LB_162
LB_161:
	bts r12,4
LB_162:
	mov r14,r10
	bt r12,4
	jc LB_159
	btr r12,1
	jmp LB_160
LB_159:
	bts r12,1
LB_160:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_165
	btr r12,4
	jmp LB_166
LB_165:
	bts r12,4
LB_166:
	mov r8,r10
	bt r12,4
	jc LB_163
	btr r12,2
	jmp LB_164
LB_163:
	bts r12,2
LB_164:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_155
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_167
	bt QWORD [rdi],0
	jc LB_168
	btr r12,3
	jmp LB_169
LB_168:
	bts r12,3
LB_169:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_167:
	mov r9,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_170:
	cmp r15,0
	jz LB_171
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_170
LB_171:
; ∎ {  }
 ; {>  %_123~1':t47'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_172
	mov rdi,r14
	call dlt
LB_172:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_155:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_173
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_174
	bt QWORD [rdi],0
	jc LB_175
	btr r12,1
	jmp LB_176
LB_175:
	bts r12,1
LB_176:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_174:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_177:
	cmp r15,0
	jz LB_178
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_177
LB_178:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_173:
NS_E_179:
NS_E_RDI_179:
NS_E_179_ETR_TBL:
NS_E_179_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_206
	jmp LB_207
LB_206:
	jmp LB_189
LB_207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_179_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_199:
	jmp LB_190
LB_198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_193
	btr r12,1
	jmp LB_194
LB_193:
	bts r12,1
LB_194:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,32
	push rdi
	push rsi
	push LB_186
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_208
	btr r12,2
	jmp LB_209
LB_208:
	bts r12,2
LB_209:
	mov r13,r14
	bt r12,1
	jc LB_210
	btr r12,0
	jmp LB_211
LB_210:
	bts r12,0
LB_211:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_180 ⊢ %_181 : %_181
 ; {>  %_180~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_181
 ; {>  %_181~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_184
	btr r12,3
	jmp LB_185
LB_184:
	bts r12,3
LB_185:
	mov r8,0
	bts r12,2
	ret
LB_186:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_188
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_187
LB_188:
	add rsp,8
	ret
LB_190:
	add rsp,32
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
LB_189:
	add rsp,32
	pop r14
LB_187:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "C"
	add r14,1
	cmp r14,r10
	jg LB_225
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_225
	jmp LB_226
LB_225:
	jmp LB_217
LB_226:
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
	jc LB_218
	btr r12,0
	jmp LB_219
LB_218:
	bts r12,0
LB_219:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_214
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_182 : %_182
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_182
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_182 ⊢ %_183 : %_183
 ; {>  %_182~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_183
 ; {>  %_183~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_212
	btr r12,3
	jmp LB_213
LB_212:
	bts r12,3
LB_213:
	mov r8,0
	bts r12,2
	ret
LB_214:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_216
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_215
LB_216:
	add rsp,8
	ret
LB_217:
	add rsp,16
	pop r14
LB_215:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_233:
; 	|» 0'
NS_E_RDI_233:
MTC_LB_234:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_235
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_236
	bt QWORD [rdi],0
	jc LB_237
	btr r12,2
	jmp LB_238
LB_237:
	bts r12,2
LB_238:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_236:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_239
	btr r12,1
	jmp LB_240
LB_239:
	bts r12,1
LB_240:
LB_241:
	cmp r15,0
	jz LB_242
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_241
LB_242:
; ∎ {  }
 ; {>  %_231~1':(_lst)◂((_p227)◂(t77'(-1))) }
; 	∎ {  }
	bt r12,1
	jc LB_243
	mov rdi,r14
	call dlt
LB_243:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_235:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_244
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_245
	bt QWORD [rdi],0
	jc LB_246
	btr r12,2
	jmp LB_247
LB_246:
	bts r12,2
LB_247:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_245:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_248
	btr r12,1
	jmp LB_249
LB_248:
	bts r12,1
LB_249:
LB_250:
	cmp r15,0
	jz LB_251
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_250
LB_251:
; ∎ {  }
 ; {>  %_232~1':t77'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_252
	mov rdi,r14
	call dlt
LB_252:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_244:
NS_E_262:
NS_E_RDI_262:
; 	» "A" _ ⊢ 0' : %_253
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr1 |~ {  } ⊢ %_254 : %_254
 ; {>  %_253~0':_stg }
; 	» 0xr1 _ ⊢ 1' : %_254
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_255 : %_255
 ; {>  %_254~1':_r64 %_253~0':_stg }
; _nil {  } ⊢ °1◂{  }
; _f228 %_255 ⊢ %_256 : %_256
 ; {>  %_255~°1◂{  }:(_lst)◂(t85'(0)) %_254~1':_r64 %_253~0':_stg }
; _f228 °1◂{  } ⊢ °0◂°1◂{  }
; _f229 %_254 ⊢ %_257 : %_257
 ; {>  %_254~1':_r64 %_253~0':_stg %_256~°0◂°1◂{  }:(_p227)◂(t87'(0)) }
; _f229 1' ⊢ °1◂1'
; _f229 %_253 ⊢ %_258 : %_258
 ; {>  %_257~°1◂1':(_p227)◂(_r64) %_253~0':_stg %_256~°0◂°1◂{  }:(_p227)◂(t87'(0)) }
; _f229 0' ⊢ °1◂0'
; » 0xr8 |~ {  } ⊢ %_259 : %_259
 ; {>  %_257~°1◂1':(_p227)◂(_r64) %_258~°1◂0':(_p227)◂(_stg) %_256~°0◂°1◂{  }:(_p227)◂(t87'(0)) }
; 	» 0xr8 _ ⊢ 2' : %_259
	mov rdi,0x8
	mov r8,rdi
	bts r12,2
; _f19 %_259 ⊢ { %_260 %_261 } : { %_260 %_261 }
 ; {>  %_257~°1◂1':(_p227)◂(_r64) %_259~2':_r64 %_258~°1◂0':(_p227)◂(_stg) %_256~°0◂°1◂{  }:(_p227)◂(t87'(0)) }
; _f19 2' ⊢ { 2' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_267
	btr r12,0
	jmp LB_268
LB_267:
	bts r12,0
LB_268:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_269
	btr r12,2
	jmp LB_270
LB_269:
	bts r12,2
LB_270:
	mov r9,r14
	bt r12,1
	jc LB_271
	btr r12,3
	jmp LB_272
LB_271:
	bts r12,3
LB_272:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_265
	btr r12,1
	jmp LB_266
LB_265:
	bts r12,1
LB_266:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_263
	btr r12,0
	jmp LB_264
LB_263:
	bts r12,0
LB_264:
	add rsp,24
; ∎ {  }
 ; {>  %_257~°1◂1':(_p227)◂(_r64) %_261~3':t97'(0) %_258~°1◂0':(_p227)◂(_stg) %_260~2':_r64 %_256~°0◂°1◂{  }:(_p227)◂(t87'(0)) }
; 	∎ {  }
	bt r12,1
	jc LB_273
	mov rdi,r14
	call dlt
LB_273:
	bt r12,3
	jc LB_274
	mov rdi,r9
	call dlt
LB_274:
	bt r12,0
	jc LB_275
	mov rdi,r13
	call dlt
LB_275:
	bt r12,2
	jc LB_276
	mov rdi,r8
	call dlt
LB_276:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_281:
NS_E_RDI_281:
; » 0xr9 |~ {  } ⊢ %_277 : %_277
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_277
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,2
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\tX"
	mov rax,r13
LB_282:
	cmp rax,0
	jz LB_283
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_58
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
	sub rax,1
	jmp LB_282
LB_283:
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; _f37 %_279 ⊢ %_280 : %_280
 ; {>  %_279~1':_stg %_278~0':_r64 }
; _f37 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_286
	btr r12,0
	jmp LB_287
LB_286:
	bts r12,0
LB_287:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_288
	btr r12,1
	jmp LB_289
LB_288:
	bts r12,1
LB_289:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_284
	btr r12,0
	jmp LB_285
LB_284:
	bts r12,0
LB_285:
	add rsp,16
; ∎ {  }
 ; {>  %_278~0':_r64 %_280~1':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_290
	mov rdi,r13
	call dlt
LB_290:
	bt r12,1
	jc LB_291
	mov rdi,r14
	call dlt
LB_291:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_305:
; 	|» { 0' 1' }
NS_E_RDI_305:
MTC_LB_306:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_307
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
	jnc LB_308
	bt QWORD [rdi],0
	jc LB_309
	btr r12,4
	jmp LB_310
LB_309:
	bts r12,4
LB_310:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_308:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_313
	btr r12,5
	jmp LB_314
LB_313:
	bts r12,5
LB_314:
	mov r8,r11
	bt r12,5
	jc LB_311
	btr r12,2
	jmp LB_312
LB_311:
	bts r12,2
LB_312:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_317
	btr r12,5
	jmp LB_318
LB_317:
	bts r12,5
LB_318:
	mov r9,r11
	bt r12,5
	jc LB_315
	btr r12,3
	jmp LB_316
LB_315:
	bts r12,3
LB_316:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_319:
	cmp r15,0
	jz LB_320
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_319
LB_320:
; _f52 %_292 ⊢ { %_296 %_297 } : { %_296 %_297 }
 ; {>  %_295~3':(_lst)◂(_r64) %_292~0':_r64 %_294~2':_r64 }
	mov r14,r13
	bts r12,1
; _f55 %_297 ⊢ %_298 : %_298
 ; {>  %_297~1':_r64 %_295~3':(_lst)◂(_r64) %_296~0':_r64 %_294~2':_r64 }
	add r14,1
; _f305 { %_298 %_295 } ⊢ %_299 : %_299
 ; {>  %_295~3':(_lst)◂(_r64) %_298~1':_r64 %_296~0':_r64 %_294~2':_r64 }
; _f305 { 1' 3' } ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 1' 3' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_325
	btr r12,0
	jmp LB_326
LB_325:
	bts r12,0
LB_326:
	mov r14,r9
	bt r12,3
	jc LB_327
	btr r12,1
	jmp LB_328
LB_327:
	bts r12,1
LB_328:
	call NS_E_305
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_329
	btr r12,1
	jmp LB_330
LB_329:
	bts r12,1
LB_330:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_323
	btr r12,2
	jmp LB_324
LB_323:
	bts r12,2
LB_324:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_321
	btr r12,0
	jmp LB_322
LB_321:
	bts r12,0
LB_322:
	add rsp,24
; _f32 { %_299 %_296 %_294 } ⊢ { %_300 %_301 %_302 } : { %_300 %_301 %_302 }
 ; {>  %_299~1':_stg %_296~0':_r64 %_294~2':_r64 }
; _f32 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_331
	btr r12,3
	jmp LB_332
LB_331:
	bts r12,3
LB_332:
	mov r14,r13
	bt r12,0
	jc LB_333
	btr r12,1
	jmp LB_334
LB_333:
	bts r12,1
LB_334:
	mov r13,r9
	bt r12,3
	jc LB_335
	btr r12,0
	jmp LB_336
LB_335:
	bts r12,0
LB_336:
	call NS_E_32
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_300
 ; {>  %_301~1':_r64 %_300~0':_stg %_302~2':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_337
	mov rdi,r14
	call dlt
LB_337:
	bt r12,2
	jc LB_338
	mov rdi,r8
	call dlt
LB_338:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_307:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_339
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
	jnc LB_340
	bt QWORD [rdi],0
	jc LB_341
	btr r12,2
	jmp LB_342
LB_341:
	bts r12,2
LB_342:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_340:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_343:
	cmp r15,0
	jz LB_344
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_343
LB_344:
; _f30 %_292 ⊢ { %_303 %_304 } : { %_303 %_304 }
 ; {>  %_292~0':_r64 }
; _f30 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_30
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_304
 ; {>  %_304~1':_stg %_303~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_345
	mov rdi,r13
	call dlt
LB_345:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_346
	btr r12,0
	jmp LB_347
LB_346:
	bts r12,0
LB_347:
	ret
MTC_LB_339:
section .data
	NS_E_DYN_66:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_66
	NS_E_DYN_69:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_69
	NS_E_DYN_70:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_70
	NS_E_DYN_71:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_71
	NS_E_DYN_72:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_72
	CST_DYN_81:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_125:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_125
	NS_E_DYN_179:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_179
	NS_E_DYN_228:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_229:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_233:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_233
	CST_DYN_262:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_281:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_305:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_305
