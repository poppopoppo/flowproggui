%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_22263
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
NS_E_22247:
NS_E_RDI_22247:
NS_E_22247_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_22248
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_22248:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_22250:
NS_E_RDI_22250:
NS_E_22250_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_22250_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_22250_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_22251:
NS_E_RDI_22251:
NS_E_22251_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_22251_LB_0
	cmp r11,57
	ja NS_E_22251_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22251_LB_0:
	mov rax,0
	ret
NS_E_22253:
NS_E_RDI_22253:
NS_E_22253_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_22253_LB_0
	cmp r11,122
	ja NS_E_22253_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22253_LB_0:
	mov rax,0
	ret
NS_E_22252:
NS_E_RDI_22252:
NS_E_22252_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_22252_LB_0
	cmp r11,90
	ja NS_E_22252_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_22252_LB_0:
	mov rax,0
	ret
NS_E_24:
NS_E_RDI_24:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
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
	jge err
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
	cmp r10,rax
	jge err
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
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
NS_E_22249:
NS_E_RDI_22249:
NS_E_22249_ETR_TBL:
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
	jz NS_E_22249_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_22249_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_22263:
NS_E_RDI_22263:
; 	» "-27686gg" _ ⊢ 0' : %_22254
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_22255 : %_22255
 ; {>  %_22254~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_22255
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr4 |~ {  } ⊢ %_22256 : %_22256
 ; {>  %_22255~1':_r64 %_22254~0':_stg }
; 	» 0xr4 _ ⊢ 2' : %_22256
	mov rdi,0x4
	mov r8,rdi
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_22257 : %_22257
 ; {>  %_22256~2':_r64 %_22255~1':_r64 %_22254~0':_stg }
; 	» 0xr0 _ ⊢ 3' : %_22257
	mov rdi,0x0
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_22258 : %_22258
 ; {>  %_22257~3':_r64 %_22256~2':_r64 %_22255~1':_r64 %_22254~0':_stg }
; 	» 0xr0 _ ⊢ 4' : %_22258
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _some { %_22256 %_22257 } ⊢ %_22259 : %_22259
 ; {>  %_22257~3':_r64 %_22258~4':_r64 %_22256~2':_r64 %_22255~1':_r64 %_22254~0':_stg }
; _some { 2' 3' } ⊢ °0◂{ 2' 3' }
; _f21 %_22259 ⊢ %_22260 : %_22260
 ; {>  %_22259~°0◂{ 2' 3' }:(_opn)◂({ _r64 _r64 }) %_22258~4':_r64 %_22255~1':_r64 %_22254~0':_stg }
; _f21 °0◂{ 2' 3' } ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},°0◂{ 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r8
	bt r12,2
	jc LB_22274
	btr r12,1
	jmp LB_22275
LB_22274:
	bts r12,1
LB_22275:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_22272
	btr QWORD [rdi],0
	jmp LB_22273
LB_22272:
	bts QWORD [rdi],0
LB_22273:
	mov r14,r9
	bt r12,3
	jc LB_22278
	btr r12,1
	jmp LB_22279
LB_22278:
	bts r12,1
LB_22279:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_22276
	btr QWORD [rdi],1
	jmp LB_22277
LB_22276:
	bts QWORD [rdi],1
LB_22277:
	mov rsi,1
	bt r12,0
	jc LB_22270
	mov rsi,0
	bt r13,0
	jc LB_22270
	jmp LB_22271
LB_22270:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_22271:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_22280
	btr r12,2
	jmp LB_22281
LB_22280:
	bts r12,2
LB_22281:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22268
	btr r12,4
	jmp LB_22269
LB_22268:
	bts r12,4
LB_22269:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_22266
	btr r12,1
	jmp LB_22267
LB_22266:
	bts r12,1
LB_22267:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22264
	btr r12,0
	jmp LB_22265
LB_22264:
	bts r12,0
LB_22265:
	add rsp,32
; _some %_22260 ⊢ %_22261 : %_22261
 ; {>  %_22260~2':(_opn)◂({ _r64 _r64 }) %_22258~4':_r64 %_22255~1':_r64 %_22254~0':_stg }
; _some 2' ⊢ °0◂2'
; _f21 %_22261 ⊢ %_22262 : %_22262
 ; {>  %_22261~°0◂2':(_opn)◂((_opn)◂({ _r64 _r64 })) %_22258~4':_r64 %_22255~1':_r64 %_22254~0':_stg }
; _f21 °0◂2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_22290
	btr r12,0
	jmp LB_22291
LB_22290:
	bts r12,0
LB_22291:
	mov rsi,1
	bt r12,0
	jc LB_22288
	mov rsi,0
	bt r13,0
	jc LB_22288
	jmp LB_22289
LB_22288:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_22289:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_22292
	btr r12,2
	jmp LB_22293
LB_22292:
	bts r12,2
LB_22293:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_22286
	btr r12,4
	jmp LB_22287
LB_22286:
	bts r12,4
LB_22287:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_22284
	btr r12,1
	jmp LB_22285
LB_22284:
	bts r12,1
LB_22285:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_22282
	btr r12,0
	jmp LB_22283
LB_22282:
	bts r12,0
LB_22283:
	add rsp,32
; ∎ {  }
 ; {>  %_22258~4':_r64 %_22262~2':(_opn)◂((_opn)◂({ _r64 _r64 })) %_22255~1':_r64 %_22254~0':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_22294
	mov rdi,r10
	call dlt
LB_22294:
	bt r12,2
	jc LB_22295
	mov rdi,r8
	call dlt
LB_22295:
	bt r12,1
	jc LB_22296
	mov rdi,r14
	call dlt
LB_22296:
	bt r12,0
	jc LB_22297
	mov rdi,r13
	call dlt
LB_22297:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_22305:
; 	|» 0'
NS_E_RDI_22305:
MTC_LB_22306:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22307
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_22308
	bt QWORD [rax],0
	jc LB_22309
	btr r12,3
	jmp LB_22310
LB_22309:
	bts r12,3
LB_22310:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22308:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22313
	btr r12,4
	jmp LB_22314
LB_22313:
	bts r12,4
LB_22314:
	mov r14,r10
	bt r12,4
	jc LB_22311
	btr r12,1
	jmp LB_22312
LB_22311:
	bts r12,1
LB_22312:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22317
	btr r12,4
	jmp LB_22318
LB_22317:
	bts r12,4
LB_22318:
	mov r8,r10
	bt r12,4
	jc LB_22315
	btr r12,2
	jmp LB_22316
LB_22315:
	bts r12,2
LB_22316:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22307
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_22319
	bt QWORD [rax],0
	jc LB_22320
	btr r12,5
	jmp LB_22321
LB_22320:
	bts r12,5
LB_22321:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22319:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_22324
	btr r12,6
	jmp LB_22325
LB_22324:
	bts r12,6
LB_22325:
	mov r9,rcx
	bt r12,6
	jc LB_22322
	btr r12,3
	jmp LB_22323
LB_22322:
	bts r12,3
LB_22323:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_22328
	btr r12,6
	jmp LB_22329
LB_22328:
	bts r12,6
LB_22329:
	mov r10,rcx
	bt r12,6
	jc LB_22326
	btr r12,4
	jmp LB_22327
LB_22326:
	bts r12,4
LB_22327:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22330:
	cmp r15,0
	jz LB_22331
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22330
LB_22331:
; ∎ {  }
 ; {>  %_22301~3':t6537'(-1) %_22302~4':(_lst)◂(t6537'(-1)) %_22299~1':t6537'(-1) }
; 	∎ {  }
	bt r12,3
	jc LB_22332
	mov rdi,r9
	call dlt
LB_22332:
	bt r12,4
	jc LB_22333
	mov rdi,r10
	call dlt
LB_22333:
	bt r12,1
	jc LB_22334
	mov rdi,r14
	call dlt
LB_22334:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_22307:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_22335
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_22336
	bt QWORD [rax],0
	jc LB_22337
	btr r12,3
	jmp LB_22338
LB_22337:
	bts r12,3
LB_22338:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22336:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_22341
	btr r12,4
	jmp LB_22342
LB_22341:
	bts r12,4
LB_22342:
	mov r14,r10
	bt r12,4
	jc LB_22339
	btr r12,1
	jmp LB_22340
LB_22339:
	bts r12,1
LB_22340:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_22345
	btr r12,4
	jmp LB_22346
LB_22345:
	bts r12,4
LB_22346:
	mov r8,r10
	bt r12,4
	jc LB_22343
	btr r12,2
	jmp LB_22344
LB_22343:
	bts r12,2
LB_22344:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22335
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_22347
	bt QWORD [rax],0
	jc LB_22348
	btr r12,3
	jmp LB_22349
LB_22348:
	bts r12,3
LB_22349:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22347:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22350:
	cmp r15,0
	jz LB_22351
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22350
LB_22351:
; ∎ {  }
 ; {>  %_22303~1':t6537'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_22352
	mov rdi,r14
	call dlt
LB_22352:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_22335:
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_22353
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_22354
	bt QWORD [rax],0
	jc LB_22355
	btr r12,1
	jmp LB_22356
LB_22355:
	bts r12,1
LB_22356:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_22354:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_22357:
	cmp r15,0
	jz LB_22358
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_22357
LB_22358:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_22353:
section .data
	NS_E_DYN_22247:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22247
	NS_E_DYN_22250:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22250
	NS_E_DYN_22251:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22251
	NS_E_DYN_22252:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22252
	NS_E_DYN_22253:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22253
	CST_DYN_22263:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_22305:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_22305
