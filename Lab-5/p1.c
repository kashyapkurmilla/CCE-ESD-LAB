#include<LPC17xx.h>
unsigned long LED = 0x00000010;
unsigned int i,j;
int main(void){
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 &= 0xFF0000FF;
	LPC_GPIO0->FIODIR |=0X00000FF0;
	while(1){
        LED = 0X00000010;
		for(i=1; i<9; i++){
			LPC_GPIO0->FIOSET=LED;
			for(j=0;j<20000000;j++);
				LED = LED<<1;
			}
		LED = 0X00000010;
		for(i=1; i<9; i++){
			LPC_GPIO0->FIOCLR=LED;
			for(j=0;j<20000000;j++);
				LED<<=1;
			}
		}
}