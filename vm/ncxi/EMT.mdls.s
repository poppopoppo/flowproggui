bits 64 
%define SS_MAX 4000
extern exit 
extern printf 
extern malloc 
extern free 
section .bss 
	ret_vct: resq 64
 rsp_tmp: resq 1
	SS_VCT: resq 16*SS_MAX
	SS_TOP: resq 1
section .data
	SS_NULL: dq 0xffff_ffff_ffff_0000
	err_n: dq 0
	fmt_err_line: db "err:%d",10,0
	fmt_r64: db "%dr",10,0
	fmt_s8: db 34,"%s",34,10,0
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
	mov rsi,rax 
	add rsi,16 
	mov QWORD [rax],rsi 
	mov rax,rsi 
	jmp SS_lp 
SS_end:
	mov rsi,SS_NULL 
	mov [rax],rsi
	jmp RTM_0
ETR_28: ; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %0~0'(= {| l |} ) 
; #26 0'(= {| l |} ) ⊢ 1(<3)◂0'(= {| l |} )
;; rsp=0 , %1~1(<3)◂0'(= {| l |} ) 
; ∎ 1(<3)◂0'(= {| l |} )
; .mov_ptn2 1(<3)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<3)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	mov rdi,r13
	mov BYTE [rdi+6],1
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; #25 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %2~2(<3)◂{ } 
; #26 %[ "Hello" ] ⊢ 1(<3)◂%[ "Hello" ]
;; rsp=0 , %3~1(<3)◂%[ "Hello" ] %2~2(<3)◂{ } 
; rsp_d=0, #28 %[ "World" ] ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 %[ "World" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "World" ] ⊢ 0'(= {| l |} )
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
	mov rdi,5
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
	mov BYTE [rax+8+0],87
	mov BYTE [rax+8+1],111
	mov BYTE [rax+8+2],114
	mov BYTE [rax+8+3],108
	mov BYTE [rax+8+4],100
	mov r13,rax
	call ETR_28
;; rsp=0 , %4~0'(= a5◂ [ ] ) %3~1(<3)◂%[ "Hello" ] %2~2(<3)◂{ } 
; _emt 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,r13
	call LB_0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_1
LB_0:
	movzx rax,BYTE [rdi+6]
	jmp QWORD [LB_5+8*rax]
LB_5: dq LB_2,LB_3,LB_4
LB_2:
	jmp LB_8
LB_7: db 39,48,226,151,130,0
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
LB_9: db 123,32,0
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
	push rdi
	mov rdi,QWORD [rdi+8+8*0]
	call LB_0
	pop rdi 
	push rdi
	mov rdi,QWORD [rdi+8+8*1]
	mov rsi,rdi
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop rdi 
	push rdi
	mov rdi,QWORD [rdi+8+8*2]
	call LB_0
	pop rdi 
	jmp LB_12
LB_11: db 125,32,0
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
	jmp LB_6
LB_3:
	jmp LB_14
LB_13: db 39,49,226,151,130,0
LB_14:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_13
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
	mov rsi,rdi
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_6
LB_4:
	jmp LB_16
LB_15: db 39,50,226,151,130,0
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
	jmp LB_20
LB_19: db 125,32,0
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
	jmp LB_6
LB_6:
LB_1:
;; rsp=0 , %5~0'(= a5◂ [ ] ) %3~1(<3)◂%[ "Hello" ] %2~2(<3)◂{ } 
; ∎ { }
; .dlt.ptn 0'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1(<3)◂%[ "Hello" ]
; .dlt.ptn 2(<3)◂{ }
; .mov_ptn2 { } ⊢ { }
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
