%include "cmu.s"
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
	cmp rdi,0
	call f0
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f0:
; 	|» {  }
	jz _f0
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f0
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
; 	» "A B C " |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_1+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,2
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_2
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_3
emt_set_ptn_0_lb_2:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_3:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_4
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_4:
; 	» 0xr0 |~ 0' : r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	g0 { 1' 2' } ⊢ { 0' 1' 2' } : { ℙ r64 g0 }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
mov rsi,2

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
mov rsi,1

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_8
	and r12,~0b1000
lb_8:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_9
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_10
emt_set_ptn_0_lb_9:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_10:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r10
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_14:
	call _g0
	mov QWORD [tmp],rax
	jc call_c_lb_15
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_24
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_25
emt_set_ptn_0_lb_24:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_25:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_28
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_29
emt_set_ptn_0_lb_28:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_29:
	pop rbx
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_16
call_c_lb_15:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_17
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_18
emt_set_ptn_0_lb_17:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_18:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_21
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_22
emt_set_ptn_0_lb_21:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_22:
	pop rbx
call_nc_lb_16:
; 	∎ { 0' 1' 2' }
; emt_get_crt_ptn { 0' 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,3
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_33
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_34
emt_get_crt_ptn_0_lb_33:
; unboxed
	stc
emt_get_crt_ptn_1_lb_34:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 1'
	mov QWORD rcx,r9
	stc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_35
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_36
emt_get_crt_ptn_0_lb_35:
; unboxed
	stc
emt_get_crt_ptn_1_lb_36:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,2
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_37
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_30
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_30:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_32
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_32:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_37:
;clear 
	mov rax,r11
	stc
	ret
_grm_init_tbl:
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,5
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	ret
_g0_etr_tbl:
	push QWORD 1
	jmp _g0_tbl
g0:
_g0:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g0_tbl:
_g0_g0_0:
	push rsi
	jmp _grm_ptn_40
_grm_ptn_39:
	add rsi,1
_grm_ptn_40:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_39
	cmp r11,10
	jz _grm_ptn_39
	cmp r11,32
	jz _grm_ptn_39
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,65
	jnz _g0_g0_0_failed
	add rsi,1
	jmp _grm_ptn_42
_grm_ptn_41:
	add rsi,1
_grm_ptn_42:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_41
	cmp r11,10
	jz _grm_ptn_41
	cmp r11,32
	jz _grm_ptn_41
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,66
	jnz _g0_g0_0_failed
	add rsi,1
	jmp _grm_ptn_44
_grm_ptn_43:
	add rsi,1
_grm_ptn_44:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_43
	cmp r11,10
	jz _grm_ptn_43
	cmp r11,32
	jz _grm_ptn_43
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,67
	jnz _g0_g0_0_failed
	add rsi,1
_g0_g0_0_succeed:
	pop r8
	jmp _g0_succeed
_g0_g0_0_failed:
	pop rsi
	jmp _g0_failed
_g0_succeed:
	pop rbx
	cmp rbx,0
	jnz _g0_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g0_succeed_tbl:
	mov rax,1
	ret
_g0_failed:
	pop rbx
	cmp rbx,0
	jnz _g0_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g0_failed_tbl:
	mov rax,0
	ret
_l_al_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb _grm_lb_l_al_45
	cmp r11,122
	ja _grm_lb_l_al_45
	add rsi,1
	mov rax,1
	ret
_grm_lb_l_al_45:
	mov rax,0
	ret
_u_al_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb _grm_lb_u_al_46
	cmp r11,90
	ja _grm_lb_u_al_46
	add rsi,1
	mov rax,1
	ret
_grm_lb_u_al_46:
	mov rax,0
	ret
_dgt_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb _grm_lb_dgt_47
	cmp r11,57
	ja _grm_lb_dgt_47
	add rsi,1
	mov rax,1
	ret
_grm_lb_dgt_47:
	mov rax,0
	ret
_chr_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc _grm_lb_chr_48
	add rsi,1
	bt r11,6
	jnc _grm_lb_chr_48
	add rsi,1
	bt r11,5
	jnc _grm_lb_chr_48
	add rsi,1
	mov rax,1
	ret
_grm_lb_chr_48:
	mov rax,0
	ret
section .data
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
	_dyn_g0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cmp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mul:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_sub:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_add:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_pnt:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_read:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_scc:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cns:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_nil:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	cst_stg_1: db 65,32,66,32,67,32,0,0
