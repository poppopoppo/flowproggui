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
	call f3
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
; 	$ {  } ⊢ ,_r26,_r27 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r26
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r27
; emt_get_ptn {  }
	push r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xrff |~ 2' : r64
	mov r11,0xff
	mov r10,r11
; 	$ { 2' {  } } ⊢ ,v0 : ,{ r64 { } }
; emt_ptn_crt_ptn { 2' {  } },v0
; emt_get_ptn { 2' {  } }
	push r8
	push r9
	push r10
	mov rdi,2
	call mlc
	mov r11,rax
	pop r10
	pop r9
	pop r8
	push r11
; emt_get_ptn 2'
	mov r11,r10
	stc
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
	push r11
; emt_get_ptn {  }
	push r8
	push r9
	push r10
	mov rdi,0
	call mlc
	mov r11,rax
	pop r10
	pop r9
	pop r8
	clc
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
	clc
	and r12,~0b1000
; ; emt_dec_ptn { 2' {  } }
; unboxed
; 	∎ 3'
;clear  0'~_r26 1'~_r27
	bt r12,0
	jc clear_lb_8
	push r9
	mov rdi,r8
	call dec_r
	pop r9
clear_lb_8:
	bt r12,1
	jc clear_lb_9
	mov rdi,r9
	call dec_r
clear_lb_9:
	push rbx
; emt_get_ptn 3'
	mov rbx,r11
	clc
	mov rax,rbx
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
; emt_ptn_crt_ptn {  },_r29
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
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
; 	$ 0' ⊢ ,l0 : ,@[0].(⟦⟧)◂(t24'(0)) ≃ ∐[{ } { t24'(0) @[0] } ]
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_4
	push rdi
	mov rdi,r8
	call inc_r
	pop rdi
	mov r9,rdi
	and r12,~0b10
	jmp lb_5
lb_4:
	mov r9,r8
	or r12,0b10
lb_5:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_6
	push r8
	push r9
	mov rdi,r8
	call dec_r
	pop r9
	pop r8
lb_6:
; 	∎ 1'
;clear 
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
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
; 	$ {  } ⊢ ,_r21 : ,{ }
; emt_ptn_crt_ptn {  },_r21
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; ; emt_dec_ptn {  }
; 	$ { {  } } ⊢ ,l0 : ,{ { } }
; emt_ptn_crt_ptn { {  } },l0
; emt_get_ptn { {  } }
	push r8
	mov rdi,1
	call mlc
	mov r9,rax
	pop r8
	push r9
; emt_get_ptn {  }
	push r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop r8
	clc
	mov rdx,r9
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
	clc
	and r12,~0b10
; ; emt_dec_ptn { {  } }
; 	∎ 1'
;clear  0'~_r21
	bt r12,0
	jc clear_lb_3
	mov rdi,r8
	call dec_r
clear_lb_3:
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	clc
	mov rax,rbx
	pop rbx
	ret
