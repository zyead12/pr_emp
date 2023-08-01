
_count:

;MyProject.c,23 :: 		void count(int count)
;MyProject.c,25 :: 		right=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_count_count+0, 0
	MOVWF      R0+0
	MOVF       FARG_count_count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__count+0
	MOVF       R0+1, 0
	MOVWF      FLOC__count+1
	MOVF       FLOC__count+0, 0
	MOVWF      _right+0
	MOVF       FLOC__count+1, 0
	MOVWF      _right+1
;MyProject.c,26 :: 		left=count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_count_count+0, 0
	MOVWF      R0+0
	MOVF       FARG_count_count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;MyProject.c,27 :: 		portd=right+(left*16);
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__count71:
	BTFSC      STATUS+0, 2
	GOTO       L__count72
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__count71
L__count72:
	MOVF       R2+0, 0
	ADDWF      FLOC__count+0, 0
	MOVWF      PORTD+0
;MyProject.c,28 :: 		msd=1;
	BSF        PORTB+0, 1
;MyProject.c,29 :: 		lsd=1;
	BSF        PORTB+0, 2
;MyProject.c,30 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_count0:
	DECFSZ     R13+0, 1
	GOTO       L_count0
	DECFSZ     R12+0, 1
	GOTO       L_count0
	DECFSZ     R11+0, 1
	GOTO       L_count0
	NOP
	NOP
;MyProject.c,32 :: 		}
L_end_count:
	RETURN
; end of _count

_part2:

;MyProject.c,33 :: 		void part2(int str){
;MyProject.c,34 :: 		for(j=str;j>=0;j--)
	MOVF       FARG_part2_str+0, 0
	MOVWF      _j+0
	MOVF       FARG_part2_str+1, 0
	MOVWF      _j+1
L_part21:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__part274
	MOVLW      0
	SUBWF      _j+0, 0
L__part274:
	BTFSS      STATUS+0, 0
	GOTO       L_part22
;MyProject.c,38 :: 		count(j);
	MOVF       _j+0, 0
	MOVWF      FARG_count_count+0
	MOVF       _j+1, 0
	MOVWF      FARG_count_count+1
	CALL       _count+0
;MyProject.c,39 :: 		if(j>3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__part275
	MOVF       _j+0, 0
	SUBLW      3
L__part275:
	BTFSC      STATUS+0, 0
	GOTO       L_part24
;MyProject.c,41 :: 		red2=1;
	BSF        PORTC+0, 3
;MyProject.c,42 :: 		green1=1;
	BSF        PORTC+0, 2
;MyProject.c,45 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_part25
;MyProject.c,47 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__part276
	BCF        PORTB+0, 1
	GOTO       L__part277
L__part276:
	BSF        PORTB+0, 1
L__part277:
;MyProject.c,49 :: 		counter=3;
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,50 :: 		h=1;
	MOVLW      1
	MOVWF      _h+0
	MOVLW      0
	MOVWF      _h+1
;MyProject.c,52 :: 		break;
	GOTO       L_part22
;MyProject.c,53 :: 		}
L_part25:
;MyProject.c,54 :: 		}
L_part24:
;MyProject.c,55 :: 		if(j<=3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__part278
	MOVF       _j+0, 0
	SUBLW      3
L__part278:
	BTFSS      STATUS+0, 0
	GOTO       L_part26
;MyProject.c,58 :: 		red2=1;
	BSF        PORTC+0, 3
;MyProject.c,59 :: 		green1=0;
	BCF        PORTC+0, 2
;MyProject.c,60 :: 		yellow1=1          ;
	BSF        PORTC+0, 1
;MyProject.c,61 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_part27
;MyProject.c,63 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__part279
	BCF        PORTB+0, 1
	GOTO       L__part280
L__part279:
	BSF        PORTB+0, 1
L__part280:
;MyProject.c,65 :: 		counter=4;
	MOVLW      4
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,68 :: 		break;
	GOTO       L_part22
;MyProject.c,69 :: 		}
L_part27:
;MyProject.c,70 :: 		}
L_part26:
;MyProject.c,34 :: 		for(j=str;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;MyProject.c,72 :: 		}
	GOTO       L_part21
L_part22:
;MyProject.c,73 :: 		if(j==0)h=0;
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__part281
	MOVLW      0
	XORWF      _j+0, 0
