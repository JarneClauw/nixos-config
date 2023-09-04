###
### Hardware configuration specific to the neso profile
###
### Partition scheme:
### /boot	1 GiB	ESP
### /	256 GiB	nixos
### 	256 GiB data
### 	8 GiB	swap
###

inputs: {
  imports = [
    (inputs.modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    label = "nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    label = "ESP";
    fsType = "vfat";
  };

  fileSystems."/data" = {
    label = "data";
    fsType = "ext4";
    options = [ "nofail" ]; 	# System startup won't crash if it fails to mount
  };

  systemd.tmpfiles.rules = [
    "d /media/data 0777 root root" 			# Give everyone rwx access
    "L+ /home/${inputs.user}/data - - - - /media/data" 	# Add a symlink for the data partition
  ];

  swapDevices = [
    { label = "swap"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = inputs.lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = inputs.lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = inputs.lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = inputs.lib.mkDefault inputs.config.hardware.enableRedistributableFirmware;
}
