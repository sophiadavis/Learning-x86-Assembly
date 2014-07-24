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
	push $5
	
	# call function
	call add3
	
	# pop parameters
	add $8, %rsp
	
	# epilog
	pop	%rbp
	ret
	
	
# int add3(int a) {
#     return a;
# }

add3:
    # prolog
    
    lea    hello(%rip), %rdi
	call    _printf # -- takes stuff from rdi, rsi, rax
	
	push	%rbp    # save old value of RBP (base pointer register)
	mov	%rsp, %rbp  # and set current RBP
	
	# move parameter into register
	mov 16(%rbp), %rax # use RBP to access parameters
	
	# epilog
	mov %rbp, %rsp # recover old stack pointer (RSP -- top of stack) 
	pop %rbp # ?? recover old RBP (base of old frame)
	
	# return
	ret
	
