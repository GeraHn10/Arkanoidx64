start:
    push 0; livesbyteposition [ebp+72]
    push 3;vida [ebp+68]
    push 0;delayx2 [ebp+64]
    push 1;LiveMalo5 [ebp+ 60]
    push 1;LiveMalo4 [ebp+ 56]
    push 1;LiveMalo3 [ebp+ 52]
    push 1;LiveMalo2 [ebp+ 48]
    push 1;LiveMalo1 [ebp+ 44]
    push 0;posInicialBall [ebp+ 40]
    push 1;ColumnAdderBALL [ebp+ 36]
    push 1;rowadderBall  [ebp+ 32]
    push 0;posAntriorball [ebp+ 28]
    push 0;posbytesball   [ebp+ 24]
    push 39;Column Ball  [ebp+ 20]
    push 27;Row Ball  [ebp+ 16]
    push 39;Column bar   [ebp+ 12]
    push 29;Row bar  [ebp+ 8]
    call calculate
    add esp, 64
    #stop
 
    ;42-41= total de columan agarradas por malo
; #show  dword [ebp+ 8] => Row
; #show dword [ebp+12] => Colum

calculate:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov dword [ebp-4], 0x1e201e20 ; Current pacman
 
    mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
   sub esi,2

mov edx,0xb800

mov dword[edx],0x1e10
add edx,2
#show edx
paintTop:
mov dword[edx],0x1e201e20
add edx,2
cmp edx,0xB89E
jl paintTop


mov edx,0xb800
mov dword[edx],0x1e551e20
add edx,4
mov dword[edx],0x1e491e20
add edx,4
mov dword[edx],0x1e441e20
add edx,4
mov dword[edx],0x1e411e20
add edx,4
mov dword[edx],0x1e531e20
add edx,4
mov dword[edx],0x1e3A1e20
add edx,4
mov dword[edx],0x1e331e20
mov dword[ebp+72],edx


draw_malos:
mov edx,0xb800  
add edx,970 ; columna 5
mov dword[edx], 0x1e201e20 
mov dword[edx+4], 0x1e201e20  
mov dword[edx+8], 0x1e201e20   
mov dword[edx+12], 0x1e201e20
mov dword[edx+16], 0x1e201e20

add edx,28 ; columna 19
mov dword[edx], 0x1e201e20
mov dword[edx+4], 0x1e201e20
mov dword[edx+8], 0x1e201e20
mov dword[edx+12], 0x1e201e20
mov dword[edx+16], 0x1e201e20

add edx,28
mov dword[edx], 0x1e201e20
mov dword[edx+4], 0x1e201e20
mov dword[edx+8], 0x1e201e20
mov dword[edx+12], 0x1e201e20
mov dword[edx+16], 0x1e201e20


add edx,28
mov dword[edx], 0x1e201e20
mov dword[edx+4], 0x1e201e20
mov dword[edx+8], 0x1e201e20
mov dword[edx+12], 0x1e201e20
mov dword[edx+16], 0x1e201e20

add edx,28
mov dword[edx], 0x1e201e20
mov dword[edx+4], 0x1e201e20
mov dword[edx+8], 0x1e201e20
mov dword[edx+12], 0x1e201e20
mov dword[edx+16], 0x1e201e20

    
draw_ball:
mov eax,esi
sub eax,160
mov dword[ebp+28],eax

;#show eax
sub eax,160
;#show eax
mov dword[ebp+24],eax
mov dword[ebp+40],eax
;#show eax
regreso:
mov eax,dword[ebp+40]
mov [ebp+24],eax
mov eax,27
mov dword[ebp+16],eax
mov eax,39
mov dword[ebp+20],eax

$move_bar:
    mov ebx,dword[ebp+68]
    cmp ebx,2
    je printtwo
    mov ebx,dword[ebp+68]
    cmp ebx,1
    je printone
    jmp $continuebar
    printtwo:
    mov ebx,dword[ebp+72]
    mov dword[ebx],0x1e321e20
    jmp $continuebar
    printone:
    mov ebx,dword[ebp+72]
    mov dword[ebx],0x1e311e20
    jmp $continuebar

    printzero:
    mov ebx,dword[ebp+72]
    mov dword[ebx],0x1e30e20
    jmp $continuebar
    ;#show ebx
    
