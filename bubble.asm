section .data
    array dd 7,3,8,4,2      ; dd = 32-bit integers
    size  equ 5             ; number of elements

section .text
    global _start

_start:
    mov edi, size           ; outer loop counter
    dec edi                 ; runs from 0 to size - 2

outer_loop:
    mov esi, 0              ; inner index = 0
    mov ecx, size
    dec ecx                 ; inner loop runs size - 1 times

inner_loop:
    mov eax, [array + esi*4]           ; eax = array[esi]
    mov ebx, [array + (esi+1)*4]       ; ebx = array[esi + 1]
    cmp eax, ebx
    jle no_swap

    ; Swap array[esi] and array[esi + 1]
    mov [array + esi*4], ebx
    mov [array + (esi+1)*4], eax

no_swap:
    inc esi
    dec ecx
    jnz inner_loop

    dec edi
    jnz outer_loop

hang:
    jmp hang
