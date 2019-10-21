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
; 	» 0xr0 |~ 0' : r64
	mov QWORD r9,0x0
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» "JJJJJ" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_4+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,3
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_5
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_6
emt_set_ptn_0_lb_5:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_6:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_7
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
emt_dec_ptn_0_lb_7:
; 	g3 { 2' 1' } ⊢ { 0' 1' 2' } : { ℙ r64 g3 }
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
	mov r11,r9
	bts r12,3
; emt_ptn_set_ptn { 2' 3' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_8
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_9
emt_set_ptn_0_lb_8:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_9:
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_13
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_13:
	call _g3
	mov QWORD [tmp],rax
	jc call_c_lb_14
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
	jc emt_set_ptn_0_lb_23
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_24
emt_set_ptn_0_lb_23:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_24:
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
	jc emt_set_ptn_0_lb_27
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_28
emt_set_ptn_0_lb_27:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_28:
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
	jmp call_nc_lb_15
call_c_lb_14:
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
	jc emt_set_ptn_0_lb_16
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_17
emt_set_ptn_0_lb_16:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_17:
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
	jc emt_set_ptn_0_lb_20
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_21
emt_set_ptn_0_lb_20:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_21:
	pop rbx
call_nc_lb_15:
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
	jc emt_get_crt_ptn_0_lb_32
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_33
emt_get_crt_ptn_0_lb_32:
; unboxed
	stc
emt_get_crt_ptn_1_lb_33:
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
	jc emt_get_crt_ptn_0_lb_34
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_35
emt_get_crt_ptn_0_lb_34:
; unboxed
	stc
emt_get_crt_ptn_1_lb_35:
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
	jc ret_lb_36
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_29
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
emt_dec_ptn_0_lb_29:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_31
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
emt_dec_ptn_0_lb_31:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_36:
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
	imul rcx,3
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	ret
_g3_etr_tbl:
	push QWORD 1
	jmp _g3_tbl
g3:
_g3:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g3_tbl:
_g3_r4:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,74
	jnz _g3_r4_failed
	add rsi,1
	call _g3_etr_tbl
; g3
_g3_r4_succeed:
	pop r8
	jmp _g3_succeed
_g3_r4_failed:
	pop rsi
_g3_r5:
	push rsi
_g3_r5_succeed:
	pop r8
	jmp _g3_succeed
_g3_r5_failed:
	pop rsi
	jmp _g3_failed
_g3_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g3_succeed_tbl
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
_g3_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g3_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g3_failed_tbl
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
_g3_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_g1_etr_tbl:
	push QWORD 1
	jmp _g1_tbl
g1:
_g1:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g1_tbl:
_g1_r3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,88
	jnz _g1_r3_failed
	add rsi,1
	call _g0_etr_tbl
; g0
_g1_r3_succeed:
	pop r8
	jmp _g1_succeed
_g1_r3_failed:
	pop rsi
	jmp _g1_failed
_g1_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g1_succeed_tbl
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
_g1_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g1_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g1_failed_tbl
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
_g1_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
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
_g0_r0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,72
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,101
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,108
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,108
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,111
	jnz _g0_r0_failed
	add rsi,5
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,87
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,111
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,114
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,108
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,100
	jnz _g0_r0_failed
	add rsi,5
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,33
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,33
	jnz _g0_r0_failed
	add rsi,2
_g0_r0_succeed:
	pop r8
	jmp _g0_succeed
_g0_r0_failed:
	pop rsi
_g0_r1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,72
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,111
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,111
	jnz _g0_r1_failed
	add rsi,3
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,32
	jnz _g0_r1_failed
	add rsi,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,66
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,97
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,97
	jnz _g0_r1_failed
	add rsi,3
_g0_r1_succeed:
	pop r8
	jmp _g0_succeed
_g0_r1_failed:
	pop rsi
_g0_r2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,82
	jnz _g0_r2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,114
	jnz _g0_r2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,114
	jnz _g0_r2_failed
	add rsi,3
	call _g0_etr_tbl
; g0
_g0_r2_succeed:
	pop r8
	jmp _g0_succeed
_g0_r2_failed:
	pop rsi
	jmp _g0_failed
_g0_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g0_succeed_tbl
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
	pop rdi
	pop rsi
	mov rax,1
	ret
_g0_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g0_failed_tbl
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
	pop rdi
	pop rsi
	mov rax,0
	ret
section .data
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
	_dyn_g3:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_chr:
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
	cst_stg_4: db 74,74,74,74,74,0,0,0
