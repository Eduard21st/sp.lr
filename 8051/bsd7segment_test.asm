MOV 0X70, #11000000B
MOV 0X71, #11111001B
MOV 0X72, #10100100B
MOV 0X73, #10110000B
MOV 0X74, #10011001B
MOV 0X75, #10010010B
MOV 0X76, #10000010B
MOV 0X77, #11111000B
MOV 0X78, #10000000B
MOV 0X79, #10010000B

SETB P0.7
start:
SETB P3.3
SETB P3.4
MOV P1, 0X79
MOV P1, #0FFH
CLR P3.3
MOV P1, #10100100B
MOV P1, #0FFH
CLR P3.4
SETB P3.3
MOV P1, #10110000B
MOV P1, #0FFH
CLR P3.3
MOV P1, #10011001B
MOV P1, #0FFH
JMP start
