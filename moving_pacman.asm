;0x0e200e20
mov dword[0x10000000],160
start:
    push 10
    push 10
    call show_pacman
    add esp, 8
    #stop

; dword [ebp+ 8] => Row
; dword [ebp+12] => Colum
show_pacman:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov dword [ebp-4], 0x1e021e01 ; Current pacman
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    mov edx,esi
$loop:

    #show edx
    #show esi
    mov dword [edx], 0x0e200e20
    mov ebx, dword [ebp-4]
    mov dword [esi], ebx

    push 50
    call delay
    add esp, 4
    
$test_keys:
    mov ah, byte [0xffff0004] ; Keypad
    mov al, ah
    
    ; Left key
    and al, 0x1
    test al, al
    jz $test_right
    mov edx, esi
    #show edx
    dec esi
    mov dword [ebp-4], 0x1e041e03 ; Pacman left
    jmp $loop
        
$test_right:
    mov al, ah
    and al, 0x2
    test al, al
    jz $test_down
    mov edx, esi
    inc esi
    mov dword [ebp-4], 0x1e021e01 ; Pacman right
    jmp $loop

$test_down:
    mov al, ah
    and al, 0x4
    test al, al
    jz $test_up
    ;mov dword[0x10000000],2
    ;shl dword[0x10000000],3
    ;add dword[0x10000000], 96
    #show dword[0x10000000]
    mov edx, esi
    add esi , dword[0x10000000]
    mov dword [ebp-4], 0x1e081e07 ; Pacman up
    jmp $loop

$test_up:
    mov al, ah
    and al, 0x8
    test al, al
    jz $test_q
    mov edx, esi
    sub esi, dword[0x10000000]
    mov dword [ebp-4], 0x1e061e05 ; Pacman up
    jmp $loop

$test_q:
    mov al, ah
    and al, 0x10
    test al, al
    jnz $end_loop
    
    jmp $test_keys

$end_loop:
    #show al binary
    mov esp, ebp
    pop ebp
    ret
        
delay:
    mov eax, dword [0xffff0008]
    add eax, dword [esp + 4]
$delay_loop:
    cmp dword [0xffff0008], eax
    jl $delay_loop
    ret