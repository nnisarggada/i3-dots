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


needed=("abseil-cpp" "acl" "alsa-card-profiles" "alsa-lib" "alsa-topology-conf" "alsa-ucm-conf" "archlinux-keyring" "argon2" "attr" "audit" "autoconf" "automake" "avahi" "base" "base-devel" "bash" "binutils" "bison" "bluez-libs" "brotli" "btrfs-progs" "bzip2" "ca-certificates" "ca-certificates-mozilla" "ca-certificates-utils" "coreutils" "cryptsetup" "curl" "db5.3" "dbus" "dbus-broker" "dbus-broker-units" "debugedit" "default-cursors" "device-mapper" "diffutils" "duktape" "e2fsprogs" "efibootmgr" "efivar" "expat" "fakeroot" "file" "filesystem" "findutils" "flac" "flex" "gawk" "gc" "gcc" "gcc-libs" "gdbm" "gettext" "git" "glib2" "glibc" "gmp" "gnupg" "gnutls" "gpgme" "gpm" "grep" "groff" "gst-plugin-pipewire" "gst-plugins-base-libs" "gstreamer" "guile" "gzip" "hwdata" "iana-etc" "icu" "intel-ucode" "iproute2" "iptables" "iputils" "iso-codes" "jansson" "json-c" "kbd" "keyutils" "kmod" "krb5" "lame" "libarchive" "libassuan" "libasyncns" "libbpf" "libcamera" "libcamera-ipa" "libcap" "libcap-ng" "libdaemon" "libdrm" "libedit" "libelf" "libevent" "libfdk-aac" "libffi" "libfreeaptx" "libgcrypt" "libglvnd" "libgpg-error" "libgudev" "libidn2" "libisl" "libksba" "liblc3" "libldac" "libldap" "libluv" "libmm-glib" "libmnl" "libmpc" "libmysofa" "libndp" "libnetfilter_conntrack" "libnewt" "libnfnetlink" "libnftnl" "libnghttp2" "libnghttp3" "libnl" "libnm" "libnsl" "libogg" "libomxil-bellagio" "libp11-kit" "libpcap" "libpciaccess" "libpgm" "libpipewire" "libpsl" "libpulse" "libsasl" "libseccomp" "libsecret" "libsndfile" "libsodium" "libssh2" "libsysprof-capture" "libtasn1" "libteam" "libtermkey" "libtirpc" "libtool" "libunistring" "libunwind" "libusb" "libuv" "libverto" "libvorbis" "libvterm" "libwireplumber" "libx11" "libxau" "libxcb" "libxcrypt" "libxdmcp" "libxext" "libxfixes" "libxi" "libxml2" "libxshmfence" "libxv" "libxxf86vm" "libyaml" "licenses" "lilv" "linux" "linux-api-headers" "linux-firmware" "linux-firmware-whence" "llvm-libs" "lm_sensors" "lua" "luajit" "lv2" "lz4" "lzo" "m4" "make" "mesa" "mkinitcpio" "mkinitcpio-busybox" "mobile-broadband-provider-info" "mpfr" "mpg123" "msgpack-c" "ncurses" "neovim" "nettle" "networkmanager" "npth" "nspr" "nss" "openssl" "opus" "orc" "p11-kit" "pacman" "pacman-mirrorlist" "pam" "pambase" "patch" "pciutils" "pcre" "pcre2" "pcsclite" "perl" "perl-error" "perl-mailtools" "perl-timedate" "pinentry" "pipewire" "pipewire-alsa" "pipewire-audio" "pipewire-jack" "pipewire-pulse" "pkgconf" "polkit" "popt" "procps-ng" "psmisc" "readline" "sbc" "sed" "serd" "shadow" "slang" "sof-firmware" "sord" "sqlite" "sratom" "sudo" "systemd" "systemd-libs" "systemd-sysvcompat" "tar" "texinfo" "tpm2-tss" "tree-sitter" "tzdata" "unibilium" "util-linux" "util-linux-libs" "wayland" "webrtc-audio-processing-1" "which" "wireplumber" "wpa_supplicant" "xcb-proto" "xorgproto" "xz" "zeromq" "zix" "zlib" "zram-generator" "zstd")

graphics=("intel-media-driver" "mesa" "xf86-video-amdgpu" "xf86-video-vmware" "xf86-video-ati" "xf86-video-nouveau" "libva-intel-driver" "vulkan-intel" "libva-mesa-driver" "vulkan-radeon" "nvidia" "nvidia-utils" "lib32-nvidia-utils")

xorg=("xorg-server" "xorg-xinit" "xdg-utils" "xorg-xinput" "xorg-xrandr")

editors=("vi" "vim" "neovim")

utils=("htop" "wget" "curl" "openssh" "wireless_tools" "smartmontools" "wpa_supplicant" "iwd" "p7zip" "auto-cpufreq" "man" "caffeine-ng" "ripgrep" "flatpak" "linux-headers" "v4l2loopback-dkms"  "xdg-desktop-portal-gtk" "network-manager-applet" "nm-connection-editor" "ueberzug" "libinput-gestures" "xdotool" "ncdu" "mpd" "mpv" "bluez" "bluez-libs" "bluez-utils" "xclip" "xcolor" "rsync" "git" "pavucontrol" "playerctl" "blueman" "maim" "unzip" "zip" "brightnessctl" "ntfs-3g" "udisks2" "udiskie" "gvfs" "mlocate" "libnotify" "jq" "acpi" "sxiv")

i3=("i3-wm" "autotiling" "python-pillow")

shell=("zsh" "zsh-syntax-highlighting")

appearance=("adwaita-dark" "gruvbox-dark-icons-gtk" "neofetch" "gruvbox-dark-gtk" "gtk-engine-murrine"  "python-pywal" "python-pywalfox")

fonts=("ttf-joypixels" "ttf-jetbrains-mono-nerd" "ttf-ms-fonts" "noto-fonts-emoji")

dev=("nodejs" "npm" "lua" "python-pip")

apps=("onlyoffice-bin" "yt-dlp" "pass" "silicon" "arandr" "dunst" "github-cli" "picom" "copyq" "betterlockscreen" "polybar" "firefox" "alacritty" "pcmanfm" "zathura" "feh" "zathura-pdf-mupdf")

for program in "${needed[@]}"; do
	if ! yay -Q "$program" >/dev/null 2>&1; then
		echo "Installing $program..."
		yay -S --noconfirm "$program"
		echo "$program installed successfully!"
	else
		echo "$program already installed."
	fi
done

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

mkdir pix/ss

sudo cp -r xorg.conf.d /etc/X11/xorg.conf.d/
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

sudo auto-cpufreq --install

sudo chown $USER ~/ -R
chsh -s /usr/bin/zsh

$HOME/.local/bin/newlook
