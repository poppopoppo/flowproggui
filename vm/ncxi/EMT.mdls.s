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
ETR_29: ; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %0~0'(= {| l |} ) 
; #27 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %1~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	mov rdi,r13
	mov BYTE [rdi+6],1
	ret
ETR_30: ; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
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
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov r13,r8
;; rsp=0 , %14~0'(= r ) %13~2'(= r ) %7~3'(= a5◂ [ ] ) %5~1'(= a5◂ [ ] ) 
; #28 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
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
	ret
LB_0:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
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
;; rsp=0 , %11~1'(= r ) %10~0'(= {| l |} ) 
; #27 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %12~1(<4)◂0'(= {| l |} ) %11~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<4)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r8
	mov rdi,r13
	mov BYTE [rdi+6],1
	ret
LB_1:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_2
	mov rax,QWORD [rdi+8]
	mov r14,rax
;; rsp=0 , %3~1'(= r ) 
; #25 1'(= r ) ⊢ 3(<4)◂1'(= r )
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
	ret
LB_2:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
;; rsp=0 , 
; #26 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %8~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov rdi,r13
	mov BYTE [rdi+6],2
	ret
ETR_31: ; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %17~1'(= {| l |} ) %16~0'(= a5◂ [ ] ) 
; _s8_len 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r8,rdi
;; rsp=0 , %19~2'(= r ) %18~1'(= {| l |} ) %16~0'(= a5◂ [ ] ) 
; rsp_d=0, #30 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_30
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %21~3'(= r ) %20~0'(= a5◂ [ ] ) %19~2'(= r ) %18~1'(= {| l |} ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %23~3'(= r ) %22~2'(= r ) %20~0'(= a5◂ [ ] ) %18~1'(= {| l |} ) 
; #27 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %24~1(<4)◂1'(= {| l |} ) %23~3'(= r ) %22~2'(= r ) %20~0'(= a5◂ [ ] ) 
; #28 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
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
	ret
ETR_32: ; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %27~1'(= a5◂ [ ] ) %26~0'(= a5◂ [ ] ) 
; rsp_d=0, #30 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_30
	mov rax,QWORD [rsp-8+8*1]
	mov r8,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %29~2'(= r ) %28~0'(= a5◂ [ ] ) %27~1'(= a5◂ [ ] ) 
; rsp_d=0, #30 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r14
	call ETR_30
	mov r8,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %31~1'(= r ) %30~3'(= a5◂ [ ] ) %29~2'(= r ) %28~0'(= a5◂ [ ] ) 
; _add { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %33~1'(= r ) %32~2'(= r ) %30~3'(= a5◂ [ ] ) %28~0'(= a5◂ [ ] ) 
; #28 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %34~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %33~1'(= r ) 
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
	ret
ETR_33: ; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %37~2'(= r ) %36~1'(= {| l |} ) %35~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_3
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r10,QWORD [rdi+8+8*1]
	mov rdi,r13
	mov r11,QWORD [rdi+8+8*2]
;; rsp=0 , %42~5'(= a5◂ [ ] ) %41~4'(= r ) %40~3'(= a5◂ [ ] ) %37~2'(= r ) %36~1'(= {| l |} ) 
; rsp_d=0, #33 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	call ETR_33
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %61~2'(= r ) %60~1'(= {| l |} ) %59~0'(= a5◂ [ ] ) %42~5'(= a5◂ [ ] ) %41~4'(= r ) 
; rsp_d=0, #33 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r11
	call ETR_33
	mov r10,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %64~2'(= r ) %63~1'(= {| l |} ) %62~3'(= a5◂ [ ] ) %59~0'(= a5◂ [ ] ) %41~4'(= r ) 
; #28 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %65~0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %64~2'(= r ) %63~1'(= {| l |} ) 
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
	ret
LB_3:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,2
	jnz LB_4
;; rsp=0 , %37~2'(= r ) %36~1'(= {| l |} ) 
; #26 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %58~2(<4)◂{ } %37~2'(= r ) %36~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rdi,[SS_TOP]
	mov rsi,[rdi]
	mov QWORD [SS_TOP],rsi
	mov QWORD [rdi],0
	mov r13,rdi
	mov rdi,r13
	mov BYTE [rdi+6],2
	ret
LB_4:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,3
	jnz LB_5
	mov rax,QWORD [rdi+8]
	mov r9,rax
;; rsp=0 , %39~3'(= r ) %37~2'(= r ) %36~1'(= {| l |} ) 
; _sts { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r8
	jle err
	mov rsi,r8
	mov rdi,r9
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %55~3'(= r ) %54~2'(= r ) %53~1'(= {| l |} ) 
; _inc 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %56~2'(= r ) %55~3'(= r ) %53~1'(= {| l |} ) 
; #25 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %57~3(<4)◂3'(= r ) %56~2'(= r ) %53~1'(= {| l |} ) 
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
	ret
LB_5:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %38~0'(= {| l |} ) %37~2'(= r ) %36~1'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r9,rdi
;; rsp=0 , %44~3'(= r ) %43~0'(= {| l |} ) %37~2'(= r ) %36~1'(= {| l |} ) 
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
;; rsp=0 , %49~2'(= r ) %48~1'(= {| l |} ) %47~%[ 0r ] %46~0'(= {| l |} ) %45~3'(= r ) 
; #27 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %50~1(<4)◂0'(= {| l |} ) %49~2'(= r ) %48~1'(= {| l |} ) %47~%[ 0r ] %45~3'(= r ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %52~3'(= r ) %51~2'(= r ) %50~1(<4)◂0'(= {| l |} ) %48~1'(= {| l |} ) %47~%[ 0r ] 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn 3'(= r )
; .dlt.ptn %[ 0r ]
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<4)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	mov rdi,r13
	mov BYTE [rdi+6],1
	ret
ETR_34: ; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %66~0'(= a5◂ [ ] ) 
; rsp_d=0, #30 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_30
;; rsp=0 , %68~1'(= r ) %67~0'(= a5◂ [ ] ) 
; _mlc_s8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,r14
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
;; rsp=0 , %70~2'(= {| l |} ) %69~1'(= r ) %67~0'(= a5◂ [ ] ) 
; rsp_d=0, #33 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r8
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov r8,0
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r9
	call ETR_33
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %73~2'(= r ) %72~3'(= {| l |} ) %71~0'(= a5◂ [ ] ) %69~1'(= r ) 
; ∎ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) }
; .dlt.ptn 2'(= r )
; .dlt.ptn 1'(= r )
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r9
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; #27 %[ "Hello" ] ⊢ 1(<4)◂%[ "Hello" ]
;; rsp=0 , %74~1(<4)◂%[ "Hello" ] 
; rsp_d=0, #29 %[ "World" ] ⊢ 0'(= a5◂ [ ] )
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
	call ETR_29
