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
; 	» 0xre |~ 0' : r64
	mov r9,0xe
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
; push_s  0'~r
	mov r9,[r12-8*1]
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
	mov [r12-8*1],r9
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
; push_s  0'~y
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
	jc lb_142
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_143
lb_142:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_143:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [r12-8*2],rdi
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
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
	mov [r12-8*2],rdi
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
	mov [r12-8*3],rdi
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
	jc lb_134
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_135
lb_134:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_135:
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
; push_s  6'~r1 2'~z 3'~b 5'~r0 4'~c 0'~x 1'~y
	mov r9,[r12-8*7]
	push r9
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
	pop r9
	mov [r12-8*7],r9
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
	jc lb_101
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_102
lb_101:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_102:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_103
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_104
lb_103:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_104:
	pop rax
	pop rdi
	bt rax,0
	jc lb_105
	push rdi
	call dec_r
	pop rdi
	clc
lb_105:
; 	» 0xr1 |~ 8' : r64
	mov r9,0x1
	mov [r12-8*9],r9
	mov r9,[r12]
	bts r9,8
	mov [r12],r9
; 	$ 8' ⊢ ,8' : ,r64
; emt_get_ptn 8'
	mov rax,[r12-8*9]
	mov r9,[r12]
	bt r9,8
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 8'
	mov [r12-8*9],rdi
	jc lb_106
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_107
lb_106:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_107:
	pop rax
	pop rdi
	bt rax,0
	jc lb_108
	push rdi
	call dec_r
	pop rdi
	clc
lb_108:
; 	sub { 7' 8' } ⊢ 7' : r64
; emt_get_ptn { 7' 8' }
	mov rdi,2
	call mlc
	push rax
