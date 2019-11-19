%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_410
	mov QWORD [CST_DYN_410+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_410],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_461
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_386:
NS_E_RDI_386:
NS_E_386_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_386_LB_0
	bt r11,7
	jc LB_387
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
LB_387:
	add rsi,1
	bt r11,6
	jc LB_388
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
LB_388:
	add rsi,1
	bt r11,5
	jc LB_389
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
LB_389:
	add rsi,1
	bt r11,5
	jc LB_389
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
NS_E_386_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_14:
	mov rdi,r8
	bt r12,0
NS_E_RDI_14:
	mov rsi,0
	setc sil
	push rsi
	call pnt_v
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
NS_E_391:
NS_E_RDI_391:
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
	jmp NS_E_391_TBL
NS_E_391_ETR_TBL:
	push QWORD 1
NS_E_391_TBL:
	push rsi
	call NS_E_386_ETR_TBL
	cmp rax,0
	jnz LB_397
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_391_MTC_0_failed
LB_397:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,65
	jz LB_401
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rdi,0
	jc LB_402
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_402:
	pop rdx
	pop rdi
	jmp NS_E_391_MTC_0_failed
LB_401:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],unt
	call NS_E_386_ETR_TBL
	cmp rax,0
	jnz LB_406
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rdi,0
	jc LB_407
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_407:
	mov rsi,QWORD [prs_vct+16*0]
	bt rdi,0
	jc LB_408
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_408:
	pop rdx
	pop rdi
	jmp NS_E_391_MTC_0_failed
LB_406:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
NS_E_391_MTC_0_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,3
	call mlc
	mov rdi,rax
	mov r10,rdi
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_391_succeed
NS_E_391_MTC_0_failed:
	pop rsi
	jmp NS_E_391_failed
NS_E_391_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_391_succeed_tbl
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
	jc LB_393
	btr rsi,2
LB_393:
	mov [rax],rsi
	mov QWORD [rax+8*3],r8
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_391_succeed_tbl:
	ret
NS_E_391_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_391_failed_tbl
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
NS_E_391_failed_tbl:
	mov rax,0
	ret
NS_E_410:
NS_E_RDI_410:
; 	» "xAg" |~ 0' : _stg
;push_reg
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],65
	add rsi,1
	mov BYTE [rdi+8*1+rsi],103
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_411
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_412
emt_set_ptn_0_lb_411:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_412:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_413
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_413:
; 	» 0xr0 |~ 0' : _r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	g0.prs { 1' 2' } ⊢ { 0' 1' 2' } : { _stg _r64 _p390 }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_417
	and r12,~0b1000
lb_417:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
	mov rbx,r11
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_418
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_419
emt_set_ptn_0_lb_418:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_419:
; emt_ptn_set_ptn 2',1'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_423
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
emt_dec_ptn_0_lb_423:
	call NS_E_391
	mov QWORD [tmp],rax
	jc call_c_lb_424
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_433
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_434
emt_set_ptn_0_lb_433:
	mov r8,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1
emt_set_ptn_1_lb_434:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_437
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_438
emt_set_ptn_0_lb_437:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_438:
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_425
call_c_lb_424:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_426
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_427
emt_set_ptn_0_lb_426:
	mov r8,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1
emt_set_ptn_1_lb_427:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_430
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_431
emt_set_ptn_0_lb_430:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_431:
call_nc_lb_425:
; 	_pp_v 2' ⊢ { 2' 3' } : { _p390 _stg }
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
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_439
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_440
emt_set_ptn_0_lb_439:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_440:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_441
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_441:
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_lb_442
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_449
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_450
emt_set_ptn_0_lb_449:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_450:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_451
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_452
emt_set_ptn_0_lb_451:
	mov r11,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1000
emt_set_ptn_1_lb_452:
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_443
call_c_lb_442:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_444
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_445
emt_set_ptn_0_lb_444:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_445:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_446
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_447
emt_set_ptn_0_lb_446:
	mov r11,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1000
emt_set_ptn_1_lb_447:
call_nc_lb_443:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_lb_453
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_454
emt_get_ptn_0_lb_453:
; unboxed
	stc
emt_get_ptn_1_lb_454:
	mov QWORD rcx,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,rcx
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_455
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
emt_dec_ptn_0_lb_455:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_456
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
LB_456:
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
	jc ret_lb_457
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_457:
;clear  2'~a0 0'~s0 1'~x0
	bt r12,2
	jc clear_lb_458
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_lb_458:
	bt r12,0
	jc clear_lb_459
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_lb_459:
	bt r12,1
	jc clear_lb_460
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_460:
	mov rax,r11
	stc
	ret
NS_E_461:
; 	|» {  }
	jz NS_E_RDI_461
	jc emt_etr_c_lb_462
	push rbx
	mov rbx,rdi
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_461
emt_etr_c_lb_462:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_461:
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
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_463
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_464
emt_set_ptn_0_lb_463:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_464:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_465
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_465:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_466
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_467
emt_get_ptn_0_lb_466:
; unboxed
	stc
emt_get_ptn_1_lb_467:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_468
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_468:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_469
;push_reg
	call exec_out
;pop_reg
LB_469:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_470
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_470:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_386:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_386
	NS_E_DYN_392:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_391:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_391
	CST_DYN_410:
		dq 1
		dq 1
	NS_E_DYN_461:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_461
