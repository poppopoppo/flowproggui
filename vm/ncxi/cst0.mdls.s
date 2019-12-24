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
	call NS_E_392
	call NS_E_435
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
NS_E_115:
NS_E_RDI_115:
NS_E_115_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_116
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_116:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_118:
NS_E_RDI_118:
NS_E_118_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_118_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_118_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_119:
NS_E_RDI_119:
NS_E_119_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_119_LB_0
	cmp r11,57
	ja NS_E_119_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_119_LB_0:
	mov rax,0
	ret
NS_E_121:
NS_E_RDI_121:
NS_E_121_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_121_LB_0
	cmp r11,122
	ja NS_E_121_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_121_LB_0:
	mov rax,0
	ret
NS_E_120:
NS_E_RDI_120:
NS_E_120_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_120_LB_0
	cmp r11,90
	ja NS_E_120_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_120_LB_0:
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
	jc LB_127
	bt QWORD [rdi],17
	jnc LB_127
	bt QWORD [rdi],0
	jc LB_129
	btr r12,2
	clc
	jmp LB_130
LB_129:
	bts r12,2
	stc
LB_130:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_128
LB_127:
	btr r12,2
	clc
	call dcp
LB_128:
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
	jc LB_123
	bt QWORD [rdi],17
	jnc LB_123
	bt QWORD [rdi],0
	jc LB_125
	btr r12,2
	clc
	jmp LB_126
LB_125:
	bts r12,2
	stc
LB_126:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_124
LB_123:
	btr r12,2
	clc
	call dcp
LB_124:
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
	jc LB_122
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_122:
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
NS_E_117:
NS_E_RDI_117:
NS_E_117_ETR_TBL:
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
	jz NS_E_117_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_117_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_133:
; 	|» { 0' 1' }
NS_E_RDI_133:
; _f51 %_131 ⊢ %_132 : %_132
 ; {>  %_131~{ 0' 1' }:{ _r64 _r64 } }
	add r13,r14
	jmp err
NS_E_134:
NS_E_RDI_134:
NS_E_134_ETR_TBL:
NS_E_134_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_177
LB_176:
	add r14,1
LB_177:
	cmp r14,r10
	jge LB_178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_176
	cmp al,10
	jz LB_176
	cmp al,32
	jz LB_176
LB_178:
	add r14,1
	cmp r14,r10
	jg LB_181
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,123
	jnz LB_181
	jmp LB_182
LB_181:
	jmp LB_169
LB_182:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; rcd_lst
	jmp LB_184
LB_183:
	add r14,1
LB_184:
	cmp r14,r10
	jge LB_185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_183
	cmp al,10
	jz LB_183
	cmp al,32
	jz LB_183
LB_185:
	push r10
	call NS_E_135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_186
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_187
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_187:
	jmp LB_169
LB_186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_190
LB_189:
	add r14,1
LB_190:
	cmp r14,r10
	jge LB_191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_189
	cmp al,10
	jz LB_189
	cmp al,32
	jz LB_189
LB_191:
	add r14,1
	cmp r14,r10
	jg LB_196
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,125
	jnz LB_196
	jmp LB_197
LB_196:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_193
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_193:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_194
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_194:
	jmp LB_169
LB_197:
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
	jc LB_174
	btr r12,2
	clc
	jmp LB_175
LB_174:
	bts r12,2
	stc
LB_175:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_172
	btr r12,1
	clc
	jmp LB_173
LB_172:
	bts r12,1
	stc
LB_173:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_170
	btr r12,0
	clc
	jmp LB_171
LB_170:
	bts r12,0
	stc
LB_171:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_166
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_198
	btr r12,3
	jmp LB_199
LB_198:
	bts r12,3
LB_199:
	mov r13,r14
	bt r12,1
	jc LB_200
	btr r12,0
	jmp LB_201
LB_200:
	bts r12,0
