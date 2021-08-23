; GDT
gdt_start:

gdt_null: ; Mandantory Null Descriptor
    dd 0x0
    dd 0x0

gdt_code:
    dw 0xffff ; Limit
    dw 0x0 ; base
    db 0x0 ; base
    db 10011010b ; 1st Flag(Present, privilege, DT), Type Flag(Code, Conforming, readable, accessed)
    db 11001111b ; 2nd Flag(Granularity, 32-bit default, 64-bit code segment, AVL), Limit
    db 0x0

gdt_data:
    dw 0x0ffff ;Limit
    dw 0x0 ; Base 
    db 0x0 ; Base
    db 10010010b ; Only difference is code flag since its data segment
    db 11001111b
    db 0x0

gdt_end: ; Putting gdt_start and gdt_end for gdt size calculation

gdt_descriptor: ;(gdt_size, gdt_address)
    dw gdt_end - gdt_start - 1
    dd gdt_start


CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