; emt_get_ptn 7'
	mov rax,[r12-8*8]
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
	mov rax,[r12-8*9]
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
; emt_set_ptn { 8' 9' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 8'
	mov [r12-8*9],rdi
	jc lb_111
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_112
lb_111:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_112:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 9'
	mov [r12-8*10],rdi
	jc lb_113
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_114
lb_113:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_114:
	pop rdi
	mov r9,[r12-8*9]
	mov r10,[r12-8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_109
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_110
lb_109:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_110:
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
	jc lb_115
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_116
lb_115:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_116:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 8'
	mov [r12-8*9],rdi
	jc lb_117
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_118
lb_117:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_118:
	pop rax
	pop rdi
	bt rax,0
	jc lb_119
	push rdi
	call dec_r
	pop rdi
	clc
lb_119:
; 	$ 1' ⊢ ,1',9' : ,r64,r64
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
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 9'
	mov [r12-8*10],rdi
	jc lb_122
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_123
lb_122:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_123:
	pop rax
	pop rdi
	bt rax,0
	jc lb_124
	push rdi
	call dec_r
	pop rdi
	clc
lb_124:
; 	tak { 7' 8' 9' } ⊢ 7' : r64
; emt_get_ptn { 7' 8' 9' }
	mov rdi,3
	call mlc
	push rax
; emt_get_ptn 7'
	mov rax,[r12-8*8]
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
	mov rax,[r12-8*9]
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
	mov rax,[r12-8*10]
	mov r9,[r12]
	bt r9,9
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  2'~z 6'~r1 7'~r2 3'~b 5'~r0 4'~c 0'~x 1'~y
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*7]
	push r9
	mov r9,[r12-8*8]
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
	mov [r12-8*8],r9
	pop r9
	mov [r12-8*7],r9
	pop r9
	mov [r12-8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_125
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_126
lb_125:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_126:
; 	tak { 5' 6' 7' } ⊢ 5' : r64
; emt_get_ptn { 5' 6' 7' }
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
; emt_get_ptn 7'
	mov rax,[r12-8*8]
	mov r9,[r12]
	bt r9,7
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  2'~z 3'~b 5'~rr 4'~c 0'~x 1'~y
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
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_127
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_128
lb_127:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_128:
; 	∎ 5'
; emt_get_ptn 5'
	mov rax,[r12-8*6]
	mov r9,[r12]
	bt r9,5
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  2'~z 3'~b 4'~c 0'~x 1'~y
	mov r9,[r12]
	bt r9,2
	jc clear_lb_129
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_129:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_130
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_130:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_131
	mov rdi,[r12-8*5]
	call dec_r
clear_lb_131:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_132
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_132:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_133
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_133:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_148
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
jmp emt_etr_start_lb_149
emt_etr_c_lb_148:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
emt_etr_start_lb_149:
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
	jc lb_150
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_151
lb_150:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_151:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_154
	push rdi
	call dec_r
	pop rdi
	clc
lb_154:
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
	jc lb_155
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_156
lb_155:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_156:
	pop rax
	pop rdi
	bt rax,0
	jc lb_157
	push rdi
	call dec_r
	pop rdi
	clc
lb_157:
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
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
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
	jle cmp_jb_lb_158
	mov r10,1
cmp_jb_lb_158:
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
	jc lb_159
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_160
lb_159:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_160:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_161
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_162
lb_161:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_162:
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
	je lb_168
	mov rdi,0
	stc
	jmp agl_167_1
lb_168:
	mov rdi,1
	stc
	jmp agl_167_0
; 	∐ 0'
agl_167_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_193
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_194
lb_193:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_194:
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_171
	push rdi
	call dec_r
	pop rdi
	clc
lb_171:
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
	jc lb_172
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_173
lb_172:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_173:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_174
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_175
lb_174:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_175:
	pop rax
	pop rdi
	bt rax,0
	jc lb_176
	push rdi
	call dec_r
	pop rdi
	clc
lb_176:
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
	jc lb_179
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_180
lb_179:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_180:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_181
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_182
lb_181:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_182:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_177
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_178
lb_177:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_178:
; 	fact 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rax,rdi
; push_s  2'~c 4'~x2 0'~b 1'~y1
	mov r9,[r12-8*3]
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
	call fact
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
	mov [r12-8*3],r9
	pushf
	sub r15,1
	popf
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_183
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_184
lb_183:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_184:
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
	jc lb_187
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_188
lb_187:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_188:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_189
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_190
lb_189:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_190:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
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
	jc clear_lb_191
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_191:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_192
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_192:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_167_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
	jc clear_lb_198
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_198:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_199
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_199:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_200
	mov rdi,[r12-8*2]
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
	mov [r12-8*1],rdi
	jc lb_253
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_254
lb_253:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_254:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_208
emt_etr_c_lb_207:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
emt_etr_start_lb_208:
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
	mov [r12-8*2],rdi
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
	jc lb_222
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_223
lb_222:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_223:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_224
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_225
lb_224:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_225:
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
	mov [r12-8*1],rdi
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_220
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_221
lb_220:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_221:
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
	je lb_227
	mov rdi,0
	stc
	jmp agl_226_1
lb_227:
	mov rdi,1
	stc
	jmp agl_226_0
; 	∐ 0'
agl_226_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_241
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_242
lb_241:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_242:
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
	jc lb_228
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_229
lb_228:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_229:
	pop rax
	pop rdi
	bt rax,0
	jc lb_230
	push rdi
	call dec_r
	pop rdi
	clc
lb_230:
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
	jc lb_233
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_234
lb_233:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_234:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
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
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_231
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_232
lb_231:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_232:
; 	f0 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rax,rdi
; push_s  2'~c 0'~b0 1'~y1
	mov r9,[r12-8*3]
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
	call f0
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*2],r9
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
	jc lb_237
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_238
lb_237:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_238:
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
	jc clear_lb_239
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_239:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_240
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_240:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_226_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_249
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_250
lb_249:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_250:
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
	jc lb_243
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_244
lb_243:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_244:
	pop rax
	pop rdi
	bt rax,0
	jc lb_245
	push rdi
	call dec_r
	pop rdi
	clc
lb_245:
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
	jc clear_lb_246
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_246:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_247
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_247:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_248
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_248:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_255
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_256
emt_etr_c_lb_255:
; emt_set_ptn {  }
emt_etr_start_lb_256:
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
	jc lb_257
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_258
lb_257:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_258:
	pop rax
	pop rdi
	bt rax,0
	jc lb_259
	push rdi
	call dec_r
	pop rdi
	clc
lb_259:
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
	jc lb_260
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_261
lb_260:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_261:
	pop rax
	pop rdi
	bt rax,0
	jc lb_262
	push rdi
	call dec_r
	pop rdi
	clc
lb_262:
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
	jc lb_263
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_264
lb_263:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_264:
	pop rax
	pop rdi
	bt rax,0
	jc lb_265
	push rdi
	call dec_r
	pop rdi
	clc
lb_265:
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
	jc lb_271
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_272
lb_271:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_272:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_273
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_274
lb_273:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_274:
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
	jle cmp_jb_lb_266
	mov r10,1
cmp_jb_lb_266:
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
	jc lb_267
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_268
lb_267:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_268:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_269
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_270
lb_269:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_270:
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
	je lb_276
	mov rdi,0
	stc
	jmp agl_275_1
lb_276:
	mov rdi,1
	stc
	jmp agl_275_0
; 	∐ 1'
agl_275_0:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_279
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_280
lb_279:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_280:
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
	jc clear_lb_277
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_277:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_278
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_278:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 1'
agl_275_1:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
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
	jc clear_lb_281
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_281:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_282
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_282:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_285
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_286
emt_etr_c_lb_285:
; emt_set_ptn {  }
emt_etr_start_lb_286:
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
	jc lb_287
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_288
lb_287:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_288:
	pop rax
	pop rdi
	bt rax,0
	jc lb_289
	push rdi
	call dec_r
	pop rdi
	clc
lb_289:
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
	jc lb_290
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_291
lb_290:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_291:
	pop rax
	pop rdi
	bt rax,0
	jc lb_292
	push rdi
	call dec_r
	pop rdi
	clc
lb_292:
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
	jc lb_293
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_294
lb_293:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_294:
	pop rax
	pop rdi
	bt rax,0
	jc lb_295
	push rdi
	call dec_r
	pop rdi
	clc
lb_295:
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
	jc lb_296
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_297
lb_296:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_297:
	pop rax
	pop rdi
	bt rax,0
	jc lb_298
	push rdi
	call dec_r
	pop rdi
	clc
lb_298:
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_303
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_304
lb_303:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_304:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_299
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_300
lb_299:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_300:
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
	jc clear_lb_305
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_305:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_306
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_307
emt_etr_c_lb_306:
; emt_set_ptn {  }
emt_etr_start_lb_307:
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
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_310
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_311
lb_310:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_311:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_312
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_313
lb_312:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_313:
	pop rax
	pop rdi
	bt rax,0
	jc lb_314
	push rdi
	call dec_r
	pop rdi
	clc
lb_314:
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
	jc lb_315
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_316
lb_315:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_316:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_319
	push rdi
	call dec_r
	pop rdi
	clc
lb_319:
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
	jc clear_lb_320
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_320:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_321
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_321:
	pop r9
	rcr r9,1
	pop rax
	ret