;; rsp=0 , %75~0'(= a5◂ [ ] ) %74~1(<4)◂%[ "Hello" ] 
; rsp_d=0, #32 { 1(<4)◂%[ "Hello" ] 0'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
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
	call ETR_32
;; rsp=0 , %76~0'(= a5◂ [ ] ) 
; rsp_d=0, #31 { 0'(= a5◂ [ ] ) %[ "!!" ] } ⊢ 0'(= a5◂ [ ] )
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
	call ETR_31
;; rsp=0 , %77~0'(= a5◂ [ ] ) 
; #25 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %78~3(<4)◂%[ 44r ] %77~0'(= a5◂ [ ] ) 
; rsp_d=0, #32 { 0'(= a5◂ [ ] ) 3(<4)◂%[ 44r ] } ⊢ 0'(= a5◂ [ ] )
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
	call ETR_32
;; rsp=0 , %79~0'(= a5◂ [ ] ) 
; _emt 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	jmp LB_7
LB_6: db 95,101,109,116,58,0
LB_7:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_6
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
	call LB_8
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_10
LB_9: db 10,0
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
	jmp LB_11
LB_8:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_16+8*rax]
LB_16: dq LB_12,LB_13,LB_14,LB_15
LB_12:
	jmp LB_19
LB_18: db 39,48,226,151,130,0
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
	jmp LB_21
LB_20: db 42,123,32,0
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
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_8
	pop r8 
	jmp LB_23
LB_22: db 32,0
LB_23:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_22
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
	jmp LB_25
LB_24: db 32,0
LB_25:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_24
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
	call LB_8
	pop r8 
	jmp LB_27
LB_26: db 32,0
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
	jmp LB_29
LB_28: db 125,32,0
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
	jmp LB_17
LB_13:
	jmp LB_31
LB_30: db 39,49,226,151,130,0
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
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_17
LB_14:
	jmp LB_33
LB_32: db 39,50,226,151,130,0
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
	jmp LB_35
LB_34: db 42,123,32,0
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
	jmp LB_17
LB_15:
	jmp LB_39
LB_38: db 39,51,226,151,130,0
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
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_17
LB_17:
	ret
LB_11:
;; rsp=0 , %80~0'(= a5◂ [ ] ) 
; rsp_d=0, #34 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_34
;; rsp=0 , %82~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; _emt 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	jmp LB_41
LB_40: db 95,101,109,116,58,0
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,r14
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
	jmp LB_43
