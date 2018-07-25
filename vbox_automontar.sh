#!/bin/bash

#--------------------------------
# autor:    Aitor del Castillo
# contacto: aitorcastel@gmail.com
# github:   aitorcastel
#---------------------------------

RED='\033[0;41;30m'
STD='\033[0;0;39m'


pausa_instruccion(){
  read -p "Pulse enter para continuar." fackEnterKey
}

instrucciones(){

  echo "1. Cree una carpeta en el sistema operativo base llamada Vbox-Share"
  pausa_instruccion
  echo "2. Móntela de forma normal en su sistema operativo virtualizado."
  pausa_instruccion
  echo "3. Cree una carpeta con el mismo nombre en la siguiente ruta: "
  echo "                  /mnt/virtualbox/Vbox-Share"
  pausa_instruccion
  echo "4. Proceda a la ejecución de la opción montar."
  sleep 2
}

montaje(){
  read -p "Pulse enter para montar la carpeta." fackEnterKey
  mount -t vboxsf Vbox-Share /mnt/virtualbox/Vbox-Share
  echo "Se ha montado la carpeta en la ruta: /mnt/virtualbox/Vbox-Share/"
  sleep 2
}

desmontaje(){
  read -p "Pulse enter para desmontar la carpeta." fackEnterKey
  umount -t vboxsf Vbox-Share 
  echo "Se ha desmontado la carpeta en la ruta: /mnt/virtualbox/Vbox-Share/"
  sleep 2
}

menu(){
  clear
  echo " -- Script de ayuda para el manejo de carpetas compartidas en virtualbox --"
  echo
  echo " intro)     Instrucciones iniciales"
  echo " montar)    Montaje de la carpeta"
  echo " desmontar) Desmontaje de la carpeta"
  echo " exit)      Salir"
  echo
}

leer_opciones(){
  local opcion
  read -p "Elija su opción: " opcion
  case $opcion in
          intro) instrucciones  ;;
          montar) montaje ;;
          desmontar) desmontaje ;;
          exit) exit 0  ;;
          *) echo -e "${RED}Error, introduzca una opción correcta.${STD}" &&  sleep 2 ;;
  esac
}

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
      menu
      leer_opciones
done
