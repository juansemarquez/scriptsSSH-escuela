#!/bin/bash
zenity --question echo --text="¿Seguro que desea APAGAR INMEDIATAMENTE?"
if [ $? -eq 0 ]
then
    maquina=2    
    zenity --info --timeout=5 --text="Apagando..." &
    while [ $maquina -lt 28 ] ; do
    	ssh -p 1160 root@192.168.10.$maquina "shutdown -h now" &
            let maquina=maquina+1 
    done

else
    zenity --info --text="Apagado suspendido"
fi
