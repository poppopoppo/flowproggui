%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_4816
	mov QWORD [CST_DYN_4816+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_4816],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_4787
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_4783:
NS_E_RDI_4783:
NS_E_4783_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_4783_LB_0
	bt r11,7
	jc LB_4784
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,1
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_4784:
	add rsi,1
	bt r11,6
	jc LB_4785
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,2
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_4785:
	add rsi,1
	bt r11,5
	jc LB_4786
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,3
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_4786:
	add rsi,1
	bt r11,5
	jc LB_4786
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,4
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11b,[rdi+rsi+8*1+3]
	mov BYTE [r10+8*1+3],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
	add rsi,1
	mov rax,1
	ret
NS_E_4783_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_14:
	mov rdi,r8
	bt r12,0
NS_E_RDI_14:
	mov rsi,0
	setc sil
	push rsi
	call pnt_v
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
NS_E_4787:
; 	|» {  }
	jz NS_E_RDI_4787
	jc emt_etr_c_lb_4788
	push rbx
	mov rbx,rdi
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_4787
emt_etr_c_lb_4788:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_4787:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_4789+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_4789+8*0]
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
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_4790
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_4791
emt_set_ptn_0_lb_4790:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_4791:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_4792
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_4792:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_4793+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_4793+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,8
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 0',s1
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_4794
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_4795
emt_set_ptn_0_lb_4794:
	mov r10,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b100
emt_set_ptn_1_lb_4795:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_4796
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
emt_dec_ptn_0_lb_4796:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,26
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,r10
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,2
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	mov r14,0
; "Ab"
	mov BYTE [r13+8*1+r14],65
	add r14,1
	mov BYTE [r13+8*1+r14],98
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_4797:
	mov bl,[r15]
	cmp rbx,0
	jz LB_4798
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_4797
LB_4798:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_4799:
	mov bl,[r15]
	cmp rbx,0
	jz LB_4800
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_4799
LB_4800:
; 1'
	mov r15,r10
	add r15,8
LB_4801:
	mov bl,[r15]
	cmp rbx,0
	jz LB_4802
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_4801
LB_4802:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tmov r0,r1\n"
	mov BYTE [r13+8*1+r14],9
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],111
	add r14,1
	mov BYTE [r13+8*1+r14],118
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],49
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tadd r3,r5\n"
	mov BYTE [r13+8*1+r14],9
	add r14,1
	mov BYTE [r13+8*1+r14],97
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],51
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],53
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_4803
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_4804
emt_get_ptn_0_lb_4803:
; unboxed
	stc
emt_get_ptn_1_lb_4804:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_4805
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
emt_dec_ptn_0_lb_4805:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_4806
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_4806:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_4807
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_4808
emt_get_ptn_0_lb_4807:
; unboxed
	stc
emt_get_ptn_1_lb_4808:
	mov QWORD r9,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_4809
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_4809:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_4810
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_4810:
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_4811
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_4812
emt_get_ptn_0_lb_4811:
; unboxed
	stc
emt_get_ptn_1_lb_4812:
	mov QWORD r9,r8
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_4813
;push_reg
	push QWORD r8
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r8
emt_dec_ptn_0_lb_4813:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_4814
;push_reg
	call exec_out
;pop_reg
LB_4814:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_4815
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_4815:
;clear 
	mov rax,r8
	stc
	ret
NS_E_4816:
NS_E_RDI_4816:
; 	» "HOOO BOOO\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_4817+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_4817+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,6
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_4818
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_4819
emt_set_ptn_0_lb_4818:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_4819:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_4820
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_4820:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_4821
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_4822
emt_get_ptn_0_lb_4821:
; unboxed
	stc
emt_get_ptn_1_lb_4822:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_4823
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_4823:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_4824
;push_reg
	call exec_out
