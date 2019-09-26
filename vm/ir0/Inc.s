%include "mem.s"
main:
	mov r15,0
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
; 	» 0xr11 |~ 0' : r64
	mov r9,0x11
	mov [r12-8*1],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,0' : ,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
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
; 	» 0xr7 |~ 1' : r64
	mov r9,0x7
	mov [r12-8*2],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,1' : ,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
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
	mov [r12-8*3],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
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
	mov rax,[r12-8*1]
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
	mov rax,[r12-8*2]
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
	mov rax,[r12-8*3]
	mov r9,[r12]
	bt r9,2
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s 
	mov r9,[r12]
	push r9
	add r15,1
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
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_11
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_12
lb_11:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_12:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	jc emt_etr_c_lb_13
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_14
emt_etr_c_lb_13:
; emt_set_ptn {  }
emt_etr_start_lb_14:
; 	» 0xr5 |~ 0' : r64
	mov r9,0x5
	mov [r12-8*1],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,0' : ,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_15
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_16
lb_15:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_16:
	pop rax
	pop rdi
	bt rax,0
	jc lb_17
	push rdi
	call dec_r
	pop rdi
	clc
lb_17:
; 	fact 0' ⊢ 0' : r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	mov rax,rdi
; push_s 
	mov r9,[r12]
	push r9
	add r15,1
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
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_18
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_19
lb_18:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_19:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	jc emt_etr_c_lb_20
	push rdi
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_126
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_127
lb_126:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_127:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_128
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_129
lb_128:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_129:
	pop rdi
	pop rdi
	call dec_r
