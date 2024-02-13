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
	ldr r0,=list
	ldr r1,=result
	mov r3,#0
initialize	
	teq r3,#10
	beq main
	ldr r4,[r0],#4
	str r4,[r1],#4
	add r3,#1
	b initialize
main	
	ldr r0,=result
	ldr r1,=result
	ldr r2,=result
	mov r3,#0
outer_loop 
	teq r3,#10
	beq exit_loop
	mov r1,r0
	add r2,r1,#4
	add r4,r3,#1
inner_loop 
	cmp r4,#10
	bcs swap
	ldr r5,[r1]
	ldr r6,[r2]
	cmp r5,r6
	movcs r1,r2
	add r4,#1
	add r2,#4
	b inner_loop
swap
	ldr r5,[r1]
	ldr r6,[r0]
	str r5,[r0]
	str r6,[r1]
	add r0,#4
	add r3,#1
	b outer_loop
exit_loop
stop 
	b stop
list dcd 0x23,0x50,0x44,0x67,0x90,0x33,0x25,0x09,0x37,0x18
	AREA data2, data, readwrite	
result dcd 0x0
	end