LB_42: db 10,0
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
	jmp LB_44
LB_44:
;; rsp=0 , %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
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
;; rsp=0 , %86~%[ 44r ] %85~%[ 6r ] %84~2'(= {| l |} ) %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; _emt 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	jmp LB_46
LB_45: db 95,101,109,116,58,0
LB_46:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_45
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
	jmp LB_48
LB_47: db 10,0
LB_48:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_47
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
LB_49:
;; rsp=0 , %87~2'(= {| l |} ) %86~%[ 44r ] %85~%[ 6r ] %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; _emt %[ 6r ] ⊢ %[ 6r ]
	jmp LB_51
LB_50: db 95,101,109,116,58,0
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
LB_52: db 54,114,0
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
	jmp LB_55
LB_54: db 10,0
LB_55:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_54
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
LB_56:
;; rsp=0 , %88~%[ 6r ] %87~2'(= {| l |} ) %86~%[ 44r ] %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; _emt %[ 44r ] ⊢ %[ 44r ]
	jmp LB_58
LB_57: db 95,101,109,116,58,0
LB_58:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_57
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
	jmp LB_60
LB_59: db 52,52,114,0
LB_60:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_59
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
	jmp LB_62
LB_61: db 10,0
LB_62:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_61
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
LB_63:
;; rsp=0 , %89~%[ 44r ] %88~%[ 6r ] %87~2'(= {| l |} ) %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; #25 %[ 44r ] ⊢ 3(<4)◂%[ 44r ]
;; rsp=0 , %90~3(<4)◂%[ 44r ] %89~%[ 44r ] %88~%[ 6r ] %87~2'(= {| l |} ) %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; rsp_d=0, #30 3(<4)◂%[ 44r ] ⊢ { 4'(= a5◂ [ ] ) 3'(= r ) }
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
	call ETR_30
	mov r8,QWORD [rsp-8+8*3]
	mov rax,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r10,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %92~3'(= r ) %91~4'(= a5◂ [ ] ) %89~%[ 44r ] %88~%[ 6r ] %87~2'(= {| l |} ) %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; _emt { 4'(= a5◂ [ ] ) 3'(= r ) } ⊢ { 4'(= a5◂ [ ] ) 3'(= r ) }
	jmp LB_65
LB_64: db 95,101,109,116,58,0
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
LB_66: db 123,32,0
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
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,r10
	call LB_68
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_70
LB_69: db 32,0
LB_70:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_69
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
	mov r8,r9
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
	jmp LB_72
LB_71: db 32,0
LB_72:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_71
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
	jmp LB_74
LB_73: db 125,32,0
LB_74:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_73
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
	jmp LB_76
LB_75: db 10,0
LB_76:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_75
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
LB_68:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_82+8*rax]
LB_82: dq LB_78,LB_79,LB_80,LB_81
LB_78:
	jmp LB_85
LB_84: db 39,48,226,151,130,0
LB_85:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_84
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
	jmp LB_87
LB_86: db 42,123,32,0
LB_87:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_86
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
	call LB_68
	pop r8 
	jmp LB_89
LB_88: db 32,0
LB_89:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_88
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
	jmp LB_91
LB_90: db 32,0
LB_91:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_90
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
	call LB_68
	pop r8 
	jmp LB_93
LB_92: db 32,0
LB_93:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_92
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
	jmp LB_95
LB_94: db 125,32,0
LB_95:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_94
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
	jmp LB_83
LB_79:
	jmp LB_97
LB_96: db 39,49,226,151,130,0
LB_97:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_96
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
	jmp LB_83
LB_80:
	jmp LB_99
LB_98: db 39,50,226,151,130,0
LB_99:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_98
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
	jmp LB_101
LB_100: db 42,123,32,0
LB_101:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_100
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
	jmp LB_103
LB_102: db 125,32,0
LB_103:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_102
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
	jmp LB_83
LB_81:
	jmp LB_105
LB_104: db 39,51,226,151,130,0
LB_105:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_104
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
	jmp LB_83
LB_83:
	ret
LB_77:
;; rsp=0 , %94~3'(= r ) %93~4'(= a5◂ [ ] ) %89~%[ 44r ] %88~%[ 6r ] %87~2'(= {| l |} ) %83~1'(= {| l |} ) %81~0'(= a5◂ [ ] ) 
; ∎ { }
; .dlt.ptn 3'(= r )
; .dlt.ptn 4'(= a5◂ [ ] )
;	.dlt adt ⊢ _  
; .dlt.ptn %[ 44r ]
; .dlt.ptn %[ 6r ]
; .dlt.ptn 2'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,r8
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
