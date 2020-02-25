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
ETR_30: ; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %0~0'(= {| l |} ) 
; #28 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %1~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	mov rdi,r13
	mov BYTE [rdi+6],1
;; ret 0
	ret
ETR_31: ; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
;; rsp=0 , %2~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
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
;; rsp=0 , %7~3'(= a5◂ [ ] ) %6~2'(= r ) %5~1'(= a5◂ [ ] ) 
	jmp LB_1
LB_1:
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	mov rax,rdi
	mov r13,rax
;; rsp=0 , %14~0'(= r ) %13~2'(= r ) %7~3'(= a5◂ [ ] ) %5~1'(= a5◂ [ ] ) 
; #29 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %15~0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } %13~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r10,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
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
;; ret 0
	ret
LB_0:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,1
	jnz LB_2
;; rsp=0 , %4~0'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r14,rdi
;; rsp=0 , %11~1'(= r ) %10~0'(= {| l |} ) 
; #28 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %12~1(<4)◂0'(= {| l |} ) %11~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<4)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r8
	mov rdi,r13
	mov BYTE [rdi+6],1
;; ret 0
	ret
LB_2:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_3
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %3~1'(= r ) 
; #26 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %9~3(<4)◂1'(= r ) 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn 3(<4)◂1'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	mov rdi,r13
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],3
	mov r13,rsi
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov r14,1
;; ret 0
	ret
LB_3:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #27 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %8~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rdi,unt
	mov r13,rdi
	mov rdi,unt_2
	mov r13,rdi
;; ret 0
	ret
ETR_32: ; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %17~1'(= {| l |} ) %16~0'(= a5◂ [ ] ) 
; _s8_len 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r8,rdi
;; rsp=0 , %19~2'(= r ) %18~1'(= {| l |} ) %16~0'(= a5◂ [ ] ) 
; rsp_d=0, #31 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_31
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %21~3'(= r ) %20~0'(= a5◂ [ ] ) %19~2'(= r ) %18~1'(= {| l |} ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %23~3'(= r ) %22~2'(= r ) %20~0'(= a5◂ [ ] ) %18~1'(= {| l |} ) 
; #28 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %24~1(<4)◂1'(= {| l |} ) %23~3'(= r ) %22~2'(= r ) %20~0'(= a5◂ [ ] ) 
; #29 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
;; rsp=0 , %25~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } %23~3'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
; .dlt.ptn 3'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
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
;; ret 0
	ret
