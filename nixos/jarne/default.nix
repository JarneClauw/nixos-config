###
### NixOS system configuration specific to the "jarne" profile
###

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix	# Include the hardware configuration
    ];

  ### BOOTLOADER ###
  boot.loader = {
    timeout = 3;			# Wait 3s before auto selection
    grub = { 				# Grub is mostly set up for dual boot
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true; 		# Find other OSs
      configurationLimit = 5; 		# Limit of 5 NixOS configurations
    };
    efi = { 				# EFI boot
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  ### ENVIRONMENT ###
  services.xserver = {
    # Enabling X11 windowing system
    enable = true;

    # Keyboard layout
    layout = "be";
    xkbVariant = "nodeadkeys";

    # Touchpad
    libinput.enable = true;
    libinput.touchpad.tapping = true;

    # Enable auto numlock
    # Not available for gdm

    # GNOME Desktop Environment
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  
  ### KEYMAP ###
  # Keyboard layout: See Environment
  console.keyMap = "be-latin1"; 	# Console keymap
}
