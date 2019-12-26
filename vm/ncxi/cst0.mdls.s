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
	call NS_E_399
	call NS_E_446
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
NS_E_114:
NS_E_RDI_114:
NS_E_114_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_115
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_115:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_117:
NS_E_RDI_117:
NS_E_117_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_117_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
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
NS_E_118:
NS_E_RDI_118:
NS_E_118_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_118_LB_0
	cmp r11,57
	ja NS_E_118_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_118_LB_0:
	mov rax,0
	ret
NS_E_120:
NS_E_RDI_120:
NS_E_120_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_120_LB_0
	cmp r11,122
	ja NS_E_120_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_120_LB_0:
	mov rax,0
	ret
NS_E_119:
NS_E_RDI_119:
NS_E_119_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_119_LB_0
	cmp r11,90
	ja NS_E_119_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_119_LB_0:
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
	jc LB_132
	bt QWORD [rdi],17
	jnc LB_132
	bt QWORD [rdi],0
	jc LB_134
	btr r12,2
	clc
	jmp LB_135
LB_134:
	bts r12,2
	stc
LB_135:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_133
LB_132:
	btr r12,2
	clc
	call dcp
LB_133:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	mov QWORD [rdi+8+8*rax],NULL
	mov rdi,rsi
	bt rdi,0
	jc LB_129
	mov rax,[rdi]
	bt rax,17
	jnc LB_127
	bt QWORD rax,0
	jc LB_130
	btr r12,2
	clc
	jmp LB_131
LB_130:
	bts r12,2
	stc
LB_131:
	mov rsi,QWORD [rdi+8]
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,rsi
	jmp LB_128
LB_129:
	cmp rdi,NULL
	jz err
LB_127:
	btr r12,2
LB_128:
	mov r8,rdi
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
	jc LB_124
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_122
	bt QWORD rax,0
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
	jmp LB_123
LB_124:
	cmp rdi,NULL
	jz err
LB_122:
	btr r12,2
	clc
	call dcp
LB_123:
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
	bt QWORD [rdi+8+8*rax],63
	jnc err
	bt r12,2
	jc LB_121
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_121:
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
NS_E_116:
NS_E_RDI_116:
NS_E_116_ETR_TBL:
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
	jz NS_E_116_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_116_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_138:
; 	|» { 0' 1' }
NS_E_RDI_138:
; _f51 %_136 ⊢ %_137 : %_137
 ; {>  %_136~{ 0' 1' }:{ _r64 _r64 } }
	add r13,r14
	jmp err
NS_E_139:
NS_E_RDI_139:
NS_E_139_ETR_TBL:
NS_E_139_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
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
	add r14,1
	cmp r14,r10
	jg LB_187
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,123
	jnz LB_187
	jmp LB_188
LB_187:
	jmp LB_175
LB_188:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; rcd_lst
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
	push r10
	call NS_E_140_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_192
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_193
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_193:
	jmp LB_175
LB_192:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_196
LB_195:
	add r14,1
LB_196:
	cmp r14,r10
	jge LB_197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_195
	cmp al,10
	jz LB_195
	cmp al,32
	jz LB_195
LB_197:
	add r14,1
	cmp r14,r10
	jg LB_202
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,125
	jnz LB_202
	jmp LB_203
LB_202:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_199
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_199:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_200
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_200:
	jmp LB_175
LB_203:
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
	jc LB_180
	btr r12,2
	clc
	jmp LB_181
LB_180:
	bts r12,2
	stc
LB_181:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_178
	btr r12,1
	clc
	jmp LB_179
LB_178:
	bts r12,1
	stc
LB_179:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_176
	btr r12,0
	clc
	jmp LB_177
LB_176:
	bts r12,0
	stc
LB_177:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 1
	push LB_172
	push LB_172
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_204
	btr r12,3
	jmp LB_205
LB_204:
	bts r12,3
LB_205:
	mov r13,r14
	bt r12,1
	jc LB_206
	btr r12,0
	jmp LB_207
LB_206:
	bts r12,0