$continuebar:
    mov ebx, 0x1e200e11
    mov dword [esi], ebx
    mov ebx, dword [ebp-4]
    mov dword [esi+4], ebx
    mov ebx, dword [ebp-4]
    mov dword [esi+8], ebx
    mov ebx, dword [ebp-4]
    mov dword [esi+12], ebx
    mov ebx, 0x0e101e20
    mov dword [esi+16], ebx
   

   
    
    posiblegane:
    mov edx,dword[ebp+44]
    mov ecx,dword[ebp+48]
    add edx,ecx
    mov ecx,dword[ebp+52]
    add edx,ecx
    mov ecx,dword[ebp+56]
    add edx,ecx
    mov ecx,dword[ebp+60]
    add edx,ecx
    cmp edx,0
    je ganaste
    jmp perdiste
    ganaste:
    mov ebx,dword[ebp+72]
    add ebx,40
    mov dword[ebx],0x1e471e20 ;G
    add ebx,4
    mov dword[ebx],0x1e411e20 ;A
    add ebx,4
    mov dword[ebx],0x1e4e1e20 ;N
    add ebx,4
    mov dword[ebx],0x1e411e20 ;a
    add ebx,4
    mov dword[ebx],0x1e531e20 ;s
    add ebx,4
    mov dword[ebx],0x1e541e20 ;T
    add ebx,4
    mov dword[ebx],0x1e451e20 ;E
    add ebx,4
    mov dword[ebx],0x1e131e20 ;!!
    jmp $end_loop
    
    perdiste:
    mov edx,dword[ebp+68]
    cmp edx,0
    je perdistePrint
    jmp kepp
    perdistePrint:
    mov ebx,dword[ebp+72]
    add ebx,40
    mov dword[ebx],0x1e501e20 ;P
    add ebx,4
    mov dword[ebx],0x1e451e20 ;E
    add ebx,4
    mov dword[ebx],0x1e521e20 ;R
    add ebx,4
    mov dword[ebx],0x1e441e20 ;D
    add ebx,4
    mov dword[ebx],0x1e491e20 ;I
    add ebx,4
    mov dword[ebx],0x1e531e20 ;s
    add ebx,4
    mov dword[ebx],0x1e541e20 ;T
    add ebx,4
    mov dword[ebx],0x1e451e20 ;E
    add ebx,4
    mov dword[ebx],0x1e131e20 ;E
    jmp $end_loop

    kepp:
    cmp dword[ebp+64],1
    jne despacio

$deleteTrace_ball:
mov eax,dword[ebp+28]
;#show eax
mov ebx,0x0e20
mov dword[eax],ebx

$move_ball:
    mov ebx, 0x0404 ;paintball
   ;#show eax
    mov eax,dword[ebp+24] ;posicion a pintar nueva
    mov dword[ebp+28],eax ;nueva posicion a borar
    mov dword[eax],ebx ;pintando posicion

    ;Aqui esta la logica para que rebote
    mov edx,dword[ebp+32]
    mov ecx,1
    cmp edx,ecx
    je goUpBall
    jmp goDownBall 


goUpBall:
    mov ecx,dword[ebp+16]
    sub ecx,1
    mov dword[ebp+16],ecx
    mov edx,6
    cmp ecx,edx
    jl lastPosUp
    mov edx,6
    cmp ecx,edx
    je PosibleReboteMalo
     ;#show ecx
    jmp continuar
   
    ;CALCULO A VER EN BLOQUE REBOTA
    PosibleReboteMalo:
    cmp dword[ebp+44],0
    je continue1
    mov ecx,5
    cmp dword[ebp+20],ecx
    jg ReboteMalo1
    continue1:
    cmp dword[ebp+48],0
    je continue2
    mov ecx,17
    cmp dword[ebp+20],ecx
    jg ReboteMalo2
    continue2:
    cmp dword[ebp+52],0
    je continue3
    mov ecx,31
    cmp dword[ebp+20],ecx
    jg ReboteMalo3
    continue3:
    cmp dword[ebp+56],0
    je continue4
    mov ecx,45
    cmp dword[ebp+20],ecx
    jg ReboteMalo4
    continue4:
    cmp dword[ebp+60],0
    je continue5   
    mov ecx,59
    cmp dword[ebp+20],ecx
    jg ReboteMalo5
    continue5:
    jmp continuar

