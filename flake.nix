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

    # Sops-nix handles secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = inputs: let
    user = "jarne";
    home = "/home/${user}";
    repo = "${home}/setup";
    data = "/media/data";
    stateVersion = "23.05";
    
    inputs' = inputs // { inherit user home repo data stateVersion; };
  in
    import ./lib/mkNixosProfile.nix { host = "neso"; system = "x86_64-linux"; inputs = inputs'; };
}
