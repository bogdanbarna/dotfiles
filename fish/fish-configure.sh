#!/usr/bin/env bash

set -xeu

if hash fish 2>/dev/null; then
	# Add fish to list of available shells
	echo /usr/local/bin/fish | sudo tee -a /etc/shells 
	# Set fish as default shell
	chsh -s /usr/local/bin/fish
else
	echo "Error: no fish found." && exit 43
fi

ln -s "$(pwd)"/dot-config-fish ~/.config/fish
