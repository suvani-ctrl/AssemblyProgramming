section .text
global _start

_start:
    MOV al, 0b11111111  ; Move binary 11111111 (255 in decimal) into eax
    MOV bl, 0b0001      ; Move binary 00000001 (1 in decimal) into ebx
    ADD al,bl         ; Add ebx to eax, result will be 256 in eax
    ADC ah,0   
    INT 0x80             ; Trigger the system call
