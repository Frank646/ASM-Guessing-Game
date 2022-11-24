

section .text:; Assembely code is stored
    
    global _start
    _start:
    mov eax,4; System call 4 to the register. Says output

    mov ebx,1; standrd output, puts value 1 into register

    mov ecx, game; offset of game in ecx register  gives acces to the string.

    mov edx, gameLen; puts the length of the string into register

    int 80h; calls the OS with an int will allow the OS to check register and write to screen


pickgame:


    mov eax,4; System call 4 to the register. Says output

    mov ebx,1; standrd output, puts value 1 into register

    mov ecx, pick; offset of pick in ecx register  gives acces to the string.

    mov edx, pickLen; puts the length of the string into register

    int 80h; calls the OS with an int will allow the OS to check register and write to screen

;;User Input

    mov eax,3; System call input
    mov ebx,0; Stand input
    mov ecx, userdata; stores inputted value from userdata
    mov edx,1; size of input value in bytes 
    int 80h; calls interrupt


;;User written output

    mov eax, [userdata];comparison
    cmp eax, 'Higher';comparison
    cmp eax, 'Lower';comparison
    sub eax, '0'
    cmp eax, 100


    add eax, '0'
    
    mov [userdata], eax

    
    mov eax, 4;System call input
    mov ebx, 1;Stand input
    mov ecx, userdata
    mov edx, 1;siz of input value in bytes
    int 80h; calls interrupt


Higherlbl:
    mov eax,4; System call 4 to the register. Says output
    mov ebx,1; standrd output, puts value 1 into register
    mov ecx, Highermsg; offset of Highermsg in ecx register  gives acces to the string.
    mov edx, Higherlen; Puts the length of the string into register
    int 80h; calls the OS with an int will allow the OS to check register and write to screen

Lowerlbl:
    mov eax,4; System call 4 to the register. Says output
    mov ebx,1; standrd output, puts value 1 into register
    mov ecx, Lowermsg; offset of Lowermsg in ecx register  gives acces to the string.
    mov edx, Lowerlen; Puts the length of the string into register
    int 80h; calls the OS with an int will allow the OS to check register and write to screen


;;  don't touch is output

    ;;mov eax,4; System call 4 to the register. Says output
    ;;mov ebx,1; standrd output, puts value 1 into register
    ;;mov ecx, userdata; offset of userdata in ecx register  gives acces to the string.
    ;;mov edx, 4; puts the length of the string into register
    ;;int 80h; calls the OS with an int will allow the OS to check register and write to screen

    ;;mov eax,4; System call 4 to the register. Says output
    ;;mov ebx,1; standrd output, puts value 1 into register
    ;;mov ecx, cuehLine; offset of userdata in ecx register  gives acces to the string.
    ;;mov edx, cuehLen; puts the length of the string into register
    ;;int 80h; calls the OS with an int will allow the OS to check register and write to screen

exit:

    mov eax,1 ; system call

    mov ebx,0 ; exit value

    int 80h ; checks register and will perform the exit operation of the EBX


errors:

    mov eax,4; System call 4 to the register. Says output

    mov ebx,1; standrd output, puts value 1 into register

    mov ecx, error; offset of error in ecx register  gives acces to the string.

    mov edx, errorLen; puts the length of the string into register

    int 80h; calls the OS with an int will allow the OS to check register and write to screen



section .data:; Constants
    game db "Shall we play a game?",0xA; Declaring constant, 16 equates to the chracters in the line
    gameLen equ $-game; Returns string length

    pick db "Pick a number between 1-100 and I will guess your number",0xA; Declaring constant, requesting user to pick a number between 1-100
    pickLen equ $-pick

    hiwer db "Higher or Lower",0xA; Declaring constant, requesting if users number is higher or lower
    hiwerLen equ $-hiwer

    Highermsg db "You Picked Higher", 0xA
    Higherlen equ $-Highermsg

    Lowerrmsg db "You Picked Lower", 0xA
    Lowerlen equ $-Lowermsg

    Error db "Error, try again",0xA; Declaring constant, throwing up an error
    ErrorLen equ $-Error

    cuehLine db 0xA;
    cuehLen equ $-cuehLine



segment .bss ; Block starting symbol(BSS)

    userdata resb 1; reserving byte