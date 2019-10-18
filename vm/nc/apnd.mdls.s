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
	call f4
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f4:
; 	|» {  }
	jz _f4
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
jmp _f4
emt_etr_c_lb_0:
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
; 	$ {  } ⊢ ,_r158,_r159 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r158
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
; emt_ptn_crt_ptn {  },_r159
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
; 	$ 4' ⊢ ,_r162,_r163 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r162
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; emt_ptn_crt_ptn 4',_r163
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
; 	$ 7' ⊢ ,_r166,_r167 : ,{ },{ }
; emt_ptn_crt_ptn 7',_r166
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rdi
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; emt_ptn_crt_ptn 7',_r167
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
; emt_ptn_crt_ptn { 10' {  } },_r169
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
	jc emt_get_crt_ptn_0_lb_252
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_253
emt_get_crt_ptn_0_lb_252:
; unboxed
	stc
emt_get_crt_ptn_1_lb_253:
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
; emt_ptn_crt_ptn { 10' { 7' 11' } },_r165
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
	jc emt_get_crt_ptn_0_lb_254
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_255
emt_get_crt_ptn_0_lb_254:
; unboxed
	stc
emt_get_crt_ptn_1_lb_255:
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
	jc emt_get_crt_ptn_0_lb_256
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_257
emt_get_crt_ptn_0_lb_256:
; unboxed
	stc
emt_get_crt_ptn_1_lb_257:
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
	jc emt_dec_ptn_0_lb_258
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
emt_dec_ptn_0_lb_258:
; unboxed
	mov QWORD rdi,0
	bts r12,7
; emt_ptn_crt_ptn { 7' { 4' 12' } },_r161
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
	jc emt_get_crt_ptn_0_lb_260
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_261
emt_get_crt_ptn_0_lb_260:
; unboxed
	stc
emt_get_crt_ptn_1_lb_261:
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
	jc emt_get_crt_ptn_0_lb_262
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_263
emt_get_crt_ptn_0_lb_262:
; unboxed
	stc
emt_get_crt_ptn_1_lb_263:
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
	jc emt_dec_ptn_0_lb_264
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
emt_dec_ptn_0_lb_264:
; unboxed
	mov QWORD rcx,0
	bts r12,4
; emt_ptn_crt_ptn { 4' { 5' 10' } },_r157
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
	jc emt_get_crt_ptn_0_lb_266
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_267
emt_get_crt_ptn_0_lb_266:
; unboxed
	stc
emt_get_crt_ptn_1_lb_267:
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
	jc emt_get_crt_ptn_0_lb_268
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_269
emt_get_crt_ptn_0_lb_268:
; unboxed
	stc
emt_get_crt_ptn_1_lb_269:
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
	jc emt_dec_ptn_0_lb_270
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
emt_dec_ptn_0_lb_270:
; unboxed
; 	$ 7' ⊢ ,l0 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t177'(0)) }) }) })
; emt_ptn_crt_ptn 7',l0
; emt_set_ptn 4'
; unknown
	bt r12,7
	jc emt_set_ptn_0_lb_272
	push rdi
	mov rdi,rdi
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_273
emt_set_ptn_0_lb_272:
	mov rcx,rdi
	or r12,0b10000
emt_set_ptn_1_lb_273:
; ; emt_dec_ptn 7'
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_274
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
emt_dec_ptn_0_lb_274:
; 	$ 4' ⊢ ,l0,l1 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t178'(0)) }) }) }),(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t178'(0)) }) }) })
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 5'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_275
	push rdi
	mov rdi,rcx
	call inc_r
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
	jmp emt_set_ptn_1_lb_276
emt_set_ptn_0_lb_275:
	mov rdx,rcx
	or r12,0b100000
emt_set_ptn_1_lb_276:
; emt_ptn_crt_ptn 4',l1
; emt_set_ptn 7'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_277
	mov rdi,rcx
	call inc_r
	mov rdi,rdi
	and r12,~0b10000000
	jmp emt_set_ptn_1_lb_278
emt_set_ptn_0_lb_277:
	mov rdi,rcx
	or r12,0b10000000
emt_set_ptn_1_lb_278:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_279
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
emt_dec_ptn_0_lb_279:
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
	jc _eq_2_lb_282
	call dec_r
_eq_2_lb_282:
	pop rdi
	bt r12,2
	jc _eq_3_lb_283
	call dec_r
_eq_3_lb_283:
	mov rax,[tmp]
	bt rax,0
	jc _eq_0_lb_280
	mov rdi,[c_0]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_0],rdi
	mov r9,c_0
	btr r12,1
	jmp _eq_1_lb_281
