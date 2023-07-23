#!/usr/bin/env bash

# SETUP
# -----
# Find the directory of the dotfiles repo
repo_directory="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1 ; pwd -P )"

# Echoing a descriptive message
"${repo_directory}/echoMessage.sh" "Restoring my ZSH configuration"



# INSTALLING
# ----------
# Install zsh because it is not default
"${repo_directory}/installDnf.sh" "zsh"

# Set it as the default
"${repo_directory}/installDnf.sh" "util-linux-user" # chsh needs this
chsh -s $(which zsh)



# INSTALL PLUGINS
# ---------------
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting/
# Auto suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions/
# History search
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/zsh-history-substring-search/
# Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k/

rm "${HOME}/.zshrc" "${HOME}/.p10k.zsh" > /dev/null 2>&1
stow --ignore "restore.sh" --dir "${repo_directory}" --target "${HOME}" zsh



# INSTRUCTIONS & EXIT
# -------------------
"${repo_directory}/echoMessage.sh" -i "Logout and log back in to see the effects"

exit 0

