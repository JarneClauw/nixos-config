# NixOS
Update the my flake inputs:
```
nix flake update
```
Switch to the new generation: 
```
sudo nixos-rebuild switch --flake .#<profile>
```
# Development Shells
If you want it pure, run "nix develop". "direnv" makes it impure, it loads the env.
1. Copy the template to the location.
2. Rename the template to flake.nix. Add packages if needed.
3. Add a .envrc file with content "use flake".
4. Run "direnv allow".

# Contents of this repository
```
/profiles               (Profiles available in the flake)
    configuration.nix   (Basic NixOS system configuration)
    home.nix            (Basic Home Manager configuration)
    nix.nix             (Nix configuration)
    /neso
    /atlas

/modules                (NixOS system configurations and services)
    packages.nix        (System packages)
    sound.nix           (Sound configuration)
    xmonad.nix          (Xmonad system configuration)

/programs               (Home Manager programs)
    base.nix            (Base user packages)
    xmonad.nix          (Packages needed for Xmonad)
    /<package>          (<package> installation and configuration)

/lib                    (Functions to make my life easier)

/shells                 (Shell environments)

/secrets                (Storing secrets)
```

# Disk layout
```
PARTITION NAME          SIZE        FILESYSTEM  LABEL
-----------------------------------------------------
EFI System Partition    1 GiB       fat32       esp
Nixos                   250 GiB     ext4        nixos
Arch                    250 GiB     ext4        arch
Data                    250 GiB     ext4        data
Free
Swap                    8 GiB       linux-swap  swap
```
