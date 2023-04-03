#!/bin/bash

mkdir ~/Desktop
mkdir ~/Pictures
mkdir ~/Music
mkdir ~/GitRepos
mkdir ~/Downloads
mkdir ~/.icons
mkdir ~/.fonts

yay -S autotiling bluez bluez-libs bluez-utils dunst git lxappearance papirus-icon-theme pavucontrol picom-jonaburg-git playerctl pulseaudio-bluetooth blueman qt5ct qt5-styleplugins rofi-bluetooth-git rofi-wifi-menu-git rofi-power-menu-git rofi-emoji gparted flameshot unzip copyq i3lock-fancy-git ranger polybar rofi xorg-xinput firefox fish kitty pcmanfm htop rxfetch brightnessctl stacer ntfs-3g udisks2 gvfs ttf-ms-fonts bibata-cursor-theme neovim nodejs npm lua python-pillow zathura sweet-gtk-theme-dark polkit-gnome lxsession feh zscroll-git ttf-joypixels zathura-pdf-mupdf gtk-engine-murrine

sudo cp -r ./.config/* ~/.config/
sudo cp -r ./.icons/* ~/.icons/
sudo cp -r ./.fonts/* ~/.fonts/
sudo cp -r ./Pictures/* ~/Pictures/
sudo cp -r ./Music/* ~/Music/
sudo cp ./.vimrc ~/
sudo cp ./.viminfo ~/
sudo cp ./.vimrc.plug ~/

sudo cp ./lightdm/* /etc/lightdm/
