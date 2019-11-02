%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_671
	mov QWORD [CST_DYN_671+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_671],rbx
	call NS_E_680
	mov QWORD [CST_DYN_680+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_680],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_613
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_518:
NS_E_RDI_518:
NS_E_518_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_518_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_518_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_518_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_518_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_535:
NS_E_RDI_535:
NS_E_535_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_535_LB_0
	cmp r11,122
	ja NS_E_535_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_535_LB_0:
	mov rax,0
	ret
NS_E_537:
NS_E_RDI_537:
NS_E_537_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_537_LB_0
	cmp r11,90
	ja NS_E_537_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_537_LB_0:
	mov rax,0
	ret
NS_E_539:
NS_E_RDI_539:
NS_E_539_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_539_LB_0
	cmp r11,57
	ja NS_E_539_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_539_LB_0:
	mov rax,0
	ret
NS_E_541:
NS_E_RDI_541:
NS_E_541_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_541_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_541_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_541_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_541_LB_0:
	mov rax,0
	ret
NS_E_551:
NS_E_RDI_551:
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
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_551_TBL
NS_E_551_ETR_TBL:
	push QWORD 1
NS_E_551_TBL:
	push rsi
	call NS_E_535_ETR_TBL
	cmp rax,0
	jz NS_E_551_MTC_0_failed
NS_E_551_MTC_0_succeed:
	pop r8
	jmp NS_E_551_succeed
NS_E_551_MTC_0_failed:
	pop rsi
	push rsi
	call NS_E_537_ETR_TBL
	cmp rax,0
	jz NS_E_551_MTC_1_failed
NS_E_551_MTC_1_succeed:
	pop r8
	jmp NS_E_551_succeed
NS_E_551_MTC_1_failed:
	pop rsi
	jmp NS_E_551_failed
NS_E_551_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_551_succeed_tbl
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
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_551_succeed_tbl:
	mov rax,1
	ret
NS_E_551_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_551_failed_tbl
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
NS_E_551_failed_tbl:
	mov rax,0
	ret
NS_E_559:
NS_E_RDI_559:
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
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_559_TBL
NS_E_559_ETR_TBL:
	push QWORD 1
NS_E_559_TBL:
	push rsi
	call NS_E_551_ETR_TBL
	cmp rax,0
	jz NS_E_559_MTC_0_failed
_grm_lst_570:
	call NS_E_561_ETR_TBL
	cmp rax,0
	jz _grm_lst_571
	jmp _grm_lst_570
_grm_lst_571:
	mov rax,1
NS_E_559_MTC_0_succeed:
	pop r8
	jmp NS_E_559_succeed
NS_E_559_MTC_0_failed:
	pop rsi
	jmp NS_E_559_failed
NS_E_559_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_559_succeed_tbl
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
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_559_succeed_tbl:
	mov rax,1
	ret
NS_E_559_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_559_failed_tbl
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
NS_E_559_failed_tbl:
	mov rax,0
	ret
NS_E_561:
NS_E_RDI_561:
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
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_561_TBL
NS_E_561_ETR_TBL:
	push QWORD 1
NS_E_561_TBL:
	push rsi
	call NS_E_551_ETR_TBL
	cmp rax,0
	jz NS_E_561_MTC_0_failed
NS_E_561_MTC_0_succeed:
	pop r8
	jmp NS_E_561_succeed
NS_E_561_MTC_0_failed:
	pop rsi
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_561_MTC_0_failed
	add rsi,1
NS_E_561_MTC_1_succeed:
	pop r8
	jmp NS_E_561_succeed
NS_E_561_MTC_1_failed:
	pop rsi
	push rsi
	call NS_E_539_ETR_TBL
	cmp rax,0
	jz NS_E_561_MTC_2_failed
NS_E_561_MTC_2_succeed:
	pop r8
	jmp NS_E_561_succeed
NS_E_561_MTC_2_failed:
	pop rsi
	jmp NS_E_561_failed
NS_E_561_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_561_succeed_tbl
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
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_561_succeed_tbl:
	mov rax,1
	ret
NS_E_561_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_561_failed_tbl
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
NS_E_561_failed_tbl:
	mov rax,0
	ret
NS_E_579:
NS_E_RDI_579:
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
	jmp NS_E_579_TBL
NS_E_579_ETR_TBL:
	push QWORD 1
NS_E_579_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_579_MTC_0_failed
	add rsi,1
	call NS_E_559_ETR_TBL
	cmp rax,0
	jz NS_E_579_MTC_0_failed
