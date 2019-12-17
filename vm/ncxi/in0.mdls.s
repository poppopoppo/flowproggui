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
	call NS_E_1340
	call NS_E_1494
	call NS_E_1501
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
NS_E_1325:
NS_E_RDI_1325:
NS_E_1325_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1326
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_1326:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1328:
NS_E_RDI_1328:
NS_E_1328_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1328_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1328_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1329:
NS_E_RDI_1329:
NS_E_1329_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1329_LB_0
	cmp r11,57
	ja NS_E_1329_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1329_LB_0:
	mov rax,0
	ret
NS_E_1331:
NS_E_RDI_1331:
NS_E_1331_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1331_LB_0
	cmp r11,122
	ja NS_E_1331_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1331_LB_0:
	mov rax,0
	ret
NS_E_1330:
NS_E_RDI_1330:
NS_E_1330_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1330_LB_0
	cmp r11,90
	ja NS_E_1330_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1330_LB_0:
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
NS_E_1327:
NS_E_RDI_1327:
NS_E_1327_ETR_TBL:
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
	jz NS_E_1327_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_1327_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1340:
NS_E_RDI_1340:
; 	» "-27686gg" _ ⊢ 0' : %_1332
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » _f15 |~ {  } ⊢ %_1333 : %_1333
 ; {>  %_1332~0':_stg }
; 	» _args _ ⊢ 1' : %_1333
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
	mov r14,rax
	btr r12,1
; » _f15 |~ {  } ⊢ %_1334 : %_1334
 ; {>  %_1332~0':_stg %_1333~1':(_lst)◂(_stg) }
; 	» _args _ ⊢ 2' : %_1334
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
; » _f15 |~ {  } ⊢ %_1335 : %_1335
 ; {>  %_1332~0':_stg %_1334~2':(_lst)◂(_stg) %_1333~1':(_lst)◂(_stg) }
; 	» _args _ ⊢ 3' : %_1335
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
	mov r9,rax
	btr r12,3
; _f26 { %_1333 %_1334 %_1335 } ⊢ { %_1336 %_1337 %_1338 } : { %_1336 %_1337 %_1338 }
 ; {>  %_1332~0':_stg %_1334~2':(_lst)◂(_stg) %_1333~1':(_lst)◂(_stg) %_1335~3':(_lst)◂(_stg) }
; _f26 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110.. |},{ 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r14
	bt r12,1
	jc LB_1345
	btr r12,4
	jmp LB_1346
LB_1345:
	bts r12,4
LB_1346:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_1343
	btr QWORD [rdi],0
	jmp LB_1344
LB_1343:
	bts QWORD [rdi],0
LB_1344:
	mov r10,r8
	bt r12,2
	jc LB_1349
	btr r12,4
	jmp LB_1350
LB_1349:
	bts r12,4
LB_1350:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_1347
	btr QWORD [rdi],1
	jmp LB_1348
LB_1347:
	bts QWORD [rdi],1
LB_1348:
	mov r10,r9
	bt r12,3
	jc LB_1353
	btr r12,4
	jmp LB_1354
LB_1353:
	bts r12,4
LB_1354:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_1351
	btr QWORD [rdi],2
	jmp LB_1352
LB_1351:
	bts QWORD [rdi],2
LB_1352:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' 3' }
; 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1357
	btr r12,4
	jmp LB_1358
LB_1357:
	bts r12,4
LB_1358:
	mov r14,r10
	bt r12,4
	jc LB_1355
	btr r12,1
	jmp LB_1356
LB_1355:
	bts r12,1
LB_1356:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1361
	btr r12,4
	jmp LB_1362
LB_1361:
	bts r12,4
LB_1362:
	mov r8,r10
	bt r12,4
	jc LB_1359
	btr r12,2
	jmp LB_1360
LB_1359:
	bts r12,2
LB_1360:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_1365
	btr r12,4
	jmp LB_1366
LB_1365:
	bts r12,4
LB_1366:
	mov r9,r10
	bt r12,4
	jc LB_1363
	btr r12,3
	jmp LB_1364
LB_1363:
	bts r12,3
LB_1364:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1341
	btr r12,0
	jmp LB_1342
LB_1341:
	bts r12,0
LB_1342:
	add rsp,16
; _f26 %_1332 ⊢ %_1339 : %_1339
 ; {>  %_1338~3':(_lst)◂(_stg) %_1337~2':(_lst)◂(_stg) %_1332~0':_stg %_1336~1':(_lst)◂(_stg) }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1371
	btr r12,3
	jmp LB_1372
LB_1371:
	bts r12,3
LB_1372:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1369
	btr r12,2
	jmp LB_1370
LB_1369:
	bts r12,2
LB_1370:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1367
	btr r12,1
	jmp LB_1368
LB_1367:
	bts r12,1
LB_1368:
	add rsp,32
; ∎ {  }
 ; {>  %_1338~3':(_lst)◂(_stg) %_1337~2':(_lst)◂(_stg) %_1339~0':_stg %_1336~1':(_lst)◂(_stg) }
; 	∎ {  }
	bt r12,3
	jc LB_1373
	mov rdi,r9
	call dlt
LB_1373:
	bt r12,2
	jc LB_1374
	mov rdi,r8
	call dlt
LB_1374:
	bt r12,0
	jc LB_1375
	mov rdi,r13
	call dlt
LB_1375:
	bt r12,1
	jc LB_1376
	mov rdi,r14
	call dlt
LB_1376:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1384:
; 	|» 0'
NS_E_RDI_1384:
MTC_LB_1385:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1386
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
	jnc LB_1387
	bt QWORD [rdi],0
	jc LB_1388
	btr r12,3
	jmp LB_1389
LB_1388:
	bts r12,3
LB_1389:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1387:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1392
	btr r12,4
	jmp LB_1393
LB_1392:
	bts r12,4
LB_1393:
	mov r14,r10
	bt r12,4
	jc LB_1390
	btr r12,1
	jmp LB_1391
LB_1390:
	bts r12,1
LB_1391:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1396
	btr r12,4
	jmp LB_1397
LB_1396:
	bts r12,4
LB_1397:
	mov r8,r10
	bt r12,4
	jc LB_1394
	btr r12,2
	jmp LB_1395
LB_1394:
	bts r12,2
LB_1395:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1386
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
	jnc LB_1398
	bt QWORD [rdi],0
	jc LB_1399
	btr r12,5
	jmp LB_1400
LB_1399:
	bts r12,5
LB_1400:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1398:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1403
	btr r12,6
	jmp LB_1404
LB_1403:
	bts r12,6
LB_1404:
	mov r9,rcx
	bt r12,6
	jc LB_1401
	btr r12,3
	jmp LB_1402
LB_1401:
	bts r12,3
LB_1402:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1407
	btr r12,6
	jmp LB_1408
LB_1407:
	bts r12,6
LB_1408:
	mov r10,rcx
	bt r12,6
	jc LB_1405
	btr r12,4
	jmp LB_1406
LB_1405:
	bts r12,4
LB_1406:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1409:
	cmp r15,0
	jz LB_1410
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1409
LB_1410:
; ∎ {  }
 ; {>  %_1378~1':t706'(-1) %_1381~4':(_lst)◂(t706'(-1)) %_1380~3':t706'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_1411
	mov rdi,r14
	call dlt
LB_1411:
	bt r12,4
	jc LB_1412
	mov rdi,r10
	call dlt
LB_1412:
	bt r12,3
	jc LB_1413
	mov rdi,r9
	call dlt
LB_1413:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1386:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1414
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
	jnc LB_1415
	bt QWORD [rdi],0
	jc LB_1416
	btr r12,3
	jmp LB_1417
LB_1416:
	bts r12,3
LB_1417:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1415:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1420
	btr r12,4
	jmp LB_1421
LB_1420:
	bts r12,4
LB_1421:
	mov r14,r10
	bt r12,4
	jc LB_1418
	btr r12,1
	jmp LB_1419
LB_1418:
	bts r12,1
LB_1419:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1424
	btr r12,4
	jmp LB_1425
LB_1424:
	bts r12,4
LB_1425:
	mov r8,r10
	bt r12,4
	jc LB_1422
	btr r12,2
	jmp LB_1423
LB_1422:
	bts r12,2
LB_1423:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1414
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_1426
	bt QWORD [rdi],0
	jc LB_1427
	btr r12,3
	jmp LB_1428
LB_1427:
	bts r12,3
LB_1428:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1426:
	mov r9,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1429:
	cmp r15,0
	jz LB_1430
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1429
LB_1430:
; ∎ {  }
 ; {>  %_1382~1':t706'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_1431
	mov rdi,r14
	call dlt
LB_1431:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1414:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1432
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
	jnc LB_1433
	bt QWORD [rdi],0
	jc LB_1434
	btr r12,1
	jmp LB_1435
LB_1434:
	bts r12,1
LB_1435:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1433:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1436:
	cmp r15,0
	jz LB_1437
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1436
LB_1437:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1432:
NS_E_1438:
NS_E_RDI_1438:
NS_E_1438_ETR_TBL:
NS_E_1438_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "A"
	add r14,1
	cmp r14,r10
	jg LB_1465
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_1465
	jmp LB_1466
LB_1465:
	jmp LB_1448
LB_1466:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; g0
	push r10
	call NS_E_1438_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_1457
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_1458
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_1458:
	jmp LB_1449
LB_1457:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_1452
	btr r12,1
	jmp LB_1453
LB_1452:
	bts r12,1
LB_1453:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_1450
	btr r12,0
	jmp LB_1451
LB_1450:
	bts r12,0
LB_1451:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_1445
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_1467
	btr r12,2
	jmp LB_1468
LB_1467:
	bts r12,2
LB_1468:
	mov r13,r14
	bt r12,1
	jc LB_1469
	btr r12,0
	jmp LB_1470
LB_1469:
	bts r12,0
LB_1470:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_1439 ⊢ %_1440 : %_1440
 ; {>  %_1439~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1440
 ; {>  %_1440~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1443
	btr r12,3
	jmp LB_1444
LB_1443:
	bts r12,3
LB_1444:
	mov r8,0
	bts r12,2
	ret
LB_1445:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1447
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1446
LB_1447:
	add rsp,8
	ret
LB_1449:
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
LB_1448:
	add rsp,32
	pop r14
LB_1446:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "C"
	add r14,1
	cmp r14,r10
	jg LB_1484
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_1484
	jmp LB_1485
LB_1484:
	jmp LB_1476
LB_1485:
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
	jc LB_1477
	btr r12,0
	jmp LB_1478
LB_1477:
	bts r12,0
LB_1478:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_1473
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_1441 : %_1441
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_1441
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_1441 ⊢ %_1442 : %_1442
 ; {>  %_1441~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_1442
 ; {>  %_1442~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_1471
	btr r12,3
	jmp LB_1472
LB_1471:
	bts r12,3
LB_1472:
	mov r8,0
	bts r12,2
	ret
LB_1473:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_1475
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_1474
LB_1475:
	add rsp,8
	ret
LB_1476:
	add rsp,16
	pop r14
LB_1474:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_1494:
NS_E_RDI_1494:
; 	» "A" _ ⊢ 0' : %_1489
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr1 |~ {  } ⊢ %_1490 : %_1490
 ; {>  %_1489~0':_stg }
; 	» 0xr1 _ ⊢ 1' : %_1490
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_1491 : %_1491
 ; {>  %_1489~0':_stg %_1490~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f1488 %_1490 ⊢ %_1492 : %_1492
 ; {>  %_1491~°1◂{  }:(_lst)◂(t734'(0)) %_1489~0':_stg %_1490~1':_r64 }
; _f1488 1' ⊢ °1◂1'
; _f1488 %_1489 ⊢ %_1493 : %_1493
 ; {>  %_1491~°1◂{  }:(_lst)◂(t734'(0)) %_1489~0':_stg %_1492~°1◂1':∀[664].(_p1486)◂(t664'(-1)) }
; _f1488 0' ⊢ °1◂0'
; ∎ {  }
 ; {>  %_1491~°1◂{  }:(_lst)◂(t734'(0)) %_1492~°1◂1':∀[664].(_p1486)◂(t664'(-1)) %_1493~°1◂0':∀[664].(_p1486)◂(t664'(-1)) }
; 	∎ {  }
	bt r12,1
	jc LB_1495
	mov rdi,r14
	call dlt
LB_1495:
	bt r12,0
	jc LB_1496
	mov rdi,r13
	call dlt
LB_1496:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1501:
NS_E_RDI_1501:
; » 0xr9 |~ {  } ⊢ %_1497 : %_1497
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_1497
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,2
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\tX"
	mov rax,r13
LB_1502:
	cmp rax,0
	jz LB_1503
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_58
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
	sub rax,1
	jmp LB_1502
LB_1503:
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; _f26 %_1499 ⊢ %_1500 : %_1500
 ; {>  %_1498~0':_r64 %_1499~1':_stg }
; _f26 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1506
	btr r12,0
	jmp LB_1507
LB_1506:
	bts r12,0
LB_1507:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1508
	btr r12,1
	jmp LB_1509
LB_1508:
	bts r12,1
LB_1509:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1504
	btr r12,0
	jmp LB_1505
LB_1504:
	bts r12,0
LB_1505:
	add rsp,16
; ∎ {  }
 ; {>  %_1498~0':_r64 %_1500~1':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_1510
	mov rdi,r13
	call dlt
LB_1510:
	bt r12,1
	jc LB_1511
	mov rdi,r14
	call dlt
LB_1511:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1525:
; 	|» { 0' 1' }
NS_E_RDI_1525:
MTC_LB_1526:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1527
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
	jnc LB_1528
	bt QWORD [rdi],0
	jc LB_1529
	btr r12,4
	jmp LB_1530
LB_1529:
	bts r12,4
LB_1530:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1528:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1533
	btr r12,5
	jmp LB_1534
LB_1533:
	bts r12,5
LB_1534:
	mov r8,r11
	bt r12,5
	jc LB_1531
	btr r12,2
	jmp LB_1532
LB_1531:
	bts r12,2
LB_1532:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1537
	btr r12,5
	jmp LB_1538
LB_1537:
	bts r12,5
LB_1538:
	mov r9,r11
	bt r12,5
	jc LB_1535
	btr r12,3
	jmp LB_1536
LB_1535:
	bts r12,3
LB_1536:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1539:
	cmp r15,0
	jz LB_1540
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1539
LB_1540:
; _f41 %_1512 ⊢ { %_1516 %_1517 } : { %_1516 %_1517 }
 ; {>  %_1514~2':_r64 %_1512~0':_r64 %_1515~3':(_lst)◂(_r64) }
	mov r14,r13
	bts r12,1
; _f44 %_1517 ⊢ %_1518 : %_1518
 ; {>  %_1514~2':_r64 %_1517~1':_r64 %_1516~0':_r64 %_1515~3':(_lst)◂(_r64) }
	add r14,1
; _f1525 { %_1518 %_1515 } ⊢ %_1519 : %_1519
 ; {>  %_1514~2':_r64 %_1518~1':_r64 %_1516~0':_r64 %_1515~3':(_lst)◂(_r64) }
; _f1525 { 1' 3' } ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 1' 3' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_1545
	btr r12,0
	jmp LB_1546
LB_1545:
	bts r12,0
LB_1546:
	mov r14,r9
	bt r12,3
	jc LB_1547
	btr r12,1
	jmp LB_1548
LB_1547:
	bts r12,1
LB_1548:
	call NS_E_1525
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1549
	btr r12,1
	jmp LB_1550
LB_1549:
	bts r12,1
LB_1550:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1543
	btr r12,2
	jmp LB_1544
LB_1543:
	bts r12,2
LB_1544:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1541
	btr r12,0
	jmp LB_1542
LB_1541:
	bts r12,0
LB_1542:
	add rsp,24
; _f21 { %_1519 %_1516 %_1514 } ⊢ { %_1520 %_1521 %_1522 } : { %_1520 %_1521 %_1522 }
 ; {>  %_1519~1':_stg %_1514~2':_r64 %_1516~0':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_1551
	btr r12,3
	jmp LB_1552
LB_1551:
	bts r12,3
LB_1552:
	mov r14,r13
	bt r12,0
	jc LB_1553
	btr r12,1
	jmp LB_1554
LB_1553:
	bts r12,1
LB_1554:
	mov r13,r9
	bt r12,3
	jc LB_1555
	btr r12,0
	jmp LB_1556
LB_1555:
	bts r12,0
LB_1556:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1520
 ; {>  %_1521~1':_r64 %_1520~0':_stg %_1522~2':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_1557
	mov rdi,r14
	call dlt
LB_1557:
	bt r12,2
	jc LB_1558
	mov rdi,r8
	call dlt
LB_1558:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1527:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1559
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
	jnc LB_1560
	bt QWORD [rdi],0
	jc LB_1561
	btr r12,2
	jmp LB_1562
LB_1561:
	bts r12,2
LB_1562:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1560:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1563:
	cmp r15,0
	jz LB_1564
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1563
LB_1564:
; _f19 %_1512 ⊢ { %_1523 %_1524 } : { %_1523 %_1524 }
 ; {>  %_1512~0':_r64 }
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
; ∎ %_1524
 ; {>  %_1523~0':_r64 %_1524~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1565
	mov rdi,r13
	call dlt
LB_1565:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1566
	btr r12,0
	jmp LB_1567
LB_1566:
	bts r12,0
LB_1567:
	ret
MTC_LB_1559:
section .data
	NS_E_DYN_1325:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1325
	NS_E_DYN_1328:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1328
	NS_E_DYN_1329:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1329
	NS_E_DYN_1330:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1330
	NS_E_DYN_1331:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1331
	CST_DYN_1340:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1384:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1384
	NS_E_DYN_1438:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1438
	NS_E_DYN_1487:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1488:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	CST_DYN_1494:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_1501:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1525:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1525
