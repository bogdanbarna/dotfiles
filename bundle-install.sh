#!/bin/bash

set -xeu

# Create workspace hierarchy dir
mkdir -p ~/Workspace/{{github,gitlab}.com,temporaries}

### Install homebrew
./brew/brew-install.sh

### Install Docker for Mac
./docker/docker-install.sh

### Install iTerm2
./iterm-install.sh

# Configure Python and Pyenv
./python/python-configure.sh

# Configure NPM
./node/npm-configure

# Configure git
./git/git-configure.sh

# Configure VIM
./fish/vim-configure.sh

# Configure fish
./fish/fish-configure.sh

# Install VS Code
./vscode/vscode-install.sh

echo "Installation complete!" && exit 0
