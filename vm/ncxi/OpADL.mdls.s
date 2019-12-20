%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_38523
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_29814:
NS_E_RDI_29814:
NS_E_29814_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_29815
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_29815:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29817:
NS_E_RDI_29817:
NS_E_29817_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_29817_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_29817_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29818:
NS_E_RDI_29818:
NS_E_29818_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_29818_LB_0
	cmp r11,57
	ja NS_E_29818_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_29818_LB_0:
	mov rax,0
	ret
NS_E_29820:
NS_E_RDI_29820:
NS_E_29820_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_29820_LB_0
	cmp r11,122
	ja NS_E_29820_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_29820_LB_0:
	mov rax,0
	ret
NS_E_29819:
NS_E_RDI_29819:
NS_E_29819_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_29819_LB_0
	cmp r11,90
	ja NS_E_29819_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_29819_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
	mov rsi,0
	setc sil
	push rsi
	call pp_v
	push rax
	push rdi
	mov rdi,2
	call mlc
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	pop rsi
	btr QWORD [rax],0
	btr QWORD [rax],1
	or QWORD [rax],rsi
	clc
	ret
NS_E_ID_59: dq 0
NS_E_59:
NS_E_RDI_59:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_29826
	bt QWORD [rdi],17
	jnc LB_29826
	bt QWORD [rdi],0
	jc LB_29828
	btr r12,2
	clc
	jmp LB_29829
LB_29828:
	bts r12,2
	stc
LB_29829:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_29827
LB_29826:
	btr r12,2
	clc
	call dcp
LB_29827:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_29822
	bt QWORD [rdi],17
	jnc LB_29822
	bt QWORD [rdi],0
	jc LB_29824
	btr r12,2
	clc
	jmp LB_29825
LB_29824:
	bts r12,2
	stc
LB_29825:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_29823
LB_29822:
	btr r12,2
	clc
	call dcp
LB_29823:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_29821
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_29821:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_29816:
NS_E_RDI_29816:
NS_E_29816_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	cmp rdi,0
	jz NS_E_29816_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_29816_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29836:
; 	|» { 0' 1' }
NS_E_RDI_29836:
MTC_LB_29837:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_29838
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_29839
	bt QWORD [rdi],0
	jc LB_29840
	btr r12,2
	clc
	jmp LB_29841
LB_29840:
	bts r12,2
	stc
LB_29841:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29839:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_29842:
	cmp r15,0
	jz LB_29843
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29842
LB_29843:
; ∎ %_29830
 ; {>  %_29830~0':(_lst)◂(t12579'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_29838:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29844
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_29845
	bt QWORD [rdi],0
	jc LB_29846
	btr r12,4
	clc
	jmp LB_29847
LB_29846:
	bts r12,4
	stc
LB_29847:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29845:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_29850
	btr r12,5
	clc
	jmp LB_29851
LB_29850:
	bts r12,5
	stc
LB_29851:
	mov r8,r11
	bt r12,5
	jc LB_29848
	btr r12,2
	jmp LB_29849
LB_29848:
	bts r12,2
LB_29849:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_29854
	btr r12,5
	clc
	jmp LB_29855
LB_29854:
	bts r12,5
	stc
LB_29855:
	mov r9,r11
	bt r12,5
	jc LB_29852
	btr r12,3
	jmp LB_29853
LB_29852:
	bts r12,3
LB_29853:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_29856:
	cmp r15,0
	jz LB_29857
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29856
LB_29857:
; _cns { %_29832 %_29830 } ⊢ %_29834 : %_29834
 ; {>  %_29832~2':t12579'(-1) %_29830~0':(_lst)◂(t12579'(-1)) %_29833~3':(_lst)◂(t12579'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f29836 { %_29834 %_29833 } ⊢ %_29835 : %_29835
 ; {>  %_29834~°0◂{ 2' 0' }:(_lst)◂(t12579'(-1)) %_29833~3':(_lst)◂(t12579'(-1)) }
; _f29836 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_29858
	btr r12,1
	jmp LB_29859
LB_29858:
	bts r12,1
LB_29859:
	mov r9,r13
	bt r12,0
	jc LB_29860
	btr r12,3
	jmp LB_29861
LB_29860:
	bts r12,3
LB_29861:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_29866
	btr r12,4
	jmp LB_29867
LB_29866:
	bts r12,4
LB_29867:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_29864
	btr QWORD [rdi],0
	jmp LB_29865
LB_29864:
	bts QWORD [rdi],0
LB_29865:
	mov r10,r9
	bt r12,3
	jc LB_29870
	btr r12,4
	jmp LB_29871
LB_29870:
	bts r12,4
LB_29871:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_29868
	btr QWORD [rdi],1
	jmp LB_29869
LB_29868:
	bts QWORD [rdi],1
LB_29869:
	mov rsi,1
	bt r12,0
	jc LB_29862
	mov rsi,0
	bt r13,0
	jc LB_29862
	jmp LB_29863
LB_29862:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_29863:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_29836
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_29835
 ; {>  %_29835~0':(_lst)◂(t12579'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_29844:
NS_E_29875:
; 	|» 0'
NS_E_RDI_29875:
; _nil {  } ⊢ %_29873 : %_29873
 ; {>  %_29872~0':(_lst)◂(t12600'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f29836 { %_29873 %_29872 } ⊢ %_29874 : %_29874
 ; {>  %_29872~0':(_lst)◂(t12600'(-1)) %_29873~°1◂{  }:(_lst)◂(t12597'(0)) }
; _f29836 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_29876
	btr r12,1
	jmp LB_29877
LB_29876:
	bts r12,1
LB_29877:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_29878
	mov rsi,0
	bt r13,0
	jc LB_29878
	jmp LB_29879
LB_29878:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_29879:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_29836
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_29874
 ; {>  %_29874~0':(_lst)◂(t12600'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_29893:
; 	|» { 0' 1' }
NS_E_RDI_29893:
MTC_LB_29894:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29895
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_29896
	bt QWORD [rdi],0
	jc LB_29897
	btr r12,4
	clc
	jmp LB_29898
LB_29897:
	bts r12,4
	stc
LB_29898:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29896:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_29901
	btr r12,5
	clc
	jmp LB_29902
LB_29901:
	bts r12,5
	stc
LB_29902:
	mov r8,r11
	bt r12,5
	jc LB_29899
	btr r12,2
	jmp LB_29900
LB_29899:
	bts r12,2
LB_29900:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_29905
	btr r12,5
	clc
	jmp LB_29906
LB_29905:
	bts r12,5
	stc
LB_29906:
	mov r9,r11
	bt r12,5
	jc LB_29903
	btr r12,3
	jmp LB_29904
LB_29903:
	bts r12,3
LB_29904:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_29907:
	cmp r15,0
	jz LB_29908
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29907
LB_29908:
; _f56 %_29880 ⊢ %_29884 : %_29884
 ; {>  %_29883~3':(_lst)◂(_r64) %_29882~2':_r64 %_29880~0':_r64 }
	add r13,1
; _f29893 { %_29884 %_29883 } ⊢ { %_29885 %_29886 } : { %_29885 %_29886 }
 ; {>  %_29884~0':_r64 %_29883~3':(_lst)◂(_r64) %_29882~2':_r64 }
; _f29893 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_29911
	btr r12,1
	jmp LB_29912
LB_29911:
	bts r12,1
LB_29912:
	call NS_E_29893
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_29909
	btr r12,2
	clc
	jmp LB_29910
LB_29909:
	bts r12,2
	stc
LB_29910:
	add rsp,16
; _f55 %_29885 ⊢ %_29887 : %_29887
 ; {>  %_29885~0':_r64 %_29886~1':_stg %_29882~2':_r64 }
	sub r13,1
; _f33 { %_29886 %_29887 %_29882 } ⊢ { %_29888 %_29889 %_29890 } : { %_29888 %_29889 %_29890 }
 ; {>  %_29887~0':_r64 %_29886~1':_stg %_29882~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_29913
	btr r12,3
	jmp LB_29914
LB_29913:
	bts r12,3
LB_29914:
	mov r14,r13
	bt r12,0
	jc LB_29915
	btr r12,1
	jmp LB_29916
LB_29915:
	bts r12,1
LB_29916:
	mov r13,r9
	bt r12,3
	jc LB_29917
	btr r12,0
	jmp LB_29918
LB_29917:
	bts r12,0
LB_29918:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_29889 %_29888 }
 ; {>  %_29889~1':_r64 %_29888~0':_stg %_29890~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_29919
	mov rdi,r8
	call dlt
LB_29919:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_29920
	btr r12,2
	jmp LB_29921
LB_29920:
	bts r12,2
LB_29921:
	mov r14,r13
	bt r12,0
	jc LB_29922
	btr r12,1
	jmp LB_29923
LB_29922:
	bts r12,1
LB_29923:
	mov r13,r8
	bt r12,2
	jc LB_29924
	btr r12,0
	jmp LB_29925
LB_29924:
	bts r12,0
LB_29925:
	ret
MTC_LB_29895:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_29926
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_29927
	bt QWORD [rdi],0
	jc LB_29928
	btr r12,2
	clc
	jmp LB_29929
LB_29928:
	bts r12,2
	stc
LB_29929:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29927:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_29930:
	cmp r15,0
	jz LB_29931
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29930
LB_29931:
; _f31 %_29880 ⊢ { %_29891 %_29892 } : { %_29891 %_29892 }
 ; {>  %_29880~0':_r64 }
; _f31 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_29891 %_29892 }
 ; {>  %_29892~1':_stg %_29891~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_29926:
NS_E_29936:
; 	|» 0'
NS_E_RDI_29936:
; » 0xr0 |~ {  } ⊢ %_29933 : %_29933
 ; {>  %_29932~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_29933
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f29893 { %_29933 %_29932 } ⊢ { %_29934 %_29935 } : { %_29934 %_29935 }
 ; {>  %_29933~1':_r64 %_29932~0':(_lst)◂(_r64) }
; _f29893 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_29937
	btr r12,2
	jmp LB_29938
LB_29937:
	bts r12,2
LB_29938:
	mov r14,r13
	bt r12,0
	jc LB_29939
	btr r12,1
	jmp LB_29940
LB_29939:
	bts r12,1
LB_29940:
	mov r13,r8
	bt r12,2
	jc LB_29941
	btr r12,0
	jmp LB_29942
LB_29941:
	bts r12,0
LB_29942:
	call NS_E_29893
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_29935
 ; {>  %_29935~1':_stg %_29934~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_29943
	mov rdi,r13
	call dlt
LB_29943:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_29944
	btr r12,0
	jmp LB_29945
LB_29944:
	bts r12,0
LB_29945:
	ret
NS_E_29964:
; 	|» { 0' 1' }
NS_E_RDI_29964:
MTC_LB_29965:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29966
; _emt_mov_ptn_to_ptn:{| 110.. |},0' ⊢ °0◂{ { 2' 3' } 4' }
; 0' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_29967
	bt QWORD [rdi],0
	jc LB_29968
	btr r12,5
	clc
	jmp LB_29969
LB_29968:
	bts r12,5
	stc
LB_29969:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29967:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_29978
	btr r12,6
	clc
	jmp LB_29979
LB_29978:
	bts r12,6
	stc
LB_29979:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_29972
	btr r12,4
	clc
	jmp LB_29973
LB_29972:
	bts r12,4
	stc
LB_29973:
	mov r8,r10
	bt r12,4
	jc LB_29970
	btr r12,2
	jmp LB_29971
LB_29970:
	bts r12,2
LB_29971:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_29976
	btr r12,4
	clc
	jmp LB_29977
LB_29976:
	bts r12,4
	stc
LB_29977:
	mov r9,r10
	bt r12,4
	jc LB_29974
	btr r12,3
	jmp LB_29975
LB_29974:
	bts r12,3
LB_29975:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_29982
	btr r12,6
	clc
	jmp LB_29983
LB_29982:
	bts r12,6
	stc
LB_29983:
	mov r10,rcx
	bt r12,6
	jc LB_29980
	btr r12,4
	jmp LB_29981
LB_29980:
	bts r12,4
LB_29981:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_29984:
	cmp r15,0
	jz LB_29985
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29984
LB_29985:
MTC_LB_29986:
	mov r15,0
	mov rdi,r14
	mov rsi,r8
	bt r12,1
	call eq
	jnz MTC_LB_29987
LB_29988:
	cmp r15,0
	jz LB_29989
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29988
LB_29989:
MTC_LB_29990:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29991
; _emt_mov_ptn_to_ptn:{| 011110.. |},3' ⊢ °0◂0'
; 3' ⊢ °0◂0'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_29992
	bt QWORD [rdi],0
	jc LB_29993
	btr r12,5
	clc
	jmp LB_29994
LB_29993:
	bts r12,5
	stc
LB_29994:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_29992:
	mov r11,rdi
	mov r13,r11
	bt r12,5
	jc LB_29995
	btr r12,0
	jmp LB_29996
LB_29995:
	bts r12,0
LB_29996:
LB_29997:
	cmp r15,0
	jz LB_29998
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29997
LB_29998:
; _emt_mov_ptn_to_ptn:{| 111010.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_29999
	btr r12,3
	jmp LB_30000
LB_29999:
	bts r12,3
LB_30000:
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
	mov rdi,r9
	bt r12,3
	jc LB_30009
	btr r12,5
	clc
	jmp LB_30010
LB_30009:
	bts r12,5
	stc
LB_30010:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_30007
	btr r12,4
	clc
	jmp LB_30008
LB_30007:
	bts r12,4
	stc
LB_30008:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_30005
	btr r12,3
	clc
	jmp LB_30006
LB_30005:
	bts r12,3
	stc
LB_30006:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_30003
	btr r12,2
	clc
	jmp LB_30004
LB_30003:
	bts r12,2
	stc
LB_30004:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_30001
	btr r12,1
	clc
	jmp LB_30002
LB_30001:
	bts r12,1
	stc
LB_30002:
	add rsp,40
; _some %_29952 ⊢ %_29954 : %_29954
 ; {>  %_29948~2':t12673'(-1) %_29953~5':t12681'(-1) %_29950~4':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29947~1':t12673'(-1) %_29952~3':t12681'(-1) }
; _some 3' ⊢ °0◂3'
; _cns { { %_29948 %_29954 } %_29950 } ⊢ %_29955 : %_29955
 ; {>  %_29948~2':t12673'(-1) %_29954~°0◂3':(_opn)◂(t12681'(-1)) %_29953~5':t12681'(-1) %_29950~4':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29947~1':t12673'(-1) }
; _cns { { 2' °0◂3' } 4' } ⊢ °0◂{ { 2' °0◂3' } 4' }
; _some %_29953 ⊢ %_29956 : %_29956
 ; {>  %_29955~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29953~5':t12681'(-1) %_29947~1':t12673'(-1) }
; _some 5' ⊢ °0◂5'
; ∎ { %_29955 %_29947 %_29956 }
 ; {>  %_29955~°0◂{ { 2' °0◂3' } 4' }:(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29956~°0◂5':(_opn)◂(t12681'(-1)) %_29947~1':t12673'(-1) }
; 	∎ { °0◂{ { 2' °0◂3' } 4' } 1' °0◂5' }
; _emt_mov_ptn_to_ptn:{| 0111110.. |},{ °0◂{ { 2' °0◂3' } 4' } 1' °0◂5' } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r8
	bt r12,2
	jc LB_30017
	btr r12,7
	jmp LB_30018
LB_30017:
	bts r12,7
LB_30018:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_30015
	btr QWORD [rdi],0
	jmp LB_30016
LB_30015:
	bts QWORD [rdi],0
LB_30016:
	mov rdx,r9
	bt r12,3
	jc LB_30023
	btr r12,7
	jmp LB_30024
LB_30023:
	bts r12,7
LB_30024:
	mov rsi,1
	bt r12,7
	jc LB_30021
	mov rsi,0
	bt rdx,0
	jc LB_30021
	jmp LB_30022
LB_30021:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_30022:
	mov rax,0x0000_0000_0000_0001
	or rdx,rax
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_30019
	btr QWORD [rdi],1
	jmp LB_30020
LB_30019:
	bts QWORD [rdi],1
LB_30020:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_30013
	btr QWORD [rdi],0
	jmp LB_30014
LB_30013:
	bts QWORD [rdi],0
LB_30014:
	mov rcx,r10
	bt r12,4
	jc LB_30027
	btr r12,6
	jmp LB_30028
LB_30027:
	bts r12,6
LB_30028:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_30025
	btr QWORD [rdi],1
	jmp LB_30026
LB_30025:
	bts QWORD [rdi],1
LB_30026:
	mov rsi,1
	bt r12,0
	jc LB_30011
	mov rsi,0
	bt r13,0
	jc LB_30011
	jmp LB_30012
LB_30011:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_30012:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov r8,r11
	bt r12,5
	jc LB_30031
	btr r12,2
	jmp LB_30032
LB_30031:
	bts r12,2
LB_30032:
	mov rsi,1
	bt r12,2
	jc LB_30029
	mov rsi,0
	bt r8,0
	jc LB_30029
	jmp LB_30030
LB_30029:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_30030:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	ret
MTC_LB_29991:
	mov r15,0
LB_30034:
	cmp r15,0
	jz LB_30035
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30034
LB_30035:
; _cns { { %_29948 %_29949 } %_29950 } ⊢ %_29957 : %_29957
 ; {>  %_29948~2':t12673'(-1) %_29950~4':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29947~1':t12673'(-1) %_29949~3':(_opn)◂(t12681'(-1)) }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _none {  } ⊢ %_29958 : %_29958
 ; {>  %_29947~1':t12673'(-1) %_29957~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_29957 %_29947 %_29958 }
 ; {>  %_29958~°1◂{  }:(_opn)◂(t12667'(0)) %_29947~1':t12673'(-1) %_29957~°0◂{ { 2' 3' } 4' }:(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) }
; 	∎ { °0◂{ { 2' 3' } 4' } 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 011110.. |},{ °0◂{ { 2' 3' } 4' } 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r8
	bt r12,2
	jc LB_30042
	btr r12,6
	jmp LB_30043
LB_30042:
	bts r12,6
LB_30043:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_30040
	btr QWORD [rdi],0
	jmp LB_30041
LB_30040:
	bts QWORD [rdi],0
LB_30041:
	mov rcx,r9
	bt r12,3
	jc LB_30046
	btr r12,6
	jmp LB_30047
LB_30046:
	bts r12,6
LB_30047:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_30044
	btr QWORD [rdi],1
	jmp LB_30045
LB_30044:
	bts QWORD [rdi],1
LB_30045:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_30038
	btr QWORD [rdi],0
	jmp LB_30039
LB_30038:
	bts QWORD [rdi],0
LB_30039:
	mov r11,r10
	bt r12,4
	jc LB_30050
	btr r12,5
	jmp LB_30051
LB_30050:
	bts r12,5
LB_30051:
	mov rdi,r13
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_30048
	btr QWORD [rdi],1
	jmp LB_30049
LB_30048:
	bts QWORD [rdi],1
LB_30049:
	mov rsi,1
	bt r12,0
	jc LB_30036
	mov rsi,0
	bt r13,0
	jc LB_30036
	jmp LB_30037
LB_30036:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_30037:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_30052
	mov rsi,0
	bt r8,0
	jc LB_30052
	jmp LB_30053
LB_30052:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_30053:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_30033:
MTC_LB_29987:
	mov r15,0
LB_30055:
	cmp r15,0
	jz LB_30056
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30055
LB_30056:
; _f29964 { %_29950 %_29947 } ⊢ { %_29959 %_29960 %_29961 } : { %_29959 %_29960 %_29961 }
 ; {>  %_29948~2':t12673'(-1) %_29950~4':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29947~1':t12673'(-1) %_29949~3':(_opn)◂(t12681'(-1)) }
; _f29964 { 4' 1' } ⊢ { 0' 1' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010010.. |},{ 4' 1' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,4
	jc LB_30061
	btr r12,0
	jmp LB_30062
LB_30061:
	bts r12,0
LB_30062:
	call NS_E_29964
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 4' }
	mov r10,r8
	bt r12,2
	jc LB_30063
	btr r12,4
	jmp LB_30064
LB_30063:
	bts r12,4
LB_30064:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_30059
	btr r12,3
	clc
	jmp LB_30060
LB_30059:
	bts r12,3
	stc
LB_30060:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_30057
	btr r12,2
	clc
	jmp LB_30058
LB_30057:
	bts r12,2
	stc
LB_30058:
	add rsp,24
; _cns { { %_29948 %_29949 } %_29959 } ⊢ %_29962 : %_29962
 ; {>  %_29948~2':t12673'(-1) %_29960~1':t12673'(-1) %_29961~4':(_opn)◂(t12681'(-1)) %_29959~0':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29949~3':(_opn)◂(t12681'(-1)) }
; _cns { { 2' 3' } 0' } ⊢ °0◂{ { 2' 3' } 0' }
; ∎ { %_29962 %_29960 %_29961 }
 ; {>  %_29962~°0◂{ { 2' 3' } 0' }:(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29960~1':t12673'(-1) %_29961~4':(_opn)◂(t12681'(-1)) }
; 	∎ { °0◂{ { 2' 3' } 0' } 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ °0◂{ { 2' 3' } 0' } 1' 4' } ⊢ { 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_30065
	btr r12,5
	jmp LB_30066
LB_30065:
	bts r12,5
LB_30066:
	mov r8,r10
	bt r12,4
	jc LB_30067
	btr r12,2
	jmp LB_30068
LB_30067:
	bts r12,2
LB_30068:
	mov r10,r13
	bt r12,0
	jc LB_30069
	btr r12,4
	jmp LB_30070
LB_30069:
	bts r12,4
LB_30070:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdx,r11
	bt r12,5
	jc LB_30077
	btr r12,7
	jmp LB_30078
LB_30077:
	bts r12,7
LB_30078:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_30075
	btr QWORD [rdi],0
	jmp LB_30076
LB_30075:
	bts QWORD [rdi],0
LB_30076:
	mov rdx,r9
	bt r12,3
	jc LB_30081
	btr r12,7
	jmp LB_30082
LB_30081:
	bts r12,7
LB_30082:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_30079
	btr QWORD [rdi],1
	jmp LB_30080
LB_30079:
	bts QWORD [rdi],1
LB_30080:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_30073
	btr QWORD [rdi],0
	jmp LB_30074
LB_30073:
	bts QWORD [rdi],0
LB_30074:
	mov rcx,r10
	bt r12,4
	jc LB_30085
	btr r12,6
	jmp LB_30086
LB_30085:
	bts r12,6
LB_30086:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_30083
	btr QWORD [rdi],1
	jmp LB_30084
LB_30083:
	bts QWORD [rdi],1
LB_30084:
	mov rsi,1
	bt r12,0
	jc LB_30071
	mov rsi,0
	bt r13,0
	jc LB_30071
	jmp LB_30072
LB_30071:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_30072:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	ret
MTC_LB_30054:
MTC_LB_29966:
	mov r15,0
LB_30088:
	cmp r15,0
	jz LB_30089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30088
LB_30089:
; _none {  } ⊢ %_29963 : %_29963
 ; {>  %_29946~0':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29947~1':t12673'(-1) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_29946 %_29947 %_29963 }
 ; {>  %_29946~0':(_lst)◂({ t12673'(-1) (_opn)◂(t12681'(-1)) }) %_29963~°1◂{  }:(_opn)◂(t12678'(0)) %_29947~1':t12673'(-1) }
; 	∎ { 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' °1◂{  } } ⊢ { 0' 1' 2' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_30090
	mov rsi,0
	bt r8,0
	jc LB_30090
	jmp LB_30091
LB_30090:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_30091:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	ret
MTC_LB_30087:
NS_E_30092:
NS_E_RDI_30092:
NS_E_30092_ETR_TBL:
NS_E_30092_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_30133
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_30133
	jmp LB_30134
LB_30133:
	jmp LB_30123
LB_30134:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_30093_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30139
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30139:
	jmp LB_30123
LB_30138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30126
	btr r12,1
	clc
	jmp LB_30127
LB_30126:
	bts r12,1
	stc
LB_30127:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30124
	btr r12,0
	clc
	jmp LB_30125
LB_30124:
	bts r12,0
	stc
LB_30125:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30120
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_30141
	btr r12,2
	jmp LB_30142
LB_30141:
	bts r12,2
LB_30142:
	mov r13,r14
	bt r12,1
	jc LB_30143
	btr r12,0
	jmp LB_30144
LB_30143:
	bts r12,0
LB_30144:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f29936 %_30095 ⊢ %_30096 : %_30096
 ; {>  %_30095~0':(_lst)◂(_r64) }
; _f29936 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_29936
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_30096 ⊢ %_30097 : %_30097
 ; {>  %_30096~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_30097
 ; {>  %_30097~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30118
	btr r12,3
	jmp LB_30119
LB_30118:
	bts r12,3
LB_30119:
	mov r8,0
	bts r12,2
	ret
LB_30120:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30122
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30121
LB_30122:
	add rsp,8
	ret
LB_30123:
	add rsp,32
	pop r14
LB_30121:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30093:
NS_E_RDI_30093:
NS_E_30093_ETR_TBL:
NS_E_30093_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_30170
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_30170
	jmp LB_30171
LB_30170:
	jmp LB_30158
LB_30171:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_30094_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30175
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30176
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30176:
	jmp LB_30158
LB_30175:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_30093_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30181
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30182
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30182:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30183
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30183:
	jmp LB_30158
LB_30181:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30163
	btr r12,2
	clc
	jmp LB_30164
LB_30163:
	bts r12,2
	stc
LB_30164:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30161
	btr r12,1
	clc
	jmp LB_30162
LB_30161:
	bts r12,1
	stc
LB_30162:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30159
	btr r12,0
	clc
	jmp LB_30160
LB_30159:
	bts r12,0
	stc
LB_30160:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_30155
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_30185
	btr r12,3
	jmp LB_30186
LB_30185:
	bts r12,3
LB_30186:
	mov r14,r8
	bt r12,2
	jc LB_30187
	btr r12,1
	jmp LB_30188
LB_30187:
	bts r12,1
LB_30188:
	mov r8,r13
	bt r12,0
	jc LB_30189
	btr r12,2
	jmp LB_30190
LB_30189:
	bts r12,2
LB_30190:
	mov r13,r9
	bt r12,3
	jc LB_30191
	btr r12,0
	jmp LB_30192
LB_30191:
	bts r12,0
LB_30192:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_30098 %_30099 } ⊢ %_30100 : %_30100
 ; {>  %_30098~0':_r64 %_30099~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_30100 ⊢ %_30101 : %_30101
 ; {>  %_30100~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_30101
 ; {>  %_30101~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_30149
	btr r12,2
	jmp LB_30150
LB_30149:
	bts r12,2
LB_30150:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_30147
	btr QWORD [rdi],0
	jmp LB_30148
LB_30147:
	bts QWORD [rdi],0
LB_30148:
	mov r8,r14
	bt r12,1
	jc LB_30153
	btr r12,2
	jmp LB_30154
LB_30153:
	bts r12,2
LB_30154:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_30151
	btr QWORD [rdi],1
	jmp LB_30152
LB_30151:
	bts QWORD [rdi],1
LB_30152:
	mov rsi,1
	bt r12,3
	jc LB_30145
	mov rsi,0
	bt r9,0
	jc LB_30145
	jmp LB_30146
LB_30145:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_30146:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30155:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30157
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30156
LB_30157:
	add rsp,8
	ret
LB_30158:
	add rsp,48
	pop r14
LB_30156:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_30206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_30206
	jmp LB_30207
LB_30206:
	jmp LB_30198
LB_30207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30199
	btr r12,0
	clc
	jmp LB_30200
LB_30199:
	bts r12,0
	stc
LB_30200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30195
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_30102 : %_30102
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_30102 ⊢ %_30103 : %_30103
 ; {>  %_30102~°1◂{  }:(_lst)◂(t12730'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_30103
 ; {>  %_30103~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12733'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_30193
	mov rsi,0
	bt r9,0
	jc LB_30193
	jmp LB_30194
LB_30193:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_30194:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30197
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30196
LB_30197:
	add rsp,8
	ret
LB_30198:
	add rsp,16
	pop r14
LB_30196:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_29814_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30229
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30221
LB_30229:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_30093_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30234
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30235
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30235:
	jmp LB_30221
LB_30234:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30224
	btr r12,1
	clc
	jmp LB_30225
LB_30224:
	bts r12,1
	stc
LB_30225:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30222
	btr r12,0
	clc
	jmp LB_30223
LB_30222:
	bts r12,0
	stc
LB_30223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30218
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_30104 %_30105 } ⊢ %_30106 : %_30106
 ; {>  %_30105~1':(_lst)◂(_r64) %_30104~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_30106 ⊢ %_30107 : %_30107
 ; {>  %_30106~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_30107
 ; {>  %_30107~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_30212
	btr r12,2
	jmp LB_30213
LB_30212:
	bts r12,2
LB_30213:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_30210
	btr QWORD [rdi],0
	jmp LB_30211
LB_30210:
	bts QWORD [rdi],0
LB_30211:
	mov r8,r14
	bt r12,1
	jc LB_30216
	btr r12,2
	jmp LB_30217
LB_30216:
	bts r12,2
LB_30217:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_30214
	btr QWORD [rdi],1
	jmp LB_30215
LB_30214:
	bts QWORD [rdi],1
LB_30215:
	mov rsi,1
	bt r12,3
	jc LB_30208
	mov rsi,0
	bt r9,0
	jc LB_30208
	jmp LB_30209
LB_30208:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_30209:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30218:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30220
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30219
LB_30220:
	add rsp,8
	ret
LB_30221:
	add rsp,32
	pop r14
LB_30219:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30094:
NS_E_RDI_30094:
NS_E_30094_ETR_TBL:
NS_E_30094_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_30250
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_30250
	jmp LB_30251
LB_30250:
	jmp LB_30242
LB_30251:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30243
	btr r12,0
	clc
	jmp LB_30244
LB_30243:
	bts r12,0
	stc
LB_30244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30239
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_30108 : %_30108
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_30108
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_30108 ⊢ %_30109 : %_30109
 ; {>  %_30108~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30109
 ; {>  %_30109~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30237
	btr r12,3
	jmp LB_30238
LB_30237:
	bts r12,3
LB_30238:
	mov r8,0
	bts r12,2
	ret
LB_30239:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30241
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30240
LB_30241:
	add rsp,8
	ret
LB_30242:
	add rsp,16
	pop r14
LB_30240:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_30265
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_30265
	jmp LB_30266
LB_30265:
	jmp LB_30257
LB_30266:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30258
	btr r12,0
	clc
	jmp LB_30259
LB_30258:
	bts r12,0
	stc
LB_30259:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30254
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_30110 : %_30110
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_30110
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_30110 ⊢ %_30111 : %_30111
 ; {>  %_30110~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30111
 ; {>  %_30111~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30252
	btr r12,3
	jmp LB_30253
LB_30252:
	bts r12,3
LB_30253:
	mov r8,0
	bts r12,2
	ret
LB_30254:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30256
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30255
LB_30256:
	add rsp,8
	ret
LB_30257:
	add rsp,16
	pop r14
LB_30255:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_30280
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_30280
	jmp LB_30281
LB_30280:
	jmp LB_30272
LB_30281:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30273
	btr r12,0
	clc
	jmp LB_30274
LB_30273:
	bts r12,0
	stc
LB_30274:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30269
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_30112 : %_30112
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_30112
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_30112 ⊢ %_30113 : %_30113
 ; {>  %_30112~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30113
 ; {>  %_30113~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30267
	btr r12,3
	jmp LB_30268
LB_30267:
	bts r12,3
LB_30268:
	mov r8,0
	bts r12,2
	ret
LB_30269:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30271
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30270
LB_30271:
	add rsp,8
	ret
LB_30272:
	add rsp,16
	pop r14
LB_30270:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_30295
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_30295
	jmp LB_30296
LB_30295:
	jmp LB_30287
LB_30296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30288
	btr r12,0
	clc
	jmp LB_30289
LB_30288:
	bts r12,0
	stc
LB_30289:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30284
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_30114 : %_30114
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_30114
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_30114 ⊢ %_30115 : %_30115
 ; {>  %_30114~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30115
 ; {>  %_30115~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30282
	btr r12,3
	jmp LB_30283
LB_30282:
	bts r12,3
LB_30283:
	mov r8,0
	bts r12,2
	ret
LB_30284:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30286
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30285
LB_30286:
	add rsp,8
	ret
LB_30287:
	add rsp,16
	pop r14
LB_30285:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_30310
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_30310
	jmp LB_30311
LB_30310:
	jmp LB_30302
LB_30311:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30303
	btr r12,0
	clc
	jmp LB_30304
LB_30303:
	bts r12,0
	stc
LB_30304:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30299
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_30116 : %_30116
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_30116
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_30116 ⊢ %_30117 : %_30117
 ; {>  %_30116~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30117
 ; {>  %_30117~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30297
	btr r12,3
	jmp LB_30298
LB_30297:
	bts r12,3
LB_30298:
	mov r8,0
	bts r12,2
	ret
LB_30299:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30301
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30300
LB_30301:
	add rsp,8
	ret
LB_30302:
	add rsp,16
	pop r14
LB_30300:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30312:
NS_E_RDI_30312:
NS_E_30312_ETR_TBL:
NS_E_30312_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_29814_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30351
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30345
LB_30351:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30346
	btr r12,0
	clc
	jmp LB_30347
LB_30346:
	bts r12,0
	stc
LB_30347:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30342
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_30314 : %_30314
 ; {>  %_30313~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_30314
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_30315 : %_30315
 ; {>  %_30314~1':_r64 %_30313~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_30315
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_30313 %_30314 } ⊢ { %_30316 %_30317 %_30318 } : { %_30316 %_30317 %_30318 }
 ; {>  %_30314~1':_r64 %_30315~2':_r64 %_30313~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_30315 %_30316 } ⊢ { %_30319 %_30320 %_30321 } : { %_30319 %_30320 %_30321 }
 ; {>  %_30315~2':_r64 %_30316~0':_r64 %_30318~3':_r64 %_30317~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_30324:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_30325
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_30325
LB_30326:
	cmp r15,0
	jz LB_30327
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30326
LB_30327:
; _some %_30320 ⊢ %_30322 : %_30322
 ; {>  %_30319~2':_r64 %_30318~3':_r64 %_30317~1':_r64 %_30320~0':_r64 %_30321~4':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30322
 ; {>  %_30319~2':_r64 %_30322~°0◂0':(_opn)◂(_r64) %_30318~3':_r64 %_30317~1':_r64 %_30321~4':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_30328
	mov rdi,r8
	call dlt
LB_30328:
	bt r12,3
	jc LB_30329
	mov rdi,r9
	call dlt
LB_30329:
	bt r12,1
	jc LB_30330
	mov rdi,r14
	call dlt
LB_30330:
	bt r12,4
	jc LB_30331
	mov rdi,r10
	call dlt
LB_30331:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30332
	btr r12,3
	jmp LB_30333
LB_30332:
	bts r12,3
LB_30333:
	mov r8,0
	bts r12,2
	ret
MTC_LB_30325:
	mov r15,0
LB_30335:
	cmp r15,0
	jz LB_30336
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30335
LB_30336:
; _none {  } ⊢ %_30323 : %_30323
 ; {>  %_30319~2':_r64 %_30318~3':_r64 %_30317~1':_r64 %_30320~0':_r64 %_30321~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_30323
 ; {>  %_30319~2':_r64 %_30318~3':_r64 %_30317~1':_r64 %_30323~°1◂{  }:(_opn)◂(t12809'(0)) %_30320~0':_r64 %_30321~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_30337
	mov rdi,r8
	call dlt
LB_30337:
	bt r12,3
	jc LB_30338
	mov rdi,r9
	call dlt
LB_30338:
	bt r12,1
	jc LB_30339
	mov rdi,r14
	call dlt
LB_30339:
	bt r12,0
	jc LB_30340
	mov rdi,r13
	call dlt
LB_30340:
	bt r12,4
	jc LB_30341
	mov rdi,r10
	call dlt
LB_30341:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_30334:
LB_30342:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30344
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30343
LB_30344:
	add rsp,8
	ret
LB_30345:
	add rsp,16
	pop r14
LB_30343:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30353:
NS_E_RDI_30353:
NS_E_30353_ETR_TBL:
NS_E_30353_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_29814_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30392
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30386
LB_30392:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30387
	btr r12,0
	clc
	jmp LB_30388
LB_30387:
	bts r12,0
	stc
LB_30388:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30383
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_30355 : %_30355
 ; {>  %_30354~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_30355
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_30356 : %_30356
 ; {>  %_30354~0':_r64 %_30355~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_30356
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_30354 %_30355 } ⊢ { %_30357 %_30358 %_30359 } : { %_30357 %_30358 %_30359 }
 ; {>  %_30356~2':_r64 %_30354~0':_r64 %_30355~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_30356 %_30357 } ⊢ { %_30360 %_30361 %_30362 } : { %_30360 %_30361 %_30362 }
 ; {>  %_30356~2':_r64 %_30357~0':_r64 %_30359~3':_r64 %_30358~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_30365:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_30366
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_30366
LB_30367:
	cmp r15,0
	jz LB_30368
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30367
LB_30368:
; _some %_30361 ⊢ %_30363 : %_30363
 ; {>  %_30360~2':_r64 %_30362~4':_r64 %_30361~0':_r64 %_30359~3':_r64 %_30358~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30363
 ; {>  %_30363~°0◂0':(_opn)◂(_r64) %_30360~2':_r64 %_30362~4':_r64 %_30359~3':_r64 %_30358~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_30369
	mov rdi,r8
	call dlt
LB_30369:
	bt r12,4
	jc LB_30370
	mov rdi,r10
	call dlt
LB_30370:
	bt r12,3
	jc LB_30371
	mov rdi,r9
	call dlt
LB_30371:
	bt r12,1
	jc LB_30372
	mov rdi,r14
	call dlt
LB_30372:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30373
	btr r12,3
	jmp LB_30374
LB_30373:
	bts r12,3
LB_30374:
	mov r8,0
	bts r12,2
	ret
MTC_LB_30366:
	mov r15,0
LB_30376:
	cmp r15,0
	jz LB_30377
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30376
LB_30377:
; _none {  } ⊢ %_30364 : %_30364
 ; {>  %_30360~2':_r64 %_30362~4':_r64 %_30361~0':_r64 %_30359~3':_r64 %_30358~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_30364
 ; {>  %_30360~2':_r64 %_30362~4':_r64 %_30364~°1◂{  }:(_opn)◂(t12836'(0)) %_30361~0':_r64 %_30359~3':_r64 %_30358~1':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_30378
	mov rdi,r8
	call dlt
LB_30378:
	bt r12,4
	jc LB_30379
	mov rdi,r10
	call dlt
LB_30379:
	bt r12,0
	jc LB_30380
	mov rdi,r13
	call dlt
LB_30380:
	bt r12,3
	jc LB_30381
	mov rdi,r9
	call dlt
LB_30381:
	bt r12,1
	jc LB_30382
	mov rdi,r14
	call dlt
LB_30382:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_30375:
LB_30383:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30385
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30384
LB_30385:
	add rsp,8
	ret
LB_30386:
	add rsp,16
	pop r14
LB_30384:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30394:
NS_E_RDI_30394:
NS_E_30394_ETR_TBL:
NS_E_30394_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_29814_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30433
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30427
LB_30433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30428
	btr r12,0
	clc
	jmp LB_30429
LB_30428:
	bts r12,0
	stc
LB_30429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30424
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_30396 : %_30396
 ; {>  %_30395~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_30396
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_30397 : %_30397
 ; {>  %_30395~0':_r64 %_30396~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_30397
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_30395 %_30396 } ⊢ { %_30398 %_30399 %_30400 } : { %_30398 %_30399 %_30400 }
 ; {>  %_30395~0':_r64 %_30397~2':_r64 %_30396~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_30397 %_30398 } ⊢ { %_30401 %_30402 %_30403 } : { %_30401 %_30402 %_30403 }
 ; {>  %_30398~0':_r64 %_30400~3':_r64 %_30399~1':_r64 %_30397~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_30406:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_30407
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_30407
LB_30408:
	cmp r15,0
	jz LB_30409
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30408
LB_30409:
; _some %_30402 ⊢ %_30404 : %_30404
 ; {>  %_30401~2':_r64 %_30402~0':_r64 %_30400~3':_r64 %_30399~1':_r64 %_30403~4':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30404
 ; {>  %_30404~°0◂0':(_opn)◂(_r64) %_30401~2':_r64 %_30400~3':_r64 %_30399~1':_r64 %_30403~4':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_30410
	mov rdi,r8
	call dlt
LB_30410:
	bt r12,3
	jc LB_30411
	mov rdi,r9
	call dlt
LB_30411:
	bt r12,1
	jc LB_30412
	mov rdi,r14
	call dlt
LB_30412:
	bt r12,4
	jc LB_30413
	mov rdi,r10
	call dlt
LB_30413:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30414
	btr r12,3
	jmp LB_30415
LB_30414:
	bts r12,3
LB_30415:
	mov r8,0
	bts r12,2
	ret
MTC_LB_30407:
	mov r15,0
LB_30417:
	cmp r15,0
	jz LB_30418
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30417
LB_30418:
; _none {  } ⊢ %_30405 : %_30405
 ; {>  %_30401~2':_r64 %_30402~0':_r64 %_30400~3':_r64 %_30399~1':_r64 %_30403~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_30405
 ; {>  %_30405~°1◂{  }:(_opn)◂(t12863'(0)) %_30401~2':_r64 %_30402~0':_r64 %_30400~3':_r64 %_30399~1':_r64 %_30403~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_30419
	mov rdi,r8
	call dlt
LB_30419:
	bt r12,0
	jc LB_30420
	mov rdi,r13
	call dlt
LB_30420:
	bt r12,3
	jc LB_30421
	mov rdi,r9
	call dlt
LB_30421:
	bt r12,1
	jc LB_30422
	mov rdi,r14
	call dlt
LB_30422:
	bt r12,4
	jc LB_30423
	mov rdi,r10
	call dlt
LB_30423:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_30416:
LB_30424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30425
LB_30426:
	add rsp,8
	ret
LB_30427:
	add rsp,16
	pop r14
LB_30425:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30435:
NS_E_RDI_30435:
NS_E_30435_ETR_TBL:
NS_E_30435_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_30394_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30451
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30445
LB_30451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30446
	btr r12,0
	clc
	jmp LB_30447
LB_30446:
	bts r12,0
	stc
LB_30447:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30442
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_30436 ⊢ %_30437 : %_30437
 ; {>  %_30436~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30437
 ; {>  %_30437~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30440
	btr r12,3
	jmp LB_30441
LB_30440:
	bts r12,3
LB_30441:
	mov r8,0
	bts r12,2
	ret
LB_30442:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30444
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30443
LB_30444:
	add rsp,8
	ret
LB_30445:
	add rsp,16
	pop r14
LB_30443:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_30353_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30464
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30458
LB_30464:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30459
	btr r12,0
	clc
	jmp LB_30460
LB_30459:
	bts r12,0
	stc
LB_30460:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30455
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_30438 ⊢ %_30439 : %_30439
 ; {>  %_30438~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30439
 ; {>  %_30439~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30453
	btr r12,3
	jmp LB_30454
LB_30453:
	bts r12,3
LB_30454:
	mov r8,0
	bts r12,2
	ret
LB_30455:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30457
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30456
LB_30457:
	add rsp,8
	ret
LB_30458:
	add rsp,16
	pop r14
LB_30456:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30466:
NS_E_RDI_30466:
NS_E_30466_ETR_TBL:
NS_E_30466_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_30435_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30511
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30503
LB_30511:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_30467_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30516
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30517:
	jmp LB_30503
LB_30516:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30506
	btr r12,1
	clc
	jmp LB_30507
LB_30506:
	bts r12,1
	stc
LB_30507:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30504
	btr r12,0
	clc
	jmp LB_30505
LB_30504:
	bts r12,0
	stc
LB_30505:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30500
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_30469 %_30470 } ⊢ %_30471 : %_30471
 ; {>  %_30469~0':_r64 %_30470~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f29936 %_30471 ⊢ %_30472 : %_30472
 ; {>  %_30471~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f29936 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_30486
	btr r12,2
	jmp LB_30487
LB_30486:
	bts r12,2
LB_30487:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_30492
	btr r12,3
	jmp LB_30493
LB_30492:
	bts r12,3
LB_30493:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_30490
	btr QWORD [rdi],0
	jmp LB_30491
LB_30490:
	bts QWORD [rdi],0
LB_30491:
	mov r9,r14
	bt r12,1
	jc LB_30496
	btr r12,3
	jmp LB_30497
LB_30496:
	bts r12,3
LB_30497:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_30494
	btr QWORD [rdi],1
	jmp LB_30495
LB_30494:
	bts QWORD [rdi],1
LB_30495:
	mov rsi,1
	bt r12,0
	jc LB_30488
	mov rsi,0
	bt r13,0
	jc LB_30488
	jmp LB_30489
LB_30488:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_30489:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_29936
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_30472 ⊢ %_30473 : %_30473
 ; {>  %_30472~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_30473
 ; {>  %_30473~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30498
	btr r12,3
	jmp LB_30499
LB_30498:
	bts r12,3
LB_30499:
	mov r8,0
	bts r12,2
	ret
LB_30500:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30502
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30501
LB_30502:
	add rsp,8
	ret
LB_30503:
	add rsp,32
	pop r14
LB_30501:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30467:
NS_E_RDI_30467:
NS_E_30467_ETR_TBL:
NS_E_30467_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_30468_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30540
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30532
LB_30540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_30467_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30545
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30546
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30546:
	jmp LB_30532
LB_30545:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30535
	btr r12,1
	clc
	jmp LB_30536
LB_30535:
	bts r12,1
	stc
LB_30536:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30533
	btr r12,0
	clc
	jmp LB_30534
LB_30533:
	bts r12,0
	stc
LB_30534:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30529
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_30474 %_30475 } ⊢ %_30476 : %_30476
 ; {>  %_30474~0':_r64 %_30475~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_30476 ⊢ %_30477 : %_30477
 ; {>  %_30476~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_30477
 ; {>  %_30477~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_30523
	btr r12,2
	jmp LB_30524
LB_30523:
	bts r12,2
LB_30524:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_30521
	btr QWORD [rdi],0
	jmp LB_30522
LB_30521:
	bts QWORD [rdi],0
LB_30522:
	mov r8,r14
	bt r12,1
	jc LB_30527
	btr r12,2
	jmp LB_30528
LB_30527:
	bts r12,2
LB_30528:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_30525
	btr QWORD [rdi],1
	jmp LB_30526
LB_30525:
	bts QWORD [rdi],1
LB_30526:
	mov rsi,1
	bt r12,3
	jc LB_30519
	mov rsi,0
	bt r9,0
	jc LB_30519
	jmp LB_30520
LB_30519:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_30520:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30529:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30531
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30530
LB_30531:
	add rsp,8
	ret
LB_30532:
	add rsp,32
	pop r14
LB_30530:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_30550
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_30478 : %_30478
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_30478 ⊢ %_30479 : %_30479
 ; {>  %_30478~°1◂{  }:(_lst)◂(t12907'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_30479
 ; {>  %_30479~°0◂°1◂{  }:(_opn)◂((_lst)◂(t12910'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_30548
	mov rsi,0
	bt r9,0
	jc LB_30548
	jmp LB_30549
LB_30548:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_30549:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30550:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30552
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30551
LB_30552:
	add rsp,8
	ret
LB_30553:
	add rsp,0
	pop r14
LB_30551:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30468:
NS_E_RDI_30468:
NS_E_30468_ETR_TBL:
NS_E_30468_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_30435_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30565
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30559
LB_30565:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30560
	btr r12,0
	clc
	jmp LB_30561
LB_30560:
	bts r12,0
	stc
LB_30561:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30556
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_30480 ⊢ %_30481 : %_30481
 ; {>  %_30480~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30481
 ; {>  %_30481~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30554
	btr r12,3
	jmp LB_30555
LB_30554:
	bts r12,3
LB_30555:
	mov r8,0
	bts r12,2
	ret
LB_30556:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30558
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30557
LB_30558:
	add rsp,8
	ret
LB_30559:
	add rsp,16
	pop r14
LB_30557:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_30312_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30578
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30572
LB_30578:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30573
	btr r12,0
	clc
	jmp LB_30574
LB_30573:
	bts r12,0
	stc
LB_30574:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30569
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_30482 ⊢ %_30483 : %_30483
 ; {>  %_30482~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30483
 ; {>  %_30483~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30567
	btr r12,3
	jmp LB_30568
LB_30567:
	bts r12,3
LB_30568:
	mov r8,0
	bts r12,2
	ret
LB_30569:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30571
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30570
LB_30571:
	add rsp,8
	ret
LB_30572:
	add rsp,16
	pop r14
LB_30570:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_30593
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_30593
	jmp LB_30594
LB_30593:
	jmp LB_30585
LB_30594:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30586
	btr r12,0
	clc
	jmp LB_30587
LB_30586:
	bts r12,0
	stc
LB_30587:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30582
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_30484 : %_30484
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_30484
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_30484 ⊢ %_30485 : %_30485
 ; {>  %_30484~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30485
 ; {>  %_30485~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30580
	btr r12,3
	jmp LB_30581
LB_30580:
	bts r12,3
LB_30581:
	mov r8,0
	bts r12,2
	ret
LB_30582:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30584
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30583
LB_30584:
	add rsp,8
	ret
LB_30585:
	add rsp,16
	pop r14
LB_30583:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30595:
NS_E_RDI_30595:
NS_E_30595_ETR_TBL:
NS_E_30595_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_30616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_30616
	jmp LB_30617
LB_30616:
	jmp LB_30606
LB_30617:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_30467_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30621
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30622
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30622:
	jmp LB_30606
LB_30621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30609
	btr r12,1
	clc
	jmp LB_30610
LB_30609:
	bts r12,1
	stc
LB_30610:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30607
	btr r12,0
	clc
	jmp LB_30608
LB_30607:
	bts r12,0
	stc
LB_30608:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30603
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_30624
	btr r12,2
	jmp LB_30625
LB_30624:
	bts r12,2
LB_30625:
	mov r13,r14
	bt r12,1
	jc LB_30626
	btr r12,0
	jmp LB_30627
LB_30626:
	bts r12,0
LB_30627:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f29936 %_30596 ⊢ %_30597 : %_30597
 ; {>  %_30596~0':(_lst)◂(_r64) }
; _f29936 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_29936
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_30597 ⊢ %_30598 : %_30598
 ; {>  %_30597~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_30598
 ; {>  %_30598~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30601
	btr r12,3
	jmp LB_30602
LB_30601:
	bts r12,3
LB_30602:
	mov r8,0
	bts r12,2
	ret
LB_30603:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30605
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30604
LB_30605:
	add rsp,8
	ret
LB_30606:
	add rsp,32
	pop r14
LB_30604:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30639
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30633
LB_30639:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30634
	btr r12,0
	clc
	jmp LB_30635
LB_30634:
	bts r12,0
	stc
LB_30635:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30630
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_30599 ⊢ %_30600 : %_30600
 ; {>  %_30599~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_30600
 ; {>  %_30600~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30628
	btr r12,3
	jmp LB_30629
LB_30628:
	bts r12,3
LB_30629:
	mov r8,0
	bts r12,2
	ret
LB_30630:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30632
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_30631
LB_30632:
	add rsp,8
	ret
LB_30633:
	add rsp,16
	pop r14
LB_30631:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30652:
; 	|» 0'
NS_E_RDI_30652:
MTC_LB_30653:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30654
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30655
	bt QWORD [rdi],0
	jc LB_30656
	btr r12,3
	clc
	jmp LB_30657
LB_30656:
	bts r12,3
	stc
LB_30657:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30655:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_30660
	btr r12,4
	clc
	jmp LB_30661
LB_30660:
	bts r12,4
	stc
LB_30661:
	mov r14,r10
	bt r12,4
	jc LB_30658
	btr r12,1
	jmp LB_30659
LB_30658:
	bts r12,1
LB_30659:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_30664
	btr r12,4
	clc
	jmp LB_30665
LB_30664:
	bts r12,4
	stc
LB_30665:
	mov r8,r10
	bt r12,4
	jc LB_30662
	btr r12,2
	jmp LB_30663
LB_30662:
	bts r12,2
LB_30663:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_30666:
	cmp r15,0
	jz LB_30667
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30666
LB_30667:
; _f30652 %_30646 ⊢ %_30647 : %_30647
 ; {>  %_30645~1':_stg %_30646~2':_p30641 }
; _f30652 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_30670
	btr r12,0
	jmp LB_30671
LB_30670:
	bts r12,0
LB_30671:
	call NS_E_30652
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_30668
	btr r12,1
	clc
	jmp LB_30669
LB_30668:
	bts r12,1
	stc
LB_30669:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_30650
 ; {>  %_30650~2':_stg %_30649~0':_stg %_30648~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_30672
	mov rdi,r13
	call dlt
LB_30672:
	bt r12,1
	jc LB_30673
	mov rdi,r14
	call dlt
LB_30673:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_30674
	btr r12,0
	jmp LB_30675
LB_30674:
	bts r12,0
LB_30675:
	ret
MTC_LB_30654:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30676
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30677
	bt QWORD [rdi],0
	jc LB_30678
	btr r12,2
	clc
	jmp LB_30679
LB_30678:
	bts r12,2
	stc
LB_30679:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30677:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30680
	btr r12,1
	jmp LB_30681
LB_30680:
	bts r12,1
LB_30681:
LB_30682:
	cmp r15,0
	jz LB_30683
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30682
LB_30683:
; ∎ %_30651
 ; {>  %_30651~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30684
	btr r12,0
	jmp LB_30685
LB_30684:
	bts r12,0
LB_30685:
	ret
MTC_LB_30676:
NS_E_30787:
; 	|» 0'
NS_E_RDI_30787:
MTC_LB_30788:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30789
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30790
	bt QWORD [rdi],0
	jc LB_30791
	btr r12,2
	clc
	jmp LB_30792
LB_30791:
	bts r12,2
	stc
LB_30792:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30790:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30793
	btr r12,1
	jmp LB_30794
LB_30793:
	bts r12,1
LB_30794:
LB_30795:
	cmp r15,0
	jz LB_30796
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30795
LB_30796:
; 	» "??r" _ ⊢ 0' : %_30782
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_30782
 ; {>  %_30781~1':_r64 %_30782~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_30797
	mov rdi,r14
	call dlt
LB_30797:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30789:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30798
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30799
	bt QWORD [rdi],0
	jc LB_30800
	btr r12,2
	clc
	jmp LB_30801
LB_30800:
	bts r12,2
	stc
LB_30801:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30799:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30802
	btr r12,1
	jmp LB_30803
LB_30802:
	bts r12,1
LB_30803:
LB_30804:
	cmp r15,0
	jz LB_30805
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30804
LB_30805:
; 	» ".." _ ⊢ 0' : %_30784
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_30784
 ; {>  %_30783~1':_stg %_30784~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_30806
	mov rdi,r14
	call dlt
LB_30806:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30798:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_30807
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30808
	bt QWORD [rdi],0
	jc LB_30809
	btr r12,2
	clc
	jmp LB_30810
LB_30809:
	bts r12,2
	stc
LB_30810:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30808:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30811
	btr r12,1
	jmp LB_30812
LB_30811:
	bts r12,1
LB_30812:
LB_30813:
	cmp r15,0
	jz LB_30814
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30813
LB_30814:
; _f30652 %_30785 ⊢ %_30786 : %_30786
 ; {>  %_30785~1':_p30641 }
; _f30652 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30815
	btr r12,0
	jmp LB_30816
LB_30815:
	bts r12,0
LB_30816:
	call NS_E_30652
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_30786
 ; {>  %_30786~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30807:
NS_E_30857:
; 	|» 0'
NS_E_RDI_30857:
MTC_LB_30858:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30859
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30860
	bt QWORD [rdi],0
	jc LB_30861
	btr r12,3
	clc
	jmp LB_30862
LB_30861:
	bts r12,3
	stc
LB_30862:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30860:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_30865
	btr r12,4
	clc
	jmp LB_30866
LB_30865:
	bts r12,4
	stc
LB_30866:
	mov r14,r10
	bt r12,4
	jc LB_30863
	btr r12,1
	jmp LB_30864
LB_30863:
	bts r12,1
LB_30864:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_30869
	btr r12,4
	clc
	jmp LB_30870
LB_30869:
	bts r12,4
	stc
LB_30870:
	mov r8,r10
	bt r12,4
	jc LB_30867
	btr r12,2
	jmp LB_30868
LB_30867:
	bts r12,2
LB_30868:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_30871:
	cmp r15,0
	jz LB_30872
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30871
LB_30872:
; _f30847 %_30849 ⊢ %_30851 : %_30851
 ; {>  %_30849~1':(_p30686)◂((_p30694)◂(_stg)) %_30850~2':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _f30847 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30875
	btr r12,0
	jmp LB_30876
LB_30875:
	bts r12,0
LB_30876:
	call NS_E_30847
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_30873
	btr r12,2
	clc
	jmp LB_30874
LB_30873:
	bts r12,2
	stc
LB_30874:
	add rsp,16
; _f30857 %_30850 ⊢ %_30852 : %_30852
 ; {>  %_30851~0':_stg %_30850~2':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _f30857 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_30879
	btr r12,0
	jmp LB_30880
LB_30879:
	bts r12,0
LB_30880:
	call NS_E_30857
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_30881
	btr r12,1
	jmp LB_30882
LB_30881:
	bts r12,1
LB_30882:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_30877
	btr r12,0
	clc
	jmp LB_30878
LB_30877:
	bts r12,0
	stc
LB_30878:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_30855
 ; {>  %_30855~2':_stg %_30854~1':_stg %_30853~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_30883
	mov rdi,r14
	call dlt
LB_30883:
	bt r12,0
	jc LB_30884
	mov rdi,r13
	call dlt
LB_30884:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_30885
	btr r12,0
	jmp LB_30886
LB_30885:
	bts r12,0
LB_30886:
	ret
MTC_LB_30859:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30887
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30888
	bt QWORD [rdi],0
	jc LB_30889
	btr r12,1
	clc
	jmp LB_30890
LB_30889:
	bts r12,1
	stc
LB_30890:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30888:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_30891:
	cmp r15,0
	jz LB_30892
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30891
LB_30892:
; 	» "" _ ⊢ 0' : %_30856
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_30856
 ; {>  %_30856~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30887:
NS_E_30847:
; 	|» 0'
NS_E_RDI_30847:
MTC_LB_30893:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30894
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30895
	bt QWORD [rdi],0
	jc LB_30896
	btr r12,2
	clc
	jmp LB_30897
LB_30896:
	bts r12,2
	stc
LB_30897:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30895:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30898
	btr r12,1
	jmp LB_30899
LB_30898:
	bts r12,1
LB_30899:
LB_30900:
	cmp r15,0
	jz LB_30901
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30900
LB_30901:
; _f30857 %_30840 ⊢ %_30841 : %_30841
 ; {>  %_30840~1':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _f30857 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30902
	btr r12,0
	jmp LB_30903
LB_30902:
	bts r12,0
LB_30903:
	call NS_E_30857
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_30843
 ; {>  %_30842~0':_stg %_30843~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_30904
	mov rdi,r13
	call dlt
LB_30904:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30905
	btr r12,0
	jmp LB_30906
LB_30905:
	bts r12,0
LB_30906:
	ret
MTC_LB_30894:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30907
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30908
	bt QWORD [rdi],0
	jc LB_30909
	btr r12,2
	clc
	jmp LB_30910
LB_30909:
	bts r12,2
	stc
LB_30910:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30908:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30911
	btr r12,1
	jmp LB_30912
LB_30911:
	bts r12,1
LB_30912:
LB_30913:
	cmp r15,0
	jz LB_30914
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30913
LB_30914:
MTC_LB_30915:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30916
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_30917
	bt QWORD [rdi],0
	jc LB_30918
	btr r12,0
	clc
	jmp LB_30919
LB_30918:
	bts r12,0
	stc
LB_30919:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30917:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_30920:
	cmp r15,0
	jz LB_30921
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30920
LB_30921:
; 	» "_ " _ ⊢ 0' : %_30845
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_30845
 ; {>  %_30845~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30916:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30922
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_30923
	bt QWORD [rdi],0
	jc LB_30924
	btr r12,2
	clc
	jmp LB_30925
LB_30924:
	bts r12,2
	stc
LB_30925:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30923:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_30926
	btr r12,0
	jmp LB_30927
LB_30926:
	bts r12,0
LB_30927:
LB_30928:
	cmp r15,0
	jz LB_30929
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30928
LB_30929:
; ∎ %_30846
 ; {>  %_30846~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30922:
MTC_LB_30907:
NS_E_30838:
; 	|» 0'
NS_E_RDI_30838:
MTC_LB_30930:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30931
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30932
	bt QWORD [rdi],0
	jc LB_30933
	btr r12,3
	clc
	jmp LB_30934
LB_30933:
	bts r12,3
	stc
LB_30934:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30932:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_30937
	btr r12,4
	clc
	jmp LB_30938
LB_30937:
	bts r12,4
	stc
LB_30938:
	mov r14,r10
	bt r12,4
	jc LB_30935
	btr r12,1
	jmp LB_30936
LB_30935:
	bts r12,1
LB_30936:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_30941
	btr r12,4
	clc
	jmp LB_30942
LB_30941:
	bts r12,4
	stc
LB_30942:
	mov r8,r10
	bt r12,4
	jc LB_30939
	btr r12,2
	jmp LB_30940
LB_30939:
	bts r12,2
LB_30940:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_30943:
	cmp r15,0
	jz LB_30944
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30943
LB_30944:
; _f30828 %_30830 ⊢ %_30832 : %_30832
 ; {>  %_30830~1':(_p30686)◂((_p30693)◂(_stg)) %_30831~2':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30828 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30947
	btr r12,0
	jmp LB_30948
LB_30947:
	bts r12,0
LB_30948:
	call NS_E_30828
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_30945
	btr r12,2
	clc
	jmp LB_30946
LB_30945:
	bts r12,2
	stc
LB_30946:
	add rsp,16
; _f30838 %_30831 ⊢ %_30833 : %_30833
 ; {>  %_30832~0':_stg %_30831~2':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30838 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_30951
	btr r12,0
	jmp LB_30952
LB_30951:
	bts r12,0
LB_30952:
	call NS_E_30838
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_30953
	btr r12,1
	jmp LB_30954
LB_30953:
	bts r12,1
LB_30954:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_30949
	btr r12,0
	clc
	jmp LB_30950
LB_30949:
	bts r12,0
	stc
LB_30950:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_30836
 ; {>  %_30836~2':_stg %_30835~1':_stg %_30834~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_30955
	mov rdi,r14
	call dlt
LB_30955:
	bt r12,0
	jc LB_30956
	mov rdi,r13
	call dlt
LB_30956:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_30957
	btr r12,0
	jmp LB_30958
LB_30957:
	bts r12,0
LB_30958:
	ret
MTC_LB_30931:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30959
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30960
	bt QWORD [rdi],0
	jc LB_30961
	btr r12,1
	clc
	jmp LB_30962
LB_30961:
	bts r12,1
	stc
LB_30962:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30960:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_30963:
	cmp r15,0
	jz LB_30964
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30963
LB_30964:
; 	» "" _ ⊢ 0' : %_30837
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_30837
 ; {>  %_30837~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30959:
NS_E_30828:
; 	|» 0'
NS_E_RDI_30828:
MTC_LB_30965:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30966
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30967
	bt QWORD [rdi],0
	jc LB_30968
	btr r12,2
	clc
	jmp LB_30969
LB_30968:
	bts r12,2
	stc
LB_30969:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30967:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30970
	btr r12,1
	jmp LB_30971
LB_30970:
	bts r12,1
LB_30971:
LB_30972:
	cmp r15,0
	jz LB_30973
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30972
LB_30973:
; _f30838 %_30818 ⊢ %_30819 : %_30819
 ; {>  %_30818~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30838 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30974
	btr r12,0
	jmp LB_30975
LB_30974:
	bts r12,0
LB_30975:
	call NS_E_30838
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_30821
 ; {>  %_30821~1':_stg %_30820~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_30976
	mov rdi,r13
	call dlt
LB_30976:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30977
	btr r12,0
	jmp LB_30978
LB_30977:
	bts r12,0
LB_30978:
	ret
MTC_LB_30966:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30979
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_30980
	bt QWORD [rdi],0
	jc LB_30981
	btr r12,2
	clc
	jmp LB_30982
LB_30981:
	bts r12,2
	stc
LB_30982:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30980:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_30983
	btr r12,1
	jmp LB_30984
LB_30983:
	bts r12,1
LB_30984:
LB_30985:
	cmp r15,0
	jz LB_30986
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30985
LB_30986:
MTC_LB_30987:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30988
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂0'
; 1' ⊢ °0◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_30989
	bt QWORD [rdi],0
	jc LB_30990
	btr r12,2
	clc
	jmp LB_30991
LB_30990:
	bts r12,2
	stc
LB_30991:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_30989:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_30992
	btr r12,0
	jmp LB_30993
LB_30992:
	bts r12,0
LB_30993:
LB_30994:
	cmp r15,0
	jz LB_30995
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30994
LB_30995:
; _f30787 %_30823 ⊢ %_30824 : %_30824
 ; {>  %_30823~0':_p30689 }
; _f30787 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_30787
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; ∎ %_30826
 ; {>  %_30826~1':_stg %_30825~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_30996
	mov rdi,r13
	call dlt
LB_30996:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30997
	btr r12,0
	jmp LB_30998
LB_30997:
	bts r12,0
LB_30998:
	ret
MTC_LB_30988:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30999
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31000
	bt QWORD [rdi],0
	jc LB_31001
	btr r12,2
	clc
	jmp LB_31002
LB_31001:
	bts r12,2
	stc
LB_31002:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31000:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_31003
	btr r12,0
	jmp LB_31004
LB_31003:
	bts r12,0
LB_31004:
LB_31005:
	cmp r15,0
	jz LB_31006
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31005
LB_31006:
; ∎ %_30827
 ; {>  %_30827~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_30999:
MTC_LB_30979:
NS_E_31419:
; 	|» { 0' 1' }
NS_E_RDI_31419:
MTC_LB_31420:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31421
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' }
; 1' ⊢ °0◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31422
	bt QWORD [rdi],0
	jc LB_31423
	btr r12,5
	clc
	jmp LB_31424
LB_31423:
	bts r12,5
	stc
LB_31424:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31422:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_31427
	btr r12,6
	clc
	jmp LB_31428
LB_31427:
	bts r12,6
	stc
LB_31428:
	mov r8,rcx
	bt r12,6
	jc LB_31425
	btr r12,2
	jmp LB_31426
LB_31425:
	bts r12,2
LB_31426:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_31431
	btr r12,6
	clc
	jmp LB_31432
LB_31431:
	bts r12,6
	stc
LB_31432:
	mov r9,rcx
	bt r12,6
	jc LB_31429
	btr r12,3
	jmp LB_31430
LB_31429:
	bts r12,3
LB_31430:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_31435
	btr r12,6
	clc
	jmp LB_31436
LB_31435:
	bts r12,6
	stc
LB_31436:
	mov r10,rcx
	bt r12,6
	jc LB_31433
	btr r12,4
	jmp LB_31434
LB_31433:
	bts r12,4
LB_31434:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31437:
	cmp r15,0
	jz LB_31438
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31437
LB_31438:
; _f31419 { %_31380 %_31384 } ⊢ { %_31385 %_31386 } : { %_31385 %_31386 }
 ; {>  %_31384~4':_p30700 %_31383~3':_p30701 %_31380~0':_r64 %_31382~2':(_lst)◂(_p30702) }
; _f31419 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31443
	btr r12,1
	jmp LB_31444
LB_31443:
	bts r12,1
LB_31444:
	call NS_E_31419
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_31441
	btr r12,3
	clc
	jmp LB_31442
LB_31441:
	bts r12,3
	stc
LB_31442:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31439
	btr r12,2
	clc
	jmp LB_31440
LB_31439:
	bts r12,2
	stc
LB_31440:
	add rsp,24
MTC_LB_31445:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31446
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_31447
	bt QWORD [rdi],0
	jc LB_31448
	btr r12,5
	clc
	jmp LB_31449
LB_31448:
	bts r12,5
	stc
LB_31449:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31447:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_31450
	btr r12,4
	jmp LB_31451
LB_31450:
	bts r12,4
LB_31451:
LB_31452:
	cmp r15,0
	jz LB_31453
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31452
LB_31453:
; _f31419 { %_31385 %_31387 } ⊢ { %_31388 %_31389 } : { %_31388 %_31389 }
 ; {>  %_31385~0':_r64 %_31382~2':(_lst)◂(_p30702) %_31386~1':_stg %_31387~4':_p30700 }
; _f31419 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31458
	btr r12,1
	jmp LB_31459
LB_31458:
	bts r12,1
LB_31459:
	call NS_E_31419
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_31460
	btr r12,3
	jmp LB_31461
LB_31460:
	bts r12,3
LB_31461:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31456
	btr r12,2
	clc
	jmp LB_31457
LB_31456:
	bts r12,2
	stc
LB_31457:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_31454
	btr r12,1
	clc
	jmp LB_31455
LB_31454:
	bts r12,1
	stc
LB_31455:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31462:
	cmp rax,0
	jz LB_31463
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31462
LB_31463:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31390 %_31393 }
 ; {>  %_31391~1':_stg %_31392~3':_stg %_31390~0':_r64 %_31393~4':_stg %_31382~2':(_lst)◂(_p30702) }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_31464
	mov rdi,r14
	call dlt
LB_31464:
	bt r12,3
	jc LB_31465
	mov rdi,r9
	call dlt
LB_31465:
	bt r12,2
	jc LB_31466
	mov rdi,r8
	call dlt
LB_31466:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31467
	btr r12,1
	jmp LB_31468
LB_31467:
	bts r12,1
LB_31468:
	ret
MTC_LB_31446:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31469
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_31470
	bt QWORD [rdi],0
	jc LB_31471
	btr r12,5
	clc
	jmp LB_31472
LB_31471:
	bts r12,5
	stc
LB_31472:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31470:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_31473
	btr r12,4
	jmp LB_31474
LB_31473:
	bts r12,4
LB_31474:
LB_31475:
	cmp r15,0
	jz LB_31476
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31475
LB_31476:
; _f56 %_31385 ⊢ %_31395 : %_31395
 ; {>  %_31385~0':_r64 %_31394~4':_p30699 %_31382~2':(_lst)◂(_p30702) %_31386~1':_stg }
	add r13,1
; _f31343 { %_31395 %_31394 } ⊢ { %_31396 %_31397 } : { %_31396 %_31397 }
 ; {>  %_31395~0':_r64 %_31394~4':_p30699 %_31382~2':(_lst)◂(_p30702) %_31386~1':_stg }
; _f31343 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31481
	btr r12,1
	jmp LB_31482
LB_31481:
	bts r12,1
LB_31482:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_31483
	btr r12,3
	jmp LB_31484
LB_31483:
	bts r12,3
LB_31484:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31479
	btr r12,2
	clc
	jmp LB_31480
LB_31479:
	bts r12,2
	stc
LB_31480:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_31477
	btr r12,1
	clc
	jmp LB_31478
LB_31477:
	bts r12,1
	stc
LB_31478:
	add rsp,24
; _f55 %_31396 ⊢ %_31398 : %_31398
 ; {>  %_31396~0':_r64 %_31382~2':(_lst)◂(_p30702) %_31386~1':_stg %_31397~3':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31485:
	cmp rax,0
	jz LB_31486
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31485
LB_31486:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31399 %_31402 }
 ; {>  %_31401~3':_stg %_31400~1':_stg %_31402~4':_stg %_31382~2':(_lst)◂(_p30702) %_31399~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_31487
	mov rdi,r9
	call dlt
LB_31487:
	bt r12,1
	jc LB_31488
	mov rdi,r14
	call dlt
LB_31488:
	bt r12,2
	jc LB_31489
	mov rdi,r8
	call dlt
LB_31489:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31490
	btr r12,1
	jmp LB_31491
LB_31490:
	bts r12,1
LB_31491:
	ret
MTC_LB_31469:
MTC_LB_31421:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31492
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31493
	bt QWORD [rdi],0
	jc LB_31494
	btr r12,4
	clc
	jmp LB_31495
LB_31494:
	bts r12,4
	stc
LB_31495:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31493:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_31498
	btr r12,5
	clc
	jmp LB_31499
LB_31498:
	bts r12,5
	stc
LB_31499:
	mov r8,r11
	bt r12,5
	jc LB_31496
	btr r12,2
	jmp LB_31497
LB_31496:
	bts r12,2
LB_31497:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_31502
	btr r12,5
	clc
	jmp LB_31503
LB_31502:
	bts r12,5
	stc
LB_31503:
	mov r9,r11
	bt r12,5
	jc LB_31500
	btr r12,3
	jmp LB_31501
LB_31500:
	bts r12,3
LB_31501:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31504:
	cmp r15,0
	jz LB_31505
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31504
LB_31505:
MTC_LB_31506:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31507
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_31508
	bt QWORD [rdi],0
	jc LB_31509
	btr r12,4
	clc
	jmp LB_31510
LB_31509:
	bts r12,4
	stc
LB_31510:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31508:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_31511
	btr r12,1
	jmp LB_31512
LB_31511:
	bts r12,1
LB_31512:
LB_31513:
	cmp r15,0
	jz LB_31514
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31513
LB_31514:
; _f31419 { %_31380 %_31405 } ⊢ { %_31406 %_31407 } : { %_31406 %_31407 }
 ; {>  %_31405~1':_p30700 %_31403~2':(_lst)◂(_p30702) %_31380~0':_r64 }
; _f31419 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_31419
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31515
	btr r12,2
	clc
	jmp LB_31516
LB_31515:
	bts r12,2
	stc
LB_31516:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31517:
	cmp rax,0
	jz LB_31518
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31517
LB_31518:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31408 %_31410 }
 ; {>  %_31403~2':(_lst)◂(_p30702) %_31410~3':_stg %_31409~1':_stg %_31408~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_31519
	mov rdi,r8
	call dlt
LB_31519:
	bt r12,1
	jc LB_31520
	mov rdi,r14
	call dlt
LB_31520:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_31521
	btr r12,1
	jmp LB_31522
LB_31521:
	bts r12,1
LB_31522:
	ret
MTC_LB_31507:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31523
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_31524
	bt QWORD [rdi],0
	jc LB_31525
	btr r12,4
	clc
	jmp LB_31526
LB_31525:
	bts r12,4
	stc
LB_31526:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31524:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_31527
	btr r12,1
	jmp LB_31528
LB_31527:
	bts r12,1
LB_31528:
LB_31529:
	cmp r15,0
	jz LB_31530
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31529
LB_31530:
; _f56 %_31380 ⊢ %_31412 : %_31412
 ; {>  %_31411~1':_p30699 %_31403~2':(_lst)◂(_p30702) %_31380~0':_r64 }
	add r13,1
; _f31343 { %_31412 %_31411 } ⊢ { %_31413 %_31414 } : { %_31413 %_31414 }
 ; {>  %_31412~0':_r64 %_31411~1':_p30699 %_31403~2':(_lst)◂(_p30702) }
; _f31343 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31531
	btr r12,2
	clc
	jmp LB_31532
LB_31531:
	bts r12,2
	stc
LB_31532:
	add rsp,16
; _f55 %_31413 ⊢ %_31415 : %_31415
 ; {>  %_31413~0':_r64 %_31403~2':(_lst)◂(_p30702) %_31414~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31533:
	cmp rax,0
	jz LB_31534
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31533
LB_31534:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31416 %_31418 }
 ; {>  %_31416~0':_r64 %_31417~1':_stg %_31403~2':(_lst)◂(_p30702) %_31418~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_31535
	mov rdi,r14
	call dlt
LB_31535:
	bt r12,2
	jc LB_31536
	mov rdi,r8
	call dlt
LB_31536:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_31537
	btr r12,1
	jmp LB_31538
LB_31537:
	bts r12,1
LB_31538:
	ret
MTC_LB_31523:
MTC_LB_31492:
NS_E_31379:
; 	|» { 0' { 1' 2' 3' } }
NS_E_RDI_31379:
; _f30828 %_31346 ⊢ %_31348 : %_31348
 ; {>  %_31346~2':(_p30686)◂((_p30693)◂(_stg)) %_31345~1':_p30704 %_31344~0':_r64 %_31347~3':(_p30686)◂((_p30694)◂(_stg)) }
; _f30828 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31545
	btr r12,0
	jmp LB_31546
LB_31545:
	bts r12,0
LB_31546:
	call NS_E_30828
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_31547
	btr r12,2
	jmp LB_31548
LB_31547:
	bts r12,2
LB_31548:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_31543
	btr r12,3
	clc
	jmp LB_31544
LB_31543:
	bts r12,3
	stc
LB_31544:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_31541
	btr r12,1
	clc
	jmp LB_31542
LB_31541:
	bts r12,1
	stc
LB_31542:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31539
	btr r12,0
	clc
	jmp LB_31540
LB_31539:
	bts r12,0
	stc
LB_31540:
	add rsp,32
; _f30847 %_31347 ⊢ %_31349 : %_31349
 ; {>  %_31345~1':_p30704 %_31344~0':_r64 %_31348~2':_stg %_31347~3':(_p30686)◂((_p30694)◂(_stg)) }
; _f30847 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_31555
	btr r12,0
	jmp LB_31556
LB_31555:
	bts r12,0
LB_31556:
	call NS_E_30847
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_31557
	btr r12,3
	jmp LB_31558
LB_31557:
	bts r12,3
LB_31558:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_31553
	btr r12,2
	clc
	jmp LB_31554
LB_31553:
	bts r12,2
	stc
LB_31554:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_31551
	btr r12,1
	clc
	jmp LB_31552
LB_31551:
	bts r12,1
	stc
LB_31552:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31549
	btr r12,0
	clc
	jmp LB_31550
LB_31549:
	bts r12,0
	stc
LB_31550:
	add rsp,32
MTC_LB_31559:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31560
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31561
	bt QWORD [rdi],0
	jc LB_31562
	btr r12,5
	clc
	jmp LB_31563
LB_31562:
	bts r12,5
	stc
LB_31563:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31561:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_31564
	btr r12,4
	jmp LB_31565
LB_31564:
	bts r12,4
LB_31565:
LB_31566:
	cmp r15,0
	jz LB_31567
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31566
LB_31567:
; _f30652 %_31350 ⊢ %_31351 : %_31351
 ; {>  %_31344~0':_r64 %_31348~2':_stg %_31350~4':_p30641 %_31349~3':_stg }
; _f30652 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_31574
	btr r12,0
	jmp LB_31575
LB_31574:
	bts r12,0
LB_31575:
	call NS_E_30652
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31576
	btr r12,1
	jmp LB_31577
LB_31576:
	bts r12,1
LB_31577:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_31572
	btr r12,3
	clc
	jmp LB_31573
LB_31572:
	bts r12,3
	stc
LB_31573:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31570
	btr r12,2
	clc
	jmp LB_31571
LB_31570:
	bts r12,2
	stc
LB_31571:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31568
	btr r12,0
	clc
	jmp LB_31569
LB_31568:
	bts r12,0
	stc
LB_31569:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31578:
	cmp rax,0
	jz LB_31579
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31578
LB_31579:
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31352 %_31356 }
 ; {>  %_31354~2':_stg %_31352~0':_r64 %_31356~4':_stg %_31355~3':_stg %_31353~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_31580
	mov rdi,r8
	call dlt
LB_31580:
	bt r12,3
	jc LB_31581
	mov rdi,r9
	call dlt
LB_31581:
	bt r12,1
	jc LB_31582
	mov rdi,r14
	call dlt
LB_31582:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31583
	btr r12,1
	jmp LB_31584
LB_31583:
	bts r12,1
LB_31584:
	ret
MTC_LB_31560:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31585
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31586
	bt QWORD [rdi],0
	jc LB_31587
	btr r12,5
	clc
	jmp LB_31588
LB_31587:
	bts r12,5
	stc
LB_31588:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31586:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_31589
	btr r12,4
	jmp LB_31590
LB_31589:
	bts r12,4
LB_31590:
LB_31591:
	cmp r15,0
	jz LB_31592
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31591
LB_31592:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31593:
	cmp rax,0
	jz LB_31594
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31593
LB_31594:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31358 %_31361 }
 ; {>  %_31360~3':_stg %_31359~2':_stg %_31358~0':_r64 %_31361~1':_stg %_31357~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_31595
	mov rdi,r9
	call dlt
LB_31595:
	bt r12,2
	jc LB_31596
	mov rdi,r8
	call dlt
LB_31596:
	bt r12,4
	jc LB_31597
	mov rdi,r10
	call dlt
LB_31597:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_31585:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_31598
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31599
	bt QWORD [rdi],0
	jc LB_31600
	btr r12,4
	clc
	jmp LB_31601
LB_31600:
	bts r12,4
	stc
LB_31601:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31599:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31602:
	cmp r15,0
	jz LB_31603
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31602
LB_31603:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31604:
	cmp rax,0
	jz LB_31605
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31604
LB_31605:
; "\226\151\130 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31362 %_31365 }
 ; {>  %_31362~0':_r64 %_31365~1':_stg %_31363~2':_stg %_31364~3':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_31606
	mov rdi,r8
	call dlt
LB_31606:
	bt r12,3
	jc LB_31607
	mov rdi,r9
	call dlt
LB_31607:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_31598:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_31608
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °3◂4'
; 1' ⊢ °3◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31609
	bt QWORD [rdi],0
	jc LB_31610
	btr r12,5
	clc
	jmp LB_31611
LB_31610:
	bts r12,5
	stc
LB_31611:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31609:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_31612
	btr r12,4
	jmp LB_31613
LB_31612:
	bts r12,4
LB_31613:
LB_31614:
	cmp r15,0
	jz LB_31615
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31614
LB_31615:
; _f30787 %_31366 ⊢ %_31367 : %_31367
 ; {>  %_31366~4':_p30689 %_31344~0':_r64 %_31348~2':_stg %_31349~3':_stg }
; _f30787 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_31622
	btr r12,0
	jmp LB_31623
LB_31622:
	bts r12,0
LB_31623:
	call NS_E_30787
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31624
	btr r12,1
	jmp LB_31625
LB_31624:
	bts r12,1
LB_31625:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_31620
	btr r12,3
	clc
	jmp LB_31621
LB_31620:
	bts r12,3
	stc
LB_31621:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31618
	btr r12,2
	clc
	jmp LB_31619
LB_31618:
	bts r12,2
	stc
LB_31619:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31616
	btr r12,0
	clc
	jmp LB_31617
LB_31616:
	bts r12,0
	stc
LB_31617:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31626:
	cmp rax,0
	jz LB_31627
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31626
LB_31627:
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31368 %_31372 }
 ; {>  %_31372~4':_stg %_31369~1':_stg %_31368~0':_r64 %_31371~3':_stg %_31370~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_31628
	mov rdi,r14
	call dlt
LB_31628:
	bt r12,3
	jc LB_31629
	mov rdi,r9
	call dlt
LB_31629:
	bt r12,2
	jc LB_31630
	mov rdi,r8
	call dlt
LB_31630:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31631
	btr r12,1
	jmp LB_31632
LB_31631:
	bts r12,1
LB_31632:
	ret
MTC_LB_31608:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_31633
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °4◂{ 4' 5' }
; 1' ⊢ °4◂{ 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31634
	bt QWORD [rdi],0
	jc LB_31635
	btr r12,6
	clc
	jmp LB_31636
LB_31635:
	bts r12,6
	stc
LB_31636:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31634:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_31639
	btr r12,7
	clc
	jmp LB_31640
LB_31639:
	bts r12,7
	stc
LB_31640:
	mov r10,rdx
	bt r12,7
	jc LB_31637
	btr r12,4
	jmp LB_31638
LB_31637:
	bts r12,4
LB_31638:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_31643
	btr r12,7
	clc
	jmp LB_31644
LB_31643:
	bts r12,7
	stc
LB_31644:
	mov r11,rdx
	bt r12,7
	jc LB_31641
	btr r12,5
	jmp LB_31642
LB_31641:
	bts r12,5
LB_31642:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31645:
	cmp r15,0
	jz LB_31646
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31645
LB_31646:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,6
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31647:
	cmp rax,0
	jz LB_31648
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31647
LB_31648:
; "\194\187 _^ "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5f
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_5e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; " .. //\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_31375 %_31378 }
 ; {>  %_31375~0':_r64 %_31378~1':_stg %_31377~3':_stg %_31376~2':_stg %_31373~4':_r64 %_31374~5':(_lst)◂(_p30705) }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_31649
	mov rdi,r9
	call dlt
LB_31649:
	bt r12,2
	jc LB_31650
	mov rdi,r8
	call dlt
LB_31650:
	bt r12,4
	jc LB_31651
	mov rdi,r10
	call dlt
LB_31651:
	bt r12,5
	jc LB_31652
	mov rdi,r11
	call dlt
LB_31652:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_31633:
NS_E_31343:
; 	|» { 0' 1' }
NS_E_RDI_31343:
MTC_LB_31653:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31654
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31655
	bt QWORD [rdi],0
	jc LB_31656
	btr r12,6
	clc
	jmp LB_31657
LB_31656:
	bts r12,6
	stc
LB_31657:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31655:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_31670
	btr r12,7
	clc
	jmp LB_31671
LB_31670:
	bts r12,7
	stc
LB_31671:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_31660
	btr r12,5
	clc
	jmp LB_31661
LB_31660:
	bts r12,5
	stc
LB_31661:
	mov r8,r11
	bt r12,5
	jc LB_31658
	btr r12,2
	jmp LB_31659
LB_31658:
	bts r12,2
LB_31659:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_31664
	btr r12,5
	clc
	jmp LB_31665
LB_31664:
	bts r12,5
	stc
LB_31665:
	mov r9,r11
	bt r12,5
	jc LB_31662
	btr r12,3
	jmp LB_31663
LB_31662:
	bts r12,3
LB_31663:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_31668
	btr r12,5
	clc
	jmp LB_31669
LB_31668:
	bts r12,5
	stc
LB_31669:
	mov r10,r11
	bt r12,5
	jc LB_31666
	btr r12,4
	jmp LB_31667
LB_31666:
	bts r12,4
LB_31667:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_31674
	btr r12,7
	clc
	jmp LB_31675
LB_31674:
	bts r12,7
	stc
LB_31675:
	mov r11,rdx
	bt r12,7
	jc LB_31672
	btr r12,5
	jmp LB_31673
LB_31672:
	bts r12,5
LB_31673:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31676:
	cmp r15,0
	jz LB_31677
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31676
LB_31677:
; _f31379 { %_31326 %_31328 } ⊢ { %_31330 %_31331 } : { %_31330 %_31331 }
 ; {>  %_31329~5':_p30699 %_31326~0':_r64 %_31328~{ 2' 3' 4' }:{ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) } }
; _f31379 { 0' { 2' 3' 4' } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 101110.. |},{ 0' { 2' 3' 4' } } ⊢ { 0' { 1' 2' 3' } }
	mov r14,r8
	bt r12,2
	jc LB_31680
	btr r12,1
	jmp LB_31681
LB_31680:
	bts r12,1
LB_31681:
	mov r8,r9
	bt r12,3
	jc LB_31682
	btr r12,2
	jmp LB_31683
LB_31682:
	bts r12,2
LB_31683:
	mov r9,r10
	bt r12,4
	jc LB_31684
	btr r12,3
	jmp LB_31685
LB_31684:
	bts r12,3
LB_31685:
	call NS_E_31379
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*0]
	bt QWORD rax,5
	jc LB_31678
	btr r12,5
	clc
	jmp LB_31679
LB_31678:
	bts r12,5
	stc
LB_31679:
	add rsp,16
; _f31343 { %_31330 %_31329 } ⊢ { %_31332 %_31333 } : { %_31332 %_31333 }
 ; {>  %_31329~5':_p30699 %_31331~1':_stg %_31330~0':_r64 }
; _f31343 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_31688
	btr r12,1
	jmp LB_31689
LB_31688:
	bts r12,1
LB_31689:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_31690
	btr r12,2
	jmp LB_31691
LB_31690:
	bts r12,2
LB_31691:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_31686
	btr r12,1
	clc
	jmp LB_31687
LB_31686:
	bts r12,1
	stc
LB_31687:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31332 %_31336 }
 ; {>  %_31336~3':_stg %_31335~2':_stg %_31332~0':_r64 %_31334~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_31692
	mov rdi,r8
	call dlt
LB_31692:
	bt r12,1
	jc LB_31693
	mov rdi,r14
	call dlt
LB_31693:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_31694
	btr r12,1
	jmp LB_31695
LB_31694:
	bts r12,1
LB_31695:
	ret
MTC_LB_31654:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31696
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31697
	bt QWORD [rdi],0
	jc LB_31698
	btr r12,3
	clc
	jmp LB_31699
LB_31698:
	bts r12,3
	stc
LB_31699:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31697:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_31700
	btr r12,2
	jmp LB_31701
LB_31700:
	bts r12,2
LB_31701:
LB_31702:
	cmp r15,0
	jz LB_31703
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31702
LB_31703:
; _f31419 { %_31326 %_31337 } ⊢ { %_31338 %_31339 } : { %_31338 %_31339 }
 ; {>  %_31326~0':_r64 %_31337~2':_p30700 }
; _f31419 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_31704
	btr r12,1
	jmp LB_31705
LB_31704:
	bts r12,1
LB_31705:
	call NS_E_31419
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_31338 %_31339 }
 ; {>  %_31339~1':_stg %_31338~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_31696:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_31706
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31707
	bt QWORD [rdi],0
	jc LB_31708
	btr r12,3
	clc
	jmp LB_31709
LB_31708:
	bts r12,3
	stc
LB_31709:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31707:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_31710
	btr r12,2
	jmp LB_31711
LB_31710:
	bts r12,2
LB_31711:
LB_31712:
	cmp r15,0
	jz LB_31713
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31712
LB_31713:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31714:
	cmp rax,0
	jz LB_31715
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31714
LB_31715:
; "\226\136\142 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_31341 %_31342 }
 ; {>  %_31341~0':_r64 %_31340~2':(_p30686)◂((_p30693)◂(_stg)) %_31342~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_31716
	mov rdi,r8
	call dlt
LB_31716:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_31706:
NS_E_31325:
; 	|» { 0' 1' }
NS_E_RDI_31325:
MTC_LB_31717:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31718
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31719
	bt QWORD [rdi],0
	jc LB_31720
	btr r12,6
	clc
	jmp LB_31721
LB_31720:
	bts r12,6
	stc
LB_31721:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31719:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_31734
	btr r12,7
	clc
	jmp LB_31735
LB_31734:
	bts r12,7
	stc
LB_31735:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_31724
	btr r12,5
	clc
	jmp LB_31725
LB_31724:
	bts r12,5
	stc
LB_31725:
	mov r8,r11
	bt r12,5
	jc LB_31722
	btr r12,2
	jmp LB_31723
LB_31722:
	bts r12,2
LB_31723:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_31728
	btr r12,5
	clc
	jmp LB_31729
LB_31728:
	bts r12,5
	stc
LB_31729:
	mov r9,r11
	bt r12,5
	jc LB_31726
	btr r12,3
	jmp LB_31727
LB_31726:
	bts r12,3
LB_31727:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_31732
	btr r12,5
	clc
	jmp LB_31733
LB_31732:
	bts r12,5
	stc
LB_31733:
	mov r10,r11
	bt r12,5
	jc LB_31730
	btr r12,4
	jmp LB_31731
LB_31730:
	bts r12,4
LB_31731:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_31738
	btr r12,7
	clc
	jmp LB_31739
LB_31738:
	bts r12,7
	stc
LB_31739:
	mov r11,rdx
	bt r12,7
	jc LB_31736
	btr r12,5
	jmp LB_31737
LB_31736:
	bts r12,5
LB_31737:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31740:
	cmp r15,0
	jz LB_31741
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31740
LB_31741:
; _f30847 %_31308 ⊢ %_31311 : %_31311
 ; {>  %_31308~3':(_p30686)◂((_p30694)◂(_stg)) %_31307~2':_stg %_31310~5':(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) %_31305~0':_r64 %_31309~4':_p30699 }
; _f30847 3' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_31750
	btr r12,0
	jmp LB_31751
LB_31750:
	bts r12,0
LB_31751:
	call NS_E_30847
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31752
	btr r12,1
	jmp LB_31753
LB_31752:
	bts r12,1
LB_31753:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_31748
	btr r12,5
	clc
	jmp LB_31749
LB_31748:
	bts r12,5
	stc
LB_31749:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_31746
	btr r12,4
	clc
	jmp LB_31747
LB_31746:
	bts r12,4
	stc
LB_31747:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31744
	btr r12,2
	clc
	jmp LB_31745
LB_31744:
	bts r12,2
	stc
LB_31745:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31742
	btr r12,0
	clc
	jmp LB_31743
LB_31742:
	bts r12,0
	stc
LB_31743:
	add rsp,40
; _f31325 { %_31305 %_31310 } ⊢ { %_31312 %_31313 } : { %_31312 %_31313 }
 ; {>  %_31311~1':_stg %_31307~2':_stg %_31310~5':(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) %_31305~0':_r64 %_31309~4':_p30699 }
; _f31325 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_31760
	btr r12,1
	jmp LB_31761
LB_31760:
	bts r12,1
LB_31761:
	call NS_E_31325
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_31762
	btr r12,3
	jmp LB_31763
LB_31762:
	bts r12,3
LB_31763:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_31758
	btr r12,4
	clc
	jmp LB_31759
LB_31758:
	bts r12,4
	stc
LB_31759:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31756
	btr r12,2
	clc
	jmp LB_31757
LB_31756:
	bts r12,2
	stc
LB_31757:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_31754
	btr r12,1
	clc
	jmp LB_31755
LB_31754:
	bts r12,1
	stc
LB_31755:
	add rsp,32
; _f56 %_31312 ⊢ %_31314 : %_31314
 ; {>  %_31313~3':_stg %_31311~1':_stg %_31307~2':_stg %_31312~0':_r64 %_31309~4':_p30699 }
	add r13,1
; _f31343 { %_31314 %_31309 } ⊢ { %_31315 %_31316 } : { %_31315 %_31316 }
 ; {>  %_31314~0':_r64 %_31313~3':_stg %_31311~1':_stg %_31307~2':_stg %_31309~4':_p30699 }
; _f31343 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_31770
	btr r12,1
	jmp LB_31771
LB_31770:
	bts r12,1
LB_31771:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_31772
	btr r12,4
	jmp LB_31773
LB_31772:
	bts r12,4
LB_31773:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_31768
	btr r12,3
	clc
	jmp LB_31769
LB_31768:
	bts r12,3
	stc
LB_31769:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_31766
	btr r12,2
	clc
	jmp LB_31767
LB_31766:
	bts r12,2
	stc
LB_31767:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_31764
	btr r12,1
	clc
	jmp LB_31765
LB_31764:
	bts r12,1
	stc
LB_31765:
	add rsp,32
; _f55 %_31315 ⊢ %_31317 : %_31317
 ; {>  %_31315~0':_r64 %_31316~4':_stg %_31313~3':_stg %_31311~1':_stg %_31307~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_31774:
	cmp rax,0
	jz LB_31775
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_31774
LB_31775:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 4'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31318 %_31323 }
 ; {>  %_31321~4':_stg %_31318~0':_r64 %_31320~1':_stg %_31319~2':_stg %_31323~5':_stg %_31322~3':_stg }
; 	∎ { 0' 5' }
	bt r12,4
	jc LB_31776
	mov rdi,r10
	call dlt
LB_31776:
	bt r12,1
	jc LB_31777
	mov rdi,r14
	call dlt
LB_31777:
	bt r12,2
	jc LB_31778
	mov rdi,r8
	call dlt
LB_31778:
	bt r12,3
	jc LB_31779
	mov rdi,r9
	call dlt
LB_31779:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_31780
	btr r12,1
	jmp LB_31781
LB_31780:
	bts r12,1
LB_31781:
	ret
MTC_LB_31718:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31782
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31783
	bt QWORD [rdi],0
	jc LB_31784
	btr r12,2
	clc
	jmp LB_31785
LB_31784:
	bts r12,2
	stc
LB_31785:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31783:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31786:
	cmp r15,0
	jz LB_31787
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31786
LB_31787:
; 	» "" _ ⊢ 1' : %_31324
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_31305 %_31324 }
 ; {>  %_31305~0':_r64 %_31324~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_31782:
NS_E_31304:
; 	|» { 0' 1' }
NS_E_RDI_31304:
MTC_LB_31788:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31789
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31790
	bt QWORD [rdi],0
	jc LB_31791
	btr r12,4
	clc
	jmp LB_31792
LB_31791:
	bts r12,4
	stc
LB_31792:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31790:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_31795
	btr r12,5
	clc
	jmp LB_31796
LB_31795:
	bts r12,5
	stc
LB_31796:
	mov r8,r11
	bt r12,5
	jc LB_31793
	btr r12,2
	jmp LB_31794
LB_31793:
	bts r12,2
LB_31794:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_31799
	btr r12,5
	clc
	jmp LB_31800
LB_31799:
	bts r12,5
	stc
LB_31800:
	mov r9,r11
	bt r12,5
	jc LB_31797
	btr r12,3
	jmp LB_31798
LB_31797:
	bts r12,3
LB_31798:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31801:
	cmp r15,0
	jz LB_31802
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31801
LB_31802:
; _f30847 %_31283 ⊢ %_31285 : %_31285
 ; {>  %_31284~3':_p30699 %_31283~2':(_p30686)◂((_p30694)◂(_stg)) %_31281~0':_r64 }
; _f30847 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31807
	btr r12,0
	jmp LB_31808
LB_31807:
	bts r12,0
LB_31808:
	call NS_E_30847
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31809
	btr r12,1
	jmp LB_31810
LB_31809:
	bts r12,1
LB_31810:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_31805
	btr r12,3
	clc
	jmp LB_31806
LB_31805:
	bts r12,3
	stc
LB_31806:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31803
	btr r12,0
	clc
	jmp LB_31804
LB_31803:
	bts r12,0
	stc
LB_31804:
	add rsp,24
; _f56 %_31281 ⊢ %_31286 : %_31286
 ; {>  %_31284~3':_p30699 %_31285~1':_stg %_31281~0':_r64 }
	add r13,1
; _f31343 { %_31286 %_31284 } ⊢ { %_31287 %_31288 } : { %_31287 %_31288 }
 ; {>  %_31284~3':_p30699 %_31285~1':_stg %_31286~0':_r64 }
; _f31343 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_31813
	btr r12,1
	jmp LB_31814
LB_31813:
	bts r12,1
LB_31814:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_31815
	btr r12,2
	jmp LB_31816
LB_31815:
	bts r12,2
LB_31816:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_31811
	btr r12,1
	clc
	jmp LB_31812
LB_31811:
	bts r12,1
	stc
LB_31812:
	add rsp,16
; _f55 %_31287 ⊢ %_31289 : %_31289
 ; {>  %_31285~1':_stg %_31287~0':_r64 %_31288~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31289 %_31292 }
 ; {>  %_31289~0':_r64 %_31291~2':_stg %_31290~1':_stg %_31292~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_31817
	mov rdi,r8
	call dlt
LB_31817:
	bt r12,1
	jc LB_31818
	mov rdi,r14
	call dlt
LB_31818:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_31819
	btr r12,1
	jmp LB_31820
LB_31819:
	bts r12,1
LB_31820:
	ret
MTC_LB_31789:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31821
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31822
	bt QWORD [rdi],0
	jc LB_31823
	btr r12,3
	clc
	jmp LB_31824
LB_31823:
	bts r12,3
	stc
LB_31824:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31822:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_31825
	btr r12,2
	jmp LB_31826
LB_31825:
	bts r12,2
LB_31826:
LB_31827:
	cmp r15,0
	jz LB_31828
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31827
LB_31828:
; _f30787 %_31293 ⊢ %_31294 : %_31294
 ; {>  %_31293~2':_p30689 %_31281~0':_r64 }
; _f30787 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31831
	btr r12,0
	jmp LB_31832
LB_31831:
	bts r12,0
LB_31832:
	call NS_E_30787
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31833
	btr r12,1
	jmp LB_31834
LB_31833:
	bts r12,1
LB_31834:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31829
	btr r12,0
	clc
	jmp LB_31830
LB_31829:
	bts r12,0
	stc
LB_31830:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31281 %_31296 }
 ; {>  %_31295~1':_stg %_31281~0':_r64 %_31296~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_31835
	mov rdi,r14
	call dlt
LB_31835:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_31836
	btr r12,1
	jmp LB_31837
LB_31836:
	bts r12,1
LB_31837:
	ret
MTC_LB_31821:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_31838
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31839
	bt QWORD [rdi],0
	jc LB_31840
	btr r12,3
	clc
	jmp LB_31841
LB_31840:
	bts r12,3
	stc
LB_31841:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31839:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_31842
	btr r12,2
	jmp LB_31843
LB_31842:
	bts r12,2
LB_31843:
LB_31844:
	cmp r15,0
	jz LB_31845
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31844
LB_31845:
; _f56 %_31281 ⊢ %_31298 : %_31298
 ; {>  %_31297~2':_p30699 %_31281~0':_r64 }
	add r13,1
; _f31343 { %_31298 %_31297 } ⊢ { %_31299 %_31300 } : { %_31299 %_31300 }
 ; {>  %_31298~0':_r64 %_31297~2':_p30699 }
; _f31343 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_31846
	btr r12,1
	jmp LB_31847
LB_31846:
	bts r12,1
LB_31847:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_31299 ⊢ %_31301 : %_31301
 ; {>  %_31299~0':_r64 %_31300~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31301 %_31303 }
 ; {>  %_31303~2':_stg %_31301~0':_r64 %_31302~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_31848
	mov rdi,r14
	call dlt
LB_31848:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_31849
	btr r12,1
	jmp LB_31850
LB_31849:
	bts r12,1
LB_31850:
	ret
MTC_LB_31838:
NS_E_31280:
; 	|» 0'
NS_E_RDI_31280:
MTC_LB_31851:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31852
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31853
	bt QWORD [rdi],0
	jc LB_31854
	btr r12,3
	clc
	jmp LB_31855
LB_31854:
	bts r12,3
	stc
LB_31855:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31853:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_31858
	btr r12,4
	clc
	jmp LB_31859
LB_31858:
	bts r12,4
	stc
LB_31859:
	mov r14,r10
	bt r12,4
	jc LB_31856
	btr r12,1
	jmp LB_31857
LB_31856:
	bts r12,1
LB_31857:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_31862
	btr r12,4
	clc
	jmp LB_31863
LB_31862:
	bts r12,4
	stc
LB_31863:
	mov r8,r10
	bt r12,4
	jc LB_31860
	btr r12,2
	jmp LB_31861
LB_31860:
	bts r12,2
LB_31861:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31864:
	cmp r15,0
	jz LB_31865
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31864
LB_31865:
; _f31270 %_31272 ⊢ %_31274 : %_31274
 ; {>  %_31273~2':(_lst)◂(_p30743) %_31272~1':_p30743 }
; _f31270 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31868
	btr r12,0
	jmp LB_31869
LB_31868:
	bts r12,0
LB_31869:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31866
	btr r12,2
	clc
	jmp LB_31867
LB_31866:
	bts r12,2
	stc
LB_31867:
	add rsp,16
; _f31280 %_31273 ⊢ %_31275 : %_31275
 ; {>  %_31273~2':(_lst)◂(_p30743) %_31274~0':_stg }
; _f31280 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31872
	btr r12,0
	jmp LB_31873
LB_31872:
	bts r12,0
LB_31873:
	call NS_E_31280
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31874
	btr r12,1
	jmp LB_31875
LB_31874:
	bts r12,1
LB_31875:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31870
	btr r12,0
	clc
	jmp LB_31871
LB_31870:
	bts r12,0
	stc
LB_31871:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_31278
 ; {>  %_31276~0':_stg %_31277~1':_stg %_31278~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_31876
	mov rdi,r13
	call dlt
LB_31876:
	bt r12,1
	jc LB_31877
	mov rdi,r14
	call dlt
LB_31877:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31878
	btr r12,0
	jmp LB_31879
LB_31878:
	bts r12,0
LB_31879:
	ret
MTC_LB_31852:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31880
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31881
	bt QWORD [rdi],0
	jc LB_31882
	btr r12,1
	clc
	jmp LB_31883
LB_31882:
	bts r12,1
	stc
LB_31883:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31881:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31884:
	cmp r15,0
	jz LB_31885
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31884
LB_31885:
; 	» "" _ ⊢ 0' : %_31279
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_31279
 ; {>  %_31279~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_31880:
NS_E_31270:
; 	|» 0'
NS_E_RDI_31270:
MTC_LB_31886:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31887
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31888
	bt QWORD [rdi],0
	jc LB_31889
	btr r12,2
	clc
	jmp LB_31890
LB_31889:
	bts r12,2
	stc
LB_31890:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31888:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_31891
	btr r12,1
	jmp LB_31892
LB_31891:
	bts r12,1
LB_31892:
LB_31893:
	cmp r15,0
	jz LB_31894
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31893
LB_31894:
; _f31280 %_31247 ⊢ %_31248 : %_31248
 ; {>  %_31247~1':(_lst)◂(_p30743) }
; _f31280 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31895
	btr r12,0
	jmp LB_31896
LB_31895:
	bts r12,0
LB_31896:
	call NS_E_31280
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_31250
 ; {>  %_31249~0':_stg %_31250~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_31897
	mov rdi,r13
	call dlt
LB_31897:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31898
	btr r12,0
	jmp LB_31899
LB_31898:
	bts r12,0
LB_31899:
	ret
MTC_LB_31887:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31900
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' }
; 0' ⊢ °1◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31901
	bt QWORD [rdi],0
	jc LB_31902
	btr r12,3
	clc
	jmp LB_31903
LB_31902:
	bts r12,3
	stc
LB_31903:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31901:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_31906
	btr r12,4
	clc
	jmp LB_31907
LB_31906:
	bts r12,4
	stc
LB_31907:
	mov r14,r10
	bt r12,4
	jc LB_31904
	btr r12,1
	jmp LB_31905
LB_31904:
	bts r12,1
LB_31905:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_31910
	btr r12,4
	clc
	jmp LB_31911
LB_31910:
	bts r12,4
	stc
LB_31911:
	mov r8,r10
	bt r12,4
	jc LB_31908
	btr r12,2
	jmp LB_31909
LB_31908:
	bts r12,2
LB_31909:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31912:
	cmp r15,0
	jz LB_31913
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31912
LB_31913:
; _f31270 %_31251 ⊢ %_31253 : %_31253
 ; {>  %_31252~2':_p30743 %_31251~1':_p30743 }
; _f31270 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31916
	btr r12,0
	jmp LB_31917
LB_31916:
	bts r12,0
LB_31917:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31914
	btr r12,2
	clc
	jmp LB_31915
LB_31914:
	bts r12,2
	stc
LB_31915:
	add rsp,16
; _f31270 %_31252 ⊢ %_31254 : %_31254
 ; {>  %_31252~2':_p30743 %_31253~0':_stg }
; _f31270 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31920
	btr r12,0
	jmp LB_31921
LB_31920:
	bts r12,0
LB_31921:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31922
	btr r12,1
	jmp LB_31923
LB_31922:
	bts r12,1
LB_31923:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31918
	btr r12,0
	clc
	jmp LB_31919
LB_31918:
	bts r12,0
	stc
LB_31919:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\134\146 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_86
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_92
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_31257
 ; {>  %_31257~2':_stg %_31256~1':_stg %_31255~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_31924
	mov rdi,r14
	call dlt
LB_31924:
	bt r12,0
	jc LB_31925
	mov rdi,r13
	call dlt
LB_31925:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31926
	btr r12,0
	jmp LB_31927
LB_31926:
	bts r12,0
LB_31927:
	ret
MTC_LB_31900:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_31928
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31929
	bt QWORD [rdi],0
	jc LB_31930
	btr r12,3
	clc
	jmp LB_31931
LB_31930:
	bts r12,3
	stc
LB_31931:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31929:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_31934
	btr r12,4
	clc
	jmp LB_31935
LB_31934:
	bts r12,4
	stc
LB_31935:
	mov r14,r10
	bt r12,4
	jc LB_31932
	btr r12,1
	jmp LB_31933
LB_31932:
	bts r12,1
LB_31933:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_31938
	btr r12,4
	clc
	jmp LB_31939
LB_31938:
	bts r12,4
	stc
LB_31939:
	mov r8,r10
	bt r12,4
	jc LB_31936
	btr r12,2
	jmp LB_31937
LB_31936:
	bts r12,2
LB_31937:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31940:
	cmp r15,0
	jz LB_31941
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31940
LB_31941:
; _f31270 %_31258 ⊢ %_31260 : %_31260
 ; {>  %_31259~2':_p30743 %_31258~1':_p30743 }
; _f31270 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31944
	btr r12,0
	jmp LB_31945
LB_31944:
	bts r12,0
LB_31945:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31942
	btr r12,2
	clc
	jmp LB_31943
LB_31942:
	bts r12,2
	stc
LB_31943:
	add rsp,16
; _f31270 %_31259 ⊢ %_31261 : %_31261
 ; {>  %_31259~2':_p30743 %_31260~0':_stg }
; _f31270 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31948
	btr r12,0
	jmp LB_31949
LB_31948:
	bts r12,0
LB_31949:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31950
	btr r12,1
	jmp LB_31951
LB_31950:
	bts r12,1
LB_31951:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31946
	btr r12,0
	clc
	jmp LB_31947
LB_31946:
	bts r12,0
	stc
LB_31947:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\151\130"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_31264
 ; {>  %_31262~0':_stg %_31264~2':_stg %_31263~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_31952
	mov rdi,r13
	call dlt
LB_31952:
	bt r12,1
	jc LB_31953
	mov rdi,r14
	call dlt
LB_31953:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_31954
	btr r12,0
	jmp LB_31955
LB_31954:
	bts r12,0
LB_31955:
	ret
MTC_LB_31928:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_31956
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31957
	bt QWORD [rdi],0
	jc LB_31958
	btr r12,2
	clc
	jmp LB_31959
LB_31958:
	bts r12,2
	stc
LB_31959:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31957:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_31960
	btr r12,1
	jmp LB_31961
LB_31960:
	bts r12,1
LB_31961:
LB_31962:
	cmp r15,0
	jz LB_31963
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31962
LB_31963:
; _f30652 %_31265 ⊢ %_31266 : %_31266
 ; {>  %_31265~1':_p30641 }
; _f30652 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31964
	btr r12,0
	jmp LB_31965
LB_31964:
	bts r12,0
LB_31965:
	call NS_E_30652
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_31266
 ; {>  %_31266~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_31956:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_31966
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂1'
; 0' ⊢ °4◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_31967
	bt QWORD [rdi],0
	jc LB_31968
	btr r12,2
	clc
	jmp LB_31969
LB_31968:
	bts r12,2
	stc
LB_31969:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31967:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_31970
	btr r12,1
	jmp LB_31971
LB_31970:
	bts r12,1
LB_31971:
LB_31972:
	cmp r15,0
	jz LB_31973
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31972
LB_31973:
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "'"
	mov rsi,0x_27
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_31269
 ; {>  %_31268~1':_stg %_31269~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_31974
	mov rdi,r14
	call dlt
LB_31974:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_31966:
NS_E_31245:
; 	|» { 0' 1' }
NS_E_RDI_31245:
MTC_LB_31975:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31976
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_31977
	bt QWORD [rdi],0
	jc LB_31978
	btr r12,5
	clc
	jmp LB_31979
LB_31978:
	bts r12,5
	stc
LB_31979:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_31977:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_31988
	btr r12,6
	clc
	jmp LB_31989
LB_31988:
	bts r12,6
	stc
LB_31989:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_31982
	btr r12,4
	clc
	jmp LB_31983
LB_31982:
	bts r12,4
	stc
LB_31983:
	mov r8,r10
	bt r12,4
	jc LB_31980
	btr r12,2
	jmp LB_31981
LB_31980:
	bts r12,2
LB_31981:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_31986
	btr r12,4
	clc
	jmp LB_31987
LB_31986:
	bts r12,4
	stc
LB_31987:
	mov r9,r10
	bt r12,4
	jc LB_31984
	btr r12,3
	jmp LB_31985
LB_31984:
	bts r12,3
LB_31985:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_31992
	btr r12,6
	clc
	jmp LB_31993
LB_31992:
	bts r12,6
	stc
LB_31993:
	mov r10,rcx
	bt r12,6
	jc LB_31990
	btr r12,4
	jmp LB_31991
LB_31990:
	bts r12,4
LB_31991:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_31994:
	cmp r15,0
	jz LB_31995
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31994
LB_31995:
; _f31245 { %_31231 %_31235 } ⊢ { %_31236 %_31237 } : { %_31236 %_31237 }
 ; {>  %_31235~4':(_lst)◂({ _stg _p30743 }) %_31233~2':_stg %_31231~0':_r64 %_31234~3':_p30743 }
; _f31245 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32000
	btr r12,1
	jmp LB_32001
LB_32000:
	bts r12,1
LB_32001:
	call NS_E_31245
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_31998
	btr r12,3
	clc
	jmp LB_31999
LB_31998:
	bts r12,3
	stc
LB_31999:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_31996
	btr r12,2
	clc
	jmp LB_31997
LB_31996:
	bts r12,2
	stc
LB_31997:
	add rsp,24
; _f31270 %_31234 ⊢ %_31238 : %_31238
 ; {>  %_31233~2':_stg %_31237~1':_stg %_31236~0':_r64 %_31234~3':_p30743 }
; _f31270 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_32008
	btr r12,0
	jmp LB_32009
LB_32008:
	bts r12,0
LB_32009:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_32010
	btr r12,3
	jmp LB_32011
LB_32010:
	bts r12,3
LB_32011:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_32006
	btr r12,2
	clc
	jmp LB_32007
LB_32006:
	bts r12,2
	stc
LB_32007:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_32004
	btr r12,1
	clc
	jmp LB_32005
LB_32004:
	bts r12,1
	stc
LB_32005:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_32002
	btr r12,0
	clc
	jmp LB_32003
LB_32002:
	bts r12,0
	stc
LB_32003:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32012:
	cmp rax,0
	jz LB_32013
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32012
LB_32013:
; "\226\136\144 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " : "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31239 %_31243 }
 ; {>  %_31242~1':_stg %_31243~4':_stg %_31241~3':_stg %_31239~0':_r64 %_31240~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_32014
	mov rdi,r14
	call dlt
LB_32014:
	bt r12,3
	jc LB_32015
	mov rdi,r9
	call dlt
LB_32015:
	bt r12,2
	jc LB_32016
	mov rdi,r8
	call dlt
LB_32016:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32017
	btr r12,1
	jmp LB_32018
LB_32017:
	bts r12,1
LB_32018:
	ret
MTC_LB_31976:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32019
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32020
	bt QWORD [rdi],0
	jc LB_32021
	btr r12,2
	clc
	jmp LB_32022
LB_32021:
	bts r12,2
	stc
LB_32022:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32020:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32023:
	cmp r15,0
	jz LB_32024
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32023
LB_32024:
; 	» "" _ ⊢ 1' : %_31244
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_31231 %_31244 }
 ; {>  %_31244~1':_stg %_31231~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32019:
NS_E_31230:
; 	|» { 0' 1' }
NS_E_RDI_31230:
MTC_LB_32025:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32026
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32027
	bt QWORD [rdi],0
	jc LB_32028
	btr r12,3
	clc
	jmp LB_32029
LB_32028:
	bts r12,3
	stc
LB_32029:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32027:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32030
	btr r12,2
	jmp LB_32031
LB_32030:
	bts r12,2
LB_32031:
LB_32032:
	cmp r15,0
	jz LB_32033
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32032
LB_32033:
; _f56 %_31217 ⊢ %_31220 : %_31220
 ; {>  %_31219~2':(_lst)◂({ _stg _p30743 }) %_31217~0':_r64 }
	add r13,1
; _f31245 { %_31220 %_31219 } ⊢ { %_31221 %_31222 } : { %_31221 %_31222 }
 ; {>  %_31220~0':_r64 %_31219~2':(_lst)◂({ _stg _p30743 }) }
; _f31245 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32034
	btr r12,1
	jmp LB_32035
LB_32034:
	bts r12,1
LB_32035:
	call NS_E_31245
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_31221 ⊢ %_31223 : %_31223
 ; {>  %_31222~1':_stg %_31221~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31223 %_31224 }
 ; {>  %_31225~2':_stg %_31223~0':_r64 %_31224~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_32036
	mov rdi,r8
	call dlt
LB_32036:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32026:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32037
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32038
	bt QWORD [rdi],0
	jc LB_32039
	btr r12,3
	clc
	jmp LB_32040
LB_32039:
	bts r12,3
	stc
LB_32040:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32038:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32041
	btr r12,2
	jmp LB_32042
LB_32041:
	bts r12,2
LB_32042:
LB_32043:
	cmp r15,0
	jz LB_32044
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32043
LB_32044:
; _f31270 %_31226 ⊢ %_31227 : %_31227
 ; {>  %_31217~0':_r64 %_31226~2':_p30743 }
; _f31270 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_32047
	btr r12,0
	jmp LB_32048
LB_32047:
	bts r12,0
LB_32048:
	call NS_E_31270
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_32049
	btr r12,1
	jmp LB_32050
LB_32049:
	bts r12,1
LB_32050:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_32045
	btr r12,0
	clc
	jmp LB_32046
LB_32045:
	bts r12,0
	stc
LB_32046:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31217 %_31229 }
 ; {>  %_31217~0':_r64 %_31228~1':_stg %_31229~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_32051
	mov rdi,r14
	call dlt
LB_32051:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32052
	btr r12,1
	jmp LB_32053
LB_32052:
	bts r12,1
LB_32053:
	ret
MTC_LB_32037:
NS_E_31216:
; 	|» 0'
NS_E_RDI_31216:
MTC_LB_32054:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32055
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_32056
	bt QWORD [rdi],0
	jc LB_32057
	btr r12,3
	clc
	jmp LB_32058
LB_32057:
	bts r12,3
	stc
LB_32058:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32056:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_32061
	btr r12,4
	clc
	jmp LB_32062
LB_32061:
	bts r12,4
	stc
LB_32062:
	mov r14,r10
	bt r12,4
	jc LB_32059
	btr r12,1
	jmp LB_32060
LB_32059:
	bts r12,1
LB_32060:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_32065
	btr r12,4
	clc
	jmp LB_32066
LB_32065:
	bts r12,4
	stc
LB_32066:
	mov r8,r10
	bt r12,4
	jc LB_32063
	btr r12,2
	jmp LB_32064
LB_32063:
	bts r12,2
LB_32064:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32067:
	cmp r15,0
	jz LB_32068
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32067
LB_32068:
; _f31216 %_31211 ⊢ %_31212 : %_31212
 ; {>  %_31210~1':_p30741 %_31211~2':_p30740 }
; _f31216 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_32071
	btr r12,0
	jmp LB_32072
LB_32071:
	bts r12,0
LB_32072:
	call NS_E_31216
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32069
	btr r12,1
	clc
	jmp LB_32070
LB_32069:
	bts r12,1
	stc
LB_32070:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_31214
 ; {>  %_31214~2':_stg %_31210~1':_p30741 %_31213~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_32073
	mov rdi,r14
	call dlt
LB_32073:
	bt r12,0
	jc LB_32074
	mov rdi,r13
	call dlt
LB_32074:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_32075
	btr r12,0
	jmp LB_32076
LB_32075:
	bts r12,0
LB_32076:
	ret
MTC_LB_32055:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32077
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_32078
	bt QWORD [rdi],0
	jc LB_32079
	btr r12,1
	clc
	jmp LB_32080
LB_32079:
	bts r12,1
	stc
LB_32080:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32078:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32081:
	cmp r15,0
	jz LB_32082
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32081
LB_32082:
; 	» "" _ ⊢ 0' : %_31215
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_31215
 ; {>  %_31215~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_32077:
NS_E_31208:
; 	|» { 0' 1' }
NS_E_RDI_31208:
MTC_LB_32083:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32084
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32085
	bt QWORD [rdi],0
	jc LB_32086
	btr r12,3
	clc
	jmp LB_32087
LB_32086:
	bts r12,3
	stc
LB_32087:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32085:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32088
	btr r12,2
	jmp LB_32089
LB_32088:
	bts r12,2
LB_32089:
LB_32090:
	cmp r15,0
	jz LB_32091
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32090
LB_32091:
; _f31216 %_31197 ⊢ %_31198 : %_31198
 ; {>  %_31197~2':_p30740 %_31195~0':t13430'(-1) }
; _f31216 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_32094
	btr r12,0
	jmp LB_32095
LB_32094:
	bts r12,0
LB_32095:
	call NS_E_31216
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_32096
	btr r12,1
	jmp LB_32097
LB_32096:
	bts r12,1
LB_32097:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_32092
	btr r12,0
	clc
	jmp LB_32093
LB_32092:
	bts r12,0
	stc
LB_32093:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " !| "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_21
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31195 %_31200 }
 ; {>  %_31200~2':_stg %_31199~1':_stg %_31195~0':t13430'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_32098
	mov rdi,r14
	call dlt
LB_32098:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32099
	btr r12,1
	jmp LB_32100
LB_32099:
	bts r12,1
LB_32100:
	ret
MTC_LB_32084:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32101
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32102
	bt QWORD [rdi],0
	jc LB_32103
	btr r12,4
	clc
	jmp LB_32104
LB_32103:
	bts r12,4
	stc
LB_32104:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32102:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_32107
	btr r12,5
	clc
	jmp LB_32108
LB_32107:
	bts r12,5
	stc
LB_32108:
	mov r8,r11
	bt r12,5
	jc LB_32105
	btr r12,2
	jmp LB_32106
LB_32105:
	bts r12,2
LB_32106:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_32111
	btr r12,5
	clc
	jmp LB_32112
LB_32111:
	bts r12,5
	stc
LB_32112:
	mov r9,r11
	bt r12,5
	jc LB_32109
	btr r12,3
	jmp LB_32110
LB_32109:
	bts r12,3
LB_32110:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32113:
	cmp r15,0
	jz LB_32114
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32113
LB_32114:
; _f31208 { %_31195 %_31202 } ⊢ { %_31203 %_31204 } : { %_31203 %_31204 }
 ; {>  %_31202~3':_p30739 %_31201~2':_p30741 %_31195~0':t13430'(-1) }
; _f31208 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32117
	btr r12,1
	jmp LB_32118
LB_32117:
	bts r12,1
LB_32118:
	call NS_E_31208
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32115
	btr r12,2
	clc
	jmp LB_32116
LB_32115:
	bts r12,2
	stc
LB_32116:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31203 %_31206 }
 ; {>  %_31203~0':t13430'(-1) %_31201~2':_p30741 %_31206~3':_stg %_31205~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_32119
	mov rdi,r8
	call dlt
LB_32119:
	bt r12,1
	jc LB_32120
	mov rdi,r14
	call dlt
LB_32120:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32121
	btr r12,1
	jmp LB_32122
LB_32121:
	bts r12,1
LB_32122:
	ret
MTC_LB_32101:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_32123
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32124
	bt QWORD [rdi],0
	jc LB_32125
	btr r12,2
	clc
	jmp LB_32126
LB_32125:
	bts r12,2
	stc
LB_32126:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32124:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32127:
	cmp r15,0
	jz LB_32128
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32127
LB_32128:
; 	» "" _ ⊢ 1' : %_31207
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_31195 %_31207 }
 ; {>  %_31195~0':t13430'(-1) %_31207~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32123:
NS_E_31194:
; 	|» { 0' 1' }
NS_E_RDI_31194:
MTC_LB_32129:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32130
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
	btr r12,8
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32131
	bt QWORD [rdi],0
	jc LB_32132
	btr r12,8
	clc
	jmp LB_32133
LB_32132:
	bts r12,8
	stc
LB_32133:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32131:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_32136
	btr r12,9
	clc
	jmp LB_32137
LB_32136:
	bts r12,9
	stc
LB_32137:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_32134
	btr r12,2
	jmp LB_32135
LB_32134:
	bts r12,2
LB_32135:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_32140
	btr r12,9
	clc
	jmp LB_32141
LB_32140:
	bts r12,9
	stc
LB_32141:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_32138
	btr r12,3
	jmp LB_32139
LB_32138:
	bts r12,3
LB_32139:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_32144
	btr r12,9
	clc
	jmp LB_32145
LB_32144:
	bts r12,9
	stc
LB_32145:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_32142
	btr r12,4
	jmp LB_32143
LB_32142:
	bts r12,4
LB_32143:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_32148
	btr r12,9
	clc
	jmp LB_32149
LB_32148:
	bts r12,9
	stc
LB_32149:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_32146
	btr r12,5
	jmp LB_32147
LB_32146:
	bts r12,5
LB_32147:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_32152
	btr r12,9
	clc
	jmp LB_32153
LB_32152:
	bts r12,9
	stc
LB_32153:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_32150
	btr r12,6
	jmp LB_32151
LB_32150:
	bts r12,6
LB_32151:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_32156
	btr r12,9
	clc
	jmp LB_32157
LB_32156:
	bts r12,9
	stc
LB_32157:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_32154
	btr r12,7
	jmp LB_32155
LB_32154:
	bts r12,7
LB_32155:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32158:
	cmp r15,0
	jz LB_32159
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32158
LB_32159:
; _f30847 %_31162 ⊢ %_31168 : %_31168
 ; {>  %_31164~4':_p30738 %_31163~3':_p30699 %_31166~6':(_opn)◂(_p30737) %_31167~7':_p30737 %_31165~5':_p30739 %_31160~0':_r64 %_31162~2':(_p30686)◂((_p30694)◂(_stg)) }
; _f30847 2' ⊢ 1'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_32172
	btr r12,0
	jmp LB_32173
LB_32172:
	bts r12,0
LB_32173:
	call NS_E_30847
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_32174
	btr r12,1
	jmp LB_32175
LB_32174:
	bts r12,1
LB_32175:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_32170
	btr r12,7
	clc
	jmp LB_32171
LB_32170:
	bts r12,7
	stc
LB_32171:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_32168
	btr r12,6
	clc
	jmp LB_32169
LB_32168:
	bts r12,6
	stc
LB_32169:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_32166
	btr r12,5
	clc
	jmp LB_32167
LB_32166:
	bts r12,5
	stc
LB_32167:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_32164
	btr r12,4
	clc
	jmp LB_32165
LB_32164:
	bts r12,4
	stc
LB_32165:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_32162
	btr r12,3
	clc
	jmp LB_32163
LB_32162:
	bts r12,3
	stc
LB_32163:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_32160
	btr r12,0
	clc
	jmp LB_32161
LB_32160:
	bts r12,0
	stc
LB_32161:
	add rsp,56
; _f56 %_31160 ⊢ %_31169 : %_31169
 ; {>  %_31164~4':_p30738 %_31163~3':_p30699 %_31168~1':_stg %_31166~6':(_opn)◂(_p30737) %_31167~7':_p30737 %_31165~5':_p30739 %_31160~0':_r64 }
	add r13,1
; _f31343 { %_31169 %_31163 } ⊢ { %_31170 %_31171 } : { %_31170 %_31171 }
 ; {>  %_31169~0':_r64 %_31164~4':_p30738 %_31163~3':_p30699 %_31168~1':_stg %_31166~6':(_opn)◂(_p30737) %_31167~7':_p30737 %_31165~5':_p30739 }
; _f31343 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp+8+8*4],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32186
	btr r12,1
	jmp LB_32187
LB_32186:
	bts r12,1
LB_32187:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_32188
	btr r12,2
	jmp LB_32189
LB_32188:
	bts r12,2
LB_32189:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_32184
	btr r12,7
	clc
	jmp LB_32185
LB_32184:
	bts r12,7
	stc
LB_32185:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_32182
	btr r12,6
	clc
	jmp LB_32183
LB_32182:
	bts r12,6
	stc
LB_32183:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_32180
	btr r12,5
	clc
	jmp LB_32181
LB_32180:
	bts r12,5
	stc
LB_32181:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_32178
	btr r12,4
	clc
	jmp LB_32179
LB_32178:
	bts r12,4
	stc
LB_32179:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32176
	btr r12,1
	clc
	jmp LB_32177
LB_32176:
	bts r12,1
	stc
LB_32177:
	add rsp,48
; _f55 %_31170 ⊢ %_31172 : %_31172
 ; {>  %_31164~4':_p30738 %_31171~2':_stg %_31168~1':_stg %_31166~6':(_opn)◂(_p30737) %_31167~7':_p30737 %_31165~5':_p30739 %_31170~0':_r64 }
	sub r13,1
; _f31194 { %_31172 %_31167 } ⊢ { %_31173 %_31174 } : { %_31173 %_31174 }
 ; {>  %_31164~4':_p30738 %_31171~2':_stg %_31172~0':_r64 %_31168~1':_stg %_31166~6':(_opn)◂(_p30737) %_31167~7':_p30737 %_31165~5':_p30739 }
; _f31194 { 0' 7' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_32200
	btr r12,1
	jmp LB_32201
LB_32200:
	bts r12,1
LB_32201:
	call NS_E_31194
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_32202
	btr r12,3
	jmp LB_32203
LB_32202:
	bts r12,3
LB_32203:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_32198
	btr r12,6
	clc
	jmp LB_32199
LB_32198:
	bts r12,6
	stc
LB_32199:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_32196
	btr r12,5
	clc
	jmp LB_32197
LB_32196:
	bts r12,5
	stc
LB_32197:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_32194
	btr r12,4
	clc
	jmp LB_32195
LB_32194:
	bts r12,4
	stc
LB_32195:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_32192
	btr r12,2
	clc
	jmp LB_32193
LB_32192:
	bts r12,2
	stc
LB_32193:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32190
	btr r12,1
	clc
	jmp LB_32191
LB_32190:
	bts r12,1
	stc
LB_32191:
	add rsp,48
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,11
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rdx,rax
	btr r12,7
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32204:
	cmp rax,0
	jz LB_32205
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32204
LB_32205:
; "\226\136\144 .. \226\138\162 "
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31175 %_31179 }
 ; {>  %_31179~7':_stg %_31178~3':_stg %_31164~4':_p30738 %_31166~6':(_opn)◂(_p30737) %_31177~2':_stg %_31175~0':_r64 %_31165~5':_p30739 %_31176~1':_stg }
; 	∎ { 0' 7' }
	bt r12,3
	jc LB_32206
	mov rdi,r9
	call dlt
LB_32206:
	bt r12,4
	jc LB_32207
	mov rdi,r10
	call dlt
LB_32207:
	bt r12,6
	jc LB_32208
	mov rdi,rcx
	call dlt
LB_32208:
	bt r12,2
	jc LB_32209
	mov rdi,r8
	call dlt
LB_32209:
	bt r12,5
	jc LB_32210
	mov rdi,r11
	call dlt
LB_32210:
	bt r12,1
	jc LB_32211
	mov rdi,r14
	call dlt
LB_32211:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_32212
	btr r12,1
	jmp LB_32213
LB_32212:
	bts r12,1
LB_32213:
	ret
MTC_LB_32130:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32214
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32215
	bt QWORD [rdi],0
	jc LB_32216
	btr r12,7
	clc
	jmp LB_32217
LB_32216:
	bts r12,7
	stc
LB_32217:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32215:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_32220
	btr r12,8
	clc
	jmp LB_32221
LB_32220:
	bts r12,8
	stc
LB_32221:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32218
	btr r12,2
	jmp LB_32219
LB_32218:
	bts r12,2
LB_32219:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_32224
	btr r12,8
	clc
	jmp LB_32225
LB_32224:
	bts r12,8
	stc
LB_32225:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32222
	btr r12,3
	jmp LB_32223
LB_32222:
	bts r12,3
LB_32223:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_32228
	btr r12,8
	clc
	jmp LB_32229
LB_32228:
	bts r12,8
	stc
LB_32229:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32226
	btr r12,4
	jmp LB_32227
LB_32226:
	bts r12,4
LB_32227:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_32232
	btr r12,8
	clc
	jmp LB_32233
LB_32232:
	bts r12,8
	stc
LB_32233:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32230
	btr r12,5
	jmp LB_32231
LB_32230:
	bts r12,5
LB_32231:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_32236
	btr r12,8
	clc
	jmp LB_32237
LB_32236:
	bts r12,8
	stc
LB_32237:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32234
	btr r12,6
	jmp LB_32235
LB_32234:
	bts r12,6
LB_32235:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32238:
	cmp r15,0
	jz LB_32239
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32238
LB_32239:
; _f30847 %_31180 ⊢ %_31185 : %_31185
 ; {>  %_31184~6':(_opn)◂(_p30737) %_31180~2':(_p30686)◂((_p30694)◂(_stg)) %_31182~4':_p30738 %_31183~5':_p30739 %_31160~0':_r64 %_31181~3':_p30699 }
; _f30847 2' ⊢ 1'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_32250
	btr r12,0
	jmp LB_32251
LB_32250:
	bts r12,0
LB_32251:
	call NS_E_30847
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_32252
	btr r12,1
	jmp LB_32253
LB_32252:
	bts r12,1
LB_32253:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_32248
	btr r12,6
	clc
	jmp LB_32249
LB_32248:
	bts r12,6
	stc
LB_32249:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_32246
	btr r12,5
	clc
	jmp LB_32247
LB_32246:
	bts r12,5
	stc
LB_32247:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_32244
	btr r12,4
	clc
	jmp LB_32245
LB_32244:
	bts r12,4
	stc
LB_32245:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_32242
	btr r12,3
	clc
	jmp LB_32243
LB_32242:
	bts r12,3
	stc
LB_32243:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_32240
	btr r12,0
	clc
	jmp LB_32241
LB_32240:
	bts r12,0
	stc
LB_32241:
	add rsp,48
; _f56 %_31160 ⊢ %_31186 : %_31186
 ; {>  %_31184~6':(_opn)◂(_p30737) %_31182~4':_p30738 %_31183~5':_p30739 %_31160~0':_r64 %_31185~1':_stg %_31181~3':_p30699 }
	add r13,1
; _f31343 { %_31186 %_31181 } ⊢ { %_31187 %_31188 } : { %_31187 %_31188 }
 ; {>  %_31184~6':(_opn)◂(_p30737) %_31182~4':_p30738 %_31183~5':_p30739 %_31186~0':_r64 %_31185~1':_stg %_31181~3':_p30699 }
; _f31343 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32262
	btr r12,1
	jmp LB_32263
LB_32262:
	bts r12,1
LB_32263:
	call NS_E_31343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_32264
	btr r12,2
	jmp LB_32265
LB_32264:
	bts r12,2
LB_32265:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_32260
	btr r12,6
	clc
	jmp LB_32261
LB_32260:
	bts r12,6
	stc
LB_32261:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_32258
	btr r12,5
	clc
	jmp LB_32259
LB_32258:
	bts r12,5
	stc
LB_32259:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_32256
	btr r12,4
	clc
	jmp LB_32257
LB_32256:
	bts r12,4
	stc
LB_32257:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32254
	btr r12,1
	clc
	jmp LB_32255
LB_32254:
	bts r12,1
	stc
LB_32255:
	add rsp,40
; _f55 %_31187 ⊢ %_31189 : %_31189
 ; {>  %_31184~6':(_opn)◂(_p30737) %_31182~4':_p30738 %_31188~2':_stg %_31183~5':_p30739 %_31187~0':_r64 %_31185~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,12
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32266:
	cmp rax,0
	jz LB_32267
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32266
LB_32267:
; "\226\136\144. .. \226\138\162 "
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_e2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31190 %_31193 }
 ; {>  %_31184~6':(_opn)◂(_p30737) %_31192~2':_stg %_31182~4':_p30738 %_31190~0':_r64 %_31183~5':_p30739 %_31193~3':_stg %_31191~1':_stg }
; 	∎ { 0' 3' }
	bt r12,6
	jc LB_32268
	mov rdi,rcx
	call dlt
LB_32268:
	bt r12,2
	jc LB_32269
	mov rdi,r8
	call dlt
LB_32269:
	bt r12,4
	jc LB_32270
	mov rdi,r10
	call dlt
LB_32270:
	bt r12,5
	jc LB_32271
	mov rdi,r11
	call dlt
LB_32271:
	bt r12,1
	jc LB_32272
	mov rdi,r14
	call dlt
LB_32272:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32273
	btr r12,1
	jmp LB_32274
LB_32273:
	bts r12,1
LB_32274:
	ret
MTC_LB_32214:
NS_E_31159:
; 	|» { 0' 1' }
NS_E_RDI_31159:
MTC_LB_32275:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32276
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32277
	bt QWORD [rdi],0
	jc LB_32278
	btr r12,7
	clc
	jmp LB_32279
LB_32278:
	bts r12,7
	stc
LB_32279:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32277:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_32282
	btr r12,8
	clc
	jmp LB_32283
LB_32282:
	bts r12,8
	stc
LB_32283:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32280
	btr r12,2
	jmp LB_32281
LB_32280:
	bts r12,2
LB_32281:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_32286
	btr r12,8
	clc
	jmp LB_32287
LB_32286:
	bts r12,8
	stc
LB_32287:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32284
	btr r12,3
	jmp LB_32285
LB_32284:
	bts r12,3
LB_32285:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_32290
	btr r12,8
	clc
	jmp LB_32291
LB_32290:
	bts r12,8
	stc
LB_32291:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32288
	btr r12,4
	jmp LB_32289
LB_32288:
	bts r12,4
LB_32289:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_32294
	btr r12,8
	clc
	jmp LB_32295
LB_32294:
	bts r12,8
	stc
LB_32295:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32292
	btr r12,5
	jmp LB_32293
LB_32292:
	bts r12,5
LB_32293:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_32298
	btr r12,8
	clc
	jmp LB_32299
LB_32298:
	bts r12,8
	stc
LB_32299:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_32296
	btr r12,6
	jmp LB_32297
LB_32296:
	bts r12,6
LB_32297:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32300:
	cmp r15,0
	jz LB_32301
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32300
LB_32301:
; _f31159 { %_31141 %_31147 } ⊢ { %_31148 %_31149 } : { %_31148 %_31149 }
 ; {>  %_31147~6':_p30736 %_31144~3':_p30738 %_31146~5':(_opn)◂(_p30736) %_31145~4':_p30739 %_31143~2':(_opn)◂(_stg) %_31141~0':_r64 }
; _f31159 { 0' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_32310
	btr r12,1
	jmp LB_32311
LB_32310:
	bts r12,1
LB_32311:
	call NS_E_31159
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_32308
	btr r12,5
	clc
	jmp LB_32309
LB_32308:
	bts r12,5
	stc
LB_32309:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_32306
	btr r12,4
	clc
	jmp LB_32307
LB_32306:
	bts r12,4
	stc
LB_32307:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_32304
	btr r12,3
	clc
	jmp LB_32305
LB_32304:
	bts r12,3
	stc
LB_32305:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32302
	btr r12,2
	clc
	jmp LB_32303
LB_32302:
	bts r12,2
	stc
LB_32303:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32312:
	cmp rax,0
	jz LB_32313
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32312
LB_32313:
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31150 %_31152 }
 ; {>  %_31152~6':_stg %_31144~3':_p30738 %_31146~5':(_opn)◂(_p30736) %_31145~4':_p30739 %_31151~1':_stg %_31143~2':(_opn)◂(_stg) %_31150~0':_r64 }
; 	∎ { 0' 6' }
	bt r12,3
	jc LB_32314
	mov rdi,r9
	call dlt
LB_32314:
	bt r12,5
	jc LB_32315
	mov rdi,r11
	call dlt
LB_32315:
	bt r12,4
	jc LB_32316
	mov rdi,r10
	call dlt
LB_32316:
	bt r12,1
	jc LB_32317
	mov rdi,r14
	call dlt
LB_32317:
	bt r12,2
	jc LB_32318
	mov rdi,r8
	call dlt
LB_32318:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_32319
	btr r12,1
	jmp LB_32320
LB_32319:
	bts r12,1
LB_32320:
	ret
MTC_LB_32276:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32321
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32322
	bt QWORD [rdi],0
	jc LB_32323
	btr r12,6
	clc
	jmp LB_32324
LB_32323:
	bts r12,6
	stc
LB_32324:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32322:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_32327
	btr r12,7
	clc
	jmp LB_32328
LB_32327:
	bts r12,7
	stc
LB_32328:
	mov r8,rdx
	bt r12,7
	jc LB_32325
	btr r12,2
	jmp LB_32326
LB_32325:
	bts r12,2
LB_32326:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_32331
	btr r12,7
	clc
	jmp LB_32332
LB_32331:
	bts r12,7
	stc
LB_32332:
	mov r9,rdx
	bt r12,7
	jc LB_32329
	btr r12,3
	jmp LB_32330
LB_32329:
	bts r12,3
LB_32330:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_32335
	btr r12,7
	clc
	jmp LB_32336
LB_32335:
	bts r12,7
	stc
LB_32336:
	mov r10,rdx
	bt r12,7
	jc LB_32333
	btr r12,4
	jmp LB_32334
LB_32333:
	bts r12,4
LB_32334:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_32339
	btr r12,7
	clc
	jmp LB_32340
LB_32339:
	bts r12,7
	stc
LB_32340:
	mov r11,rdx
	bt r12,7
	jc LB_32337
	btr r12,5
	jmp LB_32338
LB_32337:
	bts r12,5
LB_32338:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32341:
	cmp r15,0
	jz LB_32342
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32341
LB_32342:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32343:
	cmp rax,0
	jz LB_32344
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32343
LB_32344:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_31157 %_31158 }
 ; {>  %_31156~5':(_opn)◂(_p30736) %_31154~3':_p30738 %_31155~4':_p30739 %_31158~1':_stg %_31157~0':_r64 %_31153~2':(_opn)◂(_stg) }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_32345
	mov rdi,r11
	call dlt
LB_32345:
	bt r12,3
	jc LB_32346
	mov rdi,r9
	call dlt
LB_32346:
	bt r12,4
	jc LB_32347
	mov rdi,r10
	call dlt
LB_32347:
	bt r12,2
	jc LB_32348
	mov rdi,r8
	call dlt
LB_32348:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32321:
NS_E_31140:
; 	|» { 0' 1' }
NS_E_RDI_31140:
MTC_LB_32349:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32350
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32351
	bt QWORD [rdi],0
	jc LB_32352
	btr r12,3
	clc
	jmp LB_32353
LB_32352:
	bts r12,3
	stc
LB_32353:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32351:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32354
	btr r12,2
	jmp LB_32355
LB_32354:
	bts r12,2
LB_32355:
LB_32356:
	cmp r15,0
	jz LB_32357
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32356
LB_32357:
; _f31159 { %_31132 %_31134 } ⊢ { %_31135 %_31136 } : { %_31135 %_31136 }
 ; {>  %_31134~2':_p30736 %_31132~0':_r64 }
; _f31159 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32358
	btr r12,1
	jmp LB_32359
LB_32358:
	bts r12,1
LB_32359:
	call NS_E_31159
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_31135 %_31136 }
 ; {>  %_31135~0':_r64 %_31136~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32350:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32360
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32361
	bt QWORD [rdi],0
	jc LB_32362
	btr r12,3
	clc
	jmp LB_32363
LB_32362:
	bts r12,3
	stc
LB_32363:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32361:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32364
	btr r12,2
	jmp LB_32365
LB_32364:
	bts r12,2
LB_32365:
LB_32366:
	cmp r15,0
	jz LB_32367
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32366
LB_32367:
; _f31194 { %_31132 %_31137 } ⊢ { %_31138 %_31139 } : { %_31138 %_31139 }
 ; {>  %_31132~0':_r64 %_31137~2':_p30737 }
; _f31194 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32368
	btr r12,1
	jmp LB_32369
LB_32368:
	bts r12,1
LB_32369:
	call NS_E_31194
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_31138 %_31139 }
 ; {>  %_31138~0':_r64 %_31139~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32360:
NS_E_31131:
; 	|» { 0' 1' }
NS_E_RDI_31131:
MTC_LB_32370:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32371
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32372
	bt QWORD [rdi],0
	jc LB_32373
	btr r12,5
	clc
	jmp LB_32374
LB_32373:
	bts r12,5
	stc
LB_32374:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32372:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_32383
	btr r12,6
	clc
	jmp LB_32384
LB_32383:
	bts r12,6
	stc
LB_32384:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_32377
	btr r12,4
	clc
	jmp LB_32378
LB_32377:
	bts r12,4
	stc
LB_32378:
	mov r8,r10
	bt r12,4
	jc LB_32375
	btr r12,2
	jmp LB_32376
LB_32375:
	bts r12,2
LB_32376:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_32381
	btr r12,4
	clc
	jmp LB_32382
LB_32381:
	bts r12,4
	stc
LB_32382:
	mov r9,r10
	bt r12,4
	jc LB_32379
	btr r12,3
	jmp LB_32380
LB_32379:
	bts r12,3
LB_32380:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_32387
	btr r12,6
	clc
	jmp LB_32388
LB_32387:
	bts r12,6
	stc
LB_32388:
	mov r10,rcx
	bt r12,6
	jc LB_32385
	btr r12,4
	jmp LB_32386
LB_32385:
	bts r12,4
LB_32386:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32389:
	cmp r15,0
	jz LB_32390
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32389
LB_32390:
; _f56 %_31114 ⊢ %_31119 : %_31119
 ; {>  %_31116~2':_stg %_31114~0':_r64 %_31118~4':(_lst)◂({ _stg _p30735 }) %_31117~3':_p30735 }
	add r13,1
; _f31140 { %_31119 %_31117 } ⊢ { %_31120 %_31121 } : { %_31120 %_31121 }
 ; {>  %_31116~2':_stg %_31119~0':_r64 %_31118~4':(_lst)◂({ _stg _p30735 }) %_31117~3':_p30735 }
; _f31140 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32395
	btr r12,1
	jmp LB_32396
LB_32395:
	bts r12,1
LB_32396:
	call NS_E_31140
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_32393
	btr r12,4
	clc
	jmp LB_32394
LB_32393:
	bts r12,4
	stc
LB_32394:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32391
	btr r12,2
	clc
	jmp LB_32392
LB_32391:
	bts r12,2
	stc
LB_32392:
	add rsp,24
; _f55 %_31120 ⊢ %_31122 : %_31122
 ; {>  %_31121~1':_stg %_31116~2':_stg %_31120~0':_r64 %_31118~4':(_lst)◂({ _stg _p30735 }) }
	sub r13,1
; _f31131 { %_31122 %_31118 } ⊢ { %_31123 %_31124 } : { %_31123 %_31124 }
 ; {>  %_31121~1':_stg %_31116~2':_stg %_31122~0':_r64 %_31118~4':(_lst)◂({ _stg _p30735 }) }
; _f31131 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32401
	btr r12,1
	jmp LB_32402
LB_32401:
	bts r12,1
LB_32402:
	call NS_E_31131
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_32403
	btr r12,3
	jmp LB_32404
LB_32403:
	bts r12,3
LB_32404:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_32399
	btr r12,2
	clc
	jmp LB_32400
LB_32399:
	bts r12,2
	stc
LB_32400:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32397
	btr r12,1
	clc
	jmp LB_32398
LB_32397:
	bts r12,1
	stc
LB_32398:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32405:
	cmp rax,0
	jz LB_32406
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32405
LB_32406:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31125 %_31129 }
 ; {>  %_31125~0':_r64 %_31126~2':_stg %_31127~1':_stg %_31129~4':_stg %_31128~3':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_32407
	mov rdi,r8
	call dlt
LB_32407:
	bt r12,1
	jc LB_32408
	mov rdi,r14
	call dlt
LB_32408:
	bt r12,3
	jc LB_32409
	mov rdi,r9
	call dlt
LB_32409:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32410
	btr r12,1
	jmp LB_32411
LB_32410:
	bts r12,1
LB_32411:
	ret
MTC_LB_32371:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32412
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32413
	bt QWORD [rdi],0
	jc LB_32414
	btr r12,2
	clc
	jmp LB_32415
LB_32414:
	bts r12,2
	stc
LB_32415:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32413:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32416:
	cmp r15,0
	jz LB_32417
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32416
LB_32417:
; 	» "" _ ⊢ 1' : %_31130
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_31114 %_31130 }
 ; {>  %_31130~1':_stg %_31114~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32412:
NS_E_31113:
; 	|» { 0' 1' }
NS_E_RDI_31113:
MTC_LB_32418:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32419
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32420
	bt QWORD [rdi],0
	jc LB_32421
	btr r12,5
	clc
	jmp LB_32422
LB_32421:
	bts r12,5
	stc
LB_32422:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32420:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_32431
	btr r12,6
	clc
	jmp LB_32432
LB_32431:
	bts r12,6
	stc
LB_32432:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_32425
	btr r12,4
	clc
	jmp LB_32426
LB_32425:
	bts r12,4
	stc
LB_32426:
	mov r8,r10
	bt r12,4
	jc LB_32423
	btr r12,2
	jmp LB_32424
LB_32423:
	bts r12,2
LB_32424:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_32429
	btr r12,4
	clc
	jmp LB_32430
LB_32429:
	bts r12,4
	stc
LB_32430:
	mov r9,r10
	bt r12,4
	jc LB_32427
	btr r12,3
	jmp LB_32428
LB_32427:
	bts r12,3
LB_32428:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_32435
	btr r12,6
	clc
	jmp LB_32436
LB_32435:
	bts r12,6
	stc
LB_32436:
	mov r10,rcx
	bt r12,6
	jc LB_32433
	btr r12,4
	jmp LB_32434
LB_32433:
	bts r12,4
LB_32434:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32437:
	cmp r15,0
	jz LB_32438
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32437
LB_32438:
; _f38 %_31089 ⊢ %_31094 : %_31094
 ; {>  %_31093~4':(_lst)◂({ _stg _p30734 }) %_31092~3':_p30734 %_31091~2':_stg %_31089~0':_r64 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_32443
	btr r12,4
	clc
	jmp LB_32444
LB_32443:
	bts r12,4
	stc
LB_32444:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_32441
	btr r12,3
	clc
	jmp LB_32442
LB_32441:
	bts r12,3
	stc
LB_32442:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32439
	btr r12,2
	clc
	jmp LB_32440
LB_32439:
	bts r12,2
	stc
LB_32440:
	add rsp,32
; _f31113 { %_31094 %_31093 } ⊢ { %_31095 %_31096 } : { %_31095 %_31096 }
 ; {>  %_31093~4':(_lst)◂({ _stg _p30734 }) %_31092~3':_p30734 %_31094~0':_r64 %_31091~2':_stg }
; _f31113 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32449
	btr r12,1
	jmp LB_32450
LB_32449:
	bts r12,1
LB_32450:
	call NS_E_31113
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_32447
	btr r12,3
	clc
	jmp LB_32448
LB_32447:
	bts r12,3
	stc
LB_32448:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32445
	btr r12,2
	clc
	jmp LB_32446
LB_32445:
	bts r12,2
	stc
LB_32446:
	add rsp,24
MTC_LB_32451:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32452
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_32453
	bt QWORD [rdi],0
	jc LB_32454
	btr r12,5
	clc
	jmp LB_32455
LB_32454:
	bts r12,5
	stc
LB_32455:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32453:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_32456
	btr r12,4
	jmp LB_32457
LB_32456:
	bts r12,4
LB_32457:
LB_32458:
	cmp r15,0
	jz LB_32459
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32458
LB_32459:
; _f56 %_31095 ⊢ %_31098 : %_31098
 ; {>  %_31095~0':_r64 %_31091~2':_stg %_31096~1':_stg %_31097~4':(_lst)◂({ _stg _p30743 }) }
	add r13,1
; _f31245 { %_31098 %_31097 } ⊢ { %_31099 %_31100 } : { %_31099 %_31100 }
 ; {>  %_31098~0':_r64 %_31091~2':_stg %_31096~1':_stg %_31097~4':(_lst)◂({ _stg _p30743 }) }
; _f31245 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32464
	btr r12,1
	jmp LB_32465
LB_32464:
	bts r12,1
LB_32465:
	call NS_E_31245
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_32466
	btr r12,3
	jmp LB_32467
LB_32466:
	bts r12,3
LB_32467:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_32462
	btr r12,2
	clc
	jmp LB_32463
LB_32462:
	bts r12,2
	stc
LB_32463:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32460
	btr r12,1
	clc
	jmp LB_32461
LB_32460:
	bts r12,1
	stc
LB_32461:
	add rsp,24
; _f55 %_31099 ⊢ %_31101 : %_31101
 ; {>  %_31099~0':_r64 %_31091~2':_stg %_31096~1':_stg %_31100~3':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32468:
	cmp rax,0
	jz LB_32469
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32468
LB_32469:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31102 %_31106 }
 ; {>  %_31104~3':_stg %_31105~1':_stg %_31103~2':_stg %_31106~4':_stg %_31102~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_32470
	mov rdi,r9
	call dlt
LB_32470:
	bt r12,1
	jc LB_32471
	mov rdi,r14
	call dlt
LB_32471:
	bt r12,2
	jc LB_32472
	mov rdi,r8
	call dlt
LB_32472:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_32473
	btr r12,1
	jmp LB_32474
LB_32473:
	bts r12,1
LB_32474:
	ret
MTC_LB_32452:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32475
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_32476
	bt QWORD [rdi],0
	jc LB_32477
	btr r12,5
	clc
	jmp LB_32478
LB_32477:
	bts r12,5
	stc
LB_32478:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32476:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_32479
	btr r12,4
	jmp LB_32480
LB_32479:
	bts r12,4
LB_32480:
LB_32481:
	cmp r15,0
	jz LB_32482
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32481
LB_32482:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32483:
	cmp rax,0
	jz LB_32484
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32483
LB_32484:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31108 %_31111 }
 ; {>  %_31111~3':_stg %_31110~1':_stg %_31109~2':_stg %_31108~0':_r64 %_31107~4':_p30743 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_32485
	mov rdi,r14
	call dlt
LB_32485:
	bt r12,2
	jc LB_32486
	mov rdi,r8
	call dlt
LB_32486:
	bt r12,4
	jc LB_32487
	mov rdi,r10
	call dlt
LB_32487:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32488
	btr r12,1
	jmp LB_32489
LB_32488:
	bts r12,1
LB_32489:
	ret
MTC_LB_32475:
MTC_LB_32419:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32490
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32491
	bt QWORD [rdi],0
	jc LB_32492
	btr r12,2
	clc
	jmp LB_32493
LB_32492:
	bts r12,2
	stc
LB_32493:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32491:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32494:
	cmp r15,0
	jz LB_32495
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32494
LB_32495:
; 	» "" _ ⊢ 1' : %_31112
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_31089 %_31112 }
 ; {>  %_31112~1':_stg %_31089~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32490:
NS_E_31088:
; 	|» { 0' 1' }
NS_E_RDI_31088:
MTC_LB_32496:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32497
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32498
	bt QWORD [rdi],0
	jc LB_32499
	btr r12,4
	clc
	jmp LB_32500
LB_32499:
	bts r12,4
	stc
LB_32500:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32498:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_32503
	btr r12,5
	clc
	jmp LB_32504
LB_32503:
	bts r12,5
	stc
LB_32504:
	mov r8,r11
	bt r12,5
	jc LB_32501
	btr r12,2
	jmp LB_32502
LB_32501:
	bts r12,2
LB_32502:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_32507
	btr r12,5
	clc
	jmp LB_32508
LB_32507:
	bts r12,5
	stc
LB_32508:
	mov r9,r11
	bt r12,5
	jc LB_32505
	btr r12,3
	jmp LB_32506
LB_32505:
	bts r12,3
LB_32506:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32509:
	cmp r15,0
	jz LB_32510
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32509
LB_32510:
MTC_LB_32511:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32512
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_32513
	bt QWORD [rdi],0
	jc LB_32514
	btr r12,4
	clc
	jmp LB_32515
LB_32514:
	bts r12,4
	stc
LB_32515:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32513:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_32516
	btr r12,1
	jmp LB_32517
LB_32516:
	bts r12,1
LB_32517:
LB_32518:
	cmp r15,0
	jz LB_32519
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32518
LB_32519:
; _f56 %_31020 ⊢ %_31025 : %_31025
 ; {>  %_31024~1':(_lst)◂(_p30731) %_31022~2':_stg %_31020~0':_r64 }
	add r13,1
; _f31019 { %_31025 %_31024 } ⊢ { %_31026 %_31027 } : { %_31026 %_31027 }
 ; {>  %_31024~1':(_lst)◂(_p30731) %_31022~2':_stg %_31025~0':_r64 }
; _f31019 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_31019
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32520
	btr r12,2
	clc
	jmp LB_32521
LB_32520:
	bts r12,2
	stc
LB_32521:
	add rsp,16
; _f55 %_31026 ⊢ %_31028 : %_31028
 ; {>  %_31022~2':_stg %_31026~0':_r64 %_31027~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32522:
	cmp rax,0
	jz LB_32523
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32522
LB_32523:
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0*"\t"
	mov rax,r13
LB_32524:
	cmp rax,0
	jz LB_32525
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32524
LB_32525:
; "\t"
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_31029 %_31032 }
 ; {>  %_31032~3':_stg %_31031~1':_stg %_31030~2':_stg %_31029~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_32526
	mov rdi,r14
	call dlt
LB_32526:
	bt r12,2
	jc LB_32527
	mov rdi,r8
	call dlt
LB_32527:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32528
	btr r12,1
	jmp LB_32529
LB_32528:
	bts r12,1
LB_32529:
	ret
MTC_LB_32512:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32530
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_32531
	bt QWORD [rdi],0
	jc LB_32532
	btr r12,4
	clc
	jmp LB_32533
LB_32532:
	bts r12,4
	stc
LB_32533:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32531:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_32534
	btr r12,1
	jmp LB_32535
LB_32534:
	bts r12,1
LB_32535:
LB_32536:
	cmp r15,0
	jz LB_32537
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32536
LB_32537:
; _f30652 %_31033 ⊢ %_31034 : %_31034
 ; {>  %_31022~2':_stg %_31033~1':_p30641 %_31020~0':_r64 }
; _f30652 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_32542
	btr r12,0
	jmp LB_32543
LB_32542:
	bts r12,0
LB_32543:
	call NS_E_30652
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_32544
	btr r12,1
	jmp LB_32545
LB_32544:
	bts r12,1
LB_32545:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_32540
	btr r12,2
	clc
	jmp LB_32541
LB_32540:
	bts r12,2
	stc
LB_32541:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_32538
	btr r12,0
	clc
	jmp LB_32539
LB_32538:
	bts r12,0
	stc
LB_32539:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32546:
	cmp rax,0
	jz LB_32547
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32546
LB_32547:
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_31035 %_31038 }
 ; {>  %_31038~3':_stg %_31035~0':_r64 %_31037~1':_stg %_31036~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_32548
	mov rdi,r14
	call dlt
LB_32548:
	bt r12,2
	jc LB_32549
	mov rdi,r8
	call dlt
LB_32549:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32550
	btr r12,1
	jmp LB_32551
LB_32550:
	bts r12,1
LB_32551:
	ret
MTC_LB_32530:
MTC_LB_32497:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32552
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32553
	bt QWORD [rdi],0
	jc LB_32554
	btr r12,3
	clc
	jmp LB_32555
LB_32554:
	bts r12,3
	stc
LB_32555:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32553:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32556
	btr r12,2
	jmp LB_32557
LB_32556:
	bts r12,2
LB_32557:
LB_32558:
	cmp r15,0
	jz LB_32559
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32558
LB_32559:
; _f56 %_31020 ⊢ %_31040 : %_31040
 ; {>  %_31039~2':(_lst)◂({ _stg _p30735 }) %_31020~0':_r64 }
	add r13,1
; _f31131 { %_31040 %_31039 } ⊢ { %_31041 %_31042 } : { %_31041 %_31042 }
 ; {>  %_31039~2':(_lst)◂({ _stg _p30735 }) %_31040~0':_r64 }
; _f31131 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32560
	btr r12,1
	jmp LB_32561
LB_32560:
	bts r12,1
LB_32561:
	call NS_E_31131
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_31041 ⊢ %_31043 : %_31043
 ; {>  %_31041~0':_r64 %_31042~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32562:
	cmp rax,0
	jz LB_32563
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32562
LB_32563:
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31044 %_31046 }
 ; {>  %_31044~0':_r64 %_31046~2':_stg %_31045~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_32564
	mov rdi,r14
	call dlt
LB_32564:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32565
	btr r12,1
	jmp LB_32566
LB_32565:
	bts r12,1
LB_32566:
	ret
MTC_LB_32552:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_32567
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32568
	bt QWORD [rdi],0
	jc LB_32569
	btr r12,4
	clc
	jmp LB_32570
LB_32569:
	bts r12,4
	stc
LB_32570:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32568:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_32573
	btr r12,5
	clc
	jmp LB_32574
LB_32573:
	bts r12,5
	stc
LB_32574:
	mov r8,r11
	bt r12,5
	jc LB_32571
	btr r12,2
	jmp LB_32572
LB_32571:
	bts r12,2
LB_32572:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_32577
	btr r12,5
	clc
	jmp LB_32578
LB_32577:
	bts r12,5
	stc
LB_32578:
	mov r9,r11
	bt r12,5
	jc LB_32575
	btr r12,3
	jmp LB_32576
LB_32575:
	bts r12,3
LB_32576:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32579:
	cmp r15,0
	jz LB_32580
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32579
LB_32580:
; _f56 %_31020 ⊢ %_31049 : %_31049
 ; {>  %_31047~2':_stg %_31048~3':_p30733 %_31020~0':_r64 }
	add r13,1
; _f31304 { %_31049 %_31048 } ⊢ { %_31050 %_31051 } : { %_31050 %_31051 }
 ; {>  %_31047~2':_stg %_31048~3':_p30733 %_31049~0':_r64 }
; _f31304 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32583
	btr r12,1
	jmp LB_32584
LB_32583:
	bts r12,1
LB_32584:
	call NS_E_31304
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32581
	btr r12,2
	clc
	jmp LB_32582
LB_32581:
	bts r12,2
	stc
LB_32582:
	add rsp,16
; _f55 %_31050 ⊢ %_31052 : %_31052
 ; {>  %_31050~0':_r64 %_31047~2':_stg %_31051~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32585:
	cmp rax,0
	jz LB_32586
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32585
LB_32586:
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31053 %_31056 }
 ; {>  %_31055~1':_stg %_31054~2':_stg %_31053~0':_r64 %_31056~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_32587
	mov rdi,r14
	call dlt
LB_32587:
	bt r12,2
	jc LB_32588
	mov rdi,r8
	call dlt
LB_32588:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32589
	btr r12,1
	jmp LB_32590
LB_32589:
	bts r12,1
LB_32590:
	ret
MTC_LB_32567:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_32591
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32592
	bt QWORD [rdi],0
	jc LB_32593
	btr r12,3
	clc
	jmp LB_32594
LB_32593:
	bts r12,3
	stc
LB_32594:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32592:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32595
	btr r12,2
	jmp LB_32596
LB_32595:
	bts r12,2
LB_32596:
LB_32597:
	cmp r15,0
	jz LB_32598
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32597
LB_32598:
; _f56 %_31020 ⊢ %_31058 : %_31058
 ; {>  %_31020~0':_r64 %_31057~2':(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) }
	add r13,1
; _f31325 { %_31058 %_31057 } ⊢ { %_31059 %_31060 } : { %_31059 %_31060 }
 ; {>  %_31058~0':_r64 %_31057~2':(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) }
; _f31325 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32599
	btr r12,1
	jmp LB_32600
LB_32599:
	bts r12,1
LB_32600:
	call NS_E_31325
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_31059 ⊢ %_31061 : %_31061
 ; {>  %_31059~0':_r64 %_31060~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32601:
	cmp rax,0
	jz LB_32602
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32601
LB_32602:
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31062 %_31064 }
 ; {>  %_31063~1':_stg %_31062~0':_r64 %_31064~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_32603
	mov rdi,r14
	call dlt
LB_32603:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32604
	btr r12,1
	jmp LB_32605
LB_32604:
	bts r12,1
LB_32605:
	ret
MTC_LB_32591:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_32606
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' }
; 1' ⊢ °4◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32607
	bt QWORD [rdi],0
	jc LB_32608
	btr r12,4
	clc
	jmp LB_32609
LB_32608:
	bts r12,4
	stc
LB_32609:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32607:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_32612
	btr r12,5
	clc
	jmp LB_32613
LB_32612:
	bts r12,5
	stc
LB_32613:
	mov r8,r11
	bt r12,5
	jc LB_32610
	btr r12,2
	jmp LB_32611
LB_32610:
	bts r12,2
LB_32611:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_32616
	btr r12,5
	clc
	jmp LB_32617
LB_32616:
	bts r12,5
	stc
LB_32617:
	mov r9,r11
	bt r12,5
	jc LB_32614
	btr r12,3
	jmp LB_32615
LB_32614:
	bts r12,3
LB_32615:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32618:
	cmp r15,0
	jz LB_32619
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32618
LB_32619:
MTC_LB_32620:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32621
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_32622
	bt QWORD [rdi],0
	jc LB_32623
	btr r12,4
	clc
	jmp LB_32624
LB_32623:
	bts r12,4
	stc
LB_32624:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32622:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_32625
	btr r12,1
	jmp LB_32626
LB_32625:
	bts r12,1
LB_32626:
LB_32627:
	cmp r15,0
	jz LB_32628
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32627
LB_32628:
; _f56 %_31020 ⊢ %_31068 : %_31068
 ; {>  %_31065~2':_stg %_31020~0':_r64 %_31067~1':(_lst)◂({ _stg _p30743 }) }
	add r13,1
; _f31245 { %_31068 %_31067 } ⊢ { %_31069 %_31070 } : { %_31069 %_31070 }
 ; {>  %_31065~2':_stg %_31068~0':_r64 %_31067~1':(_lst)◂({ _stg _p30743 }) }
; _f31245 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_31245
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_32629
	btr r12,2
	clc
	jmp LB_32630
LB_32629:
	bts r12,2
	stc
LB_32630:
	add rsp,16
; _f55 %_31069 ⊢ %_31071 : %_31071
 ; {>  %_31070~1':_stg %_31065~2':_stg %_31069~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32631:
	cmp rax,0
	jz LB_32632
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32631
LB_32632:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31072 %_31075 }
 ; {>  %_31073~2':_stg %_31075~3':_stg %_31072~0':_r64 %_31074~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_32633
	mov rdi,r8
	call dlt
LB_32633:
	bt r12,1
	jc LB_32634
	mov rdi,r14
	call dlt
LB_32634:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32635
	btr r12,1
	jmp LB_32636
LB_32635:
	bts r12,1
LB_32636:
	ret
MTC_LB_32621:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32637
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_32638
	bt QWORD [rdi],0
	jc LB_32639
	btr r12,4
	clc
	jmp LB_32640
LB_32639:
	bts r12,4
	stc
LB_32640:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32638:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_32641
	btr r12,1
	jmp LB_32642
LB_32641:
	bts r12,1
LB_32642:
LB_32643:
	cmp r15,0
	jz LB_32644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32643
LB_32644:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32645:
	cmp rax,0
	jz LB_32646
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32645
LB_32646:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_31077 %_31079 }
 ; {>  %_31077~0':_r64 %_31078~2':_stg %_31076~1':_p30743 %_31079~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_32647
	mov rdi,r8
	call dlt
LB_32647:
	bt r12,1
	jc LB_32648
	mov rdi,r14
	call dlt
LB_32648:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32649
	btr r12,1
	jmp LB_32650
LB_32649:
	bts r12,1
LB_32650:
	ret
MTC_LB_32637:
MTC_LB_32606:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_32651
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °5◂2'
; 1' ⊢ °5◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32652
	bt QWORD [rdi],0
	jc LB_32653
	btr r12,3
	clc
	jmp LB_32654
LB_32653:
	bts r12,3
	stc
LB_32654:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32652:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_32655
	btr r12,2
	jmp LB_32656
LB_32655:
	bts r12,2
LB_32656:
LB_32657:
	cmp r15,0
	jz LB_32658
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32657
LB_32658:
; _f56 %_31020 ⊢ %_31081 : %_31081
 ; {>  %_31080~2':(_lst)◂({ _stg _p30734 }) %_31020~0':_r64 }
	add r13,1
; _f31113 { %_31081 %_31080 } ⊢ { %_31082 %_31083 } : { %_31082 %_31083 }
 ; {>  %_31080~2':(_lst)◂({ _stg _p30734 }) %_31081~0':_r64 }
; _f31113 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32659
	btr r12,1
	jmp LB_32660
LB_32659:
	bts r12,1
LB_32660:
	call NS_E_31113
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_31082 ⊢ %_31084 : %_31084
 ; {>  %_31083~1':_stg %_31082~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_32661:
	cmp rax,0
	jz LB_32662
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_32661
LB_32662:
; "\194\182\n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31085 %_31087 }
 ; {>  %_31086~1':_stg %_31087~2':_stg %_31085~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_32663
	mov rdi,r14
	call dlt
LB_32663:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32664
	btr r12,1
	jmp LB_32665
LB_32664:
	bts r12,1
LB_32665:
	ret
MTC_LB_32651:
NS_E_31019:
; 	|» { 0' 1' }
NS_E_RDI_31019:
MTC_LB_32666:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_32667
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32668
	bt QWORD [rdi],0
	jc LB_32669
	btr r12,2
	clc
	jmp LB_32670
LB_32669:
	bts r12,2
	stc
LB_32670:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32668:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32671:
	cmp r15,0
	jz LB_32672
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32671
LB_32672:
; 	» "" _ ⊢ 1' : %_31009
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_31007 %_31009 }
 ; {>  %_31007~0':_r64 %_31009~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_32667:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_32673
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_32674
	bt QWORD [rdi],0
	jc LB_32675
	btr r12,4
	clc
	jmp LB_32676
LB_32675:
	bts r12,4
	stc
LB_32676:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_32674:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_32679
	btr r12,5
	clc
	jmp LB_32680
LB_32679:
	bts r12,5
	stc
LB_32680:
	mov r8,r11
	bt r12,5
	jc LB_32677
	btr r12,2
	jmp LB_32678
LB_32677:
	bts r12,2
LB_32678:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_32683
	btr r12,5
	clc
	jmp LB_32684
LB_32683:
	bts r12,5
	stc
LB_32684:
	mov r9,r11
	bt r12,5
	jc LB_32681
	btr r12,3
	jmp LB_32682
LB_32681:
	bts r12,3
LB_32682:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_32685:
	cmp r15,0
	jz LB_32686
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_32685
LB_32686:
; _f31088 { %_31007 %_31010 } ⊢ { %_31012 %_31013 } : { %_31012 %_31013 }
 ; {>  %_31007~0':_r64 %_31010~2':_p30731 %_31011~3':(_lst)◂(_p30731) }
; _f31088 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_32689
	btr r12,1
	jmp LB_32690
LB_32689:
	bts r12,1
LB_32690:
	call NS_E_31088
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_32687
	btr r12,3
	clc
	jmp LB_32688
LB_32687:
	bts r12,3
	stc
LB_32688:
	add rsp,16
; _f31019 { %_31012 %_31011 } ⊢ { %_31014 %_31015 } : { %_31014 %_31015 }
 ; {>  %_31012~0':_r64 %_31013~1':_stg %_31011~3':(_lst)◂(_p30731) }
; _f31019 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32693
	btr r12,1
	jmp LB_32694
LB_32693:
	bts r12,1
LB_32694:
	call NS_E_31019
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_32695
	btr r12,2
	jmp LB_32696
LB_32695:
	bts r12,2
LB_32696:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_32691
	btr r12,1
	clc
	jmp LB_32692
LB_32691:
	bts r12,1
	stc
LB_32692:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_31014 %_31018 }
 ; {>  %_31016~1':_stg %_31014~0':_r64 %_31017~2':_stg %_31018~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_32697
	mov rdi,r14
	call dlt
LB_32697:
	bt r12,2
	jc LB_32698
	mov rdi,r8
	call dlt
LB_32698:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_32699
	btr r12,1
	jmp LB_32700
LB_32699:
	bts r12,1
LB_32700:
	ret
MTC_LB_32673:
NS_E_32704:
NS_E_RDI_32704:
NS_E_32704_ETR_TBL:
NS_E_32704_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_32808
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_32808
	jmp LB_32809
LB_32808:
	jmp LB_32800
LB_32809:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32801
	btr r12,0
	clc
	jmp LB_32802
LB_32801:
	bts r12,0
	stc
LB_32802:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_32797
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_32708 : %_32708
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_32708
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_32708 ⊢ %_32709 : %_32709
 ; {>  %_32708~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_32709
 ; {>  %_32709~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_32795
	btr r12,3
	jmp LB_32796
LB_32795:
	bts r12,3
LB_32796:
	mov r8,0
	bts r12,2
	ret
LB_32797:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_32799
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32798
LB_32799:
	add rsp,8
	ret
LB_32800:
	add rsp,16
	pop r14
LB_32798:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_29814_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32824
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32816
LB_32824:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_32704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32829
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32830
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32830:
	jmp LB_32816
LB_32829:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32819
	btr r12,1
	clc
	jmp LB_32820
LB_32819:
	bts r12,1
	stc
LB_32820:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32817
	btr r12,0
	clc
	jmp LB_32818
LB_32817:
	bts r12,0
	stc
LB_32818:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_32813
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56 %_32711 ⊢ %_32712 : %_32712
 ; {>  %_32711~1':_r64 %_32710~0':_r64 }
	add r14,1
; _some %_32712 ⊢ %_32713 : %_32713
 ; {>  %_32712~1':_r64 %_32710~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_32713
 ; {>  %_32713~°0◂1':(_opn)◂(_r64) %_32710~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_32810
	mov rdi,r13
	call dlt
LB_32810:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_32811
	btr r12,3
	jmp LB_32812
LB_32811:
	bts r12,3
LB_32812:
	mov r8,0
	bts r12,2
	ret
LB_32813:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_32815
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32814
LB_32815:
	add rsp,8
	ret
LB_32816:
	add rsp,32
	pop r14
LB_32814:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_32705:
NS_E_RDI_32705:
NS_E_32705_ETR_TBL:
NS_E_32705_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_32847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_32847
	jmp LB_32848
LB_32847:
	jmp LB_32837
LB_32848:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32852
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32853
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32853:
	jmp LB_32837
LB_32852:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32840
	btr r12,1
	clc
	jmp LB_32841
LB_32840:
	bts r12,1
	stc
LB_32841:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32838
	btr r12,0
	clc
	jmp LB_32839
LB_32838:
	bts r12,0
	stc
LB_32839:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_32834
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_32855
	btr r12,2
	jmp LB_32856
LB_32855:
	bts r12,2
LB_32856:
	mov r13,r14
	bt r12,1
	jc LB_32857
	btr r12,0
	jmp LB_32858
LB_32857:
	bts r12,0
LB_32858:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_32714 ⊢ %_32715 : %_32715
 ; {>  %_32714~0':_r64 }
	add r13,1
; _some %_32715 ⊢ %_32716 : %_32716
 ; {>  %_32715~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_32716
 ; {>  %_32716~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_32832
	btr r12,3
	jmp LB_32833
LB_32832:
	bts r12,3
LB_32833:
	mov r8,0
	bts r12,2
	ret
LB_32834:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_32836
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32835
LB_32836:
	add rsp,8
	ret
LB_32837:
	add rsp,32
	pop r14
LB_32835:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_32874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_32874
	jmp LB_32875
LB_32874:
	jmp LB_32864
LB_32875:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32879
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32880:
	jmp LB_32864
LB_32879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32867
	btr r12,1
	clc
	jmp LB_32868
LB_32867:
	bts r12,1
	stc
LB_32868:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32865
	btr r12,0
	clc
	jmp LB_32866
LB_32865:
	bts r12,0
	stc
LB_32866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_32861
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_32882
	btr r12,2
	jmp LB_32883
LB_32882:
	bts r12,2
LB_32883:
	mov r13,r14
	bt r12,1
	jc LB_32884
	btr r12,0
	jmp LB_32885
LB_32884:
	bts r12,0
LB_32885:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_32717 ⊢ %_32718 : %_32718
 ; {>  %_32717~0':_r64 }
	add r13,1
; _some %_32718 ⊢ %_32719 : %_32719
 ; {>  %_32718~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_32719
 ; {>  %_32719~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_32859
	btr r12,3
	jmp LB_32860
LB_32859:
	bts r12,3
LB_32860:
	mov r8,0
	bts r12,2
	ret
LB_32861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_32863
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32862
LB_32863:
	add rsp,8
	ret
LB_32864:
	add rsp,32
	pop r14
LB_32862:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_32888
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_32720 : %_32720
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_32720
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_32720 ⊢ %_32721 : %_32721
 ; {>  %_32720~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_32721
 ; {>  %_32721~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_32886
	btr r12,3
	jmp LB_32887
LB_32886:
	bts r12,3
LB_32887:
	mov r8,0
	bts r12,2
	ret
LB_32888:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_32890
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32889
LB_32890:
	add rsp,8
	ret
LB_32891:
	add rsp,0
	pop r14
LB_32889:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_32706:
NS_E_RDI_32706:
NS_E_32706_ETR_TBL:
NS_E_32706_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32971
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32918
LB_32971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_32979
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_32979
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_32979
	jmp LB_32980
LB_32979:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32977:
	jmp LB_32918
LB_32980:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32935
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32936
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32936:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32937
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32937:
	jmp LB_32919
LB_32935:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_32947
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_32947
	jmp LB_32948
LB_32947:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32943
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32943:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32944
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32944:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32945
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32945:
	jmp LB_32919
LB_32948:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_32707_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32952
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_32953
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_32953:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32954
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32954:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32955
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32955:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32956
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32956:
	jmp LB_32919
LB_32952:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_32706_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32961
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_32962
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_32962:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_32963
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_32963:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32964
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32964:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32965
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32965:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32966:
	jmp LB_32919
LB_32961:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_32930
	btr r12,5
	clc
	jmp LB_32931
LB_32930:
	bts r12,5
	stc
LB_32931:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_32928
	btr r12,4
	clc
	jmp LB_32929
LB_32928:
	bts r12,4
	stc
LB_32929:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_32926
	btr r12,3
	clc
	jmp LB_32927
LB_32926:
	bts r12,3
	stc
LB_32927:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32924
	btr r12,2
	clc
	jmp LB_32925
LB_32924:
	bts r12,2
	stc
LB_32925:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32922
	btr r12,1
	clc
	jmp LB_32923
LB_32922:
	bts r12,1
	stc
LB_32923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32920
	btr r12,0
	clc
	jmp LB_32921
LB_32920:
	bts r12,0
	stc
LB_32921:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_32915
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_32981
	btr r12,6
	jmp LB_32982
LB_32981:
	bts r12,6
LB_32982:
	mov r8,r10
	bt r12,4
	jc LB_32983
	btr r12,2
	jmp LB_32984
LB_32983:
	bts r12,2
LB_32984:
	mov rdx,r14
	bt r12,1
	jc LB_32985
	btr r12,7
	jmp LB_32986
LB_32985:
	bts r12,7
LB_32986:
	mov r14,rcx
	bt r12,6
	jc LB_32987
	btr r12,1
	jmp LB_32988
LB_32987:
	bts r12,1
LB_32988:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_32991
	btr r12,6
	clc
	jmp LB_32992
LB_32991:
	bts r12,6
	stc
LB_32992:
	mov r9,rcx
	bt r12,6
	jc LB_32989
	btr r12,3
	jmp LB_32990
LB_32989:
	bts r12,3
LB_32990:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_32995
	btr r12,6
	clc
	jmp LB_32996
LB_32995:
	bts r12,6
	stc
LB_32996:
	mov r10,rcx
	bt r12,6
	jc LB_32993
	btr r12,4
	jmp LB_32994
LB_32993:
	bts r12,4
LB_32994:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_32727 : %_32727
 ; {>  %_32726~4':(_lst)◂(_p32701) %_32722~0':_r64 %_32724~2':_r64 %_32723~1':_r64 %_32725~3':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_32727
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_32727 %_32722 } ⊢ { %_32728 %_32729 } : { %_32728 %_32729 }
 ; {>  %_32726~4':(_lst)◂(_p32701) %_32722~0':_r64 %_32724~2':_r64 %_32723~1':_r64 %_32725~3':_r64 %_32727~5':_r64 }
	add r11,r13
; _f51 { %_32728 %_32723 } ⊢ { %_32730 %_32731 } : { %_32730 %_32731 }
 ; {>  %_32726~4':(_lst)◂(_p32701) %_32724~2':_r64 %_32723~1':_r64 %_32725~3':_r64 %_32729~0':_r64 %_32728~5':_r64 }
	add r11,r14
; _f51 { %_32730 %_32724 } ⊢ { %_32732 %_32733 } : { %_32732 %_32733 }
 ; {>  %_32726~4':(_lst)◂(_p32701) %_32731~1':_r64 %_32724~2':_r64 %_32730~5':_r64 %_32725~3':_r64 %_32729~0':_r64 }
	add r11,r8
; _f32702 %_32732 ⊢ %_32734 : %_32734
 ; {>  %_32726~4':(_lst)◂(_p32701) %_32731~1':_r64 %_32732~5':_r64 %_32733~2':_r64 %_32725~3':_r64 %_32729~0':_r64 }
; _f32702 5' ⊢ °0◂5'
; _cns { %_32734 %_32726 } ⊢ %_32735 : %_32735
 ; {>  %_32726~4':(_lst)◂(_p32701) %_32731~1':_r64 %_32733~2':_r64 %_32734~°0◂5':_p32701 %_32725~3':_r64 %_32729~0':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_32725 %_32735 } ⊢ %_32736 : %_32736
 ; {>  %_32731~1':_r64 %_32733~2':_r64 %_32725~3':_r64 %_32735~°0◂{ °0◂5' 4' }:(_lst)◂(_p32701) %_32729~0':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_32736
 ; {>  %_32731~1':_r64 %_32733~2':_r64 %_32729~0':_r64 %_32736~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p32701) }) }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_32892
	mov rdi,r14
	call dlt
LB_32892:
	bt r12,2
	jc LB_32893
	mov rdi,r8
	call dlt
LB_32893:
	bt r12,0
	jc LB_32894
	mov rdi,r13
	call dlt
LB_32894:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_32895
	btr r12,0
	jmp LB_32896
LB_32895:
	bts r12,0
LB_32896:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_32899
	btr r12,1
	jmp LB_32900
LB_32899:
	bts r12,1
LB_32900:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_32897
	btr QWORD [rdi],0
	jmp LB_32898
LB_32897:
	bts QWORD [rdi],0
LB_32898:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_32909
	btr r12,0
	jmp LB_32910
LB_32909:
	bts r12,0
LB_32910:
	mov rsi,1
	bt r12,0
	jc LB_32907
	mov rsi,0
	bt r13,0
	jc LB_32907
	jmp LB_32908
LB_32907:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_32908:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_32905
	btr QWORD [rdi],0
	jmp LB_32906
LB_32905:
	bts QWORD [rdi],0
LB_32906:
	mov r13,r10
	bt r12,4
	jc LB_32913
	btr r12,0
	jmp LB_32914
LB_32913:
	bts r12,0
LB_32914:
	mov rdi,r14
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_32911
	btr QWORD [rdi],1
	jmp LB_32912
LB_32911:
	bts QWORD [rdi],1
LB_32912:
	mov rsi,1
	bt r12,1
	jc LB_32903
	mov rsi,0
	bt r14,0
	jc LB_32903
	jmp LB_32904
LB_32903:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_32904:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_32901
	btr QWORD [rdi],1
	jmp LB_32902
LB_32901:
	bts QWORD [rdi],1
LB_32902:
	mov r8,0
	bts r12,2
	ret
LB_32915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_32917
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_32916
LB_32917:
	add rsp,8
	ret
LB_32919:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_32918:
	add rsp,96
	pop r14
LB_32916:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33050
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33022
LB_33050:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_33058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_33058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_33058
	jmp LB_33059
LB_33058:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33056
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33056:
	jmp LB_33022
LB_33059:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_32704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33035
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33036
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33036:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33037
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33037:
	jmp LB_33023
LB_33035:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_32706_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33042
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_33043
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_33043:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33044
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33045:
	jmp LB_33023
LB_33042:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_33030
	btr r12,3
	clc
	jmp LB_33031
LB_33030:
	bts r12,3
	stc
LB_33031:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33028
	btr r12,2
	clc
	jmp LB_33029
LB_33028:
	bts r12,2
	stc
LB_33029:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33026
	btr r12,1
	clc
	jmp LB_33027
LB_33026:
	bts r12,1
	stc
LB_33027:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33024
	btr r12,0
	clc
	jmp LB_33025
LB_33024:
	bts r12,0
	stc
LB_33025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_33019
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_33060
	btr r12,4
	jmp LB_33061
LB_33060:
	bts r12,4
LB_33061:
	mov r14,r8
	bt r12,2
	jc LB_33062
	btr r12,1
	jmp LB_33063
LB_33062:
	bts r12,1
LB_33063:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_33064
	btr r12,4
	jmp LB_33065
LB_33064:
	bts r12,4
LB_33065:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_33068
	btr r12,5
	clc
	jmp LB_33069
LB_33068:
	bts r12,5
	stc
LB_33069:
	mov r8,r11
	bt r12,5
	jc LB_33066
	btr r12,2
	jmp LB_33067
LB_33066:
	bts r12,2
LB_33067:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_33072
	btr r12,5
	clc
	jmp LB_33073
LB_33072:
	bts r12,5
	stc
LB_33073:
	mov r9,r11
	bt r12,5
	jc LB_33070
	btr r12,3
	jmp LB_33071
LB_33070:
	bts r12,3
LB_33071:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_32741 : %_32741
 ; {>  %_32740~3':(_lst)◂(_p32701) %_32737~0':_r64 %_32738~1':_r64 %_32739~2':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_32741
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_32741 %_32737 } ⊢ { %_32742 %_32743 } : { %_32742 %_32743 }
 ; {>  %_32741~4':_r64 %_32740~3':(_lst)◂(_p32701) %_32737~0':_r64 %_32738~1':_r64 %_32739~2':_r64 }
	add r10,r13
; _f51 { %_32742 %_32738 } ⊢ { %_32744 %_32745 } : { %_32744 %_32745 }
 ; {>  %_32743~0':_r64 %_32740~3':(_lst)◂(_p32701) %_32742~4':_r64 %_32738~1':_r64 %_32739~2':_r64 }
	add r10,r14
; _f32702 %_32744 ⊢ %_32746 : %_32746
 ; {>  %_32743~0':_r64 %_32745~1':_r64 %_32744~4':_r64 %_32740~3':(_lst)◂(_p32701) %_32739~2':_r64 }
; _f32702 4' ⊢ °0◂4'
; _cns { %_32746 %_32740 } ⊢ %_32747 : %_32747
 ; {>  %_32743~0':_r64 %_32745~1':_r64 %_32740~3':(_lst)◂(_p32701) %_32746~°0◂4':_p32701 %_32739~2':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_32739 %_32747 } ⊢ %_32748 : %_32748
 ; {>  %_32747~°0◂{ °0◂4' 3' }:(_lst)◂(_p32701) %_32743~0':_r64 %_32745~1':_r64 %_32739~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_32748
 ; {>  %_32743~0':_r64 %_32745~1':_r64 %_32748~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p32701) }) }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_32997
	mov rdi,r13
	call dlt
LB_32997:
	bt r12,1
	jc LB_32998
	mov rdi,r14
	call dlt
LB_32998:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_32999
	btr r12,0
	jmp LB_33000
LB_32999:
	bts r12,0
LB_33000:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_33003
	btr r12,1
	jmp LB_33004
LB_33003:
	bts r12,1
LB_33004:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_33001
	btr QWORD [rdi],0
	jmp LB_33002
LB_33001:
	bts QWORD [rdi],0
LB_33002:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_33013
	btr r12,2
	jmp LB_33014
LB_33013:
	bts r12,2
LB_33014:
	mov rsi,1
	bt r12,2
	jc LB_33011
	mov rsi,0
	bt r8,0
	jc LB_33011
	jmp LB_33012
LB_33011:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_33012:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_33009
	btr QWORD [rdi],0
	jmp LB_33010
LB_33009:
	bts QWORD [rdi],0
LB_33010:
	mov r8,r13
	bt r12,0
	jc LB_33017
	btr r12,2
	jmp LB_33018
LB_33017:
	bts r12,2
LB_33018:
	mov rdi,r14
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_33015
	btr QWORD [rdi],1
	jmp LB_33016
LB_33015:
	bts QWORD [rdi],1
LB_33016:
	mov rsi,1
	bt r12,1
	jc LB_33007
	mov rsi,0
	bt r14,0
	jc LB_33007
	jmp LB_33008
LB_33007:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_33008:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_33005
	btr QWORD [rdi],1
	jmp LB_33006
LB_33005:
	bts QWORD [rdi],1
LB_33006:
	mov r8,0
	bts r12,2
	ret
LB_33019:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33021
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33020
LB_33021:
	add rsp,8
	ret
LB_33023:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_33022:
	add rsp,64
	pop r14
LB_33020:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_32704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33145
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33137
LB_33145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_32706_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33150
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33151
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33151:
	jmp LB_33137
LB_33150:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33140
	btr r12,1
	clc
	jmp LB_33141
LB_33140:
	bts r12,1
	stc
LB_33141:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33138
	btr r12,0
	clc
	jmp LB_33139
LB_33138:
	bts r12,0
	stc
LB_33139:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_33134
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_33153
	btr r12,3
	jmp LB_33154
LB_33153:
	bts r12,3
LB_33154:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_33157
	btr r12,4
	clc
	jmp LB_33158
LB_33157:
	bts r12,4
	stc
LB_33158:
	mov r14,r10
	bt r12,4
	jc LB_33155
	btr r12,1
	jmp LB_33156
LB_33155:
	bts r12,1
LB_33156:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_33161
	btr r12,4
	clc
	jmp LB_33162
LB_33161:
	bts r12,4
	stc
LB_33162:
	mov r8,r10
	bt r12,4
	jc LB_33159
	btr r12,2
	jmp LB_33160
LB_33159:
	bts r12,2
LB_33160:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f51 { %_32750 %_32749 } ⊢ { %_32752 %_32753 } : { %_32752 %_32753 }
 ; {>  %_32749~0':_r64 %_32751~2':(_lst)◂(_p32701) %_32750~1':_r64 }
	add r14,r13
MTC_LB_33074:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_33075
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_33076
	bt QWORD [rdi],0
	jc LB_33077
	btr r12,5
	clc
	jmp LB_33078
LB_33077:
	bts r12,5
	stc
LB_33078:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33076:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_33081
	btr r12,6
	clc
	jmp LB_33082
LB_33081:
	bts r12,6
	stc
LB_33082:
	mov r9,rcx
	bt r12,6
	jc LB_33079
	btr r12,3
	jmp LB_33080
LB_33079:
	bts r12,3
LB_33080:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_33085
	btr r12,6
	clc
	jmp LB_33086
LB_33085:
	bts r12,6
	stc
LB_33086:
	mov r10,rcx
	bt r12,6
	jc LB_33083
	btr r12,4
	jmp LB_33084
LB_33083:
	bts r12,4
LB_33084:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_33075
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_33087
	bt QWORD [rdi],0
	jc LB_33088
	btr r12,6
	clc
	jmp LB_33089
LB_33088:
	bts r12,6
	stc
LB_33089:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33087:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_33090
	btr r12,5
	jmp LB_33091
LB_33090:
	bts r12,5
LB_33091:
LB_33092:
	cmp r15,0
	jz LB_33093
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33092
LB_33093:
; _f51 { %_32756 %_32753 } ⊢ { %_32757 %_32758 } : { %_32757 %_32758 }
 ; {>  %_32752~1':_r64 %_32753~0':_r64 %_32756~5':_r64 %_32755~4':(_lst)◂(_p32701) }
	add r11,r13
; _f32703 %_32757 ⊢ %_32759 : %_32759
 ; {>  %_32757~5':_r64 %_32752~1':_r64 %_32758~0':_r64 %_32755~4':(_lst)◂(_p32701) }
; _f32703 5' ⊢ °1◂5'
; _cns { %_32759 %_32755 } ⊢ %_32760 : %_32760
 ; {>  %_32752~1':_r64 %_32759~°1◂5':_p32701 %_32758~0':_r64 %_32755~4':(_lst)◂(_p32701) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_32752 %_32760 } ⊢ %_32761 : %_32761
 ; {>  %_32760~°0◂{ °1◂5' 4' }:(_lst)◂(_p32701) %_32752~1':_r64 %_32758~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_32761
 ; {>  %_32758~0':_r64 %_32761~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p32701) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_33094
	mov rdi,r13
	call dlt
LB_33094:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_33097
	btr r12,0
	jmp LB_33098
LB_33097:
	bts r12,0
LB_33098:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_33095
	btr QWORD [rdi],0
	jmp LB_33096
LB_33095:
	bts QWORD [rdi],0
LB_33096:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_33107
	btr r12,1
	jmp LB_33108
LB_33107:
	bts r12,1
LB_33108:
	mov rsi,1
	bt r12,1
	jc LB_33105
	mov rsi,0
	bt r14,0
	jc LB_33105
	jmp LB_33106
LB_33105:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_33106:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_33103
	btr QWORD [rdi],0
	jmp LB_33104
LB_33103:
	bts QWORD [rdi],0
LB_33104:
	mov r14,r10
	bt r12,4
	jc LB_33111
	btr r12,1
	jmp LB_33112
LB_33111:
	bts r12,1
LB_33112:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_33109
	btr QWORD [rdi],1
	jmp LB_33110
LB_33109:
	bts QWORD [rdi],1
LB_33110:
	mov rsi,1
	bt r12,0
	jc LB_33101
	mov rsi,0
	bt r13,0
	jc LB_33101
	jmp LB_33102
LB_33101:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_33102:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_33099
	btr QWORD [rdi],1
	jmp LB_33100
LB_33099:
	bts QWORD [rdi],1
LB_33100:
	mov r8,0
	bts r12,2
	ret
MTC_LB_33075:
	mov r15,0
LB_33114:
	cmp r15,0
	jz LB_33115
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33114
LB_33115:
; _f32703 %_32753 ⊢ %_32762 : %_32762
 ; {>  %_32752~1':_r64 %_32753~0':_r64 %_32751~2':(_lst)◂(_p32701) }
; _f32703 0' ⊢ °1◂0'
; _cns { %_32762 %_32751 } ⊢ %_32763 : %_32763
 ; {>  %_32752~1':_r64 %_32751~2':(_lst)◂(_p32701) %_32762~°1◂0':_p32701 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_32752 %_32763 } ⊢ %_32764 : %_32764
 ; {>  %_32752~1':_r64 %_32763~°0◂{ °1◂0' 2' }:(_lst)◂(_p32701) }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_32764
 ; {>  %_32764~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p32701) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_33118
	btr r12,4
	jmp LB_33119
LB_33118:
	bts r12,4
LB_33119:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_33116
	btr QWORD [rdi],0
	jmp LB_33117
LB_33116:
	bts QWORD [rdi],0
LB_33117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_33128
	btr r12,1
	jmp LB_33129
LB_33128:
	bts r12,1
LB_33129:
	mov rsi,1
	bt r12,1
	jc LB_33126
	mov rsi,0
	bt r14,0
	jc LB_33126
	jmp LB_33127
LB_33126:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_33127:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_33124
	btr QWORD [rdi],0
	jmp LB_33125
LB_33124:
	bts QWORD [rdi],0
LB_33125:
	mov r14,r8
	bt r12,2
	jc LB_33132
	btr r12,1
	jmp LB_33133
LB_33132:
	bts r12,1
LB_33133:
	mov rdi,r10
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_33130
	btr QWORD [rdi],1
	jmp LB_33131
LB_33130:
	bts QWORD [rdi],1
LB_33131:
	mov rsi,1
	bt r12,4
	jc LB_33122
	mov rsi,0
	bt r10,0
	jc LB_33122
	jmp LB_33123
LB_33122:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_33123:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_33120
	btr QWORD [rdi],1
	jmp LB_33121
LB_33120:
	bts QWORD [rdi],1
LB_33121:
	mov r8,0
	bts r12,2
	ret
MTC_LB_33113:
LB_33134:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33136
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33135
LB_33136:
	add rsp,8
	ret
LB_33137:
	add rsp,32
	pop r14
LB_33135:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_33171
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_32765 : %_32765
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_32766 : %_32766
 ; {>  %_32765~°1◂{  }:(_lst)◂(t13901'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_32766
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_32766 %_32765 } ⊢ %_32767 : %_32767
 ; {>  %_32765~°1◂{  }:(_lst)◂(t13901'(0)) %_32766~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_32767
 ; {>  %_32767~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t13905'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_33165
	btr r12,1
	jmp LB_33166
LB_33165:
	bts r12,1
LB_33166:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_33163
	btr QWORD [rdi],0
	jmp LB_33164
LB_33163:
	bts QWORD [rdi],0
LB_33164:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_33169
	mov rsi,0
	bt r14,0
	jc LB_33169
	jmp LB_33170
LB_33169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_33170:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_33167
	btr QWORD [rdi],1
	jmp LB_33168
LB_33167:
	bts QWORD [rdi],1
LB_33168:
	mov r8,0
	bts r12,2
	ret
LB_33171:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33173
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33172
LB_33173:
	add rsp,8
	ret
LB_33174:
	add rsp,0
	pop r14
LB_33172:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_32707:
NS_E_RDI_32707:
NS_E_32707_ETR_TBL:
NS_E_32707_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33212
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33182
LB_33212:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_33220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_33220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_33220
	jmp LB_33221
LB_33220:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33218:
	jmp LB_33182
LB_33221:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33195
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33196
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33196:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33197
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33197:
	jmp LB_33183
LB_33195:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_33207
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_33207
	jmp LB_33208
LB_33207:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_33203
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_33203:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33204
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33204:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33205
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33205:
	jmp LB_33183
LB_33208:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_33190
	btr r12,3
	clc
	jmp LB_33191
LB_33190:
	bts r12,3
	stc
LB_33191:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33188
	btr r12,2
	clc
	jmp LB_33189
LB_33188:
	bts r12,2
	stc
LB_33189:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33186
	btr r12,1
	clc
	jmp LB_33187
LB_33186:
	bts r12,1
	stc
LB_33187:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33184
	btr r12,0
	clc
	jmp LB_33185
LB_33184:
	bts r12,0
	stc
LB_33185:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_33179
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_33222
	btr r12,4
	jmp LB_33223
LB_33222:
	bts r12,4
LB_33223:
	mov r14,r8
	bt r12,2
	jc LB_33224
	btr r12,1
	jmp LB_33225
LB_33224:
	bts r12,1
LB_33225:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_32770 : %_32770
 ; {>  %_32769~1':_r64 %_32768~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_32770
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_32770 %_32768 } ⊢ { %_32771 %_32772 } : { %_32771 %_32772 }
 ; {>  %_32770~2':_r64 %_32769~1':_r64 %_32768~0':_r64 }
	add r8,r13
; _f51 { %_32771 %_32769 } ⊢ { %_32773 %_32774 } : { %_32773 %_32774 }
 ; {>  %_32772~0':_r64 %_32771~2':_r64 %_32769~1':_r64 }
	add r8,r14
; _some %_32773 ⊢ %_32775 : %_32775
 ; {>  %_32772~0':_r64 %_32774~1':_r64 %_32773~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_32775
 ; {>  %_32772~0':_r64 %_32775~°0◂2':(_opn)◂(_r64) %_32774~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_33175
	mov rdi,r13
	call dlt
LB_33175:
	bt r12,1
	jc LB_33176
	mov rdi,r14
	call dlt
LB_33176:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_33177
	btr r12,3
	jmp LB_33178
LB_33177:
	bts r12,3
LB_33178:
	mov r8,0
	bts r12,2
	ret
LB_33179:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33181
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33180
LB_33181:
	add rsp,8
	ret
LB_33183:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_33182:
	add rsp,64
	pop r14
LB_33180:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33288
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33235
LB_33288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_33296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_33296
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_33296
	jmp LB_33297
LB_33296:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33294
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33294:
	jmp LB_33235
LB_33297:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_32705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33252
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33253
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33253:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33254
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33254:
	jmp LB_33236
LB_33252:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_33264
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_33264
	jmp LB_33265
LB_33264:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_33260
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_33260:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33261
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33261:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33262:
	jmp LB_33236
LB_33265:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_32707_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33269
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_33270
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_33270:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_33271
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_33271:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33272
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33272:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33273
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33273:
	jmp LB_33236
LB_33269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_32707_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33278
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_33279
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_33279:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_33280
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_33280:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_33281
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_33281:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33282
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33282:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33283
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33283:
	jmp LB_33236
LB_33278:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_33247
	btr r12,5
	clc
	jmp LB_33248
LB_33247:
	bts r12,5
	stc
LB_33248:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_33245
	btr r12,4
	clc
	jmp LB_33246
LB_33245:
	bts r12,4
	stc
LB_33246:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_33243
	btr r12,3
	clc
	jmp LB_33244
LB_33243:
	bts r12,3
	stc
LB_33244:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33241
	btr r12,2
	clc
	jmp LB_33242
LB_33241:
	bts r12,2
	stc
LB_33242:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33239
	btr r12,1
	clc
	jmp LB_33240
LB_33239:
	bts r12,1
	stc
LB_33240:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33237
	btr r12,0
	clc
	jmp LB_33238
LB_33237:
	bts r12,0
	stc
LB_33238:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_33232
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_33298
	btr r12,6
	jmp LB_33299
LB_33298:
	bts r12,6
LB_33299:
	mov r9,r11
	bt r12,5
	jc LB_33300
	btr r12,3
	jmp LB_33301
LB_33300:
	bts r12,3
LB_33301:
	mov r11,r8
	bt r12,2
	jc LB_33302
	btr r12,5
	jmp LB_33303
LB_33302:
	bts r12,5
LB_33303:
	mov r8,r10
	bt r12,4
	jc LB_33304
	btr r12,2
	jmp LB_33305
LB_33304:
	bts r12,2
LB_33305:
	mov r10,r14
	bt r12,1
	jc LB_33306
	btr r12,4
	jmp LB_33307
LB_33306:
	bts r12,4
LB_33307:
	mov r14,r11
	bt r12,5
	jc LB_33308
	btr r12,1
	jmp LB_33309
LB_33308:
	bts r12,1
LB_33309:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_32780 : %_32780
 ; {>  %_32776~0':_r64 %_32778~2':_r64 %_32777~1':_r64 %_32779~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_32780
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_32780 %_32776 } ⊢ { %_32781 %_32782 } : { %_32781 %_32782 }
 ; {>  %_32776~0':_r64 %_32778~2':_r64 %_32780~4':_r64 %_32777~1':_r64 %_32779~3':_r64 }
	add r10,r13
; _f51 { %_32781 %_32777 } ⊢ { %_32783 %_32784 } : { %_32783 %_32784 }
 ; {>  %_32781~4':_r64 %_32778~2':_r64 %_32777~1':_r64 %_32782~0':_r64 %_32779~3':_r64 }
	add r10,r14
; _f51 { %_32783 %_32778 } ⊢ { %_32785 %_32786 } : { %_32785 %_32786 }
 ; {>  %_32784~1':_r64 %_32778~2':_r64 %_32783~4':_r64 %_32782~0':_r64 %_32779~3':_r64 }
	add r10,r8
; _f51 { %_32785 %_32779 } ⊢ { %_32787 %_32788 } : { %_32787 %_32788 }
 ; {>  %_32784~1':_r64 %_32786~2':_r64 %_32785~4':_r64 %_32782~0':_r64 %_32779~3':_r64 }
	add r10,r9
; _some %_32787 ⊢ %_32789 : %_32789
 ; {>  %_32784~1':_r64 %_32786~2':_r64 %_32788~3':_r64 %_32787~4':_r64 %_32782~0':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_32789
 ; {>  %_32784~1':_r64 %_32786~2':_r64 %_32789~°0◂4':(_opn)◂(_r64) %_32788~3':_r64 %_32782~0':_r64 }
; 	∎ °0◂4'
	bt r12,1
	jc LB_33226
	mov rdi,r14
	call dlt
LB_33226:
	bt r12,2
	jc LB_33227
	mov rdi,r8
	call dlt
LB_33227:
	bt r12,3
	jc LB_33228
	mov rdi,r9
	call dlt
LB_33228:
	bt r12,0
	jc LB_33229
	mov rdi,r13
	call dlt
LB_33229:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_33230
	btr r12,3
	jmp LB_33231
LB_33230:
	bts r12,3
LB_33231:
	mov r8,0
	bts r12,2
	ret
LB_33232:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33234
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33233
LB_33234:
	add rsp,8
	ret
LB_33236:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_33235:
	add rsp,96
	pop r14
LB_33233:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_32704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33324
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33316
LB_33324:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_32707_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33330
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33330:
	jmp LB_33316
LB_33329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33319
	btr r12,1
	clc
	jmp LB_33320
LB_33319:
	bts r12,1
	stc
LB_33320:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33317
	btr r12,0
	clc
	jmp LB_33318
LB_33317:
	bts r12,0
	stc
LB_33318:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_33313
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f51 { %_32790 %_32791 } ⊢ { %_32792 %_32793 } : { %_32792 %_32793 }
 ; {>  %_32790~0':_r64 %_32791~1':_r64 }
	add r13,r14
; _some %_32792 ⊢ %_32794 : %_32794
 ; {>  %_32792~0':_r64 %_32793~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_32794
 ; {>  %_32794~°0◂0':(_opn)◂(_r64) %_32793~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_33310
	mov rdi,r14
	call dlt
LB_33310:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33311
	btr r12,3
	jmp LB_33312
LB_33311:
	bts r12,3
LB_33312:
	mov r8,0
	bts r12,2
	ret
LB_33313:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33315
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33314
LB_33315:
	add rsp,8
	ret
LB_33316:
	add rsp,32
	pop r14
LB_33314:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33354:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_33354:
MTC_LB_33355:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_33356
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_33357
	bt QWORD [rdi],0
	jc LB_33358
	btr r12,7
	clc
	jmp LB_33359
LB_33358:
	bts r12,7
	stc
LB_33359:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33357:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_33362
	btr r12,8
	clc
	jmp LB_33363
LB_33362:
	bts r12,8
	stc
LB_33363:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_33360
	btr r12,5
	jmp LB_33361
LB_33360:
	bts r12,5
LB_33361:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_33366
	btr r12,8
	clc
	jmp LB_33367
LB_33366:
	bts r12,8
	stc
LB_33367:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_33364
	btr r12,6
	jmp LB_33365
LB_33364:
	bts r12,6
LB_33365:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_33368:
	cmp r15,0
	jz LB_33369
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33368
LB_33369:
MTC_LB_33370:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_33371
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_33372
	bt QWORD [rdi],0
	jc LB_33373
	btr r12,7
	clc
	jmp LB_33374
LB_33373:
	bts r12,7
	stc
LB_33374:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33372:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_33375
	btr r12,4
	jmp LB_33376
LB_33375:
	bts r12,4
LB_33376:
LB_33377:
	cmp r15,0
	jz LB_33378
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33377
LB_33378:
; _f53 %_33339 ⊢ { %_33340 %_33341 } : { %_33340 %_33341 }
 ; {>  %_33332~0':_stg %_33333~1':_r64 %_33338~6':(_lst)◂(_p32701) %_33339~4':_r64 %_33334~2':_stg %_33335~3':_r64 }
	mov r11,r10
	bts r12,5
; _f35 { %_33341 %_33332 %_33333 %_33334 %_33335 } ⊢ { %_33342 %_33343 %_33344 %_33345 %_33346 } : { %_33342 %_33343 %_33344 %_33345 %_33346 }
 ; {>  %_33332~0':_stg %_33333~1':_r64 %_33341~5':_r64 %_33340~4':_r64 %_33338~6':(_lst)◂(_p32701) %_33334~2':_stg %_33335~3':_r64 }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_33383
	btr r12,4
	jmp LB_33384
LB_33383:
	bts r12,4
LB_33384:
	mov r9,r8
	bt r12,2
	jc LB_33385
	btr r12,3
	jmp LB_33386
LB_33385:
	bts r12,3
LB_33386:
	mov r8,r14
	bt r12,1
	jc LB_33387
	btr r12,2
	jmp LB_33388
LB_33387:
	bts r12,2
LB_33388:
	mov r14,r13
	bt r12,0
	jc LB_33389
	btr r12,1
	jmp LB_33390
LB_33389:
	bts r12,1
LB_33390:
	mov r13,r11
	bt r12,5
	jc LB_33391
	btr r12,0
	jmp LB_33392
LB_33391:
	bts r12,0
LB_33392:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_33393
	btr r12,5
	jmp LB_33394
LB_33393:
	bts r12,5
LB_33394:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_33381
	btr r12,6
	clc
	jmp LB_33382
LB_33381:
	bts r12,6
	stc
LB_33382:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_33379
	btr r12,4
	clc
	jmp LB_33380
LB_33379:
	bts r12,4
	stc
LB_33380:
	add rsp,24
; _f33354 { %_33343 %_33344 %_33345 %_33346 %_33338 } ⊢ { %_33347 %_33348 } : { %_33347 %_33348 }
 ; {>  %_33340~4':_r64 %_33338~6':(_lst)◂(_p32701) %_33345~3':_stg %_33346~5':_r64 %_33343~1':_stg %_33342~0':_r64 %_33344~2':_r64 }
; _f33354 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_33399
	btr r12,0
	jmp LB_33400
LB_33399:
	bts r12,0
LB_33400:
	mov r14,r8
	bt r12,2
	jc LB_33401
	btr r12,1
	jmp LB_33402
LB_33401:
	bts r12,1
LB_33402:
	mov r8,r9
	bt r12,3
	jc LB_33403
	btr r12,2
	jmp LB_33404
LB_33403:
	bts r12,2
LB_33404:
	mov r9,r11
	bt r12,5
	jc LB_33405
	btr r12,3
	jmp LB_33406
LB_33405:
	bts r12,3
LB_33406:
	mov r10,rcx
	bt r12,6
	jc LB_33407
	btr r12,4
	jmp LB_33408
LB_33407:
	bts r12,4
LB_33408:
	call NS_E_33354
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_33409
	btr r12,2
	jmp LB_33410
LB_33409:
	bts r12,2
LB_33410:
	mov r14,r13
	bt r12,0
	jc LB_33411
	btr r12,1
	jmp LB_33412
LB_33411:
	bts r12,1
LB_33412:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_33397
	btr r12,4
	clc
	jmp LB_33398
LB_33397:
	bts r12,4
	stc
LB_33398:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_33395
	btr r12,0
	clc
	jmp LB_33396
LB_33395:
	bts r12,0
	stc
LB_33396:
	add rsp,24
; ∎ { %_33347 %_33348 }
 ; {>  %_33348~2':_stg %_33340~4':_r64 %_33347~1':_stg %_33342~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_33413
	mov rdi,r10
	call dlt
LB_33413:
	bt r12,0
	jc LB_33414
	mov rdi,r13
	call dlt
LB_33414:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_33415
	btr r12,0
	jmp LB_33416
LB_33415:
	bts r12,0
LB_33416:
	mov r14,r8
	bt r12,2
	jc LB_33417
	btr r12,1
	jmp LB_33418
LB_33417:
	bts r12,1
LB_33418:
	ret
MTC_LB_33371:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_33419
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_33420
	bt QWORD [rdi],0
	jc LB_33421
	btr r12,7
	clc
	jmp LB_33422
LB_33421:
	bts r12,7
	stc
LB_33422:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33420:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_33423
	btr r12,4
	jmp LB_33424
LB_33423:
	bts r12,4
LB_33424:
LB_33425:
	cmp r15,0
	jz LB_33426
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33425
LB_33426:
; _f51 { %_33333 %_33349 } ⊢ { %_33350 %_33351 } : { %_33350 %_33351 }
 ; {>  %_33332~0':_stg %_33333~1':_r64 %_33349~4':_r64 %_33338~6':(_lst)◂(_p32701) %_33334~2':_stg %_33335~3':_r64 }
	add r14,r10
; _f33354 { %_33332 %_33350 %_33334 %_33335 %_33338 } ⊢ { %_33352 %_33353 } : { %_33352 %_33353 }
 ; {>  %_33351~4':_r64 %_33332~0':_stg %_33338~6':(_lst)◂(_p32701) %_33350~1':_r64 %_33334~2':_stg %_33335~3':_r64 }
; _f33354 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_33429
	btr r12,4
	jmp LB_33430
LB_33429:
	bts r12,4
LB_33430:
	call NS_E_33354
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_33427
	btr r12,4
	clc
	jmp LB_33428
LB_33427:
	bts r12,4
	stc
LB_33428:
	add rsp,16
; ∎ { %_33352 %_33353 }
 ; {>  %_33351~4':_r64 %_33352~0':_stg %_33353~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_33431
	mov rdi,r10
	call dlt
LB_33431:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_33419:
MTC_LB_33356:
	mov r15,0
LB_33433:
	cmp r15,0
	jz LB_33434
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33433
LB_33434:
; ∎ { %_33332 %_33334 }
 ; {>  %_33332~0':_stg %_33333~1':_r64 %_33334~2':_stg %_33335~3':_r64 %_33336~4':(_lst)◂(_p32701) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_33435
	mov rdi,r14
	call dlt
LB_33435:
	bt r12,3
	jc LB_33436
	mov rdi,r9
	call dlt
LB_33436:
	bt r12,4
	jc LB_33437
	mov rdi,r10
	call dlt
LB_33437:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_33438
	btr r12,1
	jmp LB_33439
LB_33438:
	bts r12,1
LB_33439:
	ret
MTC_LB_33432:
NS_E_33455:
; 	|» 0'
NS_E_RDI_33455:
; » 0xr0 |~ {  } ⊢ %_33441 : %_33441
 ; {>  %_33440~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_33441
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f32706 { %_33440 %_33441 } ⊢ { %_33442 %_33443 %_33444 } : { %_33442 %_33443 %_33444 }
 ; {>  %_33440~0':_stg %_33441~1':_r64 }
; _f32706 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_32706
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_33456
	btr r12,4
	jmp LB_33457
LB_33456:
	bts r12,4
LB_33457:
	mov r8,r9
	bt r12,3
	jc LB_33460
	btr r12,2
	jmp LB_33461
LB_33460:
	bts r12,2
LB_33461:
	mov rsi,1
	bt r12,2
	jc LB_33458
	mov rsi,0
	bt r8,0
	jc LB_33458
	jmp LB_33459
LB_33458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_33459:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_33462:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_33463
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_33464
	bt QWORD [rdi],0
	jc LB_33465
	btr r12,5
	clc
	jmp LB_33466
LB_33465:
	bts r12,5
	stc
LB_33466:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33464:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_33469
	btr r12,6
	clc
	jmp LB_33470
LB_33469:
	bts r12,6
	stc
LB_33470:
	mov r9,rcx
	bt r12,6
	jc LB_33467
	btr r12,3
	jmp LB_33468
LB_33467:
	bts r12,3
LB_33468:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_33473
	btr r12,6
	clc
	jmp LB_33474
LB_33473:
	bts r12,6
	stc
LB_33474:
	mov r10,rcx
	bt r12,6
	jc LB_33471
	btr r12,4
	jmp LB_33472
LB_33471:
	bts r12,4
LB_33472:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_33475:
	cmp r15,0
	jz LB_33476
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33475
LB_33476:
; _f31 %_33445 ⊢ { %_33447 %_33448 } : { %_33447 %_33448 }
 ; {>  %_33442~0':_stg %_33446~4':(_lst)◂(_p32701) %_33445~3':_r64 %_33443~1':_r64 }
; _f31 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_33483
	btr r12,0
	jmp LB_33484
LB_33483:
	bts r12,0
LB_33484:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_33485
	btr r12,2
	jmp LB_33486
LB_33485:
	bts r12,2
LB_33486:
	mov r9,r14
	bt r12,1
	jc LB_33487
	btr r12,3
	jmp LB_33488
LB_33487:
	bts r12,3
LB_33488:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_33481
	btr r12,4
	clc
	jmp LB_33482
LB_33481:
	bts r12,4
	stc
LB_33482:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_33479
	btr r12,1
	clc
	jmp LB_33480
LB_33479:
	bts r12,1
	stc
LB_33480:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_33477
	btr r12,0
	clc
	jmp LB_33478
LB_33477:
	bts r12,0
	stc
LB_33478:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_33449 : %_33449
 ; {>  %_33442~0':_stg %_33446~4':(_lst)◂(_p32701) %_33448~3':_stg %_33447~2':_r64 %_33443~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_33449
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_33450 : %_33450
 ; {>  %_33449~5':_r64 %_33442~0':_stg %_33446~4':(_lst)◂(_p32701) %_33448~3':_stg %_33447~2':_r64 %_33443~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_33450
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f33354 { %_33442 %_33449 %_33448 %_33450 %_33446 } ⊢ { %_33451 %_33452 } : { %_33451 %_33452 }
 ; {>  %_33449~5':_r64 %_33450~6':_r64 %_33442~0':_stg %_33446~4':(_lst)◂(_p32701) %_33448~3':_stg %_33447~2':_r64 %_33443~1':_r64 }
; _f33354 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_33493
	btr r12,1
	jmp LB_33494
LB_33493:
	bts r12,1
LB_33494:
	mov r8,r9
	bt r12,3
	jc LB_33495
	btr r12,2
	jmp LB_33496
LB_33495:
	bts r12,2
LB_33496:
	mov r9,rcx
	bt r12,6
	jc LB_33497
	btr r12,3
	jmp LB_33498
LB_33497:
	bts r12,3
LB_33498:
	call NS_E_33354
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_33499
	btr r12,3
	jmp LB_33500
LB_33499:
	bts r12,3
LB_33500:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_33491
	btr r12,2
	clc
	jmp LB_33492
LB_33491:
	bts r12,2
	stc
LB_33492:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_33489
	btr r12,1
	clc
	jmp LB_33490
LB_33489:
	bts r12,1
	stc
LB_33490:
	add rsp,24
; _some %_33452 ⊢ %_33453 : %_33453
 ; {>  %_33452~3':_stg %_33451~0':_stg %_33447~2':_r64 %_33443~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_33451 %_33453 }
 ; {>  %_33451~0':_stg %_33453~°0◂3':(_opn)◂(_stg) %_33447~2':_r64 %_33443~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_33501
	mov rdi,r8
	call dlt
LB_33501:
	bt r12,1
	jc LB_33502
	mov rdi,r14
	call dlt
LB_33502:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_33505
	btr r12,1
	jmp LB_33506
LB_33505:
	bts r12,1
LB_33506:
	mov rsi,1
	bt r12,1
	jc LB_33503
	mov rsi,0
	bt r14,0
	jc LB_33503
	jmp LB_33504
LB_33503:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_33504:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_33463:
	mov r15,0
LB_33508:
	cmp r15,0
	jz LB_33509
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33508
LB_33509:
; _none {  } ⊢ %_33454 : %_33454
 ; {>  %_33442~0':_stg %_33444~2':(_opn)◂({ _r64 (_lst)◂(_p32701) }) %_33443~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_33442 %_33454 }
 ; {>  %_33442~0':_stg %_33454~°1◂{  }:(_opn)◂(t14092'(0)) %_33444~2':(_opn)◂({ _r64 (_lst)◂(_p32701) }) %_33443~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_33510
	mov rdi,r8
	call dlt
LB_33510:
	bt r12,1
	jc LB_33511
	mov rdi,r14
	call dlt
LB_33511:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_33512
	mov rsi,0
	bt r14,0
	jc LB_33512
	jmp LB_33513
LB_33512:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_33513:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_33507:
NS_E_33514:
NS_E_RDI_33514:
NS_E_33514_ETR_TBL:
NS_E_33514_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_33543
LB_33542:
	add r14,1
LB_33543:
	cmp r14,r10
	jge LB_33544
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33542
	cmp al,10
	jz LB_33542
	cmp al,32
	jz LB_33542
LB_33544:
	push r10
	call NS_E_30595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33545
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33535
LB_33545:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_33548
LB_33547:
	add r14,1
LB_33548:
	cmp r14,r10
	jge LB_33549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33547
	cmp al,10
	jz LB_33547
	cmp al,32
	jz LB_33547
LB_33549:
	add r14,1
	cmp r14,r10
	jg LB_33553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_33553
	jmp LB_33554
LB_33553:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33551
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33551:
	jmp LB_33535
LB_33554:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_33556
LB_33555:
	add r14,1
LB_33556:
	cmp r14,r10
	jge LB_33557
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33555
	cmp al,10
	jz LB_33555
	cmp al,32
	jz LB_33555
LB_33557:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33558
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33559
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33559:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33560
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33560:
	jmp LB_33535
LB_33558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33540
	btr r12,2
	clc
	jmp LB_33541
LB_33540:
	bts r12,2
	stc
LB_33541:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33538
	btr r12,1
	clc
	jmp LB_33539
LB_33538:
	bts r12,1
	stc
LB_33539:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33536
	btr r12,0
	clc
	jmp LB_33537
LB_33536:
	bts r12,0
	stc
LB_33537:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_33532
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_33562
	btr r12,3
	jmp LB_33563
LB_33562:
	bts r12,3
LB_33563:
	mov r14,r8
	bt r12,2
	jc LB_33564
	btr r12,1
	jmp LB_33565
LB_33564:
	bts r12,1
LB_33565:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f30642 { %_33515 %_33516 } ⊢ %_33517 : %_33517
 ; {>  %_33516~1':_p30641 %_33515~0':_stg }
; _f30642 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_33517 ⊢ %_33518 : %_33518
 ; {>  %_33517~°0◂{ 0' 1' }:_p30641 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_33518
 ; {>  %_33518~°0◂°0◂{ 0' 1' }:(_opn)◂(_p30641) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_33526
	btr r12,2
	jmp LB_33527
LB_33526:
	bts r12,2
LB_33527:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_33524
	btr QWORD [rdi],0
	jmp LB_33525
LB_33524:
	bts QWORD [rdi],0
LB_33525:
	mov r8,r14
	bt r12,1
	jc LB_33530
	btr r12,2
	jmp LB_33531
LB_33530:
	bts r12,2
LB_33531:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_33528
	btr QWORD [rdi],1
	jmp LB_33529
LB_33528:
	bts QWORD [rdi],1
LB_33529:
	mov rsi,1
	bt r12,3
	jc LB_33522
	mov rsi,0
	bt r9,0
	jc LB_33522
	jmp LB_33523
LB_33522:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33523:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33532:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33534
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33533
LB_33534:
	add rsp,8
	ret
LB_33535:
	add rsp,48
	pop r14
LB_33533:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_33577
LB_33576:
	add r14,1
LB_33577:
	cmp r14,r10
	jge LB_33578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33576
	cmp al,32
	jz LB_33576
LB_33578:
	push r10
	call NS_E_30595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33579
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33573
LB_33579:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33574
	btr r12,0
	clc
	jmp LB_33575
LB_33574:
	bts r12,0
	stc
LB_33575:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_33570
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30643 %_33519 ⊢ %_33520 : %_33520
 ; {>  %_33519~0':_stg }
; _f30643 0' ⊢ °1◂0'
; _some %_33520 ⊢ %_33521 : %_33521
 ; {>  %_33520~°1◂0':_p30641 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_33521
 ; {>  %_33521~°0◂°1◂0':(_opn)◂(_p30641) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33568
	btr r12,3
	jmp LB_33569
LB_33568:
	bts r12,3
LB_33569:
	mov rsi,1
	bt r12,3
	jc LB_33566
	mov rsi,0
	bt r9,0
	jc LB_33566
	jmp LB_33567
LB_33566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33567:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33570:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33572
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33571
LB_33572:
	add rsp,8
	ret
LB_33573:
	add rsp,16
	pop r14
LB_33571:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33581:
NS_E_RDI_33581:
NS_E_33581_ETR_TBL:
NS_E_33581_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_29816_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33606
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33598
LB_33606:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_33614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_33614
	jmp LB_33615
LB_33614:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33612
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33612:
	jmp LB_33598
LB_33615:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33601
	btr r12,1
	clc
	jmp LB_33602
LB_33601:
	bts r12,1
	stc
LB_33602:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33599
	btr r12,0
	clc
	jmp LB_33600
LB_33599:
	bts r12,0
	stc
LB_33600:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_33595
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f30690 %_33582 ⊢ %_33583 : %_33583
 ; {>  %_33582~0':_r64 }
; _f30690 0' ⊢ °0◂0'
; _some %_33583 ⊢ %_33584 : %_33584
 ; {>  %_33583~°0◂0':_p30689 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_33584
 ; {>  %_33584~°0◂°0◂0':(_opn)◂(_p30689) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33593
	btr r12,3
	jmp LB_33594
LB_33593:
	bts r12,3
LB_33594:
	mov rsi,1
	bt r12,3
	jc LB_33591
	mov rsi,0
	bt r9,0
	jc LB_33591
	jmp LB_33592
LB_33591:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33592:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33595:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33597
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33596
LB_33597:
	add rsp,8
	ret
LB_33598:
	add rsp,32
	pop r14
LB_33596:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_30092_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33629
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33623
LB_33629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33624
	btr r12,0
	clc
	jmp LB_33625
LB_33624:
	bts r12,0
	stc
LB_33625:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_33620
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30691 %_33585 ⊢ %_33586 : %_33586
 ; {>  %_33585~0':_stg }
; _f30691 0' ⊢ °1◂0'
; _some %_33586 ⊢ %_33587 : %_33587
 ; {>  %_33586~°1◂0':_p30689 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_33587
 ; {>  %_33587~°0◂°1◂0':(_opn)◂(_p30689) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33618
	btr r12,3
	jmp LB_33619
LB_33618:
	bts r12,3
LB_33619:
	mov rsi,1
	bt r12,3
	jc LB_33616
	mov rsi,0
	bt r9,0
	jc LB_33616
	jmp LB_33617
LB_33616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33617:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33620:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33622
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33621
LB_33622:
	add rsp,8
	ret
LB_33623:
	add rsp,16
	pop r14
LB_33621:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33644
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33638
LB_33644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33639
	btr r12,0
	clc
	jmp LB_33640
LB_33639:
	bts r12,0
	stc
LB_33640:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_33635
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30692 %_33588 ⊢ %_33589 : %_33589
 ; {>  %_33588~0':_p30641 }
; _f30692 0' ⊢ °2◂0'
; _some %_33589 ⊢ %_33590 : %_33590
 ; {>  %_33589~°2◂0':_p30689 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_33590
 ; {>  %_33590~°0◂°2◂0':(_opn)◂(_p30689) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33633
	btr r12,3
	jmp LB_33634
LB_33633:
	bts r12,3
LB_33634:
	mov rsi,1
	bt r12,3
	jc LB_33631
	mov rsi,0
	bt r9,0
	jc LB_33631
	jmp LB_33632
LB_33631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33632:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33635:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33637
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33636
LB_33637:
	add rsp,8
	ret
LB_33638:
	add rsp,16
	pop r14
LB_33636:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33647:
NS_E_RDI_33647:
NS_E_33647_ETR_TBL:
NS_E_33647_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_33654
LB_33653:
	add r14,1
LB_33654:
	cmp r14,r10
	jge LB_33655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33653
	cmp al,32
	jz LB_33653
LB_33655:
	add r14,1
	cmp r14,r10
	jg LB_33658
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_33658
	jmp LB_33659
LB_33658:
	jmp LB_33649
LB_33659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov rsi,0x01_00_0000_0000_0001
	or rdi,rsi
LB_33664:
	jmp LB_33661
LB_33660:
	add r14,1
LB_33661:
	cmp r14,r10
	jge LB_33662
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33660
	cmp al,32
	jz LB_33660
LB_33662:
	add r14,1
	cmp r14,r10
	jg LB_33663
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_33663
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_33664
LB_33663:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33650
	btr QWORD [rdi],1
LB_33650:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33651
	btr QWORD [rdi],0
LB_33651:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_33649:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33674:
; 	|» { 0' 1' }
NS_E_RDI_33674:
MTC_LB_33675:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_33676
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_33677
	bt QWORD [rdi],0
	jc LB_33678
	btr r12,4
	clc
	jmp LB_33679
LB_33678:
	bts r12,4
	stc
LB_33679:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33677:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_33682
	btr r12,5
	clc
	jmp LB_33683
LB_33682:
	bts r12,5
	stc
LB_33683:
	mov r8,r11
	bt r12,5
	jc LB_33680
	btr r12,2
	jmp LB_33681
LB_33680:
	bts r12,2
LB_33681:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_33686
	btr r12,5
	clc
	jmp LB_33687
LB_33686:
	bts r12,5
	stc
LB_33687:
	mov r9,r11
	bt r12,5
	jc LB_33684
	btr r12,3
	jmp LB_33685
LB_33684:
	bts r12,3
LB_33685:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_33688:
	cmp r15,0
	jz LB_33689
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33688
LB_33689:
; _f30777 { %_33668 %_33670 } ⊢ %_33672 : %_33672
 ; {>  %_33670~2':_p30743 %_33671~3':(_lst)◂(_p30743) %_33668~0':_p30743 }
; _f30777 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f33674 { %_33672 %_33671 } ⊢ %_33673 : %_33673
 ; {>  %_33672~°2◂{ 0' 2' }:_p30743 %_33671~3':(_lst)◂(_p30743) }
; _f33674 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_33690
	btr r12,1
	jmp LB_33691
LB_33690:
	bts r12,1
LB_33691:
	mov r9,r13
	bt r12,0
	jc LB_33692
	btr r12,3
	jmp LB_33693
LB_33692:
	bts r12,3
LB_33693:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_33698
	btr r12,4
	jmp LB_33699
LB_33698:
	bts r12,4
LB_33699:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_33696
	btr QWORD [rdi],0
	jmp LB_33697
LB_33696:
	bts QWORD [rdi],0
LB_33697:
	mov r10,r8
	bt r12,2
	jc LB_33702
	btr r12,4
	jmp LB_33703
LB_33702:
	bts r12,4
LB_33703:
	mov rdi,r13
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_33700
	btr QWORD [rdi],1
	jmp LB_33701
LB_33700:
	bts QWORD [rdi],1
LB_33701:
	mov rsi,1
	bt r12,0
	jc LB_33694
	mov rsi,0
	bt r13,0
	jc LB_33694
	jmp LB_33695
LB_33694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_33695:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_33674
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_33673
 ; {>  %_33673~0':_p30743 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_33676:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_33704
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_33705
	bt QWORD [rdi],0
	jc LB_33706
	btr r12,2
	clc
	jmp LB_33707
LB_33706:
	bts r12,2
	stc
LB_33707:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_33705:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_33708:
	cmp r15,0
	jz LB_33709
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_33708
LB_33709:
; ∎ %_33668
 ; {>  %_33668~0':_p30743 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_33704:
NS_E_33710:
NS_E_RDI_33710:
NS_E_33710_ETR_TBL:
NS_E_33710_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_33757
LB_33756:
	add r14,1
LB_33757:
	cmp r14,r10
	jge LB_33758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33756
	cmp al,10
	jz LB_33756
	cmp al,32
	jz LB_33756
LB_33758:
	add r14,1
	cmp r14,r10
	jg LB_33761
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_33761
	jmp LB_33762
LB_33761:
	jmp LB_33749
LB_33762:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_33764
LB_33763:
	add r14,1
LB_33764:
	cmp r14,r10
	jge LB_33765
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33763
	cmp al,10
	jz LB_33763
	cmp al,32
	jz LB_33763
LB_33765:
	push r10
	call NS_E_33711_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33766
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33767
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33767:
	jmp LB_33749
LB_33766:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_33770
LB_33769:
	add r14,1
LB_33770:
	cmp r14,r10
	jge LB_33771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33769
	cmp al,10
	jz LB_33769
	cmp al,32
	jz LB_33769
LB_33771:
	add r14,1
	cmp r14,r10
	jg LB_33776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_33776
	jmp LB_33777
LB_33776:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33773
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33773:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33774
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33774:
	jmp LB_33749
LB_33777:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33754
	btr r12,2
	clc
	jmp LB_33755
LB_33754:
	bts r12,2
	stc
LB_33755:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33752
	btr r12,1
	clc
	jmp LB_33753
LB_33752:
	bts r12,1
	stc
LB_33753:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33750
	btr r12,0
	clc
	jmp LB_33751
LB_33750:
	bts r12,0
	stc
LB_33751:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_33746
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_33778
	btr r12,3
	jmp LB_33779
LB_33778:
	bts r12,3
LB_33779:
	mov r13,r14
	bt r12,1
	jc LB_33780
	btr r12,0
	jmp LB_33781
LB_33780:
	bts r12,0
LB_33781:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30687 %_33714 ⊢ %_33715 : %_33715
 ; {>  %_33714~0':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30687 0' ⊢ °0◂0'
; _some %_33715 ⊢ %_33716 : %_33716
 ; {>  %_33715~°0◂0':(_p30686)◂((_p30693)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_33716
 ; {>  %_33716~°0◂°0◂0':(_opn)◂((_p30686)◂((_p30693)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33744
	btr r12,3
	jmp LB_33745
LB_33744:
	bts r12,3
LB_33745:
	mov rsi,1
	bt r12,3
	jc LB_33742
	mov rsi,0
	bt r9,0
	jc LB_33742
	jmp LB_33743
LB_33742:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33743:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33746:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33748
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33747
LB_33748:
	add rsp,8
	ret
LB_33749:
	add rsp,48
	pop r14
LB_33747:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_33793
LB_33792:
	add r14,1
LB_33793:
	cmp r14,r10
	jge LB_33794
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33792
	cmp al,10
	jz LB_33792
	cmp al,32
	jz LB_33792
LB_33794:
	push r10
	call NS_E_33713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33795
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33789
LB_33795:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33790
	btr r12,0
	clc
	jmp LB_33791
LB_33790:
	bts r12,0
	stc
LB_33791:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_33786
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30688 %_33717 ⊢ %_33718 : %_33718
 ; {>  %_33717~0':(_p30693)◂(_stg) }
; _f30688 0' ⊢ °1◂0'
; _some %_33718 ⊢ %_33719 : %_33719
 ; {>  %_33718~°1◂0':(_p30686)◂((_p30693)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_33719
 ; {>  %_33719~°0◂°1◂0':(_opn)◂((_p30686)◂((_p30693)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33784
	btr r12,3
	jmp LB_33785
LB_33784:
	bts r12,3
LB_33785:
	mov rsi,1
	bt r12,3
	jc LB_33782
	mov rsi,0
	bt r9,0
	jc LB_33782
	jmp LB_33783
LB_33782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33783:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33786:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33788
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33787
LB_33788:
	add rsp,8
	ret
LB_33789:
	add rsp,16
	pop r14
LB_33787:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33711:
NS_E_RDI_33711:
NS_E_33711_ETR_TBL:
NS_E_33711_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_33816
LB_33815:
	add r14,1
LB_33816:
	cmp r14,r10
	jge LB_33817
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33815
	cmp al,10
	jz LB_33815
	cmp al,32
	jz LB_33815
LB_33817:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33818
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33810
LB_33818:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_33821
LB_33820:
	add r14,1
LB_33821:
	cmp r14,r10
	jge LB_33822
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33820
	cmp al,10
	jz LB_33820
	cmp al,32
	jz LB_33820
LB_33822:
	push r10
	call NS_E_33711_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33823
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33824
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33824:
	jmp LB_33810
LB_33823:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33813
	btr r12,1
	clc
	jmp LB_33814
LB_33813:
	bts r12,1
	stc
LB_33814:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33811
	btr r12,0
	clc
	jmp LB_33812
LB_33811:
	bts r12,0
	stc
LB_33812:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_33807
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_33720 %_33721 } ⊢ %_33722 : %_33722
 ; {>  %_33721~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) %_33720~0':(_p30686)◂((_p30693)◂(_stg)) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_33722 ⊢ %_33723 : %_33723
 ; {>  %_33722~°0◂{ 0' 1' }:(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_33723
 ; {>  %_33723~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p30686)◂((_p30693)◂(_stg)))) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_33801
	btr r12,2
	jmp LB_33802
LB_33801:
	bts r12,2
LB_33802:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_33799
	btr QWORD [rdi],0
	jmp LB_33800
LB_33799:
	bts QWORD [rdi],0
LB_33800:
	mov r8,r14
	bt r12,1
	jc LB_33805
	btr r12,2
	jmp LB_33806
LB_33805:
	bts r12,2
LB_33806:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_33803
	btr QWORD [rdi],1
	jmp LB_33804
LB_33803:
	bts QWORD [rdi],1
LB_33804:
	mov rsi,1
	bt r12,3
	jc LB_33797
	mov rsi,0
	bt r9,0
	jc LB_33797
	jmp LB_33798
LB_33797:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33798:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33807:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33809
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33808
LB_33809:
	add rsp,8
	ret
LB_33810:
	add rsp,32
	pop r14
LB_33808:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_33828
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_33724 : %_33724
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_33724 ⊢ %_33725 : %_33725
 ; {>  %_33724~°1◂{  }:(_lst)◂(t14195'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_33725
 ; {>  %_33725~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14198'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_33826
	mov rsi,0
	bt r9,0
	jc LB_33826
	jmp LB_33827
LB_33826:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33827:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33828:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33830
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33829
LB_33830:
	add rsp,8
	ret
LB_33831:
	add rsp,0
	pop r14
LB_33829:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33712:
NS_E_RDI_33712:
NS_E_33712_ETR_TBL:
NS_E_33712_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_33869
LB_33868:
	add r14,1
LB_33869:
	cmp r14,r10
	jge LB_33870
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33868
	cmp al,10
	jz LB_33868
	cmp al,32
	jz LB_33868
LB_33870:
	add r14,1
	cmp r14,r10
	jg LB_33873
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_33873
	jmp LB_33874
LB_33873:
	jmp LB_33847
LB_33874:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_33856
LB_33855:
	add r14,1
LB_33856:
	cmp r14,r10
	jge LB_33857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33855
	cmp al,10
	jz LB_33855
	cmp al,32
	jz LB_33855
LB_33857:
	push r10
	call NS_E_33713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33858
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33859:
	jmp LB_33848
LB_33858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_33862
LB_33861:
	add r14,1
LB_33862:
	cmp r14,r10
	jge LB_33863
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33861
	cmp al,10
	jz LB_33861
	cmp al,32
	jz LB_33861
LB_33863:
	push r10
	call NS_E_33712_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33864
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33865
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33865:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33866
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33866:
	jmp LB_33848
LB_33864:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33853
	btr r12,2
	clc
	jmp LB_33854
LB_33853:
	bts r12,2
	stc
LB_33854:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33851
	btr r12,1
	clc
	jmp LB_33852
LB_33851:
	bts r12,1
	stc
LB_33852:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33849
	btr r12,0
	clc
	jmp LB_33850
LB_33849:
	bts r12,0
	stc
LB_33850:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_33844
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_33875
	btr r12,3
	jmp LB_33876
LB_33875:
	bts r12,3
LB_33876:
	mov r14,r8
	bt r12,2
	jc LB_33877
	btr r12,1
	jmp LB_33878
LB_33877:
	bts r12,1
LB_33878:
	mov r8,r13
	bt r12,0
	jc LB_33879
	btr r12,2
	jmp LB_33880
LB_33879:
	bts r12,2
LB_33880:
	mov r13,r9
	bt r12,3
	jc LB_33881
	btr r12,0
	jmp LB_33882
LB_33881:
	bts r12,0
LB_33882:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30688 %_33726 ⊢ %_33728 : %_33728
 ; {>  %_33727~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) %_33726~0':(_p30693)◂(_stg) }
; _f30688 0' ⊢ °1◂0'
; _cns { %_33728 %_33727 } ⊢ %_33729 : %_33729
 ; {>  %_33727~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) %_33728~°1◂0':(_p30686)◂((_p30693)◂(_stg)) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_33729 ⊢ %_33730 : %_33730
 ; {>  %_33729~°0◂{ °1◂0' 1' }:(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_33730
 ; {>  %_33730~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂((_p30686)◂((_p30693)◂(_stg)))) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_33838
	btr r12,2
	jmp LB_33839
LB_33838:
	bts r12,2
LB_33839:
	mov rsi,1
	bt r12,2
	jc LB_33836
	mov rsi,0
	bt r8,0
	jc LB_33836
	jmp LB_33837
LB_33836:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_33837:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_33834
	btr QWORD [rdi],0
	jmp LB_33835
LB_33834:
	bts QWORD [rdi],0
LB_33835:
	mov r8,r14
	bt r12,1
	jc LB_33842
	btr r12,2
	jmp LB_33843
LB_33842:
	bts r12,2
LB_33843:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_33840
	btr QWORD [rdi],1
	jmp LB_33841
LB_33840:
	bts QWORD [rdi],1
LB_33841:
	mov rsi,1
	bt r12,3
	jc LB_33832
	mov rsi,0
	bt r9,0
	jc LB_33832
	jmp LB_33833
LB_33832:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33833:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33844:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33846
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33845
LB_33846:
	add rsp,8
	ret
LB_33848:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_33847:
	add rsp,48
	pop r14
LB_33845:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_33885
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_33731 : %_33731
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_33731 ⊢ %_33732 : %_33732
 ; {>  %_33731~°1◂{  }:(_lst)◂(t14210'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_33732
 ; {>  %_33732~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14213'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_33883
	mov rsi,0
	bt r9,0
	jc LB_33883
	jmp LB_33884
LB_33883:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33884:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33885:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33887
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33886
LB_33887:
	add rsp,8
	ret
LB_33888:
	add rsp,0
	pop r14
LB_33886:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33713:
NS_E_RDI_33713:
NS_E_33713_ETR_TBL:
NS_E_33713_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_33904
LB_33903:
	add r14,1
LB_33904:
	cmp r14,r10
	jge LB_33905
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33903
	cmp al,10
	jz LB_33903
	cmp al,32
	jz LB_33903
LB_33905:
	add r14,2
	cmp r14,r10
	jg LB_33908
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_33908
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_33908
	jmp LB_33909
LB_33908:
	jmp LB_33896
LB_33909:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_33911
LB_33910:
	add r14,1
LB_33911:
	cmp r14,r10
	jge LB_33912
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33910
	cmp al,10
	jz LB_33910
	cmp al,32
	jz LB_33910
LB_33912:
	push r10
	call NS_E_33581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33913
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33914
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33914:
	jmp LB_33896
LB_33913:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_33917
LB_33916:
	add r14,1
LB_33917:
	cmp r14,r10
	jge LB_33918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33916
	cmp al,10
	jz LB_33916
	cmp al,32
	jz LB_33916
LB_33918:
	add r14,1
	cmp r14,r10
	jg LB_33923
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_33923
	jmp LB_33924
LB_33923:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_33920
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_33920:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33921
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33921:
	jmp LB_33896
LB_33924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_33901
	btr r12,2
	clc
	jmp LB_33902
LB_33901:
	bts r12,2
	stc
LB_33902:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33899
	btr r12,1
	clc
	jmp LB_33900
LB_33899:
	bts r12,1
	stc
LB_33900:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33897
	btr r12,0
	clc
	jmp LB_33898
LB_33897:
	bts r12,0
	stc
LB_33898:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_33893
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_33925
	btr r12,3
	jmp LB_33926
LB_33925:
	bts r12,3
LB_33926:
	mov r13,r14
	bt r12,1
	jc LB_33927
	btr r12,0
	jmp LB_33928
LB_33927:
	bts r12,0
LB_33928:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30695 %_33733 ⊢ %_33734 : %_33734
 ; {>  %_33733~0':_p30689 }
; _f30695 0' ⊢ °0◂0'
; _some %_33734 ⊢ %_33735 : %_33735
 ; {>  %_33734~°0◂0':(_p30693)◂(t14218'(0)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_33735
 ; {>  %_33735~°0◂°0◂0':(_opn)◂((_p30693)◂(t14221'(0))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33891
	btr r12,3
	jmp LB_33892
LB_33891:
	bts r12,3
LB_33892:
	mov rsi,1
	bt r12,3
	jc LB_33889
	mov rsi,0
	bt r9,0
	jc LB_33889
	jmp LB_33890
LB_33889:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33890:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33893:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33895
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33894
LB_33895:
	add rsp,8
	ret
LB_33896:
	add rsp,48
	pop r14
LB_33894:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_33953
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_33953
	jmp LB_33954
LB_33953:
	jmp LB_33936
LB_33954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_30595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33945
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_33946
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_33946:
	jmp LB_33937
LB_33945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_33940
	btr r12,1
	clc
	jmp LB_33941
LB_33940:
	bts r12,1
	stc
LB_33941:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33938
	btr r12,0
	clc
	jmp LB_33939
LB_33938:
	bts r12,0
	stc
LB_33939:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_33933
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_33955
	btr r12,2
	jmp LB_33956
LB_33955:
	bts r12,2
LB_33956:
	mov r13,r14
	bt r12,1
	jc LB_33957
	btr r12,0
	jmp LB_33958
LB_33957:
	bts r12,0
LB_33958:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30696 %_33736 ⊢ %_33737 : %_33737
 ; {>  %_33736~0':_stg }
; _f30696 0' ⊢ °1◂0'
; _some %_33737 ⊢ %_33738 : %_33738
 ; {>  %_33737~°1◂0':(_p30693)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_33738
 ; {>  %_33738~°0◂°1◂0':(_opn)◂((_p30693)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33931
	btr r12,3
	jmp LB_33932
LB_33931:
	bts r12,3
LB_33932:
	mov rsi,1
	bt r12,3
	jc LB_33929
	mov rsi,0
	bt r9,0
	jc LB_33929
	jmp LB_33930
LB_33929:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33930:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33933:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33935
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33934
LB_33935:
	add rsp,8
	ret
LB_33937:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_33936:
	add rsp,32
	pop r14
LB_33934:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_33970
LB_33969:
	add r14,1
LB_33970:
	cmp r14,r10
	jge LB_33971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_33969
	cmp al,10
	jz LB_33969
	cmp al,32
	jz LB_33969
LB_33971:
	push r10
	call NS_E_30595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_33972
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33966
LB_33972:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_33967
	btr r12,0
	clc
	jmp LB_33968
LB_33967:
	bts r12,0
	stc
LB_33968:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_33963
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30696 %_33739 ⊢ %_33740 : %_33740
 ; {>  %_33739~0':_stg }
; _f30696 0' ⊢ °1◂0'
; _some %_33740 ⊢ %_33741 : %_33741
 ; {>  %_33740~°1◂0':(_p30693)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_33741
 ; {>  %_33741~°0◂°1◂0':(_opn)◂((_p30693)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_33961
	btr r12,3
	jmp LB_33962
LB_33961:
	bts r12,3
LB_33962:
	mov rsi,1
	bt r12,3
	jc LB_33959
	mov rsi,0
	bt r9,0
	jc LB_33959
	jmp LB_33960
LB_33959:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_33960:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_33963:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_33965
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_33964
LB_33965:
	add rsp,8
	ret
LB_33966:
	add rsp,16
	pop r14
LB_33964:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33974:
NS_E_RDI_33974:
NS_E_33974_ETR_TBL:
NS_E_33974_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_34024
LB_34023:
	add r14,1
LB_34024:
	cmp r14,r10
	jge LB_34025
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34023
	cmp al,10
	jz LB_34023
	cmp al,32
	jz LB_34023
LB_34025:
	add r14,1
	cmp r14,r10
	jg LB_34028
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_34028
	jmp LB_34029
LB_34028:
	jmp LB_34016
LB_34029:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_34031
LB_34030:
	add r14,1
LB_34031:
	cmp r14,r10
	jge LB_34032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34030
	cmp al,10
	jz LB_34030
	cmp al,32
	jz LB_34030
LB_34032:
	push r10
	call NS_E_33975_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34033
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34034
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34034:
	jmp LB_34016
LB_34033:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_34037
LB_34036:
	add r14,1
LB_34037:
	cmp r14,r10
	jge LB_34038
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34036
	cmp al,10
	jz LB_34036
	cmp al,32
	jz LB_34036
LB_34038:
	add r14,1
	cmp r14,r10
	jg LB_34043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_34043
	jmp LB_34044
LB_34043:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34040
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34040:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34041
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34041:
	jmp LB_34016
LB_34044:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34021
	btr r12,2
	clc
	jmp LB_34022
LB_34021:
	bts r12,2
	stc
LB_34022:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34019
	btr r12,1
	clc
	jmp LB_34020
LB_34019:
	bts r12,1
	stc
LB_34020:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34017
	btr r12,0
	clc
	jmp LB_34018
LB_34017:
	bts r12,0
	stc
LB_34018:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_34013
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_34045
	btr r12,3
	jmp LB_34046
LB_34045:
	bts r12,3
LB_34046:
	mov r13,r14
	bt r12,1
	jc LB_34047
	btr r12,0
	jmp LB_34048
LB_34047:
	bts r12,0
LB_34048:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30687 %_33980 ⊢ %_33981 : %_33981
 ; {>  %_33980~0':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _f30687 0' ⊢ °0◂0'
; _some %_33981 ⊢ %_33982 : %_33982
 ; {>  %_33981~°0◂0':(_p30686)◂((_p30694)◂(_stg)) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_33982
 ; {>  %_33982~°0◂°0◂0':(_opn)◂((_p30686)◂((_p30694)◂(_stg))) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34011
	btr r12,3
	jmp LB_34012
LB_34011:
	bts r12,3
LB_34012:
	mov rsi,1
	bt r12,3
	jc LB_34009
	mov rsi,0
	bt r9,0
	jc LB_34009
	jmp LB_34010
LB_34009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34010:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34013:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34015
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34014
LB_34015:
	add rsp,8
	ret
LB_34016:
	add rsp,48
	pop r14
LB_34014:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_34060
LB_34059:
	add r14,1
LB_34060:
	cmp r14,r10
	jge LB_34061
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34059
	cmp al,10
	jz LB_34059
	cmp al,32
	jz LB_34059
LB_34061:
	push r10
	call NS_E_33979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34062
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34056
LB_34062:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34057
	btr r12,0
	clc
	jmp LB_34058
LB_34057:
	bts r12,0
	stc
LB_34058:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_34053
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30688 %_33983 ⊢ %_33984 : %_33984
 ; {>  %_33983~0':(_p30694)◂(_stg) }
; _f30688 0' ⊢ °1◂0'
; _some %_33984 ⊢ %_33985 : %_33985
 ; {>  %_33984~°1◂0':(_p30686)◂((_p30694)◂(_stg)) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_33985
 ; {>  %_33985~°0◂°1◂0':(_opn)◂((_p30686)◂((_p30694)◂(_stg))) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34051
	btr r12,3
	jmp LB_34052
LB_34051:
	bts r12,3
LB_34052:
	mov rsi,1
	bt r12,3
	jc LB_34049
	mov rsi,0
	bt r9,0
	jc LB_34049
	jmp LB_34050
LB_34049:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34050:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34053:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34055
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34054
LB_34055:
	add rsp,8
	ret
LB_34056:
	add rsp,16
	pop r14
LB_34054:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33975:
NS_E_RDI_33975:
NS_E_33975_ETR_TBL:
NS_E_33975_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_34083
LB_34082:
	add r14,1
LB_34083:
	cmp r14,r10
	jge LB_34084
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34082
	cmp al,10
	jz LB_34082
	cmp al,32
	jz LB_34082
LB_34084:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34085
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34077
LB_34085:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_34088
LB_34087:
	add r14,1
LB_34088:
	cmp r14,r10
	jge LB_34089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34087
	cmp al,10
	jz LB_34087
	cmp al,32
	jz LB_34087
LB_34089:
	push r10
	call NS_E_33975_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34090
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34091:
	jmp LB_34077
LB_34090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34080
	btr r12,1
	clc
	jmp LB_34081
LB_34080:
	bts r12,1
	stc
LB_34081:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34078
	btr r12,0
	clc
	jmp LB_34079
LB_34078:
	bts r12,0
	stc
LB_34079:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_34074
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_33986 %_33987 } ⊢ %_33988 : %_33988
 ; {>  %_33986~0':(_p30686)◂((_p30694)◂(_stg)) %_33987~1':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_33988 ⊢ %_33989 : %_33989
 ; {>  %_33988~°0◂{ 0' 1' }:(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_33989
 ; {>  %_33989~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂((_p30686)◂((_p30694)◂(_stg)))) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_34068
	btr r12,2
	jmp LB_34069
LB_34068:
	bts r12,2
LB_34069:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_34066
	btr QWORD [rdi],0
	jmp LB_34067
LB_34066:
	bts QWORD [rdi],0
LB_34067:
	mov r8,r14
	bt r12,1
	jc LB_34072
	btr r12,2
	jmp LB_34073
LB_34072:
	bts r12,2
LB_34073:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_34070
	btr QWORD [rdi],1
	jmp LB_34071
LB_34070:
	bts QWORD [rdi],1
LB_34071:
	mov rsi,1
	bt r12,3
	jc LB_34064
	mov rsi,0
	bt r9,0
	jc LB_34064
	jmp LB_34065
LB_34064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34065:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34074:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34076
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34075
LB_34076:
	add rsp,8
	ret
LB_34077:
	add rsp,32
	pop r14
LB_34075:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_34095
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_33990 : %_33990
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_33990 ⊢ %_33991 : %_33991
 ; {>  %_33990~°1◂{  }:(_lst)◂(t14312'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_33991
 ; {>  %_33991~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14315'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_34093
	mov rsi,0
	bt r9,0
	jc LB_34093
	jmp LB_34094
LB_34093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34094:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34095:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34097
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34096
LB_34097:
	add rsp,8
	ret
LB_34098:
	add rsp,0
	pop r14
LB_34096:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33977:
NS_E_RDI_33977:
NS_E_33977_ETR_TBL:
NS_E_33977_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_34121
LB_34120:
	add r14,1
LB_34121:
	cmp r14,r10
	jge LB_34122
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34120
	cmp al,10
	jz LB_34120
	cmp al,32
	jz LB_34120
LB_34122:
	add r14,1
	cmp r14,r10
	jg LB_34125
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_34125
	jmp LB_34126
LB_34125:
	jmp LB_34099
LB_34126:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_34108
LB_34107:
	add r14,1
LB_34108:
	cmp r14,r10
	jge LB_34109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34107
	cmp al,10
	jz LB_34107
	cmp al,32
	jz LB_34107
LB_34109:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34110
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34111
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34111:
	jmp LB_34100
LB_34110:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_34114
LB_34113:
	add r14,1
LB_34114:
	cmp r14,r10
	jge LB_34115
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34113
	cmp al,10
	jz LB_34113
	cmp al,32
	jz LB_34113
LB_34115:
	push r10
	call NS_E_33977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34116
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34117
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34117:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34118
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34118:
	jmp LB_34100
LB_34116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34103
	btr QWORD [rdi],2
LB_34103:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34104
	btr QWORD [rdi],1
LB_34104:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34105
	btr QWORD [rdi],0
LB_34105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_34100:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_34099:
	add rsp,48
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_34101:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33978:
NS_E_RDI_33978:
NS_E_33978_ETR_TBL:
NS_E_33978_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_34164
LB_34163:
	add r14,1
LB_34164:
	cmp r14,r10
	jge LB_34165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34163
	cmp al,10
	jz LB_34163
	cmp al,32
	jz LB_34163
LB_34165:
	add r14,1
	cmp r14,r10
	jg LB_34168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_34168
	jmp LB_34169
LB_34168:
	jmp LB_34142
LB_34169:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_34151
LB_34150:
	add r14,1
LB_34151:
	cmp r14,r10
	jge LB_34152
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34150
	cmp al,10
	jz LB_34150
	cmp al,32
	jz LB_34150
LB_34152:
	push r10
	call NS_E_33979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34153
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34154
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34154:
	jmp LB_34143
LB_34153:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_34157
LB_34156:
	add r14,1
LB_34157:
	cmp r14,r10
	jge LB_34158
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34156
	cmp al,10
	jz LB_34156
	cmp al,32
	jz LB_34156
LB_34158:
	push r10
	call NS_E_33978_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34159
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34160
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34160:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34161
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34161:
	jmp LB_34143
LB_34159:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34148
	btr r12,2
	clc
	jmp LB_34149
LB_34148:
	bts r12,2
	stc
LB_34149:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34146
	btr r12,1
	clc
	jmp LB_34147
LB_34146:
	bts r12,1
	stc
LB_34147:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34144
	btr r12,0
	clc
	jmp LB_34145
LB_34144:
	bts r12,0
	stc
LB_34145:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_34139
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_34170
	btr r12,3
	jmp LB_34171
LB_34170:
	bts r12,3
LB_34171:
	mov r14,r8
	bt r12,2
	jc LB_34172
	btr r12,1
	jmp LB_34173
LB_34172:
	bts r12,1
LB_34173:
	mov r8,r13
	bt r12,0
	jc LB_34174
	btr r12,2
	jmp LB_34175
LB_34174:
	bts r12,2
LB_34175:
	mov r13,r9
	bt r12,3
	jc LB_34176
	btr r12,0
	jmp LB_34177
LB_34176:
	bts r12,0
LB_34177:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30688 %_33994 ⊢ %_33996 : %_33996
 ; {>  %_33995~1':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_33994~0':(_p30694)◂(_stg) }
; _f30688 0' ⊢ °1◂0'
; _cns { %_33996 %_33995 } ⊢ %_33997 : %_33997
 ; {>  %_33995~1':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_33996~°1◂0':(_p30686)◂((_p30694)◂(_stg)) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_33997 ⊢ %_33998 : %_33998
 ; {>  %_33997~°0◂{ °1◂0' 1' }:(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_33998
 ; {>  %_33998~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂((_p30686)◂((_p30694)◂(_stg)))) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_34133
	btr r12,2
	jmp LB_34134
LB_34133:
	bts r12,2
LB_34134:
	mov rsi,1
	bt r12,2
	jc LB_34131
	mov rsi,0
	bt r8,0
	jc LB_34131
	jmp LB_34132
LB_34131:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_34132:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_34129
	btr QWORD [rdi],0
	jmp LB_34130
LB_34129:
	bts QWORD [rdi],0
LB_34130:
	mov r8,r14
	bt r12,1
	jc LB_34137
	btr r12,2
	jmp LB_34138
LB_34137:
	bts r12,2
LB_34138:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_34135
	btr QWORD [rdi],1
	jmp LB_34136
LB_34135:
	bts QWORD [rdi],1
LB_34136:
	mov rsi,1
	bt r12,3
	jc LB_34127
	mov rsi,0
	bt r9,0
	jc LB_34127
	jmp LB_34128
LB_34127:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34128:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34139:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34141
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34140
LB_34141:
	add rsp,8
	ret
LB_34143:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_34142:
	add rsp,48
	pop r14
LB_34140:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_34180
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_33999 : %_33999
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_33999 ⊢ %_34000 : %_34000
 ; {>  %_33999~°1◂{  }:(_lst)◂(t14327'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34000
 ; {>  %_34000~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14330'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_34178
	mov rsi,0
	bt r9,0
	jc LB_34178
	jmp LB_34179
LB_34178:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34179:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34180:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34182
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34181
LB_34182:
	add rsp,8
	ret
LB_34183:
	add rsp,0
	pop r14
LB_34181:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_33979:
NS_E_RDI_33979:
NS_E_33979_ETR_TBL:
NS_E_33979_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_34208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_34208
	jmp LB_34209
LB_34208:
	jmp LB_34191
LB_34209:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34200
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34201:
	jmp LB_34192
LB_34200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34195
	btr r12,1
	clc
	jmp LB_34196
LB_34195:
	bts r12,1
	stc
LB_34196:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34193
	btr r12,0
	clc
	jmp LB_34194
LB_34193:
	bts r12,0
	stc
LB_34194:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_34188
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_34210
	btr r12,2
	jmp LB_34211
LB_34210:
	bts r12,2
LB_34211:
	mov r13,r14
	bt r12,1
	jc LB_34212
	btr r12,0
	jmp LB_34213
LB_34212:
	bts r12,0
LB_34213:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30698 %_34001 ⊢ %_34002 : %_34002
 ; {>  %_34001~0':_stg }
; _f30698 0' ⊢ °1◂0'
; _some %_34002 ⊢ %_34003 : %_34003
 ; {>  %_34002~°1◂0':(_p30694)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34003
 ; {>  %_34003~°0◂°1◂0':(_opn)◂((_p30694)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34186
	btr r12,3
	jmp LB_34187
LB_34186:
	bts r12,3
LB_34187:
	mov rsi,1
	bt r12,3
	jc LB_34184
	mov rsi,0
	bt r9,0
	jc LB_34184
	jmp LB_34185
LB_34184:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34185:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34188:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34190
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34189
LB_34190:
	add rsp,8
	ret
LB_34192:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_34191:
	add rsp,32
	pop r14
LB_34189:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34227
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34221
LB_34227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34222
	btr r12,0
	clc
	jmp LB_34223
LB_34222:
	bts r12,0
	stc
LB_34223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_34218
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30698 %_34004 ⊢ %_34005 : %_34005
 ; {>  %_34004~0':_stg }
; _f30698 0' ⊢ °1◂0'
; _some %_34005 ⊢ %_34006 : %_34006
 ; {>  %_34005~°1◂0':(_p30694)◂(_stg) }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34006
 ; {>  %_34006~°0◂°1◂0':(_opn)◂((_p30694)◂(_stg)) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34216
	btr r12,3
	jmp LB_34217
LB_34216:
	bts r12,3
LB_34217:
	mov rsi,1
	bt r12,3
	jc LB_34214
	mov rsi,0
	bt r9,0
	jc LB_34214
	jmp LB_34215
LB_34214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34215:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34218:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34220
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34219
LB_34220:
	add rsp,8
	ret
LB_34221:
	add rsp,16
	pop r14
LB_34219:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_34242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_34242
	jmp LB_34243
LB_34242:
	jmp LB_34234
LB_34243:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34235
	btr r12,0
	clc
	jmp LB_34236
LB_34235:
	bts r12,0
	stc
LB_34236:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_34231
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30697 {  } ⊢ %_34007 : %_34007
 ; {>  }
; _f30697 {  } ⊢ °0◂{  }
; _some %_34007 ⊢ %_34008 : %_34008
 ; {>  %_34007~°0◂{  }:(_p30694)◂(t14344'(0)) }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_34008
 ; {>  %_34008~°0◂°0◂{  }:(_opn)◂((_p30694)◂(t14347'(0))) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_34229
	mov rsi,0
	bt r9,0
	jc LB_34229
	jmp LB_34230
LB_34229:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34230:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34231:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34233
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34232
LB_34233:
	add rsp,8
	ret
LB_34234:
	add rsp,16
	pop r14
LB_34232:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34244:
NS_E_RDI_34244:
NS_E_34244_ETR_TBL:
NS_E_34244_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_34322
LB_34321:
	add r14,1
LB_34322:
	cmp r14,r10
	jge LB_34323
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34321
	cmp al,10
	jz LB_34321
	cmp al,32
	jz LB_34321
LB_34323:
	push r10
	call NS_E_34247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34324
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34314
LB_34324:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_34327
LB_34326:
	add r14,1
LB_34327:
	cmp r14,r10
	jge LB_34328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34326
	cmp al,10
	jz LB_34326
	cmp al,32
	jz LB_34326
LB_34328:
	push r10
	call NS_E_34246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34330
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34330:
	jmp LB_34314
LB_34329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_34333
LB_34332:
	add r14,1
LB_34333:
	cmp r14,r10
	jge LB_34334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34332
	cmp al,10
	jz LB_34332
	cmp al,32
	jz LB_34332
LB_34334:
	push r10
	call NS_E_34245_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34335
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34336
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34336:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34337:
	jmp LB_34314
LB_34335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34319
	btr r12,2
	clc
	jmp LB_34320
LB_34319:
	bts r12,2
	stc
LB_34320:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34317
	btr r12,1
	clc
	jmp LB_34318
LB_34317:
	bts r12,1
	stc
LB_34318:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34315
	btr r12,0
	clc
	jmp LB_34316
LB_34315:
	bts r12,0
	stc
LB_34316:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_34311
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f33674 { %_34249 %_34250 } ⊢ %_34252 : %_34252
 ; {>  %_34250~1':(_lst)◂(_p30743) %_34249~0':_p30743 %_34251~2':(_opn)◂(_p30743) }
; _f33674 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_33674
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_34282
	btr r12,2
	clc
	jmp LB_34283
LB_34282:
	bts r12,2
	stc
LB_34283:
	add rsp,16
MTC_LB_34284:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_34285
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_34286
	bt QWORD [rdi],0
	jc LB_34287
	btr r12,3
	clc
	jmp LB_34288
LB_34287:
	bts r12,3
	stc
LB_34288:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_34286:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_34289
	btr r12,1
	jmp LB_34290
LB_34289:
	bts r12,1
LB_34290:
LB_34291:
	cmp r15,0
	jz LB_34292
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_34291
LB_34292:
; _f30776 { %_34252 %_34253 } ⊢ %_34254 : %_34254
 ; {>  %_34253~1':_p30743 %_34252~0':_p30743 }
; _f30776 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_34254 ⊢ %_34255 : %_34255
 ; {>  %_34254~°1◂{ 0' 1' }:_p30743 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_34255
 ; {>  %_34255~°0◂°1◂{ 0' 1' }:(_opn)◂(_p30743) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_34297
	btr r12,2
	jmp LB_34298
LB_34297:
	bts r12,2
LB_34298:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_34295
	btr QWORD [rdi],0
	jmp LB_34296
LB_34295:
	bts QWORD [rdi],0
LB_34296:
	mov r8,r14
	bt r12,1
	jc LB_34301
	btr r12,2
	jmp LB_34302
LB_34301:
	bts r12,2
LB_34302:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_34299
	btr QWORD [rdi],1
	jmp LB_34300
LB_34299:
	bts QWORD [rdi],1
LB_34300:
	mov rsi,1
	bt r12,3
	jc LB_34293
	mov rsi,0
	bt r9,0
	jc LB_34293
	jmp LB_34294
LB_34293:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34294:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_34285:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_34303
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_34304
	bt QWORD [rdi],0
	jc LB_34305
	btr r12,1
	clc
	jmp LB_34306
LB_34305:
	bts r12,1
	stc
LB_34306:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_34304:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_34307:
	cmp r15,0
	jz LB_34308
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_34307
LB_34308:
; _some %_34252 ⊢ %_34256 : %_34256
 ; {>  %_34252~0':_p30743 }
; _some 0' ⊢ °0◂0'
; ∎ %_34256
 ; {>  %_34256~°0◂0':(_opn)◂(_p30743) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34309
	btr r12,3
	jmp LB_34310
LB_34309:
	bts r12,3
LB_34310:
	mov r8,0
	bts r12,2
	ret
MTC_LB_34303:
LB_34311:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34313
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34312
LB_34313:
	add rsp,8
	ret
LB_34314:
	add rsp,48
	pop r14
LB_34312:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34245:
NS_E_RDI_34245:
NS_E_34245_ETR_TBL:
NS_E_34245_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_34352
LB_34351:
	add r14,1
LB_34352:
	cmp r14,r10
	jge LB_34353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34351
	cmp al,10
	jz LB_34351
	cmp al,32
	jz LB_34351
LB_34353:
	add r14,3
	cmp r14,r10
	jg LB_34356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_34356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_34356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_34356
	jmp LB_34357
LB_34356:
	jmp LB_34346
LB_34357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_34359
LB_34358:
	add r14,1
LB_34359:
	cmp r14,r10
	jge LB_34360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34358
	cmp al,10
	jz LB_34358
	cmp al,32
	jz LB_34358
LB_34360:
	push r10
	call NS_E_34244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34361
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34362:
	jmp LB_34346
LB_34361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34349
	btr r12,1
	clc
	jmp LB_34350
LB_34349:
	bts r12,1
	stc
LB_34350:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34347
	btr r12,0
	clc
	jmp LB_34348
LB_34347:
	bts r12,0
	stc
LB_34348:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_34343
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_34364
	btr r12,2
	jmp LB_34365
LB_34364:
	bts r12,2
LB_34365:
	mov r13,r14
	bt r12,1
	jc LB_34366
	btr r12,0
	jmp LB_34367
LB_34366:
	bts r12,0
LB_34367:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34257 ⊢ %_34258 : %_34258
 ; {>  %_34257~0':_p30743 }
; _some 0' ⊢ °0◂0'
; _some %_34258 ⊢ %_34259 : %_34259
 ; {>  %_34258~°0◂0':(_opn)◂(_p30743) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34259
 ; {>  %_34259~°0◂°0◂0':(_opn)◂((_opn)◂(_p30743)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34341
	btr r12,3
	jmp LB_34342
LB_34341:
	bts r12,3
LB_34342:
	mov rsi,1
	bt r12,3
	jc LB_34339
	mov rsi,0
	bt r9,0
	jc LB_34339
	jmp LB_34340
LB_34339:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34340:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34343:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34345
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34344
LB_34345:
	add rsp,8
	ret
LB_34346:
	add rsp,32
	pop r14
LB_34344:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_34370
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_34260 : %_34260
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_34260 ⊢ %_34261 : %_34261
 ; {>  %_34260~°1◂{  }:(_opn)◂(t14433'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34261
 ; {>  %_34261~°0◂°1◂{  }:(_opn)◂((_opn)◂(t14436'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_34368
	mov rsi,0
	bt r9,0
	jc LB_34368
	jmp LB_34369
LB_34368:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34369:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34370:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34372
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34371
LB_34372:
	add rsp,8
	ret
LB_34373:
	add rsp,0
	pop r14
LB_34371:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34246:
NS_E_RDI_34246:
NS_E_34246_ETR_TBL:
NS_E_34246_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_34395
LB_34394:
	add r14,1
LB_34395:
	cmp r14,r10
	jge LB_34396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34394
	cmp al,10
	jz LB_34394
	cmp al,32
	jz LB_34394
LB_34396:
	add r14,3
	cmp r14,r10
	jg LB_34399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_34399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_34399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_34399
	jmp LB_34400
LB_34399:
	jmp LB_34387
LB_34400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_34402
LB_34401:
	add r14,1
LB_34402:
	cmp r14,r10
	jge LB_34403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34401
	cmp al,10
	jz LB_34401
	cmp al,32
	jz LB_34401
LB_34403:
	push r10
	call NS_E_34247_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34404
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34405:
	jmp LB_34387
LB_34404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_34408
LB_34407:
	add r14,1
LB_34408:
	cmp r14,r10
	jge LB_34409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34407
	cmp al,10
	jz LB_34407
	cmp al,32
	jz LB_34407
LB_34409:
	push r10
	call NS_E_34246_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34410
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34411
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34411:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34412
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34412:
	jmp LB_34387
LB_34410:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34392
	btr r12,2
	clc
	jmp LB_34393
LB_34392:
	bts r12,2
	stc
LB_34393:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34390
	btr r12,1
	clc
	jmp LB_34391
LB_34390:
	bts r12,1
	stc
LB_34391:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34388
	btr r12,0
	clc
	jmp LB_34389
LB_34388:
	bts r12,0
	stc
LB_34389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_34384
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_34414
	btr r12,3
	jmp LB_34415
LB_34414:
	bts r12,3
LB_34415:
	mov r14,r8
	bt r12,2
	jc LB_34416
	btr r12,1
	jmp LB_34417
LB_34416:
	bts r12,1
LB_34417:
	mov r8,r13
	bt r12,0
	jc LB_34418
	btr r12,2
	jmp LB_34419
LB_34418:
	bts r12,2
LB_34419:
	mov r13,r9
	bt r12,3
	jc LB_34420
	btr r12,0
	jmp LB_34421
LB_34420:
	bts r12,0
LB_34421:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_34262 %_34263 } ⊢ %_34264 : %_34264
 ; {>  %_34263~1':(_lst)◂(_p30743) %_34262~0':_p30743 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34264 ⊢ %_34265 : %_34265
 ; {>  %_34264~°0◂{ 0' 1' }:(_lst)◂(_p30743) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34265
 ; {>  %_34265~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p30743)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_34378
	btr r12,2
	jmp LB_34379
LB_34378:
	bts r12,2
LB_34379:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_34376
	btr QWORD [rdi],0
	jmp LB_34377
LB_34376:
	bts QWORD [rdi],0
LB_34377:
	mov r8,r14
	bt r12,1
	jc LB_34382
	btr r12,2
	jmp LB_34383
LB_34382:
	bts r12,2
LB_34383:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_34380
	btr QWORD [rdi],1
	jmp LB_34381
LB_34380:
	bts QWORD [rdi],1
LB_34381:
	mov rsi,1
	bt r12,3
	jc LB_34374
	mov rsi,0
	bt r9,0
	jc LB_34374
	jmp LB_34375
LB_34374:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34375:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34386
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34385
LB_34386:
	add rsp,8
	ret
LB_34387:
	add rsp,48
	pop r14
LB_34385:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_34424
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_34266 : %_34266
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34266 ⊢ %_34267 : %_34267
 ; {>  %_34266~°1◂{  }:(_lst)◂(t14446'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34267
 ; {>  %_34267~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14449'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_34422
	mov rsi,0
	bt r9,0
	jc LB_34422
	jmp LB_34423
LB_34422:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34423:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34425
LB_34426:
	add rsp,8
	ret
LB_34427:
	add rsp,0
	pop r14
LB_34425:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34247:
NS_E_RDI_34247:
NS_E_34247_ETR_TBL:
NS_E_34247_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_34443
LB_34442:
	add r14,1
LB_34443:
	cmp r14,r10
	jge LB_34444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34442
	cmp al,10
	jz LB_34442
	cmp al,32
	jz LB_34442
LB_34444:
	add r14,1
	cmp r14,r10
	jg LB_34447
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_34447
	jmp LB_34448
LB_34447:
	jmp LB_34435
LB_34448:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_34453:
	jmp LB_34450
LB_34449:
	add r14,1
LB_34450:
	cmp r14,r10
	jge LB_34451
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34449
	cmp al,10
	jz LB_34449
	cmp al,32
	jz LB_34449
LB_34451:
	push r10
	push rsi
	call NS_E_34244_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_34452
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_34454
	bts QWORD [rax],0
LB_34454:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_34453
LB_34452:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_34456
LB_34455:
	add r14,1
LB_34456:
	cmp r14,r10
	jge LB_34457
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34455
	cmp al,10
	jz LB_34455
	cmp al,32
	jz LB_34455
LB_34457:
	add r14,1
	cmp r14,r10
	jg LB_34462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_34462
	jmp LB_34463
LB_34462:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34459
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34459:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34460
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34460:
	jmp LB_34435
LB_34463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34440
	btr r12,2
	clc
	jmp LB_34441
LB_34440:
	bts r12,2
	stc
LB_34441:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34438
	btr r12,1
	clc
	jmp LB_34439
LB_34438:
	bts r12,1
	stc
LB_34439:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34436
	btr r12,0
	clc
	jmp LB_34437
LB_34436:
	bts r12,0
	stc
LB_34437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_34432
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_34464
	btr r12,3
	jmp LB_34465
LB_34464:
	bts r12,3
LB_34465:
	mov r13,r14
	bt r12,1
	jc LB_34466
	btr r12,0
	jmp LB_34467
LB_34466:
	bts r12,0
LB_34467:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f29875 %_34268 ⊢ %_34269 : %_34269
 ; {>  %_34268~0':(_lst)◂(_p30743) }
; _f29875 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_29875
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f30775 %_34269 ⊢ %_34270 : %_34270
 ; {>  %_34269~0':(_lst)◂(_p30743) }
; _f30775 0' ⊢ °0◂0'
; _some %_34270 ⊢ %_34271 : %_34271
 ; {>  %_34270~°0◂0':_p30743 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34271
 ; {>  %_34271~°0◂°0◂0':(_opn)◂(_p30743) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34430
	btr r12,3
	jmp LB_34431
LB_34430:
	bts r12,3
LB_34431:
	mov rsi,1
	bt r12,3
	jc LB_34428
	mov rsi,0
	bt r9,0
	jc LB_34428
	jmp LB_34429
LB_34428:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34429:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34432:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34434
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34433
LB_34434:
	add rsp,8
	ret
LB_34435:
	add rsp,48
	pop r14
LB_34433:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_34481
LB_34480:
	add r14,1
LB_34481:
	cmp r14,r10
	jge LB_34482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34480
	cmp al,10
	jz LB_34480
	cmp al,32
	jz LB_34480
LB_34482:
	add r14,1
	cmp r14,r10
	jg LB_34485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_34485
	jmp LB_34486
LB_34485:
	jmp LB_34473
LB_34486:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_34488
LB_34487:
	add r14,1
LB_34488:
	cmp r14,r10
	jge LB_34489
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34487
	cmp al,10
	jz LB_34487
	cmp al,32
	jz LB_34487
LB_34489:
	push r10
	call NS_E_34244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34490
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34491
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34491:
	jmp LB_34473
LB_34490:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_34494
LB_34493:
	add r14,1
LB_34494:
	cmp r14,r10
	jge LB_34495
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34493
	cmp al,10
	jz LB_34493
	cmp al,32
	jz LB_34493
LB_34495:
	add r14,1
	cmp r14,r10
	jg LB_34500
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_34500
	jmp LB_34501
LB_34500:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_34497
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_34497:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34498
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34498:
	jmp LB_34473
LB_34501:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_34478
	btr r12,2
	clc
	jmp LB_34479
LB_34478:
	bts r12,2
	stc
LB_34479:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34476
	btr r12,1
	clc
	jmp LB_34477
LB_34476:
	bts r12,1
	stc
LB_34477:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34474
	btr r12,0
	clc
	jmp LB_34475
LB_34474:
	bts r12,0
	stc
LB_34475:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_34470
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_34502
	btr r12,3
	jmp LB_34503
LB_34502:
	bts r12,3
LB_34503:
	mov r13,r14
	bt r12,1
	jc LB_34504
	btr r12,0
	jmp LB_34505
LB_34504:
	bts r12,0
LB_34505:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34272 ⊢ %_34273 : %_34273
 ; {>  %_34272~0':_p30743 }
; _some 0' ⊢ °0◂0'
; ∎ %_34273
 ; {>  %_34273~°0◂0':(_opn)◂(_p30743) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34468
	btr r12,3
	jmp LB_34469
LB_34468:
	bts r12,3
LB_34469:
	mov r8,0
	bts r12,2
	ret
LB_34470:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34472
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34471
LB_34472:
	add rsp,8
	ret
LB_34473:
	add rsp,48
	pop r14
LB_34471:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_34517
LB_34516:
	add r14,1
LB_34517:
	cmp r14,r10
	jge LB_34518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34516
	cmp al,10
	jz LB_34516
	cmp al,32
	jz LB_34516
LB_34518:
	push r10
	call NS_E_34248_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34519
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34513
LB_34519:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34514
	btr r12,0
	clc
	jmp LB_34515
LB_34514:
	bts r12,0
	stc
LB_34515:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_34510
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30779 %_34274 ⊢ %_34275 : %_34275
 ; {>  %_34274~0':_stg }
; _f30779 0' ⊢ °4◂0'
; _some %_34275 ⊢ %_34276 : %_34276
 ; {>  %_34275~°4◂0':_p30743 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_34276
 ; {>  %_34276~°0◂°4◂0':(_opn)◂(_p30743) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34508
	btr r12,3
	jmp LB_34509
LB_34508:
	bts r12,3
LB_34509:
	mov rsi,1
	bt r12,3
	jc LB_34506
	mov rsi,0
	bt r9,0
	jc LB_34506
	jmp LB_34507
LB_34506:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34507:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34510:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34512
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34511
LB_34512:
	add rsp,8
	ret
LB_34513:
	add rsp,16
	pop r14
LB_34511:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_34532
LB_34531:
	add r14,1
LB_34532:
	cmp r14,r10
	jge LB_34533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34531
	cmp al,10
	jz LB_34531
	cmp al,32
	jz LB_34531
LB_34533:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34534
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34528
LB_34534:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34529
	btr r12,0
	clc
	jmp LB_34530
LB_34529:
	bts r12,0
	stc
LB_34530:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_34525
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30778 %_34277 ⊢ %_34278 : %_34278
 ; {>  %_34277~0':_p30641 }
; _f30778 0' ⊢ °3◂0'
; _some %_34278 ⊢ %_34279 : %_34279
 ; {>  %_34278~°3◂0':_p30743 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_34279
 ; {>  %_34279~°0◂°3◂0':(_opn)◂(_p30743) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34523
	btr r12,3
	jmp LB_34524
LB_34523:
	bts r12,3
LB_34524:
	mov rsi,1
	bt r12,3
	jc LB_34521
	mov rsi,0
	bt r9,0
	jc LB_34521
	jmp LB_34522
LB_34521:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34522:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34525:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34527
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34526
LB_34527:
	add rsp,8
	ret
LB_34528:
	add rsp,16
	pop r14
LB_34526:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34248:
NS_E_RDI_34248:
NS_E_34248_ETR_TBL:
NS_E_34248_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34549
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34541
LB_34549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_34557
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_34557
	jmp LB_34558
LB_34557:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34555
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34555:
	jmp LB_34541
LB_34558:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34544
	btr r12,1
	clc
	jmp LB_34545
LB_34544:
	bts r12,1
	stc
LB_34545:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34542
	btr r12,0
	clc
	jmp LB_34543
LB_34542:
	bts r12,0
	stc
LB_34543:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_34538
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34280 ⊢ %_34281 : %_34281
 ; {>  %_34280~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_34281
 ; {>  %_34281~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34536
	btr r12,3
	jmp LB_34537
LB_34536:
	bts r12,3
LB_34537:
	mov r8,0
	bts r12,2
	ret
LB_34538:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34540
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34539
LB_34540:
	add rsp,8
	ret
LB_34541:
	add rsp,32
	pop r14
LB_34539:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34559:
NS_E_RDI_34559:
NS_E_34559_ETR_TBL:
NS_E_34559_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_34974
LB_34973:
	add r14,1
LB_34974:
	cmp r14,r10
	jge LB_34975
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34973
	cmp al,10
	jz LB_34973
	cmp al,32
	jz LB_34973
LB_34975:
	push r10
	call NS_E_34560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34976
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34968
LB_34976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_34979
LB_34978:
	add r14,1
LB_34979:
	cmp r14,r10
	jge LB_34980
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_34978
	cmp al,10
	jz LB_34978
	cmp al,32
	jz LB_34978
LB_34980:
	push r10
	call NS_E_34559_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_34981
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_34982
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_34982:
	jmp LB_34968
LB_34981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34971
	btr r12,1
	clc
	jmp LB_34972
LB_34971:
	bts r12,1
	stc
LB_34972:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34969
	btr r12,0
	clc
	jmp LB_34970
LB_34969:
	bts r12,0
	stc
LB_34970:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_34965
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_34600 %_34601 } ⊢ %_34602 : %_34602
 ; {>  %_34601~1':(_lst)◂(_p30731) %_34600~0':_p30731 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34602 ⊢ %_34603 : %_34603
 ; {>  %_34602~°0◂{ 0' 1' }:(_lst)◂(_p30731) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34603
 ; {>  %_34603~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p30731)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_34959
	btr r12,2
	jmp LB_34960
LB_34959:
	bts r12,2
LB_34960:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_34957
	btr QWORD [rdi],0
	jmp LB_34958
LB_34957:
	bts QWORD [rdi],0
LB_34958:
	mov r8,r14
	bt r12,1
	jc LB_34963
	btr r12,2
	jmp LB_34964
LB_34963:
	bts r12,2
LB_34964:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_34961
	btr QWORD [rdi],1
	jmp LB_34962
LB_34961:
	bts QWORD [rdi],1
LB_34962:
	mov rsi,1
	bt r12,3
	jc LB_34955
	mov rsi,0
	bt r9,0
	jc LB_34955
	jmp LB_34956
LB_34955:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34956:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34965:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34967
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34966
LB_34967:
	add rsp,8
	ret
LB_34968:
	add rsp,32
	pop r14
LB_34966:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_34986
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_34604 : %_34604
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34604 ⊢ %_34605 : %_34605
 ; {>  %_34604~°1◂{  }:(_lst)◂(t14576'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34605
 ; {>  %_34605~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14579'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_34984
	mov rsi,0
	bt r9,0
	jc LB_34984
	jmp LB_34985
LB_34984:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_34985:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_34986:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34988
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34987
LB_34988:
	add rsp,8
	ret
LB_34989:
	add rsp,0
	pop r14
LB_34987:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34560:
NS_E_RDI_34560:
NS_E_34560_ETR_TBL:
NS_E_34560_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_35008
LB_35007:
	add r14,1
LB_35008:
	cmp r14,r10
	jge LB_35009
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35007
	cmp al,10
	jz LB_35007
	cmp al,32
	jz LB_35007
LB_35009:
	add r14,7
	cmp r14,r10
	jg LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_35012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_35012
	jmp LB_35013
LB_35012:
	jmp LB_34995
LB_35013:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_35002
LB_35001:
	add r14,1
LB_35002:
	cmp r14,r10
	jge LB_35003
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35001
	cmp al,10
	jz LB_35001
	cmp al,32
	jz LB_35001
LB_35003:
	push r10
	call NS_E_34561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35004
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35005
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35005:
	jmp LB_34996
LB_35004:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_34999
	btr r12,1
	clc
	jmp LB_35000
LB_34999:
	bts r12,1
	stc
LB_35000:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_34997
	btr r12,0
	clc
	jmp LB_34998
LB_34997:
	bts r12,0
	stc
LB_34998:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_34992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_35014
	btr r12,2
	jmp LB_35015
LB_35014:
	bts r12,2
LB_35015:
	mov r13,r14
	bt r12,1
	jc LB_35016
	btr r12,0
	jmp LB_35017
LB_35016:
	bts r12,0
LB_35017:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34606 ⊢ %_34607 : %_34607
 ; {>  %_34606~0':_p30731 }
; _some 0' ⊢ °0◂0'
; ∎ %_34607
 ; {>  %_34607~°0◂0':(_opn)◂(_p30731) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_34990
	btr r12,3
	jmp LB_34991
LB_34990:
	bts r12,3
LB_34991:
	mov r8,0
	bts r12,2
	ret
LB_34992:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_34994
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_34993
LB_34994:
	add rsp,8
	ret
LB_34996:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_34995:
	add rsp,32
	pop r14
LB_34993:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35019
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_34608
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34608 ⊢ %_34609 : %_34609
 ; {>  %_34608~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34610 : %_34610
 ; {>  %_34609~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34610
 ; {>  %_34609~0':_stg %_34610~°1◂{  }:(_opn)◂(t14589'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35018
	mov rdi,r13
	call dlt
LB_35018:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35019:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35021
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35020
LB_35021:
	add rsp,8
	ret
LB_35022:
	add rsp,0
	pop r14
LB_35020:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_35058
LB_35057:
	add r14,1
LB_35058:
	cmp r14,r10
	jge LB_35059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35057
	cmp al,10
	jz LB_35057
	cmp al,32
	jz LB_35057
LB_35059:
	add r14,4
	cmp r14,r10
	jg LB_35062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_35062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_35062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_35062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_35062
	jmp LB_35063
LB_35062:
	jmp LB_35036
LB_35063:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_35045
LB_35044:
	add r14,1
LB_35045:
	cmp r14,r10
	jge LB_35046
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35044
	cmp al,10
	jz LB_35044
	cmp al,32
	jz LB_35044
LB_35046:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35047
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35048
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35048:
	jmp LB_35037
LB_35047:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_35051
LB_35050:
	add r14,1
LB_35051:
	cmp r14,r10
	jge LB_35052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35050
	cmp al,10
	jz LB_35050
	cmp al,32
	jz LB_35050
LB_35052:
	push r10
	call NS_E_34562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35053
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35054
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35054:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35055
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35055:
	jmp LB_35037
LB_35053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35042
	btr r12,2
	clc
	jmp LB_35043
LB_35042:
	bts r12,2
	stc
LB_35043:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35040
	btr r12,1
	clc
	jmp LB_35041
LB_35040:
	bts r12,1
	stc
LB_35041:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35038
	btr r12,0
	clc
	jmp LB_35039
LB_35038:
	bts r12,0
	stc
LB_35039:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_35033
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_35064
	btr r12,3
	jmp LB_35065
LB_35064:
	bts r12,3
LB_35065:
	mov r14,r8
	bt r12,2
	jc LB_35066
	btr r12,1
	jmp LB_35067
LB_35066:
	bts r12,1
LB_35067:
	mov r8,r13
	bt r12,0
	jc LB_35068
	btr r12,2
	jmp LB_35069
LB_35068:
	bts r12,2
LB_35069:
	mov r13,r9
	bt r12,3
	jc LB_35070
	btr r12,0
	jmp LB_35071
LB_35070:
	bts r12,0
LB_35071:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30744 { %_34611 %_34612 } ⊢ %_34613 : %_34613
 ; {>  %_34611~0':_stg %_34612~1':_p30732 }
; _f30744 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34613 ⊢ %_34614 : %_34614
 ; {>  %_34613~°0◂{ 0' 1' }:_p30731 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34614
 ; {>  %_34614~°0◂°0◂{ 0' 1' }:(_opn)◂(_p30731) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_35027
	btr r12,2
	jmp LB_35028
LB_35027:
	bts r12,2
LB_35028:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_35025
	btr QWORD [rdi],0
	jmp LB_35026
LB_35025:
	bts QWORD [rdi],0
LB_35026:
	mov r8,r14
	bt r12,1
	jc LB_35031
	btr r12,2
	jmp LB_35032
LB_35031:
	bts r12,2
LB_35032:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_35029
	btr QWORD [rdi],1
	jmp LB_35030
LB_35029:
	bts QWORD [rdi],1
LB_35030:
	mov rsi,1
	bt r12,3
	jc LB_35023
	mov rsi,0
	bt r9,0
	jc LB_35023
	jmp LB_35024
LB_35023:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35024:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35033:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35035
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35034
LB_35035:
	add rsp,8
	ret
LB_35037:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35036:
	add rsp,48
	pop r14
LB_35034:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35073
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_34615
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34615 ⊢ %_34616 : %_34616
 ; {>  %_34615~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34617 : %_34617
 ; {>  %_34616~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34617
 ; {>  %_34616~0':_stg %_34617~°1◂{  }:(_opn)◂(t14601'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35072
	mov rdi,r13
	call dlt
LB_35072:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35073:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35075
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35074
LB_35075:
	add rsp,8
	ret
LB_35076:
	add rsp,0
	pop r14
LB_35074:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_35095
LB_35094:
	add r14,1
LB_35095:
	cmp r14,r10
	jge LB_35096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35094
	cmp al,10
	jz LB_35094
	cmp al,32
	jz LB_35094
LB_35096:
	add r14,2
	cmp r14,r10
	jg LB_35099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_35099
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_35099
	jmp LB_35100
LB_35099:
	jmp LB_35082
LB_35100:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_35089
LB_35088:
	add r14,1
LB_35089:
	cmp r14,r10
	jge LB_35090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35088
	cmp al,10
	jz LB_35088
	cmp al,32
	jz LB_35088
LB_35090:
	push r10
	call NS_E_34570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35091
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35092
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35092:
	jmp LB_35083
LB_35091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35086
	btr r12,1
	clc
	jmp LB_35087
LB_35086:
	bts r12,1
	stc
LB_35087:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35084
	btr r12,0
	clc
	jmp LB_35085
LB_35084:
	bts r12,0
	stc
LB_35085:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35079
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_35101
	btr r12,2
	jmp LB_35102
LB_35101:
	bts r12,2
LB_35102:
	mov r13,r14
	bt r12,1
	jc LB_35103
	btr r12,0
	jmp LB_35104
LB_35103:
	bts r12,0
LB_35104:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34618 ⊢ %_34619 : %_34619
 ; {>  %_34618~0':_p30731 }
; _some 0' ⊢ °0◂0'
; ∎ %_34619
 ; {>  %_34619~°0◂0':(_opn)◂(_p30731) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_35077
	btr r12,3
	jmp LB_35078
LB_35077:
	bts r12,3
LB_35078:
	mov r8,0
	bts r12,2
	ret
LB_35079:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35081
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35080
LB_35081:
	add rsp,8
	ret
LB_35083:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35082:
	add rsp,32
	pop r14
LB_35080:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35106
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_34620
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34620 ⊢ %_34621 : %_34621
 ; {>  %_34620~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34622 : %_34622
 ; {>  %_34621~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34622
 ; {>  %_34621~0':_stg %_34622~°1◂{  }:(_opn)◂(t14611'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35105
	mov rdi,r13
	call dlt
LB_35105:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35106:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35108
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35107
LB_35108:
	add rsp,8
	ret
LB_35109:
	add rsp,0
	pop r14
LB_35107:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_35128
LB_35127:
	add r14,1
LB_35128:
	cmp r14,r10
	jge LB_35129
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35127
	cmp al,10
	jz LB_35127
	cmp al,32
	jz LB_35127
LB_35129:
	add r14,2
	cmp r14,r10
	jg LB_35132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_35132
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_35132
	jmp LB_35133
LB_35132:
	jmp LB_35115
LB_35133:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_35122
LB_35121:
	add r14,1
LB_35122:
	cmp r14,r10
	jge LB_35123
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35121
	cmp al,10
	jz LB_35121
	cmp al,32
	jz LB_35121
LB_35123:
	push r10
	call NS_E_34564_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35124
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35125:
	jmp LB_35116
LB_35124:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35119
	btr r12,1
	clc
	jmp LB_35120
LB_35119:
	bts r12,1
	stc
LB_35120:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35117
	btr r12,0
	clc
	jmp LB_35118
LB_35117:
	bts r12,0
	stc
LB_35118:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35112
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_35134
	btr r12,2
	jmp LB_35135
LB_35134:
	bts r12,2
LB_35135:
	mov r13,r14
	bt r12,1
	jc LB_35136
	btr r12,0
	jmp LB_35137
LB_35136:
	bts r12,0
LB_35137:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34623 ⊢ %_34624 : %_34624
 ; {>  %_34623~0':_p30731 }
; _some 0' ⊢ °0◂0'
; ∎ %_34624
 ; {>  %_34624~°0◂0':(_opn)◂(_p30731) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_35110
	btr r12,3
	jmp LB_35111
LB_35110:
	bts r12,3
LB_35111:
	mov r8,0
	bts r12,2
	ret
LB_35112:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35114
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35113
LB_35114:
	add rsp,8
	ret
LB_35116:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35115:
	add rsp,32
	pop r14
LB_35113:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34561:
NS_E_RDI_34561:
NS_E_34561_ETR_TBL:
NS_E_34561_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_35173
LB_35172:
	add r14,1
LB_35173:
	cmp r14,r10
	jge LB_35174
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35172
	cmp al,10
	jz LB_35172
	cmp al,32
	jz LB_35172
LB_35174:
	push r10
	call NS_E_34587_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35175
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35167
LB_35175:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_35181:
	jmp LB_35178
LB_35177:
	add r14,1
LB_35178:
	cmp r14,r10
	jge LB_35179
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35177
	cmp al,10
	jz LB_35177
	cmp al,32
	jz LB_35177
LB_35179:
	push r10
	push rsi
	call NS_E_34587_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_35180
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_35182
	bts QWORD [rax],0
LB_35182:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_35181
LB_35180:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35170
	btr r12,1
	clc
	jmp LB_35171
LB_35170:
	bts r12,1
	stc
LB_35171:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35168
	btr r12,0
	clc
	jmp LB_35169
LB_35168:
	bts r12,0
	stc
LB_35169:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35164
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_35183
	btr r12,2
	jmp LB_35184
LB_35183:
	bts r12,2
LB_35184:
	mov r9,r13
	bt r12,0
	jc LB_35185
	btr r12,3
	jmp LB_35186
LB_35185:
	bts r12,3
LB_35186:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_35189
	btr r12,4
	clc
	jmp LB_35190
LB_35189:
	bts r12,4
	stc
LB_35190:
	mov r13,r10
	bt r12,4
	jc LB_35187
	btr r12,0
	jmp LB_35188
LB_35187:
	bts r12,0
LB_35188:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_35193
	btr r12,4
	clc
	jmp LB_35194
LB_35193:
	bts r12,4
	stc
LB_35194:
	mov r14,r10
	bt r12,4
	jc LB_35191
	btr r12,1
	jmp LB_35192
LB_35191:
	bts r12,1
LB_35192:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f29875 %_34626 ⊢ %_34627 : %_34627
 ; {>  %_34626~2':(_lst)◂({ _stg _p30735 }) %_34625~{ 0' 1' }:{ _stg _p30735 } }
; _f29875 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_35142
	btr r12,0
	jmp LB_35143
LB_35142:
	bts r12,0
LB_35143:
	call NS_E_29875
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_35144
	btr r12,2
	jmp LB_35145
LB_35144:
	bts r12,2
LB_35145:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_35140
	btr r12,1
	clc
	jmp LB_35141
LB_35140:
	bts r12,1
	stc
LB_35141:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_35138
	btr r12,0
	clc
	jmp LB_35139
LB_35138:
	bts r12,0
	stc
LB_35139:
	add rsp,24
; _cns { %_34625 %_34627 } ⊢ %_34628 : %_34628
 ; {>  %_34627~2':(_lst)◂({ _stg _p30735 }) %_34625~{ 0' 1' }:{ _stg _p30735 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f30745 %_34628 ⊢ %_34629 : %_34629
 ; {>  %_34628~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p30735 }) }
; _f30745 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_34629 ⊢ %_34630 : %_34630
 ; {>  %_34629~°1◂°0◂{ { 0' 1' } 2' }:_p30731 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_34630
 ; {>  %_34630~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p30731) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_35154
	btr r12,5
	jmp LB_35155
LB_35154:
	bts r12,5
LB_35155:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_35152
	btr QWORD [rdi],0
	jmp LB_35153
LB_35152:
	bts QWORD [rdi],0
LB_35153:
	mov r11,r14
	bt r12,1
	jc LB_35158
	btr r12,5
	jmp LB_35159
LB_35158:
	bts r12,5
LB_35159:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_35156
	btr QWORD [rdi],1
	jmp LB_35157
LB_35156:
	bts QWORD [rdi],1
LB_35157:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_35150
	btr QWORD [rdi],0
	jmp LB_35151
LB_35150:
	bts QWORD [rdi],0
LB_35151:
	mov r10,r8
	bt r12,2
	jc LB_35162
	btr r12,4
	jmp LB_35163
LB_35162:
	bts r12,4
LB_35163:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_35160
	btr QWORD [rdi],1
	jmp LB_35161
LB_35160:
	bts QWORD [rdi],1
LB_35161:
	mov rsi,1
	bt r12,3
	jc LB_35148
	mov rsi,0
	bt r9,0
	jc LB_35148
	jmp LB_35149
LB_35148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35149:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_35146
	mov rsi,0
	bt r9,0
	jc LB_35146
	jmp LB_35147
LB_35146:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35147:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35164:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35166
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35165
LB_35166:
	add rsp,8
	ret
LB_35167:
	add rsp,32
	pop r14
LB_35165:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35196
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_34631
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34631 ⊢ %_34632 : %_34632
 ; {>  %_34631~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34633 : %_34633
 ; {>  %_34632~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34633
 ; {>  %_34632~0':_stg %_34633~°1◂{  }:(_opn)◂(t14630'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35195
	mov rdi,r13
	call dlt
LB_35195:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35196:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35198
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35197
LB_35198:
	add rsp,8
	ret
LB_35199:
	add rsp,0
	pop r14
LB_35197:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34562:
NS_E_RDI_34562:
NS_E_34562_ETR_TBL:
NS_E_34562_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_35220
LB_35219:
	add r14,1
LB_35220:
	cmp r14,r10
	jge LB_35221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35219
	cmp al,10
	jz LB_35219
	cmp al,32
	jz LB_35219
LB_35221:
	add r14,1
	cmp r14,r10
	jg LB_35224
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_35224
	jmp LB_35225
LB_35224:
	jmp LB_35207
LB_35225:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_35214
LB_35213:
	add r14,1
LB_35214:
	cmp r14,r10
	jge LB_35215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35213
	cmp al,10
	jz LB_35213
	cmp al,32
	jz LB_35213
LB_35215:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35216
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35217
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35217:
	jmp LB_35208
LB_35216:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35211
	btr r12,1
	clc
	jmp LB_35212
LB_35211:
	bts r12,1
	stc
LB_35212:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35209
	btr r12,0
	clc
	jmp LB_35210
LB_35209:
	bts r12,0
	stc
LB_35210:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35204
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_35226
	btr r12,2
	jmp LB_35227
LB_35226:
	bts r12,2
LB_35227:
	mov r13,r14
	bt r12,1
	jc LB_35228
	btr r12,0
	jmp LB_35229
LB_35228:
	bts r12,0
LB_35229:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30751 %_34634 ⊢ %_34635 : %_34635
 ; {>  %_34634~0':_p30641 }
; _f30751 0' ⊢ °1◂0'
; _some %_34635 ⊢ %_34636 : %_34636
 ; {>  %_34635~°1◂0':_p30732 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34636
 ; {>  %_34636~°0◂°1◂0':(_opn)◂(_p30732) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_35202
	btr r12,3
	jmp LB_35203
LB_35202:
	bts r12,3
LB_35203:
	mov rsi,1
	bt r12,3
	jc LB_35200
	mov rsi,0
	bt r9,0
	jc LB_35200
	jmp LB_35201
LB_35200:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35201:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35204:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35206
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35205
LB_35206:
	add rsp,8
	ret
LB_35208:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35207:
	add rsp,32
	pop r14
LB_35205:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_35241
LB_35240:
	add r14,1
LB_35241:
	cmp r14,r10
	jge LB_35242
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35240
	cmp al,10
	jz LB_35240
	cmp al,32
	jz LB_35240
LB_35242:
	push r10
	call NS_E_34563_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35243
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35237
LB_35243:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35238
	btr r12,0
	clc
	jmp LB_35239
LB_35238:
	bts r12,0
	stc
LB_35239:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_35234
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30750 %_34637 ⊢ %_34638 : %_34638
 ; {>  %_34637~0':(_lst)◂(_p30731) }
; _f30750 0' ⊢ °0◂0'
; _some %_34638 ⊢ %_34639 : %_34639
 ; {>  %_34638~°0◂0':_p30732 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34639
 ; {>  %_34639~°0◂°0◂0':(_opn)◂(_p30732) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_35232
	btr r12,3
	jmp LB_35233
LB_35232:
	bts r12,3
LB_35233:
	mov rsi,1
	bt r12,3
	jc LB_35230
	mov rsi,0
	bt r9,0
	jc LB_35230
	jmp LB_35231
LB_35230:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35231:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35234:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35236
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35235
LB_35236:
	add rsp,8
	ret
LB_35237:
	add rsp,16
	pop r14
LB_35235:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35246
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_34640
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34640 ⊢ %_34641 : %_34641
 ; {>  %_34640~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34642 : %_34642
 ; {>  %_34641~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34642
 ; {>  %_34641~0':_stg %_34642~°1◂{  }:(_opn)◂(t14645'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35245
	mov rdi,r13
	call dlt
LB_35245:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35246:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35248
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35247
LB_35248:
	add rsp,8
	ret
LB_35249:
	add rsp,0
	pop r14
LB_35247:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34563:
NS_E_RDI_34563:
NS_E_34563_ETR_TBL:
NS_E_34563_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_35259
LB_35258:
	add r14,1
LB_35259:
	cmp r14,r10
	jge LB_35260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35258
	cmp al,10
	jz LB_35258
	cmp al,32
	jz LB_35258
LB_35260:
	add r14,6
	cmp r14,r10
	jg LB_35263
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_35263
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_35263
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_35263
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_35263
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_35263
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_35263
	jmp LB_35264
LB_35263:
	jmp LB_35255
LB_35264:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35256
	btr r12,0
	clc
	jmp LB_35257
LB_35256:
	bts r12,0
	stc
LB_35257:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_35252
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_34643 : %_34643
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34643 ⊢ %_34644 : %_34644
 ; {>  %_34643~°1◂{  }:(_lst)◂(t14649'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34644
 ; {>  %_34644~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14652'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_35250
	mov rsi,0
	bt r9,0
	jc LB_35250
	jmp LB_35251
LB_35250:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35251:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35252:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35254
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35253
LB_35254:
	add rsp,8
	ret
LB_35255:
	add rsp,16
	pop r14
LB_35253:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_35284
LB_35283:
	add r14,1
LB_35284:
	cmp r14,r10
	jge LB_35285
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35283
	cmp al,10
	jz LB_35283
	cmp al,32
	jz LB_35283
LB_35285:
	push r10
	call NS_E_34560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35286
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35278
LB_35286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_35289
LB_35288:
	add r14,1
LB_35289:
	cmp r14,r10
	jge LB_35290
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35288
	cmp al,10
	jz LB_35288
	cmp al,32
	jz LB_35288
LB_35290:
	push r10
	call NS_E_34563_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35291
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35292
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35292:
	jmp LB_35278
LB_35291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35281
	btr r12,1
	clc
	jmp LB_35282
LB_35281:
	bts r12,1
	stc
LB_35282:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35279
	btr r12,0
	clc
	jmp LB_35280
LB_35279:
	bts r12,0
	stc
LB_35280:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35275
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_34645 %_34646 } ⊢ %_34647 : %_34647
 ; {>  %_34645~0':_p30731 %_34646~1':(_lst)◂(_p30731) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34647 ⊢ %_34648 : %_34648
 ; {>  %_34647~°0◂{ 0' 1' }:(_lst)◂(_p30731) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34648
 ; {>  %_34648~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p30731)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_35269
	btr r12,2
	jmp LB_35270
LB_35269:
	bts r12,2
LB_35270:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_35267
	btr QWORD [rdi],0
	jmp LB_35268
LB_35267:
	bts QWORD [rdi],0
LB_35268:
	mov r8,r14
	bt r12,1
	jc LB_35273
	btr r12,2
	jmp LB_35274
LB_35273:
	bts r12,2
LB_35274:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_35271
	btr QWORD [rdi],1
	jmp LB_35272
LB_35271:
	bts QWORD [rdi],1
LB_35272:
	mov rsi,1
	bt r12,3
	jc LB_35265
	mov rsi,0
	bt r9,0
	jc LB_35265
	jmp LB_35266
LB_35265:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35266:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35275:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35277
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35276
LB_35277:
	add rsp,8
	ret
LB_35278:
	add rsp,32
	pop r14
LB_35276:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34564:
NS_E_RDI_34564:
NS_E_34564_ETR_TBL:
NS_E_34564_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_35349
LB_35348:
	add r14,1
LB_35349:
	cmp r14,r10
	jge LB_35350
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35348
	cmp al,10
	jz LB_35348
	cmp al,32
	jz LB_35348
LB_35350:
	add r14,1
	cmp r14,r10
	jg LB_35353
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_35353
	jmp LB_35354
LB_35353:
	jmp LB_35315
LB_35354:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_35326
LB_35325:
	add r14,1
LB_35326:
	cmp r14,r10
	jge LB_35327
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35325
	cmp al,10
	jz LB_35325
	cmp al,32
	jz LB_35325
LB_35327:
	add r14,1
	cmp r14,r10
	jg LB_35331
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_35331
	jmp LB_35332
LB_35331:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35329
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35329:
	jmp LB_35316
LB_35332:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_35334
LB_35333:
	add r14,1
LB_35334:
	cmp r14,r10
	jge LB_35335
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35333
	cmp al,10
	jz LB_35333
	cmp al,32
	jz LB_35333
LB_35335:
	push r10
	call NS_E_34565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35336
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35337
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35337:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35338
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35338:
	jmp LB_35316
LB_35336:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_35341
LB_35340:
	add r14,1
LB_35341:
	cmp r14,r10
	jge LB_35342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35340
	cmp al,10
	jz LB_35340
	cmp al,32
	jz LB_35340
LB_35342:
	push r10
	call NS_E_34568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35343
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35344
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35344:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35345
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35345:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35346
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35346:
	jmp LB_35316
LB_35343:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35323
	btr r12,3
	clc
	jmp LB_35324
LB_35323:
	bts r12,3
	stc
LB_35324:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35321
	btr r12,2
	clc
	jmp LB_35322
LB_35321:
	bts r12,2
	stc
LB_35322:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35319
	btr r12,1
	clc
	jmp LB_35320
LB_35319:
	bts r12,1
	stc
LB_35320:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35317
	btr r12,0
	clc
	jmp LB_35318
LB_35317:
	bts r12,0
	stc
LB_35318:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_35312
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_35355
	btr r12,4
	jmp LB_35356
LB_35355:
	bts r12,4
LB_35356:
	mov r8,r9
	bt r12,3
	jc LB_35357
	btr r12,2
	jmp LB_35358
LB_35357:
	bts r12,2
LB_35358:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_35361
	btr r12,3
	clc
	jmp LB_35362
LB_35361:
	bts r12,3
	stc
LB_35362:
	mov r13,r9
	bt r12,3
	jc LB_35359
	btr r12,0
	jmp LB_35360
LB_35359:
	bts r12,0
LB_35360:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_35365
	btr r12,3
	clc
	jmp LB_35366
LB_35365:
	bts r12,3
	stc
LB_35366:
	mov r14,r9
	bt r12,3
	jc LB_35363
	btr r12,1
	jmp LB_35364
LB_35363:
	bts r12,1
LB_35364:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_34649 %_34650 } ⊢ %_34651 : %_34651
 ; {>  %_34649~{ 0' 1' }:{ _stg _p30734 } %_34650~2':(_lst)◂({ _stg _p30734 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f30749 %_34651 ⊢ %_34652 : %_34652
 ; {>  %_34651~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p30734 }) }
; _f30749 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_34652 ⊢ %_34653 : %_34653
 ; {>  %_34652~°5◂°0◂{ { 0' 1' } 2' }:_p30731 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_34653
 ; {>  %_34653~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p30731) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_35302
	btr r12,5
	jmp LB_35303
LB_35302:
	bts r12,5
LB_35303:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_35300
	btr QWORD [rdi],0
	jmp LB_35301
LB_35300:
	bts QWORD [rdi],0
LB_35301:
	mov r11,r14
	bt r12,1
	jc LB_35306
	btr r12,5
	jmp LB_35307
LB_35306:
	bts r12,5
LB_35307:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_35304
	btr QWORD [rdi],1
	jmp LB_35305
LB_35304:
	bts QWORD [rdi],1
LB_35305:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_35298
	btr QWORD [rdi],0
	jmp LB_35299
LB_35298:
	bts QWORD [rdi],0
LB_35299:
	mov r10,r8
	bt r12,2
	jc LB_35310
	btr r12,4
	jmp LB_35311
LB_35310:
	bts r12,4
LB_35311:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_35308
	btr QWORD [rdi],1
	jmp LB_35309
LB_35308:
	bts QWORD [rdi],1
LB_35309:
	mov rsi,1
	bt r12,3
	jc LB_35296
	mov rsi,0
	bt r9,0
	jc LB_35296
	jmp LB_35297
LB_35296:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35297:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_35294
	mov rsi,0
	bt r9,0
	jc LB_35294
	jmp LB_35295
LB_35294:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35295:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35312:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35314
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35313
LB_35314:
	add rsp,8
	ret
LB_35316:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35315:
	add rsp,64
	pop r14
LB_35313:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_35384
LB_35383:
	add r14,1
LB_35384:
	cmp r14,r10
	jge LB_35385
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35383
	cmp al,10
	jz LB_35383
	cmp al,32
	jz LB_35383
LB_35385:
	push r10
	call NS_E_34565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35386
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35380
LB_35386:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35381
	btr r12,0
	clc
	jmp LB_35382
LB_35381:
	bts r12,0
	stc
LB_35382:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_35377
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_35388
	btr r12,2
	jmp LB_35389
LB_35388:
	bts r12,2
LB_35389:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_35392
	btr r12,3
	clc
	jmp LB_35393
LB_35392:
	bts r12,3
	stc
LB_35393:
	mov r13,r9
	bt r12,3
	jc LB_35390
	btr r12,0
	jmp LB_35391
LB_35390:
	bts r12,0
LB_35391:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_35396
	btr r12,3
	clc
	jmp LB_35397
LB_35396:
	bts r12,3
	stc
LB_35397:
	mov r14,r9
	bt r12,3
	jc LB_35394
	btr r12,1
	jmp LB_35395
LB_35394:
	bts r12,1
LB_35395:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30748 %_34654 ⊢ %_34655 : %_34655
 ; {>  %_34654~{ 0' 1' }:{ _stg _p30734 } }
; _f30748 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_34655 ⊢ %_34656 : %_34656
 ; {>  %_34655~°4◂{ 0' 1' }:_p30731 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_34656
 ; {>  %_34656~°0◂°4◂{ 0' 1' }:(_opn)◂(_p30731) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_35371
	btr r12,2
	jmp LB_35372
LB_35371:
	bts r12,2
LB_35372:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_35369
	btr QWORD [rdi],0
	jmp LB_35370
LB_35369:
	bts QWORD [rdi],0
LB_35370:
	mov r8,r14
	bt r12,1
	jc LB_35375
	btr r12,2
	jmp LB_35376
LB_35375:
	bts r12,2
LB_35376:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_35373
	btr QWORD [rdi],1
	jmp LB_35374
LB_35373:
	bts QWORD [rdi],1
LB_35374:
	mov rsi,1
	bt r12,3
	jc LB_35367
	mov rsi,0
	bt r9,0
	jc LB_35367
	jmp LB_35368
LB_35367:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35368:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35377:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35379
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35378
LB_35379:
	add rsp,8
	ret
LB_35380:
	add rsp,16
	pop r14
LB_35378:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35399
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_34657
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34657 ⊢ %_34658 : %_34658
 ; {>  %_34657~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34659 : %_34659
 ; {>  %_34658~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34659
 ; {>  %_34659~°1◂{  }:(_opn)◂(t14676'(0)) %_34658~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35398
	mov rdi,r13
	call dlt
LB_35398:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35399:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35401
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35400
LB_35401:
	add rsp,8
	ret
LB_35402:
	add rsp,0
	pop r14
LB_35400:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34565:
NS_E_RDI_34565:
NS_E_34565_ETR_TBL:
NS_E_34565_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_35436
LB_35435:
	add r14,1
LB_35436:
	cmp r14,r10
	jge LB_35437
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35435
	cmp al,10
	jz LB_35435
	cmp al,32
	jz LB_35435
LB_35437:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35438
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35417
LB_35438:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_35441
LB_35440:
	add r14,1
LB_35441:
	cmp r14,r10
	jge LB_35442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35440
	cmp al,10
	jz LB_35440
	cmp al,32
	jz LB_35440
LB_35442:
	push r10
	call NS_E_34567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35443
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35444
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35444:
	jmp LB_35417
LB_35443:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_35447
LB_35446:
	add r14,1
LB_35447:
	cmp r14,r10
	jge LB_35448
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35446
	cmp al,10
	jz LB_35446
	cmp al,32
	jz LB_35446
LB_35448:
	add r14,1
	cmp r14,r10
	jg LB_35453
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_35453
	jmp LB_35454
LB_35453:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35450
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35450:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35451
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35451:
	jmp LB_35417
LB_35454:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_35428
LB_35427:
	add r14,1
LB_35428:
	cmp r14,r10
	jge LB_35429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35427
	cmp al,10
	jz LB_35427
	cmp al,32
	jz LB_35427
LB_35429:
	push r10
	call NS_E_34244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35430
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35431
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35431:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35432
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35432:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35433
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35433:
	jmp LB_35418
LB_35430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35425
	btr r12,3
	clc
	jmp LB_35426
LB_35425:
	bts r12,3
	stc
LB_35426:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35423
	btr r12,2
	clc
	jmp LB_35424
LB_35423:
	bts r12,2
	stc
LB_35424:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35421
	btr r12,1
	clc
	jmp LB_35422
LB_35421:
	bts r12,1
	stc
LB_35422:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35419
	btr r12,0
	clc
	jmp LB_35420
LB_35419:
	bts r12,0
	stc
LB_35420:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_35414
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_35455
	btr r12,4
	jmp LB_35456
LB_35455:
	bts r12,4
LB_35456:
	mov r8,r9
	bt r12,3
	jc LB_35457
	btr r12,2
	jmp LB_35458
LB_35457:
	bts r12,2
LB_35458:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f30756 %_34662 ⊢ %_34663 : %_34663
 ; {>  %_34662~2':_p30743 %_34660~0':_stg %_34661~1':_p34566 }
; _f30756 2' ⊢ °1◂2'
; _some { %_34660 %_34663 } ⊢ %_34664 : %_34664
 ; {>  %_34660~0':_stg %_34663~°1◂2':_p30734 %_34661~1':_p34566 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_34664
 ; {>  %_34664~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p30734 }) %_34661~1':_p34566 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_35403
	mov rdi,r14
	call dlt
LB_35403:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_35406
	btr r12,1
	jmp LB_35407
LB_35406:
	bts r12,1
LB_35407:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_35404
	btr QWORD [rdi],0
	jmp LB_35405
LB_35404:
	bts QWORD [rdi],0
LB_35405:
	mov r14,r8
	bt r12,2
	jc LB_35412
	btr r12,1
	jmp LB_35413
LB_35412:
	bts r12,1
LB_35413:
	mov rsi,1
	bt r12,1
	jc LB_35410
	mov rsi,0
	bt r14,0
	jc LB_35410
	jmp LB_35411
LB_35410:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_35411:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_35408
	btr QWORD [rdi],1
	jmp LB_35409
LB_35408:
	bts QWORD [rdi],1
LB_35409:
	mov r8,0
	bts r12,2
	ret
LB_35414:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35416
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35415
LB_35416:
	add rsp,8
	ret
LB_35418:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35417:
	add rsp,64
	pop r14
LB_35415:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_35505
LB_35504:
	add r14,1
LB_35505:
	cmp r14,r10
	jge LB_35506
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35504
	cmp al,10
	jz LB_35504
	cmp al,32
	jz LB_35504
LB_35506:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35507
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35489
LB_35507:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_35510
LB_35509:
	add r14,1
LB_35510:
	cmp r14,r10
	jge LB_35511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35509
	cmp al,10
	jz LB_35509
	cmp al,32
	jz LB_35509
LB_35511:
	push r10
	call NS_E_34567_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35512
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35513
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35513:
	jmp LB_35489
LB_35512:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_35516
LB_35515:
	add r14,1
LB_35516:
	cmp r14,r10
	jge LB_35517
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35515
	cmp al,10
	jz LB_35515
	cmp al,32
	jz LB_35515
LB_35517:
	add r14,3
	cmp r14,r10
	jg LB_35522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_35522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_35522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_35522
	jmp LB_35523
LB_35522:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35519
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35519:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35520
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35520:
	jmp LB_35489
LB_35523:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_35525
LB_35524:
	add r14,1
LB_35525:
	cmp r14,r10
	jge LB_35526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35524
	cmp al,10
	jz LB_35524
	cmp al,32
	jz LB_35524
LB_35526:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35527
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35528
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35528:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35529
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35529:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35530:
	jmp LB_35489
LB_35527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_35533
LB_35532:
	add r14,1
LB_35533:
	cmp r14,r10
	jge LB_35534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35532
	cmp al,10
	jz LB_35532
	cmp al,32
	jz LB_35532
LB_35534:
	add r14,1
	cmp r14,r10
	jg LB_35541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_35541
	jmp LB_35542
LB_35541:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_35536
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_35536:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35537
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35537:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35538
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35538:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35539:
	jmp LB_35489
LB_35542:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_35544
LB_35543:
	add r14,1
LB_35544:
	cmp r14,r10
	jge LB_35545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35543
	cmp al,10
	jz LB_35543
	cmp al,32
	jz LB_35543
LB_35545:
	push r10
	call NS_E_34244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35546
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_35547
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_35547:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_35548
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_35548:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35549
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35549:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35550
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35550:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35551
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35551:
	jmp LB_35489
LB_35546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_35554
LB_35553:
	add r14,1
LB_35554:
	cmp r14,r10
	jge LB_35555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35553
	cmp al,10
	jz LB_35553
	cmp al,32
	jz LB_35553
LB_35555:
	push r10
	call NS_E_34569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35556
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_35557
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_35557:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_35558
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_35558:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_35559
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_35559:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35560
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35560:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35561
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35561:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35562
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35562:
	jmp LB_35489
LB_35556:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_35502
	btr r12,6
	clc
	jmp LB_35503
LB_35502:
	bts r12,6
	stc
LB_35503:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_35500
	btr r12,5
	clc
	jmp LB_35501
LB_35500:
	bts r12,5
	stc
LB_35501:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_35498
	btr r12,4
	clc
	jmp LB_35499
LB_35498:
	bts r12,4
	stc
LB_35499:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35496
	btr r12,3
	clc
	jmp LB_35497
LB_35496:
	bts r12,3
	stc
LB_35497:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35494
	btr r12,2
	clc
	jmp LB_35495
LB_35494:
	bts r12,2
	stc
LB_35495:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35492
	btr r12,1
	clc
	jmp LB_35493
LB_35492:
	bts r12,1
	stc
LB_35493:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35490
	btr r12,0
	clc
	jmp LB_35491
LB_35490:
	bts r12,0
	stc
LB_35491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_35486
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_35564
	btr r12,7
	jmp LB_35565
LB_35564:
	bts r12,7
LB_35565:
	mov r10,rcx
	bt r12,6
	jc LB_35566
	btr r12,4
	jmp LB_35567
LB_35566:
	bts r12,4
LB_35567:
	mov rcx,r9
	bt r12,3
	jc LB_35568
	btr r12,6
	jmp LB_35569
LB_35568:
	bts r12,6
LB_35569:
	mov r9,r11
	bt r12,5
	jc LB_35570
	btr r12,3
	jmp LB_35571
LB_35570:
	bts r12,3
LB_35571:
	mov r11,r8
	bt r12,2
	jc LB_35572
	btr r12,5
	jmp LB_35573
LB_35572:
	bts r12,5
LB_35573:
	mov r8,rcx
	bt r12,6
	jc LB_35574
	btr r12,2
	jmp LB_35575
LB_35574:
	bts r12,2
LB_35575:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_34667 %_34668 } %_34669 } ⊢ %_34670 : %_34670
 ; {>  %_34668~3':_p30743 %_34669~4':(_lst)◂({ _stg _p30743 }) %_34667~2':_stg %_34666~1':_p34566 %_34665~0':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f30755 %_34670 ⊢ %_34671 : %_34671
 ; {>  %_34670~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p30743 }) %_34666~1':_p34566 %_34665~0':_stg }
; _f30755 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_34665 %_34671 } ⊢ %_34672 : %_34672
 ; {>  %_34671~°0◂°0◂{ { 2' 3' } 4' }:_p30734 %_34666~1':_p34566 %_34665~0':_stg }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_34672
 ; {>  %_34666~1':_p34566 %_34672~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p30734 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_35459
	mov rdi,r14
	call dlt
LB_35459:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_35460
	btr r12,1
	jmp LB_35461
LB_35460:
	bts r12,1
LB_35461:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_35464
	btr r12,5
	jmp LB_35465
LB_35464:
	bts r12,5
LB_35465:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_35462
	btr QWORD [rdi],0
	jmp LB_35463
LB_35462:
	bts QWORD [rdi],0
LB_35463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_35476
	btr r12,6
	jmp LB_35477
LB_35476:
	bts r12,6
LB_35477:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_35474
	btr QWORD [rdi],0
	jmp LB_35475
LB_35474:
	bts QWORD [rdi],0
LB_35475:
	mov rcx,r14
	bt r12,1
	jc LB_35480
	btr r12,6
	jmp LB_35481
LB_35480:
	bts r12,6
LB_35481:
	mov rdi,r13
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_35478
	btr QWORD [rdi],1
	jmp LB_35479
LB_35478:
	bts QWORD [rdi],1
LB_35479:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_35472
	btr QWORD [rdi],0
	jmp LB_35473
LB_35472:
	bts QWORD [rdi],0
LB_35473:
	mov r13,r10
	bt r12,4
	jc LB_35484
	btr r12,0
	jmp LB_35485
LB_35484:
	bts r12,0
LB_35485:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_35482
	btr QWORD [rdi],1
	jmp LB_35483
LB_35482:
	bts QWORD [rdi],1
LB_35483:
	mov rsi,1
	bt r12,5
	jc LB_35470
	mov rsi,0
	bt r11,0
	jc LB_35470
	jmp LB_35471
LB_35470:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_35471:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_35468
	mov rsi,0
	bt r11,0
	jc LB_35468
	jmp LB_35469
LB_35468:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_35469:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_35466
	btr QWORD [rdi],1
	jmp LB_35467
LB_35466:
	bts QWORD [rdi],1
LB_35467:
	mov r8,0
	bts r12,2
	ret
LB_35486:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35488
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35487
LB_35488:
	add rsp,8
	ret
LB_35489:
	add rsp,112
	pop r14
LB_35487:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34567:
NS_E_RDI_34567:
NS_E_34567_ETR_TBL:
NS_E_34567_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_35590
LB_35589:
	add r14,1
LB_35590:
	cmp r14,r10
	jge LB_35591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35589
	cmp al,10
	jz LB_35589
	cmp al,32
	jz LB_35589
LB_35591:
	add r14,3
	cmp r14,r10
	jg LB_35594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_35594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_35594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_35594
	jmp LB_35595
LB_35594:
	jmp LB_35576
LB_35595:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_35584
LB_35583:
	add r14,1
LB_35584:
	cmp r14,r10
	jge LB_35585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35583
	cmp al,10
	jz LB_35583
	cmp al,32
	jz LB_35583
LB_35585:
	push r10
	call NS_E_34248_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35586
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35587
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35587:
	jmp LB_35577
LB_35586:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35580
	btr QWORD [rdi],1
LB_35580:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35581
	btr QWORD [rdi],0
LB_35581:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_35577:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35576:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_35578:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34568:
NS_E_RDI_34568:
NS_E_34568_ETR_TBL:
NS_E_34568_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_35649
LB_35648:
	add r14,1
LB_35649:
	cmp r14,r10
	jge LB_35650
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35648
	cmp al,10
	jz LB_35648
	cmp al,32
	jz LB_35648
LB_35650:
	add r14,1
	cmp r14,r10
	jg LB_35653
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_35653
	jmp LB_35654
LB_35653:
	jmp LB_35615
LB_35654:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_35626
LB_35625:
	add r14,1
LB_35626:
	cmp r14,r10
	jge LB_35627
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35625
	cmp al,10
	jz LB_35625
	cmp al,32
	jz LB_35625
LB_35627:
	add r14,1
	cmp r14,r10
	jg LB_35631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_35631
	jmp LB_35632
LB_35631:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35629
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35629:
	jmp LB_35616
LB_35632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_35634
LB_35633:
	add r14,1
LB_35634:
	cmp r14,r10
	jge LB_35635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35633
	cmp al,10
	jz LB_35633
	cmp al,32
	jz LB_35633
LB_35635:
	push r10
	call NS_E_34565_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35636
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35637
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35637:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35638
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35638:
	jmp LB_35616
LB_35636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_35641
LB_35640:
	add r14,1
LB_35641:
	cmp r14,r10
	jge LB_35642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35640
	cmp al,10
	jz LB_35640
	cmp al,32
	jz LB_35640
LB_35642:
	push r10
	call NS_E_34568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35643
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35644
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35644:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35645
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35645:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35646
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35646:
	jmp LB_35616
LB_35643:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35623
	btr r12,3
	clc
	jmp LB_35624
LB_35623:
	bts r12,3
	stc
LB_35624:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35621
	btr r12,2
	clc
	jmp LB_35622
LB_35621:
	bts r12,2
	stc
LB_35622:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35619
	btr r12,1
	clc
	jmp LB_35620
LB_35619:
	bts r12,1
	stc
LB_35620:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35617
	btr r12,0
	clc
	jmp LB_35618
LB_35617:
	bts r12,0
	stc
LB_35618:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_35612
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_35655
	btr r12,4
	jmp LB_35656
LB_35655:
	bts r12,4
LB_35656:
	mov r8,r9
	bt r12,3
	jc LB_35657
	btr r12,2
	jmp LB_35658
LB_35657:
	bts r12,2
LB_35658:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_35661
	btr r12,3
	clc
	jmp LB_35662
LB_35661:
	bts r12,3
	stc
LB_35662:
	mov r13,r9
	bt r12,3
	jc LB_35659
	btr r12,0
	jmp LB_35660
LB_35659:
	bts r12,0
LB_35660:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_35665
	btr r12,3
	clc
	jmp LB_35666
LB_35665:
	bts r12,3
	stc
LB_35666:
	mov r14,r9
	bt r12,3
	jc LB_35663
	btr r12,1
	jmp LB_35664
LB_35663:
	bts r12,1
LB_35664:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_34675 %_34676 } ⊢ %_34677 : %_34677
 ; {>  %_34675~{ 0' 1' }:{ _stg _p30734 } %_34676~2':(_lst)◂({ _stg _p30734 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_34677 ⊢ %_34678 : %_34678
 ; {>  %_34677~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p30734 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_34678
 ; {>  %_34678~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p30734 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_35602
	btr r12,5
	jmp LB_35603
LB_35602:
	bts r12,5
LB_35603:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_35600
	btr QWORD [rdi],0
	jmp LB_35601
LB_35600:
	bts QWORD [rdi],0
LB_35601:
	mov r11,r14
	bt r12,1
	jc LB_35606
	btr r12,5
	jmp LB_35607
LB_35606:
	bts r12,5
LB_35607:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_35604
	btr QWORD [rdi],1
	jmp LB_35605
LB_35604:
	bts QWORD [rdi],1
LB_35605:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_35598
	btr QWORD [rdi],0
	jmp LB_35599
LB_35598:
	bts QWORD [rdi],0
LB_35599:
	mov r10,r8
	bt r12,2
	jc LB_35610
	btr r12,4
	jmp LB_35611
LB_35610:
	bts r12,4
LB_35611:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_35608
	btr QWORD [rdi],1
	jmp LB_35609
LB_35608:
	bts QWORD [rdi],1
LB_35609:
	mov rsi,1
	bt r12,3
	jc LB_35596
	mov rsi,0
	bt r9,0
	jc LB_35596
	jmp LB_35597
LB_35596:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35597:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35612:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35614
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35613
LB_35614:
	add rsp,8
	ret
LB_35616:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35615:
	add rsp,64
	pop r14
LB_35613:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35669
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_34679 : %_34679
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34679 ⊢ %_34680 : %_34680
 ; {>  %_34679~°1◂{  }:(_lst)◂(t14703'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34680
 ; {>  %_34680~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14706'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_35667
	mov rsi,0
	bt r9,0
	jc LB_35667
	jmp LB_35668
LB_35667:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35668:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35669:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35671
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35670
LB_35671:
	add rsp,8
	ret
LB_35672:
	add rsp,0
	pop r14
LB_35670:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34569:
NS_E_RDI_34569:
NS_E_34569_ETR_TBL:
NS_E_34569_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_35737
LB_35736:
	add r14,1
LB_35737:
	cmp r14,r10
	jge LB_35738
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35736
	cmp al,10
	jz LB_35736
	cmp al,32
	jz LB_35736
LB_35738:
	add r14,3
	cmp r14,r10
	jg LB_35741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_35741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_35741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_35741
	jmp LB_35742
LB_35741:
	jmp LB_35692
LB_35742:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_35705
LB_35704:
	add r14,1
LB_35705:
	cmp r14,r10
	jge LB_35706
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35704
	cmp al,10
	jz LB_35704
	cmp al,32
	jz LB_35704
LB_35706:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35707
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35708:
	jmp LB_35693
LB_35707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_35711
LB_35710:
	add r14,1
LB_35711:
	cmp r14,r10
	jge LB_35712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35710
	cmp al,10
	jz LB_35710
	cmp al,32
	jz LB_35710
LB_35712:
	add r14,1
	cmp r14,r10
	jg LB_35717
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_35717
	jmp LB_35718
LB_35717:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35714
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35714:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35715
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35715:
	jmp LB_35693
LB_35718:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_35720
LB_35719:
	add r14,1
LB_35720:
	cmp r14,r10
	jge LB_35721
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35719
	cmp al,10
	jz LB_35719
	cmp al,32
	jz LB_35719
LB_35721:
	push r10
	call NS_E_34244_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35722
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35723
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35723:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35724
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35724:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35725:
	jmp LB_35693
LB_35722:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_35728
LB_35727:
	add r14,1
LB_35728:
	cmp r14,r10
	jge LB_35729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35727
	cmp al,10
	jz LB_35727
	cmp al,32
	jz LB_35727
LB_35729:
	push r10
	call NS_E_34569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35730
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_35731
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_35731:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35732
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35732:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35733
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35733:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35734
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35734:
	jmp LB_35693
LB_35730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_35702
	btr r12,4
	clc
	jmp LB_35703
LB_35702:
	bts r12,4
	stc
LB_35703:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35700
	btr r12,3
	clc
	jmp LB_35701
LB_35700:
	bts r12,3
	stc
LB_35701:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35698
	btr r12,2
	clc
	jmp LB_35699
LB_35698:
	bts r12,2
	stc
LB_35699:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35696
	btr r12,1
	clc
	jmp LB_35697
LB_35696:
	bts r12,1
	stc
LB_35697:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35694
	btr r12,0
	clc
	jmp LB_35695
LB_35694:
	bts r12,0
	stc
LB_35695:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_35689
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_35743
	btr r12,5
	jmp LB_35744
LB_35743:
	bts r12,5
LB_35744:
	mov r8,r10
	bt r12,4
	jc LB_35745
	btr r12,2
	jmp LB_35746
LB_35745:
	bts r12,2
LB_35746:
	mov r10,r14
	bt r12,1
	jc LB_35747
	btr r12,4
	jmp LB_35748
LB_35747:
	bts r12,4
LB_35748:
	mov r14,r9
	bt r12,3
	jc LB_35749
	btr r12,1
	jmp LB_35750
LB_35749:
	bts r12,1
LB_35750:
	mov r9,r13
	bt r12,0
	jc LB_35751
	btr r12,3
	jmp LB_35752
LB_35751:
	bts r12,3
LB_35752:
	mov r13,r10
	bt r12,4
	jc LB_35753
	btr r12,0
	jmp LB_35754
LB_35753:
	bts r12,0
LB_35754:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_34681 %_34682 } %_34683 } ⊢ %_34684 : %_34684
 ; {>  %_34681~0':_stg %_34682~1':_p30743 %_34683~2':(_lst)◂({ _stg _p30743 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_34684 ⊢ %_34685 : %_34685
 ; {>  %_34684~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p30743 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_34685
 ; {>  %_34685~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p30743 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_35679
	btr r12,5
	jmp LB_35680
LB_35679:
	bts r12,5
LB_35680:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_35677
	btr QWORD [rdi],0
	jmp LB_35678
LB_35677:
	bts QWORD [rdi],0
LB_35678:
	mov r11,r14
	bt r12,1
	jc LB_35683
	btr r12,5
	jmp LB_35684
LB_35683:
	bts r12,5
LB_35684:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_35681
	btr QWORD [rdi],1
	jmp LB_35682
LB_35681:
	bts QWORD [rdi],1
LB_35682:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_35675
	btr QWORD [rdi],0
	jmp LB_35676
LB_35675:
	bts QWORD [rdi],0
LB_35676:
	mov r10,r8
	bt r12,2
	jc LB_35687
	btr r12,4
	jmp LB_35688
LB_35687:
	bts r12,4
LB_35688:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_35685
	btr QWORD [rdi],1
	jmp LB_35686
LB_35685:
	bts QWORD [rdi],1
LB_35686:
	mov rsi,1
	bt r12,3
	jc LB_35673
	mov rsi,0
	bt r9,0
	jc LB_35673
	jmp LB_35674
LB_35673:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35674:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35689:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35691
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35690
LB_35691:
	add rsp,8
	ret
LB_35693:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35692:
	add rsp,80
	pop r14
LB_35690:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35757
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_34686 : %_34686
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34686 ⊢ %_34687 : %_34687
 ; {>  %_34686~°1◂{  }:(_lst)◂(t14717'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34687
 ; {>  %_34687~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14720'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_35755
	mov rsi,0
	bt r9,0
	jc LB_35755
	jmp LB_35756
LB_35755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35756:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35757:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35759
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35758
LB_35759:
	add rsp,8
	ret
LB_35760:
	add rsp,0
	pop r14
LB_35758:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34570:
NS_E_RDI_34570:
NS_E_34570_ETR_TBL:
NS_E_34570_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_35851
LB_35850:
	add r14,1
LB_35851:
	cmp r14,r10
	jge LB_35852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35850
	cmp al,10
	jz LB_35850
	cmp al,32
	jz LB_35850
LB_35852:
	add r14,1
	cmp r14,r10
	jg LB_35855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_35855
	jmp LB_35856
LB_35855:
	jmp LB_35798
LB_35856:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_35813
LB_35812:
	add r14,1
LB_35813:
	cmp r14,r10
	jge LB_35814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35812
	cmp al,10
	jz LB_35812
	cmp al,32
	jz LB_35812
LB_35814:
	add r14,1
	cmp r14,r10
	jg LB_35818
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_35818
	jmp LB_35819
LB_35818:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35816:
	jmp LB_35799
LB_35819:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_35821
LB_35820:
	add r14,1
LB_35821:
	cmp r14,r10
	jge LB_35822
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35820
	cmp al,10
	jz LB_35820
	cmp al,32
	jz LB_35820
LB_35822:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35823
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35824
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35824:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35825
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35825:
	jmp LB_35799
LB_35823:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_35828
LB_35827:
	add r14,1
LB_35828:
	cmp r14,r10
	jge LB_35829
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35827
	cmp al,10
	jz LB_35827
	cmp al,32
	jz LB_35827
LB_35829:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35830
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35831
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35831:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35832
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35832:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35833
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35833:
	jmp LB_35799
LB_35830:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_35836
LB_35835:
	add r14,1
LB_35836:
	cmp r14,r10
	jge LB_35837
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35835
	cmp al,10
	jz LB_35835
	cmp al,32
	jz LB_35835
LB_35837:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35838
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_35839
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_35839:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35840
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35840:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35841
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35841:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35842
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35842:
	jmp LB_35799
LB_35838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_35848:
	jmp LB_35845
LB_35844:
	add r14,1
LB_35845:
	cmp r14,r10
	jge LB_35846
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35844
	cmp al,10
	jz LB_35844
	cmp al,32
	jz LB_35844
LB_35846:
	push r10
	push rsi
	call NS_E_34571_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_35847
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_35849
	bts QWORD [rax],0
LB_35849:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_35848
LB_35847:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_35810
	btr r12,5
	clc
	jmp LB_35811
LB_35810:
	bts r12,5
	stc
LB_35811:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_35808
	btr r12,4
	clc
	jmp LB_35809
LB_35808:
	bts r12,4
	stc
LB_35809:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35806
	btr r12,3
	clc
	jmp LB_35807
LB_35806:
	bts r12,3
	stc
LB_35807:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35804
	btr r12,2
	clc
	jmp LB_35805
LB_35804:
	bts r12,2
	stc
LB_35805:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35802
	btr r12,1
	clc
	jmp LB_35803
LB_35802:
	bts r12,1
	stc
LB_35803:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35800
	btr r12,0
	clc
	jmp LB_35801
LB_35800:
	bts r12,0
	stc
LB_35801:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_35795
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_35857
	btr r12,6
	jmp LB_35858
LB_35857:
	bts r12,6
LB_35858:
	mov r9,r11
	bt r12,5
	jc LB_35859
	btr r12,3
	jmp LB_35860
LB_35859:
	bts r12,3
LB_35860:
	mov r11,r8
	bt r12,2
	jc LB_35861
	btr r12,5
	jmp LB_35862
LB_35861:
	bts r12,5
LB_35862:
	mov r8,r10
	bt r12,4
	jc LB_35863
	btr r12,2
	jmp LB_35864
LB_35863:
	bts r12,2
LB_35864:
	mov r10,r14
	bt r12,1
	jc LB_35865
	btr r12,4
	jmp LB_35866
LB_35865:
	bts r12,4
LB_35866:
	mov r14,rcx
	bt r12,6
	jc LB_35867
	btr r12,1
	jmp LB_35868
LB_35867:
	bts r12,1
LB_35868:
	mov rcx,r13
	bt r12,0
	jc LB_35869
	btr r12,6
	jmp LB_35870
LB_35869:
	bts r12,6
LB_35870:
	mov r13,r11
	bt r12,5
	jc LB_35871
	btr r12,0
	jmp LB_35872
LB_35871:
	bts r12,0
LB_35872:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f29875 %_34691 ⊢ %_34692 : %_34692
 ; {>  %_34690~2':_p30699 %_34689~1':(_p30686)◂((_p30694)◂(_stg)) %_34691~3':(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) %_34688~0':_stg }
; _f29875 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_35767
	btr r12,0
	jmp LB_35768
LB_35767:
	bts r12,0
LB_35768:
	call NS_E_29875
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_35769
	btr r12,3
	jmp LB_35770
LB_35769:
	bts r12,3
LB_35770:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_35765
	btr r12,2
	clc
	jmp LB_35766
LB_35765:
	bts r12,2
	stc
LB_35766:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_35763
	btr r12,1
	clc
	jmp LB_35764
LB_35763:
	bts r12,1
	stc
LB_35764:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_35761
	btr r12,0
	clc
	jmp LB_35762
LB_35761:
	bts r12,0
	stc
LB_35762:
	add rsp,32
; _cns { { %_34688 %_34689 %_34690 } %_34692 } ⊢ %_34693 : %_34693
 ; {>  %_34690~2':_p30699 %_34689~1':(_p30686)◂((_p30694)◂(_stg)) %_34692~3':(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) %_34688~0':_stg }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f30747 %_34693 ⊢ %_34694 : %_34694
 ; {>  %_34693~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) }
; _f30747 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_34694 ⊢ %_34695 : %_34695
 ; {>  %_34694~°3◂°0◂{ { 0' 1' 2' } 3' }:_p30731 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_34695
 ; {>  %_34695~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p30731) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_35771
	btr r12,4
	jmp LB_35772
LB_35771:
	bts r12,4
LB_35772:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_35781
	btr r12,6
	jmp LB_35782
LB_35781:
	bts r12,6
LB_35782:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_35779
	btr QWORD [rdi],0
	jmp LB_35780
LB_35779:
	bts QWORD [rdi],0
LB_35780:
	mov rcx,r14
	bt r12,1
	jc LB_35785
	btr r12,6
	jmp LB_35786
LB_35785:
	bts r12,6
LB_35786:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_35783
	btr QWORD [rdi],1
	jmp LB_35784
LB_35783:
	bts QWORD [rdi],1
LB_35784:
	mov rcx,r8
	bt r12,2
	jc LB_35789
	btr r12,6
	jmp LB_35790
LB_35789:
	bts r12,6
LB_35790:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_35787
	btr QWORD [rdi],2
	jmp LB_35788
LB_35787:
	bts QWORD [rdi],2
LB_35788:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_35777
	btr QWORD [rdi],0
	jmp LB_35778
LB_35777:
	bts QWORD [rdi],0
LB_35778:
	mov r11,r10
	bt r12,4
	jc LB_35793
	btr r12,5
	jmp LB_35794
LB_35793:
	bts r12,5
LB_35794:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_35791
	btr QWORD [rdi],1
	jmp LB_35792
LB_35791:
	bts QWORD [rdi],1
LB_35792:
	mov rsi,1
	bt r12,3
	jc LB_35775
	mov rsi,0
	bt r9,0
	jc LB_35775
	jmp LB_35776
LB_35775:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35776:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_35773
	mov rsi,0
	bt r9,0
	jc LB_35773
	jmp LB_35774
LB_35773:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35774:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35795:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35797
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35796
LB_35797:
	add rsp,8
	ret
LB_35799:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35798:
	add rsp,96
	pop r14
LB_35796:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_35892
LB_35891:
	add r14,1
LB_35892:
	cmp r14,r10
	jge LB_35893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35891
	cmp al,10
	jz LB_35891
	cmp al,32
	jz LB_35891
LB_35893:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35886
LB_35894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_35897
LB_35896:
	add r14,1
LB_35897:
	cmp r14,r10
	jge LB_35898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35896
	cmp al,10
	jz LB_35896
	cmp al,32
	jz LB_35896
LB_35898:
	push r10
	call NS_E_34572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35899
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35900
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35900:
	jmp LB_35886
LB_35899:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35889
	btr r12,1
	clc
	jmp LB_35890
LB_35889:
	bts r12,1
	stc
LB_35890:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35887
	btr r12,0
	clc
	jmp LB_35888
LB_35887:
	bts r12,0
	stc
LB_35888:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35883
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f30746 { %_34696 %_34697 } ⊢ %_34698 : %_34698
 ; {>  %_34696~0':_stg %_34697~1':_p30733 }
; _f30746 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_34698 ⊢ %_34699 : %_34699
 ; {>  %_34698~°2◂{ 0' 1' }:_p30731 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_34699
 ; {>  %_34699~°0◂°2◂{ 0' 1' }:(_opn)◂(_p30731) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_35877
	btr r12,2
	jmp LB_35878
LB_35877:
	bts r12,2
LB_35878:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_35875
	btr QWORD [rdi],0
	jmp LB_35876
LB_35875:
	bts QWORD [rdi],0
LB_35876:
	mov r8,r14
	bt r12,1
	jc LB_35881
	btr r12,2
	jmp LB_35882
LB_35881:
	bts r12,2
LB_35882:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_35879
	btr QWORD [rdi],1
	jmp LB_35880
LB_35879:
	bts QWORD [rdi],1
LB_35880:
	mov rsi,1
	bt r12,3
	jc LB_35873
	mov rsi,0
	bt r9,0
	jc LB_35873
	jmp LB_35874
LB_35873:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35874:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35883:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35885
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35884
LB_35885:
	add rsp,8
	ret
LB_35886:
	add rsp,32
	pop r14
LB_35884:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_35903
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_34700
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_34700 ⊢ %_34701 : %_34701
 ; {>  %_34700~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_34702 : %_34702
 ; {>  %_34701~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_34702
 ; {>  %_34702~°1◂{  }:(_opn)◂(t14743'(0)) %_34701~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_35902
	mov rdi,r13
	call dlt
LB_35902:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_35903:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35905
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35904
LB_35905:
	add rsp,8
	ret
LB_35906:
	add rsp,0
	pop r14
LB_35904:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34571:
NS_E_RDI_34571:
NS_E_34571_ETR_TBL:
NS_E_34571_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_35934
LB_35933:
	add r14,1
LB_35934:
	cmp r14,r10
	jge LB_35935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35933
	cmp al,10
	jz LB_35933
	cmp al,32
	jz LB_35933
LB_35935:
	add r14,1
	cmp r14,r10
	jg LB_35938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_35938
	jmp LB_35939
LB_35938:
	jmp LB_35922
LB_35939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_35941
LB_35940:
	add r14,1
LB_35941:
	cmp r14,r10
	jge LB_35942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35940
	cmp al,10
	jz LB_35940
	cmp al,32
	jz LB_35940
LB_35942:
	add r14,1
	cmp r14,r10
	jg LB_35946
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_35946
	jmp LB_35947
LB_35946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35944:
	jmp LB_35922
LB_35947:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_35949
LB_35948:
	add r14,1
LB_35949:
	cmp r14,r10
	jge LB_35950
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35948
	cmp al,10
	jz LB_35948
	cmp al,32
	jz LB_35948
LB_35950:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35951
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35952
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35952:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35953
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35953:
	jmp LB_35922
LB_35951:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_35956
LB_35955:
	add r14,1
LB_35956:
	cmp r14,r10
	jge LB_35957
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35955
	cmp al,10
	jz LB_35955
	cmp al,32
	jz LB_35955
LB_35957:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35958
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35959
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35959:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35960
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35960:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35961
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35961:
	jmp LB_35922
LB_35958:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_35964
LB_35963:
	add r14,1
LB_35964:
	cmp r14,r10
	jge LB_35965
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35963
	cmp al,10
	jz LB_35963
	cmp al,32
	jz LB_35963
LB_35965:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_35966
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_35967
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_35967:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_35968
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_35968:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_35969
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_35969:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_35970
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_35970:
	jmp LB_35922
LB_35966:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_35931
	btr r12,4
	clc
	jmp LB_35932
LB_35931:
	bts r12,4
	stc
LB_35932:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_35929
	btr r12,3
	clc
	jmp LB_35930
LB_35929:
	bts r12,3
	stc
LB_35930:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_35927
	btr r12,2
	clc
	jmp LB_35928
LB_35927:
	bts r12,2
	stc
LB_35928:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35925
	btr r12,1
	clc
	jmp LB_35926
LB_35925:
	bts r12,1
	stc
LB_35926:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35923
	btr r12,0
	clc
	jmp LB_35924
LB_35923:
	bts r12,0
	stc
LB_35924:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_35919
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_35972
	btr r12,5
	jmp LB_35973
LB_35972:
	bts r12,5
LB_35973:
	mov r8,r10
	bt r12,4
	jc LB_35974
	btr r12,2
	jmp LB_35975
LB_35974:
	bts r12,2
LB_35975:
	mov r10,r14
	bt r12,1
	jc LB_35976
	btr r12,4
	jmp LB_35977
LB_35976:
	bts r12,4
LB_35977:
	mov r14,r9
	bt r12,3
	jc LB_35978
	btr r12,1
	jmp LB_35979
LB_35978:
	bts r12,1
LB_35979:
	mov r9,r13
	bt r12,0
	jc LB_35980
	btr r12,3
	jmp LB_35981
LB_35980:
	bts r12,3
LB_35981:
	mov r13,r11
	bt r12,5
	jc LB_35982
	btr r12,0
	jmp LB_35983
LB_35982:
	bts r12,0
LB_35983:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_34703 %_34704 %_34705 } ⊢ %_34706 : %_34706
 ; {>  %_34705~2':_p30699 %_34703~0':_stg %_34704~1':(_p30686)◂((_p30694)◂(_stg)) }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_34706
 ; {>  %_34706~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg (_p30686)◂((_p30694)◂(_stg)) _p30699 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_35909
	btr r12,4
	jmp LB_35910
LB_35909:
	bts r12,4
LB_35910:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_35907
	btr QWORD [rdi],0
	jmp LB_35908
LB_35907:
	bts QWORD [rdi],0
LB_35908:
	mov r10,r14
	bt r12,1
	jc LB_35913
	btr r12,4
	jmp LB_35914
LB_35913:
	bts r12,4
LB_35914:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_35911
	btr QWORD [rdi],1
	jmp LB_35912
LB_35911:
	bts QWORD [rdi],1
LB_35912:
	mov r10,r8
	bt r12,2
	jc LB_35917
	btr r12,4
	jmp LB_35918
LB_35917:
	bts r12,4
LB_35918:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_35915
	btr QWORD [rdi],2
	jmp LB_35916
LB_35915:
	bts QWORD [rdi],2
LB_35916:
	mov r8,0
	bts r12,2
	ret
LB_35919:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35921
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35920
LB_35921:
	add rsp,8
	ret
LB_35922:
	add rsp,80
	pop r14
LB_35920:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34572:
NS_E_RDI_34572:
NS_E_34572_ETR_TBL:
NS_E_34572_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_36004
LB_36003:
	add r14,1
LB_36004:
	cmp r14,r10
	jge LB_36005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36003
	cmp al,10
	jz LB_36003
	cmp al,32
	jz LB_36003
LB_36005:
	add r14,1
	cmp r14,r10
	jg LB_36008
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_36008
	jmp LB_36009
LB_36008:
	jmp LB_35991
LB_36009:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_35998
LB_35997:
	add r14,1
LB_35998:
	cmp r14,r10
	jge LB_35999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_35997
	cmp al,10
	jz LB_35997
	cmp al,32
	jz LB_35997
LB_35999:
	push r10
	call NS_E_33581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36000
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36001
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36001:
	jmp LB_35992
LB_36000:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_35995
	btr r12,1
	clc
	jmp LB_35996
LB_35995:
	bts r12,1
	stc
LB_35996:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_35993
	btr r12,0
	clc
	jmp LB_35994
LB_35993:
	bts r12,0
	stc
LB_35994:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_35988
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_36010
	btr r12,2
	jmp LB_36011
LB_36010:
	bts r12,2
LB_36011:
	mov r13,r14
	bt r12,1
	jc LB_36012
	btr r12,0
	jmp LB_36013
LB_36012:
	bts r12,0
LB_36013:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30753 %_34707 ⊢ %_34708 : %_34708
 ; {>  %_34707~0':_p30689 }
; _f30753 0' ⊢ °1◂0'
; _some %_34708 ⊢ %_34709 : %_34709
 ; {>  %_34708~°1◂0':_p30733 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34709
 ; {>  %_34709~°0◂°1◂0':(_opn)◂(_p30733) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_35986
	btr r12,3
	jmp LB_35987
LB_35986:
	bts r12,3
LB_35987:
	mov rsi,1
	bt r12,3
	jc LB_35984
	mov rsi,0
	bt r9,0
	jc LB_35984
	jmp LB_35985
LB_35984:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_35985:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_35988:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_35990
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_35989
LB_35990:
	add rsp,8
	ret
LB_35992:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_35991:
	add rsp,32
	pop r14
LB_35989:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_36034
LB_36033:
	add r14,1
LB_36034:
	cmp r14,r10
	jge LB_36035
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36033
	cmp al,10
	jz LB_36033
	cmp al,32
	jz LB_36033
LB_36035:
	add r14,2
	cmp r14,r10
	jg LB_36038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_36038
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_36038
	jmp LB_36039
LB_36038:
	jmp LB_36021
LB_36039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_36028
LB_36027:
	add r14,1
LB_36028:
	cmp r14,r10
	jge LB_36029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36027
	cmp al,10
	jz LB_36027
	cmp al,32
	jz LB_36027
LB_36029:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36030
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36031
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36031:
	jmp LB_36022
LB_36030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36025
	btr r12,1
	clc
	jmp LB_36026
LB_36025:
	bts r12,1
	stc
LB_36026:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36023
	btr r12,0
	clc
	jmp LB_36024
LB_36023:
	bts r12,0
	stc
LB_36024:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36018
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_36040
	btr r12,2
	jmp LB_36041
LB_36040:
	bts r12,2
LB_36041:
	mov r13,r14
	bt r12,1
	jc LB_36042
	btr r12,0
	jmp LB_36043
LB_36042:
	bts r12,0
LB_36043:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30754 %_34710 ⊢ %_34711 : %_34711
 ; {>  %_34710~0':_p30699 }
; _f30754 0' ⊢ °2◂0'
; _some %_34711 ⊢ %_34712 : %_34712
 ; {>  %_34711~°2◂0':_p30733 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_34712
 ; {>  %_34712~°0◂°2◂0':(_opn)◂(_p30733) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36016
	btr r12,3
	jmp LB_36017
LB_36016:
	bts r12,3
LB_36017:
	mov rsi,1
	bt r12,3
	jc LB_36014
	mov rsi,0
	bt r9,0
	jc LB_36014
	jmp LB_36015
LB_36014:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36015:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36020
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36019
LB_36020:
	add rsp,8
	ret
LB_36022:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36021:
	add rsp,32
	pop r14
LB_36019:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_36063
LB_36062:
	add r14,1
LB_36063:
	cmp r14,r10
	jge LB_36064
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36062
	cmp al,10
	jz LB_36062
	cmp al,32
	jz LB_36062
LB_36064:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36065
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36057
LB_36065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_36068
LB_36067:
	add r14,1
LB_36068:
	cmp r14,r10
	jge LB_36069
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36067
	cmp al,10
	jz LB_36067
	cmp al,32
	jz LB_36067
LB_36069:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36070
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36071
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36071:
	jmp LB_36057
LB_36070:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36060
	btr r12,1
	clc
	jmp LB_36061
LB_36060:
	bts r12,1
	stc
LB_36061:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36058
	btr r12,0
	clc
	jmp LB_36059
LB_36058:
	bts r12,0
	stc
LB_36059:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36054
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f30752 { %_34713 %_34714 } ⊢ %_34715 : %_34715
 ; {>  %_34713~0':(_p30686)◂((_p30694)◂(_stg)) %_34714~1':_p30699 }
; _f30752 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34715 ⊢ %_34716 : %_34716
 ; {>  %_34715~°0◂{ 0' 1' }:_p30733 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34716
 ; {>  %_34716~°0◂°0◂{ 0' 1' }:(_opn)◂(_p30733) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_36048
	btr r12,2
	jmp LB_36049
LB_36048:
	bts r12,2
LB_36049:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_36046
	btr QWORD [rdi],0
	jmp LB_36047
LB_36046:
	bts QWORD [rdi],0
LB_36047:
	mov r8,r14
	bt r12,1
	jc LB_36052
	btr r12,2
	jmp LB_36053
LB_36052:
	bts r12,2
LB_36053:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_36050
	btr QWORD [rdi],1
	jmp LB_36051
LB_36050:
	bts QWORD [rdi],1
LB_36051:
	mov rsi,1
	bt r12,3
	jc LB_36044
	mov rsi,0
	bt r9,0
	jc LB_36044
	jmp LB_36045
LB_36044:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36045:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36054:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36056
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36055
LB_36056:
	add rsp,8
	ret
LB_36057:
	add rsp,32
	pop r14
LB_36055:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34573:
NS_E_RDI_34573:
NS_E_34573_ETR_TBL:
NS_E_34573_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_36093
LB_36092:
	add r14,1
LB_36093:
	cmp r14,r10
	jge LB_36094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36092
	cmp al,10
	jz LB_36092
	cmp al,32
	jz LB_36092
LB_36094:
	add r14,3
	cmp r14,r10
	jg LB_36097
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36097
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_36097
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_36097
	jmp LB_36098
LB_36097:
	jmp LB_36080
LB_36098:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_36087
LB_36086:
	add r14,1
LB_36087:
	cmp r14,r10
	jge LB_36088
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36086
	cmp al,10
	jz LB_36086
	cmp al,32
	jz LB_36086
LB_36088:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36089
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36090
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36090:
	jmp LB_36081
LB_36089:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36084
	btr r12,1
	clc
	jmp LB_36085
LB_36084:
	bts r12,1
	stc
LB_36085:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36082
	btr r12,0
	clc
	jmp LB_36083
LB_36082:
	bts r12,0
	stc
LB_36083:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36077
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_36099
	btr r12,2
	jmp LB_36100
LB_36099:
	bts r12,2
LB_36100:
	mov r13,r14
	bt r12,1
	jc LB_36101
	btr r12,0
	jmp LB_36102
LB_36101:
	bts r12,0
LB_36102:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30709 %_34717 ⊢ %_34718 : %_34718
 ; {>  %_34717~0':(_p30686)◂((_p30693)◂(_stg)) }
; _f30709 0' ⊢ °2◂0'
; _some %_34718 ⊢ %_34719 : %_34719
 ; {>  %_34718~°2◂0':_p30699 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_34719
 ; {>  %_34719~°0◂°2◂0':(_opn)◂(_p30699) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36075
	btr r12,3
	jmp LB_36076
LB_36075:
	bts r12,3
LB_36076:
	mov rsi,1
	bt r12,3
	jc LB_36073
	mov rsi,0
	bt r9,0
	jc LB_36073
	jmp LB_36074
LB_36073:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36074:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36077:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36079
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36078
LB_36079:
	add rsp,8
	ret
LB_36081:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36080:
	add rsp,32
	pop r14
LB_36078:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_36114
LB_36113:
	add r14,1
LB_36114:
	cmp r14,r10
	jge LB_36115
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36113
	cmp al,10
	jz LB_36113
	cmp al,32
	jz LB_36113
LB_36115:
	push r10
	call NS_E_34582_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36116
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36110
LB_36116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36111
	btr r12,0
	clc
	jmp LB_36112
LB_36111:
	bts r12,0
	stc
LB_36112:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_36107
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30708 %_34720 ⊢ %_34721 : %_34721
 ; {>  %_34720~0':_p30700 }
; _f30708 0' ⊢ °1◂0'
; _some %_34721 ⊢ %_34722 : %_34722
 ; {>  %_34721~°1◂0':_p30699 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34722
 ; {>  %_34722~°0◂°1◂0':(_opn)◂(_p30699) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36105
	btr r12,3
	jmp LB_36106
LB_36105:
	bts r12,3
LB_36106:
	mov rsi,1
	bt r12,3
	jc LB_36103
	mov rsi,0
	bt r9,0
	jc LB_36103
	jmp LB_36104
LB_36103:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36104:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36107:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36109
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36108
LB_36109:
	add rsp,8
	ret
LB_36110:
	add rsp,16
	pop r14
LB_36108:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_36149
LB_36148:
	add r14,1
LB_36149:
	cmp r14,r10
	jge LB_36150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36148
	cmp al,10
	jz LB_36148
	cmp al,32
	jz LB_36148
LB_36150:
	push r10
	call NS_E_34574_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36151
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36143
LB_36151:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_36154
LB_36153:
	add r14,1
LB_36154:
	cmp r14,r10
	jge LB_36155
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36153
	cmp al,10
	jz LB_36153
	cmp al,32
	jz LB_36153
LB_36155:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36156
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36157
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36157:
	jmp LB_36143
LB_36156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36146
	btr r12,1
	clc
	jmp LB_36147
LB_36146:
	bts r12,1
	stc
LB_36147:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36144
	btr r12,0
	clc
	jmp LB_36145
LB_36144:
	bts r12,0
	stc
LB_36145:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36140
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_36159
	btr r12,3
	jmp LB_36160
LB_36159:
	bts r12,3
LB_36160:
	mov r10,r13
	bt r12,0
	jc LB_36161
	btr r12,4
	jmp LB_36162
LB_36161:
	bts r12,4
LB_36162:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_36165
	btr r12,5
	clc
	jmp LB_36166
LB_36165:
	bts r12,5
	stc
LB_36166:
	mov r13,r11
	bt r12,5
	jc LB_36163
	btr r12,0
	jmp LB_36164
LB_36163:
	bts r12,0
LB_36164:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_36169
	btr r12,5
	clc
	jmp LB_36170
LB_36169:
	bts r12,5
	stc
LB_36170:
	mov r14,r11
	bt r12,5
	jc LB_36167
	btr r12,1
	jmp LB_36168
LB_36167:
	bts r12,1
LB_36168:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_36173
	btr r12,5
	clc
	jmp LB_36174
LB_36173:
	bts r12,5
	stc
LB_36174:
	mov r8,r11
	bt r12,5
	jc LB_36171
	btr r12,2
	jmp LB_36172
LB_36171:
	bts r12,2
LB_36172:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f30707 { %_34723 %_34724 } ⊢ %_34725 : %_34725
 ; {>  %_34724~3':_p30699 %_34723~{ 0' 1' 2' }:{ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) } }
; _f30707 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_34725 ⊢ %_34726 : %_34726
 ; {>  %_34725~°0◂{ { 0' 1' 2' } 3' }:_p30699 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_34726
 ; {>  %_34726~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p30699) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_36118
	btr r12,4
	jmp LB_36119
LB_36118:
	bts r12,4
LB_36119:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_36126
	btr r12,6
	jmp LB_36127
LB_36126:
	bts r12,6
LB_36127:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_36124
	btr QWORD [rdi],0
	jmp LB_36125
LB_36124:
	bts QWORD [rdi],0
LB_36125:
	mov rcx,r14
	bt r12,1
	jc LB_36130
	btr r12,6
	jmp LB_36131
LB_36130:
	bts r12,6
LB_36131:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_36128
	btr QWORD [rdi],1
	jmp LB_36129
LB_36128:
	bts QWORD [rdi],1
LB_36129:
	mov rcx,r8
	bt r12,2
	jc LB_36134
	btr r12,6
	jmp LB_36135
LB_36134:
	bts r12,6
LB_36135:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_36132
	btr QWORD [rdi],2
	jmp LB_36133
LB_36132:
	bts QWORD [rdi],2
LB_36133:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_36122
	btr QWORD [rdi],0
	jmp LB_36123
LB_36122:
	bts QWORD [rdi],0
LB_36123:
	mov r11,r10
	bt r12,4
	jc LB_36138
	btr r12,5
	jmp LB_36139
LB_36138:
	bts r12,5
LB_36139:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_36136
	btr QWORD [rdi],1
	jmp LB_36137
LB_36136:
	bts QWORD [rdi],1
LB_36137:
	mov rsi,1
	bt r12,3
	jc LB_36120
	mov rsi,0
	bt r9,0
	jc LB_36120
	jmp LB_36121
LB_36120:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36121:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36140:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36142
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36141
LB_36142:
	add rsp,8
	ret
LB_36143:
	add rsp,32
	pop r14
LB_36141:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34574:
NS_E_RDI_34574:
NS_E_34574_ETR_TBL:
NS_E_34574_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_36240
LB_36239:
	add r14,1
LB_36240:
	cmp r14,r10
	jge LB_36241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36239
	cmp al,10
	jz LB_36239
	cmp al,32
	jz LB_36239
LB_36241:
	add r14,1
	cmp r14,r10
	jg LB_36244
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_36244
	jmp LB_36245
LB_36244:
	jmp LB_36195
LB_36245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_36208
LB_36207:
	add r14,1
LB_36208:
	cmp r14,r10
	jge LB_36209
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36207
	cmp al,10
	jz LB_36207
	cmp al,32
	jz LB_36207
LB_36209:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36210
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36211:
	jmp LB_36196
LB_36210:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_36214
LB_36213:
	add r14,1
LB_36214:
	cmp r14,r10
	jge LB_36215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36213
	cmp al,10
	jz LB_36213
	cmp al,32
	jz LB_36213
LB_36215:
	add r14,3
	cmp r14,r10
	jg LB_36220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_36220
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_36220
	jmp LB_36221
LB_36220:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36217
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36217:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36218:
	jmp LB_36196
LB_36221:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_36223
LB_36222:
	add r14,1
LB_36223:
	cmp r14,r10
	jge LB_36224
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36222
	cmp al,10
	jz LB_36222
	cmp al,32
	jz LB_36222
LB_36224:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36225
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36226
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36226:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36227
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36227:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36228
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36228:
	jmp LB_36196
LB_36225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_36231
LB_36230:
	add r14,1
LB_36231:
	cmp r14,r10
	jge LB_36232
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36230
	cmp al,10
	jz LB_36230
	cmp al,32
	jz LB_36230
LB_36232:
	push r10
	call NS_E_33977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36233
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_36234
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_36234:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36235
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36235:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36236
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36236:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36237
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36237:
	jmp LB_36196
LB_36233:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_36205
	btr r12,4
	clc
	jmp LB_36206
LB_36205:
	bts r12,4
	stc
LB_36206:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_36203
	btr r12,3
	clc
	jmp LB_36204
LB_36203:
	bts r12,3
	stc
LB_36204:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36201
	btr r12,2
	clc
	jmp LB_36202
LB_36201:
	bts r12,2
	stc
LB_36202:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36199
	btr r12,1
	clc
	jmp LB_36200
LB_36199:
	bts r12,1
	stc
LB_36200:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36197
	btr r12,0
	clc
	jmp LB_36198
LB_36197:
	bts r12,0
	stc
LB_36198:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_36192
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_36246
	btr r12,5
	jmp LB_36247
LB_36246:
	bts r12,5
LB_36247:
	mov r8,r10
	bt r12,4
	jc LB_36248
	btr r12,2
	jmp LB_36249
LB_36248:
	bts r12,2
LB_36249:
	mov r10,r14
	bt r12,1
	jc LB_36250
	btr r12,4
	jmp LB_36251
LB_36250:
	bts r12,4
LB_36251:
	mov r14,r9
	bt r12,3
	jc LB_36252
	btr r12,1
	jmp LB_36253
LB_36252:
	bts r12,1
LB_36253:
	mov r9,r13
	bt r12,0
	jc LB_36254
	btr r12,3
	jmp LB_36255
LB_36254:
	bts r12,3
LB_36255:
	mov r13,r10
	bt r12,4
	jc LB_36256
	btr r12,0
	jmp LB_36257
LB_36256:
	bts r12,0
LB_36257:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_34730 : %_34730
 ; {>  %_34729~2':_p33976 %_34728~1':(_p30686)◂((_p30694)◂(_stg)) %_34727~0':(_p30686)◂((_p30693)◂(_stg)) }
; 	» 0xr1 _ ⊢ 3' : %_34730
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f30719 %_34730 ⊢ %_34731 : %_34731
 ; {>  %_34729~2':_p33976 %_34728~1':(_p30686)◂((_p30694)◂(_stg)) %_34730~3':_r64 %_34727~0':(_p30686)◂((_p30693)◂(_stg)) }
; _f30719 3' ⊢ °1◂3'
; _some { %_34731 %_34727 %_34728 } ⊢ %_34732 : %_34732
 ; {>  %_34731~°1◂3':_p30704 %_34729~2':_p33976 %_34728~1':(_p30686)◂((_p30694)◂(_stg)) %_34727~0':(_p30686)◂((_p30693)◂(_stg)) }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_34732
 ; {>  %_34732~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) }) %_34729~2':_p33976 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_36175
	mov rdi,r8
	call dlt
LB_36175:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_36176
	btr r12,4
	jmp LB_36177
LB_36176:
	bts r12,4
LB_36177:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_36182
	btr r12,2
	jmp LB_36183
LB_36182:
	bts r12,2
LB_36183:
	mov rsi,1
	bt r12,2
	jc LB_36180
	mov rsi,0
	bt r8,0
	jc LB_36180
	jmp LB_36181
LB_36180:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36181:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_36178
	btr QWORD [rdi],0
	jmp LB_36179
LB_36178:
	bts QWORD [rdi],0
LB_36179:
	mov r8,r13
	bt r12,0
	jc LB_36186
	btr r12,2
	jmp LB_36187
LB_36186:
	bts r12,2
LB_36187:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_36184
	btr QWORD [rdi],1
	jmp LB_36185
LB_36184:
	bts QWORD [rdi],1
LB_36185:
	mov r8,r14
	bt r12,1
	jc LB_36190
	btr r12,2
	jmp LB_36191
LB_36190:
	bts r12,2
LB_36191:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_36188
	btr QWORD [rdi],2
	jmp LB_36189
LB_36188:
	bts QWORD [rdi],2
LB_36189:
	mov r8,0
	bts r12,2
	ret
LB_36192:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36194
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36193
LB_36194:
	add rsp,8
	ret
LB_36196:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36195:
	add rsp,80
	pop r14
LB_36193:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_36350
LB_36349:
	add r14,1
LB_36350:
	cmp r14,r10
	jge LB_36351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36349
	cmp al,10
	jz LB_36349
	cmp al,32
	jz LB_36349
LB_36351:
	add r14,3
	cmp r14,r10
	jg LB_36354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_36354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_36354
	jmp LB_36355
LB_36354:
	jmp LB_36291
LB_36355:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_36306
LB_36305:
	add r14,1
LB_36306:
	cmp r14,r10
	jge LB_36307
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36305
	cmp al,10
	jz LB_36305
	cmp al,32
	jz LB_36305
LB_36307:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36308
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36309
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36309:
	jmp LB_36292
LB_36308:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_36312
LB_36311:
	add r14,1
LB_36312:
	cmp r14,r10
	jge LB_36313
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36311
	cmp al,10
	jz LB_36311
	cmp al,32
	jz LB_36311
LB_36313:
	add r14,1
	cmp r14,r10
	jg LB_36318
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_36318
	jmp LB_36319
LB_36318:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36315
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36315:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36316
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36316:
	jmp LB_36292
LB_36319:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_36321
LB_36320:
	add r14,1
LB_36321:
	cmp r14,r10
	jge LB_36322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36320
	cmp al,10
	jz LB_36320
	cmp al,32
	jz LB_36320
LB_36322:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36323
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36324
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36324:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36325
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36325:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36326
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36326:
	jmp LB_36292
LB_36323:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_36329
LB_36328:
	add r14,1
LB_36329:
	cmp r14,r10
	jge LB_36330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36328
	cmp al,10
	jz LB_36328
	cmp al,32
	jz LB_36328
LB_36330:
	add r14,3
	cmp r14,r10
	jg LB_36337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_36337
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_36337
	jmp LB_36338
LB_36337:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_36332
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_36332:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36333
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36333:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36334
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36335:
	jmp LB_36292
LB_36338:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_36340
LB_36339:
	add r14,1
LB_36340:
	cmp r14,r10
	jge LB_36341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36339
	cmp al,10
	jz LB_36339
	cmp al,32
	jz LB_36339
LB_36341:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36342
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_36343
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_36343:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_36344
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_36344:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36345
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36345:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36346
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36346:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36347
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36347:
	jmp LB_36292
LB_36342:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_36303
	btr r12,5
	clc
	jmp LB_36304
LB_36303:
	bts r12,5
	stc
LB_36304:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_36301
	btr r12,4
	clc
	jmp LB_36302
LB_36301:
	bts r12,4
	stc
LB_36302:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_36299
	btr r12,3
	clc
	jmp LB_36300
LB_36299:
	bts r12,3
	stc
LB_36300:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36297
	btr r12,2
	clc
	jmp LB_36298
LB_36297:
	bts r12,2
	stc
LB_36298:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36295
	btr r12,1
	clc
	jmp LB_36296
LB_36295:
	bts r12,1
	stc
LB_36296:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36293
	btr r12,0
	clc
	jmp LB_36294
LB_36293:
	bts r12,0
	stc
LB_36294:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_36288
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_36356
	btr r12,6
	jmp LB_36357
LB_36356:
	bts r12,6
LB_36357:
	mov r8,r11
	bt r12,5
	jc LB_36358
	btr r12,2
	jmp LB_36359
LB_36358:
	bts r12,2
LB_36359:
	mov r11,r14
	bt r12,1
	jc LB_36360
	btr r12,5
	jmp LB_36361
LB_36360:
	bts r12,5
LB_36361:
	mov r14,r9
	bt r12,3
	jc LB_36362
	btr r12,1
	jmp LB_36363
LB_36362:
	bts r12,1
LB_36363:
	mov r9,r13
	bt r12,0
	jc LB_36364
	btr r12,3
	jmp LB_36365
LB_36364:
	bts r12,3
LB_36365:
	mov r13,r11
	bt r12,5
	jc LB_36366
	btr r12,0
	jmp LB_36367
LB_36366:
	bts r12,0
LB_36367:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f30720 {  } ⊢ %_34736 : %_34736
 ; {>  %_34733~0':(_p30686)◂((_p30693)◂(_stg)) %_34734~1':(_p30686)◂((_p30693)◂(_stg)) %_34735~2':(_p30686)◂((_p30694)◂(_stg)) }
; _f30720 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_34737 : %_34737
 ; {>  %_34733~0':(_p30686)◂((_p30693)◂(_stg)) %_34736~°2◂{  }:_p30704 %_34734~1':(_p30686)◂((_p30693)◂(_stg)) %_34735~2':(_p30686)◂((_p30694)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _cns { %_34734 %_34737 } ⊢ %_34738 : %_34738
 ; {>  %_34733~0':(_p30686)◂((_p30693)◂(_stg)) %_34736~°2◂{  }:_p30704 %_34737~°1◂{  }:(_lst)◂(t14790'(0)) %_34734~1':(_p30686)◂((_p30693)◂(_stg)) %_34735~2':(_p30686)◂((_p30694)◂(_stg)) }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_34733 %_34738 } ⊢ %_34739 : %_34739
 ; {>  %_34733~0':(_p30686)◂((_p30693)◂(_stg)) %_34736~°2◂{  }:_p30704 %_34738~°0◂{ 1' °1◂{  } }:(_lst)◂((_p30686)◂((_p30693)◂(_stg))) %_34735~2':(_p30686)◂((_p30694)◂(_stg)) }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f30687 %_34739 ⊢ %_34740 : %_34740
 ; {>  %_34739~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂((_p30686)◂((_p30693)◂(_stg))) %_34736~°2◂{  }:_p30704 %_34735~2':(_p30686)◂((_p30694)◂(_stg)) }
; _f30687 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_34736 %_34740 %_34735 } ⊢ %_34741 : %_34741
 ; {>  %_34736~°2◂{  }:_p30704 %_34735~2':(_p30686)◂((_p30694)◂(_stg)) %_34740~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_p30686)◂((_p30693)◂(_stg)) }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_34741
 ; {>  %_34741~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_36260
	mov rsi,0
	bt r10,0
	jc LB_36260
	jmp LB_36261
LB_36260:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_36261:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_36258
	btr QWORD [rdi],0
	jmp LB_36259
LB_36258:
	bts QWORD [rdi],0
LB_36259:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_36270
	btr r12,5
	jmp LB_36271
LB_36270:
	bts r12,5
LB_36271:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_36268
	btr QWORD [rdi],0
	jmp LB_36269
LB_36268:
	bts QWORD [rdi],0
LB_36269:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_36278
	btr r12,0
	jmp LB_36279
LB_36278:
	bts r12,0
LB_36279:
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_36276
	btr QWORD [rdi],0
	jmp LB_36277
LB_36276:
	bts QWORD [rdi],0
LB_36277:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_36282
	mov rsi,0
	bt r13,0
	jc LB_36282
	jmp LB_36283
LB_36282:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_36283:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_36280
	btr QWORD [rdi],1
	jmp LB_36281
LB_36280:
	bts QWORD [rdi],1
LB_36281:
	mov rsi,1
	bt r12,5
	jc LB_36274
	mov rsi,0
	bt r11,0
	jc LB_36274
	jmp LB_36275
LB_36274:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_36275:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_36272
	btr QWORD [rdi],1
	jmp LB_36273
LB_36272:
	bts QWORD [rdi],1
LB_36273:
	mov rsi,1
	bt r12,4
	jc LB_36266
	mov rsi,0
	bt r10,0
	jc LB_36266
	jmp LB_36267
LB_36266:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_36267:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_36264
	mov rsi,0
	bt r10,0
	jc LB_36264
	jmp LB_36265
LB_36264:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_36265:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_36262
	btr QWORD [rdi],1
	jmp LB_36263
LB_36262:
	bts QWORD [rdi],1
LB_36263:
	mov r10,r8
	bt r12,2
	jc LB_36286
	btr r12,4
	jmp LB_36287
LB_36286:
	bts r12,4
LB_36287:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_36284
	btr QWORD [rdi],2
	jmp LB_36285
LB_36284:
	bts QWORD [rdi],2
LB_36285:
	mov r8,0
	bts r12,2
	ret
LB_36288:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36290
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36289
LB_36290:
	add rsp,8
	ret
LB_36292:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36291:
	add rsp,96
	pop r14
LB_36289:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_36396
LB_36395:
	add r14,1
LB_36396:
	cmp r14,r10
	jge LB_36397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36395
	cmp al,10
	jz LB_36395
	cmp al,32
	jz LB_36395
LB_36397:
	add r14,2
	cmp r14,r10
	jg LB_36400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_36400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_36400
	jmp LB_36401
LB_36400:
	jmp LB_36383
LB_36401:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_36390
LB_36389:
	add r14,1
LB_36390:
	cmp r14,r10
	jge LB_36391
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36389
	cmp al,10
	jz LB_36389
	cmp al,32
	jz LB_36389
LB_36391:
	push r10
	call NS_E_34575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36392
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36393
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36393:
	jmp LB_36384
LB_36392:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36387
	btr r12,1
	clc
	jmp LB_36388
LB_36387:
	bts r12,1
	stc
LB_36388:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36385
	btr r12,0
	clc
	jmp LB_36386
LB_36385:
	bts r12,0
	stc
LB_36386:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36380
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_36402
	btr r12,3
	jmp LB_36403
LB_36402:
	bts r12,3
LB_36403:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_36406
	btr r12,4
	clc
	jmp LB_36407
LB_36406:
	bts r12,4
	stc
LB_36407:
	mov r13,r10
	bt r12,4
	jc LB_36404
	btr r12,0
	jmp LB_36405
LB_36404:
	bts r12,0
LB_36405:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_36410
	btr r12,4
	clc
	jmp LB_36411
LB_36410:
	bts r12,4
	stc
LB_36411:
	mov r14,r10
	bt r12,4
	jc LB_36408
	btr r12,1
	jmp LB_36409
LB_36408:
	bts r12,1
LB_36409:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_36414
	btr r12,4
	clc
	jmp LB_36415
LB_36414:
	bts r12,4
	stc
LB_36415:
	mov r8,r10
	bt r12,4
	jc LB_36412
	btr r12,2
	jmp LB_36413
LB_36412:
	bts r12,2
LB_36413:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34742 ⊢ %_34743 : %_34743
 ; {>  %_34742~{ 0' 1' 2' }:{ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_34743
 ; {>  %_34743~°0◂{ 0' 1' 2' }:(_opn)◂({ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_36370
	btr r12,4
	jmp LB_36371
LB_36370:
	bts r12,4
LB_36371:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_36368
	btr QWORD [rdi],0
	jmp LB_36369
LB_36368:
	bts QWORD [rdi],0
LB_36369:
	mov r10,r14
	bt r12,1
	jc LB_36374
	btr r12,4
	jmp LB_36375
LB_36374:
	bts r12,4
LB_36375:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_36372
	btr QWORD [rdi],1
	jmp LB_36373
LB_36372:
	bts QWORD [rdi],1
LB_36373:
	mov r10,r8
	bt r12,2
	jc LB_36378
	btr r12,4
	jmp LB_36379
LB_36378:
	bts r12,4
LB_36379:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_36376
	btr QWORD [rdi],2
	jmp LB_36377
LB_36376:
	bts QWORD [rdi],2
LB_36377:
	mov r8,0
	bts r12,2
	ret
LB_36380:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36382
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36381
LB_36382:
	add rsp,8
	ret
LB_36384:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36383:
	add rsp,32
	pop r14
LB_36381:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_36443
LB_36442:
	add r14,1
LB_36443:
	cmp r14,r10
	jge LB_36444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36442
	cmp al,10
	jz LB_36442
	cmp al,32
	jz LB_36442
LB_36444:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36445
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36433
LB_36445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_36448
LB_36447:
	add r14,1
LB_36448:
	cmp r14,r10
	jge LB_36449
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36447
	cmp al,10
	jz LB_36447
	cmp al,32
	jz LB_36447
LB_36449:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36450
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36451
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36451:
	jmp LB_36433
LB_36450:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_36454
LB_36453:
	add r14,1
LB_36454:
	cmp r14,r10
	jge LB_36455
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36453
	cmp al,10
	jz LB_36453
	cmp al,32
	jz LB_36453
LB_36455:
	add r14,3
	cmp r14,r10
	jg LB_36460
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36460
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_36460
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_36460
	jmp LB_36461
LB_36460:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36457
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36457:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36458
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36458:
	jmp LB_36433
LB_36461:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_36463
LB_36462:
	add r14,1
LB_36463:
	cmp r14,r10
	jge LB_36464
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36462
	cmp al,10
	jz LB_36462
	cmp al,32
	jz LB_36462
LB_36464:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36465
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36466
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36466:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36467
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36467:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36468
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36468:
	jmp LB_36433
LB_36465:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_36440
	btr r12,3
	clc
	jmp LB_36441
LB_36440:
	bts r12,3
	stc
LB_36441:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36438
	btr r12,2
	clc
	jmp LB_36439
LB_36438:
	bts r12,2
	stc
LB_36439:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36436
	btr r12,1
	clc
	jmp LB_36437
LB_36436:
	bts r12,1
	stc
LB_36437:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36434
	btr r12,0
	clc
	jmp LB_36435
LB_36434:
	bts r12,0
	stc
LB_36435:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_36430
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_36470
	btr r12,4
	jmp LB_36471
LB_36470:
	bts r12,4
LB_36471:
	mov r8,r9
	bt r12,3
	jc LB_36472
	btr r12,2
	jmp LB_36473
LB_36472:
	bts r12,2
LB_36473:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f30718 %_34744 ⊢ %_34747 : %_34747
 ; {>  %_34746~2':(_p30686)◂((_p30694)◂(_stg)) %_34745~1':(_p30686)◂((_p30693)◂(_stg)) %_34744~0':_p30641 }
; _f30718 0' ⊢ °0◂0'
; _some { %_34747 %_34745 %_34746 } ⊢ %_34748 : %_34748
 ; {>  %_34746~2':(_p30686)◂((_p30694)◂(_stg)) %_34745~1':(_p30686)◂((_p30693)◂(_stg)) %_34747~°0◂0':_p30704 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_34748
 ; {>  %_34748~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_36420
	btr r12,4
	jmp LB_36421
LB_36420:
	bts r12,4
LB_36421:
	mov rsi,1
	bt r12,4
	jc LB_36418
	mov rsi,0
	bt r10,0
	jc LB_36418
	jmp LB_36419
LB_36418:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_36419:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_36416
	btr QWORD [rdi],0
	jmp LB_36417
LB_36416:
	bts QWORD [rdi],0
LB_36417:
	mov r10,r14
	bt r12,1
	jc LB_36424
	btr r12,4
	jmp LB_36425
LB_36424:
	bts r12,4
LB_36425:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_36422
	btr QWORD [rdi],1
	jmp LB_36423
LB_36422:
	bts QWORD [rdi],1
LB_36423:
	mov r10,r8
	bt r12,2
	jc LB_36428
	btr r12,4
	jmp LB_36429
LB_36428:
	bts r12,4
LB_36429:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_36426
	btr QWORD [rdi],2
	jmp LB_36427
LB_36426:
	bts QWORD [rdi],2
LB_36427:
	mov r8,0
	bts r12,2
	ret
LB_36430:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36432
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36431
LB_36432:
	add rsp,8
	ret
LB_36433:
	add rsp,64
	pop r14
LB_36431:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34575:
NS_E_RDI_34575:
NS_E_34575_ETR_TBL:
NS_E_34575_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_36532
LB_36531:
	add r14,1
LB_36532:
	cmp r14,r10
	jge LB_36533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36531
	cmp al,10
	jz LB_36531
	cmp al,32
	jz LB_36531
LB_36533:
	add r14,2
	cmp r14,r10
	jg LB_36536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_36536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_36536
	jmp LB_36537
LB_36536:
	jmp LB_36499
LB_36537:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_36510
LB_36509:
	add r14,1
LB_36510:
	cmp r14,r10
	jge LB_36511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36509
	cmp al,10
	jz LB_36509
	cmp al,32
	jz LB_36509
LB_36511:
	push r10
	call NS_E_34576_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36512
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36513
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36513:
	jmp LB_36500
LB_36512:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_36519:
	jmp LB_36516
LB_36515:
	add r14,1
LB_36516:
	cmp r14,r10
	jge LB_36517
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36515
	cmp al,10
	jz LB_36515
	cmp al,32
	jz LB_36515
LB_36517:
	push r10
	push rsi
	call NS_E_34577_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_36518
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_36520
	bts QWORD [rax],0
LB_36520:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_36519
LB_36518:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_36522
LB_36521:
	add r14,1
LB_36522:
	cmp r14,r10
	jge LB_36523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36521
	cmp al,10
	jz LB_36521
	cmp al,32
	jz LB_36521
LB_36523:
	add r14,2
	cmp r14,r10
	jg LB_36529
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_36529
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_36529
	jmp LB_36530
LB_36529:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36525
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36525:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36526
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36526:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36527
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36527:
	jmp LB_36500
LB_36530:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_36507
	btr r12,3
	clc
	jmp LB_36508
LB_36507:
	bts r12,3
	stc
LB_36508:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36505
	btr r12,2
	clc
	jmp LB_36506
LB_36505:
	bts r12,2
	stc
LB_36506:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36503
	btr r12,1
	clc
	jmp LB_36504
LB_36503:
	bts r12,1
	stc
LB_36504:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36501
	btr r12,0
	clc
	jmp LB_36502
LB_36501:
	bts r12,0
	stc
LB_36502:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_36496
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_36538
	btr r12,4
	jmp LB_36539
LB_36538:
	bts r12,4
LB_36539:
	mov r9,r8
	bt r12,2
	jc LB_36540
	btr r12,3
	jmp LB_36541
LB_36540:
	bts r12,3
LB_36541:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_36542
	btr r12,4
	jmp LB_36543
LB_36542:
	bts r12,4
LB_36543:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_36546
	btr r12,5
	clc
	jmp LB_36547
LB_36546:
	bts r12,5
	stc
LB_36547:
	mov r13,r11
	bt r12,5
	jc LB_36544
	btr r12,0
	jmp LB_36545
LB_36544:
	bts r12,0
LB_36545:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_36550
	btr r12,5
	clc
	jmp LB_36551
LB_36550:
	bts r12,5
	stc
LB_36551:
	mov r14,r11
	bt r12,5
	jc LB_36548
	btr r12,1
	jmp LB_36549
LB_36548:
	bts r12,1
LB_36549:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_36554
	btr r12,5
	clc
	jmp LB_36555
LB_36554:
	bts r12,5
	stc
LB_36555:
	mov r8,r11
	bt r12,5
	jc LB_36552
	btr r12,2
	jmp LB_36553
LB_36552:
	bts r12,2
LB_36553:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f30722 { %_34749 %_34752 } ⊢ %_34753 : %_34753
 ; {>  %_34752~3':(_lst)◂(_p30705) %_34750~1':(_p30686)◂((_p30693)◂(_stg)) %_34751~2':(_p30686)◂((_p30694)◂(_stg)) %_34749~0':_r64 }
; _f30722 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_34753 %_34750 %_34751 } ⊢ %_34754 : %_34754
 ; {>  %_34750~1':(_p30686)◂((_p30693)◂(_stg)) %_34751~2':(_p30686)◂((_p30694)◂(_stg)) %_34753~°4◂{ 0' 3' }:_p30704 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_34754
 ; {>  %_34754~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p30704 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_36474
	btr r12,4
	jmp LB_36475
LB_36474:
	bts r12,4
LB_36475:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_36482
	btr r12,6
	jmp LB_36483
LB_36482:
	bts r12,6
LB_36483:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_36480
	btr QWORD [rdi],0
	jmp LB_36481
LB_36480:
	bts QWORD [rdi],0
LB_36481:
	mov rcx,r10
	bt r12,4
	jc LB_36486
	btr r12,6
	jmp LB_36487
LB_36486:
	bts r12,6
LB_36487:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_36484
	btr QWORD [rdi],1
	jmp LB_36485
LB_36484:
	bts QWORD [rdi],1
LB_36485:
	mov rsi,1
	bt r12,5
	jc LB_36478
	mov rsi,0
	bt r11,0
	jc LB_36478
	jmp LB_36479
LB_36478:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_36479:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_36476
	btr QWORD [rdi],0
	jmp LB_36477
LB_36476:
	bts QWORD [rdi],0
LB_36477:
	mov r11,r14
	bt r12,1
	jc LB_36490
	btr r12,5
	jmp LB_36491
LB_36490:
	bts r12,5
LB_36491:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_36488
	btr QWORD [rdi],1
	jmp LB_36489
LB_36488:
	bts QWORD [rdi],1
LB_36489:
	mov r11,r8
	bt r12,2
	jc LB_36494
	btr r12,5
	jmp LB_36495
LB_36494:
	bts r12,5
LB_36495:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_36492
	btr QWORD [rdi],2
	jmp LB_36493
LB_36492:
	bts QWORD [rdi],2
LB_36493:
	mov r8,0
	bts r12,2
	ret
LB_36496:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36498
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36497
LB_36498:
	add rsp,8
	ret
LB_36500:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36499:
	add rsp,64
	pop r14
LB_36497:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_36585
LB_36584:
	add r14,1
LB_36585:
	cmp r14,r10
	jge LB_36586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36584
	cmp al,10
	jz LB_36584
	cmp al,32
	jz LB_36584
LB_36586:
	push r10
	call NS_E_33581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36587
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36575
LB_36587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_36590
LB_36589:
	add r14,1
LB_36590:
	cmp r14,r10
	jge LB_36591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36589
	cmp al,10
	jz LB_36589
	cmp al,32
	jz LB_36589
LB_36591:
	add r14,1
	cmp r14,r10
	jg LB_36595
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_36595
	jmp LB_36596
LB_36595:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36593
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36593:
	jmp LB_36575
LB_36596:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_36598
LB_36597:
	add r14,1
LB_36598:
	cmp r14,r10
	jge LB_36599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36597
	cmp al,10
	jz LB_36597
	cmp al,32
	jz LB_36597
LB_36599:
	add r14,3
	cmp r14,r10
	jg LB_36604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_36604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_36604
	jmp LB_36605
LB_36604:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36601
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36601:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36602:
	jmp LB_36575
LB_36605:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_36607
LB_36606:
	add r14,1
LB_36607:
	cmp r14,r10
	jge LB_36608
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36606
	cmp al,10
	jz LB_36606
	cmp al,32
	jz LB_36606
LB_36608:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36609
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36610
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36610:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36611
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36611:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36612
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36612:
	jmp LB_36575
LB_36609:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_36582
	btr r12,3
	clc
	jmp LB_36583
LB_36582:
	bts r12,3
	stc
LB_36583:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36580
	btr r12,2
	clc
	jmp LB_36581
LB_36580:
	bts r12,2
	stc
LB_36581:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36578
	btr r12,1
	clc
	jmp LB_36579
LB_36578:
	bts r12,1
	stc
LB_36579:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36576
	btr r12,0
	clc
	jmp LB_36577
LB_36576:
	bts r12,0
	stc
LB_36577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_36572
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_36614
	btr r12,4
	jmp LB_36615
LB_36614:
	bts r12,4
LB_36615:
	mov r14,r9
	bt r12,3
	jc LB_36616
	btr r12,1
	jmp LB_36617
LB_36616:
	bts r12,1
LB_36617:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30721 %_34755 ⊢ %_34757 : %_34757
 ; {>  %_34755~0':_p30689 %_34756~1':(_p30686)◂((_p30694)◂(_stg)) }
; _f30721 0' ⊢ °3◂0'
; _nil {  } ⊢ %_34758 : %_34758
 ; {>  %_34757~°3◂0':_p30704 %_34756~1':(_p30686)◂((_p30694)◂(_stg)) }
; _nil {  } ⊢ °1◂{  }
; _f30687 %_34758 ⊢ %_34759 : %_34759
 ; {>  %_34758~°1◂{  }:(_lst)◂(t14820'(0)) %_34757~°3◂0':_p30704 %_34756~1':(_p30686)◂((_p30694)◂(_stg)) }
; _f30687 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_34757 %_34759 %_34756 } ⊢ %_34760 : %_34760
 ; {>  %_34757~°3◂0':_p30704 %_34759~°0◂°1◂{  }:(_p30686)◂(t14822'(0)) %_34756~1':(_p30686)◂((_p30694)◂(_stg)) }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_34760
 ; {>  %_34760~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p30704 (_p30686)◂(t14826'(0)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_36560
	btr r12,2
	jmp LB_36561
LB_36560:
	bts r12,2
LB_36561:
	mov rsi,1
	bt r12,2
	jc LB_36558
	mov rsi,0
	bt r8,0
	jc LB_36558
	jmp LB_36559
LB_36558:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36559:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_36556
	btr QWORD [rdi],0
	jmp LB_36557
LB_36556:
	bts QWORD [rdi],0
LB_36557:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_36566
	mov rsi,0
	bt r8,0
	jc LB_36566
	jmp LB_36567
LB_36566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36567:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_36564
	mov rsi,0
	bt r8,0
	jc LB_36564
	jmp LB_36565
LB_36564:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36565:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_36562
	btr QWORD [rdi],1
	jmp LB_36563
LB_36562:
	bts QWORD [rdi],1
LB_36563:
	mov r8,r14
	bt r12,1
	jc LB_36570
	btr r12,2
	jmp LB_36571
LB_36570:
	bts r12,2
LB_36571:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_36568
	btr QWORD [rdi],2
	jmp LB_36569
LB_36568:
	bts QWORD [rdi],2
LB_36569:
	mov r8,0
	bts r12,2
	ret
LB_36572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36574
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36573
LB_36574:
	add rsp,8
	ret
LB_36575:
	add rsp,64
	pop r14
LB_36573:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34576:
NS_E_RDI_34576:
NS_E_34576_ETR_TBL:
NS_E_34576_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_36671
LB_36670:
	add r14,1
LB_36671:
	cmp r14,r10
	jge LB_36672
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36670
	cmp al,10
	jz LB_36670
	cmp al,32
	jz LB_36670
LB_36672:
	add r14,1
	cmp r14,r10
	jg LB_36675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_36675
	jmp LB_36676
LB_36675:
	jmp LB_36647
LB_36676:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_36656
LB_36655:
	add r14,1
LB_36656:
	cmp r14,r10
	jge LB_36657
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36655
	cmp al,10
	jz LB_36655
	cmp al,32
	jz LB_36655
LB_36657:
	add r14,3
	cmp r14,r10
	jg LB_36661
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36661
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_36661
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_36661
	jmp LB_36662
LB_36661:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36659:
	jmp LB_36648
LB_36662:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_36664
LB_36663:
	add r14,1
LB_36664:
	cmp r14,r10
	jge LB_36665
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36663
	cmp al,10
	jz LB_36663
	cmp al,32
	jz LB_36663
LB_36665:
	push r10
	call NS_E_33979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36666
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36667
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36667:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36668
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36668:
	jmp LB_36648
LB_36666:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36653
	btr r12,2
	clc
	jmp LB_36654
LB_36653:
	bts r12,2
	stc
LB_36654:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36651
	btr r12,1
	clc
	jmp LB_36652
LB_36651:
	bts r12,1
	stc
LB_36652:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36649
	btr r12,0
	clc
	jmp LB_36650
LB_36649:
	bts r12,0
	stc
LB_36650:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_36644
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_36677
	btr r12,3
	jmp LB_36678
LB_36677:
	bts r12,3
LB_36678:
	mov r13,r8
	bt r12,2
	jc LB_36679
	btr r12,0
	jmp LB_36680
LB_36679:
	bts r12,0
LB_36680:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_34762 : %_34762
 ; {>  %_34761~0':(_p30694)◂(_stg) }
; 	» 0xr0 _ ⊢ 1' : %_34762
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_34763 : %_34763
 ; {>  %_34762~1':_r64 %_34761~0':(_p30694)◂(_stg) }
; _nil {  } ⊢ °1◂{  }
; _f30687 %_34763 ⊢ %_34764 : %_34764
 ; {>  %_34762~1':_r64 %_34761~0':(_p30694)◂(_stg) %_34763~°1◂{  }:(_lst)◂(t14832'(0)) }
; _f30687 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_34765 : %_34765
 ; {>  %_34762~1':_r64 %_34761~0':(_p30694)◂(_stg) %_34764~°0◂°1◂{  }:(_p30686)◂(t14834'(0)) }
; _nil {  } ⊢ °1◂{  }
; _f30688 %_34761 ⊢ %_34766 : %_34766
 ; {>  %_34762~1':_r64 %_34761~0':(_p30694)◂(_stg) %_34765~°1◂{  }:(_lst)◂(t14837'(0)) %_34764~°0◂°1◂{  }:(_p30686)◂(t14834'(0)) }
; _f30688 0' ⊢ °1◂0'
; _cns { %_34766 %_34765 } ⊢ %_34767 : %_34767
 ; {>  %_34766~°1◂0':(_p30686)◂((_p30694)◂(_stg)) %_34762~1':_r64 %_34765~°1◂{  }:(_lst)◂(t14837'(0)) %_34764~°0◂°1◂{  }:(_p30686)◂(t14834'(0)) }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f30687 %_34767 ⊢ %_34768 : %_34768
 ; {>  %_34762~1':_r64 %_34767~°0◂{ °1◂0' °1◂{  } }:(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_34764~°0◂°1◂{  }:(_p30686)◂(t14834'(0)) }
; _f30687 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_34762 %_34764 %_34768 } ⊢ %_34769 : %_34769
 ; {>  %_34762~1':_r64 %_34768~°0◂°0◂{ °1◂0' °1◂{  } }:(_p30686)◂((_p30694)◂(_stg)) %_34764~°0◂°1◂{  }:(_p30686)◂(t14834'(0)) }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_34769
 ; {>  %_34769~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 (_p30686)◂(t14847'(0)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_36620
	btr r12,2
	jmp LB_36621
LB_36620:
	bts r12,2
LB_36621:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_36618
	btr QWORD [rdi],0
	jmp LB_36619
LB_36618:
	bts QWORD [rdi],0
LB_36619:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_36626
	mov rsi,0
	bt r8,0
	jc LB_36626
	jmp LB_36627
LB_36626:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36627:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_36624
	mov rsi,0
	bt r8,0
	jc LB_36624
	jmp LB_36625
LB_36624:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36625:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_36622
	btr QWORD [rdi],1
	jmp LB_36623
LB_36622:
	bts QWORD [rdi],1
LB_36623:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_36638
	btr r12,1
	jmp LB_36639
LB_36638:
	bts r12,1
LB_36639:
	mov rsi,1
	bt r12,1
	jc LB_36636
	mov rsi,0
	bt r14,0
	jc LB_36636
	jmp LB_36637
LB_36636:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_36637:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_36634
	btr QWORD [rdi],0
	jmp LB_36635
LB_36634:
	bts QWORD [rdi],0
LB_36635:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_36642
	mov rsi,0
	bt r14,0
	jc LB_36642
	jmp LB_36643
LB_36642:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_36643:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_36640
	btr QWORD [rdi],1
	jmp LB_36641
LB_36640:
	bts QWORD [rdi],1
LB_36641:
	mov rsi,1
	bt r12,2
	jc LB_36632
	mov rsi,0
	bt r8,0
	jc LB_36632
	jmp LB_36633
LB_36632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36633:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_36630
	mov rsi,0
	bt r8,0
	jc LB_36630
	jmp LB_36631
LB_36630:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_36631:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_36628
	btr QWORD [rdi],2
	jmp LB_36629
LB_36628:
	bts QWORD [rdi],2
LB_36629:
	mov r8,0
	bts r12,2
	ret
LB_36644:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36646
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36645
LB_36646:
	add rsp,8
	ret
LB_36648:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36647:
	add rsp,48
	pop r14
LB_36645:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_36734
LB_36733:
	add r14,1
LB_36734:
	cmp r14,r10
	jge LB_36735
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36733
	cmp al,10
	jz LB_36733
	cmp al,32
	jz LB_36733
LB_36735:
	push r10
	call NS_E_33713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36736
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36722
LB_36736:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_36739
LB_36738:
	add r14,1
LB_36739:
	cmp r14,r10
	jge LB_36740
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36738
	cmp al,10
	jz LB_36738
	cmp al,32
	jz LB_36738
LB_36740:
	push r10
	call NS_E_33712_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36741
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36742
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36742:
	jmp LB_36722
LB_36741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_36745
LB_36744:
	add r14,1
LB_36745:
	cmp r14,r10
	jge LB_36746
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36744
	cmp al,10
	jz LB_36744
	cmp al,32
	jz LB_36744
LB_36746:
	add r14,3
	cmp r14,r10
	jg LB_36751
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_36751
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_36751
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_36751
	jmp LB_36752
LB_36751:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36748
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36748:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36749
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36749:
	jmp LB_36722
LB_36752:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_36754
LB_36753:
	add r14,1
LB_36754:
	cmp r14,r10
	jge LB_36755
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36753
	cmp al,10
	jz LB_36753
	cmp al,32
	jz LB_36753
LB_36755:
	push r10
	call NS_E_33979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36756
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36757
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36757:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36758
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36758:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36759
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36759:
	jmp LB_36722
LB_36756:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_36762
LB_36761:
	add r14,1
LB_36762:
	cmp r14,r10
	jge LB_36763
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36761
	cmp al,10
	jz LB_36761
	cmp al,32
	jz LB_36761
LB_36763:
	push r10
	call NS_E_33978_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36764
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_36765
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_36765:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_36766
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_36766:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36767
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36767:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36768:
	jmp LB_36722
LB_36764:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_36731
	btr r12,4
	clc
	jmp LB_36732
LB_36731:
	bts r12,4
	stc
LB_36732:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_36729
	btr r12,3
	clc
	jmp LB_36730
LB_36729:
	bts r12,3
	stc
LB_36730:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36727
	btr r12,2
	clc
	jmp LB_36728
LB_36727:
	bts r12,2
	stc
LB_36728:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36725
	btr r12,1
	clc
	jmp LB_36726
LB_36725:
	bts r12,1
	stc
LB_36726:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36723
	btr r12,0
	clc
	jmp LB_36724
LB_36723:
	bts r12,0
	stc
LB_36724:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_36719
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_36770
	btr r12,5
	jmp LB_36771
LB_36770:
	bts r12,5
LB_36771:
	mov r9,r10
	bt r12,4
	jc LB_36772
	btr r12,3
	jmp LB_36773
LB_36772:
	bts r12,3
LB_36773:
	mov r10,r8
	bt r12,2
	jc LB_36774
	btr r12,4
	jmp LB_36775
LB_36774:
	bts r12,4
LB_36775:
	mov r8,r11
	bt r12,5
	jc LB_36776
	btr r12,2
	jmp LB_36777
LB_36776:
	bts r12,2
LB_36777:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f30688 %_34770 ⊢ %_34774 : %_34774
 ; {>  %_34773~3':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_34770~0':(_p30693)◂(_stg) %_34772~2':(_p30694)◂(_stg) %_34771~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30688 0' ⊢ °1◂0'
; _f30688 %_34772 ⊢ %_34775 : %_34775
 ; {>  %_34773~3':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_34774~°1◂0':(_p30686)◂((_p30693)◂(_stg)) %_34772~2':(_p30694)◂(_stg) %_34771~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30688 2' ⊢ °1◂2'
; _cns { %_34774 %_34771 } ⊢ %_34776 : %_34776
 ; {>  %_34773~3':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_34775~°1◂2':(_p30686)◂((_p30694)◂(_stg)) %_34774~°1◂0':(_p30686)◂((_p30693)◂(_stg)) %_34771~1':(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_34775 %_34773 } ⊢ %_34777 : %_34777
 ; {>  %_34773~3':(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_34775~°1◂2':(_p30686)◂((_p30694)◂(_stg)) %_34776~°0◂{ °1◂0' 1' }:(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f30687 %_34776 ⊢ %_34778 : %_34778
 ; {>  %_34777~°0◂{ °1◂2' 3' }:(_lst)◂((_p30686)◂((_p30694)◂(_stg))) %_34776~°0◂{ °1◂0' 1' }:(_lst)◂((_p30686)◂((_p30693)◂(_stg))) }
; _f30687 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f30687 %_34777 ⊢ %_34779 : %_34779
 ; {>  %_34778~°0◂°0◂{ °1◂0' 1' }:(_p30686)◂((_p30693)◂(_stg)) %_34777~°0◂{ °1◂2' 3' }:(_lst)◂((_p30686)◂((_p30694)◂(_stg))) }
; _f30687 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_34780 : %_34780
 ; {>  %_34778~°0◂°0◂{ °1◂0' 1' }:(_p30686)◂((_p30693)◂(_stg)) %_34779~°0◂°0◂{ °1◂2' 3' }:(_p30686)◂((_p30694)◂(_stg)) }
; 	» 0xr1 _ ⊢ 4' : %_34780
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_34780 %_34778 %_34779 } ⊢ %_34781 : %_34781
 ; {>  %_34778~°0◂°0◂{ °1◂0' 1' }:(_p30686)◂((_p30693)◂(_stg)) %_34779~°0◂°0◂{ °1◂2' 3' }:(_p30686)◂((_p30694)◂(_stg)) %_34780~4':_r64 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_34781
 ; {>  %_34781~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 (_p30686)◂((_p30693)◂(_stg)) (_p30686)◂((_p30694)◂(_stg)) }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_36681
	btr r12,5
	jmp LB_36682
LB_36681:
	bts r12,5
LB_36682:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_36685
	btr r12,6
	jmp LB_36686
LB_36685:
	bts r12,6
LB_36686:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_36683
	btr QWORD [rdi],0
	jmp LB_36684
LB_36683:
	bts QWORD [rdi],0
LB_36684:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_36697
	btr r12,4
	jmp LB_36698
LB_36697:
	bts r12,4
LB_36698:
	mov rsi,1
	bt r12,4
	jc LB_36695
	mov rsi,0
	bt r10,0
	jc LB_36695
	jmp LB_36696
LB_36695:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_36696:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_36693
	btr QWORD [rdi],0
	jmp LB_36694
LB_36693:
	bts QWORD [rdi],0
LB_36694:
	mov r10,r14
	bt r12,1
	jc LB_36701
	btr r12,4
	jmp LB_36702
LB_36701:
	bts r12,4
LB_36702:
	mov rdi,rcx
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_36699
	btr QWORD [rdi],1
	jmp LB_36700
LB_36699:
	bts QWORD [rdi],1
LB_36700:
	mov rsi,1
	bt r12,6
	jc LB_36691
	mov rsi,0
	bt rcx,0
	jc LB_36691
	jmp LB_36692
LB_36691:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_36692:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_36689
	mov rsi,0
	bt rcx,0
	jc LB_36689
	jmp LB_36690
LB_36689:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_36690:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_36687
	btr QWORD [rdi],1
	jmp LB_36688
LB_36687:
	bts QWORD [rdi],1
LB_36688:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_36713
	btr r12,0
	jmp LB_36714
LB_36713:
	bts r12,0
LB_36714:
	mov rsi,1
	bt r12,0
	jc LB_36711
	mov rsi,0
	bt r13,0
	jc LB_36711
	jmp LB_36712
LB_36711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_36712:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_36709
	btr QWORD [rdi],0
	jmp LB_36710
LB_36709:
	bts QWORD [rdi],0
LB_36710:
	mov r13,r11
	bt r12,5
	jc LB_36717
	btr r12,0
	jmp LB_36718
LB_36717:
	bts r12,0
LB_36718:
	mov rdi,rcx
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_36715
	btr QWORD [rdi],1
	jmp LB_36716
LB_36715:
	bts QWORD [rdi],1
LB_36716:
	mov rsi,1
	bt r12,6
	jc LB_36707
	mov rsi,0
	bt rcx,0
	jc LB_36707
	jmp LB_36708
LB_36707:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_36708:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_36705
	mov rsi,0
	bt rcx,0
	jc LB_36705
	jmp LB_36706
LB_36705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_36706:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_36703
	btr QWORD [rdi],2
	jmp LB_36704
LB_36703:
	bts QWORD [rdi],2
LB_36704:
	mov r8,0
	bts r12,2
	ret
LB_36719:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36721
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36720
LB_36721:
	add rsp,8
	ret
LB_36722:
	add rsp,80
	pop r14
LB_36720:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34577:
NS_E_RDI_34577:
NS_E_34577_ETR_TBL:
NS_E_34577_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_36807
LB_36806:
	add r14,1
LB_36807:
	cmp r14,r10
	jge LB_36808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36806
	cmp al,10
	jz LB_36806
	cmp al,32
	jz LB_36806
LB_36808:
	push r10
	call NS_E_34578_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36809
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36791
LB_36809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_36812
LB_36811:
	add r14,1
LB_36812:
	cmp r14,r10
	jge LB_36813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36811
	cmp al,10
	jz LB_36811
	cmp al,32
	jz LB_36811
LB_36813:
	add r14,1
	cmp r14,r10
	jg LB_36817
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_36817
	jmp LB_36818
LB_36817:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36815:
	jmp LB_36791
LB_36818:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_36800
LB_36799:
	add r14,1
LB_36800:
	cmp r14,r10
	jge LB_36801
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36799
	cmp al,10
	jz LB_36799
	cmp al,32
	jz LB_36799
LB_36801:
	push r10
	call NS_E_30092_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36802
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_36803
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_36803:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36804
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36804:
	jmp LB_36792
LB_36802:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_36797
	btr r12,2
	clc
	jmp LB_36798
LB_36797:
	bts r12,2
	stc
LB_36798:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36795
	btr r12,1
	clc
	jmp LB_36796
LB_36795:
	bts r12,1
	stc
LB_36796:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36793
	btr r12,0
	clc
	jmp LB_36794
LB_36793:
	bts r12,0
	stc
LB_36794:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_36788
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_36819
	btr r12,3
	jmp LB_36820
LB_36819:
	bts r12,3
LB_36820:
	mov r14,r8
	bt r12,2
	jc LB_36821
	btr r12,1
	jmp LB_36822
LB_36821:
	bts r12,1
LB_36822:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f30726 { %_34782 %_34783 } ⊢ %_34784 : %_34784
 ; {>  %_34782~0':_r64 %_34783~1':_stg }
; _f30726 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_34784 ⊢ %_34785 : %_34785
 ; {>  %_34784~°3◂{ 0' 1' }:_p30705 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_34785
 ; {>  %_34785~°0◂°3◂{ 0' 1' }:(_opn)◂(_p30705) }
; 	∎ °0◂°3◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°3◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_36782
	btr r12,2
	jmp LB_36783
LB_36782:
	bts r12,2
LB_36783:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_36780
	btr QWORD [rdi],0
	jmp LB_36781
LB_36780:
	bts QWORD [rdi],0
LB_36781:
	mov r8,r14
	bt r12,1
	jc LB_36786
	btr r12,2
	jmp LB_36787
LB_36786:
	bts r12,2
LB_36787:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_36784
	btr QWORD [rdi],1
	jmp LB_36785
LB_36784:
	bts QWORD [rdi],1
LB_36785:
	mov rsi,1
	bt r12,3
	jc LB_36778
	mov rsi,0
	bt r9,0
	jc LB_36778
	jmp LB_36779
LB_36778:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36779:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36788:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36790
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36789
LB_36790:
	add rsp,8
	ret
LB_36792:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_36791:
	add rsp,48
	pop r14
LB_36789:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_36834
LB_36833:
	add r14,1
LB_36834:
	cmp r14,r10
	jge LB_36835
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36833
	cmp al,10
	jz LB_36833
	cmp al,32
	jz LB_36833
LB_36835:
	push r10
	call NS_E_34580_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36836
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36830
LB_36836:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36831
	btr r12,0
	clc
	jmp LB_36832
LB_36831:
	bts r12,0
	stc
LB_36832:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_36827
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30723 %_34786 ⊢ %_34787 : %_34787
 ; {>  %_34786~0':_stg }
; _f30723 0' ⊢ °0◂0'
; _some %_34787 ⊢ %_34788 : %_34788
 ; {>  %_34787~°0◂0':_p30705 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34788
 ; {>  %_34788~°0◂°0◂0':(_opn)◂(_p30705) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36825
	btr r12,3
	jmp LB_36826
LB_36825:
	bts r12,3
LB_36826:
	mov rsi,1
	bt r12,3
	jc LB_36823
	mov rsi,0
	bt r9,0
	jc LB_36823
	jmp LB_36824
LB_36823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36824:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36827:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36829
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36828
LB_36829:
	add rsp,8
	ret
LB_36830:
	add rsp,16
	pop r14
LB_36828:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_36849
LB_36848:
	add r14,1
LB_36849:
	cmp r14,r10
	jge LB_36850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36848
	cmp al,10
	jz LB_36848
	cmp al,32
	jz LB_36848
LB_36850:
	push r10
	call NS_E_30092_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36851
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36845
LB_36851:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36846
	btr r12,0
	clc
	jmp LB_36847
LB_36846:
	bts r12,0
	stc
LB_36847:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_36842
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30723 %_34789 ⊢ %_34790 : %_34790
 ; {>  %_34789~0':_stg }
; _f30723 0' ⊢ °0◂0'
; _some %_34790 ⊢ %_34791 : %_34791
 ; {>  %_34790~°0◂0':_p30705 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34791
 ; {>  %_34791~°0◂°0◂0':(_opn)◂(_p30705) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36840
	btr r12,3
	jmp LB_36841
LB_36840:
	bts r12,3
LB_36841:
	mov rsi,1
	bt r12,3
	jc LB_36838
	mov rsi,0
	bt r9,0
	jc LB_36838
	jmp LB_36839
LB_36838:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36839:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36842:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36844
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36843
LB_36844:
	add rsp,8
	ret
LB_36845:
	add rsp,16
	pop r14
LB_36843:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_36864
LB_36863:
	add r14,1
LB_36864:
	cmp r14,r10
	jge LB_36865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36863
	cmp al,10
	jz LB_36863
	cmp al,32
	jz LB_36863
LB_36865:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36866
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36860
LB_36866:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36861
	btr r12,0
	clc
	jmp LB_36862
LB_36861:
	bts r12,0
	stc
LB_36862:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_36857
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30724 %_34792 ⊢ %_34793 : %_34793
 ; {>  %_34792~0':_p30641 }
; _f30724 0' ⊢ °1◂0'
; _some %_34793 ⊢ %_34794 : %_34794
 ; {>  %_34793~°1◂0':_p30705 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34794
 ; {>  %_34794~°0◂°1◂0':(_opn)◂(_p30705) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36855
	btr r12,3
	jmp LB_36856
LB_36855:
	bts r12,3
LB_36856:
	mov rsi,1
	bt r12,3
	jc LB_36853
	mov rsi,0
	bt r9,0
	jc LB_36853
	jmp LB_36854
LB_36853:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36854:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36857:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36859
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36858
LB_36859:
	add rsp,8
	ret
LB_36860:
	add rsp,16
	pop r14
LB_36858:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_36885
LB_36884:
	add r14,1
LB_36885:
	cmp r14,r10
	jge LB_36886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_36884
	cmp al,10
	jz LB_36884
	cmp al,32
	jz LB_36884
LB_36886:
	push r10
	call NS_E_34579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36887
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36881
LB_36887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36882
	btr r12,0
	clc
	jmp LB_36883
LB_36882:
	bts r12,0
	stc
LB_36883:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_36878
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_36889
	btr r12,2
	jmp LB_36890
LB_36889:
	bts r12,2
LB_36890:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_36893
	btr r12,3
	clc
	jmp LB_36894
LB_36893:
	bts r12,3
	stc
LB_36894:
	mov r13,r9
	bt r12,3
	jc LB_36891
	btr r12,0
	jmp LB_36892
LB_36891:
	bts r12,0
LB_36892:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_36897
	btr r12,3
	clc
	jmp LB_36898
LB_36897:
	bts r12,3
	stc
LB_36898:
	mov r14,r9
	bt r12,3
	jc LB_36895
	btr r12,1
	jmp LB_36896
LB_36895:
	bts r12,1
LB_36896:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30725 %_34795 ⊢ %_34796 : %_34796
 ; {>  %_34795~{ 0' 1' }:{ _p30706 _r64 } }
; _f30725 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_34796 ⊢ %_34797 : %_34797
 ; {>  %_34796~°2◂{ 0' 1' }:_p30705 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_34797
 ; {>  %_34797~°0◂°2◂{ 0' 1' }:(_opn)◂(_p30705) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_36872
	btr r12,2
	jmp LB_36873
LB_36872:
	bts r12,2
LB_36873:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_36870
	btr QWORD [rdi],0
	jmp LB_36871
LB_36870:
	bts QWORD [rdi],0
LB_36871:
	mov r8,r14
	bt r12,1
	jc LB_36876
	btr r12,2
	jmp LB_36877
LB_36876:
	bts r12,2
LB_36877:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_36874
	btr QWORD [rdi],1
	jmp LB_36875
LB_36874:
	bts QWORD [rdi],1
LB_36875:
	mov rsi,1
	bt r12,3
	jc LB_36868
	mov rsi,0
	bt r9,0
	jc LB_36868
	jmp LB_36869
LB_36868:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_36869:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_36878:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36880
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36879
LB_36880:
	add rsp,8
	ret
LB_36881:
	add rsp,16
	pop r14
LB_36879:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34578:
NS_E_RDI_34578:
NS_E_34578_ETR_TBL:
NS_E_34578_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_29816_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36912
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36904
LB_36912:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_36920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_36920
	jmp LB_36921
LB_36920:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36918
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36918:
	jmp LB_36904
LB_36921:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36907
	btr r12,1
	clc
	jmp LB_36908
LB_36907:
	bts r12,1
	stc
LB_36908:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36905
	btr r12,0
	clc
	jmp LB_36906
LB_36905:
	bts r12,0
	stc
LB_36906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36901
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34798 ⊢ %_34799 : %_34799
 ; {>  %_34798~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_34799
 ; {>  %_34799~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_36899
	btr r12,3
	jmp LB_36900
LB_36899:
	bts r12,3
LB_36900:
	mov r8,0
	bts r12,2
	ret
LB_36901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36903
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36902
LB_36903:
	add rsp,8
	ret
LB_36904:
	add rsp,32
	pop r14
LB_36902:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34579:
NS_E_RDI_34579:
NS_E_34579_ETR_TBL:
NS_E_34579_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_29816_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36941
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36933
LB_36941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_36949
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_36949
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_36949
	jmp LB_36950
LB_36949:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36947:
	jmp LB_36933
LB_36950:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36936
	btr r12,1
	clc
	jmp LB_36937
LB_36936:
	bts r12,1
	stc
LB_36937:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36934
	btr r12,0
	clc
	jmp LB_36935
LB_36934:
	bts r12,0
	stc
LB_36935:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36930
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f30728 {  } ⊢ %_34801 : %_34801
 ; {>  %_34800~0':_r64 }
; _f30728 {  } ⊢ °1◂{  }
; _some { %_34801 %_34800 } ⊢ %_34802 : %_34802
 ; {>  %_34801~°1◂{  }:_p30706 %_34800~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_34802
 ; {>  %_34802~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p30706 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_36924
	mov rsi,0
	bt r14,0
	jc LB_36924
	jmp LB_36925
LB_36924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_36925:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_36922
	btr QWORD [rdi],0
	jmp LB_36923
LB_36922:
	bts QWORD [rdi],0
LB_36923:
	mov r14,r13
	bt r12,0
	jc LB_36928
	btr r12,1
	jmp LB_36929
LB_36928:
	bts r12,1
LB_36929:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_36926
	btr QWORD [rdi],1
	jmp LB_36927
LB_36926:
	bts QWORD [rdi],1
LB_36927:
	mov r8,0
	bts r12,2
	ret
LB_36930:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36932
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36931
LB_36932:
	add rsp,8
	ret
LB_36933:
	add rsp,32
	pop r14
LB_36931:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_29816_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36970
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36962
LB_36970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_36978
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_36978
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_36978
	jmp LB_36979
LB_36978:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_36976
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_36976:
	jmp LB_36962
LB_36979:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36965
	btr r12,1
	clc
	jmp LB_36966
LB_36965:
	bts r12,1
	stc
LB_36966:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36963
	btr r12,0
	clc
	jmp LB_36964
LB_36963:
	bts r12,0
	stc
LB_36964:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36959
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f30729 {  } ⊢ %_34804 : %_34804
 ; {>  %_34803~0':_r64 }
; _f30729 {  } ⊢ °2◂{  }
; _some { %_34804 %_34803 } ⊢ %_34805 : %_34805
 ; {>  %_34803~0':_r64 %_34804~°2◂{  }:_p30706 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_34805
 ; {>  %_34805~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p30706 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_36953
	mov rsi,0
	bt r14,0
	jc LB_36953
	jmp LB_36954
LB_36953:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_36954:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_36951
	btr QWORD [rdi],0
	jmp LB_36952
LB_36951:
	bts QWORD [rdi],0
LB_36952:
	mov r14,r13
	bt r12,0
	jc LB_36957
	btr r12,1
	jmp LB_36958
LB_36957:
	bts r12,1
LB_36958:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_36955
	btr QWORD [rdi],1
	jmp LB_36956
LB_36955:
	bts QWORD [rdi],1
LB_36956:
	mov r8,0
	bts r12,2
	ret
LB_36959:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36961
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36960
LB_36961:
	add rsp,8
	ret
LB_36962:
	add rsp,32
	pop r14
LB_36960:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_29816_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_36999
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36991
LB_36999:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_37007
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_37007
	jmp LB_37008
LB_37007:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37005
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37005:
	jmp LB_36991
LB_37008:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_36994
	btr r12,1
	clc
	jmp LB_36995
LB_36994:
	bts r12,1
	stc
LB_36995:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_36992
	btr r12,0
	clc
	jmp LB_36993
LB_36992:
	bts r12,0
	stc
LB_36993:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_36988
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f30727 {  } ⊢ %_34807 : %_34807
 ; {>  %_34806~0':_r64 }
; _f30727 {  } ⊢ °0◂{  }
; _some { %_34807 %_34806 } ⊢ %_34808 : %_34808
 ; {>  %_34807~°0◂{  }:_p30706 %_34806~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_34808
 ; {>  %_34808~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p30706 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_36982
	mov rsi,0
	bt r14,0
	jc LB_36982
	jmp LB_36983
LB_36982:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_36983:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_36980
	btr QWORD [rdi],0
	jmp LB_36981
LB_36980:
	bts QWORD [rdi],0
LB_36981:
	mov r14,r13
	bt r12,0
	jc LB_36986
	btr r12,1
	jmp LB_36987
LB_36986:
	bts r12,1
LB_36987:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_36984
	btr QWORD [rdi],1
	jmp LB_36985
LB_36984:
	bts QWORD [rdi],1
LB_36985:
	mov r8,0
	bts r12,2
	ret
LB_36988:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_36990
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_36989
LB_36990:
	add rsp,8
	ret
LB_36991:
	add rsp,32
	pop r14
LB_36989:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34580:
NS_E_RDI_34580:
NS_E_34580_ETR_TBL:
NS_E_34580_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_37024
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_37024
	jmp LB_37025
LB_37024:
	jmp LB_37014
LB_37025:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_34581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37029
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37030:
	jmp LB_37014
LB_37029:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37017
	btr r12,1
	clc
	jmp LB_37018
LB_37017:
	bts r12,1
	stc
LB_37018:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37015
	btr r12,0
	clc
	jmp LB_37016
LB_37015:
	bts r12,0
	stc
LB_37016:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37011
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_37032
	btr r12,2
	jmp LB_37033
LB_37032:
	bts r12,2
LB_37033:
	mov r13,r14
	bt r12,1
	jc LB_37034
	btr r12,0
	jmp LB_37035
LB_37034:
	bts r12,0
LB_37035:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f29936 %_34809 ⊢ %_34810 : %_34810
 ; {>  %_34809~0':(_lst)◂(_r64) }
; _f29936 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_29936
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_34810 ⊢ %_34811 : %_34811
 ; {>  %_34810~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_34811
 ; {>  %_34811~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37009
	btr r12,3
	jmp LB_37010
LB_37009:
	bts r12,3
LB_37010:
	mov r8,0
	bts r12,2
	ret
LB_37011:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37013
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37012
LB_37013:
	add rsp,8
	ret
LB_37014:
	add rsp,32
	pop r14
LB_37012:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34581:
NS_E_RDI_34581:
NS_E_34581_ETR_TBL:
NS_E_34581_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_37057
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_37057
	jmp LB_37058
LB_37057:
	jmp LB_37049
LB_37058:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37050
	btr r12,0
	clc
	jmp LB_37051
LB_37050:
	bts r12,0
	stc
LB_37051:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37046
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_34812 : %_34812
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_34812
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_34813 : %_34813
 ; {>  %_34812~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_34812 %_34813 } ⊢ %_34814 : %_34814
 ; {>  %_34813~°1◂{  }:(_lst)◂(t14911'(0)) %_34812~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_34814 ⊢ %_34815 : %_34815
 ; {>  %_34814~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_34815
 ; {>  %_34815~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_37040
	btr r12,1
	jmp LB_37041
LB_37040:
	bts r12,1
LB_37041:
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_37038
	btr QWORD [rdi],0
	jmp LB_37039
LB_37038:
	bts QWORD [rdi],0
LB_37039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_37044
	mov rsi,0
	bt r14,0
	jc LB_37044
	jmp LB_37045
LB_37044:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_37045:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_37042
	btr QWORD [rdi],1
	jmp LB_37043
LB_37042:
	bts QWORD [rdi],1
LB_37043:
	mov rsi,1
	bt r12,3
	jc LB_37036
	mov rsi,0
	bt r9,0
	jc LB_37036
	jmp LB_37037
LB_37036:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37037:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37046:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37048
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37047
LB_37048:
	add rsp,8
	ret
LB_37049:
	add rsp,16
	pop r14
LB_37047:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_29814_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37080
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37072
LB_37080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_34581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37085
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37086
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37086:
	jmp LB_37072
LB_37085:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37075
	btr r12,1
	clc
	jmp LB_37076
LB_37075:
	bts r12,1
	stc
LB_37076:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37073
	btr r12,0
	clc
	jmp LB_37074
LB_37073:
	bts r12,0
	stc
LB_37074:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37069
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_34816 %_34817 } ⊢ %_34818 : %_34818
 ; {>  %_34816~0':_r64 %_34817~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34818 ⊢ %_34819 : %_34819
 ; {>  %_34818~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34819
 ; {>  %_34819~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37063
	btr r12,2
	jmp LB_37064
LB_37063:
	bts r12,2
LB_37064:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37061
	btr QWORD [rdi],0
	jmp LB_37062
LB_37061:
	bts QWORD [rdi],0
LB_37062:
	mov r8,r14
	bt r12,1
	jc LB_37067
	btr r12,2
	jmp LB_37068
LB_37067:
	bts r12,2
LB_37068:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37065
	btr QWORD [rdi],1
	jmp LB_37066
LB_37065:
	bts QWORD [rdi],1
LB_37066:
	mov rsi,1
	bt r12,3
	jc LB_37059
	mov rsi,0
	bt r9,0
	jc LB_37059
	jmp LB_37060
LB_37059:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37060:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37069:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37071
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37070
LB_37071:
	add rsp,8
	ret
LB_37072:
	add rsp,32
	pop r14
LB_37070:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34582:
NS_E_RDI_34582:
NS_E_34582_ETR_TBL:
NS_E_34582_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_37126
LB_37125:
	add r14,1
LB_37126:
	cmp r14,r10
	jge LB_37127
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37125
	cmp al,10
	jz LB_37125
	cmp al,32
	jz LB_37125
LB_37127:
	add r14,4
	cmp r14,r10
	jg LB_37130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_37130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_37130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_37130
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_37130
	jmp LB_37131
LB_37130:
	jmp LB_37104
LB_37131:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_37113
LB_37112:
	add r14,1
LB_37113:
	cmp r14,r10
	jge LB_37114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37112
	cmp al,10
	jz LB_37112
	cmp al,32
	jz LB_37112
LB_37114:
	push r10
	call NS_E_34583_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37115
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37116
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37116:
	jmp LB_37105
LB_37115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_37119
LB_37118:
	add r14,1
LB_37119:
	cmp r14,r10
	jge LB_37120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37118
	cmp al,10
	jz LB_37118
	cmp al,32
	jz LB_37118
LB_37120:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37121
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37122
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37122:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37123:
	jmp LB_37105
LB_37121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37110
	btr r12,2
	clc
	jmp LB_37111
LB_37110:
	bts r12,2
	stc
LB_37111:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37108
	btr r12,1
	clc
	jmp LB_37109
LB_37108:
	bts r12,1
	stc
LB_37109:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37106
	btr r12,0
	clc
	jmp LB_37107
LB_37106:
	bts r12,0
	stc
LB_37107:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37101
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_37132
	btr r12,3
	jmp LB_37133
LB_37132:
	bts r12,3
LB_37133:
	mov r14,r8
	bt r12,2
	jc LB_37134
	btr r12,1
	jmp LB_37135
LB_37134:
	bts r12,1
LB_37135:
	mov r8,r13
	bt r12,0
	jc LB_37136
	btr r12,2
	jmp LB_37137
LB_37136:
	bts r12,2
LB_37137:
	mov r13,r9
	bt r12,3
	jc LB_37138
	btr r12,0
	jmp LB_37139
LB_37138:
	bts r12,0
LB_37139:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_34822 : %_34822
 ; {>  %_34820~0':(_lst)◂(_p30702) %_34821~1':_p30699 }
; _nil {  } ⊢ °1◂{  }
; _f30713 %_34821 ⊢ %_34823 : %_34823
 ; {>  %_34822~°1◂{  }:(_lst)◂(t14926'(0)) %_34820~0':(_lst)◂(_p30702) %_34821~1':_p30699 }
; _f30713 1' ⊢ °1◂1'
; _f30711 { %_34822 %_34823 } ⊢ %_34824 : %_34824
 ; {>  %_34823~°1◂1':_p30701 %_34822~°1◂{  }:(_lst)◂(t14926'(0)) %_34820~0':(_lst)◂(_p30702) }
; _f30711 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_34824 ⊢ %_34825 : %_34825
 ; {>  %_34820~0':(_lst)◂(_p30702) %_34824~°1◂{ °1◂{  } °1◂1' }:_p30700 }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_34825
 ; {>  %_34825~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p30700) %_34820~0':(_lst)◂(_p30702) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_37088
	mov rdi,r13
	call dlt
LB_37088:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_37093
	mov rsi,0
	bt r13,0
	jc LB_37093
	jmp LB_37094
LB_37093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_37094:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_37091
	btr QWORD [rdi],0
	jmp LB_37092
LB_37091:
	bts QWORD [rdi],0
LB_37092:
	mov r13,r14
	bt r12,1
	jc LB_37099
	btr r12,0
	jmp LB_37100
LB_37099:
	bts r12,0
LB_37100:
	mov rsi,1
	bt r12,0
	jc LB_37097
	mov rsi,0
	bt r13,0
	jc LB_37097
	jmp LB_37098
LB_37097:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_37098:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_37095
	btr QWORD [rdi],1
	jmp LB_37096
LB_37095:
	bts QWORD [rdi],1
LB_37096:
	mov rsi,1
	bt r12,3
	jc LB_37089
	mov rsi,0
	bt r9,0
	jc LB_37089
	jmp LB_37090
LB_37089:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37090:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37103
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37102
LB_37103:
	add rsp,8
	ret
LB_37105:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37104:
	add rsp,48
	pop r14
LB_37102:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_37170
LB_37169:
	add r14,1
LB_37170:
	cmp r14,r10
	jge LB_37171
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37169
	cmp al,10
	jz LB_37169
	cmp al,32
	jz LB_37169
LB_37171:
	add r14,3
	cmp r14,r10
	jg LB_37174
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37174
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_37174
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_37174
	jmp LB_37175
LB_37174:
	jmp LB_37160
LB_37175:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_37177
LB_37176:
	add r14,1
LB_37177:
	cmp r14,r10
	jge LB_37178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37176
	cmp al,10
	jz LB_37176
	cmp al,32
	jz LB_37176
LB_37178:
	push r10
	call NS_E_34583_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37179
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37180
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37180:
	jmp LB_37160
LB_37179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_37183
LB_37182:
	add r14,1
LB_37183:
	cmp r14,r10
	jge LB_37184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37182
	cmp al,10
	jz LB_37182
	cmp al,32
	jz LB_37182
LB_37184:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37185
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37186
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37186:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37187
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37187:
	jmp LB_37160
LB_37185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_37190
LB_37189:
	add r14,1
LB_37190:
	cmp r14,r10
	jge LB_37191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37189
	cmp al,10
	jz LB_37189
	cmp al,32
	jz LB_37189
LB_37191:
	push r10
	call NS_E_34582_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37192
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37193
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37193:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37194
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37194:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37195
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37195:
	jmp LB_37160
LB_37192:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_37167
	btr r12,3
	clc
	jmp LB_37168
LB_37167:
	bts r12,3
	stc
LB_37168:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37165
	btr r12,2
	clc
	jmp LB_37166
LB_37165:
	bts r12,2
	stc
LB_37166:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37163
	btr r12,1
	clc
	jmp LB_37164
LB_37163:
	bts r12,1
	stc
LB_37164:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37161
	btr r12,0
	clc
	jmp LB_37162
LB_37161:
	bts r12,0
	stc
LB_37162:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_37157
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_37197
	btr r12,4
	jmp LB_37198
LB_37197:
	bts r12,4
LB_37198:
	mov r8,r9
	bt r12,3
	jc LB_37199
	btr r12,2
	jmp LB_37200
LB_37199:
	bts r12,2
LB_37200:
	mov r9,r14
	bt r12,1
	jc LB_37201
	btr r12,3
	jmp LB_37202
LB_37201:
	bts r12,3
LB_37202:
	mov r14,r10
	bt r12,4
	jc LB_37203
	btr r12,1
	jmp LB_37204
LB_37203:
	bts r12,1
LB_37204:
	mov r10,r13
	bt r12,0
	jc LB_37205
	btr r12,4
	jmp LB_37206
LB_37205:
	bts r12,4
LB_37206:
	mov r13,r9
	bt r12,3
	jc LB_37207
	btr r12,0
	jmp LB_37208
LB_37207:
	bts r12,0
LB_37208:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_34829 : %_34829
 ; {>  %_34826~0':(_lst)◂(_p30702) %_34828~2':_p30700 %_34827~1':_p30699 }
; _nil {  } ⊢ °1◂{  }
; _f30713 %_34827 ⊢ %_34830 : %_34830
 ; {>  %_34829~°1◂{  }:(_lst)◂(t14936'(0)) %_34826~0':(_lst)◂(_p30702) %_34828~2':_p30700 %_34827~1':_p30699 }
; _f30713 1' ⊢ °1◂1'
; _f30710 { %_34829 %_34830 %_34828 } ⊢ %_34831 : %_34831
 ; {>  %_34829~°1◂{  }:(_lst)◂(t14936'(0)) %_34826~0':(_lst)◂(_p30702) %_34828~2':_p30700 %_34830~°1◂1':_p30701 }
; _f30710 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_34831 ⊢ %_34832 : %_34832
 ; {>  %_34831~°0◂{ °1◂{  } °1◂1' 2' }:_p30700 %_34826~0':(_lst)◂(_p30702) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_34832
 ; {>  %_34832~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p30700) %_34826~0':(_lst)◂(_p30702) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_37140
	mov rdi,r13
	call dlt
LB_37140:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_37145
	mov rsi,0
	bt r13,0
	jc LB_37145
	jmp LB_37146
LB_37145:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_37146:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,0
	jc LB_37143
	btr QWORD [rdi],0
	jmp LB_37144
LB_37143:
	bts QWORD [rdi],0
LB_37144:
	mov r13,r14
	bt r12,1
	jc LB_37151
	btr r12,0
	jmp LB_37152
LB_37151:
	bts r12,0
LB_37152:
	mov rsi,1
	bt r12,0
	jc LB_37149
	mov rsi,0
	bt r13,0
	jc LB_37149
	jmp LB_37150
LB_37149:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_37150:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,0
	jc LB_37147
	btr QWORD [rdi],1
	jmp LB_37148
LB_37147:
	bts QWORD [rdi],1
LB_37148:
	mov r13,r8
	bt r12,2
	jc LB_37155
	btr r12,0
	jmp LB_37156
LB_37155:
	bts r12,0
LB_37156:
	mov rdi,r9
	mov rsi,r13
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,0
	jc LB_37153
	btr QWORD [rdi],2
	jmp LB_37154
LB_37153:
	bts QWORD [rdi],2
LB_37154:
	mov rsi,1
	bt r12,3
	jc LB_37141
	mov rsi,0
	bt r9,0
	jc LB_37141
	jmp LB_37142
LB_37141:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37142:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37157:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37159
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37158
LB_37159:
	add rsp,8
	ret
LB_37160:
	add rsp,64
	pop r14
LB_37158:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34583:
NS_E_RDI_34583:
NS_E_34583_ETR_TBL:
NS_E_34583_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_37228
LB_37227:
	add r14,1
LB_37228:
	cmp r14,r10
	jge LB_37229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37227
	cmp al,10
	jz LB_37227
	cmp al,32
	jz LB_37227
LB_37229:
	push r10
	call NS_E_34584_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37230
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37222
LB_37230:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_37233
LB_37232:
	add r14,1
LB_37233:
	cmp r14,r10
	jge LB_37234
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37232
	cmp al,10
	jz LB_37232
	cmp al,32
	jz LB_37232
LB_37234:
	push r10
	call NS_E_34585_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37235
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37236
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37236:
	jmp LB_37222
LB_37235:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37225
	btr r12,1
	clc
	jmp LB_37226
LB_37225:
	bts r12,1
	stc
LB_37226:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37223
	btr r12,0
	clc
	jmp LB_37224
LB_37223:
	bts r12,0
	stc
LB_37224:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37219
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_34833 %_34834 } ⊢ %_34835 : %_34835
 ; {>  %_34834~1':(_lst)◂(_p30702) %_34833~0':_p30702 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34835 ⊢ %_34836 : %_34836
 ; {>  %_34835~°0◂{ 0' 1' }:(_lst)◂(_p30702) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34836
 ; {>  %_34836~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p30702)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37213
	btr r12,2
	jmp LB_37214
LB_37213:
	bts r12,2
LB_37214:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37211
	btr QWORD [rdi],0
	jmp LB_37212
LB_37211:
	bts QWORD [rdi],0
LB_37212:
	mov r8,r14
	bt r12,1
	jc LB_37217
	btr r12,2
	jmp LB_37218
LB_37217:
	bts r12,2
LB_37218:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37215
	btr QWORD [rdi],1
	jmp LB_37216
LB_37215:
	bts QWORD [rdi],1
LB_37216:
	mov rsi,1
	bt r12,3
	jc LB_37209
	mov rsi,0
	bt r9,0
	jc LB_37209
	jmp LB_37210
LB_37209:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37210:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37219:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37221
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37220
LB_37221:
	add rsp,8
	ret
LB_37222:
	add rsp,32
	pop r14
LB_37220:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_37249
LB_37248:
	add r14,1
LB_37249:
	cmp r14,r10
	jge LB_37250
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37248
	cmp al,32
	jz LB_37248
LB_37250:
	add r14,1
	cmp r14,r10
	jg LB_37253
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_37253
	jmp LB_37254
LB_37253:
	jmp LB_37243
LB_37254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_37256
LB_37255:
	add r14,1
LB_37256:
	cmp r14,r10
	jge LB_37257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37255
	cmp al,32
	jz LB_37255
LB_37257:
	add r14,1
	cmp r14,r10
	jg LB_37261
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_37261
	jmp LB_37262
LB_37261:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37259:
	jmp LB_37243
LB_37262:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37246
	btr r12,1
	clc
	jmp LB_37247
LB_37246:
	bts r12,1
	stc
LB_37247:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37244
	btr r12,0
	clc
	jmp LB_37245
LB_37244:
	bts r12,0
	stc
LB_37245:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37240
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_34837 : %_34837
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34837 ⊢ %_34838 : %_34838
 ; {>  %_34837~°1◂{  }:(_lst)◂(t14949'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34838
 ; {>  %_34838~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14952'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_37238
	mov rsi,0
	bt r9,0
	jc LB_37238
	jmp LB_37239
LB_37238:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37239:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37240:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37242
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37241
LB_37242:
	add rsp,8
	ret
LB_37243:
	add rsp,32
	pop r14
LB_37241:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34584:
NS_E_RDI_34584:
NS_E_34584_ETR_TBL:
NS_E_34584_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_37319
LB_37318:
	add r14,1
LB_37319:
	cmp r14,r10
	jge LB_37320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37318
	cmp al,10
	jz LB_37318
	cmp al,32
	jz LB_37318
LB_37320:
	push r10
	call NS_E_33710_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37321
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37280
LB_37321:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_37324
LB_37323:
	add r14,1
LB_37324:
	cmp r14,r10
	jge LB_37325
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37323
	cmp al,10
	jz LB_37323
	cmp al,32
	jz LB_37323
LB_37325:
	add r14,3
	cmp r14,r10
	jg LB_37329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_37329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_37329
	jmp LB_37330
LB_37329:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37327
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37327:
	jmp LB_37280
LB_37330:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_37293
LB_37292:
	add r14,1
LB_37293:
	cmp r14,r10
	jge LB_37294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37292
	cmp al,10
	jz LB_37292
	cmp al,32
	jz LB_37292
LB_37294:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37295
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37296
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37296:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37297
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37297:
	jmp LB_37281
LB_37295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_37300
LB_37299:
	add r14,1
LB_37300:
	cmp r14,r10
	jge LB_37301
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37299
	cmp al,10
	jz LB_37299
	cmp al,32
	jz LB_37299
LB_37301:
	add r14,3
	cmp r14,r10
	jg LB_37307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_37307
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_37307
	jmp LB_37308
LB_37307:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37303
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37303:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37304
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37304:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37305
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37305:
	jmp LB_37281
LB_37308:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_37310
LB_37309:
	add r14,1
LB_37310:
	cmp r14,r10
	jge LB_37311
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37309
	cmp al,10
	jz LB_37309
	cmp al,32
	jz LB_37309
LB_37311:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37312
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_37313
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_37313:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37314
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37314:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37315
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37315:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37316
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37316:
	jmp LB_37281
LB_37312:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_37290
	btr r12,4
	clc
	jmp LB_37291
LB_37290:
	bts r12,4
	stc
LB_37291:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_37288
	btr r12,3
	clc
	jmp LB_37289
LB_37288:
	bts r12,3
	stc
LB_37289:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37286
	btr r12,2
	clc
	jmp LB_37287
LB_37286:
	bts r12,2
	stc
LB_37287:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37284
	btr r12,1
	clc
	jmp LB_37285
LB_37284:
	bts r12,1
	stc
LB_37285:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37282
	btr r12,0
	clc
	jmp LB_37283
LB_37282:
	bts r12,0
	stc
LB_37283:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_37277
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_37331
	btr r12,5
	jmp LB_37332
LB_37331:
	bts r12,5
LB_37332:
	mov r8,r10
	bt r12,4
	jc LB_37333
	btr r12,2
	jmp LB_37334
LB_37333:
	bts r12,2
LB_37334:
	mov r10,r14
	bt r12,1
	jc LB_37335
	btr r12,4
	jmp LB_37336
LB_37335:
	bts r12,4
LB_37336:
	mov r14,r11
	bt r12,5
	jc LB_37337
	btr r12,1
	jmp LB_37338
LB_37337:
	bts r12,1
LB_37338:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f30714 { %_34839 %_34840 %_34841 } ⊢ %_34842 : %_34842
 ; {>  %_34841~2':(_p30686)◂((_p30694)◂(_stg)) %_34840~1':_p30641 %_34839~0':(_p30686)◂((_p30693)◂(_stg)) }
; _f30714 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_34842 ⊢ %_34843 : %_34843
 ; {>  %_34842~°0◂{ 0' 1' 2' }:_p30702 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_34843
 ; {>  %_34843~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p30702) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_37267
	btr r12,4
	jmp LB_37268
LB_37267:
	bts r12,4
LB_37268:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_37265
	btr QWORD [rdi],0
	jmp LB_37266
LB_37265:
	bts QWORD [rdi],0
LB_37266:
	mov r10,r14
	bt r12,1
	jc LB_37271
	btr r12,4
	jmp LB_37272
LB_37271:
	bts r12,4
LB_37272:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_37269
	btr QWORD [rdi],1
	jmp LB_37270
LB_37269:
	bts QWORD [rdi],1
LB_37270:
	mov r10,r8
	bt r12,2
	jc LB_37275
	btr r12,4
	jmp LB_37276
LB_37275:
	bts r12,4
LB_37276:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_37273
	btr QWORD [rdi],2
	jmp LB_37274
LB_37273:
	bts QWORD [rdi],2
LB_37274:
	mov rsi,1
	bt r12,3
	jc LB_37263
	mov rsi,0
	bt r9,0
	jc LB_37263
	jmp LB_37264
LB_37263:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37264:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37277:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37279
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37278
LB_37279:
	add rsp,8
	ret
LB_37281:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37280:
	add rsp,80
	pop r14
LB_37278:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_37360
LB_37359:
	add r14,1
LB_37360:
	cmp r14,r10
	jge LB_37361
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37359
	cmp al,32
	jz LB_37359
LB_37361:
	push r10
	call NS_E_34586_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37362
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37352
LB_37362:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_37365
LB_37364:
	add r14,1
LB_37365:
	cmp r14,r10
	jge LB_37366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37364
	cmp al,32
	jz LB_37364
LB_37366:
	add r14,1
	cmp r14,r10
	jg LB_37370
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_37370
	jmp LB_37371
LB_37370:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37368:
	jmp LB_37352
LB_37371:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_37373
LB_37372:
	add r14,1
LB_37373:
	cmp r14,r10
	jge LB_37374
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37372
	cmp al,32
	jz LB_37372
LB_37374:
	push r10
	call NS_E_34586_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37375
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37376
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37376:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37377
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37377:
	jmp LB_37352
LB_37375:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37357
	btr r12,2
	clc
	jmp LB_37358
LB_37357:
	bts r12,2
	stc
LB_37358:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37355
	btr r12,1
	clc
	jmp LB_37356
LB_37355:
	bts r12,1
	stc
LB_37356:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37353
	btr r12,0
	clc
	jmp LB_37354
LB_37353:
	bts r12,0
	stc
LB_37354:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37349
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_37379
	btr r12,3
	jmp LB_37380
LB_37379:
	bts r12,3
LB_37380:
	mov r14,r8
	bt r12,2
	jc LB_37381
	btr r12,1
	jmp LB_37382
LB_37381:
	bts r12,1
LB_37382:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f30715 { %_34844 %_34845 } ⊢ %_34846 : %_34846
 ; {>  %_34844~0':_p30703 %_34845~1':_p30703 }
; _f30715 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_34846 ⊢ %_34847 : %_34847
 ; {>  %_34846~°1◂{ 0' 1' }:_p30702 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_34847
 ; {>  %_34847~°0◂°1◂{ 0' 1' }:(_opn)◂(_p30702) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37343
	btr r12,2
	jmp LB_37344
LB_37343:
	bts r12,2
LB_37344:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37341
	btr QWORD [rdi],0
	jmp LB_37342
LB_37341:
	bts QWORD [rdi],0
LB_37342:
	mov r8,r14
	bt r12,1
	jc LB_37347
	btr r12,2
	jmp LB_37348
LB_37347:
	bts r12,2
LB_37348:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37345
	btr QWORD [rdi],1
	jmp LB_37346
LB_37345:
	bts QWORD [rdi],1
LB_37346:
	mov rsi,1
	bt r12,3
	jc LB_37339
	mov rsi,0
	bt r9,0
	jc LB_37339
	jmp LB_37340
LB_37339:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37340:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37349:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37351
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37350
LB_37351:
	add rsp,8
	ret
LB_37352:
	add rsp,48
	pop r14
LB_37350:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34585:
NS_E_RDI_34585:
NS_E_34585_ETR_TBL:
NS_E_34585_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_37418
LB_37417:
	add r14,1
LB_37418:
	cmp r14,r10
	jge LB_37419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37417
	cmp al,10
	jz LB_37417
	cmp al,32
	jz LB_37417
LB_37419:
	add r14,1
	cmp r14,r10
	jg LB_37422
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_37422
	jmp LB_37423
LB_37422:
	jmp LB_37396
LB_37423:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_37405
LB_37404:
	add r14,1
LB_37405:
	cmp r14,r10
	jge LB_37406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37404
	cmp al,10
	jz LB_37404
	cmp al,32
	jz LB_37404
LB_37406:
	push r10
	call NS_E_34584_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37407
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37408
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37408:
	jmp LB_37397
LB_37407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_37411
LB_37410:
	add r14,1
LB_37411:
	cmp r14,r10
	jge LB_37412
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37410
	cmp al,10
	jz LB_37410
	cmp al,32
	jz LB_37410
LB_37412:
	push r10
	call NS_E_34585_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37413
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37414
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37414:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37415
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37415:
	jmp LB_37397
LB_37413:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37402
	btr r12,2
	clc
	jmp LB_37403
LB_37402:
	bts r12,2
	stc
LB_37403:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37400
	btr r12,1
	clc
	jmp LB_37401
LB_37400:
	bts r12,1
	stc
LB_37401:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37398
	btr r12,0
	clc
	jmp LB_37399
LB_37398:
	bts r12,0
	stc
LB_37399:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37393
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_37424
	btr r12,3
	jmp LB_37425
LB_37424:
	bts r12,3
LB_37425:
	mov r14,r8
	bt r12,2
	jc LB_37426
	btr r12,1
	jmp LB_37427
LB_37426:
	bts r12,1
LB_37427:
	mov r8,r13
	bt r12,0
	jc LB_37428
	btr r12,2
	jmp LB_37429
LB_37428:
	bts r12,2
LB_37429:
	mov r13,r9
	bt r12,3
	jc LB_37430
	btr r12,0
	jmp LB_37431
LB_37430:
	bts r12,0
LB_37431:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_34848 %_34849 } ⊢ %_34850 : %_34850
 ; {>  %_34848~0':_p30702 %_34849~1':(_lst)◂(_p30702) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34850 ⊢ %_34851 : %_34851
 ; {>  %_34850~°0◂{ 0' 1' }:(_lst)◂(_p30702) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34851
 ; {>  %_34851~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p30702)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37387
	btr r12,2
	jmp LB_37388
LB_37387:
	bts r12,2
LB_37388:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37385
	btr QWORD [rdi],0
	jmp LB_37386
LB_37385:
	bts QWORD [rdi],0
LB_37386:
	mov r8,r14
	bt r12,1
	jc LB_37391
	btr r12,2
	jmp LB_37392
LB_37391:
	bts r12,2
LB_37392:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37389
	btr QWORD [rdi],1
	jmp LB_37390
LB_37389:
	bts QWORD [rdi],1
LB_37390:
	mov rsi,1
	bt r12,3
	jc LB_37383
	mov rsi,0
	bt r9,0
	jc LB_37383
	jmp LB_37384
LB_37383:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37384:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37393:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37395
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37394
LB_37395:
	add rsp,8
	ret
LB_37397:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37396:
	add rsp,48
	pop r14
LB_37394:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_37443
LB_37442:
	add r14,1
LB_37443:
	cmp r14,r10
	jge LB_37444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37442
	cmp al,32
	jz LB_37442
LB_37444:
	add r14,1
	cmp r14,r10
	jg LB_37447
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_37447
	jmp LB_37448
LB_37447:
	jmp LB_37437
LB_37448:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_37450
LB_37449:
	add r14,1
LB_37450:
	cmp r14,r10
	jge LB_37451
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37449
	cmp al,32
	jz LB_37449
LB_37451:
	add r14,1
	cmp r14,r10
	jg LB_37455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_37455
	jmp LB_37456
LB_37455:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37453
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37453:
	jmp LB_37437
LB_37456:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37440
	btr r12,1
	clc
	jmp LB_37441
LB_37440:
	bts r12,1
	stc
LB_37441:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37438
	btr r12,0
	clc
	jmp LB_37439
LB_37438:
	bts r12,0
	stc
LB_37439:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37434
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_34852 : %_34852
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_34852 ⊢ %_34853 : %_34853
 ; {>  %_34852~°1◂{  }:(_lst)◂(t14973'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34853
 ; {>  %_34853~°0◂°1◂{  }:(_opn)◂((_lst)◂(t14976'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_37432
	mov rsi,0
	bt r9,0
	jc LB_37432
	jmp LB_37433
LB_37432:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37433:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37434:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37436
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37435
LB_37436:
	add rsp,8
	ret
LB_37437:
	add rsp,32
	pop r14
LB_37435:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34586:
NS_E_RDI_34586:
NS_E_34586_ETR_TBL:
NS_E_34586_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37472
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37464
LB_37472:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_37480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_37480
	jmp LB_37481
LB_37480:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37478:
	jmp LB_37464
LB_37481:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37467
	btr r12,1
	clc
	jmp LB_37468
LB_37467:
	bts r12,1
	stc
LB_37468:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37465
	btr r12,0
	clc
	jmp LB_37466
LB_37465:
	bts r12,0
	stc
LB_37466:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37461
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f30717 %_34854 ⊢ %_34855 : %_34855
 ; {>  %_34854~0':_stg }
; _f30717 0' ⊢ °1◂0'
; _some %_34855 ⊢ %_34856 : %_34856
 ; {>  %_34855~°1◂0':_p30703 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34856
 ; {>  %_34856~°0◂°1◂0':(_opn)◂(_p30703) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37459
	btr r12,3
	jmp LB_37460
LB_37459:
	bts r12,3
LB_37460:
	mov rsi,1
	bt r12,3
	jc LB_37457
	mov rsi,0
	bt r9,0
	jc LB_37457
	jmp LB_37458
LB_37457:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37458:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37461:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37463
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37462
LB_37463:
	add rsp,8
	ret
LB_37464:
	add rsp,32
	pop r14
LB_37462:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_33581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37495
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37489
LB_37495:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37490
	btr r12,0
	clc
	jmp LB_37491
LB_37490:
	bts r12,0
	stc
LB_37491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37486
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30716 %_34857 ⊢ %_34858 : %_34858
 ; {>  %_34857~0':_p30689 }
; _f30716 0' ⊢ °0◂0'
; _some %_34858 ⊢ %_34859 : %_34859
 ; {>  %_34858~°0◂0':_p30703 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34859
 ; {>  %_34859~°0◂°0◂0':(_opn)◂(_p30703) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37484
	btr r12,3
	jmp LB_37485
LB_37484:
	bts r12,3
LB_37485:
	mov rsi,1
	bt r12,3
	jc LB_37482
	mov rsi,0
	bt r9,0
	jc LB_37482
	jmp LB_37483
LB_37482:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37483:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37486:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37488
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37487
LB_37488:
	add rsp,8
	ret
LB_37489:
	add rsp,16
	pop r14
LB_37487:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34587:
NS_E_RDI_34587:
NS_E_34587_ETR_TBL:
NS_E_34587_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_37518
LB_37517:
	add r14,1
LB_37518:
	cmp r14,r10
	jge LB_37519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37517
	cmp al,10
	jz LB_37517
	cmp al,32
	jz LB_37517
LB_37519:
	add r14,1
	cmp r14,r10
	jg LB_37522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_37522
	jmp LB_37523
LB_37522:
	jmp LB_37508
LB_37523:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_37525
LB_37524:
	add r14,1
LB_37525:
	cmp r14,r10
	jge LB_37526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37524
	cmp al,10
	jz LB_37524
	cmp al,32
	jz LB_37524
LB_37526:
	add r14,1
	cmp r14,r10
	jg LB_37530
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_37530
	jmp LB_37531
LB_37530:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37528
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37528:
	jmp LB_37508
LB_37531:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_37533
LB_37532:
	add r14,1
LB_37533:
	cmp r14,r10
	jge LB_37534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37532
	cmp al,10
	jz LB_37532
	cmp al,32
	jz LB_37532
LB_37534:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37535
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37536
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37536:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37537
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37537:
	jmp LB_37508
LB_37535:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_37540
LB_37539:
	add r14,1
LB_37540:
	cmp r14,r10
	jge LB_37541
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37539
	cmp al,10
	jz LB_37539
	cmp al,32
	jz LB_37539
LB_37541:
	push r10
	call NS_E_34588_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37542
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37543
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37543:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37544
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37544:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37545
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37545:
	jmp LB_37508
LB_37542:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_37515
	btr r12,3
	clc
	jmp LB_37516
LB_37515:
	bts r12,3
	stc
LB_37516:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37513
	btr r12,2
	clc
	jmp LB_37514
LB_37513:
	bts r12,2
	stc
LB_37514:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37511
	btr r12,1
	clc
	jmp LB_37512
LB_37511:
	bts r12,1
	stc
LB_37512:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37509
	btr r12,0
	clc
	jmp LB_37510
LB_37509:
	bts r12,0
	stc
LB_37510:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_37505
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_37547
	btr r12,4
	jmp LB_37548
LB_37547:
	bts r12,4
LB_37548:
	mov r14,r9
	bt r12,3
	jc LB_37549
	btr r12,1
	jmp LB_37550
LB_37549:
	bts r12,1
LB_37550:
	mov r9,r13
	bt r12,0
	jc LB_37551
	btr r12,3
	jmp LB_37552
LB_37551:
	bts r12,3
LB_37552:
	mov r13,r8
	bt r12,2
	jc LB_37553
	btr r12,0
	jmp LB_37554
LB_37553:
	bts r12,0
LB_37554:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_34860 %_34861 } ⊢ %_34862 : %_34862
 ; {>  %_34860~0':_stg %_34861~1':_p30735 }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_34862
 ; {>  %_34862~°0◂{ 0' 1' }:(_opn)◂({ _stg _p30735 }) }
; 	∎ °0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37499
	btr r12,2
	jmp LB_37500
LB_37499:
	bts r12,2
LB_37500:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37497
	btr QWORD [rdi],0
	jmp LB_37498
LB_37497:
	bts QWORD [rdi],0
LB_37498:
	mov r8,r14
	bt r12,1
	jc LB_37503
	btr r12,2
	jmp LB_37504
LB_37503:
	bts r12,2
LB_37504:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37501
	btr QWORD [rdi],1
	jmp LB_37502
LB_37501:
	bts QWORD [rdi],1
LB_37502:
	mov r8,0
	bts r12,2
	ret
LB_37505:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37507
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37506
LB_37507:
	add rsp,8
	ret
LB_37508:
	add rsp,64
	pop r14
LB_37506:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34588:
NS_E_RDI_34588:
NS_E_34588_ETR_TBL:
NS_E_34588_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_37566
LB_37565:
	add r14,1
LB_37566:
	cmp r14,r10
	jge LB_37567
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37565
	cmp al,10
	jz LB_37565
	cmp al,32
	jz LB_37565
LB_37567:
	push r10
	call NS_E_34589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37568
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37562
LB_37568:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37563
	btr r12,0
	clc
	jmp LB_37564
LB_37563:
	bts r12,0
	stc
LB_37564:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37559
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30758 %_34863 ⊢ %_34864 : %_34864
 ; {>  %_34863~0':_p30737 }
; _f30758 0' ⊢ °1◂0'
; _some %_34864 ⊢ %_34865 : %_34865
 ; {>  %_34864~°1◂0':_p30735 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34865
 ; {>  %_34865~°0◂°1◂0':(_opn)◂(_p30735) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37557
	btr r12,3
	jmp LB_37558
LB_37557:
	bts r12,3
LB_37558:
	mov rsi,1
	bt r12,3
	jc LB_37555
	mov rsi,0
	bt r9,0
	jc LB_37555
	jmp LB_37556
LB_37555:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37556:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37559:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37561
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37560
LB_37561:
	add rsp,8
	ret
LB_37562:
	add rsp,16
	pop r14
LB_37560:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_37581
LB_37580:
	add r14,1
LB_37581:
	cmp r14,r10
	jge LB_37582
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37580
	cmp al,10
	jz LB_37580
	cmp al,32
	jz LB_37580
LB_37582:
	push r10
	call NS_E_34597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37583
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37577
LB_37583:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37578
	btr r12,0
	clc
	jmp LB_37579
LB_37578:
	bts r12,0
	stc
LB_37579:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_37574
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30757 %_34866 ⊢ %_34867 : %_34867
 ; {>  %_34866~0':_p30736 }
; _f30757 0' ⊢ °0◂0'
; _some %_34867 ⊢ %_34868 : %_34868
 ; {>  %_34867~°0◂0':_p30735 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34868
 ; {>  %_34868~°0◂°0◂0':(_opn)◂(_p30735) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37572
	btr r12,3
	jmp LB_37573
LB_37572:
	bts r12,3
LB_37573:
	mov rsi,1
	bt r12,3
	jc LB_37570
	mov rsi,0
	bt r9,0
	jc LB_37570
	jmp LB_37571
LB_37570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37571:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37574:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37576
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37575
LB_37576:
	add rsp,8
	ret
LB_37577:
	add rsp,16
	pop r14
LB_37575:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34589:
NS_E_RDI_34589:
NS_E_34589_ETR_TBL:
NS_E_34589_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_37634
LB_37633:
	add r14,1
LB_37634:
	cmp r14,r10
	jge LB_37635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37633
	cmp al,10
	jz LB_37633
	cmp al,32
	jz LB_37633
LB_37635:
	push r10
	call NS_E_34596_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37636
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37612
LB_37636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_37621
LB_37620:
	add r14,1
LB_37621:
	cmp r14,r10
	jge LB_37622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37620
	cmp al,10
	jz LB_37620
	cmp al,32
	jz LB_37620
LB_37622:
	push r10
	call NS_E_34591_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37623
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37624
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37624:
	jmp LB_37613
LB_37623:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_37627
LB_37626:
	add r14,1
LB_37627:
	cmp r14,r10
	jge LB_37628
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37626
	cmp al,10
	jz LB_37626
	cmp al,32
	jz LB_37626
LB_37628:
	push r10
	call NS_E_34590_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37629
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37630
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37630:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37631
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37631:
	jmp LB_37613
LB_37629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37618
	btr r12,2
	clc
	jmp LB_37619
LB_37618:
	bts r12,2
	stc
LB_37619:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37616
	btr r12,1
	clc
	jmp LB_37617
LB_37616:
	bts r12,1
	stc
LB_37617:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37614
	btr r12,0
	clc
	jmp LB_37615
LB_37614:
	bts r12,0
	stc
LB_37615:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37609
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_37638
	btr r12,5
	jmp LB_37639
LB_37638:
	bts r12,5
LB_37639:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_37642
	btr r12,6
	clc
	jmp LB_37643
LB_37642:
	bts r12,6
	stc
LB_37643:
	mov r8,rcx
	bt r12,6
	jc LB_37640
	btr r12,2
	jmp LB_37641
LB_37640:
	bts r12,2
LB_37641:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_37646
	btr r12,6
	clc
	jmp LB_37647
LB_37646:
	bts r12,6
	stc
LB_37647:
	mov r9,rcx
	bt r12,6
	jc LB_37644
	btr r12,3
	jmp LB_37645
LB_37644:
	bts r12,3
LB_37645:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_37650
	btr r12,6
	clc
	jmp LB_37651
LB_37650:
	bts r12,6
	stc
LB_37651:
	mov r10,rcx
	bt r12,6
	jc LB_37648
	btr r12,4
	jmp LB_37649
LB_37648:
	bts r12,4
LB_37649:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f30762 { %_34871 %_34872 %_34869 %_34870 %_34873 } ⊢ %_34874 : %_34874
 ; {>  %_34870~1':_p30739 %_34869~0':_p30738 %_34872~3':_p30699 %_34873~4':(_opn)◂(_p30737) %_34871~2':(_p30686)◂((_p30694)◂(_stg)) }
; _f30762 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_34874 ⊢ %_34875 : %_34875
 ; {>  %_34874~°1◂{ 2' 3' 0' 1' 4' }:_p30737 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_34875
 ; {>  %_34875~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p30737) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_37585
	btr r12,5
	jmp LB_37586
LB_37585:
	bts r12,5
LB_37586:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_37591
	btr r12,6
	jmp LB_37592
LB_37591:
	bts r12,6
LB_37592:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_37589
	btr QWORD [rdi],0
	jmp LB_37590
LB_37589:
	bts QWORD [rdi],0
LB_37590:
	mov rcx,r11
	bt r12,5
	jc LB_37595
	btr r12,6
	jmp LB_37596
LB_37595:
	bts r12,6
LB_37596:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_37593
	btr QWORD [rdi],1
	jmp LB_37594
LB_37593:
	bts QWORD [rdi],1
LB_37594:
	mov rcx,r13
	bt r12,0
	jc LB_37599
	btr r12,6
	jmp LB_37600
LB_37599:
	bts r12,6
LB_37600:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_37597
	btr QWORD [rdi],2
	jmp LB_37598
LB_37597:
	bts QWORD [rdi],2
LB_37598:
	mov rcx,r14
	bt r12,1
	jc LB_37603
	btr r12,6
	jmp LB_37604
LB_37603:
	bts r12,6
LB_37604:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_37601
	btr QWORD [rdi],3
	jmp LB_37602
LB_37601:
	bts QWORD [rdi],3
LB_37602:
	mov rcx,r10
	bt r12,4
	jc LB_37607
	btr r12,6
	jmp LB_37608
LB_37607:
	bts r12,6
LB_37608:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_37605
	btr QWORD [rdi],4
	jmp LB_37606
LB_37605:
	bts QWORD [rdi],4
LB_37606:
	mov rsi,1
	bt r12,3
	jc LB_37587
	mov rsi,0
	bt r9,0
	jc LB_37587
	jmp LB_37588
LB_37587:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37588:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37609:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37611
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37610
LB_37611:
	add rsp,8
	ret
LB_37613:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37612:
	add rsp,48
	pop r14
LB_37610:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_37693
LB_37692:
	add r14,1
LB_37693:
	cmp r14,r10
	jge LB_37694
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37692
	cmp al,10
	jz LB_37692
	cmp al,32
	jz LB_37692
LB_37694:
	push r10
	call NS_E_34595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37695
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37683
LB_37695:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_37698
LB_37697:
	add r14,1
LB_37698:
	cmp r14,r10
	jge LB_37699
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37697
	cmp al,10
	jz LB_37697
	cmp al,32
	jz LB_37697
LB_37699:
	push r10
	call NS_E_34591_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37700
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37701
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37701:
	jmp LB_37683
LB_37700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_37704
LB_37703:
	add r14,1
LB_37704:
	cmp r14,r10
	jge LB_37705
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37703
	cmp al,10
	jz LB_37703
	cmp al,32
	jz LB_37703
LB_37705:
	push r10
	call NS_E_34590_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37706
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37708:
	jmp LB_37683
LB_37706:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_37711
LB_37710:
	add r14,1
LB_37711:
	cmp r14,r10
	jge LB_37712
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37710
	cmp al,10
	jz LB_37710
	cmp al,32
	jz LB_37710
LB_37712:
	push r10
	call NS_E_34589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37713
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37714
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37714:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37715
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37715:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37716
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37716:
	jmp LB_37683
LB_37713:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_37690
	btr r12,3
	clc
	jmp LB_37691
LB_37690:
	bts r12,3
	stc
LB_37691:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37688
	btr r12,2
	clc
	jmp LB_37689
LB_37688:
	bts r12,2
	stc
LB_37689:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37686
	btr r12,1
	clc
	jmp LB_37687
LB_37686:
	bts r12,1
	stc
LB_37687:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37684
	btr r12,0
	clc
	jmp LB_37685
LB_37684:
	bts r12,0
	stc
LB_37685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_37680
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_37718
	btr r12,5
	jmp LB_37719
LB_37718:
	bts r12,5
LB_37719:
	mov rcx,r8
	bt r12,2
	jc LB_37720
	btr r12,6
	jmp LB_37721
LB_37720:
	bts r12,6
LB_37721:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_37724
	btr r12,7
	clc
	jmp LB_37725
LB_37724:
	bts r12,7
	stc
LB_37725:
	mov r8,rdx
	bt r12,7
	jc LB_37722
	btr r12,2
	jmp LB_37723
LB_37722:
	bts r12,2
LB_37723:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_37728
	btr r12,7
	clc
	jmp LB_37729
LB_37728:
	bts r12,7
	stc
LB_37729:
	mov r9,rdx
	bt r12,7
	jc LB_37726
	btr r12,3
	jmp LB_37727
LB_37726:
	bts r12,3
LB_37727:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_37732
	btr r12,7
	clc
	jmp LB_37733
LB_37732:
	bts r12,7
	stc
LB_37733:
	mov r10,rdx
	bt r12,7
	jc LB_37730
	btr r12,4
	jmp LB_37731
LB_37730:
	bts r12,4
LB_37731:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f30761 { %_34878 %_34879 %_34876 %_34877 %_34880 %_34881 } ⊢ %_34882 : %_34882
 ; {>  %_34878~2':(_p30686)◂((_p30694)◂(_stg)) %_34876~0':_p30738 %_34879~3':_p30699 %_34877~1':_p30739 %_34881~5':_p30737 %_34880~4':(_opn)◂(_p30737) }
; _f30761 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_34882 ⊢ %_34883 : %_34883
 ; {>  %_34882~°0◂{ 2' 3' 0' 1' 4' 5' }:_p30737 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_34883
 ; {>  %_34883~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p30737) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_37652
	btr r12,6
	jmp LB_37653
LB_37652:
	bts r12,6
LB_37653:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_37658
	btr r12,7
	jmp LB_37659
LB_37658:
	bts r12,7
LB_37659:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_37656
	btr QWORD [rdi],0
	jmp LB_37657
LB_37656:
	bts QWORD [rdi],0
LB_37657:
	mov rdx,rcx
	bt r12,6
	jc LB_37662
	btr r12,7
	jmp LB_37663
LB_37662:
	bts r12,7
LB_37663:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_37660
	btr QWORD [rdi],1
	jmp LB_37661
LB_37660:
	bts QWORD [rdi],1
LB_37661:
	mov rdx,r13
	bt r12,0
	jc LB_37666
	btr r12,7
	jmp LB_37667
LB_37666:
	bts r12,7
LB_37667:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,7
	jc LB_37664
	btr QWORD [rdi],2
	jmp LB_37665
LB_37664:
	bts QWORD [rdi],2
LB_37665:
	mov rdx,r14
	bt r12,1
	jc LB_37670
	btr r12,7
	jmp LB_37671
LB_37670:
	bts r12,7
LB_37671:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,7
	jc LB_37668
	btr QWORD [rdi],3
	jmp LB_37669
LB_37668:
	bts QWORD [rdi],3
LB_37669:
	mov rdx,r10
	bt r12,4
	jc LB_37674
	btr r12,7
	jmp LB_37675
LB_37674:
	bts r12,7
LB_37675:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,7
	jc LB_37672
	btr QWORD [rdi],4
	jmp LB_37673
LB_37672:
	bts QWORD [rdi],4
LB_37673:
	mov rdx,r11
	bt r12,5
	jc LB_37678
	btr r12,7
	jmp LB_37679
LB_37678:
	bts r12,7
LB_37679:
	mov rdi,r9
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*5],rsi
	bt r12,7
	jc LB_37676
	btr QWORD [rdi],5
	jmp LB_37677
LB_37676:
	bts QWORD [rdi],5
LB_37677:
	mov rsi,1
	bt r12,3
	jc LB_37654
	mov rsi,0
	bt r9,0
	jc LB_37654
	jmp LB_37655
LB_37654:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37655:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37680:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37682
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37681
LB_37682:
	add rsp,8
	ret
LB_37683:
	add rsp,64
	pop r14
LB_37681:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34590:
NS_E_RDI_34590:
NS_E_34590_ETR_TBL:
NS_E_34590_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_37788
LB_37787:
	add r14,1
LB_37788:
	cmp r14,r10
	jge LB_37789
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37787
	cmp al,10
	jz LB_37787
	cmp al,32
	jz LB_37787
LB_37789:
	add r14,1
	cmp r14,r10
	jg LB_37792
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_37792
	jmp LB_37793
LB_37792:
	jmp LB_37751
LB_37793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_37795
LB_37794:
	add r14,1
LB_37795:
	cmp r14,r10
	jge LB_37796
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37794
	cmp al,10
	jz LB_37794
	cmp al,32
	jz LB_37794
LB_37796:
	add r14,3
	cmp r14,r10
	jg LB_37800
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37800
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_37800
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_37800
	jmp LB_37801
LB_37800:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37798
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37798:
	jmp LB_37751
LB_37801:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_37764
LB_37763:
	add r14,1
LB_37764:
	cmp r14,r10
	jge LB_37765
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37763
	cmp al,10
	jz LB_37763
	cmp al,32
	jz LB_37763
LB_37765:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37766
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37767
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37767:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37768:
	jmp LB_37752
LB_37766:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_37771
LB_37770:
	add r14,1
LB_37771:
	cmp r14,r10
	jge LB_37772
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37770
	cmp al,10
	jz LB_37770
	cmp al,32
	jz LB_37770
LB_37772:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37773
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37774
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37774:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37775
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37775:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37776
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37776:
	jmp LB_37752
LB_37773:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_37779
LB_37778:
	add r14,1
LB_37779:
	cmp r14,r10
	jge LB_37780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37778
	cmp al,10
	jz LB_37778
	cmp al,32
	jz LB_37778
LB_37780:
	push r10
	call NS_E_34589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37781
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_37782
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_37782:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_37783
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_37783:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37784
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37784:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37785
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37785:
	jmp LB_37752
LB_37781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_37761
	btr r12,4
	clc
	jmp LB_37762
LB_37761:
	bts r12,4
	stc
LB_37762:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_37759
	btr r12,3
	clc
	jmp LB_37760
LB_37759:
	bts r12,3
	stc
LB_37760:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37757
	btr r12,2
	clc
	jmp LB_37758
LB_37757:
	bts r12,2
	stc
LB_37758:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37755
	btr r12,1
	clc
	jmp LB_37756
LB_37755:
	bts r12,1
	stc
LB_37756:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37753
	btr r12,0
	clc
	jmp LB_37754
LB_37753:
	bts r12,0
	stc
LB_37754:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_37748
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_37802
	btr r12,5
	jmp LB_37803
LB_37802:
	bts r12,5
LB_37803:
	mov r8,r10
	bt r12,4
	jc LB_37804
	btr r12,2
	jmp LB_37805
LB_37804:
	bts r12,2
LB_37805:
	mov r10,r14
	bt r12,1
	jc LB_37806
	btr r12,4
	jmp LB_37807
LB_37806:
	bts r12,4
LB_37807:
	mov r14,r9
	bt r12,3
	jc LB_37808
	btr r12,1
	jmp LB_37809
LB_37808:
	bts r12,1
LB_37809:
	mov r9,r13
	bt r12,0
	jc LB_37810
	btr r12,3
	jmp LB_37811
LB_37810:
	bts r12,3
LB_37811:
	mov r13,r11
	bt r12,5
	jc LB_37812
	btr r12,0
	jmp LB_37813
LB_37812:
	bts r12,0
LB_37813:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34886 ⊢ %_34887 : %_34887
 ; {>  %_34886~2':_p30737 %_34884~0':(_p30686)◂((_p30694)◂(_stg)) %_34885~1':_p30699 }
; _some 2' ⊢ °0◂2'
; _some { %_34884 %_34885 %_34887 } ⊢ %_34888 : %_34888
 ; {>  %_34884~0':(_p30686)◂((_p30694)◂(_stg)) %_34887~°0◂2':(_opn)◂(_p30737) %_34885~1':_p30699 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_34888
 ; {>  %_34888~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ (_p30686)◂((_p30694)◂(_stg)) _p30699 (_opn)◂(_p30737) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_37736
	btr r12,4
	jmp LB_37737
LB_37736:
	bts r12,4
LB_37737:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,4
	jc LB_37734
	btr QWORD [rdi],0
	jmp LB_37735
LB_37734:
	bts QWORD [rdi],0
LB_37735:
	mov r10,r14
	bt r12,1
	jc LB_37740
	btr r12,4
	jmp LB_37741
LB_37740:
	bts r12,4
LB_37741:
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,4
	jc LB_37738
	btr QWORD [rdi],1
	jmp LB_37739
LB_37738:
	bts QWORD [rdi],1
LB_37739:
	mov r10,r8
	bt r12,2
	jc LB_37746
	btr r12,4
	jmp LB_37747
LB_37746:
	bts r12,4
LB_37747:
	mov rsi,1
	bt r12,4
	jc LB_37744
	mov rsi,0
	bt r10,0
	jc LB_37744
	jmp LB_37745
LB_37744:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_37745:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov rsi,r10
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,4
	jc LB_37742
	btr QWORD [rdi],2
	jmp LB_37743
LB_37742:
	bts QWORD [rdi],2
LB_37743:
	mov r8,0
	bts r12,2
	ret
LB_37748:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37750
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37749
LB_37750:
	add rsp,8
	ret
LB_37752:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37751:
	add rsp,80
	pop r14
LB_37749:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_37851
LB_37850:
	add r14,1
LB_37851:
	cmp r14,r10
	jge LB_37852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37850
	cmp al,10
	jz LB_37850
	cmp al,32
	jz LB_37850
LB_37852:
	add r14,3
	cmp r14,r10
	jg LB_37855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_37855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_37855
	jmp LB_37856
LB_37855:
	jmp LB_37829
LB_37856:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_37838
LB_37837:
	add r14,1
LB_37838:
	cmp r14,r10
	jge LB_37839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37837
	cmp al,10
	jz LB_37837
	cmp al,32
	jz LB_37837
LB_37839:
	push r10
	call NS_E_33974_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37840
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37841
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37841:
	jmp LB_37830
LB_37840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_37844
LB_37843:
	add r14,1
LB_37844:
	cmp r14,r10
	jge LB_37845
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37843
	cmp al,10
	jz LB_37843
	cmp al,32
	jz LB_37843
LB_37845:
	push r10
	call NS_E_34573_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37846
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37847
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37847:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37848:
	jmp LB_37830
LB_37846:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37835
	btr r12,2
	clc
	jmp LB_37836
LB_37835:
	bts r12,2
	stc
LB_37836:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37833
	btr r12,1
	clc
	jmp LB_37834
LB_37833:
	bts r12,1
	stc
LB_37834:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37831
	btr r12,0
	clc
	jmp LB_37832
LB_37831:
	bts r12,0
	stc
LB_37832:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37826
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_37857
	btr r12,3
	jmp LB_37858
LB_37857:
	bts r12,3
LB_37858:
	mov r14,r8
	bt r12,2
	jc LB_37859
	btr r12,1
	jmp LB_37860
LB_37859:
	bts r12,1
LB_37860:
	mov r8,r13
	bt r12,0
	jc LB_37861
	btr r12,2
	jmp LB_37862
LB_37861:
	bts r12,2
LB_37862:
	mov r13,r9
	bt r12,3
	jc LB_37863
	btr r12,0
	jmp LB_37864
LB_37863:
	bts r12,0
LB_37864:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_34891 : %_34891
 ; {>  %_34890~1':_p30699 %_34889~0':(_p30686)◂((_p30694)◂(_stg)) }
; _none {  } ⊢ °1◂{  }
; _some { %_34889 %_34890 %_34891 } ⊢ %_34892 : %_34892
 ; {>  %_34891~°1◂{  }:(_opn)◂(t15026'(0)) %_34890~1':_p30699 %_34889~0':(_p30686)◂((_p30694)◂(_stg)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_34892
 ; {>  %_34892~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ (_p30686)◂((_p30694)◂(_stg)) _p30699 (_opn)◂(t15029'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37816
	btr r12,2
	jmp LB_37817
LB_37816:
	bts r12,2
LB_37817:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37814
	btr QWORD [rdi],0
	jmp LB_37815
LB_37814:
	bts QWORD [rdi],0
LB_37815:
	mov r8,r14
	bt r12,1
	jc LB_37820
	btr r12,2
	jmp LB_37821
LB_37820:
	bts r12,2
LB_37821:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37818
	btr QWORD [rdi],1
	jmp LB_37819
LB_37818:
	bts QWORD [rdi],1
LB_37819:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_37824
	mov rsi,0
	bt r8,0
	jc LB_37824
	jmp LB_37825
LB_37824:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_37825:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,2
	jc LB_37822
	btr QWORD [rdi],2
	jmp LB_37823
LB_37822:
	bts QWORD [rdi],2
LB_37823:
	mov r8,0
	bts r12,2
	ret
LB_37826:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37828
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37827
LB_37828:
	add rsp,8
	ret
LB_37830:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37829:
	add rsp,48
	pop r14
LB_37827:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34591:
NS_E_RDI_34591:
NS_E_34591_ETR_TBL:
NS_E_34591_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_37885
LB_37884:
	add r14,1
LB_37885:
	cmp r14,r10
	jge LB_37886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37884
	cmp al,10
	jz LB_37884
	cmp al,32
	jz LB_37884
LB_37886:
	add r14,2
	cmp r14,r10
	jg LB_37889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_37889
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_37889
	jmp LB_37890
LB_37889:
	jmp LB_37872
LB_37890:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_37879
LB_37878:
	add r14,1
LB_37879:
	cmp r14,r10
	jge LB_37880
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37878
	cmp al,10
	jz LB_37878
	cmp al,32
	jz LB_37878
LB_37880:
	push r10
	call NS_E_34592_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37881
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37882
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37882:
	jmp LB_37873
LB_37881:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37876
	btr r12,1
	clc
	jmp LB_37877
LB_37876:
	bts r12,1
	stc
LB_37877:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37874
	btr r12,0
	clc
	jmp LB_37875
LB_37874:
	bts r12,0
	stc
LB_37875:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37869
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_37891
	btr r12,2
	jmp LB_37892
LB_37891:
	bts r12,2
LB_37892:
	mov r13,r14
	bt r12,1
	jc LB_37893
	btr r12,0
	jmp LB_37894
LB_37893:
	bts r12,0
LB_37894:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30766 %_34893 ⊢ %_34894 : %_34894
 ; {>  %_34893~0':_p30740 }
; _f30766 0' ⊢ °0◂0'
; _some %_34894 ⊢ %_34895 : %_34895
 ; {>  %_34894~°0◂0':_p30739 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34895
 ; {>  %_34895~°0◂°0◂0':(_opn)◂(_p30739) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37867
	btr r12,3
	jmp LB_37868
LB_37867:
	bts r12,3
LB_37868:
	mov rsi,1
	bt r12,3
	jc LB_37865
	mov rsi,0
	bt r9,0
	jc LB_37865
	jmp LB_37866
LB_37865:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37866:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37869:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37871
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37870
LB_37871:
	add rsp,8
	ret
LB_37873:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_37872:
	add rsp,32
	pop r14
LB_37870:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_37914
LB_37913:
	add r14,1
LB_37914:
	cmp r14,r10
	jge LB_37915
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37913
	cmp al,10
	jz LB_37913
	cmp al,32
	jz LB_37913
LB_37915:
	push r10
	call NS_E_34593_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37916
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37908
LB_37916:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_37919
LB_37918:
	add r14,1
LB_37919:
	cmp r14,r10
	jge LB_37920
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37918
	cmp al,10
	jz LB_37918
	cmp al,32
	jz LB_37918
LB_37920:
	push r10
	call NS_E_34591_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37921
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37922
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37922:
	jmp LB_37908
LB_37921:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37911
	btr r12,1
	clc
	jmp LB_37912
LB_37911:
	bts r12,1
	stc
LB_37912:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37909
	btr r12,0
	clc
	jmp LB_37910
LB_37909:
	bts r12,0
	stc
LB_37910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37905
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f30767 { %_34896 %_34897 } ⊢ %_34898 : %_34898
 ; {>  %_34896~0':_p30741 %_34897~1':_p30739 }
; _f30767 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_34898 ⊢ %_34899 : %_34899
 ; {>  %_34898~°1◂{ 0' 1' }:_p30739 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_34899
 ; {>  %_34899~°0◂°1◂{ 0' 1' }:(_opn)◂(_p30739) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37899
	btr r12,2
	jmp LB_37900
LB_37899:
	bts r12,2
LB_37900:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37897
	btr QWORD [rdi],0
	jmp LB_37898
LB_37897:
	bts QWORD [rdi],0
LB_37898:
	mov r8,r14
	bt r12,1
	jc LB_37903
	btr r12,2
	jmp LB_37904
LB_37903:
	bts r12,2
LB_37904:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37901
	btr QWORD [rdi],1
	jmp LB_37902
LB_37901:
	bts QWORD [rdi],1
LB_37902:
	mov rsi,1
	bt r12,3
	jc LB_37895
	mov rsi,0
	bt r9,0
	jc LB_37895
	jmp LB_37896
LB_37895:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37896:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37905:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37907
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37906
LB_37907:
	add rsp,8
	ret
LB_37908:
	add rsp,32
	pop r14
LB_37906:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_37926
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f30768 {  } ⊢ %_34900 : %_34900
 ; {>  }
; _f30768 {  } ⊢ °2◂{  }
; _some %_34900 ⊢ %_34901 : %_34901
 ; {>  %_34900~°2◂{  }:_p30739 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_34901
 ; {>  %_34901~°0◂°2◂{  }:(_opn)◂(_p30739) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_37924
	mov rsi,0
	bt r9,0
	jc LB_37924
	jmp LB_37925
LB_37924:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37925:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37926:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37928
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37927
LB_37928:
	add rsp,8
	ret
LB_37929:
	add rsp,0
	pop r14
LB_37927:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34592:
NS_E_RDI_34592:
NS_E_34592_ETR_TBL:
NS_E_34592_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_37949
LB_37948:
	add r14,1
LB_37949:
	cmp r14,r10
	jge LB_37950
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37948
	cmp al,10
	jz LB_37948
	cmp al,32
	jz LB_37948
LB_37950:
	push r10
	call NS_E_34593_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37951
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37943
LB_37951:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_37954
LB_37953:
	add r14,1
LB_37954:
	cmp r14,r10
	jge LB_37955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37953
	cmp al,10
	jz LB_37953
	cmp al,32
	jz LB_37953
LB_37955:
	push r10
	call NS_E_34592_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37956
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37957
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37957:
	jmp LB_37943
LB_37956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37946
	btr r12,1
	clc
	jmp LB_37947
LB_37946:
	bts r12,1
	stc
LB_37947:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37944
	btr r12,0
	clc
	jmp LB_37945
LB_37944:
	bts r12,0
	stc
LB_37945:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_37940
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f30769 { %_34902 %_34903 } ⊢ %_34904 : %_34904
 ; {>  %_34903~1':_p30740 %_34902~0':_p30741 }
; _f30769 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_34904 ⊢ %_34905 : %_34905
 ; {>  %_34904~°0◂{ 0' 1' }:_p30740 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_34905
 ; {>  %_34905~°0◂°0◂{ 0' 1' }:(_opn)◂(_p30740) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_37934
	btr r12,2
	jmp LB_37935
LB_37934:
	bts r12,2
LB_37935:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,2
	jc LB_37932
	btr QWORD [rdi],0
	jmp LB_37933
LB_37932:
	bts QWORD [rdi],0
LB_37933:
	mov r8,r14
	bt r12,1
	jc LB_37938
	btr r12,2
	jmp LB_37939
LB_37938:
	bts r12,2
LB_37939:
	mov rdi,r9
	mov rsi,r8
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,2
	jc LB_37936
	btr QWORD [rdi],1
	jmp LB_37937
LB_37936:
	bts QWORD [rdi],1
LB_37937:
	mov rsi,1
	bt r12,3
	jc LB_37930
	mov rsi,0
	bt r9,0
	jc LB_37930
	jmp LB_37931
LB_37930:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37931:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37940:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37942
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37941
LB_37942:
	add rsp,8
	ret
LB_37943:
	add rsp,32
	pop r14
LB_37941:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_37961
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f30770 {  } ⊢ %_34906 : %_34906
 ; {>  }
; _f30770 {  } ⊢ °1◂{  }
; _some %_34906 ⊢ %_34907 : %_34907
 ; {>  %_34906~°1◂{  }:_p30740 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34907
 ; {>  %_34907~°0◂°1◂{  }:(_opn)◂(_p30740) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_37959
	mov rsi,0
	bt r9,0
	jc LB_37959
	jmp LB_37960
LB_37959:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37960:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37961:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37963
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37962
LB_37963:
	add rsp,8
	ret
LB_37964:
	add rsp,0
	pop r14
LB_37962:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34593:
NS_E_RDI_34593:
NS_E_34593_ETR_TBL:
NS_E_34593_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_37980
LB_37979:
	add r14,1
LB_37980:
	cmp r14,r10
	jge LB_37981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37979
	cmp al,10
	jz LB_37979
	cmp al,32
	jz LB_37979
LB_37981:
	add r14,3
	cmp r14,r10
	jg LB_37984
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37984
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_37984
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_37984
	jmp LB_37985
LB_37984:
	jmp LB_37972
LB_37985:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_37987
LB_37986:
	add r14,1
LB_37987:
	cmp r14,r10
	jge LB_37988
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37986
	cmp al,10
	jz LB_37986
	cmp al,32
	jz LB_37986
LB_37988:
	push r10
	call NS_E_34594_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_37989
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37990
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37990:
	jmp LB_37972
LB_37989:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_37993
LB_37992:
	add r14,1
LB_37993:
	cmp r14,r10
	jge LB_37994
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_37992
	cmp al,10
	jz LB_37992
	cmp al,32
	jz LB_37992
LB_37994:
	add r14,3
	cmp r14,r10
	jg LB_37999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_37999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_37999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_37999
	jmp LB_38000
LB_37999:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_37996
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_37996:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_37997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_37997:
	jmp LB_37972
LB_38000:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_37977
	btr r12,2
	clc
	jmp LB_37978
LB_37977:
	bts r12,2
	stc
LB_37978:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_37975
	btr r12,1
	clc
	jmp LB_37976
LB_37975:
	bts r12,1
	stc
LB_37976:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_37973
	btr r12,0
	clc
	jmp LB_37974
LB_37973:
	bts r12,0
	stc
LB_37974:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_37969
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_38001
	btr r12,3
	jmp LB_38002
LB_38001:
	bts r12,3
LB_38002:
	mov r13,r14
	bt r12,1
	jc LB_38003
	btr r12,0
	jmp LB_38004
LB_38003:
	bts r12,0
LB_38004:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f30771 %_34908 ⊢ %_34909 : %_34909
 ; {>  %_34908~0':_p30742 }
; _f30771 0' ⊢ °0◂0'
; _some %_34909 ⊢ %_34910 : %_34910
 ; {>  %_34909~°0◂0':_p30741 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34910
 ; {>  %_34910~°0◂°0◂0':(_opn)◂(_p30741) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_37967
	btr r12,3
	jmp LB_37968
LB_37967:
	bts r12,3
LB_37968:
	mov rsi,1
	bt r12,3
	jc LB_37965
	mov rsi,0
	bt r9,0
	jc LB_37965
	jmp LB_37966
LB_37965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_37966:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_37969:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_37971
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_37970
LB_37971:
	add rsp,8
	ret
LB_37972:
	add rsp,48
	pop r14
LB_37970:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_38016
LB_38015:
	add r14,1
LB_38016:
	cmp r14,r10
	jge LB_38017
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38015
	cmp al,10
	jz LB_38015
	cmp al,32
	jz LB_38015
LB_38017:
	push r10
	call NS_E_34594_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38018
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38012
LB_38018:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38013
	btr r12,0
	clc
	jmp LB_38014
LB_38013:
	bts r12,0
	stc
LB_38014:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38009
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30772 %_34911 ⊢ %_34912 : %_34912
 ; {>  %_34911~0':_p30742 }
; _f30772 0' ⊢ °1◂0'
; _some %_34912 ⊢ %_34913 : %_34913
 ; {>  %_34912~°1◂0':_p30741 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34913
 ; {>  %_34913~°0◂°1◂0':(_opn)◂(_p30741) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38007
	btr r12,3
	jmp LB_38008
LB_38007:
	bts r12,3
LB_38008:
	mov rsi,1
	bt r12,3
	jc LB_38005
	mov rsi,0
	bt r9,0
	jc LB_38005
	jmp LB_38006
LB_38005:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38006:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38009:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38011
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38010
LB_38011:
	add rsp,8
	ret
LB_38012:
	add rsp,16
	pop r14
LB_38010:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34594:
NS_E_RDI_34594:
NS_E_34594_ETR_TBL:
NS_E_34594_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_38031
LB_38030:
	add r14,1
LB_38031:
	cmp r14,r10
	jge LB_38032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38030
	cmp al,10
	jz LB_38030
	cmp al,32
	jz LB_38030
LB_38032:
	push r10
	call NS_E_30092_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38033
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38027
LB_38033:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38028
	btr r12,0
	clc
	jmp LB_38029
LB_38028:
	bts r12,0
	stc
LB_38029:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38024
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30774 %_34914 ⊢ %_34915 : %_34915
 ; {>  %_34914~0':_stg }
; _f30774 0' ⊢ °1◂0'
; _some %_34915 ⊢ %_34916 : %_34916
 ; {>  %_34915~°1◂0':_p30742 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_34916
 ; {>  %_34916~°0◂°1◂0':(_opn)◂(_p30742) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38022
	btr r12,3
	jmp LB_38023
LB_38022:
	bts r12,3
LB_38023:
	mov rsi,1
	bt r12,3
	jc LB_38020
	mov rsi,0
	bt r9,0
	jc LB_38020
	jmp LB_38021
LB_38020:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38021:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38024:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38026
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38025
LB_38026:
	add rsp,8
	ret
LB_38027:
	add rsp,16
	pop r14
LB_38025:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_38046
LB_38045:
	add r14,1
LB_38046:
	cmp r14,r10
	jge LB_38047
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38045
	cmp al,10
	jz LB_38045
	cmp al,32
	jz LB_38045
LB_38047:
	push r10
	call NS_E_33514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38048
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38042
LB_38048:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38043
	btr r12,0
	clc
	jmp LB_38044
LB_38043:
	bts r12,0
	stc
LB_38044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38039
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f30773 %_34917 ⊢ %_34918 : %_34918
 ; {>  %_34917~0':_p30641 }
; _f30773 0' ⊢ °0◂0'
; _some %_34918 ⊢ %_34919 : %_34919
 ; {>  %_34918~°0◂0':_p30742 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34919
 ; {>  %_34919~°0◂°0◂0':(_opn)◂(_p30742) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38037
	btr r12,3
	jmp LB_38038
LB_38037:
	bts r12,3
LB_38038:
	mov rsi,1
	bt r12,3
	jc LB_38035
	mov rsi,0
	bt r9,0
	jc LB_38035
	jmp LB_38036
LB_38035:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38036:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38040
LB_38041:
	add rsp,8
	ret
LB_38042:
	add rsp,16
	pop r14
LB_38040:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34595:
NS_E_RDI_34595:
NS_E_34595_ETR_TBL:
NS_E_34595_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_38059
LB_38058:
	add r14,1
LB_38059:
	cmp r14,r10
	jge LB_38060
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38058
	cmp al,10
	jz LB_38058
	cmp al,32
	jz LB_38058
LB_38060:
	add r14,4
	cmp r14,r10
	jg LB_38063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_38063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_38063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_38063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_38063
	jmp LB_38064
LB_38063:
	jmp LB_38055
LB_38064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38056
	btr r12,0
	clc
	jmp LB_38057
LB_38056:
	bts r12,0
	stc
LB_38057:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38052
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30764 {  } ⊢ %_34920 : %_34920
 ; {>  }
; _f30764 {  } ⊢ °1◂{  }
; _some %_34920 ⊢ %_34921 : %_34921
 ; {>  %_34920~°1◂{  }:_p30738 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34921
 ; {>  %_34921~°0◂°1◂{  }:(_opn)◂(_p30738) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38050
	mov rsi,0
	bt r9,0
	jc LB_38050
	jmp LB_38051
LB_38050:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38051:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38052:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38054
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38053
LB_38054:
	add rsp,8
	ret
LB_38055:
	add rsp,16
	pop r14
LB_38053:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_38074
LB_38073:
	add r14,1
LB_38074:
	cmp r14,r10
	jge LB_38075
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38073
	cmp al,10
	jz LB_38073
	cmp al,32
	jz LB_38073
LB_38075:
	add r14,4
	cmp r14,r10
	jg LB_38078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_38078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_38078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_38078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_38078
	jmp LB_38079
LB_38078:
	jmp LB_38070
LB_38079:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38071
	btr r12,0
	clc
	jmp LB_38072
LB_38071:
	bts r12,0
	stc
LB_38072:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38067
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30765 {  } ⊢ %_34922 : %_34922
 ; {>  }
; _f30765 {  } ⊢ °2◂{  }
; _some %_34922 ⊢ %_34923 : %_34923
 ; {>  %_34922~°2◂{  }:_p30738 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_34923
 ; {>  %_34923~°0◂°2◂{  }:(_opn)◂(_p30738) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38065
	mov rsi,0
	bt r9,0
	jc LB_38065
	jmp LB_38066
LB_38065:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38066:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38067:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38069
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38068
LB_38069:
	add rsp,8
	ret
LB_38070:
	add rsp,16
	pop r14
LB_38068:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_38089
LB_38088:
	add r14,1
LB_38089:
	cmp r14,r10
	jge LB_38090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38088
	cmp al,10
	jz LB_38088
	cmp al,32
	jz LB_38088
LB_38090:
	add r14,3
	cmp r14,r10
	jg LB_38093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_38093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_38093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_38093
	jmp LB_38094
LB_38093:
	jmp LB_38085
LB_38094:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38086
	btr r12,0
	clc
	jmp LB_38087
LB_38086:
	bts r12,0
	stc
LB_38087:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38082
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30763 {  } ⊢ %_34924 : %_34924
 ; {>  }
; _f30763 {  } ⊢ °0◂{  }
; _some %_34924 ⊢ %_34925 : %_34925
 ; {>  %_34924~°0◂{  }:_p30738 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_34925
 ; {>  %_34925~°0◂°0◂{  }:(_opn)◂(_p30738) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38080
	mov rsi,0
	bt r9,0
	jc LB_38080
	jmp LB_38081
LB_38080:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38081:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38082:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38084
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38083
LB_38084:
	add rsp,8
	ret
LB_38085:
	add rsp,16
	pop r14
LB_38083:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34596:
NS_E_RDI_34596:
NS_E_34596_ETR_TBL:
NS_E_34596_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_38104
LB_38103:
	add r14,1
LB_38104:
	cmp r14,r10
	jge LB_38105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38103
	cmp al,10
	jz LB_38103
	cmp al,32
	jz LB_38103
LB_38105:
	add r14,5
	cmp r14,r10
	jg LB_38108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_38108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_38108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_38108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_38108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_38108
	jmp LB_38109
LB_38108:
	jmp LB_38100
LB_38109:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38101
	btr r12,0
	clc
	jmp LB_38102
LB_38101:
	bts r12,0
	stc
LB_38102:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38097
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30764 {  } ⊢ %_34926 : %_34926
 ; {>  }
; _f30764 {  } ⊢ °1◂{  }
; _some %_34926 ⊢ %_34927 : %_34927
 ; {>  %_34926~°1◂{  }:_p30738 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34927
 ; {>  %_34927~°0◂°1◂{  }:(_opn)◂(_p30738) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38095
	mov rsi,0
	bt r9,0
	jc LB_38095
	jmp LB_38096
LB_38095:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38096:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38099
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38098
LB_38099:
	add rsp,8
	ret
LB_38100:
	add rsp,16
	pop r14
LB_38098:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_38119
LB_38118:
	add r14,1
LB_38119:
	cmp r14,r10
	jge LB_38120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38118
	cmp al,10
	jz LB_38118
	cmp al,32
	jz LB_38118
LB_38120:
	add r14,5
	cmp r14,r10
	jg LB_38123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_38123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_38123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_38123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_38123
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_38123
	jmp LB_38124
LB_38123:
	jmp LB_38115
LB_38124:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38116
	btr r12,0
	clc
	jmp LB_38117
LB_38116:
	bts r12,0
	stc
LB_38117:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38112
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30765 {  } ⊢ %_34928 : %_34928
 ; {>  }
; _f30765 {  } ⊢ °2◂{  }
; _some %_34928 ⊢ %_34929 : %_34929
 ; {>  %_34928~°2◂{  }:_p30738 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_34929
 ; {>  %_34929~°0◂°2◂{  }:(_opn)◂(_p30738) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38110
	mov rsi,0
	bt r9,0
	jc LB_38110
	jmp LB_38111
LB_38110:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38111:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38112:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38114
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38113
LB_38114:
	add rsp,8
	ret
LB_38115:
	add rsp,16
	pop r14
LB_38113:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_38134
LB_38133:
	add r14,1
LB_38134:
	cmp r14,r10
	jge LB_38135
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38133
	cmp al,10
	jz LB_38133
	cmp al,32
	jz LB_38133
LB_38135:
	add r14,4
	cmp r14,r10
	jg LB_38138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_38138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_38138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_38138
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_38138
	jmp LB_38139
LB_38138:
	jmp LB_38130
LB_38139:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38131
	btr r12,0
	clc
	jmp LB_38132
LB_38131:
	bts r12,0
	stc
LB_38132:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_38127
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f30763 {  } ⊢ %_34930 : %_34930
 ; {>  }
; _f30763 {  } ⊢ °0◂{  }
; _some %_34930 ⊢ %_34931 : %_34931
 ; {>  %_34930~°0◂{  }:_p30738 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_34931
 ; {>  %_34931~°0◂°0◂{  }:(_opn)◂(_p30738) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38125
	mov rsi,0
	bt r9,0
	jc LB_38125
	jmp LB_38126
LB_38125:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38126:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38127:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38129
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38128
LB_38129:
	add rsp,8
	ret
LB_38130:
	add rsp,16
	pop r14
LB_38128:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34597:
NS_E_RDI_34597:
NS_E_34597_ETR_TBL:
NS_E_34597_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_38195
LB_38194:
	add r14,1
LB_38195:
	cmp r14,r10
	jge LB_38196
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38194
	cmp al,10
	jz LB_38194
	cmp al,32
	jz LB_38194
LB_38196:
	push r10
	call NS_E_34596_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38197
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38163
LB_38197:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_38174
LB_38173:
	add r14,1
LB_38174:
	cmp r14,r10
	jge LB_38175
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38173
	cmp al,10
	jz LB_38173
	cmp al,32
	jz LB_38173
LB_38175:
	push r10
	call NS_E_34599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38176
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38177
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38177:
	jmp LB_38164
LB_38176:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_38180
LB_38179:
	add r14,1
LB_38180:
	cmp r14,r10
	jge LB_38181
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38179
	cmp al,10
	jz LB_38179
	cmp al,32
	jz LB_38179
LB_38181:
	push r10
	call NS_E_34591_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38182
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38183
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38183:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38184
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38184:
	jmp LB_38164
LB_38182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_38187
LB_38186:
	add r14,1
LB_38187:
	cmp r14,r10
	jge LB_38188
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38186
	cmp al,10
	jz LB_38186
	cmp al,32
	jz LB_38186
LB_38188:
	push r10
	call NS_E_34598_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38189
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38190
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38190:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38191
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38191:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38192:
	jmp LB_38164
LB_38189:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_38171
	btr r12,3
	clc
	jmp LB_38172
LB_38171:
	bts r12,3
	stc
LB_38172:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_38169
	btr r12,2
	clc
	jmp LB_38170
LB_38169:
	bts r12,2
	stc
LB_38170:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38167
	btr r12,1
	clc
	jmp LB_38168
LB_38167:
	bts r12,1
	stc
LB_38168:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38165
	btr r12,0
	clc
	jmp LB_38166
LB_38165:
	bts r12,0
	stc
LB_38166:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_38160
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f30760 { %_34933 %_34932 %_34934 %_34935 } ⊢ %_34936 : %_34936
 ; {>  %_34932~0':_p30738 %_34934~2':_p30739 %_34933~1':(_opn)◂(_stg) %_34935~3':(_opn)◂(_p30736) }
; _f30760 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_34936 ⊢ %_34937 : %_34937
 ; {>  %_34936~°1◂{ 1' 0' 2' 3' }:_p30736 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_34937
 ; {>  %_34937~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p30736) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_38140
	btr r12,4
	jmp LB_38141
LB_38140:
	bts r12,4
LB_38141:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_38146
	btr r12,5
	jmp LB_38147
LB_38146:
	bts r12,5
LB_38147:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_38144
	btr QWORD [rdi],0
	jmp LB_38145
LB_38144:
	bts QWORD [rdi],0
LB_38145:
	mov r11,r13
	bt r12,0
	jc LB_38150
	btr r12,5
	jmp LB_38151
LB_38150:
	bts r12,5
LB_38151:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_38148
	btr QWORD [rdi],1
	jmp LB_38149
LB_38148:
	bts QWORD [rdi],1
LB_38149:
	mov r11,r8
	bt r12,2
	jc LB_38154
	btr r12,5
	jmp LB_38155
LB_38154:
	bts r12,5
LB_38155:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,5
	jc LB_38152
	btr QWORD [rdi],2
	jmp LB_38153
LB_38152:
	bts QWORD [rdi],2
LB_38153:
	mov r11,r10
	bt r12,4
	jc LB_38158
	btr r12,5
	jmp LB_38159
LB_38158:
	bts r12,5
LB_38159:
	mov rdi,r9
	mov rsi,r11
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,5
	jc LB_38156
	btr QWORD [rdi],3
	jmp LB_38157
LB_38156:
	bts QWORD [rdi],3
LB_38157:
	mov rsi,1
	bt r12,3
	jc LB_38142
	mov rsi,0
	bt r9,0
	jc LB_38142
	jmp LB_38143
LB_38142:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38143:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38160:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38162
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38161
LB_38162:
	add rsp,8
	ret
LB_38164:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_38163:
	add rsp,64
	pop r14
LB_38161:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_38238
LB_38237:
	add r14,1
LB_38238:
	cmp r14,r10
	jge LB_38239
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38237
	cmp al,10
	jz LB_38237
	cmp al,32
	jz LB_38237
LB_38239:
	push r10
	call NS_E_34595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38240
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38226
LB_38240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_38243
LB_38242:
	add r14,1
LB_38243:
	cmp r14,r10
	jge LB_38244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38242
	cmp al,10
	jz LB_38242
	cmp al,32
	jz LB_38242
LB_38244:
	push r10
	call NS_E_34599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38245
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38246
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38246:
	jmp LB_38226
LB_38245:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_38249
LB_38248:
	add r14,1
LB_38249:
	cmp r14,r10
	jge LB_38250
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38248
	cmp al,10
	jz LB_38248
	cmp al,32
	jz LB_38248
LB_38250:
	push r10
	call NS_E_34591_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38251
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38252
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38252:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38253:
	jmp LB_38226
LB_38251:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_38256
LB_38255:
	add r14,1
LB_38256:
	cmp r14,r10
	jge LB_38257
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38255
	cmp al,10
	jz LB_38255
	cmp al,32
	jz LB_38255
LB_38257:
	push r10
	call NS_E_34598_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38258
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38259
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38259:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38260
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38260:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38261
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38261:
	jmp LB_38226
LB_38258:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_38264
LB_38263:
	add r14,1
LB_38264:
	cmp r14,r10
	jge LB_38265
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38263
	cmp al,10
	jz LB_38263
	cmp al,32
	jz LB_38263
LB_38265:
	push r10
	call NS_E_34597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38266
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_38267
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_38267:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_38268
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_38268:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_38269
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_38269:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38270:
	jmp LB_38226
LB_38266:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_38235
	btr r12,4
	clc
	jmp LB_38236
LB_38235:
	bts r12,4
	stc
LB_38236:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_38233
	btr r12,3
	clc
	jmp LB_38234
LB_38233:
	bts r12,3
	stc
LB_38234:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_38231
	btr r12,2
	clc
	jmp LB_38232
LB_38231:
	bts r12,2
	stc
LB_38232:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38229
	btr r12,1
	clc
	jmp LB_38230
LB_38229:
	bts r12,1
	stc
LB_38230:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38227
	btr r12,0
	clc
	jmp LB_38228
LB_38227:
	bts r12,0
	stc
LB_38228:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_38223
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f30759 { %_34939 %_34938 %_34940 %_34941 %_34942 } ⊢ %_34943 : %_34943
 ; {>  %_34938~0':_p30738 %_34942~4':_p30736 %_34940~2':_p30739 %_34941~3':(_opn)◂(_p30736) %_34939~1':(_opn)◂(_stg) }
; _f30759 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_34943 ⊢ %_34944 : %_34944
 ; {>  %_34943~°0◂{ 1' 0' 2' 3' 4' }:_p30736 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_34944
 ; {>  %_34944~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p30736) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_38199
	btr r12,5
	jmp LB_38200
LB_38199:
	bts r12,5
LB_38200:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_38205
	btr r12,6
	jmp LB_38206
LB_38205:
	bts r12,6
LB_38206:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_38203
	btr QWORD [rdi],0
	jmp LB_38204
LB_38203:
	bts QWORD [rdi],0
LB_38204:
	mov rcx,r13
	bt r12,0
	jc LB_38209
	btr r12,6
	jmp LB_38210
LB_38209:
	bts r12,6
LB_38210:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_38207
	btr QWORD [rdi],1
	jmp LB_38208
LB_38207:
	bts QWORD [rdi],1
LB_38208:
	mov rcx,r8
	bt r12,2
	jc LB_38213
	btr r12,6
	jmp LB_38214
LB_38213:
	bts r12,6
LB_38214:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_38211
	btr QWORD [rdi],2
	jmp LB_38212
LB_38211:
	bts QWORD [rdi],2
LB_38212:
	mov rcx,r11
	bt r12,5
	jc LB_38217
	btr r12,6
	jmp LB_38218
LB_38217:
	bts r12,6
LB_38218:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_38215
	btr QWORD [rdi],3
	jmp LB_38216
LB_38215:
	bts QWORD [rdi],3
LB_38216:
	mov rcx,r10
	bt r12,4
	jc LB_38221
	btr r12,6
	jmp LB_38222
LB_38221:
	bts r12,6
LB_38222:
	mov rdi,r9
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*4],rsi
	bt r12,6
	jc LB_38219
	btr QWORD [rdi],4
	jmp LB_38220
LB_38219:
	bts QWORD [rdi],4
LB_38220:
	mov rsi,1
	bt r12,3
	jc LB_38201
	mov rsi,0
	bt r9,0
	jc LB_38201
	jmp LB_38202
LB_38201:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38202:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38223:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38225
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38224
LB_38225:
	add rsp,8
	ret
LB_38226:
	add rsp,80
	pop r14
LB_38224:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34598:
NS_E_RDI_34598:
NS_E_34598_ETR_TBL:
NS_E_34598_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_38285
LB_38284:
	add r14,1
LB_38285:
	cmp r14,r10
	jge LB_38286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38284
	cmp al,10
	jz LB_38284
	cmp al,32
	jz LB_38284
LB_38286:
	add r14,1
	cmp r14,r10
	jg LB_38289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_38289
	jmp LB_38290
LB_38289:
	jmp LB_38279
LB_38290:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_38292
LB_38291:
	add r14,1
LB_38292:
	cmp r14,r10
	jge LB_38293
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38291
	cmp al,10
	jz LB_38291
	cmp al,32
	jz LB_38291
LB_38293:
	push r10
	call NS_E_34597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38294
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38295:
	jmp LB_38279
LB_38294:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38282
	btr r12,1
	clc
	jmp LB_38283
LB_38282:
	bts r12,1
	stc
LB_38283:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38280
	btr r12,0
	clc
	jmp LB_38281
LB_38280:
	bts r12,0
	stc
LB_38281:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_38276
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_38297
	btr r12,2
	jmp LB_38298
LB_38297:
	bts r12,2
LB_38298:
	mov r13,r14
	bt r12,1
	jc LB_38299
	btr r12,0
	jmp LB_38300
LB_38299:
	bts r12,0
LB_38300:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34945 ⊢ %_34946 : %_34946
 ; {>  %_34945~0':_p30736 }
; _some 0' ⊢ °0◂0'
; _some %_34946 ⊢ %_34947 : %_34947
 ; {>  %_34946~°0◂0':(_opn)◂(_p30736) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34947
 ; {>  %_34947~°0◂°0◂0':(_opn)◂((_opn)◂(_p30736)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38274
	btr r12,3
	jmp LB_38275
LB_38274:
	bts r12,3
LB_38275:
	mov rsi,1
	bt r12,3
	jc LB_38272
	mov rsi,0
	bt r9,0
	jc LB_38272
	jmp LB_38273
LB_38272:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38273:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38276:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38278
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38277
LB_38278:
	add rsp,8
	ret
LB_38279:
	add rsp,32
	pop r14
LB_38277:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_38303
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_34948 : %_34948
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_34948 ⊢ %_34949 : %_34949
 ; {>  %_34948~°1◂{  }:(_opn)◂(t15107'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34949
 ; {>  %_34949~°0◂°1◂{  }:(_opn)◂((_opn)◂(t15110'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38301
	mov rsi,0
	bt r9,0
	jc LB_38301
	jmp LB_38302
LB_38301:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38302:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38303:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38305
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38304
LB_38305:
	add rsp,8
	ret
LB_38306:
	add rsp,0
	pop r14
LB_38304:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_34599:
NS_E_RDI_34599:
NS_E_34599_ETR_TBL:
NS_E_34599_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_38320
LB_38319:
	add r14,1
LB_38320:
	cmp r14,r10
	jge LB_38321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38319
	cmp al,10
	jz LB_38319
	cmp al,32
	jz LB_38319
LB_38321:
	push r10
	call NS_E_30466_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_38322
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38314
LB_38322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_38325
LB_38324:
	add r14,1
LB_38325:
	cmp r14,r10
	jge LB_38326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_38324
	cmp al,10
	jz LB_38324
	cmp al,32
	jz LB_38324
LB_38326:
	add r14,1
	cmp r14,r10
	jg LB_38330
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_38330
	jmp LB_38331
LB_38330:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_38328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_38328:
	jmp LB_38314
LB_38331:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_38317
	btr r12,1
	clc
	jmp LB_38318
LB_38317:
	bts r12,1
	stc
LB_38318:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_38315
	btr r12,0
	clc
	jmp LB_38316
LB_38315:
	bts r12,0
	stc
LB_38316:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_38311
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_34950 ⊢ %_34951 : %_34951
 ; {>  %_34950~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_34951 ⊢ %_34952 : %_34952
 ; {>  %_34951~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_34952
 ; {>  %_34952~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_38309
	btr r12,3
	jmp LB_38310
LB_38309:
	bts r12,3
LB_38310:
	mov rsi,1
	bt r12,3
	jc LB_38307
	mov rsi,0
	bt r9,0
	jc LB_38307
	jmp LB_38308
LB_38307:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38308:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38311:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38313
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38312
LB_38313:
	add rsp,8
	ret
LB_38314:
	add rsp,32
	pop r14
LB_38312:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_38334
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_34953 : %_34953
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_34953 ⊢ %_34954 : %_34954
 ; {>  %_34953~°1◂{  }:(_opn)◂(t15119'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_34954
 ; {>  %_34954~°0◂°1◂{  }:(_opn)◂((_opn)◂(t15122'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_38332
	mov rsi,0
	bt r9,0
	jc LB_38332
	jmp LB_38333
LB_38332:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38333:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_38334:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_38336
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_38335
LB_38336:
	add rsp,8
	ret
LB_38337:
	add rsp,0
	pop r14
LB_38335:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_38385:
; 	|» { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
NS_E_RDI_38385:
; ∎ { %_38376 %_38377 %_38378 %_38379 %_38380 %_38381 %_38382 %_38383 }
 ; {>  %_38382~6':(_p0)◂(t15733'(-1)) %_38384~8':t15699'(-1) %_38381~5':_r64 %_38383~7':_r64 %_38380~4':(_p0)◂(t15732'(-1)) %_38377~1':_r64 %_38379~3':_r64 %_38378~2':(_p0)◂(t15731'(-1)) %_38376~0':(_p0)◂(t15730'(-1)) }
; 	∎ { 0' 1' 2' 3' 4' 5' 6' 7' }
	bt r12,8
	jc LB_38386
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_38386:
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	ret
NS_E_38375:
; 	|» 0'
NS_E_RDI_38375:
; » 0xrc8 |~ {  } ⊢ %_38354 : %_38354
 ; {>  %_38353~0':t15699'(-1) }
; 	» 0xrc8 _ ⊢ 1' : %_38354
	mov rdi,0xc8
	mov r14,rdi
	bts r12,1
; _f20 %_38354 ⊢ { %_38355 %_38356 } : { %_38355 %_38356 }
 ; {>  %_38353~0':t15699'(-1) %_38354~1':_r64 }
; _f20 1' ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_38389
	btr r12,0
	jmp LB_38390
LB_38389:
	bts r12,0
LB_38390:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_38391
	btr r12,2
	jmp LB_38392
LB_38391:
	bts r12,2
LB_38392:
	mov r14,r13
	bt r12,0
	jc LB_38393
	btr r12,1
	jmp LB_38394
LB_38393:
	bts r12,1
LB_38394:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38387
	btr r12,0
	clc
	jmp LB_38388
LB_38387:
	bts r12,0
	stc
LB_38388:
	add rsp,16
; _f20 %_38355 ⊢ { %_38357 %_38358 } : { %_38357 %_38358 }
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38355~1':_r64 %_38353~0':t15699'(-1) }
; _f20 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_38399
	btr r12,0
	jmp LB_38400
LB_38399:
	bts r12,0
LB_38400:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_38401
	btr r12,3
	jmp LB_38402
LB_38401:
	bts r12,3
LB_38402:
	mov r14,r13
	bt r12,0
	jc LB_38403
	btr r12,1
	jmp LB_38404
LB_38403:
	bts r12,1
LB_38404:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_38397
	btr r12,2
	clc
	jmp LB_38398
LB_38397:
	bts r12,2
	stc
LB_38398:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38395
	btr r12,0
	clc
	jmp LB_38396
LB_38395:
	bts r12,0
	stc
LB_38396:
	add rsp,24
; _f20 %_38357 ⊢ { %_38359 %_38360 } : { %_38359 %_38360 }
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38357~1':_r64 %_38353~0':t15699'(-1) %_38358~3':(_p0)◂(t15717'(0)) }
; _f20 1' ⊢ { 1' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_38411
	btr r12,0
	jmp LB_38412
LB_38411:
	bts r12,0
LB_38412:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_38413
	btr r12,4
	jmp LB_38414
LB_38413:
	bts r12,4
LB_38414:
	mov r14,r13
	bt r12,0
	jc LB_38415
	btr r12,1
	jmp LB_38416
LB_38415:
	bts r12,1
LB_38416:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_38409
	btr r12,3
	clc
	jmp LB_38410
LB_38409:
	bts r12,3
	stc
LB_38410:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_38407
	btr r12,2
	clc
	jmp LB_38408
LB_38407:
	bts r12,2
	stc
LB_38408:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38405
	btr r12,0
	clc
	jmp LB_38406
LB_38405:
	bts r12,0
	stc
LB_38406:
	add rsp,32
; _f20 %_38359 ⊢ { %_38361 %_38362 } : { %_38361 %_38362 }
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38353~0':t15699'(-1) %_38359~1':_r64 %_38360~4':(_p0)◂(t15720'(0)) %_38358~3':(_p0)◂(t15717'(0)) }
; _f20 1' ⊢ { 1' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_38425
	btr r12,0
	jmp LB_38426
LB_38425:
	bts r12,0
LB_38426:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_38427
	btr r12,5
	jmp LB_38428
LB_38427:
	bts r12,5
LB_38428:
	mov r14,r13
	bt r12,0
	jc LB_38429
	btr r12,1
	jmp LB_38430
LB_38429:
	bts r12,1
LB_38430:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_38423
	btr r12,4
	clc
	jmp LB_38424
LB_38423:
	bts r12,4
	stc
LB_38424:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_38421
	btr r12,3
	clc
	jmp LB_38422
LB_38421:
	bts r12,3
	stc
LB_38422:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_38419
	btr r12,2
	clc
	jmp LB_38420
LB_38419:
	bts r12,2
	stc
LB_38420:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38417
	btr r12,0
	clc
	jmp LB_38418
LB_38417:
	bts r12,0
	stc
LB_38418:
	add rsp,40
; » 0xr0 |~ {  } ⊢ %_38363 : %_38363
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38362~5':(_p0)◂(t15723'(0)) %_38353~0':t15699'(-1) %_38361~1':_r64 %_38360~4':(_p0)◂(t15720'(0)) %_38358~3':(_p0)◂(t15717'(0)) }
; 	» 0xr0 _ ⊢ 6' : %_38363
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; » 0xr0 |~ {  } ⊢ %_38364 : %_38364
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38362~5':(_p0)◂(t15723'(0)) %_38353~0':t15699'(-1) %_38361~1':_r64 %_38363~6':_r64 %_38360~4':(_p0)◂(t15720'(0)) %_38358~3':(_p0)◂(t15717'(0)) }
; 	» 0xr0 _ ⊢ 7' : %_38364
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; » 0xr0 |~ {  } ⊢ %_38365 : %_38365
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38362~5':(_p0)◂(t15723'(0)) %_38364~7':_r64 %_38353~0':t15699'(-1) %_38361~1':_r64 %_38363~6':_r64 %_38360~4':(_p0)◂(t15720'(0)) %_38358~3':(_p0)◂(t15717'(0)) }
; 	» 0xr0 _ ⊢ 8' : %_38365
	mov rdi,0x0
	mov QWORD [st_vct+8*8],rdi
	bts r12,8
; » 0xr0 |~ {  } ⊢ %_38366 : %_38366
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38362~5':(_p0)◂(t15723'(0)) %_38365~8':_r64 %_38364~7':_r64 %_38353~0':t15699'(-1) %_38361~1':_r64 %_38363~6':_r64 %_38360~4':(_p0)◂(t15720'(0)) %_38358~3':(_p0)◂(t15717'(0)) }
; 	» 0xr0 _ ⊢ 9' : %_38366
	mov QWORD [st_vct+8*9],0x0
	bts r12,9
; _f38385 { %_38356 %_38363 %_38358 %_38364 %_38360 %_38365 %_38362 %_38366 %_38353 } ⊢ { %_38367 %_38368 %_38369 %_38370 %_38371 %_38372 %_38373 %_38374 } : { %_38367 %_38368 %_38369 %_38370 %_38371 %_38372 %_38373 %_38374 }
 ; {>  %_38356~2':(_p0)◂(t15714'(0)) %_38362~5':(_p0)◂(t15723'(0)) %_38365~8':_r64 %_38364~7':_r64 %_38366~9':_r64 %_38353~0':t15699'(-1) %_38361~1':_r64 %_38363~6':_r64 %_38360~4':(_p0)◂(t15720'(0)) %_38358~3':(_p0)◂(t15717'(0)) }
; _f38385 { 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10111111110.. |},{ 2' 6' 3' 7' 4' 8' 5' 9' 0' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' 8' }
	mov r14,rcx
	bt r12,6
	jc LB_38433
	btr r12,1
	jmp LB_38434
LB_38433:
	bts r12,1
LB_38434:
	mov rcx,r11
	bt r12,5
	jc LB_38435
	btr r12,6
	jmp LB_38436
LB_38435:
	bts r12,6
LB_38436:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38437
	btr r12,5
	jmp LB_38438
LB_38437:
	bts r12,5
LB_38438:
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_38439
	btr r12,8
	jmp LB_38440
LB_38439:
	bts r12,8
LB_38440:
	mov r13,r8
	bt r12,2
	jc LB_38441
	btr r12,0
	jmp LB_38442
LB_38441:
	bts r12,0
LB_38442:
	mov r8,r9
	bt r12,3
	jc LB_38443
	btr r12,2
	jmp LB_38444
LB_38443:
	bts r12,2
LB_38444:
	mov r9,rdx
	bt r12,7
	jc LB_38445
	btr r12,3
	jmp LB_38446
LB_38445:
	bts r12,3
LB_38446:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_38447
	btr r12,7
	jmp LB_38448
LB_38447:
	bts r12,7
LB_38448:
	call NS_E_38385
; _emt_mov_ptn_to_ptn:{| 111111110.. |},{ 0' 1' 2' 3' 4' 5' 6' 7' } ⊢ { 0' 2' 3' 4' 5' 6' 7' 8' }
	mov rdi,rdx
	mov QWORD [st_vct+8*8],rdi
	bt r12,7
	jc LB_38449
	btr r12,8
	jmp LB_38450
LB_38449:
	bts r12,8
LB_38450:
	mov rdx,rcx
	bt r12,6
	jc LB_38451
	btr r12,7
	jmp LB_38452
LB_38451:
	bts r12,7
LB_38452:
	mov rcx,r11
	bt r12,5
	jc LB_38453
	btr r12,6
	jmp LB_38454
LB_38453:
	bts r12,6
LB_38454:
	mov r11,r10
	bt r12,4
	jc LB_38455
	btr r12,5
	jmp LB_38456
LB_38455:
	bts r12,5
LB_38456:
	mov r10,r9
	bt r12,3
	jc LB_38457
	btr r12,4
	jmp LB_38458
LB_38457:
	bts r12,4
LB_38458:
	mov r9,r8
	bt r12,2
	jc LB_38459
	btr r12,3
	jmp LB_38460
LB_38459:
	bts r12,3
LB_38460:
	mov r8,r14
	bt r12,1
	jc LB_38461
	btr r12,2
	jmp LB_38462
LB_38461:
	bts r12,2
LB_38462:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_38431
	btr r12,1
	clc
	jmp LB_38432
LB_38431:
	bts r12,1
	stc
LB_38432:
	add rsp,16
; ∎ { %_38367 %_38368 %_38369 %_38370 %_38371 %_38372 %_38373 %_38374 }
 ; {>  %_38371~5':(_p0)◂(t15732'(-1)) %_38368~2':_r64 %_38369~3':(_p0)◂(t15731'(-1)) %_38374~8':_r64 %_38372~6':_r64 %_38361~1':_r64 %_38367~0':(_p0)◂(t15730'(-1)) %_38370~4':_r64 %_38373~7':(_p0)◂(t15733'(-1)) }
; 	∎ { 0' 2' 3' 4' 5' 6' 7' 8' }
	bt r12,1
	jc LB_38463
	mov rdi,r14
	call dlt
LB_38463:
; _emt_mov_ptn_to_ptn:{| 1011111110.. |},{ 0' 2' 3' 4' 5' 6' 7' 8' } ⊢ { 0' 1' 2' 3' 4' 5' 6' 7' }
	mov r14,r8
	bt r12,2
	jc LB_38464
	btr r12,1
	jmp LB_38465
LB_38464:
	bts r12,1
LB_38465:
	mov r8,r9
	bt r12,3
	jc LB_38466
	btr r12,2
	jmp LB_38467
LB_38466:
	bts r12,2
LB_38467:
	mov r9,r10
	bt r12,4
	jc LB_38468
	btr r12,3
	jmp LB_38469
LB_38468:
	bts r12,3
LB_38469:
	mov r10,r11
	bt r12,5
	jc LB_38470
	btr r12,4
	jmp LB_38471
LB_38470:
	bts r12,4
LB_38471:
	mov r11,rcx
	bt r12,6
	jc LB_38472
	btr r12,5
	jmp LB_38473
LB_38472:
	bts r12,5
LB_38473:
	mov rcx,rdx
	bt r12,7
	jc LB_38474
	btr r12,6
	jmp LB_38475
LB_38474:
	bts r12,6
LB_38475:
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38476
	btr r12,7
	jmp LB_38477
LB_38476:
	bts r12,7
LB_38477:
	ret
NS_E_38523:
NS_E_RDI_38523:
; » _^ ..
	xor rax,rax
	add rax,9
	add rax,15
	add rax,13
	add rax,10
	add rax,9
	add rax,7
	add rax,10
	add rax,11
	add rax,10
	add rax,10
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; » 0xr0 |~ {  } ⊢ %_38479 : %_38479
 ; {>  %_38478~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_38479
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_38480 : %_38480
 ; {>  %_38478~0':_stg %_38479~1':_r64 }
; 	» _args _ ⊢ 2' : %_38480
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r8,rax
	btr r12,2
MTC_LB_38524:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38525
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_38526
	bt QWORD [rdi],0
	jc LB_38527
	btr r12,5
	clc
	jmp LB_38528
LB_38527:
	bts r12,5
	stc
LB_38528:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_38526:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_38531
	btr r12,6
	clc
	jmp LB_38532
LB_38531:
	bts r12,6
	stc
LB_38532:
	mov r9,rcx
	bt r12,6
	jc LB_38529
	btr r12,3
	jmp LB_38530
LB_38529:
	bts r12,3
LB_38530:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_38535
	btr r12,6
	clc
	jmp LB_38536
LB_38535:
	bts r12,6
	stc
LB_38536:
	mov r10,rcx
	bt r12,6
	jc LB_38533
	btr r12,4
	jmp LB_38534
LB_38533:
	bts r12,4
LB_38534:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38525
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_38537
	bt QWORD [rdi],0
	jc LB_38538
	btr r12,7
	clc
	jmp LB_38539
LB_38538:
	bts r12,7
	stc
LB_38539:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_38537:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_38542
	btr r12,8
	clc
	jmp LB_38543
LB_38542:
	bts r12,8
	stc
LB_38543:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38540
	btr r12,5
	jmp LB_38541
LB_38540:
	bts r12,5
LB_38541:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_38546
	btr r12,8
	clc
	jmp LB_38547
LB_38546:
	bts r12,8
	stc
LB_38547:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38544
	btr r12,6
	jmp LB_38545
LB_38544:
	bts r12,6
LB_38545:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_38525
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_38548
	bt QWORD [rdi],0
	jc LB_38549
	btr r12,7
	clc
	jmp LB_38550
LB_38549:
	bts r12,7
	stc
LB_38550:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_38548:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_38551:
	cmp r15,0
	jz LB_38552
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38551
LB_38552:
; _f37 %_38483 ⊢ { %_38485 %_38486 } : { %_38485 %_38486 }
 ; {>  %_38483~5':_stg %_38478~0':_stg %_38479~1':_r64 %_38481~3':_stg }
; _f37 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_38559
	btr r12,0
	jmp LB_38560
LB_38559:
	bts r12,0
LB_38560:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_38561
	btr r12,2
	jmp LB_38562
LB_38561:
	bts r12,2
LB_38562:
	mov r10,r14
	bt r12,1
	jc LB_38563
	btr r12,4
	jmp LB_38564
LB_38563:
	bts r12,4
LB_38564:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_38557
	btr r12,3
	clc
	jmp LB_38558
LB_38557:
	bts r12,3
	stc
LB_38558:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38555
	btr r12,1
	clc
	jmp LB_38556
LB_38555:
	bts r12,1
	stc
LB_38556:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38553
	btr r12,0
	clc
	jmp LB_38554
LB_38553:
	bts r12,0
	stc
LB_38554:
	add rsp,32
; _f33455 %_38486 ⊢ { %_38487 %_38488 } : { %_38487 %_38488 }
 ; {>  %_38478~0':_stg %_38486~4':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; _f33455 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_38573
	btr r12,0
	jmp LB_38574
LB_38573:
	bts r12,0
LB_38574:
	call NS_E_33455
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_38575
	btr r12,4
	jmp LB_38576
LB_38575:
	bts r12,4
LB_38576:
	mov r11,r14
	bt r12,1
	jc LB_38577
	btr r12,5
	jmp LB_38578
LB_38577:
	bts r12,5
LB_38578:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38571
	btr r12,3
	clc
	jmp LB_38572
LB_38571:
	bts r12,3
	stc
LB_38572:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38569
	btr r12,2
	clc
	jmp LB_38570
LB_38569:
	bts r12,2
	stc
LB_38570:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38567
	btr r12,1
	clc
	jmp LB_38568
LB_38567:
	bts r12,1
	stc
LB_38568:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38565
	btr r12,0
	clc
	jmp LB_38566
LB_38565:
	bts r12,0
	stc
LB_38566:
	add rsp,40
MTC_LB_38579:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38580
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_38581
	bt QWORD [rdi],0
	jc LB_38582
	btr r12,7
	clc
	jmp LB_38583
LB_38582:
	bts r12,7
	stc
LB_38583:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_38581:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_38584
	btr r12,6
	jmp LB_38585
LB_38584:
	bts r12,6
LB_38585:
LB_38586:
	cmp r15,0
	jz LB_38587
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38586
LB_38587:
; » 0xr0 |~ {  } ⊢ %_38490 : %_38490
 ; {>  %_38478~0':_stg %_38489~6':_stg %_38487~4':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; 	» 0xr0 _ ⊢ 5' : %_38490
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f34559 { %_38489 %_38490 } ⊢ { %_38491 %_38492 %_38493 } : { %_38491 %_38492 %_38493 }
 ; {>  %_38490~5':_r64 %_38478~0':_stg %_38489~6':_stg %_38487~4':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; _f34559 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_38598
	btr r12,0
	jmp LB_38599
LB_38598:
	bts r12,0
LB_38599:
	mov r14,r11
	bt r12,5
	jc LB_38600
	btr r12,1
	jmp LB_38601
LB_38600:
	bts r12,1
LB_38601:
	call NS_E_34559
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_38602
	btr r12,5
	jmp LB_38603
LB_38602:
	bts r12,5
LB_38603:
	mov rcx,r14
	bt r12,1
	jc LB_38604
	btr r12,6
	jmp LB_38605
LB_38604:
	bts r12,6
LB_38605:
	mov rdx,r9
	bt r12,3
	jc LB_38608
	btr r12,7
	jmp LB_38609
LB_38608:
	bts r12,7
LB_38609:
	mov rsi,1
	bt r12,7
	jc LB_38606
	mov rsi,0
	bt rdx,0
	jc LB_38606
	jmp LB_38607
LB_38606:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_38607:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38596
	btr r12,4
	clc
	jmp LB_38597
LB_38596:
	bts r12,4
	stc
LB_38597:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38594
	btr r12,3
	clc
	jmp LB_38595
LB_38594:
	bts r12,3
	stc
LB_38595:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38592
	btr r12,2
	clc
	jmp LB_38593
LB_38592:
	bts r12,2
	stc
LB_38593:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38590
	btr r12,1
	clc
	jmp LB_38591
LB_38590:
	bts r12,1
	stc
LB_38591:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38588
	btr r12,0
	clc
	jmp LB_38589
LB_38588:
	bts r12,0
	stc
LB_38589:
	add rsp,48
MTC_LB_38610:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38611
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rdx
	bt QWORD [rdi],17
	jnc LB_38612
	bt QWORD [rdi],0
	jc LB_38613
	btr r12,9
	clc
	jmp LB_38614
LB_38613:
	bts r12,9
	stc
LB_38614:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_38612:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_38615
	btr r12,8
	jmp LB_38616
LB_38615:
	bts r12,8
LB_38616:
LB_38617:
	cmp r15,0
	jz LB_38618
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38617
LB_38618:
; » 0xr0 |~ {  } ⊢ %_38495 : %_38495
 ; {>  %_38494~8':(_lst)◂(_p30731) %_38478~0':_stg %_38487~4':_stg %_38492~6':_r64 %_38491~5':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; 	» 0xr0 _ ⊢ 7' : %_38495
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f31019 { %_38495 %_38494 } ⊢ { %_38496 %_38497 } : { %_38496 %_38497 }
 ; {>  %_38494~8':(_lst)◂(_p30731) %_38495~7':_r64 %_38478~0':_stg %_38487~4':_stg %_38492~6':_r64 %_38491~5':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; _f31019 { 7' 8' } ⊢ { 7' 8' }
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000110.. |},{ 7' 8' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_38633
	btr r12,0
	jmp LB_38634
LB_38633:
	bts r12,0
LB_38634:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38635
	btr r12,1
	jmp LB_38636
LB_38635:
	bts r12,1
LB_38636:
	call NS_E_31019
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_38637
	btr r12,7
	jmp LB_38638
LB_38637:
	bts r12,7
LB_38638:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_38639
	btr r12,8
	jmp LB_38640
LB_38639:
	bts r12,8
LB_38640:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_38631
	btr r12,6
	clc
	jmp LB_38632
LB_38631:
	bts r12,6
	stc
LB_38632:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_38629
	btr r12,5
	clc
	jmp LB_38630
LB_38629:
	bts r12,5
	stc
LB_38630:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38627
	btr r12,4
	clc
	jmp LB_38628
LB_38627:
	bts r12,4
	stc
LB_38628:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38625
	btr r12,3
	clc
	jmp LB_38626
LB_38625:
	bts r12,3
	stc
LB_38626:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38623
	btr r12,2
	clc
	jmp LB_38624
LB_38623:
	bts r12,2
	stc
LB_38624:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38621
	btr r12,1
	clc
	jmp LB_38622
LB_38621:
	bts r12,1
	stc
LB_38622:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38619
	btr r12,0
	clc
	jmp LB_38620
LB_38619:
	bts r12,0
	stc
LB_38620:
	add rsp,64
; » _^ ..
	xor rax,rax
	add rax,6
	mov rsi,QWORD [st_vct+8*8]
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,4
	mov rdi,rax
	call mlc_s8
	mov QWORD [st_vct+8*9],rax
	btr r12,9
	mov rdi,rax
	add rdi,8
; "START\n"
	mov rsi,0x_53
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_41
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,QWORD [st_vct+8*8]
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "END\n"
	mov rsi,0x_45
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; _f38 %_38499 ⊢ %_38500 : %_38500
 ; {>  %_38478~0':_stg %_38498~8':_stg %_38496~7':_r64 %_38487~4':_stg %_38492~6':_r64 %_38491~5':_stg %_38499~9':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; _f38 9' ⊢ 9'
; push_iv 
	sub rsp,80
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rsp+8+8*8],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000000010.. |},9' ⊢ 0'
	mov r13,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_38659
	btr r12,0
	jmp LB_38660
LB_38659:
	bts r12,0
LB_38660:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_38661
	btr r12,9
	jmp LB_38662
LB_38661:
	bts r12,9
LB_38662:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_38657
	btr r12,8
	clc
	jmp LB_38658
LB_38657:
	bts r12,8
	stc
LB_38658:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_38655
	btr r12,7
	clc
	jmp LB_38656
LB_38655:
	bts r12,7
	stc
LB_38656:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_38653
	btr r12,6
	clc
	jmp LB_38654
LB_38653:
	bts r12,6
	stc
LB_38654:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_38651
	btr r12,5
	clc
	jmp LB_38652
LB_38651:
	bts r12,5
	stc
LB_38652:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38649
	btr r12,4
	clc
	jmp LB_38650
LB_38649:
	bts r12,4
	stc
LB_38650:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38647
	btr r12,3
	clc
	jmp LB_38648
LB_38647:
	bts r12,3
	stc
LB_38648:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38645
	btr r12,2
	clc
	jmp LB_38646
LB_38645:
	bts r12,2
	stc
LB_38646:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38643
	btr r12,1
	clc
	jmp LB_38644
LB_38643:
	bts r12,1
	stc
LB_38644:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38641
	btr r12,0
	clc
	jmp LB_38642
LB_38641:
	bts r12,0
	stc
LB_38642:
	add rsp,80
; ∎ {  }
 ; {>  %_38478~0':_stg %_38498~8':_stg %_38496~7':_r64 %_38487~4':_stg %_38492~6':_r64 %_38491~5':_stg %_38500~9':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_38663
	mov rdi,r13
	call dlt
LB_38663:
	bt r12,8
	jc LB_38664
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_38664:
	bt r12,7
	jc LB_38665
	mov rdi,rdx
	call dlt
LB_38665:
	bt r12,4
	jc LB_38666
	mov rdi,r10
	call dlt
LB_38666:
	bt r12,6
	jc LB_38667
	mov rdi,rcx
	call dlt
LB_38667:
	bt r12,5
	jc LB_38668
	mov rdi,r11
	call dlt
LB_38668:
	bt r12,9
	jc LB_38669
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_38669:
	bt r12,1
	jc LB_38670
	mov rdi,r14
	call dlt
LB_38670:
	bt r12,3
	jc LB_38671
	mov rdi,r9
	call dlt
LB_38671:
	bt r12,2
	jc LB_38672
	mov rdi,r8
	call dlt
LB_38672:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_38611:
	mov r15,0
LB_38674:
	cmp r15,0
	jz LB_38675
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38674
LB_38675:
; 	» "H0\n" _ ⊢ 8' : %_38501
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_38501 ⊢ %_38502 : %_38502
 ; {>  %_38501~8':_stg %_38493~7':(_opn)◂((_lst)◂(_p30731)) %_38478~0':_stg %_38487~4':_stg %_38492~6':_r64 %_38491~5':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; _f38 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38692
	btr r12,0
	jmp LB_38693
LB_38692:
	bts r12,0
LB_38693:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_38694
	btr r12,8
	jmp LB_38695
LB_38694:
	bts r12,8
LB_38695:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_38690
	btr r12,7
	clc
	jmp LB_38691
LB_38690:
	bts r12,7
	stc
LB_38691:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_38688
	btr r12,6
	clc
	jmp LB_38689
LB_38688:
	bts r12,6
	stc
LB_38689:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_38686
	btr r12,5
	clc
	jmp LB_38687
LB_38686:
	bts r12,5
	stc
LB_38687:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38684
	btr r12,4
	clc
	jmp LB_38685
LB_38684:
	bts r12,4
	stc
LB_38685:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38682
	btr r12,3
	clc
	jmp LB_38683
LB_38682:
	bts r12,3
	stc
LB_38683:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38680
	btr r12,2
	clc
	jmp LB_38681
LB_38680:
	bts r12,2
	stc
LB_38681:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38678
	btr r12,1
	clc
	jmp LB_38679
LB_38678:
	bts r12,1
	stc
LB_38679:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38676
	btr r12,0
	clc
	jmp LB_38677
LB_38676:
	bts r12,0
	stc
LB_38677:
	add rsp,72
; ∎ {  }
 ; {>  %_38493~7':(_opn)◂((_lst)◂(_p30731)) %_38478~0':_stg %_38487~4':_stg %_38492~6':_r64 %_38491~5':_stg %_38479~1':_r64 %_38502~8':_stg %_38481~3':_stg %_38485~2':_stg }
; 	∎ {  }
	bt r12,7
	jc LB_38696
	mov rdi,rdx
	call dlt
LB_38696:
	bt r12,0
	jc LB_38697
	mov rdi,r13
	call dlt
LB_38697:
	bt r12,4
	jc LB_38698
	mov rdi,r10
	call dlt
LB_38698:
	bt r12,6
	jc LB_38699
	mov rdi,rcx
	call dlt
LB_38699:
	bt r12,5
	jc LB_38700
	mov rdi,r11
	call dlt
LB_38700:
	bt r12,1
	jc LB_38701
	mov rdi,r14
	call dlt
LB_38701:
	bt r12,8
	jc LB_38702
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_38702:
	bt r12,3
	jc LB_38703
	mov rdi,r9
	call dlt
LB_38703:
	bt r12,2
	jc LB_38704
	mov rdi,r8
	call dlt
LB_38704:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_38673:
MTC_LB_38580:
	mov r15,0
LB_38706:
	cmp r15,0
	jz LB_38707
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38706
LB_38707:
; 	» "H1\n" _ ⊢ 6' : %_38503
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_38503 ⊢ %_38504 : %_38504
 ; {>  %_38488~5':(_opn)◂(_stg) %_38478~0':_stg %_38503~6':_stg %_38487~4':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; _f38 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_38720
	btr r12,0
	jmp LB_38721
LB_38720:
	bts r12,0
LB_38721:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_38722
	btr r12,6
	jmp LB_38723
LB_38722:
	bts r12,6
LB_38723:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_38718
	btr r12,5
	clc
	jmp LB_38719
LB_38718:
	bts r12,5
	stc
LB_38719:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38716
	btr r12,4
	clc
	jmp LB_38717
LB_38716:
	bts r12,4
	stc
LB_38717:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38714
	btr r12,3
	clc
	jmp LB_38715
LB_38714:
	bts r12,3
	stc
LB_38715:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38712
	btr r12,2
	clc
	jmp LB_38713
LB_38712:
	bts r12,2
	stc
LB_38713:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38710
	btr r12,1
	clc
	jmp LB_38711
LB_38710:
	bts r12,1
	stc
LB_38711:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38708
	btr r12,0
	clc
	jmp LB_38709
LB_38708:
	bts r12,0
	stc
LB_38709:
	add rsp,56
; ∎ {  }
 ; {>  %_38488~5':(_opn)◂(_stg) %_38478~0':_stg %_38504~6':_stg %_38487~4':_stg %_38479~1':_r64 %_38481~3':_stg %_38485~2':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_38724
	mov rdi,r11
	call dlt
LB_38724:
	bt r12,0
	jc LB_38725
	mov rdi,r13
	call dlt
LB_38725:
	bt r12,6
	jc LB_38726
	mov rdi,rcx
	call dlt
LB_38726:
	bt r12,4
	jc LB_38727
	mov rdi,r10
	call dlt
LB_38727:
	bt r12,1
	jc LB_38728
	mov rdi,r14
	call dlt
LB_38728:
	bt r12,3
	jc LB_38729
	mov rdi,r9
	call dlt
LB_38729:
	bt r12,2
	jc LB_38730
	mov rdi,r8
	call dlt
LB_38730:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_38705:
MTC_LB_38525:
	mov r15,0
LB_38732:
	cmp r15,0
	jz LB_38733
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38732
LB_38733:
; _f34559 { %_38478 %_38479 } ⊢ { %_38505 %_38506 %_38507 } : { %_38505 %_38506 %_38507 }
 ; {>  %_38478~0':_stg %_38479~1':_r64 %_38480~2':(_lst)◂(_stg) }
; _f34559 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_34559
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_38736
	btr r12,4
	jmp LB_38737
LB_38736:
	bts r12,4
LB_38737:
	mov r9,r10
	bt r12,4
	jc LB_38740
	btr r12,3
	jmp LB_38741
LB_38740:
	bts r12,3
LB_38741:
	mov rsi,1
	bt r12,3
	jc LB_38738
	mov rsi,0
	bt r9,0
	jc LB_38738
	jmp LB_38739
LB_38738:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_38739:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_38734
	btr r12,2
	clc
	jmp LB_38735
LB_38734:
	bts r12,2
	stc
LB_38735:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_38508
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_38508 ⊢ { %_38509 %_38510 } : { %_38509 %_38510 }
 ; {>  %_38508~4':_stg %_38506~1':_r64 %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) }
; _f37 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_38750
	btr r12,0
	jmp LB_38751
LB_38750:
	bts r12,0
LB_38751:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_38752
	btr r12,4
	jmp LB_38753
LB_38752:
	bts r12,4
LB_38753:
	mov r11,r14
	bt r12,1
	jc LB_38754
	btr r12,5
	jmp LB_38755
LB_38754:
	bts r12,5
LB_38755:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38748
	btr r12,3
	clc
	jmp LB_38749
LB_38748:
	bts r12,3
	stc
LB_38749:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38746
	btr r12,2
	clc
	jmp LB_38747
LB_38746:
	bts r12,2
	stc
LB_38747:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38744
	btr r12,1
	clc
	jmp LB_38745
LB_38744:
	bts r12,1
	stc
LB_38745:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38742
	btr r12,0
	clc
	jmp LB_38743
LB_38742:
	bts r12,0
	stc
LB_38743:
	add rsp,40
; _f38 { %_38509 %_38510 } ⊢ { %_38511 %_38512 } : { %_38511 %_38512 }
 ; {>  %_38510~5':_stg %_38506~1':_r64 %_38509~4':_stg %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) }
; _f38 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_38766
	btr r12,1
	jmp LB_38767
LB_38766:
	bts r12,1
LB_38767:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_38764
	btr QWORD [rdi],0
	jmp LB_38765
LB_38764:
	bts QWORD [rdi],0
LB_38765:
	mov r14,r11
	bt r12,5
	jc LB_38770
	btr r12,1
	jmp LB_38771
LB_38770:
	bts r12,1
LB_38771:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_38768
	btr QWORD [rdi],1
	jmp LB_38769
LB_38768:
	bts QWORD [rdi],1
LB_38769:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_38774
	btr r12,1
	clc
	jmp LB_38775
LB_38774:
	bts r12,1
	stc
LB_38775:
	mov r10,r14
	bt r12,1
	jc LB_38772
	btr r12,4
	jmp LB_38773
LB_38772:
	bts r12,4
LB_38773:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_38778
	btr r12,1
	clc
	jmp LB_38779
LB_38778:
	bts r12,1
	stc
LB_38779:
	mov r11,r14
	bt r12,1
	jc LB_38776
	btr r12,5
	jmp LB_38777
LB_38776:
	bts r12,5
LB_38777:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38762
	btr r12,3
	clc
	jmp LB_38763
LB_38762:
	bts r12,3
	stc
LB_38763:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38760
	btr r12,2
	clc
	jmp LB_38761
LB_38760:
	bts r12,2
	stc
LB_38761:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38758
	btr r12,1
	clc
	jmp LB_38759
LB_38758:
	bts r12,1
	stc
LB_38759:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38756
	btr r12,0
	clc
	jmp LB_38757
LB_38756:
	bts r12,0
	stc
LB_38757:
	add rsp,40
; _f33455 %_38512 ⊢ { %_38513 %_38514 } : { %_38513 %_38514 }
 ; {>  %_38506~1':_r64 %_38511~4':_stg %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38512~5':_stg %_38505~0':_stg %_38480~2':(_lst)◂(_stg) }
; _f33455 5' ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_38790
	btr r12,0
	jmp LB_38791
LB_38790:
	bts r12,0
LB_38791:
	call NS_E_33455
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_38792
	btr r12,5
	jmp LB_38793
LB_38792:
	bts r12,5
LB_38793:
	mov rcx,r14
	bt r12,1
	jc LB_38794
	btr r12,6
	jmp LB_38795
LB_38794:
	bts r12,6
LB_38795:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38788
	btr r12,4
	clc
	jmp LB_38789
LB_38788:
	bts r12,4
	stc
LB_38789:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38786
	btr r12,3
	clc
	jmp LB_38787
LB_38786:
	bts r12,3
	stc
LB_38787:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38784
	btr r12,2
	clc
	jmp LB_38785
LB_38784:
	bts r12,2
	stc
LB_38785:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38782
	btr r12,1
	clc
	jmp LB_38783
LB_38782:
	bts r12,1
	stc
LB_38783:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38780
	btr r12,0
	clc
	jmp LB_38781
LB_38780:
	bts r12,0
	stc
LB_38781:
	add rsp,48
MTC_LB_38796:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_38797
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_38798
	bt QWORD [rdi],0
	jc LB_38799
	btr r12,8
	clc
	jmp LB_38800
LB_38799:
	bts r12,8
	stc
LB_38800:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_38798:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38801
	btr r12,7
	jmp LB_38802
LB_38801:
	bts r12,7
LB_38802:
LB_38803:
	cmp r15,0
	jz LB_38804
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38803
LB_38804:
; » 0xr0 |~ {  } ⊢ %_38516 : %_38516
 ; {>  %_38506~1':_r64 %_38511~4':_stg %_38513~5':_stg %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) %_38515~7':_stg }
; 	» 0xr0 _ ⊢ 6' : %_38516
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f34559 { %_38515 %_38516 } ⊢ { %_38517 %_38518 %_38519 } : { %_38517 %_38518 %_38519 }
 ; {>  %_38506~1':_r64 %_38511~4':_stg %_38516~6':_r64 %_38513~5':_stg %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) %_38515~7':_stg }
; _f34559 { 7' 6' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000000110.. |},{ 7' 6' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_38817
	btr r12,0
	jmp LB_38818
LB_38817:
	bts r12,0
LB_38818:
	mov r14,rcx
	bt r12,6
	jc LB_38819
	btr r12,1
	jmp LB_38820
LB_38819:
	bts r12,1
LB_38820:
	call NS_E_34559
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_38821
	btr r12,6
	jmp LB_38822
LB_38821:
	bts r12,6
LB_38822:
	mov rdx,r14
	bt r12,1
	jc LB_38823
	btr r12,7
	jmp LB_38824
LB_38823:
	bts r12,7
LB_38824:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_38827
	btr r12,8
	jmp LB_38828
LB_38827:
	bts r12,8
LB_38828:
	mov rsi,1
	bt r12,8
	jc LB_38825
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_38825
	jmp LB_38826
LB_38825:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_38826:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_38815
	btr r12,5
	clc
	jmp LB_38816
LB_38815:
	bts r12,5
	stc
LB_38816:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38813
	btr r12,4
	clc
	jmp LB_38814
LB_38813:
	bts r12,4
	stc
LB_38814:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38811
	btr r12,3
	clc
	jmp LB_38812
LB_38811:
	bts r12,3
	stc
LB_38812:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38809
	btr r12,2
	clc
	jmp LB_38810
LB_38809:
	bts r12,2
	stc
LB_38810:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38807
	btr r12,1
	clc
	jmp LB_38808
LB_38807:
	bts r12,1
	stc
LB_38808:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38805
	btr r12,0
	clc
	jmp LB_38806
LB_38805:
	bts r12,0
	stc
LB_38806:
	add rsp,56
; _f38 { %_38517 %_38518 %_38519 } ⊢ { %_38520 %_38521 %_38522 } : { %_38520 %_38521 %_38522 }
 ; {>  %_38519~8':(_opn)◂((_lst)◂(_p30731)) %_38506~1':_r64 %_38517~6':_stg %_38511~4':_stg %_38513~5':_stg %_38518~7':_r64 %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) }
; _f38 { 6' 7' 8' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000001110.. |},{ 6' 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_38843
	btr r12,1
	jmp LB_38844
LB_38843:
	bts r12,1
LB_38844:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_38841
	btr QWORD [rdi],0
	jmp LB_38842
LB_38841:
	bts QWORD [rdi],0
LB_38842:
	mov r14,rdx
	bt r12,7
	jc LB_38847
	btr r12,1
	jmp LB_38848
LB_38847:
	bts r12,1
LB_38848:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_38845
	btr QWORD [rdi],1
	jmp LB_38846
LB_38845:
	bts QWORD [rdi],1
LB_38846:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_38851
	btr r12,1
	jmp LB_38852
LB_38851:
	bts r12,1
LB_38852:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,1
	jc LB_38849
	btr QWORD [rdi],2
	jmp LB_38850
LB_38849:
	bts QWORD [rdi],2
LB_38850:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_38855
	btr r12,1
	clc
	jmp LB_38856
LB_38855:
	bts r12,1
	stc
LB_38856:
	mov rcx,r14
	bt r12,1
	jc LB_38853
	btr r12,6
	jmp LB_38854
LB_38853:
	bts r12,6
LB_38854:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_38859
	btr r12,1
	clc
	jmp LB_38860
LB_38859:
	bts r12,1
	stc
LB_38860:
	mov rdx,r14
	bt r12,1
	jc LB_38857
	btr r12,7
	jmp LB_38858
LB_38857:
	bts r12,7
LB_38858:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_38863
	btr r12,1
	clc
	jmp LB_38864
LB_38863:
	bts r12,1
	stc
LB_38864:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_38861
	btr r12,8
	jmp LB_38862
LB_38861:
	bts r12,8
LB_38862:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_38839
	btr r12,5
	clc
	jmp LB_38840
LB_38839:
	bts r12,5
	stc
LB_38840:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_38837
	btr r12,4
	clc
	jmp LB_38838
LB_38837:
	bts r12,4
	stc
LB_38838:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_38835
	btr r12,3
	clc
	jmp LB_38836
LB_38835:
	bts r12,3
	stc
LB_38836:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_38833
	btr r12,2
	clc
	jmp LB_38834
LB_38833:
	bts r12,2
	stc
LB_38834:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_38831
	btr r12,1
	clc
	jmp LB_38832
LB_38831:
	bts r12,1
	stc
LB_38832:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_38829
	btr r12,0
	clc
	jmp LB_38830
LB_38829:
	bts r12,0
	stc
LB_38830:
	add rsp,56
; ∎ {  }
 ; {>  %_38506~1':_r64 %_38511~4':_stg %_38522~8':(_opn)◂((_lst)◂(_p30731)) %_38521~7':_r64 %_38513~5':_stg %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) %_38520~6':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_38865
	mov rdi,r14
	call dlt
LB_38865:
	bt r12,4
	jc LB_38866
	mov rdi,r10
	call dlt
LB_38866:
	bt r12,8
	jc LB_38867
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_38867:
	bt r12,7
	jc LB_38868
	mov rdi,rdx
	call dlt
LB_38868:
	bt r12,5
	jc LB_38869
	mov rdi,r11
	call dlt
LB_38869:
	bt r12,3
	jc LB_38870
	mov rdi,r9
	call dlt
LB_38870:
	bt r12,0
	jc LB_38871
	mov rdi,r13
	call dlt
LB_38871:
	bt r12,2
	jc LB_38872
	mov rdi,r8
	call dlt
LB_38872:
	bt r12,6
	jc LB_38873
	mov rdi,rcx
	call dlt
LB_38873:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_38797:
	mov r15,0
LB_38875:
	cmp r15,0
	jz LB_38876
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_38875
LB_38876:
; ∎ {  }
 ; {>  %_38506~1':_r64 %_38511~4':_stg %_38513~5':_stg %_38507~3':(_opn)◂((_lst)◂(_p30731)) %_38505~0':_stg %_38480~2':(_lst)◂(_stg) %_38514~6':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,1
	jc LB_38877
	mov rdi,r14
	call dlt
LB_38877:
	bt r12,4
	jc LB_38878
	mov rdi,r10
	call dlt
LB_38878:
	bt r12,5
	jc LB_38879
	mov rdi,r11
	call dlt
LB_38879:
	bt r12,3
	jc LB_38880
	mov rdi,r9
	call dlt
LB_38880:
	bt r12,0
	jc LB_38881
	mov rdi,r13
	call dlt
LB_38881:
	bt r12,2
	jc LB_38882
	mov rdi,r8
	call dlt
LB_38882:
	bt r12,6
	jc LB_38883
	mov rdi,rcx
	call dlt
LB_38883:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_38874:
MTC_LB_38731:
section .data
	CST_DYN_38523:
		dq 0x0000_0001_00_82_ffff
		dq 1
