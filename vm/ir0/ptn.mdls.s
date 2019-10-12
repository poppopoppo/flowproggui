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
	call test2
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test2:
; 	|» {  }
	jz _test2
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test2
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test2:
; 	$ {  } ⊢ ,_r67,_r68 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r67
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r68
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
	mov rsi,[cst_stg_90+8*0]
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
; 	$ 1' ⊢ ,_r71,_r72 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r71
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r72
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
	mov rsi,[cst_stg_96+8*0]
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
; emt_ptn_crt_ptn {  },_r97
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
; emt_ptn_crt_ptn { 1' 5' },_r100
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
	jc emt_get_crt_ptn_0_lb_99
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_100
emt_get_crt_ptn_0_lb_99:
; unboxed
	stc
emt_get_crt_ptn_1_lb_100:
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
	jc emt_dec_ptn_0_lb_101
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
emt_dec_ptn_0_lb_101:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_102
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
emt_dec_ptn_0_lb_102:
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
; emt_ptn_crt_ptn { 2' 1' },_r102
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
	jc emt_get_crt_ptn_0_lb_104
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_105
emt_get_crt_ptn_0_lb_104:
; unboxed
	stc
emt_get_crt_ptn_1_lb_105:
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
	jc emt_get_crt_ptn_0_lb_106
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_107
emt_get_crt_ptn_0_lb_106:
; unboxed
	stc
emt_get_crt_ptn_1_lb_107:
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
	jc emt_dec_ptn_0_lb_108
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
emt_dec_ptn_0_lb_108:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_109
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
emt_dec_ptn_0_lb_109:
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
	jc emt_set_ptn_0_lb_111
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_112
emt_set_ptn_0_lb_111:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_112:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_113
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
emt_dec_ptn_0_lb_113:
; 	$ 2' ⊢ ,l0,l1 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ],@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_114
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_115
emt_set_ptn_0_lb_114:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_115:
; emt_ptn_crt_ptn 2',l1
; emt_set_ptn 5'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_116
	push rdi
	mov rdi,r10
	call inc_r
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
	jmp emt_set_ptn_1_lb_117
emt_set_ptn_0_lb_116:
	mov rdx,r10
	or r12,0b100000
emt_set_ptn_1_lb_117:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_118
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
emt_dec_ptn_0_lb_118:
; 	? 1'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_119
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_120
emt_set_ptn_0_lb_119:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_120:
; l0=nil◂{  }
	mov rsi,[r10+8*1]
	cmp rsi,0
	jnz failed_lb_122
	jmp test_lb_126
failed_lb_122:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_123
	mov rdi,r10
	call dec_r
clear_lb_123:
	jmp mtc_0_lb_121
test_lb_126:
	mov rsi,[r10+8*2]
	bt r12,6
; emt_set_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_125
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
emt_dec_ptn_0_lb_125:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_127
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
emt_dec_ptn_0_lb_127:
; 	» "t" |~ 1' : ℙ
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_128+8*0]
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
	jc emt_set_ptn_0_lb_129
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_130
emt_set_ptn_0_lb_129:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_130:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_131
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
emt_dec_ptn_0_lb_131:
; 	∎ 5'
; emt_get_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_133
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_134
emt_get_crt_ptn_0_lb_133:
; unboxed
	stc
emt_get_crt_ptn_1_lb_134:
	mov r9,rdx
	jc ret_lb_135
	push r9
; ; emt_dec_ptn 5'
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_132
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
emt_dec_ptn_0_lb_132:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_135:
;clear  2'~y 3'~_r71 4'~_r72 0'~_r67
	bt r12,2
	jc clear_lb_136
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_136:
	bt r12,3
	jc clear_lb_137
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_137:
	bt r12,4
	jc clear_lb_138
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_138:
	bt r12,0
	jc clear_lb_139
	mov rdi,r8
	call dec_r
clear_lb_139:
	mov rax,r9
	stc
	ret
mtc_0_lb_121:
; 	∐\ l0 ,,l0=cns◂{ hd tl }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_140
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_141
emt_set_ptn_0_lb_140:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_141:
; l0=cns◂{ hd tl }
	mov rax,[r10+8*1]
	cmp rax,1
	jnz failed_lb_143
	jmp test_lb_151
