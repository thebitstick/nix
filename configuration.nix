{ config, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # Terminal Utilities
      android-tools
      ani-cli
      btop
      curl
      fastfetch
      ffmpeg
      file
      imagemagick
      inetutils
      neovim
      nixpkgs-fmt
      nmap
      scrcpy
      yt-dlp

      # Terminal Replacement Utilities
      bat
      du-dust
      duf
      eza
      fd

      # Programming Languages
      cargo
      rustc
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
