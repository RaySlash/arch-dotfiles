#!/bin/bash


getyay() {
	printf "[!] Installing Yay(AUR helper)\n"
	sudo pacman -S base-devel git go
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
}

getdeps() {
	printf "[!] Installing necessary dependancies and fonts\n"
	yay -S wayland wayland-protocols hyprland xdg-desktop-portal-hyprland-git waybar-hyprland \
	rofi-lbonn-wayland-git hyprpaper hyprpicker-git swaylock-effects-git noto-fonts-emoji neofetch mpd \
	wlogout wl-clipboard ttf-jetbrains-mono-nerd ttf-liberation ttf-nerd-fonts-symbols-common \
	ttf-iosevka-nerd ttf-fantasque-nerd ttf-comfortaa sddm-git qt5ct pipewire pipewire-pulse wireplumber \
	noto-fonts polkit-kde-agent qt5-wayland qt6-wayland
}

getopt() {
	printf "[!] Installing optional packages\n"
	yay -S networkmanager network-manager-applet nm-connection-editor android-tools kdeconnect linux-headers \
	oversteer pavucontrol lxappearance openrgb dolphin neovim zsh gparted grimshot alacritty \
	sbctl gammastep copyq webcord firefox
}

install() {
	printf "[!] Installing the configs\n"
	mkdir -p .config 
	cp -a config/* ~/.config/
	echo "source ~/.config/zshrc" >> ~/.zshrc && cp zshrc ~/.config/
}

helpme() {
	printf "Stupidly simple script to install all dependancies and configs\n
	Read More: https://github.com/RaySlash/dotfiles/blob/main/README.md \n 
	I recommend you manually install everything!\n
	But you can use this script just to save you maybe a second if everything works! :P\n
	Simply give it permission and run \n
	- chmod +x install.sh \n
	- ./install.sh\n"
}

getyay
getdeps
getopt
install
