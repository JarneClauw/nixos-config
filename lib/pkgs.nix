{ system, nixpkgs, nixpkgs-unstable, nur}:

let
  unstable.overlay = final: prev: {
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };
in
  import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      unstable.overlay
      nur.overlay
    ];
  }
