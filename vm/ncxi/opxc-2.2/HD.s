
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
%define MCR_REG rbx
%define SRC_REG r13 
%define DST_REG r14

%define GLX(n) QWORD [(GLV+8*n)] 
%define SX(n) QWORD [SRC_REG+(8*n)]
%define DX(n) QWORD [DST_REG+(8*n)]

bits 64 
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
%macro DIV10 0 ; rax ⊢ rax
	mov MCR_REG,0xcccc_cccc_cccc_cccd 
  mul MCR_REG 
  mov rax,rdx 
  shr rax,3
%endmacro
%macro DIV_MOD10 0 ; rax ⊢ rax,rdi 
	mov rdi,rax 
	mov MCR_REG,0xcccc_cccc_cccc_cccd 
	mul MCR_REG 
	mov rax,rdx 
	shr rax,3
	mov rsi,rax  
	add rsi,rsi ; *2
	lea rsi,[rsi+4*rsi] 
	sub rdi,rsi 
%endmacro

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
	;jmp LB_%1_0 
	;mov rax,0 
	;mov rsi,1 
	;lock cmpxchg QWORD [FTX0],rsi
	;jnz LB_%1_0 
	;mov QWORD [BUF0],rdi
	;cmp QWORD [FLG1],0 
	;jnz LB_%1_1 
	;mov rax,SYS_futex 
	;mov rdi,FTX0 
	;mov rsi,FUTEX_WAKE 
	;mov rdx,1 
	;mov r10,0
	;syscall
	;cmp rax,-1  
	;jz err
	;jmp LB_%1_1
;LB_%1_0:
	;cmp rax,0 
	;mov QWORD [err_n],0xffac
	;jz err
	bt QWORD [rdi],63 
	jc LB_%1_1
	C_CALL_SF free 
	jmp LB_%1_2
LB_%1_1:
	mov QWORD [rdi],rdi
LB_%1_2:
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

%macro EMT_CST 2 ; %1=label,%2=len
	mov rdi,%1 
	mov rax,%2 
	call emt_cst 
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
extern ini_prc 
extern MurmurHash64A
extern exit 
extern printf 
extern malloc 
extern calloc
extern realloc
extern free 
extern strtoul
extern strlen
extern getchar
extern system
extern set_handler
extern emt_s8_to
extern alc_gd_buf
extern set_usr_hdl