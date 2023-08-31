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
    sudo clamscan --bell --move=/tmp/infected -i -r $1
}

showLogs() {
    log "Here are the logs '/var/log/clamav/' generated by clamscan"
    lsd -al /var/log/clamav/
}

showInfected() {
    log "Infected files: see '/home/jarne/infected/'"
    lsd -al /home/jarne/infected/
}

removeInfected() {
    log "Removing infected files ..."
    rm -rfv /home/jarne/infected/*
}

# Read the options
while getopts "hlir" opt; do
    case $opt in
        h) showHelp ;;
        l) showLogs ;;
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
