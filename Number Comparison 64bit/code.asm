section .bss
  largest resb 2

section .data
  msg db "The largest digit is: ", 0
  msg_len equ $ - msg

  num1 dd '47'
  num2 dd '22'
  num3 dd '31'

section .text
  global _start

  _start:
	mov rsi, [num1] 
	cmp rsi, [num2]
	jg check_third_number
	mov rsi, [num2]

  check_third_number:
	cmp rsi, [num3]
	jg _exit
	mov rsi, [num3]

  _exit:
	mov [largest], rsi
	mov rax, 1
	mov rbx, 1
	mov rsi, msg
	mov rdx, msg_len
	syscall

	mov rax, 1
	mov rbx, 1
	mov rsi, largest
	mov rdx, 2
	syscall

	mov rax, 60
	syscall
