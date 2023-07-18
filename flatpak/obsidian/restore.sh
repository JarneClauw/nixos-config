#!/usr/bin/env bash

echo "Restoring obsidian configuration"

# Find the flatpak directory
flatpak_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Install the software if needed
bash "${flatpak_directory}/installFlatpak.sh" "md.obsidian.Obsidian"

# Check if the necessary directories are there
mkdir -p "${HOME}/cs"

# Remove the configurations
rm -rf "${HOME}/cs/.obsidian" > /dev/null 2>&1

# Add the configurations back
stow --ignore restore.sh --dir $flatpak_directory --target "${HOME}/cs/" obsidian

exit 0

