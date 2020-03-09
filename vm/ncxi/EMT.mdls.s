bits 64 
%define SS_MAX 2000
%define SS_NULL 0xffff_ffff_ffff_0000
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern free 
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

arr_of_lst: 
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
LB_83: ; 28 { 0'(= a2◂ [ {| l |}] ) 1'(= a2◂ [ {| l |}] ) } ⊢ 0'(= a2◂ [ {| l |}] ) : ({ _lst◂_s8 _lst◂_s8 }→_lst◂_s8)
;; rsp=0 , %1~1'(= a2◂ [ {| l |}] ) %0~0'(= a2◂ [ {| l |}] ) 
;; ? 0'(= a2◂ [ {| l |}] ) ⊢ 0(<2)◂{ 2'(= {| l |} ) 3'(= a2◂ [ {| l |}] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_84
	mov rdi,r13
	mov r8,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*1]
;; rsp=0 , %3~3'(= a2◂ [ {| l |}] ) %2~2'(= {| l |} ) %1~1'(= a2◂ [ {| l |}] ) 
; #21 { 2'(= {| l |} ) 1'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 2'(= {| l |} ) 1'(= a2◂ [ {| l |}] ) }
;; rsp=0 , %4~0(<2)◂{ 2'(= {| l |} ) 1'(= a2◂ [ {| l |}] ) } %3~3'(= a2◂ [ {| l |}] ) 
; rsp_d=0 , #28 { 3'(= a2◂ [ {| l |}] ) 0(<2)◂{ 2'(= {| l |} ) 1'(= a2◂ [ {| l |}] ) } } ⊢| 
; .mov_ptn2 { 3'(= a2◂ [ {| l |}] ) 0(<2)◂{ 2'(= {| l |} ) 1'(= a2◂ [ {| l |}] ) } } ⊢ { 0'(= a2◂ [ {| l |}] ) 1'(= a2◂ [ {| l |}] ) }
	mov r10,r14
; .mov_ptn 0(<2)◂{ 2'(= {| l |} ) 4'(= a2◂ [ {| l |}] ) } ⊢ 1'(= a2◂ [ {| l |}] )
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r14,rdi
	mov r13,r8
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov r13,r10
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r14
	mov BYTE [rdi+6],0
; .mov_ptn 3'(= a2◂ [ {| l |}] ) ⊢ 0'(= a2◂ [ {| l |}] )
	mov r13,r9
	call LB_83

; .mov_ptn2 0'(= a2◂ [ {| l |}] ) ⊢ 0'(= a2◂ [ {| l |}] )
	ret
LB_84:
;; ? 0'(= a2◂ [ {| l |}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1~1'(= a2◂ [ {| l |}] ) 
; ∎ 1'(= a2◂ [ {| l |}] )
; .mov_ptn2 1'(= a2◂ [ {| l |}] ) ⊢ 0'(= a2◂ [ {| l |}] )
; .mov_ptn 1'(= a2◂ [ {| l |}] ) ⊢ 0'(= a2◂ [ {| l |}] )
	mov r13,r14
	ret
LB_55: ; 28 { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) } ⊢ 0'(= a2◂ [ r] ) : ({ _lst◂_r64 _lst◂_r64 }→_lst◂_r64)
;; rsp=0 , %1~1'(= a2◂ [ r] ) %0~0'(= a2◂ [ r] ) 
;; ? 0'(= a2◂ [ r] ) ⊢ 0(<2)◂{ 2'(= r ) 3'(= a2◂ [ r] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_56
	mov rdi,r13
	mov r8,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*1]