L__part281:
	BTFSS      STATUS+0, 2
	GOTO       L_part28
	CLRF       _h+0
	CLRF       _h+1
L_part28:
;MyProject.c,74 :: 		red2=0;
	BCF        PORTC+0, 3
;MyProject.c,75 :: 		yellow1=0;
	BCF        PORTC+0, 1
;MyProject.c,76 :: 		green1=0;
	BCF        PORTC+0, 2
;MyProject.c,77 :: 		}
L_end_part2:
	RETURN
; end of _part2

_part1:

;MyProject.c,78 :: 		void part1(int str)
;MyProject.c,81 :: 		for(j=str;j>=0;j--)
	MOVF       FARG_part1_str+0, 0
	MOVWF      _j+0
	MOVF       FARG_part1_str+1, 0
	MOVWF      _j+1
L_part19:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__part183
	MOVLW      0
	SUBWF      _j+0, 0
L__part183:
	BTFSS      STATUS+0, 0
	GOTO       L_part110
;MyProject.c,83 :: 		count(j);
	MOVF       _j+0, 0
	MOVWF      FARG_count_count+0
	MOVF       _j+1, 0
	MOVWF      FARG_count_count+1
	CALL       _count+0
;MyProject.c,84 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_part112
;MyProject.c,86 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__part184
	BCF        PORTB+0, 1
	GOTO       L__part185
L__part184:
	BSF        PORTB+0, 1
L__part185:
;MyProject.c,88 :: 		counter=1;
	MOVLW      1
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,91 :: 		break;
	GOTO       L_part110
;MyProject.c,92 :: 		}
L_part112:
;MyProject.c,93 :: 		if(j<=3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__part186
	MOVF       _j+0, 0
	SUBLW      3
L__part186:
	BTFSS      STATUS+0, 0
	GOTO       L_part113
;MyProject.c,96 :: 		red1=1;
	BSF        PORTC+0, 0
;MyProject.c,97 :: 		green2=0;
	BCF        PORTC+0, 5
;MyProject.c,98 :: 		yellow2=1;
	BSF        PORTC+0, 4
;MyProject.c,99 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_part114
;MyProject.c,101 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__part187
	BCF        PORTB+0, 1
	GOTO       L__part188
L__part187:
	BSF        PORTB+0, 1
L__part188:
;MyProject.c,103 :: 		counter=2;
	MOVLW      2
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,106 :: 		break;
	GOTO       L_part110
;MyProject.c,107 :: 		}
L_part114:
;MyProject.c,108 :: 		}
L_part113:
;MyProject.c,81 :: 		for(j=str;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;MyProject.c,112 :: 		}
	GOTO       L_part19
L_part110:
;MyProject.c,113 :: 		red1=0;
	BCF        PORTC+0, 0
;MyProject.c,114 :: 		yellow2=0;
	BCF        PORTC+0, 4
;MyProject.c,115 :: 		}
L_end_part1:
	RETURN
; end of _part1

_autom:

;MyProject.c,127 :: 		void autom()
;MyProject.c,132 :: 		for(j=15;j>=0;j--)
	MOVLW      15
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_autom15:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom90
	MOVLW      0
	SUBWF      _j+0, 0
L__autom90:
	BTFSS      STATUS+0, 0
	GOTO       L_autom16
;MyProject.c,137 :: 		if(j>3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom91
	MOVF       _j+0, 0
	SUBLW      3
L__autom91:
	BTFSC      STATUS+0, 0
	GOTO       L_autom18
;MyProject.c,139 :: 		red1=1;
	BSF        PORTC+0, 0
;MyProject.c,140 :: 		green2=1;
	BSF        PORTC+0, 5
;MyProject.c,143 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_autom19
;MyProject.c,145 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__autom92
	BCF        PORTB+0, 1
	GOTO       L__autom93
L__autom92:
	BSF        PORTB+0, 1
L__autom93:
;MyProject.c,147 :: 		counter=1;
	MOVLW      1
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,150 :: 		break;
	GOTO       L_autom16
;MyProject.c,151 :: 		}
L_autom19:
;MyProject.c,152 :: 		}
L_autom18:
;MyProject.c,153 :: 		count(j);
	MOVF       _j+0, 0
	MOVWF      FARG_count_count+0
	MOVF       _j+1, 0
	MOVWF      FARG_count_count+1
	CALL       _count+0
