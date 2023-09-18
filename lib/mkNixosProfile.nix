###
### Function to make a nixos profile
###

{ host, system, inputs }: let
  inputs' = import ./inputs.nix (inputs // { inherit host system; });
in {
  nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = inputs';
    modules = [
      (./. + "/../nixos/${host}.nix")
      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;
	home-manager.extraSpecialArgs = inputs';
	home-manager.users.${inputs.user} = {
	  imports = [
            (./. + "/../home/${host}.nix")
	  ];
	  home.username = "${inputs.user}";
	  home.homeDirectory = "${inputs.home}";
	  home.stateVersion = "${inputs.stateVersion}";
	};
      }
    ];
  };
}