;; rsp=0 , %3~3'(= a2◂ [ r] ) %2~2'(= r ) %1~1'(= a2◂ [ r] ) 
; #21 { 2'(= r ) 1'(= a2◂ [ r] ) } ⊢ 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) }
;; rsp=0 , %4~0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } %3~3'(= a2◂ [ r] ) 
; rsp_d=0 , #28 { 3'(= a2◂ [ r] ) 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } } ⊢| 
; .mov_ptn2 { 3'(= a2◂ [ r] ) 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } } ⊢ { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) }
	mov r10,r14
; .mov_ptn 0(<2)◂{ 2'(= r ) 4'(= a2◂ [ r] ) } ⊢ 1'(= a2◂ [ r] )
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r14,rdi
	mov r13,r8
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*0],rax
	mov r13,r10
	mov rax,r13
	mov rdi,r14
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r14
	mov BYTE [rdi+6],0
; .mov_ptn 3'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	mov r13,r9
	call LB_55

; .mov_ptn2 0'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	ret
LB_56:
;; ? 0'(= a2◂ [ r] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1~1'(= a2◂ [ r] ) 
; ∎ 1'(= a2◂ [ r] )
; .mov_ptn2 1'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
; .mov_ptn 1'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	mov r13,r14
	ret
LB_41: ; 29 { 0'(= {| l |} ) 1'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) } : ({ _s8 _s8 }→{ _s8 _s8 })
;; rsp=0 , %6~1'(= {| l |} ) %5~0'(= {| l |} ) 
; ∎ { 1'(= {| l |} ) 0'(= {| l |} ) }
; .mov_ptn2 { 1'(= {| l |} ) 0'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
	mov r8,r13
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov r13,r14
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r8
	ret
LB_14: ; 29 { 0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _s8 _r64 }→{ _r64 _s8 })
;; rsp=0 , %6~1'(= r ) %5~0'(= {| l |} ) 
; ∎ { 1'(= r ) 0'(= {| l |} ) }
; .mov_ptn2 { 1'(= r ) 0'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	mov r8,r13
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov r13,r14
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r8
	ret
LB_0: ; 29 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= r ) } : ({ _r64 _s8 }→{ _s8 _r64 })
;; rsp=0 , %6~1'(= {| l |} ) %5~0'(= r ) 
; ∎ { 1'(= {| l |} ) 0'(= r ) }
; .mov_ptn2 { 1'(= {| l |} ) 0'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov r13,r14
; .mov_ptn 2'(= r ) ⊢ 1'(= r )
	mov r14,r8
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; rsp_d=0, #29 { %[ 0r ] %[ "HO" ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { %[ 0r ] %[ "HO" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "HO" ] ⊢ 1'(= {| l |} )
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
	mov BYTE [rax+8+0],72
	mov BYTE [rax+8+1],79
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov r13,0
	call LB_0

;; rsp=0 , %8~1'(= r ) %7~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
	jmp LB_2
LB_1: db 95,101,109,116,58,0
LB_2:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_1
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
	jmp LB_4
LB_3: db 123,32,0
LB_4:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_3
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
	jmp LB_6
LB_5: db 32,0
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
	jmp LB_8
LB_7: db 32,0
LB_8:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_7
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
	jmp LB_10
LB_9: db 125,32,0
LB_10:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_9
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
	jmp LB_12
LB_11: db 10,0
LB_12:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_11
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
	jmp LB_13
LB_13:
; .dlt.ptn { 0'(= {| l |} ) 1'(= r ) }
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
;; rsp=0 , 
; rsp_d=0, #29 { %[ "Rii" ] %[ 3r ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { %[ "Rii" ] %[ 3r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 3r ] ⊢ 1'(= r )
	mov r14,3
; .mov_ptn %[ "Rii" ] ⊢ 0'(= {| l |} )
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
	mov rdi,3
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
	mov BYTE [rax+8+0],82
	mov BYTE [rax+8+1],105
	mov BYTE [rax+8+2],105
	mov r13,rax
	call LB_14

;; rsp=0 , %11~1'(= {| l |} ) %10~0'(= r ) 
; _emt { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	jmp LB_16
LB_15: db 95,101,109,116,58,0
LB_16:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_15
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
	jmp LB_18
LB_17: db 123,32,0
LB_18:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_17
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
	jmp LB_20
LB_19: db 32,0
LB_20:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_19
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
	jmp LB_22
LB_21: db 32,0
LB_22:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_21
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
	jmp LB_24
LB_23: db 125,32,0
LB_24:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_23
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
	jmp LB_26
LB_25: db 10,0
LB_26:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_25
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
LB_27:
; .dlt.ptn { 0'(= r ) 1'(= {| l |} ) }
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
;; rsp=0 , 
; rsp_d=0, #29 { %[ 2r ] %[ "eWp" ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { %[ 2r ] %[ "eWp" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "eWp" ] ⊢ 1'(= {| l |} )
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
	mov rdi,3
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
	mov BYTE [rax+8+0],101
	mov BYTE [rax+8+1],87
	mov BYTE [rax+8+2],112
	mov r14,rax
; .mov_ptn %[ 2r ] ⊢ 0'(= r )
	mov r13,2
	call LB_0

;; rsp=0 , %14~1'(= r ) %13~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
	jmp LB_29
LB_28: db 95,101,109,116,58,0
LB_29:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_28
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
	jmp LB_31
LB_30: db 123,32,0
LB_31:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_30
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
	jmp LB_33
LB_32: db 32,0
LB_33:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_32
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
	jmp LB_35
LB_34: db 32,0
LB_35:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_34
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
	jmp LB_37
LB_36: db 125,32,0
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
LB_38: db 10,0
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
	jmp LB_40
LB_40:
; .dlt.ptn { 0'(= {| l |} ) 1'(= r ) }
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
;; rsp=0 , 
; rsp_d=0, #29 { %[ "XmI" ] %[ "HO" ] } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
; .mov_ptn2 { %[ "XmI" ] %[ "HO" ] } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
; .mov_ptn %[ "HO" ] ⊢ 1'(= {| l |} )
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
	mov BYTE [rax+8+0],72
	mov BYTE [rax+8+1],79
	mov r14,rax
; .mov_ptn %[ "XmI" ] ⊢ 0'(= {| l |} )
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
	mov rdi,3
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
	mov BYTE [rax+8+0],88
	mov BYTE [rax+8+1],109
	mov BYTE [rax+8+2],73
	mov r13,rax
	call LB_41

;; rsp=0 , %17~1'(= {| l |} ) %16~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
	jmp LB_43
LB_42: db 95,101,109,116,58,0
LB_43:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_42
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
	jmp LB_45
LB_44: db 123,32,0
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
	mov rax,r13
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
	jmp LB_47
LB_46: db 32,0
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
	mov rax,r14
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
	jmp LB_51
LB_50: db 125,32,0
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
LB_52: db 10,0
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
	jmp LB_54
LB_54:
; .dlt.ptn { 0'(= {| l |} ) 1'(= {| l |} ) }
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
;; rsp=0 , 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %19~1(<2)◂{ } 
; #21 { %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %20~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } 
; #21 { %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } }
;; rsp=0 , %21~0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } 
; #21 { %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } ⊢ 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } }
;; rsp=0 , %22~0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %23~1(<2)◂{ } %22~0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 
; rsp_d=0, #28 { 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ 0'(= a2◂ [ r] )
; .mov_ptn2 { 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) }
; .mov_ptn 1(<2)◂{ } ⊢ 1'(= a2◂ [ r] )
	mov rdi,unt
	mov r14,rdi
	mov rdi,unt_1
	mov r14,rdi