_eq_0_lb_280:
	mov rdi,[c_1]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_1],rdi
	mov r9,c_1
	btr r12,1
_eq_1_lb_281:
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
	jc _eq_2_lb_286
	call dec_r
_eq_2_lb_286:
	pop rdi
	bt r12,7
	jc _eq_3_lb_287
	call dec_r
_eq_3_lb_287:
	mov rax,[tmp]
	bt rax,0
	jc _eq_0_lb_284
	mov rdi,[c_0]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_0],rdi
	mov r10,c_0
	btr r12,2
	jmp _eq_1_lb_285
_eq_0_lb_284:
	mov rdi,[c_1]
	mov r11,0x0001000000000000
	add rdi,r11
	mov QWORD [c_1],rdi
	mov r10,c_1
	btr r12,2
_eq_1_lb_285:
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
	jc emt_get_crt_ptn_0_lb_290
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_291
emt_get_crt_ptn_0_lb_290:
; unboxed
	stc
emt_get_crt_ptn_1_lb_291:
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
	jc emt_get_crt_ptn_0_lb_292
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_293
emt_get_crt_ptn_0_lb_292:
; unboxed
	stc
emt_get_crt_ptn_1_lb_293:
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
	jc ret_lb_294
	push rcx
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_288
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
emt_dec_ptn_0_lb_288:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_289
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
emt_dec_ptn_0_lb_289:
	pop rcx
	clc
;clear 
	mov rax,rcx
	ret
ret_lb_294:
;clear  6'~_r162 8'~_r166 3'~x2 9'~_r167 0'~_r158
	bt r12,6
	jc clear_lb_295
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
clear_lb_295:
	bt r12,8
	jc clear_lb_296
;push_reg
	push QWORD r8
	push QWORD r11
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r8
clear_lb_296:
	bt r12,3
	jc clear_lb_297
;push_reg
	push QWORD r8
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_297:
	bt r12,9
	jc clear_lb_298
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_298:
	bt r12,0
	jc clear_lb_299
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_299:
	mov rax,rcx
	stc
	ret
f3:
; 	|» {  }
	jz _f3
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
jmp _f3
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f3:
; 	» some _ ⊢ 0' : t143'(0)→(opn)◂(t143'(0))
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_some],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t144'(0)→(opn)◂(t144'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_181
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_182
emt_set_ptn_0_lb_181:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_182:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_183
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_183:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t145'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t146'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_184
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_185
emt_set_ptn_0_lb_184:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_185:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_186
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
emt_dec_ptn_0_lb_186:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r9
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_204
; 	◂ 1',2' ⊢ 0' : (opn)◂({ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t148'(0)) }) }) }))
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_193
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_194
emt_set_ptn_0_lb_193:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_194:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_195
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
emt_dec_ptn_0_lb_195:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_196
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
emt_dec_ptn_0_lb_196:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_197
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_202
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_203
emt_set_ptn_0_lb_202:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_203:
; ; emt_dec 
; unknown
	jc lb_201
;push_reg
	push QWORD r8
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r8
lb_201:
	jmp call_nc_lb_198
call_c_lb_197:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_199
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_200
emt_set_ptn_0_lb_199:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_200:
call_nc_lb_198:
	jmp ir_dyn_call_1_lb_205
ir_dyn_call_0_lb_204:
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
	jc emt_get_ptn_0_lb_187
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_188
emt_get_ptn_0_lb_187:
; unboxed
	stc
emt_get_ptn_1_lb_188:
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
	jc emt_get_ptn_0_lb_189
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_190
emt_get_ptn_0_lb_189:
; unboxed
	stc
