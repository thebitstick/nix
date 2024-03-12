{
  description = ''
    Nix Configurations for
      Jorge's Laptop Pro (MacBook Pro),
      Jorge's Laptop Ultra (my imaginary Linux laptop) and
      Pomu (my Linux RockPro64 server)
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = {
      "Jorges-Laptop-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./configuration/mac-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.thebitstick = import ./home/mac-home.nix;
          }
        ];
      };
    };
    nixosConfigurations = {
      "Jorges-Laptop-Ultra" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./configuration/ultra-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.thebitstick = import ./home/ultra-home.nix;
          }
        ];
      };
      "pomu" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./configuration/pomu-configuration.nix
    	  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.admin = import ./home/pomu-home.nix;
          }
        ];
      };
    };
  };
}
