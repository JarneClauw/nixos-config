###
### Nix configuration
###

inputs: {
  ### OPTIMISE THE STORE ###
  nix.settings.auto-optimise-store = true;

  ### GARBAGE COLLECTOR ###
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 31d";
  };

  ### FLAKES ###
  nix = {
    package = inputs.pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
