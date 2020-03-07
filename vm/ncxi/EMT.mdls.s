bits 64 
%define SS_MAX 4000
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
	SS_TOP: resq 1
	SS_VCT: resq 16*SS_MAX
	SS_BTM: resq 1 
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
	jmp RTM_0
LB_41: ; 28 { 0'(= {| l |} ) 1'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) } : ({ _s8 _s8 }→{ _s8 _s8 })
;; rsp=0 , %8~1'(= {| l |} ) %7~0'(= {| l |} ) 
; ∎ { 1'(= {| l |} ) 0'(= {| l |} ) }
; .mov_ptn2 { 1'(= {| l |} ) 0'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
	mov r8,r13
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov r13,r14
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r8
	ret
LB_14: ; 28 { 0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _s8 _r64 }→{ _r64 _s8 })
;; rsp=0 , %8~1'(= r ) %7~0'(= {| l |} ) 
; ∎ { 1'(= r ) 0'(= {| l |} ) }
; .mov_ptn2 { 1'(= r ) 0'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	mov r8,r13
; .mov_ptn 1'(= r ) ⊢ 0'(= r )
	mov r13,r14
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r8
	ret
LB_0: ; 28 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= r ) } : ({ _r64 _s8 }→{ _s8 _r64 })
;; rsp=0 , %8~1'(= {| l |} ) %7~0'(= r ) 
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
; rsp_d=0, #28 { %[ 0r ] %[ "HO" ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
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

;; rsp=0 , %10~1'(= r ) %9~0'(= {| l |} ) 
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
; rsp_d=0, #28 { %[ "Rii" ] %[ 3r ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
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

;; rsp=0 , %13~1'(= {| l |} ) %12~0'(= r ) 
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
; rsp_d=0, #28 { %[ 2r ] %[ "eWp" ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
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

;; rsp=0 , %16~1'(= r ) %15~0'(= {| l |} ) 
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
; rsp_d=0, #28 { %[ "XmI" ] %[ "HO" ] } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
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

;; rsp=0 , %19~1'(= {| l |} ) %18~0'(= {| l |} ) 
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
; #18 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %21~1(<2)◂{ } 
; #19 { %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %22~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } 
; #19 { %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } }
;; rsp=0 , %23~0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } 
; ∎ { }
; .dlt.ptn 0(<2)◂{ %[ 3r ] 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } }
; .mov_ptn2 { } ⊢ { }
	ret
ETR_29: ; f0 0'(= r ) ⊢ 0'(= q0 ) : (_r64→105'(0))
;; rsp=0 , %24~0'(= r ) 
; _inc 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %25~0'(= r ) 
; rsp_d=0, #30 0'(= r ) ⊢ 0'(= q0 )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_30

;; rsp=0 , %26~0'(= q0 ) 
; ∎ 0'(= q0 )
; .mov_ptn2 0'(= q0 ) ⊢ 0'(= q0 )
	ret
ETR_30: ; f1 0'(= r ) ⊢ 0'(= q0 ) : (_r64→105'(0))
;; rsp=0 , %27~0'(= r ) 
; _sub 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %28~0'(= r ) 
; rsp_d=0, #29 0'(= r ) ⊢ 0'(= q0 )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	call ETR_29

;; rsp=0 , %29~0'(= q0 ) 
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
