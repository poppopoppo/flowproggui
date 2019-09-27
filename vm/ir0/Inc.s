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
	call test5
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test5:
; 	|» {  }
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
	call inc_r
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
	call inc_r
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
	call inc_r
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
; emt_get_ptn { 1' 2' 3' }
	mov rdi,3
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
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s 
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_12
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_13
lb_12:
	bts r12,0
lb_13:
	pop rdi
	pop rax
	bt rax,0
	jc lb_11
	push rdi
	call dec_r
	pop rdi
	clc
lb_11:
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
	jc emt_etr_c_lb_14
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_15
emt_etr_c_lb_14:
; emt_set_ptn {  }
emt_etr_start_lb_15:
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
	jc lb_16
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_17
lb_16:
	bts r12,1
lb_17:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_18
	bts r12,0
	call dec_r
lb_18:
; 	fact 1' ⊢ 0' : r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	mov rdi,rax
; push_s 
	push r12
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_20
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_21
lb_20:
	bts r12,0
lb_21:
	pop rdi
	pop rax
	bt rax,0
	jc lb_19
	push rdi
	call dec_r
	pop rdi
	clc
lb_19:
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
	jc emt_etr_c_lb_22
	push rdi
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_140
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_141
lb_140:
	bts r12,0
lb_141:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_142
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_143
lb_142:
	bts r12,1
lb_143:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_144
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_145
lb_144:
	bts r12,2
lb_145:
	pop rdi
	pop rdi
	call dec_r
jmp emt_etr_start_lb_23
emt_etr_c_lb_22:
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_134
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_135
lb_134:
	bts r12,0
lb_135:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_136
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_137
lb_136:
	bts r12,1
lb_137:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_138
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_139
lb_138:
	bts r12,2
lb_139:
	pop rdi
emt_etr_start_lb_23:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_24
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_25
lb_24:
	bts r12,3
lb_25:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_26
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_27
lb_26:
	bts r12,4
lb_27:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_28
	bts r12,0
	call dec_r
lb_28:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_29
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_30
lb_29:
	bts r12,0
lb_30:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_31
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_32
lb_31:
	bts r12,5
lb_32:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_33
	bts r12,1
	call dec_r
lb_33:
; 	cmp { 4' 5' } ⊢ { 1' 6' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 7' 8' }
; emt_ptn_set_ptn 4',7'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_41
	btr r12,7
	call inc_r
	mov rax,rdi
	jmp lb_42
lb_41:
	bts r12,7
lb_42:
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_43
	btr r12,8
	call inc_r
	mov rax,rdi
	jmp lb_44
lb_43:
	bts r12,8
lb_44:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_39
	bts r12,5
	call dec_r
lb_39:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_40
	bts r12,4
	call dec_r
lb_40:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_34
	mov r10,1
cmp_jb_lb_34:
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
	jc lb_35
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_36
lb_35:
	bts r12,1
lb_36:
; emt_ptn_set_ptn 10',6'
	mov rdi,[st_vct+8*10]
	bt r12,10
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_37
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_38
lb_37:
	bts r12,6
lb_38:
; 	∠ 6'
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	bt r12,6
	cmp rax,0
	mov rdi,rax
	je lb_46
	mov rdi,0
	stc
	mov rax,1
	jmp agl_45_1
lb_46:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_45_0
; 	∐ 4'
agl_45_0:
	push rax
	push rdi
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_52
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_53
lb_52:
	bts r12,4
lb_53:
	pop rdi
	pop rax
	bt rax,0
	jc lb_47
	push rdi
	call dec_r
	pop rdi
	clc
lb_47:
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
	jc clear_lb_48
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_48:
	bt r12,4
	jc clear_lb_49
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_49:
	bt r12,0
	jc clear_lb_50
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_50:
	bt r12,1
	jc clear_lb_51
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_51:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 4'
agl_45_1:
	push rax
	push rdi
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_132
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_133
lb_132:
	bts r12,4
lb_133:
	pop rdi
	pop rax
	bt rax,0
	jc lb_54
	push rdi
	call dec_r
	pop rdi
	clc
lb_54:
; 	$ 3' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_55
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_56
lb_55:
	bts r12,5
lb_56:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_57
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_58
lb_57:
	bts r12,6
lb_58:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_59
	bts r12,3
	call dec_r
lb_59:
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
	jc lb_60
	btr r12,7
	call inc_r
	mov rax,rdi
	jmp lb_61
lb_60:
	bts r12,7
lb_61:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_62
	bts r12,3
	call dec_r
lb_62:
; 	sub { 6' 7' } ⊢ 3' : r64
; emt_ptn_set_ptn { 6' 7' },{ 8' 9' }
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_67
	btr r12,8
	call inc_r
	mov rax,rdi
	jmp lb_68
lb_67:
	bts r12,8
lb_68:
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_69
	btr r12,9
	call inc_r
	mov rax,rdi
	jmp lb_70
lb_69:
	bts r12,9
lb_70:
; ; emt_dec_ptn { 6' 7' }
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_65
	bts r12,7
	call dec_r
lb_65:
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_66
	bts r12,6
	call dec_r
lb_66:
	mov r9,[st_vct+8*8]
	mov r10,[st_vct+8*9]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_63
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_64
lb_63:
	bts r12,3
lb_64:
; 	$ 2' ⊢ ,6',7' : ,r64,r64
; emt_ptn_set_ptn 2',6'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_71
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_72
lb_71:
	bts r12,6
lb_72:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_73
	btr r12,7
	call inc_r
	mov rax,rdi
	jmp lb_74
lb_73:
	bts r12,7
lb_74:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_75
	bts r12,2
	call dec_r
lb_75:
; 	$ 0' ⊢ ,2',8' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_76
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_77
lb_76:
	bts r12,2
lb_77:
; emt_ptn_set_ptn 0',8'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_78
	btr r12,8
	call inc_r
	mov rax,rdi
	jmp lb_79
lb_78:
	bts r12,8
lb_79:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_80
	bts r12,0
	call dec_r
lb_80:
; 	tak { 3' 8' 7' } ⊢ 0' : r64
; emt_get_ptn { 3' 8' 7' }
	mov rdi,3
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
; emt_get_ptn 8'
	mov rax,[st_vct+8*8]
	bt r12,8
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	bt r12,7
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
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
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_82
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_83
lb_82:
	bts r12,0
lb_83:
	pop rdi
	pop rax
	bt rax,0
	jc lb_81
	push rdi
	call dec_r
	pop rdi
	clc
lb_81:
; 	$ 2' ⊢ ,3',7' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_84
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_85
lb_84:
	bts r12,3
lb_85:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_86
	btr r12,7
	call inc_r
	mov rax,rdi
	jmp lb_87
lb_86:
	bts r12,7
lb_87:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_88
	bts r12,2
	call dec_r
lb_88:
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
	jc lb_89
	btr r12,8
	call inc_r
	mov rax,rdi
	jmp lb_90
lb_89:
	bts r12,8
lb_90:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_91
	bts r12,2
	call dec_r
lb_91:
; 	sub { 7' 8' } ⊢ 2' : r64
; emt_ptn_set_ptn { 7' 8' },{ 9' 10' }
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_96
	btr r12,9
	call inc_r
	mov rax,rdi
	jmp lb_97
lb_96:
	bts r12,9
lb_97:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_98
	btr r12,10
	call inc_r
	mov rax,rdi
	jmp lb_99
lb_98:
	bts r12,10
lb_99:
; ; emt_dec_ptn { 7' 8' }
	mov rdi,[st_vct+8*8]
	bt r12,8
	jc lb_94
	bts r12,8
	call dec_r
lb_94:
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_95
	bts r12,7
	call dec_r
lb_95:
	mov r9,[st_vct+8*9]
	mov r10,[st_vct+8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_92
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_93
lb_92:
	bts r12,2
lb_93:
; 	$ 6' ⊢ ,7',8' : ,r64,r64
; emt_ptn_set_ptn 6',7'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_100
	btr r12,7
	call inc_r
	mov rax,rdi
	jmp lb_101
lb_100:
	bts r12,7
lb_101:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	bt r12,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_102
	btr r12,8
	call inc_r
	mov rax,rdi
	jmp lb_103
lb_102:
	bts r12,8
lb_103:
; ; emt_dec_ptn 6'
	mov rdi,[st_vct+8*6]
	bt r12,6
	jc lb_104
	bts r12,6
	call dec_r
lb_104:
; 	$ 5' ⊢ ,6',9' : ,r64,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_105
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_106
lb_105:
	bts r12,6
lb_106:
; emt_ptn_set_ptn 5',9'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_107
	btr r12,9
	call inc_r
	mov rax,rdi
	jmp lb_108
lb_107:
	bts r12,9
lb_108:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_109
	bts r12,5
	call dec_r
lb_109:
; 	tak { 2' 8' 9' } ⊢ 2' : r64
; emt_get_ptn { 2' 8' 9' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 8'
	mov rax,[st_vct+8*8]
	bt r12,8
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 9'
	mov rax,[st_vct+8*9]
	bt r12,9
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
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
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_111
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_112
lb_111:
	bts r12,2
lb_112:
	pop rdi
	pop rax
	bt rax,0
	jc lb_110
	push rdi
	call dec_r
	pop rdi
	clc
lb_110:
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
	jc lb_113
	btr r12,8
	call inc_r
	mov rax,rdi
	jmp lb_114
lb_113:
	bts r12,8
lb_114:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_115
	bts r12,5
	call dec_r
lb_115:
; 	sub { 7' 8' } ⊢ 5' : r64
; emt_ptn_set_ptn { 7' 8' },{ 9' 10' }
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	bt r12,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_120
	btr r12,9
	call inc_r
	mov rax,rdi
	jmp lb_121
lb_120:
	bts r12,9
lb_121:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_122
	btr r12,10
	call inc_r
	mov rax,rdi
	jmp lb_123
lb_122:
	bts r12,10
lb_123:
; ; emt_dec_ptn { 7' 8' }
	mov rdi,[st_vct+8*8]
	bt r12,8
	jc lb_118
	bts r12,8
	call dec_r
lb_118:
	mov rdi,[st_vct+8*7]
	bt r12,7
	jc lb_119
	bts r12,7
	call dec_r
lb_119:
	mov r9,[st_vct+8*9]
	mov r10,[st_vct+8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_116
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_117
lb_116:
	bts r12,5
lb_117:
; 	tak { 5' 6' 3' } ⊢ 3' : r64
; emt_get_ptn { 5' 6' 3' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 5'
	mov rax,[st_vct+8*5]
	bt r12,5
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	bt r12,6
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
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
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_125
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_126
lb_125:
	bts r12,3
lb_126:
	pop rdi
	pop rax
	bt rax,0
	jc lb_124
	push rdi
	call dec_r
	pop rdi
	clc
lb_124:
; 	tak { 0' 2' 3' } ⊢ 0' : r64
; emt_get_ptn { 0' 2' 3' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	bt r12,3
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
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
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_128
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_129
lb_128:
	bts r12,0
lb_129:
	pop rdi
	pop rax
	bt rax,0
	jc lb_127
	push rdi
	call dec_r
	pop rdi
	clc
lb_127:
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
	jc clear_lb_130
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_130:
	bt r12,1
	jc clear_lb_131
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_131:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_146
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_212
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_213
lb_212:
	bts r12,0
lb_213:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_147
emt_etr_c_lb_146:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_210
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_211
lb_210:
	bts r12,0
lb_211:
emt_etr_start_lb_147:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_148
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_149
lb_148:
	bts r12,1
lb_149:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_150
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_151
lb_150:
	bts r12,2
lb_151:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_152
	bts r12,0
	call dec_r
lb_152:
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
	jc lb_153
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_154
lb_153:
	bts r12,3
lb_154:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_155
	bts r12,0
	call dec_r
lb_155:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_163
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_164
lb_163:
	bts r12,5
lb_164:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_165
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_166
lb_165:
	bts r12,6
lb_166:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_161
	bts r12,3
	call dec_r
lb_161:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_162
	bts r12,1
	call dec_r
lb_162:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_156
	mov r10,1
cmp_jb_lb_156:
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
	jc lb_157
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_158
lb_157:
	bts r12,0
lb_158:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_159
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_160
lb_159:
	bts r12,4
lb_160:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_168
	mov rdi,0
	stc
	mov rax,1
	jmp agl_167_1
lb_168:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_167_0
; 	∐ 0'
agl_167_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_199
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_200
lb_199:
	bts r12,0
lb_200:
	pop rdi
	pop rax
	bt rax,0
	jc lb_169
	push rdi
	call dec_r
	pop rdi
	clc
lb_169:
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
	jc lb_170
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_171
lb_170:
	bts r12,3
lb_171:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_172
	bts r12,1
	call dec_r
lb_172:
; 	$ 2' ⊢ ,1',5' : ,r64,r64
; emt_ptn_set_ptn 2',1'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_173
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_174
lb_173:
	bts r12,1
lb_174:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_175
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_176
lb_175:
	bts r12,5
lb_176:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_177
	bts r12,2
	call dec_r
lb_177:
; 	sub { 1' 3' } ⊢ 2' : r64
; emt_ptn_set_ptn { 1' 3' },{ 6' 7' }
; emt_ptn_set_ptn 1',6'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_182
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_183
lb_182:
	bts r12,6
lb_183:
; emt_ptn_set_ptn 3',7'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_184
	btr r12,7
	call inc_r
	mov rax,rdi
	jmp lb_185
lb_184:
	bts r12,7
lb_185:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_180
	bts r12,3
	call dec_r
lb_180:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_181
	bts r12,1
	call dec_r
lb_181:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_178
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_179
lb_178:
	bts r12,2
lb_179:
; 	fact 2' ⊢ 1' : r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	bt r12,2
	mov rdi,rax
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
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_187
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_188
lb_187:
	bts r12,1
lb_188:
	pop rdi
	pop rax
	bt rax,0
	jc lb_186
	push rdi
	call dec_r
	pop rdi
	clc
lb_186:
; 	mul { 5' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 1' },{ 3' 6' }
; emt_ptn_set_ptn 5',3'
	mov rdi,[st_vct+8*5]
	bt r12,5
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_193
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_194
lb_193:
	bts r12,3
lb_194:
; emt_ptn_set_ptn 1',6'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_195
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_196
lb_195:
	bts r12,6
lb_196:
; ; emt_dec_ptn { 5' 1' }
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_191
	bts r12,1
	call dec_r
lb_191:
	mov rdi,[st_vct+8*5]
	bt r12,5
	jc lb_192
	bts r12,5
	call dec_r
lb_192:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_189
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_190
lb_189:
	bts r12,2
lb_190:
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
	jc clear_lb_197
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_197:
	bt r12,0
	jc clear_lb_198
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_198:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_167_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_208
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_209
lb_208:
	bts r12,0
lb_209:
	pop rdi
	pop rax
	bt rax,0
	jc lb_201
	push rdi
	call dec_r
	pop rdi
	clc
lb_201:
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
	jc lb_202
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_203
lb_202:
	bts r12,3
lb_203:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_204
	bts r12,1
	call dec_r
lb_204:
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
	jc clear_lb_205
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_205:
	bt r12,4
	jc clear_lb_206
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_206:
	bt r12,0
	jc clear_lb_207
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_207:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_214
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_267
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_268
lb_267:
	bts r12,0
lb_268:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_215
emt_etr_c_lb_214:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_265
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_266
lb_265:
	bts r12,0
lb_266:
emt_etr_start_lb_215:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_216
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_217
lb_216:
	bts r12,1
lb_217:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	bt r12,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_218
	btr r12,2
	call inc_r
	mov rax,rdi
	jmp lb_219
lb_218:
	bts r12,2
lb_219:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_220
	bts r12,0
	call dec_r
lb_220:
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
	jc lb_221
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_222
lb_221:
	bts r12,3
lb_222:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_223
	bts r12,0
	call dec_r
lb_223:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	bt r12,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_231
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_232
lb_231:
	bts r12,5
lb_232:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_233
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_234
lb_233:
	bts r12,6
lb_234:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_229
	bts r12,3
	call dec_r
lb_229:
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_230
	bts r12,1
	call dec_r
lb_230:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_224
	mov r10,1
cmp_jb_lb_224:
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
	jc lb_225
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_226
lb_225:
	bts r12,0
lb_226:
; emt_ptn_set_ptn 8',4'
	mov rdi,[st_vct+8*8]
	bt r12,8
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_227
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_228
lb_227:
	bts r12,4
lb_228:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	bt r12,0
	cmp rax,0
	mov rdi,rax
	je lb_236
	mov rdi,0
	stc
	mov rax,1
	jmp agl_235_1
lb_236:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_235_0
; 	∐ 0'
agl_235_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_254
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_255
lb_254:
	bts r12,0
lb_255:
	pop rdi
	pop rax
	bt rax,0
	jc lb_237
	push rdi
	call dec_r
	pop rdi
	clc
lb_237:
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
	jc lb_238
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_239
lb_238:
	bts r12,3
lb_239:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_240
	bts r12,1
	call dec_r
lb_240:
; 	sub { 2' 3' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_245
	btr r12,5
	call inc_r
	mov rax,rdi
	jmp lb_246
lb_245:
	bts r12,5
lb_246:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	bt r12,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_247
	btr r12,6
	call inc_r
	mov rax,rdi
	jmp lb_248
lb_247:
	bts r12,6
lb_248:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_243
	bts r12,3
	call dec_r
lb_243:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_244
	bts r12,2
	call dec_r
lb_244:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_241
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_242
lb_241:
	bts r12,1
lb_242:
; 	f0 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	bt r12,1
	mov rdi,rax
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
	mov r12,0
	mov rax,0
	setc al
	not r12
	bt rax,0
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
	jc lb_250
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_251
lb_250:
	bts r12,1
lb_251:
	pop rdi
	pop rax
	bt rax,0
	jc lb_249
	push rdi
	call dec_r
	pop rdi
	clc
lb_249:
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
	jc clear_lb_252
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_252:
	bt r12,0
	jc clear_lb_253
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_253:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_235_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_263
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_264
lb_263:
	bts r12,0
lb_264:
	pop rdi
	pop rax
	bt rax,0
	jc lb_256
	push rdi
	call dec_r
	pop rdi
	clc
lb_256:
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
	jc lb_257
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_258
lb_257:
	bts r12,3
lb_258:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	bt r12,1
	jc lb_259
	bts r12,1
	call dec_r
lb_259:
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
	jc clear_lb_260
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_260:
	bt r12,4
	jc clear_lb_261
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_261:
	bt r12,0
	jc clear_lb_262
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_262:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_269
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_270
emt_etr_c_lb_269:
; emt_set_ptn {  }
emt_etr_start_lb_270:
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
	jc lb_271
	btr r12,1
	call inc_r
	mov rax,rdi
	jmp lb_272
lb_271:
	bts r12,1
lb_272:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_273
	bts r12,0
	call dec_r
lb_273:
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
	jc lb_274
	btr r12,2
	call inc_r
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
	jc lb_277
	btr r12,3
	call inc_r
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
; 	cmp { 2' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	bt r12,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_287
	btr r12,5
	call inc_r
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
	call inc_r
	mov rax,rdi
	jmp lb_290
lb_289:
	bts r12,6
lb_290:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_285
	bts r12,3
	call dec_r
lb_285:
	mov rdi,[st_vct+8*2]
	bt r12,2
	jc lb_286
	bts r12,2
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
	call inc_r
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
	call inc_r
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
	mov rax,1
	jmp agl_291_1
lb_292:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_291_0
; 	∐ 0'
agl_291_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_296
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_297
lb_296:
	bts r12,0
lb_297:
	pop rdi
	pop rax
	bt rax,0
	jc lb_293
	push rdi
	call dec_r
	pop rdi
	clc
lb_293:
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
	jc clear_lb_294
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_294:
	bt r12,1
	jc clear_lb_295
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_295:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_291_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_301
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_302
lb_301:
	bts r12,0
lb_302:
	pop rdi
	pop rax
	bt rax,0
	jc lb_298
	push rdi
	call dec_r
	pop rdi
	clc
lb_298:
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
	jc clear_lb_299
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_299:
	bt r12,1
	jc clear_lb_300
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_300:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_303
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_304
emt_etr_c_lb_303:
; emt_set_ptn {  }
emt_etr_start_lb_304:
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
	jc lb_305
	btr r12,1
	call inc_r
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
	jc lb_308
	btr r12,2
	call inc_r
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
	jc lb_311
	btr r12,3
	call inc_r
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
	jc lb_314
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_315
lb_314:
	bts r12,4
lb_315:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_316
	bts r12,0
	call dec_r
lb_316:
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 4' 3' },{ 5' 6' }
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	bt r12,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_321
	btr r12,5
	call inc_r
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
	call inc_r
	mov rax,rdi
	jmp lb_324
lb_323:
	bts r12,6
lb_324:
; ; emt_dec_ptn { 4' 3' }
	mov rdi,[st_vct+8*3]
	bt r12,3
	jc lb_319
	bts r12,3
	call dec_r
lb_319:
	mov rdi,[st_vct+8*4]
	bt r12,4
	jc lb_320
	bts r12,4
	call dec_r
lb_320:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_317
	btr r12,0
	call inc_r
	mov rax,rdi
	jmp lb_318
lb_317:
	bts r12,0
lb_318:
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
	jc clear_lb_325
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_325:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_326
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_327
emt_etr_c_lb_326:
; emt_set_ptn {  }
emt_etr_start_lb_327:
; 	$ { {  } {  } } ⊢ ,0',1',2' : ,{ { } { } },{ { } { } },{ { } { } }
; emt_ptn_set_ptn { {  } {  } },0'
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
	mov [st_vct+8*0],rax
	btr r12,0
; emt_ptn_set_ptn { {  } {  } },1'
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
	mov [st_vct+8*1],rax
	btr r12,1
; emt_ptn_set_ptn { {  } {  } },2'
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
	jc lb_328
	btr r12,3
	call inc_r
	mov rax,rdi
	jmp lb_329
lb_328:
	bts r12,3
lb_329:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_330
	btr r12,4
	call inc_r
	mov rax,rdi
	jmp lb_331
lb_330:
	bts r12,4
lb_331:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	bt r12,0
	jc lb_332
	bts r12,0
	call dec_r
lb_332:
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
	jc clear_lb_333
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_333:
	bt r12,4
	jc clear_lb_334
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_334:
	pop r9
	rcr r9,1
	pop rax
	ret
