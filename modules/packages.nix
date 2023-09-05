###
### System packages
###

inputs: {
  imports = [ ../programs/base-system.nix ];

  environment.systemPackages = with inputs.pkgs; [
    vim
  ];
}
