; 这段代码是演示如何自定义的栈
; 需要注意的是当我们在用debug看内存中的数据时，不能用cs:ip了，因为ip指向的是code的起始
; 此时我们要用cs:0才可以
; 另一个要注意的是 0123h 在内存中存放的顺序是(地址从小到大) 这个是小端机器(macos)
; 23 01 56 04 89 07 bc 0a ......

assume cs:reverse

reverse segment

; dw -> define word，即定义数据的大小是 word 类型的
; 这个可以说是开辟内存空间，也就是预留我们将要使用的空间
dw 0123h,0456h,0789h,0abch,0defh,0fdeh,0cbah,0987h

; 这个是预留空间，并且把空间置零
dw 0,0,0,0,0,0,0,0

start: 
    mov ax, cs      ; 当前代码段的起始
    mov ss, ax      ; 设置 stack 的基地址
    mov sp, 32      ; 这里有两个点: 1. 就是栈是从高地址到低地址的，
                    ;             2. 空栈时sp指向的是栈低的上边(即超过了栈底)
    mov bx, 0       ; 数据指针重置
    mov cx, 8       ; 循环计数器, 因为我们有8个元素的数组要翻转

sin:  
    push cs:[bx]    ; 把要翻转顺序的元素压栈
    add bx, 2       ; 数据指针指向下一个（加几取决于数据的类型是word还是byte）
    loop sin

    mov bx, 0       ; 重新重置数据指针
    mov cx, 8       ; 栈里边有8个数据，所以也要循环8次

sout:
    pop cs:[bx]     ; 从第一个开始
    add bx, 2       ; 步进
    loop sout

    mov ax, 4c00h
    int 21h
    
reverse ends

end start