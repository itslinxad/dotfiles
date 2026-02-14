#!/usr/bin/env bash

set -e  # exit on error

DOTFILES=~/dotfiles

# Each entry: "source_path:dotfiles_dest_path"
# Directories should have a trailing slash
entries=(
  "~/.config/ghostty/:ghostty/.config/ghostty/"
  "~/.config/hypr/:hypr/.config/hypr/"
  "~/.config/nvim/:nvim/.config/nvim/"
  "~/.config/omarchy/themes/:omarchy/.config/omarchy/themes/"
  "~/.config/waybar/:waybar/.config/waybar/"
  "~/.config/opencode/opencode.json:opencode/.config/opencode/opencode.json"
  "~/.config/tmux/tmux.conf:tmux/.config/tmux/tmux.conf"
  "~/.zshrc:zsh/.zshrc"
)

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

for entry in "${entries[@]}"; do
  src="${entry%%:*}"
  dest="${entry##*:}"

  # Expand tilde
  src="${src/#\~/$HOME}"
  dest="$DOTFILES/$dest"

  # Check source exists (resolve symlinks so stow links work)
  if [ ! -e "$src" ]; then
    echo "SKIP (source not found): $src"
    continue
  fi

  # Copy source to a temp location first, so that removing stow
  # symlink targets doesn't break the source before we read it
  staging="$tmpdir/$dest"
  mkdir -p "$(dirname "$staging")"
  if [ -d "$src" ]; then
    cp -rL "$src" "$staging"
  else
    cp -L "$src" "$staging"
  fi

  # Clean existing destination and replace with staged copy
  rm -rf "$dest"
  mkdir -p "$(dirname "$dest")"
  mv "$staging" "$dest"

  echo "Copied $src -> $dest"
done

echo "✔  Refresh complete"
