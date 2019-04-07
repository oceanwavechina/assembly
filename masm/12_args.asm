; 这段代码是演示:
;   实现大小写转换的功能
;   1. 子程序调用时参数传递的用法
;   2. 解决子程序调用时，寄存器冲突的方法：寄存器的值压栈


assume cs:code, ds:data

data segment
    db 'conversation',0 ; 0结尾的字符串
data ends

code segment
start: 
    mov ax, data
    mov ds, ax
    mov si, 0           ; 字符串的首地址，相当于c语言中i=0;i<size;++i时的 i
    mov cx, 12          ; 计数，相当于c语言中 i=0;i<size;++i 中的size
    
    call capital       ; 调用子程序
    
    mov ax, 4c00h       ; ˙程序结束
    int 21h

capital:
    push cx             ; 因为这两个寄存器我们在子程序中用到了，所以要先保存
    push si

_do_capital:
    mov cl, [si]        ; [si] 就是检测是不是最后一位的0
    mov ch, 0           ; 计数，相当于c语言中 i=0;i<size;++i 中的++i
    jcxz ok             ; 如果cx中为0， 处理完毕
    and byte ptr [si], 11011111b
    inc si
    jmp short _do_capital

ok:
    pop si              ; 为调用者还原寄存器
    pop cx
    ret

code ends

end start