%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ;;Loop for iterating through the string and for shifting.
    mov ebx, 0          ; counter
    mov eax, 0          ; character

loop:
    cmp ebx, ecx        ; checking ending condition
    je endloop
    mov al, [esi + ebx] ; extract the current element
    cmp al, 65          ; checks A
    jl noshift          ; Jump if the current character <A
    cmp al, 90          ; checks Z
    jg noshift          ; Jump if the current character Z<
    sub al, 65          ; extracts index 65
    add al, dl          ; Shifts
    cmp al, 25          ; checking if it exceeds Z
    jle nooverflow      ; Jump if the character is between 'A'-'Z'
    sub al, 26     

nooverflow:
    add al, 65         

noshift:
    mov [edi + ebx], al ; puts the character in the string
    inc ebx             ; counter++
    jmp loop

endloop:

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY
