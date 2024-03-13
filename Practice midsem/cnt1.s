    AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0,=SRC
	LDR R1,=RES
	MOV R2,#8
	MOV R3,#0;COUNTER
	MOV R6 ,#0x0F
	AND R4,R0,R6
	B CHECK8
SHIFT
	SUB R2,#1
	CMP R2,#0
	BEQ STOP
	LSR R0,R0,#4
	AND R4,R0,R6
	B CHECK8
CHECK8
	CMP R4,#8
	BMI CHECK4
	SUB R4,R4,#8
	ADD R3,#1
	B CHECK4
CHECK4
	CMP R4,#4
	BMI CHECK2
	SUB R4,R4,#4
	ADD R3,#1
	B CHECK2
CHECK2
	CMP R4,#2
	BMI CHECK1
	SUB R4,R4,#2
	ADD R3,#1
	B CHECK1
CHECK1
	CMP R4,#1
	BMI SHIFT
	SUB R4,R4,#1
	ADD R3,#1
	B SHIFT
STOP
	B STOP
SRC DCD 0xFFFFFFFF
	AREA mydata, DATA, READWRITE
RES DCD 0
	END