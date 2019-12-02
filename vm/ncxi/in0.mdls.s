%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_332
	call exec_out
	jmp _end
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call emt_q
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	ret
NS_E_321:
NS_E_RDI_321:
NS_E_321_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_322
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_322:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_324:
NS_E_RDI_324:
NS_E_324_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_324_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_324_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_325:
NS_E_RDI_325:
NS_E_325_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_325_LB_0
	cmp r11,57
	ja NS_E_325_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_325_LB_0:
	mov rax,0
	ret
NS_E_327:
NS_E_RDI_327:
NS_E_327_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_327_LB_0
	cmp r11,122
	ja NS_E_327_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_327_LB_0:
	mov rax,0
	ret
NS_E_326:
NS_E_RDI_326:
NS_E_326_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_326_LB_0
	cmp r11,90
	ja NS_E_326_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_326_LB_0:
	mov rax,0
	ret
NS_E_22:
NS_E_RDI_22:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_26:
	mov rdi,r8
	bt r12,0
NS_E_RDI_26:
	mov rsi,0
	setc sil
	push rsi
	call pp_v
	push rax
	push rdi
	mov rdi,2
	call mlc
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	pop rsi
	btr QWORD [rax],0
	btr QWORD [rax],1
	or QWORD [rax],rsi
	clc
	ret
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_323:
NS_E_RDI_323:
NS_E_323_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_323_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_323_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_332:
NS_E_RDI_332:
; » 0xr6 |~ {  } ⊢ %_328 : %_328
 ; {>  }
; 	» 0xr6 _ ⊢ 0' : %_328
	mov rdi,0x6
	mov r13,rdi
	bts r12,0
; _f14 %_328 ⊢ { %_329 %_330 } : { %_329 %_330 }
 ; {>  %_328~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
; pop_iv
	add rsp,8
; _f19 %_330 ⊢ %_331 : %_331
 ; {>  %_330~1':_stg %_329~0':_r64 }
; _f19 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_335
	btr r12,0
	jmp LB_336
LB_335:
	bts r12,0
LB_336:
	call NS_E_19
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_337
	btr r12,1
	jmp LB_338
LB_337:
	bts r12,1
LB_338:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_333
	btr r12,0
	jmp LB_334
LB_333:
	bts r12,0
LB_334:
	add rsp,16
; ∎ {  }
 ; {>  %_331~1':_stg %_329~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_339
	mov rdi,r14
	call dlt
LB_339:
	bt r12,0
	jc LB_340
	mov rdi,r13
	call dlt
LB_340:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_321:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_321
	NS_E_DYN_324:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_324
	NS_E_DYN_325:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_325
	NS_E_DYN_326:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_326
	NS_E_DYN_327:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_327
	CST_DYN_332:
		dq 0x0001_0001_00_82_ffff
		dq 1
