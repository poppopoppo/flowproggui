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
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; ; emt_dec_ptn 0'
; unboxed
; 	tak_i { 1' 2' 3' } ⊢| 

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	or r12,0b1

; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r10
	or r12,0b10

; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	or r12,0b100

; ; emt_dec_ptn { 1' 2' 3' }
; unboxed
; unboxed
; unboxed
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
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; ; emt_dec_ptn 0'
; unboxed
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	or r12,0b1

; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r10
	or r12,0b10

; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	or r12,0b100

; ; emt_dec_ptn { 1' 2' 3' }
; unboxed
; unboxed
; unboxed
; push_s 
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_570
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_571
lb_570:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_571:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
; 	» 0xr5 |~ 1' : r64
	mov r10,0x5
	mov r9,r10
	or r12,0b10
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	or r12,0b100

; ; emt_dec_ptn 1'
; unboxed
; 	fact 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; ; emt_dec_ptn 2'
; unboxed
; push_s  0'~r
	push QWORD r8
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_582
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_583
lb_582:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
lb_583:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r8
; 	» 0xr5 |~ 2' : r64
	mov r11,0x5
	mov r10,r11
	or r12,0b100
; 	$ 2' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	or r12,0b1000

; ; emt_dec_ptn 2'
; unboxed
; 	fib 3' ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r11
	or r12,0b1

; ; emt_dec_ptn 3'
; unboxed
; push_s  0'~r 1'~y
	push QWORD r8
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_594
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_595
lb_594:
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
lb_595:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
	pop QWORD r8
; 	» 0xr6 |~ 3' : r64
	mov rcx,0x6
	mov r11,rcx
	or r12,0b1000
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	or r12,0b10000

; ; emt_dec_ptn 3'
; unboxed
; 	fib 4' ⊢ 3' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],rcx
	or r12,0b1

; ; emt_dec_ptn 4'
; unboxed
; push_s  2'~y0 0'~r 1'~y
	push QWORD r10
	push QWORD r8
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_606
; emt_set_ptn 3'
; unboxed
	mov r11,rbx
	or r12,0b1000

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
	jmp lb_607
lb_606:
; emt_set_ptn 3'
; unboxed
	mov r11,rbx
	or r12,0b1000

	pop rbx
lb_607:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
	pop QWORD r8
	pop QWORD r10
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
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xrc |~ 0' : r64
	mov r10,0xc
	mov r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr6 |~ 0' : r64
	mov r11,0x6
	mov r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; ; emt_dec_ptn 0'
; unboxed
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	or r12,0b1

; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r10
	or r12,0b10

; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	or r12,0b100

; ; emt_dec_ptn { 1' 2' 3' }
; unboxed
; unboxed
; unboxed
; push_s 
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_546
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_547
lb_546:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_547:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
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
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	fact 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	or r12,0b1

; ; emt_dec_ptn 1'
; unboxed
; push_s 
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_522
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_523
lb_522:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_523:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
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
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	fib 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	or r12,0b1

; ; emt_dec_ptn 1'
; unboxed
; push_s 
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_498
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_499
lb_498:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_499:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
; 	» 0xr6 |~ 1' : r64
	mov r10,0x6
	mov r9,r10
	or r12,0b10
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	or r12,0b100

; ; emt_dec_ptn 1'
; unboxed
; 	fib 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; ; emt_dec_ptn 2'
; unboxed
; push_s  0'~y0
	push QWORD r8
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_510
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_511
lb_510:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
lb_511:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r8
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
	or r12,0b1

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
	or r12,0b1

	pop rbx
_fib:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; ; emt_dec_ptn 0'
; unboxed
; 	cmp { 2' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 0' 4' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
	or r12,0b1

; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	or r12,0b10000

; ; emt_dec_ptn { 2' 3' }
; unboxed
; unboxed
	cmp r8,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r8,1
	jle lb_399
	mov r11,r8
lb_399:
	or r12,0b100
	or r12,0b1000
; emt_ptn_set_ptn { 2' 3' },{ 0' -2' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
	or r12,0b1

; emt_ptn_set_ptn 3',-2'
; emt_set_ptn -2'
; 	∠ 0'
; emt_get_ptn 0'
	mov r11,r8
	bt r12,0
	cmp r11,0
	je lb_407
	mov r11,0

bts r12,3
	jmp agl_406_1
lb_407:
	mov r11,1

bts r12,3
	jmp agl_406_0
; 	∐ -2'
agl_406_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_408
	push r9
	push r10
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r10
	pop r9
lb_408:
; 	$ 1' ⊢ ,0',2' : ,r64,r64
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	or r12,0b1

; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	or r12,0b100

; ; emt_dec_ptn 1'
; unboxed
; 	» 0xr1 |~ 1' : r64
	mov r11,0x1
	mov r9,r11
	or r12,0b10
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r9
	or r12,0b1000

; ; emt_dec_ptn 1'
; unboxed
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 1' 4' }
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r10
	or r12,0b10

; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	or r12,0b10000

; ; emt_dec_ptn { 2' 3' }
; unboxed
; unboxed
	cmp r9,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r9,1
	jle lb_419
	mov r11,r9
lb_419:
	or r12,0b100
	or r12,0b1000
; emt_ptn_set_ptn { 2' 3' },{ 1' -2' }
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r10
	or r12,0b10

; emt_ptn_set_ptn 3',-2'
; emt_set_ptn -2'
; 	∠ 1'
; emt_get_ptn 1'
	mov r11,r9
	bt r12,1
	cmp r11,0
	je lb_427
	mov r11,0

bts r12,3
	jmp agl_426_1
lb_427:
	mov r11,1

bts r12,3
	jmp agl_426_0
; 	∐ -2'
agl_426_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_428
	push r8
	push r10
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r10
	pop r8
lb_428:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr1 |~ 0' : r64
	mov r11,0x1
	mov r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr2 |~ 0' : r64
	mov rcx,0x2
	mov r8,rcx
	or r12,0b1
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	or r12,0b10000

; ; emt_dec_ptn 0'
; unboxed
; 	sub { 1' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
	or r12,0b100000

; emt_ptn_set_ptn 3',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r11
	or r12,0b1000000

; ; emt_dec_ptn { 1' 3' }
; unboxed
; unboxed
	sub rdx,rsi
	stc
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
	or r12,0b1

; 	sub { 2' 4' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 4' },{ 3' 5' }
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	or r12,0b1000

; emt_ptn_set_ptn 4',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
	or r12,0b100000

; ; emt_dec_ptn { 2' 4' }
; unboxed
; unboxed
	sub r11,rdx
	stc
; emt_set_ptn 1'
; unboxed
	mov r9,r11
	or r12,0b10

; 	fib 0' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 0',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r8
	or r12,0b1

; ; emt_dec_ptn 0'
; unboxed
; push_s  1'~xt1
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_459
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_460
lb_459:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_460:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
; 	fib 1' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r9
	or r12,0b1

; ; emt_dec_ptn 1'
; unboxed
; push_s  0'~y0
	push QWORD r8
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_468
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_469
lb_468:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
lb_469:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r8
; 	add { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 3' 4' }
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; emt_ptn_set_ptn 1',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
	or r12,0b10000

; ; emt_dec_ptn { 0' 1' }
; unboxed
; unboxed
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
	or r12,0b100

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
agl_426_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_482
	push r8
	push r10
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r10
	pop r8
lb_482:
; 	» 0xr1 |~ 1' : r64
	mov r10,0x1
	mov r9,r10
	or r12,0b10
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
	or r12,0b100

; ; emt_dec_ptn 1'
; unboxed
; 	∎ 2'
;clear  0'~x
	bt r12,0
	jc clear_lb_486
	mov rdi,r8
	call dec_r
clear_lb_486:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_406_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_487
	push r9
	push r10
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r10
	pop r9
lb_487:
; 	» 0xr0 |~ 0' : r64
	mov r10,0x0
	mov r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	∎ 2'
;clear  1'~x
	bt r12,1
	jc clear_lb_491
	mov rdi,r9
	call dec_r
clear_lb_491:
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
	or r12,0b1

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

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
	or r12,0b1

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
	pop rbx
_tak_i:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	or r12,0b10000

; ; emt_dec_ptn 0'
; unboxed
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	or r12,0b1

; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
	or r12,0b100000

; ; emt_dec_ptn 1'
; unboxed
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
	or r12,0b10

; emt_ptn_set_ptn 5',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rdx
	or r12,0b1000000

; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_255
	mov rdx,r9
lb_255:
	or r12,0b10000
	or r12,0b100000
; emt_ptn_set_ptn { 4' 5' },{ -2' 1' }
; emt_ptn_set_ptn 4',-2'
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rdx
	or r12,0b10

; 	∠ 1'
; emt_get_ptn 1'
	mov rdx,r9
	bt r12,1
	cmp rdx,0
	je lb_263
	mov rdx,0

bts r12,5
	jmp agl_262_1
lb_263:
	mov rdx,1

bts r12,5
	jmp agl_262_0
; 	∐ -2'
agl_262_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc lb_264
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,rcx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_264:
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_265
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_265:
	bt r12,0
	jc clear_lb_266
	mov rdi,r8
	call dec_r
clear_lb_266:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_262_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc lb_267
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,rcx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_267:
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
	or r12,0b10

; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	or r12,0b10000

; ; emt_dec_ptn 3'
; unboxed
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
	or r12,0b1000
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r11
	or r12,0b100000

; ; emt_dec_ptn 3'
; unboxed
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
	or r12,0b1000000

; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
	or r12,0b10000000

; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	sub rsi,rdi
	stc
; emt_set_ptn 3'
; unboxed
	mov r11,rsi
	or r12,0b1000

; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
	or r12,0b10000

; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	or r12,0b100000

; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; emt_ptn_set_ptn 0',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r8
	or r12,0b1000000

; ; emt_dec_ptn 0'
; unboxed
; 	tak_i { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r11
	or r12,0b1

; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	or r12,0b10

; emt_ptn_set_ptn 5',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdx
	or r12,0b100

; ; emt_dec_ptn { 3' 6' 5' }
; unboxed
; unboxed
; unboxed
; push_s  2'~y 4'~z 1'~x
	push QWORD r10
	push QWORD rcx
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_303
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

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
	jmp lb_304
lb_303:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_304:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
	pop QWORD rcx
	pop QWORD r10
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	or r12,0b1000

; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	or r12,0b100000

; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	or r12,0b1000000

; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
	or r12,0b10000000

; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
	or r12,0b100000000

; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	or r12,0b100

; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
	or r12,0b100000

; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
	or r12,0b1000000

; ; emt_dec_ptn 4'
; unboxed
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
	or r12,0b10000

; emt_ptn_set_ptn 1',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,r9
	or r12,0b10000000

; ; emt_dec_ptn 1'
; unboxed
; 	tak_i { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	or r12,0b10

; emt_ptn_set_ptn 7',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdi
	or r12,0b100

; ; emt_dec_ptn { 2' 6' 7' }
; unboxed
; unboxed
; unboxed
; push_s  3'~y 4'~x 5'~z 0'~r0
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD r8
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_344
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

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
	jmp lb_345
lb_344:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
lb_345:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r8
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	or r12,0b1000000

; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
	or r12,0b10000000

; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
	or r12,0b100000000

; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	or r12,0b100

; 	tak_i { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rcx
	or r12,0b10

; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	or r12,0b100

; ; emt_dec_ptn { 2' 4' 3' }
; unboxed
; unboxed
; unboxed
; push_s  0'~r0 1'~r1
	push QWORD r8
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_370
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_371
lb_370:
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
lb_371:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
	pop QWORD r8
; 	tak_i { 0' 1' 2' } ⊢| 

mov r14,0

not r14
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r8
	or r12,0b1

; emt_ptn_set_ptn 1',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r9
	or r12,0b10

; emt_ptn_set_ptn 2',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r10
	or r12,0b100

; ; emt_dec_ptn { 0' 1' 2' }
; unboxed
; unboxed
; unboxed
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
	or r12,0b1

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

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
	or r12,0b1

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
	pop rbx
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	or r12,0b10000

; ; emt_dec_ptn 0'
; unboxed
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	or r12,0b1

; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
	or r12,0b100000

; ; emt_dec_ptn 1'
; unboxed
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
	or r12,0b10

; emt_ptn_set_ptn 5',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rdx
	or r12,0b1000000

; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
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
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rdx
	or r12,0b10

; 	∠ 1'
; emt_get_ptn 1'
	mov rdx,r9
	bt r12,1
	cmp rdx,0
	je lb_103
	mov rdx,0

bts r12,5
	jmp agl_102_1
lb_103:
	mov rdx,1

bts r12,5
	jmp agl_102_0
; 	∐ -2'
agl_102_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc lb_104
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,rcx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_104:
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_105
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_105:
	bt r12,0
	jc clear_lb_106
	mov rdi,r8
	call dec_r
clear_lb_106:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_102_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc lb_107
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,rcx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_107:
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
	or r12,0b10

; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	or r12,0b10000

; ; emt_dec_ptn 3'
; unboxed
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
	or r12,0b1000
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r11
	or r12,0b100000

; ; emt_dec_ptn 3'
; unboxed
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
	or r12,0b1000000

; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
	or r12,0b10000000

; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	sub rsi,rdi
	stc
; emt_set_ptn 3'
; unboxed
	mov r11,rsi
	or r12,0b1000

; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
	or r12,0b10000

; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	or r12,0b100000

; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; emt_ptn_set_ptn 0',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r8
	or r12,0b1000000

; ; emt_dec_ptn 0'
; unboxed
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r11
	or r12,0b1

; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	or r12,0b10

; emt_ptn_set_ptn 5',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdx
	or r12,0b100

; ; emt_dec_ptn { 3' 6' 5' }
; unboxed
; unboxed
; unboxed
; push_s  2'~y 4'~z 1'~x
	push QWORD r10
	push QWORD rcx
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_143
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

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
	jmp lb_144
lb_143:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_144:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
	pop QWORD rcx
	pop QWORD r10
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	or r12,0b1000

; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
	or r12,0b100000

; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	or r12,0b1000000

; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
	or r12,0b10000000

; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
	or r12,0b100000000

; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	or r12,0b100

; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
	or r12,0b100000

; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
	or r12,0b1000000

; ; emt_dec_ptn 4'
; unboxed
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
	or r12,0b10000

; emt_ptn_set_ptn 1',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,r9
	or r12,0b10000000

; ; emt_dec_ptn 1'
; unboxed
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rsi
	or r12,0b10

; emt_ptn_set_ptn 7',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],rdi
	or r12,0b100

; ; emt_dec_ptn { 2' 6' 7' }
; unboxed
; unboxed
; unboxed
; push_s  3'~y 4'~x 5'~z 0'~r0
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD r8
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_184
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

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
	jmp lb_185
lb_184:
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	or r12,0b10

	pop rbx
lb_185:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r8
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
	or r12,0b1000000

; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
	or r12,0b10000000

; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
	or r12,0b100000000

; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdi,rax
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
	or r12,0b100

; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],rcx
	or r12,0b10

; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r11
	or r12,0b100

; ; emt_dec_ptn { 2' 4' 3' }
; unboxed
; unboxed
; unboxed
; push_s  0'~r0 1'~r1
	push QWORD r8
	push QWORD r9
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_210
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_211
lb_210:
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	or r12,0b100

	pop rbx
lb_211:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r9
	pop QWORD r8
; 	tak { 0' 1' 2' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r8
	or r12,0b1

; emt_ptn_set_ptn 1',1'
; emt_set_ptn 1'
; unboxed
	mov [st_vct_tmp+8*1],r9
	or r12,0b10

; emt_ptn_set_ptn 2',2'
; emt_set_ptn 2'
; unboxed
	mov [st_vct_tmp+8*2],r10
	or r12,0b100

; ; emt_dec_ptn { 0' 1' 2' }
; unboxed
; unboxed
; unboxed
; push_s 
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
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
	jc lb_225
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_226
lb_225:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_226:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
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
	or r12,0b1

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
	or r12,0b1

	pop rbx
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
	or r12,0b100

; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
	or r12,0b1000

; ; emt_dec_ptn 0'
; unboxed
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	or r12,0b1

; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
	or r12,0b10000

; ; emt_dec_ptn { 1' 3' }
; unboxed
; unboxed
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
; emt_set_ptn 0'
; unboxed
	mov r8,r9
	or r12,0b1

; emt_ptn_set_ptn 3',-2'
; emt_set_ptn -2'
; 	∠ 0'
; emt_get_ptn 0'
	mov r11,r8
	bt r12,0
	cmp r11,0
	je lb_31
	mov r11,0

bts r12,3
	jmp agl_30_1
lb_31:
	mov r11,1

bts r12,3
	jmp agl_30_0
; 	∐ -2'
agl_30_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_32
	push r9
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
	pop r9
lb_32:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
	or r12,0b1

; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
	or r12,0b1000

; ; emt_dec_ptn 2'
; unboxed
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	or r12,0b10000

; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
	or r12,0b100000

; ; emt_dec_ptn { 0' 1' }
; unboxed
; unboxed
	sub rcx,rdx
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rcx
	or r12,0b100

; 	fact 2' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov [st_vct_tmp+8*0],r10
	or r12,0b1

; ; emt_dec_ptn 2'
; unboxed
; push_s  3'~x2
	push QWORD r11
	push r12
	rcl r12,1
	add r15,1
	rcr r12,1
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_52
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
	push r8
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r8
	jmp lb_53
lb_52:
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	or r12,0b1

	pop rbx
lb_53:
; pop_s
	rcl r12,1
	sub r15,1
	rcr r12,1
	pop r12
	pop QWORD r11
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
	or r12,0b100

; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
	or r12,0b10000

; ; emt_dec_ptn { 3' 0' }
; unboxed
; unboxed
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
	or r12,0b10

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
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_66
	push r9
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
	pop r9
lb_66:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
	or r12,0b10

; ; emt_dec_ptn 0'
; unboxed
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_70
	mov rdi,r10
	call dec_r
clear_lb_70:
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
	pop rbx
	ret
