{
  config,
  lib,
  pkgs,
  ...
}:

{
  time.timeZone = "America/Chicago";

  environment = {
    packages = with pkgs; [
      # Base Terminal Utilities
      procps
      killall
      diffutils
      findutils
      util-linux
      tzdata
      hostname
      man
      gnugrep
      gnupg
      gnused
      gnutar
      bzip2
      gzip
      xz
      zip
      unzip
      git
      gawk
      ncurses

      # Shell
      nushell

      # uutils/coreutils
      uutils-coreutils-noprefix

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

    etcBackupExtension = ".bak";
    motd = null;

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";

      # i18n
      LANG = "en_US.UTF-8";
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      #LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      #LC_TIME = "en_US.UTF-8";
    };
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.stateVersion = "24.05";
}
