###
### Base system configuration
###

inputs: {
  imports = [
    ./nix.nix
    ../modules/packages.nix
    ../modules/network.nix
    ../modules/keyboard.nix
    ../modules/touchpad.nix
    ../modules/sound.nix
    ../modules/locale.nix
    ../modules/printer.nix
    ../modules/fonts.nix
    ../modules/gnome.nix
  ];

  ### USERS ###
  users.users.${inputs.user} = {
    isNormalUser = true;
    description = "Jarne Clauw";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "lp" "scanner" ];
    # No user packages, controlled with home-manager
  };

  ### ENVIRONMENTS ###
  services.xserver.enable = true;
  services.xserver.displayManager = {
    gdm.enable = true;
    #defaultSession = "gnome";
    #lightdm.enable = true;
    #lightdm.greeters.slick.enable = true;
  };

  ### OTHER ###
  # Enabling cron services
  services.cron.enable = true;

  system.stateVersion = "${inputs.stateVersion}";
}
