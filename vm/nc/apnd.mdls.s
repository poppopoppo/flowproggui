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
	call f2
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
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f2
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	» some _ ⊢ 0' : t70'(0)→(opn)◂(t70'(0))
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t71'(0)→(opn)◂(t71'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_84
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_85
emt_set_ptn_0_lb_84:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_85:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_86
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_86:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t72'(0)) }) }) })
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t73'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_87
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_88
emt_set_ptn_0_lb_87:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_88:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_89
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
emt_dec_ptn_0_lb_89:
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
	jc emt_get_crt_ptn_0_lb_92
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_93
emt_get_crt_ptn_0_lb_92:
; unboxed
	stc
emt_get_crt_ptn_1_lb_93:
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
	jc emt_get_crt_ptn_0_lb_94
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_95
emt_get_crt_ptn_0_lb_94:
; unboxed
	stc
emt_get_crt_ptn_1_lb_95:
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
	jc ret_lb_96
	push r8
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_90
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_90:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_91
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_91:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_96:
;clear 
	mov rax,r8
	stc
	ret
f1:
; 	|» {  }
	jz _f1
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
jmp _f1
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	$ {  } ⊢ ,_r47,_r48 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r47
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r48
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
; 	$ 1' ⊢ ,_r51,_r52 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r51
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r52
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
; 	$ 4' ⊢ ,_r55,_r56 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r55
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r56
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
; emt_ptn_crt_ptn { 7' {  } },_r58
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
	jc emt_get_crt_ptn_0_lb_53
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_54
emt_get_crt_ptn_0_lb_53:
; unboxed
	stc
emt_get_crt_ptn_1_lb_54:
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
; emt_ptn_crt_ptn { 7' { 4' 8' } },_r54
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
	jc emt_get_crt_ptn_0_lb_55
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_56
emt_get_crt_ptn_0_lb_55:
; unboxed
	stc
emt_get_crt_ptn_1_lb_56:
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
	jc emt_get_crt_ptn_0_lb_57
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_58
emt_get_crt_ptn_0_lb_57:
; unboxed
	stc
emt_get_crt_ptn_1_lb_58:
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
	jc emt_dec_ptn_0_lb_59
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
emt_dec_ptn_0_lb_59:
; unboxed
	mov QWORD rcx,0
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 9' } },_r50
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
	jc emt_get_crt_ptn_0_lb_61
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_62
emt_get_crt_ptn_0_lb_61:
; unboxed
	stc
emt_get_crt_ptn_1_lb_62:
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
	jc emt_get_crt_ptn_0_lb_63
; boxed
	push rdi
	mov rdi,[st_vct+8*0]
	call inc_r
	mov [st_vct+8*0],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_64
emt_get_crt_ptn_0_lb_63:
; unboxed
	stc
emt_get_crt_ptn_1_lb_64:
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
	jc emt_dec_ptn_0_lb_65
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
emt_dec_ptn_0_lb_65:
; unboxed
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r46
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
	jc emt_get_crt_ptn_0_lb_69
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_70
emt_get_crt_ptn_0_lb_69:
; unboxed
	stc
emt_get_crt_ptn_1_lb_70:
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
	jc emt_dec_ptn_0_lb_71
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
emt_dec_ptn_0_lb_71:
; unboxed
; 	$ 4' ⊢ ,l0 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t66'(0)) }) }) })
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_73
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_74
emt_set_ptn_0_lb_73:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_74:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_75
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
emt_dec_ptn_0_lb_75:
; 	∎ 1'
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
	mov QWORD r10,r9
	jc ret_lb_79
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_76
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
emt_dec_ptn_0_lb_76:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_79:
;clear  6'~_r56 3'~_r51 5'~_r55 0'~_r47
	bt r12,6
	jc clear_lb_80
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
clear_lb_80:
	bt r12,3
	jc clear_lb_81
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_81:
	bt r12,5
	jc clear_lb_82
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_82:
	bt r12,0
	jc clear_lb_83
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_83:
	mov rax,r10
	stc
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
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f0
emt_etr_c_lb_2:
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
	jc emt_get_crt_ptn_0_lb_3
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_4
emt_get_crt_ptn_0_lb_3:
; unboxed
	stc
emt_get_crt_ptn_1_lb_4:
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
; 	$ 1' ⊢ ,l0,l1 : ,(b_tree)◂(t41'(0)),(b_tree)◂(t41'(0))
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_5
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_6
emt_set_ptn_0_lb_5:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_6:
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_7
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_8
emt_set_ptn_0_lb_7:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_8:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_9
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
emt_dec_ptn_0_lb_9:
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
	jc emt_get_crt_ptn_0_lb_13
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_14
emt_get_crt_ptn_0_lb_13:
; unboxed
	stc
emt_get_crt_ptn_1_lb_14:
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
	jc emt_get_crt_ptn_0_lb_15
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_16
emt_get_crt_ptn_0_lb_15:
; unboxed
	stc
emt_get_crt_ptn_1_lb_16:
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
	jc emt_get_crt_ptn_0_lb_17
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_18
emt_get_crt_ptn_0_lb_17:
; unboxed
	stc
emt_get_crt_ptn_1_lb_18:
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
	jc emt_dec_ptn_0_lb_19
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
emt_dec_ptn_0_lb_19:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_21
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
emt_dec_ptn_0_lb_21:
; 	$ 4' ⊢ ,t0,t1 : ,(b_tree)◂(r64),(b_tree)◂(r64)
; emt_ptn_crt_ptn 4',t0
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_22
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_23
emt_set_ptn_0_lb_22:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_23:
; emt_ptn_crt_ptn 4',t1
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_24
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_25
emt_set_ptn_0_lb_24:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_25:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_26
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
emt_dec_ptn_0_lb_26:
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
	jc emt_get_crt_ptn_0_lb_30
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_31
emt_get_crt_ptn_0_lb_30:
; unboxed
	stc
emt_get_crt_ptn_1_lb_31:
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
	jc emt_get_crt_ptn_0_lb_32
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_33
emt_get_crt_ptn_0_lb_32:
; unboxed
	stc
emt_get_crt_ptn_1_lb_33:
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
	jc emt_dec_ptn_0_lb_36
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
emt_dec_ptn_0_lb_36:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_38
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
emt_dec_ptn_0_lb_38:
; 	∎ 4'
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_40
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_41
emt_get_crt_ptn_0_lb_40:
; unboxed
	stc
emt_get_crt_ptn_1_lb_41:
	mov QWORD r8,rcx
	jc ret_lb_42
	push r8
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_39
;push_reg
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
emt_dec_ptn_0_lb_39:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_42:
;clear 
	mov rax,r8
	stc
	ret
section .data
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
	_dyn_f1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f1
	_dyn_f2:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f2
	_dyn_lf:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_brc:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_nilA:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cnsA:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_none:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_some:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_p1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
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
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_nil:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
