%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_488
	call NS_E_583
	call NS_E_674
	call exec_out
	jmp _end
NS_E_14:
NS_E_RDI_14:
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
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
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
NS_E_467:
NS_E_RDI_467:
NS_E_467_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_467_LB_0
	bt r11,7
	jc LB_468
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
LB_468:
	add rsi,1
	bt r11,6
	jc LB_469
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
LB_469:
	add rsi,1
	bt r11,5
	jc LB_470
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
LB_470:
	add rsi,1
	bt r11,5
	jc LB_470
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
NS_E_467_LB_0:
	mov rax,0
	ret
NS_E_471:
NS_E_RDI_471:
NS_E_471_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_471_LB_0
	cmp r11,57
	ja NS_E_471_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_471_LB_0:
	mov rax,0
	ret
NS_E_473:
NS_E_RDI_473:
NS_E_473_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_473_LB_0
	cmp r11,122
	ja NS_E_473_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_473_LB_0:
	mov rax,0
	ret
NS_E_472:
NS_E_RDI_472:
NS_E_472_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_472_LB_0
	cmp r11,90
	ja NS_E_472_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_472_LB_0:
	mov rax,0
	ret
NS_E_17:
NS_E_RDI_17:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_21:
	mov rdi,r8
	bt r12,0
NS_E_RDI_21:
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
NS_E_478:
; 	|» 0'
NS_E_RDI_478:
; _f28 %_474 ⊢ { %_475 %_476 } : { %_475 %_476 }
 ; {>  %_474~0':_r64 }
	mov r14,r13
; _f26 { %_475 %_476 } ⊢ { %_477 _(464) } : { %_477 _(464) }
 ; {>  %_476~1':_r64 %_475~0':_r64 }
	add r13,r14
; ∎ %_477
 ; {>  %_477~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
NS_E_488:
NS_E_RDI_488:
; » 0xrff |~ {  } ⊢ %_479 : %_479
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_479
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_480 : %_480
 ; {>  %_479~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_480
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_481 %_482 %_483 } : { %_481 %_482 %_483 }
 ; {>  %_480~1':_r64 %_479~0':_r64 }
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { { {  } {  } } {  } { {  } } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { { {  } {  } } {  } { {  } } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_495
	btr QWORD [rdi],0
	jmp LB_496
LB_495:
	bts QWORD [rdi],0
LB_496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_497
	btr QWORD [rdi],1
	jmp LB_498
LB_497:
	bts QWORD [rdi],1
LB_498:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_493
	btr QWORD [rdi],0
	jmp LB_494
LB_493:
	bts QWORD [rdi],0
LB_494:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_499
	btr QWORD [rdi],1
	jmp LB_500
LB_499:
	bts QWORD [rdi],1
LB_500:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_503
	btr QWORD [rdi],0
	jmp LB_504
LB_503:
	bts QWORD [rdi],0
LB_504:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_501
	btr QWORD [rdi],2
	jmp LB_502
LB_501:
	bts QWORD [rdi],2
LB_502:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_509
	btr r12,1
	jmp LB_510
LB_509:
	bts r12,1
LB_510:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_505
	btr r12,2
	jmp LB_506
LB_505:
	bts r12,2
LB_506:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_507
	btr r12,2
	jmp LB_508
LB_507:
	bts r12,2
LB_508:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_511
	btr r12,1
	jmp LB_512
LB_511:
	bts r12,1
LB_512:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_515
	btr r12,1
	jmp LB_516
LB_515:
	bts r12,1
LB_516:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_513
	btr r12,2
	jmp LB_514
LB_513:
	bts r12,2
LB_514:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_491
	btr r12,1
	jmp LB_492
LB_491:
	bts r12,1
LB_492:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_489
	btr r12,0
	jmp LB_490
LB_489:
	bts r12,0
LB_490:
	add rsp,24
; _f14 %_481 ⊢ %_484 : %_484
 ; {>  %_480~1':_r64 %_482~{  }:{ } %_483~{ {  } }:{ { } } %_479~0':_r64 %_481~{ {  } {  } }:{ { } { } } }
; _f14 { {  } {  } } ⊢ { {  } {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_521
	btr QWORD [rdi],0
	jmp LB_522
LB_521:
	bts QWORD [rdi],0
LB_522:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_523
	btr QWORD [rdi],1
	jmp LB_524
LB_523:
	bts QWORD [rdi],1
LB_524:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_525
	btr r12,1
	jmp LB_526
LB_525:
	bts r12,1
LB_526:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_527
	btr r12,1
	jmp LB_528
LB_527:
	bts r12,1
LB_528:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_519
	btr r12,1
	jmp LB_520
LB_519:
	bts r12,1
LB_520:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_517
	btr r12,0
	jmp LB_518
LB_517:
	bts r12,0
LB_518:
	add rsp,24
; _f14 %_482 ⊢ %_485 : %_485
 ; {>  %_484~{ {  } {  } }:{ { } { } } %_480~1':_r64 %_482~{  }:{ } %_483~{ {  } }:{ { } } %_479~0':_r64 }
; _f14 {  } ⊢ {  }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_531
	btr r12,1
	jmp LB_532
LB_531:
	bts r12,1
LB_532:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_529
	btr r12,0
	jmp LB_530
LB_529:
	bts r12,0
LB_530:
	add rsp,24
; _f14 %_483 ⊢ _(465) : _(465)
 ; {>  %_484~{ {  } {  } }:{ { } { } } %_480~1':_r64 %_485~{  }:{ } %_483~{ {  } }:{ { } } %_479~0':_r64 }
; _f14 { {  } } ⊢ { {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_537
	btr QWORD [rdi],0
	jmp LB_538
LB_537:
	bts QWORD [rdi],0
LB_538:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_539
	btr r12,1
	jmp LB_540
LB_539:
	bts r12,1
LB_540:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_535
	btr r12,1
	jmp LB_536
LB_535:
	bts r12,1
LB_536:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_533
	btr r12,0
	jmp LB_534
LB_533:
	bts r12,0
LB_534:
	add rsp,24
; _f14 %_479 ⊢ %_486 : %_486
 ; {>  %_484~{ {  } {  } }:{ { } { } } %_480~1':_r64 %_485~{  }:{ } %_479~0':_r64 }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_541
	btr r12,1
	jmp LB_542
LB_541:
	bts r12,1
LB_542:
	add rsp,16
; _f14 { %_486 %_480 } ⊢ %_487 : %_487
 ; {>  %_486~0':_r64 %_484~{ {  } {  } }:{ { } { } } %_480~1':_r64 %_485~{  }:{ } }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_543
	btr r12,2
	jmp LB_544
LB_543:
	bts r12,2
LB_544:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_547
	btr r12,3
	jmp LB_548
LB_547:
	bts r12,3
LB_548:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_545
	btr QWORD [rdi],0
	jmp LB_546
LB_545:
	bts QWORD [rdi],0
LB_546:
	mov r8,r14
	bt r12,1
	jc LB_551
	btr r12,3
	jmp LB_552
LB_551:
	bts r12,3
LB_552:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_549
	btr QWORD [rdi],1
	jmp LB_550
LB_549:
	bts QWORD [rdi],1
LB_550:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_553
	btr r12,2
	jmp LB_554
LB_553:
	bts r12,2
LB_554:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_557
	btr r12,3
	jmp LB_558
LB_557:
	bts r12,3
LB_558:
	mov r13,r8
	bt r12,3
	jc LB_555
	btr r12,0
	jmp LB_556
LB_555:
	bts r12,0
LB_556:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_561
	btr r12,3
	jmp LB_562
LB_561:
	bts r12,3
LB_562:
	mov r14,r8
	bt r12,3
	jc LB_559
	btr r12,1
	jmp LB_560
LB_559:
	bts r12,1
LB_560:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_484~{ {  } {  } }:{ { } { } } %_487~{ 0' 1' }:{ _r64 _r64 } %_485~{  }:{ } }
; 	∎ {  }
	bt r12,0
	jc LB_563
	mov rdi,r13
	call dlt
LB_563:
	bt r12,1
	jc LB_564
	mov rdi,r14
	call dlt
LB_564:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_583:
NS_E_RDI_583:
; » 0xr89873 |~ {  } ⊢ %_565 : %_565
 ; {>  }
; 	» 0xr89873 _ ⊢ 0' : %_565
	mov rdi,0x89873
	mov r13,rdi
	bts r12,0
; » 0xrfff |~ {  } ⊢ %_566 : %_566
 ; {>  %_565~0':_r64 }
; 	» 0xrfff _ ⊢ 1' : %_566
	mov rdi,0xfff
	mov r14,rdi
	bts r12,1
; » 0xrafa |~ {  } ⊢ %_567 : %_567
 ; {>  %_566~1':_r64 %_565~0':_r64 }
; 	» 0xrafa _ ⊢ 2' : %_567
	mov rdi,0xafa
	mov r15,rdi
	bts r12,2
; _f26 { %_566 %_567 } ⊢ { %_568 %_569 } : { %_568 %_569 }
 ; {>  %_567~2':_r64 %_566~1':_r64 %_565~0':_r64 }
	add r14,r15
; _f14 { %_568 %_569 } ⊢ { %_570 %_571 } : { %_570 %_571 }
 ; {>  %_569~2':_r64 %_565~0':_r64 %_568~1':_r64 }
; _f14 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_588
	btr r12,3
	jmp LB_589
LB_588:
	bts r12,3
LB_589:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_586
	btr QWORD [rdi],0
	jmp LB_587
LB_586:
	bts QWORD [rdi],0
LB_587:
	mov r8,r15
	bt r12,2
	jc LB_592
	btr r12,3
	jmp LB_593
LB_592:
	bts r12,3
LB_593:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_590
	btr QWORD [rdi],1
	jmp LB_591
LB_590:
	bts QWORD [rdi],1
LB_591:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_596
	btr r12,3
	jmp LB_597
LB_596:
	bts r12,3
LB_597:
	mov r14,r8
	bt r12,3
	jc LB_594
	btr r12,1
	jmp LB_595
LB_594:
	bts r12,1
LB_595:
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_600
	btr r12,3
	jmp LB_601
LB_600:
	bts r12,3
LB_601:
	mov r15,r8
	bt r12,3
	jc LB_598
	btr r12,2
	jmp LB_599
LB_598:
	bts r12,2
LB_599:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_584
	btr r12,0
	jmp LB_585
LB_584:
	bts r12,0
LB_585:
	add rsp,16
; _f27 { %_565 %_570 } ⊢ { %_572 %_573 } : { %_572 %_573 }
 ; {>  %_570~1':_r64 %_571~2':_r64 %_565~0':_r64 }
	mov r13,r14
; _f28 %_572 ⊢ { %_574 _(466) } : { %_574 _(466) }
 ; {>  %_573~1':_r64 %_572~0':_r64 %_571~2':_r64 }
	mov r8,r13
; » 0xr1 |~ {  } ⊢ %_575 : %_575
 ; {>  %_573~1':_r64 %_574~0':_r64 %_571~2':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_575
	mov rdi,0x1
	mov r8,rdi
	bts r12,3
; _f478 %_575 ⊢ %_576 : %_576
 ; {>  %_575~3':_r64 %_573~1':_r64 %_574~0':_r64 %_571~2':_r64 }
; _f478 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_608
	btr r12,0
	jmp LB_609
LB_608:
	bts r12,0
LB_609:
	call NS_E_478
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_610
	btr r12,3
	jmp LB_611
LB_610:
	bts r12,3
LB_611:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_606
	btr r12,2
	jmp LB_607
LB_606:
	bts r12,2
LB_607:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_604
	btr r12,1
	jmp LB_605
LB_604:
	bts r12,1
LB_605:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_602
	btr r12,0
	jmp LB_603
LB_602:
	bts r12,0
LB_603:
	add rsp,32
; _f478 %_576 ⊢ %_577 : %_577
 ; {>  %_576~3':_r64 %_573~1':_r64 %_574~0':_r64 %_571~2':_r64 }
; _f478 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_618
	btr r12,0
	jmp LB_619
LB_618:
	bts r12,0
LB_619:
	call NS_E_478
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_620
	btr r12,3
	jmp LB_621
LB_620:
	bts r12,3
LB_621:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_616
	btr r12,2
	jmp LB_617
LB_616:
	bts r12,2
LB_617:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_614
	btr r12,1
	jmp LB_615
LB_614:
	bts r12,1
LB_615:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_612
	btr r12,0
	jmp LB_613
LB_612:
	bts r12,0
LB_613:
	add rsp,32
; _f14 { %_574 %_573 %_577 } ⊢ { %_578 %_579 %_580 } : { %_578 %_579 %_580 }
 ; {>  %_573~1':_r64 %_574~0':_r64 %_571~2':_r64 %_577~3':_r64 }
; _f14 { 0' 1' 3' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 3' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_624
	btr r12,2
	jmp LB_625
LB_624:
	bts r12,2
LB_625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r15
	bt r12,2
	jc LB_628
	btr r12,4
	jmp LB_629
LB_628:
	bts r12,4
LB_629:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_626
	btr QWORD [rdi],0
	jmp LB_627
LB_626:
	bts QWORD [rdi],0
LB_627:
	mov r9,r14
	bt r12,1
	jc LB_632
	btr r12,4
	jmp LB_633
LB_632:
	bts r12,4
LB_633:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_630
	btr QWORD [rdi],1
	jmp LB_631
LB_630:
	bts QWORD [rdi],1
LB_631:
	mov r9,r8
	bt r12,3
	jc LB_636
	btr r12,4
	jmp LB_637
LB_636:
	bts r12,4
LB_637:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_634
	btr QWORD [rdi],2
	jmp LB_635
LB_634:
	bts QWORD [rdi],2
LB_635:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 3' }
	mov r15,r13
	bt r12,0
	jc LB_638
	btr r12,2
	jmp LB_639
LB_638:
	bts r12,2
LB_639:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_642
	btr r12,4
	jmp LB_643
LB_642:
	bts r12,4
LB_643:
	mov r13,r9
	bt r12,4
	jc LB_640
	btr r12,0
	jmp LB_641
LB_640:
	bts r12,0
LB_641:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_646
	btr r12,4
	jmp LB_647
LB_646:
	bts r12,4
LB_647:
	mov r14,r9
	bt r12,4
	jc LB_644
	btr r12,1
	jmp LB_645
LB_644:
	bts r12,1
LB_645:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_650
	btr r12,4
	jmp LB_651
LB_650:
	bts r12,4
LB_651:
	mov r8,r9
	bt r12,4
	jc LB_648
	btr r12,3
	jmp LB_649
LB_648:
	bts r12,3
LB_649:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r15,QWORD [rsp+8+8*0]
	bt QWORD [rsp],2
	jc LB_622
	btr r12,2
	jmp LB_623
LB_622:
	bts r12,2
LB_623:
	add rsp,16
; 	» "Hello World !!" _ ⊢ 4' : %_581
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,14
	call mlc_s8
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	mov rdi,rax
	mov rax,0x_6f_57_20_6f_6c_6c_65_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_21_21_20_64_6c_72
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,4
; _f14 %_581 ⊢ %_582 : %_582
 ; {>  %_578~0':_r64 %_581~4':_stg %_580~3':_r64 %_579~1':_r64 %_571~2':_r64 }
; _f14 4' ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 4' ⊢ 0'
	mov r13,r9
	bt r12,4
	jc LB_660
	btr r12,0
	jmp LB_661
LB_660:
	bts r12,0
LB_661:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_662
	btr r12,4
	jmp LB_663
LB_662:
	bts r12,4
LB_663:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_658
	btr r12,3
	jmp LB_659
LB_658:
	bts r12,3
LB_659:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_656
	btr r12,2
	jmp LB_657
LB_656:
	bts r12,2
LB_657:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_654
	btr r12,1
	jmp LB_655
LB_654:
	bts r12,1
LB_655:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_652
	btr r12,0
	jmp LB_653
LB_652:
	bts r12,0
LB_653:
	add rsp,40
; ∎ {  }
 ; {>  %_578~0':_r64 %_580~3':_r64 %_579~1':_r64 %_582~4':_stg %_571~2':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_664
	mov rdi,r13
	call dlt
LB_664:
	bt r12,3
	jc LB_665
	mov rdi,r8
	call dlt
LB_665:
	bt r12,1
	jc LB_666
	mov rdi,r14
	call dlt
LB_666:
	bt r12,4
	jc LB_667
	mov rdi,r9
	call dlt
LB_667:
	bt r12,2
	jc LB_668
	mov rdi,r15
	call dlt
LB_668:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_674:
NS_E_RDI_674:
; _none {  } ⊢ %_669 : %_669
 ; {>  }
; _none {  } ⊢ 0◂{  }
	mov r13,1
	bts r12,0
; _some %_669 ⊢ %_670 : %_670
 ; {>  %_669~0◂{  }:(_opn)◂(t294'(0)) }
; _some 0◂{  } ⊢ 1◂0◂{  }
	mov r14,0
	bts r12,1
; _nil {  } ⊢ %_671 : %_671
 ; {>  %_670~1◂0◂{  }:(_opn)◂((_opn)◂(t297'(0))) }
; _nil {  } ⊢ 2◂{  }
	mov r15,1
	bts r12,2
; _cns { %_670 %_671 } ⊢ %_672 : %_672
 ; {>  %_671~2◂{  }:(_lst)◂(t299'(0)) %_670~1◂0◂{  }:(_opn)◂((_opn)◂(t297'(0))) }
; _cns { 1◂0◂{  } 2◂{  } } ⊢ 3◂{ 1◂0◂{  } 2◂{  } }
	mov r8,0
	bts r12,3
; _f14 %_672 ⊢ %_673 : %_673
 ; {>  %_672~3◂{ 1◂0◂{  } 2◂{  } }:(_lst)◂((_opn)◂((_opn)◂(t302'(0)))) }
; _f14 3◂{ 1◂0◂{  } 2◂{  } } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3◂{ 1◂0◂{  } 2◂{  } } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_675
	btr r12,4
	jmp LB_676
LB_675:
	bts r12,4
LB_676:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,5
	mov rsi,0
	bt r12,5
	jc LB_683
	bts rsi,17
	bt r10,0
	jc LB_683
	jmp LB_684
LB_683:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,5
LB_684:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r10,rdi
	mov rsi,0
	bt r12,5
	jc LB_681
	bts rsi,17
	bt r10,0
	jc LB_681
	jmp LB_682
LB_681:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,5
LB_682:
	mov rax,r14
	shl rax,56
	or rax,1
	mov rdi,rax
	or r10,rdi
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,5
	jc LB_679
	btr QWORD [rdi],0
	jmp LB_680
LB_679:
	bts QWORD [rdi],0
LB_680:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,5
	mov rsi,0
	bt r12,5
	jc LB_687
	bts rsi,17
	bt r10,0
	jc LB_687
	jmp LB_688
LB_687:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,5
LB_688:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r10,rdi
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,5
	jc LB_685
	btr QWORD [rdi],1
	jmp LB_686
LB_685:
	bts QWORD [rdi],1
LB_686:
	mov rsi,0
	bt r12,0
	jc LB_677
	bts rsi,17
	bt r13,0
	jc LB_677
	jmp LB_678
LB_677:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_678:
	mov rax,r8
	shl rax,56
	or rax,1
	mov rdi,rax
	or r13,rdi
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_673~0':(_lst)◂((_opn)◂((_opn)◂(t306'(0)))) }
; 	∎ {  }
	bt r12,0
	jc LB_689
	mov rdi,r13
	call dlt
LB_689:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_467:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_467
	NS_E_DYN_471:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_471
	NS_E_DYN_472:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_472
	NS_E_DYN_473:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_473
	NS_E_DYN_478:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_478
	CST_DYN_488:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_583:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_674:
		dq 0x0001_0001_00_82_ffff
		dq 1
