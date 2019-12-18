%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_44002
	call NS_E_48874
	call exec_out
	jmp _end
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_26: dq 0
NS_E_26:
NS_E_RDI_26:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_40451:
NS_E_RDI_40451:
NS_E_40451_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_40452
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_40452:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_40454:
NS_E_RDI_40454:
NS_E_40454_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_40454_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_40454_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_40455:
NS_E_RDI_40455:
NS_E_40455_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_40455_LB_0
	cmp r11,57
	ja NS_E_40455_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_40455_LB_0:
	mov rax,0
	ret
NS_E_40457:
NS_E_RDI_40457:
NS_E_40457_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_40457_LB_0
	cmp r11,122
	ja NS_E_40457_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_40457_LB_0:
	mov rax,0
	ret
NS_E_40456:
NS_E_RDI_40456:
NS_E_40456_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_40456_LB_0
	cmp r11,90
	ja NS_E_40456_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_40456_LB_0:
	mov rax,0
	ret
NS_E_33:
	mov rdi,r13
	bt r12,0
NS_E_RDI_33:
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
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_25: dq 0
NS_E_25:
NS_E_RDI_25:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_40453:
NS_E_RDI_40453:
NS_E_40453_ETR_TBL:
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
	jz NS_E_40453_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_40453_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_40464:
; 	|» { 0' 1' }
NS_E_RDI_40464:
MTC_LB_40465:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_40466
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_40467
	bt QWORD [rdi],0
	jc LB_40468
	btr r12,2
	jmp LB_40469
LB_40468:
	bts r12,2
LB_40469:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_40467:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_40470:
	cmp r15,0
	jz LB_40471
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40470
LB_40471:
; ∎ %_40458
 ; {>  %_40458~0':(_lst)◂(t15572'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_40466:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_40472
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_40473
	bt QWORD [rdi],0
	jc LB_40474
	btr r12,4
	jmp LB_40475
LB_40474:
	bts r12,4
LB_40475:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_40473:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_40478
	btr r12,5
	jmp LB_40479
LB_40478:
	bts r12,5
LB_40479:
	mov r8,r11
	bt r12,5
	jc LB_40476
	btr r12,2
	jmp LB_40477
LB_40476:
	bts r12,2
LB_40477:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_40482
	btr r12,5
	jmp LB_40483
LB_40482:
	bts r12,5
LB_40483:
	mov r9,r11
	bt r12,5
	jc LB_40480
	btr r12,3
	jmp LB_40481
LB_40480:
	bts r12,3
LB_40481:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_40484:
	cmp r15,0
	jz LB_40485
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40484
LB_40485:
; _cns { %_40460 %_40458 } ⊢ %_40462 : %_40462
 ; {>  %_40458~0':(_lst)◂(t15572'(-1)) %_40461~3':(_lst)◂(t15572'(-1)) %_40460~2':t15572'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f40464 { %_40462 %_40461 } ⊢ %_40463 : %_40463
 ; {>  %_40462~°0◂{ 2' 0' }:(_lst)◂(t15572'(-1)) %_40461~3':(_lst)◂(t15572'(-1)) }
; _f40464 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_40486
	btr r12,1
	jmp LB_40487
LB_40486:
	bts r12,1
LB_40487:
	mov r9,r13
	bt r12,0
	jc LB_40488
	btr r12,3
	jmp LB_40489
LB_40488:
	bts r12,3
LB_40489:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_40494
	btr r12,4
	jmp LB_40495
LB_40494:
	bts r12,4
LB_40495:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_40492
	btr QWORD [rdi],0
	jmp LB_40493
LB_40492:
	bts QWORD [rdi],0
LB_40493:
	mov r10,r9
	bt r12,3
	jc LB_40498
	btr r12,4
	jmp LB_40499
LB_40498:
	bts r12,4
LB_40499:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_40496
	btr QWORD [rdi],1
	jmp LB_40497
LB_40496:
	bts QWORD [rdi],1
LB_40497:
	mov rsi,1
	bt r12,0
	jc LB_40490
	mov rsi,0
	bt r13,0
	jc LB_40490
	jmp LB_40491
LB_40490:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_40491:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_40464
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_40463
 ; {>  %_40463~0':(_lst)◂(t15572'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_40472:
NS_E_40503:
; 	|» 0'
NS_E_RDI_40503:
; _nil {  } ⊢ %_40501 : %_40501
 ; {>  %_40500~0':(_lst)◂(t15593'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f40464 { %_40501 %_40500 } ⊢ %_40502 : %_40502
 ; {>  %_40500~0':(_lst)◂(t15593'(-1)) %_40501~°1◂{  }:(_lst)◂(t15590'(0)) }
; _f40464 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_40504
	btr r12,1
	jmp LB_40505
LB_40504:
	bts r12,1
LB_40505:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_40506
	mov rsi,0
	bt r13,0
	jc LB_40506
	jmp LB_40507
LB_40506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_40507:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_40464
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_40502
 ; {>  %_40502~0':(_lst)◂(t15593'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_40521:
; 	|» { 0' 1' }
NS_E_RDI_40521:
MTC_LB_40522:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_40523
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_40524
	bt QWORD [rdi],0
	jc LB_40525
	btr r12,4
	jmp LB_40526
LB_40525:
	bts r12,4
LB_40526:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_40524:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_40529
	btr r12,5
	jmp LB_40530
LB_40529:
	bts r12,5
LB_40530:
	mov r8,r11
	bt r12,5
	jc LB_40527
	btr r12,2
	jmp LB_40528
LB_40527:
	bts r12,2
LB_40528:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_40533
	btr r12,5
	jmp LB_40534
LB_40533:
	bts r12,5
LB_40534:
	mov r9,r11
	bt r12,5
	jc LB_40531
	btr r12,3
	jmp LB_40532
LB_40531:
	bts r12,3
LB_40532:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_40535:
	cmp r15,0
	jz LB_40536
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40535
LB_40536:
; _f44 %_40508 ⊢ %_40512 : %_40512
 ; {>  %_40510~2':_r64 %_40508~0':_r64 %_40511~3':(_lst)◂(_r64) }
	add r13,1
; _f40521 { %_40512 %_40511 } ⊢ { %_40513 %_40514 } : { %_40513 %_40514 }
 ; {>  %_40512~0':_r64 %_40510~2':_r64 %_40511~3':(_lst)◂(_r64) }
; _f40521 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_40539
	btr r12,1
	jmp LB_40540
LB_40539:
	bts r12,1
LB_40540:
	call NS_E_40521
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_40537
	btr r12,2
	jmp LB_40538
LB_40537:
	bts r12,2
LB_40538:
	add rsp,16
; _f43 %_40513 ⊢ %_40515 : %_40515
 ; {>  %_40510~2':_r64 %_40514~1':_stg %_40513~0':_r64 }
	sub r13,1
; _f21 { %_40514 %_40515 %_40510 } ⊢ { %_40516 %_40517 %_40518 } : { %_40516 %_40517 %_40518 }
 ; {>  %_40510~2':_r64 %_40514~1':_stg %_40515~0':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_40541
	btr r12,3
	jmp LB_40542
LB_40541:
	bts r12,3
LB_40542:
	mov r14,r13
	bt r12,0
	jc LB_40543
	btr r12,1
	jmp LB_40544
LB_40543:
	bts r12,1
LB_40544:
	mov r13,r9
	bt r12,3
	jc LB_40545
	btr r12,0
	jmp LB_40546
LB_40545:
	bts r12,0
LB_40546:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_40517 %_40516 }
 ; {>  %_40517~1':_r64 %_40518~2':_r64 %_40516~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_40547
	mov rdi,r8
	call dlt
LB_40547:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_40548
	btr r12,2
	jmp LB_40549
LB_40548:
	bts r12,2
LB_40549:
	mov r14,r13
	bt r12,0
	jc LB_40550
	btr r12,1
	jmp LB_40551
LB_40550:
	bts r12,1
LB_40551:
	mov r13,r8
	bt r12,2
	jc LB_40552
	btr r12,0
	jmp LB_40553
LB_40552:
	bts r12,0
LB_40553:
	ret
MTC_LB_40523:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_40554
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_40555
	bt QWORD [rdi],0
	jc LB_40556
	btr r12,2
	jmp LB_40557
LB_40556:
	bts r12,2
LB_40557:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_40555:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_40558:
	cmp r15,0
	jz LB_40559
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40558
LB_40559:
; _f19 %_40508 ⊢ { %_40519 %_40520 } : { %_40519 %_40520 }
 ; {>  %_40508~0':_r64 }
; _f19 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_40519 %_40520 }
 ; {>  %_40520~1':_stg %_40519~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_40554:
NS_E_40564:
; 	|» 0'
NS_E_RDI_40564:
; » 0xr0 |~ {  } ⊢ %_40561 : %_40561
 ; {>  %_40560~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_40561
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f40521 { %_40561 %_40560 } ⊢ { %_40562 %_40563 } : { %_40562 %_40563 }
 ; {>  %_40560~0':(_lst)◂(_r64) %_40561~1':_r64 }
; _f40521 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_40565
	btr r12,2
	jmp LB_40566
LB_40565:
	bts r12,2
LB_40566:
	mov r14,r13
	bt r12,0
	jc LB_40567
	btr r12,1
	jmp LB_40568
LB_40567:
	bts r12,1
LB_40568:
	mov r13,r8
	bt r12,2
	jc LB_40569
	btr r12,0
	jmp LB_40570
LB_40569:
	bts r12,0
LB_40570:
	call NS_E_40521
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_40563
 ; {>  %_40562~0':_r64 %_40563~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_40571
	mov rdi,r13
	call dlt
LB_40571:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_40572
	btr r12,0
	jmp LB_40573
LB_40572:
	bts r12,0
LB_40573:
	ret
NS_E_40574:
NS_E_RDI_40574:
NS_E_40574_ETR_TBL:
NS_E_40574_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_40615
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_40615
	jmp LB_40616
LB_40615:
	jmp LB_40605
LB_40616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_40575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40620
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40621
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40621:
	jmp LB_40605
LB_40620:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40608
	btr r12,1
	jmp LB_40609
LB_40608:
	bts r12,1
LB_40609:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40606
	btr r12,0
	jmp LB_40607
LB_40606:
	bts r12,0
LB_40607:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_40602
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_40623
	btr r12,2
	jmp LB_40624
LB_40623:
	bts r12,2
LB_40624:
	mov r13,r14
	bt r12,1
	jc LB_40625
	btr r12,0
	jmp LB_40626
LB_40625:
	bts r12,0
LB_40626:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f40564 %_40577 ⊢ %_40578 : %_40578
 ; {>  %_40577~0':(_lst)◂(_r64) }
; _f40564 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_40564
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_40578 ⊢ %_40579 : %_40579
 ; {>  %_40578~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_40579
 ; {>  %_40579~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40600
	btr r12,3
	jmp LB_40601
LB_40600:
	bts r12,3
LB_40601:
	mov r8,0
	bts r12,2
	ret
LB_40602:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40604
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40603
LB_40604:
	add rsp,8
	ret
LB_40605:
	add rsp,32
	pop r14
LB_40603:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40575:
NS_E_RDI_40575:
NS_E_40575_ETR_TBL:
NS_E_40575_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_40652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_40652
	jmp LB_40653
LB_40652:
	jmp LB_40640
LB_40653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_40576_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40657
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40658
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40658:
	jmp LB_40640
LB_40657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_40575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40663
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_40664
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_40664:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40665
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40665:
	jmp LB_40640
LB_40663:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_40645
	btr r12,2
	jmp LB_40646
LB_40645:
	bts r12,2
LB_40646:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40643
	btr r12,1
	jmp LB_40644
LB_40643:
	bts r12,1
LB_40644:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40641
	btr r12,0
	jmp LB_40642
LB_40641:
	bts r12,0
LB_40642:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_40637
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_40667
	btr r12,3
	jmp LB_40668
LB_40667:
	bts r12,3
LB_40668:
	mov r14,r8
	bt r12,2
	jc LB_40669
	btr r12,1
	jmp LB_40670
LB_40669:
	bts r12,1
LB_40670:
	mov r8,r13
	bt r12,0
	jc LB_40671
	btr r12,2
	jmp LB_40672
LB_40671:
	bts r12,2
LB_40672:
	mov r13,r9
	bt r12,3
	jc LB_40673
	btr r12,0
	jmp LB_40674
LB_40673:
	bts r12,0
LB_40674:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_40580 %_40581 } ⊢ %_40582 : %_40582
 ; {>  %_40580~0':_r64 %_40581~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_40582 ⊢ %_40583 : %_40583
 ; {>  %_40582~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_40583
 ; {>  %_40583~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_40631
	btr r12,2
	jmp LB_40632
LB_40631:
	bts r12,2
LB_40632:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_40629
	btr QWORD [rdi],0
	jmp LB_40630
LB_40629:
	bts QWORD [rdi],0
LB_40630:
	mov r8,r14
	bt r12,1
	jc LB_40635
	btr r12,2
	jmp LB_40636
LB_40635:
	bts r12,2
LB_40636:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_40633
	btr QWORD [rdi],1
	jmp LB_40634
LB_40633:
	bts QWORD [rdi],1
LB_40634:
	mov rsi,1
	bt r12,3
	jc LB_40627
	mov rsi,0
	bt r9,0
	jc LB_40627
	jmp LB_40628
LB_40627:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_40628:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_40637:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40639
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40638
LB_40639:
	add rsp,8
	ret
LB_40640:
	add rsp,48
	pop r14
LB_40638:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_40688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_40688
	jmp LB_40689
LB_40688:
	jmp LB_40680
LB_40689:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40681
	btr r12,0
	jmp LB_40682
LB_40681:
	bts r12,0
LB_40682:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40677
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_40584 : %_40584
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_40584 ⊢ %_40585 : %_40585
 ; {>  %_40584~°1◂{  }:(_lst)◂(t15651'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_40585
 ; {>  %_40585~°0◂°1◂{  }:(_opn)◂((_lst)◂(t15654'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_40675
	mov rsi,0
	bt r9,0
	jc LB_40675
	jmp LB_40676
LB_40675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_40676:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_40677:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40679
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40678
LB_40679:
	add rsp,8
	ret
LB_40680:
	add rsp,16
	pop r14
LB_40678:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_40451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40711
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40703
LB_40711:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_40575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40716
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40717
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40717:
	jmp LB_40703
LB_40716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40706
	btr r12,1
	jmp LB_40707
LB_40706:
	bts r12,1
LB_40707:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40704
	btr r12,0
	jmp LB_40705
LB_40704:
	bts r12,0
LB_40705:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_40700
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_40586 %_40587 } ⊢ %_40588 : %_40588
 ; {>  %_40587~1':(_lst)◂(_r64) %_40586~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_40588 ⊢ %_40589 : %_40589
 ; {>  %_40588~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_40589
 ; {>  %_40589~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_40694
	btr r12,2
	jmp LB_40695
LB_40694:
	bts r12,2
LB_40695:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_40692
	btr QWORD [rdi],0
	jmp LB_40693
LB_40692:
	bts QWORD [rdi],0
LB_40693:
	mov r8,r14
	bt r12,1
	jc LB_40698
	btr r12,2
	jmp LB_40699
LB_40698:
	bts r12,2
LB_40699:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_40696
	btr QWORD [rdi],1
	jmp LB_40697
LB_40696:
	bts QWORD [rdi],1
LB_40697:
	mov rsi,1
	bt r12,3
	jc LB_40690
	mov rsi,0
	bt r9,0
	jc LB_40690
	jmp LB_40691
LB_40690:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_40691:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_40700:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40702
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40701
LB_40702:
	add rsp,8
	ret
LB_40703:
	add rsp,32
	pop r14
LB_40701:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40576:
NS_E_RDI_40576:
NS_E_40576_ETR_TBL:
NS_E_40576_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_40732
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_40732
	jmp LB_40733
LB_40732:
	jmp LB_40724
LB_40733:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40725
	btr r12,0
	jmp LB_40726
LB_40725:
	bts r12,0
LB_40726:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40721
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_40590 : %_40590
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_40590
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_40590 ⊢ %_40591 : %_40591
 ; {>  %_40590~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40591
 ; {>  %_40591~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40719
	btr r12,3
	jmp LB_40720
LB_40719:
	bts r12,3
LB_40720:
	mov r8,0
	bts r12,2
	ret
LB_40721:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40723
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40722
LB_40723:
	add rsp,8
	ret
LB_40724:
	add rsp,16
	pop r14
LB_40722:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_40747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_40747
	jmp LB_40748
LB_40747:
	jmp LB_40739
LB_40748:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40740
	btr r12,0
	jmp LB_40741
LB_40740:
	bts r12,0
LB_40741:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40736
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_40592 : %_40592
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_40592
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_40592 ⊢ %_40593 : %_40593
 ; {>  %_40592~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40593
 ; {>  %_40593~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40734
	btr r12,3
	jmp LB_40735
LB_40734:
	bts r12,3
LB_40735:
	mov r8,0
	bts r12,2
	ret
LB_40736:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40738
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40737
LB_40738:
	add rsp,8
	ret
LB_40739:
	add rsp,16
	pop r14
LB_40737:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_40762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_40762
	jmp LB_40763
LB_40762:
	jmp LB_40754
LB_40763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40755
	btr r12,0
	jmp LB_40756
LB_40755:
	bts r12,0
LB_40756:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40751
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_40594 : %_40594
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_40594
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_40594 ⊢ %_40595 : %_40595
 ; {>  %_40594~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40595
 ; {>  %_40595~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40749
	btr r12,3
	jmp LB_40750
LB_40749:
	bts r12,3
LB_40750:
	mov r8,0
	bts r12,2
	ret
LB_40751:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40753
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40752
LB_40753:
	add rsp,8
	ret
LB_40754:
	add rsp,16
	pop r14
LB_40752:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_40777
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_40777
	jmp LB_40778
LB_40777:
	jmp LB_40769
LB_40778:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40770
	btr r12,0
	jmp LB_40771
LB_40770:
	bts r12,0
LB_40771:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40766
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_40596 : %_40596
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_40596
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_40596 ⊢ %_40597 : %_40597
 ; {>  %_40596~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40597
 ; {>  %_40597~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40764
	btr r12,3
	jmp LB_40765
LB_40764:
	bts r12,3
LB_40765:
	mov r8,0
	bts r12,2
	ret
LB_40766:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40768
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40767
LB_40768:
	add rsp,8
	ret
LB_40769:
	add rsp,16
	pop r14
LB_40767:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_40792
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_40792
	jmp LB_40793
LB_40792:
	jmp LB_40784
LB_40793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40785
	btr r12,0
	jmp LB_40786
LB_40785:
	bts r12,0
LB_40786:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40781
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_40598 : %_40598
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_40598
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_40598 ⊢ %_40599 : %_40599
 ; {>  %_40598~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40599
 ; {>  %_40599~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40779
	btr r12,3
	jmp LB_40780
LB_40779:
	bts r12,3
LB_40780:
	mov r8,0
	bts r12,2
	ret
LB_40781:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40783
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40782
LB_40783:
	add rsp,8
	ret
LB_40784:
	add rsp,16
	pop r14
LB_40782:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40794:
NS_E_RDI_40794:
NS_E_40794_ETR_TBL:
NS_E_40794_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_40451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40831
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40825
LB_40831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40826
	btr r12,0
	jmp LB_40827
LB_40826:
	bts r12,0
LB_40827:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40822
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_40796 : %_40796
 ; {>  %_40795~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_40796
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_40797 : %_40797
 ; {>  %_40795~0':_r64 %_40796~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_40797
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_40795 %_40796 } ⊢ { %_40798 %_40799 %_40800 } : { %_40798 %_40799 %_40800 }
 ; {>  %_40795~0':_r64 %_40796~1':_r64 %_40797~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_40797 %_40798 } ⊢ { %_40801 %_40802 %_40803 } : { %_40801 %_40802 %_40803 }
 ; {>  %_40799~1':_r64 %_40800~3':_r64 %_40798~0':_r64 %_40797~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_40806:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_40807
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_40807
LB_40808:
	cmp r15,0
	jz LB_40809
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40808
LB_40809:
; _some %_40802 ⊢ %_40804 : %_40804
 ; {>  %_40802~0':_r64 %_40801~2':_r64 %_40799~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40804
 ; {>  %_40804~°0◂0':(_opn)◂(_r64) %_40801~2':_r64 %_40799~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_40810
	mov rdi,r8
	call dlt
LB_40810:
	bt r12,1
	jc LB_40811
	mov rdi,r14
	call dlt
LB_40811:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40812
	btr r12,3
	jmp LB_40813
LB_40812:
	bts r12,3
LB_40813:
	mov r8,0
	bts r12,2
	ret
MTC_LB_40807:
	mov r15,0
LB_40815:
	cmp r15,0
	jz LB_40816
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40815
LB_40816:
; _none {  } ⊢ %_40805 : %_40805
 ; {>  %_40802~0':_r64 %_40801~2':_r64 %_40799~1':_r64 %_40803~4':_r64 %_40800~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_40805
 ; {>  %_40802~0':_r64 %_40801~2':_r64 %_40805~°1◂{  }:(_opn)◂(t15730'(0)) %_40799~1':_r64 %_40803~4':_r64 %_40800~3':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_40817
	mov rdi,r13
	call dlt
LB_40817:
	bt r12,2
	jc LB_40818
	mov rdi,r8
	call dlt
LB_40818:
	bt r12,1
	jc LB_40819
	mov rdi,r14
	call dlt
LB_40819:
	bt r12,4
	jc LB_40820
	mov rdi,r10
	call dlt
LB_40820:
	bt r12,3
	jc LB_40821
	mov rdi,r9
	call dlt
LB_40821:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_40814:
LB_40822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40824
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40823
LB_40824:
	add rsp,8
	ret
LB_40825:
	add rsp,16
	pop r14
LB_40823:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40833:
NS_E_RDI_40833:
NS_E_40833_ETR_TBL:
NS_E_40833_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_40451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40870
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40864
LB_40870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40865
	btr r12,0
	jmp LB_40866
LB_40865:
	bts r12,0
LB_40866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40861
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_40835 : %_40835
 ; {>  %_40834~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_40835
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_40836 : %_40836
 ; {>  %_40835~1':_r64 %_40834~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_40836
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_40834 %_40835 } ⊢ { %_40837 %_40838 %_40839 } : { %_40837 %_40838 %_40839 }
 ; {>  %_40835~1':_r64 %_40834~0':_r64 %_40836~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_40836 %_40837 } ⊢ { %_40840 %_40841 %_40842 } : { %_40840 %_40841 %_40842 }
 ; {>  %_40838~1':_r64 %_40839~3':_r64 %_40837~0':_r64 %_40836~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_40845:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_40846
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_40846
LB_40847:
	cmp r15,0
	jz LB_40848
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40847
LB_40848:
; _some %_40841 ⊢ %_40843 : %_40843
 ; {>  %_40838~1':_r64 %_40841~0':_r64 %_40840~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40843
 ; {>  %_40838~1':_r64 %_40843~°0◂0':(_opn)◂(_r64) %_40840~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_40849
	mov rdi,r14
	call dlt
LB_40849:
	bt r12,2
	jc LB_40850
	mov rdi,r8
	call dlt
LB_40850:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40851
	btr r12,3
	jmp LB_40852
LB_40851:
	bts r12,3
LB_40852:
	mov r8,0
	bts r12,2
	ret
MTC_LB_40846:
	mov r15,0
LB_40854:
	cmp r15,0
	jz LB_40855
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40854
LB_40855:
; _none {  } ⊢ %_40844 : %_40844
 ; {>  %_40838~1':_r64 %_40842~4':_r64 %_40839~3':_r64 %_40841~0':_r64 %_40840~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_40844
 ; {>  %_40838~1':_r64 %_40842~4':_r64 %_40839~3':_r64 %_40841~0':_r64 %_40844~°1◂{  }:(_opn)◂(t15757'(0)) %_40840~2':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_40856
	mov rdi,r14
	call dlt
LB_40856:
	bt r12,4
	jc LB_40857
	mov rdi,r10
	call dlt
LB_40857:
	bt r12,3
	jc LB_40858
	mov rdi,r9
	call dlt
LB_40858:
	bt r12,0
	jc LB_40859
	mov rdi,r13
	call dlt
LB_40859:
	bt r12,2
	jc LB_40860
	mov rdi,r8
	call dlt
LB_40860:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_40853:
LB_40861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40863
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40862
LB_40863:
	add rsp,8
	ret
LB_40864:
	add rsp,16
	pop r14
LB_40862:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40872:
NS_E_RDI_40872:
NS_E_40872_ETR_TBL:
NS_E_40872_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_40451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40909
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40903
LB_40909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40904
	btr r12,0
	jmp LB_40905
LB_40904:
	bts r12,0
LB_40905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40900
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_40874 : %_40874
 ; {>  %_40873~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_40874
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_40875 : %_40875
 ; {>  %_40874~1':_r64 %_40873~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_40875
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_40873 %_40874 } ⊢ { %_40876 %_40877 %_40878 } : { %_40876 %_40877 %_40878 }
 ; {>  %_40874~1':_r64 %_40873~0':_r64 %_40875~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_40875 %_40876 } ⊢ { %_40879 %_40880 %_40881 } : { %_40879 %_40880 %_40881 }
 ; {>  %_40877~1':_r64 %_40876~0':_r64 %_40878~3':_r64 %_40875~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_40884:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_40885
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_40885
LB_40886:
	cmp r15,0
	jz LB_40887
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40886
LB_40887:
; _some %_40880 ⊢ %_40882 : %_40882
 ; {>  %_40877~1':_r64 %_40880~0':_r64 %_40879~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40882
 ; {>  %_40877~1':_r64 %_40879~2':_r64 %_40882~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_40888
	mov rdi,r14
	call dlt
LB_40888:
	bt r12,2
	jc LB_40889
	mov rdi,r8
	call dlt
LB_40889:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40890
	btr r12,3
	jmp LB_40891
LB_40890:
	bts r12,3
LB_40891:
	mov r8,0
	bts r12,2
	ret
MTC_LB_40885:
	mov r15,0
LB_40893:
	cmp r15,0
	jz LB_40894
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_40893
LB_40894:
; _none {  } ⊢ %_40883 : %_40883
 ; {>  %_40881~4':_r64 %_40877~1':_r64 %_40880~0':_r64 %_40879~2':_r64 %_40878~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_40883
 ; {>  %_40881~4':_r64 %_40877~1':_r64 %_40883~°1◂{  }:(_opn)◂(t15784'(0)) %_40880~0':_r64 %_40879~2':_r64 %_40878~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_40895
	mov rdi,r10
	call dlt
LB_40895:
	bt r12,1
	jc LB_40896
	mov rdi,r14
	call dlt
LB_40896:
	bt r12,0
	jc LB_40897
	mov rdi,r13
	call dlt
LB_40897:
	bt r12,2
	jc LB_40898
	mov rdi,r8
	call dlt
LB_40898:
	bt r12,3
	jc LB_40899
	mov rdi,r9
	call dlt
LB_40899:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_40892:
LB_40900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40902
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40901
LB_40902:
	add rsp,8
	ret
LB_40903:
	add rsp,16
	pop r14
LB_40901:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40911:
NS_E_RDI_40911:
NS_E_40911_ETR_TBL:
NS_E_40911_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_40872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40921
LB_40927:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40922
	btr r12,0
	jmp LB_40923
LB_40922:
	bts r12,0
LB_40923:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40918
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_40912 ⊢ %_40913 : %_40913
 ; {>  %_40912~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40913
 ; {>  %_40913~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40916
	btr r12,3
	jmp LB_40917
LB_40916:
	bts r12,3
LB_40917:
	mov r8,0
	bts r12,2
	ret
LB_40918:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40920
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40919
LB_40920:
	add rsp,8
	ret
LB_40921:
	add rsp,16
	pop r14
LB_40919:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_40833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40940
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40934
LB_40940:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40935
	btr r12,0
	jmp LB_40936
LB_40935:
	bts r12,0
LB_40936:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_40931
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_40914 ⊢ %_40915 : %_40915
 ; {>  %_40914~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40915
 ; {>  %_40915~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40929
	btr r12,3
	jmp LB_40930
LB_40929:
	bts r12,3
LB_40930:
	mov r8,0
	bts r12,2
	ret
LB_40931:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40933
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40932
LB_40933:
	add rsp,8
	ret
LB_40934:
	add rsp,16
	pop r14
LB_40932:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40942:
NS_E_RDI_40942:
NS_E_40942_ETR_TBL:
NS_E_40942_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_40911_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40987
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40979
LB_40987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_40943_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_40992
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_40993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_40993:
	jmp LB_40979
LB_40992:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_40982
	btr r12,1
	jmp LB_40983
LB_40982:
	bts r12,1
LB_40983:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_40980
	btr r12,0
	jmp LB_40981
LB_40980:
	bts r12,0
LB_40981:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_40976
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_40945 %_40946 } ⊢ %_40947 : %_40947
 ; {>  %_40946~1':(_lst)◂(_r64) %_40945~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f40564 %_40947 ⊢ %_40948 : %_40948
 ; {>  %_40947~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f40564 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_40962
	btr r12,2
	jmp LB_40963
LB_40962:
	bts r12,2
LB_40963:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_40968
	btr r12,3
	jmp LB_40969
LB_40968:
	bts r12,3
LB_40969:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_40966
	btr QWORD [rdi],0
	jmp LB_40967
LB_40966:
	bts QWORD [rdi],0
LB_40967:
	mov r9,r14
	bt r12,1
	jc LB_40972
	btr r12,3
	jmp LB_40973
LB_40972:
	bts r12,3
LB_40973:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_40970
	btr QWORD [rdi],1
	jmp LB_40971
LB_40970:
	bts QWORD [rdi],1
LB_40971:
	mov rsi,1
	bt r12,0
	jc LB_40964
	mov rsi,0
	bt r13,0
	jc LB_40964
	jmp LB_40965
LB_40964:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_40965:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_40564
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_40948 ⊢ %_40949 : %_40949
 ; {>  %_40948~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_40949
 ; {>  %_40949~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_40974
	btr r12,3
	jmp LB_40975
LB_40974:
	bts r12,3
LB_40975:
	mov r8,0
	bts r12,2
	ret
LB_40976:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_40978
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_40977
LB_40978:
	add rsp,8
	ret
LB_40979:
	add rsp,32
	pop r14
LB_40977:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40943:
NS_E_RDI_40943:
NS_E_40943_ETR_TBL:
NS_E_40943_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_40944_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41016
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41008
LB_41016:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_40943_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41021
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41022
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41022:
	jmp LB_41008
LB_41021:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_41011
	btr r12,1
	jmp LB_41012
LB_41011:
	bts r12,1
LB_41012:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41009
	btr r12,0
	jmp LB_41010
LB_41009:
	bts r12,0
LB_41010:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_41005
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_40950 %_40951 } ⊢ %_40952 : %_40952
 ; {>  %_40950~0':_r64 %_40951~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_40952 ⊢ %_40953 : %_40953
 ; {>  %_40952~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_40953
 ; {>  %_40953~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_40999
	btr r12,2
	jmp LB_41000
LB_40999:
	bts r12,2
LB_41000:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_40997
	btr QWORD [rdi],0
	jmp LB_40998
LB_40997:
	bts QWORD [rdi],0
LB_40998:
	mov r8,r14
	bt r12,1
	jc LB_41003
	btr r12,2
	jmp LB_41004
LB_41003:
	bts r12,2
LB_41004:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_41001
	btr QWORD [rdi],1
	jmp LB_41002
LB_41001:
	bts QWORD [rdi],1
LB_41002:
	mov rsi,1
	bt r12,3
	jc LB_40995
	mov rsi,0
	bt r9,0
	jc LB_40995
	jmp LB_40996
LB_40995:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_40996:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_41005:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41007
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41006
LB_41007:
	add rsp,8
	ret
LB_41008:
	add rsp,32
	pop r14
LB_41006:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_41026
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_40954 : %_40954
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_40954 ⊢ %_40955 : %_40955
 ; {>  %_40954~°1◂{  }:(_lst)◂(t15828'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_40955
 ; {>  %_40955~°0◂°1◂{  }:(_opn)◂((_lst)◂(t15831'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_41024
	mov rsi,0
	bt r9,0
	jc LB_41024
	jmp LB_41025
LB_41024:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_41025:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_41026:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41028
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41027
LB_41028:
	add rsp,8
	ret
LB_41029:
	add rsp,0
	pop r14
LB_41027:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_40944:
NS_E_RDI_40944:
NS_E_40944_ETR_TBL:
NS_E_40944_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_40911_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41041
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41035
LB_41041:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41036
	btr r12,0
	jmp LB_41037
LB_41036:
	bts r12,0
LB_41037:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_41032
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_40956 ⊢ %_40957 : %_40957
 ; {>  %_40956~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40957
 ; {>  %_40957~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_41030
	btr r12,3
	jmp LB_41031
LB_41030:
	bts r12,3
LB_41031:
	mov r8,0
	bts r12,2
	ret
LB_41032:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41034
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41033
LB_41034:
	add rsp,8
	ret
LB_41035:
	add rsp,16
	pop r14
LB_41033:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_40794_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41054
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41048
LB_41054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41049
	btr r12,0
	jmp LB_41050
LB_41049:
	bts r12,0
LB_41050:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_41045
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_40958 ⊢ %_40959 : %_40959
 ; {>  %_40958~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40959
 ; {>  %_40959~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_41043
	btr r12,3
	jmp LB_41044
LB_41043:
	bts r12,3
LB_41044:
	mov r8,0
	bts r12,2
	ret
LB_41045:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41047
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41046
LB_41047:
	add rsp,8
	ret
LB_41048:
	add rsp,16
	pop r14
LB_41046:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_41069
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_41069
	jmp LB_41070
LB_41069:
	jmp LB_41061
LB_41070:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41062
	btr r12,0
	jmp LB_41063
LB_41062:
	bts r12,0
LB_41063:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_41058
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_40960 : %_40960
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_40960
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_40960 ⊢ %_40961 : %_40961
 ; {>  %_40960~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_40961
 ; {>  %_40961~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_41056
	btr r12,3
	jmp LB_41057
LB_41056:
	bts r12,3
LB_41057:
	mov r8,0
	bts r12,2
	ret
LB_41058:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41060
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41059
LB_41060:
	add rsp,8
	ret
LB_41061:
	add rsp,16
	pop r14
LB_41059:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_41071:
NS_E_RDI_41071:
NS_E_41071_ETR_TBL:
NS_E_41071_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_41092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_41092
	jmp LB_41093
LB_41092:
	jmp LB_41082
LB_41093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_40943_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_41098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_41098:
	jmp LB_41082
LB_41097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_41085
	btr r12,1
	jmp LB_41086
LB_41085:
	bts r12,1
LB_41086:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41083
	btr r12,0
	jmp LB_41084
LB_41083:
	bts r12,0
LB_41084:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_41079
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_41100
	btr r12,2
	jmp LB_41101
LB_41100:
	bts r12,2
LB_41101:
	mov r13,r14
	bt r12,1
	jc LB_41102
	btr r12,0
	jmp LB_41103
LB_41102:
	bts r12,0
LB_41103:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f40564 %_41072 ⊢ %_41073 : %_41073
 ; {>  %_41072~0':(_lst)◂(_r64) }
; _f40564 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_40564
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_41073 ⊢ %_41074 : %_41074
 ; {>  %_41073~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_41074
 ; {>  %_41074~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_41077
	btr r12,3
	jmp LB_41078
LB_41077:
	bts r12,3
LB_41078:
	mov r8,0
	bts r12,2
	ret
LB_41079:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41081
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41080
LB_41081:
	add rsp,8
	ret
LB_41082:
	add rsp,32
	pop r14
LB_41080:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_41115
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41109
LB_41115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_41110
	btr r12,0
	jmp LB_41111
LB_41110:
	bts r12,0
LB_41111:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_41106
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_41075 ⊢ %_41076 : %_41076
 ; {>  %_41075~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_41076
 ; {>  %_41076~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_41104
	btr r12,3
	jmp LB_41105
LB_41104:
	bts r12,3
LB_41105:
	mov r8,0
	bts r12,2
	ret
LB_41106:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_41108
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_41107
LB_41108:
	add rsp,8
	ret
LB_41109:
	add rsp,16
	pop r14
LB_41107:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_41128:
; 	|» 0'
NS_E_RDI_41128:
MTC_LB_41129:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41130
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41131
	bt QWORD [rdi],0
	jc LB_41132
	btr r12,3
	jmp LB_41133
LB_41132:
	bts r12,3
LB_41133:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41131:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_41136
	btr r12,4
	jmp LB_41137
LB_41136:
	bts r12,4
LB_41137:
	mov r14,r10
	bt r12,4
	jc LB_41134
	btr r12,1
	jmp LB_41135
LB_41134:
	bts r12,1
LB_41135:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_41140
	btr r12,4
	jmp LB_41141
LB_41140:
	bts r12,4
LB_41141:
	mov r8,r10
	bt r12,4
	jc LB_41138
	btr r12,2
	jmp LB_41139
LB_41138:
	bts r12,2
LB_41139:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41142:
	cmp r15,0
	jz LB_41143
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41142
LB_41143:
; _f41128 %_41122 ⊢ %_41123 : %_41123
 ; {>  %_41122~2':_p41117 %_41121~1':_stg }
; _f41128 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_41146
	btr r12,0
	jmp LB_41147
LB_41146:
	bts r12,0
LB_41147:
	call NS_E_41128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_41144
	btr r12,1
	jmp LB_41145
LB_41144:
	bts r12,1
LB_41145:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41126
 ; {>  %_41125~0':_stg %_41126~2':_stg %_41124~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_41148
	mov rdi,r13
	call dlt
LB_41148:
	bt r12,1
	jc LB_41149
	mov rdi,r14
	call dlt
LB_41149:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_41150
	btr r12,0
	jmp LB_41151
LB_41150:
	bts r12,0
LB_41151:
	ret
MTC_LB_41130:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41152
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41153
	bt QWORD [rdi],0
	jc LB_41154
	btr r12,2
	jmp LB_41155
LB_41154:
	bts r12,2
LB_41155:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41153:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41156
	btr r12,1
	jmp LB_41157
LB_41156:
	bts r12,1
LB_41157:
LB_41158:
	cmp r15,0
	jz LB_41159
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41158
LB_41159:
; ∎ %_41127
 ; {>  %_41127~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41160
	btr r12,0
	jmp LB_41161
LB_41160:
	bts r12,0
LB_41161:
	ret
MTC_LB_41152:
NS_E_41272:
; 	|» 0'
NS_E_RDI_41272:
MTC_LB_41273:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41274
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41275
	bt QWORD [rdi],0
	jc LB_41276
	btr r12,2
	jmp LB_41277
LB_41276:
	bts r12,2
LB_41277:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41275:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41278
	btr r12,1
	jmp LB_41279
LB_41278:
	bts r12,1
LB_41279:
LB_41280:
	cmp r15,0
	jz LB_41281
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41280
LB_41281:
; 	» "??r" _ ⊢ 0' : %_41267
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41267
 ; {>  %_41267~0':_stg %_41266~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_41282
	mov rdi,r14
	call dlt
LB_41282:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41274:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41283
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41284
	bt QWORD [rdi],0
	jc LB_41285
	btr r12,2
	jmp LB_41286
LB_41285:
	bts r12,2
LB_41286:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41284:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41287
	btr r12,1
	jmp LB_41288
LB_41287:
	bts r12,1
LB_41288:
LB_41289:
	cmp r15,0
	jz LB_41290
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41289
LB_41290:
; 	» ".." _ ⊢ 0' : %_41269
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41269
 ; {>  %_41269~0':_stg %_41268~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_41291
	mov rdi,r14
	call dlt
LB_41291:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41283:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_41292
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41293
	bt QWORD [rdi],0
	jc LB_41294
	btr r12,2
	jmp LB_41295
LB_41294:
	bts r12,2
LB_41295:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41293:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41296
	btr r12,1
	jmp LB_41297
LB_41296:
	bts r12,1
LB_41297:
LB_41298:
	cmp r15,0
	jz LB_41299
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41298
LB_41299:
; _f41128 %_41270 ⊢ %_41271 : %_41271
 ; {>  %_41270~1':_p41117 }
; _f41128 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41300
	btr r12,0
	jmp LB_41301
LB_41300:
	bts r12,0
LB_41301:
	call NS_E_41128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_41271
 ; {>  %_41271~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41292:
NS_E_41342:
; 	|» 0'
NS_E_RDI_41342:
MTC_LB_41343:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41344
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41345
	bt QWORD [rdi],0
	jc LB_41346
	btr r12,3
	jmp LB_41347
LB_41346:
	bts r12,3
LB_41347:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41345:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_41350
	btr r12,4
	jmp LB_41351
LB_41350:
	bts r12,4
LB_41351:
	mov r14,r10
	bt r12,4
	jc LB_41348
	btr r12,1
	jmp LB_41349
LB_41348:
	bts r12,1
LB_41349:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_41354
	btr r12,4
	jmp LB_41355
LB_41354:
	bts r12,4
LB_41355:
	mov r8,r10
	bt r12,4
	jc LB_41352
	btr r12,2
	jmp LB_41353
LB_41352:
	bts r12,2
LB_41353:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41356:
	cmp r15,0
	jz LB_41357
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41356
LB_41357:
; _f41332 %_41334 ⊢ %_41336 : %_41336
 ; {>  %_41334~1':_p41181 %_41335~2':(_lst)◂(_p41181) }
; _f41332 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41360
	btr r12,0
	jmp LB_41361
LB_41360:
	bts r12,0
LB_41361:
	call NS_E_41332
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_41358
	btr r12,2
	jmp LB_41359
LB_41358:
	bts r12,2
LB_41359:
	add rsp,16
; _f41342 %_41335 ⊢ %_41337 : %_41337
 ; {>  %_41335~2':(_lst)◂(_p41181) %_41336~0':_stg }
; _f41342 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_41364
	btr r12,0
	jmp LB_41365
LB_41364:
	bts r12,0
LB_41365:
	call NS_E_41342
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_41366
	btr r12,1
	jmp LB_41367
LB_41366:
	bts r12,1
LB_41367:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41362
	btr r12,0
	jmp LB_41363
LB_41362:
	bts r12,0
LB_41363:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41340
 ; {>  %_41339~1':_stg %_41338~0':_stg %_41340~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_41368
	mov rdi,r14
	call dlt
LB_41368:
	bt r12,0
	jc LB_41369
	mov rdi,r13
	call dlt
LB_41369:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_41370
	btr r12,0
	jmp LB_41371
LB_41370:
	bts r12,0
LB_41371:
	ret
MTC_LB_41344:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41372
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41373
	bt QWORD [rdi],0
	jc LB_41374
	btr r12,1
	jmp LB_41375
LB_41374:
	bts r12,1
LB_41375:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41373:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41376:
	cmp r15,0
	jz LB_41377
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41376
LB_41377:
; 	» "" _ ⊢ 0' : %_41341
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41341
 ; {>  %_41341~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41372:
NS_E_41332:
; 	|» 0'
NS_E_RDI_41332:
MTC_LB_41378:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41379
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41380
	bt QWORD [rdi],0
	jc LB_41381
	btr r12,2
	jmp LB_41382
LB_41381:
	bts r12,2
LB_41382:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41380:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41383
	btr r12,1
	jmp LB_41384
LB_41383:
	bts r12,1
LB_41384:
LB_41385:
	cmp r15,0
	jz LB_41386
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41385
LB_41386:
; _f41342 %_41325 ⊢ %_41326 : %_41326
 ; {>  %_41325~1':(_lst)◂(_p41181) }
; _f41342 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41387
	btr r12,0
	jmp LB_41388
LB_41387:
	bts r12,0
LB_41388:
	call NS_E_41342
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_41328
 ; {>  %_41328~1':_stg %_41327~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_41389
	mov rdi,r13
	call dlt
LB_41389:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41390
	btr r12,0
	jmp LB_41391
LB_41390:
	bts r12,0
LB_41391:
	ret
MTC_LB_41379:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41392
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41393
	bt QWORD [rdi],0
	jc LB_41394
	btr r12,2
	jmp LB_41395
LB_41394:
	bts r12,2
LB_41395:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41393:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41396
	btr r12,1
	jmp LB_41397
LB_41396:
	bts r12,1
LB_41397:
LB_41398:
	cmp r15,0
	jz LB_41399
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41398
LB_41399:
MTC_LB_41400:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41401
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_41402
	bt QWORD [rdi],0
	jc LB_41403
	btr r12,0
	jmp LB_41404
LB_41403:
	bts r12,0
LB_41404:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41402:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41405:
	cmp r15,0
	jz LB_41406
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41405
LB_41406:
; 	» "_ " _ ⊢ 0' : %_41330
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41330
 ; {>  %_41330~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41401:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41407
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_41408
	bt QWORD [rdi],0
	jc LB_41409
	btr r12,2
	jmp LB_41410
LB_41409:
	bts r12,2
LB_41410:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41408:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_41411
	btr r12,0
	jmp LB_41412
LB_41411:
	bts r12,0
LB_41412:
LB_41413:
	cmp r15,0
	jz LB_41414
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41413
LB_41414:
; ∎ %_41331
 ; {>  %_41331~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41407:
MTC_LB_41392:
NS_E_41323:
; 	|» 0'
NS_E_RDI_41323:
MTC_LB_41415:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41416
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41417
	bt QWORD [rdi],0
	jc LB_41418
	btr r12,3
	jmp LB_41419
LB_41418:
	bts r12,3
LB_41419:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41417:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_41422
	btr r12,4
	jmp LB_41423
LB_41422:
	bts r12,4
LB_41423:
	mov r14,r10
	bt r12,4
	jc LB_41420
	btr r12,1
	jmp LB_41421
LB_41420:
	bts r12,1
LB_41421:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_41426
	btr r12,4
	jmp LB_41427
LB_41426:
	bts r12,4
LB_41427:
	mov r8,r10
	bt r12,4
	jc LB_41424
	btr r12,2
	jmp LB_41425
LB_41424:
	bts r12,2
LB_41425:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41428:
	cmp r15,0
	jz LB_41429
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41428
LB_41429:
; _f41313 %_41315 ⊢ %_41317 : %_41317
 ; {>  %_41316~2':(_lst)◂(_p41180) %_41315~1':_p41180 }
; _f41313 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41432
	btr r12,0
	jmp LB_41433
LB_41432:
	bts r12,0
LB_41433:
	call NS_E_41313
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_41430
	btr r12,2
	jmp LB_41431
LB_41430:
	bts r12,2
LB_41431:
	add rsp,16
; _f41323 %_41316 ⊢ %_41318 : %_41318
 ; {>  %_41317~0':_stg %_41316~2':(_lst)◂(_p41180) }
; _f41323 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_41436
	btr r12,0
	jmp LB_41437
LB_41436:
	bts r12,0
LB_41437:
	call NS_E_41323
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_41438
	btr r12,1
	jmp LB_41439
LB_41438:
	bts r12,1
LB_41439:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_41434
	btr r12,0
	jmp LB_41435
LB_41434:
	bts r12,0
LB_41435:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41321
 ; {>  %_41321~2':_stg %_41320~1':_stg %_41319~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_41440
	mov rdi,r14
	call dlt
LB_41440:
	bt r12,0
	jc LB_41441
	mov rdi,r13
	call dlt
LB_41441:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_41442
	btr r12,0
	jmp LB_41443
LB_41442:
	bts r12,0
LB_41443:
	ret
MTC_LB_41416:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41444
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41445
	bt QWORD [rdi],0
	jc LB_41446
	btr r12,1
	jmp LB_41447
LB_41446:
	bts r12,1
LB_41447:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41445:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41448:
	cmp r15,0
	jz LB_41449
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41448
LB_41449:
; 	» "" _ ⊢ 0' : %_41322
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41322
 ; {>  %_41322~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41444:
NS_E_41313:
; 	|» 0'
NS_E_RDI_41313:
MTC_LB_41450:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41451
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41452
	bt QWORD [rdi],0
	jc LB_41453
	btr r12,2
	jmp LB_41454
LB_41453:
	bts r12,2
LB_41454:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41452:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41455
	btr r12,1
	jmp LB_41456
LB_41455:
	bts r12,1
LB_41456:
LB_41457:
	cmp r15,0
	jz LB_41458
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41457
LB_41458:
; _f41323 %_41303 ⊢ %_41304 : %_41304
 ; {>  %_41303~1':(_lst)◂(_p41180) }
; _f41323 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41459
	btr r12,0
	jmp LB_41460
LB_41459:
	bts r12,0
LB_41460:
	call NS_E_41323
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_41306
 ; {>  %_41306~1':_stg %_41305~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_41461
	mov rdi,r13
	call dlt
LB_41461:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41462
	btr r12,0
	jmp LB_41463
LB_41462:
	bts r12,0
LB_41463:
	ret
MTC_LB_41451:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41464
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_41465
	bt QWORD [rdi],0
	jc LB_41466
	btr r12,2
	jmp LB_41467
LB_41466:
	bts r12,2
LB_41467:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41465:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_41468
	btr r12,1
	jmp LB_41469
LB_41468:
	bts r12,1
LB_41469:
LB_41470:
	cmp r15,0
	jz LB_41471
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41470
LB_41471:
MTC_LB_41472:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41473
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂0'
; 1' ⊢ °0◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_41474
	bt QWORD [rdi],0
	jc LB_41475
	btr r12,2
	jmp LB_41476
LB_41475:
	bts r12,2
LB_41476:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41474:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_41477
	btr r12,0
	jmp LB_41478
LB_41477:
	bts r12,0
LB_41478:
LB_41479:
	cmp r15,0
	jz LB_41480
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41479
LB_41480:
; _f41272 %_41308 ⊢ %_41309 : %_41309
 ; {>  %_41308~0':_p41183 }
; _f41272 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_41272
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; ∎ %_41311
 ; {>  %_41311~1':_stg %_41310~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_41481
	mov rdi,r13
	call dlt
LB_41481:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_41482
	btr r12,0
	jmp LB_41483
LB_41482:
	bts r12,0
LB_41483:
	ret
MTC_LB_41473:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41484
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_41485
	bt QWORD [rdi],0
	jc LB_41486
	btr r12,2
	jmp LB_41487
LB_41486:
	bts r12,2
LB_41487:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41485:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_41488
	btr r12,0
	jmp LB_41489
LB_41488:
	bts r12,0
LB_41489:
LB_41490:
	cmp r15,0
	jz LB_41491
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41490
LB_41491:
; ∎ %_41312
 ; {>  %_41312~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_41484:
MTC_LB_41464:
NS_E_41904:
; 	|» { 0' 1' }
NS_E_RDI_41904:
MTC_LB_41905:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41906
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' }
; 1' ⊢ °0◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_41907
	bt QWORD [rdi],0
	jc LB_41908
	btr r12,5
	jmp LB_41909
LB_41908:
	bts r12,5
LB_41909:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41907:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_41912
	btr r12,6
	jmp LB_41913
LB_41912:
	bts r12,6
LB_41913:
	mov r8,rcx
	bt r12,6
	jc LB_41910
	btr r12,2
	jmp LB_41911
LB_41910:
	bts r12,2
LB_41911:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_41916
	btr r12,6
	jmp LB_41917
LB_41916:
	bts r12,6
LB_41917:
	mov r9,rcx
	bt r12,6
	jc LB_41914
	btr r12,3
	jmp LB_41915
LB_41914:
	bts r12,3
LB_41915:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_41920
	btr r12,6
	jmp LB_41921
LB_41920:
	bts r12,6
LB_41921:
	mov r10,rcx
	bt r12,6
	jc LB_41918
	btr r12,4
	jmp LB_41919
LB_41918:
	bts r12,4
LB_41919:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41922:
	cmp r15,0
	jz LB_41923
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41922
LB_41923:
; _f41904 { %_41865 %_41869 } ⊢ { %_41870 %_41871 } : { %_41870 %_41871 }
 ; {>  %_41868~3':_p41186 %_41865~0':_r64 %_41869~4':_p41185 %_41867~2':(_lst)◂(_p41187) }
; _f41904 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_41928
	btr r12,1
	jmp LB_41929
LB_41928:
	bts r12,1
LB_41929:
	call NS_E_41904
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_41926
	btr r12,3
	jmp LB_41927
LB_41926:
	bts r12,3
LB_41927:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_41924
	btr r12,2
	jmp LB_41925
LB_41924:
	bts r12,2
LB_41925:
	add rsp,24
MTC_LB_41930:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41931
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_41932
	bt QWORD [rdi],0
	jc LB_41933
	btr r12,5
	jmp LB_41934
LB_41933:
	bts r12,5
LB_41934:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41932:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_41935
	btr r12,4
	jmp LB_41936
LB_41935:
	bts r12,4
LB_41936:
LB_41937:
	cmp r15,0
	jz LB_41938
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41937
LB_41938:
; _f41904 { %_41870 %_41872 } ⊢ { %_41873 %_41874 } : { %_41873 %_41874 }
 ; {>  %_41872~4':_p41185 %_41870~0':_r64 %_41871~1':_stg %_41867~2':(_lst)◂(_p41187) }
; _f41904 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_41943
	btr r12,1
	jmp LB_41944
LB_41943:
	bts r12,1
LB_41944:
	call NS_E_41904
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_41945
	btr r12,3
	jmp LB_41946
LB_41945:
	bts r12,3
LB_41946:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_41941
	btr r12,2
	jmp LB_41942
LB_41941:
	bts r12,2
LB_41942:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_41939
	btr r12,1
	jmp LB_41940
LB_41939:
	bts r12,1
LB_41940:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_41947:
	cmp rax,0
	jz LB_41948
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_41947
LB_41948:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41875 %_41878 }
 ; {>  %_41877~3':_stg %_41878~4':_stg %_41875~0':_r64 %_41867~2':(_lst)◂(_p41187) %_41876~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_41949
	mov rdi,r9
	call dlt
LB_41949:
	bt r12,2
	jc LB_41950
	mov rdi,r8
	call dlt
LB_41950:
	bt r12,1
	jc LB_41951
	mov rdi,r14
	call dlt
LB_41951:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_41952
	btr r12,1
	jmp LB_41953
LB_41952:
	bts r12,1
LB_41953:
	ret
MTC_LB_41931:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41954
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_41955
	bt QWORD [rdi],0
	jc LB_41956
	btr r12,5
	jmp LB_41957
LB_41956:
	bts r12,5
LB_41957:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41955:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_41958
	btr r12,4
	jmp LB_41959
LB_41958:
	bts r12,4
LB_41959:
LB_41960:
	cmp r15,0
	jz LB_41961
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41960
LB_41961:
; _f44 %_41870 ⊢ %_41880 : %_41880
 ; {>  %_41879~4':_p41184 %_41870~0':_r64 %_41871~1':_stg %_41867~2':(_lst)◂(_p41187) }
	add r13,1
; _f41828 { %_41880 %_41879 } ⊢ { %_41881 %_41882 } : { %_41881 %_41882 }
 ; {>  %_41879~4':_p41184 %_41871~1':_stg %_41880~0':_r64 %_41867~2':(_lst)◂(_p41187) }
; _f41828 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_41966
	btr r12,1
	jmp LB_41967
LB_41966:
	bts r12,1
LB_41967:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_41968
	btr r12,3
	jmp LB_41969
LB_41968:
	bts r12,3
LB_41969:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_41964
	btr r12,2
	jmp LB_41965
LB_41964:
	bts r12,2
LB_41965:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_41962
	btr r12,1
	jmp LB_41963
LB_41962:
	bts r12,1
LB_41963:
	add rsp,24
; _f43 %_41881 ⊢ %_41883 : %_41883
 ; {>  %_41882~3':_stg %_41881~0':_r64 %_41871~1':_stg %_41867~2':(_lst)◂(_p41187) }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_41970:
	cmp rax,0
	jz LB_41971
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_41970
LB_41971:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41884 %_41887 }
 ; {>  %_41887~4':_stg %_41885~1':_stg %_41886~3':_stg %_41884~0':_r64 %_41867~2':(_lst)◂(_p41187) }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_41972
	mov rdi,r14
	call dlt
LB_41972:
	bt r12,3
	jc LB_41973
	mov rdi,r9
	call dlt
LB_41973:
	bt r12,2
	jc LB_41974
	mov rdi,r8
	call dlt
LB_41974:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_41975
	btr r12,1
	jmp LB_41976
LB_41975:
	bts r12,1
LB_41976:
	ret
MTC_LB_41954:
MTC_LB_41906:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_41977
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_41978
	bt QWORD [rdi],0
	jc LB_41979
	btr r12,4
	jmp LB_41980
LB_41979:
	bts r12,4
LB_41980:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41978:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_41983
	btr r12,5
	jmp LB_41984
LB_41983:
	bts r12,5
LB_41984:
	mov r8,r11
	bt r12,5
	jc LB_41981
	btr r12,2
	jmp LB_41982
LB_41981:
	bts r12,2
LB_41982:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_41987
	btr r12,5
	jmp LB_41988
LB_41987:
	bts r12,5
LB_41988:
	mov r9,r11
	bt r12,5
	jc LB_41985
	btr r12,3
	jmp LB_41986
LB_41985:
	bts r12,3
LB_41986:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_41989:
	cmp r15,0
	jz LB_41990
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41989
LB_41990:
MTC_LB_41991:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_41992
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_41993
	bt QWORD [rdi],0
	jc LB_41994
	btr r12,4
	jmp LB_41995
LB_41994:
	bts r12,4
LB_41995:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_41993:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_41996
	btr r12,1
	jmp LB_41997
LB_41996:
	bts r12,1
LB_41997:
LB_41998:
	cmp r15,0
	jz LB_41999
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_41998
LB_41999:
; _f41904 { %_41865 %_41890 } ⊢ { %_41891 %_41892 } : { %_41891 %_41892 }
 ; {>  %_41890~1':_p41185 %_41865~0':_r64 %_41888~2':(_lst)◂(_p41187) }
; _f41904 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_41904
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42000
	btr r12,2
	jmp LB_42001
LB_42000:
	bts r12,2
LB_42001:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42002:
	cmp rax,0
	jz LB_42003
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42002
LB_42003:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41893 %_41895 }
 ; {>  %_41895~3':_stg %_41894~1':_stg %_41893~0':_r64 %_41888~2':(_lst)◂(_p41187) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_42004
	mov rdi,r14
	call dlt
LB_42004:
	bt r12,2
	jc LB_42005
	mov rdi,r8
	call dlt
LB_42005:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42006
	btr r12,1
	jmp LB_42007
LB_42006:
	bts r12,1
LB_42007:
	ret
MTC_LB_41992:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42008
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_42009
	bt QWORD [rdi],0
	jc LB_42010
	btr r12,4
	jmp LB_42011
LB_42010:
	bts r12,4
LB_42011:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42009:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_42012
	btr r12,1
	jmp LB_42013
LB_42012:
	bts r12,1
LB_42013:
LB_42014:
	cmp r15,0
	jz LB_42015
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42014
LB_42015:
; _f44 %_41865 ⊢ %_41897 : %_41897
 ; {>  %_41865~0':_r64 %_41896~1':_p41184 %_41888~2':(_lst)◂(_p41187) }
	add r13,1
; _f41828 { %_41897 %_41896 } ⊢ { %_41898 %_41899 } : { %_41898 %_41899 }
 ; {>  %_41896~1':_p41184 %_41897~0':_r64 %_41888~2':(_lst)◂(_p41187) }
; _f41828 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42016
	btr r12,2
	jmp LB_42017
LB_42016:
	bts r12,2
LB_42017:
	add rsp,16
; _f43 %_41898 ⊢ %_41900 : %_41900
 ; {>  %_41899~1':_stg %_41898~0':_r64 %_41888~2':(_lst)◂(_p41187) }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42018:
	cmp rax,0
	jz LB_42019
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42018
LB_42019:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41901 %_41903 }
 ; {>  %_41901~0':_r64 %_41902~1':_stg %_41888~2':(_lst)◂(_p41187) %_41903~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_42020
	mov rdi,r14
	call dlt
LB_42020:
	bt r12,2
	jc LB_42021
	mov rdi,r8
	call dlt
LB_42021:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42022
	btr r12,1
	jmp LB_42023
LB_42022:
	bts r12,1
LB_42023:
	ret
MTC_LB_42008:
MTC_LB_41977:
NS_E_41864:
; 	|» { 0' { 1' 2' 3' } }
NS_E_RDI_41864:
; _f41313 %_41831 ⊢ %_41833 : %_41833
 ; {>  %_41831~2':_p41180 %_41832~3':_p41181 %_41829~0':_r64 %_41830~1':_p41189 }
; _f41313 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42030
	btr r12,0
	jmp LB_42031
LB_42030:
	bts r12,0
LB_42031:
	call NS_E_41313
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_42032
	btr r12,2
	jmp LB_42033
LB_42032:
	bts r12,2
LB_42033:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_42028
	btr r12,3
	jmp LB_42029
LB_42028:
	bts r12,3
LB_42029:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_42026
	btr r12,1
	jmp LB_42027
LB_42026:
	bts r12,1
LB_42027:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42024
	btr r12,0
	jmp LB_42025
LB_42024:
	bts r12,0
LB_42025:
	add rsp,32
; _f41332 %_41832 ⊢ %_41834 : %_41834
 ; {>  %_41833~2':_stg %_41832~3':_p41181 %_41829~0':_r64 %_41830~1':_p41189 }
; _f41332 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_42040
	btr r12,0
	jmp LB_42041
LB_42040:
	bts r12,0
LB_42041:
	call NS_E_41332
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_42042
	btr r12,3
	jmp LB_42043
LB_42042:
	bts r12,3
LB_42043:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_42038
	btr r12,2
	jmp LB_42039
LB_42038:
	bts r12,2
LB_42039:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_42036
	btr r12,1
	jmp LB_42037
LB_42036:
	bts r12,1
LB_42037:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42034
	btr r12,0
	jmp LB_42035
LB_42034:
	bts r12,0
LB_42035:
	add rsp,32
MTC_LB_42044:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42045
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42046
	bt QWORD [rdi],0
	jc LB_42047
	btr r12,5
	jmp LB_42048
LB_42047:
	bts r12,5
LB_42048:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42046:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_42049
	btr r12,4
	jmp LB_42050
LB_42049:
	bts r12,4
LB_42050:
LB_42051:
	cmp r15,0
	jz LB_42052
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42051
LB_42052:
; _f41128 %_41835 ⊢ %_41836 : %_41836
 ; {>  %_41835~4':_p41117 %_41833~2':_stg %_41829~0':_r64 %_41834~3':_stg }
; _f41128 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_42059
	btr r12,0
	jmp LB_42060
LB_42059:
	bts r12,0
LB_42060:
	call NS_E_41128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42061
	btr r12,1
	jmp LB_42062
LB_42061:
	bts r12,1
LB_42062:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_42057
	btr r12,3
	jmp LB_42058
LB_42057:
	bts r12,3
LB_42058:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42055
	btr r12,2
	jmp LB_42056
LB_42055:
	bts r12,2
LB_42056:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42053
	btr r12,0
	jmp LB_42054
LB_42053:
	bts r12,0
LB_42054:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42063:
	cmp rax,0
	jz LB_42064
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42063
LB_42064:
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41837 %_41841 }
 ; {>  %_41838~1':_stg %_41841~4':_stg %_41840~3':_stg %_41839~2':_stg %_41837~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_42065
	mov rdi,r14
	call dlt
LB_42065:
	bt r12,3
	jc LB_42066
	mov rdi,r9
	call dlt
LB_42066:
	bt r12,2
	jc LB_42067
	mov rdi,r8
	call dlt
LB_42067:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42068
	btr r12,1
	jmp LB_42069
LB_42068:
	bts r12,1
LB_42069:
	ret
MTC_LB_42045:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42070
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42071
	bt QWORD [rdi],0
	jc LB_42072
	btr r12,5
	jmp LB_42073
LB_42072:
	bts r12,5
LB_42073:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42071:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_42074
	btr r12,4
	jmp LB_42075
LB_42074:
	bts r12,4
LB_42075:
LB_42076:
	cmp r15,0
	jz LB_42077
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42076
LB_42077:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42078:
	cmp rax,0
	jz LB_42079
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42078
LB_42079:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41843 %_41846 }
 ; {>  %_41844~2':_stg %_41843~0':_r64 %_41846~1':_stg %_41842~4':_r64 %_41845~3':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_42080
	mov rdi,r8
	call dlt
LB_42080:
	bt r12,4
	jc LB_42081
	mov rdi,r10
	call dlt
LB_42081:
	bt r12,3
	jc LB_42082
	mov rdi,r9
	call dlt
LB_42082:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42070:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_42083
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42084
	bt QWORD [rdi],0
	jc LB_42085
	btr r12,4
	jmp LB_42086
LB_42085:
	bts r12,4
LB_42086:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42084:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42087:
	cmp r15,0
	jz LB_42088
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42087
LB_42088:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42089:
	cmp rax,0
	jz LB_42090
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42089
LB_42090:
; "\226\151\130 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41847 %_41850 }
 ; {>  %_41850~1':_stg %_41849~3':_stg %_41847~0':_r64 %_41848~2':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_42091
	mov rdi,r9
	call dlt
LB_42091:
	bt r12,2
	jc LB_42092
	mov rdi,r8
	call dlt
LB_42092:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42083:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_42093
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °3◂4'
; 1' ⊢ °3◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42094
	bt QWORD [rdi],0
	jc LB_42095
	btr r12,5
	jmp LB_42096
LB_42095:
	bts r12,5
LB_42096:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42094:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_42097
	btr r12,4
	jmp LB_42098
LB_42097:
	bts r12,4
LB_42098:
LB_42099:
	cmp r15,0
	jz LB_42100
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42099
LB_42100:
; _f41272 %_41851 ⊢ %_41852 : %_41852
 ; {>  %_41833~2':_stg %_41829~0':_r64 %_41834~3':_stg %_41851~4':_p41183 }
; _f41272 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_42107
	btr r12,0
	jmp LB_42108
LB_42107:
	bts r12,0
LB_42108:
	call NS_E_41272
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42109
	btr r12,1
	jmp LB_42110
LB_42109:
	bts r12,1
LB_42110:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_42105
	btr r12,3
	jmp LB_42106
LB_42105:
	bts r12,3
LB_42106:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42103
	btr r12,2
	jmp LB_42104
LB_42103:
	bts r12,2
LB_42104:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42101
	btr r12,0
	jmp LB_42102
LB_42101:
	bts r12,0
LB_42102:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42111:
	cmp rax,0
	jz LB_42112
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42111
LB_42112:
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41853 %_41857 }
 ; {>  %_41856~3':_stg %_41855~2':_stg %_41854~1':_stg %_41853~0':_r64 %_41857~4':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_42113
	mov rdi,r9
	call dlt
LB_42113:
	bt r12,2
	jc LB_42114
	mov rdi,r8
	call dlt
LB_42114:
	bt r12,1
	jc LB_42115
	mov rdi,r14
	call dlt
LB_42115:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42116
	btr r12,1
	jmp LB_42117
LB_42116:
	bts r12,1
LB_42117:
	ret
MTC_LB_42093:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_42118
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °4◂{ 4' 5' }
; 1' ⊢ °4◂{ 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42119
	bt QWORD [rdi],0
	jc LB_42120
	btr r12,6
	jmp LB_42121
LB_42120:
	bts r12,6
LB_42121:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42119:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_42124
	btr r12,7
	jmp LB_42125
LB_42124:
	bts r12,7
LB_42125:
	mov r10,rdx
	bt r12,7
	jc LB_42122
	btr r12,4
	jmp LB_42123
LB_42122:
	bts r12,4
LB_42123:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_42128
	btr r12,7
	jmp LB_42129
LB_42128:
	bts r12,7
LB_42129:
	mov r11,rdx
	bt r12,7
	jc LB_42126
	btr r12,5
	jmp LB_42127
LB_42126:
	bts r12,5
LB_42127:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42130:
	cmp r15,0
	jz LB_42131
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42130
LB_42131:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,6
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42132:
	cmp rax,0
	jz LB_42133
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42132
LB_42133:
; "\194\187 _^ "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5f
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_5e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; " .. //\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_41860 %_41863 }
 ; {>  %_41862~3':_stg %_41863~1':_stg %_41860~0':_r64 %_41861~2':_stg %_41859~5':(_lst)◂(_p41190) %_41858~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_42134
	mov rdi,r9
	call dlt
LB_42134:
	bt r12,2
	jc LB_42135
	mov rdi,r8
	call dlt
LB_42135:
	bt r12,5
	jc LB_42136
	mov rdi,r11
	call dlt
LB_42136:
	bt r12,4
	jc LB_42137
	mov rdi,r10
	call dlt
LB_42137:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42118:
NS_E_41828:
; 	|» { 0' 1' }
NS_E_RDI_41828:
MTC_LB_42138:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42139
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42140
	bt QWORD [rdi],0
	jc LB_42141
	btr r12,6
	jmp LB_42142
LB_42141:
	bts r12,6
LB_42142:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42140:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_42155
	btr r12,7
	jmp LB_42156
LB_42155:
	bts r12,7
LB_42156:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_42145
	btr r12,5
	jmp LB_42146
LB_42145:
	bts r12,5
LB_42146:
	mov r8,r11
	bt r12,5
	jc LB_42143
	btr r12,2
	jmp LB_42144
LB_42143:
	bts r12,2
LB_42144:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_42149
	btr r12,5
	jmp LB_42150
LB_42149:
	bts r12,5
LB_42150:
	mov r9,r11
	bt r12,5
	jc LB_42147
	btr r12,3
	jmp LB_42148
LB_42147:
	bts r12,3
LB_42148:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_42153
	btr r12,5
	jmp LB_42154
LB_42153:
	bts r12,5
LB_42154:
	mov r10,r11
	bt r12,5
	jc LB_42151
	btr r12,4
	jmp LB_42152
LB_42151:
	bts r12,4
LB_42152:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_42159
	btr r12,7
	jmp LB_42160
LB_42159:
	bts r12,7
LB_42160:
	mov r11,rdx
	bt r12,7
	jc LB_42157
	btr r12,5
	jmp LB_42158
LB_42157:
	bts r12,5
LB_42158:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42161:
	cmp r15,0
	jz LB_42162
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42161
LB_42162:
; _f41864 { %_41811 %_41813 } ⊢ { %_41815 %_41816 } : { %_41815 %_41816 }
 ; {>  %_41813~{ 2' 3' 4' }:{ _p41189 _p41180 _p41181 } %_41814~5':_p41184 %_41811~0':_r64 }
; _f41864 { 0' { 2' 3' 4' } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 101110.. |},{ 0' { 2' 3' 4' } } ⊢ { 0' { 1' 2' 3' } }
	mov r14,r8
	bt r12,2
	jc LB_42165
	btr r12,1
	jmp LB_42166
LB_42165:
	bts r12,1
LB_42166:
	mov r8,r9
	bt r12,3
	jc LB_42167
	btr r12,2
	jmp LB_42168
LB_42167:
	bts r12,2
LB_42168:
	mov r9,r10
	bt r12,4
	jc LB_42169
	btr r12,3
	jmp LB_42170
LB_42169:
	bts r12,3
LB_42170:
	call NS_E_41864
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*0]
	bt QWORD rax,5
	jc LB_42163
	btr r12,5
	jmp LB_42164
LB_42163:
	bts r12,5
LB_42164:
	add rsp,16
; _f41828 { %_41815 %_41814 } ⊢ { %_41817 %_41818 } : { %_41817 %_41818 }
 ; {>  %_41814~5':_p41184 %_41816~1':_stg %_41815~0':_r64 }
; _f41828 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_42173
	btr r12,1
	jmp LB_42174
LB_42173:
	bts r12,1
LB_42174:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_42175
	btr r12,2
	jmp LB_42176
LB_42175:
	bts r12,2
LB_42176:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42171
	btr r12,1
	jmp LB_42172
LB_42171:
	bts r12,1
LB_42172:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41817 %_41821 }
 ; {>  %_41817~0':_r64 %_41820~2':_stg %_41819~1':_stg %_41821~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_42177
	mov rdi,r8
	call dlt
LB_42177:
	bt r12,1
	jc LB_42178
	mov rdi,r14
	call dlt
LB_42178:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42179
	btr r12,1
	jmp LB_42180
LB_42179:
	bts r12,1
LB_42180:
	ret
MTC_LB_42139:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42181
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42182
	bt QWORD [rdi],0
	jc LB_42183
	btr r12,3
	jmp LB_42184
LB_42183:
	bts r12,3
LB_42184:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42182:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42185
	btr r12,2
	jmp LB_42186
LB_42185:
	bts r12,2
LB_42186:
LB_42187:
	cmp r15,0
	jz LB_42188
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42187
LB_42188:
; _f41904 { %_41811 %_41822 } ⊢ { %_41823 %_41824 } : { %_41823 %_41824 }
 ; {>  %_41811~0':_r64 %_41822~2':_p41185 }
; _f41904 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42189
	btr r12,1
	jmp LB_42190
LB_42189:
	bts r12,1
LB_42190:
	call NS_E_41904
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_41823 %_41824 }
 ; {>  %_41823~0':_r64 %_41824~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42181:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_42191
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42192
	bt QWORD [rdi],0
	jc LB_42193
	btr r12,3
	jmp LB_42194
LB_42193:
	bts r12,3
LB_42194:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42192:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42195
	btr r12,2
	jmp LB_42196
LB_42195:
	bts r12,2
LB_42196:
LB_42197:
	cmp r15,0
	jz LB_42198
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42197
LB_42198:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42199:
	cmp rax,0
	jz LB_42200
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42199
LB_42200:
; "\226\136\142 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_41826 %_41827 }
 ; {>  %_41825~2':_p41180 %_41826~0':_r64 %_41827~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_42201
	mov rdi,r8
	call dlt
LB_42201:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42191:
NS_E_41810:
; 	|» { 0' 1' }
NS_E_RDI_41810:
MTC_LB_42202:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42203
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42204
	bt QWORD [rdi],0
	jc LB_42205
	btr r12,6
	jmp LB_42206
LB_42205:
	bts r12,6
LB_42206:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42204:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_42219
	btr r12,7
	jmp LB_42220
LB_42219:
	bts r12,7
LB_42220:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_42209
	btr r12,5
	jmp LB_42210
LB_42209:
	bts r12,5
LB_42210:
	mov r8,r11
	bt r12,5
	jc LB_42207
	btr r12,2
	jmp LB_42208
LB_42207:
	bts r12,2
LB_42208:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_42213
	btr r12,5
	jmp LB_42214
LB_42213:
	bts r12,5
LB_42214:
	mov r9,r11
	bt r12,5
	jc LB_42211
	btr r12,3
	jmp LB_42212
LB_42211:
	bts r12,3
LB_42212:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_42217
	btr r12,5
	jmp LB_42218
LB_42217:
	bts r12,5
LB_42218:
	mov r10,r11
	bt r12,5
	jc LB_42215
	btr r12,4
	jmp LB_42216
LB_42215:
	bts r12,4
LB_42216:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_42223
	btr r12,7
	jmp LB_42224
LB_42223:
	bts r12,7
LB_42224:
	mov r11,rdx
	bt r12,7
	jc LB_42221
	btr r12,5
	jmp LB_42222
LB_42221:
	bts r12,5
LB_42222:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42225:
	cmp r15,0
	jz LB_42226
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42225
LB_42226:
; _f41332 %_41793 ⊢ %_41796 : %_41796
 ; {>  %_41794~4':_p41184 %_41793~3':_p41181 %_41795~5':(_lst)◂({ _stg _p41181 _p41184 }) %_41792~2':_stg %_41790~0':_r64 }
; _f41332 3' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_42235
	btr r12,0
	jmp LB_42236
LB_42235:
	bts r12,0
LB_42236:
	call NS_E_41332
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42237
	btr r12,1
	jmp LB_42238
LB_42237:
	bts r12,1
LB_42238:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_42233
	btr r12,5
	jmp LB_42234
LB_42233:
	bts r12,5
LB_42234:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42231
	btr r12,4
	jmp LB_42232
LB_42231:
	bts r12,4
LB_42232:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42229
	btr r12,2
	jmp LB_42230
LB_42229:
	bts r12,2
LB_42230:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42227
	btr r12,0
	jmp LB_42228
LB_42227:
	bts r12,0
LB_42228:
	add rsp,40
; _f41810 { %_41790 %_41795 } ⊢ { %_41797 %_41798 } : { %_41797 %_41798 }
 ; {>  %_41794~4':_p41184 %_41795~5':(_lst)◂({ _stg _p41181 _p41184 }) %_41796~1':_stg %_41792~2':_stg %_41790~0':_r64 }
; _f41810 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_42245
	btr r12,1
	jmp LB_42246
LB_42245:
	bts r12,1
LB_42246:
	call NS_E_41810
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_42247
	btr r12,3
	jmp LB_42248
LB_42247:
	bts r12,3
LB_42248:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42243
	btr r12,4
	jmp LB_42244
LB_42243:
	bts r12,4
LB_42244:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42241
	btr r12,2
	jmp LB_42242
LB_42241:
	bts r12,2
LB_42242:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42239
	btr r12,1
	jmp LB_42240
LB_42239:
	bts r12,1
LB_42240:
	add rsp,32
; _f44 %_41797 ⊢ %_41799 : %_41799
 ; {>  %_41798~3':_stg %_41794~4':_p41184 %_41796~1':_stg %_41792~2':_stg %_41797~0':_r64 }
	add r13,1
; _f41828 { %_41799 %_41794 } ⊢ { %_41800 %_41801 } : { %_41800 %_41801 }
 ; {>  %_41799~0':_r64 %_41798~3':_stg %_41794~4':_p41184 %_41796~1':_stg %_41792~2':_stg }
; _f41828 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42255
	btr r12,1
	jmp LB_42256
LB_42255:
	bts r12,1
LB_42256:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_42257
	btr r12,4
	jmp LB_42258
LB_42257:
	bts r12,4
LB_42258:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_42253
	btr r12,3
	jmp LB_42254
LB_42253:
	bts r12,3
LB_42254:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42251
	btr r12,2
	jmp LB_42252
LB_42251:
	bts r12,2
LB_42252:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42249
	btr r12,1
	jmp LB_42250
LB_42249:
	bts r12,1
LB_42250:
	add rsp,32
; _f43 %_41800 ⊢ %_41802 : %_41802
 ; {>  %_41800~0':_r64 %_41798~3':_stg %_41796~1':_stg %_41792~2':_stg %_41801~4':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42259:
	cmp rax,0
	jz LB_42260
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42259
LB_42260:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 4'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41803 %_41808 }
 ; {>  %_41807~3':_stg %_41804~2':_stg %_41805~1':_stg %_41808~5':_stg %_41806~4':_stg %_41803~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,3
	jc LB_42261
	mov rdi,r9
	call dlt
LB_42261:
	bt r12,2
	jc LB_42262
	mov rdi,r8
	call dlt
LB_42262:
	bt r12,1
	jc LB_42263
	mov rdi,r14
	call dlt
LB_42263:
	bt r12,4
	jc LB_42264
	mov rdi,r10
	call dlt
LB_42264:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_42265
	btr r12,1
	jmp LB_42266
LB_42265:
	bts r12,1
LB_42266:
	ret
MTC_LB_42203:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42267
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42268
	bt QWORD [rdi],0
	jc LB_42269
	btr r12,2
	jmp LB_42270
LB_42269:
	bts r12,2
LB_42270:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42268:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42271:
	cmp r15,0
	jz LB_42272
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42271
LB_42272:
; 	» "" _ ⊢ 1' : %_41809
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_41790 %_41809 }
 ; {>  %_41809~1':_stg %_41790~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42267:
NS_E_41789:
; 	|» { 0' 1' }
NS_E_RDI_41789:
MTC_LB_42273:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42274
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42275
	bt QWORD [rdi],0
	jc LB_42276
	btr r12,4
	jmp LB_42277
LB_42276:
	bts r12,4
LB_42277:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42275:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_42280
	btr r12,5
	jmp LB_42281
LB_42280:
	bts r12,5
LB_42281:
	mov r8,r11
	bt r12,5
	jc LB_42278
	btr r12,2
	jmp LB_42279
LB_42278:
	bts r12,2
LB_42279:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_42284
	btr r12,5
	jmp LB_42285
LB_42284:
	bts r12,5
LB_42285:
	mov r9,r11
	bt r12,5
	jc LB_42282
	btr r12,3
	jmp LB_42283
LB_42282:
	bts r12,3
LB_42283:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42286:
	cmp r15,0
	jz LB_42287
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42286
LB_42287:
; _f41332 %_41768 ⊢ %_41770 : %_41770
 ; {>  %_41768~2':_p41181 %_41766~0':_r64 %_41769~3':_p41184 }
; _f41332 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42292
	btr r12,0
	jmp LB_42293
LB_42292:
	bts r12,0
LB_42293:
	call NS_E_41332
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42294
	btr r12,1
	jmp LB_42295
LB_42294:
	bts r12,1
LB_42295:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42290
	btr r12,3
	jmp LB_42291
LB_42290:
	bts r12,3
LB_42291:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42288
	btr r12,0
	jmp LB_42289
LB_42288:
	bts r12,0
LB_42289:
	add rsp,24
; _f44 %_41766 ⊢ %_41771 : %_41771
 ; {>  %_41770~1':_stg %_41766~0':_r64 %_41769~3':_p41184 }
	add r13,1
; _f41828 { %_41771 %_41769 } ⊢ { %_41772 %_41773 } : { %_41772 %_41773 }
 ; {>  %_41770~1':_stg %_41771~0':_r64 %_41769~3':_p41184 }
; _f41828 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42298
	btr r12,1
	jmp LB_42299
LB_42298:
	bts r12,1
LB_42299:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_42300
	btr r12,2
	jmp LB_42301
LB_42300:
	bts r12,2
LB_42301:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42296
	btr r12,1
	jmp LB_42297
LB_42296:
	bts r12,1
LB_42297:
	add rsp,16
; _f43 %_41772 ⊢ %_41774 : %_41774
 ; {>  %_41770~1':_stg %_41772~0':_r64 %_41773~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41774 %_41777 }
 ; {>  %_41777~3':_stg %_41774~0':_r64 %_41775~1':_stg %_41776~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_42302
	mov rdi,r14
	call dlt
LB_42302:
	bt r12,2
	jc LB_42303
	mov rdi,r8
	call dlt
LB_42303:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42304
	btr r12,1
	jmp LB_42305
LB_42304:
	bts r12,1
LB_42305:
	ret
MTC_LB_42274:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42306
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42307
	bt QWORD [rdi],0
	jc LB_42308
	btr r12,3
	jmp LB_42309
LB_42308:
	bts r12,3
LB_42309:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42307:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42310
	btr r12,2
	jmp LB_42311
LB_42310:
	bts r12,2
LB_42311:
LB_42312:
	cmp r15,0
	jz LB_42313
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42312
LB_42313:
; _f41272 %_41778 ⊢ %_41779 : %_41779
 ; {>  %_41778~2':_p41183 %_41766~0':_r64 }
; _f41272 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42316
	btr r12,0
	jmp LB_42317
LB_42316:
	bts r12,0
LB_42317:
	call NS_E_41272
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42318
	btr r12,1
	jmp LB_42319
LB_42318:
	bts r12,1
LB_42319:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42314
	btr r12,0
	jmp LB_42315
LB_42314:
	bts r12,0
LB_42315:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41766 %_41781 }
 ; {>  %_41780~1':_stg %_41781~2':_stg %_41766~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_42320
	mov rdi,r14
	call dlt
LB_42320:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42321
	btr r12,1
	jmp LB_42322
LB_42321:
	bts r12,1
LB_42322:
	ret
MTC_LB_42306:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_42323
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42324
	bt QWORD [rdi],0
	jc LB_42325
	btr r12,3
	jmp LB_42326
LB_42325:
	bts r12,3
LB_42326:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42324:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42327
	btr r12,2
	jmp LB_42328
LB_42327:
	bts r12,2
LB_42328:
LB_42329:
	cmp r15,0
	jz LB_42330
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42329
LB_42330:
; _f44 %_41766 ⊢ %_41783 : %_41783
 ; {>  %_41782~2':_p41184 %_41766~0':_r64 }
	add r13,1
; _f41828 { %_41783 %_41782 } ⊢ { %_41784 %_41785 } : { %_41784 %_41785 }
 ; {>  %_41783~0':_r64 %_41782~2':_p41184 }
; _f41828 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42331
	btr r12,1
	jmp LB_42332
LB_42331:
	bts r12,1
LB_42332:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f43 %_41784 ⊢ %_41786 : %_41786
 ; {>  %_41784~0':_r64 %_41785~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41786 %_41788 }
 ; {>  %_41787~1':_stg %_41786~0':_r64 %_41788~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_42333
	mov rdi,r14
	call dlt
LB_42333:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42334
	btr r12,1
	jmp LB_42335
LB_42334:
	bts r12,1
LB_42335:
	ret
MTC_LB_42323:
NS_E_41765:
; 	|» 0'
NS_E_RDI_41765:
MTC_LB_42336:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42337
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42338
	bt QWORD [rdi],0
	jc LB_42339
	btr r12,3
	jmp LB_42340
LB_42339:
	bts r12,3
LB_42340:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42338:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42343
	btr r12,4
	jmp LB_42344
LB_42343:
	bts r12,4
LB_42344:
	mov r14,r10
	bt r12,4
	jc LB_42341
	btr r12,1
	jmp LB_42342
LB_42341:
	bts r12,1
LB_42342:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42347
	btr r12,4
	jmp LB_42348
LB_42347:
	bts r12,4
LB_42348:
	mov r8,r10
	bt r12,4
	jc LB_42345
	btr r12,2
	jmp LB_42346
LB_42345:
	bts r12,2
LB_42346:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42349:
	cmp r15,0
	jz LB_42350
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42349
LB_42350:
; _f41755 %_41757 ⊢ %_41759 : %_41759
 ; {>  %_41757~1':_p41182 %_41758~2':(_lst)◂(_p41182) }
; _f41755 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_42353
	btr r12,0
	jmp LB_42354
LB_42353:
	bts r12,0
LB_42354:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42351
	btr r12,2
	jmp LB_42352
LB_42351:
	bts r12,2
LB_42352:
	add rsp,16
; _f41765 %_41758 ⊢ %_41760 : %_41760
 ; {>  %_41759~0':_stg %_41758~2':(_lst)◂(_p41182) }
; _f41765 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42357
	btr r12,0
	jmp LB_42358
LB_42357:
	bts r12,0
LB_42358:
	call NS_E_41765
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42359
	btr r12,1
	jmp LB_42360
LB_42359:
	bts r12,1
LB_42360:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42355
	btr r12,0
	jmp LB_42356
LB_42355:
	bts r12,0
LB_42356:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41763
 ; {>  %_41762~1':_stg %_41763~2':_stg %_41761~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_42361
	mov rdi,r14
	call dlt
LB_42361:
	bt r12,0
	jc LB_42362
	mov rdi,r13
	call dlt
LB_42362:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42363
	btr r12,0
	jmp LB_42364
LB_42363:
	bts r12,0
LB_42364:
	ret
MTC_LB_42337:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42365
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42366
	bt QWORD [rdi],0
	jc LB_42367
	btr r12,1
	jmp LB_42368
LB_42367:
	bts r12,1
LB_42368:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42366:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42369:
	cmp r15,0
	jz LB_42370
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42369
LB_42370:
; 	» "" _ ⊢ 0' : %_41764
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41764
 ; {>  %_41764~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_42365:
NS_E_41755:
; 	|» 0'
NS_E_RDI_41755:
MTC_LB_42371:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42372
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42373
	bt QWORD [rdi],0
	jc LB_42374
	btr r12,2
	jmp LB_42375
LB_42374:
	bts r12,2
LB_42375:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42373:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_42376
	btr r12,1
	jmp LB_42377
LB_42376:
	bts r12,1
LB_42377:
LB_42378:
	cmp r15,0
	jz LB_42379
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42378
LB_42379:
; _f41765 %_41732 ⊢ %_41733 : %_41733
 ; {>  %_41732~1':(_lst)◂(_p41182) }
; _f41765 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_42380
	btr r12,0
	jmp LB_42381
LB_42380:
	bts r12,0
LB_42381:
	call NS_E_41765
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_41735
 ; {>  %_41735~1':_stg %_41734~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_42382
	mov rdi,r13
	call dlt
LB_42382:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_42383
	btr r12,0
	jmp LB_42384
LB_42383:
	bts r12,0
LB_42384:
	ret
MTC_LB_42372:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42385
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' }
; 0' ⊢ °1◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42386
	bt QWORD [rdi],0
	jc LB_42387
	btr r12,3
	jmp LB_42388
LB_42387:
	bts r12,3
LB_42388:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42386:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42391
	btr r12,4
	jmp LB_42392
LB_42391:
	bts r12,4
LB_42392:
	mov r14,r10
	bt r12,4
	jc LB_42389
	btr r12,1
	jmp LB_42390
LB_42389:
	bts r12,1
LB_42390:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42395
	btr r12,4
	jmp LB_42396
LB_42395:
	bts r12,4
LB_42396:
	mov r8,r10
	bt r12,4
	jc LB_42393
	btr r12,2
	jmp LB_42394
LB_42393:
	bts r12,2
LB_42394:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42397:
	cmp r15,0
	jz LB_42398
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42397
LB_42398:
; _f41755 %_41736 ⊢ %_41738 : %_41738
 ; {>  %_41736~1':_p41182 %_41737~2':_p41182 }
; _f41755 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_42401
	btr r12,0
	jmp LB_42402
LB_42401:
	bts r12,0
LB_42402:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42399
	btr r12,2
	jmp LB_42400
LB_42399:
	bts r12,2
LB_42400:
	add rsp,16
; _f41755 %_41737 ⊢ %_41739 : %_41739
 ; {>  %_41737~2':_p41182 %_41738~0':_stg }
; _f41755 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42405
	btr r12,0
	jmp LB_42406
LB_42405:
	bts r12,0
LB_42406:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42407
	btr r12,1
	jmp LB_42408
LB_42407:
	bts r12,1
LB_42408:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42403
	btr r12,0
	jmp LB_42404
LB_42403:
	bts r12,0
LB_42404:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\134\146 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_86
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_92
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41742
 ; {>  %_41741~1':_stg %_41742~2':_stg %_41740~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_42409
	mov rdi,r14
	call dlt
LB_42409:
	bt r12,0
	jc LB_42410
	mov rdi,r13
	call dlt
LB_42410:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42411
	btr r12,0
	jmp LB_42412
LB_42411:
	bts r12,0
LB_42412:
	ret
MTC_LB_42385:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_42413
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42414
	bt QWORD [rdi],0
	jc LB_42415
	btr r12,3
	jmp LB_42416
LB_42415:
	bts r12,3
LB_42416:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42414:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42419
	btr r12,4
	jmp LB_42420
LB_42419:
	bts r12,4
LB_42420:
	mov r14,r10
	bt r12,4
	jc LB_42417
	btr r12,1
	jmp LB_42418
LB_42417:
	bts r12,1
LB_42418:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42423
	btr r12,4
	jmp LB_42424
LB_42423:
	bts r12,4
LB_42424:
	mov r8,r10
	bt r12,4
	jc LB_42421
	btr r12,2
	jmp LB_42422
LB_42421:
	bts r12,2
LB_42422:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42425:
	cmp r15,0
	jz LB_42426
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42425
LB_42426:
; _f41755 %_41743 ⊢ %_41745 : %_41745
 ; {>  %_41744~2':_p41182 %_41743~1':_p41182 }
; _f41755 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_42429
	btr r12,0
	jmp LB_42430
LB_42429:
	bts r12,0
LB_42430:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42427
	btr r12,2
	jmp LB_42428
LB_42427:
	bts r12,2
LB_42428:
	add rsp,16
; _f41755 %_41744 ⊢ %_41746 : %_41746
 ; {>  %_41744~2':_p41182 %_41745~0':_stg }
; _f41755 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42433
	btr r12,0
	jmp LB_42434
LB_42433:
	bts r12,0
LB_42434:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42435
	btr r12,1
	jmp LB_42436
LB_42435:
	bts r12,1
LB_42436:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42431
	btr r12,0
	jmp LB_42432
LB_42431:
	bts r12,0
LB_42432:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\151\130"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41749
 ; {>  %_41749~2':_stg %_41748~1':_stg %_41747~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_42437
	mov rdi,r14
	call dlt
LB_42437:
	bt r12,0
	jc LB_42438
	mov rdi,r13
	call dlt
LB_42438:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42439
	btr r12,0
	jmp LB_42440
LB_42439:
	bts r12,0
LB_42440:
	ret
MTC_LB_42413:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_42441
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42442
	bt QWORD [rdi],0
	jc LB_42443
	btr r12,2
	jmp LB_42444
LB_42443:
	bts r12,2
LB_42444:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42442:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_42445
	btr r12,1
	jmp LB_42446
LB_42445:
	bts r12,1
LB_42446:
LB_42447:
	cmp r15,0
	jz LB_42448
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42447
LB_42448:
; _f41128 %_41750 ⊢ %_41751 : %_41751
 ; {>  %_41750~1':_p41117 }
; _f41128 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_42449
	btr r12,0
	jmp LB_42450
LB_42449:
	bts r12,0
LB_42450:
	call NS_E_41128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_41751
 ; {>  %_41751~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_42441:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_42451
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂1'
; 0' ⊢ °4◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42452
	bt QWORD [rdi],0
	jc LB_42453
	btr r12,2
	jmp LB_42454
LB_42453:
	bts r12,2
LB_42454:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42452:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_42455
	btr r12,1
	jmp LB_42456
LB_42455:
	bts r12,1
LB_42456:
LB_42457:
	cmp r15,0
	jz LB_42458
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42457
LB_42458:
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "'"
	mov rsi,0x_27
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_41754
 ; {>  %_41753~1':_stg %_41754~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_42459
	mov rdi,r14
	call dlt
LB_42459:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_42451:
NS_E_41730:
; 	|» { 0' 1' }
NS_E_RDI_41730:
MTC_LB_42460:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42461
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42462
	bt QWORD [rdi],0
	jc LB_42463
	btr r12,5
	jmp LB_42464
LB_42463:
	bts r12,5
LB_42464:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42462:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_42473
	btr r12,6
	jmp LB_42474
LB_42473:
	bts r12,6
LB_42474:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42467
	btr r12,4
	jmp LB_42468
LB_42467:
	bts r12,4
LB_42468:
	mov r8,r10
	bt r12,4
	jc LB_42465
	btr r12,2
	jmp LB_42466
LB_42465:
	bts r12,2
LB_42466:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42471
	btr r12,4
	jmp LB_42472
LB_42471:
	bts r12,4
LB_42472:
	mov r9,r10
	bt r12,4
	jc LB_42469
	btr r12,3
	jmp LB_42470
LB_42469:
	bts r12,3
LB_42470:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_42477
	btr r12,6
	jmp LB_42478
LB_42477:
	bts r12,6
LB_42478:
	mov r10,rcx
	bt r12,6
	jc LB_42475
	btr r12,4
	jmp LB_42476
LB_42475:
	bts r12,4
LB_42476:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42479:
	cmp r15,0
	jz LB_42480
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42479
LB_42480:
; _f41730 { %_41716 %_41720 } ⊢ { %_41721 %_41722 } : { %_41721 %_41722 }
 ; {>  %_41719~3':_p41182 %_41718~2':_stg %_41720~4':(_lst)◂({ _stg _p41182 }) %_41716~0':_r64 }
; _f41730 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42485
	btr r12,1
	jmp LB_42486
LB_42485:
	bts r12,1
LB_42486:
	call NS_E_41730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42483
	btr r12,3
	jmp LB_42484
LB_42483:
	bts r12,3
LB_42484:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42481
	btr r12,2
	jmp LB_42482
LB_42481:
	bts r12,2
LB_42482:
	add rsp,24
; _f41755 %_41719 ⊢ %_41723 : %_41723
 ; {>  %_41719~3':_p41182 %_41722~1':_stg %_41718~2':_stg %_41721~0':_r64 }
; _f41755 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_42493
	btr r12,0
	jmp LB_42494
LB_42493:
	bts r12,0
LB_42494:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_42495
	btr r12,3
	jmp LB_42496
LB_42495:
	bts r12,3
LB_42496:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_42491
	btr r12,2
	jmp LB_42492
LB_42491:
	bts r12,2
LB_42492:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_42489
	btr r12,1
	jmp LB_42490
LB_42489:
	bts r12,1
LB_42490:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42487
	btr r12,0
	jmp LB_42488
LB_42487:
	bts r12,0
LB_42488:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42497:
	cmp rax,0
	jz LB_42498
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42497
LB_42498:
; "\226\136\144 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " : "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41724 %_41728 }
 ; {>  %_41725~2':_stg %_41727~1':_stg %_41724~0':_r64 %_41726~3':_stg %_41728~4':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_42499
	mov rdi,r8
	call dlt
LB_42499:
	bt r12,1
	jc LB_42500
	mov rdi,r14
	call dlt
LB_42500:
	bt r12,3
	jc LB_42501
	mov rdi,r9
	call dlt
LB_42501:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42502
	btr r12,1
	jmp LB_42503
LB_42502:
	bts r12,1
LB_42503:
	ret
MTC_LB_42461:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42504
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42505
	bt QWORD [rdi],0
	jc LB_42506
	btr r12,2
	jmp LB_42507
LB_42506:
	bts r12,2
LB_42507:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42505:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42508:
	cmp r15,0
	jz LB_42509
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42508
LB_42509:
; 	» "" _ ⊢ 1' : %_41729
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_41716 %_41729 }
 ; {>  %_41729~1':_stg %_41716~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42504:
NS_E_41715:
; 	|» { 0' 1' }
NS_E_RDI_41715:
MTC_LB_42510:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42511
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42512
	bt QWORD [rdi],0
	jc LB_42513
	btr r12,3
	jmp LB_42514
LB_42513:
	bts r12,3
LB_42514:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42512:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42515
	btr r12,2
	jmp LB_42516
LB_42515:
	bts r12,2
LB_42516:
LB_42517:
	cmp r15,0
	jz LB_42518
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42517
LB_42518:
; _f44 %_41702 ⊢ %_41705 : %_41705
 ; {>  %_41704~2':(_lst)◂({ _stg _p41182 }) %_41702~0':_r64 }
	add r13,1
; _f41730 { %_41705 %_41704 } ⊢ { %_41706 %_41707 } : { %_41706 %_41707 }
 ; {>  %_41704~2':(_lst)◂({ _stg _p41182 }) %_41705~0':_r64 }
; _f41730 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42519
	btr r12,1
	jmp LB_42520
LB_42519:
	bts r12,1
LB_42520:
	call NS_E_41730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f43 %_41706 ⊢ %_41708 : %_41708
 ; {>  %_41707~1':_stg %_41706~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41708 %_41709 }
 ; {>  %_41709~1':_stg %_41710~2':_stg %_41708~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_42521
	mov rdi,r8
	call dlt
LB_42521:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42511:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42522
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42523
	bt QWORD [rdi],0
	jc LB_42524
	btr r12,3
	jmp LB_42525
LB_42524:
	bts r12,3
LB_42525:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42523:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42526
	btr r12,2
	jmp LB_42527
LB_42526:
	bts r12,2
LB_42527:
LB_42528:
	cmp r15,0
	jz LB_42529
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42528
LB_42529:
; _f41755 %_41711 ⊢ %_41712 : %_41712
 ; {>  %_41711~2':_p41182 %_41702~0':_r64 }
; _f41755 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42532
	btr r12,0
	jmp LB_42533
LB_42532:
	bts r12,0
LB_42533:
	call NS_E_41755
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42534
	btr r12,1
	jmp LB_42535
LB_42534:
	bts r12,1
LB_42535:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42530
	btr r12,0
	jmp LB_42531
LB_42530:
	bts r12,0
LB_42531:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41702 %_41714 }
 ; {>  %_41702~0':_r64 %_41714~2':_stg %_41713~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_42536
	mov rdi,r14
	call dlt
LB_42536:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42537
	btr r12,1
	jmp LB_42538
LB_42537:
	bts r12,1
LB_42538:
	ret
MTC_LB_42522:
NS_E_41701:
; 	|» 0'
NS_E_RDI_41701:
MTC_LB_42539:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42540
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42541
	bt QWORD [rdi],0
	jc LB_42542
	btr r12,3
	jmp LB_42543
LB_42542:
	bts r12,3
LB_42543:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42541:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42546
	btr r12,4
	jmp LB_42547
LB_42546:
	bts r12,4
LB_42547:
	mov r14,r10
	bt r12,4
	jc LB_42544
	btr r12,1
	jmp LB_42545
LB_42544:
	bts r12,1
LB_42545:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42550
	btr r12,4
	jmp LB_42551
LB_42550:
	bts r12,4
LB_42551:
	mov r8,r10
	bt r12,4
	jc LB_42548
	btr r12,2
	jmp LB_42549
LB_42548:
	bts r12,2
LB_42549:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42552:
	cmp r15,0
	jz LB_42553
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42552
LB_42553:
; _f41701 %_41696 ⊢ %_41697 : %_41697
 ; {>  %_41696~2':_p41174 %_41695~1':_p41175 }
; _f41701 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42556
	btr r12,0
	jmp LB_42557
LB_42556:
	bts r12,0
LB_42557:
	call NS_E_41701
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42554
	btr r12,1
	jmp LB_42555
LB_42554:
	bts r12,1
LB_42555:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_41699
 ; {>  %_41698~0':_stg %_41695~1':_p41175 %_41699~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_42558
	mov rdi,r13
	call dlt
LB_42558:
	bt r12,1
	jc LB_42559
	mov rdi,r14
	call dlt
LB_42559:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42560
	btr r12,0
	jmp LB_42561
LB_42560:
	bts r12,0
LB_42561:
	ret
MTC_LB_42540:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42562
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_42563
	bt QWORD [rdi],0
	jc LB_42564
	btr r12,1
	jmp LB_42565
LB_42564:
	bts r12,1
LB_42565:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42563:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42566:
	cmp r15,0
	jz LB_42567
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42566
LB_42567:
; 	» "" _ ⊢ 0' : %_41700
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_41700
 ; {>  %_41700~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_42562:
NS_E_41693:
; 	|» { 0' 1' }
NS_E_RDI_41693:
MTC_LB_42568:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42569
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42570
	bt QWORD [rdi],0
	jc LB_42571
	btr r12,3
	jmp LB_42572
LB_42571:
	bts r12,3
LB_42572:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42570:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42573
	btr r12,2
	jmp LB_42574
LB_42573:
	bts r12,2
LB_42574:
LB_42575:
	cmp r15,0
	jz LB_42576
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42575
LB_42576:
; _f41701 %_41682 ⊢ %_41683 : %_41683
 ; {>  %_41680~0':t16344'(-1) %_41682~2':_p41174 }
; _f41701 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42579
	btr r12,0
	jmp LB_42580
LB_42579:
	bts r12,0
LB_42580:
	call NS_E_41701
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42581
	btr r12,1
	jmp LB_42582
LB_42581:
	bts r12,1
LB_42582:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42577
	btr r12,0
	jmp LB_42578
LB_42577:
	bts r12,0
LB_42578:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " !| "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_21
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41680 %_41685 }
 ; {>  %_41685~2':_stg %_41684~1':_stg %_41680~0':t16344'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_42583
	mov rdi,r14
	call dlt
LB_42583:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42584
	btr r12,1
	jmp LB_42585
LB_42584:
	bts r12,1
LB_42585:
	ret
MTC_LB_42569:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42586
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42587
	bt QWORD [rdi],0
	jc LB_42588
	btr r12,4
	jmp LB_42589
LB_42588:
	bts r12,4
LB_42589:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42587:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_42592
	btr r12,5
	jmp LB_42593
LB_42592:
	bts r12,5
LB_42593:
	mov r8,r11
	bt r12,5
	jc LB_42590
	btr r12,2
	jmp LB_42591
LB_42590:
	bts r12,2
LB_42591:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_42596
	btr r12,5
	jmp LB_42597
LB_42596:
	bts r12,5
LB_42597:
	mov r9,r11
	bt r12,5
	jc LB_42594
	btr r12,3
	jmp LB_42595
LB_42594:
	bts r12,3
LB_42595:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42598:
	cmp r15,0
	jz LB_42599
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42598
LB_42599:
; _f41693 { %_41680 %_41687 } ⊢ { %_41688 %_41689 } : { %_41688 %_41689 }
 ; {>  %_41686~2':_p41175 %_41687~3':_p41173 %_41680~0':t16344'(-1) }
; _f41693 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42602
	btr r12,1
	jmp LB_42603
LB_42602:
	bts r12,1
LB_42603:
	call NS_E_41693
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42600
	btr r12,2
	jmp LB_42601
LB_42600:
	bts r12,2
LB_42601:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41688 %_41691 }
 ; {>  %_41690~1':_stg %_41686~2':_p41175 %_41691~3':_stg %_41688~0':t16344'(-1) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_42604
	mov rdi,r14
	call dlt
LB_42604:
	bt r12,2
	jc LB_42605
	mov rdi,r8
	call dlt
LB_42605:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42606
	btr r12,1
	jmp LB_42607
LB_42606:
	bts r12,1
LB_42607:
	ret
MTC_LB_42586:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_42608
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42609
	bt QWORD [rdi],0
	jc LB_42610
	btr r12,2
	jmp LB_42611
LB_42610:
	bts r12,2
LB_42611:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42609:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42612:
	cmp r15,0
	jz LB_42613
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42612
LB_42613:
; 	» "" _ ⊢ 1' : %_41692
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_41680 %_41692 }
 ; {>  %_41692~1':_stg %_41680~0':t16344'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42608:
NS_E_41679:
; 	|» { 0' 1' }
NS_E_RDI_41679:
MTC_LB_42614:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42615
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
	btr r12,8
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42616
	bt QWORD [rdi],0
	jc LB_42617
	btr r12,8
	jmp LB_42618
LB_42617:
	bts r12,8
LB_42618:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42616:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_42621
	btr r12,9
	jmp LB_42622
LB_42621:
	bts r12,9
LB_42622:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_42619
	btr r12,2
	jmp LB_42620
LB_42619:
	bts r12,2
LB_42620:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_42625
	btr r12,9
	jmp LB_42626
LB_42625:
	bts r12,9
LB_42626:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_42623
	btr r12,3
	jmp LB_42624
LB_42623:
	bts r12,3
LB_42624:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_42629
	btr r12,9
	jmp LB_42630
LB_42629:
	bts r12,9
LB_42630:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_42627
	btr r12,4
	jmp LB_42628
LB_42627:
	bts r12,4
LB_42628:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_42633
	btr r12,9
	jmp LB_42634
LB_42633:
	bts r12,9
LB_42634:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_42631
	btr r12,5
	jmp LB_42632
LB_42631:
	bts r12,5
LB_42632:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_42637
	btr r12,9
	jmp LB_42638
LB_42637:
	bts r12,9
LB_42638:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_42635
	btr r12,6
	jmp LB_42636
LB_42635:
	bts r12,6
LB_42636:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_42641
	btr r12,9
	jmp LB_42642
LB_42641:
	bts r12,9
LB_42642:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_42639
	btr r12,7
	jmp LB_42640
LB_42639:
	bts r12,7
LB_42640:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42643:
	cmp r15,0
	jz LB_42644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42643
LB_42644:
; _f41332 %_41647 ⊢ %_41653 : %_41653
 ; {>  %_41650~5':_p41173 %_41645~0':_r64 %_41648~3':_p41184 %_41652~7':_p41171 %_41649~4':_p41172 %_41651~6':(_opn)◂(_p41171) %_41647~2':_p41181 }
; _f41332 2' ⊢ 1'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42657
	btr r12,0
	jmp LB_42658
LB_42657:
	bts r12,0
LB_42658:
	call NS_E_41332
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42659
	btr r12,1
	jmp LB_42660
LB_42659:
	bts r12,1
LB_42660:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_42655
	btr r12,7
	jmp LB_42656
LB_42655:
	bts r12,7
LB_42656:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_42653
	btr r12,6
	jmp LB_42654
LB_42653:
	bts r12,6
LB_42654:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_42651
	btr r12,5
	jmp LB_42652
LB_42651:
	bts r12,5
LB_42652:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42649
	btr r12,4
	jmp LB_42650
LB_42649:
	bts r12,4
LB_42650:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42647
	btr r12,3
	jmp LB_42648
LB_42647:
	bts r12,3
LB_42648:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42645
	btr r12,0
	jmp LB_42646
LB_42645:
	bts r12,0
LB_42646:
	add rsp,56
; _f44 %_41645 ⊢ %_41654 : %_41654
 ; {>  %_41650~5':_p41173 %_41653~1':_stg %_41645~0':_r64 %_41648~3':_p41184 %_41652~7':_p41171 %_41649~4':_p41172 %_41651~6':(_opn)◂(_p41171) }
	add r13,1
; _f41828 { %_41654 %_41648 } ⊢ { %_41655 %_41656 } : { %_41655 %_41656 }
 ; {>  %_41650~5':_p41173 %_41653~1':_stg %_41648~3':_p41184 %_41654~0':_r64 %_41652~7':_p41171 %_41649~4':_p41172 %_41651~6':(_opn)◂(_p41171) }
; _f41828 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp+8+8*4],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42671
	btr r12,1
	jmp LB_42672
LB_42671:
	bts r12,1
LB_42672:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_42673
	btr r12,2
	jmp LB_42674
LB_42673:
	bts r12,2
LB_42674:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_42669
	btr r12,7
	jmp LB_42670
LB_42669:
	bts r12,7
LB_42670:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_42667
	btr r12,6
	jmp LB_42668
LB_42667:
	bts r12,6
LB_42668:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_42665
	btr r12,5
	jmp LB_42666
LB_42665:
	bts r12,5
LB_42666:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_42663
	btr r12,4
	jmp LB_42664
LB_42663:
	bts r12,4
LB_42664:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42661
	btr r12,1
	jmp LB_42662
LB_42661:
	bts r12,1
LB_42662:
	add rsp,48
; _f43 %_41655 ⊢ %_41657 : %_41657
 ; {>  %_41650~5':_p41173 %_41653~1':_stg %_41652~7':_p41171 %_41649~4':_p41172 %_41651~6':(_opn)◂(_p41171) %_41655~0':_r64 %_41656~2':_stg }
	sub r13,1
; _f41679 { %_41657 %_41652 } ⊢ { %_41658 %_41659 } : { %_41658 %_41659 }
 ; {>  %_41657~0':_r64 %_41650~5':_p41173 %_41653~1':_stg %_41652~7':_p41171 %_41649~4':_p41172 %_41651~6':(_opn)◂(_p41171) %_41656~2':_stg }
; _f41679 { 0' 7' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_42685
	btr r12,1
	jmp LB_42686
LB_42685:
	bts r12,1
LB_42686:
	call NS_E_41679
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_42687
	btr r12,3
	jmp LB_42688
LB_42687:
	bts r12,3
LB_42688:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_42683
	btr r12,6
	jmp LB_42684
LB_42683:
	bts r12,6
LB_42684:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_42681
	btr r12,5
	jmp LB_42682
LB_42681:
	bts r12,5
LB_42682:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42679
	btr r12,4
	jmp LB_42680
LB_42679:
	bts r12,4
LB_42680:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42677
	btr r12,2
	jmp LB_42678
LB_42677:
	bts r12,2
LB_42678:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42675
	btr r12,1
	jmp LB_42676
LB_42675:
	bts r12,1
LB_42676:
	add rsp,48
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,11
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rdx,rax
	btr r12,7
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42689:
	cmp rax,0
	jz LB_42690
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42689
LB_42690:
; "\226\136\144 .. \226\138\162 "
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41660 %_41664 }
 ; {>  %_41662~2':_stg %_41664~7':_stg %_41650~5':_p41173 %_41663~3':_stg %_41661~1':_stg %_41649~4':_p41172 %_41660~0':_r64 %_41651~6':(_opn)◂(_p41171) }
; 	∎ { 0' 7' }
	bt r12,2
	jc LB_42691
	mov rdi,r8
	call dlt
LB_42691:
	bt r12,5
	jc LB_42692
	mov rdi,r11
	call dlt
LB_42692:
	bt r12,3
	jc LB_42693
	mov rdi,r9
	call dlt
LB_42693:
	bt r12,1
	jc LB_42694
	mov rdi,r14
	call dlt
LB_42694:
	bt r12,4
	jc LB_42695
	mov rdi,r10
	call dlt
LB_42695:
	bt r12,6
	jc LB_42696
	mov rdi,rcx
	call dlt
LB_42696:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_42697
	btr r12,1
	jmp LB_42698
LB_42697:
	bts r12,1
LB_42698:
	ret
MTC_LB_42615:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42699
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42700
	bt QWORD [rdi],0
	jc LB_42701
	btr r12,7
	jmp LB_42702
LB_42701:
	bts r12,7
LB_42702:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42700:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_42705
	btr r12,8
	jmp LB_42706
LB_42705:
	bts r12,8
LB_42706:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42703
	btr r12,2
	jmp LB_42704
LB_42703:
	bts r12,2
LB_42704:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_42709
	btr r12,8
	jmp LB_42710
LB_42709:
	bts r12,8
LB_42710:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42707
	btr r12,3
	jmp LB_42708
LB_42707:
	bts r12,3
LB_42708:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_42713
	btr r12,8
	jmp LB_42714
LB_42713:
	bts r12,8
LB_42714:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42711
	btr r12,4
	jmp LB_42712
LB_42711:
	bts r12,4
LB_42712:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_42717
	btr r12,8
	jmp LB_42718
LB_42717:
	bts r12,8
LB_42718:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42715
	btr r12,5
	jmp LB_42716
LB_42715:
	bts r12,5
LB_42716:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_42721
	btr r12,8
	jmp LB_42722
LB_42721:
	bts r12,8
LB_42722:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42719
	btr r12,6
	jmp LB_42720
LB_42719:
	bts r12,6
LB_42720:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42723:
	cmp r15,0
	jz LB_42724
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42723
LB_42724:
; _f41332 %_41665 ⊢ %_41670 : %_41670
 ; {>  %_41645~0':_r64 %_41666~3':_p41184 %_41669~6':(_opn)◂(_p41171) %_41665~2':_p41181 %_41668~5':_p41173 %_41667~4':_p41172 }
; _f41332 2' ⊢ 1'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_42735
	btr r12,0
	jmp LB_42736
LB_42735:
	bts r12,0
LB_42736:
	call NS_E_41332
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_42737
	btr r12,1
	jmp LB_42738
LB_42737:
	bts r12,1
LB_42738:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_42733
	btr r12,6
	jmp LB_42734
LB_42733:
	bts r12,6
LB_42734:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_42731
	btr r12,5
	jmp LB_42732
LB_42731:
	bts r12,5
LB_42732:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42729
	btr r12,4
	jmp LB_42730
LB_42729:
	bts r12,4
LB_42730:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42727
	btr r12,3
	jmp LB_42728
LB_42727:
	bts r12,3
LB_42728:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_42725
	btr r12,0
	jmp LB_42726
LB_42725:
	bts r12,0
LB_42726:
	add rsp,48
; _f44 %_41645 ⊢ %_41671 : %_41671
 ; {>  %_41645~0':_r64 %_41666~3':_p41184 %_41669~6':(_opn)◂(_p41171) %_41668~5':_p41173 %_41667~4':_p41172 %_41670~1':_stg }
	add r13,1
; _f41828 { %_41671 %_41666 } ⊢ { %_41672 %_41673 } : { %_41672 %_41673 }
 ; {>  %_41671~0':_r64 %_41666~3':_p41184 %_41669~6':(_opn)◂(_p41171) %_41668~5':_p41173 %_41667~4':_p41172 %_41670~1':_stg }
; _f41828 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42747
	btr r12,1
	jmp LB_42748
LB_42747:
	bts r12,1
LB_42748:
	call NS_E_41828
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_42749
	btr r12,2
	jmp LB_42750
LB_42749:
	bts r12,2
LB_42750:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_42745
	btr r12,6
	jmp LB_42746
LB_42745:
	bts r12,6
LB_42746:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_42743
	btr r12,5
	jmp LB_42744
LB_42743:
	bts r12,5
LB_42744:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_42741
	btr r12,4
	jmp LB_42742
LB_42741:
	bts r12,4
LB_42742:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42739
	btr r12,1
	jmp LB_42740
LB_42739:
	bts r12,1
LB_42740:
	add rsp,40
; _f43 %_41672 ⊢ %_41674 : %_41674
 ; {>  %_41673~2':_stg %_41672~0':_r64 %_41669~6':(_opn)◂(_p41171) %_41668~5':_p41173 %_41667~4':_p41172 %_41670~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,12
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42751:
	cmp rax,0
	jz LB_42752
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42751
LB_42752:
; "\226\136\144. .. \226\138\162 "
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_e2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41675 %_41678 }
 ; {>  %_41678~3':_stg %_41675~0':_r64 %_41669~6':(_opn)◂(_p41171) %_41668~5':_p41173 %_41667~4':_p41172 %_41677~2':_stg %_41676~1':_stg }
; 	∎ { 0' 3' }
	bt r12,6
	jc LB_42753
	mov rdi,rcx
	call dlt
LB_42753:
	bt r12,5
	jc LB_42754
	mov rdi,r11
	call dlt
LB_42754:
	bt r12,4
	jc LB_42755
	mov rdi,r10
	call dlt
LB_42755:
	bt r12,2
	jc LB_42756
	mov rdi,r8
	call dlt
LB_42756:
	bt r12,1
	jc LB_42757
	mov rdi,r14
	call dlt
LB_42757:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42758
	btr r12,1
	jmp LB_42759
LB_42758:
	bts r12,1
LB_42759:
	ret
MTC_LB_42699:
NS_E_41644:
; 	|» { 0' 1' }
NS_E_RDI_41644:
MTC_LB_42760:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42761
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42762
	bt QWORD [rdi],0
	jc LB_42763
	btr r12,7
	jmp LB_42764
LB_42763:
	bts r12,7
LB_42764:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42762:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_42767
	btr r12,8
	jmp LB_42768
LB_42767:
	bts r12,8
LB_42768:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42765
	btr r12,2
	jmp LB_42766
LB_42765:
	bts r12,2
LB_42766:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_42771
	btr r12,8
	jmp LB_42772
LB_42771:
	bts r12,8
LB_42772:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42769
	btr r12,3
	jmp LB_42770
LB_42769:
	bts r12,3
LB_42770:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_42775
	btr r12,8
	jmp LB_42776
LB_42775:
	bts r12,8
LB_42776:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42773
	btr r12,4
	jmp LB_42774
LB_42773:
	bts r12,4
LB_42774:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_42779
	btr r12,8
	jmp LB_42780
LB_42779:
	bts r12,8
LB_42780:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42777
	btr r12,5
	jmp LB_42778
LB_42777:
	bts r12,5
LB_42778:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_42783
	btr r12,8
	jmp LB_42784
LB_42783:
	bts r12,8
LB_42784:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_42781
	btr r12,6
	jmp LB_42782
LB_42781:
	bts r12,6
LB_42782:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42785:
	cmp r15,0
	jz LB_42786
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42785
LB_42786:
; _f41644 { %_41626 %_41632 } ⊢ { %_41633 %_41634 } : { %_41633 %_41634 }
 ; {>  %_41631~5':(_opn)◂(_p41170) %_41628~2':(_opn)◂(_stg) %_41626~0':_r64 %_41632~6':_p41170 %_41630~4':_p41173 %_41629~3':_p41172 }
; _f41644 { 0' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_42795
	btr r12,1
	jmp LB_42796
LB_42795:
	bts r12,1
LB_42796:
	call NS_E_41644
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_42793
	btr r12,5
	jmp LB_42794
LB_42793:
	bts r12,5
LB_42794:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42791
	btr r12,4
	jmp LB_42792
LB_42791:
	bts r12,4
LB_42792:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42789
	btr r12,3
	jmp LB_42790
LB_42789:
	bts r12,3
LB_42790:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42787
	btr r12,2
	jmp LB_42788
LB_42787:
	bts r12,2
LB_42788:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42797:
	cmp rax,0
	jz LB_42798
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42797
LB_42798:
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41635 %_41637 }
 ; {>  %_41631~5':(_opn)◂(_p41170) %_41628~2':(_opn)◂(_stg) %_41637~6':_stg %_41630~4':_p41173 %_41636~1':_stg %_41629~3':_p41172 %_41635~0':_r64 }
; 	∎ { 0' 6' }
	bt r12,5
	jc LB_42799
	mov rdi,r11
	call dlt
LB_42799:
	bt r12,2
	jc LB_42800
	mov rdi,r8
	call dlt
LB_42800:
	bt r12,4
	jc LB_42801
	mov rdi,r10
	call dlt
LB_42801:
	bt r12,1
	jc LB_42802
	mov rdi,r14
	call dlt
LB_42802:
	bt r12,3
	jc LB_42803
	mov rdi,r9
	call dlt
LB_42803:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_42804
	btr r12,1
	jmp LB_42805
LB_42804:
	bts r12,1
LB_42805:
	ret
MTC_LB_42761:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42806
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42807
	bt QWORD [rdi],0
	jc LB_42808
	btr r12,6
	jmp LB_42809
LB_42808:
	bts r12,6
LB_42809:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42807:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_42812
	btr r12,7
	jmp LB_42813
LB_42812:
	bts r12,7
LB_42813:
	mov r8,rdx
	bt r12,7
	jc LB_42810
	btr r12,2
	jmp LB_42811
LB_42810:
	bts r12,2
LB_42811:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_42816
	btr r12,7
	jmp LB_42817
LB_42816:
	bts r12,7
LB_42817:
	mov r9,rdx
	bt r12,7
	jc LB_42814
	btr r12,3
	jmp LB_42815
LB_42814:
	bts r12,3
LB_42815:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_42820
	btr r12,7
	jmp LB_42821
LB_42820:
	bts r12,7
LB_42821:
	mov r10,rdx
	bt r12,7
	jc LB_42818
	btr r12,4
	jmp LB_42819
LB_42818:
	bts r12,4
LB_42819:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_42824
	btr r12,7
	jmp LB_42825
LB_42824:
	bts r12,7
LB_42825:
	mov r11,rdx
	bt r12,7
	jc LB_42822
	btr r12,5
	jmp LB_42823
LB_42822:
	bts r12,5
LB_42823:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42826:
	cmp r15,0
	jz LB_42827
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42826
LB_42827:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42828:
	cmp rax,0
	jz LB_42829
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42828
LB_42829:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_41642 %_41643 }
 ; {>  %_41642~0':_r64 %_41638~2':(_opn)◂(_stg) %_41643~1':_stg %_41639~3':_p41172 %_41641~5':(_opn)◂(_p41170) %_41640~4':_p41173 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_42830
	mov rdi,r8
	call dlt
LB_42830:
	bt r12,3
	jc LB_42831
	mov rdi,r9
	call dlt
LB_42831:
	bt r12,5
	jc LB_42832
	mov rdi,r11
	call dlt
LB_42832:
	bt r12,4
	jc LB_42833
	mov rdi,r10
	call dlt
LB_42833:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42806:
NS_E_41625:
; 	|» { 0' 1' }
NS_E_RDI_41625:
MTC_LB_42834:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42835
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42836
	bt QWORD [rdi],0
	jc LB_42837
	btr r12,3
	jmp LB_42838
LB_42837:
	bts r12,3
LB_42838:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42836:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42839
	btr r12,2
	jmp LB_42840
LB_42839:
	bts r12,2
LB_42840:
LB_42841:
	cmp r15,0
	jz LB_42842
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42841
LB_42842:
; _f41644 { %_41617 %_41619 } ⊢ { %_41620 %_41621 } : { %_41620 %_41621 }
 ; {>  %_41617~0':_r64 %_41619~2':_p41170 }
; _f41644 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42843
	btr r12,1
	jmp LB_42844
LB_42843:
	bts r12,1
LB_42844:
	call NS_E_41644
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_41620 %_41621 }
 ; {>  %_41620~0':_r64 %_41621~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42835:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42845
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42846
	bt QWORD [rdi],0
	jc LB_42847
	btr r12,3
	jmp LB_42848
LB_42847:
	bts r12,3
LB_42848:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42846:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_42849
	btr r12,2
	jmp LB_42850
LB_42849:
	bts r12,2
LB_42850:
LB_42851:
	cmp r15,0
	jz LB_42852
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42851
LB_42852:
; _f41679 { %_41617 %_41622 } ⊢ { %_41623 %_41624 } : { %_41623 %_41624 }
 ; {>  %_41617~0':_r64 %_41622~2':_p41171 }
; _f41679 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_42853
	btr r12,1
	jmp LB_42854
LB_42853:
	bts r12,1
LB_42854:
	call NS_E_41679
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_41623 %_41624 }
 ; {>  %_41624~1':_stg %_41623~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42845:
NS_E_41616:
; 	|» { 0' 1' }
NS_E_RDI_41616:
MTC_LB_42855:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42856
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42857
	bt QWORD [rdi],0
	jc LB_42858
	btr r12,5
	jmp LB_42859
LB_42858:
	bts r12,5
LB_42859:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42857:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_42868
	btr r12,6
	jmp LB_42869
LB_42868:
	bts r12,6
LB_42869:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42862
	btr r12,4
	jmp LB_42863
LB_42862:
	bts r12,4
LB_42863:
	mov r8,r10
	bt r12,4
	jc LB_42860
	btr r12,2
	jmp LB_42861
LB_42860:
	bts r12,2
LB_42861:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42866
	btr r12,4
	jmp LB_42867
LB_42866:
	bts r12,4
LB_42867:
	mov r9,r10
	bt r12,4
	jc LB_42864
	btr r12,3
	jmp LB_42865
LB_42864:
	bts r12,3
LB_42865:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_42872
	btr r12,6
	jmp LB_42873
LB_42872:
	bts r12,6
LB_42873:
	mov r10,rcx
	bt r12,6
	jc LB_42870
	btr r12,4
	jmp LB_42871
LB_42870:
	bts r12,4
LB_42871:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42874:
	cmp r15,0
	jz LB_42875
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42874
LB_42875:
; _f44 %_41599 ⊢ %_41604 : %_41604
 ; {>  %_41602~3':_p41169 %_41603~4':(_lst)◂({ _stg _p41169 }) %_41601~2':_stg %_41599~0':_r64 }
	add r13,1
; _f41625 { %_41604 %_41602 } ⊢ { %_41605 %_41606 } : { %_41605 %_41606 }
 ; {>  %_41602~3':_p41169 %_41603~4':(_lst)◂({ _stg _p41169 }) %_41601~2':_stg %_41604~0':_r64 }
; _f41625 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42880
	btr r12,1
	jmp LB_42881
LB_42880:
	bts r12,1
LB_42881:
	call NS_E_41625
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_42878
	btr r12,4
	jmp LB_42879
LB_42878:
	bts r12,4
LB_42879:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42876
	btr r12,2
	jmp LB_42877
LB_42876:
	bts r12,2
LB_42877:
	add rsp,24
; _f43 %_41605 ⊢ %_41607 : %_41607
 ; {>  %_41603~4':(_lst)◂({ _stg _p41169 }) %_41606~1':_stg %_41601~2':_stg %_41605~0':_r64 }
	sub r13,1
; _f41616 { %_41607 %_41603 } ⊢ { %_41608 %_41609 } : { %_41608 %_41609 }
 ; {>  %_41603~4':(_lst)◂({ _stg _p41169 }) %_41606~1':_stg %_41601~2':_stg %_41607~0':_r64 }
; _f41616 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42886
	btr r12,1
	jmp LB_42887
LB_42886:
	bts r12,1
LB_42887:
	call NS_E_41616
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_42888
	btr r12,3
	jmp LB_42889
LB_42888:
	bts r12,3
LB_42889:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42884
	btr r12,2
	jmp LB_42885
LB_42884:
	bts r12,2
LB_42885:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42882
	btr r12,1
	jmp LB_42883
LB_42882:
	bts r12,1
LB_42883:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42890:
	cmp rax,0
	jz LB_42891
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42890
LB_42891:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41610 %_41614 }
 ; {>  %_41612~1':_stg %_41610~0':_r64 %_41614~4':_stg %_41613~3':_stg %_41611~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_42892
	mov rdi,r14
	call dlt
LB_42892:
	bt r12,3
	jc LB_42893
	mov rdi,r9
	call dlt
LB_42893:
	bt r12,2
	jc LB_42894
	mov rdi,r8
	call dlt
LB_42894:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42895
	btr r12,1
	jmp LB_42896
LB_42895:
	bts r12,1
LB_42896:
	ret
MTC_LB_42856:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42897
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42898
	bt QWORD [rdi],0
	jc LB_42899
	btr r12,2
	jmp LB_42900
LB_42899:
	bts r12,2
LB_42900:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42898:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42901:
	cmp r15,0
	jz LB_42902
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42901
LB_42902:
; 	» "" _ ⊢ 1' : %_41615
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_41599 %_41615 }
 ; {>  %_41615~1':_stg %_41599~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42897:
NS_E_41598:
; 	|» { 0' 1' }
NS_E_RDI_41598:
MTC_LB_42903:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42904
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42905
	bt QWORD [rdi],0
	jc LB_42906
	btr r12,5
	jmp LB_42907
LB_42906:
	bts r12,5
LB_42907:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42905:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_42916
	btr r12,6
	jmp LB_42917
LB_42916:
	bts r12,6
LB_42917:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_42910
	btr r12,4
	jmp LB_42911
LB_42910:
	bts r12,4
LB_42911:
	mov r8,r10
	bt r12,4
	jc LB_42908
	btr r12,2
	jmp LB_42909
LB_42908:
	bts r12,2
LB_42909:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_42914
	btr r12,4
	jmp LB_42915
LB_42914:
	bts r12,4
LB_42915:
	mov r9,r10
	bt r12,4
	jc LB_42912
	btr r12,3
	jmp LB_42913
LB_42912:
	bts r12,3
LB_42913:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_42920
	btr r12,6
	jmp LB_42921
LB_42920:
	bts r12,6
LB_42921:
	mov r10,rcx
	bt r12,6
	jc LB_42918
	btr r12,4
	jmp LB_42919
LB_42918:
	bts r12,4
LB_42919:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42922:
	cmp r15,0
	jz LB_42923
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42922
LB_42923:
; _f26 %_41574 ⊢ %_41579 : %_41579
 ; {>  %_41576~2':_stg %_41578~4':(_lst)◂({ _stg _p41168 }) %_41574~0':_r64 %_41577~3':_p41168 }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_42928
	btr r12,4
	jmp LB_42929
LB_42928:
	bts r12,4
LB_42929:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42926
	btr r12,3
	jmp LB_42927
LB_42926:
	bts r12,3
LB_42927:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42924
	btr r12,2
	jmp LB_42925
LB_42924:
	bts r12,2
LB_42925:
	add rsp,32
; _f41598 { %_41579 %_41578 } ⊢ { %_41580 %_41581 } : { %_41580 %_41581 }
 ; {>  %_41576~2':_stg %_41578~4':(_lst)◂({ _stg _p41168 }) %_41579~0':_r64 %_41577~3':_p41168 }
; _f41598 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42934
	btr r12,1
	jmp LB_42935
LB_42934:
	bts r12,1
LB_42935:
	call NS_E_41598
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_42932
	btr r12,3
	jmp LB_42933
LB_42932:
	bts r12,3
LB_42933:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_42930
	btr r12,2
	jmp LB_42931
LB_42930:
	bts r12,2
LB_42931:
	add rsp,24
MTC_LB_42936:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42937
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_42938
	bt QWORD [rdi],0
	jc LB_42939
	btr r12,5
	jmp LB_42940
LB_42939:
	bts r12,5
LB_42940:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42938:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_42941
	btr r12,4
	jmp LB_42942
LB_42941:
	bts r12,4
LB_42942:
LB_42943:
	cmp r15,0
	jz LB_42944
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42943
LB_42944:
; _f44 %_41580 ⊢ %_41583 : %_41583
 ; {>  %_41576~2':_stg %_41582~4':(_lst)◂({ _stg _p41182 }) %_41581~1':_stg %_41580~0':_r64 }
	add r13,1
; _f41730 { %_41583 %_41582 } ⊢ { %_41584 %_41585 } : { %_41584 %_41585 }
 ; {>  %_41576~2':_stg %_41583~0':_r64 %_41582~4':(_lst)◂({ _stg _p41182 }) %_41581~1':_stg }
; _f41730 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42949
	btr r12,1
	jmp LB_42950
LB_42949:
	bts r12,1
LB_42950:
	call NS_E_41730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_42951
	btr r12,3
	jmp LB_42952
LB_42951:
	bts r12,3
LB_42952:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_42947
	btr r12,2
	jmp LB_42948
LB_42947:
	bts r12,2
LB_42948:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_42945
	btr r12,1
	jmp LB_42946
LB_42945:
	bts r12,1
LB_42946:
	add rsp,24
; _f43 %_41584 ⊢ %_41586 : %_41586
 ; {>  %_41585~3':_stg %_41576~2':_stg %_41581~1':_stg %_41584~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42953:
	cmp rax,0
	jz LB_42954
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42953
LB_42954:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41587 %_41591 }
 ; {>  %_41589~3':_stg %_41587~0':_r64 %_41591~4':_stg %_41590~1':_stg %_41588~2':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_42955
	mov rdi,r9
	call dlt
LB_42955:
	bt r12,1
	jc LB_42956
	mov rdi,r14
	call dlt
LB_42956:
	bt r12,2
	jc LB_42957
	mov rdi,r8
	call dlt
LB_42957:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_42958
	btr r12,1
	jmp LB_42959
LB_42958:
	bts r12,1
LB_42959:
	ret
MTC_LB_42937:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42960
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_42961
	bt QWORD [rdi],0
	jc LB_42962
	btr r12,5
	jmp LB_42963
LB_42962:
	bts r12,5
LB_42963:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42961:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_42964
	btr r12,4
	jmp LB_42965
LB_42964:
	bts r12,4
LB_42965:
LB_42966:
	cmp r15,0
	jz LB_42967
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42966
LB_42967:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_42968:
	cmp rax,0
	jz LB_42969
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_42968
LB_42969:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41593 %_41596 }
 ; {>  %_41593~0':_r64 %_41594~2':_stg %_41595~1':_stg %_41592~4':_p41182 %_41596~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_42970
	mov rdi,r8
	call dlt
LB_42970:
	bt r12,1
	jc LB_42971
	mov rdi,r14
	call dlt
LB_42971:
	bt r12,4
	jc LB_42972
	mov rdi,r10
	call dlt
LB_42972:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_42973
	btr r12,1
	jmp LB_42974
LB_42973:
	bts r12,1
LB_42974:
	ret
MTC_LB_42960:
MTC_LB_42904:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_42975
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42976
	bt QWORD [rdi],0
	jc LB_42977
	btr r12,2
	jmp LB_42978
LB_42977:
	bts r12,2
LB_42978:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42976:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42979:
	cmp r15,0
	jz LB_42980
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42979
LB_42980:
; 	» "" _ ⊢ 1' : %_41597
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_41574 %_41597 }
 ; {>  %_41574~0':_r64 %_41597~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_42975:
NS_E_41573:
; 	|» { 0' 1' }
NS_E_RDI_41573:
MTC_LB_42981:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42982
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_42983
	bt QWORD [rdi],0
	jc LB_42984
	btr r12,4
	jmp LB_42985
LB_42984:
	bts r12,4
LB_42985:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42983:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_42988
	btr r12,5
	jmp LB_42989
LB_42988:
	bts r12,5
LB_42989:
	mov r8,r11
	bt r12,5
	jc LB_42986
	btr r12,2
	jmp LB_42987
LB_42986:
	bts r12,2
LB_42987:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_42992
	btr r12,5
	jmp LB_42993
LB_42992:
	bts r12,5
LB_42993:
	mov r9,r11
	bt r12,5
	jc LB_42990
	btr r12,3
	jmp LB_42991
LB_42990:
	bts r12,3
LB_42991:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_42994:
	cmp r15,0
	jz LB_42995
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_42994
LB_42995:
MTC_LB_42996:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_42997
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_42998
	bt QWORD [rdi],0
	jc LB_42999
	btr r12,4
	jmp LB_43000
LB_42999:
	bts r12,4
LB_43000:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_42998:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_43001
	btr r12,1
	jmp LB_43002
LB_43001:
	bts r12,1
LB_43002:
LB_43003:
	cmp r15,0
	jz LB_43004
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43003
LB_43004:
; _f44 %_41505 ⊢ %_41510 : %_41510
 ; {>  %_41507~2':_stg %_41509~1':(_lst)◂(_p41165) %_41505~0':_r64 }
	add r13,1
; _f41504 { %_41510 %_41509 } ⊢ { %_41511 %_41512 } : { %_41511 %_41512 }
 ; {>  %_41507~2':_stg %_41510~0':_r64 %_41509~1':(_lst)◂(_p41165) }
; _f41504 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_41504
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_43005
	btr r12,2
	jmp LB_43006
LB_43005:
	bts r12,2
LB_43006:
	add rsp,16
; _f43 %_41511 ⊢ %_41513 : %_41513
 ; {>  %_41511~0':_r64 %_41507~2':_stg %_41512~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43007:
	cmp rax,0
	jz LB_43008
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43007
LB_43008:
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0*"\t"
	mov rax,r13
LB_43009:
	cmp rax,0
	jz LB_43010
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43009
LB_43010:
; "\t"
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_41514 %_41517 }
 ; {>  %_41515~2':_stg %_41517~3':_stg %_41514~0':_r64 %_41516~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_43011
	mov rdi,r8
	call dlt
LB_43011:
	bt r12,1
	jc LB_43012
	mov rdi,r14
	call dlt
LB_43012:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43013
	btr r12,1
	jmp LB_43014
LB_43013:
	bts r12,1
LB_43014:
	ret
MTC_LB_42997:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43015
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_43016
	bt QWORD [rdi],0
	jc LB_43017
	btr r12,4
	jmp LB_43018
LB_43017:
	bts r12,4
LB_43018:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43016:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_43019
	btr r12,1
	jmp LB_43020
LB_43019:
	bts r12,1
LB_43020:
LB_43021:
	cmp r15,0
	jz LB_43022
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43021
LB_43022:
; _f41128 %_41518 ⊢ %_41519 : %_41519
 ; {>  %_41507~2':_stg %_41518~1':_p41117 %_41505~0':_r64 }
; _f41128 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_43027
	btr r12,0
	jmp LB_43028
LB_43027:
	bts r12,0
LB_43028:
	call NS_E_41128
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_43029
	btr r12,1
	jmp LB_43030
LB_43029:
	bts r12,1
LB_43030:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_43025
	btr r12,2
	jmp LB_43026
LB_43025:
	bts r12,2
LB_43026:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_43023
	btr r12,0
	jmp LB_43024
LB_43023:
	bts r12,0
LB_43024:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43031:
	cmp rax,0
	jz LB_43032
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43031
LB_43032:
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_41520 %_41523 }
 ; {>  %_41522~1':_stg %_41521~2':_stg %_41520~0':_r64 %_41523~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_43033
	mov rdi,r14
	call dlt
LB_43033:
	bt r12,2
	jc LB_43034
	mov rdi,r8
	call dlt
LB_43034:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43035
	btr r12,1
	jmp LB_43036
LB_43035:
	bts r12,1
LB_43036:
	ret
MTC_LB_43015:
MTC_LB_42982:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43037
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43038
	bt QWORD [rdi],0
	jc LB_43039
	btr r12,3
	jmp LB_43040
LB_43039:
	bts r12,3
LB_43040:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43038:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_43041
	btr r12,2
	jmp LB_43042
LB_43041:
	bts r12,2
LB_43042:
LB_43043:
	cmp r15,0
	jz LB_43044
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43043
LB_43044:
; _f44 %_41505 ⊢ %_41525 : %_41525
 ; {>  %_41505~0':_r64 %_41524~2':(_lst)◂({ _stg _p41169 }) }
	add r13,1
; _f41616 { %_41525 %_41524 } ⊢ { %_41526 %_41527 } : { %_41526 %_41527 }
 ; {>  %_41525~0':_r64 %_41524~2':(_lst)◂({ _stg _p41169 }) }
; _f41616 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43045
	btr r12,1
	jmp LB_43046
LB_43045:
	bts r12,1
LB_43046:
	call NS_E_41616
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f43 %_41526 ⊢ %_41528 : %_41528
 ; {>  %_41526~0':_r64 %_41527~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43047:
	cmp rax,0
	jz LB_43048
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43047
LB_43048:
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41529 %_41531 }
 ; {>  %_41530~1':_stg %_41529~0':_r64 %_41531~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_43049
	mov rdi,r14
	call dlt
LB_43049:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43050
	btr r12,1
	jmp LB_43051
LB_43050:
	bts r12,1
LB_43051:
	ret
MTC_LB_43037:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_43052
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43053
	bt QWORD [rdi],0
	jc LB_43054
	btr r12,4
	jmp LB_43055
LB_43054:
	bts r12,4
LB_43055:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43053:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_43058
	btr r12,5
	jmp LB_43059
LB_43058:
	bts r12,5
LB_43059:
	mov r8,r11
	bt r12,5
	jc LB_43056
	btr r12,2
	jmp LB_43057
LB_43056:
	bts r12,2
LB_43057:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_43062
	btr r12,5
	jmp LB_43063
LB_43062:
	bts r12,5
LB_43063:
	mov r9,r11
	bt r12,5
	jc LB_43060
	btr r12,3
	jmp LB_43061
LB_43060:
	bts r12,3
LB_43061:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43064:
	cmp r15,0
	jz LB_43065
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43064
LB_43065:
; _f44 %_41505 ⊢ %_41534 : %_41534
 ; {>  %_41533~3':_p41167 %_41505~0':_r64 %_41532~2':_stg }
	add r13,1
; _f41789 { %_41534 %_41533 } ⊢ { %_41535 %_41536 } : { %_41535 %_41536 }
 ; {>  %_41533~3':_p41167 %_41534~0':_r64 %_41532~2':_stg }
; _f41789 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43068
	btr r12,1
	jmp LB_43069
LB_43068:
	bts r12,1
LB_43069:
	call NS_E_41789
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_43066
	btr r12,2
	jmp LB_43067
LB_43066:
	bts r12,2
LB_43067:
	add rsp,16
; _f43 %_41535 ⊢ %_41537 : %_41537
 ; {>  %_41536~1':_stg %_41535~0':_r64 %_41532~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43070:
	cmp rax,0
	jz LB_43071
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43070
LB_43071:
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41538 %_41541 }
 ; {>  %_41540~1':_stg %_41539~2':_stg %_41541~3':_stg %_41538~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_43072
	mov rdi,r14
	call dlt
LB_43072:
	bt r12,2
	jc LB_43073
	mov rdi,r8
	call dlt
LB_43073:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43074
	btr r12,1
	jmp LB_43075
LB_43074:
	bts r12,1
LB_43075:
	ret
MTC_LB_43052:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_43076
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43077
	bt QWORD [rdi],0
	jc LB_43078
	btr r12,3
	jmp LB_43079
LB_43078:
	bts r12,3
LB_43079:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43077:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_43080
	btr r12,2
	jmp LB_43081
LB_43080:
	bts r12,2
LB_43081:
LB_43082:
	cmp r15,0
	jz LB_43083
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43082
LB_43083:
; _f44 %_41505 ⊢ %_41543 : %_41543
 ; {>  %_41542~2':(_lst)◂({ _stg _p41181 _p41184 }) %_41505~0':_r64 }
	add r13,1
; _f41810 { %_41543 %_41542 } ⊢ { %_41544 %_41545 } : { %_41544 %_41545 }
 ; {>  %_41543~0':_r64 %_41542~2':(_lst)◂({ _stg _p41181 _p41184 }) }
; _f41810 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43084
	btr r12,1
	jmp LB_43085
LB_43084:
	bts r12,1
LB_43085:
	call NS_E_41810
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f43 %_41544 ⊢ %_41546 : %_41546
 ; {>  %_41544~0':_r64 %_41545~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43086:
	cmp rax,0
	jz LB_43087
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43086
LB_43087:
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41547 %_41549 }
 ; {>  %_41549~2':_stg %_41548~1':_stg %_41547~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_43088
	mov rdi,r14
	call dlt
LB_43088:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43089
	btr r12,1
	jmp LB_43090
LB_43089:
	bts r12,1
LB_43090:
	ret
MTC_LB_43076:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_43091
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' }
; 1' ⊢ °4◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43092
	bt QWORD [rdi],0
	jc LB_43093
	btr r12,4
	jmp LB_43094
LB_43093:
	bts r12,4
LB_43094:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43092:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_43097
	btr r12,5
	jmp LB_43098
LB_43097:
	bts r12,5
LB_43098:
	mov r8,r11
	bt r12,5
	jc LB_43095
	btr r12,2
	jmp LB_43096
LB_43095:
	bts r12,2
LB_43096:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_43101
	btr r12,5
	jmp LB_43102
LB_43101:
	bts r12,5
LB_43102:
	mov r9,r11
	bt r12,5
	jc LB_43099
	btr r12,3
	jmp LB_43100
LB_43099:
	bts r12,3
LB_43100:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43103:
	cmp r15,0
	jz LB_43104
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43103
LB_43104:
MTC_LB_43105:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43106
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_43107
	bt QWORD [rdi],0
	jc LB_43108
	btr r12,4
	jmp LB_43109
LB_43108:
	bts r12,4
LB_43109:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43107:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_43110
	btr r12,1
	jmp LB_43111
LB_43110:
	bts r12,1
LB_43111:
LB_43112:
	cmp r15,0
	jz LB_43113
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43112
LB_43113:
; _f44 %_41505 ⊢ %_41553 : %_41553
 ; {>  %_41550~2':_stg %_41552~1':(_lst)◂({ _stg _p41182 }) %_41505~0':_r64 }
	add r13,1
; _f41730 { %_41553 %_41552 } ⊢ { %_41554 %_41555 } : { %_41554 %_41555 }
 ; {>  %_41550~2':_stg %_41553~0':_r64 %_41552~1':(_lst)◂({ _stg _p41182 }) }
; _f41730 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_41730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_43114
	btr r12,2
	jmp LB_43115
LB_43114:
	bts r12,2
LB_43115:
	add rsp,16
; _f43 %_41554 ⊢ %_41556 : %_41556
 ; {>  %_41555~1':_stg %_41550~2':_stg %_41554~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43116:
	cmp rax,0
	jz LB_43117
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43116
LB_43117:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41557 %_41560 }
 ; {>  %_41558~2':_stg %_41559~1':_stg %_41560~3':_stg %_41557~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_43118
	mov rdi,r8
	call dlt
LB_43118:
	bt r12,1
	jc LB_43119
	mov rdi,r14
	call dlt
LB_43119:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43120
	btr r12,1
	jmp LB_43121
LB_43120:
	bts r12,1
LB_43121:
	ret
MTC_LB_43106:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43122
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_43123
	bt QWORD [rdi],0
	jc LB_43124
	btr r12,4
	jmp LB_43125
LB_43124:
	bts r12,4
LB_43125:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43123:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_43126
	btr r12,1
	jmp LB_43127
LB_43126:
	bts r12,1
LB_43127:
LB_43128:
	cmp r15,0
	jz LB_43129
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43128
LB_43129:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43130:
	cmp rax,0
	jz LB_43131
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43130
LB_43131:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_41562 %_41564 }
 ; {>  %_41562~0':_r64 %_41564~3':_stg %_41561~1':_p41182 %_41563~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_43132
	mov rdi,r14
	call dlt
LB_43132:
	bt r12,2
	jc LB_43133
	mov rdi,r8
	call dlt
LB_43133:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43134
	btr r12,1
	jmp LB_43135
LB_43134:
	bts r12,1
LB_43135:
	ret
MTC_LB_43122:
MTC_LB_43091:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_43136
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °5◂2'
; 1' ⊢ °5◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43137
	bt QWORD [rdi],0
	jc LB_43138
	btr r12,3
	jmp LB_43139
LB_43138:
	bts r12,3
LB_43139:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43137:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_43140
	btr r12,2
	jmp LB_43141
LB_43140:
	bts r12,2
LB_43141:
LB_43142:
	cmp r15,0
	jz LB_43143
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43142
LB_43143:
; _f44 %_41505 ⊢ %_41566 : %_41566
 ; {>  %_41565~2':(_lst)◂({ _stg _p41168 }) %_41505~0':_r64 }
	add r13,1
; _f41598 { %_41566 %_41565 } ⊢ { %_41567 %_41568 } : { %_41567 %_41568 }
 ; {>  %_41565~2':(_lst)◂({ _stg _p41168 }) %_41566~0':_r64 }
; _f41598 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43144
	btr r12,1
	jmp LB_43145
LB_43144:
	bts r12,1
LB_43145:
	call NS_E_41598
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f43 %_41567 ⊢ %_41569 : %_41569
 ; {>  %_41567~0':_r64 %_41568~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_43146:
	cmp rax,0
	jz LB_43147
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_43146
LB_43147:
; "\194\182\n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41570 %_41572 }
 ; {>  %_41570~0':_r64 %_41572~2':_stg %_41571~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_43148
	mov rdi,r14
	call dlt
LB_43148:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43149
	btr r12,1
	jmp LB_43150
LB_43149:
	bts r12,1
LB_43150:
	ret
MTC_LB_43136:
NS_E_41504:
; 	|» { 0' 1' }
NS_E_RDI_41504:
MTC_LB_43151:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43152
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43153
	bt QWORD [rdi],0
	jc LB_43154
	btr r12,2
	jmp LB_43155
LB_43154:
	bts r12,2
LB_43155:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43153:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43156:
	cmp r15,0
	jz LB_43157
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43156
LB_43157:
; 	» "" _ ⊢ 1' : %_41494
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_41492 %_41494 }
 ; {>  %_41492~0':_r64 %_41494~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_43152:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43158
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_43159
	bt QWORD [rdi],0
	jc LB_43160
	btr r12,4
	jmp LB_43161
LB_43160:
	bts r12,4
LB_43161:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43159:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_43164
	btr r12,5
	jmp LB_43165
LB_43164:
	bts r12,5
LB_43165:
	mov r8,r11
	bt r12,5
	jc LB_43162
	btr r12,2
	jmp LB_43163
LB_43162:
	bts r12,2
LB_43163:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_43168
	btr r12,5
	jmp LB_43169
LB_43168:
	bts r12,5
LB_43169:
	mov r9,r11
	bt r12,5
	jc LB_43166
	btr r12,3
	jmp LB_43167
LB_43166:
	bts r12,3
LB_43167:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43170:
	cmp r15,0
	jz LB_43171
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43170
LB_43171:
; _f41573 { %_41492 %_41495 } ⊢ { %_41497 %_41498 } : { %_41497 %_41498 }
 ; {>  %_41492~0':_r64 %_41496~3':(_lst)◂(_p41165) %_41495~2':_p41165 }
; _f41573 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43174
	btr r12,1
	jmp LB_43175
LB_43174:
	bts r12,1
LB_43175:
	call NS_E_41573
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_43172
	btr r12,3
	jmp LB_43173
LB_43172:
	bts r12,3
LB_43173:
	add rsp,16
; _f41504 { %_41497 %_41496 } ⊢ { %_41499 %_41500 } : { %_41499 %_41500 }
 ; {>  %_41496~3':(_lst)◂(_p41165) %_41498~1':_stg %_41497~0':_r64 }
; _f41504 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43178
	btr r12,1
	jmp LB_43179
LB_43178:
	bts r12,1
LB_43179:
	call NS_E_41504
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_43180
	btr r12,2
	jmp LB_43181
LB_43180:
	bts r12,2
LB_43181:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_43176
	btr r12,1
	jmp LB_43177
LB_43176:
	bts r12,1
LB_43177:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_41499 %_41503 }
 ; {>  %_41501~1':_stg %_41503~3':_stg %_41502~2':_stg %_41499~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_43182
	mov rdi,r14
	call dlt
LB_43182:
	bt r12,2
	jc LB_43183
	mov rdi,r8
	call dlt
LB_43183:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43184
	btr r12,1
	jmp LB_43185
LB_43184:
	bts r12,1
LB_43185:
	ret
MTC_LB_43158:
NS_E_43189:
NS_E_RDI_43189:
NS_E_43189_ETR_TBL:
NS_E_43189_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_43293
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_43293
	jmp LB_43294
LB_43293:
	jmp LB_43285
LB_43294:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43286
	btr r12,0
	jmp LB_43287
LB_43286:
	bts r12,0
LB_43287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43282
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_43193 : %_43193
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_43193
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_43193 ⊢ %_43194 : %_43194
 ; {>  %_43193~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43194
 ; {>  %_43194~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43280
	btr r12,3
	jmp LB_43281
LB_43280:
	bts r12,3
LB_43281:
	mov r8,0
	bts r12,2
	ret
LB_43282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43283
LB_43284:
	add rsp,8
	ret
LB_43285:
	add rsp,16
	pop r14
LB_43283:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_40451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43309
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43301
LB_43309:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_43189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43314
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43315
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43315:
	jmp LB_43301
LB_43314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43304
	btr r12,1
	jmp LB_43305
LB_43304:
	bts r12,1
LB_43305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43302
	btr r12,0
	jmp LB_43303
LB_43302:
	bts r12,0
LB_43303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43298
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_43196 ⊢ %_43197 : %_43197
 ; {>  %_43196~1':_r64 %_43195~0':_r64 }
	add r14,1
; _some %_43197 ⊢ %_43198 : %_43198
 ; {>  %_43197~1':_r64 %_43195~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_43198
 ; {>  %_43198~°0◂1':(_opn)◂(_r64) %_43195~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_43295
	mov rdi,r13
	call dlt
LB_43295:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_43296
	btr r12,3
	jmp LB_43297
LB_43296:
	bts r12,3
LB_43297:
	mov r8,0
	bts r12,2
	ret
LB_43298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43300
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43299
LB_43300:
	add rsp,8
	ret
LB_43301:
	add rsp,32
	pop r14
LB_43299:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43190:
NS_E_RDI_43190:
NS_E_43190_ETR_TBL:
NS_E_43190_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_43332
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_43332
	jmp LB_43333
LB_43332:
	jmp LB_43322
LB_43333:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43337
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43338
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43338:
	jmp LB_43322
LB_43337:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43325
	btr r12,1
	jmp LB_43326
LB_43325:
	bts r12,1
LB_43326:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43323
	btr r12,0
	jmp LB_43324
LB_43323:
	bts r12,0
LB_43324:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43319
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_43340
	btr r12,2
	jmp LB_43341
LB_43340:
	bts r12,2
LB_43341:
	mov r13,r14
	bt r12,1
	jc LB_43342
	btr r12,0
	jmp LB_43343
LB_43342:
	bts r12,0
LB_43343:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f44 %_43199 ⊢ %_43200 : %_43200
 ; {>  %_43199~0':_r64 }
	add r13,1
; _some %_43200 ⊢ %_43201 : %_43201
 ; {>  %_43200~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43201
 ; {>  %_43201~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43317
	btr r12,3
	jmp LB_43318
LB_43317:
	bts r12,3
LB_43318:
	mov r8,0
	bts r12,2
	ret
LB_43319:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43321
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43320
LB_43321:
	add rsp,8
	ret
LB_43322:
	add rsp,32
	pop r14
LB_43320:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_43359
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_43359
	jmp LB_43360
LB_43359:
	jmp LB_43349
LB_43360:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43364
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43365
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43365:
	jmp LB_43349
LB_43364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43352
	btr r12,1
	jmp LB_43353
LB_43352:
	bts r12,1
LB_43353:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43350
	btr r12,0
	jmp LB_43351
LB_43350:
	bts r12,0
LB_43351:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43346
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_43367
	btr r12,2
	jmp LB_43368
LB_43367:
	bts r12,2
LB_43368:
	mov r13,r14
	bt r12,1
	jc LB_43369
	btr r12,0
	jmp LB_43370
LB_43369:
	bts r12,0
LB_43370:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f44 %_43202 ⊢ %_43203 : %_43203
 ; {>  %_43202~0':_r64 }
	add r13,1
; _some %_43203 ⊢ %_43204 : %_43204
 ; {>  %_43203~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43204
 ; {>  %_43204~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43344
	btr r12,3
	jmp LB_43345
LB_43344:
	bts r12,3
LB_43345:
	mov r8,0
	bts r12,2
	ret
LB_43346:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43348
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43347
LB_43348:
	add rsp,8
	ret
LB_43349:
	add rsp,32
	pop r14
LB_43347:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_43373
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_43205 : %_43205
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_43205
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_43205 ⊢ %_43206 : %_43206
 ; {>  %_43205~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43206
 ; {>  %_43206~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43371
	btr r12,3
	jmp LB_43372
LB_43371:
	bts r12,3
LB_43372:
	mov r8,0
	bts r12,2
	ret
LB_43373:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43375
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43374
LB_43375:
	add rsp,8
	ret
LB_43376:
	add rsp,0
	pop r14
LB_43374:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43191:
NS_E_RDI_43191:
NS_E_43191_ETR_TBL:
NS_E_43191_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43456
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43403
LB_43456:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_43464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_43464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_43464
	jmp LB_43465
LB_43464:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43462
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43462:
	jmp LB_43403
LB_43465:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43420
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43421
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43422:
	jmp LB_43404
LB_43420:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_43432
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_43432
	jmp LB_43433
LB_43432:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43428
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43428:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43429
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43429:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43430
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43430:
	jmp LB_43404
LB_43433:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_43192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43437
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_43438
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_43438:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43439
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43439:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43440
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43440:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43441:
	jmp LB_43404
LB_43437:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_43191_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43446
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_43447
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_43447:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_43448
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_43448:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43449
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43449:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43450
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43450:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43451
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43451:
	jmp LB_43404
LB_43446:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_43415
	btr r12,5
	jmp LB_43416
LB_43415:
	bts r12,5
LB_43416:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_43413
	btr r12,4
	jmp LB_43414
LB_43413:
	bts r12,4
LB_43414:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_43411
	btr r12,3
	jmp LB_43412
LB_43411:
	bts r12,3
LB_43412:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_43409
	btr r12,2
	jmp LB_43410
LB_43409:
	bts r12,2
LB_43410:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43407
	btr r12,1
	jmp LB_43408
LB_43407:
	bts r12,1
LB_43408:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43405
	btr r12,0
	jmp LB_43406
LB_43405:
	bts r12,0
LB_43406:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_43400
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_43466
	btr r12,6
	jmp LB_43467
LB_43466:
	bts r12,6
LB_43467:
	mov r8,r10
	bt r12,4
	jc LB_43468
	btr r12,2
	jmp LB_43469
LB_43468:
	bts r12,2
LB_43469:
	mov rdx,r14
	bt r12,1
	jc LB_43470
	btr r12,7
	jmp LB_43471
LB_43470:
	bts r12,7
LB_43471:
	mov r14,rcx
	bt r12,6
	jc LB_43472
	btr r12,1
	jmp LB_43473
LB_43472:
	bts r12,1
LB_43473:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_43476
	btr r12,6
	jmp LB_43477
LB_43476:
	bts r12,6
LB_43477:
	mov r9,rcx
	bt r12,6
	jc LB_43474
	btr r12,3
	jmp LB_43475
LB_43474:
	bts r12,3
LB_43475:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_43480
	btr r12,6
	jmp LB_43481
LB_43480:
	bts r12,6
LB_43481:
	mov r10,rcx
	bt r12,6
	jc LB_43478
	btr r12,4
	jmp LB_43479
LB_43478:
	bts r12,4
LB_43479:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_43212 : %_43212
 ; {>  %_43210~3':_r64 %_43209~2':_r64 %_43211~4':(_lst)◂(_p43186) %_43208~1':_r64 %_43207~0':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_43212
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_43212 %_43207 } ⊢ { %_43213 %_43214 } : { %_43213 %_43214 }
 ; {>  %_43210~3':_r64 %_43212~5':_r64 %_43209~2':_r64 %_43211~4':(_lst)◂(_p43186) %_43208~1':_r64 %_43207~0':_r64 }
	add r11,r13
; _f39 { %_43213 %_43208 } ⊢ { %_43215 %_43216 } : { %_43215 %_43216 }
 ; {>  %_43213~5':_r64 %_43210~3':_r64 %_43214~0':_r64 %_43209~2':_r64 %_43211~4':(_lst)◂(_p43186) %_43208~1':_r64 }
	add r11,r14
; _f39 { %_43215 %_43209 } ⊢ { %_43217 %_43218 } : { %_43217 %_43218 }
 ; {>  %_43210~3':_r64 %_43214~0':_r64 %_43209~2':_r64 %_43215~5':_r64 %_43211~4':(_lst)◂(_p43186) %_43216~1':_r64 }
	add r11,r8
; _f43187 %_43217 ⊢ %_43219 : %_43219
 ; {>  %_43210~3':_r64 %_43214~0':_r64 %_43218~2':_r64 %_43211~4':(_lst)◂(_p43186) %_43217~5':_r64 %_43216~1':_r64 }
; _f43187 5' ⊢ °0◂5'
; _cns { %_43219 %_43211 } ⊢ %_43220 : %_43220
 ; {>  %_43210~3':_r64 %_43214~0':_r64 %_43218~2':_r64 %_43211~4':(_lst)◂(_p43186) %_43219~°0◂5':_p43186 %_43216~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_43210 %_43220 } ⊢ %_43221 : %_43221
 ; {>  %_43210~3':_r64 %_43214~0':_r64 %_43218~2':_r64 %_43220~°0◂{ °0◂5' 4' }:(_lst)◂(_p43186) %_43216~1':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_43221
 ; {>  %_43221~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p43186) }) %_43214~0':_r64 %_43218~2':_r64 %_43216~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,0
	jc LB_43377
	mov rdi,r13
	call dlt
LB_43377:
	bt r12,2
	jc LB_43378
	mov rdi,r8
	call dlt
LB_43378:
	bt r12,1
	jc LB_43379
	mov rdi,r14
	call dlt
LB_43379:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_43380
	btr r12,0
	jmp LB_43381
LB_43380:
	bts r12,0
LB_43381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_43384
	btr r12,1
	jmp LB_43385
LB_43384:
	bts r12,1
LB_43385:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_43382
	btr QWORD [rdi],0
	jmp LB_43383
LB_43382:
	bts QWORD [rdi],0
LB_43383:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_43394
	btr r12,0
	jmp LB_43395
LB_43394:
	bts r12,0
LB_43395:
	mov rsi,1
	bt r12,0
	jc LB_43392
	mov rsi,0
	bt r13,0
	jc LB_43392
	jmp LB_43393
LB_43392:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_43393:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_43390
	btr QWORD [rdi],0
	jmp LB_43391
LB_43390:
	bts QWORD [rdi],0
LB_43391:
	mov r13,r10
	bt r12,4
	jc LB_43398
	btr r12,0
	jmp LB_43399
LB_43398:
	bts r12,0
LB_43399:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_43396
	btr QWORD [rdi],1
	jmp LB_43397
LB_43396:
	bts QWORD [rdi],1
LB_43397:
	mov rsi,1
	bt r12,1
	jc LB_43388
	mov rsi,0
	bt r14,0
	jc LB_43388
	jmp LB_43389
LB_43388:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43389:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_43386
	btr QWORD [rdi],1
	jmp LB_43387
LB_43386:
	bts QWORD [rdi],1
LB_43387:
	mov r8,0
	bts r12,2
	ret
LB_43400:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43402
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43401
LB_43402:
	add rsp,8
	ret
LB_43404:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_43403:
	add rsp,96
	pop r14
LB_43401:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43535
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43507
LB_43535:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_43543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_43543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_43543
	jmp LB_43544
LB_43543:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43541
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43541:
	jmp LB_43507
LB_43544:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_43189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43521
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43521:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43522
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43522:
	jmp LB_43508
LB_43520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_43191_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43527
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43528
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43528:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43529
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43529:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43530:
	jmp LB_43508
LB_43527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_43515
	btr r12,3
	jmp LB_43516
LB_43515:
	bts r12,3
LB_43516:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_43513
	btr r12,2
	jmp LB_43514
LB_43513:
	bts r12,2
LB_43514:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43511
	btr r12,1
	jmp LB_43512
LB_43511:
	bts r12,1
LB_43512:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43509
	btr r12,0
	jmp LB_43510
LB_43509:
	bts r12,0
LB_43510:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_43504
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_43545
	btr r12,4
	jmp LB_43546
LB_43545:
	bts r12,4
LB_43546:
	mov r14,r8
	bt r12,2
	jc LB_43547
	btr r12,1
	jmp LB_43548
LB_43547:
	bts r12,1
LB_43548:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_43549
	btr r12,4
	jmp LB_43550
LB_43549:
	bts r12,4
LB_43550:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_43553
	btr r12,5
	jmp LB_43554
LB_43553:
	bts r12,5
LB_43554:
	mov r8,r11
	bt r12,5
	jc LB_43551
	btr r12,2
	jmp LB_43552
LB_43551:
	bts r12,2
LB_43552:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_43557
	btr r12,5
	jmp LB_43558
LB_43557:
	bts r12,5
LB_43558:
	mov r9,r11
	bt r12,5
	jc LB_43555
	btr r12,3
	jmp LB_43556
LB_43555:
	bts r12,3
LB_43556:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_43226 : %_43226
 ; {>  %_43225~3':(_lst)◂(_p43186) %_43223~1':_r64 %_43224~2':_r64 %_43222~0':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_43226
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_43226 %_43222 } ⊢ { %_43227 %_43228 } : { %_43227 %_43228 }
 ; {>  %_43225~3':(_lst)◂(_p43186) %_43223~1':_r64 %_43226~4':_r64 %_43224~2':_r64 %_43222~0':_r64 }
	add r10,r13
; _f39 { %_43227 %_43223 } ⊢ { %_43229 %_43230 } : { %_43229 %_43230 }
 ; {>  %_43225~3':(_lst)◂(_p43186) %_43223~1':_r64 %_43228~0':_r64 %_43224~2':_r64 %_43227~4':_r64 }
	add r10,r14
; _f43187 %_43229 ⊢ %_43231 : %_43231
 ; {>  %_43225~3':(_lst)◂(_p43186) %_43228~0':_r64 %_43224~2':_r64 %_43230~1':_r64 %_43229~4':_r64 }
; _f43187 4' ⊢ °0◂4'
; _cns { %_43231 %_43225 } ⊢ %_43232 : %_43232
 ; {>  %_43231~°0◂4':_p43186 %_43225~3':(_lst)◂(_p43186) %_43228~0':_r64 %_43224~2':_r64 %_43230~1':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_43224 %_43232 } ⊢ %_43233 : %_43233
 ; {>  %_43232~°0◂{ °0◂4' 3' }:(_lst)◂(_p43186) %_43228~0':_r64 %_43224~2':_r64 %_43230~1':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_43233
 ; {>  %_43233~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p43186) }) %_43228~0':_r64 %_43230~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_43482
	mov rdi,r13
	call dlt
LB_43482:
	bt r12,1
	jc LB_43483
	mov rdi,r14
	call dlt
LB_43483:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_43484
	btr r12,0
	jmp LB_43485
LB_43484:
	bts r12,0
LB_43485:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_43488
	btr r12,1
	jmp LB_43489
LB_43488:
	bts r12,1
LB_43489:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_43486
	btr QWORD [rdi],0
	jmp LB_43487
LB_43486:
	bts QWORD [rdi],0
LB_43487:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_43498
	btr r12,2
	jmp LB_43499
LB_43498:
	bts r12,2
LB_43499:
	mov rsi,1
	bt r12,2
	jc LB_43496
	mov rsi,0
	bt r8,0
	jc LB_43496
	jmp LB_43497
LB_43496:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_43497:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_43494
	btr QWORD [rdi],0
	jmp LB_43495
LB_43494:
	bts QWORD [rdi],0
LB_43495:
	mov r8,r13
	bt r12,0
	jc LB_43502
	btr r12,2
	jmp LB_43503
LB_43502:
	bts r12,2
LB_43503:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_43500
	btr QWORD [rdi],1
	jmp LB_43501
LB_43500:
	bts QWORD [rdi],1
LB_43501:
	mov rsi,1
	bt r12,1
	jc LB_43492
	mov rsi,0
	bt r14,0
	jc LB_43492
	jmp LB_43493
LB_43492:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43493:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_43490
	btr QWORD [rdi],1
	jmp LB_43491
LB_43490:
	bts QWORD [rdi],1
LB_43491:
	mov r8,0
	bts r12,2
	ret
LB_43504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43506
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43505
LB_43506:
	add rsp,8
	ret
LB_43508:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_43507:
	add rsp,64
	pop r14
LB_43505:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_43189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43630
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43622
LB_43630:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_43191_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43635
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43636
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43636:
	jmp LB_43622
LB_43635:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43625
	btr r12,1
	jmp LB_43626
LB_43625:
	bts r12,1
LB_43626:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43623
	btr r12,0
	jmp LB_43624
LB_43623:
	bts r12,0
LB_43624:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43619
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_43638
	btr r12,3
	jmp LB_43639
LB_43638:
	bts r12,3
LB_43639:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_43642
	btr r12,4
	jmp LB_43643
LB_43642:
	bts r12,4
LB_43643:
	mov r14,r10
	bt r12,4
	jc LB_43640
	btr r12,1
	jmp LB_43641
LB_43640:
	bts r12,1
LB_43641:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_43646
	btr r12,4
	jmp LB_43647
LB_43646:
	bts r12,4
LB_43647:
	mov r8,r10
	bt r12,4
	jc LB_43644
	btr r12,2
	jmp LB_43645
LB_43644:
	bts r12,2
LB_43645:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f39 { %_43235 %_43234 } ⊢ { %_43237 %_43238 } : { %_43237 %_43238 }
 ; {>  %_43236~2':(_lst)◂(_p43186) %_43234~0':_r64 %_43235~1':_r64 }
	add r14,r13
MTC_LB_43559:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43560
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_43561
	bt QWORD [rdi],0
	jc LB_43562
	btr r12,5
	jmp LB_43563
LB_43562:
	bts r12,5
LB_43563:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43561:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_43566
	btr r12,6
	jmp LB_43567
LB_43566:
	bts r12,6
LB_43567:
	mov r9,rcx
	bt r12,6
	jc LB_43564
	btr r12,3
	jmp LB_43565
LB_43564:
	bts r12,3
LB_43565:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_43570
	btr r12,6
	jmp LB_43571
LB_43570:
	bts r12,6
LB_43571:
	mov r10,rcx
	bt r12,6
	jc LB_43568
	btr r12,4
	jmp LB_43569
LB_43568:
	bts r12,4
LB_43569:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43560
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_43572
	bt QWORD [rdi],0
	jc LB_43573
	btr r12,6
	jmp LB_43574
LB_43573:
	bts r12,6
LB_43574:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43572:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_43575
	btr r12,5
	jmp LB_43576
LB_43575:
	bts r12,5
LB_43576:
LB_43577:
	cmp r15,0
	jz LB_43578
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43577
LB_43578:
; _f39 { %_43241 %_43238 } ⊢ { %_43242 %_43243 } : { %_43242 %_43243 }
 ; {>  %_43240~4':(_lst)◂(_p43186) %_43237~1':_r64 %_43238~0':_r64 %_43241~5':_r64 }
	add r11,r13
; _f43188 %_43242 ⊢ %_43244 : %_43244
 ; {>  %_43240~4':(_lst)◂(_p43186) %_43237~1':_r64 %_43243~0':_r64 %_43242~5':_r64 }
; _f43188 5' ⊢ °1◂5'
; _cns { %_43244 %_43240 } ⊢ %_43245 : %_43245
 ; {>  %_43240~4':(_lst)◂(_p43186) %_43237~1':_r64 %_43243~0':_r64 %_43244~°1◂5':_p43186 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_43237 %_43245 } ⊢ %_43246 : %_43246
 ; {>  %_43245~°0◂{ °1◂5' 4' }:(_lst)◂(_p43186) %_43237~1':_r64 %_43243~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_43246
 ; {>  %_43243~0':_r64 %_43246~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p43186) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_43579
	mov rdi,r13
	call dlt
LB_43579:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_43582
	btr r12,0
	jmp LB_43583
LB_43582:
	bts r12,0
LB_43583:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_43580
	btr QWORD [rdi],0
	jmp LB_43581
LB_43580:
	bts QWORD [rdi],0
LB_43581:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_43592
	btr r12,1
	jmp LB_43593
LB_43592:
	bts r12,1
LB_43593:
	mov rsi,1
	bt r12,1
	jc LB_43590
	mov rsi,0
	bt r14,0
	jc LB_43590
	jmp LB_43591
LB_43590:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43591:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_43588
	btr QWORD [rdi],0
	jmp LB_43589
LB_43588:
	bts QWORD [rdi],0
LB_43589:
	mov r14,r10
	bt r12,4
	jc LB_43596
	btr r12,1
	jmp LB_43597
LB_43596:
	bts r12,1
LB_43597:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_43594
	btr QWORD [rdi],1
	jmp LB_43595
LB_43594:
	bts QWORD [rdi],1
LB_43595:
	mov rsi,1
	bt r12,0
	jc LB_43586
	mov rsi,0
	bt r13,0
	jc LB_43586
	jmp LB_43587
LB_43586:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_43587:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_43584
	btr QWORD [rdi],1
	jmp LB_43585
LB_43584:
	bts QWORD [rdi],1
LB_43585:
	mov r8,0
	bts r12,2
	ret
MTC_LB_43560:
	mov r15,0
LB_43599:
	cmp r15,0
	jz LB_43600
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43599
LB_43600:
; _f43188 %_43238 ⊢ %_43247 : %_43247
 ; {>  %_43236~2':(_lst)◂(_p43186) %_43237~1':_r64 %_43238~0':_r64 }
; _f43188 0' ⊢ °1◂0'
; _cns { %_43247 %_43236 } ⊢ %_43248 : %_43248
 ; {>  %_43236~2':(_lst)◂(_p43186) %_43237~1':_r64 %_43247~°1◂0':_p43186 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_43237 %_43248 } ⊢ %_43249 : %_43249
 ; {>  %_43248~°0◂{ °1◂0' 2' }:(_lst)◂(_p43186) %_43237~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_43249
 ; {>  %_43249~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p43186) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_43603
	btr r12,4
	jmp LB_43604
LB_43603:
	bts r12,4
LB_43604:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_43601
	btr QWORD [rdi],0
	jmp LB_43602
LB_43601:
	bts QWORD [rdi],0
LB_43602:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_43613
	btr r12,1
	jmp LB_43614
LB_43613:
	bts r12,1
LB_43614:
	mov rsi,1
	bt r12,1
	jc LB_43611
	mov rsi,0
	bt r14,0
	jc LB_43611
	jmp LB_43612
LB_43611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43612:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_43609
	btr QWORD [rdi],0
	jmp LB_43610
LB_43609:
	bts QWORD [rdi],0
LB_43610:
	mov r14,r8
	bt r12,2
	jc LB_43617
	btr r12,1
	jmp LB_43618
LB_43617:
	bts r12,1
LB_43618:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_43615
	btr QWORD [rdi],1
	jmp LB_43616
LB_43615:
	bts QWORD [rdi],1
LB_43616:
	mov rsi,1
	bt r12,4
	jc LB_43607
	mov rsi,0
	bt r10,0
	jc LB_43607
	jmp LB_43608
LB_43607:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_43608:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_43605
	btr QWORD [rdi],1
	jmp LB_43606
LB_43605:
	bts QWORD [rdi],1
LB_43606:
	mov r8,0
	bts r12,2
	ret
MTC_LB_43598:
LB_43619:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43621
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43620
LB_43621:
	add rsp,8
	ret
LB_43622:
	add rsp,32
	pop r14
LB_43620:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_43656
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_43250 : %_43250
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_43251 : %_43251
 ; {>  %_43250~°1◂{  }:(_lst)◂(t16815'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_43251
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_43251 %_43250 } ⊢ %_43252 : %_43252
 ; {>  %_43251~0':_r64 %_43250~°1◂{  }:(_lst)◂(t16815'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_43252
 ; {>  %_43252~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t16819'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_43650
	btr r12,1
	jmp LB_43651
LB_43650:
	bts r12,1
LB_43651:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_43648
	btr QWORD [rdi],0
	jmp LB_43649
LB_43648:
	bts QWORD [rdi],0
LB_43649:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_43654
	mov rsi,0
	bt r14,0
	jc LB_43654
	jmp LB_43655
LB_43654:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43655:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_43652
	btr QWORD [rdi],1
	jmp LB_43653
LB_43652:
	bts QWORD [rdi],1
LB_43653:
	mov r8,0
	bts r12,2
	ret
LB_43656:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43658
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43657
LB_43658:
	add rsp,8
	ret
LB_43659:
	add rsp,0
	pop r14
LB_43657:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43192:
NS_E_RDI_43192:
NS_E_43192_ETR_TBL:
NS_E_43192_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43697
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43667
LB_43697:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_43705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_43705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_43705
	jmp LB_43706
LB_43705:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43703
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43703:
	jmp LB_43667
LB_43706:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43680
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43681
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43681:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43682
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43682:
	jmp LB_43668
LB_43680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_43692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_43692
	jmp LB_43693
LB_43692:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43688
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43688:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43689
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43689:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43690
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43690:
	jmp LB_43668
LB_43693:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_43675
	btr r12,3
	jmp LB_43676
LB_43675:
	bts r12,3
LB_43676:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_43673
	btr r12,2
	jmp LB_43674
LB_43673:
	bts r12,2
LB_43674:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43671
	btr r12,1
	jmp LB_43672
LB_43671:
	bts r12,1
LB_43672:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43669
	btr r12,0
	jmp LB_43670
LB_43669:
	bts r12,0
LB_43670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_43664
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_43707
	btr r12,4
	jmp LB_43708
LB_43707:
	bts r12,4
LB_43708:
	mov r14,r8
	bt r12,2
	jc LB_43709
	btr r12,1
	jmp LB_43710
LB_43709:
	bts r12,1
LB_43710:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_43255 : %_43255
 ; {>  %_43253~0':_r64 %_43254~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_43255
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_43255 %_43253 } ⊢ { %_43256 %_43257 } : { %_43256 %_43257 }
 ; {>  %_43253~0':_r64 %_43255~2':_r64 %_43254~1':_r64 }
	add r8,r13
; _f39 { %_43256 %_43254 } ⊢ { %_43258 %_43259 } : { %_43258 %_43259 }
 ; {>  %_43257~0':_r64 %_43256~2':_r64 %_43254~1':_r64 }
	add r8,r14
; _some %_43258 ⊢ %_43260 : %_43260
 ; {>  %_43257~0':_r64 %_43258~2':_r64 %_43259~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_43260
 ; {>  %_43257~0':_r64 %_43260~°0◂2':(_opn)◂(_r64) %_43259~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_43660
	mov rdi,r13
	call dlt
LB_43660:
	bt r12,1
	jc LB_43661
	mov rdi,r14
	call dlt
LB_43661:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_43662
	btr r12,3
	jmp LB_43663
LB_43662:
	bts r12,3
LB_43663:
	mov r8,0
	bts r12,2
	ret
LB_43664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43666
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43665
LB_43666:
	add rsp,8
	ret
LB_43668:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_43667:
	add rsp,64
	pop r14
LB_43665:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43773
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43720
LB_43773:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_43781
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_43781
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_43781
	jmp LB_43782
LB_43781:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43779
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43779:
	jmp LB_43720
LB_43782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_43190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43737
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43738
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43738:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43739
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43739:
	jmp LB_43721
LB_43737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_43749
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_43749
	jmp LB_43750
LB_43749:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43745
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43745:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43746
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43746:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43747:
	jmp LB_43721
LB_43750:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_43192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43754
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_43755
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_43755:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43756
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43756:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43757
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43757:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43758
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43758:
	jmp LB_43721
LB_43754:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_43192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43763
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_43764
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_43764:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_43765
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_43765:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_43766
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_43766:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43767
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43767:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43768:
	jmp LB_43721
LB_43763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_43732
	btr r12,5
	jmp LB_43733
LB_43732:
	bts r12,5
LB_43733:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_43730
	btr r12,4
	jmp LB_43731
LB_43730:
	bts r12,4
LB_43731:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_43728
	btr r12,3
	jmp LB_43729
LB_43728:
	bts r12,3
LB_43729:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_43726
	btr r12,2
	jmp LB_43727
LB_43726:
	bts r12,2
LB_43727:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43724
	btr r12,1
	jmp LB_43725
LB_43724:
	bts r12,1
LB_43725:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43722
	btr r12,0
	jmp LB_43723
LB_43722:
	bts r12,0
LB_43723:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_43717
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_43783
	btr r12,6
	jmp LB_43784
LB_43783:
	bts r12,6
LB_43784:
	mov r9,r11
	bt r12,5
	jc LB_43785
	btr r12,3
	jmp LB_43786
LB_43785:
	bts r12,3
LB_43786:
	mov r11,r8
	bt r12,2
	jc LB_43787
	btr r12,5
	jmp LB_43788
LB_43787:
	bts r12,5
LB_43788:
	mov r8,r10
	bt r12,4
	jc LB_43789
	btr r12,2
	jmp LB_43790
LB_43789:
	bts r12,2
LB_43790:
	mov r10,r14
	bt r12,1
	jc LB_43791
	btr r12,4
	jmp LB_43792
LB_43791:
	bts r12,4
LB_43792:
	mov r14,r11
	bt r12,5
	jc LB_43793
	btr r12,1
	jmp LB_43794
LB_43793:
	bts r12,1
LB_43794:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_43265 : %_43265
 ; {>  %_43264~3':_r64 %_43262~1':_r64 %_43261~0':_r64 %_43263~2':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_43265
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_43265 %_43261 } ⊢ { %_43266 %_43267 } : { %_43266 %_43267 }
 ; {>  %_43264~3':_r64 %_43262~1':_r64 %_43265~4':_r64 %_43261~0':_r64 %_43263~2':_r64 }
	add r10,r13
; _f39 { %_43266 %_43262 } ⊢ { %_43268 %_43269 } : { %_43268 %_43269 }
 ; {>  %_43264~3':_r64 %_43266~4':_r64 %_43262~1':_r64 %_43267~0':_r64 %_43263~2':_r64 }
	add r10,r14
; _f39 { %_43268 %_43263 } ⊢ { %_43270 %_43271 } : { %_43270 %_43271 }
 ; {>  %_43264~3':_r64 %_43267~0':_r64 %_43263~2':_r64 %_43269~1':_r64 %_43268~4':_r64 }
	add r10,r8
; _f39 { %_43270 %_43264 } ⊢ { %_43272 %_43273 } : { %_43272 %_43273 }
 ; {>  %_43271~2':_r64 %_43264~3':_r64 %_43267~0':_r64 %_43270~4':_r64 %_43269~1':_r64 }
	add r10,r9
; _some %_43272 ⊢ %_43274 : %_43274
 ; {>  %_43271~2':_r64 %_43272~4':_r64 %_43267~0':_r64 %_43273~3':_r64 %_43269~1':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_43274
 ; {>  %_43271~2':_r64 %_43267~0':_r64 %_43274~°0◂4':(_opn)◂(_r64) %_43273~3':_r64 %_43269~1':_r64 }
; 	∎ °0◂4'
	bt r12,2
	jc LB_43711
	mov rdi,r8
	call dlt
LB_43711:
	bt r12,0
	jc LB_43712
	mov rdi,r13
	call dlt
LB_43712:
	bt r12,3
	jc LB_43713
	mov rdi,r9
	call dlt
LB_43713:
	bt r12,1
	jc LB_43714
	mov rdi,r14
	call dlt
LB_43714:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_43715
	btr r12,3
	jmp LB_43716
LB_43715:
	bts r12,3
LB_43716:
	mov r8,0
	bts r12,2
	ret
LB_43717:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43719
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43718
LB_43719:
	add rsp,8
	ret
LB_43721:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_43720:
	add rsp,96
	pop r14
LB_43718:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_43189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43809
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43801
LB_43809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_43192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43814
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43815:
	jmp LB_43801
LB_43814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43804
	btr r12,1
	jmp LB_43805
LB_43804:
	bts r12,1
LB_43805:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43802
	btr r12,0
	jmp LB_43803
LB_43802:
	bts r12,0
LB_43803:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43798
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_43275 %_43276 } ⊢ { %_43277 %_43278 } : { %_43277 %_43278 }
 ; {>  %_43276~1':_r64 %_43275~0':_r64 }
	add r13,r14
; _some %_43277 ⊢ %_43279 : %_43279
 ; {>  %_43278~1':_r64 %_43277~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43279
 ; {>  %_43278~1':_r64 %_43279~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_43795
	mov rdi,r14
	call dlt
LB_43795:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43796
	btr r12,3
	jmp LB_43797
LB_43796:
	bts r12,3
LB_43797:
	mov r8,0
	bts r12,2
	ret
LB_43798:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43800
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_43799
LB_43800:
	add rsp,8
	ret
LB_43801:
	add rsp,32
	pop r14
LB_43799:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43839:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_43839:
MTC_LB_43840:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43841
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_43842
	bt QWORD [rdi],0
	jc LB_43843
	btr r12,7
	jmp LB_43844
LB_43843:
	bts r12,7
LB_43844:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43842:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_43847
	btr r12,8
	jmp LB_43848
LB_43847:
	bts r12,8
LB_43848:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_43845
	btr r12,5
	jmp LB_43846
LB_43845:
	bts r12,5
LB_43846:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_43851
	btr r12,8
	jmp LB_43852
LB_43851:
	bts r12,8
LB_43852:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_43849
	btr r12,6
	jmp LB_43850
LB_43849:
	bts r12,6
LB_43850:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43853:
	cmp r15,0
	jz LB_43854
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43853
LB_43854:
MTC_LB_43855:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43856
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_43857
	bt QWORD [rdi],0
	jc LB_43858
	btr r12,7
	jmp LB_43859
LB_43858:
	bts r12,7
LB_43859:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43857:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_43860
	btr r12,4
	jmp LB_43861
LB_43860:
	bts r12,4
LB_43861:
LB_43862:
	cmp r15,0
	jz LB_43863
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43862
LB_43863:
; _f41 %_43824 ⊢ { %_43825 %_43826 } : { %_43825 %_43826 }
 ; {>  %_43819~2':_stg %_43824~4':_r64 %_43820~3':_r64 %_43817~0':_stg %_43823~6':(_lst)◂(_p43186) %_43818~1':_r64 }
	mov r11,r10
	bts r12,5
; _f23 { %_43826 %_43817 %_43818 %_43819 %_43820 } ⊢ { %_43827 %_43828 %_43829 %_43830 %_43831 } : { %_43827 %_43828 %_43829 %_43830 %_43831 }
 ; {>  %_43825~4':_r64 %_43819~2':_stg %_43826~5':_r64 %_43820~3':_r64 %_43817~0':_stg %_43823~6':(_lst)◂(_p43186) %_43818~1':_r64 }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_43868
	btr r12,4
	jmp LB_43869
LB_43868:
	bts r12,4
LB_43869:
	mov r9,r8
	bt r12,2
	jc LB_43870
	btr r12,3
	jmp LB_43871
LB_43870:
	bts r12,3
LB_43871:
	mov r8,r14
	bt r12,1
	jc LB_43872
	btr r12,2
	jmp LB_43873
LB_43872:
	bts r12,2
LB_43873:
	mov r14,r13
	bt r12,0
	jc LB_43874
	btr r12,1
	jmp LB_43875
LB_43874:
	bts r12,1
LB_43875:
	mov r13,r11
	bt r12,5
	jc LB_43876
	btr r12,0
	jmp LB_43877
LB_43876:
	bts r12,0
LB_43877:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_43878
	btr r12,5
	jmp LB_43879
LB_43878:
	bts r12,5
LB_43879:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_43866
	btr r12,6
	jmp LB_43867
LB_43866:
	bts r12,6
LB_43867:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_43864
	btr r12,4
	jmp LB_43865
LB_43864:
	bts r12,4
LB_43865:
	add rsp,24
; _f43839 { %_43828 %_43829 %_43830 %_43831 %_43823 } ⊢ { %_43832 %_43833 } : { %_43832 %_43833 }
 ; {>  %_43825~4':_r64 %_43830~3':_stg %_43829~2':_r64 %_43831~5':_r64 %_43828~1':_stg %_43827~0':_r64 %_43823~6':(_lst)◂(_p43186) }
; _f43839 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_43884
	btr r12,0
	jmp LB_43885
LB_43884:
	bts r12,0
LB_43885:
	mov r14,r8
	bt r12,2
	jc LB_43886
	btr r12,1
	jmp LB_43887
LB_43886:
	bts r12,1
LB_43887:
	mov r8,r9
	bt r12,3
	jc LB_43888
	btr r12,2
	jmp LB_43889
LB_43888:
	bts r12,2
LB_43889:
	mov r9,r11
	bt r12,5
	jc LB_43890
	btr r12,3
	jmp LB_43891
LB_43890:
	bts r12,3
LB_43891:
	mov r10,rcx
	bt r12,6
	jc LB_43892
	btr r12,4
	jmp LB_43893
LB_43892:
	bts r12,4
LB_43893:
	call NS_E_43839
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_43894
	btr r12,2
	jmp LB_43895
LB_43894:
	bts r12,2
LB_43895:
	mov r14,r13
	bt r12,0
	jc LB_43896
	btr r12,1
	jmp LB_43897
LB_43896:
	bts r12,1
LB_43897:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_43882
	btr r12,4
	jmp LB_43883
LB_43882:
	bts r12,4
LB_43883:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_43880
	btr r12,0
	jmp LB_43881
LB_43880:
	bts r12,0
LB_43881:
	add rsp,24
; ∎ { %_43832 %_43833 }
 ; {>  %_43825~4':_r64 %_43832~1':_stg %_43833~2':_stg %_43827~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_43898
	mov rdi,r10
	call dlt
LB_43898:
	bt r12,0
	jc LB_43899
	mov rdi,r13
	call dlt
LB_43899:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_43900
	btr r12,0
	jmp LB_43901
LB_43900:
	bts r12,0
LB_43901:
	mov r14,r8
	bt r12,2
	jc LB_43902
	btr r12,1
	jmp LB_43903
LB_43902:
	bts r12,1
LB_43903:
	ret
MTC_LB_43856:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43904
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_43905
	bt QWORD [rdi],0
	jc LB_43906
	btr r12,7
	jmp LB_43907
LB_43906:
	bts r12,7
LB_43907:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43905:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_43908
	btr r12,4
	jmp LB_43909
LB_43908:
	bts r12,4
LB_43909:
LB_43910:
	cmp r15,0
	jz LB_43911
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43910
LB_43911:
; _f39 { %_43818 %_43834 } ⊢ { %_43835 %_43836 } : { %_43835 %_43836 }
 ; {>  %_43819~2':_stg %_43834~4':_r64 %_43820~3':_r64 %_43817~0':_stg %_43823~6':(_lst)◂(_p43186) %_43818~1':_r64 }
	add r14,r10
; _f43839 { %_43817 %_43835 %_43819 %_43820 %_43823 } ⊢ { %_43837 %_43838 } : { %_43837 %_43838 }
 ; {>  %_43836~4':_r64 %_43819~2':_stg %_43820~3':_r64 %_43817~0':_stg %_43823~6':(_lst)◂(_p43186) %_43835~1':_r64 }
; _f43839 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_43914
	btr r12,4
	jmp LB_43915
LB_43914:
	bts r12,4
LB_43915:
	call NS_E_43839
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_43912
	btr r12,4
	jmp LB_43913
LB_43912:
	bts r12,4
LB_43913:
	add rsp,16
; ∎ { %_43837 %_43838 }
 ; {>  %_43836~4':_r64 %_43837~0':_stg %_43838~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_43916
	mov rdi,r10
	call dlt
LB_43916:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_43904:
MTC_LB_43841:
	mov r15,0
LB_43918:
	cmp r15,0
	jz LB_43919
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43918
LB_43919:
; ∎ { %_43817 %_43819 }
 ; {>  %_43821~4':(_lst)◂(_p43186) %_43819~2':_stg %_43820~3':_r64 %_43817~0':_stg %_43818~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_43920
	mov rdi,r10
	call dlt
LB_43920:
	bt r12,3
	jc LB_43921
	mov rdi,r9
	call dlt
LB_43921:
	bt r12,1
	jc LB_43922
	mov rdi,r14
	call dlt
LB_43922:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_43923
	btr r12,1
	jmp LB_43924
LB_43923:
	bts r12,1
LB_43924:
	ret
MTC_LB_43917:
NS_E_43940:
; 	|» 0'
NS_E_RDI_43940:
; » 0xr0 |~ {  } ⊢ %_43926 : %_43926
 ; {>  %_43925~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_43926
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f43191 { %_43925 %_43926 } ⊢ { %_43927 %_43928 %_43929 } : { %_43927 %_43928 %_43929 }
 ; {>  %_43925~0':_stg %_43926~1':_r64 }
; _f43191 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_43191
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_43941
	btr r12,4
	jmp LB_43942
LB_43941:
	bts r12,4
LB_43942:
	mov r8,r9
	bt r12,3
	jc LB_43945
	btr r12,2
	jmp LB_43946
LB_43945:
	bts r12,2
LB_43946:
	mov rsi,1
	bt r12,2
	jc LB_43943
	mov rsi,0
	bt r8,0
	jc LB_43943
	jmp LB_43944
LB_43943:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_43944:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_43947:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43948
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_43949
	bt QWORD [rdi],0
	jc LB_43950
	btr r12,5
	jmp LB_43951
LB_43950:
	bts r12,5
LB_43951:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_43949:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_43954
	btr r12,6
	jmp LB_43955
LB_43954:
	bts r12,6
LB_43955:
	mov r9,rcx
	bt r12,6
	jc LB_43952
	btr r12,3
	jmp LB_43953
LB_43952:
	bts r12,3
LB_43953:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_43958
	btr r12,6
	jmp LB_43959
LB_43958:
	bts r12,6
LB_43959:
	mov r10,rcx
	bt r12,6
	jc LB_43956
	btr r12,4
	jmp LB_43957
LB_43956:
	bts r12,4
LB_43957:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43960:
	cmp r15,0
	jz LB_43961
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43960
LB_43961:
; _f19 %_43930 ⊢ { %_43932 %_43933 } : { %_43932 %_43933 }
 ; {>  %_43928~1':_r64 %_43931~4':(_lst)◂(_p43186) %_43930~3':_r64 %_43927~0':_stg }
; _f19 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_43968
	btr r12,0
	jmp LB_43969
LB_43968:
	bts r12,0
LB_43969:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_43970
	btr r12,2
	jmp LB_43971
LB_43970:
	bts r12,2
LB_43971:
	mov r9,r14
	bt r12,1
	jc LB_43972
	btr r12,3
	jmp LB_43973
LB_43972:
	bts r12,3
LB_43973:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_43966
	btr r12,4
	jmp LB_43967
LB_43966:
	bts r12,4
LB_43967:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_43964
	btr r12,1
	jmp LB_43965
LB_43964:
	bts r12,1
LB_43965:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_43962
	btr r12,0
	jmp LB_43963
LB_43962:
	bts r12,0
LB_43963:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_43934 : %_43934
 ; {>  %_43932~2':_r64 %_43933~3':_stg %_43928~1':_r64 %_43931~4':(_lst)◂(_p43186) %_43927~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_43934
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_43935 : %_43935
 ; {>  %_43934~5':_r64 %_43932~2':_r64 %_43933~3':_stg %_43928~1':_r64 %_43931~4':(_lst)◂(_p43186) %_43927~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_43935
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f43839 { %_43927 %_43934 %_43933 %_43935 %_43931 } ⊢ { %_43936 %_43937 } : { %_43936 %_43937 }
 ; {>  %_43934~5':_r64 %_43932~2':_r64 %_43933~3':_stg %_43928~1':_r64 %_43931~4':(_lst)◂(_p43186) %_43935~6':_r64 %_43927~0':_stg }
; _f43839 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_43978
	btr r12,1
	jmp LB_43979
LB_43978:
	bts r12,1
LB_43979:
	mov r8,r9
	bt r12,3
	jc LB_43980
	btr r12,2
	jmp LB_43981
LB_43980:
	bts r12,2
LB_43981:
	mov r9,rcx
	bt r12,6
	jc LB_43982
	btr r12,3
	jmp LB_43983
LB_43982:
	bts r12,3
LB_43983:
	call NS_E_43839
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_43984
	btr r12,3
	jmp LB_43985
LB_43984:
	bts r12,3
LB_43985:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_43976
	btr r12,2
	jmp LB_43977
LB_43976:
	bts r12,2
LB_43977:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_43974
	btr r12,1
	jmp LB_43975
LB_43974:
	bts r12,1
LB_43975:
	add rsp,24
; _some %_43937 ⊢ %_43938 : %_43938
 ; {>  %_43932~2':_r64 %_43928~1':_r64 %_43937~3':_stg %_43936~0':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_43936 %_43938 }
 ; {>  %_43932~2':_r64 %_43928~1':_r64 %_43936~0':_stg %_43938~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_43986
	mov rdi,r8
	call dlt
LB_43986:
	bt r12,1
	jc LB_43987
	mov rdi,r14
	call dlt
LB_43987:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43990
	btr r12,1
	jmp LB_43991
LB_43990:
	bts r12,1
LB_43991:
	mov rsi,1
	bt r12,1
	jc LB_43988
	mov rsi,0
	bt r14,0
	jc LB_43988
	jmp LB_43989
LB_43988:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43989:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_43948:
	mov r15,0
LB_43993:
	cmp r15,0
	jz LB_43994
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43993
LB_43994:
; _none {  } ⊢ %_43939 : %_43939
 ; {>  %_43928~1':_r64 %_43927~0':_stg %_43929~2':(_opn)◂({ _r64 (_lst)◂(_p43186) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_43927 %_43939 }
 ; {>  %_43939~°1◂{  }:(_opn)◂(t17006'(0)) %_43928~1':_r64 %_43927~0':_stg %_43929~2':(_opn)◂({ _r64 (_lst)◂(_p43186) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_43995
	mov rdi,r14
	call dlt
LB_43995:
	bt r12,2
	jc LB_43996
	mov rdi,r8
	call dlt
LB_43996:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_43997
	mov rsi,0
	bt r14,0
	jc LB_43997
	jmp LB_43998
LB_43997:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_43998:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_43992:
NS_E_44002:
NS_E_RDI_44002:
; » _^ ..
	xor rax,rax
	add rax,10
	add rax,7
	add rax,4
	add rax,6
	add rax,4
	add rax,6
	add rax,4
	add rax,3
	add rax,7
	add rax,19
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; "## FEFEF \n"
	mov rsi,0x_46_45_46_45_46_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "HELLO \n"
	mov rsi,0x_48
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "fdEF \n"
	mov rsi,0x_66
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_64
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_46
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "F fe \n"
	mov rsi,0x_46
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_65
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\] \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "\\]\n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "WORlD \n"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_6c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_67_75_75_68_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_09_09_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; _f43940 %_43999 ⊢ { %_44000 %_44001 } : { %_44000 %_44001 }
 ; {>  %_43999~0':_stg }
; _f43940 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_43940
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_44001~1':(_opn)◂(_stg) %_44000~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_44003
	mov rdi,r14
	call dlt
LB_44003:
	bt r12,0
	jc LB_44004
	mov rdi,r13
	call dlt
LB_44004:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_44005:
NS_E_RDI_44005:
NS_E_44005_ETR_TBL:
NS_E_44005_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_44034
LB_44033:
	add r14,1
LB_44034:
	cmp r14,r10
	jge LB_44035
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44033
	cmp al,10
	jz LB_44033
	cmp al,32
	jz LB_44033
LB_44035:
	push r10
	call NS_E_41071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44036
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44026
LB_44036:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_44039
LB_44038:
	add r14,1
LB_44039:
	cmp r14,r10
	jge LB_44040
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44038
	cmp al,10
	jz LB_44038
	cmp al,32
	jz LB_44038
LB_44040:
	add r14,1
	cmp r14,r10
	jg LB_44044
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_44044
	jmp LB_44045
LB_44044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44042
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44042:
	jmp LB_44026
LB_44045:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_44047
LB_44046:
	add r14,1
LB_44047:
	cmp r14,r10
	jge LB_44048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44046
	cmp al,10
	jz LB_44046
	cmp al,32
	jz LB_44046
LB_44048:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44049
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44050
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44050:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44051
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44051:
	jmp LB_44026
LB_44049:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44031
	btr r12,2
	jmp LB_44032
LB_44031:
	bts r12,2
LB_44032:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44029
	btr r12,1
	jmp LB_44030
LB_44029:
	bts r12,1
LB_44030:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44027
	btr r12,0
	jmp LB_44028
LB_44027:
	bts r12,0
LB_44028:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44023
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_44053
	btr r12,3
	jmp LB_44054
LB_44053:
	bts r12,3
LB_44054:
	mov r14,r8
	bt r12,2
	jc LB_44055
	btr r12,1
	jmp LB_44056
LB_44055:
	bts r12,1
LB_44056:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f41118 { %_44006 %_44007 } ⊢ %_44008 : %_44008
 ; {>  %_44007~1':_p41117 %_44006~0':_stg }
; _f41118 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_44008 ⊢ %_44009 : %_44009
 ; {>  %_44008~°0◂{ 0' 1' }:_p41117 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_44009
 ; {>  %_44009~°0◂°0◂{ 0' 1' }:(_opn)◂(_p41117) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44017
	btr r12,2
	jmp LB_44018
LB_44017:
	bts r12,2
LB_44018:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44015
	btr QWORD [rdi],0
	jmp LB_44016
LB_44015:
	bts QWORD [rdi],0
LB_44016:
	mov r8,r14
	bt r12,1
	jc LB_44021
	btr r12,2
	jmp LB_44022
LB_44021:
	bts r12,2
LB_44022:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44019
	btr QWORD [rdi],1
	jmp LB_44020
LB_44019:
	bts QWORD [rdi],1
LB_44020:
	mov rsi,1
	bt r12,3
	jc LB_44013
	mov rsi,0
	bt r9,0
	jc LB_44013
	jmp LB_44014
LB_44013:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44014:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44023:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44025
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44024
LB_44025:
	add rsp,8
	ret
LB_44026:
	add rsp,48
	pop r14
LB_44024:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_44068
LB_44067:
	add r14,1
LB_44068:
	cmp r14,r10
	jge LB_44069
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44067
	cmp al,32
	jz LB_44067
LB_44069:
	push r10
	call NS_E_41071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44070
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44064
LB_44070:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44065
	btr r12,0
	jmp LB_44066
LB_44065:
	bts r12,0
LB_44066:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44061
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41119 %_44010 ⊢ %_44011 : %_44011
 ; {>  %_44010~0':_stg }
; _f41119 0' ⊢ °1◂0'
; _some %_44011 ⊢ %_44012 : %_44012
 ; {>  %_44011~°1◂0':_p41117 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44012
 ; {>  %_44012~°0◂°1◂0':(_opn)◂(_p41117) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44059
	btr r12,3
	jmp LB_44060
LB_44059:
	bts r12,3
LB_44060:
	mov rsi,1
	bt r12,3
	jc LB_44057
	mov rsi,0
	bt r9,0
	jc LB_44057
	jmp LB_44058
LB_44057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44058:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44061:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44063
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44062
LB_44063:
	add rsp,8
	ret
LB_44064:
	add rsp,16
	pop r14
LB_44062:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44072:
NS_E_RDI_44072:
NS_E_44072_ETR_TBL:
NS_E_44072_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_40453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44097
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44089
LB_44097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_44105
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_44105
	jmp LB_44106
LB_44105:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44103
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44103:
	jmp LB_44089
LB_44106:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44092
	btr r12,1
	jmp LB_44093
LB_44092:
	bts r12,1
LB_44093:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44090
	btr r12,0
	jmp LB_44091
LB_44090:
	bts r12,0
LB_44091:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44086
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f41238 %_44073 ⊢ %_44074 : %_44074
 ; {>  %_44073~0':_r64 }
; _f41238 0' ⊢ °0◂0'
; _some %_44074 ⊢ %_44075 : %_44075
 ; {>  %_44074~°0◂0':_p41183 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_44075
 ; {>  %_44075~°0◂°0◂0':(_opn)◂(_p41183) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44084
	btr r12,3
	jmp LB_44085
LB_44084:
	bts r12,3
LB_44085:
	mov rsi,1
	bt r12,3
	jc LB_44082
	mov rsi,0
	bt r9,0
	jc LB_44082
	jmp LB_44083
LB_44082:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44083:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44086:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44088
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44087
LB_44088:
	add rsp,8
	ret
LB_44089:
	add rsp,32
	pop r14
LB_44087:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_40574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44120
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44114
LB_44120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44115
	btr r12,0
	jmp LB_44116
LB_44115:
	bts r12,0
LB_44116:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44111
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41239 %_44076 ⊢ %_44077 : %_44077
 ; {>  %_44076~0':_stg }
; _f41239 0' ⊢ °1◂0'
; _some %_44077 ⊢ %_44078 : %_44078
 ; {>  %_44077~°1◂0':_p41183 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44078
 ; {>  %_44078~°0◂°1◂0':(_opn)◂(_p41183) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44109
	btr r12,3
	jmp LB_44110
LB_44109:
	bts r12,3
LB_44110:
	mov rsi,1
	bt r12,3
	jc LB_44107
	mov rsi,0
	bt r9,0
	jc LB_44107
	jmp LB_44108
LB_44107:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44108:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44111:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44113
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44112
LB_44113:
	add rsp,8
	ret
LB_44114:
	add rsp,16
	pop r14
LB_44112:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44135
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44129
LB_44135:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44130
	btr r12,0
	jmp LB_44131
LB_44130:
	bts r12,0
LB_44131:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44126
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41240 %_44079 ⊢ %_44080 : %_44080
 ; {>  %_44079~0':_p41117 }
; _f41240 0' ⊢ °2◂0'
; _some %_44080 ⊢ %_44081 : %_44081
 ; {>  %_44080~°2◂0':_p41183 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_44081
 ; {>  %_44081~°0◂°2◂0':(_opn)◂(_p41183) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44124
	btr r12,3
	jmp LB_44125
LB_44124:
	bts r12,3
LB_44125:
	mov rsi,1
	bt r12,3
	jc LB_44122
	mov rsi,0
	bt r9,0
	jc LB_44122
	jmp LB_44123
LB_44122:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44123:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44126:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44128
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44127
LB_44128:
	add rsp,8
	ret
LB_44129:
	add rsp,16
	pop r14
LB_44127:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44138:
NS_E_RDI_44138:
NS_E_44138_ETR_TBL:
NS_E_44138_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_44145
LB_44144:
	add r14,1
LB_44145:
	cmp r14,r10
	jge LB_44146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44144
	cmp al,32
	jz LB_44144
LB_44146:
	add r14,1
	cmp r14,r10
	jg LB_44149
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_44149
	jmp LB_44150
LB_44149:
	jmp LB_44140
LB_44150:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov rsi,0x01_00_0000_0000_0001
	or rdi,rsi
LB_44155:
	jmp LB_44152
LB_44151:
	add r14,1
LB_44152:
	cmp r14,r10
	jge LB_44153
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44151
	cmp al,32
	jz LB_44151
LB_44153:
	add r14,1
	cmp r14,r10
	jg LB_44154
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_44154
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_44155
LB_44154:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44141
	btr QWORD [rdi],1
LB_44141:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44142
	btr QWORD [rdi],0
LB_44142:
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
LB_44140:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44165:
; 	|» { 0' 1' }
NS_E_RDI_44165:
MTC_LB_44166:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_44167
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_44168
	bt QWORD [rdi],0
	jc LB_44169
	btr r12,4
	jmp LB_44170
LB_44169:
	bts r12,4
LB_44170:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_44168:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_44173
	btr r12,5
	jmp LB_44174
LB_44173:
	bts r12,5
LB_44174:
	mov r8,r11
	bt r12,5
	jc LB_44171
	btr r12,2
	jmp LB_44172
LB_44171:
	bts r12,2
LB_44172:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_44177
	btr r12,5
	jmp LB_44178
LB_44177:
	bts r12,5
LB_44178:
	mov r9,r11
	bt r12,5
	jc LB_44175
	btr r12,3
	jmp LB_44176
LB_44175:
	bts r12,3
LB_44176:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_44179:
	cmp r15,0
	jz LB_44180
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44179
LB_44180:
; _f41235 { %_44159 %_44161 } ⊢ %_44163 : %_44163
 ; {>  %_44159~0':_p41182 %_44162~3':(_lst)◂(_p41182) %_44161~2':_p41182 }
; _f41235 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f44165 { %_44163 %_44162 } ⊢ %_44164 : %_44164
 ; {>  %_44162~3':(_lst)◂(_p41182) %_44163~°2◂{ 0' 2' }:_p41182 }
; _f44165 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_44181
	btr r12,1
	jmp LB_44182
LB_44181:
	bts r12,1
LB_44182:
	mov r9,r13
	bt r12,0
	jc LB_44183
	btr r12,3
	jmp LB_44184
LB_44183:
	bts r12,3
LB_44184:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_44189
	btr r12,4
	jmp LB_44190
LB_44189:
	bts r12,4
LB_44190:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_44187
	btr QWORD [rdi],0
	jmp LB_44188
LB_44187:
	bts QWORD [rdi],0
LB_44188:
	mov r10,r8
	bt r12,2
	jc LB_44193
	btr r12,4
	jmp LB_44194
LB_44193:
	bts r12,4
LB_44194:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_44191
	btr QWORD [rdi],1
	jmp LB_44192
LB_44191:
	bts QWORD [rdi],1
LB_44192:
	mov rsi,1
	bt r12,0
	jc LB_44185
	mov rsi,0
	bt r13,0
	jc LB_44185
	jmp LB_44186
LB_44185:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_44186:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_44165
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_44164
 ; {>  %_44164~0':_p41182 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_44167:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_44195
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_44196
	bt QWORD [rdi],0
	jc LB_44197
	btr r12,2
	jmp LB_44198
LB_44197:
	bts r12,2
LB_44198:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_44196:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_44199:
	cmp r15,0
	jz LB_44200
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44199
LB_44200:
; ∎ %_44159
 ; {>  %_44159~0':_p41182 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_44195:
NS_E_44201:
NS_E_RDI_44201:
NS_E_44201_ETR_TBL:
NS_E_44201_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_44248
LB_44247:
	add r14,1
LB_44248:
	cmp r14,r10
	jge LB_44249
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44247
	cmp al,10
	jz LB_44247
	cmp al,32
	jz LB_44247
LB_44249:
	add r14,1
	cmp r14,r10
	jg LB_44252
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_44252
	jmp LB_44253
LB_44252:
	jmp LB_44240
LB_44253:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_44255
LB_44254:
	add r14,1
LB_44255:
	cmp r14,r10
	jge LB_44256
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44254
	cmp al,10
	jz LB_44254
	cmp al,32
	jz LB_44254
LB_44256:
	push r10
	call NS_E_44202_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44257
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44258
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44258:
	jmp LB_44240
LB_44257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_44261
LB_44260:
	add r14,1
LB_44261:
	cmp r14,r10
	jge LB_44262
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44260
	cmp al,10
	jz LB_44260
	cmp al,32
	jz LB_44260
LB_44262:
	add r14,1
	cmp r14,r10
	jg LB_44267
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_44267
	jmp LB_44268
LB_44267:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44264
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44264:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44265
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44265:
	jmp LB_44240
LB_44268:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44245
	btr r12,2
	jmp LB_44246
LB_44245:
	bts r12,2
LB_44246:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44243
	btr r12,1
	jmp LB_44244
LB_44243:
	bts r12,1
LB_44244:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44241
	btr r12,0
	jmp LB_44242
LB_44241:
	bts r12,0
LB_44242:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44237
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_44269
	btr r12,3
	jmp LB_44270
LB_44269:
	bts r12,3
LB_44270:
	mov r13,r14
	bt r12,1
	jc LB_44271
	btr r12,0
	jmp LB_44272
LB_44271:
	bts r12,0
LB_44272:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41229 %_44205 ⊢ %_44206 : %_44206
 ; {>  %_44205~0':(_lst)◂(_p41180) }
; _f41229 0' ⊢ °0◂0'
; _some %_44206 ⊢ %_44207 : %_44207
 ; {>  %_44206~°0◂0':_p41180 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_44207
 ; {>  %_44207~°0◂°0◂0':(_opn)◂(_p41180) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44235
	btr r12,3
	jmp LB_44236
LB_44235:
	bts r12,3
LB_44236:
	mov rsi,1
	bt r12,3
	jc LB_44233
	mov rsi,0
	bt r9,0
	jc LB_44233
	jmp LB_44234
LB_44233:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44234:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44237:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44239
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44238
LB_44239:
	add rsp,8
	ret
LB_44240:
	add rsp,48
	pop r14
LB_44238:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_44284
LB_44283:
	add r14,1
LB_44284:
	cmp r14,r10
	jge LB_44285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44283
	cmp al,10
	jz LB_44283
	cmp al,32
	jz LB_44283
LB_44285:
	push r10
	call NS_E_44204_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44280
LB_44286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44281
	btr r12,0
	jmp LB_44282
LB_44281:
	bts r12,0
LB_44282:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44277
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41230 %_44208 ⊢ %_44209 : %_44209
 ; {>  %_44208~0':_p41178 }
; _f41230 0' ⊢ °1◂0'
; _some %_44209 ⊢ %_44210 : %_44210
 ; {>  %_44209~°1◂0':_p41180 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44210
 ; {>  %_44210~°0◂°1◂0':(_opn)◂(_p41180) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44275
	btr r12,3
	jmp LB_44276
LB_44275:
	bts r12,3
LB_44276:
	mov rsi,1
	bt r12,3
	jc LB_44273
	mov rsi,0
	bt r9,0
	jc LB_44273
	jmp LB_44274
LB_44273:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44274:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44277:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44279
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44278
LB_44279:
	add rsp,8
	ret
LB_44280:
	add rsp,16
	pop r14
LB_44278:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44202:
NS_E_RDI_44202:
NS_E_44202_ETR_TBL:
NS_E_44202_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_44307
LB_44306:
	add r14,1
LB_44307:
	cmp r14,r10
	jge LB_44308
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44306
	cmp al,10
	jz LB_44306
	cmp al,32
	jz LB_44306
LB_44308:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44309
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44301
LB_44309:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_44312
LB_44311:
	add r14,1
LB_44312:
	cmp r14,r10
	jge LB_44313
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44311
	cmp al,10
	jz LB_44311
	cmp al,32
	jz LB_44311
LB_44313:
	push r10
	call NS_E_44202_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44314
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44315
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44315:
	jmp LB_44301
LB_44314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44304
	btr r12,1
	jmp LB_44305
LB_44304:
	bts r12,1
LB_44305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44302
	btr r12,0
	jmp LB_44303
LB_44302:
	bts r12,0
LB_44303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44298
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_44211 %_44212 } ⊢ %_44213 : %_44213
 ; {>  %_44212~1':(_lst)◂(_p41180) %_44211~0':_p41180 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_44213 ⊢ %_44214 : %_44214
 ; {>  %_44213~°0◂{ 0' 1' }:(_lst)◂(_p41180) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_44214
 ; {>  %_44214~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41180)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44292
	btr r12,2
	jmp LB_44293
LB_44292:
	bts r12,2
LB_44293:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44290
	btr QWORD [rdi],0
	jmp LB_44291
LB_44290:
	bts QWORD [rdi],0
LB_44291:
	mov r8,r14
	bt r12,1
	jc LB_44296
	btr r12,2
	jmp LB_44297
LB_44296:
	bts r12,2
LB_44297:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44294
	btr QWORD [rdi],1
	jmp LB_44295
LB_44294:
	bts QWORD [rdi],1
LB_44295:
	mov rsi,1
	bt r12,3
	jc LB_44288
	mov rsi,0
	bt r9,0
	jc LB_44288
	jmp LB_44289
LB_44288:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44289:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44300
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44299
LB_44300:
	add rsp,8
	ret
LB_44301:
	add rsp,32
	pop r14
LB_44299:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44319
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_44215 : %_44215
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_44215 ⊢ %_44216 : %_44216
 ; {>  %_44215~°1◂{  }:(_lst)◂(t17112'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_44216
 ; {>  %_44216~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17115'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44317
	mov rsi,0
	bt r9,0
	jc LB_44317
	jmp LB_44318
LB_44317:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44318:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44319:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44321
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44320
LB_44321:
	add rsp,8
	ret
LB_44322:
	add rsp,0
	pop r14
LB_44320:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44203:
NS_E_RDI_44203:
NS_E_44203_ETR_TBL:
NS_E_44203_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_44360
LB_44359:
	add r14,1
LB_44360:
	cmp r14,r10
	jge LB_44361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44359
	cmp al,10
	jz LB_44359
	cmp al,32
	jz LB_44359
LB_44361:
	add r14,1
	cmp r14,r10
	jg LB_44364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_44364
	jmp LB_44365
LB_44364:
	jmp LB_44338
LB_44365:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_44347
LB_44346:
	add r14,1
LB_44347:
	cmp r14,r10
	jge LB_44348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44346
	cmp al,10
	jz LB_44346
	cmp al,32
	jz LB_44346
LB_44348:
	push r10
	call NS_E_44204_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44349
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44350
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44350:
	jmp LB_44339
LB_44349:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_44353
LB_44352:
	add r14,1
LB_44353:
	cmp r14,r10
	jge LB_44354
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44352
	cmp al,10
	jz LB_44352
	cmp al,32
	jz LB_44352
LB_44354:
	push r10
	call NS_E_44203_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44355
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44356
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44356:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44357
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44357:
	jmp LB_44339
LB_44355:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44344
	btr r12,2
	jmp LB_44345
LB_44344:
	bts r12,2
LB_44345:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44342
	btr r12,1
	jmp LB_44343
LB_44342:
	bts r12,1
LB_44343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44340
	btr r12,0
	jmp LB_44341
LB_44340:
	bts r12,0
LB_44341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44335
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_44366
	btr r12,3
	jmp LB_44367
LB_44366:
	bts r12,3
LB_44367:
	mov r14,r8
	bt r12,2
	jc LB_44368
	btr r12,1
	jmp LB_44369
LB_44368:
	bts r12,1
LB_44369:
	mov r8,r13
	bt r12,0
	jc LB_44370
	btr r12,2
	jmp LB_44371
LB_44370:
	bts r12,2
LB_44371:
	mov r13,r9
	bt r12,3
	jc LB_44372
	btr r12,0
	jmp LB_44373
LB_44372:
	bts r12,0
LB_44373:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41230 %_44217 ⊢ %_44219 : %_44219
 ; {>  %_44218~1':(_lst)◂(_p41180) %_44217~0':_p41178 }
; _f41230 0' ⊢ °1◂0'
; _cns { %_44219 %_44218 } ⊢ %_44220 : %_44220
 ; {>  %_44218~1':(_lst)◂(_p41180) %_44219~°1◂0':_p41180 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_44220 ⊢ %_44221 : %_44221
 ; {>  %_44220~°0◂{ °1◂0' 1' }:(_lst)◂(_p41180) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_44221
 ; {>  %_44221~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p41180)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44329
	btr r12,2
	jmp LB_44330
LB_44329:
	bts r12,2
LB_44330:
	mov rsi,1
	bt r12,2
	jc LB_44327
	mov rsi,0
	bt r8,0
	jc LB_44327
	jmp LB_44328
LB_44327:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_44328:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44325
	btr QWORD [rdi],0
	jmp LB_44326
LB_44325:
	bts QWORD [rdi],0
LB_44326:
	mov r8,r14
	bt r12,1
	jc LB_44333
	btr r12,2
	jmp LB_44334
LB_44333:
	bts r12,2
LB_44334:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44331
	btr QWORD [rdi],1
	jmp LB_44332
LB_44331:
	bts QWORD [rdi],1
LB_44332:
	mov rsi,1
	bt r12,3
	jc LB_44323
	mov rsi,0
	bt r9,0
	jc LB_44323
	jmp LB_44324
LB_44323:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44324:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44335:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44337
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44336
LB_44337:
	add rsp,8
	ret
LB_44339:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_44338:
	add rsp,48
	pop r14
LB_44336:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44376
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_44222 : %_44222
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_44222 ⊢ %_44223 : %_44223
 ; {>  %_44222~°1◂{  }:(_lst)◂(t17126'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_44223
 ; {>  %_44223~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17129'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44374
	mov rsi,0
	bt r9,0
	jc LB_44374
	jmp LB_44375
LB_44374:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44375:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44376:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44378
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44377
LB_44378:
	add rsp,8
	ret
LB_44379:
	add rsp,0
	pop r14
LB_44377:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44204:
NS_E_RDI_44204:
NS_E_44204_ETR_TBL:
NS_E_44204_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_44395
LB_44394:
	add r14,1
LB_44395:
	cmp r14,r10
	jge LB_44396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44394
	cmp al,10
	jz LB_44394
	cmp al,32
	jz LB_44394
LB_44396:
	add r14,2
	cmp r14,r10
	jg LB_44399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_44399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_44399
	jmp LB_44400
LB_44399:
	jmp LB_44387
LB_44400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_44402
LB_44401:
	add r14,1
LB_44402:
	cmp r14,r10
	jge LB_44403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44401
	cmp al,10
	jz LB_44401
	cmp al,32
	jz LB_44401
LB_44403:
	push r10
	call NS_E_44072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44404
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44405:
	jmp LB_44387
LB_44404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_44408
LB_44407:
	add r14,1
LB_44408:
	cmp r14,r10
	jge LB_44409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44407
	cmp al,10
	jz LB_44407
	cmp al,32
	jz LB_44407
LB_44409:
	add r14,1
	cmp r14,r10
	jg LB_44414
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_44414
	jmp LB_44415
LB_44414:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44411
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44411:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44412
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44412:
	jmp LB_44387
LB_44415:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44392
	btr r12,2
	jmp LB_44393
LB_44392:
	bts r12,2
LB_44393:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44390
	btr r12,1
	jmp LB_44391
LB_44390:
	bts r12,1
LB_44391:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44388
	btr r12,0
	jmp LB_44389
LB_44388:
	bts r12,0
LB_44389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44384
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_44416
	btr r12,3
	jmp LB_44417
LB_44416:
	bts r12,3
LB_44417:
	mov r13,r14
	bt r12,1
	jc LB_44418
	btr r12,0
	jmp LB_44419
LB_44418:
	bts r12,0
LB_44419:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41225 %_44224 ⊢ %_44225 : %_44225
 ; {>  %_44224~0':_p41183 }
; _f41225 0' ⊢ °0◂0'
; _some %_44225 ⊢ %_44226 : %_44226
 ; {>  %_44225~°0◂0':_p41178 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_44226
 ; {>  %_44226~°0◂°0◂0':(_opn)◂(_p41178) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44382
	btr r12,3
	jmp LB_44383
LB_44382:
	bts r12,3
LB_44383:
	mov rsi,1
	bt r12,3
	jc LB_44380
	mov rsi,0
	bt r9,0
	jc LB_44380
	jmp LB_44381
LB_44380:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44381:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44386
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44385
LB_44386:
	add rsp,8
	ret
LB_44387:
	add rsp,48
	pop r14
LB_44385:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_44444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_44444
	jmp LB_44445
LB_44444:
	jmp LB_44427
LB_44445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_41071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44436
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44437
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44437:
	jmp LB_44428
LB_44436:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44431
	btr r12,1
	jmp LB_44432
LB_44431:
	bts r12,1
LB_44432:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44429
	btr r12,0
	jmp LB_44430
LB_44429:
	bts r12,0
LB_44430:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44424
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_44446
	btr r12,2
	jmp LB_44447
LB_44446:
	bts r12,2
LB_44447:
	mov r13,r14
	bt r12,1
	jc LB_44448
	btr r12,0
	jmp LB_44449
LB_44448:
	bts r12,0
LB_44449:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41226 %_44227 ⊢ %_44228 : %_44228
 ; {>  %_44227~0':_stg }
; _f41226 0' ⊢ °1◂0'
; _some %_44228 ⊢ %_44229 : %_44229
 ; {>  %_44228~°1◂0':_p41178 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44229
 ; {>  %_44229~°0◂°1◂0':(_opn)◂(_p41178) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44422
	btr r12,3
	jmp LB_44423
LB_44422:
	bts r12,3
LB_44423:
	mov rsi,1
	bt r12,3
	jc LB_44420
	mov rsi,0
	bt r9,0
	jc LB_44420
	jmp LB_44421
LB_44420:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44421:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44425
LB_44426:
	add rsp,8
	ret
LB_44428:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_44427:
	add rsp,32
	pop r14
LB_44425:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_44461
LB_44460:
	add r14,1
LB_44461:
	cmp r14,r10
	jge LB_44462
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44460
	cmp al,10
	jz LB_44460
	cmp al,32
	jz LB_44460
LB_44462:
	push r10
	call NS_E_41071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44463
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44457
LB_44463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44458
	btr r12,0
	jmp LB_44459
LB_44458:
	bts r12,0
LB_44459:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44454
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41226 %_44230 ⊢ %_44231 : %_44231
 ; {>  %_44230~0':_stg }
; _f41226 0' ⊢ °1◂0'
; _some %_44231 ⊢ %_44232 : %_44232
 ; {>  %_44231~°1◂0':_p41178 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44232
 ; {>  %_44232~°0◂°1◂0':(_opn)◂(_p41178) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44452
	btr r12,3
	jmp LB_44453
LB_44452:
	bts r12,3
LB_44453:
	mov rsi,1
	bt r12,3
	jc LB_44450
	mov rsi,0
	bt r9,0
	jc LB_44450
	jmp LB_44451
LB_44450:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44451:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44454:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44456
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44455
LB_44456:
	add rsp,8
	ret
LB_44457:
	add rsp,16
	pop r14
LB_44455:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44465:
NS_E_RDI_44465:
NS_E_44465_ETR_TBL:
NS_E_44465_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_44515
LB_44514:
	add r14,1
LB_44515:
	cmp r14,r10
	jge LB_44516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44514
	cmp al,10
	jz LB_44514
	cmp al,32
	jz LB_44514
LB_44516:
	add r14,1
	cmp r14,r10
	jg LB_44519
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_44519
	jmp LB_44520
LB_44519:
	jmp LB_44507
LB_44520:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_44522
LB_44521:
	add r14,1
LB_44522:
	cmp r14,r10
	jge LB_44523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44521
	cmp al,10
	jz LB_44521
	cmp al,32
	jz LB_44521
LB_44523:
	push r10
	call NS_E_44466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44524
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44525:
	jmp LB_44507
LB_44524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_44528
LB_44527:
	add r14,1
LB_44528:
	cmp r14,r10
	jge LB_44529
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44527
	cmp al,10
	jz LB_44527
	cmp al,32
	jz LB_44527
LB_44529:
	add r14,1
	cmp r14,r10
	jg LB_44534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_44534
	jmp LB_44535
LB_44534:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44531
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44531:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44532
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44532:
	jmp LB_44507
LB_44535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44512
	btr r12,2
	jmp LB_44513
LB_44512:
	bts r12,2
LB_44513:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44510
	btr r12,1
	jmp LB_44511
LB_44510:
	bts r12,1
LB_44511:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44508
	btr r12,0
	jmp LB_44509
LB_44508:
	bts r12,0
LB_44509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44504
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_44536
	btr r12,3
	jmp LB_44537
LB_44536:
	bts r12,3
LB_44537:
	mov r13,r14
	bt r12,1
	jc LB_44538
	btr r12,0
	jmp LB_44539
LB_44538:
	bts r12,0
LB_44539:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41231 %_44471 ⊢ %_44472 : %_44472
 ; {>  %_44471~0':(_lst)◂(_p41181) }
; _f41231 0' ⊢ °0◂0'
; _some %_44472 ⊢ %_44473 : %_44473
 ; {>  %_44472~°0◂0':_p41181 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_44473
 ; {>  %_44473~°0◂°0◂0':(_opn)◂(_p41181) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44502
	btr r12,3
	jmp LB_44503
LB_44502:
	bts r12,3
LB_44503:
	mov rsi,1
	bt r12,3
	jc LB_44500
	mov rsi,0
	bt r9,0
	jc LB_44500
	jmp LB_44501
LB_44500:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44501:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44506
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44505
LB_44506:
	add rsp,8
	ret
LB_44507:
	add rsp,48
	pop r14
LB_44505:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_44551
LB_44550:
	add r14,1
LB_44551:
	cmp r14,r10
	jge LB_44552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44550
	cmp al,10
	jz LB_44550
	cmp al,32
	jz LB_44550
LB_44552:
	push r10
	call NS_E_44470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44553
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44547
LB_44553:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44548
	btr r12,0
	jmp LB_44549
LB_44548:
	bts r12,0
LB_44549:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44544
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41232 %_44474 ⊢ %_44475 : %_44475
 ; {>  %_44474~0':_p41179 }
; _f41232 0' ⊢ °1◂0'
; _some %_44475 ⊢ %_44476 : %_44476
 ; {>  %_44475~°1◂0':_p41181 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44476
 ; {>  %_44476~°0◂°1◂0':(_opn)◂(_p41181) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44542
	btr r12,3
	jmp LB_44543
LB_44542:
	bts r12,3
LB_44543:
	mov rsi,1
	bt r12,3
	jc LB_44540
	mov rsi,0
	bt r9,0
	jc LB_44540
	jmp LB_44541
LB_44540:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44541:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44544:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44546
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44545
LB_44546:
	add rsp,8
	ret
LB_44547:
	add rsp,16
	pop r14
LB_44545:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44466:
NS_E_RDI_44466:
NS_E_44466_ETR_TBL:
NS_E_44466_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_44574
LB_44573:
	add r14,1
LB_44574:
	cmp r14,r10
	jge LB_44575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44573
	cmp al,10
	jz LB_44573
	cmp al,32
	jz LB_44573
LB_44575:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44576
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44568
LB_44576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_44579
LB_44578:
	add r14,1
LB_44579:
	cmp r14,r10
	jge LB_44580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44578
	cmp al,10
	jz LB_44578
	cmp al,32
	jz LB_44578
LB_44580:
	push r10
	call NS_E_44466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44581
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44582:
	jmp LB_44568
LB_44581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44571
	btr r12,1
	jmp LB_44572
LB_44571:
	bts r12,1
LB_44572:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44569
	btr r12,0
	jmp LB_44570
LB_44569:
	bts r12,0
LB_44570:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44565
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_44477 %_44478 } ⊢ %_44479 : %_44479
 ; {>  %_44477~0':_p41181 %_44478~1':(_lst)◂(_p41181) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_44479 ⊢ %_44480 : %_44480
 ; {>  %_44479~°0◂{ 0' 1' }:(_lst)◂(_p41181) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_44480
 ; {>  %_44480~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41181)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44559
	btr r12,2
	jmp LB_44560
LB_44559:
	bts r12,2
LB_44560:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44557
	btr QWORD [rdi],0
	jmp LB_44558
LB_44557:
	bts QWORD [rdi],0
LB_44558:
	mov r8,r14
	bt r12,1
	jc LB_44563
	btr r12,2
	jmp LB_44564
LB_44563:
	bts r12,2
LB_44564:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44561
	btr QWORD [rdi],1
	jmp LB_44562
LB_44561:
	bts QWORD [rdi],1
LB_44562:
	mov rsi,1
	bt r12,3
	jc LB_44555
	mov rsi,0
	bt r9,0
	jc LB_44555
	jmp LB_44556
LB_44555:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44556:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44565:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44567
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44566
LB_44567:
	add rsp,8
	ret
LB_44568:
	add rsp,32
	pop r14
LB_44566:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44586
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_44481 : %_44481
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_44481 ⊢ %_44482 : %_44482
 ; {>  %_44481~°1◂{  }:(_lst)◂(t17214'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_44482
 ; {>  %_44482~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17217'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44584
	mov rsi,0
	bt r9,0
	jc LB_44584
	jmp LB_44585
LB_44584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44585:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44586:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44588
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44587
LB_44588:
	add rsp,8
	ret
LB_44589:
	add rsp,0
	pop r14
LB_44587:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44468:
NS_E_RDI_44468:
NS_E_44468_ETR_TBL:
NS_E_44468_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_44612
LB_44611:
	add r14,1
LB_44612:
	cmp r14,r10
	jge LB_44613
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44611
	cmp al,10
	jz LB_44611
	cmp al,32
	jz LB_44611
LB_44613:
	add r14,1
	cmp r14,r10
	jg LB_44616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_44616
	jmp LB_44617
LB_44616:
	jmp LB_44590
LB_44617:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_44599
LB_44598:
	add r14,1
LB_44599:
	cmp r14,r10
	jge LB_44600
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44598
	cmp al,10
	jz LB_44598
	cmp al,32
	jz LB_44598
LB_44600:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44601
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44602:
	jmp LB_44591
LB_44601:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_44605
LB_44604:
	add r14,1
LB_44605:
	cmp r14,r10
	jge LB_44606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44604
	cmp al,10
	jz LB_44604
	cmp al,32
	jz LB_44604
LB_44606:
	push r10
	call NS_E_44468_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44607
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44608
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44608:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44609
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44609:
	jmp LB_44591
LB_44607:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44594
	btr QWORD [rdi],2
LB_44594:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44595
	btr QWORD [rdi],1
LB_44595:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44596
	btr QWORD [rdi],0
LB_44596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_44591:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_44590:
	add rsp,48
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_44592:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44469:
NS_E_RDI_44469:
NS_E_44469_ETR_TBL:
NS_E_44469_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_44655
LB_44654:
	add r14,1
LB_44655:
	cmp r14,r10
	jge LB_44656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44654
	cmp al,10
	jz LB_44654
	cmp al,32
	jz LB_44654
LB_44656:
	add r14,1
	cmp r14,r10
	jg LB_44659
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_44659
	jmp LB_44660
LB_44659:
	jmp LB_44633
LB_44660:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_44642
LB_44641:
	add r14,1
LB_44642:
	cmp r14,r10
	jge LB_44643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44641
	cmp al,10
	jz LB_44641
	cmp al,32
	jz LB_44641
LB_44643:
	push r10
	call NS_E_44470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44644
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44645
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44645:
	jmp LB_44634
LB_44644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_44648
LB_44647:
	add r14,1
LB_44648:
	cmp r14,r10
	jge LB_44649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44647
	cmp al,10
	jz LB_44647
	cmp al,32
	jz LB_44647
LB_44649:
	push r10
	call NS_E_44469_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44650
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44651
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44651:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44652:
	jmp LB_44634
LB_44650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44639
	btr r12,2
	jmp LB_44640
LB_44639:
	bts r12,2
LB_44640:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44637
	btr r12,1
	jmp LB_44638
LB_44637:
	bts r12,1
LB_44638:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44635
	btr r12,0
	jmp LB_44636
LB_44635:
	bts r12,0
LB_44636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44630
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_44661
	btr r12,3
	jmp LB_44662
LB_44661:
	bts r12,3
LB_44662:
	mov r14,r8
	bt r12,2
	jc LB_44663
	btr r12,1
	jmp LB_44664
LB_44663:
	bts r12,1
LB_44664:
	mov r8,r13
	bt r12,0
	jc LB_44665
	btr r12,2
	jmp LB_44666
LB_44665:
	bts r12,2
LB_44666:
	mov r13,r9
	bt r12,3
	jc LB_44667
	btr r12,0
	jmp LB_44668
LB_44667:
	bts r12,0
LB_44668:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41232 %_44485 ⊢ %_44487 : %_44487
 ; {>  %_44485~0':_p41179 %_44486~1':(_lst)◂(_p41181) }
; _f41232 0' ⊢ °1◂0'
; _cns { %_44487 %_44486 } ⊢ %_44488 : %_44488
 ; {>  %_44487~°1◂0':_p41181 %_44486~1':(_lst)◂(_p41181) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_44488 ⊢ %_44489 : %_44489
 ; {>  %_44488~°0◂{ °1◂0' 1' }:(_lst)◂(_p41181) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_44489
 ; {>  %_44489~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p41181)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44624
	btr r12,2
	jmp LB_44625
LB_44624:
	bts r12,2
LB_44625:
	mov rsi,1
	bt r12,2
	jc LB_44622
	mov rsi,0
	bt r8,0
	jc LB_44622
	jmp LB_44623
LB_44622:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_44623:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44620
	btr QWORD [rdi],0
	jmp LB_44621
LB_44620:
	bts QWORD [rdi],0
LB_44621:
	mov r8,r14
	bt r12,1
	jc LB_44628
	btr r12,2
	jmp LB_44629
LB_44628:
	bts r12,2
LB_44629:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44626
	btr QWORD [rdi],1
	jmp LB_44627
LB_44626:
	bts QWORD [rdi],1
LB_44627:
	mov rsi,1
	bt r12,3
	jc LB_44618
	mov rsi,0
	bt r9,0
	jc LB_44618
	jmp LB_44619
LB_44618:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44619:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44630:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44632
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44631
LB_44632:
	add rsp,8
	ret
LB_44634:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_44633:
	add rsp,48
	pop r14
LB_44631:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44671
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_44490 : %_44490
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_44490 ⊢ %_44491 : %_44491
 ; {>  %_44490~°1◂{  }:(_lst)◂(t17228'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_44491
 ; {>  %_44491~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17231'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44669
	mov rsi,0
	bt r9,0
	jc LB_44669
	jmp LB_44670
LB_44669:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44670:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44671:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44673
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44672
LB_44673:
	add rsp,8
	ret
LB_44674:
	add rsp,0
	pop r14
LB_44672:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44470:
NS_E_RDI_44470:
NS_E_44470_ETR_TBL:
NS_E_44470_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_44699
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_44699
	jmp LB_44700
LB_44699:
	jmp LB_44682
LB_44700:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44691
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44692
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44692:
	jmp LB_44683
LB_44691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44686
	btr r12,1
	jmp LB_44687
LB_44686:
	bts r12,1
LB_44687:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44684
	btr r12,0
	jmp LB_44685
LB_44684:
	bts r12,0
LB_44685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44679
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_44701
	btr r12,2
	jmp LB_44702
LB_44701:
	bts r12,2
LB_44702:
	mov r13,r14
	bt r12,1
	jc LB_44703
	btr r12,0
	jmp LB_44704
LB_44703:
	bts r12,0
LB_44704:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41228 %_44492 ⊢ %_44493 : %_44493
 ; {>  %_44492~0':_stg }
; _f41228 0' ⊢ °1◂0'
; _some %_44493 ⊢ %_44494 : %_44494
 ; {>  %_44493~°1◂0':_p41179 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44494
 ; {>  %_44494~°0◂°1◂0':(_opn)◂(_p41179) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44677
	btr r12,3
	jmp LB_44678
LB_44677:
	bts r12,3
LB_44678:
	mov rsi,1
	bt r12,3
	jc LB_44675
	mov rsi,0
	bt r9,0
	jc LB_44675
	jmp LB_44676
LB_44675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44676:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44679:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44681
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44680
LB_44681:
	add rsp,8
	ret
LB_44683:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_44682:
	add rsp,32
	pop r14
LB_44680:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44718
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44712
LB_44718:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44713
	btr r12,0
	jmp LB_44714
LB_44713:
	bts r12,0
LB_44714:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44709
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41228 %_44495 ⊢ %_44496 : %_44496
 ; {>  %_44495~0':_stg }
; _f41228 0' ⊢ °1◂0'
; _some %_44496 ⊢ %_44497 : %_44497
 ; {>  %_44496~°1◂0':_p41179 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_44497
 ; {>  %_44497~°0◂°1◂0':(_opn)◂(_p41179) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44707
	btr r12,3
	jmp LB_44708
LB_44707:
	bts r12,3
LB_44708:
	mov rsi,1
	bt r12,3
	jc LB_44705
	mov rsi,0
	bt r9,0
	jc LB_44705
	jmp LB_44706
LB_44705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44706:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44709:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44711
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44710
LB_44711:
	add rsp,8
	ret
LB_44712:
	add rsp,16
	pop r14
LB_44710:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_44733
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_44733
	jmp LB_44734
LB_44733:
	jmp LB_44725
LB_44734:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44726
	btr r12,0
	jmp LB_44727
LB_44726:
	bts r12,0
LB_44727:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44722
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41227 {  } ⊢ %_44498 : %_44498
 ; {>  }
; _f41227 {  } ⊢ °0◂{  }
; _some %_44498 ⊢ %_44499 : %_44499
 ; {>  %_44498~°0◂{  }:_p41179 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_44499
 ; {>  %_44499~°0◂°0◂{  }:(_opn)◂(_p41179) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44720
	mov rsi,0
	bt r9,0
	jc LB_44720
	jmp LB_44721
LB_44720:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44721:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44722:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44724
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44723
LB_44724:
	add rsp,8
	ret
LB_44725:
	add rsp,16
	pop r14
LB_44723:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44735:
NS_E_RDI_44735:
NS_E_44735_ETR_TBL:
NS_E_44735_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_44813
LB_44812:
	add r14,1
LB_44813:
	cmp r14,r10
	jge LB_44814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44812
	cmp al,10
	jz LB_44812
	cmp al,32
	jz LB_44812
LB_44814:
	push r10
	call NS_E_44738_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44805
LB_44815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_44818
LB_44817:
	add r14,1
LB_44818:
	cmp r14,r10
	jge LB_44819
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44817
	cmp al,10
	jz LB_44817
	cmp al,32
	jz LB_44817
LB_44819:
	push r10
	call NS_E_44737_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44820
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44821:
	jmp LB_44805
LB_44820:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_44824
LB_44823:
	add r14,1
LB_44824:
	cmp r14,r10
	jge LB_44825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44823
	cmp al,10
	jz LB_44823
	cmp al,32
	jz LB_44823
LB_44825:
	push r10
	call NS_E_44736_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44826
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44827
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44827:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44828
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44828:
	jmp LB_44805
LB_44826:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44810
	btr r12,2
	jmp LB_44811
LB_44810:
	bts r12,2
LB_44811:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44808
	btr r12,1
	jmp LB_44809
LB_44808:
	bts r12,1
LB_44809:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44806
	btr r12,0
	jmp LB_44807
LB_44806:
	bts r12,0
LB_44807:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44802
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f44165 { %_44740 %_44741 } ⊢ %_44743 : %_44743
 ; {>  %_44741~1':(_lst)◂(_p41182) %_44740~0':_p41182 %_44742~2':(_opn)◂(_p41182) }
; _f44165 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_44165
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_44773
	btr r12,2
	jmp LB_44774
LB_44773:
	bts r12,2
LB_44774:
	add rsp,16
MTC_LB_44775:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_44776
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_44777
	bt QWORD [rdi],0
	jc LB_44778
	btr r12,3
	jmp LB_44779
LB_44778:
	bts r12,3
LB_44779:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_44777:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_44780
	btr r12,1
	jmp LB_44781
LB_44780:
	bts r12,1
LB_44781:
LB_44782:
	cmp r15,0
	jz LB_44783
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44782
LB_44783:
; _f41234 { %_44743 %_44744 } ⊢ %_44745 : %_44745
 ; {>  %_44743~0':_p41182 %_44744~1':_p41182 }
; _f41234 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_44745 ⊢ %_44746 : %_44746
 ; {>  %_44745~°1◂{ 0' 1' }:_p41182 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_44746
 ; {>  %_44746~°0◂°1◂{ 0' 1' }:(_opn)◂(_p41182) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44788
	btr r12,2
	jmp LB_44789
LB_44788:
	bts r12,2
LB_44789:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44786
	btr QWORD [rdi],0
	jmp LB_44787
LB_44786:
	bts QWORD [rdi],0
LB_44787:
	mov r8,r14
	bt r12,1
	jc LB_44792
	btr r12,2
	jmp LB_44793
LB_44792:
	bts r12,2
LB_44793:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44790
	btr QWORD [rdi],1
	jmp LB_44791
LB_44790:
	bts QWORD [rdi],1
LB_44791:
	mov rsi,1
	bt r12,3
	jc LB_44784
	mov rsi,0
	bt r9,0
	jc LB_44784
	jmp LB_44785
LB_44784:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44785:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_44776:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_44794
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_44795
	bt QWORD [rdi],0
	jc LB_44796
	btr r12,1
	jmp LB_44797
LB_44796:
	bts r12,1
LB_44797:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_44795:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_44798:
	cmp r15,0
	jz LB_44799
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44798
LB_44799:
; _some %_44743 ⊢ %_44747 : %_44747
 ; {>  %_44743~0':_p41182 }
; _some 0' ⊢ °0◂0'
; ∎ %_44747
 ; {>  %_44747~°0◂0':(_opn)◂(_p41182) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44800
	btr r12,3
	jmp LB_44801
LB_44800:
	bts r12,3
LB_44801:
	mov r8,0
	bts r12,2
	ret
MTC_LB_44794:
LB_44802:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44804
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44803
LB_44804:
	add rsp,8
	ret
LB_44805:
	add rsp,48
	pop r14
LB_44803:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44736:
NS_E_RDI_44736:
NS_E_44736_ETR_TBL:
NS_E_44736_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_44843
LB_44842:
	add r14,1
LB_44843:
	cmp r14,r10
	jge LB_44844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44842
	cmp al,10
	jz LB_44842
	cmp al,32
	jz LB_44842
LB_44844:
	add r14,3
	cmp r14,r10
	jg LB_44847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_44847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_44847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_44847
	jmp LB_44848
LB_44847:
	jmp LB_44837
LB_44848:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_44850
LB_44849:
	add r14,1
LB_44850:
	cmp r14,r10
	jge LB_44851
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44849
	cmp al,10
	jz LB_44849
	cmp al,32
	jz LB_44849
LB_44851:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44852
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44853
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44853:
	jmp LB_44837
LB_44852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44840
	btr r12,1
	jmp LB_44841
LB_44840:
	bts r12,1
LB_44841:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44838
	btr r12,0
	jmp LB_44839
LB_44838:
	bts r12,0
LB_44839:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44834
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_44855
	btr r12,2
	jmp LB_44856
LB_44855:
	bts r12,2
LB_44856:
	mov r13,r14
	bt r12,1
	jc LB_44857
	btr r12,0
	jmp LB_44858
LB_44857:
	bts r12,0
LB_44858:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_44748 ⊢ %_44749 : %_44749
 ; {>  %_44748~0':_p41182 }
; _some 0' ⊢ °0◂0'
; _some %_44749 ⊢ %_44750 : %_44750
 ; {>  %_44749~°0◂0':(_opn)◂(_p41182) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_44750
 ; {>  %_44750~°0◂°0◂0':(_opn)◂((_opn)◂(_p41182)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44832
	btr r12,3
	jmp LB_44833
LB_44832:
	bts r12,3
LB_44833:
	mov rsi,1
	bt r12,3
	jc LB_44830
	mov rsi,0
	bt r9,0
	jc LB_44830
	jmp LB_44831
LB_44830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44831:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44834:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44836
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44835
LB_44836:
	add rsp,8
	ret
LB_44837:
	add rsp,32
	pop r14
LB_44835:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44861
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_44751 : %_44751
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_44751 ⊢ %_44752 : %_44752
 ; {>  %_44751~°1◂{  }:(_opn)◂(t17322'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_44752
 ; {>  %_44752~°0◂°1◂{  }:(_opn)◂((_opn)◂(t17325'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44859
	mov rsi,0
	bt r9,0
	jc LB_44859
	jmp LB_44860
LB_44859:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44860:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44863
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44862
LB_44863:
	add rsp,8
	ret
LB_44864:
	add rsp,0
	pop r14
LB_44862:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44737:
NS_E_RDI_44737:
NS_E_44737_ETR_TBL:
NS_E_44737_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_44886
LB_44885:
	add r14,1
LB_44886:
	cmp r14,r10
	jge LB_44887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44885
	cmp al,10
	jz LB_44885
	cmp al,32
	jz LB_44885
LB_44887:
	add r14,3
	cmp r14,r10
	jg LB_44890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_44890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_44890
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_44890
	jmp LB_44891
LB_44890:
	jmp LB_44878
LB_44891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_44893
LB_44892:
	add r14,1
LB_44893:
	cmp r14,r10
	jge LB_44894
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44892
	cmp al,10
	jz LB_44892
	cmp al,32
	jz LB_44892
LB_44894:
	push r10
	call NS_E_44738_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44895
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44896
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44896:
	jmp LB_44878
LB_44895:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_44899
LB_44898:
	add r14,1
LB_44899:
	cmp r14,r10
	jge LB_44900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44898
	cmp al,10
	jz LB_44898
	cmp al,32
	jz LB_44898
LB_44900:
	push r10
	call NS_E_44737_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44901
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44902
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44902:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44903
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44903:
	jmp LB_44878
LB_44901:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44883
	btr r12,2
	jmp LB_44884
LB_44883:
	bts r12,2
LB_44884:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44881
	btr r12,1
	jmp LB_44882
LB_44881:
	bts r12,1
LB_44882:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44879
	btr r12,0
	jmp LB_44880
LB_44879:
	bts r12,0
LB_44880:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44875
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_44905
	btr r12,3
	jmp LB_44906
LB_44905:
	bts r12,3
LB_44906:
	mov r14,r8
	bt r12,2
	jc LB_44907
	btr r12,1
	jmp LB_44908
LB_44907:
	bts r12,1
LB_44908:
	mov r8,r13
	bt r12,0
	jc LB_44909
	btr r12,2
	jmp LB_44910
LB_44909:
	bts r12,2
LB_44910:
	mov r13,r9
	bt r12,3
	jc LB_44911
	btr r12,0
	jmp LB_44912
LB_44911:
	bts r12,0
LB_44912:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_44753 %_44754 } ⊢ %_44755 : %_44755
 ; {>  %_44754~1':(_lst)◂(_p41182) %_44753~0':_p41182 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_44755 ⊢ %_44756 : %_44756
 ; {>  %_44755~°0◂{ 0' 1' }:(_lst)◂(_p41182) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_44756
 ; {>  %_44756~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41182)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_44869
	btr r12,2
	jmp LB_44870
LB_44869:
	bts r12,2
LB_44870:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_44867
	btr QWORD [rdi],0
	jmp LB_44868
LB_44867:
	bts QWORD [rdi],0
LB_44868:
	mov r8,r14
	bt r12,1
	jc LB_44873
	btr r12,2
	jmp LB_44874
LB_44873:
	bts r12,2
LB_44874:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_44871
	btr QWORD [rdi],1
	jmp LB_44872
LB_44871:
	bts QWORD [rdi],1
LB_44872:
	mov rsi,1
	bt r12,3
	jc LB_44865
	mov rsi,0
	bt r9,0
	jc LB_44865
	jmp LB_44866
LB_44865:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44866:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44875:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44877
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44876
LB_44877:
	add rsp,8
	ret
LB_44878:
	add rsp,48
	pop r14
LB_44876:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44915
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_44757 : %_44757
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_44757 ⊢ %_44758 : %_44758
 ; {>  %_44757~°1◂{  }:(_lst)◂(t17335'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_44758
 ; {>  %_44758~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17338'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_44913
	mov rsi,0
	bt r9,0
	jc LB_44913
	jmp LB_44914
LB_44913:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44914:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44917
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44916
LB_44917:
	add rsp,8
	ret
LB_44918:
	add rsp,0
	pop r14
LB_44916:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44738:
NS_E_RDI_44738:
NS_E_44738_ETR_TBL:
NS_E_44738_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_44934
LB_44933:
	add r14,1
LB_44934:
	cmp r14,r10
	jge LB_44935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44933
	cmp al,10
	jz LB_44933
	cmp al,32
	jz LB_44933
LB_44935:
	add r14,1
	cmp r14,r10
	jg LB_44938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_44938
	jmp LB_44939
LB_44938:
	jmp LB_44926
LB_44939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_44944:
	jmp LB_44941
LB_44940:
	add r14,1
LB_44941:
	cmp r14,r10
	jge LB_44942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44940
	cmp al,10
	jz LB_44940
	cmp al,32
	jz LB_44940
LB_44942:
	push r10
	push rsi
	call NS_E_44735_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_44943
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_44945
	bts QWORD [rax],0
LB_44945:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_44944
LB_44943:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_44947
LB_44946:
	add r14,1
LB_44947:
	cmp r14,r10
	jge LB_44948
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44946
	cmp al,10
	jz LB_44946
	cmp al,32
	jz LB_44946
LB_44948:
	add r14,1
	cmp r14,r10
	jg LB_44953
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_44953
	jmp LB_44954
LB_44953:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44950
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44950:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44951:
	jmp LB_44926
LB_44954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44931
	btr r12,2
	jmp LB_44932
LB_44931:
	bts r12,2
LB_44932:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44929
	btr r12,1
	jmp LB_44930
LB_44929:
	bts r12,1
LB_44930:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44927
	btr r12,0
	jmp LB_44928
LB_44927:
	bts r12,0
LB_44928:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44923
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_44955
	btr r12,3
	jmp LB_44956
LB_44955:
	bts r12,3
LB_44956:
	mov r13,r14
	bt r12,1
	jc LB_44957
	btr r12,0
	jmp LB_44958
LB_44957:
	bts r12,0
LB_44958:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f40503 %_44759 ⊢ %_44760 : %_44760
 ; {>  %_44759~0':(_lst)◂(_p41182) }
; _f40503 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_40503
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f41233 %_44760 ⊢ %_44761 : %_44761
 ; {>  %_44760~0':(_lst)◂(_p41182) }
; _f41233 0' ⊢ °0◂0'
; _some %_44761 ⊢ %_44762 : %_44762
 ; {>  %_44761~°0◂0':_p41182 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_44762
 ; {>  %_44762~°0◂°0◂0':(_opn)◂(_p41182) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44921
	btr r12,3
	jmp LB_44922
LB_44921:
	bts r12,3
LB_44922:
	mov rsi,1
	bt r12,3
	jc LB_44919
	mov rsi,0
	bt r9,0
	jc LB_44919
	jmp LB_44920
LB_44919:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44920:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_44923:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44925
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44924
LB_44925:
	add rsp,8
	ret
LB_44926:
	add rsp,48
	pop r14
LB_44924:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_44972
LB_44971:
	add r14,1
LB_44972:
	cmp r14,r10
	jge LB_44973
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44971
	cmp al,10
	jz LB_44971
	cmp al,32
	jz LB_44971
LB_44973:
	add r14,1
	cmp r14,r10
	jg LB_44976
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_44976
	jmp LB_44977
LB_44976:
	jmp LB_44964
LB_44977:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_44979
LB_44978:
	add r14,1
LB_44979:
	cmp r14,r10
	jge LB_44980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44978
	cmp al,10
	jz LB_44978
	cmp al,32
	jz LB_44978
LB_44980:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44981
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44982
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44982:
	jmp LB_44964
LB_44981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_44985
LB_44984:
	add r14,1
LB_44985:
	cmp r14,r10
	jge LB_44986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44984
	cmp al,10
	jz LB_44984
	cmp al,32
	jz LB_44984
LB_44986:
	add r14,1
	cmp r14,r10
	jg LB_44991
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_44991
	jmp LB_44992
LB_44991:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44988
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44988:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44989:
	jmp LB_44964
LB_44992:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44969
	btr r12,2
	jmp LB_44970
LB_44969:
	bts r12,2
LB_44970:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44967
	btr r12,1
	jmp LB_44968
LB_44967:
	bts r12,1
LB_44968:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44965
	btr r12,0
	jmp LB_44966
LB_44965:
	bts r12,0
LB_44966:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44961
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_44993
	btr r12,3
	jmp LB_44994
LB_44993:
	bts r12,3
LB_44994:
	mov r13,r14
	bt r12,1
	jc LB_44995
	btr r12,0
	jmp LB_44996
LB_44995:
	bts r12,0
LB_44996:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_44763 ⊢ %_44764 : %_44764
 ; {>  %_44763~0':_p41182 }
; _some 0' ⊢ °0◂0'
; ∎ %_44764
 ; {>  %_44764~°0◂0':(_opn)◂(_p41182) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44959
	btr r12,3
	jmp LB_44960
LB_44959:
	bts r12,3
LB_44960:
	mov r8,0
	bts r12,2
	ret
LB_44961:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44963
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_44962
LB_44963:
	add rsp,8
	ret
LB_44964:
	add rsp,48
	pop r14
LB_44962:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_45008
LB_45007:
	add r14,1
LB_45008:
	cmp r14,r10
	jge LB_45009
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45007
	cmp al,10
	jz LB_45007
	cmp al,32
	jz LB_45007
LB_45009:
	push r10
	call NS_E_44739_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45010
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45004
LB_45010:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45005
	btr r12,0
	jmp LB_45006
LB_45005:
	bts r12,0
LB_45006:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_45001
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41237 %_44765 ⊢ %_44766 : %_44766
 ; {>  %_44765~0':_stg }
; _f41237 0' ⊢ °4◂0'
; _some %_44766 ⊢ %_44767 : %_44767
 ; {>  %_44766~°4◂0':_p41182 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_44767
 ; {>  %_44767~°0◂°4◂0':(_opn)◂(_p41182) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44999
	btr r12,3
	jmp LB_45000
LB_44999:
	bts r12,3
LB_45000:
	mov rsi,1
	bt r12,3
	jc LB_44997
	mov rsi,0
	bt r9,0
	jc LB_44997
	jmp LB_44998
LB_44997:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_44998:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45003
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45002
LB_45003:
	add rsp,8
	ret
LB_45004:
	add rsp,16
	pop r14
LB_45002:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_45023
LB_45022:
	add r14,1
LB_45023:
	cmp r14,r10
	jge LB_45024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45022
	cmp al,10
	jz LB_45022
	cmp al,32
	jz LB_45022
LB_45024:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45025
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45019
LB_45025:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45020
	btr r12,0
	jmp LB_45021
LB_45020:
	bts r12,0
LB_45021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_45016
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41236 %_44768 ⊢ %_44769 : %_44769
 ; {>  %_44768~0':_p41117 }
; _f41236 0' ⊢ °3◂0'
; _some %_44769 ⊢ %_44770 : %_44770
 ; {>  %_44769~°3◂0':_p41182 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_44770
 ; {>  %_44770~°0◂°3◂0':(_opn)◂(_p41182) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45014
	btr r12,3
	jmp LB_45015
LB_45014:
	bts r12,3
LB_45015:
	mov rsi,1
	bt r12,3
	jc LB_45012
	mov rsi,0
	bt r9,0
	jc LB_45012
	jmp LB_45013
LB_45012:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45013:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45018
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45017
LB_45018:
	add rsp,8
	ret
LB_45019:
	add rsp,16
	pop r14
LB_45017:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44739:
NS_E_RDI_44739:
NS_E_44739_ETR_TBL:
NS_E_44739_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45040
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45032
LB_45040:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_45048
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_45048
	jmp LB_45049
LB_45048:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45046
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45046:
	jmp LB_45032
LB_45049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45035
	btr r12,1
	jmp LB_45036
LB_45035:
	bts r12,1
LB_45036:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45033
	btr r12,0
	jmp LB_45034
LB_45033:
	bts r12,0
LB_45034:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45029
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_44771 ⊢ %_44772 : %_44772
 ; {>  %_44771~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_44772
 ; {>  %_44772~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45027
	btr r12,3
	jmp LB_45028
LB_45027:
	bts r12,3
LB_45028:
	mov r8,0
	bts r12,2
	ret
LB_45029:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45031
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45030
LB_45031:
	add rsp,8
	ret
LB_45032:
	add rsp,32
	pop r14
LB_45030:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45050:
NS_E_RDI_45050:
NS_E_45050_ETR_TBL:
NS_E_45050_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_45465
LB_45464:
	add r14,1
LB_45465:
	cmp r14,r10
	jge LB_45466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45464
	cmp al,10
	jz LB_45464
	cmp al,32
	jz LB_45464
LB_45466:
	push r10
	call NS_E_45051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45467
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45459
LB_45467:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_45470
LB_45469:
	add r14,1
LB_45470:
	cmp r14,r10
	jge LB_45471
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45469
	cmp al,10
	jz LB_45469
	cmp al,32
	jz LB_45469
LB_45471:
	push r10
	call NS_E_45050_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45472
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45473
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45473:
	jmp LB_45459
LB_45472:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45462
	btr r12,1
	jmp LB_45463
LB_45462:
	bts r12,1
LB_45463:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45460
	btr r12,0
	jmp LB_45461
LB_45460:
	bts r12,0
LB_45461:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45456
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_45091 %_45092 } ⊢ %_45093 : %_45093
 ; {>  %_45091~0':_p41165 %_45092~1':(_lst)◂(_p41165) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45093 ⊢ %_45094 : %_45094
 ; {>  %_45093~°0◂{ 0' 1' }:(_lst)◂(_p41165) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45094
 ; {>  %_45094~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41165)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_45450
	btr r12,2
	jmp LB_45451
LB_45450:
	bts r12,2
LB_45451:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_45448
	btr QWORD [rdi],0
	jmp LB_45449
LB_45448:
	bts QWORD [rdi],0
LB_45449:
	mov r8,r14
	bt r12,1
	jc LB_45454
	btr r12,2
	jmp LB_45455
LB_45454:
	bts r12,2
LB_45455:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_45452
	btr QWORD [rdi],1
	jmp LB_45453
LB_45452:
	bts QWORD [rdi],1
LB_45453:
	mov rsi,1
	bt r12,3
	jc LB_45446
	mov rsi,0
	bt r9,0
	jc LB_45446
	jmp LB_45447
LB_45446:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45447:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45456:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45458
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45457
LB_45458:
	add rsp,8
	ret
LB_45459:
	add rsp,32
	pop r14
LB_45457:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45477
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_45095 : %_45095
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_45095 ⊢ %_45096 : %_45096
 ; {>  %_45095~°1◂{  }:(_lst)◂(t17465'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45096
 ; {>  %_45096~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17468'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_45475
	mov rsi,0
	bt r9,0
	jc LB_45475
	jmp LB_45476
LB_45475:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45476:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45477:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45479
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45478
LB_45479:
	add rsp,8
	ret
LB_45480:
	add rsp,0
	pop r14
LB_45478:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45051:
NS_E_RDI_45051:
NS_E_45051_ETR_TBL:
NS_E_45051_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_45499
LB_45498:
	add r14,1
LB_45499:
	cmp r14,r10
	jge LB_45500
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45498
	cmp al,10
	jz LB_45498
	cmp al,32
	jz LB_45498
LB_45500:
	add r14,7
	cmp r14,r10
	jg LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_45503
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_45503
	jmp LB_45504
LB_45503:
	jmp LB_45486
LB_45504:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_45493
LB_45492:
	add r14,1
LB_45493:
	cmp r14,r10
	jge LB_45494
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45492
	cmp al,10
	jz LB_45492
	cmp al,32
	jz LB_45492
LB_45494:
	push r10
	call NS_E_45052_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45495
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45496
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45496:
	jmp LB_45487
LB_45495:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45490
	btr r12,1
	jmp LB_45491
LB_45490:
	bts r12,1
LB_45491:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45488
	btr r12,0
	jmp LB_45489
LB_45488:
	bts r12,0
LB_45489:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45483
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_45505
	btr r12,2
	jmp LB_45506
LB_45505:
	bts r12,2
LB_45506:
	mov r13,r14
	bt r12,1
	jc LB_45507
	btr r12,0
	jmp LB_45508
LB_45507:
	bts r12,0
LB_45508:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45097 ⊢ %_45098 : %_45098
 ; {>  %_45097~0':_p41165 }
; _some 0' ⊢ °0◂0'
; ∎ %_45098
 ; {>  %_45098~°0◂0':(_opn)◂(_p41165) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45481
	btr r12,3
	jmp LB_45482
LB_45481:
	bts r12,3
LB_45482:
	mov r8,0
	bts r12,2
	ret
LB_45483:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45485
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45484
LB_45485:
	add rsp,8
	ret
LB_45487:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45486:
	add rsp,32
	pop r14
LB_45484:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45510
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_45099
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45099 ⊢ %_45100 : %_45100
 ; {>  %_45099~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45101 : %_45101
 ; {>  %_45100~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45101
 ; {>  %_45100~0':_stg %_45101~°1◂{  }:(_opn)◂(t17478'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_45509
	mov rdi,r13
	call dlt
LB_45509:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_45510:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45512
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45511
LB_45512:
	add rsp,8
	ret
LB_45513:
	add rsp,0
	pop r14
LB_45511:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_45549
LB_45548:
	add r14,1
LB_45549:
	cmp r14,r10
	jge LB_45550
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45548
	cmp al,10
	jz LB_45548
	cmp al,32
	jz LB_45548
LB_45550:
	add r14,4
	cmp r14,r10
	jg LB_45553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_45553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_45553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_45553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_45553
	jmp LB_45554
LB_45553:
	jmp LB_45527
LB_45554:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_45536
LB_45535:
	add r14,1
LB_45536:
	cmp r14,r10
	jge LB_45537
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45535
	cmp al,10
	jz LB_45535
	cmp al,32
	jz LB_45535
LB_45537:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45538
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45539:
	jmp LB_45528
LB_45538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_45542
LB_45541:
	add r14,1
LB_45542:
	cmp r14,r10
	jge LB_45543
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45541
	cmp al,10
	jz LB_45541
	cmp al,32
	jz LB_45541
LB_45543:
	push r10
	call NS_E_45053_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45544
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45545
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45545:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45546
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45546:
	jmp LB_45528
LB_45544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45533
	btr r12,2
	jmp LB_45534
LB_45533:
	bts r12,2
LB_45534:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45531
	btr r12,1
	jmp LB_45532
LB_45531:
	bts r12,1
LB_45532:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45529
	btr r12,0
	jmp LB_45530
LB_45529:
	bts r12,0
LB_45530:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_45524
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_45555
	btr r12,3
	jmp LB_45556
LB_45555:
	bts r12,3
LB_45556:
	mov r14,r8
	bt r12,2
	jc LB_45557
	btr r12,1
	jmp LB_45558
LB_45557:
	bts r12,1
LB_45558:
	mov r8,r13
	bt r12,0
	jc LB_45559
	btr r12,2
	jmp LB_45560
LB_45559:
	bts r12,2
LB_45560:
	mov r13,r9
	bt r12,3
	jc LB_45561
	btr r12,0
	jmp LB_45562
LB_45561:
	bts r12,0
LB_45562:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41192 { %_45102 %_45103 } ⊢ %_45104 : %_45104
 ; {>  %_45103~1':_p41166 %_45102~0':_stg }
; _f41192 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45104 ⊢ %_45105 : %_45105
 ; {>  %_45104~°0◂{ 0' 1' }:_p41165 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45105
 ; {>  %_45105~°0◂°0◂{ 0' 1' }:(_opn)◂(_p41165) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_45518
	btr r12,2
	jmp LB_45519
LB_45518:
	bts r12,2
LB_45519:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_45516
	btr QWORD [rdi],0
	jmp LB_45517
LB_45516:
	bts QWORD [rdi],0
LB_45517:
	mov r8,r14
	bt r12,1
	jc LB_45522
	btr r12,2
	jmp LB_45523
LB_45522:
	bts r12,2
LB_45523:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_45520
	btr QWORD [rdi],1
	jmp LB_45521
LB_45520:
	bts QWORD [rdi],1
LB_45521:
	mov rsi,1
	bt r12,3
	jc LB_45514
	mov rsi,0
	bt r9,0
	jc LB_45514
	jmp LB_45515
LB_45514:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45515:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45524:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45526
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45525
LB_45526:
	add rsp,8
	ret
LB_45528:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45527:
	add rsp,48
	pop r14
LB_45525:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45564
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_45106
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45106 ⊢ %_45107 : %_45107
 ; {>  %_45106~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45108 : %_45108
 ; {>  %_45107~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45108
 ; {>  %_45107~0':_stg %_45108~°1◂{  }:(_opn)◂(t17490'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_45563
	mov rdi,r13
	call dlt
LB_45563:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_45564:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45566
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45565
LB_45566:
	add rsp,8
	ret
LB_45567:
	add rsp,0
	pop r14
LB_45565:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_45586
LB_45585:
	add r14,1
LB_45586:
	cmp r14,r10
	jge LB_45587
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45585
	cmp al,10
	jz LB_45585
	cmp al,32
	jz LB_45585
LB_45587:
	add r14,2
	cmp r14,r10
	jg LB_45590
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_45590
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_45590
	jmp LB_45591
LB_45590:
	jmp LB_45573
LB_45591:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_45580
LB_45579:
	add r14,1
LB_45580:
	cmp r14,r10
	jge LB_45581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45579
	cmp al,10
	jz LB_45579
	cmp al,32
	jz LB_45579
LB_45581:
	push r10
	call NS_E_45061_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45582
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45583
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45583:
	jmp LB_45574
LB_45582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45577
	btr r12,1
	jmp LB_45578
LB_45577:
	bts r12,1
LB_45578:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45575
	btr r12,0
	jmp LB_45576
LB_45575:
	bts r12,0
LB_45576:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45570
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_45592
	btr r12,2
	jmp LB_45593
LB_45592:
	bts r12,2
LB_45593:
	mov r13,r14
	bt r12,1
	jc LB_45594
	btr r12,0
	jmp LB_45595
LB_45594:
	bts r12,0
LB_45595:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45109 ⊢ %_45110 : %_45110
 ; {>  %_45109~0':_p41165 }
; _some 0' ⊢ °0◂0'
; ∎ %_45110
 ; {>  %_45110~°0◂0':(_opn)◂(_p41165) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45568
	btr r12,3
	jmp LB_45569
LB_45568:
	bts r12,3
LB_45569:
	mov r8,0
	bts r12,2
	ret
LB_45570:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45572
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45571
LB_45572:
	add rsp,8
	ret
LB_45574:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45573:
	add rsp,32
	pop r14
LB_45571:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45597
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_45111
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45111 ⊢ %_45112 : %_45112
 ; {>  %_45111~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45113 : %_45113
 ; {>  %_45112~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45113
 ; {>  %_45112~0':_stg %_45113~°1◂{  }:(_opn)◂(t17500'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_45596
	mov rdi,r13
	call dlt
LB_45596:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_45597:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45599
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45598
LB_45599:
	add rsp,8
	ret
LB_45600:
	add rsp,0
	pop r14
LB_45598:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_45619
LB_45618:
	add r14,1
LB_45619:
	cmp r14,r10
	jge LB_45620
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45618
	cmp al,10
	jz LB_45618
	cmp al,32
	jz LB_45618
LB_45620:
	add r14,2
	cmp r14,r10
	jg LB_45623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_45623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_45623
	jmp LB_45624
LB_45623:
	jmp LB_45606
LB_45624:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_45613
LB_45612:
	add r14,1
LB_45613:
	cmp r14,r10
	jge LB_45614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45612
	cmp al,10
	jz LB_45612
	cmp al,32
	jz LB_45612
LB_45614:
	push r10
	call NS_E_45055_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45615
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45616
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45616:
	jmp LB_45607
LB_45615:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45610
	btr r12,1
	jmp LB_45611
LB_45610:
	bts r12,1
LB_45611:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45608
	btr r12,0
	jmp LB_45609
LB_45608:
	bts r12,0
LB_45609:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45603
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_45625
	btr r12,2
	jmp LB_45626
LB_45625:
	bts r12,2
LB_45626:
	mov r13,r14
	bt r12,1
	jc LB_45627
	btr r12,0
	jmp LB_45628
LB_45627:
	bts r12,0
LB_45628:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45114 ⊢ %_45115 : %_45115
 ; {>  %_45114~0':_p41165 }
; _some 0' ⊢ °0◂0'
; ∎ %_45115
 ; {>  %_45115~°0◂0':(_opn)◂(_p41165) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45601
	btr r12,3
	jmp LB_45602
LB_45601:
	bts r12,3
LB_45602:
	mov r8,0
	bts r12,2
	ret
LB_45603:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45605
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45604
LB_45605:
	add rsp,8
	ret
LB_45607:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45606:
	add rsp,32
	pop r14
LB_45604:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45052:
NS_E_RDI_45052:
NS_E_45052_ETR_TBL:
NS_E_45052_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_45664
LB_45663:
	add r14,1
LB_45664:
	cmp r14,r10
	jge LB_45665
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45663
	cmp al,10
	jz LB_45663
	cmp al,32
	jz LB_45663
LB_45665:
	push r10
	call NS_E_45078_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45666
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45658
LB_45666:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45672:
	jmp LB_45669
LB_45668:
	add r14,1
LB_45669:
	cmp r14,r10
	jge LB_45670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45668
	cmp al,10
	jz LB_45668
	cmp al,32
	jz LB_45668
LB_45670:
	push r10
	push rsi
	call NS_E_45078_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45671
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45673
	bts QWORD [rax],0
LB_45673:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45672
LB_45671:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45661
	btr r12,1
	jmp LB_45662
LB_45661:
	bts r12,1
LB_45662:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45659
	btr r12,0
	jmp LB_45660
LB_45659:
	bts r12,0
LB_45660:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45655
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_45674
	btr r12,2
	jmp LB_45675
LB_45674:
	bts r12,2
LB_45675:
	mov r9,r13
	bt r12,0
	jc LB_45676
	btr r12,3
	jmp LB_45677
LB_45676:
	bts r12,3
LB_45677:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_45680
	btr r12,4
	jmp LB_45681
LB_45680:
	bts r12,4
LB_45681:
	mov r13,r10
	bt r12,4
	jc LB_45678
	btr r12,0
	jmp LB_45679
LB_45678:
	bts r12,0
LB_45679:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_45684
	btr r12,4
	jmp LB_45685
LB_45684:
	bts r12,4
LB_45685:
	mov r14,r10
	bt r12,4
	jc LB_45682
	btr r12,1
	jmp LB_45683
LB_45682:
	bts r12,1
LB_45683:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f40503 %_45117 ⊢ %_45118 : %_45118
 ; {>  %_45116~{ 0' 1' }:{ _stg _p41169 } %_45117~2':(_lst)◂({ _stg _p41169 }) }
; _f40503 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_45633
	btr r12,0
	jmp LB_45634
LB_45633:
	bts r12,0
LB_45634:
	call NS_E_40503
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_45635
	btr r12,2
	jmp LB_45636
LB_45635:
	bts r12,2
LB_45636:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_45631
	btr r12,1
	jmp LB_45632
LB_45631:
	bts r12,1
LB_45632:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_45629
	btr r12,0
	jmp LB_45630
LB_45629:
	bts r12,0
LB_45630:
	add rsp,24
; _cns { %_45116 %_45118 } ⊢ %_45119 : %_45119
 ; {>  %_45116~{ 0' 1' }:{ _stg _p41169 } %_45118~2':(_lst)◂({ _stg _p41169 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f41193 %_45119 ⊢ %_45120 : %_45120
 ; {>  %_45119~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p41169 }) }
; _f41193 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_45120 ⊢ %_45121 : %_45121
 ; {>  %_45120~°1◂°0◂{ { 0' 1' } 2' }:_p41165 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_45121
 ; {>  %_45121~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p41165) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_45645
	btr r12,5
	jmp LB_45646
LB_45645:
	bts r12,5
LB_45646:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_45643
	btr QWORD [rdi],0
	jmp LB_45644
LB_45643:
	bts QWORD [rdi],0
LB_45644:
	mov r11,r14
	bt r12,1
	jc LB_45649
	btr r12,5
	jmp LB_45650
LB_45649:
	bts r12,5
LB_45650:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_45647
	btr QWORD [rdi],1
	jmp LB_45648
LB_45647:
	bts QWORD [rdi],1
LB_45648:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_45641
	btr QWORD [rdi],0
	jmp LB_45642
LB_45641:
	bts QWORD [rdi],0
LB_45642:
	mov r10,r8
	bt r12,2
	jc LB_45653
	btr r12,4
	jmp LB_45654
LB_45653:
	bts r12,4
LB_45654:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_45651
	btr QWORD [rdi],1
	jmp LB_45652
LB_45651:
	bts QWORD [rdi],1
LB_45652:
	mov rsi,1
	bt r12,3
	jc LB_45639
	mov rsi,0
	bt r9,0
	jc LB_45639
	jmp LB_45640
LB_45639:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45640:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_45637
	mov rsi,0
	bt r9,0
	jc LB_45637
	jmp LB_45638
LB_45637:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45638:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45655:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45657
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45656
LB_45657:
	add rsp,8
	ret
LB_45658:
	add rsp,32
	pop r14
LB_45656:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45687
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_45122
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45122 ⊢ %_45123 : %_45123
 ; {>  %_45122~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45124 : %_45124
 ; {>  %_45123~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45124
 ; {>  %_45123~0':_stg %_45124~°1◂{  }:(_opn)◂(t17519'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_45686
	mov rdi,r13
	call dlt
LB_45686:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_45687:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45689
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45688
LB_45689:
	add rsp,8
	ret
LB_45690:
	add rsp,0
	pop r14
LB_45688:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45053:
NS_E_RDI_45053:
NS_E_45053_ETR_TBL:
NS_E_45053_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_45711
LB_45710:
	add r14,1
LB_45711:
	cmp r14,r10
	jge LB_45712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45710
	cmp al,10
	jz LB_45710
	cmp al,32
	jz LB_45710
LB_45712:
	add r14,1
	cmp r14,r10
	jg LB_45715
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_45715
	jmp LB_45716
LB_45715:
	jmp LB_45698
LB_45716:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_45705
LB_45704:
	add r14,1
LB_45705:
	cmp r14,r10
	jge LB_45706
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45704
	cmp al,10
	jz LB_45704
	cmp al,32
	jz LB_45704
LB_45706:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45707
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45708:
	jmp LB_45699
LB_45707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45702
	btr r12,1
	jmp LB_45703
LB_45702:
	bts r12,1
LB_45703:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45700
	btr r12,0
	jmp LB_45701
LB_45700:
	bts r12,0
LB_45701:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45695
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_45717
	btr r12,2
	jmp LB_45718
LB_45717:
	bts r12,2
LB_45718:
	mov r13,r14
	bt r12,1
	jc LB_45719
	btr r12,0
	jmp LB_45720
LB_45719:
	bts r12,0
LB_45720:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41199 %_45125 ⊢ %_45126 : %_45126
 ; {>  %_45125~0':_p41117 }
; _f41199 0' ⊢ °1◂0'
; _some %_45126 ⊢ %_45127 : %_45127
 ; {>  %_45126~°1◂0':_p41166 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45127
 ; {>  %_45127~°0◂°1◂0':(_opn)◂(_p41166) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45693
	btr r12,3
	jmp LB_45694
LB_45693:
	bts r12,3
LB_45694:
	mov rsi,1
	bt r12,3
	jc LB_45691
	mov rsi,0
	bt r9,0
	jc LB_45691
	jmp LB_45692
LB_45691:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45692:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45695:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45697
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45696
LB_45697:
	add rsp,8
	ret
LB_45699:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45698:
	add rsp,32
	pop r14
LB_45696:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_45732
LB_45731:
	add r14,1
LB_45732:
	cmp r14,r10
	jge LB_45733
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45731
	cmp al,10
	jz LB_45731
	cmp al,32
	jz LB_45731
LB_45733:
	push r10
	call NS_E_45054_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45734
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45728
LB_45734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45729
	btr r12,0
	jmp LB_45730
LB_45729:
	bts r12,0
LB_45730:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_45725
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41198 %_45128 ⊢ %_45129 : %_45129
 ; {>  %_45128~0':(_lst)◂(_p41165) }
; _f41198 0' ⊢ °0◂0'
; _some %_45129 ⊢ %_45130 : %_45130
 ; {>  %_45129~°0◂0':_p41166 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45130
 ; {>  %_45130~°0◂°0◂0':(_opn)◂(_p41166) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_45723
	btr r12,3
	jmp LB_45724
LB_45723:
	bts r12,3
LB_45724:
	mov rsi,1
	bt r12,3
	jc LB_45721
	mov rsi,0
	bt r9,0
	jc LB_45721
	jmp LB_45722
LB_45721:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45722:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45725:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45727
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45726
LB_45727:
	add rsp,8
	ret
LB_45728:
	add rsp,16
	pop r14
LB_45726:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45737
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_45131
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45131 ⊢ %_45132 : %_45132
 ; {>  %_45131~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45133 : %_45133
 ; {>  %_45132~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45133
 ; {>  %_45132~0':_stg %_45133~°1◂{  }:(_opn)◂(t17534'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_45736
	mov rdi,r13
	call dlt
LB_45736:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_45737:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45739
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45738
LB_45739:
	add rsp,8
	ret
LB_45740:
	add rsp,0
	pop r14
LB_45738:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45054:
NS_E_RDI_45054:
NS_E_45054_ETR_TBL:
NS_E_45054_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_45750
LB_45749:
	add r14,1
LB_45750:
	cmp r14,r10
	jge LB_45751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45749
	cmp al,10
	jz LB_45749
	cmp al,32
	jz LB_45749
LB_45751:
	add r14,6
	cmp r14,r10
	jg LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_45754
	jmp LB_45755
LB_45754:
	jmp LB_45746
LB_45755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45747
	btr r12,0
	jmp LB_45748
LB_45747:
	bts r12,0
LB_45748:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_45743
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_45134 : %_45134
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_45134 ⊢ %_45135 : %_45135
 ; {>  %_45134~°1◂{  }:(_lst)◂(t17538'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45135
 ; {>  %_45135~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17541'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_45741
	mov rsi,0
	bt r9,0
	jc LB_45741
	jmp LB_45742
LB_45741:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45742:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45743:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45745
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45744
LB_45745:
	add rsp,8
	ret
LB_45746:
	add rsp,16
	pop r14
LB_45744:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_45775
LB_45774:
	add r14,1
LB_45775:
	cmp r14,r10
	jge LB_45776
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45774
	cmp al,10
	jz LB_45774
	cmp al,32
	jz LB_45774
LB_45776:
	push r10
	call NS_E_45051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45777
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45769
LB_45777:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_45780
LB_45779:
	add r14,1
LB_45780:
	cmp r14,r10
	jge LB_45781
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45779
	cmp al,10
	jz LB_45779
	cmp al,32
	jz LB_45779
LB_45781:
	push r10
	call NS_E_45054_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45782
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45783
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45783:
	jmp LB_45769
LB_45782:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45772
	btr r12,1
	jmp LB_45773
LB_45772:
	bts r12,1
LB_45773:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45770
	btr r12,0
	jmp LB_45771
LB_45770:
	bts r12,0
LB_45771:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_45766
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_45136 %_45137 } ⊢ %_45138 : %_45138
 ; {>  %_45137~1':(_lst)◂(_p41165) %_45136~0':_p41165 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45138 ⊢ %_45139 : %_45139
 ; {>  %_45138~°0◂{ 0' 1' }:(_lst)◂(_p41165) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45139
 ; {>  %_45139~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41165)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_45760
	btr r12,2
	jmp LB_45761
LB_45760:
	bts r12,2
LB_45761:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_45758
	btr QWORD [rdi],0
	jmp LB_45759
LB_45758:
	bts QWORD [rdi],0
LB_45759:
	mov r8,r14
	bt r12,1
	jc LB_45764
	btr r12,2
	jmp LB_45765
LB_45764:
	bts r12,2
LB_45765:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_45762
	btr QWORD [rdi],1
	jmp LB_45763
LB_45762:
	bts QWORD [rdi],1
LB_45763:
	mov rsi,1
	bt r12,3
	jc LB_45756
	mov rsi,0
	bt r9,0
	jc LB_45756
	jmp LB_45757
LB_45756:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45757:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45766:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45768
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45767
LB_45768:
	add rsp,8
	ret
LB_45769:
	add rsp,32
	pop r14
LB_45767:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45055:
NS_E_RDI_45055:
NS_E_45055_ETR_TBL:
NS_E_45055_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_45840
LB_45839:
	add r14,1
LB_45840:
	cmp r14,r10
	jge LB_45841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45839
	cmp al,10
	jz LB_45839
	cmp al,32
	jz LB_45839
LB_45841:
	add r14,1
	cmp r14,r10
	jg LB_45844
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_45844
	jmp LB_45845
LB_45844:
	jmp LB_45806
LB_45845:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_45817
LB_45816:
	add r14,1
LB_45817:
	cmp r14,r10
	jge LB_45818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45816
	cmp al,10
	jz LB_45816
	cmp al,32
	jz LB_45816
LB_45818:
	add r14,1
	cmp r14,r10
	jg LB_45822
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_45822
	jmp LB_45823
LB_45822:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45820
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45820:
	jmp LB_45807
LB_45823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_45825
LB_45824:
	add r14,1
LB_45825:
	cmp r14,r10
	jge LB_45826
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45824
	cmp al,10
	jz LB_45824
	cmp al,32
	jz LB_45824
LB_45826:
	push r10
	call NS_E_45056_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45827
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45828
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45828:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45829:
	jmp LB_45807
LB_45827:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_45832
LB_45831:
	add r14,1
LB_45832:
	cmp r14,r10
	jge LB_45833
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45831
	cmp al,10
	jz LB_45831
	cmp al,32
	jz LB_45831
LB_45833:
	push r10
	call NS_E_45059_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45834
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45835
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45835:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45836
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45836:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45837
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45837:
	jmp LB_45807
LB_45834:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45814
	btr r12,3
	jmp LB_45815
LB_45814:
	bts r12,3
LB_45815:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45812
	btr r12,2
	jmp LB_45813
LB_45812:
	bts r12,2
LB_45813:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45810
	btr r12,1
	jmp LB_45811
LB_45810:
	bts r12,1
LB_45811:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45808
	btr r12,0
	jmp LB_45809
LB_45808:
	bts r12,0
LB_45809:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_45803
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_45846
	btr r12,4
	jmp LB_45847
LB_45846:
	bts r12,4
LB_45847:
	mov r8,r9
	bt r12,3
	jc LB_45848
	btr r12,2
	jmp LB_45849
LB_45848:
	bts r12,2
LB_45849:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_45852
	btr r12,3
	jmp LB_45853
LB_45852:
	bts r12,3
LB_45853:
	mov r13,r9
	bt r12,3
	jc LB_45850
	btr r12,0
	jmp LB_45851
LB_45850:
	bts r12,0
LB_45851:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_45856
	btr r12,3
	jmp LB_45857
LB_45856:
	bts r12,3
LB_45857:
	mov r14,r9
	bt r12,3
	jc LB_45854
	btr r12,1
	jmp LB_45855
LB_45854:
	bts r12,1
LB_45855:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_45140 %_45141 } ⊢ %_45142 : %_45142
 ; {>  %_45141~2':(_lst)◂({ _stg _p41168 }) %_45140~{ 0' 1' }:{ _stg _p41168 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f41197 %_45142 ⊢ %_45143 : %_45143
 ; {>  %_45142~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p41168 }) }
; _f41197 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_45143 ⊢ %_45144 : %_45144
 ; {>  %_45143~°5◂°0◂{ { 0' 1' } 2' }:_p41165 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_45144
 ; {>  %_45144~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p41165) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_45793
	btr r12,5
	jmp LB_45794
LB_45793:
	bts r12,5
LB_45794:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_45791
	btr QWORD [rdi],0
	jmp LB_45792
LB_45791:
	bts QWORD [rdi],0
LB_45792:
	mov r11,r14
	bt r12,1
	jc LB_45797
	btr r12,5
	jmp LB_45798
LB_45797:
	bts r12,5
LB_45798:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_45795
	btr QWORD [rdi],1
	jmp LB_45796
LB_45795:
	bts QWORD [rdi],1
LB_45796:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_45789
	btr QWORD [rdi],0
	jmp LB_45790
LB_45789:
	bts QWORD [rdi],0
LB_45790:
	mov r10,r8
	bt r12,2
	jc LB_45801
	btr r12,4
	jmp LB_45802
LB_45801:
	bts r12,4
LB_45802:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_45799
	btr QWORD [rdi],1
	jmp LB_45800
LB_45799:
	bts QWORD [rdi],1
LB_45800:
	mov rsi,1
	bt r12,3
	jc LB_45787
	mov rsi,0
	bt r9,0
	jc LB_45787
	jmp LB_45788
LB_45787:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45788:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_45785
	mov rsi,0
	bt r9,0
	jc LB_45785
	jmp LB_45786
LB_45785:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45786:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45803:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45805
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45804
LB_45805:
	add rsp,8
	ret
LB_45807:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45806:
	add rsp,64
	pop r14
LB_45804:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_45875
LB_45874:
	add r14,1
LB_45875:
	cmp r14,r10
	jge LB_45876
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45874
	cmp al,10
	jz LB_45874
	cmp al,32
	jz LB_45874
LB_45876:
	push r10
	call NS_E_45056_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45877
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45871
LB_45877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45872
	btr r12,0
	jmp LB_45873
LB_45872:
	bts r12,0
LB_45873:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_45868
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_45879
	btr r12,2
	jmp LB_45880
LB_45879:
	bts r12,2
LB_45880:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_45883
	btr r12,3
	jmp LB_45884
LB_45883:
	bts r12,3
LB_45884:
	mov r13,r9
	bt r12,3
	jc LB_45881
	btr r12,0
	jmp LB_45882
LB_45881:
	bts r12,0
LB_45882:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_45887
	btr r12,3
	jmp LB_45888
LB_45887:
	bts r12,3
LB_45888:
	mov r14,r9
	bt r12,3
	jc LB_45885
	btr r12,1
	jmp LB_45886
LB_45885:
	bts r12,1
LB_45886:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41196 %_45145 ⊢ %_45146 : %_45146
 ; {>  %_45145~{ 0' 1' }:{ _stg _p41168 } }
; _f41196 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_45146 ⊢ %_45147 : %_45147
 ; {>  %_45146~°4◂{ 0' 1' }:_p41165 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_45147
 ; {>  %_45147~°0◂°4◂{ 0' 1' }:(_opn)◂(_p41165) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_45862
	btr r12,2
	jmp LB_45863
LB_45862:
	bts r12,2
LB_45863:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_45860
	btr QWORD [rdi],0
	jmp LB_45861
LB_45860:
	bts QWORD [rdi],0
LB_45861:
	mov r8,r14
	bt r12,1
	jc LB_45866
	btr r12,2
	jmp LB_45867
LB_45866:
	bts r12,2
LB_45867:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_45864
	btr QWORD [rdi],1
	jmp LB_45865
LB_45864:
	bts QWORD [rdi],1
LB_45865:
	mov rsi,1
	bt r12,3
	jc LB_45858
	mov rsi,0
	bt r9,0
	jc LB_45858
	jmp LB_45859
LB_45858:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_45859:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_45868:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45870
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45869
LB_45870:
	add rsp,8
	ret
LB_45871:
	add rsp,16
	pop r14
LB_45869:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_45890
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_45148
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45148 ⊢ %_45149 : %_45149
 ; {>  %_45148~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45150 : %_45150
 ; {>  %_45149~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45150
 ; {>  %_45150~°1◂{  }:(_opn)◂(t17565'(0)) %_45149~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_45889
	mov rdi,r13
	call dlt
LB_45889:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_45890:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45892
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45891
LB_45892:
	add rsp,8
	ret
LB_45893:
	add rsp,0
	pop r14
LB_45891:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45056:
NS_E_RDI_45056:
NS_E_45056_ETR_TBL:
NS_E_45056_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_45927
LB_45926:
	add r14,1
LB_45927:
	cmp r14,r10
	jge LB_45928
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45926
	cmp al,10
	jz LB_45926
	cmp al,32
	jz LB_45926
LB_45928:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45929
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45908
LB_45929:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_45932
LB_45931:
	add r14,1
LB_45932:
	cmp r14,r10
	jge LB_45933
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45931
	cmp al,10
	jz LB_45931
	cmp al,32
	jz LB_45931
LB_45933:
	push r10
	call NS_E_45058_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45934
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45935
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45935:
	jmp LB_45908
LB_45934:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_45938
LB_45937:
	add r14,1
LB_45938:
	cmp r14,r10
	jge LB_45939
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45937
	cmp al,10
	jz LB_45937
	cmp al,32
	jz LB_45937
LB_45939:
	add r14,1
	cmp r14,r10
	jg LB_45944
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_45944
	jmp LB_45945
LB_45944:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45941
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45941:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45942:
	jmp LB_45908
LB_45945:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_45919
LB_45918:
	add r14,1
LB_45919:
	cmp r14,r10
	jge LB_45920
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45918
	cmp al,10
	jz LB_45918
	cmp al,32
	jz LB_45918
LB_45920:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45921
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45922
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45922:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45923
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45923:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45924
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45924:
	jmp LB_45909
LB_45921:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45916
	btr r12,3
	jmp LB_45917
LB_45916:
	bts r12,3
LB_45917:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45914
	btr r12,2
	jmp LB_45915
LB_45914:
	bts r12,2
LB_45915:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45912
	btr r12,1
	jmp LB_45913
LB_45912:
	bts r12,1
LB_45913:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45910
	btr r12,0
	jmp LB_45911
LB_45910:
	bts r12,0
LB_45911:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_45905
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_45946
	btr r12,4
	jmp LB_45947
LB_45946:
	bts r12,4
LB_45947:
	mov r8,r9
	bt r12,3
	jc LB_45948
	btr r12,2
	jmp LB_45949
LB_45948:
	bts r12,2
LB_45949:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f41204 %_45153 ⊢ %_45154 : %_45154
 ; {>  %_45151~0':_stg %_45152~1':_p45057 %_45153~2':_p41182 }
; _f41204 2' ⊢ °1◂2'
; _some { %_45151 %_45154 } ⊢ %_45155 : %_45155
 ; {>  %_45154~°1◂2':_p41168 %_45151~0':_stg %_45152~1':_p45057 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_45155
 ; {>  %_45152~1':_p45057 %_45155~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p41168 }) }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_45894
	mov rdi,r14
	call dlt
LB_45894:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_45897
	btr r12,1
	jmp LB_45898
LB_45897:
	bts r12,1
LB_45898:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_45895
	btr QWORD [rdi],0
	jmp LB_45896
LB_45895:
	bts QWORD [rdi],0
LB_45896:
	mov r14,r8
	bt r12,2
	jc LB_45903
	btr r12,1
	jmp LB_45904
LB_45903:
	bts r12,1
LB_45904:
	mov rsi,1
	bt r12,1
	jc LB_45901
	mov rsi,0
	bt r14,0
	jc LB_45901
	jmp LB_45902
LB_45901:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_45902:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_45899
	btr QWORD [rdi],1
	jmp LB_45900
LB_45899:
	bts QWORD [rdi],1
LB_45900:
	mov r8,0
	bts r12,2
	ret
LB_45905:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45907
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45906
LB_45907:
	add rsp,8
	ret
LB_45909:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_45908:
	add rsp,64
	pop r14
LB_45906:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_45996
LB_45995:
	add r14,1
LB_45996:
	cmp r14,r10
	jge LB_45997
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45995
	cmp al,10
	jz LB_45995
	cmp al,32
	jz LB_45995
LB_45997:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45998
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45980
LB_45998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_46001
LB_46000:
	add r14,1
LB_46001:
	cmp r14,r10
	jge LB_46002
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46000
	cmp al,10
	jz LB_46000
	cmp al,32
	jz LB_46000
LB_46002:
	push r10
	call NS_E_45058_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46003
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46004:
	jmp LB_45980
LB_46003:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_46007
LB_46006:
	add r14,1
LB_46007:
	cmp r14,r10
	jge LB_46008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46006
	cmp al,10
	jz LB_46006
	cmp al,32
	jz LB_46006
LB_46008:
	add r14,3
	cmp r14,r10
	jg LB_46013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_46013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_46013
	jmp LB_46014
LB_46013:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46010
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46010:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46011
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46011:
	jmp LB_45980
LB_46014:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_46016
LB_46015:
	add r14,1
LB_46016:
	cmp r14,r10
	jge LB_46017
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46015
	cmp al,10
	jz LB_46015
	cmp al,32
	jz LB_46015
LB_46017:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46018
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46019
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46019:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46020
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46020:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46021
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46021:
	jmp LB_45980
LB_46018:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_46024
LB_46023:
	add r14,1
LB_46024:
	cmp r14,r10
	jge LB_46025
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46023
	cmp al,10
	jz LB_46023
	cmp al,32
	jz LB_46023
LB_46025:
	add r14,1
	cmp r14,r10
	jg LB_46032
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_46032
	jmp LB_46033
LB_46032:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46027
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46027:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46028
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46028:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46029
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46029:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46030:
	jmp LB_45980
LB_46033:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_46035
LB_46034:
	add r14,1
LB_46035:
	cmp r14,r10
	jge LB_46036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46034
	cmp al,10
	jz LB_46034
	cmp al,32
	jz LB_46034
LB_46036:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46037
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_46038
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_46038:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46039
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46039:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46040
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46040:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46041
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46041:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46042
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46042:
	jmp LB_45980
LB_46037:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_46045
LB_46044:
	add r14,1
LB_46045:
	cmp r14,r10
	jge LB_46046
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46044
	cmp al,10
	jz LB_46044
	cmp al,32
	jz LB_46044
LB_46046:
	push r10
	call NS_E_45060_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46047
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_46048
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_46048:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_46049
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_46049:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46050
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46050:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46051
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46051:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46052
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46052:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46053
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46053:
	jmp LB_45980
LB_46047:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_45993
	btr r12,6
	jmp LB_45994
LB_45993:
	bts r12,6
LB_45994:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_45991
	btr r12,5
	jmp LB_45992
LB_45991:
	bts r12,5
LB_45992:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_45989
	btr r12,4
	jmp LB_45990
LB_45989:
	bts r12,4
LB_45990:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45987
	btr r12,3
	jmp LB_45988
LB_45987:
	bts r12,3
LB_45988:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45985
	btr r12,2
	jmp LB_45986
LB_45985:
	bts r12,2
LB_45986:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45983
	btr r12,1
	jmp LB_45984
LB_45983:
	bts r12,1
LB_45984:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45981
	btr r12,0
	jmp LB_45982
LB_45981:
	bts r12,0
LB_45982:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_45977
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_46055
	btr r12,7
	jmp LB_46056
LB_46055:
	bts r12,7
LB_46056:
	mov r10,rcx
	bt r12,6
	jc LB_46057
	btr r12,4
	jmp LB_46058
LB_46057:
	bts r12,4
LB_46058:
	mov rcx,r9
	bt r12,3
	jc LB_46059
	btr r12,6
	jmp LB_46060
LB_46059:
	bts r12,6
LB_46060:
	mov r9,r11
	bt r12,5
	jc LB_46061
	btr r12,3
	jmp LB_46062
LB_46061:
	bts r12,3
LB_46062:
	mov r11,r8
	bt r12,2
	jc LB_46063
	btr r12,5
	jmp LB_46064
LB_46063:
	bts r12,5
LB_46064:
	mov r8,rcx
	bt r12,6
	jc LB_46065
	btr r12,2
	jmp LB_46066
LB_46065:
	bts r12,2
LB_46066:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_45158 %_45159 } %_45160 } ⊢ %_45161 : %_45161
 ; {>  %_45156~0':_stg %_45159~3':_p41182 %_45160~4':(_lst)◂({ _stg _p41182 }) %_45158~2':_stg %_45157~1':_p45057 }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f41203 %_45161 ⊢ %_45162 : %_45162
 ; {>  %_45156~0':_stg %_45161~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p41182 }) %_45157~1':_p45057 }
; _f41203 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_45156 %_45162 } ⊢ %_45163 : %_45163
 ; {>  %_45156~0':_stg %_45162~°0◂°0◂{ { 2' 3' } 4' }:_p41168 %_45157~1':_p45057 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_45163
 ; {>  %_45163~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p41168 }) %_45157~1':_p45057 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_45950
	mov rdi,r14
	call dlt
LB_45950:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_45951
	btr r12,1
	jmp LB_45952
LB_45951:
	bts r12,1
LB_45952:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_45955
	btr r12,5
	jmp LB_45956
LB_45955:
	bts r12,5
LB_45956:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_45953
	btr QWORD [rdi],0
	jmp LB_45954
LB_45953:
	bts QWORD [rdi],0
LB_45954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_45967
	btr r12,6
	jmp LB_45968
LB_45967:
	bts r12,6
LB_45968:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_45965
	btr QWORD [rdi],0
	jmp LB_45966
LB_45965:
	bts QWORD [rdi],0
LB_45966:
	mov rcx,r14
	bt r12,1
	jc LB_45971
	btr r12,6
	jmp LB_45972
LB_45971:
	bts r12,6
LB_45972:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_45969
	btr QWORD [rdi],1
	jmp LB_45970
LB_45969:
	bts QWORD [rdi],1
LB_45970:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_45963
	btr QWORD [rdi],0
	jmp LB_45964
LB_45963:
	bts QWORD [rdi],0
LB_45964:
	mov r13,r10
	bt r12,4
	jc LB_45975
	btr r12,0
	jmp LB_45976
LB_45975:
	bts r12,0
LB_45976:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_45973
	btr QWORD [rdi],1
	jmp LB_45974
LB_45973:
	bts QWORD [rdi],1
LB_45974:
	mov rsi,1
	bt r12,5
	jc LB_45961
	mov rsi,0
	bt r11,0
	jc LB_45961
	jmp LB_45962
LB_45961:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_45962:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_45959
	mov rsi,0
	bt r11,0
	jc LB_45959
	jmp LB_45960
LB_45959:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_45960:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_45957
	btr QWORD [rdi],1
	jmp LB_45958
LB_45957:
	bts QWORD [rdi],1
LB_45958:
	mov r8,0
	bts r12,2
	ret
LB_45977:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_45979
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_45978
LB_45979:
	add rsp,8
	ret
LB_45980:
	add rsp,112
	pop r14
LB_45978:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45058:
NS_E_RDI_45058:
NS_E_45058_ETR_TBL:
NS_E_45058_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_46081
LB_46080:
	add r14,1
LB_46081:
	cmp r14,r10
	jge LB_46082
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46080
	cmp al,10
	jz LB_46080
	cmp al,32
	jz LB_46080
LB_46082:
	add r14,3
	cmp r14,r10
	jg LB_46085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_46085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_46085
	jmp LB_46086
LB_46085:
	jmp LB_46067
LB_46086:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_46075
LB_46074:
	add r14,1
LB_46075:
	cmp r14,r10
	jge LB_46076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46074
	cmp al,10
	jz LB_46074
	cmp al,32
	jz LB_46074
LB_46076:
	push r10
	call NS_E_44739_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46077
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46078
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46078:
	jmp LB_46068
LB_46077:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46071
	btr QWORD [rdi],1
LB_46071:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46072
	btr QWORD [rdi],0
LB_46072:
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
LB_46068:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46067:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_46069:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45059:
NS_E_RDI_45059:
NS_E_45059_ETR_TBL:
NS_E_45059_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_46140
LB_46139:
	add r14,1
LB_46140:
	cmp r14,r10
	jge LB_46141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46139
	cmp al,10
	jz LB_46139
	cmp al,32
	jz LB_46139
LB_46141:
	add r14,1
	cmp r14,r10
	jg LB_46144
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_46144
	jmp LB_46145
LB_46144:
	jmp LB_46106
LB_46145:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_46117
LB_46116:
	add r14,1
LB_46117:
	cmp r14,r10
	jge LB_46118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46116
	cmp al,10
	jz LB_46116
	cmp al,32
	jz LB_46116
LB_46118:
	add r14,1
	cmp r14,r10
	jg LB_46122
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_46122
	jmp LB_46123
LB_46122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46120
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46120:
	jmp LB_46107
LB_46123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_46125
LB_46124:
	add r14,1
LB_46125:
	cmp r14,r10
	jge LB_46126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46124
	cmp al,10
	jz LB_46124
	cmp al,32
	jz LB_46124
LB_46126:
	push r10
	call NS_E_45056_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46127
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46128
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46128:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46129
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46129:
	jmp LB_46107
LB_46127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_46132
LB_46131:
	add r14,1
LB_46132:
	cmp r14,r10
	jge LB_46133
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46131
	cmp al,10
	jz LB_46131
	cmp al,32
	jz LB_46131
LB_46133:
	push r10
	call NS_E_45059_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46134
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46135
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46135:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46136
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46136:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46137
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46137:
	jmp LB_46107
LB_46134:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46114
	btr r12,3
	jmp LB_46115
LB_46114:
	bts r12,3
LB_46115:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46112
	btr r12,2
	jmp LB_46113
LB_46112:
	bts r12,2
LB_46113:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46110
	btr r12,1
	jmp LB_46111
LB_46110:
	bts r12,1
LB_46111:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46108
	btr r12,0
	jmp LB_46109
LB_46108:
	bts r12,0
LB_46109:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_46103
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_46146
	btr r12,4
	jmp LB_46147
LB_46146:
	bts r12,4
LB_46147:
	mov r8,r9
	bt r12,3
	jc LB_46148
	btr r12,2
	jmp LB_46149
LB_46148:
	bts r12,2
LB_46149:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_46152
	btr r12,3
	jmp LB_46153
LB_46152:
	bts r12,3
LB_46153:
	mov r13,r9
	bt r12,3
	jc LB_46150
	btr r12,0
	jmp LB_46151
LB_46150:
	bts r12,0
LB_46151:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_46156
	btr r12,3
	jmp LB_46157
LB_46156:
	bts r12,3
LB_46157:
	mov r14,r9
	bt r12,3
	jc LB_46154
	btr r12,1
	jmp LB_46155
LB_46154:
	bts r12,1
LB_46155:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_45166 %_45167 } ⊢ %_45168 : %_45168
 ; {>  %_45166~{ 0' 1' }:{ _stg _p41168 } %_45167~2':(_lst)◂({ _stg _p41168 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_45168 ⊢ %_45169 : %_45169
 ; {>  %_45168~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p41168 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_45169
 ; {>  %_45169~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p41168 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_46093
	btr r12,5
	jmp LB_46094
LB_46093:
	bts r12,5
LB_46094:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_46091
	btr QWORD [rdi],0
	jmp LB_46092
LB_46091:
	bts QWORD [rdi],0
LB_46092:
	mov r11,r14
	bt r12,1
	jc LB_46097
	btr r12,5
	jmp LB_46098
LB_46097:
	bts r12,5
LB_46098:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_46095
	btr QWORD [rdi],1
	jmp LB_46096
LB_46095:
	bts QWORD [rdi],1
LB_46096:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46089
	btr QWORD [rdi],0
	jmp LB_46090
LB_46089:
	bts QWORD [rdi],0
LB_46090:
	mov r10,r8
	bt r12,2
	jc LB_46101
	btr r12,4
	jmp LB_46102
LB_46101:
	bts r12,4
LB_46102:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46099
	btr QWORD [rdi],1
	jmp LB_46100
LB_46099:
	bts QWORD [rdi],1
LB_46100:
	mov rsi,1
	bt r12,3
	jc LB_46087
	mov rsi,0
	bt r9,0
	jc LB_46087
	jmp LB_46088
LB_46087:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46088:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46103:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46105
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46104
LB_46105:
	add rsp,8
	ret
LB_46107:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46106:
	add rsp,64
	pop r14
LB_46104:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_46160
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_45170 : %_45170
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_45170 ⊢ %_45171 : %_45171
 ; {>  %_45170~°1◂{  }:(_lst)◂(t17592'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45171
 ; {>  %_45171~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17595'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_46158
	mov rsi,0
	bt r9,0
	jc LB_46158
	jmp LB_46159
LB_46158:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46159:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46160:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46162
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46161
LB_46162:
	add rsp,8
	ret
LB_46163:
	add rsp,0
	pop r14
LB_46161:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45060:
NS_E_RDI_45060:
NS_E_45060_ETR_TBL:
NS_E_45060_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_46228
LB_46227:
	add r14,1
LB_46228:
	cmp r14,r10
	jge LB_46229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46227
	cmp al,10
	jz LB_46227
	cmp al,32
	jz LB_46227
LB_46229:
	add r14,3
	cmp r14,r10
	jg LB_46232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_46232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_46232
	jmp LB_46233
LB_46232:
	jmp LB_46183
LB_46233:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_46196
LB_46195:
	add r14,1
LB_46196:
	cmp r14,r10
	jge LB_46197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46195
	cmp al,10
	jz LB_46195
	cmp al,32
	jz LB_46195
LB_46197:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46199:
	jmp LB_46184
LB_46198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_46202
LB_46201:
	add r14,1
LB_46202:
	cmp r14,r10
	jge LB_46203
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46201
	cmp al,10
	jz LB_46201
	cmp al,32
	jz LB_46201
LB_46203:
	add r14,1
	cmp r14,r10
	jg LB_46208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_46208
	jmp LB_46209
LB_46208:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46205
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46205:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46206
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46206:
	jmp LB_46184
LB_46209:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_46211
LB_46210:
	add r14,1
LB_46211:
	cmp r14,r10
	jge LB_46212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46210
	cmp al,10
	jz LB_46210
	cmp al,32
	jz LB_46210
LB_46212:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46213
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46214
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46214:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46215
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46215:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46216
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46216:
	jmp LB_46184
LB_46213:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_46219
LB_46218:
	add r14,1
LB_46219:
	cmp r14,r10
	jge LB_46220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46218
	cmp al,10
	jz LB_46218
	cmp al,32
	jz LB_46218
LB_46220:
	push r10
	call NS_E_45060_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46222
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46222:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46223
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46223:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46224
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46224:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46225:
	jmp LB_46184
LB_46221:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_46193
	btr r12,4
	jmp LB_46194
LB_46193:
	bts r12,4
LB_46194:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46191
	btr r12,3
	jmp LB_46192
LB_46191:
	bts r12,3
LB_46192:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46189
	btr r12,2
	jmp LB_46190
LB_46189:
	bts r12,2
LB_46190:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46187
	btr r12,1
	jmp LB_46188
LB_46187:
	bts r12,1
LB_46188:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46185
	btr r12,0
	jmp LB_46186
LB_46185:
	bts r12,0
LB_46186:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_46180
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_46234
	btr r12,5
	jmp LB_46235
LB_46234:
	bts r12,5
LB_46235:
	mov r8,r10
	bt r12,4
	jc LB_46236
	btr r12,2
	jmp LB_46237
LB_46236:
	bts r12,2
LB_46237:
	mov r10,r14
	bt r12,1
	jc LB_46238
	btr r12,4
	jmp LB_46239
LB_46238:
	bts r12,4
LB_46239:
	mov r14,r9
	bt r12,3
	jc LB_46240
	btr r12,1
	jmp LB_46241
LB_46240:
	bts r12,1
LB_46241:
	mov r9,r13
	bt r12,0
	jc LB_46242
	btr r12,3
	jmp LB_46243
LB_46242:
	bts r12,3
LB_46243:
	mov r13,r10
	bt r12,4
	jc LB_46244
	btr r12,0
	jmp LB_46245
LB_46244:
	bts r12,0
LB_46245:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_45172 %_45173 } %_45174 } ⊢ %_45175 : %_45175
 ; {>  %_45174~2':(_lst)◂({ _stg _p41182 }) %_45173~1':_p41182 %_45172~0':_stg }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_45175 ⊢ %_45176 : %_45176
 ; {>  %_45175~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p41182 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_45176
 ; {>  %_45176~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p41182 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_46170
	btr r12,5
	jmp LB_46171
LB_46170:
	bts r12,5
LB_46171:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_46168
	btr QWORD [rdi],0
	jmp LB_46169
LB_46168:
	bts QWORD [rdi],0
LB_46169:
	mov r11,r14
	bt r12,1
	jc LB_46174
	btr r12,5
	jmp LB_46175
LB_46174:
	bts r12,5
LB_46175:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_46172
	btr QWORD [rdi],1
	jmp LB_46173
LB_46172:
	bts QWORD [rdi],1
LB_46173:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46166
	btr QWORD [rdi],0
	jmp LB_46167
LB_46166:
	bts QWORD [rdi],0
LB_46167:
	mov r10,r8
	bt r12,2
	jc LB_46178
	btr r12,4
	jmp LB_46179
LB_46178:
	bts r12,4
LB_46179:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46176
	btr QWORD [rdi],1
	jmp LB_46177
LB_46176:
	bts QWORD [rdi],1
LB_46177:
	mov rsi,1
	bt r12,3
	jc LB_46164
	mov rsi,0
	bt r9,0
	jc LB_46164
	jmp LB_46165
LB_46164:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46165:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46180:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46182
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46181
LB_46182:
	add rsp,8
	ret
LB_46184:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46183:
	add rsp,80
	pop r14
LB_46181:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_46248
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_45177 : %_45177
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_45177 ⊢ %_45178 : %_45178
 ; {>  %_45177~°1◂{  }:(_lst)◂(t17606'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45178
 ; {>  %_45178~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17609'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_46246
	mov rsi,0
	bt r9,0
	jc LB_46246
	jmp LB_46247
LB_46246:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46247:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46248:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46250
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46249
LB_46250:
	add rsp,8
	ret
LB_46251:
	add rsp,0
	pop r14
LB_46249:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45061:
NS_E_RDI_45061:
NS_E_45061_ETR_TBL:
NS_E_45061_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_46342
LB_46341:
	add r14,1
LB_46342:
	cmp r14,r10
	jge LB_46343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46341
	cmp al,10
	jz LB_46341
	cmp al,32
	jz LB_46341
LB_46343:
	add r14,1
	cmp r14,r10
	jg LB_46346
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_46346
	jmp LB_46347
LB_46346:
	jmp LB_46289
LB_46347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_46304
LB_46303:
	add r14,1
LB_46304:
	cmp r14,r10
	jge LB_46305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46303
	cmp al,10
	jz LB_46303
	cmp al,32
	jz LB_46303
LB_46305:
	add r14,1
	cmp r14,r10
	jg LB_46309
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_46309
	jmp LB_46310
LB_46309:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46307
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46307:
	jmp LB_46290
LB_46310:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_46312
LB_46311:
	add r14,1
LB_46312:
	cmp r14,r10
	jge LB_46313
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46311
	cmp al,10
	jz LB_46311
	cmp al,32
	jz LB_46311
LB_46313:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46314
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46315
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46315:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46316
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46316:
	jmp LB_46290
LB_46314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_46319
LB_46318:
	add r14,1
LB_46319:
	cmp r14,r10
	jge LB_46320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46318
	cmp al,10
	jz LB_46318
	cmp al,32
	jz LB_46318
LB_46320:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46321
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46322
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46322:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46323
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46324
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46324:
	jmp LB_46290
LB_46321:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_46327
LB_46326:
	add r14,1
LB_46327:
	cmp r14,r10
	jge LB_46328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46326
	cmp al,10
	jz LB_46326
	cmp al,32
	jz LB_46326
LB_46328:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46330
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46330:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46331
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46331:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46332
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46332:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46333:
	jmp LB_46290
LB_46329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_46339:
	jmp LB_46336
LB_46335:
	add r14,1
LB_46336:
	cmp r14,r10
	jge LB_46337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46335
	cmp al,10
	jz LB_46335
	cmp al,32
	jz LB_46335
LB_46337:
	push r10
	push rsi
	call NS_E_45062_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_46338
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_46340
	bts QWORD [rax],0
LB_46340:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_46339
LB_46338:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_46301
	btr r12,5
	jmp LB_46302
LB_46301:
	bts r12,5
LB_46302:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_46299
	btr r12,4
	jmp LB_46300
LB_46299:
	bts r12,4
LB_46300:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46297
	btr r12,3
	jmp LB_46298
LB_46297:
	bts r12,3
LB_46298:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46295
	btr r12,2
	jmp LB_46296
LB_46295:
	bts r12,2
LB_46296:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46293
	btr r12,1
	jmp LB_46294
LB_46293:
	bts r12,1
LB_46294:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46291
	btr r12,0
	jmp LB_46292
LB_46291:
	bts r12,0
LB_46292:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_46286
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_46348
	btr r12,6
	jmp LB_46349
LB_46348:
	bts r12,6
LB_46349:
	mov r9,r11
	bt r12,5
	jc LB_46350
	btr r12,3
	jmp LB_46351
LB_46350:
	bts r12,3
LB_46351:
	mov r11,r8
	bt r12,2
	jc LB_46352
	btr r12,5
	jmp LB_46353
LB_46352:
	bts r12,5
LB_46353:
	mov r8,r10
	bt r12,4
	jc LB_46354
	btr r12,2
	jmp LB_46355
LB_46354:
	bts r12,2
LB_46355:
	mov r10,r14
	bt r12,1
	jc LB_46356
	btr r12,4
	jmp LB_46357
LB_46356:
	bts r12,4
LB_46357:
	mov r14,rcx
	bt r12,6
	jc LB_46358
	btr r12,1
	jmp LB_46359
LB_46358:
	bts r12,1
LB_46359:
	mov rcx,r13
	bt r12,0
	jc LB_46360
	btr r12,6
	jmp LB_46361
LB_46360:
	bts r12,6
LB_46361:
	mov r13,r11
	bt r12,5
	jc LB_46362
	btr r12,0
	jmp LB_46363
LB_46362:
	bts r12,0
LB_46363:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f40503 %_45182 ⊢ %_45183 : %_45183
 ; {>  %_45181~2':_p41184 %_45182~3':(_lst)◂({ _stg _p41181 _p41184 }) %_45179~0':_stg %_45180~1':_p41181 }
; _f40503 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_46258
	btr r12,0
	jmp LB_46259
LB_46258:
	bts r12,0
LB_46259:
	call NS_E_40503
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_46260
	btr r12,3
	jmp LB_46261
LB_46260:
	bts r12,3
LB_46261:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_46256
	btr r12,2
	jmp LB_46257
LB_46256:
	bts r12,2
LB_46257:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_46254
	btr r12,1
	jmp LB_46255
LB_46254:
	bts r12,1
LB_46255:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_46252
	btr r12,0
	jmp LB_46253
LB_46252:
	bts r12,0
LB_46253:
	add rsp,32
; _cns { { %_45179 %_45180 %_45181 } %_45183 } ⊢ %_45184 : %_45184
 ; {>  %_45183~3':(_lst)◂({ _stg _p41181 _p41184 }) %_45181~2':_p41184 %_45179~0':_stg %_45180~1':_p41181 }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f41195 %_45184 ⊢ %_45185 : %_45185
 ; {>  %_45184~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg _p41181 _p41184 }) }
; _f41195 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_45185 ⊢ %_45186 : %_45186
 ; {>  %_45185~°3◂°0◂{ { 0' 1' 2' } 3' }:_p41165 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_45186
 ; {>  %_45186~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p41165) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_46262
	btr r12,4
	jmp LB_46263
LB_46262:
	bts r12,4
LB_46263:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_46272
	btr r12,6
	jmp LB_46273
LB_46272:
	bts r12,6
LB_46273:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_46270
	btr QWORD [rdi],0
	jmp LB_46271
LB_46270:
	bts QWORD [rdi],0
LB_46271:
	mov rcx,r14
	bt r12,1
	jc LB_46276
	btr r12,6
	jmp LB_46277
LB_46276:
	bts r12,6
LB_46277:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_46274
	btr QWORD [rdi],1
	jmp LB_46275
LB_46274:
	bts QWORD [rdi],1
LB_46275:
	mov rcx,r8
	bt r12,2
	jc LB_46280
	btr r12,6
	jmp LB_46281
LB_46280:
	bts r12,6
LB_46281:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_46278
	btr QWORD [rdi],2
	jmp LB_46279
LB_46278:
	bts QWORD [rdi],2
LB_46279:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_46268
	btr QWORD [rdi],0
	jmp LB_46269
LB_46268:
	bts QWORD [rdi],0
LB_46269:
	mov r11,r10
	bt r12,4
	jc LB_46284
	btr r12,5
	jmp LB_46285
LB_46284:
	bts r12,5
LB_46285:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_46282
	btr QWORD [rdi],1
	jmp LB_46283
LB_46282:
	bts QWORD [rdi],1
LB_46283:
	mov rsi,1
	bt r12,3
	jc LB_46266
	mov rsi,0
	bt r9,0
	jc LB_46266
	jmp LB_46267
LB_46266:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46267:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_46264
	mov rsi,0
	bt r9,0
	jc LB_46264
	jmp LB_46265
LB_46264:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46265:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46286:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46288
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46287
LB_46288:
	add rsp,8
	ret
LB_46290:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46289:
	add rsp,96
	pop r14
LB_46287:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_46383
LB_46382:
	add r14,1
LB_46383:
	cmp r14,r10
	jge LB_46384
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46382
	cmp al,10
	jz LB_46382
	cmp al,32
	jz LB_46382
LB_46384:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46385
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46377
LB_46385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_46388
LB_46387:
	add r14,1
LB_46388:
	cmp r14,r10
	jge LB_46389
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46387
	cmp al,10
	jz LB_46387
	cmp al,32
	jz LB_46387
LB_46389:
	push r10
	call NS_E_45063_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46390
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46391
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46391:
	jmp LB_46377
LB_46390:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46380
	btr r12,1
	jmp LB_46381
LB_46380:
	bts r12,1
LB_46381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46378
	btr r12,0
	jmp LB_46379
LB_46378:
	bts r12,0
LB_46379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46374
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f41194 { %_45187 %_45188 } ⊢ %_45189 : %_45189
 ; {>  %_45187~0':_stg %_45188~1':_p41167 }
; _f41194 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_45189 ⊢ %_45190 : %_45190
 ; {>  %_45189~°2◂{ 0' 1' }:_p41165 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_45190
 ; {>  %_45190~°0◂°2◂{ 0' 1' }:(_opn)◂(_p41165) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_46368
	btr r12,2
	jmp LB_46369
LB_46368:
	bts r12,2
LB_46369:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_46366
	btr QWORD [rdi],0
	jmp LB_46367
LB_46366:
	bts QWORD [rdi],0
LB_46367:
	mov r8,r14
	bt r12,1
	jc LB_46372
	btr r12,2
	jmp LB_46373
LB_46372:
	bts r12,2
LB_46373:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_46370
	btr QWORD [rdi],1
	jmp LB_46371
LB_46370:
	bts QWORD [rdi],1
LB_46371:
	mov rsi,1
	bt r12,3
	jc LB_46364
	mov rsi,0
	bt r9,0
	jc LB_46364
	jmp LB_46365
LB_46364:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46365:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46374:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46376
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46375
LB_46376:
	add rsp,8
	ret
LB_46377:
	add rsp,32
	pop r14
LB_46375:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_46394
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_45191
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_45191 ⊢ %_45192 : %_45192
 ; {>  %_45191~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_45193 : %_45193
 ; {>  %_45192~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_45193
 ; {>  %_45193~°1◂{  }:(_opn)◂(t17632'(0)) %_45192~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_46393
	mov rdi,r13
	call dlt
LB_46393:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_46394:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46396
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46395
LB_46396:
	add rsp,8
	ret
LB_46397:
	add rsp,0
	pop r14
LB_46395:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45062:
NS_E_RDI_45062:
NS_E_45062_ETR_TBL:
NS_E_45062_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_46425
LB_46424:
	add r14,1
LB_46425:
	cmp r14,r10
	jge LB_46426
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46424
	cmp al,10
	jz LB_46424
	cmp al,32
	jz LB_46424
LB_46426:
	add r14,1
	cmp r14,r10
	jg LB_46429
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_46429
	jmp LB_46430
LB_46429:
	jmp LB_46413
LB_46430:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_46432
LB_46431:
	add r14,1
LB_46432:
	cmp r14,r10
	jge LB_46433
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46431
	cmp al,10
	jz LB_46431
	cmp al,32
	jz LB_46431
LB_46433:
	add r14,1
	cmp r14,r10
	jg LB_46437
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_46437
	jmp LB_46438
LB_46437:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46435
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46435:
	jmp LB_46413
LB_46438:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_46440
LB_46439:
	add r14,1
LB_46440:
	cmp r14,r10
	jge LB_46441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46439
	cmp al,10
	jz LB_46439
	cmp al,32
	jz LB_46439
LB_46441:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46442
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46443
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46443:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46444
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46444:
	jmp LB_46413
LB_46442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_46447
LB_46446:
	add r14,1
LB_46447:
	cmp r14,r10
	jge LB_46448
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46446
	cmp al,10
	jz LB_46446
	cmp al,32
	jz LB_46446
LB_46448:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46449
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46450
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46450:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46451
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46451:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46452
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46452:
	jmp LB_46413
LB_46449:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_46455
LB_46454:
	add r14,1
LB_46455:
	cmp r14,r10
	jge LB_46456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46454
	cmp al,10
	jz LB_46454
	cmp al,32
	jz LB_46454
LB_46456:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46457
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46458
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46458:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46459
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46459:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46460
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46460:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46461
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46461:
	jmp LB_46413
LB_46457:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_46422
	btr r12,4
	jmp LB_46423
LB_46422:
	bts r12,4
LB_46423:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46420
	btr r12,3
	jmp LB_46421
LB_46420:
	bts r12,3
LB_46421:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46418
	btr r12,2
	jmp LB_46419
LB_46418:
	bts r12,2
LB_46419:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46416
	btr r12,1
	jmp LB_46417
LB_46416:
	bts r12,1
LB_46417:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46414
	btr r12,0
	jmp LB_46415
LB_46414:
	bts r12,0
LB_46415:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_46410
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_46463
	btr r12,5
	jmp LB_46464
LB_46463:
	bts r12,5
LB_46464:
	mov r8,r10
	bt r12,4
	jc LB_46465
	btr r12,2
	jmp LB_46466
LB_46465:
	bts r12,2
LB_46466:
	mov r10,r14
	bt r12,1
	jc LB_46467
	btr r12,4
	jmp LB_46468
LB_46467:
	bts r12,4
LB_46468:
	mov r14,r9
	bt r12,3
	jc LB_46469
	btr r12,1
	jmp LB_46470
LB_46469:
	bts r12,1
LB_46470:
	mov r9,r13
	bt r12,0
	jc LB_46471
	btr r12,3
	jmp LB_46472
LB_46471:
	bts r12,3
LB_46472:
	mov r13,r11
	bt r12,5
	jc LB_46473
	btr r12,0
	jmp LB_46474
LB_46473:
	bts r12,0
LB_46474:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_45194 %_45195 %_45196 } ⊢ %_45197 : %_45197
 ; {>  %_45195~1':_p41181 %_45196~2':_p41184 %_45194~0':_stg }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_45197
 ; {>  %_45197~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg _p41181 _p41184 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_46400
	btr r12,4
	jmp LB_46401
LB_46400:
	bts r12,4
LB_46401:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46398
	btr QWORD [rdi],0
	jmp LB_46399
LB_46398:
	bts QWORD [rdi],0
LB_46399:
	mov r10,r14
	bt r12,1
	jc LB_46404
	btr r12,4
	jmp LB_46405
LB_46404:
	bts r12,4
LB_46405:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46402
	btr QWORD [rdi],1
	jmp LB_46403
LB_46402:
	bts QWORD [rdi],1
LB_46403:
	mov r10,r8
	bt r12,2
	jc LB_46408
	btr r12,4
	jmp LB_46409
LB_46408:
	bts r12,4
LB_46409:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_46406
	btr QWORD [rdi],2
	jmp LB_46407
LB_46406:
	bts QWORD [rdi],2
LB_46407:
	mov r8,0
	bts r12,2
	ret
LB_46410:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46412
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46411
LB_46412:
	add rsp,8
	ret
LB_46413:
	add rsp,80
	pop r14
LB_46411:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45063:
NS_E_RDI_45063:
NS_E_45063_ETR_TBL:
NS_E_45063_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_46495
LB_46494:
	add r14,1
LB_46495:
	cmp r14,r10
	jge LB_46496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46494
	cmp al,10
	jz LB_46494
	cmp al,32
	jz LB_46494
LB_46496:
	add r14,1
	cmp r14,r10
	jg LB_46499
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_46499
	jmp LB_46500
LB_46499:
	jmp LB_46482
LB_46500:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_46489
LB_46488:
	add r14,1
LB_46489:
	cmp r14,r10
	jge LB_46490
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46488
	cmp al,10
	jz LB_46488
	cmp al,32
	jz LB_46488
LB_46490:
	push r10
	call NS_E_44072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46491
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46492
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46492:
	jmp LB_46483
LB_46491:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46486
	btr r12,1
	jmp LB_46487
LB_46486:
	bts r12,1
LB_46487:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46484
	btr r12,0
	jmp LB_46485
LB_46484:
	bts r12,0
LB_46485:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46479
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_46501
	btr r12,2
	jmp LB_46502
LB_46501:
	bts r12,2
LB_46502:
	mov r13,r14
	bt r12,1
	jc LB_46503
	btr r12,0
	jmp LB_46504
LB_46503:
	bts r12,0
LB_46504:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41201 %_45198 ⊢ %_45199 : %_45199
 ; {>  %_45198~0':_p41183 }
; _f41201 0' ⊢ °1◂0'
; _some %_45199 ⊢ %_45200 : %_45200
 ; {>  %_45199~°1◂0':_p41167 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45200
 ; {>  %_45200~°0◂°1◂0':(_opn)◂(_p41167) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_46477
	btr r12,3
	jmp LB_46478
LB_46477:
	bts r12,3
LB_46478:
	mov rsi,1
	bt r12,3
	jc LB_46475
	mov rsi,0
	bt r9,0
	jc LB_46475
	jmp LB_46476
LB_46475:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46476:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46481
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46480
LB_46481:
	add rsp,8
	ret
LB_46483:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46482:
	add rsp,32
	pop r14
LB_46480:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_46525
LB_46524:
	add r14,1
LB_46525:
	cmp r14,r10
	jge LB_46526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46524
	cmp al,10
	jz LB_46524
	cmp al,32
	jz LB_46524
LB_46526:
	add r14,2
	cmp r14,r10
	jg LB_46529
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_46529
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_46529
	jmp LB_46530
LB_46529:
	jmp LB_46512
LB_46530:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_46519
LB_46518:
	add r14,1
LB_46519:
	cmp r14,r10
	jge LB_46520
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46518
	cmp al,10
	jz LB_46518
	cmp al,32
	jz LB_46518
LB_46520:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46521
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46522
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46522:
	jmp LB_46513
LB_46521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46516
	btr r12,1
	jmp LB_46517
LB_46516:
	bts r12,1
LB_46517:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46514
	btr r12,0
	jmp LB_46515
LB_46514:
	bts r12,0
LB_46515:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46509
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_46531
	btr r12,2
	jmp LB_46532
LB_46531:
	bts r12,2
LB_46532:
	mov r13,r14
	bt r12,1
	jc LB_46533
	btr r12,0
	jmp LB_46534
LB_46533:
	bts r12,0
LB_46534:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41202 %_45201 ⊢ %_45202 : %_45202
 ; {>  %_45201~0':_p41184 }
; _f41202 0' ⊢ °2◂0'
; _some %_45202 ⊢ %_45203 : %_45203
 ; {>  %_45202~°2◂0':_p41167 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_45203
 ; {>  %_45203~°0◂°2◂0':(_opn)◂(_p41167) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_46507
	btr r12,3
	jmp LB_46508
LB_46507:
	bts r12,3
LB_46508:
	mov rsi,1
	bt r12,3
	jc LB_46505
	mov rsi,0
	bt r9,0
	jc LB_46505
	jmp LB_46506
LB_46505:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46506:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46509:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46511
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46510
LB_46511:
	add rsp,8
	ret
LB_46513:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46512:
	add rsp,32
	pop r14
LB_46510:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_46554
LB_46553:
	add r14,1
LB_46554:
	cmp r14,r10
	jge LB_46555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46553
	cmp al,10
	jz LB_46553
	cmp al,32
	jz LB_46553
LB_46555:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46556
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46548
LB_46556:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_46559
LB_46558:
	add r14,1
LB_46559:
	cmp r14,r10
	jge LB_46560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46558
	cmp al,10
	jz LB_46558
	cmp al,32
	jz LB_46558
LB_46560:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46561
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46562
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46562:
	jmp LB_46548
LB_46561:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46551
	btr r12,1
	jmp LB_46552
LB_46551:
	bts r12,1
LB_46552:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46549
	btr r12,0
	jmp LB_46550
LB_46549:
	bts r12,0
LB_46550:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46545
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f41200 { %_45204 %_45205 } ⊢ %_45206 : %_45206
 ; {>  %_45204~0':_p41181 %_45205~1':_p41184 }
; _f41200 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45206 ⊢ %_45207 : %_45207
 ; {>  %_45206~°0◂{ 0' 1' }:_p41167 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45207
 ; {>  %_45207~°0◂°0◂{ 0' 1' }:(_opn)◂(_p41167) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_46539
	btr r12,2
	jmp LB_46540
LB_46539:
	bts r12,2
LB_46540:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_46537
	btr QWORD [rdi],0
	jmp LB_46538
LB_46537:
	bts QWORD [rdi],0
LB_46538:
	mov r8,r14
	bt r12,1
	jc LB_46543
	btr r12,2
	jmp LB_46544
LB_46543:
	bts r12,2
LB_46544:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_46541
	btr QWORD [rdi],1
	jmp LB_46542
LB_46541:
	bts QWORD [rdi],1
LB_46542:
	mov rsi,1
	bt r12,3
	jc LB_46535
	mov rsi,0
	bt r9,0
	jc LB_46535
	jmp LB_46536
LB_46535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46536:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46545:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46547
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46546
LB_46547:
	add rsp,8
	ret
LB_46548:
	add rsp,32
	pop r14
LB_46546:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45064:
NS_E_RDI_45064:
NS_E_45064_ETR_TBL:
NS_E_45064_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_46584
LB_46583:
	add r14,1
LB_46584:
	cmp r14,r10
	jge LB_46585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46583
	cmp al,10
	jz LB_46583
	cmp al,32
	jz LB_46583
LB_46585:
	add r14,3
	cmp r14,r10
	jg LB_46588
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46588
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_46588
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_46588
	jmp LB_46589
LB_46588:
	jmp LB_46571
LB_46589:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_46578
LB_46577:
	add r14,1
LB_46578:
	cmp r14,r10
	jge LB_46579
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46577
	cmp al,10
	jz LB_46577
	cmp al,32
	jz LB_46577
LB_46579:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46580
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46581
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46581:
	jmp LB_46572
LB_46580:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46575
	btr r12,1
	jmp LB_46576
LB_46575:
	bts r12,1
LB_46576:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46573
	btr r12,0
	jmp LB_46574
LB_46573:
	bts r12,0
LB_46574:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46568
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_46590
	btr r12,2
	jmp LB_46591
LB_46590:
	bts r12,2
LB_46591:
	mov r13,r14
	bt r12,1
	jc LB_46592
	btr r12,0
	jmp LB_46593
LB_46592:
	bts r12,0
LB_46593:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41243 %_45208 ⊢ %_45209 : %_45209
 ; {>  %_45208~0':_p41180 }
; _f41243 0' ⊢ °2◂0'
; _some %_45209 ⊢ %_45210 : %_45210
 ; {>  %_45209~°2◂0':_p41184 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_45210
 ; {>  %_45210~°0◂°2◂0':(_opn)◂(_p41184) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_46566
	btr r12,3
	jmp LB_46567
LB_46566:
	bts r12,3
LB_46567:
	mov rsi,1
	bt r12,3
	jc LB_46564
	mov rsi,0
	bt r9,0
	jc LB_46564
	jmp LB_46565
LB_46564:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46565:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46568:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46570
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46569
LB_46570:
	add rsp,8
	ret
LB_46572:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46571:
	add rsp,32
	pop r14
LB_46569:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_46605
LB_46604:
	add r14,1
LB_46605:
	cmp r14,r10
	jge LB_46606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46604
	cmp al,10
	jz LB_46604
	cmp al,32
	jz LB_46604
LB_46606:
	push r10
	call NS_E_45073_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46607
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46601
LB_46607:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46602
	btr r12,0
	jmp LB_46603
LB_46602:
	bts r12,0
LB_46603:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_46598
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41242 %_45211 ⊢ %_45212 : %_45212
 ; {>  %_45211~0':_p41185 }
; _f41242 0' ⊢ °1◂0'
; _some %_45212 ⊢ %_45213 : %_45213
 ; {>  %_45212~°1◂0':_p41184 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45213
 ; {>  %_45213~°0◂°1◂0':(_opn)◂(_p41184) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_46596
	btr r12,3
	jmp LB_46597
LB_46596:
	bts r12,3
LB_46597:
	mov rsi,1
	bt r12,3
	jc LB_46594
	mov rsi,0
	bt r9,0
	jc LB_46594
	jmp LB_46595
LB_46594:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46595:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46598:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46600
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46599
LB_46600:
	add rsp,8
	ret
LB_46601:
	add rsp,16
	pop r14
LB_46599:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_46640
LB_46639:
	add r14,1
LB_46640:
	cmp r14,r10
	jge LB_46641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46639
	cmp al,10
	jz LB_46639
	cmp al,32
	jz LB_46639
LB_46641:
	push r10
	call NS_E_45065_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46642
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46634
LB_46642:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_46645
LB_46644:
	add r14,1
LB_46645:
	cmp r14,r10
	jge LB_46646
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46644
	cmp al,10
	jz LB_46644
	cmp al,32
	jz LB_46644
LB_46646:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46647
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46648
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46648:
	jmp LB_46634
LB_46647:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46637
	btr r12,1
	jmp LB_46638
LB_46637:
	bts r12,1
LB_46638:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46635
	btr r12,0
	jmp LB_46636
LB_46635:
	bts r12,0
LB_46636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46631
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_46650
	btr r12,3
	jmp LB_46651
LB_46650:
	bts r12,3
LB_46651:
	mov r10,r13
	bt r12,0
	jc LB_46652
	btr r12,4
	jmp LB_46653
LB_46652:
	bts r12,4
LB_46653:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_46656
	btr r12,5
	jmp LB_46657
LB_46656:
	bts r12,5
LB_46657:
	mov r13,r11
	bt r12,5
	jc LB_46654
	btr r12,0
	jmp LB_46655
LB_46654:
	bts r12,0
LB_46655:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_46660
	btr r12,5
	jmp LB_46661
LB_46660:
	bts r12,5
LB_46661:
	mov r14,r11
	bt r12,5
	jc LB_46658
	btr r12,1
	jmp LB_46659
LB_46658:
	bts r12,1
LB_46659:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_46664
	btr r12,5
	jmp LB_46665
LB_46664:
	bts r12,5
LB_46665:
	mov r8,r11
	bt r12,5
	jc LB_46662
	btr r12,2
	jmp LB_46663
LB_46662:
	bts r12,2
LB_46663:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f41241 { %_45214 %_45215 } ⊢ %_45216 : %_45216
 ; {>  %_45214~{ 0' 1' 2' }:{ _p41189 _p41180 _p41181 } %_45215~3':_p41184 }
; _f41241 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_45216 ⊢ %_45217 : %_45217
 ; {>  %_45216~°0◂{ { 0' 1' 2' } 3' }:_p41184 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_45217
 ; {>  %_45217~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p41184) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_46609
	btr r12,4
	jmp LB_46610
LB_46609:
	bts r12,4
LB_46610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_46617
	btr r12,6
	jmp LB_46618
LB_46617:
	bts r12,6
LB_46618:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_46615
	btr QWORD [rdi],0
	jmp LB_46616
LB_46615:
	bts QWORD [rdi],0
LB_46616:
	mov rcx,r14
	bt r12,1
	jc LB_46621
	btr r12,6
	jmp LB_46622
LB_46621:
	bts r12,6
LB_46622:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_46619
	btr QWORD [rdi],1
	jmp LB_46620
LB_46619:
	bts QWORD [rdi],1
LB_46620:
	mov rcx,r8
	bt r12,2
	jc LB_46625
	btr r12,6
	jmp LB_46626
LB_46625:
	bts r12,6
LB_46626:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_46623
	btr QWORD [rdi],2
	jmp LB_46624
LB_46623:
	bts QWORD [rdi],2
LB_46624:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_46613
	btr QWORD [rdi],0
	jmp LB_46614
LB_46613:
	bts QWORD [rdi],0
LB_46614:
	mov r11,r10
	bt r12,4
	jc LB_46629
	btr r12,5
	jmp LB_46630
LB_46629:
	bts r12,5
LB_46630:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_46627
	btr QWORD [rdi],1
	jmp LB_46628
LB_46627:
	bts QWORD [rdi],1
LB_46628:
	mov rsi,1
	bt r12,3
	jc LB_46611
	mov rsi,0
	bt r9,0
	jc LB_46611
	jmp LB_46612
LB_46611:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_46612:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_46631:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46633
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46632
LB_46633:
	add rsp,8
	ret
LB_46634:
	add rsp,32
	pop r14
LB_46632:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45065:
NS_E_RDI_45065:
NS_E_45065_ETR_TBL:
NS_E_45065_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_46731
LB_46730:
	add r14,1
LB_46731:
	cmp r14,r10
	jge LB_46732
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46730
	cmp al,10
	jz LB_46730
	cmp al,32
	jz LB_46730
LB_46732:
	add r14,1
	cmp r14,r10
	jg LB_46735
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_46735
	jmp LB_46736
LB_46735:
	jmp LB_46686
LB_46736:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_46699
LB_46698:
	add r14,1
LB_46699:
	cmp r14,r10
	jge LB_46700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46698
	cmp al,10
	jz LB_46698
	cmp al,32
	jz LB_46698
LB_46700:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46701
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46702:
	jmp LB_46687
LB_46701:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_46705
LB_46704:
	add r14,1
LB_46705:
	cmp r14,r10
	jge LB_46706
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46704
	cmp al,10
	jz LB_46704
	cmp al,32
	jz LB_46704
LB_46706:
	add r14,3
	cmp r14,r10
	jg LB_46711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46711
	jmp LB_46712
LB_46711:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46708
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46708:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46709
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46709:
	jmp LB_46687
LB_46712:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_46714
LB_46713:
	add r14,1
LB_46714:
	cmp r14,r10
	jge LB_46715
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46713
	cmp al,10
	jz LB_46713
	cmp al,32
	jz LB_46713
LB_46715:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46716
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46717
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46717:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46718
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46718:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46719
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46719:
	jmp LB_46687
LB_46716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_46722
LB_46721:
	add r14,1
LB_46722:
	cmp r14,r10
	jge LB_46723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46721
	cmp al,10
	jz LB_46721
	cmp al,32
	jz LB_46721
LB_46723:
	push r10
	call NS_E_44468_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46724
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46725
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46725:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46726
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46726:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46727
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46727:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46728
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46728:
	jmp LB_46687
LB_46724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_46696
	btr r12,4
	jmp LB_46697
LB_46696:
	bts r12,4
LB_46697:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46694
	btr r12,3
	jmp LB_46695
LB_46694:
	bts r12,3
LB_46695:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46692
	btr r12,2
	jmp LB_46693
LB_46692:
	bts r12,2
LB_46693:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46690
	btr r12,1
	jmp LB_46691
LB_46690:
	bts r12,1
LB_46691:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46688
	btr r12,0
	jmp LB_46689
LB_46688:
	bts r12,0
LB_46689:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_46683
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_46737
	btr r12,5
	jmp LB_46738
LB_46737:
	bts r12,5
LB_46738:
	mov r8,r10
	bt r12,4
	jc LB_46739
	btr r12,2
	jmp LB_46740
LB_46739:
	bts r12,2
LB_46740:
	mov r10,r14
	bt r12,1
	jc LB_46741
	btr r12,4
	jmp LB_46742
LB_46741:
	bts r12,4
LB_46742:
	mov r14,r9
	bt r12,3
	jc LB_46743
	btr r12,1
	jmp LB_46744
LB_46743:
	bts r12,1
LB_46744:
	mov r9,r13
	bt r12,0
	jc LB_46745
	btr r12,3
	jmp LB_46746
LB_46745:
	bts r12,3
LB_46746:
	mov r13,r10
	bt r12,4
	jc LB_46747
	btr r12,0
	jmp LB_46748
LB_46747:
	bts r12,0
LB_46748:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_45221 : %_45221
 ; {>  %_45218~0':_p41180 %_45220~2':_p44467 %_45219~1':_p41181 }
; 	» 0xr1 _ ⊢ 3' : %_45221
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f41253 %_45221 ⊢ %_45222 : %_45222
 ; {>  %_45218~0':_p41180 %_45221~3':_r64 %_45220~2':_p44467 %_45219~1':_p41181 }
; _f41253 3' ⊢ °1◂3'
; _some { %_45222 %_45218 %_45219 } ⊢ %_45223 : %_45223
 ; {>  %_45218~0':_p41180 %_45220~2':_p44467 %_45222~°1◂3':_p41189 %_45219~1':_p41181 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_45223
 ; {>  %_45223~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p41189 _p41180 _p41181 }) %_45220~2':_p44467 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_46666
	mov rdi,r8
	call dlt
LB_46666:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_46667
	btr r12,4
	jmp LB_46668
LB_46667:
	bts r12,4
LB_46668:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_46673
	btr r12,2
	jmp LB_46674
LB_46673:
	bts r12,2
LB_46674:
	mov rsi,1
	bt r12,2
	jc LB_46671
	mov rsi,0
	bt r8,0
	jc LB_46671
	jmp LB_46672
LB_46671:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_46672:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_46669
	btr QWORD [rdi],0
	jmp LB_46670
LB_46669:
	bts QWORD [rdi],0
LB_46670:
	mov r8,r13
	bt r12,0
	jc LB_46677
	btr r12,2
	jmp LB_46678
LB_46677:
	bts r12,2
LB_46678:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_46675
	btr QWORD [rdi],1
	jmp LB_46676
LB_46675:
	bts QWORD [rdi],1
LB_46676:
	mov r8,r14
	bt r12,1
	jc LB_46681
	btr r12,2
	jmp LB_46682
LB_46681:
	bts r12,2
LB_46682:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_46679
	btr QWORD [rdi],2
	jmp LB_46680
LB_46679:
	bts QWORD [rdi],2
LB_46680:
	mov r8,0
	bts r12,2
	ret
LB_46683:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46685
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46684
LB_46685:
	add rsp,8
	ret
LB_46687:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46686:
	add rsp,80
	pop r14
LB_46684:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_46841
LB_46840:
	add r14,1
LB_46841:
	cmp r14,r10
	jge LB_46842
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46840
	cmp al,10
	jz LB_46840
	cmp al,32
	jz LB_46840
LB_46842:
	add r14,3
	cmp r14,r10
	jg LB_46845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_46845
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_46845
	jmp LB_46846
LB_46845:
	jmp LB_46782
LB_46846:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_46797
LB_46796:
	add r14,1
LB_46797:
	cmp r14,r10
	jge LB_46798
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46796
	cmp al,10
	jz LB_46796
	cmp al,32
	jz LB_46796
LB_46798:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46799
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46800
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46800:
	jmp LB_46783
LB_46799:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_46803
LB_46802:
	add r14,1
LB_46803:
	cmp r14,r10
	jge LB_46804
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46802
	cmp al,10
	jz LB_46802
	cmp al,32
	jz LB_46802
LB_46804:
	add r14,1
	cmp r14,r10
	jg LB_46809
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_46809
	jmp LB_46810
LB_46809:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46806
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46806:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46807
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46807:
	jmp LB_46783
LB_46810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_46812
LB_46811:
	add r14,1
LB_46812:
	cmp r14,r10
	jge LB_46813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46811
	cmp al,10
	jz LB_46811
	cmp al,32
	jz LB_46811
LB_46813:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46814
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46815
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46815:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46816
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46816:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46817:
	jmp LB_46783
LB_46814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_46820
LB_46819:
	add r14,1
LB_46820:
	cmp r14,r10
	jge LB_46821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46819
	cmp al,10
	jz LB_46819
	cmp al,32
	jz LB_46819
LB_46821:
	add r14,3
	cmp r14,r10
	jg LB_46828
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46828
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46828
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46828
	jmp LB_46829
LB_46828:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46823
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46823:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46824
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46824:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46825
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46825:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46826
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46826:
	jmp LB_46783
LB_46829:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_46831
LB_46830:
	add r14,1
LB_46831:
	cmp r14,r10
	jge LB_46832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46830
	cmp al,10
	jz LB_46830
	cmp al,32
	jz LB_46830
LB_46832:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46833
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_46834
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_46834:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46835
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46835:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46836
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46836:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46837
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46837:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46838
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46838:
	jmp LB_46783
LB_46833:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_46794
	btr r12,5
	jmp LB_46795
LB_46794:
	bts r12,5
LB_46795:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_46792
	btr r12,4
	jmp LB_46793
LB_46792:
	bts r12,4
LB_46793:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46790
	btr r12,3
	jmp LB_46791
LB_46790:
	bts r12,3
LB_46791:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46788
	btr r12,2
	jmp LB_46789
LB_46788:
	bts r12,2
LB_46789:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46786
	btr r12,1
	jmp LB_46787
LB_46786:
	bts r12,1
LB_46787:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46784
	btr r12,0
	jmp LB_46785
LB_46784:
	bts r12,0
LB_46785:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_46779
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_46847
	btr r12,6
	jmp LB_46848
LB_46847:
	bts r12,6
LB_46848:
	mov r8,r11
	bt r12,5
	jc LB_46849
	btr r12,2
	jmp LB_46850
LB_46849:
	bts r12,2
LB_46850:
	mov r11,r14
	bt r12,1
	jc LB_46851
	btr r12,5
	jmp LB_46852
LB_46851:
	bts r12,5
LB_46852:
	mov r14,r9
	bt r12,3
	jc LB_46853
	btr r12,1
	jmp LB_46854
LB_46853:
	bts r12,1
LB_46854:
	mov r9,r13
	bt r12,0
	jc LB_46855
	btr r12,3
	jmp LB_46856
LB_46855:
	bts r12,3
LB_46856:
	mov r13,r11
	bt r12,5
	jc LB_46857
	btr r12,0
	jmp LB_46858
LB_46857:
	bts r12,0
LB_46858:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f41254 {  } ⊢ %_45227 : %_45227
 ; {>  %_45226~2':_p41181 %_45225~1':_p41180 %_45224~0':_p41180 }
; _f41254 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_45228 : %_45228
 ; {>  %_45226~2':_p41181 %_45227~°2◂{  }:_p41189 %_45225~1':_p41180 %_45224~0':_p41180 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_45225 %_45228 } ⊢ %_45229 : %_45229
 ; {>  %_45226~2':_p41181 %_45227~°2◂{  }:_p41189 %_45228~°1◂{  }:(_lst)◂(t17679'(0)) %_45225~1':_p41180 %_45224~0':_p41180 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_45224 %_45229 } ⊢ %_45230 : %_45230
 ; {>  %_45226~2':_p41181 %_45227~°2◂{  }:_p41189 %_45224~0':_p41180 %_45229~°0◂{ 1' °1◂{  } }:(_lst)◂(_p41180) }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f41229 %_45230 ⊢ %_45231 : %_45231
 ; {>  %_45226~2':_p41181 %_45227~°2◂{  }:_p41189 %_45230~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p41180) }
; _f41229 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_45227 %_45231 %_45226 } ⊢ %_45232 : %_45232
 ; {>  %_45231~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p41180 %_45226~2':_p41181 %_45227~°2◂{  }:_p41189 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_45232
 ; {>  %_45232~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p41189 _p41180 _p41181 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_46751
	mov rsi,0
	bt r10,0
	jc LB_46751
	jmp LB_46752
LB_46751:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_46752:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46749
	btr QWORD [rdi],0
	jmp LB_46750
LB_46749:
	bts QWORD [rdi],0
LB_46750:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_46761
	btr r12,5
	jmp LB_46762
LB_46761:
	bts r12,5
LB_46762:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_46759
	btr QWORD [rdi],0
	jmp LB_46760
LB_46759:
	bts QWORD [rdi],0
LB_46760:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_46769
	btr r12,0
	jmp LB_46770
LB_46769:
	bts r12,0
LB_46770:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_46767
	btr QWORD [rdi],0
	jmp LB_46768
LB_46767:
	bts QWORD [rdi],0
LB_46768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_46773
	mov rsi,0
	bt r13,0
	jc LB_46773
	jmp LB_46774
LB_46773:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_46774:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_46771
	btr QWORD [rdi],1
	jmp LB_46772
LB_46771:
	bts QWORD [rdi],1
LB_46772:
	mov rsi,1
	bt r12,5
	jc LB_46765
	mov rsi,0
	bt r11,0
	jc LB_46765
	jmp LB_46766
LB_46765:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_46766:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_46763
	btr QWORD [rdi],1
	jmp LB_46764
LB_46763:
	bts QWORD [rdi],1
LB_46764:
	mov rsi,1
	bt r12,4
	jc LB_46757
	mov rsi,0
	bt r10,0
	jc LB_46757
	jmp LB_46758
LB_46757:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_46758:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_46755
	mov rsi,0
	bt r10,0
	jc LB_46755
	jmp LB_46756
LB_46755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_46756:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46753
	btr QWORD [rdi],1
	jmp LB_46754
LB_46753:
	bts QWORD [rdi],1
LB_46754:
	mov r10,r8
	bt r12,2
	jc LB_46777
	btr r12,4
	jmp LB_46778
LB_46777:
	bts r12,4
LB_46778:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_46775
	btr QWORD [rdi],2
	jmp LB_46776
LB_46775:
	bts QWORD [rdi],2
LB_46776:
	mov r8,0
	bts r12,2
	ret
LB_46779:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46781
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46780
LB_46781:
	add rsp,8
	ret
LB_46783:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46782:
	add rsp,96
	pop r14
LB_46780:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_46887
LB_46886:
	add r14,1
LB_46887:
	cmp r14,r10
	jge LB_46888
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46886
	cmp al,10
	jz LB_46886
	cmp al,32
	jz LB_46886
LB_46888:
	add r14,2
	cmp r14,r10
	jg LB_46891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_46891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_46891
	jmp LB_46892
LB_46891:
	jmp LB_46874
LB_46892:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_46881
LB_46880:
	add r14,1
LB_46881:
	cmp r14,r10
	jge LB_46882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46880
	cmp al,10
	jz LB_46880
	cmp al,32
	jz LB_46880
LB_46882:
	push r10
	call NS_E_45066_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46883
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46884
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46884:
	jmp LB_46875
LB_46883:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46878
	btr r12,1
	jmp LB_46879
LB_46878:
	bts r12,1
LB_46879:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46876
	btr r12,0
	jmp LB_46877
LB_46876:
	bts r12,0
LB_46877:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_46871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_46893
	btr r12,3
	jmp LB_46894
LB_46893:
	bts r12,3
LB_46894:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_46897
	btr r12,4
	jmp LB_46898
LB_46897:
	bts r12,4
LB_46898:
	mov r13,r10
	bt r12,4
	jc LB_46895
	btr r12,0
	jmp LB_46896
LB_46895:
	bts r12,0
LB_46896:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_46901
	btr r12,4
	jmp LB_46902
LB_46901:
	bts r12,4
LB_46902:
	mov r14,r10
	bt r12,4
	jc LB_46899
	btr r12,1
	jmp LB_46900
LB_46899:
	bts r12,1
LB_46900:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_46905
	btr r12,4
	jmp LB_46906
LB_46905:
	bts r12,4
LB_46906:
	mov r8,r10
	bt r12,4
	jc LB_46903
	btr r12,2
	jmp LB_46904
LB_46903:
	bts r12,2
LB_46904:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45233 ⊢ %_45234 : %_45234
 ; {>  %_45233~{ 0' 1' 2' }:{ _p41189 _p41180 _p41181 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_45234
 ; {>  %_45234~°0◂{ 0' 1' 2' }:(_opn)◂({ _p41189 _p41180 _p41181 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_46861
	btr r12,4
	jmp LB_46862
LB_46861:
	bts r12,4
LB_46862:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46859
	btr QWORD [rdi],0
	jmp LB_46860
LB_46859:
	bts QWORD [rdi],0
LB_46860:
	mov r10,r14
	bt r12,1
	jc LB_46865
	btr r12,4
	jmp LB_46866
LB_46865:
	bts r12,4
LB_46866:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46863
	btr QWORD [rdi],1
	jmp LB_46864
LB_46863:
	bts QWORD [rdi],1
LB_46864:
	mov r10,r8
	bt r12,2
	jc LB_46869
	btr r12,4
	jmp LB_46870
LB_46869:
	bts r12,4
LB_46870:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_46867
	btr QWORD [rdi],2
	jmp LB_46868
LB_46867:
	bts QWORD [rdi],2
LB_46868:
	mov r8,0
	bts r12,2
	ret
LB_46871:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46873
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46872
LB_46873:
	add rsp,8
	ret
LB_46875:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46874:
	add rsp,32
	pop r14
LB_46872:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_46934
LB_46933:
	add r14,1
LB_46934:
	cmp r14,r10
	jge LB_46935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46933
	cmp al,10
	jz LB_46933
	cmp al,32
	jz LB_46933
LB_46935:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46936
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46924
LB_46936:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_46939
LB_46938:
	add r14,1
LB_46939:
	cmp r14,r10
	jge LB_46940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46938
	cmp al,10
	jz LB_46938
	cmp al,32
	jz LB_46938
LB_46940:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46941
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46942:
	jmp LB_46924
LB_46941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_46945
LB_46944:
	add r14,1
LB_46945:
	cmp r14,r10
	jge LB_46946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46944
	cmp al,10
	jz LB_46944
	cmp al,32
	jz LB_46944
LB_46946:
	add r14,3
	cmp r14,r10
	jg LB_46951
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46951
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46951
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46951
	jmp LB_46952
LB_46951:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46949:
	jmp LB_46924
LB_46952:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_46954
LB_46953:
	add r14,1
LB_46954:
	cmp r14,r10
	jge LB_46955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46953
	cmp al,10
	jz LB_46953
	cmp al,32
	jz LB_46953
LB_46955:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46956
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46957
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46957:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46958
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46958:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46959
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46959:
	jmp LB_46924
LB_46956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46931
	btr r12,3
	jmp LB_46932
LB_46931:
	bts r12,3
LB_46932:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46929
	btr r12,2
	jmp LB_46930
LB_46929:
	bts r12,2
LB_46930:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46927
	btr r12,1
	jmp LB_46928
LB_46927:
	bts r12,1
LB_46928:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46925
	btr r12,0
	jmp LB_46926
LB_46925:
	bts r12,0
LB_46926:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_46921
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_46961
	btr r12,4
	jmp LB_46962
LB_46961:
	bts r12,4
LB_46962:
	mov r8,r9
	bt r12,3
	jc LB_46963
	btr r12,2
	jmp LB_46964
LB_46963:
	bts r12,2
LB_46964:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f41252 %_45235 ⊢ %_45238 : %_45238
 ; {>  %_45237~2':_p41181 %_45236~1':_p41180 %_45235~0':_p41117 }
; _f41252 0' ⊢ °0◂0'
; _some { %_45238 %_45236 %_45237 } ⊢ %_45239 : %_45239
 ; {>  %_45237~2':_p41181 %_45238~°0◂0':_p41189 %_45236~1':_p41180 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_45239
 ; {>  %_45239~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p41189 _p41180 _p41181 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_46911
	btr r12,4
	jmp LB_46912
LB_46911:
	bts r12,4
LB_46912:
	mov rsi,1
	bt r12,4
	jc LB_46909
	mov rsi,0
	bt r10,0
	jc LB_46909
	jmp LB_46910
LB_46909:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_46910:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46907
	btr QWORD [rdi],0
	jmp LB_46908
LB_46907:
	bts QWORD [rdi],0
LB_46908:
	mov r10,r14
	bt r12,1
	jc LB_46915
	btr r12,4
	jmp LB_46916
LB_46915:
	bts r12,4
LB_46916:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46913
	btr QWORD [rdi],1
	jmp LB_46914
LB_46913:
	bts QWORD [rdi],1
LB_46914:
	mov r10,r8
	bt r12,2
	jc LB_46919
	btr r12,4
	jmp LB_46920
LB_46919:
	bts r12,4
LB_46920:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_46917
	btr QWORD [rdi],2
	jmp LB_46918
LB_46917:
	bts QWORD [rdi],2
LB_46918:
	mov r8,0
	bts r12,2
	ret
LB_46921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46923
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46922
LB_46923:
	add rsp,8
	ret
LB_46924:
	add rsp,64
	pop r14
LB_46922:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45066:
NS_E_RDI_45066:
NS_E_45066_ETR_TBL:
NS_E_45066_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_47023
LB_47022:
	add r14,1
LB_47023:
	cmp r14,r10
	jge LB_47024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47022
	cmp al,10
	jz LB_47022
	cmp al,32
	jz LB_47022
LB_47024:
	add r14,2
	cmp r14,r10
	jg LB_47027
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_47027
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_47027
	jmp LB_47028
LB_47027:
	jmp LB_46990
LB_47028:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_47001
LB_47000:
	add r14,1
LB_47001:
	cmp r14,r10
	jge LB_47002
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47000
	cmp al,10
	jz LB_47000
	cmp al,32
	jz LB_47000
LB_47002:
	push r10
	call NS_E_45067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47003
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47004:
	jmp LB_46991
LB_47003:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_47010:
	jmp LB_47007
LB_47006:
	add r14,1
LB_47007:
	cmp r14,r10
	jge LB_47008
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47006
	cmp al,10
	jz LB_47006
	cmp al,32
	jz LB_47006
LB_47008:
	push r10
	push rsi
	call NS_E_45068_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_47009
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_47011
	bts QWORD [rax],0
LB_47011:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_47010
LB_47009:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_47013
LB_47012:
	add r14,1
LB_47013:
	cmp r14,r10
	jge LB_47014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47012
	cmp al,10
	jz LB_47012
	cmp al,32
	jz LB_47012
LB_47014:
	add r14,2
	cmp r14,r10
	jg LB_47020
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_47020
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_47020
	jmp LB_47021
LB_47020:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47016
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47016:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47017
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47017:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47018:
	jmp LB_46991
LB_47021:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46998
	btr r12,3
	jmp LB_46999
LB_46998:
	bts r12,3
LB_46999:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46996
	btr r12,2
	jmp LB_46997
LB_46996:
	bts r12,2
LB_46997:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46994
	btr r12,1
	jmp LB_46995
LB_46994:
	bts r12,1
LB_46995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46992
	btr r12,0
	jmp LB_46993
LB_46992:
	bts r12,0
LB_46993:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_46987
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_47029
	btr r12,4
	jmp LB_47030
LB_47029:
	bts r12,4
LB_47030:
	mov r9,r8
	bt r12,2
	jc LB_47031
	btr r12,3
	jmp LB_47032
LB_47031:
	bts r12,3
LB_47032:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_47033
	btr r12,4
	jmp LB_47034
LB_47033:
	bts r12,4
LB_47034:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_47037
	btr r12,5
	jmp LB_47038
LB_47037:
	bts r12,5
LB_47038:
	mov r13,r11
	bt r12,5
	jc LB_47035
	btr r12,0
	jmp LB_47036
LB_47035:
	bts r12,0
LB_47036:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_47041
	btr r12,5
	jmp LB_47042
LB_47041:
	bts r12,5
LB_47042:
	mov r14,r11
	bt r12,5
	jc LB_47039
	btr r12,1
	jmp LB_47040
LB_47039:
	bts r12,1
LB_47040:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_47045
	btr r12,5
	jmp LB_47046
LB_47045:
	bts r12,5
LB_47046:
	mov r8,r11
	bt r12,5
	jc LB_47043
	btr r12,2
	jmp LB_47044
LB_47043:
	bts r12,2
LB_47044:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f41256 { %_45240 %_45243 } ⊢ %_45244 : %_45244
 ; {>  %_45240~0':_r64 %_45242~2':_p41181 %_45243~3':(_lst)◂(_p41190) %_45241~1':_p41180 }
; _f41256 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_45244 %_45241 %_45242 } ⊢ %_45245 : %_45245
 ; {>  %_45242~2':_p41181 %_45244~°4◂{ 0' 3' }:_p41189 %_45241~1':_p41180 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_45245
 ; {>  %_45245~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p41189 _p41180 _p41181 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_46965
	btr r12,4
	jmp LB_46966
LB_46965:
	bts r12,4
LB_46966:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_46973
	btr r12,6
	jmp LB_46974
LB_46973:
	bts r12,6
LB_46974:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_46971
	btr QWORD [rdi],0
	jmp LB_46972
LB_46971:
	bts QWORD [rdi],0
LB_46972:
	mov rcx,r10
	bt r12,4
	jc LB_46977
	btr r12,6
	jmp LB_46978
LB_46977:
	bts r12,6
LB_46978:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_46975
	btr QWORD [rdi],1
	jmp LB_46976
LB_46975:
	bts QWORD [rdi],1
LB_46976:
	mov rsi,1
	bt r12,5
	jc LB_46969
	mov rsi,0
	bt r11,0
	jc LB_46969
	jmp LB_46970
LB_46969:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_46970:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_46967
	btr QWORD [rdi],0
	jmp LB_46968
LB_46967:
	bts QWORD [rdi],0
LB_46968:
	mov r11,r14
	bt r12,1
	jc LB_46981
	btr r12,5
	jmp LB_46982
LB_46981:
	bts r12,5
LB_46982:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_46979
	btr QWORD [rdi],1
	jmp LB_46980
LB_46979:
	bts QWORD [rdi],1
LB_46980:
	mov r11,r8
	bt r12,2
	jc LB_46985
	btr r12,5
	jmp LB_46986
LB_46985:
	bts r12,5
LB_46986:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_46983
	btr QWORD [rdi],2
	jmp LB_46984
LB_46983:
	bts QWORD [rdi],2
LB_46984:
	mov r8,0
	bts r12,2
	ret
LB_46987:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_46989
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_46988
LB_46989:
	add rsp,8
	ret
LB_46991:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_46990:
	add rsp,64
	pop r14
LB_46988:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_47076
LB_47075:
	add r14,1
LB_47076:
	cmp r14,r10
	jge LB_47077
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47075
	cmp al,10
	jz LB_47075
	cmp al,32
	jz LB_47075
LB_47077:
	push r10
	call NS_E_44072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47078
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47066
LB_47078:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_47081
LB_47080:
	add r14,1
LB_47081:
	cmp r14,r10
	jge LB_47082
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47080
	cmp al,10
	jz LB_47080
	cmp al,32
	jz LB_47080
LB_47082:
	add r14,1
	cmp r14,r10
	jg LB_47086
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_47086
	jmp LB_47087
LB_47086:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47084
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47084:
	jmp LB_47066
LB_47087:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_47089
LB_47088:
	add r14,1
LB_47089:
	cmp r14,r10
	jge LB_47090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47088
	cmp al,10
	jz LB_47088
	cmp al,32
	jz LB_47088
LB_47090:
	add r14,3
	cmp r14,r10
	jg LB_47095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_47095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_47095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_47095
	jmp LB_47096
LB_47095:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47092
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47092:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47093
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47093:
	jmp LB_47066
LB_47096:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_47098
LB_47097:
	add r14,1
LB_47098:
	cmp r14,r10
	jge LB_47099
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47097
	cmp al,10
	jz LB_47097
	cmp al,32
	jz LB_47097
LB_47099:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47100
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47101
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47101:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47102
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47102:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47103
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47103:
	jmp LB_47066
LB_47100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_47073
	btr r12,3
	jmp LB_47074
LB_47073:
	bts r12,3
LB_47074:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47071
	btr r12,2
	jmp LB_47072
LB_47071:
	bts r12,2
LB_47072:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47069
	btr r12,1
	jmp LB_47070
LB_47069:
	bts r12,1
LB_47070:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47067
	btr r12,0
	jmp LB_47068
LB_47067:
	bts r12,0
LB_47068:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_47063
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_47105
	btr r12,4
	jmp LB_47106
LB_47105:
	bts r12,4
LB_47106:
	mov r14,r9
	bt r12,3
	jc LB_47107
	btr r12,1
	jmp LB_47108
LB_47107:
	bts r12,1
LB_47108:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41255 %_45246 ⊢ %_45248 : %_45248
 ; {>  %_45246~0':_p41183 %_45247~1':_p41181 }
; _f41255 0' ⊢ °3◂0'
; _nil {  } ⊢ %_45249 : %_45249
 ; {>  %_45248~°3◂0':_p41189 %_45247~1':_p41181 }
; _nil {  } ⊢ °1◂{  }
; _f41229 %_45249 ⊢ %_45250 : %_45250
 ; {>  %_45248~°3◂0':_p41189 %_45249~°1◂{  }:(_lst)◂(t17708'(0)) %_45247~1':_p41181 }
; _f41229 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_45248 %_45250 %_45247 } ⊢ %_45251 : %_45251
 ; {>  %_45248~°3◂0':_p41189 %_45250~°0◂°1◂{  }:_p41180 %_45247~1':_p41181 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_45251
 ; {>  %_45251~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p41189 _p41180 _p41181 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47051
	btr r12,2
	jmp LB_47052
LB_47051:
	bts r12,2
LB_47052:
	mov rsi,1
	bt r12,2
	jc LB_47049
	mov rsi,0
	bt r8,0
	jc LB_47049
	jmp LB_47050
LB_47049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47050:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47047
	btr QWORD [rdi],0
	jmp LB_47048
LB_47047:
	bts QWORD [rdi],0
LB_47048:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_47057
	mov rsi,0
	bt r8,0
	jc LB_47057
	jmp LB_47058
LB_47057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47058:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_47055
	mov rsi,0
	bt r8,0
	jc LB_47055
	jmp LB_47056
LB_47055:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47056:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47053
	btr QWORD [rdi],1
	jmp LB_47054
LB_47053:
	bts QWORD [rdi],1
LB_47054:
	mov r8,r14
	bt r12,1
	jc LB_47061
	btr r12,2
	jmp LB_47062
LB_47061:
	bts r12,2
LB_47062:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_47059
	btr QWORD [rdi],2
	jmp LB_47060
LB_47059:
	bts QWORD [rdi],2
LB_47060:
	mov r8,0
	bts r12,2
	ret
LB_47063:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47065
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47064
LB_47065:
	add rsp,8
	ret
LB_47066:
	add rsp,64
	pop r14
LB_47064:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45067:
NS_E_RDI_45067:
NS_E_45067_ETR_TBL:
NS_E_45067_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_47162
LB_47161:
	add r14,1
LB_47162:
	cmp r14,r10
	jge LB_47163
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47161
	cmp al,10
	jz LB_47161
	cmp al,32
	jz LB_47161
LB_47163:
	add r14,1
	cmp r14,r10
	jg LB_47166
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_47166
	jmp LB_47167
LB_47166:
	jmp LB_47138
LB_47167:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_47147
LB_47146:
	add r14,1
LB_47147:
	cmp r14,r10
	jge LB_47148
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47146
	cmp al,10
	jz LB_47146
	cmp al,32
	jz LB_47146
LB_47148:
	add r14,3
	cmp r14,r10
	jg LB_47152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_47152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_47152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_47152
	jmp LB_47153
LB_47152:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47150
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47150:
	jmp LB_47139
LB_47153:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_47155
LB_47154:
	add r14,1
LB_47155:
	cmp r14,r10
	jge LB_47156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47154
	cmp al,10
	jz LB_47154
	cmp al,32
	jz LB_47154
LB_47156:
	push r10
	call NS_E_44470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47158
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47158:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47159
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47159:
	jmp LB_47139
LB_47157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47144
	btr r12,2
	jmp LB_47145
LB_47144:
	bts r12,2
LB_47145:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47142
	btr r12,1
	jmp LB_47143
LB_47142:
	bts r12,1
LB_47143:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47140
	btr r12,0
	jmp LB_47141
LB_47140:
	bts r12,0
LB_47141:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_47135
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_47168
	btr r12,3
	jmp LB_47169
LB_47168:
	bts r12,3
LB_47169:
	mov r13,r8
	bt r12,2
	jc LB_47170
	btr r12,0
	jmp LB_47171
LB_47170:
	bts r12,0
LB_47171:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_45253 : %_45253
 ; {>  %_45252~0':_p41179 }
; 	» 0xr0 _ ⊢ 1' : %_45253
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_45254 : %_45254
 ; {>  %_45252~0':_p41179 %_45253~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f41229 %_45254 ⊢ %_45255 : %_45255
 ; {>  %_45252~0':_p41179 %_45253~1':_r64 %_45254~°1◂{  }:(_lst)◂(t17716'(0)) }
; _f41229 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_45256 : %_45256
 ; {>  %_45252~0':_p41179 %_45255~°0◂°1◂{  }:_p41180 %_45253~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f41232 %_45252 ⊢ %_45257 : %_45257
 ; {>  %_45252~0':_p41179 %_45256~°1◂{  }:(_lst)◂(t17720'(0)) %_45255~°0◂°1◂{  }:_p41180 %_45253~1':_r64 }
; _f41232 0' ⊢ °1◂0'
; _cns { %_45257 %_45256 } ⊢ %_45258 : %_45258
 ; {>  %_45256~°1◂{  }:(_lst)◂(t17720'(0)) %_45257~°1◂0':_p41181 %_45255~°0◂°1◂{  }:_p41180 %_45253~1':_r64 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f41231 %_45258 ⊢ %_45259 : %_45259
 ; {>  %_45258~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p41181) %_45255~°0◂°1◂{  }:_p41180 %_45253~1':_r64 }
; _f41231 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_45253 %_45255 %_45259 } ⊢ %_45260 : %_45260
 ; {>  %_45259~°0◂°0◂{ °1◂0' °1◂{  } }:_p41181 %_45255~°0◂°1◂{  }:_p41180 %_45253~1':_r64 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_45260
 ; {>  %_45260~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p41180 _p41181 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_47111
	btr r12,2
	jmp LB_47112
LB_47111:
	bts r12,2
LB_47112:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47109
	btr QWORD [rdi],0
	jmp LB_47110
LB_47109:
	bts QWORD [rdi],0
LB_47110:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_47117
	mov rsi,0
	bt r8,0
	jc LB_47117
	jmp LB_47118
LB_47117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47118:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_47115
	mov rsi,0
	bt r8,0
	jc LB_47115
	jmp LB_47116
LB_47115:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47116:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47113
	btr QWORD [rdi],1
	jmp LB_47114
LB_47113:
	bts QWORD [rdi],1
LB_47114:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_47129
	btr r12,1
	jmp LB_47130
LB_47129:
	bts r12,1
LB_47130:
	mov rsi,1
	bt r12,1
	jc LB_47127
	mov rsi,0
	bt r14,0
	jc LB_47127
	jmp LB_47128
LB_47127:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_47128:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_47125
	btr QWORD [rdi],0
	jmp LB_47126
LB_47125:
	bts QWORD [rdi],0
LB_47126:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_47133
	mov rsi,0
	bt r14,0
	jc LB_47133
	jmp LB_47134
LB_47133:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_47134:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_47131
	btr QWORD [rdi],1
	jmp LB_47132
LB_47131:
	bts QWORD [rdi],1
LB_47132:
	mov rsi,1
	bt r12,2
	jc LB_47123
	mov rsi,0
	bt r8,0
	jc LB_47123
	jmp LB_47124
LB_47123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47124:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_47121
	mov rsi,0
	bt r8,0
	jc LB_47121
	jmp LB_47122
LB_47121:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_47122:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_47119
	btr QWORD [rdi],2
	jmp LB_47120
LB_47119:
	bts QWORD [rdi],2
LB_47120:
	mov r8,0
	bts r12,2
	ret
LB_47135:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47137
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47136
LB_47137:
	add rsp,8
	ret
LB_47139:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_47138:
	add rsp,48
	pop r14
LB_47136:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_47225
LB_47224:
	add r14,1
LB_47225:
	cmp r14,r10
	jge LB_47226
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47224
	cmp al,10
	jz LB_47224
	cmp al,32
	jz LB_47224
LB_47226:
	push r10
	call NS_E_44204_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47227
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47213
LB_47227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_47230
LB_47229:
	add r14,1
LB_47230:
	cmp r14,r10
	jge LB_47231
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47229
	cmp al,10
	jz LB_47229
	cmp al,32
	jz LB_47229
LB_47231:
	push r10
	call NS_E_44203_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47232
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47233
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47233:
	jmp LB_47213
LB_47232:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_47236
LB_47235:
	add r14,1
LB_47236:
	cmp r14,r10
	jge LB_47237
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47235
	cmp al,10
	jz LB_47235
	cmp al,32
	jz LB_47235
LB_47237:
	add r14,3
	cmp r14,r10
	jg LB_47242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_47242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_47242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_47242
	jmp LB_47243
LB_47242:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47239
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47239:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47240
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47240:
	jmp LB_47213
LB_47243:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_47245
LB_47244:
	add r14,1
LB_47245:
	cmp r14,r10
	jge LB_47246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47244
	cmp al,10
	jz LB_47244
	cmp al,32
	jz LB_47244
LB_47246:
	push r10
	call NS_E_44470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47247
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47248
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47248:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47249
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47249:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47250
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47250:
	jmp LB_47213
LB_47247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_47253
LB_47252:
	add r14,1
LB_47253:
	cmp r14,r10
	jge LB_47254
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47252
	cmp al,10
	jz LB_47252
	cmp al,32
	jz LB_47252
LB_47254:
	push r10
	call NS_E_44469_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47255
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_47256
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_47256:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47257
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47257:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47258
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47258:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47259:
	jmp LB_47213
LB_47255:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_47222
	btr r12,4
	jmp LB_47223
LB_47222:
	bts r12,4
LB_47223:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_47220
	btr r12,3
	jmp LB_47221
LB_47220:
	bts r12,3
LB_47221:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47218
	btr r12,2
	jmp LB_47219
LB_47218:
	bts r12,2
LB_47219:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47216
	btr r12,1
	jmp LB_47217
LB_47216:
	bts r12,1
LB_47217:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47214
	btr r12,0
	jmp LB_47215
LB_47214:
	bts r12,0
LB_47215:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_47210
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_47261
	btr r12,5
	jmp LB_47262
LB_47261:
	bts r12,5
LB_47262:
	mov r9,r10
	bt r12,4
	jc LB_47263
	btr r12,3
	jmp LB_47264
LB_47263:
	bts r12,3
LB_47264:
	mov r10,r8
	bt r12,2
	jc LB_47265
	btr r12,4
	jmp LB_47266
LB_47265:
	bts r12,4
LB_47266:
	mov r8,r11
	bt r12,5
	jc LB_47267
	btr r12,2
	jmp LB_47268
LB_47267:
	bts r12,2
LB_47268:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f41230 %_45261 ⊢ %_45265 : %_45265
 ; {>  %_45262~1':(_lst)◂(_p41180) %_45264~3':(_lst)◂(_p41181) %_45261~0':_p41178 %_45263~2':_p41179 }
; _f41230 0' ⊢ °1◂0'
; _f41232 %_45263 ⊢ %_45266 : %_45266
 ; {>  %_45265~°1◂0':_p41180 %_45262~1':(_lst)◂(_p41180) %_45264~3':(_lst)◂(_p41181) %_45263~2':_p41179 }
; _f41232 2' ⊢ °1◂2'
; _cns { %_45265 %_45262 } ⊢ %_45267 : %_45267
 ; {>  %_45265~°1◂0':_p41180 %_45262~1':(_lst)◂(_p41180) %_45264~3':(_lst)◂(_p41181) %_45266~°1◂2':_p41181 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_45266 %_45264 } ⊢ %_45268 : %_45268
 ; {>  %_45264~3':(_lst)◂(_p41181) %_45266~°1◂2':_p41181 %_45267~°0◂{ °1◂0' 1' }:(_lst)◂(_p41180) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f41229 %_45267 ⊢ %_45269 : %_45269
 ; {>  %_45267~°0◂{ °1◂0' 1' }:(_lst)◂(_p41180) %_45268~°0◂{ °1◂2' 3' }:(_lst)◂(_p41181) }
; _f41229 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f41231 %_45268 ⊢ %_45270 : %_45270
 ; {>  %_45269~°0◂°0◂{ °1◂0' 1' }:_p41180 %_45268~°0◂{ °1◂2' 3' }:(_lst)◂(_p41181) }
; _f41231 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_45271 : %_45271
 ; {>  %_45270~°0◂°0◂{ °1◂2' 3' }:_p41181 %_45269~°0◂°0◂{ °1◂0' 1' }:_p41180 }
; 	» 0xr1 _ ⊢ 4' : %_45271
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_45271 %_45269 %_45270 } ⊢ %_45272 : %_45272
 ; {>  %_45270~°0◂°0◂{ °1◂2' 3' }:_p41181 %_45271~4':_r64 %_45269~°0◂°0◂{ °1◂0' 1' }:_p41180 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_45272
 ; {>  %_45272~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p41180 _p41181 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_47172
	btr r12,5
	jmp LB_47173
LB_47172:
	bts r12,5
LB_47173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_47176
	btr r12,6
	jmp LB_47177
LB_47176:
	bts r12,6
LB_47177:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_47174
	btr QWORD [rdi],0
	jmp LB_47175
LB_47174:
	bts QWORD [rdi],0
LB_47175:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_47188
	btr r12,4
	jmp LB_47189
LB_47188:
	bts r12,4
LB_47189:
	mov rsi,1
	bt r12,4
	jc LB_47186
	mov rsi,0
	bt r10,0
	jc LB_47186
	jmp LB_47187
LB_47186:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_47187:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_47184
	btr QWORD [rdi],0
	jmp LB_47185
LB_47184:
	bts QWORD [rdi],0
LB_47185:
	mov r10,r14
	bt r12,1
	jc LB_47192
	btr r12,4
	jmp LB_47193
LB_47192:
	bts r12,4
LB_47193:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_47190
	btr QWORD [rdi],1
	jmp LB_47191
LB_47190:
	bts QWORD [rdi],1
LB_47191:
	mov rsi,1
	bt r12,6
	jc LB_47182
	mov rsi,0
	bt rcx,0
	jc LB_47182
	jmp LB_47183
LB_47182:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_47183:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_47180
	mov rsi,0
	bt rcx,0
	jc LB_47180
	jmp LB_47181
LB_47180:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_47181:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_47178
	btr QWORD [rdi],1
	jmp LB_47179
LB_47178:
	bts QWORD [rdi],1
LB_47179:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_47204
	btr r12,0
	jmp LB_47205
LB_47204:
	bts r12,0
LB_47205:
	mov rsi,1
	bt r12,0
	jc LB_47202
	mov rsi,0
	bt r13,0
	jc LB_47202
	jmp LB_47203
LB_47202:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47203:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_47200
	btr QWORD [rdi],0
	jmp LB_47201
LB_47200:
	bts QWORD [rdi],0
LB_47201:
	mov r13,r11
	bt r12,5
	jc LB_47208
	btr r12,0
	jmp LB_47209
LB_47208:
	bts r12,0
LB_47209:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_47206
	btr QWORD [rdi],1
	jmp LB_47207
LB_47206:
	bts QWORD [rdi],1
LB_47207:
	mov rsi,1
	bt r12,6
	jc LB_47198
	mov rsi,0
	bt rcx,0
	jc LB_47198
	jmp LB_47199
LB_47198:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_47199:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_47196
	mov rsi,0
	bt rcx,0
	jc LB_47196
	jmp LB_47197
LB_47196:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_47197:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_47194
	btr QWORD [rdi],2
	jmp LB_47195
LB_47194:
	bts QWORD [rdi],2
LB_47195:
	mov r8,0
	bts r12,2
	ret
LB_47210:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47212
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47211
LB_47212:
	add rsp,8
	ret
LB_47213:
	add rsp,80
	pop r14
LB_47211:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45068:
NS_E_RDI_45068:
NS_E_45068_ETR_TBL:
NS_E_45068_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_47298
LB_47297:
	add r14,1
LB_47298:
	cmp r14,r10
	jge LB_47299
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47297
	cmp al,10
	jz LB_47297
	cmp al,32
	jz LB_47297
LB_47299:
	push r10
	call NS_E_45069_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47300
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47282
LB_47300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_47303
LB_47302:
	add r14,1
LB_47303:
	cmp r14,r10
	jge LB_47304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47302
	cmp al,10
	jz LB_47302
	cmp al,32
	jz LB_47302
LB_47304:
	add r14,1
	cmp r14,r10
	jg LB_47308
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_47308
	jmp LB_47309
LB_47308:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47306
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47306:
	jmp LB_47282
LB_47309:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_47291
LB_47290:
	add r14,1
LB_47291:
	cmp r14,r10
	jge LB_47292
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47290
	cmp al,10
	jz LB_47290
	cmp al,32
	jz LB_47290
LB_47292:
	push r10
	call NS_E_40574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47293
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47294
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47294:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47295:
	jmp LB_47283
LB_47293:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47288
	btr r12,2
	jmp LB_47289
LB_47288:
	bts r12,2
LB_47289:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47286
	btr r12,1
	jmp LB_47287
LB_47286:
	bts r12,1
LB_47287:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47284
	btr r12,0
	jmp LB_47285
LB_47284:
	bts r12,0
LB_47285:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_47279
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_47310
	btr r12,3
	jmp LB_47311
LB_47310:
	bts r12,3
LB_47311:
	mov r14,r8
	bt r12,2
	jc LB_47312
	btr r12,1
	jmp LB_47313
LB_47312:
	bts r12,1
LB_47313:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f41260 { %_45273 %_45274 } ⊢ %_45275 : %_45275
 ; {>  %_45273~0':_r64 %_45274~1':_stg }
; _f41260 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_45275 ⊢ %_45276 : %_45276
 ; {>  %_45275~°3◂{ 0' 1' }:_p41190 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_45276
 ; {>  %_45276~°0◂°3◂{ 0' 1' }:(_opn)◂(_p41190) }
; 	∎ °0◂°3◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°3◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47273
	btr r12,2
	jmp LB_47274
LB_47273:
	bts r12,2
LB_47274:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47271
	btr QWORD [rdi],0
	jmp LB_47272
LB_47271:
	bts QWORD [rdi],0
LB_47272:
	mov r8,r14
	bt r12,1
	jc LB_47277
	btr r12,2
	jmp LB_47278
LB_47277:
	bts r12,2
LB_47278:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47275
	btr QWORD [rdi],1
	jmp LB_47276
LB_47275:
	bts QWORD [rdi],1
LB_47276:
	mov rsi,1
	bt r12,3
	jc LB_47269
	mov rsi,0
	bt r9,0
	jc LB_47269
	jmp LB_47270
LB_47269:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47270:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47279:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47281
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47280
LB_47281:
	add rsp,8
	ret
LB_47283:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_47282:
	add rsp,48
	pop r14
LB_47280:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_47325
LB_47324:
	add r14,1
LB_47325:
	cmp r14,r10
	jge LB_47326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47324
	cmp al,10
	jz LB_47324
	cmp al,32
	jz LB_47324
LB_47326:
	push r10
	call NS_E_45071_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47327
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47321
LB_47327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47322
	btr r12,0
	jmp LB_47323
LB_47322:
	bts r12,0
LB_47323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47318
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41257 %_45277 ⊢ %_45278 : %_45278
 ; {>  %_45277~0':_stg }
; _f41257 0' ⊢ °0◂0'
; _some %_45278 ⊢ %_45279 : %_45279
 ; {>  %_45278~°0◂0':_p41190 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45279
 ; {>  %_45279~°0◂°0◂0':(_opn)◂(_p41190) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47316
	btr r12,3
	jmp LB_47317
LB_47316:
	bts r12,3
LB_47317:
	mov rsi,1
	bt r12,3
	jc LB_47314
	mov rsi,0
	bt r9,0
	jc LB_47314
	jmp LB_47315
LB_47314:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47315:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47318:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47320
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47319
LB_47320:
	add rsp,8
	ret
LB_47321:
	add rsp,16
	pop r14
LB_47319:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_47340
LB_47339:
	add r14,1
LB_47340:
	cmp r14,r10
	jge LB_47341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47339
	cmp al,10
	jz LB_47339
	cmp al,32
	jz LB_47339
LB_47341:
	push r10
	call NS_E_40574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47342
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47336
LB_47342:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47337
	btr r12,0
	jmp LB_47338
LB_47337:
	bts r12,0
LB_47338:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47333
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41257 %_45280 ⊢ %_45281 : %_45281
 ; {>  %_45280~0':_stg }
; _f41257 0' ⊢ °0◂0'
; _some %_45281 ⊢ %_45282 : %_45282
 ; {>  %_45281~°0◂0':_p41190 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45282
 ; {>  %_45282~°0◂°0◂0':(_opn)◂(_p41190) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47331
	btr r12,3
	jmp LB_47332
LB_47331:
	bts r12,3
LB_47332:
	mov rsi,1
	bt r12,3
	jc LB_47329
	mov rsi,0
	bt r9,0
	jc LB_47329
	jmp LB_47330
LB_47329:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47330:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47333:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47335
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47334
LB_47335:
	add rsp,8
	ret
LB_47336:
	add rsp,16
	pop r14
LB_47334:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_47355
LB_47354:
	add r14,1
LB_47355:
	cmp r14,r10
	jge LB_47356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47354
	cmp al,10
	jz LB_47354
	cmp al,32
	jz LB_47354
LB_47356:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47357
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47351
LB_47357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47352
	btr r12,0
	jmp LB_47353
LB_47352:
	bts r12,0
LB_47353:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47348
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41258 %_45283 ⊢ %_45284 : %_45284
 ; {>  %_45283~0':_p41117 }
; _f41258 0' ⊢ °1◂0'
; _some %_45284 ⊢ %_45285 : %_45285
 ; {>  %_45284~°1◂0':_p41190 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45285
 ; {>  %_45285~°0◂°1◂0':(_opn)◂(_p41190) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47346
	btr r12,3
	jmp LB_47347
LB_47346:
	bts r12,3
LB_47347:
	mov rsi,1
	bt r12,3
	jc LB_47344
	mov rsi,0
	bt r9,0
	jc LB_47344
	jmp LB_47345
LB_47344:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47345:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47348:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47350
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47349
LB_47350:
	add rsp,8
	ret
LB_47351:
	add rsp,16
	pop r14
LB_47349:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_47376
LB_47375:
	add r14,1
LB_47376:
	cmp r14,r10
	jge LB_47377
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47375
	cmp al,10
	jz LB_47375
	cmp al,32
	jz LB_47375
LB_47377:
	push r10
	call NS_E_45070_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47378
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47372
LB_47378:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47373
	btr r12,0
	jmp LB_47374
LB_47373:
	bts r12,0
LB_47374:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47369
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_47380
	btr r12,2
	jmp LB_47381
LB_47380:
	bts r12,2
LB_47381:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_47384
	btr r12,3
	jmp LB_47385
LB_47384:
	bts r12,3
LB_47385:
	mov r13,r9
	bt r12,3
	jc LB_47382
	btr r12,0
	jmp LB_47383
LB_47382:
	bts r12,0
LB_47383:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_47388
	btr r12,3
	jmp LB_47389
LB_47388:
	bts r12,3
LB_47389:
	mov r14,r9
	bt r12,3
	jc LB_47386
	btr r12,1
	jmp LB_47387
LB_47386:
	bts r12,1
LB_47387:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41259 %_45286 ⊢ %_45287 : %_45287
 ; {>  %_45286~{ 0' 1' }:{ _p41191 _r64 } }
; _f41259 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_45287 ⊢ %_45288 : %_45288
 ; {>  %_45287~°2◂{ 0' 1' }:_p41190 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_45288
 ; {>  %_45288~°0◂°2◂{ 0' 1' }:(_opn)◂(_p41190) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47363
	btr r12,2
	jmp LB_47364
LB_47363:
	bts r12,2
LB_47364:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47361
	btr QWORD [rdi],0
	jmp LB_47362
LB_47361:
	bts QWORD [rdi],0
LB_47362:
	mov r8,r14
	bt r12,1
	jc LB_47367
	btr r12,2
	jmp LB_47368
LB_47367:
	bts r12,2
LB_47368:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47365
	btr QWORD [rdi],1
	jmp LB_47366
LB_47365:
	bts QWORD [rdi],1
LB_47366:
	mov rsi,1
	bt r12,3
	jc LB_47359
	mov rsi,0
	bt r9,0
	jc LB_47359
	jmp LB_47360
LB_47359:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47360:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47369:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47371
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47370
LB_47371:
	add rsp,8
	ret
LB_47372:
	add rsp,16
	pop r14
LB_47370:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45069:
NS_E_RDI_45069:
NS_E_45069_ETR_TBL:
NS_E_45069_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_40453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47403
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47395
LB_47403:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_47411
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_47411
	jmp LB_47412
LB_47411:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47409:
	jmp LB_47395
LB_47412:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47398
	btr r12,1
	jmp LB_47399
LB_47398:
	bts r12,1
LB_47399:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47396
	btr r12,0
	jmp LB_47397
LB_47396:
	bts r12,0
LB_47397:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47392
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45289 ⊢ %_45290 : %_45290
 ; {>  %_45289~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_45290
 ; {>  %_45290~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47390
	btr r12,3
	jmp LB_47391
LB_47390:
	bts r12,3
LB_47391:
	mov r8,0
	bts r12,2
	ret
LB_47392:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47394
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47393
LB_47394:
	add rsp,8
	ret
LB_47395:
	add rsp,32
	pop r14
LB_47393:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45070:
NS_E_RDI_45070:
NS_E_45070_ETR_TBL:
NS_E_45070_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_40453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47432
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47424
LB_47432:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_47440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_47440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_47440
	jmp LB_47441
LB_47440:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47438:
	jmp LB_47424
LB_47441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47427
	btr r12,1
	jmp LB_47428
LB_47427:
	bts r12,1
LB_47428:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47425
	btr r12,0
	jmp LB_47426
LB_47425:
	bts r12,0
LB_47426:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47421
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f41262 {  } ⊢ %_45292 : %_45292
 ; {>  %_45291~0':_r64 }
; _f41262 {  } ⊢ °1◂{  }
; _some { %_45292 %_45291 } ⊢ %_45293 : %_45293
 ; {>  %_45291~0':_r64 %_45292~°1◂{  }:_p41191 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_45293
 ; {>  %_45293~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p41191 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_47415
	mov rsi,0
	bt r14,0
	jc LB_47415
	jmp LB_47416
LB_47415:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_47416:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_47413
	btr QWORD [rdi],0
	jmp LB_47414
LB_47413:
	bts QWORD [rdi],0
LB_47414:
	mov r14,r13
	bt r12,0
	jc LB_47419
	btr r12,1
	jmp LB_47420
LB_47419:
	bts r12,1
LB_47420:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_47417
	btr QWORD [rdi],1
	jmp LB_47418
LB_47417:
	bts QWORD [rdi],1
LB_47418:
	mov r8,0
	bts r12,2
	ret
LB_47421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47423
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47422
LB_47423:
	add rsp,8
	ret
LB_47424:
	add rsp,32
	pop r14
LB_47422:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_40453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47461
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47453
LB_47461:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_47469
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_47469
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_47469
	jmp LB_47470
LB_47469:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47467
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47467:
	jmp LB_47453
LB_47470:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47456
	btr r12,1
	jmp LB_47457
LB_47456:
	bts r12,1
LB_47457:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47454
	btr r12,0
	jmp LB_47455
LB_47454:
	bts r12,0
LB_47455:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47450
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f41263 {  } ⊢ %_45295 : %_45295
 ; {>  %_45294~0':_r64 }
; _f41263 {  } ⊢ °2◂{  }
; _some { %_45295 %_45294 } ⊢ %_45296 : %_45296
 ; {>  %_45295~°2◂{  }:_p41191 %_45294~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_45296
 ; {>  %_45296~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p41191 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_47444
	mov rsi,0
	bt r14,0
	jc LB_47444
	jmp LB_47445
LB_47444:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_47445:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_47442
	btr QWORD [rdi],0
	jmp LB_47443
LB_47442:
	bts QWORD [rdi],0
LB_47443:
	mov r14,r13
	bt r12,0
	jc LB_47448
	btr r12,1
	jmp LB_47449
LB_47448:
	bts r12,1
LB_47449:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_47446
	btr QWORD [rdi],1
	jmp LB_47447
LB_47446:
	bts QWORD [rdi],1
LB_47447:
	mov r8,0
	bts r12,2
	ret
LB_47450:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47452
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47451
LB_47452:
	add rsp,8
	ret
LB_47453:
	add rsp,32
	pop r14
LB_47451:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_40453_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47490
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47482
LB_47490:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_47498
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_47498
	jmp LB_47499
LB_47498:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47496
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47496:
	jmp LB_47482
LB_47499:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47485
	btr r12,1
	jmp LB_47486
LB_47485:
	bts r12,1
LB_47486:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47483
	btr r12,0
	jmp LB_47484
LB_47483:
	bts r12,0
LB_47484:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47479
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f41261 {  } ⊢ %_45298 : %_45298
 ; {>  %_45297~0':_r64 }
; _f41261 {  } ⊢ °0◂{  }
; _some { %_45298 %_45297 } ⊢ %_45299 : %_45299
 ; {>  %_45297~0':_r64 %_45298~°0◂{  }:_p41191 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_45299
 ; {>  %_45299~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p41191 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_47473
	mov rsi,0
	bt r14,0
	jc LB_47473
	jmp LB_47474
LB_47473:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_47474:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_47471
	btr QWORD [rdi],0
	jmp LB_47472
LB_47471:
	bts QWORD [rdi],0
LB_47472:
	mov r14,r13
	bt r12,0
	jc LB_47477
	btr r12,1
	jmp LB_47478
LB_47477:
	bts r12,1
LB_47478:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_47475
	btr QWORD [rdi],1
	jmp LB_47476
LB_47475:
	bts QWORD [rdi],1
LB_47476:
	mov r8,0
	bts r12,2
	ret
LB_47479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47481
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47480
LB_47481:
	add rsp,8
	ret
LB_47482:
	add rsp,32
	pop r14
LB_47480:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45071:
NS_E_RDI_45071:
NS_E_45071_ETR_TBL:
NS_E_45071_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_47515
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_47515
	jmp LB_47516
LB_47515:
	jmp LB_47505
LB_47516:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_45072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47521
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47521:
	jmp LB_47505
LB_47520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47508
	btr r12,1
	jmp LB_47509
LB_47508:
	bts r12,1
LB_47509:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47506
	btr r12,0
	jmp LB_47507
LB_47506:
	bts r12,0
LB_47507:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47502
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_47523
	btr r12,2
	jmp LB_47524
LB_47523:
	bts r12,2
LB_47524:
	mov r13,r14
	bt r12,1
	jc LB_47525
	btr r12,0
	jmp LB_47526
LB_47525:
	bts r12,0
LB_47526:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f40564 %_45300 ⊢ %_45301 : %_45301
 ; {>  %_45300~0':(_lst)◂(_r64) }
; _f40564 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_40564
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_45301 ⊢ %_45302 : %_45302
 ; {>  %_45301~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_45302
 ; {>  %_45302~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47500
	btr r12,3
	jmp LB_47501
LB_47500:
	bts r12,3
LB_47501:
	mov r8,0
	bts r12,2
	ret
LB_47502:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47504
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47503
LB_47504:
	add rsp,8
	ret
LB_47505:
	add rsp,32
	pop r14
LB_47503:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45072:
NS_E_RDI_45072:
NS_E_45072_ETR_TBL:
NS_E_45072_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_47548
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_47548
	jmp LB_47549
LB_47548:
	jmp LB_47540
LB_47549:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47541
	btr r12,0
	jmp LB_47542
LB_47541:
	bts r12,0
LB_47542:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47537
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_45303 : %_45303
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_45303
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_45304 : %_45304
 ; {>  %_45303~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_45303 %_45304 } ⊢ %_45305 : %_45305
 ; {>  %_45304~°1◂{  }:(_lst)◂(t17785'(0)) %_45303~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_45305 ⊢ %_45306 : %_45306
 ; {>  %_45305~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_45306
 ; {>  %_45306~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_47531
	btr r12,1
	jmp LB_47532
LB_47531:
	bts r12,1
LB_47532:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_47529
	btr QWORD [rdi],0
	jmp LB_47530
LB_47529:
	bts QWORD [rdi],0
LB_47530:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_47535
	mov rsi,0
	bt r14,0
	jc LB_47535
	jmp LB_47536
LB_47535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_47536:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_47533
	btr QWORD [rdi],1
	jmp LB_47534
LB_47533:
	bts QWORD [rdi],1
LB_47534:
	mov rsi,1
	bt r12,3
	jc LB_47527
	mov rsi,0
	bt r9,0
	jc LB_47527
	jmp LB_47528
LB_47527:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47528:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47537:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47539
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47538
LB_47539:
	add rsp,8
	ret
LB_47540:
	add rsp,16
	pop r14
LB_47538:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_40451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47571
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47563
LB_47571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_45072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47576
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47577:
	jmp LB_47563
LB_47576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47566
	btr r12,1
	jmp LB_47567
LB_47566:
	bts r12,1
LB_47567:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47564
	btr r12,0
	jmp LB_47565
LB_47564:
	bts r12,0
LB_47565:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47560
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_45307 %_45308 } ⊢ %_45309 : %_45309
 ; {>  %_45308~1':(_lst)◂(_r64) %_45307~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45309 ⊢ %_45310 : %_45310
 ; {>  %_45309~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45310
 ; {>  %_45310~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47554
	btr r12,2
	jmp LB_47555
LB_47554:
	bts r12,2
LB_47555:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47552
	btr QWORD [rdi],0
	jmp LB_47553
LB_47552:
	bts QWORD [rdi],0
LB_47553:
	mov r8,r14
	bt r12,1
	jc LB_47558
	btr r12,2
	jmp LB_47559
LB_47558:
	bts r12,2
LB_47559:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47556
	btr QWORD [rdi],1
	jmp LB_47557
LB_47556:
	bts QWORD [rdi],1
LB_47557:
	mov rsi,1
	bt r12,3
	jc LB_47550
	mov rsi,0
	bt r9,0
	jc LB_47550
	jmp LB_47551
LB_47550:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47551:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47560:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47562
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47561
LB_47562:
	add rsp,8
	ret
LB_47563:
	add rsp,32
	pop r14
LB_47561:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45073:
NS_E_RDI_45073:
NS_E_45073_ETR_TBL:
NS_E_45073_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_47617
LB_47616:
	add r14,1
LB_47617:
	cmp r14,r10
	jge LB_47618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47616
	cmp al,10
	jz LB_47616
	cmp al,32
	jz LB_47616
LB_47618:
	add r14,4
	cmp r14,r10
	jg LB_47621
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_47621
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_47621
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_47621
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_47621
	jmp LB_47622
LB_47621:
	jmp LB_47595
LB_47622:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_47604
LB_47603:
	add r14,1
LB_47604:
	cmp r14,r10
	jge LB_47605
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47603
	cmp al,10
	jz LB_47603
	cmp al,32
	jz LB_47603
LB_47605:
	push r10
	call NS_E_45074_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47606
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47607
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47607:
	jmp LB_47596
LB_47606:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_47610
LB_47609:
	add r14,1
LB_47610:
	cmp r14,r10
	jge LB_47611
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47609
	cmp al,10
	jz LB_47609
	cmp al,32
	jz LB_47609
LB_47611:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47612
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47613
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47613:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47614:
	jmp LB_47596
LB_47612:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47601
	btr r12,2
	jmp LB_47602
LB_47601:
	bts r12,2
LB_47602:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47599
	btr r12,1
	jmp LB_47600
LB_47599:
	bts r12,1
LB_47600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47597
	btr r12,0
	jmp LB_47598
LB_47597:
	bts r12,0
LB_47598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_47592
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_47623
	btr r12,3
	jmp LB_47624
LB_47623:
	bts r12,3
LB_47624:
	mov r14,r8
	bt r12,2
	jc LB_47625
	btr r12,1
	jmp LB_47626
LB_47625:
	bts r12,1
LB_47626:
	mov r8,r13
	bt r12,0
	jc LB_47627
	btr r12,2
	jmp LB_47628
LB_47627:
	bts r12,2
LB_47628:
	mov r13,r9
	bt r12,3
	jc LB_47629
	btr r12,0
	jmp LB_47630
LB_47629:
	bts r12,0
LB_47630:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_45313 : %_45313
 ; {>  %_45311~0':(_lst)◂(_p41187) %_45312~1':_p41184 }
; _nil {  } ⊢ °1◂{  }
; _f41247 %_45312 ⊢ %_45314 : %_45314
 ; {>  %_45311~0':(_lst)◂(_p41187) %_45312~1':_p41184 %_45313~°1◂{  }:(_lst)◂(t17800'(0)) }
; _f41247 1' ⊢ °1◂1'
; _f41245 { %_45313 %_45314 } ⊢ %_45315 : %_45315
 ; {>  %_45311~0':(_lst)◂(_p41187) %_45314~°1◂1':_p41186 %_45313~°1◂{  }:(_lst)◂(t17800'(0)) }
; _f41245 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_45315 ⊢ %_45316 : %_45316
 ; {>  %_45315~°1◂{ °1◂{  } °1◂1' }:_p41185 %_45311~0':(_lst)◂(_p41187) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_45316
 ; {>  %_45311~0':(_lst)◂(_p41187) %_45316~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p41185) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_47579
	mov rdi,r13
	call dlt
LB_47579:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_47584
	mov rsi,0
	bt r13,0
	jc LB_47584
	jmp LB_47585
LB_47584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47585:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_47582
	btr QWORD [rdi],0
	jmp LB_47583
LB_47582:
	bts QWORD [rdi],0
LB_47583:
	mov r13,r14
	bt r12,1
	jc LB_47590
	btr r12,0
	jmp LB_47591
LB_47590:
	bts r12,0
LB_47591:
	mov rsi,1
	bt r12,0
	jc LB_47588
	mov rsi,0
	bt r13,0
	jc LB_47588
	jmp LB_47589
LB_47588:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47589:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_47586
	btr QWORD [rdi],1
	jmp LB_47587
LB_47586:
	bts QWORD [rdi],1
LB_47587:
	mov rsi,1
	bt r12,3
	jc LB_47580
	mov rsi,0
	bt r9,0
	jc LB_47580
	jmp LB_47581
LB_47580:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47581:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47592:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47594
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47593
LB_47594:
	add rsp,8
	ret
LB_47596:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_47595:
	add rsp,48
	pop r14
LB_47593:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_47661
LB_47660:
	add r14,1
LB_47661:
	cmp r14,r10
	jge LB_47662
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47660
	cmp al,10
	jz LB_47660
	cmp al,32
	jz LB_47660
LB_47662:
	add r14,3
	cmp r14,r10
	jg LB_47665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_47665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_47665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_47665
	jmp LB_47666
LB_47665:
	jmp LB_47651
LB_47666:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_47668
LB_47667:
	add r14,1
LB_47668:
	cmp r14,r10
	jge LB_47669
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47667
	cmp al,10
	jz LB_47667
	cmp al,32
	jz LB_47667
LB_47669:
	push r10
	call NS_E_45074_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47670
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47671
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47671:
	jmp LB_47651
LB_47670:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_47674
LB_47673:
	add r14,1
LB_47674:
	cmp r14,r10
	jge LB_47675
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47673
	cmp al,10
	jz LB_47673
	cmp al,32
	jz LB_47673
LB_47675:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47676
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47677
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47677:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47678
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47678:
	jmp LB_47651
LB_47676:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_47681
LB_47680:
	add r14,1
LB_47681:
	cmp r14,r10
	jge LB_47682
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47680
	cmp al,10
	jz LB_47680
	cmp al,32
	jz LB_47680
LB_47682:
	push r10
	call NS_E_45073_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47683
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47684
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47684:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47685
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47685:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47686
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47686:
	jmp LB_47651
LB_47683:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_47658
	btr r12,3
	jmp LB_47659
LB_47658:
	bts r12,3
LB_47659:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47656
	btr r12,2
	jmp LB_47657
LB_47656:
	bts r12,2
LB_47657:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47654
	btr r12,1
	jmp LB_47655
LB_47654:
	bts r12,1
LB_47655:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47652
	btr r12,0
	jmp LB_47653
LB_47652:
	bts r12,0
LB_47653:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_47648
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_47688
	btr r12,4
	jmp LB_47689
LB_47688:
	bts r12,4
LB_47689:
	mov r8,r9
	bt r12,3
	jc LB_47690
	btr r12,2
	jmp LB_47691
LB_47690:
	bts r12,2
LB_47691:
	mov r9,r14
	bt r12,1
	jc LB_47692
	btr r12,3
	jmp LB_47693
LB_47692:
	bts r12,3
LB_47693:
	mov r14,r10
	bt r12,4
	jc LB_47694
	btr r12,1
	jmp LB_47695
LB_47694:
	bts r12,1
LB_47695:
	mov r10,r13
	bt r12,0
	jc LB_47696
	btr r12,4
	jmp LB_47697
LB_47696:
	bts r12,4
LB_47697:
	mov r13,r9
	bt r12,3
	jc LB_47698
	btr r12,0
	jmp LB_47699
LB_47698:
	bts r12,0
LB_47699:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_45320 : %_45320
 ; {>  %_45317~0':(_lst)◂(_p41187) %_45318~1':_p41184 %_45319~2':_p41185 }
; _nil {  } ⊢ °1◂{  }
; _f41247 %_45318 ⊢ %_45321 : %_45321
 ; {>  %_45317~0':(_lst)◂(_p41187) %_45318~1':_p41184 %_45320~°1◂{  }:(_lst)◂(t17810'(0)) %_45319~2':_p41185 }
; _f41247 1' ⊢ °1◂1'
; _f41244 { %_45320 %_45321 %_45319 } ⊢ %_45322 : %_45322
 ; {>  %_45317~0':(_lst)◂(_p41187) %_45320~°1◂{  }:(_lst)◂(t17810'(0)) %_45321~°1◂1':_p41186 %_45319~2':_p41185 }
; _f41244 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_45322 ⊢ %_45323 : %_45323
 ; {>  %_45317~0':(_lst)◂(_p41187) %_45322~°0◂{ °1◂{  } °1◂1' 2' }:_p41185 }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_45323
 ; {>  %_45317~0':(_lst)◂(_p41187) %_45323~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p41185) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_47631
	mov rdi,r13
	call dlt
LB_47631:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_47636
	mov rsi,0
	bt r13,0
	jc LB_47636
	jmp LB_47637
LB_47636:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47637:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_47634
	btr QWORD [rdi],0
	jmp LB_47635
LB_47634:
	bts QWORD [rdi],0
LB_47635:
	mov r13,r14
	bt r12,1
	jc LB_47642
	btr r12,0
	jmp LB_47643
LB_47642:
	bts r12,0
LB_47643:
	mov rsi,1
	bt r12,0
	jc LB_47640
	mov rsi,0
	bt r13,0
	jc LB_47640
	jmp LB_47641
LB_47640:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47641:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_47638
	btr QWORD [rdi],1
	jmp LB_47639
LB_47638:
	bts QWORD [rdi],1
LB_47639:
	mov r13,r8
	bt r12,2
	jc LB_47646
	btr r12,0
	jmp LB_47647
LB_47646:
	bts r12,0
LB_47647:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_47644
	btr QWORD [rdi],2
	jmp LB_47645
LB_47644:
	bts QWORD [rdi],2
LB_47645:
	mov rsi,1
	bt r12,3
	jc LB_47632
	mov rsi,0
	bt r9,0
	jc LB_47632
	jmp LB_47633
LB_47632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47633:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47648:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47650
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47649
LB_47650:
	add rsp,8
	ret
LB_47651:
	add rsp,64
	pop r14
LB_47649:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45074:
NS_E_RDI_45074:
NS_E_45074_ETR_TBL:
NS_E_45074_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_47719
LB_47718:
	add r14,1
LB_47719:
	cmp r14,r10
	jge LB_47720
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47718
	cmp al,10
	jz LB_47718
	cmp al,32
	jz LB_47718
LB_47720:
	push r10
	call NS_E_45075_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47721
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47713
LB_47721:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_47724
LB_47723:
	add r14,1
LB_47724:
	cmp r14,r10
	jge LB_47725
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47723
	cmp al,10
	jz LB_47723
	cmp al,32
	jz LB_47723
LB_47725:
	push r10
	call NS_E_45076_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47726
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47727
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47727:
	jmp LB_47713
LB_47726:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47716
	btr r12,1
	jmp LB_47717
LB_47716:
	bts r12,1
LB_47717:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47714
	btr r12,0
	jmp LB_47715
LB_47714:
	bts r12,0
LB_47715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47710
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_45324 %_45325 } ⊢ %_45326 : %_45326
 ; {>  %_45324~0':_p41187 %_45325~1':(_lst)◂(_p41187) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45326 ⊢ %_45327 : %_45327
 ; {>  %_45326~°0◂{ 0' 1' }:(_lst)◂(_p41187) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45327
 ; {>  %_45327~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41187)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47704
	btr r12,2
	jmp LB_47705
LB_47704:
	bts r12,2
LB_47705:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47702
	btr QWORD [rdi],0
	jmp LB_47703
LB_47702:
	bts QWORD [rdi],0
LB_47703:
	mov r8,r14
	bt r12,1
	jc LB_47708
	btr r12,2
	jmp LB_47709
LB_47708:
	bts r12,2
LB_47709:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47706
	btr QWORD [rdi],1
	jmp LB_47707
LB_47706:
	bts QWORD [rdi],1
LB_47707:
	mov rsi,1
	bt r12,3
	jc LB_47700
	mov rsi,0
	bt r9,0
	jc LB_47700
	jmp LB_47701
LB_47700:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47701:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47710:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47712
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47711
LB_47712:
	add rsp,8
	ret
LB_47713:
	add rsp,32
	pop r14
LB_47711:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_47740
LB_47739:
	add r14,1
LB_47740:
	cmp r14,r10
	jge LB_47741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47739
	cmp al,32
	jz LB_47739
LB_47741:
	add r14,1
	cmp r14,r10
	jg LB_47744
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_47744
	jmp LB_47745
LB_47744:
	jmp LB_47734
LB_47745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_47747
LB_47746:
	add r14,1
LB_47747:
	cmp r14,r10
	jge LB_47748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47746
	cmp al,32
	jz LB_47746
LB_47748:
	add r14,1
	cmp r14,r10
	jg LB_47752
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_47752
	jmp LB_47753
LB_47752:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47750
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47750:
	jmp LB_47734
LB_47753:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47737
	btr r12,1
	jmp LB_47738
LB_47737:
	bts r12,1
LB_47738:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47735
	btr r12,0
	jmp LB_47736
LB_47735:
	bts r12,0
LB_47736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47731
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_45328 : %_45328
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_45328 ⊢ %_45329 : %_45329
 ; {>  %_45328~°1◂{  }:(_lst)◂(t17823'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45329
 ; {>  %_45329~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17826'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_47729
	mov rsi,0
	bt r9,0
	jc LB_47729
	jmp LB_47730
LB_47729:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47730:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47731:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47733
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47732
LB_47733:
	add rsp,8
	ret
LB_47734:
	add rsp,32
	pop r14
LB_47732:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45075:
NS_E_RDI_45075:
NS_E_45075_ETR_TBL:
NS_E_45075_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_47810
LB_47809:
	add r14,1
LB_47810:
	cmp r14,r10
	jge LB_47811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47809
	cmp al,10
	jz LB_47809
	cmp al,32
	jz LB_47809
LB_47811:
	push r10
	call NS_E_44201_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47812
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47771
LB_47812:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_47815
LB_47814:
	add r14,1
LB_47815:
	cmp r14,r10
	jge LB_47816
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47814
	cmp al,10
	jz LB_47814
	cmp al,32
	jz LB_47814
LB_47816:
	add r14,3
	cmp r14,r10
	jg LB_47820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_47820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_47820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_47820
	jmp LB_47821
LB_47820:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47818
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47818:
	jmp LB_47771
LB_47821:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_47784
LB_47783:
	add r14,1
LB_47784:
	cmp r14,r10
	jge LB_47785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47783
	cmp al,10
	jz LB_47783
	cmp al,32
	jz LB_47783
LB_47785:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47786
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47787
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47787:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47788
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47788:
	jmp LB_47772
LB_47786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_47791
LB_47790:
	add r14,1
LB_47791:
	cmp r14,r10
	jge LB_47792
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47790
	cmp al,10
	jz LB_47790
	cmp al,32
	jz LB_47790
LB_47792:
	add r14,3
	cmp r14,r10
	jg LB_47798
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_47798
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_47798
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_47798
	jmp LB_47799
LB_47798:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47794
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47794:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47795
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47795:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47796
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47796:
	jmp LB_47772
LB_47799:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_47801
LB_47800:
	add r14,1
LB_47801:
	cmp r14,r10
	jge LB_47802
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47800
	cmp al,10
	jz LB_47800
	cmp al,32
	jz LB_47800
LB_47802:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47803
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_47804
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_47804:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_47805
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_47805:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47806
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47806:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47807
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47807:
	jmp LB_47772
LB_47803:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_47781
	btr r12,4
	jmp LB_47782
LB_47781:
	bts r12,4
LB_47782:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_47779
	btr r12,3
	jmp LB_47780
LB_47779:
	bts r12,3
LB_47780:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47777
	btr r12,2
	jmp LB_47778
LB_47777:
	bts r12,2
LB_47778:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47775
	btr r12,1
	jmp LB_47776
LB_47775:
	bts r12,1
LB_47776:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47773
	btr r12,0
	jmp LB_47774
LB_47773:
	bts r12,0
LB_47774:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_47768
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_47822
	btr r12,5
	jmp LB_47823
LB_47822:
	bts r12,5
LB_47823:
	mov r8,r10
	bt r12,4
	jc LB_47824
	btr r12,2
	jmp LB_47825
LB_47824:
	bts r12,2
LB_47825:
	mov r10,r14
	bt r12,1
	jc LB_47826
	btr r12,4
	jmp LB_47827
LB_47826:
	bts r12,4
LB_47827:
	mov r14,r11
	bt r12,5
	jc LB_47828
	btr r12,1
	jmp LB_47829
LB_47828:
	bts r12,1
LB_47829:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f41248 { %_45330 %_45331 %_45332 } ⊢ %_45333 : %_45333
 ; {>  %_45332~2':_p41181 %_45330~0':_p41180 %_45331~1':_p41117 }
; _f41248 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_45333 ⊢ %_45334 : %_45334
 ; {>  %_45333~°0◂{ 0' 1' 2' }:_p41187 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_45334
 ; {>  %_45334~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p41187) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_47758
	btr r12,4
	jmp LB_47759
LB_47758:
	bts r12,4
LB_47759:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_47756
	btr QWORD [rdi],0
	jmp LB_47757
LB_47756:
	bts QWORD [rdi],0
LB_47757:
	mov r10,r14
	bt r12,1
	jc LB_47762
	btr r12,4
	jmp LB_47763
LB_47762:
	bts r12,4
LB_47763:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_47760
	btr QWORD [rdi],1
	jmp LB_47761
LB_47760:
	bts QWORD [rdi],1
LB_47761:
	mov r10,r8
	bt r12,2
	jc LB_47766
	btr r12,4
	jmp LB_47767
LB_47766:
	bts r12,4
LB_47767:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_47764
	btr QWORD [rdi],2
	jmp LB_47765
LB_47764:
	bts QWORD [rdi],2
LB_47765:
	mov rsi,1
	bt r12,3
	jc LB_47754
	mov rsi,0
	bt r9,0
	jc LB_47754
	jmp LB_47755
LB_47754:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47755:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47768:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47770
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47769
LB_47770:
	add rsp,8
	ret
LB_47772:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_47771:
	add rsp,80
	pop r14
LB_47769:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_47851
LB_47850:
	add r14,1
LB_47851:
	cmp r14,r10
	jge LB_47852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47850
	cmp al,32
	jz LB_47850
LB_47852:
	push r10
	call NS_E_45077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47853
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47843
LB_47853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_47856
LB_47855:
	add r14,1
LB_47856:
	cmp r14,r10
	jge LB_47857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47855
	cmp al,32
	jz LB_47855
LB_47857:
	add r14,1
	cmp r14,r10
	jg LB_47861
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_47861
	jmp LB_47862
LB_47861:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47859:
	jmp LB_47843
LB_47862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_47864
LB_47863:
	add r14,1
LB_47864:
	cmp r14,r10
	jge LB_47865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47863
	cmp al,32
	jz LB_47863
LB_47865:
	push r10
	call NS_E_45077_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47866
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47868:
	jmp LB_47843
LB_47866:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47848
	btr r12,2
	jmp LB_47849
LB_47848:
	bts r12,2
LB_47849:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47846
	btr r12,1
	jmp LB_47847
LB_47846:
	bts r12,1
LB_47847:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47844
	btr r12,0
	jmp LB_47845
LB_47844:
	bts r12,0
LB_47845:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_47840
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_47870
	btr r12,3
	jmp LB_47871
LB_47870:
	bts r12,3
LB_47871:
	mov r14,r8
	bt r12,2
	jc LB_47872
	btr r12,1
	jmp LB_47873
LB_47872:
	bts r12,1
LB_47873:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f41249 { %_45335 %_45336 } ⊢ %_45337 : %_45337
 ; {>  %_45335~0':_p41188 %_45336~1':_p41188 }
; _f41249 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_45337 ⊢ %_45338 : %_45338
 ; {>  %_45337~°1◂{ 0' 1' }:_p41187 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_45338
 ; {>  %_45338~°0◂°1◂{ 0' 1' }:(_opn)◂(_p41187) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47834
	btr r12,2
	jmp LB_47835
LB_47834:
	bts r12,2
LB_47835:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47832
	btr QWORD [rdi],0
	jmp LB_47833
LB_47832:
	bts QWORD [rdi],0
LB_47833:
	mov r8,r14
	bt r12,1
	jc LB_47838
	btr r12,2
	jmp LB_47839
LB_47838:
	bts r12,2
LB_47839:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47836
	btr QWORD [rdi],1
	jmp LB_47837
LB_47836:
	bts QWORD [rdi],1
LB_47837:
	mov rsi,1
	bt r12,3
	jc LB_47830
	mov rsi,0
	bt r9,0
	jc LB_47830
	jmp LB_47831
LB_47830:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47831:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47840:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47842
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47841
LB_47842:
	add rsp,8
	ret
LB_47843:
	add rsp,48
	pop r14
LB_47841:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45076:
NS_E_RDI_45076:
NS_E_45076_ETR_TBL:
NS_E_45076_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_47909
LB_47908:
	add r14,1
LB_47909:
	cmp r14,r10
	jge LB_47910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47908
	cmp al,10
	jz LB_47908
	cmp al,32
	jz LB_47908
LB_47910:
	add r14,1
	cmp r14,r10
	jg LB_47913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_47913
	jmp LB_47914
LB_47913:
	jmp LB_47887
LB_47914:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_47896
LB_47895:
	add r14,1
LB_47896:
	cmp r14,r10
	jge LB_47897
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47895
	cmp al,10
	jz LB_47895
	cmp al,32
	jz LB_47895
LB_47897:
	push r10
	call NS_E_45075_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47898
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47899
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47899:
	jmp LB_47888
LB_47898:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_47902
LB_47901:
	add r14,1
LB_47902:
	cmp r14,r10
	jge LB_47903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47901
	cmp al,10
	jz LB_47901
	cmp al,32
	jz LB_47901
LB_47903:
	push r10
	call NS_E_45076_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47904
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47905
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47905:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47906
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47906:
	jmp LB_47888
LB_47904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47893
	btr r12,2
	jmp LB_47894
LB_47893:
	bts r12,2
LB_47894:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47891
	btr r12,1
	jmp LB_47892
LB_47891:
	bts r12,1
LB_47892:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47889
	btr r12,0
	jmp LB_47890
LB_47889:
	bts r12,0
LB_47890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_47884
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_47915
	btr r12,3
	jmp LB_47916
LB_47915:
	bts r12,3
LB_47916:
	mov r14,r8
	bt r12,2
	jc LB_47917
	btr r12,1
	jmp LB_47918
LB_47917:
	bts r12,1
LB_47918:
	mov r8,r13
	bt r12,0
	jc LB_47919
	btr r12,2
	jmp LB_47920
LB_47919:
	bts r12,2
LB_47920:
	mov r13,r9
	bt r12,3
	jc LB_47921
	btr r12,0
	jmp LB_47922
LB_47921:
	bts r12,0
LB_47922:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_45339 %_45340 } ⊢ %_45341 : %_45341
 ; {>  %_45339~0':_p41187 %_45340~1':(_lst)◂(_p41187) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45341 ⊢ %_45342 : %_45342
 ; {>  %_45341~°0◂{ 0' 1' }:(_lst)◂(_p41187) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45342
 ; {>  %_45342~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p41187)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47878
	btr r12,2
	jmp LB_47879
LB_47878:
	bts r12,2
LB_47879:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47876
	btr QWORD [rdi],0
	jmp LB_47877
LB_47876:
	bts QWORD [rdi],0
LB_47877:
	mov r8,r14
	bt r12,1
	jc LB_47882
	btr r12,2
	jmp LB_47883
LB_47882:
	bts r12,2
LB_47883:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47880
	btr QWORD [rdi],1
	jmp LB_47881
LB_47880:
	bts QWORD [rdi],1
LB_47881:
	mov rsi,1
	bt r12,3
	jc LB_47874
	mov rsi,0
	bt r9,0
	jc LB_47874
	jmp LB_47875
LB_47874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47875:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47884:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47886
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47885
LB_47886:
	add rsp,8
	ret
LB_47888:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_47887:
	add rsp,48
	pop r14
LB_47885:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_47934
LB_47933:
	add r14,1
LB_47934:
	cmp r14,r10
	jge LB_47935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47933
	cmp al,32
	jz LB_47933
LB_47935:
	add r14,1
	cmp r14,r10
	jg LB_47938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_47938
	jmp LB_47939
LB_47938:
	jmp LB_47928
LB_47939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_47941
LB_47940:
	add r14,1
LB_47941:
	cmp r14,r10
	jge LB_47942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47940
	cmp al,32
	jz LB_47940
LB_47942:
	add r14,1
	cmp r14,r10
	jg LB_47946
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_47946
	jmp LB_47947
LB_47946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47944:
	jmp LB_47928
LB_47947:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47931
	btr r12,1
	jmp LB_47932
LB_47931:
	bts r12,1
LB_47932:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47929
	btr r12,0
	jmp LB_47930
LB_47929:
	bts r12,0
LB_47930:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47925
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_45343 : %_45343
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_45343 ⊢ %_45344 : %_45344
 ; {>  %_45343~°1◂{  }:(_lst)◂(t17847'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45344
 ; {>  %_45344~°0◂°1◂{  }:(_opn)◂((_lst)◂(t17850'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_47923
	mov rsi,0
	bt r9,0
	jc LB_47923
	jmp LB_47924
LB_47923:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47924:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47925:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47927
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47926
LB_47927:
	add rsp,8
	ret
LB_47928:
	add rsp,32
	pop r14
LB_47926:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45077:
NS_E_RDI_45077:
NS_E_45077_ETR_TBL:
NS_E_45077_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47963
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47955
LB_47963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_47971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_47971
	jmp LB_47972
LB_47971:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47969
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47969:
	jmp LB_47955
LB_47972:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47958
	btr r12,1
	jmp LB_47959
LB_47958:
	bts r12,1
LB_47959:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47956
	btr r12,0
	jmp LB_47957
LB_47956:
	bts r12,0
LB_47957:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47952
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f41251 %_45345 ⊢ %_45346 : %_45346
 ; {>  %_45345~0':_stg }
; _f41251 0' ⊢ °1◂0'
; _some %_45346 ⊢ %_45347 : %_45347
 ; {>  %_45346~°1◂0':_p41188 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45347
 ; {>  %_45347~°0◂°1◂0':(_opn)◂(_p41188) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47950
	btr r12,3
	jmp LB_47951
LB_47950:
	bts r12,3
LB_47951:
	mov rsi,1
	bt r12,3
	jc LB_47948
	mov rsi,0
	bt r9,0
	jc LB_47948
	jmp LB_47949
LB_47948:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47949:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47952:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47954
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47953
LB_47954:
	add rsp,8
	ret
LB_47955:
	add rsp,32
	pop r14
LB_47953:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_44072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47986
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47980
LB_47986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47981
	btr r12,0
	jmp LB_47982
LB_47981:
	bts r12,0
LB_47982:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47977
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41250 %_45348 ⊢ %_45349 : %_45349
 ; {>  %_45348~0':_p41183 }
; _f41250 0' ⊢ °0◂0'
; _some %_45349 ⊢ %_45350 : %_45350
 ; {>  %_45349~°0◂0':_p41188 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45350
 ; {>  %_45350~°0◂°0◂0':(_opn)◂(_p41188) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47975
	btr r12,3
	jmp LB_47976
LB_47975:
	bts r12,3
LB_47976:
	mov rsi,1
	bt r12,3
	jc LB_47973
	mov rsi,0
	bt r9,0
	jc LB_47973
	jmp LB_47974
LB_47973:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47974:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47977:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47979
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47978
LB_47979:
	add rsp,8
	ret
LB_47980:
	add rsp,16
	pop r14
LB_47978:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45078:
NS_E_RDI_45078:
NS_E_45078_ETR_TBL:
NS_E_45078_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_48009
LB_48008:
	add r14,1
LB_48009:
	cmp r14,r10
	jge LB_48010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48008
	cmp al,10
	jz LB_48008
	cmp al,32
	jz LB_48008
LB_48010:
	add r14,1
	cmp r14,r10
	jg LB_48013
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_48013
	jmp LB_48014
LB_48013:
	jmp LB_47999
LB_48014:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_48016
LB_48015:
	add r14,1
LB_48016:
	cmp r14,r10
	jge LB_48017
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48015
	cmp al,10
	jz LB_48015
	cmp al,32
	jz LB_48015
LB_48017:
	add r14,1
	cmp r14,r10
	jg LB_48021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_48021
	jmp LB_48022
LB_48021:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48019
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48019:
	jmp LB_47999
LB_48022:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_48024
LB_48023:
	add r14,1
LB_48024:
	cmp r14,r10
	jge LB_48025
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48023
	cmp al,10
	jz LB_48023
	cmp al,32
	jz LB_48023
LB_48025:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48026
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48027
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48027:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48028
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48028:
	jmp LB_47999
LB_48026:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_48031
LB_48030:
	add r14,1
LB_48031:
	cmp r14,r10
	jge LB_48032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48030
	cmp al,10
	jz LB_48030
	cmp al,32
	jz LB_48030
LB_48032:
	push r10
	call NS_E_45079_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48033
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48034
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48034:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48035
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48035:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48036
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48036:
	jmp LB_47999
LB_48033:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48006
	btr r12,3
	jmp LB_48007
LB_48006:
	bts r12,3
LB_48007:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48004
	btr r12,2
	jmp LB_48005
LB_48004:
	bts r12,2
LB_48005:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48002
	btr r12,1
	jmp LB_48003
LB_48002:
	bts r12,1
LB_48003:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48000
	btr r12,0
	jmp LB_48001
LB_48000:
	bts r12,0
LB_48001:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_47996
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_48038
	btr r12,4
	jmp LB_48039
LB_48038:
	bts r12,4
LB_48039:
	mov r14,r9
	bt r12,3
	jc LB_48040
	btr r12,1
	jmp LB_48041
LB_48040:
	bts r12,1
LB_48041:
	mov r9,r13
	bt r12,0
	jc LB_48042
	btr r12,3
	jmp LB_48043
LB_48042:
	bts r12,3
LB_48043:
	mov r13,r8
	bt r12,2
	jc LB_48044
	btr r12,0
	jmp LB_48045
LB_48044:
	bts r12,0
LB_48045:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_45351 %_45352 } ⊢ %_45353 : %_45353
 ; {>  %_45351~0':_stg %_45352~1':_p41169 }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_45353
 ; {>  %_45353~°0◂{ 0' 1' }:(_opn)◂({ _stg _p41169 }) }
; 	∎ °0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_47990
	btr r12,2
	jmp LB_47991
LB_47990:
	bts r12,2
LB_47991:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47988
	btr QWORD [rdi],0
	jmp LB_47989
LB_47988:
	bts QWORD [rdi],0
LB_47989:
	mov r8,r14
	bt r12,1
	jc LB_47994
	btr r12,2
	jmp LB_47995
LB_47994:
	bts r12,2
LB_47995:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47992
	btr QWORD [rdi],1
	jmp LB_47993
LB_47992:
	bts QWORD [rdi],1
LB_47993:
	mov r8,0
	bts r12,2
	ret
LB_47996:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47998
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_47997
LB_47998:
	add rsp,8
	ret
LB_47999:
	add rsp,64
	pop r14
LB_47997:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45079:
NS_E_RDI_45079:
NS_E_45079_ETR_TBL:
NS_E_45079_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_48057
LB_48056:
	add r14,1
LB_48057:
	cmp r14,r10
	jge LB_48058
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48056
	cmp al,10
	jz LB_48056
	cmp al,32
	jz LB_48056
LB_48058:
	push r10
	call NS_E_45080_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48059
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48053
LB_48059:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48054
	btr r12,0
	jmp LB_48055
LB_48054:
	bts r12,0
LB_48055:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48050
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41206 %_45354 ⊢ %_45355 : %_45355
 ; {>  %_45354~0':_p41171 }
; _f41206 0' ⊢ °1◂0'
; _some %_45355 ⊢ %_45356 : %_45356
 ; {>  %_45355~°1◂0':_p41169 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45356
 ; {>  %_45356~°0◂°1◂0':(_opn)◂(_p41169) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48048
	btr r12,3
	jmp LB_48049
LB_48048:
	bts r12,3
LB_48049:
	mov rsi,1
	bt r12,3
	jc LB_48046
	mov rsi,0
	bt r9,0
	jc LB_48046
	jmp LB_48047
LB_48046:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48047:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48050:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48052
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48051
LB_48052:
	add rsp,8
	ret
LB_48053:
	add rsp,16
	pop r14
LB_48051:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_48072
LB_48071:
	add r14,1
LB_48072:
	cmp r14,r10
	jge LB_48073
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48071
	cmp al,10
	jz LB_48071
	cmp al,32
	jz LB_48071
LB_48073:
	push r10
	call NS_E_45088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48074
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48068
LB_48074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48069
	btr r12,0
	jmp LB_48070
LB_48069:
	bts r12,0
LB_48070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48065
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41205 %_45357 ⊢ %_45358 : %_45358
 ; {>  %_45357~0':_p41170 }
; _f41205 0' ⊢ °0◂0'
; _some %_45358 ⊢ %_45359 : %_45359
 ; {>  %_45358~°0◂0':_p41169 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45359
 ; {>  %_45359~°0◂°0◂0':(_opn)◂(_p41169) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48063
	btr r12,3
	jmp LB_48064
LB_48063:
	bts r12,3
LB_48064:
	mov rsi,1
	bt r12,3
	jc LB_48061
	mov rsi,0
	bt r9,0
	jc LB_48061
	jmp LB_48062
LB_48061:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48062:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48065:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48067
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48066
LB_48067:
	add rsp,8
	ret
LB_48068:
	add rsp,16
	pop r14
LB_48066:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45080:
NS_E_RDI_45080:
NS_E_45080_ETR_TBL:
NS_E_45080_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_48125
LB_48124:
	add r14,1
LB_48125:
	cmp r14,r10
	jge LB_48126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48124
	cmp al,10
	jz LB_48124
	cmp al,32
	jz LB_48124
LB_48126:
	push r10
	call NS_E_45087_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48127
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48103
LB_48127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_48112
LB_48111:
	add r14,1
LB_48112:
	cmp r14,r10
	jge LB_48113
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48111
	cmp al,10
	jz LB_48111
	cmp al,32
	jz LB_48111
LB_48113:
	push r10
	call NS_E_45082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48114
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48115
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48115:
	jmp LB_48104
LB_48114:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_48118
LB_48117:
	add r14,1
LB_48118:
	cmp r14,r10
	jge LB_48119
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48117
	cmp al,10
	jz LB_48117
	cmp al,32
	jz LB_48117
LB_48119:
	push r10
	call NS_E_45081_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48120
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48121
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48121:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48122
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48122:
	jmp LB_48104
LB_48120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48109
	btr r12,2
	jmp LB_48110
LB_48109:
	bts r12,2
LB_48110:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48107
	btr r12,1
	jmp LB_48108
LB_48107:
	bts r12,1
LB_48108:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48105
	btr r12,0
	jmp LB_48106
LB_48105:
	bts r12,0
LB_48106:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_48100
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_48129
	btr r12,5
	jmp LB_48130
LB_48129:
	bts r12,5
LB_48130:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_48133
	btr r12,6
	jmp LB_48134
LB_48133:
	bts r12,6
LB_48134:
	mov r8,rcx
	bt r12,6
	jc LB_48131
	btr r12,2
	jmp LB_48132
LB_48131:
	bts r12,2
LB_48132:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_48137
	btr r12,6
	jmp LB_48138
LB_48137:
	bts r12,6
LB_48138:
	mov r9,rcx
	bt r12,6
	jc LB_48135
	btr r12,3
	jmp LB_48136
LB_48135:
	bts r12,3
LB_48136:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_48141
	btr r12,6
	jmp LB_48142
LB_48141:
	bts r12,6
LB_48142:
	mov r10,rcx
	bt r12,6
	jc LB_48139
	btr r12,4
	jmp LB_48140
LB_48139:
	bts r12,4
LB_48140:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f41210 { %_45362 %_45363 %_45360 %_45361 %_45364 } ⊢ %_45365 : %_45365
 ; {>  %_45364~4':(_opn)◂(_p41171) %_45361~1':_p41173 %_45360~0':_p41172 %_45363~3':_p41184 %_45362~2':_p41181 }
; _f41210 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_45365 ⊢ %_45366 : %_45366
 ; {>  %_45365~°1◂{ 2' 3' 0' 1' 4' }:_p41171 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_45366
 ; {>  %_45366~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p41171) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_48076
	btr r12,5
	jmp LB_48077
LB_48076:
	bts r12,5
LB_48077:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_48082
	btr r12,6
	jmp LB_48083
LB_48082:
	bts r12,6
LB_48083:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_48080
	btr QWORD [rdi],0
	jmp LB_48081
LB_48080:
	bts QWORD [rdi],0
LB_48081:
	mov rcx,r11
	bt r12,5
	jc LB_48086
	btr r12,6
	jmp LB_48087
LB_48086:
	bts r12,6
LB_48087:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_48084
	btr QWORD [rdi],1
	jmp LB_48085
LB_48084:
	bts QWORD [rdi],1
LB_48085:
	mov rcx,r13
	bt r12,0
	jc LB_48090
	btr r12,6
	jmp LB_48091
LB_48090:
	bts r12,6
LB_48091:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_48088
	btr QWORD [rdi],2
	jmp LB_48089
LB_48088:
	bts QWORD [rdi],2
LB_48089:
	mov rcx,r14
	bt r12,1
	jc LB_48094
	btr r12,6
	jmp LB_48095
LB_48094:
	bts r12,6
LB_48095:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_48092
	btr QWORD [rdi],3
	jmp LB_48093
LB_48092:
	bts QWORD [rdi],3
LB_48093:
	mov rcx,r10
	bt r12,4
	jc LB_48098
	btr r12,6
	jmp LB_48099
LB_48098:
	bts r12,6
LB_48099:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_48096
	btr QWORD [rdi],4
	jmp LB_48097
LB_48096:
	bts QWORD [rdi],4
LB_48097:
	mov rsi,1
	bt r12,3
	jc LB_48078
	mov rsi,0
	bt r9,0
	jc LB_48078
	jmp LB_48079
LB_48078:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48079:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48102
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48101
LB_48102:
	add rsp,8
	ret
LB_48104:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_48103:
	add rsp,48
	pop r14
LB_48101:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_48184
LB_48183:
	add r14,1
LB_48184:
	cmp r14,r10
	jge LB_48185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48183
	cmp al,10
	jz LB_48183
	cmp al,32
	jz LB_48183
LB_48185:
	push r10
	call NS_E_45086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48186
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48174
LB_48186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_48189
LB_48188:
	add r14,1
LB_48189:
	cmp r14,r10
	jge LB_48190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48188
	cmp al,10
	jz LB_48188
	cmp al,32
	jz LB_48188
LB_48190:
	push r10
	call NS_E_45082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48191
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48192:
	jmp LB_48174
LB_48191:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_48195
LB_48194:
	add r14,1
LB_48195:
	cmp r14,r10
	jge LB_48196
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48194
	cmp al,10
	jz LB_48194
	cmp al,32
	jz LB_48194
LB_48196:
	push r10
	call NS_E_45081_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48197
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48198
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48198:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48199:
	jmp LB_48174
LB_48197:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_48202
LB_48201:
	add r14,1
LB_48202:
	cmp r14,r10
	jge LB_48203
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48201
	cmp al,10
	jz LB_48201
	cmp al,32
	jz LB_48201
LB_48203:
	push r10
	call NS_E_45080_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48204
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48205
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48205:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48206
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48206:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48207:
	jmp LB_48174
LB_48204:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48181
	btr r12,3
	jmp LB_48182
LB_48181:
	bts r12,3
LB_48182:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48179
	btr r12,2
	jmp LB_48180
LB_48179:
	bts r12,2
LB_48180:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48177
	btr r12,1
	jmp LB_48178
LB_48177:
	bts r12,1
LB_48178:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48175
	btr r12,0
	jmp LB_48176
LB_48175:
	bts r12,0
LB_48176:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_48171
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_48209
	btr r12,5
	jmp LB_48210
LB_48209:
	bts r12,5
LB_48210:
	mov rcx,r8
	bt r12,2
	jc LB_48211
	btr r12,6
	jmp LB_48212
LB_48211:
	bts r12,6
LB_48212:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_48215
	btr r12,7
	jmp LB_48216
LB_48215:
	bts r12,7
LB_48216:
	mov r8,rdx
	bt r12,7
	jc LB_48213
	btr r12,2
	jmp LB_48214
LB_48213:
	bts r12,2
LB_48214:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_48219
	btr r12,7
	jmp LB_48220
LB_48219:
	bts r12,7
LB_48220:
	mov r9,rdx
	bt r12,7
	jc LB_48217
	btr r12,3
	jmp LB_48218
LB_48217:
	bts r12,3
LB_48218:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_48223
	btr r12,7
	jmp LB_48224
LB_48223:
	bts r12,7
LB_48224:
	mov r10,rdx
	bt r12,7
	jc LB_48221
	btr r12,4
	jmp LB_48222
LB_48221:
	bts r12,4
LB_48222:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f41209 { %_45369 %_45370 %_45367 %_45368 %_45371 %_45372 } ⊢ %_45373 : %_45373
 ; {>  %_45369~2':_p41181 %_45371~4':(_opn)◂(_p41171) %_45367~0':_p41172 %_45370~3':_p41184 %_45368~1':_p41173 %_45372~5':_p41171 }
; _f41209 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_45373 ⊢ %_45374 : %_45374
 ; {>  %_45373~°0◂{ 2' 3' 0' 1' 4' 5' }:_p41171 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_45374
 ; {>  %_45374~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p41171) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_48143
	btr r12,6
	jmp LB_48144
LB_48143:
	bts r12,6
LB_48144:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_48149
	btr r12,7
	jmp LB_48150
LB_48149:
	bts r12,7
LB_48150:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_48147
	btr QWORD [rdi],0
	jmp LB_48148
LB_48147:
	bts QWORD [rdi],0
LB_48148:
	mov rdx,rcx
	bt r12,6
	jc LB_48153
	btr r12,7
	jmp LB_48154
LB_48153:
	bts r12,7
LB_48154:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_48151
	btr QWORD [rdi],1
	jmp LB_48152
LB_48151:
	bts QWORD [rdi],1
LB_48152:
	mov rdx,r13
	bt r12,0
	jc LB_48157
	btr r12,7
	jmp LB_48158
LB_48157:
	bts r12,7
LB_48158:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_48155
	btr QWORD [rdi],2
	jmp LB_48156
LB_48155:
	bts QWORD [rdi],2
LB_48156:
	mov rdx,r14
	bt r12,1
	jc LB_48161
	btr r12,7
	jmp LB_48162
LB_48161:
	bts r12,7
LB_48162:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_48159
	btr QWORD [rdi],3
	jmp LB_48160
LB_48159:
	bts QWORD [rdi],3
LB_48160:
	mov rdx,r10
	bt r12,4
	jc LB_48165
	btr r12,7
	jmp LB_48166
LB_48165:
	bts r12,7
LB_48166:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_48163
	btr QWORD [rdi],4
	jmp LB_48164
LB_48163:
	bts QWORD [rdi],4
LB_48164:
	mov rdx,r11
	bt r12,5
	jc LB_48169
	btr r12,7
	jmp LB_48170
LB_48169:
	bts r12,7
LB_48170:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_48167
	btr QWORD [rdi],5
	jmp LB_48168
LB_48167:
	bts QWORD [rdi],5
LB_48168:
	mov rsi,1
	bt r12,3
	jc LB_48145
	mov rsi,0
	bt r9,0
	jc LB_48145
	jmp LB_48146
LB_48145:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48146:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48171:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48173
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48172
LB_48173:
	add rsp,8
	ret
LB_48174:
	add rsp,64
	pop r14
LB_48172:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45081:
NS_E_RDI_45081:
NS_E_45081_ETR_TBL:
NS_E_45081_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_48279
LB_48278:
	add r14,1
LB_48279:
	cmp r14,r10
	jge LB_48280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48278
	cmp al,10
	jz LB_48278
	cmp al,32
	jz LB_48278
LB_48280:
	add r14,1
	cmp r14,r10
	jg LB_48283
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_48283
	jmp LB_48284
LB_48283:
	jmp LB_48242
LB_48284:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_48286
LB_48285:
	add r14,1
LB_48286:
	cmp r14,r10
	jge LB_48287
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48285
	cmp al,10
	jz LB_48285
	cmp al,32
	jz LB_48285
LB_48287:
	add r14,3
	cmp r14,r10
	jg LB_48291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_48291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_48291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_48291
	jmp LB_48292
LB_48291:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48289
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48289:
	jmp LB_48242
LB_48292:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_48255
LB_48254:
	add r14,1
LB_48255:
	cmp r14,r10
	jge LB_48256
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48254
	cmp al,10
	jz LB_48254
	cmp al,32
	jz LB_48254
LB_48256:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48257
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48258
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48258:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48259:
	jmp LB_48243
LB_48257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_48262
LB_48261:
	add r14,1
LB_48262:
	cmp r14,r10
	jge LB_48263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48261
	cmp al,10
	jz LB_48261
	cmp al,32
	jz LB_48261
LB_48263:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48264
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48265
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48265:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48266
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48266:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48267
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48267:
	jmp LB_48243
LB_48264:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_48270
LB_48269:
	add r14,1
LB_48270:
	cmp r14,r10
	jge LB_48271
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48269
	cmp al,10
	jz LB_48269
	cmp al,32
	jz LB_48269
LB_48271:
	push r10
	call NS_E_45080_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48272
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_48273
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_48273:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48274
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48274:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48275
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48275:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48276
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48276:
	jmp LB_48243
LB_48272:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_48252
	btr r12,4
	jmp LB_48253
LB_48252:
	bts r12,4
LB_48253:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48250
	btr r12,3
	jmp LB_48251
LB_48250:
	bts r12,3
LB_48251:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48248
	btr r12,2
	jmp LB_48249
LB_48248:
	bts r12,2
LB_48249:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48246
	btr r12,1
	jmp LB_48247
LB_48246:
	bts r12,1
LB_48247:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48244
	btr r12,0
	jmp LB_48245
LB_48244:
	bts r12,0
LB_48245:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_48239
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_48293
	btr r12,5
	jmp LB_48294
LB_48293:
	bts r12,5
LB_48294:
	mov r8,r10
	bt r12,4
	jc LB_48295
	btr r12,2
	jmp LB_48296
LB_48295:
	bts r12,2
LB_48296:
	mov r10,r14
	bt r12,1
	jc LB_48297
	btr r12,4
	jmp LB_48298
LB_48297:
	bts r12,4
LB_48298:
	mov r14,r9
	bt r12,3
	jc LB_48299
	btr r12,1
	jmp LB_48300
LB_48299:
	bts r12,1
LB_48300:
	mov r9,r13
	bt r12,0
	jc LB_48301
	btr r12,3
	jmp LB_48302
LB_48301:
	bts r12,3
LB_48302:
	mov r13,r11
	bt r12,5
	jc LB_48303
	btr r12,0
	jmp LB_48304
LB_48303:
	bts r12,0
LB_48304:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45377 ⊢ %_45378 : %_45378
 ; {>  %_45377~2':_p41171 %_45376~1':_p41184 %_45375~0':_p41181 }
; _some 2' ⊢ °0◂2'
; _some { %_45375 %_45376 %_45378 } ⊢ %_45379 : %_45379
 ; {>  %_45378~°0◂2':(_opn)◂(_p41171) %_45376~1':_p41184 %_45375~0':_p41181 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_45379
 ; {>  %_45379~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p41181 _p41184 (_opn)◂(_p41171) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_48227
	btr r12,4
	jmp LB_48228
LB_48227:
	bts r12,4
LB_48228:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_48225
	btr QWORD [rdi],0
	jmp LB_48226
LB_48225:
	bts QWORD [rdi],0
LB_48226:
	mov r10,r14
	bt r12,1
	jc LB_48231
	btr r12,4
	jmp LB_48232
LB_48231:
	bts r12,4
LB_48232:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_48229
	btr QWORD [rdi],1
	jmp LB_48230
LB_48229:
	bts QWORD [rdi],1
LB_48230:
	mov r10,r8
	bt r12,2
	jc LB_48237
	btr r12,4
	jmp LB_48238
LB_48237:
	bts r12,4
LB_48238:
	mov rsi,1
	bt r12,4
	jc LB_48235
	mov rsi,0
	bt r10,0
	jc LB_48235
	jmp LB_48236
LB_48235:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_48236:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_48233
	btr QWORD [rdi],2
	jmp LB_48234
LB_48233:
	bts QWORD [rdi],2
LB_48234:
	mov r8,0
	bts r12,2
	ret
LB_48239:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48241
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48240
LB_48241:
	add rsp,8
	ret
LB_48243:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_48242:
	add rsp,80
	pop r14
LB_48240:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_48342
LB_48341:
	add r14,1
LB_48342:
	cmp r14,r10
	jge LB_48343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48341
	cmp al,10
	jz LB_48341
	cmp al,32
	jz LB_48341
LB_48343:
	add r14,3
	cmp r14,r10
	jg LB_48346
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_48346
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_48346
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_48346
	jmp LB_48347
LB_48346:
	jmp LB_48320
LB_48347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_48329
LB_48328:
	add r14,1
LB_48329:
	cmp r14,r10
	jge LB_48330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48328
	cmp al,10
	jz LB_48328
	cmp al,32
	jz LB_48328
LB_48330:
	push r10
	call NS_E_44465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48331
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48332
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48332:
	jmp LB_48321
LB_48331:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_48335
LB_48334:
	add r14,1
LB_48335:
	cmp r14,r10
	jge LB_48336
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48334
	cmp al,10
	jz LB_48334
	cmp al,32
	jz LB_48334
LB_48336:
	push r10
	call NS_E_45064_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48337
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48338
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48338:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48339
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48339:
	jmp LB_48321
LB_48337:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48326
	btr r12,2
	jmp LB_48327
LB_48326:
	bts r12,2
LB_48327:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48324
	btr r12,1
	jmp LB_48325
LB_48324:
	bts r12,1
LB_48325:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48322
	btr r12,0
	jmp LB_48323
LB_48322:
	bts r12,0
LB_48323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_48317
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_48348
	btr r12,3
	jmp LB_48349
LB_48348:
	bts r12,3
LB_48349:
	mov r14,r8
	bt r12,2
	jc LB_48350
	btr r12,1
	jmp LB_48351
LB_48350:
	bts r12,1
LB_48351:
	mov r8,r13
	bt r12,0
	jc LB_48352
	btr r12,2
	jmp LB_48353
LB_48352:
	bts r12,2
LB_48353:
	mov r13,r9
	bt r12,3
	jc LB_48354
	btr r12,0
	jmp LB_48355
LB_48354:
	bts r12,0
LB_48355:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_45382 : %_45382
 ; {>  %_45380~0':_p41181 %_45381~1':_p41184 }
; _none {  } ⊢ °1◂{  }
; _some { %_45380 %_45381 %_45382 } ⊢ %_45383 : %_45383
 ; {>  %_45380~0':_p41181 %_45381~1':_p41184 %_45382~°1◂{  }:(_opn)◂(t17900'(0)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_45383
 ; {>  %_45383~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p41181 _p41184 (_opn)◂(t17903'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_48307
	btr r12,2
	jmp LB_48308
LB_48307:
	bts r12,2
LB_48308:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_48305
	btr QWORD [rdi],0
	jmp LB_48306
LB_48305:
	bts QWORD [rdi],0
LB_48306:
	mov r8,r14
	bt r12,1
	jc LB_48311
	btr r12,2
	jmp LB_48312
LB_48311:
	bts r12,2
LB_48312:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_48309
	btr QWORD [rdi],1
	jmp LB_48310
LB_48309:
	bts QWORD [rdi],1
LB_48310:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_48315
	mov rsi,0
	bt r8,0
	jc LB_48315
	jmp LB_48316
LB_48315:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_48316:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_48313
	btr QWORD [rdi],2
	jmp LB_48314
LB_48313:
	bts QWORD [rdi],2
LB_48314:
	mov r8,0
	bts r12,2
	ret
LB_48317:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48319
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48318
LB_48319:
	add rsp,8
	ret
LB_48321:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_48320:
	add rsp,48
	pop r14
LB_48318:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45082:
NS_E_RDI_45082:
NS_E_45082_ETR_TBL:
NS_E_45082_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_48376
LB_48375:
	add r14,1
LB_48376:
	cmp r14,r10
	jge LB_48377
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48375
	cmp al,10
	jz LB_48375
	cmp al,32
	jz LB_48375
LB_48377:
	add r14,2
	cmp r14,r10
	jg LB_48380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_48380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_48380
	jmp LB_48381
LB_48380:
	jmp LB_48363
LB_48381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_48370
LB_48369:
	add r14,1
LB_48370:
	cmp r14,r10
	jge LB_48371
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48369
	cmp al,10
	jz LB_48369
	cmp al,32
	jz LB_48369
LB_48371:
	push r10
	call NS_E_45083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48372
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48373
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48373:
	jmp LB_48364
LB_48372:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48367
	btr r12,1
	jmp LB_48368
LB_48367:
	bts r12,1
LB_48368:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48365
	btr r12,0
	jmp LB_48366
LB_48365:
	bts r12,0
LB_48366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48360
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_48382
	btr r12,2
	jmp LB_48383
LB_48382:
	bts r12,2
LB_48383:
	mov r13,r14
	bt r12,1
	jc LB_48384
	btr r12,0
	jmp LB_48385
LB_48384:
	bts r12,0
LB_48385:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41214 %_45384 ⊢ %_45385 : %_45385
 ; {>  %_45384~0':_p41174 }
; _f41214 0' ⊢ °0◂0'
; _some %_45385 ⊢ %_45386 : %_45386
 ; {>  %_45385~°0◂0':_p41173 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45386
 ; {>  %_45386~°0◂°0◂0':(_opn)◂(_p41173) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48358
	btr r12,3
	jmp LB_48359
LB_48358:
	bts r12,3
LB_48359:
	mov rsi,1
	bt r12,3
	jc LB_48356
	mov rsi,0
	bt r9,0
	jc LB_48356
	jmp LB_48357
LB_48356:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48357:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48360:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48362
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48361
LB_48362:
	add rsp,8
	ret
LB_48364:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_48363:
	add rsp,32
	pop r14
LB_48361:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_48405
LB_48404:
	add r14,1
LB_48405:
	cmp r14,r10
	jge LB_48406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48404
	cmp al,10
	jz LB_48404
	cmp al,32
	jz LB_48404
LB_48406:
	push r10
	call NS_E_45084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48407
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48399
LB_48407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_48410
LB_48409:
	add r14,1
LB_48410:
	cmp r14,r10
	jge LB_48411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48409
	cmp al,10
	jz LB_48409
	cmp al,32
	jz LB_48409
LB_48411:
	push r10
	call NS_E_45082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48412
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48413:
	jmp LB_48399
LB_48412:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48402
	btr r12,1
	jmp LB_48403
LB_48402:
	bts r12,1
LB_48403:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48400
	btr r12,0
	jmp LB_48401
LB_48400:
	bts r12,0
LB_48401:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48396
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f41215 { %_45387 %_45388 } ⊢ %_45389 : %_45389
 ; {>  %_45388~1':_p41173 %_45387~0':_p41175 }
; _f41215 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_45389 ⊢ %_45390 : %_45390
 ; {>  %_45389~°1◂{ 0' 1' }:_p41173 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_45390
 ; {>  %_45390~°0◂°1◂{ 0' 1' }:(_opn)◂(_p41173) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_48390
	btr r12,2
	jmp LB_48391
LB_48390:
	bts r12,2
LB_48391:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_48388
	btr QWORD [rdi],0
	jmp LB_48389
LB_48388:
	bts QWORD [rdi],0
LB_48389:
	mov r8,r14
	bt r12,1
	jc LB_48394
	btr r12,2
	jmp LB_48395
LB_48394:
	bts r12,2
LB_48395:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_48392
	btr QWORD [rdi],1
	jmp LB_48393
LB_48392:
	bts QWORD [rdi],1
LB_48393:
	mov rsi,1
	bt r12,3
	jc LB_48386
	mov rsi,0
	bt r9,0
	jc LB_48386
	jmp LB_48387
LB_48386:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48387:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48396:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48398
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48397
LB_48398:
	add rsp,8
	ret
LB_48399:
	add rsp,32
	pop r14
LB_48397:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_48417
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f41216 {  } ⊢ %_45391 : %_45391
 ; {>  }
; _f41216 {  } ⊢ °2◂{  }
; _some %_45391 ⊢ %_45392 : %_45392
 ; {>  %_45391~°2◂{  }:_p41173 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_45392
 ; {>  %_45392~°0◂°2◂{  }:(_opn)◂(_p41173) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48415
	mov rsi,0
	bt r9,0
	jc LB_48415
	jmp LB_48416
LB_48415:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48416:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48417:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48419
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48418
LB_48419:
	add rsp,8
	ret
LB_48420:
	add rsp,0
	pop r14
LB_48418:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45083:
NS_E_RDI_45083:
NS_E_45083_ETR_TBL:
NS_E_45083_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_48440
LB_48439:
	add r14,1
LB_48440:
	cmp r14,r10
	jge LB_48441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48439
	cmp al,10
	jz LB_48439
	cmp al,32
	jz LB_48439
LB_48441:
	push r10
	call NS_E_45084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48442
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48434
LB_48442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_48445
LB_48444:
	add r14,1
LB_48445:
	cmp r14,r10
	jge LB_48446
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48444
	cmp al,10
	jz LB_48444
	cmp al,32
	jz LB_48444
LB_48446:
	push r10
	call NS_E_45083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48447
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48448
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48448:
	jmp LB_48434
LB_48447:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48437
	btr r12,1
	jmp LB_48438
LB_48437:
	bts r12,1
LB_48438:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48435
	btr r12,0
	jmp LB_48436
LB_48435:
	bts r12,0
LB_48436:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48431
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f41217 { %_45393 %_45394 } ⊢ %_45395 : %_45395
 ; {>  %_45393~0':_p41175 %_45394~1':_p41174 }
; _f41217 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_45395 ⊢ %_45396 : %_45396
 ; {>  %_45395~°0◂{ 0' 1' }:_p41174 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_45396
 ; {>  %_45396~°0◂°0◂{ 0' 1' }:(_opn)◂(_p41174) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_48425
	btr r12,2
	jmp LB_48426
LB_48425:
	bts r12,2
LB_48426:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_48423
	btr QWORD [rdi],0
	jmp LB_48424
LB_48423:
	bts QWORD [rdi],0
LB_48424:
	mov r8,r14
	bt r12,1
	jc LB_48429
	btr r12,2
	jmp LB_48430
LB_48429:
	bts r12,2
LB_48430:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_48427
	btr QWORD [rdi],1
	jmp LB_48428
LB_48427:
	bts QWORD [rdi],1
LB_48428:
	mov rsi,1
	bt r12,3
	jc LB_48421
	mov rsi,0
	bt r9,0
	jc LB_48421
	jmp LB_48422
LB_48421:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48422:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48431:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48433
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48432
LB_48433:
	add rsp,8
	ret
LB_48434:
	add rsp,32
	pop r14
LB_48432:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_48452
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f41218 {  } ⊢ %_45397 : %_45397
 ; {>  }
; _f41218 {  } ⊢ °1◂{  }
; _some %_45397 ⊢ %_45398 : %_45398
 ; {>  %_45397~°1◂{  }:_p41174 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45398
 ; {>  %_45398~°0◂°1◂{  }:(_opn)◂(_p41174) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48450
	mov rsi,0
	bt r9,0
	jc LB_48450
	jmp LB_48451
LB_48450:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48451:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48452:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48454
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48453
LB_48454:
	add rsp,8
	ret
LB_48455:
	add rsp,0
	pop r14
LB_48453:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45084:
NS_E_RDI_45084:
NS_E_45084_ETR_TBL:
NS_E_45084_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_48471
LB_48470:
	add r14,1
LB_48471:
	cmp r14,r10
	jge LB_48472
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48470
	cmp al,10
	jz LB_48470
	cmp al,32
	jz LB_48470
LB_48472:
	add r14,3
	cmp r14,r10
	jg LB_48475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_48475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_48475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_48475
	jmp LB_48476
LB_48475:
	jmp LB_48463
LB_48476:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_48478
LB_48477:
	add r14,1
LB_48478:
	cmp r14,r10
	jge LB_48479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48477
	cmp al,10
	jz LB_48477
	cmp al,32
	jz LB_48477
LB_48479:
	push r10
	call NS_E_45085_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48480
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48481:
	jmp LB_48463
LB_48480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_48484
LB_48483:
	add r14,1
LB_48484:
	cmp r14,r10
	jge LB_48485
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48483
	cmp al,10
	jz LB_48483
	cmp al,32
	jz LB_48483
LB_48485:
	add r14,3
	cmp r14,r10
	jg LB_48490
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_48490
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_48490
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_48490
	jmp LB_48491
LB_48490:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48487
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48487:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48488
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48488:
	jmp LB_48463
LB_48491:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48468
	btr r12,2
	jmp LB_48469
LB_48468:
	bts r12,2
LB_48469:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48466
	btr r12,1
	jmp LB_48467
LB_48466:
	bts r12,1
LB_48467:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48464
	btr r12,0
	jmp LB_48465
LB_48464:
	bts r12,0
LB_48465:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_48460
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_48492
	btr r12,3
	jmp LB_48493
LB_48492:
	bts r12,3
LB_48493:
	mov r13,r14
	bt r12,1
	jc LB_48494
	btr r12,0
	jmp LB_48495
LB_48494:
	bts r12,0
LB_48495:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f41219 %_45399 ⊢ %_45400 : %_45400
 ; {>  %_45399~0':_p41176 }
; _f41219 0' ⊢ °0◂0'
; _some %_45400 ⊢ %_45401 : %_45401
 ; {>  %_45400~°0◂0':_p41175 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45401
 ; {>  %_45401~°0◂°0◂0':(_opn)◂(_p41175) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48458
	btr r12,3
	jmp LB_48459
LB_48458:
	bts r12,3
LB_48459:
	mov rsi,1
	bt r12,3
	jc LB_48456
	mov rsi,0
	bt r9,0
	jc LB_48456
	jmp LB_48457
LB_48456:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48457:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48460:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48462
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48461
LB_48462:
	add rsp,8
	ret
LB_48463:
	add rsp,48
	pop r14
LB_48461:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_48507
LB_48506:
	add r14,1
LB_48507:
	cmp r14,r10
	jge LB_48508
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48506
	cmp al,10
	jz LB_48506
	cmp al,32
	jz LB_48506
LB_48508:
	push r10
	call NS_E_45085_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48509
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48503
LB_48509:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48504
	btr r12,0
	jmp LB_48505
LB_48504:
	bts r12,0
LB_48505:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48500
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41220 %_45402 ⊢ %_45403 : %_45403
 ; {>  %_45402~0':_p41176 }
; _f41220 0' ⊢ °1◂0'
; _some %_45403 ⊢ %_45404 : %_45404
 ; {>  %_45403~°1◂0':_p41175 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45404
 ; {>  %_45404~°0◂°1◂0':(_opn)◂(_p41175) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48498
	btr r12,3
	jmp LB_48499
LB_48498:
	bts r12,3
LB_48499:
	mov rsi,1
	bt r12,3
	jc LB_48496
	mov rsi,0
	bt r9,0
	jc LB_48496
	jmp LB_48497
LB_48496:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48497:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48500:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48502
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48501
LB_48502:
	add rsp,8
	ret
LB_48503:
	add rsp,16
	pop r14
LB_48501:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45085:
NS_E_RDI_45085:
NS_E_45085_ETR_TBL:
NS_E_45085_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_48522
LB_48521:
	add r14,1
LB_48522:
	cmp r14,r10
	jge LB_48523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48521
	cmp al,10
	jz LB_48521
	cmp al,32
	jz LB_48521
LB_48523:
	push r10
	call NS_E_40574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48524
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48518
LB_48524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48519
	btr r12,0
	jmp LB_48520
LB_48519:
	bts r12,0
LB_48520:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48515
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41222 %_45405 ⊢ %_45406 : %_45406
 ; {>  %_45405~0':_stg }
; _f41222 0' ⊢ °1◂0'
; _some %_45406 ⊢ %_45407 : %_45407
 ; {>  %_45406~°1◂0':_p41176 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_45407
 ; {>  %_45407~°0◂°1◂0':(_opn)◂(_p41176) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48513
	btr r12,3
	jmp LB_48514
LB_48513:
	bts r12,3
LB_48514:
	mov rsi,1
	bt r12,3
	jc LB_48511
	mov rsi,0
	bt r9,0
	jc LB_48511
	jmp LB_48512
LB_48511:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48512:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48515:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48517
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48516
LB_48517:
	add rsp,8
	ret
LB_48518:
	add rsp,16
	pop r14
LB_48516:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_48537
LB_48536:
	add r14,1
LB_48537:
	cmp r14,r10
	jge LB_48538
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48536
	cmp al,10
	jz LB_48536
	cmp al,32
	jz LB_48536
LB_48538:
	push r10
	call NS_E_44005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48539
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48533
LB_48539:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48534
	btr r12,0
	jmp LB_48535
LB_48534:
	bts r12,0
LB_48535:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48530
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f41221 %_45408 ⊢ %_45409 : %_45409
 ; {>  %_45408~0':_p41117 }
; _f41221 0' ⊢ °0◂0'
; _some %_45409 ⊢ %_45410 : %_45410
 ; {>  %_45409~°0◂0':_p41176 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45410
 ; {>  %_45410~°0◂°0◂0':(_opn)◂(_p41176) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48528
	btr r12,3
	jmp LB_48529
LB_48528:
	bts r12,3
LB_48529:
	mov rsi,1
	bt r12,3
	jc LB_48526
	mov rsi,0
	bt r9,0
	jc LB_48526
	jmp LB_48527
LB_48526:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48527:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48530:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48532
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48531
LB_48532:
	add rsp,8
	ret
LB_48533:
	add rsp,16
	pop r14
LB_48531:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45086:
NS_E_RDI_45086:
NS_E_45086_ETR_TBL:
NS_E_45086_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_48550
LB_48549:
	add r14,1
LB_48550:
	cmp r14,r10
	jge LB_48551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48549
	cmp al,10
	jz LB_48549
	cmp al,32
	jz LB_48549
LB_48551:
	add r14,4
	cmp r14,r10
	jg LB_48554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_48554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_48554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_48554
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_48554
	jmp LB_48555
LB_48554:
	jmp LB_48546
LB_48555:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48547
	btr r12,0
	jmp LB_48548
LB_48547:
	bts r12,0
LB_48548:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48543
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41212 {  } ⊢ %_45411 : %_45411
 ; {>  }
; _f41212 {  } ⊢ °1◂{  }
; _some %_45411 ⊢ %_45412 : %_45412
 ; {>  %_45411~°1◂{  }:_p41172 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45412
 ; {>  %_45412~°0◂°1◂{  }:(_opn)◂(_p41172) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48541
	mov rsi,0
	bt r9,0
	jc LB_48541
	jmp LB_48542
LB_48541:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48542:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48543:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48545
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48544
LB_48545:
	add rsp,8
	ret
LB_48546:
	add rsp,16
	pop r14
LB_48544:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_48565
LB_48564:
	add r14,1
LB_48565:
	cmp r14,r10
	jge LB_48566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48564
	cmp al,10
	jz LB_48564
	cmp al,32
	jz LB_48564
LB_48566:
	add r14,4
	cmp r14,r10
	jg LB_48569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_48569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_48569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_48569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_48569
	jmp LB_48570
LB_48569:
	jmp LB_48561
LB_48570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48562
	btr r12,0
	jmp LB_48563
LB_48562:
	bts r12,0
LB_48563:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48558
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41213 {  } ⊢ %_45413 : %_45413
 ; {>  }
; _f41213 {  } ⊢ °2◂{  }
; _some %_45413 ⊢ %_45414 : %_45414
 ; {>  %_45413~°2◂{  }:_p41172 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_45414
 ; {>  %_45414~°0◂°2◂{  }:(_opn)◂(_p41172) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48556
	mov rsi,0
	bt r9,0
	jc LB_48556
	jmp LB_48557
LB_48556:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48557:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48558:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48560
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48559
LB_48560:
	add rsp,8
	ret
LB_48561:
	add rsp,16
	pop r14
LB_48559:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_48580
LB_48579:
	add r14,1
LB_48580:
	cmp r14,r10
	jge LB_48581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48579
	cmp al,10
	jz LB_48579
	cmp al,32
	jz LB_48579
LB_48581:
	add r14,3
	cmp r14,r10
	jg LB_48584
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_48584
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_48584
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_48584
	jmp LB_48585
LB_48584:
	jmp LB_48576
LB_48585:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48577
	btr r12,0
	jmp LB_48578
LB_48577:
	bts r12,0
LB_48578:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48573
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41211 {  } ⊢ %_45415 : %_45415
 ; {>  }
; _f41211 {  } ⊢ °0◂{  }
; _some %_45415 ⊢ %_45416 : %_45416
 ; {>  %_45415~°0◂{  }:_p41172 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_45416
 ; {>  %_45416~°0◂°0◂{  }:(_opn)◂(_p41172) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48571
	mov rsi,0
	bt r9,0
	jc LB_48571
	jmp LB_48572
LB_48571:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48572:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48575
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48574
LB_48575:
	add rsp,8
	ret
LB_48576:
	add rsp,16
	pop r14
LB_48574:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45087:
NS_E_RDI_45087:
NS_E_45087_ETR_TBL:
NS_E_45087_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_48595
LB_48594:
	add r14,1
LB_48595:
	cmp r14,r10
	jge LB_48596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48594
	cmp al,10
	jz LB_48594
	cmp al,32
	jz LB_48594
LB_48596:
	add r14,5
	cmp r14,r10
	jg LB_48599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_48599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_48599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_48599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_48599
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_48599
	jmp LB_48600
LB_48599:
	jmp LB_48591
LB_48600:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48592
	btr r12,0
	jmp LB_48593
LB_48592:
	bts r12,0
LB_48593:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48588
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41212 {  } ⊢ %_45417 : %_45417
 ; {>  }
; _f41212 {  } ⊢ °1◂{  }
; _some %_45417 ⊢ %_45418 : %_45418
 ; {>  %_45417~°1◂{  }:_p41172 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45418
 ; {>  %_45418~°0◂°1◂{  }:(_opn)◂(_p41172) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48586
	mov rsi,0
	bt r9,0
	jc LB_48586
	jmp LB_48587
LB_48586:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48587:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48588:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48590
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48589
LB_48590:
	add rsp,8
	ret
LB_48591:
	add rsp,16
	pop r14
LB_48589:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_48610
LB_48609:
	add r14,1
LB_48610:
	cmp r14,r10
	jge LB_48611
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48609
	cmp al,10
	jz LB_48609
	cmp al,32
	jz LB_48609
LB_48611:
	add r14,5
	cmp r14,r10
	jg LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_48614
	jmp LB_48615
LB_48614:
	jmp LB_48606
LB_48615:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48607
	btr r12,0
	jmp LB_48608
LB_48607:
	bts r12,0
LB_48608:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48603
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41213 {  } ⊢ %_45419 : %_45419
 ; {>  }
; _f41213 {  } ⊢ °2◂{  }
; _some %_45419 ⊢ %_45420 : %_45420
 ; {>  %_45419~°2◂{  }:_p41172 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_45420
 ; {>  %_45420~°0◂°2◂{  }:(_opn)◂(_p41172) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48601
	mov rsi,0
	bt r9,0
	jc LB_48601
	jmp LB_48602
LB_48601:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48602:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48603:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48605
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48604
LB_48605:
	add rsp,8
	ret
LB_48606:
	add rsp,16
	pop r14
LB_48604:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_48625
LB_48624:
	add r14,1
LB_48625:
	cmp r14,r10
	jge LB_48626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48624
	cmp al,10
	jz LB_48624
	cmp al,32
	jz LB_48624
LB_48626:
	add r14,4
	cmp r14,r10
	jg LB_48629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_48629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_48629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_48629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_48629
	jmp LB_48630
LB_48629:
	jmp LB_48621
LB_48630:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48622
	btr r12,0
	jmp LB_48623
LB_48622:
	bts r12,0
LB_48623:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48618
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f41211 {  } ⊢ %_45421 : %_45421
 ; {>  }
; _f41211 {  } ⊢ °0◂{  }
; _some %_45421 ⊢ %_45422 : %_45422
 ; {>  %_45421~°0◂{  }:_p41172 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_45422
 ; {>  %_45422~°0◂°0◂{  }:(_opn)◂(_p41172) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48616
	mov rsi,0
	bt r9,0
	jc LB_48616
	jmp LB_48617
LB_48616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48617:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48618:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48620
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48619
LB_48620:
	add rsp,8
	ret
LB_48621:
	add rsp,16
	pop r14
LB_48619:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45088:
NS_E_RDI_45088:
NS_E_45088_ETR_TBL:
NS_E_45088_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_48686
LB_48685:
	add r14,1
LB_48686:
	cmp r14,r10
	jge LB_48687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48685
	cmp al,10
	jz LB_48685
	cmp al,32
	jz LB_48685
LB_48687:
	push r10
	call NS_E_45087_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48688
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48654
LB_48688:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_48665
LB_48664:
	add r14,1
LB_48665:
	cmp r14,r10
	jge LB_48666
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48664
	cmp al,10
	jz LB_48664
	cmp al,32
	jz LB_48664
LB_48666:
	push r10
	call NS_E_45090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48667
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48668
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48668:
	jmp LB_48655
LB_48667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_48671
LB_48670:
	add r14,1
LB_48671:
	cmp r14,r10
	jge LB_48672
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48670
	cmp al,10
	jz LB_48670
	cmp al,32
	jz LB_48670
LB_48672:
	push r10
	call NS_E_45082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48673
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48674
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48674:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48675
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48675:
	jmp LB_48655
LB_48673:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_48678
LB_48677:
	add r14,1
LB_48678:
	cmp r14,r10
	jge LB_48679
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48677
	cmp al,10
	jz LB_48677
	cmp al,32
	jz LB_48677
LB_48679:
	push r10
	call NS_E_45089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48680
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48681
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48681:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48682
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48682:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48683
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48683:
	jmp LB_48655
LB_48680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48662
	btr r12,3
	jmp LB_48663
LB_48662:
	bts r12,3
LB_48663:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48660
	btr r12,2
	jmp LB_48661
LB_48660:
	bts r12,2
LB_48661:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48658
	btr r12,1
	jmp LB_48659
LB_48658:
	bts r12,1
LB_48659:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48656
	btr r12,0
	jmp LB_48657
LB_48656:
	bts r12,0
LB_48657:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_48651
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f41208 { %_45424 %_45423 %_45425 %_45426 } ⊢ %_45427 : %_45427
 ; {>  %_45426~3':(_opn)◂(_p41170) %_45424~1':(_opn)◂(_stg) %_45423~0':_p41172 %_45425~2':_p41173 }
; _f41208 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_45427 ⊢ %_45428 : %_45428
 ; {>  %_45427~°1◂{ 1' 0' 2' 3' }:_p41170 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_45428
 ; {>  %_45428~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p41170) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_48631
	btr r12,4
	jmp LB_48632
LB_48631:
	bts r12,4
LB_48632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_48637
	btr r12,5
	jmp LB_48638
LB_48637:
	bts r12,5
LB_48638:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_48635
	btr QWORD [rdi],0
	jmp LB_48636
LB_48635:
	bts QWORD [rdi],0
LB_48636:
	mov r11,r13
	bt r12,0
	jc LB_48641
	btr r12,5
	jmp LB_48642
LB_48641:
	bts r12,5
LB_48642:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_48639
	btr QWORD [rdi],1
	jmp LB_48640
LB_48639:
	bts QWORD [rdi],1
LB_48640:
	mov r11,r8
	bt r12,2
	jc LB_48645
	btr r12,5
	jmp LB_48646
LB_48645:
	bts r12,5
LB_48646:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_48643
	btr QWORD [rdi],2
	jmp LB_48644
LB_48643:
	bts QWORD [rdi],2
LB_48644:
	mov r11,r10
	bt r12,4
	jc LB_48649
	btr r12,5
	jmp LB_48650
LB_48649:
	bts r12,5
LB_48650:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_48647
	btr QWORD [rdi],3
	jmp LB_48648
LB_48647:
	bts QWORD [rdi],3
LB_48648:
	mov rsi,1
	bt r12,3
	jc LB_48633
	mov rsi,0
	bt r9,0
	jc LB_48633
	jmp LB_48634
LB_48633:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48634:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48651:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48653
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48652
LB_48653:
	add rsp,8
	ret
LB_48655:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_48654:
	add rsp,64
	pop r14
LB_48652:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_48729
LB_48728:
	add r14,1
LB_48729:
	cmp r14,r10
	jge LB_48730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48728
	cmp al,10
	jz LB_48728
	cmp al,32
	jz LB_48728
LB_48730:
	push r10
	call NS_E_45086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48731
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48717
LB_48731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_48734
LB_48733:
	add r14,1
LB_48734:
	cmp r14,r10
	jge LB_48735
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48733
	cmp al,10
	jz LB_48733
	cmp al,32
	jz LB_48733
LB_48735:
	push r10
	call NS_E_45090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48736
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48737
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48737:
	jmp LB_48717
LB_48736:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_48740
LB_48739:
	add r14,1
LB_48740:
	cmp r14,r10
	jge LB_48741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48739
	cmp al,10
	jz LB_48739
	cmp al,32
	jz LB_48739
LB_48741:
	push r10
	call NS_E_45082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48742
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48743
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48743:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48744:
	jmp LB_48717
LB_48742:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_48747
LB_48746:
	add r14,1
LB_48747:
	cmp r14,r10
	jge LB_48748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48746
	cmp al,10
	jz LB_48746
	cmp al,32
	jz LB_48746
LB_48748:
	push r10
	call NS_E_45089_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48749
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48750
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48750:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48751
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48751:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48752
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48752:
	jmp LB_48717
LB_48749:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_48755
LB_48754:
	add r14,1
LB_48755:
	cmp r14,r10
	jge LB_48756
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48754
	cmp al,10
	jz LB_48754
	cmp al,32
	jz LB_48754
LB_48756:
	push r10
	call NS_E_45088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48757
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_48758
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_48758:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48759
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48759:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48760
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48760:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48761
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48761:
	jmp LB_48717
LB_48757:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_48726
	btr r12,4
	jmp LB_48727
LB_48726:
	bts r12,4
LB_48727:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48724
	btr r12,3
	jmp LB_48725
LB_48724:
	bts r12,3
LB_48725:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48722
	btr r12,2
	jmp LB_48723
LB_48722:
	bts r12,2
LB_48723:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48720
	btr r12,1
	jmp LB_48721
LB_48720:
	bts r12,1
LB_48721:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48718
	btr r12,0
	jmp LB_48719
LB_48718:
	bts r12,0
LB_48719:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_48714
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f41207 { %_45430 %_45429 %_45431 %_45432 %_45433 } ⊢ %_45434 : %_45434
 ; {>  %_45430~1':(_opn)◂(_stg) %_45433~4':_p41170 %_45432~3':(_opn)◂(_p41170) %_45429~0':_p41172 %_45431~2':_p41173 }
; _f41207 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_45434 ⊢ %_45435 : %_45435
 ; {>  %_45434~°0◂{ 1' 0' 2' 3' 4' }:_p41170 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_45435
 ; {>  %_45435~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p41170) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_48690
	btr r12,5
	jmp LB_48691
LB_48690:
	bts r12,5
LB_48691:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_48696
	btr r12,6
	jmp LB_48697
LB_48696:
	bts r12,6
LB_48697:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_48694
	btr QWORD [rdi],0
	jmp LB_48695
LB_48694:
	bts QWORD [rdi],0
LB_48695:
	mov rcx,r13
	bt r12,0
	jc LB_48700
	btr r12,6
	jmp LB_48701
LB_48700:
	bts r12,6
LB_48701:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_48698
	btr QWORD [rdi],1
	jmp LB_48699
LB_48698:
	bts QWORD [rdi],1
LB_48699:
	mov rcx,r8
	bt r12,2
	jc LB_48704
	btr r12,6
	jmp LB_48705
LB_48704:
	bts r12,6
LB_48705:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_48702
	btr QWORD [rdi],2
	jmp LB_48703
LB_48702:
	bts QWORD [rdi],2
LB_48703:
	mov rcx,r11
	bt r12,5
	jc LB_48708
	btr r12,6
	jmp LB_48709
LB_48708:
	bts r12,6
LB_48709:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_48706
	btr QWORD [rdi],3
	jmp LB_48707
LB_48706:
	bts QWORD [rdi],3
LB_48707:
	mov rcx,r10
	bt r12,4
	jc LB_48712
	btr r12,6
	jmp LB_48713
LB_48712:
	bts r12,6
LB_48713:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_48710
	btr QWORD [rdi],4
	jmp LB_48711
LB_48710:
	bts QWORD [rdi],4
LB_48711:
	mov rsi,1
	bt r12,3
	jc LB_48692
	mov rsi,0
	bt r9,0
	jc LB_48692
	jmp LB_48693
LB_48692:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48693:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48714:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48716
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48715
LB_48716:
	add rsp,8
	ret
LB_48717:
	add rsp,80
	pop r14
LB_48715:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45089:
NS_E_RDI_45089:
NS_E_45089_ETR_TBL:
NS_E_45089_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_48776
LB_48775:
	add r14,1
LB_48776:
	cmp r14,r10
	jge LB_48777
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48775
	cmp al,10
	jz LB_48775
	cmp al,32
	jz LB_48775
LB_48777:
	add r14,1
	cmp r14,r10
	jg LB_48780
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_48780
	jmp LB_48781
LB_48780:
	jmp LB_48770
LB_48781:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_48783
LB_48782:
	add r14,1
LB_48783:
	cmp r14,r10
	jge LB_48784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48782
	cmp al,10
	jz LB_48782
	cmp al,32
	jz LB_48782
LB_48784:
	push r10
	call NS_E_45088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48785
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48786
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48786:
	jmp LB_48770
LB_48785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48773
	btr r12,1
	jmp LB_48774
LB_48773:
	bts r12,1
LB_48774:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48771
	btr r12,0
	jmp LB_48772
LB_48771:
	bts r12,0
LB_48772:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48767
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_48788
	btr r12,2
	jmp LB_48789
LB_48788:
	bts r12,2
LB_48789:
	mov r13,r14
	bt r12,1
	jc LB_48790
	btr r12,0
	jmp LB_48791
LB_48790:
	bts r12,0
LB_48791:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45436 ⊢ %_45437 : %_45437
 ; {>  %_45436~0':_p41170 }
; _some 0' ⊢ °0◂0'
; _some %_45437 ⊢ %_45438 : %_45438
 ; {>  %_45437~°0◂0':(_opn)◂(_p41170) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45438
 ; {>  %_45438~°0◂°0◂0':(_opn)◂((_opn)◂(_p41170)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48765
	btr r12,3
	jmp LB_48766
LB_48765:
	bts r12,3
LB_48766:
	mov rsi,1
	bt r12,3
	jc LB_48763
	mov rsi,0
	bt r9,0
	jc LB_48763
	jmp LB_48764
LB_48763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48764:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48767:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48769
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48768
LB_48769:
	add rsp,8
	ret
LB_48770:
	add rsp,32
	pop r14
LB_48768:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_48794
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_45439 : %_45439
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_45439 ⊢ %_45440 : %_45440
 ; {>  %_45439~°1◂{  }:(_opn)◂(t17981'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45440
 ; {>  %_45440~°0◂°1◂{  }:(_opn)◂((_opn)◂(t17984'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48792
	mov rsi,0
	bt r9,0
	jc LB_48792
	jmp LB_48793
LB_48792:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48793:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48794:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48796
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48795
LB_48796:
	add rsp,8
	ret
LB_48797:
	add rsp,0
	pop r14
LB_48795:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_45090:
NS_E_RDI_45090:
NS_E_45090_ETR_TBL:
NS_E_45090_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_48811
LB_48810:
	add r14,1
LB_48811:
	cmp r14,r10
	jge LB_48812
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48810
	cmp al,10
	jz LB_48810
	cmp al,32
	jz LB_48810
LB_48812:
	push r10
	call NS_E_40942_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48813
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48805
LB_48813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_48816
LB_48815:
	add r14,1
LB_48816:
	cmp r14,r10
	jge LB_48817
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48815
	cmp al,10
	jz LB_48815
	cmp al,32
	jz LB_48815
LB_48817:
	add r14,1
	cmp r14,r10
	jg LB_48821
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_48821
	jmp LB_48822
LB_48821:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48819
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48819:
	jmp LB_48805
LB_48822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48808
	btr r12,1
	jmp LB_48809
LB_48808:
	bts r12,1
LB_48809:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48806
	btr r12,0
	jmp LB_48807
LB_48806:
	bts r12,0
LB_48807:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48802
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_45441 ⊢ %_45442 : %_45442
 ; {>  %_45441~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_45442 ⊢ %_45443 : %_45443
 ; {>  %_45442~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_45443
 ; {>  %_45443~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48800
	btr r12,3
	jmp LB_48801
LB_48800:
	bts r12,3
LB_48801:
	mov rsi,1
	bt r12,3
	jc LB_48798
	mov rsi,0
	bt r9,0
	jc LB_48798
	jmp LB_48799
LB_48798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48799:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48802:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48804
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48803
LB_48804:
	add rsp,8
	ret
LB_48805:
	add rsp,32
	pop r14
LB_48803:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_48825
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_45444 : %_45444
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_45444 ⊢ %_45445 : %_45445
 ; {>  %_45444~°1◂{  }:(_opn)◂(t17993'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_45445
 ; {>  %_45445~°0◂°1◂{  }:(_opn)◂((_opn)◂(t17996'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_48823
	mov rsi,0
	bt r9,0
	jc LB_48823
	jmp LB_48824
LB_48823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48824:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48825:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48827
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_48826
LB_48827:
	add rsp,8
	ret
LB_48828:
	add rsp,0
	pop r14
LB_48826:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48874:
NS_E_RDI_48874:
; » _^ ..
	xor rax,rax
	add rax,9
	add rax,15
	add rax,13
	add rax,10
	add rax,9
	add rax,7
	add rax,10
	add rax,11
	add rax,10
	add rax,10
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; » 0xr0 |~ {  } ⊢ %_48830 : %_48830
 ; {>  %_48829~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_48830
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_48831 : %_48831
 ; {>  %_48830~1':_r64 %_48829~0':_stg }
; 	» _args _ ⊢ 2' : %_48831
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r8,rax
	btr r12,2
MTC_LB_48875:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48876
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_48877
	bt QWORD [rdi],0
	jc LB_48878
	btr r12,5
	jmp LB_48879
LB_48878:
	bts r12,5
LB_48879:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_48877:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_48882
	btr r12,6
	jmp LB_48883
LB_48882:
	bts r12,6
LB_48883:
	mov r9,rcx
	bt r12,6
	jc LB_48880
	btr r12,3
	jmp LB_48881
LB_48880:
	bts r12,3
LB_48881:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_48886
	btr r12,6
	jmp LB_48887
LB_48886:
	bts r12,6
LB_48887:
	mov r10,rcx
	bt r12,6
	jc LB_48884
	btr r12,4
	jmp LB_48885
LB_48884:
	bts r12,4
LB_48885:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48876
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_48888
	bt QWORD [rdi],0
	jc LB_48889
	btr r12,7
	jmp LB_48890
LB_48889:
	bts r12,7
LB_48890:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_48888:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_48893
	btr r12,8
	jmp LB_48894
LB_48893:
	bts r12,8
LB_48894:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_48891
	btr r12,5
	jmp LB_48892
LB_48891:
	bts r12,5
LB_48892:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_48897
	btr r12,8
	jmp LB_48898
LB_48897:
	bts r12,8
LB_48898:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_48895
	btr r12,6
	jmp LB_48896
LB_48895:
	bts r12,6
LB_48896:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_48876
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_48899
	bt QWORD [rdi],0
	jc LB_48900
	btr r12,7
	jmp LB_48901
LB_48900:
	bts r12,7
LB_48901:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_48899:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_48902:
	cmp r15,0
	jz LB_48903
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48902
LB_48903:
; _f25 %_48834 ⊢ { %_48836 %_48837 } : { %_48836 %_48837 }
 ; {>  %_48834~5':_stg %_48830~1':_r64 %_48829~0':_stg %_48832~3':_stg }
; _f25 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_48910
	btr r12,0
	jmp LB_48911
LB_48910:
	bts r12,0
LB_48911:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_48912
	btr r12,2
	jmp LB_48913
LB_48912:
	bts r12,2
LB_48913:
	mov r10,r14
	bt r12,1
	jc LB_48914
	btr r12,4
	jmp LB_48915
LB_48914:
	bts r12,4
LB_48915:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_48908
	btr r12,3
	jmp LB_48909
LB_48908:
	bts r12,3
LB_48909:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_48906
	btr r12,1
	jmp LB_48907
LB_48906:
	bts r12,1
LB_48907:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48904
	btr r12,0
	jmp LB_48905
LB_48904:
	bts r12,0
LB_48905:
	add rsp,32
; _f43940 %_48837 ⊢ { %_48838 %_48839 } : { %_48838 %_48839 }
 ; {>  %_48837~4':_stg %_48836~2':_stg %_48830~1':_r64 %_48829~0':_stg %_48832~3':_stg }
; _f43940 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_48924
	btr r12,0
	jmp LB_48925
LB_48924:
	bts r12,0
LB_48925:
	call NS_E_43940
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_48926
	btr r12,4
	jmp LB_48927
LB_48926:
	bts r12,4
LB_48927:
	mov r11,r14
	bt r12,1
	jc LB_48928
	btr r12,5
	jmp LB_48929
LB_48928:
	bts r12,5
LB_48929:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_48922
	btr r12,3
	jmp LB_48923
LB_48922:
	bts r12,3
LB_48923:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_48920
	btr r12,2
	jmp LB_48921
LB_48920:
	bts r12,2
LB_48921:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_48918
	btr r12,1
	jmp LB_48919
LB_48918:
	bts r12,1
LB_48919:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48916
	btr r12,0
	jmp LB_48917
LB_48916:
	bts r12,0
LB_48917:
	add rsp,40
MTC_LB_48930:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48931
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_48932
	bt QWORD [rdi],0
	jc LB_48933
	btr r12,7
	jmp LB_48934
LB_48933:
	bts r12,7
LB_48934:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_48932:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_48935
	btr r12,6
	jmp LB_48936
LB_48935:
	bts r12,6
LB_48936:
LB_48937:
	cmp r15,0
	jz LB_48938
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48937
LB_48938:
; » 0xr0 |~ {  } ⊢ %_48841 : %_48841
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48838~4':_stg %_48829~0':_stg %_48840~6':_stg %_48832~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_48841
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f45050 { %_48840 %_48841 } ⊢ { %_48842 %_48843 %_48844 } : { %_48842 %_48843 %_48844 }
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48838~4':_stg %_48829~0':_stg %_48841~5':_r64 %_48840~6':_stg %_48832~3':_stg }
; _f45050 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_48949
	btr r12,0
	jmp LB_48950
LB_48949:
	bts r12,0
LB_48950:
	mov r14,r11
	bt r12,5
	jc LB_48951
	btr r12,1
	jmp LB_48952
LB_48951:
	bts r12,1
LB_48952:
	call NS_E_45050
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_48953
	btr r12,5
	jmp LB_48954
LB_48953:
	bts r12,5
LB_48954:
	mov rcx,r14
	bt r12,1
	jc LB_48955
	btr r12,6
	jmp LB_48956
LB_48955:
	bts r12,6
LB_48956:
	mov rdx,r9
	bt r12,3
	jc LB_48959
	btr r12,7
	jmp LB_48960
LB_48959:
	bts r12,7
LB_48960:
	mov rsi,1
	bt r12,7
	jc LB_48957
	mov rsi,0
	bt rdx,0
	jc LB_48957
	jmp LB_48958
LB_48957:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_48958:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_48947
	btr r12,4
	jmp LB_48948
LB_48947:
	bts r12,4
LB_48948:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_48945
	btr r12,3
	jmp LB_48946
LB_48945:
	bts r12,3
LB_48946:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_48943
	btr r12,2
	jmp LB_48944
LB_48943:
	bts r12,2
LB_48944:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_48941
	btr r12,1
	jmp LB_48942
LB_48941:
	bts r12,1
LB_48942:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48939
	btr r12,0
	jmp LB_48940
LB_48939:
	bts r12,0
LB_48940:
	add rsp,48
MTC_LB_48961:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48962
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rdx
	bt QWORD [rdi],17
	jnc LB_48963
	bt QWORD [rdi],0
	jc LB_48964
	btr r12,9
	jmp LB_48965
LB_48964:
	bts r12,9
LB_48965:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_48963:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_48966
	btr r12,8
	jmp LB_48967
LB_48966:
	bts r12,8
LB_48967:
LB_48968:
	cmp r15,0
	jz LB_48969
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48968
LB_48969:
; » 0xr0 |~ {  } ⊢ %_48846 : %_48846
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48845~8':(_lst)◂(_p41165) %_48838~4':_stg %_48843~6':_r64 %_48842~5':_stg %_48829~0':_stg %_48832~3':_stg }
; 	» 0xr0 _ ⊢ 7' : %_48846
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f41504 { %_48846 %_48845 } ⊢ { %_48847 %_48848 } : { %_48847 %_48848 }
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48845~8':(_lst)◂(_p41165) %_48838~4':_stg %_48843~6':_r64 %_48842~5':_stg %_48829~0':_stg %_48846~7':_r64 %_48832~3':_stg }
; _f41504 { 7' 8' } ⊢ { 7' 8' }
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000110.. |},{ 7' 8' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_48984
	btr r12,0
	jmp LB_48985
LB_48984:
	bts r12,0
LB_48985:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_48986
	btr r12,1
	jmp LB_48987
LB_48986:
	bts r12,1
LB_48987:
	call NS_E_41504
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_48988
	btr r12,7
	jmp LB_48989
LB_48988:
	bts r12,7
LB_48989:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_48990
	btr r12,8
	jmp LB_48991
LB_48990:
	bts r12,8
LB_48991:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_48982
	btr r12,6
	jmp LB_48983
LB_48982:
	bts r12,6
LB_48983:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_48980
	btr r12,5
	jmp LB_48981
LB_48980:
	bts r12,5
LB_48981:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_48978
	btr r12,4
	jmp LB_48979
LB_48978:
	bts r12,4
LB_48979:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_48976
	btr r12,3
	jmp LB_48977
LB_48976:
	bts r12,3
LB_48977:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_48974
	btr r12,2
	jmp LB_48975
LB_48974:
	bts r12,2
LB_48975:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_48972
	btr r12,1
	jmp LB_48973
LB_48972:
	bts r12,1
LB_48973:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48970
	btr r12,0
	jmp LB_48971
LB_48970:
	bts r12,0
LB_48971:
	add rsp,64
; » _^ ..
	xor rax,rax
	add rax,6
	mov rsi,QWORD [st_vct+8*8]
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,4
	mov rdi,rax
	call mlc_s8
	mov QWORD [st_vct+8*9],rax
	btr r12,9
	mov rdi,rax
	add rdi,8
; "START\n"
	mov rsi,0x_53
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_41
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,QWORD [st_vct+8*8]
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "END\n"
	mov rsi,0x_45
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; _f26 %_48850 ⊢ %_48851 : %_48851
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48850~9':_stg %_48849~8':_stg %_48838~4':_stg %_48843~6':_r64 %_48842~5':_stg %_48847~7':_r64 %_48829~0':_stg %_48832~3':_stg }
; _f26 9' ⊢ 9'
; push_iv 
	sub rsp,80
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rsp+8+8*8],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000000010.. |},9' ⊢ 0'
	mov r13,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_49010
	btr r12,0
	jmp LB_49011
LB_49010:
	bts r12,0
LB_49011:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_49012
	btr r12,9
	jmp LB_49013
LB_49012:
	bts r12,9
LB_49013:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_49008
	btr r12,8
	jmp LB_49009
LB_49008:
	bts r12,8
LB_49009:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_49006
	btr r12,7
	jmp LB_49007
LB_49006:
	bts r12,7
LB_49007:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_49004
	btr r12,6
	jmp LB_49005
LB_49004:
	bts r12,6
LB_49005:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_49002
	btr r12,5
	jmp LB_49003
LB_49002:
	bts r12,5
LB_49003:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_49000
	btr r12,4
	jmp LB_49001
LB_49000:
	bts r12,4
LB_49001:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_48998
	btr r12,3
	jmp LB_48999
LB_48998:
	bts r12,3
LB_48999:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_48996
	btr r12,2
	jmp LB_48997
LB_48996:
	bts r12,2
LB_48997:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_48994
	btr r12,1
	jmp LB_48995
LB_48994:
	bts r12,1
LB_48995:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48992
	btr r12,0
	jmp LB_48993
LB_48992:
	bts r12,0
LB_48993:
	add rsp,80
; ∎ {  }
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48849~8':_stg %_48851~9':_stg %_48838~4':_stg %_48843~6':_r64 %_48842~5':_stg %_48847~7':_r64 %_48829~0':_stg %_48832~3':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_49014
	mov rdi,r8
	call dlt
LB_49014:
	bt r12,1
	jc LB_49015
	mov rdi,r14
	call dlt
LB_49015:
	bt r12,8
	jc LB_49016
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_49016:
	bt r12,9
	jc LB_49017
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_49017:
	bt r12,4
	jc LB_49018
	mov rdi,r10
	call dlt
LB_49018:
	bt r12,6
	jc LB_49019
	mov rdi,rcx
	call dlt
LB_49019:
	bt r12,5
	jc LB_49020
	mov rdi,r11
	call dlt
LB_49020:
	bt r12,7
	jc LB_49021
	mov rdi,rdx
	call dlt
LB_49021:
	bt r12,0
	jc LB_49022
	mov rdi,r13
	call dlt
LB_49022:
	bt r12,3
	jc LB_49023
	mov rdi,r9
	call dlt
LB_49023:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_48962:
	mov r15,0
LB_49025:
	cmp r15,0
	jz LB_49026
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49025
LB_49026:
; 	» "H0\n" _ ⊢ 8' : %_48852
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f26 %_48852 ⊢ %_48853 : %_48853
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48838~4':_stg %_48843~6':_r64 %_48842~5':_stg %_48852~8':_stg %_48829~0':_stg %_48844~7':(_opn)◂((_lst)◂(_p41165)) %_48832~3':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_49043
	btr r12,0
	jmp LB_49044
LB_49043:
	bts r12,0
LB_49044:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_49045
	btr r12,8
	jmp LB_49046
LB_49045:
	bts r12,8
LB_49046:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_49041
	btr r12,7
	jmp LB_49042
LB_49041:
	bts r12,7
LB_49042:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_49039
	btr r12,6
	jmp LB_49040
LB_49039:
	bts r12,6
LB_49040:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_49037
	btr r12,5
	jmp LB_49038
LB_49037:
	bts r12,5
LB_49038:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_49035
	btr r12,4
	jmp LB_49036
LB_49035:
	bts r12,4
LB_49036:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49033
	btr r12,3
	jmp LB_49034
LB_49033:
	bts r12,3
LB_49034:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49031
	btr r12,2
	jmp LB_49032
LB_49031:
	bts r12,2
LB_49032:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49029
	btr r12,1
	jmp LB_49030
LB_49029:
	bts r12,1
LB_49030:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49027
	btr r12,0
	jmp LB_49028
LB_49027:
	bts r12,0
LB_49028:
	add rsp,72
; ∎ {  }
 ; {>  %_48836~2':_stg %_48830~1':_r64 %_48853~8':_stg %_48838~4':_stg %_48843~6':_r64 %_48842~5':_stg %_48829~0':_stg %_48844~7':(_opn)◂((_lst)◂(_p41165)) %_48832~3':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_49047
	mov rdi,r8
	call dlt
LB_49047:
	bt r12,1
	jc LB_49048
	mov rdi,r14
	call dlt
LB_49048:
	bt r12,8
	jc LB_49049
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_49049:
	bt r12,4
	jc LB_49050
	mov rdi,r10
	call dlt
LB_49050:
	bt r12,6
	jc LB_49051
	mov rdi,rcx
	call dlt
LB_49051:
	bt r12,5
	jc LB_49052
	mov rdi,r11
	call dlt
LB_49052:
	bt r12,0
	jc LB_49053
	mov rdi,r13
	call dlt
LB_49053:
	bt r12,7
	jc LB_49054
	mov rdi,rdx
	call dlt
LB_49054:
	bt r12,3
	jc LB_49055
	mov rdi,r9
	call dlt
LB_49055:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_49024:
MTC_LB_48931:
	mov r15,0
LB_49057:
	cmp r15,0
	jz LB_49058
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49057
LB_49058:
; 	» "H1\n" _ ⊢ 6' : %_48854
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f26 %_48854 ⊢ %_48855 : %_48855
 ; {>  %_48839~5':(_opn)◂(_stg) %_48836~2':_stg %_48830~1':_r64 %_48838~4':_stg %_48829~0':_stg %_48854~6':_stg %_48832~3':_stg }
; _f26 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_49071
	btr r12,0
	jmp LB_49072
LB_49071:
	bts r12,0
LB_49072:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_49073
	btr r12,6
	jmp LB_49074
LB_49073:
	bts r12,6
LB_49074:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_49069
	btr r12,5
	jmp LB_49070
LB_49069:
	bts r12,5
LB_49070:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_49067
	btr r12,4
	jmp LB_49068
LB_49067:
	bts r12,4
LB_49068:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49065
	btr r12,3
	jmp LB_49066
LB_49065:
	bts r12,3
LB_49066:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49063
	btr r12,2
	jmp LB_49064
LB_49063:
	bts r12,2
LB_49064:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49061
	btr r12,1
	jmp LB_49062
LB_49061:
	bts r12,1
LB_49062:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49059
	btr r12,0
	jmp LB_49060
LB_49059:
	bts r12,0
LB_49060:
	add rsp,56
; ∎ {  }
 ; {>  %_48839~5':(_opn)◂(_stg) %_48836~2':_stg %_48830~1':_r64 %_48838~4':_stg %_48855~6':_stg %_48829~0':_stg %_48832~3':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_49075
	mov rdi,r11
	call dlt
LB_49075:
	bt r12,2
	jc LB_49076
	mov rdi,r8
	call dlt
LB_49076:
	bt r12,1
	jc LB_49077
	mov rdi,r14
	call dlt
LB_49077:
	bt r12,4
	jc LB_49078
	mov rdi,r10
	call dlt
LB_49078:
	bt r12,6
	jc LB_49079
	mov rdi,rcx
	call dlt
LB_49079:
	bt r12,0
	jc LB_49080
	mov rdi,r13
	call dlt
LB_49080:
	bt r12,3
	jc LB_49081
	mov rdi,r9
	call dlt
LB_49081:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_49056:
MTC_LB_48876:
	mov r15,0
LB_49083:
	cmp r15,0
	jz LB_49084
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49083
LB_49084:
; _f45050 { %_48829 %_48830 } ⊢ { %_48856 %_48857 %_48858 } : { %_48856 %_48857 %_48858 }
 ; {>  %_48830~1':_r64 %_48831~2':(_lst)◂(_stg) %_48829~0':_stg }
; _f45050 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_45050
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_49087
	btr r12,4
	jmp LB_49088
LB_49087:
	bts r12,4
LB_49088:
	mov r9,r10
	bt r12,4
	jc LB_49091
	btr r12,3
	jmp LB_49092
LB_49091:
	bts r12,3
LB_49092:
	mov rsi,1
	bt r12,3
	jc LB_49089
	mov rsi,0
	bt r9,0
	jc LB_49089
	jmp LB_49090
LB_49089:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49090:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_49085
	btr r12,2
	jmp LB_49086
LB_49085:
	bts r12,2
LB_49086:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_48859
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_48859 ⊢ { %_48860 %_48861 } : { %_48860 %_48861 }
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48859~4':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48831~2':(_lst)◂(_stg) }
; _f25 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_49101
	btr r12,0
	jmp LB_49102
LB_49101:
	bts r12,0
LB_49102:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_49103
	btr r12,4
	jmp LB_49104
LB_49103:
	bts r12,4
LB_49104:
	mov r11,r14
	bt r12,1
	jc LB_49105
	btr r12,5
	jmp LB_49106
LB_49105:
	bts r12,5
LB_49106:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49099
	btr r12,3
	jmp LB_49100
LB_49099:
	bts r12,3
LB_49100:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49097
	btr r12,2
	jmp LB_49098
LB_49097:
	bts r12,2
LB_49098:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49095
	btr r12,1
	jmp LB_49096
LB_49095:
	bts r12,1
LB_49096:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49093
	btr r12,0
	jmp LB_49094
LB_49093:
	bts r12,0
LB_49094:
	add rsp,40
; _f26 { %_48860 %_48861 } ⊢ { %_48862 %_48863 } : { %_48862 %_48863 }
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48861~5':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48831~2':(_lst)◂(_stg) %_48860~4':_stg }
; _f26 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_49117
	btr r12,1
	jmp LB_49118
LB_49117:
	bts r12,1
LB_49118:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_49115
	btr QWORD [rdi],0
	jmp LB_49116
LB_49115:
	bts QWORD [rdi],0
LB_49116:
	mov r14,r11
	bt r12,5
	jc LB_49121
	btr r12,1
	jmp LB_49122
LB_49121:
	bts r12,1
LB_49122:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_49119
	btr QWORD [rdi],1
	jmp LB_49120
LB_49119:
	bts QWORD [rdi],1
LB_49120:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_49125
	btr r12,1
	jmp LB_49126
LB_49125:
	bts r12,1
LB_49126:
	mov r10,r14
	bt r12,1
	jc LB_49123
	btr r12,4
	jmp LB_49124
LB_49123:
	bts r12,4
LB_49124:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_49129
	btr r12,1
	jmp LB_49130
LB_49129:
	bts r12,1
LB_49130:
	mov r11,r14
	bt r12,1
	jc LB_49127
	btr r12,5
	jmp LB_49128
LB_49127:
	bts r12,5
LB_49128:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49113
	btr r12,3
	jmp LB_49114
LB_49113:
	bts r12,3
LB_49114:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49111
	btr r12,2
	jmp LB_49112
LB_49111:
	bts r12,2
LB_49112:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49109
	btr r12,1
	jmp LB_49110
LB_49109:
	bts r12,1
LB_49110:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49107
	btr r12,0
	jmp LB_49108
LB_49107:
	bts r12,0
LB_49108:
	add rsp,40
; _f43940 %_48863 ⊢ { %_48864 %_48865 } : { %_48864 %_48865 }
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48863~5':_stg %_48862~4':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48831~2':(_lst)◂(_stg) }
; _f43940 5' ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_49141
	btr r12,0
	jmp LB_49142
LB_49141:
	bts r12,0
LB_49142:
	call NS_E_43940
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_49143
	btr r12,5
	jmp LB_49144
LB_49143:
	bts r12,5
LB_49144:
	mov rcx,r14
	bt r12,1
	jc LB_49145
	btr r12,6
	jmp LB_49146
LB_49145:
	bts r12,6
LB_49146:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_49139
	btr r12,4
	jmp LB_49140
LB_49139:
	bts r12,4
LB_49140:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49137
	btr r12,3
	jmp LB_49138
LB_49137:
	bts r12,3
LB_49138:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49135
	btr r12,2
	jmp LB_49136
LB_49135:
	bts r12,2
LB_49136:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49133
	btr r12,1
	jmp LB_49134
LB_49133:
	bts r12,1
LB_49134:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49131
	btr r12,0
	jmp LB_49132
LB_49131:
	bts r12,0
LB_49132:
	add rsp,48
MTC_LB_49147:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_49148
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_49149
	bt QWORD [rdi],0
	jc LB_49150
	btr r12,8
	jmp LB_49151
LB_49150:
	bts r12,8
LB_49151:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_49149:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_49152
	btr r12,7
	jmp LB_49153
LB_49152:
	bts r12,7
LB_49153:
LB_49154:
	cmp r15,0
	jz LB_49155
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49154
LB_49155:
; » 0xr0 |~ {  } ⊢ %_48867 : %_48867
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48864~5':_stg %_48862~4':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48866~7':_stg %_48831~2':(_lst)◂(_stg) }
; 	» 0xr0 _ ⊢ 6' : %_48867
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f45050 { %_48866 %_48867 } ⊢ { %_48868 %_48869 %_48870 } : { %_48868 %_48869 %_48870 }
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48864~5':_stg %_48862~4':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48866~7':_stg %_48831~2':(_lst)◂(_stg) %_48867~6':_r64 }
; _f45050 { 7' 6' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000000110.. |},{ 7' 6' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_49168
	btr r12,0
	jmp LB_49169
LB_49168:
	bts r12,0
LB_49169:
	mov r14,rcx
	bt r12,6
	jc LB_49170
	btr r12,1
	jmp LB_49171
LB_49170:
	bts r12,1
LB_49171:
	call NS_E_45050
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_49172
	btr r12,6
	jmp LB_49173
LB_49172:
	bts r12,6
LB_49173:
	mov rdx,r14
	bt r12,1
	jc LB_49174
	btr r12,7
	jmp LB_49175
LB_49174:
	bts r12,7
LB_49175:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_49178
	btr r12,8
	jmp LB_49179
LB_49178:
	bts r12,8
LB_49179:
	mov rsi,1
	bt r12,8
	jc LB_49176
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_49176
	jmp LB_49177
LB_49176:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_49177:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_49166
	btr r12,5
	jmp LB_49167
LB_49166:
	bts r12,5
LB_49167:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_49164
	btr r12,4
	jmp LB_49165
LB_49164:
	bts r12,4
LB_49165:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49162
	btr r12,3
	jmp LB_49163
LB_49162:
	bts r12,3
LB_49163:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49160
	btr r12,2
	jmp LB_49161
LB_49160:
	bts r12,2
LB_49161:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49158
	btr r12,1
	jmp LB_49159
LB_49158:
	bts r12,1
LB_49159:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49156
	btr r12,0
	jmp LB_49157
LB_49156:
	bts r12,0
LB_49157:
	add rsp,56
; _f26 { %_48868 %_48869 %_48870 } ⊢ { %_48871 %_48872 %_48873 } : { %_48871 %_48872 %_48873 }
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48864~5':_stg %_48862~4':_stg %_48870~8':(_opn)◂((_lst)◂(_p41165)) %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48831~2':(_lst)◂(_stg) %_48869~7':_r64 %_48868~6':_stg }
; _f26 { 6' 7' 8' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000001110.. |},{ 6' 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_49194
	btr r12,1
	jmp LB_49195
LB_49194:
	bts r12,1
LB_49195:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_49192
	btr QWORD [rdi],0
	jmp LB_49193
LB_49192:
	bts QWORD [rdi],0
LB_49193:
	mov r14,rdx
	bt r12,7
	jc LB_49198
	btr r12,1
	jmp LB_49199
LB_49198:
	bts r12,1
LB_49199:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_49196
	btr QWORD [rdi],1
	jmp LB_49197
LB_49196:
	bts QWORD [rdi],1
LB_49197:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_49202
	btr r12,1
	jmp LB_49203
LB_49202:
	bts r12,1
LB_49203:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_49200
	btr QWORD [rdi],2
	jmp LB_49201
LB_49200:
	bts QWORD [rdi],2
LB_49201:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_49206
	btr r12,1
	jmp LB_49207
LB_49206:
	bts r12,1
LB_49207:
	mov rcx,r14
	bt r12,1
	jc LB_49204
	btr r12,6
	jmp LB_49205
LB_49204:
	bts r12,6
LB_49205:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_49210
	btr r12,1
	jmp LB_49211
LB_49210:
	bts r12,1
LB_49211:
	mov rdx,r14
	bt r12,1
	jc LB_49208
	btr r12,7
	jmp LB_49209
LB_49208:
	bts r12,7
LB_49209:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_49214
	btr r12,1
	jmp LB_49215
LB_49214:
	bts r12,1
LB_49215:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_49212
	btr r12,8
	jmp LB_49213
LB_49212:
	bts r12,8
LB_49213:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_49190
	btr r12,5
	jmp LB_49191
LB_49190:
	bts r12,5
LB_49191:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_49188
	btr r12,4
	jmp LB_49189
LB_49188:
	bts r12,4
LB_49189:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_49186
	btr r12,3
	jmp LB_49187
LB_49186:
	bts r12,3
LB_49187:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_49184
	btr r12,2
	jmp LB_49185
LB_49184:
	bts r12,2
LB_49185:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_49182
	btr r12,1
	jmp LB_49183
LB_49182:
	bts r12,1
LB_49183:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_49180
	btr r12,0
	jmp LB_49181
LB_49180:
	bts r12,0
LB_49181:
	add rsp,56
; ∎ {  }
 ; {>  %_48872~7':_r64 %_48857~1':_r64 %_48856~0':_stg %_48873~8':(_opn)◂((_lst)◂(_p41165)) %_48864~5':_stg %_48862~4':_stg %_48871~6':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48831~2':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,7
	jc LB_49216
	mov rdi,rdx
	call dlt
LB_49216:
	bt r12,1
	jc LB_49217
	mov rdi,r14
	call dlt
LB_49217:
	bt r12,0
	jc LB_49218
	mov rdi,r13
	call dlt
LB_49218:
	bt r12,8
	jc LB_49219
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_49219:
	bt r12,5
	jc LB_49220
	mov rdi,r11
	call dlt
LB_49220:
	bt r12,4
	jc LB_49221
	mov rdi,r10
	call dlt
LB_49221:
	bt r12,6
	jc LB_49222
	mov rdi,rcx
	call dlt
LB_49222:
	bt r12,3
	jc LB_49223
	mov rdi,r9
	call dlt
LB_49223:
	bt r12,2
	jc LB_49224
	mov rdi,r8
	call dlt
LB_49224:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_49148:
	mov r15,0
LB_49226:
	cmp r15,0
	jz LB_49227
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49226
LB_49227:
; ∎ {  }
 ; {>  %_48857~1':_r64 %_48856~0':_stg %_48864~5':_stg %_48862~4':_stg %_48858~3':(_opn)◂((_lst)◂(_p41165)) %_48831~2':(_lst)◂(_stg) %_48865~6':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_49228
	mov rdi,r14
	call dlt
LB_49228:
	bt r12,0
	jc LB_49229
	mov rdi,r13
	call dlt
LB_49229:
	bt r12,5
	jc LB_49230
	mov rdi,r11
	call dlt
LB_49230:
	bt r12,4
	jc LB_49231
	mov rdi,r10
	call dlt
LB_49231:
	bt r12,3
	jc LB_49232
	mov rdi,r9
	call dlt
LB_49232:
	bt r12,2
	jc LB_49233
	mov rdi,r8
	call dlt
LB_49233:
	bt r12,6
	jc LB_49234
	mov rdi,rcx
	call dlt
LB_49234:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_49225:
MTC_LB_49082:
section .data
	NS_E_DYN_40451:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40451
	NS_E_DYN_40454:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40454
	NS_E_DYN_40455:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40455
	NS_E_DYN_40456:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40456
	NS_E_DYN_40457:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40457
	NS_E_DYN_40464:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40464
	NS_E_DYN_40503:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40503
	NS_E_DYN_40521:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40521
	NS_E_DYN_40564:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40564
	NS_E_DYN_40574:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40574
	NS_E_DYN_40575:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40575
	NS_E_DYN_40576:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40576
	NS_E_DYN_40794:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40794
	NS_E_DYN_40833:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40833
	NS_E_DYN_40872:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40872
	NS_E_DYN_40911:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40911
	NS_E_DYN_40942:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40942
	NS_E_DYN_40943:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40943
	NS_E_DYN_40944:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40944
	NS_E_DYN_41071:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41071
	NS_E_DYN_41118:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41119:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41128:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41128
	NS_E_DYN_41163:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41164:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41244:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41245:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41246:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41247:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41248:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41249:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41250:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41251:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41252:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41253:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41254:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_41255:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_41256:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_41257:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41258:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41259:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_41260:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_41261:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_41262:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_41263:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_41264:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_41272:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41272
	NS_E_DYN_41342:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41342
	NS_E_DYN_41332:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41332
	NS_E_DYN_41323:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41323
	NS_E_DYN_41313:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41313
	NS_E_DYN_41904:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41904
	NS_E_DYN_41864:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41864
	NS_E_DYN_41828:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41828
	NS_E_DYN_41810:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41810
	NS_E_DYN_41789:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41789
	NS_E_DYN_41765:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41765
	NS_E_DYN_41755:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41755
	NS_E_DYN_41730:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41730
	NS_E_DYN_41715:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41715
	NS_E_DYN_41701:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41701
	NS_E_DYN_41693:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41693
	NS_E_DYN_41679:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41679
	NS_E_DYN_41644:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41644
	NS_E_DYN_41625:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41625
	NS_E_DYN_41616:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41616
	NS_E_DYN_41598:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41598
	NS_E_DYN_41573:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41573
	NS_E_DYN_41504:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_41504
	NS_E_DYN_43187:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_43188:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_43189:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43189
	NS_E_DYN_43190:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43190
	NS_E_DYN_43191:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43191
	NS_E_DYN_43192:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43192
	NS_E_DYN_43839:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43839
	NS_E_DYN_43940:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43940
	CST_DYN_44002:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_44005:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44005
	NS_E_DYN_44072:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44072
	NS_E_DYN_44157:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_44158:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_44165:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44165
	NS_E_DYN_44201:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44201
	NS_E_DYN_44202:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44202
	NS_E_DYN_44203:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44203
	NS_E_DYN_44204:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44204
	NS_E_DYN_44465:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44465
	NS_E_DYN_44466:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44466
	NS_E_DYN_44469:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44469
	NS_E_DYN_44470:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44470
	NS_E_DYN_44735:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44735
	NS_E_DYN_44736:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44736
	NS_E_DYN_44737:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44737
	NS_E_DYN_44738:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44738
	NS_E_DYN_44739:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44739
	NS_E_DYN_45050:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45050
	NS_E_DYN_45051:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45051
	NS_E_DYN_45052:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45052
	NS_E_DYN_45053:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45053
	NS_E_DYN_45054:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45054
	NS_E_DYN_45055:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45055
	NS_E_DYN_45056:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45056
	NS_E_DYN_45059:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45059
	NS_E_DYN_45060:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45060
	NS_E_DYN_45061:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45061
	NS_E_DYN_45062:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45062
	NS_E_DYN_45063:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45063
	NS_E_DYN_45064:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45064
	NS_E_DYN_45065:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45065
	NS_E_DYN_45066:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45066
	NS_E_DYN_45067:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45067
	NS_E_DYN_45068:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45068
	NS_E_DYN_45069:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45069
	NS_E_DYN_45070:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45070
	NS_E_DYN_45071:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45071
	NS_E_DYN_45072:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45072
	NS_E_DYN_45073:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45073
	NS_E_DYN_45074:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45074
	NS_E_DYN_45075:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45075
	NS_E_DYN_45076:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45076
	NS_E_DYN_45077:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45077
	NS_E_DYN_45078:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45078
	NS_E_DYN_45079:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45079
	NS_E_DYN_45080:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45080
	NS_E_DYN_45081:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45081
	NS_E_DYN_45082:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45082
	NS_E_DYN_45083:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45083
	NS_E_DYN_45084:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45084
	NS_E_DYN_45085:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45085
	NS_E_DYN_45086:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45086
	NS_E_DYN_45087:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45087
	NS_E_DYN_45088:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45088
	NS_E_DYN_45089:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45089
	NS_E_DYN_45090:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45090
	CST_DYN_48874:
		dq 0x0000_0001_00_82_ffff
		dq 1
