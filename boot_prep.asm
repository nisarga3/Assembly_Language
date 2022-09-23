ORG 0
BITS 16
;prev boot_improved----in start block
    ;jmp $ ;corrupted--causes program to run continuously in RAM

_start:
    jmp short start
    nop

times 33 db 0 ;created 33bytes of safe space

start:
jmp 0x7c0:step2

step2:
    cli ; Clear (Disable) interrupts
    mov ax, 0x7c0
    mov ds, ax ;datasegmnt
    mov es, ax
    ;since stack grows downwards
    mov ax, 0x00
    mov ss, ax
    mov sp, 0x7c00

    sti ; Enables Interrupts
    mov si, message
    call print
    ;jmp $ ;corrupted--causes program to run continuously in RAM

print:
    mov bx, 0
.loop:
    lodsb ;load character that si register points to and it will load to al register and it will increment si regsiter
    cmp al,0 ;compare al.,,if(al==0)
    je .done 
    call print_char ;else
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh ;function to output to screen
    int 0x10
    ret ;return frm the sub routine

message: db 'Welcome to Lilac OS' ,0

times 510-($-$$) db 0
dw 0xAA55