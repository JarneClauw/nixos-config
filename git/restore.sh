#!/usr/bin/env bash

echo "Restoring git configurations"

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Remove the configurations
rm "${HOME}/.gitconfig" > /dev/null 2>&1

# Add the configurations back
stow --ignore restore.sh --dir $repo_directory --target $HOME git

exit 0

