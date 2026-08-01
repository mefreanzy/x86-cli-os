#!/bin/bash

nasm -f bin boot/boot.asm -o boot/boot.bin

nasm -f bin boot/stage2.asm -o boot/stage2.bin

i686-elf-gcc -ffreestanding -m32 -c kernel.c -o boot/kernel.o

i686-elf-ld -T linker.ld boot/kernel.o -o boot/kernel.elf

i686-elf-objcopy -O binary boot/kernel.elf boot/kernel.bin

dd if=/dev/zero of=os.img bs=512 count=100
dd if=boot/boot.bin of=os.img bs=512 seek=0 conv=notrunc
dd if=boot/stage2.bin of=os.img bs=512 seek=1 conv=notrunc
dd if=boot/kernel.bin of=os.img bs=512 seek=9 conv=notrunc

qemu-system-i386 -drive format=raw,file=os.img