ORG 0x7c00
BITS 16

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
_start:
    jmp short start
    nop

times 33 db 0 ;created 33bytes of safe space

start:
    jmp 0:step2

step2:
    cli ; Clear (Disable) interrupts
    mov ax, 0x00
    mov ds, ax ;datasegmnt
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    sti ; Enables Interrupts

.load_protected:
    cli ;clear interrupts
    lgdt[gdt_descriptor] ;load global descriptor table
    mov eax,cr0
    or eax,0x1
    mov cr0,eax
    jmp CODE_SEG:load32 ;codeselctoe --jmps to load32

;GDT
gdt_start:
gdt_null:
    dd 0x0
    dd 0x0
;offset 0x8
gdt_code: ;CS SHOULD POINT TO THIS
    dw 0xffff ;Segment limit first 0-15 bits
    dw 0    ;Base first 0-15 bits
    db 0    ;base 16-23 bits
    db 0x9a ;access style
    db 11001111b ;High 4 bit flags and the low 4 bit flags
    db 0  ;Base 24-31 bits

;offset 0x10
gdt_data:   ; linked to DS SS ES FS GS
    dw 0xffff ;Segment limit first 0-15 bits
    dw 0    ;Base first 0-15 bits
    db 0    ;base 16-23 bits
    db 0x92 ;access style
    db 11001111b ;High 4 bit flags and the low 4 bit flags
    db 0  ;Base 24-31 bits

gdt_end:
gdt_descriptor:
    dw gdt_end - gdt_start-1 ;size
    dd gdt_start

[BITS 32]
load32:
    mov ax,DATA_SEG
    mov ds,ax
    mov es,ax
    mov fs,ax
    mov gs,ax
    mov ss,ax
    mov ebp,0x002000000
    mov esp,ebp
    in al, 0x92
    or al, 2
    out 0x92, al
    ;enable the a20 line
    jmp $

times 510-($-$$) db 0
dw 0xAA55

buffer: ;db 'hello world--this will never load