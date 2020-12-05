#!/bin/bash
cd ~/Escritorio
archivo=`zenity --file-selection --title="Elija el archivo"`
case $? in
         0)
            destino=$(zenity --entry --text="Ingrese carpeta destino (deje vacío para copiar al Escritorio: ")
            usuario=$(zenity --entry --text="Ingrese el usuario de los alumnos:" --entry-text="chicos")
            maquina=$(zenity --entry --text="Ingrese el numero de maquina (2 a 27):")            
	            scp -P 1160 $archivo $usuario@192.168.10.$maquina:~/Escritorio/$destino &;;   
         1)
                zenity --error --text="No ha seleccionado ningún archivo.";;
        -1)
                zenity --error --text="Error.";;
esac