ETR_33: ; pfx_s8 { 0'(= {| l |} ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _s8 _t5 }→_t5)
;; rsp=0 , %27~1'(= a5◂ [ ] ) %26~0'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r8,rdi
;; rsp=0 , %29~2'(= r ) %28~0'(= {| l |} ) %27~1'(= a5◂ [ ] ) 
; rsp_d=0, #31 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	call ETR_31
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %31~1'(= r ) %30~3'(= a5◂ [ ] ) %29~2'(= r ) %28~0'(= {| l |} ) 
; _add { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %33~1'(= r ) %32~2'(= r ) %30~3'(= a5◂ [ ] ) %28~0'(= {| l |} ) 
; #28 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %34~1(<4)◂0'(= {| l |} ) %33~1'(= r ) %32~2'(= r ) %30~3'(= a5◂ [ ] ) 
; #29 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %35~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } %33~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1(<4)◂1'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov r10,r14
	mov rdi,r10
	mov BYTE [rdi+6],1
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
;; ret 0
	ret
ETR_34: ; add_chr { 0'(= a5◂ [ ] ) 1'(= r ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _r64 }→_t5)
;; rsp=0 , %37~1'(= r ) %36~0'(= a5◂ [ ] ) 
; rsp_d=0, #31 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_31
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %39~2'(= r ) %38~0'(= a5◂ [ ] ) %37~1'(= r ) 
; _inc 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %40~2'(= r ) %38~0'(= a5◂ [ ] ) %37~1'(= r ) 
; #26 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %41~3(<4)◂1'(= r ) %40~2'(= r ) %38~0'(= a5◂ [ ] ) 
; #29 { 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
;; rsp=0 , %42~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
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
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],3
	mov r10,rsi
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
;; ret 0
	ret
ETR_35: ; pfx_chr { 0'(= r ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _r64 _t5 }→_t5)
;; rsp=0 , %44~1'(= a5◂ [ ] ) %43~0'(= r ) 
; rsp_d=0, #31 1'(= a5◂ [ ] ) ⊢ { 2'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	call ETR_31
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r13
	mov r13,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %46~1'(= r ) %45~2'(= a5◂ [ ] ) %43~0'(= r ) 
; _inc 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %47~1'(= r ) %45~2'(= a5◂ [ ] ) %43~0'(= r ) 
; #26 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %48~3(<4)◂0'(= r ) %47~1'(= r ) %45~2'(= a5◂ [ ] ) 
; #29 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
;; rsp=0 , %49~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3(<4)◂3'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov r10,r9
	mov rdi,r10
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],3
	mov r10,rsi
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov r10,r14
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov r10,r8
	mov rax,r10
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
;; ret 0
	ret
ETR_36: ; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %51~1'(= a5◂ [ ] ) %50~0'(= a5◂ [ ] ) 
; rsp_d=0, #31 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_31
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %53~2'(= r ) %52~0'(= a5◂ [ ] ) %51~1'(= a5◂ [ ] ) 
; rsp_d=0, #31 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	call ETR_31
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %55~1'(= r ) %54~3'(= a5◂ [ ] ) %53~2'(= r ) %52~0'(= a5◂ [ ] ) 
; _add { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %57~1'(= r ) %56~2'(= r ) %54~3'(= a5◂ [ ] ) %52~0'(= a5◂ [ ] ) 
; #29 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %58~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %57~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .dlt.ptn 1'(= r )
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
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
;; ret 0
	ret
ETR_37: ; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %61~2'(= r ) %60~1'(= {| l |} ) %59~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_4
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r10,QWORD [rdi+8+8*1]
	mov rdi,r13
	mov r11,QWORD [rdi+8+8*2]
;; rsp=0 , %66~5'(= a5◂ [ ] ) %65~4'(= r ) %64~3'(= a5◂ [ ] ) %61~2'(= r ) %60~1'(= {| l |} ) 
; rsp_d=0, #37 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	call ETR_37
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %85~2'(= r ) %84~1'(= {| l |} ) %83~0'(= a5◂ [ ] ) %66~5'(= a5◂ [ ] ) %65~4'(= r ) 
; rsp_d=0, #37 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r11
	call ETR_37
	mov r10,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %88~2'(= r ) %87~1'(= {| l |} ) %86~3'(= a5◂ [ ] ) %83~0'(= a5◂ [ ] ) %65~4'(= r ) 
; #29 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %89~0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %88~2'(= r ) %87~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r11,r13
; .mov_ptn 0(<4)◂{ 5'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov rcx,r11
	mov rax,rcx
	mov rdi,r13
	mov QWORD [rdi+8+8*0],rax
	mov rcx,r10
	mov rax,rcx
	mov rdi,r13
	mov QWORD [rdi+8+8*1],rax
	mov rcx,r9
	mov rax,rcx
	mov rdi,r13
	mov QWORD [rdi+8+8*2],rax
	mov rdi,r13
	mov BYTE [rdi+6],0
;; ret 0
	ret
LB_4:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_5
;; rsp=0 , %61~2'(= r ) %60~1'(= {| l |} ) 
; #27 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %82~2(<4)◂{ } %61~2'(= r ) %60~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rdi,unt
	mov r13,rdi
	mov rdi,unt_2
	mov r13,rdi
;; ret 0
	ret
LB_5:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_6
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=0 , %63~3'(= r ) %61~2'(= r ) %60~1'(= {| l |} ) 
; _sts { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r8
	jle err
	mov rsi,r8
	mov rdi,r9
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %79~3'(= r ) %78~2'(= r ) %77~1'(= {| l |} ) 
; _inc 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %80~2'(= r ) %79~3'(= r ) %77~1'(= {| l |} ) 
; #26 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %81~3(<4)◂3'(= r ) %80~2'(= r ) %77~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3(<4)◂3'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	mov rdi,r13
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],3
	mov r13,rsi
;; ret 0
	ret
LB_6:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %62~0'(= {| l |} ) %61~2'(= r ) %60~1'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r9,rdi
;; rsp=0 , %68~3'(= r ) %67~0'(= {| l |} ) %61~2'(= r ) %60~1'(= {| l |} ) 
; _rep_movsb { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
	mov rax,r9
	mov rsi,r13
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,0
	jl err
	lea rsi,[rsi+0]
	push rsi 
	mov rsi,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,r8
	jl err
	add rsi,r8
	mov rdi,rsi 
	pop rsi 
	push rcx 
	mov rcx,rax 
	cld 
	rep movsb
	pop rcx 
;; rsp=0 , %73~2'(= r ) %72~1'(= {| l |} ) %71~%[ 0r ] %70~0'(= {| l |} ) %69~3'(= r ) 
; #28 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %74~1(<4)◂0'(= {| l |} ) %73~2'(= r ) %72~1'(= {| l |} ) %71~%[ 0r ] %69~3'(= r ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %76~3'(= r ) %75~2'(= r ) %74~1(<4)◂0'(= {| l |} ) %72~1'(= {| l |} ) %71~%[ 0r ] 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn 3'(= r )
; .dlt.ptn %[ 0r ]
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<4)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	mov rdi,r13
	mov BYTE [rdi+6],1
;; ret 0
	ret
ETR_38: ; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %90~0'(= a5◂ [ ] ) 
; rsp_d=0, #31 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_31
;; rsp=0 , %92~1'(= r ) %91~0'(= a5◂ [ ] ) 
; _mlc_s8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rsi,1 
	xor rax,rax
	push rdi
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc
	mov rsp,QWORD [rsp_tmp]  
	pop QWORD [rax] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,rax
;; rsp=0 , %94~2'(= {| l |} ) %93~1'(= r ) %91~0'(= a5◂ [ ] ) 
; rsp_d=0, #37 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r8
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov r8,0
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r9
	call ETR_37
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %97~2'(= r ) %96~3'(= {| l |} ) %95~0'(= a5◂ [ ] ) %93~1'(= r ) 
; ∎ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r9
;; ret 0
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; #28 %[ "Hello" ] ⊢ 1(<4)◂%[ "Hello" ]
;; rsp=0 , %98~1(<4)◂%[ "Hello" ] 
; rsp_d=0, #30 %[ "World" ] ⊢ 0'(= a5◂ [ ] )
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
	call ETR_30
;; rsp=0 , %99~0'(= a5◂ [ ] ) %98~1(<4)◂%[ "Hello" ] 
; rsp_d=0, #36 { 1(<4)◂%[ "Hello" ] 0'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 { 1(<4)◂%[ "Hello" ] 0'(= a5◂ [ ] ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) }
; .mov_ptn 0'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂%[ "Hello" ] ⊢ 0'(= a5◂ [ ] )
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
	call ETR_36
;; rsp=0 , %100~0'(= a5◂ [ ] ) 
; rsp_d=0, #32 { 0'(= a5◂ [ ] ) %[ "!!" ] } ⊢ 0'(= a5◂ [ ] )
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
	call ETR_32
;; rsp=0 , %101~0'(= a5◂ [ ] ) 
; #26 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %102~3(<4)◂%[ 44r ] %101~0'(= a5◂ [ ] ) 
; rsp_d=0, #36 { 0'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) }
; .mov_ptn 3(<4)◂%[ 44r ] ⊢ 1'(= a5◂ [ ] )
	mov r14,44
	mov rdi,r14
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],3
	mov r14,rsi
	call ETR_36
;; rsp=0 , %103~0'(= a5◂ [ ] ) 
; _emt 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	jmp LB_8
LB_7: db 95,101,109,116,58,0
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
	mov rax,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_9
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
LB_9:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_17+8*rax]
LB_17: dq LB_13,LB_14,LB_15,LB_16
LB_13:
	jmp LB_20
LB_19: db 39,48,226,151,130,0
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
	jmp LB_22
LB_21: db 42,123,32,0
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
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_9
	pop r8 
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
	push r8
	mov r8,QWORD [r8+8+8*1]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r8 
	jmp LB_26
LB_25: db 32,0
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
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_9
	pop r8 
	jmp LB_28
LB_27: db 32,0
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
	jmp LB_30
LB_29: db 125,32,0
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
	jmp LB_18
LB_14:
	jmp LB_32
LB_31: db 39,49,226,151,130,0
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
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_18
LB_15:
	jmp LB_34
LB_33: db 39,50,226,151,130,0
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
	jmp LB_36
LB_35: db 42,123,32,0
LB_36:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_35
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
	jmp LB_38
LB_37: db 125,32,0
LB_38:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_37
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
LB_16:
	jmp LB_40
LB_39: db 39,51,226,151,130,0
LB_40:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_39
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
	jmp LB_18
LB_18:
	ret
LB_12:
;; rsp=0 , %104~0'(= a5◂ [ ] ) 
; rsp_d=0, #38 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_38
;; rsp=0 , %106~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; _emt 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	jmp LB_42
LB_41: db 95,101,109,116,58,0
LB_42:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_41
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
	jmp LB_44
LB_43: db 10,0
LB_44:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_43
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
LB_45:
;; rsp=0 , %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; _sts { %[ "Foo Boo" ] %[ 6r ] %[ 44r ] } ⊢ { 2'(= {| l |} ) %[ 6r ] %[ 44r ] }
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
	mov BYTE [rax+8+5],111
	mov BYTE [rax+8+6],111
	mov r8,rax
	mov rdi,7
	cmp rdi,6
	jle err
	mov rsi,6
	mov BYTE [rax+8+rsi],44
;; rsp=0 , %110~%[ 44r ] %109~%[ 6r ] %108~2'(= {| l |} ) %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; _emt 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	jmp LB_47
LB_46: db 95,101,109,116,58,0
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
	mov rax,r8
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
LB_48: db 10,0
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
	jmp LB_50
LB_50:
;; rsp=0 , %111~2'(= {| l |} ) %110~%[ 44r ] %109~%[ 6r ] %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; _emt %[ 6r ] ⊢ %[ 6r ]
	jmp LB_52
LB_51: db 95,101,109,116,58,0
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
LB_53: db 54,114,0
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
LB_57:
;; rsp=0 , %112~%[ 6r ] %111~2'(= {| l |} ) %110~%[ 44r ] %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; _emt %[ 44r ] ⊢ %[ 44r ]
	jmp LB_59
LB_58: db 95,101,109,116,58,0
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
	jmp LB_61
LB_60: db 52,52,114,0
LB_61:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_60
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
	jmp LB_63
LB_62: db 10,0
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
	jmp LB_64
LB_64:
;; rsp=0 , %113~%[ 44r ] %112~%[ 6r ] %111~2'(= {| l |} ) %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; #26 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %114~3(<4)◂%[ 44r ] %113~%[ 44r ] %112~%[ 6r ] %111~2'(= {| l |} ) %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; rsp_d=0, #31 3(<4)◂%[ 44r ] ⊢ { 4'(= a5◂ [ ] ) 3'(= r ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 3(<4)◂%[ 44r ] ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 3(<4)◂%[ 44r ] ⊢ 0'(= a5◂ [ ] )
	mov r13,44
	mov rdi,r13
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],3
	mov r13,rsi
	call ETR_31
	mov r8,QWORD [rsp-8+8*3]
	mov rax,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %116~3'(= r ) %115~4'(= a5◂ [ ] ) %113~%[ 44r ] %112~%[ 6r ] %111~2'(= {| l |} ) %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; _emt { 4'(= a5◂ [ ] ) 3'(= r ) } ⊢ { 4'(= a5◂ [ ] ) 3'(= r ) }
	jmp LB_66
LB_65: db 95,101,109,116,58,0
LB_66:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_65
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
LB_67: db 123,32,0
LB_68:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_67
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
	mov rax,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_69
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_71
LB_70: db 32,0
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
	mov rax,r9
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
	jmp LB_73
LB_72: db 32,0
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
	jmp LB_75
LB_74: db 125,32,0
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
	jmp LB_77
LB_76: db 10,0
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
	jmp LB_78
LB_69:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_83+8*rax]
LB_83: dq LB_79,LB_80,LB_81,LB_82
LB_79:
	jmp LB_86
LB_85: db 39,48,226,151,130,0
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
LB_87: db 42,123,32,0
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
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_69
	pop r8 
	jmp LB_90
LB_89: db 32,0
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
	push r8
	mov r8,QWORD [r8+8+8*1]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r8 
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
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_69
	pop r8 
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
	jmp LB_84
LB_80:
	jmp LB_98
LB_97: db 39,49,226,151,130,0
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
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_84
LB_81:
	jmp LB_100
LB_99: db 39,50,226,151,130,0
LB_100:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_99
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
	jmp LB_102
LB_101: db 42,123,32,0
LB_102:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_101
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
	jmp LB_104
LB_103: db 125,32,0
LB_104:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_103
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
	jmp LB_84
LB_82:
	jmp LB_106
LB_105: db 39,51,226,151,130,0
LB_106:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_105
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
	jmp LB_84
LB_84:
	ret
LB_78:
;; rsp=0 , %118~3'(= r ) %117~4'(= a5◂ [ ] ) %113~%[ 44r ] %112~%[ 6r ] %111~2'(= {| l |} ) %107~1'(= {| l |} ) %105~0'(= a5◂ [ ] ) 
; rsp_d=0, #35 { %[ 44r ] 0'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	lea rsp,[rsp-8*4]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
; .mov_ptn2 { %[ 44r ] 0'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 0'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn %[ 44r ] ⊢ 0'(= r )
	mov r13,44
	call ETR_35
	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*4]
;; rsp=0 , %119~0'(= a5◂ [ ] ) %118~3'(= r ) %117~4'(= a5◂ [ ] ) %113~%[ 44r ] %112~%[ 6r ] %111~2'(= {| l |} ) %107~1'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 0'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 3'(= r )
; .dlt.ptn 4'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn %[ 44r ]
; .dlt.ptn %[ 6r ]
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
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
; .mov_ptn2 { } ⊢ { }
;; ret 0
	ret
ETR_39:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_39
	ret
GRM_39:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_110
	jmp LB_111
LB_110:
	mov r8,unt_1
	jmp LB_108
LB_111:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_112
	jmp LB_113
LB_112:
	mov r8,unt_1
	jmp LB_108
LB_113:
	add r14,1
	jmp LB_109
LB_108:
	lea rsp,[rsp+8*0]
	jmp LB_107
LB_109:
	call GRM_39
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_116
	jmp LB_117
LB_116:
	jmp LB_114
LB_117:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_115
LB_114:
	lea rsp,[rsp+8*0]
	jmp LB_107
LB_115:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_118
;; rsp=0 , %120~{ } 
; #20 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %121~0(<2)◂{ } %120~{ } 
; ∎ 0(<2)◂{ }
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rdi,unt
	mov r8,rdi
	mov rdi,unt_0
	mov r8,rdi
;; ret 0
	jmp LB_118
;;; ret_f
LB_118:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_107
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_107:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_40:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_40
	ret
GRM_40:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_122
	jmp LB_123
LB_122:
	mov r8,unt_1
	jmp LB_120
LB_123:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_124
	jmp LB_125
LB_124:
	mov r8,unt_1
	jmp LB_120
LB_125:
	add r14,1
	jmp LB_121
LB_120:
	lea rsp,[rsp+8*0]
	jmp LB_119
LB_121:
	call GRM_41
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_128
	jmp LB_129
