$ make                                                                     //to compile and make an executable
$ cd bin                                                                 //to switch to binary file and operate on gdb

$ target remote | qemu-system-x86_64 -hda ./boot.bin -S gdb stdio         //to run onthe emulator
prompt to continue appears
press c
$ layout asm                                                              //to view how values are stored on the memory
