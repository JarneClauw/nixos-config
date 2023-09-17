#!/usr/bin/env bash

# scan -h                   : Help, print this summary
# scan <file or directory>  : Scan a file or directory
# scan -l                   : Show the scan logs
# scan -i                   : Show the infected files
# scan -r                   : Remove the infected files

log() {
    echo -e "\e[1;36mINFO: ${1}\e[0m"
}

showHelp() {
    log "Small script to make the use of ClamAV easier"
    echo "scan <file or directory>      : Scan a file or directory"
    echo "scan -l                       : Show the scan logs"
    echo "scan -i                       : Show the infected files"
    echo "scan -r                       : Remove the infected files"
}

scan() {
    # Updating freshclam should be done automatically
    log "Scanning ${1} ..."
    sudo clamscan --bell --infected --recursive --log=/var/log/clamav/scan.log --move=~/infected $1
}

showLog() {
    log "The log generated by clamscan"
    cat /var/log/clamav/scan.log
}

showInfected() {
    log "These are infected files! (MOVED)"
    lsd -al ~/infected/
}

removeInfected() {
    log "Removing infected files ..."
    rm -rfv ~/infected/*
}

# Read the options
while getopts "hlir" opt; do
    case $opt in
        h) showHelp ;;
        l) showLog ;;
        i) showInfected ;;
        r) removeInfected ;;
        *) echo "Not a valid option, see 'scan -h' for more" ;;
    esac
done

shift $((OPTIND - 1))

# Scan
if [ -e "$1" ] && ( [ -f "$1" ] || [ -d "$1" ] ); then
    scan "$1"
fi

exit 0
