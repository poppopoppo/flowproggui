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
	call test5
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
; 	» 0xr14 |~ 0' : r64
	mov r9,0x14
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_1
	btr r12,1
	call inc_r
	jmp lb_2
lb_1:
	bts r12,1
lb_2:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_3
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_3:
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_4
	btr r12,2
	call inc_r
	jmp lb_5
lb_4:
	bts r12,2
lb_5:
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
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_7
	btr r12,3
	call inc_r
	jmp lb_8
lb_7:
	bts r12,3
lb_8:
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
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r9
	jc lb_13
	btr r14,0
	call inc_r
	jmp lb_14
lb_13:
	bts r14,0
lb_14:
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],r10
	jc lb_15
	btr r14,1
	call inc_r
	jmp lb_16
lb_15:
	bts r14,1
lb_16:
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],r11
	jc lb_17
	btr r14,2
	call inc_r
	jmp lb_18
lb_17:
	bts r14,2
lb_18:
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
	mov r10,0x5
	mov r9,r10
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
	mov r10,r9
	jc lb_25
	btr r12,2
	call inc_r
	jmp lb_26
lb_25:
	bts r12,2
lb_26:
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
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r10
	jc lb_29
	btr r14,0
	call inc_r
	jmp lb_30
lb_29:
	bts r14,0
lb_30:
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
	mov r11,0x5
	mov r10,r11
	bts r12,2
; 	$ 2' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
	mov r11,r10
	jc lb_37
	btr r12,3
	call inc_r
	jmp lb_38
lb_37:
	bts r12,3
lb_38:
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
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r11
	jc lb_41
	btr r14,0
	call inc_r
	jmp lb_42
lb_41:
	bts r14,0
lb_42:
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
	mov rcx,0x6
	mov r11,rcx
	bts r12,3
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
	mov rcx,r11
	jc lb_49
	btr r12,4
	call inc_r
	jmp lb_50
lb_49:
	bts r12,4
lb_50:
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
	bt r12,4
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rcx
	jc lb_53
	btr r14,0
	call inc_r
	jmp lb_54
lb_53:
	bts r14,0
lb_54:
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
	mov r9,0x14
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_62
	btr r12,1
	call inc_r
	jmp lb_63
lb_62:
	bts r12,1
lb_63:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_64
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_64:
; 	» 0xra |~ 0' : r64
	mov r10,0xa
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_65
	btr r12,2
	call inc_r
	jmp lb_66
lb_65:
	bts r12,2
lb_66:
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
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_68
	btr r12,3
	call inc_r
	jmp lb_69
lb_68:
	bts r12,3
lb_69:
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
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r9
	jc lb_74
	btr r14,0
	call inc_r
	jmp lb_75
lb_74:
	bts r14,0
lb_75:
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],r10
	jc lb_76
	btr r14,1
	call inc_r
	jmp lb_77
lb_76:
	bts r14,1
lb_77:
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],r11
	jc lb_78
	btr r14,2
	call inc_r
	jmp lb_79
lb_78:
	bts r14,2
lb_79:
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
	mov r9,0x5
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_87
	btr r12,1
	call inc_r
	jmp lb_88
lb_87:
	bts r12,1
lb_88:
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
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r9
	jc lb_91
	btr r14,0
	call inc_r
	jmp lb_92
lb_91:
	bts r14,0
lb_92:
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
	mov r9,0x5
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_100
	btr r12,1
	call inc_r
	jmp lb_101
lb_100:
	bts r12,1
lb_101:
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
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r9
	jc lb_104
	btr r14,0
	call inc_r
	jmp lb_105
lb_104:
	bts r14,0
lb_105:
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
	mov r10,0x6
	mov r9,r10
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
	mov r10,r9
	jc lb_112
	btr r12,2
	call inc_r
	jmp lb_113
lb_112:
	bts r12,2
lb_113:
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
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r10
	jc lb_116
	btr r14,0
	call inc_r
	jmp lb_117
lb_116:
	bts r14,0
lb_117:
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
	jc lb_462
	btr r12,0
	call inc_r
	jmp lb_463
lb_462:
	bts r12,0
lb_463:
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
	jc lb_460
	btr r12,0
	call inc_r
	jmp lb_461
lb_460:
	bts r12,0
lb_461:
	pop rbx
_fib:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_125
	btr r12,1
	call inc_r
	jmp lb_126
lb_125:
	bts r12,1
lb_126:
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_127
	btr r12,2
	call inc_r
	jmp lb_128
lb_127:
	bts r12,2
lb_128:
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
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_130
	btr r12,3
	call inc_r
	jmp lb_131
lb_130:
	bts r12,3
