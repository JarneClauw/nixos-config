#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Installing Spotify and Spicetify"



# INSTALLING
# ----------
# Install Spotify
"${repo_directory}/installFlatpak.sh" "com.spotify.Client"
# Creates files upon starting
flatpak run "com.spotify.Client"

# Install Spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh > /dev/null 2>&1



# INSTRUCTIONS & EXIT
# -------------------
"${repo_directory}/echoMessage.sh" -i "Restart the shell to have access to the spicetify command"
"${repo_directory}/echoMessage.sh" -i "Run restore.sh to restore the spicetify plugins and themes"

exit 0

