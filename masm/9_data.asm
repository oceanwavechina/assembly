; 这段代码是演示:
;   1. 内存数据的操作
;   2. 使用 dup 来填充数据
; 在使用不同方式的寻址时，要注意 指针寄存器 和 对应测段地址寄存器
; ds:bx, ss:bp 相对应， si和di是相对变址寄存器和和前边的两组，组合使用

assume cs:code,ds:data

; 定义数据段，开辟空间
; struct company {
;   char name[4];    // 公司名字
;   int32_t rank;        // 排名
; };
data segment
    ; 下边这些相当于分配一个struct对象，并进行初始化
    db 4 dup(0)          ; name
    dd 0                 ; rank
data ends

code segment
start: 
    mov ax, data        ; 
    mov dx, ax          ; 以上两句是设置数据段基地址
    mov bx, 0           ; 数据指针重置， 到此，数据区的指针就设置完了
    
    ; 下边我们进行对象赋值, 直接操作内存
    ; 注意，在调试的时候，段地址是ds，不是dx
    mov si, 0
    mov byte ptr [bx].0h[si], '3'       ; 开始修改name, 3721公司
    inc si
    mov byte ptr [bx].0h[si], '7'
    inc si
    mov byte ptr [bx].0h[si], '2'
    inc si
    mov byte ptr [bx].0h[si], '1'

    mov word ptr [bx].4h, 9            ; 修改排名, 第9 名


    mov ax, 4c00h
    int 21h
    
code ends

end start