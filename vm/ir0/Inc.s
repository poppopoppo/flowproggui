%include "mem.s"
main:
	mov r15,0
	mov r14,0
	mov r13,0
	mov r12,rsp
	lea rsp,[rsp-8*200]
	mov r9,0
	not r9
	mov [r12],r9
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
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_2
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_3
lb_2:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_3:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_4
	bts r9,0
	mov [r12],r9
	call dec_r
lb_4:
; 	» 0xra |~ 0' : r64
	mov r9,0xa
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_5
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_6
lb_5:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_6:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_7
	bts r9,0
	mov [r12],r9
	call dec_r
lb_7:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_8
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_9
lb_8:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_9:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_10
	bts r9,0
	mov [r12],r9
	call dec_r
lb_10:
; 	tak { 1' 2' 3' } ⊢ 0' : r64
; emt_get_ptn { 1' 2' 3' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  0'~r
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*0],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_12
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_13
lb_12:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
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
	mov r9,[r12]
	bt r9,0
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
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_16
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_17
lb_16:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_17:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_18
	bts r9,0
	mov [r12],r9
	call dec_r
lb_18:
; 	fact 1' ⊢ 0' : r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
; push_s  0'~y
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call fact
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*0],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_20
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_21
lb_20:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
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
	mov r9,[r12]
	bt r9,0
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
	jc lb_144
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_145
lb_144:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_145:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_146
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_147
lb_146:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_147:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_148
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_149
lb_148:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_149:
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
	jc lb_138
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_139
lb_138:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_139:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_140
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_141
lb_140:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_141:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_142
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_143
lb_142:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_143:
	pop rdi
emt_etr_start_lb_23:
; 	$ 0' ⊢ ,3',4' : ,r64,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_24
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_25
lb_24:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_25:
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_26
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_27
lb_26:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_27:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_28
	bts r9,0
	mov [r12],r9
	call dec_r
lb_28:
; 	$ 1' ⊢ ,0',5' : ,r64,r64
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_29
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_30
lb_29:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_30:
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_31
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_32
lb_31:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_32:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_33
	bts r9,1
	mov [r12],r9
	call dec_r
lb_33:
; 	cmp { 4' 5' } ⊢ { 1' 6' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 4' 5' },{ 7' 8' }
; emt_ptn_set_ptn 4',7'
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_41
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_42
lb_41:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_42:
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_43
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_44
lb_43:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_44:
; ; emt_dec_ptn { 4' 5' }
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_39
	bts r9,5
	mov [r12],r9
	call dec_r
lb_39:
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
	jc lb_40
	bts r9,4
	mov [r12],r9
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
	mov [st_vct+8*4],r9
	mov [st_vct+8*5],r10
	mov r9,[r12]
	bts r9,4
	bts r9,5
	mov [r12],r9
; emt_ptn_set_ptn { 4' 5' },{ 1' 6' }
; emt_ptn_set_ptn 4',1'
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_35
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_36
lb_35:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_36:
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_37
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_38
lb_37:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_38:
; 	∠ 6'
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
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
; 	∐ 6'
agl_45_0:
	push rax
	push rdi
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_54
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_55
lb_54:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_55:
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
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  6'~c 3'~x 5'~_r223 4'~_r222 0'~y 1'~b
	mov r9,[r12]
	bt r9,6
	jc clear_lb_48
	mov rdi,[st_vct+8*6]
	call dec_r
clear_lb_48:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_49
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_49:
	mov r9,[r12]
	bt r9,5
	jc clear_lb_50
	mov rdi,[st_vct+8*5]
	call dec_r
clear_lb_50:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_51
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_51:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_52
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_52:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_53
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_53:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 6'
agl_45_1:
	push rax
	push rdi
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_136
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_137
lb_136:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_137:
	pop rdi
	pop rax
	bt rax,0
	jc lb_56
	push rdi
	call dec_r
	pop rdi
	clc
