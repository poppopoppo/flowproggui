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
NS_E_133:
NS_E_RDI_133:
NS_E_133_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_134
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_134:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_136:
NS_E_RDI_136:
NS_E_136_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_136_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_136_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_137:
NS_E_RDI_137:
NS_E_137_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_137_LB_0
	cmp r11,57
	ja NS_E_137_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_137_LB_0:
	mov rax,0
	ret
NS_E_139:
NS_E_RDI_139:
NS_E_139_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_139_LB_0
	cmp r11,122
	ja NS_E_139_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_139_LB_0:
	mov rax,0
	ret
NS_E_138:
NS_E_RDI_138:
NS_E_138_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_138_LB_0
	cmp r11,90
	ja NS_E_138_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_138_LB_0:
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
	jc LB_145
	bt QWORD [rdi],17
	jnc LB_145
	bt QWORD [rdi],0
	jc LB_147
	btr r12,2
	clc
	jmp LB_148
LB_147:
	bts r12,2
	stc
LB_148:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_146
LB_145:
	btr r12,2
	clc
	call dcp
LB_146:
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
	jc LB_141
	bt QWORD [rdi],17
	jnc LB_141
	bt QWORD [rdi],0
	jc LB_143
	btr r12,2
	clc
	jmp LB_144
LB_143:
	bts r12,2
	stc
LB_144:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_142
LB_141:
	btr r12,2
	clc
	call dcp
LB_142:
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
	jc LB_140
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_140:
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
NS_E_135:
NS_E_RDI_135:
NS_E_135_ETR_TBL:
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
	jz NS_E_135_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_135_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
section .data
