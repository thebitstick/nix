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
        system = "aarch64-linux";
        modules = [
          ./configuration.nix
          ./hosts/hardware-configuration/Jorges-Laptop-Ultra.nix
          ./hosts/specialization/Jorges-Laptop-Ultra.nix
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
  };
}
