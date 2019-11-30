%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_5177
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
NS_E_4375:
NS_E_RDI_4375:
NS_E_4375_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_4375_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_4375_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4376:
NS_E_RDI_4376:
NS_E_4376_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_4376_LB_0
	cmp r11,57
	ja NS_E_4376_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_4376_LB_0:
	mov rax,0
	ret
NS_E_4378:
NS_E_RDI_4378:
NS_E_4378_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_4378_LB_0
	cmp r11,122
	ja NS_E_4378_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_4378_LB_0:
	mov rax,0
	ret
NS_E_4377:
NS_E_RDI_4377:
NS_E_4377_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_4377_LB_0
	cmp r11,90
	ja NS_E_4377_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_4377_LB_0:
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
NS_E_4380:
NS_E_RDI_4380:
NS_E_4380_ETR_TBL:
NS_E_4380_TBL:
	push r14
; glb_etr
	call NS_E_4380_ETR_TBL
	cmp r15,0
	jz LB_4469
	jmp NS_E_4380_MTC_0_failed
LB_4469:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_4380_ETR_TBL
	cmp r15,0
	jz LB_4473
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4474
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4474:
	jmp NS_E_4380_MTC_0_failed
LB_4473:
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
	jc LB_4464
	btr QWORD [rdi],1
LB_4464:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4465
	btr QWORD [rdi],0
LB_4465:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4380_MTC_0_failed:
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
NS_E_4380_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4382:
NS_E_RDI_4382:
NS_E_4382_ETR_TBL:
NS_E_4382_TBL:
	push r14
; mdl_etr
	call NS_E_4382_ETR_TBL
	cmp r15,0
	jz LB_4498
	jmp NS_E_4382_MTC_0_failed
LB_4498:
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
	jc LB_4494
	btr QWORD [rdi],0
LB_4494:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4382_MTC_0_failed:
	pop r14
	push r14
; cst_etr
	call NS_E_4382_ETR_TBL
	cmp r15,0
	jz LB_4492
	jmp NS_E_4382_MTC_1_failed
LB_4492:
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
	jc LB_4488
	btr QWORD [rdi],0
LB_4488:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4382_MTC_1_failed:
	pop r14
	push r14
; op_etr
	call NS_E_4382_ETR_TBL
	cmp r15,0
	jz LB_4486
	jmp NS_E_4382_MTC_2_failed
LB_4486:
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
	jc LB_4482
	btr QWORD [rdi],0
LB_4482:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4382_MTC_2_failed:
	pop r14
	push r14
; dta_etr
	call NS_E_4382_ETR_TBL
	cmp r15,0
	jz LB_4480
	jmp NS_E_4382_MTC_3_failed
LB_4480:
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
	jc LB_4476
	btr QWORD [rdi],0
LB_4476:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4382_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4384:
NS_E_RDI_4384:
NS_E_4384_ETR_TBL:
NS_E_4384_TBL:
	push r14
; "\194\167\194\167"
	jmp LB_4543
LB_4542:
	add r14,1
LB_4543:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4542
	cmp rax,10
	jz LB_4542
	cmp rax,32
	jz LB_4542
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4545
	jmp NS_E_4384_MTC_0_failed
LB_4545:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_4546
	jmp NS_E_4384_MTC_0_failed
LB_4546:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_4547
	jmp NS_E_4384_MTC_0_failed
LB_4547:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_4548
	jmp NS_E_4384_MTC_0_failed
LB_4548:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4555
LB_4554:
	add r14,1
LB_4555:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4554
	cmp rax,10
	jz LB_4554
	cmp rax,32
	jz LB_4554
	call NS_E_4384_ETR_TBL
	cmp r15,0
	jz LB_4556
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4557
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4557:
	jmp NS_E_4384_MTC_0_failed
LB_4556:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_4560
LB_4559:
	add r14,1
LB_4560:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4559
	cmp rax,10
	jz LB_4559
	cmp rax,32
	jz LB_4559
	call NS_E_4384_ETR_TBL
	cmp r15,0
	jz LB_4561
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4562
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4562:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4563
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4563:
	jmp NS_E_4384_MTC_0_failed
LB_4561:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_4566
LB_4565:
	add r14,1
LB_4566:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4565
	cmp rax,10
	jz LB_4565
	cmp rax,32
	jz LB_4565
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_4568
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4595
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4595:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4596
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4596:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4597
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4597:
	jmp NS_E_4384_MTC_0_failed
LB_4568:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_4569
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4591
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4591:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4592
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4592:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4593
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4593:
	jmp NS_E_4384_MTC_0_failed
LB_4569:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_4570
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4587
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4587:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4588
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4588:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4589
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4589:
	jmp NS_E_4384_MTC_0_failed
LB_4570:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_4571
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4583
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4583:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4584
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4584:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4585
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4585:
	jmp NS_E_4384_MTC_0_failed
LB_4571:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_4572
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4579
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4579:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4580
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4580:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4581
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4581:
	jmp NS_E_4384_MTC_0_failed
LB_4572:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_4573
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4575
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4575:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4576
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4576:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4577
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4577:
	jmp NS_E_4384_MTC_0_failed
LB_4573:
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
	jc LB_4537
	btr QWORD [rdi],3
LB_4537:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4538
	btr QWORD [rdi],2
LB_4538:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4539
	btr QWORD [rdi],1
LB_4539:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4540
	btr QWORD [rdi],0
LB_4540:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4384_MTC_0_failed:
	pop r14
	push r14
