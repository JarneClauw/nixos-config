###
### Basic Home-manager configuration used by all hosts
###

{ config, pkgs, user, ... }:

{
  ### PROGRAM CONFIGURATIONS ###
  imports = [
    ./git/home.nix
    ./alacritty/home.nix
    ./zsh/home.nix
    ./discord/overlay.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    ### USER PACKAGES ###
    packages = with pkgs; [
      ### TERMINAL ###
      alacritty
      tldr
      fzf
      lsd

      ### CODING ###
      git
      neovim
      vscodium

      ### STANDARD ###
      firefox
      brave
      # mail
      libreoffice
      obsidian
      discord # Overlay is used to keep it up to date
      spotify
      spicetify-cli

      ### UTILITIES ###
      rsync
      clamav
      gparted

      ### OTHER ###
      virtualbox
    ];

    ### OTHER ###
    # Version of the options used, will not update the system!
    # Only change if the options can be migrated!
    stateVersion = "23.05";
  };
}
