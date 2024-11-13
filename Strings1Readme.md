# Assembly String Loader 🚀

## Description 📜

This program is a simple **x86 assembly** example that demonstrates how to load values from defined strings into a register. The program is built for **Linux** using the `nasm` assembler and `ld` linker.

### Program Overview 🔍

- Defines two strings, `string1` and `string2`, in the `.data` section.
- Loads the first character of `string1` into the `bl` register in the `.text` section.
- Exits the program using a system call.

## Code Explanation 📝

Here’s the structure of the program with comments explaining each part:

```asm
section .data
    string1 DB "ABA", 0      ; Define string1 with null termination
    string2 DB "CDE", 0      ; Define string2 with null termination

section .text
    global _start            ; Entry point for the program

_start:
    MOV bl, [string1]        ; Load the first character of string1 into the `bl` register
    MOV eax, 1               ; Set up exit system call
    INT 80h                  ; Call the kernel to exit
Sections Breakdown 📂
.data: Contains data (strings) used in the program.
string1: Contains "ABA", with a null byte (0) at the end.
string2: Contains "CDE", also null-terminated.
.text: Contains the executable code.
_start: The entry point where the program begins execution.
MOV bl, [string1]: Loads the ASCII value of 'A' (first character of string1) into the bl register.
MOV eax, 1 and INT 80h: Initiates a system call to exit the program.
Requirements ⚙️
Before you start, make sure you have the following installed on your Linux machine:

NASM: The Netwide Assembler. Install it with:


sudo apt install nasm
ld: The Linux linker (usually pre-installed).

How to Assemble and Run ▶️
Follow these steps to assemble, link, and run the program:

Assemble: Compile the assembly code into an object file:

nasm -f elf32 -g -F dwarf -o strings.o strings.asm
Link: Link the object file to create the executable:


ld -m elf_i386 -o strings strings.o
Run: Run the program:


./strings
Debugging 🐞
To debug the program and inspect the assembly code:

Launch GDB:


gdb ./strings
Set a breakpoint at the _start label and run the program:


break _start
run
Disassemble the code to view the instructions:


disassemble _start
