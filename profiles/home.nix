###
### Base Home Manager configuration
###

inputs: {
  imports = [
    ../programs/base.nix
  ];

  home.username = "${inputs.user}";
  home.homeDirectory = "/home/${inputs.user}";

  home.stateVersion = "${inputs.stateVersion}";
}