;pop_reg
LB_4824:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_4825
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_4825:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_4783:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4783
	NS_E_DYN_4787:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4787
	CST_DYN_4816:
		dq 1
		dq 1
	cst_stg_4817: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4793: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4789: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4774: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4750: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4746: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4731: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4707: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4703: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4688: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4664: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4660: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4645: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4621: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4617: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4588: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4584: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4571: db 120,121,122,0,0,0,0,0
	cst_stg_4560: db 65,66,67,0,0,0,0,0
	cst_stg_4532: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4528: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4515: db 120,121,122,0,0,0,0,0
	cst_stg_4504: db 65,66,67,0,0,0,0,0
	cst_stg_4490: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4466: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4462: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4427: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4403: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4399: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4360: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4336: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4332: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4261: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4237: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4233: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_4064: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_4054: db 70,79,79,0,0,0,0,0
	cst_stg_4014: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_4010: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_3841: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_3832: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_3822: db 70,79,79,0,0,0,0,0
	cst_stg_3782: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_3778: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_3615: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_3611: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_3598: db 120,121,122,0,0,0,0,0
	cst_stg_3587: db 65,66,67,0,0,0,0,0
	cst_stg_3573: db 65,66,67,0,0,0,0,0
	cst_stg_3540: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_3531: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_3521: db 70,79,79,0,0,0,0,0
	cst_stg_3481: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_3477: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_3314: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_3310: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_3297: db 120,121,122,0,0,0,0,0
	cst_stg_3286: db 65,66,67,0,0,0,0,0
	cst_stg_3273: db 120,121,122,0,0,0,0,0
	cst_stg_3262: db 65,66,67,0,0,0,0,0
	cst_stg_3248: db 120,121,122,0,0,0,0,0
	cst_stg_3237: db 65,66,67,0,0,0,0,0
	cst_stg_3223: db 120,121,122,0,0,0,0,0
	cst_stg_3212: db 65,66,67,0,0,0,0,0
	cst_stg_3198: db 65,66,67,0,0,0,0,0
	cst_stg_3165: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_3156: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_3146: db 70,79,79,0,0,0,0,0
	cst_stg_3106: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_3102: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_2953: db 65,66,67,0,0,0,0,0
	cst_stg_2920: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_2911: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_2901: db 70,79,79,0,0,0,0,0
	cst_stg_2861: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_2857: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_2708: db 120,121,122,0,0,0,0,0
	cst_stg_2697: db 65,66,67,0,0,0,0,0
	cst_stg_2683: db 120,121,122,0,0,0,0,0
	cst_stg_2653: db 65,66,67,0,0,0,0,0
	cst_stg_2636: db 65,66,67,0,0,0,0,0
	cst_stg_2603: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_2594: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_2584: db 70,79,79,0,0,0,0,0
	cst_stg_2544: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_2540: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_2391: db 65,66,67,0,0,0,0,0
	cst_stg_2358: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_2349: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_2339: db 70,79,79,0,0,0,0,0
	cst_stg_2299: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_2295: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_2146: db 65,66,67,0,0,0,0,0
	cst_stg_2113: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_2104: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_2094: db 70,79,79,0,0,0,0,0
	cst_stg_2054: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_2050: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_1901: db 65,66,67,0,0,0,0,0
	cst_stg_1868: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_1859: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_1849: db 70,79,79,0,0,0,0,0
	cst_stg_1809: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_1805: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_1656: db 65,66,67,0,0,0,0,0
	cst_stg_1623: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_1614: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_1604: db 70,79,79,0,0,0,0,0
	cst_stg_1564: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_1560: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_1411: db 120,121,122,0,0,0,0,0
	cst_stg_1381: db 65,66,67,0,0,0,0,0
	cst_stg_1364: db 65,66,67,0,0,0,0,0
	cst_stg_1331: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_1322: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_1312: db 70,79,79,0,0,0,0,0
	cst_stg_1272: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_1268: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_1119: db 120,121,122,0,0,0,0,0
	cst_stg_1089: db 65,66,67,0,0,0,0,0
	cst_stg_1050: db 65,66,67,0,0,0,0,0
	cst_stg_1033: db 65,66,67,0,0,0,0,0
	cst_stg_1000: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_991: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_981: db 70,79,79,0,0,0,0,0
	cst_stg_941: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_937: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_773: db 65,66,67,0,0,0,0,0
	cst_stg_740: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_731: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_721: db 70,79,79,0,0,0,0,0
	cst_stg_681: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_677: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_485: db 120,65,119,0,0,0,0,0
	cst_stg_460: db 65,66,67,0,0,0,0,0
	cst_stg_427: db 72,79,79,79,32,66,79,79,79,10,0,0,0,0,0,0
	cst_stg_418: db 72,69,76,76,79,79,79,79,33,33,10,0,0,0,0,0
	cst_stg_408: db 70,79,79,0,0,0,0,0
	cst_stg_368: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_364: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_193: db 65,66,67,0,0,0,0,0
	cst_stg_154: db 65,66,67,0,0,0,0,0
	cst_stg_115: db 65,66,67,0,0,0,0,0
	cst_stg_76: db 65,66,67,0,0,0,0,0
	cst_stg_38: db 65,66,67,0,0,0,0,0
