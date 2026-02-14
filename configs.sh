#!/usr/bin/env bash

set -e

install_config() {
  local name="$1"
  local target="$2"
  local source="$3"

  if [ -e "$target" ]; then
    read -rp "$name config already exists. Overwrite? [y/N] " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
      rm -rf "$target"
    else
      echo "Skipping $name."
      return
    fi
  fi

  stow -d "$source" -t "$target"
}

install_config "Ghostty" ~/.config/ghostty ~/dotfiles/ghostty
install_config "Hypr" ~/.config/hypr ~/dotfiles/hypr
install_config "Neovim" ~/.config/nvim ~/dotfiles/nvim
install_config "Omarchy themes" ~/.config/omarchy/themes ~/dotfiles/omarchy
install_config "Waybar" ~/.config/waybar ~/dotfiles/waybar
install_config "Opencode" ~/.config/opencode ~/dotfiles/opencode
install_config "Tmux" ~/.config/tmux ~/dotfiles/tmux
install_config "Zsh" ~ ~/dotfiles/zsh

echo "All configs installed"
