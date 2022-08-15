ORG 0x7c00 ;Assembly origin--so that assembler kns how to offset our data
;ideally orgin must be 0 but we jump to 0x7c00
BITS 16 ; will ensure that assembler will only assemble assembly instructions in 16 biy register

start:
    mov ah, 0eh ;move 0eh to ah register ;0eh is cmd to print that character in next line
    mov al, 'A'
    mov bx, 0 ;setting pg num
    int 0x10 ;calling BIOS--we are telling how to put A onto screen---VIDEO TELETYPE OUTPUT
        ; ah-0eh
        ; al char to type
        ; bh page number
        ; bl foregraound color(graphics only)
    jmp $ ;keep jumping to line 10

times 510-($-$$) db 0;says needs to fill atleast 510 bytes of data;db 0 means if not used data--it will pad with 0
dw 0xAA55 ;little endian so it will be written as 55AA only--boot signature--2 bytes -puts binary num



    


