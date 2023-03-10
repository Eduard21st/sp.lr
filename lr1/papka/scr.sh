#!/bin/bash

echo "Разработчик: Семенов Эдуард"
echo "Название: Информация о файле"
echo "Скрипт запрашивает имя файла и, если такой файл существует, выводит его имя, тип, размер, владельца, права доступа и дату создания"
filename=""
cont="yes"

while true
do
	echo "Введите название файла:"
	read filename
	if [ -e $filename ] 
		then
			echo "Информация о файле"
			echo "Имя файла: "; stat -c%n $filename
			echo "Тип файла: "; stat -c%F $filename
			echo "Размер: "; stat -c%s $filename
			echo "Владелец: "; stat -c%U $filename
			echo "Права доступа: "; ls -l $filename | cut -c -10
			echo "Дата создания: "; stat -c%z $filename
			echo ""
		else 
			echo "Такого файла не существует" >/dev/stderr
			echo ""
	fi
	while true
    	do
		echo "Хотите продолжить? (y\n)"
		read cont
		case "$cont" in
				"y") echo "";  break;;
				"n") echo ""; echo "Выход из программы"; exit $?;;
				* ) echo "Ошибка. Необходимо ввести y или n" >/dev/stderr;;
            	esac
    	done
done
