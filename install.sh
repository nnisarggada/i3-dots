#!/bin/bash

mkdir ~/dl
mkdir ~/dox
mkdir ~/pub
mkdir ~/vids
mkdir ~/work
mkdir ~/music

if type "yay" &> /dev/null; then
    echo "yay installed."
else
    git clone https://aur.archlinux.org/yay-bin
    cd yay-bin
    makepkg -si
    cd ../
    yay && rm -rf yay-bin
fi

progams=("p7zip" "xcolor" "silicon" "man" "caffeine-ng" "ripgrep" "flatpak" "arandr" "linux-headers" "v4l2loopback-dkms" "nvidia" "nvidia-utils" "lib32-nvidia-utils" "xdg-desktop-portal-gtk" "network-manager-applet" "adwaita-dark" "nm-connection-editor" "ueberzug" "libinput-gestures" "xdotool" "ncdu" "mpd" "mpv" "autotiling" "bluez" "bluez-libs" "bluez-utils" "dunst" "git" "github-cli" "lxappearance" "papirus-icon-theme" "pavucontrol" "picom" "playerctl" "blueman" "qt5ct" "qt5-styleplugins" "gparted" "maim" "unzip" "zip" "copyq" "betterlockscreen" "polybar" "xorg-xinput" "firefox" "zsh" "alacritty" "pcmanfm" "htop" "neofetch" "brightnessctl" "ntfs-3g" "udisks2" "udiskie" "gvfs" "ttf-ms-fonts" "bibata-cursor-theme" "neovim" "nodejs" "npm" "lua" "python-pillow" "zathura" "gtk-theme-windows10-dark" "polkit-gnome" "feh" "ttf-joypixels" "ttf-jetbrains-mono-nerd" "zathura-pdf-mupdf" "gtk-engine-murrine" "xclip" "python-pip" "mlocate" "zsh-syntax-highlighting" "libnotify" "jq" "acpi" "sxiv" "mission-center" "python-pywal" "python-pywalfox" "j4-dmenu-desktop")

yay -R --noconfirm i3lock
yay -R --noconfirm dmenu

for program in "${progams[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done

if type "dmenu" &> /dev/null; then
    echo "dmenu installed."
else
    git clone https://github.com/muff1nman/dmenu2
    cd dmenu2
    sudo make clean install
    cd ../
    rm -rf dmenu2
fi

sudo cp -r .config ~/
sudo cp -r .local ~/
sudo cp -r .icons ~/
sudo cp -r .fonts ~/
sudo cp -r pix/ ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .xprofile ~/
sudo cp .viminfo ~/
sudo cp .vimrc.plug ~/

sudo cp 40-libinput.conf /usr/share/X11/xorg.conf.d/
sudo cp environment /etc/

sed -i "s/nnisarggada/$USER/g" ~/.config/wal/templates/dunstrc

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
sudo usermod -aG input $USER

systemctl --user enable mpd
sudo systemctl enable bluetooth

sudo npm i -g pnpm
pnpm setup
source ~/.zshrc
pnpm i -g pnpm

sudo chown $USER ~/ -R
chsh -s /usr/bin/zsh
