#!/usr/bin/env bash

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring discord configuration"



# INSTALLING
# ----------
# Install Discord
"${repo_directory}/installFlatpak.sh" "com.discordapp.Discord"

# Run discord (on the background and independent) configs ... are made
nohup flatpak run "com.discordapp.Discord" > /dev/null 2>&1 &
"${repo_directory}/echoMessage.sh" -w "Wait until the discord app is ready, then enter"
read userInput

# Install betterdiscordctl
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin

# Keeping betterdiscordctl up to date
sudo betterdiscordctl self-upgrade

# Install BetterDiscord
# betterdiscordctl reinstall to update BetterDiscord after a Discord update
betterdiscordctl --d-install flatpak install

exit 0 #-------------------------------------------------------------------------------

# CONFIGURATIONS 
# --------------
# Discord settings itself change on startup ...
config="${HOME}/.var/app/com.discordapp.Discord/config"

# BetterDiscord Themes & Plugins
rm -rf "${config}/BetterDiscord/themes/" "${config}/BetterDiscord/plugins/" > /dev/null 2>&1
stow --ignore "stable" --dir "${repo_directory}/discord/" --target "${config}/BetterDiscord/" BetterDiscord

# BetterDiscord settings
rm -rf "${config}/BetterDiscord/data/stable/" > /dev/null 2>&1
stow --ignore "themes|plugins" --dir "${repo_directory}/discord/" --target "${config}/BetterDiscord/data/" BetterDiscord



exit 0

