section .data
	hello:     db 'Hello world!',10    ; 'Hello world!' plus a linefeed character
	helloLen:  equ $-hello             ; Length of the 'Hello world!' string

section .text
	global _start

_start:
	mov eax,4            ; The system call for write (sys_write)
	mov ebx,1            ; File descriptor 1 - standard output
	mov ecx,hello        ; Put the offset of hello in ecx
	mov edx,helloLen     ; helloLen is a constant, so we don't need to say
	                     ;  mov edx,[helloLen] to get it's actual value
	int 80h              ; Call the kernel
	mov eax,1            ; The system call for exit (sys_exit)
	mov ebx,0            ; Exit with return "code" of 0 (no error)
	int 80h;



; 基本指令   mov add sub inc dec 
; 指示符     equ定义常量 %define定义宏
; RESX 在数据段定义数据空间 x--(B W D Q T) x表示储存对象大小
; DX   在数据段定义数据空间并初始化  x--(B W D Q T) x表示储存对象大小
;      L1  db  0   ;定义字节变量L1，初始值为0
;      L2  db  12h ;定义变量L2 初始化为十六进制的12
;      L3  db  "A" ;定义字节变量L3，初始化为ASCII的A
;      L4  resb 1  ;定义一个未初始化的字节变量L4
;      times 100 db 0 ; 等价于100个值为0的字节
;      resw  100 ; 储存空间为100个字
; 变量表示代码中的数据，不追踪变量的数据类型 EAX寄存器中AL储存低8位，AH储存高8位
;      mov al,[L1]  ; 将L1变量中的值复制到AL,数据为单字节大小
;      mov eax,L1   ; 将L1变量的地址拷贝到AL,数据为单字节大小
;      mov [L6],eax ; 将eax的值复制到L2变量中,数据为双字节大小
;      mov al,[L2] ; 将L2变量中的值复制到AL,数据为单字节大小,即第一个字节
;      mov [L6],1 ;error 未指定操作大小
;      mov dword[L6],1 ;L6为双字节大小数据变量，



; http://courses.ics.hawaii.edu/ReviewICS312/morea/DataSizeAndArithmetic/ics312_datasize.pdf
;Assembly输入输出和调试
;   汇编可以使用标准C的I/O程序库
;   print_int   print_char  print_string
;   print_nl显示换行    read_int    read_char
;   在汇编中包含头文件 %include "asm_io_inc"
;   dump_regs   dump_mem   dump_stack   dump_math 分别显示寄存器、内存、堆栈和数字协处理器的值


; Assembly 正负号延伸   
;   mov ax,0034h ; ax寄存器储存52（十进制）
;   mov cl al ;cl寄存器取al的低8位 
;Size Reduction 尺寸减少
;   mov ax,000A2h;  ax=A2 (162)                            mov bl,al;      bl=A2 (162)
;   mov ax,00101h;  ax=101 (257) ;doesn't work 257>255     mov bl,al;      bl=1   (1)
;Size Reduction and Sign 带符号的情况下   
;   0xFFF4(65524)  2个字节 0xFF 0xF4   
;   as unsigned  mov ax.0FFF4h; mov bl,al; ==>(0xF4) error
;   as signed   ==> (-0xc) -12 error
;   
;16位的数值截取低8位   
;   For unsigned numbers 当高8位全为0   
;   For signed numbers   当高8位全为0或全为1
;Unsigned size increase   
;   unsigned 1-byte number to be a 2-byte unsigned number?
;           mov al,0EDh;    mov ah,0;   mov ...,ax;
;   unsigned 2-byte number to be a 4-byte unsigned number? using movzx
;           movzx eax,ax;   movzx eax,al;   movzx ax,al;    movzx ebx,ax;
;           movzx ebx,[L];  movzx ebx,byte[L];   movexz eax,word[L];
;
;
;   // https://zhuanlan.zhihu.com/p/469950256
;;
;;
;;
;;