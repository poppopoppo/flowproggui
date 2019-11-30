%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1250
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
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
NS_E_448:
NS_E_RDI_448:
NS_E_448_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_448_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_448_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_449:
NS_E_RDI_449:
NS_E_449_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_449_LB_0
	cmp r11,57
	ja NS_E_449_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_449_LB_0:
	mov rax,0
	ret
NS_E_451:
NS_E_RDI_451:
NS_E_451_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_451_LB_0
	cmp r11,122
	ja NS_E_451_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_451_LB_0:
	mov rax,0
	ret
NS_E_450:
NS_E_RDI_450:
NS_E_450_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_450_LB_0
	cmp r11,90
	ja NS_E_450_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_450_LB_0:
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
NS_E_453:
NS_E_RDI_453:
NS_E_453_ETR_TBL:
NS_E_453_TBL:
	push r14
; glb_etr
	call NS_E_455_ETR_TBL
	cmp r15,0
	jz LB_542
	jmp NS_E_453_MTC_0_failed
LB_542:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_453_ETR_TBL
	cmp r15,0
	jz LB_546
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_547
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_547:
	jmp NS_E_453_MTC_0_failed
LB_546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_537
	btr QWORD [rdi],1
LB_537:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_538
	btr QWORD [rdi],0
LB_538:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_453_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_453_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_455:
NS_E_RDI_455:
NS_E_455_ETR_TBL:
NS_E_455_TBL:
	push r14
; mdl_etr
	call NS_E_457_ETR_TBL
	cmp r15,0
	jz LB_571
	jmp NS_E_455_MTC_0_failed
LB_571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_567
	btr QWORD [rdi],0
LB_567:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_455_MTC_0_failed:
	pop r14
	push r14
; cst_etr
	call NS_E_459_ETR_TBL
	cmp r15,0
	jz LB_565
	jmp NS_E_455_MTC_1_failed
LB_565:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_561
	btr QWORD [rdi],0
LB_561:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_455_MTC_1_failed:
	pop r14
	push r14
; op_etr
	call NS_E_461_ETR_TBL
	cmp r15,0
	jz LB_559
	jmp NS_E_455_MTC_2_failed
LB_559:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_555
	btr QWORD [rdi],0
LB_555:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_455_MTC_2_failed:
	pop r14
	push r14
; dta_etr
	call NS_E_463_ETR_TBL
	cmp r15,0
	jz LB_553
	jmp NS_E_455_MTC_3_failed
LB_553:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_549
	btr QWORD [rdi],0
LB_549:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_455_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_457:
NS_E_RDI_457:
NS_E_457_ETR_TBL:
NS_E_457_TBL:
	push r14
; "\194\167\194\167"
	jmp LB_616
LB_615:
	add r14,1
LB_616:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_615
	cmp rax,10
	jz LB_615
	cmp rax,32
	jz LB_615
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_618
	jmp NS_E_457_MTC_0_failed
LB_618:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_619
	jmp NS_E_457_MTC_0_failed
LB_619:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_620
	jmp NS_E_457_MTC_0_failed
LB_620:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_621
	jmp NS_E_457_MTC_0_failed
LB_621:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_628
LB_627:
	add r14,1
LB_628:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_627
	cmp rax,10
	jz LB_627
	cmp rax,32
	jz LB_627
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_629
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_630
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_630:
	jmp NS_E_457_MTC_0_failed
LB_629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_633
LB_632:
	add r14,1
LB_633:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_632
	cmp rax,10
	jz LB_632
	cmp rax,32
	jz LB_632
	call NS_E_453_ETR_TBL
	cmp r15,0
	jz LB_634
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_635
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_635:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_636
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_636:
	jmp NS_E_457_MTC_0_failed
LB_634:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_639
LB_638:
	add r14,1
LB_639:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_638
	cmp rax,10
	jz LB_638
	cmp rax,32
	jz LB_638
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_641
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_668
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_668:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_669
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_669:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_670
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_670:
	jmp NS_E_457_MTC_0_failed
LB_641:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_642
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_664
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_664:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_665
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_665:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_666
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_666:
	jmp NS_E_457_MTC_0_failed
LB_642:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_643
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_660
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_660:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_661
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_661:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_662
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_662:
	jmp NS_E_457_MTC_0_failed
LB_643:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_644
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_656
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_656:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_657
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_657:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_658
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_658:
	jmp NS_E_457_MTC_0_failed
LB_644:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_645
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_652
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_652:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_653
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_653:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_654
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_654:
	jmp NS_E_457_MTC_0_failed
LB_645:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_646
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_648
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_648:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_649
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_649:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_650
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_650:
	jmp NS_E_457_MTC_0_failed
LB_646:
	add r14,6
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*3],0
	mov QWORD [prs_vct+8*1+16*3],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_610
	btr QWORD [rdi],3
LB_610:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_611
	btr QWORD [rdi],2
LB_611:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_612
	btr QWORD [rdi],1
