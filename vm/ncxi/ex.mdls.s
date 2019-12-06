%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_442
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call emt_q
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	ret
NS_E_265:
NS_E_RDI_265:
NS_E_265_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_266
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_266:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_268:
NS_E_RDI_268:
NS_E_268_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_268_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_268_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_269:
NS_E_RDI_269:
NS_E_269_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_269_LB_0
	cmp r11,57
	ja NS_E_269_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_269_LB_0:
	mov rax,0
	ret
NS_E_271:
NS_E_RDI_271:
NS_E_271_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_271_LB_0
	cmp r11,122
	ja NS_E_271_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_271_LB_0:
	mov rax,0
	ret
NS_E_270:
NS_E_RDI_270:
NS_E_270_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_270_LB_0
	cmp r11,90
	ja NS_E_270_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_270_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r13
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
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
	jge err
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
	jge err
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_267:
NS_E_RDI_267:
NS_E_267_ETR_TBL:
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
	jz NS_E_267_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_267_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_285:
; 	|» { 0' 1' }
NS_E_RDI_285:
MTC_LB_286:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_287
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_288
	bt QWORD [rax],0
	jc LB_289
	btr r12,1
	jmp LB_290
LB_289:
	bts r12,1
LB_290:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_288:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_293
	btr r12,4
	jmp LB_294
LB_293:
	bts r12,4
LB_294:
	mov r8,r10
	bt r12,4
	jc LB_291
	btr r12,2
	jmp LB_292
LB_291:
	bts r12,2
LB_292:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_297
	btr r12,4
	jmp LB_298
LB_297:
	bts r12,4
LB_298:
	mov r9,r10
	bt r12,4
	jc LB_295
	btr r12,3
	jmp LB_296
LB_295:
	bts r12,3
