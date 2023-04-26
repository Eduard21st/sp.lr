MOV R0, #10h ; загрузка указателя на массив
MOV R2, #0 ; счетчик элементов, меньших М
MOV R3, #0 ; сумма элементов, превышающих М
MOV R7, #10 ;размер массива

MOV 0X10, #11 ;массив данных
MOV 0X11, #14
MOV 0X12, #15
MOV 0X13, #2
MOV 0X14, #2
MOV 0X15, #2
MOV 0X16, #3
MOV 0X17, #2
MOV 0X18, #4
MOV 0X19, #2
MOV 0X1A, #2
MOV 0X1B, #2

LOOP:
MOV A, @R0 ; загрузка текущего элемента массива
CJNE A, #10, ELSE ; если элемент не равен M, то переходим в ELSE
INC R0 ; увеличиваем указатель на 1
SJMP CONTINUE ; переходим к следующей итерации цикла
ELSE:
JNB PSW.7, GREATER ; если текущий элемент больше M, то переходим в GREATER
INC R2 ;инкремент счетчика меньших чисел
SJMP CONTINUE ; переходим к следующей итерации цикла
GREATER:
ADD A, R3 ; добавляем текущий элемент к сумме элементов, превышающих M
MOV R3, A ; сохраняем сумму в R3
CONTINUE:
INC R0 ; увеличиваем указатель на 1
DJNZ R7, LOOP ; продолжаем цикл до тех пор, пока не обойдем весь массив

;коды семисегментных индикаторов
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

;подпрограмма
jmp skip
procedure:
ADD A, #70H
MOV R1, A
ret
skip:

MOV A, R3 ;разделение старшей цифры
RR A
RR A
RR A
RR A
ANL A, #15
call procedure
MOV A, @R1
MOV R7, A ;запись в регистр R7 кода семисегментного индикатора

MOV A, R3 ;разделение младшей цифры
ANL A, #15
call procedure
MOV A, @R1
MOV R6, A ;запись в регистр R6 кода семисегментного индикатора

SETB P0.7
start:
CLR P3.4
SETB P3.3
MOV P1, R7
MOV P1, #0FFH
CLR P3.3
MOV P1, R6
MOV P1, #0FFH
JMP start