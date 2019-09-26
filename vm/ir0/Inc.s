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
; 	» 0xr9 |~ 1' : r64
	mov r9,0x9
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
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*1],r9
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_117
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_118
lb_117:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_118:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_119
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_120
lb_119:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_120:
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
	jc lb_109
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_110
lb_109:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_110:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_111
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_112
lb_111:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_112:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,2
	mov rdi,[rdi+8*3]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_113
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_114
lb_113:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_114:
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
	jc lb_36
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_37
lb_36:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_37:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 6'
	mov [r12-8*7],rdi
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
	setc r10b
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_34
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_35
lb_34:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_35:
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
	je lb_41
	mov rdi,0
	stc
	jmp agl_40_1
lb_41:
	mov rdi,1
	stc
	jmp agl_40_0
; 	∐ 4'
agl_40_0:
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_101
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_102
lb_101:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_102:
; 	$ 0' ⊢ ,0',5',6' : ,r64,r64,r64
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
	jc lb_42
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_43
lb_42:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_43:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_44
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_45
lb_44:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_45:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 6'
	mov [r12-8*7],rdi
	jc lb_46
	mov r10,[r12]
	btr r10,6
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_47
lb_46:
	mov r10,[r12]
	bts r10,6
	mov [r12],r10
lb_47:
	pop rax
	pop rdi
	bt rax,0
	jc lb_48
	push rdi
	call dec_r
	pop rdi
	clc
lb_48:
; 	$ 1' ⊢ ,1',7',8' : ,r64,r64,r64
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
	jc lb_49
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_50
lb_49:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_50:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_51
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_52
lb_51:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_52:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 8'
	mov [r12-8*9],rdi
	jc lb_53
	mov r10,[r12]
	btr r10,8
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_54
lb_53:
	mov r10,[r12]
	bts r10,8
	mov [r12],r10
lb_54:
	pop rax
	pop rdi
	bt rax,0
	jc lb_55
	push rdi
	call dec_r
	pop rdi
	clc
lb_55:
; 	$ 2' ⊢ ,2',9',10' : ,r64,r64,r64
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
	jc lb_56
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_57
lb_56:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_57:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 9'
	mov [r12-8*10],rdi
	jc lb_58
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_59
lb_58:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_59:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 10'
	mov [r12-8*11],rdi
	jc lb_60
	mov r10,[r12]
	btr r10,10
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_61
lb_60:
	mov r10,[r12]
	bts r10,10
	mov [r12],r10
lb_61:
	pop rax
	pop rdi
	bt rax,0
	jc lb_62
	push rdi
	call dec_r
	pop rdi
	clc
lb_62:
; 	» 0xr1 |~ 11' : r64
	mov r9,0x1
	mov [r12-8*12],r9
	mov r9,[r12]
	bts r9,11
	mov [r12],r9
; 	$ 11' ⊢ ,11' : ,r64
; emt_get_ptn 11'
	mov rax,[r12-8*12]
	mov r9,[r12]
	bt r9,11
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 11'
	mov [r12-8*12],rdi
	jc lb_63
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_64
lb_63:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_64:
	pop rax
	pop rdi
	bt rax,0
	jc lb_65
	push rdi
	call dec_r
	pop rdi
	clc
lb_65:
; 	$ 11' ⊢ ,11',12',13' : ,r64,r64,r64
; emt_get_ptn 11'
	mov rax,[r12-8*12]
	mov r9,[r12]
	bt r9,11
	mov rdi,rax
	mov rax,0
	mov r9,0
	rcl r9,1
	mov rax,r9
	rcr r9,1
	push rdi
	push rax
; emt_set_ptn 11'
	mov [r12-8*12],rdi
	jc lb_66
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_67
lb_66:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_67:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 12'
	mov [r12-8*13],rdi
	jc lb_68
	mov r10,[r12]
	btr r10,12
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_69
lb_68:
	mov r10,[r12]
	bts r10,12
	mov [r12],r10
