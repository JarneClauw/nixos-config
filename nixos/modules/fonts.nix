###
### Font configuration
###

inputs: {
  fonts.fonts = with inputs.pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
