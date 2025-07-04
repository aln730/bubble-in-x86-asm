Original: [7, 3, 8, 4, 2]

Pass 1:   [3, 7, 4, 2, 8]

Pass 2:   [3, 4, 2, 7, 8]

Pass 3:   [3, 2, 4, 7, 8]

Pass 4:   [2, 3, 4, 7, 8]   ← Sorted!


`nasm -f elf32 bubble.asm -o bubble.o
ld -m elf_i386 bubble.o -o bubble
gdb ./bubble
`
