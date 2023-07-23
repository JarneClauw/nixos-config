#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring Spotify and Spicetify"



# CONFIGURATIONS
# --------------
# Give permissions
sudo chmod a+wr "/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify"
sudo chmod a+wr -R "/var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps"



# EXIT
# ----
exit 0

