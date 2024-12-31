#!/usr/bin/env bash

# author: nfoj_@hotmail.com
# discription: script for system update
# system: arch linux

COLOR_RED='\033[1;31m'
COLOR_GREEN='\033[1;32m'
COLOR_BLUE='\033[1;34m'
NO_COLOR='\033[0m'

#!------------------------------------------------------------------------------------------------------!#

# connect
# 8.8.8.8 == Google

echo -e "${COLOR_BLUE}  ***  [TESTING NETWORK CONNECTIVITY]  ***${NC}";sleep 2

if ! ping -c 1 8.8.8.8 -q &> /dev/null; then

  echo -e "${COLOR_RED}  ***  [CHECK YOUR INTERNET CONNECTION AND TRY AGAIN]  ***${NO_COLOR}";sleep 2
  exit 1

else

  echo -e "${COLOR_GREEN}  ***  [CONNECTED TO THE INTERNET]  ***${NO_COLOR}";sleep 2

fi

echo " ";

#!------------------------------------------------------------------------------------------------------!#

# update

echo -e "${COLOR_BLUE}  ***  [STARTING SYSTEM UPDATE]  ***${NO_COLOR}";sleep 2

  sudo pacman -Syu # &> /dev/null
  sudo pacman -Rns $(pacman -Qtdq) # &> /dev/null 
  
echo -e "${COLOR_GREEN}  ***  [COMPLETED ATUALIZATION]  ***${NO_COLOR}";sleep 2

echo " ";

#!------------------------------------------------------------------------------------------------------!#

# cleaning

echo -e "${COLOR_BLUE}  *** [CLEARING RAM CACHE]  ***${NO_COLOR}";sleep 2

   sync
   sudo sysctl -w vm.drop_caches=3 &> /dev/null
   
echo -e "${COLOR_GREEN}  *** [CLEANING COMPLETED]  ***${NO_COLOR}";sleep 2 

echo " ";

#!------------------------------------------------------------------------------------------------------!#

# reboot

echo -e "${COLOR_BLUE}  *** [DO YOU WANT TO RESTART THE SYSTEM TO APPLY THE UPDATES? TYPE \"YES\" OR \"NO\"]  ***${NO_COLOR}"
read CONFIRMA

CONFIRMA=$(echo "$CONFIRMA" | tr '[:upper:]' '[:lower:]')

case "$CONFIRMA" in
    "yes")
        reboot
        ;;
    "no")
        echo -e "${COLOR_RED}  *** [OPERATION CANCELED!] ***"
        exit 0
        ;;
    *)
        echo -e "${COLOR_RED}  *** [INVALID OPTION. PLEASE TYPE \"YES\" OR \"NO\"]  ***${NO_COLOR}"
        ;;
esac
