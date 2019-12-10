%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_3820
	call NS_E_4077
	call NS_E_4128
	call NS_E_4266
	call NS_E_4399
	call NS_E_4422
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
	mov rdi,fmt_emt_q
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	pop r13
	ret
NS_E_3434:
NS_E_RDI_3434:
NS_E_3434_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_3435
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_3435:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3437:
NS_E_RDI_3437:
NS_E_3437_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_3437_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_3437_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3438:
NS_E_RDI_3438:
NS_E_3438_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_3438_LB_0
	cmp r11,57
	ja NS_E_3438_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3438_LB_0:
	mov rax,0
	ret
NS_E_3440:
NS_E_RDI_3440:
NS_E_3440_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_3440_LB_0
	cmp r11,122
	ja NS_E_3440_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3440_LB_0:
	mov rax,0
	ret
NS_E_3439:
NS_E_RDI_3439:
NS_E_3439_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_3439_LB_0
	cmp r11,90
	ja NS_E_3439_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3439_LB_0:
	mov rax,0
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
NS_E_3436:
NS_E_RDI_3436:
NS_E_3436_ETR_TBL:
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
	jz NS_E_3436_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_3436_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3454:
; 	|» { 0' 1' }
NS_E_RDI_3454:
MTC_LB_3455:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3456
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_3457
	bt QWORD [rax],0
	jc LB_3458
	btr r12,4
	jmp LB_3459
LB_3458:
	bts r12,4
LB_3459:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3457:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3462
	btr r12,5
	jmp LB_3463
LB_3462:
	bts r12,5
LB_3463:
	mov r8,r11
	bt r12,5
	jc LB_3460
	btr r12,2
	jmp LB_3461
LB_3460:
	bts r12,2
LB_3461:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3466
	btr r12,5
	jmp LB_3467
LB_3466:
	bts r12,5
LB_3467:
	mov r9,r11
	bt r12,5
	jc LB_3464
	btr r12,3
	jmp LB_3465
LB_3464:
	bts r12,3