NS_E_579_MTC_0_succeed:
	pop r8
	jmp NS_E_579_succeed
NS_E_579_MTC_0_failed:
	pop rsi
	jmp NS_E_579_failed
NS_E_579_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_579_succeed_tbl
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
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_579_succeed_tbl:
	mov rax,1
	ret
NS_E_579_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_579_failed_tbl
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
NS_E_579_failed_tbl:
	mov rax,0
	ret
NS_E_594:
; 	|» {  }
	jz NS_E_RDI_594
	jc emt_etr_c_lb_595
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_594
emt_etr_c_lb_595:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_594:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_596
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_596:
;clear 
	mov rax,r8
	stc
	ret
NS_E_597:
NS_E_RDI_597:
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
	jmp NS_E_597_TBL
NS_E_597_ETR_TBL:
	push QWORD 1
NS_E_597_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,65
	jnz NS_E_597_MTC_0_failed
	add rsi,1
	call NS_E_518_ETR_TBL
	cmp rax,0
	jz NS_E_597_MTC_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,66
	jnz NS_E_597_MTC_0_failed
	add rsi,1
NS_E_597_MTC_0_succeed:
	pop r8
	jmp NS_E_597_succeed
NS_E_597_MTC_0_failed:
	pop rsi
	jmp NS_E_597_failed
NS_E_597_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_597_succeed_tbl
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
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_597_succeed_tbl:
	mov rax,1
	ret
NS_E_597_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_597_failed_tbl
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
NS_E_597_failed_tbl:
	mov rax,0
	ret
NS_E_604:
; 	|» {  }
	jz NS_E_RDI_604
	jc emt_etr_c_lb_605
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_604
emt_etr_c_lb_605:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_604:
; 	» g0.prs _ ⊢ 0' : { _stg _r64 }→{ _stg _r64 _r64 }
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [NS_E_DYN_597],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,NS_E_DYN_597
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,{ _stg _r64 }→{ _stg _r64 _r64 }
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_606
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_607
emt_set_ptn_0_lb_606:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_607:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_608
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_608:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_610
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_611
emt_get_crt_ptn_0_lb_610:
; unboxed
	stc
emt_get_crt_ptn_1_lb_611:
	mov QWORD r8,r9
	jc ret_lb_612
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_609
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_609:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_612:
;clear 
	mov rax,r8
	stc
	ret
NS_E_613:
; 	|» {  }
	jz NS_E_RDI_613
	jc emt_etr_c_lb_614
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_613
emt_etr_c_lb_614:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_613:
; 	g0 {  } ⊢ -2' : { }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_594
	mov QWORD [tmp],rax
	jc call_c_lb_615
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn -2'
; ; emt_dec 
; boxed
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	jmp call_nc_lb_616
call_c_lb_615:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_616:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_618+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_618+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,2
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_619
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_620
emt_set_ptn_0_lb_619:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_620:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_621
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_621:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_622+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_622+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,8
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_623
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_624
emt_set_ptn_0_lb_623:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_624:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_625
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
emt_dec_ptn_0_lb_625:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,26
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
LB_626:
	mov bl,[r15]
	cmp rbx,0
	jz LB_627
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_626
LB_627:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_628:
	mov bl,[r15]
	cmp rbx,0
	jz LB_629
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_628
LB_629:
; 1'
	mov r15,r10
	add r15,8
LB_630:
	mov bl,[r15]
	cmp rbx,0
	jz LB_631
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_630
LB_631:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tmov r0,r1\n"
	mov BYTE [r13+8*1+r14],9
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
; "\tadd r3,r5\n"
	mov BYTE [r13+8*1+r14],9
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
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_632
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_633
emt_get_ptn_0_lb_632:
; unboxed
	stc
emt_get_ptn_1_lb_633:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_634
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
emt_dec_ptn_0_lb_634:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_635
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_635:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_636
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_637
emt_get_ptn_0_lb_636:
; unboxed
	stc
emt_get_ptn_1_lb_637:
	mov QWORD r9,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_638
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_638:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_639
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_639:
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_640
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_641
emt_get_ptn_0_lb_640:
; unboxed
	stc
emt_get_ptn_1_lb_641:
	mov QWORD r9,r8
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_642
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_642:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_643
;push_reg
	call exec_out
;pop_reg
LB_643:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_644
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_644:
;clear 
	mov rax,r8
	stc
	ret
