#!/bin/bash
prueba=$(ps -e | grep dans | wc -l)
if [ $prueba -eq 0 ]
then
    frase2="Conectar a Internet"
else
    frase2="Desconectar de Internet"
fi
prueba=$(grep "= 1$" /etc/dansguardian/dansguardianf1.conf | wc -l)
if [ $prueba -eq 1 ]
    then
    #Esta filtrando
    frase="Desactivar filtro de contenidos"
else
    frase="Activar filtro de contenidos"
fi
cd ~/scriptsSSH
x=$(zenity --list --radiolist  --width=400 --height=350  --title "Sala de informática" --column " " --column "Acción" FALSE "Enviar un archivo a todos los estudiantes" FALSE "Enviar un archivo a un estudiante" FALSE "Que todos vean mi pantalla" FALSE "Que dejen de ver mi pantalla" FALSE "$frase" FALSE "$frase2" FALSE "Abrir una página Web en todas las PC" FALSE "¡Apagar todos los equipos de los alumnos!" FALSE "Salir")
case $x in    
    "Enviar un archivo a todos los estudiantes")
         ./todos_copiarZ.sh;;
    "Enviar un archivo a un estudiante")
         ./uno_copiarZ.sh;;
    "Que todos vean mi pantalla")
         ./vnc_todosZ.sh;;
    "Que dejen de ver mi pantalla")
         ./vnc_todos_finZ.sh;;
    "Desactivar filtro de contenidos")
         comando="cp /etc/dansguardian/NO_FILTRAR /etc/dansguardian/dansguardianf1.conf"
         PASSWORD=$(zenity --password --text="Ingrese la contraseña de su usuario")
         echo $PASSWORD | sudo -S $comando
         echo $PASSWORD | sudo -S service dansguardian restart;;
    "Activar filtro de contenidos")
         comando="cp /etc/dansguardian/FILTRAR /etc/dansguardian/dansguardianf1.conf"
         PASSWORD=$(zenity --password --text="Ingrese la contraseña de su usuario")
         echo $PASSWORD | sudo -S $comando
         echo $PASSWORD | sudo -S service dansguardian restart;;
    "Conectar a Internet")
         PASSWORD=$(zenity --password --text="Ingrese la contraseña de su usuario")
         echo $PASSWORD | sudo -S service dansguardian start;;
    "Desconectar de Internet")
         PASSWORD=$(zenity --password --text="Ingrese la contraseña de su usuario")
         echo $PASSWORD | sudo -S service dansguardian stop;;
    "Abrir una página Web en todas las PC")
        ./todos_abrir_sitioZ.sh;;
    "¡Apagar todos los equipos de los alumnos!")                  
        ./todos_apagarYAZ.sh;;
    "Salir")
        exit 0;;
    *)
        zenity --error --text="Opción incorrecta.";;
esac
