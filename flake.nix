{
  description = "Personal NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    let system = "x86_64-linux"; in
    {
      homeConfigurations = (
        import ./home-conf.nix {
          inherit inputs system;
        }
      );

      nixosConfigurations = (
        import ./system-conf.nix {
          inherit inputs system;
        }
      );
    };
}
