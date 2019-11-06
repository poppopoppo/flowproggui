%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_210
	mov QWORD [CST_DYN_210+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_210],rbx
	call NS_E_273
	mov QWORD [CST_DYN_273+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_273],rbx
	call NS_E_330
	mov QWORD [CST_DYN_330+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_330],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_253
	call exec_out
	jmp _end
NS_E_206:
NS_E_RDI_206:
NS_E_206_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_206_LB_0
	bt r11,7
	jc LB_207
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,1
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_207:
	add rsi,1
	bt r11,6
	jc LB_208
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,2
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_208:
	add rsi,1
	bt r11,5
	jc LB_209
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,3
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_209:
	add rsi,1
	bt r11,5
	jc LB_209
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,4
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11b,[rdi+rsi+8*1+3]
	mov BYTE [r10+8*1+3],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
	add rsi,1
	mov rax,1
	ret
NS_E_206_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_14:
	mov rdi,r8
	bt r12,0
NS_E_RDI_14:
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
NS_E_210:
NS_E_RDI_210:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn 0'
; unboxed
; 	» "ABCDfokfkfkf\t" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`ABCDfokf`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],107
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],107
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],9
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_214
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_215
emt_set_ptn_0_LB_214:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_215:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_216
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_216:
; 	_pp_v 1' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex  2'~s0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_217
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_218
emt_set_ptn_0_LB_217:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_218:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_220
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_228
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_229
emt_set_ptn_0_LB_228:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_229:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_221
call_c_LB_220:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_224
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_225
emt_set_ptn_0_LB_224:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_225:
call_nc_LB_221:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_230
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_231
emt_get_ptn_0_LB_230:
; unboxed
	stc
emt_get_ptn_1_LB_231:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_232
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_232:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_233
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_233:
; 	» "\nHOO\n" |~ 1' : _stg
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,5
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov BYTE [rdi+8*1+rsi],72
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r8
	mov r9,rbx
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 1',s1
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_234
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_235
emt_set_ptn_0_LB_234:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_235:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_236
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_236:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_LB_237
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_238
emt_get_ptn_0_LB_237:
; unboxed
	stc
emt_get_ptn_1_LB_238:
	mov QWORD r9,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_239
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_239:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_240
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_240:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
	clc
	jc ret_LB_241
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_241:
;clear  2'~s0 0'~x0
	bt r12,2
	jc clear_LB_242
;push_reg
	push QWORD r8
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r8
clear_LB_242:
	bt r12,0
	jc clear_LB_243
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_243:
	mov rax,r9
	stc
	ret
NS_E_244:
; 	|» {  }
	jz NS_E_RDI_244
	jc emt_etr_c_LB_245
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_244
emt_etr_c_LB_245:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_244:
; 	» "xyz" |~ 0' : _stg
;push_reg
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],121
	add rsi,1
	mov BYTE [rdi+8*1+rsi],122
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_246
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_247
emt_set_ptn_0_LB_246:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_247:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_248
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_248:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_250
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_251
emt_get_crt_ptn_0_LB_250:
; unboxed
	stc
emt_get_crt_ptn_1_LB_251:
	mov QWORD r8,r9
	jc ret_LB_252
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_249
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_249:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_252:
;clear 
	mov rax,r8
	stc
	ret
NS_E_253:
; 	|» {  }
	jz NS_E_RDI_253
	jc emt_etr_c_LB_254
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_253
emt_etr_c_LB_254:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_253:
; 	f0 {  } ⊢ -2' : _stg
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_244
	mov QWORD [tmp],rax
	jc call_c_LB_255
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; _
	pop rdi
	call dec_r
	jmp call_nc_LB_256
call_c_LB_255:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; _
call_nc_LB_256:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,14
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Hello Wo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],114
	add rsi,1
	mov BYTE [rdi+8*1+rsi],108
	add rsi,1
	mov BYTE [rdi+8*1+rsi],100
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_257
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_258
emt_set_ptn_0_LB_257:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_258:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_259
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_259:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Foo Baoo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 0',s1
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_260
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_261
emt_set_ptn_0_LB_260:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_261:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_262
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_262:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,25
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,r10
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,2
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	mov r14,0
; "Ab"
	mov BYTE [r13+8*1+r14],65
	add r14,1
	mov BYTE [r13+8*1+r14],98
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_263:
	mov bl,[r15]
	cmp rbx,0
	jz LB_264
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_263
LB_264:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_265:
	mov bl,[r15]
	cmp rbx,0
	jz LB_266
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_265
LB_266:
; 1'
	mov r15,r10
	add r15,8
