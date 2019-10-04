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
	call test0
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
	mov QWORD r9,0x14
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xra |~ 0' : r64
	mov QWORD r10,0xa
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov QWORD r11,0x0
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,z : ,r64
; emt_ptn_crt_ptn 0',z
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
	mov QWORD r9,0x14
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xra |~ 0' : r64
	mov QWORD r10,0xa
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov QWORD r11,0x0
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,z : ,r64
; emt_ptn_crt_ptn 0',z
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
	mov QWORD r10,0x5
	mov QWORD r9,r10
	or r12,0b10
; 	$ 1' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 1',x
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
	mov QWORD r11,0x5
	mov QWORD r10,r11
	or r12,0b100
; 	$ 2' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 2',x
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
	mov QWORD rcx,0x6
	mov QWORD r11,rcx
	or r12,0b1000
; 	$ 3' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 3',x
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
	push rbx
; emt_get_ptn { 0' 1' 2' 3' }
	push rbx
	push r14
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,4
	call mlc
	mov rbx,rax
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; emt_get_ptn 0'
	mov rbx,r8
	stc
	mov rdx,rbx
	mov rdi,rbx
	mov rsi,0
	call exc
; emt_get_ptn 1'
	mov rbx,r9
	stc
	mov rdx,rbx
	mov rdi,rbx
	mov rsi,1
	call exc
; emt_get_ptn 2'
	mov rbx,r10
	stc
	mov rdx,rbx
	mov rdi,rbx
	mov rsi,2
	call exc
; emt_get_ptn 3'
	mov rbx,r11
	stc
	mov rdx,rbx
	mov rdi,rbx
	mov rsi,3
	call exc
	mov rbx,rbx
	pop r14
	pop rbx
	clc
; ; emt_dec_ptn { 0' 1' 2' 3' }
; unboxed
; unboxed
; unboxed
; unboxed
	push rbx
;clear 
	pop rax
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
	mov QWORD r9,0x12
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xrc |~ 0' : r64
	mov QWORD r10,0xc
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr6 |~ 0' : r64
	mov QWORD r11,0x6
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,z : ,r64
; emt_ptn_crt_ptn 0',z
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
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	stc
; ; emt_dec_ptn 0'
; unboxed
	push rbx
;clear 
	pop rax
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
	mov QWORD r9,0x5
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 0',x
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
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	stc
; ; emt_dec_ptn 0'
; unboxed
	push rbx
;clear 
	pop rax
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
	mov QWORD r9,0x5
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 0',x
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
	mov QWORD r10,0x6
	mov QWORD r9,r10
	or r12,0b10
; 	$ 1' ⊢ ,x : ,r64
; emt_ptn_crt_ptn 1',x
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
	push rbx
; emt_get_ptn { 0' 1' }
	push rbx
	push r14
	push QWORD r8
	push QWORD r9
	mov rdi,2
	call mlc
	mov rbx,rax
	pop QWORD r9
	pop QWORD r8
; emt_get_ptn 0'
	mov rbx,r8
	stc
	mov rdx,rbx
	mov rdi,rbx
	mov rsi,0
	call exc
; emt_get_ptn 1'
	mov rbx,r9
	stc
	mov rdx,rbx
	mov rdi,rbx
	mov rsi,1
	call exc
	mov rbx,rbx
	pop r14
	pop rbx
	clc
; ; emt_dec_ptn { 0' 1' }
; unboxed
; unboxed
	push rbx
;clear 
	pop rax
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
	push QWORD r8
	mov rdi,rbx
	call dec_r
	pop QWORD r8
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
; 	$ 0' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; emt_ptn_crt_ptn 0',x0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov QWORD r11,0x0
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
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
	jle lb_380
	mov r11,r8
lb_380:
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
	je lb_388
	xor r11,r11

bts r12,3
	jmp agl_387_1
lb_388:

bts r12,3
	jmp agl_387_0
; 	∐ -2'
agl_387_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	$ 1' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 1',x
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_crt_ptn 1',x0
; emt_set_ptn 2'
; unboxed
	mov r10,r9
; ; emt_dec_ptn 1'
; unboxed
; 	» 0xr1 |~ 1' : r64
	mov QWORD r11,0x1
	mov QWORD r9,r11
	or r12,0b10
