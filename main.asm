section .data
    array1 dd 2, 4, 6, 8, 10, 20, 40
    array2 dd 7 dup(0)  ; Allocate space for 7 elements
    factor dd 2
    len equ ($ - array1) / 4

section .text
    global main
    extern printf

    print_format db "Array element %d: %d", 10, 0

main:
    ; Print original array elements
    mov ecx, len
    mov esi, array1
    mov edi, array2

print_loop:
    mov eax, [esi]
    push eax
    push ecx
    push len
    push print_format
    call printf
    add esp, 16

    ; Multiply element by factor and store in array2
    mov ebx, factor
    mul ebx
    mov [edi], eax

    add esi, 4
    add edi, 4
    loop print_loop

    ; Exit program
    mov eax, 1
    int 0x80
