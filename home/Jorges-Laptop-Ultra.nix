{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
	"firefox.desktop"
        "org.gnome.Console.desktop"
        "codium.desktop"
      ];
    };
  };

  home.packages = with pkgs; [
    # Terminal Utilities
    fastfetch
    ffmpeg
    imagemagick
    nixpkgs-fmt
    yt-dlp

    # Programming Languages
    cargo
    rustc

    # Graphical Apps
    baobab
    discord
    firefox
    obs-studio
    vscodium

    # Gaming Apps
    heroic
    prismlauncher
    tetrio-desktop
  ];

  programs = {
    git = {
        enable = true;
        userName = "TheBitStick";
        userEmail = "the@bitstick.rip";
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    nushell = {
      enable = true;
      extraConfig = ''
      $env.config.show_banner = false

      $env.EDITOR = "nvim"
      $env.VISUAL = "codium"

      def clean [] {
          nix-collect-garbage -d
      }

      def gc [url] {
          cd ~/Developer/Git
          git clone $url
      }
      '';
      shellAliases = {
        cat = "bat --plain --paging=never";
        editv = "codium";
        sedit = "sudo nvim";
        edit = "nvim";
      };
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