LB_267:
	mov bl,[r15]
	cmp rbx,0
	jz LB_268
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_267
LB_268:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; " mov r0,r1"
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],111
	add r14,1
	mov BYTE [r13+8*1+r14],118
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],49
	add r14,1
; " add r3,r5 "
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],97
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],51
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],53
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_LB_269
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_LB_269:
;clear  2'~s1 0'~sr 1'~s0
	bt r12,2
	jc clear_LB_270
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_LB_270:
	bt r12,0
	jc clear_LB_271
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_271:
	bt r12,1
	jc clear_LB_272
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_272:
	mov rax,r11
	stc
	ret
NS_E_273:
NS_E_RDI_273:
; 	» 0xrf |~ 0' : _r64
	mov QWORD r9,0xf
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn 0'
; unboxed
; 	? 1'
; 	∐\ x0 ,,x0=0xr0
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_277
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_278
LB_277:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_278:
; x0=0xr0
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0x0
	cmp r14,rbx
	jnz LB_279
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_280
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_280:
; 	» "A\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],65
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_281
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_282
emt_set_ptn_0_LB_281:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_282:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_283
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_283:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_284
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_285
emt_get_ptn_0_LB_284:
; unboxed
	stc
emt_get_ptn_1_LB_285:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_286
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_286:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_287
;push_reg
	call exec_out
;pop_reg
LB_287:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_288
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_288:
;clear 
	mov rax,r8
	stc
	ret
LB_279:
; 	∐\ x0 ,,x0=0xr1
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_289
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_290
LB_289:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_290:
; x0=0xr1
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0x1
	cmp r14,rbx
	jnz LB_291
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_292
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_292:
; 	» "B\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],66
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_293
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_294
emt_set_ptn_0_LB_293:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_294:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_295
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_295:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_296
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_297
emt_get_ptn_0_LB_296:
; unboxed
	stc
emt_get_ptn_1_LB_297:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_298
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_298:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_299
;push_reg
	call exec_out
;pop_reg
LB_299:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_300
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_300:
;clear 
	mov rax,r8
	stc
	ret
LB_291:
; 	∐\ x0 ,
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_301
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_302
LB_301:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_302:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r8,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_304
	btr r12,0
	bt r13,0
	jnc LB_306
	mov r14,0x00ff_ffff_ffff_fffc
	and r13,r14
LB_306:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_305
LB_304:
	bts r12,0
LB_305:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_307
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_307:
	mov r8,QWORD [regs_vct+8*0]
; 	_pp_v 0' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_308
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_309
emt_set_ptn_0_LB_308:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_309:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_311
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_319
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_320
emt_set_ptn_0_LB_319:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_320:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_312
call_c_LB_311:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_315
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_316
emt_set_ptn_0_LB_315:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_316:
call_nc_LB_312:
; » _^ ..
;push_reg
	push QWORD r8
	push QWORD r9
	mov rbx,6
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	mov r14,0
; "x0 = "
	mov BYTE [r13+8*1+r14],120
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],61
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_321:
	mov bl,[r15]
	cmp rbx,0
	jz LB_322
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_321
LB_322:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r10,r13
	btr r12,2
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_323
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_324
emt_get_ptn_0_LB_323:
; unboxed
	stc
emt_get_ptn_1_LB_324:
	mov QWORD r11,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_325
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_325:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_326
;push_reg
	push QWORD r8
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
	pop QWORD r8
LB_326:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,0
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_LB_327
	push r10
; ; emt_dec_ptn {  }
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_LB_327:
;clear  0'~x0 1'~s0
	bt r12,0
	jc clear_LB_328
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_328:
	bt r12,1
	jc clear_LB_329
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_329:
	mov rax,r10
	stc
	ret
