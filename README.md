# Hyprland DotConfig files

### DISCLAIMER

``` I AM NOT RESPONSIBLE FOR YOUR BRICKED DEVICE OR MISCONFIGURED CONFIGS. IF U WANT TO INSTALL THESE CONFIGS, DO AT YOUR OWN RISK.```

## Introduction
This repository is where I store my configs for archlinux on my daily driver. Technically, you could use this in any distribution as long as you the correct versions of packages. My current setup is using Wayland as display server. Hyprland as my wayland compositor alongside rofi, swaylock-effects, wlogout and waybar. I will update the configs as time passes. 

## Installation
Get Yay (AUR package helper)
``` bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Install the dependancy packages
``` bash
yay -S wayland wayland-protocols hyprland base-devel xdg-desktop-portal-hyprland-git waybar-hyprland \
rofi-lbonn-wayland-git hyprpaper hyprpicker-git swaylock-effects-git noto-fonts-emoji neofetch mpd \
wlogout wl-clipboard ttf-jetbrains-mono-nerd ttf-liberation ttf-nerd-fonts-symbols-common \
ttf-iosevka-nerd ttf-fantasque-nerd ttf-comfortaa sddm-git qt5ct pulseaudio pamixer noto-fonts
```
Install Optional (Apps I use personally)
``` bash
yay -S networkmanager network-manager-applet nm-connection-editor android-tools kdeconnect \
oversteer pavucontrol lxappearance openrgb dolphin neovim zsh gparted flameshot alacritty \
sbctl 
```

**NOTE:** If you are not using a specific program in the optional list, you would have to edit few lines starting with ```exec-once```  by adding a # at the start of the line to comment them out.

## Updates
I plan to update the dotfiles whenever I make a change with my system. Features and suggestion are welcome. Have fun modding to your likes.

In case of any issues with hyprland, make sure to check out the Hyprland wiki before asking anywhere: https://wiki.hyprland.org/

## Credits
https://github.com/ChrisTitusTech/hyprland-titus/
