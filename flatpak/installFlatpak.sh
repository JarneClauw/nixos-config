#!/usr/bin/env bash

# Get the flatpak name
flatpak=$1

# Check if the flatpak is already installed
flatpak info "$flatpak" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "${flatpak} (flatpak) is installed"
else
    echo "${flatpak} (flatpak) is not installed"
    
    # Installing flatpak
    flatpak install $flatpak

    if [ $? -ne 0 ]; then
        echo "The installation of ${flatpak} (flatpak) failed, try again"
        exit 1
    fi
fi

exit 0

