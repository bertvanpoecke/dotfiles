#!/usr/bin/env bash

if ! command -v asdf &> /dev/null
then
    echo "asdf could not be found"
    exit
fi

# Make sure we’re using the latest asdf.
echo "updating asdf using brew..."
brew update
brew upgrade asdf

echo "configuring fish completions"
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# Install plugins
asdf plugin add helm https://github.com/Antiarchitect/asdf-helm.git
asdf plugin add kubectl https://github.com/asdf-community/asdf-kubectl.git

# Link global tool versions file
filename=".tool-versions"
ln -s "$(pwd)/$filename" "$HOME/$filename"
