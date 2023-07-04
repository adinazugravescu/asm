
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x = linia
    mov ebx, [ebp + 12]	; y = coloana
    mov ecx, [ebp + 16] ; tabelul

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    ;;Verificare pozitie curenta valida
    ;;Daca pozitia curenta admite, actualizarea poziției din stânga sus
    push eax    ;se pune eax pe stiva
    mov edx, eax    ;edx este indicele pentru linia elCrt
    add edx, 1      ;se adauga 1 pentru verificare valid
    cmp edx, 7      ;daca este > 7 ,nu e valid
    jg skip_left_up
    mov esi, ebx    ;esi indicele pentru coloana elCrt
    sub esi, 1      ;se scade 1 pentru verificare valid
    cmp esi, 0      ;daca < 0, nu e valid
    jl skip_left_up
    mov edi, edx    ;caz valid,deci in edi se pune linia pentru elNou
    shl edi, 3   ;8*linia
    add edi, esi    ;linie+col
    mov al, byte [ecx + edi]
    cmp al, 0   ;verificare daca elNou nu este deja 1
    jne skip_left_up
    mov byte [ecx + edi], 1 ;daca este 0, se pune 1 pt pozitia 
    
    ;;sunt astfel 4 cazuri de tratat, la celelalte 3 difera doar
    ;;conditiile ca pozitia curenta sa admita pozitia dorita
    ;;calculul offsetului pentru noua pozitie ramane acelasi
    ;;prin conditiile ca elCrt sa admita pozitia dorita, se modifica
    ;;contorii de linie si coloana, care vor servi ulterior
    ;;in calculul offsetului

skip_left_up:
    ;;Verificare pozitie curenta valida
    ;;Daca pozitia curenta admite, actualizarea poziției din dreapta sus
    pop eax
    mov edx, eax
    push eax
    add edx, 1
    cmp edx, 7
    jg skip_right_up
    mov esi, ebx
    add esi, 1
    cmp esi, 7
    jg skip_right_up
    mov edi, edx
    shl edi, 3
    add edi, esi
    mov al, byte [ecx + edi]
    cmp al, 0
    jne skip_right_up
    mov byte [ecx + edi], 1

skip_right_up:
    ;;Verificare pozitie curenta valida
    ;;Daca pozitia curenta admite, actualizarea poziției din stânga jos
    pop eax
    mov edx, eax
    push eax
    sub edx, 1
    cmp edx, 0
    jl skip_left_down
    mov esi, ebx
    sub esi, 1
    cmp esi, 0
    jl skip_left_down
    mov edi, edx
    shl edi, 3
    add edi, esi
    mov al, byte [ecx + edi]
    cmp al, 0
    jne skip_left_down
    mov byte [ecx + edi], 1

skip_left_down:
    ;;Verificare pozitie curenta valida
    ;;Daca pozitia curenta admite, actualizarea poziției din dreapta jos
    pop eax
    mov edx, eax
    push eax
    sub edx, 1
    cmp edx, 0
    jl skip_right_down
    mov esi, ebx
    add esi, 1
    cmp esi, 7
    jg skip_right_down
    mov edi, edx
    shl edi, 3
    add edi, esi
    mov al, byte [ecx + edi]
    cmp al, 0
    jne skip_right_down
    mov byte [ecx + edi], 1

skip_right_down:
    pop eax

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY