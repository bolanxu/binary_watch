;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _int1
	.globl _int0
	.globl _main
	.globl _flash
	.globl _chaser
	.globl _display_led
	.globl _ds_set_clock
	.globl _delay
	.globl _Delay1ms
	.globl _ds_int2bcd
	.globl _ds_split2int
	.globl _ds_init
	.globl _ds_writebyte
	.globl _ds_readbyte
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
	.globl _pwrDown
	.globl _CONF_SW_MMDD
	.globl _CONF_CHIME_ON
	.globl _CONF_ALARM_ON
	.globl _CONF_C_F
	.globl _H12_12
	.globl _H12_PM
	.globl _H12_TH
	.globl _ds_set_clock_PARM_5
	.globl _ds_set_clock_PARM_4
	.globl _ds_set_clock_PARM_3
	.globl _ds_set_clock_PARM_2
	.globl _button_timer
	.globl _state
	.globl _date
	.globl _year
	.globl _hour
	.globl _weekDay
	.globl _month
	.globl _sec
	.globl _min
	.globl _cfg_table
	.globl _rtc_table
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
_TL2	=	0x00d7
_TH2	=	0x00d6
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
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_rtc_table	=	0x0024
_cfg_table	=	0x002c
_min::
	.ds 1
_sec::
	.ds 1
_month::
	.ds 1
_weekDay::
	.ds 1
_hour::
	.ds 1
_year::
	.ds 1
_date::
	.ds 1
_state::
	.ds 1
_button_timer::
	.ds 2
_ds_set_clock_PARM_2:
	.ds 1
_ds_set_clock_PARM_3:
	.ds 1
_ds_set_clock_PARM_4:
	.ds 1
_ds_set_clock_PARM_5:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
_pwrDown::
	.ds 1
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
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	ljmp	_int0
	.ds	5
	reti
	.ds	7
	ljmp	_int1
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	main.c:30: unsigned char state = 0;
	mov	_state,#0x00
;	main.c:32: __bit pwrDown = 1;
;	assignBit
	setb	_pwrDown
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Delay1ms'
;------------------------------------------------------------
;	main.c:117: void Delay1ms()		//@.04688MHz
;	-----------------------------------------
;	 function Delay1ms
;	-----------------------------------------
_Delay1ms:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	main.c:127: __endasm;
	nop
	nop
	mov	r7,#5
	00001$:
	djnz	r7,00001$
;	main.c:128: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;z                         Allocated to registers 
;------------------------------------------------------------
;	main.c:130: void delay(unsigned int z)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r6,dpl
	mov	r7,dph
;	main.c:132: while(z--)
00101$:
	mov	ar4,r6
	mov	ar5,r7
	dec	r6
	cjne	r6,#0xff,00115$
	dec	r7
00115$:
	mov	a,r4
	orl	a,r5
	jz	00104$
;	main.c:133: Delay1ms();
	push	ar7
	push	ar6
	lcall	_Delay1ms
	pop	ar6
	pop	ar7
	sjmp	00101$
00104$:
;	main.c:134: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ds_set_clock'
;------------------------------------------------------------
;s_hour                    Allocated with name '_ds_set_clock_PARM_2'
;s_month                   Allocated with name '_ds_set_clock_PARM_3'
;s_date                    Allocated with name '_ds_set_clock_PARM_4'
;s_year                    Allocated with name '_ds_set_clock_PARM_5'
;s_min                     Allocated to registers r7 
;------------------------------------------------------------
;	main.c:136: void ds_set_clock(unsigned char s_min,unsigned char s_hour,unsigned char s_month,unsigned char s_date,unsigned char s_year) {
;	-----------------------------------------
;	 function ds_set_clock
;	-----------------------------------------
_ds_set_clock:
;	main.c:137: ds_writebyte(0x82, ds_int2bcd(s_min));
	lcall	_ds_int2bcd
	mov	_ds_writebyte_PARM_2,dpl
	mov	dpl,#0x82
	lcall	_ds_writebyte
;	main.c:138: ds_writebyte(0x84, ds_int2bcd(s_hour));
	mov	dpl,_ds_set_clock_PARM_2
	lcall	_ds_int2bcd
	mov	_ds_writebyte_PARM_2,dpl
	mov	dpl,#0x84
	lcall	_ds_writebyte
;	main.c:139: ds_writebyte(0x88, ds_int2bcd(s_month));
	mov	dpl,_ds_set_clock_PARM_3
	lcall	_ds_int2bcd
	mov	_ds_writebyte_PARM_2,dpl
	mov	dpl,#0x88
	lcall	_ds_writebyte
;	main.c:140: ds_writebyte(0x86, ds_int2bcd(s_date));
	mov	dpl,_ds_set_clock_PARM_4
	lcall	_ds_int2bcd
	mov	_ds_writebyte_PARM_2,dpl
	mov	dpl,#0x86
	lcall	_ds_writebyte
;	main.c:141: ds_writebyte(0x8C, ds_int2bcd(s_year));
	mov	dpl,_ds_set_clock_PARM_5
	lcall	_ds_int2bcd
	mov	_ds_writebyte_PARM_2,dpl
	mov	dpl,#0x8c
;	main.c:142: }
	ljmp	_ds_writebyte
