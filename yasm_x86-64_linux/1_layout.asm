; 基本的数据定义
section .data

; ************************************************************
; 数据段

    ;定义，在翻译的时候直接替换，不占数据空间
    EXIT_SUCCESS    equ 0
    SYS_exit        equ 60

    ; 8-bit 的变量声明
    bVar1       db  17
    bVar2       db  9
    bResult     db  0

    ; 16-bit
    wVar1       dw  1700
    wVar2       dw  9000
    wResult     dw  0

    ; 32-bit
    dVar1       dd  17000000
    dVar2       dd  9000000
    dResult     dd  0

    ; 64-bit
    qVar1       dq  17000000
    qVar2       dq  9000000
    qResult     dq  0

; ************************************************************
; 代码段

section .text
global  _start
_start:

    ;  byte example bResult = bVar1 + bVar2
    mov al, byte [bVar1]
    add al, byte [bVar2]
    mov byte [bResult], al

    ; word
    mov ax, word [wVar1]
    add ax, word [wVar2]
    mov word [wResult], ax

    ; double word
    mov eax, dword [dVar1]
    add eax, dword [dVar2]
    mov dword[dResult], eax

    ; 64-bit
    mov rax, qword [qVar1]
    add rax, qword [qVar2]
    mov qword [qResult], rax

last:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall
