%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_411
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
NS_E_226:
NS_E_RDI_226:
NS_E_226_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_227
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_227:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_229:
NS_E_RDI_229:
NS_E_229_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_229_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_229_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_230:
NS_E_RDI_230:
NS_E_230_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_230_LB_0
	cmp r11,57
	ja NS_E_230_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_230_LB_0:
	mov rax,0
	ret
NS_E_232:
NS_E_RDI_232:
NS_E_232_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_232_LB_0
	cmp r11,122
	ja NS_E_232_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_232_LB_0:
	mov rax,0
	ret
NS_E_231:
NS_E_RDI_231:
NS_E_231_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_231_LB_0
	cmp r11,90
	ja NS_E_231_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_231_LB_0:
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
NS_E_228:
NS_E_RDI_228:
NS_E_228_ETR_TBL:
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
	jz NS_E_228_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_228_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_255:
; 	|» 0'
NS_E_RDI_255:
MTC_LB_256:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_257
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_258
	bt QWORD [rax],0
	jc LB_259
	btr r12,0
	jmp LB_260
LB_259:
	bts r12,0
LB_260:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_258:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_263
	btr r12,3
	jmp LB_264
LB_263:
	bts r12,3
LB_264:
	mov r14,r9
	bt r12,3
	jc LB_261
	btr r12,1
	jmp LB_262
LB_261:
	bts r12,1
LB_262:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_267
	btr r12,3
	jmp LB_268
LB_267:
	bts r12,3
LB_268:
	mov r8,r9
	bt r12,3
	jc LB_265
	btr r12,2
	jmp LB_266
LB_265:
	bts r12,2
LB_266:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_257
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_269
	bt QWORD [rax],0
	jc LB_270
	btr r12,2
	jmp LB_271
LB_270:
	bts r12,2
LB_271:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_269:
	push r8
	mov r8,rax
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_274
	btr r12,5
	jmp LB_275
LB_274:
	bts r12,5
LB_275:
	mov r9,r11
	bt r12,5
	jc LB_272
	btr r12,3
	jmp LB_273
LB_272:
	bts r12,3
LB_273:
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_278
	btr r12,5
	jmp LB_279
LB_278:
	bts r12,5
LB_279:
	mov r10,r11
	bt r12,5
	jc LB_276
	btr r12,4
	jmp LB_277
LB_276:
	bts r12,4
LB_277:
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_257
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_280
	bt QWORD [rax],0
	jc LB_281
	btr r12,4
	jmp LB_282
LB_281:
	bts r12,4
LB_282:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_280:
	push r10
	mov r10,rax
	mov rdi,r10
	mov rdx,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_285
	btr r12,7
	jmp LB_286
LB_285:
	bts r12,7
LB_286:
	mov r11,rdx
	bt r12,7
	jc LB_283
	btr r12,5
	jmp LB_284
LB_283:
	bts r12,5
LB_284:
	mov rdi,r10
	mov rdx,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_289
	btr r12,7
	jmp LB_290
LB_289:
	bts r12,7
LB_290:
	mov rcx,rdx
	bt r12,7
	jc LB_287
	btr r12,6
	jmp LB_288
LB_287:
	bts r12,6
LB_288:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r10
LB_291:
	cmp r15,0
	jz LB_292
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt
	sub r15,1
	jmp LB_291
LB_292:
; » 0xr0 |~ {  } ⊢ %_240 : %_240
 ; {>  %_239~6':(_lst)◂(t127'(-1)) %_238~5':t127'(-1) %_234~1':t127'(-1) %_236~3':t127'(-1) }