emt_get_ptn_1_lb_190:
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
	jc emt_dec_ptn_0_lb_191
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
emt_dec_ptn_0_lb_191:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_192
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_192:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_205:
; 	» f1 _ ⊢ 1' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t149'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t150'(0)) }) }) })
; emt_ptn_crt_ptn 1',p1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_208
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_209
emt_set_ptn_0_lb_208:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_209:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_210
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
emt_dec_ptn_0_lb_210:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r10
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_222
; 	◂ 2',{  } ⊢ 1' : (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t151'(0)) }) }) })
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
	jc emt_dec_ptn_0_lb_214
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_214:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_215
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_220
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_221
emt_set_ptn_0_lb_220:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_221:
; ; emt_dec 
; unknown
	jc lb_219
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
lb_219:
	jmp call_nc_lb_216
call_c_lb_215:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_217
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_218
emt_set_ptn_0_lb_217:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_218:
call_nc_lb_216:
	jmp ir_dyn_call_1_lb_223
ir_dyn_call_0_lb_222:
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
	jc emt_get_ptn_0_lb_211
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_212
emt_get_ptn_0_lb_211:
; unboxed
	stc
emt_get_ptn_1_lb_212:
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
	jc emt_dec_ptn_0_lb_213
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
emt_dec_ptn_0_lb_213:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_223:
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
	jc emt_get_crt_ptn_0_lb_228
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_229
emt_get_crt_ptn_0_lb_228:
; unboxed
	stc
emt_get_crt_ptn_1_lb_229:
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
	jc emt_get_crt_ptn_0_lb_230
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_231
emt_get_crt_ptn_0_lb_230:
; unboxed
	stc
emt_get_crt_ptn_1_lb_231:
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
	jc ret_lb_232
	push r10
; ; emt_dec_ptn { 0' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_226
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_226:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_227
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_227:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_232:
;clear 
	mov rax,r10
	stc
	ret
f2:
; 	|» {  }
	jz _f2
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
jmp _f2
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	» some _ ⊢ 0' : t134'(0)→(opn)◂(t134'(0))
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_some],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t135'(0)→(opn)◂(t135'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_168
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_169
emt_set_ptn_0_lb_168:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_169:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_170
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_170:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t136'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t137'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_171
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_172
emt_set_ptn_0_lb_171:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_172:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_173
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
emt_dec_ptn_0_lb_173:
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
	jc emt_get_crt_ptn_0_lb_176
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_177
emt_get_crt_ptn_0_lb_176:
; unboxed
	stc
emt_get_crt_ptn_1_lb_177:
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
	jc emt_get_crt_ptn_0_lb_178
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_179
emt_get_crt_ptn_0_lb_178:
; unboxed
	stc
emt_get_crt_ptn_1_lb_179:
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
	jc ret_lb_180
	push r8
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_174
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_174:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_175
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_175:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_180:
;clear 
	mov rax,r8
	stc
	ret
f1:
; 	|» {  }
	jz _f1
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
jmp _f1
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	$ {  } ⊢ ,_r111,_r112 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r111
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r112
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
; 	$ 1' ⊢ ,_r115,_r116 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r115
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r116
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
; 	$ 4' ⊢ ,_r119,_r120 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r119
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r120
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
; emt_ptn_crt_ptn { 7' {  } },_r122
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
	jc emt_get_crt_ptn_0_lb_137
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_138
emt_get_crt_ptn_0_lb_137:
; unboxed
	stc
emt_get_crt_ptn_1_lb_138:
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
; emt_ptn_crt_ptn { 7' { 4' 8' } },_r118
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
	jc emt_get_crt_ptn_0_lb_139
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_140
emt_get_crt_ptn_0_lb_139:
; unboxed
	stc
emt_get_crt_ptn_1_lb_140:
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
	jc emt_get_crt_ptn_0_lb_141
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_142
emt_get_crt_ptn_0_lb_141:
; unboxed
	stc
emt_get_crt_ptn_1_lb_142:
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
	jc emt_dec_ptn_0_lb_143
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
emt_dec_ptn_0_lb_143:
; unboxed
	mov QWORD rcx,0
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 9' } },_r114
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
	jc emt_get_crt_ptn_0_lb_145
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_146
emt_get_crt_ptn_0_lb_145:
; unboxed
	stc
emt_get_crt_ptn_1_lb_146:
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
	jc emt_get_crt_ptn_0_lb_147
; boxed
	push rdi
	mov rdi,[st_vct+8*0]
	call inc_r
	mov [st_vct+8*0],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_148
emt_get_crt_ptn_0_lb_147:
; unboxed
	stc
emt_get_crt_ptn_1_lb_148:
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
	jc emt_dec_ptn_0_lb_149
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
emt_dec_ptn_0_lb_149:
; unboxed
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r110
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
	jc emt_get_crt_ptn_0_lb_151
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_152
emt_get_crt_ptn_0_lb_151:
; unboxed
	stc
emt_get_crt_ptn_1_lb_152:
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
	jc emt_get_crt_ptn_0_lb_153
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_154
emt_get_crt_ptn_0_lb_153:
; unboxed
	stc
emt_get_crt_ptn_1_lb_154:
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
	jc emt_dec_ptn_0_lb_155
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
emt_dec_ptn_0_lb_155:
; unboxed
; 	$ 4' ⊢ ,l0 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t130'(0)) }) }) })
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_157
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_158
emt_set_ptn_0_lb_157:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_158:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_159
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
emt_dec_ptn_0_lb_159:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_161
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_162
emt_get_crt_ptn_0_lb_161:
; unboxed
	stc
