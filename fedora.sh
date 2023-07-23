#!/usr/bin/env bash

# Setup
# -----
repo_directory="$( cd -- "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"

log() {
    "${repo_directory}/echoMessage.sh" "$1"
}

check() {
    if [ $? -ne 0 ]; then
	"${repo_directory}/echoMessage.sh" -e "$1"
    fi
}



# Adjust the dnf settings
# -----------------------
log "Updating dnf settings"
sudo tee -a "/etc/dnf/dnf.conf" <<EOF
# Jarne's extra settings
max_parallel_downloads=10
defaultyes=True
keepcache=True
EOF
check "Failed to update the dnf config"



# Clear the caches and update the system
# --------------------------------------
log "Clearing the caches"
sudo dnf clean all
check "Failed to clean the caches"

log "Updating the system"
sudo dnf update
check "Failed to update the system"



# Enabling RPM Fusion
# -------------------
log "Installing RPM Fusion (Free + Non-Free)"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
check "Failed to install RPM Fusion"

log "Add RPM packages to the software center"
sudo dnf groupupdate core
check "Failed to update the software center with RPM packages"



# Multimedia
# ----------
log "Changing ffmpeg-free with ffmpeg"
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
check "Failed to swap ffmpeg-free with ffmpeg"

log "Installing packages for gstreamer enabled applications"
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
check "Failed to install packages for gstreamer enabled applications"

log "Installing packages for sound and video"
sudo dnf groupupdate sound-and-video
check "Failed to install packages for sound and video"

log "Adding hardware accelerated codec (recent Intel)"
sudo dnf install intel-media-driver
check "Failed to install intel hardware accelerated codec"



# Flatpaks
# --------
log "Enabling the Flathub remote"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
check "Failed to enable the Flathub remote"



# Directories
# -----------
# Some directories that are always there on my machines
mkdir -p ~/cs/
mkdir -p ~/projects/



# Applications
# ------------
while read -r package; do
    "${repo_directory}/installDnf.sh" "$package"
done < "${repo_directory}/dnf.txt" 

while read -r package; do
    "${repo_directory}/installFlatpak.sh" "$package"
done < "${repo_directory}/flatpak.txt"



# Configs
# -------
configs=(
    alacritty
    clamav
    cursors
    discord
    fonts
    git
    nvim
    obsidian
    zsh
)

for config in "${config[@]}"; do
    "${repo_directory}/${config}/restore.sh"
done



# Manuel TO-DO
# ------------
"${repo_directory}/echoMessage.sh" -w "Backup: preferences need to be set manually"
"${repo_directory}/echoMessage.sh" -w "Spotify: run install.sh and restore.sh script manually"
"${repo_directory}/echoMessage.sh" -w "Gnome extensions: configuring manualy (Blur my Shell, Dash to Dock, Just Perfection, OpenWeather)"
"${repo_directory}/echoMessage.sh" -w "Settings: Gnome tweaks and settings need to be set manually"



exit 0

