.data
hello: 
    .asciz "%u\n"
    
.text

.globl	_main
_main:
    push   %rbp
    mov    %rsp, %rbp
	lea    hello(%rip), %rdi
	mov    $42, %rsi
	
	call    _printf # -- takes stuff from rdi, rsi, rax
	mov    $0, %rax # set return value to 0	
	pop    %rbp
	ret
