```
sudo apt install nasm
sudo apt install qemu-system-x86
## To make bin file
nasm -f bin ./boot.asm  -o ./boot.bin 
## To check contents
ndisasm ./boot.bin
## To launch qemu
qemu-system-x86_64 -hda ./boot.bin
```
