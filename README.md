# Layout of this repository
```
/hosts
    configuration.nix   (Basic system configuration)
    home.nix            (Basic home-manager configuration)
    /nixos              (Nixos user, specific configuration)
    /arch               (Arch user, specific configuration)

/nix                    (Package Manager configuration)
/<package>              (Package configuration)
/overlays               (Overlays for certain packages)
/shells                 (Shell environments)

packages.nix            (List of base packages)
packages_gaming.nix     (List of packages needed for gaming)

flake.nix
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

# Nix(OS)
WIP

# Arch
WIP

# Before you wipe!
1. New programs / images / scripts I want to add ?
2. Are the existing program configs up to date ?
3. Is everything pushed to the remote or atleast saved somewhere safe ?
