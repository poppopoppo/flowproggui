
;; futex 
%define FUTEX_WAIT		0
%define FUTEX_WAKE		1
%define FUTEX_FD		2
%define FUTEX_REQUEUE		3
%define FUTEX_CMP_REQUEUE	4
%define FUTEX_WAKE_OP		5
%define FUTEX_LOCK_PI		6
%define FUTEX_UNLOCK_PI		7
%define FUTEX_TRYLOCK_PI	8
%define FUTEX_WAIT_BITSET	9
%define FUTEX_WAKE_BITSET	10
%define FUTEX_WAIT_REQUEUE_PI	11
%define FUTEX_CMP_REQUEUE_PI	12

;; sys/syscall.h
%define SYS_write	1
%define SYS_mmap	9
%define SYS_clone	56
%define SYS_exit	60
%define SYS_futex 202
;; unistd.h
%define STDIN		0
%define STDOUT		1
%define STDERR		2

;; sched.h
%define CLONE_VM	0x00000100
%define CLONE_FS	0x00000200
%define CLONE_FILES	0x00000400
%define CLONE_SIGHAND	0x00000800
%define CLONE_PARENT	0x00008000
%define CLONE_THREAD	0x00010000
%define CLONE_IO	0x80000000

;; sys/mman.h
%define MAP_GROWSDOWN	0x0100
%define MAP_ANONYMOUS	0x0020
%define MAP_PRIVATE	0x0002
%define PROT_READ	0x1
%define PROT_WRITE	0x2
%define PROT_EXEC	0x4

%define THREAD_FLAGS \
 CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_PARENT|CLONE_THREAD|CLONE_IO

%define STACK_SIZE	(4096 * 1024)

;%define MAX_LINES	1000000	; number of output lines before exiting


%define KB 1024
%define MB KB*KB 
%define GB MB*MB
%define SIG_INT 2
%define SIG_SEGV 11
%define SS_MAX 4000
;%define SS_LN_MAX 1<<4
;%define SS_LN_REG r15
%define MCR_REG rbx
%define SRC_REG r13 
%define DST_REG r14
;%define SS_LN_N r12

;%define GLX(n) QWORD [GLV+8*n]
%define GLX(n) QWORD [(GLV+8*n)] 
%define SX(n) QWORD [SRC_REG+8*n]
%define DX(n) QWORD [DST_REG+8*n]

bits 64 
;%define SS_LN_N QWORD [SS_LN_N_PT]
; macros 
%macro BC 2
	mov %2,BC_PT ; BC_PT is static address
	;mov rsi,rsp ; rsp is dynamic address
	mov MCR_REG,0xff00ff00ff
  cmov%1 %2,MCR_REG
	mov %2,QWORD [%2]
%endmacro 
;%macro BC 1
;	mov rsi,BC_PT ; BC_PT is static address
	;mov rsi,rsp ; rsp is dynamic address
;	mov MCR_REG,0xff00ff00ff
 ; cmov%1 rsi,MCR_REG
  ;mov rsi,QWORD [rsi]
;%endmacro 

%macro RT_ERR 1 
	mov rdi,rt_err0 
	call emt_stg 
	mov QWORD [err_n],%1 
	jmp err 
%endmacro
%macro FREE_S8 1
	mov rdi,%1 
	C_CALL_SF free 
%endmacro
%macro FREE_OPQ 1
	;mov rax,0 
	lock cmpxchg QWORD [FTX0],rdi
	jnz LB_%1_0 
	;jmp LB_%1_0
	;cmp rax,0 
	;mov QWORD [err_n],0xffab
	;jnz err
	cmp QWORD [FLG1],0 
	jnz LB_%1_1 
	mov rax,SYS_futex 
	mov rdi,FTX0 
	mov rsi,FUTEX_WAKE 
	mov rdx,1 
	mov r10,0
	syscall
	cmp rax,-1 
	jz err
	jmp LB_%1_1
LB_%1_0:
	;cmp rax,0 
	;mov QWORD [err_n],0xffac
	;jz err
	C_CALL_SF free 
LB_%1_1:
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

%macro CALLOC_SF 0
	C_CALL_SF calloc 
	cmp rax,0 
	jz err
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
	;add QWORD [(SS_RCD_N+8*%1)],1 
	mov QWORD [SIG_ETR],sig_alc_rcd_%1 
	mov MCR_REG,QWORD [(SS_RCD_TOP+8*%1)]
	mov %2,QWORD [MCR_REG]
	mov QWORD [(SS_RCD_TOP+8*%1)],%2
	mov %2,MCR_REG
	mov QWORD [SIG_ETR],sig_dft
%endmacro 

%macro FREE_RCD 2 ; n,reg-name!=rbx 
	;sub QWORD [(SS_RCD_N+8*%1)],1
	mov rbx,QWORD [(SS_RCD_TOP+8*%1)] 
	mov QWORD [%2],rbx
	mov QWORD [(SS_RCD_TOP+8*%1)],%2
%endmacro

%macro INIT_SS_RCD 1 
init_ss_rcd_%1:
	mov QWORD [(SS_RCD_N+8*%1)],0
	mov QWORD [(SS_RCD_C+8*%1)],0
	mov QWORD [(SS_RCD_TOP+8*%1)],SS_RCD_3_VCT
	mov rax,SS_RCD_%1_VCT
	mov rdi,(1<<6)
	mov rdx,3
	call ss_lp 
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
	SS_RCD_%1_VCT: resq (%1+1)*(%2+4)
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
 
extern futex
extern calloc_sf
extern ini_prc 
extern MurmurHash64A
extern exit 
extern printf 
extern sprintf
extern malloc 
extern calloc
extern realloc
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