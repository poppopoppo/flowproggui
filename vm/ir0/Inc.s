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
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
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
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
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
	bt rax,0
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
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call fact
; pop_s
	pop r12
	mov r9,0
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
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
	bt rax,0
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
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
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
	jc lb_182
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_183
lb_182:
	bts r12,0
lb_183:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_184
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_185
lb_184:
	bts r12,1
lb_185:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_186
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_187
lb_186:
	bts r12,2
lb_187:
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
; 	cmp { 4' 5' } ⊢ { 1' 6' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 7' 8' }
; emt_ptn_set_ptn 4',7'
	mov rdi,[st_vct+8*4]
	bt r12,4
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
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_55
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_56
lb_55:
	bts r12,8
lb_56:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_51
	bts r12,5
	call dec_r
lb_51:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_52
	bts r12,4
	call dec_r
lb_52:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_46
	mov r10,1
cmp_jb_lb_46:
	mov [st_vct+8*9],r9
	mov [st_vct+8*10],r10
	bts r12,9
	bts r12,10
; emt_ptn_set_ptn { 9' 10' },{ 1' 6' }
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
; emt_ptn_set_ptn 10',6'
	mov rdi,[st_vct+8*10]
	bt r12,10
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_49
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_50
lb_49:
	bts r12,6
lb_50:
; 	∠ 6'
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	bt r12,6
	cmp rax,0
	mov rdi,rax
	je lb_58
	mov rdi,0
	stc
	mov rax,1
	jmp agl_57_1
lb_58:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_57_0
; 	∐ 4'
agl_57_0:
	push rax
	push rdi
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_64
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_65
lb_64:
	bts r12,4
lb_65:
	pop rdi
	pop rax
	bt rax,0
	jc lb_59
	push rdi
	call dec_r
	pop rdi
	clc
lb_59:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~x 4'~c 0'~y 1'~b
	bt r12,3
	jc clear_lb_60
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_60:
	bt r12,4
	jc clear_lb_61
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_61:
	bt r12,0
	jc clear_lb_62
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_62:
	bt r12,1
	jc clear_lb_63
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_63:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 4'
agl_57_1:
	push rax
	push rdi
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_180
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_181
lb_180:
	bts r12,4
lb_181:
	pop rdi
	pop rax
	bt rax,0
	jc lb_66
	push rdi
	call dec_r
	pop rdi
	clc
lb_66:
; 	$ 3' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_67
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_68
lb_67:
	bts r12,5
lb_68:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_69
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_70
lb_69:
	bts r12,6
lb_70:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_71
	bts r12,3
	call dec_r
lb_71:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	bts r12,3
; 	$ 3' ⊢ ,7' : ,r64
; emt_ptn_set_ptn 3',7'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_72
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_73
lb_72:
	bts r12,7
lb_73:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_74
	bts r12,3
	call dec_r
lb_74:
; 	sub { 6' 7' } ⊢ 3' : r64
; emt_ptn_set_ptn { 6' 7' },{ 8' 9' }
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_79
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_80
lb_79:
	bts r12,8
lb_80:
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_81
	btr r12,9
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_82
lb_81:
	bts r12,9