lb_131:
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
; emt_ptn_set_ptn { 2' 3' },{ 0' 4' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
	mov r8,r10
	jc lb_138
	btr r12,0
	call inc_r
	jmp lb_139
lb_138:
	bts r12,0
lb_139:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
	mov rcx,r11
	jc lb_140
	btr r12,4
	call inc_r
	jmp lb_141
lb_140:
	bts r12,4
lb_141:
; ; emt_dec_ptn { 2' 3' }
	bt r12,3
	jc lb_136
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_136:
	bt r12,2
	jc lb_137
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_137:
	cmp r8,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r8,1
	jle lb_133
	mov r11,r8
lb_133:
	or r12,0b100
	or r12,0b1000
; emt_ptn_set_ptn { 2' 3' },{ 0' -2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
	mov r8,r10
	jc lb_134
	btr r12,0
	call inc_r
	jmp lb_135
lb_134:
	bts r12,0
lb_135:
; emt_ptn_set_ptn 3',-2'
	bt r12,3
; emt_set_ptn -2'
; 	∠ 0'
	push r14
; emt_get_ptn 0'
	mov r14,r8
	bt r12,0
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_143
	mov rbx,0
	stc
	jmp agl_142_1
lb_143:
	mov rbx,1
	stc
	jmp agl_142_0
; 	∐ -2'
agl_142_0:
	jc lb_144
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r9
	call dec_r
	pop r9
	jmp lb_145
lb_144:
; emt_set_ptn -2'
lb_145:
	pop rbx
	pop r14
; 	$ 1' ⊢ ,0',2' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
	mov r8,r9
	jc lb_146
	btr r12,0
	call inc_r
	jmp lb_147
lb_146:
	bts r12,0
lb_147:
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
	mov r10,r9
	jc lb_148
	btr r12,2
	call inc_r
	jmp lb_149
lb_148:
	bts r12,2
lb_149:
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_150
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_150:
; 	» 0xr1 |~ 1' : r64
	mov r11,0x1
	mov r9,r11
	bts r12,1
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	bt r12,1
; emt_set_ptn 3'
	mov r11,r9
	jc lb_151
	btr r12,3
	call inc_r
	jmp lb_152
lb_151:
	bts r12,3
lb_152:
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_153
	push r8
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
	pop r8
lb_153:
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 1' 4' }
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
	mov r9,r10
	jc lb_159
	btr r12,1
	call inc_r
	jmp lb_160
lb_159:
	bts r12,1
lb_160:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
	mov rcx,r11
	jc lb_161
	btr r12,4
	call inc_r
	jmp lb_162
lb_161:
	bts r12,4
lb_162:
; ; emt_dec_ptn { 2' 3' }
	bt r12,3
	jc lb_157
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_157:
	bt r12,2
	jc lb_158
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_158:
	cmp r9,rcx
	mov r10,0
	mov r11,0
	setz r10b
	mov r9,1
	jle lb_154
	mov r11,r9
lb_154:
	or r12,0b100
	or r12,0b1000
; emt_ptn_set_ptn { 2' 3' },{ 1' -2' }
; emt_ptn_set_ptn 2',1'
	bt r12,2
; emt_set_ptn 1'
	mov r9,r10
	jc lb_155
	btr r12,1
	call inc_r
	jmp lb_156
lb_155:
	bts r12,1
lb_156:
; emt_ptn_set_ptn 3',-2'
	bt r12,3
; emt_set_ptn -2'
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_164
	mov rbx,0
	stc
	jmp agl_163_1
lb_164:
	mov rbx,1
	stc
	jmp agl_163_0
; 	∐ -2'
agl_163_0:
	jc lb_165
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	call dec_r
	pop r8
	jmp lb_166
lb_165:
; emt_set_ptn -2'
lb_166:
	pop rbx
	pop r14
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_167
	btr r12,1
	call inc_r
	jmp lb_168
lb_167:
	bts r12,1
lb_168:
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_169
	btr r12,2
	call inc_r
	jmp lb_170
lb_169:
	bts r12,2
lb_170:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_171
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_171:
; 	» 0xr1 |~ 0' : r64
	mov r11,0x1
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_172
	btr r12,3
	call inc_r
	jmp lb_173
lb_172:
	bts r12,3
lb_173:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_174
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_174:
; 	» 0xr2 |~ 0' : r64
	mov rcx,0x2
	mov r8,rcx
	bts r12,0
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
	mov rcx,r8
	jc lb_175
	btr r12,4
	call inc_r
	jmp lb_176
lb_175:
	bts r12,4
lb_176:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_177
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
lb_177:
; 	sub { 1' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
	mov rdx,r9
	jc lb_182
	btr r12,5
	call inc_r
	jmp lb_183
lb_182:
	bts r12,5
lb_183:
; emt_ptn_set_ptn 3',6'
	bt r12,3
; emt_set_ptn 6'
	mov rsi,r11
	jc lb_184
	btr r12,6
	call inc_r
	jmp lb_185
lb_184:
	bts r12,6
lb_185:
; ; emt_dec_ptn { 1' 3' }
	bt r12,3
	jc lb_180
	push r8
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_180:
	bt r12,1
	jc lb_181
	push r8
	push r10
	push rcx
	mov rdi,r9
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_181:
	sub rdx,rsi
	stc
; emt_set_ptn 0'
	mov r8,rdx
	jc lb_178
	btr r12,0
	call inc_r
	jmp lb_179
lb_178:
	bts r12,0
lb_179:
; 	sub { 2' 4' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 4' },{ 3' 5' }
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
	mov r11,r10
	jc lb_190
	btr r12,3
	call inc_r
	jmp lb_191
lb_190:
	bts r12,3
lb_191:
; emt_ptn_set_ptn 4',5'
	bt r12,4
; emt_set_ptn 5'
	mov rdx,rcx
	jc lb_192
	btr r12,5
	call inc_r
	jmp lb_193
lb_192:
	bts r12,5
lb_193:
; ; emt_dec_ptn { 2' 4' }
	bt r12,4
	jc lb_188
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_188:
	bt r12,2
	jc lb_189
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_189:
	sub r11,rdx
	stc
; emt_set_ptn 1'
	mov r9,r11
	jc lb_186
	btr r12,1
	call inc_r
	jmp lb_187
lb_186:
	bts r12,1
lb_187:
; 	fib 0' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 0',0'
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r8
	jc lb_195
	btr r14,0
	call inc_r
	jmp lb_196
lb_195:
	bts r14,0
lb_196:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_194
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_194:
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
	jc lb_197
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_201
	btr r12,0
	call inc_r
	jmp lb_202
lb_201:
	bts r12,0
lb_202:
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_198
lb_197:
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
lb_198:
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
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r9
	jc lb_204
	btr r14,0
	call inc_r
	jmp lb_205
lb_204:
	bts r14,0
lb_205:
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_203
	push r8
	mov rdi,r9
	call dec_r
	pop r8
lb_203:
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
	jc lb_206
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_210
	btr r12,1
	call inc_r
	jmp lb_211
lb_210:
	bts r12,1
lb_211:
	pop rbx
	push r8
	push r9
	mov rdi,rbx
	call dec_r
	pop r9
	pop r8
	jmp lb_207
lb_206:
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
lb_207:
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
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_216
	btr r12,3
	call inc_r
	jmp lb_217
lb_216:
	bts r12,3
lb_217:
; emt_ptn_set_ptn 1',4'
	bt r12,1
; emt_set_ptn 4'
	mov rcx,r9
	jc lb_218
	btr r12,4
	call inc_r
	jmp lb_219
lb_218:
	bts r12,4
lb_219:
; ; emt_dec_ptn { 0' 1' }
	bt r12,1
	jc lb_214
	push r10
	mov rdi,r9
	call dec_r
	pop r10
lb_214:
	bt r12,0
	jc lb_215
	push r10
	mov rdi,r8
	call dec_r
	pop r10
lb_215:
	push rbx
	push r14
	mov rbx,r11
	mov r14,rcx
	add rbx,r14
	stc
	pop r14
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_212
	btr r12,2
	call inc_r
	jmp lb_213
lb_212:
	bts r12,2
lb_213:
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
agl_163_1:
	jc lb_220
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r8
	call dec_r
	pop r8
	jmp lb_221
lb_220:
; emt_set_ptn -2'
lb_221:
	pop rbx
	pop r14
; 	» 0xr1 |~ 1' : r64
	mov r10,0x1
	mov r9,r10
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	bt r12,1
; emt_set_ptn 2'
	mov r10,r9
	jc lb_222
	btr r12,2
	call inc_r
	jmp lb_223
lb_222:
	bts r12,2
lb_223:
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_224
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_224:
; 	∎ 2'
;clear  0'~x
	bt r12,0
	jc clear_lb_225
	mov rdi,r8
	call dec_r
clear_lb_225:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_142_1:
	jc lb_226
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r9
	call dec_r
	pop r9
	jmp lb_227
lb_226:
; emt_set_ptn -2'
lb_227:
	pop rbx
	pop r14
; 	» 0xr0 |~ 0' : r64
	mov r10,0x0
	mov r8,r10
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_228
	btr r12,2
	call inc_r
	jmp lb_229
lb_228:
	bts r12,2
lb_229:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_230
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_230:
; 	∎ 2'
;clear  1'~x
	bt r12,1
	jc clear_lb_231
	mov rdi,r9
	call dec_r
clear_lb_231:
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
	jc emt_etr_c_lb_232
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_454
	btr r12,0
	call inc_r
	jmp lb_455
lb_454:
	bts r12,0
lb_455:
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_456
	btr r12,1
	call inc_r
	jmp lb_457
lb_456:
	bts r12,1
lb_457:
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_458
	btr r12,2
	call inc_r
	jmp lb_459
lb_458:
	bts r12,2
lb_459:
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
emt_etr_c_lb_232:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov rbx,[rbx]
	bt rbx,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_448
	btr r12,0
	call inc_r
	jmp lb_449
lb_448:
	bts r12,0
lb_449:
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_450
	btr r12,1
	call inc_r
	jmp lb_451
lb_450:
	bts r12,1
lb_451:
	pop rbx
	push rbx
	mov rbx,[rbx]
	bt rbx,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_452
	btr r12,2
	call inc_r
	jmp lb_453
lb_452:
	bts r12,2
lb_453:
	pop rbx
	pop rbx
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_233
	btr r12,3
	call inc_r
	jmp lb_234
lb_233:
	bts r12,3
lb_234:
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
	mov rcx,r8
	jc lb_235
	btr r12,4
	call inc_r
	jmp lb_236
lb_235:
	bts r12,4
lb_236:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_237
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
lb_237:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
	mov r8,r9
	jc lb_238
	btr r12,0
	call inc_r
	jmp lb_239
lb_238:
	bts r12,0
lb_239:
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
	mov rdx,r9
	jc lb_240
	btr r12,5
	call inc_r
	jmp lb_241
lb_240:
	bts r12,5
lb_241:
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_242
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
lb_242:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
	mov r9,rcx
	jc lb_248
	btr r12,1
	call inc_r
	jmp lb_249
lb_248:
	bts r12,1
lb_249:
; emt_ptn_set_ptn 5',6'
	bt r12,5
; emt_set_ptn 6'
	mov rsi,rdx
	jc lb_250
	btr r12,6
	call inc_r
	jmp lb_251
lb_250:
	bts r12,6
lb_251:
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_246
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
lb_246:
	bt r12,4
	jc lb_247
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
lb_247:
	cmp r9,rsi
	mov rcx,0
	mov rdx,0
	setz cl
	mov r9,1
	jle lb_243
	mov rdx,r9
lb_243:
	or r12,0b10000
	or r12,0b100000
; emt_ptn_set_ptn { 4' 5' },{ -2' 1' }
; emt_ptn_set_ptn 4',-2'
	bt r12,4
; emt_set_ptn -2'
; emt_ptn_set_ptn 5',1'
	bt r12,5
; emt_set_ptn 1'
	mov r9,rdx
	jc lb_244
	btr r12,1
	call inc_r
	jmp lb_245
lb_244:
	bts r12,1
lb_245:
; 	∠ 1'
	push r14
; emt_get_ptn 1'
	mov r14,r9
	bt r12,1
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_253
	mov rbx,0
	stc
	jmp agl_252_1
lb_253:
	mov rbx,1
	stc
	jmp agl_252_0
; 	∐ -2'
agl_252_0:
	jc lb_254
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
	jmp lb_255
lb_254:
; emt_set_ptn -2'
lb_255:
	pop rbx
	pop r14
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_256
	push r8
	mov rdi,r11
	call dec_r
	pop r8
clear_lb_256:
	bt r12,0
	jc clear_lb_257
	mov rdi,r8
	call dec_r
clear_lb_257:
	push rbx
; emt_get_ptn 2'
	mov rbx,r10
	bt r12,2
	mov rax,rbx
	pop rbx
	ret
; 	∐ -2'
agl_252_1:
	jc lb_258
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
	jmp lb_259
lb_258:
; emt_set_ptn -2'
lb_259:
	pop rbx
	pop r14
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	bt r12,3
; emt_set_ptn 1'
	mov r9,r11
	jc lb_260
	btr r12,1
	call inc_r
	jmp lb_261
lb_260:
	bts r12,1
lb_261:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
	mov rcx,r11
	jc lb_262
	btr r12,4
	call inc_r
	jmp lb_263
lb_262:
	bts r12,4
lb_263:
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_264
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
lb_264:
; 	» 0xr1 |~ 3' : r64
	mov rdx,0x1
	mov r11,rdx
	bts r12,3
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
	bt r12,3
; emt_set_ptn 5'
	mov rdx,r11
	jc lb_265
	btr r12,5
	call inc_r
	jmp lb_266
lb_265:
	bts r12,5
lb_266:
; ; emt_dec_ptn 3'
	bt r12,3
	jc lb_267
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
lb_267:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	bt r12,4
; emt_set_ptn 6'
	mov rsi,rcx
	jc lb_272
	btr r12,6
	call inc_r
	jmp lb_273
lb_272:
	bts r12,6
lb_273:
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rdx
	jc lb_274
	btr r12,7
	call inc_r
	jmp lb_275
lb_274:
	bts r12,7
lb_275:
; ; emt_dec_ptn { 4' 5' }
	bt r12,5
	jc lb_270
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
lb_270:
	bt r12,4
	jc lb_271
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
lb_271:
	sub rsi,rdi
	stc
; emt_set_ptn 3'
	mov r11,rsi
	jc lb_268
	btr r12,3
	call inc_r
	jmp lb_269
lb_268:
	bts r12,3
lb_269:
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	bt r12,2
; emt_set_ptn 4'
	mov rcx,r10
	jc lb_276
	btr r12,4
	call inc_r
	jmp lb_277
lb_276:
	bts r12,4
lb_277:
; emt_ptn_set_ptn 2',5'
	bt r12,2
; emt_set_ptn 5'
	mov rdx,r10
	jc lb_278
	btr r12,5
	call inc_r
	jmp lb_279
lb_278:
	bts r12,5
lb_279:
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_280
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
lb_280:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_281
	btr r12,2
	call inc_r
	jmp lb_282
lb_281:
	bts r12,2
lb_282:
; emt_ptn_set_ptn 0',6'
	bt r12,0
; emt_set_ptn 6'
	mov rsi,r8
	jc lb_283
	btr r12,6
	call inc_r
	jmp lb_284
lb_283:
	bts r12,6
lb_284:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_285
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
lb_285:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r11
	jc lb_289
	btr r14,0
	call inc_r
	jmp lb_290
lb_289:
	bts r14,0
lb_290:
; emt_ptn_set_ptn 6',1'
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rsi
	jc lb_291
	btr r14,1
	call inc_r
	jmp lb_292
lb_291:
	bts r14,1
lb_292:
; emt_ptn_set_ptn 5',2'
	bt r12,5
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdx
	jc lb_293
	btr r14,2
	call inc_r
	jmp lb_294
lb_293:
	bts r14,2
lb_294:
; ; emt_dec_ptn { 3' 6' 5' }
	bt r12,5
	jc lb_286
	push r9
	push r10
	push rcx
	mov rdi,rdx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_286:
	bt r12,6
	jc lb_287
	push r9
	push r10
	push rcx
	mov rdi,rsi
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_287:
	bt r12,3
	jc lb_288
	push r9
	push r10
	push rcx
	mov rdi,r11
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_288:
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
	jc lb_295
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_299
	btr r12,0
	call inc_r
	jmp lb_300
lb_299:
	bts r12,0
lb_300:
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
	jmp lb_296
lb_295:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_297
	btr r12,0
	call inc_r
	jmp lb_298
lb_297:
	bts r12,0
lb_298:
	pop rbx
lb_296:
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
	bt r12,2
; emt_set_ptn 3'
	mov r11,r10
	jc lb_301
	btr r12,3
	call inc_r
	jmp lb_302
lb_301:
	bts r12,3
lb_302:
; emt_ptn_set_ptn 2',5'
	bt r12,2
; emt_set_ptn 5'
	mov rdx,r10
	jc lb_303
	btr r12,5
	call inc_r
	jmp lb_304
lb_303:
	bts r12,5
lb_304:
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_305
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
lb_305:
; 	» 0xr1 |~ 2' : r64
	mov rsi,0x1
	mov r10,rsi
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	bt r12,2
; emt_set_ptn 6'
	mov rsi,r10
	jc lb_306
	btr r12,6
	call inc_r
	jmp lb_307
lb_306:
	bts r12,6
lb_307:
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_308
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
lb_308:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rdx
	jc lb_313
	btr r12,7
	call inc_r
	jmp lb_314
lb_313:
	bts r12,7
lb_314:
; emt_ptn_set_ptn 6',8'
	bt r12,6
; emt_set_ptn 8'
	mov rax,rsi
	jc lb_315
	btr r12,8
	call inc_r
	jmp lb_316
lb_315:
	bts r12,8
lb_316:
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_311
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
lb_311:
	bt r12,5
	jc lb_312
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
lb_312:
	sub rdi,rax
	stc
; emt_set_ptn 2'
	mov r10,rdi
	jc lb_309
	btr r12,2
	call inc_r
	jmp lb_310
lb_309:
	bts r12,2
lb_310:
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	bt r12,4
; emt_set_ptn 5'
	mov rdx,rcx
	jc lb_317
	btr r12,5
	call inc_r
	jmp lb_318
lb_317:
	bts r12,5
lb_318:
; emt_ptn_set_ptn 4',6'
	bt r12,4
; emt_set_ptn 6'
	mov rsi,rcx
	jc lb_319
	btr r12,6
	call inc_r
	jmp lb_320
lb_319:
	bts r12,6
lb_320:
; ; emt_dec_ptn 4'
	bt r12,4
	jc lb_321
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
lb_321:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	bt r12,1
; emt_set_ptn 4'
	mov rcx,r9
	jc lb_322
	btr r12,4
	call inc_r
	jmp lb_323
lb_322:
	bts r12,4
lb_323:
; emt_ptn_set_ptn 1',7'
	bt r12,1
; emt_set_ptn 7'
	mov rdi,r9
	jc lb_324
	btr r12,7
	call inc_r
	jmp lb_325
lb_324:
	bts r12,7
lb_325:
; ; emt_dec_ptn 1'
	bt r12,1
	jc lb_326
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
lb_326:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r10
	jc lb_330
	btr r14,0
	call inc_r
	jmp lb_331
lb_330:
	bts r14,0
lb_331:
; emt_ptn_set_ptn 6',1'
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rsi
	jc lb_332
	btr r14,1
	call inc_r
	jmp lb_333
lb_332:
	bts r14,1
lb_333:
; emt_ptn_set_ptn 7',2'
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_334
	btr r14,2
	call inc_r
	jmp lb_335
lb_334:
	bts r14,2
lb_335:
; ; emt_dec_ptn { 2' 6' 7' }
	bt r12,7
	jc lb_327
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
lb_327:
	bt r12,6
	jc lb_328
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
lb_328:
	bt r12,2
	jc lb_329
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
lb_329:
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
	jc lb_336
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_340
	btr r12,1
	call inc_r
	jmp lb_341
lb_340:
	bts r12,1
lb_341:
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
	jmp lb_337
lb_336:
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_338
	btr r12,1
	call inc_r
	jmp lb_339
lb_338:
	bts r12,1
lb_339:
	pop rbx
lb_337:
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
	mov rsi,0x1
	mov r10,rsi
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	bt r12,2
; emt_set_ptn 6'
	mov rsi,r10
	jc lb_342
	btr r12,6
	call inc_r
	jmp lb_343
lb_342:
	bts r12,6
lb_343:
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_344
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
lb_344:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	bt r12,5
; emt_set_ptn 7'
	mov rdi,rdx
	jc lb_349
	btr r12,7
	call inc_r
	jmp lb_350
lb_349:
	bts r12,7
lb_350:
; emt_ptn_set_ptn 6',8'
	bt r12,6
; emt_set_ptn 8'
	mov rax,rsi
	jc lb_351
	btr r12,8
	call inc_r
	jmp lb_352
lb_351:
	bts r12,8
lb_352:
; ; emt_dec_ptn { 5' 6' }
	bt r12,6
	jc lb_347
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
lb_347:
	bt r12,5
	jc lb_348
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
lb_348:
	sub rdi,rax
	stc
; emt_set_ptn 2'
	mov r10,rdi
	jc lb_345
	btr r12,2
	call inc_r
	jmp lb_346
lb_345:
	bts r12,2
lb_346:
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r10
	jc lb_356
	btr r14,0
	call inc_r
	jmp lb_357
lb_356:
	bts r14,0
lb_357:
; emt_ptn_set_ptn 4',1'
	bt r12,4
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rcx
	jc lb_358
	btr r14,1
	call inc_r
	jmp lb_359
lb_358:
	bts r14,1
lb_359:
; emt_ptn_set_ptn 3',2'
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],r11
	jc lb_360
	btr r14,2
	call inc_r
	jmp lb_361
lb_360:
	bts r14,2
lb_361:
; ; emt_dec_ptn { 2' 4' 3' }
	bt r12,3
	jc lb_353
	push r8
	push r9
	mov rdi,r11
	call dec_r
	pop r9
	pop r8
lb_353:
	bt r12,4
	jc lb_354
	push r8
	push r9
	mov rdi,rcx
	call dec_r
	pop r9
	pop r8
lb_354:
	bt r12,2
	jc lb_355
	push r8
	push r9
	mov rdi,r10
	call dec_r
	pop r9
	pop r8
lb_355:
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
	jc lb_362
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_366
	btr r12,2
	call inc_r
	jmp lb_367
lb_366:
	bts r12,2
lb_367:
	pop rbx
	push r8
	push r9
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop r9
	pop r8
	jmp lb_363
lb_362:
; emt_set_ptn 2'
	mov r10,rbx
	jc lb_364
	btr r12,2
	call inc_r
	jmp lb_365
lb_364:
	bts r12,2
lb_365:
	pop rbx
lb_363:
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
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r8
	jc lb_371
	btr r14,0
	call inc_r
	jmp lb_372
lb_371:
	bts r14,0
lb_372:
; emt_ptn_set_ptn 1',1'
	bt r12,1
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],r9
	jc lb_373
	btr r14,1
	call inc_r
	jmp lb_374
lb_373:
	bts r14,1
lb_374:
; emt_ptn_set_ptn 2',2'
	bt r12,2
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],r10
	jc lb_375
	btr r14,2
	call inc_r
	jmp lb_376
lb_375:
	bts r14,2
lb_376:
; ; emt_dec_ptn { 0' 1' 2' }
	bt r12,2
	jc lb_368
	mov rdi,r10
	call dec_r
lb_368:
	bt r12,1
	jc lb_369
	mov rdi,r9
	call dec_r
lb_369:
	bt r12,0
	jc lb_370
	mov rdi,r8
	call dec_r
lb_370:
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
	jc lb_377
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_381
	btr r12,0
	call inc_r
	jmp lb_382
lb_381:
	bts r12,0
lb_382:
	pop rbx
	push r8
	mov rdi,rbx
	call dec_r
	pop r8
	jmp lb_378
lb_377:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_379
	btr r12,0
	call inc_r
	jmp lb_380
lb_379:
	bts r12,0
lb_380:
	pop rbx
lb_378:
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
	jc emt_etr_c_lb_383
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_446
	btr r12,0
	call inc_r
	jmp lb_447
lb_446:
	bts r12,0
lb_447:
	pop rbx
	push r10
	mov rdi,rbx
	call dec_r
	pop r10
	pop rbx
jmp _fact
emt_etr_c_lb_383:
	push rbx
	mov rbx,rdi
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
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_384
	btr r12,1
	call inc_r
	jmp lb_385
lb_384:
	bts r12,1
lb_385:
; emt_ptn_set_ptn 0',2'
	bt r12,0
; emt_set_ptn 2'
	mov r10,r8
	jc lb_386
	btr r12,2
	call inc_r
	jmp lb_387
lb_386:
	bts r12,2
lb_387:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_388
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_388:
; 	» 0xr0 |~ 0' : r64
	mov r11,0x0
	mov r8,r11
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	bt r12,0
; emt_set_ptn 3'
	mov r11,r8
	jc lb_389
	btr r12,3
	call inc_r
	jmp lb_390
lb_389:
	bts r12,3
lb_390:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_391
	push r9
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
	pop r9
lb_391:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
	mov r8,r9
	jc lb_397
	btr r12,0
	call inc_r
	jmp lb_398
lb_397:
	bts r12,0
lb_398:
; emt_ptn_set_ptn 3',4'
	bt r12,3
; emt_set_ptn 4'
	mov rcx,r11
	jc lb_399
	btr r12,4
	call inc_r
	jmp lb_400
lb_399:
	bts r12,4
lb_400:
; ; emt_dec_ptn { 1' 3' }
	bt r12,3
	jc lb_395
	push r8
	push r10
	mov rdi,r11
	call dec_r
	pop r10
	pop r8
lb_395:
	bt r12,1
	jc lb_396
	push r8
	push r10
	mov rdi,r9
	call dec_r
	pop r10
	pop r8
lb_396:
	cmp r8,rcx
	mov r9,0
	mov r11,0
	setz r9b
	mov r8,1
	jle lb_392
	mov r11,r8
lb_392:
	or r12,0b10
	or r12,0b1000
; emt_ptn_set_ptn { 1' 3' },{ 0' -2' }
; emt_ptn_set_ptn 1',0'
	bt r12,1
; emt_set_ptn 0'
	mov r8,r9
	jc lb_393
	btr r12,0
	call inc_r
	jmp lb_394
lb_393:
	bts r12,0
lb_394:
; emt_ptn_set_ptn 3',-2'
	bt r12,3
; emt_set_ptn -2'
; 	∠ 0'
	push r14
; emt_get_ptn 0'
	mov r14,r8
	bt r12,0
	cmp r14,0
	push rbx
	mov rbx,r14
	je lb_402
	mov rbx,0
	stc
	jmp agl_401_1
lb_402:
	mov rbx,1
	stc
	jmp agl_401_0
; 	∐ -2'
agl_401_0:
	jc lb_403
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r10
	call dec_r
	pop r10
	jmp lb_404
lb_403:
; emt_set_ptn -2'
lb_404:
	pop rbx
	pop r14
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_405
	btr r12,1
	call inc_r
	jmp lb_406
lb_405:
	bts r12,1
lb_406:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_407
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_407:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
	mov r8,r10
	jc lb_408
	btr r12,0
	call inc_r
	jmp lb_409
lb_408:
	bts r12,0
lb_409:
; emt_ptn_set_ptn 2',3'
	bt r12,2
; emt_set_ptn 3'
	mov r11,r10
	jc lb_410
	btr r12,3
	call inc_r
	jmp lb_411
lb_410:
	bts r12,3
lb_411:
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_412
	push r8
	push r9
	push r11
	mov rdi,r10
	call dec_r
	pop r11
	pop r9
	pop r8
lb_412:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
	mov rcx,r8
	jc lb_417
	btr r12,4
	call inc_r
	jmp lb_418
lb_417:
	bts r12,4
lb_418:
; emt_ptn_set_ptn 1',5'
	bt r12,1
; emt_set_ptn 5'
	mov rdx,r9
	jc lb_419
	btr r12,5
	call inc_r
	jmp lb_420
lb_419:
	bts r12,5
lb_420:
; ; emt_dec_ptn { 0' 1' }
	bt r12,1
	jc lb_415
	push r10
	push r11
	mov rdi,r9
	call dec_r
	pop r11
	pop r10
lb_415:
	bt r12,0
	jc lb_416
	push r10
	push r11
	mov rdi,r8
	call dec_r
	pop r11
	pop r10
lb_416:
	sub rcx,rdx
	stc
; emt_set_ptn 2'
	mov r10,rcx
	jc lb_413
	btr r12,2
	call inc_r
	jmp lb_414
lb_413:
	bts r12,2
lb_414:
; 	fact 2' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],r10
	jc lb_422
	btr r14,0
	call inc_r
	jmp lb_423
lb_422:
	bts r14,0
lb_423:
; ; emt_dec_ptn 2'
	bt r12,2
	jc lb_421
	push r11
	mov rdi,r10
	call dec_r
	pop r11
lb_421:
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
	jc lb_424
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_428
	btr r12,0
	call inc_r
	jmp lb_429
lb_428:
	bts r12,0
lb_429:
	pop rbx
	push r8
	push r11
	mov rdi,rbx
	call dec_r
	pop r11
	pop r8
	jmp lb_425
lb_424:
; emt_set_ptn 0'
	mov r8,rbx
	jc lb_426
	btr r12,0
	call inc_r
	jmp lb_427
lb_426:
	bts r12,0
lb_427:
	pop rbx
lb_425:
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
	bt r12,3
; emt_set_ptn 2'
	mov r10,r11
	jc lb_434
	btr r12,2
	call inc_r
	jmp lb_435
lb_434:
	bts r12,2
lb_435:
; emt_ptn_set_ptn 0',4'
	bt r12,0
; emt_set_ptn 4'
	mov rcx,r8
	jc lb_436
	btr r12,4
	call inc_r
	jmp lb_437
lb_436:
	bts r12,4
lb_437:
; ; emt_dec_ptn { 3' 0' }
	bt r12,0
	jc lb_432
	push r9
	mov rdi,r8
	call dec_r
	pop r9
lb_432:
	bt r12,3
	jc lb_433
	push r9
	mov rdi,r11
	call dec_r
	pop r9
lb_433:
	push rbx
	push r14
	mov rbx,r10
	mov r14,rcx
	imul rbx,r14
	stc
	pop r14
; emt_set_ptn 1'
	mov r9,rbx
	jc lb_430
	btr r12,1
	call inc_r
	jmp lb_431
lb_430:
	bts r12,1
lb_431:
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
agl_401_1:
	jc lb_438
	push rbx
; emt_set_ptn -2'
	pop rbx
	push r10
	call dec_r
	pop r10
	jmp lb_439
lb_438:
; emt_set_ptn -2'
lb_439:
	pop rbx
	pop r14
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov r8,r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	bt r12,0
; emt_set_ptn 1'
	mov r9,r8
	jc lb_440
	btr r12,1
	call inc_r
	jmp lb_441
lb_440:
	bts r12,1
lb_441:
; ; emt_dec_ptn 0'
	bt r12,0
	jc lb_442
	push r9
	push r10
	mov rdi,r8
	call dec_r
	pop r10
	pop r9
lb_442:
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_443
	mov rdi,r10
	call dec_r
clear_lb_443:
	push rbx
; emt_get_ptn 1'
	mov rbx,r9
	bt r12,1
	mov rax,rbx
	pop rbx
	ret
