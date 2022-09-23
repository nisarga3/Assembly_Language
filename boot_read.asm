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

;ralf browns interrupt 13 list
; AH = 02h
; AL = number of sectors to read (must be nonzero)
; CH = low eight bits of cylinder number
; CL = sector number 1-63 (bits 0-5)
; high two bits of cylinder (bits 6-7, hard disk only)
; DH = head number
; DL = drive number (bit 7 set for hard disk)
; ES:BX -> data buffer

; Return:
; CF set on error
; if AH = 11h (corrected ECC error), AL = burst length
; CF clear if successful
; AH = status (see #00234)
; AL = number of sectors transferred (only valid if CF set for some
; BIOSes)


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


    mov ah, 2 ;READ SECTOR COMMAND
    mov al, 1 ;ONE SECTOR TO READ
    mov ch, 0 ;Cylinder low eight bits
    mov cl, 2 ;read sector two
    mov dh, 0 ;Head number
    mov bx,buffer
    int 0x13 ;invoke read cmd
    jc error;jumpcarry

    mov si,buffer
    call print
    jmp $

error:
    mov si,error_message
    call print
    jmp $ ;corrupted--causes program to run continuously in RAM

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

error_message: db 'Failed to load sector', 0
; message: db 'Welcome to Lilac OS' ,0

times 510-($-$$) db 0
dw 0xAA55

buffer: ;db 'hello world--this will never load