;MyProject.c,155 :: 		if(j<=3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom94
	MOVF       _j+0, 0
	SUBLW      3
L__autom94:
	BTFSS      STATUS+0, 0
	GOTO       L_autom20
;MyProject.c,159 :: 		red1=1;
	BSF        PORTC+0, 0
;MyProject.c,160 :: 		green2=0;
	BCF        PORTC+0, 5
;MyProject.c,161 :: 		yellow2=1;
	BSF        PORTC+0, 4
;MyProject.c,162 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_autom21
;MyProject.c,164 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__autom95
	BCF        PORTB+0, 1
	GOTO       L__autom96
L__autom95:
	BSF        PORTB+0, 1
L__autom96:
;MyProject.c,166 :: 		counter=2;
	MOVLW      2
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,169 :: 		break;
	GOTO       L_autom16
;MyProject.c,170 :: 		}
L_autom21:
;MyProject.c,171 :: 		}
L_autom20:
;MyProject.c,132 :: 		for(j=15;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;MyProject.c,175 :: 		}
	GOTO       L_autom15
L_autom16:
;MyProject.c,178 :: 		red1=0;
	BCF        PORTC+0, 0
;MyProject.c,179 :: 		yellow2=0;
	BCF        PORTC+0, 4
;MyProject.c,188 :: 		for(j=23;j>=0;j--)
	MOVLW      23
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_autom22:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom97
	MOVLW      0
	SUBWF      _j+0, 0
L__autom97:
	BTFSS      STATUS+0, 0
	GOTO       L_autom23
;MyProject.c,189 :: 		{                      if(counter==1||counter==2 )
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom98
	MOVLW      1
	XORWF      _counter+0, 0
L__autom98:
	BTFSC      STATUS+0, 2
	GOTO       L__autom68
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom99
	MOVLW      2
	XORWF      _counter+0, 0
L__autom99:
	BTFSC      STATUS+0, 2
	GOTO       L__autom68
	GOTO       L_autom27
L__autom68:
;MyProject.c,191 :: 		break;
	GOTO       L_autom23
;MyProject.c,192 :: 		}
L_autom27:
;MyProject.c,194 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,195 :: 		if(j>3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom100
	MOVF       _j+0, 0
	SUBLW      3
L__autom100:
	BTFSC      STATUS+0, 0
	GOTO       L_autom28
;MyProject.c,198 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_autom29
;MyProject.c,200 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__autom101
	BCF        PORTB+0, 1
	GOTO       L__autom102
L__autom101:
	BSF        PORTB+0, 1
L__autom102:
;MyProject.c,204 :: 		counter=3;
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,206 :: 		break;
	GOTO       L_autom23
;MyProject.c,207 :: 		}
L_autom29:
;MyProject.c,208 :: 		red2=1;
	BSF        PORTC+0, 3
;MyProject.c,209 :: 		green1=1;
	BSF        PORTC+0, 2
;MyProject.c,210 :: 		}
L_autom28:
;MyProject.c,211 :: 		count(j);
	MOVF       _j+0, 0
	MOVWF      FARG_count_count+0
	MOVF       _j+1, 0
	MOVWF      FARG_count_count+1
	CALL       _count+0
;MyProject.c,214 :: 		if(j<=3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__autom103
	MOVF       _j+0, 0
	SUBLW      3
L__autom103:
	BTFSS      STATUS+0, 0
	GOTO       L_autom30
;MyProject.c,217 :: 		red2=1;
	BSF        PORTC+0, 3
;MyProject.c,218 :: 		green1=0;
	BCF        PORTC+0, 2
;MyProject.c,219 :: 		yellow1=1;
	BSF        PORTC+0, 1
;MyProject.c,220 :: 		if(sw==0)
	BTFSC      PORTC+0, 7
	GOTO       L_autom31
;MyProject.c,223 :: 		msd=lsd=0;
	BCF        PORTB+0, 2
	BTFSC      PORTB+0, 2
	GOTO       L__autom104
	BCF        PORTB+0, 1
	GOTO       L__autom105
L__autom104:
	BSF        PORTB+0, 1
L__autom105:
;MyProject.c,224 :: 		counter=4;
	MOVLW      4
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,226 :: 		break;
	GOTO       L_autom23
;MyProject.c,227 :: 		}
L_autom31:
;MyProject.c,229 :: 		}
L_autom30:
;MyProject.c,188 :: 		for(j=23;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;MyProject.c,238 :: 		}
	GOTO       L_autom22
