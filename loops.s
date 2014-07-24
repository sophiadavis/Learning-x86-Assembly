	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	# .align	4, 0x90
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$0, %eax
loop_branch:
	cmpl    $10, %eax
	jne     add_one
	jmp finish_branch
add_one:
    addl    $1, %eax
    jmp loop_branch
finish_branch: 
	popq	%rbp
	ret
