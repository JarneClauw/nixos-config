###
### Network configuration
###

inputs: {
  networking = {
    hostName = "${inputs.host}";
    networkmanager.enable = true;
  };
}
