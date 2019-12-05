%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_333
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
	push r15
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
	pop r15
	pop r14
	ret
NS_E_230:
NS_E_RDI_230:
NS_E_230_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_231
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_231:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_233:
NS_E_RDI_233:
NS_E_233_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_233_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_233_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_234:
NS_E_RDI_234:
NS_E_234_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_234_LB_0
	cmp r11,57
	ja NS_E_234_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_234_LB_0:
	mov rax,0
	ret
NS_E_236:
NS_E_RDI_236:
NS_E_236_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_236_LB_0
	cmp r11,122
	ja NS_E_236_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_236_LB_0:
	mov rax,0
	ret
NS_E_235:
NS_E_RDI_235:
NS_E_235_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_235_LB_0
	cmp r11,90
	ja NS_E_235_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_235_LB_0:
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
	mov rdi,r8
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
	mov rax,r15
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
	mov rax,r15
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
	mov r15,rax
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
NS_E_232:
NS_E_RDI_232:
NS_E_232_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
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
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_232_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_232_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_262:
; 	|» { 0' 1' 2' }
NS_E_RDI_262:
; _f32 { %_238 %_237 } ⊢ { %_240 %_241 %_242 } : { %_240 %_241 %_242 }
 ; {>  %_239~2':_r64 %_238~1':_r64 %_237~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_327
; /
	jmp MTC_LB_326
LB_327:
; /0/
	jmp MTC_LB_325
MTC_LB_326:
; _f35 %_241 ⊢ { %_243 %_244 } : { %_243 %_244 }
 ; {>  %_240~1':_r64 %_239~2':_r64 %_241~0':_r64 %_242~3':_r64 }
	mov r9,r13
; _f35 %_240 ⊢ { %_245 %_246 } : { %_245 %_246 }
 ; {>  %_240~1':_r64 %_239~2':_r64 %_243~0':_r64 %_244~4':_r64 %_242~3':_r64 }
	mov r10,r14
; _f35 %_239 ⊢ { %_247 %_248 } : { %_247 %_248 }
 ; {>  %_239~2':_r64 %_246~5':_r64 %_245~1':_r64 %_243~0':_r64 %_244~4':_r64 %_242~3':_r64 }
	mov r11,r15
; _f37 %_244 ⊢ %_249 : %_249
 ; {>  %_246~5':_r64 %_245~1':_r64 %_248~6':_r64 %_243~0':_r64 %_244~4':_r64 %_247~2':_r64 %_242~3':_r64 }
	sub r9,1
; _f262 { %_249 %_246 %_248 } ⊢ %_250 : %_250
 ; {>  %_246~5':_r64 %_245~1':_r64 %_248~6':_r64 %_243~0':_r64 %_249~4':_r64 %_247~2':_r64 %_242~3':_r64 }
; _f262 { 4' 5' 6' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_271
	btr r12,0
	jmp LB_272
LB_271:
	bts r12,0
LB_272:
	mov r14,r10
	bt r12,5
	jc LB_273
	btr r12,1
	jmp LB_274
LB_273:
	bts r12,1
LB_274:
	mov r15,r11
	bt r12,6
	jc LB_275
	btr r12,2
	jmp LB_276
LB_275:
	bts r12,2
LB_276:
	call NS_E_262
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_277
	btr r12,4
	jmp LB_278
LB_277:
	bts r12,4
LB_278:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_269
	btr r12,3
	jmp LB_270
LB_269:
	bts r12,3
LB_270:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_267
	btr r12,2
	jmp LB_268
LB_267:
	bts r12,2
LB_268:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_265
	btr r12,1
	jmp LB_266
LB_265:
	bts r12,1
LB_266:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_263
	btr r12,0
	jmp LB_264
LB_263:
	bts r12,0
LB_264:
	add rsp,40
; _f35 %_243 ⊢ { %_251 %_252 } : { %_251 %_252 }
 ; {>  %_250~4':_r64 %_245~1':_r64 %_243~0':_r64 %_247~2':_r64 %_242~3':_r64 }
	mov r10,r13
; _f35 %_245 ⊢ { %_253 %_254 } : { %_253 %_254 }
 ; {>  %_250~4':_r64 %_245~1':_r64 %_252~5':_r64 %_251~0':_r64 %_247~2':_r64 %_242~3':_r64 }
	mov r11,r14
; _f35 %_247 ⊢ { %_255 %_256 } : { %_255 %_256 }
 ; {>  %_254~6':_r64 %_250~4':_r64 %_253~1':_r64 %_252~5':_r64 %_251~0':_r64 %_247~2':_r64 %_242~3':_r64 }
	mov rcx,r15
; _f37 %_254 ⊢ %_257 : %_257
 ; {>  %_255~2':_r64 %_254~6':_r64 %_250~4':_r64 %_253~1':_r64 %_252~5':_r64 %_251~0':_r64 %_242~3':_r64 %_256~7':_r64 }
	sub r11,1
; _f262 { %_257 %_256 %_252 } ⊢ %_258 : %_258
 ; {>  %_257~6':_r64 %_255~2':_r64 %_250~4':_r64 %_253~1':_r64 %_252~5':_r64 %_251~0':_r64 %_242~3':_r64 %_256~7':_r64 }
; _f262 { 6' 7' 5' } ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 6' 7' 5' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,6
	jc LB_289
	btr r12,0
	jmp LB_290
LB_289:
	bts r12,0
LB_290:
	mov r14,rcx
	bt r12,7
	jc LB_291
	btr r12,1
	jmp LB_292
LB_291:
	bts r12,1
LB_292:
	mov r15,r10
	bt r12,5
	jc LB_293
	btr r12,2
	jmp LB_294
LB_293:
	bts r12,2
LB_294:
	call NS_E_262
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_295
	btr r12,5
	jmp LB_296
LB_295:
	bts r12,5
LB_296:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_287
	btr r12,4
	jmp LB_288
LB_287:
	bts r12,4
LB_288:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_285
	btr r12,3
	jmp LB_286
LB_285:
	bts r12,3
LB_286:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_283
	btr r12,2
	jmp LB_284
LB_283:
	bts r12,2
LB_284:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_281
	btr r12,1
	jmp LB_282
LB_281:
	bts r12,1
LB_282:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_279
	btr r12,0
	jmp LB_280
LB_279:
	bts r12,0
LB_280:
	add rsp,48
; _f37 %_255 ⊢ %_259 : %_259
 ; {>  %_255~2':_r64 %_250~4':_r64 %_253~1':_r64 %_258~5':_r64 %_251~0':_r64 %_242~3':_r64 }
	sub r15,1
; _f262 { %_259 %_251 %_253 } ⊢ %_260 : %_260
 ; {>  %_250~4':_r64 %_253~1':_r64 %_259~2':_r64 %_258~5':_r64 %_251~0':_r64 %_242~3':_r64 }
; _f262 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_303
	btr r12,3
	jmp LB_304
LB_303:
	bts r12,3
LB_304:
	mov r15,r14
	bt r12,1
	jc LB_305
	btr r12,2
	jmp LB_306
LB_305:
	bts r12,2
LB_306:
	mov r14,r13
	bt r12,0
	jc LB_307
	btr r12,1
	jmp LB_308
LB_307:
	bts r12,1
LB_308:
	mov r13,r8
	bt r12,3
	jc LB_309
	btr r12,0
	jmp LB_310
LB_309:
	bts r12,0
LB_310:
	call NS_E_262
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_301
	btr r12,5
	jmp LB_302
LB_301:
	bts r12,5
LB_302:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_299
	btr r12,4
	jmp LB_300
LB_299:
	bts r12,4
LB_300:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_297
	btr r12,3
	jmp LB_298
LB_297:
	bts r12,3
LB_298:
	add rsp,32
; _f262 { %_250 %_258 %_260 } ⊢ %_261 : %_261
 ; {>  %_250~4':_r64 %_258~5':_r64 %_242~3':_r64 %_260~0':_r64 }
; _f262 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_313
	btr r12,1
	jmp LB_314
LB_313:
	bts r12,1
LB_314:
	mov r15,r13
	bt r12,0
	jc LB_315
	btr r12,2
	jmp LB_316
LB_315:
	bts r12,2
LB_316:
	mov r13,r9
	bt r12,4
	jc LB_317
	btr r12,0
	jmp LB_318
LB_317:
	bts r12,0
LB_318:
	call NS_E_262
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_311
	btr r12,3
	jmp LB_312
LB_311:
	bts r12,3
LB_312:
	add rsp,16
; ∎ %_261
 ; {>  %_261~0':_r64 %_242~3':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_319
	mov rdi,r8
	call dlt
LB_319:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_325:
; ∎ %_239
 ; {>  %_240~1':_r64 %_239~2':_r64 %_241~0':_r64 %_242~3':_r64 }
; 	∎ 2'
	bt r12,1
	jc LB_320
	mov rdi,r14
	call dlt
LB_320:
	bt r12,0
	jc LB_321
	mov rdi,r13
	call dlt
LB_321:
	bt r12,3
	jc LB_322
	mov rdi,r8
	call dlt
LB_322:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_323
	btr r12,0
	jmp LB_324
LB_323:
	bts r12,0
LB_324:
	ret
NS_E_333:
NS_E_RDI_333:
; » 0xr14 |~ {  } ⊢ %_328 : %_328
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_328
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_329 : %_329
 ; {>  %_328~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_329
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_330 : %_330
 ; {>  %_328~0':_r64 %_329~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_330
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f262 { %_328 %_329 %_330 } ⊢ %_331 : %_331
 ; {>  %_330~2':_r64 %_328~0':_r64 %_329~1':_r64 }
; _f262 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_262
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; _f20 %_331 ⊢ %_332 : %_332
 ; {>  %_331~0':_r64 }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_332~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_334
	mov rdi,r13
	call dlt
LB_334:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_365:
; 	|» { 0' 1' 2' }
NS_E_RDI_365:
; _f32 { %_336 %_335 } ⊢ { %_338 %_339 %_340 } : { %_338 %_339 %_340 }
 ; {>  %_335~0':_r64 %_337~2':_r64 %_336~1':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_417
; /
	jmp MTC_LB_416
LB_417:
; /0/
	jmp MTC_LB_415
MTC_LB_416:
; _f37 %_339 ⊢ %_341 : %_341
 ; {>  %_340~3':_r64 %_339~0':_r64 %_337~2':_r64 %_338~1':_r64 }
	sub r13,1
; _f365 { %_341 %_338 %_337 } ⊢ { %_342 %_343 %_344 %_345 } : { %_342 %_343 %_344 %_345 }
 ; {>  %_340~3':_r64 %_337~2':_r64 %_338~1':_r64 %_341~0':_r64 }
; _f365 { 0' 1' 2' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_365
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r9,r8
	bt r12,3
	jc LB_368
	btr r12,4
	jmp LB_369
LB_368:
	bts r12,4
LB_369:
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_366
	btr r12,3
	jmp LB_367
LB_366:
	bts r12,3
LB_367:
	add rsp,16
; _f38 %_342 ⊢ %_346 : %_346
 ; {>  %_344~2':_r64 %_343~1':_r64 %_340~3':_r64 %_345~4':_r64 %_342~0':_r64 }
	add r13,1
; _f37 %_343 ⊢ %_347 : %_347
 ; {>  %_344~2':_r64 %_343~1':_r64 %_340~3':_r64 %_346~0':_r64 %_345~4':_r64 }
	sub r14,1
; _f365 { %_346 %_347 %_344 } ⊢ { %_348 %_349 %_350 %_351 } : { %_348 %_349 %_350 %_351 }
 ; {>  %_344~2':_r64 %_340~3':_r64 %_346~0':_r64 %_347~1':_r64 %_345~4':_r64 }
; _f365 { 0' 1' 2' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_365
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r10,r8
	bt r12,3
	jc LB_374
	btr r12,5
	jmp LB_375
LB_374:
	bts r12,5
LB_375:
; pop_iv
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_372
	btr r12,4
	jmp LB_373
LB_372:
	bts r12,4
LB_373:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_370
	btr r12,3
	jmp LB_371
LB_370:
	bts r12,3
LB_371:
	add rsp,24
; _f38 %_349 ⊢ %_352 : %_352
 ; {>  %_348~0':_r64 %_349~1':_r64 %_340~3':_r64 %_350~2':_r64 %_351~5':_r64 %_345~4':_r64 }
	add r14,1
; _f37 %_350 ⊢ %_353 : %_353
 ; {>  %_348~0':_r64 %_340~3':_r64 %_350~2':_r64 %_352~1':_r64 %_351~5':_r64 %_345~4':_r64 }
	sub r15,1
; _f365 { %_348 %_352 %_353 } ⊢ { %_354 %_355 %_356 %_357 } : { %_354 %_355 %_356 %_357 }
 ; {>  %_348~0':_r64 %_353~2':_r64 %_340~3':_r64 %_352~1':_r64 %_351~5':_r64 %_345~4':_r64 }
; _f365 { 0' 1' 2' } ⊢ { 0' 1' 2' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_365
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 6' }
	mov r11,r8
	bt r12,3
	jc LB_382
	btr r12,6
	jmp LB_383
LB_382:
	bts r12,6
LB_383:
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_380
	btr r12,5
	jmp LB_381
LB_380:
	bts r12,5
LB_381:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_378
	btr r12,4
	jmp LB_379
LB_378:
	bts r12,4
LB_379:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_376
	btr r12,3
	jmp LB_377
LB_376:
	bts r12,3
LB_377:
	add rsp,32
; _f38 %_356 ⊢ %_358 : %_358
 ; {>  %_340~3':_r64 %_354~0':_r64 %_351~5':_r64 %_356~2':_r64 %_345~4':_r64 %_355~1':_r64 %_357~6':_r64 }
	add r15,1
; _f365 { %_345 %_351 %_357 } ⊢ { %_359 %_360 %_361 %_362 } : { %_359 %_360 %_361 %_362 }
 ; {>  %_340~3':_r64 %_354~0':_r64 %_351~5':_r64 %_358~2':_r64 %_345~4':_r64 %_355~1':_r64 %_357~6':_r64 }
; _f365 { 4' 5' 6' } ⊢ { 4' 5' 6' 7' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_392
	btr r12,0
	jmp LB_393
LB_392:
	bts r12,0
LB_393:
	mov r14,r10
	bt r12,5
	jc LB_394
	btr r12,1
	jmp LB_395
LB_394:
	bts r12,1
LB_395:
	mov r15,r11
	bt r12,6
	jc LB_396
	btr r12,2
	jmp LB_397
LB_396:
	bts r12,2
LB_397:
	call NS_E_365
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 4' 5' 6' 7' }
	mov r9,r13
	bt r12,0
	jc LB_398
	btr r12,4
	jmp LB_399
LB_398:
	bts r12,4
LB_399:
	mov r10,r14
	bt r12,1
	jc LB_400
	btr r12,5
	jmp LB_401
LB_400:
	bts r12,5
LB_401:
	mov r11,r15
	bt r12,2
	jc LB_402
	btr r12,6
	jmp LB_403
LB_402:
	bts r12,6
LB_403:
	mov rcx,r8
	bt r12,3
	jc LB_404
	btr r12,7
	jmp LB_405
LB_404:
	bts r12,7
LB_405:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_390
	btr r12,3
	jmp LB_391
LB_390:
	bts r12,3
LB_391:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_388
	btr r12,2
	jmp LB_389
LB_388:
	bts r12,2
LB_389:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_386
	btr r12,1
	jmp LB_387
LB_386:
	bts r12,1
LB_387:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_384
	btr r12,0
	jmp LB_385
LB_384:
	bts r12,0
LB_385:
	add rsp,40
; ∎ { %_354 %_355 %_358 %_362 }
 ; {>  %_340~3':_r64 %_360~5':_r64 %_361~6':_r64 %_354~0':_r64 %_362~7':_r64 %_359~4':_r64 %_358~2':_r64 %_355~1':_r64 }
; 	∎ { 0' 1' 2' 7' }
	bt r12,3
	jc LB_406
	mov rdi,r8
	call dlt
LB_406:
	bt r12,5
	jc LB_407
	mov rdi,r10
	call dlt
LB_407:
	bt r12,6
	jc LB_408
	mov rdi,r11
	call dlt
LB_408:
	bt r12,4
	jc LB_409
	mov rdi,r9
	call dlt
LB_409:
; _emt_mov_ptn_to_ptn { 0' 1' 2' 7' } ⊢ { 0' 1' 2' 3' }
	mov r8,rcx
	bt r12,7
	jc LB_410
	btr r12,3
	jmp LB_411
LB_410:
	bts r12,3
LB_411:
	ret
MTC_LB_415:
; _f35 %_337 ⊢ { %_363 %_364 } : { %_363 %_364 }
 ; {>  %_340~3':_r64 %_339~0':_r64 %_337~2':_r64 %_338~1':_r64 }
	mov r9,r15
; ∎ { %_339 %_338 %_363 %_364 }
 ; {>  %_364~4':_r64 %_363~2':_r64 %_340~3':_r64 %_339~0':_r64 %_338~1':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_412
	mov rdi,r8
	call dlt
LB_412:
; _emt_mov_ptn_to_ptn { 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r8,r9
	bt r12,4
	jc LB_413
	btr r12,3
	jmp LB_414
LB_413:
	bts r12,3
LB_414:
	ret
section .data
	NS_E_DYN_230:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_230
	NS_E_DYN_233:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_233
	NS_E_DYN_234:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_234
	NS_E_DYN_235:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_235
	NS_E_DYN_236:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_236
	NS_E_DYN_262:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_262
	CST_DYN_333:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_365:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_365
