print_string:
    pusha
    mov ah, 0x0e

print_string_cmp:
    mov al, [bx]
    cmp al, 0
    jne print_string_putc
    jmp print_string_end

print_string_putc:
    int 0x10
    add bx, 0x01
    jmp print_string_cmp

print_ln:
    pusha

    mov ah, 0x0e
    mov al, 0x0a
    int 0x10

    mov al, 0x0d
    int 0x10

    jmp print_string_end

print_string_end:
    popa
    ret

