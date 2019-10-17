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
	call f0
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f0:
; 	|» {  }
	jz _f0
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
jmp _f0
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
; 	$ {  } ⊢ ,_r56,_r57 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r56
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r57
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
; 	» 0xr0 |~ 2' : r64
	mov QWORD r11,0x0
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r60,_r61 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r60
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r61
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
; 	» 0xr1 |~ 1' : r64
	mov QWORD rdx,0x1
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r64,_r65 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r64
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r65
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
; 	» 0xr2 |~ 4' : r64
	mov QWORD rdi,0x2
	mov QWORD rcx,rdi
	or r12,0b10000
; 	$ 6' ⊢ ,_r68,_r69 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r68
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r69
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
; 	» 0xrff |~ 6' : r64
	mov QWORD [st_vct+8*0],0xff
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD rsi,r14
	pop r14
	or r12,0b1000000
; 	$ 8' ⊢ ,_r72,_r73 : ,{ },{ }
; emt_ptn_crt_ptn 8',_r72
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; emt_ptn_crt_ptn 8',_r73
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
; 	» 0xrabc |~ 8' : r64
	mov QWORD [st_vct+8*2],0xabc
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD rax,r14
	pop r14
	or r12,0b100000000
	mov QWORD [st_vct+8*2],0
	bts r12,11
; emt_ptn_crt_ptn { 11' {  } },_r75
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
	jc emt_get_crt_ptn_0_lb_123
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_124
emt_get_crt_ptn_0_lb_123:
; unboxed
	stc
emt_get_crt_ptn_1_lb_124:
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
; emt_ptn_crt_ptn { 11' { 8' 12' } },_r71
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
	jc emt_get_crt_ptn_0_lb_125
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_126
emt_get_crt_ptn_0_lb_125:
; unboxed
	stc
emt_get_crt_ptn_1_lb_126:
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
	jc emt_get_crt_ptn_0_lb_127
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_128
emt_get_crt_ptn_0_lb_127:
; unboxed
	stc
emt_get_crt_ptn_1_lb_128:
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
	jc emt_dec_ptn_0_lb_129
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
emt_dec_ptn_0_lb_129:
; unboxed
	mov QWORD rax,1
	bts r12,8
; emt_ptn_crt_ptn { 8' { 6' 13' } },_r67
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
	jc emt_get_crt_ptn_0_lb_131
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_132
emt_get_crt_ptn_0_lb_131:
; unboxed
	stc
emt_get_crt_ptn_1_lb_132:
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
	jc emt_get_crt_ptn_0_lb_133
; boxed
	push rdi
	mov rdi,[st_vct+8*4]
	call inc_r
	mov [st_vct+8*4],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_134
emt_get_crt_ptn_0_lb_133:
; unboxed
	stc
emt_get_crt_ptn_1_lb_134:
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
	jc emt_dec_ptn_0_lb_135
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
emt_dec_ptn_0_lb_135:
; unboxed
	mov QWORD rsi,1
	bts r12,6
; emt_ptn_crt_ptn { 6' { 4' 11' } },_r63
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
	jc emt_get_crt_ptn_0_lb_137
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_138
emt_get_crt_ptn_0_lb_137:
; unboxed
	stc
emt_get_crt_ptn_1_lb_138:
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
	jc emt_get_crt_ptn_0_lb_139
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_140
emt_get_crt_ptn_0_lb_139:
; unboxed
	stc
emt_get_crt_ptn_1_lb_140:
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
	jc emt_dec_ptn_0_lb_141
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
emt_dec_ptn_0_lb_141:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 8' } },_r59
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
	jc emt_get_crt_ptn_0_lb_143
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_144
emt_get_crt_ptn_0_lb_143:
; unboxed
	stc
emt_get_crt_ptn_1_lb_144:
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
	jc emt_get_crt_ptn_0_lb_145
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_146
emt_get_crt_ptn_0_lb_145:
; unboxed
	stc
emt_get_crt_ptn_1_lb_146:
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
	jc emt_dec_ptn_0_lb_147
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
emt_dec_ptn_0_lb_147:
; unboxed
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 6' } },_r55
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
	jc emt_get_crt_ptn_0_lb_149
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_150
emt_get_crt_ptn_0_lb_149:
; unboxed
	stc
emt_get_crt_ptn_1_lb_150:
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
	jc emt_get_crt_ptn_0_lb_151
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_152
emt_get_crt_ptn_0_lb_151:
; unboxed
	stc
emt_get_crt_ptn_1_lb_152:
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
	jc emt_dec_ptn_0_lb_153
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
emt_dec_ptn_0_lb_153:
; unboxed
; 	$ 4' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_155
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_156
emt_set_ptn_0_lb_155:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_156:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_157
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
emt_dec_ptn_0_lb_157:
; 	» g0 _ ⊢ 2' : r64→r64
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_g0],rbx
	mov rbx,QWORD [tmp]
	mov QWORD rcx,_dyn_g0
	mov QWORD r10,rcx
	and r12,~0b100
; 	$ 2' ⊢ ,p0 : ,r64→r64
; emt_ptn_crt_ptn 2',p0
; emt_set_ptn 4'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_158
	push rdi
	mov rdi,r10
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_159
emt_set_ptn_0_lb_158:
	mov rcx,r10
	or r12,0b10000
emt_set_ptn_1_lb_159:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_160
;push_reg
	push QWORD r8
	push QWORD r9
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
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_160:
; 	map { 4' 1' } ⊢ 1' : @[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
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
; push_s_ex  7'~_r68 3'~_r60 5'~_r64 9'~_r72 0'~_r56 10'~_r73
	sub rsp,56
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*6],rdi
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*4],rdx
	mov r14,[st_vct+8*0]
	mov QWORD [rsp+8*3],r14
	mov QWORD [rsp+8*2],r8
	mov r14,[st_vct+8*1]
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,2
	mov r10,r9
	bt r9,1
	jc lb_161
	and r12,~0b100
lb_161:
; emt_ptn_set_ptn { 4' 2' },{ 0' 1' }
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_162
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_163
emt_set_ptn_0_lb_162:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_163:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_164
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_165
emt_set_ptn_0_lb_164:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_165:
; ; emt_dec_ptn { 4' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_166
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
emt_dec_ptn_0_lb_166:
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_167
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
emt_dec_ptn_0_lb_167:
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
	jc call_c_lb_168
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov r14,[rsp+8*1]
	mov [st_vct+8*1],r14
	mov QWORD r8,[rsp+8*2]
	mov r14,[rsp+8*3]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*4]
	mov QWORD r11,[rsp+8*5]
	mov QWORD rdi,[rsp+8*6]
	add rsp,56
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_173
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_174
emt_set_ptn_0_lb_173:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_174:
; ; emt_dec 
; unknown
	jc lb_172
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
lb_172:
	jmp call_nc_lb_169
call_c_lb_168:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov r14,[rsp+8*1]
	mov [st_vct+8*1],r14
	mov QWORD r8,[rsp+8*2]
	mov r14,[rsp+8*3]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*4]
	mov QWORD r11,[rsp+8*5]
	mov QWORD rdi,[rsp+8*6]
	add rsp,56
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_170
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_171
emt_set_ptn_0_lb_170:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_171:
call_nc_lb_169:
; 	∎ 1'
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
	mov QWORD r10,r9
	jc ret_lb_178
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_175
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
emt_dec_ptn_0_lb_175:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_178:
;clear  7'~_r68 3'~_r60 5'~_r64 9'~_r72 0'~_r56 10'~_r73
	bt r12,7
	jc clear_lb_179
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
clear_lb_179:
	bt r12,3
	jc clear_lb_180
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_180:
	bt r12,5
	jc clear_lb_181
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_181:
	bt r12,9
	jc clear_lb_182
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_182:
	bt r12,0
	jc clear_lb_183
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_183:
	bt r12,10
	jc clear_lb_184
