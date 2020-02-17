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
ETR_32: ; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %35~2'(= r ) %34~1'(= {| l |} ) %33~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<3)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	movzx rax,BYTE [rdi+6]
	cmp rax,0
	jnz LB_2
	mov rdi,r13
	mov r9,QWORD [rdi+8+8*0]
	mov rdi,r13
	mov r10,QWORD [rdi+8+8*1]
	mov rdi,r13
	mov r11,QWORD [rdi+8+8*2]
;; rsp=0 , %49~5'(= a5◂ [ ] ) %48~4'(= r ) %47~3'(= a5◂ [ ] ) %35~2'(= r ) %34~1'(= {| l |} ) 
; rsp_d=0, #32 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	call ETR_32
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	lea rsp,[rsp+8*2]
;; rsp=0 , %52~2'(= r ) %51~1'(= {| l |} ) %50~0'(= a5◂ [ ] ) %49~5'(= a5◂ [ ] ) %48~4'(= r ) 
; rsp_d=0, #32 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*2]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r11
	call ETR_32
	mov r10,QWORD [rsp-8+8*2]
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r13
	mov r13,rax
	lea rsp,[rsp+8*2]
;; rsp=0 , %55~2'(= r ) %54~1'(= {| l |} ) %53~3'(= a5◂ [ ] ) %50~0'(= a5◂ [ ] ) %48~4'(= r ) 
; #27 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<3)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %56~0(<3)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %55~2'(= r ) %54~1'(= {| l |} ) 
; ∎ { 0(<3)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<3)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r11,r13
; .mov_ptn 0(<3)◂{ 5'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
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
LB_2:
;; ? 0'(= a5◂ [ ] ) ⊢ 1(<3)◂0'(= {| l |} )
;; rsp=0 , %36~0'(= {| l |} ) %35~2'(= r ) %34~1'(= {| l |} ) 
; _s8_len 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi]
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi
	mov r9,rdi
;; rsp=0 , %38~3'(= r ) %37~0'(= {| l |} ) %35~2'(= r ) %34~1'(= {| l |} ) 
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
;; rsp=0 , %43~2'(= r ) %42~1'(= {| l |} ) %41~%[ 0r ] %40~0'(= {| l |} ) %39~3'(= r ) 
; #26 0'(= {| l |} ) ⊢ 1(<3)◂0'(= {| l |} )
;; rsp=0 , %44~1(<3)◂0'(= {| l |} ) %43~2'(= r ) %42~1'(= {| l |} ) %41~%[ 0r ] %39~3'(= r ) 
; _add { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %46~3'(= r ) %45~2'(= r ) %44~1(<3)◂0'(= {| l |} ) %42~1'(= {| l |} ) %41~%[ 0r ] 
; ∎ { 1(<3)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .dlt.ptn 3'(= r )
; .dlt.ptn %[ 0r ]
; .mov_ptn2 { 1(<3)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<3)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r13,r9
	mov rdi,r13
	mov BYTE [rdi+6],1
	ret
ETR_33: ; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %57~0'(= a5◂ [ ] ) 
; rsp_d=0, #29 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_29
;; rsp=0 , %59~1'(= r ) %58~0'(= a5◂ [ ] ) 
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
;; rsp=0 , %61~2'(= {| l |} ) %60~1'(= r ) %58~0'(= a5◂ [ ] ) 
; rsp_d=0, #32 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	lea rsp,[rsp-8*1]
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r8
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov r8,0
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov r14,r9
	call ETR_32
	mov rax,QWORD [rsp-8+8*1]
	mov r9,r14
	mov r14,rax
	lea rsp,[rsp+8*1]
;; rsp=0 , %64~2'(= r ) %63~3'(= {| l |} ) %62~0'(= a5◂ [ ] ) %60~1'(= r ) 
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
; #26 %[ "Hello" ] ⊢ 1(<3)◂%[ "Hello" ]
;; rsp=0 , %65~1(<3)◂%[ "Hello" ] 
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
;; rsp=0 , %66~0'(= a5◂ [ ] ) %65~1(<3)◂%[ "Hello" ] 
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
;; rsp=0 , %67~0'(= a5◂ [ ] ) 
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
;; rsp=0 , %68~0'(= a5◂ [ ] ) 
; _emt 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	jmp LB_4
LB_3: db 95,101,109,116,58,0
LB_4:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_3
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
	call LB_5
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_7
LB_6: db 10,0
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
	jmp LB_8
LB_5:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_12+8*rax]
LB_12: dq LB_9,LB_10,LB_11
LB_9:
	jmp LB_15
LB_14: db 39,48,226,151,130,0
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
LB_16: db 42,123,32,0
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
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5
	pop r8 
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
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5
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
	jmp LB_25
LB_24: db 125,32,0
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
	jmp LB_13
LB_10:
	jmp LB_27
LB_26: db 39,49,226,151,130,0
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
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_13
LB_11:
	jmp LB_29
LB_28: db 39,50,226,151,130,0
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
	jmp LB_31
LB_30: db 42,123,32,0
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
	jmp LB_33
LB_32: db 125,32,0
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
	jmp LB_13
LB_13:
	ret
LB_8:
;; rsp=0 , %69~0'(= a5◂ [ ] ) 
; rsp_d=0, #33 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_33
;; rsp=0 , %71~1'(= {| l |} ) %70~0'(= a5◂ [ ] ) 
; _emt 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	jmp LB_35
LB_34: db 95,101,109,116,58,0
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
	jmp LB_37
LB_36: db 10,0
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
	jmp LB_38
LB_38:
;; rsp=0 , %72~1'(= {| l |} ) %70~0'(= a5◂ [ ] ) 
; ∎ { }
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
