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
	call NS_E_57104
	call NS_E_61604
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
NS_E_55536:
NS_E_RDI_55536:
NS_E_55536_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_55537
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_55537:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_55539:
NS_E_RDI_55539:
NS_E_55539_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_55539_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_55539_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_55540:
NS_E_RDI_55540:
NS_E_55540_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_55540_LB_0
	cmp r11,57
	ja NS_E_55540_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_55540_LB_0:
	mov rax,0
	ret
NS_E_55542:
NS_E_RDI_55542:
NS_E_55542_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_55542_LB_0
	cmp r11,122
	ja NS_E_55542_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_55542_LB_0:
	mov rax,0
	ret
NS_E_55541:
NS_E_RDI_55541:
NS_E_55541_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_55541_LB_0
	cmp r11,90
	ja NS_E_55541_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_55541_LB_0:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
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
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
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
NS_E_55538:
NS_E_RDI_55538:
NS_E_55538_ETR_TBL:
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
	jz NS_E_55538_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_55538_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_55549:
; 	|» { 0' 1' }
NS_E_RDI_55549:
MTC_LB_55550:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_55551
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
	jnc LB_55552
	bt QWORD [rax],0
	jc LB_55553
	btr r12,2
	jmp LB_55554
LB_55553:
	bts r12,2
LB_55554:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55552:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55555:
	cmp r15,0
	jz LB_55556
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55555
LB_55556:
; ∎ %_55543
 ; {>  %_55543~0':(_lst)◂(t19344'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55551:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_55557
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
	jnc LB_55558
	bt QWORD [rax],0
	jc LB_55559
	btr r12,4
	jmp LB_55560
LB_55559:
	bts r12,4
LB_55560:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55558:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_55563
	btr r12,5
	jmp LB_55564
LB_55563:
	bts r12,5
LB_55564:
	mov r8,r11
	bt r12,5
	jc LB_55561
	btr r12,2
	jmp LB_55562
LB_55561:
	bts r12,2
LB_55562:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_55567
	btr r12,5
	jmp LB_55568
LB_55567:
	bts r12,5
LB_55568:
	mov r9,r11
	bt r12,5
	jc LB_55565
	btr r12,3
	jmp LB_55566
LB_55565:
	bts r12,3
LB_55566:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55569:
	cmp r15,0
	jz LB_55570
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55569
LB_55570:
; _cns { %_55545 %_55543 } ⊢ %_55547 : %_55547
 ; {>  %_55545~2':t19344'(-1) %_55546~3':(_lst)◂(t19344'(-1)) %_55543~0':(_lst)◂(t19344'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f55549 { %_55547 %_55546 } ⊢ %_55548 : %_55548
 ; {>  %_55546~3':(_lst)◂(t19344'(-1)) %_55547~°0◂{ 2' 0' }:(_lst)◂(t19344'(-1)) }
; _f55549 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_55571
	btr r12,1
	jmp LB_55572
LB_55571:
	bts r12,1
LB_55572:
	mov r9,r13
	bt r12,0
	jc LB_55573
	btr r12,3
	jmp LB_55574
LB_55573:
	bts r12,3
LB_55574:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_55579
	btr r12,4
	jmp LB_55580
LB_55579:
	bts r12,4
LB_55580:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_55577
	btr QWORD [rdi],0
	jmp LB_55578
LB_55577:
	bts QWORD [rdi],0
LB_55578:
	mov r10,r9
	bt r12,3
	jc LB_55583
	btr r12,4
	jmp LB_55584
LB_55583:
	bts r12,4
LB_55584:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_55581
	btr QWORD [rdi],1
	jmp LB_55582
LB_55581:
	bts QWORD [rdi],1
LB_55582:
	mov rsi,1
	bt r12,0
	jc LB_55575
	mov rsi,0
	bt r13,0
	jc LB_55575
	jmp LB_55576
LB_55575:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_55576:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_55549
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_55548
 ; {>  %_55548~0':(_lst)◂(t19344'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55557:
NS_E_55588:
; 	|» 0'
NS_E_RDI_55588:
; _nil {  } ⊢ %_55586 : %_55586
 ; {>  %_55585~0':(_lst)◂(t19365'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f55549 { %_55586 %_55585 } ⊢ %_55587 : %_55587
 ; {>  %_55585~0':(_lst)◂(t19365'(-1)) %_55586~°1◂{  }:(_lst)◂(t19362'(0)) }
; _f55549 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_55589
	btr r12,1
	jmp LB_55590
LB_55589:
	bts r12,1
LB_55590:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_55591
	mov rsi,0
	bt r13,0
	jc LB_55591
	jmp LB_55592
LB_55591:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_55592:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_55549
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_55587
 ; {>  %_55587~0':(_lst)◂(t19365'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_55606:
; 	|» { 0' 1' }
NS_E_RDI_55606:
MTC_LB_55607:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_55608
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
	jnc LB_55609
	bt QWORD [rax],0
	jc LB_55610
	btr r12,4
	jmp LB_55611
LB_55610:
	bts r12,4
LB_55611:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55609:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_55614
	btr r12,5
	jmp LB_55615
LB_55614:
	bts r12,5
LB_55615:
	mov r8,r11
	bt r12,5
	jc LB_55612
	btr r12,2
	jmp LB_55613
LB_55612:
	bts r12,2
LB_55613:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_55618
	btr r12,5
	jmp LB_55619
LB_55618:
	bts r12,5
LB_55619:
	mov r9,r11
	bt r12,5
	jc LB_55616
	btr r12,3
	jmp LB_55617
LB_55616:
	bts r12,3
LB_55617:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55620:
	cmp r15,0
	jz LB_55621
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55620
LB_55621:
; _f44 %_55593 ⊢ %_55597 : %_55597
 ; {>  %_55593~0':_r64 %_55596~3':(_lst)◂(_r64) %_55595~2':_r64 }
	add r13,1
; _f55606 { %_55597 %_55596 } ⊢ { %_55598 %_55599 } : { %_55598 %_55599 }
 ; {>  %_55596~3':(_lst)◂(_r64) %_55595~2':_r64 %_55597~0':_r64 }
; _f55606 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_55624
	btr r12,1
	jmp LB_55625
LB_55624:
	bts r12,1
LB_55625:
	call NS_E_55606
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_55622
	btr r12,2
	jmp LB_55623
LB_55622:
	bts r12,2
LB_55623:
	add rsp,16
; _f43 %_55598 ⊢ %_55600 : %_55600
 ; {>  %_55598~0':_r64 %_55599~1':_stg %_55595~2':_r64 }
	sub r13,1
; _f21 { %_55599 %_55600 %_55595 } ⊢ { %_55601 %_55602 %_55603 } : { %_55601 %_55602 %_55603 }
 ; {>  %_55600~0':_r64 %_55599~1':_stg %_55595~2':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_55626
	btr r12,3
	jmp LB_55627
LB_55626:
	bts r12,3
LB_55627:
	mov r14,r13
	bt r12,0
	jc LB_55628
	btr r12,1
	jmp LB_55629
LB_55628:
	bts r12,1
LB_55629:
	mov r13,r9
	bt r12,3
	jc LB_55630
	btr r12,0
	jmp LB_55631
LB_55630:
	bts r12,0
LB_55631:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_55602 %_55601 }
 ; {>  %_55601~0':_stg %_55603~2':_r64 %_55602~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_55632
	mov rdi,r8
	call dlt
LB_55632:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_55633
	btr r12,2
	jmp LB_55634
LB_55633:
	bts r12,2
LB_55634:
	mov r14,r13
	bt r12,0
	jc LB_55635
	btr r12,1
	jmp LB_55636
LB_55635:
	bts r12,1
LB_55636:
	mov r13,r8
	bt r12,2
	jc LB_55637
	btr r12,0
	jmp LB_55638
LB_55637:
	bts r12,0
LB_55638:
	ret
MTC_LB_55608:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_55639
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
	jnc LB_55640
	bt QWORD [rax],0
	jc LB_55641
	btr r12,2
	jmp LB_55642
LB_55641:
	bts r12,2
LB_55642:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55640:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55643:
	cmp r15,0
	jz LB_55644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55643
LB_55644:
; _f19 %_55593 ⊢ { %_55604 %_55605 } : { %_55604 %_55605 }
 ; {>  %_55593~0':_r64 }
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
; ∎ { %_55604 %_55605 }
 ; {>  %_55605~1':_stg %_55604~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_55639:
NS_E_55649:
; 	|» 0'
NS_E_RDI_55649:
; » 0xr0 |~ {  } ⊢ %_55646 : %_55646
 ; {>  %_55645~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_55646
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f55606 { %_55646 %_55645 } ⊢ { %_55647 %_55648 } : { %_55647 %_55648 }
 ; {>  %_55645~0':(_lst)◂(_r64) %_55646~1':_r64 }
; _f55606 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_55650
	btr r12,2
	jmp LB_55651
LB_55650:
	bts r12,2
LB_55651:
	mov r14,r13
	bt r12,0
	jc LB_55652
	btr r12,1
	jmp LB_55653
LB_55652:
	bts r12,1
LB_55653:
	mov r13,r8
	bt r12,2
	jc LB_55654
	btr r12,0
	jmp LB_55655
LB_55654:
	bts r12,0
LB_55655:
	call NS_E_55606
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_55648
 ; {>  %_55647~0':_r64 %_55648~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_55656
	mov rdi,r13
	call dlt
LB_55656:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_55657
	btr r12,0
	jmp LB_55658
LB_55657:
	bts r12,0
LB_55658:
	ret
NS_E_55659:
NS_E_RDI_55659:
NS_E_55659_ETR_TBL:
NS_E_55659_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_55700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_55700
	jmp LB_55701
LB_55700:
	jmp LB_55690
LB_55701:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_55660_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55705
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55706
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55706:
	jmp LB_55690
LB_55705:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55693
	btr r12,1
	jmp LB_55694
LB_55693:
	bts r12,1
LB_55694:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55691
	btr r12,0
	jmp LB_55692
LB_55691:
	bts r12,0
LB_55692:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55687
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_55708
	btr r12,2
	jmp LB_55709
LB_55708:
	bts r12,2
LB_55709:
	mov r13,r14
	bt r12,1
	jc LB_55710
	btr r12,0
	jmp LB_55711
LB_55710:
	bts r12,0
LB_55711:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55649 %_55662 ⊢ %_55663 : %_55663
 ; {>  %_55662~0':(_lst)◂(_r64) }
; _f55649 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_55649
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_55663 ⊢ %_55664 : %_55664
 ; {>  %_55663~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_55664
 ; {>  %_55664~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55685
	btr r12,3
	jmp LB_55686
LB_55685:
	bts r12,3
LB_55686:
	mov r8,0
	bts r12,2
	ret
LB_55687:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55689
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55688
LB_55689:
	add rsp,8
	ret
LB_55690:
	add rsp,32
	pop r14
LB_55688:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55660:
NS_E_RDI_55660:
NS_E_55660_ETR_TBL:
NS_E_55660_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_55737
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_55737
	jmp LB_55738
LB_55737:
	jmp LB_55725
LB_55738:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_55661_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55742
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55743:
	jmp LB_55725
LB_55742:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_55660_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55748
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_55749
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_55749:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55750
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55750:
	jmp LB_55725
LB_55748:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_55730
	btr r12,2
	jmp LB_55731
LB_55730:
	bts r12,2
LB_55731:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55728
	btr r12,1
	jmp LB_55729
LB_55728:
	bts r12,1
LB_55729:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55726
	btr r12,0
	jmp LB_55727
LB_55726:
	bts r12,0
LB_55727:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_55722
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_55752
	btr r12,3
	jmp LB_55753
LB_55752:
	bts r12,3
LB_55753:
	mov r14,r8
	bt r12,2
	jc LB_55754
	btr r12,1
	jmp LB_55755
LB_55754:
	bts r12,1
LB_55755:
	mov r8,r13
	bt r12,0
	jc LB_55756
	btr r12,2
	jmp LB_55757
LB_55756:
	bts r12,2
LB_55757:
	mov r13,r9
	bt r12,3
	jc LB_55758
	btr r12,0
	jmp LB_55759
LB_55758:
	bts r12,0
LB_55759:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_55665 %_55666 } ⊢ %_55667 : %_55667
 ; {>  %_55665~0':_r64 %_55666~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_55667 ⊢ %_55668 : %_55668
 ; {>  %_55667~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_55668
 ; {>  %_55668~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_55716
	btr r12,2
	jmp LB_55717
LB_55716:
	bts r12,2
LB_55717:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_55714
	btr QWORD [rdi],0
	jmp LB_55715
LB_55714:
	bts QWORD [rdi],0
LB_55715:
	mov r8,r14
	bt r12,1
	jc LB_55720
	btr r12,2
	jmp LB_55721
LB_55720:
	bts r12,2
LB_55721:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_55718
	btr QWORD [rdi],1
	jmp LB_55719
LB_55718:
	bts QWORD [rdi],1
LB_55719:
	mov rsi,1
	bt r12,3
	jc LB_55712
	mov rsi,0
	bt r9,0
	jc LB_55712
	jmp LB_55713
LB_55712:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_55713:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_55722:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55724
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55723
LB_55724:
	add rsp,8
	ret
LB_55725:
	add rsp,48
	pop r14
LB_55723:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_55773
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_55773
	jmp LB_55774
LB_55773:
	jmp LB_55765
LB_55774:
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
	jc LB_55766
	btr r12,0
	jmp LB_55767
LB_55766:
	bts r12,0
LB_55767:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55762
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_55669 : %_55669
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_55669 ⊢ %_55670 : %_55670
 ; {>  %_55669~°1◂{  }:(_lst)◂(t19423'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_55670
 ; {>  %_55670~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19426'(0))) }
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
	jc LB_55760
	mov rsi,0
	bt r9,0
	jc LB_55760
	jmp LB_55761
LB_55760:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_55761:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_55762:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55764
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55763
LB_55764:
	add rsp,8
	ret
LB_55765:
	add rsp,16
	pop r14
LB_55763:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55796
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55788
LB_55796:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_55660_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55801
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55802
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55802:
	jmp LB_55788
LB_55801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55791
	btr r12,1
	jmp LB_55792
LB_55791:
	bts r12,1
LB_55792:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55789
	btr r12,0
	jmp LB_55790
LB_55789:
	bts r12,0
LB_55790:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55785
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_55671 %_55672 } ⊢ %_55673 : %_55673
 ; {>  %_55672~1':(_lst)◂(_r64) %_55671~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_55673 ⊢ %_55674 : %_55674
 ; {>  %_55673~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_55674
 ; {>  %_55674~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_55779
	btr r12,2
	jmp LB_55780
LB_55779:
	bts r12,2
LB_55780:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_55777
	btr QWORD [rdi],0
	jmp LB_55778
LB_55777:
	bts QWORD [rdi],0
LB_55778:
	mov r8,r14
	bt r12,1
	jc LB_55783
	btr r12,2
	jmp LB_55784
LB_55783:
	bts r12,2
LB_55784:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_55781
	btr QWORD [rdi],1
	jmp LB_55782
LB_55781:
	bts QWORD [rdi],1
LB_55782:
	mov rsi,1
	bt r12,3
	jc LB_55775
	mov rsi,0
	bt r9,0
	jc LB_55775
	jmp LB_55776
LB_55775:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_55776:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_55785:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55787
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55786
LB_55787:
	add rsp,8
	ret
LB_55788:
	add rsp,32
	pop r14
LB_55786:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55661:
NS_E_RDI_55661:
NS_E_55661_ETR_TBL:
NS_E_55661_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_55817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_55817
	jmp LB_55818
LB_55817:
	jmp LB_55809
LB_55818:
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
	jc LB_55810
	btr r12,0
	jmp LB_55811
LB_55810:
	bts r12,0
LB_55811:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55806
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_55675 : %_55675
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_55675
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_55675 ⊢ %_55676 : %_55676
 ; {>  %_55675~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55676
 ; {>  %_55676~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55804
	btr r12,3
	jmp LB_55805
LB_55804:
	bts r12,3
LB_55805:
	mov r8,0
	bts r12,2
	ret
LB_55806:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55808
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55807
LB_55808:
	add rsp,8
	ret
LB_55809:
	add rsp,16
	pop r14
LB_55807:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_55832
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_55832
	jmp LB_55833
LB_55832:
	jmp LB_55824
LB_55833:
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
	jc LB_55825
	btr r12,0
	jmp LB_55826
LB_55825:
	bts r12,0
LB_55826:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55821
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_55677 : %_55677
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_55677
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_55677 ⊢ %_55678 : %_55678
 ; {>  %_55677~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55678
 ; {>  %_55678~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55819
	btr r12,3
	jmp LB_55820
LB_55819:
	bts r12,3
LB_55820:
	mov r8,0
	bts r12,2
	ret
LB_55821:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55823
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55822
LB_55823:
	add rsp,8
	ret
LB_55824:
	add rsp,16
	pop r14
LB_55822:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_55847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_55847
	jmp LB_55848
LB_55847:
	jmp LB_55839
LB_55848:
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
	jc LB_55840
	btr r12,0
	jmp LB_55841
LB_55840:
	bts r12,0
LB_55841:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55836
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_55679 : %_55679
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_55679
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_55679 ⊢ %_55680 : %_55680
 ; {>  %_55679~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55680
 ; {>  %_55680~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55834
	btr r12,3
	jmp LB_55835
LB_55834:
	bts r12,3
LB_55835:
	mov r8,0
	bts r12,2
	ret
LB_55836:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55838
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55837
LB_55838:
	add rsp,8
	ret
LB_55839:
	add rsp,16
	pop r14
LB_55837:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_55862
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_55862
	jmp LB_55863
LB_55862:
	jmp LB_55854
LB_55863:
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
	jc LB_55855
	btr r12,0
	jmp LB_55856
LB_55855:
	bts r12,0
LB_55856:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55851
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_55681 : %_55681
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_55681
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_55681 ⊢ %_55682 : %_55682
 ; {>  %_55681~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55682
 ; {>  %_55682~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55849
	btr r12,3
	jmp LB_55850
LB_55849:
	bts r12,3
LB_55850:
	mov r8,0
	bts r12,2
	ret
LB_55851:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55853
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55852
LB_55853:
	add rsp,8
	ret
LB_55854:
	add rsp,16
	pop r14
LB_55852:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_55877
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_55877
	jmp LB_55878
LB_55877:
	jmp LB_55869
LB_55878:
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
	jc LB_55870
	btr r12,0
	jmp LB_55871
LB_55870:
	bts r12,0
LB_55871:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55866
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_55683 : %_55683
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_55683
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_55683 ⊢ %_55684 : %_55684
 ; {>  %_55683~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55684
 ; {>  %_55684~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55864
	btr r12,3
	jmp LB_55865
LB_55864:
	bts r12,3
LB_55865:
	mov r8,0
	bts r12,2
	ret
LB_55866:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55868
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55867
LB_55868:
	add rsp,8
	ret
LB_55869:
	add rsp,16
	pop r14
LB_55867:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55879:
NS_E_RDI_55879:
NS_E_55879_ETR_TBL:
NS_E_55879_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55916
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55910
LB_55916:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55911
	btr r12,0
	jmp LB_55912
LB_55911:
	bts r12,0
LB_55912:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55907
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_55881 : %_55881
 ; {>  %_55880~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_55881
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_55882 : %_55882
 ; {>  %_55881~1':_r64 %_55880~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_55882
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_55880 %_55881 } ⊢ { %_55883 %_55884 %_55885 } : { %_55883 %_55884 %_55885 }
 ; {>  %_55881~1':_r64 %_55882~2':_r64 %_55880~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_55882 %_55883 } ⊢ { %_55886 %_55887 %_55888 } : { %_55886 %_55887 %_55888 }
 ; {>  %_55885~3':_r64 %_55884~1':_r64 %_55883~0':_r64 %_55882~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_55891:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_55892
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_55892
LB_55893:
	cmp r15,0
	jz LB_55894
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55893
LB_55894:
; _some %_55887 ⊢ %_55889 : %_55889
 ; {>  %_55887~0':_r64 %_55886~2':_r64 %_55884~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55889
 ; {>  %_55889~°0◂0':(_opn)◂(_r64) %_55886~2':_r64 %_55884~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_55895
	mov rdi,r8
	call dlt
LB_55895:
	bt r12,1
	jc LB_55896
	mov rdi,r14
	call dlt
LB_55896:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55897
	btr r12,3
	jmp LB_55898
LB_55897:
	bts r12,3
LB_55898:
	mov r8,0
	bts r12,2
	ret
MTC_LB_55892:
	mov r15,0
LB_55900:
	cmp r15,0
	jz LB_55901
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55900
LB_55901:
; _none {  } ⊢ %_55890 : %_55890
 ; {>  %_55887~0':_r64 %_55885~3':_r64 %_55886~2':_r64 %_55884~1':_r64 %_55888~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_55890
 ; {>  %_55887~0':_r64 %_55885~3':_r64 %_55886~2':_r64 %_55884~1':_r64 %_55890~°1◂{  }:(_opn)◂(t19502'(0)) %_55888~4':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_55902
	mov rdi,r13
	call dlt
LB_55902:
	bt r12,3
	jc LB_55903
	mov rdi,r9
	call dlt
LB_55903:
	bt r12,2
	jc LB_55904
	mov rdi,r8
	call dlt
LB_55904:
	bt r12,1
	jc LB_55905
	mov rdi,r14
	call dlt
LB_55905:
	bt r12,4
	jc LB_55906
	mov rdi,r10
	call dlt
LB_55906:
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
MTC_LB_55899:
LB_55907:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55909
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55908
LB_55909:
	add rsp,8
	ret
LB_55910:
	add rsp,16
	pop r14
LB_55908:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55918:
NS_E_RDI_55918:
NS_E_55918_ETR_TBL:
NS_E_55918_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55955
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55949
LB_55955:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55950
	btr r12,0
	jmp LB_55951
LB_55950:
	bts r12,0
LB_55951:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55946
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_55920 : %_55920
 ; {>  %_55919~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_55920
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_55921 : %_55921
 ; {>  %_55920~1':_r64 %_55919~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_55921
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_55919 %_55920 } ⊢ { %_55922 %_55923 %_55924 } : { %_55922 %_55923 %_55924 }
 ; {>  %_55921~2':_r64 %_55920~1':_r64 %_55919~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_55921 %_55922 } ⊢ { %_55925 %_55926 %_55927 } : { %_55925 %_55926 %_55927 }
 ; {>  %_55921~2':_r64 %_55922~0':_r64 %_55924~3':_r64 %_55923~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_55930:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_55931
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_55931
LB_55932:
	cmp r15,0
	jz LB_55933
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55932
LB_55933:
; _some %_55926 ⊢ %_55928 : %_55928
 ; {>  %_55925~2':_r64 %_55926~0':_r64 %_55923~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55928
 ; {>  %_55925~2':_r64 %_55928~°0◂0':(_opn)◂(_r64) %_55923~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_55934
	mov rdi,r8
	call dlt
LB_55934:
	bt r12,1
	jc LB_55935
	mov rdi,r14
	call dlt
LB_55935:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55936
	btr r12,3
	jmp LB_55937
LB_55936:
	bts r12,3
LB_55937:
	mov r8,0
	bts r12,2
	ret
MTC_LB_55931:
	mov r15,0
LB_55939:
	cmp r15,0
	jz LB_55940
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55939
LB_55940:
; _none {  } ⊢ %_55929 : %_55929
 ; {>  %_55925~2':_r64 %_55926~0':_r64 %_55927~4':_r64 %_55924~3':_r64 %_55923~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_55929
 ; {>  %_55929~°1◂{  }:(_opn)◂(t19529'(0)) %_55925~2':_r64 %_55926~0':_r64 %_55927~4':_r64 %_55924~3':_r64 %_55923~1':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_55941
	mov rdi,r8
	call dlt
LB_55941:
	bt r12,0
	jc LB_55942
	mov rdi,r13
	call dlt
LB_55942:
	bt r12,4
	jc LB_55943
	mov rdi,r10
	call dlt
LB_55943:
	bt r12,3
	jc LB_55944
	mov rdi,r9
	call dlt
LB_55944:
	bt r12,1
	jc LB_55945
	mov rdi,r14
	call dlt
LB_55945:
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
MTC_LB_55938:
LB_55946:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55948
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55947
LB_55948:
	add rsp,8
	ret
LB_55949:
	add rsp,16
	pop r14
LB_55947:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55957:
NS_E_RDI_55957:
NS_E_55957_ETR_TBL:
NS_E_55957_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_55536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55994
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55988
LB_55994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55989
	btr r12,0
	jmp LB_55990
LB_55989:
	bts r12,0
LB_55990:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55985
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_55959 : %_55959
 ; {>  %_55958~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_55959
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_55960 : %_55960
 ; {>  %_55958~0':_r64 %_55959~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_55960
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_55958 %_55959 } ⊢ { %_55961 %_55962 %_55963 } : { %_55961 %_55962 %_55963 }
 ; {>  %_55958~0':_r64 %_55959~1':_r64 %_55960~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_55960 %_55961 } ⊢ { %_55964 %_55965 %_55966 } : { %_55964 %_55965 %_55966 }
 ; {>  %_55962~1':_r64 %_55961~0':_r64 %_55963~3':_r64 %_55960~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_55969:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_55970
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_55970
LB_55971:
	cmp r15,0
	jz LB_55972
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55971
LB_55972:
; _some %_55965 ⊢ %_55967 : %_55967
 ; {>  %_55964~2':_r64 %_55965~0':_r64 %_55962~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55967
 ; {>  %_55964~2':_r64 %_55962~1':_r64 %_55967~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_55973
	mov rdi,r8
	call dlt
LB_55973:
	bt r12,1
	jc LB_55974
	mov rdi,r14
	call dlt
LB_55974:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55975
	btr r12,3
	jmp LB_55976
LB_55975:
	bts r12,3
LB_55976:
	mov r8,0
	bts r12,2
	ret
MTC_LB_55970:
	mov r15,0
LB_55978:
	cmp r15,0
	jz LB_55979
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55978
LB_55979:
; _none {  } ⊢ %_55968 : %_55968
 ; {>  %_55964~2':_r64 %_55966~4':_r64 %_55965~0':_r64 %_55962~1':_r64 %_55963~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_55968
 ; {>  %_55964~2':_r64 %_55966~4':_r64 %_55965~0':_r64 %_55962~1':_r64 %_55968~°1◂{  }:(_opn)◂(t19556'(0)) %_55963~3':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_55980
	mov rdi,r8
	call dlt
LB_55980:
	bt r12,4
	jc LB_55981
	mov rdi,r10
	call dlt
LB_55981:
	bt r12,0
	jc LB_55982
	mov rdi,r13
	call dlt
LB_55982:
	bt r12,1
	jc LB_55983
	mov rdi,r14
	call dlt
LB_55983:
	bt r12,3
	jc LB_55984
	mov rdi,r9
	call dlt
LB_55984:
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
MTC_LB_55977:
LB_55985:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55987
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55986
LB_55987:
	add rsp,8
	ret
LB_55988:
	add rsp,16
	pop r14
LB_55986:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55996:
NS_E_RDI_55996:
NS_E_55996_ETR_TBL:
NS_E_55996_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_55957_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56012
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56006
LB_56012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56007
	btr r12,0
	jmp LB_56008
LB_56007:
	bts r12,0
LB_56008:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56003
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55997 ⊢ %_55998 : %_55998
 ; {>  %_55997~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55998
 ; {>  %_55998~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56001
	btr r12,3
	jmp LB_56002
LB_56001:
	bts r12,3
LB_56002:
	mov r8,0
	bts r12,2
	ret
LB_56003:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56005
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56004
LB_56005:
	add rsp,8
	ret
LB_56006:
	add rsp,16
	pop r14
LB_56004:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_55918_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56025
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56019
LB_56025:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56020
	btr r12,0
	jmp LB_56021
LB_56020:
	bts r12,0
LB_56021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56016
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55999 ⊢ %_56000 : %_56000
 ; {>  %_55999~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56000
 ; {>  %_56000~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56014
	btr r12,3
	jmp LB_56015
LB_56014:
	bts r12,3
LB_56015:
	mov r8,0
	bts r12,2
	ret
LB_56016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56018
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56017
LB_56018:
	add rsp,8
	ret
LB_56019:
	add rsp,16
	pop r14
LB_56017:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56027:
NS_E_RDI_56027:
NS_E_56027_ETR_TBL:
NS_E_56027_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_55996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56072
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56064
LB_56072:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_56028_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56077
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56078
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56078:
	jmp LB_56064
LB_56077:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56067
	btr r12,1
	jmp LB_56068
LB_56067:
	bts r12,1
LB_56068:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56065
	btr r12,0
	jmp LB_56066
LB_56065:
	bts r12,0
LB_56066:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56061
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_56030 %_56031 } ⊢ %_56032 : %_56032
 ; {>  %_56030~0':_r64 %_56031~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f55649 %_56032 ⊢ %_56033 : %_56033
 ; {>  %_56032~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f55649 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_56047
	btr r12,2
	jmp LB_56048
LB_56047:
	bts r12,2
LB_56048:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_56053
	btr r12,3
	jmp LB_56054
LB_56053:
	bts r12,3
LB_56054:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_56051
	btr QWORD [rdi],0
	jmp LB_56052
LB_56051:
	bts QWORD [rdi],0
LB_56052:
	mov r9,r14
	bt r12,1
	jc LB_56057
	btr r12,3
	jmp LB_56058
LB_56057:
	bts r12,3
LB_56058:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_56055
	btr QWORD [rdi],1
	jmp LB_56056
LB_56055:
	bts QWORD [rdi],1
LB_56056:
	mov rsi,1
	bt r12,0
	jc LB_56049
	mov rsi,0
	bt r13,0
	jc LB_56049
	jmp LB_56050
LB_56049:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_56050:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_55649
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_56033 ⊢ %_56034 : %_56034
 ; {>  %_56033~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_56034
 ; {>  %_56034~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56059
	btr r12,3
	jmp LB_56060
LB_56059:
	bts r12,3
LB_56060:
	mov r8,0
	bts r12,2
	ret
LB_56061:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56063
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56062
LB_56063:
	add rsp,8
	ret
LB_56064:
	add rsp,32
	pop r14
LB_56062:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56028:
NS_E_RDI_56028:
NS_E_56028_ETR_TBL:
NS_E_56028_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_56029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56101
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56093
LB_56101:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_56028_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56106
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56107
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56107:
	jmp LB_56093
LB_56106:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56096
	btr r12,1
	jmp LB_56097
LB_56096:
	bts r12,1
LB_56097:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56094
	btr r12,0
	jmp LB_56095
LB_56094:
	bts r12,0
LB_56095:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56090
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_56035 %_56036 } ⊢ %_56037 : %_56037
 ; {>  %_56036~1':(_lst)◂(_r64) %_56035~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_56037 ⊢ %_56038 : %_56038
 ; {>  %_56037~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_56038
 ; {>  %_56038~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_56084
	btr r12,2
	jmp LB_56085
LB_56084:
	bts r12,2
LB_56085:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_56082
	btr QWORD [rdi],0
	jmp LB_56083
LB_56082:
	bts QWORD [rdi],0
LB_56083:
	mov r8,r14
	bt r12,1
	jc LB_56088
	btr r12,2
	jmp LB_56089
LB_56088:
	bts r12,2
LB_56089:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_56086
	btr QWORD [rdi],1
	jmp LB_56087
LB_56086:
	bts QWORD [rdi],1
LB_56087:
	mov rsi,1
	bt r12,3
	jc LB_56080
	mov rsi,0
	bt r9,0
	jc LB_56080
	jmp LB_56081
LB_56080:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56081:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56090:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56092
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56091
LB_56092:
	add rsp,8
	ret
LB_56093:
	add rsp,32
	pop r14
LB_56091:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_56111
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_56039 : %_56039
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_56039 ⊢ %_56040 : %_56040
 ; {>  %_56039~°1◂{  }:(_lst)◂(t19600'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_56040
 ; {>  %_56040~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19603'(0))) }
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
	jc LB_56109
	mov rsi,0
	bt r9,0
	jc LB_56109
	jmp LB_56110
LB_56109:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56110:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56111:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56113
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56112
LB_56113:
	add rsp,8
	ret
LB_56114:
	add rsp,0
	pop r14
LB_56112:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56029:
NS_E_RDI_56029:
NS_E_56029_ETR_TBL:
NS_E_56029_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_55996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56126
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56120
LB_56126:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56121
	btr r12,0
	jmp LB_56122
LB_56121:
	bts r12,0
LB_56122:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56117
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_56041 ⊢ %_56042 : %_56042
 ; {>  %_56041~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56042
 ; {>  %_56042~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56115
	btr r12,3
	jmp LB_56116
LB_56115:
	bts r12,3
LB_56116:
	mov r8,0
	bts r12,2
	ret
LB_56117:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56119
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56118
LB_56119:
	add rsp,8
	ret
LB_56120:
	add rsp,16
	pop r14
LB_56118:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_55879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56139
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56133
LB_56139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56134
	btr r12,0
	jmp LB_56135
LB_56134:
	bts r12,0
LB_56135:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56130
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_56043 ⊢ %_56044 : %_56044
 ; {>  %_56043~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56044
 ; {>  %_56044~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56128
	btr r12,3
	jmp LB_56129
LB_56128:
	bts r12,3
LB_56129:
	mov r8,0
	bts r12,2
	ret
LB_56130:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56132
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56131
LB_56132:
	add rsp,8
	ret
LB_56133:
	add rsp,16
	pop r14
LB_56131:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_56154
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_56154
	jmp LB_56155
LB_56154:
	jmp LB_56146
LB_56155:
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
	jc LB_56147
	btr r12,0
	jmp LB_56148
LB_56147:
	bts r12,0
LB_56148:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56143
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_56045 : %_56045
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_56045
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_56045 ⊢ %_56046 : %_56046
 ; {>  %_56045~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56046
 ; {>  %_56046~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56141
	btr r12,3
	jmp LB_56142
LB_56141:
	bts r12,3
LB_56142:
	mov r8,0
	bts r12,2
	ret
LB_56143:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56145
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56144
LB_56145:
	add rsp,8
	ret
LB_56146:
	add rsp,16
	pop r14
LB_56144:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56156:
NS_E_RDI_56156:
NS_E_56156_ETR_TBL:
NS_E_56156_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_56177
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_56177
	jmp LB_56178
LB_56177:
	jmp LB_56167
LB_56178:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_56028_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56182
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56183
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56183:
	jmp LB_56167
LB_56182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56170
	btr r12,1
	jmp LB_56171
LB_56170:
	bts r12,1
LB_56171:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56168
	btr r12,0
	jmp LB_56169
LB_56168:
	bts r12,0
LB_56169:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56164
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_56185
	btr r12,2
	jmp LB_56186
LB_56185:
	bts r12,2
LB_56186:
	mov r13,r14
	bt r12,1
	jc LB_56187
	btr r12,0
	jmp LB_56188
LB_56187:
	bts r12,0
LB_56188:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55649 %_56157 ⊢ %_56158 : %_56158
 ; {>  %_56157~0':(_lst)◂(_r64) }
; _f55649 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_55649
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_56158 ⊢ %_56159 : %_56159
 ; {>  %_56158~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_56159
 ; {>  %_56159~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56162
	btr r12,3
	jmp LB_56163
LB_56162:
	bts r12,3
LB_56163:
	mov r8,0
	bts r12,2
	ret
LB_56164:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56166
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56165
LB_56166:
	add rsp,8
	ret
LB_56167:
	add rsp,32
	pop r14
LB_56165:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56200
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56194
LB_56200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56195
	btr r12,0
	jmp LB_56196
LB_56195:
	bts r12,0
LB_56196:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56191
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_56160 ⊢ %_56161 : %_56161
 ; {>  %_56160~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_56161
 ; {>  %_56161~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56189
	btr r12,3
	jmp LB_56190
LB_56189:
	bts r12,3
LB_56190:
	mov r8,0
	bts r12,2
	ret
LB_56191:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56193
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56192
LB_56193:
	add rsp,8
	ret
LB_56194:
	add rsp,16
	pop r14
LB_56192:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56203:
NS_E_RDI_56203:
NS_E_56203_ETR_TBL:
NS_E_56203_TBL:
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
LB_56212:
	jmp LB_56209
LB_56208:
	add r14,1
LB_56209:
	cmp r14,r10
	jge LB_56210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56208
	cmp al,10
	jz LB_56208
	cmp al,32
	jz LB_56208
LB_56210:
	push r10
	push rsi
	call NS_E_56027_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_56211
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_56213
	bts QWORD [rax],0
LB_56213:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_56212
LB_56211:
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
	jc LB_56206
	btr QWORD [rdi],0
LB_56206:
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
LB_56205:
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
NS_E_56321:
NS_E_RDI_56321:
NS_E_56321_ETR_TBL:
NS_E_56321_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_56423
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56423
	jmp LB_56424
LB_56423:
	jmp LB_56415
LB_56424:
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
	jc LB_56416
	btr r12,0
	jmp LB_56417
LB_56416:
	bts r12,0
LB_56417:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56412
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_56325 : %_56325
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_56325
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_56325 ⊢ %_56326 : %_56326
 ; {>  %_56325~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56326
 ; {>  %_56326~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56410
	btr r12,3
	jmp LB_56411
LB_56410:
	bts r12,3
LB_56411:
	mov r8,0
	bts r12,2
	ret
LB_56412:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56414
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56413
LB_56414:
	add rsp,8
	ret
LB_56415:
	add rsp,16
	pop r14
LB_56413:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56439
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56431
LB_56439:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_56321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56444
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56445
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56445:
	jmp LB_56431
LB_56444:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56434
	btr r12,1
	jmp LB_56435
LB_56434:
	bts r12,1
LB_56435:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56432
	btr r12,0
	jmp LB_56433
LB_56432:
	bts r12,0
LB_56433:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56428
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_56328 ⊢ %_56329 : %_56329
 ; {>  %_56328~1':_r64 %_56327~0':_r64 }
	add r14,1
; _some %_56329 ⊢ %_56330 : %_56330
 ; {>  %_56329~1':_r64 %_56327~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_56330
 ; {>  %_56330~°0◂1':(_opn)◂(_r64) %_56327~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_56425
	mov rdi,r13
	call dlt
LB_56425:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_56426
	btr r12,3
	jmp LB_56427
LB_56426:
	bts r12,3
LB_56427:
	mov r8,0
	bts r12,2
	ret
LB_56428:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56430
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56429
LB_56430:
	add rsp,8
	ret
LB_56431:
	add rsp,32
	pop r14
LB_56429:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56322:
NS_E_RDI_56322:
NS_E_56322_ETR_TBL:
NS_E_56322_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_56460
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_56460
	jmp LB_56461
LB_56460:
	jmp LB_56452
LB_56461:
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
	jc LB_56453
	btr r12,0
	jmp LB_56454
LB_56453:
	bts r12,0
LB_56454:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56449
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_56331 : %_56331
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_56331
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_56331 ⊢ %_56332 : %_56332
 ; {>  %_56331~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56332
 ; {>  %_56332~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56447
	btr r12,3
	jmp LB_56448
LB_56447:
	bts r12,3
LB_56448:
	mov r8,0
	bts r12,2
	ret
LB_56449:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56451
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56450
LB_56451:
	add rsp,8
	ret
LB_56452:
	add rsp,16
	pop r14
LB_56450:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_56475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_56475
	jmp LB_56476
LB_56475:
	jmp LB_56467
LB_56476:
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
	jc LB_56468
	btr r12,0
	jmp LB_56469
LB_56468:
	bts r12,0
LB_56469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56464
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_56333 : %_56333
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_56333
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_56333 ⊢ %_56334 : %_56334
 ; {>  %_56333~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56334
 ; {>  %_56334~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56462
	btr r12,3
	jmp LB_56463
LB_56462:
	bts r12,3
LB_56463:
	mov r8,0
	bts r12,2
	ret
LB_56464:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56466
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56465
LB_56466:
	add rsp,8
	ret
LB_56467:
	add rsp,16
	pop r14
LB_56465:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_56479
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_56335 : %_56335
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_56335
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_56335 ⊢ %_56336 : %_56336
 ; {>  %_56335~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56336
 ; {>  %_56336~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56477
	btr r12,3
	jmp LB_56478
LB_56477:
	bts r12,3
LB_56478:
	mov r8,0
	bts r12,2
	ret
LB_56479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56481
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56480
LB_56481:
	add rsp,8
	ret
LB_56482:
	add rsp,0
	pop r14
LB_56480:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56323:
NS_E_RDI_56323:
NS_E_56323_ETR_TBL:
NS_E_56323_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56525
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56509
LB_56525:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_56533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_56533
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_56533
	jmp LB_56534
LB_56533:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56531:
	jmp LB_56509
LB_56534:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56538
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56539
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56539:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56540
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56540:
	jmp LB_56509
LB_56538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_56550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56550
	jmp LB_56551
LB_56550:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56546
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56546:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56547
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56547:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56548
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56548:
	jmp LB_56509
LB_56551:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_56324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56555
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_56556
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_56556:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56557
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56557:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56558
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56558:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56559
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56559:
	jmp LB_56509
LB_56555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_56323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56564
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_56565
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_56565:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_56566
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_56566:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56567
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56567:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56568
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56568:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56569
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56569:
	jmp LB_56509
LB_56564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_56520
	btr r12,5
	jmp LB_56521
LB_56520:
	bts r12,5
LB_56521:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_56518
	btr r12,4
	jmp LB_56519
LB_56518:
	bts r12,4
LB_56519:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_56516
	btr r12,3
	jmp LB_56517
LB_56516:
	bts r12,3
LB_56517:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56514
	btr r12,2
	jmp LB_56515
LB_56514:
	bts r12,2
LB_56515:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56512
	btr r12,1
	jmp LB_56513
LB_56512:
	bts r12,1
LB_56513:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56510
	btr r12,0
	jmp LB_56511
LB_56510:
	bts r12,0
LB_56511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_56506
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_56571
	btr r12,6
	jmp LB_56572
LB_56571:
	bts r12,6
LB_56572:
	mov r8,r10
	bt r12,4
	jc LB_56573
	btr r12,2
	jmp LB_56574
LB_56573:
	bts r12,2
LB_56574:
	mov rdx,r14
	bt r12,1
	jc LB_56575
	btr r12,7
	jmp LB_56576
LB_56575:
	bts r12,7
LB_56576:
	mov r14,rcx
	bt r12,6
	jc LB_56577
	btr r12,1
	jmp LB_56578
LB_56577:
	bts r12,1
LB_56578:
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_56581
	btr r12,6
	jmp LB_56582
LB_56581:
	bts r12,6
LB_56582:
	mov r9,rcx
	bt r12,6
	jc LB_56579
	btr r12,3
	jmp LB_56580
LB_56579:
	bts r12,3
LB_56580:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_56585
	btr r12,6
	jmp LB_56586
LB_56585:
	bts r12,6
LB_56586:
	mov r10,rcx
	bt r12,6
	jc LB_56583
	btr r12,4
	jmp LB_56584
LB_56583:
	bts r12,4
LB_56584:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_56342 : %_56342
 ; {>  %_56341~4':(_lst)◂(_p56318) %_56340~3':_r64 %_56337~0':_r64 %_56338~1':_r64 %_56339~2':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_56342
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_56342 %_56337 } ⊢ { %_56343 %_56344 } : { %_56343 %_56344 }
 ; {>  %_56342~5':_r64 %_56341~4':(_lst)◂(_p56318) %_56340~3':_r64 %_56337~0':_r64 %_56338~1':_r64 %_56339~2':_r64 }
	add r11,r13
; _f39 { %_56343 %_56338 } ⊢ { %_56345 %_56346 } : { %_56345 %_56346 }
 ; {>  %_56341~4':(_lst)◂(_p56318) %_56340~3':_r64 %_56343~5':_r64 %_56344~0':_r64 %_56338~1':_r64 %_56339~2':_r64 }
	add r11,r14
; _f39 { %_56345 %_56339 } ⊢ { %_56347 %_56348 } : { %_56347 %_56348 }
 ; {>  %_56341~4':(_lst)◂(_p56318) %_56340~3':_r64 %_56346~1':_r64 %_56345~5':_r64 %_56344~0':_r64 %_56339~2':_r64 }
	add r11,r8
; _f56319 %_56347 ⊢ %_56349 : %_56349
 ; {>  %_56341~4':(_lst)◂(_p56318) %_56348~2':_r64 %_56340~3':_r64 %_56346~1':_r64 %_56344~0':_r64 %_56347~5':_r64 }
; _f56319 5' ⊢ °0◂5'
; _cns { %_56349 %_56341 } ⊢ %_56350 : %_56350
 ; {>  %_56341~4':(_lst)◂(_p56318) %_56348~2':_r64 %_56340~3':_r64 %_56346~1':_r64 %_56344~0':_r64 %_56349~°0◂5':_p56318 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_56340 %_56350 } ⊢ %_56351 : %_56351
 ; {>  %_56348~2':_r64 %_56340~3':_r64 %_56346~1':_r64 %_56344~0':_r64 %_56350~°0◂{ °0◂5' 4' }:(_lst)◂(_p56318) }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_56351
 ; {>  %_56348~2':_r64 %_56346~1':_r64 %_56351~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p56318) }) %_56344~0':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,2
	jc LB_56483
	mov rdi,r8
	call dlt
LB_56483:
	bt r12,1
	jc LB_56484
	mov rdi,r14
	call dlt
LB_56484:
	bt r12,0
	jc LB_56485
	mov rdi,r13
	call dlt
LB_56485:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_56486
	btr r12,0
	jmp LB_56487
LB_56486:
	bts r12,0
LB_56487:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_56490
	btr r12,1
	jmp LB_56491
LB_56490:
	bts r12,1
LB_56491:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56488
	btr QWORD [rdi],0
	jmp LB_56489
LB_56488:
	bts QWORD [rdi],0
LB_56489:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_56500
	btr r12,0
	jmp LB_56501
LB_56500:
	bts r12,0
LB_56501:
	mov rsi,1
	bt r12,0
	jc LB_56498
	mov rsi,0
	bt r13,0
	jc LB_56498
	jmp LB_56499
LB_56498:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_56499:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_56496
	btr QWORD [rdi],0
	jmp LB_56497
LB_56496:
	bts QWORD [rdi],0
LB_56497:
	mov r13,r10
	bt r12,4
	jc LB_56504
	btr r12,0
	jmp LB_56505
LB_56504:
	bts r12,0
LB_56505:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_56502
	btr QWORD [rdi],1
	jmp LB_56503
LB_56502:
	bts QWORD [rdi],1
LB_56503:
	mov rsi,1
	bt r12,1
	jc LB_56494
	mov rsi,0
	bt r14,0
	jc LB_56494
	jmp LB_56495
LB_56494:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56495:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56492
	btr QWORD [rdi],1
	jmp LB_56493
LB_56492:
	bts QWORD [rdi],1
LB_56493:
	mov r8,0
	bts r12,2
	ret
LB_56506:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56508
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56507
LB_56508:
	add rsp,8
	ret
LB_56509:
	add rsp,96
	pop r14
LB_56507:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56624
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56612
LB_56624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_56632
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_56632
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_56632
	jmp LB_56633
LB_56632:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56630
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56630:
	jmp LB_56612
LB_56633:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_56321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56637
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56638
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56638:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56639
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56639:
	jmp LB_56612
LB_56637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_56323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56644
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56645
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56645:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56646
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56646:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56647
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56647:
	jmp LB_56612
LB_56644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_56619
	btr r12,3
	jmp LB_56620
LB_56619:
	bts r12,3
LB_56620:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56617
	btr r12,2
	jmp LB_56618
LB_56617:
	bts r12,2
LB_56618:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56615
	btr r12,1
	jmp LB_56616
LB_56615:
	bts r12,1
LB_56616:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56613
	btr r12,0
	jmp LB_56614
LB_56613:
	bts r12,0
LB_56614:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_56609
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_56649
	btr r12,4
	jmp LB_56650
LB_56649:
	bts r12,4
LB_56650:
	mov r14,r8
	bt r12,2
	jc LB_56651
	btr r12,1
	jmp LB_56652
LB_56651:
	bts r12,1
LB_56652:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_56653
	btr r12,4
	jmp LB_56654
LB_56653:
	bts r12,4
LB_56654:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_56657
	btr r12,5
	jmp LB_56658
LB_56657:
	bts r12,5
LB_56658:
	mov r8,r11
	bt r12,5
	jc LB_56655
	btr r12,2
	jmp LB_56656
LB_56655:
	bts r12,2
LB_56656:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_56661
	btr r12,5
	jmp LB_56662
LB_56661:
	bts r12,5
LB_56662:
	mov r9,r11
	bt r12,5
	jc LB_56659
	btr r12,3
	jmp LB_56660
LB_56659:
	bts r12,3
LB_56660:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_56356 : %_56356
 ; {>  %_56354~2':_r64 %_56353~1':_r64 %_56352~0':_r64 %_56355~3':(_lst)◂(_p56318) }
; 	» 0xr2 _ ⊢ 4' : %_56356
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_56356 %_56352 } ⊢ { %_56357 %_56358 } : { %_56357 %_56358 }
 ; {>  %_56354~2':_r64 %_56353~1':_r64 %_56352~0':_r64 %_56356~4':_r64 %_56355~3':(_lst)◂(_p56318) }
	add r10,r13
; _f39 { %_56357 %_56353 } ⊢ { %_56359 %_56360 } : { %_56359 %_56360 }
 ; {>  %_56354~2':_r64 %_56353~1':_r64 %_56357~4':_r64 %_56358~0':_r64 %_56355~3':(_lst)◂(_p56318) }
	add r10,r14
; _f56319 %_56359 ⊢ %_56361 : %_56361
 ; {>  %_56354~2':_r64 %_56360~1':_r64 %_56359~4':_r64 %_56358~0':_r64 %_56355~3':(_lst)◂(_p56318) }
; _f56319 4' ⊢ °0◂4'
; _cns { %_56361 %_56355 } ⊢ %_56362 : %_56362
 ; {>  %_56354~2':_r64 %_56361~°0◂4':_p56318 %_56360~1':_r64 %_56358~0':_r64 %_56355~3':(_lst)◂(_p56318) }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_56354 %_56362 } ⊢ %_56363 : %_56363
 ; {>  %_56362~°0◂{ °0◂4' 3' }:(_lst)◂(_p56318) %_56354~2':_r64 %_56360~1':_r64 %_56358~0':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_56363
 ; {>  %_56360~1':_r64 %_56363~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p56318) }) %_56358~0':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_56587
	mov rdi,r14
	call dlt
LB_56587:
	bt r12,0
	jc LB_56588
	mov rdi,r13
	call dlt
LB_56588:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_56589
	btr r12,0
	jmp LB_56590
LB_56589:
	bts r12,0
LB_56590:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_56593
	btr r12,1
	jmp LB_56594
LB_56593:
	bts r12,1
LB_56594:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56591
	btr QWORD [rdi],0
	jmp LB_56592
LB_56591:
	bts QWORD [rdi],0
LB_56592:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_56603
	btr r12,2
	jmp LB_56604
LB_56603:
	bts r12,2
LB_56604:
	mov rsi,1
	bt r12,2
	jc LB_56601
	mov rsi,0
	bt r8,0
	jc LB_56601
	jmp LB_56602
LB_56601:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_56602:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_56599
	btr QWORD [rdi],0
	jmp LB_56600
LB_56599:
	bts QWORD [rdi],0
LB_56600:
	mov r8,r13
	bt r12,0
	jc LB_56607
	btr r12,2
	jmp LB_56608
LB_56607:
	bts r12,2
LB_56608:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_56605
	btr QWORD [rdi],1
	jmp LB_56606
LB_56605:
	bts QWORD [rdi],1
LB_56606:
	mov rsi,1
	bt r12,1
	jc LB_56597
	mov rsi,0
	bt r14,0
	jc LB_56597
	jmp LB_56598
LB_56597:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56598:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56595
	btr QWORD [rdi],1
	jmp LB_56596
LB_56595:
	bts QWORD [rdi],1
LB_56596:
	mov r8,0
	bts r12,2
	ret
LB_56609:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56611
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56610
LB_56611:
	add rsp,8
	ret
LB_56612:
	add rsp,64
	pop r14
LB_56610:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_56321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56734
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56726
LB_56734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_56323_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56739
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56740:
	jmp LB_56726
LB_56739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56729
	btr r12,1
	jmp LB_56730
LB_56729:
	bts r12,1
LB_56730:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56727
	btr r12,0
	jmp LB_56728
LB_56727:
	bts r12,0
LB_56728:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56723
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_56742
	btr r12,3
	jmp LB_56743
LB_56742:
	bts r12,3
LB_56743:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_56746
	btr r12,4
	jmp LB_56747
LB_56746:
	bts r12,4
LB_56747:
	mov r14,r10
	bt r12,4
	jc LB_56744
	btr r12,1
	jmp LB_56745
LB_56744:
	bts r12,1
LB_56745:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_56750
	btr r12,4
	jmp LB_56751
LB_56750:
	bts r12,4
LB_56751:
	mov r8,r10
	bt r12,4
	jc LB_56748
	btr r12,2
	jmp LB_56749
LB_56748:
	bts r12,2
LB_56749:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f39 { %_56365 %_56364 } ⊢ { %_56367 %_56368 } : { %_56367 %_56368 }
 ; {>  %_56365~1':_r64 %_56364~0':_r64 %_56366~2':(_lst)◂(_p56318) }
	add r14,r13
MTC_LB_56663:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56664
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
	jnc LB_56665
	bt QWORD [rax],0
	jc LB_56666
	btr r12,5
	jmp LB_56667
LB_56666:
	bts r12,5
LB_56667:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56665:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_56670
	btr r12,6
	jmp LB_56671
LB_56670:
	bts r12,6
LB_56671:
	mov r9,rcx
	bt r12,6
	jc LB_56668
	btr r12,3
	jmp LB_56669
LB_56668:
	bts r12,3
LB_56669:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_56674
	btr r12,6
	jmp LB_56675
LB_56674:
	bts r12,6
LB_56675:
	mov r10,rcx
	bt r12,6
	jc LB_56672
	btr r12,4
	jmp LB_56673
LB_56672:
	bts r12,4
LB_56673:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_56664
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
	jnc LB_56676
	bt QWORD [rax],0
	jc LB_56677
	btr r12,6
	jmp LB_56678
LB_56677:
	bts r12,6
LB_56678:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56676:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_56679
	btr r12,5
	jmp LB_56680
LB_56679:
	bts r12,5
LB_56680:
LB_56681:
	cmp r15,0
	jz LB_56682
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56681
LB_56682:
; _f39 { %_56371 %_56368 } ⊢ { %_56372 %_56373 } : { %_56372 %_56373 }
 ; {>  %_56371~5':_r64 %_56368~0':_r64 %_56370~4':(_lst)◂(_p56318) %_56367~1':_r64 }
	add r11,r13
; _f56320 %_56372 ⊢ %_56374 : %_56374
 ; {>  %_56372~5':_r64 %_56373~0':_r64 %_56370~4':(_lst)◂(_p56318) %_56367~1':_r64 }
; _f56320 5' ⊢ °1◂5'
; _cns { %_56374 %_56370 } ⊢ %_56375 : %_56375
 ; {>  %_56373~0':_r64 %_56374~°1◂5':_p56318 %_56370~4':(_lst)◂(_p56318) %_56367~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_56367 %_56375 } ⊢ %_56376 : %_56376
 ; {>  %_56375~°0◂{ °1◂5' 4' }:(_lst)◂(_p56318) %_56373~0':_r64 %_56367~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_56376
 ; {>  %_56376~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p56318) }) %_56373~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_56683
	mov rdi,r13
	call dlt
LB_56683:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_56686
	btr r12,0
	jmp LB_56687
LB_56686:
	bts r12,0
LB_56687:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_56684
	btr QWORD [rdi],0
	jmp LB_56685
LB_56684:
	bts QWORD [rdi],0
LB_56685:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_56696
	btr r12,1
	jmp LB_56697
LB_56696:
	bts r12,1
LB_56697:
	mov rsi,1
	bt r12,1
	jc LB_56694
	mov rsi,0
	bt r14,0
	jc LB_56694
	jmp LB_56695
LB_56694:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56695:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56692
	btr QWORD [rdi],0
	jmp LB_56693
LB_56692:
	bts QWORD [rdi],0
LB_56693:
	mov r14,r10
	bt r12,4
	jc LB_56700
	btr r12,1
	jmp LB_56701
LB_56700:
	bts r12,1
LB_56701:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56698
	btr QWORD [rdi],1
	jmp LB_56699
LB_56698:
	bts QWORD [rdi],1
LB_56699:
	mov rsi,1
	bt r12,0
	jc LB_56690
	mov rsi,0
	bt r13,0
	jc LB_56690
	jmp LB_56691
LB_56690:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_56691:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_56688
	btr QWORD [rdi],1
	jmp LB_56689
LB_56688:
	bts QWORD [rdi],1
LB_56689:
	mov r8,0
	bts r12,2
	ret
MTC_LB_56664:
	mov r15,0
LB_56703:
	cmp r15,0
	jz LB_56704
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56703
LB_56704:
; _f56320 %_56368 ⊢ %_56377 : %_56377
 ; {>  %_56368~0':_r64 %_56367~1':_r64 %_56366~2':(_lst)◂(_p56318) }
; _f56320 0' ⊢ °1◂0'
; _cns { %_56377 %_56366 } ⊢ %_56378 : %_56378
 ; {>  %_56377~°1◂0':_p56318 %_56367~1':_r64 %_56366~2':(_lst)◂(_p56318) }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_56367 %_56378 } ⊢ %_56379 : %_56379
 ; {>  %_56378~°0◂{ °1◂0' 2' }:(_lst)◂(_p56318) %_56367~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_56379
 ; {>  %_56379~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p56318) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_56707
	btr r12,4
	jmp LB_56708
LB_56707:
	bts r12,4
LB_56708:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_56705
	btr QWORD [rdi],0
	jmp LB_56706
LB_56705:
	bts QWORD [rdi],0
LB_56706:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_56717
	btr r12,1
	jmp LB_56718
LB_56717:
	bts r12,1
LB_56718:
	mov rsi,1
	bt r12,1
	jc LB_56715
	mov rsi,0
	bt r14,0
	jc LB_56715
	jmp LB_56716
LB_56715:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56716:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56713
	btr QWORD [rdi],0
	jmp LB_56714
LB_56713:
	bts QWORD [rdi],0
LB_56714:
	mov r14,r8
	bt r12,2
	jc LB_56721
	btr r12,1
	jmp LB_56722
LB_56721:
	bts r12,1
LB_56722:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56719
	btr QWORD [rdi],1
	jmp LB_56720
LB_56719:
	bts QWORD [rdi],1
LB_56720:
	mov rsi,1
	bt r12,4
	jc LB_56711
	mov rsi,0
	bt r10,0
	jc LB_56711
	jmp LB_56712
LB_56711:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_56712:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_56709
	btr QWORD [rdi],1
	jmp LB_56710
LB_56709:
	bts QWORD [rdi],1
LB_56710:
	mov r8,0
	bts r12,2
	ret
MTC_LB_56702:
LB_56723:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56725
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56724
LB_56725:
	add rsp,8
	ret
LB_56726:
	add rsp,32
	pop r14
LB_56724:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_56760
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_56380 : %_56380
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_56381 : %_56381
 ; {>  %_56380~°1◂{  }:(_lst)◂(t19771'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_56381
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_56381 %_56380 } ⊢ %_56382 : %_56382
 ; {>  %_56381~0':_r64 %_56380~°1◂{  }:(_lst)◂(t19771'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_56382
 ; {>  %_56382~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t19775'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_56754
	btr r12,1
	jmp LB_56755
LB_56754:
	bts r12,1
LB_56755:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56752
	btr QWORD [rdi],0
	jmp LB_56753
LB_56752:
	bts QWORD [rdi],0
LB_56753:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_56758
	mov rsi,0
	bt r14,0
	jc LB_56758
	jmp LB_56759
LB_56758:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56759:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56756
	btr QWORD [rdi],1
	jmp LB_56757
LB_56756:
	bts QWORD [rdi],1
LB_56757:
	mov r8,0
	bts r12,2
	ret
LB_56760:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56762
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56761
LB_56762:
	add rsp,8
	ret
LB_56763:
	add rsp,0
	pop r14
LB_56761:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56324:
NS_E_RDI_56324:
NS_E_56324_ETR_TBL:
NS_E_56324_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56783
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56771
LB_56783:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_56791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_56791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_56791
	jmp LB_56792
LB_56791:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56789
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56789:
	jmp LB_56771
LB_56792:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56796
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56797
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56797:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56798
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56798:
	jmp LB_56771
LB_56796:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_56808
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56808
	jmp LB_56809
LB_56808:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56804
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56804:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56805
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56805:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56806
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56806:
	jmp LB_56771
LB_56809:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_56778
	btr r12,3
	jmp LB_56779
LB_56778:
	bts r12,3
LB_56779:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56776
	btr r12,2
	jmp LB_56777
LB_56776:
	bts r12,2
LB_56777:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56774
	btr r12,1
	jmp LB_56775
LB_56774:
	bts r12,1
LB_56775:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56772
	btr r12,0
	jmp LB_56773
LB_56772:
	bts r12,0
LB_56773:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_56768
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_56810
	btr r12,4
	jmp LB_56811
LB_56810:
	bts r12,4
LB_56811:
	mov r14,r8
	bt r12,2
	jc LB_56812
	btr r12,1
	jmp LB_56813
LB_56812:
	bts r12,1
LB_56813:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_56385 : %_56385
 ; {>  %_56384~1':_r64 %_56383~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_56385
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_56385 %_56383 } ⊢ { %_56386 %_56387 } : { %_56386 %_56387 }
 ; {>  %_56385~2':_r64 %_56384~1':_r64 %_56383~0':_r64 }
	add r8,r13
; _f39 { %_56386 %_56384 } ⊢ { %_56388 %_56389 } : { %_56388 %_56389 }
 ; {>  %_56387~0':_r64 %_56384~1':_r64 %_56386~2':_r64 }
	add r8,r14
; _some %_56388 ⊢ %_56390 : %_56390
 ; {>  %_56387~0':_r64 %_56389~1':_r64 %_56388~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_56390
 ; {>  %_56387~0':_r64 %_56390~°0◂2':(_opn)◂(_r64) %_56389~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_56764
	mov rdi,r13
	call dlt
LB_56764:
	bt r12,1
	jc LB_56765
	mov rdi,r14
	call dlt
LB_56765:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_56766
	btr r12,3
	jmp LB_56767
LB_56766:
	bts r12,3
LB_56767:
	mov r8,0
	bts r12,2
	ret
LB_56768:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56770
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56769
LB_56770:
	add rsp,8
	ret
LB_56771:
	add rsp,64
	pop r14
LB_56769:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56839
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56823
LB_56839:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_56847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_56847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_56847
	jmp LB_56848
LB_56847:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56845
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56845:
	jmp LB_56823
LB_56848:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_56322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56852
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56853
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56853:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56854
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56854:
	jmp LB_56823
LB_56852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_56864
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56864
	jmp LB_56865
LB_56864:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56860
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56860:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56861
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56861:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56862
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56862:
	jmp LB_56823
LB_56865:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_56324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56869
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_56870
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_56870:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56871
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56871:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56872
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56872:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56873
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56873:
	jmp LB_56823
LB_56869:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_56324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56878
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_56879
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_56879:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_56880
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_56880:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56881
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56881:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56882
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56882:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56883
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56883:
	jmp LB_56823
LB_56878:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_56834
	btr r12,5
	jmp LB_56835
LB_56834:
	bts r12,5
LB_56835:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_56832
	btr r12,4
	jmp LB_56833
LB_56832:
	bts r12,4
LB_56833:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_56830
	btr r12,3
	jmp LB_56831
LB_56830:
	bts r12,3
LB_56831:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56828
	btr r12,2
	jmp LB_56829
LB_56828:
	bts r12,2
LB_56829:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56826
	btr r12,1
	jmp LB_56827
LB_56826:
	bts r12,1
LB_56827:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56824
	btr r12,0
	jmp LB_56825
LB_56824:
	bts r12,0
LB_56825:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_56820
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_56885
	btr r12,6
	jmp LB_56886
LB_56885:
	bts r12,6
LB_56886:
	mov r9,r11
	bt r12,5
	jc LB_56887
	btr r12,3
	jmp LB_56888
LB_56887:
	bts r12,3
LB_56888:
	mov r11,r8
	bt r12,2
	jc LB_56889
	btr r12,5
	jmp LB_56890
LB_56889:
	bts r12,5
LB_56890:
	mov r8,r10
	bt r12,4
	jc LB_56891
	btr r12,2
	jmp LB_56892
LB_56891:
	bts r12,2
LB_56892:
	mov r10,r14
	bt r12,1
	jc LB_56893
	btr r12,4
	jmp LB_56894
LB_56893:
	bts r12,4
LB_56894:
	mov r14,r11
	bt r12,5
	jc LB_56895
	btr r12,1
	jmp LB_56896
LB_56895:
	bts r12,1
LB_56896:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_56395 : %_56395
 ; {>  %_56393~2':_r64 %_56392~1':_r64 %_56394~3':_r64 %_56391~0':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_56395
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_56395 %_56391 } ⊢ { %_56396 %_56397 } : { %_56396 %_56397 }
 ; {>  %_56393~2':_r64 %_56395~4':_r64 %_56392~1':_r64 %_56394~3':_r64 %_56391~0':_r64 }
	add r10,r13
; _f39 { %_56396 %_56392 } ⊢ { %_56398 %_56399 } : { %_56398 %_56399 }
 ; {>  %_56393~2':_r64 %_56392~1':_r64 %_56396~4':_r64 %_56394~3':_r64 %_56397~0':_r64 }
	add r10,r14
; _f39 { %_56398 %_56393 } ⊢ { %_56400 %_56401 } : { %_56400 %_56401 }
 ; {>  %_56399~1':_r64 %_56393~2':_r64 %_56398~4':_r64 %_56394~3':_r64 %_56397~0':_r64 }
	add r10,r8
; _f39 { %_56400 %_56394 } ⊢ { %_56402 %_56403 } : { %_56402 %_56403 }
 ; {>  %_56399~1':_r64 %_56401~2':_r64 %_56400~4':_r64 %_56394~3':_r64 %_56397~0':_r64 }
	add r10,r9
; _some %_56402 ⊢ %_56404 : %_56404
 ; {>  %_56399~1':_r64 %_56401~2':_r64 %_56403~3':_r64 %_56402~4':_r64 %_56397~0':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_56404
 ; {>  %_56404~°0◂4':(_opn)◂(_r64) %_56399~1':_r64 %_56401~2':_r64 %_56403~3':_r64 %_56397~0':_r64 }
; 	∎ °0◂4'
	bt r12,1
	jc LB_56814
	mov rdi,r14
	call dlt
LB_56814:
	bt r12,2
	jc LB_56815
	mov rdi,r8
	call dlt
LB_56815:
	bt r12,3
	jc LB_56816
	mov rdi,r9
	call dlt
LB_56816:
	bt r12,0
	jc LB_56817
	mov rdi,r13
	call dlt
LB_56817:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_56818
	btr r12,3
	jmp LB_56819
LB_56818:
	bts r12,3
LB_56819:
	mov r8,0
	bts r12,2
	ret
LB_56820:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56822
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56821
LB_56822:
	add rsp,8
	ret
LB_56823:
	add rsp,96
	pop r14
LB_56821:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_56321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56911
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56903
LB_56911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_56324_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56916
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56917
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56917:
	jmp LB_56903
LB_56916:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56906
	btr r12,1
	jmp LB_56907
LB_56906:
	bts r12,1
LB_56907:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56904
	btr r12,0
	jmp LB_56905
LB_56904:
	bts r12,0
LB_56905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56900
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_56405 %_56406 } ⊢ { %_56407 %_56408 } : { %_56407 %_56408 }
 ; {>  %_56406~1':_r64 %_56405~0':_r64 }
	add r13,r14
; _some %_56407 ⊢ %_56409 : %_56409
 ; {>  %_56408~1':_r64 %_56407~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_56409
 ; {>  %_56408~1':_r64 %_56409~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_56897
	mov rdi,r14
	call dlt
LB_56897:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56898
	btr r12,3
	jmp LB_56899
LB_56898:
	bts r12,3
LB_56899:
	mov r8,0
	bts r12,2
	ret
LB_56900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56902
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56901
LB_56902:
	add rsp,8
	ret
LB_56903:
	add rsp,32
	pop r14
LB_56901:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56941:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_56941:
MTC_LB_56942:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56943
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
	jnc LB_56944
	bt QWORD [rax],0
	jc LB_56945
	btr r12,7
	jmp LB_56946
LB_56945:
	bts r12,7
LB_56946:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56944:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_56949
	btr r12,8
	jmp LB_56950
LB_56949:
	bts r12,8
LB_56950:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_56947
	btr r12,5
	jmp LB_56948
LB_56947:
	bts r12,5
LB_56948:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_56953
	btr r12,8
	jmp LB_56954
LB_56953:
	bts r12,8
LB_56954:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_56951
	btr r12,6
	jmp LB_56952
LB_56951:
	bts r12,6
LB_56952:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_56955:
	cmp r15,0
	jz LB_56956
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56955
LB_56956:
MTC_LB_56957:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_56958
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
	jnc LB_56959
	bt QWORD [rax],0
	jc LB_56960
	btr r12,7
	jmp LB_56961
LB_56960:
	bts r12,7
LB_56961:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56959:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_56962
	btr r12,4
	jmp LB_56963
LB_56962:
	bts r12,4
LB_56963:
LB_56964:
	cmp r15,0
	jz LB_56965
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56964
LB_56965:
; _f41 %_56926 ⊢ { %_56927 %_56928 } : { %_56927 %_56928 }
 ; {>  %_56921~2':_stg %_56926~4':_r64 %_56919~0':_stg %_56922~3':_r64 %_56920~1':_r64 %_56925~6':(_lst)◂(_p56318) }
	mov r11,r10
	bts r12,5
; _f23 { %_56928 %_56919 %_56920 %_56921 %_56922 } ⊢ { %_56929 %_56930 %_56931 %_56932 %_56933 } : { %_56929 %_56930 %_56931 %_56932 %_56933 }
 ; {>  %_56921~2':_stg %_56927~4':_r64 %_56928~5':_r64 %_56919~0':_stg %_56922~3':_r64 %_56920~1':_r64 %_56925~6':(_lst)◂(_p56318) }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_56970
	btr r12,4
	jmp LB_56971
LB_56970:
	bts r12,4
LB_56971:
	mov r9,r8
	bt r12,2
	jc LB_56972
	btr r12,3
	jmp LB_56973
LB_56972:
	bts r12,3
LB_56973:
	mov r8,r14
	bt r12,1
	jc LB_56974
	btr r12,2
	jmp LB_56975
LB_56974:
	bts r12,2
LB_56975:
	mov r14,r13
	bt r12,0
	jc LB_56976
	btr r12,1
	jmp LB_56977
LB_56976:
	bts r12,1
LB_56977:
	mov r13,r11
	bt r12,5
	jc LB_56978
	btr r12,0
	jmp LB_56979
LB_56978:
	bts r12,0
LB_56979:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_56980
	btr r12,5
	jmp LB_56981
LB_56980:
	bts r12,5
LB_56981:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_56968
	btr r12,6
	jmp LB_56969
LB_56968:
	bts r12,6
LB_56969:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_56966
	btr r12,4
	jmp LB_56967
LB_56966:
	bts r12,4
LB_56967:
	add rsp,24
; _f56941 { %_56930 %_56931 %_56932 %_56933 %_56925 } ⊢ { %_56934 %_56935 } : { %_56934 %_56935 }
 ; {>  %_56927~4':_r64 %_56931~2':_r64 %_56932~3':_stg %_56930~1':_stg %_56929~0':_r64 %_56933~5':_r64 %_56925~6':(_lst)◂(_p56318) }
; _f56941 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_56986
	btr r12,0
	jmp LB_56987
LB_56986:
	bts r12,0
LB_56987:
	mov r14,r8
	bt r12,2
	jc LB_56988
	btr r12,1
	jmp LB_56989
LB_56988:
	bts r12,1
LB_56989:
	mov r8,r9
	bt r12,3
	jc LB_56990
	btr r12,2
	jmp LB_56991
LB_56990:
	bts r12,2
LB_56991:
	mov r9,r11
	bt r12,5
	jc LB_56992
	btr r12,3
	jmp LB_56993
LB_56992:
	bts r12,3
LB_56993:
	mov r10,rcx
	bt r12,6
	jc LB_56994
	btr r12,4
	jmp LB_56995
LB_56994:
	bts r12,4
LB_56995:
	call NS_E_56941
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_56996
	btr r12,2
	jmp LB_56997
LB_56996:
	bts r12,2
LB_56997:
	mov r14,r13
	bt r12,0
	jc LB_56998
	btr r12,1
	jmp LB_56999
LB_56998:
	bts r12,1
LB_56999:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_56984
	btr r12,4
	jmp LB_56985
LB_56984:
	bts r12,4
LB_56985:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_56982
	btr r12,0
	jmp LB_56983
LB_56982:
	bts r12,0
LB_56983:
	add rsp,24
; ∎ { %_56934 %_56935 }
 ; {>  %_56935~2':_stg %_56927~4':_r64 %_56934~1':_stg %_56929~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_57000
	mov rdi,r10
	call dlt
LB_57000:
	bt r12,0
	jc LB_57001
	mov rdi,r13
	call dlt
LB_57001:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_57002
	btr r12,0
	jmp LB_57003
LB_57002:
	bts r12,0
LB_57003:
	mov r14,r8
	bt r12,2
	jc LB_57004
	btr r12,1
	jmp LB_57005
LB_57004:
	bts r12,1
LB_57005:
	ret
MTC_LB_56958:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_57006
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
	jnc LB_57007
	bt QWORD [rax],0
	jc LB_57008
	btr r12,7
	jmp LB_57009
LB_57008:
	bts r12,7
LB_57009:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_57007:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_57010
	btr r12,4
	jmp LB_57011
LB_57010:
	bts r12,4
LB_57011:
LB_57012:
	cmp r15,0
	jz LB_57013
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57012
LB_57013:
; _f39 { %_56920 %_56936 } ⊢ { %_56937 %_56938 } : { %_56937 %_56938 }
 ; {>  %_56921~2':_stg %_56919~0':_stg %_56936~4':_r64 %_56922~3':_r64 %_56920~1':_r64 %_56925~6':(_lst)◂(_p56318) }
	add r14,r10
; _f56941 { %_56919 %_56937 %_56921 %_56922 %_56925 } ⊢ { %_56939 %_56940 } : { %_56939 %_56940 }
 ; {>  %_56921~2':_stg %_56938~4':_r64 %_56919~0':_stg %_56922~3':_r64 %_56937~1':_r64 %_56925~6':(_lst)◂(_p56318) }
; _f56941 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_57016
	btr r12,4
	jmp LB_57017
LB_57016:
	bts r12,4
LB_57017:
	call NS_E_56941
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_57014
	btr r12,4
	jmp LB_57015
LB_57014:
	bts r12,4
LB_57015:
	add rsp,16
; ∎ { %_56939 %_56940 }
 ; {>  %_56938~4':_r64 %_56939~0':_stg %_56940~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_57018
	mov rdi,r10
	call dlt
LB_57018:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_57006:
MTC_LB_56943:
	mov r15,0
LB_57020:
	cmp r15,0
	jz LB_57021
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57020
LB_57021:
; ∎ { %_56919 %_56921 }
 ; {>  %_56921~2':_stg %_56923~4':(_lst)◂(_p56318) %_56919~0':_stg %_56922~3':_r64 %_56920~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_57022
	mov rdi,r10
	call dlt
LB_57022:
	bt r12,3
	jc LB_57023
	mov rdi,r9
	call dlt
LB_57023:
	bt r12,1
	jc LB_57024
	mov rdi,r14
	call dlt
LB_57024:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_57025
	btr r12,1
	jmp LB_57026
LB_57025:
	bts r12,1
LB_57026:
	ret
MTC_LB_57019:
NS_E_57042:
; 	|» 0'
NS_E_RDI_57042:
; » 0xr0 |~ {  } ⊢ %_57028 : %_57028
 ; {>  %_57027~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_57028
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f56323 { %_57027 %_57028 } ⊢ { %_57029 %_57030 %_57031 } : { %_57029 %_57030 %_57031 }
 ; {>  %_57027~0':_stg %_57028~1':_r64 }
; _f56323 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_56323
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_57043
	btr r12,4
	jmp LB_57044
LB_57043:
	bts r12,4
LB_57044:
	mov r8,r9
	bt r12,3
	jc LB_57047
	btr r12,2
	jmp LB_57048
LB_57047:
	bts r12,2
LB_57048:
	mov rsi,1
	bt r12,2
	jc LB_57045
	mov rsi,0
	bt r8,0
	jc LB_57045
	jmp LB_57046
LB_57045:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_57046:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_57049:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_57050
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
	jnc LB_57051
	bt QWORD [rax],0
	jc LB_57052
	btr r12,5
	jmp LB_57053
LB_57052:
	bts r12,5
LB_57053:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_57051:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_57056
	btr r12,6
	jmp LB_57057
LB_57056:
	bts r12,6
LB_57057:
	mov r9,rcx
	bt r12,6
	jc LB_57054
	btr r12,3
	jmp LB_57055
LB_57054:
	bts r12,3
LB_57055:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_57060
	btr r12,6
	jmp LB_57061
LB_57060:
	bts r12,6
LB_57061:
	mov r10,rcx
	bt r12,6
	jc LB_57058
	btr r12,4
	jmp LB_57059
LB_57058:
	bts r12,4
LB_57059:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_57062:
	cmp r15,0
	jz LB_57063
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57062
LB_57063:
; _f19 %_57032 ⊢ { %_57034 %_57035 } : { %_57034 %_57035 }
 ; {>  %_57033~4':(_lst)◂(_p56318) %_57029~0':_stg %_57032~3':_r64 %_57030~1':_r64 }
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
	jc LB_57070
	btr r12,0
	jmp LB_57071
LB_57070:
	bts r12,0
LB_57071:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_57072
	btr r12,2
	jmp LB_57073
LB_57072:
	bts r12,2
LB_57073:
	mov r9,r14
	bt r12,1
	jc LB_57074
	btr r12,3
	jmp LB_57075
LB_57074:
	bts r12,3
LB_57075:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_57068
	btr r12,4
	jmp LB_57069
LB_57068:
	bts r12,4
LB_57069:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_57066
	btr r12,1
	jmp LB_57067
LB_57066:
	bts r12,1
LB_57067:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_57064
	btr r12,0
	jmp LB_57065
LB_57064:
	bts r12,0
LB_57065:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_57036 : %_57036
 ; {>  %_57035~3':_stg %_57033~4':(_lst)◂(_p56318) %_57029~0':_stg %_57034~2':_r64 %_57030~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_57036
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_57037 : %_57037
 ; {>  %_57036~5':_r64 %_57035~3':_stg %_57033~4':(_lst)◂(_p56318) %_57029~0':_stg %_57034~2':_r64 %_57030~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_57037
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f56941 { %_57029 %_57036 %_57035 %_57037 %_57033 } ⊢ { %_57038 %_57039 } : { %_57038 %_57039 }
 ; {>  %_57036~5':_r64 %_57035~3':_stg %_57033~4':(_lst)◂(_p56318) %_57029~0':_stg %_57034~2':_r64 %_57037~6':_r64 %_57030~1':_r64 }
; _f56941 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_57080
	btr r12,1
	jmp LB_57081
LB_57080:
	bts r12,1
LB_57081:
	mov r8,r9
	bt r12,3
	jc LB_57082
	btr r12,2
	jmp LB_57083
LB_57082:
	bts r12,2
LB_57083:
	mov r9,rcx
	bt r12,6
	jc LB_57084
	btr r12,3
	jmp LB_57085
LB_57084:
	bts r12,3
LB_57085:
	call NS_E_56941
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_57086
	btr r12,3
	jmp LB_57087
LB_57086:
	bts r12,3
LB_57087:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_57078
	btr r12,2
	jmp LB_57079
LB_57078:
	bts r12,2
LB_57079:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_57076
	btr r12,1
	jmp LB_57077
LB_57076:
	bts r12,1
LB_57077:
	add rsp,24
; _some %_57039 ⊢ %_57040 : %_57040
 ; {>  %_57034~2':_r64 %_57038~0':_stg %_57030~1':_r64 %_57039~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_57038 %_57040 }
 ; {>  %_57040~°0◂3':(_opn)◂(_stg) %_57034~2':_r64 %_57038~0':_stg %_57030~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_57088
	mov rdi,r8
	call dlt
LB_57088:
	bt r12,1
	jc LB_57089
	mov rdi,r14
	call dlt
LB_57089:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_57092
	btr r12,1
	jmp LB_57093
LB_57092:
	bts r12,1
LB_57093:
	mov rsi,1
	bt r12,1
	jc LB_57090
	mov rsi,0
	bt r14,0
	jc LB_57090
	jmp LB_57091
LB_57090:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_57091:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_57050:
	mov r15,0
LB_57095:
	cmp r15,0
	jz LB_57096
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57095
LB_57096:
; _none {  } ⊢ %_57041 : %_57041
 ; {>  %_57029~0':_stg %_57031~2':(_opn)◂({ _r64 (_lst)◂(_p56318) }) %_57030~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_57029 %_57041 }
 ; {>  %_57041~°1◂{  }:(_opn)◂(t19958'(0)) %_57029~0':_stg %_57031~2':(_opn)◂({ _r64 (_lst)◂(_p56318) }) %_57030~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_57097
	mov rdi,r8
	call dlt
LB_57097:
	bt r12,1
	jc LB_57098
	mov rdi,r14
	call dlt
LB_57098:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_57099
	mov rsi,0
	bt r14,0
	jc LB_57099
	jmp LB_57100
LB_57099:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_57100:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_57094:
NS_E_57104:
NS_E_RDI_57104:
; » _^ ..
	mov rax,70
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
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
; //
	mov r13,rax
	btr r12,0
; _f57042 %_57101 ⊢ { %_57102 %_57103 } : { %_57102 %_57103 }
 ; {>  %_57101~0':_stg }
; _f57042 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_57042
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_57103~1':(_opn)◂(_stg) %_57102~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_57105
	mov rdi,r14
	call dlt
LB_57105:
	bt r12,0
	jc LB_57106
	mov rdi,r13
	call dlt
LB_57106:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_57107:
NS_E_RDI_57107:
NS_E_57107_ETR_TBL:
NS_E_57107_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_57136
LB_57135:
	add r14,1
LB_57136:
	cmp r14,r10
	jge LB_57137
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57135
	cmp al,10
	jz LB_57135
	cmp al,32
	jz LB_57135
LB_57137:
	push r10
	call NS_E_56156_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57138
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57128
LB_57138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_57141
LB_57140:
	add r14,1
LB_57141:
	cmp r14,r10
	jge LB_57142
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57140
	cmp al,10
	jz LB_57140
	cmp al,32
	jz LB_57140
LB_57142:
	add r14,1
	cmp r14,r10
	jg LB_57146
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_57146
	jmp LB_57147
LB_57146:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57144
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57144:
	jmp LB_57128
LB_57147:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_57149
LB_57148:
	add r14,1
LB_57149:
	cmp r14,r10
	jge LB_57150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57148
	cmp al,10
	jz LB_57148
	cmp al,32
	jz LB_57148
LB_57150:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57151
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57152
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57152:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57153
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57153:
	jmp LB_57128
LB_57151:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57133
	btr r12,2
	jmp LB_57134
LB_57133:
	bts r12,2
LB_57134:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57131
	btr r12,1
	jmp LB_57132
LB_57131:
	bts r12,1
LB_57132:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57129
	btr r12,0
	jmp LB_57130
LB_57129:
	bts r12,0
LB_57130:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57125
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_57155
	btr r12,3
	jmp LB_57156
LB_57155:
	bts r12,3
LB_57156:
	mov r14,r8
	bt r12,2
	jc LB_57157
	btr r12,1
	jmp LB_57158
LB_57157:
	bts r12,1
LB_57158:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56215 { %_57108 %_57109 } ⊢ %_57110 : %_57110
 ; {>  %_57109~1':_p56214 %_57108~0':_stg }
; _f56215 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57110 ⊢ %_57111 : %_57111
 ; {>  %_57110~°0◂{ 0' 1' }:_p56214 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57111
 ; {>  %_57111~°0◂°0◂{ 0' 1' }:(_opn)◂(_p56214) }
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
	jc LB_57119
	btr r12,2
	jmp LB_57120
LB_57119:
	bts r12,2
LB_57120:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57117
	btr QWORD [rdi],0
	jmp LB_57118
LB_57117:
	bts QWORD [rdi],0
LB_57118:
	mov r8,r14
	bt r12,1
	jc LB_57123
	btr r12,2
	jmp LB_57124
LB_57123:
	bts r12,2
LB_57124:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57121
	btr QWORD [rdi],1
	jmp LB_57122
LB_57121:
	bts QWORD [rdi],1
LB_57122:
	mov rsi,1
	bt r12,3
	jc LB_57115
	mov rsi,0
	bt r9,0
	jc LB_57115
	jmp LB_57116
LB_57115:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57116:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57125:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57127
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57126
LB_57127:
	add rsp,8
	ret
LB_57128:
	add rsp,48
	pop r14
LB_57126:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_57170
LB_57169:
	add r14,1
LB_57170:
	cmp r14,r10
	jge LB_57171
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57169
	cmp al,32
	jz LB_57169
LB_57171:
	push r10
	call NS_E_56156_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57172
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57166
LB_57172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57167
	btr r12,0
	jmp LB_57168
LB_57167:
	bts r12,0
LB_57168:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57163
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56216 %_57112 ⊢ %_57113 : %_57113
 ; {>  %_57112~0':_stg }
; _f56216 0' ⊢ °1◂0'
; _some %_57113 ⊢ %_57114 : %_57114
 ; {>  %_57113~°1◂0':_p56214 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57114
 ; {>  %_57114~°0◂°1◂0':(_opn)◂(_p56214) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57161
	btr r12,3
	jmp LB_57162
LB_57161:
	bts r12,3
LB_57162:
	mov rsi,1
	bt r12,3
	jc LB_57159
	mov rsi,0
	bt r9,0
	jc LB_57159
	jmp LB_57160
LB_57159:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57160:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57163:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57165
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57164
LB_57165:
	add rsp,8
	ret
LB_57166:
	add rsp,16
	pop r14
LB_57164:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57174:
NS_E_RDI_57174:
NS_E_57174_ETR_TBL:
NS_E_57174_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_55538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57199
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57191
LB_57199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_57207
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_57207
	jmp LB_57208
LB_57207:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57205
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57205:
	jmp LB_57191
LB_57208:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57194
	btr r12,1
	jmp LB_57195
LB_57194:
	bts r12,1
LB_57195:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57192
	btr r12,0
	jmp LB_57193
LB_57192:
	bts r12,0
LB_57193:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57188
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56292 %_57175 ⊢ %_57176 : %_57176
 ; {>  %_57175~0':_r64 }
; _f56292 0' ⊢ °0◂0'
; _some %_57176 ⊢ %_57177 : %_57177
 ; {>  %_57176~°0◂0':_p56238 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57177
 ; {>  %_57177~°0◂°0◂0':(_opn)◂(_p56238) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57186
	btr r12,3
	jmp LB_57187
LB_57186:
	bts r12,3
LB_57187:
	mov rsi,1
	bt r12,3
	jc LB_57184
	mov rsi,0
	bt r9,0
	jc LB_57184
	jmp LB_57185
LB_57184:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57185:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57188:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57190
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57189
LB_57190:
	add rsp,8
	ret
LB_57191:
	add rsp,32
	pop r14
LB_57189:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_55659_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57222
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57216
LB_57222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57217
	btr r12,0
	jmp LB_57218
LB_57217:
	bts r12,0
LB_57218:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57213
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56293 %_57178 ⊢ %_57179 : %_57179
 ; {>  %_57178~0':_stg }
; _f56293 0' ⊢ °1◂0'
; _some %_57179 ⊢ %_57180 : %_57180
 ; {>  %_57179~°1◂0':_p56238 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57180
 ; {>  %_57180~°0◂°1◂0':(_opn)◂(_p56238) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57211
	btr r12,3
	jmp LB_57212
LB_57211:
	bts r12,3
LB_57212:
	mov rsi,1
	bt r12,3
	jc LB_57209
	mov rsi,0
	bt r9,0
	jc LB_57209
	jmp LB_57210
LB_57209:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57210:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57213:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57215
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57214
LB_57215:
	add rsp,8
	ret
LB_57216:
	add rsp,16
	pop r14
LB_57214:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57237
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57231
LB_57237:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57232
	btr r12,0
	jmp LB_57233
LB_57232:
	bts r12,0
LB_57233:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57228
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56294 %_57181 ⊢ %_57182 : %_57182
 ; {>  %_57181~0':_p56214 }
; _f56294 0' ⊢ °2◂0'
; _some %_57182 ⊢ %_57183 : %_57183
 ; {>  %_57182~°2◂0':_p56238 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_57183
 ; {>  %_57183~°0◂°2◂0':(_opn)◂(_p56238) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57226
	btr r12,3
	jmp LB_57227
LB_57226:
	bts r12,3
LB_57227:
	mov rsi,1
	bt r12,3
	jc LB_57224
	mov rsi,0
	bt r9,0
	jc LB_57224
	jmp LB_57225
LB_57224:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57225:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57228:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57230
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57229
LB_57230:
	add rsp,8
	ret
LB_57231:
	add rsp,16
	pop r14
LB_57229:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57240:
NS_E_RDI_57240:
NS_E_57240_ETR_TBL:
NS_E_57240_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_57247
LB_57246:
	add r14,1
LB_57247:
	cmp r14,r10
	jge LB_57248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57246
	cmp al,32
	jz LB_57246
LB_57248:
	add r14,1
	cmp r14,r10
	jg LB_57251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_57251
	jmp LB_57252
LB_57251:
	jmp LB_57242
LB_57252:
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
LB_57257:
	jmp LB_57254
LB_57253:
	add r14,1
LB_57254:
	cmp r14,r10
	jge LB_57255
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57253
	cmp al,32
	jz LB_57253
LB_57255:
	add r14,1
	cmp r14,r10
	jg LB_57256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_57256
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
	jmp LB_57257
LB_57256:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57243
	btr QWORD [rdi],1
LB_57243:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57244
	btr QWORD [rdi],0
LB_57244:
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
LB_57242:
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
NS_E_57267:
; 	|» { 0' 1' }
NS_E_RDI_57267:
MTC_LB_57268:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_57269
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
	jnc LB_57270
	bt QWORD [rax],0
	jc LB_57271
	btr r12,4
	jmp LB_57272
LB_57271:
	bts r12,4
LB_57272:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_57270:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_57275
	btr r12,5
	jmp LB_57276
LB_57275:
	bts r12,5
LB_57276:
	mov r8,r11
	bt r12,5
	jc LB_57273
	btr r12,2
	jmp LB_57274
LB_57273:
	bts r12,2
LB_57274:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_57279
	btr r12,5
	jmp LB_57280
LB_57279:
	bts r12,5
LB_57280:
	mov r9,r11
	bt r12,5
	jc LB_57277
	btr r12,3
	jmp LB_57278
LB_57277:
	bts r12,3
LB_57278:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_57281:
	cmp r15,0
	jz LB_57282
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57281
LB_57282:
; _f56289 { %_57261 %_57263 } ⊢ %_57265 : %_57265
 ; {>  %_57264~3':(_lst)◂(_p56237) %_57261~0':_p56237 %_57263~2':_p56237 }
; _f56289 { 0' 2' } ⊢ °1◂{ 0' 2' }
; _f57267 { %_57265 %_57264 } ⊢ %_57266 : %_57266
 ; {>  %_57264~3':(_lst)◂(_p56237) %_57265~°1◂{ 0' 2' }:_p56237 }
; _f57267 { °1◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °1◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_57283
	btr r12,1
	jmp LB_57284
LB_57283:
	bts r12,1
LB_57284:
	mov r9,r13
	bt r12,0
	jc LB_57285
	btr r12,3
	jmp LB_57286
LB_57285:
	bts r12,3
LB_57286:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_57291
	btr r12,4
	jmp LB_57292
LB_57291:
	bts r12,4
LB_57292:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_57289
	btr QWORD [rdi],0
	jmp LB_57290
LB_57289:
	bts QWORD [rdi],0
LB_57290:
	mov r10,r8
	bt r12,2
	jc LB_57295
	btr r12,4
	jmp LB_57296
LB_57295:
	bts r12,4
LB_57296:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_57293
	btr QWORD [rdi],1
	jmp LB_57294
LB_57293:
	bts QWORD [rdi],1
LB_57294:
	mov rsi,1
	bt r12,0
	jc LB_57287
	mov rsi,0
	bt r13,0
	jc LB_57287
	jmp LB_57288
LB_57287:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_57288:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_57267
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_57266
 ; {>  %_57266~0':_p56237 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_57269:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_57297
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
	jnc LB_57298
	bt QWORD [rax],0
	jc LB_57299
	btr r12,2
	jmp LB_57300
LB_57299:
	bts r12,2
LB_57300:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_57298:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_57301:
	cmp r15,0
	jz LB_57302
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57301
LB_57302:
; ∎ %_57261
 ; {>  %_57261~0':_p56237 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_57297:
NS_E_57303:
NS_E_RDI_57303:
NS_E_57303_ETR_TBL:
NS_E_57303_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_57350
LB_57349:
	add r14,1
LB_57350:
	cmp r14,r10
	jge LB_57351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57349
	cmp al,10
	jz LB_57349
	cmp al,32
	jz LB_57349
LB_57351:
	add r14,1
	cmp r14,r10
	jg LB_57354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_57354
	jmp LB_57355
LB_57354:
	jmp LB_57342
LB_57355:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_57357
LB_57356:
	add r14,1
LB_57357:
	cmp r14,r10
	jge LB_57358
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57356
	cmp al,10
	jz LB_57356
	cmp al,32
	jz LB_57356
LB_57358:
	push r10
	call NS_E_57304_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57359
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57360:
	jmp LB_57342
LB_57359:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_57363
LB_57362:
	add r14,1
LB_57363:
	cmp r14,r10
	jge LB_57364
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57362
	cmp al,10
	jz LB_57362
	cmp al,32
	jz LB_57362
LB_57364:
	add r14,1
	cmp r14,r10
	jg LB_57369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_57369
	jmp LB_57370
LB_57369:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57366
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57366:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57367
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57367:
	jmp LB_57342
LB_57370:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57347
	btr r12,2
	jmp LB_57348
LB_57347:
	bts r12,2
LB_57348:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57345
	btr r12,1
	jmp LB_57346
LB_57345:
	bts r12,1
LB_57346:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57343
	btr r12,0
	jmp LB_57344
LB_57343:
	bts r12,0
LB_57344:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57339
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_57371
	btr r12,3
	jmp LB_57372
LB_57371:
	bts r12,3
LB_57372:
	mov r13,r14
	bt r12,1
	jc LB_57373
	btr r12,0
	jmp LB_57374
LB_57373:
	bts r12,0
LB_57374:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56284 %_57307 ⊢ %_57308 : %_57308
 ; {>  %_57307~0':(_lst)◂(_p56235) }
; _f56284 0' ⊢ °0◂0'
; _some %_57308 ⊢ %_57309 : %_57309
 ; {>  %_57308~°0◂0':_p56235 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57309
 ; {>  %_57309~°0◂°0◂0':(_opn)◂(_p56235) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57337
	btr r12,3
	jmp LB_57338
LB_57337:
	bts r12,3
LB_57338:
	mov rsi,1
	bt r12,3
	jc LB_57335
	mov rsi,0
	bt r9,0
	jc LB_57335
	jmp LB_57336
LB_57335:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57336:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57339:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57341
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57340
LB_57341:
	add rsp,8
	ret
LB_57342:
	add rsp,48
	pop r14
LB_57340:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; src
	jmp LB_57386
LB_57385:
	add r14,1
LB_57386:
	cmp r14,r10
	jge LB_57387
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57385
	cmp al,10
	jz LB_57385
	cmp al,32
	jz LB_57385
LB_57387:
	push r10
	call NS_E_57306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57388
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57382
LB_57388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57383
	btr r12,0
	jmp LB_57384
LB_57383:
	bts r12,0
LB_57384:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57379
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56285 %_57310 ⊢ %_57311 : %_57311
 ; {>  %_57310~0':_p56233 }
; _f56285 0' ⊢ °1◂0'
; _some %_57311 ⊢ %_57312 : %_57312
 ; {>  %_57311~°1◂0':_p56235 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57312
 ; {>  %_57312~°0◂°1◂0':(_opn)◂(_p56235) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57377
	btr r12,3
	jmp LB_57378
LB_57377:
	bts r12,3
LB_57378:
	mov rsi,1
	bt r12,3
	jc LB_57375
	mov rsi,0
	bt r9,0
	jc LB_57375
	jmp LB_57376
LB_57375:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57376:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57379:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57381
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57380
LB_57381:
	add rsp,8
	ret
LB_57382:
	add rsp,16
	pop r14
LB_57380:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57304:
NS_E_RDI_57304:
NS_E_57304_ETR_TBL:
NS_E_57304_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; src_ptn
	jmp LB_57409
LB_57408:
	add r14,1
LB_57409:
	cmp r14,r10
	jge LB_57410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57408
	cmp al,10
	jz LB_57408
	cmp al,32
	jz LB_57408
LB_57410:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57411
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57403
LB_57411:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_57414
LB_57413:
	add r14,1
LB_57414:
	cmp r14,r10
	jge LB_57415
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57413
	cmp al,10
	jz LB_57413
	cmp al,32
	jz LB_57413
LB_57415:
	push r10
	call NS_E_57304_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57416
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57417
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57417:
	jmp LB_57403
LB_57416:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57406
	btr r12,1
	jmp LB_57407
LB_57406:
	bts r12,1
LB_57407:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57404
	btr r12,0
	jmp LB_57405
LB_57404:
	bts r12,0
LB_57405:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57400
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_57313 %_57314 } ⊢ %_57315 : %_57315
 ; {>  %_57314~1':(_lst)◂(_p56235) %_57313~0':_p56235 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57315 ⊢ %_57316 : %_57316
 ; {>  %_57315~°0◂{ 0' 1' }:(_lst)◂(_p56235) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57316
 ; {>  %_57316~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p56235)) }
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
	jc LB_57394
	btr r12,2
	jmp LB_57395
LB_57394:
	bts r12,2
LB_57395:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57392
	btr QWORD [rdi],0
	jmp LB_57393
LB_57392:
	bts QWORD [rdi],0
LB_57393:
	mov r8,r14
	bt r12,1
	jc LB_57398
	btr r12,2
	jmp LB_57399
LB_57398:
	bts r12,2
LB_57399:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57396
	btr QWORD [rdi],1
	jmp LB_57397
LB_57396:
	bts QWORD [rdi],1
LB_57397:
	mov rsi,1
	bt r12,3
	jc LB_57390
	mov rsi,0
	bt r9,0
	jc LB_57390
	jmp LB_57391
LB_57390:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57391:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57400:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57402
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57401
LB_57402:
	add rsp,8
	ret
LB_57403:
	add rsp,32
	pop r14
LB_57401:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57421
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57317 : %_57317
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57317 ⊢ %_57318 : %_57318
 ; {>  %_57317~°1◂{  }:(_lst)◂(t20064'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57318
 ; {>  %_57318~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20067'(0))) }
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
	jc LB_57419
	mov rsi,0
	bt r9,0
	jc LB_57419
	jmp LB_57420
LB_57419:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57420:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57423
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57422
LB_57423:
	add rsp,8
	ret
LB_57424:
	add rsp,0
	pop r14
LB_57422:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57305:
NS_E_RDI_57305:
NS_E_57305_ETR_TBL:
NS_E_57305_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_57462
LB_57461:
	add r14,1
LB_57462:
	cmp r14,r10
	jge LB_57463
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57461
	cmp al,10
	jz LB_57461
	cmp al,32
	jz LB_57461
LB_57463:
	add r14,1
	cmp r14,r10
	jg LB_57466
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_57466
	jmp LB_57467
LB_57466:
	jmp LB_57440
LB_57467:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_57449
LB_57448:
	add r14,1
LB_57449:
	cmp r14,r10
	jge LB_57450
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57448
	cmp al,10
	jz LB_57448
	cmp al,32
	jz LB_57448
LB_57450:
	push r10
	call NS_E_57306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57451
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57452
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57452:
	jmp LB_57441
LB_57451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_57455
LB_57454:
	add r14,1
LB_57455:
	cmp r14,r10
	jge LB_57456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57454
	cmp al,10
	jz LB_57454
	cmp al,32
	jz LB_57454
LB_57456:
	push r10
	call NS_E_57305_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57457
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57458
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57458:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57459
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57459:
	jmp LB_57441
LB_57457:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57446
	btr r12,2
	jmp LB_57447
LB_57446:
	bts r12,2
LB_57447:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57444
	btr r12,1
	jmp LB_57445
LB_57444:
	bts r12,1
LB_57445:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57442
	btr r12,0
	jmp LB_57443
LB_57442:
	bts r12,0
LB_57443:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57437
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_57468
	btr r12,3
	jmp LB_57469
LB_57468:
	bts r12,3
LB_57469:
	mov r14,r8
	bt r12,2
	jc LB_57470
	btr r12,1
	jmp LB_57471
LB_57470:
	bts r12,1
LB_57471:
	mov r8,r13
	bt r12,0
	jc LB_57472
	btr r12,2
	jmp LB_57473
LB_57472:
	bts r12,2
LB_57473:
	mov r13,r9
	bt r12,3
	jc LB_57474
	btr r12,0
	jmp LB_57475
LB_57474:
	bts r12,0
LB_57475:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56285 %_57319 ⊢ %_57321 : %_57321
 ; {>  %_57320~1':(_lst)◂(_p56235) %_57319~0':_p56233 }
; _f56285 0' ⊢ °1◂0'
; _cns { %_57321 %_57320 } ⊢ %_57322 : %_57322
 ; {>  %_57320~1':(_lst)◂(_p56235) %_57321~°1◂0':_p56235 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_57322 ⊢ %_57323 : %_57323
 ; {>  %_57322~°0◂{ °1◂0' 1' }:(_lst)◂(_p56235) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_57323
 ; {>  %_57323~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p56235)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_57431
	btr r12,2
	jmp LB_57432
LB_57431:
	bts r12,2
LB_57432:
	mov rsi,1
	bt r12,2
	jc LB_57429
	mov rsi,0
	bt r8,0
	jc LB_57429
	jmp LB_57430
LB_57429:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_57430:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57427
	btr QWORD [rdi],0
	jmp LB_57428
LB_57427:
	bts QWORD [rdi],0
LB_57428:
	mov r8,r14
	bt r12,1
	jc LB_57435
	btr r12,2
	jmp LB_57436
LB_57435:
	bts r12,2
LB_57436:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57433
	btr QWORD [rdi],1
	jmp LB_57434
LB_57433:
	bts QWORD [rdi],1
LB_57434:
	mov rsi,1
	bt r12,3
	jc LB_57425
	mov rsi,0
	bt r9,0
	jc LB_57425
	jmp LB_57426
LB_57425:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57426:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57437:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57439
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57438
LB_57439:
	add rsp,8
	ret
LB_57441:
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
LB_57440:
	add rsp,48
	pop r14
LB_57438:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57478
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57324 : %_57324
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57324 ⊢ %_57325 : %_57325
 ; {>  %_57324~°1◂{  }:(_lst)◂(t20078'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57325
 ; {>  %_57325~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20081'(0))) }
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
	jc LB_57476
	mov rsi,0
	bt r9,0
	jc LB_57476
	jmp LB_57477
LB_57476:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57477:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57478:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57480
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57479
LB_57480:
	add rsp,8
	ret
LB_57481:
	add rsp,0
	pop r14
LB_57479:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57306:
NS_E_RDI_57306:
NS_E_57306_ETR_TBL:
NS_E_57306_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "%["
	jmp LB_57497
LB_57496:
	add r14,1
LB_57497:
	cmp r14,r10
	jge LB_57498
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57496
	cmp al,10
	jz LB_57496
	cmp al,32
	jz LB_57496
LB_57498:
	add r14,2
	cmp r14,r10
	jg LB_57501
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_57501
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_57501
	jmp LB_57502
LB_57501:
	jmp LB_57489
LB_57502:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_57504
LB_57503:
	add r14,1
LB_57504:
	cmp r14,r10
	jge LB_57505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57503
	cmp al,10
	jz LB_57503
	cmp al,32
	jz LB_57503
LB_57505:
	push r10
	call NS_E_57174_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57506
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57507
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57507:
	jmp LB_57489
LB_57506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_57510
LB_57509:
	add r14,1
LB_57510:
	cmp r14,r10
	jge LB_57511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57509
	cmp al,10
	jz LB_57509
	cmp al,32
	jz LB_57509
LB_57511:
	add r14,1
	cmp r14,r10
	jg LB_57516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_57516
	jmp LB_57517
LB_57516:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57513
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57513:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57514
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57514:
	jmp LB_57489
LB_57517:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57494
	btr r12,2
	jmp LB_57495
LB_57494:
	bts r12,2
LB_57495:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57492
	btr r12,1
	jmp LB_57493
LB_57492:
	bts r12,1
LB_57493:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57490
	btr r12,0
	jmp LB_57491
LB_57490:
	bts r12,0
LB_57491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57486
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_57518
	btr r12,3
	jmp LB_57519
LB_57518:
	bts r12,3
LB_57519:
	mov r13,r14
	bt r12,1
	jc LB_57520
	btr r12,0
	jmp LB_57521
LB_57520:
	bts r12,0
LB_57521:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56280 %_57326 ⊢ %_57327 : %_57327
 ; {>  %_57326~0':_p56238 }
; _f56280 0' ⊢ °0◂0'
; _some %_57327 ⊢ %_57328 : %_57328
 ; {>  %_57327~°0◂0':_p56233 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57328
 ; {>  %_57328~°0◂°0◂0':(_opn)◂(_p56233) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57484
	btr r12,3
	jmp LB_57485
LB_57484:
	bts r12,3
LB_57485:
	mov rsi,1
	bt r12,3
	jc LB_57482
	mov rsi,0
	bt r9,0
	jc LB_57482
	jmp LB_57483
LB_57482:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57483:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57486:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57488
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57487
LB_57488:
	add rsp,8
	ret
LB_57489:
	add rsp,48
	pop r14
LB_57487:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_57539
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_57539
	jmp LB_57540
LB_57539:
	jmp LB_57529
LB_57540:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_56156_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57544
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57545
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57545:
	jmp LB_57529
LB_57544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57532
	btr r12,1
	jmp LB_57533
LB_57532:
	bts r12,1
LB_57533:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57530
	btr r12,0
	jmp LB_57531
LB_57530:
	bts r12,0
LB_57531:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57526
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_57547
	btr r12,2
	jmp LB_57548
LB_57547:
	bts r12,2
LB_57548:
	mov r13,r14
	bt r12,1
	jc LB_57549
	btr r12,0
	jmp LB_57550
LB_57549:
	bts r12,0
LB_57550:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56281 %_57329 ⊢ %_57330 : %_57330
 ; {>  %_57329~0':_stg }
; _f56281 0' ⊢ °1◂0'
; _some %_57330 ⊢ %_57331 : %_57331
 ; {>  %_57330~°1◂0':_p56233 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57331
 ; {>  %_57331~°0◂°1◂0':(_opn)◂(_p56233) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57524
	btr r12,3
	jmp LB_57525
LB_57524:
	bts r12,3
LB_57525:
	mov rsi,1
	bt r12,3
	jc LB_57522
	mov rsi,0
	bt r9,0
	jc LB_57522
	jmp LB_57523
LB_57522:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57523:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57526:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57528
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57527
LB_57528:
	add rsp,8
	ret
LB_57529:
	add rsp,32
	pop r14
LB_57527:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_56156_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57564
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57558
LB_57564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57559
	btr r12,0
	jmp LB_57560
LB_57559:
	bts r12,0
LB_57560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57555
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56281 %_57332 ⊢ %_57333 : %_57333
 ; {>  %_57332~0':_stg }
; _f56281 0' ⊢ °1◂0'
; _some %_57333 ⊢ %_57334 : %_57334
 ; {>  %_57333~°1◂0':_p56233 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57334
 ; {>  %_57334~°0◂°1◂0':(_opn)◂(_p56233) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57553
	btr r12,3
	jmp LB_57554
LB_57553:
	bts r12,3
LB_57554:
	mov rsi,1
	bt r12,3
	jc LB_57551
	mov rsi,0
	bt r9,0
	jc LB_57551
	jmp LB_57552
LB_57551:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57552:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57555:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57557
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57556
LB_57557:
	add rsp,8
	ret
LB_57558:
	add rsp,16
	pop r14
LB_57556:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57566:
NS_E_RDI_57566:
NS_E_57566_ETR_TBL:
NS_E_57566_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_57616
LB_57615:
	add r14,1
LB_57616:
	cmp r14,r10
	jge LB_57617
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57615
	cmp al,10
	jz LB_57615
	cmp al,32
	jz LB_57615
LB_57617:
	add r14,1
	cmp r14,r10
	jg LB_57620
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_57620
	jmp LB_57621
LB_57620:
	jmp LB_57608
LB_57621:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_57623
LB_57622:
	add r14,1
LB_57623:
	cmp r14,r10
	jge LB_57624
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57622
	cmp al,10
	jz LB_57622
	cmp al,32
	jz LB_57622
LB_57624:
	push r10
	call NS_E_57567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57625
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57626
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57626:
	jmp LB_57608
LB_57625:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_57629
LB_57628:
	add r14,1
LB_57629:
	cmp r14,r10
	jge LB_57630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57628
	cmp al,10
	jz LB_57628
	cmp al,32
	jz LB_57628
LB_57630:
	add r14,1
	cmp r14,r10
	jg LB_57635
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_57635
	jmp LB_57636
LB_57635:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57632
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57632:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57633
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57633:
	jmp LB_57608
LB_57636:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57613
	btr r12,2
	jmp LB_57614
LB_57613:
	bts r12,2
LB_57614:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57611
	btr r12,1
	jmp LB_57612
LB_57611:
	bts r12,1
LB_57612:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57609
	btr r12,0
	jmp LB_57610
LB_57609:
	bts r12,0
LB_57610:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57605
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_57637
	btr r12,3
	jmp LB_57638
LB_57637:
	bts r12,3
LB_57638:
	mov r13,r14
	bt r12,1
	jc LB_57639
	btr r12,0
	jmp LB_57640
LB_57639:
	bts r12,0
LB_57640:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56286 %_57572 ⊢ %_57573 : %_57573
 ; {>  %_57572~0':(_lst)◂(_p56236) }
; _f56286 0' ⊢ °0◂0'
; _some %_57573 ⊢ %_57574 : %_57574
 ; {>  %_57573~°0◂0':_p56236 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57574
 ; {>  %_57574~°0◂°0◂0':(_opn)◂(_p56236) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57603
	btr r12,3
	jmp LB_57604
LB_57603:
	bts r12,3
LB_57604:
	mov rsi,1
	bt r12,3
	jc LB_57601
	mov rsi,0
	bt r9,0
	jc LB_57601
	jmp LB_57602
LB_57601:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57602:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57605:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57607
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57606
LB_57607:
	add rsp,8
	ret
LB_57608:
	add rsp,48
	pop r14
LB_57606:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dst
	jmp LB_57652
LB_57651:
	add r14,1
LB_57652:
	cmp r14,r10
	jge LB_57653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57651
	cmp al,10
	jz LB_57651
	cmp al,32
	jz LB_57651
LB_57653:
	push r10
	call NS_E_57571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57654
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57648
LB_57654:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57649
	btr r12,0
	jmp LB_57650
LB_57649:
	bts r12,0
LB_57650:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57645
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56287 %_57575 ⊢ %_57576 : %_57576
 ; {>  %_57575~0':_p56234 }
; _f56287 0' ⊢ °1◂0'
; _some %_57576 ⊢ %_57577 : %_57577
 ; {>  %_57576~°1◂0':_p56236 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57577
 ; {>  %_57577~°0◂°1◂0':(_opn)◂(_p56236) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57643
	btr r12,3
	jmp LB_57644
LB_57643:
	bts r12,3
LB_57644:
	mov rsi,1
	bt r12,3
	jc LB_57641
	mov rsi,0
	bt r9,0
	jc LB_57641
	jmp LB_57642
LB_57641:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57642:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57645:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57647
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57646
LB_57647:
	add rsp,8
	ret
LB_57648:
	add rsp,16
	pop r14
LB_57646:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57567:
NS_E_RDI_57567:
NS_E_57567_ETR_TBL:
NS_E_57567_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_57675
LB_57674:
	add r14,1
LB_57675:
	cmp r14,r10
	jge LB_57676
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57674
	cmp al,10
	jz LB_57674
	cmp al,32
	jz LB_57674
LB_57676:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57677
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57669
LB_57677:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_57680
LB_57679:
	add r14,1
LB_57680:
	cmp r14,r10
	jge LB_57681
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57679
	cmp al,10
	jz LB_57679
	cmp al,32
	jz LB_57679
LB_57681:
	push r10
	call NS_E_57567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57682
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57683
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57683:
	jmp LB_57669
LB_57682:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57672
	btr r12,1
	jmp LB_57673
LB_57672:
	bts r12,1
LB_57673:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57670
	btr r12,0
	jmp LB_57671
LB_57670:
	bts r12,0
LB_57671:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57666
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_57578 %_57579 } ⊢ %_57580 : %_57580
 ; {>  %_57579~1':(_lst)◂(_p56236) %_57578~0':_p56236 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57580 ⊢ %_57581 : %_57581
 ; {>  %_57580~°0◂{ 0' 1' }:(_lst)◂(_p56236) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57581
 ; {>  %_57581~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p56236)) }
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
	jc LB_57660
	btr r12,2
	jmp LB_57661
LB_57660:
	bts r12,2
LB_57661:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57658
	btr QWORD [rdi],0
	jmp LB_57659
LB_57658:
	bts QWORD [rdi],0
LB_57659:
	mov r8,r14
	bt r12,1
	jc LB_57664
	btr r12,2
	jmp LB_57665
LB_57664:
	bts r12,2
LB_57665:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57662
	btr QWORD [rdi],1
	jmp LB_57663
LB_57662:
	bts QWORD [rdi],1
LB_57663:
	mov rsi,1
	bt r12,3
	jc LB_57656
	mov rsi,0
	bt r9,0
	jc LB_57656
	jmp LB_57657
LB_57656:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57657:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57666:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57668
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57667
LB_57668:
	add rsp,8
	ret
LB_57669:
	add rsp,32
	pop r14
LB_57667:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57687
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57582 : %_57582
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57582 ⊢ %_57583 : %_57583
 ; {>  %_57582~°1◂{  }:(_lst)◂(t20166'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57583
 ; {>  %_57583~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20169'(0))) }
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
	jc LB_57685
	mov rsi,0
	bt r9,0
	jc LB_57685
	jmp LB_57686
LB_57685:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57686:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57687:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57689
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57688
LB_57689:
	add rsp,8
	ret
LB_57690:
	add rsp,0
	pop r14
LB_57688:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57569:
NS_E_RDI_57569:
NS_E_57569_ETR_TBL:
NS_E_57569_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_57713
LB_57712:
	add r14,1
LB_57713:
	cmp r14,r10
	jge LB_57714
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57712
	cmp al,10
	jz LB_57712
	cmp al,32
	jz LB_57712
LB_57714:
	add r14,1
	cmp r14,r10
	jg LB_57717
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_57717
	jmp LB_57718
LB_57717:
	jmp LB_57691
LB_57718:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_57700
LB_57699:
	add r14,1
LB_57700:
	cmp r14,r10
	jge LB_57701
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57699
	cmp al,10
	jz LB_57699
	cmp al,32
	jz LB_57699
LB_57701:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57702
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57703
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57703:
	jmp LB_57692
LB_57702:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_57706
LB_57705:
	add r14,1
LB_57706:
	cmp r14,r10
	jge LB_57707
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57705
	cmp al,10
	jz LB_57705
	cmp al,32
	jz LB_57705
LB_57707:
	push r10
	call NS_E_57569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57708
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57709
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57709:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57710
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57710:
	jmp LB_57692
LB_57708:
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
	jc LB_57695
	btr QWORD [rdi],2
LB_57695:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57696
	btr QWORD [rdi],1
LB_57696:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57697
	btr QWORD [rdi],0
LB_57697:
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
LB_57692:
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
LB_57691:
	add rsp,48
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
LB_57693:
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
NS_E_57570:
NS_E_RDI_57570:
NS_E_57570_ETR_TBL:
NS_E_57570_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_57756
LB_57755:
	add r14,1
LB_57756:
	cmp r14,r10
	jge LB_57757
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57755
	cmp al,10
	jz LB_57755
	cmp al,32
	jz LB_57755
LB_57757:
	add r14,1
	cmp r14,r10
	jg LB_57760
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_57760
	jmp LB_57761
LB_57760:
	jmp LB_57734
LB_57761:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_57743
LB_57742:
	add r14,1
LB_57743:
	cmp r14,r10
	jge LB_57744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57742
	cmp al,10
	jz LB_57742
	cmp al,32
	jz LB_57742
LB_57744:
	push r10
	call NS_E_57571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57745
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57746
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57746:
	jmp LB_57735
LB_57745:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_57749
LB_57748:
	add r14,1
LB_57749:
	cmp r14,r10
	jge LB_57750
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57748
	cmp al,10
	jz LB_57748
	cmp al,32
	jz LB_57748
LB_57750:
	push r10
	call NS_E_57570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57751
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57752
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57752:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57753
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57753:
	jmp LB_57735
LB_57751:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57740
	btr r12,2
	jmp LB_57741
LB_57740:
	bts r12,2
LB_57741:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57738
	btr r12,1
	jmp LB_57739
LB_57738:
	bts r12,1
LB_57739:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57736
	btr r12,0
	jmp LB_57737
LB_57736:
	bts r12,0
LB_57737:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57731
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_57762
	btr r12,3
	jmp LB_57763
LB_57762:
	bts r12,3
LB_57763:
	mov r14,r8
	bt r12,2
	jc LB_57764
	btr r12,1
	jmp LB_57765
LB_57764:
	bts r12,1
LB_57765:
	mov r8,r13
	bt r12,0
	jc LB_57766
	btr r12,2
	jmp LB_57767
LB_57766:
	bts r12,2
LB_57767:
	mov r13,r9
	bt r12,3
	jc LB_57768
	btr r12,0
	jmp LB_57769
LB_57768:
	bts r12,0
LB_57769:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56287 %_57586 ⊢ %_57588 : %_57588
 ; {>  %_57586~0':_p56234 %_57587~1':(_lst)◂(_p56236) }
; _f56287 0' ⊢ °1◂0'
; _cns { %_57588 %_57587 } ⊢ %_57589 : %_57589
 ; {>  %_57588~°1◂0':_p56236 %_57587~1':(_lst)◂(_p56236) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_57589 ⊢ %_57590 : %_57590
 ; {>  %_57589~°0◂{ °1◂0' 1' }:(_lst)◂(_p56236) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_57590
 ; {>  %_57590~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p56236)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_57725
	btr r12,2
	jmp LB_57726
LB_57725:
	bts r12,2
LB_57726:
	mov rsi,1
	bt r12,2
	jc LB_57723
	mov rsi,0
	bt r8,0
	jc LB_57723
	jmp LB_57724
LB_57723:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_57724:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57721
	btr QWORD [rdi],0
	jmp LB_57722
LB_57721:
	bts QWORD [rdi],0
LB_57722:
	mov r8,r14
	bt r12,1
	jc LB_57729
	btr r12,2
	jmp LB_57730
LB_57729:
	bts r12,2
LB_57730:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57727
	btr QWORD [rdi],1
	jmp LB_57728
LB_57727:
	bts QWORD [rdi],1
LB_57728:
	mov rsi,1
	bt r12,3
	jc LB_57719
	mov rsi,0
	bt r9,0
	jc LB_57719
	jmp LB_57720
LB_57719:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57720:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57731:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57733
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57732
LB_57733:
	add rsp,8
	ret
LB_57735:
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
LB_57734:
	add rsp,48
	pop r14
LB_57732:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57772
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57591 : %_57591
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57591 ⊢ %_57592 : %_57592
 ; {>  %_57591~°1◂{  }:(_lst)◂(t20180'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57592
 ; {>  %_57592~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20183'(0))) }
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
	jc LB_57770
	mov rsi,0
	bt r9,0
	jc LB_57770
	jmp LB_57771
LB_57770:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57771:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57772:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57774
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57773
LB_57774:
	add rsp,8
	ret
LB_57775:
	add rsp,0
	pop r14
LB_57773:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57571:
NS_E_RDI_57571:
NS_E_57571_ETR_TBL:
NS_E_57571_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_57793
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_57793
	jmp LB_57794
LB_57793:
	jmp LB_57783
LB_57794:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57798
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57799:
	jmp LB_57783
LB_57798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57786
	btr r12,1
	jmp LB_57787
LB_57786:
	bts r12,1
LB_57787:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57784
	btr r12,0
	jmp LB_57785
LB_57784:
	bts r12,0
LB_57785:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_57801
	btr r12,2
	jmp LB_57802
LB_57801:
	bts r12,2
LB_57802:
	mov r13,r14
	bt r12,1
	jc LB_57803
	btr r12,0
	jmp LB_57804
LB_57803:
	bts r12,0
LB_57804:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56283 %_57593 ⊢ %_57594 : %_57594
 ; {>  %_57593~0':_stg }
; _f56283 0' ⊢ °1◂0'
; _some %_57594 ⊢ %_57595 : %_57595
 ; {>  %_57594~°1◂0':_p56234 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57595
 ; {>  %_57595~°0◂°1◂0':(_opn)◂(_p56234) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57778
	btr r12,3
	jmp LB_57779
LB_57778:
	bts r12,3
LB_57779:
	mov rsi,1
	bt r12,3
	jc LB_57776
	mov rsi,0
	bt r9,0
	jc LB_57776
	jmp LB_57777
LB_57776:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57777:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57780:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57782
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57781
LB_57782:
	add rsp,8
	ret
LB_57783:
	add rsp,32
	pop r14
LB_57781:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57818
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57812
LB_57818:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57813
	btr r12,0
	jmp LB_57814
LB_57813:
	bts r12,0
LB_57814:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57809
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56283 %_57596 ⊢ %_57597 : %_57597
 ; {>  %_57596~0':_stg }
; _f56283 0' ⊢ °1◂0'
; _some %_57597 ⊢ %_57598 : %_57598
 ; {>  %_57597~°1◂0':_p56234 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57598
 ; {>  %_57598~°0◂°1◂0':(_opn)◂(_p56234) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57807
	btr r12,3
	jmp LB_57808
LB_57807:
	bts r12,3
LB_57808:
	mov rsi,1
	bt r12,3
	jc LB_57805
	mov rsi,0
	bt r9,0
	jc LB_57805
	jmp LB_57806
LB_57805:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57806:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57809:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57811
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57810
LB_57811:
	add rsp,8
	ret
LB_57812:
	add rsp,16
	pop r14
LB_57810:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_57833
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_57833
	jmp LB_57834
LB_57833:
	jmp LB_57825
LB_57834:
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
	jc LB_57826
	btr r12,0
	jmp LB_57827
LB_57826:
	bts r12,0
LB_57827:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57822
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56282 {  } ⊢ %_57599 : %_57599
 ; {>  }
; _f56282 {  } ⊢ °0◂{  }
; _some %_57599 ⊢ %_57600 : %_57600
 ; {>  %_57599~°0◂{  }:_p56234 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_57600
 ; {>  %_57600~°0◂°0◂{  }:(_opn)◂(_p56234) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_57820
	mov rsi,0
	bt r9,0
	jc LB_57820
	jmp LB_57821
LB_57820:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57821:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57822:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57824
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57823
LB_57824:
	add rsp,8
	ret
LB_57825:
	add rsp,16
	pop r14
LB_57823:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57835:
NS_E_RDI_57835:
NS_E_57835_ETR_TBL:
NS_E_57835_TBL:
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
LB_58235:
	jmp LB_58232
LB_58231:
	add r14,1
LB_58232:
	cmp r14,r10
	jge LB_58233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58231
	cmp al,10
	jz LB_58231
	cmp al,32
	jz LB_58231
LB_58233:
	push r10
	push rsi
	call NS_E_57836_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_58234
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_58236
	bts QWORD [rax],0
LB_58236:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_58235
LB_58234:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58229
	btr r12,0
	jmp LB_58230
LB_58229:
	bts r12,0
LB_58230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58225
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_57882 ⊢ %_57883 : %_57883
 ; {>  %_57882~0':(_lst)◂(_p56220) }
; _some 0' ⊢ °0◂0'
; ∎ %_57883
 ; {>  %_57883~°0◂0':(_opn)◂((_lst)◂(_p56220)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58223
	btr r12,3
	jmp LB_58224
LB_58223:
	bts r12,3
LB_58224:
	mov r8,0
	bts r12,2
	ret
LB_58225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58227
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58226
LB_58227:
	add rsp,8
	ret
LB_58228:
	add rsp,16
	pop r14
LB_58226:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57836:
NS_E_RDI_57836:
NS_E_57836_ETR_TBL:
NS_E_57836_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_58267
LB_58266:
	add r14,1
LB_58267:
	cmp r14,r10
	jge LB_58268
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58266
	cmp al,10
	jz LB_58266
	cmp al,32
	jz LB_58266
LB_58268:
	add r14,7
	cmp r14,r10
	jg LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_58271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_58271
	jmp LB_58272
LB_58271:
	jmp LB_58246
LB_58272:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_58255
LB_58254:
	add r14,1
LB_58255:
	cmp r14,r10
	jge LB_58256
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58254
	cmp al,10
	jz LB_58254
	cmp al,32
	jz LB_58254
LB_58256:
	push r10
	call NS_E_57868_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58257
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58258
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58258:
	jmp LB_58247
LB_58257:
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
LB_58264:
	jmp LB_58261
LB_58260:
	add r14,1
LB_58261:
	cmp r14,r10
	jge LB_58262
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58260
	cmp al,10
	jz LB_58260
	cmp al,32
	jz LB_58260
LB_58262:
	push r10
	push rsi
	call NS_E_57868_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_58263
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_58265
	bts QWORD [rax],0
LB_58265:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_58264
LB_58263:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58252
	btr r12,2
	jmp LB_58253
LB_58252:
	bts r12,2
LB_58253:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58250
	btr r12,1
	jmp LB_58251
LB_58250:
	bts r12,1
LB_58251:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58248
	btr r12,0
	jmp LB_58249
LB_58248:
	bts r12,0
LB_58249:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_58243
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_58273
	btr r12,3
	jmp LB_58274
LB_58273:
	bts r12,3
LB_58274:
	mov r14,r8
	bt r12,2
	jc LB_58275
	btr r12,1
	jmp LB_58276
LB_58275:
	bts r12,1
LB_58276:
	mov r8,r13
	bt r12,0
	jc LB_58277
	btr r12,2
	jmp LB_58278
LB_58277:
	bts r12,2
LB_58278:
	mov r13,r9
	bt r12,3
	jc LB_58279
	btr r12,0
	jmp LB_58280
LB_58279:
	bts r12,0
LB_58280:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57886 : %_57886
 ; {>  %_57884~0':_p57867 %_57885~1':(_lst)◂(_p57867) }
; _nil {  } ⊢ °1◂{  }
; _f56248 %_57886 ⊢ %_57887 : %_57887
 ; {>  %_57884~0':_p57867 %_57886~°1◂{  }:(_lst)◂(t20294'(0)) %_57885~1':(_lst)◂(_p57867) }
; _f56248 °1◂{  } ⊢ °1◂°1◂{  }
; _some %_57887 ⊢ %_57888 : %_57888
 ; {>  %_57884~0':_p57867 %_57887~°1◂°1◂{  }:_p56220 %_57885~1':(_lst)◂(_p57867) }
; _some °1◂°1◂{  } ⊢ °0◂°1◂°1◂{  }
; ∎ %_57888
 ; {>  %_57884~0':_p57867 %_57888~°0◂°1◂°1◂{  }:(_opn)◂(_p56220) %_57885~1':(_lst)◂(_p57867) }
; 	∎ °0◂°1◂°1◂{  }
	bt r12,0
	jc LB_58237
	mov rdi,r13
	call dlt
LB_58237:
	bt r12,1
	jc LB_58238
	mov rdi,r14
	call dlt
LB_58238:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_58241
	mov rsi,0
	bt r9,0
	jc LB_58241
	jmp LB_58242
LB_58241:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58242:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_58239
	mov rsi,0
	bt r9,0
	jc LB_58239
	jmp LB_58240
LB_58239:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58240:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58243:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58245
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58244
LB_58245:
	add rsp,8
	ret
LB_58247:
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
LB_58246:
	add rsp,48
	pop r14
LB_58244:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_58319
LB_58318:
	add r14,1
LB_58319:
	cmp r14,r10
	jge LB_58320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58318
	cmp al,10
	jz LB_58318
	cmp al,32
	jz LB_58318
LB_58320:
	add r14,4
	cmp r14,r10
	jg LB_58323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_58323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_58323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_58323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_58323
	jmp LB_58324
LB_58323:
	jmp LB_58297
LB_58324:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_58306
LB_58305:
	add r14,1
LB_58306:
	cmp r14,r10
	jge LB_58307
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58305
	cmp al,10
	jz LB_58305
	cmp al,32
	jz LB_58305
LB_58307:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58308
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58309
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58309:
	jmp LB_58298
LB_58308:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_58312
LB_58311:
	add r14,1
LB_58312:
	cmp r14,r10
	jge LB_58313
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58311
	cmp al,10
	jz LB_58311
	cmp al,32
	jz LB_58311
LB_58313:
	push r10
	call NS_E_57837_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58314
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58315
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58315:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58316
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58316:
	jmp LB_58298
LB_58314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58303
	btr r12,2
	jmp LB_58304
LB_58303:
	bts r12,2
LB_58304:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58301
	btr r12,1
	jmp LB_58302
LB_58301:
	bts r12,1
LB_58302:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58299
	btr r12,0
	jmp LB_58300
LB_58299:
	bts r12,0
LB_58300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_58294
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_58325
	btr r12,3
	jmp LB_58326
LB_58325:
	bts r12,3
LB_58326:
	mov r14,r8
	bt r12,2
	jc LB_58327
	btr r12,1
	jmp LB_58328
LB_58327:
	bts r12,1
LB_58328:
	mov r8,r13
	bt r12,0
	jc LB_58329
	btr r12,2
	jmp LB_58330
LB_58329:
	bts r12,2
LB_58330:
	mov r13,r9
	bt r12,3
	jc LB_58331
	btr r12,0
	jmp LB_58332
LB_58331:
	bts r12,0
LB_58332:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57891 : %_57891
 ; {>  %_57890~1':_p56221 %_57889~0':_stg }
; _nil {  } ⊢ °1◂{  }
; _f56253 %_57891 ⊢ %_57892 : %_57892
 ; {>  %_57890~1':_p56221 %_57889~0':_stg %_57891~°1◂{  }:(_lst)◂(t20302'(0)) }
; _f56253 °1◂{  } ⊢ °0◂°1◂{  }
; _f56247 { %_57889 %_57892 } ⊢ %_57893 : %_57893
 ; {>  %_57890~1':_p56221 %_57889~0':_stg %_57892~°0◂°1◂{  }:_p56221 }
; _f56247 { 0' °0◂°1◂{  } } ⊢ °0◂{ 0' °0◂°1◂{  } }
; _some %_57893 ⊢ %_57894 : %_57894
 ; {>  %_57890~1':_p56221 %_57893~°0◂{ 0' °0◂°1◂{  } }:_p56220 }
; _some °0◂{ 0' °0◂°1◂{  } } ⊢ °0◂°0◂{ 0' °0◂°1◂{  } }
; ∎ %_57894
 ; {>  %_57890~1':_p56221 %_57894~°0◂°0◂{ 0' °0◂°1◂{  } }:(_opn)◂(_p56220) }
; 	∎ °0◂°0◂{ 0' °0◂°1◂{  } }
	bt r12,1
	jc LB_58281
	mov rdi,r14
	call dlt
LB_58281:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °0◂°1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_58286
	btr r12,1
	jmp LB_58287
LB_58286:
	bts r12,1
LB_58287:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_58284
	btr QWORD [rdi],0
	jmp LB_58285
LB_58284:
	bts QWORD [rdi],0
LB_58285:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_58292
	mov rsi,0
	bt r14,0
	jc LB_58292
	jmp LB_58293
LB_58292:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_58293:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rsi,1
	bt r12,1
	jc LB_58290
	mov rsi,0
	bt r14,0
	jc LB_58290
	jmp LB_58291
LB_58290:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_58291:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_58288
	btr QWORD [rdi],1
	jmp LB_58289
LB_58288:
	bts QWORD [rdi],1
LB_58289:
	mov rsi,1
	bt r12,3
	jc LB_58282
	mov rsi,0
	bt r9,0
	jc LB_58282
	jmp LB_58283
LB_58282:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58283:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58294:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58296
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58295
LB_58296:
	add rsp,8
	ret
LB_58298:
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
LB_58297:
	add rsp,48
	pop r14
LB_58295:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_58351
LB_58350:
	add r14,1
LB_58351:
	cmp r14,r10
	jge LB_58352
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58350
	cmp al,10
	jz LB_58350
	cmp al,32
	jz LB_58350
LB_58352:
	add r14,2
	cmp r14,r10
	jg LB_58355
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_58355
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_58355
	jmp LB_58356
LB_58355:
	jmp LB_58338
LB_58356:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_58345
LB_58344:
	add r14,1
LB_58345:
	cmp r14,r10
	jge LB_58346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58344
	cmp al,10
	jz LB_58344
	cmp al,32
	jz LB_58344
LB_58346:
	push r10
	call NS_E_57845_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58347
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58348:
	jmp LB_58339
LB_58347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58342
	btr r12,1
	jmp LB_58343
LB_58342:
	bts r12,1
LB_58343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58340
	btr r12,0
	jmp LB_58341
LB_58340:
	bts r12,0
LB_58341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58335
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58357
	btr r12,2
	jmp LB_58358
LB_58357:
	bts r12,2
LB_58358:
	mov r13,r14
	bt r12,1
	jc LB_58359
	btr r12,0
	jmp LB_58360
LB_58359:
	bts r12,0
LB_58360:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57895 ⊢ %_57896 : %_57896
 ; {>  %_57895~0':_p56220 }
; _some 0' ⊢ °0◂0'
; ∎ %_57896
 ; {>  %_57896~°0◂0':(_opn)◂(_p56220) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58333
	btr r12,3
	jmp LB_58334
LB_58333:
	bts r12,3
LB_58334:
	mov r8,0
	bts r12,2
	ret
LB_58335:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58337
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58336
LB_58337:
	add rsp,8
	ret
LB_58339:
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
LB_58338:
	add rsp,32
	pop r14
LB_58336:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_58372
LB_58371:
	add r14,1
LB_58372:
	cmp r14,r10
	jge LB_58373
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58371
	cmp al,10
	jz LB_58371
	cmp al,32
	jz LB_58371
LB_58373:
	add r14,2
	cmp r14,r10
	jg LB_58376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_58376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_58376
	jmp LB_58377
LB_58376:
	jmp LB_58366
LB_58377:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_58379
LB_58378:
	add r14,1
LB_58379:
	cmp r14,r10
	jge LB_58380
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58378
	cmp al,10
	jz LB_58378
	cmp al,32
	jz LB_58378
LB_58380:
	push r10
	call NS_E_57839_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58381
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58382
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58382:
	jmp LB_58366
LB_58381:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58369
	btr r12,1
	jmp LB_58370
LB_58369:
	bts r12,1
LB_58370:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58367
	btr r12,0
	jmp LB_58368
LB_58367:
	bts r12,0
LB_58368:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58363
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58384
	btr r12,2
	jmp LB_58385
LB_58384:
	bts r12,2
LB_58385:
	mov r13,r14
	bt r12,1
	jc LB_58386
	btr r12,0
	jmp LB_58387
LB_58386:
	bts r12,0
LB_58387:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57897 ⊢ %_57898 : %_57898
 ; {>  %_57897~0':_p56220 }
; _some 0' ⊢ °0◂0'
; ∎ %_57898
 ; {>  %_57898~°0◂0':(_opn)◂(_p56220) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58361
	btr r12,3
	jmp LB_58362
LB_58361:
	bts r12,3
LB_58362:
	mov r8,0
	bts r12,2
	ret
LB_58363:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58365
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58364
LB_58365:
	add rsp,8
	ret
LB_58366:
	add rsp,32
	pop r14
LB_58364:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57837:
NS_E_RDI_57837:
NS_E_57837_ETR_TBL:
NS_E_57837_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_58408
LB_58407:
	add r14,1
LB_58408:
	cmp r14,r10
	jge LB_58409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58407
	cmp al,10
	jz LB_58407
	cmp al,32
	jz LB_58407
LB_58409:
	add r14,1
	cmp r14,r10
	jg LB_58412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_58412
	jmp LB_58413
LB_58412:
	jmp LB_58395
LB_58413:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_58402
LB_58401:
	add r14,1
LB_58402:
	cmp r14,r10
	jge LB_58403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58401
	cmp al,10
	jz LB_58401
	cmp al,32
	jz LB_58401
LB_58403:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58404
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58405:
	jmp LB_58396
LB_58404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58399
	btr r12,1
	jmp LB_58400
LB_58399:
	bts r12,1
LB_58400:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58397
	btr r12,0
	jmp LB_58398
LB_58397:
	bts r12,0
LB_58398:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58392
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58414
	btr r12,2
	jmp LB_58415
LB_58414:
	bts r12,2
LB_58415:
	mov r13,r14
	bt r12,1
	jc LB_58416
	btr r12,0
	jmp LB_58417
LB_58416:
	bts r12,0
LB_58417:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56254 %_57899 ⊢ %_57900 : %_57900
 ; {>  %_57899~0':_p56214 }
; _f56254 0' ⊢ °1◂0'
; _some %_57900 ⊢ %_57901 : %_57901
 ; {>  %_57900~°1◂0':_p56221 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57901
 ; {>  %_57901~°0◂°1◂0':(_opn)◂(_p56221) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58390
	btr r12,3
	jmp LB_58391
LB_58390:
	bts r12,3
LB_58391:
	mov rsi,1
	bt r12,3
	jc LB_58388
	mov rsi,0
	bt r9,0
	jc LB_58388
	jmp LB_58389
LB_58388:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58389:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58392:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58394
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58393
LB_58394:
	add rsp,8
	ret
LB_58396:
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
LB_58395:
	add rsp,32
	pop r14
LB_58393:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_58429
LB_58428:
	add r14,1
LB_58429:
	cmp r14,r10
	jge LB_58430
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58428
	cmp al,10
	jz LB_58428
	cmp al,32
	jz LB_58428
LB_58430:
	push r10
	call NS_E_57838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58431
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58425
LB_58431:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58426
	btr r12,0
	jmp LB_58427
LB_58426:
	bts r12,0
LB_58427:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58422
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56253 %_57902 ⊢ %_57903 : %_57903
 ; {>  %_57902~0':(_lst)◂(_p56220) }
; _f56253 0' ⊢ °0◂0'
; _some %_57903 ⊢ %_57904 : %_57904
 ; {>  %_57903~°0◂0':_p56221 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57904
 ; {>  %_57904~°0◂°0◂0':(_opn)◂(_p56221) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58420
	btr r12,3
	jmp LB_58421
LB_58420:
	bts r12,3
LB_58421:
	mov rsi,1
	bt r12,3
	jc LB_58418
	mov rsi,0
	bt r9,0
	jc LB_58418
	jmp LB_58419
LB_58418:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58419:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58422:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58424
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58423
LB_58424:
	add rsp,8
	ret
LB_58425:
	add rsp,16
	pop r14
LB_58423:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57838:
NS_E_RDI_57838:
NS_E_57838_ETR_TBL:
NS_E_57838_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_58442
LB_58441:
	add r14,1
LB_58442:
	cmp r14,r10
	jge LB_58443
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58441
	cmp al,10
	jz LB_58441
	cmp al,32
	jz LB_58441
LB_58443:
	add r14,6
	cmp r14,r10
	jg LB_58446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_58446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_58446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_58446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_58446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_58446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_58446
	jmp LB_58447
LB_58446:
	jmp LB_58438
LB_58447:
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
	jc LB_58439
	btr r12,0
	jmp LB_58440
LB_58439:
	bts r12,0
LB_58440:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58435
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57905 : %_57905
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57905 ⊢ %_57906 : %_57906
 ; {>  %_57905~°1◂{  }:(_lst)◂(t20323'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57906
 ; {>  %_57906~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20326'(0))) }
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
	jc LB_58433
	mov rsi,0
	bt r9,0
	jc LB_58433
	jmp LB_58434
LB_58433:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58434:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58435:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58437
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58436
LB_58437:
	add rsp,8
	ret
LB_58438:
	add rsp,16
	pop r14
LB_58436:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_58467
LB_58466:
	add r14,1
LB_58467:
	cmp r14,r10
	jge LB_58468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58466
	cmp al,10
	jz LB_58466
	cmp al,32
	jz LB_58466
LB_58468:
	push r10
	call NS_E_57836_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58469
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58461
LB_58469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_58472
LB_58471:
	add r14,1
LB_58472:
	cmp r14,r10
	jge LB_58473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58471
	cmp al,10
	jz LB_58471
	cmp al,32
	jz LB_58471
LB_58473:
	push r10
	call NS_E_57838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58475
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58475:
	jmp LB_58461
LB_58474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58464
	btr r12,1
	jmp LB_58465
LB_58464:
	bts r12,1
LB_58465:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58462
	btr r12,0
	jmp LB_58463
LB_58462:
	bts r12,0
LB_58463:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58458
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_57907 %_57908 } ⊢ %_57909 : %_57909
 ; {>  %_57908~1':(_lst)◂(_p56220) %_57907~0':_p56220 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57909 ⊢ %_57910 : %_57910
 ; {>  %_57909~°0◂{ 0' 1' }:(_lst)◂(_p56220) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57910
 ; {>  %_57910~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p56220)) }
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
	jc LB_58452
	btr r12,2
	jmp LB_58453
LB_58452:
	bts r12,2
LB_58453:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58450
	btr QWORD [rdi],0
	jmp LB_58451
LB_58450:
	bts QWORD [rdi],0
LB_58451:
	mov r8,r14
	bt r12,1
	jc LB_58456
	btr r12,2
	jmp LB_58457
LB_58456:
	bts r12,2
LB_58457:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58454
	btr QWORD [rdi],1
	jmp LB_58455
LB_58454:
	bts QWORD [rdi],1
LB_58455:
	mov rsi,1
	bt r12,3
	jc LB_58448
	mov rsi,0
	bt r9,0
	jc LB_58448
	jmp LB_58449
LB_58448:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58449:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58458:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58460
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58459
LB_58460:
	add rsp,8
	ret
LB_58461:
	add rsp,32
	pop r14
LB_58459:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57839:
NS_E_RDI_57839:
NS_E_57839_ETR_TBL:
NS_E_57839_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_58532
LB_58531:
	add r14,1
LB_58532:
	cmp r14,r10
	jge LB_58533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58531
	cmp al,10
	jz LB_58531
	cmp al,32
	jz LB_58531
LB_58533:
	add r14,1
	cmp r14,r10
	jg LB_58536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_58536
	jmp LB_58537
LB_58536:
	jmp LB_58498
LB_58537:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58509
LB_58508:
	add r14,1
LB_58509:
	cmp r14,r10
	jge LB_58510
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58508
	cmp al,10
	jz LB_58508
	cmp al,32
	jz LB_58508
LB_58510:
	add r14,1
	cmp r14,r10
	jg LB_58514
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58514
	jmp LB_58515
LB_58514:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58512
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58512:
	jmp LB_58499
LB_58515:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_58517
LB_58516:
	add r14,1
LB_58517:
	cmp r14,r10
	jge LB_58518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58516
	cmp al,10
	jz LB_58516
	cmp al,32
	jz LB_58516
LB_58518:
	push r10
	call NS_E_57840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58519
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58520
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58520:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58521
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58521:
	jmp LB_58499
LB_58519:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_58524
LB_58523:
	add r14,1
LB_58524:
	cmp r14,r10
	jge LB_58525
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58523
	cmp al,10
	jz LB_58523
	cmp al,32
	jz LB_58523
LB_58525:
	push r10
	call NS_E_57843_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58526
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58527
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58527:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58528
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58528:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58529
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58529:
	jmp LB_58499
LB_58526:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58506
	btr r12,3
	jmp LB_58507
LB_58506:
	bts r12,3
LB_58507:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58504
	btr r12,2
	jmp LB_58505
LB_58504:
	bts r12,2
LB_58505:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58502
	btr r12,1
	jmp LB_58503
LB_58502:
	bts r12,1
LB_58503:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58500
	btr r12,0
	jmp LB_58501
LB_58500:
	bts r12,0
LB_58501:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_58495
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_58538
	btr r12,4
	jmp LB_58539
LB_58538:
	bts r12,4
LB_58539:
	mov r8,r9
	bt r12,3
	jc LB_58540
	btr r12,2
	jmp LB_58541
LB_58540:
	bts r12,2
LB_58541:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_58544
	btr r12,3
	jmp LB_58545
LB_58544:
	bts r12,3
LB_58545:
	mov r13,r9
	bt r12,3
	jc LB_58542
	btr r12,0
	jmp LB_58543
LB_58542:
	bts r12,0
LB_58543:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_58548
	btr r12,3
	jmp LB_58549
LB_58548:
	bts r12,3
LB_58549:
	mov r14,r9
	bt r12,3
	jc LB_58546
	btr r12,1
	jmp LB_58547
LB_58546:
	bts r12,1
LB_58547:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_57911 %_57912 } ⊢ %_57913 : %_57913
 ; {>  %_57911~{ 0' 1' }:{ _stg _p56223 } %_57912~2':(_lst)◂({ _stg _p56223 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f56252 %_57913 ⊢ %_57914 : %_57914
 ; {>  %_57913~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p56223 }) }
; _f56252 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_57914 ⊢ %_57915 : %_57915
 ; {>  %_57914~°5◂°0◂{ { 0' 1' } 2' }:_p56220 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_57915
 ; {>  %_57915~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p56220) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58485
	btr r12,5
	jmp LB_58486
LB_58485:
	bts r12,5
LB_58486:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58483
	btr QWORD [rdi],0
	jmp LB_58484
LB_58483:
	bts QWORD [rdi],0
LB_58484:
	mov r11,r14
	bt r12,1
	jc LB_58489
	btr r12,5
	jmp LB_58490
LB_58489:
	bts r12,5
LB_58490:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58487
	btr QWORD [rdi],1
	jmp LB_58488
LB_58487:
	bts QWORD [rdi],1
LB_58488:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58481
	btr QWORD [rdi],0
	jmp LB_58482
LB_58481:
	bts QWORD [rdi],0
LB_58482:
	mov r10,r8
	bt r12,2
	jc LB_58493
	btr r12,4
	jmp LB_58494
LB_58493:
	bts r12,4
LB_58494:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58491
	btr QWORD [rdi],1
	jmp LB_58492
LB_58491:
	bts QWORD [rdi],1
LB_58492:
	mov rsi,1
	bt r12,3
	jc LB_58479
	mov rsi,0
	bt r9,0
	jc LB_58479
	jmp LB_58480
LB_58479:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58480:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_58477
	mov rsi,0
	bt r9,0
	jc LB_58477
	jmp LB_58478
LB_58477:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58478:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58495:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58497
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58496
LB_58497:
	add rsp,8
	ret
LB_58499:
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
LB_58498:
	add rsp,64
	pop r14
LB_58496:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_58567
LB_58566:
	add r14,1
LB_58567:
	cmp r14,r10
	jge LB_58568
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58566
	cmp al,10
	jz LB_58566
	cmp al,32
	jz LB_58566
LB_58568:
	push r10
	call NS_E_57840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58569
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58563
LB_58569:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58564
	btr r12,0
	jmp LB_58565
LB_58564:
	bts r12,0
LB_58565:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58560
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_58571
	btr r12,2
	jmp LB_58572
LB_58571:
	bts r12,2
LB_58572:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_58575
	btr r12,3
	jmp LB_58576
LB_58575:
	bts r12,3
LB_58576:
	mov r13,r9
	bt r12,3
	jc LB_58573
	btr r12,0
	jmp LB_58574
LB_58573:
	bts r12,0
LB_58574:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_58579
	btr r12,3
	jmp LB_58580
LB_58579:
	bts r12,3
LB_58580:
	mov r14,r9
	bt r12,3
	jc LB_58577
	btr r12,1
	jmp LB_58578
LB_58577:
	bts r12,1
LB_58578:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56251 %_57916 ⊢ %_57917 : %_57917
 ; {>  %_57916~{ 0' 1' }:{ _stg _p56223 } }
; _f56251 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_57917 ⊢ %_57918 : %_57918
 ; {>  %_57917~°4◂{ 0' 1' }:_p56220 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_57918
 ; {>  %_57918~°0◂°4◂{ 0' 1' }:(_opn)◂(_p56220) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_58554
	btr r12,2
	jmp LB_58555
LB_58554:
	bts r12,2
LB_58555:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58552
	btr QWORD [rdi],0
	jmp LB_58553
LB_58552:
	bts QWORD [rdi],0
LB_58553:
	mov r8,r14
	bt r12,1
	jc LB_58558
	btr r12,2
	jmp LB_58559
LB_58558:
	bts r12,2
LB_58559:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58556
	btr QWORD [rdi],1
	jmp LB_58557
LB_58556:
	bts QWORD [rdi],1
LB_58557:
	mov rsi,1
	bt r12,3
	jc LB_58550
	mov rsi,0
	bt r9,0
	jc LB_58550
	jmp LB_58551
LB_58550:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58551:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58560:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58562
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58561
LB_58562:
	add rsp,8
	ret
LB_58563:
	add rsp,16
	pop r14
LB_58561:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57840:
NS_E_RDI_57840:
NS_E_57840_ETR_TBL:
NS_E_57840_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; word
	jmp LB_58614
LB_58613:
	add r14,1
LB_58614:
	cmp r14,r10
	jge LB_58615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58613
	cmp al,10
	jz LB_58613
	cmp al,32
	jz LB_58613
LB_58615:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58616
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58595
LB_58616:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_58619
LB_58618:
	add r14,1
LB_58619:
	cmp r14,r10
	jge LB_58620
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58618
	cmp al,10
	jz LB_58618
	cmp al,32
	jz LB_58618
LB_58620:
	push r10
	call NS_E_57842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58621
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58622
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58622:
	jmp LB_58595
LB_58621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_58625
LB_58624:
	add r14,1
LB_58625:
	cmp r14,r10
	jge LB_58626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58624
	cmp al,10
	jz LB_58624
	cmp al,32
	jz LB_58624
LB_58626:
	add r14,1
	cmp r14,r10
	jg LB_58631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_58631
	jmp LB_58632
LB_58631:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58628
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58628:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58629
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58629:
	jmp LB_58595
LB_58632:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_58606
LB_58605:
	add r14,1
LB_58606:
	cmp r14,r10
	jge LB_58607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58605
	cmp al,10
	jz LB_58605
	cmp al,32
	jz LB_58605
LB_58607:
	push r10
	call NS_E_57862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58608
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58609
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58609:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58610
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58610:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58611
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58611:
	jmp LB_58596
LB_58608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58603
	btr r12,3
	jmp LB_58604
LB_58603:
	bts r12,3
LB_58604:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58601
	btr r12,2
	jmp LB_58602
LB_58601:
	bts r12,2
LB_58602:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58599
	btr r12,1
	jmp LB_58600
LB_58599:
	bts r12,1
LB_58600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58597
	btr r12,0
	jmp LB_58598
LB_58597:
	bts r12,0
LB_58598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_58592
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_58633
	btr r12,4
	jmp LB_58634
LB_58633:
	bts r12,4
LB_58634:
	mov r8,r9
	bt r12,3
	jc LB_58635
	btr r12,2
	jmp LB_58636
LB_58635:
	bts r12,2
LB_58636:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56259 %_57921 ⊢ %_57922 : %_57922
 ; {>  %_57920~1':_p57841 %_57921~2':_p56237 %_57919~0':_stg }
; _f56259 2' ⊢ °1◂2'
; _some { %_57919 %_57922 } ⊢ %_57923 : %_57923
 ; {>  %_57920~1':_p57841 %_57919~0':_stg %_57922~°1◂2':_p56223 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_57923
 ; {>  %_57923~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p56223 }) %_57920~1':_p57841 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_58581
	mov rdi,r14
	call dlt
LB_58581:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_58584
	btr r12,1
	jmp LB_58585
LB_58584:
	bts r12,1
LB_58585:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_58582
	btr QWORD [rdi],0
	jmp LB_58583
LB_58582:
	bts QWORD [rdi],0
LB_58583:
	mov r14,r8
	bt r12,2
	jc LB_58590
	btr r12,1
	jmp LB_58591
LB_58590:
	bts r12,1
LB_58591:
	mov rsi,1
	bt r12,1
	jc LB_58588
	mov rsi,0
	bt r14,0
	jc LB_58588
	jmp LB_58589
LB_58588:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_58589:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_58586
	btr QWORD [rdi],1
	jmp LB_58587
LB_58586:
	bts QWORD [rdi],1
LB_58587:
	mov r8,0
	bts r12,2
	ret
LB_58592:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58594
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58593
LB_58594:
	add rsp,8
	ret
LB_58596:
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
LB_58595:
	add rsp,64
	pop r14
LB_58593:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; word
	jmp LB_58683
LB_58682:
	add r14,1
LB_58683:
	cmp r14,r10
	jge LB_58684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58682
	cmp al,10
	jz LB_58682
	cmp al,32
	jz LB_58682
LB_58684:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58685
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58667
LB_58685:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_58688
LB_58687:
	add r14,1
LB_58688:
	cmp r14,r10
	jge LB_58689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58687
	cmp al,10
	jz LB_58687
	cmp al,32
	jz LB_58687
LB_58689:
	push r10
	call NS_E_57842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58690
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58691
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58691:
	jmp LB_58667
LB_58690:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_58694
LB_58693:
	add r14,1
LB_58694:
	cmp r14,r10
	jge LB_58695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58693
	cmp al,10
	jz LB_58693
	cmp al,32
	jz LB_58693
LB_58695:
	add r14,3
	cmp r14,r10
	jg LB_58700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_58700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_58700
	jmp LB_58701
LB_58700:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58697
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58697:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58698:
	jmp LB_58667
LB_58701:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_58703
LB_58702:
	add r14,1
LB_58703:
	cmp r14,r10
	jge LB_58704
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58702
	cmp al,10
	jz LB_58702
	cmp al,32
	jz LB_58702
LB_58704:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58705
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58706
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58706:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58708:
	jmp LB_58667
LB_58705:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_58711
LB_58710:
	add r14,1
LB_58711:
	cmp r14,r10
	jge LB_58712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58710
	cmp al,10
	jz LB_58710
	cmp al,32
	jz LB_58710
LB_58712:
	add r14,1
	cmp r14,r10
	jg LB_58719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_58719
	jmp LB_58720
LB_58719:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58714
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58714:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58715
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58715:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58716
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58716:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58717
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58717:
	jmp LB_58667
LB_58720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_58722
LB_58721:
	add r14,1
LB_58722:
	cmp r14,r10
	jge LB_58723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58721
	cmp al,10
	jz LB_58721
	cmp al,32
	jz LB_58721
LB_58723:
	push r10
	call NS_E_57862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58724
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_58725
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_58725:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58726
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58726:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58727
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58727:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58728
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58728:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58729
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58729:
	jmp LB_58667
LB_58724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_58732
LB_58731:
	add r14,1
LB_58732:
	cmp r14,r10
	jge LB_58733
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58731
	cmp al,10
	jz LB_58731
	cmp al,32
	jz LB_58731
LB_58733:
	push r10
	call NS_E_57844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58734
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_58735
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_58735:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_58736
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_58736:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58737
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58737:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58738
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58738:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58739
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58739:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58740:
	jmp LB_58667
LB_58734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_58680
	btr r12,6
	jmp LB_58681
LB_58680:
	bts r12,6
LB_58681:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_58678
	btr r12,5
	jmp LB_58679
LB_58678:
	bts r12,5
LB_58679:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58676
	btr r12,4
	jmp LB_58677
LB_58676:
	bts r12,4
LB_58677:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58674
	btr r12,3
	jmp LB_58675
LB_58674:
	bts r12,3
LB_58675:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58672
	btr r12,2
	jmp LB_58673
LB_58672:
	bts r12,2
LB_58673:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58670
	btr r12,1
	jmp LB_58671
LB_58670:
	bts r12,1
LB_58671:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58668
	btr r12,0
	jmp LB_58669
LB_58668:
	bts r12,0
LB_58669:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_58664
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_58742
	btr r12,7
	jmp LB_58743
LB_58742:
	bts r12,7
LB_58743:
	mov r10,rcx
	bt r12,6
	jc LB_58744
	btr r12,4
	jmp LB_58745
LB_58744:
	bts r12,4
LB_58745:
	mov rcx,r9
	bt r12,3
	jc LB_58746
	btr r12,6
	jmp LB_58747
LB_58746:
	bts r12,6
LB_58747:
	mov r9,r11
	bt r12,5
	jc LB_58748
	btr r12,3
	jmp LB_58749
LB_58748:
	bts r12,3
LB_58749:
	mov r11,r8
	bt r12,2
	jc LB_58750
	btr r12,5
	jmp LB_58751
LB_58750:
	bts r12,5
LB_58751:
	mov r8,rcx
	bt r12,6
	jc LB_58752
	btr r12,2
	jmp LB_58753
LB_58752:
	bts r12,2
LB_58753:
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_57926 %_57927 } %_57928 } ⊢ %_57929 : %_57929
 ; {>  %_57924~0':_stg %_57926~2':_stg %_57928~4':(_lst)◂({ _stg _p56237 }) %_57927~3':_p56237 %_57925~1':_p57841 }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f56258 %_57929 ⊢ %_57930 : %_57930
 ; {>  %_57924~0':_stg %_57925~1':_p57841 %_57929~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p56237 }) }
; _f56258 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_57924 %_57930 } ⊢ %_57931 : %_57931
 ; {>  %_57924~0':_stg %_57930~°0◂°0◂{ { 2' 3' } 4' }:_p56223 %_57925~1':_p57841 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_57931
 ; {>  %_57931~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p56223 }) %_57925~1':_p57841 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_58637
	mov rdi,r14
	call dlt
LB_58637:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_58638
	btr r12,1
	jmp LB_58639
LB_58638:
	bts r12,1
LB_58639:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_58642
	btr r12,5
	jmp LB_58643
LB_58642:
	bts r12,5
LB_58643:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58640
	btr QWORD [rdi],0
	jmp LB_58641
LB_58640:
	bts QWORD [rdi],0
LB_58641:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_58654
	btr r12,6
	jmp LB_58655
LB_58654:
	bts r12,6
LB_58655:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_58652
	btr QWORD [rdi],0
	jmp LB_58653
LB_58652:
	bts QWORD [rdi],0
LB_58653:
	mov rcx,r14
	bt r12,1
	jc LB_58658
	btr r12,6
	jmp LB_58659
LB_58658:
	bts r12,6
LB_58659:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_58656
	btr QWORD [rdi],1
	jmp LB_58657
LB_58656:
	bts QWORD [rdi],1
LB_58657:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_58650
	btr QWORD [rdi],0
	jmp LB_58651
LB_58650:
	bts QWORD [rdi],0
LB_58651:
	mov r13,r10
	bt r12,4
	jc LB_58662
	btr r12,0
	jmp LB_58663
LB_58662:
	bts r12,0
LB_58663:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_58660
	btr QWORD [rdi],1
	jmp LB_58661
LB_58660:
	bts QWORD [rdi],1
LB_58661:
	mov rsi,1
	bt r12,5
	jc LB_58648
	mov rsi,0
	bt r11,0
	jc LB_58648
	jmp LB_58649
LB_58648:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_58649:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_58646
	mov rsi,0
	bt r11,0
	jc LB_58646
	jmp LB_58647
LB_58646:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_58647:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58644
	btr QWORD [rdi],1
	jmp LB_58645
LB_58644:
	bts QWORD [rdi],1
LB_58645:
	mov r8,0
	bts r12,2
	ret
LB_58664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58666
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58665
LB_58666:
	add rsp,8
	ret
LB_58667:
	add rsp,112
	pop r14
LB_58665:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57842:
NS_E_RDI_57842:
NS_E_57842_ETR_TBL:
NS_E_57842_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_58768
LB_58767:
	add r14,1
LB_58768:
	cmp r14,r10
	jge LB_58769
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58767
	cmp al,10
	jz LB_58767
	cmp al,32
	jz LB_58767
LB_58769:
	add r14,3
	cmp r14,r10
	jg LB_58772
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58772
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_58772
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_58772
	jmp LB_58773
LB_58772:
	jmp LB_58754
LB_58773:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_58762
LB_58761:
	add r14,1
LB_58762:
	cmp r14,r10
	jge LB_58763
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58761
	cmp al,10
	jz LB_58761
	cmp al,32
	jz LB_58761
LB_58763:
	push r10
	call NS_E_57866_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58764
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58765
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58765:
	jmp LB_58755
LB_58764:
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
	jc LB_58758
	btr QWORD [rdi],1
LB_58758:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58759
	btr QWORD [rdi],0
LB_58759:
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
LB_58755:
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
LB_58754:
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
LB_58756:
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
NS_E_57843:
NS_E_RDI_57843:
NS_E_57843_ETR_TBL:
NS_E_57843_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_58827
LB_58826:
	add r14,1
LB_58827:
	cmp r14,r10
	jge LB_58828
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58826
	cmp al,10
	jz LB_58826
	cmp al,32
	jz LB_58826
LB_58828:
	add r14,1
	cmp r14,r10
	jg LB_58831
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_58831
	jmp LB_58832
LB_58831:
	jmp LB_58793
LB_58832:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58804
LB_58803:
	add r14,1
LB_58804:
	cmp r14,r10
	jge LB_58805
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58803
	cmp al,10
	jz LB_58803
	cmp al,32
	jz LB_58803
LB_58805:
	add r14,1
	cmp r14,r10
	jg LB_58809
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58809
	jmp LB_58810
LB_58809:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58807
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58807:
	jmp LB_58794
LB_58810:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_58812
LB_58811:
	add r14,1
LB_58812:
	cmp r14,r10
	jge LB_58813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58811
	cmp al,10
	jz LB_58811
	cmp al,32
	jz LB_58811
LB_58813:
	push r10
	call NS_E_57840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58815
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58815:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58816:
	jmp LB_58794
LB_58814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_58819
LB_58818:
	add r14,1
LB_58819:
	cmp r14,r10
	jge LB_58820
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58818
	cmp al,10
	jz LB_58818
	cmp al,32
	jz LB_58818
LB_58820:
	push r10
	call NS_E_57843_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58821
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58822
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58822:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58823
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58823:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58824
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58824:
	jmp LB_58794
LB_58821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58801
	btr r12,3
	jmp LB_58802
LB_58801:
	bts r12,3
LB_58802:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58799
	btr r12,2
	jmp LB_58800
LB_58799:
	bts r12,2
LB_58800:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58797
	btr r12,1
	jmp LB_58798
LB_58797:
	bts r12,1
LB_58798:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58795
	btr r12,0
	jmp LB_58796
LB_58795:
	bts r12,0
LB_58796:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_58790
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_58833
	btr r12,4
	jmp LB_58834
LB_58833:
	bts r12,4
LB_58834:
	mov r8,r9
	bt r12,3
	jc LB_58835
	btr r12,2
	jmp LB_58836
LB_58835:
	bts r12,2
LB_58836:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_58839
	btr r12,3
	jmp LB_58840
LB_58839:
	bts r12,3
LB_58840:
	mov r13,r9
	bt r12,3
	jc LB_58837
	btr r12,0
	jmp LB_58838
LB_58837:
	bts r12,0
LB_58838:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_58843
	btr r12,3
	jmp LB_58844
LB_58843:
	bts r12,3
LB_58844:
	mov r14,r9
	bt r12,3
	jc LB_58841
	btr r12,1
	jmp LB_58842
LB_58841:
	bts r12,1
LB_58842:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_57934 %_57935 } ⊢ %_57936 : %_57936
 ; {>  %_57934~{ 0' 1' }:{ _stg _p56223 } %_57935~2':(_lst)◂({ _stg _p56223 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_57936 ⊢ %_57937 : %_57937
 ; {>  %_57936~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p56223 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_57937
 ; {>  %_57937~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p56223 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58780
	btr r12,5
	jmp LB_58781
LB_58780:
	bts r12,5
LB_58781:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58778
	btr QWORD [rdi],0
	jmp LB_58779
LB_58778:
	bts QWORD [rdi],0
LB_58779:
	mov r11,r14
	bt r12,1
	jc LB_58784
	btr r12,5
	jmp LB_58785
LB_58784:
	bts r12,5
LB_58785:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58782
	btr QWORD [rdi],1
	jmp LB_58783
LB_58782:
	bts QWORD [rdi],1
LB_58783:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58776
	btr QWORD [rdi],0
	jmp LB_58777
LB_58776:
	bts QWORD [rdi],0
LB_58777:
	mov r10,r8
	bt r12,2
	jc LB_58788
	btr r12,4
	jmp LB_58789
LB_58788:
	bts r12,4
LB_58789:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58786
	btr QWORD [rdi],1
	jmp LB_58787
LB_58786:
	bts QWORD [rdi],1
LB_58787:
	mov rsi,1
	bt r12,3
	jc LB_58774
	mov rsi,0
	bt r9,0
	jc LB_58774
	jmp LB_58775
LB_58774:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58775:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58790:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58792
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58791
LB_58792:
	add rsp,8
	ret
LB_58794:
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
LB_58793:
	add rsp,64
	pop r14
LB_58791:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_58847
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57938 : %_57938
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57938 ⊢ %_57939 : %_57939
 ; {>  %_57938~°1◂{  }:(_lst)◂(t20370'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57939
 ; {>  %_57939~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20373'(0))) }
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
	jc LB_58845
	mov rsi,0
	bt r9,0
	jc LB_58845
	jmp LB_58846
LB_58845:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58846:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58847:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58849
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58848
LB_58849:
	add rsp,8
	ret
LB_58850:
	add rsp,0
	pop r14
LB_58848:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57844:
NS_E_RDI_57844:
NS_E_57844_ETR_TBL:
NS_E_57844_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_58915
LB_58914:
	add r14,1
LB_58915:
	cmp r14,r10
	jge LB_58916
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58914
	cmp al,10
	jz LB_58914
	cmp al,32
	jz LB_58914
LB_58916:
	add r14,3
	cmp r14,r10
	jg LB_58919
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58919
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_58919
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_58919
	jmp LB_58920
LB_58919:
	jmp LB_58870
LB_58920:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_58883
LB_58882:
	add r14,1
LB_58883:
	cmp r14,r10
	jge LB_58884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58882
	cmp al,10
	jz LB_58882
	cmp al,32
	jz LB_58882
LB_58884:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58885
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58886
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58886:
	jmp LB_58871
LB_58885:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_58889
LB_58888:
	add r14,1
LB_58889:
	cmp r14,r10
	jge LB_58890
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58888
	cmp al,10
	jz LB_58888
	cmp al,32
	jz LB_58888
LB_58890:
	add r14,1
	cmp r14,r10
	jg LB_58895
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_58895
	jmp LB_58896
LB_58895:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58892
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58892:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58893
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58893:
	jmp LB_58871
LB_58896:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_58898
LB_58897:
	add r14,1
LB_58898:
	cmp r14,r10
	jge LB_58899
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58897
	cmp al,10
	jz LB_58897
	cmp al,32
	jz LB_58897
LB_58899:
	push r10
	call NS_E_57862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58900
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58901
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58901:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58902
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58902:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58903
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58903:
	jmp LB_58871
LB_58900:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_58906
LB_58905:
	add r14,1
LB_58906:
	cmp r14,r10
	jge LB_58907
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58905
	cmp al,10
	jz LB_58905
	cmp al,32
	jz LB_58905
LB_58907:
	push r10
	call NS_E_57844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58908
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58909
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58909:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58910
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58910:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58911
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58911:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58912
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58912:
	jmp LB_58871
LB_58908:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58880
	btr r12,4
	jmp LB_58881
LB_58880:
	bts r12,4
LB_58881:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58878
	btr r12,3
	jmp LB_58879
LB_58878:
	bts r12,3
LB_58879:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58876
	btr r12,2
	jmp LB_58877
LB_58876:
	bts r12,2
LB_58877:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58874
	btr r12,1
	jmp LB_58875
LB_58874:
	bts r12,1
LB_58875:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58872
	btr r12,0
	jmp LB_58873
LB_58872:
	bts r12,0
LB_58873:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_58867
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_58921
	btr r12,5
	jmp LB_58922
LB_58921:
	bts r12,5
LB_58922:
	mov r8,r10
	bt r12,4
	jc LB_58923
	btr r12,2
	jmp LB_58924
LB_58923:
	bts r12,2
LB_58924:
	mov r10,r14
	bt r12,1
	jc LB_58925
	btr r12,4
	jmp LB_58926
LB_58925:
	bts r12,4
LB_58926:
	mov r14,r9
	bt r12,3
	jc LB_58927
	btr r12,1
	jmp LB_58928
LB_58927:
	bts r12,1
LB_58928:
	mov r9,r13
	bt r12,0
	jc LB_58929
	btr r12,3
	jmp LB_58930
LB_58929:
	bts r12,3
LB_58930:
	mov r13,r10
	bt r12,4
	jc LB_58931
	btr r12,0
	jmp LB_58932
LB_58931:
	bts r12,0
LB_58932:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_57940 %_57941 } %_57942 } ⊢ %_57943 : %_57943
 ; {>  %_57941~1':_p56237 %_57942~2':(_lst)◂({ _stg _p56237 }) %_57940~0':_stg }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_57943 ⊢ %_57944 : %_57944
 ; {>  %_57943~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p56237 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_57944
 ; {>  %_57944~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p56237 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58857
	btr r12,5
	jmp LB_58858
LB_58857:
	bts r12,5
LB_58858:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58855
	btr QWORD [rdi],0
	jmp LB_58856
LB_58855:
	bts QWORD [rdi],0
LB_58856:
	mov r11,r14
	bt r12,1
	jc LB_58861
	btr r12,5
	jmp LB_58862
LB_58861:
	bts r12,5
LB_58862:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58859
	btr QWORD [rdi],1
	jmp LB_58860
LB_58859:
	bts QWORD [rdi],1
LB_58860:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58853
	btr QWORD [rdi],0
	jmp LB_58854
LB_58853:
	bts QWORD [rdi],0
LB_58854:
	mov r10,r8
	bt r12,2
	jc LB_58865
	btr r12,4
	jmp LB_58866
LB_58865:
	bts r12,4
LB_58866:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58863
	btr QWORD [rdi],1
	jmp LB_58864
LB_58863:
	bts QWORD [rdi],1
LB_58864:
	mov rsi,1
	bt r12,3
	jc LB_58851
	mov rsi,0
	bt r9,0
	jc LB_58851
	jmp LB_58852
LB_58851:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58852:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58867:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58869
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58868
LB_58869:
	add rsp,8
	ret
LB_58871:
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
LB_58870:
	add rsp,80
	pop r14
LB_58868:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_58935
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57945 : %_57945
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57945 ⊢ %_57946 : %_57946
 ; {>  %_57945~°1◂{  }:(_lst)◂(t20384'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57946
 ; {>  %_57946~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20387'(0))) }
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
	jc LB_58933
	mov rsi,0
	bt r9,0
	jc LB_58933
	jmp LB_58934
LB_58933:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58934:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58935:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58937
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58936
LB_58937:
	add rsp,8
	ret
LB_58938:
	add rsp,0
	pop r14
LB_58936:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57845:
NS_E_RDI_57845:
NS_E_57845_ETR_TBL:
NS_E_57845_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_59003
LB_59002:
	add r14,1
LB_59003:
	cmp r14,r10
	jge LB_59004
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59002
	cmp al,10
	jz LB_59002
	cmp al,32
	jz LB_59002
LB_59004:
	add r14,1
	cmp r14,r10
	jg LB_59007
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_59007
	jmp LB_59008
LB_59007:
	jmp LB_58950
LB_59008:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58965
LB_58964:
	add r14,1
LB_58965:
	cmp r14,r10
	jge LB_58966
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58964
	cmp al,10
	jz LB_58964
	cmp al,32
	jz LB_58964
LB_58966:
	add r14,1
	cmp r14,r10
	jg LB_58970
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58970
	jmp LB_58971
LB_58970:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58968:
	jmp LB_58951
LB_58971:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_58973
LB_58972:
	add r14,1
LB_58973:
	cmp r14,r10
	jge LB_58974
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58972
	cmp al,10
	jz LB_58972
	cmp al,32
	jz LB_58972
LB_58974:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58975
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58976
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58976:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58977:
	jmp LB_58951
LB_58975:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_58980
LB_58979:
	add r14,1
LB_58980:
	cmp r14,r10
	jge LB_58981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58979
	cmp al,10
	jz LB_58979
	cmp al,32
	jz LB_58979
LB_58981:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58982
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58983
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58983:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58984
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58984:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58985:
	jmp LB_58951
LB_58982:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_58988
LB_58987:
	add r14,1
LB_58988:
	cmp r14,r10
	jge LB_58989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58987
	cmp al,10
	jz LB_58987
	cmp al,32
	jz LB_58987
LB_58989:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58990
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58991
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58991:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58992
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58992:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58993
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58993:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58994
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58994:
	jmp LB_58951
LB_58990:
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
LB_59000:
	jmp LB_58997
LB_58996:
	add r14,1
LB_58997:
	cmp r14,r10
	jge LB_58998
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58996
	cmp al,10
	jz LB_58996
	cmp al,32
	jz LB_58996
LB_58998:
	push r10
	push rsi
	call NS_E_57847_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_58999
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_59001
	bts QWORD [rax],0
LB_59001:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_59000
LB_58999:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_58962
	btr r12,5
	jmp LB_58963
LB_58962:
	bts r12,5
LB_58963:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58960
	btr r12,4
	jmp LB_58961
LB_58960:
	bts r12,4
LB_58961:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58958
	btr r12,3
	jmp LB_58959
LB_58958:
	bts r12,3
LB_58959:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58956
	btr r12,2
	jmp LB_58957
LB_58956:
	bts r12,2
LB_58957:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58954
	btr r12,1
	jmp LB_58955
LB_58954:
	bts r12,1
LB_58955:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58952
	btr r12,0
	jmp LB_58953
LB_58952:
	bts r12,0
LB_58953:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_58947
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_59009
	btr r12,6
	jmp LB_59010
LB_59009:
	bts r12,6
LB_59010:
	mov r9,r11
	bt r12,5
	jc LB_59011
	btr r12,3
	jmp LB_59012
LB_59011:
	bts r12,3
LB_59012:
	mov r11,r8
	bt r12,2
	jc LB_59013
	btr r12,5
	jmp LB_59014
LB_59013:
	bts r12,5
LB_59014:
	mov r8,r10
	bt r12,4
	jc LB_59015
	btr r12,2
	jmp LB_59016
LB_59015:
	bts r12,2
LB_59016:
	mov r10,r14
	bt r12,1
	jc LB_59017
	btr r12,4
	jmp LB_59018
LB_59017:
	bts r12,4
LB_59018:
	mov r14,rcx
	bt r12,6
	jc LB_59019
	btr r12,1
	jmp LB_59020
LB_59019:
	bts r12,1
LB_59020:
	mov rcx,r13
	bt r12,0
	jc LB_59021
	btr r12,6
	jmp LB_59022
LB_59021:
	bts r12,6
LB_59022:
	mov r13,r11
	bt r12,5
	jc LB_59023
	btr r12,0
	jmp LB_59024
LB_59023:
	bts r12,0
LB_59024:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57951 : %_57951
 ; {>  %_57948~1':_p56236 %_57950~3':(_lst)◂(_p57846) %_57947~0':_stg %_57949~2':_p56239 }
; _nil {  } ⊢ °1◂{  }
; _f56250 %_57951 ⊢ %_57952 : %_57952
 ; {>  %_57951~°1◂{  }:(_lst)◂(t20396'(0)) %_57948~1':_p56236 %_57950~3':(_lst)◂(_p57846) %_57947~0':_stg %_57949~2':_p56239 }
; _f56250 °1◂{  } ⊢ °3◂°1◂{  }
; _some %_57952 ⊢ %_57953 : %_57953
 ; {>  %_57952~°3◂°1◂{  }:_p56220 %_57948~1':_p56236 %_57950~3':(_lst)◂(_p57846) %_57947~0':_stg %_57949~2':_p56239 }
; _some °3◂°1◂{  } ⊢ °0◂°3◂°1◂{  }
; ∎ %_57953
 ; {>  %_57948~1':_p56236 %_57950~3':(_lst)◂(_p57846) %_57953~°0◂°3◂°1◂{  }:(_opn)◂(_p56220) %_57947~0':_stg %_57949~2':_p56239 }
; 	∎ °0◂°3◂°1◂{  }
	bt r12,1
	jc LB_58939
	mov rdi,r14
	call dlt
LB_58939:
	bt r12,3
	jc LB_58940
	mov rdi,r9
	call dlt
LB_58940:
	bt r12,0
	jc LB_58941
	mov rdi,r13
	call dlt
LB_58941:
	bt r12,2
	jc LB_58942
	mov rdi,r8
	call dlt
LB_58942:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°3◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_58945
	mov rsi,0
	bt r9,0
	jc LB_58945
	jmp LB_58946
LB_58945:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58946:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_58943
	mov rsi,0
	bt r9,0
	jc LB_58943
	jmp LB_58944
LB_58943:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58944:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58947:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58949
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58948
LB_58949:
	add rsp,8
	ret
LB_58951:
	add rsp,96
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
LB_58950:
	add rsp,96
	pop r14
LB_58948:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_59044
LB_59043:
	add r14,1
LB_59044:
	cmp r14,r10
	jge LB_59045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59043
	cmp al,10
	jz LB_59043
	cmp al,32
	jz LB_59043
LB_59045:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59046
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59038
LB_59046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_59049
LB_59048:
	add r14,1
LB_59049:
	cmp r14,r10
	jge LB_59050
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59048
	cmp al,10
	jz LB_59048
	cmp al,32
	jz LB_59048
LB_59050:
	push r10
	call NS_E_57848_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59051
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59052
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59052:
	jmp LB_59038
LB_59051:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59041
	btr r12,1
	jmp LB_59042
LB_59041:
	bts r12,1
LB_59042:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59039
	btr r12,0
	jmp LB_59040
LB_59039:
	bts r12,0
LB_59040:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59035
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56249 { %_57954 %_57955 } ⊢ %_57956 : %_57956
 ; {>  %_57955~1':_p56222 %_57954~0':_stg }
; _f56249 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_57956 ⊢ %_57957 : %_57957
 ; {>  %_57956~°2◂{ 0' 1' }:_p56220 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_57957
 ; {>  %_57957~°0◂°2◂{ 0' 1' }:(_opn)◂(_p56220) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_59029
	btr r12,2
	jmp LB_59030
LB_59029:
	bts r12,2
LB_59030:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59027
	btr QWORD [rdi],0
	jmp LB_59028
LB_59027:
	bts QWORD [rdi],0
LB_59028:
	mov r8,r14
	bt r12,1
	jc LB_59033
	btr r12,2
	jmp LB_59034
LB_59033:
	bts r12,2
LB_59034:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59031
	btr QWORD [rdi],1
	jmp LB_59032
LB_59031:
	bts QWORD [rdi],1
LB_59032:
	mov rsi,1
	bt r12,3
	jc LB_59025
	mov rsi,0
	bt r9,0
	jc LB_59025
	jmp LB_59026
LB_59025:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59026:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59035:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59037
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59036
LB_59037:
	add rsp,8
	ret
LB_59038:
	add rsp,32
	pop r14
LB_59036:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57847:
NS_E_RDI_57847:
NS_E_57847_ETR_TBL:
NS_E_57847_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_59062
LB_59061:
	add r14,1
LB_59062:
	cmp r14,r10
	jge LB_59063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59061
	cmp al,10
	jz LB_59061
	cmp al,32
	jz LB_59061
LB_59063:
	add r14,1
	cmp r14,r10
	jg LB_59066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_59066
	jmp LB_59067
LB_59066:
	jmp LB_59054
LB_59067:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_59069
LB_59068:
	add r14,1
LB_59069:
	cmp r14,r10
	jge LB_59070
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59068
	cmp al,10
	jz LB_59068
	cmp al,32
	jz LB_59068
LB_59070:
	add r14,1
	cmp r14,r10
	jg LB_59074
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_59074
	jmp LB_59075
LB_59074:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59072
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59072:
	jmp LB_59054
LB_59075:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_59077
LB_59076:
	add r14,1
LB_59077:
	cmp r14,r10
	jge LB_59078
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59076
	cmp al,10
	jz LB_59076
	cmp al,32
	jz LB_59076
LB_59078:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59079
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59080
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59080:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59081:
	jmp LB_59054
LB_59079:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_59084
LB_59083:
	add r14,1
LB_59084:
	cmp r14,r10
	jge LB_59085
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59083
	cmp al,10
	jz LB_59083
	cmp al,32
	jz LB_59083
LB_59085:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59086
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59087
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59087:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59088
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59088:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59089
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59089:
	jmp LB_59054
LB_59086:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_59092
LB_59091:
	add r14,1
LB_59092:
	cmp r14,r10
	jge LB_59093
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59091
	cmp al,10
	jz LB_59091
	cmp al,32
	jz LB_59091
LB_59093:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59094
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59095
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59095:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59096
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59096:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59097
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59097:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59098:
	jmp LB_59054
LB_59094:
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
	jc LB_59055
	btr QWORD [rdi],4
LB_59055:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59056
	btr QWORD [rdi],3
LB_59056:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59057
	btr QWORD [rdi],2
LB_59057:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59058
	btr QWORD [rdi],1
LB_59058:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59059
	btr QWORD [rdi],0
LB_59059:
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
LB_59054:
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
NS_E_57848:
NS_E_RDI_57848:
NS_E_57848_ETR_TBL:
NS_E_57848_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_59120
LB_59119:
	add r14,1
LB_59120:
	cmp r14,r10
	jge LB_59121
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59119
	cmp al,10
	jz LB_59119
	cmp al,32
	jz LB_59119
LB_59121:
	add r14,1
	cmp r14,r10
	jg LB_59124
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_59124
	jmp LB_59125
LB_59124:
	jmp LB_59107
LB_59125:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_59114
LB_59113:
	add r14,1
LB_59114:
	cmp r14,r10
	jge LB_59115
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59113
	cmp al,10
	jz LB_59113
	cmp al,32
	jz LB_59113
LB_59115:
	push r10
	call NS_E_57174_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59116
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59117
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59117:
	jmp LB_59108
LB_59116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59111
	btr r12,1
	jmp LB_59112
LB_59111:
	bts r12,1
LB_59112:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59109
	btr r12,0
	jmp LB_59110
LB_59109:
	bts r12,0
LB_59110:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59104
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_59126
	btr r12,2
	jmp LB_59127
LB_59126:
	bts r12,2
LB_59127:
	mov r13,r14
	bt r12,1
	jc LB_59128
	btr r12,0
	jmp LB_59129
LB_59128:
	bts r12,0
LB_59129:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56256 %_57959 ⊢ %_57960 : %_57960
 ; {>  %_57959~0':_p56238 }
; _f56256 0' ⊢ °1◂0'
; _some %_57960 ⊢ %_57961 : %_57961
 ; {>  %_57960~°1◂0':_p56222 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57961
 ; {>  %_57961~°0◂°1◂0':(_opn)◂(_p56222) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59102
	btr r12,3
	jmp LB_59103
LB_59102:
	bts r12,3
LB_59103:
	mov rsi,1
	bt r12,3
	jc LB_59100
	mov rsi,0
	bt r9,0
	jc LB_59100
	jmp LB_59101
LB_59100:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59101:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59104:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59106
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59105
LB_59106:
	add rsp,8
	ret
LB_59108:
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
LB_59107:
	add rsp,32
	pop r14
LB_59105:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_59150
LB_59149:
	add r14,1
LB_59150:
	cmp r14,r10
	jge LB_59151
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59149
	cmp al,10
	jz LB_59149
	cmp al,32
	jz LB_59149
LB_59151:
	add r14,2
	cmp r14,r10
	jg LB_59154
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_59154
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_59154
	jmp LB_59155
LB_59154:
	jmp LB_59137
LB_59155:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_59144
LB_59143:
	add r14,1
LB_59144:
	cmp r14,r10
	jge LB_59145
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59143
	cmp al,10
	jz LB_59143
	cmp al,32
	jz LB_59143
LB_59145:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59146
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59147
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59147:
	jmp LB_59138
LB_59146:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59141
	btr r12,1
	jmp LB_59142
LB_59141:
	bts r12,1
LB_59142:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59139
	btr r12,0
	jmp LB_59140
LB_59139:
	bts r12,0
LB_59140:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59134
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_59156
	btr r12,2
	jmp LB_59157
LB_59156:
	bts r12,2
LB_59157:
	mov r13,r14
	bt r12,1
	jc LB_59158
	btr r12,0
	jmp LB_59159
LB_59158:
	bts r12,0
LB_59159:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56257 %_57962 ⊢ %_57963 : %_57963
 ; {>  %_57962~0':_p56239 }
; _f56257 0' ⊢ °2◂0'
; _some %_57963 ⊢ %_57964 : %_57964
 ; {>  %_57963~°2◂0':_p56222 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_57964
 ; {>  %_57964~°0◂°2◂0':(_opn)◂(_p56222) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59132
	btr r12,3
	jmp LB_59133
LB_59132:
	bts r12,3
LB_59133:
	mov rsi,1
	bt r12,3
	jc LB_59130
	mov rsi,0
	bt r9,0
	jc LB_59130
	jmp LB_59131
LB_59130:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59131:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59134:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59136
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59135
LB_59136:
	add rsp,8
	ret
LB_59138:
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
LB_59137:
	add rsp,32
	pop r14
LB_59135:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_59179
LB_59178:
	add r14,1
LB_59179:
	cmp r14,r10
	jge LB_59180
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59178
	cmp al,10
	jz LB_59178
	cmp al,32
	jz LB_59178
LB_59180:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59181
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59173
LB_59181:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_59184
LB_59183:
	add r14,1
LB_59184:
	cmp r14,r10
	jge LB_59185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59183
	cmp al,10
	jz LB_59183
	cmp al,32
	jz LB_59183
LB_59185:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59186
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59187
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59187:
	jmp LB_59173
LB_59186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59176
	btr r12,1
	jmp LB_59177
LB_59176:
	bts r12,1
LB_59177:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59174
	btr r12,0
	jmp LB_59175
LB_59174:
	bts r12,0
LB_59175:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59170
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56255 { %_57965 %_57966 } ⊢ %_57967 : %_57967
 ; {>  %_57965~0':_p56236 %_57966~1':_p56239 }
; _f56255 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57967 ⊢ %_57968 : %_57968
 ; {>  %_57967~°0◂{ 0' 1' }:_p56222 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57968
 ; {>  %_57968~°0◂°0◂{ 0' 1' }:(_opn)◂(_p56222) }
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
	jc LB_59164
	btr r12,2
	jmp LB_59165
LB_59164:
	bts r12,2
LB_59165:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59162
	btr QWORD [rdi],0
	jmp LB_59163
LB_59162:
	bts QWORD [rdi],0
LB_59163:
	mov r8,r14
	bt r12,1
	jc LB_59168
	btr r12,2
	jmp LB_59169
LB_59168:
	bts r12,2
LB_59169:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59166
	btr QWORD [rdi],1
	jmp LB_59167
LB_59166:
	bts QWORD [rdi],1
LB_59167:
	mov rsi,1
	bt r12,3
	jc LB_59160
	mov rsi,0
	bt r9,0
	jc LB_59160
	jmp LB_59161
LB_59160:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59161:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59170:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59172
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59171
LB_59172:
	add rsp,8
	ret
LB_59173:
	add rsp,32
	pop r14
LB_59171:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57849:
NS_E_RDI_57849:
NS_E_57849_ETR_TBL:
NS_E_57849_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_59202
LB_59201:
	add r14,1
LB_59202:
	cmp r14,r10
	jge LB_59203
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59201
	cmp al,10
	jz LB_59201
	cmp al,32
	jz LB_59201
LB_59203:
	add r14,3
	cmp r14,r10
	jg LB_59206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_59206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_59206
	jmp LB_59207
LB_59206:
	jmp LB_59196
LB_59207:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_59209
LB_59208:
	add r14,1
LB_59209:
	cmp r14,r10
	jge LB_59210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59208
	cmp al,10
	jz LB_59208
	cmp al,32
	jz LB_59208
LB_59210:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59211
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59212
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59212:
	jmp LB_59196
LB_59211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59199
	btr r12,1
	jmp LB_59200
LB_59199:
	bts r12,1
LB_59200:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59197
	btr r12,0
	jmp LB_59198
LB_59197:
	bts r12,0
LB_59198:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59193
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_59214
	btr r12,2
	jmp LB_59215
LB_59214:
	bts r12,2
LB_59215:
	mov r13,r14
	bt r12,1
	jc LB_59216
	btr r12,0
	jmp LB_59217
LB_59216:
	bts r12,0
LB_59217:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56297 %_57969 ⊢ %_57970 : %_57970
 ; {>  %_57969~0':_p56235 }
; _f56297 0' ⊢ °2◂0'
; _some %_57970 ⊢ %_57971 : %_57971
 ; {>  %_57970~°2◂0':_p56239 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_57971
 ; {>  %_57971~°0◂°2◂0':(_opn)◂(_p56239) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59191
	btr r12,3
	jmp LB_59192
LB_59191:
	bts r12,3
LB_59192:
	mov rsi,1
	bt r12,3
	jc LB_59189
	mov rsi,0
	bt r9,0
	jc LB_59189
	jmp LB_59190
LB_59189:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59190:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59193:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59195
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59194
LB_59195:
	add rsp,8
	ret
LB_59196:
	add rsp,32
	pop r14
LB_59194:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_59229
LB_59228:
	add r14,1
LB_59229:
	cmp r14,r10
	jge LB_59230
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59228
	cmp al,10
	jz LB_59228
	cmp al,32
	jz LB_59228
LB_59230:
	push r10
	call NS_E_57857_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59231
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59225
LB_59231:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59226
	btr r12,0
	jmp LB_59227
LB_59226:
	bts r12,0
LB_59227:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59222
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56296 %_57972 ⊢ %_57973 : %_57973
 ; {>  %_57972~0':_p56240 }
; _f56296 0' ⊢ °1◂0'
; _some %_57973 ⊢ %_57974 : %_57974
 ; {>  %_57973~°1◂0':_p56239 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57974
 ; {>  %_57974~°0◂°1◂0':(_opn)◂(_p56239) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59220
	btr r12,3
	jmp LB_59221
LB_59220:
	bts r12,3
LB_59221:
	mov rsi,1
	bt r12,3
	jc LB_59218
	mov rsi,0
	bt r9,0
	jc LB_59218
	jmp LB_59219
LB_59218:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59219:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59222:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59224
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59223
LB_59224:
	add rsp,8
	ret
LB_59225:
	add rsp,16
	pop r14
LB_59223:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_59245
LB_59244:
	add r14,1
LB_59245:
	cmp r14,r10
	jge LB_59246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59244
	cmp al,10
	jz LB_59244
	cmp al,32
	jz LB_59244
LB_59246:
	push r10
	call NS_E_57850_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59239
LB_59247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_59250
LB_59249:
	add r14,1
LB_59250:
	cmp r14,r10
	jge LB_59251
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59249
	cmp al,10
	jz LB_59249
	cmp al,32
	jz LB_59249
LB_59251:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59252
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59253:
	jmp LB_59239
LB_59252:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59242
	btr r12,1
	jmp LB_59243
LB_59242:
	bts r12,1
LB_59243:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59240
	btr r12,0
	jmp LB_59241
LB_59240:
	bts r12,0
LB_59241:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59236
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_59255
	btr r12,3
	jmp LB_59256
LB_59255:
	bts r12,3
LB_59256:
	mov r10,r13
	bt r12,0
	jc LB_59257
	btr r12,4
	jmp LB_59258
LB_59257:
	bts r12,4
LB_59258:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_59261
	btr r12,5
	jmp LB_59262
LB_59261:
	bts r12,5
LB_59262:
	mov r13,r11
	bt r12,5
	jc LB_59259
	btr r12,0
	jmp LB_59260
LB_59259:
	bts r12,0
LB_59260:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_59265
	btr r12,5
	jmp LB_59266
LB_59265:
	bts r12,5
LB_59266:
	mov r14,r11
	bt r12,5
	jc LB_59263
	btr r12,1
	jmp LB_59264
LB_59263:
	bts r12,1
LB_59264:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_59269
	btr r12,5
	jmp LB_59270
LB_59269:
	bts r12,5
LB_59270:
	mov r8,r11
	bt r12,5
	jc LB_59267
	btr r12,2
	jmp LB_59268
LB_59267:
	bts r12,2
LB_59268:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57976 ⊢ %_57977 : %_57977
 ; {>  %_57976~3':_p56239 %_57975~{ 0' 1' 2' }:{ _p56244 _p56235 _p56236 } }
; _some 3' ⊢ °0◂3'
; ∎ %_57977
 ; {>  %_57977~°0◂3':(_opn)◂(_p56239) %_57975~{ 0' 1' 2' }:{ _p56244 _p56235 _p56236 } }
; 	∎ °0◂3'
	bt r12,0
	jc LB_59233
	mov rdi,r13
	call dlt
LB_59233:
	bt r12,1
	jc LB_59234
	mov rdi,r14
	call dlt
LB_59234:
	bt r12,2
	jc LB_59235
	mov rdi,r8
	call dlt
LB_59235:
; _emt_mov_ptn_to_ptn:{| 00010.. |},°0◂3' ⊢ 2'◂3'
	mov r8,0
	bts r12,2
	ret
LB_59236:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59238
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59237
LB_59238:
	add rsp,8
	ret
LB_59239:
	add rsp,32
	pop r14
LB_59237:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57850:
NS_E_RDI_57850:
NS_E_57850_ETR_TBL:
NS_E_57850_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_59336
LB_59335:
	add r14,1
LB_59336:
	cmp r14,r10
	jge LB_59337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59335
	cmp al,10
	jz LB_59335
	cmp al,32
	jz LB_59335
LB_59337:
	add r14,1
	cmp r14,r10
	jg LB_59340
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_59340
	jmp LB_59341
LB_59340:
	jmp LB_59291
LB_59341:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_59304
LB_59303:
	add r14,1
LB_59304:
	cmp r14,r10
	jge LB_59305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59303
	cmp al,10
	jz LB_59303
	cmp al,32
	jz LB_59303
LB_59305:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59306
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59307
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59307:
	jmp LB_59292
LB_59306:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_59310
LB_59309:
	add r14,1
LB_59310:
	cmp r14,r10
	jge LB_59311
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59309
	cmp al,10
	jz LB_59309
	cmp al,32
	jz LB_59309
LB_59311:
	add r14,3
	cmp r14,r10
	jg LB_59316
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59316
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59316
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59316
	jmp LB_59317
LB_59316:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59313
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59313:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59314
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59314:
	jmp LB_59292
LB_59317:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_59319
LB_59318:
	add r14,1
LB_59319:
	cmp r14,r10
	jge LB_59320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59318
	cmp al,10
	jz LB_59318
	cmp al,32
	jz LB_59318
LB_59320:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59321
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59322
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59322:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59323
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59324
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59324:
	jmp LB_59292
LB_59321:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_59327
LB_59326:
	add r14,1
LB_59327:
	cmp r14,r10
	jge LB_59328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59326
	cmp al,10
	jz LB_59326
	cmp al,32
	jz LB_59326
LB_59328:
	push r10
	call NS_E_57569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59329
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59330
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59330:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59331
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59331:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59332
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59332:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59333:
	jmp LB_59292
LB_59329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_59301
	btr r12,4
	jmp LB_59302
LB_59301:
	bts r12,4
LB_59302:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59299
	btr r12,3
	jmp LB_59300
LB_59299:
	bts r12,3
LB_59300:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59297
	btr r12,2
	jmp LB_59298
LB_59297:
	bts r12,2
LB_59298:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59295
	btr r12,1
	jmp LB_59296
LB_59295:
	bts r12,1
LB_59296:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59293
	btr r12,0
	jmp LB_59294
LB_59293:
	bts r12,0
LB_59294:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_59288
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_59342
	btr r12,5
	jmp LB_59343
LB_59342:
	bts r12,5
LB_59343:
	mov r8,r10
	bt r12,4
	jc LB_59344
	btr r12,2
	jmp LB_59345
LB_59344:
	bts r12,2
LB_59345:
	mov r10,r14
	bt r12,1
	jc LB_59346
	btr r12,4
	jmp LB_59347
LB_59346:
	bts r12,4
LB_59347:
	mov r14,r9
	bt r12,3
	jc LB_59348
	btr r12,1
	jmp LB_59349
LB_59348:
	bts r12,1
LB_59349:
	mov r9,r13
	bt r12,0
	jc LB_59350
	btr r12,3
	jmp LB_59351
LB_59350:
	bts r12,3
LB_59351:
	mov r13,r10
	bt r12,4
	jc LB_59352
	btr r12,0
	jmp LB_59353
LB_59352:
	bts r12,0
LB_59353:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_57981 : %_57981
 ; {>  %_57978~0':_p56235 %_57980~2':_p57568 %_57979~1':_p56236 }
; 	» 0xr1 _ ⊢ 3' : %_57981
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f56307 %_57981 ⊢ %_57982 : %_57982
 ; {>  %_57978~0':_p56235 %_57981~3':_r64 %_57980~2':_p57568 %_57979~1':_p56236 }
; _f56307 3' ⊢ °1◂3'
; _some { %_57982 %_57978 %_57979 } ⊢ %_57983 : %_57983
 ; {>  %_57982~°1◂3':_p56244 %_57978~0':_p56235 %_57980~2':_p57568 %_57979~1':_p56236 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_57983
 ; {>  %_57983~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p56244 _p56235 _p56236 }) %_57980~2':_p57568 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_59271
	mov rdi,r8
	call dlt
LB_59271:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_59272
	btr r12,4
	jmp LB_59273
LB_59272:
	bts r12,4
LB_59273:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_59278
	btr r12,2
	jmp LB_59279
LB_59278:
	bts r12,2
LB_59279:
	mov rsi,1
	bt r12,2
	jc LB_59276
	mov rsi,0
	bt r8,0
	jc LB_59276
	jmp LB_59277
LB_59276:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59277:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59274
	btr QWORD [rdi],0
	jmp LB_59275
LB_59274:
	bts QWORD [rdi],0
LB_59275:
	mov r8,r13
	bt r12,0
	jc LB_59282
	btr r12,2
	jmp LB_59283
LB_59282:
	bts r12,2
LB_59283:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59280
	btr QWORD [rdi],1
	jmp LB_59281
LB_59280:
	bts QWORD [rdi],1
LB_59281:
	mov r8,r14
	bt r12,1
	jc LB_59286
	btr r12,2
	jmp LB_59287
LB_59286:
	bts r12,2
LB_59287:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_59284
	btr QWORD [rdi],2
	jmp LB_59285
LB_59284:
	bts QWORD [rdi],2
LB_59285:
	mov r8,0
	bts r12,2
	ret
LB_59288:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59290
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59289
LB_59290:
	add rsp,8
	ret
LB_59292:
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
LB_59291:
	add rsp,80
	pop r14
LB_59289:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_59446
LB_59445:
	add r14,1
LB_59446:
	cmp r14,r10
	jge LB_59447
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59445
	cmp al,10
	jz LB_59445
	cmp al,32
	jz LB_59445
LB_59447:
	add r14,3
	cmp r14,r10
	jg LB_59450
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59450
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_59450
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_59450
	jmp LB_59451
LB_59450:
	jmp LB_59387
LB_59451:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_59402
LB_59401:
	add r14,1
LB_59402:
	cmp r14,r10
	jge LB_59403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59401
	cmp al,10
	jz LB_59401
	cmp al,32
	jz LB_59401
LB_59403:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59404
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59405:
	jmp LB_59388
LB_59404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_59408
LB_59407:
	add r14,1
LB_59408:
	cmp r14,r10
	jge LB_59409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59407
	cmp al,10
	jz LB_59407
	cmp al,32
	jz LB_59407
LB_59409:
	add r14,1
	cmp r14,r10
	jg LB_59414
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_59414
	jmp LB_59415
LB_59414:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59411
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59411:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59412
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59412:
	jmp LB_59388
LB_59415:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_59417
LB_59416:
	add r14,1
LB_59417:
	cmp r14,r10
	jge LB_59418
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59416
	cmp al,10
	jz LB_59416
	cmp al,32
	jz LB_59416
LB_59418:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59419
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59420
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59420:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59421
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59421:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59422
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59422:
	jmp LB_59388
LB_59419:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_59425
LB_59424:
	add r14,1
LB_59425:
	cmp r14,r10
	jge LB_59426
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59424
	cmp al,10
	jz LB_59424
	cmp al,32
	jz LB_59424
LB_59426:
	add r14,3
	cmp r14,r10
	jg LB_59433
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59433
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59433
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59433
	jmp LB_59434
LB_59433:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59428
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59428:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59429
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59429:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59430
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59430:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59431
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59431:
	jmp LB_59388
LB_59434:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_59436
LB_59435:
	add r14,1
LB_59436:
	cmp r14,r10
	jge LB_59437
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59435
	cmp al,10
	jz LB_59435
	cmp al,32
	jz LB_59435
LB_59437:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59438
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_59439
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_59439:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59440
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59440:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59441
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59441:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59442
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59442:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59443
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59443:
	jmp LB_59388
LB_59438:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_59399
	btr r12,5
	jmp LB_59400
LB_59399:
	bts r12,5
LB_59400:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_59397
	btr r12,4
	jmp LB_59398
LB_59397:
	bts r12,4
LB_59398:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59395
	btr r12,3
	jmp LB_59396
LB_59395:
	bts r12,3
LB_59396:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59393
	btr r12,2
	jmp LB_59394
LB_59393:
	bts r12,2
LB_59394:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59391
	btr r12,1
	jmp LB_59392
LB_59391:
	bts r12,1
LB_59392:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59389
	btr r12,0
	jmp LB_59390
LB_59389:
	bts r12,0
LB_59390:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_59384
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_59452
	btr r12,6
	jmp LB_59453
LB_59452:
	bts r12,6
LB_59453:
	mov r8,r11
	bt r12,5
	jc LB_59454
	btr r12,2
	jmp LB_59455
LB_59454:
	bts r12,2
LB_59455:
	mov r11,r14
	bt r12,1
	jc LB_59456
	btr r12,5
	jmp LB_59457
LB_59456:
	bts r12,5
LB_59457:
	mov r14,r9
	bt r12,3
	jc LB_59458
	btr r12,1
	jmp LB_59459
LB_59458:
	bts r12,1
LB_59459:
	mov r9,r13
	bt r12,0
	jc LB_59460
	btr r12,3
	jmp LB_59461
LB_59460:
	bts r12,3
LB_59461:
	mov r13,r11
	bt r12,5
	jc LB_59462
	btr r12,0
	jmp LB_59463
LB_59462:
	bts r12,0
LB_59463:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56308 {  } ⊢ %_57987 : %_57987
 ; {>  %_57985~1':_p56235 %_57986~2':_p56236 %_57984~0':_p56235 }
; _f56308 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_57988 : %_57988
 ; {>  %_57985~1':_p56235 %_57986~2':_p56236 %_57984~0':_p56235 %_57987~°2◂{  }:_p56244 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_57985 %_57988 } ⊢ %_57989 : %_57989
 ; {>  %_57985~1':_p56235 %_57986~2':_p56236 %_57988~°1◂{  }:(_lst)◂(t20444'(0)) %_57984~0':_p56235 %_57987~°2◂{  }:_p56244 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_57984 %_57989 } ⊢ %_57990 : %_57990
 ; {>  %_57989~°0◂{ 1' °1◂{  } }:(_lst)◂(_p56235) %_57986~2':_p56236 %_57984~0':_p56235 %_57987~°2◂{  }:_p56244 }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f56284 %_57990 ⊢ %_57991 : %_57991
 ; {>  %_57990~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p56235) %_57986~2':_p56236 %_57987~°2◂{  }:_p56244 }
; _f56284 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_57987 %_57991 %_57986 } ⊢ %_57992 : %_57992
 ; {>  %_57991~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p56235 %_57986~2':_p56236 %_57987~°2◂{  }:_p56244 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_57992
 ; {>  %_57992~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p56244 _p56235 _p56236 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_59356
	mov rsi,0
	bt r10,0
	jc LB_59356
	jmp LB_59357
LB_59356:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59357:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59354
	btr QWORD [rdi],0
	jmp LB_59355
LB_59354:
	bts QWORD [rdi],0
LB_59355:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_59366
	btr r12,5
	jmp LB_59367
LB_59366:
	bts r12,5
LB_59367:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_59364
	btr QWORD [rdi],0
	jmp LB_59365
LB_59364:
	bts QWORD [rdi],0
LB_59365:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_59374
	btr r12,0
	jmp LB_59375
LB_59374:
	bts r12,0
LB_59375:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_59372
	btr QWORD [rdi],0
	jmp LB_59373
LB_59372:
	bts QWORD [rdi],0
LB_59373:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_59378
	mov rsi,0
	bt r13,0
	jc LB_59378
	jmp LB_59379
LB_59378:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59379:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_59376
	btr QWORD [rdi],1
	jmp LB_59377
LB_59376:
	bts QWORD [rdi],1
LB_59377:
	mov rsi,1
	bt r12,5
	jc LB_59370
	mov rsi,0
	bt r11,0
	jc LB_59370
	jmp LB_59371
LB_59370:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_59371:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_59368
	btr QWORD [rdi],1
	jmp LB_59369
LB_59368:
	bts QWORD [rdi],1
LB_59369:
	mov rsi,1
	bt r12,4
	jc LB_59362
	mov rsi,0
	bt r10,0
	jc LB_59362
	jmp LB_59363
LB_59362:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59363:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_59360
	mov rsi,0
	bt r10,0
	jc LB_59360
	jmp LB_59361
LB_59360:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59361:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59358
	btr QWORD [rdi],1
	jmp LB_59359
LB_59358:
	bts QWORD [rdi],1
LB_59359:
	mov r10,r8
	bt r12,2
	jc LB_59382
	btr r12,4
	jmp LB_59383
LB_59382:
	bts r12,4
LB_59383:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59380
	btr QWORD [rdi],2
	jmp LB_59381
LB_59380:
	bts QWORD [rdi],2
LB_59381:
	mov r8,0
	bts r12,2
	ret
LB_59384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59386
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59385
LB_59386:
	add rsp,8
	ret
LB_59388:
	add rsp,96
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
LB_59387:
	add rsp,96
	pop r14
LB_59385:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_59492
LB_59491:
	add r14,1
LB_59492:
	cmp r14,r10
	jge LB_59493
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59491
	cmp al,10
	jz LB_59491
	cmp al,32
	jz LB_59491
LB_59493:
	add r14,2
	cmp r14,r10
	jg LB_59496
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_59496
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_59496
	jmp LB_59497
LB_59496:
	jmp LB_59479
LB_59497:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_59486
LB_59485:
	add r14,1
LB_59486:
	cmp r14,r10
	jge LB_59487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59485
	cmp al,10
	jz LB_59485
	cmp al,32
	jz LB_59485
LB_59487:
	push r10
	call NS_E_57851_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59488
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59489
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59489:
	jmp LB_59480
LB_59488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59483
	btr r12,1
	jmp LB_59484
LB_59483:
	bts r12,1
LB_59484:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59481
	btr r12,0
	jmp LB_59482
LB_59481:
	bts r12,0
LB_59482:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59476
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_59498
	btr r12,3
	jmp LB_59499
LB_59498:
	bts r12,3
LB_59499:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_59502
	btr r12,4
	jmp LB_59503
LB_59502:
	bts r12,4
LB_59503:
	mov r13,r10
	bt r12,4
	jc LB_59500
	btr r12,0
	jmp LB_59501
LB_59500:
	bts r12,0
LB_59501:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_59506
	btr r12,4
	jmp LB_59507
LB_59506:
	bts r12,4
LB_59507:
	mov r14,r10
	bt r12,4
	jc LB_59504
	btr r12,1
	jmp LB_59505
LB_59504:
	bts r12,1
LB_59505:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_59510
	btr r12,4
	jmp LB_59511
LB_59510:
	bts r12,4
LB_59511:
	mov r8,r10
	bt r12,4
	jc LB_59508
	btr r12,2
	jmp LB_59509
LB_59508:
	bts r12,2
LB_59509:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57993 ⊢ %_57994 : %_57994
 ; {>  %_57993~{ 0' 1' 2' }:{ _p56244 _p56235 _p56236 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_57994
 ; {>  %_57994~°0◂{ 0' 1' 2' }:(_opn)◂({ _p56244 _p56235 _p56236 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_59466
	btr r12,4
	jmp LB_59467
LB_59466:
	bts r12,4
LB_59467:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59464
	btr QWORD [rdi],0
	jmp LB_59465
LB_59464:
	bts QWORD [rdi],0
LB_59465:
	mov r10,r14
	bt r12,1
	jc LB_59470
	btr r12,4
	jmp LB_59471
LB_59470:
	bts r12,4
LB_59471:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59468
	btr QWORD [rdi],1
	jmp LB_59469
LB_59468:
	bts QWORD [rdi],1
LB_59469:
	mov r10,r8
	bt r12,2
	jc LB_59474
	btr r12,4
	jmp LB_59475
LB_59474:
	bts r12,4
LB_59475:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59472
	btr QWORD [rdi],2
	jmp LB_59473
LB_59472:
	bts QWORD [rdi],2
LB_59473:
	mov r8,0
	bts r12,2
	ret
LB_59476:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59478
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59477
LB_59478:
	add rsp,8
	ret
LB_59480:
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
LB_59479:
	add rsp,32
	pop r14
LB_59477:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_59539
LB_59538:
	add r14,1
LB_59539:
	cmp r14,r10
	jge LB_59540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59538
	cmp al,10
	jz LB_59538
	cmp al,32
	jz LB_59538
LB_59540:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59529
LB_59541:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_59544
LB_59543:
	add r14,1
LB_59544:
	cmp r14,r10
	jge LB_59545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59543
	cmp al,10
	jz LB_59543
	cmp al,32
	jz LB_59543
LB_59545:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59546
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59547
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59547:
	jmp LB_59529
LB_59546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_59550
LB_59549:
	add r14,1
LB_59550:
	cmp r14,r10
	jge LB_59551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59549
	cmp al,10
	jz LB_59549
	cmp al,32
	jz LB_59549
LB_59551:
	add r14,3
	cmp r14,r10
	jg LB_59556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59556
	jmp LB_59557
LB_59556:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59553
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59553:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59554
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59554:
	jmp LB_59529
LB_59557:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_59559
LB_59558:
	add r14,1
LB_59559:
	cmp r14,r10
	jge LB_59560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59558
	cmp al,10
	jz LB_59558
	cmp al,32
	jz LB_59558
LB_59560:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59561
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59562
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59562:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59563
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59563:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59564
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59564:
	jmp LB_59529
LB_59561:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59536
	btr r12,3
	jmp LB_59537
LB_59536:
	bts r12,3
LB_59537:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59534
	btr r12,2
	jmp LB_59535
LB_59534:
	bts r12,2
LB_59535:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59532
	btr r12,1
	jmp LB_59533
LB_59532:
	bts r12,1
LB_59533:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59530
	btr r12,0
	jmp LB_59531
LB_59530:
	bts r12,0
LB_59531:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59526
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_59566
	btr r12,4
	jmp LB_59567
LB_59566:
	bts r12,4
LB_59567:
	mov r8,r9
	bt r12,3
	jc LB_59568
	btr r12,2
	jmp LB_59569
LB_59568:
	bts r12,2
LB_59569:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56306 %_57995 ⊢ %_57998 : %_57998
 ; {>  %_57995~0':_p56214 %_57997~2':_p56236 %_57996~1':_p56235 }
; _f56306 0' ⊢ °0◂0'
; _some { %_57998 %_57996 %_57997 } ⊢ %_57999 : %_57999
 ; {>  %_57997~2':_p56236 %_57998~°0◂0':_p56244 %_57996~1':_p56235 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_57999
 ; {>  %_57999~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p56244 _p56235 _p56236 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_59516
	btr r12,4
	jmp LB_59517
LB_59516:
	bts r12,4
LB_59517:
	mov rsi,1
	bt r12,4
	jc LB_59514
	mov rsi,0
	bt r10,0
	jc LB_59514
	jmp LB_59515
LB_59514:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59515:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59512
	btr QWORD [rdi],0
	jmp LB_59513
LB_59512:
	bts QWORD [rdi],0
LB_59513:
	mov r10,r14
	bt r12,1
	jc LB_59520
	btr r12,4
	jmp LB_59521
LB_59520:
	bts r12,4
LB_59521:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59518
	btr QWORD [rdi],1
	jmp LB_59519
LB_59518:
	bts QWORD [rdi],1
LB_59519:
	mov r10,r8
	bt r12,2
	jc LB_59524
	btr r12,4
	jmp LB_59525
LB_59524:
	bts r12,4
LB_59525:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59522
	btr QWORD [rdi],2
	jmp LB_59523
LB_59522:
	bts QWORD [rdi],2
LB_59523:
	mov r8,0
	bts r12,2
	ret
LB_59526:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59528
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59527
LB_59528:
	add rsp,8
	ret
LB_59529:
	add rsp,64
	pop r14
LB_59527:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57851:
NS_E_RDI_57851:
NS_E_57851_ETR_TBL:
NS_E_57851_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "_^"
	jmp LB_59628
LB_59627:
	add r14,1
LB_59628:
	cmp r14,r10
	jge LB_59629
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59627
	cmp al,10
	jz LB_59627
	cmp al,32
	jz LB_59627
LB_59629:
	add r14,2
	cmp r14,r10
	jg LB_59632
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_59632
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_59632
	jmp LB_59633
LB_59632:
	jmp LB_59595
LB_59633:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_59606
LB_59605:
	add r14,1
LB_59606:
	cmp r14,r10
	jge LB_59607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59605
	cmp al,10
	jz LB_59605
	cmp al,32
	jz LB_59605
LB_59607:
	push r10
	call NS_E_57852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59608
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59609
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59609:
	jmp LB_59596
LB_59608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_59615:
	jmp LB_59612
LB_59611:
	add r14,1
LB_59612:
	cmp r14,r10
	jge LB_59613
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59611
	cmp al,10
	jz LB_59611
	cmp al,32
	jz LB_59611
LB_59613:
	push r10
	push rsi
	call NS_E_57853_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_59614
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_59616
	bts QWORD [rax],0
LB_59616:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_59615
LB_59614:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_59618
LB_59617:
	add r14,1
LB_59618:
	cmp r14,r10
	jge LB_59619
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59617
	cmp al,10
	jz LB_59617
	cmp al,32
	jz LB_59617
LB_59619:
	add r14,2
	cmp r14,r10
	jg LB_59625
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_59625
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_59625
	jmp LB_59626
LB_59625:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59621
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59621:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59622
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59622:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59623
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59623:
	jmp LB_59596
LB_59626:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59603
	btr r12,3
	jmp LB_59604
LB_59603:
	bts r12,3
LB_59604:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59601
	btr r12,2
	jmp LB_59602
LB_59601:
	bts r12,2
LB_59602:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59599
	btr r12,1
	jmp LB_59600
LB_59599:
	bts r12,1
LB_59600:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59597
	btr r12,0
	jmp LB_59598
LB_59597:
	bts r12,0
LB_59598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59592
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_59634
	btr r12,4
	jmp LB_59635
LB_59634:
	bts r12,4
LB_59635:
	mov r9,r8
	bt r12,2
	jc LB_59636
	btr r12,3
	jmp LB_59637
LB_59636:
	bts r12,3
LB_59637:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_59638
	btr r12,4
	jmp LB_59639
LB_59638:
	bts r12,4
LB_59639:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_59642
	btr r12,5
	jmp LB_59643
LB_59642:
	bts r12,5
LB_59643:
	mov r13,r11
	bt r12,5
	jc LB_59640
	btr r12,0
	jmp LB_59641
LB_59640:
	bts r12,0
LB_59641:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_59646
	btr r12,5
	jmp LB_59647
LB_59646:
	bts r12,5
LB_59647:
	mov r14,r11
	bt r12,5
	jc LB_59644
	btr r12,1
	jmp LB_59645
LB_59644:
	bts r12,1
LB_59645:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_59650
	btr r12,5
	jmp LB_59651
LB_59650:
	bts r12,5
LB_59651:
	mov r8,r11
	bt r12,5
	jc LB_59648
	btr r12,2
	jmp LB_59649
LB_59648:
	bts r12,2
LB_59649:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56310 { %_58000 %_58003 } ⊢ %_58004 : %_58004
 ; {>  %_58003~3':(_lst)◂(_p56245) %_58000~0':_r64 %_58001~1':_p56235 %_58002~2':_p56236 }
; _f56310 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_58004 %_58001 %_58002 } ⊢ %_58005 : %_58005
 ; {>  %_58004~°4◂{ 0' 3' }:_p56244 %_58001~1':_p56235 %_58002~2':_p56236 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_58005
 ; {>  %_58005~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p56244 _p56235 _p56236 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_59570
	btr r12,4
	jmp LB_59571
LB_59570:
	bts r12,4
LB_59571:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_59578
	btr r12,6
	jmp LB_59579
LB_59578:
	bts r12,6
LB_59579:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_59576
	btr QWORD [rdi],0
	jmp LB_59577
LB_59576:
	bts QWORD [rdi],0
LB_59577:
	mov rcx,r10
	bt r12,4
	jc LB_59582
	btr r12,6
	jmp LB_59583
LB_59582:
	bts r12,6
LB_59583:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_59580
	btr QWORD [rdi],1
	jmp LB_59581
LB_59580:
	bts QWORD [rdi],1
LB_59581:
	mov rsi,1
	bt r12,5
	jc LB_59574
	mov rsi,0
	bt r11,0
	jc LB_59574
	jmp LB_59575
LB_59574:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_59575:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_59572
	btr QWORD [rdi],0
	jmp LB_59573
LB_59572:
	bts QWORD [rdi],0
LB_59573:
	mov r11,r14
	bt r12,1
	jc LB_59586
	btr r12,5
	jmp LB_59587
LB_59586:
	bts r12,5
LB_59587:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_59584
	btr QWORD [rdi],1
	jmp LB_59585
LB_59584:
	bts QWORD [rdi],1
LB_59585:
	mov r11,r8
	bt r12,2
	jc LB_59590
	btr r12,5
	jmp LB_59591
LB_59590:
	bts r12,5
LB_59591:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_59588
	btr QWORD [rdi],2
	jmp LB_59589
LB_59588:
	bts QWORD [rdi],2
LB_59589:
	mov r8,0
	bts r12,2
	ret
LB_59592:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59594
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59593
LB_59594:
	add rsp,8
	ret
LB_59596:
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
LB_59595:
	add rsp,64
	pop r14
LB_59593:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_59681
LB_59680:
	add r14,1
LB_59681:
	cmp r14,r10
	jge LB_59682
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59680
	cmp al,10
	jz LB_59680
	cmp al,32
	jz LB_59680
LB_59682:
	push r10
	call NS_E_57174_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59683
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59671
LB_59683:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_59686
LB_59685:
	add r14,1
LB_59686:
	cmp r14,r10
	jge LB_59687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59685
	cmp al,10
	jz LB_59685
	cmp al,32
	jz LB_59685
LB_59687:
	add r14,1
	cmp r14,r10
	jg LB_59691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_59691
	jmp LB_59692
LB_59691:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59689
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59689:
	jmp LB_59671
LB_59692:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_59694
LB_59693:
	add r14,1
LB_59694:
	cmp r14,r10
	jge LB_59695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59693
	cmp al,10
	jz LB_59693
	cmp al,32
	jz LB_59693
LB_59695:
	add r14,3
	cmp r14,r10
	jg LB_59700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59700
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59700
	jmp LB_59701
LB_59700:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59697
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59697:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59698:
	jmp LB_59671
LB_59701:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_59703
LB_59702:
	add r14,1
LB_59703:
	cmp r14,r10
	jge LB_59704
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59702
	cmp al,10
	jz LB_59702
	cmp al,32
	jz LB_59702
LB_59704:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59705
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59706
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59706:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59708:
	jmp LB_59671
LB_59705:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59678
	btr r12,3
	jmp LB_59679
LB_59678:
	bts r12,3
LB_59679:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59676
	btr r12,2
	jmp LB_59677
LB_59676:
	bts r12,2
LB_59677:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59674
	btr r12,1
	jmp LB_59675
LB_59674:
	bts r12,1
LB_59675:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59672
	btr r12,0
	jmp LB_59673
LB_59672:
	bts r12,0
LB_59673:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59668
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_59710
	btr r12,4
	jmp LB_59711
LB_59710:
	bts r12,4
LB_59711:
	mov r14,r9
	bt r12,3
	jc LB_59712
	btr r12,1
	jmp LB_59713
LB_59712:
	bts r12,1
LB_59713:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56309 %_58006 ⊢ %_58008 : %_58008
 ; {>  %_58006~0':_p56238 %_58007~1':_p56236 }
; _f56309 0' ⊢ °3◂0'
; _nil {  } ⊢ %_58009 : %_58009
 ; {>  %_58008~°3◂0':_p56244 %_58007~1':_p56236 }
; _nil {  } ⊢ °1◂{  }
; _f56284 %_58009 ⊢ %_58010 : %_58010
 ; {>  %_58009~°1◂{  }:(_lst)◂(t20473'(0)) %_58008~°3◂0':_p56244 %_58007~1':_p56236 }
; _f56284 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_58008 %_58010 %_58007 } ⊢ %_58011 : %_58011
 ; {>  %_58010~°0◂°1◂{  }:_p56235 %_58008~°3◂0':_p56244 %_58007~1':_p56236 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_58011
 ; {>  %_58011~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p56244 _p56235 _p56236 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_59656
	btr r12,2
	jmp LB_59657
LB_59656:
	bts r12,2
LB_59657:
	mov rsi,1
	bt r12,2
	jc LB_59654
	mov rsi,0
	bt r8,0
	jc LB_59654
	jmp LB_59655
LB_59654:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59655:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59652
	btr QWORD [rdi],0
	jmp LB_59653
LB_59652:
	bts QWORD [rdi],0
LB_59653:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_59662
	mov rsi,0
	bt r8,0
	jc LB_59662
	jmp LB_59663
LB_59662:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59663:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_59660
	mov rsi,0
	bt r8,0
	jc LB_59660
	jmp LB_59661
LB_59660:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59661:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59658
	btr QWORD [rdi],1
	jmp LB_59659
LB_59658:
	bts QWORD [rdi],1
LB_59659:
	mov r8,r14
	bt r12,1
	jc LB_59666
	btr r12,2
	jmp LB_59667
LB_59666:
	bts r12,2
LB_59667:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_59664
	btr QWORD [rdi],2
	jmp LB_59665
LB_59664:
	bts QWORD [rdi],2
LB_59665:
	mov r8,0
	bts r12,2
	ret
LB_59668:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59670
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59669
LB_59670:
	add rsp,8
	ret
LB_59671:
	add rsp,64
	pop r14
LB_59669:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57852:
NS_E_RDI_57852:
NS_E_57852_ETR_TBL:
NS_E_57852_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "_"
	jmp LB_59767
LB_59766:
	add r14,1
LB_59767:
	cmp r14,r10
	jge LB_59768
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59766
	cmp al,10
	jz LB_59766
	cmp al,32
	jz LB_59766
LB_59768:
	add r14,1
	cmp r14,r10
	jg LB_59771
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_59771
	jmp LB_59772
LB_59771:
	jmp LB_59743
LB_59772:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_59752
LB_59751:
	add r14,1
LB_59752:
	cmp r14,r10
	jge LB_59753
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59751
	cmp al,10
	jz LB_59751
	cmp al,32
	jz LB_59751
LB_59753:
	add r14,3
	cmp r14,r10
	jg LB_59757
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59757
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59757
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59757
	jmp LB_59758
LB_59757:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59755:
	jmp LB_59744
LB_59758:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_59760
LB_59759:
	add r14,1
LB_59760:
	cmp r14,r10
	jge LB_59761
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59759
	cmp al,10
	jz LB_59759
	cmp al,32
	jz LB_59759
LB_59761:
	push r10
	call NS_E_57571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59762
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59763
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59763:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59764
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59764:
	jmp LB_59744
LB_59762:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59749
	btr r12,2
	jmp LB_59750
LB_59749:
	bts r12,2
LB_59750:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59747
	btr r12,1
	jmp LB_59748
LB_59747:
	bts r12,1
LB_59748:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59745
	btr r12,0
	jmp LB_59746
LB_59745:
	bts r12,0
LB_59746:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_59740
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_59773
	btr r12,3
	jmp LB_59774
LB_59773:
	bts r12,3
LB_59774:
	mov r13,r8
	bt r12,2
	jc LB_59775
	btr r12,0
	jmp LB_59776
LB_59775:
	bts r12,0
LB_59776:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_58013 : %_58013
 ; {>  %_58012~0':_p56234 }
; 	» 0xr0 _ ⊢ 1' : %_58013
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_58014 : %_58014
 ; {>  %_58012~0':_p56234 %_58013~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f56284 %_58014 ⊢ %_58015 : %_58015
 ; {>  %_58012~0':_p56234 %_58013~1':_r64 %_58014~°1◂{  }:(_lst)◂(t20481'(0)) }
; _f56284 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_58016 : %_58016
 ; {>  %_58012~0':_p56234 %_58013~1':_r64 %_58015~°0◂°1◂{  }:_p56235 }
; _nil {  } ⊢ °1◂{  }
; _f56287 %_58012 ⊢ %_58017 : %_58017
 ; {>  %_58016~°1◂{  }:(_lst)◂(t20485'(0)) %_58012~0':_p56234 %_58013~1':_r64 %_58015~°0◂°1◂{  }:_p56235 }
; _f56287 0' ⊢ °1◂0'
; _cns { %_58017 %_58016 } ⊢ %_58018 : %_58018
 ; {>  %_58016~°1◂{  }:(_lst)◂(t20485'(0)) %_58013~1':_r64 %_58017~°1◂0':_p56236 %_58015~°0◂°1◂{  }:_p56235 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f56286 %_58018 ⊢ %_58019 : %_58019
 ; {>  %_58018~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p56236) %_58013~1':_r64 %_58015~°0◂°1◂{  }:_p56235 }
; _f56286 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_58013 %_58015 %_58019 } ⊢ %_58020 : %_58020
 ; {>  %_58013~1':_r64 %_58019~°0◂°0◂{ °1◂0' °1◂{  } }:_p56236 %_58015~°0◂°1◂{  }:_p56235 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_58020
 ; {>  %_58020~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p56235 _p56236 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_59716
	btr r12,2
	jmp LB_59717
LB_59716:
	bts r12,2
LB_59717:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59714
	btr QWORD [rdi],0
	jmp LB_59715
LB_59714:
	bts QWORD [rdi],0
LB_59715:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_59722
	mov rsi,0
	bt r8,0
	jc LB_59722
	jmp LB_59723
LB_59722:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59723:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_59720
	mov rsi,0
	bt r8,0
	jc LB_59720
	jmp LB_59721
LB_59720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59721:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59718
	btr QWORD [rdi],1
	jmp LB_59719
LB_59718:
	bts QWORD [rdi],1
LB_59719:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_59734
	btr r12,1
	jmp LB_59735
LB_59734:
	bts r12,1
LB_59735:
	mov rsi,1
	bt r12,1
	jc LB_59732
	mov rsi,0
	bt r14,0
	jc LB_59732
	jmp LB_59733
LB_59732:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59733:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59730
	btr QWORD [rdi],0
	jmp LB_59731
LB_59730:
	bts QWORD [rdi],0
LB_59731:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59738
	mov rsi,0
	bt r14,0
	jc LB_59738
	jmp LB_59739
LB_59738:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59739:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59736
	btr QWORD [rdi],1
	jmp LB_59737
LB_59736:
	bts QWORD [rdi],1
LB_59737:
	mov rsi,1
	bt r12,2
	jc LB_59728
	mov rsi,0
	bt r8,0
	jc LB_59728
	jmp LB_59729
LB_59728:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59729:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_59726
	mov rsi,0
	bt r8,0
	jc LB_59726
	jmp LB_59727
LB_59726:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59727:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_59724
	btr QWORD [rdi],2
	jmp LB_59725
LB_59724:
	bts QWORD [rdi],2
LB_59725:
	mov r8,0
	bts r12,2
	ret
LB_59740:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59742
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59741
LB_59742:
	add rsp,8
	ret
LB_59744:
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
LB_59743:
	add rsp,48
	pop r14
LB_59741:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src
	jmp LB_59830
LB_59829:
	add r14,1
LB_59830:
	cmp r14,r10
	jge LB_59831
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59829
	cmp al,10
	jz LB_59829
	cmp al,32
	jz LB_59829
LB_59831:
	push r10
	call NS_E_57306_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59832
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59818
LB_59832:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_59835
LB_59834:
	add r14,1
LB_59835:
	cmp r14,r10
	jge LB_59836
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59834
	cmp al,10
	jz LB_59834
	cmp al,32
	jz LB_59834
LB_59836:
	push r10
	call NS_E_57305_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59837
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59838
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59838:
	jmp LB_59818
LB_59837:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_59841
LB_59840:
	add r14,1
LB_59841:
	cmp r14,r10
	jge LB_59842
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59840
	cmp al,10
	jz LB_59840
	cmp al,32
	jz LB_59840
LB_59842:
	add r14,3
	cmp r14,r10
	jg LB_59847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59847
	jmp LB_59848
LB_59847:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59844
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59844:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59845
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59845:
	jmp LB_59818
LB_59848:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_59850
LB_59849:
	add r14,1
LB_59850:
	cmp r14,r10
	jge LB_59851
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59849
	cmp al,10
	jz LB_59849
	cmp al,32
	jz LB_59849
LB_59851:
	push r10
	call NS_E_57571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59852
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59853
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59853:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59854
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59854:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59855
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59855:
	jmp LB_59818
LB_59852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_59858
LB_59857:
	add r14,1
LB_59858:
	cmp r14,r10
	jge LB_59859
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59857
	cmp al,10
	jz LB_59857
	cmp al,32
	jz LB_59857
LB_59859:
	push r10
	call NS_E_57570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59860
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59861
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59861:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59862
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59862:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59863
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59863:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59864
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59864:
	jmp LB_59818
LB_59860:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_59827
	btr r12,4
	jmp LB_59828
LB_59827:
	bts r12,4
LB_59828:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59825
	btr r12,3
	jmp LB_59826
LB_59825:
	bts r12,3
LB_59826:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59823
	btr r12,2
	jmp LB_59824
LB_59823:
	bts r12,2
LB_59824:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59821
	btr r12,1
	jmp LB_59822
LB_59821:
	bts r12,1
LB_59822:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59819
	btr r12,0
	jmp LB_59820
LB_59819:
	bts r12,0
LB_59820:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_59815
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_59866
	btr r12,5
	jmp LB_59867
LB_59866:
	bts r12,5
LB_59867:
	mov r9,r10
	bt r12,4
	jc LB_59868
	btr r12,3
	jmp LB_59869
LB_59868:
	bts r12,3
LB_59869:
	mov r10,r8
	bt r12,2
	jc LB_59870
	btr r12,4
	jmp LB_59871
LB_59870:
	bts r12,4
LB_59871:
	mov r8,r11
	bt r12,5
	jc LB_59872
	btr r12,2
	jmp LB_59873
LB_59872:
	bts r12,2
LB_59873:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56285 %_58021 ⊢ %_58025 : %_58025
 ; {>  %_58023~2':_p56234 %_58022~1':(_lst)◂(_p56235) %_58021~0':_p56233 %_58024~3':(_lst)◂(_p56236) }
; _f56285 0' ⊢ °1◂0'
; _f56287 %_58023 ⊢ %_58026 : %_58026
 ; {>  %_58023~2':_p56234 %_58022~1':(_lst)◂(_p56235) %_58025~°1◂0':_p56235 %_58024~3':(_lst)◂(_p56236) }
; _f56287 2' ⊢ °1◂2'
; _cns { %_58025 %_58022 } ⊢ %_58027 : %_58027
 ; {>  %_58022~1':(_lst)◂(_p56235) %_58026~°1◂2':_p56236 %_58025~°1◂0':_p56235 %_58024~3':(_lst)◂(_p56236) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_58026 %_58024 } ⊢ %_58028 : %_58028
 ; {>  %_58027~°0◂{ °1◂0' 1' }:(_lst)◂(_p56235) %_58026~°1◂2':_p56236 %_58024~3':(_lst)◂(_p56236) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f56284 %_58027 ⊢ %_58029 : %_58029
 ; {>  %_58027~°0◂{ °1◂0' 1' }:(_lst)◂(_p56235) %_58028~°0◂{ °1◂2' 3' }:(_lst)◂(_p56236) }
; _f56284 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f56286 %_58028 ⊢ %_58030 : %_58030
 ; {>  %_58029~°0◂°0◂{ °1◂0' 1' }:_p56235 %_58028~°0◂{ °1◂2' 3' }:(_lst)◂(_p56236) }
; _f56286 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_58031 : %_58031
 ; {>  %_58030~°0◂°0◂{ °1◂2' 3' }:_p56236 %_58029~°0◂°0◂{ °1◂0' 1' }:_p56235 }
; 	» 0xr1 _ ⊢ 4' : %_58031
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_58031 %_58029 %_58030 } ⊢ %_58032 : %_58032
 ; {>  %_58030~°0◂°0◂{ °1◂2' 3' }:_p56236 %_58031~4':_r64 %_58029~°0◂°0◂{ °1◂0' 1' }:_p56235 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_58032
 ; {>  %_58032~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p56235 _p56236 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_59777
	btr r12,5
	jmp LB_59778
LB_59777:
	bts r12,5
LB_59778:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_59781
	btr r12,6
	jmp LB_59782
LB_59781:
	bts r12,6
LB_59782:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_59779
	btr QWORD [rdi],0
	jmp LB_59780
LB_59779:
	bts QWORD [rdi],0
LB_59780:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_59793
	btr r12,4
	jmp LB_59794
LB_59793:
	bts r12,4
LB_59794:
	mov rsi,1
	bt r12,4
	jc LB_59791
	mov rsi,0
	bt r10,0
	jc LB_59791
	jmp LB_59792
LB_59791:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59792:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59789
	btr QWORD [rdi],0
	jmp LB_59790
LB_59789:
	bts QWORD [rdi],0
LB_59790:
	mov r10,r14
	bt r12,1
	jc LB_59797
	btr r12,4
	jmp LB_59798
LB_59797:
	bts r12,4
LB_59798:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59795
	btr QWORD [rdi],1
	jmp LB_59796
LB_59795:
	bts QWORD [rdi],1
LB_59796:
	mov rsi,1
	bt r12,6
	jc LB_59787
	mov rsi,0
	bt rcx,0
	jc LB_59787
	jmp LB_59788
LB_59787:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59788:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_59785
	mov rsi,0
	bt rcx,0
	jc LB_59785
	jmp LB_59786
LB_59785:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59786:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_59783
	btr QWORD [rdi],1
	jmp LB_59784
LB_59783:
	bts QWORD [rdi],1
LB_59784:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_59809
	btr r12,0
	jmp LB_59810
LB_59809:
	bts r12,0
LB_59810:
	mov rsi,1
	bt r12,0
	jc LB_59807
	mov rsi,0
	bt r13,0
	jc LB_59807
	jmp LB_59808
LB_59807:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59808:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_59805
	btr QWORD [rdi],0
	jmp LB_59806
LB_59805:
	bts QWORD [rdi],0
LB_59806:
	mov r13,r11
	bt r12,5
	jc LB_59813
	btr r12,0
	jmp LB_59814
LB_59813:
	bts r12,0
LB_59814:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_59811
	btr QWORD [rdi],1
	jmp LB_59812
LB_59811:
	bts QWORD [rdi],1
LB_59812:
	mov rsi,1
	bt r12,6
	jc LB_59803
	mov rsi,0
	bt rcx,0
	jc LB_59803
	jmp LB_59804
LB_59803:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59804:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_59801
	mov rsi,0
	bt rcx,0
	jc LB_59801
	jmp LB_59802
LB_59801:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59802:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_59799
	btr QWORD [rdi],2
	jmp LB_59800
LB_59799:
	bts QWORD [rdi],2
LB_59800:
	mov r8,0
	bts r12,2
	ret
LB_59815:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59817
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59816
LB_59817:
	add rsp,8
	ret
LB_59818:
	add rsp,80
	pop r14
LB_59816:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57853:
NS_E_RDI_57853:
NS_E_57853_ETR_TBL:
NS_E_57853_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_59885
LB_59884:
	add r14,1
LB_59885:
	cmp r14,r10
	jge LB_59886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59884
	cmp al,10
	jz LB_59884
	cmp al,32
	jz LB_59884
LB_59886:
	push r10
	call NS_E_57855_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59887
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59881
LB_59887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59882
	btr r12,0
	jmp LB_59883
LB_59882:
	bts r12,0
LB_59883:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59878
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56311 %_58033 ⊢ %_58034 : %_58034
 ; {>  %_58033~0':_stg }
; _f56311 0' ⊢ °0◂0'
; _some %_58034 ⊢ %_58035 : %_58035
 ; {>  %_58034~°0◂0':_p56245 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58035
 ; {>  %_58035~°0◂°0◂0':(_opn)◂(_p56245) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59876
	btr r12,3
	jmp LB_59877
LB_59876:
	bts r12,3
LB_59877:
	mov rsi,1
	bt r12,3
	jc LB_59874
	mov rsi,0
	bt r9,0
	jc LB_59874
	jmp LB_59875
LB_59874:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59875:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59878:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59880
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59879
LB_59880:
	add rsp,8
	ret
LB_59881:
	add rsp,16
	pop r14
LB_59879:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_59900
LB_59899:
	add r14,1
LB_59900:
	cmp r14,r10
	jge LB_59901
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59899
	cmp al,10
	jz LB_59899
	cmp al,32
	jz LB_59899
LB_59901:
	push r10
	call NS_E_55659_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59902
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59896
LB_59902:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59897
	btr r12,0
	jmp LB_59898
LB_59897:
	bts r12,0
LB_59898:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59893
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56311 %_58036 ⊢ %_58037 : %_58037
 ; {>  %_58036~0':_stg }
; _f56311 0' ⊢ °0◂0'
; _some %_58037 ⊢ %_58038 : %_58038
 ; {>  %_58037~°0◂0':_p56245 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58038
 ; {>  %_58038~°0◂°0◂0':(_opn)◂(_p56245) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59891
	btr r12,3
	jmp LB_59892
LB_59891:
	bts r12,3
LB_59892:
	mov rsi,1
	bt r12,3
	jc LB_59889
	mov rsi,0
	bt r9,0
	jc LB_59889
	jmp LB_59890
LB_59889:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59890:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59893:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59895
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59894
LB_59895:
	add rsp,8
	ret
LB_59896:
	add rsp,16
	pop r14
LB_59894:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_59915
LB_59914:
	add r14,1
LB_59915:
	cmp r14,r10
	jge LB_59916
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59914
	cmp al,10
	jz LB_59914
	cmp al,32
	jz LB_59914
LB_59916:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59917
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59911
LB_59917:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59912
	btr r12,0
	jmp LB_59913
LB_59912:
	bts r12,0
LB_59913:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59908
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56312 %_58039 ⊢ %_58040 : %_58040
 ; {>  %_58039~0':_p56214 }
; _f56312 0' ⊢ °1◂0'
; _some %_58040 ⊢ %_58041 : %_58041
 ; {>  %_58040~°1◂0':_p56245 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_58041
 ; {>  %_58041~°0◂°1◂0':(_opn)◂(_p56245) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59906
	btr r12,3
	jmp LB_59907
LB_59906:
	bts r12,3
LB_59907:
	mov rsi,1
	bt r12,3
	jc LB_59904
	mov rsi,0
	bt r9,0
	jc LB_59904
	jmp LB_59905
LB_59904:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59905:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59908:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59910
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59909
LB_59910:
	add rsp,8
	ret
LB_59911:
	add rsp,16
	pop r14
LB_59909:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_59936
LB_59935:
	add r14,1
LB_59936:
	cmp r14,r10
	jge LB_59937
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59935
	cmp al,10
	jz LB_59935
	cmp al,32
	jz LB_59935
LB_59937:
	push r10
	call NS_E_57854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59938
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59932
LB_59938:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59933
	btr r12,0
	jmp LB_59934
LB_59933:
	bts r12,0
LB_59934:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59929
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_59940
	btr r12,2
	jmp LB_59941
LB_59940:
	bts r12,2
LB_59941:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_59944
	btr r12,3
	jmp LB_59945
LB_59944:
	bts r12,3
LB_59945:
	mov r13,r9
	bt r12,3
	jc LB_59942
	btr r12,0
	jmp LB_59943
LB_59942:
	bts r12,0
LB_59943:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_59948
	btr r12,3
	jmp LB_59949
LB_59948:
	bts r12,3
LB_59949:
	mov r14,r9
	bt r12,3
	jc LB_59946
	btr r12,1
	jmp LB_59947
LB_59946:
	bts r12,1
LB_59947:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56313 %_58042 ⊢ %_58043 : %_58043
 ; {>  %_58042~{ 0' 1' }:{ _p56246 _r64 } }
; _f56313 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_58043 ⊢ %_58044 : %_58044
 ; {>  %_58043~°2◂{ 0' 1' }:_p56245 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_58044
 ; {>  %_58044~°0◂°2◂{ 0' 1' }:(_opn)◂(_p56245) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_59923
	btr r12,2
	jmp LB_59924
LB_59923:
	bts r12,2
LB_59924:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59921
	btr QWORD [rdi],0
	jmp LB_59922
LB_59921:
	bts QWORD [rdi],0
LB_59922:
	mov r8,r14
	bt r12,1
	jc LB_59927
	btr r12,2
	jmp LB_59928
LB_59927:
	bts r12,2
LB_59928:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59925
	btr QWORD [rdi],1
	jmp LB_59926
LB_59925:
	bts QWORD [rdi],1
LB_59926:
	mov rsi,1
	bt r12,3
	jc LB_59919
	mov rsi,0
	bt r9,0
	jc LB_59919
	jmp LB_59920
LB_59919:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59920:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59929:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59931
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59930
LB_59931:
	add rsp,8
	ret
LB_59932:
	add rsp,16
	pop r14
LB_59930:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57854:
NS_E_RDI_57854:
NS_E_57854_ETR_TBL:
NS_E_57854_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_55538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59969
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59961
LB_59969:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_59977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_59977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_59977
	jmp LB_59978
LB_59977:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59975
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59975:
	jmp LB_59961
LB_59978:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59964
	btr r12,1
	jmp LB_59965
LB_59964:
	bts r12,1
LB_59965:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59962
	btr r12,0
	jmp LB_59963
LB_59962:
	bts r12,0
LB_59963:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59958
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56315 {  } ⊢ %_58046 : %_58046
 ; {>  %_58045~0':_r64 }
; _f56315 {  } ⊢ °1◂{  }
; _some { %_58046 %_58045 } ⊢ %_58047 : %_58047
 ; {>  %_58045~0':_r64 %_58046~°1◂{  }:_p56246 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_58047
 ; {>  %_58047~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p56246 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59952
	mov rsi,0
	bt r14,0
	jc LB_59952
	jmp LB_59953
LB_59952:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59953:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59950
	btr QWORD [rdi],0
	jmp LB_59951
LB_59950:
	bts QWORD [rdi],0
LB_59951:
	mov r14,r13
	bt r12,0
	jc LB_59956
	btr r12,1
	jmp LB_59957
LB_59956:
	bts r12,1
LB_59957:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59954
	btr QWORD [rdi],1
	jmp LB_59955
LB_59954:
	bts QWORD [rdi],1
LB_59955:
	mov r8,0
	bts r12,2
	ret
LB_59958:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59960
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59959
LB_59960:
	add rsp,8
	ret
LB_59961:
	add rsp,32
	pop r14
LB_59959:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_55538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59998
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59990
LB_59998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_60006
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_60006
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_60006
	jmp LB_60007
LB_60006:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60004:
	jmp LB_59990
LB_60007:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59993
	btr r12,1
	jmp LB_59994
LB_59993:
	bts r12,1
LB_59994:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59991
	btr r12,0
	jmp LB_59992
LB_59991:
	bts r12,0
LB_59992:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59987
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56316 {  } ⊢ %_58049 : %_58049
 ; {>  %_58048~0':_r64 }
; _f56316 {  } ⊢ °2◂{  }
; _some { %_58049 %_58048 } ⊢ %_58050 : %_58050
 ; {>  %_58049~°2◂{  }:_p56246 %_58048~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_58050
 ; {>  %_58050~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p56246 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59981
	mov rsi,0
	bt r14,0
	jc LB_59981
	jmp LB_59982
LB_59981:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59982:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59979
	btr QWORD [rdi],0
	jmp LB_59980
LB_59979:
	bts QWORD [rdi],0
LB_59980:
	mov r14,r13
	bt r12,0
	jc LB_59985
	btr r12,1
	jmp LB_59986
LB_59985:
	bts r12,1
LB_59986:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59983
	btr QWORD [rdi],1
	jmp LB_59984
LB_59983:
	bts QWORD [rdi],1
LB_59984:
	mov r8,0
	bts r12,2
	ret
LB_59987:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59989
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59988
LB_59989:
	add rsp,8
	ret
LB_59990:
	add rsp,32
	pop r14
LB_59988:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_55538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60027
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60019
LB_60027:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_60035
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_60035
	jmp LB_60036
LB_60035:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60033
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60033:
	jmp LB_60019
LB_60036:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60022
	btr r12,1
	jmp LB_60023
LB_60022:
	bts r12,1
LB_60023:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60020
	btr r12,0
	jmp LB_60021
LB_60020:
	bts r12,0
LB_60021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60016
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56314 {  } ⊢ %_58052 : %_58052
 ; {>  %_58051~0':_r64 }
; _f56314 {  } ⊢ °0◂{  }
; _some { %_58052 %_58051 } ⊢ %_58053 : %_58053
 ; {>  %_58052~°0◂{  }:_p56246 %_58051~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_58053
 ; {>  %_58053~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p56246 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_60010
	mov rsi,0
	bt r14,0
	jc LB_60010
	jmp LB_60011
LB_60010:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_60011:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_60008
	btr QWORD [rdi],0
	jmp LB_60009
LB_60008:
	bts QWORD [rdi],0
LB_60009:
	mov r14,r13
	bt r12,0
	jc LB_60014
	btr r12,1
	jmp LB_60015
LB_60014:
	bts r12,1
LB_60015:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_60012
	btr QWORD [rdi],1
	jmp LB_60013
LB_60012:
	bts QWORD [rdi],1
LB_60013:
	mov r8,0
	bts r12,2
	ret
LB_60016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60018
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60017
LB_60018:
	add rsp,8
	ret
LB_60019:
	add rsp,32
	pop r14
LB_60017:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57855:
NS_E_RDI_57855:
NS_E_57855_ETR_TBL:
NS_E_57855_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_60052
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_60052
	jmp LB_60053
LB_60052:
	jmp LB_60042
LB_60053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_57856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60057
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60058
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60058:
	jmp LB_60042
LB_60057:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60045
	btr r12,1
	jmp LB_60046
LB_60045:
	bts r12,1
LB_60046:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60043
	btr r12,0
	jmp LB_60044
LB_60043:
	bts r12,0
LB_60044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60039
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_60060
	btr r12,2
	jmp LB_60061
LB_60060:
	bts r12,2
LB_60061:
	mov r13,r14
	bt r12,1
	jc LB_60062
	btr r12,0
	jmp LB_60063
LB_60062:
	bts r12,0
LB_60063:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55649 %_58054 ⊢ %_58055 : %_58055
 ; {>  %_58054~0':(_lst)◂(_r64) }
; _f55649 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_55649
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_58055 ⊢ %_58056 : %_58056
 ; {>  %_58055~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_58056
 ; {>  %_58056~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60037
	btr r12,3
	jmp LB_60038
LB_60037:
	bts r12,3
LB_60038:
	mov r8,0
	bts r12,2
	ret
LB_60039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60041
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60040
LB_60041:
	add rsp,8
	ret
LB_60042:
	add rsp,32
	pop r14
LB_60040:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57856:
NS_E_RDI_57856:
NS_E_57856_ETR_TBL:
NS_E_57856_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_60085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_60085
	jmp LB_60086
LB_60085:
	jmp LB_60077
LB_60086:
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
	jc LB_60078
	btr r12,0
	jmp LB_60079
LB_60078:
	bts r12,0
LB_60079:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60074
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_58057 : %_58057
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_58057
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_58058 : %_58058
 ; {>  %_58057~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_58057 %_58058 } ⊢ %_58059 : %_58059
 ; {>  %_58058~°1◂{  }:(_lst)◂(t20542'(0)) %_58057~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_58059 ⊢ %_58060 : %_58060
 ; {>  %_58059~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_58060
 ; {>  %_58060~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_60068
	btr r12,1
	jmp LB_60069
LB_60068:
	bts r12,1
LB_60069:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_60066
	btr QWORD [rdi],0
	jmp LB_60067
LB_60066:
	bts QWORD [rdi],0
LB_60067:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_60072
	mov rsi,0
	bt r14,0
	jc LB_60072
	jmp LB_60073
LB_60072:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_60073:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_60070
	btr QWORD [rdi],1
	jmp LB_60071
LB_60070:
	bts QWORD [rdi],1
LB_60071:
	mov rsi,1
	bt r12,3
	jc LB_60064
	mov rsi,0
	bt r9,0
	jc LB_60064
	jmp LB_60065
LB_60064:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60065:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60074:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60076
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60075
LB_60076:
	add rsp,8
	ret
LB_60077:
	add rsp,16
	pop r14
LB_60075:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_55536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60108
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60100
LB_60108:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_57856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60113
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60114:
	jmp LB_60100
LB_60113:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60103
	btr r12,1
	jmp LB_60104
LB_60103:
	bts r12,1
LB_60104:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60101
	btr r12,0
	jmp LB_60102
LB_60101:
	bts r12,0
LB_60102:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60097
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_58061 %_58062 } ⊢ %_58063 : %_58063
 ; {>  %_58062~1':(_lst)◂(_r64) %_58061~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_58063 ⊢ %_58064 : %_58064
 ; {>  %_58063~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_58064
 ; {>  %_58064~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_60091
	btr r12,2
	jmp LB_60092
LB_60091:
	bts r12,2
LB_60092:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60089
	btr QWORD [rdi],0
	jmp LB_60090
LB_60089:
	bts QWORD [rdi],0
LB_60090:
	mov r8,r14
	bt r12,1
	jc LB_60095
	btr r12,2
	jmp LB_60096
LB_60095:
	bts r12,2
LB_60096:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60093
	btr QWORD [rdi],1
	jmp LB_60094
LB_60093:
	bts QWORD [rdi],1
LB_60094:
	mov rsi,1
	bt r12,3
	jc LB_60087
	mov rsi,0
	bt r9,0
	jc LB_60087
	jmp LB_60088
LB_60087:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60088:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60099
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60098
LB_60099:
	add rsp,8
	ret
LB_60100:
	add rsp,32
	pop r14
LB_60098:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57857:
NS_E_RDI_57857:
NS_E_57857_ETR_TBL:
NS_E_57857_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_60154
LB_60153:
	add r14,1
LB_60154:
	cmp r14,r10
	jge LB_60155
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60153
	cmp al,10
	jz LB_60153
	cmp al,32
	jz LB_60153
LB_60155:
	add r14,4
	cmp r14,r10
	jg LB_60158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_60158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_60158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_60158
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_60158
	jmp LB_60159
LB_60158:
	jmp LB_60132
LB_60159:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_60141
LB_60140:
	add r14,1
LB_60141:
	cmp r14,r10
	jge LB_60142
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60140
	cmp al,10
	jz LB_60140
	cmp al,32
	jz LB_60140
LB_60142:
	push r10
	call NS_E_57858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60143
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60144
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60144:
	jmp LB_60133
LB_60143:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_60147
LB_60146:
	add r14,1
LB_60147:
	cmp r14,r10
	jge LB_60148
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60146
	cmp al,10
	jz LB_60146
	cmp al,32
	jz LB_60146
LB_60148:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60149
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60150
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60150:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60151
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60151:
	jmp LB_60133
LB_60149:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60138
	btr r12,2
	jmp LB_60139
LB_60138:
	bts r12,2
LB_60139:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60136
	btr r12,1
	jmp LB_60137
LB_60136:
	bts r12,1
LB_60137:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60134
	btr r12,0
	jmp LB_60135
LB_60134:
	bts r12,0
LB_60135:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60129
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_60160
	btr r12,3
	jmp LB_60161
LB_60160:
	bts r12,3
LB_60161:
	mov r14,r8
	bt r12,2
	jc LB_60162
	btr r12,1
	jmp LB_60163
LB_60162:
	bts r12,1
LB_60163:
	mov r8,r13
	bt r12,0
	jc LB_60164
	btr r12,2
	jmp LB_60165
LB_60164:
	bts r12,2
LB_60165:
	mov r13,r9
	bt r12,3
	jc LB_60166
	btr r12,0
	jmp LB_60167
LB_60166:
	bts r12,0
LB_60167:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_58067 : %_58067
 ; {>  %_58066~1':_p56239 %_58065~0':(_lst)◂(_p56242) }
; _nil {  } ⊢ °1◂{  }
; _f56301 %_58066 ⊢ %_58068 : %_58068
 ; {>  %_58067~°1◂{  }:(_lst)◂(t20557'(0)) %_58066~1':_p56239 %_58065~0':(_lst)◂(_p56242) }
; _f56301 1' ⊢ °1◂1'
; _f56299 { %_58067 %_58068 } ⊢ %_58069 : %_58069
 ; {>  %_58068~°1◂1':_p56241 %_58067~°1◂{  }:(_lst)◂(t20557'(0)) %_58065~0':(_lst)◂(_p56242) }
; _f56299 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_58069 ⊢ %_58070 : %_58070
 ; {>  %_58069~°1◂{ °1◂{  } °1◂1' }:_p56240 %_58065~0':(_lst)◂(_p56242) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_58070
 ; {>  %_58070~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p56240) %_58065~0':(_lst)◂(_p56242) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_60116
	mov rdi,r13
	call dlt
LB_60116:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_60121
	mov rsi,0
	bt r13,0
	jc LB_60121
	jmp LB_60122
LB_60121:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_60122:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_60119
	btr QWORD [rdi],0
	jmp LB_60120
LB_60119:
	bts QWORD [rdi],0
LB_60120:
	mov r13,r14
	bt r12,1
	jc LB_60127
	btr r12,0
	jmp LB_60128
LB_60127:
	bts r12,0
LB_60128:
	mov rsi,1
	bt r12,0
	jc LB_60125
	mov rsi,0
	bt r13,0
	jc LB_60125
	jmp LB_60126
LB_60125:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_60126:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_60123
	btr QWORD [rdi],1
	jmp LB_60124
LB_60123:
	bts QWORD [rdi],1
LB_60124:
	mov rsi,1
	bt r12,3
	jc LB_60117
	mov rsi,0
	bt r9,0
	jc LB_60117
	jmp LB_60118
LB_60117:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60118:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60129:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60131
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60130
LB_60131:
	add rsp,8
	ret
LB_60133:
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
LB_60132:
	add rsp,48
	pop r14
LB_60130:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_60198
LB_60197:
	add r14,1
LB_60198:
	cmp r14,r10
	jge LB_60199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60197
	cmp al,10
	jz LB_60197
	cmp al,32
	jz LB_60197
LB_60199:
	add r14,3
	cmp r14,r10
	jg LB_60202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_60202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_60202
	jmp LB_60203
LB_60202:
	jmp LB_60188
LB_60203:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_60205
LB_60204:
	add r14,1
LB_60205:
	cmp r14,r10
	jge LB_60206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60204
	cmp al,10
	jz LB_60204
	cmp al,32
	jz LB_60204
LB_60206:
	push r10
	call NS_E_57858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60207
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60208:
	jmp LB_60188
LB_60207:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_60211
LB_60210:
	add r14,1
LB_60211:
	cmp r14,r10
	jge LB_60212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60210
	cmp al,10
	jz LB_60210
	cmp al,32
	jz LB_60210
LB_60212:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60213
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60214
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60214:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60215
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60215:
	jmp LB_60188
LB_60213:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_60218
LB_60217:
	add r14,1
LB_60218:
	cmp r14,r10
	jge LB_60219
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60217
	cmp al,10
	jz LB_60217
	cmp al,32
	jz LB_60217
LB_60219:
	push r10
	call NS_E_57857_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60220
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60221
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60221:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60222
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60222:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60223
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60223:
	jmp LB_60188
LB_60220:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60195
	btr r12,3
	jmp LB_60196
LB_60195:
	bts r12,3
LB_60196:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60193
	btr r12,2
	jmp LB_60194
LB_60193:
	bts r12,2
LB_60194:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60191
	btr r12,1
	jmp LB_60192
LB_60191:
	bts r12,1
LB_60192:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60189
	btr r12,0
	jmp LB_60190
LB_60189:
	bts r12,0
LB_60190:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_60185
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_60225
	btr r12,4
	jmp LB_60226
LB_60225:
	bts r12,4
LB_60226:
	mov r8,r9
	bt r12,3
	jc LB_60227
	btr r12,2
	jmp LB_60228
LB_60227:
	bts r12,2
LB_60228:
	mov r9,r14
	bt r12,1
	jc LB_60229
	btr r12,3
	jmp LB_60230
LB_60229:
	bts r12,3
LB_60230:
	mov r14,r10
	bt r12,4
	jc LB_60231
	btr r12,1
	jmp LB_60232
LB_60231:
	bts r12,1
LB_60232:
	mov r10,r13
	bt r12,0
	jc LB_60233
	btr r12,4
	jmp LB_60234
LB_60233:
	bts r12,4
LB_60234:
	mov r13,r9
	bt r12,3
	jc LB_60235
	btr r12,0
	jmp LB_60236
LB_60235:
	bts r12,0
LB_60236:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_58074 : %_58074
 ; {>  %_58073~2':_p56240 %_58072~1':_p56239 %_58071~0':(_lst)◂(_p56242) }
; _nil {  } ⊢ °1◂{  }
; _f56301 %_58072 ⊢ %_58075 : %_58075
 ; {>  %_58073~2':_p56240 %_58074~°1◂{  }:(_lst)◂(t20567'(0)) %_58072~1':_p56239 %_58071~0':(_lst)◂(_p56242) }
; _f56301 1' ⊢ °1◂1'
; _f56298 { %_58074 %_58075 %_58073 } ⊢ %_58076 : %_58076
 ; {>  %_58073~2':_p56240 %_58074~°1◂{  }:(_lst)◂(t20567'(0)) %_58075~°1◂1':_p56241 %_58071~0':(_lst)◂(_p56242) }
; _f56298 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_58076 ⊢ %_58077 : %_58077
 ; {>  %_58076~°0◂{ °1◂{  } °1◂1' 2' }:_p56240 %_58071~0':(_lst)◂(_p56242) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_58077
 ; {>  %_58077~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p56240) %_58071~0':(_lst)◂(_p56242) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_60168
	mov rdi,r13
	call dlt
LB_60168:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_60173
	mov rsi,0
	bt r13,0
	jc LB_60173
	jmp LB_60174
LB_60173:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_60174:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_60171
	btr QWORD [rdi],0
	jmp LB_60172
LB_60171:
	bts QWORD [rdi],0
LB_60172:
	mov r13,r14
	bt r12,1
	jc LB_60179
	btr r12,0
	jmp LB_60180
LB_60179:
	bts r12,0
LB_60180:
	mov rsi,1
	bt r12,0
	jc LB_60177
	mov rsi,0
	bt r13,0
	jc LB_60177
	jmp LB_60178
LB_60177:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_60178:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_60175
	btr QWORD [rdi],1
	jmp LB_60176
LB_60175:
	bts QWORD [rdi],1
LB_60176:
	mov r13,r8
	bt r12,2
	jc LB_60183
	btr r12,0
	jmp LB_60184
LB_60183:
	bts r12,0
LB_60184:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_60181
	btr QWORD [rdi],2
	jmp LB_60182
LB_60181:
	bts QWORD [rdi],2
LB_60182:
	mov rsi,1
	bt r12,3
	jc LB_60169
	mov rsi,0
	bt r9,0
	jc LB_60169
	jmp LB_60170
LB_60169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60170:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60185:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60187
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60186
LB_60187:
	add rsp,8
	ret
LB_60188:
	add rsp,64
	pop r14
LB_60186:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57858:
NS_E_RDI_57858:
NS_E_57858_ETR_TBL:
NS_E_57858_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_60256
LB_60255:
	add r14,1
LB_60256:
	cmp r14,r10
	jge LB_60257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60255
	cmp al,10
	jz LB_60255
	cmp al,32
	jz LB_60255
LB_60257:
	push r10
	call NS_E_57859_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60258
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60250
LB_60258:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_60261
LB_60260:
	add r14,1
LB_60261:
	cmp r14,r10
	jge LB_60262
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60260
	cmp al,10
	jz LB_60260
	cmp al,32
	jz LB_60260
LB_60262:
	push r10
	call NS_E_57860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60263
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60264
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60264:
	jmp LB_60250
LB_60263:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60253
	btr r12,1
	jmp LB_60254
LB_60253:
	bts r12,1
LB_60254:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60251
	btr r12,0
	jmp LB_60252
LB_60251:
	bts r12,0
LB_60252:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60247
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_58078 %_58079 } ⊢ %_58080 : %_58080
 ; {>  %_58078~0':_p56242 %_58079~1':(_lst)◂(_p56242) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_58080 ⊢ %_58081 : %_58081
 ; {>  %_58080~°0◂{ 0' 1' }:(_lst)◂(_p56242) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_58081
 ; {>  %_58081~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p56242)) }
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
	jc LB_60241
	btr r12,2
	jmp LB_60242
LB_60241:
	bts r12,2
LB_60242:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60239
	btr QWORD [rdi],0
	jmp LB_60240
LB_60239:
	bts QWORD [rdi],0
LB_60240:
	mov r8,r14
	bt r12,1
	jc LB_60245
	btr r12,2
	jmp LB_60246
LB_60245:
	bts r12,2
LB_60246:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60243
	btr QWORD [rdi],1
	jmp LB_60244
LB_60243:
	bts QWORD [rdi],1
LB_60244:
	mov rsi,1
	bt r12,3
	jc LB_60237
	mov rsi,0
	bt r9,0
	jc LB_60237
	jmp LB_60238
LB_60237:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60238:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60247:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60249
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60248
LB_60249:
	add rsp,8
	ret
LB_60250:
	add rsp,32
	pop r14
LB_60248:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_60277
LB_60276:
	add r14,1
LB_60277:
	cmp r14,r10
	jge LB_60278
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60276
	cmp al,32
	jz LB_60276
LB_60278:
	add r14,1
	cmp r14,r10
	jg LB_60281
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_60281
	jmp LB_60282
LB_60281:
	jmp LB_60271
LB_60282:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_60284
LB_60283:
	add r14,1
LB_60284:
	cmp r14,r10
	jge LB_60285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60283
	cmp al,32
	jz LB_60283
LB_60285:
	add r14,1
	cmp r14,r10
	jg LB_60289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_60289
	jmp LB_60290
LB_60289:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60287
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60287:
	jmp LB_60271
LB_60290:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60274
	btr r12,1
	jmp LB_60275
LB_60274:
	bts r12,1
LB_60275:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60272
	btr r12,0
	jmp LB_60273
LB_60272:
	bts r12,0
LB_60273:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60268
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_58082 : %_58082
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_58082 ⊢ %_58083 : %_58083
 ; {>  %_58082~°1◂{  }:(_lst)◂(t20580'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58083
 ; {>  %_58083~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20583'(0))) }
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
	jc LB_60266
	mov rsi,0
	bt r9,0
	jc LB_60266
	jmp LB_60267
LB_60266:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60267:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60268:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60270
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60269
LB_60270:
	add rsp,8
	ret
LB_60271:
	add rsp,32
	pop r14
LB_60269:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57859:
NS_E_RDI_57859:
NS_E_57859_ETR_TBL:
NS_E_57859_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src_ptn
	jmp LB_60347
LB_60346:
	add r14,1
LB_60347:
	cmp r14,r10
	jge LB_60348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60346
	cmp al,10
	jz LB_60346
	cmp al,32
	jz LB_60346
LB_60348:
	push r10
	call NS_E_57303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60349
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60308
LB_60349:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_60352
LB_60351:
	add r14,1
LB_60352:
	cmp r14,r10
	jge LB_60353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60351
	cmp al,10
	jz LB_60351
	cmp al,32
	jz LB_60351
LB_60353:
	add r14,3
	cmp r14,r10
	jg LB_60357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_60357
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_60357
	jmp LB_60358
LB_60357:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60355
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60355:
	jmp LB_60308
LB_60358:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_60321
LB_60320:
	add r14,1
LB_60321:
	cmp r14,r10
	jge LB_60322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60320
	cmp al,10
	jz LB_60320
	cmp al,32
	jz LB_60320
LB_60322:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60323
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60324
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60324:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60325
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60325:
	jmp LB_60309
LB_60323:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_60328
LB_60327:
	add r14,1
LB_60328:
	cmp r14,r10
	jge LB_60329
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60327
	cmp al,10
	jz LB_60327
	cmp al,32
	jz LB_60327
LB_60329:
	add r14,3
	cmp r14,r10
	jg LB_60335
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60335
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_60335
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_60335
	jmp LB_60336
LB_60335:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60331
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60331:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60332
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60332:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60333:
	jmp LB_60309
LB_60336:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_60338
LB_60337:
	add r14,1
LB_60338:
	cmp r14,r10
	jge LB_60339
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60337
	cmp al,10
	jz LB_60337
	cmp al,32
	jz LB_60337
LB_60339:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60340
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_60341
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_60341:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60342
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60342:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60343
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60343:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60344
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60344:
	jmp LB_60309
LB_60340:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_60318
	btr r12,4
	jmp LB_60319
LB_60318:
	bts r12,4
LB_60319:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60316
	btr r12,3
	jmp LB_60317
LB_60316:
	bts r12,3
LB_60317:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60314
	btr r12,2
	jmp LB_60315
LB_60314:
	bts r12,2
LB_60315:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60312
	btr r12,1
	jmp LB_60313
LB_60312:
	bts r12,1
LB_60313:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60310
	btr r12,0
	jmp LB_60311
LB_60310:
	bts r12,0
LB_60311:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_60305
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_60359
	btr r12,5
	jmp LB_60360
LB_60359:
	bts r12,5
LB_60360:
	mov r8,r10
	bt r12,4
	jc LB_60361
	btr r12,2
	jmp LB_60362
LB_60361:
	bts r12,2
LB_60362:
	mov r10,r14
	bt r12,1
	jc LB_60363
	btr r12,4
	jmp LB_60364
LB_60363:
	bts r12,4
LB_60364:
	mov r14,r11
	bt r12,5
	jc LB_60365
	btr r12,1
	jmp LB_60366
LB_60365:
	bts r12,1
LB_60366:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56302 { %_58084 %_58085 %_58086 } ⊢ %_58087 : %_58087
 ; {>  %_58084~0':_p56235 %_58085~1':_p56214 %_58086~2':_p56236 }
; _f56302 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_58087 ⊢ %_58088 : %_58088
 ; {>  %_58087~°0◂{ 0' 1' 2' }:_p56242 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_58088
 ; {>  %_58088~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p56242) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_60295
	btr r12,4
	jmp LB_60296
LB_60295:
	bts r12,4
LB_60296:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_60293
	btr QWORD [rdi],0
	jmp LB_60294
LB_60293:
	bts QWORD [rdi],0
LB_60294:
	mov r10,r14
	bt r12,1
	jc LB_60299
	btr r12,4
	jmp LB_60300
LB_60299:
	bts r12,4
LB_60300:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_60297
	btr QWORD [rdi],1
	jmp LB_60298
LB_60297:
	bts QWORD [rdi],1
LB_60298:
	mov r10,r8
	bt r12,2
	jc LB_60303
	btr r12,4
	jmp LB_60304
LB_60303:
	bts r12,4
LB_60304:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_60301
	btr QWORD [rdi],2
	jmp LB_60302
LB_60301:
	bts QWORD [rdi],2
LB_60302:
	mov rsi,1
	bt r12,3
	jc LB_60291
	mov rsi,0
	bt r9,0
	jc LB_60291
	jmp LB_60292
LB_60291:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60292:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60305:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60307
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60306
LB_60307:
	add rsp,8
	ret
LB_60309:
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
LB_60308:
	add rsp,80
	pop r14
LB_60306:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_60388
LB_60387:
	add r14,1
LB_60388:
	cmp r14,r10
	jge LB_60389
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60387
	cmp al,32
	jz LB_60387
LB_60389:
	push r10
	call NS_E_57861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60390
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60380
LB_60390:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_60393
LB_60392:
	add r14,1
LB_60393:
	cmp r14,r10
	jge LB_60394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60392
	cmp al,32
	jz LB_60392
LB_60394:
	add r14,1
	cmp r14,r10
	jg LB_60398
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_60398
	jmp LB_60399
LB_60398:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60396
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60396:
	jmp LB_60380
LB_60399:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_60401
LB_60400:
	add r14,1
LB_60401:
	cmp r14,r10
	jge LB_60402
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60400
	cmp al,32
	jz LB_60400
LB_60402:
	push r10
	call NS_E_57861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60403
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60404
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60404:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60405:
	jmp LB_60380
LB_60403:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60385
	btr r12,2
	jmp LB_60386
LB_60385:
	bts r12,2
LB_60386:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60383
	btr r12,1
	jmp LB_60384
LB_60383:
	bts r12,1
LB_60384:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60381
	btr r12,0
	jmp LB_60382
LB_60381:
	bts r12,0
LB_60382:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60377
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_60407
	btr r12,3
	jmp LB_60408
LB_60407:
	bts r12,3
LB_60408:
	mov r14,r8
	bt r12,2
	jc LB_60409
	btr r12,1
	jmp LB_60410
LB_60409:
	bts r12,1
LB_60410:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56303 { %_58089 %_58090 } ⊢ %_58091 : %_58091
 ; {>  %_58090~1':_p56243 %_58089~0':_p56243 }
; _f56303 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_58091 ⊢ %_58092 : %_58092
 ; {>  %_58091~°1◂{ 0' 1' }:_p56242 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_58092
 ; {>  %_58092~°0◂°1◂{ 0' 1' }:(_opn)◂(_p56242) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_60371
	btr r12,2
	jmp LB_60372
LB_60371:
	bts r12,2
LB_60372:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60369
	btr QWORD [rdi],0
	jmp LB_60370
LB_60369:
	bts QWORD [rdi],0
LB_60370:
	mov r8,r14
	bt r12,1
	jc LB_60375
	btr r12,2
	jmp LB_60376
LB_60375:
	bts r12,2
LB_60376:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60373
	btr QWORD [rdi],1
	jmp LB_60374
LB_60373:
	bts QWORD [rdi],1
LB_60374:
	mov rsi,1
	bt r12,3
	jc LB_60367
	mov rsi,0
	bt r9,0
	jc LB_60367
	jmp LB_60368
LB_60367:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60368:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60377:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60379
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60378
LB_60379:
	add rsp,8
	ret
LB_60380:
	add rsp,48
	pop r14
LB_60378:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57860:
NS_E_RDI_57860:
NS_E_57860_ETR_TBL:
NS_E_57860_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_60446
LB_60445:
	add r14,1
LB_60446:
	cmp r14,r10
	jge LB_60447
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60445
	cmp al,10
	jz LB_60445
	cmp al,32
	jz LB_60445
LB_60447:
	add r14,1
	cmp r14,r10
	jg LB_60450
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_60450
	jmp LB_60451
LB_60450:
	jmp LB_60424
LB_60451:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_60433
LB_60432:
	add r14,1
LB_60433:
	cmp r14,r10
	jge LB_60434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60432
	cmp al,10
	jz LB_60432
	cmp al,32
	jz LB_60432
LB_60434:
	push r10
	call NS_E_57859_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60435
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60436:
	jmp LB_60425
LB_60435:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_60439
LB_60438:
	add r14,1
LB_60439:
	cmp r14,r10
	jge LB_60440
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60438
	cmp al,10
	jz LB_60438
	cmp al,32
	jz LB_60438
LB_60440:
	push r10
	call NS_E_57860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60441
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60442
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60442:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60443
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60443:
	jmp LB_60425
LB_60441:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60430
	btr r12,2
	jmp LB_60431
LB_60430:
	bts r12,2
LB_60431:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60428
	btr r12,1
	jmp LB_60429
LB_60428:
	bts r12,1
LB_60429:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60426
	btr r12,0
	jmp LB_60427
LB_60426:
	bts r12,0
LB_60427:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60421
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_60452
	btr r12,3
	jmp LB_60453
LB_60452:
	bts r12,3
LB_60453:
	mov r14,r8
	bt r12,2
	jc LB_60454
	btr r12,1
	jmp LB_60455
LB_60454:
	bts r12,1
LB_60455:
	mov r8,r13
	bt r12,0
	jc LB_60456
	btr r12,2
	jmp LB_60457
LB_60456:
	bts r12,2
LB_60457:
	mov r13,r9
	bt r12,3
	jc LB_60458
	btr r12,0
	jmp LB_60459
LB_60458:
	bts r12,0
LB_60459:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_58093 %_58094 } ⊢ %_58095 : %_58095
 ; {>  %_58094~1':(_lst)◂(_p56242) %_58093~0':_p56242 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_58095 ⊢ %_58096 : %_58096
 ; {>  %_58095~°0◂{ 0' 1' }:(_lst)◂(_p56242) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_58096
 ; {>  %_58096~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p56242)) }
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
	jc LB_60415
	btr r12,2
	jmp LB_60416
LB_60415:
	bts r12,2
LB_60416:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60413
	btr QWORD [rdi],0
	jmp LB_60414
LB_60413:
	bts QWORD [rdi],0
LB_60414:
	mov r8,r14
	bt r12,1
	jc LB_60419
	btr r12,2
	jmp LB_60420
LB_60419:
	bts r12,2
LB_60420:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60417
	btr QWORD [rdi],1
	jmp LB_60418
LB_60417:
	bts QWORD [rdi],1
LB_60418:
	mov rsi,1
	bt r12,3
	jc LB_60411
	mov rsi,0
	bt r9,0
	jc LB_60411
	jmp LB_60412
LB_60411:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60412:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60423
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60422
LB_60423:
	add rsp,8
	ret
LB_60425:
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
LB_60424:
	add rsp,48
	pop r14
LB_60422:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_60471
LB_60470:
	add r14,1
LB_60471:
	cmp r14,r10
	jge LB_60472
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60470
	cmp al,32
	jz LB_60470
LB_60472:
	add r14,1
	cmp r14,r10
	jg LB_60475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_60475
	jmp LB_60476
LB_60475:
	jmp LB_60465
LB_60476:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_60478
LB_60477:
	add r14,1
LB_60478:
	cmp r14,r10
	jge LB_60479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60477
	cmp al,32
	jz LB_60477
LB_60479:
	add r14,1
	cmp r14,r10
	jg LB_60483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_60483
	jmp LB_60484
LB_60483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60481:
	jmp LB_60465
LB_60484:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60468
	btr r12,1
	jmp LB_60469
LB_60468:
	bts r12,1
LB_60469:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60466
	btr r12,0
	jmp LB_60467
LB_60466:
	bts r12,0
LB_60467:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60462
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_58097 : %_58097
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_58097 ⊢ %_58098 : %_58098
 ; {>  %_58097~°1◂{  }:(_lst)◂(t20604'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58098
 ; {>  %_58098~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20607'(0))) }
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
	jc LB_60460
	mov rsi,0
	bt r9,0
	jc LB_60460
	jmp LB_60461
LB_60460:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60461:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60462:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60464
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60463
LB_60464:
	add rsp,8
	ret
LB_60465:
	add rsp,32
	pop r14
LB_60463:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57861:
NS_E_RDI_57861:
NS_E_57861_ETR_TBL:
NS_E_57861_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60500
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60492
LB_60500:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_60508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_60508
	jmp LB_60509
LB_60508:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60506
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60506:
	jmp LB_60492
LB_60509:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60495
	btr r12,1
	jmp LB_60496
LB_60495:
	bts r12,1
LB_60496:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60493
	btr r12,0
	jmp LB_60494
LB_60493:
	bts r12,0
LB_60494:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60489
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56305 %_58099 ⊢ %_58100 : %_58100
 ; {>  %_58099~0':_stg }
; _f56305 0' ⊢ °1◂0'
; _some %_58100 ⊢ %_58101 : %_58101
 ; {>  %_58100~°1◂0':_p56243 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_58101
 ; {>  %_58101~°0◂°1◂0':(_opn)◂(_p56243) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60487
	btr r12,3
	jmp LB_60488
LB_60487:
	bts r12,3
LB_60488:
	mov rsi,1
	bt r12,3
	jc LB_60485
	mov rsi,0
	bt r9,0
	jc LB_60485
	jmp LB_60486
LB_60485:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60486:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60489:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60491
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60490
LB_60491:
	add rsp,8
	ret
LB_60492:
	add rsp,32
	pop r14
LB_60490:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_57174_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60523
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60517
LB_60523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60518
	btr r12,0
	jmp LB_60519
LB_60518:
	bts r12,0
LB_60519:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60514
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56304 %_58102 ⊢ %_58103 : %_58103
 ; {>  %_58102~0':_p56238 }
; _f56304 0' ⊢ °0◂0'
; _some %_58103 ⊢ %_58104 : %_58104
 ; {>  %_58103~°0◂0':_p56243 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58104
 ; {>  %_58104~°0◂°0◂0':(_opn)◂(_p56243) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60512
	btr r12,3
	jmp LB_60513
LB_60512:
	bts r12,3
LB_60513:
	mov rsi,1
	bt r12,3
	jc LB_60510
	mov rsi,0
	bt r9,0
	jc LB_60510
	jmp LB_60511
LB_60510:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60511:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60514:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60516
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60515
LB_60516:
	add rsp,8
	ret
LB_60517:
	add rsp,16
	pop r14
LB_60515:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57862:
NS_E_RDI_57862:
NS_E_57862_ETR_TBL:
NS_E_57862_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
	jmp LB_60538
LB_60537:
	add r14,1
LB_60538:
	cmp r14,r10
	jge LB_60539
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60537
	cmp al,10
	jz LB_60537
	cmp al,32
	jz LB_60537
LB_60539:
	add r14,1
	cmp r14,r10
	jg LB_60542
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_60542
	jmp LB_60543
LB_60542:
	jmp LB_60530
LB_60543:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_60545
LB_60544:
	add r14,1
LB_60545:
	cmp r14,r10
	jge LB_60546
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60544
	cmp al,10
	jz LB_60544
	cmp al,32
	jz LB_60544
LB_60546:
	push r10
	call NS_E_57862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60547
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60548
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60548:
	jmp LB_60530
LB_60547:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_60551
LB_60550:
	add r14,1
LB_60551:
	cmp r14,r10
	jge LB_60552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60550
	cmp al,10
	jz LB_60550
	cmp al,32
	jz LB_60550
LB_60552:
	add r14,1
	cmp r14,r10
	jg LB_60557
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_60557
	jmp LB_60558
LB_60557:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60554
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60554:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60555
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60555:
	jmp LB_60530
LB_60558:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60535
	btr r12,2
	jmp LB_60536
LB_60535:
	bts r12,2
LB_60536:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60533
	btr r12,1
	jmp LB_60534
LB_60533:
	bts r12,1
LB_60534:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60531
	btr r12,0
	jmp LB_60532
LB_60531:
	bts r12,0
LB_60532:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60527
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_60559
	btr r12,3
	jmp LB_60560
LB_60559:
	bts r12,3
LB_60560:
	mov r13,r14
	bt r12,1
	jc LB_60561
	btr r12,0
	jmp LB_60562
LB_60561:
	bts r12,0
LB_60562:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_58105 ⊢ %_58106 : %_58106
 ; {>  %_58105~0':_p56237 }
; _some 0' ⊢ °0◂0'
; ∎ %_58106
 ; {>  %_58106~°0◂0':(_opn)◂(_p56237) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60525
	btr r12,3
	jmp LB_60526
LB_60525:
	bts r12,3
LB_60526:
	mov r8,0
	bts r12,2
	ret
LB_60527:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60529
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60528
LB_60529:
	add rsp,8
	ret
LB_60530:
	add rsp,48
	pop r14
LB_60528:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_60603
LB_60602:
	add r14,1
LB_60603:
	cmp r14,r10
	jge LB_60604
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60602
	cmp al,10
	jz LB_60602
	cmp al,32
	jz LB_60602
LB_60604:
	push r10
	call NS_E_57865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60605
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60595
LB_60605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_60608
LB_60607:
	add r14,1
LB_60608:
	cmp r14,r10
	jge LB_60609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60607
	cmp al,10
	jz LB_60607
	cmp al,32
	jz LB_60607
LB_60609:
	push r10
	call NS_E_57864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60610
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60611
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60611:
	jmp LB_60595
LB_60610:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_60614
LB_60613:
	add r14,1
LB_60614:
	cmp r14,r10
	jge LB_60615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60613
	cmp al,10
	jz LB_60613
	cmp al,32
	jz LB_60613
LB_60615:
	push r10
	call NS_E_57863_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60616
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60617
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60617:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60618
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60618:
	jmp LB_60595
LB_60616:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60600
	btr r12,2
	jmp LB_60601
LB_60600:
	bts r12,2
LB_60601:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60598
	btr r12,1
	jmp LB_60599
LB_60598:
	bts r12,1
LB_60599:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60596
	btr r12,0
	jmp LB_60597
LB_60596:
	bts r12,0
LB_60597:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60592
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f57267 { %_58107 %_58108 } ⊢ %_58110 : %_58110
 ; {>  %_58108~1':(_lst)◂(_p56237) %_58109~2':(_opn)◂(_p56237) %_58107~0':_p56237 }
; _f57267 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_57267
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_60563
	btr r12,2
	jmp LB_60564
LB_60563:
	bts r12,2
LB_60564:
	add rsp,16
MTC_LB_60565:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_60566
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_60567
	bt QWORD [rax],0
	jc LB_60568
	btr r12,3
	jmp LB_60569
LB_60568:
	bts r12,3
LB_60569:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_60567:
	mov r9,rax
	mov r14,r9
	bt r12,3
	jc LB_60570
	btr r12,1
	jmp LB_60571
LB_60570:
	bts r12,1
LB_60571:
LB_60572:
	cmp r15,0
	jz LB_60573
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_60572
LB_60573:
; _f56288 { %_58110 %_58111 } ⊢ %_58112 : %_58112
 ; {>  %_58111~1':_p56237 %_58110~0':_p56237 }
; _f56288 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_58112 ⊢ %_58113 : %_58113
 ; {>  %_58112~°0◂{ 0' 1' }:_p56237 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_58113
 ; {>  %_58113~°0◂°0◂{ 0' 1' }:(_opn)◂(_p56237) }
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
	jc LB_60578
	btr r12,2
	jmp LB_60579
LB_60578:
	bts r12,2
LB_60579:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60576
	btr QWORD [rdi],0
	jmp LB_60577
LB_60576:
	bts QWORD [rdi],0
LB_60577:
	mov r8,r14
	bt r12,1
	jc LB_60582
	btr r12,2
	jmp LB_60583
LB_60582:
	bts r12,2
LB_60583:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60580
	btr QWORD [rdi],1
	jmp LB_60581
LB_60580:
	bts QWORD [rdi],1
LB_60581:
	mov rsi,1
	bt r12,3
	jc LB_60574
	mov rsi,0
	bt r9,0
	jc LB_60574
	jmp LB_60575
LB_60574:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60575:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_60566:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_60584
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_60585
	bt QWORD [rax],0
	jc LB_60586
	btr r12,1
	jmp LB_60587
LB_60586:
	bts r12,1
LB_60587:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_60585:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_60588:
	cmp r15,0
	jz LB_60589
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_60588
LB_60589:
; _some %_58110 ⊢ %_58114 : %_58114
 ; {>  %_58110~0':_p56237 }
; _some 0' ⊢ °0◂0'
; ∎ %_58114
 ; {>  %_58114~°0◂0':(_opn)◂(_p56237) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60590
	btr r12,3
	jmp LB_60591
LB_60590:
	bts r12,3
LB_60591:
	mov r8,0
	bts r12,2
	ret
MTC_LB_60584:
LB_60592:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60594
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60593
LB_60594:
	add rsp,8
	ret
LB_60595:
	add rsp,48
	pop r14
LB_60593:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57863:
NS_E_RDI_57863:
NS_E_57863_ETR_TBL:
NS_E_57863_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_60633
LB_60632:
	add r14,1
LB_60633:
	cmp r14,r10
	jge LB_60634
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60632
	cmp al,10
	jz LB_60632
	cmp al,32
	jz LB_60632
LB_60634:
	add r14,3
	cmp r14,r10
	jg LB_60637
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60637
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_60637
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_60637
	jmp LB_60638
LB_60637:
	jmp LB_60627
LB_60638:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_60640
LB_60639:
	add r14,1
LB_60640:
	cmp r14,r10
	jge LB_60641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60639
	cmp al,10
	jz LB_60639
	cmp al,32
	jz LB_60639
LB_60641:
	push r10
	call NS_E_57862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60643
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60643:
	jmp LB_60627
LB_60642:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60630
	btr r12,1
	jmp LB_60631
LB_60630:
	bts r12,1
LB_60631:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60628
	btr r12,0
	jmp LB_60629
LB_60628:
	bts r12,0
LB_60629:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60624
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_60645
	btr r12,2
	jmp LB_60646
LB_60645:
	bts r12,2
LB_60646:
	mov r13,r14
	bt r12,1
	jc LB_60647
	btr r12,0
	jmp LB_60648
LB_60647:
	bts r12,0
LB_60648:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_58115 ⊢ %_58116 : %_58116
 ; {>  %_58115~0':_p56237 }
; _some 0' ⊢ °0◂0'
; _some %_58116 ⊢ %_58117 : %_58117
 ; {>  %_58116~°0◂0':(_opn)◂(_p56237) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58117
 ; {>  %_58117~°0◂°0◂0':(_opn)◂((_opn)◂(_p56237)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60622
	btr r12,3
	jmp LB_60623
LB_60622:
	bts r12,3
LB_60623:
	mov rsi,1
	bt r12,3
	jc LB_60620
	mov rsi,0
	bt r9,0
	jc LB_60620
	jmp LB_60621
LB_60620:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60621:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60624:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60626
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60625
LB_60626:
	add rsp,8
	ret
LB_60627:
	add rsp,32
	pop r14
LB_60625:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_60651
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_58118 : %_58118
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_58118 ⊢ %_58119 : %_58119
 ; {>  %_58118~°1◂{  }:(_opn)◂(t20642'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58119
 ; {>  %_58119~°0◂°1◂{  }:(_opn)◂((_opn)◂(t20645'(0))) }
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
	jc LB_60649
	mov rsi,0
	bt r9,0
	jc LB_60649
	jmp LB_60650
LB_60649:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60650:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60651:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60653
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60652
LB_60653:
	add rsp,8
	ret
LB_60654:
	add rsp,0
	pop r14
LB_60652:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57864:
NS_E_RDI_57864:
NS_E_57864_ETR_TBL:
NS_E_57864_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_60676
LB_60675:
	add r14,1
LB_60676:
	cmp r14,r10
	jge LB_60677
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60675
	cmp al,10
	jz LB_60675
	cmp al,32
	jz LB_60675
LB_60677:
	add r14,3
	cmp r14,r10
	jg LB_60680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_60680
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_60680
	jmp LB_60681
LB_60680:
	jmp LB_60668
LB_60681:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_60683
LB_60682:
	add r14,1
LB_60683:
	cmp r14,r10
	jge LB_60684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60682
	cmp al,10
	jz LB_60682
	cmp al,32
	jz LB_60682
LB_60684:
	push r10
	call NS_E_57865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60685
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60686
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60686:
	jmp LB_60668
LB_60685:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_60689
LB_60688:
	add r14,1
LB_60689:
	cmp r14,r10
	jge LB_60690
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60688
	cmp al,10
	jz LB_60688
	cmp al,32
	jz LB_60688
LB_60690:
	push r10
	call NS_E_57864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60691
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60692
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60692:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60693
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60693:
	jmp LB_60668
LB_60691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60673
	btr r12,2
	jmp LB_60674
LB_60673:
	bts r12,2
LB_60674:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60671
	btr r12,1
	jmp LB_60672
LB_60671:
	bts r12,1
LB_60672:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60669
	btr r12,0
	jmp LB_60670
LB_60669:
	bts r12,0
LB_60670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60665
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_60695
	btr r12,3
	jmp LB_60696
LB_60695:
	bts r12,3
LB_60696:
	mov r14,r8
	bt r12,2
	jc LB_60697
	btr r12,1
	jmp LB_60698
LB_60697:
	bts r12,1
LB_60698:
	mov r8,r13
	bt r12,0
	jc LB_60699
	btr r12,2
	jmp LB_60700
LB_60699:
	bts r12,2
LB_60700:
	mov r13,r9
	bt r12,3
	jc LB_60701
	btr r12,0
	jmp LB_60702
LB_60701:
	bts r12,0
LB_60702:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_58120 %_58121 } ⊢ %_58122 : %_58122
 ; {>  %_58121~1':(_lst)◂(_p56237) %_58120~0':_p56237 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_58122 ⊢ %_58123 : %_58123
 ; {>  %_58122~°0◂{ 0' 1' }:(_lst)◂(_p56237) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_58123
 ; {>  %_58123~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p56237)) }
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
	jc LB_60659
	btr r12,2
	jmp LB_60660
LB_60659:
	bts r12,2
LB_60660:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60657
	btr QWORD [rdi],0
	jmp LB_60658
LB_60657:
	bts QWORD [rdi],0
LB_60658:
	mov r8,r14
	bt r12,1
	jc LB_60663
	btr r12,2
	jmp LB_60664
LB_60663:
	bts r12,2
LB_60664:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60661
	btr QWORD [rdi],1
	jmp LB_60662
LB_60661:
	bts QWORD [rdi],1
LB_60662:
	mov rsi,1
	bt r12,3
	jc LB_60655
	mov rsi,0
	bt r9,0
	jc LB_60655
	jmp LB_60656
LB_60655:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60656:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60665:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60667
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60666
LB_60667:
	add rsp,8
	ret
LB_60668:
	add rsp,48
	pop r14
LB_60666:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_60705
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_58124 : %_58124
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_58124 ⊢ %_58125 : %_58125
 ; {>  %_58124~°1◂{  }:(_lst)◂(t20655'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58125
 ; {>  %_58125~°0◂°1◂{  }:(_opn)◂((_lst)◂(t20658'(0))) }
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
	jc LB_60703
	mov rsi,0
	bt r9,0
	jc LB_60703
	jmp LB_60704
LB_60703:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60704:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60705:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60707
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60706
LB_60707:
	add rsp,8
	ret
LB_60708:
	add rsp,0
	pop r14
LB_60706:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57865:
NS_E_RDI_57865:
NS_E_57865_ETR_TBL:
NS_E_57865_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_60720
LB_60719:
	add r14,1
LB_60720:
	cmp r14,r10
	jge LB_60721
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60719
	cmp al,10
	jz LB_60719
	cmp al,32
	jz LB_60719
LB_60721:
	push r10
	call NS_E_57866_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60722
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60716
LB_60722:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60717
	btr r12,0
	jmp LB_60718
LB_60717:
	bts r12,0
LB_60718:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60713
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56291 %_58126 ⊢ %_58127 : %_58127
 ; {>  %_58126~0':_stg }
; _f56291 0' ⊢ °3◂0'
; _some %_58127 ⊢ %_58128 : %_58128
 ; {>  %_58127~°3◂0':_p56237 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_58128
 ; {>  %_58128~°0◂°3◂0':(_opn)◂(_p56237) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60711
	btr r12,3
	jmp LB_60712
LB_60711:
	bts r12,3
LB_60712:
	mov rsi,1
	bt r12,3
	jc LB_60709
	mov rsi,0
	bt r9,0
	jc LB_60709
	jmp LB_60710
LB_60709:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60710:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60713:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60715
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60714
LB_60715:
	add rsp,8
	ret
LB_60716:
	add rsp,16
	pop r14
LB_60714:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_60735
LB_60734:
	add r14,1
LB_60735:
	cmp r14,r10
	jge LB_60736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60734
	cmp al,10
	jz LB_60734
	cmp al,32
	jz LB_60734
LB_60736:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60737
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60731
LB_60737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60732
	btr r12,0
	jmp LB_60733
LB_60732:
	bts r12,0
LB_60733:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60728
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56290 %_58129 ⊢ %_58130 : %_58130
 ; {>  %_58129~0':_p56214 }
; _f56290 0' ⊢ °2◂0'
; _some %_58130 ⊢ %_58131 : %_58131
 ; {>  %_58130~°2◂0':_p56237 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_58131
 ; {>  %_58131~°0◂°2◂0':(_opn)◂(_p56237) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60726
	btr r12,3
	jmp LB_60727
LB_60726:
	bts r12,3
LB_60727:
	mov rsi,1
	bt r12,3
	jc LB_60724
	mov rsi,0
	bt r9,0
	jc LB_60724
	jmp LB_60725
LB_60724:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60725:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60728:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60730
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60729
LB_60730:
	add rsp,8
	ret
LB_60731:
	add rsp,16
	pop r14
LB_60729:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57866:
NS_E_RDI_57866:
NS_E_57866_ETR_TBL:
NS_E_57866_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60752
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60744
LB_60752:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_60760
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_60760
	jmp LB_60761
LB_60760:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60758
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60758:
	jmp LB_60744
LB_60761:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60747
	btr r12,1
	jmp LB_60748
LB_60747:
	bts r12,1
LB_60748:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60745
	btr r12,0
	jmp LB_60746
LB_60745:
	bts r12,0
LB_60746:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60741
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_58132 ⊢ %_58133 : %_58133
 ; {>  %_58132~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_58133
 ; {>  %_58133~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60739
	btr r12,3
	jmp LB_60740
LB_60739:
	bts r12,3
LB_60740:
	mov r8,0
	bts r12,2
	ret
LB_60741:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60743
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60742
LB_60743:
	add rsp,8
	ret
LB_60744:
	add rsp,32
	pop r14
LB_60742:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57868:
NS_E_RDI_57868:
NS_E_57868_ETR_TBL:
NS_E_57868_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_60769
LB_60768:
	add r14,1
LB_60769:
	cmp r14,r10
	jge LB_60770
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60768
	cmp al,10
	jz LB_60768
	cmp al,32
	jz LB_60768
LB_60770:
	add r14,1
	cmp r14,r10
	jg LB_60773
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_60773
	jmp LB_60774
LB_60773:
	jmp LB_60762
LB_60774:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_60776
LB_60775:
	add r14,1
LB_60776:
	cmp r14,r10
	jge LB_60777
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60775
	cmp al,10
	jz LB_60775
	cmp al,32
	jz LB_60775
LB_60777:
	add r14,1
	cmp r14,r10
	jg LB_60781
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_60781
	jmp LB_60782
LB_60781:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60779
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60779:
	jmp LB_60762
LB_60782:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_60784
LB_60783:
	add r14,1
LB_60784:
	cmp r14,r10
	jge LB_60785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60783
	cmp al,10
	jz LB_60783
	cmp al,32
	jz LB_60783
LB_60785:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60786
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60787
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60787:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60788
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60788:
	jmp LB_60762
LB_60786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_60791
LB_60790:
	add r14,1
LB_60791:
	cmp r14,r10
	jge LB_60792
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60790
	cmp al,10
	jz LB_60790
	cmp al,32
	jz LB_60790
LB_60792:
	push r10
	call NS_E_57870_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60793
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60794
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60794:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60795
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60795:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60796
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60796:
	jmp LB_60762
LB_60793:
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
	jc LB_60763
	btr QWORD [rdi],3
LB_60763:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60764
	btr QWORD [rdi],2
LB_60764:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60765
	btr QWORD [rdi],1
LB_60765:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60766
	btr QWORD [rdi],0
LB_60766:
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
LB_60762:
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
NS_E_57870:
NS_E_RDI_57870:
NS_E_57870_ETR_TBL:
NS_E_57870_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_60810
LB_60809:
	add r14,1
LB_60810:
	cmp r14,r10
	jge LB_60811
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60809
	cmp al,10
	jz LB_60809
	cmp al,32
	jz LB_60809
LB_60811:
	push r10
	call NS_E_57871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60812
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60798
LB_60812:
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
	jc LB_60807
	btr QWORD [rdi],0
LB_60807:
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
LB_60798:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_60803
LB_60802:
	add r14,1
LB_60803:
	cmp r14,r10
	jge LB_60804
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60802
	cmp al,10
	jz LB_60802
	cmp al,32
	jz LB_60802
LB_60804:
	push r10
	call NS_E_57879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60805
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60799
LB_60805:
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
	jc LB_60800
	btr QWORD [rdi],0
LB_60800:
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
LB_60799:
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
NS_E_57871:
NS_E_RDI_57871:
NS_E_57871_ETR_TBL:
NS_E_57871_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_60863
LB_60862:
	add r14,1
LB_60863:
	cmp r14,r10
	jge LB_60864
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60862
	cmp al,10
	jz LB_60862
	cmp al,32
	jz LB_60862
LB_60864:
	push r10
	call NS_E_57878_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60865
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60841
LB_60865:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_60850
LB_60849:
	add r14,1
LB_60850:
	cmp r14,r10
	jge LB_60851
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60849
	cmp al,10
	jz LB_60849
	cmp al,32
	jz LB_60849
LB_60851:
	push r10
	call NS_E_57873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60852
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60853
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60853:
	jmp LB_60842
LB_60852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_60856
LB_60855:
	add r14,1
LB_60856:
	cmp r14,r10
	jge LB_60857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60855
	cmp al,10
	jz LB_60855
	cmp al,32
	jz LB_60855
LB_60857:
	push r10
	call NS_E_57872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60858
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60859
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60859:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60860
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60860:
	jmp LB_60842
LB_60858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60847
	btr r12,2
	jmp LB_60848
LB_60847:
	bts r12,2
LB_60848:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60845
	btr r12,1
	jmp LB_60846
LB_60845:
	bts r12,1
LB_60846:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60843
	btr r12,0
	jmp LB_60844
LB_60843:
	bts r12,0
LB_60844:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60838
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_60867
	btr r12,5
	jmp LB_60868
LB_60867:
	bts r12,5
LB_60868:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_60871
	btr r12,6
	jmp LB_60872
LB_60871:
	bts r12,6
LB_60872:
	mov r8,rcx
	bt r12,6
	jc LB_60869
	btr r12,2
	jmp LB_60870
LB_60869:
	bts r12,2
LB_60870:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_60875
	btr r12,6
	jmp LB_60876
LB_60875:
	bts r12,6
LB_60876:
	mov r9,rcx
	bt r12,6
	jc LB_60873
	btr r12,3
	jmp LB_60874
LB_60873:
	bts r12,3
LB_60874:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_60879
	btr r12,6
	jmp LB_60880
LB_60879:
	bts r12,6
LB_60880:
	mov r10,rcx
	bt r12,6
	jc LB_60877
	btr r12,4
	jmp LB_60878
LB_60877:
	bts r12,4
LB_60878:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56265 { %_58139 %_58140 %_58137 %_58138 %_58141 } ⊢ %_58142 : %_58142
 ; {>  %_58139~2':_p56236 %_58140~3':_p56239 %_58141~4':(_opn)◂(_p56226) %_58138~1':_p56228 %_58137~0':_p56227 }
; _f56265 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_58142 ⊢ %_58143 : %_58143
 ; {>  %_58142~°1◂{ 2' 3' 0' 1' 4' }:_p56226 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_58143
 ; {>  %_58143~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p56226) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_60814
	btr r12,5
	jmp LB_60815
LB_60814:
	bts r12,5
LB_60815:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_60820
	btr r12,6
	jmp LB_60821
LB_60820:
	bts r12,6
LB_60821:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_60818
	btr QWORD [rdi],0
	jmp LB_60819
LB_60818:
	bts QWORD [rdi],0
LB_60819:
	mov rcx,r11
	bt r12,5
	jc LB_60824
	btr r12,6
	jmp LB_60825
LB_60824:
	bts r12,6
LB_60825:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_60822
	btr QWORD [rdi],1
	jmp LB_60823
LB_60822:
	bts QWORD [rdi],1
LB_60823:
	mov rcx,r13
	bt r12,0
	jc LB_60828
	btr r12,6
	jmp LB_60829
LB_60828:
	bts r12,6
LB_60829:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_60826
	btr QWORD [rdi],2
	jmp LB_60827
LB_60826:
	bts QWORD [rdi],2
LB_60827:
	mov rcx,r14
	bt r12,1
	jc LB_60832
	btr r12,6
	jmp LB_60833
LB_60832:
	bts r12,6
LB_60833:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_60830
	btr QWORD [rdi],3
	jmp LB_60831
LB_60830:
	bts QWORD [rdi],3
LB_60831:
	mov rcx,r10
	bt r12,4
	jc LB_60836
	btr r12,6
	jmp LB_60837
LB_60836:
	bts r12,6
LB_60837:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_60834
	btr QWORD [rdi],4
	jmp LB_60835
LB_60834:
	bts QWORD [rdi],4
LB_60835:
	mov rsi,1
	bt r12,3
	jc LB_60816
	mov rsi,0
	bt r9,0
	jc LB_60816
	jmp LB_60817
LB_60816:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60817:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60838:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60840
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60839
LB_60840:
	add rsp,8
	ret
LB_60842:
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
LB_60841:
	add rsp,48
	pop r14
LB_60839:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord
	jmp LB_60922
LB_60921:
	add r14,1
LB_60922:
	cmp r14,r10
	jge LB_60923
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60921
	cmp al,10
	jz LB_60921
	cmp al,32
	jz LB_60921
LB_60923:
	push r10
	call NS_E_57877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60924
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60912
LB_60924:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_60927
LB_60926:
	add r14,1
LB_60927:
	cmp r14,r10
	jge LB_60928
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60926
	cmp al,10
	jz LB_60926
	cmp al,32
	jz LB_60926
LB_60928:
	push r10
	call NS_E_57873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60929
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60930
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60930:
	jmp LB_60912
LB_60929:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_60933
LB_60932:
	add r14,1
LB_60933:
	cmp r14,r10
	jge LB_60934
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60932
	cmp al,10
	jz LB_60932
	cmp al,32
	jz LB_60932
LB_60934:
	push r10
	call NS_E_57872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60935
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60936
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60936:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60937
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60937:
	jmp LB_60912
LB_60935:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_60940
LB_60939:
	add r14,1
LB_60940:
	cmp r14,r10
	jge LB_60941
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60939
	cmp al,10
	jz LB_60939
	cmp al,32
	jz LB_60939
LB_60941:
	push r10
	call NS_E_57871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60942
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60943
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60943:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60944
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60944:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60945
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60945:
	jmp LB_60912
LB_60942:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60919
	btr r12,3
	jmp LB_60920
LB_60919:
	bts r12,3
LB_60920:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60917
	btr r12,2
	jmp LB_60918
LB_60917:
	bts r12,2
LB_60918:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60915
	btr r12,1
	jmp LB_60916
LB_60915:
	bts r12,1
LB_60916:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60913
	btr r12,0
	jmp LB_60914
LB_60913:
	bts r12,0
LB_60914:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_60909
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_60947
	btr r12,5
	jmp LB_60948
LB_60947:
	bts r12,5
LB_60948:
	mov rcx,r8
	bt r12,2
	jc LB_60949
	btr r12,6
	jmp LB_60950
LB_60949:
	bts r12,6
LB_60950:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_60953
	btr r12,7
	jmp LB_60954
LB_60953:
	bts r12,7
LB_60954:
	mov r8,rdx
	bt r12,7
	jc LB_60951
	btr r12,2
	jmp LB_60952
LB_60951:
	bts r12,2
LB_60952:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_60957
	btr r12,7
	jmp LB_60958
LB_60957:
	bts r12,7
LB_60958:
	mov r9,rdx
	bt r12,7
	jc LB_60955
	btr r12,3
	jmp LB_60956
LB_60955:
	bts r12,3
LB_60956:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_60961
	btr r12,7
	jmp LB_60962
LB_60961:
	bts r12,7
LB_60962:
	mov r10,rdx
	bt r12,7
	jc LB_60959
	btr r12,4
	jmp LB_60960
LB_60959:
	bts r12,4
LB_60960:
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56264 { %_58146 %_58147 %_58144 %_58145 %_58148 %_58149 } ⊢ %_58150 : %_58150
 ; {>  %_58144~0':_p56227 %_58146~2':_p56236 %_58149~5':_p56226 %_58147~3':_p56239 %_58145~1':_p56228 %_58148~4':(_opn)◂(_p56226) }
; _f56264 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_58150 ⊢ %_58151 : %_58151
 ; {>  %_58150~°0◂{ 2' 3' 0' 1' 4' 5' }:_p56226 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_58151
 ; {>  %_58151~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p56226) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_60881
	btr r12,6
	jmp LB_60882
LB_60881:
	bts r12,6
LB_60882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_60887
	btr r12,7
	jmp LB_60888
LB_60887:
	bts r12,7
LB_60888:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_60885
	btr QWORD [rdi],0
	jmp LB_60886
LB_60885:
	bts QWORD [rdi],0
LB_60886:
	mov rdx,rcx
	bt r12,6
	jc LB_60891
	btr r12,7
	jmp LB_60892
LB_60891:
	bts r12,7
LB_60892:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_60889
	btr QWORD [rdi],1
	jmp LB_60890
LB_60889:
	bts QWORD [rdi],1
LB_60890:
	mov rdx,r13
	bt r12,0
	jc LB_60895
	btr r12,7
	jmp LB_60896
LB_60895:
	bts r12,7
LB_60896:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_60893
	btr QWORD [rdi],2
	jmp LB_60894
LB_60893:
	bts QWORD [rdi],2
LB_60894:
	mov rdx,r14
	bt r12,1
	jc LB_60899
	btr r12,7
	jmp LB_60900
LB_60899:
	bts r12,7
LB_60900:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_60897
	btr QWORD [rdi],3
	jmp LB_60898
LB_60897:
	bts QWORD [rdi],3
LB_60898:
	mov rdx,r10
	bt r12,4
	jc LB_60903
	btr r12,7
	jmp LB_60904
LB_60903:
	bts r12,7
LB_60904:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_60901
	btr QWORD [rdi],4
	jmp LB_60902
LB_60901:
	bts QWORD [rdi],4
LB_60902:
	mov rdx,r11
	bt r12,5
	jc LB_60907
	btr r12,7
	jmp LB_60908
LB_60907:
	bts r12,7
LB_60908:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_60905
	btr QWORD [rdi],5
	jmp LB_60906
LB_60905:
	bts QWORD [rdi],5
LB_60906:
	mov rsi,1
	bt r12,3
	jc LB_60883
	mov rsi,0
	bt r9,0
	jc LB_60883
	jmp LB_60884
LB_60883:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60884:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60909:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60911
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60910
LB_60911:
	add rsp,8
	ret
LB_60912:
	add rsp,64
	pop r14
LB_60910:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57872:
NS_E_RDI_57872:
NS_E_57872_ETR_TBL:
NS_E_57872_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_61017
LB_61016:
	add r14,1
LB_61017:
	cmp r14,r10
	jge LB_61018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61016
	cmp al,10
	jz LB_61016
	cmp al,32
	jz LB_61016
LB_61018:
	add r14,1
	cmp r14,r10
	jg LB_61021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_61021
	jmp LB_61022
LB_61021:
	jmp LB_60980
LB_61022:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_61024
LB_61023:
	add r14,1
LB_61024:
	cmp r14,r10
	jge LB_61025
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61023
	cmp al,10
	jz LB_61023
	cmp al,32
	jz LB_61023
LB_61025:
	add r14,3
	cmp r14,r10
	jg LB_61029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_61029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_61029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_61029
	jmp LB_61030
LB_61029:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61027
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61027:
	jmp LB_60980
LB_61030:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_60993
LB_60992:
	add r14,1
LB_60993:
	cmp r14,r10
	jge LB_60994
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60992
	cmp al,10
	jz LB_60992
	cmp al,32
	jz LB_60992
LB_60994:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60995
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60996
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60996:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60997:
	jmp LB_60981
LB_60995:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_61000
LB_60999:
	add r14,1
LB_61000:
	cmp r14,r10
	jge LB_61001
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60999
	cmp al,10
	jz LB_60999
	cmp al,32
	jz LB_60999
LB_61001:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61002
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_61003
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_61003:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61004
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61004:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61005
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61005:
	jmp LB_60981
LB_61002:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_61008
LB_61007:
	add r14,1
LB_61008:
	cmp r14,r10
	jge LB_61009
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61007
	cmp al,10
	jz LB_61007
	cmp al,32
	jz LB_61007
LB_61009:
	push r10
	call NS_E_57871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61010
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_61011
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_61011:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_61012
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_61012:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61013
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61013:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61014
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61014:
	jmp LB_60981
LB_61010:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_60990
	btr r12,4
	jmp LB_60991
LB_60990:
	bts r12,4
LB_60991:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60988
	btr r12,3
	jmp LB_60989
LB_60988:
	bts r12,3
LB_60989:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60986
	btr r12,2
	jmp LB_60987
LB_60986:
	bts r12,2
LB_60987:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60984
	btr r12,1
	jmp LB_60985
LB_60984:
	bts r12,1
LB_60985:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60982
	btr r12,0
	jmp LB_60983
LB_60982:
	bts r12,0
LB_60983:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_60977
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_61031
	btr r12,5
	jmp LB_61032
LB_61031:
	bts r12,5
LB_61032:
	mov r8,r10
	bt r12,4
	jc LB_61033
	btr r12,2
	jmp LB_61034
LB_61033:
	bts r12,2
LB_61034:
	mov r10,r14
	bt r12,1
	jc LB_61035
	btr r12,4
	jmp LB_61036
LB_61035:
	bts r12,4
LB_61036:
	mov r14,r9
	bt r12,3
	jc LB_61037
	btr r12,1
	jmp LB_61038
LB_61037:
	bts r12,1
LB_61038:
	mov r9,r13
	bt r12,0
	jc LB_61039
	btr r12,3
	jmp LB_61040
LB_61039:
	bts r12,3
LB_61040:
	mov r13,r11
	bt r12,5
	jc LB_61041
	btr r12,0
	jmp LB_61042
LB_61041:
	bts r12,0
LB_61042:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_58154 ⊢ %_58155 : %_58155
 ; {>  %_58153~1':_p56239 %_58154~2':_p56226 %_58152~0':_p56236 }
; _some 2' ⊢ °0◂2'
; _some { %_58152 %_58153 %_58155 } ⊢ %_58156 : %_58156
 ; {>  %_58153~1':_p56239 %_58152~0':_p56236 %_58155~°0◂2':(_opn)◂(_p56226) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_58156
 ; {>  %_58156~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p56236 _p56239 (_opn)◂(_p56226) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_60965
	btr r12,4
	jmp LB_60966
LB_60965:
	bts r12,4
LB_60966:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_60963
	btr QWORD [rdi],0
	jmp LB_60964
LB_60963:
	bts QWORD [rdi],0
LB_60964:
	mov r10,r14
	bt r12,1
	jc LB_60969
	btr r12,4
	jmp LB_60970
LB_60969:
	bts r12,4
LB_60970:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_60967
	btr QWORD [rdi],1
	jmp LB_60968
LB_60967:
	bts QWORD [rdi],1
LB_60968:
	mov r10,r8
	bt r12,2
	jc LB_60975
	btr r12,4
	jmp LB_60976
LB_60975:
	bts r12,4
LB_60976:
	mov rsi,1
	bt r12,4
	jc LB_60973
	mov rsi,0
	bt r10,0
	jc LB_60973
	jmp LB_60974
LB_60973:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_60974:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_60971
	btr QWORD [rdi],2
	jmp LB_60972
LB_60971:
	bts QWORD [rdi],2
LB_60972:
	mov r8,0
	bts r12,2
	ret
LB_60977:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60979
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60978
LB_60979:
	add rsp,8
	ret
LB_60981:
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
LB_60980:
	add rsp,80
	pop r14
LB_60978:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_61080
LB_61079:
	add r14,1
LB_61080:
	cmp r14,r10
	jge LB_61081
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61079
	cmp al,10
	jz LB_61079
	cmp al,32
	jz LB_61079
LB_61081:
	add r14,3
	cmp r14,r10
	jg LB_61084
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_61084
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_61084
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_61084
	jmp LB_61085
LB_61084:
	jmp LB_61058
LB_61085:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_61067
LB_61066:
	add r14,1
LB_61067:
	cmp r14,r10
	jge LB_61068
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61066
	cmp al,10
	jz LB_61066
	cmp al,32
	jz LB_61066
LB_61068:
	push r10
	call NS_E_57566_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61069
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61070:
	jmp LB_61059
LB_61069:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_61073
LB_61072:
	add r14,1
LB_61073:
	cmp r14,r10
	jge LB_61074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61072
	cmp al,10
	jz LB_61072
	cmp al,32
	jz LB_61072
LB_61074:
	push r10
	call NS_E_57849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61075
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61076
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61076:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61077
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61077:
	jmp LB_61059
LB_61075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_61064
	btr r12,2
	jmp LB_61065
LB_61064:
	bts r12,2
LB_61065:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61062
	btr r12,1
	jmp LB_61063
LB_61062:
	bts r12,1
LB_61063:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61060
	btr r12,0
	jmp LB_61061
LB_61060:
	bts r12,0
LB_61061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_61055
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_61086
	btr r12,3
	jmp LB_61087
LB_61086:
	bts r12,3
LB_61087:
	mov r14,r8
	bt r12,2
	jc LB_61088
	btr r12,1
	jmp LB_61089
LB_61088:
	bts r12,1
LB_61089:
	mov r8,r13
	bt r12,0
	jc LB_61090
	btr r12,2
	jmp LB_61091
LB_61090:
	bts r12,2
LB_61091:
	mov r13,r9
	bt r12,3
	jc LB_61092
	btr r12,0
	jmp LB_61093
LB_61092:
	bts r12,0
LB_61093:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_58159 : %_58159
 ; {>  %_58157~0':_p56236 %_58158~1':_p56239 }
; _none {  } ⊢ °1◂{  }
; _some { %_58157 %_58158 %_58159 } ⊢ %_58160 : %_58160
 ; {>  %_58157~0':_p56236 %_58159~°1◂{  }:(_opn)◂(t20699'(0)) %_58158~1':_p56239 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_58160
 ; {>  %_58160~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p56236 _p56239 (_opn)◂(t20702'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_61045
	btr r12,2
	jmp LB_61046
LB_61045:
	bts r12,2
LB_61046:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_61043
	btr QWORD [rdi],0
	jmp LB_61044
LB_61043:
	bts QWORD [rdi],0
LB_61044:
	mov r8,r14
	bt r12,1
	jc LB_61049
	btr r12,2
	jmp LB_61050
LB_61049:
	bts r12,2
LB_61050:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_61047
	btr QWORD [rdi],1
	jmp LB_61048
LB_61047:
	bts QWORD [rdi],1
LB_61048:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_61053
	mov rsi,0
	bt r8,0
	jc LB_61053
	jmp LB_61054
LB_61053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_61054:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_61051
	btr QWORD [rdi],2
	jmp LB_61052
LB_61051:
	bts QWORD [rdi],2
LB_61052:
	mov r8,0
	bts r12,2
	ret
LB_61055:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61057
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61056
LB_61057:
	add rsp,8
	ret
LB_61059:
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
LB_61058:
	add rsp,48
	pop r14
LB_61056:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57873:
NS_E_RDI_57873:
NS_E_57873_ETR_TBL:
NS_E_57873_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_61114
LB_61113:
	add r14,1
LB_61114:
	cmp r14,r10
	jge LB_61115
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61113
	cmp al,10
	jz LB_61113
	cmp al,32
	jz LB_61113
LB_61115:
	add r14,2
	cmp r14,r10
	jg LB_61118
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_61118
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_61118
	jmp LB_61119
LB_61118:
	jmp LB_61101
LB_61119:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_61108
LB_61107:
	add r14,1
LB_61108:
	cmp r14,r10
	jge LB_61109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61107
	cmp al,10
	jz LB_61107
	cmp al,32
	jz LB_61107
LB_61109:
	push r10
	call NS_E_57874_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61110
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61111
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61111:
	jmp LB_61102
LB_61110:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61105
	btr r12,1
	jmp LB_61106
LB_61105:
	bts r12,1
LB_61106:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61103
	btr r12,0
	jmp LB_61104
LB_61103:
	bts r12,0
LB_61104:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_61098
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_61120
	btr r12,2
	jmp LB_61121
LB_61120:
	bts r12,2
LB_61121:
	mov r13,r14
	bt r12,1
	jc LB_61122
	btr r12,0
	jmp LB_61123
LB_61122:
	bts r12,0
LB_61123:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56269 %_58161 ⊢ %_58162 : %_58162
 ; {>  %_58161~0':_p56229 }
; _f56269 0' ⊢ °0◂0'
; _some %_58162 ⊢ %_58163 : %_58163
 ; {>  %_58162~°0◂0':_p56228 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58163
 ; {>  %_58163~°0◂°0◂0':(_opn)◂(_p56228) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61096
	btr r12,3
	jmp LB_61097
LB_61096:
	bts r12,3
LB_61097:
	mov rsi,1
	bt r12,3
	jc LB_61094
	mov rsi,0
	bt r9,0
	jc LB_61094
	jmp LB_61095
LB_61094:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61095:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61098:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61100
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61099
LB_61100:
	add rsp,8
	ret
LB_61102:
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
LB_61101:
	add rsp,32
	pop r14
LB_61099:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_61143
LB_61142:
	add r14,1
LB_61143:
	cmp r14,r10
	jge LB_61144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61142
	cmp al,10
	jz LB_61142
	cmp al,32
	jz LB_61142
LB_61144:
	push r10
	call NS_E_57875_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61145
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61137
LB_61145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_61148
LB_61147:
	add r14,1
LB_61148:
	cmp r14,r10
	jge LB_61149
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61147
	cmp al,10
	jz LB_61147
	cmp al,32
	jz LB_61147
LB_61149:
	push r10
	call NS_E_57873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61150
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61151
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61151:
	jmp LB_61137
LB_61150:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61140
	btr r12,1
	jmp LB_61141
LB_61140:
	bts r12,1
LB_61141:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61138
	btr r12,0
	jmp LB_61139
LB_61138:
	bts r12,0
LB_61139:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_61134
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56270 { %_58164 %_58165 } ⊢ %_58166 : %_58166
 ; {>  %_58164~0':_p56230 %_58165~1':_p56228 }
; _f56270 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_58166 ⊢ %_58167 : %_58167
 ; {>  %_58166~°1◂{ 0' 1' }:_p56228 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_58167
 ; {>  %_58167~°0◂°1◂{ 0' 1' }:(_opn)◂(_p56228) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_61128
	btr r12,2
	jmp LB_61129
LB_61128:
	bts r12,2
LB_61129:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_61126
	btr QWORD [rdi],0
	jmp LB_61127
LB_61126:
	bts QWORD [rdi],0
LB_61127:
	mov r8,r14
	bt r12,1
	jc LB_61132
	btr r12,2
	jmp LB_61133
LB_61132:
	bts r12,2
LB_61133:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_61130
	btr QWORD [rdi],1
	jmp LB_61131
LB_61130:
	bts QWORD [rdi],1
LB_61131:
	mov rsi,1
	bt r12,3
	jc LB_61124
	mov rsi,0
	bt r9,0
	jc LB_61124
	jmp LB_61125
LB_61124:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61125:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61134:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61136
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61135
LB_61136:
	add rsp,8
	ret
LB_61137:
	add rsp,32
	pop r14
LB_61135:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_61155
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f56271 {  } ⊢ %_58168 : %_58168
 ; {>  }
; _f56271 {  } ⊢ °2◂{  }
; _some %_58168 ⊢ %_58169 : %_58169
 ; {>  %_58168~°2◂{  }:_p56228 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_58169
 ; {>  %_58169~°0◂°2◂{  }:(_opn)◂(_p56228) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_61153
	mov rsi,0
	bt r9,0
	jc LB_61153
	jmp LB_61154
LB_61153:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61154:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61155:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61157
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61156
LB_61157:
	add rsp,8
	ret
LB_61158:
	add rsp,0
	pop r14
LB_61156:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57874:
NS_E_RDI_57874:
NS_E_57874_ETR_TBL:
NS_E_57874_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_61178
LB_61177:
	add r14,1
LB_61178:
	cmp r14,r10
	jge LB_61179
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61177
	cmp al,10
	jz LB_61177
	cmp al,32
	jz LB_61177
LB_61179:
	push r10
	call NS_E_57875_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61180
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61172
LB_61180:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_61183
LB_61182:
	add r14,1
LB_61183:
	cmp r14,r10
	jge LB_61184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61182
	cmp al,10
	jz LB_61182
	cmp al,32
	jz LB_61182
LB_61184:
	push r10
	call NS_E_57874_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61185
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61186:
	jmp LB_61172
LB_61185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61175
	btr r12,1
	jmp LB_61176
LB_61175:
	bts r12,1
LB_61176:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61173
	btr r12,0
	jmp LB_61174
LB_61173:
	bts r12,0
LB_61174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_61169
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56272 { %_58170 %_58171 } ⊢ %_58172 : %_58172
 ; {>  %_58171~1':_p56229 %_58170~0':_p56230 }
; _f56272 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_58172 ⊢ %_58173 : %_58173
 ; {>  %_58172~°0◂{ 0' 1' }:_p56229 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_58173
 ; {>  %_58173~°0◂°0◂{ 0' 1' }:(_opn)◂(_p56229) }
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
	jc LB_61163
	btr r12,2
	jmp LB_61164
LB_61163:
	bts r12,2
LB_61164:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_61161
	btr QWORD [rdi],0
	jmp LB_61162
LB_61161:
	bts QWORD [rdi],0
LB_61162:
	mov r8,r14
	bt r12,1
	jc LB_61167
	btr r12,2
	jmp LB_61168
LB_61167:
	bts r12,2
LB_61168:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_61165
	btr QWORD [rdi],1
	jmp LB_61166
LB_61165:
	bts QWORD [rdi],1
LB_61166:
	mov rsi,1
	bt r12,3
	jc LB_61159
	mov rsi,0
	bt r9,0
	jc LB_61159
	jmp LB_61160
LB_61159:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61160:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61169:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61171
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61170
LB_61171:
	add rsp,8
	ret
LB_61172:
	add rsp,32
	pop r14
LB_61170:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_61190
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f56273 {  } ⊢ %_58174 : %_58174
 ; {>  }
; _f56273 {  } ⊢ °1◂{  }
; _some %_58174 ⊢ %_58175 : %_58175
 ; {>  %_58174~°1◂{  }:_p56229 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58175
 ; {>  %_58175~°0◂°1◂{  }:(_opn)◂(_p56229) }
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
	jc LB_61188
	mov rsi,0
	bt r9,0
	jc LB_61188
	jmp LB_61189
LB_61188:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61189:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61190:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61192
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61191
LB_61192:
	add rsp,8
	ret
LB_61193:
	add rsp,0
	pop r14
LB_61191:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57875:
NS_E_RDI_57875:
NS_E_57875_ETR_TBL:
NS_E_57875_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_61209
LB_61208:
	add r14,1
LB_61209:
	cmp r14,r10
	jge LB_61210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61208
	cmp al,10
	jz LB_61208
	cmp al,32
	jz LB_61208
LB_61210:
	add r14,3
	cmp r14,r10
	jg LB_61213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_61213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_61213
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_61213
	jmp LB_61214
LB_61213:
	jmp LB_61201
LB_61214:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_61216
LB_61215:
	add r14,1
LB_61216:
	cmp r14,r10
	jge LB_61217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61215
	cmp al,10
	jz LB_61215
	cmp al,32
	jz LB_61215
LB_61217:
	push r10
	call NS_E_57876_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61219:
	jmp LB_61201
LB_61218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_61222
LB_61221:
	add r14,1
LB_61222:
	cmp r14,r10
	jge LB_61223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61221
	cmp al,10
	jz LB_61221
	cmp al,32
	jz LB_61221
LB_61223:
	add r14,3
	cmp r14,r10
	jg LB_61228
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_61228
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_61228
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_61228
	jmp LB_61229
LB_61228:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61225
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61225:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61226
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61226:
	jmp LB_61201
LB_61229:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_61206
	btr r12,2
	jmp LB_61207
LB_61206:
	bts r12,2
LB_61207:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61204
	btr r12,1
	jmp LB_61205
LB_61204:
	bts r12,1
LB_61205:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61202
	btr r12,0
	jmp LB_61203
LB_61202:
	bts r12,0
LB_61203:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_61198
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_61230
	btr r12,3
	jmp LB_61231
LB_61230:
	bts r12,3
LB_61231:
	mov r13,r14
	bt r12,1
	jc LB_61232
	btr r12,0
	jmp LB_61233
LB_61232:
	bts r12,0
LB_61233:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56274 %_58176 ⊢ %_58177 : %_58177
 ; {>  %_58176~0':_p56231 }
; _f56274 0' ⊢ °0◂0'
; _some %_58177 ⊢ %_58178 : %_58178
 ; {>  %_58177~°0◂0':_p56230 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58178
 ; {>  %_58178~°0◂°0◂0':(_opn)◂(_p56230) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61196
	btr r12,3
	jmp LB_61197
LB_61196:
	bts r12,3
LB_61197:
	mov rsi,1
	bt r12,3
	jc LB_61194
	mov rsi,0
	bt r9,0
	jc LB_61194
	jmp LB_61195
LB_61194:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61195:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61198:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61200
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61199
LB_61200:
	add rsp,8
	ret
LB_61201:
	add rsp,48
	pop r14
LB_61199:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_61245
LB_61244:
	add r14,1
LB_61245:
	cmp r14,r10
	jge LB_61246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61244
	cmp al,10
	jz LB_61244
	cmp al,32
	jz LB_61244
LB_61246:
	push r10
	call NS_E_57876_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61241
LB_61247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61242
	btr r12,0
	jmp LB_61243
LB_61242:
	bts r12,0
LB_61243:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61238
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56275 %_58179 ⊢ %_58180 : %_58180
 ; {>  %_58179~0':_p56231 }
; _f56275 0' ⊢ °1◂0'
; _some %_58180 ⊢ %_58181 : %_58181
 ; {>  %_58180~°1◂0':_p56230 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_58181
 ; {>  %_58181~°0◂°1◂0':(_opn)◂(_p56230) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61236
	btr r12,3
	jmp LB_61237
LB_61236:
	bts r12,3
LB_61237:
	mov rsi,1
	bt r12,3
	jc LB_61234
	mov rsi,0
	bt r9,0
	jc LB_61234
	jmp LB_61235
LB_61234:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61235:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61238:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61240
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61239
LB_61240:
	add rsp,8
	ret
LB_61241:
	add rsp,16
	pop r14
LB_61239:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57876:
NS_E_RDI_57876:
NS_E_57876_ETR_TBL:
NS_E_57876_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_61260
LB_61259:
	add r14,1
LB_61260:
	cmp r14,r10
	jge LB_61261
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61259
	cmp al,10
	jz LB_61259
	cmp al,32
	jz LB_61259
LB_61261:
	push r10
	call NS_E_55659_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61262
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61256
LB_61262:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61257
	btr r12,0
	jmp LB_61258
LB_61257:
	bts r12,0
LB_61258:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61253
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56277 %_58182 ⊢ %_58183 : %_58183
 ; {>  %_58182~0':_stg }
; _f56277 0' ⊢ °1◂0'
; _some %_58183 ⊢ %_58184 : %_58184
 ; {>  %_58183~°1◂0':_p56231 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_58184
 ; {>  %_58184~°0◂°1◂0':(_opn)◂(_p56231) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61251
	btr r12,3
	jmp LB_61252
LB_61251:
	bts r12,3
LB_61252:
	mov rsi,1
	bt r12,3
	jc LB_61249
	mov rsi,0
	bt r9,0
	jc LB_61249
	jmp LB_61250
LB_61249:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61250:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61253:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61255
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61254
LB_61255:
	add rsp,8
	ret
LB_61256:
	add rsp,16
	pop r14
LB_61254:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_61275
LB_61274:
	add r14,1
LB_61275:
	cmp r14,r10
	jge LB_61276
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61274
	cmp al,10
	jz LB_61274
	cmp al,32
	jz LB_61274
LB_61276:
	push r10
	call NS_E_57107_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61277
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61271
LB_61277:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61272
	btr r12,0
	jmp LB_61273
LB_61272:
	bts r12,0
LB_61273:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61268
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f56276 %_58185 ⊢ %_58186 : %_58186
 ; {>  %_58185~0':_p56214 }
; _f56276 0' ⊢ °0◂0'
; _some %_58186 ⊢ %_58187 : %_58187
 ; {>  %_58186~°0◂0':_p56231 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58187
 ; {>  %_58187~°0◂°0◂0':(_opn)◂(_p56231) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61266
	btr r12,3
	jmp LB_61267
LB_61266:
	bts r12,3
LB_61267:
	mov rsi,1
	bt r12,3
	jc LB_61264
	mov rsi,0
	bt r9,0
	jc LB_61264
	jmp LB_61265
LB_61264:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61265:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61268:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61270
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61269
LB_61270:
	add rsp,8
	ret
LB_61271:
	add rsp,16
	pop r14
LB_61269:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57877:
NS_E_RDI_57877:
NS_E_57877_ETR_TBL:
NS_E_57877_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_61288
LB_61287:
	add r14,1
LB_61288:
	cmp r14,r10
	jge LB_61289
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61287
	cmp al,10
	jz LB_61287
	cmp al,32
	jz LB_61287
LB_61289:
	add r14,4
	cmp r14,r10
	jg LB_61292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_61292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_61292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_61292
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_61292
	jmp LB_61293
LB_61292:
	jmp LB_61284
LB_61293:
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
	jc LB_61285
	btr r12,0
	jmp LB_61286
LB_61285:
	bts r12,0
LB_61286:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61281
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56267 {  } ⊢ %_58188 : %_58188
 ; {>  }
; _f56267 {  } ⊢ °1◂{  }
; _some %_58188 ⊢ %_58189 : %_58189
 ; {>  %_58188~°1◂{  }:_p56227 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58189
 ; {>  %_58189~°0◂°1◂{  }:(_opn)◂(_p56227) }
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
	jc LB_61279
	mov rsi,0
	bt r9,0
	jc LB_61279
	jmp LB_61280
LB_61279:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61280:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61281:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61283
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61282
LB_61283:
	add rsp,8
	ret
LB_61284:
	add rsp,16
	pop r14
LB_61282:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_61303
LB_61302:
	add r14,1
LB_61303:
	cmp r14,r10
	jge LB_61304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61302
	cmp al,10
	jz LB_61302
	cmp al,32
	jz LB_61302
LB_61304:
	add r14,4
	cmp r14,r10
	jg LB_61307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_61307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_61307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_61307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_61307
	jmp LB_61308
LB_61307:
	jmp LB_61299
LB_61308:
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
	jc LB_61300
	btr r12,0
	jmp LB_61301
LB_61300:
	bts r12,0
LB_61301:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61296
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56268 {  } ⊢ %_58190 : %_58190
 ; {>  }
; _f56268 {  } ⊢ °2◂{  }
; _some %_58190 ⊢ %_58191 : %_58191
 ; {>  %_58190~°2◂{  }:_p56227 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_58191
 ; {>  %_58191~°0◂°2◂{  }:(_opn)◂(_p56227) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_61294
	mov rsi,0
	bt r9,0
	jc LB_61294
	jmp LB_61295
LB_61294:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61295:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61296:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61298
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61297
LB_61298:
	add rsp,8
	ret
LB_61299:
	add rsp,16
	pop r14
LB_61297:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_61318
LB_61317:
	add r14,1
LB_61318:
	cmp r14,r10
	jge LB_61319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61317
	cmp al,10
	jz LB_61317
	cmp al,32
	jz LB_61317
LB_61319:
	add r14,3
	cmp r14,r10
	jg LB_61322
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_61322
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_61322
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_61322
	jmp LB_61323
LB_61322:
	jmp LB_61314
LB_61323:
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
	jc LB_61315
	btr r12,0
	jmp LB_61316
LB_61315:
	bts r12,0
LB_61316:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61311
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56266 {  } ⊢ %_58192 : %_58192
 ; {>  }
; _f56266 {  } ⊢ °0◂{  }
; _some %_58192 ⊢ %_58193 : %_58193
 ; {>  %_58192~°0◂{  }:_p56227 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_58193
 ; {>  %_58193~°0◂°0◂{  }:(_opn)◂(_p56227) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_61309
	mov rsi,0
	bt r9,0
	jc LB_61309
	jmp LB_61310
LB_61309:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61310:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61311:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61313
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61312
LB_61313:
	add rsp,8
	ret
LB_61314:
	add rsp,16
	pop r14
LB_61312:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57878:
NS_E_RDI_57878:
NS_E_57878_ETR_TBL:
NS_E_57878_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_61333
LB_61332:
	add r14,1
LB_61333:
	cmp r14,r10
	jge LB_61334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61332
	cmp al,10
	jz LB_61332
	cmp al,32
	jz LB_61332
LB_61334:
	add r14,5
	cmp r14,r10
	jg LB_61337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_61337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_61337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_61337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_61337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_61337
	jmp LB_61338
LB_61337:
	jmp LB_61329
LB_61338:
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
	jc LB_61330
	btr r12,0
	jmp LB_61331
LB_61330:
	bts r12,0
LB_61331:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61326
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56267 {  } ⊢ %_58194 : %_58194
 ; {>  }
; _f56267 {  } ⊢ °1◂{  }
; _some %_58194 ⊢ %_58195 : %_58195
 ; {>  %_58194~°1◂{  }:_p56227 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58195
 ; {>  %_58195~°0◂°1◂{  }:(_opn)◂(_p56227) }
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
	jc LB_61324
	mov rsi,0
	bt r9,0
	jc LB_61324
	jmp LB_61325
LB_61324:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61325:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61326:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61328
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61327
LB_61328:
	add rsp,8
	ret
LB_61329:
	add rsp,16
	pop r14
LB_61327:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_61348
LB_61347:
	add r14,1
LB_61348:
	cmp r14,r10
	jge LB_61349
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61347
	cmp al,10
	jz LB_61347
	cmp al,32
	jz LB_61347
LB_61349:
	add r14,5
	cmp r14,r10
	jg LB_61352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_61352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_61352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_61352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_61352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_61352
	jmp LB_61353
LB_61352:
	jmp LB_61344
LB_61353:
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
	jc LB_61345
	btr r12,0
	jmp LB_61346
LB_61345:
	bts r12,0
LB_61346:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61341
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56268 {  } ⊢ %_58196 : %_58196
 ; {>  }
; _f56268 {  } ⊢ °2◂{  }
; _some %_58196 ⊢ %_58197 : %_58197
 ; {>  %_58196~°2◂{  }:_p56227 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_58197
 ; {>  %_58197~°0◂°2◂{  }:(_opn)◂(_p56227) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_61339
	mov rsi,0
	bt r9,0
	jc LB_61339
	jmp LB_61340
LB_61339:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61340:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61341:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61343
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61342
LB_61343:
	add rsp,8
	ret
LB_61344:
	add rsp,16
	pop r14
LB_61342:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_61363
LB_61362:
	add r14,1
LB_61363:
	cmp r14,r10
	jge LB_61364
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61362
	cmp al,10
	jz LB_61362
	cmp al,32
	jz LB_61362
LB_61364:
	add r14,4
	cmp r14,r10
	jg LB_61367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_61367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_61367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_61367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_61367
	jmp LB_61368
LB_61367:
	jmp LB_61359
LB_61368:
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
	jc LB_61360
	btr r12,0
	jmp LB_61361
LB_61360:
	bts r12,0
LB_61361:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_61356
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f56266 {  } ⊢ %_58198 : %_58198
 ; {>  }
; _f56266 {  } ⊢ °0◂{  }
; _some %_58198 ⊢ %_58199 : %_58199
 ; {>  %_58198~°0◂{  }:_p56227 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_58199
 ; {>  %_58199~°0◂°0◂{  }:(_opn)◂(_p56227) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_61354
	mov rsi,0
	bt r9,0
	jc LB_61354
	jmp LB_61355
LB_61354:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61355:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61358
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61357
LB_61358:
	add rsp,8
	ret
LB_61359:
	add rsp,16
	pop r14
LB_61357:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57879:
NS_E_RDI_57879:
NS_E_57879_ETR_TBL:
NS_E_57879_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_61424
LB_61423:
	add r14,1
LB_61424:
	cmp r14,r10
	jge LB_61425
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61423
	cmp al,10
	jz LB_61423
	cmp al,32
	jz LB_61423
LB_61425:
	push r10
	call NS_E_57878_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61426
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61392
LB_61426:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_61403
LB_61402:
	add r14,1
LB_61403:
	cmp r14,r10
	jge LB_61404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61402
	cmp al,10
	jz LB_61402
	cmp al,32
	jz LB_61402
LB_61404:
	push r10
	call NS_E_57881_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61405
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61406:
	jmp LB_61393
LB_61405:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_61409
LB_61408:
	add r14,1
LB_61409:
	cmp r14,r10
	jge LB_61410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61408
	cmp al,10
	jz LB_61408
	cmp al,32
	jz LB_61408
LB_61410:
	push r10
	call NS_E_57873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61411
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61412
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61412:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61413:
	jmp LB_61393
LB_61411:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_61416
LB_61415:
	add r14,1
LB_61416:
	cmp r14,r10
	jge LB_61417
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61415
	cmp al,10
	jz LB_61415
	cmp al,32
	jz LB_61415
LB_61417:
	push r10
	call NS_E_57880_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61418
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_61419
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_61419:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61420
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61420:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61421
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61421:
	jmp LB_61393
LB_61418:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_61400
	btr r12,3
	jmp LB_61401
LB_61400:
	bts r12,3
LB_61401:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_61398
	btr r12,2
	jmp LB_61399
LB_61398:
	bts r12,2
LB_61399:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61396
	btr r12,1
	jmp LB_61397
LB_61396:
	bts r12,1
LB_61397:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61394
	btr r12,0
	jmp LB_61395
LB_61394:
	bts r12,0
LB_61395:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_61389
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f56263 { %_58201 %_58200 %_58202 %_58203 } ⊢ %_58204 : %_58204
 ; {>  %_58201~1':(_opn)◂(_stg) %_58202~2':_p56228 %_58200~0':_p56227 %_58203~3':(_opn)◂(_p56225) }
; _f56263 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_58204 ⊢ %_58205 : %_58205
 ; {>  %_58204~°1◂{ 1' 0' 2' 3' }:_p56225 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_58205
 ; {>  %_58205~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p56225) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_61369
	btr r12,4
	jmp LB_61370
LB_61369:
	bts r12,4
LB_61370:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_61375
	btr r12,5
	jmp LB_61376
LB_61375:
	bts r12,5
LB_61376:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_61373
	btr QWORD [rdi],0
	jmp LB_61374
LB_61373:
	bts QWORD [rdi],0
LB_61374:
	mov r11,r13
	bt r12,0
	jc LB_61379
	btr r12,5
	jmp LB_61380
LB_61379:
	bts r12,5
LB_61380:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_61377
	btr QWORD [rdi],1
	jmp LB_61378
LB_61377:
	bts QWORD [rdi],1
LB_61378:
	mov r11,r8
	bt r12,2
	jc LB_61383
	btr r12,5
	jmp LB_61384
LB_61383:
	bts r12,5
LB_61384:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_61381
	btr QWORD [rdi],2
	jmp LB_61382
LB_61381:
	bts QWORD [rdi],2
LB_61382:
	mov r11,r10
	bt r12,4
	jc LB_61387
	btr r12,5
	jmp LB_61388
LB_61387:
	bts r12,5
LB_61388:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_61385
	btr QWORD [rdi],3
	jmp LB_61386
LB_61385:
	bts QWORD [rdi],3
LB_61386:
	mov rsi,1
	bt r12,3
	jc LB_61371
	mov rsi,0
	bt r9,0
	jc LB_61371
	jmp LB_61372
LB_61371:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61372:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61389:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61391
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61390
LB_61391:
	add rsp,8
	ret
LB_61393:
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
LB_61392:
	add rsp,64
	pop r14
LB_61390:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; grm_ord
	jmp LB_61467
LB_61466:
	add r14,1
LB_61467:
	cmp r14,r10
	jge LB_61468
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61466
	cmp al,10
	jz LB_61466
	cmp al,32
	jz LB_61466
LB_61468:
	push r10
	call NS_E_57877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61469
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61455
LB_61469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_61472
LB_61471:
	add r14,1
LB_61472:
	cmp r14,r10
	jge LB_61473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61471
	cmp al,10
	jz LB_61471
	cmp al,32
	jz LB_61471
LB_61473:
	push r10
	call NS_E_57881_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61474
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61475
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61475:
	jmp LB_61455
LB_61474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_61478
LB_61477:
	add r14,1
LB_61478:
	cmp r14,r10
	jge LB_61479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61477
	cmp al,10
	jz LB_61477
	cmp al,32
	jz LB_61477
LB_61479:
	push r10
	call NS_E_57873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61480
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61481
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61481:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61482
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61482:
	jmp LB_61455
LB_61480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_61485
LB_61484:
	add r14,1
LB_61485:
	cmp r14,r10
	jge LB_61486
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61484
	cmp al,10
	jz LB_61484
	cmp al,32
	jz LB_61484
LB_61486:
	push r10
	call NS_E_57880_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61487
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_61488
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_61488:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61489
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61489:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61490:
	jmp LB_61455
LB_61487:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_61493
LB_61492:
	add r14,1
LB_61493:
	cmp r14,r10
	jge LB_61494
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61492
	cmp al,10
	jz LB_61492
	cmp al,32
	jz LB_61492
LB_61494:
	push r10
	call NS_E_57879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61495
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_61496
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_61496:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_61497
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_61497:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_61498
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_61498:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61499
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61499:
	jmp LB_61455
LB_61495:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_61464
	btr r12,4
	jmp LB_61465
LB_61464:
	bts r12,4
LB_61465:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_61462
	btr r12,3
	jmp LB_61463
LB_61462:
	bts r12,3
LB_61463:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_61460
	btr r12,2
	jmp LB_61461
LB_61460:
	bts r12,2
LB_61461:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61458
	btr r12,1
	jmp LB_61459
LB_61458:
	bts r12,1
LB_61459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61456
	btr r12,0
	jmp LB_61457
LB_61456:
	bts r12,0
LB_61457:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_61452
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f56262 { %_58207 %_58206 %_58208 %_58209 %_58210 } ⊢ %_58211 : %_58211
 ; {>  %_58210~4':_p56225 %_58206~0':_p56227 %_58208~2':_p56228 %_58207~1':(_opn)◂(_stg) %_58209~3':(_opn)◂(_p56225) }
; _f56262 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_58211 ⊢ %_58212 : %_58212
 ; {>  %_58211~°0◂{ 1' 0' 2' 3' 4' }:_p56225 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_58212
 ; {>  %_58212~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p56225) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_61428
	btr r12,5
	jmp LB_61429
LB_61428:
	bts r12,5
LB_61429:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_61434
	btr r12,6
	jmp LB_61435
LB_61434:
	bts r12,6
LB_61435:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_61432
	btr QWORD [rdi],0
	jmp LB_61433
LB_61432:
	bts QWORD [rdi],0
LB_61433:
	mov rcx,r13
	bt r12,0
	jc LB_61438
	btr r12,6
	jmp LB_61439
LB_61438:
	bts r12,6
LB_61439:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_61436
	btr QWORD [rdi],1
	jmp LB_61437
LB_61436:
	bts QWORD [rdi],1
LB_61437:
	mov rcx,r8
	bt r12,2
	jc LB_61442
	btr r12,6
	jmp LB_61443
LB_61442:
	bts r12,6
LB_61443:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_61440
	btr QWORD [rdi],2
	jmp LB_61441
LB_61440:
	bts QWORD [rdi],2
LB_61441:
	mov rcx,r11
	bt r12,5
	jc LB_61446
	btr r12,6
	jmp LB_61447
LB_61446:
	bts r12,6
LB_61447:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_61444
	btr QWORD [rdi],3
	jmp LB_61445
LB_61444:
	bts QWORD [rdi],3
LB_61445:
	mov rcx,r10
	bt r12,4
	jc LB_61450
	btr r12,6
	jmp LB_61451
LB_61450:
	bts r12,6
LB_61451:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_61448
	btr QWORD [rdi],4
	jmp LB_61449
LB_61448:
	bts QWORD [rdi],4
LB_61449:
	mov rsi,1
	bt r12,3
	jc LB_61430
	mov rsi,0
	bt r9,0
	jc LB_61430
	jmp LB_61431
LB_61430:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61431:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61452:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61454
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61453
LB_61454:
	add rsp,8
	ret
LB_61455:
	add rsp,80
	pop r14
LB_61453:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57880:
NS_E_RDI_57880:
NS_E_57880_ETR_TBL:
NS_E_57880_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_61514
LB_61513:
	add r14,1
LB_61514:
	cmp r14,r10
	jge LB_61515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61513
	cmp al,10
	jz LB_61513
	cmp al,32
	jz LB_61513
LB_61515:
	add r14,1
	cmp r14,r10
	jg LB_61518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_61518
	jmp LB_61519
LB_61518:
	jmp LB_61508
LB_61519:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_61521
LB_61520:
	add r14,1
LB_61521:
	cmp r14,r10
	jge LB_61522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61520
	cmp al,10
	jz LB_61520
	cmp al,32
	jz LB_61520
LB_61522:
	push r10
	call NS_E_57879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61523
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61524:
	jmp LB_61508
LB_61523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61511
	btr r12,1
	jmp LB_61512
LB_61511:
	bts r12,1
LB_61512:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61509
	btr r12,0
	jmp LB_61510
LB_61509:
	bts r12,0
LB_61510:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_61505
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_61526
	btr r12,2
	jmp LB_61527
LB_61526:
	bts r12,2
LB_61527:
	mov r13,r14
	bt r12,1
	jc LB_61528
	btr r12,0
	jmp LB_61529
LB_61528:
	bts r12,0
LB_61529:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_58213 ⊢ %_58214 : %_58214
 ; {>  %_58213~0':_p56225 }
; _some 0' ⊢ °0◂0'
; _some %_58214 ⊢ %_58215 : %_58215
 ; {>  %_58214~°0◂0':(_opn)◂(_p56225) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58215
 ; {>  %_58215~°0◂°0◂0':(_opn)◂((_opn)◂(_p56225)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61503
	btr r12,3
	jmp LB_61504
LB_61503:
	bts r12,3
LB_61504:
	mov rsi,1
	bt r12,3
	jc LB_61501
	mov rsi,0
	bt r9,0
	jc LB_61501
	jmp LB_61502
LB_61501:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61502:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61505:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61507
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61506
LB_61507:
	add rsp,8
	ret
LB_61508:
	add rsp,32
	pop r14
LB_61506:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_61532
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_58216 : %_58216
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_58216 ⊢ %_58217 : %_58217
 ; {>  %_58216~°1◂{  }:(_opn)◂(t20780'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58217
 ; {>  %_58217~°0◂°1◂{  }:(_opn)◂((_opn)◂(t20783'(0))) }
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
	jc LB_61530
	mov rsi,0
	bt r9,0
	jc LB_61530
	jmp LB_61531
LB_61530:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61531:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61532:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61534
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61533
LB_61534:
	add rsp,8
	ret
LB_61535:
	add rsp,0
	pop r14
LB_61533:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57881:
NS_E_RDI_57881:
NS_E_57881_ETR_TBL:
NS_E_57881_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_61549
LB_61548:
	add r14,1
LB_61549:
	cmp r14,r10
	jge LB_61550
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61548
	cmp al,10
	jz LB_61548
	cmp al,32
	jz LB_61548
LB_61550:
	push r10
	call NS_E_56027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_61551
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61543
LB_61551:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_61554
LB_61553:
	add r14,1
LB_61554:
	cmp r14,r10
	jge LB_61555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_61553
	cmp al,10
	jz LB_61553
	cmp al,32
	jz LB_61553
LB_61555:
	add r14,1
	cmp r14,r10
	jg LB_61559
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_61559
	jmp LB_61560
LB_61559:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_61557
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_61557:
	jmp LB_61543
LB_61560:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_61546
	btr r12,1
	jmp LB_61547
LB_61546:
	bts r12,1
LB_61547:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_61544
	btr r12,0
	jmp LB_61545
LB_61544:
	bts r12,0
LB_61545:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_61540
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_58218 ⊢ %_58219 : %_58219
 ; {>  %_58218~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_58219 ⊢ %_58220 : %_58220
 ; {>  %_58219~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_58220
 ; {>  %_58220~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_61538
	btr r12,3
	jmp LB_61539
LB_61538:
	bts r12,3
LB_61539:
	mov rsi,1
	bt r12,3
	jc LB_61536
	mov rsi,0
	bt r9,0
	jc LB_61536
	jmp LB_61537
LB_61536:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61537:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61540:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61542
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61541
LB_61542:
	add rsp,8
	ret
LB_61543:
	add rsp,32
	pop r14
LB_61541:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_61563
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_58221 : %_58221
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_58221 ⊢ %_58222 : %_58222
 ; {>  %_58221~°1◂{  }:(_opn)◂(t20792'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_58222
 ; {>  %_58222~°0◂°1◂{  }:(_opn)◂((_opn)◂(t20795'(0))) }
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
	jc LB_61561
	mov rsi,0
	bt r9,0
	jc LB_61561
	jmp LB_61562
LB_61561:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61562:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_61563:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_61565
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_61564
LB_61565:
	add rsp,8
	ret
LB_61566:
	add rsp,0
	pop r14
LB_61564:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_61604:
NS_E_RDI_61604:
; » _^ ..
	mov rax,104
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
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_61568 : %_61568
 ; {>  %_61567~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_61568
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_61569 : %_61569
 ; {>  %_61568~1':_r64 %_61567~0':_stg }
; 	» _args _ ⊢ 2' : %_61569
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
MTC_LB_61605:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61606
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
	jnc LB_61607
	bt QWORD [rax],0
	jc LB_61608
	btr r12,5
	jmp LB_61609
LB_61608:
	bts r12,5
LB_61609:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61607:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_61612
	btr r12,6
	jmp LB_61613
LB_61612:
	bts r12,6
LB_61613:
	mov r9,rcx
	bt r12,6
	jc LB_61610
	btr r12,3
	jmp LB_61611
LB_61610:
	bts r12,3
LB_61611:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_61616
	btr r12,6
	jmp LB_61617
LB_61616:
	bts r12,6
LB_61617:
	mov r10,rcx
	bt r12,6
	jc LB_61614
	btr r12,4
	jmp LB_61615
LB_61614:
	bts r12,4
LB_61615:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61606
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
	jnc LB_61618
	bt QWORD [rax],0
	jc LB_61619
	btr r12,7
	jmp LB_61620
LB_61619:
	bts r12,7
LB_61620:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61618:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_61623
	btr r12,8
	jmp LB_61624
LB_61623:
	bts r12,8
LB_61624:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61621
	btr r12,5
	jmp LB_61622
LB_61621:
	bts r12,5
LB_61622:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_61627
	btr r12,8
	jmp LB_61628
LB_61627:
	bts r12,8
LB_61628:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61625
	btr r12,6
	jmp LB_61626
LB_61625:
	bts r12,6
LB_61626:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_61606
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_61629
	bt QWORD [rax],0
	jc LB_61630
	btr r12,7
	jmp LB_61631
LB_61630:
	bts r12,7
LB_61631:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61629:
	mov rdx,rax
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_61632:
	cmp r15,0
	jz LB_61633
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61632
LB_61633:
; _f25 %_61572 ⊢ { %_61574 %_61575 } : { %_61574 %_61575 }
 ; {>  %_61570~3':_stg %_61568~1':_r64 %_61572~5':_stg %_61567~0':_stg }
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
	jc LB_61640
	btr r12,0
	jmp LB_61641
LB_61640:
	bts r12,0
LB_61641:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_61642
	btr r12,2
	jmp LB_61643
LB_61642:
	bts r12,2
LB_61643:
	mov r10,r14
	bt r12,1
	jc LB_61644
	btr r12,4
	jmp LB_61645
LB_61644:
	bts r12,4
LB_61645:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_61638
	btr r12,3
	jmp LB_61639
LB_61638:
	bts r12,3
LB_61639:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61636
	btr r12,1
	jmp LB_61637
LB_61636:
	bts r12,1
LB_61637:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61634
	btr r12,0
	jmp LB_61635
LB_61634:
	bts r12,0
LB_61635:
	add rsp,32
; _f57042 %_61575 ⊢ { %_61576 %_61577 } : { %_61576 %_61577 }
 ; {>  %_61570~3':_stg %_61568~1':_r64 %_61575~4':_stg %_61567~0':_stg %_61574~2':_stg }
; _f57042 4' ⊢ { 4' 5' }
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
	jc LB_61654
	btr r12,0
	jmp LB_61655
LB_61654:
	bts r12,0
LB_61655:
	call NS_E_57042
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_61656
	btr r12,4
	jmp LB_61657
LB_61656:
	bts r12,4
LB_61657:
	mov r11,r14
	bt r12,1
	jc LB_61658
	btr r12,5
	jmp LB_61659
LB_61658:
	bts r12,5
LB_61659:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61652
	btr r12,3
	jmp LB_61653
LB_61652:
	bts r12,3
LB_61653:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61650
	btr r12,2
	jmp LB_61651
LB_61650:
	bts r12,2
LB_61651:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61648
	btr r12,1
	jmp LB_61649
LB_61648:
	bts r12,1
LB_61649:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61646
	btr r12,0
	jmp LB_61647
LB_61646:
	bts r12,0
LB_61647:
	add rsp,40
MTC_LB_61660:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61661
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
	jnc LB_61662
	bt QWORD [rax],0
	jc LB_61663
	btr r12,7
	jmp LB_61664
LB_61663:
	bts r12,7
LB_61664:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61662:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_61665
	btr r12,6
	jmp LB_61666
LB_61665:
	bts r12,6
LB_61666:
LB_61667:
	cmp r15,0
	jz LB_61668
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61667
LB_61668:
; » 0xr0 |~ {  } ⊢ %_61579 : %_61579
 ; {>  %_61578~6':_stg %_61576~4':_stg %_61570~3':_stg %_61568~1':_r64 %_61567~0':_stg %_61574~2':_stg }
; 	» 0xr0 _ ⊢ 5' : %_61579
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f57835 { %_61578 %_61579 } ⊢ { %_61580 %_61581 %_61582 } : { %_61580 %_61581 %_61582 }
 ; {>  %_61578~6':_stg %_61576~4':_stg %_61570~3':_stg %_61568~1':_r64 %_61579~5':_r64 %_61567~0':_stg %_61574~2':_stg }
; _f57835 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_61679
	btr r12,0
	jmp LB_61680
LB_61679:
	bts r12,0
LB_61680:
	mov r14,r11
	bt r12,5
	jc LB_61681
	btr r12,1
	jmp LB_61682
LB_61681:
	bts r12,1
LB_61682:
	call NS_E_57835
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_61683
	btr r12,5
	jmp LB_61684
LB_61683:
	bts r12,5
LB_61684:
	mov rcx,r14
	bt r12,1
	jc LB_61685
	btr r12,6
	jmp LB_61686
LB_61685:
	bts r12,6
LB_61686:
	mov rdx,r9
	bt r12,3
	jc LB_61689
	btr r12,7
	jmp LB_61690
LB_61689:
	bts r12,7
LB_61690:
	mov rsi,1
	bt r12,7
	jc LB_61687
	mov rsi,0
	bt rdx,0
	jc LB_61687
	jmp LB_61688
LB_61687:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_61688:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61677
	btr r12,4
	jmp LB_61678
LB_61677:
	bts r12,4
LB_61678:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61675
	btr r12,3
	jmp LB_61676
LB_61675:
	bts r12,3
LB_61676:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61673
	btr r12,2
	jmp LB_61674
LB_61673:
	bts r12,2
LB_61674:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61671
	btr r12,1
	jmp LB_61672
LB_61671:
	bts r12,1
LB_61672:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61669
	btr r12,0
	jmp LB_61670
LB_61669:
	bts r12,0
LB_61670:
	add rsp,48
; _f26 { %_61580 %_61581 %_61582 } ⊢ { %_61583 %_61584 %_61585 } : { %_61583 %_61584 %_61585 }
 ; {>  %_61581~6':_r64 %_61576~4':_stg %_61582~7':(_opn)◂((_lst)◂(_p56220)) %_61570~3':_stg %_61580~5':_stg %_61568~1':_r64 %_61567~0':_stg %_61574~2':_stg }
; _f26 { 5' 6' 7' } ⊢ { 5' 6' 7' }
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
	jc LB_61703
	btr r12,1
	jmp LB_61704
LB_61703:
	bts r12,1
LB_61704:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61701
	btr QWORD [rdi],0
	jmp LB_61702
LB_61701:
	bts QWORD [rdi],0
LB_61702:
	mov r14,rcx
	bt r12,6
	jc LB_61707
	btr r12,1
	jmp LB_61708
LB_61707:
	bts r12,1
LB_61708:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61705
	btr QWORD [rdi],1
	jmp LB_61706
LB_61705:
	bts QWORD [rdi],1
LB_61706:
	mov r14,rdx
	bt r12,7
	jc LB_61711
	btr r12,1
	jmp LB_61712
LB_61711:
	bts r12,1
LB_61712:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_61709
	btr QWORD [rdi],2
	jmp LB_61710
LB_61709:
	bts QWORD [rdi],2
LB_61710:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_61715
	btr r12,1
	jmp LB_61716
LB_61715:
	bts r12,1
LB_61716:
	mov r11,r14
	bt r12,1
	jc LB_61713
	btr r12,5
	jmp LB_61714
LB_61713:
	bts r12,5
LB_61714:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_61719
	btr r12,1
	jmp LB_61720
LB_61719:
	bts r12,1
LB_61720:
	mov rcx,r14
	bt r12,1
	jc LB_61717
	btr r12,6
	jmp LB_61718
LB_61717:
	bts r12,6
LB_61718:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_61723
	btr r12,1
	jmp LB_61724
LB_61723:
	bts r12,1
LB_61724:
	mov rdx,r14
	bt r12,1
	jc LB_61721
	btr r12,7
	jmp LB_61722
LB_61721:
	bts r12,7
LB_61722:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61699
	btr r12,4
	jmp LB_61700
LB_61699:
	bts r12,4
LB_61700:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61697
	btr r12,3
	jmp LB_61698
LB_61697:
	bts r12,3
LB_61698:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61695
	btr r12,2
	jmp LB_61696
LB_61695:
	bts r12,2
LB_61696:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61693
	btr r12,1
	jmp LB_61694
LB_61693:
	bts r12,1
LB_61694:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61691
	btr r12,0
	jmp LB_61692
LB_61691:
	bts r12,0
LB_61692:
	add rsp,48
; ∎ {  }
 ; {>  %_61584~6':_r64 %_61576~4':_stg %_61570~3':_stg %_61585~7':(_opn)◂((_lst)◂(_p56220)) %_61568~1':_r64 %_61583~5':_stg %_61567~0':_stg %_61574~2':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_61725
	mov rdi,rcx
	call dlt
LB_61725:
	bt r12,4
	jc LB_61726
	mov rdi,r10
	call dlt
LB_61726:
	bt r12,3
	jc LB_61727
	mov rdi,r9
	call dlt
LB_61727:
	bt r12,7
	jc LB_61728
	mov rdi,rdx
	call dlt
LB_61728:
	bt r12,1
	jc LB_61729
	mov rdi,r14
	call dlt
LB_61729:
	bt r12,5
	jc LB_61730
	mov rdi,r11
	call dlt
LB_61730:
	bt r12,0
	jc LB_61731
	mov rdi,r13
	call dlt
LB_61731:
	bt r12,2
	jc LB_61732
	mov rdi,r8
	call dlt
LB_61732:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61661:
	mov r15,0
LB_61734:
	cmp r15,0
	jz LB_61735
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61734
LB_61735:
; ∎ {  }
 ; {>  %_61576~4':_stg %_61570~3':_stg %_61568~1':_r64 %_61577~5':(_opn)◂(_stg) %_61567~0':_stg %_61574~2':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_61736
	mov rdi,r10
	call dlt
LB_61736:
	bt r12,3
	jc LB_61737
	mov rdi,r9
	call dlt
LB_61737:
	bt r12,1
	jc LB_61738
	mov rdi,r14
	call dlt
LB_61738:
	bt r12,5
	jc LB_61739
	mov rdi,r11
	call dlt
LB_61739:
	bt r12,0
	jc LB_61740
	mov rdi,r13
	call dlt
LB_61740:
	bt r12,2
	jc LB_61741
	mov rdi,r8
	call dlt
LB_61741:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61733:
MTC_LB_61606:
	mov r15,0
LB_61743:
	cmp r15,0
	jz LB_61744
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61743
LB_61744:
; _f57835 { %_61567 %_61568 } ⊢ { %_61586 %_61587 %_61588 } : { %_61586 %_61587 %_61588 }
 ; {>  %_61569~2':(_lst)◂(_stg) %_61568~1':_r64 %_61567~0':_stg }
; _f57835 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_57835
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_61747
	btr r12,4
	jmp LB_61748
LB_61747:
	bts r12,4
LB_61748:
	mov r9,r10
	bt r12,4
	jc LB_61751
	btr r12,3
	jmp LB_61752
LB_61751:
	bts r12,3
LB_61752:
	mov rsi,1
	bt r12,3
	jc LB_61749
	mov rsi,0
	bt r9,0
	jc LB_61749
	jmp LB_61750
LB_61749:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61750:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_61745
	btr r12,2
	jmp LB_61746
LB_61745:
	bts r12,2
LB_61746:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_61589
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_61589 ⊢ { %_61590 %_61591 } : { %_61590 %_61591 }
 ; {>  %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61569~2':(_lst)◂(_stg) %_61589~4':_stg %_61587~1':_r64 }
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
	jc LB_61761
	btr r12,0
	jmp LB_61762
LB_61761:
	bts r12,0
LB_61762:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_61763
	btr r12,4
	jmp LB_61764
LB_61763:
	bts r12,4
LB_61764:
	mov r11,r14
	bt r12,1
	jc LB_61765
	btr r12,5
	jmp LB_61766
LB_61765:
	bts r12,5
LB_61766:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61759
	btr r12,3
	jmp LB_61760
LB_61759:
	bts r12,3
LB_61760:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61757
	btr r12,2
	jmp LB_61758
LB_61757:
	bts r12,2
LB_61758:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61755
	btr r12,1
	jmp LB_61756
LB_61755:
	bts r12,1
LB_61756:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61753
	btr r12,0
	jmp LB_61754
LB_61753:
	bts r12,0
LB_61754:
	add rsp,40
; _f26 { %_61590 %_61591 } ⊢ { %_61592 %_61593 } : { %_61592 %_61593 }
 ; {>  %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61569~2':(_lst)◂(_stg) %_61591~5':_stg %_61590~4':_stg %_61587~1':_r64 }
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
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_61777
	btr r12,1
	jmp LB_61778
LB_61777:
	bts r12,1
LB_61778:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61775
	btr QWORD [rdi],0
	jmp LB_61776
LB_61775:
	bts QWORD [rdi],0
LB_61776:
	mov r14,r11
	bt r12,5
	jc LB_61781
	btr r12,1
	jmp LB_61782
LB_61781:
	bts r12,1
LB_61782:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61779
	btr QWORD [rdi],1
	jmp LB_61780
LB_61779:
	bts QWORD [rdi],1
LB_61780:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_61785
	btr r12,1
	jmp LB_61786
LB_61785:
	bts r12,1
LB_61786:
	mov r10,r14
	bt r12,1
	jc LB_61783
	btr r12,4
	jmp LB_61784
LB_61783:
	bts r12,4
LB_61784:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_61789
	btr r12,1
	jmp LB_61790
LB_61789:
	bts r12,1
LB_61790:
	mov r11,r14
	bt r12,1
	jc LB_61787
	btr r12,5
	jmp LB_61788
LB_61787:
	bts r12,5
LB_61788:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61773
	btr r12,3
	jmp LB_61774
LB_61773:
	bts r12,3
LB_61774:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61771
	btr r12,2
	jmp LB_61772
LB_61771:
	bts r12,2
LB_61772:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61769
	btr r12,1
	jmp LB_61770
LB_61769:
	bts r12,1
LB_61770:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61767
	btr r12,0
	jmp LB_61768
LB_61767:
	bts r12,0
LB_61768:
	add rsp,40
; _f57042 %_61593 ⊢ { %_61594 %_61595 } : { %_61594 %_61595 }
 ; {>  %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61569~2':(_lst)◂(_stg) %_61593~5':_stg %_61592~4':_stg %_61587~1':_r64 }
; _f57042 5' ⊢ { 5' 6' }
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
	jc LB_61801
	btr r12,0
	jmp LB_61802
LB_61801:
	bts r12,0
LB_61802:
	call NS_E_57042
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_61803
	btr r12,5
	jmp LB_61804
LB_61803:
	bts r12,5
LB_61804:
	mov rcx,r14
	bt r12,1
	jc LB_61805
	btr r12,6
	jmp LB_61806
LB_61805:
	bts r12,6
LB_61806:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61799
	btr r12,4
	jmp LB_61800
LB_61799:
	bts r12,4
LB_61800:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61797
	btr r12,3
	jmp LB_61798
LB_61797:
	bts r12,3
LB_61798:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61795
	btr r12,2
	jmp LB_61796
LB_61795:
	bts r12,2
LB_61796:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61793
	btr r12,1
	jmp LB_61794
LB_61793:
	bts r12,1
LB_61794:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61791
	btr r12,0
	jmp LB_61792
LB_61791:
	bts r12,0
LB_61792:
	add rsp,48
MTC_LB_61807:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61808
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_61809
	bt QWORD [rax],0
	jc LB_61810
	btr r12,8
	jmp LB_61811
LB_61810:
	bts r12,8
LB_61811:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61809:
	mov QWORD [st_vct+8*8],rax
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61812
	btr r12,7
	jmp LB_61813
LB_61812:
	bts r12,7
LB_61813:
LB_61814:
	cmp r15,0
	jz LB_61815
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61814
LB_61815:
; » 0xr0 |~ {  } ⊢ %_61597 : %_61597
 ; {>  %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61596~7':_stg %_61569~2':(_lst)◂(_stg) %_61592~4':_stg %_61594~5':_stg %_61587~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_61597
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f57835 { %_61596 %_61597 } ⊢ { %_61598 %_61599 %_61600 } : { %_61598 %_61599 %_61600 }
 ; {>  %_61597~6':_r64 %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61596~7':_stg %_61569~2':(_lst)◂(_stg) %_61592~4':_stg %_61594~5':_stg %_61587~1':_r64 }
; _f57835 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_61828
	btr r12,0
	jmp LB_61829
LB_61828:
	bts r12,0
LB_61829:
	mov r14,rcx
	bt r12,6
	jc LB_61830
	btr r12,1
	jmp LB_61831
LB_61830:
	bts r12,1
LB_61831:
	call NS_E_57835
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_61832
	btr r12,6
	jmp LB_61833
LB_61832:
	bts r12,6
LB_61833:
	mov rdx,r14
	bt r12,1
	jc LB_61834
	btr r12,7
	jmp LB_61835
LB_61834:
	bts r12,7
LB_61835:
	mov QWORD [st_vct+8*8],r9
	bt r12,3
	jc LB_61838
	btr r12,8
	jmp LB_61839
LB_61838:
	bts r12,8
LB_61839:
	mov rsi,1
	bt r12,8
	jc LB_61836
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_61836
	jmp LB_61837
LB_61836:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_61837:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61826
	btr r12,5
	jmp LB_61827
LB_61826:
	bts r12,5
LB_61827:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61824
	btr r12,4
	jmp LB_61825
LB_61824:
	bts r12,4
LB_61825:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61822
	btr r12,3
	jmp LB_61823
LB_61822:
	bts r12,3
LB_61823:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61820
	btr r12,2
	jmp LB_61821
LB_61820:
	bts r12,2
LB_61821:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61818
	btr r12,1
	jmp LB_61819
LB_61818:
	bts r12,1
LB_61819:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61816
	btr r12,0
	jmp LB_61817
LB_61816:
	bts r12,0
LB_61817:
	add rsp,56
; _f26 { %_61598 %_61599 %_61600 } ⊢ { %_61601 %_61602 %_61603 } : { %_61601 %_61602 %_61603 }
 ; {>  %_61600~8':(_opn)◂((_lst)◂(_p56220)) %_61586~0':_stg %_61599~7':_r64 %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61569~2':(_lst)◂(_stg) %_61598~6':_stg %_61592~4':_stg %_61594~5':_stg %_61587~1':_r64 }
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
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_61854
	btr r12,1
	jmp LB_61855
LB_61854:
	bts r12,1
LB_61855:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61852
	btr QWORD [rdi],0
	jmp LB_61853
LB_61852:
	bts QWORD [rdi],0
LB_61853:
	mov r14,rdx
	bt r12,7
	jc LB_61858
	btr r12,1
	jmp LB_61859
LB_61858:
	bts r12,1
LB_61859:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61856
	btr QWORD [rdi],1
	jmp LB_61857
LB_61856:
	bts QWORD [rdi],1
LB_61857:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61862
	btr r12,1
	jmp LB_61863
LB_61862:
	bts r12,1
LB_61863:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_61860
	btr QWORD [rdi],2
	jmp LB_61861
LB_61860:
	bts QWORD [rdi],2
LB_61861:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_61866
	btr r12,1
	jmp LB_61867
LB_61866:
	bts r12,1
LB_61867:
	mov rcx,r14
	bt r12,1
	jc LB_61864
	btr r12,6
	jmp LB_61865
LB_61864:
	bts r12,6
LB_61865:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_61870
	btr r12,1
	jmp LB_61871
LB_61870:
	bts r12,1
LB_61871:
	mov rdx,r14
	bt r12,1
	jc LB_61868
	btr r12,7
	jmp LB_61869
LB_61868:
	bts r12,7
LB_61869:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_61874
	btr r12,1
	jmp LB_61875
LB_61874:
	bts r12,1
LB_61875:
	mov QWORD [st_vct+8*8],r14
	bt r12,1
	jc LB_61872
	btr r12,8
	jmp LB_61873
LB_61872:
	bts r12,8
LB_61873:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61850
	btr r12,5
	jmp LB_61851
LB_61850:
	bts r12,5
LB_61851:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61848
	btr r12,4
	jmp LB_61849
LB_61848:
	bts r12,4
LB_61849:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61846
	btr r12,3
	jmp LB_61847
LB_61846:
	bts r12,3
LB_61847:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61844
	btr r12,2
	jmp LB_61845
LB_61844:
	bts r12,2
LB_61845:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61842
	btr r12,1
	jmp LB_61843
LB_61842:
	bts r12,1
LB_61843:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61840
	btr r12,0
	jmp LB_61841
LB_61840:
	bts r12,0
LB_61841:
	add rsp,56
; ∎ {  }
 ; {>  %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61569~2':(_lst)◂(_stg) %_61592~4':_stg %_61602~7':_r64 %_61601~6':_stg %_61594~5':_stg %_61603~8':(_opn)◂((_lst)◂(_p56220)) %_61587~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_61876
	mov rdi,r13
	call dlt
LB_61876:
	bt r12,3
	jc LB_61877
	mov rdi,r9
	call dlt
LB_61877:
	bt r12,2
	jc LB_61878
	mov rdi,r8
	call dlt
LB_61878:
	bt r12,4
	jc LB_61879
	mov rdi,r10
	call dlt
LB_61879:
	bt r12,7
	jc LB_61880
	mov rdi,rdx
	call dlt
LB_61880:
	bt r12,6
	jc LB_61881
	mov rdi,rcx
	call dlt
LB_61881:
	bt r12,5
	jc LB_61882
	mov rdi,r11
	call dlt
LB_61882:
	bt r12,8
	jc LB_61883
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_61883:
	bt r12,1
	jc LB_61884
	mov rdi,r14
	call dlt
LB_61884:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61808:
	mov r15,0
LB_61886:
	cmp r15,0
	jz LB_61887
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61886
LB_61887:
; ∎ {  }
 ; {>  %_61586~0':_stg %_61588~3':(_opn)◂((_lst)◂(_p56220)) %_61569~2':(_lst)◂(_stg) %_61595~6':(_opn)◂(_stg) %_61592~4':_stg %_61594~5':_stg %_61587~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_61888
	mov rdi,r13
	call dlt
LB_61888:
	bt r12,3
	jc LB_61889
	mov rdi,r9
	call dlt
LB_61889:
	bt r12,2
	jc LB_61890
	mov rdi,r8
	call dlt
LB_61890:
	bt r12,6
	jc LB_61891
	mov rdi,rcx
	call dlt
LB_61891:
	bt r12,4
	jc LB_61892
	mov rdi,r10
	call dlt
LB_61892:
	bt r12,5
	jc LB_61893
	mov rdi,r11
	call dlt
LB_61893:
	bt r12,1
	jc LB_61894
	mov rdi,r14
	call dlt
LB_61894:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61885:
MTC_LB_61742:
section .data
	NS_E_DYN_55536:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55536
	NS_E_DYN_55539:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55539
	NS_E_DYN_55540:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55540
	NS_E_DYN_55541:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55541
	NS_E_DYN_55542:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55542
	NS_E_DYN_55549:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55549
	NS_E_DYN_55588:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55588
	NS_E_DYN_55606:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55606
	NS_E_DYN_55649:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55649
	NS_E_DYN_55659:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55659
	NS_E_DYN_55660:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55660
	NS_E_DYN_55661:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55661
	NS_E_DYN_55879:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55879
	NS_E_DYN_55918:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55918
	NS_E_DYN_55957:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55957
	NS_E_DYN_55996:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55996
	NS_E_DYN_56027:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56027
	NS_E_DYN_56028:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56028
	NS_E_DYN_56029:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56029
	NS_E_DYN_56156:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56156
	NS_E_DYN_56215:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56216:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56218:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56219:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56298:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56299:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56300:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56301:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56302:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56303:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56304:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56305:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56306:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56307:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56308:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_56309:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_56310:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_56311:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56312:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56313:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_56314:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56315:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56316:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_56317:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_56319:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56320:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56321:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56321
	NS_E_DYN_56322:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56322
	NS_E_DYN_56323:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56323
	NS_E_DYN_56324:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56324
	NS_E_DYN_56941:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56941
	NS_E_DYN_57042:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57042
	CST_DYN_57104:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_57107:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57107
	NS_E_DYN_57174:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57174
	NS_E_DYN_57259:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_57260:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_57267:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57267
	NS_E_DYN_57303:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57303
	NS_E_DYN_57304:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57304
	NS_E_DYN_57305:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57305
	NS_E_DYN_57306:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57306
	NS_E_DYN_57566:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57566
	NS_E_DYN_57567:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57567
	NS_E_DYN_57570:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57570
	NS_E_DYN_57571:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57571
	NS_E_DYN_57835:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57835
	NS_E_DYN_57836:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57836
	NS_E_DYN_57837:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57837
	NS_E_DYN_57838:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57838
	NS_E_DYN_57839:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57839
	NS_E_DYN_57840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57840
	NS_E_DYN_57843:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57843
	NS_E_DYN_57844:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57844
	NS_E_DYN_57845:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57845
	NS_E_DYN_57848:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57848
	NS_E_DYN_57849:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57849
	NS_E_DYN_57850:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57850
	NS_E_DYN_57851:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57851
	NS_E_DYN_57852:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57852
	NS_E_DYN_57853:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57853
	NS_E_DYN_57854:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57854
	NS_E_DYN_57855:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57855
	NS_E_DYN_57856:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57856
	NS_E_DYN_57857:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57857
	NS_E_DYN_57858:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57858
	NS_E_DYN_57859:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57859
	NS_E_DYN_57860:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57860
	NS_E_DYN_57861:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57861
	NS_E_DYN_57862:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57862
	NS_E_DYN_57863:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57863
	NS_E_DYN_57864:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57864
	NS_E_DYN_57865:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57865
	NS_E_DYN_57866:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57866
	NS_E_DYN_57871:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57871
	NS_E_DYN_57872:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57872
	NS_E_DYN_57873:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57873
	NS_E_DYN_57874:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57874
	NS_E_DYN_57875:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57875
	NS_E_DYN_57876:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57876
	NS_E_DYN_57877:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57877
	NS_E_DYN_57878:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57878
	NS_E_DYN_57879:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57879
	NS_E_DYN_57880:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57880
	NS_E_DYN_57881:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57881
	CST_DYN_61604:
		dq 0x0000_0001_00_82_ffff
		dq 1