LB_296:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_299:
	cmp r15,0
	jz LB_300
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_299
LB_300:
; _f38 %_272 ⊢ %_276 : %_276
 ; {>  %_274~2':_r64 %_275~3':(_lst)◂(_r64) %_272~0':_r64 }
	add r13,1
; _f285 { %_276 %_275 } ⊢ { %_277 %_278 } : { %_277 %_278 }
 ; {>  %_274~2':_r64 %_276~0':_r64 %_275~3':(_lst)◂(_r64) }
; _f285 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_303
	btr r12,1
	jmp LB_304
LB_303:
	bts r12,1
LB_304:
	call NS_E_285
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_301
	btr r12,2
	jmp LB_302
LB_301:
	bts r12,2
LB_302:
	add rsp,16
; _f37 %_277 ⊢ %_279 : %_279
 ; {>  %_274~2':_r64 %_277~0':_r64 %_278~1':_stg }
	sub r13,1
; _f16 { %_278 %_279 %_274 } ⊢ { %_280 %_281 %_282 } : { %_280 %_281 %_282 }
 ; {>  %_274~2':_r64 %_279~0':_r64 %_278~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_305
	btr r12,3
	jmp LB_306
LB_305:
	bts r12,3
LB_306:
	mov r14,r13
	bt r12,0
	jc LB_307
	btr r12,1
	jmp LB_308
LB_307:
	bts r12,1
LB_308:
	mov r13,r9
	bt r12,3
	jc LB_309
	btr r12,0
	jmp LB_310
LB_309:
	bts r12,0
LB_310:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_281 %_280 }
 ; {>  %_280~0':_stg %_282~2':_r64 %_281~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_311
	mov rdi,r8
	call dlt
LB_311:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_312
	btr r12,2
	jmp LB_313
LB_312:
	bts r12,2
LB_313:
	mov r14,r13
	bt r12,0
	jc LB_314
	btr r12,1
	jmp LB_315
LB_314:
	bts r12,1
LB_315:
	mov r13,r8
	bt r12,2
	jc LB_316
	btr r12,0
	jmp LB_317
LB_316:
	bts r12,0
LB_317:
	ret
MTC_LB_287:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_318
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_319
	bt QWORD [rax],0
	jc LB_320
	btr r12,1
	jmp LB_321
LB_320:
	bts r12,1
LB_321:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_319:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_322:
	cmp r15,0
	jz LB_323
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_322
LB_323:
; _f14 %_272 ⊢ { %_283 %_284 } : { %_283 %_284 }
 ; {>  %_272~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_283 %_284 }
 ; {>  %_284~1':_stg %_283~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_318:
NS_E_325:
NS_E_RDI_325:
NS_E_325_ETR_TBL:
NS_E_325_TBL:
; c0
	push r14
	sub rsp,32
; "\""
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,34
	jz LB_345
	jmp NS_E_325_MTC_0_failed
LB_345:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	call NS_E_327_ETR_TBL
	cmp r8,0
	jz LB_350
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_351
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_351:
	jmp NS_E_325_MTC_0_failed
LB_350:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_339
	btr QWORD [rdi],1
LB_339:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_340
	btr QWORD [rdi],0
LB_340:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_325_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_327:
NS_E_RDI_327:
NS_E_327_ETR_TBL:
NS_E_327_TBL:
; c0
	push r14
	sub rsp,48
; "\\"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,92
	jz LB_380
	jmp NS_E_327_MTC_0_failed
LB_380:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	call NS_E_329_ETR_TBL
	cmp r8,0
	jz LB_385
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_386:
	jmp NS_E_327_MTC_0_failed
LB_385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	call NS_E_327_ETR_TBL
	cmp r8,0
	jz LB_390
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_391
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_391:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_392:
	jmp NS_E_327_MTC_0_failed
LB_390:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_373
	btr QWORD [rdi],2
LB_373:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_374
	btr QWORD [rdi],1
LB_374:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_375
	btr QWORD [rdi],0
LB_375:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_327_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	push r14
	sub rsp,16
; "\""
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,34
	jz LB_370
	jmp NS_E_327_MTC_1_failed
LB_370:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_365
	btr QWORD [rdi],0
LB_365:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_327_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	push r14
	sub rsp,32
; _byt
	call NS_E_265_ETR_TBL
	cmp r8,0
	jz LB_358
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_327_MTC_2_failed
LB_358:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	call NS_E_327_ETR_TBL
	cmp r8,0
	jz LB_362
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_363
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_363:
	jmp NS_E_327_MTC_2_failed
LB_362:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_353
	btr QWORD [rdi],1
LB_353:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_354
	btr QWORD [rdi],0
LB_354:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_327_MTC_2_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_329:
NS_E_RDI_329:
NS_E_329_ETR_TBL:
NS_E_329_TBL:
; c0
	push r14
	sub rsp,16
; "\\"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,92
	jz LB_431
	jmp NS_E_329_MTC_0_failed
LB_431:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_426
	btr QWORD [rdi],0
LB_426:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_329_MTC_0_failed:
	add rsp,16
	pop r14
; c1
	push r14
	sub rsp,16
; "\""
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,34
	jz LB_423
	jmp NS_E_329_MTC_1_failed
LB_423:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_418
	btr QWORD [rdi],0
LB_418:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_329_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	push r14
	sub rsp,16
; "n"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,110
	jz LB_415
	jmp NS_E_329_MTC_2_failed
LB_415:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_410
	btr QWORD [rdi],0
LB_410:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_329_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	push r14
	sub rsp,16
; "t"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,116
	jz LB_407
	jmp NS_E_329_MTC_3_failed
LB_407:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_402
	btr QWORD [rdi],0
LB_402:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_329_MTC_3_failed:
	add rsp,16
	pop r14
; c4
	push r14
	sub rsp,16
; "0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_399
	jmp NS_E_329_MTC_4_failed
LB_399:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_394
	btr QWORD [rdi],0
LB_394:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0400_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_329_MTC_4_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_442:
NS_E_RDI_442:
; 	» "\"Hello World!!\"" _ ⊢ 0' : %_434
	mov rdi,15
	call mlc_s8
	mov rdi,rax
	mov rax,0x_57_20_6f_6c_6c_65_48_22
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_22_21_21_64_6c_72_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_435 : %_435
 ; {>  %_434~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_435
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f325 { %_434 %_435 } ⊢ { %_436 %_437 %_438 } : { %_436 %_437 %_438 }
 ; {>  %_434~0':_stg %_435~1':_r64 }
; _f325 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_325
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_443
	btr r12,4
	jmp LB_444
LB_443:
	bts r12,4
LB_444:
	mov r8,r9
	bt r12,3
	jc LB_447
	btr r12,2
	jmp LB_448
LB_447:
	bts r12,2
LB_448:
	mov rsi,1
	bt r12,2
	jc LB_445
	mov rsi,0
	bt r8,0
	jc LB_445
	jmp LB_446
LB_445:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_446:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_436 %_437 %_438 } ⊢ { %_439 %_440 %_441 } : { %_439 %_440 %_441 }
 ; {>  %_437~1':_r64 %_438~2':(_opn)◂(_p324) %_436~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_449
	btr r12,3
	jmp LB_450
LB_449:
	bts r12,3
LB_450:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_453
	btr r12,4
	jmp LB_454
LB_453:
	bts r12,4
LB_454:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_451
	btr QWORD [rdi],0
	jmp LB_452
LB_451:
	bts QWORD [rdi],0
LB_452:
	mov r10,r14
	bt r12,1
	jc LB_457
	btr r12,4
	jmp LB_458
LB_457:
	bts r12,4
LB_458:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_455
	btr QWORD [rdi],1
	jmp LB_456
LB_455:
	bts QWORD [rdi],1
LB_456:
	mov r10,r8
	bt r12,2
	jc LB_461
	btr r12,4
	jmp LB_462
LB_461:
	bts r12,4
LB_462:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_459
	btr QWORD [rdi],2
	jmp LB_460
LB_459:
	bts QWORD [rdi],2
LB_460:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_463
	btr r12,3
	jmp LB_464
LB_463:
	bts r12,3
LB_464:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_467
	btr r12,4
	jmp LB_468
LB_467:
	bts r12,4
LB_468:
	mov r13,r10
	bt r12,4
	jc LB_465
	btr r12,0
	jmp LB_466
LB_465:
	bts r12,0
LB_466:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_471
	btr r12,4
	jmp LB_472
LB_471:
	bts r12,4
LB_472:
	mov r14,r10
	bt r12,4
	jc LB_469
	btr r12,1
	jmp LB_470
LB_469:
	bts r12,1
LB_470:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_475
	btr r12,4
	jmp LB_476
LB_475:
	bts r12,4
LB_476:
	mov r8,r10
	bt r12,4
	jc LB_473
	btr r12,2
	jmp LB_474
LB_473:
	bts r12,2
LB_474:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_440~1':_r64 %_441~2':(_opn)◂(_p324) %_439~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_477
	mov rdi,r14
	call dlt
LB_477:
	bt r12,2
	jc LB_478
	mov rdi,r8
	call dlt
LB_478:
	bt r12,0
	jc LB_479
	mov rdi,r13
	call dlt
LB_479:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_265:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_265
	NS_E_DYN_268:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_268
	NS_E_DYN_269:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_269
	NS_E_DYN_270:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_270
	NS_E_DYN_271:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_271
	NS_E_DYN_285:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_285
	NS_E_DYN_330:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_325:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_325
	NS_E_DYN_331:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_332:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_333:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_327:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_327
	NS_E_DYN_334:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_335:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_336:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_337:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_338:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_329:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_329
	CST_DYN_442:
		dq 0x0000_0001_00_82_ffff
		dq 1
