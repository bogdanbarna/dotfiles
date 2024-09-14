#!/usr/bin/env bash

set -xeu

# Configure git name and email
read -r -p "Configure git global user.name" username
read -r -p "Configure git global user.email" email
git config --global user.name "$username"
git config --global user.email "$email"
read -r -p "Don't forget to add user.signingkey as well!"

# Configure git-secrets
git secrets --register-aws --global
# Add hooks to all your local repositories.
git secrets --install ~/.git-templates/git-secrets
git config --global init.templateDir ~/.git-templates/git-secrets
git config --global init.templatedir "$HOME/.git-templates/git-secrets"

# Add GPG key
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG
gpg --armor --export "$(gpg --list-secret-keys --keyid-format LONG | grep sec | cut -d'/' -f2 | cut -d' ' -f1)"
git config --global gpg.program gpg
git config --global commit.gpgsign true
git config --global branch.sort -committerdate

# Complete git configuration
git config --global alias.lol "log --graph --oneline --decorate"
git config --global alias.commit "commit -s"
git config --global color.ui true
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global init.defaultBranch "main"

cat >> ~/.gitconfig << EOF
# This is Git's per-user configuration file.
[filter "lfs"]
	process = git-lfs filter-process
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
EOF

# Configure gitk
ln -s "$(pwd)"/dot-config-git ~/.config/git
