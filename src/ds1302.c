// DS1302 RTC IC
// http://datasheets.maximintegrated.com/en/ds/DS1302.pdf
//

#pragma callee_saves sendbyte,readbyte
#pragma callee_saves ds_writebyte,ds_readbyte
// silence: "src/ds1302.c:84: warning 59: function 'readbyte' must return value"
#pragma disable_warning 59

#include "ds1302.h"

#define MAGIC_HI  0x5A
#define MAGIC_LO  0xA5

#define INCR(num, low, high) if (num < high) { num++; } else { num = low; }


void sendbyte(unsigned char b)
{
    b;
  __asm
    push	ar7
    mov     a,dpl
    mov	r7,#8
00001$:
    nop
    nop
    nop
    nop
    nop
    nop
    rrc     a
    mov     0xCC,c
    setb	0xCD
    nop
    nop
    nop
    nop
    nop
    nop
    clr	0xCD
    djnz	r7,00001$
    pop	ar7
  __endasm;
}

unsigned char readbyte()
{
  __asm
	push	ar7
	mov 	a,#0
	mov 	r7,#8
00002$:
	
	nop
	nop
	nop
	nop
	nop
	nop
	mov	c,0xCC
	rrc	a	
	setb	0xCD
	nop
	nop
	nop
	nop
	nop
	nop
	clr	0xCD
	djnz	r7,00002$
	mov	dpl,a
	pop	ar7
  __endasm;
}

unsigned char ds_readbyte(unsigned char addr) {
    // ds1302 single-byte read
    unsigned char b;
    b = addr;
    DS_CE = 0;
    DS_SCLK = 0;
    DS_CE = 1;
    // send cmd byte
    P5M0 = 0b000010000;
	P5M1 = 0b000000000;
    sendbyte(b);
    P5M0 = 0b000000000;
	P5M1 = 0b000000000;
    // read byte
    P5M0 = 0b000000000;
	P5M1 = 0b000010000;
    b = readbyte();
    DS_CE = 0;
    P5M0 = 0b000000000;
	P5M1 = 0b000000000;
    return b;
}

void ds_writebyte(unsigned char addr, unsigned char data) {
    // ds1302 single-byte write
    unsigned char b = 0;
    b = addr;
    DS_CE = 0;
    DS_SCLK = 0;
    DS_CE = 1;
    // send cmd byte
    P5M0 = 0b000010000;
	P5M1 = 0b000000000;
    sendbyte(b);
    // send data byte
    sendbyte(data);
	P5M0 = 0b000000000;
	P5M1 = 0b000000000;
    DS_CE = 0;
}


void ds_init() 
{
    unsigned char b = ds_readbyte(0x81);
    ds_writebyte(0x8E, 0); // clear WP
    b &= ~(0b10000000);	// clear Bit7
    ds_writebyte(0x80, b); // clear CH
}


unsigned char ds_int2bcd(unsigned char integer) {
    return integer / 10 << 4 | integer % 10;
}

unsigned char ds_int2bcd_tens(unsigned char integer) {
    return integer / 10 % 10;
}

unsigned char ds_int2bcd_ones(unsigned char integer) {
    return integer % 10;
}
