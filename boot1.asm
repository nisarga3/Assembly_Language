ORG 0x7c00
BITS 16

start:
    mov si, message
    call print
    jmp $

print:
    mov bx, 0
.loop:
    lodsb ;load character that si register points to and it will load to al register and it will increment si regsiter
    cmp al,0 ;comapre al.,,if(al==0)
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