; The routine for printing in 32-bit
[bits 32]
VIDEO_MEMORY equ 0xb8000 ; Start of Screen
WHITE_ON_BLACK equ 0x0f ; Color White

; before loop
print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY
    

; Writing values to the video memory
print_string_pm_loop:
    mov al, [ebx] ; ebx is the string offset
    mov ah, WHITE_ON_BLACK ; Setting white on "writer"
    ;visually what is pushed into edx is 0x[ah][al]
    cmp al, 0
    je print_string_pm_done

    mov [edx], ax ; writer
    
    inc ebx ;  increase string offset
    add edx, 2 ; Moving over to next character cell for printing

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret