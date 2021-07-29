
the_imported_print:
    cmp byte [bx], 0
    je return
    mov ah, 0x0e
    mov al, byte [bx]
    int 0x10
    inc bx
    jmp the_imported_print
return:
    ret
