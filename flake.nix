{
  description = ''
    Nix Configurations for
      Jorge's Laptop Pro (MacBook Pro 16", M4 Pro, running macOS 27 Golden Gate) and
      Minto (Framework 13 as a server, Ryzen, running NixOS)
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      nixos-hardware,
      home-manager,
      ...
    }:
    {
      darwinConfigurations = {
        "Jorges-Laptop-Pro" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./configuration.nix
            ./hosts/specialization/Jorges-Laptop-Pro.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.thebitstick = import ./home/Jorges-Laptop-Pro.nix;
            }
          ];
        };
      };
      nixosConfigurations = {
        "minto" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hosts/hardware-configuration/Minto.nix
            ./hosts/specialization/Minto.nix
            nixos-hardware.nixosModules.framework-13-7040-amd
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.thebitstick = import ./home/Minto.nix;
            }
          ];
        };
      };
    };
}
