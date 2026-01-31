#!/usr/bin/env bash

set -e  # exit on error

if [ -e ~/dotfiles/.config/ghostty/ ]; then
  rm -rf ~/dotfiles/.config/ghostty/
  echo "Removed ~/dotfiles/.config/ghostty/"
else
  echo "Skipped removal (not found): ~/dotfiles/.config/ghostty/"
fi

if [ -e ~/dotfiles/.config/hypr/ ]; then
  rm -rf ~/dotfiles/.config/hypr/
  echo "Removed ~/dotfiles/.config/hypr/"
else
  echo "Skipped removal (not found): ~/dotfiles/.config/hypr/"
fi

if [ -e ~/dotfiles/.config/nvim/ ]; then
  rm -rf ~/dotfiles/.config/nvim/
  echo "Removed ~/dotfiles/.config/nvim/"
else
  echo "Skipped removal (not found): ~/dotfiles/.config/nvim/"
fi

if [ -e ~/dotfiles/.config/omarchy/themes/ ]; then
  rm -rf ~/dotfiles/.config/omarchy/themes/
  echo "Removed ~/dotfiles/.config/omarchy/themes/"
else
  echo "Skipped removal (not found): ~/dotfiles/.config/omarchy/themes/"
fi

if [ -e ~/dotfiles/.config/tmux/ ]; then
  rm -rf ~/dotfiles/.config/tmux/
  echo "Removed ~/dotfiles/.config/tmux/"
else
  echo "Skipped removal (not found): ~/dotfiles/.config/tmux/"
fi

if [ -e ~/dotfiles/.config/waybar/ ]; then
  rm -rf ~/dotfiles/.config/waybar/
  echo "Removed ~/dotfiles/.config/waybar/"
else
  echo "Skipped removal (not found): ~/dotfiles/.config/waybar/"
fi

if [ -e ~/dotfiles/.tmux.conf ]; then
  rm ~/dotfiles/.tmux.conf
  echo "Removed ~/dotfiles/.tmux.conf"
else
  echo "Skipped removal (not found): ~/dotfiles/.tmux.conf"
fi

if [ -e ~/dotfiles/.zshrc ]; then
  rm ~/dotfiles/.zshrc
  echo "Removed ~/dotfiles/.zshrc"
else
  echo "Skipped removal (not found): ~/dotfiles/.zshrc"
fi

echo "dotfiles reset"

cp -r ~/.config/ghostty/ ~/dotfiles/.config/
cp -r ~/.config/hypr/ ~/dotfiles/.config/
cp -r ~/.config/nvim/ ~/dotfiles/.config/
cp -r ~/.config/omarchy/themes/ ~/dotfiles/.config/omarchy/themes/
cp -r ~/.config/tmux/ ~/dotfiles/.config/
cp -r ~/.config/waybar/ ~/dotfiles/.config/
cp ~/.tmux.conf ~/dotfiles/
cp ~/.zshrc ~/dotfiles/

echo "dotfiles copied to stow"
echo "✔  Refresh complete"
