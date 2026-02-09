#!/usr/bin/env bash

set -e  # exit on error

if [ -e ~/dotfiles/ghostty/.config/ghostty/ ]; then
  rm -rf ~/dotfiles/ghostty/.config/ghostty/
  echo "Removed ~/dotfiles/ghostty/.config/ghostty/"
else
  echo "(not found): ~/dotfiles/ghostty/.config/ghostty/"
fi

if [ -e ~/dotfiles/hypr/.config/hypr/ ]; then
  rm -rf ~/dotfiles/hypr/.config/hypr/
  echo "Removed ~/dotfiles/hypr/.config/hypr/"
else
  echo "(not found): ~/dotfiles/hypr/.config/hypr/"
fi

if [ -e ~/dotfiles/nvim/.config/nvim/ ]; then
  rm -rf ~/dotfiles/nvim/.config/nvim/
  echo "Removed ~/dotfiles/nvim/.config/nvim/"
else
  echo "(not found): ~/dotfiles/nvim/.config/nvim/"
fi

if [ -e ~/dotfiles/omarchy/.config/omarchy/themes/ ]; then
  rm -rf ~/dotfiles/omarchy/.config/omarchy/themes/
  echo "Removed ~/dotfiles/omarchy/.config/omarchy/themes/"
else
  echo "(not found): ~/dotfiles/omarchy/.config/omarchy/themes/"
fi

if [ -e ~/dotfiles/waybar/.config/waybar/ ]; then
  rm -rf ~/dotfiles/waybar/.config/waybar/
  echo "Removed ~/dotfiles/waybar/.config/waybar/"
else
  echo "(not found): ~/dotfiles/waybar/.config/waybar/"
fi

if [ -e ~/dotfiles/opencode/.config/opencode/opencode.json ]; then
  rm ~/dotfiles/opencode/.config/opencode/opencode.json
  echo "Removed ~/dotfiles/opencode/.config/opencode/opencode.json"
else
  echo "(not found): ~/dotfiles/opencode/.config/opencode/opencode.json"
fi

if [ -e ~/dotfiles/tmux/.tmux.conf ]; then
  rm ~/dotfiles/tmux/.tmux.conf
  echo "Removed ~/dotfiles/tmux/.tmux.conf"
else
  echo "(not found): ~/dotfiles/tmux/.tmux.conf"
fi

if [ -e ~/dotfiles/zsh/.zshrc ]; then
  rm ~/dotfiles/zsh/.zshrc
  echo "Removed ~/dotfiles/zsh/.zshrc"
else
  echo "(not found): ~/dotfiles/zsh/.zshrc"
fi

echo "dotfiles reset"

cp -r ~/.config/ghostty/ ~/dotfiles/ghostty/.config/
cp -r ~/.config/hypr/ ~/dotfiles/hypr/.config/
cp -r ~/.config/nvim/ ~/dotfiles/nvim/.config/
cp -r ~/.config/omarchy/themes/ ~/dotfiles/omarchy/.config/omarchy/themes/
cp -r ~/.config/waybar/ ~/dotfiles/waybar/.config/
cp ~/.config/opencode/opencode.json ~/dotfiles/opencode/.config/opencode/
cp ~/.tmux.conf ~/dotfiles/tmux/
cp ~/.zshrc ~/dotfiles/zsh/

echo "dotfiles copied to stow"
echo "✔  Refresh complete"
