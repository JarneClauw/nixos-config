###
### Alacritty configuration
###

{
  ### INSTALL ###
  programs.alacritty = {
    enable = true;
  };

  ### SETTINGS ###
  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;

  ### THEMES ###
  home.file.".config/alacritty/glacier.yml".source = ./glacier.yml;
}
