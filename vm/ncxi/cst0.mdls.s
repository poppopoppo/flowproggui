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
	call NS_E_206
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
NS_E_77:
NS_E_RDI_77:
NS_E_77_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_78
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_78:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_80:
NS_E_RDI_80:
NS_E_80_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_80_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_80_LB_0:
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
NS_E_81_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_81_LB_0
	cmp r11,57
	ja NS_E_81_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_81_LB_0:
	mov rax,0
	ret
NS_E_83:
NS_E_RDI_83:
NS_E_83_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_83_LB_0
	cmp r11,122
	ja NS_E_83_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_83_LB_0:
	mov rax,0
	ret
NS_E_82:
NS_E_RDI_82:
NS_E_82_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_82_LB_0
	cmp r11,90
	ja NS_E_82_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_82_LB_0:
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
NS_E_ID_59: dq 0
NS_E_59:
NS_E_RDI_59:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_89
	bt QWORD [rdi],17
	jnc LB_89
	bt QWORD [rdi],0
	jc LB_91
	btr r12,2
	clc
	jmp LB_92
LB_91:
	bts r12,2
	stc
LB_92:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_90
LB_89:
	btr r12,2
	clc
	call dcp
LB_90:
	mov r8,rax
	pop r14
	pop r13
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
	jc LB_85
	bt QWORD [rdi],17
	jnc LB_85
	bt QWORD [rdi],0
	jc LB_87
	btr r12,2
	clc
	jmp LB_88
LB_87:
	bts r12,2
	stc
LB_88:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_86
LB_85:
	btr r12,2
	clc
	call dcp
LB_86:
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
	jc LB_84
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_84:
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
NS_E_79:
NS_E_RDI_79:
NS_E_79_ETR_TBL:
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
	jz NS_E_79_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_79_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_95:
; 	|» { 0' 1' }
NS_E_RDI_95:
; _f51 %_93 ⊢ %_94 : %_94
 ; {>  %_93~{ 0' 1' }:{ _r64 _r64 } }
	add r13,r14
	jmp err
NS_E_96:
NS_E_RDI_96:
NS_E_96_ETR_TBL:
NS_E_96_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_139
LB_138:
	add r14,1
LB_139:
	cmp r14,r10
	jge LB_140
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_138
	cmp al,10
	jz LB_138
	cmp al,32
	jz LB_138
LB_140:
	add r14,1
	cmp r14,r10
	jg LB_143
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_143
	jmp LB_144
LB_143:
	jmp LB_131
LB_144:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; rcd_lst
	jmp LB_146
LB_145:
	add r14,1
LB_146:
	cmp r14,r10
	jge LB_147
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_145
	cmp al,10
	jz LB_145
	cmp al,32
	jz LB_145
LB_147:
	push r10
	call NS_E_97_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_148
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_149
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_149:
	jmp LB_131
LB_148:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_152
LB_151:
	add r14,1
LB_152:
	cmp r14,r10
	jge LB_153
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_151
	cmp al,10
	jz LB_151
	cmp al,32
	jz LB_151
LB_153:
	add r14,1
	cmp r14,r10
	jg LB_158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_158
	jmp LB_159
LB_158:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_155
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_155:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_156
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_156:
	jmp LB_131
LB_159:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_136
	btr r12,2
	clc
	jmp LB_137
LB_136:
	bts r12,2
	stc
LB_137:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_134
	btr r12,1
	clc
	jmp LB_135
LB_134:
	bts r12,1
	stc
LB_135:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_132
	btr r12,0
	clc
	jmp LB_133
LB_132:
	bts r12,0
	stc
LB_133:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_128
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_160
	btr r12,3
	jmp LB_161
LB_160:
	bts r12,3
LB_161:
	mov r13,r14
	bt r12,1
	jc LB_162
	btr r12,0
	jmp LB_163
LB_162:
	bts r12,0
