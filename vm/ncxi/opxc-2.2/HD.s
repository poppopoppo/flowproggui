bits 64 ;64bitモードのプログラムであることを指定

;; futex 

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
%define SRC_REG rbp 
%define DST_REG rbp

bits 64
; macros

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
	push rbx
	mov rbx,rsp 
	and rsp,~0xf 
	call %1 
	mov rsp,rbx 
	pop rbx
	C_POP_REGS
%endmacro 

%macro C_CALL 1 
	push rbx 
	mov rbx,rsp
	and rsp,~0xf 
	call %1 
	mov rsp,rbx
	pop rbx
%endmacro 

%define SEED 0x_f7f7_65d7_9dab_bace

extern stdout 
extern stdin
extern futex
extern ini_prc 
extern exit 
extern printf 
extern fwrite
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
extern fw
