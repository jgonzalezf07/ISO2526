#!/bin/bash
#Autor: Jesús González Folleco
#Fecha: 10/02/2026

clear

function comprobacion (){

        if [ $# -ne 2 ]; then

                echo "No has introducido dos parámetros"
                exit
        fi

        if [ -f $1 ]; then

                echo "El fichero existe"
                exit

        fi

        if [ ! -d $2 ]; then

                echo "El directorio no es un directorio o no existe"
                exit
        fi

        if ! ls -l $2 > /dev/null; then

                echo "El directorio está vacío"
                exit
        fi
}

comprobacion $1 $2

echo "Jesús González Folleco"

for f in "$2"/*.txt; do
contador=0
lineas=$(cat "$f" | wc -l)

	if [ "$lineas" -ge 5 ]; then

		echo "$f"
		echo "$f" >> "$1"
		contador=$((contador+1))
		echo "Se ha copiado el nombre de los ficheros existentes en $f"
	fi
	pal=$(cat $f | wc -w)
	echo "El fichero original tiene $pal" > "$f.q"
	cat "$f" >> "$f.q"
	echo "Se ha creado la extensión .q correctamente"
done

	echo "$f" > "El número de ficheros identificados es $contador"
