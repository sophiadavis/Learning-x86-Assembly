.data # constants and variables go here
.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	mov $0, %rax
	
	# epilog
	pop	%rbp
	ret
