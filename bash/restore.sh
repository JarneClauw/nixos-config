#!/usr/bin/env bash

echo "Restoring bash configurations"

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Remove the configurations
rm "${HOME}/.bash_logout" "${HOME}/.bash_profile" "${HOME}/.profile" "${HOME}/.bashrc" > /dev/null 2>&1

# Add the configurations back
stow --ignore restore.sh --dir $repo_directory --target $HOME bash

exit 0

