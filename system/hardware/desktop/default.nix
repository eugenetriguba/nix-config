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
    hostName = "desktop";
    interfaces = {
      wlp0s20f3.useDHCP = true;
      eno1.useDHCP = true;
    };
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-3cdf3904-836c-48b6-b883-4e04f836e82f".device = "/dev/disk/by-uuid/3cdf3904-836c-48b6-b883-4e04f836e82f";
  boot.initrd.luks.devices."luks-3cdf3904-836c-48b6-b883-4e04f836e82f".keyFile = "/crypto_keyfile.bin";

}
