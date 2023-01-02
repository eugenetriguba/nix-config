{ inputs, system, ... }:

let
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
in
{
  laptop = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./system/hardware/laptop
      ./system/configuration.nix
    ];
  };

  desktop = nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    modules = [
      ./system/hardware/desktop
      ./system/configuration.nix
    ];
  };
}