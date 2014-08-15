.data # constants and variables go here
.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	mov $2, %al
	mov $3, %bl
	
	mul %bl # result goes to %rax?
	
	# epilog
	pop	%rbp
	ret
