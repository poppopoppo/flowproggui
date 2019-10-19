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
	call f5
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f5:
; 	|» {  }
	jz _f5
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
jmp _f5
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f5:
	mov rbx,[sgn_ctr]
	mov r8,rbx
	bts r12,0
	add rbx,1
	mov [sgn_ctr],rbx
	mov rbx,[sgn_ctr]
	mov r9,rbx
	bts r12,1
	add rbx,1
	mov [sgn_ctr],rbx
	mov rbx,[sgn_ctr]
	mov r10,rbx
	bts r12,2
	add rbx,1
	mov [sgn_ctr],rbx
; 	∎ { 0' 1' 2' }
; emt_get_crt_ptn { 0' 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,3
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_304
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_305
emt_get_crt_ptn_0_lb_304:
; unboxed
	stc
emt_get_crt_ptn_1_lb_305:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_306
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_307
emt_get_crt_ptn_0_lb_306:
; unboxed
	stc
emt_get_crt_ptn_1_lb_307:
	mov QWORD rcx,r9
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_308
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_309
emt_get_crt_ptn_0_lb_308:
; unboxed
	stc
emt_get_crt_ptn_1_lb_309:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,2
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_310
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_301
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
emt_dec_ptn_0_lb_301:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_302
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
emt_dec_ptn_0_lb_302:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_303
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
emt_dec_ptn_0_lb_303:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_310:
;clear 
	mov rax,r11
	stc
	ret
f4:
; 	|» {  }
	jz _f4
	jc emt_etr_c_lb_1
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
jmp _f4
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f4:
; 	» 0xr33 |~ 0' : r64
	mov QWORD r9,0x33
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,r64
; emt_ptn_crt_ptn 0',x0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr45 |~ 0' : r64
	mov QWORD r10,0x45
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x1 : ,r64
; emt_ptn_crt_ptn 0',x1
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» 0xr33 |~ 0' : r64
	mov QWORD r11,0x33
	mov QWORD r8,r11
	or r12,0b1
; 	$ 0' ⊢ ,x2 : ,r64
; emt_ptn_crt_ptn 0',x2
; emt_set_ptn 3'
; unboxed
	mov r11,r8
; ; emt_dec_ptn 0'
; unboxed
; 	$ {  } ⊢ ,_r166,_r167 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r166
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r167
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,0
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn {  }
; 	» 0xr7adfd |~ 5' : r64
	mov QWORD rsi,0x7adfd
	mov QWORD rdx,rsi
	or r12,0b100000
; 	$ 4' ⊢ ,_r170,_r171 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r170
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; emt_ptn_crt_ptn 4',_r171
; emt_set_ptn 7'
; boxed
	mov rdi,rcx
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
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
	push QWORD rdi
	mov rdi,rcx
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
; 	» 0xra7632 |~ 4' : r64
	mov QWORD rax,0xa7632
	mov QWORD rcx,rax
	or r12,0b10000
; 	$ 7' ⊢ ,_r174,_r175 : ,{ },{ }
; emt_ptn_crt_ptn 7',_r174
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rdi
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; emt_ptn_crt_ptn 7',_r175
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rdi
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; ; emt_dec_ptn 7'
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
	mov rdi,rdi
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
; 	» 0xr4867 |~ 7' : r64
	mov QWORD [st_vct+8*1],0x4867
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD rdi,r14
	pop r14
	or r12,0b10000000
	mov QWORD [st_vct+8*1],1
	bts r12,10
; emt_ptn_crt_ptn { 10' {  } },_r177
; emt_get_crt_ptn { 10' {  } }
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
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_253
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_254
emt_get_crt_ptn_0_lb_253:
; unboxed
	stc
emt_get_crt_ptn_1_lb_254:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*3],r14
	pop r14
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
; ; emt_dec_ptn {  }
	mov QWORD [st_vct+8*1],0
	bts r12,10
; emt_ptn_crt_ptn { 10' { 7' 11' } },_r173
; emt_get_crt_ptn { 10' { 7' 11' } }
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
	jc emt_get_crt_ptn_0_lb_255
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_256
emt_get_crt_ptn_0_lb_255:
; unboxed
	stc
emt_get_crt_ptn_1_lb_256:
	push r14
	mov QWORD r14,[st_vct+8*1]
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
; emt_get_crt_ptn { 7' 11' }
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
; emt_get_crt_ptn 7'
	mov QWORD [st_vct+8*5],rdi
	stc
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
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_257
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_258
emt_get_crt_ptn_0_lb_257:
; unboxed
	stc
emt_get_crt_ptn_1_lb_258:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*5],r14
	pop r14
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
; ; emt_dec_ptn { 7' 11' }
; unknown
	bt r12,11
	jc emt_dec_ptn_0_lb_259
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
	mov rdi,[st_vct+8*2]
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
emt_dec_ptn_0_lb_259:
; unboxed
	mov QWORD rdi,0
	bts r12,7
; emt_ptn_crt_ptn { 7' { 4' 12' } },_r169
; emt_get_crt_ptn { 7' { 4' 12' } }
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
; emt_get_crt_ptn 7'
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
	mov QWORD [st_vct+8*2],rdi
; test x0
	mov rdx,[st_vct+8*2]
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
; emt_get_crt_ptn { 4' 12' }
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
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*4],rcx
	stc
; test x0
	mov rdx,[st_vct+8*4]
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
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_263
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_264
emt_get_crt_ptn_0_lb_263:
; unboxed
	stc
emt_get_crt_ptn_1_lb_264:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
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
; ; emt_dec_ptn { 4' 12' }
; unknown
	bt r12,12
	jc emt_dec_ptn_0_lb_265
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_265:
; unboxed
	mov QWORD rcx,0
	bts r12,4
; emt_ptn_crt_ptn { 4' { 5' 10' } },_r165
; emt_get_crt_ptn { 4' { 5' 10' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rax
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
	push QWORD rax
	push QWORD rdi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_267
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_268
emt_get_crt_ptn_0_lb_267:
; unboxed
	stc
emt_get_crt_ptn_1_lb_268:
	mov QWORD [st_vct+8*2],rcx
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rax
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
	push QWORD rax
	push QWORD rdi
; emt_get_crt_ptn { 5' 10' }
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
; emt_get_crt_ptn 5'
	mov QWORD [st_vct+8*3],rdx
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
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_269
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_270
emt_get_crt_ptn_0_lb_269:
; unboxed
	stc
emt_get_crt_ptn_1_lb_270:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*3],r14
	pop r14
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
	mov rdi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
; ; emt_dec_ptn { 5' 10' }
; unknown
	bt r12,10
	jc emt_dec_ptn_0_lb_271
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
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
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_271:
; unboxed
; 	$ 7' ⊢ ,l0 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t185'(0)) }) }) })
; emt_ptn_crt_ptn 7',l0
; emt_set_ptn 4'
; unknown
	bt r12,7
	jc emt_set_ptn_0_lb_273
	push rdi
	mov rdi,rdi
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_274
emt_set_ptn_0_lb_273:
	mov rcx,rdi
	or r12,0b10000
