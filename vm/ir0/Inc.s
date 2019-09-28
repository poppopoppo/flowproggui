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
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp _test5
emt_etr_c_lb_0:
; emt_set_ptn {  }
_test5:
; 	» 0xr14 |~ 0' : r64
	mov r9,0x14
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_1
	btr r12,1
	call inc_r
	jmp lb_2
lb_1:
	bts r12,1
lb_2:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_3
	bts r12,0
	push r9
	call dec_r
	pop r9
lb_3:
; 	» 0xra |~ 0' : r64
	mov r9,0xa
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_4
	btr r12,2
	call inc_r
	jmp lb_5
lb_4:
	bts r12,2
lb_5:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_6
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_6:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_7
	btr r12,3
	call inc_r
	jmp lb_8
lb_7:
	bts r12,3
lb_8:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_9
	bts r12,0
	push r9
	push r10
	push r11
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
	mov rbx,[st_vct+8*1]
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
	mov rbx,[st_vct+8*2]
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
	mov rbx,[st_vct+8*3]
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
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_10
	bts r12,3
	call dec_r
lb_10:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_11
	bts r12,2
	call dec_r
lb_11:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_12
	bts r12,1
	call dec_r
lb_12:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*2]
	mov [st_vct+8*2],rax
	mov rax,[st_vct_tmp+8*1]
	mov [st_vct+8*1],rax
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _tak
	mov rdi,rax
	jc lb_19
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_23
	btr r12,0
	call inc_r
	jmp lb_24
lb_23:
	bts r12,0
lb_24:
	pop rdi
	call dec_r
	jmp lb_20
lb_19:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_21
	btr r12,0
	call inc_r
	jmp lb_22
lb_21:
	bts r12,0
lb_22:
lb_20:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr5 |~ 1' : r64
	mov r9,0x5
	mov [st_vct+8*1],r9
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_25
	btr r12,2
	call inc_r
	jmp lb_26
lb_25:
	bts r12,2
lb_26:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_27
	bts r12,1
	push r8
	push r10
	call dec_r
	pop r10
	pop r8
lb_27:
; 	fact 2' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,[st_vct+8*2]
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
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_28
	bts r12,2
	push r8
	call dec_r
	pop r8
lb_28:
; push_s  0'~r
	mov [tmp],rbx
	mov rbx,[st_vct+8*0]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fact
	mov rdi,rax
	jc lb_31
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_35
	btr r12,1
	call inc_r
	jmp lb_36
lb_35:
	bts r12,1
lb_36:
	pop rdi
	call dec_r
	jmp lb_32
lb_31:
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_33
	btr r12,1
	call inc_r
	jmp lb_34
lb_33:
	bts r12,1
lb_34:
lb_32:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*0],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr5 |~ 2' : r64
	mov r9,0x5
	mov [st_vct+8*2],r9
	bts r12,2
; 	$ 2' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_37
	btr r12,3
	call inc_r
	jmp lb_38
lb_37:
	bts r12,3
lb_38:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_39
	bts r12,2
	push r8
	push r9
	push r11
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
	mov rbx,[st_vct+8*3]
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
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_40
	bts r12,3
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_40:
; push_s  0'~r 1'~y
	mov [tmp],rbx
	mov rbx,[st_vct+8*0]
	push rbx
	mov rbx,[st_vct+8*1]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fib
	mov rdi,rax
	jc lb_43
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_47
	btr r12,2
	call inc_r
	jmp lb_48
lb_47:
	bts r12,2
lb_48:
	pop rdi
	call dec_r
	jmp lb_44
lb_43:
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_45
	btr r12,2
	call inc_r
	jmp lb_46
lb_45:
	bts r12,2
lb_46:
lb_44:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*1],rbx
	pop rbx
	mov [st_vct+8*0],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr6 |~ 3' : r64
	mov r9,0x6
	mov [st_vct+8*3],r9
	bts r12,3
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_49
	btr r12,4
	call inc_r
	jmp lb_50
lb_49:
	bts r12,4
lb_50:
	pop rbx
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_51
	bts r12,3
	push r8
	push r9
	push r10
	push rcx
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
	mov rbx,[st_vct+8*4]
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
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_52
	bts r12,4
	push r8
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
	pop r8
lb_52:
; push_s  2'~y0 0'~r 1'~y
	mov [tmp],rbx
	mov rbx,[st_vct+8*2]
	push rbx
	mov rbx,[st_vct+8*0]
	push rbx
	mov rbx,[st_vct+8*1]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fib
	mov rdi,rax
	jc lb_55
	push rdi
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_59
	btr r12,3
	call inc_r
	jmp lb_60
lb_59:
	bts r12,3
lb_60:
	pop rdi
	call dec_r
	jmp lb_56
lb_55:
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_57
	btr r12,3
	call inc_r
	jmp lb_58
lb_57:
	bts r12,3
