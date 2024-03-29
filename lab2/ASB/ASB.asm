bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db 5
    b db 8
    c db 1
    d db 9

; our code starts here
segment code use32 class=code
    start:
        ; a+13-c+d-7+b from additions, substractions, all variables as bytes
        
        mov AL, [a]  ;AL= a
        add AL, 13   ;Al= a+13
        sub AL, [c]  ;AL= a+13-c      
        add AL, [d]  ;AL= a+13-c+d
        sub AL, 7    ;AL= a+13-c+d-7
        add AL, [b]  ;AL= a+13-c+d-7+b
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
