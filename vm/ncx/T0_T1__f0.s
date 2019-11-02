%include "cmu.s"
main:
	mov r15,0
	mov r14,0
	mov r13,0
	mov r12,0
	not r12
	xor rax,rax
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_483
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_397:
NS_E_RDI_397:
NS_E_397_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_397_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_397_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_397_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_397_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_414:
NS_E_RDI_414:
NS_E_414_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_414_LB_0
	cmp r11,122
	ja NS_E_414_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_414_LB_0:
	mov rax,0
	ret
NS_E_416:
NS_E_RDI_416:
NS_E_416_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_416_LB_0
	cmp r11,90
	ja NS_E_416_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_416_LB_0:
	mov rax,0
	ret
NS_E_418:
NS_E_RDI_418:
NS_E_418_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_418_LB_0
	cmp r11,57
	ja NS_E_418_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_418_LB_0:
	mov rax,0
	ret
NS_E_420:
NS_E_RDI_420:
NS_E_420_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_420_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_420_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_420_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_420_LB_0:
	mov rax,0
	ret
NS_E_430:
NS_E_RDI_430:
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
	jmp NS_E_430_TBL
NS_E_430_ETR_TBL:
	push QWORD 1
NS_E_430_TBL:
	push rsi
	call NS_E_414_ETR_TBL
	cmp rax,0
	jz NS_E_430_MTC_0_failed
NS_E_430_MTC_0_succeed:
	pop r8
	jmp NS_E_430_succeed
NS_E_430_MTC_0_failed:
	pop rsi
	push rsi
	call NS_E_416_ETR_TBL
	cmp rax,0
	jz NS_E_430_MTC_1_failed
NS_E_430_MTC_1_succeed:
	pop r8
	jmp NS_E_430_succeed
NS_E_430_MTC_1_failed:
	pop rsi
	jmp NS_E_430_failed
NS_E_430_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_430_succeed_tbl
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
NS_E_430_succeed_tbl:
	mov rax,1
	ret
NS_E_430_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_430_failed_tbl
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
NS_E_430_failed_tbl:
	mov rax,0
	ret
NS_E_438:
NS_E_RDI_438:
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
	jmp NS_E_438_TBL
NS_E_438_ETR_TBL:
	push QWORD 1
NS_E_438_TBL:
	push rsi
	call NS_E_430_ETR_TBL
	cmp rax,0
	jz NS_E_438_MTC_0_failed
_grm_lst_449:
	call NS_E_440_ETR_TBL
	cmp rax,0
	jz _grm_lst_450
	jmp _grm_lst_449
_grm_lst_450:
	mov rax,1
NS_E_438_MTC_0_succeed:
	pop r8
	jmp NS_E_438_succeed
NS_E_438_MTC_0_failed:
	pop rsi
	jmp NS_E_438_failed
NS_E_438_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_438_succeed_tbl
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
NS_E_438_succeed_tbl:
	mov rax,1
	ret
NS_E_438_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_438_failed_tbl
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
NS_E_438_failed_tbl:
	mov rax,0
	ret
NS_E_440:
NS_E_RDI_440:
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
	jmp NS_E_440_TBL
NS_E_440_ETR_TBL:
	push QWORD 1
NS_E_440_TBL:
	push rsi
	call NS_E_430_ETR_TBL
	cmp rax,0
	jz NS_E_440_MTC_0_failed
NS_E_440_MTC_0_succeed:
	pop r8
	jmp NS_E_440_succeed
NS_E_440_MTC_0_failed:
	pop rsi
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_440_MTC_0_failed
	add rsi,1
NS_E_440_MTC_1_succeed:
	pop r8
	jmp NS_E_440_succeed
NS_E_440_MTC_1_failed:
	pop rsi
	push rsi
	call NS_E_418_ETR_TBL
	cmp rax,0
	jz NS_E_440_MTC_2_failed
NS_E_440_MTC_2_succeed:
	pop r8
	jmp NS_E_440_succeed
NS_E_440_MTC_2_failed:
	pop rsi
	jmp NS_E_440_failed
NS_E_440_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_440_succeed_tbl
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
NS_E_440_succeed_tbl:
	mov rax,1
	ret
NS_E_440_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_440_failed_tbl
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
NS_E_440_failed_tbl:
	mov rax,0
	ret
NS_E_458:
NS_E_RDI_458:
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
	jmp NS_E_458_TBL
NS_E_458_ETR_TBL:
	push QWORD 1
NS_E_458_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_458_MTC_0_failed
	add rsi,1
	call NS_E_438_ETR_TBL
	cmp rax,0
	jz NS_E_458_MTC_0_failed
NS_E_458_MTC_0_succeed:
	pop r8
	jmp NS_E_458_succeed
NS_E_458_MTC_0_failed:
	pop rsi
	jmp NS_E_458_failed
NS_E_458_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_458_succeed_tbl
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
NS_E_458_succeed_tbl:
	mov rax,1
	ret
NS_E_458_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_458_failed_tbl
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
NS_E_458_failed_tbl:
	mov rax,0
	ret
NS_E_473:
; 	|» {  }
	jz NS_E_RDI_473
	jc emt_etr_c_lb_474
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
jmp NS_E_RDI_473
emt_etr_c_lb_474:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_473:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_475
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_475:
;clear 
	mov rax,r8
	stc
	ret
NS_E_476:
NS_E_RDI_476:
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
	jmp NS_E_476_TBL
NS_E_476_ETR_TBL:
	push QWORD 1
NS_E_476_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,65
	jnz NS_E_476_MTC_0_failed
	add rsi,1
	call NS_E_397_ETR_TBL
	cmp rax,0
	jz NS_E_476_MTC_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,66
	jnz NS_E_476_MTC_0_failed
	add rsi,1
