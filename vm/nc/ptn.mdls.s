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
	call test7
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
test7:
; 	|» {  }
	jz _test7
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
jmp _test7
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test7:
; 	» "ABDs" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_536+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,4
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
	jc emt_set_ptn_0_lb_537
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_538
emt_set_ptn_0_lb_537:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_538:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_539
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_539:
; 	» "oijfe33" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_540+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,1
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_541
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_542
emt_set_ptn_0_lb_541:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_542:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_543
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
emt_dec_ptn_0_lb_543:
; 	scc { 1' 2' } ⊢ 0' : ℙ
	mov QWORD [tmp],rbx
	mov QWORD [tmp+8*1],r14
	mov QWORD [tmp+8*2],r15
	mov QWORD rbx,r9
	mov QWORD r14,r10
;push_reg
	push QWORD r9
	push QWORD r10
	mov r15,[rbx]
	add r15,[r14]
	and r15,0xffff
	mov r8,[rbx]
	mov r9,[r14]
	shr r8,48
	shr r9,48
	mov rax,0
	mov rdi,r8
	add rdi,r9
	bt r15,3
	jnc scc_0_lb_546
	btr r15,3
	add rdi,1
scc_0_lb_546:
	call mlc
	btr r12,0
	mov QWORD rdi,[rax]
	bts rdi,16
	and rdi,~0xffff
	add rdi,r15
	mov QWORD [rax],rdi
	mov r15,0
	mov r8,0
scc_1_lb_547:
	mov r15b,BYTE [rbx+r8+8*1]
	mov BYTE [rax+r8+8*1],r15b
	add r8,1
	cmp r15,0
	jnz scc_1_lb_547
	mov r9,0
	sub r8,1
	lea r8,[rax+r8]
scc_2_lb_548:
	mov r15b,BYTE [r14+r9+8*1]
	mov BYTE [r8+r9+8*1],r15b
	add r9,1
	cmp r15,0
	jnz scc_2_lb_548
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_544
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_544:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_545
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_545:
	mov QWORD rbx,[tmp]
	mov QWORD r14,[tmp+8*1]
	mov QWORD r15,[tmp+8*2]
; 	» "FJiefojef" |~ 1' : ℙ
;push_reg
	push QWORD r8
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_549+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_549+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,s3 : ,ℙ
; emt_ptn_crt_ptn 1',s3
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_550
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_551
emt_set_ptn_0_lb_550:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_551:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_552
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_552:
; 	scc { 0' 2' } ⊢ 1' : ℙ
	mov QWORD [tmp],rbx
	mov QWORD [tmp+8*1],r14
	mov QWORD [tmp+8*2],r15
	mov QWORD rbx,r8
	mov QWORD r14,r10
;push_reg
	push QWORD r8
	push QWORD r10
	mov r15,[rbx]
	add r15,[r14]
	and r15,0xffff
	mov r8,[rbx]
	mov r9,[r14]
	shr r8,48
	shr r9,48
	mov rax,0
	mov rdi,r8
	add rdi,r9
	bt r15,3
	jnc scc_0_lb_555
	btr r15,3
	add rdi,1
scc_0_lb_555:
	call mlc
	btr r12,1
	mov QWORD rdi,[rax]
	bts rdi,16
	and rdi,~0xffff
	add rdi,r15
	mov QWORD [rax],rdi
	mov r15,0
	mov r8,0
scc_1_lb_556:
	mov r15b,BYTE [rbx+r8+8*1]
	mov BYTE [rax+r8+8*1],r15b
	add r8,1
	cmp r15,0
	jnz scc_1_lb_556
	mov r9,0
	sub r8,1
	lea r8,[rax+r8]
scc_2_lb_557:
	mov r15b,BYTE [r14+r9+8*1]
	mov BYTE [r8+r9+8*1],r15b
	add r9,1
	cmp r15,0
	jnz scc_2_lb_557
	mov r9,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
; ; emt_dec_ptn { 0' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_553
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_553:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_554
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_554:
	mov QWORD rbx,[tmp]
	mov QWORD r14,[tmp+8*1]
	mov QWORD r15,[tmp+8*2]
; 	$ 1' ⊢ ,s4,s4_0 : ,ℙ,ℙ
; emt_ptn_crt_ptn 1',s4
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_558
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_559
emt_set_ptn_0_lb_558:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_559:
; emt_ptn_crt_ptn 1',s4_0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_560
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_561
emt_set_ptn_0_lb_560:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_561:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_562
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_562:
; 	∎ { 0' 2' }
; emt_get_crt_ptn { 0' 2' }
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,2
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r9
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_565
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_566
emt_get_crt_ptn_0_lb_565:
; unboxed
	stc
emt_get_crt_ptn_1_lb_566:
	mov QWORD r11,r8
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r9
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_567
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_568
emt_get_crt_ptn_0_lb_567:
; unboxed
	stc
emt_get_crt_ptn_1_lb_568:
	mov QWORD r11,r10
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r8
	clc
	jc ret_lb_569
	push r9
; ; emt_dec_ptn { 0' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_563
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_563:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_564
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_564:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_569:
;clear 
	mov rax,r9
	stc
	ret
test6:
; 	|» {  }
	jz _test6
	jc emt_etr_c_lb_1
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
jmp _test6
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test6:
; 	$ {  } ⊢ ,_r252,_r253 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r252
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r253
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xr44 |~ 2' : r64
	mov QWORD r11,0x44
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r256,_r257 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r256
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r257
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrfaaa |~ 1' : r64
	mov QWORD rdx,0xfaaa
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r260,_r261 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r260
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r261
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrbb |~ 4' : r64
	mov QWORD rdi,0xbb
	mov QWORD rcx,rdi
	or r12,0b10000
; 	$ 6' ⊢ ,_r264,_r265 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r264
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r265
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; ; emt_dec_ptn 6'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrbf |~ 6' : r64
	mov QWORD [st_vct+8*0],0xbf
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD rsi,r14
	pop r14
	or r12,0b1000000
; 	$ 8' ⊢ ,_r268,_r269 : ,{ },{ }
; emt_ptn_crt_ptn 8',_r268
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; emt_ptn_crt_ptn 8',_r269
; emt_set_ptn 10'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*1],rdi
	pop rdi
	and r12,~0b10000000000
; ; emt_dec_ptn 8'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrcc |~ 8' : r64
	mov QWORD [st_vct+8*2],0xcc
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD rax,r14
	pop r14
	or r12,0b100000000
	mov QWORD [st_vct+8*2],0
	bts r12,11
; emt_ptn_crt_ptn { 11' {  } },_r271
; emt_get_crt_ptn { 11' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_466
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_467
emt_get_crt_ptn_0_lb_466:
; unboxed
	stc
emt_get_crt_ptn_1_lb_467:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*4],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000
; ; emt_dec_ptn {  }
	mov QWORD [st_vct+8*2],1
	bts r12,11
; emt_ptn_crt_ptn { 11' { 8' 12' } },_r267
; emt_get_crt_ptn { 11' { 8' 12' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*4],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*4]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_468
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_469
emt_get_crt_ptn_0_lb_468:
; unboxed
	stc
emt_get_crt_ptn_1_lb_469:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*5],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*4],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*4]
; emt_get_crt_ptn { 8' 12' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*5],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*5]
; emt_get_crt_ptn 8'
	mov QWORD [st_vct+8*6],rax
	stc
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*5],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*5]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_470
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_471
emt_get_crt_ptn_0_lb_470:
; unboxed
	stc
emt_get_crt_ptn_1_lb_471:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*6],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*5],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*4],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000000
; ; emt_dec_ptn { 8' 12' }
; unknown
	bt r12,12
	jc emt_dec_ptn_0_lb_472
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_472:
; unboxed
	mov QWORD rax,1
	bts r12,8
