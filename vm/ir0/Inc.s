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
	call test7
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test5:
; 	|» {  }
	jz _test5
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test5
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test5:
; 	» 0xr13 |~ 0' : r64
	push rbx
	mov rbx,0x13
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_1
	btr r12,1
	call inc_r
	jmp lb_2
lb_1:
	bts r12,1
lb_2:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_3
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_3:
; 	» 0xrb |~ 0' : r64
	push rbx
	mov rbx,0xb
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_4
	btr r12,2
	call inc_r
	jmp lb_5
lb_4:
	bts r12,2
lb_5:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_6
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_6:
; 	» 0xr0 |~ 0' : r64
	push rbx
	mov rbx,0x0
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_7
	btr r12,3
	call inc_r
	jmp lb_8
lb_7:
	bts r12,3
lb_8:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_9
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_9:
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_13
	btr r14,0
	call inc_r
	jmp lb_14
lb_13:
	bts r14,0
lb_14:
	pop rbx
; emt_ptn_set_ptn 2',1'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_15
	btr r14,1
	call inc_r
	jmp lb_16
lb_15:
	bts r14,1
lb_16:
	pop rbx
; emt_ptn_set_ptn 3',2'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_17
	btr r14,2
	call inc_r
	jmp lb_18
lb_17:
	bts r14,2
lb_18:
	pop rbx