lb_82:
; ; emt_dec_ptn { 6' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_77
	bts r12,7
	call dec_r
lb_77:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_78
	bts r12,6
	call dec_r
lb_78:
	mov r9,[st_vct+8*8]
	mov r10,[st_vct+8*9]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_75
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_76
lb_75:
	bts r12,3
lb_76:
; 	$ 2' ⊢ ,6',7' : ,r64,r64
; emt_ptn_set_ptn 2',6'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_83
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_84
lb_83:
	bts r12,6
lb_84:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_85
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_86
lb_85:
	bts r12,7
lb_86:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_87
	bts r12,2
	call dec_r
lb_87:
; 	$ 0' ⊢ ,2',8' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_88
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_89
lb_88:
	bts r12,2
lb_89:
; emt_ptn_set_ptn 0',8'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_90
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_91
lb_90:
	bts r12,8
lb_91:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_92
	bts r12,0
	call dec_r
lb_92:
; 	tak { 3' 8' 7' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 3' 8' 7' },{ 0' 1' 2' }
; emt_ptn_set_ptn 3',0'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_96
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_97
lb_96:
	bts rbx,0
lb_97:
; emt_ptn_set_ptn 8',1'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_98
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_99
lb_98:
	bts rbx,1
lb_99:
; emt_ptn_set_ptn 7',2'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_100
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_101
lb_100:
	bts rbx,2
lb_101:
; ; emt_dec_ptn { 3' 8' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_93
	bts r12,7
	call dec_r
lb_93:
	mov rdi,[st_vct+8*8]
	bt r12,8
	jc lb_94
	bts r12,8
	call dec_r
lb_94:
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_95
	bts r12,3
	call dec_r
lb_95:
; push_s  2'~y 6'~z 5'~x 4'~c 1'~b
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*6]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
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
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*6],r9
	pop r9
	mov [st_vct+8*2],r9
	mov r9,0
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
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
	pop rax
	bt rax,0
	jc lb_102
	push rdi
	call dec_r
	pop rdi
	clc
lb_102:
; 	$ 2' ⊢ ,3',7' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_105
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_106
lb_105:
	bts r12,3
lb_106:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_107
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_108
lb_107:
	bts r12,7
lb_108:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_109
	bts r12,2
	call dec_r
lb_109:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	bts r12,2
; 	$ 2' ⊢ ,8' : ,r64
; emt_ptn_set_ptn 2',8'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_110
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_111
lb_110:
	bts r12,8
lb_111:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_112
	bts r12,2
	call dec_r
lb_112:
; 	sub { 7' 8' } ⊢ 2' : r64
; emt_ptn_set_ptn { 7' 8' },{ 9' 10' }
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_117
	btr r12,9
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_118
lb_117:
	bts r12,9
lb_118:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_119
	btr r12,10
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_120
lb_119:
	bts r12,10
lb_120:
; ; emt_dec_ptn { 7' 8' }
	mov rdi,[st_vct+8*8]
	bt r12,8
	jc lb_115
	bts r12,8
	call dec_r
lb_115:
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_116
	bts r12,7
	call dec_r
lb_116:
	mov r9,[st_vct+8*9]
	mov r10,[st_vct+8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_113
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_114
lb_113:
	bts r12,2
lb_114:
; 	$ 6' ⊢ ,7',8' : ,r64,r64
; emt_ptn_set_ptn 6',7'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_121
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_122
lb_121:
	bts r12,7
lb_122:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_123
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_124
lb_123:
	bts r12,8
lb_124:
; ; emt_dec_ptn 6'
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_125
	bts r12,6
	call dec_r
lb_125:
; 	$ 5' ⊢ ,6',9' : ,r64,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_126
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_127
lb_126:
	bts r12,6
lb_127:
; emt_ptn_set_ptn 5',9'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_128
	btr r12,9
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_129
lb_128:
	bts r12,9
lb_129:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_130
	bts r12,5
	call dec_r
lb_130:
; 	tak { 2' 8' 9' } ⊢ 2' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 2' 8' 9' },{ 0' 1' 2' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_134
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_135
lb_134:
	bts rbx,0
lb_135:
; emt_ptn_set_ptn 8',1'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_136
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_137
lb_136:
	bts rbx,1
lb_137:
; emt_ptn_set_ptn 9',2'
	mov rdi,[st_vct+8*9]
	bt r12,9
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_138
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_139
lb_138:
	bts rbx,2
lb_139:
; ; emt_dec_ptn { 2' 8' 9' }
	mov rdi,[st_vct+8*9]
	bt r12,9
	jc lb_131
	bts r12,9
	call dec_r
lb_131:
	mov rdi,[st_vct+8*8]
	bt r12,8
	jc lb_132
	bts r12,8
	call dec_r
lb_132:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_133
	bts r12,2
	call dec_r
lb_133:
; push_s  6'~x 7'~z 3'~y 4'~c 0'~r0 1'~b
	mov r9,[st_vct+8*6]
	push r9
	mov r9,[st_vct+8*7]
	push r9
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
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
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*3],r9
	pop r9
	mov [st_vct+8*7],r9
	pop r9
	mov [st_vct+8*6],r9
	mov r9,0
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_141
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_142
lb_141:
	bts r12,2
lb_142:
	pop rdi
	pop rax
	bt rax,0
	jc lb_140
	push rdi
	call dec_r
	pop rdi
	clc
lb_140:
; 	» 0xr1 |~ 5' : r64
	mov r9,0x1
	mov [st_vct+8*5],r9
	bts r12,5
; 	$ 5' ⊢ ,8' : ,r64
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_143
	btr r12,8
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_144
lb_143:
	bts r12,8
lb_144:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_145
	bts r12,5
	call dec_r
lb_145:
; 	sub { 7' 8' } ⊢ 5' : r64
; emt_ptn_set_ptn { 7' 8' },{ 9' 10' }
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_150
	btr r12,9
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_151
lb_150:
	bts r12,9
lb_151:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_152
	btr r12,10
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_153
lb_152:
	bts r12,10
lb_153:
; ; emt_dec_ptn { 7' 8' }
	mov rdi,[st_vct+8*8]
	bt r12,8
	jc lb_148
	bts r12,8
	call dec_r
lb_148:
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_149
	bts r12,7
	call dec_r
lb_149:
	mov r9,[st_vct+8*9]
	mov r10,[st_vct+8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_146
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_147
lb_146:
	bts r12,5
lb_147:
; 	tak { 5' 6' 3' } ⊢ 3' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 5' 6' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 5',0'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_157
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_158
lb_157:
	bts rbx,0
lb_158:
; emt_ptn_set_ptn 6',1'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_159
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_160
lb_159:
	bts rbx,1
lb_160:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_161
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_162
lb_161:
	bts rbx,2
lb_162:
; ; emt_dec_ptn { 5' 6' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_154
	bts r12,3
	call dec_r
lb_154:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_155
	bts r12,6
	call dec_r
lb_155:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_156
	bts r12,5
	call dec_r
lb_156:
; push_s  2'~r1 4'~c 0'~r0 1'~b
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
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
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*2],r9
	mov r9,0
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_164
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_165
lb_164:
	bts r12,3
lb_165:
	pop rdi
	pop rax
	bt rax,0
	jc lb_163
	push rdi
	call dec_r
	pop rdi
	clc
lb_163:
; 	tak { 0' 2' 3' } ⊢ 0' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn { 0' 2' 3' },{ 0' 1' 2' }
; emt_ptn_set_ptn 0',0'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_169
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_170
lb_169:
	bts rbx,0
lb_170:
; emt_ptn_set_ptn 2',1'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct_tmp+8*1],rdi
	jc lb_171
	btr rbx,1
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_172
lb_171:
	bts rbx,1
lb_172:
; emt_ptn_set_ptn 3',2'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 2'
	mov [st_vct_tmp+8*2],rdi
	jc lb_173
	btr rbx,2
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_174
lb_173:
	bts rbx,2
lb_174:
; ; emt_dec_ptn { 0' 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_166
	bts r12,3
	call dec_r
lb_166:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_167
	bts r12,2
	call dec_r
lb_167:
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_168
	bts r12,0
	call dec_r
lb_168:
; push_s  4'~c 1'~b
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
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
	mov r9,0
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_176
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_177
lb_176:
	bts r12,0
lb_177:
	pop rdi
	pop rax
	bt rax,0
	jc lb_175
	push rdi
	call dec_r
	pop rdi
	clc
lb_175:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b
	bt r12,4
	jc clear_lb_178
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_178:
	bt r12,1
	jc clear_lb_179
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_179:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jz emt_etr_start_lb_195
	jc emt_etr_c_lb_194
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_263
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_264
lb_263:
	bts r12,0
lb_264:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_195
emt_etr_c_lb_194:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_261
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_262
lb_261:
	bts r12,0
lb_262:
emt_etr_start_lb_195:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_196
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_197
lb_196:
	bts r12,1
lb_197:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_198
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_199
lb_198:
	bts r12,2
lb_199:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_200
	bts r12,0
	call dec_r
lb_200:
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
	jc lb_201
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_202
lb_201:
	bts r12,3
lb_202:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_203
	bts r12,0
	call dec_r
lb_203:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_211
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_212
lb_211:
	bts r12,5
lb_212:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_213
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_214
lb_213:
	bts r12,6
lb_214:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_209
	bts r12,3
	call dec_r
lb_209:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_210
	bts r12,1
	call dec_r
lb_210:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_204
	mov r10,1
cmp_jb_lb_204:
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
	jc lb_205
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_206
lb_205:
	bts r12,0
lb_206:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_207
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_208
lb_207:
	bts r12,4
lb_208:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_216
	mov rdi,0
	stc
	mov rax,1
	jmp agl_215_1
lb_216:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_215_0
; 	∐ 0'
agl_215_0:
	push rax
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
	pop rax
	bt rax,0
	jc lb_217
	push rdi
	call dec_r
	pop rdi
	clc
lb_217:
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
	jc lb_218
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_219
lb_218:
	bts r12,3
lb_219:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_220
	bts r12,1
	call dec_r
lb_220:
; 	$ 2' ⊢ ,1',5' : ,r64,r64
; emt_ptn_set_ptn 2',1'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_221
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_222
lb_221:
	bts r12,1
lb_222:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_223
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_224
lb_223:
	bts r12,5
lb_224:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_225
	bts r12,2
	call dec_r
lb_225:
; 	sub { 1' 3' } ⊢ 2' : r64
; emt_ptn_set_ptn { 1' 3' },{ 6' 7' }
; emt_ptn_set_ptn 1',6'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_230
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_231
lb_230:
	bts r12,6
lb_231:
; emt_ptn_set_ptn 3',7'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_232
	btr r12,7
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_233
lb_232:
	bts r12,7
lb_233:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_228
	bts r12,3
	call dec_r
lb_228:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_229
	bts r12,1
	call dec_r
lb_229:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_226
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_227
lb_226:
	bts r12,2
lb_227:
; 	fact 2' ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_235
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_236
lb_235:
	bts rbx,0
lb_236:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_234
	bts r12,2
	call dec_r
lb_234:
; push_s  5'~x2 4'~c 0'~b
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,[st_vct_tmp+8*0]
	mov [st_vct+8*0],r9
	mov r12,rbx
	cmp r9,r9
	call fact
; pop_s
	pop r12
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*5],r9
	mov r9,0
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_238
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_239
lb_238:
	bts r12,1
lb_239:
	pop rdi
	pop rax
	bt rax,0
	jc lb_237
	push rdi
	call dec_r
	pop rdi
	clc
lb_237:
; 	mul { 5' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 1' },{ 3' 6' }
; emt_ptn_set_ptn 5',3'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_244
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_245
lb_244:
	bts r12,3
lb_245:
; emt_ptn_set_ptn 1',6'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_246
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_247
lb_246:
	bts r12,6
lb_247:
; ; emt_dec_ptn { 5' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_242
	bts r12,1
	call dec_r
lb_242:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_243
	bts r12,5
	call dec_r
lb_243:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
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
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 0'~b
	bt r12,4
	jc clear_lb_248
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_248:
	bt r12,0
	jc clear_lb_249
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_249:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_215_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_259
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_260
lb_259:
	bts r12,0
lb_260:
	pop rdi
	pop rax
	bt rax,0
	jc lb_252
	push rdi
	call dec_r
	pop rdi
	clc
lb_252:
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
	jc lb_253
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_254
lb_253:
	bts r12,3
lb_254:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_255
	bts r12,1
	call dec_r
lb_255:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 4'~c 0'~b
	bt r12,2
	jc clear_lb_256
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_256:
	bt r12,4
	jc clear_lb_257
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_257:
	bt r12,0
	jc clear_lb_258
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_258:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jz emt_etr_start_lb_266
	jc emt_etr_c_lb_265
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_321
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_322
lb_321:
	bts r12,0
lb_322:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_266
emt_etr_c_lb_265:
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
emt_etr_start_lb_266:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_267
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_268
lb_267:
	bts r12,1
lb_268:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_269
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_270
lb_269:
	bts r12,2
lb_270:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_271
	bts r12,0
	call dec_r
lb_271:
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
	jc lb_272
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_273
lb_272:
	bts r12,3
lb_273:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_274
	bts r12,0
	call dec_r
lb_274:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_282
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_283
lb_282:
	bts r12,5
lb_283:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_284
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_285
lb_284:
	bts r12,6
lb_285:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_280
	bts r12,3
	call dec_r
lb_280:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_281
	bts r12,1
	call dec_r
lb_281:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_275
	mov r10,1
cmp_jb_lb_275:
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
	jc lb_276
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_277
lb_276:
	bts r12,0
lb_277:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_278
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_279
lb_278:
	bts r12,4
lb_279:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_287
	mov rdi,0
	stc
	mov rax,1
	jmp agl_286_1
lb_287:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_286_0
; 	∐ 0'
agl_286_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_308
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_309
lb_308:
	bts r12,0
lb_309:
	pop rdi
	pop rax
	bt rax,0
	jc lb_288
	push rdi
	call dec_r
	pop rdi
	clc
lb_288:
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
	jc lb_289
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_290
lb_289:
	bts r12,3
lb_290:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_291
	bts r12,1
	call dec_r
lb_291:
; 	sub { 2' 3' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_296
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_297
lb_296:
	bts r12,5
lb_297:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_298
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_299
lb_298:
	bts r12,6
lb_299:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_294
	bts r12,3
	call dec_r
lb_294:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_295
	bts r12,2
	call dec_r
lb_295:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_292
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_293
lb_292:
	bts r12,1
lb_293:
; 	f0 1' ⊢ 1' : r64

mov rbx,0

not rbx
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct_tmp+8*0],rdi
	jc lb_301
	btr rbx,0
	push rbx
	call inc_r
	pop rbx
	mov rax,rdi
	jmp lb_302
lb_301:
	bts rbx,0
lb_302:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_300
	bts r12,1
	call dec_r
lb_300:
; push_s  4'~c 0'~b0
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
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
	setc r9b
	push r9
	sub r15,1
	pop r9
	bt r9,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_304
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_305
lb_304:
	bts r12,1
lb_305:
	pop rdi
	pop rax
	bt rax,0
	jc lb_303
	push rdi
	call dec_r
	pop rdi
	clc
lb_303:
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
	jc clear_lb_306
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_306:
	bt r12,0
	jc clear_lb_307
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_307:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_286_1:
	push rax
	push rdi
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
	pop rdi
	pop rax
	bt rax,0
	jc lb_310
	push rdi
	call dec_r
	pop rdi
	clc
lb_310:
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
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_313
	bts r12,1
	call dec_r
lb_313:
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
	jc clear_lb_314
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_314:
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
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jz emt_etr_start_lb_324
	jc emt_etr_c_lb_323
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_324
emt_etr_c_lb_323:
; emt_set_ptn {  }
emt_etr_start_lb_324:
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
	jc lb_325
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_326
lb_325:
	bts r12,1
lb_326:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_327
	bts r12,0
	call dec_r
lb_327:
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
	jc lb_328
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_329
lb_328:
	bts r12,2
lb_329:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_330
	bts r12,0
	call dec_r
lb_330:
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
	jc lb_331
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_332
lb_331:
	bts r12,3
lb_332:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_333
	bts r12,0
	call dec_r
lb_333:
; 	cmp { 2' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_341
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_342
lb_341:
	bts r12,5
lb_342:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_343
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_344
lb_343:
	bts r12,6
lb_344:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_339
	bts r12,3
	call dec_r
lb_339:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_340
	bts r12,2
	call dec_r
lb_340:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_334
	mov r10,1
cmp_jb_lb_334:
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
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_337
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_338
lb_337:
	bts r12,4
lb_338:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_346
	mov rdi,0
	stc
	mov rax,1
	jmp agl_345_1
lb_346:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_345_0
; 	∐ 0'
agl_345_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_350
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_351
lb_350:
	bts r12,0
lb_351:
	pop rdi
	pop rax
	bt rax,0
	jc lb_347
	push rdi
	call dec_r
	pop rdi
	clc
lb_347:
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
	jc clear_lb_348
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_348:
	bt r12,1
	jc clear_lb_349
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_349:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_345_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_355
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_356
lb_355:
	bts r12,0
lb_356:
	pop rdi
	pop rax
	bt rax,0
	jc lb_352
	push rdi
	call dec_r
	pop rdi
	clc
lb_352:
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
	jc clear_lb_353
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_353:
	bt r12,1
	jc clear_lb_354
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_354:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jz emt_etr_start_lb_358
	jc emt_etr_c_lb_357
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_358
emt_etr_c_lb_357:
; emt_set_ptn {  }
emt_etr_start_lb_358:
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
	jc lb_359
	btr r12,1
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_360
lb_359:
	bts r12,1
lb_360:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_361
	bts r12,0
	call dec_r
lb_361:
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
	jc lb_362
	btr r12,2
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_363
lb_362:
	bts r12,2
lb_363:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_364
	bts r12,0
	call dec_r
lb_364:
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
	jc lb_365
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_366
lb_365:
	bts r12,3
lb_366:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_367
	bts r12,0
	call dec_r
lb_367:
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
	jc lb_368
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_369
lb_368:
	bts r12,4
lb_369:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_370
	bts r12,0
	call dec_r
lb_370:
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 4' 3' },{ 5' 6' }
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_375
	btr r12,5
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_376
lb_375:
	bts r12,5
lb_376:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_377
	btr r12,6
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_378
lb_377:
	bts r12,6
lb_378:
; ; emt_dec_ptn { 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_373
	bts r12,3
	call dec_r
lb_373:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_374
	bts r12,4
	call dec_r
lb_374:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_371
	btr r12,0
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_372
lb_371:
	bts r12,0
lb_372:
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
	jc clear_lb_379
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_379:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jz emt_etr_start_lb_381
	jc emt_etr_c_lb_380
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_381
emt_etr_c_lb_380:
; emt_set_ptn {  }
emt_etr_start_lb_381:
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
	jc lb_382
	btr r12,3
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_383
lb_382:
	bts r12,3
lb_383:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_384
	btr r12,4
	push r12
	call inc_r
	pop r12
	mov rax,rdi
	jmp lb_385
lb_384:
	bts r12,4
lb_385:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_386
	bts r12,0
	call dec_r
lb_386:
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
	jc clear_lb_387
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_387:
	bt r12,4
	jc clear_lb_388
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_388:
	pop r9
	rcr r9,1
	pop rax
	ret
