#!/usr/bin/env bash

# Setup
repo_directory="$( cd -- "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"

log() {
    "${repo_directory}/echoMessage.sh" "$1"
}

check() {
    if [ $? -ne 0 ]; then
	"${repo_directory}/echoMessage.sh" -e "$2"
	exit $1
    fi
}

# Get the flatpak name
flatpak=$1

# Check if the flatpak is already installed
flatpak info "$flatpak" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    log "${flatpak} (flatpak) is installed"
else
    log "${flatpak} (flatpak) is not installed"
    
    # Installing flatpak
    flatpak install "$flatpak"

    check 1 "The installation of ${flatpak} (flatpak) failed, try again"
fi

exit 0

