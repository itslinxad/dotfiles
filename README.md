# Dotfiles

My Personal dotfiles managed with GNU Stow for Arch Linux with Hyprland.

## Prerequisites

- Git
- GNU Stow
- Arch Linux (for `install.sh`)

## Installation

### 1. System Setup

Install required packages and dependencies:

```bash
chmod +x install.sh
./install.sh
```

This will install:

- **Core utilities**: stow, cmake
- **Development tools**: neovim, git, nodejs, npm, php, composer
- **Shell environment**: zsh, yazi, zoxide, tmux
- **System utilities**: curl, wget, flatpak, pavucontrol, piper
- **Styling**: Nerd fonts, themes
- **AUR packages**: waybar modules, wttrbar, brave-bin, and more

### 2. Deploy Dotfiles

Clone this repository and deploy configurations using stow:

```bash
git clone https://github.com/itslinxad/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

#### Deploy all configurations:

```bash
stow .
```

#### Deploy specific configurations:

For individual config directories:

```bash
stow -d ~/.config/nvim -t ~/.config/nvim .
stow -d ~/.config/hypr -t ~/.config/hypr .
stow -d ~/.config/waybar -t ~/.config/waybar .
```

Or manually link root-level dotfiles:

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
```

## Usage

### Update Dotfiles from System

After making changes to your live configurations, sync them back to the repository:

```bash
chmod +x refresh.sh
./refresh.sh
```

This script will copy your current configurations from `~/.config/` and `~/` back into the dotfiles repository.

### Unstow Configurations

To remove symlinks and unstow configurations:

```bash
cd ~/dotfiles
stow -D .
```

## Repository Structure

```
dotfiles/
├── .config/
│   ├── ghostty/       # Terminal emulator config
│   ├── hypr/          # Hyprland compositor config
│   ├── nvim/          # Neovim configuration
│   ├── omarchy/       # Omarchy themes
│   ├── opencode/      # Code editor config
│   ├── themes/        # Color themes
│   ├── tmux/          # Tmux plugin configs
│   └── waybar/        # Waybar status bar config
├── .tmux.conf         # Tmux configuration
├── .zshrc             # Zsh shell configuration
├── install.sh         # System package installation script
└── refresh.sh         # Sync configs back to repo
```

## Stow Commands Reference

| Command     | Description                     |
| ----------- | ------------------------------- |
| `stow .`    | Create symlinks for all configs |
| `stow -D .` | Remove all symlinks (unstow)    |
| `stow -R .` | Restow (useful after updates)   |
| `stow -n .` | Dry run (preview changes)       |
| `stow -v .` | Verbose output                  |

## Notes

- Stow creates symlinks from this repository to your `$HOME` directory
- The `.config` directory structure is preserved when stowing
- Use `refresh.sh` to pull changes from your live system back into this repo
- Always review changes before committing updated configurations
