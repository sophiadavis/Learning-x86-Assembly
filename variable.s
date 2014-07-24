.data # constants and variables go here
    x: .quad 42 # x = 42
.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	lea x(%rip), %rax
	mov (%rax), %rax
	
	# epilog
	pop	%rbp
	ret