LB_3465:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3468:
	cmp r15,0
	jz LB_3469
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3468
LB_3469:
; _f39 %_3441 ⊢ %_3445 : %_3445
 ; {>  %_3443~2':_r64 %_3441~0':_r64 %_3444~3':(_lst)◂(_r64) }
	add r13,1
; _f3454 { %_3445 %_3444 } ⊢ { %_3446 %_3447 } : { %_3446 %_3447 }
 ; {>  %_3443~2':_r64 %_3444~3':(_lst)◂(_r64) %_3445~0':_r64 }
; _f3454 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3472
	btr r12,1
	jmp LB_3473
LB_3472:
	bts r12,1
LB_3473:
	call NS_E_3454
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3470
	btr r12,2
	jmp LB_3471
LB_3470:
	bts r12,2
LB_3471:
	add rsp,16
; _f38 %_3446 ⊢ %_3448 : %_3448
 ; {>  %_3446~0':_r64 %_3443~2':_r64 %_3447~1':_stg }
	sub r13,1
; _f16 { %_3447 %_3448 %_3443 } ⊢ { %_3449 %_3450 %_3451 } : { %_3449 %_3450 %_3451 }
 ; {>  %_3443~2':_r64 %_3447~1':_stg %_3448~0':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_3474
	btr r12,3
	jmp LB_3475
LB_3474:
	bts r12,3
LB_3475:
	mov r14,r13
	bt r12,0
	jc LB_3476
	btr r12,1
	jmp LB_3477
LB_3476:
	bts r12,1
LB_3477:
	mov r13,r9
	bt r12,3
	jc LB_3478
	btr r12,0
	jmp LB_3479
LB_3478:
	bts r12,0
LB_3479:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3450 %_3449 }
 ; {>  %_3451~2':_r64 %_3449~0':_stg %_3450~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_3480
	mov rdi,r8
	call dlt
LB_3480:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_3481
	btr r12,2
	jmp LB_3482
LB_3481:
	bts r12,2
LB_3482:
	mov r14,r13
	bt r12,0
	jc LB_3483
	btr r12,1
	jmp LB_3484
LB_3483:
	bts r12,1
LB_3484:
	mov r13,r8
	bt r12,2
	jc LB_3485
	btr r12,0
	jmp LB_3486
LB_3485:
	bts r12,0
LB_3486:
	ret
MTC_LB_3456:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3487
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_3488
	bt QWORD [rax],0
	jc LB_3489
	btr r12,2
	jmp LB_3490
LB_3489:
	bts r12,2
LB_3490:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3488:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3491:
	cmp r15,0
	jz LB_3492
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3491
LB_3492:
; _f14 %_3441 ⊢ { %_3452 %_3453 } : { %_3452 %_3453 }
 ; {>  %_3441~0':_r64 }
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
; ∎ { %_3452 %_3453 }
 ; {>  %_3452~0':_r64 %_3453~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3487:
NS_E_3497:
; 	|» 0'
NS_E_RDI_3497:
; » 0xr0 |~ {  } ⊢ %_3494 : %_3494
 ; {>  %_3493~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_3494
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3454 { %_3494 %_3493 } ⊢ { %_3495 %_3496 } : { %_3495 %_3496 }
 ; {>  %_3493~0':(_lst)◂(_r64) %_3494~1':_r64 }
; _f3454 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_3498
	btr r12,2
	jmp LB_3499
LB_3498:
	bts r12,2
LB_3499:
	mov r14,r13
	bt r12,0
	jc LB_3500
	btr r12,1
	jmp LB_3501
LB_3500:
	bts r12,1
LB_3501:
	mov r13,r8
	bt r12,2
	jc LB_3502
	btr r12,0
	jmp LB_3503
LB_3502:
	bts r12,0
LB_3503:
	call NS_E_3454
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3496
 ; {>  %_3495~0':_r64 %_3496~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_3504
	mov rdi,r13
	call dlt
LB_3504:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3505
	btr r12,0
	jmp LB_3506
LB_3505:
	bts r12,0
LB_3506:
	ret
NS_E_3507:
NS_E_RDI_3507:
NS_E_3507_ETR_TBL:
NS_E_3507_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3434_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3543
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3507_MTC_0_failed
LB_3543:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3538
	btr r12,0
	jmp LB_3539
LB_3538:
	bts r12,0
LB_3539:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3535
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_3509 : %_3509
 ; {>  %_3508~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_3509
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_3510 : %_3510
 ; {>  %_3509~1':_r64 %_3508~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_3510
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_3508 %_3509 } ⊢ { %_3511 %_3512 %_3513 } : { %_3511 %_3512 %_3513 }
 ; {>  %_3509~1':_r64 %_3510~2':_r64 %_3508~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3510 %_3511 } ⊢ { %_3514 %_3515 %_3516 } : { %_3514 %_3515 %_3516 }
 ; {>  %_3513~3':_r64 %_3511~0':_r64 %_3510~2':_r64 %_3512~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3519:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3520
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3520
LB_3521:
	cmp r15,0
	jz LB_3522
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3521
LB_3522:
; _some %_3515 ⊢ %_3517 : %_3517
 ; {>  %_3515~0':_r64 %_3514~2':_r64 %_3512~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3517
 ; {>  %_3517~°0◂0':(_opn)◂(_r64) %_3514~2':_r64 %_3512~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_3523
	mov rdi,r8
	call dlt
LB_3523:
	bt r12,1
	jc LB_3524
	mov rdi,r14
	call dlt
LB_3524:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3525
	btr r12,3
	jmp LB_3526
LB_3525:
	bts r12,3
LB_3526:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3520:
	mov r15,0
LB_3528:
	cmp r15,0
	jz LB_3529
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3528
LB_3529:
; _none {  } ⊢ %_3518 : %_3518
 ; {>  %_3513~3':_r64 %_3515~0':_r64 %_3514~2':_r64 %_3516~4':_r64 %_3512~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3518
 ; {>  %_3513~3':_r64 %_3515~0':_r64 %_3514~2':_r64 %_3518~°1◂{  }:(_opn)◂(t661'(0)) %_3516~4':_r64 %_3512~1':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_3530
	mov rdi,r9
	call dlt
LB_3530:
	bt r12,0
	jc LB_3531
	mov rdi,r13
	call dlt
LB_3531:
	bt r12,2
	jc LB_3532
	mov rdi,r8
	call dlt
LB_3532:
	bt r12,4
	jc LB_3533
	mov rdi,r10
	call dlt
LB_3533:
	bt r12,1
	jc LB_3534
	mov rdi,r14
	call dlt
LB_3534:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_3527:
LB_3535:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3537
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3536
LB_3537:
	add rsp,8
	ret
NS_E_3507_MTC_0_failed:
	add rsp,16
	pop r14
LB_3536:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3545:
NS_E_RDI_3545:
NS_E_3545_ETR_TBL:
NS_E_3545_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3434_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3581
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3545_MTC_0_failed
LB_3581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3576
	btr r12,0
	jmp LB_3577
LB_3576:
	bts r12,0
LB_3577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3573
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_3547 : %_3547
 ; {>  %_3546~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_3547
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_3548 : %_3548
 ; {>  %_3547~1':_r64 %_3546~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_3548
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_3546 %_3547 } ⊢ { %_3549 %_3550 %_3551 } : { %_3549 %_3550 %_3551 }
 ; {>  %_3548~2':_r64 %_3547~1':_r64 %_3546~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3548 %_3549 } ⊢ { %_3552 %_3553 %_3554 } : { %_3552 %_3553 %_3554 }
 ; {>  %_3549~0':_r64 %_3548~2':_r64 %_3550~1':_r64 %_3551~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3557:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3558
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3558
LB_3559:
	cmp r15,0
	jz LB_3560
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3559
LB_3560:
; _some %_3553 ⊢ %_3555 : %_3555
 ; {>  %_3550~1':_r64 %_3553~0':_r64 %_3552~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3555
 ; {>  %_3555~°0◂0':(_opn)◂(_r64) %_3550~1':_r64 %_3552~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_3561
	mov rdi,r14
	call dlt
LB_3561:
	bt r12,2
	jc LB_3562
	mov rdi,r8
	call dlt
LB_3562:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3563
	btr r12,3
	jmp LB_3564
LB_3563:
	bts r12,3
LB_3564:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3558:
	mov r15,0
LB_3566:
	cmp r15,0
	jz LB_3567
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3566
LB_3567:
; _none {  } ⊢ %_3556 : %_3556
 ; {>  %_3554~4':_r64 %_3550~1':_r64 %_3553~0':_r64 %_3552~2':_r64 %_3551~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3556
 ; {>  %_3554~4':_r64 %_3550~1':_r64 %_3553~0':_r64 %_3556~°1◂{  }:(_opn)◂(t688'(0)) %_3552~2':_r64 %_3551~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_3568
	mov rdi,r10
	call dlt
LB_3568:
	bt r12,1
	jc LB_3569
	mov rdi,r14
	call dlt
LB_3569:
	bt r12,0
	jc LB_3570
	mov rdi,r13
	call dlt
LB_3570:
	bt r12,2
	jc LB_3571
	mov rdi,r8
	call dlt
LB_3571:
	bt r12,3
	jc LB_3572
	mov rdi,r9
	call dlt
LB_3572:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_3565:
LB_3573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3575
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3574
LB_3575:
	add rsp,8
	ret
NS_E_3545_MTC_0_failed:
	add rsp,16
	pop r14
LB_3574:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3583:
NS_E_RDI_3583:
NS_E_3583_ETR_TBL:
NS_E_3583_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3434_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3619
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3583_MTC_0_failed
LB_3619:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3614
	btr r12,0
	jmp LB_3615
LB_3614:
	bts r12,0
LB_3615:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3611
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_3585 : %_3585
 ; {>  %_3584~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_3585
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_3586 : %_3586
 ; {>  %_3584~0':_r64 %_3585~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_3586
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_3584 %_3585 } ⊢ { %_3587 %_3588 %_3589 } : { %_3587 %_3588 %_3589 }
 ; {>  %_3586~2':_r64 %_3584~0':_r64 %_3585~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3586 %_3587 } ⊢ { %_3590 %_3591 %_3592 } : { %_3590 %_3591 %_3592 }
 ; {>  %_3588~1':_r64 %_3587~0':_r64 %_3586~2':_r64 %_3589~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3595:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3596
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3596
LB_3597:
	cmp r15,0
	jz LB_3598
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3597
LB_3598:
; _some %_3591 ⊢ %_3593 : %_3593
 ; {>  %_3590~2':_r64 %_3588~1':_r64 %_3591~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3593
 ; {>  %_3590~2':_r64 %_3588~1':_r64 %_3593~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_3599
	mov rdi,r8
	call dlt
LB_3599:
	bt r12,1
	jc LB_3600
	mov rdi,r14
	call dlt
LB_3600:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3601
	btr r12,3
	jmp LB_3602
LB_3601:
	bts r12,3
LB_3602:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3596:
	mov r15,0
LB_3604:
	cmp r15,0
	jz LB_3605
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3604
LB_3605:
; _none {  } ⊢ %_3594 : %_3594
 ; {>  %_3592~4':_r64 %_3590~2':_r64 %_3588~1':_r64 %_3591~0':_r64 %_3589~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3594
 ; {>  %_3592~4':_r64 %_3590~2':_r64 %_3588~1':_r64 %_3594~°1◂{  }:(_opn)◂(t715'(0)) %_3591~0':_r64 %_3589~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_3606
	mov rdi,r10
	call dlt
LB_3606:
	bt r12,2
	jc LB_3607
	mov rdi,r8
	call dlt
LB_3607:
	bt r12,1
	jc LB_3608
	mov rdi,r14
	call dlt
LB_3608:
	bt r12,0
	jc LB_3609
	mov rdi,r13
	call dlt
LB_3609:
	bt r12,3
	jc LB_3610
	mov rdi,r9
	call dlt
LB_3610:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_3603:
LB_3611:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3613
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3612
LB_3613:
	add rsp,8
	ret
NS_E_3583_MTC_0_failed:
	add rsp,16
	pop r14
LB_3612:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3621:
NS_E_RDI_3621:
NS_E_3621_ETR_TBL:
NS_E_3621_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_3583_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3636
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3621_MTC_0_failed
LB_3636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3631
	btr r12,0
	jmp LB_3632
LB_3631:
	bts r12,0
LB_3632:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3628
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_3622 ⊢ %_3623 : %_3623
 ; {>  %_3622~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3623
 ; {>  %_3623~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3626
	btr r12,3
	jmp LB_3627
LB_3626:
	bts r12,3
LB_3627:
	mov r8,0
	bts r12,2
	ret
LB_3628:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3630
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3629
LB_3630:
	add rsp,8
	ret
NS_E_3621_MTC_0_failed:
	add rsp,16
	pop r14
LB_3629:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_3545_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3648
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3621_MTC_1_failed
LB_3648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3643
	btr r12,0
	jmp LB_3644
LB_3643:
	bts r12,0
LB_3644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3640
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_3624 ⊢ %_3625 : %_3625
 ; {>  %_3624~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3625
 ; {>  %_3625~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3638
	btr r12,3
	jmp LB_3639
LB_3638:
	bts r12,3
LB_3639:
	mov r8,0
	bts r12,2
	ret
LB_3640:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3642
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3641
LB_3642:
	add rsp,8
	ret
NS_E_3621_MTC_1_failed:
	add rsp,16
	pop r14
LB_3641:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3650:
NS_E_RDI_3650:
NS_E_3650_ETR_TBL:
NS_E_3650_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3698
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3650_MTC_0_failed
LB_3698:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_3651_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3703
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3704
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3704:
	jmp NS_E_3650_MTC_0_failed
LB_3703:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3693
	btr r12,1
	jmp LB_3694
LB_3693:
	bts r12,1
LB_3694:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3691
	btr r12,0
	jmp LB_3692
LB_3691:
	bts r12,0
LB_3692:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3688
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3653 %_3654 } ⊢ %_3655 : %_3655
 ; {>  %_3654~1':(_lst)◂(_r64) %_3653~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f3497 %_3655 ⊢ %_3656 : %_3656
 ; {>  %_3655~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f3497 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_3674
	btr r12,2
	jmp LB_3675
LB_3674:
	bts r12,2
LB_3675:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_3680
	btr r12,3
	jmp LB_3681
LB_3680:
	bts r12,3
LB_3681:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_3678
	btr QWORD [rdi],0
	jmp LB_3679
LB_3678:
	bts QWORD [rdi],0
LB_3679:
	mov r9,r14
	bt r12,1
	jc LB_3684
	btr r12,3
	jmp LB_3685
LB_3684:
	bts r12,3
LB_3685:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_3682
	btr QWORD [rdi],1
	jmp LB_3683
LB_3682:
	bts QWORD [rdi],1
LB_3683:
	mov rsi,1
	bt r12,0
	jc LB_3676
	mov rsi,0
	bt r13,0
	jc LB_3676
	jmp LB_3677
LB_3676:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_3677:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_3497
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_3656 ⊢ %_3657 : %_3657
 ; {>  %_3656~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3657
 ; {>  %_3657~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3686
	btr r12,3
	jmp LB_3687
LB_3686:
	bts r12,3
LB_3687:
	mov r8,0
	bts r12,2
	ret
LB_3688:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3690
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3689
LB_3690:
	add rsp,8
	ret
NS_E_3650_MTC_0_failed:
	add rsp,32
	pop r14
LB_3689:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3651:
NS_E_RDI_3651:
NS_E_3651_ETR_TBL:
NS_E_3651_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_3652_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3726
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3651_MTC_0_failed
LB_3726:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_3651_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3731
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3732
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3732:
	jmp NS_E_3651_MTC_0_failed
LB_3731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3721
	btr r12,1
	jmp LB_3722
LB_3721:
	bts r12,1
LB_3722:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3719
	btr r12,0
	jmp LB_3720
LB_3719:
	bts r12,0
LB_3720:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3716
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3658 %_3659 } ⊢ %_3660 : %_3660
 ; {>  %_3658~0':_r64 %_3659~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3660 ⊢ %_3661 : %_3661
 ; {>  %_3660~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3661
 ; {>  %_3661~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3710
	btr r12,2
	jmp LB_3711
LB_3710:
	bts r12,2
LB_3711:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3708
	btr QWORD [rdi],0
	jmp LB_3709
LB_3708:
	bts QWORD [rdi],0
LB_3709:
	mov r8,r14
	bt r12,1
	jc LB_3714
	btr r12,2
	jmp LB_3715
LB_3714:
	bts r12,2
LB_3715:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3712
	btr QWORD [rdi],1
	jmp LB_3713
LB_3712:
	bts QWORD [rdi],1
LB_3713:
	mov rsi,1
	bt r12,3
	jc LB_3706
	mov rsi,0
	bt r9,0
	jc LB_3706
	jmp LB_3707
LB_3706:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3707:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3716:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3718
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3717
LB_3718:
	add rsp,8
	ret
NS_E_3651_MTC_0_failed:
	add rsp,32
	pop r14
LB_3717:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3736
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3662 : %_3662
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3662 ⊢ %_3663 : %_3663
 ; {>  %_3662~°1◂{  }:(_lst)◂(t759'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3663
 ; {>  %_3663~°0◂°1◂{  }:(_opn)◂((_lst)◂(t762'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_3734
	mov rsi,0
	bt r9,0
	jc LB_3734
	jmp LB_3735
LB_3734:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3735:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3736:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3738
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3737
LB_3738:
	add rsp,8
	ret
NS_E_3651_MTC_1_failed:
	add rsp,0
	pop r14
LB_3737:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3652:
NS_E_RDI_3652:
NS_E_3652_ETR_TBL:
NS_E_3652_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_3621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3749
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3652_MTC_0_failed
LB_3749:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3744
	btr r12,0
	jmp LB_3745
LB_3744:
	bts r12,0
LB_3745:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3741
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_3664 ⊢ %_3665 : %_3665
 ; {>  %_3664~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3665
 ; {>  %_3665~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3739
	btr r12,3
	jmp LB_3740
LB_3739:
	bts r12,3
LB_3740:
	mov r8,0
	bts r12,2
	ret
LB_3741:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3743
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3742
LB_3743:
	add rsp,8
	ret
NS_E_3652_MTC_0_failed:
	add rsp,16
	pop r14
LB_3742:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_3507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3768
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3652_MTC_1_failed
LB_3768:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3763
	btr r12,0
	jmp LB_3764
LB_3763:
	bts r12,0
LB_3764:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3760
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_3667
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f21 %_3667 ⊢ %_3668 : %_3668
 ; {>  %_3666~0':_r64 %_3667~1':_stg }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3753
	btr r12,0
	jmp LB_3754
LB_3753:
	bts r12,0
LB_3754:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3755
	btr r12,1
	jmp LB_3756
LB_3755:
	bts r12,1
LB_3756:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3751
	btr r12,0
	jmp LB_3752
LB_3751:
	bts r12,0
LB_3752:
	add rsp,16
; _some %_3666 ⊢ %_3669 : %_3669
 ; {>  %_3668~1':_stg %_3666~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3669
 ; {>  %_3668~1':_stg %_3669~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_3757
	mov rdi,r14
	call dlt
LB_3757:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3758
	btr r12,3
	jmp LB_3759
LB_3758:
	bts r12,3
LB_3759:
	mov r8,0
	bts r12,2
	ret
LB_3760:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3762
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3761
LB_3762:
	add rsp,8
	ret
NS_E_3652_MTC_1_failed:
	add rsp,16
	pop r14
LB_3761:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_3783
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_3783
	jmp LB_3784
LB_3783:
	jmp NS_E_3652_MTC_2_failed
LB_3784:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3776
	btr r12,0
	jmp LB_3777
LB_3776:
	bts r12,0
LB_3777:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3773
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_3670
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_3670 ⊢ %_3671 : %_3671
 ; {>  %_3670~0':_stg }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr5f |~ {  } ⊢ %_3672 : %_3672
 ; {>  %_3671~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_3672
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_3672 ⊢ %_3673 : %_3673
 ; {>  %_3671~0':_stg %_3672~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_3673
 ; {>  %_3671~0':_stg %_3673~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_3770
	mov rdi,r13
	call dlt
LB_3770:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_3771
	btr r12,3
	jmp LB_3772
LB_3771:
	bts r12,3
LB_3772:
	mov r8,0
	bts r12,2
	ret
LB_3773:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3775
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3774
LB_3775:
	add rsp,8
	ret
NS_E_3652_MTC_2_failed:
	add rsp,16
	pop r14
LB_3774:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3786:
NS_E_RDI_3786:
NS_E_3786_ETR_TBL:
NS_E_3786_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_3804
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_3804
	jmp LB_3805
LB_3804:
	jmp NS_E_3786_MTC_0_failed
LB_3805:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_3650_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3809
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3810:
	jmp NS_E_3786_MTC_0_failed
LB_3809:
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
	jc LB_3796
	btr QWORD [rdi],1
LB_3796:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3797
	btr QWORD [rdi],0
LB_3797:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3786_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_3650_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3794
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3786_MTC_1_failed
LB_3794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3789
	btr QWORD [rdi],0
LB_3789:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3786_MTC_1_failed:
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
NS_E_3820:
NS_E_RDI_3820:
; 	» "aSk7_dD0_4$ jj " _ ⊢ 0' : %_3812
	mov rdi,15
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_44_64_5f_37_6b_53_61
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_20_6a_6a_20_24_34_5f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_3813 : %_3813
 ; {>  %_3812~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_3813
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3650 { %_3812 %_3813 } ⊢ { %_3814 %_3815 %_3816 } : { %_3814 %_3815 %_3816 }
 ; {>  %_3812~0':_stg %_3813~1':_r64 }
; _f3650 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3650
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_3821
	btr r12,4
	jmp LB_3822
LB_3821:
	bts r12,4
LB_3822:
	mov r8,r9
	bt r12,3
	jc LB_3825
	btr r12,2
	jmp LB_3826
LB_3825:
	bts r12,2
LB_3826:
	mov rsi,1
	bt r12,2
	jc LB_3823
	mov rsi,0
	bt r8,0
	jc LB_3823
	jmp LB_3824
LB_3823:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_3824:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_3814 %_3815 %_3816 } ⊢ { %_3817 %_3818 %_3819 } : { %_3817 %_3818 %_3819 }
 ; {>  %_3815~1':_r64 %_3816~2':(_opn)◂(_stg) %_3814~0':_stg }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_3827
	btr r12,3
	jmp LB_3828
LB_3827:
	bts r12,3
LB_3828:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_3831
	btr r12,4
	jmp LB_3832
LB_3831:
	bts r12,4
LB_3832:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3829
	btr QWORD [rdi],0
	jmp LB_3830
LB_3829:
	bts QWORD [rdi],0
LB_3830:
	mov r10,r14
	bt r12,1
	jc LB_3835
	btr r12,4
	jmp LB_3836
LB_3835:
	bts r12,4
LB_3836:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3833
	btr QWORD [rdi],1
	jmp LB_3834
LB_3833:
	bts QWORD [rdi],1
LB_3834:
	mov r10,r8
	bt r12,2
	jc LB_3839
	btr r12,4
	jmp LB_3840
LB_3839:
	bts r12,4
LB_3840:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_3837
	btr QWORD [rdi],2
	jmp LB_3838
LB_3837:
	bts QWORD [rdi],2
LB_3838:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_3841
	btr r12,3
	jmp LB_3842
LB_3841:
	bts r12,3
LB_3842:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3845
	btr r12,4
	jmp LB_3846
LB_3845:
	bts r12,4
LB_3846:
	mov r13,r10
	bt r12,4
	jc LB_3843
	btr r12,0
	jmp LB_3844
LB_3843:
	bts r12,0
LB_3844:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3849
	btr r12,4
	jmp LB_3850
LB_3849:
	bts r12,4
LB_3850:
	mov r14,r10
	bt r12,4
	jc LB_3847
	btr r12,1
	jmp LB_3848
LB_3847:
	bts r12,1
LB_3848:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_3853
	btr r12,4
	jmp LB_3854
LB_3853:
	bts r12,4
LB_3854:
	mov r8,r10
	bt r12,4
	jc LB_3851
	btr r12,2
	jmp LB_3852
LB_3851:
	bts r12,2
LB_3852:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_3818~1':_r64 %_3817~0':_stg %_3819~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_3855
	mov rdi,r14
	call dlt
LB_3855:
	bt r12,0
	jc LB_3856
	mov rdi,r13
	call dlt
LB_3856:
	bt r12,2
	jc LB_3857
	mov rdi,r8
	call dlt
LB_3857:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3858:
NS_E_RDI_3858:
NS_E_3858_ETR_TBL:
NS_E_3858_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3898
	jmp LB_3899
LB_3898:
	jmp NS_E_3858_MTC_0_failed
LB_3899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_3859_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3903
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3904
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3904:
	jmp NS_E_3858_MTC_0_failed
LB_3903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3891
	btr r12,1
	jmp LB_3892
LB_3891:
	bts r12,1
LB_3892:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3889
	btr r12,0
	jmp LB_3890
LB_3889:
	bts r12,0
LB_3890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3886
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3906
	btr r12,2
	jmp LB_3907
LB_3906:
	bts r12,2
LB_3907:
	mov r13,r14
	bt r12,1
	jc LB_3908
	btr r12,0
	jmp LB_3909
LB_3908:
	bts r12,0
LB_3909:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f3497 %_3861 ⊢ %_3862 : %_3862
 ; {>  %_3861~0':(_lst)◂(_r64) }
; _f3497 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_3497
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_3862 ⊢ %_3863 : %_3863
 ; {>  %_3862~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3863
 ; {>  %_3863~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3884
	btr r12,3
	jmp LB_3885
LB_3884:
	bts r12,3
LB_3885:
	mov r8,0
	bts r12,2
	ret
LB_3886:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3888
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3887
LB_3888:
	add rsp,8
	ret
NS_E_3858_MTC_0_failed:
	add rsp,32
	pop r14
LB_3887:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3859:
NS_E_RDI_3859:
NS_E_3859_ETR_TBL:
NS_E_3859_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_3934
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_3934
	jmp LB_3935
LB_3934:
	jmp NS_E_3859_MTC_0_failed
LB_3935:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_3860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3939
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3940:
	jmp NS_E_3859_MTC_0_failed
LB_3939:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_3859_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3945
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3946
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3947:
	jmp NS_E_3859_MTC_0_failed
LB_3945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3927
	btr r12,2
	jmp LB_3928
LB_3927:
	bts r12,2
LB_3928:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3925
	btr r12,1
	jmp LB_3926
LB_3925:
	bts r12,1
LB_3926:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3923
	btr r12,0
	jmp LB_3924
LB_3923:
	bts r12,0
LB_3924:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3920
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3949
	btr r12,3
	jmp LB_3950
LB_3949:
	bts r12,3
LB_3950:
	mov r14,r8
	bt r12,2
	jc LB_3951
	btr r12,1
	jmp LB_3952
LB_3951:
	bts r12,1
LB_3952:
	mov r8,r13
	bt r12,0
	jc LB_3953
	btr r12,2
	jmp LB_3954
LB_3953:
	bts r12,2
LB_3954:
	mov r13,r9
	bt r12,3
	jc LB_3955
	btr r12,0
	jmp LB_3956
LB_3955:
	bts r12,0
LB_3956:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3864 %_3865 } ⊢ %_3866 : %_3866
 ; {>  %_3864~0':_r64 %_3865~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3866 ⊢ %_3867 : %_3867
 ; {>  %_3866~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3867
 ; {>  %_3867~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3914
	btr r12,2
	jmp LB_3915
LB_3914:
	bts r12,2
LB_3915:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3912
	btr QWORD [rdi],0
	jmp LB_3913
LB_3912:
	bts QWORD [rdi],0
LB_3913:
	mov r8,r14
	bt r12,1
	jc LB_3918
	btr r12,2
	jmp LB_3919
LB_3918:
	bts r12,2
LB_3919:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3916
	btr QWORD [rdi],1
	jmp LB_3917
LB_3916:
	bts QWORD [rdi],1
LB_3917:
	mov rsi,1
	bt r12,3
	jc LB_3910
	mov rsi,0
	bt r9,0
	jc LB_3910
	jmp LB_3911
LB_3910:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3911:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3920:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3922
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3921
LB_3922:
	add rsp,8
	ret
NS_E_3859_MTC_0_failed:
	add rsp,48
	pop r14
LB_3921:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3969
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3969
	jmp LB_3970
LB_3969:
	jmp NS_E_3859_MTC_1_failed
LB_3970:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3962
	btr r12,0
	jmp LB_3963
LB_3962:
	bts r12,0
LB_3963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3959
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3868 : %_3868
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3868 ⊢ %_3869 : %_3869
 ; {>  %_3868~°1◂{  }:(_lst)◂(t842'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3869
 ; {>  %_3869~°0◂°1◂{  }:(_opn)◂((_lst)◂(t845'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_3957
	mov rsi,0
	bt r9,0
	jc LB_3957
	jmp LB_3958
LB_3957:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3958:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3959:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3961
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3960
LB_3961:
	add rsp,8
	ret
NS_E_3859_MTC_1_failed:
	add rsp,16
	pop r14
LB_3960:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3434_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3991
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3859_MTC_2_failed
LB_3991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_3859_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3996
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3997:
	jmp NS_E_3859_MTC_2_failed
LB_3996:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3986
	btr r12,1
	jmp LB_3987
LB_3986:
	bts r12,1
LB_3987:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3984
	btr r12,0
	jmp LB_3985
LB_3984:
	bts r12,0
LB_3985:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3981
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3870 %_3871 } ⊢ %_3872 : %_3872
 ; {>  %_3871~1':(_lst)◂(_r64) %_3870~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3872 ⊢ %_3873 : %_3873
 ; {>  %_3872~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3873
 ; {>  %_3873~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3975
	btr r12,2
	jmp LB_3976
LB_3975:
	bts r12,2
LB_3976:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3973
	btr QWORD [rdi],0
	jmp LB_3974
LB_3973:
	bts QWORD [rdi],0
LB_3974:
	mov r8,r14
	bt r12,1
	jc LB_3979
	btr r12,2
	jmp LB_3980
LB_3979:
	bts r12,2
LB_3980:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3977
	btr QWORD [rdi],1
	jmp LB_3978
LB_3977:
	bts QWORD [rdi],1
LB_3978:
	mov rsi,1
	bt r12,3
	jc LB_3971
	mov rsi,0
	bt r9,0
	jc LB_3971
	jmp LB_3972
LB_3971:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3972:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3981:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3983
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3982
LB_3983:
	add rsp,8
	ret
NS_E_3859_MTC_2_failed:
	add rsp,32
	pop r14
LB_3982:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3860:
NS_E_RDI_3860:
NS_E_3860_ETR_TBL:
NS_E_3860_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_4011
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_4011
	jmp LB_4012
LB_4011:
	jmp NS_E_3860_MTC_0_failed
LB_4012:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4004
	btr r12,0
	jmp LB_4005
LB_4004:
	bts r12,0
LB_4005:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4001
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_3874 : %_3874
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_3874
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_3874 ⊢ %_3875 : %_3875
 ; {>  %_3874~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3875
 ; {>  %_3875~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3999
	btr r12,3
	jmp LB_4000
LB_3999:
	bts r12,3
LB_4000:
	mov r8,0
	bts r12,2
	ret
LB_4001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4003
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4002
LB_4003:
	add rsp,8
	ret
NS_E_3860_MTC_0_failed:
	add rsp,16
	pop r14
LB_4002:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_4025
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_4025
	jmp LB_4026
LB_4025:
	jmp NS_E_3860_MTC_1_failed
LB_4026:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4018
	btr r12,0
	jmp LB_4019
LB_4018:
	bts r12,0
LB_4019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4015
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_3876 : %_3876
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_3876
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_3876 ⊢ %_3877 : %_3877
 ; {>  %_3876~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3877
 ; {>  %_3877~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4013
	btr r12,3
	jmp LB_4014
LB_4013:
	bts r12,3
LB_4014:
	mov r8,0
	bts r12,2
	ret
LB_4015:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4017
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4016
LB_4017:
	add rsp,8
	ret
NS_E_3860_MTC_1_failed:
	add rsp,16
	pop r14
LB_4016:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_4039
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_4039
	jmp LB_4040
LB_4039:
	jmp NS_E_3860_MTC_2_failed
LB_4040:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4032
	btr r12,0
	jmp LB_4033
LB_4032:
	bts r12,0
LB_4033:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4029
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_3878 : %_3878
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_3878
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_3878 ⊢ %_3879 : %_3879
 ; {>  %_3878~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3879
 ; {>  %_3879~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4027
	btr r12,3
	jmp LB_4028
LB_4027:
	bts r12,3
LB_4028:
	mov r8,0
	bts r12,2
	ret
LB_4029:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4031
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4030
LB_4031:
	add rsp,8
	ret
NS_E_3860_MTC_2_failed:
	add rsp,16
	pop r14
LB_4030:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_4053
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_4053
	jmp LB_4054
LB_4053:
	jmp NS_E_3860_MTC_3_failed
LB_4054:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4046
	btr r12,0
	jmp LB_4047
LB_4046:
	bts r12,0
LB_4047:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4043
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_3880 : %_3880
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_3880
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_3880 ⊢ %_3881 : %_3881
 ; {>  %_3880~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3881
 ; {>  %_3881~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4041
	btr r12,3
	jmp LB_4042
LB_4041:
	bts r12,3
LB_4042:
	mov r8,0
	bts r12,2
	ret
LB_4043:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4045
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4044
LB_4045:
	add rsp,8
	ret
NS_E_3860_MTC_3_failed:
	add rsp,16
	pop r14
LB_4044:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_4067
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_4067
	jmp LB_4068
LB_4067:
	jmp NS_E_3860_MTC_4_failed
LB_4068:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4060
	btr r12,0
	jmp LB_4061
LB_4060:
	bts r12,0
LB_4061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4057
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_3882 : %_3882
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3882
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_3882 ⊢ %_3883 : %_3883
 ; {>  %_3882~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3883
 ; {>  %_3883~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4055
	btr r12,3
	jmp LB_4056
LB_4055:
	bts r12,3
LB_4056:
	mov r8,0
	bts r12,2
	ret
LB_4057:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4059
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4058
LB_4059:
	add rsp,8
	ret
NS_E_3860_MTC_4_failed:
	add rsp,16
	pop r14
LB_4058:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4077:
NS_E_RDI_4077:
; » _^ ..
	mov rax,19
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\"Hello\\tWorld !!\" \n"
	mov rsi,0x_74_5c_6f_6c_6c_65_48_22
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_21_21_20_64_6c_72_6f_57
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_22
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_4070 : %_4070
 ; {>  %_4069~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_4070
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3858 { %_4069 %_4070 } ⊢ { %_4071 %_4072 %_4073 } : { %_4071 %_4072 %_4073 }
 ; {>  %_4070~1':_r64 %_4069~0':_stg }
; _f3858 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3858
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_4078
	btr r12,4
	jmp LB_4079
LB_4078:
	bts r12,4
LB_4079:
	mov r8,r9
	bt r12,3
	jc LB_4082
	btr r12,2
	jmp LB_4083
LB_4082:
	bts r12,2
LB_4083:
	mov rsi,1
	bt r12,2
	jc LB_4080
	mov rsi,0
	bt r8,0
	jc LB_4080
	jmp LB_4081
LB_4080:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_4081:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_4071 %_4072 %_4073 } ⊢ { %_4074 %_4075 %_4076 } : { %_4074 %_4075 %_4076 }
 ; {>  %_4073~2':(_opn)◂(_stg) %_4071~0':_stg %_4072~1':_r64 }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_4084
	btr r12,3
	jmp LB_4085
LB_4084:
	bts r12,3
LB_4085:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_4088
	btr r12,4
	jmp LB_4089
LB_4088:
	bts r12,4
LB_4089:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4086
	btr QWORD [rdi],0
	jmp LB_4087
LB_4086:
	bts QWORD [rdi],0
LB_4087:
	mov r10,r14
	bt r12,1
	jc LB_4092
	btr r12,4
	jmp LB_4093
LB_4092:
	bts r12,4
LB_4093:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4090
	btr QWORD [rdi],1
	jmp LB_4091
LB_4090:
	bts QWORD [rdi],1
LB_4091:
	mov r10,r8
	bt r12,2
	jc LB_4096
	btr r12,4
	jmp LB_4097
LB_4096:
	bts r12,4
LB_4097:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_4094
	btr QWORD [rdi],2
	jmp LB_4095
LB_4094:
	bts QWORD [rdi],2
LB_4095:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_4098
	btr r12,3
	jmp LB_4099
LB_4098:
	bts r12,3
LB_4099:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4102
	btr r12,4
	jmp LB_4103
LB_4102:
	bts r12,4
LB_4103:
	mov r13,r10
	bt r12,4
	jc LB_4100
	btr r12,0
	jmp LB_4101
LB_4100:
	bts r12,0
LB_4101:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4106
	btr r12,4
	jmp LB_4107
LB_4106:
	bts r12,4
LB_4107:
	mov r14,r10
	bt r12,4
	jc LB_4104
	btr r12,1
	jmp LB_4105
LB_4104:
	bts r12,1
LB_4105:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_4110
	btr r12,4
	jmp LB_4111
LB_4110:
	bts r12,4
LB_4111:
	mov r8,r10
	bt r12,4
	jc LB_4108
	btr r12,2
	jmp LB_4109
LB_4108:
	bts r12,2
LB_4109:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_4076~2':(_opn)◂(_stg) %_4075~1':_r64 %_4074~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_4112
	mov rdi,r8
	call dlt
LB_4112:
	bt r12,1
	jc LB_4113
	mov rdi,r14
	call dlt
LB_4113:
	bt r12,0
	jc LB_4114
	mov rdi,r13
	call dlt
LB_4114:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4128:
NS_E_RDI_4128:
; » 0xr41 |~ {  } ⊢ %_4115 : %_4115
 ; {>  }
; 	» 0xr41 _ ⊢ 0' : %_4115
	mov rdi,0x41
	mov r13,rdi
	bts r12,0
; » 0xr42 |~ {  } ⊢ %_4116 : %_4116
 ; {>  %_4115~0':_r64 }
; 	» 0xr42 _ ⊢ 1' : %_4116
	mov rdi,0x42
	mov r14,rdi
	bts r12,1
; » 0xr43 |~ {  } ⊢ %_4117 : %_4117
 ; {>  %_4115~0':_r64 %_4116~1':_r64 }
; 	» 0xr43 _ ⊢ 2' : %_4117
	mov rdi,0x43
	mov r8,rdi
	bts r12,2
; » 0xr44 |~ {  } ⊢ %_4118 : %_4118
 ; {>  %_4115~0':_r64 %_4116~1':_r64 %_4117~2':_r64 }
; 	» 0xr44 _ ⊢ 3' : %_4118
	mov rdi,0x44
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_4119 : %_4119
 ; {>  %_4115~0':_r64 %_4116~1':_r64 %_4118~3':_r64 %_4117~2':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_4119
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _nil {  } ⊢ %_4120 : %_4120
 ; {>  %_4119~4':_r64 %_4115~0':_r64 %_4116~1':_r64 %_4118~3':_r64 %_4117~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_4115 %_4120 } ⊢ %_4121 : %_4121
 ; {>  %_4120~°1◂{  }:(_lst)◂(t926'(0)) %_4119~4':_r64 %_4115~0':_r64 %_4116~1':_r64 %_4118~3':_r64 %_4117~2':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_4116 %_4121 } ⊢ %_4122 : %_4122
 ; {>  %_4119~4':_r64 %_4116~1':_r64 %_4118~3':_r64 %_4121~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_4117~2':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _cns { %_4117 %_4122 } ⊢ %_4123 : %_4123
 ; {>  %_4119~4':_r64 %_4122~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) %_4118~3':_r64 %_4117~2':_r64 }
; _cns { 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }
; _cns { %_4118 %_4123 } ⊢ %_4124 : %_4124
 ; {>  %_4123~°0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }:(_lst)◂(_r64) %_4119~4':_r64 %_4118~3':_r64 }
; _cns { 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } ⊢ °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }
; _f3454 { %_4119 %_4124 } ⊢ { %_4125 %_4126 } : { %_4125 %_4126 }
 ; {>  %_4119~4':_r64 %_4124~°0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }:(_lst)◂(_r64) }
; _f3454 { 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
	mov r11,r14
	bt r12,1
	jc LB_4129
	btr r12,5
	jmp LB_4130
LB_4129:
	bts r12,5
LB_4130:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rcx,r9
	bt r12,3
	jc LB_4135
	btr r12,6
	jmp LB_4136
LB_4135:
	bts r12,6
LB_4136:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_4133
	btr QWORD [rdi],0
	jmp LB_4134
LB_4133:
	bts QWORD [rdi],0
LB_4134:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r9,r8
	bt r12,2
	jc LB_4143
	btr r12,3
	jmp LB_4144
LB_4143:
	bts r12,3
LB_4144:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_4141
	btr QWORD [rdi],0
	jmp LB_4142
LB_4141:
	bts QWORD [rdi],0
LB_4142:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r11
	bt r12,5
	jc LB_4151
	btr r12,2
	jmp LB_4152
LB_4151:
	bts r12,2
LB_4152:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4149
	btr QWORD [rdi],0
	jmp LB_4150
LB_4149:
	bts QWORD [rdi],0
LB_4150:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r13
	bt r12,0
	jc LB_4159
	btr r12,5
	jmp LB_4160
LB_4159:
	bts r12,5
LB_4160:
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_4157
	btr QWORD [rdi],0
	jmp LB_4158
LB_4157:
	bts QWORD [rdi],0
LB_4158:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_4163
	mov rsi,0
	bt r11,0
	jc LB_4163
	jmp LB_4164
LB_4163:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,5
LB_4164:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_4161
	btr QWORD [rdi],1
	jmp LB_4162
LB_4161:
	bts QWORD [rdi],1
LB_4162:
	mov rsi,1
	bt r12,2
	jc LB_4155
	mov rsi,0
	bt r8,0
	jc LB_4155
	jmp LB_4156
LB_4155:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_4156:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4153
	btr QWORD [rdi],1
	jmp LB_4154
LB_4153:
	bts QWORD [rdi],1
LB_4154:
	mov rsi,1
	bt r12,3
	jc LB_4147
	mov rsi,0
	bt r9,0
	jc LB_4147
	jmp LB_4148
LB_4147:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_4148:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_4145
	btr QWORD [rdi],1
	jmp LB_4146
LB_4145:
	bts QWORD [rdi],1
LB_4146:
	mov rsi,1
	bt r12,6
	jc LB_4139
	mov rsi,0
	bt rcx,0
	jc LB_4139
	jmp LB_4140
LB_4139:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rcx
	mov rcx,rax
	btr r12,6
LB_4140:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_4137
	btr QWORD [rdi],1
	jmp LB_4138
LB_4137:
	bts QWORD [rdi],1
LB_4138:
	mov rsi,1
	bt r12,1
	jc LB_4131
	mov rsi,0
	bt r14,0
	jc LB_4131
	jmp LB_4132
LB_4131:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4132:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r10
	bt r12,4
	jc LB_4165
	btr r12,0
	jmp LB_4166
LB_4165:
	bts r12,0
LB_4166:
	call NS_E_3454
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_4126 ⊢ %_4127 : %_4127
 ; {>  %_4126~1':_stg %_4125~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4169
	btr r12,0
	jmp LB_4170
LB_4169:
	bts r12,0
LB_4170:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4171
	btr r12,1
	jmp LB_4172
LB_4171:
	bts r12,1
LB_4172:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4167
	btr r12,0
	jmp LB_4168
LB_4167:
	bts r12,0
LB_4168:
	add rsp,16
; ∎ {  }
 ; {>  %_4127~1':_stg %_4125~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_4173
	mov rdi,r14
	call dlt
LB_4173:
	bt r12,0
	jc LB_4174
	mov rdi,r13
	call dlt
LB_4174:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4200:
; 	|» { 0' 1' 2' }
NS_E_RDI_4200:
; _f33 { %_4176 %_4175 } ⊢ { %_4178 %_4179 %_4180 } : { %_4178 %_4179 %_4180 }
 ; {>  %_4176~1':_r64 %_4177~2':_r64 %_4175~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_4201:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_4202
LB_4203:
	cmp r15,0
	jz LB_4204
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4203
LB_4204:
; _f36 %_4179 ⊢ { %_4181 %_4182 } : { %_4181 %_4182 }
 ; {>  %_4177~2':_r64 %_4179~0':_r64 %_4178~1':_r64 }
	mov r9,r13
	bts r12,3
; _f36 %_4178 ⊢ { %_4183 %_4184 } : { %_4183 %_4184 }
 ; {>  %_4181~0':_r64 %_4182~3':_r64 %_4177~2':_r64 %_4178~1':_r64 }
	mov r10,r14
	bts r12,4
; _f36 %_4177 ⊢ { %_4185 %_4186 } : { %_4185 %_4186 }
 ; {>  %_4183~1':_r64 %_4181~0':_r64 %_4182~3':_r64 %_4177~2':_r64 %_4184~4':_r64 }
	mov r11,r8
	bts r12,5
; _f38 %_4182 ⊢ %_4187 : %_4187
 ; {>  %_4183~1':_r64 %_4181~0':_r64 %_4182~3':_r64 %_4184~4':_r64 %_4186~5':_r64 %_4185~2':_r64 }
	sub r9,1
; _f4200 { %_4187 %_4184 %_4186 } ⊢ %_4188 : %_4188
 ; {>  %_4183~1':_r64 %_4181~0':_r64 %_4187~3':_r64 %_4184~4':_r64 %_4186~5':_r64 %_4185~2':_r64 }
; _f4200 { 3' 4' 5' } ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_4211
	btr r12,0
	jmp LB_4212
LB_4211:
	bts r12,0
LB_4212:
	mov r14,r10
	bt r12,4
	jc LB_4213
	btr r12,1
	jmp LB_4214
LB_4213:
	bts r12,1
LB_4214:
	mov r8,r11
	bt r12,5
	jc LB_4215
	btr r12,2
	jmp LB_4216
LB_4215:
	bts r12,2
LB_4216:
	call NS_E_4200
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_4217
	btr r12,3
	jmp LB_4218
LB_4217:
	bts r12,3
LB_4218:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4209
	btr r12,2
	jmp LB_4210
LB_4209:
	bts r12,2
LB_4210:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4207
	btr r12,1
	jmp LB_4208
LB_4207:
	bts r12,1
LB_4208:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4205
	btr r12,0
	jmp LB_4206
LB_4205:
	bts r12,0
LB_4206:
	add rsp,32
; _f36 %_4181 ⊢ { %_4189 %_4190 } : { %_4189 %_4190 }
 ; {>  %_4183~1':_r64 %_4181~0':_r64 %_4188~3':_r64 %_4185~2':_r64 }
	mov r10,r13
	bts r12,4
; _f36 %_4183 ⊢ { %_4191 %_4192 } : { %_4191 %_4192 }
 ; {>  %_4183~1':_r64 %_4188~3':_r64 %_4189~0':_r64 %_4190~4':_r64 %_4185~2':_r64 }
	mov r11,r14
	bts r12,5
; _f36 %_4185 ⊢ { %_4193 %_4194 } : { %_4193 %_4194 }
 ; {>  %_4191~1':_r64 %_4192~5':_r64 %_4188~3':_r64 %_4189~0':_r64 %_4190~4':_r64 %_4185~2':_r64 }
	mov rcx,r8
	bts r12,6
; _f38 %_4192 ⊢ %_4195 : %_4195
 ; {>  %_4191~1':_r64 %_4192~5':_r64 %_4193~2':_r64 %_4188~3':_r64 %_4194~6':_r64 %_4189~0':_r64 %_4190~4':_r64 }
	sub r11,1
; _f4200 { %_4195 %_4194 %_4190 } ⊢ %_4196 : %_4196
 ; {>  %_4191~1':_r64 %_4193~2':_r64 %_4188~3':_r64 %_4194~6':_r64 %_4195~5':_r64 %_4189~0':_r64 %_4190~4':_r64 }
; _f4200 { 5' 6' 4' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00001110.. |},{ 5' 6' 4' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_4227
	btr r12,0
	jmp LB_4228
LB_4227:
	bts r12,0
LB_4228:
	mov r14,rcx
	bt r12,6
	jc LB_4229
	btr r12,1
	jmp LB_4230
LB_4229:
	bts r12,1
LB_4230:
	mov r8,r10
	bt r12,4
	jc LB_4231
	btr r12,2
	jmp LB_4232
LB_4231:
	bts r12,2
LB_4232:
	call NS_E_4200
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_4233
	btr r12,4
	jmp LB_4234
LB_4233:
	bts r12,4
LB_4234:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_4225
	btr r12,3
	jmp LB_4226
LB_4225:
	bts r12,3
LB_4226:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4223
	btr r12,2
	jmp LB_4224
LB_4223:
	bts r12,2
LB_4224:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4221
	btr r12,1
	jmp LB_4222
LB_4221:
	bts r12,1
LB_4222:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4219
	btr r12,0
	jmp LB_4220
LB_4219:
	bts r12,0
LB_4220:
	add rsp,40
; _f38 %_4193 ⊢ %_4197 : %_4197
 ; {>  %_4191~1':_r64 %_4193~2':_r64 %_4188~3':_r64 %_4196~4':_r64 %_4189~0':_r64 }
	sub r8,1
; _f4200 { %_4197 %_4189 %_4191 } ⊢ %_4198 : %_4198
 ; {>  %_4191~1':_r64 %_4197~2':_r64 %_4188~3':_r64 %_4196~4':_r64 %_4189~0':_r64 }
; _f4200 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_4239
	btr r12,3
	jmp LB_4240
LB_4239:
	bts r12,3
LB_4240:
	mov r8,r14
	bt r12,1
	jc LB_4241
	btr r12,2
	jmp LB_4242
LB_4241:
	bts r12,2
LB_4242:
	mov r14,r13
	bt r12,0
	jc LB_4243
	btr r12,1
	jmp LB_4244
LB_4243:
	bts r12,1
LB_4244:
	mov r13,r9
	bt r12,3
	jc LB_4245
	btr r12,0
	jmp LB_4246
LB_4245:
	bts r12,0
LB_4246:
	call NS_E_4200
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4237
	btr r12,4
	jmp LB_4238
LB_4237:
	bts r12,4
LB_4238:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_4235
	btr r12,3
	jmp LB_4236
LB_4235:
	bts r12,3
LB_4236:
	add rsp,24
; _f4200 { %_4188 %_4196 %_4198 } ⊢ %_4199 : %_4199
 ; {>  %_4188~3':_r64 %_4198~0':_r64 %_4196~4':_r64 }
; _f4200 { 3' 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100110.. |},{ 3' 4' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,4
	jc LB_4247
	btr r12,1
	jmp LB_4248
LB_4247:
	bts r12,1
LB_4248:
	mov r8,r13
	bt r12,0
	jc LB_4249
	btr r12,2
	jmp LB_4250
LB_4249:
	bts r12,2
LB_4250:
	mov r13,r9
	bt r12,3
	jc LB_4251
	btr r12,0
	jmp LB_4252
LB_4251:
	bts r12,0
LB_4252:
	call NS_E_4200
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_4199
 ; {>  %_4199~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4202:
	mov r15,0
LB_4254:
	cmp r15,0
	jz LB_4255
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4254
LB_4255:
; ∎ %_4177
 ; {>  %_4177~2':_r64 %_4180~3':_r64 %_4179~0':_r64 %_4178~1':_r64 }
; 	∎ 2'
	bt r12,3
	jc LB_4256
	mov rdi,r9
	call dlt
LB_4256:
	bt r12,0
	jc LB_4257
	mov rdi,r13
	call dlt
LB_4257:
	bt r12,1
	jc LB_4258
	mov rdi,r14
	call dlt
LB_4258:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_4259
	btr r12,0
	jmp LB_4260
LB_4259:
	bts r12,0
LB_4260:
	ret
MTC_LB_4253:
NS_E_4266:
NS_E_RDI_4266:
; » 0xr14 |~ {  } ⊢ %_4261 : %_4261
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_4261
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_4262 : %_4262
 ; {>  %_4261~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_4262
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_4263 : %_4263
 ; {>  %_4262~1':_r64 %_4261~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_4263
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f4200 { %_4261 %_4262 %_4263 } ⊢ %_4264 : %_4264
 ; {>  %_4262~1':_r64 %_4263~2':_r64 %_4261~0':_r64 }
; _f4200 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_4200
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_4264 ⊢ %_4265 : %_4265
 ; {>  %_4264~0':_r64 }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_4265~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_4267
	mov rdi,r13
	call dlt
LB_4267:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4298:
; 	|» { 0' 1' 2' }
NS_E_RDI_4298:
; _f33 { %_4269 %_4268 } ⊢ { %_4271 %_4272 %_4273 } : { %_4271 %_4272 %_4273 }
 ; {>  %_4269~1':_r64 %_4268~0':_r64 %_4270~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_4299:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_4300
LB_4301:
	cmp r15,0
	jz LB_4302
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4301
LB_4302:
; _f38 %_4272 ⊢ %_4274 : %_4274
 ; {>  %_4272~0':_r64 %_4271~1':_r64 %_4270~2':_r64 }
	sub r13,1
; _f4298 { %_4274 %_4271 %_4270 } ⊢ { %_4275 %_4276 %_4277 %_4278 } : { %_4275 %_4276 %_4277 %_4278 }
 ; {>  %_4271~1':_r64 %_4274~0':_r64 %_4270~2':_r64 }
; _f4298 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_4298
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f39 %_4275 ⊢ %_4279 : %_4279
 ; {>  %_4278~3':_r64 %_4275~0':_r64 %_4276~1':_r64 %_4277~2':_r64 }
	add r13,1
; _f38 %_4276 ⊢ %_4280 : %_4280
 ; {>  %_4279~0':_r64 %_4278~3':_r64 %_4276~1':_r64 %_4277~2':_r64 }
	sub r14,1
; _f4298 { %_4280 %_4277 %_4279 } ⊢ { %_4281 %_4282 %_4283 %_4284 } : { %_4281 %_4282 %_4283 %_4284 }
 ; {>  %_4279~0':_r64 %_4278~3':_r64 %_4280~1':_r64 %_4277~2':_r64 }
; _f4298 { 1' 2' 0' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_4305
	btr r12,3
	jmp LB_4306
LB_4305:
	bts r12,3
LB_4306:
	mov r8,r13
	bt r12,0
	jc LB_4307
	btr r12,2
	jmp LB_4308
LB_4307:
	bts r12,2
LB_4308:
	mov r13,r14
	bt r12,1
	jc LB_4309
	btr r12,0
	jmp LB_4310
LB_4309:
	bts r12,0
LB_4310:
	mov r14,r9
	bt r12,3
	jc LB_4311
	btr r12,1
	jmp LB_4312
LB_4311:
	bts r12,1
LB_4312:
	call NS_E_4298
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r10,r9
	bt r12,3
	jc LB_4313
	btr r12,4
	jmp LB_4314
LB_4313:
	bts r12,4
LB_4314:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_4303
	btr r12,3
	jmp LB_4304
LB_4303:
	bts r12,3
LB_4304:
	add rsp,16
; _f39 %_4281 ⊢ %_4285 : %_4285
 ; {>  %_4282~1':_r64 %_4278~3':_r64 %_4284~4':_r64 %_4281~0':_r64 %_4283~2':_r64 }
	add r13,1
; _f38 %_4282 ⊢ %_4286 : %_4286
 ; {>  %_4285~0':_r64 %_4282~1':_r64 %_4278~3':_r64 %_4284~4':_r64 %_4283~2':_r64 }
	sub r14,1
; _f4298 { %_4286 %_4283 %_4285 } ⊢ { %_4287 %_4288 %_4289 %_4290 } : { %_4287 %_4288 %_4289 %_4290 }
 ; {>  %_4285~0':_r64 %_4278~3':_r64 %_4284~4':_r64 %_4286~1':_r64 %_4283~2':_r64 }
; _f4298 { 1' 2' 0' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_4319
	btr r12,3
	jmp LB_4320
LB_4319:
	bts r12,3
LB_4320:
	mov r8,r13
	bt r12,0
	jc LB_4321
	btr r12,2
	jmp LB_4322
LB_4321:
	bts r12,2
LB_4322:
	mov r13,r14
	bt r12,1
	jc LB_4323
	btr r12,0
	jmp LB_4324
LB_4323:
	bts r12,0
LB_4324:
	mov r14,r9
	bt r12,3
	jc LB_4325
	btr r12,1
	jmp LB_4326
LB_4325:
	bts r12,1
LB_4326:
	call NS_E_4298
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r11,r9
	bt r12,3
	jc LB_4327
	btr r12,5
	jmp LB_4328
LB_4327:
	bts r12,5
LB_4328:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4317
	btr r12,4
	jmp LB_4318
LB_4317:
	bts r12,4
LB_4318:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_4315
	btr r12,3
	jmp LB_4316
LB_4315:
	bts r12,3
LB_4316:
	add rsp,24
; _f39 %_4287 ⊢ %_4291 : %_4291
 ; {>  %_4288~1':_r64 %_4278~3':_r64 %_4289~2':_r64 %_4290~5':_r64 %_4284~4':_r64 %_4287~0':_r64 }
	add r13,1
; _f4298 { %_4278 %_4284 %_4290 } ⊢ { %_4292 %_4293 %_4294 %_4295 } : { %_4292 %_4293 %_4294 %_4295 }
 ; {>  %_4288~1':_r64 %_4278~3':_r64 %_4289~2':_r64 %_4291~0':_r64 %_4290~5':_r64 %_4284~4':_r64 }
; _f4298 { 3' 4' 5' } ⊢ { 3' 4' 5' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_4335
	btr r12,0
	jmp LB_4336
LB_4335:
	bts r12,0
LB_4336:
	mov r14,r10
	bt r12,4
	jc LB_4337
	btr r12,1
	jmp LB_4338
LB_4337:
	bts r12,1
LB_4338:
	mov r8,r11
	bt r12,5
	jc LB_4339
	btr r12,2
	jmp LB_4340
LB_4339:
	bts r12,2
LB_4340:
	call NS_E_4298
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 3' 4' 5' 6' }
	mov r10,r14
	bt r12,1
	jc LB_4341
	btr r12,4
	jmp LB_4342
LB_4341:
	bts r12,4
LB_4342:
	mov r11,r8
	bt r12,2
	jc LB_4343
	btr r12,5
	jmp LB_4344
LB_4343:
	bts r12,5
LB_4344:
	mov rcx,r9
	bt r12,3
	jc LB_4345
	btr r12,6
	jmp LB_4346
LB_4345:
	bts r12,6
LB_4346:
	mov r9,r13
	bt r12,0
	jc LB_4347
	btr r12,3
	jmp LB_4348
LB_4347:
	bts r12,3
LB_4348:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4333
	btr r12,2
	jmp LB_4334
LB_4333:
	bts r12,2
LB_4334:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4331
	btr r12,1
	jmp LB_4332
LB_4331:
	bts r12,1
LB_4332:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4329
	btr r12,0
	jmp LB_4330
LB_4329:
	bts r12,0
LB_4330:
	add rsp,32
; ∎ { %_4288 %_4289 %_4291 %_4295 }
 ; {>  %_4288~1':_r64 %_4289~2':_r64 %_4295~6':_r64 %_4291~0':_r64 %_4293~4':_r64 %_4294~5':_r64 %_4292~3':_r64 }
; 	∎ { 1' 2' 0' 6' }
	bt r12,4
	jc LB_4349
	mov rdi,r10
	call dlt
LB_4349:
	bt r12,5
	jc LB_4350
	mov rdi,r11
	call dlt
LB_4350:
	bt r12,3
	jc LB_4351
	mov rdi,r9
	call dlt
LB_4351:
; _emt_mov_ptn_to_ptn:{| 11100010.. |},{ 1' 2' 0' 6' } ⊢ { 0' 1' 2' 3' }
	mov r9,rcx
	bt r12,6
	jc LB_4352
	btr r12,3
	jmp LB_4353
LB_4352:
	bts r12,3
LB_4353:
	mov r10,r8
	bt r12,2
	jc LB_4354
	btr r12,4
	jmp LB_4355
LB_4354:
	bts r12,4
LB_4355:
	mov r8,r13
	bt r12,0
	jc LB_4356
	btr r12,2
	jmp LB_4357
LB_4356:
	bts r12,2
LB_4357:
	mov r13,r14
	bt r12,1
	jc LB_4358
	btr r12,0
	jmp LB_4359
LB_4358:
	bts r12,0
LB_4359:
	mov r14,r10
	bt r12,4
	jc LB_4360
	btr r12,1
	jmp LB_4361
LB_4360:
	bts r12,1
LB_4361:
	ret
MTC_LB_4300:
	mov r15,0
LB_4363:
	cmp r15,0
	jz LB_4364
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4363
LB_4364:
; _f36 %_4270 ⊢ { %_4296 %_4297 } : { %_4296 %_4297 }
 ; {>  %_4272~0':_r64 %_4271~1':_r64 %_4273~3':_r64 %_4270~2':_r64 }
	mov r10,r8
	bts r12,4
; ∎ { %_4272 %_4271 %_4296 %_4297 }
 ; {>  %_4272~0':_r64 %_4297~4':_r64 %_4271~1':_r64 %_4273~3':_r64 %_4296~2':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_4365
	mov rdi,r9
	call dlt
LB_4365:
; _emt_mov_ptn_to_ptn:{| 111010.. |},{ 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r9,r10
	bt r12,4
	jc LB_4366
	btr r12,3
	jmp LB_4367
LB_4366:
	bts r12,3
LB_4367:
	ret
MTC_LB_4362:
NS_E_4377:
; 	|» 0'
NS_E_RDI_4377:
MTC_LB_4378:
	mov r15,0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz MTC_LB_4379
LB_4380:
	cmp r15,0
	jz LB_4381
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4380
LB_4381:
; » 0xr1 |~ {  } ⊢ %_4369 : %_4369
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_4369
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_4369
 ; {>  %_4369~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4379:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r13
	jnz MTC_LB_4382
LB_4383:
	cmp r15,0
	jz LB_4384
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4383
LB_4384:
; » 0xr1 |~ {  } ⊢ %_4370 : %_4370
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_4370
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_4370
 ; {>  %_4370~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4382:
	mov r15,0
LB_4386:
	cmp r15,0
	jz LB_4387
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4386
LB_4387:
; _f36 %_4368 ⊢ { %_4371 %_4372 } : { %_4371 %_4372 }
 ; {>  %_4368~0':_r64 }
	mov r14,r13
	bts r12,1
; _f38 %_4372 ⊢ %_4373 : %_4373
 ; {>  %_4372~1':_r64 %_4371~0':_r64 }
	sub r14,1
; _f4377 %_4373 ⊢ %_4374 : %_4374
 ; {>  %_4371~0':_r64 %_4373~1':_r64 }
; _f4377 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4390
	btr r12,0
	jmp LB_4391
LB_4390:
	bts r12,0
LB_4391:
	call NS_E_4377
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4392
	btr r12,1
	jmp LB_4393
LB_4392:
	bts r12,1
LB_4393:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4388
	btr r12,0
	jmp LB_4389
LB_4388:
	bts r12,0
LB_4389:
	add rsp,16
; _f40 { %_4371 %_4374 } ⊢ { %_4375 %_4376 } : { %_4375 %_4376 }
 ; {>  %_4374~1':_r64 %_4371~0':_r64 }
	imul r13,r14
; ∎ %_4375
 ; {>  %_4375~0':_r64 %_4376~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_4394
	mov rdi,r14
	call dlt
LB_4394:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_4385:
NS_E_4399:
NS_E_RDI_4399:
; » 0xr0 |~ {  } ⊢ %_4395 : %_4395
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_4395
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr4 |~ {  } ⊢ %_4396 : %_4396
 ; {>  %_4395~0':_r64 }
; 	» 0xr4 _ ⊢ 1' : %_4396
	mov rdi,0x4
	mov r14,rdi
	bts r12,1
; _f4377 %_4396 ⊢ %_4397 : %_4397
 ; {>  %_4396~1':_r64 %_4395~0':_r64 }
; _f4377 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4402
	btr r12,0
	jmp LB_4403
LB_4402:
	bts r12,0
LB_4403:
	call NS_E_4377
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4404
	btr r12,1
	jmp LB_4405
LB_4404:
	bts r12,1
LB_4405:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4400
	btr r12,0
	jmp LB_4401
LB_4400:
	bts r12,0
LB_4401:
	add rsp,16
; _f21 %_4397 ⊢ %_4398 : %_4398
 ; {>  %_4397~1':_r64 %_4395~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4408
	btr r12,0
	jmp LB_4409
LB_4408:
	bts r12,0
LB_4409:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4410
	btr r12,1
	jmp LB_4411
LB_4410:
	bts r12,1
LB_4411:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4406
	btr r12,0
	jmp LB_4407
LB_4406:
	bts r12,0
LB_4407:
	add rsp,16
; ∎ {  }
 ; {>  %_4398~1':_r64 %_4395~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_4412
	mov rdi,r14
	call dlt
LB_4412:
	bt r12,0
	jc LB_4413
	mov rdi,r13
	call dlt
LB_4413:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4422:
NS_E_RDI_4422:
; » 0xr14 |~ {  } ⊢ %_4414 : %_4414
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_4414
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_4415 : %_4415
 ; {>  %_4414~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_4415
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_4416 : %_4416
 ; {>  %_4414~0':_r64 %_4415~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_4416
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f4298 { %_4414 %_4415 %_4416 } ⊢ { %_4417 %_4418 %_4419 %_4420 } : { %_4417 %_4418 %_4419 %_4420 }
 ; {>  %_4414~0':_r64 %_4416~2':_r64 %_4415~1':_r64 }
; _f4298 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_4298
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_4420 ⊢ %_4421 : %_4421
 ; {>  %_4417~0':_r64 %_4420~3':_r64 %_4418~1':_r64 %_4419~2':_r64 }
; _f21 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_4429
	btr r12,0
	jmp LB_4430
LB_4429:
	bts r12,0
LB_4430:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_4431
	btr r12,3
	jmp LB_4432
LB_4431:
	bts r12,3
LB_4432:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4427
	btr r12,2
	jmp LB_4428
LB_4427:
	bts r12,2
LB_4428:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4425
	btr r12,1
	jmp LB_4426
LB_4425:
	bts r12,1
LB_4426:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4423
	btr r12,0
	jmp LB_4424
LB_4423:
	bts r12,0
LB_4424:
	add rsp,32
; ∎ {  }
 ; {>  %_4421~3':_r64 %_4417~0':_r64 %_4418~1':_r64 %_4419~2':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_4433
	mov rdi,r9
	call dlt
LB_4433:
	bt r12,0
	jc LB_4434
	mov rdi,r13
	call dlt
LB_4434:
	bt r12,1
	jc LB_4435
	mov rdi,r14
	call dlt
LB_4435:
	bt r12,2
	jc LB_4436
	mov rdi,r8
	call dlt
LB_4436:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_3434:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3434
	NS_E_DYN_3437:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3437
	NS_E_DYN_3438:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3438
	NS_E_DYN_3439:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3439
	NS_E_DYN_3440:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3440
	NS_E_DYN_3454:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3454
	NS_E_DYN_3497:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3497
	NS_E_DYN_3507:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3507
	NS_E_DYN_3545:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3545
	NS_E_DYN_3583:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3583
	NS_E_DYN_3621:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3621
	NS_E_DYN_3650:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3650
	NS_E_DYN_3651:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3651
	NS_E_DYN_3652:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3652
	CST_DYN_3820:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_3858:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3858
	NS_E_DYN_3859:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3859
	NS_E_DYN_3860:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3860
	CST_DYN_4077:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_4128:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_4200:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4200
	CST_DYN_4266:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_4298:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4298
	NS_E_DYN_4377:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4377
	CST_DYN_4399:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_4422:
		dq 0x0000_0001_00_82_ffff
		dq 1