LB_163:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f38 { %_69 %_68 } ⊢ { %_99 %_100 } : { %_99 %_100 }
 ; {>  %_68~2':_r64 %_69~1':_r64 %_98~0':_r64 }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_110
	btr r12,3
	jmp LB_111
LB_110:
	bts r12,3
LB_111:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_108
	btr QWORD [rdi],0
	jmp LB_109
LB_108:
	bts QWORD [rdi],0
LB_109:
	mov r9,r8
	bt r12,2
	jc LB_114
	btr r12,3
	jmp LB_115
LB_114:
	bts r12,3
LB_115:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_112
	btr QWORD [rdi],1
	jmp LB_113
LB_112:
	bts QWORD [rdi],1
LB_113:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_118
	btr r12,3
	clc
	jmp LB_119
LB_118:
	bts r12,3
	stc
LB_119:
	mov r14,r9
	bt r12,3
	jc LB_116
	btr r12,1
	jmp LB_117
LB_116:
	bts r12,1
LB_117:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_122
	btr r12,3
	clc
	jmp LB_123
LB_122:
	bts r12,3
	stc
LB_123:
	mov r8,r9
	bt r12,3
	jc LB_120
	btr r12,2
	jmp LB_121
LB_120:
	bts r12,2
LB_121:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_106
	btr r12,0
	clc
	jmp LB_107
LB_106:
	bts r12,0
	stc
LB_107:
	add rsp,16
; _some %_99 ⊢ %_101 : %_101
 ; {>  %_100~2':_r64 %_99~1':_r64 %_98~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_101
 ; {>  %_100~2':_r64 %_101~°0◂1':(_opn)◂(_r64) %_98~0':_r64 }
; 	∎ °0◂1'
	bt r12,2
	jc LB_124
	mov rdi,r8
	call dlt
LB_124:
	bt r12,0
	jc LB_125
	mov rdi,r13
	call dlt
LB_125:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_126
	btr r12,3
	jmp LB_127
LB_126:
	bts r12,3
LB_127:
	mov r8,0
	bts r12,2
	ret
LB_128:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_130
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_129
LB_130:
	add rsp,8
	ret
LB_131:
	add rsp,48
	pop r14
LB_129:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_97:
NS_E_RDI_97:
NS_E_97_ETR_TBL:
NS_E_97_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; rcd
	jmp LB_178
LB_177:
	add r14,1
LB_178:
	cmp r14,r10
	jge LB_179
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_177
	cmp al,10
	jz LB_177
	cmp al,32
	jz LB_177
LB_179:
	push r10
	call NS_E_96_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_180
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_172
LB_180:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; rcd_lst
	jmp LB_183
LB_182:
	add r14,1
LB_183:
	cmp r14,r10
	jge LB_184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_182
	cmp al,10
	jz LB_182
	cmp al,32
	jz LB_182
LB_184:
	push r10
	call NS_E_97_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_185
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_186:
	jmp LB_172
LB_185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_175
	btr r12,1
	clc
	jmp LB_176
LB_175:
	bts r12,1
	stc
LB_176:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_173
	btr r12,0
	clc
	jmp LB_174
LB_173:
	bts r12,0
	stc
LB_174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_169
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some %_72 ⊢ %_104 : %_104
 ; {>  %_72~2':_r64 %_103~1':_r64 %_102~0':_r64 %_71~3':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_104
 ; {>  %_103~1':_r64 %_104~°0◂2':(_opn)◂(_r64) %_102~0':_r64 %_71~3':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_164
	mov rdi,r14
	call dlt
LB_164:
	bt r12,0
	jc LB_165
	mov rdi,r13
	call dlt
LB_165:
	bt r12,3
	jc LB_166
	mov rdi,r9
	call dlt
LB_166:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_167
	btr r12,3
	jmp LB_168
LB_167:
	bts r12,3
LB_168:
	mov r8,0
	bts r12,2
	ret
LB_169:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_171
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_170
LB_171:
	add rsp,8
	ret
LB_172:
	add rsp,32
	pop r14
LB_170:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_191
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some %_75 ⊢ %_105 : %_105
 ; {>  %_75~0':_r64 %_74~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_105
 ; {>  %_105~°0◂0':(_opn)◂(_r64) %_74~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_188
	mov rdi,r14
	call dlt
LB_188:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_189
	btr r12,3
	jmp LB_190
LB_189:
	bts r12,3
LB_190:
	mov r8,0
	bts r12,2
	ret
LB_191:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_193
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_192
LB_193:
	add rsp,8
	ret
LB_194:
	add rsp,0
	pop r14
LB_192:
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
; 	» "{ {} {} }" _ ⊢ 0' : %_195
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_7d_7b_20_7d_7b_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_7d
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_196 : %_196
 ; {>  %_195~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_196
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f96 { %_195 %_196 } ⊢ { %_197 %_198 %_199 } : { %_197 %_198 %_199 }
 ; {>  %_196~1':_r64 %_195~0':_stg }
; _f96 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_96
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
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_210:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_198 %_199 } ⊢ { %_200 %_201 } : { %_200 %_201 }
 ; {>  %_198~1':_r64 %_199~2':(_opn)◂(_r64) %_197~0':_stg }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_217
	btr r12,3
	jmp LB_218
LB_217:
	bts r12,3
LB_218:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_215
	btr QWORD [rdi],0
	jmp LB_216
LB_215:
	bts QWORD [rdi],0
LB_216:
	mov r9,r8
	bt r12,2
	jc LB_221
	btr r12,3
	jmp LB_222
LB_221:
	bts r12,3
LB_222:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_219
	btr QWORD [rdi],1
	jmp LB_220
LB_219:
	bts QWORD [rdi],1
LB_220:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_225
	btr r12,3
	clc
	jmp LB_226
LB_225:
	bts r12,3
	stc
LB_226:
	mov r14,r9
	bt r12,3
	jc LB_223
	btr r12,1
	jmp LB_224
LB_223:
	bts r12,1
LB_224:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_229
	btr r12,3
	clc
	jmp LB_230
LB_229:
	bts r12,3
	stc
LB_230:
	mov r8,r9
	bt r12,3
	jc LB_227
	btr r12,2
	jmp LB_228
LB_227:
	bts r12,2
LB_228:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_213
	btr r12,0
	clc
	jmp LB_214
LB_213:
	bts r12,0
	stc
LB_214:
	add rsp,16
; 	» "x" _ ⊢ 3' : %_202
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_78
	mov QWORD [rdi+8*1+8*0],rax
	mov r9,rdi
	btr r12,3
; 	» "y" _ ⊢ 4' : %_203
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_79
	mov QWORD [rdi+8*1+8*0],rax
	mov r10,rdi
	btr r12,4
MTC_LB_231:
	mov r15,0
	mov rdi,r9
	mov rsi,r10
	bt r12,3
	call eq
	jnz MTC_LB_232
LB_233:
	cmp r15,0
	jz LB_234
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_233
LB_234:
; _f38 %_202 ⊢ %_204 : %_204
 ; {>  %_202~3':_stg %_201~2':(_opn)◂(_r64) %_200~1':_r64 %_203~4':_stg %_197~0':_stg }
; _f38 3' ⊢ 3'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_243
	btr r12,0
	jmp LB_244
LB_243:
	bts r12,0
LB_244:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_245
	btr r12,3
	jmp LB_246
LB_245:
	bts r12,3
LB_246:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_241
	btr r12,4
	clc
	jmp LB_242
LB_241:
	bts r12,4
	stc
LB_242:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_239
	btr r12,2
	clc
	jmp LB_240
LB_239:
	bts r12,2
	stc
LB_240:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_237
	btr r12,1
	clc
	jmp LB_238
LB_237:
	bts r12,1
	stc
LB_238:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_235
	btr r12,0
	clc
	jmp LB_236
LB_235:
	bts r12,0
	stc
LB_236:
	add rsp,40
; ∎ {  }
 ; {>  %_204~3':_stg %_201~2':(_opn)◂(_r64) %_200~1':_r64 %_203~4':_stg %_197~0':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_247
	mov rdi,r9
	call dlt
LB_247:
	bt r12,2
	jc LB_248
	mov rdi,r8
	call dlt
LB_248:
	bt r12,1
	jc LB_249
	mov rdi,r14
	call dlt
LB_249:
	bt r12,4
	jc LB_250
	mov rdi,r10
	call dlt
LB_250:
	bt r12,0
	jc LB_251
	mov rdi,r13
	call dlt
LB_251:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_232:
	mov r15,0
LB_253:
	cmp r15,0
	jz LB_254
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_253
LB_254:
; _f38 %_203 ⊢ %_205 : %_205
 ; {>  %_202~3':_stg %_201~2':(_opn)◂(_r64) %_200~1':_r64 %_203~4':_stg %_197~0':_stg }
; _f38 4' ⊢ 4'
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
	jc LB_263
	btr r12,0
	jmp LB_264
LB_263:
	bts r12,0
LB_264:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_265
	btr r12,4
	jmp LB_266
LB_265:
	bts r12,4
LB_266:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_261
	btr r12,3
	clc
	jmp LB_262
LB_261:
	bts r12,3
	stc
LB_262:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_259
	btr r12,2
	clc
	jmp LB_260
LB_259:
	bts r12,2
	stc
LB_260:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_257
	btr r12,1
	clc
	jmp LB_258
LB_257:
	bts r12,1
	stc
LB_258:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_255
	btr r12,0
	clc
	jmp LB_256
LB_255:
	bts r12,0
	stc
LB_256:
	add rsp,40
; ∎ {  }
 ; {>  %_202~3':_stg %_205~4':_stg %_201~2':(_opn)◂(_r64) %_200~1':_r64 %_197~0':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_267
	mov rdi,r9
	call dlt
LB_267:
	bt r12,4
	jc LB_268
	mov rdi,r10
	call dlt
LB_268:
	bt r12,2
	jc LB_269
	mov rdi,r8
	call dlt
LB_269:
	bt r12,1
	jc LB_270
	mov rdi,r14
	call dlt
LB_270:
	bt r12,0
	jc LB_271
	mov rdi,r13
	call dlt
LB_271:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_252:
section .data
	CST_DYN_206:
		dq 0x0000_0001_00_82_ffff
		dq 1