; "\194\167\194\167"
	jmp LB_4506
LB_4505:
	add r14,1
LB_4506:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4505
	cmp rax,10
	jz LB_4505
	cmp rax,32
	jz LB_4505
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4508
	jmp NS_E_4384_MTC_1_failed
LB_4508:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_4509
	jmp NS_E_4384_MTC_1_failed
LB_4509:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_4510
	jmp NS_E_4384_MTC_1_failed
LB_4510:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_4511
	jmp NS_E_4384_MTC_1_failed
LB_4511:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4518
LB_4517:
	add r14,1
LB_4518:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4517
	cmp rax,10
	jz LB_4517
	cmp rax,32
	jz LB_4517
	call NS_E_4384_ETR_TBL
	cmp r15,0
	jz LB_4519
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4520
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4520:
	jmp NS_E_4384_MTC_1_failed
LB_4519:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_4523
LB_4522:
	add r14,1
LB_4523:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4522
	cmp rax,10
	jz LB_4522
	cmp rax,32
	jz LB_4522
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_4525
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4527
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4527:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4528
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4528:
	jmp NS_E_4384_MTC_1_failed
LB_4525:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_4531
LB_4530:
	add r14,1
LB_4531:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4530
	cmp rax,10
	jz LB_4530
	cmp rax,32
	jz LB_4530
	call NS_E_4384_ETR_TBL
	cmp r15,0
	jz LB_4532
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4533
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4533:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4534
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4534:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4535
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4535:
	jmp NS_E_4384_MTC_1_failed
LB_4532:
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
	jc LB_4500
	btr QWORD [rdi],3
LB_4500:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4501
	btr QWORD [rdi],2
LB_4501:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4502
	btr QWORD [rdi],1
LB_4502:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4503
	btr QWORD [rdi],0
LB_4503:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4384_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4386:
NS_E_RDI_4386:
NS_E_4386_ETR_TBL:
NS_E_4386_TBL:
	push r14
; "\194\167"
	jmp LB_4638
LB_4637:
	add r14,1
LB_4638:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4637
	cmp rax,10
	jz LB_4637
	cmp rax,32
	jz LB_4637
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4640
	jmp NS_E_4386_MTC_0_failed
LB_4640:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_4641
	jmp NS_E_4386_MTC_0_failed
LB_4641:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4646
LB_4645:
	add r14,1
LB_4646:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4645
	cmp rax,10
	jz LB_4645
	cmp rax,32
	jz LB_4645
	call NS_E_4386_ETR_TBL
	cmp r15,0
	jz LB_4647
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4648
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4648:
	jmp NS_E_4386_MTC_0_failed
LB_4647:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_4651
LB_4650:
	add r14,1
LB_4651:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4650
	cmp rax,10
	jz LB_4650
	cmp rax,32
	jz LB_4650
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4653
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4659
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4659:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4660
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4660:
	jmp NS_E_4386_MTC_0_failed
LB_4653:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_4654
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4656
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4656:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4657
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4657:
	jmp NS_E_4386_MTC_0_failed
LB_4654:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_4663
LB_4662:
	add r14,1
LB_4663:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4662
	cmp rax,10
	jz LB_4662
	cmp rax,32
	jz LB_4662
	call NS_E_4386_ETR_TBL
	cmp r15,0
	jz LB_4664
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4665
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4665:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4666
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4666:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4667
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4667:
	jmp NS_E_4386_MTC_0_failed
LB_4664:
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
	jc LB_4632
	btr QWORD [rdi],3
LB_4632:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4633
	btr QWORD [rdi],2
LB_4633:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4634
	btr QWORD [rdi],1
LB_4634:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4635
	btr QWORD [rdi],0
LB_4635:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4386_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_4605
LB_4604:
	add r14,1
LB_4605:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4604
	cmp rax,10
	jz LB_4604
	cmp rax,32
	jz LB_4604
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4607
	jmp NS_E_4386_MTC_1_failed
LB_4607:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_4608
	jmp NS_E_4386_MTC_1_failed
LB_4608:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4613
LB_4612:
	add r14,1
LB_4613:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4612
	cmp rax,10
	jz LB_4612
	cmp rax,32
	jz LB_4612
	call NS_E_4386_ETR_TBL
	cmp r15,0
	jz LB_4614
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4615
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4615:
	jmp NS_E_4386_MTC_1_failed
LB_4614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_4618
LB_4617:
	add r14,1
LB_4618:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4617
	cmp rax,10
	jz LB_4617
	cmp rax,32
	jz LB_4617
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_4620
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4622
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4622:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4623
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4623:
	jmp NS_E_4386_MTC_1_failed
LB_4620:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_4626
LB_4625:
	add r14,1
LB_4626:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4625
	cmp rax,10
	jz LB_4625
	cmp rax,32
	jz LB_4625
	call NS_E_4386_ETR_TBL
	cmp r15,0
	jz LB_4627
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4628
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4628:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4629
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4629:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4630
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4630:
	jmp NS_E_4386_MTC_1_failed
LB_4627:
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
	jc LB_4599
	btr QWORD [rdi],3
LB_4599:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4600
	btr QWORD [rdi],2
LB_4600:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4601
	btr QWORD [rdi],1
LB_4601:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4602
	btr QWORD [rdi],0
LB_4602:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4386_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4388:
NS_E_RDI_4388:
NS_E_4388_ETR_TBL:
NS_E_4388_TBL:
	push r14