lb_56:
; 	$ 3' ⊢ ,7',8' : ,r64,r64
; emt_ptn_set_ptn 3',7'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_57
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_58
lb_57:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_58:
; emt_ptn_set_ptn 3',8'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_59
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_60
lb_59:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_60:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_61
	bts r9,3
	mov [r12],r9
	call dec_r
lb_61:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,9' : ,r64
; emt_ptn_set_ptn 3',9'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_62
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_63
lb_62:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_63:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_64
	bts r9,3
	mov [r12],r9
	call dec_r
lb_64:
; 	sub { 8' 9' } ⊢ 3' : r64
; emt_ptn_set_ptn { 8' 9' },{ 10' 11' }
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_69
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_70
lb_69:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_70:
; emt_ptn_set_ptn 9',11'
	mov rdi,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
; emt_set_ptn 11'
	mov [st_vct+8*11],rdi
	jc lb_71
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_72
lb_71:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_72:
; ; emt_dec_ptn { 8' 9' }
	mov rdi,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
	jc lb_67
	bts r9,9
	mov [r12],r9
	call dec_r
lb_67:
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
	jc lb_68
	bts r9,8
	mov [r12],r9
	call dec_r
lb_68:
	mov r9,[st_vct+8*10]
	mov r10,[st_vct+8*11]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_65
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_66
lb_65:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_66:
; 	$ 2' ⊢ ,8',9' : ,r64,r64
; emt_ptn_set_ptn 2',8'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_73
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_74
lb_73:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_74:
; emt_ptn_set_ptn 2',9'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_75
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_76
lb_75:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_76:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_77
	bts r9,2
	mov [r12],r9
	call dec_r
lb_77:
; 	$ 0' ⊢ ,2',10' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_78
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_79
lb_78:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_79:
; emt_ptn_set_ptn 0',10'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_80
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_81
lb_80:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_81:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_82
	bts r9,0
	mov [r12],r9
	call dec_r
lb_82:
; 	tak { 3' 10' 9' } ⊢ 0' : r64
; emt_get_ptn { 3' 10' 9' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 10'
	mov rax,[st_vct+8*10]
	mov r9,[r12]
	bt r9,10
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 9'
	mov rax,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  2'~y 6'~c 8'~z 7'~x 5'~_r223 4'~_r222 0'~r0 1'~b
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*6]
	push r9
	mov r9,[st_vct+8*8]
	push r9
	mov r9,[st_vct+8*7]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*7],r9
	pop r9
	mov [st_vct+8*8],r9
	pop r9
	mov [st_vct+8*6],r9
	pop r9
	mov [st_vct+8*2],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_84
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_85
lb_84:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_85:
	pop rdi
	pop rax
	bt rax,0
	jc lb_83
	push rdi
	call dec_r
	pop rdi
	clc
lb_83:
; 	$ 2' ⊢ ,3',9' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_86
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_87
lb_86:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_87:
; emt_ptn_set_ptn 2',9'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_88
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_89
lb_88:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_89:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_90
	bts r9,2
	mov [r12],r9
	call dec_r
lb_90:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,10' : ,r64
; emt_ptn_set_ptn 2',10'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_91
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_92
lb_91:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_92:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_93
	bts r9,2
	mov [r12],r9
	call dec_r
lb_93:
; 	sub { 9' 10' } ⊢ 2' : r64
; emt_ptn_set_ptn { 9' 10' },{ 11' 12' }
; emt_ptn_set_ptn 9',11'
	mov rdi,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
; emt_set_ptn 11'
	mov [st_vct+8*11],rdi
	jc lb_98
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_99
lb_98:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_99:
; emt_ptn_set_ptn 10',12'
	mov rdi,[st_vct+8*10]
	mov r9,[r12]
	bt r9,10
; emt_set_ptn 12'
	mov [st_vct+8*12],rdi
	jc lb_100
	mov r10,[r12]
	btr r10,12
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_101
lb_100:
	mov r10,[r12]
	bts r10,12
	mov [r12],r10
