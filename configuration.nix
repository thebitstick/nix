{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # Terminal Utilities
      fastfetch
      btop
      inetutils
      neovim
      nmap
      curl
      file

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
  };
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
