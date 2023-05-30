# Hyprland DotConfig files

### DISCLAIMER

``` I AM NOT RESPONSIBLE FOR YOUR BRICKED DEVICE OR MISCONFIGURED CONFIGS. IF U WANT TO INSTALL THESE CONFIGS, DO AT YOUR OWN RISK.```

## Introduction
This repository is where I store my configs for archlinux on my daily driver. Technically, you could use this in any distribution as long as you the correct versions of packages. My current setup is using Wayland as display server. Hyprland as my wayland compositor alongside rofi, swaylock-effects, wlogout and waybar. I will update the configs as time passes.

![config](https://raw.githubusercontent.com/RaySlash/dotfiles/main/res/config.png)
![nvim](https://raw.githubusercontent.com/RaySlash/dotfiles/600d9112b12cea69a0f4adba00ce637ed197a88a/res/vim.png)


## Installation

### Using Script
``` bash
sudo pacman -S wget
wget https://raw.githubusercontent.com/RaySlash/dotfiles/main/install.sh
chmod +x install.sh
./install.sh
```


### Manual ( **RECOMMENDED** )
Get Yay (AUR package helper)
``` bash
sudo pacman -S base-devel git go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Install the dependancy packages
``` bash
yay -S wayland wayland-protocols hyprland xdg-desktop-portal-hyprland-git waybar-hyprland \
rofi-lbonn-wayland-git hyprpaper hyprpicker-git swaylock-effects-git noto-fonts-emoji neofetch mpd \
wlogout wl-clipboard ttf-jetbrains-mono-nerd ttf-liberation ttf-nerd-fonts-symbols-common \
ttf-iosevka-nerd ttf-fantasque-nerd ttf-comfortaa sddm-git qt5ct pipewire pipewire-pulse wireplumber \
noto-fonts polkit-kde-agent qt5-wayland qt6-wayland kitty 
```
Install Optional (Apps I use personally)
``` bash
yay -S networkmanager network-manager-applet nm-connection-editor android-tools kdeconnect linux-headers \
oversteer pavucontrol lxappearance openrgb thunar neovim zsh gparted grimshot \
sbctl efibootmgr gammastep copyq webcord firefox
```

**NOTE:** If you are not using a specific program in the optional list, you would have to edit few lines starting with ```exec-once```  by adding a ```#``` at the start of the line to comment them out.

Finally, copy everything from the repo to ```/home/$USER/.config/```
``` bash
git clone https://github.com/RaySlash/dotfiles
cp -a dotfiles/config/* ~/.config/
```
For ```.zshrc```, Do the following:
``` bash
echo "source ~/.config/zshrc" >> ~/.zshrc && cp config/zshrc ~/.config/
```

## Updates
I plan to update the dotfiles whenever I make a change with my system. Features and suggestion are welcome. Have fun modding to your likes.

Currently, I have migrated from pulseaudio to pipewire. Also, screen recording in discord (WebCord) is working fine.

In case of any issues with hyprland, make sure to check out the Hyprland wiki before asking anywhere: https://wiki.hyprland.org/

## Credits
https://github.com/ChrisTitusTech/hyprland-titus/
https://github.com/ThePrimeagen/init.lua
https://github.com/puma0x61/hyprland-interactive-screenshot/
