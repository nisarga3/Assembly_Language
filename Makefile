all:
	nasm -f bin ./boot_read.asm  -o ./boot_read.bin 
	dd if=./message.txt >> ./boot_read.bin
	dd if=/dev/zero bs=512 count=1 >> ./boot_read.bin
	they are for reading frm hard disk