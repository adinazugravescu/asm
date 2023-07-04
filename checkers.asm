
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x = line
    mov ebx, [ebp + 12]	; y = column
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

   ;; Check if current position is valid
   ;; If the current position allows, update the position in the top left corner
    push eax    ;push eax onto the stack
    mov edx, eax    ;edx is the index for current element`s line
    add edx, 1      ;add 1 for valid check
    cmp edx, 7      ; > 7 ,then it is invalid
    jg skip_left_up
    mov esi, ebx    ;esi is the index for current element`s column
    sub esi, 1      ;subtsract 1 for valid check
    cmp esi, 0      ; < 0, then it is invalid
    jl skip_left_up
    mov edi, edx    ;valid case,then edi stores the line`s index(for new element)
    shl edi, 3   ;8*line
    add edi, esi    ;line+col
    mov al, byte [ecx + edi]
    cmp al, 0   ;check new element
    jne skip_left_up
    mov byte [ecx + edi], 1 ;if the value is 0, it becomes 1 on that position 
    
    	;; There are 4 cases to handle, for the other 3 the only difference is
	;; the conditions for the current position to allow the desired position
	;; the calculation of the offset for the new position remains the same
	;; through the conditions for elCrt to allow the desired position, it is modified
	;; the line and column counters, which will be used later
	;; in the calculation of the offset

skip_left_up:
    ;; Check if current position is valid
    ;; If the current position allows, update the position in the top right corner
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
    ;; Check if current position is valid
    ;; If the current position allows, update the position in the bottom left corner
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
    ;; Check if current position is valid
    ;; If the current position allows, update the position in the bottom right corner
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