;------------------------------------------------------------
;Allocation info for local variables in function 'display_led'
;------------------------------------------------------------
;val                       Allocated to registers r7 
;i                         Allocated to registers r5 
;j                         Allocated to registers r4 
;result                    Allocated to registers r6 
;------------------------------------------------------------
;	main.c:144: void display_led(unsigned char val)
;	-----------------------------------------
;	 function display_led
;	-----------------------------------------
_display_led:
	mov	r7,dpl
;	main.c:146: unsigned char i,j,result = 0x00;
	mov	r6,#0x00
;	main.c:147: for (i=0;i<6;i++)
	mov	r5,#0x06
00104$:
;	main.c:149: j = val & 0x01;
	mov	a,#0x01
	anl	a,r7
	mov	r4,a
;	main.c:150: val >>= 1;
	mov	a,r7
	clr	c
	rrc	a
	mov	r7,a
;	main.c:151: result |= j;
	mov	a,r6
	orl	ar4,a
;	main.c:152: result <<= 1;
	mov	a,r4
	add	a,r4
	mov	r6,a
	mov	a,r5
	dec	a
;	main.c:147: for (i=0;i<6;i++)
	mov	r5,a
	jnz	00104$
;	main.c:154: result >>= 1;
	mov	a,r6
	clr	c
	rrc	a
;	main.c:155: result = ~result;
	cpl	a
	mov	_P1,a
;	main.c:156: P1 = result;
;	main.c:157: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'chaser'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;a                         Allocated to registers 
;------------------------------------------------------------
;	main.c:159: void chaser()
;	-----------------------------------------
;	 function chaser
;	-----------------------------------------
_chaser:
;	main.c:162: for (i = 0;i<6;i++)
	mov	r7,#0x00
00102$:
;	main.c:164: display_led(a<<i);
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00117$
00115$:
	add	a,acc
00117$:
	djnz	b,00115$
	mov	dpl,a
	push	ar7
	lcall	_display_led
;	main.c:165: delay(70);
	mov	dptr,#0x0046
	lcall	_delay
	pop	ar7
;	main.c:162: for (i = 0;i<6;i++)
	inc	r7
	cjne	r7,#0x06,00118$
00118$:
	jc	00102$
;	main.c:167: display_led(0x00);
	mov	dpl,#0x00
;	main.c:168: }
	ljmp	_display_led
;------------------------------------------------------------
;Allocation info for local variables in function 'flash'
;------------------------------------------------------------
;	main.c:170: void flash()
;	-----------------------------------------
;	 function flash
;	-----------------------------------------
_flash:
;	main.c:172: display_led(0xff);
	mov	dpl,#0xff
	lcall	_display_led
;	main.c:173: delay(300);
	mov	dptr,#0x012c
	lcall	_delay
;	main.c:174: display_led(0x00);
	mov	dpl,#0x00
	lcall	_display_led
;	main.c:175: delay(300);
	mov	dptr,#0x012c
;	main.c:176: }
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	main.c:178: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:180: CLK_DIV = 0x07;
	mov	_CLK_DIV,#0x07
;	main.c:181: P1M0 = 0xFF;
	mov	_P1M0,#0xff
;	main.c:182: P1M1 = 0x00;
	mov	_P1M1,#0x00
;	main.c:184: H12_12 = 0;
;	assignBit
	clr	_H12_12
;	main.c:186: ds_init();
	lcall	_ds_init
;	main.c:187: EX0 = 1;
;	assignBit
	setb	_EX0
;	main.c:188: EX1 = 1;
;	assignBit
	setb	_EX1
;	main.c:189: EA = 1;
;	assignBit
	setb	_EA
;	main.c:193: chaser();
	lcall	_chaser
;	main.c:195: while(1)
00147$:
;	main.c:197: P1M0 = 0xFF;
	mov	_P1M0,#0xff