lb_101:
; ; emt_dec_ptn { 9' 10' }
	mov rdi,[st_vct+8*10]
	mov r9,[r12]
	bt r9,10
	jc lb_96
	bts r9,10
	mov [r12],r9
	call dec_r
lb_96:
	mov rdi,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
	jc lb_97
	bts r9,9
	mov [r12],r9
	call dec_r
lb_97:
	mov r9,[st_vct+8*11]
	mov r10,[st_vct+8*12]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_94
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_95
lb_94:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_95:
; 	$ 8' ⊢ ,9',10' : ,r64,r64
; emt_ptn_set_ptn 8',9'
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_102
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_103
lb_102:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_103:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_104
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_105
lb_104:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_105:
; ; emt_dec_ptn 8'
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
	jc lb_106
	bts r9,8
	mov [r12],r9
	call dec_r
lb_106:
; 	$ 7' ⊢ ,8',11' : ,r64,r64
; emt_ptn_set_ptn 7',8'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_107
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_108
lb_107:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_108:
; emt_ptn_set_ptn 7',11'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
; emt_set_ptn 11'
	mov [st_vct+8*11],rdi
	jc lb_109
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_110
lb_109:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_110:
; ; emt_dec_ptn 7'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	jc lb_111
	bts r9,7
	mov [r12],r9
	call dec_r
lb_111:
; 	tak { 2' 10' 11' } ⊢ 7' : r64
; emt_get_ptn { 2' 10' 11' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 10'
	mov rax,[st_vct+8*10]
	mov r9,[r12]
	bt r9,10
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 11'
	mov rax,[st_vct+8*11]
	mov r9,[r12]
	bt r9,11
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  6'~c 8'~x 7'~r1 3'~y 5'~_r223 4'~_r222 9'~z 0'~r0 1'~b
	mov r9,[st_vct+8*6]
	push r9
	mov r9,[st_vct+8*8]
	push r9
	mov r9,[st_vct+8*7]
	push r9
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*9]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*9],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*3],r9
	pop r9
	mov [st_vct+8*7],r9
	pop r9
	mov [st_vct+8*8],r9
	pop r9
	mov [st_vct+8*6],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_113
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_114
lb_113:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_114:
	pop rdi
	pop rax
	bt rax,0
	jc lb_112
	push rdi
	call dec_r
	pop rdi
	clc
lb_112:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,10' : ,r64
; emt_ptn_set_ptn 2',10'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_115
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_116
lb_115:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_116:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_117
	bts r9,2
	mov [r12],r9
	call dec_r
lb_117:
; 	sub { 9' 10' } ⊢ 2' : r64
; emt_ptn_set_ptn { 9' 10' },{ 11' 12' }
; emt_ptn_set_ptn 9',11'
	mov rdi,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
; emt_set_ptn 11'
	mov [st_vct+8*11],rdi
	jc lb_122
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_123
lb_122:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_123:
; emt_ptn_set_ptn 10',12'
	mov rdi,[st_vct+8*10]
	mov r9,[r12]
	bt r9,10
; emt_set_ptn 12'
	mov [st_vct+8*12],rdi
	jc lb_124
	mov r10,[r12]
	btr r10,12
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_125
lb_124:
	mov r10,[r12]
	bts r10,12
	mov [r12],r10
lb_125:
; ; emt_dec_ptn { 9' 10' }
	mov rdi,[st_vct+8*10]
	mov r9,[r12]
	bt r9,10
	jc lb_120
	bts r9,10
	mov [r12],r9
	call dec_r
lb_120:
	mov rdi,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
	jc lb_121
	bts r9,9
	mov [r12],r9
	call dec_r