failed_lb_143:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_144
	mov rdi,r10
	call dec_r
clear_lb_144:
	jmp mtc_1_lb_142
test_lb_151:
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
	jc emt_set_ptn_0_lb_147
	push rdi
	mov rdi,rax
	call inc_r
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
	jmp emt_set_ptn_1_lb_148
emt_set_ptn_0_lb_147:
	mov rsi,rax
	or r12,0b1000000
emt_set_ptn_1_lb_148:
	pop rax
	push rax
	push r14
	mov r14,[rax]
	bt r14,1
	mov rax,[rax+8*2]
	pop r14
; emt_set_ptn 7'
; unknown
	jc emt_set_ptn_0_lb_149
	mov rdi,rax
	call inc_r
	mov rdi,rdi
	and r12,~0b10000000
	jmp emt_set_ptn_1_lb_150
emt_set_ptn_0_lb_149:
	mov rdi,rax
	or r12,0b10000000
emt_set_ptn_1_lb_150:
	pop rax
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_146
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
emt_dec_ptn_0_lb_146:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_152
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
emt_dec_ptn_0_lb_152:
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
	mov rsi,[cst_stg_153+8*0]
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
	jc emt_set_ptn_0_lb_154
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_155
emt_set_ptn_0_lb_154:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_155:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_156
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
emt_dec_ptn_0_lb_156:
; 	∎ 7'
; emt_get_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_158
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_159
emt_get_crt_ptn_0_lb_158:
; unboxed
	stc
emt_get_crt_ptn_1_lb_159:
	mov r9,rdi
	jc ret_lb_160
	push r9
; ; emt_dec_ptn 7'
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_157
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
emt_dec_ptn_0_lb_157:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_160:
;clear  2'~y 6'~hd 3'~_r71 5'~l1 4'~_r72 0'~_r67
	bt r12,2
	jc clear_lb_161
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
clear_lb_161:
	bt r12,6
	jc clear_lb_162
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
clear_lb_162:
	bt r12,3
	jc clear_lb_163
	push QWORD r8
	push QWORD rcx
	push QWORD rdx
	mov rdi,r11
	call dec_r
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r8
clear_lb_163:
	bt r12,5
	jc clear_lb_164
	push QWORD r8
	push QWORD rcx
	mov rdi,rdx
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_164:
	bt r12,4
	jc clear_lb_165
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_165:
	bt r12,0
	jc clear_lb_166
	mov rdi,r8
	call dec_r
clear_lb_166:
	mov rax,r9
	stc
	ret
mtc_1_lb_142:
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
; 	$ {  } ⊢ ,_r54,_r55 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r54
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r55
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
; 	$ 1' ⊢ ,_r58,_r59 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r58
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r59
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
; emt_ptn_crt_ptn {  },_r88
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
; emt_ptn_crt_ptn { 1' 5' },_r91
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
	jc emt_get_crt_ptn_0_lb_70
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_71
emt_get_crt_ptn_0_lb_70:
; unboxed
	stc
emt_get_crt_ptn_1_lb_71:
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
	jc emt_dec_ptn_0_lb_72
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
emt_dec_ptn_0_lb_72:
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
; emt_ptn_crt_ptn { 2' 1' },_r93
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
	jc emt_get_crt_ptn_0_lb_75
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_76
emt_get_crt_ptn_0_lb_75:
; unboxed
	stc
emt_get_crt_ptn_1_lb_76:
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
	jc emt_dec_ptn_0_lb_77
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
emt_dec_ptn_0_lb_77:
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
	jc emt_set_ptn_0_lb_80
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_81
emt_set_ptn_0_lb_80:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_81:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_82
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
emt_dec_ptn_0_lb_82:
; 	∎ 2'
; emt_get_ptn 2'
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
	mov r9,r10
	jc ret_lb_86
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_83
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
emt_dec_ptn_0_lb_83:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_86:
;clear  3'~_r58 4'~_r59 0'~_r54
	bt r12,3
	jc clear_lb_87
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_87:
	bt r12,4
	jc clear_lb_88
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_88:
	bt r12,0
	jc clear_lb_89
	mov rdi,r8
	call dec_r