lb_58:
lb_56:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*1],rbx
	pop rbx
	mov [st_vct+8*0],rbx
	pop rbx
	mov [st_vct+8*2],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ { 0' 1' 2' 3' }
;clear 
; emt_get_ptn { 0' 1' 2' 3' }
	mov rdi,4
	call mlc
	mov rax,rax
	push rax
; emt_get_ptn 0'
	mov rdx,[st_vct+8*0]
	bt r12,0
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 1'
	mov rdx,[st_vct+8*1]
	bt r12,1
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 2'
	mov rdx,[st_vct+8*2]
	bt r12,2
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 3'
	mov rdx,[st_vct+8*3]
	bt r12,3
	pop rdi
	mov rsi,3
	push rdi
	call exc
	pop rax
	clc
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_61
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp _test4
emt_etr_c_lb_61:
; emt_set_ptn {  }
_test4:
; 	» 0xr5 |~ 0' : r64
	mov r9,0x5
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_62
	btr r12,1
	call inc_r
	jmp lb_63
lb_62:
	bts r12,1
lb_63:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_64
	bts r12,0
	push r9
	call dec_r
	pop r9
lb_64:
; 	fact 1' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_66
	btr r14,0
	call inc_r
	jmp lb_67
lb_66:
	bts r14,0
lb_67:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_65
	bts r12,1
	call dec_r
lb_65:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fact
	mov rdi,rax
	jc lb_68
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_72
	btr r12,0
	call inc_r
	jmp lb_73
lb_72:
	bts r12,0
lb_73:
	pop rdi
	call dec_r
	jmp lb_69
lb_68:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_70
	btr r12,0
	call inc_r
	jmp lb_71
lb_70:
	bts r12,0
lb_71:
lb_69:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
fib:
; 	|» 0'
	jz _fib
	jc emt_etr_c_lb_74
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_412
	btr r12,0
	call inc_r
	jmp lb_413
lb_412:
	bts r12,0
lb_413:
	pop rdi
	call dec_r
jmp _fib
emt_etr_c_lb_74:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_410
	btr r12,0
	call inc_r
	jmp lb_411
lb_410:
	bts r12,0
lb_411:
_fib:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_75
	btr r12,1
	call inc_r
	jmp lb_76
lb_75:
	bts r12,1
lb_76:
	pop rbx
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_77
	btr r12,2
	call inc_r
	jmp lb_78
lb_77:
	bts r12,2
lb_78:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_79
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_79:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_80
	btr r12,3
	call inc_r
	jmp lb_81
lb_80:
	bts r12,3
lb_81:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_82
	bts r12,0
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
lb_82:
; 	cmp { 2' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 4' 5' }
; emt_ptn_set_ptn 2',4'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_88
	btr r12,4
	call inc_r
	jmp lb_89
lb_88:
	bts r12,4
lb_89:
	pop rbx
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_90
	btr r12,5
	call inc_r
	jmp lb_91
lb_90:
	bts r12,5
lb_91:
	pop rbx
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_86
	bts r12,3
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_86:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_87
	bts r12,2
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_87:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	mov r11,1
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	cmovg r10,r11
cmp_jb_lb_83:
	mov [st_vct+8*6],r9
	mov [st_vct+8*7],r10
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 0' -2' }
; emt_ptn_set_ptn 6',0'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 0'
	mov [st_vct+8*0],rbx
	jc lb_84
	btr r12,0
	call inc_r
	jmp lb_85
lb_84:
	bts r12,0
lb_85:
	pop rbx
; emt_ptn_set_ptn 7',-2'
	push rbx
	mov rbx,[st_vct+8*7]
	bt r12,7
; emt_set_ptn -2'
	pop rbx
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_93
	mov rdi,0
	stc
	jmp agl_92_1
lb_93:
	mov rdi,1
	stc
	jmp agl_92_0
; 	∐ -2'
agl_92_0:
	jc lb_94
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_95
lb_94:
; emt_set_ptn -2'
lb_95:
; 	$ 1' ⊢ ,0',2' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rbx
	jc lb_96
	btr r12,0
	call inc_r
	jmp lb_97
lb_96:
	bts r12,0
lb_97:
	pop rbx
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_98
	btr r12,2
	call inc_r
	jmp lb_99
lb_98:
	bts r12,2
lb_99:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_100
	bts r12,1
	push r8
	push r10
	call dec_r
	pop r10
	pop r8
lb_100:
; 	» 0xr1 |~ 1' : r64
	mov r9,0x1
	mov [st_vct+8*1],r9
	bts r12,1
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_101
	btr r12,3
	call inc_r
	jmp lb_102
lb_101:
	bts r12,3