; "\194\167"
	jmp LB_4708
LB_4707:
	add r14,1
LB_4708:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4707
	cmp rax,10
	jz LB_4707
	cmp rax,32
	jz LB_4707
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4710
	jmp NS_E_4388_MTC_0_failed
LB_4710:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_4711
	jmp NS_E_4388_MTC_0_failed
LB_4711:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4716
LB_4715:
	add r14,1
LB_4716:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4715
	cmp rax,10
	jz LB_4715
	cmp rax,32
	jz LB_4715
	call NS_E_4388_ETR_TBL
	cmp r15,0
	jz LB_4717
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4718
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4718:
	jmp NS_E_4388_MTC_0_failed
LB_4717:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_4721
LB_4720:
	add r14,1
LB_4721:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4720
	cmp rax,10
	jz LB_4720
	cmp rax,32
	jz LB_4720
	call NS_E_4388_ETR_TBL
	cmp r15,0
	jz LB_4722
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4723
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4723:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4724
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4724:
	jmp NS_E_4388_MTC_0_failed
LB_4722:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_4727
LB_4726:
	add r14,1
LB_4727:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4726
	cmp rax,10
	jz LB_4726
	cmp rax,32
	jz LB_4726
	call NS_E_4388_ETR_TBL
	cmp r15,0
	jz LB_4728
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4729
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4729:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4730
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4730:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4731
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4731:
	jmp NS_E_4388_MTC_0_failed
LB_4728:
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
	jc LB_4702
	btr QWORD [rdi],3
LB_4702:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4703
	btr QWORD [rdi],2
LB_4703:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4704
	btr QWORD [rdi],1
LB_4704:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4705
	btr QWORD [rdi],0
LB_4705:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4388_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_4675
LB_4674:
	add r14,1
LB_4675:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4674
	cmp rax,10
	jz LB_4674
	cmp rax,32
	jz LB_4674
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4677
	jmp NS_E_4388_MTC_1_failed
LB_4677:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_4678
	jmp NS_E_4388_MTC_1_failed
LB_4678:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4683
LB_4682:
	add r14,1
LB_4683:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4682
	cmp rax,10
	jz LB_4682
	cmp rax,32
	jz LB_4682
	call NS_E_4388_ETR_TBL
	cmp r15,0
	jz LB_4684
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4685
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4685:
	jmp NS_E_4388_MTC_1_failed
LB_4684:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_4688
LB_4687:
	add r14,1
LB_4688:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4687
	cmp rax,10
	jz LB_4687
	cmp rax,32
	jz LB_4687
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_4690
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4692
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4692:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4693
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4693:
	jmp NS_E_4388_MTC_1_failed
LB_4690:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_4696
LB_4695:
	add r14,1
LB_4696:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4695
	cmp rax,10
	jz LB_4695
	cmp rax,32
	jz LB_4695
	call NS_E_4388_ETR_TBL
	cmp r15,0
	jz LB_4697
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4698
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4698:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4699
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4699:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4700
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4700:
	jmp NS_E_4388_MTC_1_failed
LB_4697:
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
	jc LB_4669
	btr QWORD [rdi],3
LB_4669:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4670
	btr QWORD [rdi],2
LB_4670:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4671
	btr QWORD [rdi],1
LB_4671:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4672
	btr QWORD [rdi],0
LB_4672:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4388_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4390:
NS_E_RDI_4390:
NS_E_4390_ETR_TBL:
NS_E_4390_TBL:
	push r14
; "\194\182"
	jmp LB_4771
LB_4770:
	add r14,1
LB_4771:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4770
	cmp rax,10
	jz LB_4770
	cmp rax,32
	jz LB_4770
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4773
	jmp NS_E_4390_MTC_0_failed
LB_4773:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_4774
	jmp NS_E_4390_MTC_0_failed
LB_4774:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4779
LB_4778:
	add r14,1
LB_4779:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4778
	cmp rax,10
	jz LB_4778
	cmp rax,32
	jz LB_4778
	call NS_E_4390_ETR_TBL
	cmp r15,0
	jz LB_4780
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4781
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4781:
	jmp NS_E_4390_MTC_0_failed
LB_4780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_4784
LB_4783:
	add r14,1
LB_4784:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4783
	cmp rax,10
	jz LB_4783
	cmp rax,32
	jz LB_4783
	call NS_E_4390_ETR_TBL
	cmp r15,0
	jz LB_4785
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4786
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4786:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4787
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4787:
	jmp NS_E_4390_MTC_0_failed
LB_4785:
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
	jc LB_4766
	btr QWORD [rdi],2
LB_4766:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4767
	btr QWORD [rdi],1
LB_4767:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4768
	btr QWORD [rdi],0
LB_4768:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4390_MTC_0_failed:
	pop r14
	push r14
; "\194\182"
	jmp LB_4739
LB_4738:
	add r14,1
LB_4739:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4738
	cmp rax,10
	jz LB_4738
	cmp rax,32
	jz LB_4738
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_4741
	jmp NS_E_4390_MTC_1_failed
LB_4741:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_4742
	jmp NS_E_4390_MTC_1_failed
LB_4742:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4747
LB_4746:
	add r14,1
LB_4747:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4746
	cmp rax,10
	jz LB_4746
	cmp rax,32
	jz LB_4746
	call NS_E_4390_ETR_TBL
	cmp r15,0
	jz LB_4748
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4749
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4749:
	jmp NS_E_4390_MTC_1_failed