lb_69:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 13'
	mov [r12-8*14],rdi
	jc lb_70
	mov r10,[r12]
	btr r10,13
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_71
lb_70:
	mov r10,[r12]
	bts r10,13
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
; 	sub { 0' 11' } ⊢ 0' : r64
; emt_get_ptn { 0' 11' }
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
; emt_get_ptn 11'
	mov rax,[r12-8*12]
	mov r9,[r12]
	bt r9,11
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; emt_set_ptn { 11' 14' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 11'
	mov [r12-8*12],rdi
	jc lb_75
	mov r10,[r12]
	btr r10,11
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_76
lb_75:
	mov r10,[r12]
	bts r10,11
	mov [r12],r10
lb_76:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 14'
	mov [r12-8*15],rdi
	jc lb_77
	mov r10,[r12]
	btr r10,14
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_78
lb_77:
	mov r10,[r12]
	bts r10,14
	mov [r12],r10
lb_78:
	pop rdi
	mov r9,[r12-8*12]
	mov r10,[r12-8*15]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_73
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_74
lb_73:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_74:
; 	tak { 0' 7' 9' } ⊢ 0' : r64
; emt_get_ptn { 0' 7' 9' }
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
; push_s  2'~z 6'~x1 8'~y1 3'~b 13'~t1 12'~t0 5'~x0 4'~c 0'~r0 10'~z1 1'~y
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*7]
	push r9
	mov r9,[r12-8*9]
	push r9
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*14]
	push r9
	mov r9,[r12-8*13]
	push r9
	mov r9,[r12-8*6]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12-8*11]
	push r9
	mov r9,[r12-8*2]
	push r9
	mov r9,[r12]
	push r9
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
	mov [r12-8*11],r9
	pop r9
	mov [r12-8*1],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*6],r9
	pop r9
	mov [r12-8*13],r9
	pop r9
	mov [r12-8*14],r9
	pop r9
	mov [r12-8*4],r9
	pop r9
	mov [r12-8*9],r9
	pop r9
	mov [r12-8*7],r9
	pop r9
	mov [r12-8*3],r9
	mov rdi,rax
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_79
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_80
lb_79:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_80:
; 	sub { 1' 12' } ⊢ 1' : r64
; emt_get_ptn { 1' 12' }
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
; emt_get_ptn 12'
	mov rax,[r12-8*13]
	mov r9,[r12]
	bt r9,12
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; emt_set_ptn { 7' 9' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 7'
	mov [r12-8*8],rdi
	jc lb_83
	mov r10,[r12]
	btr r10,7
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_84
lb_83:
	mov r10,[r12]
	bts r10,7
	mov [r12],r10
lb_84:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 9'
	mov [r12-8*10],rdi
	jc lb_85
	mov r10,[r12]
	btr r10,9
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_86
lb_85:
	mov r10,[r12]
	bts r10,9
	mov [r12],r10
lb_86:
	pop rdi
	mov r9,[r12-8*8]
	mov r10,[r12-8*10]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_81
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_82
lb_81:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_82:
; 	tak { 1' 10' 5' } ⊢ 1' : r64
; emt_get_ptn { 1' 10' 5' }
	mov rdi,3
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
; emt_get_ptn 10'
	mov rax,[r12-8*11]
	mov r9,[r12]
	bt r9,10
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	push rax
; emt_get_ptn 5'
	mov rax,[r12-8*6]
	mov r9,[r12]
	bt r9,5
	mov rdx,rax
	pop rdi
	mov rsi,2
	push rdi
	call exc
	pop rax
	clc
	mov rax,rdi
; push_s  2'~z 6'~x1 8'~y1 3'~b 13'~t1 4'~c 0'~r0 1'~r1
	mov r9,[r12-8*3]
	push r9
	mov r9,[r12-8*7]
	push r9
	mov r9,[r12-8*9]
	push r9
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*14]
	push r9
	mov r9,[r12-8*5]
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
	mov [r12-8*14],r9
	pop r9
	mov [r12-8*4],r9
	pop r9
	mov [r12-8*9],r9
	pop r9
	mov [r12-8*7],r9
	pop r9
	mov [r12-8*3],r9
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_87
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_88
lb_87:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_88:
; 	sub { 2' 13' } ⊢ 2' : r64
; emt_get_ptn { 2' 13' }
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
; emt_get_ptn 13'
	mov rax,[r12-8*14]
	mov r9,[r12]
	bt r9,13
	mov rdx,rax
	pop rdi
	mov rsi,1
	push rdi
	call exc
	pop rax
	clc
	mov rdi,rax
; emt_set_ptn { 5' 7' }
	push rdi
	mov r9,[rdi]
	bt r9,0
	mov rdi,[rdi+8*1]
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_91
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_92
lb_91:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_92:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 7'
	mov [r12-8*8],rdi
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
	mov r9,[r12-8*6]
	mov r10,[r12-8*8]
	sub r9,r10
	mov rdi,r9
	stc
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
; 	tak { 2' 6' 8' } ⊢ 2' : r64
; emt_get_ptn { 2' 6' 8' }
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
; push_s  2'~r2 3'~b 4'~c 0'~r0 1'~r1
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
	mov rdi,rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_95
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_96
lb_95:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_96:
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
; push_s  3'~b 4'~c 0'~rr
	mov r9,[r12-8*4]
	push r9
	mov r9,[r12-8*5]
	push r9
	mov r9,[r12-8*1]
	push r9
	mov r9,[r12]
	push r9
	mov r9,0
	not r9
	mov [r12],r9
	call tak
; pop_s
	pop r9
	mov [r12],r9
	pop r9
	mov [r12-8*1],r9
	pop r9
	mov [r12-8*5],r9
	pop r9
	mov [r12-8*4],r9
	mov rdi,rax
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_97
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_98
lb_97:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_98:
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
	jc clear_lb_99
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_99:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_100
	mov rdi,[r12-8*5]
	call dec_r
clear_lb_100:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 4'
agl_40_1:
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_107
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_108
lb_107:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_108:
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
	jc clear_lb_103
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_103:
	mov r9,[r12]
	bt r9,4
	jc clear_lb_104
	mov rdi,[r12-8*5]
	call dec_r
clear_lb_104:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_105
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_105:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_106
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_106:
	pop r9
	rcr r9,1
	pop rax
	ret
fact:
; 	|» 0'
	jc emt_etr_c_lb_121
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_177
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_178
lb_177:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_178:
	pop rdi
	call dec_r
jmp emt_etr_start_lb_122
emt_etr_c_lb_121:
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
emt_etr_start_lb_122:
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
	jc lb_123
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_124
lb_123:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_124:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_125
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_126
lb_125:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_126:
	pop rax
	pop rdi
	bt rax,0
	jc lb_127
	push rdi
	call dec_r
	pop rdi
	clc
lb_127:
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_130
	push rdi
	call dec_r
	pop rdi
	clc
lb_130:
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
	jc lb_135
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_136
lb_135:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_136:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_137
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_138
lb_137:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_138:
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
	setc r10b
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
	jc lb_131
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_132
lb_131:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_132:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_133
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_134
lb_133:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_134:
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
	je lb_140
	mov rdi,0
	stc
	jmp agl_139_1
lb_140:
	mov rdi,1
	stc
	jmp agl_139_0
; 	∐ 0'
agl_139_0:
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
	jc lb_141
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_142
lb_141:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_142:
	pop rax
	pop rdi
	bt rax,0
	jc lb_143
	push rdi
	call dec_r
	pop rdi
	clc
lb_143:
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
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_146
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_147
lb_146:
	mov r10,[r12]
	bts r10,4
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
; emt_set_ptn 5'
	mov [r12-8*6],rdi
	jc lb_153
	mov r10,[r12]
	btr r10,5
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_154
lb_153:
	mov r10,[r12]
	bts r10,5
	mov [r12],r10
lb_154:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*6]
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_149
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_150
lb_149:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_150:
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
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_155
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_156
lb_155:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_156:
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
	jc lb_159
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_160
lb_159:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_160:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_161
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_162
lb_161:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_162:
	pop rdi
	mov r9,[r12-8*4]
	mov r10,[r12-8*5]
	imul r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_157
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_158
lb_157:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_158:
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
	jc clear_lb_163
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_163:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_164
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_164:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_139_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_173
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_174
lb_173:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_174:
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_169
	push rdi
	call dec_r
	pop rdi
	clc
lb_169:
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
	jc clear_lb_170
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_170:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_171
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_171:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_172
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_172:
	pop r9
	rcr r9,1
	pop rax
	ret
f0:
; 	|» 0'
	jc emt_etr_c_lb_179
	push rdi
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
	call dec_r
jmp emt_etr_start_lb_180
emt_etr_c_lb_179:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_222
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_223
lb_222:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_223:
emt_etr_start_lb_180:
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
	jc lb_181
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_182
lb_181:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_182:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_185
	push rdi
	call dec_r
	pop rdi
	clc
lb_185:
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
	jc lb_186
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_187
lb_186:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_187:
	pop rax
	pop rdi
	bt rax,0
	jc lb_188
	push rdi
	call dec_r
	pop rdi
	clc
lb_188:
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
	jc lb_193
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_194
lb_193:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_194:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
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
	setc r10b
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
	jc lb_189
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_190
lb_189:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_190:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_191
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_192
lb_191:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_192:
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
	je lb_198
	mov rdi,0
	stc
	jmp agl_197_1
lb_198:
	mov rdi,1
	stc
	jmp agl_197_0
; 	∐ 0'
agl_197_0:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
	jc lb_212
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_213
lb_212:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_213:
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
	jc lb_199
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_200
lb_199:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_200:
	pop rax
	pop rdi
	bt rax,0
	jc lb_201
	push rdi
	call dec_r
	pop rdi
	clc
lb_201:
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
	sub r9,r10
	mov rdi,r9
	stc
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_202
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_203
lb_202:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_203:
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
	mov rdi,rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_208
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_209
lb_208:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_209:
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
	jc clear_lb_210
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_210:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_211
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_211:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 0'
agl_197_1:
; emt_set_ptn 0'
	mov [r12-8*1],rdi
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_216
	push rdi
	call dec_r
	pop rdi
	clc
lb_216:
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
	jc clear_lb_217
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_217:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_218
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_218:
	mov r9,[r12]
	bt r9,1
	jc clear_lb_219
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_219:
	pop r9
	rcr r9,1
	pop rax
	ret
test3:
; 	|» {  }
	jc emt_etr_c_lb_226
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_227
emt_etr_c_lb_226:
; emt_set_ptn {  }
emt_etr_start_lb_227:
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
	jc lb_228
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_229
lb_228:
	mov r10,[r12]
	bts r10,0
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_233
	push rdi
	call dec_r
	pop rdi
	clc
lb_233:
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
	pop rax
	pop rdi
	bt rax,0
	jc lb_236
	push rdi
	call dec_r
	pop rdi
	clc
lb_236:
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
	jc lb_241
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_242
lb_241:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_242:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 4'
	mov [r12-8*5],rdi
	jc lb_243
	mov r10,[r12]
	btr r10,4
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_244
lb_243:
	mov r10,[r12]
	bts r10,4
	mov [r12],r10
lb_244:
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
	setc r10b
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
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_239
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_240
lb_239:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_240:
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
	je lb_246
	mov rdi,0
	stc
	jmp agl_245_1
lb_246:
	mov rdi,1
	stc
	jmp agl_245_0
; 	∐ 1'
agl_245_0:
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
	jc clear_lb_247
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_247:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_248
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_248:
	pop r9
	rcr r9,1
	pop rax
	ret
; 	∐ 1'
agl_245_1:
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_253
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_254
lb_253:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_254:
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
	jc clear_lb_251
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_251:
	mov r9,[r12]
	bt r9,0
	jc clear_lb_252
	mov rdi,[r12-8*1]
	call dec_r
clear_lb_252:
	pop r9
	rcr r9,1
	pop rax
	ret
test2:
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
	jc lb_266
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_267
lb_266:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_267:
	pop rax
	pop rdi
	bt rax,0
	jc lb_268
	push rdi
	call dec_r
	pop rdi
	clc
lb_268:
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
	imul r9,r10
	mov rdi,r9
	stc
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
	jc clear_lb_275
	mov rdi,[r12-8*2]
	call dec_r
clear_lb_275:
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	jc emt_etr_c_lb_276
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
jmp emt_etr_start_lb_277
emt_etr_c_lb_276:
; emt_set_ptn {  }
emt_etr_start_lb_277:
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
	jc lb_278
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_279
lb_278:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_279:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_280
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_281
lb_280:
	mov r10,[r12]
	bts r10,1
	mov [r12],r10
lb_281:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_282
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_283
lb_282:
	mov r10,[r12]
	bts r10,2
	mov [r12],r10
lb_283:
	pop rax
	pop rdi
	bt rax,0
	jc lb_284
	push rdi
	call dec_r
	pop rdi
	clc
lb_284:
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
	jc lb_285
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_286
lb_285:
	mov r10,[r12]
	bts r10,0
	mov [r12],r10
lb_286:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_287
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_288
lb_287:
	mov r10,[r12]
	bts r10,3
	mov [r12],r10
lb_288:
	pop rdi
	pop rax
	pop rdi
	bt rax,0
	jc lb_289
	push rdi
	call dec_r
	pop rdi
	clc
lb_289:
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
	jc clear_lb_290
	mov rdi,[r12-8*3]
	call dec_r
clear_lb_290:
	mov r9,[r12]
	bt r9,3
	jc clear_lb_291
	mov rdi,[r12-8*4]
	call dec_r
clear_lb_291:
	pop r9
	rcr r9,1
	pop rax
	ret