LB_612:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_613
	btr QWORD [rdi],0
LB_613:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_457_MTC_0_failed:
	pop r14
	push r14
; "\194\167\194\167"
	jmp LB_579
LB_578:
	add r14,1
LB_579:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_578
	cmp rax,10
	jz LB_578
	cmp rax,32
	jz LB_578
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_581
	jmp NS_E_457_MTC_1_failed
LB_581:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_582
	jmp NS_E_457_MTC_1_failed
LB_582:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_583
	jmp NS_E_457_MTC_1_failed
LB_583:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_584
	jmp NS_E_457_MTC_1_failed
LB_584:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_591
LB_590:
	add r14,1
LB_591:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_590
	cmp rax,10
	jz LB_590
	cmp rax,32
	jz LB_590
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_592
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_593
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_593:
	jmp NS_E_457_MTC_1_failed
LB_592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_596
LB_595:
	add r14,1
LB_596:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_595
	cmp rax,10
	jz LB_595
	cmp rax,32
	jz LB_595
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_598
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_600
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_600:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_601
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_601:
	jmp NS_E_457_MTC_1_failed
LB_598:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_604
LB_603:
	add r14,1
LB_604:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_603
	cmp rax,10
	jz LB_603
	cmp rax,32
	jz LB_603
	call NS_E_471_ETR_TBL
	cmp r15,0
	jz LB_605
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_606
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_606:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_607
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_607:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_608
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_608:
	jmp NS_E_457_MTC_1_failed
LB_605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_573
	btr QWORD [rdi],3
LB_573:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_574
	btr QWORD [rdi],2
LB_574:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_575
	btr QWORD [rdi],1
LB_575:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_576
	btr QWORD [rdi],0
LB_576:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_457_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_459:
NS_E_RDI_459:
NS_E_459_ETR_TBL:
NS_E_459_TBL:
	push r14
; "\194\167"
	jmp LB_711
LB_710:
	add r14,1
LB_711:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_710
	cmp rax,10
	jz LB_710
	cmp rax,32
	jz LB_710
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_713
	jmp NS_E_459_MTC_0_failed
LB_713:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_714
	jmp NS_E_459_MTC_0_failed
LB_714:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_719
LB_718:
	add r14,1
LB_719:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_718
	cmp rax,10
	jz LB_718
	cmp rax,32
	jz LB_718
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_720
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_721
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_721:
	jmp NS_E_459_MTC_0_failed
LB_720:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_724
LB_723:
	add r14,1
LB_724:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_723
	cmp rax,10
	jz LB_723
	cmp rax,32
	jz LB_723
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_726
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_732
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_732:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_733
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_733:
	jmp NS_E_459_MTC_0_failed
LB_726:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_727
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_729
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_729:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_730
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_730:
	jmp NS_E_459_MTC_0_failed
LB_727:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_736
LB_735:
	add r14,1
LB_736:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_735
	cmp rax,10
	jz LB_735
	cmp rax,32
	jz LB_735
	call NS_E_477_ETR_TBL
	cmp r15,0
	jz LB_737
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_738
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_738:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_739
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_739:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_740
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_740:
	jmp NS_E_459_MTC_0_failed
LB_737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_705
	btr QWORD [rdi],3
LB_705:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_706
	btr QWORD [rdi],2
LB_706:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_707
	btr QWORD [rdi],1
LB_707:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_708
	btr QWORD [rdi],0
LB_708:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_459_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_678
LB_677:
	add r14,1
LB_678:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_677
	cmp rax,10
	jz LB_677
	cmp rax,32
	jz LB_677
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_680
	jmp NS_E_459_MTC_1_failed
LB_680:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_681
	jmp NS_E_459_MTC_1_failed
LB_681:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_686
LB_685:
	add r14,1
LB_686:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_685
	cmp rax,10
	jz LB_685
	cmp rax,32
	jz LB_685
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_687
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_688
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_688:
	jmp NS_E_459_MTC_1_failed
LB_687:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_691
LB_690:
	add r14,1
LB_691:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_690
	cmp rax,10
	jz LB_690
	cmp rax,32
	jz LB_690
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_693
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_695
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_695:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_696
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_696:
	jmp NS_E_459_MTC_1_failed
LB_693:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_699
LB_698:
	add r14,1
LB_699:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_698
	cmp rax,10
	jz LB_698
	cmp rax,32
	jz LB_698
	call NS_E_465_ETR_TBL
	cmp r15,0
	jz LB_700
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_701
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_701:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_702
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_702:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_703
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_703:
	jmp NS_E_459_MTC_1_failed
LB_700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_672
	btr QWORD [rdi],3
LB_672:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_673
	btr QWORD [rdi],2
LB_673:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_674
	btr QWORD [rdi],1
LB_674:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_675
	btr QWORD [rdi],0
LB_675:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_459_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_461:
NS_E_RDI_461:
NS_E_461_ETR_TBL:
NS_E_461_TBL:
	push r14
; "\194\167"
	jmp LB_781
