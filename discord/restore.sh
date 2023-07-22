#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring (Better)Discord"



# CONFIGURATIONS
# --------------
config="${HOME}/.var/app/com.discordapp.Discord/config"

# Configuring themes and plugins
# Copy because symlink breaks it
rm -rf "${config}/BetterDiscord/themes/" "${config}/BetterDiscord/plugins/" 2>&1
cp -r "${repo_directory}/discord/BetterDiscord/themes" "${repo_directory}/discord/BetterDiscord/plugins" "${config}/BetterDiscord"



# EXIT
# ----
exit 0

