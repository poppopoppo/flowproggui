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
extern strlen
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

stat: resb 144
struc STAT
	.st_dev         resq 1
	.st_ino         resq 1
	.st_mode        resd 1
	.st_nlink       resd 1
	.st_uid         resd 1
	.st_gid         resd 1
	.st_rdev        resq 1
	.pad1           resq 1
	.st_size        resq 1
	.st_blksize     resd 1
	.pad2 resd 1
	.st_blocks      resq 1
	.st_atime       resq 1
	.st_atime_nsec  resq 1
	.st_mtime       resq 1
	.st_mtime_nsec  resq 1
	.st_ctime       resq 1
	.st_ctime_nsec  resq 1
	.__unused4  resd 1
	.__unused5  resd 1
endstruc

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
	mov rsi,1 
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

mlc_s8: ; rdi=len  
	push rdi 
	and rdi,~111b
	lea rdi,[rdi+16] 
	mov rsi,1 
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
	pop QWORD [rax] 
	ret

s8_of_c_stg: 
	push rdi
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	xor rax,rax
	call strlen
	mov rsp,QWORD [rsp_tmp]
	push rax
	mov rdi,rax
	call mlc_s8
	pop rcx
	pop rsi
	mov rdi,rax
	add rdi,8
	cld
	rep movsb
	ret

in_fn: 
	mov rax,2
	mov rsi,2
	syscall
	push rax ; [rsp]=fd
	mov rdi,rax
	mov rax,5
	mov rsi,stat
	syscall
	mov rdi,[stat + STAT.st_size]
	call mlc_s8
	mov rdi,QWORD [rsp]
	push rax ; [rsp]=buf
	mov rsi,rax
	add rsi,8
	mov rax,0
	mov rdx,[stat+STAT.st_size]
	syscall
	mov rax,3
	mov rdi,QWORD [rsp+8]
	syscall
	mov rax,QWORD [rsp]	
	add rsp,16
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

; _args 
	mov rdi,QWORD [rsp]
 lea rdi,[rdi+1]
	mov rsi,8 
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf 
	xor rax,rax 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
	pop r13
	mov QWORD [rax],r13
	xor r14,r14
	mov r15,rax
args_lp:
	cmp r14,r13
	jz args_lp_end
	pop rdi
	call s8_of_c_stg 
	mov QWORD [r15+8+8*r14],rax
	add r14,1 
	jmp args_lp 
args_lp_end:
	mov r13,r15
	

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
LB_0: ; 30 { 0'(= a2◂ [ r] ) 1'(= a2◂ [ r] ) } ⊢ 0'(= a2◂ [ r] ) : ({ _lst◂_r64 _lst◂93'(=_r64) }→_lst◂_r64)
;; rsp=0 , %2~1'(= a2◂ [ r] ) %1~0'(= a2◂ [ r] ) 
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
;; rsp=0 , %4~3'(= a2◂ [ r] ) %3~2'(= r ) %2~1'(= a2◂ [ r] ) 
; #21 { 2'(= r ) 1'(= a2◂ [ r] ) } ⊢ 0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) }
;; rsp=0 , %5~0(<2)◂{ 2'(= r ) 1'(= a2◂ [ r] ) } %4~3'(= a2◂ [ r] ) 
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
;; rsp=0 , %2~1'(= a2◂ [ r] ) 
; ∎ 1'(= a2◂ [ r] )
; .mov_ptn2 1'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
; .mov_ptn 1'(= a2◂ [ r] ) ⊢ 0'(= a2◂ [ r] )
	mov rax,r14
	mov r13,rax
	ret
RTM_0:
	push RTM_1
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %6~1(<2)◂{ } %0~0'(= {| {| l |}|} ) 
; #21 { %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %7~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %0~0'(= {| {| l |}|} ) 
; #21 { %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } }
;; rsp=0 , %8~0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } %0~0'(= {| {| l |}|} ) 
; #21 { %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } ⊢ 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } }
;; rsp=0 , %9~0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } %0~0'(= {| {| l |}|} ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %10~1(<2)◂{ } %9~0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } %0~0'(= {| {| l |}|} ) 
; rsp_d=0, #30 { 0(<2)◂{ %[ 8r ] 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } } 1(<2)◂{ } } ⊢ 1'(= a2◂ [ r] )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
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

	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %11~1'(= a2◂ [ r] ) %0~0'(= {| {| l |}|} ) 
; _emt 1'(= a2◂ [ r] ) ⊢ 1'(= a2◂ [ r] )
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
	mov rax,r14
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
; .dlt.ptn 1'(= a2◂ [ r] )
;	.dlt adt ⊢ _  
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
RTM_1:
	push RTM_2
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
	jmp LB_28