LB_780:
	add r14,1
LB_781:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_780
	cmp rax,10
	jz LB_780
	cmp rax,32
	jz LB_780
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_783
	jmp NS_E_461_MTC_0_failed
LB_783:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_784
	jmp NS_E_461_MTC_0_failed
LB_784:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_789
LB_788:
	add r14,1
LB_789:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_788
	cmp rax,10
	jz LB_788
	cmp rax,32
	jz LB_788
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_790
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_791
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_791:
	jmp NS_E_461_MTC_0_failed
LB_790:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_794
LB_793:
	add r14,1
LB_794:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_793
	cmp rax,10
	jz LB_793
	cmp rax,32
	jz LB_793
	call NS_E_489_ETR_TBL
	cmp r15,0
	jz LB_795
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_796
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_796:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_797
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_797:
	jmp NS_E_461_MTC_0_failed
LB_795:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_800
LB_799:
	add r14,1
LB_800:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_799
	cmp rax,10
	jz LB_799
	cmp rax,32
	jz LB_799
	call NS_E_477_ETR_TBL
	cmp r15,0
	jz LB_801
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_802
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_802:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_803
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_803:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_804
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_804:
	jmp NS_E_461_MTC_0_failed
LB_801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_775
	btr QWORD [rdi],3
LB_775:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_776
	btr QWORD [rdi],2
LB_776:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_777
	btr QWORD [rdi],1
LB_777:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_778
	btr QWORD [rdi],0
LB_778:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_461_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_748
LB_747:
	add r14,1
LB_748:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_747
	cmp rax,10
	jz LB_747
	cmp rax,32
	jz LB_747
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_750
	jmp NS_E_461_MTC_1_failed
LB_750:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_751
	jmp NS_E_461_MTC_1_failed
LB_751:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_756
LB_755:
	add r14,1
LB_756:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_755
	cmp rax,10
	jz LB_755
	cmp rax,32
	jz LB_755
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_757
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_758
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_758:
	jmp NS_E_461_MTC_1_failed
LB_757:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_761
LB_760:
	add r14,1
LB_761:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_760
	cmp rax,10
	jz LB_760
	cmp rax,32
	jz LB_760
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_763
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_765
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_765:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_766
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_766:
	jmp NS_E_461_MTC_1_failed
LB_763:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_769
LB_768:
	add r14,1
LB_769:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_768
	cmp rax,10
	jz LB_768
	cmp rax,32
	jz LB_768
	call NS_E_471_ETR_TBL
	cmp r15,0
	jz LB_770
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_771
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_771:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_772
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_772:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_773
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_773:
	jmp NS_E_461_MTC_1_failed
LB_770:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_742
	btr QWORD [rdi],3
LB_742:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_743
	btr QWORD [rdi],2
LB_743:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_744
	btr QWORD [rdi],1
LB_744:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_745
	btr QWORD [rdi],0
LB_745:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_461_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_463:
NS_E_RDI_463:
NS_E_463_ETR_TBL:
NS_E_463_TBL:
	push r14
; "\194\182"
	jmp LB_844
LB_843:
	add r14,1
LB_844:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_843
	cmp rax,10
	jz LB_843
	cmp rax,32
	jz LB_843
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_846
	jmp NS_E_463_MTC_0_failed
LB_846:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_847
	jmp NS_E_463_MTC_0_failed
LB_847:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_852
LB_851:
	add r14,1
LB_852:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_851
	cmp rax,10
	jz LB_851
	cmp rax,32
	jz LB_851
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_853
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_854
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_854:
	jmp NS_E_463_MTC_0_failed
LB_853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_857
LB_856:
	add r14,1
LB_857:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_856
	cmp rax,10
	jz LB_856
	cmp rax,32
	jz LB_856
	call NS_E_473_ETR_TBL
	cmp r15,0
	jz LB_858
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_859
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_859:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_860
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_860:
	jmp NS_E_463_MTC_0_failed
LB_858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_839
	btr QWORD [rdi],2
LB_839:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_840
	btr QWORD [rdi],1
LB_840:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_841
	btr QWORD [rdi],0
LB_841:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_463_MTC_0_failed:
	pop r14
	push r14
; "\194\182"
	jmp LB_812
LB_811:
	add r14,1
LB_812:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_811
	cmp rax,10
	jz LB_811
	cmp rax,32
	jz LB_811
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_814
	jmp NS_E_463_MTC_1_failed
LB_814:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_815
	jmp NS_E_463_MTC_1_failed
LB_815:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_820
LB_819:
	add r14,1
LB_820:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_819
	cmp rax,10
	jz LB_819
	cmp rax,32
	jz LB_819
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_821
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_822
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_822:
	jmp NS_E_463_MTC_1_failed
LB_821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_825
LB_824:
	add r14,1
LB_825:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_824
	cmp rax,10
	jz LB_824
	cmp rax,32
	jz LB_824
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_827
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_829
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_829:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_830
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_830:
	jmp NS_E_463_MTC_1_failed
