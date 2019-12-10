%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_44597
	call NS_E_46613
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
NS_E_43382:
NS_E_RDI_43382:
NS_E_43382_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_43383
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_43383:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_43385:
NS_E_RDI_43385:
NS_E_43385_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_43385_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_43385_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_43386:
NS_E_RDI_43386:
NS_E_43386_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_43386_LB_0
	cmp r11,57
	ja NS_E_43386_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43386_LB_0:
	mov rax,0
	ret
NS_E_43388:
NS_E_RDI_43388:
NS_E_43388_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_43388_LB_0
	cmp r11,122
	ja NS_E_43388_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43388_LB_0:
	mov rax,0
	ret
NS_E_43387:
NS_E_RDI_43387:
NS_E_43387_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_43387_LB_0
	cmp r11,90
	ja NS_E_43387_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43387_LB_0:
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
NS_E_43384:
NS_E_RDI_43384:
NS_E_43384_ETR_TBL:
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
	jz NS_E_43384_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_43384_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_43402:
; 	|» { 0' 1' }
NS_E_RDI_43402:
MTC_LB_43403:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_43404
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
	jnc LB_43405
	bt QWORD [rax],0
	jc LB_43406
	btr r12,4
	jmp LB_43407
LB_43406:
	bts r12,4
LB_43407:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_43405:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_43410
	btr r12,5
	jmp LB_43411
LB_43410:
	bts r12,5
LB_43411:
	mov r8,r11
	bt r12,5
	jc LB_43408
	btr r12,2
	jmp LB_43409
LB_43408:
	bts r12,2
LB_43409:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_43414
	btr r12,5
	jmp LB_43415
LB_43414:
	bts r12,5
LB_43415:
	mov r9,r11
	bt r12,5
	jc LB_43412
	btr r12,3
	jmp LB_43413
LB_43412:
	bts r12,3
