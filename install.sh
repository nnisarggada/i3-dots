#!/bin/bash

mkdir ~/desk
mkdir ~/dl
mkdir ~/dox
mkdir ~/pub
mkdir ~/vids
mkdir ~/work
mkdir ~/music
mkdir ~/tmplts

if type "yay" &> /dev/null; then
    echo "yay installed."
else
    git clone --depth=1 https://aur.archlinux.org/yay-bin
    cd yay-bin
    makepkg -si
    cd ../
    yay && rm -rf yay-bin
fi


graphics=("intel-media-driver" "mesa" "xf86-video-amdgpu" "xf86-video-vmware" "xf86-video-ati" "xf86-video-nouveau" "libva-intel-driver" "vulkan-intel" "libva-mesa-driver" "vulkan-radeon" "nvidia" "nvidia-utils" "lib32-nvidia-utils")

xorg=("xorg-server" "xorg-xinit" "xdg-utils" "xorg-xinput" "xorg-xrandr")

editors=("vi" "vim" "neovim")

utils=("htop" "wget" "curl" "openssh" "wireless_tools" "smartmontools" "wpa_supplicant" "iwd" "p7zip" "auto-cpufreq" "man" "ripgrep" "flatpak" "linux-headers" "v4l2loopback-dkms"  "xdg-desktop-portal-gtk" "ueberzug" "libinput-gestures" "xdotool" "ncdu" "mpd" "mpv" "bluez" "bluez-libs" "bluez-utils" "xclip" "xcolor" "rsync" "git" "pavucontrol" "playerctl" "blueman" "maim" "unzip" "zip" "brightnessctl" "ntfs-3g" "udisks2" "udiskie" "gvfs" "mlocate" "libnotify" "jq" "acpi" "sxiv" "caffeine-ng" "pass" "feh" "betterlockscreen")

i3=("i3-wm" "autotiling" "python-pillow")

shell=("dash" "zsh" "zsh-syntax-highlighting")

appearance=("adwaita-dark" "arc-gtk-theme" "neofetch" "papirus-icon-theme" "gtk-engine-murrine" "qt5-styleplugins" "python-pywal" "python-pywalfox")

fonts=("ttf-joypixels" "ttf-jetbrains-mono-nerd" "ttf-ms-fonts" "noto-fonts-emoji")

dev=("nodejs" "npm" "lua" "python-pip")

apps=("onlyoffice-bin" "yt-dlp" "silicon" "arandr" "dunst" "github-cli" "picom-ftlabs-git" "polybar" "firefox" "alacritty" "pcmanfm" "zathura" "zathura-pdf-mupdf")

for program in "${graphics[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${xorg[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${editors[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${utils[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${i3[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${shell[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${appearance[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${fonts[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${dev[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done
for program in "${apps[@]}"; do
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
    git clone https://github.com/nnisarggada/dmenu2
    cd dmenu2
    sudo make clean install
    cd ../
    rm -rf dmenu2
fi

sudo cp -r .config ~/
sudo cp -r .local ~/
sudo cp -r pix/ ~/
sudo cp .zshrc ~/
sudo cp .xprofile ~/
sudo cp .xinitrc ~/
sudo cp .gtkrc-2.0 ~/

mkdir pix/ss

sudo cp -r xorg.conf.d /etc/X11/
sudo cp environment /etc/

sed -i "s/nnisarggada/$USER/g" ~/.config/wal/templates/dunstrc

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
sudo usermod -aG input $USER

systemctl --user enable mpd
sudo systemctl enable bluetooth

sudo modprobe v4l2loopback

sudo npm i -g pnpm
pnpm setup
source ~/.zshrc
pnpm i -g pnpm
pnpm i -g pocketnaut
pnpm i -g better-commits

sudo auto-cpufreq --install

sudo chown $USER ~/ -R
sudo rm -rf /bin/sh
sudo ln -s dash /bin/sh
chsh -s /usr/bin/zsh