LB_827:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_833
LB_832:
	add r14,1
LB_833:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_832
	cmp rax,10
	jz LB_832
	cmp rax,32
	jz LB_832
	call NS_E_471_ETR_TBL
	cmp r15,0
	jz LB_834
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_835
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_835:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_836
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_836:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_837
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_837:
	jmp NS_E_463_MTC_1_failed
LB_834:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_806
	btr QWORD [rdi],3
LB_806:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_807
	btr QWORD [rdi],2
LB_807:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_808
	btr QWORD [rdi],1
LB_808:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_809
	btr QWORD [rdi],0
LB_809:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_463_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_465:
NS_E_RDI_465:
NS_E_465_ETR_TBL:
NS_E_465_TBL:
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_867
	jmp NS_E_465_MTC_0_failed
LB_867:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_868
	jmp NS_E_465_MTC_0_failed
LB_868:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_869
	jmp NS_E_465_MTC_0_failed
LB_869:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_870
	jmp NS_E_465_MTC_0_failed
LB_870:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_862
	btr QWORD [rdi],0
LB_862:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_465_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_467:
NS_E_RDI_467:
NS_E_467_ETR_TBL:
NS_E_467_TBL:
	push r14
; cha
	call NS_E_469_ETR_TBL
	cmp r15,0
	jz LB_882
	jmp NS_E_467_MTC_0_failed
LB_882:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_886
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_887
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_887:
	jmp NS_E_467_MTC_0_failed
LB_886:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_877
	btr QWORD [rdi],1
LB_877:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_878
	btr QWORD [rdi],0
LB_878:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_467_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_467_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_469:
NS_E_RDI_469:
NS_E_469_ETR_TBL:
NS_E_469_TBL:
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_910
	jmp NS_E_469_MTC_0_failed
LB_910:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_905
	btr QWORD [rdi],0
LB_905:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_469_MTC_0_failed:
	pop r14
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_902
	jmp NS_E_469_MTC_1_failed
LB_902:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_897
	btr QWORD [rdi],0
LB_897:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_469_MTC_1_failed:
	pop r14
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_894
	jmp NS_E_469_MTC_2_failed
LB_894:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_889
	btr QWORD [rdi],0
LB_889:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_469_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_471:
NS_E_RDI_471:
NS_E_471_ETR_TBL:
NS_E_471_TBL:
	push r14
; word
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_925
	jmp NS_E_471_MTC_0_failed
LB_925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_930
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_932
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_932:
	jmp NS_E_471_MTC_0_failed
LB_930:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_471_ETR_TBL
	cmp r15,0
	jz LB_936
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_937
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_937:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_938
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_938:
	jmp NS_E_471_MTC_0_failed
LB_936:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_919
	btr QWORD [rdi],2
LB_919:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_920
	btr QWORD [rdi],1
LB_920:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_921
	btr QWORD [rdi],0
LB_921:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_471_MTC_0_failed:
	pop r14
	push r14
; word
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_917
	jmp NS_E_471_MTC_1_failed
LB_917:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_913
	btr QWORD [rdi],0
LB_913:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_471_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_473:
NS_E_RDI_473:
NS_E_473_ETR_TBL:
NS_E_473_TBL:
	push r14
; dta_def_coprd
	call NS_E_475_ETR_TBL
	cmp r15,0
	jz LB_944
	jmp NS_E_473_MTC_0_failed
LB_944:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_940
	btr QWORD [rdi],0
LB_940:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_473_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_475:
NS_E_RDI_475:
NS_E_475_ETR_TBL:
NS_E_475_TBL:
	push r14
; "\226\136\144"
	jmp LB_987
LB_986:
	add r14,1
LB_987:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_986
	cmp rax,10
	jz LB_986
	cmp rax,32
	jz LB_986
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_989
	jmp NS_E_475_MTC_0_failed
LB_989:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_990
	jmp NS_E_475_MTC_0_failed
LB_990:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_991
	jmp NS_E_475_MTC_0_failed
LB_991:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_997
LB_996:
	add r14,1
LB_997:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_996
	cmp rax,10
	jz LB_996
	cmp rax,32
	jz LB_996
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_998
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_999
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_999:
	jmp NS_E_475_MTC_0_failed
LB_998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_1002
LB_1001:
	add r14,1
LB_1002:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1001
	cmp rax,10
	jz LB_1001
	cmp rax,32
	jz LB_1001
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_1004
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1006
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1006:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1007
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1007:
	jmp NS_E_475_MTC_0_failed
LB_1004:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_1010
LB_1009:
	add r14,1
LB_1010:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1009
	cmp rax,10
	jz LB_1009
	cmp rax,32
	jz LB_1009
	call NS_E_481_ETR_TBL
	cmp r15,0
	jz LB_1011
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1012
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1012:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1013
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1013:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1014
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1014:
	jmp NS_E_475_MTC_0_failed
LB_1011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_981
	btr QWORD [rdi],3
