###Fun with x86-64 Assembly 

----------
Sophia Davis  
Summer 2014

----------

Wishing that I knew more about how programs run under the hood, I spent a couple days messing around with basic assembly. I started by writing simple C programs and compiling them to un-optimized assembly instructions (<code>clang file.c -S -mllvm --x86-asm-syntax=att -o file_output.s</code>). A friend helped me figure out a bit of what was going on and we created a template for a simple program. 

In these programs (**\*disclaimer\*** not all of them work, sorry!), I explore how to use conditionals, loops and constants, and try to implement functions according to the calling convention (how to manage parameters, registers, and the stack while calling and returning from functions such that no data is overwritten). I got stuck implementing the factorial function.

To run: <code> gcc file.s -o output </code> then <code>./output</code>  
The only tangible thing these programs do is modify the return value of the main function in some way. You can check this return value by executing <code> echo $? </code>.