#!/usr/bin/bash

echo "Restoring cursors"

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Make sure the path exists
mkdir -p "${HOME}/.local/share/icons/"

# Remove old configurations
rm -rf "${HOME}/.local/share/icons/Qogir-cursors" > /dev/null 2>&1

# Add the cursors back
stow --ignore restore.sh --dir $repo_directory --target "${HOME}/.local/share/icons" cursors 

exit 0