lb_102:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_103
	bts r12,1
	push r8
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r8
lb_103:
; 	cmp { 2' 3' } ⊢ { 1' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 4' 5' }
; emt_ptn_set_ptn 2',4'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_109
	btr r12,4
	call inc_r
	jmp lb_110
lb_109:
	bts r12,4
lb_110:
	pop rbx
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_111
	btr r12,5
	call inc_r
	jmp lb_112
lb_111:
	bts r12,5
lb_112:
	pop rbx
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_107
	bts r12,3
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_107:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_108
	bts r12,2
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_108:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	mov r11,1
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	cmovg r10,r11
cmp_jb_lb_104:
	mov [st_vct+8*6],r9
	mov [st_vct+8*7],r10
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 1' -2' }
; emt_ptn_set_ptn 6',1'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_105
	btr r12,1
	call inc_r
	jmp lb_106
lb_105:
	bts r12,1
lb_106:
	pop rbx
; emt_ptn_set_ptn 7',-2'
	push rbx
	mov rbx,[st_vct+8*7]
	bt r12,7
; emt_set_ptn -2'
	pop rbx
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	cmp rax,0
	mov rdi,rax
	je lb_114
	mov rdi,0
	stc
	jmp agl_113_1
lb_114:
	mov rdi,1
	stc
	jmp agl_113_0
; 	∐ -2'
agl_113_0:
	jc lb_115
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_116
lb_115:
; emt_set_ptn -2'
lb_116:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_117
	btr r12,1
	call inc_r
	jmp lb_118
lb_117:
	bts r12,1
lb_118:
	pop rbx
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_119
	btr r12,2
	call inc_r
	jmp lb_120
lb_119:
	bts r12,2
lb_120:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_121
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_121:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_122
	btr r12,3
	call inc_r
	jmp lb_123
lb_122:
	bts r12,3
lb_123:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_124
	bts r12,0
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
lb_124:
; 	» 0xr2 |~ 0' : r64
	mov r9,0x2
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_125
	btr r12,4
	call inc_r
	jmp lb_126
lb_125:
	bts r12,4
lb_126:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_127
	bts r12,0
	push r9
	push r10
	push r11
	push rcx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_127:
; 	sub { 1' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_132
	btr r12,5
	call inc_r
	jmp lb_133
lb_132:
	bts r12,5
lb_133:
	pop rbx
; emt_ptn_set_ptn 3',6'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_134
	btr r12,6
	call inc_r
	jmp lb_135
lb_134:
	bts r12,6
lb_135:
	pop rbx
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_130
	bts r12,3
	push r8
	push r10
	push rcx
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_130:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_131
	bts r12,1
	push r8
	push r10
	push rcx
	call dec_r
	pop rcx
	pop r10
	pop r8
lb_131:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_128
	btr r12,0
	call inc_r
	jmp lb_129
lb_128:
	bts r12,0
lb_129:
; 	sub { 2' 4' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 4' },{ 3' 5' }
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_140
	btr r12,3
	call inc_r
	jmp lb_141
lb_140:
	bts r12,3
lb_141:
	pop rbx
; emt_ptn_set_ptn 4',5'
	push rbx
	mov rbx,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_142
	btr r12,5
	call inc_r
	jmp lb_143
lb_142:
	bts r12,5
lb_143:
	pop rbx
; ; emt_dec_ptn { 2' 4' }
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_138
	bts r12,4
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_138:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_139
	bts r12,2
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_139:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_136
	btr r12,1
	call inc_r
	jmp lb_137
lb_136:
	bts r12,1
lb_137:
; 	fib 0' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 0',0'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_145
	btr r14,0
	call inc_r
	jmp lb_146
lb_145:
	bts r14,0
lb_146:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_144
	bts r12,0
	push r9
	call dec_r
	pop r9
lb_144:
; push_s  1'~xt1
	mov [tmp],rbx
	mov rbx,[st_vct+8*1]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fib
	mov rdi,rax
	jc lb_147
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_151
	btr r12,0
	call inc_r
	jmp lb_152
lb_151:
	bts r12,0
lb_152:
	pop rdi
	call dec_r
	jmp lb_148
lb_147:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_149
	btr r12,0
	call inc_r
	jmp lb_150
lb_149:
	bts r12,0
lb_150:
lb_148:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*1],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	fib 1' ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_154
	btr r14,0
	call inc_r
	jmp lb_155
lb_154:
	bts r14,0
lb_155:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_153
	bts r12,1
	push r8
	call dec_r
	pop r8
lb_153:
; push_s  0'~y0
	mov [tmp],rbx
	mov rbx,[st_vct+8*0]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fib
	mov rdi,rax
	jc lb_156
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_160
	btr r12,1
	call inc_r
	jmp lb_161
lb_160:
	bts r12,1
lb_161:
	pop rdi
	call dec_r
	jmp lb_157
lb_156:
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_158
	btr r12,1
	call inc_r
	jmp lb_159
lb_158:
	bts r12,1
lb_159:
lb_157:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*0],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	add { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 3' 4' }
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_166
	btr r12,3
	call inc_r
	jmp lb_167
