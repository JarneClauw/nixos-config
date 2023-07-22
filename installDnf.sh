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

# Get the package name
package=$1

# Check if the package is installed
dnf list installed "$package" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    log "${package} is installed"
else
    log "${package} is not installed"

    # Installing the package
    sudo dnf install "$package"

    check 1 "The installation of ${package} failed, try again"
fi

exit 0