LB_4748:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_4752
LB_4751:
	add r14,1
LB_4752:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4751
	cmp rax,10
	jz LB_4751
	cmp rax,32
	jz LB_4751
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_4754
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4756
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4756:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4757
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4757:
	jmp NS_E_4390_MTC_1_failed
LB_4754:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_4760
LB_4759:
	add r14,1
LB_4760:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4759
	cmp rax,10
	jz LB_4759
	cmp rax,32
	jz LB_4759
	call NS_E_4390_ETR_TBL
	cmp r15,0
	jz LB_4761
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4762
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4762:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4763
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4763:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4764
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4764:
	jmp NS_E_4390_MTC_1_failed
LB_4761:
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
	jc LB_4733
	btr QWORD [rdi],3
LB_4733:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4734
	btr QWORD [rdi],2
LB_4734:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4735
	btr QWORD [rdi],1
LB_4735:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4736
	btr QWORD [rdi],0
LB_4736:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4390_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4392:
NS_E_RDI_4392:
NS_E_4392_ETR_TBL:
NS_E_4392_TBL:
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_4794
	jmp NS_E_4392_MTC_0_failed
LB_4794:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_4795
	jmp NS_E_4392_MTC_0_failed
LB_4795:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_4796
	jmp NS_E_4392_MTC_0_failed
LB_4796:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_4797
	jmp NS_E_4392_MTC_0_failed
LB_4797:
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
	jc LB_4789
	btr QWORD [rdi],0
LB_4789:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4392_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4394:
NS_E_RDI_4394:
NS_E_4394_ETR_TBL:
NS_E_4394_TBL:
	push r14
; cha
	call NS_E_4394_ETR_TBL
	cmp r15,0
	jz LB_4809
	jmp NS_E_4394_MTC_0_failed
LB_4809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_4394_ETR_TBL
	cmp r15,0
	jz LB_4813
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4814
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4814:
	jmp NS_E_4394_MTC_0_failed
LB_4813:
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
	jc LB_4804
	btr QWORD [rdi],1
LB_4804:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4805
	btr QWORD [rdi],0
LB_4805:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4394_MTC_0_failed:
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
NS_E_4394_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4396:
NS_E_RDI_4396:
NS_E_4396_ETR_TBL:
NS_E_4396_TBL:
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_4837
	jmp NS_E_4396_MTC_0_failed
LB_4837:
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
	jc LB_4832
	btr QWORD [rdi],0
LB_4832:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4396_MTC_0_failed:
	pop r14
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_4829
	jmp NS_E_4396_MTC_1_failed
LB_4829:
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
	jc LB_4824
	btr QWORD [rdi],0
LB_4824:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4396_MTC_1_failed:
	pop r14
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_4821
	jmp NS_E_4396_MTC_2_failed
LB_4821:
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
	jc LB_4816
	btr QWORD [rdi],0
LB_4816:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4396_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4398:
NS_E_RDI_4398:
NS_E_4398_ETR_TBL:
NS_E_4398_TBL:
	push r14
; word
	call NS_E_4398_ETR_TBL
	cmp r15,0
	jz LB_4852
	jmp NS_E_4398_MTC_0_failed
LB_4852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_4857
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4859
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4859:
	jmp NS_E_4398_MTC_0_failed
LB_4857:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_4398_ETR_TBL
	cmp r15,0
	jz LB_4863
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4864
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4864:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4865
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4865:
	jmp NS_E_4398_MTC_0_failed
LB_4863:
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
	jc LB_4846
	btr QWORD [rdi],2
LB_4846:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4847
	btr QWORD [rdi],1
LB_4847:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4848
	btr QWORD [rdi],0
LB_4848:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4398_MTC_0_failed:
	pop r14
	push r14
; word
	call NS_E_4398_ETR_TBL
	cmp r15,0
	jz LB_4844
	jmp NS_E_4398_MTC_1_failed
LB_4844:
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
	jc LB_4840
	btr QWORD [rdi],0
LB_4840:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4398_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4400:
NS_E_RDI_4400:
NS_E_4400_ETR_TBL:
NS_E_4400_TBL:
	push r14
; dta_def_coprd
	call NS_E_4400_ETR_TBL
	cmp r15,0
	jz LB_4871
	jmp NS_E_4400_MTC_0_failed
LB_4871:
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
	jc LB_4867
	btr QWORD [rdi],0
LB_4867:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4400_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4402:
NS_E_RDI_4402:
NS_E_4402_ETR_TBL:
NS_E_4402_TBL:
	push r14
; "\226\136\144"
	jmp LB_4914
LB_4913:
	add r14,1
LB_4914:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4913
	cmp rax,10
	jz LB_4913
	cmp rax,32
	jz LB_4913
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_4916
	jmp NS_E_4402_MTC_0_failed
LB_4916:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_4917
	jmp NS_E_4402_MTC_0_failed
LB_4917:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_4918
	jmp NS_E_4402_MTC_0_failed
LB_4918:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4924
LB_4923:
	add r14,1
LB_4924:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4923
	cmp rax,10
	jz LB_4923
	cmp rax,32
	jz LB_4923
	call NS_E_4402_ETR_TBL
	cmp r15,0
	jz LB_4925
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4926
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4926:
	jmp NS_E_4402_MTC_0_failed
LB_4925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_4929
LB_4928:
	add r14,1
