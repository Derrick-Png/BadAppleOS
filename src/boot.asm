[org 0x7c00]

    mov bp, 0x9000
    mov sp, bp

    call switch_to_pm

    jmp $

%include "gdt.asm"
%include "protected_mode.asm"

; Trying to insert code aft this line  (idk what happens if you dont)

%include "display.asm" 
%include "main.asm"

the_string:
    db "What does the fox say?", 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa