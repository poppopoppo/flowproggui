%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_521
	mov QWORD [CST_DYN_521+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_521],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call exec_out
	jmp _end
NS_E_495:
NS_E_RDI_495:
NS_E_495_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_495_LB_0
	bt r11,7
	jc LB_496
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
LB_496:
	add rsi,1
	bt r11,6
	jc LB_497
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
LB_497:
	add rsi,1
	bt r11,5
	jc LB_498
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
LB_498:
	add rsi,1
	bt r11,5
	jc LB_498
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
NS_E_495_LB_0:
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
NS_E_500:
NS_E_RDI_500:
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
	imul rcx,0
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_500_TBL
NS_E_500_ETR_TBL:
	push QWORD 1
NS_E_500_TBL:
	push rsi
; "A"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,65
	jz LB_511
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_500_MTC_0_failed
LB_511:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],unt
; "B"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,66
	jz LB_517
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_519
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_519:
	pop rdx
	pop rdi
	jmp NS_E_500_MTC_0_failed
LB_517:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],unt
NS_E_500_MTC_0_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_505
	btr QWORD [rdi],1
LB_505:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_506
	btr QWORD [rdi],0
LB_506:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	mov r10,0x0000_0000_0000_0001
	add rdi,r10
	mov r10,rdi
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_500_succeed
NS_E_500_MTC_0_failed:
	pop rsi
	jmp NS_E_500_failed
NS_E_500_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_500_succeed_tbl
	push rsi
	push rdi
	bt r11,0
	jc LB_502
	bt r10,0
	jc LB_503
	bts r10,0
	jmp LB_504
LB_502:
	push r10
	call mlc_ln
	pop r10
	mov QWORD [rax+8*1],r10
	bts rax,0
	mov r10,rax
	jmp LB_504
LB_503:
	push r10
	call mlc_ln
	pop r10
	mov QWORD [rax+8*1],r10
	btr QWORD [rax],0
	bts rax,0
	mov r10,rax
	jmp LB_504
LB_504:
	push r10
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	pop QWORD [rax+8*3]
	btr QWORD [rax],0
	btr QWORD [rax],2
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	clc
	ret
NS_E_500_succeed_tbl:
	ret
NS_E_500_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_500_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	btr QWORD [rax],0
	mov r10,unt
	mov r11,0x0100_0000_0000_0001
	add r10,r11
	mov QWORD [rax+8*3],r10
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	clc
	ret
NS_E_500_failed_tbl:
	mov rax,0
	ret
NS_E_521:
NS_E_RDI_521:
; 	» g0.prs _ ⊢ 0' : { _stg _r64 }→{ _stg _r64 (_opn)◂(_p499) }
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [NS_E_DYN_500],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,NS_E_DYN_500
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,{ _stg _r64 }→{ _stg _r64 (_opn)◂(_p499) }
; emt_ptn_crt_ptn 0',p0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_522
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_523
emt_set_ptn_0_LB_522:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_523:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_524
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_524:
; 	» "AB" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,0x_00_00_00_00_00_00_42_41
	mov QWORD [rdi+8*1+8*0],rbx
	mov rbx,rdi
;pop_reg
	pop QWORD r9
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
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_525
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
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
	jmp emt_set_ptn_1_LB_526
emt_set_ptn_0_LB_525:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_526:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_527
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_527:
; 	» 0xr0 |~ 0' : _r64
	mov QWORD r11,0x0
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 3'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r11,rbx
	bts r12,3
; ; emt_dec_ptn 0'
; unboxed
; 	g0.prs { 2' 3' } ⊢ { 0' 2' 3' } : { _stg _r64 (_opn)◂(_p499) }
; push_s_ex  1'~p0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn { 2' 3' },{ 0' 1' }
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
	jc emt_set_ptn_0_LB_531
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
	jmp emt_set_ptn_1_LB_532
emt_set_ptn_0_LB_531:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_532:
; emt_ptn_set_ptn 3',1'
	mov rbx,r11
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,3
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_536
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_536:
	call NS_E_500
	mov QWORD [tmp],rax
	jc call_c_LB_537
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 2' 3' }
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
	jc emt_set_ptn_0_LB_545
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
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_546
emt_set_ptn_0_LB_545:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_546:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	bts r12,2
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_549
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
	jmp emt_set_ptn_1_LB_550
emt_set_ptn_0_LB_549:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_550:
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
	jmp call_nc_LB_538
