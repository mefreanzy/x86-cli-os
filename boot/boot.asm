[org 0x7c00]

_start:
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0x7C00

    mov ah, 0x0e 
    mov al, 'H'
    int 0x10
    mov al, 'I'
    int 0x10

    mov ah, 0x42 
    mov si, DAPACK
    int 0x13

jc DiskError

jmp 0x0000:0x1000

DiskError:
    mov ah, 0x0e
    mov al, 'E'
    int 0x10
End:
    cli
    hlt
    jmp End

align 4
DAPACK:
	db	0x10
	db	0
    dw	8
    dw	0x1000
    dw	0x0000
    dq	1


times 510 - ($ - $$) db 0
dw 0xaa55
