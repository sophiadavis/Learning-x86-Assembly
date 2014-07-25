.text

.globl	_main
_main:
	push	%rbp
	mov 	%rsp, %rbp
	mov	    $0, %rax

loop_branch:
	cmp     $10, %rax
	jne     add_one
	jmp     finish_branch # otherwise, execution will continue with line 15

add_one:
    add     $1, %rax
    jmp     loop_branch

finish_branch: 
	popq	%rbp
	ret
