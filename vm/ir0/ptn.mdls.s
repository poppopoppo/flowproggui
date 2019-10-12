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
; 	$ {  } ⊢ ,_r63,_r64 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r63
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r64
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
	mov rsi,[cst_stg_87+8*0]
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
; 	$ 1' ⊢ ,_r67,_r68 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r67
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r68
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
	mov rsi,[cst_stg_93+8*0]
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
; emt_ptn_crt_ptn {  },_r91
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
; emt_ptn_crt_ptn { 1' 5' },_r94
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
	push QWORD rsi
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_94
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_95
emt_get_crt_ptn_0_lb_94:
; unboxed
	stc
emt_get_crt_ptn_1_lb_95:
	mov rdi,r9
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rsi
	push QWORD rsi
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_96
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_97
emt_get_crt_ptn_0_lb_96:
; unboxed
	stc
emt_get_crt_ptn_1_lb_97:
	mov rdi,rdx
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rsi
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
	jc emt_dec_ptn_0_lb_98
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
emt_dec_ptn_0_lb_98:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_99
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
emt_dec_ptn_0_lb_99:
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
; emt_ptn_crt_ptn { 2' 1' },_r96
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
	push QWORD rdx
	push QWORD rdx
; emt_get_ptn 2'
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
	mov rsi,r10
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
	pop QWORD rdx
	push QWORD rdx
	push QWORD rdx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_103
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_104
emt_get_crt_ptn_0_lb_103:
; unboxed
	stc
emt_get_crt_ptn_1_lb_104:
	mov rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
	pop QWORD rdx
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
	jc emt_dec_ptn_0_lb_105
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
emt_dec_ptn_0_lb_105:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_106
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
emt_dec_ptn_0_lb_106:
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
	bt r12,5
	call exc
	mov QWORD r9,rdi
	btr r12,1
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
	jc emt_set_ptn_0_lb_108
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_109
emt_set_ptn_0_lb_108:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_109:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_110
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
emt_dec_ptn_0_lb_110:
; 	? 2'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_111
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_112
emt_set_ptn_0_lb_111:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_112:
; l0=nil◂{  }
	mov rdx,[r9+8*1]
	cmp rdx,0
	jnz failed_lb_114
	jmp test_lb_118
failed_lb_114:
;test 0
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
;clear  1'~l0
	bt r12,1
	jc clear_lb_115
	mov rdi,r9
	call dec_r
clear_lb_115:
	jmp mtc_0_lb_113
test_lb_118:
	mov rdx,[r9+8*2]
	bt rdx,1
; emt_set_ptn {  }
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_117
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
emt_dec_ptn_0_lb_117:
; 	» "t" |~ 1' : ℙ
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_119+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
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
	jc emt_set_ptn_0_lb_120
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_121
emt_set_ptn_0_lb_120:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_121:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_122
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
emt_dec_ptn_0_lb_122:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_124
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_125
emt_get_crt_ptn_0_lb_124:
; unboxed
	stc
emt_get_crt_ptn_1_lb_125:
	mov r9,r10
	jc ret_lb_126
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_123
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
emt_dec_ptn_0_lb_123:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_126:
;clear  3'~_r67 4'~_r68 0'~_r63
	bt r12,3
	jc clear_lb_127
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_127:
	bt r12,4
	jc clear_lb_128
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_128:
	bt r12,0
	jc clear_lb_129
	mov rdi,r8
	call dec_r
clear_lb_129:
	mov rax,r9
	stc
	ret
mtc_0_lb_113:
; 	∐\ _ ,
; emt_ptn_crt_ptn 2',_
; emt_set_ptn -2'
; 	» "f" |~ 1' : ℙ
	push QWORD r8
	push QWORD r11
	push QWORD rcx
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
	mov rdi,r9
	call dec_r
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_134:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_136
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_137
emt_get_crt_ptn_0_lb_136:
; unboxed
	stc
emt_get_crt_ptn_1_lb_137:
	mov r9,r10
	jc ret_lb_138
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_135
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
emt_dec_ptn_0_lb_135:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_138:
;clear  3'~_r67 4'~_r68 0'~_r63
	bt r12,3
	jc clear_lb_139
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_139:
	bt r12,4
	jc clear_lb_140
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_140:
	bt r12,0
	jc clear_lb_141
	mov rdi,r8
	call dec_r
clear_lb_141:
	mov rax,r9
	stc
	ret
mtc_1_lb_130:
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
; 	$ {  } ⊢ ,_r50,_r51 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r50
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r51
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
; 	$ 1' ⊢ ,_r54,_r55 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r54
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r55
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
; emt_ptn_crt_ptn {  },_r82
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
; emt_ptn_crt_ptn { 1' 5' },_r85
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
	push QWORD rsi
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
	pop QWORD rsi
	push QWORD rsi
	push QWORD rdx
	push QWORD rsi
; emt_get_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_67
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_68
emt_get_crt_ptn_0_lb_67:
; unboxed
	stc
