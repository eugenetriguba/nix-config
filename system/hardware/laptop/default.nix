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

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-e1a9bf3f-7b6b-4075-962f-225f1336d300".device = "/dev/disk/by-uuid/e1a9bf3f-7b6b-4075-962f-225f1336d300";
  boot.initrd.luks.devices."luks-e1a9bf3f-7b6b-4075-962f-225f1336d300".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos-laptop";
  networking.interfaces.wlp114s0.useDHCP = true;
}
