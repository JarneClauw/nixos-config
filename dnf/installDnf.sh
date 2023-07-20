#!/usr/bin/env bash

# Get the package name
package=$1

# Check if the package is installed
dnf list installed "$package" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "${package} is installed"
else
    echo "${package} is not installed"

    # Installing the package
    sudo dnf install "$package"

    if [ $? -ne 0 ]; then
        echo "The installation of ${package} failed, try again"
        exit 1
    fi
fi

exit 0

