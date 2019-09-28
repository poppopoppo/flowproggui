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
	call test4
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
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_1
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_2
lb_1:
	bts r12,1
lb_2:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_3
	bts r12,0
	call dec_r
lb_3:
; 	» 0xra |~ 0' : r64
	mov r9,0xa
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_4
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_5
lb_4:
	bts r12,2
lb_5:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_6
	bts r12,0
	call dec_r
lb_6:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_7
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_8
lb_7:
	bts r12,3
lb_8:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_9
	bts r12,0
	call dec_r
lb_9:
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_13
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_14
lb_13:
	bts rbx,0
lb_14:
; emt_ptn_set_ptn 2',1'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_15
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_16
lb_15:
	bts rbx,1
lb_16:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_17
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_18
lb_17:
	bts rbx,2
lb_18:
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
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _tak
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rdi,rax
	jc lb_19
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_23
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_24
lb_23:
	bts r12,0
lb_24:
	pop rdi
	call dec_r
	jmp lb_20
lb_19:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_21
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_22
lb_21:
	bts r12,0
lb_22:
	pop rdi
lb_20:
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_25
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp _test4
emt_etr_c_lb_25:
; emt_set_ptn {  }
_test4:
; 	» 0xr5 |~ 0' : r64
	mov r9,0x5
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_26
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_27
lb_26:
	bts r12,1
lb_27:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_28
	bts r12,0
	call dec_r
lb_28:
; 	fact 1' ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_30
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_31
lb_30:
	bts rbx,0
lb_31:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_29
	bts r12,1
	call dec_r
lb_29:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _fact
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rdi,rax
	jc lb_32
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_36
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_37
lb_36:
	bts r12,0
lb_37:
	pop rdi
	call dec_r
	jmp lb_33
lb_32:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_34
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_35
lb_34:
	bts r12,0
lb_35:
	pop rdi
