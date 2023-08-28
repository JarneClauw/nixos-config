# Layout of this repository
```
/nixos                  (Only for NixOS systems)
    configuration.nix   (Basic system configuration)
    /jarne              (NixOS user, specific configurations, can add other package groups)
/nix                    (Non-NixOS systems using Nix)
   /arch                (Nix user, specific configurations, can add other package groups)
home.nix                (Base home-manager configuration used by nixos and nix users)

/git                    (App config folders, setup.sh / home.nix / config.nix)
/zsh

packages.txt            (List of base packages)
packages_group1.txt     (List of extra packages)
packages_flatpak.txt    (Flatpaks separate)

install.sh              (Multi OS Package installer script)
flake.nix
arch.sh
```

# Nix(OS)
WIP

# Arch
WIP

# Before you wipe!
1. New programs / images / scripts I want to add ?
2. Are the existing program configs up to date ?
3. Is everything pushed to the remote or atleast saved somewhere safe ?