LB_4929:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4928
	cmp rax,10
	jz LB_4928
	cmp rax,32
	jz LB_4928
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_4931
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4933
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4933:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4934
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4934:
	jmp NS_E_4402_MTC_0_failed
LB_4931:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_4937
LB_4936:
	add r14,1
LB_4937:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4936
	cmp rax,10
	jz LB_4936
	cmp rax,32
	jz LB_4936
	call NS_E_4402_ETR_TBL
	cmp r15,0
	jz LB_4938
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4939
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4939:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4940
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4940:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4941
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4941:
	jmp NS_E_4402_MTC_0_failed
LB_4938:
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
	jc LB_4908
	btr QWORD [rdi],3
LB_4908:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4909
	btr QWORD [rdi],2
LB_4909:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4910
	btr QWORD [rdi],1
LB_4910:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4911
	btr QWORD [rdi],0
LB_4911:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4402_MTC_0_failed:
	pop r14
	push r14
; "\226\136\144"
	jmp LB_4879
LB_4878:
	add r14,1
LB_4879:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4878
	cmp rax,10
	jz LB_4878
	cmp rax,32
	jz LB_4878
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_4881
	jmp NS_E_4402_MTC_1_failed
LB_4881:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_4882
	jmp NS_E_4402_MTC_1_failed
LB_4882:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_4883
	jmp NS_E_4402_MTC_1_failed
LB_4883:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_4889
LB_4888:
	add r14,1
LB_4889:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4888
	cmp rax,10
	jz LB_4888
	cmp rax,32
	jz LB_4888
	call NS_E_4402_ETR_TBL
	cmp r15,0
	jz LB_4890
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4891
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4891:
	jmp NS_E_4402_MTC_1_failed
LB_4890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_4894
LB_4893:
	add r14,1
LB_4894:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4893
	cmp rax,10
	jz LB_4893
	cmp rax,32
	jz LB_4893
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_4896
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4898
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4898:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4899
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4899:
	jmp NS_E_4402_MTC_1_failed
LB_4896:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_4902
LB_4901:
	add r14,1
LB_4902:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4901
	cmp rax,10
	jz LB_4901
	cmp rax,32
	jz LB_4901
	call NS_E_4402_ETR_TBL
	cmp r15,0
	jz LB_4903
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4904
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4904:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4905
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4905:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4906
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4906:
	jmp NS_E_4402_MTC_1_failed
LB_4903:
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
	jc LB_4873
	btr QWORD [rdi],3
LB_4873:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4874
	btr QWORD [rdi],2
LB_4874:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4875
	btr QWORD [rdi],1
LB_4875:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4876
	btr QWORD [rdi],0
LB_4876:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4402_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4404:
NS_E_RDI_4404:
NS_E_4404_ETR_TBL:
NS_E_4404_TBL:
	push r14
; op
	jmp LB_4967
LB_4966:
	add r14,1
LB_4967:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4966
	cmp rax,10
	jz LB_4966
	cmp rax,32
	jz LB_4966
	call NS_E_4404_ETR_TBL
	cmp r15,0
	jz LB_4968
	jmp NS_E_4404_MTC_0_failed
LB_4968:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_4971
LB_4970:
	add r14,1
LB_4971:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4970
	cmp rax,10
	jz LB_4970
	cmp rax,32
	jz LB_4970
	call NS_E_4404_ETR_TBL
	cmp r15,0
	jz LB_4972
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4973
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4973:
	jmp NS_E_4404_MTC_0_failed
LB_4972:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_4976
LB_4975:
	add r14,1
LB_4976:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4975
	cmp rax,10
	jz LB_4975
	cmp rax,32
	jz LB_4975
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_4978
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4988
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4988:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4989
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4989:
	jmp NS_E_4404_MTC_0_failed
LB_4978:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_4979
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4985
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4985:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4986
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4986:
	jmp NS_E_4404_MTC_0_failed
LB_4979:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_4980
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4982
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4982:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4983
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4983:
	jmp NS_E_4404_MTC_0_failed
LB_4980:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_4992
LB_4991:
	add r14,1
LB_4992:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4991
	cmp rax,10
	jz LB_4991
	cmp rax,32
	jz LB_4991
	call NS_E_4404_ETR_TBL
	cmp r15,0
	jz LB_4993
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_4994
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_4994:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_4995
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_4995:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4996
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4996:
	jmp NS_E_4404_MTC_0_failed
LB_4993:
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
	jc LB_4961
	btr QWORD [rdi],3
LB_4961:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_4962
	btr QWORD [rdi],2
LB_4962:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_4963
	btr QWORD [rdi],1
LB_4963:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4964
	btr QWORD [rdi],0
LB_4964:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4404_MTC_0_failed:
	pop r14
	push r14
; "\226\136\142"
	jmp LB_4947
LB_4946:
	add r14,1
LB_4947:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4946
	cmp rax,10
	jz LB_4946
	cmp rax,32
	jz LB_4946
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_4949
	jmp NS_E_4404_MTC_1_failed
LB_4949:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_4950
	jmp NS_E_4404_MTC_1_failed
LB_4950:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_4951
	jmp NS_E_4404_MTC_1_failed
LB_4951:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_4957
LB_4956:
	add r14,1
LB_4957:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_4956
	cmp rax,10
	jz LB_4956
	cmp rax,32
	jz LB_4956
	call NS_E_4404_ETR_TBL
	cmp r15,0
	jz LB_4958
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_4959
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_4959:
	jmp NS_E_4404_MTC_1_failed
