bits 64 
%define SS_MAX 4000
extern exit 
extern printf 
extern malloc 
extern free 
section .bss 
	ret_vct: resq 64
 rsp_tmp: resq 1
	SS_VCT: resq SS_MAX
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
ETR_29: ; f9 { } ⊢ 0'(= {| l |} ) : ({ }→_s8)
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
;; rsp=0 , %0~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_30: ; f1 { 0'(= r ) 1'(= r ) } ⊢ 0'(= r ) : ({ _r64 _r64 }→_r64)
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
; _imul { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	imul r13,r14
; .dlt.ptn 1'(= r )
;; rsp=0 , %3~0'(= r ) 
; $ %[ 4r ] ⊢ %[ 4r ]
;; rsp=0 , %4~%[ 4r ] %3~0'(= r ) 
; _imul { 0'(= r ) %[ 4r ] } ⊢ { 0'(= r ) 1'(= r ) }
	mov r14,4
	imul r13,r14
;; rsp=0 , %6~1'(= r ) %5~0'(= r ) 
; ∎ 0'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 0'(= r ) ⊢ 0'(= r )
	ret
ETR_31: ; f2 0'(= a6◂ [ ] ) ⊢ 0'(= a6◂ [ ] ) : (_t6→_t6)
;; rsp=0 , %7~0'(= a6◂ [ ] ) 
;; ? 0'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_0
;; rsp=0 , 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %9~1(<2)◂{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .stt_adt ⊢ .hp ; 0
	ret
LB_0:
;; ? 0'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
; #28 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %8~0(<2)◂{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .stt_adt ⊢ .hp ; 0
	ret
ETR_34: ; and { 0'(= a7◂ [ ] ) 1'(= a7◂ [ ] ) } ⊢ 0'(= a7◂ [ ] ) : ({ _t7 _t7 }→_t7)
;; rsp=0 , %11~1'(= a7◂ [ ] ) %10~0'(= a7◂ [ ] ) 
;; ? 0'(= a7◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1
;; ? 1'(= a7◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r14
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_1
;; rsp=0 , 
; #33 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %13~0(<2)◂{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a7◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a7◂ [ ] )
; .stt_adt ⊢ .hp ; 0
	ret
LB_1:
;; rsp=0 , %11~1'(= a7◂ [ ] ) %10~0'(= a7◂ [ ] ) 
; #32 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %12~1(<2)◂{ } %11~1'(= a7◂ [ ] ) %10~0'(= a7◂ [ ] ) 
; ∎ 1(<2)◂{ }
; .dlt.ptn 1'(= a7◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 0'(= a7◂ [ ] )
;	.dlt adt ⊢ _  
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a7◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a7◂ [ ] )
; .stt_adt ⊢ .hp ; 0
	ret
ETR_39: ; rev_i { 0'(= a2◂ [ q0] ) 1'(= a2◂ [ q0] ) } ⊢ 0'(= a2◂ [ q0] ) : ({ _lst◂102'(0) _lst◂102'(0) }→_lst◂102'(0))
;; rsp=0 , %15~1'(= a2◂ [ q0] ) %14~0'(= a2◂ [ q0] ) 
;; ? 0'(= a2◂ [ q0] ) ⊢ 0(<2)◂{ 2'(= q0 ) 3'(= a2◂ [ q0] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2
	mov rdi,r13
	mov r8,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*1]
;; rsp=0 , %17~3'(= a2◂ [ q0] ) %16~2'(= q0 ) %15~1'(= a2◂ [ q0] ) 
; #19 { 2'(= q0 ) 1'(= a2◂ [ q0] ) } ⊢ 0(<2)◂{ 2'(= q0 ) 1'(= a2◂ [ q0] ) }
;; rsp=0 , %18~0(<2)◂{ 2'(= q0 ) 1'(= a2◂ [ q0] ) } %17~3'(= a2◂ [ q0] ) 
; rsp_d=0, #39 { 3'(= a2◂ [ q0] ) 0(<2)◂{ 2'(= q0 ) 1'(= a2◂ [ q0] ) } } ⊢ 0'(= a2◂ [ q0] )
; .mov_ptn2 { 3'(= a2◂ [ q0] ) 0(<2)◂{ 2'(= q0 ) 1'(= a2◂ [ q0] ) } } ⊢ { 0'(= a2◂ [ q0] ) 1'(= a2◂ [ q0] ) }
	mov r10,r14
; .mov_ptn 0(<2)◂{ 2'(= q0 ) 4'(= a2◂ [ q0] ) } ⊢ 1'(= a2◂ [ q0] )
; .stt_adt ⊢ .hp ; 0
; .mov_ptn 3'(= a2◂ [ q0] ) ⊢ 0'(= a2◂ [ q0] )
	mov r13,r9
	call ETR_39
;; rsp=0 , %19~0'(= a2◂ [ q0] ) 
; ∎ 0'(= a2◂ [ q0] )
; .mov_ptn2 0'(= a2◂ [ q0] ) ⊢ 0'(= a2◂ [ q0] )
	ret
LB_2:
;; rsp=0 , %15~1'(= a2◂ [ q0] ) %14~0'(= a2◂ [ q0] ) 
; ∎ 1'(= a2◂ [ q0] )
; .dlt.ptn 0'(= a2◂ [ q0] )
;	.dlt adt ⊢ _  
; .mov_ptn2 1'(= a2◂ [ q0] ) ⊢ 0'(= a2◂ [ q0] )
; .mov_ptn 1'(= a2◂ [ q0] ) ⊢ 0'(= a2◂ [ q0] )
	mov r13,r14
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
;; rsp=0 , %20~0'(= {| l |} ) 
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %21~%[ 1r ] %20~0'(= {| l |} ) 
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
;; rsp=0 , %22~%[ 1r ] %20~0'(= {| l |} ) 
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
;; rsp=0 , %23~0'(= {| l |} ) %22~%[ 1r ] 
; rsp_d=0, #29 { } ⊢ 1'(= {| l |} )
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { } ⊢ { }
	call ETR_29
	mov rax,QWORD [rsp-8+8*1]
	mov r14,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %24~1'(= {| l |} ) %23~0'(= {| l |} ) %22~%[ 1r ] 
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
;; rsp=0 , %25~1'(= {| l |} ) %23~0'(= {| l |} ) %22~%[ 1r ] 
; #18 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %26~1(<2)◂{ } %25~1'(= {| l |} ) %23~0'(= {| l |} ) %22~%[ 1r ] 
; #19 { %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %27~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %25~1'(= {| l |} ) %23~0'(= {| l |} ) %22~%[ 1r ] 
; #28 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %28~0(<2)◂{ } %27~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %25~1'(= {| l |} ) %23~0'(= {| l |} ) %22~%[ 1r ] 
; rsp_d=0, #31 0(<2)◂{ } ⊢ 2'(= a6◂ [ ] )
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .stt_adt ⊢ .hp ; 0
	call ETR_31
	mov r14,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %29~2'(= a6◂ [ ] ) %27~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %25~1'(= {| l |} ) %23~0'(= {| l |} ) %22~%[ 1r ] 
; #20 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %30~0(<2)◂%[ 1r ] %29~2'(= a6◂ [ ] ) %27~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %25~1'(= {| l |} ) %23~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 0(<2)◂%[ 1r ]
; .dlt.ptn 2'(= a6◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
; .dlt.ptn 1'(= {| l |} )
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
