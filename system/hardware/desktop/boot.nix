{ self, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-3cdf3904-836c-48b6-b883-4e04f836e82f".device = "/dev/disk/by-uuid/3cdf3904-836c-48b6-b883-4e04f836e82f";
  boot.initrd.luks.devices."luks-3cdf3904-836c-48b6-b883-4e04f836e82f".keyFile = "/crypto_keyfile.bin";
}