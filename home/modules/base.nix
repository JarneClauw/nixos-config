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
  ];

  home.packages = with inputs.pkgs; [
    direnv
    cpulimit
    age
    sops
    tldr
    fzf
    lsd

    brave
    firefox # Remove firefox when using the config
    betterbird
    libreoffice
    obsidian
    gparted
  ];
}