; 	$ 1' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 1',y
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
	jle lb_400
	mov r11,r9
lb_400:
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
	je lb_408
	xor r11,r11

bts r12,3
	jmp agl_407_1
lb_408:

bts r12,3
	jmp agl_407_0
; 	∐ -2'
agl_407_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; emt_ptn_crt_ptn 0',x0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr1 |~ 0' : r64
	mov QWORD r11,0x1
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,t0 : ,r64
; emt_ptn_crt_ptn 0',t0
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr2 |~ 0' : r64
	mov QWORD rcx,0x2
	mov QWORD r8,rcx
	or r12,0b1
; 	$ 0' ⊢ ,t1 : ,r64
; emt_ptn_crt_ptn 0',t1
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
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
; ; emt_dec_ptn 2'
; unboxed
	push rbx
;clear 
	pop rax
	pop rbx
	ret
; 	∐ -2'
agl_407_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 1' : r64
	mov QWORD r10,0x1
	mov QWORD r9,r10
	or r12,0b10
; 	$ 1' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unboxed
	mov r10,r9
; ; emt_dec_ptn 1'
; unboxed
; 	∎ 2'
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
; ; emt_dec_ptn 2'
; unboxed
	push rbx
;clear  0'~x
	bt r12,0
	jc clear_lb_463
	mov rdi,r8
	call dec_r
clear_lb_463:
	pop rax
	pop rbx
	ret
; 	∐ -2'
agl_387_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	∎ 2'
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
; ; emt_dec_ptn 2'
; unboxed
	push rbx
;clear  1'~x
	bt r12,1
	jc clear_lb_469
	mov rdi,r9
	call dec_r
clear_lb_469:
	pop rax
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
; 	$ 0' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; emt_ptn_crt_ptn 0',x0
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ 1' ⊢ ,y,y0 : ,r64,r64
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_crt_ptn 1',y0
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
	jle lb_244
	mov rdx,r9
lb_244:
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
	je lb_252
	xor rdx,rdx

bts r12,5
	jmp agl_251_1
lb_252:

bts r12,5
	jmp agl_251_0
; 	∐ -2'
agl_251_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	∎ 2'
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
; ; emt_dec_ptn 2'
; unboxed
	push rbx
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_255
	push QWORD r8
	mov rdi,r11
	call dec_r
	pop QWORD r8
clear_lb_255:
	bt r12,0
	jc clear_lb_256
	mov rdi,r8
	call dec_r
clear_lb_256:
	pop rax
	pop rbx
	ret
; 	∐ -2'
agl_251_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	$ 3' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 3',x
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; emt_ptn_crt_ptn 3',x0
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	» 0xr1 |~ 3' : r64
	mov QWORD rdx,0x1
	mov QWORD r11,rdx
	or r12,0b1000
; 	$ 3' ⊢ ,t : ,r64
; emt_ptn_crt_ptn 3',t
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
; 	$ 2' ⊢ ,z,z0 : ,r64,r64
; emt_ptn_crt_ptn 2',z
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
; emt_ptn_crt_ptn 2',z0
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,y,y0 : ,r64,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; emt_ptn_crt_ptn 0',y0
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
; 	$ 2' ⊢ ,y,y0 : ,r64,r64
; emt_ptn_crt_ptn 2',y
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; emt_ptn_crt_ptn 2',y0
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 2' : r64
	mov QWORD rsi,0x1
	mov QWORD r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,t : ,r64
; emt_ptn_crt_ptn 2',t
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
; 	$ 4' ⊢ ,z,z0 : ,r64,r64
; emt_ptn_crt_ptn 4',z
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
; emt_ptn_crt_ptn 4',z0
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
; ; emt_dec_ptn 4'
; unboxed
; 	$ 1' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 1',x
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
; emt_ptn_crt_ptn 1',x0
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
	mov QWORD rsi,0x1
	mov QWORD r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,t : ,r64
; emt_ptn_crt_ptn 2',t
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
; 	$ 0' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 0',x
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; emt_ptn_crt_ptn 0',x0
; emt_set_ptn 4'
; unboxed
	mov rcx,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ 1' ⊢ ,y,y0 : ,r64,r64
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; emt_ptn_crt_ptn 1',y0
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
	jle lb_94
	mov rdx,r9
