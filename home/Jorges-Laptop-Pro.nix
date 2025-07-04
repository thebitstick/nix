{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal Utilities
    android-tools
    fastfetch
    ffmpeg
    imagemagick
    nixpkgs-fmt
    scrcpy
    yt-dlp
    ani-cli

    # Programming Languages
    cargo
    rustc
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
      $env.VISUAL = "nvim"

      $env.PATH = ($env.PATH | split row (char esep) |
        prepend '/usr/local/bin' |
        prepend '/opt/homebrew/sbin' |
        prepend '/opt/homebrew/bin' |
        prepend '/nix/var/nix/profiles/default/bin' |
        prepend '/run/current-system/sw/bin' |
        prepend '/Users/thebitstick/.nix-profile/bin' |
        prepend '/Users/thebitstick/.local/bin' |
        prepend '/Users/thebitstick/Library/Python/3.9/bin' |
        prepend '/Users/thebitstick/.local/state/home-manager/gcroots/current-home/home-path/bin' |
        append '/usr/sbin' |
        append '/sbin' |
        append '/Library/Apple/usr/bin'
      )

      def up [] {
          brew update
          brew upgrade
      }

      def clean [] {
          brew cleanup --prune=all
          nix-collect-garbage -d
      }

      def gc [url] {
          cd ~/Developer/Git
          git clone $url
      }
      '';
      shellAliases = {
        mkdir = "^mkdir";
        cat = "bat --plain --paging=never";
        editv = "zed";
        sedit = "sudo nvim";
        edit = "nvim";
      };
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
