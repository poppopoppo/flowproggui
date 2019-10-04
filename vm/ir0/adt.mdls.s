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
f2:
; 	|» {  }
	jz _f2
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f2
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	$ {  } ⊢ ,_r33,_r34 : ,{ },{ }
	call dbg
	pushf
	popf
; emt_ptn_crt_ptn {  },_r33
; emt_get_ptn {  }
	push rbx
	push r14
	mov rdi,0
	call mlc
	mov rbx,rax
	mov r8,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r34
; emt_get_ptn {  }
	push rbx
	push r14
	push r8
	mov rdi,0
	call mlc
	mov rbx,rax
	pop r8
	mov r9,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
	call dbg
; 	» 0xrff |~ 2' : r64
	mov r11,0xff
	mov r10,r11
; 	$ { 2' {  } } ⊢ ,v0 : ,{ r64 { } }
	call dbg
	pushf
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r10
	bt r12,2
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r8
	bt r12,0
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r9
	bt r12,1
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	popf
; emt_ptn_crt_ptn { 2' {  } },v0
; emt_get_ptn { 2' {  } }
	push rbx
	push r14
	push r8
	push r9
	push r10
	mov rdi,2
	call mlc
	mov rbx,rax
	pop r10
	pop r9
	pop r8
; emt_get_ptn 2'
	mov r11,r10
	stc
	mov rdx,r11
	mov rdi,rbx
	mov rsi,0
	call exc
; emt_get_ptn {  }
	push rbx
	push r14
	push r8
	push r9
	push r10
	mov rdi,0
	call mlc
	mov rbx,rax
	pop r10
	pop r9
	pop r8
	mov r11,rbx
	pop r14
	pop rbx
	clc
	mov rdx,r11
	mov rdi,rbx
	mov rsi,1
	call exc
	mov r11,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1000
; ; emt_dec_ptn { 2' {  } }
; unboxed
	call dbg
; 	∎ 3'
	push rbx
; emt_get_ptn 3'
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	mov rbx,r11
	clc
; ; emt_dec_ptn 3'
; boxed
	push r8
	push r9
	push r11
	mov rdi,r11
	call dec_r
	pop r11
	pop r9
	pop r8
	push rbx
;clear  0'~_r33 1'~_r34
	bt r12,0
	jc clear_lb_24
	push r9
	mov rdi,r8
	call dec_r
	pop r9
clear_lb_24:
	bt r12,1
	jc clear_lb_25
	mov rdi,r9
	call dec_r
clear_lb_25:
	pop rax
	pop rbx
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
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f3
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f3:
; ⟦⟧
; emt_ptn_crt_ptn {  },_r39
; emt_get_ptn {  }
	push rbx
	push r14
	mov rdi,0
	call mlc
	mov rbx,rax
	mov r8,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1
; ; emt_dec_ptn {  }
	push r8
	mov rdi,2
	call mlc
	btr r12,0
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD r8,rdi
; 	$ 0' ⊢ ,l0 : ,@[0].(⟦⟧)◂(t31'(0)) ≃ ∐[{ } { t31'(0) @[0] } ]
	call dbg
	pushf
	push r8
	mov rsi,str_ret
	mov rdi,r8
	bt r12,0
	call pnt
	call pnt_str_ret
	pop r8
	popf
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_16
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_17
lb_16:
	mov r9,r8
	or r12,0b10
lb_17:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_18
	push r8
	push r9
	mov rdi,r8
	call dec_r
	pop r9
	pop r8
lb_18:
	call dbg
; 	∎ 1'
	push rbx
; emt_get_ptn 1'
	bt r12,1
	jc lb_20
; unboxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_21
lb_20:
; boxed
	stc
lb_21:
	mov rbx,r9
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_19
	push r9
	mov rdi,r9
	call dec_r
	pop r9
lb_19:
	push rbx
;clear 
	pop rax
	pop rbx
	ret
f0:
; 	|» {  }
	jz _f0
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f0
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
; 	$ {  } ⊢ ,_r22,_r23 : ,{ },{ }
	call dbg
	pushf
	popf
; emt_ptn_crt_ptn {  },_r22
; emt_get_ptn {  }
	push rbx
	push r14
	mov rdi,0
	call mlc
	mov rbx,rax
	mov r8,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r23
; emt_get_ptn {  }
	push rbx
	push r14
	push r8
	mov rdi,0
	call mlc
	mov rbx,rax
	pop r8
	mov r9,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
	call dbg
; 	» 0xrff |~ 2' : r64
	mov r11,0xff
	mov r10,r11
; ⟦⟧
; emt_ptn_crt_ptn {  },_r36
; emt_get_ptn {  }
	push rbx
	push r14
	push r8
	push r9
	push r10
	mov rdi,0
	call mlc
	mov rbx,rax
	pop r10
	pop r9
	pop r8
	mov r11,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1000
; ; emt_dec_ptn {  }
	push r8
	push r9
	push r10
	push r11
	mov rdi,2
	call mlc
	btr r12,3
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD r11,rdi
	pop r10
	pop r9
	pop r8
; ⟦
	pushf
	push r8
	push r9
	push r10
	push r11
	mov rsi,str_ret
	mov rdi,r10
	bt r12,2
	call pnt
	call pnt_str_ret
	pop r11
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	push r11
	mov rsi,str_ret
	mov rdi,r11
	bt r12,3
	call pnt
	call pnt_str_ret
	pop r11
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	push r11
	mov rsi,str_ret
	mov rdi,r8
	bt r12,0
	call pnt
	call pnt_str_ret
	pop r11
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	push r11
	mov rsi,str_ret
	mov rdi,r9
	bt r12,1
	call pnt
	call pnt_str_ret
	pop r11
	pop r10
	pop r9
	pop r8
	popf
; emt_ptn_crt_ptn { 2' 3' },_r38
; emt_get_ptn { 2' 3' }
	push rbx
	push r14
	push r8
	push r9
	push r10
	push r11
	mov rdi,2
	call mlc
	mov rbx,rax
	pop r11
	pop r10
	pop r9
	pop r8
; emt_get_ptn 2'
	mov rcx,r10
	stc
	mov rdx,rcx
	mov rdi,rbx
	mov rsi,0
	call exc
; emt_get_ptn 3'
	bt r12,3
	jc lb_3
; unboxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp lb_4
lb_3:
; boxed
	stc
lb_4:
	mov rcx,r11
	mov rdx,rcx
	mov rdi,rbx
	mov rsi,1
	call exc
	mov rcx,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10000
	call dbg
	pushf
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rsi,str_ret
	mov rdi,rcx
	bt r12,4
	call pnt
	call pnt_str_ret
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
	popf
; ; emt_dec_ptn { 2' 3' }
; unknown
	bt r12,3
	jc lb_5
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_5:
; unboxed
	pushf
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rsi,str_ret
	mov rdi,rcx
	bt r12,4
	call pnt
	call pnt_str_ret
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
	popf
	push r8
	push r9
	push rcx
	mov rdi,2
	call mlc
	mov rdi,rax
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
	mov rsi,str_ret
	mov rdi,rdi

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
	call dbg
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
	mov rsi,str_ret
	mov rdi,rdi
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
	mov rsi,str_ret
	mov rdi,rdi
	stc
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
	mov rsi,str_ret
	mov rdi,rdx
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
	bt r12,4
	call exc
	mov QWORD r10,rdi
	btr r12,2
	call dbg
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
	mov rsi,str_ret
	mov rdi,rdi

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
	pushf
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r10
	bt r12,2
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	popf
	pop r9
	pop r8
; 	$ 2' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
	call dbg
	pushf
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r10
	bt r12,2
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r8
	bt r12,0
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	push r8
	push r9
	push r10
	mov rsi,str_ret
	mov rdi,r9
	bt r12,1
	call pnt
	call pnt_str_ret
	pop r10
	pop r9
	pop r8
	popf
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 3'
; unknown
	bt r12,2
	jc lb_8
	push rdi
	mov rdi,r10
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp lb_9
lb_8:
	mov r11,r10
	or r12,0b1000
lb_9:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_10
	push r8
	push r9
	push r10
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_10:
	call dbg
; 	∎ 3'
	push rbx
; emt_get_ptn 3'
	bt r12,3
	jc lb_14
; unboxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp lb_15
lb_14:
; boxed
	stc
lb_15:
	mov rbx,r11
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc lb_11
	push r8
	push r9
	push r11
	mov rdi,r11
	call dec_r
	pop r11
	pop r9
	pop r8
lb_11:
	push rbx
;clear  0'~_r22 1'~_r23
	bt r12,0
	jc clear_lb_12
	push r9
	mov rdi,r8
	call dec_r
	pop r9
clear_lb_12:
	bt r12,1
	jc clear_lb_13
	mov rdi,r9
	call dec_r
clear_lb_13:
	pop rax
	pop rbx
	ret