LB_128:
	jmp LB_126
LB_129:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_127
LB_126:
	lea rsp,[rsp+8*0]
	jmp LB_119
LB_127:
	mov QWORD [rsp+8*1],r14
;;; 	jmp LB_130
;; rsp=1 , %122~8'(= a5◂ [ ] ) 
; #20 8'(= a5◂ [ ] ) ⊢ 0(<2)◂8'(= a5◂ [ ] )
;; rsp=1 , %123~0(<2)◂8'(= a5◂ [ ] ) 
; ∎ 0(<2)◂8'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂8'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂8'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
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
	jmp LB_130
;;; ret_f
LB_130:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_119
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_119:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_41:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_41
	ret
GRM_41:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_134
	jmp LB_135
LB_134:
	mov r8,unt_1
	jmp LB_132
LB_135:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_136
	jmp LB_137
LB_136:
	mov r8,unt_1
	jmp LB_132
LB_137:
	add r14,1
	jmp LB_133
LB_132:
	lea rsp,[rsp+8*0]
	jmp LB_131
LB_133:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_138
;; rsp=0 , %124~{ } 
; #21 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %125~1(<2)◂{ } %124~{ } 
; ∎ 1(<2)◂{ }
; .dlt.ptn { }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rdi,unt
	mov r8,rdi
	mov rdi,unt_1
	mov r8,rdi
;; ret 0
	jmp LB_138
;;; ret_f
LB_138:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_131
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_131:
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
	jg LB_142
	jmp LB_143
LB_142:
	mov r8,unt_1
	jmp LB_140
LB_143:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_144
	jmp LB_145
LB_144:
	mov r8,unt_1
	jmp LB_140
LB_145:
	add r14,1
	jmp LB_141
LB_140:
	lea rsp,[rsp+8*0]
	jmp LB_139
LB_141:
	call GRM_42
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_148
	jmp LB_149
LB_148:
	jmp LB_146
LB_149:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_147
LB_146:
	lea rsp,[rsp+8*0]
	jmp LB_139
LB_147:
	call GRM_41
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_152
	jmp LB_153
LB_152:
	jmp LB_150
LB_153:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_151
LB_150:
	lea rsp,[rsp+8*1]
	jmp LB_139
LB_151:
	mov QWORD [rsp+8*2],r14
;;; 	jmp LB_154
;; rsp=2 , %127~9'(= a5◂ [ ] ) %126~8'(= r ) 
; rsp_d=0, #35 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov r14,QWORD [rsp-8+8*1]
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov r13,QWORD [rsp-8+8*2]
	call ETR_35
	lea rsp,[rsp+8*2]
;; rsp=0 , %128~0'(= a5◂ [ ] ) 
; #20 0'(= a5◂ [ ] ) ⊢ 0(<2)◂0'(= a5◂ [ ] )
;; rsp=0 , %129~0(<2)◂0'(= a5◂ [ ] ) 
; ∎ 0(<2)◂0'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r8,r13
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_154
;;; ret_f
LB_154:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_139
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_139:
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
	jg LB_158
	jmp LB_159
LB_158:
	mov r8,unt_1
	jmp LB_156
LB_159:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_160
	jmp LB_161
LB_160:
	mov r8,unt_1
	jmp LB_156
LB_161:
	add r14,1
	jmp LB_157
LB_156:
	lea rsp,[rsp+8*0]
	jmp LB_155
LB_157:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_162
;; rsp=0 , 
; #27 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %130~2(<4)◂{ } 
; #20 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %131~0(<2)◂2(<4)◂{ } 
; ∎ 0(<2)◂2(<4)◂{ }
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rdi,unt
	mov r8,rdi
	mov rdi,unt_2
	mov r8,rdi
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_162
;;; ret_f
LB_162:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_155
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_155:
	pop rdi
	pop r9 
	pop r14
	pop r13
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	cmp r14,r9
	jge LB_166
	jmp LB_167
LB_166:
	mov r8,unt_1 
	jmp LB_164
LB_167:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_165
LB_164:
	lea rsp,[rsp+8*0]
	jmp LB_163
LB_165:
	call GRM_41
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_170
	jmp LB_171
LB_170:
	jmp LB_168
LB_171:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_169
LB_168:
	lea rsp,[rsp+8*1]
	jmp LB_163
LB_169:
	mov QWORD [rsp+8*2],r14
;;; 	jmp LB_172
;; rsp=2 , %133~9'(= a5◂ [ ] ) %132~8'(= r ) 
; rsp_d=0, #35 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov r14,QWORD [rsp-8+8*1]
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov r13,QWORD [rsp-8+8*2]
	call ETR_35
	lea rsp,[rsp+8*2]
;; rsp=0 , %134~0'(= a5◂ [ ] ) 
; #20 0'(= a5◂ [ ] ) ⊢ 0(<2)◂0'(= a5◂ [ ] )
;; rsp=0 , %135~0(<2)◂0'(= a5◂ [ ] ) 
; ∎ 0(<2)◂0'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r8,r13
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_172
;;; ret_f
LB_172:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_163
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_163:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_42:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_42
	ret
