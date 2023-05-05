# Custom Env Variables
export EDITOR="nvim"
export ANDROID_HOME="/home/$USER/.android/android-sdk" # Android-Studio
export CHROME_EXECUTABLE="/usr/bin/chromium"  # Android-Studio
export PATH="/opt/flutter/bin:$PATH"  # Android-Studio

# Wayland Env Variables
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="exa --icons"
alias sshpi="ssh smj@192.168.1.120"
alias vim="nvim"
