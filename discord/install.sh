#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Installing (Better)Discord"



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



# INSTRUCTIONS & EXIT
# -------------------
# Configs can only be set when BD is fully loaded
"${repo_directory}/echoMessage.sh" -i "Close Discord (turn of system tray setting) and restart to load BetterDiscord"
"${repo_directory}/echoMessage.sh" -i "Once BetterDiscord is fully loaded, run restore.sh"
exit 0

