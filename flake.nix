{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager }: 
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
	config.allowUnfree = true;
      };

      user = "jarne";
      hostName = "nixos";
    in {
      ###
      ### All NixOS profiles
      ###
      nixosConfigurations = {
        jarne = nixpkgs.lib.nixosSystem {
          inherit system;
	  specialArgs = {
            inherit inputs pkgs user hostName;
	  };
	  modules = [
	    ./nixos/configuration.nix
            ./nixos/jarne

	    home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.extraSpecialArgs = {
                inherit pkgs user hostName;
	      };
	      home-manager.users.${user} = {
                imports = [
                  ./nixos/home.nix
		  ./nixos/jarne/home.nix
		];
	      };
	    }
	  ];
	};
      };
    };
}
