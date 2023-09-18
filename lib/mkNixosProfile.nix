###
### Function to make a nixos profile
###

{ host, system, user, home, repo, data, inputs, stateVersion }: let
  inputs' = import ./inputs.nix (inputs // {
    inherit host system user home repo data stateVersion;
  });
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
	home-manager.users.${user} = {
	  imports = [
            (./. + "/../home/${host}.nix")
	  ];
	  home.username = "${user}";
	  home.homeDirectory = "${home}";
	  home.stateVersion = "${stateVersion}";
	};
      }
    ];
  };
}
