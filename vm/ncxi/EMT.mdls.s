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
LB_0: ; 30 { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) } ⊢ 0'(= a2◂ [ r] ) : ({ _lst◂_r64 _lst◂92'(=_r64) }→_lst◂_r64)
;; rsp=0 , %1~1'(= a2◂ [ r] ) %0~0'(= a2◂ [ r] ) 
;; ? 0'(= a2◂ [ r] ) ⊢ 0(<2)◂{ 2'(= r ) 3'(= a2◂ [ r] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*0]
	mov r8,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi+8+8*1]
	mov r9,rdi
;; rsp=0 , %3~3'(= a2◂ [ r] ) %2~2'(= r ) %1~1'(= a2◂ [ r] ) 
; #21 { 2'(= r ) 1'(= a2◂ [ r] ) } ⊢ 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) }
;; rsp=0 , %4~0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } %3~3'(= a2◂ [ r] ) 
; rsp_d=0 , #30 { 3'(= a2◂ [ r] ) 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } } ⊢| 
; .mov_ptn2 { 3'(= a2◂ [ r] ) 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } } ⊢ { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) }
	mov r10,r14
; .mov_ptn 0(<2)◂{ 2'(= r ) 4'(= a2◂ [ r] ) } ⊢ 1'(= a2◂ [ r] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r13,rax
	mov rax,r8
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r14,rax
; .mov_ptn 3'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	mov rax,r9
	mov r13,rax
	call LB_0

; .mov_ptn2 0'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	ret
LB_1:
;; ? 0'(= a2◂ [ r] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1~1'(= a2◂ [ r] ) 
; ∎ 1'(= a2◂ [ r] )
; .mov_ptn2 1'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
; .mov_ptn 1'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	mov rax,r14
	mov r13,rax
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %5~1(<2)◂{ } 
; #21 { %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %6~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } 
; #21 { %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } }
;; rsp=0 , %7~0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } 
; #21 { %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } ⊢ 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } }
;; rsp=0 , %8~0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %9~1(<2)◂{ } %8~0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 
; rsp_d=0, #30 { 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ 0'(= a2◂ [ r] )
; .mov_ptn2 { 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) }
; .mov_ptn 1(<2)◂{ } ⊢ 1'(= a2◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r14,rax
; .mov_ptn 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } ⊢ 0'(= a2◂ [ r] )
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r8,rax
	mov rax,8
	mov rdi,r8
	mov QWORD [rdi+8+8*0],rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r9,rax
	mov rax,3
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rax,[SS_RCD_2_TOP]
	mov rsi,[rax] 
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rax],0
	mov r10,rax
	mov rax,0
	mov rdi,r10
	mov QWORD [rdi+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,r10
	mov QWORD [rdi+8+8*1],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,r8
	mov QWORD [rdi+8+8*1],rax
	mov rax,r8
	mov BYTE [rax+6],0
	mov r13,rax
	call LB_0

;; rsp=0 , %10~0'(= a2◂ [ r] ) 
; _emt 0'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	jmp LB_3
LB_2: db 95,101,109,116,58,0
LB_3:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_2
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
	mov rax,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_4
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_6
LB_5: db 10,0
LB_6:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_5
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
	jmp LB_7
LB_4:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_10+8*rax]
LB_10: dq LB_8,LB_9
LB_8:
	jmp LB_13
LB_12: db 39,48,226,151,130,0
LB_13:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_12
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
	jmp LB_15
LB_14: db 42,123,32,0
LB_15:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_14
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
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r8 
	jmp LB_17
LB_16: db 32,0
LB_17:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_16
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
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4
	pop r8 
	jmp LB_19
LB_18: db 32,0
LB_19:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_18
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
	jmp LB_21
LB_20: db 125,32,0
LB_21:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_20
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
	jmp LB_11
LB_9:
	jmp LB_23
LB_22: db 39,49,226,151,130,0
LB_23:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_22
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
	jmp LB_25
LB_24: db 42,123,32,0
LB_25:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_24
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
	jmp LB_27
LB_26: db 125,32,0
LB_27:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_26
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
	jmp LB_11
LB_11:
	ret
LB_7:
; .dlt.ptn 0'(= a2◂ [ r] )
;	.dlt adt ⊢ _  
;; rsp=0 , 
; ∎
RTM_1:
	push RTM_2
;; rsp=0 , 
	jmp LB_28
LB_28:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %12~%[ 0r ] 
; _emt %[ 0r ] ⊢ %[ 0r ]
	jmp LB_30
LB_29: db 95,101,109,116,58,0
LB_30:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_29
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
	jmp LB_32
LB_31: db 48,114,0
LB_32:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_31
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
	jmp LB_34
LB_33: db 10,0
LB_34:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_33
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
	jmp LB_35
LB_35:
;; rsp=0 , %13~%[ 0r ] 
; ∎
RTM_2:
	push RTM_3
;; rsp=0 , %13~%[ 0r ] 
; _inc %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %14~%[ 1r ] 
; _emt %[ 1r ] ⊢ %[ 1r ]
	jmp LB_37
LB_36: db 95,101,109,116,58,0
LB_37:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_36
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
	jmp LB_39
LB_38: db 49,114,0
LB_39:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_38
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
	jmp LB_41
LB_40: db 10,0
LB_41:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_40
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
	jmp LB_42
LB_42:
;; rsp=0 , %15~%[ 1r ] 
; ∎
RTM_3:
	push RTM_4
;; rsp=0 , %15~%[ 1r ] 
	jmp LB_43
LB_43:
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %16~%[ 4r ] %15~%[ 1r ] 
; _add { %[ 1r ] %[ 4r ] } ⊢ { 0'(= r ) 1'(= r ) }
	mov r14,4
	mov r13,1
	add r13,r14
;; rsp=0 , %18~1'(= r ) %17~0'(= r ) 
; _emt { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	jmp LB_45
LB_44: db 95,101,109,116,58,0
LB_45:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_44
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
	jmp LB_47
LB_46: db 123,32,0
LB_47:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_46
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
	mov rax,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_49
LB_48: db 32,0
LB_49:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_48
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
	mov rax,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
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
	jmp LB_51
LB_50: db 32,0
LB_51:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_50
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
	jmp LB_53
LB_52: db 125,32,0
LB_53:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_52
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
	jmp LB_55
LB_54: db 10,0
LB_55:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_54
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
	jmp LB_56
LB_56:
; .dlt.ptn { 0'(= r ) 1'(= r ) }
;; rsp=0 , 
; ∎
RTM_4:
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
