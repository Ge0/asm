bits 64

extern atoi
extern printf
extern scanf

global main

section .data

input_number1 db "Enter the first number: ", 0
input_number2 db "Enter the second number: ", 0
result_number db `Result is: %ld\n`, 0
number_format db "%ld"

section .text

main:

; %%%%%%%%%%%%
number equ 0
result equ -8
; %%%%%%%%%%%%

  push rbp
  mov rbp, rsp
  sub rsp, 16

  xor rax, rax  ; No floats used (in xmm registers)
  mov rdi, input_number1
  call printf

  xor rax, rax
  lea rsi, [rbp+result]
  mov rdi, number_format
  call scanf

  xor rax, rax
  mov rdi, input_number2
  call printf

  xor rax, rax
  lea rsi, [rbp+number]
  mov rdi, number_format
  call scanf

  mov r11, qword [rbp+number]

  ; Addition! :)
  add qword [rbp+result], r11

  xor rax, rax
  mov rsi, qword [rbp+result]
  mov rdi, result_number
  call printf

  xor rax, rax
  leave
  ret