clear_lb_89:
	mov rax,r9
	stc
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test4
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test4:
; 	» "a" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_49+8*0]
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
	jc emt_set_ptn_0_lb_50
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_51
emt_set_ptn_0_lb_50:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_51:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_52
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_52:
; 	» "b" |~ 0' : ℙ
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_53+8*0]
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
	jc emt_set_ptn_0_lb_54
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_55
emt_set_ptn_0_lb_54:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_55:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_56
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_56:
; 	$ { 1' 2' } ⊢ ,{ s0 _ } : ,{ ℙ ℙ }
; emt_ptn_crt_ptn { 1' 2' },{ s0 _ }
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_57
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_58
emt_set_ptn_0_lb_57:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_58:
; emt_ptn_crt_ptn 2',_
; emt_set_ptn -2'
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_59
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_59:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_60
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_60:
; 	∎ 0'
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_62
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_63
emt_get_crt_ptn_0_lb_62:
; unboxed
	stc
emt_get_crt_ptn_1_lb_63:
	mov r9,r8
	jc ret_lb_64
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_61
	push QWORD r8
	mov rdi,r8
	call dec_r
	pop QWORD r8
emt_dec_ptn_0_lb_61:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_64:
;clear 
	mov rax,r9
	stc
	ret
test3:
; 	|» {  }
	jz _test3
	jc emt_etr_c_lb_3
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test3
emt_etr_c_lb_3:
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
	jnz failed_lb_10
	jmp test_r64_lb_12
failed_lb_10:
;clear  0'~s0
	bt r12,0
	jc clear_lb_11
	mov rdi,r8
	call dec_r
clear_lb_11:
	jmp mtc_0_lb_9
test_r64_lb_12:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "a" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_15+8*0]
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
	jc emt_set_ptn_0_lb_16
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_17
emt_set_ptn_0_lb_16:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_17:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_18
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_18:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_20
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_21
emt_get_crt_ptn_0_lb_20:
; unboxed
	stc
emt_get_crt_ptn_1_lb_21:
	mov r8,r9
	jc ret_lb_22
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_19
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_19:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_22:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_9:
; 	∐\ s0 ,,s0=0xrff
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; s0=0xrff
	mov QWORD r10,0xff
	cmp r8,r10
	jnz failed_lb_26
	jmp test_r64_lb_28
failed_lb_26:
;clear  0'~s0
	bt r12,0
	jc clear_lb_27
	mov rdi,r8
	call dec_r
clear_lb_27:
	jmp mtc_1_lb_25
test_r64_lb_28:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "b" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_31+8*0]
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
	jc emt_set_ptn_0_lb_32
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_33
emt_set_ptn_0_lb_32:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_33:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_34
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_34:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_36
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_37
emt_get_crt_ptn_0_lb_36:
; unboxed
	stc
emt_get_crt_ptn_1_lb_37:
	mov r8,r9
	jc ret_lb_38
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_35
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_35:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_38:
;clear 
	mov rax,r8
	stc
	ret
mtc_1_lb_25:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unboxed
; 	» "c" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_41+8*0]
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
	jc emt_set_ptn_0_lb_42
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_43
emt_set_ptn_0_lb_42:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_43:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_44
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_44:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_46
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_47
emt_get_crt_ptn_0_lb_46:
; unboxed
	stc
emt_get_crt_ptn_1_lb_47:
	mov r8,r9
	jc ret_lb_48
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_45
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_45:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_48:
;clear 
	mov rax,r8
	stc
	ret
mtc_2_lb_39:
section .data
	cst_stg_153: db "f",0,0,0,0,0,0,0
	cst_stg_128: db "t",0,0,0,0,0,0,0
	cst_stg_96: db "Y",0,0,0,0,0,0,0
	cst_stg_90: db "X",0,0,0,0,0,0,0
	cst_stg_53: db "b",0,0,0,0,0,0,0
	cst_stg_49: db "a",0,0,0,0,0,0,0
	cst_stg_41: db "c",0,0,0,0,0,0,0
	cst_stg_31: db "b",0,0,0,0,0,0,0
	cst_stg_15: db "a",0,0,0,0,0,0,0