; 	» 0xr0 _ ⊢ 0' : %_240
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _f20 { %_240 %_238 } ⊢ { %_241 %_242 } : { %_241 %_242 }
 ; {>  %_240~0':_r64 %_239~6':(_lst)◂(t127'(-1)) %_238~5':t127'(-1) %_234~1':t127'(-1) %_236~3':t127'(-1) }
; _f20 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_299
	btr r12,1
	jmp LB_300
LB_299:
	bts r12,1
LB_300:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_303
	btr r12,2
	jmp LB_304
LB_303:
	bts r12,2
LB_304:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_301
	btr QWORD [rdi],0
	jmp LB_302
LB_301:
	bts QWORD [rdi],0
LB_302:
	mov r8,r11
	bt r12,5
	jc LB_307
	btr r12,2
	jmp LB_308
LB_307:
	bts r12,2
LB_308:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_305
	btr QWORD [rdi],1
	jmp LB_306
LB_305:
	bts QWORD [rdi],1
LB_306:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 2' }
	mov r14,r13
	bt r12,0
	jc LB_309
	btr r12,1
	jmp LB_310
LB_309:
	bts r12,1
LB_310:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_313
	btr r12,3
	jmp LB_314
LB_313:
	bts r12,3
LB_314:
	mov r13,r9
	bt r12,3
	jc LB_311
	btr r12,0
	jmp LB_312
LB_311:
	bts r12,0
LB_312:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_317
	btr r12,3
	jmp LB_318
LB_317:
	bts r12,3
LB_318:
	mov r8,r9
	bt r12,3
	jc LB_315
	btr r12,2
	jmp LB_316
LB_315:
	bts r12,2
LB_316:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rcx,QWORD [rsp+8+8*2]
	bt QWORD [rsp],6
	jc LB_297
	btr r12,6
	jmp LB_298
LB_297:
	bts r12,6
LB_298:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],3
	jc LB_295
	btr r12,3
	jmp LB_296
LB_295:
	bts r12,3
LB_296:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_293
	btr r12,1
	jmp LB_294
LB_293:
	bts r12,1
LB_294:
	add rsp,32
; ∎ {  }
 ; {>  %_239~6':(_lst)◂(t127'(-1)) %_241~0':_r64 %_234~1':t127'(-1) %_242~2':t127'(-1) %_236~3':t127'(-1) }
; 	∎ {  }
	bt r12,6
	jc LB_319
	mov rdi,rcx
	call dlt
LB_319:
	bt r12,0
	jc LB_320
	mov rdi,r13
	call dlt
LB_320:
	bt r12,1
	jc LB_321
	mov rdi,r14
	call dlt
LB_321:
	bt r12,2
	jc LB_322
	mov rdi,r8
	call dlt
LB_322:
	bt r12,3
	jc LB_323
	mov rdi,r9
	call dlt
LB_323:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_257:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_324
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_325
	bt QWORD [rax],0
	jc LB_326
	btr r12,0
	jmp LB_327
LB_326:
	bts r12,0
LB_327:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_325:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_330
	btr r12,3
	jmp LB_331
LB_330:
	bts r12,3
LB_331:
	mov r14,r9
	bt r12,3
	jc LB_328
	btr r12,1
	jmp LB_329
LB_328:
	bts r12,1
LB_329:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_334
	btr r12,3
	jmp LB_335
LB_334:
	bts r12,3
LB_335:
	mov r8,r9
	bt r12,3
	jc LB_332
	btr r12,2
	jmp LB_333
LB_332:
	bts r12,2
LB_333:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_324
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_336
	bt QWORD [rax],0
	jc LB_337
	btr r12,2
	jmp LB_338
LB_337:
	bts r12,2
LB_338:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_336:
	push r8
	mov r8,rax
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_341
	btr r12,5
	jmp LB_342
LB_341:
	bts r12,5
LB_342:
	mov r9,r11
	bt r12,5
	jc LB_339
	btr r12,3
	jmp LB_340
LB_339:
	bts r12,3
LB_340:
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_345
	btr r12,5
	jmp LB_346
LB_345:
	bts r12,5
LB_346:
	mov r10,r11
	bt r12,5
	jc LB_343
	btr r12,4
	jmp LB_344
LB_343:
	bts r12,4
LB_344:
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_347:
	cmp r15,0
	jz LB_348
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt
	sub r15,1
	jmp LB_347
LB_348:
; » 0xr1 |~ {  } ⊢ %_247 : %_247
 ; {>  %_246~4':(_lst)◂(t127'(-1)) %_245~3':t127'(-1) %_243~1':t127'(-1) }