L_autom23:
;MyProject.c,240 :: 		red2=0;
	BCF        PORTC+0, 3
;MyProject.c,241 :: 		yellow1=0;
	BCF        PORTC+0, 1
;MyProject.c,242 :: 		green2=0;
	BCF        PORTC+0, 5
;MyProject.c,248 :: 		}
L_end_autom:
	RETURN
; end of _autom

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,251 :: 		void interrupt()
;MyProject.c,253 :: 		if(intf_bit==1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt32
;MyProject.c,256 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;MyProject.c,257 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;MyProject.c,259 :: 		}
L_interrupt32:
;MyProject.c,260 :: 		}
L_end_interrupt:
L__interrupt107:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,262 :: 		void main() {
;MyProject.c,263 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;MyProject.c,264 :: 		trisb=0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,269 :: 		portb=0;
	CLRF       PORTB+0
;MyProject.c,270 :: 		trisc=0b10000000;
	MOVLW      128
	MOVWF      TRISC+0
;MyProject.c,271 :: 		portc=0;
	CLRF       PORTC+0
;MyProject.c,272 :: 		trisd=0b00000000;portd=0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;MyProject.c,276 :: 		for(;;)
L_main33:
;MyProject.c,279 :: 		while(sw==1)
L_main36:
	BTFSS      PORTC+0, 7
	GOTO       L_main37
;MyProject.c,284 :: 		autom();
	CALL       _autom+0
;MyProject.c,286 :: 		}
	GOTO       L_main36
L_main37:
;MyProject.c,287 :: 		while(sw==0||sw==1)
L_main38:
	BTFSS      PORTC+0, 7
	GOTO       L__main69
	BTFSC      PORTC+0, 7
	GOTO       L__main69
	GOTO       L_main39
L__main69:
;MyProject.c,289 :: 		while(sw==1)
L_main42:
	BTFSS      PORTC+0, 7
	GOTO       L_main43
;MyProject.c,291 :: 		autom();
	CALL       _autom+0
;MyProject.c,292 :: 		}
	GOTO       L_main42
L_main43:
;MyProject.c,293 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;MyProject.c,294 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,295 :: 		intedg_bit=1;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;MyProject.c,296 :: 		while(counter==1)
L_main44:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main109
	MOVLW      1
	XORWF      _counter+0, 0
L__main109:
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;MyProject.c,298 :: 		while(sw==1)
L_main46:
	BTFSS      PORTC+0, 7
	GOTO       L_main47
;MyProject.c,301 :: 		autom();
	CALL       _autom+0
;MyProject.c,302 :: 		}
	GOTO       L_main46
L_main47:
;MyProject.c,303 :: 		red1=1;
	BSF        PORTC+0, 0
;MyProject.c,305 :: 		green2=1;
	BSF        PORTC+0, 5
;MyProject.c,308 :: 		}
	GOTO       L_main44
L_main45:
;MyProject.c,310 :: 		while(counter==2)
L_main48:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main110
	MOVLW      2
	XORWF      _counter+0, 0
L__main110:
	BTFSS      STATUS+0, 2
	GOTO       L_main49
;MyProject.c,315 :: 		red1=1;
	BSF        PORTC+0, 0
;MyProject.c,317 :: 		green2=0;
	BCF        PORTC+0, 5
;MyProject.c,318 :: 		yellow2=1;
	BSF        PORTC+0, 4
;MyProject.c,320 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
	NOP
;MyProject.c,321 :: 		counter=3;
	MOVLW      3
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,322 :: 		while(sw==1)
L_main51:
	BTFSS      PORTC+0, 7
	GOTO       L_main52
;MyProject.c,325 :: 		part1(3);
	MOVLW      3
	MOVWF      FARG_part1_str+0
	MOVLW      0
	MOVWF      FARG_part1_str+1
	CALL       _part1+0
;MyProject.c,326 :: 		part2(23);
	MOVLW      23
	MOVWF      FARG_part2_str+0
	MOVLW      0
	MOVWF      FARG_part2_str+1
	CALL       _part2+0