lb_166:
	bts r12,3
lb_167:
	pop rbx
; emt_ptn_set_ptn 1',4'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_168
	btr r12,4
	call inc_r
	jmp lb_169
lb_168:
	bts r12,4
lb_169:
	pop rbx
; ; emt_dec_ptn { 0' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_164
	bts r12,1
	push r10
	call dec_r
	pop r10
lb_164:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_165
	bts r12,0
	push r10
	call dec_r
	pop r10
lb_165:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
	add r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_162
	btr r12,2
	call inc_r
	jmp lb_163
lb_162:
	bts r12,2
lb_163:
; 	∎ 2'
;clear 
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	ret
; 	∐ -2'
agl_113_1:
	jc lb_170
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_171
lb_170:
; emt_set_ptn -2'
lb_171:
; 	» 0xr1 |~ 1' : r64
	mov r9,0x1
	mov [st_vct+8*1],r9
	bts r12,1
; 	$ 1' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 1',2'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_172
	btr r12,2
	call inc_r
	jmp lb_173
lb_172:
	bts r12,2
lb_173:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_174
	bts r12,1
	push r8
	push r10
	call dec_r
	pop r10
	pop r8
lb_174:
; 	∎ 2'
;clear  0'~x
	bt r12,0
	jc clear_lb_175
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_175:
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	ret
; 	∐ -2'
agl_92_1:
	jc lb_176
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_177
lb_176:
; emt_set_ptn -2'
lb_177:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_178
	btr r12,2
	call inc_r
	jmp lb_179
lb_178:
	bts r12,2
lb_179:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_180
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_180:
; 	∎ 2'
;clear  1'~x
	bt r12,1
	jc clear_lb_181
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_181:
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	ret
tak:
; 	|» { 0' 1' 2' }
	jz _tak
	jc emt_etr_c_lb_182
	push rdi
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov rax,[rdi]
	bt rax,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_404
	btr r12,0
	call inc_r
	jmp lb_405
lb_404:
	bts r12,0
lb_405:
	pop rdi
	push rdi
	mov rax,[rdi]
	bt rax,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_406
	btr r12,1
	call inc_r
	jmp lb_407
lb_406:
	bts r12,1
lb_407:
	pop rdi
	push rdi
	mov rax,[rdi]
	bt rax,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_408
	btr r12,2
	call inc_r
	jmp lb_409
lb_408:
	bts r12,2
lb_409:
	pop rdi
	pop rdi
	call dec_r
jmp _tak
emt_etr_c_lb_182:
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov rax,[rdi]
	bt rax,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_398
	btr r12,0
	call inc_r
	jmp lb_399
lb_398:
	bts r12,0
lb_399:
	pop rdi
	push rdi
	mov rax,[rdi]
	bt rax,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_400
	btr r12,1
	call inc_r
	jmp lb_401
lb_400:
	bts r12,1
lb_401:
	pop rdi
	push rdi
	mov rax,[rdi]
	bt rax,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_402
	btr r12,2
	call inc_r
	jmp lb_403
lb_402:
	bts r12,2
lb_403:
	pop rdi
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_183
	btr r12,3
	call inc_r
	jmp lb_184
lb_183:
	bts r12,3
lb_184:
	pop rbx
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_185
	btr r12,4
	call inc_r
	jmp lb_186
lb_185:
	bts r12,4
lb_186:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_187
	bts r12,0
	push r9
	push r10
	push r11
	push rcx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
lb_187:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rbx
	jc lb_188
	btr r12,0
	call inc_r
	jmp lb_189
lb_188:
	bts r12,0
lb_189:
	pop rbx
; emt_ptn_set_ptn 1',5'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_190
	btr r12,5
	call inc_r
	jmp lb_191
lb_190:
	bts r12,5
lb_191:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_192
	bts r12,1
	push r8
	push r10
	push r11
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_192:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	push rbx
	mov rbx,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_198
	btr r12,6
	call inc_r
	jmp lb_199
lb_198:
	bts r12,6
lb_199:
	pop rbx
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rbx
	jc lb_200
	btr r12,7
	call inc_r
	jmp lb_201
lb_200:
	bts r12,7
lb_201:
	pop rbx
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_196
	bts r12,5
	push r8
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_196:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_197
	bts r12,4
	push r8
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_197:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	mov r11,1
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	cmovg r10,r11
cmp_jb_lb_193:
	mov [st_vct+8*8],r9
	mov [st_vct+8*9],r10
	or r12,0b100000000
	or r12,0b1000000000
; emt_ptn_set_ptn { 8' 9' },{ -2' 1' }
; emt_ptn_set_ptn 8',-2'
	push rbx
	mov rbx,[st_vct+8*8]
	bt r12,8
; emt_set_ptn -2'
	pop rbx
; emt_ptn_set_ptn 9',1'
	push rbx
	mov rbx,[st_vct+8*9]
	bt r12,9
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_194
	btr r12,1
	call inc_r
	jmp lb_195
lb_194:
	bts r12,1
lb_195:
	pop rbx
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	cmp rax,0
	mov rdi,rax
	je lb_203
	mov rdi,0
	stc
	jmp agl_202_1
lb_203:
	mov rdi,1
	stc
	jmp agl_202_0
; 	∐ -2'
agl_202_0:
	jc lb_204
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_205
lb_204:
; emt_set_ptn -2'
lb_205:
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_206
	push r8
	mov rdi,[st_vct+8*3]
	call dec_r
	pop r8
clear_lb_206:
	bt r12,0
	jc clear_lb_207
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_207:
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	ret
; 	∐ -2'
agl_202_1:
	jc lb_208
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_209
lb_208:
; emt_set_ptn -2'
lb_209:
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_210
	btr r12,1
	call inc_r
	jmp lb_211
lb_210:
	bts r12,1
lb_211:
	pop rbx
; emt_ptn_set_ptn 3',4'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_212
	btr r12,4
	call inc_r
	jmp lb_213
lb_212:
	bts r12,4
lb_213:
	pop rbx
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_214
	bts r12,3
	push r8
	push r9
	push r10
	push rcx
	call dec_r
	pop rcx
	pop r10
	pop r9
	pop r8
lb_214:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	bts r12,3
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_215
	btr r12,5
	call inc_r
	jmp lb_216
lb_215:
	bts r12,5
lb_216:
	pop rbx
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_217
	bts r12,3
	push r8
	push r9
	push r10
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r10
	pop r9
	pop r8
lb_217:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	push rbx
	mov rbx,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_222
	btr r12,6
	call inc_r
	jmp lb_223
lb_222:
	bts r12,6
lb_223:
	pop rbx
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rbx
	jc lb_224
	btr r12,7
	call inc_r
	jmp lb_225
lb_224:
	bts r12,7
lb_225:
	pop rbx
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_220
	bts r12,5
	push r8
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_220:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_221
	bts r12,4
	push r8
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
	pop r8
lb_221:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_218
	btr r12,3
	call inc_r
	jmp lb_219
lb_218:
	bts r12,3
lb_219:
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_226
	btr r12,4
	call inc_r
	jmp lb_227
lb_226:
	bts r12,4
lb_227:
	pop rbx
; emt_ptn_set_ptn 2',5'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_228
	btr r12,5
	call inc_r
	jmp lb_229
lb_228:
	bts r12,5
lb_229:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_230
	bts r12,2
	push r8
	push r9
	push r11
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_230:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_231
	btr r12,2
	call inc_r
	jmp lb_232
lb_231:
	bts r12,2
lb_232:
	pop rbx
; emt_ptn_set_ptn 0',6'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_233
	btr r12,6
	call inc_r
	jmp lb_234
lb_233:
	bts r12,6
lb_234:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_235
	bts r12,0
	push r9
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r9
lb_235:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_239
	btr r14,0
	call inc_r
	jmp lb_240
lb_239:
	bts r14,0
lb_240:
	pop rbx
; emt_ptn_set_ptn 6',1'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_241
	btr r14,1
	call inc_r
	jmp lb_242
lb_241:
	bts r14,1
lb_242:
	pop rbx
; emt_ptn_set_ptn 5',2'
	push rbx
	mov rbx,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_243
	btr r14,2
	call inc_r
	jmp lb_244
lb_243:
	bts r14,2
lb_244:
	pop rbx
; ; emt_dec_ptn { 3' 6' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_236
	bts r12,5
	push r9
	push r10
	push rcx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_236:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_237
	bts r12,6
	push r9
	push r10
	push rcx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_237:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_238
	bts r12,3
	push r9
	push r10
	push rcx
	call dec_r
	pop rcx
	pop r10
	pop r9
lb_238:
; push_s  2'~y 4'~z 1'~x
	mov [tmp],rbx
	mov rbx,[st_vct+8*2]
	push rbx
	mov rbx,[st_vct+8*4]
	push rbx
	mov rbx,[st_vct+8*1]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*2]
	mov [st_vct+8*2],rax
	mov rax,[st_vct_tmp+8*1]
	mov [st_vct+8*1],rax
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _tak
	mov rdi,rax
	jc lb_245
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_249
	btr r12,0
	call inc_r
	jmp lb_250
lb_249:
	bts r12,0
lb_250:
	pop rdi
	call dec_r
	jmp lb_246
lb_245:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_247
	btr r12,0
	call inc_r
	jmp lb_248
lb_247:
	bts r12,0
lb_248:
lb_246:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*1],rbx
	pop rbx
	mov [st_vct+8*4],rbx
	pop rbx
	mov [st_vct+8*2],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_251
	btr r12,3
	call inc_r
	jmp lb_252
lb_251:
	bts r12,3
lb_252:
	pop rbx
; emt_ptn_set_ptn 2',5'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_253
	btr r12,5
	call inc_r
	jmp lb_254
lb_253:
	bts r12,5
lb_254:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_255
	bts r12,2
	push r8
	push r9
	push r11
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_255:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_256
	btr r12,6
	call inc_r
	jmp lb_257
lb_256:
	bts r12,6
lb_257:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_258
	bts r12,2
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_258:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rbx
	jc lb_263
	btr r12,7
	call inc_r
	jmp lb_264
lb_263:
	bts r12,7
lb_264:
	pop rbx
; emt_ptn_set_ptn 6',8'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rbx
	jc lb_265
	btr r12,8
	call inc_r
	jmp lb_266
lb_265:
	bts r12,8
lb_266:
	pop rbx
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_261
	bts r12,6
	push r8
	push r9
	push r10
	push r11
	push rcx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_261:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_262
	bts r12,5
	push r8
	push r9
	push r10
	push r11
	push rcx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_262:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_259
	btr r12,2
	call inc_r
	jmp lb_260
lb_259:
	bts r12,2
lb_260:
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	push rbx
	mov rbx,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_267
	btr r12,5
	call inc_r
	jmp lb_268
lb_267:
	bts r12,5
lb_268:
	pop rbx
; emt_ptn_set_ptn 4',6'
	push rbx
	mov rbx,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_269
	btr r12,6
	call inc_r
	jmp lb_270
lb_269:
	bts r12,6
lb_270:
	pop rbx
; ; emt_dec_ptn 4'
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_271
	bts r12,4
	push r8
	push r9
	push r10
	push r11
	push rdx
	push rsi
	call dec_r
	pop rsi
	pop rdx
	pop r11
	pop r10
	pop r9
	pop r8
lb_271:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_272
	btr r12,4
	call inc_r
	jmp lb_273
lb_272:
	bts r12,4
lb_273:
	pop rbx
; emt_ptn_set_ptn 1',7'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 7'
	mov [st_vct+8*7],rbx
	jc lb_274
	btr r12,7
	call inc_r
	jmp lb_275
lb_274:
	bts r12,7
lb_275:
	pop rbx
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_276
	bts r12,1
	push r8
	push r10
	push r11
	push rcx
	push rdx
	push rsi
	push rdi
	call dec_r
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r10
	pop r8
lb_276:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_280
	btr r14,0
	call inc_r
	jmp lb_281
lb_280:
	bts r14,0
lb_281:
	pop rbx
; emt_ptn_set_ptn 6',1'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_282
	btr r14,1
	call inc_r
	jmp lb_283
lb_282:
	bts r14,1
lb_283:
	pop rbx
; emt_ptn_set_ptn 7',2'
	push rbx
	mov rbx,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_284
	btr r14,2
	call inc_r
	jmp lb_285
lb_284:
	bts r14,2
lb_285:
	pop rbx
; ; emt_dec_ptn { 2' 6' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_277
	bts r12,7
	push r8
	push r11
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_277:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_278
	bts r12,6
	push r8
	push r11
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_278:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_279
	bts r12,2
	push r8
	push r11
	push rcx
	push rdx
	call dec_r
	pop rdx
	pop rcx
	pop r11
	pop r8
lb_279:
; push_s  3'~y 4'~x 5'~z 0'~r0
	mov [tmp],rbx
	mov rbx,[st_vct+8*3]
	push rbx
	mov rbx,[st_vct+8*4]
	push rbx
	mov rbx,[st_vct+8*5]
	push rbx
	mov rbx,[st_vct+8*0]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*2]
	mov [st_vct+8*2],rax
	mov rax,[st_vct_tmp+8*1]
	mov [st_vct+8*1],rax
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _tak
	mov rdi,rax
	jc lb_286
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_290
	btr r12,1
	call inc_r
	jmp lb_291
lb_290:
	bts r12,1
lb_291:
	pop rdi
	call dec_r
	jmp lb_287
lb_286:
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_288
	btr r12,1
	call inc_r
	jmp lb_289
lb_288:
	bts r12,1
lb_289:
lb_287:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*0],rbx
	pop rbx
	mov [st_vct+8*5],rbx
	pop rbx
	mov [st_vct+8*4],rbx
	pop rbx
	mov [st_vct+8*3],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rbx
	jc lb_292
	btr r12,6
	call inc_r
	jmp lb_293