LB_303:
	jmp err
NS_E_330:
NS_E_RDI_330:
; 	» "ABCDefgefefef" |~ 0' : _stg
;push_reg
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`ABCDefge`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],101
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],101
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_331
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_332
emt_set_ptn_0_LB_331:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_332:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_333
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_333:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r10,0xff
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	? { 2' 1' }
; 	∐\ { x0 s0 } ,,s0="ABCDefgefefef",x0=0xrf9
; ; emt_mtc_set

; emt_mtc_set
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_337
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_338
LB_337:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_338:
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_339
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*1],rbx
	mov QWORD [mtc_vct_0+16*1],0
	jmp LB_340
LB_339:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*1],rbx
	mov QWORD [mtc_vct_0+16*1],1
LB_340:
; s0="ABCDefgefefef"
	mov r14,QWORD [mtc_vct_0+8*1+16*1]
	mov rbx,[r14]
	shr rbx,32
	and rbx,0xffff
	cmp rbx,2
	jnz LB_341
	mov rbx,`ABCDefge`
	mov QWORD r13,[r14+8*1]
	cmp rbx,r13
	jnz LB_341
	mov rbx,`fefef`
	mov QWORD r13,[r14+8*2]
	cmp rbx,r13
	jnz LB_341
; x0=0xrf9
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0xf9
	cmp r14,rbx
	jnz LB_341
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_342
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_342:
	bt r12,2
	jc LB_343
	mov rdi,QWORD [regs_vct+8*2]
	call dec_r
LB_343:
; 	» "X\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],88
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,sr : ,_stg
; emt_ptn_crt_ptn 0',sr
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_344
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_345
emt_set_ptn_0_LB_344:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_345:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_346
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_346:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_347
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_348
emt_get_ptn_0_LB_347:
; unboxed
	stc
emt_get_ptn_1_LB_348:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_349
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_349:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_350
;push_reg
	call exec_out
;pop_reg
LB_350:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_351
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_351:
;clear 
	mov rax,r8
	stc
	ret
LB_341:
; 	∐\ p0 ,
; ; emt_mtc_set

; emt_get_crt_ptn { 2' 1' }
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 2'
	mov QWORD r11,r10
	stc
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_353
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_354
emt_get_crt_ptn_0_LB_353:
; unboxed
	stc
emt_get_crt_ptn_1_LB_354:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	clc
	and r12,~0b1
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_355
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_355:
	bt r12,2
	jc LB_356
	mov rdi,QWORD [regs_vct+8*2]
	call dec_r
LB_356:
	mov r8,QWORD [regs_vct+8*0]
; 	_pp_v 0' ⊢ { 0' 1' } : { { _r64 _stg } _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r9,r8
	btr r12,1
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_357
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_358
emt_set_ptn_0_LB_357:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_358:
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_360
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; boxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_368
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_369
emt_set_ptn_0_LB_368:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_369:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_361
call_c_LB_360:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; boxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_364
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_365
emt_set_ptn_0_LB_364:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_365:
call_nc_LB_361:
; » _^ ..
;push_reg
	push QWORD r8
	push QWORD r9
	mov rbx,4
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	mov r14,0
; "p0="
	mov BYTE [r13+8*1+r14],112
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],61
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_370:
	mov bl,[r15]
	cmp rbx,0
	jz LB_371
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_370
LB_371:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r10,r13
	btr r12,2
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_372
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_373
emt_get_ptn_0_LB_372:
; unboxed
	stc
emt_get_ptn_1_LB_373:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_374
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_374:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_375
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_375:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_376
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_377
emt_get_ptn_0_LB_376:
; unboxed
	stc
emt_get_ptn_1_LB_377:
	mov QWORD r9,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_378
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_378:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_379
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_379:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	jc ret_LB_380
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_380:
;clear  0'~p0
	bt r12,0
	jc clear_LB_381
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_381:
	mov rax,r9
	stc
	ret
LB_352:
	jmp err
section .data
	NS_E_DYN_206:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_206
	CST_DYN_210:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_244:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_244
	NS_E_DYN_253:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_253
	CST_DYN_273:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_330:
		dq 0x0001_0001_00_82_ffff
		dq 1