; REBOTES EN LOS BLOQUES
    ReboteMalo1:
    add ecx,11
    cmp dword[ebp+20],ecx
    jl decrease1
    jmp continue1
    decrease1:
    mov ecx,dword[ebp+44] 
    dec ecx
    mov dword[ebp+44],ecx
    cmp ecx,0
    je delete1
    jmp lastPosUp
    delete1:
    mov edx,0xb800
    add edx,970
    mov dword[edx], 0x0e200e20
    mov dword[edx+4], 0x0e200e20
    mov dword[edx+8], 0x0e200e20
    mov dword[edx+12], 0x0e200e20
    mov dword[edx+16], 0x0e200e20
    jmp lastPosUp
    
    ReboteMalo2:
    add ecx,11
    cmp dword[ebp+20],ecx
    jl decrease2
    jmp continue2
    decrease2:
    mov ecx,dword[ebp+48] 
    dec ecx
    mov dword[ebp+48],ecx
    cmp ecx,0
    je delete2
    jmp lastPosUp
    delete2:
    mov edx,0xb800
    add edx,970
    add edx,28
    mov dword[edx], 0x0e200e20
    mov dword[edx+4], 0x0e200e20
    mov dword[edx+8], 0x0e200e20
    mov dword[edx+12], 0x0e200e20
    mov dword[edx+16], 0x0e200e20
    jmp lastPosUp

    ReboteMalo3:
    add ecx,11
    cmp dword[ebp+20],ecx
    jl decrease3
    jmp continue3
    decrease3:
    mov ecx,dword[ebp+52] 
    dec ecx
    mov dword[ebp+52],ecx
    cmp ecx,0
    je delete3
    jmp lastPosUp
    delete3:
    mov edx,0xb800
    add edx,970
    add edx,56
   ; #show edx
    mov dword[edx], 0x0e200e20
    mov dword[edx+4], 0x0e200e20
    mov dword[edx+8], 0x0e200e20
    mov dword[edx+12], 0x0e200e20
    mov dword[edx+16], 0x0e200e20
    jmp lastPosUp


    ReboteMalo4:
    add ecx,11
    cmp dword[ebp+20],ecx
    jl decrease4
    jmp continue4
    decrease4:
    mov ecx,dword[ebp+56] 
    dec ecx
    mov dword[ebp+56],ecx
    cmp ecx,0
    je delete4
    jmp lastPosUp
    delete4:
    mov edx,0xb800
    add edx,970
    add edx,84
    mov dword[edx], 0x0e200e20
    mov dword[edx+4], 0x0e200e20
    mov dword[edx+8], 0x0e200e20
    mov dword[edx+12], 0x0e200e20
    mov dword[edx+16], 0x0e200e20
    jmp lastPosUp
    
    ReboteMalo5:
    add ecx,11
    cmp dword[ebp+20],ecx
    jl decrease5
    jmp continue5

    decrease5:
    mov ecx,dword[ebp+60] 
    dec ecx
    mov dword[ebp+60],ecx
    cmp ecx,0
    je delete5
    jmp lastPosUp
    delete5:
    mov edx,0xb800
    add edx,970
    add edx,112
    mov dword[edx], 0x0e200e20
    mov dword[edx+4], 0x0e200e20
    mov dword[edx+8], 0x0e200e20
    mov dword[edx+12], 0x0e200e20
    mov dword[edx+16], 0x0e200e20
    jmp lastPosUp
    
    continuar:
    sub eax,160
    ;#show eax
    jmp moveTosides
    ;rebote arriba
    lastPosUp:
    mov edx,0
    mov dword[ebp+32],edx
    jmp moviendo

