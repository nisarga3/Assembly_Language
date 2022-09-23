## Interupts

They are like subroutines, but we dont need to know the memory address to invoke them

when we invoke an interrupt
processor is interrupted
old state svaed on stack
interrupt executed
when we invoke an interrupt |
------------- --------------| -------------
processor is interrupted    | Content Cell
old state saved on stack    | Content Cell
interrupt executed          | Content Cell

Interrupt vector table 
-table describing 256 interrupt handlers
-entries contain 4 bytes (offset-segemnt)
-interrupts are in numerical order in the table
-starts with 0 in ram 
offset is 2 bytes
segemnt is 2 bytes---total 2+2=4
interrupts 0=adress 0x00
interrupts 1=adress 0x04
interrupts 2=adress 0x08

