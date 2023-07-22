#!/usr/bin/env bash

# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring discord configuration"

# Install Discord
"${repo_directory}/installFlatpak.sh" "com.discordapp.Discord"

# Run discord (on the background and independent) configs ... are made
nohup flatpak run "com.discordapp.Discord" > /dev/null 2>&1 &
"${repo_directory}/echoMessage.sh" "Wait until the discord app is ready, then enter"
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

# Add my BetterDiscord configurations back


exit 0

