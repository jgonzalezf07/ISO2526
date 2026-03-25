# Jesús González Folleco
# Fecha: 24/3/2026
# Debéis crear un script en Python que tenga un menú con 4 opciones
# el programa acaba cuando se introduce la opción 4. Se debe comprobar que el usuario que ejecuta el script
# sea root.
# Opción 1: Muestra información del SSOO e informa de la CPU
# Opción 2: Pedir un usario. Si existe, se muestra información de él, sino, se crea
# Opción 3: Pedir al usuario un directorio. Comprobar si existe y si es un directorio, en caso contrario, lo crea
# Opción 4: Salir

import os
import cpuinfo

if os.geteuid() != 0:
    print ("Debes ejecutar este script como root")
    exit()

while True:
    print("==========Menú==========")
    print("Opción 1: (info)")
    print("Opción 2: (users)")
    print("Opción 3: (directorio)")
    print("Opción 4: (salir)")
    print("=========================")
    opt=int(input("Elija una opción: "))

    match opt:
        case 1:
            print("Información del sistemas operativo")
            print("El sistema operativo es:", os.uname())
            cpu = cpuinfo.get_cpu_info()
            print("Informacioń de la CPU:", cpu['brand_raw'])
        case 2:
            users = int(input("Dime un usuario: "))
            passwd = open("etc/passwd")
            passwdlist = passwd.readlines()
            for i in passwdlist:
                    if users in i:
                        print(i)
                    else:
                        print("El usuario no existe, creando usario...")
                        os.system("useradd -m",+ users)

        case 3:
            directorio = int(input("Dime un directorio"))
            if os.path.exists(directorio):
                if os.path.isdir(directorio):
                    print("El directorio existe")
                else:
                    print("Existe pero no es un directorio")
            else:
                print("El directorio no existe, creando...")
                os.mkdir(directorio)
        case 4:
            print("Saliendo...")
            break
        case _:
            print("Opción no válida")