; ; emt_dec_ptn { 1' 2' 3' }
	bt r12,3
	jc lb_10
	mov rdi,r11
	call dec_r
lb_10:
	bt r12,2
	jc lb_11
	mov rdi,r10
	call dec_r
lb_11:
	bt r12,1
	jc lb_12
	mov rdi,r9
	call dec_r
lb_12:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_19
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_23
	btr r12,0
	call inc_r
	jmp lb_24
lb_23:
	bts r12,0
lb_24:
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_20
lb_19:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_21
	btr r12,0
	call inc_r
	jmp lb_22
lb_21:
	bts r12,0
lb_22:
	pop rbx
lb_20:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr5 |~ 1' : r64
	push rbx
	mov rbx,0x5
	mov r9,rbx
	bts r12,1
	pop rbx
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_25
	btr r12,2
	call inc_r
	jmp lb_26
lb_25:
	bts r12,2
lb_26:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_27
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_27:
; 	fact 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_29
	btr r14,0
	call inc_r
	jmp lb_30
lb_29:
	bts r14,0
lb_30:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_28
	push r8
	mov rdi,r10
	call dec_r
	pop r8
lb_28:
; push_s  0'~r
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_31
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_35
	btr r12,1
	call inc_r
	jmp lb_36
lb_35:
	bts r12,1
lb_36:
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_32
lb_31:
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_33
	btr r12,1
	call inc_r
	jmp lb_34
lb_33:
	bts r12,1
lb_34:
	pop rbx
lb_32:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr5 |~ 2' : r64
	push rbx
	mov rbx,0x5
	mov r10,rbx
	bts r12,2
	pop rbx
; 	$ 2' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_37
	btr r12,3
	call inc_r
	jmp lb_38
lb_37:
	bts r12,3
lb_38:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_39
	push r8
	push r9
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r9
	pop r8
lb_39:
; 	fib 3' ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 3',0'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_41
	btr r14,0
	call inc_r
	jmp lb_42
lb_41:
	bts r14,0
lb_42:
	pop rbx
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_40
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_40:
; push_s  0'~r 1'~y
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_43
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_47
	btr r12,2
	call inc_r
	jmp lb_48
lb_47:
	bts r12,2
lb_48:
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_44
lb_43:
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_45
	btr r12,2
	call inc_r
	jmp lb_46
lb_45:
	bts r12,2
lb_46:
	pop rbx
lb_44:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr6 |~ 3' : r64
	push rbx
	mov rbx,0x6
	mov r11,rbx
	bts r12,3
	pop rbx
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_49
	btr r12,4
	call inc_r
	jmp lb_50
lb_49:
	bts r12,4
lb_50:
	pop rbx
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_51
	push r8
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
lb_51:
; 	fib 4' ⊢ 3' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 4',0'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_53
	btr r14,0
	call inc_r
	jmp lb_54
lb_53:
	bts r14,0
lb_54:
	pop rbx
; ; emt_dec_ptn 4'
	bt r12,4
	jc lb_52
	push r8
	push r9
	push r10
	mov rdi,rcx
	call dec_r
	pop r10
	pop r9
	pop r8
lb_52:
; push_s  2'~y0 0'~r 1'~y
	mov [tmp],rbx
	mov rbx,r10
	push rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_55
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_59
	btr r12,3
	call inc_r
	jmp lb_60
lb_59:
	bts r12,3
lb_60:
	pop rbx
	push r8
	push r9
	push r10
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
	jmp lb_56
lb_55:
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_57
	btr r12,3
	call inc_r
	jmp lb_58
lb_57:
	bts r12,3
lb_58:
	pop rbx
lb_56:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	pop rbx
	mov r10,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ { 0' 1' 2' 3' }
;clear 
	push rbx
; emt_get_ptn { 0' 1' 2' 3' }
	push r8
	push r9
	push r10
	push r11
	mov rdi,4
	call mlc
	mov rbx,rax
	pop r11
	pop r10
	pop r9
	pop r8
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,0
	call exc
	pop rbx
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,1
	call exc
	pop rbx
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,2
	call exc
	pop rbx
	push rbx
; emt_get_ptn 3'
	mov rbx,r11
	bt r12,3
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,3
	call exc
	pop rbx
	clc
	mov rax,rbx
	pop rbx
	ret
test7:
; 	|» {  }
	jz _test7
	jc emt_etr_c_lb_61
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test7
emt_etr_c_lb_61:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test7:
; 	» 0xr14 |~ 0' : r64
	push rbx
	mov rbx,0x14
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_62
	btr r12,1
	call inc_r
	jmp lb_63
lb_62:
	bts r12,1
lb_63:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_64
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_64:
; 	» 0xra |~ 0' : r64
	push rbx
	mov rbx,0xa
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_65
	btr r12,2
	call inc_r
	jmp lb_66
lb_65:
	bts r12,2
lb_66:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_67
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_67:
; 	» 0xr0 |~ 0' : r64
	push rbx
	mov rbx,0x0
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_68
	btr r12,3
	call inc_r
	jmp lb_69
lb_68:
	bts r12,3
lb_69:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_70
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_70:
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_74
	btr r14,0
	call inc_r
	jmp lb_75
lb_74:
	bts r14,0
lb_75:
	pop rbx
; emt_ptn_set_ptn 2',1'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_76
	btr r14,1
	call inc_r
	jmp lb_77
lb_76:
	bts r14,1
lb_77:
	pop rbx
; emt_ptn_set_ptn 3',2'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_78
	btr r14,2
	call inc_r
	jmp lb_79
lb_78:
	bts r14,2
lb_79:
	pop rbx
; ; emt_dec_ptn { 1' 2' 3' }
	bt r12,3
	jc lb_71
	mov rdi,r11
	call dec_r
lb_71:
	bt r12,2
	jc lb_72
	mov rdi,r10
	call dec_r
lb_72:
	bt r12,1
	jc lb_73
	mov rdi,r9
	call dec_r
lb_73:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_80
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_84
	btr r12,0
	call inc_r
	jmp lb_85
lb_84:
	bts r12,0
lb_85:
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_81
lb_80:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_82
	btr r12,0
	call inc_r
	jmp lb_83
lb_82:
	bts r12,0
lb_83:
	pop rbx
lb_81:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rax,rbx
	pop rbx
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_86
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test4
emt_etr_c_lb_86:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test4:
; 	» 0xr5 |~ 0' : r64
	push rbx
	mov rbx,0x5
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_87
	btr r12,1
	call inc_r
	jmp lb_88
lb_87:
	bts r12,1
lb_88:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_89
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_89:
; 	fact 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_91
	btr r14,0
	call inc_r
	jmp lb_92
lb_91:
	bts r14,0
lb_92:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_90
	mov rdi,r9
	call dec_r
lb_90:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_93
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_97
	btr r12,0
	call inc_r
	jmp lb_98
lb_97:
	bts r12,0
lb_98:
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_94
lb_93:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_95
	btr r12,0
	call inc_r
	jmp lb_96
lb_95:
	bts r12,0
lb_96:
	pop rbx
lb_94:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rax,rbx
	pop rbx
	ret
test6:
; 	|» {  }
	jz _test6
	jc emt_etr_c_lb_99
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
	mov rdi,rbx
	call dec_r
	pop rbx
jmp _test6
emt_etr_c_lb_99:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test6:
; 	» 0xr5 |~ 0' : r64
	push rbx
	mov rbx,0x5
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_100
	btr r12,1
	call inc_r
	jmp lb_101
lb_100:
	bts r12,1
lb_101:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_102
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_102:
; 	fib 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_104
	btr r14,0
	call inc_r
	jmp lb_105
lb_104:
	bts r14,0
lb_105:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_103
	mov rdi,r9
	call dec_r
lb_103:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_106
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_110
	btr r12,0
	call inc_r
	jmp lb_111
lb_110:
	bts r12,0
lb_111:
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_107
lb_106:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_108
	btr r12,0
	call inc_r
	jmp lb_109
lb_108:
	bts r12,0
lb_109:
	pop rbx
lb_107:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr6 |~ 1' : r64
	push rbx
	mov rbx,0x6
	mov r9,rbx
	bts r12,1
	pop rbx
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_112
	btr r12,2
	call inc_r
	jmp lb_113
lb_112:
	bts r12,2
lb_113:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_114
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_114:
; 	fib 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_116
	btr r14,0
	call inc_r
	jmp lb_117
lb_116:
	bts r14,0
lb_117:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_115
	push r8
	mov rdi,r10
	call dec_r
	pop r8
lb_115:
; push_s  0'~y0
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_118
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_122
	btr r12,1
	call inc_r
	jmp lb_123
lb_122:
	bts r12,1
lb_123:
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_119
lb_118:
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_120
	btr r12,1
	call inc_r
	jmp lb_121
lb_120:
	bts r12,1
lb_121:
	pop rbx
lb_119:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ { 0' 1' }
;clear 
	push rbx
; emt_get_ptn { 0' 1' }
	push r8
	push r9
	mov rdi,2
	call mlc
	mov rbx,rax
	pop r9
	pop r8
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,0
	call exc
	pop rbx
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rdx,rbx
	pop rbx
	mov rdi,rbx
	push rbx
	mov rsi,1
	call exc
	pop rbx
	clc
	mov rax,rbx
	pop rbx
	ret
fib:
; 	|» 0'
	jz _fib
	jc emt_etr_c_lb_124
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_458
	btr r12,0
	call inc_r
	jmp lb_459
lb_458:
	bts r12,0
lb_459:
	pop rbx
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop rbx
jmp _fib
emt_etr_c_lb_124:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_456
	btr r12,0
	call inc_r
	jmp lb_457
lb_456:
	bts r12,0
lb_457:
	pop rbx
_fib:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_125
	btr r12,1
	call inc_r
	jmp lb_126
lb_125:
	bts r12,1
lb_126:
	pop rbx
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_127
	btr r12,2
	call inc_r
	jmp lb_128
lb_127:
	bts r12,2
lb_128:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_129
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_129:
; 	» 0xr0 |~ 0' : r64
	push rbx
	mov rbx,0x0
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_130
	btr r12,3
	call inc_r
	jmp lb_131
lb_130:
	bts r12,3
lb_131:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_132
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_132:
; 	cmp { 2' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 4' 5' }
; emt_ptn_set_ptn 2',4'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_137
	btr r12,4
	call inc_r
	jmp lb_138
lb_137:
	bts r12,4
lb_138:
	pop rbx
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_139
	btr r12,5
	call inc_r
	jmp lb_140
lb_139:
	bts r12,5
lb_140:
	pop rbx
; ; emt_dec_ptn { 2' 3' }
	bt r12,3
	jc lb_135
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_135:
	bt r12,2
	jc lb_136
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_136:
	push rbx
	push r14
	push r15
	mov rbx,rcx
	mov r14,rdx
	cmp rbx,r14
	mov r15,1
	mov rbx,0
	setz bl
	mov r14,0
	cmovg r14,r15
	pop r15
	mov rsi,rbx
	mov rdi,r14
	pop r14
	pop rbx
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 0' -2' }
; emt_ptn_set_ptn 6',0'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_133
	btr r12,0
	call inc_r
	jmp lb_134
lb_133:
	bts r12,0
lb_134:
	pop rbx
; emt_ptn_set_ptn 7',-2'
	push rbx
	mov rbx,rdi
	bt r12,7
; emt_set_ptn -2'
	pop rbx
; 	∠ 0'
	push r14
; emt_get_ptn 0'
	mov r14,r8
	bt r12,0
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_142
	mov rbx,0
	stc
	jmp agl_141_1
lb_142:
	mov rbx,1
	stc
	jmp agl_141_0
; 	∐ -2'
agl_141_0:
	jc lb_143
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r9
	call dec_r
	pop r9
	jmp lb_144
lb_143:
; emt_set_ptn -2'
lb_144:
	pop rbx
	pop r14
; 	$ 1' ⊢ ,0',2' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_145
	btr r12,0
	call inc_r
	jmp lb_146
lb_145:
	bts r12,0
lb_146:
	pop rbx
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_147
	btr r12,2
	call inc_r
	jmp lb_148
lb_147:
	bts r12,2
lb_148:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_149
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_149:
; 	» 0xr1 |~ 1' : r64
	push rbx
	mov rbx,0x1
	mov r9,rbx
	bts r12,1
	pop rbx
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_150
	btr r12,3
	call inc_r
	jmp lb_151
lb_150:
	bts r12,3
lb_151:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_152
	push r8
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
	pop r8
lb_152:
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 4' 5' }
; emt_ptn_set_ptn 2',4'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_157
	btr r12,4
	call inc_r
	jmp lb_158
lb_157:
	bts r12,4
lb_158:
	pop rbx
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_159
	btr r12,5
	call inc_r
	jmp lb_160
lb_159:
	bts r12,5
lb_160:
	pop rbx
; ; emt_dec_ptn { 2' 3' }
	bt r12,3
	jc lb_155
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_155:
	bt r12,2
	jc lb_156
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_156:
	push rbx
	push r14
	push r15
	mov rbx,rcx
	mov r14,rdx
	cmp rbx,r14
	mov r15,1
	mov rbx,0
	setz bl
	mov r14,0
	cmovg r14,r15
	pop r15
	mov rsi,rbx
	mov rdi,r14
	pop r14
	pop rbx
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 1' -2' }
; emt_ptn_set_ptn 6',1'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_153
	btr r12,1
	call inc_r
	jmp lb_154
