# Hyprland DotConfig files

### DISCLAIMER

``` I AM NOT RESPONSIBLE FOR YOUR MISCONFIGURED CONFIGS. IF U WANT TO INSTALL THESE CONFIGS, DO AT YOUR OWN RISK.```

## Introduction
This repository is where I store my configs for Arch-Linux on my daily driver. Technically, you could use this in any distribution as long as you the correct versions of packages. My current setup is using Wayland as display server. Hyprland as my wayland compositor alongside rofi, swaylock-effects, wlogout and waybar. I will update the configs as time passes.

![desktop](https://github.com/RaySlash/dotfiles/assets/45141270/7c1b3f05-753e-42b9-8994-6b7db3ad11be)
![neovim](https://github.com/RaySlash/dotfiles/assets/45141270/6f777357-c407-4af1-a7cd-bda81217494a)
![firefox](https://github.com/RaySlash/dotfiles/assets/45141270/1cf69a14-2f63-49cd-a74f-cf83cadaa4dd)

## Installation

### Using Script (NOT Up-To-Date)
``` bash
sudo pacman -S wget
wget https://raw.githubusercontent.com/RaySlash/dotfiles/main/install.sh
chmod +x install.sh
./install.sh
```


### Manual ( **RECOMMENDED** )
Get Yay (AUR package helper)
``` bash
sudo pacman -S base-devel git
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
noto-fonts polkit-kde-agent qt5-wayland qt6-wayland alacritty catppuccin-gtk-theme-mocha sddm-catppuccin-git \ 
qt5-graphicaleffects qt5-svg qt5-quickcontrols2
```
Install Optional (Apps I use)
``` bash
yay -S networkmanager network-manager-applet nm-connection-editor android-tools kdeconnect linux-headers \
oversteer pavucontrol lxappearance openrgb thunar neovim zsh gparted grimshot \
sbctl efibootmgr gammastep copyq webcord firefox

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**NOTE:** If you are not using a specific program in the optional list, you would have to edit few lines starting with ```exec-once``` and ```bind``` in the ```~/.config/hypr/hyprland.conf```. To setup your wallpaper, you need to edit the ```~/.config/hypr/hyprpaper.conf```.

Finally, copy everything from the repo to ```/home/$USER/.config/```
``` bash
git clone https://github.com/RaySlash/dotfiles
cp -a dotfiles/config/* ~/.config/
```
For ```.zshrc``` and ```sddm.conf```, Do the following:
``` bash
echo "source ~/.config/zshrc" >> ~/.zshrc && cp config/zshrc ~/.config/
sudo cp config/sddm.conf /etc/sddm.conf.d/default.conf
```

## Nvim
Currently, I have included nvim configs in the repo. I am still getting my around nvim config for the best experience. I am listing the current used plugins (LazyVim as plugin manager):
```lua
{"catppuccin/nvim", name = "catppuccin"},
{'nvim-lualine/lualine.nvim'},
{'lukas-reineke/indent-blankline.nvim'},
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
{'nvim-treesitter/nvim-treesitter-textobjects', after = "nvim-treesitter", requires = "nvim-treesitter/nvim-treesitter"},
{'numToStr/Comment.nvim'},
{'nvim-tree/nvim-tree.lua', version = "*", dependencies = {'nvim-tree/nvim-web-devicons'}},
{'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = {'nvim-lua/plenary.nvim'}},
{'nvim-telescope/telescope-fzf-native.nvim'},
{'neovim/nvim-lspconfig'},
{'lewis6991/gitsigns.nvim'},
{'hrsh7th/nvim-cmp'},
{'hrsh7th/cmp-buffer'},
{'hrsh7th/cmp-path'},
{'saadparwaiz1/cmp_luasnip'},
{'hrsh7th/cmp-nvim-lsp'},
{'L3MON4D3/LuaSnip'},
{'rafamadriz/friendly-snippets'},
{'elkowar/yuck.vim'},
{'aurum77/live-server.nvim',
```

## Firefox
Firefox have been modified to be better with keyboard and use of vertical tab panel. This would also help us to group tabs. I am listing a few firefox plugins/extensions/themes below for better usability.

- **DarkReader**: https://addons.mozilla.org/en-US/firefox/addon/darkreader/
- **Enhancer for Youtube**: https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/
- **Return Youtube Dislike**: https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/
- **Firefox-Color**: https://addons.mozilla.org/en-US/firefox/addon/firefox-color/
- **Privacy Badger**: https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/
- **Sideberry**: https://addons.mozilla.org/en-US/firefox/addon/sidebery/
- **Vimium-FF**: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
- **Catppuccin-Mocha Theme**: https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-lavender-git/

### Usage
To use the provided config, move the files to ```~/.mozilla/firefox/{profile}/chrome/``` where {profile} is the name of your current profile. You can find this out in ```about:profile``` in firefox.

```bash
cp -a config/firefox/* ~/.mozilla/firefox/{profile}/chrome/
```

Restart firefox to see changes. You can copy the ```config/firefox/sideberry/sideberyy.css``` and paste it in the config of sideberry from the ```config:addons``` section for sideberry for side-panel theme. You can also load all the settings I have currently enabled by importing the JSON in ```config/firefox/sideberry/sideberry-data-*.json``` to sideberry preferences.

## Updates
The current theme colors went a rebase to catppuccin (catppuccin-mocha) colors. Config files now exist for alacritty, nvim etc. in addition to others. I plan to update the dotfiles whenever I make a change with my system. Currently, I have migrated from pulseaudio to pipewire. Also, screen recording in discord (WebCord) is working fine.

> Features and suggestion are welcome. Have fun modding to your likes.

> In case of any issues with hyprland, make sure to check out the Hyprland wiki before asking anywhere: https://wiki.hyprland.org/

## Credits
https://github.com/ChrisTitusTech/hyprland-titus/<br>
https://github.com/ThePrimeagen/init.lua<br>
https://github.com/puma0x61/hyprland-interactive-screenshot/<br>
https://github.com/catppuccin/catppuccin<br>
https://github.com/folke/lazy.nvim<br>
https://github.com/Frai7ty/catppuccin-fox<br>