; .mov_ptn 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } ⊢ 0'(= a2◂ [ r] )
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov r8,8
	mov rax,r8
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r8,rdi
	mov r9,3
	mov rax,r9
	mov rdi,r8
	mov QWORD [rdi+8+8*0],rax
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r9,rdi
	mov r10,0
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rdi,unt
	mov r10,rdi
	mov rdi,unt_1
	mov r10,rdi
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r9
	mov BYTE [rdi+6],0
	mov rax,r9
	mov rdi,r8
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r8
	mov BYTE [rdi+6],0
	mov rax,r8
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
	call LB_55

;; rsp=0 , %24~0'(= a2◂ [ r] ) 
; _emt 0'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	jmp LB_58
LB_57: db 95,101,109,116,58,0
LB_58:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_57
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
	call LB_59
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_61
LB_60: db 10,0
LB_61:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_60
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
	jmp LB_62
LB_59:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_65+8*rax]
LB_65: dq LB_63,LB_64
LB_63:
	jmp LB_68
LB_67: db 39,48,226,151,130,0
LB_68:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_67
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
	jmp LB_70
LB_69: db 42,123,32,0
LB_70:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_69
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
	jmp LB_72
LB_71: db 32,0
LB_72:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_71
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
	call LB_59
	pop r8 
	jmp LB_74
