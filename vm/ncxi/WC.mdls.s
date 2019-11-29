%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_1517
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
NS_E_1395:
NS_E_RDI_1395:
NS_E_1395_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1395_LB_0
	mov r15,0
	mov r8,rax
	ret
NS_E_1395_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	ret
NS_E_1396:
NS_E_RDI_1396:
NS_E_1396_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1396_LB_0
	cmp r11,57
	ja NS_E_1396_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1396_LB_0:
	mov rax,0
	ret
NS_E_1398:
NS_E_RDI_1398:
NS_E_1398_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1398_LB_0
	cmp r11,122
	ja NS_E_1398_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1398_LB_0:
	mov rax,0
	ret
NS_E_1397:
NS_E_RDI_1397:
NS_E_1397_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1397_LB_0
	cmp r11,90
	ja NS_E_1397_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1397_LB_0:
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
NS_E_1426:
; 	|» { 0' 1' 2' }
NS_E_RDI_1426:
; _f26 { %_1400 %_1399 } ⊢ { %_1402 %_1403 %_1404 } : { %_1402 %_1403 %_1404 }
 ; {>  %_1399~0':_r64 %_1401~2':_r64 %_1400~1':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_1493
	bt r12,3
	jc LB_1492
	mov rdi,r8
	call dlt
LB_1492:
	jmp MTC_LB_1491
LB_1493:
; _emt_mov_ptn_to_ptn 3' ⊢ 4'
	mov r9,r8
	bt r12,3
	jc LB_1494
	btr r12,4
	jmp LB_1495
LB_1494:
	bts r12,4
LB_1495:
; /0/
	jmp MTC_LB_1490
MTC_LB_1491:
; _f29 %_1403 ⊢ { %_1406 %_1407 } : { %_1406 %_1407 }
 ; {>  %_1404~3':_r64 %_1401~2':_r64 %_1403~0':_r64 %_1402~1':_r64 }
	mov r9,r13
; _f29 %_1402 ⊢ { %_1408 %_1409 } : { %_1408 %_1409 }
 ; {>  %_1404~3':_r64 %_1407~4':_r64 %_1401~2':_r64 %_1402~1':_r64 %_1406~0':_r64 }
	mov r10,r14
; _f29 %_1401 ⊢ { %_1410 %_1411 } : { %_1410 %_1411 }
 ; {>  %_1404~3':_r64 %_1407~4':_r64 %_1408~1':_r64 %_1401~2':_r64 %_1409~5':_r64 %_1406~0':_r64 }
	mov r11,r15
; _f31 %_1407 ⊢ %_1412 : %_1412
 ; {>  %_1404~3':_r64 %_1410~2':_r64 %_1407~4':_r64 %_1408~1':_r64 %_1411~6':_r64 %_1409~5':_r64 %_1406~0':_r64 }
	sub r9,1
; _f1426 { %_1412 %_1409 %_1411 } ⊢ %_1413 : %_1413
 ; {>  %_1404~3':_r64 %_1410~2':_r64 %_1408~1':_r64 %_1412~4':_r64 %_1411~6':_r64 %_1409~5':_r64 %_1406~0':_r64 }
; _f1426 { 4' 5' 6' } ⊢ 4'
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
	jc LB_1435
	btr r12,0
	jmp LB_1436
LB_1435:
	bts r12,0
LB_1436:
	mov r14,r10
	bt r12,5
	jc LB_1437
	btr r12,1
	jmp LB_1438
LB_1437:
	bts r12,1
LB_1438:
	mov r15,r11
	bt r12,6
	jc LB_1439
	btr r12,2
	jmp LB_1440
LB_1439:
	bts r12,2
LB_1440:
	call NS_E_1426
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1441
	btr r12,4
	jmp LB_1442
LB_1441:
	bts r12,4
LB_1442:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1433
	btr r12,3
	jmp LB_1434
LB_1433:
	bts r12,3
LB_1434:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1431
	btr r12,2
	jmp LB_1432
LB_1431:
	bts r12,2
LB_1432:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1429
	btr r12,1
	jmp LB_1430
LB_1429:
	bts r12,1
LB_1430:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1427
	btr r12,0
	jmp LB_1428
LB_1427:
	bts r12,0
LB_1428:
	add rsp,40
; _f29 %_1406 ⊢ { %_1414 %_1415 } : { %_1414 %_1415 }
 ; {>  %_1404~3':_r64 %_1410~2':_r64 %_1408~1':_r64 %_1413~4':_r64 %_1406~0':_r64 }
	mov r10,r13
; _f29 %_1408 ⊢ { %_1416 %_1417 } : { %_1416 %_1417 }
 ; {>  %_1404~3':_r64 %_1410~2':_r64 %_1414~0':_r64 %_1408~1':_r64 %_1413~4':_r64 %_1415~5':_r64 }
	mov r11,r14
; _f29 %_1410 ⊢ { %_1418 %_1419 } : { %_1418 %_1419 }
 ; {>  %_1404~3':_r64 %_1410~2':_r64 %_1416~1':_r64 %_1414~0':_r64 %_1413~4':_r64 %_1415~5':_r64 %_1417~6':_r64 }
	mov rcx,r15
; _f31 %_1417 ⊢ %_1420 : %_1420
 ; {>  %_1404~3':_r64 %_1416~1':_r64 %_1414~0':_r64 %_1413~4':_r64 %_1418~2':_r64 %_1415~5':_r64 %_1417~6':_r64 %_1419~7':_r64 }
	sub r11,1
; _f1426 { %_1420 %_1419 %_1415 } ⊢ %_1421 : %_1421
 ; {>  %_1404~3':_r64 %_1416~1':_r64 %_1414~0':_r64 %_1413~4':_r64 %_1420~6':_r64 %_1418~2':_r64 %_1415~5':_r64 %_1419~7':_r64 }
; _f1426 { 6' 7' 5' } ⊢ 5'
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
	jc LB_1453
	btr r12,0
	jmp LB_1454
LB_1453:
	bts r12,0
LB_1454:
	mov r14,rcx
	bt r12,7
	jc LB_1455
	btr r12,1
	jmp LB_1456
LB_1455:
	bts r12,1
LB_1456:
	mov r15,r10
	bt r12,5
	jc LB_1457
	btr r12,2
	jmp LB_1458
LB_1457:
	bts r12,2
LB_1458:
	call NS_E_1426
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_1459
	btr r12,5
	jmp LB_1460
LB_1459:
	bts r12,5
LB_1460:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_1451
	btr r12,4
	jmp LB_1452
LB_1451:
	bts r12,4
LB_1452:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1449
	btr r12,3
	jmp LB_1450
LB_1449:
	bts r12,3
LB_1450:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1447
	btr r12,2
	jmp LB_1448
LB_1447:
	bts r12,2
LB_1448:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1445
	btr r12,1
	jmp LB_1446
LB_1445:
	bts r12,1
LB_1446:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1443
	btr r12,0
	jmp LB_1444
LB_1443:
	bts r12,0
LB_1444:
	add rsp,48
; _f31 %_1418 ⊢ %_1422 : %_1422
 ; {>  %_1404~3':_r64 %_1421~5':_r64 %_1416~1':_r64 %_1414~0':_r64 %_1413~4':_r64 %_1418~2':_r64 }
	sub r15,1
; _f1426 { %_1422 %_1414 %_1416 } ⊢ %_1423 : %_1423
 ; {>  %_1404~3':_r64 %_1421~5':_r64 %_1416~1':_r64 %_1414~0':_r64 %_1413~4':_r64 %_1422~2':_r64 }
; _f1426 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_1467
	btr r12,3
	jmp LB_1468
LB_1467:
	bts r12,3
LB_1468:
	mov r15,r14
	bt r12,1
	jc LB_1469
	btr r12,2
	jmp LB_1470
LB_1469:
	bts r12,2
LB_1470:
	mov r14,r13
	bt r12,0
	jc LB_1471
	btr r12,1
	jmp LB_1472
LB_1471:
	bts r12,1
LB_1472:
	mov r13,r8
	bt r12,3
	jc LB_1473
	btr r12,0
	jmp LB_1474
LB_1473:
	bts r12,0
LB_1474:
	call NS_E_1426
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_1465
	btr r12,5
	jmp LB_1466
LB_1465:
	bts r12,5
LB_1466:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_1463
	btr r12,4
	jmp LB_1464
LB_1463:
	bts r12,4
LB_1464:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1461
	btr r12,3
	jmp LB_1462
LB_1461:
	bts r12,3
LB_1462:
	add rsp,32
; _f1426 { %_1413 %_1421 %_1423 } ⊢ %_1424 : %_1424
 ; {>  %_1404~3':_r64 %_1421~5':_r64 %_1413~4':_r64 %_1423~0':_r64 }
; _f1426 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_1477
	btr r12,1
	jmp LB_1478
LB_1477:
	bts r12,1
LB_1478:
	mov r15,r13
	bt r12,0
	jc LB_1479
	btr r12,2
	jmp LB_1480
LB_1479:
	bts r12,2
LB_1480:
	mov r13,r9
	bt r12,4
	jc LB_1481
	btr r12,0
	jmp LB_1482
LB_1481:
	bts r12,0
LB_1482:
	call NS_E_1426
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1475
	btr r12,3
	jmp LB_1476
LB_1475:
	bts r12,3
LB_1476:
	add rsp,16
; ∎ %_1424
 ; {>  %_1404~3':_r64 %_1424~0':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_1483
	mov rdi,r8
	call dlt
LB_1483:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_1490:
; ∎ %_1401
 ; {>  %_1404~3':_r64 %_1401~2':_r64 %_1403~0':_r64 %_1425~4':_r64 %_1402~1':_r64 }
; 	∎ 2'
	bt r12,3
	jc LB_1484
	mov rdi,r8
	call dlt
LB_1484:
	bt r12,0
	jc LB_1485
	mov rdi,r13
	call dlt
LB_1485:
	bt r12,4
	jc LB_1486
	mov rdi,r9
	call dlt
LB_1486:
	bt r12,1
	jc LB_1487
	mov rdi,r14
	call dlt
LB_1487:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_1488
	btr r12,0
	jmp LB_1489
LB_1488:
	bts r12,0
LB_1489:
	ret
NS_E_1517:
NS_E_RDI_1517:
; » 0xraa |~ {  } ⊢ %_1496 : %_1496
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_1496
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; » 0xr87 |~ {  } ⊢ %_1497 : %_1497
 ; {>  %_1496~0':_r64 }
; 	» 0xr87 _ ⊢ 1' : %_1497
	mov rdi,0x87
	mov r14,rdi
	bts r12,1
; _f26 { %_1496 %_1497 } ⊢ { %_1498 %_1499 %_1500 } : { %_1498 %_1499 %_1500 }
 ; {>  %_1497~1':_r64 %_1496~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r15,rsi
	bts r12,2
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_1620
	bt r12,0
	jc LB_1619
	mov rdi,r13
	call dlt
LB_1619:
	jmp MTC_LB_1618
LB_1620:
; /0/0
	mov QWORD rax,0xab
	cmp rax,r13
	jnz LB_1622
	bt r12,0
	jc LB_1621
	mov rdi,r13
	call dlt
LB_1621:
	jmp MTC_LB_1617
LB_1622:
; /0/0/0
	mov QWORD rax,0xaa
	cmp rax,r13
	jnz LB_1624
	bt r12,0
	jc LB_1623
	mov rdi,r13
	call dlt
LB_1623:
	jmp MTC_LB_1616
LB_1624:
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1625
	btr r12,3
	jmp LB_1626
LB_1625:
	bts r12,3
LB_1626:
; /0/0/0/
	jmp MTC_LB_1615
MTC_LB_1618:
; ∎ {  }
 ; {>  %_1498~0':_r64 %_1499~1':_r64 %_1500~2':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1518
	mov rdi,r13
	call dlt
LB_1518:
	bt r12,1
	jc LB_1519
	mov rdi,r14
	call dlt
LB_1519:
	bt r12,2
	jc LB_1520
	mov rdi,r15
	call dlt
LB_1520:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1617:
; ∎ {  }
 ; {>  %_1498~0':_r64 %_1499~1':_r64 %_1500~2':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1521
	mov rdi,r13
	call dlt
LB_1521:
	bt r12,1
	jc LB_1522
	mov rdi,r14
	call dlt
LB_1522:
	bt r12,2
	jc LB_1523
	mov rdi,r15
	call dlt
LB_1523:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1616:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "AA"
	mov rsi,0x_00_00_00_00_00_00_41_41
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r8,rax
	btr r12,3
; » _^ ..
	mov rax,8
	mov rdi,0
	mov rsi,0
	mov rdi,r8
	mov rdi,QWORD [rdi]
	mov rsi,rdi
	shr rdi,32
	and rdi,0xffff
	sub rdi,1
	shl rdi,3
	and rsi,0b0111
	add rdi,rsi
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,3
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167"
	mov rsi,0x_00_00_00_00_00_00_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; "Qjjjjj"
	mov rsi,0x_00_00_6a_6a_6a_6a_6a_51
	mov QWORD [rdi+8*0],rsi
	add rdi,6
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,4
; _f14 %_1505 ⊢ %_1507 : %_1507
 ; {>  %_1498~0':_r64 %_1499~1':_r64 %_1505~3':_stg %_1506~4':_stg %_1500~2':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1532
	btr r12,0
	jmp LB_1533
LB_1532:
	bts r12,0
LB_1533:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1534
	btr r12,3
	jmp LB_1535
LB_1534:
	bts r12,3
LB_1535:
; pop_iv
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD [rsp],4
	jc LB_1530
	btr r12,4
	jmp LB_1531
LB_1530:
	bts r12,4
LB_1531:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1528
	btr r12,2
	jmp LB_1529
LB_1528:
	bts r12,2
LB_1529:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1526
	btr r12,1
	jmp LB_1527
LB_1526:
	bts r12,1
LB_1527:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1524
	btr r12,0
	jmp LB_1525
LB_1524:
	bts r12,0
LB_1525:
	add rsp,40
; _f14 %_1506 ⊢ %_1508 : %_1508
 ; {>  %_1498~0':_r64 %_1499~1':_r64 %_1507~3':_stg %_1506~4':_stg %_1500~2':_r64 }
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
	jc LB_1544
	btr r12,0
	jmp LB_1545
LB_1544:
	bts r12,0
LB_1545:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1546
	btr r12,4
	jmp LB_1547
LB_1546:
	bts r12,4
LB_1547:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1542
	btr r12,3
	jmp LB_1543
LB_1542:
	bts r12,3
LB_1543:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1540
	btr r12,2
	jmp LB_1541
LB_1540:
	bts r12,2
LB_1541:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1538
	btr r12,1
	jmp LB_1539
LB_1538:
	bts r12,1
LB_1539:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1536
	btr r12,0
	jmp LB_1537
LB_1536:
	bts r12,0
LB_1537:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_1509 : %_1509
 ; {>  %_1498~0':_r64 %_1508~4':_stg %_1499~1':_r64 %_1507~3':_stg %_1500~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_1509
	mov rdi,0x0
	mov r10,rdi
	bts r12,5
; _f1395 { %_1508 %_1509 } ⊢ { %_1510 %_1511 %_1512 } : { %_1510 %_1511 %_1512 }
 ; {>  %_1498~0':_r64 %_1508~4':_stg %_1499~1':_r64 %_1507~3':_stg %_1509~5':_r64 %_1500~2':_r64 }
; _f1395 { 4' 5' } ⊢ { 4' 5' 6' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' } ⊢ { 0' 1' }
	mov r13,r9
	bt r12,4
	jc LB_1556
	btr r12,0
	jmp LB_1557
LB_1556:
	bts r12,0
LB_1557:
	mov r14,r10
	bt r12,5
	jc LB_1558
	btr r12,1
	jmp LB_1559
LB_1558:
	bts r12,1
LB_1559:
	call NS_E_1395
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 4' 5' 6' }
	mov r9,r13
	bt r12,0
	jc LB_1560
	btr r12,4
	jmp LB_1561
LB_1560:
	bts r12,4
LB_1561:
	mov r10,r14
	bt r12,1
	jc LB_1562
	btr r12,5
	jmp LB_1563
LB_1562:
	bts r12,5
LB_1563:
	mov r11,r8
	bt r12,3
	jc LB_1566
	btr r12,6
	jmp LB_1567
LB_1566:
	bts r12,6
LB_1567:
	mov rsi,0
	bt r12,6
	jc LB_1564
	bts rsi,17
	bt r11,0
	jc LB_1564
	jmp LB_1565
LB_1564:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,6
LB_1565:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r11,rdi
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1554
	btr r12,3
	jmp LB_1555
LB_1554:
	bts r12,3
LB_1555:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1552
	btr r12,2
	jmp LB_1553
LB_1552:
	bts r12,2
LB_1553:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1550
	btr r12,1
	jmp LB_1551
LB_1550:
	bts r12,1
LB_1551:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1548
	btr r12,0
	jmp LB_1549
LB_1548:
	bts r12,0
LB_1549:
	add rsp,40
; _f14 { %_1511 %_1512 } ⊢ { %_1513 %_1514 } : { %_1513 %_1514 }
 ; {>  %_1498~0':_r64 %_1510~4':_stg %_1512~6':(_opn)◂(_stg) %_1499~1':_r64 %_1507~3':_stg %_1511~5':_r64 %_1500~2':_r64 }
; _f14 { 5' 6' } ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 5' 6' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,5
	jc LB_1580
	btr r12,1
	jmp LB_1581
LB_1580:
	bts r12,1
LB_1581:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_1578
	btr QWORD [rdi],0
	jmp LB_1579
LB_1578:
	bts QWORD [rdi],0
LB_1579:
	mov r14,r11
	bt r12,6
	jc LB_1584
	btr r12,1
	jmp LB_1585
LB_1584:
	bts r12,1
LB_1585:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_1582
	btr QWORD [rdi],1
	jmp LB_1583
LB_1582:
	bts QWORD [rdi],1
LB_1583:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 5' 6' }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1588
	btr r12,1
	jmp LB_1589
LB_1588:
	bts r12,1
LB_1589:
	mov r10,r14
	bt r12,1
	jc LB_1586
	btr r12,5
	jmp LB_1587
LB_1586:
	bts r12,5
LB_1587:
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1592
	btr r12,1
	jmp LB_1593
LB_1592:
	bts r12,1
LB_1593:
	mov r11,r14
	bt r12,1
	jc LB_1590
	btr r12,6
	jmp LB_1591
LB_1590:
	bts r12,6
LB_1591:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_1576
	btr r12,4
	jmp LB_1577
LB_1576:
	bts r12,4
LB_1577:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1574
	btr r12,3
	jmp LB_1575
LB_1574:
	bts r12,3
LB_1575:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1572
	btr r12,2
	jmp LB_1573
LB_1572:
	bts r12,2
LB_1573:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1570
	btr r12,1
	jmp LB_1571
LB_1570:
	bts r12,1
LB_1571:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1568
	btr r12,0
	jmp LB_1569
LB_1568:
	bts r12,0
LB_1569:
	add rsp,48
; ∎ {  }
 ; {>  %_1514~6':(_opn)◂(_stg) %_1498~0':_r64 %_1510~4':_stg %_1513~5':_r64 %_1499~1':_r64 %_1507~3':_stg %_1500~2':_r64 }
; 	∎ {  }
	bt r12,6
	jc LB_1594
	mov rdi,r11
	call dlt
LB_1594:
	bt r12,0
	jc LB_1595
	mov rdi,r13
	call dlt
LB_1595:
	bt r12,4
	jc LB_1596
	mov rdi,r9
	call dlt
LB_1596:
	bt r12,5
	jc LB_1597
	mov rdi,r10
	call dlt
LB_1597:
	bt r12,1
	jc LB_1598
	mov rdi,r14
	call dlt
LB_1598:
	bt r12,3
	jc LB_1599
	mov rdi,r8
	call dlt
LB_1599:
	bt r12,2
	jc LB_1600
	mov rdi,r15
	call dlt
LB_1600:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1615:
; _f14 %_1515 ⊢ %_1516 : %_1516
 ; {>  %_1498~0':_r64 %_1499~1':_r64 %_1515~3':_r64 %_1500~2':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1607
	btr r12,0
	jmp LB_1608
LB_1607:
	bts r12,0
LB_1608:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1609
	btr r12,3
	jmp LB_1610
LB_1609:
	bts r12,3
LB_1610:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1605
	btr r12,2
	jmp LB_1606
LB_1605:
	bts r12,2
LB_1606:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1603
	btr r12,1
	jmp LB_1604
LB_1603:
	bts r12,1
LB_1604:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1601
	btr r12,0
	jmp LB_1602
LB_1601:
	bts r12,0
LB_1602:
	add rsp,32
; ∎ {  }
 ; {>  %_1498~0':_r64 %_1499~1':_r64 %_1516~3':_r64 %_1500~2':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1611
	mov rdi,r13
	call dlt
LB_1611:
	bt r12,1
	jc LB_1612
	mov rdi,r14
	call dlt
LB_1612:
	bt r12,3
	jc LB_1613
	mov rdi,r8
	call dlt
LB_1613:
	bt r12,2
	jc LB_1614
	mov rdi,r15
	call dlt
LB_1614:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1395:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1395
	NS_E_DYN_1396:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1396
	NS_E_DYN_1397:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1397
	NS_E_DYN_1398:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1398
	NS_E_DYN_1426:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1426
	CST_DYN_1517:
		dq 0x0001_0001_00_82_ffff
		dq 1
