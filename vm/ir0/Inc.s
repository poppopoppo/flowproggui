%include "mem.s"
main:
	mov r12,rsp
	lea rsp,[rsp-8*200]
	xor rax,rax
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	call test2
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test2:
; 	|» {  }
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
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
	jc lb_0
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_1
lb_0:
	bts r10,0
	mov [r12],r10
lb_1:
	pop rax
	pop rdi
	bt rax,0
	jc lb_2
	push rdi
	call dec_r
	pop rdi
	clc
lb_2:
; 	» 0xrffffccccafab00b0 |~ 1' : r64
	mov r9,0xffffccccafab00b0
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
	jc lb_3
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_4
lb_3:
	bts r10,1
	mov [r12],r10
lb_4:
	pop rax
	pop rdi
	bt rax,0
	jc lb_5
	push rdi
	call dec_r
	pop rdi
	clc
lb_5:
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
;clear 
	pop r9
	rcr r9,1
	pop rax
	ret
test0:
; 	|» {  }
	push rdi
; emt_set_ptn {  }
	pop rdi
	call dec_r
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
	jc lb_6
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_7
lb_6:
	bts r10,0
	mov [r12],r10
lb_7:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 1'
	mov [r12-8*2],rdi
	jc lb_8
	mov r10,[r12]
	btr r10,1
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_9
lb_8:
	bts r10,1
	mov [r12],r10
lb_9:
	pop rax
	pop rdi
	bt rax,0
	push rdi
	push rax
; emt_set_ptn 2'
	mov [r12-8*3],rdi
	jc lb_10
	mov r10,[r12]
	btr r10,2
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_11
lb_10:
	bts r10,2
	mov [r12],r10
lb_11:
	pop rax
	pop rdi
	bt rax,0
	jc lb_12
	push rdi
	call dec_r
	pop rdi
	clc
lb_12:
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
	jc lb_13
	mov r10,[r12]
	btr r10,0
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_14
lb_13:
	bts r10,0
	mov [r12],r10
lb_14:
	pop rdi
	push rdi
	mov r9,[rdi]
	bt r9,1
	mov rdi,[rdi+8*2]
; emt_set_ptn 3'
	mov [r12-8*4],rdi
	jc lb_15
	mov r10,[r12]
	btr r10,3
	mov [r12],r10
	call inc_r
	mov rax,rdi
	jmp lb_16
lb_15:
	bts r10,3
	mov [r12],r10
lb_16:
	pop rdi
	pop rax
	pop rdi
	bt rax,0
	jc lb_17
	push rdi
	call dec_r
	pop rdi
	clc
lb_17:
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
	jc lb_18
	mov rdi,[r12-8*3]
	call dec_r
lb_18:
	mov r9,[r12]
	bt r9,3
	jc lb_19
	mov rdi,[r12-8*4]
	call dec_r
lb_19:
	pop r9
	rcr r9,1
	pop rax
	ret
