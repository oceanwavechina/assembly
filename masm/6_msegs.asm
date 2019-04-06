; 这段代码是演示如何定义多个segment
; 在8086cpu中segmen长度是有限制的，即64k，因为基址寄存器的长度是16bit, 所以其范围就是2**16
; 为啥link的时候还是提示我没有 stack segmen？？

assume cs:code,ds:data,ss:stack

; 定义数据段，开辟空间
data segment
    dw 0123h,0456h,0789h,0abch,0defh,0fdeh,0cbah,0987h
data ends

; 定义栈段，开辟空间
stack segment
    dw 0,0,0,0,0,0,0,0
stack ends

code segment
start: 
    mov ax, stack   ; 意思就是把stack segment的起始地址放到ax中
                    ; stack 是代码里边的名称，程序加载到内存中后，stack会确定具体的地址
    mov ss, ax      ; 设置 stack 的基地址, 在masm5中好像是和下边这条 mov sp,10h同时执行的
    mov sp, 10h     ; 为什么在-t跟踪的时候这条指令没有执行 ? ？？执行了10h对应的就是10进制的16
                    ; 栈段，多一步操作，因为栈是从高地址到低地址，这里改成16了，因为把这个段分离出来了

    mov ax, data    ; 同理这个是数据段
    mov dx, ax      ;

    mov bx, 0       ; 数据指针重置
    mov cx, 8       ; 循环计数器, 因为我们有8个元素的数组要翻转

sin:  
    push [bx]       ; 注意这里不需要前缀cs了，因为我们把stack的基地址放到ss了
    add bx, 2       ; 数据指针指向下一个（加几取决于数据的类型是word还是byte）
    loop sin

    mov bx, 0       ; 重新重置数据指针
    mov cx, 8       ; 栈里边有8个数据，所以也要循环8次

sout:
    pop [bx]        ; 同理，数据段的地址也放到dx中了
    add bx, 2       ; 步进
    loop sout

    mov ax, 4c00h
    int 21h
    
code ends

end start