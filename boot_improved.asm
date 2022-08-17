ORG 0
BITS 16
; with the prev bootloader boot1.asm we dont know if will load on all systems as the origin is 0x7c00
;with org as 0x7c00, mem calculation
;ds* 16+ 0x7c00
;DS= 0x7c0
;0x7c00 + 0x7c00 which doesnt point to our msg 
;thats why we should initsiliase data segment and other segments;;;; so we change origin here
jmp 0x7c0:start ;code segment is changed

start:
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
    jmp $

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

message: db 'Hello World' ,0

times 510-($-$$) db 0
dw 0xAA55