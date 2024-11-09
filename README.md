

# 🖥️ Assembly Program: Simple Exit Code

This is a basic assembly program for Linux (32-bit), written in NASM (Netwide Assembler) syntax, which exits with a specific status code. It demonstrates the use of system calls in assembly through a simple structure with `.data` and `.text` sections.

## 🔍 Code Overview

This code initializes the registers required to execute a system call to exit the program with an exit status code of `1`.

---

## 💻 Assembly Code

```asm
section .data        ; Declares the data section (not used in this program)
section .text        ; Declares the code section

global _start

_start:
        mov eax, 1       ; Load 1 into the EAX register (syscall number for 'exit')
        mov ebx, 1       ; Load 1 into the EBX register (exit code for 'exit')
        int 0x80         ; Trigger interrupt 0x80 to make the system call
```

---

## 📜 Explanation of the Code

- **`section .data`** 🗄️: Declares a data section, though not used in this program. This is here to provide structure for more complex programs where data storage may be required.
- **`section .text`** 📑: Contains the actual code, defining the instructions the processor will execute.
- **`global _start`** 🌐: Declares `_start` as the program’s entry point. This label is recognized by the linker as the program's starting point.

---

### 🏁 `_start` Label Breakdown

1. **`mov eax, 1`**: Loads the syscall number `1` (for exit) into the `eax` register.
2. **`mov ebx, 1`**: Sets the exit status code to `1` by loading `1` into the `ebx` register.
3. **`int 0x80`**: Executes a software interrupt to invoke a system call, using `eax` and `ebx` to exit the program with the specified status code.

---

## 🛠️ How to Assemble and Run the Code

To compile and run this code, follow these steps:

### 1. Install NASM
Ensure you have NASM installed. You can install it using a package manager:

```bash
sudo apt update
sudo apt install nasm
```

### 2. Assemble the Code

Use NASM to assemble the `.asm` file into an object file.

```bash
nasm -f elf32 firstP.asm -o firstP.o
```

### 3. Link the Object File

Use `ld` (GNU linker) to link the object file and create an executable.

```bash
ld -m elf_i386 firstP.o -o firstP
```

### 4. Run the Program

Execute the resulting file.

```bash
./firstP
```

### 5. Check the Exit Code

To verify the exit code, check the special variable `$?` immediately after running the program.

```bash
echo $?
```

You should see an output of `1`, which matches the exit code specified in the code.

---

## 📌 Additional Notes

- This code is specific to **32-bit Linux systems**. On 64-bit systems, run it in a 32-bit compatible environment or adapt it for 64-bit assembly.
- The **`int 0x80`** interrupt is specific to 32-bit Linux and is replaced by `syscall` in 64-bit assembly. For 64-bit compatibility, adjustments are necessary.

---

## 📄 License

This code is available under the **MIT License**. Feel free to use, modify, and distribute it as needed.