LB_981:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_982
	btr QWORD [rdi],2
LB_982:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_983
	btr QWORD [rdi],1
LB_983:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_984
	btr QWORD [rdi],0
LB_984:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_475_MTC_0_failed:
	pop r14
	push r14
; "\226\136\144"
	jmp LB_952
LB_951:
	add r14,1
LB_952:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_951
	cmp rax,10
	jz LB_951
	cmp rax,32
	jz LB_951
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_954
	jmp NS_E_475_MTC_1_failed
LB_954:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_955
	jmp NS_E_475_MTC_1_failed
LB_955:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_956
	jmp NS_E_475_MTC_1_failed
LB_956:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_962
LB_961:
	add r14,1
LB_962:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_961
	cmp rax,10
	jz LB_961
	cmp rax,32
	jz LB_961
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_963
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_964
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_964:
	jmp NS_E_475_MTC_1_failed
LB_963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_967
LB_966:
	add r14,1
LB_967:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_966
	cmp rax,10
	jz LB_966
	cmp rax,32
	jz LB_966
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_969
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_971
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_971:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_972
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_972:
	jmp NS_E_475_MTC_1_failed
LB_969:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_975
LB_974:
	add r14,1
LB_975:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_974
	cmp rax,10
	jz LB_974
	cmp rax,32
	jz LB_974
	call NS_E_481_ETR_TBL
	cmp r15,0
	jz LB_976
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_977
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_977:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_978
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_978:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_979
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_979:
	jmp NS_E_475_MTC_1_failed
LB_976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_946
	btr QWORD [rdi],3
LB_946:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_947
	btr QWORD [rdi],2
LB_947:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_948
	btr QWORD [rdi],1
LB_948:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_949
	btr QWORD [rdi],0
LB_949:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_475_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_477:
NS_E_RDI_477:
NS_E_477_ETR_TBL:
NS_E_477_TBL:
	push r14
; op
	jmp LB_1040
LB_1039:
	add r14,1
LB_1040:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1039
	cmp rax,10
	jz LB_1039
	cmp rax,32
	jz LB_1039
	call NS_E_479_ETR_TBL
	cmp r15,0
	jz LB_1041
	jmp NS_E_477_MTC_0_failed
LB_1041:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_1044
LB_1043:
	add r14,1
LB_1044:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1043
	cmp rax,10
	jz LB_1043
	cmp rax,32
	jz LB_1043
	call NS_E_489_ETR_TBL
	cmp r15,0
	jz LB_1045
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1046
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1046:
	jmp NS_E_477_MTC_0_failed
LB_1045:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_1049
LB_1048:
	add r14,1
LB_1049:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1048
	cmp rax,10
	jz LB_1048
	cmp rax,32
	jz LB_1048
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1051
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1061
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1061:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1062
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1062:
	jmp NS_E_477_MTC_0_failed
LB_1051:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_1052
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1058
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1058:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1059
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1059:
	jmp NS_E_477_MTC_0_failed
LB_1052:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_1053
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1055
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1055:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1056
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1056:
	jmp NS_E_477_MTC_0_failed
LB_1053:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_1065
LB_1064:
	add r14,1
LB_1065:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1064
	cmp rax,10
	jz LB_1064
	cmp rax,32
	jz LB_1064
	call NS_E_489_ETR_TBL
	cmp r15,0
	jz LB_1066
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1067
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1067:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1068
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1068:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1069
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1069:
	jmp NS_E_477_MTC_0_failed
LB_1066:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1034
	btr QWORD [rdi],3
LB_1034:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1035
	btr QWORD [rdi],2
LB_1035:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1036
	btr QWORD [rdi],1
LB_1036:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1037
	btr QWORD [rdi],0
LB_1037:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_477_MTC_0_failed:
	pop r14
	push r14
; "\226\136\142"
	jmp LB_1020
LB_1019:
	add r14,1
LB_1020:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1019
	cmp rax,10
	jz LB_1019
	cmp rax,32
	jz LB_1019
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1022
	jmp NS_E_477_MTC_1_failed
LB_1022:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_1023
	jmp NS_E_477_MTC_1_failed
LB_1023:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_1024
	jmp NS_E_477_MTC_1_failed
LB_1024:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_1030
LB_1029:
	add r14,1
LB_1030:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1029
	cmp rax,10
	jz LB_1029
	cmp rax,32
	jz LB_1029
	call NS_E_489_ETR_TBL
	cmp r15,0
	jz LB_1031
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1032
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1032:
	jmp NS_E_477_MTC_1_failed
LB_1031:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1016
	btr QWORD [rdi],1
LB_1016:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1017
	btr QWORD [rdi],0
LB_1017:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_477_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_479:
NS_E_RDI_479:
NS_E_479_ETR_TBL:
NS_E_479_TBL:
	push r14
; name
	jmp LB_1090
LB_1089:
	add r14,1
