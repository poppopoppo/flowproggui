%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_4414
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
	push r13
	mov rdi,r13
	mov rsi,str_ret
	bt r12,0
	call pp
	mov rdi,fmt_emt_q
	mov rsi,str_ret
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	ret
NS_E_4394:
NS_E_RDI_4394:
NS_E_4394_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_4395
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_4395:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4397:
NS_E_RDI_4397:
NS_E_4397_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_4397_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_4397_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4398:
NS_E_RDI_4398:
NS_E_4398_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_4398_LB_0
	cmp r11,57
	ja NS_E_4398_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_4398_LB_0:
	mov rax,0
	ret
NS_E_4400:
NS_E_RDI_4400:
NS_E_4400_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_4400_LB_0
	cmp r11,122
	ja NS_E_4400_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_4400_LB_0:
	mov rax,0
	ret
NS_E_4399:
NS_E_RDI_4399:
NS_E_4399_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_4399_LB_0
	cmp r11,90
	ja NS_E_4399_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_4399_LB_0:
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
	jge err_s8_ge
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
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
	jge err_s8_ge
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
	jge err_s8_ge
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
NS_E_4396:
NS_E_RDI_4396:
NS_E_4396_ETR_TBL:
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
	jz NS_E_4396_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_4396_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4414:
NS_E_RDI_4414:
; 	» "-27686gg" _ ⊢ 0' : %_4401
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_4402 : %_4402
 ; {>  %_4401~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_4402
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr4 |~ {  } ⊢ %_4403 : %_4403
 ; {>  %_4402~1':_r64 %_4401~0':_stg }
; 	» 0xr4 _ ⊢ 2' : %_4403
	mov rdi,0x4
	mov r8,rdi
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_4404 : %_4404
 ; {>  %_4402~1':_r64 %_4403~2':_r64 %_4401~0':_stg }
; 	» 0xr0 _ ⊢ 3' : %_4404
	mov rdi,0x0
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_4405 : %_4405
 ; {>  %_4402~1':_r64 %_4404~3':_r64 %_4403~2':_r64 %_4401~0':_stg }
; 	» 0xr0 _ ⊢ 4' : %_4405
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _f14 %_4402 ⊢ { %_4406 %_4407 } : { %_4406 %_4407 }
 ; {>  %_4405~4':_r64 %_4402~1':_r64 %_4404~3':_r64 %_4403~2':_r64 %_4401~0':_stg }
; _f14 1' ⊢ { 1' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4423
	btr r12,0
	jmp LB_4424
LB_4423:
	bts r12,0
LB_4424:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_4425
	btr r12,5
	jmp LB_4426
LB_4425:
	bts r12,5
LB_4426:
	mov r14,r13
	bt r12,0
	jc LB_4427
	btr r12,1
	jmp LB_4428
LB_4427:
	bts r12,1
LB_4428:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_4421
	btr r12,4
	jmp LB_4422
LB_4421:
	bts r12,4
LB_4422:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_4419
	btr r12,3
	jmp LB_4420
LB_4419:
	bts r12,3
LB_4420:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4417
	btr r12,2
	jmp LB_4418
LB_4417:
	bts r12,2
LB_4418:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4415
	btr r12,0
	jmp LB_4416
LB_4415:
	bts r12,0
LB_4416:
	add rsp,40
; _f18 { %_4403 %_4401 %_4404 %_4407 %_4405 } ⊢ { %_4408 %_4409 %_4410 %_4411 %_4412 } : { %_4408 %_4409 %_4410 %_4411 %_4412 }
 ; {>  %_4407~5':_stg %_4405~4':_r64 %_4404~3':_r64 %_4403~2':_r64 %_4406~1':_r64 %_4401~0':_stg }
; _f18 { 2' 0' 3' 5' 4' } ⊢ { 0' 2' 3' 4' 5' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1011110.. |},{ 2' 0' 3' 5' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r13
	bt r12,0
	jc LB_4431
	btr r12,1
	jmp LB_4432
LB_4431:
	bts r12,1
LB_4432:
	mov r13,r8
	bt r12,2
	jc LB_4433
	btr r12,0
	jmp LB_4434
LB_4433:
	bts r12,0
LB_4434:
	mov r8,r9
	bt r12,3
	jc LB_4435
	btr r12,2
	jmp LB_4436
LB_4435:
	bts r12,2
LB_4436:
	mov r9,r11
	bt r12,5
	jc LB_4437
	btr r12,3
	jmp LB_4438
LB_4437:
	bts r12,3
LB_4438:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 2' 3' 4' 5' }
	mov r11,r10
	bt r12,4
	jc LB_4439
	btr r12,5
	jmp LB_4440
LB_4439:
	bts r12,5
LB_4440:
	mov r10,r9
	bt r12,3
	jc LB_4441
	btr r12,4
	jmp LB_4442
LB_4441:
	bts r12,4
LB_4442:
	mov r9,r8
	bt r12,2
	jc LB_4443
	btr r12,3
	jmp LB_4444
LB_4443:
	bts r12,3
LB_4444:
	mov r8,r14
	bt r12,1
	jc LB_4445
	btr r12,2
	jmp LB_4446
LB_4445:
	bts r12,2
LB_4446:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4429
	btr r12,1
	jmp LB_4430
LB_4429:
	bts r12,1
LB_4430:
	add rsp,16
; _f21 %_4411 ⊢ %_4413 : %_4413
 ; {>  %_4409~2':_stg %_4411~4':_stg %_4410~3':_r64 %_4408~0':_r64 %_4412~5':_r64 %_4406~1':_r64 }
; _f21 4' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_4457
	btr r12,0
	jmp LB_4458
LB_4457:
	bts r12,0
LB_4458:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_4459
	btr r12,4
	jmp LB_4460
LB_4459:
	bts r12,4
LB_4460:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_4455
	btr r12,5
	jmp LB_4456
LB_4455:
	bts r12,5
LB_4456:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_4453
	btr r12,3
	jmp LB_4454
LB_4453:
	bts r12,3
LB_4454:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4451
	btr r12,2
	jmp LB_4452
LB_4451:
	bts r12,2
LB_4452:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4449
	btr r12,1
	jmp LB_4450
LB_4449:
	bts r12,1
LB_4450:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4447
	btr r12,0
	jmp LB_4448
LB_4447:
	bts r12,0
LB_4448:
	add rsp,48
; ∎ {  }
 ; {>  %_4409~2':_stg %_4413~4':_stg %_4410~3':_r64 %_4408~0':_r64 %_4412~5':_r64 %_4406~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_4461
	mov rdi,r8
	call dlt
LB_4461:
	bt r12,4
	jc LB_4462
	mov rdi,r10
	call dlt
LB_4462:
	bt r12,3
	jc LB_4463
	mov rdi,r9
	call dlt
LB_4463:
	bt r12,0
	jc LB_4464
	mov rdi,r13
	call dlt
LB_4464:
	bt r12,5
	jc LB_4465
	mov rdi,r11
	call dlt
LB_4465:
	bt r12,1
	jc LB_4466
	mov rdi,r14
	call dlt
LB_4466:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4474:
; 	|» 0'
NS_E_RDI_4474:
MTC_LB_4475:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4476
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_4477
	bt QWORD [rax],0
	jc LB_4478
	btr r12,3
	jmp LB_4479
LB_4478:
	bts r12,3
LB_4479:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4477:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4482
	btr r12,4
	jmp LB_4483
LB_4482:
	bts r12,4
LB_4483:
	mov r14,r10
	bt r12,4
	jc LB_4480
	btr r12,1
	jmp LB_4481
LB_4480:
	bts r12,1
LB_4481:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4486
	btr r12,4
	jmp LB_4487
LB_4486:
	bts r12,4
LB_4487:
	mov r8,r10
	bt r12,4
	jc LB_4484
	btr r12,2
	jmp LB_4485
LB_4484:
	bts r12,2
LB_4485:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4476
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_4488
	bt QWORD [rax],0
	jc LB_4489
	btr r12,5
	jmp LB_4490
LB_4489:
	bts r12,5
LB_4490:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4488:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4493
	btr r12,6
	jmp LB_4494
LB_4493:
	bts r12,6
LB_4494:
	mov r9,rcx
	bt r12,6
	jc LB_4491
	btr r12,3
	jmp LB_4492
LB_4491:
	bts r12,3
LB_4492:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4497
	btr r12,6
	jmp LB_4498
LB_4497:
	bts r12,6
LB_4498:
	mov r10,rcx
	bt r12,6
	jc LB_4495
	btr r12,4
	jmp LB_4496
LB_4495:
	bts r12,4
LB_4496:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4499:
	cmp r15,0
	jz LB_4500
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4499
LB_4500:
; ∎ {  }
 ; {>  %_4471~4':(_lst)◂(t1256'(-1)) %_4470~3':t1256'(-1) %_4468~1':t1256'(-1) }
; 	∎ {  }
	bt r12,4
	jc LB_4501
	mov rdi,r10
	call dlt
LB_4501:
	bt r12,3
	jc LB_4502
	mov rdi,r9
	call dlt
LB_4502:
	bt r12,1
	jc LB_4503
	mov rdi,r14
	call dlt
LB_4503:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_4476:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4504
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_4505
	bt QWORD [rax],0
	jc LB_4506
	btr r12,3
	jmp LB_4507
LB_4506:
	bts r12,3
LB_4507:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4505:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4510
	btr r12,4
	jmp LB_4511
LB_4510:
	bts r12,4
LB_4511:
	mov r14,r10
	bt r12,4
	jc LB_4508
	btr r12,1
	jmp LB_4509
LB_4508:
	bts r12,1
LB_4509:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4514
	btr r12,4
	jmp LB_4515
LB_4514:
	bts r12,4
LB_4515:
	mov r8,r10
	bt r12,4
	jc LB_4512
	btr r12,2
	jmp LB_4513
LB_4512:
	bts r12,2
LB_4513:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4504
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_4516
	bt QWORD [rax],0
	jc LB_4517
	btr r12,3
	jmp LB_4518
LB_4517:
	bts r12,3
LB_4518:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4516:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4519:
	cmp r15,0
	jz LB_4520
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4519
LB_4520:
; ∎ {  }
 ; {>  %_4472~1':t1256'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_4521
	mov rdi,r14
	call dlt
LB_4521:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_4504:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4522
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_4523
	bt QWORD [rax],0
	jc LB_4524
	btr r12,1
	jmp LB_4525
LB_4524:
	bts r12,1
LB_4525:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4523:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4526:
	cmp r15,0
	jz LB_4527
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4526
LB_4527:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_4522:
section .data
	NS_E_DYN_4394:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4394
	NS_E_DYN_4397:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4397
	NS_E_DYN_4398:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4398
	NS_E_DYN_4399:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4399
	NS_E_DYN_4400:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4400
	CST_DYN_4414:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_4474:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4474
