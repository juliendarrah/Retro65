; Experiment 1
;
; Toggle the port A output lines
; With 2MHz clock,  1 cycle is two iterations of the loop (2 * 10)
; 2000000 / 20 = 100 kHz on PA0 line.
; Could do this in 9 cycles but want a round number.
; PA1 is 50 kHz, PA2 is 25 kHz etc.
       

.include "6522.inc"

.segment "DATA"

Data1: .res 1

.segment "STARTUP"

START:  LDA #%11111111 ; Set port A to all outputs
        STA DDRA
;  Increment output to toggle all bits
        CLV
        LDX #$00
        STX PORTA
Loop:   INC PORTA,X	; 7 cycles

		LDA #$FF		; 2 cycles
		STA Data1
InLoop:	DEC Data1		; 2 cycles

		NOP			; 2 cycles
		NOP			; 2 cycles
		NOP			; 2 cycles
		NOP			; 2 cycles
		NOP			; 2 cycles

		;NOP			; 2 cycles
		;NOP			; 2 cycles
		;NOP			; 2 cycles
		;NOP			; 2 cycles
		;NOP			; 2 cycles

		BNE InLoop	; 3 cycles

        BVC Loop	; 3 cycles     


.segment "RODATA"


.segment "VECTORS"

; set interrupt vectors to point to handlers
.word $0F00   ;$fffa NMI
.word START ;$fffc Reset
.word $0000   ;$fffe IRQ


