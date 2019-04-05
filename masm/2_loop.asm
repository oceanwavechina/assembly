; 这段代码是演示loop循环的使用，用到了那些寄存器
; 用debug查看loop执行后，如何影响cx(减一)，cs，ip（二者重新指向s处）的

assume cs:pow

pow segment

start: 
    mov ax, 2   ; 要计算的数据
    mov cx, 0bh  ; 计数器, 11 是计算2^12, 汇编中数据不能以字母开头，前边要加0

s:  add ax, ax  ; 要循环的代码块
    loop s      ; 循环完一次后，检查有没有下次循环，对应 [ (cx) = (cx)-1; if (cx) > 0 goto s else pass;]

    mov ax, 4c00h
    int 21h
    
pow ends

end start