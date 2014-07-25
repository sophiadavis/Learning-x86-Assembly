.text
.globl	_main
_main:
	push   	%rbp
	mov 	%rsp, %rbp
	mov	    $42, %rax
	add     $3, %rax
	cmp     $46, %rax
	jne     else_branch
	jmp     finish_branch
else_branch:
    mov    $69, %rax
finish_branch: 
	popq	%rbp
	ret
