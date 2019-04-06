; 这段代码是演示loop循环和bx的联合使用
;  bx寄存器是偏移地址寄存器，为啥英文名字叫base
; 用 debug中的d 命令查看内存数据 [d ffff:000]是不是被读取
; dos内存中一般 0:200 - 0:300 这段内存是安全的，也就是不会被系统使用

assume cs:loopmem

loopmem segment

start: 
    mov ax, 0ffffh  ; 汇编中的数据不能以字母开头，前面要添0
    mov ds, ax      ; 指定要读取的，内存中，数据的基地址
    mov bx, 0       ; 重置偏移地址，执行基地址的起始，即 ds:bx 指向ffff:0, 实际的内存地址就是ffff0

    mov dx, 0       ; 这个寄存器用来存放结果

    mov cx, 12      ; 循环计数器

s:  mov al, [bx]    ; bx 存的是内存地址的偏移，其对应的默认的段是ds，也就是数据段，等同于ds:[bx]
                    ; [] 中可以是具体的数字，[] 表示的是内存单元的偏移地址，其段基地址在dx中
    
    mov ah, 0       ; 清空ah,因为我们只需要计算低8bit, 因为之前ah是用数据的
    add dx, ax      ; 计算结果放到dx中
    inc bx          ; 指向下一个单元, 加1，因为我们使用的1byte，也即是8bit
    loop s

    mov ax, 4c00h
    int 21h
    
loopmem ends

end start