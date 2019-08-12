#!/usr/bin/env bash

set -xeu

if hash pyenv 2>/dev/null; then
	# Install python versions
	for version in "3.7.4" "3.8.5"; do 
		pyenv install "$version"
	done
else
	echo "Error: no pyenv found." && exit 42
fi
# Set default global python
pyenv global 3.8.5

# Install pip3 global packages
pip3 install --upgrade pip awscli
