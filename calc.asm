section .data
    prompt1 db "Enter first number: ", 0
    prompt2 db "Enter second number: ", 0
    prompt3 db "Enter an operator (+, -, *, /): ", 0
    resultMsg db "Result: ", 0
    newline db 10, 0

section .bss
    num1 resb 4               ; Reserve 4 bytes for the first number
    num2 resb 4               ; Reserve 4 bytes for the second number
    operator resb 1           ; Reserve 1 byte for the operator
    result resb 4             ; Reserve 4 bytes for the result

section .text
global _start

_start:
    ; Prompt for the first number
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, prompt1
    mov edx, 18               ; length of prompt1
    int 0x80

    ; Read the first number
    mov eax, 3                ; sys_read
    mov ebx, 0                ; stdin
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Convert the first number from ASCII to integer
    mov eax, [num1]
    sub eax, '0'              ; Convert ASCII to integer
    mov [num1], eax           ; Store as integer

    ; Prompt for the second number
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, prompt2
    mov edx, 19               ; length of prompt2
    int 0x80

    ; Read the second number
    mov eax, 3                ; sys_read
    mov ebx, 0                ; stdin
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Convert the second number from ASCII to integer
    mov eax, [num2]
    sub eax, '0'              ; Convert ASCII to integer
    mov [num2], eax           ; Store as integer

    ; Prompt for the operator
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, prompt3
    mov edx, 32               ; length of prompt3
    int 0x80

    ; Read the operator
    mov eax, 3                ; sys_read
    mov ebx, 0                ; stdin
    mov ecx, operator
    mov edx, 1
    int 0x80

    ; Load num1 and num2 into registers
    mov eax, [num1]           ; Load first number into EAX
    mov ebx, [num2]           ; Load second number into EBX

    ; Check the operator and perform the operation
    mov cl, byte [operator]   ; Load the operator into CL
    cmp cl, '+'               ; Check if operator is '+'
    je add_numbers
    cmp cl, '-'               ; Check if operator is '-'
    je subtract_numbers
    cmp cl, '*'               ; Check if operator is '*'
    je multiply_numbers
    cmp cl, '/'               ; Check if operator is '/'
    je divide_numbers

    ; Addition
add_numbers:
    add eax, ebx              ; EAX = EAX + EBX
    jmp display_result

    ; Subtraction
subtract_numbers:
    sub eax, ebx              ; EAX = EAX - EBX
    jmp display_result

    ; Multiplication
multiply_numbers:
    imul eax, ebx             ; EAX = EAX * EBX
    jmp display_result

    ; Division
divide_numbers:
    xor edx, edx              ; Clear EDX for division
    div ebx                   ; EAX = EAX / EBX
    jmp display_result

display_result:
    ; Store the result in memory
    add eax, '0'              ; Convert integer to ASCII
    mov [result], eax

    ; Print the result message
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, resultMsg
    mov edx, 8                ; length of resultMsg
    int 0x80

    ; Print the result
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, result
    mov edx, 1
    int 0x80

    ; Print a newline
    mov eax, 4                ; sys_write
    mov ebx, 1                ; stdout
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit
    mov eax, 1                ; sys_exit
    xor ebx, ebx              ; return 0
    int 0x80
