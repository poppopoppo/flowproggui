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
	call NS_E_9596
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
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
NS_E_9554:
NS_E_RDI_9554:
NS_E_9554_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_9555
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_9555:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9557:
NS_E_RDI_9557:
NS_E_9557_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_9557_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_9557_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9558:
NS_E_RDI_9558:
NS_E_9558_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_9558_LB_0
	cmp r11,57
	ja NS_E_9558_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9558_LB_0:
	mov rax,0
	ret
NS_E_9560:
NS_E_RDI_9560:
NS_E_9560_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_9560_LB_0
	cmp r11,122
	ja NS_E_9560_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9560_LB_0:
	mov rax,0
	ret
NS_E_9559:
NS_E_RDI_9559:
NS_E_9559_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_9559_LB_0
	cmp r11,90
	ja NS_E_9559_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_9559_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
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
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_9562
	bt QWORD [rdi],17
	jnc LB_9562
	bt QWORD [rdi],0
	jc LB_9564
	btr r12,2
	clc
	jmp LB_9565
LB_9564:
	bts r12,2
	stc
LB_9565:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_9563
LB_9562:
	btr r12,2
	clc
	call dcp
LB_9563:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_9561
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_9561:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
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
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_9556:
NS_E_RDI_9556:
NS_E_9556_ETR_TBL:
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
	jz NS_E_9556_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_9556_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_9596:
NS_E_RDI_9596:
; » 0xr8 |~ {  } ⊢ %_9566 : %_9566
 ; {>  }
; 	» 0xr8 _ ⊢ 0' : %_9566
	mov rdi,0x8
	mov r13,rdi
	bts r12,0
