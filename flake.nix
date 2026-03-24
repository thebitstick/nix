{
  description = ''
    Nix Configurations for
      Jorge's Laptop Pro (MacBook Pro 16" M4 Pro running macOS 26 Tahoe),
      Jorge's Laptop Ultra (Framework 13 AMD running NixOS),
      Jorge's Fold Pro (Google Pixel 10 Pro Fold running Nix-on-Droid) and
      Pomu (my Linux RockPro64 server)
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos.url = "github:NixOS/nixpkgs/nixos-unstable"; # not sure if this works
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nix-on-droid.url = "github:nix-community/nix-on-droid/release-24.05";
    nix-on-droid.inputs.nixos.follows = "nixpkgs"; # not sure if this works

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      darwin,
      nixos-hardware,
      nix-on-droid,
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
        "Jorges-Laptop-Ultra" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hosts/hardware-configuration/Jorges-Laptop-Ultra.nix
            ./hosts/specialization/Jorges-Laptop-Ultra.nix
            nixos-hardware.nixosModules.framework-13-7040-amd
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.thebitstick = import ./home/Jorges-Laptop-Ultra.nix;
            }
          ];
        };
        "pomu" = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./configuration.nix
            ./hosts/hardware-configuration/Pomu.nix
            ./hosts/specialization/Pomu.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.admin = import ./home/Pomu.nix;
            }
          ];
        };
      };
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          ./hosts/specialization/Jorges-Fold-Pro.nix
        ];
      };
    };
}
