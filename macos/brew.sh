#!/usr/bin/env bash

# Install command-line tools using Homebrew.

if ! command -v brew &> /dev/null
then
    echo "brew could not be found"
    exit
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

# Install other tools
brew install docker-ls
brew install duck
brew install gcc
brew install gdal
brew install golanci-lint
brew install helm
brew install helmfile
brew install kafkactl
brew install rclone
brew install tree

# Remove outdated versions from the cellar.
brew cleanup