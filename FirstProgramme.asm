section .data        ; Declares a data section
section .text        ; Declares a code section

global _start

_start:
        mov eax, 1       ; EAX register is set to 1 (used for syscall number for 'exit')
        mov ebx, 1       ; EBX register is set to 1 (exit code for 'exit')
        int 0x80         ; Interrupt 0x80 to make a system call
