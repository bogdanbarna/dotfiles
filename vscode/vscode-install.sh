#!/usr/bin/env bash

set -xeu

# Download
wget "https://code.visualstudio.com/sha/download?build=stable&os=darwin" -O vscode.zip

# Install
# TODO

# Install extensions
while read extension; do
	code --install-extension "$extension";
done < vscode-extentions.txt
