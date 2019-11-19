%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_547
	mov QWORD [CST_DYN_547+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_547],rbx
	call NS_E_610
	mov QWORD [CST_DYN_610+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_610],rbx
	call NS_E_667
	mov QWORD [CST_DYN_667+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_667],rbx
	call NS_E_719
	mov QWORD [CST_DYN_719+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_719],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call exec_out
	jmp _end
NS_E_543:
NS_E_RDI_543:
NS_E_543_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_543_LB_0
	bt r11,7
	jc LB_544
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
LB_544:
	add rsi,1
	bt r11,6
	jc LB_545
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
LB_545:
	add rsi,1
	bt r11,5
	jc LB_546
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
LB_546:
	add rsi,1
	bt r11,5
	jc LB_546
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
NS_E_543_LB_0:
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
NS_E_547:
NS_E_RDI_547:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn 0'
; unboxed
; 	» "ABCDfokfkfkf\t" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`ABCDfokf`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],107
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],107
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],9
	add rsi,1
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
	jc emt_set_ptn_0_LB_551
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
	jmp emt_set_ptn_1_LB_552
emt_set_ptn_0_LB_551:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_552:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_553
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
emt_dec_ptn_0_LB_553:
; 	_pp_v 1' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex  2'~s0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_554
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_555
emt_set_ptn_0_LB_554:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_555:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_557
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_565
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_566
emt_set_ptn_0_LB_565:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_566:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_558
call_c_LB_557:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_561
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_562
emt_set_ptn_0_LB_561:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_562:
call_nc_LB_558:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_567
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_568
emt_get_ptn_0_LB_567:
; unboxed
	stc
emt_get_ptn_1_LB_568:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_569
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_569:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_570
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_570:
; 	» "\nHOO\n" |~ 1' : _stg
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,5
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov BYTE [rdi+8*1+rsi],72
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r8
	mov r9,rbx
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 1',s1
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_571
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
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_572
emt_set_ptn_0_LB_571:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_572:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_573
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
emt_dec_ptn_0_LB_573:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_LB_574
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_575
emt_get_ptn_0_LB_574:
; unboxed
	stc
emt_get_ptn_1_LB_575:
	mov QWORD r9,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_576
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_576:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_577
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_577:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
	clc
	jc ret_LB_578
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_578:
;clear  2'~s0 0'~x0
	bt r12,2
	jc clear_LB_579
;push_reg
	push QWORD r8
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r8
clear_LB_579:
	bt r12,0
	jc clear_LB_580
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_580:
	mov rax,r9
	stc
	ret
NS_E_581:
; 	|» {  }
	jz NS_E_RDI_581
	jc emt_etr_c_LB_582
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
jmp NS_E_RDI_581
emt_etr_c_LB_582:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_581:
; 	» "xyz" |~ 0' : _stg
;push_reg
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],121
	add rsi,1
	mov BYTE [rdi+8*1+rsi],122
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
	jc emt_set_ptn_0_LB_583
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_584
emt_set_ptn_0_LB_583:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_584:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_585
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_585:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_587
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_588
emt_get_crt_ptn_0_LB_587:
; unboxed
	stc
emt_get_crt_ptn_1_LB_588:
	mov QWORD r8,r9
	jc ret_LB_589
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_586
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_586:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_589:
;clear 
	mov rax,r8
	stc
	ret
NS_E_590:
; 	|» {  }
	jz NS_E_RDI_590
	jc emt_etr_c_LB_591
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
jmp NS_E_RDI_590
emt_etr_c_LB_591:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_590:
; 	f0 {  } ⊢ -2' : _stg
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_581
	mov QWORD [tmp],rax
	jc call_c_LB_592
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
; _
	pop rdi
	call dec_r
	jmp call_nc_LB_593
call_c_LB_592:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; _
call_nc_LB_593:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,14
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Hello Wo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],114
	add rsi,1
	mov BYTE [rdi+8*1+rsi],108
	add rsi,1
	mov BYTE [rdi+8*1+rsi],100
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
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
	jc emt_set_ptn_0_LB_594
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_595
emt_set_ptn_0_LB_594:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_595:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_596
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_596:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Foo Baoo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 0',s1
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_597
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
	jmp emt_set_ptn_1_LB_598
