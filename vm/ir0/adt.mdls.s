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
; 	$ {  } ⊢ ,_r48,_r49 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r48
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
; emt_ptn_crt_ptn {  },_r49
; emt_get_ptn {  }
	push rbx
	push r14
	push QWORD r8
	mov rdi,0
	call mlc
	mov rbx,rax
	pop QWORD r8
	mov r9,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xrff |~ 2' : r64
	mov QWORD r11,0xff
	mov QWORD r10,r11
	or r12,0b100
; 	$ { 2' {  } } ⊢ ,v0 : ,{ r64 { } }
; emt_ptn_crt_ptn { 2' {  } },v0
; emt_get_ptn { 2' {  } }
	push rbx
	push r14
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov rbx,rax
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov rbx,rax
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,r11
	call dec_r
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	push rbx
;clear  0'~_r48 1'~_r49
	bt r12,0
	jc clear_lb_57
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
clear_lb_57:
	bt r12,1
	jc clear_lb_58
	mov rdi,r9
	call dec_r
clear_lb_58:
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
; emt_ptn_crt_ptn {  },_r57
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
	push QWORD r8
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
; 	$ 0' ⊢ ,l0 : ,@[0].(⟦⟧)◂(t46'(0)) ≃ ∐[{ } { t46'(0) @[0] } ]
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_49
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_50
lb_49:
	mov r9,r8
	or r12,0b10
lb_50:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_51
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_51:
; 	∎ 1'
	push rbx
; emt_get_ptn 1'
	bt r12,1
	jc lb_53
; unboxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_54
lb_53:
; boxed
	stc
lb_54:
	mov rbx,r9
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_52
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
lb_52:
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
	push QWORD r8
	mov rdi,0
	call mlc
	mov rbx,rax
	pop QWORD r8
	mov r9,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xrff |~ 2' : r64
	mov QWORD r11,0xff
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r26,_r27 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r26
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r27
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
; 	» 0xraa |~ 1' : r64
	mov QWORD rdx,0xaa
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r30,_r31 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r30
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r31
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
; 	» 0xr4 |~ 4' : r64
	mov QWORD rdi,0x4
	mov QWORD rcx,rdi
	or r12,0b10000
; 	$ 6' ⊢ ,_r34,_r35 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r34
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r35
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr5 |~ 6' : r64
	mov QWORD [st_vct+8*0],0x5
	mov QWORD rsi,[st_vct+8*0]
	or r12,0b1000000
; ⟦⟧
; emt_ptn_crt_ptn {  },_r51
; emt_get_ptn {  }
	push rbx
	push r14
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
	mov rbx,rax
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	mov [st_vct+8*0],rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1000000000
; ; emt_dec_ptn {  }
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
	mov rdi,2
	call mlc
	btr r12,9
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD [st_vct+8*0],rdi
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; ⟦
	pushf
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
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	mov rsi,str_ret
	bt r12,8
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 6' 9' },_r53
; emt_get_ptn { 6' 9' }
	push rbx
	push r14
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
	mov rbx,rax
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; emt_get_ptn 6'
	mov [st_vct+8*1],rsi
	stc
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*1]
	mov rdi,rbx
	mov rsi,0
	call exc
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
; emt_get_ptn 9'
	bt r12,9
	jc lb_18
; unboxed
	push rdi
	mov rdi,[st_vct+8*0]
	call inc_r
	mov [st_vct+8*0],rdi
	pop rdi
	clc
	jmp lb_19
lb_18:
; boxed
	stc
lb_19:
	push rbx
	mov QWORD rbx,[st_vct+8*0]
	mov QWORD [st_vct+8*1],rbx
	pop rbx
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*1]
	mov rdi,rbx
	mov rsi,1
	call exc
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
	mov [st_vct+8*1],rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10000000000
	call dbg
	pushf
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
	mov rsi,str_ret
; test 0
	bt r12,10
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; ; emt_dec_ptn { 6' 9' }
; unknown
	bt r12,9
	jc lb_20
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*0]
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
lb_20:
; unboxed
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
	mov rdi,2
	call mlc
	mov rdi,rax
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
	bt r12,10
	call exc
	mov QWORD rsi,rdi
	btr r12,6
	call dbg
	pushf
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
	mov rsi,str_ret
; test 0
	bt r12,6
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; ⟦
	pushf
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
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	mov rsi,str_ret
	bt r12,8
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 4' 6' },_r54
; emt_get_ptn { 4' 6' }
	push rbx
	push r14
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
	mov rbx,rax
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; emt_get_ptn 4'
	mov [st_vct+8*0],rcx
	stc
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*0]
	mov rdi,rbx
	mov rsi,0
	call exc
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
; emt_get_ptn 6'
	bt r12,6
	jc lb_23
; unboxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp lb_24
lb_23:
; boxed
	stc
lb_24:
	mov [st_vct+8*0],rsi
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*0]
	mov rdi,rbx
	mov rsi,1
	call exc
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
	mov [st_vct+8*0],rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1000000000
	call dbg
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
; test 0
	bt r12,9
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; ; emt_dec_ptn { 4' 6' }
; unknown
	bt r12,6
	jc lb_25
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_25:
; unboxed
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*0]
	mov rdi,2
	call mlc
	mov rdi,rax
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
	bt r12,9
	call exc
	mov QWORD rcx,rdi
	btr r12,4
	call dbg
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rcx
	mov rsi,str_ret
; test 0
	bt r12,4
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; ⟦
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	mov rsi,str_ret
	bt r12,8
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 1' 4' },_r55
; emt_get_ptn { 1' 4' }
	push rbx
	push r14
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
	mov rbx,rax
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; emt_get_ptn 1'
	mov rsi,r9
	stc
	push QWORD rax
	push QWORD rdi
	push QWORD rdx
	mov rdx,rsi
	mov rdi,rbx
	mov rsi,0
	call exc
	pop QWORD rdx
	pop QWORD rdi
	pop QWORD rax
; emt_get_ptn 4'
	bt r12,4
	jc lb_28
; unboxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp lb_29
lb_28:
; boxed
	stc
lb_29:
	mov rsi,rcx
	push QWORD rax
	push QWORD rdi
	push QWORD rdx
	mov rdx,rsi
	mov rdi,rbx
	mov rsi,1
	call exc
	pop QWORD rdx
	pop QWORD rdi
	pop QWORD rax
	mov rsi,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b1000000
	call dbg
	pushf
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
	mov rsi,str_ret
; test 0
	bt r12,6
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; ; emt_dec_ptn { 1' 4' }
; unknown
	bt r12,4
	jc lb_30
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
lb_30:
; unboxed
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
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
	call dbg
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	mov rsi,str_ret
; test 0
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
; ⟦
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	mov rsi,str_ret
	bt r12,8
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 2' 1' },_r56
; emt_get_ptn { 2' 1' }
	push rbx
	push r14
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rbx,rax
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; emt_get_ptn 2'
	mov rcx,r10
	stc
	push QWORD rax
	push QWORD rdi
	push QWORD rdx
	mov rdx,rcx
	mov rdi,rbx
	mov rsi,0
	call exc
	pop QWORD rdx
	pop QWORD rdi
	pop QWORD rax
; emt_get_ptn 1'
	bt r12,1
	jc lb_33
; unboxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_34
lb_33:
; boxed
	stc
lb_34:
	mov rcx,r9
	push QWORD rax
	push QWORD rdi
	push QWORD rdx
	mov rdx,rcx
	mov rdi,rbx
	mov rsi,1
	call exc
	pop QWORD rdx
	pop QWORD rdi
	pop QWORD rax
	mov rcx,rbx
	pop r14
	pop rbx
	clc
	and r12,~0b10000
	call dbg
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,rcx
	mov rsi,str_ret
; test 0
	bt r12,4
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; ; emt_dec_ptn { 2' 1' }
; unknown
	bt r12,1
	jc lb_35
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	call dec_r
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_35:
; unboxed
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rdi,rax
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
	call dbg
	pushf
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	mov rsi,str_ret
; test 0
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	popf
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
; 	$ 1' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_38
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_39
lb_38:
	mov r10,r9
	or r12,0b100
lb_39:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_40
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r9
	call dec_r
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_40:
; 	∎ 2'
	push rbx
; emt_get_ptn 2'
	bt r12,2
	jc lb_47
; unboxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_48
lb_47:
; boxed
	stc
lb_48:
	mov rbx,r10
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_41
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,r10
	call dec_r
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
lb_41:
	push rbx
;clear  8'~_r35 7'~_r34 3'~_r26 5'~_r30 0'~_r22
	bt r12,8
	jc clear_lb_42
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,rax
	call dec_r
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_42:
	bt r12,7
	jc clear_lb_43
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rdi
	call dec_r
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_43:
	bt r12,3
	jc clear_lb_44
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
	pop QWORD rdx
	pop QWORD r8
clear_lb_44:
	bt r12,5
	jc clear_lb_45
	push QWORD r8
	mov rdi,rdx
	call dec_r
	pop QWORD r8
clear_lb_45:
	bt r12,0
	jc clear_lb_46
	mov rdi,r8
	call dec_r
clear_lb_46:
	pop rax
	pop rbx
	ret
