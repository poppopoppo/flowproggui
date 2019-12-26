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
	call NS_E_921
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
NS_E_129:
NS_E_RDI_129:
NS_E_129_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_130
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_130:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_132:
NS_E_RDI_132:
NS_E_132_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_132_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_132_LB_0:
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
NS_E_RDI_133:
NS_E_133_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_133_LB_0
	cmp r11,57
	ja NS_E_133_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_133_LB_0:
	mov rax,0
	ret
NS_E_135:
NS_E_RDI_135:
NS_E_135_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_135_LB_0
	cmp r11,122
	ja NS_E_135_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_135_LB_0:
	mov rax,0
	ret
NS_E_134:
NS_E_RDI_134:
NS_E_134_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_134_LB_0
	cmp r11,90
	ja NS_E_134_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_134_LB_0:
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
	jc LB_147
	bt QWORD [rdi],17
	jnc LB_147
	bt QWORD [rdi],0
	jc LB_149
	btr r12,2
	clc
	jmp LB_150
LB_149:
	bts r12,2
	stc
LB_150:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_148
LB_147:
	btr r12,2
	clc
	call dcp
LB_148:
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
	jc LB_144
	mov rax,[rdi]
	bt rax,17
	jnc LB_142
	bt QWORD rax,0
	jc LB_145
	btr r12,2
	clc
	jmp LB_146
LB_145:
	bts r12,2
	stc
LB_146:
	mov rsi,QWORD [rdi+8]
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,rsi
	jmp LB_143
LB_144:
	cmp rdi,NULL
	jz err
LB_142:
	btr r12,2
LB_143:
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
	jc LB_139
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_137
	bt QWORD rax,0
	jc LB_140
	btr r12,2
	clc
	jmp LB_141
LB_140:
	bts r12,2
	stc
LB_141:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_138
LB_139:
	cmp rdi,NULL
	jz err
LB_137:
	btr r12,2
	clc
	call dcp
LB_138:
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
	jc LB_136
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_136:
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
NS_E_131:
NS_E_RDI_131:
NS_E_131_ETR_TBL:
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
	jz NS_E_131_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_131_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_157:
; 	|» { 0' 1' }
NS_E_RDI_157:
MTC_LB_158:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_159
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °0◂{ 2' 3' }
; 0' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_160
	bt QWORD [rdi],0
	jc LB_161
	btr r12,4
	clc
	jmp LB_162
LB_161:
	bts r12,4
	stc
LB_162:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_160:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_165
	btr r12,5
	clc
	jmp LB_166
LB_165:
	bts r12,5
	stc
LB_166:
	mov r8,r11
	bt r12,5
	jc LB_163
	btr r12,2
	jmp LB_164
LB_163:
	bts r12,2
LB_164:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_169
	btr r12,5
	clc
	jmp LB_170
LB_169:
	bts r12,5
	stc
LB_170:
	mov r9,r11
	bt r12,5
	jc LB_167
	btr r12,3
	jmp LB_168
LB_167:
	bts r12,3
LB_168:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_171:
	cmp r15,0
	jz LB_172
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_171
LB_172:
; _f157 { %_154 %_152 } ⊢ %_155 : %_155
 ; {>  %_152~1':(_lst)◂(t29'(-1)) %_154~3':(_lst)◂(t29'(-1)) %_153~2':t29'(-1) }