emt_set_ptn_0_LB_597:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_598:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_599
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
emt_dec_ptn_0_LB_599:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,27
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,r10
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,2
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	mov r14,0
; "Ab"
	mov BYTE [r13+8*1+r14],65
	add r14,1
	mov BYTE [r13+8*1+r14],98
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_600:
	mov bl,[r15]
	cmp rbx,0
	jz LB_601
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_600
LB_601:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_602:
	mov bl,[r15]
	cmp rbx,0
	jz LB_603
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_602
LB_603:
; 1'
	mov r15,r10
	add r15,8
LB_604:
	mov bl,[r15]
	cmp rbx,0
	jz LB_605
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_604
LB_605:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; " mov r0,r1\n"
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],111
	add r14,1
	mov BYTE [r13+8*1+r14],118
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],49
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; " add r3,r5 \n"
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],97
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],51
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],53
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
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
	jc ret_LB_606
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_LB_606:
;clear  2'~s1 0'~sr 1'~s0
	bt r12,2
	jc clear_LB_607
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_LB_607:
	bt r12,0
	jc clear_LB_608
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_608:
	bt r12,1
	jc clear_LB_609
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_609:
	mov rax,r11
	stc
	ret
NS_E_610:
NS_E_RDI_610:
; 	» 0xrf |~ 0' : _r64
	mov QWORD r9,0xf
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn 0'
; unboxed
; 	? 1'
; 	∐\ x0 ,,x0=0xr0
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_614
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_615
LB_614:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_615:
; x0=0xr0
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0x0
	cmp r14,rbx
	jnz LB_616
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_617
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_617:
; 	» "A\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],65
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
	jc emt_set_ptn_0_LB_618
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_619
emt_set_ptn_0_LB_618:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_619:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_620
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_620:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_621
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_622
emt_get_ptn_0_LB_621:
; unboxed
	stc
emt_get_ptn_1_LB_622:
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
	jc emt_dec_ptn_0_LB_623
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_623:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_624
;push_reg
	call exec_out
;pop_reg
LB_624:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_625
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_625:
;clear 
	mov rax,r8
	stc
	ret
LB_616:
; 	∐\ x0 ,,x0=0xr1
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_626
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_627
LB_626:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_627:
; x0=0xr1
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0x1
	cmp r14,rbx
	jnz LB_628
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_629
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_629:
; 	» "B\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],66
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
	jc emt_set_ptn_0_LB_630
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_631
emt_set_ptn_0_LB_630:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_631:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_632
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_632:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_633
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_634
emt_get_ptn_0_LB_633:
; unboxed
	stc
emt_get_ptn_1_LB_634:
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
	jc emt_dec_ptn_0_LB_635
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_635:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_636
;push_reg
	call exec_out
;pop_reg
LB_636:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_637
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_637:
;clear 
	mov rax,r8
	stc
	ret
LB_628:
; 	∐\ x0 ,
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_638
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_639
LB_638:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_639:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r8,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_641
	btr r12,0
	bt r13,0
	jnc LB_643
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
LB_643:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_642
LB_641:
	bts r12,0
LB_642:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_644
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_644:
	mov r8,QWORD [regs_vct+8*0]
; 	_pp_v 0' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_645
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_646
emt_set_ptn_0_LB_645:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_646:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_648
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
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_656
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_657
emt_set_ptn_0_LB_656:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_657:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_649
call_c_LB_648:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_652
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_653
emt_set_ptn_0_LB_652:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_653:
call_nc_LB_649:
; » _^ ..
;push_reg
	push QWORD r8
	push QWORD r9
	mov rbx,6
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	mov r14,0
; "x0 = "
	mov BYTE [r13+8*1+r14],120
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],61
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_658:
	mov bl,[r15]
	cmp rbx,0
	jz LB_659
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_658
LB_659:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r10,r13
	btr r12,2
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_660
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_661
emt_get_ptn_0_LB_660:
; unboxed
	stc
emt_get_ptn_1_LB_661:
	mov QWORD r11,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_662
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_662:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_663
;push_reg
	push QWORD r8
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
	pop QWORD r8
