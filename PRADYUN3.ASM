.model small

.data
arry db 5 dup(00)
sum dw 0000h

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
