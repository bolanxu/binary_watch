#include "stc15wxx.h"
#include "delay.h"
#include "stdutils.h"
#include "ds1302.h"


#define INCR(num, low, high) if (num < high) { num++; } else { num = low; }

unsigned char min,sec,month,weekDay,hour,year,date;

unsigned char state = 0;

__bit pwrDown = 1;

unsigned int button_timer;

void Delay1ms()		//@.04688MHz
{
	__asm
	
	nop
	nop
	mov	r7,#5
00001$:
	djnz r7,00001$
	
	__endasm;
}

void delay(unsigned int z)
{
	while(z--)
		Delay1ms();
}

void ds_set_clock(unsigned char s_min,unsigned char s_hour,unsigned char s_month,unsigned char s_date,unsigned char s_year) {
    ds_writebyte(0x82, ds_int2bcd(s_min));
    ds_writebyte(0x84, ds_int2bcd(s_hour));
    ds_writebyte(0x88, ds_int2bcd(s_month));
    ds_writebyte(0x86, ds_int2bcd(s_date));
    ds_writebyte(0x8C, ds_int2bcd(s_year));
}

void display_led(unsigned char val)
{
	unsigned char i,j,result = 0x00;
	for (i=0;i<6;i++)
	{
		j = val & 0x01;
		val >>= 1;
		result |= j;
		result <<= 1;
	}
	result >>= 1;
	result = ~result;
	P1 = result;
}

void chaser()
{
	unsigned char i, a = 0x01;
	for (i = 0;i<6;i++)
	{
		display_led(a<<i);
		delay(70);
	}
	display_led(0x00);
}

void flash()
{
	display_led(0xff);
	delay(300);
	display_led(0x00);
	delay(300);
}

void main()
{
	CLK_DIV = 0x07;
	P1M0 = 0xFF;
	P1M1 = 0x00;
	
	H12_12 = 0;

	ds_init();
	EX0 = 1;
	EX1 = 1;
	EA = 1;
	
	
	//ds_set_clock();
	chaser();
	
	while(1)
	{
		P1M0 = 0xFF;
		P1M1 = 0x00;
		P5M0 = 0b000000000;
		P5M1 = 0b000000000;
		P3M0 = 0x00;
		P3M1 = 0x00;
		//P3 = 0xFF;
		//P5 = 0xFF;
		if (state == 1)
		{
			min = ds_split2int(ds_readbyte(0x83));
			//sec = ds_split2int(ds_readbyte(0x81));
			//month = ds_split2int(ds_readbyte(0x89));
			//date = ds_split2int(ds_readbyte(0x8D));
			//weekDay = ds_split2int(ds_readbyte(0x8B));
			hour = ds_split2int(ds_readbyte(0x85)&0b00111111);
			//year = ds_split2int(ds_readbyte(0x8D));
			display_led(hour);
			delay(2000);
			display_led(min);
			delay(2000);
			state = 0;
			display_led(0x00);
		}
		else if (state == 2)
		{
			EA = 0;
			flash();
			flash();
			
			while (1)
			{
				display_led(hour);
				if (!P3_3)
				{
					while(!P3_3)
						delay(10);
					INCR(hour,0,24)
				}
				if (!P3_2)
				{
					while(!P3_2)
						delay(10);
					break;
				}
			}
			while (1)
			{
				display_led(min);
				if (!P3_3)
				{
					while(!P3_3)
						delay(10);
					INCR(min,0,60)
				}
				if (!P3_2)
				{
					while(!P3_2)
						delay(10);
					break;
				}
			}
			display_led(0x00);
			delay(1000);
			EA = 1;
			ds_set_clock(min,hour,month,date,year);
			ds_writebyte(0x80, 0x00);
			state = 0;
		}
		else if (state == 3)
		{
		    EA = 0;
		    while(P3_2)
		    {
		        sec = ds_split2int(ds_readbyte(0x81));
			    display_led(sec);
			    delay(100);
		    }
		    display_led(0x00);
		    EA = 1;
		    state = 0;
		}
		if (pwrDown)
		{
			P1M0 = 0xff;
			P1M1 = 0xff;
			P5M0 = 0xff;
			P5M1 = 0xff;
			P3M0 = 0x00;
			P3M1 = 0x00;
			//P1 = 0x00;
			//P3 = 0x00;
			//P5 = 0x00;
			PCON |= 0x02;
			__asm__("nop");
			__asm__("nop");
			__asm__("nop");
			__asm__("nop");
			__asm__("nop");
			__asm__("nop");
			__asm__("nop");
			__asm__("nop");
		}
	}
}
void int0() __interrupt 0
{
	pwrDown = 1;
	while (!P3_2)
	{
		delay(5);
		if (P3_2)
		{
		    state = 3;
		    break;
		}
	}
}
void int1() __interrupt 2
{
	pwrDown = 1;
	button_timer = 0;
	while (!P3_3)
	{
		delay(5);
		button_timer++;
		if (button_timer > 300)
		{
			state = 2;
			break;
		}
		else
		{
			state = 1;
		}
	}
}