LB_73: db 32,0
LB_74:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_73
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
	jmp LB_76
LB_75: db 125,32,0
LB_76:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_75
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
	jmp LB_66
LB_64:
	jmp LB_78
LB_77: db 39,49,226,151,130,0
LB_78:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_77
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
	jmp LB_80
LB_79: db 42,123,32,0
LB_80:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_79
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
	jmp LB_82
LB_81: db 125,32,0
LB_82:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_81
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
	jmp LB_66
LB_66:
	ret
LB_62:
; .dlt.ptn 0'(= a2◂ [ r] )
;	.dlt adt ⊢ _  
;; rsp=0 , 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %26~1(<2)◂{ } 
; #21 { %[ "O" ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ "O" ] 1(<2)◂{ } }
;; rsp=0 , %27~0(<2)◂{ %[ "O" ] 1(<2)◂{ } } 
; #21 { %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } }
;; rsp=0 , %28~0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } 
; #21 { %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } } ⊢ 0(<2)◂{ %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } }
;; rsp=0 , %29~0(<2)◂{ %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %30~1(<2)◂{ } %29~0(<2)◂{ %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } } 
; rsp_d=0, #28 { 0(<2)◂{ %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ 0'(= a2◂ [ {| l |}] )
; .mov_ptn2 { 0(<2)◂{ %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ { 0'(= a2◂ [ {| l |}] ) 1'(= a2◂ [ {| l |}] ) }
; .mov_ptn 1(<2)◂{ } ⊢ 1'(= a2◂ [ {| l |}] )
	mov rdi,unt
	mov r14,rdi
	mov rdi,unt_1
	mov r14,rdi
; .mov_ptn 0(<2)◂{ %[ "y" ] 0(<2)◂{ %[ "N" ] 0(<2)◂{ %[ "O" ] 1(<2)◂{ } } } } ⊢ 0'(= a2◂ [ {| l |}] )
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
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
	mov BYTE [rax+8+0],121
	mov r8,rax
	mov rax,r8
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r8,rdi
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
	mov BYTE [rax+8+0],78
	mov r9,rax
	mov rax,r9
	mov rdi,r8
	mov QWORD [rdi+8+8*0],rax
	mov rdi,[SS_RCD_2_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_RCD_2_TOP],rsi
	mov QWORD [rdi],0
	mov r9,rdi
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
	mov BYTE [rax+8+0],79
	mov r10,rax
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*0],rax
	mov rdi,unt
	mov r10,rdi
	mov rdi,unt_1
	mov r10,rdi
	mov rax,r10
	mov rdi,r9
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r9
	mov BYTE [rdi+6],0
	mov rax,r9
	mov rdi,r8
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r8
	mov BYTE [rdi+6],0
	mov rax,r8
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
	call LB_83

;; rsp=0 , %31~0'(= a2◂ [ {| l |}] ) 
; _emt 0'(= a2◂ [ {| l |}] ) ⊢ 0'(= a2◂ [ {| l |}] )
	jmp LB_86
LB_85: db 95,101,109,116,58,0
LB_86:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_85
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
	call LB_87
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_89
LB_88: db 10,0
LB_89:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_88
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
	jmp LB_90
LB_87:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_93+8*rax]
LB_93: dq LB_91,LB_92
LB_91:
	jmp LB_96
