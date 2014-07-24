.data
hello: 
    .asciz "Hello World!\n"
    
.text

.globl	_main
_main:
    push   %rbp
    mov    %rsp, %rbp
	lea    hello(%rip), %rdi
	
	call    _printf # -- takes stuff from rdi, rsi, rax
	mov    $0, %rax # set return value to 0	
	pop    %rbp
	ret
