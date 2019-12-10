%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_162
	call exec_out
	jmp _end
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
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
NS_E_136:
NS_E_RDI_136:
NS_E_136_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_137
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_137:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_139:
NS_E_RDI_139:
NS_E_139_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_139_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_139_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_140:
NS_E_RDI_140:
NS_E_140_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_140_LB_0
	cmp r11,57
	ja NS_E_140_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_140_LB_0:
	mov rax,0
	ret
NS_E_142:
NS_E_RDI_142:
NS_E_142_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_142_LB_0
	cmp r11,122
	ja NS_E_142_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_142_LB_0:
	mov rax,0
	ret
NS_E_141:
NS_E_RDI_141:
NS_E_141_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_141_LB_0
	cmp r11,90
	ja NS_E_141_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_141_LB_0:
	mov rax,0
	ret
NS_E_28:
	mov rdi,r13
	bt r12,0
NS_E_RDI_28:
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
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
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
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
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
	jge err_s8_ge
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
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_138:
NS_E_RDI_138:
NS_E_138_ETR_TBL:
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
	jz NS_E_138_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_138_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_162:
NS_E_RDI_162:
; 	» "-27686gg" _ ⊢ 0' : %_143
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_144 : %_144
 ; {>  %_143~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_144
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr4 |~ {  } ⊢ %_145 : %_145
 ; {>  %_144~1':_r64 %_143~0':_stg }
; 	» 0xr4 _ ⊢ 2' : %_145
	mov rdi,0x4
	mov r8,rdi
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_146 : %_146
 ; {>  %_144~1':_r64 %_145~2':_r64 %_143~0':_stg }
; 	» 0xr0 _ ⊢ 3' : %_146
	mov rdi,0x0
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_147 : %_147
 ; {>  %_144~1':_r64 %_145~2':_r64 %_143~0':_stg %_146~3':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_147
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _f21 %_143 ⊢ %_148 : %_148
 ; {>  %_144~1':_r64 %_145~2':_r64 %_143~0':_stg %_147~4':_r64 %_146~3':_r64 }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_169
	btr r12,4
	jmp LB_170
LB_169:
	bts r12,4
LB_170:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_167
	btr r12,3
	jmp LB_168
LB_167:
	bts r12,3
LB_168:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_165
	btr r12,2
	jmp LB_166
LB_165:
	bts r12,2
LB_166:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_163
	btr r12,1
	jmp LB_164
LB_163:
	bts r12,1
LB_164:
	add rsp,40
; _f138 { %_148 %_144 } ⊢ { %_149 %_150 %_151 } : { %_149 %_150 %_151 }
 ; {>  %_144~1':_r64 %_145~2':_r64 %_148~0':_stg %_147~4':_r64 %_146~3':_r64 }
; _f138 { 0' 1' } ⊢ { 0' 1' 5' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_138
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 5' }
	mov r11,r9
	bt r12,3
	jc LB_179
	btr r12,5
	jmp LB_180
LB_179:
	bts r12,5
LB_180:
	mov rsi,1
	bt r12,5
	jc LB_177
	mov rsi,0
	bt r11,0
	jc LB_177
	jmp LB_178
LB_177:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,5
LB_178:
	mov rax,r8
	shl rax,56
	or rax,1
	or r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_175
	btr r12,4
	jmp LB_176
LB_175:
	bts r12,4
LB_176:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_173
	btr r12,3
	jmp LB_174
LB_173:
	bts r12,3
LB_174:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_171
	btr r12,2
	jmp LB_172
LB_171:
	bts r12,2
LB_172:
	add rsp,32
; _f21 { %_150 %_151 } ⊢ { %_152 %_153 } : { %_152 %_153 }
 ; {>  %_151~5':(_opn)◂(_r64) %_149~0':_stg %_145~2':_r64 %_150~1':_r64 %_147~4':_r64 %_146~3':_r64 }
; _f21 { 1' 5' } ⊢ { 1' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0100010.. |},{ 1' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_191
	btr r12,2
	jmp LB_192
LB_191:
	bts r12,2
LB_192:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_189
	btr QWORD [rdi],0
	jmp LB_190
LB_189:
	bts QWORD [rdi],0
LB_190:
	mov r8,r11
	bt r12,5
	jc LB_195
	btr r12,2
	jmp LB_196
LB_195:
	bts r12,2
LB_196:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_193
	btr QWORD [rdi],1
	jmp LB_194
LB_193:
	bts QWORD [rdi],1
LB_194:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 5' }
; 0' ⊢ { 1' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_199
	btr r12,2
	jmp LB_200
LB_199:
	bts r12,2
LB_200:
	mov r14,r8
	bt r12,2
	jc LB_197
	btr r12,1
	jmp LB_198
LB_197:
	bts r12,1
LB_198:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_203
	btr r12,2
	jmp LB_204
LB_203:
	bts r12,2
LB_204:
	mov r11,r8
	bt r12,2
	jc LB_201
	btr r12,5
	jmp LB_202
LB_201:
	bts r12,5
LB_202:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_187
	btr r12,4
	jmp LB_188
LB_187:
	bts r12,4
LB_188:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_185
	btr r12,3
	jmp LB_186
LB_185:
	bts r12,3
LB_186:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_183
	btr r12,2
	jmp LB_184
LB_183:
	bts r12,2
LB_184:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_181
	btr r12,0
	jmp LB_182
LB_181:
	bts r12,0
LB_182:
	add rsp,40
; _f14 %_152 ⊢ { %_154 %_155 } : { %_154 %_155 }
 ; {>  %_152~1':_r64 %_149~0':_stg %_145~2':_r64 %_147~4':_r64 %_153~5':(_opn)◂(_r64) %_146~3':_r64 }
; _f14 1' ⊢ { 1' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_215
	btr r12,0
	jmp LB_216
LB_215:
	bts r12,0
LB_216:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 6' }
	mov rcx,r14
	bt r12,1
	jc LB_217
	btr r12,6
	jmp LB_218
LB_217:
	bts r12,6
LB_218:
	mov r14,r13
	bt r12,0
	jc LB_219
	btr r12,1
	jmp LB_220
LB_219:
	bts r12,1
LB_220:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_213
	btr r12,5
	jmp LB_214
LB_213:
	bts r12,5
LB_214:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_211
	btr r12,4
	jmp LB_212
LB_211:
	bts r12,4
LB_212:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_209
	btr r12,3
	jmp LB_210
LB_209:
	bts r12,3
LB_210:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_207
	btr r12,2
	jmp LB_208
LB_207:
	bts r12,2
LB_208:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_205
	btr r12,0
	jmp LB_206
LB_205:
	bts r12,0
LB_206:
	add rsp,48
; _f18 { %_145 %_149 %_146 %_155 %_147 } ⊢ { %_156 %_157 %_158 %_159 %_160 } : { %_156 %_157 %_158 %_159 %_160 }
 ; {>  %_149~0':_stg %_145~2':_r64 %_154~1':_r64 %_155~6':_stg %_147~4':_r64 %_153~5':(_opn)◂(_r64) %_146~3':_r64 }
; _f18 { 2' 0' 3' 6' 4' } ⊢ { 0' 2' 3' 4' 6' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10111010.. |},{ 2' 0' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r13
	bt r12,0
	jc LB_225
	btr r12,1
	jmp LB_226
LB_225:
	bts r12,1
LB_226:
	mov r13,r8
	bt r12,2
	jc LB_227
	btr r12,0
	jmp LB_228
LB_227:
	bts r12,0
LB_228:
	mov r8,r9
	bt r12,3
	jc LB_229
	btr r12,2
	jmp LB_230
LB_229:
	bts r12,2
LB_230:
	mov r9,rcx
	bt r12,6
	jc LB_231
	btr r12,3
	jmp LB_232
LB_231:
	bts r12,3
LB_232:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 2' 3' 4' 6' }
	mov rcx,r10
	bt r12,4
	jc LB_233
	btr r12,6
	jmp LB_234
LB_233:
	bts r12,6
LB_234:
	mov r10,r9
	bt r12,3
	jc LB_235
	btr r12,4
	jmp LB_236
LB_235:
	bts r12,4
LB_236:
	mov r9,r8
	bt r12,2
	jc LB_237
	btr r12,3
	jmp LB_238
LB_237:
	bts r12,3
LB_238:
	mov r8,r14
	bt r12,1
	jc LB_239
	btr r12,2
	jmp LB_240
LB_239:
	bts r12,2
LB_240:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*1]
	bt QWORD rax,5
	jc LB_223
	btr r12,5
	jmp LB_224
LB_223:
	bts r12,5
LB_224:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_221
	btr r12,1
	jmp LB_222
LB_221:
	bts r12,1
LB_222:
	add rsp,24
; _f21 %_159 ⊢ %_161 : %_161
 ; {>  %_159~4':_stg %_157~2':_stg %_156~0':_r64 %_158~3':_r64 %_154~1':_r64 %_160~6':_r64 %_153~5':(_opn)◂(_r64) }
; _f21 4' ⊢ 4'
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
	jc LB_253
	btr r12,0
	jmp LB_254
LB_253:
	bts r12,0
LB_254:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_255
	btr r12,4
	jmp LB_256
LB_255:
	bts r12,4
LB_256:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_251
	btr r12,6
	jmp LB_252
LB_251:
	bts r12,6
LB_252:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_249
	btr r12,5
	jmp LB_250
LB_249:
	bts r12,5
LB_250:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_247
	btr r12,3
	jmp LB_248
LB_247:
	bts r12,3
LB_248:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_245
	btr r12,2
	jmp LB_246
LB_245:
	bts r12,2
LB_246:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_243
	btr r12,1
	jmp LB_244
LB_243:
	bts r12,1
LB_244:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_241
	btr r12,0
	jmp LB_242
LB_241:
	bts r12,0
LB_242:
	add rsp,56
; ∎ {  }
 ; {>  %_157~2':_stg %_156~0':_r64 %_158~3':_r64 %_161~4':_stg %_154~1':_r64 %_160~6':_r64 %_153~5':(_opn)◂(_r64) }
; 	∎ {  }
	bt r12,2
	jc LB_257
	mov rdi,r8
	call dlt
LB_257:
	bt r12,0
	jc LB_258
	mov rdi,r13
	call dlt
LB_258:
	bt r12,3
	jc LB_259
	mov rdi,r9
	call dlt
LB_259:
	bt r12,4
	jc LB_260
	mov rdi,r10
	call dlt
LB_260:
	bt r12,1
	jc LB_261
	mov rdi,r14
	call dlt
LB_261:
	bt r12,6
	jc LB_262
	mov rdi,rcx
	call dlt
LB_262:
	bt r12,5
	jc LB_263
	mov rdi,r11
	call dlt
LB_263:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_136:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_136
	NS_E_DYN_139:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_139
	NS_E_DYN_140:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_140
	NS_E_DYN_141:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_141
	NS_E_DYN_142:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_142
	CST_DYN_162:
		dq 0x0000_0001_00_82_ffff
		dq 1
