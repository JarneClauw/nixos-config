{
  description = "Python DevShell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" ];
    forAllSystems = function: nixpkgs.lib.genAttrs systems (system: function {
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };
    });
  in {
    devShells = forAllSystems ({ pkgs }: {
      default = (pkgs.buildFHSUserEnv {
        name = "pip-zone";
	targetPkgs = pkgs: with pkgs; [
          python310Full
	  python310Packages.pip
	];
	runScript = "zsh";
      }).env;
    });
  };
}
