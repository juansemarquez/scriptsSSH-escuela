#! /bin/bash
usuario=$(zenity --entry --text="Ingrese el usuario de los alumnos:" --entry-text="margis")
url=$(zenity --entry --text="Ingrese la dirección web:" --entry-text="http://es.wikipedia.org")
com="export DISPLAY=:0.0 && firefox $url &"
for i in $(seq 2 27)
do
    ssh -p 1160 $usuario@192.168.10.$i "$com" &
done