LB_43413:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43416:
	cmp r15,0
	jz LB_43417
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43416
LB_43417:
; _f39 %_43389 ⊢ %_43393 : %_43393
 ; {>  %_43392~3':(_lst)◂(_r64) %_43391~2':_r64 %_43389~0':_r64 }
	add r13,1
; _f43402 { %_43393 %_43392 } ⊢ { %_43394 %_43395 } : { %_43394 %_43395 }
 ; {>  %_43393~0':_r64 %_43392~3':(_lst)◂(_r64) %_43391~2':_r64 }
; _f43402 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_43420
	btr r12,1
	jmp LB_43421
LB_43420:
	bts r12,1
LB_43421:
	call NS_E_43402
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_43418
	btr r12,2
	jmp LB_43419
LB_43418:
	bts r12,2
LB_43419:
	add rsp,16
; _f38 %_43394 ⊢ %_43396 : %_43396
 ; {>  %_43394~0':_r64 %_43391~2':_r64 %_43395~1':_stg }
	sub r13,1
; _f16 { %_43395 %_43396 %_43391 } ⊢ { %_43397 %_43398 %_43399 } : { %_43397 %_43398 %_43399 }
 ; {>  %_43396~0':_r64 %_43391~2':_r64 %_43395~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_43422
	btr r12,3
	jmp LB_43423
LB_43422:
	bts r12,3
LB_43423:
	mov r14,r13
	bt r12,0
	jc LB_43424
	btr r12,1
	jmp LB_43425
LB_43424:
	bts r12,1
LB_43425:
	mov r13,r9
	bt r12,3
	jc LB_43426
	btr r12,0
	jmp LB_43427
LB_43426:
	bts r12,0
LB_43427:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_43398 %_43397 }
 ; {>  %_43397~0':_stg %_43398~1':_r64 %_43399~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_43428
	mov rdi,r8
	call dlt
LB_43428:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_43429
	btr r12,2
	jmp LB_43430
LB_43429:
	bts r12,2
LB_43430:
	mov r14,r13
	bt r12,0
	jc LB_43431
	btr r12,1
	jmp LB_43432
LB_43431:
	bts r12,1
LB_43432:
	mov r13,r8
	bt r12,2
	jc LB_43433
	btr r12,0
	jmp LB_43434
LB_43433:
	bts r12,0
LB_43434:
	ret
MTC_LB_43404:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_43435
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
	jnc LB_43436
	bt QWORD [rax],0
	jc LB_43437
	btr r12,2
	jmp LB_43438
LB_43437:
	bts r12,2
LB_43438:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_43436:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_43439:
	cmp r15,0
	jz LB_43440
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43439
LB_43440:
; _f14 %_43389 ⊢ { %_43400 %_43401 } : { %_43400 %_43401 }
 ; {>  %_43389~0':_r64 }
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
; ∎ { %_43400 %_43401 }
 ; {>  %_43400~0':_r64 %_43401~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_43435:
NS_E_43445:
; 	|» 0'
NS_E_RDI_43445:
; » 0xr0 |~ {  } ⊢ %_43442 : %_43442
 ; {>  %_43441~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_43442
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f43402 { %_43442 %_43441 } ⊢ { %_43443 %_43444 } : { %_43443 %_43444 }
 ; {>  %_43442~1':_r64 %_43441~0':(_lst)◂(_r64) }
; _f43402 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_43446
	btr r12,2
	jmp LB_43447
LB_43446:
	bts r12,2
LB_43447:
	mov r14,r13
	bt r12,0
	jc LB_43448
	btr r12,1
	jmp LB_43449
LB_43448:
	bts r12,1
LB_43449:
	mov r13,r8
	bt r12,2
	jc LB_43450
	btr r12,0
	jmp LB_43451
LB_43450:
	bts r12,0
LB_43451:
	call NS_E_43402
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_43444
 ; {>  %_43444~1':_stg %_43443~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_43452
	mov rdi,r13
	call dlt
LB_43452:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_43453
	btr r12,0
	jmp LB_43454
LB_43453:
	bts r12,0
LB_43454:
	ret
NS_E_43455:
NS_E_RDI_43455:
NS_E_43455_ETR_TBL:
NS_E_43455_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_43495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_43495
	jmp LB_43496
LB_43495:
	jmp NS_E_43455_MTC_0_failed
LB_43496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_43456_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43500
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43501
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43501:
	jmp NS_E_43455_MTC_0_failed
LB_43500:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43488
	btr r12,1
	jmp LB_43489
LB_43488:
	bts r12,1
LB_43489:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43486
	btr r12,0
	jmp LB_43487
LB_43486:
	bts r12,0
LB_43487:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43483
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_43503
	btr r12,2
	jmp LB_43504
LB_43503:
	bts r12,2
LB_43504:
	mov r13,r14
	bt r12,1
	jc LB_43505
	btr r12,0
	jmp LB_43506
LB_43505:
	bts r12,0
LB_43506:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f43445 %_43458 ⊢ %_43459 : %_43459
 ; {>  %_43458~0':(_lst)◂(_r64) }
; _f43445 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_43445
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_43459 ⊢ %_43460 : %_43460
 ; {>  %_43459~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_43460
 ; {>  %_43460~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43481
	btr r12,3
	jmp LB_43482
LB_43481:
	bts r12,3
LB_43482:
	mov r8,0
	bts r12,2
	ret
LB_43483:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43485
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43484
LB_43485:
	add rsp,8
	ret
NS_E_43455_MTC_0_failed:
	add rsp,32
	pop r14
LB_43484:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43456:
NS_E_RDI_43456:
NS_E_43456_ETR_TBL:
NS_E_43456_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_43531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_43531
	jmp LB_43532
LB_43531:
	jmp NS_E_43456_MTC_0_failed
LB_43532:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_43457_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43537
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43537:
	jmp NS_E_43456_MTC_0_failed
LB_43536:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_43456_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43542
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_43543
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_43543:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43544
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43544:
	jmp NS_E_43456_MTC_0_failed
LB_43542:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_43524
	btr r12,2
	jmp LB_43525
LB_43524:
	bts r12,2
LB_43525:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43522
	btr r12,1
	jmp LB_43523
LB_43522:
	bts r12,1
LB_43523:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43520
	btr r12,0
	jmp LB_43521
LB_43520:
	bts r12,0
LB_43521:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_43517
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_43546
	btr r12,3
	jmp LB_43547
LB_43546:
	bts r12,3
LB_43547:
	mov r14,r8
	bt r12,2
	jc LB_43548
	btr r12,1
	jmp LB_43549
LB_43548:
	bts r12,1
LB_43549:
	mov r8,r13
	bt r12,0
	jc LB_43550
	btr r12,2
	jmp LB_43551
LB_43550:
	bts r12,2
LB_43551:
	mov r13,r9
	bt r12,3
	jc LB_43552
	btr r12,0
	jmp LB_43553
LB_43552:
	bts r12,0
LB_43553:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_43461 %_43462 } ⊢ %_43463 : %_43463
 ; {>  %_43462~1':(_lst)◂(_r64) %_43461~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_43463 ⊢ %_43464 : %_43464
 ; {>  %_43463~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_43464
 ; {>  %_43464~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_43511
	btr r12,2
	jmp LB_43512
LB_43511:
	bts r12,2
LB_43512:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_43509
	btr QWORD [rdi],0
	jmp LB_43510
LB_43509:
	bts QWORD [rdi],0
LB_43510:
	mov r8,r14
	bt r12,1
	jc LB_43515
	btr r12,2
	jmp LB_43516
LB_43515:
	bts r12,2
LB_43516:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_43513
	btr QWORD [rdi],1
	jmp LB_43514
LB_43513:
	bts QWORD [rdi],1
LB_43514:
	mov rsi,1
	bt r12,3
	jc LB_43507
	mov rsi,0
	bt r9,0
	jc LB_43507
	jmp LB_43508
LB_43507:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_43508:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_43517:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43519
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43518
LB_43519:
	add rsp,8
	ret
NS_E_43456_MTC_0_failed:
	add rsp,48
	pop r14
LB_43518:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_43566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_43566
	jmp LB_43567
LB_43566:
	jmp NS_E_43456_MTC_1_failed
LB_43567:
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
	jc LB_43559
	btr r12,0
	jmp LB_43560
LB_43559:
	bts r12,0
LB_43560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43556
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_43465 : %_43465
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_43465 ⊢ %_43466 : %_43466
 ; {>  %_43465~°1◂{  }:(_lst)◂(t7761'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_43466
 ; {>  %_43466~°0◂°1◂{  }:(_opn)◂((_lst)◂(t7764'(0))) }
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
	jc LB_43554
	mov rsi,0
	bt r9,0
	jc LB_43554
	jmp LB_43555
LB_43554:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_43555:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_43556:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43558
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43557
LB_43558:
	add rsp,8
	ret
NS_E_43456_MTC_1_failed:
	add rsp,16
	pop r14
LB_43557:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43588
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43456_MTC_2_failed
LB_43588:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_43456_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43593
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43594
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43594:
	jmp NS_E_43456_MTC_2_failed
LB_43593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43583
	btr r12,1
	jmp LB_43584
LB_43583:
	bts r12,1
LB_43584:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43581
	btr r12,0
	jmp LB_43582
LB_43581:
	bts r12,0
LB_43582:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43578
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_43467 %_43468 } ⊢ %_43469 : %_43469
 ; {>  %_43468~1':(_lst)◂(_r64) %_43467~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_43469 ⊢ %_43470 : %_43470
 ; {>  %_43469~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_43470
 ; {>  %_43470~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_43572
	btr r12,2
	jmp LB_43573
LB_43572:
	bts r12,2
LB_43573:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_43570
	btr QWORD [rdi],0
	jmp LB_43571
LB_43570:
	bts QWORD [rdi],0
LB_43571:
	mov r8,r14
	bt r12,1
	jc LB_43576
	btr r12,2
	jmp LB_43577
LB_43576:
	bts r12,2
LB_43577:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_43574
	btr QWORD [rdi],1
	jmp LB_43575
LB_43574:
	bts QWORD [rdi],1
LB_43575:
	mov rsi,1
	bt r12,3
	jc LB_43568
	mov rsi,0
	bt r9,0
	jc LB_43568
	jmp LB_43569
LB_43568:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_43569:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_43578:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43580
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43579
LB_43580:
	add rsp,8
	ret
NS_E_43456_MTC_2_failed:
	add rsp,32
	pop r14
LB_43579:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43457:
NS_E_RDI_43457:
NS_E_43457_ETR_TBL:
NS_E_43457_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_43608
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_43608
	jmp LB_43609
LB_43608:
	jmp NS_E_43457_MTC_0_failed
LB_43609:
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
	jc LB_43601
	btr r12,0
	jmp LB_43602
LB_43601:
	bts r12,0
LB_43602:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43598
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_43471 : %_43471
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_43471
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_43471 ⊢ %_43472 : %_43472
 ; {>  %_43471~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43472
 ; {>  %_43472~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43596
	btr r12,3
	jmp LB_43597
LB_43596:
	bts r12,3
LB_43597:
	mov r8,0
	bts r12,2
	ret
LB_43598:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43600
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43599
LB_43600:
	add rsp,8
	ret
NS_E_43457_MTC_0_failed:
	add rsp,16
	pop r14
LB_43599:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_43622
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_43622
	jmp LB_43623
LB_43622:
	jmp NS_E_43457_MTC_1_failed
LB_43623:
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
	jc LB_43615
	btr r12,0
	jmp LB_43616
LB_43615:
	bts r12,0
LB_43616:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43612
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_43473 : %_43473
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_43473
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_43473 ⊢ %_43474 : %_43474
 ; {>  %_43473~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43474
 ; {>  %_43474~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43610
	btr r12,3
	jmp LB_43611
LB_43610:
	bts r12,3
LB_43611:
	mov r8,0
	bts r12,2
	ret
LB_43612:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43614
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43613
LB_43614:
	add rsp,8
	ret
NS_E_43457_MTC_1_failed:
	add rsp,16
	pop r14
LB_43613:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_43636
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_43636
	jmp LB_43637
LB_43636:
	jmp NS_E_43457_MTC_2_failed
LB_43637:
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
	jc LB_43629
	btr r12,0
	jmp LB_43630
LB_43629:
	bts r12,0
LB_43630:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43626
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_43475 : %_43475
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_43475
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_43475 ⊢ %_43476 : %_43476
 ; {>  %_43475~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43476
 ; {>  %_43476~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43624
	btr r12,3
	jmp LB_43625
LB_43624:
	bts r12,3
LB_43625:
	mov r8,0
	bts r12,2
	ret
LB_43626:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43628
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43627
LB_43628:
	add rsp,8
	ret
NS_E_43457_MTC_2_failed:
	add rsp,16
	pop r14
LB_43627:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_43650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_43650
	jmp LB_43651
LB_43650:
	jmp NS_E_43457_MTC_3_failed
LB_43651:
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
	jc LB_43643
	btr r12,0
	jmp LB_43644
LB_43643:
	bts r12,0
LB_43644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43640
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_43477 : %_43477
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_43477
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_43477 ⊢ %_43478 : %_43478
 ; {>  %_43477~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43478
 ; {>  %_43478~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43638
	btr r12,3
	jmp LB_43639
LB_43638:
	bts r12,3
LB_43639:
	mov r8,0
	bts r12,2
	ret
LB_43640:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43642
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43641
LB_43642:
	add rsp,8
	ret
NS_E_43457_MTC_3_failed:
	add rsp,16
	pop r14
LB_43641:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_43664
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_43664
	jmp LB_43665
LB_43664:
	jmp NS_E_43457_MTC_4_failed
LB_43665:
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
	jc LB_43657
	btr r12,0
	jmp LB_43658
LB_43657:
	bts r12,0
LB_43658:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43654
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_43479 : %_43479
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_43479
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_43479 ⊢ %_43480 : %_43480
 ; {>  %_43479~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43480
 ; {>  %_43480~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43652
	btr r12,3
	jmp LB_43653
LB_43652:
	bts r12,3
LB_43653:
	mov r8,0
	bts r12,2
	ret
LB_43654:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43656
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43655
LB_43656:
	add rsp,8
	ret
NS_E_43457_MTC_4_failed:
	add rsp,16
	pop r14
LB_43655:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43666:
NS_E_RDI_43666:
NS_E_43666_ETR_TBL:
NS_E_43666_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43702
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43666_MTC_0_failed
LB_43702:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43697
	btr r12,0
	jmp LB_43698
LB_43697:
	bts r12,0
LB_43698:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43694
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_43668 : %_43668
 ; {>  %_43667~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_43668
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_43669 : %_43669
 ; {>  %_43668~1':_r64 %_43667~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_43669
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_43667 %_43668 } ⊢ { %_43670 %_43671 %_43672 } : { %_43670 %_43671 %_43672 }
 ; {>  %_43669~2':_r64 %_43668~1':_r64 %_43667~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_43669 %_43670 } ⊢ { %_43673 %_43674 %_43675 } : { %_43673 %_43674 %_43675 }
 ; {>  %_43669~2':_r64 %_43671~1':_r64 %_43670~0':_r64 %_43672~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_43678:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_43679
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_43679
LB_43680:
	cmp r15,0
	jz LB_43681
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43680
LB_43681:
; _some %_43674 ⊢ %_43676 : %_43676
 ; {>  %_43674~0':_r64 %_43671~1':_r64 %_43673~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43676
 ; {>  %_43671~1':_r64 %_43676~°0◂0':(_opn)◂(_r64) %_43673~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_43682
	mov rdi,r14
	call dlt
LB_43682:
	bt r12,2
	jc LB_43683
	mov rdi,r8
	call dlt
LB_43683:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43684
	btr r12,3
	jmp LB_43685
LB_43684:
	bts r12,3
LB_43685:
	mov r8,0
	bts r12,2
	ret
MTC_LB_43679:
	mov r15,0
LB_43687:
	cmp r15,0
	jz LB_43688
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43687
LB_43688:
; _none {  } ⊢ %_43677 : %_43677
 ; {>  %_43674~0':_r64 %_43671~1':_r64 %_43675~4':_r64 %_43673~2':_r64 %_43672~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_43677
 ; {>  %_43674~0':_r64 %_43671~1':_r64 %_43675~4':_r64 %_43677~°1◂{  }:(_opn)◂(t7839'(0)) %_43673~2':_r64 %_43672~3':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_43689
	mov rdi,r13
	call dlt
LB_43689:
	bt r12,1
	jc LB_43690
	mov rdi,r14
	call dlt
LB_43690:
	bt r12,4
	jc LB_43691
	mov rdi,r10
	call dlt
LB_43691:
	bt r12,2
	jc LB_43692
	mov rdi,r8
	call dlt
LB_43692:
	bt r12,3
	jc LB_43693
	mov rdi,r9
	call dlt
LB_43693:
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
MTC_LB_43686:
LB_43694:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43696
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43695
LB_43696:
	add rsp,8
	ret
NS_E_43666_MTC_0_failed:
	add rsp,16
	pop r14
LB_43695:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43704:
NS_E_RDI_43704:
NS_E_43704_ETR_TBL:
NS_E_43704_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43740
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43704_MTC_0_failed
LB_43740:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43735
	btr r12,0
	jmp LB_43736
LB_43735:
	bts r12,0
LB_43736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43732
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_43706 : %_43706
 ; {>  %_43705~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_43706
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_43707 : %_43707
 ; {>  %_43705~0':_r64 %_43706~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_43707
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_43705 %_43706 } ⊢ { %_43708 %_43709 %_43710 } : { %_43708 %_43709 %_43710 }
 ; {>  %_43707~2':_r64 %_43705~0':_r64 %_43706~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_43707 %_43708 } ⊢ { %_43711 %_43712 %_43713 } : { %_43711 %_43712 %_43713 }
 ; {>  %_43707~2':_r64 %_43710~3':_r64 %_43708~0':_r64 %_43709~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_43716:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_43717
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_43717
LB_43718:
	cmp r15,0
	jz LB_43719
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43718
LB_43719:
; _some %_43712 ⊢ %_43714 : %_43714
 ; {>  %_43709~1':_r64 %_43712~0':_r64 %_43711~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43714
 ; {>  %_43714~°0◂0':(_opn)◂(_r64) %_43709~1':_r64 %_43711~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_43720
	mov rdi,r14
	call dlt
LB_43720:
	bt r12,2
	jc LB_43721
	mov rdi,r8
	call dlt
LB_43721:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43722
	btr r12,3
	jmp LB_43723
LB_43722:
	bts r12,3
LB_43723:
	mov r8,0
	bts r12,2
	ret
MTC_LB_43717:
	mov r15,0
LB_43725:
	cmp r15,0
	jz LB_43726
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43725
LB_43726:
; _none {  } ⊢ %_43715 : %_43715
 ; {>  %_43713~4':_r64 %_43710~3':_r64 %_43709~1':_r64 %_43712~0':_r64 %_43711~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_43715
 ; {>  %_43713~4':_r64 %_43715~°1◂{  }:(_opn)◂(t7866'(0)) %_43710~3':_r64 %_43709~1':_r64 %_43712~0':_r64 %_43711~2':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_43727
	mov rdi,r10
	call dlt
LB_43727:
	bt r12,3
	jc LB_43728
	mov rdi,r9
	call dlt
LB_43728:
	bt r12,1
	jc LB_43729
	mov rdi,r14
	call dlt
LB_43729:
	bt r12,0
	jc LB_43730
	mov rdi,r13
	call dlt
LB_43730:
	bt r12,2
	jc LB_43731
	mov rdi,r8
	call dlt
LB_43731:
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
MTC_LB_43724:
LB_43732:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43734
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43733
LB_43734:
	add rsp,8
	ret
NS_E_43704_MTC_0_failed:
	add rsp,16
	pop r14
LB_43733:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43742:
NS_E_RDI_43742:
NS_E_43742_ETR_TBL:
NS_E_43742_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43778
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43742_MTC_0_failed
LB_43778:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43773
	btr r12,0
	jmp LB_43774
LB_43773:
	bts r12,0
LB_43774:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43770
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_43744 : %_43744
 ; {>  %_43743~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_43744
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_43745 : %_43745
 ; {>  %_43743~0':_r64 %_43744~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_43745
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_43743 %_43744 } ⊢ { %_43746 %_43747 %_43748 } : { %_43746 %_43747 %_43748 }
 ; {>  %_43743~0':_r64 %_43745~2':_r64 %_43744~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_43745 %_43746 } ⊢ { %_43749 %_43750 %_43751 } : { %_43749 %_43750 %_43751 }
 ; {>  %_43748~3':_r64 %_43746~0':_r64 %_43747~1':_r64 %_43745~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_43754:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_43755
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_43755
LB_43756:
	cmp r15,0
	jz LB_43757
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43756
LB_43757:
; _some %_43750 ⊢ %_43752 : %_43752
 ; {>  %_43750~0':_r64 %_43747~1':_r64 %_43749~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43752
 ; {>  %_43752~°0◂0':(_opn)◂(_r64) %_43747~1':_r64 %_43749~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_43758
	mov rdi,r14
	call dlt
LB_43758:
	bt r12,2
	jc LB_43759
	mov rdi,r8
	call dlt
LB_43759:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43760
	btr r12,3
	jmp LB_43761
LB_43760:
	bts r12,3
LB_43761:
	mov r8,0
	bts r12,2
	ret
MTC_LB_43755:
	mov r15,0
LB_43763:
	cmp r15,0
	jz LB_43764
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_43763
LB_43764:
; _none {  } ⊢ %_43753 : %_43753
 ; {>  %_43751~4':_r64 %_43750~0':_r64 %_43748~3':_r64 %_43747~1':_r64 %_43749~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_43753
 ; {>  %_43753~°1◂{  }:(_opn)◂(t7893'(0)) %_43751~4':_r64 %_43750~0':_r64 %_43748~3':_r64 %_43747~1':_r64 %_43749~2':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_43765
	mov rdi,r10
	call dlt
LB_43765:
	bt r12,0
	jc LB_43766
	mov rdi,r13
	call dlt
LB_43766:
	bt r12,3
	jc LB_43767
	mov rdi,r9
	call dlt
LB_43767:
	bt r12,1
	jc LB_43768
	mov rdi,r14
	call dlt
LB_43768:
	bt r12,2
	jc LB_43769
	mov rdi,r8
	call dlt
LB_43769:
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
MTC_LB_43762:
LB_43770:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43772
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43771
LB_43772:
	add rsp,8
	ret
NS_E_43742_MTC_0_failed:
	add rsp,16
	pop r14
LB_43771:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43780:
NS_E_RDI_43780:
NS_E_43780_ETR_TBL:
NS_E_43780_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_43742_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43795
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43780_MTC_0_failed
LB_43795:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43790
	btr r12,0
	jmp LB_43791
LB_43790:
	bts r12,0
LB_43791:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43787
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_43781 ⊢ %_43782 : %_43782
 ; {>  %_43781~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43782
 ; {>  %_43782~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43785
	btr r12,3
	jmp LB_43786
LB_43785:
	bts r12,3
LB_43786:
	mov r8,0
	bts r12,2
	ret
LB_43787:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43789
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43788
LB_43789:
	add rsp,8
	ret
NS_E_43780_MTC_0_failed:
	add rsp,16
	pop r14
LB_43788:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_43704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43807
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43780_MTC_1_failed
LB_43807:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
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
	add rsp,16
	push rdi
	push rsi
	push LB_43799
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_43783 ⊢ %_43784 : %_43784
 ; {>  %_43783~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43784
 ; {>  %_43784~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43797
	btr r12,3
	jmp LB_43798
LB_43797:
	bts r12,3
LB_43798:
	mov r8,0
	bts r12,2
	ret
LB_43799:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43801
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43800
LB_43801:
	add rsp,8
	ret
NS_E_43780_MTC_1_failed:
	add rsp,16
	pop r14
LB_43800:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43809:
NS_E_RDI_43809:
NS_E_43809_ETR_TBL:
NS_E_43809_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_43780_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43853
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43809_MTC_0_failed
LB_43853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_43810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43858
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43859:
	jmp NS_E_43809_MTC_0_failed
LB_43858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43848
	btr r12,1
	jmp LB_43849
LB_43848:
	bts r12,1
LB_43849:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43846
	btr r12,0
	jmp LB_43847
LB_43846:
	bts r12,0
LB_43847:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43843
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_43812 %_43813 } ⊢ %_43814 : %_43814
 ; {>  %_43813~1':(_lst)◂(_r64) %_43812~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f43445 %_43814 ⊢ %_43815 : %_43815
 ; {>  %_43814~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f43445 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_43829
	btr r12,2
	jmp LB_43830
LB_43829:
	bts r12,2
LB_43830:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_43835
	btr r12,3
	jmp LB_43836
LB_43835:
	bts r12,3
LB_43836:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_43833
	btr QWORD [rdi],0
	jmp LB_43834
LB_43833:
	bts QWORD [rdi],0
LB_43834:
	mov r9,r14
	bt r12,1
	jc LB_43839
	btr r12,3
	jmp LB_43840
LB_43839:
	bts r12,3
LB_43840:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_43837
	btr QWORD [rdi],1
	jmp LB_43838
LB_43837:
	bts QWORD [rdi],1
LB_43838:
	mov rsi,1
	bt r12,0
	jc LB_43831
	mov rsi,0
	bt r13,0
	jc LB_43831
	jmp LB_43832
LB_43831:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_43832:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_43445
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_43815 ⊢ %_43816 : %_43816
 ; {>  %_43815~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_43816
 ; {>  %_43816~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43841
	btr r12,3
	jmp LB_43842
LB_43841:
	bts r12,3
LB_43842:
	mov r8,0
	bts r12,2
	ret
LB_43843:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43845
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43844
LB_43845:
	add rsp,8
	ret
NS_E_43809_MTC_0_failed:
	add rsp,32
	pop r14
LB_43844:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43810:
NS_E_RDI_43810:
NS_E_43810_ETR_TBL:
NS_E_43810_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_43811_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43881
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43810_MTC_0_failed
LB_43881:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_43810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43886
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43887
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43887:
	jmp NS_E_43810_MTC_0_failed
LB_43886:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43876
	btr r12,1
	jmp LB_43877
LB_43876:
	bts r12,1
LB_43877:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43874
	btr r12,0
	jmp LB_43875
LB_43874:
	bts r12,0
LB_43875:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43871
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_43817 %_43818 } ⊢ %_43819 : %_43819
 ; {>  %_43817~0':_r64 %_43818~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_43819 ⊢ %_43820 : %_43820
 ; {>  %_43819~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_43820
 ; {>  %_43820~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_43865
	btr r12,2
	jmp LB_43866
LB_43865:
	bts r12,2
LB_43866:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_43863
	btr QWORD [rdi],0
	jmp LB_43864
LB_43863:
	bts QWORD [rdi],0
LB_43864:
	mov r8,r14
	bt r12,1
	jc LB_43869
	btr r12,2
	jmp LB_43870
LB_43869:
	bts r12,2
LB_43870:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_43867
	btr QWORD [rdi],1
	jmp LB_43868
LB_43867:
	bts QWORD [rdi],1
LB_43868:
	mov rsi,1
	bt r12,3
	jc LB_43861
	mov rsi,0
	bt r9,0
	jc LB_43861
	jmp LB_43862
LB_43861:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_43862:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_43871:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43873
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43872
LB_43873:
	add rsp,8
	ret
NS_E_43810_MTC_0_failed:
	add rsp,32
	pop r14
LB_43872:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_43891
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_43821 : %_43821
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_43821 ⊢ %_43822 : %_43822
 ; {>  %_43821~°1◂{  }:(_lst)◂(t7937'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_43822
 ; {>  %_43822~°0◂°1◂{  }:(_opn)◂((_lst)◂(t7940'(0))) }
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
	jc LB_43889
	mov rsi,0
	bt r9,0
	jc LB_43889
	jmp LB_43890
LB_43889:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_43890:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_43891:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43893
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43892
LB_43893:
	add rsp,8
	ret
NS_E_43810_MTC_1_failed:
	add rsp,0
	pop r14
LB_43892:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43811:
NS_E_RDI_43811:
NS_E_43811_ETR_TBL:
NS_E_43811_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_43780_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43904
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43811_MTC_0_failed
LB_43904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43899
	btr r12,0
	jmp LB_43900
LB_43899:
	bts r12,0
LB_43900:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43896
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_43823 ⊢ %_43824 : %_43824
 ; {>  %_43823~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43824
 ; {>  %_43824~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43894
	btr r12,3
	jmp LB_43895
LB_43894:
	bts r12,3
LB_43895:
	mov r8,0
	bts r12,2
	ret
LB_43896:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43898
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43897
LB_43898:
	add rsp,8
	ret
NS_E_43811_MTC_0_failed:
	add rsp,16
	pop r14
LB_43897:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_43666_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43916
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43811_MTC_1_failed
LB_43916:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43911
	btr r12,0
	jmp LB_43912
LB_43911:
	bts r12,0
LB_43912:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43908
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_43825 ⊢ %_43826 : %_43826
 ; {>  %_43825~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43826
 ; {>  %_43826~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43906
	btr r12,3
	jmp LB_43907
LB_43906:
	bts r12,3
LB_43907:
	mov r8,0
	bts r12,2
	ret
LB_43908:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43910
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43909
LB_43910:
	add rsp,8
	ret
NS_E_43811_MTC_1_failed:
	add rsp,16
	pop r14
LB_43909:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_43930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_43930
	jmp LB_43931
LB_43930:
	jmp NS_E_43811_MTC_2_failed
LB_43931:
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
	jc LB_43923
	btr r12,0
	jmp LB_43924
LB_43923:
	bts r12,0
LB_43924:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43920
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_43827 : %_43827
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_43827
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_43827 ⊢ %_43828 : %_43828
 ; {>  %_43827~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_43828
 ; {>  %_43828~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43918
	btr r12,3
	jmp LB_43919
LB_43918:
	bts r12,3
LB_43919:
	mov r8,0
	bts r12,2
	ret
LB_43920:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43922
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43921
LB_43922:
	add rsp,8
	ret
NS_E_43811_MTC_2_failed:
	add rsp,16
	pop r14
LB_43921:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43932:
NS_E_RDI_43932:
NS_E_43932_ETR_TBL:
NS_E_43932_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_43952
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_43952
	jmp LB_43953
LB_43952:
	jmp NS_E_43932_MTC_0_failed
LB_43953:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_43810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43957
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_43958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_43958:
	jmp NS_E_43932_MTC_0_failed
LB_43957:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_43945
	btr r12,1
	jmp LB_43946
LB_43945:
	bts r12,1
LB_43946:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43943
	btr r12,0
	jmp LB_43944
LB_43943:
	bts r12,0
LB_43944:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_43940
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_43960
	btr r12,2
	jmp LB_43961
LB_43960:
	bts r12,2
LB_43961:
	mov r13,r14
	bt r12,1
	jc LB_43962
	btr r12,0
	jmp LB_43963
LB_43962:
	bts r12,0
LB_43963:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f43445 %_43933 ⊢ %_43934 : %_43934
 ; {>  %_43933~0':(_lst)◂(_r64) }
; _f43445 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_43445
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_43934 ⊢ %_43935 : %_43935
 ; {>  %_43934~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_43935
 ; {>  %_43935~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43938
	btr r12,3
	jmp LB_43939
LB_43938:
	bts r12,3
LB_43939:
	mov r8,0
	bts r12,2
	ret
LB_43940:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43942
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43941
LB_43942:
	add rsp,8
	ret
NS_E_43932_MTC_0_failed:
	add rsp,32
	pop r14
LB_43941:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_43974
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43932_MTC_1_failed
LB_43974:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43969
	btr r12,0
	jmp LB_43970
LB_43969:
	bts r12,0
LB_43970:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_43966
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_43936 ⊢ %_43937 : %_43937
 ; {>  %_43936~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_43937
 ; {>  %_43937~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_43964
	btr r12,3
	jmp LB_43965
LB_43964:
	bts r12,3
LB_43965:
	mov r8,0
	bts r12,2
	ret
LB_43966:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_43968
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_43967
LB_43968:
	add rsp,8
	ret
NS_E_43932_MTC_1_failed:
	add rsp,16
	pop r14
LB_43967:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43977:
NS_E_RDI_43977:
NS_E_43977_ETR_TBL:
NS_E_43977_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_43985:
	jmp LB_43982
LB_43981:
	add r14,1
LB_43982:
	cmp r14,r10
	jge LB_43983
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_43981
	cmp al,10
	jz LB_43981
	cmp al,32
	jz LB_43981
LB_43983:
	push r10
	push rsi
	call NS_E_43809_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_43984
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_43986
	bts QWORD [rax],0
LB_43986:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_43985
LB_43984:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_43979
	btr QWORD [rdi],0
LB_43979:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_43977_MTC_0_failed:
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
NS_E_43996:
NS_E_RDI_43996:
NS_E_43996_ETR_TBL:
NS_E_43996_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_44100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_44100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_44100
	jmp LB_44101
LB_44100:
	jmp NS_E_43996_MTC_0_failed
LB_44101:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_43997_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44105
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44106
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44106:
	jmp NS_E_43996_MTC_0_failed
LB_44105:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_43996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44111
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44112
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44112:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44113
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44113:
	jmp NS_E_43996_MTC_0_failed
LB_44111:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44093
	btr r12,2
	jmp LB_44094
LB_44093:
	bts r12,2
LB_44094:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44091
	btr r12,1
	jmp LB_44092
LB_44091:
	bts r12,1
LB_44092:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44089
	btr r12,0
	jmp LB_44090
LB_44089:
	bts r12,0
LB_44090:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44086
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_44115
	btr r12,3
	jmp LB_44116
LB_44115:
	bts r12,3
LB_44116:
	mov r13,r14
	bt r12,1
	jc LB_44117
	btr r12,0
	jmp LB_44118
LB_44117:
	bts r12,0
LB_44118:
	mov r10,r8
	bt r12,2
	jc LB_44119
	btr r12,4
	jmp LB_44120
LB_44119:
	bts r12,4
LB_44120:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_44123
	btr r12,5
	jmp LB_44124
LB_44123:
	bts r12,5
LB_44124:
	mov r14,r11
	bt r12,5
	jc LB_44121
	btr r12,1
	jmp LB_44122
LB_44121:
	bts r12,1
LB_44122:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_44127
	btr r12,5
	jmp LB_44128
LB_44127:
	bts r12,5
LB_44128:
	mov r8,r11
	bt r12,5
	jc LB_44125
	btr r12,2
	jmp LB_44126
LB_44125:
	bts r12,2
LB_44126:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_44002 : %_44002
 ; {>  %_43999~0':_r64 %_44001~2':(_lst)◂(_p43993) %_44000~1':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_44002
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_44002 %_43999 } ⊢ { %_44003 %_44004 } : { %_44003 %_44004 }
 ; {>  %_43999~0':_r64 %_44002~3':_r64 %_44001~2':(_lst)◂(_p43993) %_44000~1':_r64 }
	add r9,r13
; _f43994 %_44003 ⊢ %_44005 : %_44005
 ; {>  %_44001~2':(_lst)◂(_p43993) %_44004~0':_r64 %_44003~3':_r64 %_44000~1':_r64 }
; _f43994 3' ⊢ °0◂3'
; _cns { %_44005 %_44001 } ⊢ %_44006 : %_44006
 ; {>  %_44001~2':(_lst)◂(_p43993) %_44005~°0◂3':_p43993 %_44004~0':_r64 %_44000~1':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_44000 %_44006 } ⊢ %_44007 : %_44007
 ; {>  %_44004~0':_r64 %_44006~°0◂{ °0◂3' 2' }:(_lst)◂(_p43993) %_44000~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_44007
 ; {>  %_44007~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p43993) }) %_44004~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_44065
	mov rdi,r13
	call dlt
LB_44065:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_44066
	btr r12,0
	jmp LB_44067
LB_44066:
	bts r12,0
LB_44067:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_44070
	btr r12,4
	jmp LB_44071
LB_44070:
	bts r12,4
LB_44071:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_44068
	btr QWORD [rdi],0
	jmp LB_44069
LB_44068:
	bts QWORD [rdi],0
LB_44069:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_44080
	btr r12,1
	jmp LB_44081
LB_44080:
	bts r12,1
LB_44081:
	mov rsi,1
	bt r12,1
	jc LB_44078
	mov rsi,0
	bt r14,0
	jc LB_44078
	jmp LB_44079
LB_44078:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_44079:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_44076
	btr QWORD [rdi],0
	jmp LB_44077
LB_44076:
	bts QWORD [rdi],0
LB_44077:
	mov r14,r8
	bt r12,2
	jc LB_44084
	btr r12,1
	jmp LB_44085
LB_44084:
	bts r12,1
LB_44085:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_44082
	btr QWORD [rdi],1
	jmp LB_44083
LB_44082:
	bts QWORD [rdi],1
LB_44083:
	mov rsi,1
	bt r12,4
	jc LB_44074
	mov rsi,0
	bt r10,0
	jc LB_44074
	jmp LB_44075
LB_44074:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_44075:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_44072
	btr QWORD [rdi],1
	jmp LB_44073
LB_44072:
	bts QWORD [rdi],1
LB_44073:
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
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44087
LB_44088:
	add rsp,8
	ret
NS_E_43996_MTC_0_failed:
	add rsp,48
	pop r14
LB_44087:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_44164
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_44164
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_44164
	jmp LB_44165
LB_44164:
	jmp NS_E_43996_MTC_1_failed
LB_44165:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_43998_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44169
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44170
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44170:
	jmp NS_E_43996_MTC_1_failed
LB_44169:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_43996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44175
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44176
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44176:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44177:
	jmp NS_E_43996_MTC_1_failed
LB_44175:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44157
	btr r12,2
	jmp LB_44158
LB_44157:
	bts r12,2
LB_44158:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44155
	btr r12,1
	jmp LB_44156
LB_44155:
	bts r12,1
LB_44156:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44153
	btr r12,0
	jmp LB_44154
LB_44153:
	bts r12,0
LB_44154:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44150
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_44179
	btr r12,3
	jmp LB_44180
LB_44179:
	bts r12,3
LB_44180:
	mov r13,r14
	bt r12,1
	jc LB_44181
	btr r12,0
	jmp LB_44182
LB_44181:
	bts r12,0
LB_44182:
	mov r10,r8
	bt r12,2
	jc LB_44183
	btr r12,4
	jmp LB_44184
LB_44183:
	bts r12,4
LB_44184:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_44187
	btr r12,5
	jmp LB_44188
LB_44187:
	bts r12,5
LB_44188:
	mov r14,r11
	bt r12,5
	jc LB_44185
	btr r12,1
	jmp LB_44186
LB_44185:
	bts r12,1
LB_44186:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_44191
	btr r12,5
	jmp LB_44192
LB_44191:
	bts r12,5
LB_44192:
	mov r8,r11
	bt r12,5
	jc LB_44189
	btr r12,2
	jmp LB_44190
LB_44189:
	bts r12,2
LB_44190:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_44011 : %_44011
 ; {>  %_44010~2':(_lst)◂(_p43993) %_44009~1':_r64 %_44008~0':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_44011
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_44011 %_44008 } ⊢ { %_44012 %_44013 } : { %_44012 %_44013 }
 ; {>  %_44011~3':_r64 %_44010~2':(_lst)◂(_p43993) %_44009~1':_r64 %_44008~0':_r64 }
	add r9,r13
; _f43994 %_44012 ⊢ %_44014 : %_44014
 ; {>  %_44010~2':(_lst)◂(_p43993) %_44013~0':_r64 %_44012~3':_r64 %_44009~1':_r64 }
; _f43994 3' ⊢ °0◂3'
; _cns { %_44014 %_44010 } ⊢ %_44015 : %_44015
 ; {>  %_44010~2':(_lst)◂(_p43993) %_44014~°0◂3':_p43993 %_44013~0':_r64 %_44009~1':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_44009 %_44015 } ⊢ %_44016 : %_44016
 ; {>  %_44015~°0◂{ °0◂3' 2' }:(_lst)◂(_p43993) %_44013~0':_r64 %_44009~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_44016
 ; {>  %_44013~0':_r64 %_44016~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p43993) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_44129
	mov rdi,r13
	call dlt
LB_44129:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_44130
	btr r12,0
	jmp LB_44131
LB_44130:
	bts r12,0
LB_44131:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_44134
	btr r12,4
	jmp LB_44135
LB_44134:
	bts r12,4
LB_44135:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_44132
	btr QWORD [rdi],0
	jmp LB_44133
LB_44132:
	bts QWORD [rdi],0
LB_44133:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_44144
	btr r12,1
	jmp LB_44145
LB_44144:
	bts r12,1
LB_44145:
	mov rsi,1
	bt r12,1
	jc LB_44142
	mov rsi,0
	bt r14,0
	jc LB_44142
	jmp LB_44143
LB_44142:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_44143:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_44140
	btr QWORD [rdi],0
	jmp LB_44141
LB_44140:
	bts QWORD [rdi],0
LB_44141:
	mov r14,r8
	bt r12,2
	jc LB_44148
	btr r12,1
	jmp LB_44149
LB_44148:
	bts r12,1
LB_44149:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_44146
	btr QWORD [rdi],1
	jmp LB_44147
LB_44146:
	bts QWORD [rdi],1
LB_44147:
	mov rsi,1
	bt r12,4
	jc LB_44138
	mov rsi,0
	bt r10,0
	jc LB_44138
	jmp LB_44139
LB_44138:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_44139:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_44136
	btr QWORD [rdi],1
	jmp LB_44137
LB_44136:
	bts QWORD [rdi],1
LB_44137:
	mov r8,0
	bts r12,2
	ret
LB_44150:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44152
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44151
LB_44152:
	add rsp,8
	ret
NS_E_43996_MTC_1_failed:
	add rsp,48
	pop r14
LB_44151:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44267
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43996_MTC_2_failed
LB_44267:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_43996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44272
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44273
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44273:
	jmp NS_E_43996_MTC_2_failed
LB_44272:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44262
	btr r12,1
	jmp LB_44263
LB_44262:
	bts r12,1
LB_44263:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44260
	btr r12,0
	jmp LB_44261
LB_44260:
	bts r12,0
LB_44261:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44257
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_44275
	btr r12,3
	jmp LB_44276
LB_44275:
	bts r12,3
LB_44276:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_44279
	btr r12,4
	jmp LB_44280
LB_44279:
	bts r12,4
LB_44280:
	mov r14,r10
	bt r12,4
	jc LB_44277
	btr r12,1
	jmp LB_44278
LB_44277:
	bts r12,1
LB_44278:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_44283
	btr r12,4
	jmp LB_44284
LB_44283:
	bts r12,4
LB_44284:
	mov r8,r10
	bt r12,4
	jc LB_44281
	btr r12,2
	jmp LB_44282
LB_44281:
	bts r12,2
LB_44282:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_44193:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_44194
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
	jnc LB_44195
	bt QWORD [rax],0
	jc LB_44196
	btr r12,5
	jmp LB_44197
LB_44196:
	bts r12,5
LB_44197:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_44195:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_44200
	btr r12,6
	jmp LB_44201
LB_44200:
	bts r12,6
LB_44201:
	mov r9,rcx
	bt r12,6
	jc LB_44198
	btr r12,3
	jmp LB_44199
LB_44198:
	bts r12,3
LB_44199:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_44204
	btr r12,6
	jmp LB_44205
LB_44204:
	bts r12,6
LB_44205:
	mov r10,rcx
	bt r12,6
	jc LB_44202
	btr r12,4
	jmp LB_44203
LB_44202:
	bts r12,4
LB_44203:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_44194
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_44206
	bt QWORD [rax],0
	jc LB_44207
	btr r12,6
	jmp LB_44208
LB_44207:
	bts r12,6
LB_44208:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_44206:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_44209
	btr r12,5
	jmp LB_44210
LB_44209:
	bts r12,5
LB_44210:
LB_44211:
	cmp r15,0
	jz LB_44212
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44211
LB_44212:
; » 0xr1 |~ {  } ⊢ %_44023 : %_44023
 ; {>  %_44018~1':_r64 %_44022~5':_r64 %_44021~4':(_lst)◂(_p43993) %_44017~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_44023
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_44022 %_44023 } ⊢ { %_44024 %_44025 } : { %_44024 %_44025 }
 ; {>  %_44018~1':_r64 %_44023~2':_r64 %_44022~5':_r64 %_44021~4':(_lst)◂(_p43993) %_44017~0':_r64 }
	add r11,r8
; _f34 { %_44018 %_44025 } ⊢ { %_44026 %_44027 } : { %_44026 %_44027 }
 ; {>  %_44018~1':_r64 %_44025~2':_r64 %_44024~5':_r64 %_44021~4':(_lst)◂(_p43993) %_44017~0':_r64 }
	add r14,r8
; _f43995 %_44024 ⊢ %_44028 : %_44028
 ; {>  %_44026~1':_r64 %_44024~5':_r64 %_44021~4':(_lst)◂(_p43993) %_44027~2':_r64 %_44017~0':_r64 }
; _f43995 5' ⊢ °1◂5'
; _cns { %_44028 %_44021 } ⊢ %_44029 : %_44029
 ; {>  %_44026~1':_r64 %_44028~°1◂5':_p43993 %_44021~4':(_lst)◂(_p43993) %_44027~2':_r64 %_44017~0':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_44026 %_44029 } ⊢ %_44030 : %_44030
 ; {>  %_44029~°0◂{ °1◂5' 4' }:(_lst)◂(_p43993) %_44026~1':_r64 %_44027~2':_r64 %_44017~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_44030
 ; {>  %_44030~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p43993) }) %_44027~2':_r64 %_44017~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,2
	jc LB_44213
	mov rdi,r8
	call dlt
LB_44213:
	bt r12,0
	jc LB_44214
	mov rdi,r13
	call dlt
LB_44214:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_44217
	btr r12,0
	jmp LB_44218
LB_44217:
	bts r12,0
LB_44218:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_44215
	btr QWORD [rdi],0
	jmp LB_44216
LB_44215:
	bts QWORD [rdi],0
LB_44216:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_44227
	btr r12,1
	jmp LB_44228
LB_44227:
	bts r12,1
LB_44228:
	mov rsi,1
	bt r12,1
	jc LB_44225
	mov rsi,0
	bt r14,0
	jc LB_44225
	jmp LB_44226
LB_44225:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_44226:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_44223
	btr QWORD [rdi],0
	jmp LB_44224
LB_44223:
	bts QWORD [rdi],0
LB_44224:
	mov r14,r10
	bt r12,4
	jc LB_44231
	btr r12,1
	jmp LB_44232
LB_44231:
	bts r12,1
LB_44232:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_44229
	btr QWORD [rdi],1
	jmp LB_44230
LB_44229:
	bts QWORD [rdi],1
LB_44230:
	mov rsi,1
	bt r12,0
	jc LB_44221
	mov rsi,0
	bt r13,0
	jc LB_44221
	jmp LB_44222
LB_44221:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_44222:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_44219
	btr QWORD [rdi],1
	jmp LB_44220
LB_44219:
	bts QWORD [rdi],1
LB_44220:
	mov r8,0
	bts r12,2
	ret
MTC_LB_44194:
	mov r15,0
LB_44234:
	cmp r15,0
	jz LB_44235
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44234
LB_44235:
; » 0xr1 |~ {  } ⊢ %_44031 : %_44031
 ; {>  %_44018~1':_r64 %_44019~2':(_lst)◂(_p43993) %_44017~0':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_44031
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_44018 %_44031 } ⊢ { %_44032 %_44033 } : { %_44032 %_44033 }
 ; {>  %_44018~1':_r64 %_44019~2':(_lst)◂(_p43993) %_44031~3':_r64 %_44017~0':_r64 }
	add r14,r9
; _f43995 %_44033 ⊢ %_44034 : %_44034
 ; {>  %_44033~3':_r64 %_44019~2':(_lst)◂(_p43993) %_44032~1':_r64 %_44017~0':_r64 }
; _f43995 3' ⊢ °1◂3'
; _cns { %_44034 %_44019 } ⊢ %_44035 : %_44035
 ; {>  %_44034~°1◂3':_p43993 %_44019~2':(_lst)◂(_p43993) %_44032~1':_r64 %_44017~0':_r64 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_44032 %_44035 } ⊢ %_44036 : %_44036
 ; {>  %_44035~°0◂{ °1◂3' 2' }:(_lst)◂(_p43993) %_44032~1':_r64 %_44017~0':_r64 }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_44036
 ; {>  %_44036~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p43993) }) %_44017~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_44236
	mov rdi,r13
	call dlt
LB_44236:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_44237
	btr r12,0
	jmp LB_44238
LB_44237:
	bts r12,0
LB_44238:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_44241
	btr r12,4
	jmp LB_44242
LB_44241:
	bts r12,4
LB_44242:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_44239
	btr QWORD [rdi],0
	jmp LB_44240
LB_44239:
	bts QWORD [rdi],0
LB_44240:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_44251
	btr r12,1
	jmp LB_44252
LB_44251:
	bts r12,1
LB_44252:
	mov rsi,1
	bt r12,1
	jc LB_44249
	mov rsi,0
	bt r14,0
	jc LB_44249
	jmp LB_44250
LB_44249:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_44250:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_44247
	btr QWORD [rdi],0
	jmp LB_44248
LB_44247:
	bts QWORD [rdi],0
LB_44248:
	mov r14,r8
	bt r12,2
	jc LB_44255
	btr r12,1
	jmp LB_44256
LB_44255:
	bts r12,1
LB_44256:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_44253
	btr QWORD [rdi],1
	jmp LB_44254
LB_44253:
	bts QWORD [rdi],1
LB_44254:
	mov rsi,1
	bt r12,4
	jc LB_44245
	mov rsi,0
	bt r10,0
	jc LB_44245
	jmp LB_44246
LB_44245:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_44246:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_44243
	btr QWORD [rdi],1
	jmp LB_44244
LB_44243:
	bts QWORD [rdi],1
LB_44244:
	mov r8,0
	bts r12,2
	ret
MTC_LB_44233:
LB_44257:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44259
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44258
LB_44259:
	add rsp,8
	ret
NS_E_43996_MTC_2_failed:
	add rsp,32
	pop r14
LB_44258:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_44294
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_44037
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _nil {  } ⊢ %_44038 : %_44038
 ; {>  %_44037~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_44039 : %_44039
 ; {>  %_44038~°1◂{  }:(_lst)◂(t8056'(0)) %_44037~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_44039
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_44039 %_44038 } ⊢ %_44040 : %_44040
 ; {>  %_44039~1':_r64 %_44038~°1◂{  }:(_lst)◂(t8056'(0)) %_44037~0':_stg }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_44040
 ; {>  %_44040~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t8060'(0)) }) %_44037~0':_stg }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_44285
	mov rdi,r13
	call dlt
LB_44285:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_44288
	btr r12,0
	jmp LB_44289
LB_44288:
	bts r12,0
LB_44289:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_44286
	btr QWORD [rdi],0
	jmp LB_44287
LB_44286:
	bts QWORD [rdi],0
LB_44287:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_44292
	mov rsi,0
	bt r13,0
	jc LB_44292
	jmp LB_44293
LB_44292:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_44293:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_44290
	btr QWORD [rdi],1
	jmp LB_44291
LB_44290:
	bts QWORD [rdi],1
LB_44291:
	mov r8,0
	bts r12,2
	ret
LB_44294:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44296
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44295
LB_44296:
	add rsp,8
	ret
NS_E_43996_MTC_3_failed:
	add rsp,0
	pop r14
LB_44295:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43997:
NS_E_RDI_43997:
NS_E_43997_ETR_TBL:
NS_E_43997_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_44309
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_44309
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_44309
	jmp LB_44310
LB_44309:
	jmp NS_E_43997_MTC_0_failed
LB_44310:
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
	jc LB_44302
	btr r12,0
	jmp LB_44303
LB_44302:
	bts r12,0
LB_44303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44299
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_44041 : %_44041
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_44041
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_44041 ⊢ %_44042 : %_44042
 ; {>  %_44041~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_44042
 ; {>  %_44042~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44297
	btr r12,3
	jmp LB_44298
LB_44297:
	bts r12,3
LB_44298:
	mov r8,0
	bts r12,2
	ret
LB_44299:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44301
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44300
LB_44301:
	add rsp,8
	ret
NS_E_43997_MTC_0_failed:
	add rsp,16
	pop r14
LB_44300:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_44329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_44329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_44329
	jmp LB_44330
LB_44329:
	jmp NS_E_43997_MTC_1_failed
LB_44330:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_43997_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44334
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44335:
	jmp NS_E_43997_MTC_1_failed
LB_44334:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_43997_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44340
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44341
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44341:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44342
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44342:
	jmp NS_E_43997_MTC_1_failed
LB_44340:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44322
	btr r12,2
	jmp LB_44323
LB_44322:
	bts r12,2
LB_44323:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44320
	btr r12,1
	jmp LB_44321
LB_44320:
	bts r12,1
LB_44321:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44318
	btr r12,0
	jmp LB_44319
LB_44318:
	bts r12,0
LB_44319:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_44315
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_44344
	btr r12,3
	jmp LB_44345
LB_44344:
	bts r12,3
LB_44345:
	mov r14,r8
	bt r12,2
	jc LB_44346
	btr r12,1
	jmp LB_44347
LB_44346:
	bts r12,1
LB_44347:
	mov r8,r13
	bt r12,0
	jc LB_44348
	btr r12,2
	jmp LB_44349
LB_44348:
	bts r12,2
LB_44349:
	mov r13,r9
	bt r12,3
	jc LB_44350
	btr r12,0
	jmp LB_44351
LB_44350:
	bts r12,0
LB_44351:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_44045 : %_44045
 ; {>  %_44044~1':_r64 %_44043~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_44045
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_44045 %_44043 } ⊢ { %_44046 %_44047 } : { %_44046 %_44047 }
 ; {>  %_44045~2':_r64 %_44044~1':_r64 %_44043~0':_r64 }
	add r8,r13
; _f34 { %_44046 %_44044 } ⊢ { %_44048 %_44049 } : { %_44048 %_44049 }
 ; {>  %_44044~1':_r64 %_44046~2':_r64 %_44047~0':_r64 }
	add r8,r14
; _some %_44048 ⊢ %_44050 : %_44050
 ; {>  %_44047~0':_r64 %_44049~1':_r64 %_44048~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_44050
 ; {>  %_44047~0':_r64 %_44049~1':_r64 %_44050~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_44311
	mov rdi,r13
	call dlt
LB_44311:
	bt r12,1
	jc LB_44312
	mov rdi,r14
	call dlt
LB_44312:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_44313
	btr r12,3
	jmp LB_44314
LB_44313:
	bts r12,3
LB_44314:
	mov r8,0
	bts r12,2
	ret
LB_44315:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44317
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44316
LB_44317:
	add rsp,8
	ret
NS_E_43997_MTC_1_failed:
	add rsp,48
	pop r14
LB_44316:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44366
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43997_MTC_2_failed
LB_44366:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_43997_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44371
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44372
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44372:
	jmp NS_E_43997_MTC_2_failed
LB_44371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44361
	btr r12,1
	jmp LB_44362
LB_44361:
	bts r12,1
LB_44362:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44359
	btr r12,0
	jmp LB_44360
LB_44359:
	bts r12,0
LB_44360:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44356
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_44053 : %_44053
 ; {>  %_44052~1':_r64 %_44051~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_44053
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_44053 %_44052 } ⊢ { %_44054 %_44055 } : { %_44054 %_44055 }
 ; {>  %_44053~2':_r64 %_44052~1':_r64 %_44051~0':_r64 }
	add r8,r14
; _some %_44054 ⊢ %_44056 : %_44056
 ; {>  %_44054~2':_r64 %_44055~1':_r64 %_44051~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_44056
 ; {>  %_44055~1':_r64 %_44056~°0◂2':(_opn)◂(_r64) %_44051~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_44352
	mov rdi,r14
	call dlt
LB_44352:
	bt r12,0
	jc LB_44353
	mov rdi,r13
	call dlt
LB_44353:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_44354
	btr r12,3
	jmp LB_44355
LB_44354:
	bts r12,3
LB_44355:
	mov r8,0
	bts r12,2
	ret
LB_44356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44358
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44357
LB_44358:
	add rsp,8
	ret
NS_E_43997_MTC_2_failed:
	add rsp,32
	pop r14
LB_44357:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_43998:
NS_E_RDI_43998:
NS_E_43998_ETR_TBL:
NS_E_43998_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_44386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_44386
	jmp LB_44387
LB_44386:
	jmp NS_E_43998_MTC_0_failed
LB_44387:
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
	jc LB_44379
	btr r12,0
	jmp LB_44380
LB_44379:
	bts r12,0
LB_44380:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_44376
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_44057 : %_44057
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_44057
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_44057 ⊢ %_44058 : %_44058
 ; {>  %_44057~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_44058
 ; {>  %_44058~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_44374
	btr r12,3
	jmp LB_44375
LB_44374:
	bts r12,3
LB_44375:
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
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44377
LB_44378:
	add rsp,8
	ret
NS_E_43998_MTC_0_failed:
	add rsp,16
	pop r14
LB_44377:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44402
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_43998_MTC_1_failed
LB_44402:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_43998_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44407
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44408
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44408:
	jmp NS_E_43998_MTC_1_failed
LB_44407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44397
	btr r12,1
	jmp LB_44398
LB_44397:
	bts r12,1
LB_44398:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44395
	btr r12,0
	jmp LB_44396
LB_44395:
	bts r12,0
LB_44396:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_44392
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_44061 : %_44061
 ; {>  %_44060~1':_r64 %_44059~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_44061
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_44061 %_44060 } ⊢ { %_44062 %_44063 } : { %_44062 %_44063 }
 ; {>  %_44061~2':_r64 %_44060~1':_r64 %_44059~0':_r64 }
	add r8,r14
; _some %_44062 ⊢ %_44064 : %_44064
 ; {>  %_44062~2':_r64 %_44063~1':_r64 %_44059~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_44064
 ; {>  %_44063~1':_r64 %_44064~°0◂2':(_opn)◂(_r64) %_44059~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_44388
	mov rdi,r14
	call dlt
LB_44388:
	bt r12,0
	jc LB_44389
	mov rdi,r13
	call dlt
LB_44389:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_44390
	btr r12,3
	jmp LB_44391
LB_44390:
	bts r12,3
LB_44391:
	mov r8,0
	bts r12,2
	ret
LB_44392:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_44394
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_44393
LB_44394:
	add rsp,8
	ret
NS_E_43998_MTC_1_failed:
	add rsp,32
	pop r14
LB_44393:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44432:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_44432:
MTC_LB_44433:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_44434
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_44435
	bt QWORD [rax],0
	jc LB_44436
	btr r12,7
	jmp LB_44437
LB_44436:
	bts r12,7
LB_44437:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_44435:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_44440
	btr r12,8
	jmp LB_44441
LB_44440:
	bts r12,8
LB_44441:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_44438
	btr r12,5
	jmp LB_44439
LB_44438:
	bts r12,5
LB_44439:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_44444
	btr r12,8
	jmp LB_44445
LB_44444:
	bts r12,8
LB_44445:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_44442
	btr r12,6
	jmp LB_44443
LB_44442:
	bts r12,6
LB_44443:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_44446:
	cmp r15,0
	jz LB_44447
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44446
LB_44447:
MTC_LB_44448:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_44449
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_44450
	bt QWORD [rax],0
	jc LB_44451
	btr r12,7
	jmp LB_44452
LB_44451:
	bts r12,7
LB_44452:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_44450:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_44453
	btr r12,4
	jmp LB_44454
LB_44453:
	bts r12,4
LB_44454:
LB_44455:
	cmp r15,0
	jz LB_44456
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44455
LB_44456:
; _f36 %_44417 ⊢ { %_44418 %_44419 } : { %_44418 %_44419 }
 ; {>  %_44417~4':_r64 %_44413~3':_r64 %_44412~2':_stg %_44410~0':_stg %_44416~6':(_lst)◂(_p43993) %_44411~1':_r64 }
	mov r11,r10
	bts r12,5
; _f18 { %_44419 %_44410 %_44411 %_44412 %_44413 } ⊢ { %_44420 %_44421 %_44422 %_44423 %_44424 } : { %_44420 %_44421 %_44422 %_44423 %_44424 }
 ; {>  %_44413~3':_r64 %_44419~5':_r64 %_44412~2':_stg %_44410~0':_stg %_44416~6':(_lst)◂(_p43993) %_44411~1':_r64 %_44418~4':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_44461
	btr r12,4
	jmp LB_44462
LB_44461:
	bts r12,4
LB_44462:
	mov r9,r8
	bt r12,2
	jc LB_44463
	btr r12,3
	jmp LB_44464
LB_44463:
	bts r12,3
LB_44464:
	mov r8,r14
	bt r12,1
	jc LB_44465
	btr r12,2
	jmp LB_44466
LB_44465:
	bts r12,2
LB_44466:
	mov r14,r13
	bt r12,0
	jc LB_44467
	btr r12,1
	jmp LB_44468
LB_44467:
	bts r12,1
LB_44468:
	mov r13,r11
	bt r12,5
	jc LB_44469
	btr r12,0
	jmp LB_44470
LB_44469:
	bts r12,0
LB_44470:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_44471
	btr r12,5
	jmp LB_44472
LB_44471:
	bts r12,5
LB_44472:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_44459
	btr r12,6
	jmp LB_44460
LB_44459:
	bts r12,6
LB_44460:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_44457
	btr r12,4
	jmp LB_44458
LB_44457:
	bts r12,4
LB_44458:
	add rsp,24
; _f44432 { %_44421 %_44422 %_44423 %_44424 %_44416 } ⊢ { %_44425 %_44426 } : { %_44425 %_44426 }
 ; {>  %_44420~0':_r64 %_44424~5':_r64 %_44421~1':_stg %_44416~6':(_lst)◂(_p43993) %_44423~3':_stg %_44422~2':_r64 %_44418~4':_r64 }
; _f44432 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_44477
	btr r12,0
	jmp LB_44478
LB_44477:
	bts r12,0
LB_44478:
	mov r14,r8
	bt r12,2
	jc LB_44479
	btr r12,1
	jmp LB_44480
LB_44479:
	bts r12,1
LB_44480:
	mov r8,r9
	bt r12,3
	jc LB_44481
	btr r12,2
	jmp LB_44482
LB_44481:
	bts r12,2
LB_44482:
	mov r9,r11
	bt r12,5
	jc LB_44483
	btr r12,3
	jmp LB_44484
LB_44483:
	bts r12,3
LB_44484:
	mov r10,rcx
	bt r12,6
	jc LB_44485
	btr r12,4
	jmp LB_44486
LB_44485:
	bts r12,4
LB_44486:
	call NS_E_44432
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_44487
	btr r12,2
	jmp LB_44488
LB_44487:
	bts r12,2
LB_44488:
	mov r14,r13
	bt r12,0
	jc LB_44489
	btr r12,1
	jmp LB_44490
LB_44489:
	bts r12,1
LB_44490:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_44475
	btr r12,4
	jmp LB_44476
LB_44475:
	bts r12,4
LB_44476:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_44473
	btr r12,0
	jmp LB_44474
LB_44473:
	bts r12,0
LB_44474:
	add rsp,24
; ∎ { %_44425 %_44426 }
 ; {>  %_44420~0':_r64 %_44418~4':_r64 %_44426~2':_stg %_44425~1':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_44491
	mov rdi,r13
	call dlt
LB_44491:
	bt r12,4
	jc LB_44492
	mov rdi,r10
	call dlt
LB_44492:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_44493
	btr r12,0
	jmp LB_44494
LB_44493:
	bts r12,0
LB_44494:
	mov r14,r8
	bt r12,2
	jc LB_44495
	btr r12,1
	jmp LB_44496
LB_44495:
	bts r12,1
LB_44496:
	ret
MTC_LB_44449:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_44497
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_44498
	bt QWORD [rax],0
	jc LB_44499
	btr r12,7
	jmp LB_44500
LB_44499:
	bts r12,7
LB_44500:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_44498:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_44501
	btr r12,4
	jmp LB_44502
LB_44501:
	bts r12,4
LB_44502:
LB_44503:
	cmp r15,0
	jz LB_44504
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44503
LB_44504:
; _f34 { %_44411 %_44427 } ⊢ { %_44428 %_44429 } : { %_44428 %_44429 }
 ; {>  %_44413~3':_r64 %_44412~2':_stg %_44410~0':_stg %_44416~6':(_lst)◂(_p43993) %_44427~4':_r64 %_44411~1':_r64 }
	add r14,r10
; _f44432 { %_44410 %_44428 %_44412 %_44413 %_44416 } ⊢ { %_44430 %_44431 } : { %_44430 %_44431 }
 ; {>  %_44428~1':_r64 %_44413~3':_r64 %_44412~2':_stg %_44410~0':_stg %_44429~4':_r64 %_44416~6':(_lst)◂(_p43993) }
; _f44432 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_44507
	btr r12,4
	jmp LB_44508
LB_44507:
	bts r12,4
LB_44508:
	call NS_E_44432
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_44505
	btr r12,4
	jmp LB_44506
LB_44505:
	bts r12,4
LB_44506:
	add rsp,16
; ∎ { %_44430 %_44431 }
 ; {>  %_44430~0':_stg %_44431~1':_stg %_44429~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_44509
	mov rdi,r10
	call dlt
LB_44509:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_44497:
MTC_LB_44434:
	mov r15,0
LB_44511:
	cmp r15,0
	jz LB_44512
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44511
LB_44512:
; ∎ { %_44410 %_44412 }
 ; {>  %_44413~3':_r64 %_44412~2':_stg %_44410~0':_stg %_44414~4':(_lst)◂(_p43993) %_44411~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_44513
	mov rdi,r9
	call dlt
LB_44513:
	bt r12,4
	jc LB_44514
	mov rdi,r10
	call dlt
LB_44514:
	bt r12,1
	jc LB_44515
	mov rdi,r14
	call dlt
LB_44515:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_44516
	btr r12,1
	jmp LB_44517
LB_44516:
	bts r12,1
LB_44517:
	ret
MTC_LB_44510:
NS_E_44533:
; 	|» 0'
NS_E_RDI_44533:
; » 0xr0 |~ {  } ⊢ %_44519 : %_44519
 ; {>  %_44518~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_44519
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f43996 { %_44518 %_44519 } ⊢ { %_44520 %_44521 %_44522 } : { %_44520 %_44521 %_44522 }
 ; {>  %_44519~1':_r64 %_44518~0':_stg }
; _f43996 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_43996
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_44534
	btr r12,4
	jmp LB_44535
LB_44534:
	bts r12,4
LB_44535:
	mov r8,r9
	bt r12,3
	jc LB_44538
	btr r12,2
	jmp LB_44539
LB_44538:
	bts r12,2
LB_44539:
	mov rsi,1
	bt r12,2
	jc LB_44536
	mov rsi,0
	bt r8,0
	jc LB_44536
	jmp LB_44537
LB_44536:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_44537:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_44540:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_44541
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
	jnc LB_44542
	bt QWORD [rax],0
	jc LB_44543
	btr r12,5
	jmp LB_44544
LB_44543:
	bts r12,5
LB_44544:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_44542:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_44547
	btr r12,6
	jmp LB_44548
LB_44547:
	bts r12,6
LB_44548:
	mov r9,rcx
	bt r12,6
	jc LB_44545
	btr r12,3
	jmp LB_44546
LB_44545:
	bts r12,3
LB_44546:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_44551
	btr r12,6
	jmp LB_44552
LB_44551:
	bts r12,6
LB_44552:
	mov r10,rcx
	bt r12,6
	jc LB_44549
	btr r12,4
	jmp LB_44550
LB_44549:
	bts r12,4
LB_44550:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_44553:
	cmp r15,0
	jz LB_44554
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44553
LB_44554:
; _f14 %_44523 ⊢ { %_44525 %_44526 } : { %_44525 %_44526 }
 ; {>  %_44521~1':_r64 %_44524~4':(_lst)◂(_p43993) %_44523~3':_r64 %_44520~0':_stg }
; _f14 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_44561
	btr r12,0
	jmp LB_44562
LB_44561:
	bts r12,0
LB_44562:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_44563
	btr r12,2
	jmp LB_44564
LB_44563:
	bts r12,2
LB_44564:
	mov r9,r14
	bt r12,1
	jc LB_44565
	btr r12,3
	jmp LB_44566
LB_44565:
	bts r12,3
LB_44566:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_44559
	btr r12,4
	jmp LB_44560
LB_44559:
	bts r12,4
LB_44560:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_44557
	btr r12,1
	jmp LB_44558
LB_44557:
	bts r12,1
LB_44558:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_44555
	btr r12,0
	jmp LB_44556
LB_44555:
	bts r12,0
LB_44556:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_44527 : %_44527
 ; {>  %_44526~3':_stg %_44521~1':_r64 %_44524~4':(_lst)◂(_p43993) %_44525~2':_r64 %_44520~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_44527
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_44528 : %_44528
 ; {>  %_44526~3':_stg %_44521~1':_r64 %_44527~5':_r64 %_44524~4':(_lst)◂(_p43993) %_44525~2':_r64 %_44520~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_44528
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f44432 { %_44520 %_44527 %_44526 %_44528 %_44524 } ⊢ { %_44529 %_44530 } : { %_44529 %_44530 }
 ; {>  %_44526~3':_stg %_44521~1':_r64 %_44527~5':_r64 %_44524~4':(_lst)◂(_p43993) %_44525~2':_r64 %_44528~6':_r64 %_44520~0':_stg }
; _f44432 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_44571
	btr r12,1
	jmp LB_44572
LB_44571:
	bts r12,1
LB_44572:
	mov r8,r9
	bt r12,3
	jc LB_44573
	btr r12,2
	jmp LB_44574
LB_44573:
	bts r12,2
LB_44574:
	mov r9,rcx
	bt r12,6
	jc LB_44575
	btr r12,3
	jmp LB_44576
LB_44575:
	bts r12,3
LB_44576:
	call NS_E_44432
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_44577
	btr r12,3
	jmp LB_44578
LB_44577:
	bts r12,3
LB_44578:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_44569
	btr r12,2
	jmp LB_44570
LB_44569:
	bts r12,2
LB_44570:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_44567
	btr r12,1
	jmp LB_44568
LB_44567:
	bts r12,1
LB_44568:
	add rsp,24
; _some %_44530 ⊢ %_44531 : %_44531
 ; {>  %_44521~1':_r64 %_44529~0':_stg %_44530~3':_stg %_44525~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_44529 %_44531 }
 ; {>  %_44521~1':_r64 %_44529~0':_stg %_44525~2':_r64 %_44531~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_44579
	mov rdi,r14
	call dlt
LB_44579:
	bt r12,2
	jc LB_44580
	mov rdi,r8
	call dlt
LB_44580:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_44583
	btr r12,1
	jmp LB_44584
LB_44583:
	bts r12,1
LB_44584:
	mov rsi,1
	bt r12,1
	jc LB_44581
	mov rsi,0
	bt r14,0
	jc LB_44581
	jmp LB_44582
LB_44581:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_44582:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_44541:
	mov r15,0
LB_44586:
	cmp r15,0
	jz LB_44587
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_44586
LB_44587:
; _none {  } ⊢ %_44532 : %_44532
 ; {>  %_44521~1':_r64 %_44522~2':(_opn)◂({ _r64 (_lst)◂(_p43993) }) %_44520~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_44520 %_44532 }
 ; {>  %_44532~°1◂{  }:(_opn)◂(t8220'(0)) %_44521~1':_r64 %_44522~2':(_opn)◂({ _r64 (_lst)◂(_p43993) }) %_44520~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_44588
	mov rdi,r14
	call dlt
LB_44588:
	bt r12,2
	jc LB_44589
	mov rdi,r8
	call dlt
LB_44589:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_44590
	mov rsi,0
	bt r14,0
	jc LB_44590
	jmp LB_44591
LB_44590:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_44591:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_44585:
NS_E_44597:
NS_E_RDI_44597:
; » _^ ..
	mov rax,51
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "##\n"
	mov rsi,0x_23
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "W"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "[# fdEF [# F #] jfioe 2 #]"
	mov rsi,0x_20_46_45_64_66_20_23_5b
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20_5d_23_20_46_20_23_5b
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_20_32_20_65_6f_69_66_6a
	mov QWORD [rdi+8*2],rsi
	mov rsi,0x_23
	mov BYTE [rdi+8*3+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*3+1],sil
	add rdi,26
; "FF## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_75_68_20_23_23_46_46
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_75_67_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+2],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+4],sil
	add rdi,21
; //
	mov r13,rax
	btr r12,0
; _f44533 %_44592 ⊢ { %_44593 %_44594 } : { %_44593 %_44594 }
 ; {>  %_44592~0':_stg }
; _f44533 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_44533
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_44593 %_44594 } ⊢ { %_44595 %_44596 } : { %_44595 %_44596 }
 ; {>  %_44593~0':_stg %_44594~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_44598
	btr r12,2
	jmp LB_44599
LB_44598:
	bts r12,2
LB_44599:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_44602
	btr r12,3
	jmp LB_44603
LB_44602:
	bts r12,3
LB_44603:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_44600
	btr QWORD [rdi],0
	jmp LB_44601
LB_44600:
	bts QWORD [rdi],0
LB_44601:
	mov r9,r14
	bt r12,1
	jc LB_44606
	btr r12,3
	jmp LB_44607
LB_44606:
	bts r12,3
LB_44607:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_44604
	btr QWORD [rdi],1
	jmp LB_44605
LB_44604:
	bts QWORD [rdi],1
LB_44605:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_44608
	btr r12,2
	jmp LB_44609
LB_44608:
	bts r12,2
LB_44609:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_44612
	btr r12,3
	jmp LB_44613
LB_44612:
	bts r12,3
LB_44613:
	mov r13,r9
	bt r12,3
	jc LB_44610
	btr r12,0
	jmp LB_44611
LB_44610:
	bts r12,0
LB_44611:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_44616
	btr r12,3
	jmp LB_44617
LB_44616:
	bts r12,3
LB_44617:
	mov r14,r9
	bt r12,3
	jc LB_44614
	btr r12,1
	jmp LB_44615
LB_44614:
	bts r12,1
LB_44615:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_44596~1':(_opn)◂(_stg) %_44595~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_44618
	mov rdi,r14
	call dlt
LB_44618:
	bt r12,0
	jc LB_44619
	mov rdi,r13
	call dlt
LB_44619:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_44621:
NS_E_RDI_44621:
NS_E_44621_ETR_TBL:
NS_E_44621_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_44636
LB_44635:
	add r14,1
LB_44636:
	cmp r14,r10
	jge LB_44637
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44635
	cmp al,10
	jz LB_44635
	cmp al,32
	jz LB_44635
LB_44637:
	push r10
	call NS_E_43932_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44638
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44621_MTC_0_failed
LB_44638:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_44641
LB_44640:
	add r14,1
LB_44641:
	cmp r14,r10
	jge LB_44642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44640
	cmp al,10
	jz LB_44640
	cmp al,32
	jz LB_44640
LB_44642:
	add r14,1
	cmp r14,r10
	jg LB_44646
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_44646
	jmp LB_44647
LB_44646:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44644
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44644:
	jmp NS_E_44621_MTC_0_failed
LB_44647:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_44649
LB_44648:
	add r14,1
LB_44649:
	cmp r14,r10
	jge LB_44650
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44648
	cmp al,10
	jz LB_44648
	cmp al,32
	jz LB_44648
LB_44650:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44651
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_44652
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_44652:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44653
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44653:
	jmp NS_E_44621_MTC_0_failed
LB_44651:
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
	jc LB_44631
	btr QWORD [rdi],2
LB_44631:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44632
	btr QWORD [rdi],1
LB_44632:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44633
	btr QWORD [rdi],0
LB_44633:
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
NS_E_44621_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_44627
LB_44626:
	add r14,1
LB_44627:
	cmp r14,r10
	jge LB_44628
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44626
	cmp al,32
	jz LB_44626
LB_44628:
	push r10
	call NS_E_43932_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44629
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44621_MTC_1_failed
LB_44629:
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
	jc LB_44624
	btr QWORD [rdi],0
LB_44624:
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
NS_E_44621_MTC_1_failed:
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
NS_E_44656:
NS_E_RDI_44656:
NS_E_44656_ETR_TBL:
NS_E_44656_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_43384_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44680
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44656_MTC_0_failed
LB_44680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_44688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_44688
	jmp LB_44689
LB_44688:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44686
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44686:
	jmp NS_E_44656_MTC_0_failed
LB_44689:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44674
	btr QWORD [rdi],1
LB_44674:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44675
	btr QWORD [rdi],0
LB_44675:
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
NS_E_44656_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_43455_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44672
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44656_MTC_1_failed
LB_44672:
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
	jc LB_44667
	btr QWORD [rdi],0
LB_44667:
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
NS_E_44656_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44665
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44656_MTC_2_failed
LB_44665:
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
	jc LB_44660
	btr QWORD [rdi],0
LB_44660:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44656_MTC_2_failed:
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
NS_E_44691:
NS_E_RDI_44691:
NS_E_44691_ETR_TBL:
NS_E_44691_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_44697
LB_44696:
	add r14,1
LB_44697:
	cmp r14,r10
	jge LB_44698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44696
	cmp al,32
	jz LB_44696
LB_44698:
	add r14,1
	cmp r14,r10
	jg LB_44701
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_44701
	jmp LB_44702
LB_44701:
	jmp NS_E_44691_MTC_0_failed
LB_44702:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_44707:
	jmp LB_44704
LB_44703:
	add r14,1
LB_44704:
	cmp r14,r10
	jge LB_44705
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44703
	cmp al,32
	jz LB_44703
LB_44705:
	add r14,1
	cmp r14,r10
	jg LB_44706
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_44706
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_44707
LB_44706:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44693
	btr QWORD [rdi],1
LB_44693:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44694
	btr QWORD [rdi],0
LB_44694:
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
NS_E_44691_MTC_0_failed:
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
NS_E_44709:
NS_E_RDI_44709:
NS_E_44709_ETR_TBL:
NS_E_44709_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_44884:
	jmp LB_44881
LB_44880:
	add r14,1
LB_44881:
	cmp r14,r10
	jge LB_44882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44880
	cmp al,10
	jz LB_44880
	cmp al,32
	jz LB_44880
LB_44882:
	push r10
	push rsi
	call NS_E_44711_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_44883
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_44885
	bts QWORD [rax],0
LB_44885:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_44884
LB_44883:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44878
	btr QWORD [rdi],0
LB_44878:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44709_MTC_0_failed:
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
NS_E_44711:
NS_E_RDI_44711:
NS_E_44711_ETR_TBL:
NS_E_44711_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_45155
LB_45154:
	add r14,1
LB_45155:
	cmp r14,r10
	jge LB_45156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45154
	cmp al,10
	jz LB_45154
	cmp al,32
	jz LB_45154
LB_45156:
	add r14,7
	cmp r14,r10
	jg LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_45159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_45159
	jmp LB_45160
LB_45159:
	jmp NS_E_44711_MTC_0_failed
LB_45160:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_45162
LB_45161:
	add r14,1
LB_45162:
	cmp r14,r10
	jge LB_45163
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45161
	cmp al,10
	jz LB_45161
	cmp al,32
	jz LB_45161
LB_45163:
	push r10
	call NS_E_44761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45164
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45165
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45165:
	jmp NS_E_44711_MTC_0_failed
LB_45164:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45171:
	jmp LB_45168
LB_45167:
	add r14,1
LB_45168:
	cmp r14,r10
	jge LB_45169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45167
	cmp al,10
	jz LB_45167
	cmp al,32
	jz LB_45167
LB_45169:
	push r10
	push rsi
	call NS_E_44761_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45170
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45172
	bts QWORD [rax],0
LB_45172:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45171
LB_45170:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45150
	btr QWORD [rdi],2
LB_45150:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45151
	btr QWORD [rdi],1
LB_45151:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45152
	btr QWORD [rdi],0
LB_45152:
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
NS_E_44711_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_45138
LB_45137:
	add r14,1
LB_45138:
	cmp r14,r10
	jge LB_45139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45137
	cmp al,10
	jz LB_45137
	cmp al,32
	jz LB_45137
LB_45139:
	add r14,4
	cmp r14,r10
	jg LB_45142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_45142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_45142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_45142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_45142
	jmp LB_45143
LB_45142:
	jmp NS_E_44711_MTC_1_failed
LB_45143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_45145
LB_45144:
	add r14,1
LB_45145:
	cmp r14,r10
	jge LB_45146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45144
	cmp al,10
	jz LB_45144
	cmp al,32
	jz LB_45144
LB_45146:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45148:
	jmp NS_E_44711_MTC_1_failed
LB_45147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	call LB_44886
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45134
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45134:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45135
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45135:
NS_E_44711_MTC_1_failed:
	add rsp,32
	pop r14
	jmp LB_44887
LB_44886:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_44906
LB_44905:
	add r14,1
LB_44906:
	cmp r14,r10
	jge LB_44907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44905
	cmp al,10
	jz LB_44905
	cmp al,32
	jz LB_44905
LB_44907:
	add r14,1
	cmp r14,r10
	jg LB_44910
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_44910
	jmp LB_44911
LB_44910:
	jmp NS_E_44888_MTC_0_failed
LB_44911:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_44913
LB_44912:
	add r14,1
LB_44913:
	cmp r14,r10
	jge LB_44914
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44912
	cmp al,10
	jz LB_44912
	cmp al,32
	jz LB_44912
LB_44914:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44915
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44916:
	jmp NS_E_44888_MTC_0_failed
LB_44915:
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
	jc LB_44899
	btr QWORD [rdi],1
LB_44899:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44900
	btr QWORD [rdi],0
LB_44900:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44902
	btr QWORD [rdi],1
LB_44902:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44903
	btr QWORD [rdi],0
LB_44903:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44888_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_44895
LB_44894:
	add r14,1
LB_44895:
	cmp r14,r10
	jge LB_44896
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44894
	cmp al,10
	jz LB_44894
	cmp al,32
	jz LB_44894
LB_44896:
	push r10
	call NS_E_44713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44897
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44888_MTC_1_failed
LB_44897:
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
	jc LB_44889
	btr QWORD [rdi],0
LB_44889:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44891
	btr QWORD [rdi],1
LB_44891:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44892
	btr QWORD [rdi],0
LB_44892:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44888_MTC_1_failed:
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
LB_44887:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_45128
LB_45127:
	add r14,1
LB_45128:
	cmp r14,r10
	jge LB_45129
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45127
	cmp al,10
	jz LB_45127
	cmp al,32
	jz LB_45127
LB_45129:
	add r14,2
	cmp r14,r10
	jg LB_45132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_45132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_45132
	jmp LB_45133
LB_45132:
	jmp NS_E_44711_MTC_2_failed
LB_45133:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_44918
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45125:
NS_E_44711_MTC_2_failed:
	add rsp,16
	pop r14
	jmp LB_44919
LB_44918:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_44999
LB_44998:
	add r14,1
LB_44999:
	cmp r14,r10
	jge LB_45000
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44998
	cmp al,10
	jz LB_44998
	cmp al,32
	jz LB_44998
LB_45000:
	add r14,1
	cmp r14,r10
	jg LB_45003
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_45003
	jmp LB_45004
LB_45003:
	jmp NS_E_44920_MTC_0_failed
LB_45004:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_45006
LB_45005:
	add r14,1
LB_45006:
	cmp r14,r10
	jge LB_45007
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45005
	cmp al,10
	jz LB_45005
	cmp al,32
	jz LB_45005
LB_45007:
	add r14,1
	cmp r14,r10
	jg LB_45011
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_45011
	jmp LB_45012
LB_45011:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45009
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45009:
	jmp NS_E_44920_MTC_0_failed
LB_45012:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_45014
LB_45013:
	add r14,1
LB_45014:
	cmp r14,r10
	jge LB_45015
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45013
	cmp al,10
	jz LB_45013
	cmp al,32
	jz LB_45013
LB_45015:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45016
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45017
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45017:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45018:
	jmp NS_E_44920_MTC_0_failed
LB_45016:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_45021
LB_45020:
	add r14,1
LB_45021:
	cmp r14,r10
	jge LB_45022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45020
	cmp al,10
	jz LB_45020
	cmp al,32
	jz LB_45020
LB_45022:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45023
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45024
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45024:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45025
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45025:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45026
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45026:
	jmp NS_E_44920_MTC_0_failed
LB_45023:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_45029
LB_45028:
	add r14,1
LB_45029:
	cmp r14,r10
	jge LB_45030
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45028
	cmp al,10
	jz LB_45028
	cmp al,32
	jz LB_45028
LB_45030:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45031
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_45032
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_45032:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45033
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45033:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45034
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45034:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45035:
	jmp NS_E_44920_MTC_0_failed
LB_45031:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45041:
	jmp LB_45038
LB_45037:
	add r14,1
LB_45038:
	cmp r14,r10
	jge LB_45039
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45037
	cmp al,10
	jz LB_45037
	cmp al,32
	jz LB_45037
LB_45039:
	push r10
	push rsi
	call NS_E_44715_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45040
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45042
	bts QWORD [rax],0
LB_45042:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45041
LB_45040:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_44989
	btr QWORD [rdi],5
LB_44989:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_44990
	btr QWORD [rdi],4
LB_44990:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_44991
	btr QWORD [rdi],3
LB_44991:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_44992
	btr QWORD [rdi],2
LB_44992:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_44993
	btr QWORD [rdi],1
LB_44993:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44994
	btr QWORD [rdi],0
LB_44994:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,104
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44996
	btr QWORD [rdi],0
LB_44996:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44920_MTC_0_failed:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
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
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44987
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44920_MTC_1_failed
LB_44987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	call LB_44921
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44982
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44982:
NS_E_44920_MTC_1_failed:
	add rsp,16
	pop r14
	jmp LB_44922
LB_44921:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_44970
LB_44969:
	add r14,1
LB_44970:
	cmp r14,r10
	jge LB_44971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44969
	cmp al,10
	jz LB_44969
	cmp al,32
	jz LB_44969
LB_44971:
	add r14,1
	cmp r14,r10
	jg LB_44974
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_44974
	jmp LB_44975
LB_44974:
	jmp NS_E_44923_MTC_0_failed
LB_44975:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_44977
LB_44976:
	add r14,1
LB_44977:
	cmp r14,r10
	jge LB_44978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44976
	cmp al,10
	jz LB_44976
	cmp al,32
	jz LB_44976
LB_44978:
	push r10
	call NS_E_44656_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44980
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44980:
	jmp NS_E_44923_MTC_0_failed
LB_44979:
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
	jc LB_44962
	btr QWORD [rdi],1
LB_44962:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44963
	btr QWORD [rdi],0
LB_44963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44967
	btr QWORD [rdi],0
LB_44967:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44965
	btr QWORD [rdi],0
LB_44965:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44923_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_44950
LB_44949:
	add r14,1
LB_44950:
	cmp r14,r10
	jge LB_44951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44949
	cmp al,10
	jz LB_44949
	cmp al,32
	jz LB_44949
LB_44951:
	add r14,2
	cmp r14,r10
	jg LB_44954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_44954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_44954
	jmp LB_44955
LB_44954:
	jmp NS_E_44923_MTC_1_failed
LB_44955:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_44957
LB_44956:
	add r14,1
LB_44957:
	cmp r14,r10
	jge LB_44958
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44956
	cmp al,10
	jz LB_44956
	cmp al,32
	jz LB_44956
LB_44958:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44959
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44960
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44960:
	jmp NS_E_44923_MTC_1_failed
LB_44959:
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
	jc LB_44942
	btr QWORD [rdi],1
LB_44942:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44943
	btr QWORD [rdi],0
LB_44943:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44947
	btr QWORD [rdi],0
LB_44947:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44945
	btr QWORD [rdi],0
LB_44945:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44923_MTC_1_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_44932
LB_44931:
	add r14,1
LB_44932:
	cmp r14,r10
	jge LB_44933
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44931
	cmp al,10
	jz LB_44931
	cmp al,32
	jz LB_44931
LB_44933:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44934
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44923_MTC_2_failed
LB_44934:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_44937
LB_44936:
	add r14,1
LB_44937:
	cmp r14,r10
	jge LB_44938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_44936
	cmp al,10
	jz LB_44936
	cmp al,32
	jz LB_44936
LB_44938:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_44939
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_44940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_44940:
	jmp NS_E_44923_MTC_2_failed
LB_44939:
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
	jc LB_44924
	btr QWORD [rdi],1
LB_44924:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44925
	btr QWORD [rdi],0
LB_44925:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44929
	btr QWORD [rdi],0
LB_44929:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_44927
	btr QWORD [rdi],0
LB_44927:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44923_MTC_2_failed:
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
LB_44922:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_44919:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_45119
LB_45118:
	add r14,1
LB_45119:
	cmp r14,r10
	jge LB_45120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45118
	cmp al,10
	jz LB_45118
	cmp al,32
	jz LB_45118
LB_45120:
	add r14,2
	cmp r14,r10
	jg LB_45123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_45123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_45123
	jmp LB_45124
LB_45123:
	jmp NS_E_44711_MTC_3_failed
LB_45124:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_45043
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45116:
NS_E_44711_MTC_3_failed:
	add rsp,16
	pop r14
	jmp LB_45044
LB_45043:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_45089
LB_45088:
	add r14,1
LB_45089:
	cmp r14,r10
	jge LB_45090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45088
	cmp al,10
	jz LB_45088
	cmp al,32
	jz LB_45088
LB_45090:
	add r14,1
	cmp r14,r10
	jg LB_45093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_45093
	jmp LB_45094
LB_45093:
	jmp NS_E_45045_MTC_0_failed
LB_45094:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_45096
LB_45095:
	add r14,1
LB_45096:
	cmp r14,r10
	jge LB_45097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45095
	cmp al,10
	jz LB_45095
	cmp al,32
	jz LB_45095
LB_45097:
	add r14,1
	cmp r14,r10
	jg LB_45101
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_45101
	jmp LB_45102
LB_45101:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45099
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45099:
	jmp NS_E_45045_MTC_0_failed
LB_45102:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_45104
LB_45103:
	add r14,1
LB_45104:
	cmp r14,r10
	jge LB_45105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45103
	cmp al,10
	jz LB_45103
	cmp al,32
	jz LB_45103
LB_45105:
	push r10
	call NS_E_44747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45106
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45107
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45107:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45108
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45108:
	jmp NS_E_45045_MTC_0_failed
LB_45106:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ qlq_dt_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45114:
	jmp LB_45111
LB_45110:
	add r14,1
LB_45111:
	cmp r14,r10
	jge LB_45112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45110
	cmp al,10
	jz LB_45110
	cmp al,32
	jz LB_45110
LB_45112:
	push r10
	push rsi
	call NS_E_44749_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45113
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45115
	bts QWORD [rax],0
LB_45115:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45114
LB_45113:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45081
	btr QWORD [rdi],3
LB_45081:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45082
	btr QWORD [rdi],2
LB_45082:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45083
	btr QWORD [rdi],1
LB_45083:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45084
	btr QWORD [rdi],0
LB_45084:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45086
	btr QWORD [rdi],0
LB_45086:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45045_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_45062
LB_45061:
	add r14,1
LB_45062:
	cmp r14,r10
	jge LB_45063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45061
	cmp al,10
	jz LB_45061
	cmp al,32
	jz LB_45061
LB_45063:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45064
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_45045_MTC_1_failed
LB_45064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_45067
LB_45066:
	add r14,1
LB_45067:
	cmp r14,r10
	jge LB_45068
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45066
	cmp al,10
	jz LB_45066
	cmp al,32
	jz LB_45066
LB_45068:
	add r14,1
	cmp r14,r10
	jg LB_45072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_45072
	jmp LB_45073
LB_45072:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45070:
	jmp NS_E_45045_MTC_1_failed
LB_45073:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_45075
LB_45074:
	add r14,1
LB_45075:
	cmp r14,r10
	jge LB_45076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45074
	cmp al,10
	jz LB_45074
	cmp al,32
	jz LB_45074
LB_45076:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45077
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45078
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45079:
	jmp NS_E_45045_MTC_1_failed
LB_45077:
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
	jc LB_45055
	btr QWORD [rdi],2
LB_45055:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45056
	btr QWORD [rdi],1
LB_45056:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45057
	btr QWORD [rdi],0
LB_45057:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45059
	btr QWORD [rdi],0
LB_45059:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45045_MTC_1_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_45051
LB_45050:
	add r14,1
LB_45051:
	cmp r14,r10
	jge LB_45052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45050
	cmp al,10
	jz LB_45050
	cmp al,32
	jz LB_45050
LB_45052:
	push r10
	call NS_E_44747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45053
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_45045_MTC_2_failed
LB_45053:
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
	jc LB_45046
	btr QWORD [rdi],0
LB_45046:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45048
	btr QWORD [rdi],0
LB_45048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45045_MTC_2_failed:
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
LB_45044:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44713:
NS_E_RDI_44713:
NS_E_44713_ETR_TBL:
NS_E_44713_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_45190
LB_45189:
	add r14,1
LB_45190:
	cmp r14,r10
	jge LB_45191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45189
	cmp al,10
	jz LB_45189
	cmp al,32
	jz LB_45189
LB_45191:
	add r14,6
	cmp r14,r10
	jg LB_45194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_45194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_45194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_45194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_45194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_45194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_45194
	jmp LB_45195
LB_45194:
	jmp NS_E_44713_MTC_0_failed
LB_45195:
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
	jc LB_45187
	btr QWORD [rdi],0
LB_45187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44713_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_45177
LB_45176:
	add r14,1
LB_45177:
	cmp r14,r10
	jge LB_45178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45176
	cmp al,10
	jz LB_45176
	cmp al,32
	jz LB_45176
LB_45178:
	push r10
	call NS_E_44711_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45179
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44713_MTC_1_failed
LB_45179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_45182
LB_45181:
	add r14,1
LB_45182:
	cmp r14,r10
	jge LB_45183
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45181
	cmp al,10
	jz LB_45181
	cmp al,32
	jz LB_45181
LB_45183:
	push r10
	call NS_E_44713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45184
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45185
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45185:
	jmp NS_E_44713_MTC_1_failed
LB_45184:
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
	jc LB_45173
	btr QWORD [rdi],1
LB_45173:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45174
	btr QWORD [rdi],0
LB_45174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44713_MTC_1_failed:
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
NS_E_44715:
NS_E_RDI_44715:
NS_E_44715_ETR_TBL:
NS_E_44715_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_45203
LB_45202:
	add r14,1
LB_45203:
	cmp r14,r10
	jge LB_45204
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45202
	cmp al,10
	jz LB_45202
	cmp al,32
	jz LB_45202
LB_45204:
	add r14,1
	cmp r14,r10
	jg LB_45207
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_45207
	jmp LB_45208
LB_45207:
	jmp NS_E_44715_MTC_0_failed
LB_45208:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_45210
LB_45209:
	add r14,1
LB_45210:
	cmp r14,r10
	jge LB_45211
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45209
	cmp al,10
	jz LB_45209
	cmp al,32
	jz LB_45209
LB_45211:
	add r14,1
	cmp r14,r10
	jg LB_45215
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_45215
	jmp LB_45216
LB_45215:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45213
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45213:
	jmp NS_E_44715_MTC_0_failed
LB_45216:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_45218
LB_45217:
	add r14,1
LB_45218:
	cmp r14,r10
	jge LB_45219
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45217
	cmp al,10
	jz LB_45217
	cmp al,32
	jz LB_45217
LB_45219:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45220
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45221
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45221:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45222
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45222:
	jmp NS_E_44715_MTC_0_failed
LB_45220:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_45225
LB_45224:
	add r14,1
LB_45225:
	cmp r14,r10
	jge LB_45226
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45224
	cmp al,10
	jz LB_45224
	cmp al,32
	jz LB_45224
LB_45226:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45227
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45228
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45228:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45229
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45229:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45230
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45230:
	jmp NS_E_44715_MTC_0_failed
LB_45227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_45233
LB_45232:
	add r14,1
LB_45233:
	cmp r14,r10
	jge LB_45234
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45232
	cmp al,10
	jz LB_45232
	cmp al,32
	jz LB_45232
LB_45234:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45235
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_45236
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_45236:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45237
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45237:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45238
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45238:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45239
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45239:
	jmp NS_E_44715_MTC_0_failed
LB_45235:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_45196
	btr QWORD [rdi],4
LB_45196:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45197
	btr QWORD [rdi],3
LB_45197:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45198
	btr QWORD [rdi],2
LB_45198:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45199
	btr QWORD [rdi],1
LB_45199:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45200
	btr QWORD [rdi],0
LB_45200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44715_MTC_0_failed:
	add rsp,80
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
NS_E_44717:
NS_E_RDI_44717:
NS_E_44717_ETR_TBL:
NS_E_44717_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_45246
LB_45245:
	add r14,1
LB_45246:
	cmp r14,r10
	jge LB_45247
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45245
	cmp al,10
	jz LB_45245
	cmp al,32
	jz LB_45245
LB_45247:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45248
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44717_MTC_0_failed
LB_45248:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_45251
LB_45250:
	add r14,1
LB_45251:
	cmp r14,r10
	jge LB_45252
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45250
	cmp al,10
	jz LB_45250
	cmp al,32
	jz LB_45250
LB_45252:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45253
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45254
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45254:
	jmp NS_E_44717_MTC_0_failed
LB_45253:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_45257
LB_45256:
	add r14,1
LB_45257:
	cmp r14,r10
	jge LB_45258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45256
	cmp al,10
	jz LB_45256
	cmp al,32
	jz LB_45256
LB_45258:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45259
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45260
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45260:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45261
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45261:
	jmp NS_E_44717_MTC_0_failed
LB_45259:
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
	jc LB_45241
	btr QWORD [rdi],2
LB_45241:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45242
	btr QWORD [rdi],1
LB_45242:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45243
	btr QWORD [rdi],0
LB_45243:
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
NS_E_44717_MTC_0_failed:
	add rsp,48
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
NS_E_44719:
NS_E_RDI_44719:
NS_E_44719_ETR_TBL:
NS_E_44719_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_45288
LB_45287:
	add r14,1
LB_45288:
	cmp r14,r10
	jge LB_45289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45287
	cmp al,10
	jz LB_45287
	cmp al,32
	jz LB_45287
LB_45289:
	add r14,3
	cmp r14,r10
	jg LB_45292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_45292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_45292
	jmp LB_45293
LB_45292:
	jmp NS_E_44719_MTC_0_failed
LB_45293:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_45295
LB_45294:
	add r14,1
LB_45295:
	cmp r14,r10
	jge LB_45296
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45294
	cmp al,10
	jz LB_45294
	cmp al,32
	jz LB_45294
LB_45296:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45297
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45298:
	jmp NS_E_44719_MTC_0_failed
LB_45297:
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
	jc LB_45284
	btr QWORD [rdi],1
LB_45284:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45285
	btr QWORD [rdi],0
LB_45285:
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
NS_E_44719_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_45280
LB_45279:
	add r14,1
LB_45280:
	cmp r14,r10
	jge LB_45281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45279
	cmp al,10
	jz LB_45279
	cmp al,32
	jz LB_45279
LB_45281:
	push r10
	call NS_E_44731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45282
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44719_MTC_1_failed
LB_45282:
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
	jc LB_45277
	btr QWORD [rdi],0
LB_45277:
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
NS_E_44719_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_45267
LB_45266:
	add r14,1
LB_45267:
	cmp r14,r10
	jge LB_45268
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45266
	cmp al,10
	jz LB_45266
	cmp al,32
	jz LB_45266
LB_45268:
	push r10
	call NS_E_44721_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45269
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44719_MTC_2_failed
LB_45269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_45272
LB_45271:
	add r14,1
LB_45272:
	cmp r14,r10
	jge LB_45273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45271
	cmp al,10
	jz LB_45271
	cmp al,32
	jz LB_45271
LB_45273:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45274
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45275
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45275:
	jmp NS_E_44719_MTC_2_failed
LB_45274:
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
	jc LB_45263
	btr QWORD [rdi],1
LB_45263:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45264
	btr QWORD [rdi],0
LB_45264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44719_MTC_2_failed:
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
NS_E_44721:
NS_E_RDI_44721:
NS_E_44721_ETR_TBL:
NS_E_44721_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
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
	add r14,1
	cmp r14,r10
	jg LB_45553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_45553
	jmp LB_45554
LB_45553:
	jmp NS_E_44721_MTC_0_failed
LB_45554:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_45556
LB_45555:
	add r14,1
LB_45556:
	cmp r14,r10
	jge LB_45557
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45555
	cmp al,10
	jz LB_45555
	cmp al,32
	jz LB_45555
LB_45557:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45558
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45559
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45559:
	jmp NS_E_44721_MTC_0_failed
LB_45558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_45562
LB_45561:
	add r14,1
LB_45562:
	cmp r14,r10
	jge LB_45563
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45561
	cmp al,10
	jz LB_45561
	cmp al,32
	jz LB_45561
LB_45563:
	add r14,3
	cmp r14,r10
	jg LB_45568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45568
	jmp LB_45569
LB_45568:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45565
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45565:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45566
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45566:
	jmp NS_E_44721_MTC_0_failed
LB_45569:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_45571
LB_45570:
	add r14,1
LB_45571:
	cmp r14,r10
	jge LB_45572
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45570
	cmp al,10
	jz LB_45570
	cmp al,32
	jz LB_45570
LB_45572:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45573
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45574
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45574:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45575
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45575:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45576
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45576:
	jmp NS_E_44721_MTC_0_failed
LB_45573:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45543
	btr QWORD [rdi],3
LB_45543:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45544
	btr QWORD [rdi],2
LB_45544:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45545
	btr QWORD [rdi],1
LB_45545:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45546
	btr QWORD [rdi],0
LB_45546:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44721_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_45514
LB_45513:
	add r14,1
LB_45514:
	cmp r14,r10
	jge LB_45515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45513
	cmp al,10
	jz LB_45513
	cmp al,32
	jz LB_45513
LB_45515:
	add r14,3
	cmp r14,r10
	jg LB_45518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_45518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_45518
	jmp LB_45519
LB_45518:
	jmp NS_E_44721_MTC_1_failed
LB_45519:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_45521
LB_45520:
	add r14,1
LB_45521:
	cmp r14,r10
	jge LB_45522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45520
	cmp al,10
	jz LB_45520
	cmp al,32
	jz LB_45520
LB_45522:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45523
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45524:
	jmp NS_E_44721_MTC_1_failed
LB_45523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_45527
LB_45526:
	add r14,1
LB_45527:
	cmp r14,r10
	jge LB_45528
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45526
	cmp al,10
	jz LB_45526
	cmp al,32
	jz LB_45526
LB_45528:
	add r14,3
	cmp r14,r10
	jg LB_45533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45533
	jmp LB_45534
LB_45533:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45530
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45530:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45531:
	jmp NS_E_44721_MTC_1_failed
LB_45534:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
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
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45538
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45539
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45539:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45540
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45540:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45541
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45541:
	jmp NS_E_44721_MTC_1_failed
LB_45538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45508
	btr QWORD [rdi],3
LB_45508:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45509
	btr QWORD [rdi],2
LB_45509:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45510
	btr QWORD [rdi],1
LB_45510:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45511
	btr QWORD [rdi],0
LB_45511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44721_MTC_1_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_45502
LB_45501:
	add r14,1
LB_45502:
	cmp r14,r10
	jge LB_45503
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45501
	cmp al,10
	jz LB_45501
	cmp al,32
	jz LB_45501
LB_45503:
	add r14,2
	cmp r14,r10
	jg LB_45506
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_45506
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_45506
	jmp LB_45507
LB_45506:
	jmp NS_E_44721_MTC_2_failed
LB_45507:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_45300
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45499
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45499:
NS_E_44721_MTC_2_failed:
	add rsp,16
	pop r14
	jmp LB_45301
LB_45300:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_^"
	jmp LB_45460
LB_45459:
	add r14,1
LB_45460:
	cmp r14,r10
	jge LB_45461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45459
	cmp al,10
	jz LB_45459
	cmp al,32
	jz LB_45459
LB_45461:
	add r14,2
	cmp r14,r10
	jg LB_45464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_45464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_45464
	jmp LB_45465
LB_45464:
	jmp NS_E_45302_MTC_0_failed
LB_45465:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_45303
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45457
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45457:
NS_E_45302_MTC_0_failed:
	add rsp,16
	pop r14
	jmp LB_45304
LB_45303:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "_"
	jmp LB_45382
LB_45381:
	add r14,1
LB_45382:
	cmp r14,r10
	jge LB_45383
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45381
	cmp al,10
	jz LB_45381
	cmp al,32
	jz LB_45381
LB_45383:
	add r14,1
	cmp r14,r10
	jg LB_45386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_45386
	jmp LB_45387
LB_45386:
	jmp NS_E_45305_MTC_0_failed
LB_45387:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_45389
LB_45388:
	add r14,1
LB_45389:
	cmp r14,r10
	jge LB_45390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45388
	cmp al,10
	jz LB_45388
	cmp al,32
	jz LB_45388
LB_45390:
	add r14,3
	cmp r14,r10
	jg LB_45394
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45394
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45394
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45394
	jmp LB_45395
LB_45394:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45392:
	jmp NS_E_45305_MTC_0_failed
LB_45395:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_45397
LB_45396:
	add r14,1
LB_45397:
	cmp r14,r10
	jge LB_45398
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45396
	cmp al,10
	jz LB_45396
	cmp al,32
	jz LB_45396
LB_45398:
	push r10
	call NS_E_44745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45399
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45400
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45400:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45401
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45401:
	jmp NS_E_45305_MTC_0_failed
LB_45399:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45407:
	jmp LB_45404
LB_45403:
	add r14,1
LB_45404:
	cmp r14,r10
	jge LB_45405
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45403
	cmp al,10
	jz LB_45403
	cmp al,32
	jz LB_45403
LB_45405:
	push r10
	push rsi
	call NS_E_44723_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45406
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45408
	bts QWORD [rax],0
LB_45408:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45407
LB_45406:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_45410
LB_45409:
	add r14,1
LB_45410:
	cmp r14,r10
	jge LB_45411
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45409
	cmp al,10
	jz LB_45409
	cmp al,32
	jz LB_45409
LB_45411:
	add r14,2
	cmp r14,r10
	jg LB_45418
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_45418
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_45418
	jmp LB_45419
LB_45418:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_45413
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_45413:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45414
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45414:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45415
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45415:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45416:
	jmp NS_E_45305_MTC_0_failed
LB_45419:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_45371
	btr QWORD [rdi],4
LB_45371:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45372
	btr QWORD [rdi],3
LB_45372:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45373
	btr QWORD [rdi],2
LB_45373:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45374
	btr QWORD [rdi],1
LB_45374:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45375
	btr QWORD [rdi],0
LB_45375:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45379
	btr QWORD [rdi],0
LB_45379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45377
	btr QWORD [rdi],0
LB_45377:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45305_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_45319
LB_45318:
	add r14,1
LB_45319:
	cmp r14,r10
	jge LB_45320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45318
	cmp al,10
	jz LB_45318
	cmp al,32
	jz LB_45318
LB_45320:
	push r10
	call NS_E_44745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45321
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_45305_MTC_1_failed
LB_45321:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45327:
	jmp LB_45324
LB_45323:
	add r14,1
LB_45324:
	cmp r14,r10
	jge LB_45325
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45323
	cmp al,10
	jz LB_45323
	cmp al,32
	jz LB_45323
LB_45325:
	push r10
	push rsi
	call NS_E_44729_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45326
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45328
	bts QWORD [rax],0
LB_45328:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45327
LB_45326:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_45330
LB_45329:
	add r14,1
LB_45330:
	cmp r14,r10
	jge LB_45331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45329
	cmp al,10
	jz LB_45329
	cmp al,32
	jz LB_45329
LB_45331:
	add r14,3
	cmp r14,r10
	jg LB_45336
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45336
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45336
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45336
	jmp LB_45337
LB_45336:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45333
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45333:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45334
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45334:
	jmp NS_E_45305_MTC_1_failed
LB_45337:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_45339
LB_45338:
	add r14,1
LB_45339:
	cmp r14,r10
	jge LB_45340
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45338
	cmp al,10
	jz LB_45338
	cmp al,32
	jz LB_45338
LB_45340:
	push r10
	call NS_E_44745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45341
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45342
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45342:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45343
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45343:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45344
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45344:
	jmp NS_E_45305_MTC_1_failed
LB_45341:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45350:
	jmp LB_45347
LB_45346:
	add r14,1
LB_45347:
	cmp r14,r10
	jge LB_45348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45346
	cmp al,10
	jz LB_45346
	cmp al,32
	jz LB_45346
LB_45348:
	push r10
	push rsi
	call NS_E_44729_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45349
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45351
	bts QWORD [rax],0
LB_45351:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45350
LB_45349:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rsi
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45356:
	jmp LB_45353
LB_45352:
	add r14,1
LB_45353:
	cmp r14,r10
	jge LB_45354
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45352
	cmp al,10
	jz LB_45352
	cmp al,32
	jz LB_45352
LB_45354:
	push r10
	push rsi
	call NS_E_44723_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45355
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45357
	bts QWORD [rax],0
LB_45357:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45356
LB_45355:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_45359
LB_45358:
	add r14,1
LB_45359:
	cmp r14,r10
	jge LB_45360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45358
	cmp al,10
	jz LB_45358
	cmp al,32
	jz LB_45358
LB_45360:
	add r14,2
	cmp r14,r10
	jg LB_45369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_45369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_45369
	jmp LB_45370
LB_45369:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_45362
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_45362:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_45363
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_45363:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_45364
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_45364:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45365
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45365:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45366
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45366:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45367
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45367:
	jmp NS_E_45305_MTC_1_failed
LB_45370:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*6],0
	mov QWORD [rsp+8*1+16*6],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0007_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_45306
	btr QWORD [rdi],6
LB_45306:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_45307
	btr QWORD [rdi],5
LB_45307:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_45308
	btr QWORD [rdi],4
LB_45308:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45309
	btr QWORD [rdi],3
LB_45309:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45310
	btr QWORD [rdi],2
LB_45310:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45311
	btr QWORD [rdi],1
LB_45311:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45312
	btr QWORD [rdi],0
LB_45312:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,120
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45316
	btr QWORD [rdi],0
LB_45316:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45314
	btr QWORD [rdi],0
LB_45314:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45305_MTC_1_failed:
	add rsp,112
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
LB_45304:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_45428
LB_45427:
	add r14,1
LB_45428:
	cmp r14,r10
	jge LB_45429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45427
	cmp al,10
	jz LB_45427
	cmp al,32
	jz LB_45427
LB_45429:
	push r10
	call NS_E_44656_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45430
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_45302_MTC_1_failed
LB_45430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_45433
LB_45432:
	add r14,1
LB_45433:
	cmp r14,r10
	jge LB_45434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45432
	cmp al,10
	jz LB_45432
	cmp al,32
	jz LB_45432
LB_45434:
	add r14,1
	cmp r14,r10
	jg LB_45438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_45438
	jmp LB_45439
LB_45438:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45436:
	jmp NS_E_45302_MTC_1_failed
LB_45439:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_45441
LB_45440:
	add r14,1
LB_45441:
	cmp r14,r10
	jge LB_45442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45440
	cmp al,10
	jz LB_45440
	cmp al,32
	jz LB_45440
LB_45442:
	add r14,3
	cmp r14,r10
	jg LB_45447
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45447
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45447
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45447
	jmp LB_45448
LB_45447:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45444
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45444:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45445
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45445:
	jmp NS_E_45302_MTC_1_failed
LB_45448:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_45450
LB_45449:
	add r14,1
LB_45450:
	cmp r14,r10
	jge LB_45451
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45449
	cmp al,10
	jz LB_45449
	cmp al,32
	jz LB_45449
LB_45451:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45452
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45453
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45453:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45455:
	jmp NS_E_45302_MTC_1_failed
LB_45452:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45420
	btr QWORD [rdi],3
LB_45420:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45421
	btr QWORD [rdi],2
LB_45421:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45422
	btr QWORD [rdi],1
LB_45422:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45423
	btr QWORD [rdi],0
LB_45423:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45425
	btr QWORD [rdi],0
LB_45425:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45302_MTC_1_failed:
	add rsp,64
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
LB_45301:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_45472
LB_45471:
	add r14,1
LB_45472:
	cmp r14,r10
	jge LB_45473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45471
	cmp al,10
	jz LB_45471
	cmp al,32
	jz LB_45471
LB_45473:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44721_MTC_3_failed
LB_45474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_45477
LB_45476:
	add r14,1
LB_45477:
	cmp r14,r10
	jge LB_45478
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45476
	cmp al,10
	jz LB_45476
	cmp al,32
	jz LB_45476
LB_45478:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45479
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45480
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45480:
	jmp NS_E_44721_MTC_3_failed
LB_45479:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_45483
LB_45482:
	add r14,1
LB_45483:
	cmp r14,r10
	jge LB_45484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45482
	cmp al,10
	jz LB_45482
	cmp al,32
	jz LB_45482
LB_45484:
	add r14,3
	cmp r14,r10
	jg LB_45489
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45489
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45489
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45489
	jmp LB_45490
LB_45489:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45486
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45486:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45487
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45487:
	jmp NS_E_44721_MTC_3_failed
LB_45490:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_45492
LB_45491:
	add r14,1
LB_45492:
	cmp r14,r10
	jge LB_45493
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45491
	cmp al,10
	jz LB_45491
	cmp al,32
	jz LB_45491
LB_45493:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45494
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45495
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45495:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45496
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45496:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45497
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45497:
	jmp NS_E_44721_MTC_3_failed
LB_45494:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45466
	btr QWORD [rdi],3
LB_45466:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45467
	btr QWORD [rdi],2
LB_45467:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45468
	btr QWORD [rdi],1
LB_45468:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45469
	btr QWORD [rdi],0
LB_45469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44721_MTC_3_failed:
	add rsp,64
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
NS_E_44723:
NS_E_RDI_44723:
NS_E_44723_ETR_TBL:
NS_E_44723_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_45611
LB_45610:
	add r14,1
LB_45611:
	cmp r14,r10
	jge LB_45612
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45610
	cmp al,10
	jz LB_45610
	cmp al,32
	jz LB_45610
LB_45612:
	push r10
	call NS_E_44725_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45613
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44723_MTC_0_failed
LB_45613:
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
	jc LB_45608
	btr QWORD [rdi],0
LB_45608:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44723_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_45604
LB_45603:
	add r14,1
LB_45604:
	cmp r14,r10
	jge LB_45605
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45603
	cmp al,10
	jz LB_45603
	cmp al,32
	jz LB_45603
LB_45605:
	push r10
	call NS_E_43455_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45606
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44723_MTC_1_failed
LB_45606:
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
	jc LB_45601
	btr QWORD [rdi],0
LB_45601:
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
NS_E_44723_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_45597
LB_45596:
	add r14,1
LB_45597:
	cmp r14,r10
	jge LB_45598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45596
	cmp al,10
	jz LB_45596
	cmp al,32
	jz LB_45596
LB_45598:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45599
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44723_MTC_2_failed
LB_45599:
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
	jc LB_45594
	btr QWORD [rdi],0
LB_45594:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44723_MTC_2_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	jmp LB_45582
LB_45581:
	add r14,1
LB_45582:
	cmp r14,r10
	jge LB_45583
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45581
	cmp al,10
	jz LB_45581
	cmp al,32
	jz LB_45581
LB_45583:
	push r10
	call NS_E_43384_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45584
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44723_MTC_3_failed
LB_45584:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_45587
LB_45586:
	add r14,1
LB_45587:
	cmp r14,r10
	jge LB_45588
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45586
	cmp al,10
	jz LB_45586
	cmp al,32
	jz LB_45586
LB_45588:
	add r14,1
	cmp r14,r10
	jg LB_45592
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_45592
	jmp LB_45593
LB_45592:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45590
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45590:
	jmp NS_E_44723_MTC_3_failed
LB_45593:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45578
	btr QWORD [rdi],1
LB_45578:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45579
	btr QWORD [rdi],0
LB_45579:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44723_MTC_3_failed:
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
NS_E_44725:
NS_E_RDI_44725:
NS_E_44725_ETR_TBL:
NS_E_44725_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_45623
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_45623
	jmp LB_45624
LB_45623:
	jmp NS_E_44725_MTC_0_failed
LB_45624:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_44727_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45628
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45629
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45629:
	jmp NS_E_44725_MTC_0_failed
LB_45628:
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
	jc LB_45615
	btr QWORD [rdi],1
LB_45615:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45616
	btr QWORD [rdi],0
LB_45616:
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
NS_E_44725_MTC_0_failed:
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
NS_E_44727:
NS_E_RDI_44727:
NS_E_44727_ETR_TBL:
NS_E_44727_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_45652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_45652
	jmp LB_45653
LB_45652:
	jmp NS_E_44727_MTC_0_failed
LB_45653:
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
	jc LB_45645
	btr QWORD [rdi],0
LB_45645:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44727_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_43382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45637
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44727_MTC_1_failed
LB_45637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_44727_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45643
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45643:
	jmp NS_E_44727_MTC_1_failed
LB_45642:
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
	jc LB_45631
	btr QWORD [rdi],1
LB_45631:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45632
	btr QWORD [rdi],0
LB_45632:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44727_MTC_1_failed:
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
NS_E_44729:
NS_E_RDI_44729:
NS_E_44729_ETR_TBL:
NS_E_44729_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_45662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_45662
	jmp LB_45663
LB_45662:
	jmp NS_E_44729_MTC_0_failed
LB_45663:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_44745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45667
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45668
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45668:
	jmp NS_E_44729_MTC_0_failed
LB_45667:
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
	jc LB_45654
	btr QWORD [rdi],1
LB_45654:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45655
	btr QWORD [rdi],0
LB_45655:
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
NS_E_44729_MTC_0_failed:
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
NS_E_44731:
NS_E_RDI_44731:
NS_E_44731_ETR_TBL:
NS_E_44731_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_45710
LB_45709:
	add r14,1
LB_45710:
	cmp r14,r10
	jge LB_45711
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45709
	cmp al,10
	jz LB_45709
	cmp al,32
	jz LB_45709
LB_45711:
	add r14,3
	cmp r14,r10
	jg LB_45714
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45714
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_45714
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_45714
	jmp LB_45715
LB_45714:
	jmp NS_E_44731_MTC_0_failed
LB_45715:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_45717
LB_45716:
	add r14,1
LB_45717:
	cmp r14,r10
	jge LB_45718
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45716
	cmp al,10
	jz LB_45716
	cmp al,32
	jz LB_45716
LB_45718:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45719
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45720
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45720:
	jmp NS_E_44731_MTC_0_failed
LB_45719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_45723
LB_45722:
	add r14,1
LB_45723:
	cmp r14,r10
	jge LB_45724
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45722
	cmp al,10
	jz LB_45722
	cmp al,32
	jz LB_45722
LB_45724:
	push r10
	call NS_E_44733_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45725
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45726
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45726:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45727
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45727:
	jmp NS_E_44731_MTC_0_failed
LB_45725:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_45730
LB_45729:
	add r14,1
LB_45730:
	cmp r14,r10
	jge LB_45731
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45729
	cmp al,10
	jz LB_45729
	cmp al,32
	jz LB_45729
LB_45731:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45732
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45733
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45733:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45734
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45734:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45735
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45735:
	jmp NS_E_44731_MTC_0_failed
LB_45732:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_45738
LB_45737:
	add r14,1
LB_45738:
	cmp r14,r10
	jge LB_45739
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45737
	cmp al,10
	jz LB_45737
	cmp al,32
	jz LB_45737
LB_45739:
	push r10
	call NS_E_44731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45740
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_45741
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_45741:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45742
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45742:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45743
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45743:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45744:
	jmp NS_E_44731_MTC_0_failed
LB_45740:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_45703
	btr QWORD [rdi],4
LB_45703:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45704
	btr QWORD [rdi],3
LB_45704:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45705
	btr QWORD [rdi],2
LB_45705:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45706
	btr QWORD [rdi],1
LB_45706:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45707
	btr QWORD [rdi],0
LB_45707:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44731_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_45676
LB_45675:
	add r14,1
LB_45676:
	cmp r14,r10
	jge LB_45677
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45675
	cmp al,10
	jz LB_45675
	cmp al,32
	jz LB_45675
LB_45677:
	add r14,4
	cmp r14,r10
	jg LB_45680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_45680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_45680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_45680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_45680
	jmp LB_45681
LB_45680:
	jmp NS_E_44731_MTC_1_failed
LB_45681:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_45683
LB_45682:
	add r14,1
LB_45683:
	cmp r14,r10
	jge LB_45684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45682
	cmp al,10
	jz LB_45682
	cmp al,32
	jz LB_45682
LB_45684:
	push r10
	call NS_E_44735_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45685
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45686
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45686:
	jmp NS_E_44731_MTC_1_failed
LB_45685:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_45689
LB_45688:
	add r14,1
LB_45689:
	cmp r14,r10
	jge LB_45690
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45688
	cmp al,10
	jz LB_45688
	cmp al,32
	jz LB_45688
LB_45690:
	push r10
	call NS_E_44733_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45691
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45692
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45692:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45693
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45693:
	jmp NS_E_44731_MTC_1_failed
LB_45691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_45696
LB_45695:
	add r14,1
LB_45696:
	cmp r14,r10
	jge LB_45697
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45695
	cmp al,10
	jz LB_45695
	cmp al,32
	jz LB_45695
LB_45697:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45698
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45699
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45699:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45700
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45700:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45701
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45701:
	jmp NS_E_44731_MTC_1_failed
LB_45698:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45670
	btr QWORD [rdi],3
LB_45670:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45671
	btr QWORD [rdi],2
LB_45671:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45672
	btr QWORD [rdi],1
LB_45672:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45673
	btr QWORD [rdi],0
LB_45673:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44731_MTC_1_failed:
	add rsp,64
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
NS_E_44733:
NS_E_RDI_44733:
NS_E_44733_ETR_TBL:
NS_E_44733_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_45750
LB_45749:
	add r14,1
LB_45750:
	cmp r14,r10
	jge LB_45751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45749
	cmp al,32
	jz LB_45749
LB_45751:
	add r14,1
	cmp r14,r10
	jg LB_45754
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_45754
	jmp LB_45755
LB_45754:
	jmp NS_E_44733_MTC_0_failed
LB_45755:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_45757
LB_45756:
	add r14,1
LB_45757:
	cmp r14,r10
	jge LB_45758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45756
	cmp al,32
	jz LB_45756
LB_45758:
	add r14,1
	cmp r14,r10
	jg LB_45762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_45762
	jmp LB_45763
LB_45762:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45760
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45760:
	jmp NS_E_44733_MTC_0_failed
LB_45763:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45746
	btr QWORD [rdi],1
LB_45746:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45747
	btr QWORD [rdi],0
LB_45747:
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
NS_E_44733_MTC_0_failed:
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
NS_E_44735:
NS_E_RDI_44735:
NS_E_44735_ETR_TBL:
NS_E_44735_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_45769
LB_45768:
	add r14,1
LB_45769:
	cmp r14,r10
	jge LB_45770
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45768
	cmp al,10
	jz LB_45768
	cmp al,32
	jz LB_45768
LB_45770:
	push r10
	call NS_E_44737_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45771
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44735_MTC_0_failed
LB_45771:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ mtc_test_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45777:
	jmp LB_45774
LB_45773:
	add r14,1
LB_45774:
	cmp r14,r10
	jge LB_45775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45773
	cmp al,10
	jz LB_45773
	cmp al,32
	jz LB_45773
LB_45775:
	push r10
	push rsi
	call NS_E_44739_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45776
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45778
	bts QWORD [rax],0
LB_45778:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45777
LB_45776:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45765
	btr QWORD [rdi],1
LB_45765:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45766
	btr QWORD [rdi],0
LB_45766:
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
NS_E_44735_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
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
NS_E_44735_MTC_1_failed:
	add rsp,0
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
NS_E_44737:
NS_E_RDI_44737:
NS_E_44737_ETR_TBL:
NS_E_44737_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_45810
LB_45809:
	add r14,1
LB_45810:
	cmp r14,r10
	jge LB_45811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45809
	cmp al,10
	jz LB_45809
	cmp al,32
	jz LB_45809
LB_45811:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45812
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44737_MTC_0_failed
LB_45812:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_45815
LB_45814:
	add r14,1
LB_45815:
	cmp r14,r10
	jge LB_45816
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45814
	cmp al,10
	jz LB_45814
	cmp al,32
	jz LB_45814
LB_45816:
	add r14,3
	cmp r14,r10
	jg LB_45820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_45820
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_45820
	jmp LB_45821
LB_45820:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45818
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45818:
	jmp NS_E_44737_MTC_0_failed
LB_45821:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_45823
LB_45822:
	add r14,1
LB_45823:
	cmp r14,r10
	jge LB_45824
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45822
	cmp al,10
	jz LB_45822
	cmp al,32
	jz LB_45822
LB_45824:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45825
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45826
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45826:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45827
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45827:
	jmp NS_E_44737_MTC_0_failed
LB_45825:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_45830
LB_45829:
	add r14,1
LB_45830:
	cmp r14,r10
	jge LB_45831
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45829
	cmp al,10
	jz LB_45829
	cmp al,32
	jz LB_45829
LB_45831:
	add r14,3
	cmp r14,r10
	jg LB_45837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_45837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_45837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_45837
	jmp LB_45838
LB_45837:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45833
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45833:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45834
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45834:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45835
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45835:
	jmp NS_E_44737_MTC_0_failed
LB_45838:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
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
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_45843
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_45843:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_45844
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_45844:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45845
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45845:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45846
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45846:
	jmp NS_E_44737_MTC_0_failed
LB_45842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_45803
	btr QWORD [rdi],4
LB_45803:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45804
	btr QWORD [rdi],3
LB_45804:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45805
	btr QWORD [rdi],2
LB_45805:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45806
	btr QWORD [rdi],1
LB_45806:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45807
	btr QWORD [rdi],0
LB_45807:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44737_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_45784
LB_45783:
	add r14,1
LB_45784:
	cmp r14,r10
	jge LB_45785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45783
	cmp al,10
	jz LB_45783
	cmp al,32
	jz LB_45783
LB_45785:
	push r10
	call NS_E_44741_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45786
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44737_MTC_1_failed
LB_45786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_45789
LB_45788:
	add r14,1
LB_45789:
	cmp r14,r10
	jge LB_45790
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45788
	cmp al,10
	jz LB_45788
	cmp al,32
	jz LB_45788
LB_45790:
	add r14,1
	cmp r14,r10
	jg LB_45794
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_45794
	jmp LB_45795
LB_45794:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45792
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45792:
	jmp NS_E_44737_MTC_1_failed
LB_45795:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_45797
LB_45796:
	add r14,1
LB_45797:
	cmp r14,r10
	jge LB_45798
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45796
	cmp al,10
	jz LB_45796
	cmp al,32
	jz LB_45796
LB_45798:
	push r10
	call NS_E_44741_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45799
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45800
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45800:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45801
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45801:
	jmp NS_E_44737_MTC_1_failed
LB_45799:
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
	jc LB_45779
	btr QWORD [rdi],2
LB_45779:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45780
	btr QWORD [rdi],1
LB_45780:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45781
	btr QWORD [rdi],0
LB_45781:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44737_MTC_1_failed:
	add rsp,48
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
NS_E_44739:
NS_E_RDI_44739:
NS_E_44739_ETR_TBL:
NS_E_44739_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_45852
LB_45851:
	add r14,1
LB_45852:
	cmp r14,r10
	jge LB_45853
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45851
	cmp al,10
	jz LB_45851
	cmp al,32
	jz LB_45851
LB_45853:
	add r14,1
	cmp r14,r10
	jg LB_45856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_45856
	jmp LB_45857
LB_45856:
	jmp NS_E_44739_MTC_0_failed
LB_45857:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_45859
LB_45858:
	add r14,1
LB_45859:
	cmp r14,r10
	jge LB_45860
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45858
	cmp al,10
	jz LB_45858
	cmp al,32
	jz LB_45858
LB_45860:
	push r10
	call NS_E_44737_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45861
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45862
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45862:
	jmp NS_E_44739_MTC_0_failed
LB_45861:
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
	jc LB_45848
	btr QWORD [rdi],1
LB_45848:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45849
	btr QWORD [rdi],0
LB_45849:
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
NS_E_44739_MTC_0_failed:
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
NS_E_44741:
NS_E_RDI_44741:
NS_E_44741_ETR_TBL:
NS_E_44741_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
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
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45877
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44741_MTC_0_failed
LB_45877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_45880
LB_45879:
	add r14,1
LB_45880:
	cmp r14,r10
	jge LB_45881
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45879
	cmp al,10
	jz LB_45879
	cmp al,32
	jz LB_45879
LB_45881:
	add r14,1
	cmp r14,r10
	jg LB_45885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_45885
	jmp LB_45886
LB_45885:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45883
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45883:
	jmp NS_E_44741_MTC_0_failed
LB_45886:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45871
	btr QWORD [rdi],1
LB_45871:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45872
	btr QWORD [rdi],0
LB_45872:
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
NS_E_44741_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_45867
LB_45866:
	add r14,1
LB_45867:
	cmp r14,r10
	jge LB_45868
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45866
	cmp al,10
	jz LB_45866
	cmp al,32
	jz LB_45866
LB_45868:
	push r10
	call NS_E_44656_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45869
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44741_MTC_1_failed
LB_45869:
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
	jc LB_45864
	btr QWORD [rdi],0
LB_45864:
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
NS_E_44741_MTC_1_failed:
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
NS_E_44743:
NS_E_RDI_44743:
NS_E_44743_ETR_TBL:
NS_E_44743_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_45899
LB_45898:
	add r14,1
LB_45899:
	cmp r14,r10
	jge LB_45900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45898
	cmp al,10
	jz LB_45898
	cmp al,32
	jz LB_45898
LB_45900:
	add r14,1
	cmp r14,r10
	jg LB_45903
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_45903
	jmp LB_45904
LB_45903:
	jmp NS_E_44743_MTC_0_failed
LB_45904:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ reg_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45909:
	jmp LB_45906
LB_45905:
	add r14,1
LB_45906:
	cmp r14,r10
	jge LB_45907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45905
	cmp al,10
	jz LB_45905
	cmp al,32
	jz LB_45905
LB_45907:
	push r10
	push rsi
	call NS_E_44743_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45908
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45910
	bts QWORD [rax],0
LB_45910:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45909
LB_45908:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_45912
LB_45911:
	add r14,1
LB_45912:
	cmp r14,r10
	jge LB_45913
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45911
	cmp al,10
	jz LB_45911
	cmp al,32
	jz LB_45911
LB_45913:
	add r14,1
	cmp r14,r10
	jg LB_45918
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_45918
	jmp LB_45919
LB_45918:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45915
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45915:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45916
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45916:
	jmp NS_E_44743_MTC_0_failed
LB_45919:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45894
	btr QWORD [rdi],2
LB_45894:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45895
	btr QWORD [rdi],1
LB_45895:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45896
	btr QWORD [rdi],0
LB_45896:
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
NS_E_44743_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_45890
LB_45889:
	add r14,1
LB_45890:
	cmp r14,r10
	jge LB_45891
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45889
	cmp al,10
	jz LB_45889
	cmp al,32
	jz LB_45889
LB_45891:
	push r10
	call NS_E_44745_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45892
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44743_MTC_1_failed
LB_45892:
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
	jc LB_45887
	btr QWORD [rdi],0
LB_45887:
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
NS_E_44743_MTC_1_failed:
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
NS_E_44745:
NS_E_RDI_44745:
NS_E_44745_ETR_TBL:
NS_E_44745_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_45944
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_45944
	jmp LB_45945
LB_45944:
	jmp NS_E_44745_MTC_0_failed
LB_45945:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45949
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45950
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45950:
	jmp NS_E_44745_MTC_0_failed
LB_45949:
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
	jc LB_45936
	btr QWORD [rdi],1
LB_45936:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45937
	btr QWORD [rdi],0
LB_45937:
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
NS_E_44745_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45934
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44745_MTC_1_failed
LB_45934:
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
	jc LB_45929
	btr QWORD [rdi],0
LB_45929:
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
NS_E_44745_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_45927
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_45927
	jmp LB_45928
LB_45927:
	jmp NS_E_44745_MTC_2_failed
LB_45928:
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
	jc LB_45920
	btr QWORD [rdi],0
LB_45920:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44745_MTC_2_failed:
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
NS_E_44747:
NS_E_RDI_44747:
NS_E_44747_ETR_TBL:
NS_E_44747_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_45957
LB_45956:
	add r14,1
LB_45957:
	cmp r14,r10
	jge LB_45958
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45956
	cmp al,10
	jz LB_45956
	cmp al,32
	jz LB_45956
LB_45958:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45959
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44747_MTC_0_failed
LB_45959:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_45962
LB_45961:
	add r14,1
LB_45962:
	cmp r14,r10
	jge LB_45963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45961
	cmp al,10
	jz LB_45961
	cmp al,32
	jz LB_45961
LB_45963:
	push r10
	call NS_E_44751_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45964
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45965
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45965:
	jmp NS_E_44747_MTC_0_failed
LB_45964:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ dt_etr_coprd ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_45971:
	jmp LB_45968
LB_45967:
	add r14,1
LB_45968:
	cmp r14,r10
	jge LB_45969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45967
	cmp al,10
	jz LB_45967
	cmp al,32
	jz LB_45967
LB_45969:
	push r10
	push rsi
	call NS_E_44751_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_45970
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_45972
	bts QWORD [rax],0
LB_45972:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_45971
LB_45970:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45952
	btr QWORD [rdi],2
LB_45952:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45953
	btr QWORD [rdi],1
LB_45953:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45954
	btr QWORD [rdi],0
LB_45954:
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
NS_E_44747_MTC_0_failed:
	add rsp,48
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
NS_E_44749:
NS_E_RDI_44749:
NS_E_44749_ETR_TBL:
NS_E_44749_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_45979
LB_45978:
	add r14,1
LB_45979:
	cmp r14,r10
	jge LB_45980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45978
	cmp al,10
	jz LB_45978
	cmp al,32
	jz LB_45978
LB_45980:
	add r14,1
	cmp r14,r10
	jg LB_45983
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_45983
	jmp LB_45984
LB_45983:
	jmp NS_E_44749_MTC_0_failed
LB_45984:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_45986
LB_45985:
	add r14,1
LB_45986:
	cmp r14,r10
	jge LB_45987
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45985
	cmp al,10
	jz LB_45985
	cmp al,32
	jz LB_45985
LB_45987:
	add r14,1
	cmp r14,r10
	jg LB_45991
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_45991
	jmp LB_45992
LB_45991:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45989:
	jmp NS_E_44749_MTC_0_failed
LB_45992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_45994
LB_45993:
	add r14,1
LB_45994:
	cmp r14,r10
	jge LB_45995
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_45993
	cmp al,10
	jz LB_45993
	cmp al,32
	jz LB_45993
LB_45995:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_45996
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_45997
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_45997:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_45998
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_45998:
	jmp NS_E_44749_MTC_0_failed
LB_45996:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
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
	call NS_E_44751_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46003
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46004
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46004:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46005
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46005:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46006
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46006:
	jmp NS_E_44749_MTC_0_failed
LB_46003:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_45973
	btr QWORD [rdi],3
LB_45973:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_45974
	btr QWORD [rdi],2
LB_45974:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_45975
	btr QWORD [rdi],1
LB_45975:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_45976
	btr QWORD [rdi],0
LB_45976:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44749_MTC_0_failed:
	add rsp,64
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
NS_E_44751:
NS_E_RDI_44751:
NS_E_44751_ETR_TBL:
NS_E_44751_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_46014
LB_46013:
	add r14,1
LB_46014:
	cmp r14,r10
	jge LB_46015
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46013
	cmp al,10
	jz LB_46013
	cmp al,32
	jz LB_46013
LB_46015:
	add r14,3
	cmp r14,r10
	jg LB_46018
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46018
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_46018
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_46018
	jmp LB_46019
LB_46018:
	jmp NS_E_44751_MTC_0_failed
LB_46019:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_46021
LB_46020:
	add r14,1
LB_46021:
	cmp r14,r10
	jge LB_46022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46020
	cmp al,10
	jz LB_46020
	cmp al,32
	jz LB_46020
LB_46022:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46023
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46024
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46024:
	jmp NS_E_44751_MTC_0_failed
LB_46023:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_46027
LB_46026:
	add r14,1
LB_46027:
	cmp r14,r10
	jge LB_46028
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46026
	cmp al,10
	jz LB_46026
	cmp al,32
	jz LB_46026
LB_46028:
	add r14,1
	cmp r14,r10
	jg LB_46033
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_46033
	jmp LB_46034
LB_46033:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46030
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46030:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46031
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46031:
	jmp NS_E_44751_MTC_0_failed
LB_46034:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_46036
LB_46035:
	add r14,1
LB_46036:
	cmp r14,r10
	jge LB_46037
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46035
	cmp al,10
	jz LB_46035
	cmp al,32
	jz LB_46035
LB_46037:
	push r10
	call NS_E_44753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46038
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46039
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46039:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46040
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46040:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46041
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46041:
	jmp NS_E_44751_MTC_0_failed
LB_46038:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46008
	btr QWORD [rdi],3
LB_46008:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46009
	btr QWORD [rdi],2
LB_46009:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46010
	btr QWORD [rdi],1
LB_46010:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46011
	btr QWORD [rdi],0
LB_46011:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44751_MTC_0_failed:
	add rsp,64
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
NS_E_44753:
NS_E_RDI_44753:
NS_E_44753_ETR_TBL:
NS_E_44753_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_46070
LB_46069:
	add r14,1
LB_46070:
	cmp r14,r10
	jge LB_46071
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46069
	cmp al,10
	jz LB_46069
	cmp al,32
	jz LB_46069
LB_46071:
	push r10
	call NS_E_44755_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46072
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44753_MTC_0_failed
LB_46072:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	call LB_46043
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46067
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46067:
NS_E_44753_MTC_0_failed:
	add rsp,16
	pop r14
	jmp LB_46044
LB_46043:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_46055
LB_46054:
	add r14,1
LB_46055:
	cmp r14,r10
	jge LB_46056
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46054
	cmp al,10
	jz LB_46054
	cmp al,32
	jz LB_46054
LB_46056:
	add r14,3
	cmp r14,r10
	jg LB_46059
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46059
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_46059
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_46059
	jmp LB_46060
LB_46059:
	jmp NS_E_46045_MTC_0_failed
LB_46060:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_46062
LB_46061:
	add r14,1
LB_46062:
	cmp r14,r10
	jge LB_46063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46061
	cmp al,10
	jz LB_46061
	cmp al,32
	jz LB_46061
LB_46063:
	push r10
	call NS_E_44753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46064
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46065
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46065:
	jmp NS_E_46045_MTC_0_failed
LB_46064:
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
	jc LB_46049
	btr QWORD [rdi],1
LB_46049:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46050
	btr QWORD [rdi],0
LB_46050:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46052
	btr QWORD [rdi],0
LB_46052:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46045_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46047
	btr QWORD [rdi],0
LB_46047:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46045_MTC_1_failed:
	add rsp,0
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
LB_46044:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44755:
NS_E_RDI_44755:
NS_E_44755_ETR_TBL:
NS_E_44755_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_46101
LB_46100:
	add r14,1
LB_46101:
	cmp r14,r10
	jge LB_46102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46100
	cmp al,10
	jz LB_46100
	cmp al,32
	jz LB_46100
LB_46102:
	push r10
	call NS_E_44757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46103
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44755_MTC_0_failed
LB_46103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	call LB_46074
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46098:
NS_E_44755_MTC_0_failed:
	add rsp,16
	pop r14
	jmp LB_46075
LB_46074:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_46086
LB_46085:
	add r14,1
LB_46086:
	cmp r14,r10
	jge LB_46087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46085
	cmp al,10
	jz LB_46085
	cmp al,32
	jz LB_46085
LB_46087:
	add r14,3
	cmp r14,r10
	jg LB_46090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_46090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_46090
	jmp LB_46091
LB_46090:
	jmp NS_E_46076_MTC_0_failed
LB_46091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_46093
LB_46092:
	add r14,1
LB_46093:
	cmp r14,r10
	jge LB_46094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46092
	cmp al,10
	jz LB_46092
	cmp al,32
	jz LB_46092
LB_46094:
	push r10
	call NS_E_44757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46095
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46096
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46096:
	jmp NS_E_46076_MTC_0_failed
LB_46095:
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
	jc LB_46080
	btr QWORD [rdi],1
LB_46080:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46081
	btr QWORD [rdi],0
LB_46081:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46083
	btr QWORD [rdi],0
LB_46083:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46076_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46078
	btr QWORD [rdi],0
LB_46078:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46076_MTC_1_failed:
	add rsp,0
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
LB_46075:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44757:
NS_E_RDI_44757:
NS_E_44757_ETR_TBL:
NS_E_44757_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_46115
LB_46114:
	add r14,1
LB_46115:
	cmp r14,r10
	jge LB_46116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46114
	cmp al,10
	jz LB_46114
	cmp al,32
	jz LB_46114
LB_46116:
	push r10
	call NS_E_44759_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46117
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44757_MTC_0_failed
LB_46117:
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
	jc LB_46112
	btr QWORD [rdi],0
LB_46112:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44757_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_46108
LB_46107:
	add r14,1
LB_46108:
	cmp r14,r10
	jge LB_46109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46107
	cmp al,10
	jz LB_46107
	cmp al,32
	jz LB_46107
LB_46109:
	push r10
	call NS_E_43932_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46110
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44757_MTC_1_failed
LB_46110:
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
	jc LB_46105
	btr QWORD [rdi],0
LB_46105:
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
NS_E_44757_MTC_1_failed:
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
NS_E_44759:
NS_E_RDI_44759:
NS_E_44759_ETR_TBL:
NS_E_44759_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46125
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44759_MTC_0_failed
LB_46125:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_46133
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_46133
	jmp LB_46134
LB_46133:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46131
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46131:
	jmp NS_E_44759_MTC_0_failed
LB_46134:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46119
	btr QWORD [rdi],1
LB_46119:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46120
	btr QWORD [rdi],0
LB_46120:
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
NS_E_44759_MTC_0_failed:
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
NS_E_44761:
NS_E_RDI_44761:
NS_E_44761_ETR_TBL:
NS_E_44761_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_46165
LB_46164:
	add r14,1
LB_46165:
	cmp r14,r10
	jge LB_46166
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46164
	cmp al,10
	jz LB_46164
	cmp al,32
	jz LB_46164
LB_46166:
	add r14,1
	cmp r14,r10
	jg LB_46169
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_46169
	jmp LB_46170
LB_46169:
	jmp NS_E_44761_MTC_0_failed
LB_46170:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_46172
LB_46171:
	add r14,1
LB_46172:
	cmp r14,r10
	jge LB_46173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46171
	cmp al,10
	jz LB_46171
	cmp al,32
	jz LB_46171
LB_46173:
	add r14,1
	cmp r14,r10
	jg LB_46177
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_46177
	jmp LB_46178
LB_46177:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46175
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46175:
	jmp NS_E_44761_MTC_0_failed
LB_46178:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_46180
LB_46179:
	add r14,1
LB_46180:
	cmp r14,r10
	jge LB_46181
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46179
	cmp al,10
	jz LB_46179
	cmp al,32
	jz LB_46179
LB_46181:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46182
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46183
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46183:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46184
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46184:
	jmp NS_E_44761_MTC_0_failed
LB_46182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	call LB_46135
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46160
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46160:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46161
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46161:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46162
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46162:
NS_E_44761_MTC_0_failed:
	add rsp,48
	pop r14
	jmp LB_46136
LB_46135:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_46156
LB_46155:
	add r14,1
LB_46156:
	cmp r14,r10
	jge LB_46157
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46155
	cmp al,10
	jz LB_46155
	cmp al,32
	jz LB_46155
LB_46157:
	push r10
	call NS_E_44763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46158
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_46137_MTC_0_failed
LB_46158:
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
	jc LB_46149
	btr QWORD [rdi],0
LB_46149:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46151
	btr QWORD [rdi],2
LB_46151:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46152
	btr QWORD [rdi],1
LB_46152:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46153
	btr QWORD [rdi],0
LB_46153:
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
NS_E_46137_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_46145
LB_46144:
	add r14,1
LB_46145:
	cmp r14,r10
	jge LB_46146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46144
	cmp al,10
	jz LB_46144
	cmp al,32
	jz LB_46144
LB_46146:
	push r10
	call NS_E_44771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_46137_MTC_1_failed
LB_46147:
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
	jc LB_46138
	btr QWORD [rdi],0
LB_46138:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46140
	btr QWORD [rdi],2
LB_46140:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46141
	btr QWORD [rdi],1
LB_46141:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46142
	btr QWORD [rdi],0
LB_46142:
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
NS_E_46137_MTC_1_failed:
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
LB_46136:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44763:
NS_E_RDI_44763:
NS_E_44763_ETR_TBL:
NS_E_44763_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_46359
LB_46358:
	add r14,1
LB_46359:
	cmp r14,r10
	jge LB_46360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46358
	cmp al,10
	jz LB_46358
	cmp al,32
	jz LB_46358
LB_46360:
	push r10
	call NS_E_44769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46361
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44763_MTC_0_failed
LB_46361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_46367:
	jmp LB_46364
LB_46363:
	add r14,1
LB_46364:
	cmp r14,r10
	jge LB_46365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46363
	cmp al,10
	jz LB_46363
	cmp al,32
	jz LB_46363
LB_46365:
	push r10
	push rsi
	call NS_E_44765_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_46366
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_46368
	bts QWORD [rax],0
LB_46368:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_46367
LB_46366:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	call LB_46186
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46355
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46355:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46356
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46356:
NS_E_44763_MTC_0_failed:
	add rsp,32
	pop r14
	jmp LB_46187
LB_46186:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; ";"
	jmp LB_46225
LB_46224:
	add r14,1
LB_46225:
	cmp r14,r10
	jge LB_46226
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46224
	cmp al,10
	jz LB_46224
	cmp al,32
	jz LB_46224
LB_46226:
	add r14,1
	cmp r14,r10
	jg LB_46229
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_46229
	jmp LB_46230
LB_46229:
	jmp NS_E_46188_MTC_0_failed
LB_46230:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_46232
LB_46231:
	add r14,1
LB_46232:
	cmp r14,r10
	jge LB_46233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46231
	cmp al,10
	jz LB_46231
	cmp al,32
	jz LB_46231
LB_46233:
	add r14,3
	cmp r14,r10
	jg LB_46237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46237
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46237
	jmp LB_46238
LB_46237:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46235
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46235:
	jmp NS_E_46188_MTC_0_failed
LB_46238:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_46240
LB_46239:
	add r14,1
LB_46240:
	cmp r14,r10
	jge LB_46241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46239
	cmp al,10
	jz LB_46239
	cmp al,32
	jz LB_46239
LB_46241:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46242
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46243
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46243:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46244:
	jmp NS_E_46188_MTC_0_failed
LB_46242:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_46247
LB_46246:
	add r14,1
LB_46247:
	cmp r14,r10
	jge LB_46248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46246
	cmp al,10
	jz LB_46246
	cmp al,32
	jz LB_46246
LB_46248:
	push r10
	call NS_E_44763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46249
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46250
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46250:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46251
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46251:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46252
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46252:
	jmp NS_E_46188_MTC_0_failed
LB_46249:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46216
	btr QWORD [rdi],3
LB_46216:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46217
	btr QWORD [rdi],2
LB_46217:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46218
	btr QWORD [rdi],1
LB_46218:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46219
	btr QWORD [rdi],0
LB_46219:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46221
	btr QWORD [rdi],1
LB_46221:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46222
	btr QWORD [rdi],0
LB_46222:
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
NS_E_46188_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_46197
LB_46196:
	add r14,1
LB_46197:
	cmp r14,r10
	jge LB_46198
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46196
	cmp al,10
	jz LB_46196
	cmp al,32
	jz LB_46196
LB_46198:
	add r14,3
	cmp r14,r10
	jg LB_46201
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46201
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46201
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46201
	jmp LB_46202
LB_46201:
	jmp NS_E_46188_MTC_1_failed
LB_46202:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_46204
LB_46203:
	add r14,1
LB_46204:
	cmp r14,r10
	jge LB_46205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46203
	cmp al,10
	jz LB_46203
	cmp al,32
	jz LB_46203
LB_46205:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46206
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46207:
	jmp NS_E_46188_MTC_1_failed
LB_46206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_46210
LB_46209:
	add r14,1
LB_46210:
	cmp r14,r10
	jge LB_46211
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46209
	cmp al,10
	jz LB_46209
	cmp al,32
	jz LB_46209
LB_46211:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46212
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46213
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46213:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46214
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46214:
	jmp NS_E_46188_MTC_1_failed
LB_46212:
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
	jc LB_46189
	btr QWORD [rdi],2
LB_46189:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46190
	btr QWORD [rdi],1
LB_46190:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46191
	btr QWORD [rdi],0
LB_46191:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46193
	btr QWORD [rdi],1
LB_46193:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46194
	btr QWORD [rdi],0
LB_46194:
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
NS_E_46188_MTC_1_failed:
	add rsp,48
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
LB_46187:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_46345
LB_46344:
	add r14,1
LB_46345:
	cmp r14,r10
	jge LB_46346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46344
	cmp al,10
	jz LB_46344
	cmp al,32
	jz LB_46344
LB_46346:
	push r10
	call NS_E_44767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46347
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44763_MTC_1_failed
LB_46347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_46353:
	jmp LB_46350
LB_46349:
	add r14,1
LB_46350:
	cmp r14,r10
	jge LB_46351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46349
	cmp al,10
	jz LB_46349
	cmp al,32
	jz LB_46349
LB_46351:
	push r10
	push rsi
	call NS_E_44765_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_46352
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_46354
	bts QWORD [rax],0
LB_46354:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_46353
LB_46352:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	call LB_46254
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46341
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46341:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46342
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46342:
NS_E_44763_MTC_1_failed:
	add rsp,32
	pop r14
	jmp LB_46255
LB_46254:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_46303
LB_46302:
	add r14,1
LB_46303:
	cmp r14,r10
	jge LB_46304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46302
	cmp al,10
	jz LB_46302
	cmp al,32
	jz LB_46302
LB_46304:
	add r14,1
	cmp r14,r10
	jg LB_46307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_46307
	jmp LB_46308
LB_46307:
	jmp NS_E_46256_MTC_0_failed
LB_46308:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_46310
LB_46309:
	add r14,1
LB_46310:
	cmp r14,r10
	jge LB_46311
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46309
	cmp al,10
	jz LB_46309
	cmp al,32
	jz LB_46309
LB_46311:
	add r14,3
	cmp r14,r10
	jg LB_46315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46315
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46315
	jmp LB_46316
LB_46315:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46313
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46313:
	jmp NS_E_46256_MTC_0_failed
LB_46316:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_46318
LB_46317:
	add r14,1
LB_46318:
	cmp r14,r10
	jge LB_46319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46317
	cmp al,10
	jz LB_46317
	cmp al,32
	jz LB_46317
LB_46319:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46320
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46321
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46321:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46322
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46322:
	jmp NS_E_46256_MTC_0_failed
LB_46320:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_46325
LB_46324:
	add r14,1
LB_46325:
	cmp r14,r10
	jge LB_46326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46324
	cmp al,10
	jz LB_46324
	cmp al,32
	jz LB_46324
LB_46326:
	push r10
	call NS_E_44763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46327
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46328
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46328:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46329
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46329:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46330
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46330:
	jmp NS_E_46256_MTC_0_failed
LB_46327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_46333
LB_46332:
	add r14,1
LB_46333:
	cmp r14,r10
	jge LB_46334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46332
	cmp al,10
	jz LB_46332
	cmp al,32
	jz LB_46332
LB_46334:
	push r10
	call NS_E_44763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46335
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_46336
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_46336:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46337
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46337:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46338
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46338:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46339
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46339:
	jmp NS_E_46256_MTC_0_failed
LB_46335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_46293
	btr QWORD [rdi],4
LB_46293:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46294
	btr QWORD [rdi],3
LB_46294:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46295
	btr QWORD [rdi],2
LB_46295:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46296
	btr QWORD [rdi],1
LB_46296:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46297
	btr QWORD [rdi],0
LB_46297:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46299
	btr QWORD [rdi],1
LB_46299:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46300
	btr QWORD [rdi],0
LB_46300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46256_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_46266
LB_46265:
	add r14,1
LB_46266:
	cmp r14,r10
	jge LB_46267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46265
	cmp al,10
	jz LB_46265
	cmp al,32
	jz LB_46265
LB_46267:
	add r14,3
	cmp r14,r10
	jg LB_46270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_46270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_46270
	jmp LB_46271
LB_46270:
	jmp NS_E_46256_MTC_1_failed
LB_46271:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_46273
LB_46272:
	add r14,1
LB_46273:
	cmp r14,r10
	jge LB_46274
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46272
	cmp al,10
	jz LB_46272
	cmp al,32
	jz LB_46272
LB_46274:
	push r10
	call NS_E_44743_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46275
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46276
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46276:
	jmp NS_E_46256_MTC_1_failed
LB_46275:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_46279
LB_46278:
	add r14,1
LB_46279:
	cmp r14,r10
	jge LB_46280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46278
	cmp al,10
	jz LB_46278
	cmp al,32
	jz LB_46278
LB_46280:
	push r10
	call NS_E_44719_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46281
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46282
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46282:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46283
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46283:
	jmp NS_E_46256_MTC_1_failed
LB_46281:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_46286
LB_46285:
	add r14,1
LB_46286:
	cmp r14,r10
	jge LB_46287
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46285
	cmp al,10
	jz LB_46285
	cmp al,32
	jz LB_46285
LB_46287:
	push r10
	call NS_E_44763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46288
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46289
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46289:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46290
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46290:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46291
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46291:
	jmp NS_E_46256_MTC_1_failed
LB_46288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_46257
	btr QWORD [rdi],3
LB_46257:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46258
	btr QWORD [rdi],2
LB_46258:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46259
	btr QWORD [rdi],1
LB_46259:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46260
	btr QWORD [rdi],0
LB_46260:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46262
	btr QWORD [rdi],1
LB_46262:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46263
	btr QWORD [rdi],0
LB_46263:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46256_MTC_1_failed:
	add rsp,64
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
LB_46255:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44765:
NS_E_RDI_44765:
NS_E_44765_ETR_TBL:
NS_E_44765_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
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
	add r14,3
	cmp r14,r10
	jg LB_46392
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46392
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_46392
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_46392
	jmp LB_46393
LB_46392:
	jmp NS_E_44765_MTC_0_failed
LB_46393:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_46395
LB_46394:
	add r14,1
LB_46395:
	cmp r14,r10
	jge LB_46396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46394
	cmp al,10
	jz LB_46394
	cmp al,32
	jz LB_46394
LB_46396:
	push r10
	call NS_E_44765_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46397
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46398
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46398:
	jmp NS_E_44765_MTC_0_failed
LB_46397:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_46401
LB_46400:
	add r14,1
LB_46401:
	cmp r14,r10
	jge LB_46402
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46400
	cmp al,10
	jz LB_46400
	cmp al,32
	jz LB_46400
LB_46402:
	add r14,3
	cmp r14,r10
	jg LB_46407
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46407
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_46407
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_46407
	jmp LB_46408
LB_46407:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46404
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46404:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46405:
	jmp NS_E_44765_MTC_0_failed
LB_46408:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46383
	btr QWORD [rdi],2
LB_46383:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46384
	btr QWORD [rdi],1
LB_46384:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46385
	btr QWORD [rdi],0
LB_46385:
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
NS_E_44765_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_46379
LB_46378:
	add r14,1
LB_46379:
	cmp r14,r10
	jge LB_46380
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46378
	cmp al,10
	jz LB_46378
	cmp al,32
	jz LB_46378
LB_46380:
	push r10
	call NS_E_43455_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46381
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44765_MTC_1_failed
LB_46381:
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
	jc LB_46376
	btr QWORD [rdi],0
LB_46376:
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
NS_E_44765_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_46372
LB_46371:
	add r14,1
LB_46372:
	cmp r14,r10
	jge LB_46373
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46371
	cmp al,10
	jz LB_46371
	cmp al,32
	jz LB_46371
LB_46373:
	push r10
	call NS_E_44621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46374
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44765_MTC_2_failed
LB_46374:
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
	jc LB_46369
	btr QWORD [rdi],0
LB_46369:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44765_MTC_2_failed:
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
NS_E_44767:
NS_E_RDI_44767:
NS_E_44767_ETR_TBL:
NS_E_44767_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_46430
LB_46429:
	add r14,1
LB_46430:
	cmp r14,r10
	jge LB_46431
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46429
	cmp al,10
	jz LB_46429
	cmp al,32
	jz LB_46429
LB_46431:
	add r14,4
	cmp r14,r10
	jg LB_46434
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_46434
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_46434
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_46434
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_46434
	jmp LB_46435
LB_46434:
	jmp NS_E_44767_MTC_0_failed
LB_46435:
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
	jc LB_46427
	btr QWORD [rdi],0
LB_46427:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44767_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_46421
LB_46420:
	add r14,1
LB_46421:
	cmp r14,r10
	jge LB_46422
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46420
	cmp al,10
	jz LB_46420
	cmp al,32
	jz LB_46420
LB_46422:
	add r14,4
	cmp r14,r10
	jg LB_46425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_46425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_46425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_46425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_46425
	jmp LB_46426
LB_46425:
	jmp NS_E_44767_MTC_1_failed
LB_46426:
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
	jc LB_46418
	btr QWORD [rdi],0
LB_46418:
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
NS_E_44767_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_46412
LB_46411:
	add r14,1
LB_46412:
	cmp r14,r10
	jge LB_46413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46411
	cmp al,10
	jz LB_46411
	cmp al,32
	jz LB_46411
LB_46413:
	add r14,3
	cmp r14,r10
	jg LB_46416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_46416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_46416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_46416
	jmp LB_46417
LB_46416:
	jmp NS_E_44767_MTC_2_failed
LB_46417:
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
	jc LB_46409
	btr QWORD [rdi],0
LB_46409:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44767_MTC_2_failed:
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
NS_E_44769:
NS_E_RDI_44769:
NS_E_44769_ETR_TBL:
NS_E_44769_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_46457
LB_46456:
	add r14,1
LB_46457:
	cmp r14,r10
	jge LB_46458
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46456
	cmp al,10
	jz LB_46456
	cmp al,32
	jz LB_46456
LB_46458:
	add r14,5
	cmp r14,r10
	jg LB_46461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_46461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_46461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_46461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_46461
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_46461
	jmp LB_46462
LB_46461:
	jmp NS_E_44769_MTC_0_failed
LB_46462:
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
	jc LB_46454
	btr QWORD [rdi],0
LB_46454:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44769_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_46448
LB_46447:
	add r14,1
LB_46448:
	cmp r14,r10
	jge LB_46449
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46447
	cmp al,10
	jz LB_46447
	cmp al,32
	jz LB_46447
LB_46449:
	add r14,5
	cmp r14,r10
	jg LB_46452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_46452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_46452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_46452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_46452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_46452
	jmp LB_46453
LB_46452:
	jmp NS_E_44769_MTC_1_failed
LB_46453:
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
	jc LB_46445
	btr QWORD [rdi],0
LB_46445:
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
NS_E_44769_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_46439
LB_46438:
	add r14,1
LB_46439:
	cmp r14,r10
	jge LB_46440
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46438
	cmp al,10
	jz LB_46438
	cmp al,32
	jz LB_46438
LB_46440:
	add r14,4
	cmp r14,r10
	jg LB_46443
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_46443
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_46443
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_46443
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_46443
	jmp LB_46444
LB_46443:
	jmp NS_E_44769_MTC_2_failed
LB_46444:
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
	jc LB_46436
	btr QWORD [rdi],0
LB_46436:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44769_MTC_2_failed:
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
NS_E_44771:
NS_E_RDI_44771:
NS_E_44771_ETR_TBL:
NS_E_44771_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
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
	call NS_E_44769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46561
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44771_MTC_0_failed
LB_46561:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_46564
LB_46563:
	add r14,1
LB_46564:
	cmp r14,r10
	jge LB_46565
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46563
	cmp al,10
	jz LB_46563
	cmp al,32
	jz LB_46563
LB_46565:
	push r10
	call NS_E_44773_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46566
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46567
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46567:
	jmp NS_E_44771_MTC_0_failed
LB_46566:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_46573:
	jmp LB_46570
LB_46569:
	add r14,1
LB_46570:
	cmp r14,r10
	jge LB_46571
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46569
	cmp al,10
	jz LB_46569
	cmp al,32
	jz LB_46569
LB_46571:
	push r10
	push rsi
	call NS_E_44765_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_46572
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_46574
	bts QWORD [rax],0
LB_46574:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_46573
LB_46572:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	call LB_46463
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46554
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46554:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46555
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46555:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46556
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46556:
NS_E_44771_MTC_0_failed:
	add rsp,48
	pop r14
	jmp LB_46464
LB_46463:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_46479
LB_46478:
	add r14,1
LB_46479:
	cmp r14,r10
	jge LB_46480
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46478
	cmp al,10
	jz LB_46478
	cmp al,32
	jz LB_46478
LB_46480:
	add r14,1
	cmp r14,r10
	jg LB_46483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_46483
	jmp LB_46484
LB_46483:
	jmp NS_E_46465_MTC_0_failed
LB_46484:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_46486
LB_46485:
	add r14,1
LB_46486:
	cmp r14,r10
	jge LB_46487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46485
	cmp al,10
	jz LB_46485
	cmp al,32
	jz LB_46485
LB_46487:
	push r10
	call NS_E_44771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46488
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46489
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46489:
	jmp NS_E_46465_MTC_0_failed
LB_46488:
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
	jc LB_46471
	btr QWORD [rdi],1
LB_46471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46472
	btr QWORD [rdi],0
LB_46472:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46474
	btr QWORD [rdi],2
LB_46474:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46475
	btr QWORD [rdi],1
LB_46475:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46476
	btr QWORD [rdi],0
LB_46476:
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
NS_E_46465_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46467
	btr QWORD [rdi],2
LB_46467:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46468
	btr QWORD [rdi],1
LB_46468:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46469
	btr QWORD [rdi],0
LB_46469:
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
NS_E_46465_MTC_1_failed:
	add rsp,0
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
LB_46464:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_46538
LB_46537:
	add r14,1
LB_46538:
	cmp r14,r10
	jge LB_46539
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46537
	cmp al,10
	jz LB_46537
	cmp al,32
	jz LB_46537
LB_46539:
	push r10
	call NS_E_44767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46540
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44771_MTC_1_failed
LB_46540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_46543
LB_46542:
	add r14,1
LB_46543:
	cmp r14,r10
	jge LB_46544
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46542
	cmp al,10
	jz LB_46542
	cmp al,32
	jz LB_46542
LB_46544:
	push r10
	call NS_E_44773_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46545
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46546
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46546:
	jmp NS_E_44771_MTC_1_failed
LB_46545:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_46552:
	jmp LB_46549
LB_46548:
	add r14,1
LB_46549:
	cmp r14,r10
	jge LB_46550
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46548
	cmp al,10
	jz LB_46548
	cmp al,32
	jz LB_46548
LB_46550:
	push r10
	push rsi
	call NS_E_44765_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_46551
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_46553
	bts QWORD [rax],0
LB_46553:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_46552
LB_46551:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	call LB_46491
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_46533
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_46533:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46534
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46534:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46535
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46535:
NS_E_44771_MTC_1_failed:
	add rsp,48
	pop r14
	jmp LB_46492
LB_46491:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_46514
LB_46513:
	add r14,1
LB_46514:
	cmp r14,r10
	jge LB_46515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46513
	cmp al,10
	jz LB_46513
	cmp al,32
	jz LB_46513
LB_46515:
	add r14,1
	cmp r14,r10
	jg LB_46518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_46518
	jmp LB_46519
LB_46518:
	jmp NS_E_46493_MTC_0_failed
LB_46519:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_46521
LB_46520:
	add r14,1
LB_46521:
	cmp r14,r10
	jge LB_46522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46520
	cmp al,10
	jz LB_46520
	cmp al,32
	jz LB_46520
LB_46522:
	push r10
	call NS_E_44771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46523
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46524:
	jmp NS_E_46493_MTC_0_failed
LB_46523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_46527
LB_46526:
	add r14,1
LB_46527:
	cmp r14,r10
	jge LB_46528
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46526
	cmp al,10
	jz LB_46526
	cmp al,32
	jz LB_46526
LB_46528:
	push r10
	call NS_E_44771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46529
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_46530
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_46530:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46531:
	jmp NS_E_46493_MTC_0_failed
LB_46529:
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
	jc LB_46505
	btr QWORD [rdi],2
LB_46505:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46506
	btr QWORD [rdi],1
LB_46506:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46507
	btr QWORD [rdi],0
LB_46507:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46509
	btr QWORD [rdi],2
LB_46509:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46510
	btr QWORD [rdi],1
LB_46510:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46511
	btr QWORD [rdi],0
LB_46511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46493_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_46501
LB_46500:
	add r14,1
LB_46501:
	cmp r14,r10
	jge LB_46502
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46500
	cmp al,10
	jz LB_46500
	cmp al,32
	jz LB_46500
LB_46502:
	push r10
	call NS_E_44771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46503
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_46493_MTC_1_failed
LB_46503:
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
	jc LB_46494
	btr QWORD [rdi],0
LB_46494:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_46496
	btr QWORD [rdi],2
LB_46496:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46497
	btr QWORD [rdi],1
LB_46497:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46498
	btr QWORD [rdi],0
LB_46498:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_46493_MTC_1_failed:
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
LB_46492:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_44773:
NS_E_RDI_44773:
NS_E_44773_ETR_TBL:
NS_E_44773_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_46580
LB_46579:
	add r14,1
LB_46580:
	cmp r14,r10
	jge LB_46581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46579
	cmp al,10
	jz LB_46579
	cmp al,32
	jz LB_46579
LB_46581:
	push r10
	call NS_E_43809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_46582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_44773_MTC_0_failed
LB_46582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_46585
LB_46584:
	add r14,1
LB_46585:
	cmp r14,r10
	jge LB_46586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_46584
	cmp al,10
	jz LB_46584
	cmp al,32
	jz LB_46584
LB_46586:
	add r14,1
	cmp r14,r10
	jg LB_46590
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_46590
	jmp LB_46591
LB_46590:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_46588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_46588:
	jmp NS_E_44773_MTC_0_failed
LB_46591:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_46576
	btr QWORD [rdi],1
LB_46576:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_46577
	btr QWORD [rdi],0
LB_46577:
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
NS_E_44773_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
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
NS_E_44773_MTC_1_failed:
	add rsp,0
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
NS_E_46613:
NS_E_RDI_46613:
; » _^ ..
	mov rax,102
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
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
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_46593 : %_46593
 ; {>  %_46592~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_46593
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f44709 { %_46592 %_46593 } ⊢ { %_46594 %_46595 %_46596 } : { %_46594 %_46595 %_46596 }
 ; {>  %_46593~1':_r64 %_46592~0':_stg }
; _f44709 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_44709
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_46614
	btr r12,4
	jmp LB_46615
LB_46614:
	bts r12,4
LB_46615:
	mov r8,r9
	bt r12,3
	jc LB_46618
	btr r12,2
	jmp LB_46619
LB_46618:
	bts r12,2
LB_46619:
	mov rsi,1
	bt r12,2
	jc LB_46616
	mov rsi,0
	bt r8,0
	jc LB_46616
	jmp LB_46617
LB_46616:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_46617:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_46594 %_46595 %_46596 } ⊢ { %_46597 %_46598 %_46599 } : { %_46597 %_46598 %_46599 }
 ; {>  %_46595~1':_r64 %_46594~0':_stg %_46596~2':(_opn)◂(_p44708) }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_46620
	btr r12,3
	jmp LB_46621
LB_46620:
	bts r12,3
LB_46621:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_46624
	btr r12,4
	jmp LB_46625
LB_46624:
	bts r12,4
LB_46625:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_46622
	btr QWORD [rdi],0
	jmp LB_46623
LB_46622:
	bts QWORD [rdi],0
LB_46623:
	mov r10,r14
	bt r12,1
	jc LB_46628
	btr r12,4
	jmp LB_46629
LB_46628:
	bts r12,4
LB_46629:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_46626
	btr QWORD [rdi],1
	jmp LB_46627
LB_46626:
	bts QWORD [rdi],1
LB_46627:
	mov r10,r8
	bt r12,2
	jc LB_46632
	btr r12,4
	jmp LB_46633
LB_46632:
	bts r12,4
LB_46633:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_46630
	btr QWORD [rdi],2
	jmp LB_46631
LB_46630:
	bts QWORD [rdi],2
LB_46631:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_46634
	btr r12,3
	jmp LB_46635
LB_46634:
	bts r12,3
LB_46635:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_46638
	btr r12,4
	jmp LB_46639
LB_46638:
	bts r12,4
LB_46639:
	mov r13,r10
	bt r12,4
	jc LB_46636
	btr r12,0
	jmp LB_46637
LB_46636:
	bts r12,0
LB_46637:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_46642
	btr r12,4
	jmp LB_46643
LB_46642:
	bts r12,4
LB_46643:
	mov r14,r10
	bt r12,4
	jc LB_46640
	btr r12,1
	jmp LB_46641
LB_46640:
	bts r12,1
LB_46641:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_46646
	btr r12,4
	jmp LB_46647
LB_46646:
	bts r12,4
LB_46647:
	mov r8,r10
	bt r12,4
	jc LB_46644
	btr r12,2
	jmp LB_46645
LB_46644:
	bts r12,2
LB_46645:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "OpADL.mdls" _ ⊢ 3' : %_46600
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,3
; _f20 %_46600 ⊢ { %_46601 %_46602 } : { %_46601 %_46602 }
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46600~3':_stg %_46598~1':_r64 }
; _f20 3' ⊢ { 3' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_46654
	btr r12,0
	jmp LB_46655
LB_46654:
	bts r12,0
LB_46655:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 4' }
	mov r9,r13
	bt r12,0
	jc LB_46656
	btr r12,3
	jmp LB_46657
LB_46656:
	bts r12,3
LB_46657:
	mov r10,r14
	bt r12,1
	jc LB_46658
	btr r12,4
	jmp LB_46659
LB_46658:
	bts r12,4
LB_46659:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_46652
	btr r12,2
	jmp LB_46653
LB_46652:
	bts r12,2
LB_46653:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_46650
	btr r12,1
	jmp LB_46651
LB_46650:
	bts r12,1
LB_46651:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_46648
	btr r12,0
	jmp LB_46649
LB_46648:
	bts r12,0
LB_46649:
	add rsp,32
; _f44533 %_46602 ⊢ { %_46603 %_46604 } : { %_46603 %_46604 }
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46598~1':_r64 %_46602~4':_stg %_46601~3':_stg }
; _f44533 4' ⊢ { 4' 5' }
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
	jc LB_46668
	btr r12,0
	jmp LB_46669
LB_46668:
	bts r12,0
LB_46669:
	call NS_E_44533
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_46670
	btr r12,4
	jmp LB_46671
LB_46670:
	bts r12,4
LB_46671:
	mov r11,r14
	bt r12,1
	jc LB_46672
	btr r12,5
	jmp LB_46673
LB_46672:
	bts r12,5
LB_46673:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_46666
	btr r12,3
	jmp LB_46667
LB_46666:
	bts r12,3
LB_46667:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_46664
	btr r12,2
	jmp LB_46665
LB_46664:
	bts r12,2
LB_46665:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_46662
	btr r12,1
	jmp LB_46663
LB_46662:
	bts r12,1
LB_46663:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_46660
	btr r12,0
	jmp LB_46661
LB_46660:
	bts r12,0
LB_46661:
	add rsp,40
MTC_LB_46674:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_46675
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_46676
	bt QWORD [rax],0
	jc LB_46677
	btr r12,7
	jmp LB_46678
LB_46677:
	bts r12,7
LB_46678:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_46676:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_46679
	btr r12,6
	jmp LB_46680
LB_46679:
	bts r12,6
LB_46680:
LB_46681:
	cmp r15,0
	jz LB_46682
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_46681
LB_46682:
; » 0xr0 |~ {  } ⊢ %_46606 : %_46606
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46603~4':_stg %_46598~1':_r64 %_46605~6':_stg %_46601~3':_stg }
; 	» 0xr0 _ ⊢ 5' : %_46606
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f44709 { %_46605 %_46606 } ⊢ { %_46607 %_46608 %_46609 } : { %_46607 %_46608 %_46609 }
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46606~5':_r64 %_46603~4':_stg %_46598~1':_r64 %_46605~6':_stg %_46601~3':_stg }
; _f44709 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_46693
	btr r12,0
	jmp LB_46694
LB_46693:
	bts r12,0
LB_46694:
	mov r14,r11
	bt r12,5
	jc LB_46695
	btr r12,1
	jmp LB_46696
LB_46695:
	bts r12,1
LB_46696:
	call NS_E_44709
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_46697
	btr r12,5
	jmp LB_46698
LB_46697:
	bts r12,5
LB_46698:
	mov rcx,r14
	bt r12,1
	jc LB_46699
	btr r12,6
	jmp LB_46700
LB_46699:
	bts r12,6
LB_46700:
	mov rdx,r9
	bt r12,3
	jc LB_46703
	btr r12,7
	jmp LB_46704
LB_46703:
	bts r12,7
LB_46704:
	mov rsi,1
	bt r12,7
	jc LB_46701
	mov rsi,0
	bt rdx,0
	jc LB_46701
	jmp LB_46702
LB_46701:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rdx
	mov rdx,rax
	btr r12,7
LB_46702:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_46691
	btr r12,4
	jmp LB_46692
LB_46691:
	bts r12,4
LB_46692:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_46689
	btr r12,3
	jmp LB_46690
LB_46689:
	bts r12,3
LB_46690:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_46687
	btr r12,2
	jmp LB_46688
LB_46687:
	bts r12,2
LB_46688:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_46685
	btr r12,1
	jmp LB_46686
LB_46685:
	bts r12,1
LB_46686:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_46683
	btr r12,0
	jmp LB_46684
LB_46683:
	bts r12,0
LB_46684:
	add rsp,48
; _f21 { %_46607 %_46608 %_46609 } ⊢ { %_46610 %_46611 %_46612 } : { %_46610 %_46611 %_46612 }
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46603~4':_stg %_46607~5':_stg %_46598~1':_r64 %_46609~7':(_opn)◂(_p44708) %_46608~6':_r64 %_46601~3':_stg }
; _f21 { 5' 6' 7' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000001110.. |},{ 5' 6' 7' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_46717
	btr r12,1
	jmp LB_46718
LB_46717:
	bts r12,1
LB_46718:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_46715
	btr QWORD [rdi],0
	jmp LB_46716
LB_46715:
	bts QWORD [rdi],0
LB_46716:
	mov r14,rcx
	bt r12,6
	jc LB_46721
	btr r12,1
	jmp LB_46722
LB_46721:
	bts r12,1
LB_46722:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_46719
	btr QWORD [rdi],1
	jmp LB_46720
LB_46719:
	bts QWORD [rdi],1
LB_46720:
	mov r14,rdx
	bt r12,7
	jc LB_46725
	btr r12,1
	jmp LB_46726
LB_46725:
	bts r12,1
LB_46726:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_46723
	btr QWORD [rdi],2
	jmp LB_46724
LB_46723:
	bts QWORD [rdi],2
LB_46724:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_46729
	btr r12,1
	jmp LB_46730
LB_46729:
	bts r12,1
LB_46730:
	mov r11,r14
	bt r12,1
	jc LB_46727
	btr r12,5
	jmp LB_46728
LB_46727:
	bts r12,5
LB_46728:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_46733
	btr r12,1
	jmp LB_46734
LB_46733:
	bts r12,1
LB_46734:
	mov rcx,r14
	bt r12,1
	jc LB_46731
	btr r12,6
	jmp LB_46732
LB_46731:
	bts r12,6
LB_46732:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_46737
	btr r12,1
	jmp LB_46738
LB_46737:
	bts r12,1
LB_46738:
	mov rdx,r14
	bt r12,1
	jc LB_46735
	btr r12,7
	jmp LB_46736
LB_46735:
	bts r12,7
LB_46736:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_46713
	btr r12,4
	jmp LB_46714
LB_46713:
	bts r12,4
LB_46714:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_46711
	btr r12,3
	jmp LB_46712
LB_46711:
	bts r12,3
LB_46712:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_46709
	btr r12,2
	jmp LB_46710
LB_46709:
	bts r12,2
LB_46710:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_46707
	btr r12,1
	jmp LB_46708
LB_46707:
	bts r12,1
LB_46708:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_46705
	btr r12,0
	jmp LB_46706
LB_46705:
	bts r12,0
LB_46706:
	add rsp,48
; ∎ {  }
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46603~4':_stg %_46612~7':(_opn)◂(_p44708) %_46598~1':_r64 %_46610~5':_stg %_46601~3':_stg %_46611~6':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_46739
	mov rdi,r8
	call dlt
LB_46739:
	bt r12,0
	jc LB_46740
	mov rdi,r13
	call dlt
LB_46740:
	bt r12,4
	jc LB_46741
	mov rdi,r10
	call dlt
LB_46741:
	bt r12,7
	jc LB_46742
	mov rdi,rdx
	call dlt
LB_46742:
	bt r12,1
	jc LB_46743
	mov rdi,r14
	call dlt
LB_46743:
	bt r12,5
	jc LB_46744
	mov rdi,r11
	call dlt
LB_46744:
	bt r12,3
	jc LB_46745
	mov rdi,r9
	call dlt
LB_46745:
	bt r12,6
	jc LB_46746
	mov rdi,rcx
	call dlt
LB_46746:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_46675:
	mov r15,0
LB_46748:
	cmp r15,0
	jz LB_46749
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_46748
LB_46749:
; ∎ {  }
 ; {>  %_46599~2':(_opn)◂(_p44708) %_46597~0':_stg %_46603~4':_stg %_46598~1':_r64 %_46604~5':(_opn)◂(_stg) %_46601~3':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_46750
	mov rdi,r8
	call dlt
LB_46750:
	bt r12,0
	jc LB_46751
	mov rdi,r13
	call dlt
LB_46751:
	bt r12,4
	jc LB_46752
	mov rdi,r10
	call dlt
LB_46752:
	bt r12,1
	jc LB_46753
	mov rdi,r14
	call dlt
LB_46753:
	bt r12,5
	jc LB_46754
	mov rdi,r11
	call dlt
LB_46754:
	bt r12,3
	jc LB_46755
	mov rdi,r9
	call dlt
LB_46755:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_46747:
section .data
	NS_E_DYN_43382:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43382
	NS_E_DYN_43385:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43385
	NS_E_DYN_43386:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43386
	NS_E_DYN_43387:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43387
	NS_E_DYN_43388:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43388
	NS_E_DYN_43402:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43402
	NS_E_DYN_43445:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43445
	NS_E_DYN_43455:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43455
	NS_E_DYN_43456:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43456
	NS_E_DYN_43457:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43457
	NS_E_DYN_43666:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43666
	NS_E_DYN_43704:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43704
	NS_E_DYN_43742:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43742
	NS_E_DYN_43780:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43780
	NS_E_DYN_43809:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43809
	NS_E_DYN_43810:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43810
	NS_E_DYN_43811:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43811
	NS_E_DYN_43932:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43932
	NS_E_DYN_43988:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_43989:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_43991:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_43992:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_43994:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_43995:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_43996:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43996
	NS_E_DYN_43997:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43997
	NS_E_DYN_43998:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43998
	NS_E_DYN_44432:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44432
	NS_E_DYN_44533:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44533
	CST_DYN_44597:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_46613:
		dq 0x0000_0001_00_82_ffff
		dq 1
