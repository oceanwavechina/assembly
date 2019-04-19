; 这段代码是演示:
;   内存数据的拷贝
;   串传送指令的使用
;   即内存地址之间的数据拷贝


assume cs:code, ds:data

data segment
    db 'Welecom to masm!'
	db 16 dup(0)
data ends

code segment
start: 
    mov ax, data
    mov ds, ax
    mov si, 0				; ds:si 指向第一个数据的起始位置
	mov es, ax  			
    mov di, 16				; es:di 指向第二个数组的起始位置
	mov cx, 16				; 设置循环的次数，也就是拷贝多少次
	cld						; 正向传送，即向前步进    
	rep movsb				; 循环执行movsb 指令
    
    mov ax, 4c00h			; ˙程序结束
    int 21h


code ends

end start
