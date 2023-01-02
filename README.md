# Nix Config

These is my personal WIP Nix configuration files.

## System Configs

```
$ sudo nixos-rebuild switch --flake github:eugenetriguba/nix-config#desktop
```

## Home Configs

```
$ nix build github:eugenetriguba/nix-config#homeConfigurations.eugene.activationPackage
$ ./result/activate
```