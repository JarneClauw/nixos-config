###
### Spicetify configuration
###

{ pkgs, spicetify, ... }:

let
  spicetifyPkgs = spicetify.packages.${pkgs.system}.default;
in
{
  imports = [ spicetify.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    
    theme = spicetifyPkgs.themes.catppuccin-mocha;

    enabledExtensions = with spicetifyPkgs.extensions; [
      fullAppDisplay
      shuffle
      genre
      adblock
    ];

    enabledCustomApps = with spicetifyPkgs.apps; [
      new-releases
      lyrics-plus
    ];
  };
}