NS_E_476_MTC_0_succeed:
	pop r8
	jmp NS_E_476_succeed
NS_E_476_MTC_0_failed:
	pop rsi
	jmp NS_E_476_failed
NS_E_476_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_476_succeed_tbl
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
NS_E_476_succeed_tbl:
	mov rax,1
	ret
NS_E_476_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_476_failed_tbl
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
NS_E_476_failed_tbl:
	mov rax,0
	ret
NS_E_483:
; 	|» {  }
	jz NS_E_RDI_483
	jc emt_etr_c_lb_484
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
jmp NS_E_RDI_483
emt_etr_c_lb_484:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_483:
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
	call NS_E_473
	mov QWORD [tmp],rax
	jc call_c_lb_485
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
	jmp call_nc_lb_486
call_c_lb_485:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_486:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_488+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_488+8*0]
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
	jc emt_set_ptn_0_lb_489
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_490
emt_set_ptn_0_lb_489:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_490:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_491
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_491:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_492+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_492+8*0]
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
	jc emt_set_ptn_0_lb_493
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_494
emt_set_ptn_0_lb_493:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_494:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_495
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
emt_dec_ptn_0_lb_495:
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
LB_496:
	mov bl,[r15]
	cmp rbx,0
	jz LB_497
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_496
LB_497:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_498:
	mov bl,[r15]
	cmp rbx,0
	jz LB_499
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_498
LB_499:
; 1'
	mov r15,r10
	add r15,8
LB_500:
	mov bl,[r15]
	cmp rbx,0
	jz LB_501
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_500
LB_501:
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
	jc emt_get_ptn_0_lb_502
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_503
emt_get_ptn_0_lb_502:
; unboxed
	stc
emt_get_ptn_1_lb_503:
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
	jc emt_dec_ptn_0_lb_504
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
emt_dec_ptn_0_lb_504:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_505
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_505:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_506
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_507
emt_get_ptn_0_lb_506:
; unboxed
	stc
emt_get_ptn_1_lb_507:
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
	jc emt_dec_ptn_0_lb_508
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_508:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_509
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_509:
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_510
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_511
emt_get_ptn_0_lb_510:
; unboxed
	stc
emt_get_ptn_1_lb_511:
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
	jc emt_dec_ptn_0_lb_512
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_512:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_513
;push_reg
	call exec_out
;pop_reg
LB_513:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_514
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_514:
;clear 
	mov rax,r8
	stc
	ret
NS_E_515:
; 	|» {  }
	jz NS_E_RDI_515
	jc emt_etr_c_lb_516
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
jmp NS_E_RDI_515
emt_etr_c_lb_516:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_515:
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
	call NS_E_483
	mov QWORD [tmp],rax
	jc call_c_lb_517
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
	jmp call_nc_lb_518
call_c_lb_517:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_518:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_520
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_520:
;clear 
	mov rax,r8
	stc
	ret
NS_E_521:
; 	|» {  }
	jz NS_E_RDI_521
	jc emt_etr_c_lb_522
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
jmp NS_E_RDI_521
emt_etr_c_lb_522:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_521:
; 	» prm.name.prs _ ⊢ 0' : { _stg _r64 }→{ _stg _r64 _p437 }
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [NS_E_DYN_438],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,NS_E_DYN_438
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p : ,{ _stg _r64 }→{ _stg _r64 _p437 }
; emt_ptn_crt_ptn 0',p
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_523
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_524
emt_set_ptn_0_lb_523:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_524:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_525
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_525:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_527
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_528
emt_get_crt_ptn_0_lb_527:
; unboxed
	stc
emt_get_crt_ptn_1_lb_528:
	mov QWORD r8,r9
	jc ret_lb_529
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_526
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_526:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_529:
;clear 
	mov rax,r8
	stc
	ret
NS_E_530:
; 	|» {  }
	jz NS_E_RDI_530
	jc emt_etr_c_lb_531
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
jmp NS_E_RDI_530
emt_etr_c_lb_531:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_530:
; 	» "FOO" |~ 0' : _stg
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_532+8*0]
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
	jc emt_set_ptn_0_lb_533
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_534
emt_set_ptn_0_lb_533:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_534:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_535
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_535:
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
	jc emt_get_crt_ptn_0_lb_537
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_538
emt_get_crt_ptn_0_lb_537:
; unboxed
	stc
emt_get_crt_ptn_1_lb_538:
	mov QWORD r10,r8
	jc ret_lb_539
	push r10
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_536
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_536:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_539:
;clear  1'~s0
	bt r12,1
	jc clear_lb_540
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_540:
	mov rax,r10
	stc
	ret
section .data
	NS_E_DYN_397:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_397
	NS_E_DYN_414:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_414
	NS_E_DYN_416:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_416
	NS_E_DYN_418:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_418
	NS_E_DYN_420:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_420
	NS_E_DYN_424:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_425:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_427:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_428:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_431:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_432:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_430:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_430
	NS_E_DYN_441:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_438:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_438
	NS_E_DYN_442:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_443:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_444:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_440:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_440
	NS_E_DYN_459:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_458:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_458
	NS_E_DYN_473:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_473
	NS_E_DYN_476:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_476
	NS_E_DYN_483:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_483
	NS_E_DYN_515:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_515
	NS_E_DYN_521:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_521
	NS_E_DYN_530:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_530
	cst_stg_532: db 70,79,79,0,0,0,0,0
	cst_stg_492: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_488: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_388: db 70,79,79,0,0,0,0,0
	cst_stg_348: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_344: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_244: db 70,79,79,0,0,0,0,0
	cst_stg_204: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_200: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
