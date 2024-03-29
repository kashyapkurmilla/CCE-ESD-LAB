;add 10 32-bit numbers
	AREA reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000 
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
		MOV R5,#09
	LDR R0,=SRC
	LDR R1,[R0],#04
LOOP
	LDR R3,[R0],#4
	ADDS R1,R1,R3
	ADCS R7,#0X0
	SUBS R5,#01
	BNE LOOP
	LDR R0,=DST
	STR R1,[R0],#4
	STR R7,[R0]
STOP
	B STOP
SRC DCD 0xD87FC5A7,0x8D33CD38,0x9FAB89A2,0xA257C901,0xAFCB6BFD,0x3992F81C,0xC9E69770,0x66ECCC79,0x1F8FCC04,0x8809CC93
	AREA DATASEG, DATA, READWRITE
DST DCD 0
	END