lb_292:
	bts r12,6
lb_293:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_294
	bts r12,2
	push r8
	push r9
	push r11
	push rcx
	push rdx
	push rsi
	call dec_r
	pop rsi
	pop rdx
	pop rcx
	pop r11
	pop r9
	pop r8
lb_294:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	push rbx
	mov rbx,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rbx
	jc lb_299
	btr r12,7
	call inc_r
	jmp lb_300
lb_299:
	bts r12,7
lb_300:
	pop rbx
; emt_ptn_set_ptn 6',8'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rbx
	jc lb_301
	btr r12,8
	call inc_r
	jmp lb_302
lb_301:
	bts r12,8
lb_302:
	pop rbx
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_297
	bts r12,6
	push r8
	push r9
	push r10
	push r11
	push rcx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_297:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_298
	bts r12,5
	push r8
	push r9
	push r10
	push r11
	push rcx
	call dec_r
	pop rcx
	pop r11
	pop r10
	pop r9
	pop r8
lb_298:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_295
	btr r12,2
	call inc_r
	jmp lb_296
lb_295:
	bts r12,2
lb_296:
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov r14,0

not r14
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_306
	btr r14,0
	call inc_r
	jmp lb_307
lb_306:
	bts r14,0
lb_307:
	pop rbx
