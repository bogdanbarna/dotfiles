#!/usr/bin/env bash

set -xeu

# Add config
ln -s "$(pwd)"/dot-vimrc ~/.vimrc

# Install vim-pathogen
mkdir -p ~/.vim/{autoload,bundle}
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install plugins
vim_plugins=(
	"https://github.com/vim-airline/vim-airline"
	"https://github.com/preservim/nerdtree.git"
	"https://github.com/jiangmiao/auto-pairs.git"
	"https://github.com/plasticboy/vim-markdown.git"
)
for plugin in "${vim_plugins[@]}"; do
	plugin_name=$(echo "plugin" | rev | cut -d'/' -f1 | rev)
	git clone "$plugin" ~/.vim/bundle/"$plugin_name"
done
