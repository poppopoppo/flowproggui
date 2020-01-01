%include "cmu.s"
%define MOV_OFS_0 0
%define MOV_OFS_1 17
%define MOV_OFS_2 0
%define MOV_OFS_3 0
%define MOV_OFS_4 0
%define MOV_OFS_5 0
%define MOV_OFS_6 0
%define MOV_OFS_7 0
%define MOV_OFS_8 0
%define MOV_OFS_9 0
%define MOV_OFS_10 0
%define MOV_OFS_11 0
%define MOV_OFS_12 0
%define MOV_OFS_13 0
%define MOV_OFS_14 0
%define MOV_OFS_15 0
%define MOV_OFS_16 0
%define MOV_OFS_17 35
main:
	mov r12,~0
	call SFLS_X_INIT
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
	mov r8,rax
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
 mov r13,rax
    or rax,1
    mov [args],rax
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r8
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r10,rax
    	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
 mov r8,rax
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r10
    sub r14,1
    jmp args_lp
  args_end:
  	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
 mov rcx,0x0000_0000_0000_ffff
    mov [rax],rcx
    mov rcx,0x0100_0000_0000_0001
    or rax,rcx
    mov [r13+16],rax
	call NS_E_1428
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
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
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
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rax],rsi
	mov r9,rax
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
NS_E_143:
NS_E_RDI_143:
NS_E_143_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb LB_144
	cmp r11,122
	ja LB_144
	add rsi,1
	mov rax,1
	ret
LB_144:
	mov rax,0
	ret
NS_E_141:
NS_E_RDI_141:
NS_E_141_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb LB_142
	cmp r11,90
	ja LB_142
	add rsi,1
	mov rax,1
	ret
LB_142:
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
	jc LB_169
	bt QWORD [rdi],17
	jnc LB_169
	bt QWORD [rdi],0
	jc LB_171
	btr r12,2
	clc
	jmp LB_172
LB_171:
	bts r12,2
	stc
LB_172:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_170
LB_169:
	btr r12,2
	clc
	call dcp
LB_170:
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
	jc LB_165
	mov rax,[rdi]
	bt rax,17
	jnc LB_163
	bt QWORD rax,0
	jc LB_166
	btr r12,2
	clc
	jmp LB_167
LB_166:
	bts r12,2
	stc
LB_167:
	mov rsi,QWORD [rdi+8]
	push rsi
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rdi
	jmp LB_164
LB_165:
	cmp rdi,NULL
	jz err
LB_163:
	btr r12,2
LB_164:
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
	jc LB_159
	mov rax,[rdi]
	bt QWORD rax,17
	jnc LB_157
	bt QWORD rax,0
	jc LB_160
	btr r12,2
	clc
	jmp LB_161
LB_160:
	bts r12,2
	stc
LB_161:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_158
LB_159:
	cmp rdi,NULL
	jz err
LB_157:
	btr r12,2
	clc
	call dcp
LB_158:
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
	jc LB_155
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_155:
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	mov QWORD [r13+8+8*r14],rax
	mov QWORD [rax+8],r8
	mov rdi,0x0000_0001_0102_ffff
	mov QWORD [rax],rdi
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
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rax],rsi
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_174:
; 	|» { 0' 1' }
NS_E_RDI_174:
MTC_LB_201:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_202
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
	jnc LB_205
	bt QWORD [rdi],0
	jc LB_206
	btr r12,4
	clc
	jmp LB_207
LB_206:
	bts r12,4
	stc
LB_207:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_205:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_210
	btr r12,5
	clc
	jmp LB_211
LB_210:
	bts r12,5
	stc
LB_211:
	mov r8,r11
	bt r12,5
	jc LB_208
	btr r12,2
	jmp LB_209
LB_208:
	bts r12,2
LB_209:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_214
	btr r12,5
	clc
	jmp LB_215
LB_214:
	bts r12,5
	stc
LB_215:
	mov r9,r11
	bt r12,5
	jc LB_212
	btr r12,3
	jmp LB_213
LB_212:
	bts r12,3
