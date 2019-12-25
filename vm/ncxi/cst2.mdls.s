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
	call NS_E_912
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
	jc LB_141
	bt QWORD [rdi],17
	jnc LB_141
	bt QWORD [rdi],0
	jc LB_143
	btr r12,2
	clc
	jmp LB_144
LB_143:
	bts r12,2
	stc
LB_144:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_142
LB_141:
	btr r12,2
	clc
	call dcp
LB_142:
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
	jc LB_137
	bt QWORD [rdi],17
	jnc LB_137
	bt QWORD [rdi],0
	jc LB_139
	btr r12,2
	clc
	jmp LB_140
LB_139:
	bts r12,2
	stc
LB_140:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_138
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
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
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
NS_E_151:
; 	|» { 0' 1' }
NS_E_RDI_151:
MTC_LB_152:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_153
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
	jnc LB_154
	bt QWORD [rdi],0
	jc LB_155
	btr r12,4
	clc
	jmp LB_156
LB_155:
	bts r12,4
	stc
LB_156:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_154:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_159
	btr r12,5
	clc
	jmp LB_160
LB_159:
	bts r12,5
	stc
LB_160:
	mov r8,r11
	bt r12,5
	jc LB_157
	btr r12,2
	jmp LB_158
LB_157:
	bts r12,2
LB_158:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_163
	btr r12,5
	clc
	jmp LB_164
LB_163:
	bts r12,5
	stc
LB_164:
	mov r9,r11
	bt r12,5
	jc LB_161
	btr r12,3
	jmp LB_162
LB_161:
	bts r12,3
LB_162:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_165:
	cmp r15,0
	jz LB_166
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_165
LB_166:
; _f151 { %_148 %_146 } ⊢ %_149 : %_149
 ; {>  %_148~3':(_lst)◂(t26'(-1)) %_147~2':t26'(-1) %_146~1':(_lst)◂(t26'(-1)) }
