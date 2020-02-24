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
	jg LB_1
	jmp LB_2
LB_1:
	mov r8,unt_1
	jmp LB_0
LB_2:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_3
	jmp LB_4
LB_3:
	mov r8,unt_1
	jmp LB_0
LB_4:
	add r14,1
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_5
	jmp LB_6
LB_5:
	jmp LB_0
LB_6:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_7
;; rsp=0 , %0~{ } 
; #20 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1~0(<2)◂{ } %0~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rdi,unt
	mov r8,rdi
	mov rdi,unt_0
	mov r8,rdi
;; ret 0
	jmp LB_7
;;; ret_f
LB_7:
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
	jg LB_9
	jmp LB_10
LB_9:
	mov r8,unt_1
	jmp LB_8
LB_10:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_11
	jmp LB_12
LB_11:
	mov r8,unt_1
	jmp LB_8
LB_12:
	add r14,1
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_13
;; rsp=0 , 
; #20 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2~0(<2)◂{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rdi,unt
	mov r8,rdi
	mov rdi,unt_0
	mov r8,rdi
;; ret 0
	jmp LB_13
;;; ret_f
LB_13:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_8
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_8:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; rsp_d=0, #26 { %[ "AAAAAABcd" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ *{ }] ) }
; .mov_ptn2 { %[ "AAAAAABcd" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ "AAAAAABcd" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,24
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
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
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],65
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],65
	mov BYTE [rax+8+4],65
	mov BYTE [rax+8+5],65
	mov BYTE [rax+8+6],66
	mov BYTE [rax+8+7],99
	mov BYTE [rax+8+8],100
	mov r13,rax
	call ETR_26
;; rsp=0 , %5~2'(= a3◂ [ *{ }] ) %4~1'(= r ) %3~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ *{ }] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ *{ }] ) }
	jmp LB_15
LB_14: db 95,101,109,116,58,0
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
	jmp LB_17
LB_16: db 123,32,0
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
	jmp LB_21
LB_20: db 32,0
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,r8
	call LB_22
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_24
LB_23: db 32,0
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
LB_25: db 125,32,0
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
	jmp LB_28
LB_27: db 10,0
LB_28:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_27
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
	jmp LB_29
LB_22:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_32+8*rax]
LB_32: dq LB_30,LB_31
LB_30:
	jmp LB_35
LB_34: db 39,48,226,151,130,0
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
LB_36: db 42,123,32,0
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
LB_38: db 125,32,0
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
	jmp LB_33
LB_31:
	jmp LB_41
LB_40: db 39,49,226,151,130,0
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
	jmp LB_43
LB_42: db 42,123,32,0
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
LB_44: db 125,32,0
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
	jmp LB_33
LB_33:
	ret
LB_29:
;; rsp=0 , %8~2'(= a3◂ [ *{ }] ) %7~1'(= r ) %6~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= a3◂ [ *{ }] )
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