emt_set_ptn_1_lb_274:
; ; emt_dec_ptn 7'
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_275
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_275:
; 	$ 4' ⊢ ,l0,l1 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t186'(0)) }) }) }),(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t186'(0)) }) }) })
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 5'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_276
	push rdi
	mov rdi,rcx
	call inc_r
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
	jmp emt_set_ptn_1_lb_277
emt_set_ptn_0_lb_276:
	mov rdx,rcx
	or r12,0b100000
emt_set_ptn_1_lb_277:
; emt_ptn_crt_ptn 4',l1
; emt_set_ptn 7'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_278
	mov rdi,rcx
	call inc_r
	mov rdi,rdi
	and r12,~0b10000000
	jmp emt_set_ptn_1_lb_279
emt_set_ptn_0_lb_278:
	mov rdi,rcx
	or r12,0b10000000
emt_set_ptn_1_lb_279:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_280
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
	mov rdi,rcx
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
emt_dec_ptn_0_lb_280:
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rbx,r9
	mov r14,r10
	mov rdi,rbx
	mov rsi,r14
	mov rdx,0
	mov rcx,0
	bt r12,1
	setc dl
	bt r12,2
	setc cl
	push rdi
	push rsi
	call eq
	mov [tmp],rax
	pop rdi
	bt r12,1
	jc _eq_2_lb_283
	call dec_r
_eq_2_lb_283:
	pop rdi
	bt r12,2
	jc _eq_3_lb_284
	call dec_r
_eq_3_lb_284:
	mov rax,[tmp]
	bt rax,0
	jc _eq_0_lb_281
	mov rdi,[c_0]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_0],rdi
	mov r9,c_0
	btr r12,1
	jmp _eq_1_lb_282
