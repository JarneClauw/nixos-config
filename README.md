# NixOS
WIP

# Non-NixOS
WIP

# Contents of this repository
```
/profiles               (Profiles available in the flake)
    configuration.nix   (Basic NixOS system configuration)
    home.nix            (Basic Home Manager configuration)
    nix.nix             (Nix configuration)
    /nixos
    /arch

/modules                (NixOS system configurations and services)
    packages.nix        (System packages)
    sound.nix           (Sound configuration)
    xmonad.nix          (Xmonad system configuration)

/programs               (Home Manager programs)
    base.nix            (Base user packages)
    xmonad.nix          (Packages needed for xmonad)
    /<package>          (Git installation and configuration)

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
free
swap                    8 GiB       linux-swap  swap
```
