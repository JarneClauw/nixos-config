###
### Sound configuration
###

inputs: {
  ### PACKAGES ###
  environment.systemPackages = with inputs.pkgs; [
    pavucontrol
  ];

  ### SETTINGS ###
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
