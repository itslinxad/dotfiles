#!/usr/bin/env bash

set -e  # exit on error

rm -rf ~/dotfiles/.config/ghostty/
rm -rf ~/dotfiles/.config/hypr/
rm -rf ~/dotfiles/.config/nvim/
rm -rf ~/dotfiles/.config/omarchy/themes/
rm -rf ~/dotfiles/.config/tmux/
rm -rf ~/dotfiles/.config/waybar/
rm ~/dotfiles/.tmux.conf/
rm ~/dotfiles/.zshrc/

echo "dotfiles reset"

cp -r ~/.config/ghostty/ ~/dotfiles/.config/ghostty/
cp -r ~/.config/hypr/ ~/dotfiles/.config/hypr/
cp -r ~/.config/nvim/ ~/dotfiles/.config/nvim/
cp -r ~/.config/omarchy/themes/ ~/dotfiles/.config/omarchy/themes/
cp -r ~/.config/tmux/ ~/dotfiles/.config/tmux/
cp -r ~/.config/waybar/ ~/dotfiles/.config/waybar/
cp ~/.tmux.conf/ ~/dotfiles/.tmux.conf/
cp ~/.zshrc ~/dotfiles/.zshrc/

echo "dotfiles copied to stow"
echo "✔  Refresh complete"
