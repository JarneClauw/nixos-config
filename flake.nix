{
  description = "My 'I put way too much time in this' Flake";

  inputs = {
    # nix flake metadata github:...
    # Check if input uses nixpkgs, add .inputs.nixpkgs.follows = "nixpkgs" if needed

    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix User Repository
    nur.url = "github:nix-community/NUR";
    # Does not use nixpkgs as input (currently)

    # VSCode extensions
    # Needed unless this gets accepted: https://github.com/NixOS/nixpkgs/issues/208456
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify (Modifies Spotify)
    spicetify.url = "github:the-argus/spicetify-nix";
    spicetify.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nur,
    nix-vscode-extensions,
    spicetify
  }:
    let
      stateVersion = "23.05";
      system = "x86_64-linux";
      user = "jarne";
      repo = ".dotfiles";

      # pkgs.<package> or pkgs.unstable.<package> or pkgs.nur.<user>.<package>
      pkgs = import ./lib/pkgs.nix { inherit system nixpkgs nixpkgs-unstable nur; };

      # vscode-extensions.<vscode-marketplace|open-vsx>.<user>.<extension>
      vscode-extensions = nix-vscode-extensions.extensions.${system};

      inputs = {
        inherit stateVersion system user repo nixpkgs pkgs home-manager vscode-extensions spicetify;
      };
    in {
      nixosConfigurations = {
        neso = let
	  host = "neso";
	  inputs-mod = inputs // { inherit host; wallpaper = "bears.png"; };
	in
	  nixpkgs.lib.nixosSystem {
            inherit system;
	    specialArgs = inputs-mod;
	    modules = [
              ./profiles/config.nix
              ./profiles/neso/config.nix
	      ./profiles/neso/hardware.nix

	      home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.extraSpecialArgs = inputs-mod;
		home-manager.users.${user}.imports = [
                  ./profiles/home.nix
		  ./profiles/neso/home.nix
		];
	      }
	    ];
	  };
      };
    };
}
