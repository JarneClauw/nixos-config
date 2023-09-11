###
### Sound configuration
###

{
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  ### If speakers don't work but headphones do, then open 'pavucontrol'.
  ### Go to 'Configuration' check if the settings are ok and (re)select the profile.
}