;	main.c:198: P1M1 = 0x00;
;	main.c:199: P5M0 = 0b000000000;
;	main.c:200: P5M1 = 0b000000000;
;	main.c:201: P3M0 = 0x00;
;	main.c:202: P3M1 = 0x00;
;	main.c:205: if (state == 1)
	clr	a
	mov	_P1M1,a
	mov	_P5M0,a
	mov	_P5M1,a
	mov	_P3M0,a
	mov	_P3M1,a
	mov	a,#0x01
	cjne	a,_state,00142$
;	main.c:207: min = ds_split2int(ds_readbyte(0x83));
	mov	dpl,#0x83
	lcall	_ds_readbyte
	lcall	_ds_split2int
	mov	_min,dpl
;	main.c:212: hour = ds_split2int(ds_readbyte(0x85)&0b00111111);
	mov	dpl,#0x85
	lcall	_ds_readbyte
	mov	a,dpl
	anl	a,#0x3f
	mov	dpl,a
	lcall	_ds_split2int
;	main.c:214: display_led(hour);
	mov  _hour,dpl
	lcall	_display_led
;	main.c:215: delay(2000);
	mov	dptr,#0x07d0
	lcall	_delay
;	main.c:216: display_led(min);
	mov	dpl,_min
	lcall	_display_led
;	main.c:217: delay(2000);
	mov	dptr,#0x07d0
	lcall	_delay
;	main.c:218: state = 0;
	mov	_state,#0x00
;	main.c:219: display_led(0x00);
	mov	dpl,#0x00
	lcall	_display_led
	ljmp	00143$
00142$:
;	main.c:221: else if (state == 2)
	mov	a,#0x02
	cjne	a,_state,00229$
	sjmp	00230$
00229$:
	ljmp	00139$
00230$:
;	main.c:223: EA = 0;
;	assignBit
	clr	_EA
;	main.c:224: flash();
	lcall	_flash
;	main.c:225: flash();
	lcall	_flash
;	main.c:227: while (1)
00115$:
;	main.c:229: display_led(hour);
	mov	dpl,_hour
	lcall	_display_led
;	main.c:230: if (!P3_3)
	jb	_P3_3,00108$
;	main.c:232: while(!P3_3)
00101$:
	jb	_P3_3,00103$
;	main.c:233: delay(10);
	mov	dptr,#0x000a
	lcall	_delay
	sjmp	00101$
00103$:
;	main.c:234: INCR(hour,0,24)
	mov	a,#0x100 - 0x18
	add	a,_hour
	jc	00105$
	inc	_hour
	sjmp	00108$
00105$:
	mov	_hour,#0x00
00108$:
;	main.c:236: if (!P3_2)
	jb	_P3_2,00115$
;	main.c:238: while(!P3_2)
00109$:
	jb	_P3_2,00131$
;	main.c:239: delay(10);
	mov	dptr,#0x000a
	lcall	_delay
;	main.c:243: while (1)
	sjmp	00109$
00131$:
;	main.c:245: display_led(min);
	mov	dpl,_min
	lcall	_display_led
;	main.c:246: if (!P3_3)
	jb	_P3_3,00124$
;	main.c:248: while(!P3_3)
00117$:
	jb	_P3_3,00119$
;	main.c:249: delay(10);
	mov	dptr,#0x000a
	lcall	_delay
	sjmp	00117$
00119$:
;	main.c:250: INCR(min,0,60)
	mov	a,#0x100 - 0x3c
	add	a,_min
	jc	00121$
	inc	_min
	sjmp	00124$
00121$:
	mov	_min,#0x00
00124$:
;	main.c:252: if (!P3_2)
	jb	_P3_2,00131$
;	main.c:254: while(!P3_2)
00125$:
	jb	_P3_2,00132$
;	main.c:255: delay(10);
	mov	dptr,#0x000a
	lcall	_delay
;	main.c:256: break;
	sjmp	00125$
00132$:
;	main.c:259: display_led(0x00);
	mov	dpl,#0x00
	lcall	_display_led
;	main.c:260: delay(1000);
	mov	dptr,#0x03e8
	lcall	_delay
;	main.c:261: EA = 1;
;	assignBit
	setb	_EA
;	main.c:262: ds_set_clock(min,hour,month,date,year);
	mov	_ds_set_clock_PARM_2,_hour
	mov	_ds_set_clock_PARM_3,_month
	mov	_ds_set_clock_PARM_4,_date
	mov	_ds_set_clock_PARM_5,_year
	mov	dpl,_min
	lcall	_ds_set_clock