_eq_0_lb_281:
	mov rdi,[c_1]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_1],rdi
	mov r9,c_1
	btr r12,1
_eq_1_lb_282:
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rsi
	push QWORD rax
	mov rbx,rdx
	mov r14,rdi
	mov rdi,rbx
	mov rsi,r14
	mov rdx,0
	mov rcx,0
	bt r12,5
	setc dl
	bt r12,7
	setc cl
	push rdi
	push rsi
	call eq
	mov [tmp],rax
	pop rdi
	bt r12,5
	jc _eq_2_lb_287
	call dec_r
_eq_2_lb_287:
	pop rdi
	bt r12,7
	jc _eq_3_lb_288
	call dec_r
_eq_3_lb_288:
	mov rax,[tmp]
	bt rax,0
	jc _eq_0_lb_285
	mov rdi,[c_0]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_0],rdi
	mov r10,c_0
	btr r12,2
	jmp _eq_1_lb_286
_eq_0_lb_285:
	mov rdi,[c_1]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_1],rdi
	mov r10,c_1
	btr r12,2
_eq_1_lb_286:
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; 	∎ { 1' 2' }
; emt_get_crt_ptn { 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rsi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rax
	pop QWORD rsi
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
	push QWORD rsi
	push QWORD rax
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_291
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_292
emt_get_crt_ptn_0_lb_291:
; unboxed
	stc
emt_get_crt_ptn_1_lb_292:
	mov QWORD rdx,r9
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rsi
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
	push QWORD rsi
	push QWORD rax
	push QWORD rcx
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_293
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_294
emt_get_crt_ptn_0_lb_293:
; unboxed
	stc
emt_get_crt_ptn_1_lb_294:
	mov QWORD rdx,r10
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_295
	push rcx
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_289
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rsi
	push QWORD rax
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_289:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_290
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rsi
	push QWORD rax
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_290:
	pop rcx
	clc
;clear 
	mov rax,rcx
	ret
ret_lb_295:
;clear  6'~_r170 8'~_r174 3'~x2 9'~_r175 0'~_r166
	bt r12,6
	jc clear_lb_296
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rax
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD r11
	pop QWORD r8
clear_lb_296:
	bt r12,8
	jc clear_lb_297
;push_reg
	push QWORD r8
	push QWORD r11
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r8
clear_lb_297:
	bt r12,3
	jc clear_lb_298
;push_reg
	push QWORD r8
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_298:
	bt r12,9
	jc clear_lb_299
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_299:
	bt r12,0
	jc clear_lb_300
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_300:
	mov rax,rcx
	stc
	ret
f3:
; 	|» {  }
	jz _f3
	jc emt_etr_c_lb_2
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
jmp _f3
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f3:
; 	» some _ ⊢ 0' : t151'(0)→(opn)◂(t151'(0))
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_some],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t152'(0)→(opn)◂(t152'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_182
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_183
emt_set_ptn_0_lb_182:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_183:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_184
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_184:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t153'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t154'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_185
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_186
emt_set_ptn_0_lb_185:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_186:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_187
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
emt_dec_ptn_0_lb_187:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r9
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_205
; 	◂ 1',2' ⊢ 0' : (opn)◂({ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t156'(0)) }) }) }))
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_194
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_195
emt_set_ptn_0_lb_194:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_195:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_196
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
emt_dec_ptn_0_lb_196:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_197
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
emt_dec_ptn_0_lb_197:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_198
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_203
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_204
emt_set_ptn_0_lb_203:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_204:
; ; emt_dec 
; unknown
	jc lb_202