; _f157 { 3' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 3' 1' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,3
	jc LB_175
	btr r12,0
	jmp LB_176
LB_175:
	bts r12,0
LB_176:
	call NS_E_157
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_173
	btr r12,2
	clc
	jmp LB_174
LB_173:
	bts r12,2
	stc
LB_174:
	add rsp,16
; _cns { %_153 %_155 } ⊢ %_156 : %_156
 ; {>  %_155~0':(_lst)◂(t29'(-1)) %_153~2':t29'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; ∎ %_156
 ; {>  %_156~°0◂{ 2' 0' }:(_lst)◂(t29'(-1)) }
; 	∎ °0◂{ 2' 0' }
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_177
	btr r12,1
	jmp LB_178
LB_177:
	bts r12,1
LB_178:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_183
	btr r12,3
	jmp LB_184
LB_183:
	bts r12,3
LB_184:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_181
	btr QWORD [rdi],0
	jmp LB_182
LB_181:
	bts QWORD [rdi],0
LB_182:
	mov r9,r14
	bt r12,1
	jc LB_187
	btr r12,3
	jmp LB_188
LB_187:
	bts r12,3
LB_188:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_185
	btr QWORD [rdi],1
	jmp LB_186
LB_185:
	bts QWORD [rdi],1
LB_186:
	mov rsi,1
	bt r12,0
	jc LB_179
	mov rsi,0
	bt r13,0
	jc LB_179
	jmp LB_180
LB_179:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_180:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_159:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_189
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_190
	bt QWORD [rdi],0
	jc LB_191
	btr r12,2
	clc
	jmp LB_192
LB_191:
	bts r12,2
	stc
LB_192:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_190:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_193:
	cmp r15,0
	jz LB_194
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_193
LB_194:
; ∎ %_152
 ; {>  %_152~1':(_lst)◂(t29'(-1)) }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_195
	btr r12,0
	jmp LB_196
LB_195:
	bts r12,0
LB_196:
	ret
MTC_LB_189:
NS_E_212:
; 	|» 0'
NS_E_RDI_212:
MTC_LB_213:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_214
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ { 1' 2' 3' } 4' }
; 0' ⊢ °0◂{ { 1' 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_215
	bt QWORD [rdi],0
	jc LB_216
	btr r12,5
	clc
	jmp LB_217
LB_216:
	bts r12,5
	stc
LB_217:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_215:
	mov r11,rdi
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_230
	btr r12,6
	clc
	jmp LB_231
LB_230:
	bts r12,6
	stc
LB_231:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_220
	btr r12,4
	clc
	jmp LB_221
LB_220:
	bts r12,4
	stc
LB_221:
	mov r14,r10
	bt r12,4
	jc LB_218
	btr r12,1
	jmp LB_219
LB_218:
	bts r12,1
LB_219:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_224
	btr r12,4
	clc
	jmp LB_225
LB_224:
	bts r12,4
	stc
LB_225:
	mov r8,r10
	bt r12,4
	jc LB_222
	btr r12,2
	jmp LB_223
LB_222:
	bts r12,2
LB_223:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_228
	btr r12,4
	clc
	jmp LB_229
LB_228:
	bts r12,4
	stc
LB_229:
	mov r9,r10
	bt r12,4
	jc LB_226
	btr r12,3
	jmp LB_227
LB_226:
	bts r12,3
LB_227:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_234
	btr r12,6
	clc
	jmp LB_235
LB_234:
	bts r12,6
	stc
LB_235:
	mov r10,rcx
	bt r12,6
	jc LB_232
	btr r12,4
	jmp LB_233
LB_232:
	bts r12,4
LB_233:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_236:
	cmp r15,0
	jz LB_237
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_236
LB_237:
; _f212 %_204 ⊢ %_205 : %_205
 ; {>  %_204~4':(_lst)◂({ _r64 _r64 _stg }) %_202~2':_r64 %_201~1':_r64 %_203~3':_stg }
; _f212 4' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_244
	btr r12,0
	jmp LB_245
LB_244:
	bts r12,0
LB_245:
	call NS_E_212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_242
	btr r12,3
	clc
	jmp LB_243
LB_242:
	bts r12,3
	stc
LB_243:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_240
	btr r12,2
	clc
	jmp LB_241
LB_240:
	bts r12,2
	stc
LB_241:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_238
	btr r12,1
	clc
	jmp LB_239
LB_238:
	bts r12,1
	stc
LB_239:
	add rsp,32
; » _^ ..
	xor rax,rax
	add rax,8
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
	mov rdx,r14
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
	mov r11,rsp
	mov rcx,rax
	add rax,rsi
	add rax,1
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
	mov rdx,r8
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
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "prs_err "
	mov rsi,0x_20_72_72_65_5f_73_72_70
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r11
	mov rcx,rcx
	cld
	rep movsb
	pop rcx
; "-"
	mov rsi,0x_2d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,rdx
	mov rcx,QWORD [st_vct+8*8]
	cld
	rep movsb
	pop rcx
; ":"
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
	add rsp,248
; ∎ %_210
 ; {>  %_206~1':_r64 %_207~2':_r64 %_208~3':_stg %_210~4':_stg %_209~0':_stg }
; 	∎ 4'
	bt r12,1
	jc LB_246
	mov rdi,r14
	call dlt
LB_246:
	bt r12,2
	jc LB_247
	mov rdi,r8
	call dlt
LB_247:
	bt r12,3
	jc LB_248
	mov rdi,r9
	call dlt
LB_248:
	bt r12,0
	jc LB_249
	mov rdi,r13
	call dlt
LB_249:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_250
	btr r12,0
	jmp LB_251
LB_250:
	bts r12,0
LB_251:
	ret
MTC_LB_214:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_252
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
	jnc LB_253
	bt QWORD [rdi],0
	jc LB_254
	btr r12,1
	clc
	jmp LB_255
LB_254:
	bts r12,1
	stc
LB_255:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_253:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_256:
	cmp r15,0
	jz LB_257
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_256
LB_257:
; 	» "" _ ⊢ 0' : %_211
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_211
 ; {>  %_211~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_252:
NS_E_258:
NS_E_RDI_258:
NS_E_258_ETR_TBL:
NS_E_258_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_367
LB_366:
	add r14,1
LB_367:
	cmp r14,r10
	jge LB_368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_366
	cmp al,32
	jz LB_366
LB_368:
	add r14,1
	cmp r14,r10
	jg LB_371
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_371
	jmp LB_372
LB_371:
	jmp LB_361
LB_372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; nls
	jmp LB_374
LB_373:
	add r14,1
LB_374:
	cmp r14,r10
	jge LB_375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_373
	cmp al,32
	jz LB_373
LB_375:
	push r10
	call NS_E_258_ETR_TBL
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
	jmp LB_361
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
	push LB_358
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_379
	btr r12,2
	jmp LB_380
LB_379:
	bts r12,2
LB_380:
	mov r13,r14
	bt r12,1
	jc LB_381
	btr r12,0
	jmp LB_382
LB_381:
	bts r12,0
LB_382:
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
; _f38 { %_69 %_68 } ⊢ %_262 : %_262
 ; {>  %_261~0':(_p197)◂({ }) %_68~2':_r64 %_69~1':_r64 }
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
	jc LB_339
	btr r12,3
	jmp LB_340
LB_339:
	bts r12,3
LB_340:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_337
	btr QWORD [rdi],0
	jmp LB_338
LB_337:
	bts QWORD [rdi],0
LB_338:
	mov r9,r8
	bt r12,2
	jc LB_343
	btr r12,3
	jmp LB_344
LB_343:
	bts r12,3
LB_344:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_341
	btr QWORD [rdi],1
	jmp LB_342
LB_341:
	bts QWORD [rdi],1
LB_342:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_347
	btr r12,3
	clc
	jmp LB_348
LB_347:
	bts r12,3
	stc
LB_348:
	mov r14,r9
	bt r12,3
	jc LB_345
	btr r12,1
	jmp LB_346
LB_345:
	bts r12,1
LB_346:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_351
	btr r12,3
	clc
	jmp LB_352
LB_351:
	bts r12,3
	stc
LB_352:
	mov r8,r9
	bt r12,3
	jc LB_349
	btr r12,2
	jmp LB_350
LB_349:
	bts r12,2
LB_350:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_335
	btr r12,0
	clc
	jmp LB_336
LB_335:
	bts r12,0
	stc
LB_336:
	add rsp,16
; _f198 {  } ⊢ %_263 : %_263
 ; {>  %_261~0':(_p197)◂({ }) %_262~{ 1' 2' }:{ _r64 _r64 } }
; _f198 {  } ⊢ °0◂{  }
; _some %_263 ⊢ %_264 : %_264
 ; {>  %_263~°0◂{  }:(_p197)◂({ }) %_261~0':(_p197)◂({ }) %_262~{ 1' 2' }:{ _r64 _r64 } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_264
 ; {>  %_261~0':(_p197)◂({ }) %_264~°0◂°0◂{  }:(_opn)◂((_p197)◂({ })) %_262~{ 1' 2' }:{ _r64 _r64 } }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_353
	mov rdi,r13
	call dlt
LB_353:
	bt r12,1
	jc LB_354
	mov rdi,r14
	call dlt
LB_354:
	bt r12,2
	jc LB_355
	mov rdi,r8
	call dlt
LB_355:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_356
	mov rsi,0
	bt r9,0
	jc LB_356
	jmp LB_357
LB_356:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_357:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_358:
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
	ret
LB_361:
	add rsp,32
	pop r14
LB_359:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "##"
	jmp LB_396
LB_395:
	add r14,1
LB_396:
	cmp r14,r10
	jge LB_397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_395
	cmp al,32
	jz LB_395
LB_397:
	add r14,2
	cmp r14,r10
	jg LB_400
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,35
	jnz LB_400
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,35
	jnz LB_400
	jmp LB_401
LB_400:
	jmp LB_390
LB_401:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_res
	jmp LB_403
LB_402:
	add r14,1
LB_403:
	cmp r14,r10
	jge LB_404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_402
	cmp al,32
	jz LB_402
LB_404:
	push r10
	call NS_E_260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_405
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_406:
	jmp LB_390
LB_405:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_393
	btr r12,1
	clc
	jmp LB_394
LB_393:
	bts r12,1
	stc
LB_394:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
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
	add rsp,32
	push rdi
	push rsi
	push LB_387
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
; _f198 {  } ⊢ %_266 : %_266
 ; {>  %_72~1':_r64 %_265~{  }:{ } %_73~0':_r64 }
; _f198 {  } ⊢ °0◂{  }
; _some %_266 ⊢ %_267 : %_267
 ; {>  %_72~1':_r64 %_265~{  }:{ } %_266~°0◂{  }:(_p197)◂({ }) %_73~0':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_267
 ; {>  %_72~1':_r64 %_265~{  }:{ } %_267~°0◂°0◂{  }:(_opn)◂((_p197)◂({ })) %_73~0':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,1
	jc LB_383
	mov rdi,r14
	call dlt
LB_383:
	bt r12,0
	jc LB_384
	mov rdi,r13
	call dlt
LB_384:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_385
	mov rsi,0
	bt r9,0
	jc LB_385
	jmp LB_386
LB_385:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_386:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
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
	add rsp,32
	pop r14
LB_388:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_584
LB_583:
	add r14,1
LB_584:
	cmp r14,r10
	jge LB_585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_583
	cmp al,32
	jz LB_583
LB_585:
	add r14,2
	cmp r14,r10
	jg LB_588
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_588
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_588
	jmp LB_589
LB_588:
	jmp LB_576
LB_589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\n"
	jmp LB_512
LB_511:
	add r14,1
LB_512:
	cmp r14,r10
	jge LB_513
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_511
	cmp al,32
	jz LB_511
LB_513:
	add r14,1
	cmp r14,r10
	jg LB_516
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_516
	jmp LB_517
LB_516:
	jmp LB_504
LB_517:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	jmp LB_519
LB_518:
	add r14,1
LB_519:
	cmp r14,r10
	jge LB_520
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_518
	cmp al,32
	jz LB_518
LB_520:
	push r10
	call NS_E_259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_521
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_522
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_522:
	jmp LB_504
LB_521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
	jmp LB_525
LB_524:
	add r14,1
LB_525:
	cmp r14,r10
	jge LB_526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_524
	cmp al,32
	jz LB_524
LB_526:
	push r10
	call NS_E_258_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_527
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_528
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_528:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_529
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_529:
	jmp LB_504
LB_527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_509
	btr r12,2
	clc
	jmp LB_510
LB_509:
	bts r12,2
	stc
LB_510:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_507
	btr r12,1
	clc
	jmp LB_508
LB_507:
	bts r12,1
	stc
LB_508:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_505
	btr r12,0
	clc
	jmp LB_506
LB_505:
	bts r12,0
	stc
LB_506:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_501
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_531
	btr r12,3
	jmp LB_532
LB_531:
	bts r12,3
LB_532:
	mov r14,r8
	bt r12,2
	jc LB_533
	btr r12,1
	jmp LB_534
LB_533:
	bts r12,1
LB_534:
	mov r8,r13
	bt r12,0
	jc LB_535
	btr r12,2
	jmp LB_536
LB_535:
	bts r12,2
LB_536:
	mov r13,r9
	bt r12,3
	jc LB_537
	btr r12,0
	jmp LB_538
LB_537:
	bts r12,0
LB_538:
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
; _f38 {  } ⊢ %_270 : %_270
 ; {>  %_79~3':_r64 %_80~2':_r64 %_269~1':(_p197)◂({ }) %_268~0':(_p197)◂({ }) }
; _f38 {  } ⊢ {  }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ {  }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_416
	btr r12,3
	clc
	jmp LB_417
LB_416:
	bts r12,3
	stc
LB_417:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_414
	btr r12,2
	clc
	jmp LB_415
LB_414:
	bts r12,2
	stc
LB_415:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_412
	btr r12,1
	clc
	jmp LB_413
LB_412:
	bts r12,1
	stc
LB_413:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_410
	btr r12,0
	clc
	jmp LB_411
LB_410:
	bts r12,0
	stc
LB_411:
	add rsp,40
MTC_LB_418:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_419
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °0◂{  }
; 0' ⊢ °0◂{  }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_420
	bt QWORD [rdi],0
	jc LB_421
	btr r12,4
	clc
	jmp LB_422
LB_421:
	bts r12,4
	stc
LB_422:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_420:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_423:
	cmp r15,0
	jz LB_424
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_423
LB_424:
MTC_LB_425:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_426
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_427
	bt QWORD [rdi],0
	jc LB_428
	btr r12,0
	clc
	jmp LB_429
LB_428:
	bts r12,0
	stc
LB_429:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_427:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_430:
	cmp r15,0
	jz LB_431
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_430
LB_431:
; _f198 {  } ⊢ %_273 : %_273
 ; {>  %_79~3':_r64 %_80~2':_r64 %_271~{  }:{ } %_270~{  }:{ } %_272~{  }:{ } }
; _f198 {  } ⊢ °0◂{  }
; _some %_273 ⊢ %_274 : %_274
 ; {>  %_79~3':_r64 %_80~2':_r64 %_271~{  }:{ } %_273~°0◂{  }:(_p197)◂({ }) %_270~{  }:{ } %_272~{  }:{ } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_274
 ; {>  %_274~°0◂°0◂{  }:(_opn)◂((_p197)◂({ })) %_79~3':_r64 %_80~2':_r64 %_271~{  }:{ } %_270~{  }:{ } %_272~{  }:{ } }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_432
	mov rdi,r9
	call dlt
LB_432:
	bt r12,2
	jc LB_433
	mov rdi,r8
	call dlt
LB_433:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_434
	mov rsi,0
	bt r9,0
	jc LB_434
	jmp LB_435
LB_434:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_435:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_426:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_436
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_437
	bt QWORD [rdi],0
	jc LB_438
	btr r12,4
	clc
	jmp LB_439
LB_438:
	bts r12,4
	stc
LB_439:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_437:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_440
	btr r12,0
	jmp LB_441
LB_440:
	bts r12,0
LB_441:
LB_442:
	cmp r15,0
	jz LB_443
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_442
LB_443:
; _f212 %_275 ⊢ %_276 : %_276
 ; {>  %_79~3':_r64 %_80~2':_r64 %_275~0':(_lst)◂({ _r64 _r64 _stg }) %_271~{  }:{ } %_270~{  }:{ } }
; _f212 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_446
	btr r12,3
	clc
	jmp LB_447
LB_446:
	bts r12,3
	stc
LB_447:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_444
	btr r12,2
	clc
	jmp LB_445
LB_444:
	bts r12,2
	stc
LB_445:
	add rsp,24
; _f38 %_276 ⊢ %_277 : %_277
 ; {>  %_276~0':_stg %_79~3':_r64 %_80~2':_r64 %_271~{  }:{ } %_270~{  }:{ } }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_450
	btr r12,3
	clc
	jmp LB_451
LB_450:
	bts r12,3
	stc
LB_451:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_448
	btr r12,2
	clc
	jmp LB_449
LB_448:
	bts r12,2
	stc
LB_449:
	add rsp,24
	jmp err
MTC_LB_436:
MTC_LB_419:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_452
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °1◂4'
; 0' ⊢ °1◂4'
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_453
	bt QWORD [rdi],0
	jc LB_454
	btr r12,5
	clc
	jmp LB_455
LB_454:
	bts r12,5
	stc
LB_455:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_453:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_456
	btr r12,4
	jmp LB_457
LB_456:
	bts r12,4
LB_457:
LB_458:
	cmp r15,0
	jz LB_459
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_458
LB_459:
MTC_LB_460:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_461
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_462
	bt QWORD [rdi],0
	jc LB_463
	btr r12,0
	clc
	jmp LB_464
LB_463:
	bts r12,0
	stc
LB_464:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_462:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_465:
	cmp r15,0
	jz LB_466
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_465
LB_466:
; _f212 %_278 ⊢ %_280 : %_280
 ; {>  %_79~3':_r64 %_80~2':_r64 %_279~{  }:{ } %_278~4':(_lst)◂({ _r64 _r64 _stg }) %_270~{  }:{ } }
; _f212 4' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_471
	btr r12,0
	jmp LB_472
LB_471:
	bts r12,0
LB_472:
	call NS_E_212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_469
	btr r12,3
	clc
	jmp LB_470
LB_469:
	bts r12,3
	stc
LB_470:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_467
	btr r12,2
	clc
	jmp LB_468
LB_467:
	bts r12,2
	stc
LB_468:
	add rsp,24
; _f38 %_280 ⊢ %_281 : %_281
 ; {>  %_79~3':_r64 %_80~2':_r64 %_279~{  }:{ } %_280~0':_stg %_270~{  }:{ } }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_475
	btr r12,3
	clc
	jmp LB_476
LB_475:
	bts r12,3
	stc
LB_476:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_473
	btr r12,2
	clc
	jmp LB_474
LB_473:
	bts r12,2
	stc
LB_474:
	add rsp,24
	jmp err
MTC_LB_461:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_477
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_478
	bt QWORD [rdi],0
	jc LB_479
	btr r12,5
	clc
	jmp LB_480
LB_479:
	bts r12,5
	stc
LB_480:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_478:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_481
	btr r12,0
	jmp LB_482
LB_481:
	bts r12,0
LB_482:
LB_483:
	cmp r15,0
	jz LB_484
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_483
LB_484:
; _f157 { %_278 %_282 } ⊢ %_283 : %_283
 ; {>  %_79~3':_r64 %_80~2':_r64 %_278~4':(_lst)◂({ _r64 _r64 _stg }) %_282~0':(_lst)◂({ _r64 _r64 _stg }) %_270~{  }:{ } }
; _f157 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_489
	btr r12,1
	jmp LB_490
LB_489:
	bts r12,1
LB_490:
	mov r13,r10
	bt r12,4
	jc LB_491
	btr r12,0
	jmp LB_492
LB_491:
	bts r12,0
LB_492:
	call NS_E_157
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_487
	btr r12,3
	clc
	jmp LB_488
LB_487:
	bts r12,3
	stc
LB_488:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_485
	btr r12,2
	clc
	jmp LB_486
LB_485:
	bts r12,2
	stc
LB_486:
	add rsp,24
; _f212 %_283 ⊢ %_284 : %_284
 ; {>  %_79~3':_r64 %_80~2':_r64 %_283~0':(_lst)◂({ _r64 _r64 _stg }) %_270~{  }:{ } }
; _f212 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_212
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_495
	btr r12,3
	clc
	jmp LB_496
LB_495:
	bts r12,3
	stc
LB_496:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_493
	btr r12,2
	clc
	jmp LB_494
LB_493:
	bts r12,2
	stc
LB_494:
	add rsp,24
; _f38 %_284 ⊢ %_285 : %_285
 ; {>  %_284~0':_stg %_79~3':_r64 %_80~2':_r64 %_270~{  }:{ } }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_499
	btr r12,3
	clc
	jmp LB_500
LB_499:
	bts r12,3
	stc
LB_500:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_497
	btr r12,2
	clc
	jmp LB_498
LB_497:
	bts r12,2
	stc
LB_498:
	add rsp,24
	jmp err
MTC_LB_477:
MTC_LB_452:
LB_501:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_503
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_502
LB_503:
	add rsp,8
	jmp LB_408
LB_504:
	add rsp,48
	pop r14
LB_502:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_547
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; » _^ ..
	xor rax,rax
	add rax,8
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
	mov rdx,r13
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
	mov r9,rsp
	mov r10,rax
	add rax,rsi
	add rax,1
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
	mov rdx,r14
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
	mov r11,rsp
	mov rcx,rax
	add rax,rsi
	add rax,2
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "nls_err "
	mov rsi,0x_20_72_72_65_5f_73_6c_6e
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r9
	mov rcx,r10
	cld
	rep movsb
	pop rcx
; "-"
	mov rsi,0x_2d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r11
	mov rcx,rcx
	cld
	rep movsb
	pop rcx
; ":\n"
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
	add rsp,248
; _f38 %_288 ⊢ %_289 : %_289
 ; {>  %_288~2':_stg %_287~1':_r64 %_286~0':_r64 }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_543
	btr r12,0
	jmp LB_544
LB_543:
	bts r12,0
LB_544:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_545
	btr r12,2
	jmp LB_546
LB_545:
	bts r12,2
LB_546:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_541
	btr r12,1
	clc
	jmp LB_542
LB_541:
	bts r12,1
	stc
LB_542:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_539
	btr r12,0
	clc
	jmp LB_540
LB_539:
	bts r12,0
	stc
LB_540:
	add rsp,24
	jmp err
LB_547:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_549
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_548
LB_549:
	add rsp,8
	jmp LB_408
LB_550:
	add rsp,0
	pop r14
LB_548:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_408
LB_408:
	pop r10
	cmp r8,0
	jz LB_409
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_581
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_581:
	jmp LB_576
LB_409:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_579
	btr r12,1
	clc
	jmp LB_580
LB_579:
	bts r12,1
	stc
LB_580:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_577
	btr r12,0
	clc
	jmp LB_578
LB_577:
	bts r12,0
	stc
LB_578:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_573
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_590
	btr r12,2
	jmp LB_591
LB_590:
	bts r12,2
LB_591:
	mov r13,r14
	bt r12,1
	jc LB_592
	btr r12,0
	jmp LB_593
LB_592:
	bts r12,0
LB_593:
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
; _f38 { %_88 %_87 } ⊢ %_291 : %_291
 ; {>  %_290~0':(_p197)◂({ }) %_87~2':_r64 %_88~1':_r64 }
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
	jc LB_555
	btr r12,3
	jmp LB_556
LB_555:
	bts r12,3
LB_556:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_553
	btr QWORD [rdi],0
	jmp LB_554
LB_553:
	bts QWORD [rdi],0
LB_554:
	mov r9,r8
	bt r12,2
	jc LB_559
	btr r12,3
	jmp LB_560
LB_559:
	bts r12,3
LB_560:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_557
	btr QWORD [rdi],1
	jmp LB_558
LB_557:
	bts QWORD [rdi],1
LB_558:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_563
	btr r12,3
	clc
	jmp LB_564
LB_563:
	bts r12,3
	stc
LB_564:
	mov r14,r9
	bt r12,3
	jc LB_561
	btr r12,1
	jmp LB_562
LB_561:
	bts r12,1
LB_562:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_567
	btr r12,3
	clc
	jmp LB_568
LB_567:
	bts r12,3
	stc
LB_568:
	mov r8,r9
	bt r12,3
	jc LB_565
	btr r12,2
	jmp LB_566
LB_565:
	bts r12,2
LB_566:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_551
	btr r12,0
	clc
	jmp LB_552
LB_551:
	bts r12,0
	stc
LB_552:
	add rsp,16
; _some %_290 ⊢ %_292 : %_292
 ; {>  %_291~{ 1' 2' }:{ _r64 _r64 } %_290~0':(_p197)◂({ }) }
; _some 0' ⊢ °0◂0'
; ∎ %_292
 ; {>  %_291~{ 1' 2' }:{ _r64 _r64 } %_292~°0◂0':(_opn)◂((_p197)◂({ })) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_569
	mov rdi,r14
	call dlt
LB_569:
	bt r12,2
	jc LB_570
	mov rdi,r8
	call dlt
LB_570:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_571
	btr r12,3
	jmp LB_572
LB_571:
	bts r12,3
LB_572:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_574
LB_575:
	add rsp,8
	ret
LB_576:
	add rsp,16
	pop r14
LB_574:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_598
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f198 {  } ⊢ %_293 : %_293
 ; {>  %_92~0':_r64 %_91~1':_r64 }
; _f198 {  } ⊢ °0◂{  }
; _some %_293 ⊢ %_294 : %_294
 ; {>  %_293~°0◂{  }:(_p197)◂({ }) %_92~0':_r64 %_91~1':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_294
 ; {>  %_294~°0◂°0◂{  }:(_opn)◂((_p197)◂({ })) %_92~0':_r64 %_91~1':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_594
	mov rdi,r13
	call dlt
LB_594:
	bt r12,1
	jc LB_595
	mov rdi,r14
	call dlt
LB_595:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_596
	mov rsi,0
	bt r9,0
	jc LB_596
	jmp LB_597
LB_596:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_597:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_598:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_600
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_599
LB_600:
	add rsp,8
	ret
LB_601:
	add rsp,0
	pop r14
LB_599:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_259:
NS_E_RDI_259:
NS_E_259_ETR_TBL:
NS_E_259_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_758
LB_757:
	add r14,1
LB_758:
	cmp r14,r10
	jge LB_759
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_757
	cmp al,32
	jz LB_757
LB_759:
	add r14,2
	cmp r14,r10
	jg LB_762
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_762
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_762
	jmp LB_763
LB_762:
	jmp LB_750
LB_763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\n"
	jmp LB_690
LB_689:
	add r14,1
LB_690:
	cmp r14,r10
	jge LB_691
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_689
	cmp al,32
	jz LB_689
LB_691:
	add r14,1
	cmp r14,r10
	jg LB_694
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_694
	jmp LB_695
LB_694:
	jmp LB_682
LB_695:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	jmp LB_697
LB_696:
	add r14,1
LB_697:
	cmp r14,r10
	jge LB_698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_696
	cmp al,32
	jz LB_696
LB_698:
	push r10
	call NS_E_259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_699
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_700
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_700:
	jmp LB_682
LB_699:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	jmp LB_703
LB_702:
	add r14,1
LB_703:
	cmp r14,r10
	jge LB_704
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_702
	cmp al,32
	jz LB_702
LB_704:
	push r10
	call NS_E_259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_705
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_706
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_706:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_707
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_707:
	jmp LB_682
LB_705:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_687
	btr r12,2
	clc
	jmp LB_688
LB_687:
	bts r12,2
	stc
LB_688:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_685
	btr r12,1
	clc
	jmp LB_686
LB_685:
	bts r12,1
	stc
LB_686:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_683
	btr r12,0
	clc
	jmp LB_684
LB_683:
	bts r12,0
	stc
LB_684:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_679
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_709
	btr r12,3
	jmp LB_710
LB_709:
	bts r12,3
LB_710:
	mov r14,r8
	bt r12,2
	jc LB_711
	btr r12,1
	jmp LB_712
LB_711:
	bts r12,1
LB_712:
	mov r8,r13
	bt r12,0
	jc LB_713
	btr r12,2
	jmp LB_714
LB_713:
	bts r12,2
LB_714:
	mov r13,r9
	bt r12,3
	jc LB_715
	btr r12,0
	jmp LB_716
LB_715:
	bts r12,0
LB_716:
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
MTC_LB_604:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_605
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °0◂{  }
; 0' ⊢ °0◂{  }
	btr r12,4
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_606
	bt QWORD [rdi],0
	jc LB_607
	btr r12,4
	clc
	jmp LB_608
LB_607:
	bts r12,4
	stc
LB_608:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_606:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_609:
	cmp r15,0
	jz LB_610
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_609
LB_610:
MTC_LB_611:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_612
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_613
	bt QWORD [rdi],0
	jc LB_614
	btr r12,0
	clc
	jmp LB_615
LB_614:
	bts r12,0
	stc
LB_615:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_613:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_616:
	cmp r15,0
	jz LB_617
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_616
LB_617:
; _f198 {  } ⊢ %_299 : %_299
 ; {>  %_297~{  }:{ } %_298~{  }:{ } %_95~3':_r64 %_96~2':_r64 }
; _f198 {  } ⊢ °0◂{  }
; _some %_299 ⊢ %_300 : %_300
 ; {>  %_297~{  }:{ } %_299~°0◂{  }:(_p197)◂({ }) %_298~{  }:{ } %_95~3':_r64 %_96~2':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_300
 ; {>  %_297~{  }:{ } %_300~°0◂°0◂{  }:(_opn)◂((_p197)◂({ })) %_298~{  }:{ } %_95~3':_r64 %_96~2':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_618
	mov rdi,r9
	call dlt
LB_618:
	bt r12,2
	jc LB_619
	mov rdi,r8
	call dlt
LB_619:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_620
	mov rsi,0
	bt r9,0
	jc LB_620
	jmp LB_621
LB_620:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_621:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_612:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_622
; _emt_mov_ptn_to_ptn:{| 01110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_623
	bt QWORD [rdi],0
	jc LB_624
	btr r12,4
	clc
	jmp LB_625
LB_624:
	bts r12,4
	stc
LB_625:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_623:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_626
	btr r12,0
	jmp LB_627
LB_626:
	bts r12,0
LB_627:
LB_628:
	cmp r15,0
	jz LB_629
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_628
LB_629:
; _f199 %_301 ⊢ %_302 : %_302
 ; {>  %_297~{  }:{ } %_301~0':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_96~2':_r64 }
; _f199 0' ⊢ °1◂0'
; _some %_302 ⊢ %_303 : %_303
 ; {>  %_297~{  }:{ } %_95~3':_r64 %_96~2':_r64 %_302~°1◂0':(_p197)◂(t166'(1)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_303
 ; {>  %_297~{  }:{ } %_95~3':_r64 %_303~°0◂°1◂0':(_opn)◂((_p197)◂(t169'(1))) %_96~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,3
	jc LB_630
	mov rdi,r9
	call dlt
LB_630:
	bt r12,2
	jc LB_631
	mov rdi,r8
	call dlt
LB_631:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_634
	btr r12,3
	jmp LB_635
LB_634:
	bts r12,3
LB_635:
	mov rsi,1
	bt r12,3
	jc LB_632
	mov rsi,0
	bt r9,0
	jc LB_632
	jmp LB_633
LB_632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_633:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_622:
MTC_LB_605:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_636
; _emt_mov_ptn_to_ptn:{| 11110.. |},0' ⊢ °1◂4'
; 0' ⊢ °1◂4'
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_637
	bt QWORD [rdi],0
	jc LB_638
	btr r12,5
	clc
	jmp LB_639
LB_638:
	bts r12,5
	stc
LB_639:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_637:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_640
	btr r12,4
	jmp LB_641
LB_640:
	bts r12,4
LB_641:
LB_642:
	cmp r15,0
	jz LB_643
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_642
LB_643:
MTC_LB_644:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_645
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_646
	bt QWORD [rdi],0
	jc LB_647
	btr r12,0
	clc
	jmp LB_648
LB_647:
	bts r12,0
	stc
LB_648:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_646:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_649:
	cmp r15,0
	jz LB_650
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_649
LB_650:
; _f199 %_304 ⊢ %_306 : %_306
 ; {>  %_304~4':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_305~{  }:{ } %_96~2':_r64 }
; _f199 4' ⊢ °1◂4'
; _some %_306 ⊢ %_307 : %_307
 ; {>  %_95~3':_r64 %_305~{  }:{ } %_96~2':_r64 %_306~°1◂4':(_p197)◂(t180'(1)) }
; _some °1◂4' ⊢ °0◂°1◂4'
; ∎ %_307
 ; {>  %_307~°0◂°1◂4':(_opn)◂((_p197)◂(t183'(1))) %_95~3':_r64 %_305~{  }:{ } %_96~2':_r64 }
; 	∎ °0◂°1◂4'
	bt r12,3
	jc LB_651
	mov rdi,r9
	call dlt
LB_651:
	bt r12,2
	jc LB_652
	mov rdi,r8
	call dlt
LB_652:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°1◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_655
	btr r12,3
	jmp LB_656
LB_655:
	bts r12,3
LB_656:
	mov rsi,1
	bt r12,3
	jc LB_653
	mov rsi,0
	bt r9,0
	jc LB_653
	jmp LB_654
LB_653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_654:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_645:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_657
; _emt_mov_ptn_to_ptn:{| 011110.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_658
	bt QWORD [rdi],0
	jc LB_659
	btr r12,5
	clc
	jmp LB_660
LB_659:
	bts r12,5
	stc
LB_660:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_658:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_661
	btr r12,0
	jmp LB_662
LB_661:
	bts r12,0
LB_662:
LB_663:
	cmp r15,0
	jz LB_664
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_663
LB_664:
; _f157 { %_304 %_308 } ⊢ %_309 : %_309
 ; {>  %_304~4':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_96~2':_r64 %_308~0':(_lst)◂({ _r64 _r64 _stg }) }
; _f157 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_669
	btr r12,1
	jmp LB_670
LB_669:
	bts r12,1
LB_670:
	mov r13,r10
	bt r12,4
	jc LB_671
	btr r12,0
	jmp LB_672
LB_671:
	bts r12,0
LB_672:
	call NS_E_157
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_667
	btr r12,3
	clc
	jmp LB_668
LB_667:
	bts r12,3
	stc
LB_668:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_665
	btr r12,2
	clc
	jmp LB_666
LB_665:
	bts r12,2
	stc
LB_666:
	add rsp,24
; _f199 %_309 ⊢ %_310 : %_310
 ; {>  %_309~0':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_96~2':_r64 }
; _f199 0' ⊢ °1◂0'
; _some %_310 ⊢ %_311 : %_311
 ; {>  %_95~3':_r64 %_96~2':_r64 %_310~°1◂0':(_p197)◂(t188'(1)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_311
 ; {>  %_311~°0◂°1◂0':(_opn)◂((_p197)◂(t191'(1))) %_95~3':_r64 %_96~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,3
	jc LB_673
	mov rdi,r9
	call dlt
LB_673:
	bt r12,2
	jc LB_674
	mov rdi,r8
	call dlt
LB_674:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_677
	btr r12,3
	jmp LB_678
LB_677:
	bts r12,3
LB_678:
	mov rsi,1
	bt r12,3
	jc LB_675
	mov rsi,0
	bt r9,0
	jc LB_675
	jmp LB_676
LB_675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_676:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_657:
MTC_LB_636:
LB_679:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_681
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_680
LB_681:
	add rsp,8
	jmp LB_602
LB_682:
	add rsp,48
	pop r14
LB_680:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_739
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_312 : %_312
 ; {>  %_100~0':_r64 %_99~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 0" _ ⊢ 2' : %_313
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_100 %_99 %_313 } %_312 } ⊢ %_314 : %_314
 ; {>  %_100~0':_r64 %_312~°1◂{  }:(_lst)◂(t199'(1)) %_99~1':_r64 %_313~2':_stg }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f199 %_314 ⊢ %_315 : %_315
 ; {>  %_314~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f199 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_315 ⊢ %_316 : %_316
 ; {>  %_315~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p197)◂(t205'(1)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_316
 ; {>  %_316~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p197)◂(t208'(1))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_725
	btr r12,5
	jmp LB_726
LB_725:
	bts r12,5
LB_726:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_723
	btr QWORD [rdi],0
	jmp LB_724
LB_723:
	bts QWORD [rdi],0
LB_724:
	mov r11,r14
	bt r12,1
	jc LB_729
	btr r12,5
	jmp LB_730
LB_729:
	bts r12,5
LB_730:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_727
	btr QWORD [rdi],1
	jmp LB_728
LB_727:
	bts QWORD [rdi],1
LB_728:
	mov r11,r8
	bt r12,2
	jc LB_733
	btr r12,5
	jmp LB_734
LB_733:
	bts r12,5
LB_734:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_731
	btr QWORD [rdi],2
	jmp LB_732
LB_731:
	bts QWORD [rdi],2
LB_732:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_721
	btr QWORD [rdi],0
	jmp LB_722
LB_721:
	bts QWORD [rdi],0
LB_722:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_737
	mov rsi,0
	bt r10,0
	jc LB_737
	jmp LB_738
LB_737:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_738:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_735
	btr QWORD [rdi],1
	jmp LB_736
LB_735:
	bts QWORD [rdi],1
LB_736:
	mov rsi,1
	bt r12,3
	jc LB_719
	mov rsi,0
	bt r9,0
	jc LB_719
	jmp LB_720
LB_719:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_720:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_717
	mov rsi,0
	bt r9,0
	jc LB_717
	jmp LB_718
LB_717:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_718:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_739:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_741
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_740
LB_741:
	add rsp,8
	jmp LB_602
LB_742:
	add rsp,0
	pop r14
LB_740:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_602
LB_602:
	pop r10
	cmp r8,0
	jz LB_603
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_755:
	jmp LB_750
LB_603:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_753
	btr r12,1
	clc
	jmp LB_754
LB_753:
	bts r12,1
	stc
LB_754:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_751
	btr r12,0
	clc
	jmp LB_752
LB_751:
	bts r12,0
	stc
LB_752:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_747
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_764
	btr r12,2
	jmp LB_765
LB_764:
	bts r12,2
LB_765:
	mov r13,r14
	bt r12,1
	jc LB_766
	btr r12,0
	jmp LB_767
LB_766:
	bts r12,0
LB_767:
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
; _some %_317 ⊢ %_318 : %_318
 ; {>  %_103~1':_r64 %_317~0':(_p197)◂({ }) %_102~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_318
 ; {>  %_103~1':_r64 %_102~2':_r64 %_318~°0◂0':(_opn)◂((_p197)◂({ })) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_743
	mov rdi,r14
	call dlt
LB_743:
	bt r12,2
	jc LB_744
	mov rdi,r8
	call dlt
LB_744:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_745
	btr r12,3
	jmp LB_746
LB_745:
	bts r12,3
LB_746:
	mov r8,0
	bts r12,2
	ret
LB_747:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_749
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_748
LB_749:
	add rsp,8
	ret
LB_750:
	add rsp,16
	pop r14
LB_748:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\\]"
	jmp LB_801
LB_800:
	add r14,1
LB_801:
	cmp r14,r10
	jge LB_802
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_800
	cmp al,32
	jz LB_800
LB_802:
	add r14,2
	cmp r14,r10
	jg LB_805
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_805
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,93
	jnz LB_805
	jmp LB_806
LB_805:
	jmp LB_795
LB_806:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_808
LB_807:
	add r14,1
LB_808:
	cmp r14,r10
	jge LB_809
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_807
	cmp al,32
	jz LB_807
LB_809:
	add r14,1
	cmp r14,r10
	jg LB_813
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_813
	jmp LB_814
LB_813:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_811
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_811:
	jmp LB_795
LB_814:
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
	jc LB_798
	btr r12,1
	clc
	jmp LB_799
LB_798:
	bts r12,1
	stc
LB_799:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_796
	btr r12,0
	clc
	jmp LB_797
LB_796:
	bts r12,0
	stc
LB_797:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_792
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
; _f38 { %_107 %_106 } ⊢ %_319 : %_319
 ; {>  %_107~0':_r64 %_106~1':_r64 }
; _f38 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_768
	btr r12,2
	jmp LB_769
LB_768:
	bts r12,2
LB_769:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_772
	btr r12,3
	jmp LB_773
LB_772:
	bts r12,3
LB_773:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_770
	btr QWORD [rdi],0
	jmp LB_771
LB_770:
	bts QWORD [rdi],0
LB_771:
	mov r9,r14
	bt r12,1
	jc LB_776
	btr r12,3
	jmp LB_777
LB_776:
	bts r12,3
LB_777:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_774
	btr QWORD [rdi],1
	jmp LB_775
LB_774:
	bts QWORD [rdi],1
LB_775:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_778
	btr r12,2
	jmp LB_779
LB_778:
	bts r12,2
LB_779:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_782
	btr r12,3
	clc
	jmp LB_783
LB_782:
	bts r12,3
	stc
LB_783:
	mov r13,r9
	bt r12,3
	jc LB_780
	btr r12,0
	jmp LB_781
LB_780:
	bts r12,0
LB_781:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_786
	btr r12,3
	clc
	jmp LB_787
LB_786:
	bts r12,3
	stc
LB_787:
	mov r14,r9
	bt r12,3
	jc LB_784
	btr r12,1
	jmp LB_785
LB_784:
	bts r12,1
LB_785:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f198 {  } ⊢ %_320 : %_320
 ; {>  %_319~{ 0' 1' }:{ _r64 _r64 } }
; _f198 {  } ⊢ °0◂{  }
; _some %_320 ⊢ %_321 : %_321
 ; {>  %_320~°0◂{  }:(_p197)◂({ }) %_319~{ 0' 1' }:{ _r64 _r64 } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_321
 ; {>  %_321~°0◂°0◂{  }:(_opn)◂((_p197)◂({ })) %_319~{ 0' 1' }:{ _r64 _r64 } }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_788
	mov rdi,r13
	call dlt
LB_788:
	bt r12,1
	jc LB_789
	mov rdi,r14
	call dlt
LB_789:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
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
	mov r8,0
	bts r12,2
	ret
LB_792:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_794
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_793
LB_794:
	add rsp,8
	ret
LB_795:
	add rsp,32
	pop r14
LB_793:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line_res
	jmp LB_828
LB_827:
	add r14,1
LB_828:
	cmp r14,r10
	jge LB_829
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_827
	cmp al,32
	jz LB_827
LB_829:
	push r10
	call NS_E_260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_830
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_822
LB_830:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	jmp LB_833
LB_832:
	add r14,1
LB_833:
	cmp r14,r10
	jge LB_834
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_832
	cmp al,32
	jz LB_832
LB_834:
	push r10
	call NS_E_259_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_835
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_836
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_836:
	jmp LB_822
LB_835:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_825
	btr r12,1
	clc
	jmp LB_826
LB_825:
	bts r12,1
	stc
LB_826:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_823
	btr r12,0
	clc
	jmp LB_824
LB_823:
	bts r12,0
	stc
LB_824:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_819
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_838
	btr r12,2
	jmp LB_839
LB_838:
	bts r12,2
LB_839:
	mov r13,r14
	bt r12,1
	jc LB_840
	btr r12,0
	jmp LB_841
LB_840:
	bts r12,0
LB_841:
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
; _some %_323 ⊢ %_324 : %_324
 ; {>  %_110~2':_r64 %_323~0':(_p197)◂({ }) %_111~1':_r64 %_322~{  }:{ } }
; _some 0' ⊢ °0◂0'
; ∎ %_324
 ; {>  %_110~2':_r64 %_324~°0◂0':(_opn)◂((_p197)◂({ })) %_111~1':_r64 %_322~{  }:{ } }
; 	∎ °0◂0'
	bt r12,2
	jc LB_815
	mov rdi,r8
	call dlt
LB_815:
	bt r12,1
	jc LB_816
	mov rdi,r14
	call dlt
LB_816:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_817
	btr r12,3
	jmp LB_818
LB_817:
	bts r12,3
LB_818:
	mov r8,0
	bts r12,2
	ret
LB_819:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_821
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_820
LB_821:
	add rsp,8
	ret
LB_822:
	add rsp,32
	pop r14
LB_820:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_864
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_325 : %_325
 ; {>  %_115~0':_r64 %_114~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 1" _ ⊢ 2' : %_326
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_115 %_114 %_326 } %_325 } ⊢ %_327 : %_327
 ; {>  %_115~0':_r64 %_326~2':_stg %_114~1':_r64 %_325~°1◂{  }:(_lst)◂(t225'(0)) }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f199 %_327 ⊢ %_328 : %_328
 ; {>  %_327~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f199 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_328 ⊢ %_329 : %_329
 ; {>  %_328~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p197)◂(t231'(0)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_329
 ; {>  %_329~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p197)◂(t234'(0))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_850
	btr r12,5
	jmp LB_851
LB_850:
	bts r12,5
LB_851:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_848
	btr QWORD [rdi],0
	jmp LB_849
LB_848:
	bts QWORD [rdi],0
LB_849:
	mov r11,r14
	bt r12,1
	jc LB_854
	btr r12,5
	jmp LB_855
LB_854:
	bts r12,5
LB_855:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_852
	btr QWORD [rdi],1
	jmp LB_853
LB_852:
	bts QWORD [rdi],1
LB_853:
	mov r11,r8
	bt r12,2
	jc LB_858
	btr r12,5
	jmp LB_859
LB_858:
	bts r12,5
LB_859:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_856
	btr QWORD [rdi],2
	jmp LB_857
LB_856:
	bts QWORD [rdi],2
LB_857:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_846
	btr QWORD [rdi],0
	jmp LB_847
LB_846:
	bts QWORD [rdi],0
LB_847:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_862
	mov rsi,0
	bt r10,0
	jc LB_862
	jmp LB_863
LB_862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_863:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_860
	btr QWORD [rdi],1
	jmp LB_861
LB_860:
	bts QWORD [rdi],1
LB_861:
	mov rsi,1
	bt r12,3
	jc LB_844
	mov rsi,0
	bt r9,0
	jc LB_844
	jmp LB_845
LB_844:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_845:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_842
	mov rsi,0
	bt r9,0
	jc LB_842
	jmp LB_843
LB_842:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_843:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_864:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_866
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_865
LB_866:
	add rsp,8
	ret
LB_867:
	add rsp,0
	pop r14
LB_865:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_260:
NS_E_RDI_260:
NS_E_260_ETR_TBL:
NS_E_260_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	jmp LB_877
LB_876:
	add r14,1
LB_877:
	cmp r14,r10
	jge LB_878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_876
	cmp al,32
	jz LB_876
LB_878:
	add r14,1
	cmp r14,r10
	jg LB_881
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_881
	jmp LB_882
LB_881:
	jmp LB_873
LB_882:
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
	jc LB_874
	btr r12,0
	clc
	jmp LB_875
LB_874:
	bts r12,0
	stc
LB_875:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_870
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
; _some {  } ⊢ %_330 : %_330
 ; {>  %_118~1':_r64 %_119~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_330
 ; {>  %_118~1':_r64 %_330~°0◂{  }:(_opn)◂({ }) %_119~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_868
	mov rdi,r14
	call dlt
LB_868:
	bt r12,0
	jc LB_869
	mov rdi,r13
	call dlt
LB_869:
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
LB_870:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_872
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_871
LB_872:
	add rsp,8
	ret
LB_873:
	add rsp,16
	pop r14
LB_871:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_895
LB_894:
	add r14,1
LB_895:
	cmp r14,r10
	jge LB_896
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_894
	cmp al,32
	jz LB_894
LB_896:
	push r10
	call NS_E_129_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_897
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_889
LB_897:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_res
	jmp LB_900
LB_899:
	add r14,1
LB_900:
	cmp r14,r10
	jge LB_901
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_899
	cmp al,32
	jz LB_899
LB_901:
	push r10
	call NS_E_260_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_902
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_903
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_903:
	jmp LB_889
LB_902:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_892
	btr r12,1
	clc
	jmp LB_893
LB_892:
	bts r12,1
	stc
LB_893:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_890
	btr r12,0
	clc
	jmp LB_891
LB_890:
	bts r12,0
	stc
LB_891:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_886
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
; _some {  } ⊢ %_333 : %_333
 ; {>  %_331~0':_r64 %_122~2':_r64 %_332~{  }:{ } %_123~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_333
 ; {>  %_331~0':_r64 %_122~2':_r64 %_333~°0◂{  }:(_opn)◂({ }) %_332~{  }:{ } %_123~1':_r64 }
; 	∎ °0◂{  }
	bt r12,0
	jc LB_883
	mov rdi,r13
	call dlt
LB_883:
	bt r12,2
	jc LB_884
	mov rdi,r8
	call dlt
LB_884:
	bt r12,1
	jc LB_885
	mov rdi,r14
	call dlt
LB_885:
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
LB_886:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_888
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_887
LB_888:
	add rsp,8
	ret
LB_889:
	add rsp,32
	pop r14
LB_887:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_907
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_334 : %_334
 ; {>  %_126~1':_r64 %_127~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_334
 ; {>  %_334~°0◂{  }:(_opn)◂({ }) %_126~1':_r64 %_127~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_905
	mov rdi,r14
	call dlt
LB_905:
	bt r12,0
	jc LB_906
	mov rdi,r13
	call dlt
LB_906:
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
LB_907:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_909
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_908
LB_909:
	add rsp,8
	ret
LB_910:
	add rsp,0
	pop r14
LB_908:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_913:
; 	|» 0'
NS_E_RDI_913:
; _f56 %_911 ⊢ %_912 : %_912
 ; {>  %_911~0':_r64 }
	add r13,1
; _f913	%_912 ⊢|
 ; {>  %_912~0':_r64 }
; 	_f913 0' ⊢| 
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp NS_E_913
NS_E_921:
NS_E_RDI_921:
; » _^ ..
	xor rax,rax
	add rax,3
	add rax,4
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; "\\[\n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
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
	add rsp,0
; » 0xr0 |~ {  } ⊢ %_915 : %_915
 ; {>  %_914~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_915
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f258 { %_914 %_915 } ⊢ { %_916 %_917 %_918 } : { %_916 %_917 %_918 }
 ; {>  %_915~1':_r64 %_914~0':_stg }
; _f258 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_258
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_922
	btr r12,4
	jmp LB_923
LB_922:
	bts r12,4
LB_923:
	mov r8,r9
	bt r12,3
	jc LB_926
	btr r12,2
	jmp LB_927
LB_926:
	bts r12,2
LB_927:
	mov rsi,1
	bt r12,2
	jc LB_924
	mov rsi,0
	bt r8,0
	jc LB_924
	jmp LB_925
LB_924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_925:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_917 %_918 } ⊢ { %_919 %_920 } : { %_919 %_920 }
 ; {>  %_917~1':_r64 %_916~0':_stg %_918~2':(_opn)◂((_p197)◂({ })) }
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
	jc LB_932
	btr r12,3
	jmp LB_933
LB_932:
	bts r12,3
LB_933:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_930
	btr QWORD [rdi],0
	jmp LB_931
LB_930:
	bts QWORD [rdi],0
LB_931:
	mov r9,r8
	bt r12,2
	jc LB_936
	btr r12,3
	jmp LB_937
LB_936:
	bts r12,3
LB_937:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_934
	btr QWORD [rdi],1
	jmp LB_935
LB_934:
	bts QWORD [rdi],1
LB_935:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_940
	btr r12,3
	clc
	jmp LB_941
LB_940:
	bts r12,3
	stc
LB_941:
	mov r14,r9
	bt r12,3
	jc LB_938
	btr r12,1
	jmp LB_939
LB_938:
	bts r12,1
LB_939:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_944
	btr r12,3
	clc
	jmp LB_945
LB_944:
	bts r12,3
	stc
LB_945:
	mov r8,r9
	bt r12,3
	jc LB_942
	btr r12,2
	jmp LB_943
LB_942:
	bts r12,2
LB_943:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_928
	btr r12,0
	clc
	jmp LB_929
LB_928:
	bts r12,0
	stc
LB_929:
	add rsp,16
; ∎ {  }
 ; {>  %_919~1':_r64 %_920~2':(_opn)◂((_p197)◂({ })) %_916~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_946
	mov rdi,r14
	call dlt
LB_946:
	bt r12,2
	jc LB_947
	mov rdi,r8
	call dlt
LB_947:
	bt r12,0
	jc LB_948
	mov rdi,r13
	call dlt
LB_948:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	CST_DYN_921:
		dq 0x0000_0001_00_82_ffff
		dq 1
