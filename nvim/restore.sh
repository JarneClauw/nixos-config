#!/usr/bin/env bash

# Find the dotfiles repository
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring Neovim configurations (based on AstroNvim)"

# Install neovim
"${repo_directory}/installDnf.sh" "neovim"

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

exit 0

