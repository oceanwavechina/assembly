# Notes

## 笔记

* 编译
  ```
  yasm -g dwarf2 -f elf64 1_layout.asm -l 1_layout.lst
  ```

* 两步汇编
  
    在翻译成机器码的时候，因为要处理跳转的问题，汇编器无法对应跳转目的标签，所以要扫描asm文件两次
    
    第一次扫描：
    1. 建立符号表
    2. 宏展开 （macros）
    3. 推导常量表达式
    
    第二次扫描:
    1. 生成最终的代码，即转换成机器码
    2. 创建list文件, 用来debug
    3. 创建obj文件(这就是最终的文件)

* 使用 debugger command file 收集调试信息
    在gdb启动后，执行 source debugger_input.txt </br>
    或是</br>
    gdb < debugger_input.txt a.out


## 其他

* vim 查看二进制文件
    ```
    vim 1_layout.o -b
    ```
    打开后设置
    > %!xxd -g 1