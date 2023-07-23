#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring my Alacritty configuration"



# INSTALLATION
# ------------
"${repo_directory}/installDnf.sh" "alacritty"



# CONFIGURATIONS
# --------------
mkdir -p "${HOME}/.config/alacritty/"
rm -rf "${HOME}/.config/alacritty/"*

stow --ignore "restore.sh" --dir "$repo_directory" --target "${HOME}/.config/alacritty/" alacritty



exit 0

