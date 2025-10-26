;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module ds1302
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _readbyte
	.globl _sendbyte
	.globl _P5_7
	.globl _P5_6
	.globl _P5_5
	.globl _P5_4
	.globl _P5_3
	.globl _P5_2
	.globl _P5_1
	.globl _P5_0
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _FL
	.globl _P
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _C_T2
	.globl _CP_RL2
	.globl _T2CON_7
	.globl _T2CON_6
	.globl _T2CON_5
	.globl _T2CON_4
	.globl _T2CON_3
	.globl _T2CON_2
	.globl _T2CON_1
	.globl _T2CON_0
	.globl _PT2
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ET2
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _T2EX
	.globl _T2
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _CLK_DIV
	.globl _P5M1
	.globl _P5M0
	.globl _P1M1
	.globl _P1M0
	.globl _P3M1
	.globl _P3M0
	.globl _P5
	.globl _AUXR
	.globl _B
	.globl _A
	.globl _ACC
	.globl _PSW
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2MOD
	.globl _T2CON
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _CONF_SW_MMDD
	.globl _CONF_CHIME_ON
	.globl _CONF_ALARM_ON
	.globl _CONF_C_F
	.globl _H12_12
	.globl _H12_PM
	.globl _H12_TH
	.globl _ds_writebyte_PARM_2
	.globl _cfg_table
	.globl _rtc_table
	.globl _ds_readbyte
	.globl _ds_writebyte
	.globl _ds_init
	.globl _ds_split2int
	.globl _ds_int2bcd
	.globl _ds_int2bcd_tens
	.globl _ds_int2bcd_ones
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_PSW	=	0x00d0
_ACC	=	0x00e0
_A	=	0x00e0
_B	=	0x00f0
_AUXR	=	0x008e
_P5	=	0x00c8
_P3M0	=	0x00b2
_P3M1	=	0x00b1
_P1M0	=	0x0092
_P1M1	=	0x0091
_P5M0	=	0x00ca
_P5M1	=	0x00c9
_CLK_DIV	=	0x0097
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_T2	=	0x0090
_T2EX	=	0x0091
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_ET2	=	0x00ad
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_PT2	=	0x00bd
_T2CON_0	=	0x00c8
_T2CON_1	=	0x00c9
_T2CON_2	=	0x00ca
_T2CON_3	=	0x00cb
_T2CON_4	=	0x00cc
_T2CON_5	=	0x00cd
_T2CON_6	=	0x00ce
_T2CON_7	=	0x00cf
_CP_RL2	=	0x00c8
_C_T2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
_P	=	0x00d0
_FL	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
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
_rtc_table	=	0x0024
_cfg_table	=	0x002c
_ds_writebyte_PARM_2:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
_H12_TH	=	0x0034
_H12_PM	=	0x0035
_H12_12	=	0x0037
_CONF_C_F	=	0x0060
_CONF_ALARM_ON	=	0x0061
_CONF_CHIME_ON	=	0x0062
_CONF_SW_MMDD	=	0x006e
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
;Allocation info for local variables in function 'sendbyte'
;------------------------------------------------------------
;b                         Allocated to registers 
;------------------------------------------------------------
;	ds1302.c:64: void sendbyte(unsigned char b)
;	-----------------------------------------
;	 function sendbyte
;	-----------------------------------------
_sendbyte:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	ds1302.c:90: __endasm;
	push	ar7
	mov	a,dpl
	mov	r7,#8
	00001$:
	nop
	nop
	nop
	nop
	nop
	nop
	rrc	a
	mov	0xCC,c
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
;	ds1302.c:91: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readbyte'
;------------------------------------------------------------
;	ds1302.c:93: unsigned char readbyte()
;	-----------------------------------------
;	 function readbyte
;	-----------------------------------------
_readbyte:
;	ds1302.c:120: __endasm;
	push	ar7
	mov	a,#0
	mov	r7,#8
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
;	ds1302.c:121: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_readbyte'
;------------------------------------------------------------
;addr                      Allocated to registers 
;b                         Allocated to registers 
;------------------------------------------------------------
;	ds1302.c:123: unsigned char ds_readbyte(unsigned char addr) {
;	-----------------------------------------
;	 function ds_readbyte
;	-----------------------------------------
_ds_readbyte:
;	ds1302.c:127: DS_CE = 0;
;	assignBit
	clr	_P3_6
;	ds1302.c:128: DS_SCLK = 0;
;	assignBit
	clr	_P5_5
;	ds1302.c:129: DS_CE = 1;
;	assignBit
	setb	_P3_6
;	ds1302.c:131: P5M0 = 0b000010000;
	mov	_P5M0,#0x10
;	ds1302.c:132: P5M1 = 0b000000000;
	mov	_P5M1,#0x00
;	ds1302.c:133: sendbyte(b);
	lcall	_sendbyte
;	ds1302.c:134: P5M0 = 0b000000000;
	mov	_P5M0,#0x00
;	ds1302.c:135: P5M1 = 0b000000000;
	mov	_P5M1,#0x00
;	ds1302.c:137: P5M0 = 0b000000000;
	mov	_P5M0,#0x00
;	ds1302.c:138: P5M1 = 0b000010000;
	mov	_P5M1,#0x10
;	ds1302.c:139: b = readbyte();
	lcall	_readbyte
;	ds1302.c:140: DS_CE = 0;
;	assignBit
	clr	_P3_6
;	ds1302.c:141: P5M0 = 0b000000000;
	mov	_P5M0,#0x00
;	ds1302.c:142: P5M1 = 0b000000000;
	mov	_P5M1,#0x00
;	ds1302.c:143: return b;
;	ds1302.c:144: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_writebyte'
;------------------------------------------------------------
;data                      Allocated with name '_ds_writebyte_PARM_2'
;addr                      Allocated to registers 
;b                         Allocated to registers 
;------------------------------------------------------------
;	ds1302.c:162: void ds_writebyte(unsigned char addr, unsigned char data) {
;	-----------------------------------------
;	 function ds_writebyte
;	-----------------------------------------
_ds_writebyte:
;	ds1302.c:166: DS_CE = 0;
;	assignBit
	clr	_P3_6
;	ds1302.c:167: DS_SCLK = 0;
;	assignBit
	clr	_P5_5
;	ds1302.c:168: DS_CE = 1;
;	assignBit
	setb	_P3_6
;	ds1302.c:170: P5M0 = 0b000010000;
	mov	_P5M0,#0x10
;	ds1302.c:171: P5M1 = 0b000000000;
	mov	_P5M1,#0x00
;	ds1302.c:172: sendbyte(b);
	lcall	_sendbyte
;	ds1302.c:174: sendbyte(data);
	mov	dpl,_ds_writebyte_PARM_2
	lcall	_sendbyte
;	ds1302.c:175: P5M0 = 0b000000000;
	mov	_P5M0,#0x00
;	ds1302.c:176: P5M1 = 0b000000000;
	mov	_P5M1,#0x00
;	ds1302.c:177: DS_CE = 0;
;	assignBit
	clr	_P3_6
;	ds1302.c:178: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_init'
;------------------------------------------------------------
;b                         Allocated to registers 
;------------------------------------------------------------
;	ds1302.c:187: void ds_init() 
;	-----------------------------------------
;	 function ds_init
;	-----------------------------------------
_ds_init:
;	ds1302.c:189: unsigned char b = ds_readbyte(0x81);
	mov	dpl,#0x81
	lcall	_ds_readbyte
	mov	r7,dpl
;	ds1302.c:190: ds_writebyte(0x8E, 0); // clear WP
	mov	_ds_writebyte_PARM_2,#0x00
	mov	dpl,#0x8e
	lcall	_ds_writebyte
;	ds1302.c:191: b &= ~(0b10000000);	// clear Bit7
	mov	a,#0x7f
	anl	a,r7
	mov	_ds_writebyte_PARM_2,a
;	ds1302.c:192: ds_writebyte(0x80, b); // clear CH
	mov	dpl,#0x80
;	ds1302.c:193: }
	ljmp	_ds_writebyte
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_split2int'
;------------------------------------------------------------
;tens_ones                 Allocated to registers r7 
;------------------------------------------------------------
;	ds1302.c:358: unsigned char ds_split2int(unsigned char tens_ones) {
;	-----------------------------------------
;	 function ds_split2int
;	-----------------------------------------
_ds_split2int:
;	ds1302.c:359: return (tens_ones >> 4) * 10 + (tens_ones & 0x0F);
	mov	a,dpl
	mov	r7,a
	swap	a
	anl	a,#0x0f
	mov	b,#0x0a
	mul	ab
	mov	r6,a
	mov	a,#0x0f
	anl	a,r7
	add	a,r6
	mov	dpl,a
;	ds1302.c:360: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_int2bcd'
;------------------------------------------------------------
;integer                   Allocated to registers r7 
;------------------------------------------------------------
;	ds1302.c:363: unsigned char ds_int2bcd(unsigned char integer) {
;	-----------------------------------------
;	 function ds_int2bcd
;	-----------------------------------------
_ds_int2bcd:
	mov	r7,dpl
;	ds1302.c:364: return integer / 10 << 4 | integer % 10;
	mov	r6,#0x00
	mov	__divsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
	push	ar7
	push	ar6
	lcall	__divsint
	mov	r4,dpl
	pop	ar6
	pop	ar7
	mov	a,r4
	swap	a
	anl	a,#0xf0
	mov	r4,a
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
	mov	dpl,r7
	mov	dph,r6
	push	ar4
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	pop	ar4
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	a,r4
	orl	ar6,a
	mov	a,r5
	orl	ar7,a
	mov	dpl,r6
;	ds1302.c:365: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_int2bcd_tens'
;------------------------------------------------------------
;integer                   Allocated to registers r7 
;------------------------------------------------------------
;	ds1302.c:367: unsigned char ds_int2bcd_tens(unsigned char integer) {
;	-----------------------------------------
;	 function ds_int2bcd_tens
;	-----------------------------------------
_ds_int2bcd_tens:
	mov	r7,dpl
;	ds1302.c:368: return integer / 10 % 10;
	mov	r6,#0x00
	mov	__divsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
	lcall	__divsint
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),#0x00
;	ds1302.c:369: }
	ljmp	__modsint
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_int2bcd_ones'
;------------------------------------------------------------
;integer                   Allocated to registers r7 
;------------------------------------------------------------
;	ds1302.c:371: unsigned char ds_int2bcd_ones(unsigned char integer) {
;	-----------------------------------------
;	 function ds_int2bcd_ones
;	-----------------------------------------
_ds_int2bcd_ones:
	mov	r7,dpl
;	ds1302.c:372: return integer % 10;
	mov	r6,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
;	ds1302.c:373: }
	ljmp	__modsint
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
