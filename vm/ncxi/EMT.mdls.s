bits 64 
extern exit 
extern printf 
section .bss 
	ret_vct: resq 64
 rsp_tmp: resq 1
section .data
	err_n: dq 0
	fmt_err_line: db "err:%d",10,0
	fmt_r64: db "%dr",10,0
section .text
global _start              
_start:
	jmp RTM_0
ETR_25: ; f9 { } ⊢ 0f' : ({ }→_s8)
;; rsp=0 , 
; $ %[ "HELLO WORLD!!" ] ⊢ %[ "HELLO WORLD!!" ]
;; rsp=0 , %0~%[ "HELLO WORLD!!" ] 
; ∎ %[ "HELLO WORLD!!" ]
; .mov_ptn2 %[ "HELLO WORLD!!" ] ⊢ 0f'
; .mov_ptn %[ "HELLO WORLD!!" ] ⊢ 0f'
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; $ %[ "Foo Baa" ] ⊢ %[ "Foo Baa" ]
;; rsp=0 , %1~%[ "Foo Baa" ] 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %2~%[ 1r ] %1~%[ "Foo Baa" ] 
; ∎ { }
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
