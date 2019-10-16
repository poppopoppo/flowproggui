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
	call f1
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f1:
; 	|» {  }
	jz _f1
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f1
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	» "AbC dE F" |~ 0' : ℙ
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_71+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_71+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,8
	mov [rdi],rdx
	mov QWORD r9,rdi
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_72
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_73
lb_72:
	mov r9,r8
	or r12,0b10
lb_73:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_74
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_74:
; 	$ 1' ⊢ ,s1,s2 : ,ℙ,ℙ
; emt_ptn_crt_ptn 1',s1
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc lb_75
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp lb_76
lb_75:
	mov r8,r9
	or r12,0b1
lb_76:
; emt_ptn_crt_ptn 1',s2
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_77
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_78
lb_77:
	mov r10,r9
	or r12,0b100
lb_78:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_79
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_79:
; 	∎ { 0' 2' }
; emt_get_ptn { 0' 2' }
	push QWORD r8
	push QWORD r10
	mov rdi,2
	call mlc
	mov r9,rax
	pop QWORD r10
	pop QWORD r8
	push QWORD r9
; emt_get_ptn 0'
	bt r12,0
	jc lb_82
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp lb_83
lb_82:
; unboxed
	stc
lb_83:
	mov r9,r8
	mov rdx,r9
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
	push QWORD r9
; emt_get_ptn 2'
	bt r12,2
	jc lb_84
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_85
lb_84:
; unboxed
	stc
lb_85:
	mov r9,r10
	mov rdx,r9
	pop rdi
	mov rsi,1
	call exc
	mov r9,rdi
	clc
	push r9
; ; emt_dec_ptn { 0' 2' }
; unknown
	bt r12,2
	jc lb_80
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_80:
; unknown
	bt r12,0
	jc lb_81
	push QWORD r8
	push QWORD r10
	mov rdi,r8
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_81:
	pop r9
;clear 
	mov rax,r9
	ret
f2:
; 	|» {  }
	jz _f2
	jc emt_etr_c_lb_1
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f2
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	$ {  } ⊢ ,_r61,_r62 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r61
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r62
; emt_get_ptn {  }
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop QWORD r8
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
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r11,rax
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD r11
; emt_get_ptn 2'
	mov r11,r10
	stc
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
	push QWORD r11
; emt_get_ptn {  }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r11,rax
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
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
; emt_get_ptn 3'
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	mov r10,r11
	clc
	push r10
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
	pop r10
;clear  0'~_r61 1'~_r62
	bt r12,0
	jc clear_lb_69
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
clear_lb_69:
	bt r12,1
	jc clear_lb_70
	mov rdi,r9
	call dec_r
