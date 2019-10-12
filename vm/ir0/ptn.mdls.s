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
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test6
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test6:
; 	$ {  } ⊢ ,_r131,_r132 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r131
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r132
; emt_get_ptn {  }
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» "a" |~ 2' : ℙ
	push QWORD r8
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_246+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r11,rdi
	pop QWORD r9
	pop QWORD r8
	mov QWORD r10,r11
	and r12,~0b100
; 	$ 1' ⊢ ,_r135,_r136 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r135
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r136
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» "b" |~ 1' : ℙ
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_252+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
	mov QWORD r9,rdx
	and r12,~0b10
; 	$ 4' ⊢ ,_r139,_r140 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r139
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r140
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» "c" |~ 4' : ℙ
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_258+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD rdi,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	mov QWORD rcx,rdi
	and r12,~0b10000
; nil
; emt_ptn_crt_ptn {  },_r195
; emt_get_ptn {  }
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
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
; ; emt_dec_ptn {  }
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
	btr r12,7
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD rdi,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; cns
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
	mov rdi,rsi
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
mov rsi,6

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
; emt_ptn_crt_ptn { 4' 7' },_r198
; emt_get_ptn { 4' 7' }
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
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_259
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_260
emt_get_crt_ptn_0_lb_259:
; unboxed
	stc
emt_get_crt_ptn_1_lb_260:
	mov [st_vct+8*0],rcx
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_261
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_262
emt_get_crt_ptn_0_lb_261:
; unboxed
	stc
emt_get_crt_ptn_1_lb_262:
	mov [st_vct+8*0],rdi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
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
	call hw
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
; ; emt_dec_ptn { 4' 7' }
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_263
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rdi
	call dec_r
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_263:
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_264
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rcx
	call dec_r
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_264:
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,8
	call exc
	mov QWORD rcx,rdi
	btr r12,4
	call hw
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
; test 0
	bt r12,4
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
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; cns
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
	mov rdi,rsi
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
mov rsi,6

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
; emt_ptn_crt_ptn { 1' 4' },_r200
; emt_get_ptn { 1' 4' }
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
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_266
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_267
emt_get_crt_ptn_0_lb_266:
; unboxed
	stc
emt_get_crt_ptn_1_lb_267:
	mov rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rdi,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_268
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_269
emt_get_crt_ptn_0_lb_268:
; unboxed
	stc
