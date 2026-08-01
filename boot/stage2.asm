[org 0x1000]
bits 16


start:

    mov ah,0x0e
    mov al,'S'
    int 0x10

    mov al,'2'
    int 0x10



    mov ah,0x42
    mov si,KernelDAP
    int 0x13

    jc DiskError




    in al,0x92
    or al,2
    out 0x92,al




    cli

    lgdt [GDTDescriptor]


    mov eax,cr0
    or eax,1
    mov cr0,eax


    jmp 0x08:Stage32



DiskError:

    mov ah,0x0e
    mov al,'E'
    int 0x10

    jmp $



align 4

GDT:

dq 0


dw 0xffff
dw 0
db 0
db 10011010b
db 11001111b
db 0


dw 0xffff
dw 0
db 0
db 10010010b
db 11001111b
db 0


GDTEnd:


GDTDescriptor:

dw GDTEnd-GDT-1
dd GDT

KernelDAP:

db 0x10
db 0

dw 32          
dw 0x0000
dw 0x1000      

dq 9           


bits 32

Stage32:


mov ax,0x10

mov ds,ax
mov es,ax
mov fs,ax
mov gs,ax
mov ss,ax


mov esp,0x90000



call 0x10000



jmp $