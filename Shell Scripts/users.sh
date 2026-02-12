#!/bin/bash
#Fecha:12/02/2026
#Autor:Jesús González Folleco
clear

#ejecutador=$(whoami)
contador=0

if [ $UID != 0 ]; then

	echo "No eres root"
	exit

else

	echo "Bienvenido root"

fi

valor=$1

if [ ! $1 ]; then

	valor=1000
fi

lineas=$(cat /etc/passwd)
fecha_actual=$(date "+%Y-%m-%d")
hora=$(date +%H:%M)

echo "=========================================="
echo "Informe de los usuarios el día $fecha_actual a las $hora"

for l in $lineas; do
usuario=$(echo "$l" | cut -d ":" -f 3)
nombre=$(echo "$l" | cut -d ":" -f 1)

	if [ $usuario -ge $valor 2>/dev/null ]; then
		contador=$(($contador+1))
		echo "$nombre - $usuario"
	fi
done

echo "Total de usuarios: $contador"
echo "=========================================="
echo "$fecha_actual - $hora - El usuario $USER ha solicitado un informe de usuarios" >> "/tmp/logeventos"
