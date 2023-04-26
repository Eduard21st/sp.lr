
MOV 0X30, #10 ;гмювемхе B

MOV 0X10, #2
MOV 0X11, #2
MOV 0X12, #1
MOV 0X13, #2
MOV 0X14, #2
MOV 0X15, #2
MOV 0X16, #3
MOV 0X17, #2
MOV 0X18, #4
MOV 0X19, #2
MOV 0X1A, #2
MOV 0X1B, #2

MOV 0X20, #0; нвхярйю оюлърх
MOV R2, #0
MOV R0, #10H ;сйюгюрекэ мю оюлърэ
MOV R3, #12 ;пюглеп люяяхбю
LOOP:
MOV A, @R0
CJNE A, 0X30, MISS

INC R0; йнцдю пюбмш
DJNZ R3, LOOP
JMP NEXT
MISS:
JNB PSW.7, SUM
; йнцдю лемэье
INC R2 ;явервхй лемэьху вхяек
INC R0
DJNZ R3, LOOP
JMP NEXT
SUM:;йнцдо анкэье
MOV A, @R0
ADD A, 0X20
MOV 0X20, A
INC R0
DJNZ R3, LOOP
NEXT:
NOP
;бшбнд
MOV A, R2 ;пюгдекемхе мю жхтпш
MOV B, #10
DIV AB
MOV 0X40, B
MOV B, #10
DIV AB
MOV 0X41, B
;йндш яелхяецлемрмшу хмдхйюрнпнб
MOV 0X50, #11000000B
MOV 0X51, #11111001B
MOV 0X52, #10100100B
MOV 0X53, #10110000B
MOV 0X54, #10011001B
MOV 0X55, #10010010B
MOV 0X56, #10000010B
MOV 0X57, #11111000B
MOV 0X58, #10000000B
MOV 0X59, #10010000B

JMP NEXT2

POD:; ондопнцпюллю
ADD A, #50H
MOV R1, A
RET

NEXT2:
MOV A, 0X40
CALL POD
MOV A, @R1
MOV R7, A

MOV A, 0X41
CALL POD
MOV A, @R1
MOV R6, A

SETB P0.7 ;яелхяецлемрмше
start:
CLR P3.4
SETB P3.3
MOV P1, R6
MOV P1, #0FFH
CLR P3.3
MOV P1, R7
MOV P1, #0FFH
JMP start