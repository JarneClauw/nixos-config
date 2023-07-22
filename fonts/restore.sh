#!/usr/bin/env bash

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring fonts"

# Make sure the path exists
mkdir -p "${HOME}/.local/share/fonts/"

# Remove old configurations
rm -rf "${HOME}/.local/share/fonts/hack" > /dev/null 2>&1

# Add the configurations back
stow --ignore "restore.sh" --dir "$repo_directory" --target "${HOME}/.local/share/fonts" fonts

exit 0

