section .data
    array dd 7,3,8,4,2      ; dd -> 32-bit
    size equ 5

section .text
    global _start

_start:
    mov ecx, size   ; ecx = size
    dec ecx         ; ecx = size -1
outer_loop:
    push ecx        ; save outer loop counter

    mov esi, 0        ; esi = j = 0
    mov ecx, size
    dec ecx           ; inner loop runs from j = 0 to size - 2
inner_loop:
    mov eax, [array + esi*4]        ; eax = array[j]
    mov ebx, [array + esi*4 + 4]    ; ebx = array[j+1]
    cmp eax, ebx                    ; if array[j] > array[j+1]
    jle no_swap                     ; if less or equal, skip swap

    ; swap array[j] and array[j+1]
    mov [array + esi*4], ebx
    mov [array + esi*4 + 4], eax
no_swap:
    inc esi        ; j++
    dec ecx        ; loop control
    jnz inner_loop ; jump if ecx != 0

    pop ecx
    dec ecx
    jnz outer_loop

;exit
    mov eax, 1    ; sys_exit
    xor ebx, ebx  ; return code 0
    int 0x80