lb_153:
	bts r12,1
lb_154:
	pop rbx
; emt_ptn_set_ptn 7',-2'
	push rbx
	mov rbx,rdi
	bt r12,7
; emt_set_ptn -2'
	pop rbx
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_162
	mov rbx,0
	stc
	jmp agl_161_1
lb_162:
	mov rbx,1
	stc
	jmp agl_161_0
; 	∐ -2'
agl_161_0:
	jc lb_163
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	call dec_r
	pop r8
	jmp lb_164
lb_163:
; emt_set_ptn -2'
lb_164:
	pop rbx
	pop r14
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_165
	btr r12,1
	call inc_r
	jmp lb_166
lb_165:
	bts r12,1
lb_166:
	pop rbx
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_167
	btr r12,2
	call inc_r
	jmp lb_168
lb_167:
	bts r12,2
lb_168:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_169
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_169:
; 	» 0xr1 |~ 0' : r64
	push rbx
	mov rbx,0x1
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_170
	btr r12,3
	call inc_r
	jmp lb_171
lb_170:
	bts r12,3
lb_171:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_172
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_172:
; 	» 0xr2 |~ 0' : r64
	push rbx
	mov rbx,0x2
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_173
	btr r12,4
	call inc_r
	jmp lb_174
lb_173:
	bts r12,4
