	;2-digit BCD number in to its equivalent hexadecimal number.
	AREA   reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000 
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0,=BCD
	LDR R1,=DST
	MOV R5,#0x0A
	LDRB R2,[R0]
	LSR R3,R2,#4
	MUL R4,R3,R5
	AND R2,R2,#0x0F
	ADD R4,R4,R2
	STRB R4,[R1]
BCD DCD 0x00000064
	AREA data, DATA, READWRITE
DST DCD 0
	END