emt_get_crt_ptn_1_lb_162:
	mov QWORD r10,r9
	jc ret_lb_163
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_160
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
emt_dec_ptn_0_lb_160:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_163:
;clear  6'~_r120 3'~_r115 5'~_r119 0'~_r111
	bt r12,6
	jc clear_lb_164
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
clear_lb_164:
	bt r12,3
	jc clear_lb_165
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_165:
	bt r12,5
	jc clear_lb_166
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_166:
	bt r12,0
	jc clear_lb_167
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_167:
	mov rax,r10
	stc
	ret
f0:
; 	|» {  }
	jz _f0
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
jmp _f0
emt_etr_c_lb_4:
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
	jc emt_get_crt_ptn_0_lb_87
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_88
emt_get_crt_ptn_0_lb_87:
; unboxed
	stc
emt_get_crt_ptn_1_lb_88:
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
; 	$ 1' ⊢ ,l0,l1 : ,(b_tree)◂(t105'(0)),(b_tree)◂(t105'(0))
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_89
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_90
emt_set_ptn_0_lb_89:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_90:
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_91
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_92
emt_set_ptn_0_lb_91:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_92:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_93
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
emt_dec_ptn_0_lb_93:
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
	jc emt_get_crt_ptn_0_lb_97
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_98
emt_get_crt_ptn_0_lb_97:
; unboxed
	stc
emt_get_crt_ptn_1_lb_98:
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
	jc emt_get_crt_ptn_0_lb_99
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_100
emt_get_crt_ptn_0_lb_99:
; unboxed
	stc
emt_get_crt_ptn_1_lb_100:
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
	jc emt_get_crt_ptn_0_lb_101
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_102
emt_get_crt_ptn_0_lb_101:
; unboxed
	stc
emt_get_crt_ptn_1_lb_102:
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
	jc emt_dec_ptn_0_lb_103
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
emt_dec_ptn_0_lb_103:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_105
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
emt_dec_ptn_0_lb_105:
; 	$ 4' ⊢ ,t0,t1 : ,(b_tree)◂(r64),(b_tree)◂(r64)
; emt_ptn_crt_ptn 4',t0
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_106
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_107
emt_set_ptn_0_lb_106:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_107:
; emt_ptn_crt_ptn 4',t1
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_108
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_109
emt_set_ptn_0_lb_108:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_109:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_110
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
emt_dec_ptn_0_lb_110:
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
	jc emt_get_crt_ptn_0_lb_114
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_115
emt_get_crt_ptn_0_lb_114:
; unboxed
	stc
emt_get_crt_ptn_1_lb_115:
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
	jc emt_get_crt_ptn_0_lb_116
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_117
emt_get_crt_ptn_0_lb_116:
; unboxed
	stc
emt_get_crt_ptn_1_lb_117:
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
	jc emt_get_crt_ptn_0_lb_118
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_119
emt_get_crt_ptn_0_lb_118:
; unboxed
	stc
emt_get_crt_ptn_1_lb_119:
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
	jc emt_dec_ptn_0_lb_120
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
emt_dec_ptn_0_lb_120:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_122
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
emt_dec_ptn_0_lb_122:
; 	∎ 4'
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_124
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_125
emt_get_crt_ptn_0_lb_124:
; unboxed
	stc
emt_get_crt_ptn_1_lb_125:
	mov QWORD r8,rcx
	jc ret_lb_126
	push r8
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_123
;push_reg
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
emt_dec_ptn_0_lb_123:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_126:
;clear 
	mov rax,r8
	stc
	ret
map:
; 	|» { 0' 1' }
	jz _map
	jc emt_etr_c_lb_5
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
	jc emt_set_ptn_0_lb_10
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_11
emt_set_ptn_0_lb_10:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_11:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_12
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_13
emt_set_ptn_0_lb_12:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_13:
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
emt_etr_c_lb_5:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_6
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_7
emt_set_ptn_0_lb_6:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_7:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_8
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_9
emt_set_ptn_0_lb_8:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_9:
	pop rbx
	pop rbx
_map:
; 	? 1'
; 	∐\ l0 ,,l0=cns◂{ hd0 tl0 }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_14
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_15
emt_set_ptn_0_lb_14:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_15:
; l0=cns◂{ hd0 tl0 }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_17
	jmp test_lb_25
failed_lb_17:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_18
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_18:
	jmp mtc_0_lb_16
test_lb_25:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_21
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_22
emt_set_ptn_0_lb_21:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_22:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_23
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_24
emt_set_ptn_0_lb_23:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_24:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_20
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
emt_dec_ptn_0_lb_20:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_26
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
emt_dec_ptn_0_lb_26:
; 	$ 0' ⊢ ,f,f0 : ,t95'(-1)→t100'(-1),t95'(-1)→t100'(-1)
; emt_ptn_crt_ptn 0',f
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_27
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_28
emt_set_ptn_0_lb_27:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_28:
; emt_ptn_crt_ptn 0',f0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_29
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_30
emt_set_ptn_0_lb_29:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_30:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_31
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
emt_dec_ptn_0_lb_31:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r9
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_49
; 	◂ 1',3' ⊢ 0' : t100'(-1)
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
	jc emt_set_ptn_0_lb_38
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_39
emt_set_ptn_0_lb_38:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_39:
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_40
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
emt_dec_ptn_0_lb_40:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_41
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
emt_dec_ptn_0_lb_41:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_42
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
	jc emt_set_ptn_0_lb_47
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_48
emt_set_ptn_0_lb_47:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_48:
; ; emt_dec 
; unknown
	jc lb_46
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
lb_46:
	jmp call_nc_lb_43
call_c_lb_42:
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
	jc emt_set_ptn_0_lb_44
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_45
emt_set_ptn_0_lb_44:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_45:
call_nc_lb_43:
	jmp ir_dyn_call_1_lb_50
ir_dyn_call_0_lb_49:
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
	jc emt_get_ptn_0_lb_32
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_33
emt_get_ptn_0_lb_32:
; unboxed
	stc
emt_get_ptn_1_lb_33:
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
	jc emt_get_ptn_0_lb_34
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_35
emt_get_ptn_0_lb_34:
; unboxed
	stc
emt_get_ptn_1_lb_35:
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
	jc emt_dec_ptn_0_lb_36
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
emt_dec_ptn_0_lb_36:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_37
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
emt_dec_ptn_0_lb_37:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_50:
; 	map { 2' 4' } ⊢ 1' : @[0].(⟦⟧)◂(t100'(-1)) ≃ ∐[{ } { t100'(-1) @[0] } ]
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
	jc emt_set_ptn_0_lb_53
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_54
emt_set_ptn_0_lb_53:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_54:
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_55
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_56
emt_set_ptn_0_lb_55:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_56:
; ; emt_dec_ptn { 2' 4' }
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_57
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
emt_dec_ptn_0_lb_57:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_58
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
emt_dec_ptn_0_lb_58:
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
	jc call_c_lb_59
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_64
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_65
emt_set_ptn_0_lb_64:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_65:
; ; emt_dec 
; unknown
	jc lb_63
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
lb_63:
	jmp call_nc_lb_60
call_c_lb_59:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_61
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_62
emt_set_ptn_0_lb_61:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_62:
call_nc_lb_60:
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
	jc emt_get_crt_ptn_0_lb_66
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_67
emt_get_crt_ptn_0_lb_66:
; unboxed
	stc
emt_get_crt_ptn_1_lb_67:
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
	jc emt_get_crt_ptn_0_lb_68
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_69
emt_get_crt_ptn_0_lb_68:
; unboxed
	stc
emt_get_crt_ptn_1_lb_69:
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
	jc emt_get_crt_ptn_0_lb_70
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_71
emt_get_crt_ptn_0_lb_70:
; unboxed
	stc
emt_get_crt_ptn_1_lb_71:
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
	jc emt_dec_ptn_0_lb_72
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
emt_dec_ptn_0_lb_72:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_73
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
emt_dec_ptn_0_lb_73:
; 	∎ 3'
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_75
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_76
emt_get_crt_ptn_0_lb_75:
; unboxed
	stc
emt_get_crt_ptn_1_lb_76:
	mov QWORD r8,r11
	jc ret_lb_77
	push r8
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_74
;push_reg
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
emt_dec_ptn_0_lb_74:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_77:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_16:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_79
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_79:
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
	jc emt_get_crt_ptn_0_lb_80
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_81
emt_get_crt_ptn_0_lb_80:
; unboxed
	stc
emt_get_crt_ptn_1_lb_81:
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
	jc emt_get_crt_ptn_0_lb_83
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_84
emt_get_crt_ptn_0_lb_83:
; unboxed
	stc
emt_get_crt_ptn_1_lb_84:
	mov QWORD r9,r10
	jc ret_lb_85
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_82
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_82:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_85:
;clear  0'~f
	bt r12,0
	jc clear_lb_86
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_86:
	mov rax,r9
	stc
	ret
mtc_1_lb_78:
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
