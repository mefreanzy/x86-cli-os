mov ax, 0xB800
mov es, ax

mov al, 'A'
mov ah, 0x07

mov [es:0], al
mov [es:1], ah