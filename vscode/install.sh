#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
SETTINGS_SRC="$DOTFILES/vscode/settings.json"

if [[ "$(uname)" == "Darwin" ]]; then
    VSCODE_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_DIR="$HOME/.config/Code/User"
fi

if [[ ! -d "$VSCODE_DIR" ]]; then
    echo "VS Code settings directory not found: $VSCODE_DIR"
    exit 1
fi

TARGET="$VSCODE_DIR/settings.json"
if [[ -f "$TARGET" && ! -L "$TARGET" ]]; then
    echo "Backing up existing settings to settings.json.bak"
    cp "$TARGET" "${TARGET}.bak"
fi

ln -sf "$SETTINGS_SRC" "$TARGET"
echo "VS Code settings linked."

# Install extensions
if command -v code &>/dev/null; then
    echo "Installing extensions..."
    while IFS= read -r ext; do
        code --install-extension "$ext" --force 2>/dev/null || true
    done < "$DOTFILES/vscode/vscode-extensions.txt"
fi
