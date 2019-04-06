; 这段代码是演示如何使用常量偏移地址进行内存数据访问
; 这个使用的场景是两个数组长度相等时比较有用

assume cs:code,ds:data

; 定义数据段，开辟空间
data segment
    db 'BaSiC'          ; 相当于 db 75h,6eh,49h,58h, 要把这个转为大写
    db 'iNfoR'          ; 把这个转为小写
data ends

code segment
start: 
    mov ax, data        ; 
    mov dx, ax          ; 以上两句是设置数据段基地址
    mov bx, 0           ; 数据指针重置， 到此，数据区的指针就设置完了
    
    mov cx, 5           ; 循环5次

s:
    mov al, 0[bx]       ; 这个等同于 [bx+0]
    add al, 11011111B   ; 从低到高有效位，第5位为0时是大写
    mov [bx], al        ; 转化好了就返回数据段中，覆盖掉内存中原来的值

    mov al, 5[bx]       ; 处理第二个数组
    or  al, 00100000B
    mov 5[bx], al
    
    inc bx              ; 移动到数组中下一个位置
    loop s

    mov ax, 4c00h
    int 21h
    
code ends

end start