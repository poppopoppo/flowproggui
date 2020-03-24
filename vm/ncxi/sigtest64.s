bits 64
%define stdout 1
%define SYS_SIGNAL 48
%define SIGINT 2
%define SIGSEGV 11

extern printf 
extern sleep
extern set_handler 
section .text
global _start
exit:
    mov rax, 60
    mov rdi, 0
    syscall
catch:
    ;mov eax, 1
    ;mov rdi, stdout
    ;lea rsi, [message]
    ;mov rdx, 15
    ;syscall
    ;jmp exit
    mov rsi,rax
    xor rax,rax 
    mov rdi,message 
    call printf 
    jmp exit
catch2:
    mov rsi,4 
    xor rax,rax 
    mov rdi,message 
    call printf 
    jmp exit
_start:
    ; jmp catch
    ;mov rax, SYS_SIGNAL
    ;mov rbx, SIGINT
    ;mov rcx, catch
    ;syscall
    mov rdi,SIGINT 
    mov rsi,catch 
    call set_handler
    mov rdi,SIGSEGV 
    mov rsi,catch2 
    call set_handler
lp:
    mov rdi,4 
    call sleep 
    mov rdi,[0]
    add rax,1
    jmp lp

section .data
    message: db "%d,Signal caught!", 10,0

