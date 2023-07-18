#!/usr/bin/env bash

echo -n "Restoring git configurations"

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Remove the configurations
rm ~/.gitconfig > /dev/null 2>&1

# Add the configurations back
stow --ignore restore.sh --dir $repo_directory --target ~ git

echo " - Done"
exit 0