; 	» 0xr1 _ ⊢ 0' : %_247
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _f20 { %_247 %_245 } ⊢ { %_248 %_249 } : { %_248 %_249 }
 ; {>  %_246~4':(_lst)◂(t127'(-1)) %_245~3':t127'(-1) %_243~1':t127'(-1) %_247~0':_r64 }
; _f20 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_353
	btr r12,1
	jmp LB_354
LB_353:
	bts r12,1
LB_354:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_357
	btr r12,2
	jmp LB_358
LB_357:
	bts r12,2
LB_358:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_355
	btr QWORD [rdi],0
	jmp LB_356
LB_355:
	bts QWORD [rdi],0
LB_356:
	mov r8,r9
	bt r12,3
	jc LB_361
	btr r12,2
	jmp LB_362
LB_361:
	bts r12,2
LB_362:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_359
	btr QWORD [rdi],1
	jmp LB_360
LB_359:
	bts QWORD [rdi],1
LB_360:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 2' }
	mov r14,r13
	bt r12,0
	jc LB_363
	btr r12,1
	jmp LB_364
LB_363:
	bts r12,1
LB_364:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_367
	btr r12,3
	jmp LB_368
LB_367:
	bts r12,3
LB_368:
	mov r13,r9
	bt r12,3
	jc LB_365
	btr r12,0
	jmp LB_366
LB_365:
	bts r12,0
LB_366:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_371
	btr r12,3
	jmp LB_372
LB_371:
	bts r12,3
LB_372:
	mov r8,r9
	bt r12,3
	jc LB_369
	btr r12,2
	jmp LB_370
LB_369:
	bts r12,2
LB_370:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_351
	btr r12,4
	jmp LB_352
LB_351:
	bts r12,4
LB_352:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_349
	btr r12,1
	jmp LB_350
LB_349:
	bts r12,1
LB_350:
	add rsp,24
; ∎ {  }
 ; {>  %_246~4':(_lst)◂(t127'(-1)) %_248~0':_r64 %_243~1':t127'(-1) %_249~2':t127'(-1) }
; 	∎ {  }
	bt r12,4
	jc LB_373
	mov rdi,r10
	call dlt
LB_373:
	bt r12,0
	jc LB_374
	mov rdi,r13
	call dlt
LB_374:
	bt r12,1
	jc LB_375
	mov rdi,r14
	call dlt
LB_375:
	bt r12,2
	jc LB_376
	mov rdi,r8
	call dlt
LB_376:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_324:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_377
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_378
	bt QWORD [rax],0
	jc LB_379
	btr r12,0
	jmp LB_380
LB_379:
	bts r12,0
LB_380:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_378:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_383
	btr r12,3
	jmp LB_384
LB_383:
	bts r12,3
LB_384:
	mov r14,r9
	bt r12,3
	jc LB_381
	btr r12,1
	jmp LB_382
LB_381:
	bts r12,1
LB_382:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_387
	btr r12,3
	jmp LB_388
LB_387:
	bts r12,3
LB_388:
	mov r8,r9
	bt r12,3
	jc LB_385
	btr r12,2
	jmp LB_386
LB_385:
	bts r12,2
LB_386:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
LB_389:
	cmp r15,0
	jz LB_390
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt
	sub r15,1
	jmp LB_389
LB_390:
; » 0xr2 |~ {  } ⊢ %_251 : %_251
 ; {>  %_250~{ 1' 2' }:{ t127'(-1) (_lst)◂(t127'(-1)) } }
; 	» 0xr2 _ ⊢ 0' : %_251
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _f20 %_251 ⊢ %_252 : %_252
 ; {>  %_250~{ 1' 2' }:{ t127'(-1) (_lst)◂(t127'(-1)) } %_251~0':_r64 }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD [rsp],2
	jc LB_393
	btr r12,2
	jmp LB_394
LB_393:
	bts r12,2
LB_394:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_391
	btr r12,1
	jmp LB_392
LB_391:
	bts r12,1
LB_392:
	add rsp,24
; ∎ {  }
 ; {>  %_250~{ 1' 2' }:{ t127'(-1) (_lst)◂(t127'(-1)) } %_252~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_395
	mov rdi,r14
	call dlt
