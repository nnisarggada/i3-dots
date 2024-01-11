#!/bin/bash

mkdir ~/Desktop
mkdir ~/Pictures
mkdir ~/Pictures/Screenshots
mkdir ~/Music
mkdir ~/Downloads
mkdir ~/.icons
mkdir ~/.fonts
mkdir ~/.local

yay || {
	git clone https://aur.archlinux.org/yay-bin
	cd yay-bin
	makepkg -si
	cd ../
	yay && rm -rf yay-bin
}

progams=("linux-headers" "v4l2loopback-dkms" "nvidia" "nvidia-utils" "lib32-nvidia-utils" "xdg-desktop-portal-gtk" "network-manager-applet" "adwaita-dark" "nm-connection-editor" "ueberzug" "libinput-gestures" "xdotool" "ncdu" "mpd" "mpv" "autotiling" "bluez" "bluez-libs" "bluez-utils" "dunst" "git" "github-cli" "lxappearance" "papirus-icon-theme" "pavucontrol" "picom" "playerctl" "blueman" "qt5ct" "qt5-styleplugins" "rofi-emoji" "rofi-power-menu-git" "rofi-calc" "gparted" "flameshot" "unzip" "zip" "copyq" "betterlockscreen" "polybar" "rofi" "xorg-xinput" "firefox" "zsh" "alacritty" "pcmanfm" "htop" "neofetch" "brightnessctl" "ntfs-3g" "udisks2" "udiskie" "gvfs" "ttf-ms-fonts" "bibata-cursor-theme" "neovim" "nodejs" "npm" "lua" "python-pillow" "zathura" "gtk-theme-windows10-dark" "polkit-gnome" "feh" "ttf-joypixels" "ttf-jetbrains-mono-nerd" "zathura-pdf-mupdf" "gtk-engine-murrine" "xclip" "python-pip" "mlocate" "zsh-syntax-highlighting" "libnotify" "jq" "acpi" "sxiv" "webapp-manager" "mission-center")

yay -R --noconfirm i3lock

for program in "${progams[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done

sudo cp -r .config ~/
sudo cp -r .local ~/
sudo cp -r .icons ~/
sudo cp -r .fonts ~/
sudo cp -r Pictures ~/
sudo cp -r Music ~/
sudo cp .vimrc ~/
sudo cp .zshrc ~/
sudo cp .viminfo ~/
sudo cp .vimrc.plug ~/

sudo cp -r lightdm /etc/
sudo cp environment /etc/

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
sudo usermod -aG input $USER

systemctl --user enable mpd
sudo systemctl enable bluetooth

sudo chown $USER ~/ -R
chsh -s /usr/bin/zsh
