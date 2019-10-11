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
	call test3
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
; nil
; emt_ptn_crt_ptn {  },_r62
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
; 	$ 0' ⊢ ,l0 : ,@[0].(⟦⟧)◂(t55'(0)) ≃ ∐[{ } { t55'(0) @[0] } ]
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_94
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_95
lb_94:
	mov r9,r8
	or r12,0b10
lb_95:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_96
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_96:
; 	? 1'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc lb_97
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp lb_98
lb_97:
	mov r8,r9
	or r12,0b1
lb_98:
; l0=nil◂{  }
; 	» "t" |~ 1' : ℙ
	push QWORD r8
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_101+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,y : ,ℙ
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_102
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_103
lb_102:
	mov r10,r9
	or r12,0b100
lb_103:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_104
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_104:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_106
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_107
lb_106:
; unboxed
	stc
lb_107:
	mov r9,r10
	jc lb_108
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_105
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_105:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
lb_108:
;clear  0'~l0
	bt r12,0
	jc clear_lb_109
	mov rdi,r8
	call dec_r
clear_lb_109:
	mov rax,r9
	stc
	ret
lb_99:
; 	∐\ l0 ,,l0=cns◂{ _ _ }
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc lb_110
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp lb_111
lb_110:
	mov r8,r9
	or r12,0b1
lb_111:
; l0=cns◂{ _ _ }
; 	» "f" |~ 1' : ℙ
	push QWORD r8
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_114+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,y : ,ℙ
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_115
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_116
lb_115:
	mov r10,r9
	or r12,0b100
lb_116:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_117
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_117:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_119
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_120
lb_119:
; unboxed
	stc
lb_120:
	mov r9,r10
	jc lb_121
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_118
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_118:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
lb_121:
;clear  0'~l0
	bt r12,0
	jc clear_lb_122
	mov rdi,r8
	call dec_r
clear_lb_122:
	mov rax,r9
	stc
	ret
lb_112:
test3:
; 	|» {  }
	jz _test3
	jc emt_etr_c_lb_1
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test3
emt_etr_c_lb_1:
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
	jnz lb_56
	jmp lb_57
lb_56:
; ; emt_dec_ptn 0'
; unboxed
	jmp lb_55
lb_57:
; ; emt_dec_ptn 0'
; unboxed
; 	» "a" |~ 1' : ℙ
	push QWORD r8
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_60+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 1',s1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_61
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_62
lb_61:
	mov r10,r9
	or r12,0b100
lb_62:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_63
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_63:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_65
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_66
lb_65:
; unboxed
	stc
lb_66:
	mov r9,r10
	jc lb_67
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_64
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_64:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
lb_67:
;clear  0'~s0
	bt r12,0
	jc clear_lb_68
	mov rdi,r8
	call dec_r
clear_lb_68:
	mov rax,r9
	stc
	ret
lb_55:
; 	∐\ s0 ,,s0=0xrff
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; s0=0xrff
	mov QWORD r10,0xff
	cmp r8,r10
	jnz lb_72
	jmp lb_73
lb_72:
; ; emt_dec_ptn 0'
; unboxed
	jmp lb_71
lb_73:
; ; emt_dec_ptn 0'
; unboxed
; 	» "b" |~ 1' : ℙ
	push QWORD r8
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_76+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 1',s1
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
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_81
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_82
lb_81:
; unboxed
	stc
lb_82:
	mov r9,r10
	jc lb_83
	push r9
; ; emt_dec_ptn 2'
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
	pop r9
	clc
;clear 
	mov rax,r9
	ret
lb_83:
;clear  0'~s0
	bt r12,0
	jc clear_lb_84
	mov rdi,r8
	call dec_r
clear_lb_84:
	mov rax,r9
	stc
	ret
lb_71:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; 	» "c" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_86+8*0]
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
	jc lb_87
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_88
lb_87:
	mov r9,r8
	or r12,0b10
lb_88:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_89
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_89:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc lb_91
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_92
lb_91:
; unboxed
	stc
lb_92:
	mov r8,r9
	jc lb_93
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_90
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
lb_90:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
lb_93:
;clear 
	mov rax,r8
	stc
	ret
lb_85:
test1:
; 	|» {  }
	jz _test1
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test1
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test1:
; 	» "Xyz" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_3+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,5
	mov [rdi],rdx
	mov QWORD r9,rdi
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc lb_4
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
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
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_6:
; 	? 1'
; 	∐\ s0 ,,s0="Y"
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc lb_7
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp lb_8
lb_7:
	mov r8,r9
	or r12,0b1
lb_8:
; s0="Y"
	push rdi
	push rsi
	mov QWORD rdi,[cst_stg_11+8*0]
	mov QWORD rsi,[r8+8*1]
	cmp rdi,rsi
	jnz lb_10
	jmp lb_12
lb_10:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_14
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_14:
	pop rsi
	pop rdi
	jmp lb_9
lb_12:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_13
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_13:
	pop rsi
	pop rdi
; 	» "a" |~ 1' : ℙ
	push QWORD r8
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
	mov QWORD r10,rdi
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 1',s1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_16
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_17
lb_16:
	mov r10,r9
	or r12,0b100
lb_17:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_18
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_18:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_20
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_21
lb_20:
; unboxed
	stc
lb_21:
	mov r9,r10
	jc lb_22
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_19
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_19:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
lb_22:
;clear  0'~s0
	bt r12,0
	jc clear_lb_23
	mov rdi,r8
	call dec_r
clear_lb_23:
	mov rax,r9
	stc
	ret
lb_9:
; 	∐\ s0 ,,s0="Xy"
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc lb_24
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp lb_25
lb_24:
	mov r8,r9
	or r12,0b1
lb_25:
; s0="Xy"
	push rdi
	push rsi
	mov QWORD rdi,[cst_stg_28+8*0]
	mov QWORD rsi,[r8+8*1]
	cmp rdi,rsi
	jnz lb_27
	jmp lb_29
lb_27:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_31
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_31:
	pop rsi
	pop rdi
	jmp lb_26
lb_29:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_30
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_30:
	pop rsi
	pop rdi
; 	» "b" |~ 1' : ℙ
	push QWORD r8
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_32+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 1',s1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc lb_33
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp lb_34
lb_33:
	mov r10,r9
	or r12,0b100
lb_34:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_35
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_35:
; 	∎ 2'
; emt_get_ptn 2'
	bt r12,2
	jc lb_37
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp lb_38
lb_37:
; unboxed
	stc
lb_38:
	mov r9,r10
	jc lb_39
	push r9
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc lb_36
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
	pop QWORD r10
	pop QWORD r8
lb_36:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
lb_39:
;clear  0'~s0
	bt r12,0
	jc clear_lb_40
	mov rdi,r8
	call dec_r
clear_lb_40:
	mov rax,r9
	stc
	ret
lb_26:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; 	» "c" |~ 0' : ℙ
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_42+8*0]
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
	jc lb_43
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp lb_44
lb_43:
	mov r9,r8
	or r12,0b10
lb_44:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc lb_45
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
	pop QWORD r9
	pop QWORD r8
lb_45:
; 	∎ 1'
; emt_get_ptn 1'
	bt r12,1
	jc lb_47
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp lb_48
lb_47:
; unboxed
	stc
lb_48:
	mov r8,r9
	jc lb_49
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc lb_46
	push QWORD r9
	mov rdi,r9
	call dec_r
	pop QWORD r9
lb_46:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
lb_49:
;clear 
	mov rax,r8
	stc
	ret
lb_41:
section .data
	cst_stg_114: db "f",0,0,0,0,0,0,0
	cst_stg_101: db "t",0,0,0,0,0,0,0
	cst_stg_86: db "c",0,0,0,0,0,0,0
	cst_stg_76: db "b",0,0,0,0,0,0,0
	cst_stg_60: db "a",0,0,0,0,0,0,0
	cst_stg_42: db "c",0,0,0,0,0,0,0
	cst_stg_32: db "b",0,0,0,0,0,0,0
	cst_stg_28: db "Xy",0,0,0,0,0,0
	cst_stg_15: db "a",0,0,0,0,0,0,0
	cst_stg_11: db "Y",0,0,0,0,0,0,0
	cst_stg_3: db "Xyz",0,0,0,0,0
