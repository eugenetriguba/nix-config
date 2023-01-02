{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot/efi";
  };

  networking = {
    hostName = "nixos-desktop";
    interfaces = {
      wlp0s20f3.useDHCP = true;
      eno1.useDHCP = true;
    };
  };
}