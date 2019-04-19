; 这段代码是演示:
;   统计某个数字在数据中出现的次数
;   1. 比较指令，跳转指令的使用


assume cs:code, ds:data

data segment
    db 8,11,8,1,8,5,63,38
data ends

code segment
start: 
    mov ax, data
    mov ds, ax
    mov bx, 0				; ds:bx 指向数据的起始位置
	mov ax, 0				; 初始化累加器
    mov cx, 8				; 计数，我们有8个数据
    
s:  
    cmp byte ptr [bx], 8    ; cmp 指令相当于对两个操作数做减法，最后影响标准寄存器，以此进行=,>,< 等的判断
    jne next				; jump not equal 不想等时跳转
	inc ax					; 相等时累加个数

next:
    inc bx					; 跳转到下一个数据上，一次前进一个字节
	loop s					; loop 是根据cx中的数据进行跳转的
    
    mov ax, 4c00h			; ˙程序结束
    int 21h


code ends

end start
