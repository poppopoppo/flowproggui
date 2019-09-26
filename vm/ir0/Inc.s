%include "mem.s"
main:
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
	call test4
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test4:
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
	mov r9,0
	not r9
	mov [r12],r9
	call fact
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*1],r9
	mov rdi,rax
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_5
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_6
lb_5:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_6:
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
fact:
; 	|» 0'
	jc emt_etr_c_lb_7
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_61
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_62
lb_61:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_62:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_8
emt_etr_c_lb_7:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_59
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_60
lb_59:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_60:
emt_etr_start_lb_8:
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
	jc lb_9
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_10
lb_9:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_10:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_11
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_12
lb_11:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_12:
	pop rax
	pop rdi
	bt rax,0
	jc lb_13
	push rdi
	call dec_r
	pop rdi
	clc
lb_13:
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
	jc lb_14
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_15
lb_14:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_15:
	pop rax
	pop rdi
	bt rax,0
	jc lb_16
	push rdi
	call dec_r
	pop rdi
	clc
lb_16:
; 	cmp { 0' 2' } ⊢ 0' : @[0].r2 ≃ ∐[@[0] @[0] ]
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
; emt_set_ptn { 2' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_21
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_22
lb_21:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_22:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_23
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_24
lb_23:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_24:
	pop rdi
	mov r9,[r12-8*3]
	mov r10,[r12-8*4]
	cmp r9,r10
	je lb_17
	mov rdi,0
	jmp lb_18
lb_17:
	mov rdi,1
lb_18:
	stc
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_19
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_20
lb_19:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_20:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_26
	mov rdi,0
	stc
	jmp agl_25_1
lb_26:
	mov rdi,1
	stc
	jmp agl_25_0
; 	∐ 0'
agl_25_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_50
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_51
lb_50:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_51:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
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
	jc lb_27
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_28
lb_27:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_28:
	pop rax
	pop rdi
	bt rax,0
	jc lb_29
	push rdi
	call dec_r
	pop rdi
	clc
lb_29:
; 	$ 1' ⊢ ,1',3' : ,r64,r64
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
	jc lb_30
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_31
lb_30:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_31:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_32
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_33
lb_32:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_33:
	pop rax
	pop rdi
	bt rax,0
	jc lb_34
	push rdi
	call dec_r
	pop rdi
	clc
lb_34:
; 	sub { 1' 2' } ⊢ 1' : r64
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
; emt_set_ptn { 2' 4' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_37
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_38
lb_37:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_38:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_39
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_40
lb_39:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_40:
	pop rdi
	mov r9,[r12-8*3]
	mov r10,[r12-8*5]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
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
; 	fact 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rax,rdi
; push_s  3'~x2 0'~b 1'~y1
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12-8*2]
	push r9
	mov r9,[r12]
	push r9
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
	mov [r12-8*4],r9
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_41
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_42
lb_41:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_42:
; 	mul { 3' 1' } ⊢ 1' : r64
; emt_get_ptn { 3' 1' }
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
; emt_set_ptn { 2' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_45
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_46
lb_45:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_46:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_47
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_48
lb_47:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_48:
	pop rdi
	mov r9,[r12-8*3]
	mov r10,[r12-8*4]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_43
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_44
lb_43:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_44:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b
	mov r9,[r12]
	bt r9,0
	jc clear_lb_49
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_49:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_25_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_57
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_58
lb_57:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_58:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
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
	jc lb_52
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_53
lb_52:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_53:
	pop rax
	pop rdi
	bt rax,0
	jc lb_54
	push rdi
	call dec_r
	pop rdi
	clc
lb_54:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[r12-8*3]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b 1'~x1
	mov r9,[r12]
	bt r9,0
	jc clear_lb_55
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_55:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_56
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_56:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_63
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_106
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_107
lb_106:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_107:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_64
emt_etr_c_lb_63:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_104
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_105
lb_104:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_105:
emt_etr_start_lb_64:
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
	jc lb_65
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_66
lb_65:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_66:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_67
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_68
lb_67:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_68:
	pop rax
	pop rdi
	bt rax,0
	jc lb_69
	push rdi
	call dec_r
	pop rdi
	clc
lb_69:
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
	jc lb_70
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_71
lb_70:
	mov r10,[r12]
	bts r10,2
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
; 	cmp { 0' 2' } ⊢ 0' : @[0].r2 ≃ ∐[@[0] @[0] ]
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
; emt_set_ptn { 2' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_77
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_78
lb_77:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_78:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_79
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_80
lb_79:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_80:
	pop rdi
	mov r9,[r12-8*3]
	mov r10,[r12-8*4]
	cmp r9,r10
	je lb_73
	mov rdi,0
	jmp lb_74
lb_73:
	mov rdi,1
lb_74:
	stc
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_75
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_76
lb_75:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_76:
; 	∠ 0'
; emt_get_ptn 0'
	mov rax,[r12-8*1]
	mov r9,[r12]
	bt r9,0
	cmp rax,0
	mov rdi,rax
	je lb_82
	mov rdi,0
	stc
	jmp agl_81_1
lb_82:
	mov rdi,1
	stc
	jmp agl_81_0
; 	∐ 0'
agl_81_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_95
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_96
lb_95:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_96:
; 	» 0xr1 |~ 2' : r64
	mov r9,0x1
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
	jc lb_83
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_84
lb_83:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_84:
	pop rax
	pop rdi
	bt rax,0
	jc lb_85
	push rdi
	call dec_r
	pop rdi
	clc
lb_85:
; 	sub { 1' 2' } ⊢ 1' : r64
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
; emt_set_ptn { 2' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_88
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_89
lb_88:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_89:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_90
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_91
lb_90:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_91:
	pop rdi
	mov r9,[r12-8*3]
	mov r10,[r12-8*4]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_86
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_87
lb_86:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_87:
; 	f0 1' ⊢ 1' : r64
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	mov rax,rdi
; push_s  0'~b0 1'~y1
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12-8*2]
	push r9
	mov r9,[r12]
	push r9
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
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_92
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_93
lb_92:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_93:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b0
	mov r9,[r12]
	bt r9,0
	jc clear_lb_94
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_94:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_81_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
	jc lb_99
	push rdi
	call dec_r
	pop rdi
	clc
lb_99:
; 	∎ 2'
; emt_get_ptn 2'
	mov rax,[r12-8*3]
	mov r9,[r12]
	bt r9,2
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b1 1'~x1
	mov r9,[r12]
	bt r9,0
	jc clear_lb_100
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_100:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_101
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_101:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_108
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_109
emt_etr_c_lb_108:
; emt_set_ptn {  }
emt_etr_start_lb_109:
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_112
	push rdi
	call dec_r
	pop rdi
	clc
lb_112:
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
	jc lb_113
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_114
lb_113:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_114:
	pop rax
	pop rdi
	bt rax,0
	jc lb_115
	push rdi
	call dec_r
	pop rdi
	clc
lb_115:
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
	jc lb_116
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_117
lb_116:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_117:
	pop rax
	pop rdi
	bt rax,0
	jc lb_118
	push rdi
	call dec_r
	pop rdi
	clc
lb_118:
; 	cmp { 1' 2' } ⊢ 1' : @[0].r2 ≃ ∐[@[0] @[0] ]
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
; emt_set_ptn { 2' 3' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_123
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_124
lb_123:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_124:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_125
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_126
lb_125:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_126:
	pop rdi
	mov r9,[r12-8*3]
	mov r10,[r12-8*4]
	cmp r9,r10
	je lb_119
	mov rdi,0
	jmp lb_120
lb_119:
	mov rdi,1
lb_120:
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_121
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_122
lb_121:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_122:
; 	∠ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	cmp rax,0
	mov rdi,rax
	je lb_128
	mov rdi,0
	stc
	jmp agl_127_1
lb_128:
	mov rdi,1
	stc
	jmp agl_127_0
; 	∐ 1'
agl_127_0:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_130
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_131
lb_130:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_131:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b0
	mov r9,[r12]
	bt r9,0
	jc clear_lb_129
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_129:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 1'
agl_127_1:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_133
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_134
lb_133:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_134:
; 	∎ 1'
; emt_get_ptn 1'
	mov rax,[r12-8*2]
	mov r9,[r12]
	bt r9,1
	push rax
	mov r9,0
	rcl r9,1
	push r9
;clear  0'~b0
	mov r9,[r12]
	bt r9,0
	jc clear_lb_132
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_132:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
; 	|» {  }
	jc emt_etr_c_lb_135
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_136
emt_etr_c_lb_135:
; emt_set_ptn {  }
emt_etr_start_lb_136:
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
	jc lb_137
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_138
lb_137:
	mov r10,[r12]
	bts r10,0
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_142
	push rdi
	call dec_r
	pop rdi
	clc
lb_142:
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_145
	push rdi
	call dec_r
	pop rdi
	clc
lb_145:
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
	jc lb_146
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_147
lb_146:
	mov r10,[r12]
	bts r10,3
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_153
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_154
lb_153:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_154:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 2'
	mov [r12-8*3],rdi
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
	jc clear_lb_155
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_155:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_156
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_157
emt_etr_c_lb_156:
; emt_set_ptn {  }
emt_etr_start_lb_157:
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
	jc lb_158
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_159
lb_158:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_159:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_160
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_161
lb_160:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_161:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_162
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_163
lb_162:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_163:
	pop rax
	pop rdi
	bt rax,0
	jc lb_164
	push rdi
	call dec_r
	pop rdi
	clc
lb_164:
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
	jc lb_165
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_166
lb_165:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_166:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_167
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_168
lb_167:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_168:
	pop rdi
	pop rax
	pop rdi
	bt rax,0
	jc lb_169
	push rdi
	call dec_r
	pop rdi
	clc
lb_169:
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
	jc clear_lb_170
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_170:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_171
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_171:
	pop r9
	rcr r9,1
	pop rax
	ret
