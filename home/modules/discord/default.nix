###
### Discord configuration
###

inputs: {
  home.packages = with inputs.pkgs; [ discord ];

  nixpkgs.overlays = [
    (final: prev: {
      discord = prev.discord.overrideAttrs (_: {
        src = builtins.fetchTarball "https://discord.com/api/download?platform=linux&format=tar.gz";
      });
    })
  ];
}
