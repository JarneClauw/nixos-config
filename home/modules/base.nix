###
### Base group of packages
###

inputs: {
  imports = [
    ./alacritty
    ./git
    ./vscodium
    #./firefox
    ./discord
    ./spicetify
    ./clamav
    ./zsh
    ./gnome
    ./neovim
    ./redshift
    ./direnv
  ];

  home.packages = with inputs.pkgs; [
    cpulimit
    age
    sops
    htop
    tldr
    fzf
    lsd

    virt-manager

    brave
    firefox # Remove firefox when using the config
    betterbird
    libreoffice
    obsidian
    xournalpp
    gparted
  ];
}
