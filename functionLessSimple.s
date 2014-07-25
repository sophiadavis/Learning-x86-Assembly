# http://www.cs.princeton.edu/courses/archive/spr11/cos217/lectures/15AssemblyFunctions.pdf
.data
hello: 
    .asciz "Hello World!\n"

.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	lea    hello(%rip), %rdi
	call    _printf # -- takes stuff from rdi, rsi, rax
	
	# push parameters
	push $15
	push $10
	push $5
	
	# call function
	call add3
	
	# pop parameters
	add $24, %rsp
	
	# epilog
	mov	%rsp, %rbp
	pop	%rbp
	ret
	
add3:
    # prolog
	push	%rbp    # save old value of RBP (base pointer register)
	mov	%rsp, %rbp  # and set current RBP
	
	# move parameter into local variable a
	mov 16(%rbp), %rax # use RBP to access parameters
	add 24(%rbp), %rax
	sub 32(%rbp), %rax
	
	# epilog
	mov %rbp, %rsp # recover old stack pointer (RSP -- top of stack) 
	pop %rbp # ?? recover old RBP (base of old frame)
	
	# return
	ret
	
