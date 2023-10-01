{
  description = "C/C++ DevShell";

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
      default = pkgs.mkShell.override {
        # Empty shell has C compiler, make and other utils by default
	# We specify to use clang instead
        stdenv = pkgs.clangStdenv;
      } {
	packages = with pkgs; [
	  # Fixes (stdio, stdlib, ...) headers not being found
	  clang-tools
          # Packages need in the project
	  cmake
	];
      };
    });
  };
}
