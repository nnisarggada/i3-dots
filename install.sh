#!/bin/bash

mkdir ~/Desktop
mkdir ~/Pictures
mkdir ~/Music
mkdir ~/Downloads
mkdir ~/.icons
mkdir ~/.fonts
mkdir ~/.local
mkdir ~/.local/bin

cd
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd

yay -S ncdu autotiling bluez bluez-libs bluez-utils dunst git github-cli lxappearance papirus-icon-theme pavucontrol picom playerctl blueman qt5ct qt5-styleplugins rofi-emoji rofi-power-menu-git gparted flameshot unzip copyq i3lock-fancy-git polybar rofi xorg-xinput firefox zsh alacritty pcmanfm htop neofetch brightnessctl ntfs-3g udisks2 gvfs ttf-ms-fonts bibata-cursor-theme neovim nodejs npm lua python-pillow zathura sweet-gtk-theme-dark polkit-gnome feh ttf-joypixels ttf-jetbrains-mono-nerd zathura-pdf-mupdf gtk-engine-murrine xclip python-pip mlocate zsh-syntax-highlighting libnotify jq acpi sxiv webapp-manager

cd ~/GitRepos/BnW-i3/
sudo cp -r .config/* ~/.config/
sudo cp -r .local/bin/* ~/.local/bin/
sudo cp -r .icons/* ~/.icons/
sudo cp -r .fonts/* ~/.fonts/
sudo cp -r Pictures/* ~/Pictures/
sudo cp -r Music/* ~/Music/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .viminfo ~/
sudo cp .vimrc.plug ~/

sudo cp ly/* /etc/ly/
sudo cp environment /etc/

sudo chown $USER ~/ -R
chsh -s /usr/bin/zsh
