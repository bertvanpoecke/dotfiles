#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Dotfiles: $DOTFILES"

# Homebrew
if ! command -v brew &>/dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "==> Installing packages (brew bundle)..."
brew bundle --file="$DOTFILES/Brewfile"

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Preflight: remove old ~/.config/fish symlink if it points to old location
if [ -L "$HOME/.config/fish" ]; then
    old_target="$(readlink "$HOME/.config/fish")"
    if [[ "$old_target" != *"/.config/fish" ]]; then
        echo "==> Removing outdated ~/.config/fish symlink (was: $old_target)"
        rm "$HOME/.config/fish"
    fi
fi

# Preflight: back up git files if they are real files (not symlinks)
for gitfile in .gitconfig .gitignore_global; do
    if [ -f "$HOME/$gitfile" ] && [ ! -L "$HOME/$gitfile" ]; then
        echo "==> Backing up existing ~/$gitfile to ~/${gitfile}.bak"
        cp "$HOME/$gitfile" "$HOME/${gitfile}.bak"
        rm "$HOME/$gitfile"
    fi
done

# Preflight: back up ~/.zshrc if it's a real file
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "==> Backing up existing ~/.zshrc to ~/.zshrc.bak"
    cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
    rm "$HOME/.zshrc"
fi

# Stow packages
echo "==> Stowing dotfiles..."
cd "$DOTFILES"
stow --target="$HOME" --restow fish zsh starship git ghostty

# Set zsh as default shell
ZSH_BIN="$(which zsh)"
if [ "$SHELL" != "$ZSH_BIN" ]; then
    echo "==> Adding $ZSH_BIN to /etc/shells..."
    grep -qxF "$ZSH_BIN" /etc/shells || echo "$ZSH_BIN" | sudo tee -a /etc/shells
    echo "==> Setting zsh as default shell..."
    chsh -s "$ZSH_BIN"
fi

# macOS defaults
if [[ "$(uname)" == "Darwin" ]]; then
    read -p "==> Apply macOS defaults? [y/N] " -r
    [[ $REPLY =~ ^[Yy]$ ]] && bash "$DOTFILES/macos/defaults.sh"
fi

# VS Code settings
if command -v code &>/dev/null; then
    read -p "==> Install VS Code settings? [y/N] " -r
    [[ $REPLY =~ ^[Yy]$ ]] && bash "$DOTFILES/vscode/install.sh"
fi

# Local overrides
if [ -f "$DOTFILES/local/zsh/zshrc.local" ] && [ ! -L "$HOME/.zshrc.local" ]; then
    if [ -f "$HOME/.zshrc.local" ]; then
        echo "==> Backing up existing ~/.zshrc.local to ~/.zshrc.local.bak"
        cp "$HOME/.zshrc.local" "$HOME/.zshrc.local.bak"
    fi
    echo "==> Linking local/zsh/zshrc.local → ~/.zshrc.local"
    ln -sf "$DOTFILES/local/zsh/zshrc.local" "$HOME/.zshrc.local"
fi

if [ -f "$DOTFILES/local/git/gitconfig.local" ] && [ ! -L "$HOME/.gitconfig.local" ]; then
    if [ -f "$HOME/.gitconfig.local" ]; then
        echo "==> Backing up existing ~/.gitconfig.local to ~/.gitconfig.local.bak"
        cp "$HOME/.gitconfig.local" "$HOME/.gitconfig.local.bak"
    fi
    echo "==> Linking local/git/gitconfig.local → ~/.gitconfig.local"
    ln -sf "$DOTFILES/local/git/gitconfig.local" "$HOME/.gitconfig.local"
fi

echo ""
echo "==> Done! Restart your terminal or run: exec zsh"
