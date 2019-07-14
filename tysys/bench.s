	.file ""
	.section .rodata.cst8,"a",@progbits
	.align	16
caml_negf_mask:
	.quad	0x8000000000000000
	.quad	0
	.align	16
caml_absf_mask:
	.quad	0x7fffffffffffffff
	.quad	-1
	.data
	.globl	camlBench__data_begin
camlBench__data_begin:
	.text
	.globl	camlBench__code_begin
camlBench__code_begin:
	.data
	.quad	1792
	.globl	camlBench
camlBench:
	.quad	1
	.data
	.globl	camlBench__gc_roots
camlBench__gc_roots:
	.quad	camlBench
	.quad	0
	.text
	.align	16
	.globl	camlBench__tak_1204
camlBench__tak_1204:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L105:
	movq	%rax, %rsi
	movq	%rbx, %rdx
	movq	%rdi, %rax
	cmpq	%rdx, %rsi
	jg	.L104
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L104:
	movq	%rax, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rsi, (%rsp)
	addq	$-2, %rax
	movq	%rsi, %rbx
	movq	%rdx, %rdi
	call	camlBench__tak_1204@PLT
.L100:
	movq	%rax, 32(%rsp)
	movq	8(%rsp), %rax
	addq	$-2, %rax
	movq	16(%rsp), %rbx
	movq	(%rsp), %rdi
	call	camlBench__tak_1204@PLT
.L101:
	movq	%rax, 24(%rsp)
	movq	(%rsp), %rax
	addq	$-2, %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	call	camlBench__tak_1204@PLT
.L102:
	movq	24(%rsp), %rbx
	movq	32(%rsp), %rdi
	jmp	.L105
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlBench__tak_1204,@function
	.size camlBench__tak_1204,. - camlBench__tak_1204
	.data
	.quad	4087
camlBench__1:
	.quad	caml_curry3
	.quad	7
	.quad	camlBench__tak_1204
	.text
	.align	16
	.globl	camlBench__entry
camlBench__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L107:
	movq	camlBench__1@GOTPCREL(%rip), %rax
	movq	camlBench@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movq	$1, %rdi
	movq	$23, %rbx
	movq	$45, %rax
	call	camlBench__tak_1204@PLT
.L106:
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlBench__entry,@function
	.size camlBench__entry,. - camlBench__entry
	.data
	.text
	.globl	camlBench__code_end
camlBench__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.globl	camlBench__data_end
camlBench__data_end:
	.long	0
	.globl	camlBench__frametable
camlBench__frametable:
	.quad	4
	.quad	.L106
	.word	17
	.word	0
	.align	8
	.quad	.L108
	.quad	.L102
	.word	49
	.word	2
	.word	24
	.word	32
	.align	8
	.quad	.L109
	.quad	.L101
	.word	49
	.word	4
	.word	0
	.word	8
	.word	16
	.word	32
	.align	8
	.quad	.L110
	.quad	.L100
	.word	49
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L111
	.align	8
.L108:
	.long	(.L112 - .) + 805306368
	.long	61456
	.quad	0
	.align	8
.L110:
	.long	(.L112 - .) + -1409286144
	.long	16800
	.quad	0
	.align	8
.L109:
	.long	(.L112 - .) + 1677721600
	.long	16512
	.quad	0
	.align	8
.L111:
	.long	(.L112 - .) + -201326592
	.long	17088
	.quad	0
.L112:
	.ascii	"bench.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits
