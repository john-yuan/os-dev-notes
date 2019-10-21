    [org 0x7c00]
    mov bx, HELLO_MSG
    call print_string

    jmp $

    %include 'print_string.asm'

HELLO_MSG:
    db 'Hello, world'

    times 510 - ($ - $$) db 0
    dw 0xaa55