LB_207:
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
; _f38 { %_70 %_69 } ⊢ { %_142 %_143 } : { %_142 %_143 }
 ; {>  %_69~2':_r64 %_70~1':_r64 %_141~0':_r64 }
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
	jc LB_153
	btr r12,3
	jmp LB_154
LB_153:
	bts r12,3
LB_154:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_151
	btr QWORD [rdi],0
	jmp LB_152
LB_151:
	bts QWORD [rdi],0
LB_152:
	mov r9,r8
	bt r12,2
	jc LB_157
	btr r12,3
	jmp LB_158
LB_157:
	bts r12,3
LB_158:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_155
	btr QWORD [rdi],1
	jmp LB_156
LB_155:
	bts QWORD [rdi],1
LB_156:
	push -1
	push LB_167
	call NS_E_38
LB_167:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_161
	btr r12,3
	clc
	jmp LB_162
LB_161:
	bts r12,3
	stc
LB_162:
	mov r14,r9
	bt r12,3
	jc LB_159
	btr r12,1
	jmp LB_160
LB_159:
	bts r12,1
LB_160:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_165
	btr r12,3
	clc
	jmp LB_166
LB_165:
	bts r12,3
	stc
LB_166:
	mov r8,r9
	bt r12,3
	jc LB_163
	btr r12,2
	jmp LB_164
LB_163:
	bts r12,2
LB_164:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_149
	btr r12,0
	clc
	jmp LB_150
LB_149:
	bts r12,0
	stc
LB_150:
	add rsp,16
; _some %_142 ⊢ %_144 : %_144
 ; {>  %_142~1':_r64 %_143~2':_r64 %_141~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_144
 ; {>  %_144~°0◂1':(_opn)◂(_r64) %_143~2':_r64 %_141~0':_r64 }
; 	∎ °0◂1'
	bt r12,2
	jc LB_168
	mov rdi,r8
	call dlt
LB_168:
	bt r12,0
	jc LB_169
	mov rdi,r13
	call dlt
LB_169:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_170
	btr r12,3
	jmp LB_171
LB_170:
	bts r12,3
LB_171:
	mov r8,0
	bts r12,2
	ret
LB_172:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_174
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_173
LB_174:
	add rsp,8
	ret
LB_175:
	add rsp,48
	pop r14
LB_173:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_140:
NS_E_RDI_140:
NS_E_140_ETR_TBL:
NS_E_140_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; rcd
	jmp LB_222
LB_221:
	add r14,1
LB_222:
	cmp r14,r10
	jge LB_223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_221
	cmp al,10
	jz LB_221
	cmp al,32
	jz LB_221
LB_223:
	push r10
	call NS_E_139_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_224
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_216
LB_224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; rcd_lst
	jmp LB_227
LB_226:
	add r14,1
LB_227:
	cmp r14,r10
	jge LB_228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_226
	cmp al,10
	jz LB_226
	cmp al,32
	jz LB_226
LB_228:
	push r10
	call NS_E_140_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_229
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_230
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_230:
	jmp LB_216
LB_229:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_219
	btr r12,1
	clc
	jmp LB_220
LB_219:
	bts r12,1
	stc
LB_220:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_217
	btr r12,0
	clc
	jmp LB_218
LB_217:
	bts r12,0
	stc
LB_218:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 2
	push LB_213
	push LB_213
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some %_74 ⊢ %_147 : %_147
 ; {>  %_145~0':_r64 %_74~2':_r64 %_73~3':_r64 %_146~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_147
 ; {>  %_145~0':_r64 %_147~°0◂2':(_opn)◂(_r64) %_73~3':_r64 %_146~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_208
	mov rdi,r13
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
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_211
	btr r12,3
	jmp LB_212
LB_211:
	bts r12,3
LB_212:
	mov r8,0
	bts r12,2
	ret
LB_213:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_215
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_214
LB_215:
	add rsp,8
	ret
LB_216:
	add rsp,32
	pop r14
LB_214:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 3
	push LB_235
	push LB_235
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some %_78 ⊢ %_148 : %_148
 ; {>  %_77~1':_r64 %_78~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_148
 ; {>  %_148~°0◂0':(_opn)◂(_r64) %_77~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_232
	mov rdi,r14
	call dlt
LB_232:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_233
	btr r12,3
	jmp LB_234
LB_233:
	bts r12,3
LB_234:
	mov r8,0
	bts r12,2
	ret
LB_235:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_237
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_236
LB_237:
	add rsp,8
	ret
LB_238:
	add rsp,0
	pop r14
LB_236:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_239:
NS_E_RDI_239:
NS_E_239_ETR_TBL:
NS_E_239_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "A"
	jmp LB_297
LB_296:
	add r14,1
LB_297:
	cmp r14,r10
	jge LB_298
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_296
	cmp al,10
	jz LB_296
	cmp al,32
	jz LB_296
LB_298:
	add r14,1
	cmp r14,r10
	jg LB_301
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,65
	jnz LB_301
	jmp LB_302
LB_301:
	jmp LB_286
LB_302:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; gx
	jmp LB_304
LB_303:
	add r14,1
LB_304:
	cmp r14,r10
	jge LB_305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_303
	cmp al,10
	jz LB_303
	cmp al,32
	jz LB_303
LB_305:
	push r10
	call NS_E_239_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_306
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_307
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_307:
	jmp LB_286
LB_306:
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
	jmp LB_254
LB_253:
	add r14,1
LB_254:
	cmp r14,r10
	jge LB_255
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_253
	cmp al,10
	jz LB_253
	cmp al,32
	jz LB_253
LB_255:
	add r14,1
	cmp r14,r10
	jg LB_258
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,66
	jnz LB_258
	jmp LB_259
LB_258:
	jmp LB_248
LB_259:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; gx
	jmp LB_261
LB_260:
	add r14,1
LB_261:
	cmp r14,r10
	jge LB_262
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_260
	cmp al,10
	jz LB_260
	cmp al,32
	jz LB_260
LB_262:
	push r10
	call NS_E_239_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_263
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_264
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_264:
	jmp LB_248
LB_263:
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
	clc
	jmp LB_252
LB_251:
	bts r12,1
	stc
LB_252:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_249
	btr r12,0
	clc
	jmp LB_250
LB_249:
	bts r12,0
	stc
LB_250:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 4
	push LB_245
	push LB_245
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_266
	btr r12,2
	jmp LB_267
LB_266:
	bts r12,2
LB_267:
	mov r13,r14
	bt r12,1
	jc LB_268
	btr r12,0
	jmp LB_269
LB_268:
	bts r12,0
LB_269:
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
LB_245:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_247
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_246
LB_247:
	add rsp,8
	jmp LB_243
LB_248:
	add rsp,32
	pop r14
LB_246:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "C"
	jmp LB_277
LB_276:
	add r14,1
LB_277:
	cmp r14,r10
	jge LB_278
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_276
	cmp al,10
	jz LB_276
	cmp al,32
	jz LB_276
LB_278:
	add r14,1
	cmp r14,r10
	jg LB_281
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,67
	jnz LB_281
	jmp LB_282
LB_281:
	jmp LB_273
LB_282:
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
	jc LB_274
	btr r12,0
	clc
	jmp LB_275
LB_274:
	bts r12,0
	stc
LB_275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 5
	push LB_270
	push LB_270
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
LB_270:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_272
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_271
LB_272:
	add rsp,8
	jmp LB_243
LB_273:
	add rsp,16
	pop r14
LB_271:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_243
LB_243:
	pop r10
	cmp r8,0
	jz LB_244
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_293
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_293:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_294
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_294:
	jmp LB_286
LB_244:
	mov rdi,r13
	mov rsi,r14
	mov r8,r9
	bt r12,3
	jc LB_291
	btr r12,2
	clc
	jmp LB_292
LB_291:
	bts r12,2
	stc
LB_292:
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_289
	btr r12,1
	clc
	jmp LB_290
LB_289:
	bts r12,1
	stc
LB_290:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_287
	btr r12,0
	clc
	jmp LB_288
LB_287:
	bts r12,0
	stc
LB_288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 6
	push LB_283
	push LB_283
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ { 0' 1' } 2' } ⊢ { { {  } 0' } 1' }
	mov r9,r14
	bt r12,1
	jc LB_309
	btr r12,3
	jmp LB_310
LB_309:
	bts r12,3
LB_310:
	mov r14,r8
	bt r12,2
	jc LB_311
	btr r12,1
	jmp LB_312
LB_311:
	bts r12,1
LB_312:
	mov r8,r13
	bt r12,0
	jc LB_313
	btr r12,2
	jmp LB_314
LB_313:
	bts r12,2
LB_314:
	mov r13,r9
	bt r12,3
	jc LB_315
	btr r12,0
	jmp LB_316
LB_315:
	bts r12,0
LB_316:
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
LB_283:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_285
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_284
LB_285:
	add rsp,8
	ret
LB_286:
	add rsp,32
	pop r14
LB_284:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 7
	push LB_317
	push LB_317
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_317:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_319
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_318
LB_319:
	add rsp,8
	ret
LB_320:
	add rsp,0
	pop r14
LB_318:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_321:
NS_E_RDI_321:
NS_E_321_ETR_TBL:
NS_E_321_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142\226\136\142"
	jmp LB_349
LB_348:
	add r14,1
LB_349:
	cmp r14,r10
	jge LB_350
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_348
	cmp al,10
	jz LB_348
	cmp al,32
	jz LB_348
LB_350:
	add r14,6
	cmp r14,r10
	jg LB_353
	movzx rax,BYTE [r13+r14+8*1+0-6]
	cmp al,226
	jnz LB_353
	movzx rax,BYTE [r13+r14+8*1+1-6]
	cmp al,136
	jnz LB_353
	movzx rax,BYTE [r13+r14+8*1+2-6]
	cmp al,142
	jnz LB_353
	movzx rax,BYTE [r13+r14+8*1+3-6]
	cmp al,226
	jnz LB_353
	movzx rax,BYTE [r13+r14+8*1+4-6]
	cmp al,136
	jnz LB_353
	movzx rax,BYTE [r13+r14+8*1+5-6]
	cmp al,142
	jnz LB_353
	jmp LB_354
LB_353:
	jmp LB_333
LB_354:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\\F\\"
	jmp LB_341
LB_340:
	add r14,1
LB_341:
	cmp r14,r10
	jge LB_342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_340
	cmp al,10
	jz LB_340
	cmp al,32
	jz LB_340
LB_342:
	add r14,3
	cmp r14,r10
	jg LB_346
	movzx rax,BYTE [r13+r14+8*1+0-3]
	cmp al,92
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+1-3]
	cmp al,70
	jnz LB_346
	movzx rax,BYTE [r13+r14+8*1+2-3]
	cmp al,92
	jnz LB_346
	jmp LB_347
LB_346:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_344
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_344:
	jmp LB_334
LB_347:
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
	jc LB_338
	btr r12,1
	clc
	jmp LB_339
LB_338:
	bts r12,1
	stc
LB_339:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_336
	btr r12,0
	clc
	jmp LB_337
LB_336:
	bts r12,0
	stc
LB_337:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 8
	push LB_330
	push LB_330
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
LB_330:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_332
	pop r14
	jmp LB_335
LB_332:
	add rsp,8
	jmp LB_328
LB_334:
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
LB_335:
	jmp LB_328
LB_333:
	add rsp,32
	pop r14
LB_331:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_367
LB_366:
	add r14,1
LB_367:
	cmp r14,r10
	jge LB_368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_366
	cmp al,10
	jz LB_366
	cmp al,32
	jz LB_366
LB_368:
	push r10
	call NS_E_114_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_369
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_361
LB_369:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_res
	jmp LB_372
LB_371:
	add r14,1
LB_372:
	cmp r14,r10
	jge LB_373
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_371
	cmp al,10
	jz LB_371
	cmp al,32
	jz LB_371
LB_373:
	push r10
	call NS_E_321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_374
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_375
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_375:
	jmp LB_361
LB_374:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_364
	btr r12,1
	clc
	jmp LB_365
LB_364:
	bts r12,1
	stc
LB_365:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_362
	btr r12,0
	clc
	jmp LB_363
LB_362:
	bts r12,0
	stc
LB_363:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 9
	push LB_358
	push LB_358
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
; _some {  } ⊢ %_324 : %_324
 ; {>  %_105~2':_r64 %_106~1':_r64 %_323~{  }:{ } %_322~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_324
 ; {>  %_105~2':_r64 %_324~°0◂{  }:(_opn)◂({ }) %_106~1':_r64 %_323~{  }:{ } %_322~0':_r64 }
; 	∎ °0◂{  }
	bt r12,2
	jc LB_355
	mov rdi,r8
	call dlt
LB_355:
	bt r12,1
	jc LB_356
	mov rdi,r14
	call dlt
LB_356:
	bt r12,0
	jc LB_357
	mov rdi,r13
	call dlt
LB_357:
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
LB_358:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_360
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_359
LB_360:
	add rsp,8
	jmp LB_328
LB_361:
	add rsp,32
	pop r14
LB_359:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_328
LB_328:
	pop r10
	cmp r8,0
	jz LB_329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_382
LB_329:
	mov rdi,r13
	mov rsi,r14
	mov r13,r9
	bt r12,3
	jc LB_383
	btr r12,0
	clc
	jmp LB_384
LB_383:
	bts r12,0
	stc
LB_384:
	add rsp,0
	push rdi
	push rsi
	push 10
	push LB_379
	push LB_379
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
; _some %_325 ⊢ %_326 : %_326
 ; {>  %_108~1':_r64 %_325~{  }:{ } %_109~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_326
 ; {>  %_326~°0◂{  }:(_opn)◂({ }) %_108~1':_r64 %_109~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_377
	mov rdi,r14
	call dlt
LB_377:
	bt r12,0
	jc LB_378
	mov rdi,r13
	call dlt
LB_378:
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
LB_379:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_381
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_380
LB_381:
	add rsp,8
	ret
LB_382:
	add rsp,0
	pop r14
LB_380:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 11
	push LB_388
	push LB_388
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_327 : %_327
 ; {>  %_113~0':_r64 %_112~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_327
 ; {>  %_327~°0◂{  }:(_opn)◂({ }) %_113~0':_r64 %_112~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_386
	mov rdi,r13
	call dlt
LB_386:
	bt r12,1
	jc LB_387
	mov rdi,r14
	call dlt
LB_387:
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
LB_388:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_390
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_389
LB_390:
	add rsp,8
	ret
LB_391:
	add rsp,0
	pop r14
LB_389:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_399:
NS_E_RDI_399:
; 	» "JIJ\194\167\194\167+\226\136\142\226\136\142s8" _ ⊢ 0' : %_392
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
; » 0xr0 |~ {  } ⊢ %_393 : %_393
 ; {>  %_392~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_393
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f321 { %_392 %_393 } ⊢ { %_394 %_395 %_396 } : { %_394 %_395 %_396 }
 ; {>  %_393~1':_r64 %_392~0':_stg }
; _f321 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push -1
	push LB_406
	call NS_E_321
LB_406:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_400
	btr r12,4
	jmp LB_401
LB_400:
	bts r12,4
LB_401:
	mov r8,r9
	bt r12,3
	jc LB_404
	btr r12,2
	jmp LB_405
LB_404:
	bts r12,2
LB_405:
	mov rsi,1
	bt r12,2
	jc LB_402
	mov rsi,0
	bt r8,0
	jc LB_402
	jmp LB_403
LB_402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_403:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_395 %_396 } ⊢ { %_397 %_398 } : { %_397 %_398 }
 ; {>  %_396~2':(_opn)◂({ }) %_395~1':_r64 %_394~0':_stg }
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
	jc LB_411
	btr r12,3
	jmp LB_412
LB_411:
	bts r12,3
LB_412:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_409
	btr QWORD [rdi],0
	jmp LB_410
LB_409:
	bts QWORD [rdi],0
LB_410:
	mov r9,r8
	bt r12,2
	jc LB_415
	btr r12,3
	jmp LB_416
LB_415:
	bts r12,3
LB_416:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_413
	btr QWORD [rdi],1
	jmp LB_414
LB_413:
	bts QWORD [rdi],1
LB_414:
	push -1
	push LB_425
	call NS_E_38
LB_425:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_419
	btr r12,3
	clc
	jmp LB_420
LB_419:
	bts r12,3
	stc
LB_420:
	mov r14,r9
	bt r12,3
	jc LB_417
	btr r12,1
	jmp LB_418
LB_417:
	bts r12,1
LB_418:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_423
	btr r12,3
	clc
	jmp LB_424
LB_423:
	bts r12,3
	stc
LB_424:
	mov r8,r9
	bt r12,3
	jc LB_421
	btr r12,2
	jmp LB_422
LB_421:
	bts r12,2
LB_422:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_407
	btr r12,0
	clc
	jmp LB_408
LB_407:
	bts r12,0
	stc
LB_408:
	add rsp,16
; ∎ {  }
 ; {>  %_394~0':_stg %_398~2':(_opn)◂({ }) %_397~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_426
	mov rdi,r13
	call dlt
LB_426:
	bt r12,2
	jc LB_427
	mov rdi,r8
	call dlt
LB_427:
	bt r12,1
	jc LB_428
	mov rdi,r14
	call dlt
LB_428:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_430:
; 	|» 0'
NS_E_RDI_430:
; ∎ %_429
 ; {>  %_429~0':t120'(-1) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_446:
NS_E_RDI_446:
; 	» "{ {} {} }" _ ⊢ 0' : %_431
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_7d_7b_20_7d_7b_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_7d
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_432 : %_432
 ; {>  %_431~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_432
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f139 { %_431 %_432 } ⊢ { %_433 %_434 %_435 } : { %_433 %_434 %_435 }
 ; {>  %_431~0':_stg %_432~1':_r64 }
; _f139 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push -1
	push LB_453
	call NS_E_139
LB_453:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_447
	btr r12,4
	jmp LB_448
LB_447:
	bts r12,4
LB_448:
	mov r8,r9
	bt r12,3
	jc LB_451
	btr r12,2
	jmp LB_452
LB_451:
	bts r12,2
LB_452:
	mov rsi,1
	bt r12,2
	jc LB_449
	mov rsi,0
	bt r8,0
	jc LB_449
	jmp LB_450
LB_449:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_450:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_434 %_435 } ⊢ { %_436 %_437 } : { %_436 %_437 }
 ; {>  %_434~1':_r64 %_435~2':(_opn)◂(_r64) %_433~0':_stg }
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
	jc LB_458
	btr r12,3
	jmp LB_459
LB_458:
	bts r12,3
LB_459:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_456
	btr QWORD [rdi],0
	jmp LB_457
LB_456:
	bts QWORD [rdi],0
LB_457:
	mov r9,r8
	bt r12,2
	jc LB_462
	btr r12,3
	jmp LB_463
LB_462:
	bts r12,3
LB_463:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_460
	btr QWORD [rdi],1
	jmp LB_461
LB_460:
	bts QWORD [rdi],1
LB_461:
	push -1
	push LB_472
	call NS_E_38
LB_472:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_466
	btr r12,3
	clc
	jmp LB_467
LB_466:
	bts r12,3
	stc
LB_467:
	mov r14,r9
	bt r12,3
	jc LB_464
	btr r12,1
	jmp LB_465
LB_464:
	bts r12,1
LB_465:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_470
	btr r12,3
	clc
	jmp LB_471
LB_470:
	bts r12,3
	stc
LB_471:
	mov r8,r9
	bt r12,3
	jc LB_468
	btr r12,2
	jmp LB_469
LB_468:
	bts r12,2
LB_469:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_454
	btr r12,0
	clc
	jmp LB_455
LB_454:
	bts r12,0
	stc
LB_455:
	add rsp,16
; 	» "x" _ ⊢ 3' : %_438
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_78
	mov QWORD [rdi+8*1+8*0],rax
	mov r9,rdi
	btr r12,3
; 	» "y" _ ⊢ 4' : %_439
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_79
	mov QWORD [rdi+8*1+8*0],rax
	mov r10,rdi
	btr r12,4
; » 0xra |~ {  } ⊢ %_440 : %_440
 ; {>  %_437~2':(_opn)◂(_r64) %_438~3':_stg %_436~1':_r64 %_433~0':_stg %_439~4':_stg }
; 	» 0xra _ ⊢ 5' : %_440
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
; _f38 %_442 ⊢ %_443 : %_443
 ; {>  %_437~2':(_opn)◂(_r64) %_442~6':_stg %_438~3':_stg %_441~5':_r64 %_436~1':_r64 %_433~0':_stg %_439~4':_stg }
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
	jc LB_485
	btr r12,0
	jmp LB_486
LB_485:
	bts r12,0
LB_486:
	push -1
	push LB_489
	call NS_E_38
LB_489:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_487
	btr r12,6
	jmp LB_488
LB_487:
	bts r12,6
LB_488:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_483
	btr r12,5
	clc
	jmp LB_484
LB_483:
	bts r12,5
	stc
LB_484:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_481
	btr r12,4
	clc
	jmp LB_482
LB_481:
	bts r12,4
	stc
LB_482:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_479
	btr r12,3
	clc
	jmp LB_480
LB_479:
	bts r12,3
	stc
LB_480:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_477
	btr r12,2
	clc
	jmp LB_478
LB_477:
	bts r12,2
	stc
LB_478:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_475
	btr r12,1
	clc
	jmp LB_476
LB_475:
	bts r12,1
	stc
LB_476:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_473
	btr r12,0
	clc
	jmp LB_474
LB_473:
	bts r12,0
	stc
LB_474:
	add rsp,56
MTC_LB_490:
	mov r15,0
	mov rdi,r9
	mov rsi,r10
	bt r12,3
	call eq
	jnz MTC_LB_491
LB_492:
	cmp r15,0
	jz LB_493
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_492
LB_493:
; _f38 %_438 ⊢ %_444 : %_444
 ; {>  %_437~2':(_opn)◂(_r64) %_438~3':_stg %_441~5':_r64 %_443~6':_stg %_436~1':_r64 %_433~0':_stg %_439~4':_stg }
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
	jc LB_506
	btr r12,0
	jmp LB_507
LB_506:
	bts r12,0
LB_507:
	push -1
	push LB_510
	call NS_E_38
LB_510:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_508
	btr r12,3
	jmp LB_509
LB_508:
	bts r12,3
LB_509:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_504
	btr r12,6
	clc
	jmp LB_505
LB_504:
	bts r12,6
	stc
LB_505:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_502
	btr r12,5
	clc
	jmp LB_503
LB_502:
	bts r12,5
	stc
LB_503:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_500
	btr r12,4
	clc
	jmp LB_501
LB_500:
	bts r12,4
	stc
LB_501:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_498
	btr r12,2
	clc
	jmp LB_499
LB_498:
	bts r12,2
	stc
LB_499:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_496
	btr r12,1
	clc
	jmp LB_497
LB_496:
	bts r12,1
	stc
LB_497:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_494
	btr r12,0
	clc
	jmp LB_495
LB_494:
	bts r12,0
	stc
LB_495:
	add rsp,56
; ∎ {  }
 ; {>  %_437~2':(_opn)◂(_r64) %_441~5':_r64 %_443~6':_stg %_436~1':_r64 %_433~0':_stg %_444~3':_stg %_439~4':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_511
	mov rdi,r8
	call dlt
LB_511:
	bt r12,5
	jc LB_512
	mov rdi,r11
	call dlt
LB_512:
	bt r12,6
	jc LB_513
	mov rdi,rcx
	call dlt
LB_513:
	bt r12,1
	jc LB_514
	mov rdi,r14
	call dlt
LB_514:
	bt r12,0
	jc LB_515
	mov rdi,r13
	call dlt
LB_515:
	bt r12,3
	jc LB_516
	mov rdi,r9
	call dlt
LB_516:
	bt r12,4
	jc LB_517
	mov rdi,r10
	call dlt
LB_517:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_491:
	mov r15,0
LB_519:
	cmp r15,0
	jz LB_520
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_519
LB_520:
; _f38 %_439 ⊢ %_445 : %_445
 ; {>  %_437~2':(_opn)◂(_r64) %_438~3':_stg %_441~5':_r64 %_443~6':_stg %_436~1':_r64 %_433~0':_stg %_439~4':_stg }
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
	jc LB_533
	btr r12,0
	jmp LB_534
LB_533:
	bts r12,0
LB_534:
	push -1
	push LB_537
	call NS_E_38
LB_537:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_535
	btr r12,4
	jmp LB_536
LB_535:
	bts r12,4
LB_536:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_531
	btr r12,6
	clc
	jmp LB_532
LB_531:
	bts r12,6
	stc
LB_532:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_529
	btr r12,5
	clc
	jmp LB_530
LB_529:
	bts r12,5
	stc
LB_530:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_527
	btr r12,3
	clc
	jmp LB_528
LB_527:
	bts r12,3
	stc
LB_528:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_525
	btr r12,2
	clc
	jmp LB_526
LB_525:
	bts r12,2
	stc
LB_526:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_523
	btr r12,1
	clc
	jmp LB_524
LB_523:
	bts r12,1
	stc
LB_524:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_521
	btr r12,0
	clc
	jmp LB_522
LB_521:
	bts r12,0
	stc
LB_522:
	add rsp,56
; ∎ {  }
 ; {>  %_437~2':(_opn)◂(_r64) %_438~3':_stg %_441~5':_r64 %_445~4':_stg %_443~6':_stg %_436~1':_r64 %_433~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_538
	mov rdi,r8
	call dlt
LB_538:
	bt r12,3
	jc LB_539
	mov rdi,r9
	call dlt
LB_539:
	bt r12,5
	jc LB_540
	mov rdi,r11
	call dlt
LB_540:
	bt r12,4
	jc LB_541
	mov rdi,r10
	call dlt
LB_541:
	bt r12,6
	jc LB_542
	mov rdi,rcx
	call dlt
LB_542:
	bt r12,1
	jc LB_543
	mov rdi,r14
	call dlt
LB_543:
	bt r12,0
	jc LB_544
	mov rdi,r13
	call dlt
LB_544:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_518:
MOV_0_0:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_0_1:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_545
	bt QWORD [rax],0
	jc LB_546
	btr r12,1
	clc
	jmp LB_547
LB_546:
	bts r12,1
	stc
LB_547:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_545:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_548
	btr r12,3
	jmp LB_549
LB_548:
	bts r12,3
LB_549:
	jmp QWORD [rsp]
MOV_0_2:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_550
	bt QWORD [rax],0
	jc LB_551
	btr r12,1
	clc
	jmp LB_552
LB_551:
	bts r12,1
	stc
LB_552:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_550:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_553
	btr r12,3
	jmp LB_554
LB_553:
	bts r12,3
LB_554:
	jmp QWORD [rsp]
MOV_0_3:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_555
	bt QWORD [rax],0
	jc LB_556
	btr r12,1
	clc
	jmp LB_557
LB_556:
	bts r12,1
	stc
LB_557:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_555:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_558
	btr r12,3
	jmp LB_559
LB_558:
	bts r12,3
LB_559:
	jmp QWORD [rsp]
MOV_0_4:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_560
	bt QWORD [rax],0
	jc LB_561
	btr r12,1
	clc
	jmp LB_562
LB_561:
	bts r12,1
	stc
LB_562:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_560:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_563
	btr r12,3
	jmp LB_564
LB_563:
	bts r12,3
LB_564:
	jmp QWORD [rsp]
MOV_0_5:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_565
	bt QWORD [rax],0
	jc LB_566
	btr r12,1
	clc
	jmp LB_567
LB_566:
	bts r12,1
	stc
LB_567:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_565:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_568
	btr r12,3
	jmp LB_569
LB_568:
	bts r12,3
LB_569:
	jmp QWORD [rsp]
MOV_0_6:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_570
	bt QWORD [rax],0
	jc LB_571
	btr r12,1
	clc
	jmp LB_572
LB_571:
	bts r12,1
	stc
LB_572:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_570:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_573
	btr r12,3
	jmp LB_574
LB_573:
	bts r12,3
LB_574:
	jmp QWORD [rsp]
MOV_0_7:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_575
	bt QWORD [rax],0
	jc LB_576
	btr r12,1
	clc
	jmp LB_577
LB_576:
	bts r12,1
	stc
LB_577:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_575:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_578
	btr r12,3
	jmp LB_579
LB_578:
	bts r12,3
LB_579:
	jmp QWORD [rsp]
MOV_0_8:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_580
	bt QWORD [rax],0
	jc LB_581
	btr r12,1
	clc
	jmp LB_582
LB_581:
	bts r12,1
	stc
LB_582:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_580:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_583
	btr r12,3
	jmp LB_584
LB_583:
	bts r12,3
LB_584:
	jmp QWORD [rsp]
MOV_0_9:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_585
	bt QWORD [rax],0
	jc LB_586
	btr r12,1
	clc
	jmp LB_587
LB_586:
	bts r12,1
	stc
LB_587:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_585:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_588
	btr r12,3
	jmp LB_589
LB_588:
	bts r12,3
LB_589:
	jmp QWORD [rsp]
MOV_0_10:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_590
	bt QWORD [rax],0
	jc LB_591
	btr r12,1
	clc
	jmp LB_592
LB_591:
	bts r12,1
	stc
LB_592:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_590:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_593
	btr r12,3
	jmp LB_594
LB_593:
	bts r12,3
LB_594:
	jmp QWORD [rsp]
MOV_0_11:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_595
	bt QWORD [rax],0
	jc LB_596
	btr r12,1
	clc
	jmp LB_597
LB_596:
	bts r12,1
	stc
LB_597:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_595:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_598
	btr r12,3
	jmp LB_599
LB_598:
	bts r12,3
LB_599:
	jmp QWORD [rsp]
MOV_0_12:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_1_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_602
	btr r12,0
	jmp LB_603
LB_602:
	bts r12,0
LB_603:
	mov rsi,1
	bt r12,0
	jc LB_600
	mov rsi,0
	bt r13,0
	jc LB_600
	jmp LB_601
LB_600:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_601:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_1_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_1_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_606
	btr r12,0
	jmp LB_607
LB_606:
	bts r12,0
LB_607:
	mov rsi,1
	bt r12,0
	jc LB_604
	mov rsi,0
	bt r13,0
	jc LB_604
	jmp LB_605
LB_604:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_605:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_2_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_610
	btr r12,0
	jmp LB_611
LB_610:
	bts r12,0
LB_611:
	mov rsi,1
	bt r12,0
	jc LB_608
	mov rsi,0
	bt r13,0
	jc LB_608
	jmp LB_609
LB_608:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_609:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_2_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_2_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_614
	btr r12,0
	jmp LB_615
LB_614:
	bts r12,0
LB_615:
	mov rsi,1
	bt r12,0
	jc LB_612
	mov rsi,0
	bt r13,0
	jc LB_612
	jmp LB_613
LB_612:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_613:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_3_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_618
	btr r12,0
	jmp LB_619
LB_618:
	bts r12,0
LB_619:
	mov rsi,1
	bt r12,0
	jc LB_616
	mov rsi,0
	bt r13,0
	jc LB_616
	jmp LB_617
LB_616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_617:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_3_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_3_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_622
	btr r12,0
	jmp LB_623
LB_622:
	bts r12,0
LB_623:
	mov rsi,1
	bt r12,0
	jc LB_620
	mov rsi,0
	bt r13,0
	jc LB_620
	jmp LB_621
LB_620:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_621:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_4_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_626
	btr r12,0
	jmp LB_627
LB_626:
	bts r12,0
LB_627:
	mov rsi,1
	bt r12,0
	jc LB_624
	mov rsi,0
	bt r13,0
	jc LB_624
	jmp LB_625
LB_624:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_625:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_4_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_4_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_630
	btr r12,0
	jmp LB_631
LB_630:
	bts r12,0
LB_631:
	mov rsi,1
	bt r12,0
	jc LB_628
	mov rsi,0
	bt r13,0
	jc LB_628
	jmp LB_629
LB_628:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_629:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_5_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_634
	btr r12,0
	jmp LB_635
LB_634:
	bts r12,0
LB_635:
	mov rsi,1
	bt r12,0
	jc LB_632
	mov rsi,0
	bt r13,0
	jc LB_632
	jmp LB_633
LB_632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_633:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_5_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_5_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_638
	btr r12,0
	jmp LB_639
LB_638:
	bts r12,0
LB_639:
	mov rsi,1
	bt r12,0
	jc LB_636
	mov rsi,0
	bt r13,0
	jc LB_636
	jmp LB_637
LB_636:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_637:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_6_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_642
	btr r12,0
	jmp LB_643
LB_642:
	bts r12,0
LB_643:
	mov rsi,1
	bt r12,0
	jc LB_640
	mov rsi,0
	bt r13,0
	jc LB_640
	jmp LB_641
LB_640:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_641:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_6_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_6_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_646
	btr r12,0
	jmp LB_647
LB_646:
	bts r12,0
LB_647:
	mov rsi,1
	bt r12,0
	jc LB_644
	mov rsi,0
	bt r13,0
	jc LB_644
	jmp LB_645
LB_644:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_645:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_7_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_650
	btr r12,0
	jmp LB_651
LB_650:
	bts r12,0
LB_651:
	mov rsi,1
	bt r12,0
	jc LB_648
	mov rsi,0
	bt r13,0
	jc LB_648
	jmp LB_649
LB_648:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_649:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_7_1:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_2:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_3:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_7_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_654
	btr r12,0
	jmp LB_655
LB_654:
	bts r12,0
LB_655:
	mov rsi,1
	bt r12,0
	jc LB_652
	mov rsi,0
	bt r13,0
	jc LB_652
	jmp LB_653
LB_652:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_653:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_8_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_658
	btr r12,0
	jmp LB_659
LB_658:
	bts r12,0
LB_659:
	mov rsi,1
	bt r12,0
	jc LB_656
	mov rsi,0
	bt r13,0
	jc LB_656
	jmp LB_657
LB_656:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_657:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_8_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_8_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_662
	btr r12,0
	jmp LB_663
LB_662:
	bts r12,0
LB_663:
	mov rsi,1
	bt r12,0
	jc LB_660
	mov rsi,0
	bt r13,0
	jc LB_660
	jmp LB_661
LB_660:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_661:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_9_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_666
	btr r12,0
	jmp LB_667
LB_666:
	bts r12,0
LB_667:
	mov rsi,1
	bt r12,0
	jc LB_664
	mov rsi,0
	bt r13,0
	jc LB_664
	jmp LB_665
LB_664:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_665:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_9_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_9_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_670
	btr r12,0
	jmp LB_671
LB_670:
	bts r12,0
LB_671:
	mov rsi,1
	bt r12,0
	jc LB_668
	mov rsi,0
	bt r13,0
	jc LB_668
	jmp LB_669
LB_668:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_669:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_10_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_674
	btr r12,0
	jmp LB_675
LB_674:
	bts r12,0
LB_675:
	mov rsi,1
	bt r12,0
	jc LB_672
	mov rsi,0
	bt r13,0
	jc LB_672
	jmp LB_673
LB_672:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_673:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_10_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_10_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_678
	btr r12,0
	jmp LB_679
LB_678:
	bts r12,0
LB_679:
	mov rsi,1
	bt r12,0
	jc LB_676
	mov rsi,0
	bt r13,0
	jc LB_676
	jmp LB_677
LB_676:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_677:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_11_0:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_682
	btr r12,0
	jmp LB_683
LB_682:
	bts r12,0
LB_683:
	mov rsi,1
	bt r12,0
	jc LB_680
	mov rsi,0
	bt r13,0
	jc LB_680
	jmp LB_681
LB_680:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_681:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_11_4:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_5:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_6:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_7:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_8:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_9:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_10:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_11:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 2'◂3'
	jmp QWORD [rsp]
MOV_11_12:
; _emt_mov_ptn_to_ptn:{| 00110.. |},2'◂3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_686
	btr r12,0
	jmp LB_687
LB_686:
	bts r12,0
LB_687:
	mov rsi,1
	bt r12,0
	jc LB_684
	mov rsi,0
	bt r13,0
	jc LB_684
	jmp LB_685
LB_684:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_685:
	mov rax,r8
	shl rax,56
	or rax,1
	or r13,rax
	jmp QWORD [rsp]
MOV_12_0:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_12_1:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_688
	bt QWORD [rax],0
	jc LB_689
	btr r12,1
	clc
	jmp LB_690
LB_689:
	bts r12,1
	stc
LB_690:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_688:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_691
	btr r12,3
	jmp LB_692
LB_691:
	bts r12,3
LB_692:
	jmp QWORD [rsp]
MOV_12_2:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_693
	bt QWORD [rax],0
	jc LB_694
	btr r12,1
	clc
	jmp LB_695
LB_694:
	bts r12,1
	stc
LB_695:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_693:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_696
	btr r12,3
	jmp LB_697
LB_696:
	bts r12,3
LB_697:
	jmp QWORD [rsp]
MOV_12_3:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_698
	bt QWORD [rax],0
	jc LB_699
	btr r12,1
	clc
	jmp LB_700
LB_699:
	bts r12,1
	stc
LB_700:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_698:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_701
	btr r12,3
	jmp LB_702
LB_701:
	bts r12,3
LB_702:
	jmp QWORD [rsp]
MOV_12_4:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_703
	bt QWORD [rax],0
	jc LB_704
	btr r12,1
	clc
	jmp LB_705
LB_704:
	bts r12,1
	stc
LB_705:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_703:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_706
	btr r12,3
	jmp LB_707
LB_706:
	bts r12,3
LB_707:
	jmp QWORD [rsp]
MOV_12_5:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_708
	bt QWORD [rax],0
	jc LB_709
	btr r12,1
	clc
	jmp LB_710
LB_709:
	bts r12,1
	stc
LB_710:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_708:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_711
	btr r12,3
	jmp LB_712
LB_711:
	bts r12,3
LB_712:
	jmp QWORD [rsp]
MOV_12_6:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_713
	bt QWORD [rax],0
	jc LB_714
	btr r12,1
	clc
	jmp LB_715
LB_714:
	bts r12,1
	stc
LB_715:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_713:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_716
	btr r12,3
	jmp LB_717
LB_716:
	bts r12,3
LB_717:
	jmp QWORD [rsp]
MOV_12_7:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_718
	bt QWORD [rax],0
	jc LB_719
	btr r12,1
	clc
	jmp LB_720
LB_719:
	bts r12,1
	stc
LB_720:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_718:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_721
	btr r12,3
	jmp LB_722
LB_721:
	bts r12,3
LB_722:
	jmp QWORD [rsp]
MOV_12_8:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_723
	bt QWORD [rax],0
	jc LB_724
	btr r12,1
	clc
	jmp LB_725
LB_724:
	bts r12,1
	stc
LB_725:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_723:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_726
	btr r12,3
	jmp LB_727
LB_726:
	bts r12,3
LB_727:
	jmp QWORD [rsp]
MOV_12_9:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_728
	bt QWORD [rax],0
	jc LB_729
	btr r12,1
	clc
	jmp LB_730
LB_729:
	bts r12,1
	stc
LB_730:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_728:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_731
	btr r12,3
	jmp LB_732
LB_731:
	bts r12,3
LB_732:
	jmp QWORD [rsp]
MOV_12_10:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_733
	bt QWORD [rax],0
	jc LB_734
	btr r12,1
	clc
	jmp LB_735
LB_734:
	bts r12,1
	stc
LB_735:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_733:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_736
	btr r12,3
	jmp LB_737
LB_736:
	bts r12,3
LB_737:
	jmp QWORD [rsp]
MOV_12_11:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_738
	bt QWORD [rax],0
	jc LB_739
	btr r12,1
	clc
	jmp LB_740
LB_739:
	bts r12,1
	stc
LB_740:
	mov rdi,QWORD [rax+8*1]
	mov [rax],rbx
	mov rbx,rax
	mov rax,rdi
LB_738:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_741
	btr r12,3
	jmp LB_742
LB_741:
	bts r12,3
LB_742:
	jmp QWORD [rsp]
MOV_12_12:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_13_0:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	jmp QWORD [rsp]
MOV_13_12:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	jmp QWORD [rsp]
section .data
MOV_TBL_0:
	dq MOV_0_0
	dq MOV_0_1
	dq MOV_0_2
	dq MOV_0_3
	dq MOV_0_4
	dq MOV_0_5
	dq MOV_0_6
	dq MOV_0_7
	dq MOV_0_8
	dq MOV_0_9
	dq MOV_0_10
	dq MOV_0_11
	dq MOV_0_12
MOV_TBL_1:
	dq MOV_1_0
	dq MOV_1_1
	dq MOV_1_2
	dq MOV_1_3
	dq MOV_1_4
	dq MOV_1_5
	dq MOV_1_6
	dq MOV_1_7
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq MOV_1_12
MOV_TBL_2:
	dq MOV_2_0
	dq MOV_2_1
	dq MOV_2_2
	dq MOV_2_3
	dq MOV_2_4
	dq MOV_2_5
	dq MOV_2_6
	dq MOV_2_7
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq MOV_2_12
MOV_TBL_3:
	dq MOV_3_0
	dq MOV_3_1
	dq MOV_3_2
	dq MOV_3_3
	dq MOV_3_4
	dq MOV_3_5
	dq MOV_3_6
	dq MOV_3_7
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq MOV_3_12
MOV_TBL_4:
	dq MOV_4_0
	dq MOV_4_1
	dq MOV_4_2
	dq MOV_4_3
	dq MOV_4_4
	dq MOV_4_5
	dq MOV_4_6
	dq MOV_4_7
	dq MOV_4_8
	dq MOV_4_9
	dq MOV_4_10
	dq MOV_4_11
	dq MOV_4_12
MOV_TBL_5:
	dq MOV_5_0
	dq MOV_5_1
	dq MOV_5_2
	dq MOV_5_3
	dq MOV_5_4
	dq MOV_5_5
	dq MOV_5_6
	dq MOV_5_7
	dq MOV_5_8
	dq MOV_5_9
	dq MOV_5_10
	dq MOV_5_11
	dq MOV_5_12
MOV_TBL_6:
	dq MOV_6_0
	dq MOV_6_1
	dq MOV_6_2
	dq MOV_6_3
	dq MOV_6_4
	dq MOV_6_5
	dq MOV_6_6
	dq MOV_6_7
	dq MOV_6_8
	dq MOV_6_9
	dq MOV_6_10
	dq MOV_6_11
	dq MOV_6_12
MOV_TBL_7:
	dq MOV_7_0
	dq MOV_7_1
	dq MOV_7_2
	dq MOV_7_3
	dq MOV_7_4
	dq MOV_7_5
	dq MOV_7_6
	dq MOV_7_7
	dq MOV_7_8
	dq MOV_7_9
	dq MOV_7_10
	dq MOV_7_11
	dq MOV_7_12
MOV_TBL_8:
	dq MOV_8_0
	dq NULL
	dq NULL
	dq NULL
	dq MOV_8_4
	dq MOV_8_5
	dq MOV_8_6
	dq MOV_8_7
	dq MOV_8_8
	dq MOV_8_9
	dq MOV_8_10
	dq MOV_8_11
	dq MOV_8_12
MOV_TBL_9:
	dq MOV_9_0
	dq NULL
	dq NULL
	dq NULL
	dq MOV_9_4
	dq MOV_9_5
	dq MOV_9_6
	dq MOV_9_7
	dq MOV_9_8
	dq MOV_9_9
	dq MOV_9_10
	dq MOV_9_11
	dq MOV_9_12
MOV_TBL_10:
	dq MOV_10_0
	dq NULL
	dq NULL
	dq NULL
	dq MOV_10_4
	dq MOV_10_5
	dq MOV_10_6
	dq MOV_10_7
	dq MOV_10_8
	dq MOV_10_9
	dq MOV_10_10
	dq MOV_10_11
	dq MOV_10_12
MOV_TBL_11:
	dq MOV_11_0
	dq NULL
	dq NULL
	dq NULL
	dq MOV_11_4
	dq MOV_11_5
	dq MOV_11_6
	dq MOV_11_7
	dq MOV_11_8
	dq MOV_11_9
	dq MOV_11_10
	dq MOV_11_11
	dq MOV_11_12
MOV_TBL_12:
	dq MOV_12_0
	dq MOV_12_1
	dq MOV_12_2
	dq MOV_12_3
	dq MOV_12_4
	dq MOV_12_5
	dq MOV_12_6
	dq MOV_12_7
	dq MOV_12_8
	dq MOV_12_9
	dq MOV_12_10
	dq MOV_12_11
	dq MOV_12_12
MOV_TBL_13:
	dq MOV_13_0
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq MOV_13_12
	CST_DYN_399:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_446:
		dq 0x0000_0001_00_82_ffff
		dq 1
