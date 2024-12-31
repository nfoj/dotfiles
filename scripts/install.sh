#!/usr/bin/env bash


# author: nfoj_@hotmail.com
# discription: script for system configuration
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

# installation

echo -e "${COLOR_BLUE}  ***  [INSTALLING PROGRAMS]  ***${NO_COLOR}";sleep 2
  echo -e "${COLOR_BLUE}  ***  [Alacritty | Bluez | Docker | Git | Rust | Starship | UFW]  ***${NO_COLOR}";sleep 2
  sudo pacman -Syu alacritty bluez bluez-utils docker git helix rustup starship ufw
  echo " ";
  
  echo -e "${COLOR_BLUE}  ***  [Nerd Fonts | JetBrains (42) + Nerd Font Icons (53)]  ***${NO_COLOR}";sleep 2
  sudo pacman -Syu nerd-fonts
  echo " ";
  
  echo -e "${COLOR_BLUE}  ***  [Yay | Zen Browser]  ***${NO_COLOR}";sleep 2
  sudo pacman -Syu
  sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
  yay -S zen-browser-bin
  
echo -e "${COLOR_GREEN}  ***  [COMPLETE INSTALLATION]  ***${NO_COLOR}";sleep 2

echo " ";

#!------------------------------------------------------------------------------------------------------!#

# config

echo -e "${COLOR_BLUE}  ***  [CONFIGURING PROGRAMS]  ***${NO_COLOR}";sleep 2
  echo -e "${COLOR_BLUE}  ***  [UFW]  ***${NO_COLOR}";sleep 2
  sudo ufw enable
  echo " ";

  echo -e "${COLOR_BLUE}  ***  [RUST]  ***${NO_COLOR}";sleep 2 
  rustup default stable 
  rustup component add rls rust-analysis rust-src
  echo " ";

#!------------------------------------------------------------------------------------------------------!#

# bluetooth  



#!------------------------------------------------------------------------------------------------------!#

# bluetooth

echo -e "${COLOR_BLUE}  ***  [CONFIGURING BLUETOOTH]  ***${NO_COLOR}";sleep 2
  sudo systemctl start bluetooth.service
  sudo systemctl enable bluetooth.service
  bluetoothctl
  power on
  agent on
  default-agent
  scan on
  devices
