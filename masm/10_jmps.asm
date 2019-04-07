; 这段代码是演示:
;   1. jmp short 指令
; jmp 可可以修改 cs 和 ip
; 其中 jmp short 和 jmp near 是段内转移
;           这个是编译器，根据指令之间的距离计算出来的偏移, 值修改ip。
;           偏移的地址分别是 8bit 和 16bit
;     jmp far 是段间转移,同时修改cs 和 ip 

assume cs:code

code segment
start: 
    mov ax, 0
    jmp short s     ; debug看看这里的具体转移的偏移是多少? [JMP 0008]
                    ; 因为当前地址是076a:0003, 加上jmp指定的2个byte，（inc,nop,nop）的3个byte，是s处的076a:0003
    inc ax
    nop
    nop

s:  inc ax
    jmp short exit        ; debug 看看这里的专一的偏移是多少; 同理，当前的地址起始 + 2B(jmp) + 3B(add)
    add ax, 2

exit:
    mov ax, 4c00h
    int 21h
    
code ends

end start