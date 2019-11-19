%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_325
	mov QWORD [CST_DYN_325+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_325],rbx
	call NS_E_366
	mov QWORD [CST_DYN_366+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_366],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_363
	call exec_out
	jmp _end
NS_E_319:
NS_E_RDI_319:
NS_E_319_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_319_LB_0
	bt r11,7
	jc LB_320
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
LB_320:
	add rsi,1
	bt r11,6
	jc LB_321
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
LB_321:
	add rsi,1
	bt r11,5
	jc LB_322
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
LB_322:
	add rsi,1
	bt r11,5
	jc LB_322
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
NS_E_319_LB_0:
	mov rax,0
	ret
NS_E_14:
NS_E_RDI_14:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_18:
	mov rdi,r8
	bt r12,0
NS_E_RDI_18:
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
NS_E_325:
NS_E_RDI_325:
	btr r12,0
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	lea QWORD rbx,[unt]
	mov r8,rbx
	mov rbx,0x0100_0000_0000_0001
	add r8,rbx
	btr r12,0
	mov rbx,r8
	bt r12,0
	jc LB_326
	bt rbx,0
	jc LB_327
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r8,rbx
	jmp LB_328
LB_326:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
	jmp LB_328
LB_327:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
LB_328:
	btr r12,0
	mov rbx,r8
	bt r12,0
	jc LB_329
	bt rbx,0
	jc LB_330
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r8,rbx
	jmp LB_331
LB_329:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
	jmp LB_331
LB_330:
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r8,rax
LB_331:
; 	? 0'
; 	∐\ o0 ,,o0=_some◂o2,o2=_some◂o3
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_332
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_333
LB_332:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_333:
; o0=_some◂o2
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,0
	jnz LB_334
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
	bt QWORD [r13],16
	jc LB_335
	bt QWORD [r13],17
	jnc LB_335
	mov r13,QWORD [r13+8*1]
LB_335:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_336
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_337
LB_336:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_337:
; o2=_some◂o3
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,0
	jnz LB_334
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
	bt QWORD [r13],16
	jc LB_338
	bt QWORD [r13],17
	jnc LB_338
	mov r13,QWORD [r13+8*1]
LB_338:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_339
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_340
LB_339:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_340:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r9,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_341
	btr r12,1
	bt r13,0
	jnc LB_343
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
LB_343:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_342
LB_341:
	bts r12,1
LB_342:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_344
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_344:
	mov r9,QWORD [regs_vct+8*1]
; 	» "thhhh\n" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],116
	add rsi,1
	mov BYTE [rdi+8*1+rsi],104
	add rsi,1
	mov BYTE [rdi+8*1+rsi],104
	add rsi,1
	mov BYTE [rdi+8*1+rsi],104
	add rsi,1
	mov BYTE [rdi+8*1+rsi],104
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
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
	jc emt_set_ptn_0_LB_345
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_346
emt_set_ptn_0_LB_345:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_346:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_347
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
emt_dec_ptn_0_LB_347:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_348
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_349
emt_get_ptn_0_LB_348:
; unboxed
	stc
emt_get_ptn_1_LB_349:
	mov QWORD r8,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_350
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_LB_350:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_351
;push_reg
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
LB_351:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_352
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_352:
;clear  1'~o3
	bt r12,1
	jc clear_LB_353
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_353:
	mov rax,r8
	stc
	ret
LB_334:
; 	∐\ o0 ,
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_354
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_355
LB_354:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_355:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r9,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_357
	btr r12,1
	bt r13,0
	jnc LB_359
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
LB_359:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_358
LB_357:
	bts r12,1
LB_358:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_360
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_360:
	mov r9,QWORD [regs_vct+8*1]
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_361
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_361:
;clear  1'~o0
	bt r12,1
	jc clear_LB_362
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_362:
	mov rax,r8
	stc
	ret
LB_356:
	jmp err
NS_E_363:
; 	|» {  }
	jz NS_E_RDI_363
	jc emt_etr_c_LB_364
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
jmp NS_E_RDI_363
emt_etr_c_LB_364:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_363:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_365
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_365:
;clear 
	mov rax,r8
	stc
	ret
NS_E_366:
NS_E_RDI_366:
; 	» "A" |~ 0' : _stg
;push_reg
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],65
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
	jc emt_set_ptn_0_LB_367
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_368
emt_set_ptn_0_LB_367:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_368:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_369
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_369:
; » _^ ..
;push_reg
	push QWORD r9
	mov rbx,44
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
	imul r14,0
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
	mov r14,0
; "HELLO"
	mov BYTE [r13+8*1+r14],72
	add r14,1
	mov BYTE [r13+8*1+r14],69
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],79
	add r14,1
; " FOO "
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],70
	add r14,1
	mov BYTE [r13+8*1+r14],79
	add r14,1
	mov BYTE [r13+8*1+r14],79
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; "HELLO"
	mov BYTE [r13+8*1+r14],72
	add r14,1
	mov BYTE [r13+8*1+r14],69
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],79
	add r14,1
; "FJFJF\njjj\n mvm o \nL L L\n"
	mov BYTE [r13+8*1+r14],70
	add r14,1
	mov BYTE [r13+8*1+r14],74
	add r14,1
	mov BYTE [r13+8*1+r14],70
	add r14,1
	mov BYTE [r13+8*1+r14],74
	add r14,1
	mov BYTE [r13+8*1+r14],70
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
	mov BYTE [r13+8*1+r14],106
	add r14,1
	mov BYTE [r13+8*1+r14],106
	add r14,1
	mov BYTE [r13+8*1+r14],106
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],118
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],111
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],76
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "END "
	mov BYTE [r13+8*1+r14],69
	add r14,1
	mov BYTE [r13+8*1+r14],78
	add r14,1
	mov BYTE [r13+8*1+r14],68
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_LB_370
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_371
emt_get_ptn_0_LB_370:
; unboxed
	stc
emt_get_ptn_1_LB_371:
	mov QWORD r10,r8
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r10
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_372
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_372:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_373
;push_reg
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
LB_373:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_374
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_374:
;clear  1'~s0
	bt r12,1
	jc clear_LB_375
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_375:
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_319:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_319
	CST_DYN_325:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_363:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_363
	CST_DYN_366:
		dq 0x0001_0001_00_82_ffff
		dq 1
