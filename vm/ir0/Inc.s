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
; 	$ 0' ⊢ ,0' : ,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_2
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_3
lb_2:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_3:
	pop rax
	pop rdi
	bt rax,0
	jc lb_4
	push rdi
	call dec_r
	pop rdi
	clc
lb_4:
; 	» 0xr9 |~ 1' : r64
	mov r9,0x9
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,1' : ,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_5
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_6
lb_5:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_6:
	pop rax
	pop rdi
	bt rax,0
	jc lb_7
	push rdi
	call dec_r
	pop rdi
	clc
lb_7:
; 	» 0xr0 |~ 2' : r64
	mov r9,0x0
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_8
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_9
lb_8:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_9:
	pop rax
	pop rdi
	bt rax,0
	jc lb_10
	push rdi
	call dec_r
	pop rdi
	clc
lb_10:
; 	tak { 0' 1' 2' } ⊢ 0' : r64
; emt_get_ptn { 0' 1' 2' }
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
	push rax
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
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
	pushf
	add r15,1
	popf
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
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
	popf
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
; 	$ 0' ⊢ ,0' : ,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_16
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_17
lb_16:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_17:
	pop rax
	pop rdi
	bt rax,0
	jc lb_18
	push rdi
	call dec_r
	pop rdi
	clc
lb_18:
; 	fact 0' ⊢ 0' : r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
; push_s 
	mov r9,[r12]
	push r9
	pushf
	add r15,1
	popf
	mov r9,0
	not r9
	mov [r12],r9
	call fact
; pop_s
	pop r9
	mov [r12],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
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
	popf
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
; 	$ 0' ⊢ ,0',3' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_24
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_25
lb_24:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_25:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_26
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_27
lb_26:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_27:
	pop rax
	pop rdi
	bt rax,0
	jc lb_28
	push rdi
	call dec_r
	pop rdi
	clc
lb_28:
; 	$ 1' ⊢ ,1',4' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_29
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_30
lb_29:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_30:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_31
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_32
lb_31:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_32:
	pop rax
	pop rdi
	bt rax,0
	jc lb_33
	push rdi
	call dec_r
	pop rdi
	clc
lb_33:
; 	cmp { 3' 4' } ⊢ { 3' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
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
	pushf
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
	popf
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_36
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_37
lb_36:
	mov r10,[r12]
	bts r10,3
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
	jmp agl_44_1
lb_45:
	mov rdi,1
	stc
	jmp agl_44_0
; 	∐ 4'
agl_44_0:
	pushf
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
	popf
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
;clear  3'~b 4'~c 0'~x 1'~y
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
	pushf
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
	popf
	jc lb_53
	push rdi
	call dec_r
	pop rdi
	clc
lb_53:
; 	$ 0' ⊢ ,0',5' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_54
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_55
lb_54:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_55:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_56
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_57
lb_56:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_57:
	pop rax
	pop rdi
	bt rax,0
	jc lb_58
	push rdi
	call dec_r
	pop rdi
	clc
lb_58:
; 	» 0xr1 |~ 6' : r64
	mov r9,0x1
	mov [st_vct+8*6],r9
	mov r9,[r12]
	bts r9,6
	mov [r12],r9
; 	$ 6' ⊢ ,6' : ,r64
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_59
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_60
lb_59:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_60:
	pop rax
	pop rdi
	bt rax,0
	jc lb_61
	push rdi
	call dec_r
	pop rdi
	clc
lb_61:
; 	sub { 5' 6' } ⊢ 5' : r64
; emt_get_ptn { 5' 6' }
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
	clc
	mov rdi,rax
	pushf
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
	popf
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
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_63
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_64
lb_63:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_64:
; 	$ 2' ⊢ ,2',6' : ,r64,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_69
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_70
lb_69:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_70:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_71
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_72
lb_71:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_72:
	pop rax
	pop rdi
	bt rax,0
	jc lb_73
	push rdi
	call dec_r
	pop rdi
	clc
lb_73:
; 	$ 1' ⊢ ,1',7' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_74
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_75
lb_74:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_75:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_76
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_77
lb_76:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_77:
	pop rax
	pop rdi
	bt rax,0
	jc lb_78
	push rdi
	call dec_r
	pop rdi
	clc
lb_78:
; 	tak { 5' 7' 6' } ⊢ 5' : r64
; emt_get_ptn { 5' 7' 6' }
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
; emt_get_ptn 6'
	mov rax,[st_vct+8*6]
	mov r9,[r12]
	bt r9,6
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  2'~z 3'~b 4'~c 0'~x 1'~y
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
	pushf
	add r15,1
	popf
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
	mov [st_vct+8*2],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
	push rdi
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_80
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_81
lb_80:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_81:
	pop rdi
	popf
	jc lb_79
	push rdi
	call dec_r
	pop rdi
	clc
lb_79:
; 	$ 1' ⊢ ,1',6' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_82
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_83
lb_82:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_83:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_84
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_85
lb_84:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_85:
	pop rax
	pop rdi
	bt rax,0
	jc lb_86
	push rdi
	call dec_r
	pop rdi
	clc
lb_86:
; 	» 0xr1 |~ 7' : r64
	mov r9,0x1
	mov [st_vct+8*7],r9
	mov r9,[r12]
	bts r9,7
	mov [r12],r9
; 	$ 7' ⊢ ,7' : ,r64
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_87
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_88
lb_87:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_88:
	pop rax
	pop rdi
	bt rax,0
	jc lb_89
	push rdi
	call dec_r
	pop rdi
	clc
lb_89:
; 	sub { 6' 7' } ⊢ 6' : r64
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
	pushf
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
	popf
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
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_91
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_92
lb_91:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_92:
; 	$ 2' ⊢ ,2',7' : ,r64,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_97
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_98
lb_97:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_98:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_101
	push rdi
	call dec_r
	pop rdi
	clc
lb_101:
; 	$ 0' ⊢ ,0',8' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_102
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_103
lb_102:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_103:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 8'
	mov [st_vct+8*8],rdi
	jc lb_104
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_105
lb_104:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_105:
	pop rax
	pop rdi
	bt rax,0
	jc lb_106
	push rdi
	call dec_r
	pop rdi
	clc
lb_106:
; 	tak { 6' 7' 8' } ⊢ 6' : r64
; emt_get_ptn { 6' 7' 8' }
	mov rdi,3
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
	push rax
; emt_get_ptn 8'
	mov rax,[st_vct+8*8]
	mov r9,[r12]
	bt r9,8
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  2'~z 3'~b 5'~r0 4'~c 0'~x 1'~y
	mov r9,[st_vct+8*2]
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
	pushf
	add r15,1
	popf
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
	mov [st_vct+8*2],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
	push rdi
; emt_set_ptn 6'
	mov [st_vct+8*6],rdi
	jc lb_108
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_109
lb_108:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_109:
	pop rdi
	popf
	jc lb_107
	push rdi
	call dec_r
	pop rdi
	clc
lb_107:
; 	» 0xr1 |~ 7' : r64
	mov r9,0x1
	mov [st_vct+8*7],r9
	mov r9,[r12]
	bts r9,7
	mov [r12],r9
; 	$ 7' ⊢ ,7' : ,r64
; emt_get_ptn 7'
	mov rax,[st_vct+8*7]
	mov r9,[r12]
	bt r9,7
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 7'
	mov [st_vct+8*7],rdi
	jc lb_110
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_111
lb_110:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_111:
	pop rax
	pop rdi
	bt rax,0
	jc lb_112
	push rdi
	call dec_r
	pop rdi
	clc
lb_112:
; 	sub { 2' 7' } ⊢ 2' : r64
; emt_get_ptn { 2' 7' }
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
	pushf
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
	popf
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
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_114
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_115
lb_114:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_115:
; 	tak { 2' 0' 1' } ⊢ 0' : r64
; emt_get_ptn { 2' 0' 1' }
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
	push rax
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  6'~r1 3'~b 5'~r0 4'~c
	mov r9,[st_vct+8*6]
	push r9
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*5]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[r12]
	push r9
	pushf
	add r15,1
	popf
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*5],r9
	pop r9
	mov [st_vct+8*3],r9
	pop r9
	mov [st_vct+8*6],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
	push rdi
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_121
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_122
lb_121:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_122:
	pop rdi
	popf
	jc lb_120
	push rdi
	call dec_r
	pop rdi
	clc
lb_120:
; 	tak { 5' 6' 0' } ⊢ 0' : r64
; emt_get_ptn { 5' 6' 0' }
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
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; push_s  3'~b 4'~c
	mov r9,[st_vct+8*3]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[r12]
	push r9
	pushf
	add r15,1
	popf
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
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
	popf
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
;clear  3'~b 4'~c
	mov r9,[r12]
	bt r9,3
	jc clear_lb_126
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_126:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_127
	mov rdi,[st_vct+8*4]
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
; 	$ 0' ⊢ ,0',1' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_148
	push rdi
	call dec_r
	pop rdi
	clc
lb_148:
; 	» 0xr0 |~ 2' : r64
	mov r9,0x0
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_151
	push rdi
	call dec_r
	pop rdi
	clc
lb_151:
; 	cmp { 0' 2' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 0' 2' }
	mov rdi,2
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
	clc
	mov rdi,rax
	pushf
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
	popf
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
; emt_set_ptn { 0' 2' }
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
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_156
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_157
lb_156:
	mov r10,[r12]
	bts r10,2
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
	jmp agl_162_1
lb_163:
	mov rdi,1
	stc
	jmp agl_162_0
; 	∐ 0'
agl_162_0:
	pushf
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
	popf
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
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_165
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_166
lb_165:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_166:
	pop rax
	pop rdi
	bt rax,0
	jc lb_167
	push rdi
	call dec_r
	pop rdi
	clc
lb_167:
; 	$ 1' ⊢ ,1',4' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_168
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_169
lb_168:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_169:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 4'
	mov [st_vct+8*4],rdi
	jc lb_170
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_171
lb_170:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_171:
	pop rax
	pop rdi
	bt rax,0
	jc lb_172
	push rdi
	call dec_r
	pop rdi
	clc
lb_172:
; 	sub { 1' 3' } ⊢ 1' : r64
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
	pushf
	push rdi
; emt_set_ptn { 3' 5' }
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
; emt_set_ptn 5'
	mov [st_vct+8*5],rdi
	jc lb_178
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_179
lb_178:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_179:
	pop rdi
	pop rdi
	popf
	jc lb_173
	push rdi
	call dec_r
	pop rdi
	clc
lb_173:
	mov r9,[st_vct+8*3]
	mov r10,[st_vct+8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_174
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_175
lb_174:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_175:
; 	fact 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
; push_s  2'~c 4'~x2 0'~b
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*4]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[r12]
	push r9
	pushf
	add r15,1
	popf
	mov r9,0
	not r9
	mov [r12],r9
	call fact
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [st_vct+8*0],r9
	pop r9
	mov [st_vct+8*4],r9
	pop r9
	mov [st_vct+8*2],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_181
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_182
lb_181:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_182:
	pop rdi
	popf
	jc lb_180
	push rdi
	call dec_r
	pop rdi
	clc
lb_180:
; 	mul { 4' 1' } ⊢ 1' : r64
; emt_get_ptn { 4' 1' }
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
	mov rdi,rax
	pushf
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
	popf
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
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_184
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_185
lb_184:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_185:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b
	mov r9,[r12]
	bt r9,2
	jc clear_lb_190
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_190:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_191
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_191:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_162_1:
	pushf
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
	popf
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
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_195
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_196
lb_195:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_196:
	pop rax
	pop rdi
	bt rax,0
	jc lb_197
	push rdi
	call dec_r
	pop rdi
	clc
lb_197:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b 1'~x1
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
; 	$ 0' ⊢ ,0',1' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_209
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_210
lb_209:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_210:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_211
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_212
lb_211:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_212:
	pop rax
	pop rdi
	bt rax,0
	jc lb_213
	push rdi
	call dec_r
	pop rdi
	clc
lb_213:
; 	» 0xr0 |~ 2' : r64
	mov r9,0x0
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_214
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_215
lb_214:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_215:
	pop rax
	pop rdi
	bt rax,0
	jc lb_216
	push rdi
	call dec_r
	pop rdi
	clc
lb_216:
; 	cmp { 0' 2' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 0' 2' }
	mov rdi,2
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
	clc
	mov rdi,rax
	pushf
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
	popf
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
; emt_set_ptn { 0' 2' }
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
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_221
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_222
lb_221:
	mov r10,[r12]
	bts r10,2
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
	jmp agl_227_1
lb_228:
	mov rdi,1
	stc
	jmp agl_227_0
; 	∐ 0'
agl_227_0:
	pushf
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
	popf
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
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_232
	push rdi
	call dec_r
	pop rdi
	clc
lb_232:
; 	sub { 1' 3' } ⊢ 1' : r64
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
	pushf
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
	popf
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
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_234
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_235
lb_234:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_235:
; 	f0 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
; push_s  2'~c 0'~b0
	mov r9,[st_vct+8*2]
	push r9
	mov r9,[st_vct+8*0]
	push r9
	mov r9,[r12]
	push r9
	pushf
	add r15,1
	popf
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
	mov [st_vct+8*2],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
	pushf
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_241
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_242
lb_241:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_242:
	pop rdi
	popf
	jc lb_240
	push rdi
	call dec_r
	pop rdi
	clc
lb_240:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_243
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_243:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_244
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_244:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_227_1:
	pushf
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
	popf
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
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_248
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_249
lb_248:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_249:
	pop rax
	pop rdi
	bt rax,0
	jc lb_250
	push rdi
	call dec_r
	pop rdi
	clc
lb_250:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b1 1'~x1
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
; 	$ 0' ⊢ ,0' : ,@[0].r2 ≃ ∐[@[0] @[0] ]
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_264
	push rdi
	call dec_r
	pop rdi
	clc
lb_264:
; 	» 0xrff |~ 1' : r64
	mov r9,0xff
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,1' : ,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_265
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_266
lb_265:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_266:
	pop rax
	pop rdi
	bt rax,0
	jc lb_267
	push rdi
	call dec_r
	pop rdi
	clc
lb_267:
; 	» 0xrff |~ 2' : r64
	mov r9,0xff
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_268
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_269
lb_268:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_269:
	pop rax
	pop rdi
	bt rax,0
	jc lb_270
	push rdi
	call dec_r
	pop rdi
	clc
lb_270:
; 	cmp { 1' 2' } ⊢ { 1' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 1' 2' }
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
	pushf
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
	popf
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
; emt_set_ptn { 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_273
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_274
lb_273:
	mov r10,[r12]
	bts r10,1
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
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	cmp rax,0
	mov rdi,rax
	je lb_282
	mov rdi,0
	stc
	jmp agl_281_1
lb_282:
	mov rdi,1
	stc
	jmp agl_281_0
; 	∐ 1'
agl_281_0:
	pushf
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_286
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_287
lb_286:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_287:
	pop rdi
	popf
	jc lb_283
	push rdi
	call dec_r
	pop rdi
	clc
lb_283:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_284
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_284:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_285
	mov rdi,[st_vct+8*0]
	call dec_r
clear_lb_285:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 1'
agl_281_1:
	pushf
	push rdi
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_291
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_292
lb_291:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_292:
	pop rdi
	popf
	jc lb_288
	push rdi
	call dec_r
	pop rdi
	clc
lb_288:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_289
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_289:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_290
	mov rdi,[st_vct+8*0]
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
; 	$ 0' ⊢ ,0' : ,r64
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_295
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_296
lb_295:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_296:
	pop rax
	pop rdi
	bt rax,0
	jc lb_297
	push rdi
	call dec_r
	pop rdi
	clc
lb_297:
; 	» 0xrffffccccafab0000 |~ 1' : r64
	mov r9,0xffffccccafab0000
	mov [st_vct+8*1],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,1' : ,r64
; emt_get_ptn 1'
	mov rax,[st_vct+8*1]
	mov r9,[r12]
	bt r9,1
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_298
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_299
lb_298:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_299:
	pop rax
	pop rdi
	bt rax,0
	jc lb_300
	push rdi
	call dec_r
	pop rdi
	clc
lb_300:
; 	» 0xra |~ 2' : r64
	mov r9,0xa
	mov [st_vct+8*2],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[st_vct+8*2]
	mov r9,[r12]
	bt r9,2
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_301
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_302
lb_301:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_302:
	pop rax
	pop rdi
	bt rax,0
	jc lb_303
	push rdi
	call dec_r
	pop rdi
	clc
lb_303:
; 	» 0xr18 |~ 3' : r64
	mov r9,0x18
	mov [st_vct+8*3],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[st_vct+8*3]
	mov r9,[r12]
	bt r9,3
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_304
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_305
lb_304:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_305:
	pop rax
	pop rdi
	bt rax,0
	jc lb_306
	push rdi
	call dec_r
	pop rdi
	clc
lb_306:
; 	mul { 3' 2' } ⊢ 2' : r64
; emt_get_ptn { 3' 2' }
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
	pushf
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
	popf
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
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_308
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_309
lb_308:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_309:
; 	∎ { 0' 2' }
; emt_get_ptn { 0' 2' }
	mov rdi,2
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
	clc
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  1'~y
	mov r9,[r12]
	bt r9,1
	jc clear_lb_314
	mov rdi,[st_vct+8*1]
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
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [st_vct+8*1],rdi
	jc lb_319
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_320
lb_319:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_320:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [st_vct+8*2],rdi
	jc lb_321
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_322
lb_321:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_322:
	pop rax
	pop rdi
	bt rax,0
	jc lb_323
	push rdi
	call dec_r
	pop rdi
	clc
lb_323:
; 	$ 0' ⊢ ,{ 0' 3' } : ,{ { } { } }
; emt_get_ptn 0'
	mov rax,[st_vct+8*0]
	mov r9,[r12]
	bt r9,0
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn { 0' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [st_vct+8*0],rdi
	jc lb_324
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_325
lb_324:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_325:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [st_vct+8*3],rdi
	jc lb_326
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_327
lb_326:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_327:
	pop rdi
	pop rax
	pop rdi
	bt rax,0
	jc lb_328
	push rdi
	call dec_r
	pop rdi
	clc
lb_328:
; 	∎ { 0' 1' }
; emt_get_ptn { 0' 1' }
	mov rdi,2
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
;clear  2'~r2 3'~r4
	mov r9,[r12]
	bt r9,2
	jc clear_lb_329
	mov rdi,[st_vct+8*2]
	call dec_r
clear_lb_329:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_330
	mov rdi,[st_vct+8*3]
	call dec_r
clear_lb_330:
	pop r9
	rcr r9,1
	pop rax
	ret
