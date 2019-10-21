; Print the hex of the number in the dx register
; dx = 0xABCD

print_hex:
    pusha
    mov bx, HEX_OUT

    mov ax, dx                      ; ax = 0xABCD
    shr ax, 12                      ; ax = 0x000A
    call print_hex_convert_to_char  ; al = 'A'
    add bx, 0x0002                  ; bx = HEX_OUT + 2
    mov [bx], al                    ; [HEX_OUT + 2] = 'A'

    mov ax, dx                      ; ax = 0xABCD
    and ax, 0x0F00                  ; ax = 0x0B00
    shr ax, 8                       ; ax = 0x000B
    call print_hex_convert_to_char  ; al = 'B'
    add bx, 0x0001                  ; bx = HEX_OUT + 3
    mov [bx], al                    ; [HEX_OUT + 3] = 'B'

    mov ax, dx                      ; ax = 0xABCD
    and ax, 0x00F0                  ; ax = 0x00C0
    shr ax, 4                       ; ax = 0x000C
    call print_hex_convert_to_char  ; al = 'C'
    add bx, 0x0001                  ; bx = HEX_OUT + 4
    mov [bx], al                    ; [HEX_OUT + 4] = 'C'

    mov ax, dx                      ; ax = 0xABCD
    and ax, 0x000F                  ; ax = 0x000D
    call print_hex_convert_to_char  ; al = 'D'
    add bx, 0x0001                  ; bx = HEX_OUT + 5
    mov [bx], al                    ; [HEX_OUT + 5] = 'D'

    mov bx, HEX_OUT
    call print_string
    popa
    ret

print_hex_convert_to_char:
    cmp ax, 9
    jg print_hex_convert_to_letter  ; ax > 9
    add ax, 48                      ; ax += '0'
    ret

print_hex_convert_to_letter:
    add ax, 55                      ; ax = ax + 'A' - 10
    ret

HEX_OUT:
    db '0x0000', 0