LB_663:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,0
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_LB_664
	push r10
; ; emt_dec_ptn {  }
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_LB_664:
;clear  0'~x0 1'~s0
	bt r12,0
	jc clear_LB_665
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_665:
	bt r12,1
	jc clear_LB_666
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_666:
	mov rax,r10
	stc
	ret
LB_640:
	jmp err
NS_E_667:
NS_E_RDI_667:
; 	» "ABCDefgefefef" |~ 0' : _stg
;push_reg
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`ABCDefge`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],101
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],101
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
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
	jc emt_set_ptn_0_LB_668
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_669
emt_set_ptn_0_LB_668:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_669:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_670
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_670:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r10,0xff
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
; 	? { 2' 1' }
; 	∐\ { x0 s0 } ,,s0="ABCDefgefefef",x0=0xrf9
; ; emt_mtc_set

; emt_mtc_set
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_674
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_675
LB_674:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_675:
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_676
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*1],rbx
	mov QWORD [mtc_vct_0+16*1],0
	jmp LB_677
LB_676:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*1],rbx
	mov QWORD [mtc_vct_0+16*1],1
LB_677:
; s0="ABCDefgefefef"
	mov r14,QWORD [mtc_vct_0+8*1+16*1]
	mov rbx,[r14]
	shr rbx,32
	and rbx,0xffff
	cmp rbx,2
	jnz LB_678
	mov rbx,`ABCDefge`
	mov QWORD r13,[r14+8*1]
	cmp rbx,r13
	jnz LB_678
	mov rbx,`fefef`
	mov QWORD r13,[r14+8*2]
	cmp rbx,r13
	jnz LB_678
; x0=0xrf9
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0xf9
	cmp r14,rbx
	jnz LB_678
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_679
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_679:
	bt r12,2
	jc LB_680
	mov rdi,QWORD [regs_vct+8*2]
	call dec_r
LB_680:
; 	» "X\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],88
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,sr : ,_stg
; emt_ptn_crt_ptn 0',sr
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_681
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_682
emt_set_ptn_0_LB_681:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_682:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_683
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_683:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_684
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_685
emt_get_ptn_0_LB_684:
; unboxed
	stc
emt_get_ptn_1_LB_685:
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
	jc emt_dec_ptn_0_LB_686
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_686:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_687
;push_reg
	call exec_out
;pop_reg
LB_687:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_688
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_688:
;clear 
	mov rax,r8
	stc
	ret
LB_678:
; 	∐\ p0 ,
; ; emt_mtc_set

; emt_get_crt_ptn { 2' 1' }
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 2'
	mov QWORD r11,r10
	stc
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_690
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_691
emt_get_crt_ptn_0_LB_690:
; unboxed
	stc
emt_get_crt_ptn_1_LB_691:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	clc
	and r12,~0b1
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_692
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_692:
	bt r12,2
	jc LB_693
	mov rdi,QWORD [regs_vct+8*2]
	call dec_r
LB_693:
	mov r8,QWORD [regs_vct+8*0]
; 	_pp_v 0' ⊢ { 0' 1' } : { { _r64 _stg } _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r9,r8
	btr r12,1
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_694
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_695
emt_set_ptn_0_LB_694:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_695:
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_697
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
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; boxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_705
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_706
emt_set_ptn_0_LB_705:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_706:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_698
call_c_LB_697:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; boxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_701
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_702
emt_set_ptn_0_LB_701:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_702:
call_nc_LB_698:
; » _^ ..
;push_reg
	push QWORD r8
	push QWORD r9
	mov rbx,4
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	mov r14,0
; "p0="
	mov BYTE [r13+8*1+r14],112
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],61
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_707:
	mov bl,[r15]
	cmp rbx,0
	jz LB_708
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_707
LB_708:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r10,r13
	btr r12,2
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_709
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_710
emt_get_ptn_0_LB_709:
; unboxed
	stc
emt_get_ptn_1_LB_710:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_711
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_711:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_712
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_712:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_713
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_714
emt_get_ptn_0_LB_713:
; unboxed
	stc
