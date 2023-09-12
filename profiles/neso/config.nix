###
### System configuration specific to the neso profile
###

{
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

  ### GAMES ###
  programs.steam.enable = true; 	# Won't work otherwise
}