; emt_ptn_crt_ptn { 8' { 6' 13' } },_r263
; emt_get_crt_ptn { 8' { 6' 13' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*2],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_474
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_475
emt_get_crt_ptn_0_lb_474:
; unboxed
	stc
emt_get_crt_ptn_1_lb_475:
	mov QWORD [st_vct+8*3],rax
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn { 6' 13' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 6'
	mov QWORD [st_vct+8*5],rsi
	stc
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 13'
	bt r12,13
	jc emt_get_crt_ptn_0_lb_476
; boxed
	push rdi
	mov rdi,[st_vct+8*4]
	call inc_r
	mov [st_vct+8*4],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_477
emt_get_crt_ptn_0_lb_476:
; unboxed
	stc
emt_get_crt_ptn_1_lb_477:
	push r14
	mov QWORD r14,[st_vct+8*4]
	mov QWORD [st_vct+8*5],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000000
; ; emt_dec_ptn { 6' 13' }
; unknown
	bt r12,13
	jc emt_dec_ptn_0_lb_478
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*4]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_478:
; unboxed
	mov QWORD rsi,1
	bts r12,6
; emt_ptn_crt_ptn { 6' { 4' 11' } },_r259
; emt_get_crt_ptn { 6' { 4' 11' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_480
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_481
emt_get_crt_ptn_0_lb_480:
; unboxed
	stc
emt_get_crt_ptn_1_lb_481:
	mov QWORD [st_vct+8*3],rsi
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn { 4' 11' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*4],rcx
	stc
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_482
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_483
emt_get_crt_ptn_0_lb_482:
; unboxed
	stc
emt_get_crt_ptn_1_lb_483:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000
; ; emt_dec_ptn { 4' 11' }
; unknown
	bt r12,11
	jc emt_dec_ptn_0_lb_484
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*2]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_484:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 8' } },_r255
; emt_get_crt_ptn { 4' { 1' 8' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_486
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_487
emt_get_crt_ptn_0_lb_486:
; unboxed
	stc
emt_get_crt_ptn_1_lb_487:
	mov QWORD [st_vct+8*2],rcx
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn { 1' 8' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*2],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 1'
	mov QWORD [st_vct+8*3],r9
	stc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_488
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_489
emt_get_crt_ptn_0_lb_488:
; unboxed
	stc
emt_get_crt_ptn_1_lb_489:
	mov QWORD [st_vct+8*3],rax
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn { 1' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_490
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_490:
; unboxed
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 6' } },_r251
; emt_get_crt_ptn { 1' { 2' 6' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_492
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_493
emt_get_crt_ptn_0_lb_492:
; unboxed
	stc
emt_get_crt_ptn_1_lb_493:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn { 2' 6' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 2'
	mov QWORD [st_vct+8*2],r10
	stc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_494
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_495
emt_get_crt_ptn_0_lb_494:
; unboxed
	stc
emt_get_crt_ptn_1_lb_495:
	mov QWORD [st_vct+8*2],rsi
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 2' 6' }
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_496
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_496:
; unboxed
; 	$ 4' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_498
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_499
emt_set_ptn_0_lb_498:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_499:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_500
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_500:
; 	$ 1' ⊢ ,l0,l00 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ],@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_501
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_502
emt_set_ptn_0_lb_501:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_502:
; emt_ptn_crt_ptn 1',l00
; emt_set_ptn 4'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_503
	push rdi
	mov rdi,r9
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_504
emt_set_ptn_0_lb_503:
	mov rcx,r9
	or r12,0b10000
emt_set_ptn_1_lb_504:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_505
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_505:
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' {  } },_r272
; emt_get_crt_ptn { 1' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rsi
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_506
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_507
emt_get_crt_ptn_0_lb_506:
; unboxed
	stc
emt_get_crt_ptn_1_lb_507:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rsi
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,0
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn {  }
; 	$ 6' ⊢ ,l1 : ,@[0].(⟦⟧)◂(t281'(0)) ≃ ∐[{ } { t281'(0) @[0] } ]
; emt_ptn_crt_ptn 6',l1
; emt_set_ptn 1'
; unknown
	bt r12,6
	jc emt_set_ptn_0_lb_508
	push rdi
	mov rdi,rsi
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_509
emt_set_ptn_0_lb_508:
	mov r9,rsi
	or r12,0b10
emt_set_ptn_1_lb_509:
; ; emt_dec_ptn 6'
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_510
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_510:
; 	lst_mov { 2' 1' } ⊢ 1' : @[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
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
	mov rdi,rdi
	mov rsi,str_ret
	bt r12,7
	call pnt
	call pnt_str_ret
mov rsi,7

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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
mov rsi,3

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
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
mov rsi,4

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
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
mov rsi,5

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
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
mov rsi,9

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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
mov rsi,0

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
	mov rdi,[st_vct+8*1]
	mov rsi,str_ret
	bt r12,10
	call pnt
	call pnt_str_ret
mov rsi,10

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
; push_s_ex  7'~_r264 3'~_r256 4'~l00 5'~_r260 9'~_r268 0'~_r252 10'~_r269
	sub rsp,64
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*7],rdi
	mov QWORD [rsp+8*6],r11
	mov QWORD [rsp+8*5],rcx
	mov QWORD [rsp+8*4],rdx
	mov r14,[st_vct+8*0]
	mov QWORD [rsp+8*3],r14
	mov QWORD [rsp+8*2],r8
	mov r14,[st_vct+8*1]
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_511
	and r12,~0b1000
lb_511:
; emt_ptn_set_ptn { 2' 3' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_512
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_513
emt_set_ptn_0_lb_512:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_513:
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_514
	push rdi
	mov rdi,r11
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_515
emt_set_ptn_0_lb_514:
	mov r9,r11
	or r12,0b10
emt_set_ptn_1_lb_515:
; ; emt_dec_ptn { 2' 3' }
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_516
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
emt_dec_ptn_0_lb_516:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_517
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
emt_dec_ptn_0_lb_517:
	call _lst_mov
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
	bt r12,8
	call pnt
	call pnt_str_ret
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
	mov QWORD [tmp],rax
	jc call_c_lb_518
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov r14,[rsp+8*1]
	mov [st_vct+8*1],r14
	mov QWORD r8,[rsp+8*2]
	mov r14,[rsp+8*3]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*4]
	mov QWORD rcx,[rsp+8*5]
	mov QWORD r11,[rsp+8*6]
	mov QWORD rdi,[rsp+8*7]
	add rsp,64
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_523
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_524
emt_set_ptn_0_lb_523:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_524:
; ; emt_dec 
; unknown
	jc lb_522
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
lb_522:
	jmp call_nc_lb_519
call_c_lb_518:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov r14,[rsp+8*1]
	mov [st_vct+8*1],r14
	mov QWORD r8,[rsp+8*2]
	mov r14,[rsp+8*3]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*4]
	mov QWORD rcx,[rsp+8*5]
	mov QWORD r11,[rsp+8*6]
	mov QWORD rdi,[rsp+8*7]
	add rsp,64
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_520
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_521
emt_set_ptn_0_lb_520:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_521:
call_nc_lb_519:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_526
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_527
emt_get_crt_ptn_0_lb_526:
; unboxed
	stc
emt_get_crt_ptn_1_lb_527:
	mov QWORD r10,r9
	jc ret_lb_528
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_525
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_525:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_528:
;clear  7'~_r264 3'~_r256 4'~l00 5'~_r260 9'~_r268 0'~_r252 10'~_r269
	bt r12,7
	jc clear_lb_529
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_529:
	bt r12,3
	jc clear_lb_530
;push_reg
	push QWORD r8
	push QWORD rcx
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r8
clear_lb_530:
	bt r12,4
	jc clear_lb_531
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_531:
	bt r12,5
	jc clear_lb_532
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_532:
	bt r12,9
	jc clear_lb_533
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_533:
	bt r12,0
	jc clear_lb_534
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_534:
	bt r12,10
	jc clear_lb_535
;push_reg
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
clear_lb_535:
	mov rax,r10
	stc
	ret
rev:
; 	|» 0'
	jz _rev
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_431
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_432
emt_set_ptn_0_lb_431:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_432:
	pop rbx
;push_reg
	push QWORD r8
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r8
	pop rbx
jmp _rev
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_429
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_430
emt_set_ptn_0_lb_429:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_430:
	pop rbx
_rev:
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' {  } },_r245
; emt_get_crt_ptn { 1' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_433
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_434
emt_get_crt_ptn_0_lb_433:
; unboxed
	stc
emt_get_crt_ptn_1_lb_434:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn {  }
; 	$ 2' ⊢ ,l1 : ,@[0].(⟦⟧)◂(t247'(0)) ≃ ∐[{ } { t247'(0) @[0] } ]
; emt_ptn_crt_ptn 2',l1
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_435
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_436
emt_set_ptn_0_lb_435:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_436:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_437
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
emt_dec_ptn_0_lb_437:
; 	lst_mov { 0' 1' } ⊢| 
;clear 
; emt_ptn_mov
	bts r12,3
	mov r11,r8
	bt r8,0
	jc lb_438
	and r12,~0b1000
lb_438:
	bts r12,2
	mov r10,r9
	bt r9,1
	jc lb_439
	and r12,~0b100
lb_439:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_442
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_443
emt_set_ptn_0_lb_442:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_443:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_444
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_445
emt_set_ptn_0_lb_444:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_445:
; ; emt_dec_ptn { 3' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_440
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
emt_dec_ptn_0_lb_440:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_441
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
emt_dec_ptn_0_lb_441:
	jmp _lst_mov
lst_mov:
; 	|» { 0' 1' }
	jz _lst_mov
	jc emt_etr_c_lb_3
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_385
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_386
emt_set_ptn_0_lb_385:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_386:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_387
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_388
emt_set_ptn_0_lb_387:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_388:
	pop rbx
	pop rbx
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
	pop rbx
jmp _lst_mov
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_381
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_382
emt_set_ptn_0_lb_381:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_382:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_383
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_384
emt_set_ptn_0_lb_383:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_384:
	pop rbx
	pop rbx
_lst_mov:
; 	? 0'
; 	∐\ l0 ,,l0=cns◂{ hd0 tl0 }
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_389
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_390
emt_set_ptn_0_lb_389:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_390:
; l0=cns◂{ hd0 tl0 }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_392
	jmp test_lb_400
failed_lb_392:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_393
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_393:
	jmp mtc_0_lb_391
test_lb_400:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_396
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_397
emt_set_ptn_0_lb_396:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_397:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_398
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_399
emt_set_ptn_0_lb_398:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_399:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_395
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_395:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_401
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_401:
	mov QWORD r8,1
	bts r12,0
; emt_ptn_crt_ptn { 0' { 3' 1' } },l1
; emt_get_crt_ptn { 0' { 3' 1' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD r10
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_402
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_403
emt_get_crt_ptn_0_lb_402:
; unboxed
	stc
emt_get_crt_ptn_1_lb_403:
	mov QWORD rdx,r8
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD r10
; emt_get_crt_ptn { 3' 1' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,2
	call mlc
	mov rdx,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_404
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_405
emt_get_crt_ptn_0_lb_404:
; unboxed
	stc
emt_get_crt_ptn_1_lb_405:
	mov QWORD rsi,r11
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_406
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_407
emt_get_crt_ptn_0_lb_406:
; unboxed
	stc
emt_get_crt_ptn_1_lb_407:
	mov QWORD rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn { 3' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_408
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_408:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_409
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_409:
; 	lst_mov { 4' 2' } ⊢| 
;clear 
; emt_ptn_mov
; emt_ptn_set_ptn { 4' 2' },{ 0' 1' }
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_412
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_413
emt_set_ptn_0_lb_412:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_413:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_414
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_415
emt_set_ptn_0_lb_414:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_415:
; ; emt_dec_ptn { 4' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_410
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_410:
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_411
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_411:
	jmp _lst_mov
mtc_0_lb_391:
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 0',l0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_416
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_417
emt_set_ptn_0_lb_416:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_417:
; l0=nil◂{  }
	mov r11,[r10+8*1]
	cmp r11,0
	jnz failed_lb_419
	jmp test_lb_423
failed_lb_419:
;test 0
;clear  2'~l0
	bt r12,2
	jc clear_lb_420
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_420:
	jmp mtc_1_lb_418
test_lb_423:
	mov r11,[r10+8*2]
	bt r12,3
; emt_set_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_422
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
emt_dec_ptn_0_lb_422:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_424
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_424:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_426
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_427
emt_get_crt_ptn_0_lb_426:
; unboxed
	stc
emt_get_crt_ptn_1_lb_427:
	mov QWORD r8,r9
	jc ret_lb_428
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_425
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_425:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_428:
;clear 
	mov rax,r8
	stc
	ret
mtc_1_lb_418:
test2:
; 	|» {  }
	jz _test2
	jc emt_etr_c_lb_4
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
jmp _test2
emt_etr_c_lb_4:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test2:
; 	$ {  } ⊢ ,_r217,_r218 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r217
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r218
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» "X" |~ 2' : ℙ
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_300+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r11,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
	mov QWORD r10,r11
	and r12,~0b100
; 	$ 1' ⊢ ,_r221,_r222 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r221
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r222
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» "Y" |~ 1' : ℙ
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_306+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
	mov QWORD r9,rdx
	and r12,~0b10
	mov QWORD rdx,0
	bts r12,5
; emt_ptn_crt_ptn { 5' {  } },_r224
; emt_get_crt_ptn { 5' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_crt_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_307
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_308
emt_get_crt_ptn_0_lb_307:
; unboxed
	stc
emt_get_crt_ptn_1_lb_308:
	mov QWORD rdi,rdx
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,0
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rdi
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn {  }
	mov QWORD rdx,1
	bts r12,5
; emt_ptn_crt_ptn { 5' { 1' 6' } },_r220
; emt_get_crt_ptn { 5' { 1' 6' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_309
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_310
emt_get_crt_ptn_0_lb_309:
; unboxed
	stc
emt_get_crt_ptn_1_lb_310:
	mov QWORD rax,rdx
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn { 1' 6' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_311
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_312
emt_get_crt_ptn_0_lb_311:
; unboxed
	stc
emt_get_crt_ptn_1_lb_312:
	mov QWORD [st_vct+8*0],r9
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_313
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_314
emt_get_crt_ptn_0_lb_313:
; unboxed
	stc
emt_get_crt_ptn_1_lb_314:
	mov QWORD [st_vct+8*0],rsi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
; ; emt_dec_ptn { 1' 6' }
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_315
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_315:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_316
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_316:
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r216
; emt_get_crt_ptn { 1' { 2' 7' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rdx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdi
	push QWORD rdx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_317
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_318
emt_get_crt_ptn_0_lb_317:
; unboxed
	stc
emt_get_crt_ptn_1_lb_318:
	mov QWORD rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdi
	push QWORD rdx
; emt_get_crt_ptn { 2' 7' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rsi
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_319
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_320
emt_get_crt_ptn_0_lb_319:
; unboxed
	stc
emt_get_crt_ptn_1_lb_320:
	mov QWORD rax,r10
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rsi
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_321
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_322
emt_get_crt_ptn_0_lb_321:
; unboxed
	stc
emt_get_crt_ptn_1_lb_322:
	mov QWORD rax,rdi
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000
; ; emt_dec_ptn { 2' 7' }
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_323
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_323:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_324
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_324:
; 	$ 5' ⊢ ,l0 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 5',l0
; emt_set_ptn 1'
; unknown
	bt r12,5
	jc emt_set_ptn_0_lb_325
	push rdi
	mov rdi,rdx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_326
emt_set_ptn_0_lb_325:
	mov r9,rdx
	or r12,0b10
emt_set_ptn_1_lb_326:
; ; emt_dec_ptn 5'
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_327
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_327:
; 	$ 1' ⊢ ,l0,l1 : ,@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ],@[0].(⟦⟧)◂(ℙ) ≃ ∐[{ } { ℙ @[0] } ]
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_328
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_329
emt_set_ptn_0_lb_328:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_329:
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 5'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_330
	push rdi
	mov rdi,r9
	call inc_r
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
	jmp emt_set_ptn_1_lb_331
emt_set_ptn_0_lb_330:
	mov rdx,r9
	or r12,0b100000
emt_set_ptn_1_lb_331:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_332
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_332:
; 	? 2'
; 	∐\ l0 ,,l0=nil◂{  }
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_333
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_334
emt_set_ptn_0_lb_333:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_334:
; l0=nil◂{  }
	mov rsi,[r9+8*1]
	cmp rsi,0
	jnz failed_lb_336
	jmp test_lb_340
failed_lb_336:
;test 0
;clear  1'~l0
	bt r12,1
	jc clear_lb_337
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_337:
	jmp mtc_0_lb_335
test_lb_340:
	mov rsi,[r9+8*2]
	bt r12,6
; emt_set_ptn {  }
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_339
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_339:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_341
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_341:
; 	» "t" |~ 1' : ℙ
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_342+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,y : ,ℙ
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_343
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_344
emt_set_ptn_0_lb_343:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_344:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_345
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_345:
; 	∎ 5'
; emt_get_crt_ptn 5'
	bt r12,5
	jc emt_get_crt_ptn_0_lb_347
; boxed
	push rdi
	mov rdi,rdx
	call inc_r
	mov rdx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_348
emt_get_crt_ptn_0_lb_347:
; unboxed
	stc
emt_get_crt_ptn_1_lb_348:
	mov QWORD r9,rdx
	jc ret_lb_349
	push r9
; ; emt_dec_ptn 5'
; unknown
	bt r12,5
	jc emt_dec_ptn_0_lb_346
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_346:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_349:
;clear  2'~y 3'~_r221 4'~_r222 0'~_r217
	bt r12,2
	jc clear_lb_350
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_350:
	bt r12,3
	jc clear_lb_351
;push_reg
	push QWORD r8
	push QWORD rcx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r8
clear_lb_351:
	bt r12,4
	jc clear_lb_352
;push_reg
	push QWORD r8
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_352:
	bt r12,0
	jc clear_lb_353
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_353:
	mov rax,r9
	stc
	ret
mtc_0_lb_335:
; 	∐\ l0 ,,l0=cns◂{ hd tl }
; emt_ptn_crt_ptn 2',l0
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_354
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_355
emt_set_ptn_0_lb_354:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_355:
; l0=cns◂{ hd tl }
	mov rax,[r9+8*1]
	cmp rax,1
	jnz failed_lb_357
	jmp test_lb_365
failed_lb_357:
;test 0
;clear  1'~l0
	bt r12,1
	jc clear_lb_358
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_358:
	jmp mtc_1_lb_356
test_lb_365:
	mov rax,[r9+8*2]
	bt r12,8
; emt_set_ptn { 6' 7' }
	push rax
	push r14
	mov r14,[rax]
	bt r14,0
	mov rax,[rax+8*1]
	pop r14
; emt_set_ptn 6'
; unknown
	jc emt_set_ptn_0_lb_361
	push rdi
	mov rdi,rax
	call inc_r
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
	jmp emt_set_ptn_1_lb_362
emt_set_ptn_0_lb_361:
	mov rsi,rax
	or r12,0b1000000
emt_set_ptn_1_lb_362:
	pop rax
	push rax
	push r14
	mov r14,[rax]
	bt r14,1
	mov rax,[rax+8*2]
	pop r14
; emt_set_ptn 7'
; unknown
	jc emt_set_ptn_0_lb_363
	mov rdi,rax
	call inc_r
	mov rdi,rdi
	and r12,~0b10000000
	jmp emt_set_ptn_1_lb_364
emt_set_ptn_0_lb_363:
	mov rdi,rax
	or r12,0b10000000
emt_set_ptn_1_lb_364:
	pop rax
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_360
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_360:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_366
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_366:
; 	» "f" |~ 1' : ℙ
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_367+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,y : ,ℙ
; emt_ptn_crt_ptn 1',y
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_368
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_369
emt_set_ptn_0_lb_368:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_369:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_370
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_370:
; 	∎ 7'
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_372
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_373
emt_get_crt_ptn_0_lb_372:
; unboxed
	stc
emt_get_crt_ptn_1_lb_373:
	mov QWORD r9,rdi
	jc ret_lb_374
	push r9
; ; emt_dec_ptn 7'
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_371
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_371:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_374:
;clear  2'~y 6'~hd 3'~_r221 5'~l1 4'~_r222 0'~_r217
	bt r12,2
	jc clear_lb_375
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_375:
	bt r12,6
	jc clear_lb_376
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r8
clear_lb_376:
	bt r12,3
	jc clear_lb_377
;push_reg
	push QWORD r8
	push QWORD rcx
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r8
clear_lb_377:
	bt r12,5
	jc clear_lb_378
;push_reg
	push QWORD r8
	push QWORD rcx
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r8
clear_lb_378:
	bt r12,4
	jc clear_lb_379
;push_reg
	push QWORD r8
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_379:
	bt r12,0
	jc clear_lb_380
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_380:
	mov rax,r9
	stc
	ret
mtc_1_lb_356:
test5:
; 	|» {  }
	jz _test5
	jc emt_etr_c_lb_5
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
jmp _test5
emt_etr_c_lb_5:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test5:
; 	$ {  } ⊢ ,_r179,_r180 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r179
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r180
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xr45 |~ 2' : r64
	mov QWORD r11,0x45
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r183,_r184 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r183
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r184
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrff |~ 1' : r64
	mov QWORD rdx,0xff
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r187,_r188 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r187
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r188
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr233 |~ 4' : r64
	mov QWORD rdi,0x233
	mov QWORD rcx,rdi
	or r12,0b10000
; 	$ 6' ⊢ ,_r191,_r192 : ,{ },{ }
; emt_ptn_crt_ptn 6',_r191
; emt_set_ptn 7'
; boxed
	mov rdi,rsi
	call inc_r
; test 2
	mov rdi,rdi
	and r12,~0b10000000
; emt_ptn_crt_ptn 6',_r192
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; ; emt_dec_ptn 6'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrfaa |~ 6' : r64
	mov QWORD [st_vct+8*0],0xfaa
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD rsi,r14
	pop r14
	or r12,0b1000000
; 	$ 8' ⊢ ,_r195,_r196 : ,{ },{ }
; emt_ptn_crt_ptn 8',_r195
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; emt_ptn_crt_ptn 8',_r196
; emt_set_ptn 10'
; boxed
	push rdi
	mov rdi,rax
	call inc_r
; test 1
	mov [st_vct+8*1],rdi
	pop rdi
	and r12,~0b10000000000
; ; emt_dec_ptn 8'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr5324 |~ 8' : r64
	mov QWORD [st_vct+8*2],0x5324
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD rax,r14
	pop r14
	or r12,0b100000000
; 	$ 10' ⊢ ,_r199,_r200 : ,{ },{ }
; emt_ptn_crt_ptn 10',_r199
; emt_set_ptn 11'
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
; test 1
	mov [st_vct+8*2],rdi
	pop rdi
	and r12,~0b100000000000
; emt_ptn_crt_ptn 10',_r200
; emt_set_ptn 12'
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
; test 1
	mov [st_vct+8*3],rdi
	pop rdi
	and r12,~0b1000000000000
; ; emt_dec_ptn 10'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr3344444 |~ 10' : r64
	mov QWORD [st_vct+8*4],0x3344444
	push r14
	mov QWORD r14,[st_vct+8*4]
	mov QWORD [st_vct+8*1],r14
	pop r14
	or r12,0b10000000000
; 	$ 12' ⊢ ,_r203,_r204 : ,{ },{ }
; emt_ptn_crt_ptn 12',_r203
; emt_set_ptn 13'
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
; test 1
	mov [st_vct+8*4],rdi
	pop rdi
	and r12,~0b10000000000000
; emt_ptn_crt_ptn 12',_r204
; emt_set_ptn 14'
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
; test 1
	mov [st_vct+8*5],rdi
	pop rdi
	and r12,~0b100000000000000
; ; emt_dec_ptn 12'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrffff |~ 12' : r64
	mov QWORD [st_vct+8*6],0xffff
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*3],r14
	pop r14
	or r12,0b1000000000000
	mov QWORD [st_vct+8*6],0
	bts r12,15
; emt_ptn_crt_ptn { 15' {  } },_r206
; emt_get_crt_ptn { 15' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*7],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 15'
	bt r12,15
	jc emt_get_crt_ptn_0_lb_241
; boxed
	push rdi
	mov rdi,[st_vct+8*6]
	call inc_r
	mov [st_vct+8*6],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_242
emt_get_crt_ptn_0_lb_241:
; unboxed
	stc
emt_get_crt_ptn_1_lb_242:
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*8],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*8],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000000000
; ; emt_dec_ptn {  }
	mov QWORD [st_vct+8*6],1
	bts r12,15
; emt_ptn_crt_ptn { 15' { 12' 16' } },_r202
; emt_get_crt_ptn { 15' { 12' 16' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*8],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*8]
; emt_get_crt_ptn 15'
	bt r12,15
	jc emt_get_crt_ptn_0_lb_243
; boxed
	push rdi
	mov rdi,[st_vct+8*6]
	call inc_r
	mov [st_vct+8*6],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_244
emt_get_crt_ptn_0_lb_243:
; unboxed
	stc
emt_get_crt_ptn_1_lb_244:
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*9],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*8],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*8]
; emt_get_crt_ptn { 12' 16' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*9],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*9]
; emt_get_crt_ptn 12'
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*10],r14
	pop r14
	stc
; test x0
	mov rdx,[st_vct+8*10]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*9],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*9]
; emt_get_crt_ptn 16'
	bt r12,16
	jc emt_get_crt_ptn_0_lb_245
; boxed
	push rdi
	mov rdi,[st_vct+8*7]
	call inc_r
	mov [st_vct+8*7],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_246
emt_get_crt_ptn_0_lb_245:
; unboxed
	stc
emt_get_crt_ptn_1_lb_246:
	push r14
	mov QWORD r14,[st_vct+8*7]
	mov QWORD [st_vct+8*10],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*10]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*9],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*8],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000000000000
; ; emt_dec_ptn { 12' 16' }
; unknown
	bt r12,16
	jc emt_dec_ptn_0_lb_247
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*7]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_247:
; unboxed
	mov QWORD [st_vct+8*3],1
	bts r12,12
; emt_ptn_crt_ptn { 12' { 10' 17' } },_r198
; emt_get_crt_ptn { 12' { 10' 17' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*6],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_249
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_250
emt_get_crt_ptn_0_lb_249:
; unboxed
	stc
emt_get_crt_ptn_1_lb_250:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*7],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn { 10' 17' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*7],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 10'
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*9],r14
	pop r14
	stc
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 17'
	bt r12,17
	jc emt_get_crt_ptn_0_lb_251
; boxed
	push rdi
	mov rdi,[st_vct+8*8]
	call inc_r
	mov [st_vct+8*8],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_252
emt_get_crt_ptn_0_lb_251:
; unboxed
	stc
emt_get_crt_ptn_1_lb_252:
	push r14
	mov QWORD r14,[st_vct+8*8]
	mov QWORD [st_vct+8*9],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*9]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000000
; ; emt_dec_ptn { 10' 17' }
; unknown
	bt r12,17
	jc emt_dec_ptn_0_lb_253
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*8]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_253:
; unboxed
	mov QWORD [st_vct+8*1],1
	bts r12,10
; emt_ptn_crt_ptn { 10' { 8' 15' } },_r194
; emt_get_crt_ptn { 10' { 8' 15' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_255
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_256
emt_get_crt_ptn_0_lb_255:
; unboxed
	stc
emt_get_crt_ptn_1_lb_256:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*7],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn { 8' 15' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*7],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 8'
	mov QWORD [st_vct+8*8],rax
	stc
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*7]
; emt_get_crt_ptn 15'
	bt r12,15
	jc emt_get_crt_ptn_0_lb_257
; boxed
	push rdi
	mov rdi,[st_vct+8*6]
	call inc_r
	mov [st_vct+8*6],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_258
emt_get_crt_ptn_0_lb_257:
; unboxed
	stc
emt_get_crt_ptn_1_lb_258:
	push r14
	mov QWORD r14,[st_vct+8*6]
	mov QWORD [st_vct+8*8],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*8]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*7],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000
; ; emt_dec_ptn { 8' 15' }
; unknown
	bt r12,15
	jc emt_dec_ptn_0_lb_259
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*6]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_259:
; unboxed
	mov QWORD rax,1
	bts r12,8
; emt_ptn_crt_ptn { 8' { 6' 12' } },_r190
; emt_get_crt_ptn { 8' { 6' 12' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_261
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_262
emt_get_crt_ptn_0_lb_261:
; unboxed
	stc
emt_get_crt_ptn_1_lb_262:
	mov QWORD [st_vct+8*6],rax
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn { 6' 12' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*6],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn 6'
	mov QWORD [st_vct+8*7],rsi
	stc
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*6]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_263
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_264
emt_get_crt_ptn_0_lb_263:
; unboxed
	stc
emt_get_crt_ptn_1_lb_264:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*7],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*7]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*6],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000
; ; emt_dec_ptn { 6' 12' }
; unknown
	bt r12,12
	jc emt_dec_ptn_0_lb_265
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_265:
; unboxed
	mov QWORD rsi,1
	bts r12,6
; emt_ptn_crt_ptn { 6' { 4' 10' } },_r186
; emt_get_crt_ptn { 6' { 4' 10' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_267
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_268
emt_get_crt_ptn_0_lb_267:
; unboxed
	stc
emt_get_crt_ptn_1_lb_268:
	mov QWORD [st_vct+8*3],rsi
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn { 4' 10' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*6],rcx
	stc
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_269
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_270
emt_get_crt_ptn_0_lb_269:
; unboxed
	stc
emt_get_crt_ptn_1_lb_270:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*6],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*6]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000
; ; emt_dec_ptn { 4' 10' }
; unknown
	bt r12,10
	jc emt_dec_ptn_0_lb_271
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_271:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 8' } },_r182
; emt_get_crt_ptn { 4' { 1' 8' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov rsi,rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_273
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_274
emt_get_crt_ptn_0_lb_273:
; unboxed
	stc
emt_get_crt_ptn_1_lb_274:
	mov QWORD [st_vct+8*1],rcx
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	push QWORD rax
	push QWORD rsi
; emt_get_crt_ptn { 1' 8' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 1'
	mov QWORD [st_vct+8*3],r9
	stc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_275
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_276
emt_get_crt_ptn_0_lb_275:
; unboxed
	stc
emt_get_crt_ptn_1_lb_276:
	mov QWORD [st_vct+8*3],rax
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov rsi,rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000
; ; emt_dec_ptn { 1' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_277
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_277:
; unboxed
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 6' } },_r178
; emt_get_crt_ptn { 1' { 2' 6' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_279
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_280
emt_get_crt_ptn_0_lb_279:
; unboxed
	stc
emt_get_crt_ptn_1_lb_280:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn { 2' 6' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 2'
	mov QWORD [st_vct+8*1],r10
	stc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 6'
	bt r12,6
	jc emt_get_crt_ptn_0_lb_281
; boxed
	push rdi
	mov rdi,rsi
	call inc_r
	mov rsi,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_282
emt_get_crt_ptn_0_lb_281:
; unboxed
	stc
emt_get_crt_ptn_1_lb_282:
	mov QWORD [st_vct+8*1],rsi
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 2' 6' }
; unknown
	bt r12,6
	jc emt_dec_ptn_0_lb_283
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_283:
; unboxed
; 	$ 4' ⊢ ,l : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 4',l
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_285
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_286
emt_set_ptn_0_lb_285:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_286:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_287
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rdi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_287:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_289
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_290
emt_get_crt_ptn_0_lb_289:
; unboxed
	stc
emt_get_crt_ptn_1_lb_290:
	mov QWORD r10,r9
	jc ret_lb_291
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_288
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_288:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_291:
;clear  14'~_r204 7'~_r191 3'~_r183 13'~_r203 5'~_r187 9'~_r195 11'~_r199 0'~_r179
	bt r12,14
	jc clear_lb_292
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rdi
	mov rdi,[st_vct+8*5]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_292:
	bt r12,7
	jc clear_lb_293
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_293:
	bt r12,3
	jc clear_lb_294
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_294:
	bt r12,13
	jc clear_lb_295
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,[st_vct+8*4]
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_295:
	bt r12,5
	jc clear_lb_296
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_296:
	bt r12,9
	jc clear_lb_297
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_297:
	bt r12,11
	jc clear_lb_298
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*2]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_298:
	bt r12,0
	jc clear_lb_299
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_299:
	mov rax,r10
	stc
	ret
test4:
; 	|» {  }
	jz _test4
	jc emt_etr_c_lb_6
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
jmp _test4
emt_etr_c_lb_6:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test4:
; 	» "a" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_195+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
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
	jc emt_set_ptn_0_lb_196
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_197
emt_set_ptn_0_lb_196:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_197:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_198
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_198:
; 	» "b" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_199+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_200
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_201
emt_set_ptn_0_lb_200:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_201:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_202
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
emt_dec_ptn_0_lb_202:
; 	$ { 1' 2' } ⊢ ,{ s0 _ } : ,{ ℙ ℙ }
; emt_ptn_crt_ptn { 1' 2' },{ s0 _ }
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_203
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_204
emt_set_ptn_0_lb_203:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_204:
; emt_ptn_crt_ptn 2',_
; emt_set_ptn -2'
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_205
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
emt_dec_ptn_0_lb_205:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_206
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_206:
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_208
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_209
emt_get_crt_ptn_0_lb_208:
; unboxed
	stc
emt_get_crt_ptn_1_lb_209:
	mov QWORD r9,r8
	jc ret_lb_210
	push r9
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_207
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_207:
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_210:
;clear 
	mov rax,r9
	stc
	ret
test3:
; 	|» {  }
	jz _test3
	jc emt_etr_c_lb_7
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
jmp _test3
emt_etr_c_lb_7:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test3:
; 	» 0xrff |~ 0' : r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,s0 : ,r64
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	? 1'
; 	∐\ s0 ,,s0=0xra4
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; s0=0xra4
	mov QWORD r10,0xa4
	cmp r8,r10
	jnz failed_lb_156
	jmp test_r64_lb_158
failed_lb_156:
;clear  0'~s0
	bt r12,0
	jc clear_lb_157
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_157:
	jmp mtc_0_lb_155
test_r64_lb_158:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "a" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_161+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_162
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_163
emt_set_ptn_0_lb_162:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_163:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_164
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_164:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_166
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_167
emt_get_crt_ptn_0_lb_166:
; unboxed
	stc
emt_get_crt_ptn_1_lb_167:
	mov QWORD r8,r9
	jc ret_lb_168
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_165
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_165:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_168:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_155:
; 	∐\ s0 ,,s0=0xrff
; emt_ptn_crt_ptn 1',s0
; emt_set_ptn 0'
; unboxed
	mov r8,r9
; s0=0xrff
	mov QWORD r10,0xff
	cmp r8,r10
	jnz failed_lb_172
	jmp test_r64_lb_174
failed_lb_172:
;clear  0'~s0
	bt r12,0
	jc clear_lb_173
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_173:
	jmp mtc_1_lb_171
test_r64_lb_174:
; ; emt_dec_ptn 0'
; unboxed
; ; emt_dec_ptn 1'
; unboxed
; 	» "b" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_177+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_178
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_179
emt_set_ptn_0_lb_178:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_179:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_180
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_180:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_182
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_183
emt_get_crt_ptn_0_lb_182:
; unboxed
	stc
emt_get_crt_ptn_1_lb_183:
	mov QWORD r8,r9
	jc ret_lb_184
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_181
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_181:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_184:
;clear 
	mov rax,r8
	stc
	ret
mtc_1_lb_171:
; 	∐\ _ ,
; emt_ptn_crt_ptn 1',_
; emt_set_ptn -2'
; ; emt_dec_ptn 1'
; unboxed
; 	» "c" |~ 0' : ℙ
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_187+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,ℙ
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_188
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_189
emt_set_ptn_0_lb_188:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_189:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_190
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_190:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_192
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_193
emt_get_crt_ptn_0_lb_192:
; unboxed
	stc
emt_get_crt_ptn_1_lb_193:
	mov QWORD r8,r9
	jc ret_lb_194
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_191
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_191:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_194:
;clear 
	mov rax,r8
	stc
	ret
mtc_2_lb_185:
test_a:
; 	|» {  }
	jz _test_a
	jc emt_etr_c_lb_8
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
jmp _test_a
emt_etr_c_lb_8:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_test_a:
; 	$ {  } ⊢ ,_r140,_r141 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r140
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r141
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xr101 |~ 2' : r64
	mov QWORD r11,0x101
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r144,_r145 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r144
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r145
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xraffa |~ 1' : r64
	mov QWORD rdx,0xaffa
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r148,_r149 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r148
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r149
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr83793 |~ 4' : r64
	mov QWORD rdi,0x83793
	mov QWORD rcx,rdi
	or r12,0b10000
	mov QWORD rdi,0
	bts r12,7
; emt_ptn_crt_ptn { 7' {  } },_r151
; emt_get_crt_ptn { 7' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_80
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_81
emt_get_crt_ptn_0_lb_80:
; unboxed
	stc
emt_get_crt_ptn_1_lb_81:
	mov QWORD [st_vct+8*0],rdi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*0],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000
; ; emt_dec_ptn {  }
	mov QWORD rdi,1
	bts r12,7
; emt_ptn_crt_ptn { 7' { 4' 8' } },_r147
; emt_get_crt_ptn { 7' { 4' 8' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*0],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*0]
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_82
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_83
emt_get_crt_ptn_0_lb_82:
; unboxed
	stc
emt_get_crt_ptn_1_lb_83:
	mov QWORD [st_vct+8*1],rdi
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*0],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*0]
; emt_get_crt_ptn { 4' 8' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*2],rcx
	stc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_84
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_85
emt_get_crt_ptn_0_lb_84:
; unboxed
	stc
emt_get_crt_ptn_1_lb_85:
	mov QWORD [st_vct+8*2],rax
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*0],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000
; ; emt_dec_ptn { 4' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_86
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_86:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 9' } },_r143
; emt_get_crt_ptn { 4' { 1' 9' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_88
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_89
emt_get_crt_ptn_0_lb_88:
; unboxed
	stc
emt_get_crt_ptn_1_lb_89:
	mov QWORD rax,rcx
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn { 1' 9' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 1'
	mov QWORD [st_vct+8*1],r9
	stc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 9'
	bt r12,9
	jc emt_get_crt_ptn_0_lb_90
; boxed
	push rdi
	mov rdi,[st_vct+8*0]
	call inc_r
	mov [st_vct+8*0],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_91
emt_get_crt_ptn_0_lb_90:
; unboxed
	stc
emt_get_crt_ptn_1_lb_91:
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD [st_vct+8*1],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
; ; emt_dec_ptn { 1' 9' }
; unknown
	bt r12,9
	jc emt_dec_ptn_0_lb_92
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_92:
; unboxed
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r139
; emt_get_crt_ptn { 1' { 2' 7' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_94
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_95
emt_get_crt_ptn_0_lb_94:
; unboxed
	stc
emt_get_crt_ptn_1_lb_95:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn { 2' 7' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 2'
	mov QWORD [st_vct+8*0],r10
	stc
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_96
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_97
emt_get_crt_ptn_0_lb_96:
; unboxed
	stc
emt_get_crt_ptn_1_lb_97:
	mov QWORD [st_vct+8*0],rdi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 2' 7' }
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_98
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_98:
; unboxed
; 	$ 4' ⊢ ,l0 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_100
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_101
emt_set_ptn_0_lb_100:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_101:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_102
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_102:
; 	$ {  } ⊢ ,_r153,_r154 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r153
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,0
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; emt_ptn_crt_ptn {  },_r154
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,0
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn {  }
; 	» 0xrff |~ 7' : r64
	mov QWORD rax,0xff
	mov QWORD rdi,rax
	or r12,0b10000000
; 	$ 4' ⊢ ,_r157,_r158 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r157
; emt_set_ptn 8'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rax,rdi
	pop rdi
	and r12,~0b100000000
; emt_ptn_crt_ptn 4',_r158
; emt_set_ptn 9'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov [st_vct+8*0],rdi
	pop rdi
	and r12,~0b1000000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xrfabc |~ 4' : r64
	mov QWORD [st_vct+8*1],0xfabc
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD rcx,r14
	pop r14
	or r12,0b10000
	mov QWORD [st_vct+8*1],0
	bts r12,10
; emt_ptn_crt_ptn { 10' {  } },_r160
; emt_get_crt_ptn { 10' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*2],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_108
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_109
emt_get_crt_ptn_0_lb_108:
; unboxed
	stc
emt_get_crt_ptn_1_lb_109:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*3],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*3]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000000
; ; emt_dec_ptn {  }
	mov QWORD [st_vct+8*1],1
	bts r12,10
; emt_ptn_crt_ptn { 10' { 4' 11' } },_r156
; emt_get_crt_ptn { 10' { 4' 11' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*3],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn 10'
	bt r12,10
	jc emt_get_crt_ptn_0_lb_110
; boxed
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov [st_vct+8*1],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_111
emt_get_crt_ptn_0_lb_110:
; unboxed
	stc
emt_get_crt_ptn_1_lb_111:
	push r14
	mov QWORD r14,[st_vct+8*1]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*3]
; emt_get_crt_ptn { 4' 11' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*4],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*4]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*5],rcx
	stc
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*4],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*4]
; emt_get_crt_ptn 11'
	bt r12,11
	jc emt_get_crt_ptn_0_lb_112
; boxed
	push rdi
	mov rdi,[st_vct+8*2]
	call inc_r
	mov [st_vct+8*2],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_113
emt_get_crt_ptn_0_lb_112:
; unboxed
	stc
emt_get_crt_ptn_1_lb_113:
	push r14
	mov QWORD r14,[st_vct+8*2]
	mov QWORD [st_vct+8*5],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*5]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*4],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*3],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000000
; ; emt_dec_ptn { 4' 11' }
; unknown
	bt r12,11
	jc emt_dec_ptn_0_lb_114
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*2]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_114:
; unboxed
	mov QWORD rcx,1
	bts r12,4
; emt_ptn_crt_ptn { 4' { 7' 12' } },_r152
; emt_get_crt_ptn { 4' { 7' 12' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_116
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_117
emt_get_crt_ptn_0_lb_116:
; unboxed
	stc
emt_get_crt_ptn_1_lb_117:
	mov QWORD [st_vct+8*2],rcx
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn { 7' 12' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*2],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 7'
	mov QWORD [st_vct+8*4],rdi
	stc
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*2]
; emt_get_crt_ptn 12'
	bt r12,12
	jc emt_get_crt_ptn_0_lb_118
; boxed
	push rdi
	mov rdi,[st_vct+8*3]
	call inc_r
	mov [st_vct+8*3],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_119
emt_get_crt_ptn_0_lb_118:
; unboxed
	stc
emt_get_crt_ptn_1_lb_119:
	push r14
	mov QWORD r14,[st_vct+8*3]
	mov QWORD [st_vct+8*4],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*4]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*2],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000000
; ; emt_dec_ptn { 7' 12' }
; unknown
	bt r12,12
	jc emt_dec_ptn_0_lb_120
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,[st_vct+8*3]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_120:
; unboxed
; 	$ 10' ⊢ ,l1 : ,@[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
; emt_ptn_crt_ptn 10',l1
; emt_set_ptn 4'
; unknown
	bt r12,10
	jc emt_set_ptn_0_lb_122
	push rdi
	mov rdi,[st_vct+8*1]
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_123
emt_set_ptn_0_lb_122:
	mov rcx,[st_vct+8*1]
	or r12,0b10000
emt_set_ptn_1_lb_123:
; ; emt_dec_ptn 10'
; unknown
	bt r12,10
	jc emt_dec_ptn_0_lb_124
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,[st_vct+8*1]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_124:
; 	apnd { 1' 4' } ⊢ 1' : @[0].(⟦⟧)◂(r64) ≃ ∐[{ } { r64 @[0] } ]
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
	mov rdi,rsi
	mov rsi,str_ret
	bt r12,6
	call pnt
	call pnt_str_ret
mov rsi,6

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
	mov rdi,rax
	mov rsi,str_ret
	bt r12,8
	call pnt
	call pnt_str_ret
mov rsi,8

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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
mov rsi,3

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
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
mov rsi,4

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
	mov rdi,rdx
	mov rsi,str_ret
	bt r12,5
	call pnt
	call pnt_str_ret
mov rsi,5

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
	mov rdi,[st_vct+8*0]
	mov rsi,str_ret
	bt r12,9
	call pnt
	call pnt_str_ret
mov rsi,9

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
	mov rdi,r8
	mov rsi,str_ret
	bt r12,0
	call pnt
	call pnt_str_ret
mov rsi,0

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
; push_s_ex  2'~_r153 6'~_r149 8'~_r157 3'~_r144 5'~_r148 9'~_r158 0'~_r140
	sub rsp,64
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*7],r10
	mov QWORD [rsp+8*6],rsi
	mov QWORD [rsp+8*5],rax
	mov QWORD [rsp+8*4],r11
	mov QWORD [rsp+8*3],rdx
	mov r14,[st_vct+8*0]
	mov QWORD [rsp+8*2],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,2
	mov r10,r9
	bt r9,1
	jc lb_125
	and r12,~0b100
lb_125:
; emt_ptn_set_ptn { 2' 4' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_126
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_127
emt_set_ptn_0_lb_126:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_127:
; emt_ptn_set_ptn 4',1'
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_128
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_129
emt_set_ptn_0_lb_128:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_129:
; ; emt_dec_ptn { 2' 4' }
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_130
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_130:
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_131
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_131:
	call _apnd
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
	bt r12,8
	call pnt
	call pnt_str_ret
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
	mov QWORD [tmp],rax
	jc call_c_lb_132
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	mov r14,[rsp+8*2]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*3]
	mov QWORD r11,[rsp+8*4]
	mov QWORD rax,[rsp+8*5]
	mov QWORD rsi,[rsp+8*6]
	mov QWORD r10,[rsp+8*7]
	add rsp,64
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_137
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_138
emt_set_ptn_0_lb_137:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_138:
; ; emt_dec 
; unknown
	jc lb_136
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
lb_136:
	jmp call_nc_lb_133
call_c_lb_132:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	mov r14,[rsp+8*2]
	mov [st_vct+8*0],r14
	mov QWORD rdx,[rsp+8*3]
	mov QWORD r11,[rsp+8*4]
	mov QWORD rax,[rsp+8*5]
	mov QWORD rsi,[rsp+8*6]
	mov QWORD r10,[rsp+8*7]
	add rsp,64
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_134
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_135
emt_set_ptn_0_lb_134:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_135:
call_nc_lb_133:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_140
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_141
emt_get_crt_ptn_0_lb_140:
; unboxed
	stc
emt_get_crt_ptn_1_lb_141:
	mov QWORD rcx,r9
	jc ret_lb_142
	push rcx
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_139
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_139:
	pop rcx
	clc
;clear 
	mov rax,rcx
	ret
ret_lb_142:
;clear  2'~_r153 6'~_r149 8'~_r157 3'~_r144 5'~_r148 9'~_r158 0'~_r140
	bt r12,2
	jc clear_lb_143
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_143:
	bt r12,6
	jc clear_lb_144
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	push QWORD rax
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_144:
	bt r12,8
	jc clear_lb_145
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_145:
	bt r12,3
	jc clear_lb_146
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_146:
	bt r12,5
	jc clear_lb_147
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_147:
	bt r12,9
	jc clear_lb_148
;push_reg
	push QWORD r8
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_148:
	bt r12,0
	jc clear_lb_149
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_149:
	mov rax,rcx
	stc
	ret
apnd:
; 	|» { 0' 1' }
	jz _apnd
	jc emt_etr_c_lb_9
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_14
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_15
emt_set_ptn_0_lb_14:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_15:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_16
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_17
emt_set_ptn_0_lb_16:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_17:
	pop rbx
	pop rbx
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
	pop rbx
jmp _apnd
emt_etr_c_lb_9:
	push rbx
	mov rbx,rdi
; emt_set_ptn { 0' 1' }
	push rbx
	mov r10,[rbx]
	bt r10,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_10
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_11
emt_set_ptn_0_lb_10:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_11:
	pop rbx
	push rbx
	mov r10,[rbx]
	bt r10,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_12
	push rdi
	mov rdi,rbx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_13
emt_set_ptn_0_lb_12:
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_lb_13:
	pop rbx
	pop rbx
_apnd:
; 	? 0'
; 	∐\ l_0 ,,l_0=nil◂{  }
; emt_ptn_crt_ptn 0',l_0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_18
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_19
emt_set_ptn_0_lb_18:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_19:
; l_0=nil◂{  }
	mov r11,[r10+8*1]
	cmp r11,0
	jnz failed_lb_21
	jmp test_lb_25
failed_lb_21:
;test 0
;clear  2'~l_0
	bt r12,2
	jc clear_lb_22
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_22:
	jmp mtc_0_lb_20
test_lb_25:
	mov r11,[r10+8*2]
	bt r12,3
; emt_set_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_24
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
emt_dec_ptn_0_lb_24:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_26
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_26:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_28
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_29
emt_get_crt_ptn_0_lb_28:
; unboxed
	stc
emt_get_crt_ptn_1_lb_29:
	mov QWORD r8,r9
	jc ret_lb_30
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_27
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_27:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_30:
;clear 
	mov rax,r8
	stc
	ret
mtc_0_lb_20:
; 	∐\ l_0 ,,l_0=cns◂{ hd tl }
; emt_ptn_crt_ptn 0',l_0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_31
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_32
emt_set_ptn_0_lb_31:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_32:
; l_0=cns◂{ hd tl }
	mov rdx,[r10+8*1]
	cmp rdx,1
	jnz failed_lb_34
	jmp test_lb_42
failed_lb_34:
;test 0
;clear  2'~l_0
	bt r12,2
	jc clear_lb_35
;push_reg
	mov rdi,r10
	call dec_r
;pop_reg
clear_lb_35:
	jmp mtc_1_lb_33
test_lb_42:
	mov rdx,[r10+8*2]
	bt r12,5
; emt_set_ptn { 3' 4' }
	push rdx
	mov rsi,[rdx]
	bt rsi,0
	mov rdx,[rdx+8*1]
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_38
	push rdi
	mov rdi,rdx
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_39
emt_set_ptn_0_lb_38:
	mov r11,rdx
	or r12,0b1000
emt_set_ptn_1_lb_39:
	pop rdx
	push rdx
	mov rsi,[rdx]
	bt rsi,1
	mov rdx,[rdx+8*2]
; emt_set_ptn 4'
; unknown
	jc emt_set_ptn_0_lb_40
	push rdi
	mov rdi,rdx
	call inc_r
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
	jmp emt_set_ptn_1_lb_41
emt_set_ptn_0_lb_40:
	mov rcx,rdx
	or r12,0b10000
emt_set_ptn_1_lb_41:
	pop rdx
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_37
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_37:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_43
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_43:
; 	apnd { 4' 1' } ⊢ 0' : @[0].(⟦⟧)◂(t133'(-1)) ≃ ∐[{ } { t133'(-1) @[0] } ]
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
	mov rdi,r11
	mov rsi,str_ret
	bt r12,3
	call pnt
	call pnt_str_ret
mov rsi,3

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
	mov rdi,rcx
	mov rsi,str_ret
	bt r12,4
	call pnt
	call pnt_str_ret
mov rsi,4

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
; push_s_ex  3'~hd
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r11
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,2
	mov r10,r9
	bt r9,1
	jc lb_44
	and r12,~0b100
lb_44:
; emt_ptn_set_ptn { 4' 2' },{ 0' 1' }
; emt_ptn_set_ptn 4',0'
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_45
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_46
emt_set_ptn_0_lb_45:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_46:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_47
	push rdi
	mov rdi,r10
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_48
emt_set_ptn_0_lb_47:
	mov r9,r10
	or r12,0b10
emt_set_ptn_1_lb_48:
; ; emt_dec_ptn { 4' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_49
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_49:
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_50
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_50:
	call _apnd
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
	mov rdi,rax
	mov rsi,str_ret
; test 0
	bt r12,8
	call pnt
	call pnt_str_ret
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
	mov QWORD [tmp],rax
	jc call_c_lb_51
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r11,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_56
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_57
emt_set_ptn_0_lb_56:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_57:
; ; emt_dec 
; unknown
	jc lb_55
;push_reg
	push QWORD r8
	push QWORD r11
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r8
lb_55:
	jmp call_nc_lb_52
call_c_lb_51:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r11,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_53
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_54
emt_set_ptn_0_lb_53:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_54:
call_nc_lb_52:
	mov QWORD r9,1
	bts r12,1
; emt_ptn_crt_ptn { 1' { 3' 0' } },l_1
; emt_get_crt_ptn { 1' { 3' 0' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD r10
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_58
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_59
emt_get_crt_ptn_0_lb_58:
; unboxed
	stc
emt_get_crt_ptn_1_lb_59:
	mov QWORD rcx,r9
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD r10
; emt_get_crt_ptn { 3' 0' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
; emt_get_crt_ptn 3'
	bt r12,3
	jc emt_get_crt_ptn_0_lb_60
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_61
emt_get_crt_ptn_0_lb_60:
; unboxed
	stc
emt_get_crt_ptn_1_lb_61:
	mov QWORD rdx,r11
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_62
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_63
emt_get_crt_ptn_0_lb_62:
; unboxed
	stc
emt_get_crt_ptn_1_lb_63:
	mov QWORD rdx,r8
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100
; ; emt_dec_ptn { 3' 0' }
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_64
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_64:
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_65
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_65:
; 	∎ 2'
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_67
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_68
emt_get_crt_ptn_0_lb_67:
; unboxed
	stc
emt_get_crt_ptn_1_lb_68:
	mov QWORD r8,r10
	jc ret_lb_69
	push r8
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_66
;push_reg
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
emt_dec_ptn_0_lb_66:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_69:
;clear 
	mov rax,r8
	stc
	ret
mtc_1_lb_33:
section .data
	cst_stg_549: db "FJiefojef",0,0,0,0,0,0,0
	cst_stg_540: db "oijfe33",0
	cst_stg_536: db "ABDs",0,0,0,0
	cst_stg_367: db "f",0,0,0,0,0,0,0
	cst_stg_342: db "t",0,0,0,0,0,0,0
	cst_stg_306: db "Y",0,0,0,0,0,0,0
	cst_stg_300: db "X",0,0,0,0,0,0,0
	cst_stg_199: db "b",0,0,0,0,0,0,0
	cst_stg_195: db "a",0,0,0,0,0,0,0
	cst_stg_187: db "c",0,0,0,0,0,0,0
	cst_stg_177: db "b",0,0,0,0,0,0,0
	cst_stg_161: db "a",0,0,0,0,0,0,0
