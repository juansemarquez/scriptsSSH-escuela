#!/bin/bash
usuario=$(zenity --entry --text="Ingrese el usuario de los alumnos:" --entry-text="margis")
com="export DISPLAY=:0.0 && vinagre -f vnc://192.168.10.1"
maquina=2
x=$(zenity --list --radiolist  --width=400 --height=200  --title "Sala de informática" --column " " --column "Acción" FALSE "Que solamente se vea en las máquinas negras" FALSE "Que se vea en todas las máquinas")
#zenity --info --text="Se abrirá una ventana. Marque:\n\"Permitir a otros usuarios ver mi escritorio\""
/usr/lib/vino/vino-server 2> /dev/null &
#vino-preferences
zenity --info --text="En unos instantes, todos verán esta pantalla..."
if [ "$x" = "Que solamente se vea en las máquinas negras (nuevas)" ]
then
    for pc in 2 3 4 5 7 8 9 11 12 13 14 15 16 19 20 21 22 23 24 25 26 27
    do
	ssh -p 1160 $usuario@192.168.10.$pc "$com" &
    done
else   
    while [ $maquina -lt 28 ] ; do
	ssh -p 1160 $usuario@192.168.10.$maquina "$com" &
        let maquina=maquina+1 
    done
fi