; _f151 { 3' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 3' 1' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,3
	jc LB_169
	btr r12,0
	jmp LB_170
LB_169:
	bts r12,0
LB_170:
	call NS_E_151
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_167
	btr r12,2
	clc
	jmp LB_168
LB_167:
	bts r12,2
	stc
LB_168:
	add rsp,16
; _cns { %_147 %_149 } ⊢ %_150 : %_150
 ; {>  %_149~0':(_lst)◂(t26'(-1)) %_147~2':t26'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; ∎ %_150
 ; {>  %_150~°0◂{ 2' 0' }:(_lst)◂(t26'(-1)) }
; 	∎ °0◂{ 2' 0' }
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_171
	btr r12,1
	jmp LB_172
LB_171:
	bts r12,1
LB_172:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_177
	btr r12,3
	jmp LB_178
LB_177:
	bts r12,3
LB_178:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_175
	btr QWORD [rdi],0
	jmp LB_176
LB_175:
	bts QWORD [rdi],0
LB_176:
	mov r9,r14
	bt r12,1
	jc LB_181
	btr r12,3
	jmp LB_182
LB_181:
	bts r12,3
LB_182:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_179
	btr QWORD [rdi],1
	jmp LB_180
LB_179:
	bts QWORD [rdi],1
LB_180:
	mov rsi,1
	bt r12,0
	jc LB_173
	mov rsi,0
	bt r13,0
	jc LB_173
	jmp LB_174
LB_173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_174:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_153:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_183
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
	jnc LB_184
	bt QWORD [rdi],0
	jc LB_185
	btr r12,2
	clc
	jmp LB_186
LB_185:
	bts r12,2
	stc
LB_186:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_184:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_187:
	cmp r15,0
	jz LB_188
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_187
LB_188:
; ∎ %_146
 ; {>  %_146~1':(_lst)◂(t26'(-1)) }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_189
	btr r12,0
	jmp LB_190
LB_189:
	bts r12,0
LB_190:
	ret
MTC_LB_183:
NS_E_206:
; 	|» 0'
NS_E_RDI_206:
MTC_LB_207:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_208
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
	jnc LB_209
	bt QWORD [rdi],0
	jc LB_210
	btr r12,5
	clc
	jmp LB_211
LB_210:
	bts r12,5
	stc
LB_211:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_209:
	mov r11,rdi
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_224
	btr r12,6
	clc
	jmp LB_225
LB_224:
	bts r12,6
	stc
LB_225:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_214
	btr r12,4
	clc
	jmp LB_215
LB_214:
	bts r12,4
	stc
LB_215:
	mov r14,r10
	bt r12,4
	jc LB_212
	btr r12,1
	jmp LB_213
LB_212:
	bts r12,1
LB_213:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_218
	btr r12,4
	clc
	jmp LB_219
LB_218:
	bts r12,4
	stc
LB_219:
	mov r8,r10
	bt r12,4
	jc LB_216
	btr r12,2
	jmp LB_217
LB_216:
	bts r12,2
LB_217:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_222
	btr r12,4
	clc
	jmp LB_223
LB_222:
	bts r12,4
	stc
LB_223:
	mov r9,r10
	bt r12,4
	jc LB_220
	btr r12,3
	jmp LB_221
LB_220:
	bts r12,3
LB_221:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_228
	btr r12,6
	clc
	jmp LB_229
LB_228:
	bts r12,6
	stc
LB_229:
	mov r10,rcx
	bt r12,6
	jc LB_226
	btr r12,4
	jmp LB_227
LB_226:
	bts r12,4
LB_227:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_230:
	cmp r15,0
	jz LB_231
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_230
LB_231:
; _f206 %_198 ⊢ %_199 : %_199
 ; {>  %_198~4':(_lst)◂({ _r64 _r64 _stg }) %_196~2':_r64 %_195~1':_r64 %_197~3':_stg }
; _f206 4' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_238
	btr r12,0
	jmp LB_239
LB_238:
	bts r12,0
LB_239:
	call NS_E_206
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_236
	btr r12,3
	clc
	jmp LB_237
LB_236:
	bts r12,3
	stc
LB_237:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_234
	btr r12,2
	clc
	jmp LB_235
LB_234:
	bts r12,2
	stc
LB_235:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_232
	btr r12,1
	clc
	jmp LB_233
LB_232:
	bts r12,1
	stc
LB_233:
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
; ∎ %_204
 ; {>  %_204~4':_stg %_202~3':_stg %_201~2':_r64 %_200~1':_r64 %_203~0':_stg }
; 	∎ 4'
	bt r12,3
	jc LB_240
	mov rdi,r9
	call dlt
LB_240:
	bt r12,2
	jc LB_241
	mov rdi,r8
	call dlt
LB_241:
	bt r12,1
	jc LB_242
	mov rdi,r14
	call dlt
LB_242:
	bt r12,0
	jc LB_243
	mov rdi,r13
	call dlt
LB_243:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_244
	btr r12,0
	jmp LB_245
LB_244:
	bts r12,0
LB_245:
	ret
MTC_LB_208:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_246
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
	jnc LB_247
	bt QWORD [rdi],0
	jc LB_248
	btr r12,1
	clc
	jmp LB_249
LB_248:
	bts r12,1
	stc
LB_249:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_247:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_250:
	cmp r15,0
	jz LB_251
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_250
LB_251:
; 	» "" _ ⊢ 0' : %_205
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_205
 ; {>  %_205~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_246:
NS_E_252:
NS_E_RDI_252:
NS_E_252_ETR_TBL:
NS_E_252_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_361
LB_360:
	add r14,1
LB_361:
	cmp r14,r10
	jge LB_362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_360
	cmp al,32
	jz LB_360
LB_362:
	add r14,1
	cmp r14,r10
	jg LB_365
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_365
	jmp LB_366
LB_365:
	jmp LB_355
LB_366:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; nls
	jmp LB_368
LB_367:
	add r14,1
LB_368:
	cmp r14,r10
	jge LB_369
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_367
	cmp al,32
	jz LB_367
LB_369:
	push r10
	call NS_E_252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_370
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_371:
	jmp LB_355
LB_370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_358
	btr r12,1
	clc
	jmp LB_359
LB_358:
	bts r12,1
	stc
LB_359:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_356
	btr r12,0
	clc
	jmp LB_357
LB_356:
	bts r12,0
	stc
LB_357:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_352
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_373
	btr r12,2
	jmp LB_374
LB_373:
	bts r12,2
LB_374:
	mov r13,r14
	bt r12,1
	jc LB_375
	btr r12,0
	jmp LB_376
LB_375:
	bts r12,0
LB_376:
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
; _f38 { %_69 %_68 } ⊢ %_256 : %_256
 ; {>  %_255~0':(_p191)◂({ }) %_68~2':_r64 %_69~1':_r64 }
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
	jc LB_333
	btr r12,3
	jmp LB_334
LB_333:
	bts r12,3
LB_334:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_331
	btr QWORD [rdi],0
	jmp LB_332
LB_331:
	bts QWORD [rdi],0
LB_332:
	mov r9,r8
	bt r12,2
	jc LB_337
	btr r12,3
	jmp LB_338
LB_337:
	bts r12,3
LB_338:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_335
	btr QWORD [rdi],1
	jmp LB_336
LB_335:
	bts QWORD [rdi],1
LB_336:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_341
	btr r12,3
	clc
	jmp LB_342
LB_341:
	bts r12,3
	stc
LB_342:
	mov r14,r9
	bt r12,3
	jc LB_339
	btr r12,1
	jmp LB_340
LB_339:
	bts r12,1
LB_340:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_345
	btr r12,3
	clc
	jmp LB_346
LB_345:
	bts r12,3
	stc
LB_346:
	mov r8,r9
	bt r12,3
	jc LB_343
	btr r12,2
	jmp LB_344
LB_343:
	bts r12,2
LB_344:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_329
	btr r12,0
	clc
	jmp LB_330
LB_329:
	bts r12,0
	stc
LB_330:
	add rsp,16
; _f192 {  } ⊢ %_257 : %_257
 ; {>  %_255~0':(_p191)◂({ }) %_256~{ 1' 2' }:{ _r64 _r64 } }
; _f192 {  } ⊢ °0◂{  }
; _some %_257 ⊢ %_258 : %_258
 ; {>  %_257~°0◂{  }:(_p191)◂({ }) %_255~0':(_p191)◂({ }) %_256~{ 1' 2' }:{ _r64 _r64 } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_258
 ; {>  %_255~0':(_p191)◂({ }) %_258~°0◂°0◂{  }:(_opn)◂((_p191)◂({ })) %_256~{ 1' 2' }:{ _r64 _r64 } }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_347
	mov rdi,r13
	call dlt
LB_347:
	bt r12,1
	jc LB_348
	mov rdi,r14
	call dlt
LB_348:
	bt r12,2
	jc LB_349
	mov rdi,r8
	call dlt
LB_349:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
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
LB_352:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_354
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_353
LB_354:
	add rsp,8
	ret
LB_355:
	add rsp,32
	pop r14
LB_353:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "##"
	jmp LB_390
LB_389:
	add r14,1
LB_390:
	cmp r14,r10
	jge LB_391
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_389
	cmp al,32
	jz LB_389
LB_391:
	add r14,2
	cmp r14,r10
	jg LB_394
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,35
	jnz LB_394
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,35
	jnz LB_394
	jmp LB_395
LB_394:
	jmp LB_384
LB_395:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_res
	jmp LB_397
LB_396:
	add r14,1
LB_397:
	cmp r14,r10
	jge LB_398
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_396
	cmp al,32
	jz LB_396
LB_398:
	push r10
	call NS_E_254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_399
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_400
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_400:
	jmp LB_384
LB_399:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_387
	btr r12,1
	clc
	jmp LB_388
LB_387:
	bts r12,1
	stc
LB_388:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_385
	btr r12,0
	clc
	jmp LB_386
LB_385:
	bts r12,0
	stc
LB_386:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_381
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
; _f192 {  } ⊢ %_260 : %_260
 ; {>  %_72~1':_r64 %_259~{  }:{ } %_73~0':_r64 }
; _f192 {  } ⊢ °0◂{  }
; _some %_260 ⊢ %_261 : %_261
 ; {>  %_72~1':_r64 %_259~{  }:{ } %_260~°0◂{  }:(_p191)◂({ }) %_73~0':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_261
 ; {>  %_72~1':_r64 %_261~°0◂°0◂{  }:(_opn)◂((_p191)◂({ })) %_259~{  }:{ } %_73~0':_r64 }
; 	∎ °0◂°0◂{  }
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
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
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
	mov rax,0x0000_0000_0000_0001
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
	add rsp,32
	pop r14
LB_382:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_578
LB_577:
	add r14,1
LB_578:
	cmp r14,r10
	jge LB_579
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_577
	cmp al,32
	jz LB_577
LB_579:
	add r14,2
	cmp r14,r10
	jg LB_582
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_582
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_582
	jmp LB_583
LB_582:
	jmp LB_570
LB_583:
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
	jmp LB_506
LB_505:
	add r14,1
LB_506:
	cmp r14,r10
	jge LB_507
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_505
	cmp al,32
	jz LB_505
LB_507:
	add r14,1
	cmp r14,r10
	jg LB_510
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_510
	jmp LB_511
LB_510:
	jmp LB_498
LB_511:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	jmp LB_513
LB_512:
	add r14,1
LB_513:
	cmp r14,r10
	jge LB_514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_512
	cmp al,32
	jz LB_512
LB_514:
	push r10
	call NS_E_253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_515
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_516
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_516:
	jmp LB_498
LB_515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
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
	call NS_E_252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_521
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_522
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_522:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_523:
	jmp LB_498
LB_521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_503
	btr r12,2
	clc
	jmp LB_504
LB_503:
	bts r12,2
	stc
LB_504:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_501
	btr r12,1
	clc
	jmp LB_502
LB_501:
	bts r12,1
	stc
LB_502:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_499
	btr r12,0
	clc
	jmp LB_500
LB_499:
	bts r12,0
	stc
LB_500:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_495
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_525
	btr r12,3
	jmp LB_526
LB_525:
	bts r12,3
LB_526:
	mov r14,r8
	bt r12,2
	jc LB_527
	btr r12,1
	jmp LB_528
LB_527:
	bts r12,1
LB_528:
	mov r8,r13
	bt r12,0
	jc LB_529
	btr r12,2
	jmp LB_530
LB_529:
	bts r12,2
LB_530:
	mov r13,r9
	bt r12,3
	jc LB_531
	btr r12,0
	jmp LB_532
LB_531:
	bts r12,0
LB_532:
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
; _f38 {  } ⊢ %_264 : %_264
 ; {>  %_263~1':(_p191)◂({ }) %_79~3':_r64 %_80~2':_r64 %_262~0':(_p191)◂({ }) }
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
	jc LB_410
	btr r12,3
	clc
	jmp LB_411
LB_410:
	bts r12,3
	stc
LB_411:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_408
	btr r12,2
	clc
	jmp LB_409
LB_408:
	bts r12,2
	stc
LB_409:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_406
	btr r12,1
	clc
	jmp LB_407
LB_406:
	bts r12,1
	stc
LB_407:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_404
	btr r12,0
	clc
	jmp LB_405
LB_404:
	bts r12,0
	stc
LB_405:
	add rsp,40
MTC_LB_412:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_413
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
	jnc LB_414
	bt QWORD [rdi],0
	jc LB_415
	btr r12,4
	clc
	jmp LB_416
LB_415:
	bts r12,4
	stc
LB_416:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_414:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_417:
	cmp r15,0
	jz LB_418
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_417
LB_418:
MTC_LB_419:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_420
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
	jnc LB_421
	bt QWORD [rdi],0
	jc LB_422
	btr r12,0
	clc
	jmp LB_423
LB_422:
	bts r12,0
	stc
LB_423:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_421:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_424:
	cmp r15,0
	jz LB_425
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_424
LB_425:
; _f192 {  } ⊢ %_267 : %_267
 ; {>  %_265~{  }:{ } %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_266~{  }:{ } }
; _f192 {  } ⊢ °0◂{  }
; _some %_267 ⊢ %_268 : %_268
 ; {>  %_265~{  }:{ } %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_267~°0◂{  }:(_p191)◂({ }) %_266~{  }:{ } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_268
 ; {>  %_265~{  }:{ } %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_268~°0◂°0◂{  }:(_opn)◂((_p191)◂({ })) %_266~{  }:{ } }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_426
	mov rdi,r9
	call dlt
LB_426:
	bt r12,2
	jc LB_427
	mov rdi,r8
	call dlt
LB_427:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_428
	mov rsi,0
	bt r9,0
	jc LB_428
	jmp LB_429
LB_428:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_429:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_420:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_430
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
	jnc LB_431
	bt QWORD [rdi],0
	jc LB_432
	btr r12,4
	clc
	jmp LB_433
LB_432:
	bts r12,4
	stc
LB_433:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_431:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_434
	btr r12,0
	jmp LB_435
LB_434:
	bts r12,0
LB_435:
LB_436:
	cmp r15,0
	jz LB_437
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_436
LB_437:
; _f206 %_269 ⊢ %_270 : %_270
 ; {>  %_265~{  }:{ } %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_269~0':(_lst)◂({ _r64 _r64 _stg }) }
; _f206 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_206
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_440
	btr r12,3
	clc
	jmp LB_441
LB_440:
	bts r12,3
	stc
LB_441:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_438
	btr r12,2
	clc
	jmp LB_439
LB_438:
	bts r12,2
	stc
LB_439:
	add rsp,24
; _f38 %_270 ⊢ %_271 : %_271
 ; {>  %_265~{  }:{ } %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_270~0':_stg }
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
	jc LB_444
	btr r12,3
	clc
	jmp LB_445
LB_444:
	bts r12,3
	stc
LB_445:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_442
	btr r12,2
	clc
	jmp LB_443
LB_442:
	bts r12,2
	stc
LB_443:
	add rsp,24
	jmp err
MTC_LB_430:
MTC_LB_413:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_446
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
	jnc LB_447
	bt QWORD [rdi],0
	jc LB_448
	btr r12,5
	clc
	jmp LB_449
LB_448:
	bts r12,5
	stc
LB_449:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_447:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_450
	btr r12,4
	jmp LB_451
LB_450:
	bts r12,4
LB_451:
LB_452:
	cmp r15,0
	jz LB_453
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_452
LB_453:
MTC_LB_454:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_455
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
	jnc LB_456
	bt QWORD [rdi],0
	jc LB_457
	btr r12,0
	clc
	jmp LB_458
LB_457:
	bts r12,0
	stc
LB_458:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_456:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_459:
	cmp r15,0
	jz LB_460
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_459
LB_460:
; _f206 %_272 ⊢ %_274 : %_274
 ; {>  %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_273~{  }:{ } %_272~4':(_lst)◂({ _r64 _r64 _stg }) }
; _f206 4' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_465
	btr r12,0
	jmp LB_466
LB_465:
	bts r12,0
LB_466:
	call NS_E_206
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_463
	btr r12,3
	clc
	jmp LB_464
LB_463:
	bts r12,3
	stc
LB_464:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_461
	btr r12,2
	clc
	jmp LB_462
LB_461:
	bts r12,2
	stc
LB_462:
	add rsp,24
; _f38 %_274 ⊢ %_275 : %_275
 ; {>  %_274~0':_stg %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_273~{  }:{ } }
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
	jmp err
MTC_LB_455:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_471
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
	jnc LB_472
	bt QWORD [rdi],0
	jc LB_473
	btr r12,5
	clc
	jmp LB_474
LB_473:
	bts r12,5
	stc
LB_474:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_472:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_475
	btr r12,0
	jmp LB_476
LB_475:
	bts r12,0
LB_476:
LB_477:
	cmp r15,0
	jz LB_478
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_477
LB_478:
; _f151 { %_272 %_276 } ⊢ %_277 : %_277
 ; {>  %_276~0':(_lst)◂({ _r64 _r64 _stg }) %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_272~4':(_lst)◂({ _r64 _r64 _stg }) }
; _f151 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_483
	btr r12,1
	jmp LB_484
LB_483:
	bts r12,1
LB_484:
	mov r13,r10
	bt r12,4
	jc LB_485
	btr r12,0
	jmp LB_486
LB_485:
	bts r12,0
LB_486:
	call NS_E_151
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_481
	btr r12,3
	clc
	jmp LB_482
LB_481:
	bts r12,3
	stc
LB_482:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_479
	btr r12,2
	clc
	jmp LB_480
LB_479:
	bts r12,2
	stc
LB_480:
	add rsp,24
; _f206 %_277 ⊢ %_278 : %_278
 ; {>  %_79~3':_r64 %_80~2':_r64 %_277~0':(_lst)◂({ _r64 _r64 _stg }) %_264~{  }:{ } }
; _f206 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_206
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_489
	btr r12,3
	clc
	jmp LB_490
LB_489:
	bts r12,3
	stc
LB_490:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_487
	btr r12,2
	clc
	jmp LB_488
LB_487:
	bts r12,2
	stc
LB_488:
	add rsp,24
; _f38 %_278 ⊢ %_279 : %_279
 ; {>  %_79~3':_r64 %_80~2':_r64 %_264~{  }:{ } %_278~0':_stg }
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
	jc LB_493
	btr r12,3
	clc
	jmp LB_494
LB_493:
	bts r12,3
	stc
LB_494:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_491
	btr r12,2
	clc
	jmp LB_492
LB_491:
	bts r12,2
	stc
LB_492:
	add rsp,24
	jmp err
MTC_LB_471:
MTC_LB_446:
LB_495:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_497
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_496
LB_497:
	add rsp,8
	jmp LB_402
LB_498:
	add rsp,48
	pop r14
LB_496:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_541
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
; _f38 %_282 ⊢ %_283 : %_283
 ; {>  %_280~0':_r64 %_282~2':_stg %_281~1':_r64 }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_537
	btr r12,0
	jmp LB_538
LB_537:
	bts r12,0
LB_538:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_539
	btr r12,2
	jmp LB_540
LB_539:
	bts r12,2
LB_540:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_535
	btr r12,1
	clc
	jmp LB_536
LB_535:
	bts r12,1
	stc
LB_536:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_533
	btr r12,0
	clc
	jmp LB_534
LB_533:
	bts r12,0
	stc
LB_534:
	add rsp,24
	jmp err
LB_541:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_543
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_542
LB_543:
	add rsp,8
	jmp LB_402
LB_544:
	add rsp,0
	pop r14
LB_542:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_402
LB_402:
	pop r10
	cmp r8,0
	jz LB_403
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_575:
	jmp LB_570
LB_403:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_573
	btr r12,1
	clc
	jmp LB_574
LB_573:
	bts r12,1
	stc
LB_574:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_571
	btr r12,0
	clc
	jmp LB_572
LB_571:
	bts r12,0
	stc
LB_572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_567
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_584
	btr r12,2
	jmp LB_585
LB_584:
	bts r12,2
LB_585:
	mov r13,r14
	bt r12,1
	jc LB_586
	btr r12,0
	jmp LB_587
LB_586:
	bts r12,0
LB_587:
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
; _f38 { %_88 %_87 } ⊢ %_285 : %_285
 ; {>  %_284~0':(_p191)◂({ }) %_87~2':_r64 %_88~1':_r64 }
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
	jc LB_549
	btr r12,3
	jmp LB_550
LB_549:
	bts r12,3
LB_550:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_547
	btr QWORD [rdi],0
	jmp LB_548
LB_547:
	bts QWORD [rdi],0
LB_548:
	mov r9,r8
	bt r12,2
	jc LB_553
	btr r12,3
	jmp LB_554
LB_553:
	bts r12,3
LB_554:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_551
	btr QWORD [rdi],1
	jmp LB_552
LB_551:
	bts QWORD [rdi],1
LB_552:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_557
	btr r12,3
	clc
	jmp LB_558
LB_557:
	bts r12,3
	stc
LB_558:
	mov r14,r9
	bt r12,3
	jc LB_555
	btr r12,1
	jmp LB_556
LB_555:
	bts r12,1
LB_556:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_561
	btr r12,3
	clc
	jmp LB_562
LB_561:
	bts r12,3
	stc
LB_562:
	mov r8,r9
	bt r12,3
	jc LB_559
	btr r12,2
	jmp LB_560
LB_559:
	bts r12,2
LB_560:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_545
	btr r12,0
	clc
	jmp LB_546
LB_545:
	bts r12,0
	stc
LB_546:
	add rsp,16
; _some %_284 ⊢ %_286 : %_286
 ; {>  %_285~{ 1' 2' }:{ _r64 _r64 } %_284~0':(_p191)◂({ }) }
; _some 0' ⊢ °0◂0'
; ∎ %_286
 ; {>  %_285~{ 1' 2' }:{ _r64 _r64 } %_286~°0◂0':(_opn)◂((_p191)◂({ })) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_563
	mov rdi,r14
	call dlt
LB_563:
	bt r12,2
	jc LB_564
	mov rdi,r8
	call dlt
LB_564:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_565
	btr r12,3
	jmp LB_566
LB_565:
	bts r12,3
LB_566:
	mov r8,0
	bts r12,2
	ret
LB_567:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_569
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_568
LB_569:
	add rsp,8
	ret
LB_570:
	add rsp,16
	pop r14
LB_568:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_592
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f192 {  } ⊢ %_287 : %_287
 ; {>  %_92~0':_r64 %_91~1':_r64 }
; _f192 {  } ⊢ °0◂{  }
; _some %_287 ⊢ %_288 : %_288
 ; {>  %_287~°0◂{  }:(_p191)◂({ }) %_92~0':_r64 %_91~1':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_288
 ; {>  %_288~°0◂°0◂{  }:(_opn)◂((_p191)◂({ })) %_92~0':_r64 %_91~1':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_588
	mov rdi,r13
	call dlt
LB_588:
	bt r12,1
	jc LB_589
	mov rdi,r14
	call dlt
LB_589:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_590
	mov rsi,0
	bt r9,0
	jc LB_590
	jmp LB_591
LB_590:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_591:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_592:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_594
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_593
LB_594:
	add rsp,8
	ret
LB_595:
	add rsp,0
	pop r14
LB_593:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_253:
NS_E_RDI_253:
NS_E_253_ETR_TBL:
NS_E_253_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_752
LB_751:
	add r14,1
LB_752:
	cmp r14,r10
	jge LB_753
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_751
	cmp al,32
	jz LB_751
LB_753:
	add r14,2
	cmp r14,r10
	jg LB_756
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_756
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_756
	jmp LB_757
LB_756:
	jmp LB_744
LB_757:
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
	jmp LB_684
LB_683:
	add r14,1
LB_684:
	cmp r14,r10
	jge LB_685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_683
	cmp al,32
	jz LB_683
LB_685:
	add r14,1
	cmp r14,r10
	jg LB_688
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_688
	jmp LB_689
LB_688:
	jmp LB_676
LB_689:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	jmp LB_691
LB_690:
	add r14,1
LB_691:
	cmp r14,r10
	jge LB_692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_690
	cmp al,32
	jz LB_690
LB_692:
	push r10
	call NS_E_253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_693
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_694
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_694:
	jmp LB_676
LB_693:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
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
	call NS_E_253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_699
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_700
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_700:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_701
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_701:
	jmp LB_676
LB_699:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_681
	btr r12,2
	clc
	jmp LB_682
LB_681:
	bts r12,2
	stc
LB_682:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_679
	btr r12,1
	clc
	jmp LB_680
LB_679:
	bts r12,1
	stc
LB_680:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_677
	btr r12,0
	clc
	jmp LB_678
LB_677:
	bts r12,0
	stc
LB_678:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_673
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_703
	btr r12,3
	jmp LB_704
LB_703:
	bts r12,3
LB_704:
	mov r14,r8
	bt r12,2
	jc LB_705
	btr r12,1
	jmp LB_706
LB_705:
	bts r12,1
LB_706:
	mov r8,r13
	bt r12,0
	jc LB_707
	btr r12,2
	jmp LB_708
LB_707:
	bts r12,2
LB_708:
	mov r13,r9
	bt r12,3
	jc LB_709
	btr r12,0
	jmp LB_710
LB_709:
	bts r12,0
LB_710:
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
MTC_LB_598:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_599
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
	jnc LB_600
	bt QWORD [rdi],0
	jc LB_601
	btr r12,4
	clc
	jmp LB_602
LB_601:
	bts r12,4
	stc
LB_602:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_600:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_603:
	cmp r15,0
	jz LB_604
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_603
LB_604:
MTC_LB_605:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_606
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
	jnc LB_607
	bt QWORD [rdi],0
	jc LB_608
	btr r12,0
	clc
	jmp LB_609
LB_608:
	bts r12,0
	stc
LB_609:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_607:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_610:
	cmp r15,0
	jz LB_611
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_610
LB_611:
; _f192 {  } ⊢ %_293 : %_293
 ; {>  %_291~{  }:{ } %_292~{  }:{ } %_95~3':_r64 %_96~2':_r64 }
; _f192 {  } ⊢ °0◂{  }
; _some %_293 ⊢ %_294 : %_294
 ; {>  %_291~{  }:{ } %_292~{  }:{ } %_293~°0◂{  }:(_p191)◂({ }) %_95~3':_r64 %_96~2':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_294
 ; {>  %_291~{  }:{ } %_292~{  }:{ } %_95~3':_r64 %_96~2':_r64 %_294~°0◂°0◂{  }:(_opn)◂((_p191)◂({ })) }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_612
	mov rdi,r9
	call dlt
LB_612:
	bt r12,2
	jc LB_613
	mov rdi,r8
	call dlt
LB_613:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_614
	mov rsi,0
	bt r9,0
	jc LB_614
	jmp LB_615
LB_614:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_615:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_606:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_616
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
	jnc LB_617
	bt QWORD [rdi],0
	jc LB_618
	btr r12,4
	clc
	jmp LB_619
LB_618:
	bts r12,4
	stc
LB_619:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_617:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_620
	btr r12,0
	jmp LB_621
LB_620:
	bts r12,0
LB_621:
LB_622:
	cmp r15,0
	jz LB_623
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_622
LB_623:
; _f193 %_295 ⊢ %_296 : %_296
 ; {>  %_291~{  }:{ } %_295~0':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_96~2':_r64 }
; _f193 0' ⊢ °1◂0'
; _some %_296 ⊢ %_297 : %_297
 ; {>  %_291~{  }:{ } %_95~3':_r64 %_96~2':_r64 %_296~°1◂0':(_p191)◂(t163'(1)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_297
 ; {>  %_297~°0◂°1◂0':(_opn)◂((_p191)◂(t166'(1))) %_291~{  }:{ } %_95~3':_r64 %_96~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,3
	jc LB_624
	mov rdi,r9
	call dlt
LB_624:
	bt r12,2
	jc LB_625
	mov rdi,r8
	call dlt
LB_625:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_628
	btr r12,3
	jmp LB_629
LB_628:
	bts r12,3
LB_629:
	mov rsi,1
	bt r12,3
	jc LB_626
	mov rsi,0
	bt r9,0
	jc LB_626
	jmp LB_627
LB_626:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_627:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_616:
MTC_LB_599:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_630
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
	jnc LB_631
	bt QWORD [rdi],0
	jc LB_632
	btr r12,5
	clc
	jmp LB_633
LB_632:
	bts r12,5
	stc
LB_633:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_631:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_634
	btr r12,4
	jmp LB_635
LB_634:
	bts r12,4
LB_635:
LB_636:
	cmp r15,0
	jz LB_637
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_636
LB_637:
MTC_LB_638:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_639
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
	jnc LB_640
	bt QWORD [rdi],0
	jc LB_641
	btr r12,0
	clc
	jmp LB_642
LB_641:
	bts r12,0
	stc
LB_642:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_640:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_643:
	cmp r15,0
	jz LB_644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_643
LB_644:
; _f193 %_298 ⊢ %_300 : %_300
 ; {>  %_299~{  }:{ } %_298~4':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_96~2':_r64 }
; _f193 4' ⊢ °1◂4'
; _some %_300 ⊢ %_301 : %_301
 ; {>  %_299~{  }:{ } %_300~°1◂4':(_p191)◂(t177'(1)) %_95~3':_r64 %_96~2':_r64 }
; _some °1◂4' ⊢ °0◂°1◂4'
; ∎ %_301
 ; {>  %_299~{  }:{ } %_301~°0◂°1◂4':(_opn)◂((_p191)◂(t180'(1))) %_95~3':_r64 %_96~2':_r64 }
; 	∎ °0◂°1◂4'
	bt r12,3
	jc LB_645
	mov rdi,r9
	call dlt
LB_645:
	bt r12,2
	jc LB_646
	mov rdi,r8
	call dlt
LB_646:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°1◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_649
	btr r12,3
	jmp LB_650
LB_649:
	bts r12,3
LB_650:
	mov rsi,1
	bt r12,3
	jc LB_647
	mov rsi,0
	bt r9,0
	jc LB_647
	jmp LB_648
LB_647:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_648:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_639:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_651
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
	jnc LB_652
	bt QWORD [rdi],0
	jc LB_653
	btr r12,5
	clc
	jmp LB_654
LB_653:
	bts r12,5
	stc
LB_654:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_652:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_655
	btr r12,0
	jmp LB_656
LB_655:
	bts r12,0
LB_656:
LB_657:
	cmp r15,0
	jz LB_658
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_657
LB_658:
; _f151 { %_298 %_302 } ⊢ %_303 : %_303
 ; {>  %_298~4':(_lst)◂({ _r64 _r64 _stg }) %_95~3':_r64 %_96~2':_r64 %_302~0':(_lst)◂({ _r64 _r64 _stg }) }
; _f151 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_663
	btr r12,1
	jmp LB_664
LB_663:
	bts r12,1
LB_664:
	mov r13,r10
	bt r12,4
	jc LB_665
	btr r12,0
	jmp LB_666
LB_665:
	bts r12,0
LB_666:
	call NS_E_151
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_661
	btr r12,3
	clc
	jmp LB_662
LB_661:
	bts r12,3
	stc
LB_662:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_659
	btr r12,2
	clc
	jmp LB_660
LB_659:
	bts r12,2
	stc
LB_660:
	add rsp,24
; _f193 %_303 ⊢ %_304 : %_304
 ; {>  %_95~3':_r64 %_303~0':(_lst)◂({ _r64 _r64 _stg }) %_96~2':_r64 }
; _f193 0' ⊢ °1◂0'
; _some %_304 ⊢ %_305 : %_305
 ; {>  %_304~°1◂0':(_p191)◂(t185'(1)) %_95~3':_r64 %_96~2':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_305
 ; {>  %_95~3':_r64 %_305~°0◂°1◂0':(_opn)◂((_p191)◂(t188'(1))) %_96~2':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,3
	jc LB_667
	mov rdi,r9
	call dlt
LB_667:
	bt r12,2
	jc LB_668
	mov rdi,r8
	call dlt
LB_668:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_671
	btr r12,3
	jmp LB_672
LB_671:
	bts r12,3
LB_672:
	mov rsi,1
	bt r12,3
	jc LB_669
	mov rsi,0
	bt r9,0
	jc LB_669
	jmp LB_670
LB_669:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_670:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_651:
MTC_LB_630:
LB_673:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_675
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_674
LB_675:
	add rsp,8
	jmp LB_596
LB_676:
	add rsp,48
	pop r14
LB_674:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_733
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_306 : %_306
 ; {>  %_100~0':_r64 %_99~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 0" _ ⊢ 2' : %_307
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_100 %_99 %_307 } %_306 } ⊢ %_308 : %_308
 ; {>  %_307~2':_stg %_100~0':_r64 %_99~1':_r64 %_306~°1◂{  }:(_lst)◂(t196'(1)) }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f193 %_308 ⊢ %_309 : %_309
 ; {>  %_308~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f193 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_309 ⊢ %_310 : %_310
 ; {>  %_309~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p191)◂(t202'(1)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_310
 ; {>  %_310~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p191)◂(t205'(1))) }
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
	jc LB_719
	btr r12,5
	jmp LB_720
LB_719:
	bts r12,5
LB_720:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_717
	btr QWORD [rdi],0
	jmp LB_718
LB_717:
	bts QWORD [rdi],0
LB_718:
	mov r11,r14
	bt r12,1
	jc LB_723
	btr r12,5
	jmp LB_724
LB_723:
	bts r12,5
LB_724:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_721
	btr QWORD [rdi],1
	jmp LB_722
LB_721:
	bts QWORD [rdi],1
LB_722:
	mov r11,r8
	bt r12,2
	jc LB_727
	btr r12,5
	jmp LB_728
LB_727:
	bts r12,5
LB_728:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_725
	btr QWORD [rdi],2
	jmp LB_726
LB_725:
	bts QWORD [rdi],2
LB_726:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_715
	btr QWORD [rdi],0
	jmp LB_716
LB_715:
	bts QWORD [rdi],0
LB_716:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_731
	mov rsi,0
	bt r10,0
	jc LB_731
	jmp LB_732
LB_731:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_732:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_729
	btr QWORD [rdi],1
	jmp LB_730
LB_729:
	bts QWORD [rdi],1
LB_730:
	mov rsi,1
	bt r12,3
	jc LB_713
	mov rsi,0
	bt r9,0
	jc LB_713
	jmp LB_714
LB_713:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_714:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_711
	mov rsi,0
	bt r9,0
	jc LB_711
	jmp LB_712
LB_711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_712:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_733:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_735
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_734
LB_735:
	add rsp,8
	jmp LB_596
LB_736:
	add rsp,0
	pop r14
LB_734:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_596
LB_596:
	pop r10
	cmp r8,0
	jz LB_597
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_749
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_749:
	jmp LB_744
LB_597:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_747
	btr r12,1
	clc
	jmp LB_748
LB_747:
	bts r12,1
	stc
LB_748:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_745
	btr r12,0
	clc
	jmp LB_746
LB_745:
	bts r12,0
	stc
LB_746:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_741
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_758
	btr r12,2
	jmp LB_759
LB_758:
	bts r12,2
LB_759:
	mov r13,r14
	bt r12,1
	jc LB_760
	btr r12,0
	jmp LB_761
LB_760:
	bts r12,0
LB_761:
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
; _some %_311 ⊢ %_312 : %_312
 ; {>  %_311~0':(_p191)◂({ }) %_103~1':_r64 %_102~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_312
 ; {>  %_103~1':_r64 %_312~°0◂0':(_opn)◂((_p191)◂({ })) %_102~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_737
	mov rdi,r14
	call dlt
LB_737:
	bt r12,2
	jc LB_738
	mov rdi,r8
	call dlt
LB_738:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_739
	btr r12,3
	jmp LB_740
LB_739:
	bts r12,3
LB_740:
	mov r8,0
	bts r12,2
	ret
LB_741:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_743
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_742
LB_743:
	add rsp,8
	ret
LB_744:
	add rsp,16
	pop r14
LB_742:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\\]"
	jmp LB_795
LB_794:
	add r14,1
LB_795:
	cmp r14,r10
	jge LB_796
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_794
	cmp al,32
	jz LB_794
LB_796:
	add r14,2
	cmp r14,r10
	jg LB_799
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_799
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,93
	jnz LB_799
	jmp LB_800
LB_799:
	jmp LB_789
LB_800:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_802
LB_801:
	add r14,1
LB_802:
	cmp r14,r10
	jge LB_803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_801
	cmp al,32
	jz LB_801
LB_803:
	add r14,1
	cmp r14,r10
	jg LB_807
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_807
	jmp LB_808
LB_807:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_805
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_805:
	jmp LB_789
LB_808:
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
	jc LB_792
	btr r12,1
	clc
	jmp LB_793
LB_792:
	bts r12,1
	stc
LB_793:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_790
	btr r12,0
	clc
	jmp LB_791
LB_790:
	bts r12,0
	stc
LB_791:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_786
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
; _f38 { %_107 %_106 } ⊢ %_313 : %_313
 ; {>  %_107~0':_r64 %_106~1':_r64 }
; _f38 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_762
	btr r12,2
	jmp LB_763
LB_762:
	bts r12,2
LB_763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_766
	btr r12,3
	jmp LB_767
LB_766:
	bts r12,3
LB_767:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_764
	btr QWORD [rdi],0
	jmp LB_765
LB_764:
	bts QWORD [rdi],0
LB_765:
	mov r9,r14
	bt r12,1
	jc LB_770
	btr r12,3
	jmp LB_771
LB_770:
	bts r12,3
LB_771:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_768
	btr QWORD [rdi],1
	jmp LB_769
LB_768:
	bts QWORD [rdi],1
LB_769:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_772
	btr r12,2
	jmp LB_773
LB_772:
	bts r12,2
LB_773:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_776
	btr r12,3
	clc
	jmp LB_777
LB_776:
	bts r12,3
	stc
LB_777:
	mov r13,r9
	bt r12,3
	jc LB_774
	btr r12,0
	jmp LB_775
LB_774:
	bts r12,0
LB_775:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_780
	btr r12,3
	clc
	jmp LB_781
LB_780:
	bts r12,3
	stc
LB_781:
	mov r14,r9
	bt r12,3
	jc LB_778
	btr r12,1
	jmp LB_779
LB_778:
	bts r12,1
LB_779:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f192 {  } ⊢ %_314 : %_314
 ; {>  %_313~{ 0' 1' }:{ _r64 _r64 } }
; _f192 {  } ⊢ °0◂{  }
; _some %_314 ⊢ %_315 : %_315
 ; {>  %_314~°0◂{  }:(_p191)◂({ }) %_313~{ 0' 1' }:{ _r64 _r64 } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_315
 ; {>  %_315~°0◂°0◂{  }:(_opn)◂((_p191)◂({ })) %_313~{ 0' 1' }:{ _r64 _r64 } }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_782
	mov rdi,r13
	call dlt
LB_782:
	bt r12,1
	jc LB_783
	mov rdi,r14
	call dlt
LB_783:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_784
	mov rsi,0
	bt r9,0
	jc LB_784
	jmp LB_785
LB_784:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_785:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_786:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_788
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_787
LB_788:
	add rsp,8
	ret
LB_789:
	add rsp,32
	pop r14
LB_787:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line_res
	jmp LB_822
LB_821:
	add r14,1
LB_822:
	cmp r14,r10
	jge LB_823
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_821
	cmp al,32
	jz LB_821
LB_823:
	push r10
	call NS_E_254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_824
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_816
LB_824:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	jmp LB_827
LB_826:
	add r14,1
LB_827:
	cmp r14,r10
	jge LB_828
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_826
	cmp al,32
	jz LB_826
LB_828:
	push r10
	call NS_E_253_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_829
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_830
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_830:
	jmp LB_816
LB_829:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_819
	btr r12,1
	clc
	jmp LB_820
LB_819:
	bts r12,1
	stc
LB_820:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_817
	btr r12,0
	clc
	jmp LB_818
LB_817:
	bts r12,0
	stc
LB_818:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_813
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_832
	btr r12,2
	jmp LB_833
LB_832:
	bts r12,2
LB_833:
	mov r13,r14
	bt r12,1
	jc LB_834
	btr r12,0
	jmp LB_835
LB_834:
	bts r12,0
LB_835:
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
 ; {>  %_317~0':(_p191)◂({ }) %_110~2':_r64 %_316~{  }:{ } %_111~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_318
 ; {>  %_110~2':_r64 %_318~°0◂0':(_opn)◂((_p191)◂({ })) %_316~{  }:{ } %_111~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_809
	mov rdi,r8
	call dlt
LB_809:
	bt r12,1
	jc LB_810
	mov rdi,r14
	call dlt
LB_810:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_811
	btr r12,3
	jmp LB_812
LB_811:
	bts r12,3
LB_812:
	mov r8,0
	bts r12,2
	ret
LB_813:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_815
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_814
LB_815:
	add rsp,8
	ret
LB_816:
	add rsp,32
	pop r14
LB_814:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_858
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_319 : %_319
 ; {>  %_115~0':_r64 %_114~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 1" _ ⊢ 2' : %_320
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_115 %_114 %_320 } %_319 } ⊢ %_321 : %_321
 ; {>  %_320~2':_stg %_115~0':_r64 %_114~1':_r64 %_319~°1◂{  }:(_lst)◂(t222'(0)) }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f193 %_321 ⊢ %_322 : %_322
 ; {>  %_321~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f193 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_322 ⊢ %_323 : %_323
 ; {>  %_322~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p191)◂(t228'(0)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_323
 ; {>  %_323~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p191)◂(t231'(0))) }
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
	jc LB_844
	btr r12,5
	jmp LB_845
LB_844:
	bts r12,5
LB_845:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_842
	btr QWORD [rdi],0
	jmp LB_843
LB_842:
	bts QWORD [rdi],0
LB_843:
	mov r11,r14
	bt r12,1
	jc LB_848
	btr r12,5
	jmp LB_849
LB_848:
	bts r12,5
LB_849:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_846
	btr QWORD [rdi],1
	jmp LB_847
LB_846:
	bts QWORD [rdi],1
LB_847:
	mov r11,r8
	bt r12,2
	jc LB_852
	btr r12,5
	jmp LB_853
LB_852:
	bts r12,5
LB_853:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_850
	btr QWORD [rdi],2
	jmp LB_851
LB_850:
	bts QWORD [rdi],2
LB_851:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_840
	btr QWORD [rdi],0
	jmp LB_841
LB_840:
	bts QWORD [rdi],0
LB_841:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_856
	mov rsi,0
	bt r10,0
	jc LB_856
	jmp LB_857
LB_856:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_857:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_854
	btr QWORD [rdi],1
	jmp LB_855
LB_854:
	bts QWORD [rdi],1
LB_855:
	mov rsi,1
	bt r12,3
	jc LB_838
	mov rsi,0
	bt r9,0
	jc LB_838
	jmp LB_839
LB_838:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_839:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_836
	mov rsi,0
	bt r9,0
	jc LB_836
	jmp LB_837
LB_836:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_837:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_858:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_860
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_859
LB_860:
	add rsp,8
	ret
LB_861:
	add rsp,0
	pop r14
LB_859:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_254:
NS_E_RDI_254:
NS_E_254_ETR_TBL:
NS_E_254_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	jmp LB_871
LB_870:
	add r14,1
LB_871:
	cmp r14,r10
	jge LB_872
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_870
	cmp al,32
	jz LB_870
LB_872:
	add r14,1
	cmp r14,r10
	jg LB_875
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_875
	jmp LB_876
LB_875:
	jmp LB_867
LB_876:
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
	jc LB_868
	btr r12,0
	clc
	jmp LB_869
LB_868:
	bts r12,0
	stc
LB_869:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_864
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
; _some {  } ⊢ %_324 : %_324
 ; {>  %_118~1':_r64 %_119~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_324
 ; {>  %_118~1':_r64 %_324~°0◂{  }:(_opn)◂({ }) %_119~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_862
	mov rdi,r14
	call dlt
LB_862:
	bt r12,0
	jc LB_863
	mov rdi,r13
	call dlt
LB_863:
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
	add rsp,16
	pop r14
LB_865:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_889
LB_888:
	add r14,1
LB_889:
	cmp r14,r10
	jge LB_890
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_888
	cmp al,32
	jz LB_888
LB_890:
	push r10
	call NS_E_129_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_891
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_883
LB_891:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_res
	jmp LB_894
LB_893:
	add r14,1
LB_894:
	cmp r14,r10
	jge LB_895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_893
	cmp al,32
	jz LB_893
LB_895:
	push r10
	call NS_E_254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_896
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_897
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_897:
	jmp LB_883
LB_896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_886
	btr r12,1
	clc
	jmp LB_887
LB_886:
	bts r12,1
	stc
LB_887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_884
	btr r12,0
	clc
	jmp LB_885
LB_884:
	bts r12,0
	stc
LB_885:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_880
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
; _some {  } ⊢ %_327 : %_327
 ; {>  %_122~2':_r64 %_326~{  }:{ } %_325~0':_r64 %_123~1':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_327
 ; {>  %_122~2':_r64 %_326~{  }:{ } %_327~°0◂{  }:(_opn)◂({ }) %_325~0':_r64 %_123~1':_r64 }
; 	∎ °0◂{  }
	bt r12,2
	jc LB_877
	mov rdi,r8
	call dlt
LB_877:
	bt r12,0
	jc LB_878
	mov rdi,r13
	call dlt
LB_878:
	bt r12,1
	jc LB_879
	mov rdi,r14
	call dlt
LB_879:
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
LB_880:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_882
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_881
LB_882:
	add rsp,8
	ret
LB_883:
	add rsp,32
	pop r14
LB_881:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_901
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_328 : %_328
 ; {>  %_126~1':_r64 %_127~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_328
 ; {>  %_328~°0◂{  }:(_opn)◂({ }) %_126~1':_r64 %_127~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_899
	mov rdi,r14
	call dlt
LB_899:
	bt r12,0
	jc LB_900
	mov rdi,r13
	call dlt
LB_900:
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
LB_901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_903
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_902
LB_903:
	add rsp,8
	ret
LB_904:
	add rsp,0
	pop r14
LB_902:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_912:
NS_E_RDI_912:
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
; » 0xr0 |~ {  } ⊢ %_906 : %_906
 ; {>  %_905~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_906
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f252 { %_905 %_906 } ⊢ { %_907 %_908 %_909 } : { %_907 %_908 %_909 }
 ; {>  %_905~0':_stg %_906~1':_r64 }
; _f252 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_252
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_913
	btr r12,4
	jmp LB_914
LB_913:
	bts r12,4
LB_914:
	mov r8,r9
	bt r12,3
	jc LB_917
	btr r12,2
	jmp LB_918
LB_917:
	bts r12,2
LB_918:
	mov rsi,1
	bt r12,2
	jc LB_915
	mov rsi,0
	bt r8,0
	jc LB_915
	jmp LB_916
LB_915:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_916:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_908 %_909 } ⊢ { %_910 %_911 } : { %_910 %_911 }
 ; {>  %_907~0':_stg %_909~2':(_opn)◂((_p191)◂({ })) %_908~1':_r64 }
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
	jc LB_923
	btr r12,3
	jmp LB_924
LB_923:
	bts r12,3
LB_924:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_921
	btr QWORD [rdi],0
	jmp LB_922
LB_921:
	bts QWORD [rdi],0
LB_922:
	mov r9,r8
	bt r12,2
	jc LB_927
	btr r12,3
	jmp LB_928
LB_927:
	bts r12,3
LB_928:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_925
	btr QWORD [rdi],1
	jmp LB_926
LB_925:
	bts QWORD [rdi],1
LB_926:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_931
	btr r12,3
	clc
	jmp LB_932
LB_931:
	bts r12,3
	stc
LB_932:
	mov r14,r9
	bt r12,3
	jc LB_929
	btr r12,1
	jmp LB_930
LB_929:
	bts r12,1
LB_930:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_935
	btr r12,3
	clc
	jmp LB_936
LB_935:
	bts r12,3
	stc
LB_936:
	mov r8,r9
	bt r12,3
	jc LB_933
	btr r12,2
	jmp LB_934
LB_933:
	bts r12,2
LB_934:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_919
	btr r12,0
	clc
	jmp LB_920
LB_919:
	bts r12,0
	stc
LB_920:
	add rsp,16
; ∎ {  }
 ; {>  %_910~1':_r64 %_907~0':_stg %_911~2':(_opn)◂((_p191)◂({ })) }
; 	∎ {  }
	bt r12,1
	jc LB_937
	mov rdi,r14
	call dlt
LB_937:
	bt r12,0
	jc LB_938
	mov rdi,r13
	call dlt
LB_938:
	bt r12,2
	jc LB_939
	mov rdi,r8
	call dlt
LB_939:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	CST_DYN_912:
		dq 0x0000_0001_00_82_ffff
		dq 1