clear_lb_70:
	mov rax,r10
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
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f3
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f3:
; ⟦⟧
; emt_ptn_crt_ptn {  },_r72
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
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
; 	$ 0' ⊢ ,l0 : ,@[0].(⟦⟧)◂(t59'(0)) ≃ ∐[{ } { t59'(0) @[0] } ]
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_61
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_62
lb_61:
	mov r9,r8
	or r12,0b10
lb_62:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_63
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_63:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc lb_65
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_66
lb_65:
; unboxed
	stc
lb_66:
	mov r8,r9
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_64
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
lb_64:
	pop r8
;clear 
	mov rax,r8
	ret
f0:
; 	|» {  }
	jz _f0
	jc emt_etr_c_lb_3
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _f0
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
; 	$ {  } ⊢ ,_r30,_r31 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r30
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	mov r8,rax
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r31
; emt_get_ptn {  }
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xrff |~ 2' : r64
	mov QWORD r11,0xff
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r34,_r35 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r34
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r35
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
; 	$ 4' ⊢ ,_r38,_r39 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r38
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r39
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
; 	$ 6' ⊢ ,_r42,_r43 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r42
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r43
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
; 	$ 8' ⊢ ,_r46,_r47 : ,{ },{ }
; emt_ptn_crt_ptn 8',_r46
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; emt_ptn_crt_ptn 8',_r47
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrf |~ 8' : r64
	mov QWORD [st_vct+8*2],0xf
	mov QWORD rax,[st_vct+8*2]
	or r12,0b100000000
; ⟦⟧
; emt_ptn_crt_ptn {  },_r65
; emt_get_ptn {  }
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
	mov [st_vct+8*2],rax
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
	mov rdi,2
	call mlc
	btr r12,11
	mov rdi,rax
	mov rsi,0
	mov rdx,0
	stc
	call exc
	mov rsi,1
	pop rdx
	clc
	call exc
	mov QWORD [st_vct+8*2],rdi
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
	mov rdi,[st_vct+8*2]
	mov rsi,str_ret
	bt r12,11
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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
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
; emt_ptn_crt_ptn { 8' 11' },_r67
; emt_get_ptn { 8' 11' }
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD [st_vct+8*3]
; emt_get_ptn 8'
	mov [st_vct+8*3],rax
	stc
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_ptn 11'
	bt r12,11
	jc lb_24
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp lb_25
lb_24:
; unboxed
	stc
lb_25:
	push rbx
	mov QWORD rbx,[st_vct+8*2]
	mov QWORD [st_vct+8*3],rbx
	pop rbx
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
	clc
	and r12,~0b1000000000000
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
	mov rdi,[st_vct+8*3]
	mov rsi,str_ret
; test 0
	bt r12,12
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
; ; emt_dec_ptn { 8' 11' }
; unknown
	bt r12,11
	jc lb_26
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_26:
; unboxed
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD [st_vct+8*3]
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
	bt r12,12
	call exc
	mov QWORD rax,rdi
	btr r12,8
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
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
	popf
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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
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
; emt_ptn_crt_ptn { 6' 8' },_r68
; emt_get_ptn { 6' 8' }
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD [st_vct+8*2]
; emt_get_ptn 6'
	mov [st_vct+8*2],rsi
	stc
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_ptn 8'
	bt r12,8
	jc lb_29
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp lb_30
lb_29:
; unboxed
	stc
lb_30:
	mov [st_vct+8*2],rax
	push QWORD rax
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	pop QWORD rax
	clc
	and r12,~0b100000000000
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
	mov rdi,[st_vct+8*2]
	mov rsi,str_ret
; test 0
	bt r12,11
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
; ; emt_dec_ptn { 6' 8' }
; unknown
	bt r12,8
	jc lb_31
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
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_31:
; unboxed
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD [st_vct+8*2]
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
	bt r12,11
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
	mov rdi,rsi
	mov rsi,str_ret
; test 0
	bt r12,6
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
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
	mov rdi,rsi
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
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
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
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
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
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
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
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
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
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
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
	bt r12,10
	call pnt
	call pnt_str_ret
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
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 4' 6' },_r69
; emt_get_ptn { 4' 6' }
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
	push QWORD rax
; emt_get_ptn 4'
	mov rax,rcx
	stc
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	push QWORD rax
; emt_get_ptn 6'
	bt r12,6
	jc lb_34
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp lb_35
lb_34:
; unboxed
	stc
lb_35:
	mov rax,rsi
	push QWORD rdi
	push QWORD rsi
	push QWORD rdx
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
	pop QWORD rdx
	pop QWORD rsi
	pop QWORD rdi
	clc
	and r12,~0b100000000
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
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
	popf
; ; emt_dec_ptn { 4' 6' }
; unknown
	bt r12,6
	jc lb_36
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
lb_36:
; unboxed
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
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
	bt r12,8
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
	mov rdi,rcx
	mov rsi,str_ret
; test 0
	bt r12,4
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
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
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
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
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
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
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
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
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
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
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
	bt r12,10
	call pnt
	call pnt_str_ret
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
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 1' 4' },_r70
; emt_get_ptn { 1' 4' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rsi,rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD rsi
; emt_get_ptn 1'
	mov rsi,r9
	stc
	push QWORD rdi
	push QWORD rdx
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rdi
	push QWORD rsi
; emt_get_ptn 4'
	bt r12,4
	jc lb_39
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp lb_40
lb_39:
; unboxed
	stc
lb_40:
	mov rsi,rcx
	push QWORD rdi
	push QWORD rdx
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
	pop QWORD rdx
	pop QWORD rdi
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
	mov rdi,rsi
	mov rsi,str_ret
; test 0
	bt r12,6
	call pnt
	call pnt_str_ret
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
	jc lb_41
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
lb_41:
; unboxed
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
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
	mov rdi,r9
	mov rsi,str_ret
; test 0
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
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
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
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
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
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
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
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
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
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
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
	bt r12,10
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	popf
; emt_ptn_crt_ptn { 2' 1' },_r71
; emt_get_ptn { 2' 1' }
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push QWORD rcx
; emt_get_ptn 2'
	mov rcx,r10
	stc
	push QWORD rdi
	push QWORD rdx
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
	pop QWORD rdx
	pop QWORD rdi
	push QWORD rcx
; emt_get_ptn 1'
	bt r12,1
	jc lb_44
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_45
lb_44:
; unboxed
	stc
lb_45:
	mov rcx,r9
	push QWORD rdi
	push QWORD rdx
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
	pop QWORD rdx
	pop QWORD rdi
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
	mov rdi,rcx
	mov rsi,str_ret
; test 0
	bt r12,4
	call pnt
	call pnt_str_ret
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
	jc lb_46
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_46:
; unboxed
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
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
	mov rdi,r9
	mov rsi,str_ret
; test 0
	bt r12,1
	call pnt
	call pnt_str_ret
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	popf
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
; 	$ 1' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_49
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_50
lb_49:
	mov r10,r9
	or r12,0b100
lb_50:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_51
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_51:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_53
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_54
lb_53:
; unboxed
	stc
lb_54:
	mov r9,r10
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_52
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,r10
	call dec_r
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
lb_52:
	pop r9
;clear  7'~_r42 3'~_r34 5'~_r38 9'~_r46 0'~_r30 10'~_r47
	bt r12,7
	jc clear_lb_55
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rdi
	call dec_r
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_55:
	bt r12,3
	jc clear_lb_56
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
	pop QWORD rdx
	pop QWORD r8
clear_lb_56:
	bt r12,5
	jc clear_lb_57
	push QWORD r8
	mov rdi,rdx
	call dec_r
	pop QWORD r8
clear_lb_57:
	bt r12,9
	jc clear_lb_58
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
	pop QWORD r8
clear_lb_58:
	bt r12,0
	jc clear_lb_59
	mov rdi,r8
	call dec_r
clear_lb_59:
	bt r12,10
	jc clear_lb_60
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_60:
	mov rax,r9
	ret
section .data
	cst_stg_71: db "AbC dE F",0,0,0,0,0,0,0,0
