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
	call test4
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
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	tak_i { 1' 2' 3' } ⊢| 
;clear 
; emt_ptn_mov
	mov rdx,r9
	bts r12,5
	mov rcx,r10
	bts r12,4
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
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
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	tak { 1' 2' 3' } ⊢ 0' : r64
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov rdx,r9
	bts r12,5
	mov rcx,r10
	bts r12,4
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	» 0xr5 |~ 1' : r64
	mov r10,0x5
	mov r9,r10
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
; ; emt_dec_ptn 1'
; unboxed
; 	fact 2' ⊢ 1' : r64
; push_s  0'~r
	sub rsp,16
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; ; emt_dec_ptn 2'
; unboxed
	push rbx
	call _fact
	mov rbx,rax
	shl r14,1
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r8,[rsp+8*1]
	add rsp,16
; 	» 0xr5 |~ 2' : r64
	mov r11,0x5
	mov r10,r11
; 	$ 2' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; ; emt_dec_ptn 2'
; unboxed
; 	fib 3' ⊢ 2' : r64
; push_s  0'~r 1'~y
	sub rsp,24
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r11
; ; emt_dec_ptn 3'
; unboxed
	push rbx
	call _fib
	mov rbx,rax
	shl r14,1
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
; 	» 0xr6 |~ 3' : r64
	mov rcx,0x6
	mov r11,rcx
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	fib 4' ⊢ 3' : r64
; push_s  2'~y0 0'~r 1'~y
	sub rsp,32
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rcx
; ; emt_dec_ptn 4'
; unboxed
	push rbx
	call _fib
	mov rbx,rax
	shl r14,1
; emt_set_ptn 3'
; unboxed
	mov r11,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	mov QWORD r10,[rsp+8*3]
	add rsp,32
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
	stc
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
	stc
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
	stc
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
	stc
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
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xrc |~ 0' : r64
	mov r10,0xc
	mov r8,r10
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr6 |~ 0' : r64
	mov r11,0x6
	mov r8,r11
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	tak { 1' 2' 3' } ⊢ 0' : r64
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov rdx,r9
	bts r12,5
	mov rcx,r10
	bts r12,4
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	stc
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
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	fact 1' ⊢ 0' : r64
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; ; emt_dec_ptn 1'
; unboxed
	push rbx
	call _fact
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	stc
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
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	fib 1' ⊢ 0' : r64
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; ; emt_dec_ptn 1'
; unboxed
	push rbx
	call _fib
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	» 0xr6 |~ 1' : r64
	mov r10,0x6
	mov r9,r10
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
; ; emt_dec_ptn 1'
; unboxed
; 	fib 2' ⊢ 1' : r64
; push_s  0'~y0
	sub rsp,16
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; ; emt_dec_ptn 2'
; unboxed
	push rbx
	call _fib
	mov rbx,rax
	shl r14,1
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r8,[rsp+8*1]
	add rsp,16
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
	stc
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
	stc
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
	pop rbx
_fib:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	cmp { 2' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 0' 4' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unboxed
	cmp r8,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r8,1
	jle lb_375
	mov r11,r8
lb_375:
; emt_ptn_set_ptn { 2' 3' },{ 0' -2' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; emt_ptn_set_ptn 3',-2'
; emt_set_ptn -2'
; 	∠ 0'
; emt_get_ptn 0'
	mov r11,r8
	stc
	cmp r11,0
	je lb_383
	xor r11,r11

bts r12,3
	jmp agl_382_1
lb_383:

bts r12,3
	jmp agl_382_0
; 	∐ -2'
agl_382_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	$ 1' ⊢ ,0',2' : ,r64,r64
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
; ; emt_dec_ptn 1'
; unboxed
; 	» 0xr1 |~ 1' : r64
	mov r11,0x1
	mov r9,r11
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r9
; ; emt_dec_ptn 1'
; unboxed
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 1' 4' }
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r10
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unboxed
	cmp r9,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r9,1
	jle lb_395
	mov r11,r9
lb_395:
; emt_ptn_set_ptn { 2' 3' },{ 1' -2' }
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r10
; emt_ptn_set_ptn 3',-2'
; emt_set_ptn -2'
; 	∠ 1'
; emt_get_ptn 1'
	mov r11,r9
	stc
	cmp r11,0
	je lb_403
	xor r11,r11

bts r12,3
	jmp agl_402_1
lb_403:

bts r12,3
	jmp agl_402_0
; 	∐ -2'
agl_402_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr1 |~ 0' : r64
	mov r11,0x1
	mov r8,r11
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr2 |~ 0' : r64
	mov rcx,0x2
	mov r8,rcx
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
; ; emt_dec_ptn 0'
; unboxed
; 	sub { 1' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
; emt_ptn_set_ptn 3',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r11
; ; emt_dec_ptn { 1' 3' }
; unboxed
; unboxed
	sub r9,r11
	stc
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; 	sub { 2' 4' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 4' },{ 3' 5' }
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; emt_ptn_set_ptn 4',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
; ; emt_dec_ptn { 2' 4' }
; unboxed
; unboxed
	sub r10,rcx
	stc
; emt_set_ptn 1'
; unboxed
	mov r9,r10
; 	fib 0' ⊢ 0' : r64
; push_s  1'~xt1
	sub rsp,16
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; ; emt_dec_ptn 1'
; unboxed
	push rbx
	call _fib
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	add rsp,16
; 	fib 1' ⊢ 1' : r64
; push_s  0'~y0
	sub rsp,16
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; ; emt_dec_ptn 1'
; unboxed
	push rbx
	call _fib
	mov rbx,rax
	shl r14,1
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r8,[rsp+8*1]
	add rsp,16
; 	add { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 3' 4' }
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; emt_ptn_set_ptn 1',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
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
	pop rbx
; 	∎ 2'
;clear 
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_402_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 1' : r64
	mov r10,0x1
	mov r9,r10
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r9
; ; emt_dec_ptn 1'
; unboxed
; 	∎ 2'
;clear  0'~x
	bt r12,0
	jc clear_lb_456
	mov rdi,r8
	call dec_r
clear_lb_456:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_382_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r10,0x0
	mov r8,r10
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	∎ 2'
;clear  1'~x
	bt r12,1
	jc clear_lb_461
	mov rdi,r9
	call dec_r
clear_lb_461:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
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
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
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
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	pop rbx
	pop rbx
_tak_i:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
; ; emt_dec_ptn 1'
; unboxed
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 5',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rdx
; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_240
	mov rdx,r9
lb_240:
; emt_ptn_set_ptn { 4' 5' },{ -2' 1' }
; emt_ptn_set_ptn 4',-2'
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rdx
; 	∠ 1'
; emt_get_ptn 1'
	mov rdx,r9
	stc
	cmp rdx,0
	je lb_248
	xor rdx,rdx

bts r12,5
	jmp agl_247_1
lb_248:

bts r12,5
	jmp agl_247_0
; 	∐ -2'
agl_247_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_250
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_250:
	bt r12,0
	jc clear_lb_251
	mov rdi,r8
	call dec_r
clear_lb_251:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_247_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	sub rcx,rdx
	stc
; emt_set_ptn 3'
; unboxed
	mov r11,rcx
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; emt_ptn_set_ptn 0',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r8
; ; emt_dec_ptn 0'
; unboxed
; 	tak_i { 3' 6' 5' } ⊢ 0' : r64
; push_s  2'~y 4'~z 1'~x
	sub rsp,32
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*2],rcx
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r11
; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rsi
; emt_ptn_set_ptn 5',2'
; emt_set_ptn 2'
; unboxed
	mov r10,rdx
; ; emt_dec_ptn { 3' 6' 5' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak_i
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	mov QWORD rcx,[rsp+8*2]
	mov QWORD r10,[rsp+8*3]
	add rsp,32
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdx,rsi
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdx
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
; ; emt_dec_ptn 4'
; unboxed
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
; emt_ptn_set_ptn 1',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,r9
; ; emt_dec_ptn 1'
; unboxed
; 	tak_i { 2' 6' 7' } ⊢ 1' : r64
; push_s  3'~y 4'~x 5'~z 0'~r0
	sub rsp,40
	mov QWORD [rsp+8*4],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*2],rdx
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov r11,r10
	bts r12,3
; emt_ptn_set_ptn { 3' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r11
; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rsi
; emt_ptn_set_ptn 7',2'
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
; ; emt_dec_ptn { 3' 6' 7' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak_i
	mov rbx,rax
	shl r14,1
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r8,[rsp+8*1]
	mov QWORD rdx,[rsp+8*2]
	mov QWORD rcx,[rsp+8*3]
	mov QWORD r11,[rsp+8*4]
	add rsp,40
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdx,rsi
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdx
; 	tak_i { 2' 4' 3' } ⊢ 2' : r64
; push_s  0'~r0 1'~r1
	sub rsp,24
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov rdx,r10
	bts r12,5
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak_i
	mov rbx,rax
	shl r14,1
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
; 	tak_i { 0' 1' 2' } ⊢| 
;clear 
; emt_ptn_mov
	mov rdx,r8
	bts r12,5
	mov rcx,r9
	bts r12,4
	mov r11,r10
	bts r12,3
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
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
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
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
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	pop rbx
	pop rbx
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
; ; emt_dec_ptn 1'
; unboxed
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 5',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rdx
; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_92
	mov rdx,r9
lb_92:
; emt_ptn_set_ptn { 4' 5' },{ -2' 1' }
; emt_ptn_set_ptn 4',-2'
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rdx
; 	∠ 1'
; emt_get_ptn 1'
	mov rdx,r9
	stc
	cmp rdx,0
	je lb_100
	xor rdx,rdx

bts r12,5
	jmp agl_99_1
lb_100:

bts r12,5
	jmp agl_99_0
; 	∐ -2'
agl_99_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_102
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_102:
	bt r12,0
	jc clear_lb_103
	mov rdi,r8
	call dec_r
clear_lb_103:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_99_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
; ; emt_dec_ptn { 4' 5' }
; unboxed
; unboxed
	sub rcx,rdx
	stc
; emt_set_ptn 3'
; unboxed
	mov r11,rcx
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; emt_ptn_set_ptn 0',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r8
; ; emt_dec_ptn 0'
; unboxed
; 	tak { 3' 6' 5' } ⊢ 0' : r64
; push_s  2'~y 4'~z 1'~x
	sub rsp,32
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*2],rcx
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r11
; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rsi
; emt_ptn_set_ptn 5',2'
; emt_set_ptn 2'
; unboxed
	mov r10,rdx
; ; emt_dec_ptn { 3' 6' 5' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	mov QWORD rcx,[rsp+8*2]
	mov QWORD r10,[rsp+8*3]
	add rsp,32
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; emt_ptn_set_ptn 2',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdx,rsi
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdx
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
; emt_ptn_set_ptn 4',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
; ; emt_dec_ptn 4'
; unboxed
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
; emt_ptn_set_ptn 1',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,r9
; ; emt_dec_ptn 1'
; unboxed
; 	tak { 2' 6' 7' } ⊢ 1' : r64
; push_s  3'~y 4'~x 5'~z 0'~r0
	sub rsp,40
	mov QWORD [rsp+8*4],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*2],rdx
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov r11,r10
	bts r12,3
; emt_ptn_set_ptn { 3' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r11
; emt_ptn_set_ptn 6',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rsi
; emt_ptn_set_ptn 7',2'
; emt_set_ptn 2'
; unboxed
	mov r10,rdi
; ; emt_dec_ptn { 3' 6' 7' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak
	mov rbx,rax
	shl r14,1
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r8,[rsp+8*1]
	mov QWORD rdx,[rsp+8*2]
	mov QWORD rcx,[rsp+8*3]
	mov QWORD r11,[rsp+8*4]
	add rsp,40
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
; emt_set_ptn 6'
; unboxed
	mov rsi,r10
; ; emt_dec_ptn 2'
; unboxed
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
; emt_set_ptn 7'
; unboxed
	mov rdi,rdx
; emt_ptn_set_ptn 6',8'
; emt_set_ptn 8'
; unboxed
	mov rax,rsi
; ; emt_dec_ptn { 5' 6' }
; unboxed
; unboxed
	sub rdx,rsi
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,rdx
; 	tak { 2' 4' 3' } ⊢ 2' : r64
; push_s  0'~r0 1'~r1
	sub rsp,24
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov rdx,r10
	bts r12,5
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak
	mov rbx,rax
	shl r14,1
; emt_set_ptn 2'
; unboxed
	mov r10,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
; 	tak { 0' 1' 2' } ⊢ 0' : r64
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
	mov rdx,r8
	bts r12,5
	mov rcx,r9
	bts r12,4
	mov r11,r10
	bts r12,3
; emt_ptn_set_ptn { 5' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
; emt_set_ptn 0'
; unboxed
	mov r8,rdx
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unboxed
	mov r9,rcx
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; ; emt_dec_ptn { 5' 4' 3' }
; unboxed
; unboxed
; unboxed
	push rbx
	call _tak
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	stc
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
	pop rbx
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; emt_ptn_set_ptn 0',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_set_ptn 3',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
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
; emt_ptn_set_ptn { 1' 3' },{ 0' -2' }
; emt_ptn_set_ptn 1',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_set_ptn 3',-2'
; emt_set_ptn -2'
; 	∠ 0'
; emt_get_ptn 0'
	mov r11,r8
	stc
	cmp r11,0
	je lb_31
	xor r11,r11

bts r12,3
	jmp agl_30_1
lb_31:

bts r12,3
	jmp agl_30_0
; 	∐ -2'
agl_30_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unboxed
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; emt_ptn_set_ptn 2',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; ; emt_dec_ptn 2'
; unboxed
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
; emt_ptn_set_ptn 1',5'
; emt_set_ptn 5'
; unboxed
	mov rdx,r9
; ; emt_dec_ptn { 0' 1' }
; unboxed
; unboxed
	sub r8,r9
	stc
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; 	fact 2' ⊢ 0' : r64
; push_s  3'~x2
	sub rsp,16
	mov QWORD [rsp+8*1],r11
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; ; emt_dec_ptn 2'
; unboxed
	push rbx
	call _fact
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	shr r14,1
; ; emt_dec 
; unboxed
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r11,[rsp+8*1]
	add rsp,16
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
; emt_set_ptn 2'
; unboxed
	mov r10,r11
; emt_ptn_set_ptn 0',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
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
	pop rbx
; 	∎ 1'
;clear 
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	stc
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_30_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unboxed
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_67
	mov rdi,r10
	call dec_r
clear_lb_67:
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	stc
	mov rax,rbx
	pop rbx
	ret
