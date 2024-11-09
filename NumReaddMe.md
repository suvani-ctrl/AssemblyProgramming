Here’s a formatted and clean version suitable for GitHub, with Markdown syntax and code blocks for readability.

---

# Assembly Program: `Num.asm`

This assembly program defines a variable and exits the program with a status code set to the variable's value. The program is written for a 32-bit Linux system and uses system calls to manage program execution.

## Code Overview

The program defines a variable `num` in the `.data` section with an initial value of `5`. In the `.text` section, it sets up a system call to exit, using the value stored in `num` as the exit code.

## Code Breakdown

```asm
section .data
    num DD 5           ; Define a double word (4 bytes) variable `num` initialized to 5
```

- **`section .data`**: This section is used to define and initialize data.
- **`num DD 5`**: Defines `num` as a variable stored as a double word (4 bytes), with an initial value of `5`. The `DD` directive allocates 4 bytes and initializes them to `5`.

```asm
section .text
    global _start       ; Declare `_start` as the entry point
```

- **`section .text`**: This section contains the program’s instructions.
- **`global _start`**: Declares `_start` as the program's entry point, where execution begins.

```asm
_start:
    mov eax, 1          ; Load 1 into EAX (system call number for 'exit')
    mov ebx, [num]      ; Load the value at `num` into EBX (exit code)
    int 0x80            ; Trigger interrupt 0x80 to make the system call
```

- **`_start`**: Label for the program’s starting point.
- **`mov eax, 1`**: Loads `1` into the `eax` register. In Linux, the syscall number `1` represents `exit`, which exits the program when this syscall is triggered.
- **`mov ebx, [num]`**: Loads the value at the address of `num` into `ebx`. Here, `ebx` will hold the exit code (in this case, `5`).
- **`int 0x80`**: Executes a software interrupt to make the system call. With `eax = 1` (exit syscall) and `ebx = 5` (exit code), the program will exit and return the code `5`.

## How to Assemble and Run

Use the following commands to assemble, link, and execute the program.

1. **Assemble** the code into an object file:
   ```bash
   nasm -f elf32 Num.asm -o Num.o
   ```

2. **Link** the object file to create an executable:
   ```bash
   ld -m elf_i386 Num.o -o Num
   ```

3. **Run** the program:
   ```bash
   ./Num
   ```

4. **Check the Exit Code**:
   ```bash
   echo $?
   ```
   This should output `5`, confirming that the program exited with the value of `num`.

## Key Concepts

- **System Calls**: The program uses the Linux `int 0x80` interrupt for system calls. `mov eax, 1` sets up the `exit` syscall, and `ebx` holds the exit code.
- **Data Access**: Square brackets (`[num]`) indicate that we’re accessing the value at the address of `num` rather than the literal address itself.

## Additional Notes

- This code is specific to 32-bit assembly on Linux. To run it on a 64-bit system, you may need to set up a 32-bit compatible environment or adapt the code for 64-bit assembly, as `int 0x80` is replaced by `syscall` in 64-bit assembly.
- NASM syntax is used, so syntax may vary slightly if using a different assembler.

