#!/usr/bin/env bash

read -p "Do you want to install the Visual Studio Code settings? Remark this will overwrite exisiting settings! [y|n] " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit; fi

filename="settings.json"
if ../bin/is-macos; then
    folder="$HOME/Library/Application Support/Code/User/"
else
    folder="$HOME/.config/Code/User/"
fi

if [[ ! -d $folder ]]; then
    echo "Visual Studio Code is not installed on this system. (Settings folder not found.)"
    exit;
fi

echo "Installing settings..."
filepath="${folder}${filename}"
echo $filepath

if [[ -e $filepath ]]; then
    echo "VSCode settings were already present. Renaming old settings to settings_old.json..."
    cp "$filepath" "${filepath}_old"
    rm -f "$filepath" 2>/dev/null
fi

ln -s "$(pwd)/$filename" "$filepath"

echo "Done."