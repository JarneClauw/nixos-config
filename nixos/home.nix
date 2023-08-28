###
### Basic Home-manager configuration used by all hosts
###

{ config, pkgs, user, ... }:

{
  ### PROGRAM CONFIGURATIONS ###
  imports = [
    
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
      discord
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
