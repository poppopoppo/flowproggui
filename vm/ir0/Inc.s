%include "mem.s"
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
	jz emt_etr_start_lb_1
	jc emt_etr_c_lb_0
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_1
emt_etr_c_lb_0:
; emt_set_ptn {  }
emt_etr_start_lb_1:
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
	jc lb_2
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_3
lb_2:
	bts r12,1
lb_3:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_4
	bts r12,0
	call dec_r
lb_4:
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
	jc lb_5
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_6
lb_5:
	bts r12,2
lb_6:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_7
	bts r12,0
	call dec_r
lb_7:
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
	jc lb_8
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_9
lb_8:
	bts r12,3
lb_9:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_10
	bts r12,0
	call dec_r
lb_10:
; 	tak { 1' 2' 3' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 1' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_14
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_15
lb_14:
	bts rbx,0
lb_15:
; emt_ptn_set_ptn 2',1'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_16
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_17
lb_16:
	bts rbx,1
lb_17:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_18
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_19
lb_18:
	bts rbx,2
lb_19:
; ; emt_dec_ptn { 1' 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_11
	bts r12,3
	call dec_r
lb_11:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_12
	bts r12,2
	call dec_r
lb_12:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_13
	bts r12,1
	call dec_r
lb_13:
; push_s 
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call tak
; pop_s
	pop r12
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_20
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_24
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_25
lb_24:
	bts r12,0
lb_25:
	pop rdi
	call dec_r
	jmp lb_21
lb_20:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_22
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_23
lb_22:
	bts r12,0
lb_23:
	pop rdi
lb_21:
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
test4:
; 	|» {  }
	jz emt_etr_start_lb_27
	jc emt_etr_c_lb_26
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_27
emt_etr_c_lb_26:
; emt_set_ptn {  }
emt_etr_start_lb_27:
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
	jc lb_28
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_29
lb_28:
	bts r12,1
lb_29:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_30
	bts r12,0
	call dec_r
lb_30:
; 	fact 1' ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_32
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_33
lb_32:
	bts rbx,0
lb_33:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_31
	bts r12,1
	call dec_r
lb_31:
; push_s 
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call fact
; pop_s
	pop r12
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_34
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_38
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_39
lb_38:
	bts r12,0
lb_39:
	pop rdi
	call dec_r
	jmp lb_35
lb_34:
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
lb_35:
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
tak:
; 	|» { 0' 1' 2' }
	jz emt_etr_start_lb_41
	jc emt_etr_c_lb_40
	push rdi
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_198
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_199
lb_198:
	bts r12,0
lb_199:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_200
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_201
lb_200:
	bts r12,1
lb_201:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_202
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_203
lb_202:
	bts r12,2
lb_203:
	pop rdi
	pop rdi
	call dec_r
jmp emt_etr_start_lb_41
emt_etr_c_lb_40:
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_192
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_193
lb_192:
	bts r12,0
lb_193:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_194
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_195
lb_194:
	bts r12,1
lb_195:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_196
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_197
lb_196:
	bts r12,2
lb_197:
	pop rdi
emt_etr_start_lb_41:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_42
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_43
lb_42:
	bts r12,3
lb_43:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_44
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_45
lb_44:
	bts r12,4
lb_45:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_46
	bts r12,0
	call dec_r
lb_46:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_47
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_48
lb_47:
	bts r12,0
lb_48:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_49
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_50
lb_49:
	bts r12,5
lb_50:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_51
	bts r12,1
	call dec_r
lb_51:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_57
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_58
lb_57:
	bts r12,6
lb_58:
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_59
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_60
lb_59:
	bts r12,7
lb_60:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_55
	bts r12,5
	call dec_r
lb_55:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_56
	bts r12,4
	call dec_r
lb_56:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_52
	mov r10,1
cmp_jb_lb_52:
	mov [st_vct+8*8],r9
	mov [st_vct+8*9],r10
	bts r12,8
	bts r12,9
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
	jc lb_53
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_54
lb_53:
	bts r12,1
lb_54:
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	cmp rax,0
	mov rdi,rax
	je lb_62
	mov rdi,0
	stc
	jmp agl_61_1
lb_62:
	mov rdi,1
	stc
	jmp agl_61_0
; 	∐ -2'
agl_61_0:
	jc lb_63
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_64
lb_63:
; emt_set_ptn -2'
lb_64:
; 	∎ 2'
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_65
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_65:
	bt r12,0
	jc clear_lb_66
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_66:
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	ret
; 	∐ -2'
agl_61_1:
	jc lb_67
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_68
lb_67:
; emt_set_ptn -2'
lb_68:
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_69
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_70
lb_69:
	bts r12,1
lb_70:
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_71
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_72
lb_71:
	bts r12,4
lb_72:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_73
	bts r12,3
	call dec_r
lb_73:
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
	jc lb_74
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_75
lb_74:
	bts r12,5
lb_75:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_76
	bts r12,3
	call dec_r
lb_76:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_81
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_82
lb_81:
	bts r12,6
lb_82:
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_83
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_84
lb_83:
	bts r12,7
lb_84:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_79
	bts r12,5
	call dec_r
lb_79:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_80
	bts r12,4
	call dec_r
lb_80:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_77
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_78
lb_77:
	bts r12,3
lb_78:
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_85
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_86
lb_85:
	bts r12,4
lb_86:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_87
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_88
lb_87:
	bts r12,5
lb_88:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_89
	bts r12,2
	call dec_r
lb_89:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_90
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_91
lb_90:
	bts r12,2
lb_91:
; emt_ptn_set_ptn 0',6'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_92
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_93
lb_92:
	bts r12,6
lb_93:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_94
	bts r12,0
	call dec_r
lb_94:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_98
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_99
lb_98:
	bts rbx,0
lb_99:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_100
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_101
lb_100:
	bts rbx,1
lb_101:
; emt_ptn_set_ptn 5',2'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_102
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_103
lb_102:
	bts rbx,2
lb_103:
; ; emt_dec_ptn { 3' 6' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_95
	bts r12,5
	call dec_r
lb_95:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_96
	bts r12,6
	call dec_r
lb_96:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_97
	bts r12,3
	call dec_r
lb_97:
; push_s  2'~y 4'~z 1'~x
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call tak
; pop_s
	pop r12
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*2],r9
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_104
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_108
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_109
lb_108:
	bts r12,0
lb_109:
	pop rdi
	call dec_r
	jmp lb_105
lb_104:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_106
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_107
lb_106:
	bts r12,0
lb_107:
	pop rdi
lb_105:
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_110
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_111
lb_110:
	bts r12,3
lb_111:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_112
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_113
lb_112:
	bts r12,5
lb_113:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_114
	bts r12,2
	call dec_r
lb_114:
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
	jc lb_115
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_116
lb_115:
	bts r12,6
lb_116:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_117
	bts r12,2
	call dec_r
lb_117:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_122
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_123
lb_122:
	bts r12,7
lb_123:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_124
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_125
lb_124:
	bts r12,8
lb_125:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_120
	bts r12,6
	call dec_r
lb_120:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_121
	bts r12,5
	call dec_r
lb_121:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_118
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_119
lb_118:
	bts r12,2
lb_119:
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_126
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_127
lb_126:
	bts r12,5
lb_127:
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_128
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_129
lb_128:
	bts r12,6
lb_129:
; ; emt_dec_ptn 4'
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_130
	bts r12,4
	call dec_r
lb_130:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_131
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_132
lb_131:
	bts r12,4
lb_132:
; emt_ptn_set_ptn 1',7'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_133
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_134
lb_133:
	bts r12,7
lb_134:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_135
	bts r12,1
	call dec_r
lb_135:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_139
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_140
lb_139:
	bts rbx,0
lb_140:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_141
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_142
lb_141:
	bts rbx,1
lb_142:
; emt_ptn_set_ptn 7',2'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_143
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_144
lb_143:
	bts rbx,2
lb_144:
; ; emt_dec_ptn { 2' 6' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_136
	bts r12,7
	call dec_r
lb_136:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_137
	bts r12,6
	call dec_r
lb_137:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_138
	bts r12,2
	call dec_r
lb_138:
; push_s  3'~y 4'~x 5'~z 0'~r0
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call tak
; pop_s
	pop r12
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*3],r9
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_145
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_149
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_150
lb_149:
	bts r12,1
lb_150:
	pop rdi
	call dec_r
	jmp lb_146
lb_145:
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_147
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_148
lb_147:
	bts r12,1
lb_148:
	pop rdi
lb_146:
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
	jc lb_151
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_152
lb_151:
	bts r12,6
lb_152:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_153
	bts r12,2
	call dec_r
lb_153:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_158
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_159
lb_158:
	bts r12,7
lb_159:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_160
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_161
lb_160:
	bts r12,8
lb_161:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_156
	bts r12,6
	call dec_r
lb_156:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_157
	bts r12,5
	call dec_r
lb_157:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_154
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_155
lb_154:
	bts r12,2
lb_155:
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_165
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_166
lb_165:
	bts rbx,0
lb_166:
; emt_ptn_set_ptn 4',1'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_167
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_168
lb_167:
	bts rbx,1
lb_168:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_169
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_170
lb_169:
	bts rbx,2
lb_170:
; ; emt_dec_ptn { 2' 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_162
	bts r12,3
	call dec_r
lb_162:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_163
	bts r12,4
	call dec_r
lb_163:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_164
	bts r12,2
	call dec_r
lb_164:
; push_s  0'~r0 1'~r1
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call tak
; pop_s
	pop r12
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*0],r9
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_171
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_175
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_176
lb_175:
	bts r12,2
lb_176:
	pop rdi
	call dec_r
	jmp lb_172
lb_171:
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_173
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_174
lb_173:
	bts r12,2
lb_174:
	pop rdi
lb_172:
; 	tak { 0' 1' 2' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_180
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_181
lb_180:
	bts rbx,0
lb_181:
; emt_ptn_set_ptn 1',1'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_182
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_183
lb_182:
	bts rbx,1
lb_183:
; emt_ptn_set_ptn 2',2'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_184
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_185
lb_184:
	bts rbx,2
lb_185:
; ; emt_dec_ptn { 0' 1' 2' }
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_177
	bts r12,2
	call dec_r
lb_177:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_178
	bts r12,1
	call dec_r
lb_178:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_179
	bts r12,0
	call dec_r
lb_179:
; push_s 
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*2]
	mov [st_vct+8*2],r9
	mov r9,[st_vct_tmp+8*1]
	mov [st_vct+8*1],r9
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call tak
; pop_s
	pop r12
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_186
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_190
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_191
lb_190:
	bts r12,0
lb_191:
	pop rdi
	call dec_r
	jmp lb_187
lb_186:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_188
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_189
lb_188:
	bts r12,0
lb_189:
	pop rdi
lb_187:
; 	∎ 0'
;clear 
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
fact:
; 	|» 0'
	jz emt_etr_start_lb_205
	jc emt_etr_c_lb_204
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_268
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_269
lb_268:
	bts r12,0
lb_269:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_205
emt_etr_c_lb_204:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_266
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_267
lb_266:
	bts r12,0
lb_267:
emt_etr_start_lb_205:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_206
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_207
lb_206:
	bts r12,1
lb_207:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_208
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_209
lb_208:
	bts r12,2
lb_209:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_210
	bts r12,0
	call dec_r
lb_210:
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
	jc lb_211
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_212
lb_211:
	bts r12,3
lb_212:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_213
	bts r12,0
	call dec_r
lb_213:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 4' 5' }
; emt_ptn_set_ptn 1',4'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_219
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_220
lb_219:
	bts r12,4
lb_220:
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_221
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_222
lb_221:
	bts r12,5
lb_222:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_217
	bts r12,3
	call dec_r
lb_217:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_218
	bts r12,1
	call dec_r
lb_218:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_214
	mov r10,1
cmp_jb_lb_214:
	mov [st_vct+8*6],r9
	mov [st_vct+8*7],r10
	bts r12,6
	bts r12,7
; emt_ptn_set_ptn { 6' 7' },{ 0' -2' }
; emt_ptn_set_ptn 6',0'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_215
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_216
lb_215:
	bts r12,0
lb_216:
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
	je lb_224
	mov rdi,0
	stc
	jmp agl_223_1
lb_224:
	mov rdi,1
	stc
	jmp agl_223_0
; 	∐ -2'
agl_223_0:
	jc lb_225
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_226
lb_225:
; emt_set_ptn -2'
lb_226:
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
	jc lb_227
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_228
lb_227:
	bts r12,1
lb_228:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_229
	bts r12,0
	call dec_r
lb_229:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_230
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_231
lb_230:
	bts r12,0
lb_231:
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_232
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_233
lb_232:
	bts r12,3
lb_233:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_234
	bts r12,2
	call dec_r
lb_234:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_239
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_240
lb_239:
	bts r12,4
lb_240:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_241
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_242
lb_241:
	bts r12,5
lb_242:
; ; emt_dec_ptn { 0' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_237
	bts r12,1
	call dec_r
lb_237:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_238
	bts r12,0
	call dec_r
lb_238:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_235
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_236
lb_235:
	bts r12,2
lb_236:
; 	fact 2' ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_244
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_245
lb_244:
	bts rbx,0
lb_245:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_243
	bts r12,2
	call dec_r
lb_243:
; push_s  3'~x2
	mov r9,[st_vct+8*3]
	push r9
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call fact
; pop_s
	pop r12
	pop r9
	mov [st_vct+8*3],r9
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_246
	push rdi
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
	pop rdi
	call dec_r
	jmp lb_247
lb_246:
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_248
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_249
lb_248:
	bts r12,0
lb_249:
	pop rdi
lb_247:
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_256
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_257
lb_256:
	bts r12,2
lb_257:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_258
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_259
lb_258:
	bts r12,4
lb_259:
; ; emt_dec_ptn { 3' 0' }
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_254
	bts r12,0
	call dec_r
lb_254:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_255
	bts r12,3
	call dec_r
lb_255:
	mov r9,[st_vct+8*2]
	mov r10,[st_vct+8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_252
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_253
lb_252:
	bts r12,1
lb_253:
; 	∎ 1'
;clear 
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
; 	∐ -2'
agl_223_1:
	jc lb_260
	push rdi
; emt_set_ptn -2'
	pop rdi
	call dec_r
	jmp lb_261
lb_260:
; emt_set_ptn -2'
lb_261:
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
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_264
	bts r12,0
	call dec_r
lb_264:
; 	∎ 1'
;clear  2'~x1
	bt r12,2
	jc clear_lb_265
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_265:
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
f0:
; 	|» 0'
	jz emt_etr_start_lb_271
	jc emt_etr_c_lb_270
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_335
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_336
lb_335:
	bts r12,0
lb_336:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_271
emt_etr_c_lb_270:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_333
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_334
lb_333:
	bts r12,0
lb_334:
emt_etr_start_lb_271:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_272
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_273
lb_272:
	bts r12,1
lb_273:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_274
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_275
lb_274:
	bts r12,2
lb_275:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_276
	bts r12,0
	call dec_r
lb_276:
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
	jc lb_277
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_278
lb_277:
	bts r12,3
lb_278:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_279
	bts r12,0
	call dec_r
lb_279:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_287
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_288
lb_287:
	bts r12,5
lb_288:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_289
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_290
lb_289:
	bts r12,6
lb_290:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_285
	bts r12,3
	call dec_r
lb_285:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_286
	bts r12,1
	call dec_r
lb_286:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_280
	mov r10,1
cmp_jb_lb_280:
	mov [st_vct+8*7],r9
	mov [st_vct+8*8],r10
	bts r12,7
	bts r12,8
; emt_ptn_set_ptn { 7' 8' },{ 0' 4' }
; emt_ptn_set_ptn 7',0'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_281
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_282
lb_281:
	bts r12,0
lb_282:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_283
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_284
lb_283:
	bts r12,4
lb_284:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_292
	mov rdi,0
	stc
	jmp agl_291_1
lb_292:
	mov rdi,1
	stc
	jmp agl_291_0
; 	∐ 0'
agl_291_0:
	jc lb_293
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_319
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_320
lb_319:
	bts r12,0
lb_320:
	pop rdi
	call dec_r
	jmp lb_294
lb_293:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_317
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_318
lb_317:
	bts r12,0
lb_318:
lb_294:
; 	» 0xr1 |~ 1' : r64
	mov r9,0x1
	mov [st_vct+8*1],r9
	bts r12,1
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_295
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_296
lb_295:
	bts r12,3
lb_296:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_297
	bts r12,1
	call dec_r
lb_297:
; 	sub { 2' 3' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_302
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_303
lb_302:
	bts r12,5
lb_303:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_304
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_305
lb_304:
	bts r12,6
lb_305:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_300
	bts r12,3
	call dec_r
lb_300:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_301
	bts r12,2
	call dec_r
lb_301:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_298
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_299
lb_298:
	bts r12,1
lb_299:
; 	f0 1' ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_307
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_308
lb_307:
	bts rbx,0
lb_308:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_306
	bts r12,1
	call dec_r
lb_306:
; push_s  4'~c 0'~b0
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	push r12
	rcl r9,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call f0
; pop_s
	pop r12
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	jc lb_309
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_313
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_314
lb_313:
	bts r12,1
lb_314:
	pop rdi
	call dec_r
	jmp lb_310
lb_309:
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_311
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_312
lb_311:
	bts r12,1
lb_312:
	pop rdi
lb_310:
; 	∎ 1'
;clear  4'~c 0'~b0
	bt r12,4
	jc clear_lb_315
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_315:
	bt r12,0
	jc clear_lb_316
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_316:
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	ret
; 	∐ 0'
agl_291_1:
	jc lb_321
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_331
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_332
lb_331:
	bts r12,0
lb_332:
	pop rdi
	call dec_r
	jmp lb_322
lb_321:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_329
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_330
lb_329:
	bts r12,0
lb_330:
lb_322:
; 	» 0xr0 |~ 1' : r64
	mov r9,0x0
	mov [st_vct+8*1],r9
	bts r12,1
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_323
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_324
lb_323:
	bts r12,3
lb_324:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_325
	bts r12,1
	call dec_r
lb_325:
; 	∎ 3'
;clear  2'~x1 4'~c 0'~b1
	bt r12,2
	jc clear_lb_326
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_326:
	bt r12,4
	jc clear_lb_327
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_327:
	bt r12,0
	jc clear_lb_328
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_328:
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	ret
test3:
; 	|» {  }
	jz emt_etr_start_lb_338
	jc emt_etr_c_lb_337
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_338
emt_etr_c_lb_337:
; emt_set_ptn {  }
emt_etr_start_lb_338:
; 	» 0x2r1 |~ 0' : @[0].r2 ≃ ∐[@[0] @[0] ]
	mov r9,0x1
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,@[0].r2 ≃ ∐[@[0] @[0] ]
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_339
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_340
lb_339:
	bts r12,1
lb_340:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_341
	bts r12,0
	call dec_r
lb_341:
; 	» 0xrff |~ 0' : r64
	mov r9,0xff
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_342
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_343
lb_342:
	bts r12,2
lb_343:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_344
	bts r12,0
	call dec_r
lb_344:
; 	» 0xrff |~ 0' : r64
	mov r9,0xff
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_345
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_346
lb_345:
	bts r12,3
lb_346:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_347
	bts r12,0
	call dec_r
lb_347:
; 	cmp { 2' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_355
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_356
lb_355:
	bts r12,5
lb_356:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_357
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_358
lb_357:
	bts r12,6
lb_358:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_353
	bts r12,3
	call dec_r
lb_353:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_354
	bts r12,2
	call dec_r
lb_354:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_348
	mov r10,1
cmp_jb_lb_348:
	mov [st_vct+8*7],r9
	mov [st_vct+8*8],r10
	bts r12,7
	bts r12,8
; emt_ptn_set_ptn { 7' 8' },{ 0' 4' }
; emt_ptn_set_ptn 7',0'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_349
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_350
lb_349:
	bts r12,0
lb_350:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_351
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_352
lb_351:
	bts r12,4
lb_352:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_360
	mov rdi,0
	stc
	jmp agl_359_1
lb_360:
	mov rdi,1
	stc
	jmp agl_359_0
; 	∐ 0'
agl_359_0:
	jc lb_361
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_367
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_368
lb_367:
	bts r12,0
lb_368:
	pop rdi
	call dec_r
	jmp lb_362
lb_361:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_365
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_366
lb_365:
	bts r12,0
lb_366:
lb_362:
; 	∎ 0'
;clear  4'~c 1'~b0
	bt r12,4
	jc clear_lb_363
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_363:
	bt r12,1
	jc clear_lb_364
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_364:
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
; 	∐ 0'
agl_359_1:
	jc lb_369
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_375
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_376
lb_375:
	bts r12,0
lb_376:
	pop rdi
	call dec_r
	jmp lb_370
lb_369:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_373
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_374
lb_373:
	bts r12,0
lb_374:
lb_370:
; 	∎ 0'
;clear  4'~c 1'~b0
	bt r12,4
	jc clear_lb_371
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_371:
	bt r12,1
	jc clear_lb_372
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_372:
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	ret
test2:
; 	|» {  }
	jz emt_etr_start_lb_378
	jc emt_etr_c_lb_377
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_378
emt_etr_c_lb_377:
; emt_set_ptn {  }
emt_etr_start_lb_378:
; 	» 0xrffff |~ 0' : r64
	mov r9,0xffff
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_379
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_380
lb_379:
	bts r12,1
lb_380:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_381
	bts r12,0
	call dec_r
lb_381:
; 	» 0xrffffccccafab0000 |~ 0' : r64
	mov r9,0xffffccccafab0000
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_382
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_383
lb_382:
	bts r12,2
lb_383:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_384
	bts r12,0
	call dec_r
lb_384:
; 	» 0xra |~ 0' : r64
	mov r9,0xa
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_385
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_386
lb_385:
	bts r12,3
lb_386:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_387
	bts r12,0
	call dec_r
lb_387:
; 	» 0xr18 |~ 0' : r64
	mov r9,0x18
	mov [st_vct+8*0],r9
	bts r12,0
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_388
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_389
lb_388:
	bts r12,4
lb_389:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_390
	bts r12,0
	call dec_r
lb_390:
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 4' 3' },{ 5' 6' }
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_395
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_396
lb_395:
	bts r12,5
lb_396:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_397
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_398
lb_397:
	bts r12,6
lb_398:
; ; emt_dec_ptn { 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_393
	bts r12,3
	call dec_r
lb_393:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_394
	bts r12,4
	call dec_r
lb_394:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_391
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_392
lb_391:
	bts r12,0
lb_392:
; 	∎ { 1' 0' }
;clear  2'~y
	bt r12,2
	jc clear_lb_399
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_399:
; emt_get_ptn { 1' 0' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	ret
test0:
; 	|» {  }
	jz emt_etr_start_lb_401
	jc emt_etr_c_lb_400
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_401
emt_etr_c_lb_400:
; emt_set_ptn {  }
emt_etr_start_lb_401:
; 	$ { {  } {  } } ⊢ ,0',1',2' : ,{ { } { } },{ { } { } },{ { } { } }
; emt_ptn_set_ptn { {  } {  } },0'
	push r12
; emt_get_ptn { {  } {  } }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	pop r12
	mov [st_vct+8*0],rax
	btr r12,0
; emt_ptn_set_ptn { {  } {  } },1'
	push r12
; emt_get_ptn { {  } {  } }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	pop r12
	mov [st_vct+8*1],rax
	btr r12,1
; emt_ptn_set_ptn { {  } {  } },2'
	push r12
; emt_get_ptn { {  } {  } }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn {  }
	mov rdi,0
	call mlc
	clc
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	pop r12
	mov [st_vct+8*2],rax
	btr r12,2
; ; emt_dec_ptn { {  } {  } }
; 	$ 0' ⊢ ,{ 3' 4' } : ,{ { } { } }
; emt_ptn_set_ptn 0',{ 3' 4' }
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_402
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_403
lb_402:
	bts r12,3
lb_403:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_404
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_405
lb_404:
	bts r12,4
lb_405:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_406
	bts r12,0
	call dec_r
lb_406:
; 	∎ { 3' 1' }
;clear  2'~r2 4'~r4
	bt r12,2
	jc clear_lb_407
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_407:
	bt r12,4
	jc clear_lb_408
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_408:
; emt_get_ptn { 3' 1' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	ret