; emt_ptn_set_ptn 4',1'
	push rbx
	mov rbx,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_308
	btr r14,1
	call inc_r
	jmp lb_309
lb_308:
	bts r14,1
lb_309:
	pop rbx
; emt_ptn_set_ptn 3',2'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_310
	btr r14,2
	call inc_r
	jmp lb_311
lb_310:
	bts r14,2
lb_311:
	pop rbx
; ; emt_dec_ptn { 2' 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_303
	bts r12,3
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_303:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_304
	bts r12,4
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_304:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_305
	bts r12,2
	push r8
	push r9
	call dec_r
	pop r9
	pop r8
lb_305:
; push_s  0'~r0 1'~r1
	mov [tmp],rbx
	mov rbx,[st_vct+8*0]
	push rbx
	mov rbx,[st_vct+8*1]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*2]
	mov [st_vct+8*2],rax
	mov rax,[st_vct_tmp+8*1]
	mov [st_vct+8*1],rax
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _tak
	mov rdi,rax
	jc lb_312
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_316
	btr r12,2
	call inc_r
	jmp lb_317
lb_316:
	bts r12,2
lb_317:
	pop rdi
	call dec_r
	jmp lb_313
lb_312:
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_314
	btr r12,2
	call inc_r
	jmp lb_315
