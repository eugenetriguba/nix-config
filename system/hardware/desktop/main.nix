{ self, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./boot.nix
    ];
}