;push_reg
	push QWORD r8
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r8
lb_202:
	jmp call_nc_lb_199
call_c_lb_198:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_200
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_201
emt_set_ptn_0_lb_200:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_201:
call_nc_lb_199:
	jmp ir_dyn_call_1_lb_206
ir_dyn_call_0_lb_205:
	mov QWORD r8,QWORD [rbx+8*1]
	bts r12,0
; emt_ptn_set_ptn { 0' 2' },0'
	push r12
; emt_get_ptn { 0' 2' }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push rbx
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_188
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_189
emt_get_ptn_0_lb_188:
; unboxed
	stc
emt_get_ptn_1_lb_189:
	mov QWORD r8,r8
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,0
	call exc
;pop_reg
	push rbx
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_190
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_191
emt_get_ptn_0_lb_190:
; unboxed
	stc
emt_get_ptn_1_lb_191:
	mov QWORD r8,r10
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,1
	call exc
;pop_reg
	mov r8,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_192
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
emt_dec_ptn_0_lb_192:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_193
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_193:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_206:
; 	» f1 _ ⊢ 1' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t157'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t158'(0)) }) }) })
; emt_ptn_crt_ptn 1',p1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_209
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_210
emt_set_ptn_0_lb_209:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_210:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_211
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
emt_dec_ptn_0_lb_211:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r10
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_223
; 	◂ 2',{  } ⊢ 1' : (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t159'(0)) }) }) })
; push_s_ex  0'~a0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_set_ptn {  },0'
	push r12
; emt_get_ptn {  }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,0
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
	mov r8,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b1
; ; emt_dec_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_215
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_215:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_216
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_221
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_222
emt_set_ptn_0_lb_221:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_222:
; ; emt_dec 
; unknown
	jc lb_220
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
lb_220:
	jmp call_nc_lb_217
call_c_lb_216:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_218
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_219
emt_set_ptn_0_lb_218:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_219:
call_nc_lb_217:
	jmp ir_dyn_call_1_lb_224
ir_dyn_call_0_lb_223:
	mov QWORD r9,QWORD [rbx+8*1]
	bts r12,1
; emt_ptn_set_ptn { 1' {  } },1'
	push r12
; emt_get_ptn { 1' {  } }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push rbx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_212
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_213
emt_get_ptn_0_lb_212:
; unboxed
	stc
emt_get_ptn_1_lb_213:
	mov QWORD r9,r9
;push_reg
	mov rdx,r9
	pop rdi
	mov rbx,rdi
	mov rsi,0
	call exc
;pop_reg
	push rbx
; emt_get_ptn {  }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	mov r9,rbx
	pop r14
	pop rbx
	clc
;push_reg
	mov rdx,r9
	pop rdi
	mov rbx,rdi
	mov rsi,1
	call exc
;pop_reg
	mov r9,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b10
; ; emt_dec_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_214
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
emt_dec_ptn_0_lb_214:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_224:
; 	∎ { 0' 1' }
; emt_get_crt_ptn { 0' 1' }
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
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_229
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_230
emt_get_crt_ptn_0_lb_229:
; unboxed
	stc
emt_get_crt_ptn_1_lb_230:
	mov QWORD r11,r8
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
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_231
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_232
emt_get_crt_ptn_0_lb_231:
; unboxed
	stc
emt_get_crt_ptn_1_lb_232:
	mov QWORD r11,r9
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
	jc ret_lb_233
	push r10
; ; emt_dec_ptn { 0' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_227
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_227:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_228
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_228:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_233:
;clear 
	mov rax,r10
	stc
	ret
f2:
; 	|» {  }
	jz _f2
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
jmp _f2
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	» some _ ⊢ 0' : t142'(0)→(opn)◂(t142'(0))
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_some],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t143'(0)→(opn)◂(t143'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_169
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_170
emt_set_ptn_0_lb_169:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_170:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_171
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_171:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t144'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t145'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_172
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_173
emt_set_ptn_0_lb_172:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_173:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_174
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
emt_dec_ptn_0_lb_174:
; 	∎ { 1' 2' }
; emt_get_crt_ptn { 1' 2' }
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
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_177
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_178
emt_get_crt_ptn_0_lb_177:
; unboxed
	stc
emt_get_crt_ptn_1_lb_178:
	mov QWORD r11,r9
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
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_179
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_180
emt_get_crt_ptn_0_lb_179:
; unboxed
	stc
emt_get_crt_ptn_1_lb_180:
	mov QWORD r11,r10
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
	jc ret_lb_181
	push r8
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_175
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_175:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_176
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_176:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_181:
;clear 
	mov rax,r8
	stc
	ret
f1:
; 	|» {  }
	jz _f1
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
jmp _f1
emt_etr_c_lb_4:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	$ {  } ⊢ ,_r119,_r120 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r119
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r120
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
; 	» 0xr7adfd |~ 2' : r64
	mov QWORD r11,0x7adfd
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r123,_r124 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r123
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r124
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
; 	» 0xra7632 |~ 1' : r64
	mov QWORD rdx,0xa7632
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r127,_r128 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r127
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r128
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
; 	» 0xr4867 |~ 4' : r64
	mov QWORD rdi,0x4867
	mov QWORD rcx,rdi
	or r12,0b10000
	mov QWORD rdi,1
	bts r12,7
; emt_ptn_crt_ptn { 7' {  } },_r130
; emt_get_crt_ptn { 7' {  } }
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
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_138
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_139
emt_get_crt_ptn_0_lb_138:
; unboxed
	stc
emt_get_crt_ptn_1_lb_139:
	mov QWORD [st_vct+8*0],rdi
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
	mov [st_vct+8*0],rax
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
	and r12,~0b100000000
; ; emt_dec_ptn {  }
	mov QWORD rdi,0
	bts r12,7
; emt_ptn_crt_ptn { 7' { 4' 8' } },_r126
; emt_get_crt_ptn { 7' { 4' 8' } }
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
	mov [st_vct+8*0],rax
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
	push QWORD [st_vct+8*0]
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_140
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_141
emt_get_crt_ptn_0_lb_140:
; unboxed
	stc
emt_get_crt_ptn_1_lb_141:
	mov QWORD [st_vct+8*1],rdi
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*0],rdi
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
	push QWORD [st_vct+8*0]
; emt_get_crt_ptn { 4' 8' }
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
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*2],rcx
	stc
; test x0
	mov rdx,[st_vct+8*2]
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
	jc emt_get_crt_ptn_0_lb_142
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_143
emt_get_crt_ptn_0_lb_142:
; unboxed
	stc
emt_get_crt_ptn_1_lb_143:
	mov QWORD [st_vct+8*2],rax
; test x0
	mov rdx,[st_vct+8*2]
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
	mov [st_vct+8*0],rdi
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
	and r12,~0b1000000000
; ; emt_dec_ptn { 4' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_144
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_144:
; unboxed
	mov QWORD rcx,0
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 9' } },_r122
; emt_get_crt_ptn { 4' { 1' 9' } }
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
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_146
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_147
emt_get_crt_ptn_0_lb_146:
; unboxed
	stc
emt_get_crt_ptn_1_lb_147:
	mov QWORD rax,rcx
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
; emt_get_crt_ptn { 1' 9' }
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
	mov QWORD [st_vct+8*1],r9
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
; emt_get_crt_ptn 9'
	bt r12,9
	jc emt_get_crt_ptn_0_lb_148
; boxed
	push rdi
	mov rdi,[st_vct+8*0]
	call inc_r
	mov [st_vct+8*0],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_149
emt_get_crt_ptn_0_lb_148:
; unboxed
	stc
emt_get_crt_ptn_1_lb_149:
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD [st_vct+8*1],r14
	pop r14
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
; ; emt_dec_ptn { 1' 9' }
; unknown
	bt r12,9
	jc emt_dec_ptn_0_lb_150
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_150:
; unboxed
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r118
; emt_get_crt_ptn { 1' { 2' 7' } }
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
	jc emt_get_crt_ptn_0_lb_152
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_153
emt_get_crt_ptn_0_lb_152:
; unboxed
	stc
emt_get_crt_ptn_1_lb_153:
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
; emt_get_crt_ptn { 2' 7' }
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
	mov QWORD [st_vct+8*0],r10
	stc
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
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_154
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_155
emt_get_crt_ptn_0_lb_154:
; unboxed
	stc
emt_get_crt_ptn_1_lb_155:
	mov QWORD [st_vct+8*0],rdi
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
; ; emt_dec_ptn { 2' 7' }
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_156
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
emt_dec_ptn_0_lb_156:
; unboxed
; 	$ 4' ⊢ ,l0 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t138'(0)) }) }) })
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_158
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_159
emt_set_ptn_0_lb_158:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_159:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_160
;push_reg
	push QWORD r8
	push QWORD r9
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
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_160:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_162
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_163
emt_get_crt_ptn_0_lb_162:
; unboxed
	stc
emt_get_crt_ptn_1_lb_163:
	mov QWORD r10,r9
	jc ret_lb_164
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_161
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_161:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_164:
;clear  6'~_r128 3'~_r123 5'~_r127 0'~_r119
	bt r12,6
	jc clear_lb_165
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_165:
	bt r12,3
	jc clear_lb_166
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_166:
	bt r12,5
	jc clear_lb_167
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_167:
	bt r12,0
	jc clear_lb_168
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_168:
	mov rax,r10
	stc
	ret
f0:
; 	|» {  }
	jz _f0
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
jmp _f0
emt_etr_c_lb_5:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
	mov QWORD r8,1
	bts r12,0
; emt_ptn_crt_ptn { 0' {  } },l0
; emt_get_crt_ptn { 0' {  } }
;push_reg
	push QWORD r8
	mov rdi,2
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_88
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_89
emt_get_crt_ptn_0_lb_88:
; unboxed
	stc
emt_get_crt_ptn_1_lb_89:
	mov QWORD r10,r8
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
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
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,1
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	$ 1' ⊢ ,l0,l1 : ,(b_tree)◂(t113'(0)),(b_tree)◂(t113'(0))
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_90
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_91
emt_set_ptn_0_lb_90:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_91:
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_92
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_93
emt_set_ptn_0_lb_92:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_93:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_94
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
emt_dec_ptn_0_lb_94:
; 	» 0xrfabc |~ 1' : r64
	mov QWORD r11,0xfabc
	mov QWORD r9,r11
	or r12,0b10
; 	$ 1' ⊢ ,x0 : ,r64
; emt_ptn_crt_ptn 1',x0
; emt_set_ptn 3'
; unboxed
	mov r11,r9
; ; emt_dec_ptn 1'
; unboxed
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' { 0' 3' 2' } },t0
; emt_get_crt_ptn { 1' { 0' 3' 2' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
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
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_98
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_99
emt_get_crt_ptn_0_lb_98:
; unboxed
	stc
emt_get_crt_ptn_1_lb_99:
	mov QWORD rdx,r9
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
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
; emt_get_crt_ptn { 0' 3' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,3
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
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_100
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_101
emt_get_crt_ptn_0_lb_100:
; unboxed
	stc
emt_get_crt_ptn_1_lb_101:
	mov QWORD rsi,r8
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
; emt_get_crt_ptn 3'
	mov QWORD rsi,r11
	stc
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
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_102
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_103
emt_get_crt_ptn_0_lb_102:
; unboxed
	stc
emt_get_crt_ptn_1_lb_103:
	mov QWORD rsi,r10
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,2
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
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 0' 3' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_104
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_104:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_106
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_106:
; 	$ 4' ⊢ ,t0,t1 : ,(b_tree)◂(r64),(b_tree)◂(r64)
; emt_ptn_crt_ptn 4',t0
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_107
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_108
emt_set_ptn_0_lb_107:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_108:
; emt_ptn_crt_ptn 4',t1
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_109
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_110
emt_set_ptn_0_lb_109:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_110:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_111
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_111:
; 	» 0xrfacac |~ 2' : r64
	mov QWORD r11,0xfacac
	mov QWORD r10,r11
	or r12,0b100
; 	$ 2' ⊢ ,x1 : ,r64
; emt_ptn_crt_ptn 2',x1
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; ; emt_dec_ptn 2'
; unboxed
	mov QWORD r10,0
	bts r12,2
; emt_ptn_crt_ptn { 2' { 0' 3' 1' } },t2
; emt_get_crt_ptn { 2' { 0' 3' 1' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
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
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_115
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_116
emt_get_crt_ptn_0_lb_115:
; unboxed
	stc
emt_get_crt_ptn_1_lb_116:
	mov QWORD rdx,r10
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
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
; emt_get_crt_ptn { 0' 3' 1' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,3
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
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_117
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_118
emt_get_crt_ptn_0_lb_117:
; unboxed
	stc
emt_get_crt_ptn_1_lb_118:
	mov QWORD rsi,r8
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
; emt_get_crt_ptn 3'
	mov QWORD rsi,r11
	stc
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
	jc emt_get_crt_ptn_0_lb_119
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_120
emt_get_crt_ptn_0_lb_119:
; unboxed
	stc
emt_get_crt_ptn_1_lb_120:
	mov QWORD rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,2
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
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 0' 3' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_121
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_121:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_123
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
emt_dec_ptn_0_lb_123:
; 	∎ 4'
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_125
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_126
emt_get_crt_ptn_0_lb_125:
; unboxed
	stc
emt_get_crt_ptn_1_lb_126:
	mov QWORD r8,rcx
	jc ret_lb_127
	push r8
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_124
;push_reg
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
emt_dec_ptn_0_lb_124:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_127:
;clear 
	mov rax,r8
	stc
	ret
map:
; 	|» { 0' 1' }
	jz _map
	jc emt_etr_c_lb_6
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
	jc emt_set_ptn_0_lb_11
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_12
emt_set_ptn_0_lb_11:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_12:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_13
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_14
emt_set_ptn_0_lb_13:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_14:
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
jmp _map
emt_etr_c_lb_6:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_7
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_8
emt_set_ptn_0_lb_7:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_8:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_9
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_10
emt_set_ptn_0_lb_9:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_10:
	pop rbx
	pop rbx
_map:
; 	? 1'
; 	∐\ l0 ,,l0=cns◂{ hd0 tl0 }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_15
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_16
emt_set_ptn_0_lb_15:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_16:
; l0=cns◂{ hd0 tl0 }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_18
	jmp test_lb_26
failed_lb_18:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_19
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_19:
	jmp mtc_0_lb_17
test_lb_26:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_22
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_23
emt_set_ptn_0_lb_22:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_23:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_24
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_25
emt_set_ptn_0_lb_24:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_25:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_21
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
emt_dec_ptn_0_lb_21:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_27
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_27:
; 	$ 0' ⊢ ,f,f0 : ,t103'(-1)→t108'(-1),t103'(-1)→t108'(-1)
; emt_ptn_crt_ptn 0',f
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_28
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_29
emt_set_ptn_0_lb_28:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_29:
; emt_ptn_crt_ptn 0',f0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_30
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_31
emt_set_ptn_0_lb_30:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_31:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_32
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_32:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r9
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_50
; 	◂ 1',3' ⊢ 0' : t108'(-1)
; push_s_ex  2'~f0 4'~tl0
	sub rsp,24
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*1],rcx
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_39
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_40
emt_set_ptn_0_lb_39:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_40:
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_41
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_41:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_42
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_42:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_43
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD rcx,[rsp+8*1]
	mov QWORD r10,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_48
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_49
emt_set_ptn_0_lb_48:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_49:
; ; emt_dec 
; unknown
	jc lb_47
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD rcx
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r8
lb_47:
	jmp call_nc_lb_44
call_c_lb_43:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD rcx,[rsp+8*1]
	mov QWORD r10,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_45
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_46
emt_set_ptn_0_lb_45:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_46:
call_nc_lb_44:
	jmp ir_dyn_call_1_lb_51
ir_dyn_call_0_lb_50:
	mov QWORD r8,QWORD [rbx+8*1]
	bts r12,0
; emt_ptn_set_ptn { 0' 3' },0'
	push r12
; emt_get_ptn { 0' 3' }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push rbx
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_33
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_34
emt_get_ptn_0_lb_33:
; unboxed
	stc
emt_get_ptn_1_lb_34:
	mov QWORD r8,r8
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,0
	call exc
;pop_reg
	push rbx
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_lb_35
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_36
emt_get_ptn_0_lb_35:
; unboxed
	stc
emt_get_ptn_1_lb_36:
	mov QWORD r8,r11
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,1
	call exc
;pop_reg
	mov r8,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_37
;push_reg
	push QWORD r8
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
	pop QWORD r8
emt_dec_ptn_0_lb_37:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_38
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_38:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_51:
; 	map { 2' 4' } ⊢ 1' : @[0].(⟦⟧)◂(t108'(-1)) ≃ ∐[{ } { t108'(-1) @[0] } ]
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
; push_s_ex  0'~hd1
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn { 2' 4' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_54
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_55
emt_set_ptn_0_lb_54:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_55:
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_56
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_57
emt_set_ptn_0_lb_56:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_57:
; ; emt_dec_ptn { 2' 4' }
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_58
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
emt_dec_ptn_0_lb_58:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_59
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
emt_dec_ptn_0_lb_59:
	call _map
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
	mov QWORD [tmp],rax
	jc call_c_lb_60
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_65
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_66
emt_set_ptn_0_lb_65:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_66:
; ; emt_dec 
; unknown
	jc lb_64
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
lb_64:
	jmp call_nc_lb_61
call_c_lb_60:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_62
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_63
emt_set_ptn_0_lb_62:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_63:
call_nc_lb_61:
	mov QWORD r10,1
	bts r12,2
; emt_ptn_crt_ptn { 2' { 0' 1' } },l1
; emt_get_crt_ptn { 2' { 0' 1' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_67
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_68
emt_get_crt_ptn_0_lb_67:
; unboxed
	stc
emt_get_crt_ptn_1_lb_68:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn { 0' 1' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
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
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_69
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_70
emt_get_crt_ptn_0_lb_69:
; unboxed
	stc
emt_get_crt_ptn_1_lb_70:
	mov QWORD rdx,r8
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
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
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_71
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_72
emt_get_crt_ptn_0_lb_71:
; unboxed
	stc
emt_get_crt_ptn_1_lb_72:
	mov QWORD rdx,r9
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000
; ; emt_dec_ptn { 0' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_73
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_73:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_74
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_74:
; 	∎ 3'
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_76
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_77
emt_get_crt_ptn_0_lb_76:
; unboxed
	stc
emt_get_crt_ptn_1_lb_77:
	mov QWORD r8,r11
	jc ret_lb_78
	push r8
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_75
;push_reg
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
emt_dec_ptn_0_lb_75:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_78:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_17:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_80
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_80:
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' {  } },l1
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
	jc emt_get_crt_ptn_0_lb_81
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_82
emt_get_crt_ptn_0_lb_81:
; unboxed
	stc
emt_get_crt_ptn_1_lb_82:
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
; 	∎ 2'
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_84
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_85
emt_get_crt_ptn_0_lb_84:
; unboxed
	stc
emt_get_crt_ptn_1_lb_85:
	mov QWORD r9,r10
	jc ret_lb_86
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_83
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_83:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_86:
;clear  0'~f
	bt r12,0
	jc clear_lb_87
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_87:
	mov rax,r9
	stc
	ret
mtc_1_lb_79:
section .data
	_dyn_map:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq map
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
	_dyn_f1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f1
	_dyn_f2:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f2
	_dyn_f3:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f3
	_dyn_f4:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f4
	_dyn_f5:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f5
	_dyn_lf:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_brc:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_nilA:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_cnsA:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_none:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_some:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_sgn:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_p1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_eq:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_f:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_t:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_e1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_e0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cmp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mul:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_sub:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_add:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_pnt:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_read:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_scc:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cns:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_nil:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
