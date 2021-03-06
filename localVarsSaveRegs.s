# http://www.cs.princeton.edu/courses/archive/spr11/cos217/lectures/15AssemblyFunctions.pdf
.text

.globl	_main
_main:
    # prolog
	push	%rbp
	mov	%rsp, %rbp
	
	######## PAIN!!!!!
	# save caller-save registers
	pushq %rax 
	pushq %rcx 
	pushq %rdx 
	
	# push parameters
	push $5
	push $4
	push $3
	
	# call function
	call add3
	
	# pop parameters
	add $24, %rsp

    ######## PAIN!!!!!
    # restore caller-save registers	
	popq %rdx 
    popq %rcx 
    popq %rax 
	
	# epilog
	mov	%rsp, %rbp # IS THIS A PROBLEM?
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
	
	######## PAIN!!!!!
	# save callee-save registers
	pushq %rbx ############### How do I know how much space is being used for this? -- it pushes 1 word?
	pushq %rsi
	pushq %rdi
	
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
	
	######## PAIN!!!!!
	# restore callee-save registers
	movq -24(%rbp), %rdi 
	movq -16(%rbp), %rsi
	movq -8(%rbp), %rbx
	
	######## PAIN!!!!!
	add $32, %rsp ## HELP
	
	# epilog
	mov %rbp, %rsp # recover old stack pointer (RSP -- top of stack) 
	pop %rbp # ?? recover old RBP (base of old frame)
		
	# return
	ret
	