GRM_42:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_176
	jmp LB_177
LB_176:
	mov r8,unt_1
	jmp LB_174
LB_177:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_178
	jmp LB_179
LB_178:
	mov r8,unt_1
	jmp LB_174
LB_179:
	add r14,1
	jmp LB_175
LB_174:
	lea rsp,[rsp+8*0]
	jmp LB_173
LB_175:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_180
;; rsp=0 , 
; #20 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %136~0(<2)◂%[ 92r ] 
; ∎ 0(<2)◂%[ 92r ]
; .mov_ptn2 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,92
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_180
;;; ret_f
LB_180:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_173
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_173:
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
	jg LB_184
	jmp LB_185
LB_184:
	mov r8,unt_1
	jmp LB_182
LB_185:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_186
	jmp LB_187
LB_186:
	mov r8,unt_1
	jmp LB_182
LB_187:
	add r14,1
	jmp LB_183
LB_182:
	lea rsp,[rsp+8*0]
	jmp LB_181
LB_183:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_188
;; rsp=0 , 
; #20 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %137~0(<2)◂%[ 34r ] 
; ∎ 0(<2)◂%[ 34r ]
; .mov_ptn2 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,34
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_188
;;; ret_f
LB_188:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_181
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_181:
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
	jg LB_192
	jmp LB_193
LB_192:
	mov r8,unt_1
	jmp LB_190
LB_193:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_194
	jmp LB_195
LB_194:
	mov r8,unt_1
	jmp LB_190
LB_195:
	add r14,1
	jmp LB_191
LB_190:
	lea rsp,[rsp+8*0]
	jmp LB_189
LB_191:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_196
;; rsp=0 , 
; #20 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %138~0(<2)◂%[ 10r ] 
; ∎ 0(<2)◂%[ 10r ]
; .mov_ptn2 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,10
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_196
;;; ret_f
LB_196:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_189
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_189:
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
	jg LB_200
	jmp LB_201
LB_200:
	mov r8,unt_1
	jmp LB_198
LB_201:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_202
	jmp LB_203
LB_202:
	mov r8,unt_1
	jmp LB_198
LB_203:
	add r14,1
	jmp LB_199
LB_198:
	lea rsp,[rsp+8*0]
	jmp LB_197
LB_199:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_204
;; rsp=0 , 
; #20 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %139~0(<2)◂%[ 9r ] 
; ∎ 0(<2)◂%[ 9r ]
; .mov_ptn2 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,9
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_204
;;; ret_f
LB_204:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_197
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_197:
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
	jg LB_208
	jmp LB_209
LB_208:
	mov r8,unt_1
	jmp LB_206
LB_209:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_210
	jmp LB_211
LB_210:
	mov r8,unt_1
	jmp LB_206
LB_211:
	add r14,1
	jmp LB_207
LB_206:
	lea rsp,[rsp+8*0]
	jmp LB_205
LB_207:
	mov QWORD [rsp+8*0],r14
;;; 	jmp LB_212
;; rsp=0 , 
; #20 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %140~0(<2)◂%[ 0r ] 
; ∎ 0(<2)◂%[ 0r ]
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
;; ret 0
	jmp LB_212
;;; ret_f
LB_212:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_205
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_205:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_1:
	push RTM_2
;; rsp=0 , 
; rsp_d=0, #40 { %[ ""Ho\"o"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
; .mov_ptn2 { %[ ""Ho\"o"" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ ""Ho\"o"" ] ⊢ 0'(= {| l |} )
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
	mov BYTE [rax+8+0],34
	mov BYTE [rax+8+1],72
	mov BYTE [rax+8+2],111
	mov BYTE [rax+8+3],92
	mov BYTE [rax+8+4],34
	mov BYTE [rax+8+5],111
	mov BYTE [rax+8+6],34
	mov r13,rax
	call ETR_40
;; rsp=0 , %143~2'(= a3◂ [ a5◂ [ ]] ) %142~1'(= r ) %141~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
	jmp LB_214
LB_213: db 95,101,109,116,58,0
LB_214:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_213
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
	jmp LB_216
LB_215: db 123,32,0
LB_216:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_215
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
	jmp LB_218
LB_217: db 32,0
LB_218:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_217
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
	jmp LB_220
LB_219: db 32,0
LB_220:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_219
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
	call LB_221
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_223
LB_222: db 32,0
LB_223:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_222
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
	jmp LB_225
LB_224: db 125,32,0
LB_225:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_224
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
	jmp LB_227
LB_226: db 10,0
LB_227:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_226
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
	jmp LB_228
LB_221:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_231+8*rax]
LB_231: dq LB_229,LB_230
LB_229:
	jmp LB_234
LB_233: db 39,48,226,151,130,0
LB_234:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_233
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
	call LB_235
	jmp LB_232
LB_230:
	jmp LB_237
LB_236: db 39,49,226,151,130,0
LB_237:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_236
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
	jmp LB_239
LB_238: db 42,123,32,0
LB_239:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_238
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
	jmp LB_241
LB_240: db 125,32,0
LB_241:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_240
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
	jmp LB_232
LB_232:
	ret
LB_235:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_246+8*rax]
LB_246: dq LB_242,LB_243,LB_244,LB_245
LB_242:
	jmp LB_249