lb_94:
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
	je lb_102
	xor rdx,rdx

bts r12,5
	jmp agl_101_1
lb_102:

bts r12,5
	jmp agl_101_0
; 	∐ -2'
agl_101_0:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	∎ 2'
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	stc
; ; emt_dec_ptn 2'
; unboxed
	push rbx
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_105
	push QWORD r8
	mov rdi,r11
	call dec_r
	pop QWORD r8
clear_lb_105:
	bt r12,0
	jc clear_lb_106
	mov rdi,r8
	call dec_r
clear_lb_106:
	pop rax
	pop rbx
	ret
; 	∐ -2'
agl_101_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 4'
; unboxed
; 	$ 3' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 3',x
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; emt_ptn_crt_ptn 3',x0
; emt_set_ptn 4'
; unboxed
	mov rcx,r11
; ; emt_dec_ptn 3'
; unboxed
; 	» 0xr1 |~ 3' : r64
	mov QWORD rdx,0x1
	mov QWORD r11,rdx
	or r12,0b1000
; 	$ 3' ⊢ ,t : ,r64
; emt_ptn_crt_ptn 3',t
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
; 	$ 2' ⊢ ,z,z0 : ,r64,r64
; emt_ptn_crt_ptn 2',z
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
; emt_ptn_crt_ptn 2',z0
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	$ 0' ⊢ ,y,y0 : ,r64,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; emt_ptn_crt_ptn 0',y0
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
; 	$ 2' ⊢ ,y,y0 : ,r64,r64
; emt_ptn_crt_ptn 2',y
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; emt_ptn_crt_ptn 2',y0
; emt_set_ptn 5'
; unboxed
	mov rdx,r10
; ; emt_dec_ptn 2'
; unboxed
; 	» 0xr1 |~ 2' : r64
	mov QWORD rsi,0x1
	mov QWORD r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,t : ,r64
; emt_ptn_crt_ptn 2',t
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
; 	$ 4' ⊢ ,z,z0 : ,r64,r64
; emt_ptn_crt_ptn 4',z
; emt_set_ptn 5'
; unboxed
	mov rdx,rcx
; emt_ptn_crt_ptn 4',z0
; emt_set_ptn 6'
; unboxed
	mov rsi,rcx
; ; emt_dec_ptn 4'
; unboxed
; 	$ 1' ⊢ ,x,x0 : ,r64,r64
; emt_ptn_crt_ptn 1',x
; emt_set_ptn 4'
; unboxed
	mov rcx,r9
; emt_ptn_crt_ptn 1',x0
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
	mov QWORD rsi,0x1
	mov QWORD r10,rsi
	or r12,0b100
; 	$ 2' ⊢ ,t : ,r64
; emt_ptn_crt_ptn 2',t
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
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	stc
; ; emt_dec_ptn 0'
; unboxed
	push rbx
;clear 
	pop rax
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
	push QWORD r8
	mov rdi,rbx
	call dec_r
	pop QWORD r8
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
; 	$ 0' ⊢ ,x0,x1 : ,r64,r64
; emt_ptn_crt_ptn 0',x0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; emt_ptn_crt_ptn 0',x1
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr0 |~ 0' : r64
	mov QWORD r11,0x0
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
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
	mov QWORD r9,0x1
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,t0 : ,r64
; emt_ptn_crt_ptn 0',t0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ 2' ⊢ ,x1,x2 : ,r64,r64
; emt_ptn_crt_ptn 2',x1
; emt_set_ptn 0'
; unboxed
	mov r8,r10
; emt_ptn_crt_ptn 2',x2
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
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	stc
; ; emt_dec_ptn 1'
; unboxed
	push rbx
;clear 
	pop rax
	pop rbx
	ret
; 	∐ -2'
agl_30_1:
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unboxed
; 	» 0xr1 |~ 0' : r64
	mov QWORD r9,0x1
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,y : ,r64
; emt_ptn_crt_ptn 0',y
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	∎ 1'
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	stc
; ; emt_dec_ptn 1'
; unboxed
	push rbx
;clear  2'~x1
	bt r12,2
	jc clear_lb_69
	mov rdi,r10
	call dec_r
clear_lb_69:
	pop rax
	pop rbx
	ret
