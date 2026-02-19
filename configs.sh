#!/usr/bin/env bash

set -e

git config --global user.name "Linux Adona"
git config --global user.email "linuxadona17@gmail.com"
git config --global init.defaultBranch main

# GitHub SSH Key Setup
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
  echo "Generating new SSH key for GitHub..."
  ssh-keygen -t ed25519 -C "linuxadona17@gmail.com" -f "$SSH_KEY" -N ""
  eval "$(ssh-agent -s)"
  ssh-add "$SSH_KEY"
  echo "Authenticating with GitHub CLI..."
  gh auth login -p ssh -h github.com -w
  gh ssh-key add "${SSH_KEY}.pub" --title "$(hostname)"
else
  echo "SSH key already exists at $SSH_KEY. Skipping generation."
  eval "$(ssh-agent -s)"
  ssh-add "$SSH_KEY"
fi

echo "✔ SSH setup done"

# Zsh Setup — Install Oh My Zsh first, then plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed. Skipping."
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_plugin() {
  local repo="$1"
  local dest="$2"
  if [ -d "$dest" ]; then
    echo "Plugin already exists: $dest. Skipping."
  else
    echo "Installing plugin: $dest"
    git clone https://github.com/"$repo".git "$dest"
  fi
}

clone_plugin "zsh-users/zsh-autosuggestions" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_plugin "zsh-users/zsh-syntax-highlighting" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_plugin "romkatv/powerlevel10k" "$ZSH_CUSTOM/themes/powerlevel10k"
clone_plugin "MichaelAquilina/zsh-you-should-use" "$ZSH_CUSTOM/plugins/you-should-use"
clone_plugin "fdellwing/zsh-bat" "$ZSH_CUSTOM/plugins/zsh-bat"

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"

cd "$DOTFILES_DIR"

install_config() {
  local name="$1"
  local package="$2"

  echo ""
  echo "Installing $name config..."

  # Dry-run stow to detect conflicts
  local conflicts
  conflicts=$(stow --no "$package" 2>&1 || true)

  if echo "$conflicts" | grep -q "existing target"; then
    echo "Conflict detected for $name."

    # Extract conflicting paths from stow output
    local conflicting_files
    conflicting_files=$(echo "$conflicts" | grep "existing target" |
      sed 's/.*over existing target //' |
      sed 's/ since .*//' |
      sed 's/.*existing target is not owned by stow: //' |
      sed 's/^[[:space:]]*//')

    echo "The following files/directories conflict:"
    echo "$conflicting_files" | while read -r f; do
      echo "  ~/$f"
    done

    read -rp "Back up existing files and install $name config? (y/N): " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
      mkdir -p "$BACKUP_DIR"
      echo "$conflicting_files" | while read -r f; do
        local src="$HOME/$f"
        if [ -e "$src" ] || [ -L "$src" ]; then
          local backup_dest="$BACKUP_DIR/$f"
          mkdir -p "$(dirname "$backup_dest")"
          if [ -L "$src" ]; then
            rm "$src"
            echo "  Removed stale symlink: ~/$f"
          else
            mv "$src" "$backup_dest"
            echo "  Backed up: ~/$f -> $BACKUP_DIR/$f"
          fi
        fi
      done

      # After backing up individual files, remove any now-empty parent
      # directories that stow needs to replace with symlinks.
      # Walk each conflicting path and clean up empty dirs bottom-up.
      echo "$conflicting_files" | while read -r f; do
        local parent
        parent=$(dirname "$HOME/$f")
        while [ "$parent" != "$HOME" ] && [ -d "$parent" ]; do
          if [ -z "$(ls -A "$parent" 2>/dev/null)" ]; then
            rmdir "$parent"
          else
            break
          fi
          parent=$(dirname "$parent")
        done
      done

      stow "$package"
      echo "✔ $name config installed (old files backed up to $BACKUP_DIR)"
    else
      echo "Skipped $name config."
      return
    fi
  else
    # No conflicts, install directly
    stow "$package"
    echo "✔ $name config installed"
  fi
}

install_config "Zsh" "zsh"
install_config "Ghostty" "ghostty"
install_config "Hyprland" "hypr"
install_config "Neovim" "nvim"
install_config "Omarchy" "omarchy"
install_config "OpenCode" "opencode"
install_config "Tmux" "tmux"
install_config "Waybar" "waybar"

omarchy-theme-set itslinx

echo ""
echo "All configs installed!"