LB_4958:
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
	jc LB_4943
	btr QWORD [rdi],1
LB_4943:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4944
	btr QWORD [rdi],0
LB_4944:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4404_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4406:
NS_E_RDI_4406:
NS_E_4406_ETR_TBL:
NS_E_4406_TBL:
	push r14
; name
	jmp LB_5017
LB_5016:
	add r14,1
LB_5017:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5016
	cmp rax,10
	jz LB_5016
	cmp rax,32
	jz LB_5016
	call NS_E_4406_ETR_TBL
	cmp r15,0
	jz LB_5018
	jmp NS_E_4406_MTC_0_failed
LB_5018:
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
	jc LB_5014
	btr QWORD [rdi],0
LB_5014:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4406_MTC_0_failed:
	pop r14
	push r14
; "\194\187"
	jmp LB_5002
LB_5001:
	add r14,1
LB_5002:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5001
	cmp rax,10
	jz LB_5001
	cmp rax,32
	jz LB_5001
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_5004
	jmp NS_E_4406_MTC_1_failed
LB_5004:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_5005
	jmp NS_E_4406_MTC_1_failed
LB_5005:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_5010
LB_5009:
	add r14,1
LB_5010:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5009
	cmp rax,10
	jz LB_5009
	cmp rax,32
	jz LB_5009
	call NS_E_4406_ETR_TBL
	cmp r15,0
	jz LB_5011
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5012
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5012:
	jmp NS_E_4406_MTC_1_failed
LB_5011:
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
	jc LB_4998
	btr QWORD [rdi],1
LB_4998:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_4999
	btr QWORD [rdi],0
LB_4999:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4406_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4408:
NS_E_RDI_4408:
NS_E_4408_ETR_TBL:
NS_E_4408_TBL:
	push r14
; type_imp
	call NS_E_4408_ETR_TBL
	cmp r15,0
	jz LB_5024
	jmp NS_E_4408_MTC_0_failed
LB_5024:
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
	jc LB_5020
	btr QWORD [rdi],0
LB_5020:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4408_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4410:
NS_E_RDI_4410:
NS_E_4410_ETR_TBL:
NS_E_4410_TBL:
	push r14
; type_app
	jmp LB_5037
LB_5036:
	add r14,1
LB_5037:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5036
	cmp rax,10
	jz LB_5036
	cmp rax,32
	jz LB_5036
	call NS_E_4410_ETR_TBL
	cmp r15,0
	jz LB_5038
	jmp NS_E_4410_MTC_0_failed
LB_5038:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_5041
LB_5040:
	add r14,1
LB_5041:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5040
	cmp rax,10
	jz LB_5040
	cmp rax,32
	jz LB_5040
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_5043
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5051
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5051:
	jmp NS_E_4410_MTC_0_failed
LB_5043:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_5044
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5049
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5049:
	jmp NS_E_4410_MTC_0_failed
LB_5044:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_5045
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5047
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5047:
	jmp NS_E_4410_MTC_0_failed
LB_5045:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_5054
LB_5053:
	add r14,1
LB_5054:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5053
	cmp rax,10
	jz LB_5053
	cmp rax,32
	jz LB_5053
	call NS_E_4410_ETR_TBL
	cmp r15,0
	jz LB_5055
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_5056
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_5056:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5057
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5057:
	jmp NS_E_4410_MTC_0_failed
LB_5055:
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
	jc LB_5032
	btr QWORD [rdi],2
LB_5032:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_5033
	btr QWORD [rdi],1
LB_5033:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_5034
	btr QWORD [rdi],0
LB_5034:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4410_MTC_0_failed:
	pop r14
	push r14
; type_app
	jmp LB_5029
LB_5028:
	add r14,1
LB_5029:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5028
	cmp rax,10
	jz LB_5028
	cmp rax,32
	jz LB_5028
	call NS_E_4410_ETR_TBL
	cmp r15,0
	jz LB_5030
	jmp NS_E_4410_MTC_1_failed
LB_5030:
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
	jc LB_5026
	btr QWORD [rdi],0
LB_5026:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4410_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4412:
NS_E_RDI_4412:
NS_E_4412_ETR_TBL:
NS_E_4412_TBL:
	push r14
; type_atm
	jmp LB_5070
LB_5069:
	add r14,1
LB_5070:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5069
	cmp rax,10
	jz LB_5069
	cmp rax,32
	jz LB_5069
	call NS_E_4412_ETR_TBL
	cmp r15,0
	jz LB_5071
	jmp NS_E_4412_MTC_0_failed
LB_5071:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_5074
LB_5073:
	add r14,1
LB_5074:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5073
	cmp rax,10
	jz LB_5073
	cmp rax,32
	jz LB_5073
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_5076
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5084
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5084:
	jmp NS_E_4412_MTC_0_failed
LB_5076:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_5077
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5082
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5082:
	jmp NS_E_4412_MTC_0_failed
LB_5077:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_5078
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5080
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5080:
	jmp NS_E_4412_MTC_0_failed
LB_5078:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_5087
LB_5086:
	add r14,1
LB_5087:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5086
	cmp rax,10
	jz LB_5086
	cmp rax,32
	jz LB_5086
	call NS_E_4412_ETR_TBL
	cmp r15,0
	jz LB_5088
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_5089
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_5089:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5090
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5090:
	jmp NS_E_4412_MTC_0_failed
LB_5088:
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
	jc LB_5065
	btr QWORD [rdi],2