lb_314:
	bts r12,2
lb_315:
lb_313:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*1],rbx
	pop rbx
	mov [st_vct+8*0],rbx
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
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_321
	btr r14,0
	call inc_r
	jmp lb_322
lb_321:
	bts r14,0
lb_322:
	pop rbx
; emt_ptn_set_ptn 1',1'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rbx
	jc lb_323
	btr r14,1
	call inc_r
	jmp lb_324
lb_323:
	bts r14,1
lb_324:
	pop rbx
; emt_ptn_set_ptn 2',2'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rbx
	jc lb_325
	btr r14,2
	call inc_r
	jmp lb_326
lb_325:
	bts r14,2
lb_326:
	pop rbx
; ; emt_dec_ptn { 0' 1' 2' }
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_318
	bts r12,2
	call dec_r
lb_318:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_319
	bts r12,1
	call dec_r
lb_319:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_320
	bts r12,0
	call dec_r
lb_320:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*2]
	mov [st_vct+8*2],rax
	mov rax,[st_vct_tmp+8*1]
	mov [st_vct+8*1],rax
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _tak
	mov rdi,rax
	jc lb_327
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_331
	btr r12,0
	call inc_r
	jmp lb_332
lb_331:
	bts r12,0
lb_332:
	pop rdi
	call dec_r
	jmp lb_328
lb_327:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_329
	btr r12,0
	call inc_r
	jmp lb_330
lb_329:
	bts r12,0
lb_330:
lb_328:
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
fact:
; 	|» 0'
	jz _fact
	jc emt_etr_c_lb_333
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_396
	btr r12,0
	call inc_r
	jmp lb_397
lb_396:
	bts r12,0
lb_397:
	pop rdi
	call dec_r
jmp _fact
emt_etr_c_lb_333:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_394
	btr r12,0
	call inc_r
	jmp lb_395
lb_394:
	bts r12,0
lb_395:
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_334
	btr r12,1
	call inc_r
	jmp lb_335
lb_334:
	bts r12,1
lb_335:
	pop rbx
; emt_ptn_set_ptn 0',2'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_336
	btr r12,2
	call inc_r
	jmp lb_337
lb_336:
	bts r12,2
lb_337:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_338
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_338:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_339
	btr r12,3
	call inc_r
	jmp lb_340
lb_339:
	bts r12,3
lb_340:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_341
	bts r12,0
	push r9
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
	pop r9
lb_341:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 4' 5' }
; emt_ptn_set_ptn 1',4'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_347
	btr r12,4
	call inc_r
	jmp lb_348
lb_347:
	bts r12,4
lb_348:
	pop rbx
; emt_ptn_set_ptn 3',5'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_349
	btr r12,5
	call inc_r
	jmp lb_350
lb_349:
	bts r12,5
