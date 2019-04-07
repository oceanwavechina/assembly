; 这段代码是演示:
;   1. call指令 和 ret指令 配合使用

; 像loop， jx，ret， call等都是转移指令，转移指令修改cs,ip
; 如果我们没有设定自己的stack segement，系统会使用ss，sp中默认的值

; call 指令相当于(把cs,ip入栈,然后转移), 根据短转移和长转移不同而不同，原理是一样的
;   1. sp = sp - 2      ; 先申请栈上的空间
;   2. ss*16 + sp = cs  ; 把cs中的值放入栈中
;   3. sp = sp - 2      ; 在申请一次栈上的空间
;   4. ss*16 + sp = ip  ; 把ip中的值放入栈中

; ret/retf 指令相当于(把栈上存的指令地址放到指令寄存器汇总,然后转移), 根据短转移和长转移不同而不同，原理是一样的
;   1. ip = ss * 16 + sp    ; 把栈顶的元素放到ip中，因为call的时候，我们后方的ip
;   2. sp = sp + 2          ; 收缩栈
;   3. cs = ss * 16 + sp    ; 再把站定的元素放到cs中，因为call的时候，先压入栈的是cs
;   4. sp = sp + 2          ; 收缩栈


assume cs:code, ss:stack

stack segment
    db 8 dup (0)
    db 8 dup (0)
stack ends

code segment
start: 
    mov ax, stack
    mov ss, ax
    mov sp, 16
    mov ax, 1000        ; 这个相当于要计算的参数
    
    call s              ; 调用子程序
    
    mov ax, 4c00h       ; ˙程序结束
    int 21h
s:  
    add ax, ax          ; 计算2*1000
    ret                 ; 注意： 在ret执行完成之后，ip指向的是[mov ax, 4c00h] 这条指令;

code ends

end start