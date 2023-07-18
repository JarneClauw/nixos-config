#!/usr/bin/env bash

echo -n "Restoring bash configurations"

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Remove the configurations
rm ~/.bash_logout ~/.bash_profile ~/.bashrc > /dev/null 2>&1

# Add the configurations back
stow --dir $repo_directory --target ~ bash --ignore restore.sh

echo " - Done"
exit 0

