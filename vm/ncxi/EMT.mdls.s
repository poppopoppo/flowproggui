bits 64 
%define SS_MAX 4000
%define SS_NULL 0xffff_ffff_ffff_0000
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
ETR_29: ; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
;; rsp=0 , %2~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<3)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_0
	mov rdi,r13
	mov r14,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r8,QWORD [rdi+8+8*1]
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*2]
;; rsp=0 , %10~3'(= a5◂ [ ] ) %9~2'(= r ) %8~1'(= a5◂ [ ] ) 
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov r13,r8
;; rsp=0 , %12~0'(= r ) %11~2'(= r ) %10~3'(= a5◂ [ ] ) %8~1'(= a5◂ [ ] ) 
; #27 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<3)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %13~0(<3)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } %11~2'(= r ) 
; ∎ { 0(<3)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<3)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r10,r13
; .mov_ptn 0(<3)◂{ 1'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov r11,r14
	mov rax,r11
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov r11,r10
	mov rax,r11
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov r11,r9
	mov rax,r11
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
; .mov_ptn 2'(= r ) ⊢ 1'(= r )
	mov r14,r8
	ret
LB_0:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<3)◂0'(= {| l |} )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_1
;; rsp=0 , %4~0'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r14,rdi
;; rsp=0 , %6~1'(= r ) %5~0'(= {| l |} ) 
; #26 0'(= {| l |} ) ⊢ 1(<3)◂0'(= {| l |} )
;; rsp=0 , %7~1(<3)◂0'(= {| l |} ) %6~1'(= r ) 
; ∎ { 1(<3)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<3)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<3)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r8
	mov rdi,r13
	mov BYTE [rdi+6],1
	ret
LB_1:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<3)◂{ }
;; rsp=0 , 
; #25 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3~2(<3)◂{ } 
; ∎ { 2(<3)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<3)◂{ } %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn 2(<3)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov rdi,r13
	mov BYTE [rdi+6],2
	ret
ETR_30: ; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %15~1'(= {| l |} ) %14~0'(= a5◂ [ ] ) 
; _s8_len 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r8,rdi
;; rsp=0 , %17~2'(= r ) %16~1'(= {| l |} ) %14~0'(= a5◂ [ ] ) 
; rsp_d=0, #29 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_29
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %19~3'(= r ) %18~0'(= a5◂ [ ] ) %17~2'(= r ) %16~1'(= {| l |} ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %21~3'(= r ) %20~2'(= r ) %18~0'(= a5◂ [ ] ) %16~1'(= {| l |} ) 
; #26 1'(= {| l |} ) ⊢ 1(<3)◂1'(= {| l |} )
;; rsp=0 , %22~1(<3)◂1'(= {| l |} ) %21~3'(= r ) %20~2'(= r ) %18~0'(= a5◂ [ ] ) 
; #27 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<3)◂1'(= {| l |} ) } ⊢ 0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<3)◂1'(= {| l |} ) }
;; rsp=0 , %23~0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<3)◂1'(= {| l |} ) } %21~3'(= r ) 
; ∎ 0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<3)◂1'(= {| l |} ) }
; .dlt.ptn 3'(= r )
; .mov_ptn2 0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<3)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<3)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 1(<3)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov r10,r9
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov r10,r8
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov r10,r14
	mov rdi,r10
	mov BYTE [rdi+6],1
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
	ret
ETR_31: ; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %25~1'(= a5◂ [ ] ) %24~0'(= a5◂ [ ] ) 
; rsp_d=0, #29 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_29
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %27~2'(= r ) %26~0'(= a5◂ [ ] ) %25~1'(= a5◂ [ ] ) 
; rsp_d=0, #29 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	call ETR_29
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %29~1'(= r ) %28~3'(= a5◂ [ ] ) %27~2'(= r ) %26~0'(= a5◂ [ ] ) 
; _add { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %31~1'(= r ) %30~2'(= r ) %28~3'(= a5◂ [ ] ) %26~0'(= a5◂ [ ] ) 
; #27 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %32~0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %31~1'(= r ) 
; ∎ 0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<3)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<3)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov r10,r14
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov r10,r8
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov r10,r9
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; #26 %[ "Hello" ] ⊢ 1(<3)◂%[ "Hello" ]
;; rsp=0 , %33~1(<3)◂%[ "Hello" ] 
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
;; rsp=0 , %34~0'(= a5◂ [ ] ) %33~1(<3)◂%[ "Hello" ] 
; rsp_d=0, #31 { 1(<3)◂%[ "Hello" ] 0'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 { 1(<3)◂%[ "Hello" ] 0'(= a5◂ [ ] ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) }
; .mov_ptn 0'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<3)◂%[ "Hello" ] ⊢ 0'(= a5◂ [ ] )
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
	mov BYTE [rax+8+0],72
	mov BYTE [rax+8+1],101
	mov BYTE [rax+8+2],108
	mov BYTE [rax+8+3],108
	mov BYTE [rax+8+4],111
	mov r13,rax
	mov rdi,r13
	mov BYTE [rdi+6],1
	call ETR_31
;; rsp=0 , %35~0'(= a5◂ [ ] ) 
; rsp_d=0, #30 { 0'(= a5◂ [ ] ) %[ "!!" ] } ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 { 0'(= a5◂ [ ] ) %[ "!!" ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn %[ "!!" ] ⊢ 1'(= {| l |} )
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
	mov BYTE [rax+8+0],33
	mov BYTE [rax+8+1],33
	mov r14,rax
	call ETR_30
;; rsp=0 , %36~0'(= a5◂ [ ] ) 
; ∎ { }
; .dlt.ptn 0'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
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