LB_1090:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1089
	cmp rax,10
	jz LB_1089
	cmp rax,32
	jz LB_1089
	call NS_E_471_ETR_TBL
	cmp r15,0
	jz LB_1091
	jmp NS_E_479_MTC_0_failed
LB_1091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1087
	btr QWORD [rdi],0
LB_1087:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_479_MTC_0_failed:
	pop r14
	push r14
; "\194\187"
	jmp LB_1075
LB_1074:
	add r14,1
LB_1075:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1074
	cmp rax,10
	jz LB_1074
	cmp rax,32
	jz LB_1074
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1077
	jmp NS_E_479_MTC_1_failed
LB_1077:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_1078
	jmp NS_E_479_MTC_1_failed
LB_1078:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_1083
LB_1082:
	add r14,1
LB_1083:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1082
	cmp rax,10
	jz LB_1082
	cmp rax,32
	jz LB_1082
	call NS_E_465_ETR_TBL
	cmp r15,0
	jz LB_1084
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1085
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1085:
	jmp NS_E_479_MTC_1_failed
LB_1084:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1071
	btr QWORD [rdi],1
LB_1071:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1072
	btr QWORD [rdi],0
LB_1072:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_479_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_481:
NS_E_RDI_481:
NS_E_481_ETR_TBL:
NS_E_481_TBL:
	push r14
; type_imp
	call NS_E_483_ETR_TBL
	cmp r15,0
	jz LB_1097
	jmp NS_E_481_MTC_0_failed
LB_1097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1093
	btr QWORD [rdi],0
LB_1093:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_481_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_483:
NS_E_RDI_483:
NS_E_483_ETR_TBL:
NS_E_483_TBL:
	push r14
; type_app
	jmp LB_1110
LB_1109:
	add r14,1
LB_1110:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1109
	cmp rax,10
	jz LB_1109
	cmp rax,32
	jz LB_1109
	call NS_E_485_ETR_TBL
	cmp r15,0
	jz LB_1111
	jmp NS_E_483_MTC_0_failed
LB_1111:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_1114
LB_1113:
	add r14,1
LB_1114:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1113
	cmp rax,10
	jz LB_1113
	cmp rax,32
	jz LB_1113
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1116
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1124
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1124:
	jmp NS_E_483_MTC_0_failed
LB_1116:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_1117
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1122
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1122:
	jmp NS_E_483_MTC_0_failed
LB_1117:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_1118
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1120
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1120:
	jmp NS_E_483_MTC_0_failed
LB_1118:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_1127
LB_1126:
	add r14,1
LB_1127:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1126
	cmp rax,10
	jz LB_1126
	cmp rax,32
	jz LB_1126
	call NS_E_483_ETR_TBL
	cmp r15,0
	jz LB_1128
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1129
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1129:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1130
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1130:
	jmp NS_E_483_MTC_0_failed
LB_1128:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1105
	btr QWORD [rdi],2
LB_1105:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1106
	btr QWORD [rdi],1
LB_1106:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1107
	btr QWORD [rdi],0
LB_1107:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_483_MTC_0_failed:
	pop r14
	push r14
; type_app
	jmp LB_1102
LB_1101:
	add r14,1
LB_1102:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1101
	cmp rax,10
	jz LB_1101
	cmp rax,32
	jz LB_1101
	call NS_E_485_ETR_TBL
	cmp r15,0
	jz LB_1103
	jmp NS_E_483_MTC_1_failed
LB_1103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1099
	btr QWORD [rdi],0
LB_1099:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_483_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_485:
NS_E_RDI_485:
NS_E_485_ETR_TBL:
NS_E_485_TBL:
	push r14
; type_atm
	jmp LB_1143
LB_1142:
	add r14,1
LB_1143:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1142
	cmp rax,10
	jz LB_1142
	cmp rax,32
	jz LB_1142
	call NS_E_487_ETR_TBL
	cmp r15,0
	jz LB_1144
	jmp NS_E_485_MTC_0_failed
LB_1144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_1147
LB_1146:
	add r14,1
LB_1147:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1146
	cmp rax,10
	jz LB_1146
	cmp rax,32
	jz LB_1146
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1149
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1157
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1157:
	jmp NS_E_485_MTC_0_failed
LB_1149:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_1150
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1155
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1155:
	jmp NS_E_485_MTC_0_failed
LB_1150:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_1151
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1153
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1153:
	jmp NS_E_485_MTC_0_failed
LB_1151:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_1160
LB_1159:
	add r14,1
LB_1160:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1159
	cmp rax,10
	jz LB_1159
	cmp rax,32
	jz LB_1159
	call NS_E_487_ETR_TBL
	cmp r15,0
	jz LB_1161
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1162
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1162:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1163
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1163:
	jmp NS_E_485_MTC_0_failed
LB_1161:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1138
	btr QWORD [rdi],2
LB_1138:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1139
	btr QWORD [rdi],1
LB_1139:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1140
	btr QWORD [rdi],0
LB_1140:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_485_MTC_0_failed:
	pop r14
	push r14
; type_atm
	jmp LB_1135
