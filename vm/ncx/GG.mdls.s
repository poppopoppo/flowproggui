%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_427
	mov QWORD [CST_DYN_427+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_427],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call exec_out
	jmp _end
NS_E_372:
NS_E_RDI_372:
NS_E_372_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_372_LB_0
	bt r11,7
	jc LB_373
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,1
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_373:
	add rsi,1
	bt r11,6
	jc LB_374
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,2
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_374:
	add rsi,1
	bt r11,5
	jc LB_375
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,3
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_375:
	add rsi,1
	bt r11,5
	jc LB_375
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,4
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11b,[rdi+rsi+8*1+3]
	mov BYTE [r10+8*1+3],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
	add rsi,1
	mov rax,1
	ret
NS_E_372_LB_0:
	mov rax,0
	ret
NS_E_14:
NS_E_RDI_14:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_18:
	mov rdi,r8
	bt r12,0
NS_E_RDI_18:
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
NS_E_377:
NS_E_RDI_377:
	mov rdi,r8
	mov rsi,r9
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,1
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_377_TBL
NS_E_377_ETR_TBL:
	push QWORD 1
NS_E_377_TBL:
	push rsi
; _chr
	call NS_E_372_ETR_TBL
	cmp rax,0
	jnz LB_414
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_0_failed
LB_414:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
; "A"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,65
	jz LB_418
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_419
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_419:
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_0_failed
LB_418:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],unt
; _chr
	call NS_E_372_ETR_TBL
	cmp rax,0
	jnz LB_423
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_424
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_424:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_425
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_425:
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_0_failed
LB_423:
	mov QWORD [prs_vct+16*2],r11
	mov QWORD [prs_vct+8*1+16*2],r10
NS_E_377_MTC_0_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,3
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_408
	btr QWORD [rdi],2
LB_408:
	mov rbx,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rbx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_409
	btr QWORD [rdi],1
LB_409:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_410
	btr QWORD [rdi],0
LB_410:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	push rdi
	mov rdi,2
	call mlc
	btr QWORD [rax],1
	mov r10,rax
	pop rax
	mov QWORD [r10+8*1],0
	mov QWORD [r10+8*2],rax
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_377_succeed
NS_E_377_MTC_0_failed:
	pop rsi
	push rsi
; "H"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,72
	jz LB_388
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_1_failed
LB_388:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],unt
; _chr
	call NS_E_372_ETR_TBL
	cmp rax,0
	jnz LB_392
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_393
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_393:
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_1_failed
LB_392:
	mov QWORD [prs_vct+16*1],r11
	mov QWORD [prs_vct+8*1+16*1],r10
; "O"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,79
	jz LB_397
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_398
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_398:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_399
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_399:
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_1_failed
LB_397:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],unt
; _chr
	call NS_E_372_ETR_TBL
	cmp rax,0
	jnz LB_403
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_404
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dec_r
LB_404:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_405
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_405:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_406
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_406:
	pop rdx
	pop rdi
	jmp NS_E_377_MTC_1_failed
LB_403:
	mov QWORD [prs_vct+16*3],r11
	mov QWORD [prs_vct+8*1+16*3],r10
NS_E_377_MTC_1_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,4
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*3]
	bt rsi,0
	jc LB_381
	btr QWORD [rdi],3
LB_381:
	mov rbx,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rbx
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_382
	btr QWORD [rdi],2
LB_382:
	mov rbx,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rbx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_383
	btr QWORD [rdi],1
LB_383:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_384
	btr QWORD [rdi],0
LB_384:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	push rdi
	mov rdi,2
	call mlc
	btr QWORD [rax],1
	mov r10,rax
	pop rax
	mov QWORD [r10+8*1],1
	mov QWORD [r10+8*2],rax
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_377_succeed
NS_E_377_MTC_1_failed:
	pop rsi
	jmp NS_E_377_failed
NS_E_377_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_377_succeed_tbl
	push rsi
	push rdi
	push r10
	push r11
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	pop r11
	pop r8
	mov rsi,[rax]
	btr rsi,0
	bt r11,0
	jc LB_380
	btr rsi,2
LB_380:
	mov [rax],rsi
	mov QWORD [rax+8*3],r8
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_377_succeed_tbl:
	ret
NS_E_377_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_377_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_377_failed_tbl:
	mov rax,0
	ret
NS_E_427:
NS_E_RDI_427:
; 	» "HxOi" |~ 0' : _stg
;push_reg
	mov rdi,4
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],72
	add rsi,1
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],105
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_428
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_429
emt_set_ptn_0_LB_428:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_429:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_430
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_430:
; 	» 0xr0 |~ 0' : _r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	g0.prs { 1' 2' } ⊢ { 0' 1' 2' } : { _stg _r64 _p376 }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r12,1
	jc LB_434
	and r12,~0b1000
LB_434:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
	mov rbx,r11
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,3
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_435
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_436
emt_set_ptn_0_LB_435:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_436:
; emt_ptn_set_ptn 2',1'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_440
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_440:
	call NS_E_377
	mov QWORD [tmp],rax
	jc call_c_LB_441
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_449
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_450
emt_set_ptn_0_LB_449:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_450:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_453
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_454
emt_set_ptn_0_LB_453:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_454:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_442
call_c_LB_441:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_443
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_444
emt_set_ptn_0_LB_443:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_444:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_447
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_448
emt_set_ptn_0_LB_447:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_448:
call_nc_LB_442:
; 	_pp_v 2' ⊢ { 2' 3' } : { _p376 _stg }
; push_s_ex  0'~s0 1'~x0
	sub rsp,24
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_455
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_456
emt_set_ptn_0_LB_455:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_456:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_457
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_457:
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_458
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_464
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_465
emt_set_ptn_0_LB_464:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_465:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_466
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_467
emt_set_ptn_0_LB_466:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_467:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_459
call_c_LB_458:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_460
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_461
emt_set_ptn_0_LB_460:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_461:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_462
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_463
emt_set_ptn_0_LB_462:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_463:
call_nc_LB_459:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_LB_468
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_469
emt_get_ptn_0_LB_468:
; unboxed
	stc
emt_get_ptn_1_LB_469:
	mov QWORD rcx,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,rcx
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_470
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_470:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_471
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
LB_471:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_LB_472
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_LB_472:
;clear  2'~a0 0'~s0 1'~x0
	bt r12,2
	jc clear_LB_473
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_LB_473:
	bt r12,0
	jc clear_LB_474
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_474:
	bt r12,1
	jc clear_LB_475
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_475:
	mov rax,r11
	stc
	ret
NS_E_476:
; 	|» {  }
	jz NS_E_RDI_476
	jc emt_etr_c_LB_477
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_476
emt_etr_c_LB_477:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_476:
; 	» "\n~~~\n" |~ 0' : _stg
;push_reg
	mov rdi,5
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_478
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_479
emt_set_ptn_0_LB_478:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_479:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_480
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_480:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_481
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_482
emt_get_ptn_0_LB_481:
; unboxed
	stc
emt_get_ptn_1_LB_482:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_483
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_483:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_484
;push_reg
	call exec_out
;pop_reg
LB_484:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_485
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_485:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_372:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_372
	NS_E_DYN_378:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_379:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_377:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_377
	CST_DYN_427:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_476:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_476