LB_5065:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_5066
	btr QWORD [rdi],1
LB_5066:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_5067
	btr QWORD [rdi],0
LB_5067:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4412_MTC_0_failed:
	pop r14
	push r14
; type_atm
	jmp LB_5062
LB_5061:
	add r14,1
LB_5062:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5061
	cmp rax,10
	jz LB_5061
	cmp rax,32
	jz LB_5061
	call NS_E_4412_ETR_TBL
	cmp r15,0
	jz LB_5063
	jmp NS_E_4412_MTC_1_failed
LB_5063:
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
	jc LB_5059
	btr QWORD [rdi],0
LB_5059:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4412_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4414:
NS_E_RDI_4414:
NS_E_4414_ETR_TBL:
NS_E_4414_TBL:
	push r14
; word
	call NS_E_4414_ETR_TBL
	cmp r15,0
	jz LB_5096
	jmp NS_E_4414_MTC_0_failed
LB_5096:
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
	jc LB_5092
	btr QWORD [rdi],0
LB_5092:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4414_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4416:
NS_E_RDI_4416:
NS_E_4416_ETR_TBL:
NS_E_4416_TBL:
	push r14
; "{"
	jmp LB_5109
LB_5108:
	add r14,1
LB_5109:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5108
	cmp rax,10
	jz LB_5108
	cmp rax,32
	jz LB_5108
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_5111
	jmp NS_E_4416_MTC_0_failed
LB_5111:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_5115
LB_5114:
	add r14,1
LB_5115:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5114
	cmp rax,10
	jz LB_5114
	cmp rax,32
	jz LB_5114
	call NS_E_4416_ETR_TBL
	cmp r15,0
	jz LB_5116
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5117
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5117:
	jmp NS_E_4416_MTC_0_failed
LB_5116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_5120
LB_5119:
	add r14,1
LB_5120:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5119
	cmp rax,10
	jz LB_5119
	cmp rax,32
	jz LB_5119
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_5122
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_5124
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_5124:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5125
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5125:
	jmp NS_E_4416_MTC_0_failed
LB_5122:
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
	jc LB_5104
	btr QWORD [rdi],2
LB_5104:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_5105
	btr QWORD [rdi],1
LB_5105:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_5106
	btr QWORD [rdi],0
LB_5106:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4416_MTC_0_failed:
	pop r14
	push r14
; reg
	jmp LB_5101
LB_5100:
	add r14,1
LB_5101:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5100
	cmp rax,10
	jz LB_5100
	cmp rax,32
	jz LB_5100
	call NS_E_4416_ETR_TBL
	cmp r15,0
	jz LB_5102
	jmp NS_E_4416_MTC_1_failed
LB_5102:
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
	jc LB_5098
	btr QWORD [rdi],0
LB_5098:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4416_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4418:
NS_E_RDI_4418:
NS_E_4418_ETR_TBL:
NS_E_4418_TBL:
	push r14
; reg
	jmp LB_5132
LB_5131:
	add r14,1
LB_5132:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5131
	cmp rax,10
	jz LB_5131
	cmp rax,32
	jz LB_5131
	call NS_E_4418_ETR_TBL
	cmp r15,0
	jz LB_5133
	jmp NS_E_4418_MTC_0_failed
LB_5133:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_5136
LB_5135:
	add r14,1
LB_5136:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5135
	cmp rax,10
	jz LB_5135
	cmp rax,32
	jz LB_5135
	call NS_E_4418_ETR_TBL
	cmp r15,0
	jz LB_5137
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5138
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5138:
	jmp NS_E_4418_MTC_0_failed
LB_5137:
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
	jc LB_5128
	btr QWORD [rdi],1
LB_5128:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_5129
	btr QWORD [rdi],0
LB_5129:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4418_MTC_0_failed:
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
NS_E_4418_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_4420:
NS_E_RDI_4420:
NS_E_4420_ETR_TBL:
NS_E_4420_TBL:
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_5160
	jmp NS_E_4420_MTC_0_failed
LB_5160:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_4420_ETR_TBL
	cmp r15,0
	jz LB_5165
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_5166
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_5166:
	jmp NS_E_4420_MTC_0_failed
LB_5165:
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
	jc LB_5154
	btr QWORD [rdi],1
LB_5154:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_5155
	btr QWORD [rdi],0
LB_5155:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4420_MTC_0_failed:
	pop r14
	push r14
; word
	jmp LB_5151
LB_5150:
	add r14,1
LB_5151:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_5150
	cmp rax,10
	jz LB_5150
	cmp rax,32
	jz LB_5150
	call NS_E_4420_ETR_TBL
	cmp r15,0
	jz LB_5152
	jmp NS_E_4420_MTC_1_failed
LB_5152:
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
	jc LB_5148
	btr QWORD [rdi],0
LB_5148:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4420_MTC_1_failed:
	pop r14
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_5145
	jmp NS_E_4420_MTC_2_failed
LB_5145:
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
	jc LB_5140
	btr QWORD [rdi],0
