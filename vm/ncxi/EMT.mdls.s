bits 64 
extern exit 
extern printf 
extern malloc 
extern free 
section .bss 
	ret_vct: resq 64
 rsp_tmp: resq 1
section .data
	err_n: dq 0
	fmt_err_line: db "err:%d",10,0
	fmt_r64: db "%dr",10,0
	fmt_s8: db 34,"%s",34,10,0
section .text
global _start              
_start:
	jmp RTM_0
ETR_29: ; f9 { } ⊢ 0f' : ({ }→_s8)
;; rsp=0 , 
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
	mov rdi,13
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
	mov BYTE [rax+8+0],72
	mov BYTE [rax+8+1],69
	mov BYTE [rax+8+2],76
	mov BYTE [rax+8+3],76
	mov BYTE [rax+8+4],79
	mov BYTE [rax+8+5],32
	mov BYTE [rax+8+6],87
	mov BYTE [rax+8+7],79
	mov BYTE [rax+8+8],82
	mov BYTE [rax+8+9],76
	mov BYTE [rax+8+10],68
	mov BYTE [rax+8+11],33
	mov BYTE [rax+8+12],33
	mov r13,rax
;; rsp=0 , %0~0f' 
; ∎ 0f'
; .mov_ptn2 0f' ⊢ 0f'
	ret
ETR_30: ; f1 { 0t' 1t' } ⊢ 0t' : ({ _r64 _r64 }→_r64)
;; rsp=0 , %2~1t' %1~0t' 
; _imul { 0t' 1t' } ⊢ { 0t' 1t' }
	imul r13,r14
; .dlt.ptn 1t'
;; rsp=0 , %3~0t' 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %4~%[ 4r ] %3~0t' 
; _imul { 0t' %[ 4r ] } ⊢ { 0t' 1t' }
	mov r14,4
	imul r13,r14
;; rsp=0 , %6~1t' %5~0t' 
; ∎ 0t'
; .dlt.ptn 1t'
; .mov_ptn2 0t' ⊢ 0t'
	ret
ETR_31: ; f2 0'(<2)◂∐[ {} {} ] ⊢ 0'(<2)◂∐[ {} {} ] : (_t6→_t6)
;; rsp=0 , %7~0'(<2)◂∐[ {} {} ] 
;; 0'(<2)◂∐[ {} {} ] ⊢ 0(<2)◂{ }
;; rsp=0 , 
;; rsp=0 , %9~1(<2)◂{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(<2)◂∐[ {} {} ]
; .mov_ptn 1(<2)◂{ } ⊢ 0'(<2)◂∐[ {} {} ]
; .stt_agl ⊢ .dyn_agl ; 0
	ret
LB_0:
;; 0'(<2)◂∐[ {} {} ] ⊢ 1(<2)◂{ }
;; rsp=0 , 
;; rsp=0 , %8~0(<2)◂{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(<2)◂∐[ {} {} ]
; .mov_ptn 0(<2)◂{ } ⊢ 0'(<2)◂∐[ {} {} ]
; .stt_agl ⊢ .dyn_agl ; 0
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
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
	mov rdi,7
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
	mov BYTE [rax+8+0],70
	mov BYTE [rax+8+1],111
	mov BYTE [rax+8+2],111
	mov BYTE [rax+8+3],32
	mov BYTE [rax+8+4],66
	mov BYTE [rax+8+5],97
	mov BYTE [rax+8+6],97
	mov r13,rax
;; rsp=0 , %10~0f' 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %11~%[ 1r ] %10~0f' 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,fmt_r64
	mov rsi,1
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
;; rsp=0 , %12~%[ 1r ] %10~0f' 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,r13
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
;; rsp=0 , %13~0f' %12~%[ 1r ] 
; rsp_d=0, #29 { } ⊢ 1f'
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { } ⊢ { }
	call ETR_29
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %14~1f' %13~0f' %12~%[ 1r ] 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,r14
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
;; rsp=0 , %15~1f' %13~0f' %12~%[ 1r ] 
;; rsp=0 , %16~0(<2)◂%[ 1r ] %15~1f' %13~0f' 
; ∎ { }
; .dlt.ptn 0(<2)◂%[ 1r ]
; .dlt.ptn 1f'
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,r14
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
; .dlt.ptn 0f'
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
