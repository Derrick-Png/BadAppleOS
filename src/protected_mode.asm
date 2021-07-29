

switch_to_pm:
    cli

    lgdt [gdt_descriptor]

    mov eax, cr0
    or eax, 0x1
    mov cr0, eax

    
    jmp CODE_SEG:init_pm ; Handle pipelining

[bits 32]
init_pm:
    ; Reload Segment registers
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ;Update stack pointer
    mov ebp, 0x90000 
    mov esp, ebp

    jmp main