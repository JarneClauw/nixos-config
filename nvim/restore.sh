#!/usr/bin/env bash

# Original: https://github.com/AstroNvim/AstroNvim

# Find the dotfiles repository
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring Neovim configurations (based on AstroNvim)"

# Install neovim
"${repo_directory}/installDnf.sh" "neovim"

# Check if the directories exist
mkdir -p "${HOME}/.config/nvim"

# Remove old configurations
rm -rf "${HOME}/.config/nvim/*" > /dev/null 2>&1

# Adding my configurations back
stow --ignore "restore.sh" --dir "$repo_directory" --target "${HOME}/.config/nvim/" nvim

exit 0