lb_174:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_175
	push r9
	push r10
	push r11
	push rcx
	mov rdi,r8
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_175:
; 	sub { 1' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_180
	btr r12,5
	call inc_r
	jmp lb_181
lb_180:
	bts r12,5
lb_181:
	pop rbx
; emt_ptn_set_ptn 3',6'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_182
	btr r12,6
	call inc_r
	jmp lb_183
lb_182:
	bts r12,6
lb_183:
	pop rbx
; ; emt_dec_ptn { 1' 3' }
	bt r12,3
	jc lb_178
	push r8
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_178:
	bt r12,1
	jc lb_179
	push r8
	push r10
	push rcx
	mov rdi,r9
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_179:
	push rbx
	push r14
	mov rbx,rdx
	mov r14,rsi
	sub rbx,r14
	stc
	pop r14
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_176
	btr r12,0
	call inc_r
	jmp lb_177
lb_176:
	bts r12,0
lb_177:
	pop rbx
; 	sub { 2' 4' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 4' },{ 3' 5' }
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_188
	btr r12,3
	call inc_r
	jmp lb_189
lb_188:
	bts r12,3
lb_189:
	pop rbx
; emt_ptn_set_ptn 4',5'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_190
	btr r12,5
	call inc_r
	jmp lb_191
lb_190:
	bts r12,5
lb_191:
	pop rbx
; ; emt_dec_ptn { 2' 4' }
	bt r12,4
	jc lb_186
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_186:
	bt r12,2
	jc lb_187
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_187:
	push rbx
	push r14
	mov rbx,r11
	mov r14,rdx
	sub rbx,r14
	stc
	pop r14
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_184
	btr r12,1
	call inc_r
	jmp lb_185
lb_184:
	bts r12,1
lb_185:
	pop rbx
; 	fib 0' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 0',0'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_193
	btr r14,0
	call inc_r
	jmp lb_194
lb_193:
	bts r14,0
lb_194:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_192
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_192:
; push_s  1'~xt1
	mov [tmp],rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_195
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_199
	btr r12,0
	call inc_r
	jmp lb_200
lb_199:
	bts r12,0
lb_200:
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_196
lb_195:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_197
	btr r12,0
	call inc_r
	jmp lb_198
lb_197:
	bts r12,0
lb_198:
	pop rbx
lb_196:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	fib 1' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_202
	btr r14,0
	call inc_r
	jmp lb_203
lb_202:
	bts r14,0
lb_203:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_201
	push r8
	mov rdi,r9
	call dec_r
	pop r8
lb_201:
; push_s  0'~y0
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fib
	push rbx
	mov rbx,rax
	jc lb_204
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_208
	btr r12,1
	call inc_r
	jmp lb_209
lb_208:
	bts r12,1
lb_209:
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_205
lb_204:
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_206
	btr r12,1
	call inc_r
	jmp lb_207
lb_206:
	bts r12,1
lb_207:
	pop rbx
lb_205:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	add { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 3' 4' }
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_214
	btr r12,3
	call inc_r
	jmp lb_215
lb_214:
	bts r12,3
lb_215:
	pop rbx
; emt_ptn_set_ptn 1',4'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_216
	btr r12,4
	call inc_r
	jmp lb_217
lb_216:
	bts r12,4
lb_217:
	pop rbx
; ; emt_dec_ptn { 0' 1' }
	bt r12,1
	jc lb_212
	push r10
	mov rdi,r9
	call dec_r
	pop r10
lb_212:
	bt r12,0
	jc lb_213
	push r10
	mov rdi,r8
	call dec_r
	pop r10
lb_213:
	push rbx
	push r14
	mov rbx,r11
	mov r14,rcx
	add rbx,r14
	stc
	pop r14
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_210
	btr r12,2
	call inc_r
	jmp lb_211
lb_210:
	bts r12,2
lb_211:
	pop rbx
; 	∎ 2'
;clear 
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_161_1:
	jc lb_218
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	call dec_r
	pop r8
	jmp lb_219
lb_218:
; emt_set_ptn -2'
lb_219:
	pop rbx
	pop r14
; 	» 0xr1 |~ 1' : r64
	push rbx
	mov rbx,0x1
	mov r9,rbx
	bts r12,1
	pop rbx
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_220
	btr r12,2
	call inc_r
	jmp lb_221
lb_220:
	bts r12,2
lb_221:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_222
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_222:
; 	∎ 2'
;clear  0'~x
	bt r12,0
	jc clear_lb_223
	mov rdi,r8
	call dec_r
clear_lb_223:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_141_1:
	jc lb_224
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r9
	call dec_r
	pop r9
	jmp lb_225
lb_224:
; emt_set_ptn -2'
lb_225:
	pop rbx
	pop r14
; 	» 0xr0 |~ 0' : r64
	push rbx
	mov rbx,0x0
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_226
	btr r12,2
	call inc_r
	jmp lb_227
lb_226:
	bts r12,2
lb_227:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_228
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_228:
; 	∎ 2'
;clear  1'~x
	bt r12,1
	jc clear_lb_229
	mov rdi,r9
	call dec_r
clear_lb_229:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
tak:
; 	|» { 0' 1' 2' }
	jz _tak
	jc emt_etr_c_lb_230
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' 2' }
	push rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_450
	btr r12,0
	call inc_r
	jmp lb_451
lb_450:
	bts r12,0
lb_451:
	pop rbx
	pop rbx
	push rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_452
	btr r12,1
	call inc_r
	jmp lb_453
lb_452:
	bts r12,1
lb_453:
	pop rbx
	pop rbx
	push rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_454
	btr r12,2
	call inc_r
	jmp lb_455
lb_454:
	bts r12,2
lb_455:
	pop rbx
	pop rbx
	pop rbx
	push r8
	push r10
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r10
	pop r8
	pop rbx
jmp _tak
emt_etr_c_lb_230:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' 2' }
	push rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_444
	btr r12,0
	call inc_r
	jmp lb_445
lb_444:
	bts r12,0
lb_445:
	pop rbx
	pop rbx
	push rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_446
	btr r12,1
	call inc_r
	jmp lb_447
lb_446:
	bts r12,1
lb_447:
	pop rbx
	pop rbx
	push rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_448
	btr r12,2
	call inc_r
	jmp lb_449
lb_448:
	bts r12,2
lb_449:
	pop rbx
	pop rbx
	pop rbx
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_231
	btr r12,3
	call inc_r
	jmp lb_232
lb_231:
	bts r12,3
lb_232:
	pop rbx
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_233
	btr r12,4
	call inc_r
	jmp lb_234
lb_233:
	bts r12,4
lb_234:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_235
	push r9
	push r10
	push r11
	push rcx
	mov rdi,r8
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_235:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_236
	btr r12,0
	call inc_r
	jmp lb_237
lb_236:
	bts r12,0
lb_237:
	pop rbx
; emt_ptn_set_ptn 1',5'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_238
	btr r12,5
	call inc_r
	jmp lb_239
lb_238:
	bts r12,5
lb_239:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_240
	push r8
	push r10
	push r11
	push rcx
	push rdx
	mov rdi,r9
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_240:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_245
	btr r12,6
	call inc_r
	jmp lb_246
lb_245:
	bts r12,6
lb_246:
	pop rbx
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,rdx
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rbx
	jc lb_247
	btr r12,7
	call inc_r
	jmp lb_248
lb_247:
	bts r12,7
lb_248:
	pop rbx
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_243
	push r8
	push r9
	push r10
	push r11
	mov rdi,rdx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_243:
	bt r12,4
	jc lb_244
	push r8
	push r9
	push r10
	push r11
	mov rdi,rcx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_244:
	push rbx
	push r14
	push r15
	mov rbx,rsi
	mov r14,rdi
	cmp rbx,r14
	mov r15,1
	mov rbx,0
	setz bl
	mov r14,0
	cmovg r14,r15
	pop r15
	mov rax,rbx
	mov [st_vct+8*0],r14
	pop r14
	pop rbx
	or r12,0b100000000
	or r12,0b1000000000
; emt_ptn_set_ptn { 8' 9' },{ -2' 1' }
; emt_ptn_set_ptn 8',-2'
	push rbx
	mov rbx,rax
	bt r12,8
; emt_set_ptn -2'
	pop rbx
; emt_ptn_set_ptn 9',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,9
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_241
	btr r12,1
	call inc_r
	jmp lb_242
lb_241:
	bts r12,1
lb_242:
	pop rbx
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_250
	mov rbx,0
	stc
	jmp agl_249_1
lb_250:
	mov rbx,1
	stc
	jmp agl_249_0
; 	∐ -2'
agl_249_0:
	jc lb_251
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
	jmp lb_252
lb_251:
; emt_set_ptn -2'
lb_252:
	pop rbx
	pop r14
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_253
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_253:
	bt r12,0
	jc clear_lb_254
	mov rdi,r8
	call dec_r
clear_lb_254:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_249_1:
	jc lb_255
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
	jmp lb_256
lb_255:
; emt_set_ptn -2'
lb_256:
	pop rbx
	pop r14
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_257
	btr r12,1
	call inc_r
	jmp lb_258
lb_257:
	bts r12,1
lb_258:
	pop rbx
; emt_ptn_set_ptn 3',4'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_259
	btr r12,4
	call inc_r
	jmp lb_260
lb_259:
	bts r12,4
lb_260:
	pop rbx
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_261
	push r8
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
lb_261:
; 	» 0xr1 |~ 3' : r64
	push rbx
	mov rbx,0x1
	mov r11,rbx
	bts r12,3
	pop rbx
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_262
	btr r12,5
	call inc_r
	jmp lb_263
lb_262:
	bts r12,5
lb_263:
	pop rbx
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_264
	push r8
	push r9
	push r10
	push rcx
	push rdx
	mov rdi,r11
	call dec_r
	pop rdx
	pop rcx
	pop r10
	pop r9
	pop r8
lb_264:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_269
	btr r12,6
	call inc_r
	jmp lb_270
lb_269:
	bts r12,6
lb_270:
	pop rbx
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,rdx
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rbx
	jc lb_271
	btr r12,7
	call inc_r
	jmp lb_272
lb_271:
	bts r12,7
lb_272:
	pop rbx
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_267
	push r8
	push r9
	push r10
	push r11
	mov rdi,rdx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_267:
	bt r12,4
	jc lb_268
	push r8
	push r9
	push r10
	push r11
	mov rdi,rcx
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_268:
	push rbx
	push r14
	mov rbx,rsi
	mov r14,rdi
	sub rbx,r14
	stc
	pop r14
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_265
	btr r12,3
	call inc_r
	jmp lb_266
lb_265:
	bts r12,3
lb_266:
	pop rbx
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_273
	btr r12,4
	call inc_r
	jmp lb_274
lb_273:
	bts r12,4
lb_274:
	pop rbx
; emt_ptn_set_ptn 2',5'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_275
	btr r12,5
	call inc_r
	jmp lb_276
lb_275:
	bts r12,5
lb_276:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_277
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_277:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_278
	btr r12,2
	call inc_r
	jmp lb_279
lb_278:
	bts r12,2
lb_279:
	pop rbx
; emt_ptn_set_ptn 0',6'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_280
	btr r12,6
	call inc_r
	jmp lb_281
lb_280:
	bts r12,6
lb_281:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_282
	push r9
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r8
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r9
lb_282:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_286
	btr r14,0
	call inc_r
	jmp lb_287
lb_286:
	bts r14,0
lb_287:
	pop rbx
; emt_ptn_set_ptn 6',1'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_288
	btr r14,1
	call inc_r
	jmp lb_289
lb_288:
	bts r14,1
lb_289:
	pop rbx
; emt_ptn_set_ptn 5',2'
	push rbx
	mov rbx,rdx
	bt r12,5
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_290
	btr r14,2
	call inc_r
	jmp lb_291
lb_290:
	bts r14,2
lb_291:
	pop rbx
; ; emt_dec_ptn { 3' 6' 5' }
	bt r12,5
	jc lb_283
	push r9
	push r10
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_283:
	bt r12,6
	jc lb_284
	push r9
	push r10
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_284:
	bt r12,3
	jc lb_285
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_285:
; push_s  2'~y 4'~z 1'~x
	mov [tmp],rbx
	mov rbx,r10
	push rbx
	mov rbx,rcx
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_292
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_296
	btr r12,0
	call inc_r
	jmp lb_297
lb_296:
	bts r12,0
lb_297:
	pop rbx
	push r8
	push r9
	push r10
	push rcx
	mov rdi,rbx
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
	jmp lb_293
lb_292:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_294
	btr r12,0
	call inc_r
	jmp lb_295
lb_294:
	bts r12,0
lb_295:
	pop rbx
lb_293:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov rcx,rbx
	pop rbx
	mov r10,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_298
	btr r12,3
	call inc_r
	jmp lb_299
lb_298:
	bts r12,3
lb_299:
	pop rbx
; emt_ptn_set_ptn 2',5'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_300
	btr r12,5
	call inc_r
	jmp lb_301
lb_300:
	bts r12,5
lb_301:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_302
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_302:
; 	» 0xr1 |~ 2' : r64
	push rbx
	mov rbx,0x1
	mov r10,rbx
	bts r12,2
	pop rbx
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_303
	btr r12,6
	call inc_r
	jmp lb_304
lb_303:
	bts r12,6
lb_304:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_305
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r10
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_305:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,rdx
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rbx
	jc lb_310
	btr r12,7
	call inc_r
	jmp lb_311
lb_310:
	bts r12,7
lb_311:
	pop rbx
; emt_ptn_set_ptn 6',8'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 8'
	mov rax,rbx
	jc lb_312
	btr r12,8
	call inc_r
	jmp lb_313
lb_312:
	bts r12,8
lb_313:
	pop rbx
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_308
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_308:
	bt r12,5
	jc lb_309
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_309:
	push rbx
	push r14
	mov rbx,rdi
	mov r14,rax
	sub rbx,r14
	stc
	pop r14
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_306
	btr r12,2
	call inc_r
	jmp lb_307
lb_306:
	bts r12,2
lb_307:
	pop rbx
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_314
	btr r12,5
	call inc_r
	jmp lb_315
lb_314:
	bts r12,5
lb_315:
	pop rbx
; emt_ptn_set_ptn 4',6'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_316
	btr r12,6
	call inc_r
	jmp lb_317
lb_316:
	bts r12,6
lb_317:
	pop rbx
; ; emt_dec_ptn 4'
	bt r12,4
	jc lb_318
	push r8
	push r9
	push r10
	push r11
	push rdx
	push rsi
	mov rdi,rcx
	call dec_r
	pop rsi
	pop rdx
	pop r11
	pop r10
	pop r9
	pop r8
lb_318:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_319
	btr r12,4
	call inc_r
	jmp lb_320
lb_319:
	bts r12,4
lb_320:
	pop rbx
; emt_ptn_set_ptn 1',7'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 7'
	mov rdi,rbx
	jc lb_321
	btr r12,7
	call inc_r
	jmp lb_322
lb_321:
	bts r12,7
lb_322:
	pop rbx
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_323
	push r8
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	push rdi
	mov rdi,r9
	call dec_r
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_323:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_327
	btr r14,0
	call inc_r
	jmp lb_328
lb_327:
	bts r14,0
lb_328:
	pop rbx
; emt_ptn_set_ptn 6',1'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_329
	btr r14,1
	call inc_r
	jmp lb_330
lb_329:
	bts r14,1
lb_330:
	pop rbx
; emt_ptn_set_ptn 7',2'
	push rbx
	mov rbx,rdi
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_331
	btr r14,2
	call inc_r
	jmp lb_332
lb_331:
	bts r14,2
lb_332:
	pop rbx
; ; emt_dec_ptn { 2' 6' 7' }
	bt r12,7
	jc lb_324
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,rdi
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_324:
	bt r12,6
	jc lb_325
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,rsi
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_325:
	bt r12,2
	jc lb_326
	push r8
	push r11
	push rcx
	push rdx
	mov rdi,r10
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_326:
; push_s  3'~y 4'~x 5'~z 0'~r0
	mov [tmp],rbx
	mov rbx,r11
	push rbx
	mov rbx,rcx
	push rbx
	mov rbx,rdx
	push rbx
	mov rbx,r8
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_333
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_337
	btr r12,1
	call inc_r
	jmp lb_338
lb_337:
	bts r12,1
lb_338:
	pop rbx
	push r8
	push r9
	push r11
	push rcx
	push rdx
	mov rdi,rbx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
	jmp lb_334
lb_333:
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_335
	btr r12,1
	call inc_r
	jmp lb_336
lb_335:
	bts r12,1
lb_336:
	pop rbx
lb_334:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r8,rbx
	pop rbx
	mov rdx,rbx
	pop rbx
	mov rcx,rbx
	pop rbx
	mov r11,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr1 |~ 2' : r64
	push rbx
	mov rbx,0x1
	mov r10,rbx
	bts r12,2
	pop rbx
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 6'
	mov rsi,rbx
	jc lb_339
	btr r12,6
	call inc_r
	jmp lb_340
lb_339:
	bts r12,6
lb_340:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_341
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	mov rdi,r10
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_341:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,rdx
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rbx
	jc lb_346
	btr r12,7
	call inc_r
	jmp lb_347
lb_346:
	bts r12,7
lb_347:
	pop rbx
; emt_ptn_set_ptn 6',8'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 8'
	mov rax,rbx
	jc lb_348
	btr r12,8
	call inc_r
	jmp lb_349
lb_348:
	bts r12,8
lb_349:
	pop rbx
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_344
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_344:
	bt r12,5
	jc lb_345
	push r8
	push r9
	push r10
	push r11
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_345:
	push rbx
	push r14
	mov rbx,rdi
	mov r14,rax
	sub rbx,r14
	stc
	pop r14
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_342
	btr r12,2
	call inc_r
	jmp lb_343
lb_342:
	bts r12,2
lb_343:
	pop rbx
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_353
	btr r14,0
	call inc_r
	jmp lb_354
lb_353:
	bts r14,0
lb_354:
	pop rbx
; emt_ptn_set_ptn 4',1'
	push rbx
	mov rbx,rcx
	bt r12,4
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_355
	btr r14,1
	call inc_r
	jmp lb_356
lb_355:
	bts r14,1
lb_356:
	pop rbx
; emt_ptn_set_ptn 3',2'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_357
	btr r14,2
	call inc_r
	jmp lb_358
lb_357:
	bts r14,2
lb_358:
	pop rbx
; ; emt_dec_ptn { 2' 4' 3' }
	bt r12,3
	jc lb_350
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_350:
	bt r12,4
	jc lb_351
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_351:
	bt r12,2
	jc lb_352
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_352:
; push_s  0'~r0 1'~r1
	mov [tmp],rbx
	mov rbx,r8
	push rbx
	mov rbx,r9
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_359
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_363
	btr r12,2
	call inc_r
	jmp lb_364
lb_363:
	bts r12,2
lb_364:
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_360
lb_359:
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_361
	btr r12,2
	call inc_r
	jmp lb_362
lb_361:
	bts r12,2
lb_362:
	pop rbx
lb_360:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r9,rbx
	pop rbx
	mov r8,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	tak { 0' 1' 2' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_368
	btr r14,0
	call inc_r
	jmp lb_369
lb_368:
	bts r14,0
lb_369:
	pop rbx
; emt_ptn_set_ptn 1',1'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_370
	btr r14,1
	call inc_r
	jmp lb_371
lb_370:
	bts r14,1
lb_371:
	pop rbx
; emt_ptn_set_ptn 2',2'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_372
	btr r14,2
	call inc_r
	jmp lb_373
lb_372:
	bts r14,2
lb_373:
	pop rbx
; ; emt_dec_ptn { 0' 1' 2' }
	bt r12,2
	jc lb_365
	mov rdi,r10
	call dec_r
lb_365:
	bt r12,1
	jc lb_366
	mov rdi,r9
	call dec_r
lb_366:
	bt r12,0
	jc lb_367
	mov rdi,r8
	call dec_r
lb_367:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*2]
	mov r10,rbx
	mov rbx,[st_vct_tmp+8*1]
	mov r9,rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _tak
	push rbx
	mov rbx,rax
	jc lb_374
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_378
	btr r12,0
	call inc_r
	jmp lb_379
lb_378:
	bts r12,0
lb_379:
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_375
lb_374:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_376
	btr r12,0
	call inc_r
	jmp lb_377
lb_376:
	bts r12,0
lb_377:
	pop rbx
lb_375:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
	push rbx
; emt_get_ptn 0'
	mov rbx,r8
	bt r12,0
	mov rax,rbx
	pop rbx
	ret
fact:
; 	|» 0'
	jz _fact
	jc emt_etr_c_lb_380
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_442
	btr r12,0
	call inc_r
	jmp lb_443
lb_442:
	bts r12,0
lb_443:
	pop rbx
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop rbx
jmp _fact
emt_etr_c_lb_380:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_440
	btr r12,0
	call inc_r
	jmp lb_441
lb_440:
	bts r12,0
lb_441:
	pop rbx
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_381
	btr r12,1
	call inc_r
	jmp lb_382
lb_381:
	bts r12,1
lb_382:
	pop rbx
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_383
	btr r12,2
	call inc_r
	jmp lb_384
lb_383:
	bts r12,2
lb_384:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_385
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_385:
; 	» 0xr0 |~ 0' : r64
	push rbx
	mov rbx,0x0
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_386
	btr r12,3
	call inc_r
	jmp lb_387
lb_386:
	bts r12,3
lb_387:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_388
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_388:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 4' 5' }
; emt_ptn_set_ptn 1',4'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_393
	btr r12,4
	call inc_r
	jmp lb_394
lb_393:
	bts r12,4
lb_394:
	pop rbx
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_395
	btr r12,5
	call inc_r
	jmp lb_396
lb_395:
	bts r12,5
lb_396:
	pop rbx
; ; emt_dec_ptn { 1' 3' }
	bt r12,3
	jc lb_391
	push r8
	push r10
	mov rdi,r11
	call dec_r
	pop r10
	pop r8
lb_391:
	bt r12,1
	jc lb_392
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_392:
	push rbx
	push r14
	push r15
	mov rbx,rcx
	mov r14,rdx
	cmp rbx,r14
	mov r15,1
	mov rbx,0
	setz bl
	mov r14,0
	cmovg r14,r15
	pop r15
	mov rsi,rbx
	mov rdi,r14
	pop r14
	pop rbx
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 0' -2' }
; emt_ptn_set_ptn 6',0'
	push rbx
	mov rbx,rsi
	bt r12,6
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_389
	btr r12,0
	call inc_r
	jmp lb_390
lb_389:
	bts r12,0
lb_390:
	pop rbx
; emt_ptn_set_ptn 7',-2'
	push rbx
	mov rbx,rdi
	bt r12,7
; emt_set_ptn -2'
	pop rbx
; 	∠ 0'
	push r14
; emt_get_ptn 0'
	mov r14,r8
	bt r12,0
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_398
	mov rbx,0
	stc
	jmp agl_397_1
lb_398:
	mov rbx,1
	stc
	jmp agl_397_0
; 	∐ -2'
agl_397_0:
	jc lb_399
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r10
	call dec_r
	pop r10
	jmp lb_400
lb_399:
; emt_set_ptn -2'
lb_400:
	pop rbx
	pop r14
; 	» 0xr1 |~ 0' : r64
	push rbx
	mov rbx,0x1
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_401
	btr r12,1
	call inc_r
	jmp lb_402
lb_401:
	bts r12,1
lb_402:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_403
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_403:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_404
	btr r12,0
	call inc_r
	jmp lb_405
lb_404:
	bts r12,0
lb_405:
	pop rbx
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 3'
	mov r11,rbx
	jc lb_406
	btr r12,3
	call inc_r
	jmp lb_407
lb_406:
	bts r12,3
lb_407:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_408
	push r8
	push r9
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r9
	pop r8
lb_408:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_413
	btr r12,4
	call inc_r
	jmp lb_414
lb_413:
	bts r12,4
lb_414:
	pop rbx
; emt_ptn_set_ptn 1',5'
	push rbx
	mov rbx,r9
	bt r12,1
; emt_set_ptn 5'
	mov rdx,rbx
	jc lb_415
	btr r12,5
	call inc_r
	jmp lb_416
lb_415:
	bts r12,5
lb_416:
	pop rbx
; ; emt_dec_ptn { 0' 1' }
	bt r12,1
	jc lb_411
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
lb_411:
	bt r12,0
	jc lb_412
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
lb_412:
	push rbx
	push r14
	mov rbx,rcx
	mov r14,rdx
	sub rbx,r14
	stc
	pop r14
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_409
	btr r12,2
	call inc_r
	jmp lb_410
lb_409:
	bts r12,2
lb_410:
	pop rbx
; 	fact 2' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,r10
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_418
	btr r14,0
	call inc_r
	jmp lb_419
lb_418:
	bts r14,0
lb_419:
	pop rbx
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_417
	push r11
	mov rdi,r10
	call dec_r
	pop r11
lb_417:
; push_s  3'~x2
	mov [tmp],rbx
	mov rbx,r11
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	push rbx
	mov rbx,[st_vct_tmp+8*0]
	mov r8,rbx
	pop rbx
	mov r12,r14
	call _fact
	push rbx
	mov rbx,rax
	jc lb_420
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_424
	btr r12,0
	call inc_r
	jmp lb_425
lb_424:
	bts r12,0
lb_425:
	pop rbx
	push r8
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r8
	jmp lb_421
lb_420:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_422
	btr r12,0
	call inc_r
	jmp lb_423
lb_422:
	bts r12,0
lb_423:
	pop rbx
lb_421:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov r11,rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
	push rbx
	mov rbx,r11
	bt r12,3
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_430
	btr r12,2
	call inc_r
	jmp lb_431
lb_430:
	bts r12,2
lb_431:
	pop rbx
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 4'
	mov rcx,rbx
	jc lb_432
	btr r12,4
	call inc_r
	jmp lb_433
lb_432:
	bts r12,4
lb_433:
	pop rbx
; ; emt_dec_ptn { 3' 0' }
	bt r12,0
	jc lb_428
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_428:
	bt r12,3
	jc lb_429
	push r9
	mov rdi,r11
	call dec_r
	pop r9
lb_429:
	push rbx
	push r14
	mov rbx,r10
	mov r14,rcx
	imul rbx,r14
	stc
	pop r14
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_426
	btr r12,1
	call inc_r
	jmp lb_427
lb_426:
	bts r12,1
lb_427:
	pop rbx
; 	∎ 1'
;clear 
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_397_1:
	jc lb_434
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r10
	call dec_r
	pop r10
	jmp lb_435
lb_434:
; emt_set_ptn -2'
lb_435:
	pop rbx
	pop r14
; 	» 0xr1 |~ 0' : r64
	push rbx
	mov rbx,0x1
	mov r8,rbx
	bts r12,0
	pop rbx
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,r8
	bt r12,0
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_436
	btr r12,1
	call inc_r
	jmp lb_437
lb_436:
	bts r12,1
lb_437:
	pop rbx
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_438
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_438:
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_439
	mov rdi,r10
	call dec_r
clear_lb_439:
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
	pop rbx
	ret
