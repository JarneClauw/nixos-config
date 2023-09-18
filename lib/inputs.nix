###
### Function to modify the inputs
###

inputs: inputs // {
  pkgs = import ./pkgs.nix {
    system = inputs.system;
    stable = inputs.nixpkgs;
    unstable = inputs.nixpkgs-unstable;
    nur = inputs.nur;
  };

  vscode-extensions = inputs.nix-vscode-extensions.extensions.${inputs.system};
}
