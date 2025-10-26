;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module delay
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _P5_7
	.globl _P5_6
	.globl _P5_5
	.globl _P5_4
	.globl _P5_3
	.globl _P5_2
	.globl _P5_1
	.globl _P5_0
	.globl _CLK_DIV
	.globl _P1M1
	.globl _P1M0
	.globl _P3M1
	.globl _P3M0
	.globl _P5
	.globl _AUXR
	.globl _DELAY_us
	.globl _DELAY_ms
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_AUXR	=	0x008e
_P5	=	0x00c8
_P3M0	=	0x00b2
_P3M1	=	0x00b1
_P1M0	=	0x0092
_P1M1	=	0x0091
_CLK_DIV	=	0x0097
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P5_0	=	0x00c8
_P5_1	=	0x00c9
_P5_2	=	0x00ca
_P5_3	=	0x00cb
_P5_4	=	0x00cc
_P5_5	=	0x00cd
_P5_6	=	0x00ce
_P5_7	=	0x00cf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'DELAY_us'
;------------------------------------------------------------
;us_count                  Allocated to registers 
;------------------------------------------------------------
;	delay.c:53: void DELAY_us(uint16_t us_count)
;	-----------------------------------------
;	 function DELAY_us
;	-----------------------------------------
_DELAY_us:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	delay.c:63: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'DELAY_ms'
;------------------------------------------------------------
;ms_count                  Allocated to registers 
;------------------------------------------------------------
;	delay.c:78: void DELAY_ms(uint16_t ms_count)
;	-----------------------------------------
;	 function DELAY_ms
;	-----------------------------------------
_DELAY_ms:
	mov	r6,dpl
	mov	r7,dph
;	delay.c:80: while(ms_count!=0)
00101$:
	mov	a,r6
	orl	a,r7
	jz	00104$
;	delay.c:82: DELAY_us(C_CountForOneMsDelay_U16);     //DELAY_us is called to generate 1ms delay
	mov	dptr,#0x00f0
	push	ar7
	push	ar6
	lcall	_DELAY_us
	pop	ar6
	pop	ar7
;	delay.c:83: ms_count--;
	dec	r6
	cjne	r6,#0xff,00116$
	dec	r7
00116$:
	sjmp	00101$
00104$:
;	delay.c:86: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