LB_201:
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
; _f38 { %_70 %_69 } ⊢ { %_137 %_138 } : { %_137 %_138 }
 ; {>  %_136~0':_r64 %_69~2':_r64 %_70~1':_r64 }
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
	jc LB_148
	btr r12,3
	jmp LB_149
LB_148:
	bts r12,3
LB_149:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_146
	btr QWORD [rdi],0
	jmp LB_147
LB_146:
	bts QWORD [rdi],0
LB_147:
	mov r9,r8
	bt r12,2
	jc LB_152
	btr r12,3
	jmp LB_153
LB_152:
	bts r12,3
LB_153:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_150
	btr QWORD [rdi],1
	jmp LB_151
LB_150:
	bts QWORD [rdi],1
LB_151:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_156
	btr r12,3
	clc
	jmp LB_157
LB_156:
	bts r12,3
	stc
LB_157:
	mov r14,r9
	bt r12,3
	jc LB_154
	btr r12,1
	jmp LB_155
LB_154:
	bts r12,1
LB_155:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_160
	btr r12,3
	clc
	jmp LB_161
LB_160:
	bts r12,3
	stc
LB_161:
	mov r8,r9
	bt r12,3
	jc LB_158
	btr r12,2
	jmp LB_159
LB_158:
	bts r12,2
LB_159:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_144
	btr r12,0
	clc
	jmp LB_145
LB_144:
	bts r12,0
	stc
LB_145:
	add rsp,16
; _some %_137 ⊢ %_139 : %_139
 ; {>  %_137~1':_r64 %_136~0':_r64 %_138~2':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_139
 ; {>  %_136~0':_r64 %_138~2':_r64 %_139~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_162
	mov rdi,r13
	call dlt
LB_162:
	bt r12,2
	jc LB_163
	mov rdi,r8
	call dlt
LB_163:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_164
	btr r12,3
	jmp LB_165
LB_164:
	bts r12,3
LB_165:
	mov r8,0
	bts r12,2
	ret
LB_166:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_168
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_167
LB_168:
	add rsp,8
	ret
LB_169:
	add rsp,48
	pop r14
LB_167:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_135:
NS_E_RDI_135:
NS_E_135_ETR_TBL:
NS_E_135_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; rcd
	jmp LB_216
LB_215:
	add r14,1
LB_216:
	cmp r14,r10
	jge LB_217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_215
	cmp al,10
	jz LB_215
	cmp al,32
	jz LB_215
LB_217:
	push r10
	call NS_E_134_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_218
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_210
LB_218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; rcd_lst
	jmp LB_221
LB_220:
	add r14,1
LB_221:
	cmp r14,r10
	jge LB_222
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_220
	cmp al,10
	jz LB_220
	cmp al,32
	jz LB_220
LB_222:
	push r10
	call NS_E_135_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_223
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_224:
	jmp LB_210
LB_223:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_213
	btr r12,1
	clc
	jmp LB_214
LB_213:
	bts r12,1
	stc
LB_214:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_211
	btr r12,0
	clc
	jmp LB_212
LB_211:
	bts r12,0
	stc
LB_212:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_207
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some %_74 ⊢ %_142 : %_142
 ; {>  %_140~0':_r64 %_141~1':_r64 %_74~2':_r64 %_73~3':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_142
 ; {>  %_142~°0◂2':(_opn)◂(_r64) %_140~0':_r64 %_141~1':_r64 %_73~3':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_202
	mov rdi,r13
	call dlt
LB_202:
	bt r12,1
	jc LB_203
	mov rdi,r14
	call dlt
LB_203:
	bt r12,3
	jc LB_204
	mov rdi,r9
	call dlt
LB_204:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_205
	btr r12,3
	jmp LB_206
LB_205:
	bts r12,3
LB_206:
	mov r8,0
	bts r12,2
	ret
LB_207:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_209
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_208
LB_209:
	add rsp,8
	ret
LB_210:
	add rsp,32
	pop r14
LB_208:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_229
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some %_78 ⊢ %_143 : %_143
 ; {>  %_77~1':_r64 %_78~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_143
 ; {>  %_77~1':_r64 %_143~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_226
	mov rdi,r14
	call dlt
LB_226:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_227
	btr r12,3
	jmp LB_228
LB_227:
	bts r12,3
LB_228:
	mov r8,0
	bts r12,2
	ret
LB_229:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_231
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_230
LB_231:
	add rsp,8
	ret
LB_232:
	add rsp,0
	pop r14
LB_230:
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
NS_E_RDI_233:
NS_E_233_ETR_TBL:
NS_E_233_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "A"
	jmp LB_291
LB_290:
	add r14,1
LB_291:
	cmp r14,r10
	jge LB_292
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_290
	cmp al,10
	jz LB_290
	cmp al,32
	jz LB_290
LB_292:
	add r14,1
	cmp r14,r10
	jg LB_295
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,65
	jnz LB_295
	jmp LB_296
LB_295:
	jmp LB_280
LB_296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; gx
	jmp LB_298
LB_297:
	add r14,1
LB_298:
	cmp r14,r10
	jge LB_299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_297
	cmp al,10
	jz LB_297
	cmp al,32
	jz LB_297
LB_299:
	push r10
	call NS_E_233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_300
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_301
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_301:
	jmp LB_280
LB_300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "B"
	jmp LB_248
LB_247:
	add r14,1
LB_248:
	cmp r14,r10
	jge LB_249
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_247
	cmp al,10
	jz LB_247
	cmp al,32
	jz LB_247
LB_249:
	add r14,1
	cmp r14,r10
	jg LB_252
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,66
	jnz LB_252
	jmp LB_253
LB_252:
	jmp LB_242
LB_253:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; gx
	jmp LB_255
LB_254:
	add r14,1
LB_255:
	cmp r14,r10
	jge LB_256
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_254
	cmp al,10
	jz LB_254
	cmp al,32
	jz LB_254
LB_256:
	push r10
	call NS_E_233_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_257
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_258
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_258:
	jmp LB_242
LB_257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_245
	btr r12,1
	clc
	jmp LB_246
LB_245:
	bts r12,1
	stc
LB_246:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_243
	btr r12,0
	clc
	jmp LB_244
LB_243:
	bts r12,0
	stc
LB_244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_239
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_260
	btr r12,2
	jmp LB_261
LB_260:
	bts r12,2
LB_261:
	mov r13,r14
	bt r12,1
	jc LB_262
	btr r12,0
	jmp LB_263
LB_262:
	bts r12,0
LB_263:
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
	jmp err
LB_239:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_241
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_240
LB_241:
	add rsp,8
	jmp LB_237
LB_242:
	add rsp,32
	pop r14
LB_240:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "C"
	jmp LB_271
LB_270:
	add r14,1
LB_271:
	cmp r14,r10
	jge LB_272
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_270
	cmp al,10
	jz LB_270
	cmp al,32
	jz LB_270
LB_272:
	add r14,1
	cmp r14,r10
	jg LB_275
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,67
	jnz LB_275
	jmp LB_276
LB_275:
	jmp LB_267
LB_276:
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
	jc LB_268
	btr r12,0
	clc
	jmp LB_269
LB_268:
	bts r12,0
	stc
LB_269:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_264
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_264:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_266
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_265
LB_266:
	add rsp,8
	jmp LB_237
LB_267:
	add rsp,16
	pop r14
LB_265:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_237
LB_237:
	pop r10
	cmp r8,0
	jz LB_238
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_287
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_287:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_288
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_288:
	jmp LB_280
LB_238:
	mov rdi,r13
	mov rsi,r14
	mov r8,r9
	bt r12,3
	jc LB_285
	btr r12,2
	clc
	jmp LB_286
LB_285:
	bts r12,2
	stc
LB_286:
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_283
	btr r12,1
	clc
	jmp LB_284
LB_283:
	bts r12,1
	stc
LB_284:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_281
	btr r12,0
	clc
	jmp LB_282
LB_281:
	bts r12,0
	stc
LB_282:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_277
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ { 0' 1' } 2' } ⊢ { { {  } 0' } 1' }
	mov r9,r14
	bt r12,1
	jc LB_303
	btr r12,3
	jmp LB_304
LB_303:
	bts r12,3
LB_304:
	mov r14,r8
	bt r12,2
	jc LB_305
	btr r12,1
	jmp LB_306
LB_305:
	bts r12,1
LB_306:
	mov r8,r13
	bt r12,0
	jc LB_307
	btr r12,2
	jmp LB_308
LB_307:
	bts r12,2
LB_308:
	mov r13,r9
	bt r12,3
	jc LB_309
	btr r12,0
	jmp LB_310
LB_309:
	bts r12,0
LB_310:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
	jmp err
LB_277:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_279
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_278
LB_279:
	add rsp,8
	ret
LB_280:
	add rsp,32
	pop r14
LB_278:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_311
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_311:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_313
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_312
LB_313:
	add rsp,8
	ret
LB_314:
	add rsp,0
	pop r14
LB_312:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_315:
NS_E_RDI_315:
NS_E_315_ETR_TBL:
NS_E_315_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142\226\136\142"
	jmp LB_342
LB_341:
	add r14,1
LB_342:
	cmp r14,r10
	jge LB_343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_341
	cmp al,10
	jz LB_341
	cmp al,32
	jz LB_341
LB_343:
	add r14,6
	cmp r14,r10
	jg LB_346
	movzx rax,BYTE [r13+r14+8*1+0-6]
	cmp al,226
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+1-6]
	cmp al,136
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+2-6]
	cmp al,142
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+3-6]
	cmp al,226
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+4-6]
	cmp al,136
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+5-6]
	cmp al,142
	jnz LB_346
	jmp LB_347
LB_346:
	jmp LB_327
LB_347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_334
LB_333:
	add r14,1
LB_334:
	cmp r14,r10
	jge LB_335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_333
	cmp al,10
	jz LB_333
	cmp al,32
	jz LB_333
LB_335:
	add r14,3
	cmp r14,r10
	jg LB_339
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_339
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_339
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_339
	jmp LB_340
LB_339:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_337:
	jmp LB_328
LB_340:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_331
	btr r12,1
	clc
	jmp LB_332
LB_331:
	bts r12,1
	stc
LB_332:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_329
	btr r12,0
	clc
	jmp LB_330
LB_329:
	bts r12,0
	stc
LB_330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_324
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_324:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_326
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_325
LB_326:
	add rsp,8
	jmp LB_322
LB_328:
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
	jmp LB_322
LB_327:
	add rsp,32
	pop r14
LB_325:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_360
LB_359:
	add r14,1
LB_360:
	cmp r14,r10
	jge LB_361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_359
	cmp al,10
	jz LB_359
	cmp al,32
	jz LB_359
LB_361:
	push r10
	call NS_E_115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_362
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_354
LB_362:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_res
	jmp LB_365
LB_364:
	add r14,1
LB_365:
	cmp r14,r10
	jge LB_366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_364
	cmp al,10
	jz LB_364
	cmp al,32
	jz LB_364
LB_366:
	push r10
	call NS_E_315_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_367
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_368:
	jmp LB_354
LB_367:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_357
	btr r12,1
	clc
	jmp LB_358
LB_357:
	bts r12,1
	stc
LB_358:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_355
	btr r12,0
	clc
	jmp LB_356
LB_355:
	bts r12,0
	stc
LB_356:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_351
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some {  } ⊢ %_318 : %_318
 ; {>  %_317~{  }:{ } %_105~2':_r64 %_106~1':_r64 %_316~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_318
 ; {>  %_317~{  }:{ } %_105~2':_r64 %_106~1':_r64 %_318~°0◂{  }:(_opn)◂({ }) %_316~0':_r64 }
; 	∎ °0◂{  }
	bt r12,2
	jc LB_348
	mov rdi,r8
	call dlt
LB_348:
	bt r12,1
	jc LB_349
	mov rdi,r14
	call dlt
LB_349:
	bt r12,0
	jc LB_350
	mov rdi,r13
	call dlt
LB_350:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_352
LB_353:
	add rsp,8
	jmp LB_322
LB_354:
	add rsp,32
	pop r14
LB_352:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_322
LB_322:
	pop r10
	cmp r8,0
	jz LB_323
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_375
LB_323:
	mov rdi,r13
	mov rsi,r14
	mov r13,r9
	bt r12,3
	jc LB_376
	btr r12,0
	clc
	jmp LB_377
LB_376:
	bts r12,0
	stc
LB_377:
	add rsp,0
	push rdi
	push rsi
	push LB_372
; _emt_mov_ptn_to_ptn:{| 10.. |},{ {  } 0' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some %_319 ⊢ %_320 : %_320
 ; {>  %_108~1':_r64 %_319~{  }:{ } %_109~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_320
 ; {>  %_320~°0◂{  }:(_opn)◂({ }) %_108~1':_r64 %_109~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_370
	mov rdi,r14
	call dlt
LB_370:
	bt r12,0
	jc LB_371
	mov rdi,r13
	call dlt
LB_371:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_372:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_374
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_373
LB_374:
	add rsp,8
	ret
LB_375:
	add rsp,0
	pop r14
LB_373:
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
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_321 : %_321
 ; {>  %_113~0':_r64 %_112~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_321
 ; {>  %_321~°0◂{  }:(_opn)◂({ }) %_113~0':_r64 %_112~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_379
	mov rdi,r13
	call dlt
LB_379:
	bt r12,1
	jc LB_380
	mov rdi,r14
	call dlt
LB_380:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
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
NS_E_392:
NS_E_RDI_392:
; 	» "JIJ\194\167\194\167+\226\136\142\226\136\142s8" _ ⊢ 0' : %_385
	mov rdi,16
	call mlc_s8
	mov rdi,rax
	mov rax,0x_2b_a7_c2_a7_c2_4a_49_4a
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_38_73_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*1+8*1],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*2],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_386 : %_386
 ; {>  %_385~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_386
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f315 { %_385 %_386 } ⊢ { %_387 %_388 %_389 } : { %_387 %_388 %_389 }
 ; {>  %_386~1':_r64 %_385~0':_stg }
; _f315 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_315
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_393
	btr r12,4
	jmp LB_394
LB_393:
	bts r12,4
LB_394:
	mov r8,r9
	bt r12,3
	jc LB_397
	btr r12,2
	jmp LB_398
LB_397:
	bts r12,2
LB_398:
	mov rsi,1
	bt r12,2
	jc LB_395
	mov rsi,0
	bt r8,0
	jc LB_395
	jmp LB_396
LB_395:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_396:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_388 %_389 } ⊢ { %_390 %_391 } : { %_390 %_391 }
 ; {>  %_387~0':_stg %_389~2':(_opn)◂({ }) %_388~1':_r64 }
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
	jc LB_403
	btr r12,3
	jmp LB_404
LB_403:
	bts r12,3
LB_404:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_401
	btr QWORD [rdi],0
	jmp LB_402
LB_401:
	bts QWORD [rdi],0
LB_402:
	mov r9,r8
	bt r12,2
	jc LB_407
	btr r12,3
	jmp LB_408
LB_407:
	bts r12,3
LB_408:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_405
	btr QWORD [rdi],1
	jmp LB_406
LB_405:
	bts QWORD [rdi],1
LB_406:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_411
	btr r12,3
	clc
	jmp LB_412
LB_411:
	bts r12,3
	stc
LB_412:
	mov r14,r9
	bt r12,3
	jc LB_409
	btr r12,1
	jmp LB_410
LB_409:
	bts r12,1
LB_410:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_415
	btr r12,3
	clc
	jmp LB_416
LB_415:
	bts r12,3
	stc
LB_416:
	mov r8,r9
	bt r12,3
	jc LB_413
	btr r12,2
	jmp LB_414
LB_413:
	bts r12,2
LB_414:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_399
	btr r12,0
	clc
	jmp LB_400
LB_399:
	bts r12,0
	stc
LB_400:
	add rsp,16
; ∎ {  }
 ; {>  %_391~2':(_opn)◂({ }) %_390~1':_r64 %_387~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_417
	mov rdi,r8
	call dlt
LB_417:
	bt r12,1
	jc LB_418
	mov rdi,r14
	call dlt
LB_418:
	bt r12,0
	jc LB_419
	mov rdi,r13
	call dlt
LB_419:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_435:
NS_E_RDI_435:
; 	» "{ {} {} }" _ ⊢ 0' : %_420
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_7d_7b_20_7d_7b_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_7d
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_421 : %_421
 ; {>  %_420~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_421
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f134 { %_420 %_421 } ⊢ { %_422 %_423 %_424 } : { %_422 %_423 %_424 }
 ; {>  %_420~0':_stg %_421~1':_r64 }
; _f134 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_134
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_436
	btr r12,4
	jmp LB_437
LB_436:
	bts r12,4
LB_437:
	mov r8,r9
	bt r12,3
	jc LB_440
	btr r12,2
	jmp LB_441
LB_440:
	bts r12,2
LB_441:
	mov rsi,1
	bt r12,2
	jc LB_438
	mov rsi,0
	bt r8,0
	jc LB_438
	jmp LB_439
LB_438:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_439:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_423 %_424 } ⊢ { %_425 %_426 } : { %_425 %_426 }
 ; {>  %_424~2':(_opn)◂(_r64) %_423~1':_r64 %_422~0':_stg }
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
	jc LB_446
	btr r12,3
	jmp LB_447
LB_446:
	bts r12,3
LB_447:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_444
	btr QWORD [rdi],0
	jmp LB_445
LB_444:
	bts QWORD [rdi],0
LB_445:
	mov r9,r8
	bt r12,2
	jc LB_450
	btr r12,3
	jmp LB_451
LB_450:
	bts r12,3
LB_451:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_448
	btr QWORD [rdi],1
	jmp LB_449
LB_448:
	bts QWORD [rdi],1
LB_449:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_454
	btr r12,3
	clc
	jmp LB_455
LB_454:
	bts r12,3
	stc
LB_455:
	mov r14,r9
	bt r12,3
	jc LB_452
	btr r12,1
	jmp LB_453
LB_452:
	bts r12,1
LB_453:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_458
	btr r12,3
	clc
	jmp LB_459
LB_458:
	bts r12,3
	stc
LB_459:
	mov r8,r9
	bt r12,3
	jc LB_456
	btr r12,2
	jmp LB_457
LB_456:
	bts r12,2
LB_457:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_442
	btr r12,0
	clc
	jmp LB_443
LB_442:
	bts r12,0
	stc
LB_443:
	add rsp,16
; 	» "x" _ ⊢ 3' : %_427
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_78
	mov QWORD [rdi+8*1+8*0],rax
	mov r9,rdi
	btr r12,3
; 	» "y" _ ⊢ 4' : %_428
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_79
	mov QWORD [rdi+8*1+8*0],rax
	mov r10,rdi
	btr r12,4
; » 0xra |~ {  } ⊢ %_429 : %_429
 ; {>  %_427~3':_stg %_426~2':(_opn)◂(_r64) %_425~1':_r64 %_428~4':_stg %_422~0':_stg }
; 	» 0xra _ ⊢ 5' : %_429
	mov rdi,0xa
	mov r11,rdi
	bts r12,5
; » _^ ..
	xor rax,rax
	sub rsp,124
	mov rdi,rsp
	push rax
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdx,r11
	xor rax,rax
	mov rsi,fmt_d
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call sprintf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	pop rsi
	mov rdx,rsp
	mov QWORD [st_vct+8*8],rax
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,rdx
	mov rcx,QWORD [st_vct+8*8]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,124
; _f38 %_431 ⊢ %_432 : %_432
 ; {>  %_430~5':_r64 %_427~3':_stg %_426~2':(_opn)◂(_r64) %_425~1':_r64 %_431~6':_stg %_428~4':_stg %_422~0':_stg }
; _f38 6' ⊢ 6'
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
	jc LB_472
	btr r12,0
	jmp LB_473
LB_472:
	bts r12,0
LB_473:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_474
	btr r12,6
	jmp LB_475
LB_474:
	bts r12,6
LB_475:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_470
	btr r12,5
	clc
	jmp LB_471
LB_470:
	bts r12,5
	stc
LB_471:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_468
	btr r12,4
	clc
	jmp LB_469
LB_468:
	bts r12,4
	stc
LB_469:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_466
	btr r12,3
	clc
	jmp LB_467
LB_466:
	bts r12,3
	stc
LB_467:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_464
	btr r12,2
	clc
	jmp LB_465
LB_464:
	bts r12,2
	stc
LB_465:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_462
	btr r12,1
	clc
	jmp LB_463
LB_462:
	bts r12,1
	stc
LB_463:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_460
	btr r12,0
	clc
	jmp LB_461
LB_460:
	bts r12,0
	stc
LB_461:
	add rsp,56
MTC_LB_476:
	mov r15,0
	mov rdi,r9
	mov rsi,r10
	bt r12,3
	call eq
	jnz MTC_LB_477
LB_478:
	cmp r15,0
	jz LB_479
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_478
LB_479:
; _f38 %_427 ⊢ %_433 : %_433
 ; {>  %_430~5':_r64 %_427~3':_stg %_426~2':(_opn)◂(_r64) %_425~1':_r64 %_432~6':_stg %_428~4':_stg %_422~0':_stg }
; _f38 3' ⊢ 3'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_492
	btr r12,0
	jmp LB_493
LB_492:
	bts r12,0
LB_493:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_494
	btr r12,3
	jmp LB_495
LB_494:
	bts r12,3
LB_495:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_490
	btr r12,6
	clc
	jmp LB_491
LB_490:
	bts r12,6
	stc
LB_491:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_488
	btr r12,5
	clc
	jmp LB_489
LB_488:
	bts r12,5
	stc
LB_489:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_486
	btr r12,4
	clc
	jmp LB_487
LB_486:
	bts r12,4
	stc
LB_487:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_484
	btr r12,2
	clc
	jmp LB_485
LB_484:
	bts r12,2
	stc
LB_485:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_482
	btr r12,1
	clc
	jmp LB_483
LB_482:
	bts r12,1
	stc
LB_483:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_480
	btr r12,0
	clc
	jmp LB_481
LB_480:
	bts r12,0
	stc
LB_481:
	add rsp,56
; ∎ {  }
 ; {>  %_430~5':_r64 %_426~2':(_opn)◂(_r64) %_425~1':_r64 %_432~6':_stg %_428~4':_stg %_433~3':_stg %_422~0':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_496
	mov rdi,r11
	call dlt
LB_496:
	bt r12,2
	jc LB_497
	mov rdi,r8
	call dlt
LB_497:
	bt r12,1
	jc LB_498
	mov rdi,r14
	call dlt
LB_498:
	bt r12,6
	jc LB_499
	mov rdi,rcx
	call dlt
LB_499:
	bt r12,4
	jc LB_500
	mov rdi,r10
	call dlt
LB_500:
	bt r12,3
	jc LB_501
	mov rdi,r9
	call dlt
LB_501:
	bt r12,0
	jc LB_502
	mov rdi,r13
	call dlt
LB_502:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_477:
	mov r15,0
LB_504:
	cmp r15,0
	jz LB_505
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_504
LB_505:
; _f38 %_428 ⊢ %_434 : %_434
 ; {>  %_430~5':_r64 %_427~3':_stg %_426~2':(_opn)◂(_r64) %_425~1':_r64 %_432~6':_stg %_428~4':_stg %_422~0':_stg }
; _f38 4' ⊢ 4'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_518
	btr r12,0
	jmp LB_519
LB_518:
	bts r12,0
LB_519:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_520
	btr r12,4
	jmp LB_521
LB_520:
	bts r12,4
LB_521:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_516
	btr r12,6
	clc
	jmp LB_517
LB_516:
	bts r12,6
	stc
LB_517:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_514
	btr r12,5
	clc
	jmp LB_515
LB_514:
	bts r12,5
	stc
LB_515:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_512
	btr r12,3
	clc
	jmp LB_513
LB_512:
	bts r12,3
	stc
LB_513:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_510
	btr r12,2
	clc
	jmp LB_511
LB_510:
	bts r12,2
	stc
LB_511:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_508
	btr r12,1
	clc
	jmp LB_509
LB_508:
	bts r12,1
	stc
LB_509:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_506
	btr r12,0
	clc
	jmp LB_507
LB_506:
	bts r12,0
	stc
LB_507:
	add rsp,56
; ∎ {  }
 ; {>  %_434~4':_stg %_430~5':_r64 %_427~3':_stg %_426~2':(_opn)◂(_r64) %_425~1':_r64 %_432~6':_stg %_422~0':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_522
	mov rdi,r10
	call dlt
LB_522:
	bt r12,5
	jc LB_523
	mov rdi,r11
	call dlt
LB_523:
	bt r12,3
	jc LB_524
	mov rdi,r9
	call dlt
LB_524:
	bt r12,2
	jc LB_525
	mov rdi,r8
	call dlt
LB_525:
	bt r12,1
	jc LB_526
	mov rdi,r14
	call dlt
LB_526:
	bt r12,6
	jc LB_527
	mov rdi,rcx
	call dlt
LB_527:
	bt r12,0
	jc LB_528
	mov rdi,r13
	call dlt
LB_528:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_503:
section .data
	CST_DYN_392:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_435:
		dq 0x0000_0001_00_82_ffff
		dq 1