lb_121:
	mov r9,[st_vct+8*11]
	mov r10,[st_vct+8*12]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_118
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_119
lb_118:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_119:
; 	tak { 2' 8' 3' } ⊢ 9' : r64
; emt_get_ptn { 2' 8' 3' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 8'
	mov rax,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  6'~c 7'~r1 5'~_r223 4'~_r222 9'~r2 0'~r0 1'~b
	mov r9,[st_vct+8*6]
	push r9
	mov r9,[st_vct+8*7]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*9]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*9],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*7],r9
	pop r9
	mov [st_vct+8*6],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_127
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_128
lb_127:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_128:
	pop rdi
	pop rax
	bt rax,0
	jc lb_126
	push rdi
	call dec_r
	pop rdi
	clc
lb_126:
; 	tak { 0' 7' 9' } ⊢ 2' : r64
; emt_get_ptn { 0' 7' 9' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 9'
	mov rax,[st_vct+8*9]
	mov r9,[r12]
	bt r9,9
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  2'~rr 6'~c 5'~_r223 4'~_r222 1'~b
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
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
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
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_130
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_131
lb_130:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_131:
	pop rdi
	pop rax
	bt rax,0
	jc lb_129
	push rdi
	call dec_r
	pop rdi
	clc
lb_129:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  6'~c 5'~_r223 4'~_r222 1'~b
	mov r9,[r12]
	bt r9,6
	jc clear_lb_132
	mov rdi,[st_vct+8*6]
	call dec_r
clear_lb_132:
	mov r9,[r12]
	bt r9,5
	jc clear_lb_133
	mov rdi,[st_vct+8*5]
	call dec_r
clear_lb_133:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_134
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_134:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_135
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_135:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_150
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_220
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_221
lb_220:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_221:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_151
emt_etr_c_lb_150:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_218
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_219
lb_218:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_219:
emt_etr_start_lb_151:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_152
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_153
lb_152:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_153:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_154
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_155
lb_154:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_155:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_156
	bts r9,0
	mov [r12],r9
	call dec_r
lb_156:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_157
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_158
lb_157:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_158:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_159
	bts r9,0
	mov [r12],r9
	call dec_r
lb_159:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_167
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_168
lb_167:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_168:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_169
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_170
lb_169:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_170:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_165
	bts r9,3
	mov [r12],r9
	call dec_r
lb_165:
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_166
	bts r9,1
	mov [r12],r9
	call dec_r
lb_166:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_160
	mov r10,1
cmp_jb_lb_160:
	mov [st_vct+8*1],r9
	mov [st_vct+8*3],r10
	mov r9,[r12]
	bts r9,1
	bts r9,3
	mov [r12],r9
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_161
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_162
lb_161:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_162:
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_163
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_164
lb_163:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_164:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_172
	mov rdi,0
	stc
	mov rax,1
	jmp agl_171_1
lb_172:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_171_0
; 	∐ 0'
agl_171_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_205
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_206
lb_205:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_206:
	pop rdi
	pop rax
	bt rax,0
	jc lb_173
	push rdi
	call dec_r
	pop rdi
	clc
lb_173:
; 	» 0xr1 |~ 5' : r64
	mov r9,0x1
	mov [st_vct+8*5],r9
	mov r9,[r12]
	bts r9,5
	mov [r12],r9
; 	$ 5' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_174
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_175
lb_174:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_175:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_176
	bts r9,5
	mov [r12],r9
	call dec_r
lb_176:
; 	$ 2' ⊢ ,5',7' : ,r64,r64
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_177
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_178
lb_177:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_178:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_179
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_180
lb_179:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_180:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_181
	bts r9,2
	mov [r12],r9
	call dec_r
lb_181:
; 	sub { 5' 6' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 6' },{ 8' 9' }
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_186
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_187
lb_186:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_187:
; emt_ptn_set_ptn 6',9'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_188
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_189
lb_188:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_189:
; ; emt_dec_ptn { 5' 6' }
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	jc lb_184
	bts r9,6
	mov [r12],r9
	call dec_r
lb_184:
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_185
	bts r9,5
	mov [r12],r9
	call dec_r
lb_185:
	mov r9,[st_vct+8*8]
	mov r10,[st_vct+8*9]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_182
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_183
lb_182:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_183:
; 	fact 2' ⊢ 5' : r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
; push_s  7'~x2 3'~_r233 5'~y1 4'~c 0'~b 1'~_r232
	mov r9,[st_vct+8*7]
	push r9
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call fact
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*3],r9
	pop r9
	mov [st_vct+8*7],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_191
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_192
lb_191:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_192:
	pop rdi
	pop rax
	bt rax,0
	jc lb_190
	push rdi
	call dec_r
	pop rdi
	clc
lb_190:
; 	mul { 7' 5' } ⊢ 2' : r64
; emt_ptn_set_ptn { 7' 5' },{ 6' 8' }
; emt_ptn_set_ptn 7',6'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_197
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_198
lb_197:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_198:
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_199
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_200
lb_199:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_200:
; ; emt_dec_ptn { 7' 5' }
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_195
	bts r9,5
	mov [r12],r9
	call dec_r
lb_195:
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	jc lb_196
	bts r9,7
	mov [r12],r9
	call dec_r
lb_196:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*8]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_193
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_194
lb_193:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_194:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~_r233 4'~c 0'~b 1'~_r232
	mov r9,[r12]
	bt r9,3
	jc clear_lb_201
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_201:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_202
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_202:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_203
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_203:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_204
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_204:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_171_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_216
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_217
lb_216:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_217:
	pop rdi
	pop rax
	bt rax,0
	jc lb_207
	push rdi
	call dec_r
	pop rdi
	clc
lb_207:
; 	» 0xr1 |~ 5' : r64
	mov r9,0x1
	mov [st_vct+8*5],r9
	mov r9,[r12]
	bts r9,5
	mov [r12],r9
; 	$ 5' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_208
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_209
lb_208:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_209:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_210
	bts r9,5
	mov [r12],r9
	call dec_r
lb_210:
; 	∎ 6'
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 3'~_r233 4'~c 0'~b 1'~_r232
	mov r9,[r12]
	bt r9,2
	jc clear_lb_211
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_211:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_212
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_212:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_213
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_213:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_214
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_214:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_215
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_215:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_222
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_279
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_280
lb_279:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_280:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_223
emt_etr_c_lb_222:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_277
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_278
lb_277:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_278:
emt_etr_start_lb_223:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_224
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_225
lb_224:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_225:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_226
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_227
lb_226:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_227:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_228
	bts r9,0
	mov [r12],r9
	call dec_r
lb_228:
; 	» 0xr0 |~ 0' : r64
	mov r9,0x0
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_229
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_230
lb_229:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_230:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_231
	bts r9,0
	mov [r12],r9
	call dec_r
lb_231:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 1' 3' },{ 5' 6' }
; emt_ptn_set_ptn 1',5'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_239
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_240
lb_239:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_240:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_241
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_242
lb_241:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_242:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_237
	bts r9,3
	mov [r12],r9
	call dec_r
