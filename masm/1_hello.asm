; 这段代码是展示masm汇编的基本结构
; 这段代码没有特定的功能，就是联系指令的使用
; 用debug 程序，一步一步观察程序执行时，寄存器的变化

; 将cs寄存器指向 democode 这个段的起始
assume cs:democode

; 段的开始
democode segment
start: 
    mov ax, 0123h 
    mov bx, 0456h
    add ax, bx
    add ax, ax

    ; 下边两行是代码结束返回
    mov ax, 4c00h
    int 21h
    
democode ends

end start