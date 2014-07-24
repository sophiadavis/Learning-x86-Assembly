# http://www.cs.princeton.edu/courses/archive/spr11/cos217/lectures/15AssemblyFunctions.pdf
.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	# save caller-save registers
	push %rax 
	push %rcx 
	push %rdx 
	
	# push parameters
	push $5
	push $4
	push $3
	
	# call function
	call add3
	
	# pop parameters
	add $12, %rsp
	
	# save return value
	# mov %rax

    # restore caller-save registers	
	pop %rdx 
    pop %rcx 
    pop %rax 
	
	# epilog
	pop	%rbp
	ret

# int add3(int a, int b, int c) { 
#     int d; 
#     d = a + b + c; 
#     return d; 
# }
add3:
    # prolog
	push	%rbp    # save old value of RBP (base pointer register)
	mov	%rsp, %rbp  # and set current RBP
	
	# save callee-save registers
	push %rbx
	push %rsi
	push %rdi
	
	# allocate space for local variable d
	sub $4, %rsp
	
	# do the addition
	mov 8(%rbp), %rax # use RBP to access parameters
	add 12(%rbp), %rax
	add 16(%rbp), %rax
	
	# move value into local variable
	mov %rax, -16(%rbp)
	
	# copy local variable into return value
	mov -16(%rbp), %rax
	
	# restore callee-save registers
	mov -12(%rbp), %rdi 
	mov -8(%rbp), %rsi
	mov -4(%rbp), %rbx
	
	# epilog
	mov %rbp, %rsp # recover old stack pointer (RSP -- top of stack) 
	pop %rbp # ?? recover old RBP (base of old frame)
	
	# return
	ret
	