LB_248: db 39,48,226,151,130,0
LB_249:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_248
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
	jmp LB_251
LB_250: db 42,123,32,0
LB_251:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_250
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
	call LB_235
	pop r8 
	jmp LB_253
LB_252: db 32,0
LB_253:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_252
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
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r8 
	jmp LB_255
LB_254: db 32,0
LB_255:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_254
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
	mov r8,QWORD [r8+8+8*2]
	call LB_235
	pop r8 
	jmp LB_257
LB_256: db 32,0
LB_257:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_256
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
	jmp LB_259
LB_258: db 125,32,0
LB_259:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_258
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
	jmp LB_247
LB_243:
	jmp LB_261
LB_260: db 39,49,226,151,130,0
LB_261:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_260
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
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_247
LB_244:
	jmp LB_263
LB_262: db 39,50,226,151,130,0
LB_263:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_262
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
	jmp LB_265
LB_264: db 42,123,32,0
LB_265:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_264
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
	jmp LB_267
LB_266: db 125,32,0
LB_267:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_266
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
	jmp LB_247
LB_245:
	jmp LB_269
LB_268: db 39,51,226,151,130,0
LB_269:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_268
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
	jmp LB_247
LB_247:
	ret
LB_228:
;; rsp=0 , %146~2'(= a3◂ [ a5◂ [ ]] ) %145~1'(= r ) %144~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 0(<2)◂3'(= a5◂ [ ] )
	mov rdi,r8
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_270
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=0 , %147~3'(= a5◂ [ ] ) %145~1'(= r ) %144~0'(= {| l |} ) 
; rsp_d=0, #38 3'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	call ETR_38
	mov rax,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %149~2'(= {| l |} ) %148~3'(= a5◂ [ ] ) %145~1'(= r ) %144~0'(= {| l |} ) 
; _emt 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	jmp LB_272
LB_271: db 95,101,109,116,58,0
LB_272:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_271
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
	jmp LB_274
LB_273: db 10,0
LB_274:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_273
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
	jmp LB_275
LB_275:
;; rsp=0 , %150~2'(= {| l |} ) %148~3'(= a5◂ [ ] ) %145~1'(= r ) %144~0'(= {| l |} ) 
	jmp LB_276
LB_277:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_282+8*rsi]
LB_282: dq LB_278,LB_279,LB_280,LB_281
LB_278:
	mov rsi,[SS_TOP] 
	mov rax,[rsi] 
	mov QWORD [SS_TOP],rax
	mov QWORD [rsi],0
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	call LB_277
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	mov rax,rdi
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*2]
	call LB_277
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*2],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_283
LB_279:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	call rpc_s8  
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+6],1
	jmp LB_283
LB_280:
	mov rsi,[SS_TOP] 
	mov rax,[rsi] 
	mov QWORD [SS_TOP],rax
	mov QWORD [rsi],0
	mov rax,rsi 
	mov BYTE [rax+6],2
	jmp LB_283
LB_281:
	mov rdi,QWORD [rdi+8]
	mov rax,rdi
	mov rsi,[SS_TOP] 
	mov rdi,[rsi] 
	mov QWORD [SS_TOP],rdi
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],3
	mov rax,rsi
	jmp LB_283
LB_283:
	ret
LB_276:
; $ 3'(= a5◂ [ ] ) ⊢ 3'(= a5◂ [ ] ),4'(= a5◂ [ ] )
	mov rdi,r9
	call LB_277
	mov r10,rax
;; rsp=0 , %152~4'(= a5◂ [ ] ) %151~3'(= a5◂ [ ] ) %150~2'(= {| l |} ) %145~1'(= r ) %144~0'(= {| l |} ) 
; _emt { 3'(= a5◂ [ ] ) 4'(= a5◂ [ ] ) } ⊢ { 3'(= a5◂ [ ] ) 4'(= a5◂ [ ] ) }
	jmp LB_285
LB_284: db 95,101,109,116,58,0
LB_285:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_284
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
	jmp LB_287
LB_286: db 123,32,0
LB_287:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_286
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
	mov rax,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_288
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_290
LB_289: db 32,0
LB_290:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_289
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
	mov rax,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_288
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_292
LB_291: db 32,0
LB_292:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_291
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
	jmp LB_294
LB_293: db 125,32,0
LB_294:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_293
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
	jmp LB_296
LB_295: db 10,0
LB_296:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_295
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
	jmp LB_297
LB_288:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_302+8*rax]
LB_302: dq LB_298,LB_299,LB_300,LB_301
LB_298:
	jmp LB_305
LB_304: db 39,48,226,151,130,0
LB_305:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_304
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
	jmp LB_307
