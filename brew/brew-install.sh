#!/usr/bin/env bash

set -xeu

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew --version

# Install homebrew packages
brew bundle --file=./Brewfile
