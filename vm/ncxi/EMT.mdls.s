bits 64 
%define SS_MAX 2000
%define SS_NULL 0xffff_ffff_ffff_0000
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern free 
extern isspace 
extern strtoul
section .bss 
	tmp: resq 64
	ret_vct: resq 64
 rsp_tmp: resq 1

; SS segments 
	SS_TOP: resq 1
	SS_VCT: resq 16*SS_MAX
	SS_BTM: resq 1 

	SS_LN_TOP: resq 1
	SS_LN_VCT: resq 2*SS_MAX
	SS_LN_BTM: resq 1  

	SS_PT_TOP: resq 1
	SS_PT_VCT: resq 3*SS_MAX
	SS_PT_BTM: resq 1 


SS_RCD_1_TOP: resq 1

SS_RCD_1_VCT: resq 2*SS_MAX

SS_RCD_1_BTM: resq 1


SS_RCD_2_TOP: resq 1

SS_RCD_2_VCT: resq 3*SS_MAX

SS_RCD_2_BTM: resq 1


SS_RCD_3_TOP: resq 1

SS_RCD_3_VCT: resq 4*SS_MAX

SS_RCD_3_BTM: resq 1


SS_RCD_4_TOP: resq 1

SS_RCD_4_VCT: resq 5*SS_MAX

SS_RCD_4_BTM: resq 1


SS_RCD_5_TOP: resq 1

SS_RCD_5_VCT: resq 6*SS_MAX

SS_RCD_5_BTM: resq 1


SS_RCD_6_TOP: resq 1

SS_RCD_6_VCT: resq 7*SS_MAX

SS_RCD_6_BTM: resq 1


SS_RCD_7_TOP: resq 1

SS_RCD_7_VCT: resq 8*SS_MAX

SS_RCD_7_BTM: resq 1


SS_RCD_8_TOP: resq 1

SS_RCD_8_VCT: resq 9*SS_MAX

SS_RCD_8_BTM: resq 1


SS_RCD_9_TOP: resq 1

SS_RCD_9_VCT: resq 10*SS_MAX

SS_RCD_9_BTM: resq 1


SS_RCD_10_TOP: resq 1

SS_RCD_10_VCT: resq 11*SS_MAX

SS_RCD_10_BTM: resq 1


SS_RCD_11_TOP: resq 1

SS_RCD_11_VCT: resq 12*SS_MAX

SS_RCD_11_BTM: resq 1


SS_RCD_12_TOP: resq 1

SS_RCD_12_VCT: resq 13*SS_MAX

SS_RCD_12_BTM: resq 1


SS_RCD_13_TOP: resq 1

SS_RCD_13_VCT: resq 14*SS_MAX

SS_RCD_13_BTM: resq 1


SS_RCD_14_TOP: resq 1

SS_RCD_14_VCT: resq 15*SS_MAX

SS_RCD_14_BTM: resq 1


SS_RCD_15_TOP: resq 1

SS_RCD_15_VCT: resq 16*SS_MAX

SS_RCD_15_BTM: resq 1

section .data
	err_n: dq 0
	fmt_err_line: db "err:%d",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
	fmt_d: db "%d",0
	fmt_x: db "%x",0
	fmt_arr_l: db "{| ",0
	fmt_arr_r: db "|}",0
	rt_err0: db "rt_err 0:",10,0 
	unt: dq 0x0

	unt_0: dq 0x0 
	unt_1: dq 0x00_01_0000_0000_0000 
	unt_2: dq 0x00_02_0000_0000_0000 
	unt_3: dq 0x00_03_0000_0000_0000 
	unt_4: dq 0x00_04_0000_0000_0000 
	unt_5: dq 0x00_05_0000_0000_0000 
	unt_6: dq 0x00_06_0000_0000_0000 
	unt_7: dq 0x00_07_0000_0000_0000 
	unt_8: dq 0x00_08_0000_0000_0000 

section .text
global _start
rpc_s8: ; rdi ⊢ rax
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi]  
	push rdi 
	push rsi 
	and rsi,~111b
	lea rdi,[rsi+16] 
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
	pop rcx 
	mov QWORD [rax],rcx
	pop rsi 
	add rsi,8
	lea rdi,[rax+8]
	cld 
	rep movsb
	ret
     
esc_s8: ; rdi ⊢ rax 
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi] 
	mov rax,rsi 
	shl rax,1 
	sub rsp,rax 
esc_s8_lp0: 

arr_of_lt: 
	mov rsi,0 
arr_of_lst_r:
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jz arr_of_lst_end 
	push QWORD [rdi+8] 
	mov rdi,QWORD [rdi+16]
	add rsi,1 
	call arr_of_lst_r
	sub rsi,1 
	pop QWORD [rax+8+8*rsi]
	ret 
arr_of_lst_end: 
	push rsi 
	xor rax,rax
	mov rdi,8
	add rsi,1 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]
	pop rsi 
	mov QWORD [rax],rsi
	ret 

scf_d: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	push rdi
	movzx rdi,BYTE [rdi]
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call isspace
	mov rsp,QWORD [rsp_tmp]
	cmp rax,0
	jnz scf_d_err0 
	jmp scf_d_scf 
scf_d_err0: 
	add rsp,8
	mov rax,0
	ret
	scf_d_scf:
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,10
	mov rax,0
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call strtoul
	mov rsp,QWORD [rsp_tmp]
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_d_err1
 mov rdi,rax
	mov rax,1 
	ret
scf_d_err1:
	mov rax,0 
	ret

scf_x: ; rdi=src ⊢ rax=flg rdi=dst rsi=n
	push rdi
	movzx rdi,BYTE [rdi]
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call isspace
	mov rsp,QWORD [rsp_tmp]
	cmp rax,0
	jnz scf_x_err0 
	jmp scf_x_scf 
scf_x_err0: 
	add rsp,8
	mov rax,0
	ret
	scf_x_scf:
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,16
	mov rax,0
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call strtoul
	mov rsp,QWORD [rsp_tmp]
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_x_err1
 mov rdi,rax
	mov rax,1 
	ret
scf_x_err1:
	mov rax,0 
	ret

_start:
SS_init:
	mov QWORD [SS_TOP],SS_VCT
	mov rdi,0 
	mov rax,SS_VCT 
SS_lp: 
	cmp rdi,SS_MAX 
	jz SS_end 
	add rdi,1 
	lea rsi,[rax+8*16] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_lp 
SS_end:
	mov rsi,SS_NULL 
	mov [rax],rsi

SS_LN_init:
	mov QWORD [SS_LN_TOP],SS_LN_VCT
	mov rdi,0 
	mov rax,SS_LN_VCT 
SS_LN_lp: 
	cmp rdi,SS_MAX 
	jz SS_LN_end 
	add rdi,1 
	lea rsi,[rax+8*2] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_LN_lp 
SS_LN_end:
	mov rsi,0xffff_ffff_ffff_0100 
	mov [rax],rsi

SS_PT_init:
	mov QWORD [SS_PT_TOP],SS_PT_VCT
	mov rdi,0 
	mov rax,SS_PT_VCT 
SS_PT_lp: 
	cmp rdi,SS_MAX 
	jz SS_PT_end 
	add rdi,1 
	lea rsi,[rax+8*3] 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_PT_lp 
SS_PT_end:
	mov rsi,0xffff_ffff_ffff_0200 
	mov [rax],rsi


init_ss_rcd_1:
	mov QWORD [SS_RCD_1_TOP],SS_RCD_1_VCT
	mov rdi,0 
	mov rax,SS_RCD_1_VCT
ss_lp_rcd_1:
	cmp rdi,SS_MAX
	jz ss_end_rcd_1
	add rdi,1 
	lea rsi,[rax+8*2]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_1
ss_end_rcd_1:
	mov rsi,-65535
	mov [rax],rsi 

init_ss_rcd_2:
	mov QWORD [SS_RCD_2_TOP],SS_RCD_2_VCT
	mov rdi,0 
	mov rax,SS_RCD_2_VCT
ss_lp_rcd_2:
	cmp rdi,SS_MAX
	jz ss_end_rcd_2
	add rdi,1 
	lea rsi,[rax+8*3]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_2
ss_end_rcd_2:
	mov rsi,-65534
	mov [rax],rsi 

init_ss_rcd_3:
	mov QWORD [SS_RCD_3_TOP],SS_RCD_3_VCT
	mov rdi,0 
	mov rax,SS_RCD_3_VCT
ss_lp_rcd_3:
	cmp rdi,SS_MAX
	jz ss_end_rcd_3
	add rdi,1 
	lea rsi,[rax+8*4]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_3
ss_end_rcd_3:
	mov rsi,-65533
	mov [rax],rsi 

init_ss_rcd_4:
	mov QWORD [SS_RCD_4_TOP],SS_RCD_4_VCT
	mov rdi,0 
	mov rax,SS_RCD_4_VCT
ss_lp_rcd_4:
	cmp rdi,SS_MAX
	jz ss_end_rcd_4
	add rdi,1 
	lea rsi,[rax+8*5]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_4
ss_end_rcd_4:
	mov rsi,-65532
	mov [rax],rsi 

init_ss_rcd_5:
	mov QWORD [SS_RCD_5_TOP],SS_RCD_5_VCT
	mov rdi,0 
	mov rax,SS_RCD_5_VCT
ss_lp_rcd_5:
	cmp rdi,SS_MAX
	jz ss_end_rcd_5
	add rdi,1 
	lea rsi,[rax+8*6]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_5
ss_end_rcd_5:
	mov rsi,-65531
	mov [rax],rsi 

init_ss_rcd_6:
	mov QWORD [SS_RCD_6_TOP],SS_RCD_6_VCT
	mov rdi,0 
	mov rax,SS_RCD_6_VCT
ss_lp_rcd_6:
	cmp rdi,SS_MAX
	jz ss_end_rcd_6
	add rdi,1 
	lea rsi,[rax+8*7]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_6
ss_end_rcd_6:
	mov rsi,-65530
	mov [rax],rsi 

init_ss_rcd_7:
	mov QWORD [SS_RCD_7_TOP],SS_RCD_7_VCT
	mov rdi,0 
	mov rax,SS_RCD_7_VCT
ss_lp_rcd_7:
	cmp rdi,SS_MAX
	jz ss_end_rcd_7
	add rdi,1 
	lea rsi,[rax+8*8]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_7
ss_end_rcd_7:
	mov rsi,-65529
	mov [rax],rsi 

init_ss_rcd_8:
	mov QWORD [SS_RCD_8_TOP],SS_RCD_8_VCT
	mov rdi,0 
	mov rax,SS_RCD_8_VCT
ss_lp_rcd_8:
	cmp rdi,SS_MAX
	jz ss_end_rcd_8
	add rdi,1 
	lea rsi,[rax+8*9]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_8
ss_end_rcd_8:
	mov rsi,-65528
	mov [rax],rsi 

init_ss_rcd_9:
	mov QWORD [SS_RCD_9_TOP],SS_RCD_9_VCT
	mov rdi,0 
	mov rax,SS_RCD_9_VCT
ss_lp_rcd_9:
	cmp rdi,SS_MAX
	jz ss_end_rcd_9
	add rdi,1 
	lea rsi,[rax+8*10]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_9
ss_end_rcd_9:
	mov rsi,-65527
	mov [rax],rsi 

init_ss_rcd_10:
	mov QWORD [SS_RCD_10_TOP],SS_RCD_10_VCT
	mov rdi,0 
	mov rax,SS_RCD_10_VCT
ss_lp_rcd_10:
	cmp rdi,SS_MAX
	jz ss_end_rcd_10
	add rdi,1 
	lea rsi,[rax+8*11]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_10
ss_end_rcd_10:
	mov rsi,-65526
	mov [rax],rsi 

init_ss_rcd_11:
	mov QWORD [SS_RCD_11_TOP],SS_RCD_11_VCT
	mov rdi,0 
	mov rax,SS_RCD_11_VCT
ss_lp_rcd_11:
	cmp rdi,SS_MAX
	jz ss_end_rcd_11
	add rdi,1 
	lea rsi,[rax+8*12]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_11
ss_end_rcd_11:
	mov rsi,-65525
	mov [rax],rsi 

init_ss_rcd_12:
	mov QWORD [SS_RCD_12_TOP],SS_RCD_12_VCT
	mov rdi,0 
	mov rax,SS_RCD_12_VCT
ss_lp_rcd_12:
	cmp rdi,SS_MAX
	jz ss_end_rcd_12
	add rdi,1 
	lea rsi,[rax+8*13]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_12
ss_end_rcd_12:
	mov rsi,-65524
	mov [rax],rsi 

init_ss_rcd_13:
	mov QWORD [SS_RCD_13_TOP],SS_RCD_13_VCT
	mov rdi,0 
	mov rax,SS_RCD_13_VCT
ss_lp_rcd_13:
	cmp rdi,SS_MAX
	jz ss_end_rcd_13
	add rdi,1 
	lea rsi,[rax+8*14]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_13
ss_end_rcd_13:
	mov rsi,-65523
	mov [rax],rsi 

init_ss_rcd_14:
	mov QWORD [SS_RCD_14_TOP],SS_RCD_14_VCT
	mov rdi,0 
	mov rax,SS_RCD_14_VCT
ss_lp_rcd_14:
	cmp rdi,SS_MAX
	jz ss_end_rcd_14
	add rdi,1 
	lea rsi,[rax+8*15]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_14
ss_end_rcd_14:
	mov rsi,-65522
	mov [rax],rsi 

init_ss_rcd_15:
	mov QWORD [SS_RCD_15_TOP],SS_RCD_15_VCT
	mov rdi,0 
	mov rax,SS_RCD_15_VCT
ss_lp_rcd_15:
	cmp rdi,SS_MAX
	jz ss_end_rcd_15
	add rdi,1 
	lea rsi,[rax+8*16]
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp ss_lp_rcd_15
ss_end_rcd_15:
	mov rsi,-65521
	mov [rax],rsi 
	jmp RTM_0
ETR_34: ; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %0~0'(= {| l |} ) 
; #32 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %1~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_35: ; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
;; rsp=0 , %2~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_0
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*2]
	mov r9,rdi
;; rsp=0 , %7~3'(= a5◂ [ ] ) %6~2'(= r ) %5~1'(= a5◂ [ ] ) 
	jmp LB_1
LB_1:
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	mov rax,rdi
	mov r13,rax
;; rsp=0 , %16~0'(= r ) %15~2'(= r ) %7~3'(= a5◂ [ ] ) %5~1'(= a5◂ [ ] ) 
; #33 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %17~0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } %15~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r10,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r11,rax
	mov rax,r14
	mov rdi,r11
	mov QWORD [rdi+8+8*0],rax
	mov rax,r10
	mov rdi,r11
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov rdi,r11
	mov QWORD [rdi+8+8*2],rax
	mov rax,r11
	mov BYTE [rax+6],0
	mov r13,rax
; .mov_ptn 2'(= r ) ⊢ 1'(= r )
	mov rax,r8
	mov r14,rax
	ret
LB_0:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_2
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %4~1'(= r ) 
	jmp LB_3
LB_3:
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %13~%[ 1r ] %4~1'(= r ) 
; #30 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %14~3(<4)◂1'(= r ) %13~%[ 1r ] 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn 3(<4)◂1'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov rax,1
	mov r14,rax
	ret
LB_2:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_4
;; rsp=0 , 
; #31 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %11~2(<4)◂{ } 
	jmp LB_5
LB_5:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %12~%[ 0r ] %11~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
LB_4:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %3~0'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r14,rdi
;; rsp=0 , %9~1'(= r ) %8~0'(= {| l |} ) 
; #32 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %10~1(<4)◂0'(= {| l |} ) %9~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<4)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r8
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_36: ; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %19~1'(= {| l |} ) %18~0'(= a5◂ [ ] ) 
; _s8_len 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r8,rdi
;; rsp=0 , %21~2'(= r ) %20~1'(= {| l |} ) %18~0'(= a5◂ [ ] ) 
; rsp_d=0, #35 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_35

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %23~3'(= r ) %22~0'(= a5◂ [ ] ) %21~2'(= r ) %20~1'(= {| l |} ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %25~3'(= r ) %24~2'(= r ) %22~0'(= a5◂ [ ] ) %20~1'(= {| l |} ) 
; #32 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %26~1(<4)◂1'(= {| l |} ) %25~3'(= r ) %24~2'(= r ) %22~0'(= a5◂ [ ] ) 
; #33 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
;; rsp=0 , %27~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } %25~3'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
; .dlt.ptn 3'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r9
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r8
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_37: ; pfx_s8 { 0'(= {| l |} ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _s8 _t5 }→_t5)
;; rsp=0 , %29~1'(= a5◂ [ ] ) %28~0'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r8,rdi
;; rsp=0 , %31~2'(= r ) %30~0'(= {| l |} ) %29~1'(= a5◂ [ ] ) 
; rsp_d=0, #35 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_35

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %33~1'(= r ) %32~3'(= a5◂ [ ] ) %31~2'(= r ) %30~0'(= {| l |} ) 
; _add { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %35~1'(= r ) %34~2'(= r ) %32~3'(= a5◂ [ ] ) %30~0'(= {| l |} ) 
; #32 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %36~1(<4)◂0'(= {| l |} ) %35~1'(= r ) %34~2'(= r ) %32~3'(= a5◂ [ ] ) 
; #33 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %37~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } %35~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1(<4)◂1'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r8
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_38: ; add_chr { 0'(= a5◂ [ ] ) 1'(= r ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _r64 }→_t5)
;; rsp=0 , %39~1'(= r ) %38~0'(= a5◂ [ ] ) 
; rsp_d=0, #35 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_35

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %41~2'(= r ) %40~0'(= a5◂ [ ] ) %39~1'(= r ) 
; _inc 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %42~2'(= r ) %40~0'(= a5◂ [ ] ) %39~1'(= r ) 
; #30 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %43~3(<4)◂1'(= r ) %42~2'(= r ) %40~0'(= a5◂ [ ] ) 
; #33 { 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
;; rsp=0 , %44~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r9
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r8
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_39: ; pfx_chr { 0'(= r ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _r64 _t5 }→_t5)
;; rsp=0 , %46~1'(= a5◂ [ ] ) %45~0'(= r ) 
; rsp_d=0, #35 1'(= a5◂ [ ] ) ⊢ { 2'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_35

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %48~1'(= r ) %47~2'(= a5◂ [ ] ) %45~0'(= r ) 
; _inc 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %49~1'(= r ) %47~2'(= a5◂ [ ] ) %45~0'(= r ) 
; #30 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %50~3(<4)◂0'(= r ) %49~1'(= r ) %47~2'(= a5◂ [ ] ) 
; #33 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
;; rsp=0 , %51~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3(<4)◂3'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r8
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_40: ; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %53~1'(= a5◂ [ ] ) %52~0'(= a5◂ [ ] ) 
; rsp_d=0, #35 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_35

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %55~2'(= r ) %54~0'(= a5◂ [ ] ) %53~1'(= a5◂ [ ] ) 
; rsp_d=0, #35 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_35

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %57~1'(= r ) %56~3'(= a5◂ [ ] ) %55~2'(= r ) %54~0'(= a5◂ [ ] ) 
; _add { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %59~1'(= r ) %58~2'(= r ) %56~3'(= a5◂ [ ] ) %54~0'(= a5◂ [ ] ) 
; #33 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %60~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %59~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r14
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r8
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_41: ; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %63~2'(= r ) %62~1'(= {| l |} ) %61~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_6
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*2]
	mov r11,rdi
;; rsp=0 , %68~5'(= a5◂ [ ] ) %67~4'(= r ) %66~3'(= a5◂ [ ] ) %63~2'(= r ) %62~1'(= {| l |} ) 
; rsp_d=0, #41 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_41

	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %86~2'(= r ) %85~1'(= {| l |} ) %84~0'(= a5◂ [ ] ) %68~5'(= a5◂ [ ] ) %67~4'(= r ) 
; rsp_d=0, #41 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r11
	mov r13,rax
	call ETR_41

	mov r10,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %89~2'(= r ) %88~1'(= {| l |} ) %87~3'(= a5◂ [ ] ) %84~0'(= a5◂ [ ] ) %67~4'(= r ) 
; #33 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %90~0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %89~2'(= r ) %88~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r11,r13
; .mov_ptn 0(<4)◂{ 5'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov rcx,rax
	mov rax,r11
	mov rdi,rcx
	mov QWORD [rdi+8+8*0],rax
	mov rax,r10
	mov rdi,rcx
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov rdi,rcx
	mov QWORD [rdi+8+8*2],rax
	mov rax,rcx
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_6:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_7
;; rsp=0 , %63~2'(= r ) %62~1'(= {| l |} ) 
; #31 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %83~2(<4)◂{ } %63~2'(= r ) %62~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
LB_7:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_8
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=0 , %65~3'(= r ) %63~2'(= r ) %62~1'(= {| l |} ) 
; _sts { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r8
	jle err
	mov rsi,r8
	mov rdi,r9
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %80~3'(= r ) %79~2'(= r ) %78~1'(= {| l |} ) 
; _inc 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %81~2'(= r ) %80~3'(= r ) %78~1'(= {| l |} ) 
; #30 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %82~3(<4)◂3'(= r ) %81~2'(= r ) %78~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3(<4)◂3'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_8:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %64~0'(= {| l |} ) %63~2'(= r ) %62~1'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r9,rdi
;; rsp=0 , %70~3'(= r ) %69~0'(= {| l |} ) %63~2'(= r ) %62~1'(= {| l |} ) 
	jmp LB_9
LB_9:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %71~%[ 0r ] %70~3'(= r ) %69~0'(= {| l |} ) %63~2'(= r ) %62~1'(= {| l |} ) 
; _rep_movsb { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
	mov rax,r9
	mov rsi,r13
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,0
	jl err
	lea rsi,[rsi+0]
	push rsi 
	mov rsi,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,r8
	jl err
	add rsi,r8
	mov rdi,rsi 
	pop rsi 
	push rcx 
	mov rcx,rax 
	cld 
	rep movsb
	pop rcx 
;; rsp=0 , %76~2'(= r ) %75~1'(= {| l |} ) %74~%[ 0r ] %73~0'(= {| l |} ) %72~3'(= r ) 
; #32 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %77~1(<4)◂0'(= {| l |} ) %76~2'(= r ) %75~1'(= {| l |} ) %74~%[ 0r ] %72~3'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn %[ 0r ]
; .dlt.ptn 3'(= r )
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<4)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_42: ; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %91~0'(= a5◂ [ ] ) 
; rsp_d=0, #35 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_35

;; rsp=0 , %93~1'(= r ) %92~0'(= a5◂ [ ] ) 
; _mlc_s8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1 
	xor rax,rax
	push rdi
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop QWORD [rax] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
;; rsp=0 , %95~2'(= {| l |} ) %94~1'(= r ) %92~0'(= a5◂ [ ] ) 
	jmp LB_10
LB_10:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %96~%[ 0r ] %95~2'(= {| l |} ) %94~1'(= r ) %92~0'(= a5◂ [ ] ) 
; rsp_d=0, #41 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r8
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov rax,0
	mov r8,rax
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	call ETR_41

	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %99~2'(= r ) %98~3'(= {| l |} ) %97~0'(= a5◂ [ ] ) %94~1'(= r ) 
; ∎ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_45: ; and { 0'(= a6◂ [ ] ) 1'(= a6◂ [ ] ) } ⊢ 0'(= a6◂ [ ] ) : ({ _t6 _t6 }→_t6)
;; rsp=0 , %101~1'(= a6◂ [ ] ) %100~0'(= a6◂ [ ] ) 
;; ? 0'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_11
;; ? 1'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_11
;; rsp=0 , 
; #44 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %103~0(<2)◂{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_0
	mov r13,rax
	ret
LB_11:
;; rsp=0 , %101~1'(= a6◂ [ ] ) %100~0'(= a6◂ [ ] ) 
; #43 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %102~1(<2)◂{ } %101~1'(= a6◂ [ ] ) %100~0'(= a6◂ [ ] ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= a6◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 0'(= a6◂ [ ] )
;	.dlt adt ⊢ _  
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
ETR_46: ; or { 0'(= a6◂ [ ] ) 1'(= a6◂ [ ] ) } ⊢ 0'(= a6◂ [ ] ) : ({ _t6 _t6 }→_t6)
;; rsp=0 , %105~1'(= a6◂ [ ] ) %104~0'(= a6◂ [ ] ) 
;; ? 0'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_12
;; ? 1'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_12
;; rsp=0 , 
; #43 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %107~1(<2)◂{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
LB_12:
;; rsp=0 , %105~1'(= a6◂ [ ] ) %104~0'(= a6◂ [ ] ) 
; #44 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %106~0(<2)◂{ } %105~1'(= a6◂ [ ] ) %104~0'(= a6◂ [ ] ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= a6◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 0'(= a6◂ [ ] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_0
	mov r13,rax
	ret
ETR_47: ; sub { 0'(= a6◂ [ ] ) 1'(= a6◂ [ ] ) } ⊢ 0'(= a6◂ [ ] ) : ({ _t6 _t6 }→_t6)
;; rsp=0 , %109~1'(= a6◂ [ ] ) %108~0'(= a6◂ [ ] ) 
;; ? 1'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_13
;; rsp=0 , %108~0'(= a6◂ [ ] ) 
; ∎ 0'(= a6◂ [ ] )
; .mov_ptn2 0'(= a6◂ [ ] ) ⊢ 0'(= a6◂ [ ] )
	ret
LB_13:
;; ? 1'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
;; rsp=0 , %108~0'(= a6◂ [ ] ) 
; #43 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %110~1(<2)◂{ } %108~0'(= a6◂ [ ] ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 0'(= a6◂ [ ] )
;	.dlt adt ⊢ _  
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
ETR_53: ; s8_of_r64_lst_i { 0'(= r ) 1'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂_r64 }→{ _r64 _s8 })
;; rsp=0 , %127~1'(= a2◂ [ r] ) %126~0'(= r ) 
;; ? 1'(= a2◂ [ r] ) ⊢ 0(<2)◂{ 2'(= r ) 3'(= a2◂ [ r] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_14
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %131~3'(= a2◂ [ r] ) %130~2'(= r ) %126~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %132~0'(= r ) %131~3'(= a2◂ [ r] ) %130~2'(= r ) 
; rsp_d=0, #53 { 0'(= r ) 3'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ r] ) }
; .mov_ptn 3'(= a2◂ [ r] ) ⊢ 1'(= a2◂ [ r] )
	mov rax,r9
	mov r14,rax
	call ETR_53

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %134~1'(= {| l |} ) %133~0'(= r ) %130~2'(= r ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %135~0'(= r ) %134~1'(= {| l |} ) %130~2'(= r ) 
; _sts { 1'(= {| l |} ) 0'(= r ) 2'(= r ) } ⊢ { 1'(= {| l |} ) 0'(= r ) 2'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r13
	jle err
	mov rsi,r13
	mov rdi,r8
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %138~2'(= r ) %137~0'(= r ) %136~1'(= {| l |} ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .dlt.ptn 2'(= r )
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_14:
;; ? 1'(= a2◂ [ r] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %126~0'(= r ) 
; _mlc_s8 0'(= r ) ⊢ { 0'(= r ) 1'(= {| l |} ) }
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1 
	xor rax,rax
	push rdi
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop QWORD [rax] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
;; rsp=0 , %129~1'(= {| l |} ) %128~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_54: ; s8_of_r64_lst 0'(= a2◂ [ r] ) ⊢ 0'(= {| l |} ) : (_lst◂_r64→_s8)
;; rsp=0 , %139~0'(= a2◂ [ r] ) 
	jmp LB_15
LB_15:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %140~%[ 0r ] %139~0'(= a2◂ [ r] ) 
; rsp_d=0, #53 { %[ 0r ] 0'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { %[ 0r ] 0'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ r] ) }
; .mov_ptn 0'(= a2◂ [ r] ) ⊢ 1'(= a2◂ [ r] )
	mov rax,r13
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	call ETR_53

;; rsp=0 , %142~1'(= {| l |} ) %141~0'(= r ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= r )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
ETR_55: ; s8_of_s8_lst_i { 0'(= r ) 1'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) } : ({ _r64 _lst◂_s8 }→{ _s8 _r64 })
;; rsp=0 , %144~1'(= a2◂ [ {| l |}] ) %143~0'(= r ) 
;; ? 1'(= a2◂ [ {| l |}] ) ⊢ 0(<2)◂{ 2'(= {| l |} ) 3'(= a2◂ [ {| l |}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_16
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %146~3'(= a2◂ [ {| l |}] ) %145~2'(= {| l |} ) %143~0'(= r ) 
; _s8_len 2'(= {| l |} ) ⊢ { 2'(= {| l |} ) 1'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r14,rdi
;; rsp=0 , %151~1'(= r ) %150~2'(= {| l |} ) %146~3'(= a2◂ [ {| l |}] ) %143~0'(= r ) 
; _add { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	add r13,r14
;; rsp=0 , %153~1'(= r ) %152~0'(= r ) %150~2'(= {| l |} ) %146~3'(= a2◂ [ {| l |}] ) 
; rsp_d=0, #55 { 0'(= r ) 3'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= {| l |} ) 3'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ {| l |}] ) }
; .mov_ptn 3'(= a2◂ [ {| l |}] ) ⊢ 1'(= a2◂ [ {| l |}] )
	mov rax,r9
	mov r14,rax
	call ETR_55

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %155~3'(= r ) %154~0'(= {| l |} ) %153~1'(= r ) %150~2'(= {| l |} ) 
	jmp LB_17
LB_17:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %156~%[ 0r ] %155~3'(= r ) %154~0'(= {| l |} ) %153~1'(= r ) %150~2'(= {| l |} ) 
	jmp LB_18
LB_18:
; $ 1'(= r ) ⊢ 1'(= r ),4'(= r )
	mov rdi,r14
	mov rax,rdi
	mov r10,rax
;; rsp=0 , %158~4'(= r ) %157~1'(= r ) %156~%[ 0r ] %155~3'(= r ) %154~0'(= {| l |} ) %150~2'(= {| l |} ) 
; _rep_movsb { 1'(= r ) 2'(= {| l |} ) %[ 0r ] 0'(= {| l |} ) 3'(= r ) } ⊢ { 1'(= r ) 2'(= {| l |} ) %[ 0r ] 0'(= {| l |} ) 3'(= r ) }
	mov rax,r14
	mov rsi,r8
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,0
	jl err
	lea rsi,[rsi+0]
	push rsi 
	mov rsi,r13
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,r9
	jl err
	add rsi,r9
	mov rdi,rsi 
	pop rsi 
	push rcx 
	mov rcx,rax 
	cld 
	rep movsb
	pop rcx 
;; rsp=0 , %163~3'(= r ) %162~0'(= {| l |} ) %161~%[ 0r ] %160~2'(= {| l |} ) %159~1'(= r ) %158~4'(= r ) 
; ∎ { 0'(= {| l |} ) 3'(= r ) }
; .dlt.ptn %[ 0r ]
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= r )
; .dlt.ptn 4'(= r )
; .mov_ptn2 { 0'(= {| l |} ) 3'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn 3'(= r ) ⊢ 1'(= r )
	mov rax,r9
	mov r14,rax
	ret
LB_16:
;; ? 1'(= a2◂ [ {| l |}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %143~0'(= r ) 
; _mlc_s8 0'(= r ) ⊢ { 0'(= r ) 1'(= {| l |} ) }
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1 
	xor rax,rax
	push rdi
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop QWORD [rax] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
;; rsp=0 , %148~1'(= {| l |} ) %147~0'(= r ) 
	jmp LB_19
LB_19:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %149~%[ 0r ] %148~1'(= {| l |} ) %147~0'(= r ) 
; ∎ { 1'(= {| l |} ) %[ 0r ] }
; .dlt.ptn 0'(= r )
; .mov_ptn2 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	ret
ETR_56: ; s8_of_s8_lst 0'(= a2◂ [ {| l |}] ) ⊢ 0'(= {| l |} ) : (_lst◂_s8→_s8)
;; rsp=0 , %164~0'(= a2◂ [ {| l |}] ) 
	jmp LB_20
LB_20:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %165~%[ 0r ] %164~0'(= a2◂ [ {| l |}] ) 
; rsp_d=0, #55 { %[ 0r ] 0'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { %[ 0r ] 0'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ {| l |}] ) }
; .mov_ptn 0'(= a2◂ [ {| l |}] ) ⊢ 1'(= a2◂ [ {| l |}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	call ETR_55

;; rsp=0 , %167~1'(= r ) %166~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .dlt.ptn 1'(= r )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_64:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_64
	ret
GRM_64:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_24
	jmp LB_25
LB_24:
	mov r8,unt_1
	jmp LB_22
LB_25:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_26
	jmp LB_27
LB_26:
	mov r8,unt_1
	jmp LB_22
LB_27:
	add r14,1
	jmp LB_23
LB_22:
	lea rsp,[rsp+8*0]
	jmp LB_21
LB_23:
	call GRM_64
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_30
	jmp LB_31
LB_30:
	jmp LB_28
LB_31:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_29
LB_28:
	lea rsp,[rsp+8*0]
	jmp LB_21
LB_29:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_33
LB_33
;; rsp=1 , %240~1'(= r ) %239~0'(= r ) %238~8'(= a5◂ [ ] ) 
	jmp LB_34
LB_34:
; $ %[ "\\n" ] ⊢ %[ "\\n" ]
;; rsp=1 , %241~%[ "\\n" ] %240~1'(= r ) %239~0'(= r ) %238~8'(= a5◂ [ ] ) 
; rsp_d=0, #37 { %[ "\\n" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\n" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\n" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],110
	mov r13,rax
	call ETR_37

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %242~2'(= a5◂ [ ] ) %240~1'(= r ) %239~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %243~0(<2)◂2'(= a5◂ [ ] ) %240~1'(= r ) %239~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_32
LB_32:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_21
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_21:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_38
	jmp LB_39
LB_38:
	mov r8,unt_1
	jmp LB_36
LB_39:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_40
	jmp LB_41
LB_40:
	mov r8,unt_1
	jmp LB_36
LB_41:
	add r14,1
	jmp LB_37
LB_36:
	lea rsp,[rsp+8*0]
	jmp LB_35
LB_37:
	call GRM_64
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_44
	jmp LB_45
LB_44:
	jmp LB_42
LB_45:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_43
LB_42:
	lea rsp,[rsp+8*0]
	jmp LB_35
LB_43:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_47
LB_47
;; rsp=1 , %246~1'(= r ) %245~0'(= r ) %244~8'(= a5◂ [ ] ) 
	jmp LB_48
LB_48:
; $ %[ "\\t" ] ⊢ %[ "\\t" ]
;; rsp=1 , %247~%[ "\\t" ] %246~1'(= r ) %245~0'(= r ) %244~8'(= a5◂ [ ] ) 
; rsp_d=0, #37 { %[ "\\t" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\t" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\t" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],116
	mov r13,rax
	call ETR_37

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %248~2'(= a5◂ [ ] ) %246~1'(= r ) %245~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %249~0(<2)◂2'(= a5◂ [ ] ) %246~1'(= r ) %245~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_46
LB_46:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_35
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_35:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_52
	jmp LB_53
LB_52:
	mov r8,unt_1
	jmp LB_50
LB_53:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_54
	jmp LB_55
LB_54:
	mov r8,unt_1
	jmp LB_50
LB_55:
	add r14,1
	jmp LB_51
LB_50:
	lea rsp,[rsp+8*0]
	jmp LB_49
LB_51:
	call GRM_64
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_58
	jmp LB_59
LB_58:
	jmp LB_56
LB_59:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_57
LB_56:
	lea rsp,[rsp+8*0]
	jmp LB_49
LB_57:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_61
LB_61
;; rsp=1 , %252~1'(= r ) %251~0'(= r ) %250~8'(= a5◂ [ ] ) 
	jmp LB_62
LB_62:
; $ %[ "\\\\" ] ⊢ %[ "\\\\" ]
;; rsp=1 , %253~%[ "\\\\" ] %252~1'(= r ) %251~0'(= r ) %250~8'(= a5◂ [ ] ) 
; rsp_d=0, #37 { %[ "\\\\" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\\\" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\\\" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],92
	mov r13,rax
	call ETR_37

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %254~2'(= a5◂ [ ] ) %252~1'(= r ) %251~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %255~0(<2)◂2'(= a5◂ [ ] ) %252~1'(= r ) %251~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_60
LB_60:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_49
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_49:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_66
	jmp LB_67
LB_66:
	mov r8,unt_1
	jmp LB_64
LB_67:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_68
	jmp LB_69
LB_68:
	mov r8,unt_1
	jmp LB_64
LB_69:
	add r14,1
	jmp LB_65
LB_64:
	lea rsp,[rsp+8*0]
	jmp LB_63
LB_65:
	call GRM_64
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_72
	jmp LB_73
LB_72:
	jmp LB_70
LB_73:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_71
LB_70:
	lea rsp,[rsp+8*0]
	jmp LB_63
LB_71:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_75
LB_75
;; rsp=1 , %258~1'(= r ) %257~0'(= r ) %256~8'(= a5◂ [ ] ) 
	jmp LB_76
LB_76:
; $ %[ "\\\"" ] ⊢ %[ "\\\"" ]
;; rsp=1 , %259~%[ "\\\"" ] %258~1'(= r ) %257~0'(= r ) %256~8'(= a5◂ [ ] ) 
; rsp_d=0, #37 { %[ "\\\"" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\\"" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\\"" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],34
	mov r13,rax
	call ETR_37

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %260~2'(= a5◂ [ ] ) %258~1'(= r ) %257~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %261~0(<2)◂2'(= a5◂ [ ] ) %258~1'(= r ) %257~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_74
LB_74:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_63
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_63:
	cmp r14,r9
	jge LB_80
	jmp LB_81
LB_80:
	mov r8,unt_1 
	jmp LB_78
LB_81:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_79
LB_78:
	lea rsp,[rsp+8*0]
	jmp LB_77
LB_79:
	call GRM_64
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_84
	jmp LB_85
LB_84:
	jmp LB_82
LB_85:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_83
LB_82:
	lea rsp,[rsp+8*1]
	jmp LB_77
LB_83:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_87
LB_87
;; rsp=2 , %265~1'(= r ) %264~0'(= r ) %263~9'(= a5◂ [ ] ) %262~8'(= r ) 
	mov rdi,0
	cmp QWORD [rsp-8+8*2],rdi
	jnz LB_88
;; rsp=2 , %265~1'(= r ) %264~0'(= r ) %263~9'(= a5◂ [ ] ) %262~8'(= r ) 
	jmp LB_89
LB_89:
; $ %[ "\\0" ] ⊢ %[ "\\0" ]
;; rsp=2 , %268~%[ "\\0" ] %265~1'(= r ) %264~0'(= r ) %263~9'(= a5◂ [ ] ) %262~8'(= r ) 
; rsp_d=0, #37 { %[ "\\0" ] 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\0" ] 9'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\0" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],48
	mov r13,rax
	call ETR_37

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=1 , %269~2'(= a5◂ [ ] ) %265~1'(= r ) %264~0'(= r ) %262~8'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=1 , %270~0(<2)◂2'(= a5◂ [ ] ) %265~1'(= r ) %264~0'(= r ) %262~8'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_86
LB_88:
;; rsp=1 , %265~1'(= r ) %264~0'(= r ) %263~9'(= a5◂ [ ] ) %262~8'(= r ) 
; rsp_d=0, #39 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*2]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %266~2'(= a5◂ [ ] ) %265~1'(= r ) %264~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %267~0(<2)◂2'(= a5◂ [ ] ) %265~1'(= r ) %264~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_86
LB_86:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_77
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_77:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_92
LB_92
;; rsp=0 , %272~1'(= r ) %271~0'(= r ) 
; #31 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %273~2(<4)◂{ } %272~1'(= r ) %271~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %274~0(<2)◂2(<4)◂{ } %272~1'(= r ) %271~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_91
LB_91:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_90
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_90:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_65: ; mk_esc_s8 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) } : (_s8→{ _s8 _s8 })
;; rsp=0 , %275~0'(= {| l |} ) 
	jmp LB_93
LB_93:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %276~%[ 0r ] %275~0'(= {| l |} ) 
; rsp_d=0, #64 { 0'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
; .mov_ptn2 { 0'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	call ETR_64

;; rsp=0 , %279~2'(= a3◂ [ a5◂ [ ]] ) %278~1'(= r ) %277~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 0(<2)◂3'(= a5◂ [ ] )
	mov rdi,r8
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_94
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=0 , %282~3'(= a5◂ [ ] ) %278~1'(= r ) %277~0'(= {| l |} ) 
; rsp_d=0, #42 3'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_42

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %284~2'(= {| l |} ) %283~3'(= a5◂ [ ] ) %278~1'(= r ) %277~0'(= {| l |} ) 
; ∎ { 0'(= {| l |} ) 2'(= {| l |} ) }
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= {| l |} ) 2'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_94:
;; rsp=0 , %279~2'(= a3◂ [ a5◂ [ ]] ) %278~1'(= r ) %277~0'(= {| l |} ) 
	jmp LB_95
LB_95:
; $ %[ "esc_stg_ltr" ] ⊢ %[ "esc_stg_ltr" ]
;; rsp=0 , %280~%[ "esc_stg_ltr" ] %279~2'(= a3◂ [ a5◂ [ ]] ) %278~1'(= r ) %277~0'(= {| l |} ) 
; _emt %[ "esc_stg_ltr" ] ⊢ %[ "esc_stg_ltr" ]
	jmp LB_97
LB_96: db 95,101,109,116,58,0
LB_97:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_96
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_99
LB_98: db 34,101,115,99,95,115,116,103,95,108,116,114,34,0
LB_99:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_98
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_101
LB_100: db 10,0
LB_101:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_100
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_102
LB_102:
;; rsp=0 , %281~%[ "esc_stg_ltr" ] %279~2'(= a3◂ [ a5◂ [ ]] ) %278~1'(= r ) %277~0'(= {| l |} ) 
; ∎| 
	jmp LB_104
LB_103: db 101,120,110,32,54,50,55,56,58,10,0
LB_104:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_103
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
ETR_66:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_66
	ret
GRM_66:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_108
	jmp LB_109
LB_108:
	mov r8,unt_1
	jmp LB_106
LB_109:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_110
	jmp LB_111
LB_110:
	mov r8,unt_1
	jmp LB_106
LB_111:
	add r14,1
	jmp LB_107
LB_106:
	lea rsp,[rsp+8*0]
	jmp LB_105
LB_107:
	call GRM_67
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_114
	jmp LB_115
LB_114:
	jmp LB_112
LB_115:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_113
LB_112:
	lea rsp,[rsp+8*0]
	jmp LB_105
LB_113:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_117
LB_117
;; rsp=1 , %287~1'(= r ) %286~0'(= r ) %285~8'(= a5◂ [ ] ) 
; rsp_d=0, #42 8'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_42

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %289~2'(= {| l |} ) %288~3'(= a5◂ [ ] ) %287~1'(= r ) %286~0'(= r ) 
; #22 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %290~0(<2)◂2'(= {| l |} ) %288~3'(= a5◂ [ ] ) %287~1'(= r ) %286~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_116
LB_116:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_105
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_105:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_67:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_67
	ret
GRM_67:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_121
	jmp LB_122
LB_121:
	mov r8,unt_1
	jmp LB_119
LB_122:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_123
	jmp LB_124
LB_123:
	mov r8,unt_1
	jmp LB_119
LB_124:
	add r14,1
	jmp LB_120
LB_119:
	lea rsp,[rsp+8*0]
	jmp LB_118
LB_120:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_126
LB_126
;; rsp=0 , %293~1'(= r ) %292~0'(= r ) %291~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %294~1(<2)◂{ } %293~1'(= r ) %292~0'(= r ) %291~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_125
LB_125:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_118
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_118:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_130
	jmp LB_131
LB_130:
	mov r8,unt_1
	jmp LB_128
LB_131:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_132
	jmp LB_133
LB_132:
	mov r8,unt_1
	jmp LB_128
LB_133:
	add r14,1
	jmp LB_129
LB_128:
	lea rsp,[rsp+8*0]
	jmp LB_127
LB_129:
	call GRM_68
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_136
	jmp LB_137
LB_136:
	jmp LB_134
LB_137:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_135
LB_134:
	lea rsp,[rsp+8*0]
	jmp LB_127
LB_135:
	call GRM_67
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_140
	jmp LB_141
LB_140:
	jmp LB_138
LB_141:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_139
LB_138:
	lea rsp,[rsp+8*1]
	jmp LB_127
LB_139:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_143
LB_143
;; rsp=2 , %298~1'(= r ) %297~0'(= r ) %296~9'(= a5◂ [ ] ) %295~8'(= r ) 
; rsp_d=0, #39 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %299~2'(= a5◂ [ ] ) %298~1'(= r ) %297~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %300~0(<2)◂2'(= a5◂ [ ] ) %298~1'(= r ) %297~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_142
LB_142:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_127
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_127:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_147
	jmp LB_148
LB_147:
	mov r8,unt_1
	jmp LB_145
LB_148:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_149
	jmp LB_150
LB_149:
	mov r8,unt_1
	jmp LB_145
LB_150:
	add r14,1
	jmp LB_146
LB_145:
	lea rsp,[rsp+8*0]
	jmp LB_144
LB_146:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_152
LB_152
;; rsp=0 , %302~1'(= r ) %301~0'(= r ) 
; #31 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %303~2(<4)◂{ } %302~1'(= r ) %301~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %304~0(<2)◂2(<4)◂{ } %302~1'(= r ) %301~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_151
LB_151:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_144
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_144:
	cmp r14,r9
	jge LB_156
	jmp LB_157
LB_156:
	mov r8,unt_1 
	jmp LB_154
LB_157:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_155
LB_154:
	lea rsp,[rsp+8*0]
	jmp LB_153
LB_155:
	call GRM_67
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_160
	jmp LB_161
LB_160:
	jmp LB_158
LB_161:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_159
LB_158:
	lea rsp,[rsp+8*1]
	jmp LB_153
LB_159:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_163
LB_163
;; rsp=2 , %308~1'(= r ) %307~0'(= r ) %306~9'(= a5◂ [ ] ) %305~8'(= r ) 
; rsp_d=0, #39 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %309~2'(= a5◂ [ ] ) %308~1'(= r ) %307~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %310~0(<2)◂2'(= a5◂ [ ] ) %308~1'(= r ) %307~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_162
LB_162:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_153
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_153:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_68:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_68
	ret
GRM_68:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_167
	jmp LB_168
LB_167:
	mov r8,unt_1
	jmp LB_165
LB_168:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_169
	jmp LB_170
LB_169:
	mov r8,unt_1
	jmp LB_165
LB_170:
	add r14,1
	jmp LB_166
LB_165:
	lea rsp,[rsp+8*0]
	jmp LB_164
LB_166:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_172
LB_172
;; rsp=0 , %312~1'(= r ) %311~0'(= r ) 
	jmp LB_173
LB_173:
; $ %[ 92r ] ⊢ %[ 92r ]
;; rsp=0 , %313~%[ 92r ] %312~1'(= r ) %311~0'(= r ) 
; #22 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %314~0(<2)◂%[ 92r ] %312~1'(= r ) %311~0'(= r ) 
; ∎ 0(<2)◂%[ 92r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,92
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_171
LB_171:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_164
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_164:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_177
	jmp LB_178
LB_177:
	mov r8,unt_1
	jmp LB_175
LB_178:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_179
	jmp LB_180
LB_179:
	mov r8,unt_1
	jmp LB_175
LB_180:
	add r14,1
	jmp LB_176
LB_175:
	lea rsp,[rsp+8*0]
	jmp LB_174
LB_176:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_182
LB_182
;; rsp=0 , %316~1'(= r ) %315~0'(= r ) 
	jmp LB_183
LB_183:
; $ %[ 34r ] ⊢ %[ 34r ]
;; rsp=0 , %317~%[ 34r ] %316~1'(= r ) %315~0'(= r ) 
; #22 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %318~0(<2)◂%[ 34r ] %316~1'(= r ) %315~0'(= r ) 
; ∎ 0(<2)◂%[ 34r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,34
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_181
LB_181:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_174
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_174:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_187
	jmp LB_188
LB_187:
	mov r8,unt_1
	jmp LB_185
LB_188:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_189
	jmp LB_190
LB_189:
	mov r8,unt_1
	jmp LB_185
LB_190:
	add r14,1
	jmp LB_186
LB_185:
	lea rsp,[rsp+8*0]
	jmp LB_184
LB_186:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_192
LB_192
;; rsp=0 , %320~1'(= r ) %319~0'(= r ) 
	jmp LB_193
LB_193:
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %321~%[ 10r ] %320~1'(= r ) %319~0'(= r ) 
; #22 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %322~0(<2)◂%[ 10r ] %320~1'(= r ) %319~0'(= r ) 
; ∎ 0(<2)◂%[ 10r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,10
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_191
LB_191:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_184
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_184:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_197
	jmp LB_198
LB_197:
	mov r8,unt_1
	jmp LB_195
LB_198:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_199
	jmp LB_200
LB_199:
	mov r8,unt_1
	jmp LB_195
LB_200:
	add r14,1
	jmp LB_196
LB_195:
	lea rsp,[rsp+8*0]
	jmp LB_194
LB_196:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_202
LB_202
;; rsp=0 , %324~1'(= r ) %323~0'(= r ) 
	jmp LB_203
LB_203:
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %325~%[ 9r ] %324~1'(= r ) %323~0'(= r ) 
; #22 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %326~0(<2)◂%[ 9r ] %324~1'(= r ) %323~0'(= r ) 
; ∎ 0(<2)◂%[ 9r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_201
LB_201:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_194
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_194:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_207
	jmp LB_208
LB_207:
	mov r8,unt_1
	jmp LB_205
LB_208:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_209
	jmp LB_210
LB_209:
	mov r8,unt_1
	jmp LB_205
LB_210:
	add r14,1
	jmp LB_206
LB_205:
	lea rsp,[rsp+8*0]
	jmp LB_204
LB_206:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_212
LB_212
;; rsp=0 , %328~1'(= r ) %327~0'(= r ) 
	jmp LB_213
LB_213:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %329~%[ 0r ] %328~1'(= r ) %327~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %330~0(<2)◂%[ 0r ] %328~1'(= r ) %327~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_211
LB_211:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_204
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_204:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_69:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_69
	ret
GRM_69:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_217
	jmp LB_218
LB_217:
	mov r8,unt_1 
	jmp LB_215
LB_218:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_216
LB_215:
	lea rsp,[rsp+8*0]
	jmp LB_214
LB_216:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_220
LB_220
;; rsp=1 , %333~1'(= r ) %332~0'(= r ) %331~8'(= r ) 
	mov rdi,48
	cmp QWORD [rsp-8+8*1],rdi
	jg LB_221
	mov rdi,57
	cmp QWORD [rsp-8+8*1],rdi
	jg LB_221
;; rsp=1 , %333~1'(= r ) %332~0'(= r ) %331~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %335~0(<2)◂8'(= r ) %333~1'(= r ) %332~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_219
LB_221:
;; rsp=1 , %333~1'(= r ) %332~0'(= r ) %331~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %334~1(<2)◂{ } %333~1'(= r ) %332~0'(= r ) %331~8'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_219
LB_219:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_214
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_214:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_70:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_70
	ret
GRM_70:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_225
	jmp LB_226
LB_225:
	mov r8,unt_1 
	jmp LB_223
LB_226:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_224
LB_223:
	lea rsp,[rsp+8*0]
	jmp LB_222
LB_224:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_228
LB_228
;; rsp=1 , %338~1'(= r ) %337~0'(= r ) %336~8'(= r ) 
	mov rdi,97
	cmp QWORD [rsp-8+8*1],rdi
	jg LB_229
	mov rdi,122
	cmp QWORD [rsp-8+8*1],rdi
	jg LB_229
;; rsp=1 , %338~1'(= r ) %337~0'(= r ) %336~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %340~0(<2)◂8'(= r ) %338~1'(= r ) %337~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_227
LB_229:
;; rsp=1 , %338~1'(= r ) %337~0'(= r ) %336~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %339~1(<2)◂{ } %338~1'(= r ) %337~0'(= r ) %336~8'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_227
LB_227:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_222
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_222:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_71:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_71
	ret
GRM_71:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_233
	jmp LB_234
LB_233:
	mov r8,unt_1 
	jmp LB_231
LB_234:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_232
LB_231:
	lea rsp,[rsp+8*0]
	jmp LB_230
LB_232:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_236
LB_236
;; rsp=1 , %343~1'(= r ) %342~0'(= r ) %341~8'(= r ) 
	mov rdi,65
	cmp QWORD [rsp-8+8*1],rdi
	jg LB_237
	mov rdi,90
	cmp QWORD [rsp-8+8*1],rdi
	jg LB_237
;; rsp=1 , %343~1'(= r ) %342~0'(= r ) %341~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %345~0(<2)◂8'(= r ) %343~1'(= r ) %342~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_235
LB_237:
;; rsp=1 , %343~1'(= r ) %342~0'(= r ) %341~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %344~1(<2)◂{ } %343~1'(= r ) %342~0'(= r ) %341~8'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_235
LB_235:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_230
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_230:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_72:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_72
	ret
GRM_72:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	call GRM_71
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_241
	jmp LB_242
LB_241:
	jmp LB_239
LB_242:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_240
LB_239:
	lea rsp,[rsp+8*0]
	jmp LB_238
LB_240:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_244
LB_244
;; rsp=1 , %348~1'(= r ) %347~0'(= r ) %346~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %349~0(<2)◂8'(= r ) %348~1'(= r ) %347~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_243
LB_243:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_238
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_238:
	call GRM_70
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_248
	jmp LB_249
LB_248:
	jmp LB_246
LB_249:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_247
LB_246:
	lea rsp,[rsp+8*0]
	jmp LB_245
LB_247:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_251
LB_251
;; rsp=1 , %352~1'(= r ) %351~0'(= r ) %350~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %353~0(<2)◂8'(= r ) %352~1'(= r ) %351~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_250
LB_250:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_245
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_245:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_73:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_73
	ret
GRM_73:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	call GRM_72
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_255
	jmp LB_256
LB_255:
	jmp LB_253
LB_256:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_254
LB_253:
	lea rsp,[rsp+8*0]
	jmp LB_252
LB_254:
	call GRM_74
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_259
	jmp LB_260
LB_259:
	jmp LB_257
LB_260:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_258
LB_257:
	lea rsp,[rsp+8*1]
	jmp LB_252
LB_258:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_262
LB_262
;; rsp=2 , %357~1'(= r ) %356~0'(= r ) %355~9'(= a5◂ [ ] ) %354~8'(= r ) 
; rsp_d=0, #39 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %358~2'(= a5◂ [ ] ) %357~1'(= r ) %356~0'(= r ) 
; rsp_d=0, #42 2'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_42

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %360~2'(= {| l |} ) %359~3'(= a5◂ [ ] ) %357~1'(= r ) %356~0'(= r ) 
; #22 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %361~0(<2)◂2'(= {| l |} ) %359~3'(= a5◂ [ ] ) %357~1'(= r ) %356~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_261
LB_261:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_252
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_252:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_74:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_74
	ret
GRM_74:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	call GRM_75
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_266
	jmp LB_267
LB_266:
	jmp LB_264
LB_267:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_265
LB_264:
	lea rsp,[rsp+8*0]
	jmp LB_263
LB_265:
	call GRM_74
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_270
	jmp LB_271
LB_270:
	jmp LB_268
LB_271:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_269
LB_268:
	lea rsp,[rsp+8*1]
	jmp LB_263
LB_269:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_273
LB_273
;; rsp=2 , %365~1'(= r ) %364~0'(= r ) %363~9'(= a5◂ [ ] ) %362~8'(= r ) 
; rsp_d=0, #39 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %366~2'(= a5◂ [ ] ) %365~1'(= r ) %364~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %367~0(<2)◂2'(= a5◂ [ ] ) %365~1'(= r ) %364~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_272
LB_272:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_263
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_263:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_276
LB_276
;; rsp=0 , %369~1'(= r ) %368~0'(= r ) 
; #31 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %370~2(<4)◂{ } %369~1'(= r ) %368~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %371~0(<2)◂2(<4)◂{ } %369~1'(= r ) %368~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_275
LB_275:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_274
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_274:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_75:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_75
	ret
GRM_75:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	call GRM_72
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_280
	jmp LB_281
LB_280:
	jmp LB_278
LB_281:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_279
LB_278:
	lea rsp,[rsp+8*0]
	jmp LB_277
LB_279:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_283
LB_283
;; rsp=1 , %374~1'(= r ) %373~0'(= r ) %372~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %375~0(<2)◂8'(= r ) %374~1'(= r ) %373~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_282
LB_282:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_277
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_277:
	call GRM_69
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_287
	jmp LB_288
LB_287:
	jmp LB_285
LB_288:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_286
LB_285:
	lea rsp,[rsp+8*0]
	jmp LB_284
LB_286:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_290
LB_290
;; rsp=1 , %378~1'(= r ) %377~0'(= r ) %376~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %379~0(<2)◂8'(= r ) %378~1'(= r ) %377~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_289
LB_289:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_284
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_284:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_294
	jmp LB_295
LB_294:
	mov r8,unt_1
	jmp LB_292
LB_295:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_296
	jmp LB_297
LB_296:
	mov r8,unt_1
	jmp LB_292
LB_297:
	add r14,1
	jmp LB_293
LB_292:
	lea rsp,[rsp+8*0]
	jmp LB_291
LB_293:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_299
LB_299
;; rsp=0 , %381~1'(= r ) %380~0'(= r ) 
	jmp LB_300
LB_300:
; $ %[ 95r ] ⊢ %[ 95r ]
;; rsp=0 , %382~%[ 95r ] %381~1'(= r ) %380~0'(= r ) 
; #22 %[ 95r ] ⊢ 0(<2)◂%[ 95r ]
;; rsp=0 , %383~0(<2)◂%[ 95r ] %381~1'(= r ) %380~0'(= r ) 
; ∎ 0(<2)◂%[ 95r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 95r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 95r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,95
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_298
LB_298:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_291
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_291:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_76:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_76
	ret
GRM_76:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_304
	jmp LB_305
LB_304:
	mov r8,unt_1
	jmp LB_302
LB_305:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_306
	jmp LB_307
LB_306:
	mov r8,unt_1
	jmp LB_302
LB_307:
	add r14,1
	jmp LB_303
LB_302:
	lea rsp,[rsp+8*0]
	jmp LB_301
LB_303:
	call GRM_74
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_310
	jmp LB_311
LB_310:
	jmp LB_308
LB_311:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_309
LB_308:
	lea rsp,[rsp+8*0]
	jmp LB_301
LB_309:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_313
LB_313
;; rsp=1 , %386~1'(= r ) %385~0'(= r ) %384~8'(= a5◂ [ ] ) 
; rsp_d=0, #42 8'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_42

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %388~2'(= {| l |} ) %387~3'(= a5◂ [ ] ) %386~1'(= r ) %385~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_314
	LB_315: db 95,0
LB_314:
	lea rsi,[LB_315+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %390~4'(= {| l |} ) %389~2'(= {| l |} ) %387~3'(= a5◂ [ ] ) %386~1'(= r ) %385~0'(= r ) 
; #22 4'(= {| l |} ) ⊢ 0(<2)◂4'(= {| l |} )
;; rsp=0 , %391~0(<2)◂4'(= {| l |} ) %389~2'(= {| l |} ) %387~3'(= a5◂ [ ] ) %386~1'(= r ) %385~0'(= r ) 
; ∎ 0(<2)◂4'(= {| l |} )
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂4'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; .mov_ptn 0(<2)◂4'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r10
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_312
LB_312:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_301
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_301:
	call GRM_73
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_319
	jmp LB_320
LB_319:
	jmp LB_317
LB_320:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_318
LB_317:
	lea rsp,[rsp+8*0]
	jmp LB_316
LB_318:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_322
LB_322
;; rsp=1 , %394~1'(= r ) %393~0'(= r ) %392~8'(= {| l |} ) 
; #22 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %395~0(<2)◂8'(= {| l |} ) %394~1'(= r ) %393~0'(= r ) 
; ∎ 0(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; .mov_ptn 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_321
LB_321:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_316
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_316:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_81: ; pnt_name 0'(= a9◂ [ ] ) ⊢ 0'(= {| l |} ) : (_t9→_s8)
;; rsp=0 , %396~0'(= a9◂ [ ] ) 
;; ? 0'(= a9◂ [ ] ) ⊢ 0(<2)◂{ 1'(= {| l |} ) 2'(= a9◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_323
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %399~2'(= a9◂ [ ] ) %398~1'(= {| l |} ) 
; rsp_d=0, #81 2'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_81

	mov r14,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %400~0'(= {| l |} ) %398~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_324
	LB_325: db 46,0
LB_324:
	lea rsi,[LB_325+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %403~2'(= {| l |} ) %402~0'(= {| l |} ) %401~1'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_323:
;; ? 0'(= a9◂ [ ] ) ⊢ 1(<2)◂0'(= {| l |} )
;; rsp=0 , %397~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_86: ; pnt_cst_v 0'(= a10◂ [ ] ) ⊢ 0'(= {| l |} ) : (_t10→_s8)
;; rsp=0 , %404~0'(= a10◂ [ ] ) 
;; ? 0'(= a10◂ [ ] ) ⊢ 0(<2)◂1'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_326
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %406~1'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	sub rsp,128
	mov rdi,rsp
	mov rsi,fmt_d
	mov rdx,r14
	mov QWORD [tmp],rdi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call sprintf
	mov rsp,QWORD [rsp_tmp]  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	push rax 
	add rax,QWORD [tmp]
	mov rdi,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	jmp LB_327
	LB_328: db 114,0
LB_327:
	lea rsi,[LB_328+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %412~0'(= {| l |} ) %411~1'(= r ) 
; ∎ 0'(= {| l |} )
; .dlt.ptn 1'(= r )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_326:
;; ? 0'(= a10◂ [ ] ) ⊢ 1(<2)◂0'(= {| l |} )
;; rsp=0 , %405~0'(= {| l |} ) 
; rsp_d=0, #65 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	call ETR_65

;; rsp=0 , %408~1'(= {| l |} ) %407~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,2
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_329
	LB_330: db 34,0
LB_329:
	lea rsi,[LB_330+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_331
	LB_332: db 34,0
LB_331:
	lea rsi,[LB_332+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %410~2'(= {| l |} ) %409~1'(= {| l |} ) %407~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
ETR_87: ; pnt_cst 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= {| l |} ) : (_t11◂_t9→_s8)
;; rsp=0 , %413~0'(= a11◂ [ a9◂ [ ]] ) 
;; ? 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂1'(= a10◂ [ ] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_333
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %415~1'(= a10◂ [ ] ) 
; rsp_d=0 , #86 1'(= a10◂ [ ] ) ⊢| 
; .mov_ptn2 1'(= a10◂ [ ] ) ⊢ 0'(= a10◂ [ ] )
; .mov_ptn 1'(= a10◂ [ ] ) ⊢ 0'(= a10◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_86
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_333:
;; ? 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<2)◂0'(= a9◂ [ ] )
;; rsp=0 , %414~0'(= a9◂ [ ] ) 
; rsp_d=0, #81 0'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 0'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	call ETR_81

;; rsp=0 , %416~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_96: ; pnt_src_ptn 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} ) : (_t8◂_t12◂_s8◂_t9→_s8)
;; rsp=0 , %417~0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_334
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %424~1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
; rsp_d=0, #97 1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r14
	mov r13,rax
	call ETR_97

;; rsp=0 , %425~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_335
	LB_336: db 123,32,0
LB_335:
	lea rsi,[LB_336+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_337
	LB_338: db 125,0
LB_337:
	lea rsi,[LB_338+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %427~1'(= {| l |} ) %426~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_334:
;; ? 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %418~0'(= a12◂ [ a9◂ [ ]{| l |}] ) 
;; ? 0'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂1'(= a11◂ [ a9◂ [ ]] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_339
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %420~1'(= a11◂ [ a9◂ [ ]] ) 
; rsp_d=0, #87 1'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 1'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	mov rax,r14
	mov r13,rax
	call ETR_87

;; rsp=0 , %421~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,6
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_340
	LB_341: db 37,91,32,0
LB_340:
	lea rsi,[LB_341+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_342
	LB_343: db 32,93,32,0
LB_342:
	lea rsi,[LB_343+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %423~1'(= {| l |} ) %422~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_339:
;; ? 0'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂0'(= {| l |} )
;; rsp=0 , %419~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_97: ; pnt_src_ptn_lst 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t8◂_t12◂_s8◂_t9→_s8)
;; rsp=0 , %428~0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
;; ? 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂{ 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_344
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %431~2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %430~1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #96 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_96

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %432~0'(= {| l |} ) %431~2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
; rsp_d=0, #97 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_97

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %433~1'(= {| l |} ) %432~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_345
	LB_346: db 32,0
LB_345:
	lea rsi,[LB_346+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %436~2'(= {| l |} ) %435~1'(= {| l |} ) %434~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_344:
;; ? 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_347
LB_347:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %429~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	ret
ETR_98: ; pnt_dst_ptn 0'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= {| l |} ) : (_t8◂_t13◂_s8→_s8)
;; rsp=0 , %437~0'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 0'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0(<2)◂1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_348
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %442~1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
; rsp_d=0, #99 1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r14
	mov r13,rax
	call ETR_99

;; rsp=0 , %443~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_349
	LB_350: db 123,32,0
LB_349:
	lea rsi,[LB_350+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_351
	LB_352: db 125,0
LB_351:
	lea rsi,[LB_352+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %445~1'(= {| l |} ) %444~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_348:
;; ? 0'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1(<2)◂0'(= a13◂ [ {| l |}] )
;; rsp=0 , %438~0'(= a13◂ [ {| l |}] ) 
;; ? 0'(= a13◂ [ {| l |}] ) ⊢ 0(<2)◂1'(= a3◂ [ {| l |}] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_353
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %440~1'(= a3◂ [ {| l |}] ) 
	jmp LB_354
LB_354:
; $ %[ "_ " ] ⊢ %[ "_ " ]
;; rsp=0 , %441~%[ "_ " ] %440~1'(= a3◂ [ {| l |}] ) 
; ∎ %[ "_ " ]
; .dlt.ptn 1'(= a3◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 %[ "_ " ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "_ " ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],32
	mov r13,rax
	ret
LB_353:
;; ? 0'(= a13◂ [ {| l |}] ) ⊢ 1(<2)◂0'(= {| l |} )
;; rsp=0 , %439~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_99: ; pnt_dst_ptn_lst 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t8◂_t13◂_s8→_s8)
;; rsp=0 , %446~0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
;; ? 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂{ 1'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_355
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %449~2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %448~1'(= a8◂ [ a13◂ [ {| l |}]] ) 
; rsp_d=0, #98 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_98

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %450~0'(= {| l |} ) %449~2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
; rsp_d=0, #99 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_99

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %451~1'(= {| l |} ) %450~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_356
	LB_357: db 32,0
LB_356:
	lea rsi,[LB_357+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %454~2'(= {| l |} ) %453~1'(= {| l |} ) %452~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_355:
;; ? 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_358
LB_358:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %447~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	ret
ETR_100: ; pnt_mtc_ptn 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} ) : (_t8◂_t14◂_s8◂_t9→_s8)
;; rsp=0 , %455~0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_359
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %457~1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
	jmp LB_360
LB_361:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_364+8*rsi]
LB_364: dq LB_362,LB_363
LB_362:
	mov rsi,[SS_RCD_2_TOP]
	mov rax,[rsi] 
	mov QWORD [SS_RCD_2_TOP],rax
	mov QWORD [rsi],0
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	call LB_366
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	call LB_361
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_365
LB_363:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_365
LB_365:
	ret
LB_366:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_369+8*rsi]
LB_369: dq LB_367,LB_368
LB_367:
	mov rdi,QWORD [rdi+8]
	call LB_361
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],0
	mov rax,rsi
	jmp LB_370
LB_368:
	mov rdi,QWORD [rdi+8]
	call LB_371
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],1
	mov rax,rsi
	jmp LB_370
LB_370:
	ret
LB_371:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_376+8*rsi]
LB_376: dq LB_372,LB_373,LB_374,LB_375
LB_372:
	mov rsi,[SS_RCD_2_TOP]
	mov rax,[rsi] 
	mov QWORD [SS_RCD_2_TOP],rax
	mov QWORD [rsi],0
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	call LB_378
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	call LB_366
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_377
LB_373:
	mov rdi,QWORD [rdi+8]
	call LB_379
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],1
	mov rax,rsi
	jmp LB_377
LB_374:
	mov rdi,QWORD [rdi+8]
	call LB_380
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],2
	mov rax,rsi
	jmp LB_377
LB_375:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+6],3
	jmp LB_377
LB_377:
	ret
LB_380:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_383+8*rsi]
LB_383: dq LB_381,LB_382
LB_381:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+6],0
	jmp LB_384
LB_382:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_384
LB_384:
	ret
LB_379:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_387+8*rsi]
LB_387: dq LB_385,LB_386
LB_385:
	mov rdi,QWORD [rdi+8]
	call LB_389
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],0
	mov rax,rsi
	jmp LB_388
LB_386:
	mov rdi,QWORD [rdi+8]
	call LB_378
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],1
	mov rax,rsi
	jmp LB_388
LB_388:
	ret
LB_389:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_392+8*rsi]
LB_392: dq LB_390,LB_391
LB_390:
	mov rdi,QWORD [rdi+8]
	mov rax,rdi
	mov rsi,[SS_LN_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_LN_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],0
	mov rax,rsi
	jmp LB_393
LB_391:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+6],1
	jmp LB_393
LB_393:
	ret
LB_378:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_396+8*rsi]
LB_396: dq LB_394,LB_395
LB_394:
	mov rsi,[SS_RCD_2_TOP]
	mov rax,[rsi] 
	mov QWORD [SS_RCD_2_TOP],rax
	mov QWORD [rsi],0
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	call LB_378
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_397
LB_395:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+6],1
	jmp LB_397
LB_397:
	ret
LB_360:
; $ 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ),0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rdi,r14
	call LB_361
	mov r13,rax
;; rsp=0 , %475~0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %474~1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; #78 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=0 , %476~0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %474~1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; rsp_d=0, #101 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r14
	mov r13,rax
	call ETR_101

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %477~1'(= {| l |} ) %476~0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_398
	LB_399: db 123,32,0
LB_398:
	lea rsi,[LB_399+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_400
	LB_401: db 125,0
LB_400:
	lea rsi,[LB_401+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %479~2'(= {| l |} ) %478~1'(= {| l |} ) %476~0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_359:
;; ? 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a14◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %456~0'(= a14◂ [ a9◂ [ ]{| l |}] ) 
;; ? 0'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<4)◂1'(= a11◂ [ a9◂ [ ]] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_402
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %462~1'(= a11◂ [ a9◂ [ ]] ) 
; rsp_d=0, #87 1'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 1'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	mov rax,r14
	mov r13,rax
	call ETR_87

;; rsp=0 , %471~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,6
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_403
	LB_404: db 37,91,32,0
LB_403:
	lea rsi,[LB_404+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_405
	LB_406: db 32,93,32,0
LB_405:
	lea rsi,[LB_406+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %473~1'(= {| l |} ) %472~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_402:
;; ? 0'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<4)◂{ 1'(= a9◂ [ ] ) 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_407
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %461~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %460~1'(= a9◂ [ ] ) 
; rsp_d=0, #100 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_100

	mov r14,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %466~0'(= {| l |} ) %460~1'(= a9◂ [ ] ) 
; rsp_d=0, #81 1'(= a9◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_81

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %467~1'(= {| l |} ) %466~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_408
	LB_409: db 226,151,130,0
LB_408:
	lea rsi,[LB_409+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %470~2'(= {| l |} ) %469~0'(= {| l |} ) %468~1'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_407:
;; ? 0'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 3(<4)◂0'(= {| l |} )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_410
;; rsp=0 , %459~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_411
	LB_412: db 37,0
LB_411:
	lea rsi,[LB_412+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %465~1'(= {| l |} ) %464~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_410:
;; ? 0'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<4)◂0'(= a3◂ [ {| l |}] )
;; rsp=0 , %458~0'(= a3◂ [ {| l |}] ) 
	jmp LB_413
LB_413:
; $ %[ "_" ] ⊢ %[ "_" ]
;; rsp=0 , %463~%[ "_" ] %458~0'(= a3◂ [ {| l |}] ) 
; ∎ %[ "_" ]
; .dlt.ptn 0'(= a3◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 %[ "_" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "_" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,1
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],95
	mov r13,rax
	ret
ETR_101: ; pnt_mtc_ptn_lst 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t8◂_t14◂_s8◂_t9→_s8)
;; rsp=0 , %480~0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
;; ? 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂{ 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_414
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %482~2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %481~1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #100 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_100

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %484~0'(= {| l |} ) %482~2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; rsp_d=0, #101 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_101

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %485~1'(= {| l |} ) %484~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_415
	LB_416: db 32,0
LB_415:
	lea rsi,[LB_416+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %488~2'(= {| l |} ) %487~1'(= {| l |} ) %486~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_414:
;; ? 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_417
LB_417:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %483~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	ret
ETR_131: ; pnt_lc_code { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t17◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %490~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %489~0'(= r ) 
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<7)◂{ 2'(= a9◂ [ ] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_418
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %501~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %500~2'(= a9◂ [ ] ) %489~0'(= r ) 
; rsp_d=0, #81 2'(= a9◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_81

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %540~1'(= {| l |} ) %501~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %489~0'(= r ) 
; rsp_d=0, #96 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_96

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %541~2'(= {| l |} ) %540~1'(= {| l |} ) %489~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,7
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_419
	LB_420: db 9,0
LB_419:
	pop rax 
LB_421:
	lea rsi,[LB_420+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_421
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_422
	LB_423: db 32,0
LB_422:
	lea rsi,[LB_423+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_424
	LB_425: db 32,226,138,162,124,10,0
LB_424:
	lea rsi,[LB_425+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %545~3'(= {| l |} ) %544~2'(= {| l |} ) %543~1'(= {| l |} ) %542~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_418:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<7)◂{ 2'(= a12◂ [ a9◂ [ ]{| l |}] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_426
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %499~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %498~2'(= a12◂ [ a9◂ [ ]{| l |}] ) %489~0'(= r ) 
; #77 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %533~1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) %499~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %489~0'(= r ) 
; rsp_d=0, #96 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	call ETR_96

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %534~1'(= {| l |} ) %499~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %489~0'(= r ) 
; rsp_d=0, #96 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_96

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %535~2'(= {| l |} ) %534~1'(= {| l |} ) %489~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_427
	LB_428: db 9,0
LB_427:
	pop rax 
LB_429:
	lea rsi,[LB_428+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_429
	jmp LB_430
	LB_431: db 226,151,130,0
LB_430:
	lea rsi,[LB_431+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_432
	LB_433: db 44,0
LB_432:
	lea rsi,[LB_433+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_434
	LB_435: db 32,226,138,162,124,10,0
LB_434:
	lea rsi,[LB_435+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %539~3'(= {| l |} ) %538~2'(= {| l |} ) %537~1'(= {| l |} ) %536~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_426:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<7)◂{ 2'(= a19◂ [ a9◂ [ ]{| l |}] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_436
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %497~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %496~2'(= a19◂ [ a9◂ [ ]{| l |}] ) %489~0'(= r ) 
; rsp_d=0, #132 { 0'(= r ) 2'(= a19◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r9
; .mov_ptn2 { 0'(= r ) 2'(= a19◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a19◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a19◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_132

	mov r9,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %527~1'(= {| l |} ) %526~0'(= r ) %497~3'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; rsp_d=0, #131 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 3'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r9
	mov r14,rax
	call ETR_131

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %529~2'(= {| l |} ) %528~0'(= r ) %527~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,0
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %532~3'(= {| l |} ) %531~2'(= {| l |} ) %530~1'(= {| l |} ) %528~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_436:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_437
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %495~2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %489~0'(= r ) 
; rsp_d=0, #133 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_133

;; rsp=0 , %525~1'(= {| l |} ) %524~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_437:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,4
	jnz LB_438
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %494~3'(= a18◂ [ a9◂ [ ]{| l |}] ) %493~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %489~0'(= r ) 
; rsp_d=0, #96 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_96

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %506~1'(= {| l |} ) %494~3'(= a18◂ [ a9◂ [ ]{| l |}] ) %489~0'(= r ) 
;; ? 3'(= a18◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_439
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
;; rsp=0 , %509~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %508~2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %506~1'(= {| l |} ) %489~0'(= r ) 
; rsp_d=0, #99 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_99

	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %516~2'(= {| l |} ) %509~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %506~1'(= {| l |} ) %489~0'(= r ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %518~3'(= {| l |} ) %517~0'(= r ) %516~2'(= {| l |} ) %506~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,8
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_440
	LB_441: db 9,0
LB_440:
	pop rax 
LB_442:
	lea rsi,[LB_441+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_442
	jmp LB_443
	LB_444: db 36,32,0
LB_443:
	lea rsi,[LB_444+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_445
	LB_446: db 32,226,138,162,32,0
LB_445:
	lea rsi,[LB_446+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_447
	LB_448: db 10,0
LB_447:
	lea rsi,[LB_448+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %523~4'(= {| l |} ) %522~3'(= {| l |} ) %521~2'(= {| l |} ) %520~1'(= {| l |} ) %519~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_439:
;; ? 3'(= a18◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂3'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=0 , %507~3'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %506~1'(= {| l |} ) %489~0'(= r ) 
; rsp_d=0, #134 { 0'(= r ) 3'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= r ) 3'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 3'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r9
	mov r14,rax
	call ETR_134

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %511~2'(= {| l |} ) %510~0'(= r ) %506~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,7
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_449
	LB_450: db 9,0
LB_449:
	pop rax 
LB_451:
	lea rsi,[LB_450+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_451
	jmp LB_452
	LB_453: db 36,32,0
LB_452:
	lea rsi,[LB_453+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_454
	LB_455: db 32,226,138,162,10,0
LB_454:
	lea rsi,[LB_455+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %515~3'(= {| l |} ) %514~2'(= {| l |} ) %513~1'(= {| l |} ) %512~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_438:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 5(<7)◂2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,5
	jnz LB_456
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %492~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %489~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,7
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_457
	LB_458: db 9,0
LB_457:
	pop rax 
LB_459:
	lea rsi,[LB_458+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_459
	jmp LB_460
	LB_461: db 226,136,142,32,46,46,10,0
LB_460:
	lea rsi,[LB_461+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %505~1'(= {| l |} ) %504~0'(= r ) %492~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .dlt.ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_456:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 6(<7)◂1'(= r )
;; rsp=0 , %491~1'(= r ) %489~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,5
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_462
	LB_463: db 9,0
LB_462:
	pop rax 
LB_464:
	lea rsi,[LB_463+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_464
	jmp LB_465
	LB_466: db 226,136,142,124,10,0
LB_465:
	lea rsi,[LB_466+5-1]
	mov rcx,5
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %503~2'(= {| l |} ) %502~0'(= r ) %491~1'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
ETR_132: ; pnt_lc_line { 0'(= r ) 1'(= a19◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t19◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %547~1'(= a19◂ [ a9◂ [ ]{| l |}] ) %546~0'(= r ) 
;; ? 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<4)◂{ 2'(= a9◂ [ ] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_467
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
;; rsp=0 , %578~4'(= a8◂ [ a13◂ [ {| l |}]] ) %577~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %576~2'(= a9◂ [ ] ) %546~0'(= r ) 
; rsp_d=0, #96 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_96

	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %579~1'(= {| l |} ) %578~4'(= a8◂ [ a13◂ [ {| l |}]] ) %576~2'(= a9◂ [ ] ) %546~0'(= r ) 
; rsp_d=0, #98 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 3'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_98

	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %580~3'(= {| l |} ) %579~1'(= {| l |} ) %576~2'(= a9◂ [ ] ) %546~0'(= r ) 
; rsp_d=0, #81 2'(= a9◂ [ ] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_81

	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %581~2'(= {| l |} ) %580~3'(= {| l |} ) %579~1'(= {| l |} ) %546~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,7
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_468
	LB_469: db 9,0
LB_468:
	pop rax 
LB_470:
	lea rsi,[LB_469+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_470
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_471
	LB_472: db 32,0
LB_471:
	lea rsi,[LB_472+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_473
	LB_474: db 32,226,138,162,32,0
LB_473:
	lea rsi,[LB_474+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_475
	LB_476: db 10,0
LB_475:
	lea rsi,[LB_476+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %586~4'(= {| l |} ) %585~3'(= {| l |} ) %584~1'(= {| l |} ) %583~2'(= {| l |} ) %582~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_467:
;; ? 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<4)◂{ 2'(= a12◂ [ a9◂ [ ]{| l |}] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_477
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
;; rsp=0 , %566~4'(= a8◂ [ a13◂ [ {| l |}]] ) %565~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %564~2'(= a12◂ [ a9◂ [ ]{| l |}] ) %546~0'(= r ) 
; #77 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %567~1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) %566~4'(= a8◂ [ a13◂ [ {| l |}]] ) %565~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %546~0'(= r ) 
; rsp_d=0, #96 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	call ETR_96

	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %568~1'(= {| l |} ) %566~4'(= a8◂ [ a13◂ [ {| l |}]] ) %565~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %546~0'(= r ) 
; rsp_d=0, #96 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_96

	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %569~2'(= {| l |} ) %568~1'(= {| l |} ) %566~4'(= a8◂ [ a13◂ [ {| l |}]] ) %546~0'(= r ) 
; rsp_d=0, #98 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 3'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_98

	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %570~3'(= {| l |} ) %569~2'(= {| l |} ) %568~1'(= {| l |} ) %546~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,11
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_478
	LB_479: db 9,0
LB_478:
	pop rax 
LB_480:
	lea rsi,[LB_479+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_480
	jmp LB_481
	LB_482: db 226,151,130,32,0
LB_481:
	lea rsi,[LB_482+4-1]
	mov rcx,4
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_483
	LB_484: db 44,0
LB_483:
	lea rsi,[LB_484+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_485
	LB_486: db 32,226,138,162,32,0
LB_485:
	lea rsi,[LB_486+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_487
	LB_488: db 10,0
LB_487:
	lea rsi,[LB_488+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %575~4'(= {| l |} ) %574~3'(= {| l |} ) %573~2'(= {| l |} ) %572~1'(= {| l |} ) %571~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_477:
;; ? 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 2'(= a11◂ [ a9◂ [ ]] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_489
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
;; rsp=0 , %555~4'(= a8◂ [ a13◂ [ {| l |}]] ) %554~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %553~2'(= a11◂ [ a9◂ [ ]] ) %546~0'(= r ) 
; rsp_d=0, #96 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_96

	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %556~1'(= {| l |} ) %555~4'(= a8◂ [ a13◂ [ {| l |}]] ) %553~2'(= a11◂ [ a9◂ [ ]] ) %546~0'(= r ) 
; rsp_d=0, #98 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 3'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_98

	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %557~3'(= {| l |} ) %556~1'(= {| l |} ) %553~2'(= a11◂ [ a9◂ [ ]] ) %546~0'(= r ) 
; rsp_d=0, #87 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov r13,rax
	call ETR_87

	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %558~2'(= {| l |} ) %557~3'(= {| l |} ) %556~1'(= {| l |} ) %546~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_490
	LB_491: db 9,0
LB_490:
	pop rax 
LB_492:
	lea rsi,[LB_491+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_492
	jmp LB_493
	LB_494: db 194,187,32,0
LB_493:
	lea rsi,[LB_494+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_495
	LB_496: db 32,0
LB_495:
	lea rsi,[LB_496+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_497
	LB_498: db 32,226,138,162,32,0
LB_497:
	lea rsi,[LB_498+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_499
	LB_500: db 10,0
LB_499:
	lea rsi,[LB_500+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %563~4'(= {| l |} ) %562~3'(= {| l |} ) %561~1'(= {| l |} ) %560~2'(= {| l |} ) %559~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_489:
;; ? 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
;; rsp=0 , %550~4'(= a2◂ [ a13◂ [ {| l |}]] ) %549~3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %548~2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %546~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,23
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_501
	LB_502: db 9,0
LB_501:
	pop rax 
LB_503:
	lea rsi,[LB_502+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_503
	jmp LB_504
	LB_505: db 194,187,32,95,94,32,46,46,0
LB_504:
	lea rsi,[LB_505+8-1]
	mov rcx,8
	rep movsb
	jmp LB_506
	LB_507: db 32,226,138,162,32,46,46,0
LB_506:
	lea rsi,[LB_507+7-1]
	mov rcx,7
	rep movsb
	jmp LB_508
	LB_509: db 10,0
LB_508:
	lea rsi,[LB_509+1-1]
	mov rcx,1
	rep movsb
	jmp LB_510
	LB_511: db 32,46,46,32,47,47,10,0
LB_510:
	lea rsi,[LB_511+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %552~1'(= {| l |} ) %551~0'(= r ) %550~4'(= a2◂ [ a13◂ [ {| l |}]] ) %549~3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %548~2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .dlt.ptn 4'(= a2◂ [ a13◂ [ {| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_133: ; pnt_lc_mtc { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t7◂{ _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %588~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %587~0'(= r ) 
;; ? 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 4'(= a20◂ [ a9◂ [ ]{| l |}] ) } 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_512
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %616~5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %615~4'(= a20◂ [ a9◂ [ ]{| l |}] ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %587~0'(= r ) 
; rsp_d=0, #133 { 0'(= r ) 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 0'(= r ) 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_133

	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %618~1'(= {| l |} ) %617~0'(= r ) %615~4'(= a20◂ [ a9◂ [ ]{| l |}] ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r10
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_513
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %622~2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %618~1'(= {| l |} ) %617~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #133 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_133

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %640~2'(= {| l |} ) %639~0'(= r ) %618~1'(= {| l |} ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_514
	LB_515: db 9,0
LB_514:
	pop rax 
LB_516:
	lea rsi,[LB_515+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_516
	jmp LB_517
	LB_518: db 226,136,144,32,46,46,32,59,10,0
LB_517:
	lea rsi,[LB_518+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %644~4'(= {| l |} ) %643~2'(= {| l |} ) %642~1'(= {| l |} ) %641~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_513:
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r10
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_519
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %621~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %620~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %618~1'(= {| l |} ) %617~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #96 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_96

	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %631~2'(= {| l |} ) %621~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %618~1'(= {| l |} ) %617~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #134 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_134

	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r14
	mov r14,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %633~4'(= {| l |} ) %632~0'(= r ) %631~2'(= {| l |} ) %618~1'(= {| l |} ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,14
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_520
	LB_521: db 9,0
LB_520:
	pop rax 
LB_522:
	lea rsi,[LB_521+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_522
	jmp LB_523
	LB_524: db 226,136,144,32,46,46,32,59,32,0
LB_523:
	lea rsi,[LB_524+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_525
	LB_526: db 226,138,162,32,10,0
LB_525:
	lea rsi,[LB_526+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %638~5'(= {| l |} ) %637~4'(= {| l |} ) %636~1'(= {| l |} ) %635~2'(= {| l |} ) %634~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_519:
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %619~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %618~1'(= {| l |} ) %617~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %623~0'(= r ) %619~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %618~1'(= {| l |} ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %625~2'(= {| l |} ) %624~0'(= r ) %618~1'(= {| l |} ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %626~0'(= r ) %625~2'(= {| l |} ) %618~1'(= {| l |} ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_527
	LB_528: db 9,0
LB_527:
	pop rax 
LB_529:
	lea rsi,[LB_528+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_529
	jmp LB_530
	LB_531: db 226,136,144,32,46,46,32,46,10,0
LB_530:
	lea rsi,[LB_531+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %630~4'(= {| l |} ) %629~2'(= {| l |} ) %628~1'(= {| l |} ) %627~0'(= r ) %614~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_512:
;; ? 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 3'(= a20◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %590~3'(= a20◂ [ a9◂ [ ]{| l |}] ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %587~0'(= r ) 
;; ? 3'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_532
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %608~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %587~0'(= r ) 
; rsp_d=0, #133 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	call ETR_133

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %610~1'(= {| l |} ) %609~0'(= r ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_533
	LB_534: db 9,0
LB_533:
	pop rax 
LB_535:
	lea rsi,[LB_534+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_535
	jmp LB_536
	LB_537: db 226,136,144,46,32,46,46,32,46,10,0
LB_536:
	lea rsi,[LB_537+10-1]
	mov rcx,10
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %613~3'(= {| l |} ) %612~1'(= {| l |} ) %611~0'(= r ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_532:
;; ? 3'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_538
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
;; rsp=0 , %600~4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %599~1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %587~0'(= r ) 
; rsp_d=0, #96 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_96

	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %601~1'(= {| l |} ) %600~4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %587~0'(= r ) 
; rsp_d=0, #134 { 0'(= r ) 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r10
	mov r14,rax
	call ETR_134

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %603~3'(= {| l |} ) %602~0'(= r ) %601~1'(= {| l |} ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,14
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_539
	LB_540: db 9,0
LB_539:
	pop rax 
LB_541:
	lea rsi,[LB_540+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_541
	jmp LB_542
	LB_543: db 226,136,144,32,46,46,32,59,32,0
LB_542:
	lea rsi,[LB_543+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_544
	LB_545: db 226,138,162,32,10,0
LB_544:
	lea rsi,[LB_545+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %607~4'(= {| l |} ) %606~3'(= {| l |} ) %605~1'(= {| l |} ) %604~0'(= r ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_538:
;; ? 3'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %591~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %587~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %592~0'(= r ) %591~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #131 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 3'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r9
	mov r14,rax
	call ETR_131

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %594~1'(= {| l |} ) %593~0'(= r ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %595~0'(= r ) %594~1'(= {| l |} ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_546
	LB_547: db 9,0
LB_546:
	pop rax 
LB_548:
	lea rsi,[LB_547+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_548
	jmp LB_549
	LB_550: db 226,136,144,46,32,46,46,32,46,10,0
LB_549:
	lea rsi,[LB_550+10-1]
	mov rcx,10
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %598~3'(= {| l |} ) %597~1'(= {| l |} ) %596~0'(= r ) %589~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_134: ; pnt_lc_id_mtc { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t7◂{ _t8◂_t14◂_s8◂_t9 _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %646~1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %645~0'(= r ) 
;; ? 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 5'(= a20◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_551
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*2]
	mov r11,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov rcx,rdi
;; rsp=0 , %677~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %676~5'(= a20◂ [ a9◂ [ ]{| l |}] ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %674~3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; rsp_d=0, #100 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
; .mov_ptn2 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_100

	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r10,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %678~1'(= {| l |} ) %677~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %676~5'(= a20◂ [ a9◂ [ ]{| l |}] ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; rsp_d=0, #134 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp+8*2],r11
; .mov_ptn2 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rcx
	mov r14,rax
	call ETR_134

	mov r11,QWORD [rsp-8+8*3]
	mov r10,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %680~2'(= {| l |} ) %679~0'(= r ) %678~1'(= {| l |} ) %676~5'(= a20◂ [ a9◂ [ ]{| l |}] ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 5'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r11
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_552
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=0 , %684~3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %680~2'(= {| l |} ) %679~0'(= r ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #133 { 0'(= r ) 3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 { 0'(= r ) 3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r9
	mov r14,rax
	call ETR_133

	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %702~3'(= {| l |} ) %701~0'(= r ) %680~2'(= {| l |} ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_553
	LB_554: db 9,0
LB_553:
	pop rax 
LB_555:
	lea rsi,[LB_554+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_555
	jmp LB_556
	LB_557: db 226,136,144,32,0
LB_556:
	lea rsi,[LB_557+4-1]
	mov rcx,4
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_558
	LB_559: db 46,46,32,59,10,0
LB_558:
	lea rsi,[LB_559+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %707~5'(= {| l |} ) %706~3'(= {| l |} ) %705~2'(= {| l |} ) %704~1'(= {| l |} ) %703~0'(= r ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_552:
;; ? 5'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r11
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_560
	mov rdi,r11
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r11
	mov rdi,QWORD [rdi+8+8*1]
	mov rcx,rdi
;; rsp=0 , %683~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %682~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %680~2'(= {| l |} ) %679~0'(= r ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #96 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= {| l |} )
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*4],rcx
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_96

	mov rcx,QWORD [rsp-8+8*5]
	mov r10,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=0 , %693~3'(= {| l |} ) %683~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %680~2'(= {| l |} ) %679~0'(= r ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #134 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 5'(= {| l |} ) }
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
; .mov_ptn2 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rcx
	mov r14,rax
	call ETR_134

	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r11,r14
	mov r14,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %695~5'(= {| l |} ) %694~0'(= r ) %693~3'(= {| l |} ) %680~2'(= {| l |} ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r11
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,14
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_561
	LB_562: db 9,0
LB_561:
	pop rax 
LB_563:
	lea rsi,[LB_562+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_563
	jmp LB_564
	LB_565: db 226,136,144,32,46,46,32,59,32,0
LB_564:
	lea rsi,[LB_565+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_566
	LB_567: db 226,138,162,32,10,0
LB_566:
	lea rsi,[LB_567+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %700~6'(= {| l |} ) %699~5'(= {| l |} ) %698~2'(= {| l |} ) %697~3'(= {| l |} ) %696~0'(= r ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .dlt.ptn 5'(= {| l |} )
	mov rdi,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_560:
;; ? 5'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %681~5'(= a17◂ [ a9◂ [ ]{| l |}] ) %680~2'(= {| l |} ) %679~0'(= r ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %685~0'(= r ) %681~5'(= a17◂ [ a9◂ [ ]{| l |}] ) %680~2'(= {| l |} ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #131 { 0'(= r ) 5'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 { 0'(= r ) 5'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 5'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r11
	mov r14,rax
	call ETR_131

	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %687~3'(= {| l |} ) %686~0'(= r ) %680~2'(= {| l |} ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %688~0'(= r ) %687~3'(= {| l |} ) %680~2'(= {| l |} ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_568
	LB_569: db 9,0
LB_568:
	pop rax 
LB_570:
	lea rsi,[LB_569+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_570
	jmp LB_571
	LB_572: db 226,136,144,32,46,46,32,46,10,0
LB_571:
	lea rsi,[LB_572+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %692~5'(= {| l |} ) %691~3'(= {| l |} ) %690~2'(= {| l |} ) %689~0'(= r ) %678~1'(= {| l |} ) %675~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_551:
;; ? 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 4'(= a20◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
;; rsp=0 , %649~4'(= a20◂ [ a9◂ [ ]{| l |}] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r10
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_573
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %667~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; rsp_d=0, #100 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_100

	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %668~2'(= {| l |} ) %667~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; rsp_d=0, #133 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	call ETR_133

	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %670~1'(= {| l |} ) %669~0'(= r ) %668~2'(= {| l |} ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_574
	LB_575: db 9,0
LB_574:
	pop rax 
LB_576:
	lea rsi,[LB_575+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_576
	jmp LB_577
	LB_578: db 226,136,144,46,32,46,46,32,59,10,0
LB_577:
	lea rsi,[LB_578+10-1]
	mov rcx,10
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %673~4'(= {| l |} ) %672~1'(= {| l |} ) %671~0'(= r ) %668~2'(= {| l |} ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_573:
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r10
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_579
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %659~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %658~1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; rsp_d=0, #96 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_96

	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %660~1'(= {| l |} ) %659~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; rsp_d=0, #134 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_134

	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r14
	mov r14,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %662~4'(= {| l |} ) %661~0'(= r ) %660~1'(= {| l |} ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,14
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_580
	LB_581: db 9,0
LB_580:
	pop rax 
LB_582:
	lea rsi,[LB_581+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_582
	jmp LB_583
	LB_584: db 226,136,144,32,46,46,32,59,32,0
LB_583:
	lea rsi,[LB_584+9-1]
	mov rcx,9
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_585
	LB_586: db 226,138,162,32,10,0
LB_585:
	lea rsi,[LB_586+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %666~5'(= {| l |} ) %665~4'(= {| l |} ) %664~1'(= {| l |} ) %663~0'(= r ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_579:
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %650~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %645~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %651~0'(= r ) %650~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %653~1'(= {| l |} ) %652~0'(= r ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %654~0'(= r ) %653~1'(= {| l |} ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_587
	LB_588: db 9,0
LB_587:
	pop rax 
LB_589:
	lea rsi,[LB_588+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_589
	jmp LB_590
	LB_591: db 226,136,144,46,32,46,46,32,46,10,0
LB_590:
	lea rsi,[LB_591+10-1]
	mov rcx,10
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %657~4'(= {| l |} ) %656~1'(= {| l |} ) %655~0'(= r ) %648~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %647~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
ETR_156: ; pnt { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t24◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %709~1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %708~0'(= r ) 
;; ? 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a24◂ [ a9◂ [ ]{| l |}] ) } 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_592
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %713~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %712~4'(= a24◂ [ a9◂ [ ]{| l |}] ) %711~3'(= {| l |} ) %708~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %714~0'(= r ) %713~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %712~4'(= a24◂ [ a9◂ [ ]{| l |}] ) %711~3'(= {| l |} ) 
; rsp_d=0, #157 { 0'(= r ) 4'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 0'(= r ) 4'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a24◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a24◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_157

	mov r11,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %716~1'(= {| l |} ) %715~0'(= r ) %713~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %711~3'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %717~0'(= r ) %716~1'(= {| l |} ) %713~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %711~3'(= {| l |} ) 
; rsp_d=0, #156 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_156

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %719~2'(= {| l |} ) %718~0'(= r ) %716~1'(= {| l |} ) %711~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_593
	LB_594: db 9,0
LB_593:
	pop rax 
LB_595:
	lea rsi,[LB_594+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_595
	jmp LB_596
	LB_597: db 64,46,0
LB_596:
	lea rsi,[LB_597+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_598
	LB_599: db 10,0
LB_598:
	lea rsi,[LB_599+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %724~4'(= {| l |} ) %723~2'(= {| l |} ) %722~1'(= {| l |} ) %721~3'(= {| l |} ) %720~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_592:
;; ? 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %708~0'(= r ) 
	jmp LB_600
LB_600:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %710~%[ "" ] %708~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	ret
ETR_157: ; pnt_etr { 0'(= r ) 1'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t24◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %726~1'(= a24◂ [ a9◂ [ ]{| l |}] ) %725~0'(= r ) 
;; ? 1'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂2'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_601
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %730~2'(= a25◂ [ a9◂ [ ]{| l |}] ) %725~0'(= r ) 
; rsp_d=0, #158 { 0'(= r ) 2'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a25◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_158

;; rsp=0 , %732~1'(= {| l |} ) %731~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_601:
;; ? 1'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂1'(= a26◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %727~1'(= a26◂ [ a9◂ [ ]{| l |}] ) %725~0'(= r ) 
; rsp_d=0, #159 { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) }
	call ETR_159

;; rsp=0 , %729~1'(= {| l |} ) %728~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_158: ; pnt_cnc { 0'(= r ) 1'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t25◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %734~1'(= a25◂ [ a9◂ [ ]{| l |}] ) %733~0'(= r ) 
;; ? 1'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂{ 2'(= a3◂ [ {| l |}] ) 3'(= a27◂ [ ] ) 4'(= a28◂ [ a9◂ [ ]] ) 5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 6'(= a25◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_602
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*3]
	mov r11,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*4]
	mov rcx,rdi
;; rsp=0 , %745~6'(= a25◂ [ a9◂ [ ]{| l |}] ) %744~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %743~4'(= a28◂ [ a9◂ [ ]] ) %742~3'(= a27◂ [ ] ) %741~2'(= a3◂ [ {| l |}] ) %733~0'(= r ) 
; rsp_d=0, #158 { 0'(= r ) 6'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 { 0'(= r ) 6'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a25◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 6'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,rcx
	mov r14,rax
	call ETR_158

	mov r11,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*4]
;; rsp=0 , %747~1'(= {| l |} ) %746~0'(= r ) %744~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %743~4'(= a28◂ [ a9◂ [ ]] ) %742~3'(= a27◂ [ ] ) %741~2'(= a3◂ [ {| l |}] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,7
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_603
	LB_604: db 9,0
LB_603:
	pop rax 
LB_605:
	lea rsi,[LB_604+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_605
	jmp LB_606
	LB_607: db 226,136,144,32,46,46,10,0
LB_606:
	lea rsi,[LB_607+7-1]
	mov rcx,7
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %750~6'(= {| l |} ) %749~1'(= {| l |} ) %748~0'(= r ) %744~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %743~4'(= a28◂ [ a9◂ [ ]] ) %742~3'(= a27◂ [ ] ) %741~2'(= a3◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 4'(= a28◂ [ a9◂ [ ]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 3'(= a27◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a3◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_602:
;; ? 1'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂{ 2'(= a3◂ [ {| l |}] ) 3'(= a27◂ [ ] ) 4'(= a28◂ [ a9◂ [ ]] ) 5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*3]
	mov r11,rdi
;; rsp=0 , %738~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %737~4'(= a28◂ [ a9◂ [ ]] ) %736~3'(= a27◂ [ ] ) %735~2'(= a3◂ [ {| l |}] ) %733~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_608
	LB_609: db 9,0
LB_608:
	pop rax 
LB_610:
	lea rsi,[LB_609+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_610
	jmp LB_611
	LB_612: db 226,136,144,46,32,46,46,32,10,0
LB_611:
	lea rsi,[LB_612+9-1]
	mov rcx,9
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %740~1'(= {| l |} ) %739~0'(= r ) %738~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %737~4'(= a28◂ [ a9◂ [ ]] ) %736~3'(= a27◂ [ ] ) %735~2'(= a3◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .dlt.ptn 5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 4'(= a28◂ [ a9◂ [ ]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 3'(= a27◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a3◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_159: ; pnt_act { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t26◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %752~1'(= a26◂ [ a9◂ [ ]{| l |}] ) %751~0'(= r ) 
;; ? 1'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) 5'(= a27◂ [ ] ) 6'(= a28◂ [ a9◂ [ ]] ) 7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 8'(= a26◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_613
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*3]
	mov r11,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*4]
	mov rcx,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*5]
	mov rdx,rdi
	lea rsp,[rsp-8*1]
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*6]
	mov QWORD [rsp-8+8*1],rdi
;; rsp=1 , %774~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %770~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %769~3'(= a8◂ [ a13◂ [ {| l |}]] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) %751~0'(= r ) 
; rsp_d=0, #98 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*6]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_98

	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*6]
;; rsp=1 , %775~1'(= {| l |} ) %774~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %770~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) %751~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=1 , %776~0'(= r ) %775~1'(= {| l |} ) %774~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %770~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*5]
;; rsp=1 , %778~3'(= {| l |} ) %777~0'(= r ) %775~1'(= {| l |} ) %774~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=1 , %779~0'(= r ) %778~3'(= {| l |} ) %775~1'(= {| l |} ) %774~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; rsp_d=0, #159 { 0'(= r ) 8'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	lea rsp,[rsp-8*6]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 { 0'(= r ) 8'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 8'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov rax,QWORD [rsp-8+8*7]
	mov r14,rax
	call ETR_159

	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r14
	mov r14,rax
	lea rsp,[rsp+8*7]
;; rsp=0 , %781~4'(= {| l |} ) %780~0'(= r ) %778~3'(= {| l |} ) %775~1'(= {| l |} ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,12
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov QWORD [rsp-8+8*7],rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_614
	LB_615: db 9,0
LB_614:
	pop rax 
LB_616:
	lea rsi,[LB_615+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_616
	jmp LB_617
	LB_618: db 226,136,144,32,46,46,32,226,138,162,32,0
LB_617:
	lea rsi,[LB_618+11-1]
	mov rcx,11
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_619
	LB_620: db 10,0
LB_619:
	lea rsi,[LB_620+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %786~8'(= {| l |} ) %785~4'(= {| l |} ) %784~3'(= {| l |} ) %783~1'(= {| l |} ) %782~0'(= r ) %773~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %772~6'(= a28◂ [ a9◂ [ ]] ) %771~5'(= a27◂ [ ] ) %768~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; ∎ { 0'(= r ) 8'(= {| l |} ) }
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] )
;	.dlt adt ⊢ _  
; .dlt.ptn 6'(= a28◂ [ a9◂ [ ]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 5'(= a27◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a2◂ [ a13◂ [ {| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 8'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 8'(= {| l |} ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,rax
	lea rsp,[rsp+8*1]
	ret
LB_613:
;; ? 1'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) 5'(= a27◂ [ ] ) 6'(= a28◂ [ a9◂ [ ]] ) 7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*3]
	mov r11,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*4]
	mov rcx,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*5]
	mov rdx,rdi
;; rsp=1 , %758~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %757~6'(= a28◂ [ a9◂ [ ]] ) %756~5'(= a27◂ [ ] ) %755~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %754~3'(= a8◂ [ a13◂ [ {| l |}]] ) %753~2'(= a2◂ [ a13◂ [ {| l |}]] ) %751~0'(= r ) 
; rsp_d=0, #98 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*6]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_98

	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*7]
;; rsp=0 , %759~1'(= {| l |} ) %758~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %757~6'(= a28◂ [ a9◂ [ ]] ) %756~5'(= a27◂ [ ] ) %755~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %753~2'(= a2◂ [ a13◂ [ {| l |}]] ) %751~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %760~0'(= r ) %759~1'(= {| l |} ) %758~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %757~6'(= a28◂ [ a9◂ [ ]] ) %756~5'(= a27◂ [ ] ) %755~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %753~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*5]
;; rsp=0 , %762~3'(= {| l |} ) %761~0'(= r ) %759~1'(= {| l |} ) %758~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %757~6'(= a28◂ [ a9◂ [ ]] ) %756~5'(= a27◂ [ ] ) %753~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %763~0'(= r ) %762~3'(= {| l |} ) %759~1'(= {| l |} ) %758~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %757~6'(= a28◂ [ a9◂ [ ]] ) %756~5'(= a27◂ [ ] ) %753~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,13
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_621
	LB_622: db 9,0
LB_621:
	pop rax 
LB_623:
	lea rsi,[LB_622+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_623
	jmp LB_624
	LB_625: db 226,136,144,46,32,46,46,32,226,138,162,32,0
LB_624:
	lea rsi,[LB_625+12-1]
	mov rcx,12
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_626
	LB_627: db 10,0
LB_626:
	lea rsi,[LB_627+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %767~4'(= {| l |} ) %766~3'(= {| l |} ) %765~1'(= {| l |} ) %764~0'(= r ) %758~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %757~6'(= a28◂ [ a9◂ [ ]] ) %756~5'(= a27◂ [ ] ) %753~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] )
;	.dlt adt ⊢ _  
; .dlt.ptn 6'(= a28◂ [ a9◂ [ ]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 5'(= a27◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a2◂ [ a13◂ [ {| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
ETR_162: ; act_regs { } ⊢ 0'(= a2◂ [ a13◂ [ {| l |}]] ) : ({ }→_lst◂_t13◂_s8)
;; rsp=0 , 
	jmp LB_628
LB_628:
; $ %[ "_r" ] ⊢ %[ "_r" ]
;; rsp=0 , %807~%[ "_r" ] 
	jmp LB_629
LB_629:
; $ %[ "_n" ] ⊢ %[ "_n" ]
;; rsp=0 , %808~%[ "_n" ] %807~%[ "_r" ] 
; #88 %[ "_r" ] ⊢ 1(<2)◂%[ "_r" ]
;; rsp=0 , %809~1(<2)◂%[ "_r" ] %808~%[ "_n" ] 
; #88 %[ "_n" ] ⊢ 1(<2)◂%[ "_n" ]
;; rsp=0 , %810~1(<2)◂%[ "_n" ] %809~1(<2)◂%[ "_r" ] 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %811~1(<2)◂{ } %810~1(<2)◂%[ "_n" ] %809~1(<2)◂%[ "_r" ] 
; #21 { 1(<2)◂%[ "_r" ] 1(<2)◂{ } } ⊢ 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } }
;; rsp=0 , %812~0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } %810~1(<2)◂%[ "_n" ] 
; #21 { 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } }
;; rsp=0 , %813~0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } 
; ∎ 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } }
; .mov_ptn2 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0'(= a2◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0'(= a2◂ [ a13◂ [ {| l |}]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],110
	mov BYTE [rax+6],1
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r8,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],114
	mov BYTE [rax+6],1
	mov rdi,r8
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r8
	mov QWORD [rdi+8+8*1],rax
	mov rax,r8
	mov BYTE [rax+6],0
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_176: ; pnt { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂_t31 }→{ _r64 _s8 })
;; rsp=0 , %815~1'(= a2◂ [ a31◂ [ ]] ) %814~0'(= r ) 
;; ? 1'(= a2◂ [ a31◂ [ ]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_630
;; rsp=0 , %814~0'(= r ) 
	jmp LB_631
LB_631:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %825~%[ "" ] %814~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	ret
LB_630:
;; ? 1'(= a2◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a31◂ [ ] ) 3'(= a2◂ [ a31◂ [ ]] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %817~3'(= a2◂ [ a31◂ [ ]] ) %816~2'(= a31◂ [ ] ) %814~0'(= r ) 
; rsp_d=0, #177 { 0'(= r ) 2'(= a31◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r9
; .mov_ptn2 { 0'(= r ) 2'(= a31◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a31◂ [ ] ) }
; .mov_ptn 2'(= a31◂ [ ] ) ⊢ 1'(= a31◂ [ ] )
	mov rax,r8
	mov r14,rax
	call ETR_177

	mov r9,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %819~1'(= {| l |} ) %818~0'(= r ) %817~3'(= a2◂ [ a31◂ [ ]] ) 
; rsp_d=0, #176 { 0'(= r ) 3'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) }
; .mov_ptn 3'(= a2◂ [ a31◂ [ ]] ) ⊢ 1'(= a2◂ [ a31◂ [ ]] )
	mov rax,r9
	mov r14,rax
	call ETR_176

	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %821~2'(= {| l |} ) %820~0'(= r ) %819~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,0
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %824~3'(= {| l |} ) %823~2'(= {| l |} ) %822~1'(= {| l |} ) %820~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_177: ; pnt_glb_etr { 0'(= r ) 1'(= a31◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t31 }→{ _r64 _s8 })
;; rsp=0 , %827~1'(= a31◂ [ ] ) %826~0'(= r ) 
;; ? 1'(= a31◂ [ ] ) ⊢ 0(<6)◂{ 2'(= {| l |} ) 3'(= a32◂ [ ] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_632
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %880~3'(= a32◂ [ ] ) %879~2'(= {| l |} ) %826~0'(= r ) 
;; ? 3'(= a32◂ [ ] ) ⊢ 0(<2)◂1'(= a2◂ [ a31◂ [ ]] )
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_633
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %887~1'(= a2◂ [ a31◂ [ ]] ) %879~2'(= {| l |} ) %826~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %888~0'(= r ) %887~1'(= a2◂ [ a31◂ [ ]] ) %879~2'(= {| l |} ) 
; rsp_d=0, #176 { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) }
	call ETR_176

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %890~1'(= {| l |} ) %889~0'(= r ) %879~2'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %891~0'(= r ) %890~1'(= {| l |} ) %879~2'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,14
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_634
	LB_635: db 9,0
LB_634:
	pop rax 
LB_636:
	lea rsi,[LB_635+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_636
	jmp LB_637
	LB_638: db 194,167,194,167,32,0
LB_637:
	lea rsi,[LB_638+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_639
	LB_640: db 10,0
LB_639:
	lea rsi,[LB_640+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_641
	LB_642: db 9,0
LB_641:
	pop rax 
LB_643:
	lea rsi,[LB_642+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_643
	jmp LB_644
	LB_645: db 9,0
LB_644:
	lea rsi,[LB_645+1-1]
	mov rcx,1
	rep movsb
	jmp LB_646
	LB_647: db 226,136,142,226,136,142,10,0
LB_646:
	lea rsi,[LB_647+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %895~3'(= {| l |} ) %894~1'(= {| l |} ) %893~2'(= {| l |} ) %892~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_633:
;; ? 3'(= a32◂ [ ] ) ⊢ 1(<2)◂3'(= a9◂ [ ] )
;; rsp=0 , %881~3'(= a9◂ [ ] ) %879~2'(= {| l |} ) %826~0'(= r ) 
; rsp_d=0, #81 3'(= a9◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 3'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 3'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_81

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %882~1'(= {| l |} ) %879~2'(= {| l |} ) %826~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_648
	LB_649: db 9,0
LB_648:
	pop rax 
LB_650:
	lea rsi,[LB_649+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_650
	jmp LB_651
	LB_652: db 194,167,194,167,32,0
LB_651:
	lea rsi,[LB_652+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_653
	LB_654: db 32,61,32,0
LB_653:
	lea rsi,[LB_654+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_655
	LB_656: db 10,0
LB_655:
	lea rsi,[LB_656+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %886~3'(= {| l |} ) %885~1'(= {| l |} ) %884~2'(= {| l |} ) %883~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_632:
;; ? 1'(= a31◂ [ ] ) ⊢ 1(<6)◂2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_657
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %871~2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %826~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %872~0'(= r ) %871~2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) 
; rsp_d=0, #156 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_156

;; rsp=0 , %874~1'(= {| l |} ) %873~0'(= r ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %875~0'(= r ) %874~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,8
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_658
	LB_659: db 9,0
LB_658:
	pop rax 
LB_660:
	lea rsi,[LB_659+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_660
	jmp LB_661
	LB_662: db 194,167,194,167,43,115,56,10,0
LB_661:
	lea rsi,[LB_662+8-1]
	mov rcx,8
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %878~2'(= {| l |} ) %877~1'(= {| l |} ) %876~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_657:
;; ? 1'(= a31◂ [ ] ) ⊢ 2(<6)◂{ 2'(= {| l |} ) 3'(= a33◂ [ ] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_663
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %862~3'(= a33◂ [ ] ) %861~2'(= {| l |} ) %826~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %863~0'(= r ) %862~3'(= a33◂ [ ] ) %861~2'(= {| l |} ) 
; rsp_d=0, #183 { 0'(= r ) 3'(= a33◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a33◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a33◂ [ ] ) }
; .mov_ptn 3'(= a33◂ [ ] ) ⊢ 1'(= a33◂ [ ] )
	mov rax,r9
	mov r14,rax
	call ETR_183

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %865~1'(= {| l |} ) %864~0'(= r ) %861~2'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %866~0'(= r ) %865~1'(= {| l |} ) %861~2'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_664
	LB_665: db 9,0
LB_664:
	pop rax 
LB_666:
	lea rsi,[LB_665+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_666
	jmp LB_667
	LB_668: db 194,167,32,0
LB_667:
	lea rsi,[LB_668+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %870~3'(= {| l |} ) %869~1'(= {| l |} ) %868~2'(= {| l |} ) %867~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_663:
;; ? 1'(= a31◂ [ ] ) ⊢ 3(<6)◂2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_669
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %853~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %826~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %854~0'(= r ) %853~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
; rsp_d=0, #184 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_184

;; rsp=0 , %856~1'(= {| l |} ) %855~0'(= r ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %857~0'(= r ) %856~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,4
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_670
	LB_671: db 9,0
LB_670:
	pop rax 
LB_672:
	lea rsi,[LB_671+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_672
	jmp LB_673
	LB_674: db 194,167,32,10,0
LB_673:
	lea rsi,[LB_674+4-1]
	mov rcx,4
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %860~2'(= {| l |} ) %859~1'(= {| l |} ) %858~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_669:
;; ? 1'(= a31◂ [ ] ) ⊢ 4(<6)◂{ 2'(= {| l |} ) 3'(= a34◂ [ ] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,4
	jnz LB_675
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %837~3'(= a34◂ [ ] ) %836~2'(= {| l |} ) %826~0'(= r ) 
;; ? 3'(= a34◂ [ ] ) ⊢ 0(<2)◂{ 1'(= a2◂ [ {| l |}] ) 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_676
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
;; rsp=0 , %844~4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %843~1'(= a2◂ [ {| l |}] ) %836~2'(= {| l |} ) %826~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %845~0'(= r ) %844~4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %843~1'(= a2◂ [ {| l |}] ) %836~2'(= {| l |} ) 
; rsp_d=0, #180 { 0'(= r ) 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r10
	mov r14,rax
	call ETR_180

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %847~3'(= {| l |} ) %846~0'(= r ) %843~1'(= a2◂ [ {| l |}] ) %836~2'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %848~0'(= r ) %847~3'(= {| l |} ) %843~1'(= a2◂ [ {| l |}] ) %836~2'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,4
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_677
	LB_678: db 9,0
LB_677:
	pop rax 
LB_679:
	lea rsi,[LB_678+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_679
	jmp LB_680
	LB_681: db 194,182,32,0
LB_680:
	lea rsi,[LB_681+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_682
	LB_683: db 10,0
LB_682:
	lea rsi,[LB_683+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %852~4'(= {| l |} ) %851~3'(= {| l |} ) %850~2'(= {| l |} ) %849~0'(= r ) %843~1'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= a2◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_676:
;; ? 3'(= a34◂ [ ] ) ⊢ 1(<2)◂{ 1'(= a2◂ [ {| l |}] ) 4'(= a23◂ [ ] ) }
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r9
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
;; rsp=0 , %839~4'(= a23◂ [ ] ) %838~1'(= a2◂ [ {| l |}] ) %836~2'(= {| l |} ) %826~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,10
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_684
	LB_685: db 9,0
LB_684:
	pop rax 
LB_686:
	lea rsi,[LB_685+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_686
	jmp LB_687
	LB_688: db 194,182,32,0
LB_687:
	lea rsi,[LB_688+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_689
	LB_690: db 32,61,32,46,46,32,10,0
LB_689:
	lea rsi,[LB_690+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %842~3'(= {| l |} ) %841~2'(= {| l |} ) %840~0'(= r ) %839~4'(= a23◂ [ ] ) %838~1'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= a23◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= a2◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_675:
;; ? 1'(= a31◂ [ ] ) ⊢ 5(<6)◂1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
;; rsp=0 , %828~1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %826~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %829~0'(= r ) %828~1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) 
; rsp_d=0, #178 { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
	call ETR_178

;; rsp=0 , %831~1'(= {| l |} ) %830~0'(= r ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %832~0'(= r ) %831~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_691
	LB_692: db 9,0
LB_691:
	pop rax 
LB_693:
	lea rsi,[LB_692+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_693
	jmp LB_694
	LB_695: db 194,182,10,0
LB_694:
	lea rsi,[LB_695+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %835~2'(= {| l |} ) %834~1'(= {| l |} ) %833~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
ETR_178: ; pnt_dt_qlq_etr { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t34 } }→{ _r64 _s8 })
;; rsp=0 , %897~1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %896~0'(= r ) 
;; ? 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a34◂ [ ] ) } 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_696
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %901~5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %900~4'(= a34◂ [ ] ) %899~3'(= {| l |} ) %896~0'(= r ) 
; rsp_d=0, #178 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rax,r11
	mov r14,rax
	call ETR_178

	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %903~1'(= {| l |} ) %902~0'(= r ) %900~4'(= a34◂ [ ] ) %899~3'(= {| l |} ) 
;; ? 4'(= a34◂ [ ] ) ⊢ 0(<2)◂{ 2'(= a2◂ [ {| l |}] ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r10
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_697
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %911~5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %910~2'(= a2◂ [ {| l |}] ) %903~1'(= {| l |} ) %902~0'(= r ) %899~3'(= {| l |} ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %912~0'(= r ) %911~5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %910~2'(= a2◂ [ {| l |}] ) %903~1'(= {| l |} ) %899~3'(= {| l |} ) 
; rsp_d=0, #180 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r11
	mov r14,rax
	call ETR_180

	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r14
	mov r14,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %914~4'(= {| l |} ) %913~0'(= r ) %910~2'(= a2◂ [ {| l |}] ) %903~1'(= {| l |} ) %899~3'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %915~0'(= r ) %914~4'(= {| l |} ) %910~2'(= a2◂ [ {| l |}] ) %903~1'(= {| l |} ) %899~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_698
	LB_699: db 9,0
LB_698:
	pop rax 
LB_700:
	lea rsi,[LB_699+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_700
	jmp LB_701
	LB_702: db 64,46,0
LB_701:
	lea rsi,[LB_702+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_703
	LB_704: db 10,0
LB_703:
	lea rsi,[LB_704+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %920~5'(= {| l |} ) %919~1'(= {| l |} ) %918~4'(= {| l |} ) %917~3'(= {| l |} ) %916~0'(= r ) %910~2'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a2◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_697:
;; ? 4'(= a34◂ [ ] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ {| l |}] ) 5'(= a23◂ [ ] ) }
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r10
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %905~5'(= a23◂ [ ] ) %904~2'(= a2◂ [ {| l |}] ) %903~1'(= {| l |} ) %902~0'(= r ) %899~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,9
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_705
	LB_706: db 9,0
LB_705:
	pop rax 
LB_707:
	lea rsi,[LB_706+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_707
	jmp LB_708
	LB_709: db 64,46,0
LB_708:
	lea rsi,[LB_709+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_710
	LB_711: db 32,61,32,46,46,32,10,0
LB_710:
	lea rsi,[LB_711+7-1]
	mov rcx,7
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %909~4'(= {| l |} ) %908~1'(= {| l |} ) %907~3'(= {| l |} ) %906~0'(= r ) %905~5'(= a23◂ [ ] ) %904~2'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 5'(= a23◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= a2◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_696:
;; ? 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %896~0'(= r ) 
	jmp LB_712
LB_712:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %898~%[ "" ] %896~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	ret
ETR_179: ; pnt_dt_etr { 0'(= r ) 1'(= a34◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t34 }→{ _r64 _s8 })
;; rsp=0 , %922~1'(= a34◂ [ ] ) %921~0'(= r ) 
;; ? 1'(= a34◂ [ ] ) ⊢ 0(<2)◂{ 2'(= a2◂ [ {| l |}] ) 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_713
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %929~3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %928~2'(= a2◂ [ {| l |}] ) %921~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %930~0'(= r ) %929~3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %928~2'(= a2◂ [ {| l |}] ) 
; rsp_d=0, #180 { 0'(= r ) 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r9
	mov r14,rax
	call ETR_180

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %932~1'(= {| l |} ) %931~0'(= r ) %928~2'(= a2◂ [ {| l |}] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %933~0'(= r ) %932~1'(= {| l |} ) %928~2'(= a2◂ [ {| l |}] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_714
	LB_715: db 10,0
LB_714:
	lea rsi,[LB_715+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %935~3'(= {| l |} ) %934~1'(= {| l |} ) %933~0'(= r ) %928~2'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a2◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_713:
;; ? 1'(= a34◂ [ ] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ {| l |}] ) 3'(= a23◂ [ ] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %924~3'(= a23◂ [ ] ) %923~2'(= a2◂ [ {| l |}] ) %921~0'(= r ) 
; rsp_d=0, #181 3'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 3'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 3'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_181

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %925~1'(= {| l |} ) %923~2'(= a2◂ [ {| l |}] ) %921~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,4
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_716
	LB_717: db 32,61,32,0
LB_716:
	lea rsi,[LB_717+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_718
	LB_719: db 10,0
LB_718:
	lea rsi,[LB_719+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %927~3'(= {| l |} ) %926~1'(= {| l |} ) %923~2'(= a2◂ [ {| l |}] ) %921~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a2◂ [ {| l |}] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_180: ; pnt_dt_def { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t23 } }→{ _r64 _s8 })
;; rsp=0 , %937~1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %936~0'(= r ) 
;; ? 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a23◂ [ ] ) } 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_720
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %941~5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %940~4'(= a23◂ [ ] ) %939~3'(= {| l |} ) %936~0'(= r ) 
; rsp_d=0, #180 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r11
	mov r14,rax
	call ETR_180

	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %943~1'(= {| l |} ) %942~0'(= r ) %940~4'(= a23◂ [ ] ) %939~3'(= {| l |} ) 
; rsp_d=0, #181 4'(= a23◂ [ ] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 4'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 4'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r10
	mov r13,rax
	call ETR_181

	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %944~2'(= {| l |} ) %943~1'(= {| l |} ) %942~0'(= r ) %939~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,8
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_721
	LB_722: db 9,0
LB_721:
	pop rax 
LB_723:
	lea rsi,[LB_722+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_723
	jmp LB_724
	LB_725: db 226,136,144,32,0
LB_724:
	lea rsi,[LB_725+4-1]
	mov rcx,4
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_726
	LB_727: db 32,58,32,0
LB_726:
	lea rsi,[LB_727+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_728
	LB_729: db 10,0
LB_728:
	lea rsi,[LB_729+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %949~4'(= {| l |} ) %948~1'(= {| l |} ) %947~2'(= {| l |} ) %946~3'(= {| l |} ) %945~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_720:
;; ? 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %936~0'(= r ) 
	jmp LB_730
LB_730:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %938~%[ "" ] %936~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	ret
ETR_181: ; pnt_type 0'(= a23◂ [ ] ) ⊢ 0'(= {| l |} ) : (_t23→_s8)
;; rsp=0 , %950~0'(= a23◂ [ ] ) 
;; ? 0'(= a23◂ [ ] ) ⊢ 0(<5)◂1'(= a2◂ [ a23◂ [ ]] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_731
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %970~1'(= a2◂ [ a23◂ [ ]] ) 
; rsp_d=0, #182 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,r14
	mov r13,rax
	call ETR_182

;; rsp=0 , %971~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_732
	LB_733: db 123,32,0
LB_732:
	lea rsi,[LB_733+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_734
	LB_735: db 125,0
LB_734:
	lea rsi,[LB_735+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %973~1'(= {| l |} ) %972~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_731:
;; ? 0'(= a23◂ [ ] ) ⊢ 1(<5)◂{ 1'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_736
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %964~2'(= a23◂ [ ] ) %963~1'(= a23◂ [ ] ) 
; rsp_d=0, #181 1'(= a23◂ [ ] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_181

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %965~0'(= {| l |} ) %964~2'(= a23◂ [ ] ) 
; rsp_d=0, #181 2'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_181

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %966~1'(= {| l |} ) %965~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,5
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_737
	LB_738: db 32,226,134,146,32,0
LB_737:
	lea rsi,[LB_738+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %969~2'(= {| l |} ) %968~1'(= {| l |} ) %967~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_736:
;; ? 0'(= a23◂ [ ] ) ⊢ 2(<5)◂{ 1'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_739
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %957~2'(= a23◂ [ ] ) %956~1'(= a23◂ [ ] ) 
; rsp_d=0, #181 1'(= a23◂ [ ] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_181

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %958~0'(= {| l |} ) %957~2'(= a23◂ [ ] ) 
; rsp_d=0, #181 2'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_181

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %959~1'(= {| l |} ) %958~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,3
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_740
	LB_741: db 226,151,130,0
LB_740:
	lea rsi,[LB_741+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %962~2'(= {| l |} ) %961~1'(= {| l |} ) %960~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_739:
;; ? 0'(= a23◂ [ ] ) ⊢ 3(<5)◂1'(= a9◂ [ ] )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_742
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %954~1'(= a9◂ [ ] ) 
; rsp_d=0, #81 1'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_81

;; rsp=0 , %955~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_742:
;; ? 0'(= a23◂ [ ] ) ⊢ 4(<5)◂0'(= {| l |} )
;; rsp=0 , %951~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_743
	LB_744: db 39,0
LB_743:
	lea rsi,[LB_744+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %953~1'(= {| l |} ) %952~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
ETR_182: ; pnt_type_rcd 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t23→_s8)
;; rsp=0 , %974~0'(= a2◂ [ a23◂ [ ]] ) 
;; ? 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂{ 1'(= a23◂ [ ] ) 2'(= a2◂ [ a23◂ [ ]] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_745
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r8,rdi
;; rsp=0 , %977~2'(= a2◂ [ a23◂ [ ]] ) %976~1'(= a23◂ [ ] ) 
; rsp_d=0, #181 1'(= a23◂ [ ] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_181

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %978~0'(= {| l |} ) %977~2'(= a2◂ [ a23◂ [ ]] ) 
; rsp_d=0, #182 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov r13,rax
	call ETR_182

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %979~1'(= {| l |} ) %978~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,1
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_746
	LB_747: db 32,0
LB_746:
	lea rsi,[LB_747+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %982~2'(= {| l |} ) %981~1'(= {| l |} ) %980~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_745:
;; ? 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_748
LB_748:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %975~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	ret
ETR_183: ; pnt_lc_etr { 0'(= r ) 1'(= a33◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t33 }→{ _r64 _s8 })
;; rsp=0 , %984~1'(= a33◂ [ ] ) %983~0'(= r ) 
;; ? 1'(= a33◂ [ ] ) ⊢ 0(<3)◂{ 2'(= a8◂ [ a13◂ [ {| l |}]] ) 3'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_749
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
;; rsp=0 , %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %997~3'(= a3◂ [ a23◂ [ ]] ) %996~2'(= a8◂ [ a13◂ [ {| l |}]] ) %983~0'(= r ) 
;; ? 3'(= a3◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂1'(= a23◂ [ ] )
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_750
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %1007~1'(= a23◂ [ ] ) %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %996~2'(= a8◂ [ a13◂ [ {| l |}]] ) %983~0'(= r ) 
; rsp_d=0, #181 1'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_181

	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %1008~1'(= {| l |} ) %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %996~2'(= a8◂ [ a13◂ [ {| l |}]] ) %983~0'(= r ) 
; rsp_d=0, #98 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_98

	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %1009~2'(= {| l |} ) %1008~1'(= {| l |} ) %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %983~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1010~0'(= r ) %1009~2'(= {| l |} ) %1008~1'(= {| l |} ) %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %1012~3'(= {| l |} ) %1011~0'(= r ) %1009~2'(= {| l |} ) %1008~1'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1013~0'(= r ) %1012~3'(= {| l |} ) %1009~2'(= {| l |} ) %1008~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,5
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_751
	LB_752: db 32,0
LB_751:
	lea rsi,[LB_752+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_753
	LB_754: db 32,58,32,0
LB_753:
	lea rsi,[LB_754+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_755
	LB_756: db 10,0
LB_755:
	lea rsi,[LB_756+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1017~4'(= {| l |} ) %1016~1'(= {| l |} ) %1015~3'(= {| l |} ) %1014~2'(= {| l |} ) %1013~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_750:
;; rsp=0 , %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %997~3'(= a3◂ [ a23◂ [ ]] ) %996~2'(= a8◂ [ a13◂ [ {| l |}]] ) %983~0'(= r ) 
; rsp_d=0, #98 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_98

	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %999~1'(= {| l |} ) %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %997~3'(= a3◂ [ a23◂ [ ]] ) %983~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1000~0'(= r ) %999~1'(= {| l |} ) %998~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %997~3'(= a3◂ [ a23◂ [ ]] ) 
; rsp_d=0, #131 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_131

	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %1002~2'(= {| l |} ) %1001~0'(= r ) %999~1'(= {| l |} ) %997~3'(= a3◂ [ a23◂ [ ]] ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1003~0'(= r ) %1002~2'(= {| l |} ) %999~1'(= {| l |} ) %997~3'(= a3◂ [ a23◂ [ ]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,2
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_757
	LB_758: db 32,0
LB_757:
	lea rsi,[LB_758+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_759
	LB_760: db 10,0
LB_759:
	lea rsi,[LB_760+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1006~4'(= {| l |} ) %1005~2'(= {| l |} ) %1004~1'(= {| l |} ) %1003~0'(= r ) %997~3'(= a3◂ [ a23◂ [ ]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a3◂ [ a23◂ [ ]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_749:
;; ? 1'(= a33◂ [ ] ) ⊢ 1(<3)◂2'(= a11◂ [ a9◂ [ ]] )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_761
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=0 , %992~2'(= a11◂ [ a9◂ [ ]] ) %983~0'(= r ) 
; rsp_d=0, #87 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov r13,rax
	call ETR_87

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %993~1'(= {| l |} ) %983~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,4
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_762
	LB_763: db 32,61,32,0
LB_762:
	lea rsi,[LB_763+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_764
	LB_765: db 10,0
LB_764:
	lea rsi,[LB_765+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %995~2'(= {| l |} ) %994~1'(= {| l |} ) %983~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_761:
;; ? 1'(= a33◂ [ ] ) ⊢ 2(<3)◂1'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %985~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %983~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %986~0'(= r ) %985~1'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; rsp_d=0, #131 { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	call ETR_131

;; rsp=0 , %988~1'(= {| l |} ) %987~0'(= r ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %989~0'(= r ) %988~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,5
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_766
	LB_767: db 32,194,171,32,10,0
LB_766:
	lea rsi,[LB_767+5-1]
	mov rcx,5
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %991~2'(= {| l |} ) %990~1'(= {| l |} ) %989~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
ETR_184: ; pnt_lc_qlq_etr { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t8◂_t13◂_s8 _opn◂_t23 _t17◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %1019~1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1018~0'(= r ) 
;; ? 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) 5'(= a3◂ [ a23◂ [ ]] ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_768
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*2]
	mov r11,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*3]
	mov rcx,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov rdx,rdi
;; rsp=0 , %1025~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1022~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1021~3'(= {| l |} ) %1018~0'(= r ) 
;; ? 5'(= a3◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂1'(= a23◂ [ ] )
	mov rdi,r11
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_769
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %1039~1'(= a23◂ [ ] ) %1025~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1022~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1021~3'(= {| l |} ) %1018~0'(= r ) 
; rsp_d=0, #181 1'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_181

	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=0 , %1040~1'(= {| l |} ) %1025~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1022~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1021~3'(= {| l |} ) %1018~0'(= r ) 
; rsp_d=0, #98 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_98

	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=0 , %1041~2'(= {| l |} ) %1040~1'(= {| l |} ) %1025~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1021~3'(= {| l |} ) %1018~0'(= r ) 
; rsp_d=0, #184 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],rcx
; .mov_ptn2 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rdx
	mov r14,rax
	call ETR_184

	mov rcx,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r14
	mov r14,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1043~4'(= {| l |} ) %1042~0'(= r ) %1041~2'(= {| l |} ) %1040~1'(= {| l |} ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1021~3'(= {| l |} ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1044~0'(= r ) %1043~4'(= {| l |} ) %1041~2'(= {| l |} ) %1040~1'(= {| l |} ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1021~3'(= {| l |} ) 
; rsp_d=0, #131 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 5'(= {| l |} ) }
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
; .mov_ptn2 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 6'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,rcx
	mov r14,rax
	call ETR_131

	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r11,r14
	mov r14,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1046~5'(= {| l |} ) %1045~0'(= r ) %1043~4'(= {| l |} ) %1041~2'(= {| l |} ) %1040~1'(= {| l |} ) %1021~3'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1047~0'(= r ) %1046~5'(= {| l |} ) %1043~4'(= {| l |} ) %1041~2'(= {| l |} ) %1040~1'(= {| l |} ) %1021~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r11
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,7
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_770
	LB_771: db 9,0
LB_770:
	pop rax 
LB_772:
	lea rsi,[LB_771+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_772
	jmp LB_773
	LB_774: db 64,46,0
LB_773:
	lea rsi,[LB_774+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_775
	LB_776: db 32,0
LB_775:
	lea rsi,[LB_776+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_777
	LB_778: db 32,58,32,0
LB_777:
	lea rsi,[LB_778+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_779
	LB_780: db 10,0
LB_779:
	lea rsi,[LB_780+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1054~6'(= {| l |} ) %1053~1'(= {| l |} ) %1052~4'(= {| l |} ) %1051~5'(= {| l |} ) %1050~2'(= {| l |} ) %1049~3'(= {| l |} ) %1048~0'(= r ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 5'(= {| l |} )
	mov rdi,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_769:
;; rsp=0 , %1025~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1022~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1021~3'(= {| l |} ) %1018~0'(= r ) 
; rsp_d=0, #98 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*5]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_98

	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=0 , %1026~1'(= {| l |} ) %1025~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1021~3'(= {| l |} ) %1018~0'(= r ) 
; rsp_d=0, #184 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
; .mov_ptn2 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rdx
	mov r14,rax
	call ETR_184

	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1028~2'(= {| l |} ) %1027~0'(= r ) %1026~1'(= {| l |} ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1021~3'(= {| l |} ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1029~0'(= r ) %1028~2'(= {| l |} ) %1026~1'(= {| l |} ) %1024~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1021~3'(= {| l |} ) 
; rsp_d=0, #131 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 6'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,rcx
	mov r14,rax
	call ETR_131

	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r14
	mov r14,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1031~4'(= {| l |} ) %1030~0'(= r ) %1028~2'(= {| l |} ) %1026~1'(= {| l |} ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1021~3'(= {| l |} ) 
; _dec 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1032~0'(= r ) %1031~4'(= {| l |} ) %1028~2'(= {| l |} ) %1026~1'(= {| l |} ) %1023~5'(= a3◂ [ a23◂ [ ]] ) %1021~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r8
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r14
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r9
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r13
	push rsi
	imul rsi,1
	add rdi,rsi 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,4
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_781
	LB_782: db 9,0
LB_781:
	pop rax 
LB_783:
	lea rsi,[LB_782+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_783
	jmp LB_784
	LB_785: db 64,46,0
LB_784:
	lea rsi,[LB_785+2-1]
	mov rcx,2
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_786
	LB_787: db 32,0
LB_786:
	lea rsi,[LB_787+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_788
	LB_789: db 10,0
LB_788:
	lea rsi,[LB_789+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1038~6'(= {| l |} ) %1037~2'(= {| l |} ) %1036~4'(= {| l |} ) %1035~1'(= {| l |} ) %1034~3'(= {| l |} ) %1033~0'(= r ) %1023~5'(= a3◂ [ a23◂ [ ]] ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= {| l |} )
	mov rdi,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 5'(= a3◂ [ a23◂ [ ]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_768:
;; ? 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1018~0'(= r ) 
	jmp LB_790
LB_790:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1020~%[ "" ] %1018~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	ret
ETR_185: ; mk_app { 0'(= a23◂ [ ] ) 1'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a23◂ [ ] ) : ({ _t23 _lst◂_t23 }→_t23)
;; rsp=0 , %1056~1'(= a2◂ [ a23◂ [ ]] ) %1055~0'(= a23◂ [ ] ) 
;; ? 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a23◂ [ ] ) 3'(= a2◂ [ a23◂ [ ]] ) }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_791
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %1058~3'(= a2◂ [ a23◂ [ ]] ) %1057~2'(= a23◂ [ ] ) %1055~0'(= a23◂ [ ] ) 
; #137 { 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } ⊢ 2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) }
;; rsp=0 , %1059~2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } %1058~3'(= a2◂ [ a23◂ [ ]] ) 
; rsp_d=0, #185 { 2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a23◂ [ ] )
; .mov_ptn2 { 2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a23◂ [ ] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 3'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,r9
	mov r14,rax
	mov r10,r13
; .mov_ptn 2(<5)◂{ 4'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } ⊢ 0'(= a23◂ [ ] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,r8
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],2
	mov r13,rax
	call ETR_185

;; rsp=0 , %1060~0'(= a23◂ [ ] ) 
; ∎ 0'(= a23◂ [ ] )
; .mov_ptn2 0'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	ret
LB_791:
;; ? 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1055~0'(= a23◂ [ ] ) 
; ∎ 0'(= a23◂ [ ] )
; .mov_ptn2 0'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	ret
ETR_186:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_186
	ret
GRM_186:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_795
	jmp LB_796
LB_795:
	mov r8,unt_1
	jmp LB_793
LB_796:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_797
	jmp LB_798
LB_797:
	mov r8,unt_1
	jmp LB_793
LB_798:
	add r14,1
	jmp LB_794
LB_793:
	lea rsp,[rsp+8*0]
	jmp LB_792
LB_794:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_803
	jmp LB_804
LB_803:
	mov r8,unt_1
	jmp LB_801
LB_804:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],32
	jnz LB_805
	jmp LB_806
LB_805:
	mov r8,unt_1
	jmp LB_801
LB_806:
	add r14,1
	jmp LB_802
LB_801:
	lea rsp,[rsp+8*0]
	jmp LB_800
LB_802:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_808
LB_808
;; rsp=0 , %1064~1'(= r ) %1063~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1065~0(<2)◂{ } %1064~1'(= r ) %1063~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_807
LB_807:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_800
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_799
LB_800:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_812
	jmp LB_813
LB_812:
	mov r8,unt_1
	jmp LB_810
LB_813:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_814
	jmp LB_815
LB_814:
	mov r8,unt_1
	jmp LB_810
LB_815:
	add r14,1
	jmp LB_811
LB_810:
	lea rsp,[rsp+8*0]
	jmp LB_809
LB_811:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_817
LB_817
;; rsp=0 , %1067~1'(= r ) %1066~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1068~0(<2)◂{ } %1067~1'(= r ) %1066~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_816
LB_816:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_809
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_799
LB_809:
	call GRM_187
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_821
	jmp LB_822
LB_821:
	jmp LB_819
LB_822:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_820
LB_819:
	lea rsp,[rsp+8*0]
	jmp LB_818
LB_820:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_824
LB_824
;; rsp=0 , %1071~1'(= r ) %1070~0'(= r ) %1069~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1072~1(<2)◂{ } %1071~1'(= r ) %1070~0'(= r ) %1069~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_823
LB_823:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_818
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_799
LB_818:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_827
LB_827
;; rsp=0 , %1074~1'(= r ) %1073~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1075~0(<2)◂{ } %1074~1'(= r ) %1073~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_826
LB_826:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_825
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_799
LB_825:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_799
LB_799:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_828
	jmp LB_829
LB_828:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_829:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_831
LB_831
;; rsp=0 , %1076~{ } %1062~1'(= r ) %1061~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1077~0(<2)◂{ } %1076~{ } %1062~1'(= r ) %1061~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn { }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_830
LB_830:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_792
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_792:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_187:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_187
	ret
GRM_187:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_835
	jmp LB_836
LB_835:
	mov r8,unt_1
	jmp LB_833
LB_836:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_837
	jmp LB_838
LB_837:
	mov r8,unt_1
	jmp LB_833
LB_838:
	add r14,1
	jmp LB_834
LB_833:
	lea rsp,[rsp+8*0]
	jmp LB_832
LB_834:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_840
LB_840
;; rsp=0 , %1079~1'(= r ) %1078~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1080~1(<2)◂{ } %1079~1'(= r ) %1078~0'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_839
LB_839:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_832
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_832:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_843
LB_843
;; rsp=0 , %1082~1'(= r ) %1081~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1083~0(<2)◂{ } %1082~1'(= r ) %1081~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_842
LB_842:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_841
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_841:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_188:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_188
	ret
GRM_188:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_846
LB_845:
	add r14,1 
LB_846:
	cmp r14,r9
	jge LB_847
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_845
	cmp rax,32 
	jz LB_845
LB_847
	call GRM_76
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_850
	jmp LB_851
LB_850:
	jmp LB_848
LB_851:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_849
LB_848:
	lea rsp,[rsp+8*0]
	jmp LB_844
LB_849:
	jmp LB_853
LB_852:
	add r14,1 
LB_853:
	cmp r14,r9
	jge LB_854
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_852
	cmp rax,32 
	jz LB_852
LB_854
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_857
	jmp LB_858
LB_857:
	mov r8,unt_1
	jmp LB_855
LB_858:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_859
	jmp LB_860
LB_859:
	mov r8,unt_1
	jmp LB_855
LB_860:
	add r14,1
	jmp LB_856
LB_855:
	lea rsp,[rsp+8*1]
	jmp LB_844
LB_856:
	jmp LB_862
LB_861:
	add r14,1 
LB_862:
	cmp r14,r9
	jge LB_863
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_861
	cmp rax,32 
	jz LB_861
LB_863
	call GRM_188
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_866
	jmp LB_867
LB_866:
	jmp LB_864
LB_867:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_865
LB_864:
	lea rsp,[rsp+8*1]
	jmp LB_844
LB_865:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_869
LB_869
;; rsp=2 , %1087~1'(= r ) %1086~0'(= r ) %1085~9'(= a9◂ [ ] ) %1084~8'(= {| l |} ) 
; #80 { 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) }
;; rsp=2 , %1088~0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } %1087~1'(= r ) %1086~0'(= r ) 
; #22 0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) }
;; rsp=2 , %1089~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } %1087~1'(= r ) %1086~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 2'(= a3◂ [ a9◂ [ ]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 2'(= a3◂ [ a9◂ [ ]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_868
LB_868:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_844
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_844:
	jmp LB_872
LB_871:
	add r14,1 
LB_872:
	cmp r14,r9
	jge LB_873
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_871
	cmp rax,32 
	jz LB_871
LB_873
	call GRM_76
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_876
	jmp LB_877
LB_876:
	jmp LB_874
LB_877:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_875
LB_874:
	lea rsp,[rsp+8*0]
	jmp LB_870
LB_875:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_879
LB_879
;; rsp=1 , %1092~1'(= r ) %1091~0'(= r ) %1090~8'(= {| l |} ) 
; #79 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1093~1(<2)◂8'(= {| l |} ) %1092~1'(= r ) %1091~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1094~0(<2)◂1(<2)◂8'(= {| l |} ) %1092~1'(= r ) %1091~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a9◂ [ ]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a9◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_878
LB_878:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_870
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_870:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_189:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_189
	ret
GRM_189:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_883
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
 lea rdi,[r13+8+r14] 
	call scf_d
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	cmp rax,0 
	jz LB_883
	add r14,rsi
	push rdi
	jmp LB_884
LB_883:
	mov r8,unt_1
	jmp LB_881
LB_884:
	jmp LB_882
LB_881:
	lea rsp,[rsp+8*0]
	jmp LB_880
LB_882:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_887
	jmp LB_888
LB_887:
	mov r8,unt_1
	jmp LB_885
LB_888:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_889
	jmp LB_890
LB_889:
	mov r8,unt_1
	jmp LB_885
LB_890:
	add r14,1
	jmp LB_886
LB_885:
	lea rsp,[rsp+8*1]
	jmp LB_880
LB_886:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_892
LB_892
;; rsp=1 , %1097~1'(= r ) %1096~0'(= r ) %1095~8'(= r ) 
; #83 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1098~0(<2)◂8'(= r ) %1097~1'(= r ) %1096~0'(= r ) 
; #85 0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1099~0(<2)◂0(<2)◂8'(= r ) %1097~1'(= r ) %1096~0'(= r ) 
; #22 0(<2)◂0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1100~0(<2)◂0(<2)◂0(<2)◂8'(= r ) %1097~1'(= r ) %1096~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_891
LB_891:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_880
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_880:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_896
	jmp LB_897
LB_896:
	mov r8,unt_1
	jmp LB_894
LB_897:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_898
	cmp BYTE [rdi+1],120
	jnz LB_898
	jmp LB_899
LB_898:
	mov r8,unt_1
	jmp LB_894
LB_899:
	add r14,2
	jmp LB_895
LB_894:
	lea rsp,[rsp+8*0]
	jmp LB_893
LB_895:
	cmp r14,r9
	jge LB_902
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
 lea rdi,[r13+8+r14] 
	call scf_x
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	cmp rax,0 
	jz LB_902
	add r14,rsi
	push rdi
	jmp LB_903
LB_902:
	mov r8,unt_1
	jmp LB_900
LB_903:
	jmp LB_901
LB_900:
	lea rsp,[rsp+8*0]
	jmp LB_893
LB_901:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_906
	jmp LB_907
LB_906:
	mov r8,unt_1
	jmp LB_904
LB_907:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_908
	jmp LB_909
LB_908:
	mov r8,unt_1
	jmp LB_904
LB_909:
	add r14,1
	jmp LB_905
LB_904:
	lea rsp,[rsp+8*1]
	jmp LB_893
LB_905:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_911
LB_911
;; rsp=1 , %1103~1'(= r ) %1102~0'(= r ) %1101~8'(= r ) 
; #83 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1104~0(<2)◂8'(= r ) %1103~1'(= r ) %1102~0'(= r ) 
; #85 0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1105~0(<2)◂0(<2)◂8'(= r ) %1103~1'(= r ) %1102~0'(= r ) 
; #22 0(<2)◂0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1106~0(<2)◂0(<2)◂0(<2)◂8'(= r ) %1103~1'(= r ) %1102~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_910
LB_910:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_893
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_893:
	call GRM_66
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_915
	jmp LB_916
LB_915:
	jmp LB_913
LB_916:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_914
LB_913:
	lea rsp,[rsp+8*0]
	jmp LB_912
LB_914:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_918
LB_918
;; rsp=1 , %1109~1'(= r ) %1108~0'(= r ) %1107~8'(= {| l |} ) 
; #82 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1110~1(<2)◂8'(= {| l |} ) %1109~1'(= r ) %1108~0'(= r ) 
; #85 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1111~0(<2)◂1(<2)◂8'(= {| l |} ) %1109~1'(= r ) %1108~0'(= r ) 
; #22 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1112~0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} ) %1109~1'(= r ) %1108~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_917
LB_917:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_912
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_912:
	call GRM_188
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_922
	jmp LB_923
LB_922:
	jmp LB_920
LB_923:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_921
LB_920:
	lea rsp,[rsp+8*0]
	jmp LB_919
LB_921:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_925
LB_925
;; rsp=1 , %1115~1'(= r ) %1114~0'(= r ) %1113~8'(= a9◂ [ ] ) 
; #84 8'(= a9◂ [ ] ) ⊢ 1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1116~1(<2)◂8'(= a9◂ [ ] ) %1115~1'(= r ) %1114~0'(= r ) 
; #22 1(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1117~0(<2)◂1(<2)◂8'(= a9◂ [ ] ) %1115~1'(= r ) %1114~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a9◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_924
LB_924:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_919
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_919:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_190:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_190
	ret
GRM_190:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_928
LB_927:
	add r14,1 
LB_928:
	cmp r14,r9
	jge LB_929
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_927
	cmp rax,32 
	jz LB_927
LB_929
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_932
	jmp LB_933
LB_932:
	mov r8,unt_1
	jmp LB_930
LB_933:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_934
	jmp LB_935
LB_934:
	mov r8,unt_1
	jmp LB_930
LB_935:
	add r14,1
	jmp LB_931
LB_930:
	lea rsp,[rsp+8*0]
	jmp LB_926
LB_931:
	jmp LB_937
LB_936:
	add r14,1 
LB_937:
	cmp r14,r9
	jge LB_938
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_936
	cmp rax,32 
	jz LB_936
LB_938
	call GRM_190
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_941
	jmp LB_942
LB_941:
	jmp LB_939
LB_942:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_940
LB_939:
	lea rsp,[rsp+8*0]
	jmp LB_926
LB_940:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_944
LB_944
;; rsp=1 , %1120~1'(= r ) %1119~0'(= r ) %1118~8'(= r ) 
; _inc 8'(= r ) ⊢ 8'(= r )
	add QWORD [rsp-8+8*1],1
;; rsp=1 , %1121~8'(= r ) %1120~1'(= r ) %1119~0'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1122~0(<2)◂8'(= r ) %1120~1'(= r ) %1119~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_943
LB_943:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_926
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_926:
	jmp LB_947
LB_946:
	add r14,1 
LB_947:
	cmp r14,r9
	jge LB_948
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_946
	cmp rax,32 
	jz LB_946
LB_948
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_951
	jmp LB_952
LB_951:
	mov r8,unt_1
	jmp LB_949
LB_952:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_953
	jmp LB_954
LB_953:
	mov r8,unt_1
	jmp LB_949
LB_954:
	add r14,1
	jmp LB_950
LB_949:
	lea rsp,[rsp+8*0]
	jmp LB_945
LB_950:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_956
LB_956
;; rsp=0 , %1124~1'(= r ) %1123~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %1125~0(<2)◂%[ 1r ] %1124~1'(= r ) %1123~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_955
LB_955:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_945
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_945:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_194: ; mk_prs_err { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } ⊢ 0'(= a35◂ [ q0] ) : ({ _r64 _r64 _s8 }→_t35◂2309'(1))
;; rsp=0 , %1141~2'(= {| l |} ) %1140~1'(= r ) %1139~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1142~1(<2)◂{ } %1141~2'(= {| l |} ) %1140~1'(= r ) %1139~0'(= r ) 
; #21 { { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1143~0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; #191 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1144~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; ∎ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
; .mov_ptn2 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0'(= a35◂ [ q0] )
	mov r9,r13
; .mov_ptn 1(<2)◂0(<2)◂{ { 3'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0'(= a35◂ [ q0] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r11,rax
	mov rax,r9
	mov rdi,r11
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r11
	mov QWORD [rdi+8+8*1],rax
	mov rax,r8
	mov rdi,r11
	mov QWORD [rdi+8+8*2],rax
	mov rax,r11
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
ETR_195: ; pnt_prs_err 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} ) : (_lst◂{ _r64 _r64 _s8 }→_s8)
;; rsp=0 , %1145~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ { 2'(= r ) 3'(= r ) 4'(= {| l |} ) } 5'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_957
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r14,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*2]
	mov r10,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
;; rsp=0 , %1149~5'(= a2◂ [ *{ rr{| l |}}] ) %1148~4'(= {| l |} ) %1147~3'(= r ) %1146~2'(= r ) 
; rsp_d=0, #195 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} )
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r11
	mov r13,rax
	call ETR_195

	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*3]
;; rsp=0 , %1151~0'(= {| l |} ) %1148~4'(= {| l |} ) %1147~3'(= r ) %1146~2'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	mov rsi,r10
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[rsi] 
	add rdi,rax 
	push rax
	push rsi
	sub rsp,128
	mov rdi,rsp
	mov rsi,fmt_d
	mov rdx,r9
	mov QWORD [tmp],rdi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call sprintf
	mov rsp,QWORD [rsp_tmp]  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	push rax 
	add rax,QWORD [tmp]
	mov rdi,rax
	sub rsp,128
	mov rdi,rsp
	mov rsi,fmt_d
	mov rdx,r8
	mov QWORD [tmp],rdi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call sprintf
	mov rsp,QWORD [rsp_tmp]  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	push rax 
	add rax,QWORD [tmp]
	mov rdi,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,11
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_958
	LB_959: db 112,114,115,95,101,114,114,32,0
LB_958:
	lea rsi,[LB_959+8-1]
	mov rcx,8
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	jmp LB_960
	LB_961: db 45,0
LB_960:
	lea rsi,[LB_961+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	jmp LB_962
	LB_963: db 58,0
LB_962:
	lea rsi,[LB_963+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_964
	LB_965: db 10,0
LB_964:
	lea rsi,[LB_965+1-1]
	mov rcx,1
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1156~1'(= {| l |} ) %1155~0'(= {| l |} ) %1154~4'(= {| l |} ) %1153~3'(= r ) %1152~2'(= r ) 
; ∎ 1'(= {| l |} )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 4'(= {| l |} )
	mov rdi,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= r )
; .dlt.ptn 2'(= r )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_957:
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_966
LB_966:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1150~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,0
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
	ret
ETR_196:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_196
	ret
GRM_196:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_969
LB_968:
	add r14,1 
LB_969:
	cmp r14,r9
	jge LB_970
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_968
	cmp rax,32 
	jz LB_968
LB_970
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_973
	jmp LB_974
LB_973:
	mov r8,unt_1
	jmp LB_971
LB_974:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_975
	jmp LB_976
LB_975:
	mov r8,unt_1
	jmp LB_971
LB_976:
	add r14,1
	jmp LB_972
LB_971:
	lea rsp,[rsp+8*0]
	jmp LB_967
LB_972:
	jmp LB_978
LB_977:
	add r14,1 
LB_978:
	cmp r14,r9
	jge LB_979
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_977
	cmp rax,32 
	jz LB_977
LB_979
	call GRM_197
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_982
	jmp LB_983
LB_982:
	jmp LB_980
LB_983:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_981
LB_980:
	lea rsp,[rsp+8*0]
	jmp LB_967
LB_981:
	jmp LB_985
LB_984:
	add r14,1 
LB_985:
	cmp r14,r9
	jge LB_986
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_984
	cmp rax,32 
	jz LB_984
LB_986
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_989
	jmp LB_990
LB_989:
	mov r8,unt_1
	jmp LB_987
LB_990:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_991
	jmp LB_992
LB_991:
	mov r8,unt_1
	jmp LB_987
LB_992:
	add r14,1
	jmp LB_988
LB_987:
	lea rsp,[rsp+8*1]
	jmp LB_967
LB_988:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_994
LB_994
;; rsp=1 , %1159~1'(= r ) %1158~0'(= r ) %1157~8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; #78 8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1160~0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %1159~1'(= r ) %1158~0'(= r ) 
; #22 0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1161~0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %1159~1'(= r ) %1158~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_993
LB_993:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_967
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_967:
	jmp LB_997
LB_996:
	add r14,1 
LB_997:
	cmp r14,r9
	jge LB_998
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_996
	cmp rax,32 
	jz LB_996
LB_998
	call GRM_199
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1001
	jmp LB_1002
LB_1001:
	jmp LB_999
LB_1002:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1000
LB_999:
	lea rsp,[rsp+8*0]
	jmp LB_995
LB_1000:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1004
LB_1004
;; rsp=1 , %1164~1'(= r ) %1163~0'(= r ) %1162~8'(= a14◂ [ a9◂ [ ]{| l |}] ) 
; #77 8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1165~1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) %1164~1'(= r ) %1163~0'(= r ) 
; #22 1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1166~0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) %1164~1'(= r ) %1163~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1003
LB_1003:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_995
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_995:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_197:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_197
	ret
GRM_197:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1007
LB_1006:
	add r14,1 
LB_1007:
	cmp r14,r9
	jge LB_1008
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1006
	cmp rax,32 
	jz LB_1006
LB_1008
	call GRM_196
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1011
	jmp LB_1012
LB_1011:
	jmp LB_1009
LB_1012:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1010
LB_1009:
	lea rsp,[rsp+8*0]
	jmp LB_1005
LB_1010:
	jmp LB_1014
LB_1013:
	add r14,1 
LB_1014:
	cmp r14,r9
	jge LB_1015
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1013
	cmp rax,32 
	jz LB_1013
LB_1015
	call GRM_197
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1018
	jmp LB_1019
LB_1018:
	jmp LB_1016
LB_1019:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1017
LB_1016:
	lea rsp,[rsp+8*1]
	jmp LB_1005
LB_1017:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1021
LB_1021
;; rsp=2 , %1170~1'(= r ) %1169~0'(= r ) %1168~9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %1167~8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; #21 { 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1171~0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } %1170~1'(= r ) %1169~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1172~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } %1170~1'(= r ) %1169~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1020
LB_1020:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1005
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1005:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1024
LB_1024
;; rsp=0 , %1174~1'(= r ) %1173~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1175~1(<2)◂{ } %1174~1'(= r ) %1173~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1176~0(<2)◂1(<2)◂{ } %1174~1'(= r ) %1173~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1023
LB_1023:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1022
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1022:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_198:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_198
	ret
GRM_198:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1027
LB_1026:
	add r14,1 
LB_1027:
	cmp r14,r9
	jge LB_1028
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1026
	cmp rax,32 
	jz LB_1026
LB_1028
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1031
	jmp LB_1032
LB_1031:
	mov r8,unt_1
	jmp LB_1029
LB_1032:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1033
	jmp LB_1034
LB_1033:
	mov r8,unt_1
	jmp LB_1029
LB_1034:
	add r14,1
	jmp LB_1030
LB_1029:
	lea rsp,[rsp+8*0]
	jmp LB_1025
LB_1030:
	jmp LB_1036
LB_1035:
	add r14,1 
LB_1036:
	cmp r14,r9
	jge LB_1037
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1035
	cmp rax,32 
	jz LB_1035
LB_1037
	call GRM_199
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1040
	jmp LB_1041
LB_1040:
	jmp LB_1038
LB_1041:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1039
LB_1038:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1039:
	jmp LB_1043
LB_1042:
	add r14,1 
LB_1043:
	cmp r14,r9
	jge LB_1044
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1042
	cmp rax,32 
	jz LB_1042
LB_1044
	call GRM_198
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1047
	jmp LB_1048
LB_1047:
	jmp LB_1045
LB_1048:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1046
LB_1045:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1046:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1050
LB_1050
;; rsp=2 , %1180~1'(= r ) %1179~0'(= r ) %1178~9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1177~8'(= a14◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1181~0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1180~1'(= r ) %1179~0'(= r ) 
; #22 0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1182~0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1180~1'(= r ) %1179~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1049
LB_1049:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1025
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1025:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1053
LB_1053
;; rsp=0 , %1184~1'(= r ) %1183~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1185~1(<2)◂{ } %1184~1'(= r ) %1183~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1186~0(<2)◂1(<2)◂{ } %1184~1'(= r ) %1183~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1052
LB_1052:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1051
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1051:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_199:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_199
	ret
GRM_199:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1056
LB_1055:
	add r14,1 
LB_1056:
	cmp r14,r9
	jge LB_1057
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1055
	cmp rax,32 
	jz LB_1055
LB_1057
	call GRM_188
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1060
	jmp LB_1061
LB_1060:
	jmp LB_1058
LB_1061:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1059
LB_1058:
	lea rsp,[rsp+8*0]
	jmp LB_1054
LB_1059:
	jmp LB_1063
LB_1062:
	add r14,1 
LB_1063:
	cmp r14,r9
	jge LB_1064
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1062
	cmp rax,32 
	jz LB_1062
LB_1064
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1067
	jmp LB_1068
LB_1067:
	mov r8,unt_1
	jmp LB_1065
LB_1068:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1069
	cmp BYTE [rdi+1],151
	jnz LB_1069
	cmp BYTE [rdi+2],130
	jnz LB_1069
	jmp LB_1070
LB_1069:
	mov r8,unt_1
	jmp LB_1065
LB_1070:
	add r14,3
	jmp LB_1066
LB_1065:
	lea rsp,[rsp+8*1]
	jmp LB_1054
LB_1066:
	jmp LB_1072
LB_1071:
	add r14,1 
LB_1072:
	cmp r14,r9
	jge LB_1073
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1071
	cmp rax,32 
	jz LB_1071
LB_1073
	call GRM_196
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1076
	jmp LB_1077
LB_1076:
	jmp LB_1074
LB_1077:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1075
LB_1074:
	lea rsp,[rsp+8*1]
	jmp LB_1054
LB_1075:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1079
LB_1079
;; rsp=2 , %1190~1'(= r ) %1189~0'(= r ) %1188~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1187~8'(= a9◂ [ ] ) 
; #95 { 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1191~0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1190~1'(= r ) %1189~0'(= r ) 
; #22 0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1192~0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1190~1'(= r ) %1189~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1078
LB_1078:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1054
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1054:
	jmp LB_1082
LB_1081:
	add r14,1 
LB_1082:
	cmp r14,r9
	jge LB_1083
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1081
	cmp rax,32 
	jz LB_1081
LB_1083
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1086
	jmp LB_1087
LB_1086:
	mov r8,unt_1
	jmp LB_1084
LB_1087:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1088
	cmp BYTE [rdi+1],91
	jnz LB_1088
	jmp LB_1089
LB_1088:
	mov r8,unt_1
	jmp LB_1084
LB_1089:
	add r14,2
	jmp LB_1085
LB_1084:
	lea rsp,[rsp+8*0]
	jmp LB_1080
LB_1085:
	jmp LB_1091
LB_1090:
	add r14,1 
LB_1091:
	cmp r14,r9
	jge LB_1092
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1090
	cmp rax,32 
	jz LB_1090
LB_1092
	call GRM_189
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1095
	jmp LB_1096
LB_1095:
	jmp LB_1093
LB_1096:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1094
LB_1093:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1094:
	jmp LB_1098
LB_1097:
	add r14,1 
LB_1098:
	cmp r14,r9
	jge LB_1099
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1097
	cmp rax,32 
	jz LB_1097
LB_1099
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1102
	jmp LB_1103
LB_1102:
	mov r8,unt_1
	jmp LB_1100
LB_1103:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_1104
	jmp LB_1105
LB_1104:
	mov r8,unt_1
	jmp LB_1100
LB_1105:
	add r14,1
	jmp LB_1101
LB_1100:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1101:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1107
LB_1107
;; rsp=1 , %1195~1'(= r ) %1194~0'(= r ) %1193~8'(= a11◂ [ a9◂ [ ]] ) 
; #94 8'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<4)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1196~1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) %1195~1'(= r ) %1194~0'(= r ) 
; #22 1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1197~0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) %1195~1'(= r ) %1194~0'(= r ) 
; ∎ 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1106
LB_1106:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1080
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1080:
	jmp LB_1110
LB_1109:
	add r14,1 
LB_1110:
	cmp r14,r9
	jge LB_1111
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1109
	cmp rax,32 
	jz LB_1109
LB_1111
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1114
	jmp LB_1115
LB_1114:
	mov r8,unt_1
	jmp LB_1112
LB_1115:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1116
	jmp LB_1117
LB_1116:
	mov r8,unt_1
	jmp LB_1112
LB_1117:
	add r14,1
	jmp LB_1113
LB_1112:
	lea rsp,[rsp+8*0]
	jmp LB_1108
LB_1113:
	jmp LB_1119
LB_1118:
	add r14,1 
LB_1119:
	cmp r14,r9
	jge LB_1120
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1118
	cmp rax,32 
	jz LB_1118
LB_1120
	call GRM_76
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1123
	jmp LB_1124
LB_1123:
	jmp LB_1121
LB_1124:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1122
LB_1121:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1122:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1126
LB_1126
;; rsp=1 , %1200~1'(= r ) %1199~0'(= r ) %1198~8'(= {| l |} ) 
; #92 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1201~3(<4)◂8'(= {| l |} ) %1200~1'(= r ) %1199~0'(= r ) 
; #22 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1202~0(<2)◂3(<4)◂8'(= {| l |} ) %1200~1'(= r ) %1199~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1125
LB_1125:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1108
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1108:
	jmp LB_1129
LB_1128:
	add r14,1 
LB_1129:
	cmp r14,r9
	jge LB_1130
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1128
	cmp rax,32 
	jz LB_1128
LB_1130
	call GRM_76
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1133
	jmp LB_1134
LB_1133:
	jmp LB_1131
LB_1134:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1132
LB_1131:
	lea rsp,[rsp+8*0]
	jmp LB_1127
LB_1132:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1136
LB_1136
;; rsp=1 , %1205~1'(= r ) %1204~0'(= r ) %1203~8'(= {| l |} ) 
; #92 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1206~3(<4)◂8'(= {| l |} ) %1205~1'(= r ) %1204~0'(= r ) 
; #22 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1207~0(<2)◂3(<4)◂8'(= {| l |} ) %1205~1'(= r ) %1204~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1135
LB_1135:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1127
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1127:
	jmp LB_1139
LB_1138:
	add r14,1 
LB_1139:
	cmp r14,r9
	jge LB_1140
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1138
	cmp rax,32 
	jz LB_1138
LB_1140
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1143
	jmp LB_1144
LB_1143:
	mov r8,unt_1
	jmp LB_1141
LB_1144:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_1145
	jmp LB_1146
LB_1145:
	mov r8,unt_1
	jmp LB_1141
LB_1146:
	add r14,1
	jmp LB_1142
LB_1141:
	lea rsp,[rsp+8*0]
	jmp LB_1137
LB_1142:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1148
LB_1148
;; rsp=0 , %1209~1'(= r ) %1208~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1210~1(<2)◂{ } %1209~1'(= r ) %1208~0'(= r ) 
; #93 1(<2)◂{ } ⊢ 2(<4)◂1(<2)◂{ }
;; rsp=0 , %1211~2(<4)◂1(<2)◂{ } %1209~1'(= r ) %1208~0'(= r ) 
; #22 2(<4)◂1(<2)◂{ } ⊢ 0(<2)◂2(<4)◂1(<2)◂{ }
;; rsp=0 , %1212~0(<2)◂2(<4)◂1(<2)◂{ } %1209~1'(= r ) %1208~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂2(<4)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1147
LB_1147:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1137
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1137:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_200:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_200
	ret
GRM_200:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1151
LB_1150:
	add r14,1 
LB_1151:
	cmp r14,r9
	jge LB_1152
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1150
	cmp rax,32 
	jz LB_1150
LB_1152
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1155
	jmp LB_1156
LB_1155:
	mov r8,unt_1
	jmp LB_1153
LB_1156:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1157
	jmp LB_1158
LB_1157:
	mov r8,unt_1
	jmp LB_1153
LB_1158:
	add r14,1
	jmp LB_1154
LB_1153:
	lea rsp,[rsp+8*0]
	jmp LB_1149
LB_1154:
	jmp LB_1160
LB_1159:
	add r14,1 
LB_1160:
	cmp r14,r9
	jge LB_1161
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1159
	cmp rax,32 
	jz LB_1159
LB_1161
	call GRM_201
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1164
	jmp LB_1165
LB_1164:
	jmp LB_1162
LB_1165:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1163
LB_1162:
	lea rsp,[rsp+8*0]
	jmp LB_1149
LB_1163:
	jmp LB_1167
LB_1166:
	add r14,1 
LB_1167:
	cmp r14,r9
	jge LB_1168
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1166
	cmp rax,32 
	jz LB_1166
LB_1168
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1171
	jmp LB_1172
LB_1171:
	mov r8,unt_1
	jmp LB_1169
LB_1172:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1173
	jmp LB_1174
LB_1173:
	mov r8,unt_1
	jmp LB_1169
LB_1174:
	add r14,1
	jmp LB_1170
LB_1169:
	lea rsp,[rsp+8*1]
	jmp LB_1149
LB_1170:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1176
LB_1176
;; rsp=1 , %1215~1'(= r ) %1214~0'(= r ) %1213~8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
; #78 8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1216~0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %1215~1'(= r ) %1214~0'(= r ) 
; #22 0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1217~0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %1215~1'(= r ) %1214~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1175
LB_1175:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1149
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1149:
	jmp LB_1179
LB_1178:
	add r14,1 
LB_1179:
	cmp r14,r9
	jge LB_1180
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1178
	cmp rax,32 
	jz LB_1178
LB_1180
	call GRM_203
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1183
	jmp LB_1184
LB_1183:
	jmp LB_1181
LB_1184:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1182
LB_1181:
	lea rsp,[rsp+8*0]
	jmp LB_1177
LB_1182:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1186
LB_1186
;; rsp=1 , %1220~1'(= r ) %1219~0'(= r ) %1218~8'(= a12◂ [ a9◂ [ ]{| l |}] ) 
; #77 8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1221~1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) %1220~1'(= r ) %1219~0'(= r ) 
; #22 1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1222~0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) %1220~1'(= r ) %1219~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1185
LB_1185:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1177
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1177:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_201:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_201
	ret
GRM_201:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1189
LB_1188:
	add r14,1 
LB_1189:
	cmp r14,r9
	jge LB_1190
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1188
	cmp rax,32 
	jz LB_1188
LB_1190
	call GRM_200
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1193
	jmp LB_1194
LB_1193:
	jmp LB_1191
LB_1194:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1192
LB_1191:
	lea rsp,[rsp+8*0]
	jmp LB_1187
LB_1192:
	jmp LB_1196
LB_1195:
	add r14,1 
LB_1196:
	cmp r14,r9
	jge LB_1197
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1195
	cmp rax,32 
	jz LB_1195
LB_1197
	call GRM_201
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1200
	jmp LB_1201
LB_1200:
	jmp LB_1198
LB_1201:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1199
LB_1198:
	lea rsp,[rsp+8*1]
	jmp LB_1187
LB_1199:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1203
LB_1203
;; rsp=2 , %1226~1'(= r ) %1225~0'(= r ) %1224~9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %1223~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #21 { 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1227~0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } %1226~1'(= r ) %1225~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1228~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } %1226~1'(= r ) %1225~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1202
LB_1202:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1187
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1187:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1206
LB_1206
;; rsp=0 , %1230~1'(= r ) %1229~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1231~1(<2)◂{ } %1230~1'(= r ) %1229~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1232~0(<2)◂1(<2)◂{ } %1230~1'(= r ) %1229~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1205
LB_1205:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1204
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1204:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_202:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_202
	ret
GRM_202:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1209
LB_1208:
	add r14,1 
LB_1209:
	cmp r14,r9
	jge LB_1210
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1208
	cmp rax,32 
	jz LB_1208
LB_1210
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1213
	jmp LB_1214
LB_1213:
	mov r8,unt_1
	jmp LB_1211
LB_1214:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1215
	jmp LB_1216
LB_1215:
	mov r8,unt_1
	jmp LB_1211
LB_1216:
	add r14,1
	jmp LB_1212
LB_1211:
	lea rsp,[rsp+8*0]
	jmp LB_1207
LB_1212:
	jmp LB_1218
LB_1217:
	add r14,1 
LB_1218:
	cmp r14,r9
	jge LB_1219
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1217
	cmp rax,32 
	jz LB_1217
LB_1219
	call GRM_203
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1222
	jmp LB_1223
LB_1222:
	jmp LB_1220
LB_1223:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1221
LB_1220:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1221:
	jmp LB_1225
LB_1224:
	add r14,1 
LB_1225:
	cmp r14,r9
	jge LB_1226
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1224
	cmp rax,32 
	jz LB_1224
LB_1226
	call GRM_202
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1229
	jmp LB_1230
LB_1229:
	jmp LB_1227
LB_1230:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1228
LB_1227:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1228:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1232
LB_1232
;; rsp=2 , %1236~1'(= r ) %1235~0'(= r ) %1234~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1233~8'(= a12◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1237~0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1236~1'(= r ) %1235~0'(= r ) 
; #22 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1238~0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1236~1'(= r ) %1235~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1231
LB_1231:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1207
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1207:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1235
LB_1235
;; rsp=0 , %1240~1'(= r ) %1239~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1241~1(<2)◂{ } %1240~1'(= r ) %1239~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1242~0(<2)◂1(<2)◂{ } %1240~1'(= r ) %1239~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1234
LB_1234:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1233
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1233:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_203:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_203
	ret
GRM_203:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1238
LB_1237:
	add r14,1 
LB_1238:
	cmp r14,r9
	jge LB_1239
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1237
	cmp rax,32 
	jz LB_1237
LB_1239
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1242
	jmp LB_1243
LB_1242:
	mov r8,unt_1
	jmp LB_1240
LB_1243:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1244
	cmp BYTE [rdi+1],91
	jnz LB_1244
	jmp LB_1245
LB_1244:
	mov r8,unt_1
	jmp LB_1240
LB_1245:
	add r14,2
	jmp LB_1241
LB_1240:
	lea rsp,[rsp+8*0]
	jmp LB_1236
LB_1241:
	jmp LB_1247
LB_1246:
	add r14,1 
LB_1247:
	cmp r14,r9
	jge LB_1248
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1246
	cmp rax,32 
	jz LB_1246
LB_1248
	call GRM_189
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1251
	jmp LB_1252
LB_1251:
	jmp LB_1249
LB_1252:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1250
LB_1249:
	lea rsp,[rsp+8*0]
	jmp LB_1236
LB_1250:
	jmp LB_1254
LB_1253:
	add r14,1 
LB_1254:
	cmp r14,r9
	jge LB_1255
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1253
	cmp rax,32 
	jz LB_1253
LB_1255
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1258
	jmp LB_1259
LB_1258:
	mov r8,unt_1
	jmp LB_1256
LB_1259:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_1260
	jmp LB_1261
LB_1260:
	mov r8,unt_1
	jmp LB_1256
LB_1261:
	add r14,1
	jmp LB_1257
LB_1256:
	lea rsp,[rsp+8*1]
	jmp LB_1236
LB_1257:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1263
LB_1263
;; rsp=1 , %1245~1'(= r ) %1244~0'(= r ) %1243~8'(= a11◂ [ a9◂ [ ]] ) 
; #91 8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1246~0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) %1245~1'(= r ) %1244~0'(= r ) 
; #22 0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1247~0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) %1245~1'(= r ) %1244~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1262
LB_1262:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1236
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1236:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1267
	jmp LB_1268
LB_1267:
	mov r8,unt_1
	jmp LB_1265
LB_1268:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1269
	jmp LB_1270
LB_1269:
	mov r8,unt_1
	jmp LB_1265
LB_1270:
	add r14,1
	jmp LB_1266
LB_1265:
	lea rsp,[rsp+8*0]
	jmp LB_1264
LB_1266:
	call GRM_76
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1273
	jmp LB_1274
LB_1273:
	jmp LB_1271
LB_1274:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1272
LB_1271:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1272:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1276
LB_1276
;; rsp=1 , %1250~1'(= r ) %1249~0'(= r ) %1248~8'(= {| l |} ) 
; #90 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1251~1(<2)◂8'(= {| l |} ) %1250~1'(= r ) %1249~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1252~0(<2)◂1(<2)◂8'(= {| l |} ) %1250~1'(= r ) %1249~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1275
LB_1275:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1264
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1264:
	jmp LB_1279
LB_1278:
	add r14,1 
LB_1279:
	cmp r14,r9
	jge LB_1280
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1278
	cmp rax,32 
	jz LB_1278
LB_1280
	call GRM_76
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1283
	jmp LB_1284
LB_1283:
	jmp LB_1281
LB_1284:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1282
LB_1281:
	lea rsp,[rsp+8*0]
	jmp LB_1277
LB_1282:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1286
LB_1286
;; rsp=1 , %1255~1'(= r ) %1254~0'(= r ) %1253~8'(= {| l |} ) 
; #90 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1256~1(<2)◂8'(= {| l |} ) %1255~1'(= r ) %1254~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1257~0(<2)◂1(<2)◂8'(= {| l |} ) %1255~1'(= r ) %1254~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1285
LB_1285:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1277
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1277:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_204:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_204
	ret
GRM_204:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1289
LB_1288:
	add r14,1 
LB_1289:
	cmp r14,r9
	jge LB_1290
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1288
	cmp rax,32 
	jz LB_1288
LB_1290
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1293
	jmp LB_1294
LB_1293:
	mov r8,unt_1
	jmp LB_1291
LB_1294:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1295
	jmp LB_1296
LB_1295:
	mov r8,unt_1
	jmp LB_1291
LB_1296:
	add r14,1
	jmp LB_1292
LB_1291:
	lea rsp,[rsp+8*0]
	jmp LB_1287
LB_1292:
	jmp LB_1298
LB_1297:
	add r14,1 
LB_1298:
	cmp r14,r9
	jge LB_1299
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1297
	cmp rax,32 
	jz LB_1297
LB_1299
	call GRM_205
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1302
	jmp LB_1303
LB_1302:
	jmp LB_1300
LB_1303:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1301
LB_1300:
	lea rsp,[rsp+8*0]
	jmp LB_1287
LB_1301:
	jmp LB_1305
LB_1304:
	add r14,1 
LB_1305:
	cmp r14,r9
	jge LB_1306
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1304
	cmp rax,32 
	jz LB_1304
LB_1306
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1309
	jmp LB_1310
LB_1309:
	mov r8,unt_1
	jmp LB_1307
LB_1310:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1311
	jmp LB_1312
LB_1311:
	mov r8,unt_1
	jmp LB_1307
LB_1312:
	add r14,1
	jmp LB_1308
LB_1307:
	lea rsp,[rsp+8*1]
	jmp LB_1287
LB_1308:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1314
LB_1314
;; rsp=1 , %1260~1'(= r ) %1259~0'(= r ) %1258~8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
; #78 8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
;; rsp=1 , %1261~0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1260~1'(= r ) %1259~0'(= r ) 
; #22 0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
;; rsp=1 , %1262~0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1260~1'(= r ) %1259~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1313
LB_1313:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1287
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1287:
	jmp LB_1317
LB_1316:
	add r14,1 
LB_1317:
	cmp r14,r9
	jge LB_1318
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1316
	cmp rax,32 
	jz LB_1316
LB_1318
	call GRM_208
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1321
	jmp LB_1322
LB_1321:
	jmp LB_1319
LB_1322:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1320
LB_1319:
	lea rsp,[rsp+8*0]
	jmp LB_1315
LB_1320:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1324
LB_1324
;; rsp=1 , %1265~1'(= r ) %1264~0'(= r ) %1263~8'(= a13◂ [ {| l |}] ) 
; #77 8'(= a13◂ [ {| l |}] ) ⊢ 1(<2)◂8'(= a13◂ [ {| l |}] )
;; rsp=1 , %1266~1(<2)◂8'(= a13◂ [ {| l |}] ) %1265~1'(= r ) %1264~0'(= r ) 
; #22 1(<2)◂8'(= a13◂ [ {| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] )
;; rsp=1 , %1267~0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] ) %1265~1'(= r ) %1264~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1323
LB_1323:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1315
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1315:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_205:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_205
	ret
GRM_205:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1327
LB_1326:
	add r14,1 
LB_1327:
	cmp r14,r9
	jge LB_1328
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1326
	cmp rax,32 
	jz LB_1326
LB_1328
	call GRM_204
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1331
	jmp LB_1332
LB_1331:
	jmp LB_1329
LB_1332:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1330
LB_1329:
	lea rsp,[rsp+8*0]
	jmp LB_1325
LB_1330:
	jmp LB_1334
LB_1333:
	add r14,1 
LB_1334:
	cmp r14,r9
	jge LB_1335
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1333
	cmp rax,32 
	jz LB_1333
LB_1335
	call GRM_205
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1338
	jmp LB_1339
LB_1338:
	jmp LB_1336
LB_1339:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1337
LB_1336:
	lea rsp,[rsp+8*1]
	jmp LB_1325
LB_1337:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1341
LB_1341
;; rsp=2 , %1271~1'(= r ) %1270~0'(= r ) %1269~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1268~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #21 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1272~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1271~1'(= r ) %1270~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1273~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1271~1'(= r ) %1270~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1340
LB_1340:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1325
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1325:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1344
LB_1344
;; rsp=0 , %1275~1'(= r ) %1274~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1276~1(<2)◂{ } %1275~1'(= r ) %1274~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1277~0(<2)◂1(<2)◂{ } %1275~1'(= r ) %1274~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1343
LB_1343:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1342
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1342:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_206:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_206
	ret
GRM_206:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1347
LB_1346:
	add r14,1 
LB_1347:
	cmp r14,r9
	jge LB_1348
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1346
	cmp rax,32 
	jz LB_1346
LB_1348
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1351
	jmp LB_1352
LB_1351:
	mov r8,unt_1
	jmp LB_1349
LB_1352:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1353
	jmp LB_1354
LB_1353:
	mov r8,unt_1
	jmp LB_1349
LB_1354:
	add r14,1
	jmp LB_1350
LB_1349:
	lea rsp,[rsp+8*0]
	jmp LB_1345
LB_1350:
	jmp LB_1356
LB_1355:
	add r14,1 
LB_1356:
	cmp r14,r9
	jge LB_1357
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1355
	cmp rax,32 
	jz LB_1355
LB_1357
	call GRM_204
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1360
	jmp LB_1361
LB_1360:
	jmp LB_1358
LB_1361:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1359
LB_1358:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1359:
	jmp LB_1363
LB_1362:
	add r14,1 
LB_1363:
	cmp r14,r9
	jge LB_1364
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1362
	cmp rax,32 
	jz LB_1362
LB_1364
	call GRM_206
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1367
	jmp LB_1368
LB_1367:
	jmp LB_1365
LB_1368:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1366
LB_1365:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1366:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1370
LB_1370
;; rsp=2 , %1281~1'(= r ) %1280~0'(= r ) %1279~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1278~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #21 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1282~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1281~1'(= r ) %1280~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1283~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1281~1'(= r ) %1280~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1369
LB_1369:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1345
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1345:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1373
LB_1373
;; rsp=0 , %1285~1'(= r ) %1284~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1286~1(<2)◂{ } %1285~1'(= r ) %1284~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1287~0(<2)◂1(<2)◂{ } %1285~1'(= r ) %1284~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1372
LB_1372:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1371
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1371:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_207:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_207
	ret
GRM_207:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1376
LB_1375:
	add r14,1 
LB_1376:
	cmp r14,r9
	jge LB_1377
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1375
	cmp rax,32 
	jz LB_1375
LB_1377
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1380
	jmp LB_1381
LB_1380:
	mov r8,unt_1
	jmp LB_1378
LB_1381:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1382
	jmp LB_1383
LB_1382:
	mov r8,unt_1
	jmp LB_1378
LB_1383:
	add r14,1
	jmp LB_1379
LB_1378:
	lea rsp,[rsp+8*0]
	jmp LB_1374
LB_1379:
	jmp LB_1385
LB_1384:
	add r14,1 
LB_1385:
	cmp r14,r9
	jge LB_1386
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1384
	cmp rax,32 
	jz LB_1384
LB_1386
	call GRM_208
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1389
	jmp LB_1390
LB_1389:
	jmp LB_1387
LB_1390:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1388
LB_1387:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1388:
	jmp LB_1392
LB_1391:
	add r14,1 
LB_1392:
	cmp r14,r9
	jge LB_1393
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1391
	cmp rax,32 
	jz LB_1391
LB_1393
	call GRM_207
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1396
	jmp LB_1397
LB_1396:
	jmp LB_1394
LB_1397:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1395
LB_1394:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1395:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1399
LB_1399
;; rsp=2 , %1291~1'(= r ) %1290~0'(= r ) %1289~9'(= a2◂ [ a13◂ [ {| l |}]] ) %1288~8'(= a13◂ [ {| l |}] ) 
; #21 { 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1292~0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1291~1'(= r ) %1290~0'(= r ) 
; #22 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1293~0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1291~1'(= r ) %1290~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1398
LB_1398:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1374
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1374:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1402
LB_1402
;; rsp=0 , %1295~1'(= r ) %1294~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1296~1(<2)◂{ } %1295~1'(= r ) %1294~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1297~0(<2)◂1(<2)◂{ } %1295~1'(= r ) %1294~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1401
LB_1401:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1400
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1400:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_208:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_208
	ret
GRM_208:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1406
	jmp LB_1407
LB_1406:
	mov r8,unt_1
	jmp LB_1404
LB_1407:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1408
	jmp LB_1409
LB_1408:
	mov r8,unt_1
	jmp LB_1404
LB_1409:
	add r14,1
	jmp LB_1405
LB_1404:
	lea rsp,[rsp+8*0]
	jmp LB_1403
LB_1405:
	call GRM_73
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1412
	jmp LB_1413
LB_1412:
	jmp LB_1410
LB_1413:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1411
LB_1410:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1411:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1415
LB_1415
;; rsp=1 , %1300~1'(= r ) %1299~0'(= r ) %1298~8'(= {| l |} ) 
; #88 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1301~1(<2)◂8'(= {| l |} ) %1300~1'(= r ) %1299~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1302~0(<2)◂1(<2)◂8'(= {| l |} ) %1300~1'(= r ) %1299~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1414
LB_1414:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1403
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1403:
	call GRM_73
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1419
	jmp LB_1420
LB_1419:
	jmp LB_1417
LB_1420:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1418
LB_1417:
	lea rsp,[rsp+8*0]
	jmp LB_1416
LB_1418:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1422
LB_1422
;; rsp=1 , %1305~1'(= r ) %1304~0'(= r ) %1303~8'(= {| l |} ) 
; #88 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1306~1(<2)◂8'(= {| l |} ) %1305~1'(= r ) %1304~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1307~0(<2)◂1(<2)◂8'(= {| l |} ) %1305~1'(= r ) %1304~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1421
LB_1421:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1416
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1416:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1426
	jmp LB_1427
LB_1426:
	mov r8,unt_1
	jmp LB_1424
LB_1427:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_1428
	jmp LB_1429
LB_1428:
	mov r8,unt_1
	jmp LB_1424
LB_1429:
	add r14,1
	jmp LB_1425
LB_1424:
	lea rsp,[rsp+8*0]
	jmp LB_1423
LB_1425:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1431
LB_1431
;; rsp=0 , %1309~1'(= r ) %1308~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1310~1(<2)◂{ } %1309~1'(= r ) %1308~0'(= r ) 
; #89 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1311~0(<2)◂1(<2)◂{ } %1309~1'(= r ) %1308~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1312~0(<2)◂0(<2)◂1(<2)◂{ } %1309~1'(= r ) %1308~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1430
LB_1430:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1423
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1423:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_209:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_209
	ret
GRM_209:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1434
LB_1433:
	add r14,1 
LB_1434:
	cmp r14,r9
	jge LB_1435
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1433
	cmp rax,32 
	jz LB_1433
LB_1435
	call GRM_213
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1438
	jmp LB_1439
LB_1438:
	jmp LB_1436
LB_1439:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1437
LB_1436:
	lea rsp,[rsp+8*0]
	jmp LB_1432
LB_1437:
	jmp LB_1441
LB_1440:
	add r14,1 
LB_1441:
	cmp r14,r9
	jge LB_1442
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1440
	cmp rax,32 
	jz LB_1440
LB_1442
	call GRM_212
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1445
	jmp LB_1446
LB_1445:
	jmp LB_1443
LB_1446:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1444
LB_1443:
	lea rsp,[rsp+8*1]
	jmp LB_1432
LB_1444:
	jmp LB_1448
LB_1447:
	add r14,1 
LB_1448:
	cmp r14,r9
	jge LB_1449
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1447
	cmp rax,32 
	jz LB_1447
LB_1449
	call GRM_211
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1452
	jmp LB_1453
LB_1452:
	jmp LB_1450
LB_1453:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 10'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 10'(= a3◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1451
LB_1450:
	lea rsp,[rsp+8*2]
	jmp LB_1432
LB_1451:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1455
LB_1455
;; rsp=3 , %1317~1'(= r ) %1316~0'(= r ) %1315~10'(= a3◂ [ a23◂ [ ]] ) %1314~9'(= a2◂ [ a23◂ [ ]] ) %1313~8'(= a23◂ [ ] ) 
; rsp_d=0, #185 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a23◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a23◂ [ ] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 9'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r14,rax
; .mov_ptn 8'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,QWORD [rsp-8+8*5]
	mov r13,rax
	call ETR_185

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=3 , %1318~2'(= a23◂ [ ] ) %1317~1'(= r ) %1316~0'(= r ) %1315~10'(= a3◂ [ a23◂ [ ]] ) 
;; ? 10'(= a3◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂3'(= a23◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1456
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=3 , %1320~3'(= a23◂ [ ] ) %1318~2'(= a23◂ [ ] ) %1317~1'(= r ) %1316~0'(= r ) 
; #138 { 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) }
;; rsp=3 , %1321~1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } %1317~1'(= r ) %1316~0'(= r ) 
; #22 1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) }
;; rsp=3 , %1322~0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } %1317~1'(= r ) %1316~0'(= r ) 
; ∎ 0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<5)◂{ 0'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,r9
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_1454
LB_1456:
;; ? 10'(= a3◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1318~2'(= a23◂ [ ] ) %1317~1'(= r ) %1316~0'(= r ) 
; #22 2'(= a23◂ [ ] ) ⊢ 0(<2)◂2'(= a23◂ [ ] )
;; rsp=3 , %1319~0(<2)◂2'(= a23◂ [ ] ) %1317~1'(= r ) %1316~0'(= r ) 
; ∎ 0(<2)◂2'(= a23◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_1454
LB_1454:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1432
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1432:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_210:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_210
	ret
GRM_210:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1459
LB_1458:
	add r14,1 
LB_1459:
	cmp r14,r9
	jge LB_1460
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1458
	cmp rax,32 
	jz LB_1458
LB_1460
	call GRM_209
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1463
	jmp LB_1464
LB_1463:
	jmp LB_1461
LB_1464:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1462
LB_1461:
	lea rsp,[rsp+8*0]
	jmp LB_1457
LB_1462:
	jmp LB_1466
LB_1465:
	add r14,1 
LB_1466:
	cmp r14,r9
	jge LB_1467
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1465
	cmp rax,32 
	jz LB_1465
LB_1467
	call GRM_210
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1470
	jmp LB_1471
LB_1470:
	jmp LB_1468
LB_1471:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1469
LB_1468:
	lea rsp,[rsp+8*1]
	jmp LB_1457
LB_1469:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1473
LB_1473
;; rsp=2 , %1326~1'(= r ) %1325~0'(= r ) %1324~9'(= a2◂ [ a23◂ [ ]] ) %1323~8'(= a23◂ [ ] ) 
; #21 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1327~0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1326~1'(= r ) %1325~0'(= r ) 
; #22 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1328~0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1326~1'(= r ) %1325~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1472
LB_1472:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1457
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1457:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1476
LB_1476
;; rsp=0 , %1330~1'(= r ) %1329~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1331~1(<2)◂{ } %1330~1'(= r ) %1329~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1332~0(<2)◂1(<2)◂{ } %1330~1'(= r ) %1329~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1475
LB_1475:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1474
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1474:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_211:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_211
	ret
GRM_211:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1479
LB_1478:
	add r14,1 
LB_1479:
	cmp r14,r9
	jge LB_1480
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1478
	cmp rax,32 
	jz LB_1478
LB_1480
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1483
	jmp LB_1484
LB_1483:
	mov r8,unt_1
	jmp LB_1481
LB_1484:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1485
	cmp BYTE [rdi+1],134
	jnz LB_1485
	cmp BYTE [rdi+2],146
	jnz LB_1485
	jmp LB_1486
LB_1485:
	mov r8,unt_1
	jmp LB_1481
LB_1486:
	add r14,3
	jmp LB_1482
LB_1481:
	lea rsp,[rsp+8*0]
	jmp LB_1477
LB_1482:
	jmp LB_1488
LB_1487:
	add r14,1 
LB_1488:
	cmp r14,r9
	jge LB_1489
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1487
	cmp rax,32 
	jz LB_1487
LB_1489
	call GRM_209
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1492
	jmp LB_1493
LB_1492:
	jmp LB_1490
LB_1493:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1491
LB_1490:
	lea rsp,[rsp+8*0]
	jmp LB_1477
LB_1491:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1495
LB_1495
;; rsp=1 , %1335~1'(= r ) %1334~0'(= r ) %1333~8'(= a23◂ [ ] ) 
; #22 8'(= a23◂ [ ] ) ⊢ 0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %1336~0(<2)◂8'(= a23◂ [ ] ) %1335~1'(= r ) %1334~0'(= r ) 
; #22 0(<2)◂8'(= a23◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %1337~0(<2)◂0(<2)◂8'(= a23◂ [ ] ) %1335~1'(= r ) %1334~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a23◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1494
LB_1494:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1477
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1477:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1498
LB_1498
;; rsp=0 , %1339~1'(= r ) %1338~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1340~1(<2)◂{ } %1339~1'(= r ) %1338~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1341~0(<2)◂1(<2)◂{ } %1339~1'(= r ) %1338~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1497
LB_1497:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1496
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1496:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_212:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_212
	ret
GRM_212:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1501
LB_1500:
	add r14,1 
LB_1501:
	cmp r14,r9
	jge LB_1502
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1500
	cmp rax,32 
	jz LB_1500
LB_1502
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1505
	jmp LB_1506
LB_1505:
	mov r8,unt_1
	jmp LB_1503
LB_1506:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1507
	cmp BYTE [rdi+1],151
	jnz LB_1507
	cmp BYTE [rdi+2],130
	jnz LB_1507
	jmp LB_1508
LB_1507:
	mov r8,unt_1
	jmp LB_1503
LB_1508:
	add r14,3
	jmp LB_1504
LB_1503:
	lea rsp,[rsp+8*0]
	jmp LB_1499
LB_1504:
	jmp LB_1510
LB_1509:
	add r14,1 
LB_1510:
	cmp r14,r9
	jge LB_1511
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1509
	cmp rax,32 
	jz LB_1509
LB_1511
	call GRM_213
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1514
	jmp LB_1515
LB_1514:
	jmp LB_1512
LB_1515:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1513
LB_1512:
	lea rsp,[rsp+8*0]
	jmp LB_1499
LB_1513:
	jmp LB_1517
LB_1516:
	add r14,1 
LB_1517:
	cmp r14,r9
	jge LB_1518
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1516
	cmp rax,32 
	jz LB_1516
LB_1518
	call GRM_212
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1521
	jmp LB_1522
LB_1521:
	jmp LB_1519
LB_1522:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1520
LB_1519:
	lea rsp,[rsp+8*1]
	jmp LB_1499
LB_1520:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1524
LB_1524
;; rsp=2 , %1345~1'(= r ) %1344~0'(= r ) %1343~9'(= a2◂ [ a23◂ [ ]] ) %1342~8'(= a23◂ [ ] ) 
; #21 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1346~0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1345~1'(= r ) %1344~0'(= r ) 
; #22 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1347~0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1345~1'(= r ) %1344~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1523
LB_1523:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1499
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1499:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1527
LB_1527
;; rsp=0 , %1349~1'(= r ) %1348~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1350~1(<2)◂{ } %1349~1'(= r ) %1348~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1351~0(<2)◂1(<2)◂{ } %1349~1'(= r ) %1348~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1526
LB_1526:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1525
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1525:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_213:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_213
	ret
GRM_213:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1530
LB_1529:
	add r14,1 
LB_1530:
	cmp r14,r9
	jge LB_1531
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1529
	cmp rax,32 
	jz LB_1529
LB_1531
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1534
	jmp LB_1535
LB_1534:
	mov r8,unt_1
	jmp LB_1532
LB_1535:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1536
	jmp LB_1537
LB_1536:
	mov r8,unt_1
	jmp LB_1532
LB_1537:
	add r14,1
	jmp LB_1533
LB_1532:
	lea rsp,[rsp+8*0]
	jmp LB_1528
LB_1533:
	jmp LB_1539
LB_1538:
	add r14,1 
LB_1539:
	cmp r14,r9
	jge LB_1540
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1538
	cmp rax,32 
	jz LB_1538
LB_1540
	call GRM_210
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1543
	jmp LB_1544
LB_1543:
	jmp LB_1541
LB_1544:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 8'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 8'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1542
LB_1541:
	lea rsp,[rsp+8*0]
	jmp LB_1528
LB_1542:
	jmp LB_1546
LB_1545:
	add r14,1 
LB_1546:
	cmp r14,r9
	jge LB_1547
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1545
	cmp rax,32 
	jz LB_1545
LB_1547
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1550
	jmp LB_1551
LB_1550:
	mov r8,unt_1
	jmp LB_1548
LB_1551:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1552
	jmp LB_1553
LB_1552:
	mov r8,unt_1
	jmp LB_1548
LB_1553:
	add r14,1
	jmp LB_1549
LB_1548:
	lea rsp,[rsp+8*1]
	jmp LB_1528
LB_1549:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1555
LB_1557: ; 50 { 0'(= a2◂ [ a23◂ [ ]] ) 1'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] ) : ({ _lst◂2953'(=2954'(=_t23)) _lst◂_t23 }→_lst◂_t23)
;; rsp=0 , %112~1'(= a2◂ [ a23◂ [ ]] ) %111~0'(= a2◂ [ a23◂ [ ]] ) 
;; ? 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_1558
;; rsp=0 , %111~0'(= a2◂ [ a23◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ret
LB_1558:
;; ? 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a23◂ [ ] ) 3'(= a2◂ [ a23◂ [ ]] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %114~3'(= a2◂ [ a23◂ [ ]] ) %113~2'(= a23◂ [ ] ) %111~0'(= a2◂ [ a23◂ [ ]] ) 
; #21 { 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=0 , %115~0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } %114~3'(= a2◂ [ a23◂ [ ]] ) 
; rsp_d=0, #50 { 0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 { 0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a2◂ [ a23◂ [ ]] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 3'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,r9
	mov r14,rax
	mov r10,r13
; .mov_ptn 0(<2)◂{ 2'(= a23◂ [ ] ) 4'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,r8
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	call LB_1557

;; rsp=0 , %116~0'(= a2◂ [ a23◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ret
LB_1556: ; 51 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] ) : (_lst◂_t23→_lst◂_t23)
;; rsp=0 , %117~0'(= a2◂ [ a23◂ [ ]] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %118~1(<2)◂{ } %117~0'(= a2◂ [ a23◂ [ ]] ) 
; rsp_d=0, #50 { 1(<2)◂{ } 0'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 { 1(<2)◂{ } 0'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a2◂ [ a23◂ [ ]] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	call LB_1557

;; rsp=0 , %119~0'(= a2◂ [ a23◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ret
LB_1555
;; rsp=1 , %1354~1'(= r ) %1353~0'(= r ) %1352~8'(= a2◂ [ a23◂ [ ]] ) 
; rsp_d=0, #51 8'(= a2◂ [ a23◂ [ ]] ) ⊢ 2'(= a2◂ [ a23◂ [ ]] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 8'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call LB_1556

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %1355~2'(= a2◂ [ a23◂ [ ]] ) %1354~1'(= r ) %1353~0'(= r ) 
; #139 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<5)◂2'(= a2◂ [ a23◂ [ ]] )
;; rsp=0 , %1356~0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) %1354~1'(= r ) %1353~0'(= r ) 
; #22 0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] )
;; rsp=0 , %1357~0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) %1354~1'(= r ) %1353~0'(= r ) 
; ∎ 0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<5)◂0'(= a2◂ [ a23◂ [ ]] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1554
LB_1554:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1528
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1528:
	jmp LB_1561
LB_1560:
	add r14,1 
LB_1561:
	cmp r14,r9
	jge LB_1562
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1560
	cmp rax,32 
	jz LB_1560
LB_1562
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1565
	jmp LB_1566
LB_1565:
	mov r8,unt_1
	jmp LB_1563
LB_1566:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],40
	jnz LB_1567
	jmp LB_1568
LB_1567:
	mov r8,unt_1
	jmp LB_1563
LB_1568:
	add r14,1
	jmp LB_1564
LB_1563:
	lea rsp,[rsp+8*0]
	jmp LB_1559
LB_1564:
	jmp LB_1570
LB_1569:
	add r14,1 
LB_1570:
	cmp r14,r9
	jge LB_1571
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1569
	cmp rax,32 
	jz LB_1569
LB_1571
	call GRM_209
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1574
	jmp LB_1575
LB_1574:
	jmp LB_1572
LB_1575:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1573
LB_1572:
	lea rsp,[rsp+8*0]
	jmp LB_1559
LB_1573:
	jmp LB_1577
LB_1576:
	add r14,1 
LB_1577:
	cmp r14,r9
	jge LB_1578
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1576
	cmp rax,32 
	jz LB_1576
LB_1578
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1581
	jmp LB_1582
LB_1581:
	mov r8,unt_1
	jmp LB_1579
LB_1582:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],41
	jnz LB_1583
	jmp LB_1584
LB_1583:
	mov r8,unt_1
	jmp LB_1579
LB_1584:
	add r14,1
	jmp LB_1580
LB_1579:
	lea rsp,[rsp+8*1]
	jmp LB_1559
LB_1580:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1586
LB_1586
;; rsp=1 , %1360~1'(= r ) %1359~0'(= r ) %1358~8'(= a23◂ [ ] ) 
; #22 8'(= a23◂ [ ] ) ⊢ 0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %1361~0(<2)◂8'(= a23◂ [ ] ) %1360~1'(= r ) %1359~0'(= r ) 
; ∎ 0(<2)◂8'(= a23◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1585
LB_1585:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1559
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1559:
	jmp LB_1589
LB_1588:
	add r14,1 
LB_1589:
	cmp r14,r9
	jge LB_1590
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1588
	cmp rax,32 
	jz LB_1588
LB_1590
	call GRM_214
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1593
	jmp LB_1594
LB_1593:
	jmp LB_1591
LB_1594:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1592
LB_1591:
	lea rsp,[rsp+8*0]
	jmp LB_1587
LB_1592:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1596
LB_1596
;; rsp=1 , %1364~1'(= r ) %1363~0'(= r ) %1362~8'(= {| l |} ) 
; #135 8'(= {| l |} ) ⊢ 4(<5)◂8'(= {| l |} )
;; rsp=1 , %1365~4(<5)◂8'(= {| l |} ) %1364~1'(= r ) %1363~0'(= r ) 
; #22 4(<5)◂8'(= {| l |} ) ⊢ 0(<2)◂4(<5)◂8'(= {| l |} )
;; rsp=1 , %1366~0(<2)◂4(<5)◂8'(= {| l |} ) %1364~1'(= r ) %1363~0'(= r ) 
; ∎ 0(<2)◂4(<5)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂4(<5)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 0(<2)◂4(<5)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],4
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1595
LB_1595:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1587
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1587:
	jmp LB_1599
LB_1598:
	add r14,1 
LB_1599:
	cmp r14,r9
	jge LB_1600
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1598
	cmp rax,32 
	jz LB_1598
LB_1600
	call GRM_188
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1603
	jmp LB_1604
LB_1603:
	jmp LB_1601
LB_1604:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1602
LB_1601:
	lea rsp,[rsp+8*0]
	jmp LB_1597
LB_1602:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1606
LB_1606
;; rsp=1 , %1369~1'(= r ) %1368~0'(= r ) %1367~8'(= a9◂ [ ] ) 
; #136 8'(= a9◂ [ ] ) ⊢ 3(<5)◂8'(= a9◂ [ ] )
;; rsp=1 , %1370~3(<5)◂8'(= a9◂ [ ] ) %1369~1'(= r ) %1368~0'(= r ) 
; #22 3(<5)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂3(<5)◂8'(= a9◂ [ ] )
;; rsp=1 , %1371~0(<2)◂3(<5)◂8'(= a9◂ [ ] ) %1369~1'(= r ) %1368~0'(= r ) 
; ∎ 0(<2)◂3(<5)◂8'(= a9◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3(<5)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 0(<2)◂3(<5)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1605
LB_1605:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1597
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1597:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_214:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_214
	ret
GRM_214:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	call GRM_73
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1610
	jmp LB_1611
LB_1610:
	jmp LB_1608
LB_1611:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1609
LB_1608:
	lea rsp,[rsp+8*0]
	jmp LB_1607
LB_1609:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1614
	jmp LB_1615
LB_1614:
	mov r8,unt_1
	jmp LB_1612
LB_1615:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1616
	jmp LB_1617
LB_1616:
	mov r8,unt_1
	jmp LB_1612
LB_1617:
	add r14,1
	jmp LB_1613
LB_1612:
	lea rsp,[rsp+8*1]
	jmp LB_1607
LB_1613:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1619
LB_1619
;; rsp=1 , %1374~1'(= r ) %1373~0'(= r ) %1372~8'(= {| l |} ) 
; #22 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %1375~0(<2)◂8'(= {| l |} ) %1374~1'(= r ) %1373~0'(= r ) 
; ∎ 0(<2)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; .mov_ptn 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1618
LB_1618:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1607
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1607:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_216:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_216
	ret
GRM_216:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1622
LB_1621:
	add r14,1 
LB_1622:
	cmp r14,r9
	jge LB_1623
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1621
	cmp rax,32 
	jz LB_1621
LB_1623
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1626
	jmp LB_1627
LB_1626:
	mov r8,unt_1
	jmp LB_1624
LB_1627:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1628
	jmp LB_1629
LB_1628:
	mov r8,unt_1
	jmp LB_1624
LB_1629:
	add r14,1
	jmp LB_1625
LB_1624:
	lea rsp,[rsp+8*0]
	jmp LB_1620
LB_1625:
	jmp LB_1631
LB_1630:
	add r14,1 
LB_1631:
	cmp r14,r9
	jge LB_1632
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1630
	cmp rax,32 
	jz LB_1630
LB_1632
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1635
	jmp LB_1636
LB_1635:
	jmp LB_1633
LB_1636:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1634
LB_1633:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1634:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1638
LB_1638
;; rsp=1 , %1378~1'(= r ) %1377~0'(= r ) %1376~8'(= a35◂ [ *{ }] ) 
; #192 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1379~0(<2)◂{ } %1378~1'(= r ) %1377~0'(= r ) %1376~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=1 , %1380~0(<2)◂0(<2)◂{ } %1378~1'(= r ) %1377~0'(= r ) %1376~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1637
LB_1637:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1620
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1620:
	jmp LB_1641
LB_1640:
	add r14,1 
LB_1641:
	cmp r14,r9
	jge LB_1642
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1640
	cmp rax,32 
	jz LB_1640
LB_1642
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1645
	jmp LB_1646
LB_1645:
	mov r8,unt_1
	jmp LB_1643
LB_1646:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],35
	jnz LB_1647
	cmp BYTE [rdi+1],35
	jnz LB_1647
	jmp LB_1648
LB_1647:
	mov r8,unt_1
	jmp LB_1643
LB_1648:
	add r14,2
	jmp LB_1644
LB_1643:
	lea rsp,[rsp+8*0]
	jmp LB_1639
LB_1644:
	jmp LB_1650
LB_1649:
	add r14,1 
LB_1650:
	cmp r14,r9
	jge LB_1651
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1649
	cmp rax,32 
	jz LB_1649
LB_1651
	call GRM_219
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1654
	jmp LB_1655
LB_1654:
	jmp LB_1652
LB_1655:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_1653
LB_1652:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1653:
	jmp LB_1657
LB_1656:
	add r14,1 
LB_1657:
	cmp r14,r9
	jge LB_1658
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1656
	cmp rax,32 
	jz LB_1656
LB_1658
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1661
	jmp LB_1662
LB_1661:
	jmp LB_1659
LB_1662:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1660
LB_1659:
	lea rsp,[rsp+8*2]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1660:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1664
LB_1664
;; rsp=3 , %1384~1'(= r ) %1383~0'(= r ) %1382~10'(= a35◂ [ *{ }] ) %1381~{ 8'(= r ) 9'(= r ) } 
; #192 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %1385~0(<2)◂{ } %1384~1'(= r ) %1383~0'(= r ) %1382~10'(= a35◂ [ *{ }] ) %1381~{ 8'(= r ) 9'(= r ) } 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %1386~0(<2)◂0(<2)◂{ } %1384~1'(= r ) %1383~0'(= r ) %1382~10'(= a35◂ [ *{ }] ) %1381~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 10'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .dlt.ptn { 8'(= r ) 9'(= r ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_1663
LB_1663:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1639
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1639:
	jmp LB_1667
LB_1666:
	add r14,1 
LB_1667:
	cmp r14,r9
	jge LB_1668
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1666
	cmp rax,32 
	jz LB_1666
LB_1668
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1671
	jmp LB_1672
LB_1671:
	mov r8,unt_1
	jmp LB_1669
LB_1672:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1673
	cmp BYTE [rdi+1],92
	jnz LB_1673
	jmp LB_1674
LB_1673:
	mov r8,unt_1
	jmp LB_1669
LB_1674:
	add r14,2
	jmp LB_1670
LB_1669:
	lea rsp,[rsp+8*0]
	jmp LB_1665
LB_1670:
	jmp LB_1676
LB_1675:
	add r14,1 
LB_1676:
	cmp r14,r9
	jge LB_1677
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1675
	cmp rax,32 
	jz LB_1675
LB_1677
	call GRM_219
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1680
	jmp LB_1681
LB_1680:
	jmp LB_1678
LB_1681:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_1679
LB_1678:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1679:
	jmp LB_1683
LB_1682:
	add r14,1 
LB_1683:
	cmp r14,r9
	jge LB_1684
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1682
	cmp rax,32 
	jz LB_1682
LB_1684
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1687
	jmp LB_1688
LB_1687:
	jmp LB_1685
LB_1688:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1686
LB_1685:
	lea rsp,[rsp+8*2]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_1686:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1690
LB_1690
;; rsp=3 , %1390~1'(= r ) %1389~0'(= r ) %1388~10'(= a35◂ [ *{ }] ) %1387~{ 8'(= r ) 9'(= r ) } 
; #192 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %1391~0(<2)◂{ } %1390~1'(= r ) %1389~0'(= r ) %1388~10'(= a35◂ [ *{ }] ) %1387~{ 8'(= r ) 9'(= r ) } 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %1392~0(<2)◂0(<2)◂{ } %1390~1'(= r ) %1389~0'(= r ) %1388~10'(= a35◂ [ *{ }] ) %1387~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 10'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .dlt.ptn { 8'(= r ) 9'(= r ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_1689
LB_1689:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1665
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1665:
	jmp LB_1693
LB_1692:
	add r14,1 
LB_1693:
	cmp r14,r9
	jge LB_1694
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1692
	cmp rax,32 
	jz LB_1692
LB_1694
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1697
	jmp LB_1698
LB_1697:
	mov r8,unt_1
	jmp LB_1695
LB_1698:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1699
	cmp BYTE [rdi+1],91
	jnz LB_1699
	jmp LB_1700
LB_1699:
	mov r8,unt_1
	jmp LB_1695
LB_1700:
	add r14,2
	jmp LB_1696
LB_1695:
	lea rsp,[rsp+8*0]
	jmp LB_1691
LB_1696:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1704
LB_1703:
	add r14,1 
LB_1704:
	cmp r14,r9
	jge LB_1705
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1703
	cmp rax,32 
	jz LB_1703
LB_1705
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1708
	jmp LB_1709
LB_1708:
	mov r8,unt_1
	jmp LB_1706
LB_1709:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1710
	jmp LB_1711
LB_1710:
	mov r8,unt_1
	jmp LB_1706
LB_1711:
	add r14,1
	jmp LB_1707
LB_1706:
	lea rsp,[rsp+8*0]
	jmp LB_1702
LB_1707:
	jmp LB_1713
LB_1712:
	add r14,1 
LB_1713:
	cmp r14,r9
	jge LB_1714
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1712
	cmp rax,32 
	jz LB_1712
LB_1714
	call GRM_217
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1717
	jmp LB_1718
LB_1717:
	jmp LB_1715
LB_1718:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1716
LB_1715:
	lea rsp,[rsp+8*0]
	jmp LB_1702
LB_1716:
	jmp LB_1720
LB_1719:
	add r14,1 
LB_1720:
	cmp r14,r9
	jge LB_1721
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1719
	cmp rax,32 
	jz LB_1719
LB_1721
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1724
	jmp LB_1725
LB_1724:
	jmp LB_1722
LB_1725:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1723
LB_1722:
	lea rsp,[rsp+8*1]
	jmp LB_1702
LB_1723:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1727
LB_1732: ; 52 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] ) : ({ _lst◂{ _r64 _r64 _s8 } _lst◂{ _r64 _r64 _s8 } }→_lst◂{ _r64 _r64 _s8 })
;; rsp=0 , %121~1'(= a2◂ [ *{ rr{| l |}}] ) %120~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 3'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1733
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %123~3'(= a2◂ [ *{ rr{| l |}}] ) %122~2'(= *{ rr{| l |}} ) %121~1'(= a2◂ [ *{ rr{| l |}}] ) 
; rsp_d=0, #52 { 3'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r9
	mov r13,rax
	call LB_1732

	mov r8,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*1]
;; rsp=0 , %124~0'(= a2◂ [ *{ rr{| l |}}] ) %122~2'(= *{ rr{| l |}} ) 
; #21 { 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %125~0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } 
; ∎ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 2'(= *{ rr{| l |}} ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,r8
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_1733:
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %121~1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r14
	mov r13,rax
	ret
LB_1728: ; 193 { 0'(= a35◂ [ *{ }] ) 1'(= a35◂ [ *{ }] ) } ⊢ 0'(= a35◂ [ q0] ) : ({ _t35◂{ } _t35◂{ } }→_t35◂3185'(=3188'(1)))
;; rsp=0 , %1127~1'(= a35◂ [ *{ }] ) %1126~0'(= a35◂ [ *{ }] ) 
;; ? 0'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1729
;; rsp=0 , %1129~0'(= *{ } ) %1127~1'(= a35◂ [ *{ }] ) 
;; ? 1'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1730
;; rsp=0 , %1136~1'(= *{ } ) %1129~0'(= *{ } ) 
; #192 { 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
;; rsp=0 , %1138~0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } 
; ∎ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0'(= a35◂ [ q0] )
	mov r8,r13
; .mov_ptn 0(<2)◂{ 2'(= *{ } ) 1'(= *{ } ) } ⊢ 0'(= a35◂ [ q0] )
 xor rax,rax 
	mov rdi,rt_err0 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf
	mov rsp,QWORD [rsp_tmp]
	jmp err
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_1730:
;; ? 1'(= a35◂ [ *{ }] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1135~1'(= a2◂ [ *{ rr{| l |}}] ) %1129~0'(= *{ } ) 
; #191 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1137~1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) %1129~0'(= *{ } ) 
; ∎ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= *{ } )
; .dlt.hp rcd
; .mov_ptn2 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ q0] )
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ q0] )
	mov rax,r14
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_1729:
;; ? 0'(= a35◂ [ *{ }] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1128~0'(= a2◂ [ *{ rr{| l |}}] ) %1127~1'(= a35◂ [ *{ }] ) 
;; ? 1'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1731
;; rsp=0 , %1131~1'(= *{ } ) %1128~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #191 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1134~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1131~1'(= *{ } ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= *{ } )
; .dlt.hp rcd
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ q0] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ q0] )
	mov rax,r14
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_1731:
;; ? 1'(= a35◂ [ *{ }] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1130~1'(= a2◂ [ *{ rr{| l |}}] ) %1128~0'(= a2◂ [ *{ rr{| l |}}] ) 
; rsp_d=0, #52 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
	call LB_1732

;; rsp=0 , %1132~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #191 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1133~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ q0] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ q0] )
	mov rax,r14
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_1727
;; rsp=2 , %1398~1'(= r ) %1397~0'(= r ) %1396~9'(= a35◂ [ *{ }] ) %1395~8'(= a35◂ [ *{ }] ) 
; rsp_d=0, #193 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ 2'(= a35◂ [ q0] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ { 0'(= a35◂ [ *{ }] ) 1'(= a35◂ [ *{ }] ) }
; .mov_ptn 9'(= a35◂ [ *{ }] ) ⊢ 1'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= a35◂ [ *{ }] ) ⊢ 0'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_1728

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1399~2'(= a35◂ [ q0] ) %1398~1'(= r ) %1397~0'(= r ) 
;; ? 2'(= a35◂ [ q0] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1400~2'(= a2◂ [ *{ rr{| l |}}] ) %1398~1'(= r ) %1397~0'(= r ) 
; rsp_d=0, #195 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call ETR_195

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %1403~2'(= {| l |} ) %1398~1'(= r ) %1397~0'(= r ) 
; _emt 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	jmp LB_1736
LB_1735: db 95,101,109,116,58,0
LB_1736:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1735
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1738
LB_1737: db 10,0
LB_1738:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1737
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1739
LB_1739:
;; rsp=0 , %1404~2'(= {| l |} ) %1398~1'(= r ) %1397~0'(= r ) 
; ∎| 
	jmp LB_1741
LB_1740: db 101,120,110,32,51,52,48,55,51,58,10,0
LB_1741:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1740
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
LB_1726:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1702
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1701
LB_1702:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1744
LB_1744
;; rsp=0 , %1408~1'(= r ) %1407~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	sub rsp,128
	mov rdi,rsp
	mov rsi,fmt_d
	mov rdx,r14
	mov QWORD [tmp],rdi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call sprintf
	mov rsp,QWORD [rsp_tmp]  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	push rax 
	add rax,QWORD [tmp]
	mov rdi,rax
	sub rsp,128
	mov rdi,rsp
	mov rsi,fmt_d
	mov rdx,r13
	mov QWORD [tmp],rdi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call sprintf
	mov rsp,QWORD [rsp_tmp]  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	push rax 
	add rax,QWORD [tmp]
	mov rdi,rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,11
	push rdi 
	and rdi,~111b
	add rdi,16
	mov rsi,rdi 
	mov rdi,1
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop rdi 
	mov QWORD [rax],rdi
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	jmp LB_1745
	LB_1746: db 110,108,115,95,101,114,114,32,0
LB_1745:
	lea rsi,[LB_1746+8-1]
	mov rcx,8
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	jmp LB_1747
	LB_1748: db 45,0
LB_1747:
	lea rsi,[LB_1748+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	jmp LB_1749
	LB_1750: db 58,10,0
LB_1749:
	lea rsi,[LB_1750+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1411~2'(= {| l |} ) %1410~1'(= r ) %1409~0'(= r ) 
; _emt 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	jmp LB_1752
LB_1751: db 95,101,109,116,58,0
LB_1752:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1751
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1754
LB_1753: db 10,0
LB_1754:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1753
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1755
LB_1755:
;; rsp=0 , %1412~2'(= {| l |} ) %1410~1'(= r ) %1409~0'(= r ) 
; ∎| 
	jmp LB_1757
LB_1756: db 101,120,110,32,51,52,50,50,50,58,10,0
LB_1757:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1756
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
LB_1743:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1742
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1701
LB_1742:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_1701
LB_1701:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1758
	jmp LB_1759
LB_1758:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_1759:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= q0 ) ⊢ 3'(= q0 )
	mov r10,r9
; .mov_ptn 2'(= q0 ) ⊢ 3'(= q0 )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1761
LB_1761
;; rsp=0 , %1413~3'(= q0 ) %1394~1'(= r ) %1393~0'(= r ) 
; #22 3'(= q0 ) ⊢ 0(<2)◂3'(= q0 )
;; rsp=0 , %1414~0(<2)◂3'(= q0 ) %1394~1'(= r ) %1393~0'(= r ) 
; ∎ 0(<2)◂3'(= q0 )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3'(= q0 ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂3'(= q0 ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1760
LB_1760:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1691
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1691:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1764
LB_1764
;; rsp=0 , %1416~1'(= r ) %1415~0'(= r ) 
; #192 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1417~0(<2)◂{ } %1416~1'(= r ) %1415~0'(= r ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %1418~0(<2)◂0(<2)◂{ } %1416~1'(= r ) %1415~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1763
LB_1763:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1762
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1762:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_217:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_217
	ret
GRM_217:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1767
LB_1766:
	add r14,1 
LB_1767:
	cmp r14,r9
	jge LB_1768
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1766
	cmp rax,32 
	jz LB_1766
LB_1768
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1771
	jmp LB_1772
LB_1771:
	mov r8,unt_1
	jmp LB_1769
LB_1772:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1773
	cmp BYTE [rdi+1],91
	jnz LB_1773
	jmp LB_1774
LB_1773:
	mov r8,unt_1
	jmp LB_1769
LB_1774:
	add r14,2
	jmp LB_1770
LB_1769:
	lea rsp,[rsp+8*0]
	jmp LB_1765
LB_1770:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1778
LB_1777:
	add r14,1 
LB_1778:
	cmp r14,r9
	jge LB_1779
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1777
	cmp rax,32 
	jz LB_1777
LB_1779
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1782
	jmp LB_1783
LB_1782:
	mov r8,unt_1
	jmp LB_1780
LB_1783:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1784
	jmp LB_1785
LB_1784:
	mov r8,unt_1
	jmp LB_1780
LB_1785:
	add r14,1
	jmp LB_1781
LB_1780:
	lea rsp,[rsp+8*0]
	jmp LB_1776
LB_1781:
	jmp LB_1787
LB_1786:
	add r14,1 
LB_1787:
	cmp r14,r9
	jge LB_1788
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1786
	cmp rax,32 
	jz LB_1786
LB_1788
	call GRM_217
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1791
	jmp LB_1792
LB_1791:
	jmp LB_1789
LB_1792:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1790
LB_1789:
	lea rsp,[rsp+8*0]
	jmp LB_1776
LB_1790:
	jmp LB_1794
LB_1793:
	add r14,1 
LB_1794:
	cmp r14,r9
	jge LB_1795
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1793
	cmp rax,32 
	jz LB_1793
LB_1795
	call GRM_217
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1798
	jmp LB_1799
LB_1798:
	jmp LB_1796
LB_1799:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1797
LB_1796:
	lea rsp,[rsp+8*1]
	jmp LB_1776
LB_1797:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1801
LB_1801
;; rsp=2 , %1424~1'(= r ) %1423~0'(= r ) %1422~9'(= a35◂ [ *{ }] ) %1421~8'(= a35◂ [ *{ }] ) 
; rsp_d=0, #193 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ 2'(= a35◂ [ q0] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ { 0'(= a35◂ [ *{ }] ) 1'(= a35◂ [ *{ }] ) }
; .mov_ptn 9'(= a35◂ [ *{ }] ) ⊢ 1'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= a35◂ [ *{ }] ) ⊢ 0'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_1728

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1425~2'(= a35◂ [ q0] ) %1424~1'(= r ) %1423~0'(= r ) 
;; ? 2'(= a35◂ [ q0] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1426~2'(= a2◂ [ *{ rr{| l |}}] ) %1424~1'(= r ) %1423~0'(= r ) 
; rsp_d=0, #195 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call ETR_195

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %1429~2'(= {| l |} ) %1424~1'(= r ) %1423~0'(= r ) 
; _emt 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	jmp LB_1804
LB_1803: db 95,101,109,116,58,0
LB_1804:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1803
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1806
LB_1805: db 10,0
LB_1806:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1805
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1807
LB_1807:
;; rsp=0 , %1430~2'(= {| l |} ) %1424~1'(= r ) %1423~0'(= r ) 
; ∎| 
	jmp LB_1809
LB_1808: db 101,120,110,32,51,52,54,51,50,58,10,0
LB_1809:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1808
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
LB_1800:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1776
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1775
LB_1776:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1812
LB_1812
;; rsp=0 , %1434~1'(= r ) %1433~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1435~1(<2)◂{ } %1434~1'(= r ) %1433~0'(= r ) 
	jmp LB_1813
LB_1813:
; $ %[ "blk_cmt 0" ] ⊢ %[ "blk_cmt 0" ]
;; rsp=0 , %1436~%[ "blk_cmt 0" ] %1435~1(<2)◂{ } %1434~1'(= r ) %1433~0'(= r ) 
; #21 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %1437~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #191 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %1438~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %1439~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ q0]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ q0]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r13
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,24
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,9
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*2],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],98
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],107
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],109
	mov BYTE [rax+8+6],116
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],48
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1811
LB_1811:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1810
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1775
LB_1810:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_1775
LB_1775:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1814
	jmp LB_1815
LB_1814:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_1815:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ q0] ) ⊢ 3'(= a35◂ [ q0] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ q0] ) ⊢ 3'(= a35◂ [ q0] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1817
LB_1817
;; rsp=0 , %1440~3'(= a35◂ [ q0] ) %1420~1'(= r ) %1419~0'(= r ) 
; #22 3'(= a35◂ [ q0] ) ⊢ 0(<2)◂3'(= a35◂ [ q0] )
;; rsp=0 , %1441~0(<2)◂3'(= a35◂ [ q0] ) %1420~1'(= r ) %1419~0'(= r ) 
; ∎ 0(<2)◂3'(= a35◂ [ q0] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ q0] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ q0] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1816
LB_1816:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1765
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1765:
	jmp LB_1820
LB_1819:
	add r14,1 
LB_1820:
	cmp r14,r9
	jge LB_1821
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1819
	cmp rax,32 
	jz LB_1819
LB_1821
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1824
	jmp LB_1825
LB_1824:
	mov r8,unt_1
	jmp LB_1822
LB_1825:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1826
	cmp BYTE [rdi+1],93
	jnz LB_1826
	jmp LB_1827
LB_1826:
	mov r8,unt_1
	jmp LB_1822
LB_1827:
	add r14,2
	jmp LB_1823
LB_1822:
	lea rsp,[rsp+8*0]
	jmp LB_1818
LB_1823:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1831
LB_1830:
	add r14,1 
LB_1831:
	cmp r14,r9
	jge LB_1832
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1830
	cmp rax,32 
	jz LB_1830
LB_1832
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1835
	jmp LB_1836
LB_1835:
	mov r8,unt_1
	jmp LB_1833
LB_1836:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1837
	jmp LB_1838
LB_1837:
	mov r8,unt_1
	jmp LB_1833
LB_1838:
	add r14,1
	jmp LB_1834
LB_1833:
	lea rsp,[rsp+8*0]
	jmp LB_1829
LB_1834:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1840
LB_1840
;; rsp=0 , %1445~1'(= r ) %1444~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1446~0(<2)◂{ } %1445~1'(= r ) %1444~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1839
LB_1839:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1829
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1828
LB_1829:
	jmp LB_1843
LB_1842:
	add r14,1 
LB_1843:
	cmp r14,r9
	jge LB_1844
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1842
	cmp rax,32 
	jz LB_1842
LB_1844
	cmp r14,r9
	jge LB_1847
	jmp LB_1848
LB_1847:
	mov r8,unt_1 
	jmp LB_1845
LB_1848:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1846
LB_1845:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_1828
LB_1846:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1850
LB_1850
;; rsp=1 , %1449~1'(= r ) %1448~0'(= r ) %1447~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1450~1(<2)◂{ } %1449~1'(= r ) %1448~0'(= r ) %1447~8'(= r ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1849
LB_1849:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1841
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1828
LB_1841:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1853
LB_1853
;; rsp=0 , %1452~1'(= r ) %1451~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1453~0(<2)◂{ } %1452~1'(= r ) %1451~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1852
LB_1852:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1851
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_1828
LB_1851:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_1828
LB_1828:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1854
	jmp LB_1855
LB_1854:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_1855:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1857
LB_1857
;; rsp=0 , %1454~{ } %1443~1'(= r ) %1442~0'(= r ) 
; #192 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1455~0(<2)◂{ } %1454~{ } %1443~1'(= r ) %1442~0'(= r ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %1456~0(<2)◂0(<2)◂{ } %1454~{ } %1443~1'(= r ) %1442~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .dlt.ptn { }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1856
LB_1856:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1818
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1818:
	jmp LB_1860
LB_1859:
	add r14,1 
LB_1860:
	cmp r14,r9
	jge LB_1861
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1859
	cmp rax,32 
	jz LB_1859
LB_1861
	call GRM_218
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1864
	jmp LB_1865
LB_1864:
	jmp LB_1862
LB_1865:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1863
LB_1862:
	lea rsp,[rsp+8*0]
	jmp LB_1858
LB_1863:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1867
LB_1867
;; rsp=1 , %1459~1'(= r ) %1458~0'(= r ) %1457~8'(= a35◂ [ *{ }] ) 
; #22 8'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a35◂ [ *{ }] )
;; rsp=1 , %1460~0(<2)◂8'(= a35◂ [ *{ }] ) %1459~1'(= r ) %1458~0'(= r ) 
; ∎ 0(<2)◂8'(= a35◂ [ *{ }] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1866
LB_1866:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1858
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1858:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1870
LB_1870
;; rsp=0 , %1462~1'(= r ) %1461~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1463~1(<2)◂{ } %1462~1'(= r ) %1461~0'(= r ) 
	jmp LB_1871
LB_1871:
; $ %[ "blk_cmt 1" ] ⊢ %[ "blk_cmt 1" ]
;; rsp=0 , %1464~%[ "blk_cmt 1" ] %1463~1(<2)◂{ } %1462~1'(= r ) %1461~0'(= r ) 
; #21 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %1465~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #191 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %1466~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %1467~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r13
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,24
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,9
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*2],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],98
	mov BYTE [rax+8+1],108
	mov BYTE [rax+8+2],107
	mov BYTE [rax+8+3],95
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],109
	mov BYTE [rax+8+6],116
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],49
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1869
LB_1869:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1868
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1868:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_218:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_218
	ret
GRM_218:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1874
LB_1873:
	add r14,1 
LB_1874:
	cmp r14,r9
	jge LB_1875
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1873
	cmp rax,32 
	jz LB_1873
LB_1875
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1878
	jmp LB_1879
LB_1878:
	mov r8,unt_1
	jmp LB_1876
LB_1879:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1880
	jmp LB_1881
LB_1880:
	mov r8,unt_1
	jmp LB_1876
LB_1881:
	add r14,1
	jmp LB_1877
LB_1876:
	lea rsp,[rsp+8*0]
	jmp LB_1872
LB_1877:
	jmp LB_1883
LB_1882:
	add r14,1 
LB_1883:
	cmp r14,r9
	jge LB_1884
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1882
	cmp rax,32 
	jz LB_1882
LB_1884
	call GRM_217
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1887
	jmp LB_1888
LB_1887:
	jmp LB_1885
LB_1888:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1886
LB_1885:
	lea rsp,[rsp+8*0]
	jmp LB_1872
LB_1886:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1890
LB_1890
;; rsp=1 , %1470~1'(= r ) %1469~0'(= r ) %1468~8'(= a35◂ [ *{ }] ) 
; #22 8'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a35◂ [ *{ }] )
;; rsp=1 , %1471~0(<2)◂8'(= a35◂ [ *{ }] ) %1470~1'(= r ) %1469~0'(= r ) 
; ∎ 0(<2)◂8'(= a35◂ [ *{ }] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_1889
LB_1889:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1872
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1872:
	jmp LB_1893
LB_1892:
	add r14,1 
LB_1893:
	cmp r14,r9
	jge LB_1894
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1892
	cmp rax,32 
	jz LB_1892
LB_1894
	cmp r14,r9
	jge LB_1897
	jmp LB_1898
LB_1897:
	mov r8,unt_1 
	jmp LB_1895
LB_1898:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1896
LB_1895:
	lea rsp,[rsp+8*0]
	jmp LB_1891
LB_1896:
	jmp LB_1900
LB_1899:
	add r14,1 
LB_1900:
	cmp r14,r9
	jge LB_1901
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1899
	cmp rax,32 
	jz LB_1899
LB_1901
	call GRM_218
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1904
	jmp LB_1905
LB_1904:
	jmp LB_1902
LB_1905:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1903
LB_1902:
	lea rsp,[rsp+8*1]
	jmp LB_1891
LB_1903:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1907
LB_1907
;; rsp=2 , %1475~1'(= r ) %1474~0'(= r ) %1473~9'(= a35◂ [ *{ }] ) %1472~8'(= r ) 
; #22 9'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂9'(= a35◂ [ *{ }] )
;; rsp=2 , %1476~0(<2)◂9'(= a35◂ [ *{ }] ) %1475~1'(= r ) %1474~0'(= r ) %1472~8'(= r ) 
; ∎ 0(<2)◂9'(= a35◂ [ *{ }] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂9'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂9'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_1906
LB_1906:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1891
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1891:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1910
LB_1910
;; rsp=0 , %1478~1'(= r ) %1477~0'(= r ) 
	jmp LB_1911
LB_1911:
; $ %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
;; rsp=0 , %1479~%[ "line_res_c 0" ] %1478~1'(= r ) %1477~0'(= r ) 
; _emt %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
	jmp LB_1913
LB_1912: db 95,101,109,116,58,0
LB_1913:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1912
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1915
LB_1914: db 34,108,105,110,101,95,114,101,115,95,99,32,48,34,0
LB_1915:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1914
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1917
LB_1916: db 10,0
LB_1917:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1916
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1918
LB_1918:
;; rsp=0 , %1480~%[ "line_res_c 0" ] %1478~1'(= r ) %1477~0'(= r ) 
; ∎| 
	jmp LB_1920
LB_1919: db 101,120,110,32,51,53,52,57,48,58,10,0
LB_1920:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1919
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
LB_1909:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1908
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1908:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_219:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_219
	ret
GRM_219:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1923
LB_1922:
	add r14,1 
LB_1923:
	cmp r14,r9
	jge LB_1924
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1922
	cmp rax,32 
	jz LB_1922
LB_1924
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1927
	jmp LB_1928
LB_1927:
	mov r8,unt_1
	jmp LB_1925
LB_1928:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1929
	jmp LB_1930
LB_1929:
	mov r8,unt_1
	jmp LB_1925
LB_1930:
	add r14,1
	jmp LB_1926
LB_1925:
	lea rsp,[rsp+8*0]
	jmp LB_1921
LB_1926:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1932
LB_1932
;; rsp=0 , %1482~1'(= r ) %1481~0'(= r ) 
; #22 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %1483~0(<2)◂{ 0'(= r ) 1'(= r ) } 
; ∎ 0(<2)◂{ 0'(= r ) 1'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; .mov_ptn 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,r13
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_1931
LB_1931:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1921
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1921:
	jmp LB_1935
LB_1934:
	add r14,1 
LB_1935:
	cmp r14,r9
	jge LB_1936
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1934
	cmp rax,32 
	jz LB_1934
LB_1936
	cmp r14,r9
	jge LB_1939
	jmp LB_1940
LB_1939:
	mov r8,unt_1 
	jmp LB_1937
LB_1940:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1938
LB_1937:
	lea rsp,[rsp+8*0]
	jmp LB_1933
LB_1938:
	jmp LB_1942
LB_1941:
	add r14,1 
LB_1942:
	cmp r14,r9
	jge LB_1943
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1941
	cmp rax,32 
	jz LB_1941
LB_1943
	call GRM_219
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1946
	jmp LB_1947
LB_1946:
	jmp LB_1944
LB_1947:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 9'(= r ) 10'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 9'(= r ) 10'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_1945
LB_1944:
	lea rsp,[rsp+8*1]
	jmp LB_1933
LB_1945:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1949
LB_1949
;; rsp=3 , %1488~1'(= r ) %1487~0'(= r ) %1486~10'(= r ) %1485~9'(= r ) %1484~8'(= r ) 
; #22 { 0'(= r ) 10'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 10'(= r ) }
;; rsp=3 , %1489~0(<2)◂{ 0'(= r ) 10'(= r ) } %1488~1'(= r ) %1485~9'(= r ) %1484~8'(= r ) 
; ∎ 0(<2)◂{ 0'(= r ) 10'(= r ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 9'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ 0'(= r ) 10'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; .mov_ptn 0(<2)◂{ 0'(= r ) 10'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_1948
LB_1948:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1933
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1933:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1952
LB_1952
;; rsp=0 , %1491~1'(= r ) %1490~0'(= r ) 
; #22 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %1492~0(<2)◂{ 0'(= r ) 1'(= r ) } 
; ∎ 0(<2)◂{ 0'(= r ) 1'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; .mov_ptn 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,r13
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_1951
LB_1951:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1950
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1950:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_220:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_220
	ret
GRM_220:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_1955
LB_1954:
	add r14,1 
LB_1955:
	cmp r14,r9
	jge LB_1956
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1954
	cmp rax,10 
	jz LB_1954
	cmp rax,32 
	jz LB_1954
LB_1956
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_1959
	jmp LB_1960
LB_1959:
	mov r8,unt_1
	jmp LB_1957
LB_1960:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1961
	cmp BYTE [rdi+1],167
	jnz LB_1961
	cmp BYTE [rdi+2],194
	jnz LB_1961
	cmp BYTE [rdi+3],167
	jnz LB_1961
	cmp BYTE [rdi+4],43
	jnz LB_1961
	cmp BYTE [rdi+5],115
	jnz LB_1961
	cmp BYTE [rdi+6],56
	jnz LB_1961
	jmp LB_1962
LB_1961:
	mov r8,unt_1
	jmp LB_1957
LB_1962:
	add r14,7
	jmp LB_1958
LB_1957:
	lea rsp,[rsp+8*0]
	jmp LB_1953
LB_1958:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1964
LB_1964
;; rsp=0 , %1494~1'(= r ) %1493~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1495~0(<2)◂{ } %1494~1'(= r ) %1493~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1963
LB_1963:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1953
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1953:
	jmp LB_1967
LB_1966:
	add r14,1 
LB_1967:
	cmp r14,r9
	jge LB_1968
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1966
	cmp rax,10 
	jz LB_1966
	cmp rax,32 
	jz LB_1966
LB_1968
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1971
	jmp LB_1972
LB_1971:
	mov r8,unt_1
	jmp LB_1969
LB_1972:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1973
	cmp BYTE [rdi+1],167
	jnz LB_1973
	cmp BYTE [rdi+2],194
	jnz LB_1973
	cmp BYTE [rdi+3],167
	jnz LB_1973
	jmp LB_1974
LB_1973:
	mov r8,unt_1
	jmp LB_1969
LB_1974:
	add r14,4
	jmp LB_1970
LB_1969:
	lea rsp,[rsp+8*0]
	jmp LB_1965
LB_1970:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1976
LB_1976
;; rsp=0 , %1497~1'(= r ) %1496~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1498~0(<2)◂{ } %1497~1'(= r ) %1496~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1975
LB_1975:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1965
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1965:
	jmp LB_1979
LB_1978:
	add r14,1 
LB_1979:
	cmp r14,r9
	jge LB_1980
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1978
	cmp rax,10 
	jz LB_1978
	cmp rax,32 
	jz LB_1978
LB_1980
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1983
	jmp LB_1984
LB_1983:
	mov r8,unt_1
	jmp LB_1981
LB_1984:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1985
	cmp BYTE [rdi+1],167
	jnz LB_1985
	jmp LB_1986
LB_1985:
	mov r8,unt_1
	jmp LB_1981
LB_1986:
	add r14,2
	jmp LB_1982
LB_1981:
	lea rsp,[rsp+8*0]
	jmp LB_1977
LB_1982:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1988
LB_1988
;; rsp=0 , %1500~1'(= r ) %1499~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1501~0(<2)◂{ } %1500~1'(= r ) %1499~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1987
LB_1987:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1977
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1977:
	jmp LB_1991
LB_1990:
	add r14,1 
LB_1991:
	cmp r14,r9
	jge LB_1992
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_1990
	cmp rax,10 
	jz LB_1990
	cmp rax,32 
	jz LB_1990
LB_1992
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1995
	jmp LB_1996
LB_1995:
	mov r8,unt_1
	jmp LB_1993
LB_1996:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1997
	cmp BYTE [rdi+1],182
	jnz LB_1997
	jmp LB_1998
LB_1997:
	mov r8,unt_1
	jmp LB_1993
LB_1998:
	add r14,2
	jmp LB_1994
LB_1993:
	lea rsp,[rsp+8*0]
	jmp LB_1989
LB_1994:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2000
LB_2000
;; rsp=0 , %1503~1'(= r ) %1502~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1504~0(<2)◂{ } %1503~1'(= r ) %1502~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1999
LB_1999:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_1989
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_1989:
	jmp LB_2003
LB_2002:
	add r14,1 
LB_2003:
	cmp r14,r9
	jge LB_2004
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2002
	cmp rax,10 
	jz LB_2002
	cmp rax,32 
	jz LB_2002
LB_2004
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_2007
	jmp LB_2008
LB_2007:
	mov r8,unt_1
	jmp LB_2005
LB_2008:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2009
	cmp BYTE [rdi+1],136
	jnz LB_2009
	cmp BYTE [rdi+2],142
	jnz LB_2009
	cmp BYTE [rdi+3],226
	jnz LB_2009
	cmp BYTE [rdi+4],136
	jnz LB_2009
	cmp BYTE [rdi+5],142
	jnz LB_2009
	jmp LB_2010
LB_2009:
	mov r8,unt_1
	jmp LB_2005
LB_2010:
	add r14,6
	jmp LB_2006
LB_2005:
	lea rsp,[rsp+8*0]
	jmp LB_2001
LB_2006:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2012
LB_2012
;; rsp=0 , %1506~1'(= r ) %1505~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1507~0(<2)◂{ } %1506~1'(= r ) %1505~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_2011
LB_2011:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2001
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2001:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_221:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_221
	ret
GRM_221:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2015
LB_2014:
	add r14,1 
LB_2015:
	cmp r14,r9
	jge LB_2016
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2014
	cmp rax,10 
	jz LB_2014
	cmp rax,32 
	jz LB_2014
LB_2016
	call GRM_220
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2019
	jmp LB_2020
LB_2019:
	jmp LB_2017
LB_2020:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2018
LB_2017:
	lea rsp,[rsp+8*0]
	jmp LB_2013
LB_2018:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2022
LB_2022
;; rsp=0 , %1510~1'(= r ) %1509~0'(= r ) %1508~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1511~1(<2)◂{ } %1510~1'(= r ) %1509~0'(= r ) %1508~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_2021
LB_2021:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2013
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2013:
	jmp LB_2025
LB_2024:
	add r14,1 
LB_2025:
	cmp r14,r9
	jge LB_2026
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2024
	cmp rax,10 
	jz LB_2024
	cmp rax,32 
	jz LB_2024
LB_2026
	cmp r14,r9
	jge LB_2029
	jmp LB_2030
LB_2029:
	mov r8,unt_1 
	jmp LB_2027
LB_2030:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2028
LB_2027:
	lea rsp,[rsp+8*0]
	jmp LB_2023
LB_2028:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2032
LB_2032
;; rsp=1 , %1514~1'(= r ) %1513~0'(= r ) %1512~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1515~0(<2)◂{ } %1514~1'(= r ) %1513~0'(= r ) %1512~8'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2031
LB_2031:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2023
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2023:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_222:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_222
	ret
GRM_222:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2035
LB_2034:
	add r14,1 
LB_2035:
	cmp r14,r9
	jge LB_2036
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2034
	cmp rax,10 
	jz LB_2034
	cmp rax,32 
	jz LB_2034
LB_2036
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2039
	jmp LB_2040
LB_2039:
	mov r8,unt_1
	jmp LB_2037
LB_2040:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_2041
	jmp LB_2042
LB_2041:
	mov r8,unt_1
	jmp LB_2037
LB_2042:
	add r14,1
	jmp LB_2038
LB_2037:
	lea rsp,[rsp+8*0]
	jmp LB_2033
LB_2038:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2044
LB_2044
;; rsp=0 , %1518~1'(= r ) %1517~0'(= r ) %1516~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1519~1(<2)◂{ } %1518~1'(= r ) %1517~0'(= r ) %1516~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_2043
LB_2043:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2033
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2033:
	jmp LB_2047
LB_2046:
	add r14,1 
LB_2047:
	cmp r14,r9
	jge LB_2048
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2046
	cmp rax,10 
	jz LB_2046
	cmp rax,32 
	jz LB_2046
LB_2048
	call GRM_220
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2051
	jmp LB_2052
LB_2051:
	jmp LB_2049
LB_2052:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2050
LB_2049:
	lea rsp,[rsp+8*0]
	jmp LB_2045
LB_2050:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2054
LB_2054
;; rsp=0 , %1522~1'(= r ) %1521~0'(= r ) %1520~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1523~1(<2)◂{ } %1522~1'(= r ) %1521~0'(= r ) %1520~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_2053
LB_2053:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2045
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2045:
	jmp LB_2057
LB_2056:
	add r14,1 
LB_2057:
	cmp r14,r9
	jge LB_2058
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2056
	cmp rax,10 
	jz LB_2056
	cmp rax,32 
	jz LB_2056
LB_2058
	cmp r14,r9
	jge LB_2061
	jmp LB_2062
LB_2061:
	mov r8,unt_1 
	jmp LB_2059
LB_2062:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2060
LB_2059:
	lea rsp,[rsp+8*0]
	jmp LB_2055
LB_2060:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2064
LB_2064
;; rsp=1 , %1526~1'(= r ) %1525~0'(= r ) %1524~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1527~0(<2)◂{ } %1526~1'(= r ) %1525~0'(= r ) %1524~8'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2063
LB_2063:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2055
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2055:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_223:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_223
	ret
GRM_223:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2067
LB_2066:
	add r14,1 
LB_2067:
	cmp r14,r9
	jge LB_2068
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2066
	cmp rax,10 
	jz LB_2066
	cmp rax,32 
	jz LB_2066
LB_2068
	call GRM_222
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2071
	jmp LB_2072
LB_2071:
	jmp LB_2069
LB_2072:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2070
LB_2069:
	lea rsp,[rsp+8*0]
	jmp LB_2065
LB_2070:
	jmp LB_2074
LB_2073:
	add r14,1 
LB_2074:
	cmp r14,r9
	jge LB_2075
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2073
	cmp rax,10 
	jz LB_2073
	cmp rax,32 
	jz LB_2073
LB_2075
	call GRM_223
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2078
	jmp LB_2079
LB_2078:
	jmp LB_2076
LB_2079:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2077
LB_2076:
	lea rsp,[rsp+8*0]
	jmp LB_2065
LB_2077:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2081
LB_2081
;; rsp=0 , %1531~1'(= r ) %1530~0'(= r ) %1529~{ } %1528~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1532~0(<2)◂{ } %1531~1'(= r ) %1530~0'(= r ) %1529~{ } %1528~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_2080
LB_2080:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2065
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2065:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2084
LB_2084
;; rsp=0 , %1534~1'(= r ) %1533~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1535~0(<2)◂{ } %1534~1'(= r ) %1533~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_2083
LB_2083:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2082
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2082:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_224:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_224
	ret
GRM_224:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2087
LB_2086:
	add r14,1 
LB_2087:
	cmp r14,r9
	jge LB_2088
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2086
	cmp rax,32 
	jz LB_2086
LB_2088
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2091
	jmp LB_2092
LB_2091:
	mov r8,unt_1
	jmp LB_2089
LB_2092:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2093
	jmp LB_2094
LB_2093:
	mov r8,unt_1
	jmp LB_2089
LB_2094:
	add r14,1
	jmp LB_2090
LB_2089:
	lea rsp,[rsp+8*0]
	jmp LB_2085
LB_2090:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2096
LB_2096
;; rsp=0 , %1538~1'(= r ) %1537~0'(= r ) %1536~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1539~0(<2)◂{ } %1538~1'(= r ) %1537~0'(= r ) %1536~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_2095
LB_2095:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2085
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2085:
	jmp LB_2099
LB_2098:
	add r14,1 
LB_2099:
	cmp r14,r9
	jge LB_2100
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2098
	cmp rax,32 
	jz LB_2098
LB_2100
	call GRM_220
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2103
	jmp LB_2104
LB_2103:
	jmp LB_2101
LB_2104:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2102
LB_2101:
	lea rsp,[rsp+8*0]
	jmp LB_2097
LB_2102:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2106
LB_2106
;; rsp=0 , %1542~1'(= r ) %1541~0'(= r ) %1540~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1543~1(<2)◂{ } %1542~1'(= r ) %1541~0'(= r ) %1540~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_2105
LB_2105:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2097
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2097:
	jmp LB_2109
LB_2108:
	add r14,1 
LB_2109:
	cmp r14,r9
	jge LB_2110
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2108
	cmp rax,32 
	jz LB_2108
LB_2110
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2113
	jmp LB_2114
LB_2113:
	mov r8,unt_1
	jmp LB_2111
LB_2114:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_2115
	jmp LB_2116
LB_2115:
	mov r8,unt_1
	jmp LB_2111
LB_2116:
	add r14,1
	jmp LB_2112
LB_2111:
	lea rsp,[rsp+8*0]
	jmp LB_2107
LB_2112:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2118
LB_2118
;; rsp=0 , %1546~1'(= r ) %1545~0'(= r ) %1544~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1547~1(<2)◂{ } %1546~1'(= r ) %1545~0'(= r ) %1544~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_2117
LB_2117:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2107
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2107:
	jmp LB_2121
LB_2120:
	add r14,1 
LB_2121:
	cmp r14,r9
	jge LB_2122
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2120
	cmp rax,32 
	jz LB_2120
LB_2122
	cmp r14,r9
	jge LB_2125
	jmp LB_2126
LB_2125:
	mov r8,unt_1 
	jmp LB_2123
LB_2126:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2124
LB_2123:
	lea rsp,[rsp+8*0]
	jmp LB_2119
LB_2124:
	jmp LB_2128
LB_2127:
	add r14,1 
LB_2128:
	cmp r14,r9
	jge LB_2129
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2127
	cmp rax,32 
	jz LB_2127
LB_2129
	call GRM_224
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2132
	jmp LB_2133
LB_2132:
	jmp LB_2130
LB_2133:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2131
LB_2130:
	lea rsp,[rsp+8*1]
	jmp LB_2119
LB_2131:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2135
LB_2135
;; rsp=1 , %1551~1'(= r ) %1550~0'(= r ) %1549~{ } %1548~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1552~0(<2)◂{ } %1551~1'(= r ) %1550~0'(= r ) %1549~{ } %1548~8'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2134
LB_2134:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2119
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2119:
	jmp LB_2138
LB_2137:
	add r14,1 
LB_2138:
	cmp r14,r9
	jge LB_2139
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2137
	cmp rax,32 
	jz LB_2137
LB_2139
	cmp r14,r9
	jge LB_2142
	jmp LB_2143
LB_2142:
	mov r8,unt_1 
	jmp LB_2140
LB_2143:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2141
LB_2140:
	lea rsp,[rsp+8*0]
	jmp LB_2136
LB_2141:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2145
LB_2145
;; rsp=1 , %1555~1'(= r ) %1554~0'(= r ) %1553~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1556~0(<2)◂{ } %1555~1'(= r ) %1554~0'(= r ) %1553~8'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2144
LB_2144:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2136
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2136:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2148
LB_2148
;; rsp=0 , %1558~1'(= r ) %1557~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1559~0(<2)◂{ } %1558~1'(= r ) %1557~0'(= r ) 
; ∎ 0(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_2147
LB_2147:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2146
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2146:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_225:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_225
	ret
GRM_225:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2151
LB_2150:
	add r14,1 
LB_2151:
	cmp r14,r9
	jge LB_2152
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2150
	cmp rax,10 
	jz LB_2150
	cmp rax,32 
	jz LB_2150
LB_2152
	call GRM_226
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2155
	jmp LB_2156
LB_2155:
	jmp LB_2153
LB_2156:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2154
LB_2153:
	lea rsp,[rsp+8*0]
	jmp LB_2149
LB_2154:
	jmp LB_2158
LB_2157:
	add r14,1 
LB_2158:
	cmp r14,r9
	jge LB_2159
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2157
	cmp rax,10 
	jz LB_2157
	cmp rax,32 
	jz LB_2157
LB_2159
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2162
	jmp LB_2163
LB_2162:
	mov r8,unt_1
	jmp LB_2160
LB_2163:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],42
	jnz LB_2164
	jmp LB_2165
LB_2164:
	mov r8,unt_1
	jmp LB_2160
LB_2165:
	add r14,1
	jmp LB_2161
LB_2160:
	lea rsp,[rsp+8*1]
	jmp LB_2149
LB_2161:
	jmp LB_2167
LB_2166:
	add r14,1 
LB_2167:
	cmp r14,r9
	jge LB_2168
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2166
	cmp rax,10 
	jz LB_2166
	cmp rax,32 
	jz LB_2166
LB_2168
	call GRM_66
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2171
	jmp LB_2172
LB_2171:
	jmp LB_2169
LB_2172:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 9'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2170
LB_2169:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2170:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2174
LB_2174
;; rsp=2 , %1563~1'(= r ) %1562~0'(= r ) %1561~9'(= {| l |} ) %1560~8'(= r ) 
; #106 { 8'(= r ) 9'(= {| l |} ) } ⊢ 3(<4)◂{ 8'(= r ) 9'(= {| l |} ) }
;; rsp=2 , %1564~3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } %1563~1'(= r ) %1562~0'(= r ) 
; #22 3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } ⊢ 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) }
;; rsp=2 , %1565~0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } %1563~1'(= r ) %1562~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2173
LB_2173:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2149
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2149:
	jmp LB_2177
LB_2176:
	add r14,1 
LB_2177:
	cmp r14,r9
	jge LB_2178
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2176
	cmp rax,10 
	jz LB_2176
	cmp rax,32 
	jz LB_2176
LB_2178
	call GRM_228
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2181
	jmp LB_2182
LB_2181:
	jmp LB_2179
LB_2182:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2180
LB_2179:
	lea rsp,[rsp+8*0]
	jmp LB_2175
LB_2180:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2184
LB_2184
;; rsp=1 , %1568~1'(= r ) %1567~0'(= r ) %1566~8'(= {| l |} ) 
; #109 8'(= {| l |} ) ⊢ 0(<4)◂8'(= {| l |} )
;; rsp=1 , %1569~0(<4)◂8'(= {| l |} ) %1568~1'(= r ) %1567~0'(= r ) 
; #22 0(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<4)◂8'(= {| l |} )
;; rsp=1 , %1570~0(<2)◂0(<4)◂8'(= {| l |} ) %1568~1'(= r ) %1567~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2183
LB_2183:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2175
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2175:
	jmp LB_2187
LB_2186:
	add r14,1 
LB_2187:
	cmp r14,r9
	jge LB_2188
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2186
	cmp rax,10 
	jz LB_2186
	cmp rax,32 
	jz LB_2186
LB_2188
	call GRM_66
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2191
	jmp LB_2192
LB_2191:
	jmp LB_2189
LB_2192:
	lea rsp,[rsp-8*1]
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2190
LB_2189:
	lea rsp,[rsp+8*0]
	jmp LB_2185
LB_2190:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2194
LB_2194
;; rsp=1 , %1573~1'(= r ) %1572~0'(= r ) %1571~8'(= {| l |} ) 
; #109 8'(= {| l |} ) ⊢ 0(<4)◂8'(= {| l |} )
;; rsp=1 , %1574~0(<4)◂8'(= {| l |} ) %1573~1'(= r ) %1572~0'(= r ) 
; #22 0(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<4)◂8'(= {| l |} )
;; rsp=1 , %1575~0(<2)◂0(<4)◂8'(= {| l |} ) %1573~1'(= r ) %1572~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂8'(= {| l |} )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2193
LB_2193:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2185
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2185:
	jmp LB_2197
LB_2196:
	add r14,1 
LB_2197:
	cmp r14,r9
	jge LB_2198
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2196
	cmp rax,10 
	jz LB_2196
	cmp rax,32 
	jz LB_2196
LB_2198
	call GRM_188
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2201
	jmp LB_2202
LB_2201:
	jmp LB_2199
LB_2202:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2200
LB_2199:
	lea rsp,[rsp+8*0]
	jmp LB_2195
LB_2200:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2204
LB_2204
;; rsp=1 , %1578~1'(= r ) %1577~0'(= r ) %1576~8'(= a9◂ [ ] ) 
; #84 8'(= a9◂ [ ] ) ⊢ 1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1579~1(<2)◂8'(= a9◂ [ ] ) %1578~1'(= r ) %1577~0'(= r ) 
; #108 1(<2)◂8'(= a9◂ [ ] ) ⊢ 1(<4)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1580~1(<4)◂1(<2)◂8'(= a9◂ [ ] ) %1578~1'(= r ) %1577~0'(= r ) 
; #22 1(<4)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1581~0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] ) %1578~1'(= r ) %1577~0'(= r ) 
; ∎ 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2203
LB_2203:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2195
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2195:
	jmp LB_2207
LB_2206:
	add r14,1 
LB_2207:
	cmp r14,r9
	jge LB_2208
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2206
	cmp rax,10 
	jz LB_2206
	cmp rax,32 
	jz LB_2206
LB_2208
	call GRM_227
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2211
	jmp LB_2212
LB_2211:
	jmp LB_2209
LB_2212:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ a15◂ [ ]r} ) ⊢ { 8'(= a15◂ [ ] ) 9'(= r ) }
; .mov_ptn 2'(= *{ a15◂ [ ]r} ) ⊢ { 8'(= a15◂ [ ] ) 9'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_2210
LB_2209:
	lea rsp,[rsp+8*0]
	jmp LB_2205
LB_2210:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2214
LB_2214
;; rsp=2 , %1584~1'(= r ) %1583~0'(= r ) %1582~{ 8'(= a15◂ [ ] ) 9'(= r ) } 
; #107 { 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) }
;; rsp=2 , %1585~2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } %1584~1'(= r ) %1583~0'(= r ) 
; #22 2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) }
;; rsp=2 , %1586~0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } %1584~1'(= r ) %1583~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2213
LB_2213:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2205
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2205:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_226:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_226
	ret
GRM_226:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_2218
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
 lea rdi,[r13+8+r14] 
	call scf_d
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	cmp rax,0 
	jz LB_2218
	add r14,rsi
	push rdi
	jmp LB_2219
LB_2218:
	mov r8,unt_1
	jmp LB_2216
LB_2219:
	jmp LB_2217
LB_2216:
	lea rsp,[rsp+8*0]
	jmp LB_2215
LB_2217:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2222
	jmp LB_2223
LB_2222:
	mov r8,unt_1
	jmp LB_2220
LB_2223:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_2224
	jmp LB_2225
LB_2224:
	mov r8,unt_1
	jmp LB_2220
LB_2225:
	add r14,1
	jmp LB_2221
LB_2220:
	lea rsp,[rsp+8*1]
	jmp LB_2215
LB_2221:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2227
LB_2227
;; rsp=1 , %1589~1'(= r ) %1588~0'(= r ) %1587~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1590~0(<2)◂8'(= r ) %1589~1'(= r ) %1588~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2226
LB_2226:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2215
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2215:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_227:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_227
	ret
GRM_227:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_2231
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
 lea rdi,[r13+8+r14] 
	call scf_d
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	cmp rax,0 
	jz LB_2231
	add r14,rsi
	push rdi
	jmp LB_2232
LB_2231:
	mov r8,unt_1
	jmp LB_2229
LB_2232:
	jmp LB_2230
LB_2229:
	lea rsp,[rsp+8*0]
	jmp LB_2228
LB_2230:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2235
	jmp LB_2236
LB_2235:
	mov r8,unt_1
	jmp LB_2233
LB_2236:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],100
	jnz LB_2237
	cmp BYTE [rdi+1],39
	jnz LB_2237
	jmp LB_2238
LB_2237:
	mov r8,unt_1
	jmp LB_2233
LB_2238:
	add r14,2
	jmp LB_2234
LB_2233:
	lea rsp,[rsp+8*1]
	jmp LB_2228
LB_2234:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2240
LB_2240
;; rsp=1 , %1593~1'(= r ) %1592~0'(= r ) %1591~8'(= r ) 
; #104 { } ⊢ 1(<4)◂{ }
;; rsp=1 , %1594~1(<4)◂{ } %1593~1'(= r ) %1592~0'(= r ) %1591~8'(= r ) 
; #22 { 1(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
;; rsp=1 , %1595~0(<2)◂{ 1(<4)◂{ } 8'(= r ) } %1593~1'(= r ) %1592~0'(= r ) 
; ∎ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ 1(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
; .mov_ptn 0(<2)◂{ 1(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2239
LB_2239:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2228
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2228:
	cmp r14,r9
	jge LB_2244
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
 lea rdi,[r13+8+r14] 
	call scf_d
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	cmp rax,0 
	jz LB_2244
	add r14,rsi
	push rdi
	jmp LB_2245
LB_2244:
	mov r8,unt_1
	jmp LB_2242
LB_2245:
	jmp LB_2243
LB_2242:
	lea rsp,[rsp+8*0]
	jmp LB_2241
LB_2243:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2248
	jmp LB_2249
LB_2248:
	mov r8,unt_1
	jmp LB_2246
LB_2249:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_2250
	cmp BYTE [rdi+1],39
	jnz LB_2250
	jmp LB_2251
LB_2250:
	mov r8,unt_1
	jmp LB_2246
LB_2251:
	add r14,2
	jmp LB_2247
LB_2246:
	lea rsp,[rsp+8*1]
	jmp LB_2241
LB_2247:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2253
LB_2253
;; rsp=1 , %1598~1'(= r ) %1597~0'(= r ) %1596~8'(= r ) 
; #103 { } ⊢ 2(<4)◂{ }
;; rsp=1 , %1599~2(<4)◂{ } %1598~1'(= r ) %1597~0'(= r ) %1596~8'(= r ) 
; #22 { 2(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
;; rsp=1 , %1600~0(<2)◂{ 2(<4)◂{ } 8'(= r ) } %1598~1'(= r ) %1597~0'(= r ) 
; ∎ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ 2(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
; .mov_ptn 0(<2)◂{ 2(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,unt 
	mov rax,unt_2
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2252
LB_2252:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2241
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2241:
	cmp r14,r9
	jge LB_2257
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
 lea rdi,[r13+8+r14] 
	call scf_d
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	cmp rax,0 
	jz LB_2257
	add r14,rsi
	push rdi
	jmp LB_2258
LB_2257:
	mov r8,unt_1
	jmp LB_2255
LB_2258:
	jmp LB_2256
LB_2255:
	lea rsp,[rsp+8*0]
	jmp LB_2254
LB_2256:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2261
	jmp LB_2262
LB_2261:
	mov r8,unt_1
	jmp LB_2259
LB_2262:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_2263
	jmp LB_2264
LB_2263:
	mov r8,unt_1
	jmp LB_2259
LB_2264:
	add r14,1
	jmp LB_2260
LB_2259:
	lea rsp,[rsp+8*1]
	jmp LB_2254
LB_2260:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2266
LB_2266
;; rsp=1 , %1603~1'(= r ) %1602~0'(= r ) %1601~8'(= r ) 
; #105 { } ⊢ 0(<4)◂{ }
;; rsp=1 , %1604~0(<4)◂{ } %1603~1'(= r ) %1602~0'(= r ) %1601~8'(= r ) 
; #22 { 0(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
;; rsp=1 , %1605~0(<2)◂{ 0(<4)◂{ } 8'(= r ) } %1603~1'(= r ) %1602~0'(= r ) 
; ∎ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ 0(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
; .mov_ptn 0(<2)◂{ 0(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,unt 
	mov rax,unt_0
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2265
LB_2265:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2254
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2254:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_228:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_228
	ret
GRM_228:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2270
	jmp LB_2271
LB_2270:
	mov r8,unt_1
	jmp LB_2268
LB_2271:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],96
	jnz LB_2272
	jmp LB_2273
LB_2272:
	mov r8,unt_1
	jmp LB_2268
LB_2273:
	add r14,1
	jmp LB_2269
LB_2268:
	lea rsp,[rsp+8*0]
	jmp LB_2267
LB_2269:
	call GRM_229
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2276
	jmp LB_2277
LB_2276:
	jmp LB_2274
LB_2277:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2275
LB_2274:
	lea rsp,[rsp+8*0]
	jmp LB_2267
LB_2275:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2279
LB_2279
;; rsp=1 , %1608~1'(= r ) %1607~0'(= r ) %1606~8'(= a5◂ [ ] ) 
; rsp_d=0, #42 8'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_42

	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %1610~2'(= {| l |} ) %1609~3'(= a5◂ [ ] ) %1608~1'(= r ) %1607~0'(= r ) 
; #22 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %1611~0(<2)◂2'(= {| l |} ) %1609~3'(= a5◂ [ ] ) %1608~1'(= r ) %1607~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_2278
LB_2278:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2267
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2267:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_229:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_229
	ret
GRM_229:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2283
	jmp LB_2284
LB_2283:
	mov r8,unt_1
	jmp LB_2281
LB_2284:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2285
	jmp LB_2286
LB_2285:
	mov r8,unt_1
	jmp LB_2281
LB_2286:
	add r14,1
	jmp LB_2282
LB_2281:
	lea rsp,[rsp+8*0]
	jmp LB_2280
LB_2282:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2288
LB_2288
;; rsp=0 , %1613~1'(= r ) %1612~0'(= r ) 
	jmp LB_2289
LB_2289:
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %1614~%[ 10r ] %1613~1'(= r ) %1612~0'(= r ) 
; #31 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %1615~2(<4)◂{ } %1614~%[ 10r ] %1613~1'(= r ) %1612~0'(= r ) 
; rsp_d=0, #39 { %[ 10r ] 2(<4)◂{ } } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ 10r ] 2(<4)◂{ } } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 2(<4)◂{ } ⊢ 1'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r14,rax
; .mov_ptn %[ 10r ] ⊢ 0'(= r )
	mov rax,10
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %1616~2'(= a5◂ [ ] ) %1613~1'(= r ) %1612~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %1617~0(<2)◂2'(= a5◂ [ ] ) %1613~1'(= r ) %1612~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2287
LB_2287:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2280
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2280:
	cmp r14,r9
	jge LB_2293
	jmp LB_2294
LB_2293:
	mov r8,unt_1 
	jmp LB_2291
LB_2294:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2292
LB_2291:
	lea rsp,[rsp+8*0]
	jmp LB_2290
LB_2292:
	call GRM_229
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2297
	jmp LB_2298
LB_2297:
	jmp LB_2295
LB_2298:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2296
LB_2295:
	lea rsp,[rsp+8*1]
	jmp LB_2290
LB_2296:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2300
LB_2300
;; rsp=2 , %1621~1'(= r ) %1620~0'(= r ) %1619~9'(= a5◂ [ ] ) %1618~8'(= r ) 
; rsp_d=0, #39 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_39

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*4]
;; rsp=0 , %1622~2'(= a5◂ [ ] ) %1621~1'(= r ) %1620~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %1623~0(<2)◂2'(= a5◂ [ ] ) %1621~1'(= r ) %1620~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2299
LB_2299:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2290
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2290:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_230:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_230
	ret
GRM_230:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2303
LB_2302:
	add r14,1 
LB_2303:
	cmp r14,r9
	jge LB_2304
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2302
	cmp rax,32 
	jz LB_2302
LB_2304
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2307
	jmp LB_2308
LB_2307:
	jmp LB_2305
LB_2308:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2306
LB_2305:
	lea rsp,[rsp+8*0]
	jmp LB_2301
LB_2306:
	jmp LB_2310
LB_2309:
	add r14,1 
LB_2310:
	cmp r14,r9
	jge LB_2311
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2309
	cmp rax,32 
	jz LB_2309
LB_2311
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2314
	jmp LB_2315
LB_2314:
	mov r8,unt_1
	jmp LB_2312
LB_2315:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],47
	jnz LB_2316
	cmp BYTE [rdi+1],47
	jnz LB_2316
	jmp LB_2317
LB_2316:
	mov r8,unt_1
	jmp LB_2312
LB_2317:
	add r14,2
	jmp LB_2313
LB_2312:
	lea rsp,[rsp+8*1]
	jmp LB_2301
LB_2313:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2319
LB_2319
;; rsp=1 , %1626~1'(= r ) %1625~0'(= r ) %1624~8'(= a35◂ [ *{ }] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1627~1(<2)◂{ } %1626~1'(= r ) %1625~0'(= r ) %1624~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %1628~0(<2)◂1(<2)◂{ } %1626~1'(= r ) %1625~0'(= r ) %1624~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2318
LB_2318:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2301
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2301:
	jmp LB_2322
LB_2321:
	add r14,1 
LB_2322:
	cmp r14,r9
	jge LB_2323
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2321
	cmp rax,32 
	jz LB_2321
LB_2323
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2326
	jmp LB_2327
LB_2326:
	jmp LB_2324
LB_2327:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2325
LB_2324:
	lea rsp,[rsp+8*0]
	jmp LB_2320
LB_2325:
	jmp LB_2329
LB_2328:
	add r14,1 
LB_2329:
	cmp r14,r9
	jge LB_2330
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2328
	cmp rax,32 
	jz LB_2328
LB_2330
	call GRM_225
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2333
	jmp LB_2334
LB_2333:
	jmp LB_2331
LB_2334:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a16◂ [ a9◂ [ ]] ) ⊢ 9'(= a16◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a16◂ [ a9◂ [ ]] ) ⊢ 9'(= a16◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2332
LB_2331:
	lea rsp,[rsp+8*1]
	jmp LB_2320
LB_2332:
	jmp LB_2336
LB_2335:
	add r14,1 
LB_2336:
	cmp r14,r9
	jge LB_2337
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2335
	cmp rax,32 
	jz LB_2335
LB_2337
	call GRM_230
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2340
	jmp LB_2341
LB_2340:
	jmp LB_2338
LB_2341:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2339
LB_2338:
	lea rsp,[rsp+8*2]
	jmp LB_2320
LB_2339:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2343
LB_2343
;; rsp=3 , %1633~1'(= r ) %1632~0'(= r ) %1631~10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1630~9'(= a16◂ [ a9◂ [ ]] ) %1629~8'(= a35◂ [ *{ }] ) 
; #21 { 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
;; rsp=3 , %1634~0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } %1633~1'(= r ) %1632~0'(= r ) %1629~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
;; rsp=3 , %1635~0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } %1633~1'(= r ) %1632~0'(= r ) %1629~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2342
LB_2342:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2320
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2320:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_231:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_231
	ret
GRM_231:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2348
LB_2348
;; rsp=0 , %1639~1'(= r ) %1638~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1640~1(<2)◂{ } %1639~1'(= r ) %1638~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1641~0(<2)◂1(<2)◂{ } %1639~1'(= r ) %1638~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ q0]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ q0]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2347
LB_2347:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2346
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2345
LB_2346:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2345
LB_2345:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2349
	jmp LB_2350
LB_2349:
	lea rsp,[rsp+8*0]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_2350:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ q0] ) ⊢ 3'(= a3◂ [ q0] )
	mov r10,r9
; .mov_ptn 2'(= a3◂ [ q0] ) ⊢ 3'(= a3◂ [ q0] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2352
LB_2352
;; rsp=0 , %1642~3'(= a3◂ [ q0] ) %1637~1'(= r ) %1636~0'(= r ) 
;; ? 3'(= a3◂ [ q0] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1637~1'(= r ) %1636~0'(= r ) 
; ∎| 
	jmp LB_2355
LB_2354: db 101,120,110,32,51,56,53,51,56,58,10,0
LB_2355:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_2354
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
LB_2351:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2344
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2344:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_232:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_232
	ret
GRM_232:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2358
LB_2357:
	add r14,1 
LB_2358:
	cmp r14,r9
	jge LB_2359
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2357
	cmp rax,10 
	jz LB_2357
	cmp rax,32 
	jz LB_2357
LB_2359
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2362
	jmp LB_2363
LB_2362:
	mov r8,unt_1
	jmp LB_2360
LB_2363:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2364
	cmp BYTE [rdi+1],94
	jnz LB_2364
	jmp LB_2365
LB_2364:
	mov r8,unt_1
	jmp LB_2360
LB_2365:
	add r14,2
	jmp LB_2361
LB_2360:
	lea rsp,[rsp+8*0]
	jmp LB_2356
LB_2361:
	jmp LB_2367
LB_2366:
	add r14,1 
LB_2367:
	cmp r14,r9
	jge LB_2368
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2366
	cmp rax,10 
	jz LB_2366
	cmp rax,32 
	jz LB_2366
LB_2368
	call GRM_233
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2371
	jmp LB_2372
LB_2371:
	jmp LB_2369
LB_2372:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_2370
LB_2369:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2370:
	jmp LB_2374
LB_2373:
	add r14,1 
LB_2374:
	cmp r14,r9
	jge LB_2375
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2373
	cmp rax,10 
	jz LB_2373
	cmp rax,32 
	jz LB_2373
LB_2375
	call GRM_230
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2378
	jmp LB_2379
LB_2378:
	jmp LB_2376
LB_2379:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2377
LB_2376:
	lea rsp,[rsp+8*2]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2377:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2381
LB_2381
;; rsp=3 , %1650~1'(= r ) %1649~0'(= r ) %1648~10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1647~9'(= a2◂ [ a13◂ [ {| l |}]] ) %1646~8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #118 { 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=3 , %1651~3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1650~1'(= r ) %1649~0'(= r ) 
; #22 3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=3 , %1652~0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1650~1'(= r ) %1649~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*3]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rax,r13
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2380
LB_2380:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2356
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2356:
	jmp LB_2384
LB_2383:
	add r14,1 
LB_2384:
	cmp r14,r9
	jge LB_2385
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2383
	cmp rax,10 
	jz LB_2383
	cmp rax,32 
	jz LB_2383
LB_2385
	call GRM_189
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2388
	jmp LB_2389
LB_2388:
	jmp LB_2386
LB_2389:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2387
LB_2386:
	lea rsp,[rsp+8*0]
	jmp LB_2382
LB_2387:
	jmp LB_2391
LB_2390:
	add r14,1 
LB_2391:
	cmp r14,r9
	jge LB_2392
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2390
	cmp rax,10 
	jz LB_2390
	cmp rax,32 
	jz LB_2390
LB_2392
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2395
	jmp LB_2396
LB_2395:
	mov r8,unt_1
	jmp LB_2393
LB_2396:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2397
	jmp LB_2398
LB_2397:
	mov r8,unt_1
	jmp LB_2393
LB_2398:
	add r14,1
	jmp LB_2394
LB_2393:
	lea rsp,[rsp+8*1]
	jmp LB_2382
LB_2394:
	jmp LB_2400
LB_2399:
	add r14,1 
LB_2400:
	cmp r14,r9
	jge LB_2401
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2399
	cmp rax,10 
	jz LB_2399
	cmp rax,32 
	jz LB_2399
LB_2401
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2404
	jmp LB_2405
LB_2404:
	mov r8,unt_1
	jmp LB_2402
LB_2405:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2406
	cmp BYTE [rdi+1],138
	jnz LB_2406
	cmp BYTE [rdi+2],162
	jnz LB_2406
	jmp LB_2407
LB_2406:
	mov r8,unt_1
	jmp LB_2402
LB_2407:
	add r14,3
	jmp LB_2403
LB_2402:
	lea rsp,[rsp+8*1]
	jmp LB_2382
LB_2403:
	jmp LB_2409
LB_2408:
	add r14,1 
LB_2409:
	cmp r14,r9
	jge LB_2410
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2408
	cmp rax,10 
	jz LB_2408
	cmp rax,32 
	jz LB_2408
LB_2410
	call GRM_204
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2413
	jmp LB_2414
LB_2413:
	jmp LB_2411
LB_2414:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2412
LB_2411:
	lea rsp,[rsp+8*1]
	jmp LB_2382
LB_2412:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2416
LB_2416
;; rsp=2 , %1656~1'(= r ) %1655~0'(= r ) %1654~9'(= a8◂ [ a13◂ [ {| l |}]] ) %1653~8'(= a11◂ [ a9◂ [ ]] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %1657~1(<2)◂{ } %1656~1'(= r ) %1655~0'(= r ) %1654~9'(= a8◂ [ a13◂ [ {| l |}]] ) %1653~8'(= a11◂ [ a9◂ [ ]] ) 
; #78 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %1658~0(<2)◂1(<2)◂{ } %1656~1'(= r ) %1655~0'(= r ) %1654~9'(= a8◂ [ a13◂ [ {| l |}]] ) %1653~8'(= a11◂ [ a9◂ [ ]] ) 
; #119 { 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1659~2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } %1656~1'(= r ) %1655~0'(= r ) 
; #22 2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1660~0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } %1656~1'(= r ) %1655~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2415
LB_2415:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2382
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2382:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_233:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_233
	ret
GRM_233:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2419
LB_2418:
	add r14,1 
LB_2419:
	cmp r14,r9
	jge LB_2420
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2418
	cmp rax,10 
	jz LB_2418
	cmp rax,32 
	jz LB_2418
LB_2420
	call GRM_186
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2423
	jmp LB_2424
LB_2423:
	jmp LB_2421
LB_2424:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2422
LB_2421:
	lea rsp,[rsp+8*0]
	jmp LB_2417
LB_2422:
	jmp LB_2426
LB_2425:
	add r14,1 
LB_2426:
	cmp r14,r9
	jge LB_2427
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2425
	cmp rax,10 
	jz LB_2425
	cmp rax,32 
	jz LB_2425
LB_2427
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2430
	jmp LB_2431
LB_2430:
	mov r8,unt_1
	jmp LB_2428
LB_2431:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2432
	cmp BYTE [rdi+1],138
	jnz LB_2432
	cmp BYTE [rdi+2],162
	jnz LB_2432
	jmp LB_2433
LB_2432:
	mov r8,unt_1
	jmp LB_2428
LB_2433:
	add r14,3
	jmp LB_2429
LB_2428:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2429:
	jmp LB_2435
LB_2434:
	add r14,1 
LB_2435:
	cmp r14,r9
	jge LB_2436
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2434
	cmp rax,10 
	jz LB_2434
	cmp rax,32 
	jz LB_2434
LB_2436
	call GRM_208
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2439
	jmp LB_2440
LB_2439:
	jmp LB_2437
LB_2440:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2438
LB_2437:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2438:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2442
LB_2442
;; rsp=1 , %1664~1'(= r ) %1663~0'(= r ) %1662~8'(= a13◂ [ {| l |}] ) %1661~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1665~1(<2)◂{ } %1664~1'(= r ) %1663~0'(= r ) %1662~8'(= a13◂ [ {| l |}] ) %1661~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1666~1(<2)◂{ } %1665~1(<2)◂{ } %1664~1'(= r ) %1663~0'(= r ) %1662~8'(= a13◂ [ {| l |}] ) %1661~{ } 
; #21 { 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } }
;; rsp=1 , %1667~0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } %1665~1(<2)◂{ } %1664~1'(= r ) %1663~0'(= r ) %1661~{ } 
; #22 { 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } }
;; rsp=1 , %1668~0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } %1664~1'(= r ) %1663~0'(= r ) %1661~{ } 
; ∎ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
; .mov_ptn 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2441
LB_2441:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2417
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2417:
	jmp LB_2445
LB_2444:
	add r14,1 
LB_2445:
	cmp r14,r9
	jge LB_2446
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2444
	cmp rax,10 
	jz LB_2444
	cmp rax,32 
	jz LB_2444
LB_2446
	call GRM_203
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2449
	jmp LB_2450
LB_2449:
	jmp LB_2447
LB_2450:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2448
LB_2447:
	lea rsp,[rsp+8*0]
	jmp LB_2443
LB_2448:
	jmp LB_2452
LB_2451:
	add r14,1 
LB_2452:
	cmp r14,r9
	jge LB_2453
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2451
	cmp rax,10 
	jz LB_2451
	cmp rax,32 
	jz LB_2451
LB_2453
	call GRM_202
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2456
	jmp LB_2457
LB_2456:
	jmp LB_2454
LB_2457:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2455
LB_2454:
	lea rsp,[rsp+8*1]
	jmp LB_2443
LB_2455:
	jmp LB_2459
LB_2458:
	add r14,1 
LB_2459:
	cmp r14,r9
	jge LB_2460
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2458
	cmp rax,10 
	jz LB_2458
	cmp rax,32 
	jz LB_2458
LB_2460
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2463
	jmp LB_2464
LB_2463:
	mov r8,unt_1
	jmp LB_2461
LB_2464:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2465
	cmp BYTE [rdi+1],138
	jnz LB_2465
	cmp BYTE [rdi+2],162
	jnz LB_2465
	jmp LB_2466
LB_2465:
	mov r8,unt_1
	jmp LB_2461
LB_2466:
	add r14,3
	jmp LB_2462
LB_2461:
	lea rsp,[rsp+8*2]
	jmp LB_2443
LB_2462:
	jmp LB_2468
LB_2467:
	add r14,1 
LB_2468:
	cmp r14,r9
	jge LB_2469
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2467
	cmp rax,10 
	jz LB_2467
	cmp rax,32 
	jz LB_2467
LB_2469
	call GRM_208
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2472
	jmp LB_2473
LB_2472:
	jmp LB_2470
LB_2473:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 10'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 10'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2471
LB_2470:
	lea rsp,[rsp+8*2]
	jmp LB_2443
LB_2471:
	jmp LB_2475
LB_2474:
	add r14,1 
LB_2475:
	cmp r14,r9
	jge LB_2476
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2474
	cmp rax,10 
	jz LB_2474
	cmp rax,32 
	jz LB_2474
LB_2476
	call GRM_207
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2479
	jmp LB_2480
LB_2479:
	jmp LB_2477
LB_2480:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2478
LB_2477:
	lea rsp,[rsp+8*3]
	jmp LB_2443
LB_2478:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_2482
LB_2482
;; rsp=4 , %1674~1'(= r ) %1673~0'(= r ) %1672~11'(= a2◂ [ a13◂ [ {| l |}]] ) %1671~10'(= a13◂ [ {| l |}] ) %1670~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1669~8'(= a12◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=4 , %1675~0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1674~1'(= r ) %1673~0'(= r ) %1672~11'(= a2◂ [ a13◂ [ {| l |}]] ) %1671~10'(= a13◂ [ {| l |}] ) 
; #21 { 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=4 , %1676~0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } %1675~0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1674~1'(= r ) %1673~0'(= r ) 
; #22 { 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } ⊢ 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } }
;; rsp=4 , %1677~0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } %1674~1'(= r ) %1673~0'(= r ) 
; ∎ 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
; .mov_ptn 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,QWORD [rsp-8+8*4]
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*3]
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	lea rsp,[rsp+8*4]
	jmp LB_2481
LB_2481:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2443
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2443:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_234:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_234
	ret
GRM_234:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2485
LB_2484:
	add r14,1 
LB_2485:
	cmp r14,r9
	jge LB_2486
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2484
	cmp rax,10 
	jz LB_2484
	cmp rax,32 
	jz LB_2484
LB_2486
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2489
	jmp LB_2490
LB_2489:
	jmp LB_2487
LB_2490:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2488
LB_2487:
	lea rsp,[rsp+8*0]
	jmp LB_2483
LB_2488:
	jmp LB_2492
LB_2491:
	add r14,1 
LB_2492:
	cmp r14,r9
	jge LB_2493
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2491
	cmp rax,10 
	jz LB_2491
	cmp rax,32 
	jz LB_2491
LB_2493
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2496
	jmp LB_2497
LB_2496:
	mov r8,unt_1
	jmp LB_2494
LB_2497:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2498
	cmp BYTE [rdi+1],136
	jnz LB_2498
	cmp BYTE [rdi+2],142
	jnz LB_2498
	cmp BYTE [rdi+3],124
	jnz LB_2498
	jmp LB_2499
LB_2498:
	mov r8,unt_1
	jmp LB_2494
LB_2499:
	add r14,4
	jmp LB_2495
LB_2494:
	lea rsp,[rsp+8*1]
	jmp LB_2483
LB_2495:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2501
LB_2501
;; rsp=1 , %1680~1'(= r ) %1679~0'(= r ) %1678~8'(= a35◂ [ *{ }] ) 
; #124 0'(= r ) ⊢ 6(<7)◂0'(= r )
;; rsp=1 , %1681~6(<7)◂0'(= r ) %1680~1'(= r ) %1678~8'(= a35◂ [ *{ }] ) 
; #192 6(<7)◂0'(= r ) ⊢ 0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %1682~0(<2)◂6(<7)◂0'(= r ) %1680~1'(= r ) %1678~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂6(<7)◂0'(= r ) ⊢ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %1683~0(<2)◂0(<2)◂6(<7)◂0'(= r ) %1680~1'(= r ) %1678~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
; .dlt.ptn 1'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂6(<7)◂0'(= r ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂6(<7)◂0'(= r ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],6
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2500
LB_2500:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2483
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2483:
	jmp LB_2504
LB_2503:
	add r14,1 
LB_2504:
	cmp r14,r9
	jge LB_2505
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2503
	cmp rax,10 
	jz LB_2503
	cmp rax,32 
	jz LB_2503
LB_2505
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2508
	jmp LB_2509
LB_2508:
	jmp LB_2506
LB_2509:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2507
LB_2506:
	lea rsp,[rsp+8*0]
	jmp LB_2502
LB_2507:
	jmp LB_2511
LB_2510:
	add r14,1 
LB_2511:
	cmp r14,r9
	jge LB_2512
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2510
	cmp rax,10 
	jz LB_2510
	cmp rax,32 
	jz LB_2510
LB_2512
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2515
	jmp LB_2516
LB_2515:
	mov r8,unt_1
	jmp LB_2513
LB_2516:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2517
	cmp BYTE [rdi+1],136
	jnz LB_2517
	cmp BYTE [rdi+2],142
	jnz LB_2517
	jmp LB_2518
LB_2517:
	mov r8,unt_1
	jmp LB_2513
LB_2518:
	add r14,3
	jmp LB_2514
LB_2513:
	lea rsp,[rsp+8*1]
	jmp LB_2502
LB_2514:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2522
LB_2521:
	add r14,1 
LB_2522:
	cmp r14,r9
	jge LB_2523
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2521
	cmp rax,10 
	jz LB_2521
	cmp rax,32 
	jz LB_2521
LB_2523
	call GRM_200
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2526
	jmp LB_2527
LB_2526:
	jmp LB_2524
LB_2527:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2525
LB_2524:
	lea rsp,[rsp+8*0]
	jmp LB_2520
LB_2525:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2529
LB_2529
;; rsp=1 , %1689~1'(= r ) %1688~0'(= r ) %1687~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #125 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1690~5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1689~1'(= r ) %1688~0'(= r ) 
; #192 5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1691~0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1689~1'(= r ) %1688~0'(= r ) 
; #22 0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1692~0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1689~1'(= r ) %1688~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],5
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2528
LB_2528:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2520
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2519
LB_2520:
	jmp LB_2532
LB_2531:
	add r14,1 
LB_2532:
	cmp r14,r9
	jge LB_2533
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2531
	cmp rax,10 
	jz LB_2531
	cmp rax,32 
	jz LB_2531
LB_2533
	call GRM_219
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2536
	jmp LB_2537
LB_2536:
	jmp LB_2534
LB_2537:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_2535
LB_2534:
	lea rsp,[rsp+8*0]
	jmp LB_2530
LB_2535:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2539
LB_2539
;; rsp=2 , %1695~1'(= r ) %1694~0'(= r ) %1693~{ 8'(= r ) 9'(= r ) } 
	jmp LB_2540
LB_2540:
; $ %[ "lc_code ∎ .. " ] ⊢ %[ "lc_code ∎ .. " ]
;; rsp=2 , %1696~%[ "lc_code ∎ .. " ] %1695~1'(= r ) %1694~0'(= r ) %1693~{ 8'(= r ) 9'(= r ) } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %1697~1(<2)◂{ } %1696~%[ "lc_code ∎ .. " ] %1695~1'(= r ) %1694~0'(= r ) %1693~{ 8'(= r ) 9'(= r ) } 
; #21 { { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %1698~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %1693~{ 8'(= r ) 9'(= r ) } 
; #191 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %1699~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %1693~{ 8'(= r ) 9'(= r ) } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %1700~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %1693~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
; .dlt.ptn { 8'(= r ) 9'(= r ) }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r13
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r14
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,24
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,15
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*2],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],226
	mov BYTE [rax+8+9],136
	mov BYTE [rax+8+10],142
	mov BYTE [rax+8+11],32
	mov BYTE [rax+8+12],46
	mov BYTE [rax+8+13],46
	mov BYTE [rax+8+14],32
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2538
LB_2538:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2530
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2519
LB_2530:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2519
LB_2519:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2541
	jmp LB_2542
LB_2541:
	lea rsp,[rsp+8*1]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_2542:
	mov QWORD [rsp+8*1],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2544
LB_2544
;; rsp=1 , %1701~3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1686~1'(= r ) %1685~0'(= r ) %1684~8'(= a35◂ [ *{ }] ) 
; #22 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1702~0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1686~1'(= r ) %1685~0'(= r ) %1684~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*1]
	jmp LB_2543
LB_2543:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2502
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2502:
	jmp LB_2547
LB_2546:
	add r14,1 
LB_2547:
	cmp r14,r9
	jge LB_2548
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2546
	cmp rax,32 
	jz LB_2546
LB_2548
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2551
	jmp LB_2552
LB_2551:
	jmp LB_2549
LB_2552:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2550
LB_2549:
	lea rsp,[rsp+8*0]
	jmp LB_2545
LB_2550:
	jmp LB_2554
LB_2553:
	add r14,1 
LB_2554:
	cmp r14,r9
	jge LB_2555
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2553
	cmp rax,32 
	jz LB_2553
LB_2555
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2558
	jmp LB_2559
LB_2558:
	mov r8,unt_1
	jmp LB_2556
LB_2559:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],94
	jnz LB_2560
	jmp LB_2561
LB_2560:
	mov r8,unt_1
	jmp LB_2556
LB_2561:
	add r14,1
	jmp LB_2557
LB_2556:
	lea rsp,[rsp+8*1]
	jmp LB_2545
LB_2557:
	jmp LB_2563
LB_2562:
	add r14,1 
LB_2563:
	cmp r14,r9
	jge LB_2564
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2562
	cmp rax,32 
	jz LB_2562
LB_2564
	call GRM_233
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2567
	jmp LB_2568
LB_2567:
	jmp LB_2565
LB_2568:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_2566
LB_2565:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2566:
	jmp LB_2570
LB_2569:
	add r14,1 
LB_2570:
	cmp r14,r9
	jge LB_2571
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2569
	cmp rax,32 
	jz LB_2569
LB_2571
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2574
	jmp LB_2575
LB_2574:
	mov r8,unt_1
	jmp LB_2572
LB_2575:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2576
	jmp LB_2577
LB_2576:
	mov r8,unt_1
	jmp LB_2572
LB_2577:
	add r14,1
	jmp LB_2573
LB_2572:
	lea rsp,[rsp+8*3]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2573:
	jmp LB_2579
LB_2578:
	add r14,1 
LB_2579:
	cmp r14,r9
	jge LB_2580
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2578
	cmp rax,32 
	jz LB_2578
LB_2580
	call GRM_230
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2583
	jmp LB_2584
LB_2583:
	jmp LB_2581
LB_2584:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2582
LB_2581:
	lea rsp,[rsp+8*3]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2582:
	jmp LB_2586
LB_2585:
	add r14,1 
LB_2586:
	cmp r14,r9
	jge LB_2587
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2585
	cmp rax,32 
	jz LB_2585
LB_2587
	call GRM_234
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2590
	jmp LB_2591
LB_2590:
	jmp LB_2588
LB_2591:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2589
LB_2588:
	lea rsp,[rsp+8*4]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2589:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_2593
LB_2595: ; 50 { 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) : ({ _lst◂4076'(=4077'(=_t16◂_t9)) _lst◂_t16◂_t9 }→_lst◂_t16◂_t9)
;; rsp=0 , %112~1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %111~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
;; ? 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_2596
;; rsp=0 , %111~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ret
LB_2596:
;; ? 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %114~3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %113~2'(= a16◂ [ a9◂ [ ]] ) %111~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; #21 { 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
;; rsp=0 , %115~0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } %114~3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; rsp_d=0, #50 { 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 { 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ { 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
; .mov_ptn 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r9
	mov r14,rax
	mov r10,r13
; .mov_ptn 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 4'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,r8
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	call LB_2595

;; rsp=0 , %116~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ret
LB_2594: ; 51 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) : (_lst◂_t16◂_t9→_lst◂_t16◂_t9)
;; rsp=0 , %117~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %118~1(<2)◂{ } %117~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; rsp_d=0, #50 { 1(<2)◂{ } 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 { 1(<2)◂{ } 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ { 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
; .mov_ptn 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	call LB_2595

;; rsp=0 , %119~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ret
LB_2593
;; rsp=5 , %1709~1'(= r ) %1708~0'(= r ) %1707~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1706~11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1705~10'(= a2◂ [ a13◂ [ {| l |}]] ) %1704~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1703~8'(= a35◂ [ *{ }] ) 
; rsp_d=0, #51 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_2594

	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=5 , %1710~2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1709~1'(= r ) %1708~0'(= r ) %1707~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1705~10'(= a2◂ [ a13◂ [ {| l |}]] ) %1704~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1703~8'(= a35◂ [ *{ }] ) 
; #118 { 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=5 , %1711~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1709~1'(= r ) %1708~0'(= r ) %1707~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1703~8'(= a35◂ [ *{ }] ) 
;; ? 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2597
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=5 , %1713~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %1711~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; #128 { 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %1716~2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; #192 2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %1717~0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %1718~0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,r13
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*4]
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,QWORD [rsp-8+8*3]
	mov rdi,r10
	mov QWORD [rdi+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],3
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,r9
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*5]
	jmp LB_2592
LB_2597:
;; ? 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %1712~12'(= a2◂ [ *{ rr{| l |}}] ) %1711~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; #191 12'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %1714~1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] ) %1711~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %1715~0(<2)◂1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] ) %1711~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1709~1'(= r ) %1708~0'(= r ) %1703~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
;	.dlt adt ⊢ _  
;	.dlt adt ⊢ _  
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂12'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*5]
	jmp LB_2592
LB_2592:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2545
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2545:
	jmp LB_2600
LB_2599:
	add r14,1 
LB_2600:
	cmp r14,r9
	jge LB_2601
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2599
	cmp rax,10 
	jz LB_2599
	cmp rax,32 
	jz LB_2599
LB_2601
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2604
	jmp LB_2605
LB_2604:
	jmp LB_2602
LB_2605:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2603
LB_2602:
	lea rsp,[rsp+8*0]
	jmp LB_2598
LB_2603:
	jmp LB_2607
LB_2606:
	add r14,1 
LB_2607:
	cmp r14,r9
	jge LB_2608
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2606
	cmp rax,10 
	jz LB_2606
	cmp rax,32 
	jz LB_2606
LB_2608
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2611
	jmp LB_2612
LB_2611:
	mov r8,unt_1
	jmp LB_2609
LB_2612:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2613
	cmp BYTE [rdi+1],151
	jnz LB_2613
	cmp BYTE [rdi+2],130
	jnz LB_2613
	jmp LB_2614
LB_2613:
	mov r8,unt_1
	jmp LB_2609
LB_2614:
	add r14,3
	jmp LB_2610
LB_2609:
	lea rsp,[rsp+8*1]
	jmp LB_2598
LB_2610:
	jmp LB_2616
LB_2615:
	add r14,1 
LB_2616:
	cmp r14,r9
	jge LB_2617
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2615
	cmp rax,10 
	jz LB_2615
	cmp rax,32 
	jz LB_2615
LB_2617
	call GRM_203
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2620
	jmp LB_2621
LB_2620:
	jmp LB_2618
LB_2621:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2619
LB_2618:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2619:
	jmp LB_2623
LB_2622:
	add r14,1 
LB_2623:
	cmp r14,r9
	jge LB_2624
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2622
	cmp rax,10 
	jz LB_2622
	cmp rax,32 
	jz LB_2622
LB_2624
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2627
	jmp LB_2628
LB_2627:
	mov r8,unt_1
	jmp LB_2625
LB_2628:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_2629
	jmp LB_2630
LB_2629:
	mov r8,unt_1
	jmp LB_2625
LB_2630:
	add r14,1
	jmp LB_2626
LB_2625:
	lea rsp,[rsp+8*2]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2626:
	jmp LB_2632
LB_2631:
	add r14,1 
LB_2632:
	cmp r14,r9
	jge LB_2633
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2631
	cmp rax,10 
	jz LB_2631
	cmp rax,32 
	jz LB_2631
LB_2633
	call GRM_200
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2636
	jmp LB_2637
LB_2636:
	jmp LB_2634
LB_2637:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2635
LB_2634:
	lea rsp,[rsp+8*2]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2635:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2641
LB_2640:
	add r14,1 
LB_2641:
	cmp r14,r9
	jge LB_2642
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2640
	cmp rax,10 
	jz LB_2640
	cmp rax,32 
	jz LB_2640
LB_2642
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2645
	jmp LB_2646
LB_2645:
	mov r8,unt_1
	jmp LB_2643
LB_2646:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2647
	cmp BYTE [rdi+1],138
	jnz LB_2647
	cmp BYTE [rdi+2],162
	jnz LB_2647
	cmp BYTE [rdi+3],124
	jnz LB_2647
	jmp LB_2648
LB_2647:
	mov r8,unt_1
	jmp LB_2643
LB_2648:
	add r14,4
	jmp LB_2644
LB_2643:
	lea rsp,[rsp+8*0]
	jmp LB_2639
LB_2644:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2650
LB_2650
;; rsp=0 , %1725~1'(= r ) %1724~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1726~1(<2)◂{ } %1725~1'(= r ) %1724~0'(= r ) 
; #192 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1727~0(<2)◂1(<2)◂{ } %1725~1'(= r ) %1724~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1728~0(<2)◂0(<2)◂1(<2)◂{ } %1725~1'(= r ) %1724~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2649
LB_2649:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2639
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2638
LB_2639:
	jmp LB_2653
LB_2652:
	add r14,1 
LB_2653:
	cmp r14,r9
	jge LB_2654
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2652
	cmp rax,10 
	jz LB_2652
	cmp rax,32 
	jz LB_2652
LB_2654
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2657
	jmp LB_2658
LB_2657:
	mov r8,unt_1
	jmp LB_2655
LB_2658:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2659
	cmp BYTE [rdi+1],138
	jnz LB_2659
	cmp BYTE [rdi+2],162
	jnz LB_2659
	jmp LB_2660
LB_2659:
	mov r8,unt_1
	jmp LB_2655
LB_2660:
	add r14,3
	jmp LB_2656
LB_2655:
	lea rsp,[rsp+8*0]
	jmp LB_2651
LB_2656:
	jmp LB_2662
LB_2661:
	add r14,1 
LB_2662:
	cmp r14,r9
	jge LB_2663
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2661
	cmp rax,10 
	jz LB_2661
	cmp rax,32 
	jz LB_2661
LB_2663
	call GRM_204
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2666
	jmp LB_2667
LB_2666:
	jmp LB_2664
LB_2667:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2665
LB_2664:
	lea rsp,[rsp+8*0]
	jmp LB_2651
LB_2665:
	jmp LB_2669
LB_2668:
	add r14,1 
LB_2669:
	cmp r14,r9
	jge LB_2670
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2668
	cmp rax,10 
	jz LB_2668
	cmp rax,32 
	jz LB_2668
LB_2670
	call GRM_234
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2673
	jmp LB_2674
LB_2673:
	jmp LB_2671
LB_2674:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2672
LB_2671:
	lea rsp,[rsp+8*1]
	jmp LB_2651
LB_2672:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2676
LB_2676
;; rsp=2 , %1732~1'(= r ) %1731~0'(= r ) %1730~9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1729~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2677
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=2 , %1734~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1732~1'(= r ) %1731~0'(= r ) %1729~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1737~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1732~1'(= r ) %1731~0'(= r ) 
; #192 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1738~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1732~1'(= r ) %1731~0'(= r ) 
; #22 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1739~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1732~1'(= r ) %1731~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
 xor rax,rax 
	mov rdi,rt_err0 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf
	mov rsp,QWORD [rsp_tmp]
	jmp err
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2675
LB_2677:
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1733~9'(= a2◂ [ *{ rr{| l |}}] ) %1732~1'(= r ) %1731~0'(= r ) %1729~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #191 9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1735~1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) %1732~1'(= r ) %1731~0'(= r ) %1729~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1736~0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) %1732~1'(= r ) %1731~0'(= r ) %1729~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a8◂ [ a13◂ [ {| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
; .mov_ptn 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2675
LB_2675:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2651
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2638
LB_2651:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2638
LB_2638:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2678
	jmp LB_2679
LB_2678:
	lea rsp,[rsp+8*3]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_2679:
	mov QWORD [rsp+8*3],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a3◂ [ q0]] ) ⊢ 3'(= a35◂ [ a3◂ [ q0]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a3◂ [ q0]] ) ⊢ 3'(= a35◂ [ a3◂ [ q0]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2681
LB_2681
;; rsp=3 , %1740~3'(= a35◂ [ a3◂ [ q0]] ) %1723~1'(= r ) %1722~0'(= r ) %1721~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1720~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1719~8'(= a35◂ [ *{ }] ) 
;; ? 3'(= a35◂ [ a3◂ [ q0]] ) ⊢ 0(<2)◂2'(= a3◂ [ q0] )
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2682
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=3 , %1742~2'(= a3◂ [ q0] ) %1723~1'(= r ) %1722~0'(= r ) %1721~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1720~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1719~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ q0] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1723~1'(= r ) %1722~0'(= r ) %1721~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1720~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1719~8'(= a35◂ [ *{ }] ) 
; #129 { 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1747~1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1723~1'(= r ) %1722~0'(= r ) %1719~8'(= a35◂ [ *{ }] ) 
; #192 1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1748~0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1723~1'(= r ) %1722~0'(= r ) %1719~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1749~0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1723~1'(= r ) %1722~0'(= r ) %1719~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2680
LB_2682:
;; ? 3'(= a35◂ [ a3◂ [ q0]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1741~3'(= a2◂ [ *{ rr{| l |}}] ) %1723~1'(= r ) %1722~0'(= r ) %1721~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1720~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1719~8'(= a35◂ [ *{ }] ) 
; #191 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1743~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1723~1'(= r ) %1722~0'(= r ) %1721~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1720~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1719~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1744~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1723~1'(= r ) %1722~0'(= r ) %1721~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1720~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1719~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 9'(= a12◂ [ a9◂ [ ]{| l |}] )
;	.dlt adt ⊢ _  
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2680
LB_2680:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2598
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2598:
	jmp LB_2686
LB_2685:
	add r14,1 
LB_2686:
	cmp r14,r9
	jge LB_2687
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2685
	cmp rax,10 
	jz LB_2685
	cmp rax,32 
	jz LB_2685
LB_2687
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2690
	jmp LB_2691
LB_2690:
	jmp LB_2688
LB_2691:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2689
LB_2688:
	lea rsp,[rsp+8*0]
	jmp LB_2684
LB_2689:
	jmp LB_2693
LB_2692:
	add r14,1 
LB_2693:
	cmp r14,r9
	jge LB_2694
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2692
	cmp rax,10 
	jz LB_2692
	cmp rax,32 
	jz LB_2692
LB_2694
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2697
	jmp LB_2698
LB_2697:
	mov r8,unt_1
	jmp LB_2695
LB_2698:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_2699
	cmp BYTE [rdi+1],187
	jnz LB_2699
	jmp LB_2700
LB_2699:
	mov r8,unt_1
	jmp LB_2695
LB_2700:
	add r14,2
	jmp LB_2696
LB_2695:
	lea rsp,[rsp+8*1]
	jmp LB_2684
LB_2696:
	jmp LB_2702
LB_2701:
	add r14,1 
LB_2702:
	cmp r14,r9
	jge LB_2703
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2701
	cmp rax,10 
	jz LB_2701
	cmp rax,32 
	jz LB_2701
LB_2703
	call GRM_232
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2706
	jmp LB_2707
LB_2706:
	jmp LB_2704
LB_2707:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a19◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a19◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2705
LB_2704:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2705:
	jmp LB_2709
LB_2708:
	add r14,1 
LB_2709:
	cmp r14,r9
	jge LB_2710
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2708
	cmp rax,10 
	jz LB_2708
	cmp rax,32 
	jz LB_2708
LB_2710
	call GRM_234
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2713
	jmp LB_2714
LB_2713:
	jmp LB_2711
LB_2714:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2712
LB_2711:
	lea rsp,[rsp+8*2]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_2712:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2716
LB_2716
;; rsp=3 , %1758~1'(= r ) %1757~0'(= r ) %1756~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1755~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1754~8'(= a35◂ [ *{ }] ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2717
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=3 , %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1755~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1754~8'(= a35◂ [ *{ }] ) 
;; ? 9'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 3'(= a11◂ [ a9◂ [ ]] ) 4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 5'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_2718
	mov rdi,QWORD [rsp-8+8*2]
	mov rdi,QWORD [rdi+8+8*0]
	mov r9,rdi
	mov rdi,QWORD [rsp-8+8*2]
	mov rdi,QWORD [rdi+8+8*1]
	mov r10,rdi
	mov rdi,QWORD [rsp-8+8*2]
	mov rdi,QWORD [rdi+8+8*2]
	mov r11,rdi
;; rsp=3 , %1768~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1766~3'(= a11◂ [ a9◂ [ ]] ) %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #91 3'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂3'(= a11◂ [ a9◂ [ ]] )
;; rsp=3 , %1769~0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1768~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #77 0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] )
;; rsp=3 , %1770~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1768~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %1771~1(<2)◂{ } %1770~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1768~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #21 { 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } }
;; rsp=3 , %1772~0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } %1770~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #122 { 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1773~1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1770~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #126 { 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=3 , %1774~4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #192 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=3 , %1775~0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=3 , %1776~0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } %1767~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
; .dlt.ptn 4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov rcx,rax
	mov rax,r11
	mov rdi,rcx
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rcx
	mov QWORD [rdi+8+8*1],rax
	mov rax,rcx
	mov BYTE [rax+6],0
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,r13
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r10
	mov BYTE [rax+6],1
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],4
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2715
LB_2718:
;; rsp=3 , %1760~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1758~1'(= r ) %1757~0'(= r ) %1755~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1754~8'(= a35◂ [ *{ }] ) 
; #128 { 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1763~2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #192 2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1764~0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1765~0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1758~1'(= r ) %1757~0'(= r ) %1754~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2715
LB_2717:
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1759~10'(= a2◂ [ *{ rr{| l |}}] ) %1758~1'(= r ) %1757~0'(= r ) %1755~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1754~8'(= a35◂ [ *{ }] ) 
; #191 10'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1761~1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] ) %1758~1'(= r ) %1757~0'(= r ) %1755~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1754~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1762~0(<2)◂1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] ) %1758~1'(= r ) %1757~0'(= r ) %1755~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1754~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 9'(= a19◂ [ a9◂ [ ]{| l |}] )
;	.dlt adt ⊢ _  
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2715
LB_2715:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2684
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2684:
	jmp LB_2721
LB_2720:
	add r14,1 
LB_2721:
	cmp r14,r9
	jge LB_2722
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2720
	cmp rax,32 
	jz LB_2720
LB_2722
	call GRM_216
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2725
	jmp LB_2726
LB_2725:
	jmp LB_2723
LB_2726:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2724
LB_2723:
	lea rsp,[rsp+8*0]
	jmp LB_2719
LB_2724:
	jmp LB_2728
LB_2727:
	add r14,1 
LB_2728:
	cmp r14,r9
	jge LB_2729
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2727
	cmp rax,32 
	jz LB_2727
LB_2729
	call GRM_188
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2732
	jmp LB_2733
LB_2732:
	jmp LB_2730
LB_2733:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2731
LB_2730:
	lea rsp,[rsp+8*1]
	jmp LB_2719
LB_2731:
	jmp LB_2735
LB_2734:
	add r14,1 
LB_2735:
	cmp r14,r9
	jge LB_2736
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2734
	cmp rax,32 
	jz LB_2734
LB_2736
	call GRM_200
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2739
	jmp LB_2740
LB_2739:
	jmp LB_2737
LB_2740:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2738
LB_2737:
	lea rsp,[rsp+8*2]
	jmp LB_2719
LB_2738:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_2744
LB_2743:
	add r14,1 
LB_2744:
	cmp r14,r9
	jge LB_2745
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2743
	cmp rax,10 
	jz LB_2743
	cmp rax,32 
	jz LB_2743
LB_2745
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2748
	jmp LB_2749
LB_2748:
	mov r8,unt_1
	jmp LB_2746
LB_2749:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2750
	cmp BYTE [rdi+1],138
	jnz LB_2750
	cmp BYTE [rdi+2],162
	jnz LB_2750
	cmp BYTE [rdi+3],124
	jnz LB_2750
	jmp LB_2751
LB_2750:
	mov r8,unt_1
	jmp LB_2746
LB_2751:
	add r14,4
	jmp LB_2747
LB_2746:
	lea rsp,[rsp+8*0]
	jmp LB_2742
LB_2747:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2753
LB_2753
;; rsp=0 , %1783~1'(= r ) %1782~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1784~1(<2)◂{ } %1783~1'(= r ) %1782~0'(= r ) 
; #192 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1785~0(<2)◂1(<2)◂{ } %1783~1'(= r ) %1782~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1786~0(<2)◂0(<2)◂1(<2)◂{ } %1783~1'(= r ) %1782~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2752
LB_2752:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2742
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2741
LB_2742:
	jmp LB_2756
LB_2755:
	add r14,1 
LB_2756:
	cmp r14,r9
	jge LB_2757
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2755
	cmp rax,32 
	jz LB_2755
LB_2757
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2760
	jmp LB_2761
LB_2760:
	mov r8,unt_1
	jmp LB_2758
LB_2761:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2762
	cmp BYTE [rdi+1],138
	jnz LB_2762
	cmp BYTE [rdi+2],162
	jnz LB_2762
	jmp LB_2763
LB_2762:
	mov r8,unt_1
	jmp LB_2758
LB_2763:
	add r14,3
	jmp LB_2759
LB_2758:
	lea rsp,[rsp+8*0]
	jmp LB_2754
LB_2759:
	jmp LB_2765
LB_2764:
	add r14,1 
LB_2765:
	cmp r14,r9
	jge LB_2766
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2764
	cmp rax,32 
	jz LB_2764
LB_2766
	call GRM_204
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2769
	jmp LB_2770
LB_2769:
	jmp LB_2767
LB_2770:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2768
LB_2767:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2741
LB_2768:
	jmp LB_2772
LB_2771:
	add r14,1 
LB_2772:
	cmp r14,r9
	jge LB_2773
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2771
	cmp rax,32 
	jz LB_2771
LB_2773
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2776
	jmp LB_2777
LB_2776:
	mov r8,unt_1
	jmp LB_2774
LB_2777:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2778
	jmp LB_2779
LB_2778:
	mov r8,unt_1
	jmp LB_2774
LB_2779:
	add r14,1
	jmp LB_2775
LB_2774:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2741
LB_2775:
	jmp LB_2781
LB_2780:
	add r14,1 
LB_2781:
	cmp r14,r9
	jge LB_2782
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2780
	cmp rax,32 
	jz LB_2780
LB_2782
	call GRM_234
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2785
	jmp LB_2786
LB_2785:
	jmp LB_2783
LB_2786:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2784
LB_2783:
	lea rsp,[rsp+8*1]
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2741
LB_2784:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2788
LB_2788
;; rsp=2 , %1790~1'(= r ) %1789~0'(= r ) %1788~9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1787~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2789
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=2 , %1792~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1790~1'(= r ) %1789~0'(= r ) %1787~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1795~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1790~1'(= r ) %1789~0'(= r ) 
; #192 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1796~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1790~1'(= r ) %1789~0'(= r ) 
; #22 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1797~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1790~1'(= r ) %1789~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
 xor rax,rax 
	mov rdi,rt_err0 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf
	mov rsp,QWORD [rsp_tmp]
	jmp err
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2787
LB_2789:
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1791~9'(= a2◂ [ *{ rr{| l |}}] ) %1790~1'(= r ) %1789~0'(= r ) %1787~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #191 9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1793~1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) %1790~1'(= r ) %1789~0'(= r ) %1787~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1794~0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) %1790~1'(= r ) %1789~0'(= r ) %1787~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a8◂ [ a13◂ [ {| l |}]] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
; .mov_ptn 0(<2)◂1(<2)◂9'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*2]
	jmp LB_2787
LB_2787:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2754
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2741
LB_2754:
	jmp LB_2792
LB_2791:
	add r14,1 
LB_2792:
	cmp r14,r9
	jge LB_2793
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2791
	cmp rax,32 
	jz LB_2791
LB_2793
	call GRM_219
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2796
	jmp LB_2797
LB_2796:
	jmp LB_2794
LB_2797:
	lea rsp,[rsp-8*2]
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*0]
	mov r10,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi+8+8*1]
	mov r11,rdi
	jmp LB_2795
LB_2794:
	lea rsp,[rsp+8*0]
	jmp LB_2790
LB_2795:
	jmp LB_2799
LB_2798:
	add r14,1 
LB_2799:
	cmp r14,r9
	jge LB_2800
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_2798
	cmp rax,32 
	jz LB_2798
LB_2800
	call GRM_234
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2803
	jmp LB_2804
LB_2803:
	jmp LB_2801
LB_2804:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2802
LB_2801:
	lea rsp,[rsp+8*2]
	jmp LB_2790
LB_2802:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2806
LB_2806
;; rsp=3 , %1802~1'(= r ) %1801~0'(= r ) %1800~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1799~9'(= r ) %1798~8'(= r ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2807
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=3 , %1804~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1802~1'(= r ) %1801~0'(= r ) %1799~9'(= r ) %1798~8'(= r ) 
	jmp LB_2808
LB_2808:
; $ %[ "lc_code 20" ] ⊢ %[ "lc_code 20" ]
;; rsp=3 , %1809~%[ "lc_code 20" ] %1804~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1802~1'(= r ) %1801~0'(= r ) %1799~9'(= r ) %1798~8'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %1810~1(<2)◂{ } %1809~%[ "lc_code 20" ] %1804~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1802~1'(= r ) %1801~0'(= r ) %1799~9'(= r ) %1798~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %1811~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %1804~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1802~1'(= r ) %1801~0'(= r ) 
; #191 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %1812~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %1804~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1802~1'(= r ) %1801~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %1813~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %1804~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1802~1'(= r ) %1801~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a17◂ [ a9◂ [ ]{| l |}] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,24
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,10
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*2],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],50
	mov BYTE [rax+8+9],48
	mov rdi,r14
	mov QWORD [rdi+8+8*2],rax
	mov rax,r14
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2805
LB_2807:
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂10'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1803~10'(= a2◂ [ *{ rr{| l |}}] ) %1802~1'(= r ) %1801~0'(= r ) %1799~9'(= r ) %1798~8'(= r ) 
	jmp LB_2809
LB_2809:
; $ %[ "lc_code 21" ] ⊢ %[ "lc_code 21" ]
;; rsp=3 , %1805~%[ "lc_code 21" ] %1803~10'(= a2◂ [ *{ rr{| l |}}] ) %1802~1'(= r ) %1801~0'(= r ) %1799~9'(= r ) %1798~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1806~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } %1802~1'(= r ) %1801~0'(= r ) 
; #191 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1807~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } %1802~1'(= r ) %1801~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1808~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } %1802~1'(= r ) %1801~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 10'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ q0]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,[SS_RCD_3_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_3_TOP],rsi
	mov QWORD [rax],0
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,1  
	mov rsi,24
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,10
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*2],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],108
	mov BYTE [rax+8+1],99
	mov BYTE [rax+8+2],95
	mov BYTE [rax+8+3],99
	mov BYTE [rax+8+4],111
	mov BYTE [rax+8+5],100
	mov BYTE [rax+8+6],101
	mov BYTE [rax+8+7],32
	mov BYTE [rax+8+8],50
	mov BYTE [rax+8+9],49
	mov rdi,r14
	mov QWORD [rdi+8+8*2],rax
	mov rax,r14
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2805
LB_2805:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2790
	pop r14
	pop r9
	add rsp,8
	pop r13
	jmp LB_2741
LB_2790:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_2741
LB_2741:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2810
	jmp LB_2811
LB_2810:
	lea rsp,[rsp+8*3]
	add rsp,8
	pop r9 
	pop r14 
	pop r13
	ret
LB_2811:
	mov QWORD [rsp+8*3],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a3◂ [ q0]] ) ⊢ 3'(= a35◂ [ a3◂ [ q0]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a3◂ [ q0]] ) ⊢ 3'(= a35◂ [ a3◂ [ q0]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2813
LB_2813
;; rsp=3 , %1814~3'(= a35◂ [ a3◂ [ q0]] ) %1781~1'(= r ) %1780~0'(= r ) %1779~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1778~9'(= a9◂ [ ] ) %1777~8'(= a35◂ [ *{ }] ) 
;; ? 3'(= a35◂ [ a3◂ [ q0]] ) ⊢ 0(<2)◂2'(= a3◂ [ q0] )
	mov rdi,r9
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2814
	mov rax,QWORD [rdi+8]
	mov r8,rax
;; rsp=3 , %1816~2'(= a3◂ [ q0] ) %1781~1'(= r ) %1780~0'(= r ) %1779~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1778~9'(= a9◂ [ ] ) %1777~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ q0] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1781~1'(= r ) %1780~0'(= r ) %1779~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1778~9'(= a9◂ [ ] ) %1777~8'(= a35◂ [ *{ }] ) 
; #130 { 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1821~0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1781~1'(= r ) %1780~0'(= r ) %1777~8'(= a35◂ [ *{ }] ) 
; #192 0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1822~0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1781~1'(= r ) %1780~0'(= r ) %1777~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1823~0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1781~1'(= r ) %1780~0'(= r ) %1777~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2812
LB_2814:
;; ? 3'(= a35◂ [ a3◂ [ q0]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1815~3'(= a2◂ [ *{ rr{| l |}}] ) %1781~1'(= r ) %1780~0'(= r ) %1779~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1778~9'(= a9◂ [ ] ) %1777~8'(= a35◂ [ *{ }] ) 
; #191 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1817~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1781~1'(= r ) %1780~0'(= r ) %1779~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1778~9'(= a9◂ [ ] ) %1777~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1818~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1781~1'(= r ) %1780~0'(= r ) %1779~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1778~9'(= a9◂ [ ] ) %1777~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= r )
; .dlt.ptn 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;	.dlt adt ⊢ _  
; .dlt.ptn 9'(= a9◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 8'(= a35◂ [ *{ }] )
;	.dlt adt ⊢ _  
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,[SS_LN_TOP]
	mov rsi,[rax]
	mov QWORD [SS_LN_TOP],rsi 
	mov QWORD [rax],0
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	lea rsp,[rsp+8*3]
	jmp LB_2812
LB_2812:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2719
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2719:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2818
LB_2818
;; rsp=0 , %1829~1'(= r ) %1828~0'(= r ) 
; ∎| 
	jmp LB_2820
LB_2819: db 101,120,110,32,52,50,56,49,54,58,10,0
LB_2820:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_2819
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp err
LB_2817:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_2816
	pop r14
	pop r9
	add rsp,8
	pop r13
	ret
LB_2816:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_0:
	mov rdi,0
	mov QWORD rdi,rsp
	and rsp,~0xf
	push rdi
	call exit
	pop rdi
	mov rsp,rdi

err: 
	mov rdi,fmt_err_line
	mov rsi,QWORD [err_n]
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rax,1
	mov rbx,0
	int 0x80
