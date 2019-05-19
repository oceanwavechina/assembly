; 1. 用lea 指令获取变量的内存地址
section .data

	bVar1	db 22
	bVar2	db 33


section .text
global _start
_start:
	lea	rax, qword [bVar1]

last:
	mov rax, 60
	mov rdi, 0 
	syscall