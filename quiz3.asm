section .data
  x db 5                 ; factorial to compute
  buf db '000',10        ; three digit slots + newline

section .text
    global _start

_start:
; compute factorial in EAX register
    movzx ecx, byte [x]     ; counter = x
    mov   eax, 1            ; accumulator = 1

.calc:
    cmp   ecx, 1
    jle   .print            ; jump if less or equal operation
    mul   ecx               ; EAX *= ECX
    dec   ecx
    jmp   .calc             ; jump back up to .calc

.print:
    ; extract hundreds digit
    mov   ebx, 100
    xor   edx, edx
    div   ebx               ; EAX=hundreds, EDX=remainder
    add   al, '0'
    mov   [buf], al

    ; extract tens digit
    mov   eax, edx
    mov   ebx, 10
    xor   edx, edx
    div   ebx               ; EAX=tens, EDX=ones
    add   al, '0'
    mov   [buf+1], al

    ; 4) extract ones digit
    add   dl, '0'
    mov   [buf+2], dl

    ; 5) write 4 bytes (3 digits + newline)
    mov   eax, 4            ; sys_write
    mov   ebx, 1            ; stdout
    mov   ecx, buf
    mov   edx, 4
    int   0x80

    mov     eax, 1            ; sys_exit
    xor     ebx, ebx
    int     0x80

