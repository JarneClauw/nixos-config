###
### Basic NixOS system configuration used by all hosts
###

{ pkgs, user, hostName, ... }:

{
  imports = [
    ../clamav/configuration.nix
  ];

  ### NETWORK ###
  networking.hostName = "${hostName}";
  networking.networkmanager.enable = true;
  
  ### TIME ZONE & LOCALE ###
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_BE.UTF-8";
    LC_IDENTIFICATION = "nl_BE.UTF-8";
    LC_MEASUREMENT = "nl_BE.UTF-8";
    LC_MONETARY = "nl_BE.UTF-8";
    LC_NAME = "nl_BE.UTF-8";
    LC_NUMERIC = "nl_BE.UTF-8";
    LC_PAPER = "nl_BE.UTF-8";
    LC_TELEPHONE = "nl_BE.UTF-8";
    LC_TIME = "nl_BE.UTF-8";
  };

  ### PRINTER & SCANNER ###
  services.printing.enable = true;

  ### SOUND ###
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  ### BLUETOOTH ###
  hardware.bluetooth.enable = true;

  ### USERS ###
  users.users.${user} = {
    isNormalUser = true;
    description = "Jarne Clauw";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "lp" "scanner" ];
    # No user packages, controlled with home-manager
  };

  ### ENVIRONMENTS ###
  services.xserver = {
    enable = true;

    # Default desktop environment
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  ### KEYMAP ###
  services.xserver = { layout = "be"; xkbVariant = "nodeadkeys"; };
  console.keyMap = "be-latin1";

  ### TOUCHPAD ###
  services.xserver.libinput = { enable = true; touchpad.tapping = true; };

  ### NUMLOCK ###
  # Numlock On on startup

  ### FONTS ###
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  ### PACKAGES ###
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  ### OPTIMISATION ###
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  ### EXPERIMENTAL FEATURES ###
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  ### OTHER ###
  # Enabling cron services
  services.cron.enable = true;

  # Version of the options used, will not update the system!
  # Only change if the options can be migrated!
  system.stateVersion = "23.05";
}