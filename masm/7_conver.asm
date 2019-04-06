; 这段代码是演示如何使用位运算进行大小写转换,
; 以及在代码中定义静态字符串的方法

assume cs:code,ds:data

; 定义数据段，开辟空间
data segment
    db 'BaSiC'          ; 相当于 db 75h,6eh,49h,58h, 要把这个转为大写
    db 'iNfoRMaTioN'    ; 把这个转为小写
data ends

code segment
start: 
    mov ax, data        ; 数据段
    mov dx, ax          ;
    mov bx, 0           ; 数据指针重置
    mov cx, 5           ; 第一个字符串'BaSiC' 有5个byte

s0:
    mov al, [bx]        ; 注意是数据段的第一个byte放到al中
    add al, 11011111B   ; 从低到高有效位，第5位为0时是大写
    mov [bx], al        ; 转化好了就返回数据段中，覆盖掉内存中原来的值
    inc bx              ; 因为是1个byte1个byte的操作，所以+1就可以
    loop s0

    ; 重置数据偏移和计数器
    mov bx, 5           ; 数据段中第5个byte就是第二个字符串的起始位置（既然是连续的，干嘛不第一次吧cx加大就好了？）
    mov cx, 11          ; 栈里边有8个数据，所以也要循环8次

s1:
    mov al, [bx]        ; 同理，数据段的地址也放到dx中了
    or  al, 00100000B   ; 从低到高有效位，第5位为1时是小写
    mov [bx], al        ; 步进
    inc bx
    loop s1

    mov ax, 4c00h
    int 21h
    
code ends

end start