# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3d449bf6-99ba-4c02-9891-25b6683fefb3";
      fsType = "ext4";
    };

  # Setup keyfile
  boot.initrd.secrets = "/crypto_keyfile.bin" = null;

  # Enable swap on luks
  boot.initrd.luks.devices."luks-3cdf3904-836c-48b6-b883-4e04f836e82f".device = "/dev/disk/by-uuid/3cdf3904-836c-48b6-b883-4e04f836e82f";
  boot.initrd.luks.devices."luks-3cdf3904-836c-48b6-b883-4e04f836e82f".keyFile = "/crypto_keyfile.bin";

  boot.initrd.luks.devices."luks-ba9b6470-29e1-4e88-b245-5a0052254ea7".device = "/dev/disk/by-uuid/ba9b6470-29e1-4e88-b245-5a0052254ea7";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/111C-D763";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8f92729c-fdab-4f0f-b925-7d48f46321e6"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
