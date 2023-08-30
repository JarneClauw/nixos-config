###
### Discord overlay (Can't use if it's not the latest)
###

{ nixpkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: { discord = super.discord.overrideAttrs (_: {
        src = builtins.fetchTarball "https://discord.com/api/download?platform=linux&format=tar.gz";
    });})
  ];
}
