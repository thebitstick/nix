{ config, lib, pkgs, ... }:

{
  imports = [
    ../hosts/specialization/Jorges-Laptop-Pro.nix
  ];

  networking = {
    hostName = "Jorges-Laptop-Pro";
    dns = [
      # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  users.users.thebitstick = {
    home = "/Users/thebitstick";
    shell = pkgs.nushell;
  };

  environment = {
    systemPackages = with pkgs; [
      # Terminal Utilities
      btop
      inetutils
      neovim
      nmap
      wget

      # Terminal Replacement Utilities
      bat
      du-dust
      duf
      eza
      fd
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
  services.nix-daemon.enable = true;
  nix = {
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
    package = pkgs.nix;
  };
  system.stateVersion = 4;
}