emt_get_crt_ptn_1_lb_269:
	mov rax,rcx
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rdi,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
	call hw
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
; test 0
	bt r12,7
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
; ; emt_dec_ptn { 1' 4' }
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_270
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rcx
	call dec_r
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_270:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_271
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
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_271:
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,7
	call exc
	mov QWORD r9,rdi
	btr r12,1
	call hw
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
; test 0
	bt r12,1
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
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
; cns
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
	mov rdi,rsi
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
mov rsi,6

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
; emt_ptn_crt_ptn { 2' 1' },_r202
; emt_get_ptn { 2' 1' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rcx,rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rcx
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_273
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_274
emt_get_crt_ptn_0_lb_273:
; unboxed
	stc
emt_get_crt_ptn_1_lb_274:
	mov rdi,r10
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rcx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_275
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_276
emt_get_crt_ptn_0_lb_275:
; unboxed
	stc
emt_get_crt_ptn_1_lb_276:
	mov rdi,r9
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
	call hw
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
; test 0
	bt r12,4
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
; ; emt_dec_ptn { 2' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_277
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_277:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_278
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r10
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_278:
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,4
	call exc
	mov QWORD r9,rdi
	btr r12,1
	call hw
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
; test 0
	bt r12,1
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
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
; 	$ 1' ⊢ ,l0 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_280
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_281
emt_set_ptn_0_lb_280:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_281:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_282
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_282:
; nil
; emt_ptn_crt_ptn {  },_r204
; emt_get_ptn {  }
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,0
	call mlc
	mov r9,rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD r9
	mov rdi,2
	call mlc
	btr r12,1
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD r9,rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
; 	$ 1' ⊢ ,l1 : ,@[0].(⟦⟧)◂(t150'(0)) ≃ ∐[{ } { t150'(0) @[0] } ]
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 4'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_283
	push rdi
	mov rdi,r9
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_284
emt_set_ptn_0_lb_283:
	mov rcx,r9
	or r12,0b10000
emt_set_ptn_1_lb_284:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_285
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_285:
; 	lst_mov { 2' 4' } ⊢ 1' : @[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; push_s  6'~_r140 3'~_r135 5'~_r139 0'~_r131
	sub rsp,40
	mov QWORD [rsp+8*4],rsi
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*2],rdx
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
; emt_ptn_mov
; emt_ptn_set_ptn { 2' 4' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_291
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_292
emt_set_ptn_0_lb_291:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_292:
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_293
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_294
emt_set_ptn_0_lb_293:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_294:
; ; emt_dec_ptn { 2' 4' }
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_286
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,rcx
	call dec_r
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_286:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_287
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r10
	call dec_r
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_287:
	push rbx
	call _lst_mov
	mov rbx,rax
	shl r14,1
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_289
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_290
emt_set_ptn_0_lb_289:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_290:
	shr r14,1
; ; emt_dec 
; unknown
	jc lb_288
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,rbx
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
lb_288:
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	mov QWORD r8,[rsp+8*1]
	mov QWORD rdx,[rsp+8*2]
	mov QWORD r11,[rsp+8*3]
	mov QWORD rsi,[rsp+8*4]
	add rsp,40
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_296
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_297
emt_get_crt_ptn_0_lb_296:
; unboxed
	stc
emt_get_crt_ptn_1_lb_297:
	mov r10,r9
	jc ret_lb_298
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_295
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_295:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_298:
;clear  6'~_r140 3'~_r135 5'~_r139 0'~_r131
	bt r12,6
	jc clear_lb_299
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rsi
	call dec_r
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_299:
	bt r12,3
	jc clear_lb_300
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
	pop QWORD rdx
	pop QWORD r8
clear_lb_300:
	bt r12,5
	jc clear_lb_301
	push QWORD r8
	mov rdi,rdx
	call dec_r
	pop QWORD r8
clear_lb_301:
	bt r12,0
	jc clear_lb_302
	mov rdi,r8
	call dec_r
clear_lb_302:
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
	jc emt_set_ptn_0_lb_227
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_228
emt_set_ptn_0_lb_227:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_228:
	pop rbx
	push QWORD r8
	mov rdi,rbx
	call dec_r
	pop QWORD r8
	pop rbx
jmp _rev
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_225
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_226
emt_set_ptn_0_lb_225:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_226:
	pop rbx
_rev:
; nil
; emt_ptn_crt_ptn {  },_r185
; emt_get_ptn {  }
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
	push QWORD r8
	push QWORD r9
	mov rdi,2
	call mlc
	btr r12,1
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD r9,rdi
	pop QWORD r8
; 	$ 1' ⊢ ,l1 : ,@[0].(⟦⟧)◂(t127'(0)) ≃ ∐[{ } { t127'(0) @[0] } ]
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_229
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_230
emt_set_ptn_0_lb_229:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_230:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_231
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_231:
; 	lst_mov { 0' 2' } ⊢ 0' : @[0].(⟦⟧)◂(t129'(-1)) ≃ ∐[{ } { t129'(-1) @[0] } ]
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
	bts r12,3
	mov r11,r8
	bt r8,0
	jc lb_232
	and r12,~0b1000
lb_232:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_238
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_239
emt_set_ptn_0_lb_238:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_239:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_240
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_241
emt_set_ptn_0_lb_240:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_241:
; ; emt_dec_ptn { 3' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_233
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_233:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_234
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_234:
	push rbx
	call _lst_mov
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_236
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_237
emt_set_ptn_0_lb_236:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_237:
	shr r14,1
; ; emt_dec 
; unknown
	jc lb_235
	push QWORD r8
	mov rdi,rbx
	call dec_r
	pop QWORD r8
lb_235:
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	∎ 0'
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_243
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_244
emt_get_crt_ptn_0_lb_243:
; unboxed
	stc
emt_get_crt_ptn_1_lb_244:
	mov r9,r8
	jc ret_lb_245
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_242
	push QWORD r8
	mov rdi,r8
	call dec_r
	pop QWORD r8
emt_dec_ptn_0_lb_242:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_245:
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
	jc emt_set_ptn_0_lb_174
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_175
emt_set_ptn_0_lb_174:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_175:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_176
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_177
emt_set_ptn_0_lb_176:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_177:
	pop rbx
	pop rbx
	push QWORD r8
	push QWORD r9
	mov rdi,rbx
	call dec_r
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
	jc emt_set_ptn_0_lb_170
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_171
emt_set_ptn_0_lb_170:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_171:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_172
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_173
emt_set_ptn_0_lb_172:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_173:
	pop rbx
	pop rbx
_lst_mov:
; 	? 0'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_178
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_179
emt_set_ptn_0_lb_178:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_179:
; l0=nil◂{  }
	mov r11,[r10+8*1]
	cmp r11,0
	jnz failed_lb_181
	jmp test_lb_185
failed_lb_181:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_182
	mov rdi,r10
	call dec_r
clear_lb_182:
	jmp mtc_0_lb_180
test_lb_185:
	mov r11,[r10+8*2]
	bt r12,3
; emt_set_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_184
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_184:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_186
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_186:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_188
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_189
emt_get_crt_ptn_0_lb_188:
; unboxed
	stc
emt_get_crt_ptn_1_lb_189:
	mov r8,r9
	jc ret_lb_190
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_187
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_187:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_190:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_180:
; 	∐\ l0 ,,l0=cns◂{ hd0 tl0 }
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_191
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_192
emt_set_ptn_0_lb_191:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_192:
; l0=cns◂{ hd0 tl0 }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_194
	jmp test_lb_202
failed_lb_194:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_195
	mov rdi,r10
	call dec_r
clear_lb_195:
	jmp mtc_1_lb_193
test_lb_202:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_198
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_199
emt_set_ptn_0_lb_198:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_199:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_200
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_201
emt_set_ptn_0_lb_200:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_201:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_197
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_197:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_203
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_203:
; cns
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
; emt_ptn_crt_ptn { 3' 1' },_r177
; emt_get_ptn { 3' 1' }
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov r8,rax
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
; test x1
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD r8
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_204
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_205
emt_get_crt_ptn_0_lb_204:
; unboxed
	stc
emt_get_crt_ptn_1_lb_205:
	mov r10,r11
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,0
	call exc
	mov r8,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
; test x1
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD r8
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_206
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_207
emt_get_crt_ptn_0_lb_206:
; unboxed
	stc
emt_get_crt_ptn_1_lb_207:
	mov r10,r9
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,1
	call exc
	mov r8,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	clc
	and r12,~0b1
	call hw
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
; test 0
	bt r12,0
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
; ; emt_dec_ptn { 3' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_208
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_208:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_209
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_209:
	push QWORD rcx
	push QWORD r8
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,0
	call exc
	mov QWORD r8,rdi
	btr r12,0
	call hw
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
; test 0
	bt r12,0
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
	pop QWORD rcx
; 	lst_mov { 4' 0' } ⊢ 0' : @[0].(⟦⟧)◂(t121'(-1)) ≃ ∐[{ } { t121'(-1) @[0] } ]
; push_s 
	sub rsp,8
	mov QWORD [rsp],r12
; emt_ptn_mov
	bts r12,2
	mov r10,r8
	bt r8,0
	jc lb_211
	and r12,~0b100
lb_211:
; emt_ptn_set_ptn { 4' 2' },{ 0' 1' }
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_217
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_218
emt_set_ptn_0_lb_217:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_218:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_219
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_220
emt_set_ptn_0_lb_219:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_220:
; ; emt_dec_ptn { 4' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_212
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r10
	call dec_r
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_212:
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_213
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,rcx
	call dec_r
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_213:
	push rbx
	call _lst_mov
	mov rbx,rax
	shl r14,1
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_215
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_216
emt_set_ptn_0_lb_215:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_216:
	shr r14,1
; ; emt_dec 
; unknown
	jc lb_214
	push QWORD r8
	mov rdi,rbx
	call dec_r
	pop QWORD r8
lb_214:
	pop rbx
; pop_s
	mov QWORD r12,[rsp]
	add rsp,8
; 	∎ 0'
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_222
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_223
emt_get_crt_ptn_0_lb_222:
; unboxed
	stc
emt_get_crt_ptn_1_lb_223:
	mov r9,r8
	jc ret_lb_224
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_221
	push QWORD r8
	mov rdi,r8
	call dec_r
	pop QWORD r8
emt_dec_ptn_0_lb_221:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_224:
;clear 
	mov rax,r9
	stc
	ret
mtc_1_lb_193:
test2:
; 	|» {  }
	jz _test2
	jc emt_etr_c_lb_3
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test2
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test2:
; 	$ {  } ⊢ ,_r98,_r99 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r98
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r99
; emt_get_ptn {  }
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» "X" |~ 2' : ℙ
	push QWORD r8
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_93+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r11,rdi
	pop QWORD r9
	pop QWORD r8
	mov QWORD r10,r11
	and r12,~0b100
; 	$ 1' ⊢ ,_r102,_r103 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r102
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r103
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» "Y" |~ 1' : ℙ
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_99+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
	mov QWORD r9,rdx
	and r12,~0b10
; nil
; emt_ptn_crt_ptn {  },_r164
; emt_get_ptn {  }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,0
	call mlc
	mov rdx,rax
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000
; ; emt_dec_ptn {  }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	btr r12,5
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; cns
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
; emt_ptn_crt_ptn { 1' 5' },_r167
; emt_get_ptn { 1' 5' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	mov rsi,rax
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_100
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_101
emt_get_crt_ptn_0_lb_100:
; unboxed
	stc
emt_get_crt_ptn_1_lb_101:
	mov rdi,r9
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_102
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_103
emt_get_crt_ptn_0_lb_102:
; unboxed
	stc
emt_get_crt_ptn_1_lb_103:
	mov rdi,rdx
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
	call hw
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
	mov rdi,rsi
	mov rsi,str_ret
; test 0
	bt r12,6
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
; ; emt_dec_ptn { 1' 5' }
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_104
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rdx
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_104:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_105
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_105:
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,6
	call exc
	mov QWORD r9,rdi
	btr r12,1
	call hw
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
; test 0
	bt r12,1
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
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
; cns
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
; emt_ptn_crt_ptn { 2' 1' },_r169
; emt_get_ptn { 2' 1' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rdx,rax
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_107
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_108
emt_get_crt_ptn_0_lb_107:
; unboxed
	stc
emt_get_crt_ptn_1_lb_108:
	mov rsi,r10
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_109
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_110
emt_get_crt_ptn_0_lb_109:
; unboxed
	stc
emt_get_crt_ptn_1_lb_110:
	mov rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000
	call hw
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
; test 0
	bt r12,5
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
; ; emt_dec_ptn { 2' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_111
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_111:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_112
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r10
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_112:
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,5
	call exc
	mov QWORD r9,rdi
	btr r12,1
	call hw
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
; test 0
	bt r12,1
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
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
; 	$ 1' ⊢ ,l0 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_114
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_115
emt_set_ptn_0_lb_114:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_115:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_116
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_116:
; 	$ 2' ⊢ ,l0,l1 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ],@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_117
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_118
emt_set_ptn_0_lb_117:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_118:
; emt_ptn_crt_ptn 2',l1
; emt_set_ptn 5'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_119
	push rdi
	mov rdi,r10
	call inc_r
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
	jmp emt_set_ptn_1_lb_120
emt_set_ptn_0_lb_119:
	mov rdx,r10
	or r12,0b100000
emt_set_ptn_1_lb_120:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_121
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r10
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_121:
; 	? 1'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_122
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_123
emt_set_ptn_0_lb_122:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_123:
; l0=nil◂{  }
	mov rsi,[r10+8*1]
	cmp rsi,0
	jnz failed_lb_125
	jmp test_lb_129
failed_lb_125:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_126
	mov rdi,r10
	call dec_r
clear_lb_126:
	jmp mtc_0_lb_124
test_lb_129:
	mov rsi,[r10+8*2]
	bt r12,6
; emt_set_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_128
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r10
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_128:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_130
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_130:
; 	» "t" |~ 1' : ℙ
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_131+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
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
	jc emt_set_ptn_0_lb_132
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_133
emt_set_ptn_0_lb_132:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_133:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_134
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_134:
; 	∎ 5'
; emt_get_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_136
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_137
emt_get_crt_ptn_0_lb_136:
; unboxed
	stc
emt_get_crt_ptn_1_lb_137:
	mov r9,rdx
	jc ret_lb_138
	push r9
; ; emt_dec_ptn 5'
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_135
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rdx
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_135:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_138:
;clear  2'~y 3'~_r102 4'~_r103 0'~_r98
	bt r12,2
	jc clear_lb_139
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_139:
	bt r12,3
	jc clear_lb_140
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_140:
	bt r12,4
	jc clear_lb_141
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_141:
	bt r12,0
	jc clear_lb_142
	mov rdi,r8
	call dec_r
clear_lb_142:
	mov rax,r9
	stc
	ret
mtc_0_lb_124:
; 	∐\ l0 ,,l0=cns◂{ hd tl }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_143
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_144
emt_set_ptn_0_lb_143:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_144:
; l0=cns◂{ hd tl }
	mov rax,[r10+8*1]
	cmp rax,1
	jnz failed_lb_146
	jmp test_lb_154
failed_lb_146:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_147
	mov rdi,r10
	call dec_r
clear_lb_147:
	jmp mtc_1_lb_145
test_lb_154:
	mov rax,[r10+8*2]
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
	jc emt_set_ptn_0_lb_150
	push rdi
	mov rdi,rax
	call inc_r
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
	jmp emt_set_ptn_1_lb_151
emt_set_ptn_0_lb_150:
	mov rsi,rax
	or r12,0b1000000
emt_set_ptn_1_lb_151:
	pop rax
	push rax
	push r14
	mov r14,[rax]
	bt r14,1
	mov rax,[rax+8*2]
	pop r14
; emt_set_ptn 7'
; unknown
	jc emt_set_ptn_0_lb_152
	mov rdi,rax
	call inc_r
	mov rdi,rdi
	and r12,~0b10000000
	jmp emt_set_ptn_1_lb_153
emt_set_ptn_0_lb_152:
	mov rdi,rax
	or r12,0b10000000
emt_set_ptn_1_lb_153:
	pop rax
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_149
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r10
	call dec_r
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_149:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_155
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_155:
; 	» "f" |~ 1' : ℙ
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_156+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
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
	jc emt_set_ptn_0_lb_157
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_158
emt_set_ptn_0_lb_157:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_158:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_159
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
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_159:
; 	∎ 7'
; emt_get_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_161
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_162
emt_get_crt_ptn_0_lb_161:
; unboxed
	stc
emt_get_crt_ptn_1_lb_162:
	mov r9,rdi
	jc ret_lb_163
	push r9
; ; emt_dec_ptn 7'
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_160
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rdi
	call dec_r
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_160:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_163:
;clear  2'~y 6'~hd 3'~_r102 5'~l1 4'~_r103 0'~_r98
	bt r12,2
	jc clear_lb_164
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r10
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_164:
	bt r12,6
	jc clear_lb_165
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rsi
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_165:
	bt r12,3
	jc clear_lb_166
	push QWORD r8
	push QWORD rcx
	push QWORD rdx
	mov rdi,r11
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r8
clear_lb_166:
	bt r12,5
	jc clear_lb_167
	push QWORD r8
	push QWORD rcx
	mov rdi,rdx
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_167:
	bt r12,4
	jc clear_lb_168
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_168:
	bt r12,0
	jc clear_lb_169
	mov rdi,r8
	call dec_r
clear_lb_169:
	mov rax,r9
	stc
	ret
mtc_1_lb_145:
test5:
; 	|» {  }
	jz _test5
	jc emt_etr_c_lb_4
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
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
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r86
; emt_get_ptn {  }
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrff |~ 1' : r64
	mov QWORD rdx,0xff
	mov QWORD r9,rdx
	or r12,0b10
; nil
; emt_ptn_crt_ptn {  },_r155
; emt_get_ptn {  }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,0
	call mlc
	mov rdx,rax
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000
; ; emt_dec_ptn {  }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	btr r12,5
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; cns
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
; emt_ptn_crt_ptn { 1' 5' },_r158
; emt_get_ptn { 1' 5' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	mov rsi,rax
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 1'
	mov rdi,r9
	stc
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_73
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_74
emt_get_crt_ptn_0_lb_73:
; unboxed
	stc
emt_get_crt_ptn_1_lb_74:
	mov rdi,rdx
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
	call hw
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
	mov rdi,rsi
	mov rsi,str_ret
; test 0
	bt r12,6
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
; ; emt_dec_ptn { 1' 5' }
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_75
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rdx
	call dec_r
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_75:
; unboxed
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,6
	call exc
	mov QWORD r9,rdi
	btr r12,1
	call hw
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
; test 0
	bt r12,1
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
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
; cns
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
; emt_ptn_crt_ptn { 2' 1' },_r160
; emt_get_ptn { 2' 1' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rdx,rax
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_ptn 2'
	mov rsi,r10
	stc
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_78
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_79
emt_get_crt_ptn_0_lb_78:
; unboxed
	stc
emt_get_crt_ptn_1_lb_79:
	mov rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000
	call hw
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
; test 0
	bt r12,5
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
; ; emt_dec_ptn { 2' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_80
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_80:
; unboxed
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	mov rdi,rax
	call hw
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
	clc
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
	mov rsi,0
	mov rdx,1
	stc
	call exc
	mov rsi,1
	call hw
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
	clc
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
	pop rdx
	bt r12,5
	call exc
	mov QWORD r9,rdi
	btr r12,1
	call hw
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
; test 0
	bt r12,1
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
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
; 	$ 1' ⊢ ,l : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 1',l
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_83
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_84
emt_set_ptn_0_lb_83:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_84:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_85
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_85:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_87
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_88
emt_get_crt_ptn_0_lb_87:
; unboxed
	stc
emt_get_crt_ptn_1_lb_88:
	mov r9,r10
	jc ret_lb_89
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_86
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_86:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_89:
;clear  3'~_r89 4'~_r90 0'~_r85
	bt r12,3
	jc clear_lb_90
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_90:
	bt r12,4
	jc clear_lb_91
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_91:
	bt r12,0
	jc clear_lb_92
	mov rdi,r8
	call dec_r
clear_lb_92:
	mov rax,r9
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
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test4
emt_etr_c_lb_5:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test4:
; 	» "a" |~ 0' : ℙ
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
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_55:
; 	» "b" |~ 0' : ℙ
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_62:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_63
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_63:
; 	∎ 0'
; emt_get_ptn 0'
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
	mov r9,r8
	jc ret_lb_67
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_64
	push QWORD r8
	mov rdi,r8
	call dec_r
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
	mov rdi,rbx
	call dec_r
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
	mov rdi,r8
	call dec_r
clear_lb_14:
	jmp mtc_0_lb_12
test_r64_lb_15:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "a" |~ 0' : ℙ
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
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_21:
; 	∎ 1'
; emt_get_ptn 1'
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
	mov r8,r9
	jc ret_lb_25
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_22
	push QWORD r9
	mov rdi,r9
	call dec_r
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
	mov rdi,r8
	call dec_r
clear_lb_30:
	jmp mtc_1_lb_28
test_r64_lb_31:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "b" |~ 0' : ℙ
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
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_37:
; 	∎ 1'
; emt_get_ptn 1'
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
	mov r8,r9
	jc ret_lb_41
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_38
	push QWORD r9
	mov rdi,r9
	call dec_r
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
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_47:
; 	∎ 1'
; emt_get_ptn 1'
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
	mov r8,r9
	jc ret_lb_51
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_48
	push QWORD r9
	mov rdi,r9
	call dec_r
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
	cst_stg_258: db "c",0,0,0,0,0,0,0
	cst_stg_252: db "b",0,0,0,0,0,0,0
	cst_stg_246: db "a",0,0,0,0,0,0,0
	cst_stg_156: db "f",0,0,0,0,0,0,0
	cst_stg_131: db "t",0,0,0,0,0,0,0
	cst_stg_99: db "Y",0,0,0,0,0,0,0
	cst_stg_93: db "X",0,0,0,0,0,0,0
	cst_stg_56: db "b",0,0,0,0,0,0,0
	cst_stg_52: db "a",0,0,0,0,0,0,0
	cst_stg_44: db "c",0,0,0,0,0,0,0
	cst_stg_34: db "b",0,0,0,0,0,0,0
	cst_stg_18: db "a",0,0,0,0,0,0,0
