	;Linear search
    AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors

	DCD 0X10001000
	DCD Reset_Handler

	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0, =SRC
	LDR R1,[R0]
	LDR R6, =NUM
	LDR R2,[R6]
	LDR R4, =RES
	MOV R5,#10
LOOP
	CMP R1,R2
	BNE LOOP2
	STR R0,[R4],#4
	
LOOP2
	LDR R1,[R0,#4]!
	SUBS R5,#1
	BNE LOOP
STOP
	B STOP
SRC DCD 0xD87FC5A7,0x8D33CD38,0x9FAB89A2,0xA257C901,0xAFCB6BFD,0x3992F81C,0xC9E69770,0x66ECCC79,0x1F8FCC04,0x8809CC93
NUM DCD 0x9FAB89A2
	AREA mydata, DATA, READWRITE
RES DCD 0
	END
	
	
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
	LDR R0,=SRC
	LDR R1,[R0]
	LDR R3,=NUM
	MOV R6,#10
LOOP
	CMP R1,R3
	BNE LOOP
SRC DCD 0xD87FC5A7,0x8D33CD38,0x9FAB89A2,0xA257C901,0xAFCB6BFD,0x3992F81C,0xC9E69770,0x66ECCC79,0x1F8FCC04,0x8809CC93
NUM DCD 0xAFCB6BFD
	AREA DATASEG,DATA,READWRITE
DST DCD 0