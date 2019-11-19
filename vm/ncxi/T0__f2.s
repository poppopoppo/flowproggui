%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_329
	mov QWORD [CST_DYN_329+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_329],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_385
	call exec_out
	jmp _end
NS_E_325:
NS_E_RDI_325:
NS_E_325_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_325_LB_0
	bt r11,7
	jc LB_326
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
LB_326:
	add rsi,1
	bt r11,6
	jc LB_327
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
LB_327:
	add rsi,1
	bt r11,5
	jc LB_328
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
LB_328:
	add rsi,1
	bt r11,5
	jc LB_328
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
NS_E_325_LB_0:
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
NS_E_329:
NS_E_RDI_329:
	mov QWORD r8,0
	bts r12,0
; emt_ptn_crt_ptn { 0' {  } },o0
; emt_get_crt_ptn { 0' {  } }
;push_reg
	push QWORD r8
	mov rdi,2
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_LB_330
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_331
emt_get_crt_ptn_0_LB_330:
; unboxed
	stc
emt_get_crt_ptn_1_LB_331:
	mov QWORD r10,r8
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
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
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,1
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
	mov QWORD r8,0
	bts r12,0
; emt_ptn_crt_ptn { 0' {  } },o1
; emt_get_crt_ptn { 0' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_LB_332
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_333
emt_get_crt_ptn_0_LB_332:
; unboxed
	stc
emt_get_crt_ptn_1_LB_333:
	mov QWORD r11,r8
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
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
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn {  }
	mov QWORD r8,0
	bts r12,0
; emt_ptn_crt_ptn { 0' 2' },o1
; emt_get_crt_ptn { 0' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_LB_334
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_335
emt_get_crt_ptn_0_LB_334:
; unboxed
	stc
emt_get_crt_ptn_1_LB_335:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_LB_336
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_337
emt_get_crt_ptn_0_LB_336:
; unboxed
	stc
emt_get_crt_ptn_1_LB_337:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_338
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_LB_338:
	mov QWORD r8,0
	bts r12,0
; emt_ptn_crt_ptn { 0' 3' },o1
; emt_get_crt_ptn { 0' 3' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD r10
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_LB_339
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_340
emt_get_crt_ptn_0_LB_339:
; unboxed
	stc
emt_get_crt_ptn_1_LB_340:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD r10
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_LB_341
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_342
emt_get_crt_ptn_0_LB_341:
; unboxed
	stc
emt_get_crt_ptn_1_LB_342:
	mov QWORD rcx,r11
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_343
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_LB_343:
; 	_pp_v 2' ⊢ { 0' 2' } : { (_opn)◂((_opn)◂((_opn)◂(t216'(0)))) _stg }
; push_s_ex  1'~o0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_344
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_345
emt_set_ptn_0_LB_344:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_345:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_346
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_346:
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_347
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_353
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_354
emt_set_ptn_0_LB_353:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_354:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_355
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_356
emt_set_ptn_0_LB_355:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_356:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_348
call_c_LB_347:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_349
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_350
emt_set_ptn_0_LB_349:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_350:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_351
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_352
emt_set_ptn_0_LB_351:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_352:
call_nc_LB_348:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_357
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_358
emt_get_ptn_0_LB_357:
; unboxed
	stc
emt_get_ptn_1_LB_358:
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
	jc emt_dec_ptn_0_LB_359
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
emt_dec_ptn_0_LB_359:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_360
;push_reg
	push QWORD r8
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
	pop QWORD r8
LB_360:
; 	? 1'
; 	∐\ o0 ,,o0=_none◂{  }
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_361
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_362
LB_361:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_362:
; o0=_none◂{  }
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,0
	jnz LB_363
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffc
	and r13,r14
	bt QWORD [r13],16
	jc LB_364
	bt QWORD [r13],17
	jnc LB_364
	mov r13,QWORD [r13+8*1]
LB_364:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
; ; 	? 1'

	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_365
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_365:
	mov r8,QWORD [regs_vct+8*0]
; 	» "t\n" |~ 1' : _stg
;push_reg
	push QWORD r8
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],116
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r8
	mov r9,rbx
	and r12,~0b10
; 	$ 1' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 1',s0
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_366
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_367
emt_set_ptn_0_LB_366:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_367:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_368
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
emt_dec_ptn_0_LB_368:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_369
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_370
emt_get_ptn_0_LB_369:
; unboxed
	stc
emt_get_ptn_1_LB_370:
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
	jc emt_dec_ptn_0_LB_371
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_371:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_372
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_372:
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
	jc ret_LB_373
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_373:
;clear  0'~o1
	bt r12,0
	jc clear_LB_374
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_374:
	mov rax,r9
	stc
	ret
LB_363:
; 	∐\ o0 ,
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_375
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_376
LB_375:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_376:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r10,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_378
	btr r12,2
	bt r13,0
	jnc LB_380
	mov r14,0x00ff_ffff_ffff_fffc
	and r13,r14
LB_380:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_379
LB_378:
	bts r12,2
LB_379:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_381
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_381:
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
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
	jc ret_LB_382
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_382:
;clear  2'~o0 0'~o1
	bt r12,2
	jc clear_LB_383
;push_reg
	push QWORD r8
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r8
clear_LB_383:
	bt r12,0
	jc clear_LB_384
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_384:
	mov rax,r9
	stc
	ret
LB_377:
	jmp err
NS_E_385:
; 	|» {  }
	jz NS_E_RDI_385
	jc emt_etr_c_LB_386
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
jmp NS_E_RDI_385
emt_etr_c_LB_386:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_385:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_387
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_387:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_325:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_325
	CST_DYN_329:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_385:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_385
