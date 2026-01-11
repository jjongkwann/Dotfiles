[![Typing SVG](https://readme-typing-svg.demolab.com?font=JetbrainsMono+Nerd+Font&weight=600&size=35&duration=2000&pause=2000&color=F7F7F7&width=435&lines=ViegPhunt's+Dotfiles)](https://git.io/typing-svg)
### This repository contains **all of my personal dotfiles**

## 📦 Included Configurations
This repository includes configuration for:
- **Window Managers**: `Hyprland`
- **Terminals**: `ghostty`
- **Shells**: `zsh`
- **Prompt**: `pure`
- **Editors**: `neovim`
- **Multiplexer**: `tmux`
- **Status Bar**: `waybar`
- **Notifications**: `swaync`
- **Launcher**: `rofi`
- **Logout menu**: `wlogout`
- **Audio visualizer**: `cava`

## 📂 Structure

```plaintext
.
├── cava/           # Audio visualizer
├── colors/         # Color schemes
├── fontconfig/     # Font configuration
├── ghostty/        # Terminal emulator
├── hypr/           # Hyprland WM
├── nvim/           # Neovim editor
├── ohmyposh/       # Oh My Posh prompt (backup)
├── rofi/           # Application launcher
├── swaync/         # Notification center
├── tmux/           # Terminal multiplexer
├── viegphunt/      # Personal scripts
├── waybar/         # Status bar
├── wlogout/        # Logout menu
└── zsh/            # Zsh shell
```

## 🚀 Installation

### Prerequisites
- [GNU Stow](https://www.gnu.org/software/stow/)
- Git

```bash
# macOS
brew install stow

# Arch Linux
sudo pacman -S stow
```

### Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles
```

### Install with Stow

```bash
# Install specific packages
stow -t ~ zsh tmux nvim ghostty

# Install all packages
stow -t ~ */

# Remove a package
stow -t ~ -D nvim

# Simulate (dry run)
stow -t ~ -n -v nvim
```

### macOS Recommended

```bash
stow -t ~ zsh tmux nvim ghostty ohmyposh fontconfig colors
```

### Arch Linux Recommended

```bash
stow -t ~ zsh tmux nvim ghostty hypr waybar rofi cava swaync wlogout viegphunt fontconfig colors
```

## 📝 Notes

- Each directory is an independent stow package
- Symlinks are created relative to `$HOME`
- Use `stow -t ~ -D <package>` to unlink
- All configs follow XDG Base Directory spec (`~/.config/`)
- `zsh` uses `ZDOTDIR` via `~/.zshenv`
- `tmux` uses `~/.config/tmux/tmux.conf` (requires tmux 3.1+)
