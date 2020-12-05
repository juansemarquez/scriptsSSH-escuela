#!/bin/bash
usuario=$(zenity --entry --text="Ingrese el usuario de los alumnos:" --entry-text="chicos")
com="killall vinagre"
maquina=2
while [ $maquina -lt 28 ] ; do
	ssh -p 1160 $usuario@192.168.10.$maquina "$com" &
        let maquina=maquina+1 
done
killall vino-server
