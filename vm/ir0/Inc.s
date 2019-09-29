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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
; unboxed
; unboxed
	bt r12,3
	bt r12,2
	bt r12,1
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
; unboxed
; unboxed
	bt r12,3
	bt r12,2
	bt r12,1
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
; unboxed
	bt r12,1
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,3
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
; unboxed
	bt r12,3
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
; unboxed
	bt r12,4
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
; unboxed
; unboxed
	bt r12,3
	bt r12,2
	bt r12,1
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,1
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,1
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
; unboxed
	bt r12,1
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
; 	cmp { 2' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 0' 4' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
; unknown
	mov r8,r10
	jc lb_406
	btr r12,0
	call inc_r
	jmp lb_407
lb_406:
	bts r12,0
lb_407:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unknown
	mov rcx,r11
	jc lb_408
	btr r12,4
	call inc_r
	jmp lb_409
lb_408:
	bts r12,4
lb_409:
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unboxed
	bt r12,3
	bt r12,2
	cmp r8,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r8,1
	jle lb_405
	mov r11,r8
lb_405:
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
; unboxed
	bt r12,1
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
; unboxed
	bt r12,1
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 1' 4' }
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
; unknown
	mov r9,r10
	jc lb_427
	btr r12,1
	call inc_r
	jmp lb_428
lb_427:
	bts r12,1
lb_428:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unknown
	mov rcx,r11
	jc lb_429
	btr r12,4
	call inc_r
	jmp lb_430
lb_429:
	bts r12,4
lb_430:
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unboxed
	bt r12,3
	bt r12,2
	cmp r9,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r9,1
	jle lb_426
	mov r11,r9
lb_426:
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
; unboxed
	bt r12,3
	bt r12,1
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
; unboxed
; unboxed
	bt r12,4
	bt r12,2
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,1
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
; unboxed
; unboxed
	bt r12,1
	bt r12,0
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
; unboxed
	bt r12,1
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,1
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
; unknown
	mov r9,rcx
	jc lb_260
	btr r12,1
	call inc_r
	jmp lb_261
lb_260:
	bts r12,1
lb_261:
; emt_ptn_set_ptn 5',6'
	bt r12,5
; emt_set_ptn 6'
; unknown
	mov rsi,rdx
	jc lb_262
	btr r12,6
	call inc_r
	jmp lb_263
lb_262:
	bts r12,6
lb_263:
; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	bt r12,5
	bt r12,4
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_259
	mov rdx,r9
lb_259:
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
; unboxed
	bt r12,3
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
; unboxed
	bt r12,3
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
; unboxed
; unboxed
	bt r12,5
	bt r12,4
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,0
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
; unboxed
; unboxed
; unboxed
	bt r12,5
	bt r12,6
	bt r12,3
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,2
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
; unboxed
; unboxed
	bt r12,6
	bt r12,5
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
; unboxed
	bt r12,4
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
; unboxed
	bt r12,1
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
; unboxed
; unboxed
; unboxed
	bt r12,7
	bt r12,6
	bt r12,2
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
; unboxed
	bt r12,2
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
; unboxed
; unboxed
	bt r12,6
	bt r12,5
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
; unboxed
; unboxed
; unboxed
	bt r12,3
	bt r12,4
	bt r12,2
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
; unboxed
; unboxed
; unboxed
	bt r12,2
	bt r12,1
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,1
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
; unknown
	mov r9,rcx
	jc lb_98
	btr r12,1
	call inc_r
	jmp lb_99
lb_98:
	bts r12,1
lb_99:
; emt_ptn_set_ptn 5',6'
	bt r12,5
; emt_set_ptn 6'
; unknown
	mov rsi,rdx
	jc lb_100
	btr r12,6
	call inc_r
	jmp lb_101
lb_100:
	bts r12,6
lb_101:
; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	bt r12,5
	bt r12,4
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_97
	mov rdx,r9
lb_97:
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
; unboxed
	bt r12,3
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
; unboxed
	bt r12,3
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
; unboxed
; unboxed
	bt r12,5
	bt r12,4
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,0
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
; unboxed
; unboxed
; unboxed
	bt r12,5
	bt r12,6
	bt r12,3
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
; unboxed
	bt r12,2
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
; unboxed
	bt r12,2
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
; unboxed
; unboxed
	bt r12,6
	bt r12,5
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
; unboxed
	bt r12,4
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
; unboxed
	bt r12,1
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
; unboxed
; unboxed
; unboxed
	bt r12,7
	bt r12,6
	bt r12,2
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
; unboxed
	bt r12,2
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
; unboxed
; unboxed
	bt r12,6
	bt r12,5
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
; unboxed
; unboxed
; unboxed
	bt r12,3
	bt r12,4
	bt r12,2
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
; unboxed
; unboxed
; unboxed
	bt r12,2
	bt r12,1
	bt r12,0
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,0
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
; unknown
	mov r8,r9
	jc lb_24
	btr r12,0
	call inc_r
	jmp lb_25
lb_24:
	bts r12,0
lb_25:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
; unknown
	mov rcx,r11
	jc lb_26
	btr r12,4
	call inc_r
	jmp lb_27
lb_26:
	bts r12,4
lb_27:
; ; emt_dec_ptn { 1' 3' }
; unboxed
; unboxed
	bt r12,3
	bt r12,1
	cmp r8,rcx
	mov r9,0
	mov r11,0
	setz r9b
	mov r8,1
	jle lb_23
	mov r11,r8
lb_23:
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
; unboxed
	bt r12,0
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
; unboxed
	bt r12,2
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
; unboxed
; unboxed
	bt r12,1
	bt r12,0
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
; unboxed
	bt r12,2
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
; unboxed
; unboxed
	bt r12,0
	bt r12,3
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
; unboxed
	bt r12,0
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