lb_237:
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_238
	bts r9,1
	mov [r12],r9
	call dec_r
lb_238:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_232
	mov r10,1
cmp_jb_lb_232:
	mov [st_vct+8*1],r9
	mov [st_vct+8*3],r10
	mov r9,[r12]
	bts r9,1
	bts r9,3
	mov [r12],r9
; emt_ptn_set_ptn { 1' 3' },{ 0' 4' }
; emt_ptn_set_ptn 1',0'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_233
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_234
lb_233:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_234:
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_235
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_236
lb_235:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_236:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_244
	mov rdi,0
	stc
	mov rax,1
	jmp agl_243_1
lb_244:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_243_0
; 	∐ 0'
agl_243_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_264
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_265
lb_264:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_265:
	pop rdi
	pop rax
	bt rax,0
	jc lb_245
	push rdi
	call dec_r
	pop rdi
	clc
lb_245:
; 	» 0xr1 |~ 5' : r64
	mov r9,0x1
	mov [st_vct+8*5],r9
	mov r9,[r12]
	bts r9,5
	mov [r12],r9
; 	$ 5' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_246
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_247
lb_246:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_247:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_248
	bts r9,5
	mov [r12],r9
	call dec_r
lb_248:
; 	sub { 2' 6' } ⊢ 5' : r64
; emt_ptn_set_ptn { 2' 6' },{ 7' 8' }
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_253
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_254
lb_253:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_254:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_255
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_256
lb_255:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_256:
; ; emt_dec_ptn { 2' 6' }
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	jc lb_251
	bts r9,6
	mov [r12],r9
	call dec_r