;push_reg
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
clear_lb_184:
	mov rax,r10
	stc
	ret
g0:
; 	|» 0'
	jz _g0
	jc emt_etr_c_lb_1
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	pop rbx
;push_reg
	push QWORD r8
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r8
	pop rbx
jmp _g0
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	pop rbx
_g0:
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
; 	add { 1' 2' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 2' },{ 3' 4' }
; emt_ptn_set_ptn 1',3'
; emt_set_ptn 3'
; unboxed
	mov r11,r9
; emt_ptn_set_ptn 2',4'
; emt_set_ptn 4'
; unboxed
	mov rcx,r10
; ; emt_dec_ptn { 1' 2' }
; unboxed
; unboxed
	push rbx
	push r14
	mov rbx,r11
	mov r14,rcx
	add rbx,r14
	stc
	pop r14
; emt_set_ptn 0'
; unboxed
	mov r8,rbx
	pop rbx
; 	∎ 0'
; emt_get_crt_ptn 0'
	mov QWORD r9,r8
	stc
	jc ret_lb_102
	push r9
; ; emt_dec_ptn 0'
; unboxed
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_102:
;clear 
	mov rax,r9
	stc
	ret
map:
; 	|» { 0' 1' }
	jz _map
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
	jc emt_set_ptn_0_lb_3
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_4
emt_set_ptn_0_lb_3:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_4:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_5
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_6
emt_set_ptn_0_lb_5:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_6:
	pop rbx
	pop rbx
_map:
; 	? 1'
; 	∐\ l0 ,,l0=cns◂{ hd0 tl0 }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_11
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_12
emt_set_ptn_0_lb_11:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_12:
; l0=cns◂{ hd0 tl0 }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_14
	jmp test_lb_22
failed_lb_14:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_15
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_15:
	jmp mtc_0_lb_13
test_lb_22:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_18
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_19
emt_set_ptn_0_lb_18:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_19:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_20
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_21
emt_set_ptn_0_lb_20:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_21:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_17
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
emt_dec_ptn_0_lb_17:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_23
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
emt_dec_ptn_0_lb_23:
; 	$ 0' ⊢ ,f,f0 : ,t48'(-1)→t53'(-1),t48'(-1)→t53'(-1)
; emt_ptn_crt_ptn 0',f
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_24
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_25
emt_set_ptn_0_lb_24:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_25:
; emt_ptn_crt_ptn 0',f0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_26
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_27
emt_set_ptn_0_lb_26:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_27:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_28
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
emt_dec_ptn_0_lb_28:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r9
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_46
; 	◂ 1',3' ⊢ 0' : t53'(-1)
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
	jc emt_set_ptn_0_lb_35
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_36
emt_set_ptn_0_lb_35:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_36:
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_37
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
emt_dec_ptn_0_lb_37:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_38
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
emt_dec_ptn_0_lb_38:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_39
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
; ; emt_dec 
; unknown
	jc lb_43
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
lb_43:
	jmp call_nc_lb_40
call_c_lb_39:
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
	jc emt_set_ptn_0_lb_41
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_42
emt_set_ptn_0_lb_41:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_42:
call_nc_lb_40:
	jmp ir_dyn_call_1_lb_47
ir_dyn_call_0_lb_46:
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
	jc emt_get_ptn_0_lb_29
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_30
emt_get_ptn_0_lb_29:
; unboxed
	stc
emt_get_ptn_1_lb_30:
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
	jc emt_get_ptn_0_lb_31
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_32
emt_get_ptn_0_lb_31:
; unboxed
	stc
emt_get_ptn_1_lb_32:
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
	jc emt_dec_ptn_0_lb_33
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
emt_dec_ptn_0_lb_33:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_34
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
emt_dec_ptn_0_lb_34:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_47:
; 	map { 2' 4' } ⊢ 1' : @[0].(⟦⟧)◂(t53'(-1)) ≃ ∐[{ } { t53'(-1) @[0] } ]
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
	jc emt_set_ptn_0_lb_50
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_51
emt_set_ptn_0_lb_50:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_51:
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_52
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_53
emt_set_ptn_0_lb_52:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_53:
; ; emt_dec_ptn { 2' 4' }
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_54
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
emt_dec_ptn_0_lb_54:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_55
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
emt_dec_ptn_0_lb_55:
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
	jc call_c_lb_56
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
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
; ; emt_dec 
; unknown
	jc lb_60
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
lb_60:
	jmp call_nc_lb_57
call_c_lb_56:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_58
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_59
emt_set_ptn_0_lb_58:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_59:
call_nc_lb_57:
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
	jc emt_get_crt_ptn_0_lb_63
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_64
emt_get_crt_ptn_0_lb_63:
; unboxed
	stc
emt_get_crt_ptn_1_lb_64:
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
	jc emt_get_crt_ptn_0_lb_67
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_68
emt_get_crt_ptn_0_lb_67:
; unboxed
	stc
emt_get_crt_ptn_1_lb_68:
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
	jc emt_dec_ptn_0_lb_69
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
emt_dec_ptn_0_lb_69:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_70
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
emt_dec_ptn_0_lb_70:
; 	∎ 3'
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_72
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_73
emt_get_crt_ptn_0_lb_72:
; unboxed
	stc
emt_get_crt_ptn_1_lb_73:
	mov QWORD r8,r11
	jc ret_lb_74
	push r8
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_71
;push_reg
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
emt_dec_ptn_0_lb_71:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_74:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_13:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_76
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_76:
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
	jc emt_get_crt_ptn_0_lb_77
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_78
emt_get_crt_ptn_0_lb_77:
; unboxed
	stc
emt_get_crt_ptn_1_lb_78:
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
	jc emt_get_crt_ptn_0_lb_80
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_81
emt_get_crt_ptn_0_lb_80:
; unboxed
	stc
emt_get_crt_ptn_1_lb_81:
	mov QWORD r9,r10
	jc ret_lb_82
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_79
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_79:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_82:
;clear  0'~f
	bt r12,0
	jc clear_lb_83
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_83:
	mov rax,r9
	stc
	ret
mtc_1_lb_75:
section .data
	_dyn_map:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq map
	_dyn_g0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq g0
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
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
