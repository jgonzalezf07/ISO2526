# Jesús González Folleco
# Fecha: 25/03/2026
# Dado un fichero denominado rutas.txt, que contine el nombre de ficheros y directorios que ya deben existir, introducir
# 2 listas diferentes cada uno de ellos, es decir, en una lista los ficheros y en otra los directorios, hbrá que comprobar linea a linea
# si lo que ha leido es un fichero o un directorio).
# Posteriormente, se le pedirá al ususario qué elija una opción:
# A - Pedir nombre de fichero y eliminarlo
# B - Pedir nombre de directorio y mostrar su información
# C - Pedir nombre de fichero, nombre de destino y copiarlo en dicho destino
# D - Mostrar lista elegida por el usuario
# E - Salir

import os
import shutil

if os.geteuid() != 0:
    print ("Debes ejecutar este script como root")
    exit()

ficheros=[]
directorios=[]

with open("rutas.txt", "r") as r:
    for linea in r:
        ruta = linea.strip()
        if os.path.isfile(ruta):
            ficheros.append(ruta)
        if os.path.isdir(ruta):
            directorios.append(ruta)

while True:
    print("==========MENÚ==========")
    print("Opción A, pedir nombre de fichero y eliminarlo")
    print("Opción B, pedir nombre de directorio y mostrar su info")
    print("Opción C, pedir fichero, nombre de destino y copiarlo")
    print("Opción D, mostrar lista")
    print("Opción E, salir")
    opt=input("Elija una opción: ").upper()

    match opt:
        case "A":
            fichero=int(input("Nombre del fichero que quieres eliminar: "))
            if os.path.isfile(fichero):
                os.remove(fichero)
            else:
                print("No existe el fichero")
        case "B":
            directorio=int(input("Nombre del directorio: "))
            if os.path.isdir(directorio):
                print("Contenido", os.listdir(directorio))
            else:
                print("No existe el directorio")
        case "C":
                origen = int(input("Fichero de origen:"))
                destino = int(input("Directorio de destino"))
                if os.path.isfile(origen) and os.path.isdir(destino):
                    shutil.copy(origen, destino)
                    print("Fichero copiado")
                else:
                    print("Error en las rutas")
        case "D":
                tipo = input("¿Qué lista quieres ver?").lower()
                if tipo == "ficheros":
                    print(ficheros)
                if tipo == "directorios":
                    print(directorios)
        case "E":
            print("Saliendo...")
            break
        case _:
            print("Opción no válida")
            exit()




