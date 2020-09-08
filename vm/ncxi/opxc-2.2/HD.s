%define SS_RCD_2_MAX_P (1<<25)
%define SS_RCD_3_MAX_P (1<<23)
%define SS_RCD_4_MAX_P (1<<22)
%define SS_RCD_5_MAX_P (1<<20)
%define SS_RCD_6_MAX_P (1<<18)
%define SS_RCD_7_MAX_P (1<<18)
%define SS_RCD_8_MAX_P (1<<17)

%define KB 1024
%define MB KB*KB 
%define GB MB*MB
%define SIG_INT 2
%define SIG_SEGV 11
%define SS_MAX 4000
%define SS_LN_MAX 1<<4
%define SS_LN_REG r15
%define MCR_REG rbx
%define SRC_REG r13 
%define DST_REG r14
;%define SS_LN_N r12

%define GLX(n) QWORD [GLV+8*n]
%define GLX_S(s,n) QWORD [GLV+s+8*n]
%define SX(n) QWORD [SRC_REG+8*n]
%define DX(n) QWORD [DST_REG+8*n]

bits 64 
%define SS_LN_N QWORD [SS_LN_N_PT]
; macros 
%macro BC 1
	mov rsi,BC_PT ; BC_PT is static address
	;mov rsi,rsp ; rsp is dynamic address
	mov MCR_REG,0xff00ff00ff
  cmov%1 rsi,MCR_REG
  mov rsi,QWORD [rsi]
%endmacro 
%macro RT_ERR 1 
	mov rdi,rt_err0 
	call emt_stg 
	mov QWORD [err_n],%1 
	jmp err 
%endmacro

%macro C_PUSH_REGS 0 
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
%endmacro

%macro C_POP_REGS 0 
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop rcx 
	pop rdx 
%endmacro

%macro CALL_SF 1 
	C_PUSH_REGS 
	call %1 
	C_POP_REGS
%endmacro

%macro C_CALL_SF 1 
	C_PUSH_REGS
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,QWORD [rsp_tmp]
	C_POP_REGS
%endmacro 

%macro C_CALL 1 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,QWORD [rsp_tmp]
%endmacro 

%macro JZ_SPC 2
	movzx MCR_REG,%1
	cmp MCR_REG,9 
	jz %2
	cmp MCR_REG,10 
	jz %2
	cmp MCR_REG,32 
	jz %2
%endmacro
 
%macro JZ_LINE_SPC 2
	movzx MCR_REG,%1 
	cmp MCR_REG,9 
	jz %2
	cmp MCR_REG,32 
	jz %2
%endmacro
 
%macro ALC_RCD 2 ; n,reg-name!=rbx 
	add QWORD [SS_RCD_C+8*%1],1
	add QWORD [SS_RCD_N+8*%1],1 
	mov %2,[SS_RCD_%1_TOP]
	mov MCR_REG,[%2]
	mov QWORD [SS_RCD_%1_TOP],MCR_REG
%endmacro 

%macro FREE_RCD 2 ; n,reg-name!=rbx 
	sub QWORD [SS_RCD_N+8*%1],1
	mov rbx,QWORD [SS_RCD_%1_TOP] 
	mov QWORD [%2],rbx
	mov QWORD [SS_RCD_%1_TOP],%2
%endmacro

%macro FREE_PT 1 
	mov rbx,[SS_PT_TOP]
	mov QWORD [%1],rbx
	mov [SS_PT_TOP],%1
%endmacro

%macro ALC_PT 1 
	mov %1,[SS_PT_TOP] 
	mov rbx,[%1]
	mov QWORD [SS_PT_TOP],rbx 
%endmacro
				
%macro FREE_LN 1 
	sub SS_LN_N,1 
	mov QWORD [%1],SS_LN_REG
	mov SS_LN_REG,%1
%endmacro

%macro ALC_LN 1 
	add QWORD [SS_LN_C],1 
	add SS_LN_N,1 
	mov %1,SS_LN_REG 
	mov SS_LN_REG,QWORD [SS_LN_REG]
%endmacro

%macro FREE_S8 1 
 mov rbx,0x0000_ffff_ffff_ffff 
	and rbx,QWORD [%1]
	sub QWORD [S8_N],rbx
	mov rdi,%1
	call free_s8
%endmacro 
				
%macro EMT_R64 1 
	cmp r10,3940 
	jg 
	mov rdx,%1
	mov rdi,QWORD [GD_BUF_IT] 
	mov BYTE [rdi+128],0
	mov rsi,fmt_r64 
 xor rax,rax
	C_CALL_SF sprintf 
	add QWORD [GD_BUF_IT],rax
%endmacro


%macro EMT_CST 2 ; %1=label,%2=len
	mov rdi,%1 
	mov rax,%2 
	call emt_cst 
%endmacro

%macro EMT_FLSH 0 
 xor rax,rax
	mov rdi,QWORD [GD_BUF_PT] 
	mov rbx,rdi
	C_CALL_SF printf 
	mov QWORD [GD_BUF_N],0
	mov QWORD [rbx],0
%endmacro

%macro GET_LEN 2 
	mov %1,0x0000_ffff_ffff_ffff
	and %1,QWORD [%2]
%endmacro

%macro MOV_RAX 2 
	mov rax,%2 
	mov %1,rax
	%endmacro

%macro MOV_RDI 2 
	mov rdi,%2 
	mov %1,rdi
%endmacro

%macro MOV_RBX 2 
	mov rbx,%2
	mov %1,rbx
%endmacro

%macro scf_F 1 
	push rdi
	movzx rdi,BYTE [rdi]
	xor rax,rax 
	C_CALL isspace
	cmp rax,0
	jnz scf_F_err0_%1 
	jmp scf_F_scf_%1 
scf_F_err0_%1: 
	add rsp,8
	mov rax,0
	ret
	scf_F_scf_%1:
	mov rdi,QWORD [rsp]
	sub rsp,8
	mov rsi,rsp
	mov rdx,%1
	mov rax,0
	C_CALL strtoul
	pop rsi
	pop rdi
	sub rsi,rdi
	jz scf_F_err1_%1
	mov rdi,rax
	mov rax,1 
	ret
scf_F_err1_%1:
	mov rax,0 
	ret
%endmacro

%macro BSS_SS_RCD 2 
	SS_RCD_%1_TOP: resq 1 
	SS_RCD_%1_VCT: resq (%1+1)*(%2+4)
	SS_RCD_%1_BTM: resq 1
%endmacro 

%define RX0 r13
%define RX1 r14
%define RX2 r8
%define RX3 r9 
%define RX4 r10 
%define RX5 r11 
%define RX6 rcx 
%define RX7 rdx

%define SEED 0x_f7f7_65d7_9dab_bace
 
extern MurmurHash64A
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern free 
extern isspace 
extern strtoul
extern strlen
extern getchar
extern system
extern set_handler
extern emt_s8_to
extern alc_gd_buf
extern set_usr_hdl