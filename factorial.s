.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	# save caller-save registers
	#push %rax 
	#push %rcx 
	#push %rdx 
	
	# push parameters
	push $3
	
	# call function
	call factorial
	
	# pop parameters
	add $8, %rsp

    # restore caller-save registers	
	#pop %rdx 
    #pop %rcx 
    #pop %rax 
	
	# epilog
	pop	%rbp
	ret

factorial:
    # prolog
	push	%rbp    # save old value of RBP (base pointer register)
	mov	%rsp, %rbp  # and set current RBP
	
	# save callee-save registers
	#push %rbx
	#push %rsi
	#push %rdi
	
	# allocate space for local variable d
	sub $8, %rsp
	
	# do the addition
	mov 16(%rbp), %rax # use RBP to access parameters
	add 24(%rbp), %rax
	add 32(%rbp), %rax
	
	# move value into local variable
	mov %rax, -32(%rbp)
	
	# copy local variable into return value
	mov -32(%rbp), %rax
	
	# restore callee-save registers
	mov -24(%rbp), %rdi 
	mov -16(%rbp), %rsi
	mov -8(%rbp), %rbx
	
	add $32, %rsp
	
	# epilog
	mov %rbp, %rsp # recover old stack pointer (RSP -- top of stack) 
	pop %rbp # ?? recover old RBP (base of old frame)
	
	# return
	ret
	