lb_251:
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_252
	bts r9,2
	mov [r12],r9
	call dec_r
lb_252:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_249
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_250
lb_249:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_250:
; 	f0 5' ⊢ 2' : r64
; emt_get_ptn 5'
	mov rax,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	mov rdi,rax
; push_s  2'~y1 3'~_r241 4'~c 0'~b0 1'~_r240
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[st_vct+8*1]
	push r9
	mov r9,[r12]
	push r9
	mov rax,0
	setc al
	push rax
	add r15,1
	pop rax
	bt rax,0
	mov r9,0
	not r9
	mov [r12],r9
	call f0
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*1],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*3],r9
	pop r9
	mov [st_vct+8*2],r9
	mov rax,0
	setc al
	push rax
	sub r15,1
	pop rax
	bt rax,0
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_258
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_259
lb_258:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_259:
	pop rdi
	pop rax
	bt rax,0
	jc lb_257
	push rdi
	call dec_r
	pop rdi
	clc
lb_257:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~_r241 4'~c 0'~b0 1'~_r240
	mov r9,[r12]
	bt r9,3
	jc clear_lb_260
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_260:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_261
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_261:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_262
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_262:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_263
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_263:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_243_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_275
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_276
lb_275:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_276:
	pop rdi
	pop rax
	bt rax,0
	jc lb_266
	push rdi
	call dec_r
	pop rdi
	clc
lb_266:
; 	» 0xr0 |~ 5' : r64
	mov r9,0x0
	mov [st_vct+8*5],r9
	mov r9,[r12]
	bts r9,5
	mov [r12],r9
; 	$ 5' ⊢ ,6' : ,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_267
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_268
lb_267:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_268:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_269
	bts r9,5
	mov [r12],r9
	call dec_r
lb_269:
; 	∎ 6'
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 3'~_r241 4'~c 0'~b1 1'~_r240
	mov r9,[r12]
	bt r9,2
	jc clear_lb_270
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_270:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_271
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_271:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_272
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_272:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_273
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_273:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_274
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_274:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_281
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_282
emt_etr_c_lb_281:
; emt_set_ptn {  }
emt_etr_start_lb_282:
; 	» 0x2r1 |~ 0' : @[0].r2 ≃ ∐[@[0] @[0] ]
	mov r9,0x1
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,1' : ,@[0].r2 ≃ ∐[@[0] @[0] ]
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_283
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_284
lb_283:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_284:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_285
	bts r9,0
	mov [r12],r9
	call dec_r
lb_285:
; 	» 0xrff |~ 0' : r64
	mov r9,0xff
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_286
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_287
lb_286:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_287:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_288
	bts r9,0
	mov [r12],r9
	call dec_r
lb_288:
; 	» 0xrff |~ 0' : r64
	mov r9,0xff
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_289
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_290
lb_289:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_290:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_291
	bts r9,0
	mov [r12],r9
	call dec_r
