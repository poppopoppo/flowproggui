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
	call test5
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test8:
; 	|» {  }
	jz _test8
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test8
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test8:
; 	» 0xr14 |~ 0' : r64
	mov r9,0x14
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_624
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_624:
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_627
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_627:
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_630
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_630:
; 	tak_i { 1' 2' 3' } ⊢| 

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	bts r14,0
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r10
	bts r14,1
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	bts r14,2
; ; emt_dec_ptn { 1' 2' 3' }
	bt r12,3
	jc lb_631
	mov rdi,r11
	call dec_r
lb_631:
	bt r12,2
	jc lb_632
	mov rdi,r10
	call dec_r
lb_632:
	bt r12,1
	jc lb_633
	mov rdi,r9
	call dec_r
lb_633:
;clear 
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	jmp _tak_i
test5:
; 	|» {  }
	jz _test5
	jc emt_etr_c_lb_1
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test5
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test5:
; 	» 0xr14 |~ 0' : r64
	mov r9,0x14
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_564
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_564:
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_567
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_567:
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_570
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_570:
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	bts r14,0
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r10
	bts r14,1
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	bts r14,2
; ; emt_dec_ptn { 1' 2' 3' }
	bt r12,3
	jc lb_571
	mov rdi,r11
	call dec_r
lb_571:
	bt r12,2
	jc lb_572
	mov rdi,r10
	call dec_r
lb_572:
	bt r12,1
	jc lb_573
	mov rdi,r9
	call dec_r
lb_573:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_580
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_581
lb_580:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_581:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr5 |~ 1' : r64
	mov r10,0x5
	mov r9,r10
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	bts r12,2
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_588
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_588:
; 	fact 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_589
	push r8
	mov rdi,r10
	call dec_r
	pop r8
lb_589:
; push_s  0'~r
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_592
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_593
lb_592:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
lb_593:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr5 |~ 2' : r64
	mov r11,0x5
	mov r10,r11
	bts r12,2
; 	$ 2' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	bts r12,3
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_600
	push r8
	push r9
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r9
	pop r8
lb_600:
; 	fib 3' ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 3',0'
	bt r12,3
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r11
	bts r14,0
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_601
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_601:
; push_s  0'~r 1'~y
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_604
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_605
lb_604:
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
lb_605:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr6 |~ 3' : r64
	mov rcx,0x6
	mov r11,rcx
	bts r12,3
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	bts r12,4
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_612
	push r8
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
lb_612:
; 	fib 4' ⊢ 3' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 4',0'
	bt r12,4
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],rcx
	bts r14,0
; ; emt_dec_ptn 4'
	bt r12,4
	jc lb_613
	push r8
	push r9
	push r10
	mov rdi,rcx
	call dec_r
	pop r10
	pop r9
	pop r8
lb_613:
; push_s  2'~y0 0'~r 1'~y
	mov [tmp],rbx
	mov rbx,r10
	push rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_616
; emt_set_ptn 3'
; unboxed
	mov r11,rbx
	bts r12,3
	pop rbx
	push r8
	push r9
	push r10
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
	jmp lb_617
lb_616:
; emt_set_ptn 3'
; unboxed
	mov r11,rbx
	bts r12,3
	pop rbx
lb_617:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	pop rbx
	mov r10,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ { 0' 1' 2' 3' }
;clear 
	push rbx
; emt_get_ptn { 0' 1' 2' 3' }
	push r8
	push r9
	push r10
	push r11
	mov rdi,4
	call mlc
	mov rbx,rax
	pop r11
	pop r10
	pop r9
	pop r8
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,0
	call exc
	pop rbx
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,1
	call exc
	pop rbx
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,2
	call exc
	pop rbx
	push rbx
; emt_get_ptn 3'
	mov rbx,r11
	bt r12,3
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,3
	call exc
	pop rbx
	clc
	mov rax,rbx
	pop rbx
	ret
test7:
; 	|» {  }
	jz _test7
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test7
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test7:
; 	» 0xr12 |~ 0' : r64
	mov r9,0x12
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_540
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_540:
; 	» 0xrc |~ 0' : r64
	mov r10,0xc
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_543
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_543:
; 	» 0xr6 |~ 0' : r64
	mov r11,0x6
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_546
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_546:
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	bts r14,0
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r10
	bts r14,1
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	bts r14,2
; ; emt_dec_ptn { 1' 2' 3' }
	bt r12,3
	jc lb_547
	mov rdi,r11
	call dec_r
lb_547:
	bt r12,2
	jc lb_548
	mov rdi,r10
	call dec_r
lb_548:
	bt r12,1
	jc lb_549
	mov rdi,r9
	call dec_r
lb_549:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_556
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_557
lb_556:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_557:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rax,rbx
	pop rbx
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_3
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test4
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test4:
; 	» 0xr5 |~ 0' : r64
	mov r9,0x5
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_528
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_528:
; 	fact 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	bts r14,0
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_529
	mov rdi,r9
	call dec_r
lb_529:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_532
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_533
lb_532:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_533:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rax,rbx
	pop rbx
	ret
test6:
; 	|» {  }
	jz _test6
	jc emt_etr_c_lb_4
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test6
emt_etr_c_lb_4:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test6:
; 	» 0xr5 |~ 0' : r64
	mov r9,0x5
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_504
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_504:
; 	fib 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	bts r14,0
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_505
	mov rdi,r9
	call dec_r
lb_505:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_508
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_509
lb_508:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_509:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr6 |~ 1' : r64
	mov r10,0x6
	mov r9,r10
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	bts r12,2
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_516
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_516:
; 	fib 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_517
	push r8
	mov rdi,r10
	call dec_r
	pop r8
lb_517:
; push_s  0'~y0
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_520
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_521
lb_520:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
lb_521:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ { 0' 1' }
;clear 
	push rbx
; emt_get_ptn { 0' 1' }
	push r8
	push r9
	mov rdi,2
	call mlc
	mov rbx,rax
	pop r9
	pop r8
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,0
	call exc
	pop rbx
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,1
	call exc
	pop rbx
	clc
	mov rax,rbx
	pop rbx
	ret
fib:
; 	|» 0'
	jz _fib
	jc emt_etr_c_lb_5
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	pop rbx
jmp _fib
emt_etr_c_lb_5:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
_fib:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_399
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_399:
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_402
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_402:
; 	cmp { 2' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 0' 4' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unknown
	mov r8,r10
	jc lb_404
	btr r12,0
	call inc_r
	jmp lb_405
lb_404:
	bts r12,0
lb_405:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unknown
	mov rcx,r11
	jc lb_406
	btr r12,4
	call inc_r
	jmp lb_407
lb_406:
	bts r12,4
lb_407:
; ; emt_dec_ptn { 2' 3' }
	bt r12,3
	jc lb_410
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_410:
	bt r12,2
	jc lb_411
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_411:
	cmp r8,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r8,1
	jle lb_403
	mov r11,r8
lb_403:
	or r12,0b100
	or r12,0b1000
; emt_ptn_set_ptn { 2' 3' },{ 0' -2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov r8,r10
	bts r12,0
; emt_ptn_set_ptn 3',-2'
	bt r12,3
; emt_set_ptn -2'
; 	∠ 0'
	push r14
; emt_get_ptn 0'
	mov r14,r8
	bt r12,0
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_413
	mov rbx,0
	stc
	jmp agl_412_1
lb_413:
	mov rbx,1
	stc
	jmp agl_412_0
; 	∐ -2'
agl_412_0:
	jc lb_414
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r9
	call dec_r
	pop r9
	jmp lb_415
lb_414:
; emt_set_ptn -2'
lb_415:
	pop rbx
	pop r14
; 	$ 1' ⊢ ,0',2' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	bts r12,0
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	bts r12,2
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_420
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_420:
; 	» 0xr1 |~ 1' : r64
	mov r11,0x1
	mov r9,r11
	bts r12,1
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	bt r12,1
; emt_set_ptn 3'
; unboxed
	mov r11,r9
	bts r12,3
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_423
	push r8
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
	pop r8
lb_423:
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 1' 4' }
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
; unknown
	mov r9,r10
	jc lb_425
	btr r12,1
	call inc_r
	jmp lb_426
lb_425:
	bts r12,1
lb_426:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unknown
	mov rcx,r11
	jc lb_427
	btr r12,4
	call inc_r
	jmp lb_428
lb_427:
	bts r12,4
lb_428:
; ; emt_dec_ptn { 2' 3' }
	bt r12,3
	jc lb_431
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_431:
	bt r12,2
	jc lb_432
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_432:
	cmp r9,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r9,1
	jle lb_424
	mov r11,r9
lb_424:
	or r12,0b100
	or r12,0b1000
; emt_ptn_set_ptn { 2' 3' },{ 1' -2' }
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
; unboxed
	mov r9,r10
	bts r12,1
; emt_ptn_set_ptn 3',-2'
	bt r12,3
; emt_set_ptn -2'
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_434
	mov rbx,0
	stc
	jmp agl_433_1
lb_434:
	mov rbx,1
	stc
	jmp agl_433_0
; 	∐ -2'
agl_433_0:
	jc lb_435
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	call dec_r
	pop r8
	jmp lb_436
lb_435:
; emt_set_ptn -2'
lb_436:
	pop rbx
	pop r14
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_441
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_441:
; 	» 0xr1 |~ 0' : r64
	mov r11,0x1
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_444
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_444:
; 	» 0xr2 |~ 0' : r64
	mov rcx,0x2
	mov r8,rcx
	bts r12,0
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	bts r12,4
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_447
	push r9
	push r10
	push r11
	push rcx
	mov rdi,r8
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_447:
; 	sub { 1' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
; unknown
	mov rdx,r9
	jc lb_448
	btr r12,5
	call inc_r
	jmp lb_449
lb_448:
	bts r12,5
lb_449:
; emt_ptn_set_ptn 3',6'
	bt r12,3
; emt_set_ptn 6'
; unknown
	mov rsi,r11
	jc lb_450
	btr r12,6
	call inc_r
	jmp lb_451
lb_450:
	bts r12,6
lb_451:
; ; emt_dec_ptn { 1' 3' }
	bt r12,3
	jc lb_454
	push r8
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_454:
	bt r12,1
	jc lb_455
	push r8
	push r10
	push rcx
	mov rdi,r9
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_455:
	sub rdx,rsi
	stc
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
	bts r12,0
; 	sub { 2' 4' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 4' },{ 3' 5' }
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
; unknown
	mov r11,r10
	jc lb_456
	btr r12,3
	call inc_r
	jmp lb_457
lb_456:
	bts r12,3
lb_457:
; emt_ptn_set_ptn 4',5'
	bt r12,4
; emt_set_ptn 5'
; unknown
	mov rdx,rcx
	jc lb_458
	btr r12,5
	call inc_r
	jmp lb_459
lb_458:
	bts r12,5
lb_459:
; ; emt_dec_ptn { 2' 4' }
	bt r12,4
	jc lb_462
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_462:
	bt r12,2
	jc lb_463
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_463:
	sub r11,rdx
	stc
; emt_set_ptn 1'
; unboxed
	mov r9,r11
	bts r12,1
; 	fib 0' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 0',0'
	bt r12,0
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r8
	bts r14,0
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_464
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_464:
; push_s  1'~xt1
	mov [tmp],rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_467
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_468
lb_467:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_468:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	fib 1' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	bts r14,0
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_473
	push r8
	mov rdi,r9
	call dec_r
	pop r8
lb_473:
; push_s  0'~y0
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_476
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_477
lb_476:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
lb_477:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	add { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 3' 4' }
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unknown
	mov r11,r8
	jc lb_482
	btr r12,3
	call inc_r
	jmp lb_483
lb_482:
	bts r12,3
lb_483:
; emt_ptn_set_ptn 1',4'
	bt r12,1
; emt_set_ptn 4'
; unknown
	mov rcx,r9
	jc lb_484
	btr r12,4
	call inc_r
	jmp lb_485
lb_484:
	bts r12,4
lb_485:
; ; emt_dec_ptn { 0' 1' }
	bt r12,1
	jc lb_488
	push r10
	mov rdi,r9
	call dec_r
	pop r10
lb_488:
	bt r12,0
	jc lb_489
	push r10
	mov rdi,r8
	call dec_r
	pop r10
lb_489:
	push rbx
	push r14
	mov rbx,r11
	mov r14,rcx
	add rbx,r14
	stc
	pop r14
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
; 	∎ 2'
;clear 
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_433_1:
	jc lb_490
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	call dec_r
	pop r8
	jmp lb_491
lb_490:
; emt_set_ptn -2'
lb_491:
	pop rbx
	pop r14
; 	» 0xr1 |~ 1' : r64
	mov r10,0x1
	mov r9,r10
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	bts r12,2
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_494
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_494:
; 	∎ 2'
;clear  0'~x
	bt r12,0
	jc clear_lb_495
	mov rdi,r8
	call dec_r
clear_lb_495:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_412_1:
	jc lb_496
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r9
	call dec_r
	pop r9
	jmp lb_497
lb_496:
; emt_set_ptn -2'
lb_497:
	pop rbx
	pop r14
; 	» 0xr0 |~ 0' : r64
	mov r10,0x0
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_500
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_500:
; 	∎ 2'
;clear  1'~x
	bt r12,1
	jc clear_lb_501
	mov rdi,r9
	call dec_r
clear_lb_501:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
tak_i:
; 	|» { 0' 1' 2' }
	jz _tak_i
	jc emt_etr_c_lb_6
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	pop rbx
jmp _tak_i
emt_etr_c_lb_6:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	pop rbx
_tak_i:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	bts r12,4
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_251
	push r9
	push r10
	push r11
	push rcx
	mov rdi,r8
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_251:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	bts r12,0
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
	bts r12,5
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_256
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,r9
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_256:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
; unknown
	mov r9,rcx
	jc lb_258
	btr r12,1
	call inc_r
	jmp lb_259
lb_258:
	bts r12,1
lb_259:
; emt_ptn_set_ptn 5',6'
	bt r12,5
; emt_set_ptn 6'
; unknown
	mov rsi,rdx
	jc lb_260
	btr r12,6
	call inc_r
	jmp lb_261
lb_260:
	bts r12,6
lb_261:
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_264
	push r8
	push r9
	push r10
	push r11
	mov rdi,rdx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_264:
	bt r12,4
	jc lb_265
	push r8
	push r9
	push r10
	push r11
	mov rdi,rcx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_265:
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_257
	mov rdx,r9
lb_257:
	or r12,0b10000
	or r12,0b100000
; emt_ptn_set_ptn { 4' 5' },{ -2' 1' }
; emt_ptn_set_ptn 4',-2'
	bt r12,4
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
	bt r12,5
; emt_set_ptn 1'
; unboxed
	mov r9,rdx
	bts r12,1
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_267
	mov rbx,0
	stc
	jmp agl_266_1
lb_267:
	mov rbx,1
	stc
	jmp agl_266_0
; 	∐ -2'
agl_266_0:
	jc lb_268
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
	jmp lb_269
lb_268:
; emt_set_ptn -2'
lb_269:
	pop rbx
	pop r14
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_270
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_270:
	bt r12,0
	jc clear_lb_271
	mov rdi,r8
	call dec_r
clear_lb_271:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_266_1:
	jc lb_272
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
	jmp lb_273
lb_272:
; emt_set_ptn -2'
lb_273:
	pop rbx
	pop r14
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	bt r12,3
; emt_set_ptn 1'
; unboxed
	mov r9,r11
	bts r12,1
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	bts r12,4
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_278
	push r8
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
lb_278:
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
	bts r12,3
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
	bt r12,3
; emt_set_ptn 5'
; unboxed
	mov rdx,r11
	bts r12,5
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_281
	push r8
	push r9
	push r10
	push rcx
	push rdx
	mov rdi,r11
	call dec_r
	pop rdx
	pop rcx
	pop r10
	pop r9
	pop r8
lb_281:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	bt r12,4
; emt_set_ptn 6'
; unknown
	mov rsi,rcx
	jc lb_282
	btr r12,6
	call inc_r
	jmp lb_283
lb_282:
	bts r12,6
lb_283:
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
; unknown
	mov rdi,rdx
	jc lb_284
	btr r12,7
	call inc_r
	jmp lb_285
lb_284:
	bts r12,7
lb_285:
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_288
	push r8
	push r9
	push r10
	push r11
	mov rdi,rdx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_288:
	bt r12,4
	jc lb_289
	push r8
	push r9
	push r10
	push r11
	mov rdi,rcx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_289:
	sub rsi,rdi
	stc
; emt_set_ptn 3'
; unboxed
	mov r11,rsi
	bts r12,3
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	bt r12,2
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
	bts r12,4
; emt_ptn_set_ptn 2',5'
	bt r12,2
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	bts r12,5
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_294
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_294:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; emt_ptn_set_ptn 0',6'
	bt r12,0
; emt_set_ptn 6'
; unboxed
	mov rsi,r8
	bts r12,6
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_299
	push r9
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r8
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r9
lb_299:
; 	tak_i { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	bt r12,3
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r11
	bts r14,0
; emt_ptn_set_ptn 6',1'
	bt r12,6
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	bts r14,1
; emt_ptn_set_ptn 5',2'
	bt r12,5
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdx
	bts r14,2
; ; emt_dec_ptn { 3' 6' 5' }
	bt r12,5
	jc lb_300
	push r9
	push r10
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_300:
	bt r12,6
	jc lb_301
	push r9
	push r10
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_301:
	bt r12,3
	jc lb_302
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_302:
; push_s  2'~y 4'~z 1'~x
	mov [tmp],rbx
	mov rbx,r10
	push rbx
	mov rbx,rcx
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak_i
	push rbx
	mov rbx,rax
	jc lb_309
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	push r9
	push r10
	push rcx
	mov rdi,rbx
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
	jmp lb_310
lb_309:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_310:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov rcx,rbx
	pop rbx
	mov r10,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	bts r12,3
; emt_ptn_set_ptn 2',5'
	bt r12,2
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	bts r12,5
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_319
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_319:
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	bt r12,2
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	bts r12,6
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_322
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r10
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_322:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
; unknown
	mov rdi,rdx
	jc lb_323
	btr r12,7
	call inc_r
	jmp lb_324
lb_323:
	bts r12,7
lb_324:
; emt_ptn_set_ptn 6',8'
	bt r12,6
; emt_set_ptn 8'
; unknown
	mov rax,rsi
	jc lb_325
	btr r12,8
	call inc_r
	jmp lb_326
lb_325:
	bts r12,8
lb_326:
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_329
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_329:
	bt r12,5
	jc lb_330
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_330:
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	bts r12,2
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	bt r12,4
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
	bts r12,5
; emt_ptn_set_ptn 4',6'
	bt r12,4
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
	bts r12,6
; ; emt_dec_ptn 4'
	bt r12,4
	jc lb_335
	push r8
	push r9
	push r10
	push r11
	push rdx
	push rsi
	mov rdi,rcx
	call dec_r
	pop rsi
	pop rdx
	pop r11
	pop r10
	pop r9
	pop r8
lb_335:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	bt r12,1
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
	bts r12,4
; emt_ptn_set_ptn 1',7'
	bt r12,1
; emt_set_ptn 7'
; unboxed
	mov rdi,r9
	bts r12,7
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_340
	push r8
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	push rdi
	mov rdi,r9
	call dec_r
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_340:
; 	tak_i { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; emt_ptn_set_ptn 6',1'
	bt r12,6
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	bts r14,1
; emt_ptn_set_ptn 7',2'
	bt r12,7
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdi
	bts r14,2
; ; emt_dec_ptn { 2' 6' 7' }
	bt r12,7
	jc lb_341
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,rdi
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_341:
	bt r12,6
	jc lb_342
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,rsi
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_342:
	bt r12,2
	jc lb_343
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_343:
; push_s  3'~y 4'~x 5'~z 0'~r0
	mov [tmp],rbx
	mov rbx,r11
	push rbx
	mov rbx,rcx
	push rbx
	mov rbx,rdx
	push rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak_i
	push rbx
	mov rbx,rax
	jc lb_350
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,rbx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
	jmp lb_351
lb_350:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
lb_351:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	pop rbx
	mov rdx,rbx
	pop rbx
	mov rcx,rbx
	pop rbx
	mov r11,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	bt r12,2
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	bts r12,6
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_358
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r10
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_358:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
; unknown
	mov rdi,rdx
	jc lb_359
	btr r12,7
	call inc_r
	jmp lb_360
lb_359:
	bts r12,7
lb_360:
; emt_ptn_set_ptn 6',8'
	bt r12,6
; emt_set_ptn 8'
; unknown
	mov rax,rsi
	jc lb_361
	btr r12,8
	call inc_r
	jmp lb_362
lb_361:
	bts r12,8
lb_362:
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_365
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_365:
	bt r12,5
	jc lb_366
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_366:
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	bts r12,2
; 	tak_i { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rcx
	bts r14,1
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	bts r14,2
; ; emt_dec_ptn { 2' 4' 3' }
	bt r12,3
	jc lb_367
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_367:
	bt r12,4
	jc lb_368
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_368:
	bt r12,2
	jc lb_369
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_369:
; push_s  0'~r0 1'~r1
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak_i
	push rbx
	mov rbx,rax
	jc lb_376
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_377
lb_376:
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
lb_377:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	tak_i { 0' 1' 2' } ⊢| 

mov r14,0

not r14
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	bt r12,0
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r8
	bts r14,0
; emt_ptn_set_ptn 1',1'
	bt r12,1
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r9
	bts r14,1
; emt_ptn_set_ptn 2',2'
	bt r12,2
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r10
	bts r14,2
; ; emt_dec_ptn { 0' 1' 2' }
	bt r12,2
	jc lb_382
	mov rdi,r10
	call dec_r
lb_382:
	bt r12,1
	jc lb_383
	mov rdi,r9
	call dec_r
lb_383:
	bt r12,0
	jc lb_384
	mov rdi,r8
	call dec_r
lb_384:
;clear 
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	jmp _tak_i
tak:
; 	|» { 0' 1' 2' }
	jz _tak
	jc emt_etr_c_lb_7
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	pop rbx
jmp _tak
emt_etr_c_lb_7:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	pop rbx
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	bts r12,4
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_89
	push r9
	push r10
	push r11
	push rcx
	mov rdi,r8
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_89:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	bts r12,0
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
	bts r12,5
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_94
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,r9
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_94:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
; unknown
	mov r9,rcx
	jc lb_96
	btr r12,1
	call inc_r
	jmp lb_97
lb_96:
	bts r12,1
lb_97:
; emt_ptn_set_ptn 5',6'
	bt r12,5
; emt_set_ptn 6'
; unknown
	mov rsi,rdx
	jc lb_98
	btr r12,6
	call inc_r
	jmp lb_99
lb_98:
	bts r12,6
lb_99:
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_102
	push r8
	push r9
	push r10
	push r11
	mov rdi,rdx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_102:
	bt r12,4
	jc lb_103
	push r8
	push r9
	push r10
	push r11
	mov rdi,rcx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_103:
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_95
	mov rdx,r9
lb_95:
	or r12,0b10000
	or r12,0b100000
; emt_ptn_set_ptn { 4' 5' },{ -2' 1' }
; emt_ptn_set_ptn 4',-2'
	bt r12,4
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
	bt r12,5
; emt_set_ptn 1'
; unboxed
	mov r9,rdx
	bts r12,1
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_105
	mov rbx,0
	stc
	jmp agl_104_1
lb_105:
	mov rbx,1
	stc
	jmp agl_104_0
; 	∐ -2'
agl_104_0:
	jc lb_106
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
	jmp lb_107
lb_106:
; emt_set_ptn -2'
lb_107:
	pop rbx
	pop r14
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_108
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_108:
	bt r12,0
	jc clear_lb_109
	mov rdi,r8
	call dec_r
clear_lb_109:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_104_1:
	jc lb_110
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
	jmp lb_111
lb_110:
; emt_set_ptn -2'
lb_111:
	pop rbx
	pop r14
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	bt r12,3
; emt_set_ptn 1'
; unboxed
	mov r9,r11
	bts r12,1
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	bts r12,4
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_116
	push r8
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
lb_116:
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
	bts r12,3
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
	bt r12,3
; emt_set_ptn 5'
; unboxed
	mov rdx,r11
	bts r12,5
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_119
	push r8
	push r9
	push r10
	push rcx
	push rdx
	mov rdi,r11
	call dec_r
	pop rdx
	pop rcx
	pop r10
	pop r9
	pop r8
lb_119:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	bt r12,4
; emt_set_ptn 6'
; unknown
	mov rsi,rcx
	jc lb_120
	btr r12,6
	call inc_r
	jmp lb_121
lb_120:
	bts r12,6
lb_121:
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
; unknown
	mov rdi,rdx
	jc lb_122
	btr r12,7
	call inc_r
	jmp lb_123
lb_122:
	bts r12,7
lb_123:
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_126
	push r8
	push r9
	push r10
	push r11
	mov rdi,rdx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_126:
	bt r12,4
	jc lb_127
	push r8
	push r9
	push r10
	push r11
	mov rdi,rcx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_127:
	sub rsi,rdi
	stc
; emt_set_ptn 3'
; unboxed
	mov r11,rsi
	bts r12,3
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	bt r12,2
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
	bts r12,4
; emt_ptn_set_ptn 2',5'
	bt r12,2
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	bts r12,5
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_132
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_132:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; emt_ptn_set_ptn 0',6'
	bt r12,0
; emt_set_ptn 6'
; unboxed
	mov rsi,r8
	bts r12,6
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_137
	push r9
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r8
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r9
lb_137:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	bt r12,3
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r11
	bts r14,0
; emt_ptn_set_ptn 6',1'
	bt r12,6
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	bts r14,1
; emt_ptn_set_ptn 5',2'
	bt r12,5
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdx
	bts r14,2
; ; emt_dec_ptn { 3' 6' 5' }
	bt r12,5
	jc lb_138
	push r9
	push r10
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_138:
	bt r12,6
	jc lb_139
	push r9
	push r10
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_139:
	bt r12,3
	jc lb_140
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_140:
; push_s  2'~y 4'~z 1'~x
	mov [tmp],rbx
	mov rbx,r10
	push rbx
	mov rbx,rcx
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_147
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	push r9
	push r10
	push rcx
	mov rdi,rbx
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
	jmp lb_148
lb_147:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_148:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov rcx,rbx
	pop rbx
	mov r10,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	bts r12,3
; emt_ptn_set_ptn 2',5'
	bt r12,2
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	bts r12,5
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_157
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_157:
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	bt r12,2
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	bts r12,6
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_160
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r10
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_160:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
; unknown
	mov rdi,rdx
	jc lb_161
	btr r12,7
	call inc_r
	jmp lb_162
lb_161:
	bts r12,7
lb_162:
; emt_ptn_set_ptn 6',8'
	bt r12,6
; emt_set_ptn 8'
; unknown
	mov rax,rsi
	jc lb_163
	btr r12,8
	call inc_r
	jmp lb_164
lb_163:
	bts r12,8
lb_164:
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_167
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_167:
	bt r12,5
	jc lb_168
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_168:
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	bts r12,2
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	bt r12,4
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
	bts r12,5
; emt_ptn_set_ptn 4',6'
	bt r12,4
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
	bts r12,6
; ; emt_dec_ptn 4'
	bt r12,4
	jc lb_173
	push r8
	push r9
	push r10
	push r11
	push rdx
	push rsi
	mov rdi,rcx
	call dec_r
	pop rsi
	pop rdx
	pop r11
	pop r10
	pop r9
	pop r8
lb_173:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	bt r12,1
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
	bts r12,4
; emt_ptn_set_ptn 1',7'
	bt r12,1
; emt_set_ptn 7'
; unboxed
	mov rdi,r9
	bts r12,7
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_178
	push r8
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	push rdi
	mov rdi,r9
	call dec_r
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_178:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; emt_ptn_set_ptn 6',1'
	bt r12,6
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	bts r14,1
; emt_ptn_set_ptn 7',2'
	bt r12,7
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdi
	bts r14,2
; ; emt_dec_ptn { 2' 6' 7' }
	bt r12,7
	jc lb_179
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,rdi
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_179:
	bt r12,6
	jc lb_180
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,rsi
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_180:
	bt r12,2
	jc lb_181
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_181:
; push_s  3'~y 4'~x 5'~z 0'~r0
	mov [tmp],rbx
	mov rbx,r11
	push rbx
	mov rbx,rcx
	push rbx
	mov rbx,rdx
	push rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_188
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,rbx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
	jmp lb_189
lb_188:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
lb_189:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	pop rbx
	mov rdx,rbx
	pop rbx
	mov rcx,rbx
	pop rbx
	mov r11,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	bt r12,2
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	bts r12,6
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_196
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r10
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_196:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
; unknown
	mov rdi,rdx
	jc lb_197
	btr r12,7
	call inc_r
	jmp lb_198
lb_197:
	bts r12,7
lb_198:
; emt_ptn_set_ptn 6',8'
	bt r12,6
; emt_set_ptn 8'
; unknown
	mov rax,rsi
	jc lb_199
	btr r12,8
	call inc_r
	jmp lb_200
lb_199:
	bts r12,8
lb_200:
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_203
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_203:
	bt r12,5
	jc lb_204
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_204:
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	bts r12,2
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rcx
	bts r14,1
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	bts r14,2
; ; emt_dec_ptn { 2' 4' 3' }
	bt r12,3
	jc lb_205
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_205:
	bt r12,4
	jc lb_206
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_206:
	bt r12,2
	jc lb_207
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_207:
; push_s  0'~r0 1'~r1
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_214
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_215
lb_214:
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	bts r12,2
	pop rbx
lb_215:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	tak { 0' 1' 2' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	bt r12,0
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r8
	bts r14,0
; emt_ptn_set_ptn 1',1'
	bt r12,1
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r9
	bts r14,1
; emt_ptn_set_ptn 2',2'
	bt r12,2
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r10
	bts r14,2
; ; emt_dec_ptn { 0' 1' 2' }
	bt r12,2
	jc lb_220
	mov rdi,r10
	call dec_r
lb_220:
	bt r12,1
	jc lb_221
	mov rdi,r9
	call dec_r
lb_221:
	bt r12,0
	jc lb_222
	mov rdi,r8
	call dec_r
lb_222:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_229
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_230
lb_229:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_230:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rax,rbx
	pop rbx
	ret
fact:
; 	|» 0'
	jz _fact
	jc emt_etr_c_lb_8
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	pop rbx
jmp _fact
emt_etr_c_lb_8:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	bts r12,2
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_17
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_17:
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	bts r12,3
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_20
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_20:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unknown
	mov r8,r9
	jc lb_22
	btr r12,0
	call inc_r
	jmp lb_23
lb_22:
	bts r12,0
lb_23:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unknown
	mov rcx,r11
	jc lb_24
	btr r12,4
	call inc_r
	jmp lb_25
lb_24:
	bts r12,4
lb_25:
; ; emt_dec_ptn { 1' 3' }
	bt r12,3
	jc lb_28
	push r8
	push r10
	mov rdi,r11
	call dec_r
	pop r10
	pop r8
lb_28:
	bt r12,1
	jc lb_29
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_29:
	cmp r8,rcx
	mov r9,0
	mov r11,0
	setz r9b
	mov r8,1
	jle lb_21
	mov r11,r8
lb_21:
	or r12,0b10
	or r12,0b1000
; emt_ptn_set_ptn { 1' 3' },{ 0' -2' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	bts r12,0
; emt_ptn_set_ptn 3',-2'
	bt r12,3
; emt_set_ptn -2'
; 	∠ 0'
	push r14
; emt_get_ptn 0'
	mov r14,r8
	bt r12,0
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_31
	mov rbx,0
	stc
	jmp agl_30_1
lb_31:
	mov rbx,1
	stc
	jmp agl_30_0
; 	∐ -2'
agl_30_0:
	jc lb_32
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r10
	call dec_r
	pop r10
	jmp lb_33
lb_32:
; emt_set_ptn -2'
lb_33:
	pop rbx
	pop r14
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_36
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_36:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov r8,r10
	bts r12,0
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	bts r12,3
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_41
	push r8
	push r9
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r9
	pop r8
lb_41:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
; unknown
	mov rcx,r8
	jc lb_42
	btr r12,4
	call inc_r
	jmp lb_43
lb_42:
	bts r12,4
lb_43:
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
; unknown
	mov rdx,r9
	jc lb_44
	btr r12,5
	call inc_r
	jmp lb_45
lb_44:
	bts r12,5
lb_45:
; ; emt_dec_ptn { 0' 1' }
	bt r12,1
	jc lb_48
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
lb_48:
	bt r12,0
	jc lb_49
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
lb_49:
	sub rcx,rdx
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rcx
	bts r12,2
; 	fact 2' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	bts r14,0
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_50
	push r11
	mov rdi,r10
	call dec_r
	pop r11
lb_50:
; push_s  3'~x2
	mov [tmp],rbx
	mov rbx,r11
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_53
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
	push r8
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r8
	jmp lb_54
lb_53:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	bts r12,0
	pop rbx
lb_54:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r11,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
; unknown
	mov r10,r11
	jc lb_59
	btr r12,2
	call inc_r
	jmp lb_60
lb_59:
	bts r12,2
lb_60:
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
; unknown
	mov rcx,r8
	jc lb_61
	btr r12,4
	call inc_r
	jmp lb_62
lb_61:
	bts r12,4
lb_62:
; ; emt_dec_ptn { 3' 0' }
	bt r12,0
	jc lb_65
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_65:
	bt r12,3
	jc lb_66
	push r9
	mov rdi,r11
	call dec_r
	pop r9
lb_66:
	push rbx
	push r14
	mov rbx,r10
	mov r14,rcx
	imul rbx,r14
	stc
	pop r14
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	bts r12,1
	pop rbx
; 	∎ 1'
;clear 
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_30_1:
	jc lb_67
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r10
	call dec_r
	pop r10
	jmp lb_68
lb_67:
; emt_set_ptn -2'
lb_68:
	pop rbx
	pop r14
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	bts r12,1
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_71
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_71:
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_72
	mov rdi,r10
	call dec_r
clear_lb_72:
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
	pop rbx
	ret
