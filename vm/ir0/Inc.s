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
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
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
	pop rax
	rcr rax,1
	jc lb_20
	push rdi
	call dec_r
	pop rdi
	clc
lb_20:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear 
	pop r9
	rcr r9,1
	pop rax
	ret
test4:
; 	|» {  }
	jz emt_etr_start_lb_24
	jc emt_etr_c_lb_23
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_24
emt_etr_c_lb_23:
; emt_set_ptn {  }
emt_etr_start_lb_24:
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
	jc lb_25
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_26
lb_25:
	bts r12,1
lb_26:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_27
	bts r12,0
	call dec_r
lb_27:
; 	fact 1' ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_29
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_30
lb_29:
	bts rbx,0
lb_30:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_28
	bts r12,1
	call dec_r
lb_28:
; push_s 
	push r12
	mov rax,0
	rcl rax,1
	add r15,1
	rcr rax,1
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call fact
; pop_s
	pop r12
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_32
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_33
lb_32:
	bts r12,0
lb_33:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_31
	push rdi
	call dec_r
	pop rdi
	clc
lb_31:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear 
	pop r9
	rcr r9,1
	pop rax
	ret
tak:
; 	|» { 0' 1' 2' }
	jz emt_etr_start_lb_35
	jc emt_etr_c_lb_34
	push rdi
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_178
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_179
lb_178:
	bts r12,0
lb_179:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_180
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_181
lb_180:
	bts r12,1
lb_181:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_182
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_183
lb_182:
	bts r12,2
lb_183:
	pop rdi
	pop rdi
	call dec_r
jmp emt_etr_start_lb_35
emt_etr_c_lb_34:
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_172
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_173
lb_172:
	bts r12,0
lb_173:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_174
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_175
lb_174:
	bts r12,1
lb_175:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_176
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_177
lb_176:
	bts r12,2
lb_177:
	pop rdi
emt_etr_start_lb_35:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_36
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_37
lb_36:
	bts r12,3
lb_37:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_38
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_39
lb_38:
	bts r12,4
lb_39:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_40
	bts r12,0
	call dec_r
lb_40:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_41
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_42
lb_41:
	bts r12,0
lb_42:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_43
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_44
lb_43:
	bts r12,5
lb_44:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_45
	bts r12,1
	call dec_r
lb_45:
; 	cmp { 4' 5' } ⊢ { -2' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_51
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_52
lb_51:
	bts r12,6
lb_52:
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_53
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_54
lb_53:
	bts r12,7
lb_54:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_49
	bts r12,5
	call dec_r
lb_49:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_50
	bts r12,4
	call dec_r
lb_50:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_46
	mov r10,1
cmp_jb_lb_46:
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
	jc lb_47
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_48
lb_47:
	bts r12,1
lb_48:
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	cmp rax,0
	mov rdi,rax
	je lb_56
	mov rdi,0
	stc
	mov rax,1
	jmp agl_55_1
lb_56:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_55_0
; 	∐ -2'
agl_55_0:
	push rax
	push rdi
; emt_set_ptn -2'
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_57
	push rdi
	call dec_r
	pop rdi
	clc
lb_57:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~x 0'~y
	bt r12,3
	jc clear_lb_58
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_58:
	bt r12,0
	jc clear_lb_59
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_59:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ -2'
agl_55_1:
	push rax
	push rdi
; emt_set_ptn -2'
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_60
	push rdi
	call dec_r
	pop rdi
	clc
lb_60:
; 	$ 3' ⊢ ,1',4' : ,r64,r64
; emt_ptn_set_ptn 3',1'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_61
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_62
lb_61:
	bts r12,1
lb_62:
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_63
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_64
lb_63:
	bts r12,4
lb_64:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_65
	bts r12,3
	call dec_r
lb_65:
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
	jc lb_66
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_67
lb_66:
	bts r12,5
lb_67:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_68
	bts r12,3
	call dec_r
lb_68:
; 	sub { 4' 5' } ⊢ 3' : r64
; emt_ptn_set_ptn { 4' 5' },{ 6' 7' }
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_73
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_74
lb_73:
	bts r12,6
lb_74:
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_75
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_76
lb_75:
	bts r12,7
lb_76:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_71
	bts r12,5
	call dec_r
lb_71:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_72
	bts r12,4
	call dec_r
lb_72:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_69
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_70
lb_69:
	bts r12,3
lb_70:
; 	$ 2' ⊢ ,4',5' : ,r64,r64
; emt_ptn_set_ptn 2',4'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_77
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_78
lb_77:
	bts r12,4
lb_78:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_79
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_80
lb_79:
	bts r12,5
lb_80:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_81
	bts r12,2
	call dec_r
lb_81:
; 	$ 0' ⊢ ,2',6' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_82
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_83
lb_82:
	bts r12,2
lb_83:
; emt_ptn_set_ptn 0',6'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_84
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_85
lb_84:
	bts r12,6
lb_85:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_86
	bts r12,0
	call dec_r
lb_86:
; 	tak { 3' 6' 5' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 3' 6' 5' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_90
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_91
lb_90:
	bts rbx,0
lb_91:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_92
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_93
lb_92:
	bts rbx,1
lb_93:
; emt_ptn_set_ptn 5',2'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_94
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_95
lb_94:
	bts rbx,2
lb_95:
; ; emt_dec_ptn { 3' 6' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_87
	bts r12,5
	call dec_r
lb_87:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_88
	bts r12,6
	call dec_r
lb_88:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_89
	bts r12,3
	call dec_r
lb_89:
; push_s  2'~y 4'~z 1'~x
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_97
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_98
lb_97:
	bts r12,0
lb_98:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_96
	push rdi
	call dec_r
	pop rdi
	clc
lb_96:
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_99
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_100
lb_99:
	bts r12,3
lb_100:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_101
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_102
lb_101:
	bts r12,5
lb_102:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_103
	bts r12,2
	call dec_r
lb_103:
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
	jc lb_104
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_105
lb_104:
	bts r12,6
lb_105:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_106
	bts r12,2
	call dec_r
lb_106:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_111
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_112
lb_111:
	bts r12,7
lb_112:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_113
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_114
lb_113:
	bts r12,8
lb_114:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_109
	bts r12,6
	call dec_r
lb_109:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_110
	bts r12,5
	call dec_r
lb_110:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_107
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_108
lb_107:
	bts r12,2
lb_108:
; 	$ 4' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_115
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_116
lb_115:
	bts r12,5
lb_116:
; emt_ptn_set_ptn 4',6'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_117
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_118
lb_117:
	bts r12,6
lb_118:
; ; emt_dec_ptn 4'
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_119
	bts r12,4
	call dec_r
lb_119:
; 	$ 1' ⊢ ,4',7' : ,r64,r64
; emt_ptn_set_ptn 1',4'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_120
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_121
lb_120:
	bts r12,4
lb_121:
; emt_ptn_set_ptn 1',7'
	mov rdi,[st_vct+8*1]
	bt r12,1
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
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_124
	bts r12,1
	call dec_r
lb_124:
; 	tak { 2' 6' 7' } ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 6' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_128
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_129
lb_128:
	bts rbx,0
lb_129:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_130
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_131
lb_130:
	bts rbx,1
lb_131:
; emt_ptn_set_ptn 7',2'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_132
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_133
lb_132:
	bts rbx,2
lb_133:
; ; emt_dec_ptn { 2' 6' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_125
	bts r12,7
	call dec_r
lb_125:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_126
	bts r12,6
	call dec_r
lb_126:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_127
	bts r12,2
	call dec_r
lb_127:
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
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_135
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_136
lb_135:
	bts r12,1
lb_136:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_134
	push rdi
	call dec_r
	pop rdi
	clc
lb_134:
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
	jc lb_137
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_138
lb_137:
	bts r12,6
lb_138:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_139
	bts r12,2
	call dec_r
lb_139:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 7' 8' }
; emt_ptn_set_ptn 5',7'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_144
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_145
lb_144:
	bts r12,7
lb_145:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_146
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_147
lb_146:
	bts r12,8
lb_147:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_142
	bts r12,6
	call dec_r
lb_142:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_143
	bts r12,5
	call dec_r
lb_143:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_140
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_141
lb_140:
	bts r12,2
lb_141:
; 	tak { 2' 4' 3' } ⊢ 2' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 4' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_151
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_152
lb_151:
	bts rbx,0
lb_152:
; emt_ptn_set_ptn 4',1'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_153
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_154
lb_153:
	bts rbx,1
lb_154:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_155
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_156
lb_155:
	bts rbx,2
lb_156:
; ; emt_dec_ptn { 2' 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_148
	bts r12,3
	call dec_r
lb_148:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_149
	bts r12,4
	call dec_r
lb_149:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_150
	bts r12,2
	call dec_r
lb_150:
; push_s  0'~r0 1'~r1
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_158
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_159
lb_158:
	bts r12,2
lb_159:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_157
	push rdi
	call dec_r
	pop rdi
	clc
lb_157:
; 	tak { 0' 1' 2' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 0' 1' 2' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_163
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_164
lb_163:
	bts rbx,0
lb_164:
; emt_ptn_set_ptn 1',1'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_165
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_166
lb_165:
	bts rbx,1
lb_166:
; emt_ptn_set_ptn 2',2'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_167
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_168
lb_167:
	bts rbx,2
lb_168:
; ; emt_dec_ptn { 0' 1' 2' }
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_160
	bts r12,2
	call dec_r
lb_160:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_161
	bts r12,1
	call dec_r
lb_161:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_162
	bts r12,0
	call dec_r
lb_162:
; push_s 
	push r12
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_170
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_171
lb_170:
	bts r12,0
lb_171:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_169
	push rdi
	call dec_r
	pop rdi
	clc
lb_169:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear 
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jz emt_etr_start_lb_185
	jc emt_etr_c_lb_184
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_243
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_244
lb_243:
	bts r12,0
lb_244:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_185
emt_etr_c_lb_184:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_241
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_242
lb_241:
	bts r12,0
lb_242:
emt_etr_start_lb_185:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_186
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_187
lb_186:
	bts r12,1
lb_187:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_188
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_189
lb_188:
	bts r12,2
lb_189:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_190
	bts r12,0
	call dec_r
lb_190:
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
	jc lb_191
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_192
lb_191:
	bts r12,3
lb_192:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_193
	bts r12,0
	call dec_r
lb_193:
; 	cmp { 1' 3' } ⊢ { 0' -2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 4' 5' }
; emt_ptn_set_ptn 1',4'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_199
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_200
lb_199:
	bts r12,4
lb_200:
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_201
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_202
lb_201:
	bts r12,5
lb_202:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_197
	bts r12,3
	call dec_r
lb_197:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_198
	bts r12,1
	call dec_r
lb_198:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_194
	mov r10,1
cmp_jb_lb_194:
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
	jc lb_195
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_196
lb_195:
	bts r12,0
lb_196:
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
	je lb_204
	mov rdi,0
	stc
	mov rax,1
	jmp agl_203_1
lb_204:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_203_0
; 	∐ -2'
agl_203_0:
	push rax
	push rdi
; emt_set_ptn -2'
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_205
	push rdi
	call dec_r
	pop rdi
	clc
lb_205:
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
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_208
	bts r12,0
	call dec_r
lb_208:
; 	$ 2' ⊢ ,0',3' : ,r64,r64
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_209
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_210
lb_209:
	bts r12,0
lb_210:
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
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
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_213
	bts r12,2
	call dec_r
lb_213:
; 	sub { 0' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 0' 1' },{ 4' 5' }
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_218
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_219
lb_218:
	bts r12,4
lb_219:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_220
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_221
lb_220:
	bts r12,5
lb_221:
; ; emt_dec_ptn { 0' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_216
	bts r12,1
	call dec_r
lb_216:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_217
	bts r12,0
	call dec_r
lb_217:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_214
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_215
lb_214:
	bts r12,2
lb_215:
; 	fact 2' ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_223
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_224
lb_223:
	bts rbx,0
lb_224:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_222
	bts r12,2
	call dec_r
lb_222:
; push_s  3'~x2
	mov r9,[st_vct+8*3]
	push r9
	push r12
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_226
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_227
lb_226:
	bts r12,0
lb_227:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_225
	push rdi
	call dec_r
	pop rdi
	clc
lb_225:
; 	mul { 3' 0' } ⊢ 1' : r64
; emt_ptn_set_ptn { 3' 0' },{ 2' 4' }
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_232
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_233
lb_232:
	bts r12,2
lb_233:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_234
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_235
lb_234:
	bts r12,4
lb_235:
; ; emt_dec_ptn { 3' 0' }
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_230
	bts r12,0
	call dec_r
lb_230:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_231
	bts r12,3
	call dec_r
lb_231:
	mov r9,[st_vct+8*2]
	mov r10,[st_vct+8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_228
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_229
lb_228:
	bts r12,1
lb_229:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear 
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ -2'
agl_203_1:
	push rax
	push rdi
; emt_set_ptn -2'
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_236
	push rdi
	call dec_r
	pop rdi
	clc
lb_236:
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
	jc lb_237
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_238
lb_237:
	bts r12,1
lb_238:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_239
	bts r12,0
	call dec_r
lb_239:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1
	bt r12,2
	jc clear_lb_240
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_240:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jz emt_etr_start_lb_246
	jc emt_etr_c_lb_245
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_301
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_302
lb_301:
	bts r12,0
lb_302:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_246
emt_etr_c_lb_245:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_299
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_300
lb_299:
	bts r12,0
lb_300:
emt_etr_start_lb_246:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_247
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_248
lb_247:
	bts r12,1
lb_248:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_249
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_250
lb_249:
	bts r12,2
lb_250:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_251
	bts r12,0
	call dec_r
lb_251:
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
	jc lb_252
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_253
lb_252:
	bts r12,3
lb_253:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_254
	bts r12,0
	call dec_r
lb_254:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_262
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_263
lb_262:
	bts r12,5
lb_263:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_264
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_265
lb_264:
	bts r12,6
lb_265:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_260
	bts r12,3
	call dec_r
lb_260:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_261
	bts r12,1
	call dec_r
lb_261:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_255
	mov r10,1
cmp_jb_lb_255:
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
	jc lb_256
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_257
lb_256:
	bts r12,0
lb_257:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
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
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_267
	mov rdi,0
	stc
	mov rax,1
	jmp agl_266_1
lb_267:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_266_0
; 	∐ 0'
agl_266_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_288
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_289
lb_288:
	bts r12,0
lb_289:
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_268
	push rdi
	call dec_r
	pop rdi
	clc
lb_268:
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
	jc lb_269
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_270
lb_269:
	bts r12,3
lb_270:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_271
	bts r12,1
	call dec_r
lb_271:
; 	sub { 2' 3' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_276
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_277
lb_276:
	bts r12,5
lb_277:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_278
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_279
lb_278:
	bts r12,6
lb_279:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_274
	bts r12,3
	call dec_r
lb_274:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_275
	bts r12,2
	call dec_r
lb_275:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	sub r9,r10
	mov rdi,r9
	stc
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
; 	f0 1' ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_281
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_282
lb_281:
	bts rbx,0
lb_282:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_280
	bts r12,1
	call dec_r
lb_280:
; push_s  4'~c 0'~b0
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	push r12
	mov rax,0
	rcl rax,1
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
	mov r9,0
	rcl r9,1
	sub r15,1
	rcr r9,1
	mov rdi,rax
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rax
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_284
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_285
lb_284:
	bts r12,1
lb_285:
	pop rdi
	pop rax
	rcr rax,1
	jc lb_283
	push rdi
	call dec_r
	pop rdi
	clc
lb_283:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 0'~b0
	bt r12,4
	jc clear_lb_286
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_286:
	bt r12,0
	jc clear_lb_287
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_287:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_266_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_297
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_298
lb_297:
	bts r12,0
lb_298:
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_290
	push rdi
	call dec_r
	pop rdi
	clc
lb_290:
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
	jc lb_291
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_292
lb_291:
	bts r12,3
lb_292:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_293
	bts r12,1
	call dec_r
lb_293:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 4'~c 0'~b1
	bt r12,2
	jc clear_lb_294
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_294:
	bt r12,4
	jc clear_lb_295
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_295:
	bt r12,0
	jc clear_lb_296
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_296:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jz emt_etr_start_lb_304
	jc emt_etr_c_lb_303
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_304
emt_etr_c_lb_303:
; emt_set_ptn {  }
emt_etr_start_lb_304:
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
	jc lb_305
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_306
lb_305:
	bts r12,1
lb_306:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_307
	bts r12,0
	call dec_r
lb_307:
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
	jc lb_308
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_309
lb_308:
	bts r12,2
lb_309:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_310
	bts r12,0
	call dec_r
lb_310:
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
	jc lb_311
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_312
lb_311:
	bts r12,3
lb_312:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_313
	bts r12,0
	call dec_r
lb_313:
; 	cmp { 2' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_321
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_322
lb_321:
	bts r12,5
lb_322:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_323
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_324
lb_323:
	bts r12,6
lb_324:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_319
	bts r12,3
	call dec_r
lb_319:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_320
	bts r12,2
	call dec_r
lb_320:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_314
	mov r10,1
cmp_jb_lb_314:
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
	jc lb_315
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_316
lb_315:
	bts r12,0
lb_316:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_317
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_318
lb_317:
	bts r12,4
lb_318:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_326
	mov rdi,0
	stc
	mov rax,1
	jmp agl_325_1
lb_326:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_325_0
; 	∐ 0'
agl_325_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_330
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_331
lb_330:
	bts r12,0
lb_331:
	pop rdi
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_327
	push rdi
	call dec_r
	pop rdi
	clc
lb_327:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b0
	bt r12,4
	jc clear_lb_328
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_328:
	bt r12,1
	jc clear_lb_329
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_329:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_325_1:
	push rax
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
	pop rax
	mov r9,rax
	rcr r9,1
	jc lb_332
	push rdi
	call dec_r
	pop rdi
	clc
lb_332:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b0
	bt r12,4
	jc clear_lb_333
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_333:
	bt r12,1
	jc clear_lb_334
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_334:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
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
	jc lb_348
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_349
lb_348:
	bts r12,4
lb_349:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_350
	bts r12,0
	call dec_r
lb_350:
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 4' 3' },{ 5' 6' }
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
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
; ; emt_dec_ptn { 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_353
	bts r12,3
	call dec_r
lb_353:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_354
	bts r12,4
	call dec_r
lb_354:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_351
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_352
lb_351:
	bts r12,0
lb_352:
; 	∎ { 1' 0' }
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
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~y
	bt r12,2
	jc clear_lb_359
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_359:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jz emt_etr_start_lb_361
	jc emt_etr_c_lb_360
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_361
emt_etr_c_lb_360:
; emt_set_ptn {  }
emt_etr_start_lb_361:
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
	jc lb_362
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_363
lb_362:
	bts r12,3
lb_363:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_364
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_365
lb_364:
	bts r12,4
lb_365:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_366
	bts r12,0
	call dec_r
lb_366:
; 	∎ { 3' 1' }
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
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~r2 4'~r4
	bt r12,2
	jc clear_lb_367
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_367:
	bt r12,4
	jc clear_lb_368
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_368:
	pop r9
	rcr r9,1
	pop rax
	ret
