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

    ;; Bucla pentru parcurgerea stringului si pentru shiftare
    mov ebx, 0          ; Contor
    mov eax, 0          ; Caracter

loop:
    cmp ebx, ecx        ; Verificare final
    je endloop
    mov al, [esi + ebx] ; Extragem elementul curent
    cmp al, 65          ; Verificam pentru A
    jl noshift          ; Jump daca caracterul curent nu este litera mare(<A)
    cmp al, 90          ; Verificam pentru Z
    jg noshift          ; Jump daca caracterul curent nu este litera mare(Z<)
    sub al, 65          ; Extragem indexul 65
    add al, dl          ; Shiftare
    cmp al, 25          ; Verificare daca "trece" de Z
    jle nooverflow      ; Jump daca caracterul se afla in intervalul 'A'-'Z'
    sub al, 26     

nooverflow:
    add al, 65         

noshift:
    mov [edi + ebx], al ; Scrierea caracterului in string
    inc ebx             ; Incrementare contor
    jmp loop

endloop:

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY
