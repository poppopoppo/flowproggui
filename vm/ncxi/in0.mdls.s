%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_403
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
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
NS_E_389:
NS_E_RDI_389:
NS_E_389_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_390
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_390:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_392:
NS_E_RDI_392:
NS_E_392_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_392_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_392_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_393:
NS_E_RDI_393:
NS_E_393_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_393_LB_0
	cmp r11,57
	ja NS_E_393_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_393_LB_0:
	mov rax,0
	ret
NS_E_395:
NS_E_RDI_395:
NS_E_395_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_395_LB_0
	cmp r11,122
	ja NS_E_395_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_395_LB_0:
	mov rax,0
	ret
NS_E_394:
NS_E_RDI_394:
NS_E_394_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_394_LB_0
	cmp r11,90
	ja NS_E_394_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_394_LB_0:
	mov rax,0
	ret
NS_E_19:
NS_E_RDI_19:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_23:
	mov rdi,r8
	bt r12,0
NS_E_RDI_23:
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
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_391:
NS_E_RDI_391:
NS_E_391_ETR_TBL:
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
	jz NS_E_391_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_391_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_403:
NS_E_RDI_403:
; 	» "  -2" _ ⊢ 0' : %_396
	mov rdi,4
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_32_2d_20_20
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_397 : %_397
 ; {>  %_396~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_397
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f391 { %_396 %_397 } ⊢ { %_398 %_399 %_400 } : { %_398 %_399 %_400 }
 ; {>  %_396~0':_stg %_397~1':_r64 }
; _f391 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_391
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_404
	btr r12,4
	jmp LB_405
LB_404:
	bts r12,4
LB_405:
	mov r15,r8
	bt r12,3
	jc LB_408
	btr r12,2
	jmp LB_409
LB_408:
	bts r12,2
LB_409:
	mov rsi,1
	bt r12,2
	jc LB_406
	mov rsi,0
	bt r15,0
	jc LB_406
	jmp LB_407
LB_406:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_407:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f16 { %_399 %_400 } ⊢ { %_401 %_402 } : { %_401 %_402 }
 ; {>  %_398~0':_stg %_399~1':_r64 %_400~2':(_opn)◂(_r64) }
; _f16 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_414
	btr r12,3
	jmp LB_415
LB_414:
	bts r12,3
LB_415:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_412
	btr QWORD [rdi],0
	jmp LB_413
LB_412:
	bts QWORD [rdi],0
LB_413:
	mov r8,r15
	bt r12,2
	jc LB_418
	btr r12,3
	jmp LB_419
LB_418:
	bts r12,3
LB_419:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_416
	btr QWORD [rdi],1
	jmp LB_417
LB_416:
	bts QWORD [rdi],1
LB_417:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_422
	btr r12,3
	jmp LB_423
LB_422:
	bts r12,3
LB_423:
	mov r14,r8
	bt r12,3
	jc LB_420
	btr r12,1
	jmp LB_421
LB_420:
	bts r12,1
LB_421:
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_426
	btr r12,3
	jmp LB_427
LB_426:
	bts r12,3
LB_427:
	mov r15,r8
	bt r12,3
	jc LB_424
	btr r12,2
	jmp LB_425
LB_424:
	bts r12,2
LB_425:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_410
	btr r12,0
	jmp LB_411
LB_410:
	bts r12,0
LB_411:
	add rsp,16
; ∎ {  }
 ; {>  %_401~1':_r64 %_398~0':_stg %_402~2':(_opn)◂(_r64) }
; 	∎ {  }
	bt r12,1
	jc LB_428
	mov rdi,r14
	call dlt
LB_428:
	bt r12,0
	jc LB_429
	mov rdi,r13
	call dlt
LB_429:
	bt r12,2
	jc LB_430
	mov rdi,r15
	call dlt
LB_430:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_389:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_389
	NS_E_DYN_392:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_392
	NS_E_DYN_393:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_393
	NS_E_DYN_394:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_394
	NS_E_DYN_395:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_395
	CST_DYN_403:
		dq 0x0001_0001_00_82_ffff
		dq 1
