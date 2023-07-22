#!/usr/bin/env bash

# Variables
reset='\e[0m'
color='\e[1;36m' # cyan bold

# Parse options
while getopts "e" opt; do
    case $opt in
	e) color='\e[1;31m' ;; # red bold
    esac
done

# Shift positional parameters
shift $((OPTIND - 1))

# Echo the message
echo -e "${color}${1}${reset}"

exit 0

