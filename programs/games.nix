###
### Group of packages needed for gaming
###

inputs: {
  home.packages = with inputs.pkgs; [
    mgba    	# GameBoy Advanced emulator
    desmume 	# Nintendo DS emulator
    steam 	# Also enabled in system because ...
    wine
    winetricks
  ];
}