;	main.c:263: ds_writebyte(0x80, 0x00);
	mov	_ds_writebyte_PARM_2,#0x00
	mov	dpl,#0x80
	lcall	_ds_writebyte
;	main.c:264: state = 0;
	mov	_state,#0x00
	sjmp	00143$
00139$:
;	main.c:266: else if (state == 3)
	mov	a,#0x03
	cjne	a,_state,00143$
;	main.c:268: EA = 0;
;	assignBit
	clr	_EA
;	main.c:269: while(P3_2)
00133$:
	jnb	_P3_2,00135$
;	main.c:271: sec = ds_split2int(ds_readbyte(0x81));
	mov	dpl,#0x81
	lcall	_ds_readbyte
	lcall	_ds_split2int
;	main.c:272: display_led(sec);
	mov  _sec,dpl
	lcall	_display_led
;	main.c:273: delay(100);
	mov	dptr,#0x0064
	lcall	_delay
	sjmp	00133$
00135$:
;	main.c:275: display_led(0x00);
	mov	dpl,#0x00
	lcall	_display_led
;	main.c:276: EA = 1;
;	assignBit
	setb	_EA
;	main.c:277: state = 0;
	mov	_state,#0x00
00143$:
;	main.c:279: if (pwrDown)
	jb	_pwrDown,00244$
	ljmp	00147$
00244$:
;	main.c:281: P1M0 = 0xff;
	mov	_P1M0,#0xff
;	main.c:282: P1M1 = 0xff;
	mov	_P1M1,#0xff
;	main.c:283: P5M0 = 0xff;
	mov	_P5M0,#0xff
;	main.c:284: P5M1 = 0xff;
	mov	_P5M1,#0xff
;	main.c:285: P3M0 = 0x00;
	mov	_P3M0,#0x00
;	main.c:286: P3M1 = 0x00;
	mov	_P3M1,#0x00
;	main.c:290: PCON |= 0x02;
	mov	r6,_PCON
	mov	r7,#0x00
	orl	ar6,#0x02
	mov	_PCON,r6
;	main.c:291: __asm__("nop");
	nop
;	main.c:292: __asm__("nop");
	nop
;	main.c:293: __asm__("nop");
	nop
;	main.c:294: __asm__("nop");
	nop
;	main.c:295: __asm__("nop");
	nop
;	main.c:296: __asm__("nop");
	nop
;	main.c:297: __asm__("nop");
	nop
;	main.c:298: __asm__("nop");
	nop
;	main.c:301: }
	ljmp	00147$
;------------------------------------------------------------
;Allocation info for local variables in function 'int0'
;------------------------------------------------------------
;	main.c:302: void int0() __interrupt 0
;	-----------------------------------------
;	 function int0
;	-----------------------------------------
_int0:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	main.c:304: pwrDown = 1;
;	assignBit
	setb	_pwrDown
;	main.c:305: while (!P3_2)
00103$:
	jb	_P3_2,00106$
;	main.c:307: delay(5);
	mov	dptr,#0x0005
	lcall	_delay
;	main.c:308: if (P3_2)
	jnb	_P3_2,00103$
;	main.c:310: state = 3;
	mov	_state,#0x03
;	main.c:311: break;
00106$:
;	main.c:314: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'int1'
;------------------------------------------------------------
;	main.c:315: void int1() __interrupt 2
;	-----------------------------------------
;	 function int1
;	-----------------------------------------
_int1:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	main.c:317: pwrDown = 1;
;	assignBit
	setb	_pwrDown
;	main.c:318: button_timer = 0;
	clr	a
	mov	_button_timer,a
	mov	(_button_timer + 1),a
;	main.c:319: while (!P3_3)
00104$:
	jb	_P3_3,00107$
;	main.c:321: delay(5);
	mov	dptr,#0x0005
	lcall	_delay
;	main.c:322: button_timer++;
	inc	_button_timer
	clr	a
	cjne	a,_button_timer,00122$
	inc	(_button_timer + 1)
00122$:
;	main.c:323: if (button_timer > 300)
	clr	c
	mov	a,#0x2c
	subb	a,_button_timer
	mov	a,#0x01
	subb	a,(_button_timer + 1)
	jnc	00102$
;	main.c:325: state = 2;
	mov	_state,#0x02
;	main.c:326: break;
	sjmp	00107$
00102$:
;	main.c:330: state = 1;
	mov	_state,#0x01
	sjmp	00104$
00107$:
;	main.c:333: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