LB_395:
	bt r12,2
	jc LB_396
	mov rdi,r8
	call dlt
LB_396:
	bt r12,0
	jc LB_397
	mov rdi,r13
	call dlt
LB_397:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_377:
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_398
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_399
	bt QWORD [rax],0
	jc LB_400
	btr r12,0
	jmp LB_401
LB_400:
	bts r12,0
LB_401:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_399:
	push r13
	mov r13,rax
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
LB_402:
	cmp r15,0
	jz LB_403
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt
	sub r15,1
	jmp LB_402
LB_403:
; » 0xr3 |~ {  } ⊢ %_253 : %_253
 ; {>  }
; 	» 0xr3 _ ⊢ 0' : %_253
	mov rdi,0x3
	mov r13,rdi
	bts r12,0
; _f20 %_253 ⊢ %_254 : %_254
 ; {>  %_253~0':_r64 }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_254~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_404
	mov rdi,r13
	call dlt
LB_404:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_398:
NS_E_411:
NS_E_RDI_411:
; _nil {  } ⊢ %_405 : %_405
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_406 : %_406
 ; {>  %_405~°1◂{  }:(_lst)◂(t169'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_406
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr1 |~ {  } ⊢ %_407 : %_407
 ; {>  %_406~0':_r64 %_405~°1◂{  }:(_lst)◂(t169'(0)) }
; 	» 0xr1 _ ⊢ 1' : %_407
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; » 0xr2 |~ {  } ⊢ %_408 : %_408
 ; {>  %_406~0':_r64 %_405~°1◂{  }:(_lst)◂(t169'(0)) %_407~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_408
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _cns { %_406 %_405 } ⊢ %_409 : %_409
 ; {>  %_406~0':_r64 %_405~°1◂{  }:(_lst)◂(t169'(0)) %_407~1':_r64 %_408~2':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_407 %_409 } ⊢ %_410 : %_410
 ; {>  %_409~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_407~1':_r64 %_408~2':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _f255 %_410 ⊢ {  } : {  }
 ; {>  %_408~2':_r64 %_410~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) }
; _f255 °0◂{ 1' °0◂{ 0' °1◂{  } } } ⊢ {  }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂{ 0' °1◂{  } } } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_414
	btr r12,2
	jmp LB_415
LB_414:
	bts r12,2
LB_415:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_420
	btr r12,3
	jmp LB_421
LB_420:
	bts r12,3
LB_421:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_418
	btr QWORD [rdi],0
	jmp LB_419
LB_418:
	bts QWORD [rdi],0
LB_419:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_428
	btr r12,1
	jmp LB_429
LB_428:
	bts r12,1
LB_429:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_426
	btr QWORD [rdi],0
	jmp LB_427
LB_426:
	bts QWORD [rdi],0
LB_427:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_432
	mov rsi,0
	bt r14,0
	jc LB_432
	jmp LB_433
LB_432:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_433:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_430
	btr QWORD [rdi],1
	jmp LB_431
LB_430:
	bts QWORD [rdi],1
LB_431:
	mov rsi,1
	bt r12,3
	jc LB_424
	mov rsi,0
	bt r9,0
	jc LB_424
	jmp LB_425
LB_424:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_425:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_422
	btr QWORD [rdi],1
	jmp LB_423
LB_422:
	bts QWORD [rdi],1
LB_423:
	mov rsi,1
	bt r12,0
	jc LB_416
	mov rsi,0
	bt r13,0
	jc LB_416
	jmp LB_417
LB_416:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_417:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_255
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],2
	jc LB_412
	btr r12,2
	jmp LB_413
LB_412:
	bts r12,2
LB_413:
	add rsp,16
; ∎ {  }
 ; {>  %_408~2':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_434
	mov rdi,r8
	call dlt
LB_434:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_226:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_226
	NS_E_DYN_229:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_229
	NS_E_DYN_230:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_230
	NS_E_DYN_231:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_231
	NS_E_DYN_232:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_232
	NS_E_DYN_255:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_255
	CST_DYN_411:
		dq 0x0000_0001_00_82_ffff
		dq 1