lb_33:
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
tak:
; 	|» { 0' 1' 2' }
	jz _tak
	jc emt_etr_c_lb_38
	push rdi
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_260
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_261
lb_260:
	bts r12,0
lb_261:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_262
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_263
lb_262:
	bts r12,1
lb_263:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_264
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_265
lb_264:
	bts r12,2
lb_265:
	pop rdi
	pop rdi
	call dec_r
jmp _tak
emt_etr_c_lb_38:
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_254
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_255
lb_254:
	bts r12,0
lb_255:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_256
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_257
lb_256:
	bts r12,1
lb_257:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_258
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_259
lb_258:
	bts r12,2
lb_259:
	pop rdi
_tak:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_39
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_40
lb_39:
	bts r12,3
lb_40:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_41
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_42
lb_41:
	bts r12,4
lb_42:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_43
	bts r12,0
	call dec_r
lb_43:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_44
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_45
lb_44:
	bts r12,0
lb_45:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_46
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_47
lb_46:
	bts r12,5
lb_47:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_48
	bts r12,1
	call dec_r
lb_48:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_54
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_55
lb_54:
	bts r12,6
lb_55:
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_56
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_57
lb_56:
	bts r12,7
lb_57:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_52
	bts r12,5
	call dec_r
lb_52:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_53
	bts r12,4
	call dec_r
lb_53:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	mov r11,1
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	cmovg r10,r11
cmp_jb_lb_49:
	mov [st_vct+8*8],r9
	mov [st_vct+8*9],r10
	or r12,0b100000000
	or r12,0b1000000000
; emt_ptn_set_ptn { 8' 9' },{ -2' 1' }
; emt_ptn_set_ptn 8',-2'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn -2'
; emt_ptn_set_ptn 9',1'
	mov rdi,[st_vct+8*9]
	bt r12,9
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_50
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_51
lb_50:
	bts r12,1
lb_51:
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	cmp rax,0
	mov rdi,rax
	je lb_59
	mov rdi,0
	stc
	jmp agl_58_1
lb_59:
	mov rdi,1
	stc
	jmp agl_58_0
; 	∐ -2'
agl_58_0:
	jc lb_60
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_61
lb_60:
; emt_set_ptn -2'
lb_61:
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_62
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_62:
	bt r12,0
	jc clear_lb_63
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_63:
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	ret
; 	∐ -2'
agl_58_1:
	jc lb_64
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_65
lb_64:
; emt_set_ptn -2'
lb_65:
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_66
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_67
lb_66:
	bts r12,1
lb_67:
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_68
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_69
lb_68:
	bts r12,4
lb_69:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_70
	bts r12,3
	call dec_r
lb_70:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	bts r12,3
; 	$ 3' ⊢ ,5' : ,r64
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_71
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_72
lb_71:
	bts r12,5
lb_72:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_73
	bts r12,3
	call dec_r
lb_73:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_78
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_79
lb_78:
	bts r12,6
lb_79:
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_80
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_81
lb_80:
	bts r12,7
lb_81:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_76
	bts r12,5
	call dec_r
lb_76:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_77
	bts r12,4
	call dec_r
lb_77:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_74
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_75
lb_74:
	bts r12,3
lb_75:
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_82
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_83
lb_82:
	bts r12,4
lb_83:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_84
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_85
lb_84:
	bts r12,5
lb_85:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_86
	bts r12,2
	call dec_r
lb_86:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_87
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_88
lb_87:
	bts r12,2
lb_88:
; emt_ptn_set_ptn 0',6'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_89
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_90
lb_89:
	bts r12,6
lb_90:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_91
	bts r12,0
	call dec_r
lb_91:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_95
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_96
lb_95:
	bts rbx,0
lb_96:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_97
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_98
lb_97:
	bts rbx,1
lb_98:
; emt_ptn_set_ptn 5',2'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_99
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_100
lb_99:
	bts rbx,2
lb_100:
; ; emt_dec_ptn { 3' 6' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_92
	bts r12,5
	call dec_r
lb_92:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_93
	bts r12,6
	call dec_r
lb_93:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_94
	bts r12,3
	call dec_r
lb_94:
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
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _tak
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
	mov rdi,rax
	jc lb_101
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_105
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_106
lb_105:
	bts r12,0
lb_106:
	pop rdi
	call dec_r
	jmp lb_102
lb_101:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_103
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_104
lb_103:
	bts r12,0
lb_104:
	pop rdi
lb_102:
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_107
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_108
lb_107:
	bts r12,3
lb_108:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_109
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_110
lb_109:
	bts r12,5
lb_110:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_111
	bts r12,2
	call dec_r
lb_111:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_112
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_113
lb_112:
	bts r12,6
lb_113:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_114
	bts r12,2
	call dec_r
lb_114:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_119
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_120
lb_119:
	bts r12,7
lb_120:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_121
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_122
lb_121:
	bts r12,8
lb_122:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_117
	bts r12,6
	call dec_r
lb_117:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_118
	bts r12,5
	call dec_r
lb_118:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_115
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_116
lb_115:
	bts r12,2
lb_116:
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_123
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_124
lb_123:
	bts r12,5
lb_124:
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_125
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_126
lb_125:
	bts r12,6
lb_126:
; ; emt_dec_ptn 4'
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_127
	bts r12,4
	call dec_r
lb_127:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_128
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_129
lb_128:
	bts r12,4
lb_129:
; emt_ptn_set_ptn 1',7'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_130
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_131
lb_130:
	bts r12,7
lb_131:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_132
	bts r12,1
	call dec_r
lb_132:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_136
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_137
lb_136:
	bts rbx,0
lb_137:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_138
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_139
lb_138:
	bts rbx,1
lb_139:
; emt_ptn_set_ptn 7',2'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_140
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_141
lb_140:
	bts rbx,2
lb_141:
; ; emt_dec_ptn { 2' 6' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_133
	bts r12,7
	call dec_r
lb_133:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_134
	bts r12,6
	call dec_r
lb_134:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_135
	bts r12,2
	call dec_r
lb_135:
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
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _tak
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
	mov rdi,rax
	jc lb_142
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_146
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_147
lb_146:
	bts r12,1
lb_147:
	pop rdi
	call dec_r
	jmp lb_143
lb_142:
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_144
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_145
lb_144:
	bts r12,1
lb_145:
	pop rdi
lb_143:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	bts r12,2
; 	$ 2' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 2',6'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_148
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_149
lb_148:
	bts r12,6
lb_149:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_150
	bts r12,2
	call dec_r
lb_150:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_155
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_156
lb_155:
	bts r12,7
lb_156:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_157
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_158
lb_157:
	bts r12,8
lb_158:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_153
	bts r12,6
	call dec_r
lb_153:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_154
	bts r12,5
	call dec_r
lb_154:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_151
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_152
lb_151:
	bts r12,2
lb_152:
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_162
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_163
lb_162:
	bts rbx,0
lb_163:
; emt_ptn_set_ptn 4',1'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_164
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_165
lb_164:
	bts rbx,1
lb_165:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_166
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_167
lb_166:
	bts rbx,2
lb_167:
; ; emt_dec_ptn { 2' 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_159
	bts r12,3
	call dec_r
lb_159:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_160
	bts r12,4
	call dec_r
lb_160:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_161
	bts r12,2
	call dec_r
lb_161:
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
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _tak
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
	mov rdi,rax
	jc lb_168
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_172
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_173
lb_172:
	bts r12,2
lb_173:
	pop rdi
	call dec_r
	jmp lb_169
lb_168:
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_170
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_171
lb_170:
	bts r12,2
lb_171:
	pop rdi
lb_169:
; 	tak { 0' 1' 2' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_177
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_178
lb_177:
	bts rbx,0
lb_178:
; emt_ptn_set_ptn 1',1'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_179
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_180
lb_179:
	bts rbx,1
lb_180:
; emt_ptn_set_ptn 2',2'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_181
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_182
lb_181:
	bts rbx,2
lb_182:
; ; emt_dec_ptn { 0' 1' 2' }
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_174
	bts r12,2
	call dec_r
lb_174:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_175
	bts r12,1
	call dec_r
lb_175:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_176
	bts r12,0
	call dec_r
lb_176:
; push_s 
	mov [tmp],rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _tak
; pop_s
	pop r12
	mov [tmp],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rdi,rax
	jc lb_183
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_187
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_188
lb_187:
	bts r12,0
lb_188:
	pop rdi
	call dec_r
	jmp lb_184
lb_183:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_185
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_186
lb_185:
	bts r12,0
lb_186:
	pop rdi
lb_184:
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
fact:
; 	|» 0'
	jz _fact
	jc emt_etr_c_lb_189
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_252
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_253
lb_252:
	bts r12,0
lb_253:
	pop rdi
	call dec_r
jmp _fact
emt_etr_c_lb_189:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_250
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_251
lb_250:
	bts r12,0
lb_251:
_fact:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_190
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_191
lb_190:
	bts r12,1
lb_191:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_192
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_193
lb_192:
	bts r12,2
lb_193:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_194
	bts r12,0
	call dec_r
lb_194:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_195
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_196
lb_195:
	bts r12,3
lb_196:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_197
	bts r12,0
	call dec_r
lb_197:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 4' 5' }
; emt_ptn_set_ptn 1',4'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_203
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_204
lb_203:
	bts r12,4
lb_204:
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_205
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_206
lb_205:
	bts r12,5
lb_206:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_201
	bts r12,3
	call dec_r
lb_201:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_202
	bts r12,1
	call dec_r
lb_202:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	mov r11,1
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	cmovg r10,r11
cmp_jb_lb_198:
	mov [st_vct+8*6],r9
	mov [st_vct+8*7],r10
	or r12,0b1000000
	or r12,0b10000000
; emt_ptn_set_ptn { 6' 7' },{ 0' -2' }
; emt_ptn_set_ptn 6',0'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_199
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_200
lb_199:
	bts r12,0
lb_200:
; emt_ptn_set_ptn 7',-2'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn -2'
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_208
	mov rdi,0
	stc
	jmp agl_207_1
lb_208:
	mov rdi,1
	stc
	jmp agl_207_0
; 	∐ -2'
agl_207_0:
	jc lb_209
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_210
lb_209:
; emt_set_ptn -2'
lb_210:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_211
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_212
lb_211:
	bts r12,1
lb_212:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_213
	bts r12,0
	call dec_r
lb_213:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_214
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_215
lb_214:
	bts r12,0
lb_215:
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_216
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_217
lb_216:
	bts r12,3
lb_217:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_218
	bts r12,2
	call dec_r
lb_218:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_223
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_224
lb_223:
	bts r12,4
lb_224:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_225
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_226
lb_225:
	bts r12,5
lb_226:
; ; emt_dec_ptn { 0' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_221
	bts r12,1
	call dec_r
lb_221:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_222
	bts r12,0
	call dec_r
lb_222:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_219
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_220
lb_219:
	bts r12,2
lb_220:
; 	fact 2' ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_228
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_229
lb_228:
	bts rbx,0
lb_229:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_227
	bts r12,2
	call dec_r
lb_227:
; push_s  3'~x2
	mov [tmp],rbx
	mov rbx,[st_vct+8*3]
	push rbx
	push r12
	rcl rbx,1
	add r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	call _fact
; pop_s
	pop r12
	mov [tmp],rbx
	pop rbx
	mov [st_vct+8*3],rbx
	rcl rbx,1
	sub r15,1
	rcr rbx,1
	mov rbx,[tmp]
	mov rdi,rax
	jc lb_230
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_234
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_235
lb_234:
	bts r12,0
lb_235:
	pop rdi
	call dec_r
	jmp lb_231
lb_230:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_232
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_233
lb_232:
	bts r12,0
lb_233:
	pop rdi
lb_231:
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_240
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_241
lb_240:
	bts r12,2
lb_241:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_242
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_243
lb_242:
	bts r12,4
lb_243:
; ; emt_dec_ptn { 3' 0' }
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_238
	bts r12,0
	call dec_r
lb_238:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_239
	bts r12,3
	call dec_r
lb_239:
	mov r9,[st_vct+8*2]
	mov r10,[st_vct+8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_236
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_237
lb_236:
	bts r12,1
lb_237:
; 	∎ 1'
;clear 
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
; 	∐ -2'
agl_207_1:
	jc lb_244
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_245
lb_244:
; emt_set_ptn -2'
lb_245:
; 	» 0xr1 |~ 0' : r64
	mov r9,0x1
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_246
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_247
lb_246:
	bts r12,1
lb_247:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_248
	bts r12,0
	call dec_r
lb_248:
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_249
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_249:
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
