Assembly Program for Adding Two Binary Values 🔢
This assembly program, written in NASM (Netwide Assembler), demonstrates adding two binary values using AL and BL registers. The program adds two 8-bit binary values and uses the ADC instruction to handle the carry for a 16-bit result.


The program initializes values in AL and BL, adds them, and then uses ADC to account for any carry that results from the addition. Finally, it performs a system call to exit.

Code Breakdown 📄asm

section .text
global _start

_start:
    MOV al, 0b11111111   ; Load AL with binary 11111111 (255 in decimal)
    MOV bl, 0b00000001   ; Load BL with binary 00000001 (1 in decimal)
    ADD al, bl           ; Add AL and BL; result will be 0x00 in AL, with carry
    ADC ah, 0            ; Add carry to AH to form full 16-bit result in AX
    INT 0x80             ; Exit system call
Explanation
Setting up Values:

MOV al, 0b11111111: Loads AL with 11111111 (binary for 255).
MOV bl, 0b0001: Loads BL with 00000001 (binary for 1).
Addition with Carry:

ADD al, bl: Adds AL and BL. Resulting carry, if any, goes to the Carry Flag.
ADC ah, 0: Adds the carry from AL to AH, allowing a 16-bit result in AX (with the higher 8 bits in AH).
Exit System Call:

INT 0x80: Triggers an exit system call on Linux.
Requirements 🛠️
NASM: Install NASM using:

sudo apt install nasm
Building and Running the Program ▶️
Assemble the code:


nasm -f elf32 -o add.o add.asm
Link the object file:

ld -m elf_i386 -o add add.o
Run the program:

./add
Explanation of Key Instructions ⚙️
ADD: Adds values in AL and BL, setting the Carry Flag if overflow occurs.
ADC: Adds the Carry Flag to AH to capture overflow from the ADD operation.
INT 0x80: Makes a system call to exit the program.