jmp emt_etr_start_lb_21
emt_etr_c_lb_20:
; emt_set_ptn { 0' 1' 2' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_118
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_119
lb_118:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_119:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_120
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_121
lb_120:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_121:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_122
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_123
lb_122:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_123:
	pop rdi
emt_etr_start_lb_21:
; 	$ 0' ⊢ ,0',3' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_22
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_23
lb_22:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_23:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 3'
	mov [r12-8*4],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_26
	push rdi
	call dec_r
	pop rdi
	clc
lb_26:
; 	$ 1' ⊢ ,1',4' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
	jc lb_27
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_28
lb_27:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_28:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_29
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_30
lb_29:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_30:
	pop rax
	pop rdi
	bt rax,0
	jc lb_31
	push rdi
	call dec_r
	pop rdi
	clc
lb_31:
; 	cmp { 3' 4' } ⊢ { 3' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 3' 4' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov rax,[r12-8*5]
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
; emt_set_ptn { 5' 6' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_37
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_38
lb_37:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_38:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 6'
	mov [r12-8*7],rdi
	jc lb_39
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_40
lb_39:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_40:
	pop rdi
	mov r9,[r12-8*6]
	mov r10,[r12-8*7]
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
	jle cmp_jb_lb_32
	mov r10,1
cmp_jb_lb_32:
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
	mov [r12-8*4],rdi
	jc lb_33
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_34
lb_33:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_34:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_35
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_36
lb_35:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_36:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 4'
; emt_get_ptn 4'
	mov rax,[r12-8*5]
	mov r9,[r12]
	bt r9,4
	cmp rax,0
	mov rdi,rax
	je lb_42
	mov rdi,0
	stc
	jmp agl_41_1
lb_42:
	mov rdi,1
	stc
	jmp agl_41_0
; 	∐ 4'
agl_41_0:
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_47
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_48
lb_47:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_48:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[r12-8*3]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~b 4'~c 0'~x 1'~y
	mov r9,[r12]
	bt r9,3
	jc clear_lb_43
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_43:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_44
	mov rdi,[r12-8*5]
	call dec_r
clear_lb_44:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_45
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_45:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_46
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_46:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 4'
agl_41_1:
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_116
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_117
lb_116:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_117:
; 	$ 0' ⊢ ,0',5' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_49
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_50
lb_49:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_50:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_51
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_52
lb_51:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_52:
	pop rax
	pop rdi
	bt rax,0
	jc lb_53
	push rdi
	call dec_r
	pop rdi
	clc
lb_53:
; 	» 0xr1 |~ 6' : r64
	mov r9,0x1
	mov [r12-8*7],r9
	mov r9,[r12]
	bts r9,6
	mov [r12],r9
; 	$ 6' ⊢ ,6' : ,r64
; emt_get_ptn 6'
	mov rax,[r12-8*7]
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
	mov [r12-8*7],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_56
	push rdi
	call dec_r
	pop rdi
	clc
lb_56:
; 	sub { 5' 6' } ⊢ 5' : r64
; emt_get_ptn { 5' 6' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 5'
	mov rax,[r12-8*6]
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
	mov rax,[r12-8*7]
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
; emt_set_ptn { 6' 7' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 6'
	mov [r12-8*7],rdi
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_61
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_62
lb_61:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_62:
	pop rdi
	mov r9,[r12-8*7]
	mov r10,[r12-8*8]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_57
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_58
lb_57:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_58:
; 	$ 2' ⊢ ,2',6' : ,r64,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
	jc lb_63
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_64
lb_63:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_64:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 6'
	mov [r12-8*7],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_67
	push rdi
	call dec_r
	pop rdi
	clc
lb_67:
; 	$ 1' ⊢ ,1',7' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
	jc lb_68
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_69
lb_68:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_69:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_70
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_71
lb_70:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_71:
	pop rax
	pop rdi
	bt rax,0
	jc lb_72
	push rdi
	call dec_r
	pop rdi
	clc
lb_72:
; 	tak { 5' 7' 6' } ⊢ 5' : r64
; emt_get_ptn { 5' 7' 6' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 5'
	mov rax,[r12-8*6]
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
	mov rax,[r12-8*8]
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
	mov rax,[r12-8*7]
	mov r9,[r12]
	bt r9,6
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  2'~z 3'~b 4'~c 0'~x 1'~y
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12-8*2]
	push r9
	mov r9,[r12]
	push r9
	add r15,1
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*2],r9
	pop r9
	mov [r12-8*1],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*4],r9
	pop r9
	mov [r12-8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_73
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_74
lb_73:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_74:
; 	$ 1' ⊢ ,1',6' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
	jc lb_75
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_76
lb_75:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_76:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 6'
	mov [r12-8*7],rdi
	jc lb_77
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_78
lb_77:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_78:
	pop rax
	pop rdi
	bt rax,0
	jc lb_79
	push rdi
	call dec_r
	pop rdi
	clc
lb_79:
; 	» 0xr1 |~ 7' : r64
	mov r9,0x1
	mov [r12-8*8],r9
	mov r9,[r12]
	bts r9,7
	mov [r12],r9
; 	$ 7' ⊢ ,7' : ,r64
; emt_get_ptn 7'
	mov rax,[r12-8*8]
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
	mov [r12-8*8],rdi
	jc lb_80
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_81
lb_80:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_81:
	pop rax
	pop rdi
	bt rax,0
	jc lb_82
	push rdi
	call dec_r
	pop rdi
	clc
lb_82:
; 	sub { 6' 7' } ⊢ 6' : r64
; emt_get_ptn { 6' 7' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 6'
	mov rax,[r12-8*7]
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
	mov rax,[r12-8*8]
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
; emt_set_ptn { 7' 8' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 7'
	mov [r12-8*8],rdi
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 8'
	mov [r12-8*9],rdi
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
	pop rdi
	mov r9,[r12-8*8]
	mov r10,[r12-8*9]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 6'
	mov [r12-8*7],rdi
	jc lb_83
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_84
lb_83:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_84:
; 	$ 2' ⊢ ,2',7' : ,r64,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
	jc lb_89
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_90
lb_89:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_90:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_91
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_92
lb_91:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_92:
	pop rax
	pop rdi
	bt rax,0
	jc lb_93
	push rdi
	call dec_r
	pop rdi
	clc
lb_93:
; 	$ 0' ⊢ ,0',8' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_94
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_95
lb_94:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_95:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 8'
	mov [r12-8*9],rdi
	jc lb_96
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_97
lb_96:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_97:
	pop rax
	pop rdi
	bt rax,0
	jc lb_98
	push rdi
	call dec_r
	pop rdi
	clc
lb_98:
; 	tak { 6' 7' 8' } ⊢ 6' : r64
; emt_get_ptn { 6' 7' 8' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 6'
	mov rax,[r12-8*7]
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
	mov rax,[r12-8*8]
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
	mov rax,[r12-8*9]
	mov r9,[r12]
	bt r9,8
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  2'~z 3'~b 5'~r0 4'~c 0'~x 1'~y
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*6]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12-8*2]
	push r9
	mov r9,[r12]
	push r9
	add r15,1
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*2],r9
	pop r9
	mov [r12-8*1],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*6],r9
	pop r9
	mov [r12-8*4],r9
	pop r9
	mov [r12-8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 6'
	mov [r12-8*7],rdi
	jc lb_99
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_100
lb_99:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_100:
; 	» 0xr1 |~ 7' : r64
	mov r9,0x1
	mov [r12-8*8],r9
	mov r9,[r12]
	bts r9,7
	mov [r12],r9
; 	$ 7' ⊢ ,7' : ,r64
; emt_get_ptn 7'
	mov rax,[r12-8*8]
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
	mov [r12-8*8],rdi
	jc lb_101
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_102
lb_101:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_102:
	pop rax
	pop rdi
	bt rax,0
	jc lb_103
	push rdi
	call dec_r
	pop rdi
	clc
lb_103:
; 	sub { 2' 7' } ⊢ 2' : r64
; emt_get_ptn { 2' 7' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov rax,[r12-8*8]
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
; emt_set_ptn { 7' 8' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_106
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_107
lb_106:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_107:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 8'
	mov [r12-8*9],rdi
	jc lb_108
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_109
lb_108:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_109:
	pop rdi
	mov r9,[r12-8*8]
	mov r10,[r12-8*9]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_104
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_105
lb_104:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_105:
; 	tak { 2' 0' 1' } ⊢ 0' : r64
; emt_get_ptn { 2' 0' 1' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov rax,[r12-8*1]
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
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  6'~r1 3'~b 5'~r0 4'~c
	mov r9,[r12-8*7]
	push r9
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*6]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12]
	push r9
	add r15,1
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*6],r9
	pop r9
	mov [r12-8*4],r9
	pop r9
	mov [r12-8*7],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_110
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_111
lb_110:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_111:
; 	tak { 5' 6' 0' } ⊢ 0' : r64
; emt_get_ptn { 5' 6' 0' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 5'
	mov rax,[r12-8*6]
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
	mov rax,[r12-8*7]
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
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  3'~b 4'~c
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12]
	push r9
	add r15,1
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*4],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_112
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_113
lb_112:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_113:
; 	∎ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  3'~b 4'~c
	mov r9,[r12]
	bt r9,3
	jc clear_lb_114
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_114:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_115
	mov rdi,[r12-8*5]
	call dec_r
clear_lb_115:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_130
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_187
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_188
lb_187:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_188:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_131
emt_etr_c_lb_130:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_185
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_186
lb_185:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_186:
emt_etr_start_lb_131:
; 	$ 0' ⊢ ,0',1' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_132
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_133
lb_132:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_133:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_134
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_135
lb_134:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_135:
	pop rax
	pop rdi
	bt rax,0
	jc lb_136
	push rdi
	call dec_r
	pop rdi
	clc
lb_136:
; 	» 0xr0 |~ 2' : r64
	mov r9,0x0
	mov [r12-8*3],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_139
	push rdi
	call dec_r
	pop rdi
	clc
lb_139:
; 	cmp { 0' 2' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 0' 2' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov rax,[r12-8*3]
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_145
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_146
lb_145:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_146:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_147
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_148
lb_147:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_148:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
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
	jle cmp_jb_lb_140
	mov r10,1
cmp_jb_lb_140:
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
	mov [r12-8*1],rdi
	jc lb_141
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_142
lb_141:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_142:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
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
	clc
	call dec_r
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_150
	mov rdi,0
	stc
	jmp agl_149_1
lb_150:
	mov rdi,1
	stc
	jmp agl_149_0
; 	∐ 0'
agl_149_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_175
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_176
lb_175:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_176:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [r12-8*4],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov [r12-8*4],rdi
	jc lb_151
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_152
lb_151:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_152:
	pop rax
	pop rdi
	bt rax,0
	jc lb_153
	push rdi
	call dec_r
	pop rdi
	clc
lb_153:
; 	$ 1' ⊢ ,1',4' : ,r64,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
	jc lb_154
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_155
lb_154:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_155:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_156
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_157
lb_156:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_157:
	pop rax
	pop rdi
	bt rax,0
	jc lb_158
	push rdi
	call dec_r
	pop rdi
	clc
lb_158:
; 	sub { 1' 3' } ⊢ 1' : r64
; emt_get_ptn { 1' 3' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov rax,[r12-8*4]
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
; emt_set_ptn { 3' 5' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_161
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_162
lb_161:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_162:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_163
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_164
lb_163:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_164:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_159
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_160
lb_159:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_160:
; 	fact 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rax,rdi
; push_s  2'~c 4'~x2 0'~b
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12]
	push r9
	add r15,1
	mov r9,0
	not r9
	mov [r12],r9
	call fact
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*1],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_165
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_166
lb_165:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_166:
; 	mul { 4' 1' } ⊢ 1' : r64
; emt_get_ptn { 4' 1' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 4'
	mov rax,[r12-8*5]
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
	mov rax,[r12-8*2]
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_169
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_170
lb_169:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_170:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_171
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_172
lb_171:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_172:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_167
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_168
lb_167:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_168:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b
	mov r9,[r12]
	bt r9,2
	jc clear_lb_173
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_173:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_174
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_174:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_149_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_183
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_184
lb_183:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_184:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [r12-8*4],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov [r12-8*4],rdi
	jc lb_177
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_178
lb_177:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_178:
	pop rax
	pop rdi
	bt rax,0
	jc lb_179
	push rdi
	call dec_r
	pop rdi
	clc
lb_179:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[r12-8*4]
	mov r9,[r12]
	bt r9,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b 1'~x1
	mov r9,[r12]
	bt r9,2
	jc clear_lb_180
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_180:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_181
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_181:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_182
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_182:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_189
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_235
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_236
lb_235:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_236:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_190
emt_etr_c_lb_189:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
emt_etr_start_lb_190:
; 	$ 0' ⊢ ,0',1' : ,r64,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_191
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_192
lb_191:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_192:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_193
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_194
lb_193:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_194:
	pop rax
	pop rdi
	bt rax,0
	jc lb_195
	push rdi
	call dec_r
	pop rdi
	clc
lb_195:
; 	» 0xr0 |~ 2' : r64
	mov r9,0x0
	mov [r12-8*3],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
	jc lb_196
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_197
lb_196:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_197:
	pop rax
	pop rdi
	bt rax,0
	jc lb_198
	push rdi
	call dec_r
	pop rdi
	clc
lb_198:
; 	cmp { 0' 2' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 0' 2' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov rax,[r12-8*3]
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_204
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_205
lb_204:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_205:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_206
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_207
lb_206:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_207:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
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
	jle cmp_jb_lb_199
	mov r10,1
cmp_jb_lb_199:
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
	mov [r12-8*1],rdi
	jc lb_200
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_201
lb_200:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_201:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_202
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_203
lb_202:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_203:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_209
	mov rdi,0
	stc
	jmp agl_208_1
lb_209:
	mov rdi,1
	stc
	jmp agl_208_0
; 	∐ 0'
agl_208_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_223
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_224
lb_223:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_224:
; 	» 0xr1 |~ 3' : r64
	mov r9,0x1
	mov [r12-8*4],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov [r12-8*4],rdi
	jc lb_210
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_211
lb_210:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_211:
	pop rax
	pop rdi
	bt rax,0
	jc lb_212
	push rdi
	call dec_r
	pop rdi
	clc
lb_212:
; 	sub { 1' 3' } ⊢ 1' : r64
; emt_get_ptn { 1' 3' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov rax,[r12-8*4]
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_215
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_216
lb_215:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_216:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_217
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_218
lb_217:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_218:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_213
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_214
lb_213:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_214:
; 	f0 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rax,rdi
; push_s  2'~c 0'~b0
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12]
	push r9
	add r15,1
	mov r9,0
	not r9
	mov [r12],r9
	call f0
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*1],r9
	pop r9
	mov [r12-8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_219
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_220
lb_219:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_220:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_221
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_221:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_222
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_222:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_208_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_231
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_232
lb_231:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_232:
; 	» 0xr0 |~ 3' : r64
	mov r9,0x0
	mov [r12-8*4],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov [r12-8*4],rdi
	jc lb_225
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_226
lb_225:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_226:
	pop rax
	pop rdi
	bt rax,0
	jc lb_227
	push rdi
	call dec_r
	pop rdi
	clc
lb_227:
; 	∎ 3'
; emt_get_ptn 3'
	mov rax,[r12-8*4]
	mov r9,[r12]
	bt r9,3
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b1 1'~x1
	mov r9,[r12]
	bt r9,2
	jc clear_lb_228
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_228:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_229
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_229:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_230
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_230:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_237
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_238
emt_etr_c_lb_237:
; emt_set_ptn {  }
emt_etr_start_lb_238:
; 	» 0x2r1 |~ 0' : @[0].r2 ≃ ∐[@[0] @[0] ]
	mov r9,0x1
	mov [r12-8*1],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,0' : ,@[0].r2 ≃ ∐[@[0] @[0] ]
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_239
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_240
lb_239:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_240:
	pop rax
	pop rdi
	bt rax,0
	jc lb_241
	push rdi
	call dec_r
	pop rdi
	clc
lb_241:
; 	» 0xrff |~ 1' : r64
	mov r9,0xff
	mov [r12-8*2],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,1' : ,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
	jc lb_242
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_243
lb_242:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_243:
	pop rax
	pop rdi
	bt rax,0
	jc lb_244
	push rdi
	call dec_r
	pop rdi
	clc
lb_244:
; 	» 0xrff |~ 2' : r64
	mov r9,0xff
	mov [r12-8*3],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
	jc lb_245
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_246
lb_245:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_246:
	pop rax
	pop rdi
	bt rax,0
	jc lb_247
	push rdi
	call dec_r
	pop rdi
	clc
lb_247:
; 	cmp { 1' 2' } ⊢ { 1' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
; emt_get_ptn { 1' 2' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov rax,[r12-8*3]
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_253
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_254
lb_253:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_254:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_255
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_256
lb_255:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_256:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
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
	jle cmp_jb_lb_248
	mov r10,1
cmp_jb_lb_248:
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
	mov [r12-8*2],rdi
	jc lb_249
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_250
lb_249:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_250:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_251
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_252
lb_251:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_252:
	pop rdi
	pop rdi
	clc
	call dec_r
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	cmp rax,0
	mov rdi,rax
	je lb_258
	mov rdi,0
	stc
	jmp agl_257_1
lb_258:
	mov rdi,1
	stc
	jmp agl_257_0
; 	∐ 1'
agl_257_0:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_261
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_262
lb_261:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_262:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_259
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_259:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_260
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_260:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 1'
agl_257_1:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
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
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~c 0'~b0
	mov r9,[r12]
	bt r9,2
	jc clear_lb_263
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_263:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_264
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_264:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_267
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_268
emt_etr_c_lb_267:
; emt_set_ptn {  }
emt_etr_start_lb_268:
; 	» 0xrffff |~ 0' : r64
	mov r9,0xffff
	mov [r12-8*1],r9
	mov r9,[r12]
	bts r9,0
	mov [r12],r9
; 	$ 0' ⊢ ,0' : ,r64
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
	jc lb_269
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_270
lb_269:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_270:
	pop rax
	pop rdi
	bt rax,0
	jc lb_271
	push rdi
	call dec_r
	pop rdi
	clc
lb_271:
; 	» 0xrffffccccafab0000 |~ 1' : r64
	mov r9,0xffffccccafab0000
	mov [r12-8*2],r9
	mov r9,[r12]
	bts r9,1
	mov [r12],r9
; 	$ 1' ⊢ ,1' : ,r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
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
	mov [r12-8*2],rdi
	jc lb_272
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_273
lb_272:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_273:
	pop rax
	pop rdi
	bt rax,0
	jc lb_274
	push rdi
	call dec_r
	pop rdi
	clc
lb_274:
; 	» 0xra |~ 2' : r64
	mov r9,0xa
	mov [r12-8*3],r9
	mov r9,[r12]
	bts r9,2
	mov [r12],r9
; 	$ 2' ⊢ ,2' : ,r64
; emt_get_ptn 2'
	mov rax,[r12-8*3]
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
	mov [r12-8*3],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_277
	push rdi
	call dec_r
	pop rdi
	clc
lb_277:
; 	» 0xr18 |~ 3' : r64
	mov r9,0x18
	mov [r12-8*4],r9
	mov r9,[r12]
	bts r9,3
	mov [r12],r9
; 	$ 3' ⊢ ,3' : ,r64
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov [r12-8*4],rdi
	jc lb_278
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_279
lb_278:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_279:
	pop rax
	pop rdi
	bt rax,0
	jc lb_280
	push rdi
	call dec_r
	pop rdi
	clc
lb_280:
; 	mul { 3' 2' } ⊢ 2' : r64
; emt_get_ptn { 3' 2' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 3'
	mov rax,[r12-8*4]
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
	mov rax,[r12-8*3]
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
; emt_set_ptn { 3' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_283
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_284
lb_283:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_284:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_285
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_286
lb_285:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_286:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_281
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_282
lb_281:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_282:
; 	∎ { 0' 2' }
; emt_get_ptn { 0' 2' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov rax,[r12-8*3]
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
	jc clear_lb_287
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_287:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_288
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_289
emt_etr_c_lb_288:
; emt_set_ptn {  }
emt_etr_start_lb_289:
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
	mov [r12-8*1],rdi
	jc lb_290
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_291
lb_290:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_291:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_292
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_293
lb_292:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_293:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_294
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_295
lb_294:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_295:
	pop rax
	pop rdi
	bt rax,0
	jc lb_296
	push rdi
	call dec_r
	pop rdi
	clc
lb_296:
; 	$ 0' ⊢ ,{ 0' 3' } : ,{ { } { } }
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov [r12-8*1],rdi
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
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_299
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_300
lb_299:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_300:
	pop rdi
	pop rax
	pop rdi
	bt rax,0
	jc lb_301
	push rdi
	call dec_r
	pop rdi
	clc
lb_301:
; 	∎ { 0' 1' }
; emt_get_ptn { 0' 1' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 0'
	mov rax,[r12-8*1]
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
	mov rax,[r12-8*2]
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
	jc clear_lb_302
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_302:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_303
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_303:
	pop r9
	rcr r9,1
	pop rax
	ret
