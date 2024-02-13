;Factorial of a number
    AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=05
	BL FACTORIAL	
	B STOP
FACTORIAL
	PUSH	{R4,LR}		 
	MOV	R4,R0			
 	CMP	R0,#0			
	BNE	NOTZERO		 
	MOV	R0,#1		
 	B LAST
NOTZERO 
 	SUB	R0,R0,#1		
 	BL	FACTORIAL		
 	MOV	R1,R4		 
 	MUL	R0,R0,R1		
LAST
 	POP	{R4,LR}		
	BX	LR 
STOP
	B STOP