lb_350:
	pop rbx
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_345
	bts r12,3
	push r8
	push r10
	call dec_r
	pop r10
	pop r8
lb_345:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_346
	bts r12,1
	push r8
	push r10
	call dec_r
	pop r10
	pop r8
lb_346:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	mov r11,1
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	cmovg r10,r11
cmp_jb_lb_342:
	mov [st_vct+8*6],r9
	mov [st_vct+8*7],r10
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 0' -2' }
; emt_ptn_set_ptn 6',0'
	push rbx
	mov rbx,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 0'
	mov [st_vct+8*0],rbx
	jc lb_343
	btr r12,0
	call inc_r
	jmp lb_344
lb_343:
	bts r12,0
lb_344:
	pop rbx
; emt_ptn_set_ptn 7',-2'
	push rbx
	mov rbx,[st_vct+8*7]
	bt r12,7
; emt_set_ptn -2'
	pop rbx
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_352
	mov rdi,0
	stc
	jmp agl_351_1
lb_352:
	mov rdi,1
	stc
	jmp agl_351_0
; 	∐ -2'
agl_351_0:
	jc lb_353
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_354
lb_353:
; emt_set_ptn -2'
lb_354:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_355
	btr r12,1
	call inc_r
	jmp lb_356
lb_355:
	bts r12,1
lb_356:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_357
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_357:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct+8*0],rbx
	jc lb_358
	btr r12,0
	call inc_r
	jmp lb_359
lb_358:
	bts r12,0
lb_359:
	pop rbx
; emt_ptn_set_ptn 2',3'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rbx
	jc lb_360
	btr r12,3
	call inc_r
	jmp lb_361
lb_360:
	bts r12,3
lb_361:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_362
	bts r12,2
	push r8
	push r9
	push r11
	call dec_r
	pop r11
	pop r9
	pop r8
lb_362:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_367
	btr r12,4
	call inc_r
	jmp lb_368
lb_367:
	bts r12,4
lb_368:
	pop rbx
; emt_ptn_set_ptn 1',5'
	push rbx
	mov rbx,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rbx
	jc lb_369
	btr r12,5
	call inc_r
	jmp lb_370
lb_369:
	bts r12,5
lb_370:
	pop rbx
; ; emt_dec_ptn { 0' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_365
	bts r12,1
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
lb_365:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_366
	bts r12,0
	push r10
	push r11
	call dec_r
	pop r11
	pop r10
lb_366:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_363
	btr r12,2
	call inc_r
	jmp lb_364
lb_363:
	bts r12,2
lb_364:
; 	fact 2' ⊢ 0' : r64

mov r14,0

not r14
; emt_ptn_set_ptn 2',0'
	push rbx
	mov rbx,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rbx
	jc lb_372
	btr r14,0
	call inc_r
	jmp lb_373
lb_372:
	bts r14,0
lb_373:
	pop rbx
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_371
	bts r12,2
	push r11
	call dec_r
	pop r11
lb_371:
; push_s  3'~x2
	mov [tmp],rbx
	mov rbx,[st_vct+8*3]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rax,[st_vct_tmp+8*0]
	mov [st_vct+8*0],rax
	mov r12,r14
	call _fact
	mov rdi,rax
	jc lb_374
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_378
	btr r12,0
	call inc_r
	jmp lb_379
lb_378:
	bts r12,0
lb_379:
	pop rdi
	call dec_r
	jmp lb_375
lb_374:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_376
	btr r12,0
	call inc_r
	jmp lb_377
lb_376:
	bts r12,0
lb_377:
lb_375:
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*3],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
	push rbx
	mov rbx,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct+8*2],rbx
	jc lb_384
	btr r12,2
	call inc_r
	jmp lb_385
lb_384:
	bts r12,2
lb_385:
	pop rbx
; emt_ptn_set_ptn 0',4'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rbx
	jc lb_386
	btr r12,4
	call inc_r
	jmp lb_387
lb_386:
	bts r12,4
lb_387:
	pop rbx
; ; emt_dec_ptn { 3' 0' }
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_382
	bts r12,0
	push r9
	call dec_r
	pop r9
lb_382:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_383
	bts r12,3
	push r9
	call dec_r
	pop r9
lb_383:
	mov r9,[st_vct+8*2]
	mov r10,[st_vct+8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_380
	btr r12,1
	call inc_r
	jmp lb_381
lb_380:
	bts r12,1
lb_381:
; 	∎ 1'
;clear 
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
; 	∐ -2'
agl_351_1:
	jc lb_388
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_389
lb_388:
; emt_set_ptn -2'
lb_389:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	push rbx
	mov rbx,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rbx
	jc lb_390
	btr r12,1
	call inc_r
	jmp lb_391
lb_390:
	bts r12,1
lb_391:
	pop rbx
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_392
	bts r12,0
	push r9
	push r10
	call dec_r
	pop r10
	pop r9
lb_392:
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_393
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_393:
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