emt_get_ptn_1_LB_714:
	mov QWORD r9,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_715
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_715:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_716
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_716:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	jc ret_LB_717
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_717:
;clear  0'~p0
	bt r12,0
	jc clear_LB_718
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_718:
	mov rax,r9
	stc
	ret
LB_689:
	jmp err
NS_E_719:
NS_E_RDI_719:
	btr r12,0
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	lea QWORD rbx,[unt]
	mov r8,rbx
	mov rbx,0x0100_0000_0000_0001
	add r8,rbx
	btr r12,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	lea QWORD rbx,[unt]
	mov r9,rbx
	mov rbx,0x0100_0000_0000_0001
	add r9,rbx
	btr r12,1
	mov rbx,r9
	bt r12,1
	jc LB_720
	bt rbx,0
	jc LB_721
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r9,rbx
	jmp LB_722
LB_720:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
	jmp LB_722
LB_721:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
LB_722:
	btr r12,1
	mov rbx,r9
	bt r12,1
	jc LB_723
	bt rbx,0
	jc LB_724
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r9,rbx
	jmp LB_725
LB_723:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
	jmp LB_725
LB_724:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
LB_725:
; 	_pp_v 1' ⊢ { 1' 2' } : { (_opn)◂((_opn)◂((_opn)◂(t354'(0)))) _stg }
; push_s_ex  0'~o0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_726
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_727
emt_set_ptn_0_LB_726:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_727:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_728
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_728:
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_729
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_735
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_736
emt_set_ptn_0_LB_735:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_736:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_737
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
	jmp emt_set_ptn_1_LB_738
emt_set_ptn_0_LB_737:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_738:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_730
call_c_LB_729:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_731
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_732
emt_set_ptn_0_LB_731:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_732:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_733
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
	jmp emt_set_ptn_1_LB_734
emt_set_ptn_0_LB_733:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_734:
call_nc_LB_730:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_739
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_740
emt_get_ptn_0_LB_739:
; unboxed
	stc
emt_get_ptn_1_LB_740:
	mov QWORD r11,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_741
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_741:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_742
;push_reg
	push QWORD r8
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
	pop QWORD r8
LB_742:
; 	? 0'
; 	∐\ o0 ,,o0=_none◂{  }
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_743
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_744
LB_743:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_744:
; o0=_none◂{  }
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,1
	jnz LB_745
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
	bt QWORD [r13],16
	jc LB_746
	bt QWORD [r13],17
	jnc LB_746
	mov r13,QWORD [r13+8*1]
LB_746:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
; ; 	? 0'

	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_747
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_747:
	mov r9,QWORD [regs_vct+8*1]
; 	» "t\n" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],116
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
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
	jc emt_set_ptn_0_LB_748
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
	jmp emt_set_ptn_1_LB_749
emt_set_ptn_0_LB_748:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_749:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_750
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
emt_dec_ptn_0_LB_750:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_751
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_752
emt_get_ptn_0_LB_751:
; unboxed
	stc
emt_get_ptn_1_LB_752:
	mov QWORD r8,r10
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
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_753
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_LB_753:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_754
;push_reg
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
LB_754:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_755
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_755:
;clear  1'~o1
	bt r12,1
	jc clear_LB_756
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_756:
	mov rax,r8
	stc
	ret
LB_745:
; 	∐\ o0 ,
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_757
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_758
LB_757:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_758:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r10,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_760
	btr r12,2
	bt r13,0
	jnc LB_762
	mov r14,0x00ff_ffff_ffff_fffe
	and r13,r14
LB_762:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_761
LB_760:
	bts r12,2
LB_761:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_763
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_763:
	mov r10,QWORD [regs_vct+8*2]
	mov r9,QWORD [regs_vct+8*1]
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	clc
	jc ret_LB_764
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_764:
;clear  2'~o0 1'~o1
	bt r12,2
	jc clear_LB_765
;push_reg
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_765:
	bt r12,1
	jc clear_LB_766
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_766:
	mov rax,r8
	stc
	ret
LB_759:
	jmp err
section .data
	NS_E_DYN_543:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_543
	CST_DYN_547:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_581:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_581
	NS_E_DYN_590:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_590
	CST_DYN_610:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_667:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_719:
		dq 0x0001_0001_00_82_ffff
		dq 1
