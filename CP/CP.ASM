.include "tn85def.inc" ; Include Attiny85 definitions

.def count=r16 ; Define register for counting

.cseg ; Beginning of code segment

; Initialize I/O Ports
init:
   ldi count, 0xFF ; Set count register to 0xFF
   out DDRB, count ; Set all pins on PORTB as outputs
   out PORTB, count ; Set all pins on PORTB to LOW

main:
   sbi PORTB, PB0 ; Turn on green LED
   cbi PORTB, PB1 ; Turn off yellow LED
   cbi PORTB, PB2 ; Turn off red LED
   call delay ; Call delay function
   cbi PORTB, PB0 ; Turn off green LED
   sbi PORTB, PB1 ; Turn on yellow LED
   call delay ; Call delay function
   cbi PORTB, PB1 ; Turn off yellow LED
   sbi PORTB, PB2 ; Turn on red LED
   call delay ; Call delay function
   cbi PORTB, PB2 ; Turn off red LED
   rjmp main ; Repeat indefinitely

; Delay Function
delay:
   ldi count, 0xFF ; Set count register to 0xFF
loop:
   dec count ; Decrement count
   brne loop ; Loop until count is zero
   ret ; Return from function
