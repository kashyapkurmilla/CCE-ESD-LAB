	;NON-overlapping
	AREA reset,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0, =SRC
	LDR R1 ,=DST
	MOV R3 ,#10
	MOV R7 ,#0x0
	LDR R4 ,=0x10000040
LOOP
	LDR R2,[R0],#4
	STR R2,[R1],#4
	SUBS R3,#1
	BNE LOOP
	LDR R1 ,=DST
	MOV R3 ,#10
LOOP2
	LDR R6,[R1]
	STR R7,[R1],#4
	STR R6,[R4],#4
	SUBS R3 , #1
	BNE LOOP2
STOP
	B STOP
SRC DCD 0xD87FC5A7,0x8D33CD38,0x9FAB89A2,0xA257C901,0xAFCB6BFD,0x3992F81C,0xC9E69770,0x66ECCC79,0x1F8FCC04,0x8809CC93;code memory
	AREA DATADEG,DATA,READWRITE
DST DCD 0
	END

	
	