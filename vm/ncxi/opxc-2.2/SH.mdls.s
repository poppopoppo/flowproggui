%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 129
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
					
LB_1: db 34,102,111,111,111,111,33,33,33,34,0,0,0,0,0,0,0,0,0
LB_2: db 32,58,32,95,115,56,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_3: db 59,32,226,136,142,124,10,101,120,110,32,52,49,51,54,48,52,58,10,0,0,0,0,0,0,0,0,0
section .text
	unt_1: dq (1<<48)
	unt_2: dq (2<<48)
	unt_3: dq (3<<48)
	unt_4: dq (4<<48)
	unt_5: dq (5<<48)
	unt_6: dq (6<<48)
	unt_7: dq (7<<48)
	unt_8: dq (8<<48)
	unt_9: dq (9<<48)
	unt_10: dq (10<<48)
	unt_11: dq (11<<48)
	unt_12: dq (12<<48)

global _start
	 
_start:
%include "START.s"
	jmp RTM_0
LB_0: ;; #1286◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ - : (_arr◂_s8◂→q(0))
JMP_0:
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST LB_1,10
	EMT_CST fmt_nl,4
	EMT_CST LB_2,10
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,LB_3
	call emt_stg 
	add rsp,8
	pop rdi
	jmp rdi
RTM_0:
	push EXH_4
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	C_CALL exit
EXH_4:
	add rsp,8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,10
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,11
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,12
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,13
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,14
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,15
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,16
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,17
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,18
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,19
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,20
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,21
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,22
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,23
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,24
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,25
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,26
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,27
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,28
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,29
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,30
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,31
	jmp sig_alc_rcd

%include "TEXT.s"
