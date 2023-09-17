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
  ];

  home.packages = with inputs.pkgs; [
    direnv
    cpulimit
    tldr
    fzf
    lsd

    neovim
    brave
    firefox # Remove firefox when using the config
    betterbird
    libreoffice
    obsidian
    gparted
  ];
}
