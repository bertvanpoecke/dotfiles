#!/usr/bin/env bash

# Install command-line tools using Homebrew.

if ! command -v brew &> /dev/null
then
    echo "brew could not be found. Trying to install..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
echo "updating brew..."
brew update

# Upgrade any already-installed formulae.
echo "upgrading brew..."
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install fish command line
brew install fish

# Install other command line tools
brew install docker-ls
brew install duck
brew install gcc
brew install gdal
brew install golanci-lint
brew install helm
brew install helmfile
brew install kafkactl
brew install rclone
brew install awscli
brew install tree
brew install k9s
brew install asdf
brew install kcat
brew install cmake
brew install jq

# Install GUI tools
brew install --cask sourcetree
brew install --cask cyberduck
brew install --cask slack
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask brave-browser
brew install --cask docker
brew install --cask signal

# Remove outdated versions from the cellar.
brew cleanup