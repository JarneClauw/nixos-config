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

# Generate a default config
spicetify apply > /dev/null 2>&1

# Restoring the configs
rm "${HOME}/.config/spicetify/config-xpui.ini" > /dev/null 2>&1
rm -rf "${HOME}/.config/spicetify/Themes" "${HOME}/.config/spicetify/CustomApps" > /dev/null 2>&1
stow --dir "${repo_directory}/spotify/" --target "${HOME}/.config/spicetify/" spicetify

# Apply the configs and backup
spicetify backup apply



# INSTRUCTIONS & EXIT
# -------------------
"${repo_directory}/echoMessage.sh" -i "The marketplaceSettings.txt need to be manually set!"

exit 0