LB_1134:
	add r14,1
LB_1135:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1134
	cmp rax,10
	jz LB_1134
	cmp rax,32
	jz LB_1134
	call NS_E_487_ETR_TBL
	cmp r15,0
	jz LB_1136
	jmp NS_E_485_MTC_1_failed
LB_1136:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1132
	btr QWORD [rdi],0
LB_1132:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_485_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_487:
NS_E_RDI_487:
NS_E_487_ETR_TBL:
NS_E_487_TBL:
	push r14
; word
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_1169
	jmp NS_E_487_MTC_0_failed
LB_1169:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1165
	btr QWORD [rdi],0
LB_1165:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_487_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_489:
NS_E_RDI_489:
NS_E_489_ETR_TBL:
NS_E_489_TBL:
	push r14
; "{"
	jmp LB_1182
LB_1181:
	add r14,1
LB_1182:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1181
	cmp rax,10
	jz LB_1181
	cmp rax,32
	jz LB_1181
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_1184
	jmp NS_E_489_MTC_0_failed
LB_1184:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_1188
LB_1187:
	add r14,1
LB_1188:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1187
	cmp rax,10
	jz LB_1187
	cmp rax,32
	jz LB_1187
	call NS_E_491_ETR_TBL
	cmp r15,0
	jz LB_1189
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1190
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1190:
	jmp NS_E_489_MTC_0_failed
LB_1189:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_1193
LB_1192:
	add r14,1
LB_1193:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1192
	cmp rax,10
	jz LB_1192
	cmp rax,32
	jz LB_1192
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_1195
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1197
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1197:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1198
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1198:
	jmp NS_E_489_MTC_0_failed
LB_1195:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1177
	btr QWORD [rdi],2
LB_1177:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1178
	btr QWORD [rdi],1
LB_1178:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1179
	btr QWORD [rdi],0
LB_1179:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_489_MTC_0_failed:
	pop r14
	push r14
; reg
	jmp LB_1174
LB_1173:
	add r14,1
LB_1174:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1173
	cmp rax,10
	jz LB_1173
	cmp rax,32
	jz LB_1173
	call NS_E_493_ETR_TBL
	cmp r15,0
	jz LB_1175
	jmp NS_E_489_MTC_1_failed
LB_1175:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1171
	btr QWORD [rdi],0
LB_1171:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_489_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_491:
NS_E_RDI_491:
NS_E_491_ETR_TBL:
NS_E_491_TBL:
	push r14
; reg
	jmp LB_1205
LB_1204:
	add r14,1
LB_1205:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1204
	cmp rax,10
	jz LB_1204
	cmp rax,32
	jz LB_1204
	call NS_E_493_ETR_TBL
	cmp r15,0
	jz LB_1206
	jmp NS_E_491_MTC_0_failed
LB_1206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_1209
LB_1208:
	add r14,1
LB_1209:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1208
	cmp rax,10
	jz LB_1208
	cmp rax,32
	jz LB_1208
	call NS_E_491_ETR_TBL
	cmp r15,0
	jz LB_1210
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1211
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1211:
	jmp NS_E_491_MTC_0_failed
LB_1210:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1201
	btr QWORD [rdi],1
LB_1201:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1202
	btr QWORD [rdi],0
LB_1202:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_491_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_491_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_493:
NS_E_RDI_493:
NS_E_493_ETR_TBL:
NS_E_493_TBL:
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_1233
	jmp NS_E_493_MTC_0_failed
LB_1233:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_1238
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1239
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1239:
	jmp NS_E_493_MTC_0_failed
LB_1238:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1227
	btr QWORD [rdi],1
LB_1227:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1228
	btr QWORD [rdi],0
LB_1228:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_493_MTC_0_failed:
	pop r14
	push r14
; word
	jmp LB_1224
LB_1223:
	add r14,1
LB_1224:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1223
	cmp rax,10
	jz LB_1223
	cmp rax,32
	jz LB_1223
	call NS_E_467_ETR_TBL
	cmp r15,0
	jz LB_1225
	jmp NS_E_493_MTC_1_failed
LB_1225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1221
	btr QWORD [rdi],0
LB_1221:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_493_MTC_1_failed:
	pop r14
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_1218
	jmp NS_E_493_MTC_2_failed
LB_1218:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1213
	btr QWORD [rdi],0
LB_1213:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_493_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1250:
NS_E_RDI_1250:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 a \n"
	mov rsi,0x_0a_20_61_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; 	» "a" _ ⊢ 1' : %_1242
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_1243 : %_1243
 ; {>  %_1242~1':_stg %_1241~0':_stg }
