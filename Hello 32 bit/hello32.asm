section .data
    hello db 'Hello, World!', 0   ; The string to print
    hello_len equ $ - hello

section .text
    global _start

_start:
    ; Write the string to stdout
    mov edx, hello_len     ; Message length
    mov ecx, hello         ; Message to write
    mov ebx, 1             ; File descriptor (stdout)
    mov eax, 4             ; System call number (sys_write)
    int 0x80               ; Call kernel

    ; Exit the program
    mov eax, 1             ; System call number (sys_exit)
    xor ebx, ebx           ; Exit code 0
    int 0x80               ; Call kernel