lb_291:
; 	cmp { 2' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_299
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_300
lb_299:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_300:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_301
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_302
lb_301:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_302:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_297
	bts r9,3
	mov [r12],r9
	call dec_r
lb_297:
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_298
	bts r9,2
	mov [r12],r9
	call dec_r
lb_298:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_292
	mov r10,1
cmp_jb_lb_292:
	mov [st_vct+8*2],r9
	mov [st_vct+8*3],r10
	mov r9,[r12]
	bts r9,2
	bts r9,3
	mov [r12],r9
; emt_ptn_set_ptn { 2' 3' },{ 0' 4' }
; emt_ptn_set_ptn 2',0'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_293
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_294
lb_293:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_294:
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_295
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_296
lb_295:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_296:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_304
	mov rdi,0
	stc
	mov rax,1
	jmp agl_303_1
lb_304:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_303_0
; 	∐ 0'
agl_303_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_310
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_311
lb_310:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_311:
	pop rdi
	pop rax
	bt rax,0
	jc lb_305
	push rdi
	call dec_r
	pop rdi
	clc
lb_305:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~_r246 3'~_r247 4'~c 1'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_306
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_306:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_307
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_307:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_308
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_308:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_309
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_309:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_303_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_317
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_318
lb_317:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_318:
	pop rdi
	pop rax
	bt rax,0
	jc lb_312
	push rdi
	call dec_r
	pop rdi
	clc
lb_312:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~_r246 3'~_r247 4'~c 1'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_313
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_313:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_314
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_314:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_315
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_315:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_316
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_316:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_319
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_320
emt_etr_c_lb_319:
; emt_set_ptn {  }
emt_etr_start_lb_320:
; 	» 0xrffff |~ 0' : r64
	mov r9,0xffff
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,1' : ,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_321
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_322
lb_321:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_322:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_323
	bts r9,0
	mov [r12],r9
	call dec_r
lb_323:
; 	» 0xrffffccccafab0000 |~ 0' : r64
	mov r9,0xffffccccafab0000
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,2' : ,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_324
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_325
lb_324:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_325:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_326
	bts r9,0
	mov [r12],r9
	call dec_r
lb_326:
; 	» 0xra |~ 0' : r64
	mov r9,0xa
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 0',3'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_327
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_328
lb_327:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_328:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_329
	bts r9,0
	mov [r12],r9
	call dec_r
lb_329:
; 	» 0xr18 |~ 0' : r64
	mov r9,0x18
	mov [st_vct+8*0],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 0',4'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_330
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_331
lb_330:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_331:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_332
	bts r9,0
	mov [r12],r9
	call dec_r
lb_332:
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 4' 3' },{ 5' 6' }
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_337
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_338
lb_337:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_338:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_339
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_340
lb_339:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_340:
; ; emt_dec_ptn { 4' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_335
	bts r9,3
	mov [r12],r9
	call dec_r
lb_335:
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
	jc lb_336
	bts r9,4
	mov [r12],r9
	call dec_r
lb_336:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_333
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_334
lb_333:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_334:
; 	∎ { 1' 0' }
; emt_get_ptn { 1' 0' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
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
	mov r9,[r12]
	bt r9,2
	jc clear_lb_341
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_341:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_342
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_343
emt_etr_c_lb_342:
; emt_set_ptn {  }
emt_etr_start_lb_343:
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
	mov r9,[r12]
	btr r9,0
	mov [r12],r9
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
	mov r9,[r12]
	btr r9,1
	mov [r12],r9
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
	mov r9,[r12]
	btr r9,2
	mov [r12],r9
; ; emt_dec_ptn { {  } {  } }
; 	$ 0' ⊢ ,{ 3' 4' } : ,{ { } { } }
; emt_ptn_set_ptn 0',{ 3' 4' }
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_344
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_345
lb_344:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_345:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_346
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_347
lb_346:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_347:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_348
	bts r9,0
	mov [r12],r9
	call dec_r
lb_348:
; 	∎ { 3' 1' }
; emt_get_ptn { 3' 1' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
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
	mov r9,[r12]
	bt r9,2
	jc clear_lb_349
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_349:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_350
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_350:
	pop r9
	rcr r9,1
	pop rax
	ret