emt_get_crt_ptn_1_lb_68:
	mov rdi,rdx
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rsi
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
	jc emt_dec_ptn_0_lb_69
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
emt_dec_ptn_0_lb_69:
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
; emt_ptn_crt_ptn { 2' 1' },_r87
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
	push QWORD rdx
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
	pop QWORD rdx
	push QWORD rdx
	push QWORD rdx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_72
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_73
emt_get_crt_ptn_0_lb_72:
; unboxed
	stc
emt_get_crt_ptn_1_lb_73:
	mov rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
	pop QWORD rdx
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
	jc emt_dec_ptn_0_lb_74
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
emt_dec_ptn_0_lb_74:
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
	bt r12,5
	call exc
	mov QWORD r9,rdi
	btr r12,1
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
	jc emt_set_ptn_0_lb_77
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_78
emt_set_ptn_0_lb_77:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_78:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_79
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
emt_dec_ptn_0_lb_79:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_81
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_82
emt_get_crt_ptn_0_lb_81:
; unboxed
	stc
emt_get_crt_ptn_1_lb_82:
	mov r9,r10
	jc ret_lb_83
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_80
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
emt_dec_ptn_0_lb_80:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_83:
;clear  3'~_r54 4'~_r55 0'~_r50
	bt r12,3
	jc clear_lb_84
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
	pop QWORD rcx
	pop QWORD r8
clear_lb_84:
	bt r12,4
	jc clear_lb_85
	push QWORD r8
	mov rdi,rcx
	call dec_r
	pop QWORD r8
clear_lb_85:
	bt r12,0
	jc clear_lb_86
	mov rdi,r8
	call dec_r
clear_lb_86:
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
	mov rsi,[cst_stg_46+8*0]
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
	jc emt_set_ptn_0_lb_47
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_48
emt_set_ptn_0_lb_47:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_48:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_49
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_49:
; 	» "b" |~ 0' : ℙ
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_50+8*0]
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
	jc emt_set_ptn_0_lb_51
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_52
emt_set_ptn_0_lb_51:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_52:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_53
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_53:
; 	$ { 1' 2' } ⊢ ,{ s0 _ } : ,{ ℙ ℙ }
; emt_ptn_crt_ptn { 1' 2' },{ s0 _ }
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_54
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_55
emt_set_ptn_0_lb_54:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_55:
; emt_ptn_crt_ptn 2',_
; emt_set_ptn -2'
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_56
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_56:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_57
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_57:
; 	∎ 0'
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_59
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_60
emt_get_crt_ptn_0_lb_59:
; unboxed
	stc
emt_get_crt_ptn_1_lb_60:
	mov r9,r8
	jc ret_lb_61
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_58
	push QWORD r8
	mov rdi,r8
	call dec_r
	pop QWORD r8
emt_dec_ptn_0_lb_58:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_61:
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
; ; emt_dec_ptn 0'
; unboxed
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
; 	» "a" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_14+8*0]
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
	jc emt_set_ptn_0_lb_15
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_16
emt_set_ptn_0_lb_15:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_16:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_17
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_17:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_19
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_20
emt_get_crt_ptn_0_lb_19:
; unboxed
	stc
emt_get_crt_ptn_1_lb_20:
	mov r8,r9
	jc ret_lb_21
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_18
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_18:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_21:
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
	jnz failed_lb_25
	jmp test_r64_lb_27
failed_lb_25:
; ; emt_dec_ptn 0'
; unboxed
;clear  0'~s0
	bt r12,0
	jc clear_lb_26
	mov rdi,r8
	call dec_r
clear_lb_26:
	jmp mtc_1_lb_24
test_r64_lb_27:
; ; emt_dec_ptn 0'
; unboxed
; 	» "b" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_29+8*0]
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
	jc emt_set_ptn_0_lb_30
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_31
emt_set_ptn_0_lb_30:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_31:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_32
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_32:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_34
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_35
emt_get_crt_ptn_0_lb_34:
; unboxed
	stc
emt_get_crt_ptn_1_lb_35:
	mov r8,r9
	jc ret_lb_36
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_33
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_33:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_36:
;clear 
	mov rax,r8
	stc
	ret
mtc_1_lb_24:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; 	» "c" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_38+8*0]
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
	jc emt_set_ptn_0_lb_39
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_40
emt_set_ptn_0_lb_39:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_40:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_41
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_41:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_43
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_44
emt_get_crt_ptn_0_lb_43:
; unboxed
	stc
emt_get_crt_ptn_1_lb_44:
	mov r8,r9
	jc ret_lb_45
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_42
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
emt_dec_ptn_0_lb_42:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_45:
;clear 
	mov rax,r8
	stc
	ret
mtc_2_lb_37:
section .data
	cst_stg_131: db "f",0,0,0,0,0,0,0
	cst_stg_119: db "t",0,0,0,0,0,0,0
	cst_stg_93: db "Y",0,0,0,0,0,0,0
	cst_stg_87: db "X",0,0,0,0,0,0,0
	cst_stg_50: db "b",0,0,0,0,0,0,0
	cst_stg_46: db "a",0,0,0,0,0,0,0
	cst_stg_38: db "c",0,0,0,0,0,0,0
	cst_stg_29: db "b",0,0,0,0,0,0,0
	cst_stg_14: db "a",0,0,0,0,0,0,0
