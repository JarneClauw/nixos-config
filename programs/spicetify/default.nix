###
### Spicetify configuration
###

inputs:
  let
    spicetifyPkgs = inputs.spicetify.packages.${inputs.system}.default;
  in
  {
    imports = [ inputs.spicetify.homeManagerModule ];

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