call_c_LB_537:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 2' 3' }
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
	jc emt_set_ptn_0_LB_539
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
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_540
emt_set_ptn_0_LB_539:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_540:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	bts r12,2
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_543
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
	jmp emt_set_ptn_1_LB_544
emt_set_ptn_0_LB_543:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_544:
call_nc_LB_538:
; 	_pp_v { 0' 2' 3' } ⊢ { { 0' 2' 3' } 4' } : { { _stg _r64 (_opn)◂(_p499) } _stg }
; push_s_ex  1'~p0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,1
	mov r9,r8
	bt r12,0
	jc LB_551
	and r12,~0b10
LB_551:
; emt_ptn_set_ptn { 1' 2' 3' },0'
	push r12
; emt_get_ptn { 1' 2' 3' }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,3
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push rbx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_552
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_553
emt_get_ptn_0_LB_552:
; unboxed
	stc
emt_get_ptn_1_LB_553:
	mov QWORD r8,r9
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,0
	call exc
;pop_reg
	push rbx
; emt_get_ptn 2'
	mov QWORD r8,r10
	stc
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,1
	call exc
;pop_reg
	push rbx
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_LB_554
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_555
emt_get_ptn_0_LB_554:
; unboxed
	stc
emt_get_ptn_1_LB_555:
	mov QWORD r8,r11
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,2
	call exc
;pop_reg
	mov r8,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b1
; ; emt_dec_ptn { 1' 2' 3' }
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_556
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
emt_dec_ptn_0_LB_556:
; unboxed
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_558
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_558:
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_559
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { { 0' 2' 3' } 4' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn { 0' 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*2],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*2],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*2],0
	jc emt_set_ptn_0_LB_569
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_570
emt_set_ptn_0_LB_569:
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_570:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*2],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*2],r13
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov r10,rbx
	bts r12,2
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*2],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*2],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*2],0
	jc emt_set_ptn_0_LB_573
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_574
emt_set_ptn_0_LB_573:
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_574:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 4'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_575
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov rcx,rbx
	and r12,~0b10000
	jmp emt_set_ptn_1_LB_576
emt_set_ptn_0_LB_575:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov rcx,rbx
	or r12,0b10000
emt_set_ptn_1_LB_576:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_560
call_c_LB_559:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { { 0' 2' 3' } 4' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn { 0' 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*2],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*2],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*2],0
	jc emt_set_ptn_0_LB_561
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_562
emt_set_ptn_0_LB_561:
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_562:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*2],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*2],r13
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov r10,rbx
	bts r12,2
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*2],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*2],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*2],0
	jc emt_set_ptn_0_LB_565
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_566
emt_set_ptn_0_LB_565:
	mov rbx,QWORD [set_ptn_vct+8*1+16*2]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_566:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 4'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_567
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*4],rcx
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov rcx,QWORD [regs_vct+8*4]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov rcx,rbx
	and r12,~0b10000
	jmp emt_set_ptn_1_LB_568
emt_set_ptn_0_LB_567:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov rcx,rbx
	or r12,0b10000
emt_set_ptn_1_LB_568:
call_nc_LB_560:
; emt_get_ptn 4'
	bt r12,4
	jc emt_get_ptn_0_LB_577
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_578
emt_get_ptn_0_LB_577:
; unboxed
	stc
emt_get_ptn_1_LB_578:
	mov QWORD rdx,rcx
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,rdx
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_LB_579
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_579:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_580
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	call exec_out
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
LB_580:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_582
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_583
emt_get_crt_ptn_0_LB_582:
; unboxed
	stc
emt_get_crt_ptn_1_LB_583:
	mov QWORD rcx,r9
	jc ret_LB_584
	push rcx
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_581
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_581:
	pop rcx
	clc
;clear 
	mov rax,rcx
	ret
ret_LB_584:
;clear  2'~x0 3'~a0 0'~s0
	bt r12,2
	jc clear_LB_585
;push_reg
	push QWORD r8
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r8
clear_LB_585:
	bt r12,3
	jc clear_LB_586
;push_reg
	push QWORD r8
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r8
clear_LB_586:
	bt r12,0
	jc clear_LB_587
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_587:
	mov rax,rcx
	stc
	ret
section .data
	NS_E_DYN_495:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_495
	NS_E_DYN_501:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_500:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_500
	CST_DYN_521:
		dq 0x0001_0001_00_82_ffff
		dq 1