LB_306: db 42,123,32,0
LB_307:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_306
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
	call LB_288
	pop r8 
	jmp LB_309
LB_308: db 32,0
LB_309:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_308
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
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r8 
	jmp LB_311
LB_310: db 32,0
LB_311:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_310
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
	mov r8,QWORD [r8+8+8*2]
	call LB_288
	pop r8 
	jmp LB_313
LB_312: db 32,0
LB_313:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_312
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
	jmp LB_315
LB_314: db 125,32,0
LB_315:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_314
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
	jmp LB_303
LB_299:
	jmp LB_317
LB_316: db 39,49,226,151,130,0
LB_317:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_316
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
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_303
LB_300:
	jmp LB_319
LB_318: db 39,50,226,151,130,0
LB_319:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_318
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
	jmp LB_321
LB_320: db 42,123,32,0
LB_321:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_320
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
	jmp LB_323
LB_322: db 125,32,0
LB_323:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_322
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
	jmp LB_303
LB_301:
	jmp LB_325
LB_324: db 39,51,226,151,130,0
LB_325:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_324
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
	jmp LB_303
LB_303:
	ret
LB_297:
;; rsp=0 , %154~4'(= a5◂ [ ] ) %153~3'(= a5◂ [ ] ) %150~2'(= {| l |} ) %145~1'(= r ) %144~0'(= {| l |} ) 
; #18 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %155~1(<2)◂{ } %154~4'(= a5◂ [ ] ) %153~3'(= a5◂ [ ] ) %150~2'(= {| l |} ) %145~1'(= r ) %144~0'(= {| l |} ) 
; #19 { %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %156~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %154~4'(= a5◂ [ ] ) %153~3'(= a5◂ [ ] ) %150~2'(= {| l |} ) %145~1'(= r ) %144~0'(= {| l |} ) 
	jmp LB_326
LB_326:
; $ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } ⊢ 0(<2)◂{ %[ 0r ] 1(<2)◂{ } },0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
;; rsp=0 , %158~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %157~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %154~4'(= a5◂ [ ] ) %153~3'(= a5◂ [ ] ) %150~2'(= {| l |} ) %145~1'(= r ) %144~0'(= {| l |} ) 
; _emt { 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } } ⊢ { 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } 0(<2)◂{ %[ 0r ] 1(<2)◂{ } } }
	jmp LB_328
LB_327: db 95,101,109,116,58,0
LB_328:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_327
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
	jmp LB_330
LB_329: db 123,32,0
LB_330:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_329
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
	jmp LB_332
LB_331: db 39,48,226,151,130,0
LB_332:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_331
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
	jmp LB_334
LB_333: db 123,32,0
LB_334:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_333
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
	jmp LB_336
LB_335: db 48,114,0
LB_336:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_335
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
	jmp LB_338
LB_337: db 32,0
LB_338:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_337
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
	jmp LB_340
LB_339: db 39,49,226,151,130,0
LB_340:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_339
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
	jmp LB_342
LB_341: db 123,32,0
LB_342:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_341
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
	jmp LB_344
LB_343: db 125,32,0
LB_344:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_343
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
	jmp LB_346
LB_345: db 32,0
LB_346:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_345
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
	jmp LB_348
LB_347: db 125,32,0
LB_348:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_347
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
	jmp LB_350
LB_349: db 32,0
LB_350:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_349
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
	jmp LB_352
LB_351: db 39,48,226,151,130,0
LB_352:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_351
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
	jmp LB_354
LB_353: db 123,32,0
LB_354:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_353
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
	jmp LB_356
LB_355: db 48,114,0
LB_356:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_355
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
	jmp LB_358
LB_357: db 32,0
LB_358:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_357
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
	jmp LB_360
LB_359: db 39,49,226,151,130,0
LB_360:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_359
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
	jmp LB_362
LB_361: db 123,32,0
LB_362:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_361
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
	jmp LB_364
LB_363: db 125,32,0
LB_364:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_363
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
	jmp LB_366
LB_365: db 32,0
LB_366:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_365
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
	jmp LB_368
LB_367: db 125,32,0
LB_368:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_367
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
	jmp LB_370
LB_369: db 32,0
LB_370:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_369
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
	jmp LB_372
LB_371: db 125,32,0
LB_372:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_371
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
	jmp LB_374
LB_373: db 10,0
LB_374:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_373
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
	jmp LB_375
LB_375:
;; rsp=0 , %160~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %159~0(<2)◂{ %[ 0r ] 1(<2)◂{ } } %154~4'(= a5◂ [ ] ) %153~3'(= a5◂ [ ] ) %150~2'(= {| l |} ) %145~1'(= r ) %144~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
; .dlt.ptn 0(<2)◂{ %[ 0r ] 1(<2)◂{ } }
; .dlt.ptn 4'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 3'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn 2'(= {| l |} )
	mov rdi,r8
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
; .dlt.ptn 1'(= r )
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
LB_270:
;; ? 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %145~1'(= r ) %144~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 1'(= r )
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
RTM_2:
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
