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


- Git

1. git config --global user.name "name"
2. git config --global user.email "@email"
3. ssh-keygen -t ed25519 -C "your_email@example.com"
4. enter ... enter
5. cd > cd .ssh/ > acess id_ed25519.pub
6. cat id_ed25519.pub
7. copy > github > settings > SSH and GPG keys > new SSH > paste > add
8. github > create repository > copy > SSH git@github.com: ... > paste git clone git@github.com: ... > yes 

