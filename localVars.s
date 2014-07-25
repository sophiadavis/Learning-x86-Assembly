# http://www.cs.princeton.edu/courses/archive/spr11/cos217/lectures/15AssemblyFunctions.pdf
.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	# push parameters
	push $5
	push $4
	push $3
	
	# call function
	call add3
	
	# pop parameters
	add $24, %rsp
	
	# epilog
	mov	%rsp, %rbp
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
	
	# allocate space for local variable d
	sub $8, %rsp
	
	# do the addition
	mov 16(%rbp), %rax # use RBP to access parameters
	add 24(%rbp), %rax
	add 32(%rbp), %rax
	
	# move value into local variable
	mov %rax, -8(%rbp) #-32(%rbp)
	
	# copy local variable into return value
	mov -8(%rbp), %rax #-32(%rbp), %rax
	
	add $8, %rsp # we dont need space for local variable anymore -- back up RSP
	
	# epilog
	mov %rbp, %rsp # recover old stack pointer (RSP -- top of stack) 
	pop %rbp # ?? recover old RBP (base of old frame)
		
	# return
	ret
	
