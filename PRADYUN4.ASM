.model small

.data
arry db 5 dup(00)
sum dw 0000h
MSGP DB 10,13,"POSITIVE NUMBERS ARE $"
MSGN DB 10,13,"NEGATIVE NUMBERS ARE $"
intp DB 00h
intn DB 00h

.code
mov ax,@data
mov ds,ax

mov ch,05h  ; set counter
LEA SI , arry   ; pointer points first location of array

X3:
call accept
mov [SI],bl

AND BL, 80h
JNS X1

inc intn
inc SI
dec CH

JNZ X3

cmp CH, 00h
JE X2

X1:
inc intp
inc SI
dec CH
JNZ X3

X2:
MOV ah,09h
LEA dx,MSGP
INT 21h
mov dl, intp
add dl, 30h
mov ah. 02h
int 21h

MOV ah,09h
LEA dx,MSGN
INT 21h
mov dl, intn
add dl, 30h
mov ah. 02h
int 21h


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