;MyProject.c,328 :: 		autom();
	CALL       _autom+0
;MyProject.c,329 :: 		}
	GOTO       L_main51
L_main52:
;MyProject.c,332 :: 		}
	GOTO       L_main48
L_main49:
;MyProject.c,334 :: 		while(counter==3)
L_main53:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main111
	MOVLW      3
	XORWF      _counter+0, 0
L__main111:
	BTFSS      STATUS+0, 2
	GOTO       L_main54
;MyProject.c,338 :: 		red1=0;
	BCF        PORTC+0, 0
;MyProject.c,339 :: 		red2=1;
	BSF        PORTC+0, 3
;MyProject.c,340 :: 		green1=1;
	BSF        PORTC+0, 2
;MyProject.c,341 :: 		yellow2=0;
	BCF        PORTC+0, 4
;MyProject.c,343 :: 		while(sw==1)
L_main55:
	BTFSS      PORTC+0, 7
	GOTO       L_main56
;MyProject.c,346 :: 		part2(23);
	MOVLW      23
	MOVWF      FARG_part2_str+0
	MOVLW      0
	MOVWF      FARG_part2_str+1
	CALL       _part2+0
;MyProject.c,347 :: 		while(h==1)
L_main57:
	MOVLW      0
	XORWF      _h+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main112
	MOVLW      1
	XORWF      _h+0, 0
L__main112:
	BTFSS      STATUS+0, 2
	GOTO       L_main58
;MyProject.c,349 :: 		part2(23);
	MOVLW      23
	MOVWF      FARG_part2_str+0
	MOVLW      0
	MOVWF      FARG_part2_str+1
	CALL       _part2+0
;MyProject.c,350 :: 		}
	GOTO       L_main57
L_main58:
;MyProject.c,351 :: 		autom();
	CALL       _autom+0
;MyProject.c,355 :: 		}
	GOTO       L_main55
L_main56:
;MyProject.c,357 :: 		}
	GOTO       L_main53
L_main54:
;MyProject.c,359 :: 		while(counter==4)
L_main59:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main113
	MOVLW      4
	XORWF      _counter+0, 0
L__main113:
	BTFSS      STATUS+0, 2
	GOTO       L_main60
;MyProject.c,361 :: 		red2=1;
	BSF        PORTC+0, 3
;MyProject.c,362 :: 		green1=0;
	BCF        PORTC+0, 2
;MyProject.c,363 :: 		yellow1=1;
	BSF        PORTC+0, 1
;MyProject.c,364 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	DECFSZ     R11+0, 1
	GOTO       L_main61
	NOP
;MyProject.c,365 :: 		counter=5;
	MOVLW      5
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,367 :: 		while(sw==1)
L_main62:
	BTFSS      PORTC+0, 7
	GOTO       L_main63
;MyProject.c,369 :: 		part2(3);
	MOVLW      3
	MOVWF      FARG_part2_str+0
	MOVLW      0
	MOVWF      FARG_part2_str+1
	CALL       _part2+0
;MyProject.c,370 :: 		autom();
	CALL       _autom+0
;MyProject.c,371 :: 		}
	GOTO       L_main62
L_main63:
;MyProject.c,373 :: 		}
	GOTO       L_main59
L_main60:
;MyProject.c,374 :: 		while(counter==5)
L_main64:
	MOVLW      0
	XORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main114
	MOVLW      5
	XORWF      _counter+0, 0
L__main114:
	BTFSS      STATUS+0, 2
	GOTO       L_main65
;MyProject.c,376 :: 		while(sw==1)
L_main66:
	BTFSS      PORTC+0, 7
	GOTO       L_main67
;MyProject.c,379 :: 		autom();
	CALL       _autom+0
;MyProject.c,380 :: 		}
	GOTO       L_main66
L_main67:
;MyProject.c,381 :: 		red2=0;
	BCF        PORTC+0, 3
;MyProject.c,382 :: 		yellow1=0;
	BCF        PORTC+0, 1
;MyProject.c,384 :: 		counter=1;
	MOVLW      1
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
;MyProject.c,386 :: 		}
	GOTO       L_main64
L_main65:
;MyProject.c,388 :: 		}
	GOTO       L_main38
L_main39:
;MyProject.c,391 :: 		}
	GOTO       L_main33
;MyProject.c,392 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
