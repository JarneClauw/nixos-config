#!/usr/bin/env bash

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Adding a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring git configurations"

# Installing git (probably already installed)
"${repo_directory}/installDnf.sh" "git"

# Removing old configurations
rm "${HOME}/.gitconfig" > /dev/null 2>&1

# Add the configurations back
stow --ignore "restore.sh" --dir "$repo_directory" --target "$HOME" git

exit 0

