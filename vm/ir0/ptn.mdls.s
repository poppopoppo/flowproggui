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
	call test6
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test6:
; 	|» {  }
	jz _test6
	jc emt_etr_c_lb_0
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
jmp _test6
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test6:
; 	$ {  } ⊢ ,_r156,_r157 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r156
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r157
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xr44 |~ 2' : r64
	mov QWORD r11,0x44
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r160,_r161 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r160
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r161
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrfaaa |~ 1' : r64
	mov QWORD rdx,0xfaaa
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r164,_r165 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r164
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r165
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrbb |~ 4' : r64
	mov QWORD rdi,0xbb
	mov QWORD rcx,rdi
	or r12,0b10000
; 	$ 6' ⊢ ,_r168,_r169 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r168
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r169
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; ; emt_dec_ptn 6'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrbf |~ 6' : r64
	mov QWORD [st_vct+8*0],0xbf
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD rsi,r14
	pop r14
	or r12,0b1000000
; 	$ 8' ⊢ ,_r172,_r173 : ,{ },{ }
; emt_ptn_crt_ptn 8',_r172
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; emt_ptn_crt_ptn 8',_r173
; emt_set_ptn 10'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*1],rdi
	pop rdi
	and r12,~0b10000000000
; ; emt_dec_ptn 8'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrcc |~ 8' : r64
	mov QWORD [st_vct+8*2],0xcc
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD rax,r14
	pop r14
	or r12,0b100000000
	mov QWORD [st_vct+8*2],0
	bts r12,11
; emt_ptn_crt_ptn { 11' {  } },_r175
; emt_get_crt_ptn { 11' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_345
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_346
emt_get_crt_ptn_0_lb_345:
; unboxed
	stc
emt_get_crt_ptn_1_lb_346:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*4],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000
; ; emt_dec_ptn {  }
	mov QWORD [st_vct+8*2],1
	bts r12,11
; emt_ptn_crt_ptn { 11' { 8' 12' } },_r171
; emt_get_crt_ptn { 11' { 8' 12' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*4],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*4]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_347
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_348
emt_get_crt_ptn_0_lb_347:
; unboxed
	stc
emt_get_crt_ptn_1_lb_348:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*5],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*4],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*4]
; emt_get_crt_ptn { 8' 12' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*5],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*5]
; emt_get_crt_ptn 8'
	mov QWORD [st_vct+8*6],rax
	stc
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*5],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*5]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_349
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_350
emt_get_crt_ptn_0_lb_349:
; unboxed
	stc
emt_get_crt_ptn_1_lb_350:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*6],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*5],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*4],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000000
; ; emt_dec_ptn { 8' 12' }
; unknown
	bt r12,12
	jc emt_dec_ptn_0_lb_351
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_351:
; unboxed
	mov QWORD rax,1
	bts r12,8
