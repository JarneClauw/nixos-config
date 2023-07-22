#!/usr/bin/env bash

#  : Default, bold cyan
# i: Info, bold green
# w: Warning, bold orange
# e: Error, bold red

# Variables
reset='\e[0m'
color='\e[1;36m'

# Parse options
while getopts "iwe" opt; do
    case $opt in
    i) color='\e[1;32m' ;;
    w) color='\e[1;33m' ;;
	e) color='\e[1;31m' ;;
    esac
done

# Shift positional parameters
shift $((OPTIND - 1))

# Echo the message
echo -e "${color}${1}${reset}"

exit 0

