; 这段代码是演示如何指定代码的起始位置
; 因为我们可能在代码执行前预定义一些数据

assume cs:test_entry

test_entry segment

; dw -> define word，即定义数据的大小是 word 类型的
; 这个可以说是开辟内存空间，也就是预留我们将要使用的空间
dw 0123h,0456h,0789h,0abch,0defh,0fdeh,0cbah,0987h

start: 
    mov bx, 0       ; 偏移设置为0
    mov ax, 0       ; 累加的结果
    mov cx, 8       ; 循环8次

s:  mov ax, cs:[bx] ; 重点在这里，我们的数据定义在代码段的起始位置
                    ; 而代码加载到内存后，会对我们的这个test_entry设置基地址到cs
                    ; 所以在取其中的数据的时候就会用这种方式
    
    add bx, 2       ; 因为我们定义的是word类型的数据即2byte，所以每次循环要步进2
    loop s

    mov ax, 4c00h
    int 21h
    
test_entry ends

end start           ; 这里的 start是告诉系统cs:ip的开始是哪里
                    ; 因为这次我们代码的开始没有在code segment的 起始