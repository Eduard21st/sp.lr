MOV 0X40, #250
MOV 0X41, #249
MOV 0X42, #248
MOV 0X43, #247
MOV 0X44, #246
MOV 0X45, #245
MOV 0X46, #244
MOV 0X47, #243
MOV 0X48, #242
MOV 0X49, #241
MOV R0, #40H
MOV R5, #10
MOV 0X50, #0
m:
MOV A, @R0
XRL A, #240
MOV @R0, A
INC R0
DJNZ R5, m
MOV A, #0
MOV R0, #3FH
MOV R5, #10
m2:
INC R0
MOV A, @R0
MOV B, #2
DIV AB
MOV A,B
CJNE A, #0, NECHET
JMP CHET
NECHET:
DJNZ R5, m2
JMP m3
CHET:
MOV A, @R0
ADD A, 0X50
MOV 0X50, A
DJNZ R5, m2
NOP

m3:
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
MOV 0X7A, #10001000B
MOV 0X7B, #10000011B
MOV 0X7C, #11000110B
MOV 0X7D, #10100001B
MOV 0X7E, #10000110B
MOV 0X7F, #10001110B

MOV A, 0X50
ANL A, #15
MOV 0X61, A

MOV A, 0X50
RR A
RR A
RR A
RR A
ANL A, #15
MOV 0X60, A

JMP NEXT
POD:
ADD A, #70H ;���������� ������ ����
MOV R1, A ;���������� � ��������� ����� ������
MOV P1, @R1 ; ������� �� �������������� ���.
RET

NEXT:
SETB P0.7
start:
CLR P3.4
SETB P3.3
MOV A, 0X60
CALL POD
MOV P1, #0FFH
CLR P3.3
MOV A, 0X61
CALL POD
MOV P1, #0FFH
JMP start
