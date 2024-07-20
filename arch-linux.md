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
sudo pacman -S helix git alacritty firefox bluez bluez-utils ufw starship docker postgresql zellij
sudo pacman -R pavucontrol vim foot waybar nano grim htop

sudo pacman -S nerd-fonts 
<!--(JetBrains (42) + Nerd Font Icons (53))-->


- Rust

https://www.rust-lang.org/tools/install


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
#nvim > init.lua lazy-lock.json
sway > background.png config
zellij > config.kdl


- Git

1. git config --global user.name "name"
2. git config --global user.email "@email"
3. ssh-keygen -t ed25519 -C "your_email@example.com"
4. enter ... enter
5. cd > cd .ssh/ > acess id_ed25519.pub
6. cat id_ed25519.pub
7. copy > github > settings > SSH and GPG keys > new SSH > paste > add
8. github > create repository > copy > SSH git@github.com: ... > paste git clone git@github.com: ... > yes 


- Nvim

cd .config
mkdir nvim
touch init.lua

<!-- Paste -->
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

:souce %
:Lazy

delete config > paste > config nvim init.lua
:souce %
:Lazy
:wq
nvim init.lua