LB_213:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_216:
	cmp r15,0
	jz LB_217
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_216
LB_217:
; _f174 { %_178 %_176 } ⊢ %_179 : %_179
 ; {>  %_178~3':(_lst)◂(t193''(-1)) %_176~1':(_lst)◂(t193''(-1)) %_177~2':t193''(-1) }
; _f174 { 3' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 3' 1' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,3
	jc LB_224
	btr r12,0
	jmp LB_225
LB_224:
	bts r12,0
LB_225:
	push 0
	push LB_226
	call NS_E_174
LB_226:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_222
	btr r12,2
	clc
	jmp LB_223
LB_222:
	bts r12,2
	stc
LB_223:
	add rsp,16
; _cns { %_177 %_179 } ⊢ %_180 : %_180
 ; {>  %_179~0':(_lst)◂(t193''(-1)) %_177~2':t193''(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; ∎ %_180
 ; {>  %_180~°0◂{ 2' 0' }:(_lst)◂(t193''(-1)) }
; 	∎ °0◂{ 2' 0' }
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 2' 0' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_230
	btr r12,1
	jmp LB_231
LB_230:
	bts r12,1
LB_231:
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_236
	btr r12,3
	jmp LB_237
LB_236:
	bts r12,3
LB_237:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_234
	btr QWORD [rdi],0
	jmp LB_235
LB_234:
	bts QWORD [rdi],0
LB_235:
	mov r9,r14
	bt r12,1
	jc LB_240
	btr r12,3
	jmp LB_241
LB_240:
	bts r12,3
LB_241:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_238
	btr QWORD [rdi],1
	jmp LB_239
LB_238:
	bts QWORD [rdi],1
LB_239:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,0
	jc LB_232
	and rdi,~0x1
	bt r13,0
	jc LB_232
	jmp LB_233
LB_232:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_233:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_202:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_242
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
	jnc LB_243
	bt QWORD [rdi],0
	jc LB_244
	btr r12,2
	clc
	jmp LB_245
LB_244:
	bts r12,2
	stc
LB_245:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_243:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_246:
	cmp r15,0
	jz LB_247
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_246
LB_247:
; ∎ %_176
 ; {>  %_176~1':(_lst)◂(t193''(-1)) }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_248
	btr r12,0
	jmp LB_249
LB_248:
	bts r12,0
LB_249:
	ret
MTC_LB_242:
NS_E_253:
; 	|» 0'
NS_E_RDI_253:
MTC_LB_297:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_298
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
	jnc LB_299
	bt QWORD [rdi],0
	jc LB_300
	btr r12,5
	clc
	jmp LB_301
LB_300:
	bts r12,5
	stc
LB_301:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_299:
	mov r11,rdi
; 5' ⊢ { { 1' 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_314
	btr r12,6
	clc
	jmp LB_315
LB_314:
	bts r12,6
	stc
LB_315:
; 6' ⊢ { 1' 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_304
	btr r12,4
	clc
	jmp LB_305
LB_304:
	bts r12,4
	stc
LB_305:
	mov r14,r10
	bt r12,4
	jc LB_302
	btr r12,1
	jmp LB_303
LB_302:
	bts r12,1
LB_303:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_308
	btr r12,4
	clc
	jmp LB_309
LB_308:
	bts r12,4
	stc
LB_309:
	mov r8,r10
	bt r12,4
	jc LB_306
	btr r12,2
	jmp LB_307
LB_306:
	bts r12,2
LB_307:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_312
	btr r12,4
	clc
	jmp LB_313
LB_312:
	bts r12,4
	stc
LB_313:
	mov r9,r10
	bt r12,4
	jc LB_310
	btr r12,3
	jmp LB_311
LB_310:
	bts r12,3
LB_311:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_318
	btr r12,6
	clc
	jmp LB_319
LB_318:
	bts r12,6
	stc
LB_319:
	mov r10,rcx
	bt r12,6
	jc LB_316
	btr r12,4
	jmp LB_317
LB_316:
	bts r12,4
LB_317:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_320:
	cmp r15,0
	jz LB_321
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_320
LB_321:
; _f253 %_258 ⊢ %_259 : %_259
 ; {>  %_255~1':_r64 %_258~4':(_lst)◂({ _r64 _r64 _stg }) %_256~2':_r64 %_257~3':_stg }
; _f253 4' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_330
	btr r12,0
	jmp LB_331
LB_330:
	bts r12,0
LB_331:
	push 1
	push LB_332
	call NS_E_253
LB_332:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_328
	btr r12,3
	clc
	jmp LB_329
LB_328:
	bts r12,3
	stc
LB_329:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_326
	btr r12,2
	clc
	jmp LB_327
LB_326:
	bts r12,2
	stc
LB_327:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_324
	btr r12,1
	clc
	jmp LB_325
LB_324:
	bts r12,1
	stc
LB_325:
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
; ∎ %_264
 ; {>  %_263~0':_stg %_261~2':_r64 %_264~4':_stg %_260~1':_r64 %_262~3':_stg }
; 	∎ 4'
	bt r12,0
	jc LB_333
	mov rdi,r13
	call dlt
LB_333:
	bt r12,2
	jc LB_334
	mov rdi,r8
	call dlt
LB_334:
	bt r12,1
	jc LB_335
	mov rdi,r14
	call dlt
LB_335:
	bt r12,3
	jc LB_336
	mov rdi,r9
	call dlt
LB_336:
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_337
	btr r12,0
	jmp LB_338
LB_337:
	bts r12,0
LB_338:
	ret
MTC_LB_298:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_339
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
	jnc LB_340
	bt QWORD [rdi],0
	jc LB_341
	btr r12,1
	clc
	jmp LB_342
LB_341:
	bts r12,1
	stc
LB_342:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_340:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_343:
	cmp r15,0
	jz LB_344
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_343
LB_344:
; 	» "" _ ⊢ 0' : %_265
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_265
 ; {>  %_265~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_339:
NS_E_DST_ID_346: dq 1
NS_E_SRC_ID_346: dq 0
NS_E_346:
NS_E_RDI_346:
NS_E_346_ETR_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_716
LB_715:
	add r14,1
LB_716:
	cmp r14,r10
	jge LB_717
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_715
	cmp al,32
	jz LB_715
LB_717:
	add r14,1
	cmp r14,r10
	jg LB_720
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_720
	jmp LB_721
LB_720:
	jmp LB_710
LB_721:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; nls
	jmp LB_723
LB_722:
	add r14,1
LB_723:
	cmp r14,r10
	jge LB_724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_722
	cmp al,32
	jz LB_722
LB_724:
	push r10
	call NS_E_346_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_725
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_726
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_726:
	jmp LB_710
LB_725:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_713
	btr r12,1
	clc
	jmp LB_714
LB_713:
	bts r12,1
	stc
LB_714:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_711
	btr r12,0
	clc
	jmp LB_712
LB_711:
	bts r12,0
	stc
LB_712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 2
	push LB_707
	push LB_707
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_728
	btr r12,2
	jmp LB_729
LB_728:
	bts r12,2
LB_729:
	mov r13,r14
	bt r12,1
	jc LB_730
	btr r12,0
	jmp LB_731
LB_730:
	bts r12,0
LB_731:
; 2' ⊢ {  }
	mov rdi,r8
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	mov rax,QWORD [rsp+8*5]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f38 { %_74 %_73 } ⊢ %_352 : %_352
 ; {>  %_351~0':(_p250)◂({ }) %_74~1':_r64 %_73~2':_r64 }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_681
	btr r12,3
	jmp LB_682
LB_681:
	bts r12,3
LB_682:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_679
	btr QWORD [rdi],0
	jmp LB_680
LB_679:
	bts QWORD [rdi],0
LB_680:
	mov r9,r8
	bt r12,2
	jc LB_685
	btr r12,3
	jmp LB_686
LB_685:
	bts r12,3
LB_686:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_683
	btr QWORD [rdi],1
	jmp LB_684
LB_683:
	bts QWORD [rdi],1
LB_684:
	push -1
	push LB_695
	call NS_E_38
LB_695:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_689
	btr r12,3
	clc
	jmp LB_690
LB_689:
	bts r12,3
	stc
LB_690:
	mov r14,r9
	bt r12,3
	jc LB_687
	btr r12,1
	jmp LB_688
LB_687:
	bts r12,1
LB_688:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_693
	btr r12,3
	clc
	jmp LB_694
LB_693:
	bts r12,3
	stc
LB_694:
	mov r8,r9
	bt r12,3
	jc LB_691
	btr r12,2
	jmp LB_692
LB_691:
	bts r12,2
LB_692:
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_677
	btr r12,0
	clc
	jmp LB_678
LB_677:
	bts r12,0
	stc
LB_678:
	add rsp,16
; _f251 {  } ⊢ %_353 : %_353
 ; {>  %_351~0':(_p250)◂({ }) %_352~{ 1' 2' }:{ _r64 _r64 } }
; _f251 {  } ⊢ °0◂{  }
; _some %_353 ⊢ %_354 : %_354
 ; {>  %_353~°0◂{  }:(_p250)◂({ }) %_351~0':(_p250)◂({ }) %_352~{ 1' 2' }:{ _r64 _r64 } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_354
 ; {>  %_351~0':(_p250)◂({ }) %_354~°0◂°0◂{  }:(_opn)◂((_p250)◂({ })) %_352~{ 1' 2' }:{ _r64 _r64 } }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_702
	mov rdi,r13
	call dlt
LB_702:
	bt r12,1
	jc LB_703
	mov rdi,r14
	call dlt
LB_703:
	bt r12,2
	jc LB_704
	mov rdi,r8
	call dlt
LB_704:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_705
	and rdi,~0x1
	bt r9,0
	jc LB_705
	jmp LB_706
LB_705:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_706:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_707:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_709
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_708
LB_709:
	add rsp,8
	ret
LB_710:
	add rsp,32
	pop r14
LB_708:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "##"
	jmp LB_751
LB_750:
	add r14,1
LB_751:
	cmp r14,r10
	jge LB_752
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_750
	cmp al,32
	jz LB_750
LB_752:
	add r14,2
	cmp r14,r10
	jg LB_755
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,35
	jnz LB_755
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,35
	jnz LB_755
	jmp LB_756
LB_755:
	jmp LB_745
LB_756:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_res
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
	push r10
	call NS_E_350_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_760
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_761
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_761:
	jmp LB_745
LB_760:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_748
	btr r12,1
	clc
	jmp LB_749
LB_748:
	bts r12,1
	stc
LB_749:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_746
	btr r12,0
	clc
	jmp LB_747
LB_746:
	bts r12,0
	stc
LB_747:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 3
	push LB_742
	push LB_742
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 1' ⊢ {  }
	mov rdi,r14
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; 0' ⊢ {  }
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f251 {  } ⊢ %_367 : %_367
 ; {>  %_366~{  }:{ } %_77~1':_r64 %_78~0':_r64 }
; _f251 {  } ⊢ °0◂{  }
; _some %_367 ⊢ %_368 : %_368
 ; {>  %_367~°0◂{  }:(_p250)◂({ }) %_366~{  }:{ } %_77~1':_r64 %_78~0':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_368
 ; {>  %_368~°0◂°0◂{  }:(_opn)◂((_p250)◂({ })) %_366~{  }:{ } %_77~1':_r64 %_78~0':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,1
	jc LB_738
	mov rdi,r14
	call dlt
LB_738:
	bt r12,0
	jc LB_739
	mov rdi,r13
	call dlt
LB_739:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_740
	and rdi,~0x1
	bt r9,0
	jc LB_740
	jmp LB_741
LB_740:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_741:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_742:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_744
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_743
LB_744:
	add rsp,8
	ret
LB_745:
	add rsp,32
	pop r14
LB_743:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_983
LB_982:
	add r14,1
LB_983:
	cmp r14,r10
	jge LB_984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_982
	cmp al,32
	jz LB_982
LB_984:
	add r14,2
	cmp r14,r10
	jg LB_987
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_987
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_987
	jmp LB_988
LB_987:
	jmp LB_975
LB_988:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\n"
	jmp LB_902
LB_901:
	add r14,1
LB_902:
	cmp r14,r10
	jge LB_903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_901
	cmp al,32
	jz LB_901
LB_903:
	add r14,1
	cmp r14,r10
	jg LB_906
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_906
	jmp LB_907
LB_906:
	jmp LB_894
LB_907:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	jmp LB_909
LB_908:
	add r14,1
LB_909:
	cmp r14,r10
	jge LB_910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_908
	cmp al,32
	jz LB_908
LB_910:
	push r10
	call NS_E_348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_911
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_912
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_912:
	jmp LB_894
LB_911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; nls
	jmp LB_915
LB_914:
	add r14,1
LB_915:
	cmp r14,r10
	jge LB_916
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_914
	cmp al,32
	jz LB_914
LB_916:
	push r10
	call NS_E_346_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_917
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_918
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_918:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_919
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_919:
	jmp LB_894
LB_917:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_899
	btr r12,2
	clc
	jmp LB_900
LB_899:
	bts r12,2
	stc
LB_900:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_897
	btr r12,1
	clc
	jmp LB_898
LB_897:
	bts r12,1
	stc
LB_898:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_895
	btr r12,0
	clc
	jmp LB_896
LB_895:
	bts r12,0
	stc
LB_896:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 4
	push LB_891
	push LB_891
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r13
	bt r12,0
	jc LB_921
	btr r12,3
	jmp LB_922
LB_921:
	bts r12,3
LB_922:
	mov r13,r14
	bt r12,1
	jc LB_923
	btr r12,0
	jmp LB_924
LB_923:
	bts r12,0
LB_924:
	mov r14,r8
	bt r12,2
	jc LB_925
	btr r12,1
	jmp LB_926
LB_925:
	bts r12,1
LB_926:
; 3' ⊢ {  }
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	mov rax,QWORD [rsp+8*5]
	mov r8,rax
	bts r12,2
	bts r12,3
; _f38 {  } ⊢ %_380 : %_380
 ; {>  %_378~0':(_p250)◂({ }) %_84~3':_r64 %_379~1':(_p250)◂({ }) %_85~2':_r64 }
; _f38 {  } ⊢ {  }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ 0'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	push -1
	push LB_776
	call NS_E_38
LB_776:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ {  }
; 0' ⊢ {  }
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_774
	btr r12,3
	clc
	jmp LB_775
LB_774:
	bts r12,3
	stc
LB_775:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_772
	btr r12,2
	clc
	jmp LB_773
LB_772:
	bts r12,2
	stc
LB_773:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_770
	btr r12,1
	clc
	jmp LB_771
LB_770:
	bts r12,1
	stc
LB_771:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_768
	btr r12,0
	clc
	jmp LB_769
LB_768:
	bts r12,0
	stc
LB_769:
	add rsp,40
MTC_LB_777:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_778
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
	jnc LB_779
	bt QWORD [rdi],0
	jc LB_780
	btr r12,4
	clc
	jmp LB_781
LB_780:
	bts r12,4
	stc
LB_781:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_779:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_782:
	cmp r15,0
	jz LB_783
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_782
LB_783:
MTC_LB_784:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_785
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
	jnc LB_786
	bt QWORD [rdi],0
	jc LB_787
	btr r12,0
	clc
	jmp LB_788
LB_787:
	bts r12,0
	stc
LB_788:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_786:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_789:
	cmp r15,0
	jz LB_790
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_789
LB_790:
; _f251 {  } ⊢ %_383 : %_383
 ; {>  %_381~{  }:{ } %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 %_382~{  }:{ } }
; _f251 {  } ⊢ °0◂{  }
; _some %_383 ⊢ %_384 : %_384
 ; {>  %_383~°0◂{  }:(_p250)◂({ }) %_381~{  }:{ } %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 %_382~{  }:{ } }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_384
 ; {>  %_381~{  }:{ } %_84~3':_r64 %_380~{  }:{ } %_384~°0◂°0◂{  }:(_opn)◂((_p250)◂({ })) %_85~2':_r64 %_382~{  }:{ } }
; 	∎ °0◂°0◂{  }
	bt r12,3
	jc LB_797
	mov rdi,r9
	call dlt
LB_797:
	bt r12,2
	jc LB_798
	mov rdi,r8
	call dlt
LB_798:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_799
	and rdi,~0x1
	bt r9,0
	jc LB_799
	jmp LB_800
LB_799:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_800:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_785:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_801
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
	jnc LB_802
	bt QWORD [rdi],0
	jc LB_803
	btr r12,4
	clc
	jmp LB_804
LB_803:
	bts r12,4
	stc
LB_804:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_802:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_805
	btr r12,0
	jmp LB_806
LB_805:
	bts r12,0
LB_806:
LB_807:
	cmp r15,0
	jz LB_808
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_807
LB_808:
; _f253 %_385 ⊢ %_386 : %_386
 ; {>  %_381~{  }:{ } %_385~0':(_lst)◂({ _r64 _r64 _stg }) %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 }
; _f253 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 1
	push LB_815
	call NS_E_253
LB_815:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_813
	btr r12,3
	clc
	jmp LB_814
LB_813:
	bts r12,3
	stc
LB_814:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_811
	btr r12,2
	clc
	jmp LB_812
LB_811:
	bts r12,2
	stc
LB_812:
	add rsp,24
; _f38 %_386 ⊢ %_387 : %_387
 ; {>  %_381~{  }:{ } %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 %_386~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_823
	call NS_E_38
LB_823:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_821
	btr r12,3
	clc
	jmp LB_822
LB_821:
	bts r12,3
	stc
LB_822:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_819
	btr r12,2
	clc
	jmp LB_820
LB_819:
	bts r12,2
	stc
LB_820:
	add rsp,24
	jmp err
MTC_LB_801:
MTC_LB_778:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_824
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
	jnc LB_825
	bt QWORD [rdi],0
	jc LB_826
	btr r12,5
	clc
	jmp LB_827
LB_826:
	bts r12,5
	stc
LB_827:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_825:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_828
	btr r12,4
	jmp LB_829
LB_828:
	bts r12,4
LB_829:
LB_830:
	cmp r15,0
	jz LB_831
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_830
LB_831:
MTC_LB_832:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_833
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
	jnc LB_834
	bt QWORD [rdi],0
	jc LB_835
	btr r12,0
	clc
	jmp LB_836
LB_835:
	bts r12,0
	stc
LB_836:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_834:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_837:
	cmp r15,0
	jz LB_838
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_837
LB_838:
; _f253 %_388 ⊢ %_390 : %_390
 ; {>  %_84~3':_r64 %_388~4':(_lst)◂({ _r64 _r64 _stg }) %_380~{  }:{ } %_85~2':_r64 %_389~{  }:{ } }
; _f253 4' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_845
	btr r12,0
	jmp LB_846
LB_845:
	bts r12,0
LB_846:
	push 1
	push LB_847
	call NS_E_253
LB_847:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_843
	btr r12,3
	clc
	jmp LB_844
LB_843:
	bts r12,3
	stc
LB_844:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_841
	btr r12,2
	clc
	jmp LB_842
LB_841:
	bts r12,2
	stc
LB_842:
	add rsp,24
; _f38 %_390 ⊢ %_391 : %_391
 ; {>  %_390~0':_stg %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 %_389~{  }:{ } }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_855
	call NS_E_38
LB_855:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_853
	btr r12,3
	clc
	jmp LB_854
LB_853:
	bts r12,3
	stc
LB_854:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_851
	btr r12,2
	clc
	jmp LB_852
LB_851:
	bts r12,2
	stc
LB_852:
	add rsp,24
	jmp err
MTC_LB_833:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_856
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
	jnc LB_857
	bt QWORD [rdi],0
	jc LB_858
	btr r12,5
	clc
	jmp LB_859
LB_858:
	bts r12,5
	stc
LB_859:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_857:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_860
	btr r12,0
	jmp LB_861
LB_860:
	bts r12,0
LB_861:
LB_862:
	cmp r15,0
	jz LB_863
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_862
LB_863:
; _f174 { %_388 %_392 } ⊢ %_393 : %_393
 ; {>  %_84~3':_r64 %_388~4':(_lst)◂({ _r64 _r64 _stg }) %_380~{  }:{ } %_85~2':_r64 %_392~0':(_lst)◂({ _r64 _r64 _stg }) }
; _f174 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_871
	btr r12,1
	jmp LB_872
LB_871:
	bts r12,1
LB_872:
	mov r13,r10
	bt r12,4
	jc LB_873
	btr r12,0
	jmp LB_874
LB_873:
	bts r12,0
LB_874:
	push 0
	push LB_875
	call NS_E_174
LB_875:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_869
	btr r12,3
	clc
	jmp LB_870
LB_869:
	bts r12,3
	stc
LB_870:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_867
	btr r12,2
	clc
	jmp LB_868
LB_867:
	bts r12,2
	stc
LB_868:
	add rsp,24
; _f253 %_393 ⊢ %_394 : %_394
 ; {>  %_393~0':(_lst)◂({ _r64 _r64 _stg }) %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 }
; _f253 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push 1
	push LB_882
	call NS_E_253
LB_882:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_880
	btr r12,3
	clc
	jmp LB_881
LB_880:
	bts r12,3
	stc
LB_881:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_878
	btr r12,2
	clc
	jmp LB_879
LB_878:
	bts r12,2
	stc
LB_879:
	add rsp,24
; _f38 %_394 ⊢ %_395 : %_395
 ; {>  %_394~0':_stg %_84~3':_r64 %_380~{  }:{ } %_85~2':_r64 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	push -1
	push LB_890
	call NS_E_38
LB_890:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_888
	btr r12,3
	clc
	jmp LB_889
LB_888:
	bts r12,3
	stc
LB_889:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_886
	btr r12,2
	clc
	jmp LB_887
LB_886:
	bts r12,2
	stc
LB_887:
	add rsp,24
	jmp err
MTC_LB_856:
MTC_LB_824:
LB_891:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_893
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_892
LB_893:
	add rsp,8
	jmp LB_763
LB_894:
	add rsp,48
	pop r14
LB_892:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 5
	push LB_939
	push LB_939
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
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
; _f38 %_463 ⊢ %_464 : %_464
 ; {>  %_462~1':_r64 %_461~0':_r64 %_463~2':_stg }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_934
	btr r12,0
	jmp LB_935
LB_934:
	bts r12,0
LB_935:
	push -1
	push LB_938
	call NS_E_38
LB_938:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_936
	btr r12,2
	jmp LB_937
LB_936:
	bts r12,2
LB_937:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_932
	btr r12,1
	clc
	jmp LB_933
LB_932:
	bts r12,1
	stc
LB_933:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_930
	btr r12,0
	clc
	jmp LB_931
LB_930:
	bts r12,0
	stc
LB_931:
	add rsp,24
	jmp err
LB_939:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_941
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_940
LB_941:
	add rsp,8
	jmp LB_763
LB_942:
	add rsp,0
	pop r14
LB_940:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_763
LB_763:
	pop r10
	cmp r8,0
	jz LB_764
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_980:
	jmp LB_975
LB_764:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_978
	btr r12,1
	clc
	jmp LB_979
LB_978:
	bts r12,1
	stc
LB_979:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_976
	btr r12,0
	clc
	jmp LB_977
LB_976:
	bts r12,0
	stc
LB_977:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 6
	push LB_972
	push LB_972
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_989
	btr r12,2
	jmp LB_990
LB_989:
	bts r12,2
LB_990:
	mov r13,r14
	bt r12,1
	jc LB_991
	btr r12,0
	jmp LB_992
LB_991:
	bts r12,0
LB_992:
; 2' ⊢ {  }
	mov rdi,r8
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	mov rax,QWORD [rsp+8*5]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f38 { %_93 %_92 } ⊢ %_477 : %_477
 ; {>  %_93~1':_r64 %_92~2':_r64 %_476~0':(_p250)◂({ }) }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_950
	btr r12,3
	jmp LB_951
LB_950:
	bts r12,3
LB_951:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_948
	btr QWORD [rdi],0
	jmp LB_949
LB_948:
	bts QWORD [rdi],0
LB_949:
	mov r9,r8
	bt r12,2
	jc LB_954
	btr r12,3
	jmp LB_955
LB_954:
	bts r12,3
LB_955:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_952
	btr QWORD [rdi],1
	jmp LB_953
LB_952:
	bts QWORD [rdi],1
LB_953:
	push -1
	push LB_964
	call NS_E_38
LB_964:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_958
	btr r12,3
	clc
	jmp LB_959
LB_958:
	bts r12,3
	stc
LB_959:
	mov r14,r9
	bt r12,3
	jc LB_956
	btr r12,1
	jmp LB_957
LB_956:
	bts r12,1
LB_957:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_962
	btr r12,3
	clc
	jmp LB_963
LB_962:
	bts r12,3
	stc
LB_963:
	mov r8,r9
	bt r12,3
	jc LB_960
	btr r12,2
	jmp LB_961
LB_960:
	bts r12,2
LB_961:
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_946
	btr r12,0
	clc
	jmp LB_947
LB_946:
	bts r12,0
	stc
LB_947:
	add rsp,16
; _some %_476 ⊢ %_478 : %_478
 ; {>  %_477~{ 1' 2' }:{ _r64 _r64 } %_476~0':(_p250)◂({ }) }
; _some 0' ⊢ °0◂0'
; ∎ %_478
 ; {>  %_477~{ 1' 2' }:{ _r64 _r64 } %_478~°0◂0':(_opn)◂((_p250)◂({ })) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_968
	mov rdi,r14
	call dlt
LB_968:
	bt r12,2
	jc LB_969
	mov rdi,r8
	call dlt
LB_969:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_970
	btr r12,3
	jmp LB_971
LB_970:
	bts r12,3
LB_971:
	mov r8,0
	bts r12,2
	ret
LB_972:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_974
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_973
LB_974:
	add rsp,8
	ret
LB_975:
	add rsp,16
	pop r14
LB_973:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 7
	push LB_1003
	push LB_1003
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f251 {  } ⊢ %_487 : %_487
 ; {>  %_96~1':_r64 %_97~0':_r64 }
; _f251 {  } ⊢ °0◂{  }
; _some %_487 ⊢ %_488 : %_488
 ; {>  %_96~1':_r64 %_97~0':_r64 %_487~°0◂{  }:(_p250)◂({ }) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_488
 ; {>  %_96~1':_r64 %_488~°0◂°0◂{  }:(_opn)◂((_p250)◂({ })) %_97~0':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,1
	jc LB_999
	mov rdi,r14
	call dlt
LB_999:
	bt r12,0
	jc LB_1000
	mov rdi,r13
	call dlt
LB_1000:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1001
	and rdi,~0x1
	bt r9,0
	jc LB_1001
	jmp LB_1002
LB_1001:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1002:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1003:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1005
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1004
LB_1005:
	add rsp,8
	ret
LB_1006:
	add rsp,0
	pop r14
LB_1004:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_DST_ID_348: dq 1
NS_E_SRC_ID_348: dq 0
NS_E_348:
NS_E_RDI_348:
NS_E_348_ETR_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\["
	jmp LB_1204
LB_1203:
	add r14,1
LB_1204:
	cmp r14,r10
	jge LB_1205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1203
	cmp al,32
	jz LB_1203
LB_1205:
	add r14,2
	cmp r14,r10
	jg LB_1208
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_1208
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,91
	jnz LB_1208
	jmp LB_1209
LB_1208:
	jmp LB_1196
LB_1209:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\n"
	jmp LB_1123
LB_1122:
	add r14,1
LB_1123:
	cmp r14,r10
	jge LB_1124
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1122
	cmp al,32
	jz LB_1122
LB_1124:
	add r14,1
	cmp r14,r10
	jg LB_1127
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_1127
	jmp LB_1128
LB_1127:
	jmp LB_1115
LB_1128:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	jmp LB_1130
LB_1129:
	add r14,1
LB_1130:
	cmp r14,r10
	jge LB_1131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1129
	cmp al,32
	jz LB_1129
LB_1131:
	push r10
	call NS_E_348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1132
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1133
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1133:
	jmp LB_1115
LB_1132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	jmp LB_1136
LB_1135:
	add r14,1
LB_1136:
	cmp r14,r10
	jge LB_1137
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1135
	cmp al,32
	jz LB_1135
LB_1137:
	push r10
	call NS_E_348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1138
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_1139
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_1139:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1140:
	jmp LB_1115
LB_1138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_1120
	btr r12,2
	clc
	jmp LB_1121
LB_1120:
	bts r12,2
	stc
LB_1121:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1118
	btr r12,1
	clc
	jmp LB_1119
LB_1118:
	bts r12,1
	stc
LB_1119:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1116
	btr r12,0
	clc
	jmp LB_1117
LB_1116:
	bts r12,0
	stc
LB_1117:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push 8
	push LB_1112
	push LB_1112
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r13
	bt r12,0
	jc LB_1142
	btr r12,3
	jmp LB_1143
LB_1142:
	bts r12,3
LB_1143:
	mov r13,r14
	bt r12,1
	jc LB_1144
	btr r12,0
	jmp LB_1145
LB_1144:
	bts r12,0
LB_1145:
	mov r14,r8
	bt r12,2
	jc LB_1146
	btr r12,1
	jmp LB_1147
LB_1146:
	bts r12,1
LB_1147:
; 3' ⊢ {  }
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r9,rax
	mov rax,QWORD [rsp+8*5]
	mov r8,rax
	bts r12,2
	bts r12,3
MTC_LB_1009:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1010
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
	jnc LB_1011
	bt QWORD [rdi],0
	jc LB_1012
	btr r12,4
	clc
	jmp LB_1013
LB_1012:
	bts r12,4
	stc
LB_1013:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1011:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1014:
	cmp r15,0
	jz LB_1015
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_1014
LB_1015:
MTC_LB_1016:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1017
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
	jnc LB_1018
	bt QWORD [rdi],0
	jc LB_1019
	btr r12,0
	clc
	jmp LB_1020
LB_1019:
	bts r12,0
	stc
LB_1020:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1018:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1021:
	cmp r15,0
	jz LB_1022
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_1021
LB_1022:
; _f251 {  } ⊢ %_500 : %_500
 ; {>  %_499~{  }:{ } %_498~{  }:{ } %_101~2':_r64 %_100~3':_r64 }
; _f251 {  } ⊢ °0◂{  }
; _some %_500 ⊢ %_501 : %_501
 ; {>  %_500~°0◂{  }:(_p250)◂({ }) %_499~{  }:{ } %_498~{  }:{ } %_101~2':_r64 %_100~3':_r64 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_501
 ; {>  %_499~{  }:{ } %_498~{  }:{ } %_501~°0◂°0◂{  }:(_opn)◂((_p250)◂({ })) %_101~2':_r64 %_100~3':_r64 }
; 	∎ °0◂°0◂{  }
	bt r12,2
	jc LB_1029
	mov rdi,r8
	call dlt
LB_1029:
	bt r12,3
	jc LB_1030
	mov rdi,r9
	call dlt
LB_1030:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1031
	and rdi,~0x1
	bt r9,0
	jc LB_1031
	jmp LB_1032
LB_1031:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1032:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_1017:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1033
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
	jnc LB_1034
	bt QWORD [rdi],0
	jc LB_1035
	btr r12,4
	clc
	jmp LB_1036
LB_1035:
	bts r12,4
	stc
LB_1036:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1034:
	mov r10,rdi
	mov r13,r10
	bt r12,4
	jc LB_1037
	btr r12,0
	jmp LB_1038
LB_1037:
	bts r12,0
LB_1038:
LB_1039:
	cmp r15,0
	jz LB_1040
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_1039
LB_1040:
; _f252 %_502 ⊢ %_503 : %_503
 ; {>  %_502~0':(_lst)◂({ _r64 _r64 _stg }) %_498~{  }:{ } %_101~2':_r64 %_100~3':_r64 }
; _f252 0' ⊢ °1◂0'
; _some %_503 ⊢ %_504 : %_504
 ; {>  %_498~{  }:{ } %_101~2':_r64 %_503~°1◂0':(_p250)◂(t539''(1)) %_100~3':_r64 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_504
 ; {>  %_498~{  }:{ } %_101~2':_r64 %_100~3':_r64 %_504~°0◂°1◂0':(_opn)◂((_p250)◂(t543''(1))) }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_1047
	mov rdi,r8
	call dlt
LB_1047:
	bt r12,3
	jc LB_1048
	mov rdi,r9
	call dlt
LB_1048:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1051
	btr r12,3
	jmp LB_1052
LB_1051:
	bts r12,3
LB_1052:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1049
	and rdi,~0x1
	bt r9,0
	jc LB_1049
	jmp LB_1050
LB_1049:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1050:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_1033:
MTC_LB_1010:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1053
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
	jnc LB_1054
	bt QWORD [rdi],0
	jc LB_1055
	btr r12,5
	clc
	jmp LB_1056
LB_1055:
	bts r12,5
	stc
LB_1056:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1054:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1057
	btr r12,4
	jmp LB_1058
LB_1057:
	bts r12,4
LB_1058:
LB_1059:
	cmp r15,0
	jz LB_1060
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_1059
LB_1060:
MTC_LB_1061:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1062
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
	jnc LB_1063
	bt QWORD [rdi],0
	jc LB_1064
	btr r12,0
	clc
	jmp LB_1065
LB_1064:
	bts r12,0
	stc
LB_1065:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1063:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1066:
	cmp r15,0
	jz LB_1067
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_1066
LB_1067:
; _f252 %_505 ⊢ %_507 : %_507
 ; {>  %_506~{  }:{ } %_505~4':(_lst)◂({ _r64 _r64 _stg }) %_101~2':_r64 %_100~3':_r64 }
; _f252 4' ⊢ °1◂4'
; _some %_507 ⊢ %_508 : %_508
 ; {>  %_507~°1◂4':(_p250)◂(t557''(1)) %_506~{  }:{ } %_101~2':_r64 %_100~3':_r64 }
; _some °1◂4' ⊢ °0◂°1◂4'
; ∎ %_508
 ; {>  %_508~°0◂°1◂4':(_opn)◂((_p250)◂(t561''(1))) %_506~{  }:{ } %_101~2':_r64 %_100~3':_r64 }
; 	∎ °0◂°1◂4'
	bt r12,2
	jc LB_1074
	mov rdi,r8
	call dlt
LB_1074:
	bt r12,3
	jc LB_1075
	mov rdi,r9
	call dlt
LB_1075:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂°1◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_1078
	btr r12,3
	jmp LB_1079
LB_1078:
	bts r12,3
LB_1079:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1076
	and rdi,~0x1
	bt r9,0
	jc LB_1076
	jmp LB_1077
LB_1076:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1077:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_1062:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1080
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
	jnc LB_1081
	bt QWORD [rdi],0
	jc LB_1082
	btr r12,5
	clc
	jmp LB_1083
LB_1082:
	bts r12,5
	stc
LB_1083:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1081:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_1084
	btr r12,0
	jmp LB_1085
LB_1084:
	bts r12,0
LB_1085:
LB_1086:
	cmp r15,0
	jz LB_1087
	mov rdi,QWORD [gbg_vct-8+8*r15]
	call dlt_gbg
	sub r15,1
	jmp LB_1086
LB_1087:
; _f174 { %_505 %_509 } ⊢ %_510 : %_510
 ; {>  %_509~0':(_lst)◂({ _r64 _r64 _stg }) %_505~4':(_lst)◂({ _r64 _r64 _stg }) %_101~2':_r64 %_100~3':_r64 }
; _f174 { 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 4' 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_1095
	btr r12,1
	jmp LB_1096
LB_1095:
	bts r12,1
LB_1096:
	mov r13,r10
	bt r12,4
	jc LB_1097
	btr r12,0
	jmp LB_1098
LB_1097:
	bts r12,0
LB_1098:
	push 0
	push LB_1099
	call NS_E_174
LB_1099:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1093
	btr r12,3
	clc
	jmp LB_1094
LB_1093:
	bts r12,3
	stc
LB_1094:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1091
	btr r12,2
	clc
	jmp LB_1092
LB_1091:
	bts r12,2
	stc
LB_1092:
	add rsp,24
; _f252 %_510 ⊢ %_511 : %_511
 ; {>  %_510~0':(_lst)◂({ _r64 _r64 _stg }) %_101~2':_r64 %_100~3':_r64 }
; _f252 0' ⊢ °1◂0'
; _some %_511 ⊢ %_512 : %_512
 ; {>  %_101~2':_r64 %_100~3':_r64 %_511~°1◂0':(_p250)◂(t568''(1)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_512
 ; {>  %_101~2':_r64 %_512~°0◂°1◂0':(_opn)◂((_p250)◂(t572''(1))) %_100~3':_r64 }
; 	∎ °0◂°1◂0'
	bt r12,2
	jc LB_1106
	mov rdi,r8
	call dlt
LB_1106:
	bt r12,3
	jc LB_1107
	mov rdi,r9
	call dlt
LB_1107:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1110
	btr r12,3
	jmp LB_1111
LB_1110:
	bts r12,3
LB_1111:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1108
	and rdi,~0x1
	bt r9,0
	jc LB_1108
	jmp LB_1109
LB_1108:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1109:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_1080:
MTC_LB_1053:
LB_1112:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1114
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1113
LB_1114:
	add rsp,8
	jmp LB_1007
LB_1115:
	add rsp,48
	pop r14
LB_1113:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 9
	push LB_1182
	push LB_1182
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_581 : %_581
 ; {>  %_104~1':_r64 %_105~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 0" _ ⊢ 2' : %_582
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_105 %_104 %_582 } %_581 } ⊢ %_583 : %_583
 ; {>  %_104~1':_r64 %_105~0':_r64 %_581~°1◂{  }:(_lst)◂(t586''(1)) %_582~2':_stg }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f252 %_583 ⊢ %_584 : %_584
 ; {>  %_583~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f252 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_584 ⊢ %_585 : %_585
 ; {>  %_584~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p250)◂(t595''(1)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_585
 ; {>  %_585~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p250)◂(t599''(1))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0003_0200_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_1168
	btr r12,5
	jmp LB_1169
LB_1168:
	bts r12,5
LB_1169:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_1166
	btr QWORD [rdi],0
	jmp LB_1167
LB_1166:
	bts QWORD [rdi],0
LB_1167:
	mov r11,r14
	bt r12,1
	jc LB_1172
	btr r12,5
	jmp LB_1173
LB_1172:
	bts r12,5
LB_1173:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_1170
	btr QWORD [rdi],1
	jmp LB_1171
LB_1170:
	bts QWORD [rdi],1
LB_1171:
	mov r11,r8
	bt r12,2
	jc LB_1176
	btr r12,5
	jmp LB_1177
LB_1176:
	bts r12,5
LB_1177:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_1174
	btr QWORD [rdi],2
	jmp LB_1175
LB_1174:
	bts QWORD [rdi],2
LB_1175:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_1164
	btr QWORD [rdi],0
	jmp LB_1165
LB_1164:
	bts QWORD [rdi],0
LB_1165:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rdi,0x0000_0001_0102_ffff
	bt r12,4
	jc LB_1180
	and rdi,~0x1
	bt r10,0
	jc LB_1180
	jmp LB_1181
LB_1180:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_1181:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_1178
	btr QWORD [rdi],1
	jmp LB_1179
LB_1178:
	bts QWORD [rdi],1
LB_1179:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1162
	and rdi,~0x1
	bt r9,0
	jc LB_1162
	jmp LB_1163
LB_1162:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1163:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1160
	and rdi,~0x1
	bt r9,0
	jc LB_1160
	jmp LB_1161
LB_1160:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1161:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1182:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1184
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1183
LB_1184:
	add rsp,8
	jmp LB_1007
LB_1185:
	add rsp,0
	pop r14
LB_1183:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_1007
LB_1007:
	pop r10
	cmp r8,0
	jz LB_1008
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1201:
	jmp LB_1196
LB_1008:
	mov rdi,r13
	mov rsi,r14
	mov r14,r9
	bt r12,3
	jc LB_1199
	btr r12,1
	clc
	jmp LB_1200
LB_1199:
	bts r12,1
	stc
LB_1200:
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1197
	btr r12,0
	clc
	jmp LB_1198
LB_1197:
	bts r12,0
	stc
LB_1198:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 10
	push LB_1193
	push LB_1193
; _emt_mov_ptn_to_ptn:{| 110.. |},{ { 0' } 1' } ⊢ { { {  } } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1210
	btr r12,2
	jmp LB_1211
LB_1210:
	bts r12,2
LB_1211:
	mov r13,r14
	bt r12,1
	jc LB_1212
	btr r12,0
	jmp LB_1213
LB_1212:
	bts r12,0
LB_1213:
; 2' ⊢ {  }
	mov rdi,r8
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	mov rax,QWORD [rsp+8*5]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_604 ⊢ %_605 : %_605
 ; {>  %_604~0':(_p250)◂({ }) %_107~2':_r64 %_108~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_605
 ; {>  %_107~2':_r64 %_605~°0◂0':(_opn)◂((_p250)◂({ })) %_108~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1189
	mov rdi,r8
	call dlt
LB_1189:
	bt r12,1
	jc LB_1190
	mov rdi,r14
	call dlt
LB_1190:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1191
	btr r12,3
	jmp LB_1192
LB_1191:
	bts r12,3
LB_1192:
	mov r8,0
	bts r12,2
	ret
LB_1193:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1195
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1194
LB_1195:
	add rsp,8
	ret
LB_1196:
	add rsp,16
	pop r14
LB_1194:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\\]"
	jmp LB_1257
LB_1256:
	add r14,1
LB_1257:
	cmp r14,r10
	jge LB_1258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1256
	cmp al,32
	jz LB_1256
LB_1258:
	add r14,2
	cmp r14,r10
	jg LB_1261
	movzx rax,BYTE [r13+r14+8*1+0-2]
	cmp al,92
	jnz LB_1261
	movzx rax,BYTE [r13+r14+8*1+1-2]
	cmp al,93
	jnz LB_1261
	jmp LB_1262
LB_1261:
	jmp LB_1251
LB_1262:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_1264
LB_1263:
	add r14,1
LB_1264:
	cmp r14,r10
	jge LB_1265
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1263
	cmp al,32
	jz LB_1263
LB_1265:
	add r14,1
	cmp r14,r10
	jg LB_1269
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_1269
	jmp LB_1270
LB_1269:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1267
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1267:
	jmp LB_1251
LB_1270:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1254
	btr r12,1
	clc
	jmp LB_1255
LB_1254:
	bts r12,1
	stc
LB_1255:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1252
	btr r12,0
	clc
	jmp LB_1253
LB_1252:
	bts r12,0
	stc
LB_1253:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 11
	push LB_1248
	push LB_1248
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 1' ⊢ {  }
	mov rdi,r14
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; 0' ⊢ {  }
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _f38 { %_112 %_111 } ⊢ %_611 : %_611
 ; {>  %_111~1':_r64 %_112~0':_r64 }
; _f38 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1217
	btr r12,2
	jmp LB_1218
LB_1217:
	bts r12,2
LB_1218:
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1221
	btr r12,3
	jmp LB_1222
LB_1221:
	bts r12,3
LB_1222:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1219
	btr QWORD [rdi],0
	jmp LB_1220
LB_1219:
	bts QWORD [rdi],0
LB_1220:
	mov r9,r14
	bt r12,1
	jc LB_1225
	btr r12,3
	jmp LB_1226
LB_1225:
	bts r12,3
LB_1226:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1223
	btr QWORD [rdi],1
	jmp LB_1224
LB_1223:
	bts QWORD [rdi],1
LB_1224:
	push -1
	push LB_1237
	call NS_E_38
LB_1237:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1227
	btr r12,2
	jmp LB_1228
LB_1227:
	bts r12,2
LB_1228:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1231
	btr r12,3
	clc
	jmp LB_1232
LB_1231:
	bts r12,3
	stc
LB_1232:
	mov r13,r9
	bt r12,3
	jc LB_1229
	btr r12,0
	jmp LB_1230
LB_1229:
	bts r12,0
LB_1230:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1235
	btr r12,3
	clc
	jmp LB_1236
LB_1235:
	bts r12,3
	stc
LB_1236:
	mov r14,r9
	bt r12,3
	jc LB_1233
	btr r12,1
	jmp LB_1234
LB_1233:
	bts r12,1
LB_1234:
	mov rdi,r8
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f251 {  } ⊢ %_612 : %_612
 ; {>  %_611~{ 0' 1' }:{ _r64 _r64 } }
; _f251 {  } ⊢ °0◂{  }
; _some %_612 ⊢ %_613 : %_613
 ; {>  %_611~{ 0' 1' }:{ _r64 _r64 } %_612~°0◂{  }:(_p250)◂({ }) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_613
 ; {>  %_613~°0◂°0◂{  }:(_opn)◂((_p250)◂({ })) %_611~{ 0' 1' }:{ _r64 _r64 } }
; 	∎ °0◂°0◂{  }
	bt r12,0
	jc LB_1244
	mov rdi,r13
	call dlt
LB_1244:
	bt r12,1
	jc LB_1245
	mov rdi,r14
	call dlt
LB_1245:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1246
	and rdi,~0x1
	bt r9,0
	jc LB_1246
	jmp LB_1247
LB_1246:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1247:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1248:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1250
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1249
LB_1250:
	add rsp,8
	ret
LB_1251:
	add rsp,32
	pop r14
LB_1249:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line_res
	jmp LB_1287
LB_1286:
	add r14,1
LB_1287:
	cmp r14,r10
	jge LB_1288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1286
	cmp al,32
	jz LB_1286
LB_1288:
	push r10
	call NS_E_350_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1289
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1281
LB_1289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	jmp LB_1292
LB_1291:
	add r14,1
LB_1292:
	cmp r14,r10
	jge LB_1293
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1291
	cmp al,32
	jz LB_1291
LB_1293:
	push r10
	call NS_E_348_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1294
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1295:
	jmp LB_1281
LB_1294:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1284
	btr r12,1
	clc
	jmp LB_1285
LB_1284:
	bts r12,1
	stc
LB_1285:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1282
	btr r12,0
	clc
	jmp LB_1283
LB_1282:
	bts r12,0
	stc
LB_1283:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 12
	push LB_1278
	push LB_1278
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1297
	btr r12,2
	jmp LB_1298
LB_1297:
	bts r12,2
LB_1298:
	mov r13,r14
	bt r12,1
	jc LB_1299
	btr r12,0
	jmp LB_1300
LB_1299:
	bts r12,0
LB_1300:
; 2' ⊢ {  }
	mov rdi,r8
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	mov rax,QWORD [rsp+8*5]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some %_624 ⊢ %_625 : %_625
 ; {>  %_624~0':(_p250)◂({ }) %_623~{  }:{ } %_115~2':_r64 %_116~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_625
 ; {>  %_623~{  }:{ } %_115~2':_r64 %_625~°0◂0':(_opn)◂((_p250)◂({ })) %_116~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_1274
	mov rdi,r8
	call dlt
LB_1274:
	bt r12,1
	jc LB_1275
	mov rdi,r14
	call dlt
LB_1275:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1276
	btr r12,3
	jmp LB_1277
LB_1276:
	bts r12,3
LB_1277:
	mov r8,0
	bts r12,2
	ret
LB_1278:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1280
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1279
LB_1280:
	add rsp,8
	ret
LB_1281:
	add rsp,32
	pop r14
LB_1279:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 13
	push LB_1335
	push LB_1335
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _nil {  } ⊢ %_633 : %_633
 ; {>  %_119~1':_r64 %_120~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; 	» "blk_cmt 1" _ ⊢ 2' : %_634
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_74_6d_63_5f_6b_6c_62
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r8,rdi
	btr r12,2
; _cns { { %_120 %_119 %_634 } %_633 } ⊢ %_635 : %_635
 ; {>  %_634~2':_stg %_119~1':_r64 %_120~0':_r64 %_633~°1◂{  }:(_lst)◂(t638''(0)) }
; _cns { { 0' 1' 2' } °1◂{  } } ⊢ °0◂{ { 0' 1' 2' } °1◂{  } }
; _f252 %_635 ⊢ %_636 : %_636
 ; {>  %_635~°0◂{ { 0' 1' 2' } °1◂{  } }:(_lst)◂({ _r64 _r64 _stg }) }
; _f252 °0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _some %_636 ⊢ %_637 : %_637
 ; {>  %_636~°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_p250)◂(t647''(0)) }
; _some °1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; ∎ %_637
 ; {>  %_637~°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }:(_opn)◂((_p250)◂(t651''(0))) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' 2' } °1◂{  } } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0003_0200_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_1321
	btr r12,5
	jmp LB_1322
LB_1321:
	bts r12,5
LB_1322:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_1319
	btr QWORD [rdi],0
	jmp LB_1320
LB_1319:
	bts QWORD [rdi],0
LB_1320:
	mov r11,r14
	bt r12,1
	jc LB_1325
	btr r12,5
	jmp LB_1326
LB_1325:
	bts r12,5
LB_1326:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_1323
	btr QWORD [rdi],1
	jmp LB_1324
LB_1323:
	bts QWORD [rdi],1
LB_1324:
	mov r11,r8
	bt r12,2
	jc LB_1329
	btr r12,5
	jmp LB_1330
LB_1329:
	bts r12,5
LB_1330:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_1327
	btr QWORD [rdi],2
	jmp LB_1328
LB_1327:
	bts QWORD [rdi],2
LB_1328:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_1317
	btr QWORD [rdi],0
	jmp LB_1318
LB_1317:
	bts QWORD [rdi],0
LB_1318:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rdi,0x0000_0001_0102_ffff
	bt r12,4
	jc LB_1333
	and rdi,~0x1
	bt r10,0
	jc LB_1333
	jmp LB_1334
LB_1333:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_1334:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_1331
	btr QWORD [rdi],1
	jmp LB_1332
LB_1331:
	bts QWORD [rdi],1
LB_1332:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1315
	and rdi,~0x1
	bt r9,0
	jc LB_1315
	jmp LB_1316
LB_1315:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1316:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,0x0000_0001_0102_ffff
	bt r12,3
	jc LB_1313
	and rdi,~0x1
	bt r9,0
	jc LB_1313
	jmp LB_1314
LB_1313:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_1314:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_1335:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1337
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1336
LB_1337:
	add rsp,8
	ret
LB_1338:
	add rsp,0
	pop r14
LB_1336:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_DST_ID_350: dq 1
NS_E_SRC_ID_350: dq 0
NS_E_350:
NS_E_RDI_350:
NS_E_350_ETR_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	jmp LB_1351
LB_1350:
	add r14,1
LB_1351:
	cmp r14,r10
	jge LB_1352
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1350
	cmp al,32
	jz LB_1350
LB_1352:
	add r14,1
	cmp r14,r10
	jg LB_1355
	movzx rax,BYTE [r13+r14+8*1+0-1]
	cmp al,10
	jnz LB_1355
	jmp LB_1356
LB_1355:
	jmp LB_1347
LB_1356:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1348
	btr r12,0
	clc
	jmp LB_1349
LB_1348:
	bts r12,0
	stc
LB_1349:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push 14
	push LB_1344
	push LB_1344
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_656 : %_656
 ; {>  %_123~1':_r64 %_124~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_656
 ; {>  %_123~1':_r64 %_656~°0◂{  }:(_opn)◂({ }) %_124~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_1342
	mov rdi,r14
	call dlt
LB_1342:
	bt r12,0
	jc LB_1343
	mov rdi,r13
	call dlt
LB_1343:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_1344:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1346
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1345
LB_1346:
	add rsp,8
	ret
LB_1347:
	add rsp,16
	pop r14
LB_1345:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	jmp LB_1372
LB_1371:
	add r14,1
LB_1372:
	cmp r14,r10
	jge LB_1373
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1371
	cmp al,32
	jz LB_1371
LB_1373:
	push r10
	call NS_E_136_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1374
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1366
LB_1374:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_res
	jmp LB_1377
LB_1376:
	add r14,1
LB_1377:
	cmp r14,r10
	jge LB_1378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_1376
	cmp al,32
	jz LB_1376
LB_1378:
	push r10
	call NS_E_350_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1379
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1380
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1380:
	jmp LB_1366
LB_1379:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1369
	btr r12,1
	clc
	jmp LB_1370
LB_1369:
	bts r12,1
	stc
LB_1370:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1367
	btr r12,0
	clc
	jmp LB_1368
LB_1367:
	bts r12,0
	stc
LB_1368:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push 15
	push LB_1363
	push LB_1363
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	mov rax,QWORD [rsp+8*5]
	mov r14,rax
	bts r12,1
	bts r12,2
; _some {  } ⊢ %_662 : %_662
 ; {>  %_127~2':_r64 %_661~{  }:{ } %_128~1':_r64 %_660~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_662
 ; {>  %_127~2':_r64 %_662~°0◂{  }:(_opn)◂({ }) %_661~{  }:{ } %_128~1':_r64 %_660~0':_r64 }
; 	∎ °0◂{  }
	bt r12,2
	jc LB_1360
	mov rdi,r8
	call dlt
LB_1360:
	bt r12,1
	jc LB_1361
	mov rdi,r14
	call dlt
LB_1361:
	bt r12,0
	jc LB_1362
	mov rdi,r13
	call dlt
LB_1362:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_1363:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1365
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1364
LB_1365:
	add rsp,8
	ret
LB_1366:
	add rsp,32
	pop r14
LB_1364:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push 16
	push LB_1387
	push LB_1387
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	mov rax,QWORD [rsp+8*5]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some {  } ⊢ %_670 : %_670
 ; {>  %_131~1':_r64 %_132~0':_r64 }
; _some {  } ⊢ °0◂{  }
; ∎ %_670
 ; {>  %_131~1':_r64 %_670~°0◂{  }:(_opn)◂({ }) %_132~0':_r64 }
; 	∎ °0◂{  }
	bt r12,1
	jc LB_1385
	mov rdi,r14
	call dlt
LB_1385:
	bt r12,0
	jc LB_1386
	mov rdi,r13
	call dlt
LB_1386:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂{  } ⊢ 2'◂3'
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,0
	bts r12,2
	ret
LB_1387:
	add rsp,16
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1389
	pop r14
	mov rdi,r9
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	jmp LB_1388
LB_1389:
	add rsp,8
	ret
LB_1390:
	add rsp,0
	pop r14
LB_1388:
	mov rax,QWORD [SFLS_TBL+8*0]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*0],rdi
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1391:
; 	|» 0'
NS_E_RDI_1391:
; _f56 %_1392 ⊢ %_1393 : %_1393
 ; {>  %_1392~0':_r64 }
	add r13,1
; _f1391	%_1393 ⊢|
 ; {>  %_1393~0':_r64 }
; _f1391 0' ⊢|
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	mov rdi,[rsp+16]
	mov rax,QWORD [MOV_TBL+8*MOV_OFS_17+8*rdi]
	mov [rsp],rax
	jmp NS_E_1391
NS_E_1428:
NS_E_RDI_1428:
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
; » 0xr0 |~ {  } ⊢ %_1407 : %_1407
 ; {>  %_1406~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1407
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f346 { %_1406 %_1407 } ⊢ { %_1408 %_1409 %_1410 } : { %_1408 %_1409 %_1410 }
 ; {>  %_1406~0':_stg %_1407~1':_r64 }
; _f346 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	push -1
	push LB_1437
	call NS_E_346
LB_1437:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_1431
	btr r12,4
	jmp LB_1432
LB_1431:
	bts r12,4
LB_1432:
	mov r8,r9
	bt r12,3
	jc LB_1435
	btr r12,2
	jmp LB_1436
LB_1435:
	bts r12,2
LB_1436:
	mov rdi,0x0000_0001_0102_ffff
	bt r12,2
	jc LB_1433
	and rdi,~0x1
	bt r8,0
	jc LB_1433
	jmp LB_1434
LB_1433:
	push rdi
	mov rax,QWORD [SFLS_TBL+8*1]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*1],rdi
	pop QWORD [rax]
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_1434:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_1409 %_1410 } ⊢ { %_1411 %_1412 } : { %_1411 %_1412 }
 ; {>  %_1409~1':_r64 %_1408~0':_stg %_1410~2':(_opn)◂((_p250)◂({ })) }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,QWORD [SFLS_TBL+8*2]
	mov rdi,QWORD [rax]
	mov QWORD [SFLS_TBL+8*2],rdi
	mov rdi,0x0000_0002_0200_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_1445
	btr r12,3
	jmp LB_1446
LB_1445:
	bts r12,3
LB_1446:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1443
	btr QWORD [rdi],0
	jmp LB_1444
LB_1443:
	bts QWORD [rdi],0
LB_1444:
	mov r9,r8
	bt r12,2
	jc LB_1449
	btr r12,3
	jmp LB_1450
LB_1449:
	bts r12,3
LB_1450:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1447
	btr QWORD [rdi],1
	jmp LB_1448
LB_1447:
	bts QWORD [rdi],1
LB_1448:
	push -1
	push LB_1459
	call NS_E_38
LB_1459:
	add rsp,16
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1453
	btr r12,3
	clc
	jmp LB_1454
LB_1453:
	bts r12,3
	stc
LB_1454:
	mov r14,r9
	bt r12,3
	jc LB_1451
	btr r12,1
	jmp LB_1452
LB_1451:
	bts r12,1
LB_1452:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1457
	btr r12,3
	clc
	jmp LB_1458
LB_1457:
	bts r12,3
	stc
LB_1458:
	mov r8,r9
	bt r12,3
	jc LB_1455
	btr r12,2
	jmp LB_1456
LB_1455:
	bts r12,2
LB_1456:
	mov rdi,r13
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1441
	btr r12,0
	clc
	jmp LB_1442
LB_1441:
	bts r12,0
	stc
LB_1442:
	add rsp,16
; ∎ {  }
 ; {>  %_1411~1':_r64 %_1408~0':_stg %_1412~2':(_opn)◂((_p250)◂({ })) }
; 	∎ {  }
	bt r12,1
	jc LB_1460
	mov rdi,r14
	call dlt
LB_1460:
	bt r12,0
	jc LB_1461
	mov rdi,r13
	call dlt
LB_1461:
	bt r12,2
	jc LB_1462
	mov rdi,r8
	call dlt
LB_1462:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MOV_0_0:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_0_17:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_1_1:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_1_17:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_17_0:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_17_1:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
MOV_17_2:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1489
	bt QWORD [rax],0
	jc LB_1490
	btr r12,1
	clc
	jmp LB_1491
LB_1490:
	bts r12,1
	stc
LB_1491:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1489:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1492
	btr r12,3
	jmp LB_1493
LB_1492:
	bts r12,3
LB_1493:
	jmp QWORD [rsp]
MOV_17_3:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1495
	bt QWORD [rax],0
	jc LB_1496
	btr r12,1
	clc
	jmp LB_1497
LB_1496:
	bts r12,1
	stc
LB_1497:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1495:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1498
	btr r12,3
	jmp LB_1499
LB_1498:
	bts r12,3
LB_1499:
	jmp QWORD [rsp]
MOV_17_4:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1501
	bt QWORD [rax],0
	jc LB_1502
	btr r12,1
	clc
	jmp LB_1503
LB_1502:
	bts r12,1
	stc
LB_1503:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1501:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1504
	btr r12,3
	jmp LB_1505
LB_1504:
	bts r12,3
LB_1505:
	jmp QWORD [rsp]
MOV_17_5:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1507
	bt QWORD [rax],0
	jc LB_1508
	btr r12,1
	clc
	jmp LB_1509
LB_1508:
	bts r12,1
	stc
LB_1509:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1507:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1510
	btr r12,3
	jmp LB_1511
LB_1510:
	bts r12,3
LB_1511:
	jmp QWORD [rsp]
MOV_17_6:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1513
	bt QWORD [rax],0
	jc LB_1514
	btr r12,1
	clc
	jmp LB_1515
LB_1514:
	bts r12,1
	stc
LB_1515:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1513:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1516
	btr r12,3
	jmp LB_1517
LB_1516:
	bts r12,3
LB_1517:
	jmp QWORD [rsp]
MOV_17_7:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1519
	bt QWORD [rax],0
	jc LB_1520
	btr r12,1
	clc
	jmp LB_1521
LB_1520:
	bts r12,1
	stc
LB_1521:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1519:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1522
	btr r12,3
	jmp LB_1523
LB_1522:
	bts r12,3
LB_1523:
	jmp QWORD [rsp]
MOV_17_8:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1525
	bt QWORD [rax],0
	jc LB_1526
	btr r12,1
	clc
	jmp LB_1527
LB_1526:
	bts r12,1
	stc
LB_1527:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1525:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1528
	btr r12,3
	jmp LB_1529
LB_1528:
	bts r12,3
LB_1529:
	jmp QWORD [rsp]
MOV_17_9:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1531
	bt QWORD [rax],0
	jc LB_1532
	btr r12,1
	clc
	jmp LB_1533
LB_1532:
	bts r12,1
	stc
LB_1533:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1531:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1534
	btr r12,3
	jmp LB_1535
LB_1534:
	bts r12,3
LB_1535:
	jmp QWORD [rsp]
MOV_17_10:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1537
	bt QWORD [rax],0
	jc LB_1538
	btr r12,1
	clc
	jmp LB_1539
LB_1538:
	bts r12,1
	stc
LB_1539:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1537:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1540
	btr r12,3
	jmp LB_1541
LB_1540:
	bts r12,3
LB_1541:
	jmp QWORD [rsp]
MOV_17_11:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1543
	bt QWORD [rax],0
	jc LB_1544
	btr r12,1
	clc
	jmp LB_1545
LB_1544:
	bts r12,1
	stc
LB_1545:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1543:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1546
	btr r12,3
	jmp LB_1547
LB_1546:
	bts r12,3
LB_1547:
	jmp QWORD [rsp]
MOV_17_12:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1549
	bt QWORD [rax],0
	jc LB_1550
	btr r12,1
	clc
	jmp LB_1551
LB_1550:
	bts r12,1
	stc
LB_1551:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1549:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1552
	btr r12,3
	jmp LB_1553
LB_1552:
	bts r12,3
LB_1553:
	jmp QWORD [rsp]
MOV_17_13:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1555
	bt QWORD [rax],0
	jc LB_1556
	btr r12,1
	clc
	jmp LB_1557
LB_1556:
	bts r12,1
	stc
LB_1557:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1555:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1558
	btr r12,3
	jmp LB_1559
LB_1558:
	bts r12,3
LB_1559:
	jmp QWORD [rsp]
MOV_17_14:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1561
	bt QWORD [rax],0
	jc LB_1562
	btr r12,1
	clc
	jmp LB_1563
LB_1562:
	bts r12,1
	stc
LB_1563:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1561:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1564
	btr r12,3
	jmp LB_1565
LB_1564:
	bts r12,3
LB_1565:
	jmp QWORD [rsp]
MOV_17_15:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1567
	bt QWORD [rax],0
	jc LB_1568
	btr r12,1
	clc
	jmp LB_1569
LB_1568:
	bts r12,1
	stc
LB_1569:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1567:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1570
	btr r12,3
	jmp LB_1571
LB_1570:
	bts r12,3
LB_1571:
	jmp QWORD [rsp]
MOV_17_16:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'◂3'
; 0' ⊢ 2'◂3'
	btr r12,1
	mov r8,r13
	shr r8,56
	bts r12,2
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1573
	bt QWORD [rax],0
	jc LB_1574
	btr r12,1
	clc
	jmp LB_1575
LB_1574:
	bts r12,1
	stc
LB_1575:
	mov rdi,QWORD [rax+8*1]
	push rdi
	mov rdi,rax
	movzx rax,BYTE [rdi+3]
	mov rsi,QWORD [SFLS_TBL+8*rax]
	mov QWORD [rdi],rsi
	mov QWORD [SFLS_TBL+8*rax],rdi
	pop rax
LB_1573:
	mov r14,rax
	mov r9,r14
	bt r12,1
	jc LB_1576
	btr r12,3
	jmp LB_1577
LB_1576:
	bts r12,3
LB_1577:
	jmp QWORD [rsp]
MOV_17_17:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	jmp QWORD [rsp]
section .data
MOV_TBL:
	dq MOV_0_0
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
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq MOV_0_17
	dq MOV_1_1
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
	dq NULL
	dq NULL
	dq NULL
	dq NULL
	dq MOV_1_17
	dq MOV_17_0
	dq MOV_17_1
	dq MOV_17_2
	dq MOV_17_3
	dq MOV_17_4
	dq MOV_17_5
	dq MOV_17_6
	dq MOV_17_7
	dq MOV_17_8
	dq MOV_17_9
	dq MOV_17_10
	dq MOV_17_11
	dq MOV_17_12
	dq MOV_17_13
	dq MOV_17_14
	dq MOV_17_15
	dq MOV_17_16
	dq MOV_17_17
	CST_DYN_1428:
		dq 0x0000_0001_00_82_ffff
		dq 1
