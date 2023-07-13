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

yay -S ncdu autotiling bluez bluez-libs bluez-utils dunst git github-cli lxappearance papirus-icon-theme pavucontrol picom playerctl blueman qt5ct qt5-styleplugins rofi-emoji gparted flameshot unzip copyq i3lock-fancy-git polybar rofi xorg-xinput firefox zsh oh-my-zsh-git alacritty pcmanfm htop neofetch brightnessctl ntfs-3g udisks2 gvfs ttf-ms-fonts bibata-cursor-theme neovim nodejs npm lua python-pillow zathura sweet-gtk-theme-dark polkit-gnome xwallpaper ttf-joypixels ttf-jetbrains-mono-nerd zathura-pdf-mupdf gtk-engine-murrine xclip python-pip python-pywal python-pywalfox mlocate zsh-syntax-highlighting zsh-autosuggestions libnotify jq acpi sxiv

cd
sudo pywalfox install
sudo updatedb

cd ~/GitRepos/BnW-i3/
sudo cp -r .config/* ~/.config/
sudo cp -r alacritty-color-export/ ~/
sudo cp -r .oh-my-zsh/ ~/
sudo cp -r .icons/* ~/.icons/
sudo cp -r .fonts/* ~/.fonts/
sudo cp -r .local/bin ~/.local/
sudo cp -r Pictures/* ~/Pictures/
sudo cp -r Music/* ~/Music/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .viminfo ~/
sudo cp .vimrc.plug ~/

sudo cp lightdm/* /etc/lightdm/
sudo cp environment /etc/

sudo chown $USER ~/ -R
chsh -s /usr/bin/zsh
