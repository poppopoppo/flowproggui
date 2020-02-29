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
ETR_26: ; f0 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	add rdi,16
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
	jmp LB_0
	LB_1: db 10,0
LB_0:
	lea rsi,[LB_1+1-1]
	mov rcx,1
	rep movsb
	jmp LB_2
	LB_3: db 33,33,0
LB_2:
	lea rsi,[LB_3+2-1]
	mov rcx,2
	rep movsb
	jmp LB_4
	LB_5: db 32,87,111,114,108,100,32,0
LB_4:
	lea rsi,[LB_5+7-1]
	mov rcx,7
	rep movsb
	jmp LB_6
	LB_7: db 72,101,108,108,111,32,0
LB_6:
	lea rsi,[LB_7+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %0~0'(= {| l |} ) 
; _emt 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	jmp LB_9
LB_8: db 95,101,109,116,58,0
LB_9:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_8
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
	jmp LB_11
LB_10: db 10,0
LB_11:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_10
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
LB_12:
;; rsp=0 , %1~0'(= {| l |} ) 
	jmp LB_13
LB_13:
; $ %[ 3r ] ⊢ %[ 3r ]
;; rsp=0 , %2~%[ 3r ] %1~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
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
	add rdi,77
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
	jmp LB_14
	LB_15: db 104,0
LB_14:
	lea rsi,[LB_15+1-1]
	mov rcx,1
	rep movsb
	jmp LB_16
	LB_17: db 103,0
LB_16:
	mov rax,3
LB_18:
	lea rsi,[LB_17+1-1]
	mov rcx,1
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_18
	jmp LB_19
	LB_20: db 89,100,32,112,0
LB_19:
	mov rax,17
LB_21:
	lea rsi,[LB_20+4-1]
	mov rcx,4
	rep movsb 
	sub rax,1
	cmp rax,0
	jnz LB_21
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	jmp LB_22
	LB_23: db 49,55,0
LB_22:
	lea rsi,[LB_23+2-1]
	mov rcx,2
	rep movsb
	jmp LB_24
	LB_25: db 102,111,111,0
LB_24:
	lea rsi,[LB_25+3-1]
	mov rcx,3
	rep movsb
	pop rsi 
	pop rcx
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %6~1'(= {| l |} ) %5~%[ 17r ] %4~%[ 3r ] %3~0'(= {| l |} ) 
; _emt 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	jmp LB_27
LB_26: db 95,101,109,116,58,0
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
	jmp LB_29
LB_28: db 10,0
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
	jmp LB_30
LB_30:
;; rsp=0 , %7~1'(= {| l |} ) %5~%[ 17r ] %4~%[ 3r ] %3~0'(= {| l |} ) 
; ∎ { }
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
; .dlt.ptn %[ 17r ]
; .dlt.ptn %[ 3r ]
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
; .mov_ptn2 { } ⊢ { }
;; ret 0
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; rsp_d=0, #26 { } ⊢ { }
; .mov_ptn2 { } ⊢ { }
	call ETR_26
;; rsp=0 , 
; ∎ { }
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
