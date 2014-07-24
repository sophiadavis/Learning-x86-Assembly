	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	# .align	4, 0x90
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$42, %eax
	addl    $3, %eax
	cmpl    $46, %eax
	jne     else_branch
	jmp     finish_branch
else_branch:
    movl    $69, %eax
finish_branch: 
	# movl	$0, -4(%rbp) -- dont need 
	popq	%rbp
	ret