LB_95: db 39,48,226,151,130,0
LB_96:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_95
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
	jmp LB_98
LB_97: db 42,123,32,0
LB_98:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_97
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
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r8 
	jmp LB_100
LB_99: db 32,0
LB_100:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_99
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
	call LB_87
	pop r8 
	jmp LB_102
LB_101: db 32,0
LB_102:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_101
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
	jmp LB_104
LB_103: db 125,32,0
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
	jmp LB_94
LB_92:
	jmp LB_106
LB_105: db 39,49,226,151,130,0
LB_106:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_105
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
	jmp LB_108
LB_107: db 42,123,32,0
LB_108:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_107
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
	jmp LB_110
LB_109: db 125,32,0
LB_110:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_109
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
	jmp LB_94
LB_94:
	ret
LB_90:
;; rsp=0 , %32~0'(= a2◂ [ {| l |}] ) 
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call arr_of_lst 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r13,rax
;; rsp=0 , %33~0'(= {| {| l |}|} ) 
; _emt 0'(= {| {| l |}|} ) ⊢ 0'(= {| {| l |}|} )
	jmp LB_112
LB_111: db 95,101,109,116,58,0
LB_112:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_111
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
	jmp LB_114
LB_113: db 123,124,32,0
LB_114:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_113
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
	mov rsi,[r8]
	mov rax,0 
LB_115:
	cmp rsi,rax 
	jz LB_116
	push r8 
	push rax 
	push rsi 
	mov r8,QWORD [r8+8+8*rax]
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_118
LB_117: db 32,0
LB_118:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_117
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
	pop rsi 
	pop rax 
	pop r8 
	add rax,1 
	jmp LB_115
LB_116:
	jmp LB_120
LB_119: db 124,125,0
LB_120:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_119
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
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_122
LB_121: db 10,0
LB_122:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_121
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
	jmp LB_123
LB_123:
;; rsp=0 , %34~0'(= {| {| l |}|} ) 
; _arr_len 0'(= {| {| l |}|} ) ⊢ { 0'(= {| {| l |}|} ) 1'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r14,rdi
;; rsp=0 , %36~1'(= r ) %35~0'(= {| {| l |}|} ) 
; _emt 1'(= r ) ⊢ 1'(= r )
	jmp LB_125
LB_124: db 95,101,109,116,58,0
LB_125:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_124
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
	jmp LB_127
LB_126: db 10,0
LB_127:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_126
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
	jmp LB_128
LB_128:
; .dlt.ptn 1'(= r )
;; rsp=0 , %35~0'(= {| {| l |}|} ) 
; ∎ { }
; .dlt.ptn 0'(= {| {| l |}|} )
; .dlt.hp 
; .mov_ptn2 { } ⊢ { }
	ret
ETR_30: ; f0 0'(= r ) ⊢ 0'(= q0 ) : (_r64→134'(0))
;; rsp=0 , %38~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %39~0'(= r ) 
; rsp_d=0, #31 0'(= r ) ⊢ 0'(= q0 )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_31

;; rsp=0 , %40~0'(= q0 ) 
; ∎ 0'(= q0 )
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
	ret
ETR_31: ; f1 0'(= r ) ⊢ 0'(= q0 ) : (_r64→134'(0))
;; rsp=0 , %41~0'(= r ) 
; _sub 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %42~0'(= r ) 
; rsp_d=0, #30 0'(= r ) ⊢ 0'(= q0 )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_30

;; rsp=0 , %43~0'(= q0 ) 
; ∎ 0'(= q0 )
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
	ret
RTM_1:
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
