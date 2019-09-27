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
	jc lb_139
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_140
lb_139:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_140:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_141
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_142
lb_141:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_142:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_143
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_144
lb_143:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_144:
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
	jc lb_133
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_134
lb_133:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_134:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_135
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_136
lb_135:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_136:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_137
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_138
lb_137:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_138:
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
; emt_get_ptn { 4' 5' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 4'
	mov rax,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
	mov rdx,rax
	pop rdi
	mov rsi,0
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 5'
	mov rax,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 4' 5' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_40
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_41
lb_40:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_41:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_42
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_43
lb_42:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_43:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_35
	push rdi
	call dec_r
	pop rdi
	clc
lb_35:
	mov r9,[st_vct+8*4]
	mov r10,[st_vct+8*5]
	push rdi
	push r9
	push r10
	mov rdi,2
	call mlc
	pop r10
	pop r9
	pop rdi
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_34
	mov r10,1
cmp_jb_lb_34:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 1' 6' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_36
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_37
lb_36:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_37:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_38
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_39
lb_38:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_39:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 6'
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	cmp rax,0
	mov rdi,rax
	je lb_45
	mov rdi,0
	stc
	mov rax,1
	jmp agl_44_1
lb_45:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_44_0
; 	∐ 4'
agl_44_0:
	push rax
	push rdi
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_51
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_52
lb_51:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_52:
	pop rdi
	pop rax
	bt rax,0
	jc lb_46
	push rdi
	call dec_r
	pop rdi
	clc
lb_46:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~x 4'~c 0'~y 1'~b
	mov r9,[r12]
	bt r9,3
	jc clear_lb_47
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_47:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_48
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_48:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_49
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_49:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_50
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_50:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 4'
agl_44_1:
	push rax
	push rdi
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_131
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_132
lb_131:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_132:
	pop rdi
	pop rax
	bt rax,0
	jc lb_53
	push rdi
	call dec_r
	pop rdi
	clc
lb_53:
; 	$ 3' ⊢ ,5',6' : ,r64,r64
; emt_ptn_set_ptn 3',5'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_54
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_55
lb_54:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_55:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_56
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_57
lb_56:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_57:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_58
	bts r9,3
	mov [r12],r9
	call dec_r
lb_58:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,7' : ,r64
; emt_ptn_set_ptn 3',7'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_59
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_60
lb_59:
	mov r10,[r12]
	bts r10,7
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
; 	sub { 6' 7' } ⊢ 3' : r64
; emt_ptn_set_ptn { 6' 7' },{ 8' 9' }
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_66
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_67
lb_66:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_67:
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_68
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_69
lb_68:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_69:
; ; emt_dec_ptn { 6' 7' }
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	jc lb_64
	bts r9,7
	mov [r12],r9
	call dec_r
lb_64:
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	jc lb_65
	bts r9,6
	mov [r12],r9
	call dec_r
lb_65:
	mov r9,[st_vct+8*8]
	mov r10,[st_vct+8*9]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_62
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_63
lb_62:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_63:
; 	$ 2' ⊢ ,6',7' : ,r64,r64
; emt_ptn_set_ptn 2',6'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_70
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_71
lb_70:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_71:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_72
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_73
lb_72:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_73:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_74
	bts r9,2
	mov [r12],r9
	call dec_r
lb_74:
; 	$ 0' ⊢ ,2',8' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_75
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_76
lb_75:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_76:
; emt_ptn_set_ptn 0',8'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_77
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_78
lb_77:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_78:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_79
	bts r9,0
	mov [r12],r9
	call dec_r
lb_79:
; 	tak { 3' 8' 7' } ⊢ 0' : r64
; emt_get_ptn { 3' 8' 7' }
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
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  2'~y 6'~z 5'~x 4'~c 0'~r0 1'~b
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*6]
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
	jc lb_81
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_82
lb_81:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_82:
	pop rdi
	pop rax
	bt rax,0
	jc lb_80
	push rdi
	call dec_r
	pop rdi
	clc
lb_80:
; 	$ 2' ⊢ ,3',7' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_83
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_84
lb_83:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_84:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_85
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_86
lb_85:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_86:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_87
	bts r9,2
	mov [r12],r9
	call dec_r
lb_87:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,8' : ,r64
; emt_ptn_set_ptn 2',8'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_88
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_89
lb_88:
	mov r10,[r12]
	bts r10,8
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
; 	sub { 7' 8' } ⊢ 2' : r64
; emt_ptn_set_ptn { 7' 8' },{ 9' 10' }
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_95
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_96
lb_95:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_96:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_97
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_98
lb_97:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_98:
; ; emt_dec_ptn { 7' 8' }
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
	jc lb_93
	bts r9,8
	mov [r12],r9
	call dec_r
lb_93:
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	jc lb_94
	bts r9,7
	mov [r12],r9
	call dec_r
lb_94:
	mov r9,[st_vct+8*9]
	mov r10,[st_vct+8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_91
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_92
lb_91:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_92:
; 	$ 6' ⊢ ,7',8' : ,r64,r64
; emt_ptn_set_ptn 6',7'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_99
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_100
lb_99:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_100:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_101
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_102
lb_101:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_102:
; ; emt_dec_ptn 6'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	jc lb_103
	bts r9,6
	mov [r12],r9
	call dec_r
lb_103:
; 	$ 5' ⊢ ,6',9' : ,r64,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_104
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_105
lb_104:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_105:
; emt_ptn_set_ptn 5',9'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_106
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_107
lb_106:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_107:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_108
	bts r9,5
	mov [r12],r9
	call dec_r
lb_108:
; 	tak { 2' 8' 9' } ⊢ 5' : r64
; emt_get_ptn { 2' 8' 9' }
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
; push_s  6'~x 7'~z 3'~y 5'~r1 4'~c 0'~r0 1'~b
	mov r9,[st_vct+8*6]
	push r9
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
	mov [st_vct+8*3],r9
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
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_110
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_111
lb_110:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_111:
	pop rdi
	pop rax
	bt rax,0
	jc lb_109
	push rdi
	call dec_r
	pop rdi
	clc
lb_109:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,8' : ,r64
; emt_ptn_set_ptn 2',8'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_112
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_113
lb_112:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_113:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_114
	bts r9,2
	mov [r12],r9
	call dec_r
lb_114:
; 	sub { 7' 8' } ⊢ 2' : r64
; emt_ptn_set_ptn { 7' 8' },{ 9' 10' }
; emt_ptn_set_ptn 7',9'
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_119
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_120
lb_119:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_120:
; emt_ptn_set_ptn 8',10'
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
; emt_set_ptn 10'
	mov [st_vct+8*10],rdi
	jc lb_121
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_122
lb_121:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_122:
; ; emt_dec_ptn { 7' 8' }
	mov rdi,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
	jc lb_117
	bts r9,8
	mov [r12],r9
	call dec_r
lb_117:
	mov rdi,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	jc lb_118
	bts r9,7
	mov [r12],r9
	call dec_r
lb_118:
	mov r9,[st_vct+8*9]
	mov r10,[st_vct+8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_115
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_116
lb_115:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_116:
; 	tak { 2' 6' 3' } ⊢ 7' : r64
; emt_get_ptn { 2' 6' 3' }
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
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
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
; push_s  7'~r2 5'~r1 4'~c 0'~r0 1'~b
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
	jc lb_124
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_125
lb_124:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_125:
	pop rdi
	pop rax
	bt rax,0
	jc lb_123
	push rdi
	call dec_r
	pop rdi
	clc
lb_123:
; 	tak { 0' 5' 7' } ⊢ 2' : r64
; emt_get_ptn { 0' 5' 7' }
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
; emt_get_ptn 5'
	mov rax,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	mov rdx,rax
	pop rdi
	mov rsi,1
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
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  2'~rr 4'~c 1'~b
	mov r9,[st_vct+8*2]
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
	jc lb_127
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_128
lb_127:
	mov r10,[r12]
	bts r10,2
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
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b
	mov r9,[r12]
	bt r9,4
	jc clear_lb_129
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_129:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_130
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_130:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_145
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_210
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_211
lb_210:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_211:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_146
emt_etr_c_lb_145:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_208
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_209
lb_208:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_209:
emt_etr_start_lb_146:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_147
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_148
lb_147:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_148:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_149
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_150
lb_149:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_150:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_151
	bts r9,0
	mov [r12],r9
	call dec_r
lb_151:
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
	jc lb_152
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_153
lb_152:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_153:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_154
	bts r9,0
	mov [r12],r9
	call dec_r
lb_154:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 1' 3' }
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
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 1' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_161
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_162
lb_161:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_162:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_163
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_164
lb_163:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_164:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_156
	push rdi
	call dec_r
	pop rdi
	clc
lb_156:
	mov r9,[st_vct+8*1]
	mov r10,[st_vct+8*3]
	push rdi
	push r9
	push r10
	mov rdi,2
	call mlc
	pop r10
	pop r9
	pop rdi
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_155
	mov r10,1
cmp_jb_lb_155:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 0' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_157
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_158
lb_157:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_158:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_159
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_160
lb_159:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_160:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_166
	mov rdi,0
	stc
	mov rax,1
	jmp agl_165_1
lb_166:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_165_0
; 	∐ 0'
agl_165_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_197
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_198
lb_197:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_198:
	pop rdi
	pop rax
	bt rax,0
	jc lb_167
	push rdi
	call dec_r
	pop rdi
	clc
lb_167:
; 	» 0xr1 |~ 1' : r64
	mov r9,0x1
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_168
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_169
lb_168:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_169:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_170
	bts r9,1
	mov [r12],r9
	call dec_r
lb_170:
; 	$ 2' ⊢ ,1',5' : ,r64,r64
; emt_ptn_set_ptn 2',1'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_171
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_172
lb_171:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_172:
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_173
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_174
lb_173:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_174:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_175
	bts r9,2
	mov [r12],r9
	call dec_r
lb_175:
; 	sub { 1' 3' } ⊢ 2' : r64
; emt_ptn_set_ptn { 1' 3' },{ 6' 7' }
; emt_ptn_set_ptn 1',6'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_180
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_181
lb_180:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_181:
; emt_ptn_set_ptn 3',7'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_182
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_183
lb_182:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_183:
; ; emt_dec_ptn { 1' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_178
	bts r9,3
	mov [r12],r9
	call dec_r
lb_178:
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_179
	bts r9,1
	mov [r12],r9
	call dec_r
lb_179:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_176
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_177
lb_176:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_177:
; 	fact 2' ⊢ 1' : r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
; push_s  5'~x2 4'~c 0'~b 1'~y1
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
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_185
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_186
lb_185:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_186:
	pop rdi
	pop rax
	bt rax,0
	jc lb_184
	push rdi
	call dec_r
	pop rdi
	clc
lb_184:
; 	mul { 5' 1' } ⊢ 2' : r64
; emt_ptn_set_ptn { 5' 1' },{ 3' 6' }
; emt_ptn_set_ptn 5',3'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_191
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_192
lb_191:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_192:
; emt_ptn_set_ptn 1',6'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_193
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_194
lb_193:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_194:
; ; emt_dec_ptn { 5' 1' }
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_189
	bts r9,1
	mov [r12],r9
	call dec_r
lb_189:
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_190
	bts r9,5
	mov [r12],r9
	call dec_r
lb_190:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_187
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_188
lb_187:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_188:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 0'~b
	mov r9,[r12]
	bt r9,4
	jc clear_lb_195
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_195:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_196
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_196:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_165_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_206
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_207
lb_206:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_207:
	pop rdi
	pop rax
	bt rax,0
	jc lb_199
	push rdi
	call dec_r
	pop rdi
	clc
lb_199:
; 	» 0xr1 |~ 1' : r64
	mov r9,0x1
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_200
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_201
lb_200:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_201:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_202
	bts r9,1
	mov [r12],r9
	call dec_r
lb_202:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 4'~c 0'~b
	mov r9,[r12]
	bt r9,2
	jc clear_lb_203
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_203:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_204
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_204:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_205
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_205:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_212
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
	call dec_r
jmp emt_etr_start_lb_213
emt_etr_c_lb_212:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_262
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_263
lb_262:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_263:
emt_etr_start_lb_213:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_214
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_215
lb_214:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_215:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_216
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_217
lb_216:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_217:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_218
	bts r9,0
	mov [r12],r9
	call dec_r
lb_218:
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
	jc lb_219
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_220
lb_219:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_220:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_221
	bts r9,0
	mov [r12],r9
	call dec_r
lb_221:
; 	cmp { 1' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 1' 3' }
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
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 1' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_228
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_229
lb_228:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_229:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_230
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_231
lb_230:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_231:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_223
	push rdi
	call dec_r
	pop rdi
	clc
lb_223:
	mov r9,[st_vct+8*1]
	mov r10,[st_vct+8*3]
	push rdi
	push r9
	push r10
	mov rdi,2
	call mlc
	pop r10
	pop r9
	pop rdi
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_222
	mov r10,1
cmp_jb_lb_222:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 0' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_224
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_225
lb_224:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_225:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_226
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_227
lb_226:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_227:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_233
	mov rdi,0
	stc
	mov rax,1
	jmp agl_232_1
lb_233:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_232_0
; 	∐ 0'
agl_232_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_251
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_252
lb_251:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_252:
	pop rdi
	pop rax
	bt rax,0
	jc lb_234
	push rdi
	call dec_r
	pop rdi
	clc
lb_234:
; 	» 0xr1 |~ 1' : r64
	mov r9,0x1
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_235
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_236
lb_235:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_236:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_237
	bts r9,1
	mov [r12],r9
	call dec_r
lb_237:
; 	sub { 2' 3' } ⊢ 1' : r64
; emt_ptn_set_ptn { 2' 3' },{ 5' 6' }
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_242
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_243
lb_242:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_243:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_244
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_245
lb_244:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_245:
; ; emt_dec_ptn { 2' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_240
	bts r9,3
	mov [r12],r9
	call dec_r
lb_240:
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_241
	bts r9,2
	mov [r12],r9
	call dec_r
lb_241:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_238
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_239
lb_238:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_239:
; 	f0 1' ⊢ 2' : r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
; push_s  2'~y1 4'~c 0'~b0
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*4]
	push r9
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
	call f0
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
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
	jc lb_247
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_248
lb_247:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_248:
	pop rdi
	pop rax
	bt rax,0
	jc lb_246
	push rdi
	call dec_r
	pop rdi
	clc
lb_246:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 0'~b0
	mov r9,[r12]
	bt r9,4
	jc clear_lb_249
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_249:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_250
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_250:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_232_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_260
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_261
lb_260:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_261:
	pop rdi
	pop rax
	bt rax,0
	jc lb_253
	push rdi
	call dec_r
	pop rdi
	clc
lb_253:
; 	» 0xr0 |~ 1' : r64
	mov r9,0x0
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,3' : ,r64
; emt_ptn_set_ptn 1',3'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_254
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_255
lb_254:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_255:
; ; emt_dec_ptn 1'
	mov rdi,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	jc lb_256
	bts r9,1
	mov [r12],r9
	call dec_r
lb_256:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 4'~c 0'~b1
	mov r9,[r12]
	bt r9,2
	jc clear_lb_257
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_257:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_258
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_258:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_259
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_259:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_266
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_267
emt_etr_c_lb_266:
; emt_set_ptn {  }
emt_etr_start_lb_267:
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
	jc lb_268
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_269
lb_268:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_269:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_270
	bts r9,0
	mov [r12],r9
	call dec_r
lb_270:
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
	jc lb_271
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_272
lb_271:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_272:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_273
	bts r9,0
	mov [r12],r9
	call dec_r
lb_273:
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
	jc lb_274
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_275
lb_274:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_275:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_276
	bts r9,0
	mov [r12],r9
	call dec_r
lb_276:
; 	cmp { 2' 3' } ⊢ { 0' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 2' 3' }
	mov rdi,2
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
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 2' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_283
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_284
lb_283:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_284:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_285
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_286
lb_285:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_286:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_278
	push rdi
	call dec_r
	pop rdi
	clc
lb_278:
	mov r9,[st_vct+8*2]
	mov r10,[st_vct+8*3]
	push rdi
	push r9
	push r10
	mov rdi,2
	call mlc
	pop r10
	pop r9
	pop rdi
	cmp r9,r10
	mov r9,0
	setz r9b
	mov r10,0
	jle cmp_jb_lb_277
	mov r10,1
cmp_jb_lb_277:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 0' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
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
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_281
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_282
lb_281:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_282:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_288
	mov rdi,0
	stc
	mov rax,1
	jmp agl_287_1
lb_288:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_287_0
; 	∐ 0'
agl_287_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_292
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_293
lb_292:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_293:
	pop rdi
	pop rax
	bt rax,0
	jc lb_289
	push rdi
	call dec_r
	pop rdi
	clc
lb_289:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b0
	mov r9,[r12]
	bt r9,4
	jc clear_lb_290
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_290:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_291
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_291:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_287_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_297
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_298
lb_297:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_298:
	pop rdi
	pop rax
	bt rax,0
	jc lb_294
	push rdi
	call dec_r
	pop rdi
	clc
lb_294:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b0
	mov r9,[r12]
	bt r9,4
	jc clear_lb_295
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_295:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_296
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_296:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_299
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_300
emt_etr_c_lb_299:
; emt_set_ptn {  }
emt_etr_start_lb_300:
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
	jc lb_301
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_302
lb_301:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_302:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_303
	bts r9,0
	mov [r12],r9
	call dec_r
lb_303:
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
	jc lb_304
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_305
lb_304:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_305:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_306
	bts r9,0
	mov [r12],r9
	call dec_r
lb_306:
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
	jc lb_307
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_308
lb_307:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_308:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_309
	bts r9,0
	mov [r12],r9
	call dec_r
lb_309:
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
	jc lb_310
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_311
lb_310:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_311:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_312
	bts r9,0
	mov [r12],r9
	call dec_r
lb_312:
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_ptn_set_ptn { 4' 3' },{ 5' 6' }
; emt_ptn_set_ptn 4',5'
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_317
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_318
lb_317:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_318:
; emt_ptn_set_ptn 3',6'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_319
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_320
lb_319:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_320:
; ; emt_dec_ptn { 4' 3' }
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_315
	bts r9,3
	mov [r12],r9
	call dec_r
lb_315:
	mov rdi,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
	jc lb_316
	bts r9,4
	mov [r12],r9
	call dec_r
lb_316:
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_313
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_314
lb_313:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_314:
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
	jc clear_lb_321
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_321:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_322
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_323
emt_etr_c_lb_322:
; emt_set_ptn {  }
emt_etr_start_lb_323:
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
	jc lb_324
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_325
lb_324:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_325:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_326
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_327
lb_326:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_327:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_328
	bts r9,0
	mov [r12],r9
	call dec_r
lb_328:
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
	jc clear_lb_329
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_329:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_330
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_330:
	pop r9
	rcr r9,1
	pop rax
	ret
