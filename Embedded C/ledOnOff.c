//simple led trun on and off
#include<lpc17xx.h>
unsigned int i , j ;
unsigned long led =  0x00000010 ;//turn on led at port p0.4
int main(){
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 &= 0xFF0000FF;
	LPC_GPIO0->FIODIR |= 0x00000FF0;
	while(1){
		led= 0x00000010;
		for(i=1;i<9;i++){
				LPC_GPIO0->FIOSET = led;
			//	for(j=0;j<12345676;j++);
			LPC_GPIO0->FIOCLR=led;
			led<<=1;
			
}
}
}