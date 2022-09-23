## Interupts

They are like subroutines, but we dont need to know the memory address to invoke them

When we invoke an interrupt  |
-----------------------------|
processor is interrupted     | 
old state saved on stack     | 
interrupt executed           |


Interrupt vector table 
 Markup : *
          *
          *interrupts are in numerical order in the table
          *starts with 0 in ram 
          *offset is 2 bytes
          *segment is 2 bytes---total 2+2=4
 Markup : * table describing 256 interrupt handlers
          * entries contain 4 bytes (offset-segemnt)
          *interrupts are in numerical order in the table
          *starts with 0 in ram 
                  * offset is 2 bytes
                  * segment is 2 bytes---total 2+2=4
                  
interrupts 0=adress 0x00
interrupts 1=adress 0x04
interrupts 2=adress 0x08