goDownBall:    
    mov ecx,dword[ebp+16]
    add ecx,1
    mov dword[ebp+16],ecx
    mov edx,29
    cmp ecx,edx
    je reinicio
    mov edx,28
    cmp ecx,edx
    je PosibleRebote
    jmp aqui
    PosibleRebote:
    ;Rebote en toda la barra
    mov edx,dword[ebp+12]
    
    sub edx,2
    cmp dword[ebp+20],edx
    jg rebotation

    jmp aqui
    rebotation:
    ;#show edx
    add edx,12
    cmp dword[ebp+20],edx
    jl lastPosdown

    aqui:
    ;#show ecx
    add eax,160
    jmp moveTosides

    ;rebote abajo
    lastPosdown:
    mov edx,1
    mov dword[ebp+32],edx
    jmp moviendo

    reinicio:
    add eax,160
    mov edx,1
    mov dword[ebp+32],edx
    mov edx,dword[ebp+68]
    dec edx
    mov dword[ebp+68],edx
    jmp regreso

moveTosides:
    mov edx,dword[ebp+36]
    mov ecx,1
    
    cmp edx,ecx
    je goLeftBall
    jmp goRigthBall

goLeftBall:
    mov ecx,dword[ebp+20]
    sub ecx,1
    mov dword[ebp+20],ecx
    mov edx,0
    cmp ecx,edx
    je lastPosleft
   ; #show ecx
    sub eax,2
    jmp moviendo
    ;rebote arriba
    lastPosleft:
    mov edx,0
    mov dword[ebp+36],edx
    jmp moviendo

goRigthBall:
    
    mov ecx,dword[ebp+20]
    add ecx,1
    mov dword[ebp+20],ecx
    mov edx,79
    cmp ecx,edx
    je lastPosrigth
    ;#show ecx
    add eax,2
    jmp moviendo
    ;rebote arriba
    lastPosrigth:
    mov edx,1
    mov dword[ebp+36],edx
    jmp moviendo



    
moviendo:
    
    mov dword[ebp+24],eax
    ;#show eax 
    mov ecx,0
    mov dword[ebp+64],ecx
    jmp later
despacio:

    mov ecx,dword[ebp+64]
    inc ecx
    mov dword[ebp+64],ecx
later:
    call delay
    

$test_keys:
    mov ah, byte [0xffff0004] ; Keypad
    mov al, ah

    ;Left key
    and al, 0x1
    test al, al
    jz $test_right
    
 delete_trace:
    mov ebx, 0x0e20
    mov dword [esi+16], ebx
decrease_column:
    mov ebx,dword[ebp+12]
    sub ebx,1
    mov edx,0
    cmp ebx,edx
    je $move_bar

    mov dword[ebp+12],ebx
move_left:
    sub esi,2
   ; #show ebx 
    mov dword [ebp-4], 0x1e201e20 ; Pacman left
    jmp $move_bar

$test_right:
    mov al, ah
    and al, 0x2
    test al, al
    jz $test_q

delete_tracer:
    mov ebx, 0x0e20
    mov dword [esi], ebx
increase_column:
    mov ebx,dword[ebp+12]
    add ebx,1
    mov edx,72
    cmp ebx,edx
    je $move_bar
    mov dword[ebp+12],ebx
   ; #show ebx
move_rigth:
    add esi,2
    mov dword [ebp-4], 0x1e201e20 ; Pacman right
    jmp $move_bar
 
 
$test_q:
    mov al, ah
    and al, 0x10
    test al, al
    jnz $end_loop

    jmp $move_bar
 
$end_loop:
    #show al binary
    mov esp, ebp
    pop ebp
    ret

$go_upBall:

delay:
    mov eax, dword [0xffff0008]
    add eax, 30
$delay_loop:
    cmp dword [0xffff0008], eax
    jl $delay_loop
    ret

    
    