; emt_ptn_crt_ptn { 8' { 6' 13' } },_r167
; emt_get_crt_ptn { 8' { 6' 13' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*2],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_353
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_354
emt_get_crt_ptn_0_lb_353:
; unboxed
	stc
emt_get_crt_ptn_1_lb_354:
	mov QWORD [st_vct+8*3],rax
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn { 6' 13' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 6'
	mov QWORD [st_vct+8*5],rsi
	stc
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 13'
	bt r12,13
	jc emt_get_crt_ptn_0_lb_355
; boxed
	push rdi
	mov rdi,[st_vct+8*4]
	call inc_r
	mov [st_vct+8*4],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_356
emt_get_crt_ptn_0_lb_355:
; unboxed
	stc
emt_get_crt_ptn_1_lb_356:
	push r14
	mov QWORD r14,[st_vct+8*4]
	mov QWORD [st_vct+8*5],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000000
; ; emt_dec_ptn { 6' 13' }
; unknown
	bt r12,13
	jc emt_dec_ptn_0_lb_357
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*4]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_357:
; unboxed
	mov QWORD rsi,1
	bts r12,6
; emt_ptn_crt_ptn { 6' { 4' 11' } },_r163
; emt_get_crt_ptn { 6' { 4' 11' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_359
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_360
emt_get_crt_ptn_0_lb_359:
; unboxed
	stc
emt_get_crt_ptn_1_lb_360:
	mov QWORD [st_vct+8*3],rsi
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn { 4' 11' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*4],rcx
	stc
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_361
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_362
emt_get_crt_ptn_0_lb_361:
; unboxed
	stc
emt_get_crt_ptn_1_lb_362:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000
; ; emt_dec_ptn { 4' 11' }
; unknown
	bt r12,11
	jc emt_dec_ptn_0_lb_363
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*2]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_363:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 8' } },_r159
; emt_get_crt_ptn { 4' { 1' 8' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_365
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_366
emt_get_crt_ptn_0_lb_365:
; unboxed
	stc
emt_get_crt_ptn_1_lb_366:
	mov QWORD [st_vct+8*2],rcx
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn { 1' 8' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*2],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 1'
	mov QWORD [st_vct+8*3],r9
	stc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_367
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_368
emt_get_crt_ptn_0_lb_367:
; unboxed
	stc
emt_get_crt_ptn_1_lb_368:
	mov QWORD [st_vct+8*3],rax
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn { 1' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_369
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_369:
; unboxed
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 6' } },_r155
; emt_get_crt_ptn { 1' { 2' 6' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_371
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_372
emt_get_crt_ptn_0_lb_371:
; unboxed
	stc
emt_get_crt_ptn_1_lb_372:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn { 2' 6' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 2'
	mov QWORD [st_vct+8*2],r10
	stc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_373
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_374
emt_get_crt_ptn_0_lb_373:
; unboxed
	stc
emt_get_crt_ptn_1_lb_374:
	mov QWORD [st_vct+8*2],rsi
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 2' 6' }
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_375
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_375:
; unboxed
; 	$ 4' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_377
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_378
emt_set_ptn_0_lb_377:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_378:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_379
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_379:
	mov QWORD r10,0
	bts r12,2
; emt_ptn_crt_ptn { 2' {  } },_r176
; emt_get_crt_ptn { 2' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_380
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_381
emt_get_crt_ptn_0_lb_380:
; unboxed
	stc
emt_get_crt_ptn_1_lb_381:
	mov QWORD rsi,r10
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,0
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn {  }
; 	$ 4' ⊢ ,l1 : ,@[0].(⟦⟧)◂(t185'(0)) ≃ ∐[{ } { t185'(0) @[0] } ]
; emt_ptn_crt_ptn 4',l1
; emt_set_ptn 2'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_382
	push rdi
	mov rdi,rcx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_383
emt_set_ptn_0_lb_382:
	mov r10,rcx
	or r12,0b100
emt_set_ptn_1_lb_383:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_384
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_384:
; 	lst_mov { 1' 2' } ⊢ 1' : @[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
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
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
mov rsi,2

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
mov rsi,7

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
mov rsi,3

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
mov rsi,5

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
mov rsi,9

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
mov rsi,0

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
mov rsi,1

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
	bt r12,10
	call pnt
	call pnt_str_ret
mov rsi,10

           mov rdi,str_dbg
           mov rax,0
           call printf
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
; push_ex  7'~_r168 3'~_r160 5'~_r164 9'~_r172 0'~_r156 10'~_r173
	sub rsp,56
	push r14
	mov QWORD [rsp+8*6],rdi
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*4],rdx
	mov r14,[st_vct+8*0]
	mov QWORD [rsp+8*3],r14
	mov QWORD [rsp+8*2],r8
	mov r14,[st_vct+8*1]
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp],r12
	pop r14
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_385
	and r12,~0b1000
lb_385:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_386
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_387
emt_set_ptn_0_lb_386:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_387:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_388
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_389
emt_set_ptn_0_lb_388:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_389:
; ; emt_dec_ptn { 3' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_390
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
emt_dec_ptn_0_lb_390:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_391
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
emt_dec_ptn_0_lb_391:
	call _lst_mov
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
	bt r12,8
	call pnt
	call pnt_str_ret
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
	push rbx
	mov rbx,rax
	jc call_c_lb_392
; pop_s
	mov QWORD r12,[rsp]
	push r14
	mov r14,[rsp+8*1]
	mov [st_vct+8*1],r14
	mov QWORD r8,[rsp+8*2]
	mov r14,[rsp+8*3]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*4]
	mov QWORD r11,[rsp+8*5]
	mov QWORD rdi,[rsp+8*6]
	add rsp,56
	pop r14
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_397
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_398
emt_set_ptn_0_lb_397:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_398:
; ; emt_dec 
; unknown
	jc lb_396
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
lb_396:
	jmp call_nc_lb_393
call_c_lb_392:
; pop_s
	mov QWORD r12,[rsp]
	push r14
	mov r14,[rsp+8*1]
	mov [st_vct+8*1],r14
	mov QWORD r8,[rsp+8*2]
	mov r14,[rsp+8*3]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*4]
	mov QWORD r11,[rsp+8*5]
	mov QWORD rdi,[rsp+8*6]
	add rsp,56
	pop r14
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_394
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_395
emt_set_ptn_0_lb_394:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_395:
call_nc_lb_393:
	pop rbx
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_400
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_401
emt_get_crt_ptn_0_lb_400:
; unboxed
	stc
emt_get_crt_ptn_1_lb_401:
	mov QWORD r10,r9
	jc ret_lb_402
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_399
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_399:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_402:
;clear  7'~_r168 3'~_r160 5'~_r164 9'~_r172 0'~_r156 10'~_r173
	bt r12,7
	jc clear_lb_403
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_403:
	bt r12,3
	jc clear_lb_404
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_404:
	bt r12,5
	jc clear_lb_405
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_405:
	bt r12,9
	jc clear_lb_406
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_406:
	bt r12,0
	jc clear_lb_407
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_407:
	bt r12,10
	jc clear_lb_408
;push_reg
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
clear_lb_408:
	mov rax,r10
	stc
	ret
rev:
; 	|» 0'
	jz _rev
	jc emt_etr_c_lb_1
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_299
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_300
emt_set_ptn_0_lb_299:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_300:
	pop rbx
;push_reg
	push QWORD r8
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r8
	pop rbx
jmp _rev
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_297
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_298
emt_set_ptn_0_lb_297:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_298:
	pop rbx
_rev:
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' {  } },_r150
; emt_get_crt_ptn { 1' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_301
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_302
emt_get_crt_ptn_0_lb_301:
; unboxed
	stc
emt_get_crt_ptn_1_lb_302:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
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
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn {  }
; 	$ 2' ⊢ ,l1 : ,@[0].(⟦⟧)◂(t152'(0)) ≃ ∐[{ } { t152'(0) @[0] } ]
; emt_ptn_crt_ptn 2',l1
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_303
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_304
emt_set_ptn_0_lb_303:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_304:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_305
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
emt_dec_ptn_0_lb_305:
; 	lst_mov { 0' 1' } ⊢ 0' : @[0].(⟦⟧)◂(t154'(-1)) ≃ ∐[{ } { t154'(-1) @[0] } ]
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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
mov rsi,0

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
mov rsi,1

           mov rdi,str_dbg
           mov rax,0
           call printf
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
; push_ex 
	sub rsp,8
	push r14
	mov QWORD [rsp],r12
	pop r14
; emt_ptn_mov
	bts r12,3
	mov r11,r8
	bt r8,0
	jc lb_306
	and r12,~0b1000
lb_306:
	bts r12,2
	mov r10,r9
	bt r9,1
	jc lb_307
	and r12,~0b100
lb_307:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_308
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_309
emt_set_ptn_0_lb_308:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_309:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_310
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_311
emt_set_ptn_0_lb_310:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_311:
; ; emt_dec_ptn { 3' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_312
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
emt_dec_ptn_0_lb_312:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_313
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
emt_dec_ptn_0_lb_313:
	call _lst_mov
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
	bt r12,8
	call pnt
	call pnt_str_ret
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
	push rbx
	mov rbx,rax
	jc call_c_lb_314
; pop_s
	mov QWORD r12,[rsp]
	push r14
	add rsp,8
	pop r14
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_319
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_320
emt_set_ptn_0_lb_319:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_320:
; ; emt_dec 
; unknown
	jc lb_318
;push_reg
	push QWORD r8
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r8
lb_318:
	jmp call_nc_lb_315
call_c_lb_314:
; pop_s
	mov QWORD r12,[rsp]
	push r14
	add rsp,8
	pop r14
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_316
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_317
emt_set_ptn_0_lb_316:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_317:
call_nc_lb_315:
	pop rbx
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_322
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_323
emt_get_crt_ptn_0_lb_322:
; unboxed
	stc
emt_get_crt_ptn_1_lb_323:
	mov QWORD r9,r8
	jc ret_lb_324
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_321
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_321:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_324:
;clear 
	mov rax,r9
	stc
	ret
lst_mov:
; 	|» { 0' 1' }
	jz _lst_mov
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_242
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_243
emt_set_ptn_0_lb_242:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_243:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_244
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_245
emt_set_ptn_0_lb_244:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_245:
	pop rbx
	pop rbx
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
	pop rbx
jmp _lst_mov
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_238
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_239
emt_set_ptn_0_lb_238:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_239:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_240
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_241
emt_set_ptn_0_lb_240:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_241:
	pop rbx
	pop rbx
_lst_mov:
; 	? 0'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_246
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_247
emt_set_ptn_0_lb_246:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_247:
; l0=nil◂{  }
	mov r11,[r10+8*1]
	cmp r11,0
	jnz failed_lb_249
	jmp test_lb_253
failed_lb_249:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_250
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_250:
	jmp mtc_0_lb_248
test_lb_253:
	mov r11,[r10+8*2]
	bt r12,3
; emt_set_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_252
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
emt_dec_ptn_0_lb_252:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_254
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_254:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_256
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_257
emt_get_crt_ptn_0_lb_256:
; unboxed
	stc
emt_get_crt_ptn_1_lb_257:
	mov QWORD r8,r9
	jc ret_lb_258
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_255
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_255:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_258:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_248:
; 	∐\ l0 ,,l0=cns◂{ hd0 tl0 }
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_259
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_260
emt_set_ptn_0_lb_259:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_260:
; l0=cns◂{ hd0 tl0 }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_262
	jmp test_lb_270
failed_lb_262:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_263
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_263:
	jmp mtc_1_lb_261
test_lb_270:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_266
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_267
emt_set_ptn_0_lb_266:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_267:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_268
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_269
emt_set_ptn_0_lb_268:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_269:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_265
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_265:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_271
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_271:
	mov QWORD r8,1
	bts r12,0
; emt_ptn_crt_ptn { 0' { 3' 1' } },l1
; emt_get_crt_ptn { 0' { 3' 1' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD r10
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_272
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_273
emt_get_crt_ptn_0_lb_272:
; unboxed
	stc
emt_get_crt_ptn_1_lb_273:
	mov QWORD rdx,r8
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD r10
; emt_get_crt_ptn { 3' 1' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rdx,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_274
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_275
emt_get_crt_ptn_0_lb_274:
; unboxed
	stc
emt_get_crt_ptn_1_lb_275:
	mov QWORD rsi,r11
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_276
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_277
emt_get_crt_ptn_0_lb_276:
; unboxed
	stc
emt_get_crt_ptn_1_lb_277:
	mov QWORD rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn { 3' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_278
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_278:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_279
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_279:
; 	lst_mov { 4' 2' } ⊢ 0' : @[0].(⟦⟧)◂(t146'(-1)) ≃ ∐[{ } { t146'(-1) @[0] } ]
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
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
mov rsi,2

           mov rdi,str_dbg
           mov rax,0
           call printf
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
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
mov rsi,4

           mov rdi,str_dbg
           mov rax,0
           call printf
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
; push_ex 
	sub rsp,8
	push r14
	mov QWORD [rsp],r12
	pop r14
; emt_ptn_mov
; emt_ptn_set_ptn { 4' 2' },{ 0' 1' }
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_280
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_281
emt_set_ptn_0_lb_280:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_281:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_282
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_283
emt_set_ptn_0_lb_282:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_283:
; ; emt_dec_ptn { 4' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_284
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_284:
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_285
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_285:
	call _lst_mov
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
	bt r12,8
	call pnt
	call pnt_str_ret
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
	push rbx
	mov rbx,rax
	jc call_c_lb_286
; pop_s
	mov QWORD r12,[rsp]
	push r14
	add rsp,8
	pop r14
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_291
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_292
emt_set_ptn_0_lb_291:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_292:
; ; emt_dec 
; unknown
	jc lb_290
;push_reg
	push QWORD r8
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r8
lb_290:
	jmp call_nc_lb_287
call_c_lb_286:
; pop_s
	mov QWORD r12,[rsp]
	push r14
	add rsp,8
	pop r14
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_288
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_289
emt_set_ptn_0_lb_288:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_289:
call_nc_lb_287:
	pop rbx
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_294
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_295
emt_get_crt_ptn_0_lb_294:
; unboxed
	stc
emt_get_crt_ptn_1_lb_295:
	mov QWORD r9,r8
	jc ret_lb_296
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_293
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_293:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_296:
;clear 
	mov rax,r9
	stc
	ret
mtc_1_lb_261:
test2:
; 	|» {  }
	jz _test2
	jc emt_etr_c_lb_3
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
jmp _test2
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test2:
; 	$ {  } ⊢ ,_r123,_r124 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r123
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r124
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» "X" |~ 2' : ℙ
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_157+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r11,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
	mov QWORD r10,r11
	and r12,~0b100
; 	$ 1' ⊢ ,_r127,_r128 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r127
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r128
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» "Y" |~ 1' : ℙ
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_163+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
	mov QWORD r9,rdx
	and r12,~0b10
	mov QWORD rdx,0
	bts r12,5
; emt_ptn_crt_ptn { 5' {  } },_r130
; emt_get_crt_ptn { 5' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_crt_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_164
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_165
emt_get_crt_ptn_0_lb_164:
; unboxed
	stc
emt_get_crt_ptn_1_lb_165:
	mov QWORD rdi,rdx
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,0
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn {  }
	mov QWORD rdx,1
	bts r12,5
; emt_ptn_crt_ptn { 5' { 1' 6' } },_r126
; emt_get_crt_ptn { 5' { 1' 6' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_166
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_167
emt_get_crt_ptn_0_lb_166:
; unboxed
	stc
emt_get_crt_ptn_1_lb_167:
	mov QWORD rax,rdx
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn { 1' 6' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_168
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_169
emt_get_crt_ptn_0_lb_168:
; unboxed
	stc
emt_get_crt_ptn_1_lb_169:
	mov QWORD [st_vct+8*0],r9
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_170
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_171
emt_get_crt_ptn_0_lb_170:
; unboxed
	stc
emt_get_crt_ptn_1_lb_171:
	mov QWORD [st_vct+8*0],rsi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
; ; emt_dec_ptn { 1' 6' }
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_172
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_172:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_173
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_173:
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r122
; emt_get_crt_ptn { 1' { 2' 7' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rdx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdi
	push QWORD rdx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_174
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_175
emt_get_crt_ptn_0_lb_174:
; unboxed
	stc
emt_get_crt_ptn_1_lb_175:
	mov QWORD rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdi
	push QWORD rdx
; emt_get_crt_ptn { 2' 7' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rsi
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_176
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_177
emt_get_crt_ptn_0_lb_176:
; unboxed
	stc
emt_get_crt_ptn_1_lb_177:
	mov QWORD rax,r10
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rsi
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_178
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_179
emt_get_crt_ptn_0_lb_178:
; unboxed
	stc
emt_get_crt_ptn_1_lb_179:
	mov QWORD rax,rdi
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000
; ; emt_dec_ptn { 2' 7' }
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_180
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_180:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_181
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_181:
; 	$ 5' ⊢ ,l0 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 5',l0
; emt_set_ptn 1'
; unknown
	bt r12,5
	jc emt_set_ptn_0_lb_182
	push rdi
	mov rdi,rdx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_183
emt_set_ptn_0_lb_182:
	mov r9,rdx
	or r12,0b10
emt_set_ptn_1_lb_183:
; ; emt_dec_ptn 5'
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_184
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_184:
; 	$ 1' ⊢ ,l0,l1 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ],@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_185
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_186
emt_set_ptn_0_lb_185:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_186:
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 5'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_187
	push rdi
	mov rdi,r9
	call inc_r
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
	jmp emt_set_ptn_1_lb_188
emt_set_ptn_0_lb_187:
	mov rdx,r9
	or r12,0b100000
emt_set_ptn_1_lb_188:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_189
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_189:
; 	? 2'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_190
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_191
emt_set_ptn_0_lb_190:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_191:
; l0=nil◂{  }
	mov rsi,[r9+8*1]
	cmp rsi,0
	jnz failed_lb_193
	jmp test_lb_197
failed_lb_193:
;test 0
;clear  1'~l0
	bt r12,1
	jc clear_lb_194
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_194:
	jmp mtc_0_lb_192
test_lb_197:
	mov rsi,[r9+8*2]
	bt r12,6
; emt_set_ptn {  }
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_196
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_196:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_198
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_198:
; 	» "t" |~ 1' : ℙ
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_199+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,y : ,ℙ
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_200
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_201
emt_set_ptn_0_lb_200:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_201:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_202
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_202:
; 	∎ 5'
; emt_get_crt_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_204
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_205
emt_get_crt_ptn_0_lb_204:
; unboxed
	stc
emt_get_crt_ptn_1_lb_205:
	mov QWORD r9,rdx
	jc ret_lb_206
	push r9
; ; emt_dec_ptn 5'
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_203
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_203:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_206:
;clear  2'~y 3'~_r127 4'~_r128 0'~_r123
	bt r12,2
	jc clear_lb_207
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_207:
	bt r12,3
	jc clear_lb_208
;push_reg
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r8
clear_lb_208:
	bt r12,4
	jc clear_lb_209
;push_reg
	push QWORD r8
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_209:
	bt r12,0
	jc clear_lb_210
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_210:
	mov rax,r9
	stc
	ret
mtc_0_lb_192:
; 	∐\ l0 ,,l0=cns◂{ hd tl }
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_211
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_212
emt_set_ptn_0_lb_211:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_212:
; l0=cns◂{ hd tl }
	mov rax,[r9+8*1]
	cmp rax,1
	jnz failed_lb_214
	jmp test_lb_222
failed_lb_214:
;test 0
;clear  1'~l0
	bt r12,1
	jc clear_lb_215
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_215:
	jmp mtc_1_lb_213
test_lb_222:
	mov rax,[r9+8*2]
	bt r12,8
; emt_set_ptn { 6' 7' }
	push rax
	push r14
	mov r14,[rax]
	bt r14,0
	mov rax,[rax+8*1]
	pop r14
; emt_set_ptn 6'
; unknown
	jc emt_set_ptn_0_lb_218
	push rdi
	mov rdi,rax
	call inc_r
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
	jmp emt_set_ptn_1_lb_219
emt_set_ptn_0_lb_218:
	mov rsi,rax
	or r12,0b1000000
emt_set_ptn_1_lb_219:
	pop rax
	push rax
	push r14
	mov r14,[rax]
	bt r14,1
	mov rax,[rax+8*2]
	pop r14
; emt_set_ptn 7'
; unknown
	jc emt_set_ptn_0_lb_220
	mov rdi,rax
	call inc_r
	mov rdi,rdi
	and r12,~0b10000000
	jmp emt_set_ptn_1_lb_221
emt_set_ptn_0_lb_220:
	mov rdi,rax
	or r12,0b10000000
emt_set_ptn_1_lb_221:
	pop rax
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_217
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_217:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_223
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_223:
; 	» "f" |~ 1' : ℙ
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_224+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,y : ,ℙ
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_225
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_226
emt_set_ptn_0_lb_225:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_226:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_227
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_227:
; 	∎ 7'
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_229
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_230
emt_get_crt_ptn_0_lb_229:
; unboxed
	stc
emt_get_crt_ptn_1_lb_230:
	mov QWORD r9,rdi
	jc ret_lb_231
	push r9
; ; emt_dec_ptn 7'
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_228
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_228:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_231:
;clear  2'~y 6'~hd 3'~_r127 5'~l1 4'~_r128 0'~_r123
	bt r12,2
	jc clear_lb_232
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_232:
	bt r12,6
	jc clear_lb_233
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_233:
	bt r12,3
	jc clear_lb_234
;push_reg
	push QWORD r8
	push QWORD rcx
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r8
clear_lb_234:
	bt r12,5
	jc clear_lb_235
;push_reg
	push QWORD r8
	push QWORD rcx
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r8
clear_lb_235:
	bt r12,4
	jc clear_lb_236
;push_reg
	push QWORD r8
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_236:
	bt r12,0
	jc clear_lb_237
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_237:
	mov rax,r9
	stc
	ret
mtc_1_lb_213:
test5:
; 	|» {  }
	jz _test5
	jc emt_etr_c_lb_4
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
jmp _test5
emt_etr_c_lb_4:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test5:
; 	$ {  } ⊢ ,_r85,_r86 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r85
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r86
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xr45 |~ 2' : r64
	mov QWORD r11,0x45
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r89,_r90 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r89
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r90
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrff |~ 1' : r64
	mov QWORD rdx,0xff
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r93,_r94 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r93
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r94
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr233 |~ 4' : r64
	mov QWORD rdi,0x233
	mov QWORD rcx,rdi
	or r12,0b10000
; 	$ 6' ⊢ ,_r97,_r98 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r97
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r98
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; ; emt_dec_ptn 6'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrfaa |~ 6' : r64
	mov QWORD [st_vct+8*0],0xfaa
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD rsi,r14
	pop r14
	or r12,0b1000000
; 	$ 8' ⊢ ,_r101,_r102 : ,{ },{ }
; emt_ptn_crt_ptn 8',_r101
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; emt_ptn_crt_ptn 8',_r102
; emt_set_ptn 10'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*1],rdi
	pop rdi
	and r12,~0b10000000000
; ; emt_dec_ptn 8'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr5324 |~ 8' : r64
	mov QWORD [st_vct+8*2],0x5324
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD rax,r14
	pop r14
	or r12,0b100000000
; 	$ 10' ⊢ ,_r105,_r106 : ,{ },{ }
; emt_ptn_crt_ptn 10',_r105
; emt_set_ptn 11'
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
; test 1
	mov [st_vct+8*2],rdi
	pop rdi
	and r12,~0b100000000000
; emt_ptn_crt_ptn 10',_r106
; emt_set_ptn 12'
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
; test 1
	mov [st_vct+8*3],rdi
	pop rdi
	and r12,~0b1000000000000
; ; emt_dec_ptn 10'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr3344444 |~ 10' : r64
	mov QWORD [st_vct+8*4],0x3344444
	push r14
	mov QWORD r14,[st_vct+8*4]
	mov QWORD [st_vct+8*1],r14
	pop r14
	or r12,0b10000000000
; 	$ 12' ⊢ ,_r109,_r110 : ,{ },{ }
; emt_ptn_crt_ptn 12',_r109
; emt_set_ptn 13'
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
; test 1
	mov [st_vct+8*4],rdi
	pop rdi
	and r12,~0b10000000000000
; emt_ptn_crt_ptn 12',_r110
; emt_set_ptn 14'
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
; test 1
	mov [st_vct+8*5],rdi
	pop rdi
	and r12,~0b100000000000000
; ; emt_dec_ptn 12'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrffff |~ 12' : r64
	mov QWORD [st_vct+8*6],0xffff
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*3],r14
	pop r14
	or r12,0b1000000000000
	mov QWORD [st_vct+8*6],0
	bts r12,15
; emt_ptn_crt_ptn { 15' {  } },_r112
; emt_get_crt_ptn { 15' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*7],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 15'
	bt r12,15
	jc emt_get_crt_ptn_0_lb_98
; boxed
	push rdi
	mov rdi,[st_vct+8*6]
	call inc_r
	mov [st_vct+8*6],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_99
emt_get_crt_ptn_0_lb_98:
; unboxed
	stc
emt_get_crt_ptn_1_lb_99:
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*8],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*8],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000000000
; ; emt_dec_ptn {  }
	mov QWORD [st_vct+8*6],1
	bts r12,15
; emt_ptn_crt_ptn { 15' { 12' 16' } },_r108
; emt_get_crt_ptn { 15' { 12' 16' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*8],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*8]
; emt_get_crt_ptn 15'
	bt r12,15
	jc emt_get_crt_ptn_0_lb_100
; boxed
	push rdi
	mov rdi,[st_vct+8*6]
	call inc_r
	mov [st_vct+8*6],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_101
emt_get_crt_ptn_0_lb_100:
; unboxed
	stc
emt_get_crt_ptn_1_lb_101:
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*9],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*8],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*8]
; emt_get_crt_ptn { 12' 16' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*9],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*9]
; emt_get_crt_ptn 12'
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*10],r14
	pop r14
	stc
; test x0
	mov rdx,[st_vct+8*10]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*9],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*9]
; emt_get_crt_ptn 16'
	bt r12,16
	jc emt_get_crt_ptn_0_lb_102
; boxed
	push rdi
	mov rdi,[st_vct+8*7]
	call inc_r
	mov [st_vct+8*7],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_103
emt_get_crt_ptn_0_lb_102:
; unboxed
	stc
emt_get_crt_ptn_1_lb_103:
	push r14
	mov QWORD r14,[st_vct+8*7]
	mov QWORD [st_vct+8*10],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*10]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*9],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*8],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000000000000
; ; emt_dec_ptn { 12' 16' }
; unknown
	bt r12,16
	jc emt_dec_ptn_0_lb_104
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*7]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_104:
; unboxed
	mov QWORD [st_vct+8*3],1
	bts r12,12
; emt_ptn_crt_ptn { 12' { 10' 17' } },_r104
; emt_get_crt_ptn { 12' { 10' 17' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*6],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_106
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_107
emt_get_crt_ptn_0_lb_106:
; unboxed
	stc
emt_get_crt_ptn_1_lb_107:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*7],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn { 10' 17' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*7],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 10'
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*9],r14
	pop r14
	stc
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 17'
	bt r12,17
	jc emt_get_crt_ptn_0_lb_108
; boxed
	push rdi
	mov rdi,[st_vct+8*8]
	call inc_r
	mov [st_vct+8*8],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_109
emt_get_crt_ptn_0_lb_108:
; unboxed
	stc
emt_get_crt_ptn_1_lb_109:
	push r14
	mov QWORD r14,[st_vct+8*8]
	mov QWORD [st_vct+8*9],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000000
; ; emt_dec_ptn { 10' 17' }
; unknown
	bt r12,17
	jc emt_dec_ptn_0_lb_110
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*8]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_110:
; unboxed
	mov QWORD [st_vct+8*1],1
	bts r12,10
; emt_ptn_crt_ptn { 10' { 8' 15' } },_r100
; emt_get_crt_ptn { 10' { 8' 15' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_112
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_113
emt_get_crt_ptn_0_lb_112:
; unboxed
	stc
emt_get_crt_ptn_1_lb_113:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*7],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn { 8' 15' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*7],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 8'
	mov QWORD [st_vct+8*8],rax
	stc
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 15'
	bt r12,15
	jc emt_get_crt_ptn_0_lb_114
; boxed
	push rdi
	mov rdi,[st_vct+8*6]
	call inc_r
	mov [st_vct+8*6],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_115
emt_get_crt_ptn_0_lb_114:
; unboxed
	stc
emt_get_crt_ptn_1_lb_115:
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*8],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000
; ; emt_dec_ptn { 8' 15' }
; unknown
	bt r12,15
	jc emt_dec_ptn_0_lb_116
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*6]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_116:
; unboxed
	mov QWORD rax,1
	bts r12,8
; emt_ptn_crt_ptn { 8' { 6' 12' } },_r96
; emt_get_crt_ptn { 8' { 6' 12' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_118
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_119
emt_get_crt_ptn_0_lb_118:
; unboxed
	stc
emt_get_crt_ptn_1_lb_119:
	mov QWORD [st_vct+8*6],rax
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn { 6' 12' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*6],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn 6'
	mov QWORD [st_vct+8*7],rsi
	stc
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_120
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_121
emt_get_crt_ptn_0_lb_120:
; unboxed
	stc
emt_get_crt_ptn_1_lb_121:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*7],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000
; ; emt_dec_ptn { 6' 12' }
; unknown
	bt r12,12
	jc emt_dec_ptn_0_lb_122
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_122:
; unboxed
	mov QWORD rsi,1
	bts r12,6
; emt_ptn_crt_ptn { 6' { 4' 10' } },_r92
; emt_get_crt_ptn { 6' { 4' 10' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_124
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_125
emt_get_crt_ptn_0_lb_124:
; unboxed
	stc
emt_get_crt_ptn_1_lb_125:
	mov QWORD [st_vct+8*3],rsi
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn { 4' 10' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*6],rcx
	stc
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_126
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_127
emt_get_crt_ptn_0_lb_126:
; unboxed
	stc
emt_get_crt_ptn_1_lb_127:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*6],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000
; ; emt_dec_ptn { 4' 10' }
; unknown
	bt r12,10
	jc emt_dec_ptn_0_lb_128
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_128:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 8' } },_r88
; emt_get_crt_ptn { 4' { 1' 8' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_130
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_131
emt_get_crt_ptn_0_lb_130:
; unboxed
	stc
emt_get_crt_ptn_1_lb_131:
	mov QWORD [st_vct+8*1],rcx
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn { 1' 8' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 1'
	mov QWORD [st_vct+8*3],r9
	stc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_132
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_133
emt_get_crt_ptn_0_lb_132:
; unboxed
	stc
emt_get_crt_ptn_1_lb_133:
	mov QWORD [st_vct+8*3],rax
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn { 1' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_134
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_134:
; unboxed
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 6' } },_r84
; emt_get_crt_ptn { 1' { 2' 6' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_136
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_137
emt_get_crt_ptn_0_lb_136:
; unboxed
	stc
emt_get_crt_ptn_1_lb_137:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn { 2' 6' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 2'
	mov QWORD [st_vct+8*1],r10
	stc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_138
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_139
emt_get_crt_ptn_0_lb_138:
; unboxed
	stc
emt_get_crt_ptn_1_lb_139:
	mov QWORD [st_vct+8*1],rsi
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 2' 6' }
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_140
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_140:
; unboxed
; 	$ 4' ⊢ ,l : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 4',l
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_142
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_143
emt_set_ptn_0_lb_142:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_143:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_144
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_144:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_146
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_147
emt_get_crt_ptn_0_lb_146:
; unboxed
	stc
emt_get_crt_ptn_1_lb_147:
	mov QWORD r10,r9
	jc ret_lb_148
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_145
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_145:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_148:
;clear  14'~_r110 7'~_r97 3'~_r89 13'~_r109 5'~_r93 9'~_r101 11'~_r105 0'~_r85
	bt r12,14
	jc clear_lb_149
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,[st_vct+8*5]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_149:
	bt r12,7
	jc clear_lb_150
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_150:
	bt r12,3
	jc clear_lb_151
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_151:
	bt r12,13
	jc clear_lb_152
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,[st_vct+8*4]
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_152:
	bt r12,5
	jc clear_lb_153
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_153:
	bt r12,9
	jc clear_lb_154
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_154:
	bt r12,11
	jc clear_lb_155
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*2]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_155:
	bt r12,0
	jc clear_lb_156
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_156:
	mov rax,r10
	stc
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_5
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
jmp _test4
emt_etr_c_lb_5:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test4:
; 	» "a" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_52+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_53
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_54
emt_set_ptn_0_lb_53:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_54:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_55
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_55:
; 	» "b" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_56+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_57
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_58
emt_set_ptn_0_lb_57:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_58:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_59
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
emt_dec_ptn_0_lb_59:
; 	$ { 1' 2' } ⊢ ,{ s0 _ } : ,{ ℙ ℙ }
; emt_ptn_crt_ptn { 1' 2' },{ s0 _ }
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_60
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_61
emt_set_ptn_0_lb_60:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_61:
; emt_ptn_crt_ptn 2',_
; emt_set_ptn -2'
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_62
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
emt_dec_ptn_0_lb_62:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_63
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
emt_dec_ptn_0_lb_63:
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_65
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_66
emt_get_crt_ptn_0_lb_65:
; unboxed
	stc
emt_get_crt_ptn_1_lb_66:
	mov QWORD r9,r8
	jc ret_lb_67
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_64
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_64:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_67:
;clear 
	mov rax,r9
	stc
	ret
test3:
; 	|» {  }
	jz _test3
	jc emt_etr_c_lb_6
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
jmp _test3
emt_etr_c_lb_6:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test3:
; 	» 0xrff |~ 0' : r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,s0 : ,r64
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	? 1'
; 	∐\ s0 ,,s0=0xra4
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; s0=0xra4
	mov QWORD r10,0xa4
	cmp r8,r10
	jnz failed_lb_13
	jmp test_r64_lb_15
failed_lb_13:
;clear  0'~s0
	bt r12,0
	jc clear_lb_14
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_14:
	jmp mtc_0_lb_12
test_r64_lb_15:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "a" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_18+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_19
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_20
emt_set_ptn_0_lb_19:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_20:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_21
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_21:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_23
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_24
emt_get_crt_ptn_0_lb_23:
; unboxed
	stc
emt_get_crt_ptn_1_lb_24:
	mov QWORD r8,r9
	jc ret_lb_25
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_22
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_22:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_25:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_12:
; 	∐\ s0 ,,s0=0xrff
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; s0=0xrff
	mov QWORD r10,0xff
	cmp r8,r10
	jnz failed_lb_29
	jmp test_r64_lb_31
failed_lb_29:
;clear  0'~s0
	bt r12,0
	jc clear_lb_30
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_30:
	jmp mtc_1_lb_28
test_r64_lb_31:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "b" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_34+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_35
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_36
emt_set_ptn_0_lb_35:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_36:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_37
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_37:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_39
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_40
emt_get_crt_ptn_0_lb_39:
; unboxed
	stc
emt_get_crt_ptn_1_lb_40:
	mov QWORD r8,r9
	jc ret_lb_41
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_38
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_38:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_41:
;clear 
	mov rax,r8
	stc
	ret
mtc_1_lb_28:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unboxed
; 	» "c" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_44+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_45
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_46
emt_set_ptn_0_lb_45:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_46:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_47
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_47:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_49
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_50
emt_get_crt_ptn_0_lb_49:
; unboxed
	stc
emt_get_crt_ptn_1_lb_50:
	mov QWORD r8,r9
	jc ret_lb_51
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_48
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_48:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_51:
;clear 
	mov rax,r8
	stc
	ret
mtc_2_lb_42:
section .data
	cst_stg_224: db "f",0,0,0,0,0,0,0
	cst_stg_199: db "t",0,0,0,0,0,0,0
	cst_stg_163: db "Y",0,0,0,0,0,0,0
	cst_stg_157: db "X",0,0,0,0,0,0,0
	cst_stg_56: db "b",0,0,0,0,0,0,0
	cst_stg_52: db "a",0,0,0,0,0,0,0
	cst_stg_44: db "c",0,0,0,0,0,0,0
	cst_stg_34: db "b",0,0,0,0,0,0,0
	cst_stg_18: db "a",0,0,0,0,0,0,0
