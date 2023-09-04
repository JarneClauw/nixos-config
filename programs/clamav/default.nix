###
### Clam AntiVirus configuration
###

inputs: {
  home.packages = with inputs.pkgs; [ clamav ];

  home.file."scan.sh".source = ./scan.sh;
}
