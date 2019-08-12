#!/usr/bin/env bash

set -xeu

if hash npm 2>/dev/null; then
	npm_packages=("npm" "doctoc" "write-good")
	for pkg in "${npm_packages[@]}"; do
		npm install --global "$pkg"
	done
else
	echo "Error: no npm found." && exit 42
fi
