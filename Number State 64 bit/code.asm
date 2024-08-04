section .data
  odd_msg db "Odd number", 10, 0
  odd_msg_len equ $ - odd_msg

  even_msg db "Even number", 10, 0
  even_msg_len equ $ - even_msg

section .text
  global _start

_start:

  ;check whether odd or even
  mov rax, 9h
  and rax, 1
  jz even_number

odd_number:
  mov rax, 1
  mov rbx, 1
  mov rsi, odd_msg
  mov rdx, odd_msg_len
  syscall

  jmp end_program

even_number:
  mov rax, 1
  mov rbx, 1
  mov rsi, even_msg
  mov rdx, even_msg_len
  syscall

  jmp end_program

end_program:
  mov rax, 60
  syscall
