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

# Hosts
neso    Lenovo laptop
atlas   MSI laptop
