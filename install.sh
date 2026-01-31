#!/usr/bin/env bash

set -e  # exit on error

# Update system
sudo pacman -Syu --noconfirm

# Install yay if not present
if ! command -v yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

PACKAGES=(
  stow
  cmake
)

DEV_PACKAGES=(
  neovim
  git
  base-devel
  filezilla
  nodejs
  npm
  php
)

SHELL_PACKAGES=(
  zsh
  yazi
  zoxide
  tmux
)

UTIL_PACKAGES=(
  curl
  wget
  flatpak
  pavucontrol
  piper
  kalarm
)

STYLE_PACKAGES=(
  otf-commit-mono-nerd
  cmatrix
)

AUR_PACKAGES=(
  waybar-module-pacman-updates-git
  wttrbar
  bibata-cursor-theme
  brave-bin
  paru
  snapd
  tty-clock
)

sudo pacman -S --needed --noconfirm \
  "${PACKAGES[@]}" \
  "${DEV_PACKAGES[@]}" \
  "${SHELL_PACKAGES[@]}" \
  "${UTIL_PACKAGES[@]}"

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

# Composer installation
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c8b085408188070d5f52bcfe4ecfbee5f727afa458b2573b8eaaf77b3419b0bf2768dc67c86944da1544f06fa544fd47') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

echo "✔ All packages installed"

