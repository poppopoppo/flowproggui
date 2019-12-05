%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1770
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
	call emt_q
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
NS_E_1533:
NS_E_RDI_1533:
NS_E_1533_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1534
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_1534:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1536:
NS_E_RDI_1536:
NS_E_1536_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1536_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1536_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1537:
NS_E_RDI_1537:
NS_E_1537_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1537_LB_0
	cmp r11,57
	ja NS_E_1537_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1537_LB_0:
	mov rax,0
	ret
NS_E_1539:
NS_E_RDI_1539:
NS_E_1539_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1539_LB_0
	cmp r11,122
	ja NS_E_1539_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1539_LB_0:
	mov rax,0
	ret
NS_E_1538:
NS_E_RDI_1538:
NS_E_1538_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1538_LB_0
	cmp r11,90
	ja NS_E_1538_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1538_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r8
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,r15
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
	mov rax,r15
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
	mov r15,rax
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_1535:
NS_E_RDI_1535:
NS_E_1535_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
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
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_1535_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_1535_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1565:
; 	|» { 0' 1' 2' }
NS_E_RDI_1565:
; _f32 { %_1541 %_1540 } ⊢ { %_1543 %_1544 %_1545 } : { %_1543 %_1544 %_1545 }
 ; {>  %_1541~1':_r64 %_1540~0':_r64 %_1542~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_1630
; /
	jmp MTC_LB_1629
LB_1630:
; /0/
	jmp MTC_LB_1628
MTC_LB_1629:
; _f35 %_1544 ⊢ { %_1546 %_1547 } : { %_1546 %_1547 }
 ; {>  %_1544~0':_r64 %_1545~3':_r64 %_1543~1':_r64 %_1542~2':_r64 }
	mov r9,r13
; _f35 %_1543 ⊢ { %_1548 %_1549 } : { %_1548 %_1549 }
 ; {>  %_1546~0':_r64 %_1547~4':_r64 %_1545~3':_r64 %_1543~1':_r64 %_1542~2':_r64 }
	mov r10,r14
; _f35 %_1542 ⊢ { %_1550 %_1551 } : { %_1550 %_1551 }
 ; {>  %_1546~0':_r64 %_1549~5':_r64 %_1547~4':_r64 %_1545~3':_r64 %_1548~1':_r64 %_1542~2':_r64 }
	mov r11,r15
; _f37 %_1547 ⊢ %_1552 : %_1552
 ; {>  %_1546~0':_r64 %_1549~5':_r64 %_1550~2':_r64 %_1547~4':_r64 %_1545~3':_r64 %_1551~6':_r64 %_1548~1':_r64 }
	sub r9,1
; _f1565 { %_1552 %_1549 %_1551 } ⊢ %_1553 : %_1553
 ; {>  %_1546~0':_r64 %_1549~5':_r64 %_1550~2':_r64 %_1552~4':_r64 %_1545~3':_r64 %_1551~6':_r64 %_1548~1':_r64 }
; _f1565 { 4' 5' 6' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_1574
	btr r12,0
	jmp LB_1575
LB_1574:
	bts r12,0
LB_1575:
	mov r14,r10
	bt r12,5
	jc LB_1576
	btr r12,1
	jmp LB_1577
LB_1576:
	bts r12,1
LB_1577:
	mov r15,r11
	bt r12,6
	jc LB_1578
	btr r12,2
	jmp LB_1579
LB_1578:
	bts r12,2
LB_1579:
	call NS_E_1565
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1580
	btr r12,4
	jmp LB_1581
LB_1580:
	bts r12,4
LB_1581:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1572
	btr r12,3
	jmp LB_1573
LB_1572:
	bts r12,3
LB_1573:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1570
	btr r12,2
	jmp LB_1571
LB_1570:
	bts r12,2
LB_1571:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1568
	btr r12,1
	jmp LB_1569
LB_1568:
	bts r12,1
LB_1569:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1566
	btr r12,0
	jmp LB_1567
LB_1566:
	bts r12,0
LB_1567:
	add rsp,40
; _f35 %_1546 ⊢ { %_1554 %_1555 } : { %_1554 %_1555 }
 ; {>  %_1546~0':_r64 %_1550~2':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1548~1':_r64 }
	mov r10,r13
; _f35 %_1548 ⊢ { %_1556 %_1557 } : { %_1556 %_1557 }
 ; {>  %_1550~2':_r64 %_1555~5':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1548~1':_r64 %_1554~0':_r64 }
	mov r11,r14
; _f35 %_1550 ⊢ { %_1558 %_1559 } : { %_1558 %_1559 }
 ; {>  %_1550~2':_r64 %_1555~5':_r64 %_1557~6':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1556~1':_r64 %_1554~0':_r64 }
	mov rcx,r15
; _f37 %_1557 ⊢ %_1560 : %_1560
 ; {>  %_1558~2':_r64 %_1555~5':_r64 %_1557~6':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1559~7':_r64 %_1556~1':_r64 %_1554~0':_r64 }
	sub r11,1
; _f1565 { %_1560 %_1559 %_1555 } ⊢ %_1561 : %_1561
 ; {>  %_1558~2':_r64 %_1555~5':_r64 %_1560~6':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1559~7':_r64 %_1556~1':_r64 %_1554~0':_r64 }
; _f1565 { 6' 7' 5' } ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 6' 7' 5' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,6
	jc LB_1592
	btr r12,0
	jmp LB_1593
LB_1592:
	bts r12,0
LB_1593:
	mov r14,rcx
	bt r12,7
	jc LB_1594
	btr r12,1
	jmp LB_1595
LB_1594:
	bts r12,1
LB_1595:
	mov r15,r10
	bt r12,5
	jc LB_1596
	btr r12,2
	jmp LB_1597
LB_1596:
	bts r12,2
LB_1597:
	call NS_E_1565
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_1598
	btr r12,5
	jmp LB_1599
LB_1598:
	bts r12,5
LB_1599:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_1590
	btr r12,4
	jmp LB_1591
LB_1590:
	bts r12,4
LB_1591:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1588
	btr r12,3
	jmp LB_1589
LB_1588:
	bts r12,3
LB_1589:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1586
	btr r12,2
	jmp LB_1587
LB_1586:
	bts r12,2
LB_1587:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1584
	btr r12,1
	jmp LB_1585
LB_1584:
	bts r12,1
LB_1585:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1582
	btr r12,0
	jmp LB_1583
LB_1582:
	bts r12,0
LB_1583:
	add rsp,48
; _f37 %_1558 ⊢ %_1562 : %_1562
 ; {>  %_1558~2':_r64 %_1561~5':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1556~1':_r64 %_1554~0':_r64 }
	sub r15,1
; _f1565 { %_1562 %_1554 %_1556 } ⊢ %_1563 : %_1563
 ; {>  %_1562~2':_r64 %_1561~5':_r64 %_1553~4':_r64 %_1545~3':_r64 %_1556~1':_r64 %_1554~0':_r64 }
; _f1565 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_1606
	btr r12,3
	jmp LB_1607
LB_1606:
	bts r12,3
LB_1607:
	mov r15,r14
	bt r12,1
	jc LB_1608
	btr r12,2
	jmp LB_1609
LB_1608:
	bts r12,2
LB_1609:
	mov r14,r13
	bt r12,0
	jc LB_1610
	btr r12,1
	jmp LB_1611
LB_1610:
	bts r12,1
LB_1611:
	mov r13,r8
	bt r12,3
	jc LB_1612
	btr r12,0
	jmp LB_1613
LB_1612:
	bts r12,0
LB_1613:
	call NS_E_1565
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_1604
	btr r12,5
	jmp LB_1605
LB_1604:
	bts r12,5
LB_1605:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_1602
	btr r12,4
	jmp LB_1603
LB_1602:
	bts r12,4
LB_1603:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1600
	btr r12,3
	jmp LB_1601
LB_1600:
	bts r12,3
LB_1601:
	add rsp,32
; _f1565 { %_1553 %_1561 %_1563 } ⊢ %_1564 : %_1564
 ; {>  %_1563~0':_r64 %_1561~5':_r64 %_1553~4':_r64 %_1545~3':_r64 }
; _f1565 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_1616
	btr r12,1
	jmp LB_1617
LB_1616:
	bts r12,1
LB_1617:
	mov r15,r13
	bt r12,0
	jc LB_1618
	btr r12,2
	jmp LB_1619
LB_1618:
	bts r12,2
LB_1619:
	mov r13,r9
	bt r12,4
	jc LB_1620
	btr r12,0
	jmp LB_1621
LB_1620:
	bts r12,0
LB_1621:
	call NS_E_1565
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1614
	btr r12,3
	jmp LB_1615
LB_1614:
	bts r12,3
LB_1615:
	add rsp,16
; ∎ %_1564
 ; {>  %_1545~3':_r64 %_1564~0':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_1622
	mov rdi,r8
	call dlt
LB_1622:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_1628:
; ∎ %_1542
 ; {>  %_1544~0':_r64 %_1545~3':_r64 %_1543~1':_r64 %_1542~2':_r64 }
; 	∎ 2'
	bt r12,0
	jc LB_1623
	mov rdi,r13
	call dlt
LB_1623:
	bt r12,3
	jc LB_1624
	mov rdi,r8
	call dlt
LB_1624:
	bt r12,1
	jc LB_1625
	mov rdi,r14
	call dlt
LB_1625:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_1626
	btr r12,0
	jmp LB_1627
LB_1626:
	bts r12,0
LB_1627:
	ret
NS_E_1661:
; 	|» { 0' 1' 2' }
NS_E_RDI_1661:
; _f32 { %_1632 %_1631 } ⊢ { %_1634 %_1635 %_1636 } : { %_1634 %_1635 %_1636 }
 ; {>  %_1632~1':_r64 %_1631~0':_r64 %_1633~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_1737
; /
	jmp MTC_LB_1736
LB_1737:
; /0/
	jmp MTC_LB_1735
MTC_LB_1736:
; _f37 %_1635 ⊢ %_1637 : %_1637
 ; {>  %_1634~1':_r64 %_1636~3':_r64 %_1635~0':_r64 %_1633~2':_r64 }
	sub r13,1
; _f1661 { %_1637 %_1634 %_1633 } ⊢ { %_1638 %_1639 %_1640 %_1641 } : { %_1638 %_1639 %_1640 %_1641 }
 ; {>  %_1634~1':_r64 %_1636~3':_r64 %_1637~0':_r64 %_1633~2':_r64 }
; _f1661 { 0' 1' 2' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_1661
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r9,r8
	bt r12,3
	jc LB_1664
	btr r12,4
	jmp LB_1665
LB_1664:
	bts r12,4
LB_1665:
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1662
	btr r12,3
	jmp LB_1663
LB_1662:
	bts r12,3
LB_1663:
	add rsp,16
; _f38 %_1638 ⊢ %_1642 : %_1642
 ; {>  %_1638~0':_r64 %_1636~3':_r64 %_1640~2':_r64 %_1641~4':_r64 %_1639~1':_r64 }
	add r13,1
; _f37 %_1639 ⊢ %_1643 : %_1643
 ; {>  %_1636~3':_r64 %_1642~0':_r64 %_1640~2':_r64 %_1641~4':_r64 %_1639~1':_r64 }
	sub r14,1
; _f1661 { %_1643 %_1640 %_1642 } ⊢ { %_1644 %_1645 %_1646 %_1647 } : { %_1644 %_1645 %_1646 %_1647 }
 ; {>  %_1643~1':_r64 %_1636~3':_r64 %_1642~0':_r64 %_1640~2':_r64 %_1641~4':_r64 }
; _f1661 { 1' 2' 0' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_1670
	btr r12,3
	jmp LB_1671
LB_1670:
	bts r12,3
LB_1671:
	mov r15,r13
	bt r12,0
	jc LB_1672
	btr r12,2
	jmp LB_1673
LB_1672:
	bts r12,2
LB_1673:
	mov r13,r14
	bt r12,1
	jc LB_1674
	btr r12,0
	jmp LB_1675
LB_1674:
	bts r12,0
LB_1675:
	mov r14,r8
	bt r12,3
	jc LB_1676
	btr r12,1
	jmp LB_1677
LB_1676:
	bts r12,1
LB_1677:
	call NS_E_1661
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r10,r8
	bt r12,3
	jc LB_1678
	btr r12,5
	jmp LB_1679
LB_1678:
	bts r12,5
LB_1679:
; pop_iv
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_1668
	btr r12,4
	jmp LB_1669
LB_1668:
	bts r12,4
LB_1669:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1666
	btr r12,3
	jmp LB_1667
LB_1666:
	bts r12,3
LB_1667:
	add rsp,24
; _f38 %_1644 ⊢ %_1648 : %_1648
 ; {>  %_1647~5':_r64 %_1644~0':_r64 %_1636~3':_r64 %_1646~2':_r64 %_1645~1':_r64 %_1641~4':_r64 }
	add r13,1
; _f37 %_1645 ⊢ %_1649 : %_1649
 ; {>  %_1647~5':_r64 %_1636~3':_r64 %_1646~2':_r64 %_1645~1':_r64 %_1648~0':_r64 %_1641~4':_r64 }
	sub r14,1
; _f1661 { %_1649 %_1646 %_1648 } ⊢ { %_1650 %_1651 %_1652 %_1653 } : { %_1650 %_1651 %_1652 %_1653 }
 ; {>  %_1647~5':_r64 %_1649~1':_r64 %_1636~3':_r64 %_1646~2':_r64 %_1648~0':_r64 %_1641~4':_r64 }
; _f1661 { 1' 2' 0' } ⊢ { 0' 1' 2' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_1686
	btr r12,3
	jmp LB_1687
LB_1686:
	bts r12,3
LB_1687:
	mov r15,r13
	bt r12,0
	jc LB_1688
	btr r12,2
	jmp LB_1689
LB_1688:
	bts r12,2
LB_1689:
	mov r13,r14
	bt r12,1
	jc LB_1690
	btr r12,0
	jmp LB_1691
LB_1690:
	bts r12,0
LB_1691:
	mov r14,r8
	bt r12,3
	jc LB_1692
	btr r12,1
	jmp LB_1693
LB_1692:
	bts r12,1
LB_1693:
	call NS_E_1661
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 6' }
	mov r11,r8
	bt r12,3
	jc LB_1694
	btr r12,6
	jmp LB_1695
LB_1694:
	bts r12,6
LB_1695:
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_1684
	btr r12,5
	jmp LB_1685
LB_1684:
	bts r12,5
LB_1685:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_1682
	btr r12,4
	jmp LB_1683
LB_1682:
	bts r12,4
LB_1683:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1680
	btr r12,3
	jmp LB_1681
LB_1680:
	bts r12,3
LB_1681:
	add rsp,32
; _f38 %_1650 ⊢ %_1654 : %_1654
 ; {>  %_1647~5':_r64 %_1652~2':_r64 %_1651~1':_r64 %_1636~3':_r64 %_1650~0':_r64 %_1653~6':_r64 %_1641~4':_r64 }
	add r13,1
; _f1661 { %_1641 %_1647 %_1653 } ⊢ { %_1655 %_1656 %_1657 %_1658 } : { %_1655 %_1656 %_1657 %_1658 }
 ; {>  %_1647~5':_r64 %_1652~2':_r64 %_1651~1':_r64 %_1636~3':_r64 %_1654~0':_r64 %_1653~6':_r64 %_1641~4':_r64 }
; _f1661 { 4' 5' 6' } ⊢ { 4' 5' 6' 7' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_1704
	btr r12,0
	jmp LB_1705
LB_1704:
	bts r12,0
LB_1705:
	mov r14,r10
	bt r12,5
	jc LB_1706
	btr r12,1
	jmp LB_1707
LB_1706:
	bts r12,1
LB_1707:
	mov r15,r11
	bt r12,6
	jc LB_1708
	btr r12,2
	jmp LB_1709
LB_1708:
	bts r12,2
LB_1709:
	call NS_E_1661
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 4' 5' 6' 7' }
	mov r9,r13
	bt r12,0
	jc LB_1710
	btr r12,4
	jmp LB_1711
LB_1710:
	bts r12,4
LB_1711:
	mov r10,r14
	bt r12,1
	jc LB_1712
	btr r12,5
	jmp LB_1713
LB_1712:
	bts r12,5
LB_1713:
	mov r11,r15
	bt r12,2
	jc LB_1714
	btr r12,6
	jmp LB_1715
LB_1714:
	bts r12,6
LB_1715:
	mov rcx,r8
	bt r12,3
	jc LB_1716
	btr r12,7
	jmp LB_1717
LB_1716:
	bts r12,7
LB_1717:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1702
	btr r12,3
	jmp LB_1703
LB_1702:
	bts r12,3
LB_1703:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1700
	btr r12,2
	jmp LB_1701
LB_1700:
	bts r12,2
LB_1701:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1698
	btr r12,1
	jmp LB_1699
LB_1698:
	bts r12,1
LB_1699:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1696
	btr r12,0
	jmp LB_1697
LB_1696:
	bts r12,0
LB_1697:
	add rsp,40
; ∎ { %_1651 %_1652 %_1654 %_1658 }
 ; {>  %_1652~2':_r64 %_1658~7':_r64 %_1651~1':_r64 %_1657~6':_r64 %_1636~3':_r64 %_1656~5':_r64 %_1655~4':_r64 %_1654~0':_r64 }
; 	∎ { 1' 2' 0' 7' }
	bt r12,6
	jc LB_1718
	mov rdi,r11
	call dlt
LB_1718:
	bt r12,3
	jc LB_1719
	mov rdi,r8
	call dlt
LB_1719:
	bt r12,5
	jc LB_1720
	mov rdi,r10
	call dlt
LB_1720:
	bt r12,4
	jc LB_1721
	mov rdi,r9
	call dlt
LB_1721:
; _emt_mov_ptn_to_ptn { 1' 2' 0' 7' } ⊢ { 0' 1' 2' 3' }
	mov r8,rcx
	bt r12,7
	jc LB_1722
	btr r12,3
	jmp LB_1723
LB_1722:
	bts r12,3
LB_1723:
	mov r9,r15
	bt r12,2
	jc LB_1724
	btr r12,4
	jmp LB_1725
LB_1724:
	bts r12,4
LB_1725:
	mov r15,r13
	bt r12,0
	jc LB_1726
	btr r12,2
	jmp LB_1727
LB_1726:
	bts r12,2
LB_1727:
	mov r13,r14
	bt r12,1
	jc LB_1728
	btr r12,0
	jmp LB_1729
LB_1728:
	bts r12,0
LB_1729:
	mov r14,r9
	bt r12,4
	jc LB_1730
	btr r12,1
	jmp LB_1731
LB_1730:
	bts r12,1
LB_1731:
	ret
MTC_LB_1735:
; _f35 %_1633 ⊢ { %_1659 %_1660 } : { %_1659 %_1660 }
 ; {>  %_1634~1':_r64 %_1636~3':_r64 %_1635~0':_r64 %_1633~2':_r64 }
	mov r9,r15
; ∎ { %_1635 %_1634 %_1659 %_1660 }
 ; {>  %_1634~1':_r64 %_1660~4':_r64 %_1636~3':_r64 %_1659~2':_r64 %_1635~0':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_1732
	mov rdi,r8
	call dlt
LB_1732:
; _emt_mov_ptn_to_ptn { 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r8,r9
	bt r12,4
	jc LB_1733
	btr r12,3
	jmp LB_1734
LB_1733:
	bts r12,3
LB_1734:
	ret
NS_E_1747:
; 	|» 0'
NS_E_RDI_1747:
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_1765
; /
	jmp MTC_LB_1763
LB_1765:
; /0/0
; /0/0
	mov QWORD rax,0x1
	cmp rax,r13
	jnz LB_1764
; /0/
	jmp MTC_LB_1762
LB_1764:
; /0/0/
	jmp MTC_LB_1761
MTC_LB_1763:
; » 0xr1 |~ {  } ⊢ %_1739 : %_1739
 ; {>  %_1738~0':_r64 }
; 	» 0xr1 _ ⊢ 1' : %_1739
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; ∎ %_1739
 ; {>  %_1739~1':_r64 %_1738~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_1748
	mov rdi,r13
	call dlt
LB_1748:
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1749
	btr r12,0
	jmp LB_1750
LB_1749:
	bts r12,0
LB_1750:
	ret
MTC_LB_1762:
; » 0xr1 |~ {  } ⊢ %_1740 : %_1740
 ; {>  %_1738~0':_r64 }
; 	» 0xr1 _ ⊢ 1' : %_1740
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; ∎ %_1740
 ; {>  %_1740~1':_r64 %_1738~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_1751
	mov rdi,r13
	call dlt
LB_1751:
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1752
	btr r12,0
	jmp LB_1753
LB_1752:
	bts r12,0
LB_1753:
	ret
MTC_LB_1761:
; _f35 %_1738 ⊢ { %_1741 %_1742 } : { %_1741 %_1742 }
 ; {>  %_1738~0':_r64 }
	mov r14,r13
; _f37 %_1742 ⊢ %_1743 : %_1743
 ; {>  %_1742~1':_r64 %_1741~0':_r64 }
	sub r14,1
; _f1747 %_1743 ⊢ %_1744 : %_1744
 ; {>  %_1743~1':_r64 %_1741~0':_r64 }
; _f1747 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1756
	btr r12,0
	jmp LB_1757
LB_1756:
	bts r12,0
LB_1757:
	call NS_E_1747
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1758
	btr r12,1
	jmp LB_1759
LB_1758:
	bts r12,1
LB_1759:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1754
	btr r12,0
	jmp LB_1755
LB_1754:
	bts r12,0
LB_1755:
	add rsp,16
; _f39 { %_1741 %_1744 } ⊢ { %_1745 %_1746 } : { %_1745 %_1746 }
 ; {>  %_1744~1':_r64 %_1741~0':_r64 }
	imul r13,r14
; ∎ %_1745
 ; {>  %_1746~1':_r64 %_1745~0':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1760
	mov rdi,r14
	call dlt
LB_1760:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
NS_E_1770:
NS_E_RDI_1770:
; » 0xr0 |~ {  } ⊢ %_1766 : %_1766
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_1766
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr4 |~ {  } ⊢ %_1767 : %_1767
 ; {>  %_1766~0':_r64 }
; 	» 0xr4 _ ⊢ 1' : %_1767
	mov rdi,0x4
	mov r14,rdi
	bts r12,1
; _f1747 %_1767 ⊢ %_1768 : %_1768
 ; {>  %_1767~1':_r64 %_1766~0':_r64 }
; _f1747 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1773
	btr r12,0
	jmp LB_1774
LB_1773:
	bts r12,0
LB_1774:
	call NS_E_1747
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1775
	btr r12,1
	jmp LB_1776
LB_1775:
	bts r12,1
LB_1776:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1771
	btr r12,0
	jmp LB_1772
LB_1771:
	bts r12,0
LB_1772:
	add rsp,16
; _f20 %_1768 ⊢ %_1769 : %_1769
 ; {>  %_1766~0':_r64 %_1768~1':_r64 }
; _f20 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1779
	btr r12,0
	jmp LB_1780
LB_1779:
	bts r12,0
LB_1780:
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1781
	btr r12,1
	jmp LB_1782
LB_1781:
	bts r12,1
LB_1782:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1777
	btr r12,0
	jmp LB_1778
LB_1777:
	bts r12,0
LB_1778:
	add rsp,16
; ∎ {  }
 ; {>  %_1766~0':_r64 %_1769~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1783
	mov rdi,r13
	call dlt
LB_1783:
	bt r12,1
	jc LB_1784
	mov rdi,r14
	call dlt
LB_1784:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1533:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1533
	NS_E_DYN_1536:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1536
	NS_E_DYN_1537:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1537
	NS_E_DYN_1538:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1538
	NS_E_DYN_1539:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1539
	NS_E_DYN_1565:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1565
	NS_E_DYN_1661:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1661
	NS_E_DYN_1747:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1747
	CST_DYN_1770:
		dq 0x0001_0001_00_82_ffff
		dq 1
