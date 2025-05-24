{
  description = ''
    Nix Configurations for
      Jorge's Laptop Pro (MacBook Pro 14),
      Jorge's Laptop Ultra (imaginary Linux laptop)
      Jorge's Gaming Machine (Framework 13) and
      Pomu (my Linux RockPro64 server)
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, darwin, home-manager, ... }: {
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
      "Jorges-Gaming-Machine" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./hosts/hardware-configuration/Jorges-Gaming-Machine.nix
          ./hosts/specialization/Jorges-Gaming-Machine.nix
          nixos-hardware.nixosModules.framework-13-7040-amd
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.thebitstick = import ./home/Jorges-Gaming-Machine.nix;
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
