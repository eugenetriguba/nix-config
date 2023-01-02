{ inputs, system, ... }:

with inputs;

let
  pkgs = import nixpkgs {
    inherit system;

    config.allowUnfree = true;
  };

  imports = [
    ./home
  ];

  mkHome = (
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [{ inherit imports; }];
    }
  );
in
{
  eugene = mkHome;
}