LB_5140:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4420_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_5177:
NS_E_RDI_5177:
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
; 	» "a" _ ⊢ 1' : %_5169
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_5170 : %_5170
 ; {>  %_5168~0':_stg %_5169~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_5170
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f4394 { %_5169 %_5170 } ⊢ { %_5171 %_5172 %_5173 } : { %_5171 %_5172 %_5173 }
 ; {>  %_5168~0':_stg %_5169~1':_stg %_5170~2':_r64 }
; _f4394 { 1' 2' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_5180
	btr r12,0
	jmp LB_5181
LB_5180:
	bts r12,0
LB_5181:
	mov r14,r15
	bt r12,2
	jc LB_5182
	btr r12,1
	jmp LB_5183
LB_5182:
	bts r12,1
LB_5183:
	call NS_E_4394
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 1' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_5184
	btr r12,4
	jmp LB_5185
LB_5184:
	bts r12,4
LB_5185:
	mov r8,r9
	bt r12,4
	jc LB_5188
	btr r12,3
	jmp LB_5189
LB_5188:
	bts r12,3
LB_5189:
	mov rsi,0
	bt r12,3
	jc LB_5186
	bts rsi,17
	bt r8,0
	jc LB_5186
	jmp LB_5187
LB_5186:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_5187:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_5190
	btr r12,2
	jmp LB_5191
LB_5190:
	bts r12,2
LB_5191:
	mov r14,r13
	bt r12,0
	jc LB_5192
	btr r12,1
	jmp LB_5193
LB_5192:
	bts r12,1
LB_5193:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_5178
	btr r12,0
	jmp LB_5179
LB_5178:
	bts r12,0
LB_5179:
	add rsp,16
; _f14 { %_5171 %_5172 %_5173 } ⊢ { %_5174 %_5175 %_5176 } : { %_5174 %_5175 %_5176 }
 ; {>  %_5172~2':_r64 %_5168~0':_stg %_5171~1':_stg %_5173~3':(_opn)◂(_p4393) }
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
	jc LB_5198
	btr r12,4
	jmp LB_5199
LB_5198:
	bts r12,4
LB_5199:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_5196
	btr QWORD [rdi],0
	jmp LB_5197
LB_5196:
	bts QWORD [rdi],0
LB_5197:
	mov r9,r15
	bt r12,2
	jc LB_5202
	btr r12,4
	jmp LB_5203
LB_5202:
	bts r12,4
LB_5203:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_5200
	btr QWORD [rdi],1
	jmp LB_5201
LB_5200:
	bts QWORD [rdi],1
LB_5201:
	mov r9,r8
	bt r12,3
	jc LB_5206
	btr r12,4
	jmp LB_5207
LB_5206:
	bts r12,4
LB_5207:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_5204
	btr QWORD [rdi],2
	jmp LB_5205
LB_5204:
	bts QWORD [rdi],2
LB_5205:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_5210
	btr r12,4
	jmp LB_5211
LB_5210:
	bts r12,4
LB_5211:
	mov r14,r9
	bt r12,4
	jc LB_5208
	btr r12,1
	jmp LB_5209
LB_5208:
	bts r12,1
LB_5209:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_5214
	btr r12,4
	jmp LB_5215
LB_5214:
	bts r12,4
LB_5215:
	mov r15,r9
	bt r12,4
	jc LB_5212
	btr r12,2
	jmp LB_5213
LB_5212:
	bts r12,2
LB_5213:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_5218
	btr r12,4
	jmp LB_5219
LB_5218:
	bts r12,4
LB_5219:
	mov r8,r9
	bt r12,4
	jc LB_5216
	btr r12,3
	jmp LB_5217
LB_5216:
	bts r12,3
LB_5217:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_5194
	btr r12,0
	jmp LB_5195
LB_5194:
	bts r12,0
LB_5195:
	add rsp,16
; ∎ {  }
 ; {>  %_5176~3':(_opn)◂(_p4393) %_5168~0':_stg %_5174~1':_stg %_5175~2':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_5220
	mov rdi,r8
	call dlt
LB_5220:
	bt r12,0
	jc LB_5221
	mov rdi,r13
	call dlt
LB_5221:
	bt r12,1
	jc LB_5222
	mov rdi,r14
	call dlt
LB_5222:
	bt r12,2
	jc LB_5223
	mov rdi,r15
	call dlt
LB_5223:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_4375:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4375
	NS_E_DYN_4376:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4376
	NS_E_DYN_4377:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4377
	NS_E_DYN_4378:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4378
	NS_E_DYN_4421:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4422:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4380:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4380
	NS_E_DYN_4423:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4424:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4425:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_4426:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_4382:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4382
	NS_E_DYN_4427:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4428:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4384:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4384
	NS_E_DYN_4429:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4430:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4386:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4386
	NS_E_DYN_4431:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4432:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4388:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4388
	NS_E_DYN_4433:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4434:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4390:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4390
	NS_E_DYN_4435:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4392:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4392
	NS_E_DYN_4436:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4437:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4394:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4394
	NS_E_DYN_4438:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4439:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4440:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_4396:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4396
	NS_E_DYN_4441:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4442:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4398:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4398
	NS_E_DYN_4443:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4400:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4400
	NS_E_DYN_4444:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4445:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4402:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4402
	NS_E_DYN_4446:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4447:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4404:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4404
	NS_E_DYN_4448:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4449:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4406:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4406
	NS_E_DYN_4450:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4408:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4408
	NS_E_DYN_4451:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4452:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4410:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4410
	NS_E_DYN_4453:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4454:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4412:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4412
	NS_E_DYN_4455:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4414:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4414
	NS_E_DYN_4456:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4457:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4416:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4416
	NS_E_DYN_4458:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4459:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4418:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4418
	NS_E_DYN_4460:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4461:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4462:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_4420:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4420
	CST_DYN_5177:
		dq 0x0001_0001_00_82_ffff
		dq 1
