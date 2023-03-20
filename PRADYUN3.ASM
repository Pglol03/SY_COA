.model small

.data
arry db 5 dup(00)
sum dw 0000h
MSGF DB 10,13,"GRADE IS F$"
MSGE DB 10,13,"GRADE IS E$"
MSGD DB 10,13,"GRADE IS D$"
MSGC DB 10,13,"GRADE IS C$"
MSGB DB 10,13,"GRADE IS B$"
MSGA DB 10,13,"GRADE IS A$"

.code
mov ax,@data
mov ds,ax

mov ch,05h  ; set counter
LEA SI , arry   ; pointer points first location of array

x3:call accept
mov [SI],bl
mov bh, 00h
add sum, bx
inc SI
dec CH

JNZ X3

mov ax, sum  ; dividend is moved in to ax
mov bl, 05h

div bl

cmp al, 40h
JLE M1
cmp al, 50h
JLE M2
cmp al, 60h
JLE M3
cmp al, 70h
JLE M4
cmp al, 80h
JLE M5

MOV ah,09h
LEA dx,MSGA
INT 21h
JMP EXIT

M1:
MOV ah,09h
LEA dx,MSGF
INT 21h
JMP EXIT

M2:
MOV ah,09h
LEA dx,MSGE
INT 21h
JMP EXIT

M3:
MOV ah,09h
LEA dx,MSGD
INT 21h
JMP EXIT

M4:
MOV ah,09h
LEA dx,MSGC
INT 21h
JMP EXIT

M5:
MOV ah,09h
LEA dx,MSGB
INT 21h
JMP EXIT

EXIT:
mov ah,4ch
int 21h

accept proc near

mov ah, 01h
int 21h

mov bl,al
sub bl,30h
cmp bl,09h
JLE X1

sub bl,07h

X1:
mov cl,04h
shl bl,cl    ; tens place value 

mov ah,01h
int 21h

mov bh,al
sub bh,30h

cmp bh,09h
JLE x2

sub bh,07h         ; unit place value

X2:
add bl,bh           ; two digit no

ret
endp


end
