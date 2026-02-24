#!/bin/bash
#Autor: Jesús González Folleco
#Fecha:04/02/2026

clear

echo "Jesús González Folleco"


if [ -f $1 ]; then

        echo "El fichero existe"
        exit

fi

if [ $# -ne 2 ]; then

	echo "No has introducido dos parámetros"
	exit
fi


for ((contador=1; contador<=$2; contador++)); do

read -p "Dime que operación quieres hacer: " op op1 op2

case $op in

	"S")
		res=$(($op1+$op2))
		echo "$op1 + $op2 = $res"
		echo "$op $op1 $op2" >>$1

	;;

	"R")
        res=$(($op1 - $op2))
        echo "$op1 - $op2 = $res "
		echo "$op $op1 $op2" >>$1

        ;;

	"M")
        res=$(($op1*$op2))
        echo "$op1 * $op2 = $res "
		echo "$op $op1 $op2" >>$1

        ;;

	"D")
        res=$(($op1/$op2))
        echo "$op1 / $op2 = $res "
		echo "$op $op1 $op2" >>$1 
        ;;

	"X")
		echo "Saliendo..."
		exit
	;;
	
esac
done

echo "Has realizado $contador operaciones"
cat $1
