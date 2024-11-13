Assembly String Loader 🚀
Description 📜
This program is a basic x86 assembly code example that demonstrates how to load values from defined strings into a register. It's built to run on Linux, using the nasm assembler and ld linker.

Program Overview 🔍
Defines two strings, string1 and string2, in the .data section.
Loads the first character of string1 into the bl register in the .text section.
Exits the program using a system call.
Code Explanation 📝
Here’s the code structure and what each part does:

asm
Copy code
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
.data: Holds data (strings) that we want to use in the program.
string1: Contains "ABA", ending with a null byte (0).
string2: Contains "CDE", also null-terminated.
.text: Holds the executable code.
_start: The main entry point for the program.
MOV bl, [string1]: Loads the ASCII value of 'A' (first character of string1) into the bl register.
MOV eax, 1 and INT 80h: Make a system call to exit the program.
Requirements ⚙️
NASM: Install it with sudo apt install nasm.
ld: Linux linker, usually pre-installed.
How to Assemble and Run ▶️
Assemble: Compile the program with NASM:

bash
Copy code
nasm -f elf32 -g -F dwarf -o strings.o strings.asm
Link: Link the object file to create the executable:

bash
Copy code
ld -m elf_i386 -o strings strings.o
Run: Run the program with GDB or directly:

bash
Copy code
./strings
Debugging 🐞
To debug with GDB and view the assembly, run:

bash
Copy code
gdb ./strings
Use break _start, run, and disassemble commands to step through and inspect the code.
