{ system, stable, unstable, nur}:

let
  unstable-overlay = final: prev: {
    unstable = import unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };
in
  import stable {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      unstable-overlay
      nur.overlay
    ];
  }
