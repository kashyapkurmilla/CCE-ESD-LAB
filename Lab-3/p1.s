	;covert 2-digit hexadecimal number in ASCII
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
	LDR R0,=HEX
	LDR R1,=DST
	LDRB R2,[R0]
	AND R3,R2,#0x0F
	CMP R3,#0x09
	BMI ADD30
	BEQ ADD30
	ADD R3,#0x7
	B ADD30
ADD30
	ADD R3,#0x30
	STRB R3,[R1]
	LSR R3,R2,#4
	CMP R3,#0x09
	BMI ADD30II
	BEQ ADD30II
	ADD R3,#0x7
ADD30II
	ADD R3,#0x30
	STRB R3,[R1,#1]
HEX DCD 0x00000069
	AREA data, DATA, READWRITE
DST DCD 0
	END
