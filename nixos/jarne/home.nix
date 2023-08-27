###
### Home-manager configuration specific to the "jarne" profile
###

{ pkgs, ... }:

{
  ### USER PACKAGES ###
  home.packages = with pkgs; [
    ### TERMINAL (FUN) ###
    neofetch
    pokemon-colorscripts-mac
    cbonsai
    cmatrix
    pipes
  ];
}