; 	» "H" _ ⊢ 1' : %_9567
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_48
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; 	» "E" _ ⊢ 2' : %_9568
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_45
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,2
; » 0xr4 |~ {  } ⊢ %_9569 : %_9569
 ; {>  %_9568~2':_stg %_9566~0':_r64 %_9567~1':_stg }
; 	» 0xr4 _ ⊢ 3' : %_9569
	mov rdi,0x4
	mov r9,rdi
	bts r12,3
; » 0xr5 |~ {  } ⊢ %_9570 : %_9570
 ; {>  %_9568~2':_stg %_9566~0':_r64 %_9569~3':_r64 %_9567~1':_stg }
; 	» 0xr5 _ ⊢ 4' : %_9570
	mov rdi,0x5
	mov r10,rdi
	bts r12,4
; _f20 %_9566 ⊢ { %_9571 %_9572 } : { %_9571 %_9572 }
 ; {>  %_9570~4':_r64 %_9568~2':_stg %_9566~0':_r64 %_9569~3':_r64 %_9567~1':_stg }
; _f20 0' ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_9605
	btr r12,5
	jmp LB_9606
LB_9605:
	bts r12,5
LB_9606:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9603
	btr r12,4
	clc
	jmp LB_9604
LB_9603:
	bts r12,4
	stc
LB_9604:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9601
	btr r12,3
	clc
	jmp LB_9602
LB_9601:
	bts r12,3
	stc
LB_9602:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9599
	btr r12,2
	clc
	jmp LB_9600
LB_9599:
	bts r12,2
	stc
LB_9600:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9597
	btr r12,1
	clc
	jmp LB_9598
LB_9597:
	bts r12,1
	stc
LB_9598:
	add rsp,40
; _f38 %_9572 ⊢ %_9573 : %_9573
 ; {>  %_9572~5':(_p0)◂(t3477'(0)) %_9571~0':_r64 %_9570~4':_r64 %_9568~2':_stg %_9569~3':_r64 %_9567~1':_stg }
; _f38 5' ⊢ 5'
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
	jc LB_9617
	btr r12,0
	jmp LB_9618
LB_9617:
	bts r12,0
LB_9618:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_9619
	btr r12,5
	jmp LB_9620
LB_9619:
	bts r12,5
LB_9620:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9615
	btr r12,4
	clc
	jmp LB_9616
LB_9615:
	bts r12,4
	stc
LB_9616:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9613
	btr r12,3
	clc
	jmp LB_9614
LB_9613:
	bts r12,3
	stc
LB_9614:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9611
	btr r12,2
	clc
	jmp LB_9612
LB_9611:
	bts r12,2
	stc
LB_9612:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9609
	btr r12,1
	clc
	jmp LB_9610
LB_9609:
	bts r12,1
	stc
LB_9610:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9607
	btr r12,0
	clc
	jmp LB_9608
LB_9607:
	bts r12,0
	stc
LB_9608:
	add rsp,48
; _f22 { %_9573 %_9569 %_9567 } ⊢ { %_9574 %_9575 } : { %_9574 %_9575 }
 ; {>  %_9571~0':_r64 %_9570~4':_r64 %_9568~2':_stg %_9569~3':_r64 %_9567~1':_stg %_9573~5':(_p0)◂(t3481'(0)) }
; _f22 { 5' 3' 1' } ⊢ { 1' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0101010.. |},{ 5' 3' 1' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_9627
	btr r12,0
	jmp LB_9628
LB_9627:
	bts r12,0
LB_9628:
	mov r8,r14
	bt r12,1
	jc LB_9629
	btr r12,2
	jmp LB_9630
LB_9629:
	bts r12,2
LB_9630:
	mov r14,r9
	bt r12,3
	jc LB_9631
	btr r12,1
	jmp LB_9632
LB_9631:
	bts r12,1
LB_9632:
	call NS_E_22
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_9633
	btr r12,3
	jmp LB_9634
LB_9633:
	bts r12,3
LB_9634:
	mov r14,r13
	bt r12,0
	jc LB_9635
	btr r12,1
	jmp LB_9636
LB_9635:
	bts r12,1
LB_9636:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_9625
	btr r12,4
	clc
	jmp LB_9626
LB_9625:
	bts r12,4
	stc
LB_9626:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9623
	btr r12,2
	clc
	jmp LB_9624
LB_9623:
	bts r12,2
	stc
LB_9624:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9621
	btr r12,0
	clc
	jmp LB_9622
LB_9621:
	bts r12,0
	stc
LB_9622:
	add rsp,32
; _f22 { %_9574 %_9570 %_9568 } ⊢ { %_9576 %_9577 } : { %_9576 %_9577 }
 ; {>  %_9571~0':_r64 %_9570~4':_r64 %_9568~2':_stg %_9575~3':_r64 %_9574~1':(_p0)◂(_stg) }
; _f22 { 1' 4' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 011010.. |},{ 1' 4' 2' } ⊢ { 0' 1' 2' }
	mov r13,r14
	bt r12,1
	jc LB_9641
	btr r12,0
	jmp LB_9642
LB_9641:
	bts r12,0
LB_9642:
	mov r14,r10
	bt r12,4
	jc LB_9643
	btr r12,1
	jmp LB_9644
LB_9643:
	bts r12,1
LB_9644:
	call NS_E_22
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_9645
	btr r12,2
	jmp LB_9646
LB_9645:
	bts r12,2
LB_9646:
	mov r14,r13
	bt r12,0
	jc LB_9647
	btr r12,1
	jmp LB_9648
LB_9647:
	bts r12,1
LB_9648:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_9639
	btr r12,3
	clc
	jmp LB_9640
LB_9639:
	bts r12,3
	stc
LB_9640:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9637
	btr r12,0
	clc
	jmp LB_9638
LB_9637:
	bts r12,0
	stc
LB_9638:
	add rsp,24
; _f23 { %_9576 %_9577 } ⊢ { %_9578 %_9579 %_9580 } : { %_9578 %_9579 %_9580 }
 ; {>  %_9571~0':_r64 %_9577~2':_r64 %_9575~3':_r64 %_9576~1':(_p0)◂(_stg) }
; _f23 { 1' 2' } ⊢ { 1' 2' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_9653
	btr r12,0
	jmp LB_9654
LB_9653:
	bts r12,0
LB_9654:
	mov r14,r8
	bt r12,2
	jc LB_9655
	btr r12,1
	jmp LB_9656
LB_9655:
	bts r12,1
LB_9656:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 1' 2' 4' }
	mov r10,r8
	bt r12,2
	jc LB_9657
	btr r12,4
	jmp LB_9658
LB_9657:
	bts r12,4
LB_9658:
	mov r8,r14
	bt r12,1
	jc LB_9659
	btr r12,2
	jmp LB_9660
LB_9659:
	bts r12,2
LB_9660:
	mov r14,r13
	bt r12,0
	jc LB_9661
	btr r12,1
	jmp LB_9662
LB_9661:
	bts r12,1
LB_9662:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_9651
	btr r12,3
	clc
	jmp LB_9652
LB_9651:
	bts r12,3
	stc
LB_9652:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9649
	btr r12,0
	clc
	jmp LB_9650
LB_9649:
	bts r12,0
	stc
LB_9650:
	add rsp,24
; _f38 %_9578 ⊢ %_9581 : %_9581
 ; {>  %_9571~0':_r64 %_9575~3':_r64 %_9579~2':_r64 %_9580~4':_stg %_9578~1':(_p0)◂(_stg) }
; _f38 1' ⊢ 1'
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
	jc LB_9671
	btr r12,0
	jmp LB_9672
LB_9671:
	bts r12,0
LB_9672:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_9673
	btr r12,1
	jmp LB_9674
LB_9673:
	bts r12,1
LB_9674:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9669
	btr r12,4
	clc
	jmp LB_9670
LB_9669:
	bts r12,4
	stc
LB_9670:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9667
	btr r12,3
	clc
	jmp LB_9668
LB_9667:
	bts r12,3
	stc
LB_9668:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9665
	btr r12,2
	clc
	jmp LB_9666
LB_9665:
	bts r12,2
	stc
LB_9666:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9663
	btr r12,0
	clc
	jmp LB_9664
LB_9663:
	bts r12,0
	stc
LB_9664:
	add rsp,40
; _f38 %_9580 ⊢ %_9582 : %_9582
 ; {>  %_9571~0':_r64 %_9575~3':_r64 %_9581~1':(_p0)◂(_stg) %_9579~2':_r64 %_9580~4':_stg }
; _f38 4' ⊢ 4'
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
	jc LB_9683
	btr r12,0
	jmp LB_9684
LB_9683:
	bts r12,0
LB_9684:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_9685
	btr r12,4
	jmp LB_9686
LB_9685:
	bts r12,4
LB_9686:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9681
	btr r12,3
	clc
	jmp LB_9682
LB_9681:
	bts r12,3
	stc
LB_9682:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9679
	btr r12,2
	clc
	jmp LB_9680
LB_9679:
	bts r12,2
	stc
LB_9680:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9677
	btr r12,1
	clc
	jmp LB_9678
LB_9677:
	bts r12,1
	stc
LB_9678:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9675
	btr r12,0
	clc
	jmp LB_9676
LB_9675:
	bts r12,0
	stc
LB_9676:
	add rsp,40
; _f20 %_9571 ⊢ { %_9583 %_9584 } : { %_9583 %_9584 }
 ; {>  %_9571~0':_r64 %_9582~4':_stg %_9575~3':_r64 %_9581~1':(_p0)◂(_stg) %_9579~2':_r64 }
; _f20 0' ⊢ { 0' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 5' }
	mov r11,r14
	bt r12,1
	jc LB_9695
	btr r12,5
	jmp LB_9696
LB_9695:
	bts r12,5
LB_9696:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9693
	btr r12,4
	clc
	jmp LB_9694
LB_9693:
	bts r12,4
	stc
LB_9694:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9691
	btr r12,3
	clc
	jmp LB_9692
LB_9691:
	bts r12,3
	stc
LB_9692:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_9689
	btr r12,2
	clc
	jmp LB_9690
LB_9689:
	bts r12,2
	stc
LB_9690:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9687
	btr r12,1
	clc
	jmp LB_9688
LB_9687:
	bts r12,1
	stc
LB_9688:
	add rsp,40
; _f22 { %_9584 %_9575 %_9579 } ⊢ { %_9585 %_9586 } : { %_9585 %_9586 }
 ; {>  %_9582~4':_stg %_9575~3':_r64 %_9581~1':(_p0)◂(_stg) %_9579~2':_r64 %_9584~5':(_p0)◂(t3498'(0)) %_9583~0':_r64 }
; _f22 { 5' 3' 2' } ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0011010.. |},{ 5' 3' 2' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_9703
	btr r12,0
	jmp LB_9704
LB_9703:
	bts r12,0
LB_9704:
	mov r14,r9
	bt r12,3
	jc LB_9705
	btr r12,1
	jmp LB_9706
LB_9705:
	bts r12,1
LB_9706:
	call NS_E_22
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_9707
	btr r12,2
	jmp LB_9708
LB_9707:
	bts r12,2
LB_9708:
	mov r9,r14
	bt r12,1
	jc LB_9709
	btr r12,3
	jmp LB_9710
LB_9709:
	bts r12,3
LB_9710:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_9701
	btr r12,4
	clc
	jmp LB_9702
LB_9701:
	bts r12,4
	stc
LB_9702:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9699
	btr r12,1
	clc
	jmp LB_9700
LB_9699:
	bts r12,1
	stc
LB_9700:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9697
	btr r12,0
	clc
	jmp LB_9698
LB_9697:
	bts r12,0
	stc
LB_9698:
	add rsp,32
; _f38 %_9585 ⊢ %_9587 : %_9587
 ; {>  %_9586~3':_r64 %_9582~4':_stg %_9581~1':(_p0)◂(_stg) %_9585~2':(_p0)◂(_r64) %_9583~0':_r64 }
; _f38 2' ⊢ 2'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_9719
	btr r12,0
	jmp LB_9720
LB_9719:
	bts r12,0
LB_9720:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_9721
	btr r12,2
	jmp LB_9722
LB_9721:
	bts r12,2
LB_9722:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9717
	btr r12,4
	clc
	jmp LB_9718
LB_9717:
	bts r12,4
	stc
LB_9718:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9715
	btr r12,3
	clc
	jmp LB_9716
LB_9715:
	bts r12,3
	stc
LB_9716:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9713
	btr r12,1
	clc
	jmp LB_9714
LB_9713:
	bts r12,1
	stc
LB_9714:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9711
	btr r12,0
	clc
	jmp LB_9712
LB_9711:
	bts r12,0
	stc
LB_9712:
	add rsp,40
; _f23 { %_9587 %_9586 } ⊢ { %_9588 %_9589 %_9590 } : { %_9588 %_9589 %_9590 }
 ; {>  %_9586~3':_r64 %_9582~4':_stg %_9587~2':(_p0)◂(_r64) %_9581~1':(_p0)◂(_stg) %_9583~0':_r64 }
; _f23 { 2' 3' } ⊢ { 2' 3' 5' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' 3' } ⊢ { 0' 1' }
	mov r13,r8
	bt r12,2
	jc LB_9729
	btr r12,0
	jmp LB_9730
LB_9729:
	bts r12,0
LB_9730:
	mov r14,r9
	bt r12,3
	jc LB_9731
	btr r12,1
	jmp LB_9732
LB_9731:
	bts r12,1
LB_9732:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 5' }
	mov r9,r14
	bt r12,1
	jc LB_9733
	btr r12,3
	jmp LB_9734
LB_9733:
	bts r12,3
LB_9734:
	mov r11,r8
	bt r12,2
	jc LB_9735
	btr r12,5
	jmp LB_9736
LB_9735:
	bts r12,5
LB_9736:
	mov r8,r13
	bt r12,0
	jc LB_9737
	btr r12,2
	jmp LB_9738
LB_9737:
	bts r12,2
LB_9738:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_9727
	btr r12,4
	clc
	jmp LB_9728
LB_9727:
	bts r12,4
	stc
LB_9728:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9725
	btr r12,1
	clc
	jmp LB_9726
LB_9725:
	bts r12,1
	stc
LB_9726:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9723
	btr r12,0
	clc
	jmp LB_9724
LB_9723:
	bts r12,0
	stc
LB_9724:
	add rsp,32
; _f38 %_9590 ⊢ %_9591 : %_9591
 ; {>  %_9582~4':_stg %_9590~5':_r64 %_9581~1':(_p0)◂(_stg) %_9589~3':_r64 %_9588~2':(_p0)◂(_r64) %_9583~0':_r64 }
; _f38 5' ⊢ 5'
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
	jc LB_9749
	btr r12,0
	jmp LB_9750
LB_9749:
	bts r12,0
LB_9750:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_9751
	btr r12,5
	jmp LB_9752
LB_9751:
	bts r12,5
LB_9752:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_9747
	btr r12,4
	clc
	jmp LB_9748
LB_9747:
	bts r12,4
	stc
LB_9748:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_9745
	btr r12,3
	clc
	jmp LB_9746
LB_9745:
	bts r12,3
	stc
LB_9746:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_9743
	btr r12,2
	clc
	jmp LB_9744
LB_9743:
	bts r12,2
	stc
LB_9744:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9741
	btr r12,1
	clc
	jmp LB_9742
LB_9741:
	bts r12,1
	stc
LB_9742:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9739
	btr r12,0
	clc
	jmp LB_9740
LB_9739:
	bts r12,0
	stc
LB_9740:
	add rsp,48
; » 0xr1 |~ {  } ⊢ %_9592 : %_9592
 ; {>  %_9591~5':_r64 %_9582~4':_stg %_9581~1':(_p0)◂(_stg) %_9589~3':_r64 %_9588~2':(_p0)◂(_r64) %_9583~0':_r64 }
; 	» 0xr1 _ ⊢ 6' : %_9592
	mov rdi,0x1
	mov rcx,rdi
	bts r12,6
; _f23 { %_9588 %_9592 } ⊢ { %_9593 %_9594 %_9595 } : { %_9593 %_9594 %_9595 }
 ; {>  %_9591~5':_r64 %_9582~4':_stg %_9592~6':_r64 %_9581~1':(_p0)◂(_stg) %_9589~3':_r64 %_9588~2':(_p0)◂(_r64) %_9583~0':_r64 }
; _f23 { 2' 6' } ⊢ { 2' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00100010.. |},{ 2' 6' } ⊢ { 0' 1' }
	mov r13,r8
	bt r12,2
	jc LB_9763
	btr r12,0
	jmp LB_9764
LB_9763:
	bts r12,0
LB_9764:
	mov r14,rcx
	bt r12,6
	jc LB_9765
	btr r12,1
	jmp LB_9766
LB_9765:
	bts r12,1
LB_9766:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 6' 7' }
	mov rcx,r14
	bt r12,1
	jc LB_9767
	btr r12,6
	jmp LB_9768
LB_9767:
	bts r12,6
LB_9768:
	mov rdx,r8
	bt r12,2
	jc LB_9769
	btr r12,7
	jmp LB_9770
LB_9769:
	bts r12,7
LB_9770:
	mov r8,r13
	bt r12,0
	jc LB_9771
	btr r12,2
	jmp LB_9772
LB_9771:
	bts r12,2
LB_9772:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_9761
	btr r12,5
	clc
	jmp LB_9762
LB_9761:
	bts r12,5
	stc
LB_9762:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_9759
	btr r12,4
	clc
	jmp LB_9760
LB_9759:
	bts r12,4
	stc
LB_9760:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_9757
	btr r12,3
	clc
	jmp LB_9758
LB_9757:
	bts r12,3
	stc
LB_9758:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_9755
	btr r12,1
	clc
	jmp LB_9756
LB_9755:
	bts r12,1
	stc
LB_9756:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_9753
	btr r12,0
	clc
	jmp LB_9754
LB_9753:
	bts r12,0
	stc
LB_9754:
	add rsp,48
; ∎ {  }
 ; {>  %_9591~5':_r64 %_9582~4':_stg %_9581~1':(_p0)◂(_stg) %_9595~7':_r64 %_9593~2':(_p0)◂(_r64) %_9589~3':_r64 %_9594~6':_r64 %_9583~0':_r64 }
; 	∎ {  }
	bt r12,5
	jc LB_9773
	mov rdi,r11
	call dlt
LB_9773:
	bt r12,4
	jc LB_9774
	mov rdi,r10
	call dlt
LB_9774:
	bt r12,1
	jc LB_9775
	mov rdi,r14
	call dlt
LB_9775:
	bt r12,7
	jc LB_9776
	mov rdi,rdx
	call dlt
LB_9776:
	bt r12,2
	jc LB_9777
	mov rdi,r8
	call dlt
LB_9777:
	bt r12,3
	jc LB_9778
	mov rdi,r9
	call dlt
LB_9778:
	bt r12,6
	jc LB_9779
	mov rdi,rcx
	call dlt
LB_9779:
	bt r12,0
	jc LB_9780
	mov rdi,r13
	call dlt
LB_9780:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	CST_DYN_9596:
		dq 0x0000_0001_00_82_ffff
		dq 1
