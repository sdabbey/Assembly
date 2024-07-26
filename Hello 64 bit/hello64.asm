section .data
    hello db 'Hello, World!', 0xA  ; The string to print with a newline at the end
    hello_len equ $ - hello         ; Calculate the length of the string

section .text
    global _start

_start:
    ; Write the string to stdout
    mov rax, 1            ; System call number (sys_write)
    mov rdi, 1            ; File descriptor (stdout)
    mov rsi, hello        ; Address of the string
    mov rdx, hello_len    ; Length of the string
    syscall               ; Call kernel

    ; Exit the program
    mov rax, 60           ; System call number (sys_exit)
    xor rdi, rdi          ; Exit code 0
    syscall               ; Call kernel
