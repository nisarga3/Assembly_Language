# Instructions
```
sudo apt install nasm
sudo apt install qemu-system-x86
```
## To make bin file
```
nasm -f bin ./boot.asm  -o ./boot.bin 
```
## To check contents
```
ndisasm ./boot.bin
```
## To launch qemu
```
qemu-system-x86_64 -hda ./boot.bin
```
## To load to usb stick

show all disks in the system
```
sudo fdisk -l

```
copy binary to the disk
```
sudo dd if=./boot.bin of=/dev/sdb
```

Make a Makefile

## To read the bin file
```
sudo apt install bless
bless ./boot_read.bin
```



## Global file descriptor
```
sudo apt install gdb
target remote | qemu-system-  -hda ./pro.bin -S -gdb stdio
c
type ctrl+C  sigint
layout asm
info register
```

Restructure the project
Enable A20 line
## To run on online emulator
```$ make       ```                                                              //to compile and make an executable
```$ cd bin     ```                                                            //to switch to binary file and operate on gdb

```$ target remote | qemu-system-x86_64 -hda ./boot.bin -S gdb stdio  ```       //to run onthe emulator
prompt to continue appears
press c
```$ layout asm       ```                                                       //to view how values are stored on the memory
