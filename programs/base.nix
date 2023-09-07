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
    tldr
    fzf
    lsd

    neovim
    brave
    betterbird
    libreoffice
    obsidian

    rsync
    gparted
    usbutils
    pciutils
  ];
}
