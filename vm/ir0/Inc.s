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
; 	» 0xr12 |~ 0' : r64
	mov r9,0x12
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
; 	» 0xr9 |~ 0' : r64
	mov r9,0x9
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
; push_s 
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
; push_s 
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
	jc lb_136
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_137
lb_136:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_137:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_138
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_139
lb_138:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_139:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_140
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_141
lb_140:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_141:
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
	jc lb_130
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_131
lb_130:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_131:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_132
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_133
lb_132:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_133:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_134
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_135
lb_134:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_135:
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
; 	cmp { 4' 5' } ⊢ { 1' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
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
; emt_set_ptn { 5' 6' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_40
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_41
lb_40:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_41:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_42
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_43
lb_42:
	mov r10,[r12]
	bts r10,6
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
	mov r9,[st_vct+8*5]
	mov r10,[st_vct+8*6]
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
; emt_set_ptn { 1' 4' }
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
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_38
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_39
lb_38:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_39:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 4'
; emt_get_ptn 4'
	mov rax,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
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
	jc lb_128
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_129
lb_128:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_129:
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
; emt_get_ptn { 6' 7' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
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
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 6' 7' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_65
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_66
lb_65:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_66:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_67
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_68
lb_67:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_68:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_62
	push rdi
	call dec_r
	pop rdi
	clc
lb_62:
	mov r9,[st_vct+8*6]
	mov r10,[st_vct+8*7]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_63
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_64
lb_63:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_64:
; 	$ 2' ⊢ ,6',7' : ,r64,r64
; emt_ptn_set_ptn 2',6'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_69
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_70
lb_69:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_70:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_71
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_72
lb_71:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_72:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_73
	bts r9,2
	mov [r12],r9
	call dec_r
lb_73:
; 	$ 0' ⊢ ,2',8' : ,r64,r64
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_74
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_75
lb_74:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_75:
; emt_ptn_set_ptn 0',8'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_76
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_77
lb_76:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_77:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_78
	bts r9,0
	mov [r12],r9
	call dec_r
lb_78:
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
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_80
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_81
lb_80:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_81:
	pop rdi
	pop rax
	bt rax,0
	jc lb_79
	push rdi
	call dec_r
	pop rdi
	clc
lb_79:
; 	$ 2' ⊢ ,3',7' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_82
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_83
lb_82:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_83:
; emt_ptn_set_ptn 2',7'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_84
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_85
lb_84:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_85:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_86
	bts r9,2
	mov [r12],r9
	call dec_r
lb_86:
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
	jc lb_87
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_88
lb_87:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_88:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_89
	bts r9,2
	mov [r12],r9
	call dec_r
lb_89:
; 	sub { 7' 8' } ⊢ 2' : r64
; emt_get_ptn { 7' 8' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
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
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 7' 8' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_93
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_94
lb_93:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_94:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_95
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_96
lb_95:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_96:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_90
	push rdi
	call dec_r
	pop rdi
	clc
lb_90:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
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
	jc lb_97
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_98
lb_97:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_98:
; emt_ptn_set_ptn 6',8'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_99
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_100
lb_99:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_100:
; ; emt_dec_ptn 6'
	mov rdi,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	jc lb_101
	bts r9,6
	mov [r12],r9
	call dec_r
lb_101:
; 	$ 5' ⊢ ,6',9' : ,r64,r64
; emt_ptn_set_ptn 5',6'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_102
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_103
lb_102:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_103:
; emt_ptn_set_ptn 5',9'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 9'
	mov [st_vct+8*9],rdi
	jc lb_104
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_105
lb_104:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_105:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_106
	bts r9,5
	mov [r12],r9
	call dec_r
lb_106:
; 	tak { 2' 8' 9' } ⊢ 2' : r64
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
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_108
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_109
lb_108:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_109:
	pop rdi
	pop rax
	bt rax,0
	jc lb_107
	push rdi
	call dec_r
	pop rdi
	clc
lb_107:
; 	» 0xr1 |~ 5' : r64
	mov r9,0x1
	mov [st_vct+8*5],r9
	mov r9,[r12]
	bts r9,5
	mov [r12],r9
; 	$ 5' ⊢ ,8' : ,r64
; emt_ptn_set_ptn 5',8'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_110
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_111
lb_110:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_111:
; ; emt_dec_ptn 5'
	mov rdi,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
	jc lb_112
	bts r9,5
	mov [r12],r9
	call dec_r
lb_112:
; 	sub { 7' 8' } ⊢ 5' : r64
; emt_get_ptn { 7' 8' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
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
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 7' 8' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_116
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_117
lb_116:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_117:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_118
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_119
lb_118:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_119:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_113
	push rdi
	call dec_r
	pop rdi
	clc
lb_113:
	mov r9,[st_vct+8*7]
	mov r10,[st_vct+8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_114
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_115
lb_114:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_115:
; 	tak { 5' 6' 3' } ⊢ 3' : r64
; emt_get_ptn { 5' 6' 3' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 5'
	mov rax,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
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
; push_s  2'~r1 4'~c 0'~r0 1'~b
	mov r9,[st_vct+8*2]
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
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_121
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_122
lb_121:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_122:
	pop rdi
	pop rax
	bt rax,0
	jc lb_120
	push rdi
	call dec_r
	pop rdi
	clc
lb_120:
; 	tak { 0' 2' 3' } ⊢ 0' : r64
; emt_get_ptn { 0' 2' 3' }
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
; push_s  4'~c 1'~b
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
	jc lb_124
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_125
lb_124:
	mov r10,[r12]
	bts r10,0
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
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  4'~c 1'~b
	mov r9,[r12]
	bt r9,4
	jc clear_lb_126
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_126:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_127
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_127:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_142
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
	call dec_r
jmp emt_etr_start_lb_143
emt_etr_c_lb_142:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_203
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_204
lb_203:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_204:
emt_etr_start_lb_143:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_144
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_145
lb_144:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_145:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_146
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_147
lb_146:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_147:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_148
	bts r9,0
	mov [r12],r9
	call dec_r
lb_148:
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
	jc lb_149
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_150
lb_149:
	mov r10,[r12]
	bts r10,3
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
; 	cmp { 1' 3' } ⊢ { 0' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_158
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_159
lb_158:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_159:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_160
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_161
lb_160:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_161:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_153
	push rdi
	call dec_r
	pop rdi
	clc
lb_153:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
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
	jle cmp_jb_lb_152
	mov r10,1
cmp_jb_lb_152:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 0' 1' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_154
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_155
lb_154:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_155:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_156
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_157
lb_156:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_157:
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
	je lb_163
	mov rdi,0
	stc
	mov rax,1
	jmp agl_162_1
lb_163:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_162_0
; 	∐ 0'
agl_162_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_192
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_193
lb_192:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_193:
	pop rdi
	pop rax
	bt rax,0
	jc lb_164
	push rdi
	call dec_r
	pop rdi
	clc
lb_164:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_165
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_166
lb_165:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_166:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_167
	bts r9,3
	mov [r12],r9
	call dec_r
lb_167:
; 	$ 2' ⊢ ,3',5' : ,r64,r64
; emt_ptn_set_ptn 2',3'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
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
; emt_ptn_set_ptn 2',5'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_170
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_171
lb_170:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_171:
; ; emt_dec_ptn 2'
	mov rdi,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	jc lb_172
	bts r9,2
	mov [r12],r9
	call dec_r
lb_172:
; 	sub { 3' 4' } ⊢ 2' : r64
; emt_get_ptn { 3' 4' }
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
; emt_get_ptn 4'
	mov rax,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_176
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_177
lb_176:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_177:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_178
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_179
lb_178:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_179:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_173
	push rdi
	call dec_r
	pop rdi
	clc
lb_173:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_174
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_175
lb_174:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_175:
; 	fact 2' ⊢ 2' : r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
; push_s  5'~x2 0'~b 1'~c
	mov r9,[st_vct+8*5]
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
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_181
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_182
lb_181:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_182:
	pop rdi
	pop rax
	bt rax,0
	jc lb_180
	push rdi
	call dec_r
	pop rdi
	clc
lb_180:
; 	mul { 5' 2' } ⊢ 2' : r64
; emt_get_ptn { 5' 2' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 5'
	mov rax,[st_vct+8*5]
	mov r9,[r12]
	bt r9,5
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
	clc
	mov rdi,rax
	mov rax,0
	setc al
	push rax
	push rdi
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_186
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_187
lb_186:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_187:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_188
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_189
lb_188:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_189:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_183
	push rdi
	call dec_r
	pop rdi
	clc
lb_183:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_184
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_185
lb_184:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_185:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b 1'~c
	mov r9,[r12]
	bt r9,0
	jc clear_lb_190
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_190:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_191
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_191:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_162_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_201
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_202
lb_201:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_202:
	pop rdi
	pop rax
	bt rax,0
	jc lb_194
	push rdi
	call dec_r
	pop rdi
	clc
lb_194:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_195
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_196
lb_195:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_196:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_197
	bts r9,3
	mov [r12],r9
	call dec_r
lb_197:
; 	∎ 4'
; emt_get_ptn 4'
	mov rax,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 0'~b 1'~c
	mov r9,[r12]
	bt r9,2
	jc clear_lb_198
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_198:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_199
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_199:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_200
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_200:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_207
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_258
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_259
lb_258:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_259:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_208
emt_etr_c_lb_207:
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_256
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_257
lb_256:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_257:
emt_etr_start_lb_208:
; 	$ 0' ⊢ ,1',2' : ,r64,r64
; emt_ptn_set_ptn 0',1'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_209
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_210
lb_209:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_210:
; emt_ptn_set_ptn 0',2'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_211
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_212
lb_211:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_212:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_213
	bts r9,0
	mov [r12],r9
	call dec_r
lb_213:
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
	jc lb_214
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_215
lb_214:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_215:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_216
	bts r9,0
	mov [r12],r9
	call dec_r
lb_216:
; 	cmp { 1' 3' } ⊢ { 0' 1' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_223
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_224
lb_223:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_224:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_225
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_226
lb_225:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_226:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_218
	push rdi
	call dec_r
	pop rdi
	clc
lb_218:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
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
	jle cmp_jb_lb_217
	mov r10,1
cmp_jb_lb_217:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 0' 1' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_219
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_220
lb_219:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_220:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_221
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_222
lb_221:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_222:
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
	je lb_228
	mov rdi,0
	stc
	mov rax,1
	jmp agl_227_1
lb_228:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_227_0
; 	∐ 0'
agl_227_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_245
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_246
lb_245:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_246:
	pop rdi
	pop rax
	bt rax,0
	jc lb_229
	push rdi
	call dec_r
	pop rdi
	clc
lb_229:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_230
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_231
lb_230:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_231:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_232
	bts r9,3
	mov [r12],r9
	call dec_r
lb_232:
; 	sub { 2' 4' } ⊢ 2' : r64
; emt_get_ptn { 2' 4' }
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
; emt_get_ptn 4'
	mov rax,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_236
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_237
lb_236:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_237:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_238
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_239
lb_238:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_239:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_233
	push rdi
	call dec_r
	pop rdi
	clc
lb_233:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_234
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_235
lb_234:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_235:
; 	f0 2' ⊢ 2' : r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
; push_s  0'~b0 1'~c
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
	jc lb_241
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_242
lb_241:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_242:
	pop rdi
	pop rax
	bt rax,0
	jc lb_240
	push rdi
	call dec_r
	pop rdi
	clc
lb_240:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b0 1'~c
	mov r9,[r12]
	bt r9,0
	jc clear_lb_243
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_243:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_244
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_244:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_227_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_254
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_255
lb_254:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_255:
	pop rdi
	pop rax
	bt rax,0
	jc lb_247
	push rdi
	call dec_r
	pop rdi
	clc
lb_247:
; 	» 0xr0 |~ 3' : r64
	mov r9,0x0
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,4' : ,r64
; emt_ptn_set_ptn 3',4'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_248
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_249
lb_248:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_249:
; ; emt_dec_ptn 3'
	mov rdi,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	jc lb_250
	bts r9,3
	mov [r12],r9
	call dec_r
lb_250:
; 	∎ 4'
; emt_get_ptn 4'
	mov rax,[st_vct+8*4]
	mov r9,[r12]
	bt r9,4
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~x1 0'~b1 1'~c
	mov r9,[r12]
	bt r9,2
	jc clear_lb_251
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_251:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_252
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_252:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_253
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_253:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_260
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_261
emt_etr_c_lb_260:
; emt_set_ptn {  }
emt_etr_start_lb_261:
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
	jc lb_262
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_263
lb_262:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_263:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_264
	bts r9,0
	mov [r12],r9
	call dec_r
lb_264:
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
	jc lb_265
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_266
lb_265:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_266:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_267
	bts r9,0
	mov [r12],r9
	call dec_r
lb_267:
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
	jc lb_268
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_269
lb_268:
	mov r10,[r12]
	bts r10,3
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
; 	cmp { 2' 3' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_277
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_278
lb_277:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_278:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_279
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_280
lb_279:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_280:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_272
	push rdi
	call dec_r
	pop rdi
	clc
lb_272:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
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
	jle cmp_jb_lb_271
	mov r10,1
cmp_jb_lb_271:
	mov [rax+8*1],r9
	mov [rax+8*2],r10
	clc
	mov rdi,rax
	push rdi
; emt_set_ptn { 0' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_273
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_274
lb_273:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_274:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_275
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_276
lb_275:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_276:
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
	je lb_282
	mov rdi,0
	stc
	mov rax,1
	jmp agl_281_1
lb_282:
	mov rdi,1
	stc
	mov rax,1
	jmp agl_281_0
; 	∐ 0'
agl_281_0:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_286
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_287
lb_286:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_287:
	pop rdi
	pop rax
	bt rax,0
	jc lb_283
	push rdi
	call dec_r
	pop rdi
	clc
lb_283:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 1'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_284
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_284:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_285
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_285:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_281_1:
	push rax
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_291
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_292
lb_291:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_292:
	pop rdi
	pop rax
	bt rax,0
	jc lb_288
	push rdi
	call dec_r
	pop rdi
	clc
lb_288:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 1'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_289
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_289:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_290
	mov rdi,[st_vct+8*1]
	call dec_r
clear_lb_290:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_293
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_294
emt_etr_c_lb_293:
; emt_set_ptn {  }
emt_etr_start_lb_294:
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
	jc lb_295
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_296
lb_295:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_296:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_297
	bts r9,0
	mov [r12],r9
	call dec_r
lb_297:
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
	jc lb_298
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_299
lb_298:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_299:
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_300
	bts r9,0
	mov [r12],r9
	call dec_r
lb_300:
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
	jc lb_301
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_302
lb_301:
	mov r10,[r12]
	bts r10,3
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
	jc lb_304
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_305
lb_304:
	mov r10,[r12]
	bts r10,4
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
; 	mul { 4' 3' } ⊢ 0' : r64
; emt_get_ptn { 4' 3' }
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_310
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_311
lb_310:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_311:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_312
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_313
lb_312:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_313:
	pop rdi
	pop rdi
	pop rax
	bt rax,0
	jc lb_307
	push rdi
	call dec_r
	pop rdi
	clc
lb_307:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_308
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_309
lb_308:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_309:
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
	jc clear_lb_314
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_314:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_315
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_316
emt_etr_c_lb_315:
; emt_set_ptn {  }
emt_etr_start_lb_316:
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
	jc lb_317
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_318
lb_317:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_318:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_319
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_320
lb_319:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_320:
	pop rdi
; ; emt_dec_ptn 0'
	mov rdi,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	jc lb_321
	bts r9,0
	mov [r12],r9
	call dec_r
lb_321:
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
	jc clear_lb_322
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_322:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_323
	mov rdi,[st_vct+8*4]
	call dec_r
clear_lb_323:
	pop r9
	rcr r9,1
	pop rax
	ret
