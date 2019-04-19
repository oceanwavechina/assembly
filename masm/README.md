# assembly

#### 简介

汇编语言《王爽老师的》(第一版)的一些实践

#### 运行步骤
1. 在 doxbox 中挂载本地目录 

  ```
    mount c:	$path_to_home/assembly.git/masm 
    c:
  ```

2. 编译 (加分号是快速编译，不用选择)

  ``` bin\MASM.EXE xx.ASM;  ```

3. 链接

  ``` bin\LINK.EXE xx ```

4. debug 跟踪程序

  ``` bin\DEBUG.EXE xx.EXE ```

  > r 查看当前寄存器
  > r register-name 修改寄存器的值
  

  > d 1000:0 查看内存中段是1000,偏移地址是0的内存
  > e 1000:0 data data data ...   改写内存中的数据
  > u 1000：0 查看内存中的数据和其对应的汇编指令

  > t 执行内存中的指令，即cs:ip指向的指令

  在用debug跟踪时，没执行一条指令要对应查看那些寄存器变化了，那快内存被读取，修改了
