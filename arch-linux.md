<!-- Arch -->


- Install

1. Connect wifi
    a. iwctl
    b. station wlan0 get-networks
    c. station wlan0 connect <name> + enter
    d. <password>

2.  archinstall
3.  Preference Config  ...


- Connect

nmcli d
nmcli r wifi on
nmcli d wifi list
nmcli d wifi connect <name> password <pass>


- Programs

sudo pacman -Syu
sudo pacman -S neovim git alacritty firefox bluez bluez-utils ufw ranger starship docker postgresql
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked zellij

sudo pacman -S nerd-fonts 
<!--(JetBrains + Nerd Font Icons)-->


- UFW - Firewall

sudo ufw enable


- Sway

mkdir .config/sway 
cp /etc/sway/config .config/sway 
nvim .config/sway/config


- Bluetooth

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
bluetoothctl

power on
agent on
default-agent 
scan on
devices
trust <code name - reference to device>
pair <code name - reference to device>
connect <code name - reference to device>


- Starship

nvim ~/.bashrc
eval "$(starship init bash)"


- .config

alacritty nvim starhip.toml sway zellij

alacritty > alacrrtty.toml catppuccin-mocha.toml
nvim > init.lua lazy-lock.json
sway > background.png config
zellij > config.kdl


- Remove

sudo pacman -R swaybar 
