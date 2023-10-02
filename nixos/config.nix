###
### Base config for all NixOS systems
###

inputs: {
  ### IMPORTANT MODULES ###
  imports = [
    ./modules/nix.nix

    ./modules/gnome.nix
    ./modules/keyboard.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/sound.nix
    ./modules/touchpad.nix
  ];

  ### USER ###
  users.users.${inputs.user} = {
    isNormalUser = true;
    description = "Jarne Clauw";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "lp" "scanner" "libvirtd" ];
  };

  ### ENVIRONMENT ###
  services.xserver.enable = true;
  services.xserver.displayManager = {
    gdm.enable = true;
  };

  ### VIRTUALISATION ###
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  
  ### STATE VERSION ###
  system.stateVersion = "${inputs.stateVersion}";
}
