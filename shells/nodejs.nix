###
### Nodejs DevShell
###

{
  description = "Nodejs DevShell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

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
      default = pkgs.mkShell {
        shellHook = ''
	  echo "Nodejs DevShell loaded"
	'';

	packages = with pkgs; [
          nodejs
	];
      };
    });
  };
}