NS_E_645:
; 	|» {  }
	jz NS_E_RDI_645
	jc emt_etr_c_lb_646
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_645
emt_etr_c_lb_646:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_645:
; 	T1.f0 {  } ⊢ {  } : {  }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_613
	mov QWORD [tmp],rax
	jc call_c_lb_647
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn {  }
; ; emt_dec 
; boxed
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	jmp call_nc_lb_648
call_c_lb_647:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_648:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_650
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_650:
;clear 
	mov rax,r8
	stc
	ret
NS_E_651:
; 	|» {  }
	jz NS_E_RDI_651
	jc emt_etr_c_lb_652
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_651
emt_etr_c_lb_652:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_651:
; 	» prm.name.prs _ ⊢ 0' : { _stg _r64 }→{ _stg _r64 _p558 }
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [NS_E_DYN_559],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,NS_E_DYN_559
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p : ,{ _stg _r64 }→{ _stg _r64 _p558 }
; emt_ptn_crt_ptn 0',p
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_653
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_654
emt_set_ptn_0_lb_653:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_654:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_655
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_655:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_657
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_658
emt_get_crt_ptn_0_lb_657:
; unboxed
	stc
emt_get_crt_ptn_1_lb_658:
	mov QWORD r8,r9
	jc ret_lb_659
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_656
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_656:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_659:
;clear 
	mov rax,r8
	stc
	ret
NS_E_660:
; 	|» {  }
	jz NS_E_RDI_660
	jc emt_etr_c_lb_661
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_660
emt_etr_c_lb_661:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_660:
; 	» "FOO" |~ 0' : _stg
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_662+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,5
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_663
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_664
emt_set_ptn_0_lb_663:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_664:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_665
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_665:
; » _^ ..
;push_reg
	push QWORD r9
	mov rbx,0
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
	imul r14,0
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
	mov r14,0
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_667
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_668
emt_get_crt_ptn_0_lb_667:
; unboxed
	stc
emt_get_crt_ptn_1_lb_668:
	mov QWORD r10,r8
	jc ret_lb_669
	push r10
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_666
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_666:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_669:
;clear  1'~s0
	bt r12,1
	jc clear_lb_670
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_670:
	mov rax,r10
	stc
	ret
NS_E_671:
NS_E_RDI_671:
; 	» "HELLOOOO!!\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_672+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_672+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,5
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_673
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_674
emt_set_ptn_0_lb_673:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_674:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_675
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_675:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_677
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_678
emt_get_crt_ptn_0_lb_677:
; unboxed
	stc
emt_get_crt_ptn_1_lb_678:
	mov QWORD r8,r9
	jc ret_lb_679
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_676
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_676:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_679:
;clear 
	mov rax,r8
	stc
	ret
NS_E_680:
NS_E_RDI_680:
; 	» "HOOO BOOO\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_681+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_681+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,6
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_682
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_683
emt_set_ptn_0_lb_682:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_683:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_684
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_684:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_685
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_686
emt_get_ptn_0_lb_685:
; unboxed
	stc
emt_get_ptn_1_lb_686:
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
	jc emt_dec_ptn_0_lb_687
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_687:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_688
;push_reg
	call exec_out
;pop_reg
LB_688:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_689
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_689:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_518:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_518
	NS_E_DYN_535:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_535
	NS_E_DYN_537:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_537
	NS_E_DYN_539:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_539
	NS_E_DYN_541:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_541
	NS_E_DYN_545:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_546:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_548:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_549:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_552:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_553:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_551:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_551
	NS_E_DYN_562:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_559:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_559
	NS_E_DYN_563:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_564:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_565:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_561:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_561
	NS_E_DYN_580:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_579:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_579
	NS_E_DYN_594:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_594
	NS_E_DYN_597:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_597
	NS_E_DYN_604:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_604
	NS_E_DYN_613:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_613
	NS_E_DYN_645:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_645
	NS_E_DYN_651:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_651
	NS_E_DYN_660:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_660
	CST_DYN_671:
		dq 1
		dq 1
	CST_DYN_680:
		dq 1
		dq 1
	cst_stg_681: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_672: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_662: db 70,79,79,0,0,0,0,0
	cst_stg_622: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_618: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_509: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_499: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_489: db 70,79,79,0,0,0,0,0
	cst_stg_449: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_445: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_336: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_326: db 70,79,79,0,0,0,0,0
	cst_stg_286: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_282: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_173: db 70,79,79,0,0,0,0,0
	cst_stg_133: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_129: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
