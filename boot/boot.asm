[org 0x7c00]
bits 16

start:

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00


    mov ah,0x0e
    mov al,'1'
    int 0x10


    mov ah,0x42
    mov si,DAPACK
    int 0x13

    jc disk_error


    jmp 0x0000:0x1000



disk_error:

    mov ah,0x0e
    mov al,'E'
    int 0x10

hang:
    hlt
    jmp hang



DAPACK:

db 0x10
db 0

dw 8              ; stage2 sektör sayısı

dw 0x1000         ; offset
dw 0x0000         ; segment

dq 1              ; LBA 1



times 510-($-$$) db 0
dw 0xaa55