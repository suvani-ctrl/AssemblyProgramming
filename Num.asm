section .data
    num DD 5           ; Define a double word (4 bytes) variable `num` with a value of 5

section .text
global _start       ; Declare `_start` as the entry point

_start:
    mov eax, 1          ; System call number (1 for exit)
    mov ebx, num          ; Exit code 0 (success)
    int 0x80            ; Trigger interrupt to make the system call
