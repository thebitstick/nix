{
  config,
  lib,
  pkgs,
  ...
}:

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
      nmap
      scrcpy
      yt-dlp

      # Terminal Replacement Utilities
      bat
      dust
      duf
      eza
      fd

      # Programming Languages
      bun
      cargo
      nil
      nixpkgs-fmt
      nixd
      rustc
      zig
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
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
