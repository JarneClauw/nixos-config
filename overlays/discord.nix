###
### Discord overlay (Can't use it if it's not the latest version)
###

{ nixpkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: { discord = super.discord.overrideAttrs (_: {
        src = builtins.fetchTarball "https://discord.com/api/download?platform=linux&format=tar.gz";
    });})
  ];
}