; 	» 0xr0 _ ⊢ 2' : %_1243
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f457 { %_1241 %_1243 } ⊢ { %_1244 %_1245 %_1246 } : { %_1244 %_1245 %_1246 }
 ; {>  %_1242~1':_stg %_1243~2':_r64 %_1241~0':_stg }
; _f457 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_1253
	btr r12,1
	jmp LB_1254
LB_1253:
	bts r12,1
LB_1254:
	call NS_E_457
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_1255
	btr r12,4
	jmp LB_1256
LB_1255:
	bts r12,4
LB_1256:
	mov r8,r9
	bt r12,4
	jc LB_1259
	btr r12,3
	jmp LB_1260
LB_1259:
	bts r12,3
LB_1260:
	mov rsi,0
	bt r12,3
	jc LB_1257
	bts rsi,17
	bt r8,0
	jc LB_1257
	jmp LB_1258
LB_1257:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_1258:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_1261
	btr r12,2
	jmp LB_1262
LB_1261:
	bts r12,2
LB_1262:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_1251
	btr r12,1
	jmp LB_1252
LB_1251:
	bts r12,1
LB_1252:
	add rsp,16
; _f14 { %_1242 %_1245 %_1246 } ⊢ { %_1247 %_1248 %_1249 } : { %_1247 %_1248 %_1249 }
 ; {>  %_1242~1':_stg %_1245~2':_r64 %_1244~0':_stg %_1246~3':(_opn)◂(_p456) }
; _f14 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_1267
	btr r12,4
	jmp LB_1268
LB_1267:
	bts r12,4
LB_1268:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_1265
	btr QWORD [rdi],0
	jmp LB_1266
LB_1265:
	bts QWORD [rdi],0
LB_1266:
	mov r9,r15
	bt r12,2
	jc LB_1271
	btr r12,4
	jmp LB_1272
LB_1271:
	bts r12,4
LB_1272:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_1269
	btr QWORD [rdi],1
	jmp LB_1270
LB_1269:
	bts QWORD [rdi],1
LB_1270:
	mov r9,r8
	bt r12,3
	jc LB_1275
	btr r12,4
	jmp LB_1276
LB_1275:
	bts r12,4
LB_1276:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_1273
	btr QWORD [rdi],2
	jmp LB_1274
LB_1273:
	bts QWORD [rdi],2
LB_1274:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1279
	btr r12,4
	jmp LB_1280
LB_1279:
	bts r12,4
LB_1280:
	mov r14,r9
	bt r12,4
	jc LB_1277
	btr r12,1
	jmp LB_1278
LB_1277:
	bts r12,1
LB_1278:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1283
	btr r12,4
	jmp LB_1284
LB_1283:
	bts r12,4
LB_1284:
	mov r15,r9
	bt r12,4
	jc LB_1281
	btr r12,2
	jmp LB_1282
LB_1281:
	bts r12,2
LB_1282:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_1287
	btr r12,4
	jmp LB_1288
LB_1287:
	bts r12,4
LB_1288:
	mov r8,r9
	bt r12,4
	jc LB_1285
	btr r12,3
	jmp LB_1286
LB_1285:
	bts r12,3
LB_1286:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1263
	btr r12,0
	jmp LB_1264
LB_1263:
	bts r12,0
LB_1264:
	add rsp,16
; ∎ {  }
 ; {>  %_1248~2':_r64 %_1244~0':_stg %_1249~3':(_opn)◂(_p456) %_1247~1':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_1289
	mov rdi,r15
	call dlt
LB_1289:
	bt r12,0
	jc LB_1290
	mov rdi,r13
	call dlt
LB_1290:
	bt r12,3
	jc LB_1291
	mov rdi,r8
	call dlt
LB_1291:
	bt r12,1
	jc LB_1292
	mov rdi,r14
	call dlt
LB_1292:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_448:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_448
	NS_E_DYN_449:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_449
	NS_E_DYN_450:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_450
	NS_E_DYN_451:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_451
	NS_E_DYN_494:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_495:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_453:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_453
	NS_E_DYN_496:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_497:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_498:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_499:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_455:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_455
	NS_E_DYN_500:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_501:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_457:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_457
	NS_E_DYN_502:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_503:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_459:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_459
	NS_E_DYN_504:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_505:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_461:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_461
	NS_E_DYN_506:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_507:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_463:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_463
	NS_E_DYN_508:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_465:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_465
	NS_E_DYN_509:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_510:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_467:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_467
	NS_E_DYN_511:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_512:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_513:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_469:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_469
	NS_E_DYN_514:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_515:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_471:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_471
	NS_E_DYN_516:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_473:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_473
	NS_E_DYN_517:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_518:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_475:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_475
	NS_E_DYN_519:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_520:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_477:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_477
	NS_E_DYN_521:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_522:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_479:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_479
	NS_E_DYN_523:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_481:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_481
	NS_E_DYN_524:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_525:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_483:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_483
	NS_E_DYN_526:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_527:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_485:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_485
	NS_E_DYN_528:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_487:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_487
	NS_E_DYN_529:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_530:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_489:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_489
	NS_E_DYN_531:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_532:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_491:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_491
	NS_E_DYN_533:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_534:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_535:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_493:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_493
	CST_DYN_1250:
		dq 0x0001_0001_00_82_ffff
		dq 1
