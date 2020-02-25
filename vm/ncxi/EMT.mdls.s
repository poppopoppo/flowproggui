bits 64 
%define SS_MAX 4000
%define SS_NULL 0xffff_ffff_ffff_0000
extern exit 
extern printf 
extern malloc 
extern calloc
extern free 
section .bss 
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
	lea rdi,[rsi+8] 
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
	std 
	rep movsb
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
	jmp RTM_0
ETR_26:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_26
	ret
GRM_26:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3
	jmp LB_4
LB_3:
	mov r8,unt_1
	jmp LB_1
LB_4:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_5
	jmp LB_6
LB_5:
	mov r8,unt_1
	jmp LB_1
LB_6:
	add r14,1
	jmp LB_2
LB_1:
	lea rsp,[rsp+8*0]
	jmp LB_0
LB_2:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_9
	jmp LB_10
LB_9:
	jmp LB_7
LB_10:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_8
LB_7:
	lea rsp,[rsp+8*0]
	jmp LB_0
LB_8:
	mov QWORD [rsp+8*1],r14
;;; 	jmp LB_11
;; rsp=1 , %0~8'(= r ) 
; #20 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %1~0(<2)◂%[ 0r ] %0~8'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,0
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_11
;;; ret_f
LB_11:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_0
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_0:
	pop rdi
	pop r9 
	pop r14
	pop r13
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_15
	jmp LB_16
LB_15:
	mov r8,unt_1
	jmp LB_13
LB_16:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_17
	jmp LB_18
LB_17:
	mov r8,unt_1
	jmp LB_13
LB_18:
	add r14,1
	jmp LB_14
LB_13:
	lea rsp,[rsp+8*0]
	jmp LB_12
LB_14:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_19
;; rsp=0 , 
; #20 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %2~0(<2)◂%[ 1r ] 
; ∎ 0(<2)◂%[ 1r ]
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,1
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_19
;;; ret_f
LB_19:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_12
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_12:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_27:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_27
	ret
GRM_27:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_23
	jmp LB_24
LB_23:
	mov r8,unt_1
	jmp LB_21
LB_24:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_25
	jmp LB_26
LB_25:
	mov r8,unt_1
	jmp LB_21
LB_26:
	add r14,1
	jmp LB_22
LB_21:
	lea rsp,[rsp+8*0]
	jmp LB_20
LB_22:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_29
	jmp LB_30
LB_29:
	jmp LB_27
LB_30:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_28
LB_27:
	lea rsp,[rsp+8*0]
	jmp LB_20
LB_28:
	mov QWORD [rsp+8*1],r14
;;; 	jmp LB_31
;; rsp=1 , %3~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %4~0(<2)◂8'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_31
;;; ret_f
LB_31:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_20
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_20:
	pop rdi
	pop r9 
	pop r14
	pop r13
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_35
	jmp LB_36
LB_35:
	jmp LB_33
LB_36:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_34
LB_33:
	lea rsp,[rsp+8*0]
	jmp LB_32
LB_34:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_39
	jmp LB_40
LB_39:
	jmp LB_37
LB_40:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_38
LB_37:
	lea rsp,[rsp+8*1]
	jmp LB_32
LB_38:
	mov QWORD [rsp+8*2],r14
;;; 	jmp LB_41
;; rsp=2 , %6~9'(= r ) %5~8'(= r ) 
; _add { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %8~9'(= r ) %7~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %9~0(<2)◂8'(= r ) %8~9'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 9'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*2]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*2]
;; ret 0
	jmp LB_41
;;; ret_f
LB_41:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_32
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_32:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; rsp_d=0, #27 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
; .mov_ptn2 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ "ABAB" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,4
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
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],66
	mov r13,rax
	call ETR_27
;; rsp=0 , %12~2'(= a3◂ [ r] ) %11~1'(= r ) %10~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,r13
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,r14
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,r8
	call LB_50
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_52
LB_51: db 32,0
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
LB_53: db 125,32,0
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
	jmp LB_56
LB_55: db 10,0
LB_56:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_55
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
	jmp LB_57
LB_50:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_60+8*rax]
LB_60: dq LB_58,LB_59
LB_58:
	jmp LB_63
LB_62: db 39,48,226,151,130,0
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
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_61
LB_59:
	jmp LB_65
LB_64: db 39,49,226,151,130,0
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
	jmp LB_67
LB_66: db 42,123,32,0
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
	jmp LB_69
LB_68: db 125,32,0
LB_69:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_68
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
	jmp LB_61
LB_61:
	ret
LB_57:
;; rsp=0 , %15~2'(= a3◂ [ r] ) %14~1'(= r ) %13~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= a3◂ [ r] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,r13
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
; .mov_ptn2 { } ⊢ { }
;; ret 0
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
