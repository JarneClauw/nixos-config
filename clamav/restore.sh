#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring my ClamAV configuration"



# INSTALLATION
# ------------
"${repo_directory}/installDnf.sh" "clamav"
"${repo_directory}/installDnf.sh" "clamd"
"${repo_directory}/installDnf.sh" "cronie"

# Update the virus definitions
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl enable clamav-freshclam --now



# SCHEDULE
# --------
mkdir -p /home/jarne/infected/
echo "0 0 * * * /usr/bin/clamscan -r --quiet --move=/home/jarne/infected /home/jarne/" | crontab -



# RESTORE SCAN SCRIPT
# -------------------
rm "${HOME}/scan.sh" > /dev/null 2>&1
stow --ignore "restore.sh" --dir "${repo_directory}" --target "${HOME}" clamav



# EXIT
# ----
exit 0

