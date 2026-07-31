[org 0x1000]
bits 16

mov ah, 0x0e
mov al, 'S'
int 0x10
mov al, '2'
int 0x10

A20:
    in al, 0x92
    or al, 2
    out 0x92, al

ProtectMode:
    cli
    lgdt [GDTDescriptor]

    mov eax, cr0
    or eax, 0x01
    mov cr0, eax

    jmp 0x08:Stage32

align 4
GDT:
    dd 0x0
    dd 0x0

GDTCode:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x9A
    db 0xCF
    db 0x00

GDTData:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 0x92
    db 0xCF
    db 0x00

GDTEnd:
GDTDescriptor:
    dw GDTEnd - GDT - 1
    dd GDT

bits 32
Stage32:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0x90000    

    mov edx, 0xB8000
    mov al, 'K'
    mov ah, 0x4F
    mov [edx], ax


    jmp $