LB_28:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %13~%[ 0r ] %0~0'(= {| {| l |}|} ) 
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
;; rsp=0 , %14~%[ 0r ] %0~0'(= {| {| l |}|} ) 
; _emt 0'(= {| {| l |}|} ) ⊢ 0'(= {| {| l |}|} )
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
	mov rax,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	jmp LB_39
LB_38: db 123,124,32,0
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
	mov rsi,[r8]
	mov rax,0 
LB_40:
	cmp rsi,rax 
	jz LB_41
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
	jmp LB_43
LB_42: db 32,0
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
	pop rsi 
	pop rax 
	pop r8 
	add rax,1 
	jmp LB_40
LB_41:
	jmp LB_45
LB_44: db 124,125,0
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
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_47
LB_46: db 10,0
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
	jmp LB_48
LB_48:
;; rsp=0 , %15~0'(= {| {| l |}|} ) %14~%[ 0r ] 
; ∎
RTM_2:
	push RTM_3
;; rsp=0 , %15~0'(= {| {| l |}|} ) %14~%[ 0r ] 
; _inc %[ 0r ] ⊢ %[ 1r ]
;; rsp=0 , %16~%[ 1r ] %15~0'(= {| {| l |}|} ) 
; _emt %[ 1r ] ⊢ %[ 1r ]
	jmp LB_50
LB_49: db 95,101,109,116,58,0
LB_50:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_49
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
	jmp LB_52
LB_51: db 49,114,0
LB_52:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_51
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
LB_53: db 10,0
LB_54:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_53
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
LB_55:
;; rsp=0 , %17~%[ 1r ] %15~0'(= {| {| l |}|} ) 
; _emt 0'(= {| {| l |}|} ) ⊢ 0'(= {| {| l |}|} )
	jmp LB_57
LB_56: db 95,101,109,116,58,0
LB_57:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_56
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
	jmp LB_59
LB_58: db 123,124,32,0
LB_59:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_58
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
LB_60:
	cmp rsi,rax 
	jz LB_61
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
	jmp LB_63
LB_62: db 32,0
LB_63:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_62
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
	jmp LB_60
LB_61:
	jmp LB_65
LB_64: db 124,125,0
LB_65:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_64
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
	jmp LB_67
LB_66: db 10,0
LB_67:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_66
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
	jmp LB_68
LB_68:
;; rsp=0 , %18~0'(= {| {| l |}|} ) %17~%[ 1r ] 
; ∎
RTM_3:
	push RTM_4
;; rsp=0 , %18~0'(= {| {| l |}|} ) %17~%[ 1r ] 
	jmp LB_69
LB_69:
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %19~%[ 4r ] %18~0'(= {| {| l |}|} ) %17~%[ 1r ] 
; _add { %[ 1r ] %[ 4r ] } ⊢ { 1'(= r ) 2'(= r ) }
	mov r8,4
	mov r14,1
	add r14,r8
;; rsp=0 , %21~2'(= r ) %20~1'(= r ) %18~0'(= {| {| l |}|} ) 
; _emt { 1'(= r ) 2'(= r ) } ⊢ { 1'(= r ) 2'(= r ) }
	jmp LB_71
LB_70: db 95,101,109,116,58,0
LB_71:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_70
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
	jmp LB_73
LB_72: db 123,32,0
LB_73:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_72
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
	jmp LB_75
LB_74: db 32,0
LB_75:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_74
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
	jmp LB_77
LB_76: db 32,0
LB_77:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_76
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
	jmp LB_79
LB_78: db 125,32,0
LB_79:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_78
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
	jmp LB_81
LB_80: db 10,0
LB_81:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_80
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
LB_82:
; .dlt.ptn { 1'(= r ) 2'(= r ) }
;; rsp=0 , %18~0'(= {| {| l |}|} ) 
	jmp LB_83
	LB_84: db 99,115,116,50,49,46,109,100,108,115,0
LB_83:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,LB_84
	call in_fn 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r14,rax
;; rsp=0 , %24~1'(= {| l |} ) %23~%[ "cst21.mdls" ] %18~0'(= {| {| l |}|} ) 
; _emt { %[ "cst21.mdls" ] 1'(= {| l |} ) } ⊢ { %[ "cst21.mdls" ] 1'(= {| l |} ) }
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
	jmp LB_88
LB_87: db 123,32,0
LB_88:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_87
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
LB_89: db 34,99,115,116,50,49,46,109,100,108,115,34,0
LB_90:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_89
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
	jmp LB_92
LB_91: db 32,0
LB_92:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_91
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
	jmp LB_94
LB_93: db 32,0
LB_94:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_93
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
	jmp LB_96
LB_95: db 125,32,0
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
LB_97: db 10,0
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
	jmp LB_99
LB_99:
; .dlt.ptn { %[ "cst21.mdls" ] 1'(= {| l |} ) }
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
;; rsp=0 , %18~0'(= {| {| l |}|} ) 
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
