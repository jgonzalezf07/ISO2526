#!/bin/bash
#Autor:Jesús González Folleco
#Fecha:29/01/2026

clear

echo "============================="
echo "      - Menú de agenda -  "
echo "============================="
echo "Opción A Añadir una entrada"
echo "Opción B Buscar DNI"
echo "Opción C Ver la agenda entera"
echo "Opción D Eliminar entradas"
echo "Opción E Finalizar"
echo "============================="

while true; do

read -p "Introduzca una opción: " opt

case $opt in

	"A")
		read -p "Introduce el DNI: " dni
		com=$(grep "^$dni:" agenda.txt | cut -d ":" -f 1)

		if [ "$dni" == "$com" ]; then

			echo "Usuario dado de alta"
		else
			read -p "Introduce nombre: " nom
			read -p "Introduce apellidos: " apell1 apell2
			read -p "Introduce localidad: " loc
			echo $dni:$nom:$apell1 $apell2:$loc >> agenda.txt
			echo "Entrada completada con éxito"
		fi
	;;

	"B")
		read -p "Introduce el DNI: " dni

		if grep "^$dni:" agenda.txt >/dev/null ; then

		nom=$(grep "^$dni:" agenda.txt | cut -d ":" -f 2)
		apell=$(grep "^$dni" agenda.txt | cut -d ":" -f 3)
		loc=$(grep "^$dni" agenda.txt | cut -d ":" -f 4 )
		echo "Es nombre es $nom los apellidos son $apell y la localidad es $loc"

		fi
	;;

	"C")
		if [ -f agenda.txt ]; then
			cat agenda.txt
		else
			echo "Estado de la agenda: Vacía"
		fi
	;;

	"D")
		echo >agenda.txt
		echo "El archivo ha sido vaciado "
	;;

	"E")
		echo "Finalizando..."
		break
	;;

	*)
		echo "ERROR al introducir una opción"
		break
	;;
esac

done
