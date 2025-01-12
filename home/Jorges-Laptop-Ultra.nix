{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/map-l.svg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/map-d.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      left-handed = true;
      speed = 0.0;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/map-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      sleep-inactive-ac-timeout = 7200;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };

    "org/gnome/shell" = {
      enabled-extensions = [ "apps-menu@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "status-icons@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "firefox.desktop" "org.gnome.Console.desktop" "codium.desktop" ];
      last-selected-power-profile = "performance";
    };

    "org/gnome/shell/extensions/system-monitor" = {
      show-cpu = false;
      show-swap = false;
      show-upload = false;
    };

    "org/gnome/system/location" = {
      enabled = true;
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
