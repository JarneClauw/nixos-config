{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # VS Code extensions
    # See https://github.com/nix-community/nix-vscode-extensions/ on how to use it
    # Needed unless this gets accepted: https://github.com/NixOS/nixpkgs/issues/208456
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-vscode-extensions, ... }@inputs: 
    let
      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };

      user = "jarne";
      hostName = "nixos";

      vscode-extensions = nix-vscode-extensions.extensions.x86_64-linux;
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
	  specialArgs = {
            inherit inputs pkgs user hostName;
	  };
	  modules = [
	    ./hosts/configuration.nix
            ./hosts/nixos/configuration.nix
	    ./hosts/nixos/hardware-configuration.nix

	    home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.extraSpecialArgs = {
                inherit inputs pkgs user hostName vscode-extensions;
	      };
	      home-manager.users.${user} = {
                imports = [
                  ./hosts/home.nix
		  ./hosts/nixos/home.nix
		];
	      };
	    }
	  ];
	};
      };
    };
}
