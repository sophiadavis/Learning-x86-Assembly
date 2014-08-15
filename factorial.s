.data # constants and variables go here

.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	mov $5, %al # is this bad?
	mov %al, %bl # store rolling total in bl
	
	call factorial
	
	
	
	# epilog
	pop	%rbp
	ret

factorial:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	# base case
	cmp $1, %al
	jne recurse
	
	# epilog
	pop	%rbp
	ret
	
recurse:
	# recursion
	dec %al
	mul %bl # result of multiplication goes to rax
	
	#movb %rax, %r16
	
	call factorial
