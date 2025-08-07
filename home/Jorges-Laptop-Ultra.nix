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

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/map-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      left-handed = true;
      speed = 0.0;
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = true;
    };

    "org/gnome/shell" = {
      enabled-extensions = [
        # Default System Extensions
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "status-icons@gnome-shell-extensions.gcampax.github.com"

        # Home Manager Extensions
        "clipboard-indicator@tudmotu.com"
        "windowIsReady_Remover@nunofarruca@gmail.com"
      ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "firefox.desktop"
        "discord.desktop"
        "steam.desktop"
        "org.gnome.Console.desktop"
        "zed.desktop"
      ];
      last-selected-power-profile = "performance";
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
      idle-dim = false;
      sleep-inactive-ac-timeout = 7200;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
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
    ani-cli

    # Programming Languages
    cargo
    rustc

    # GNOME Extensions
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.window-is-ready-remover

    # Graphical Apps
    baobab
    celluloid
    # cura # broken python packages?
    discord
    firefox
    obs-studio
    openscad
    protonvpn-gui
    transmission_4-gtk

    # Gaming Apps
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
      $env.VISUAL = "zeditor"

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
        editv = "zeditor";
        sedit = "sudo nvim";
        edit = "nvim";
      };
    };
    zed-editor = {
      enable = true;
      extensions = [
        "html"
        "lua"
        "swift"
        "nix"
      ];
      userSettings = {
        features = {
          copilot = false;
        };
        collaboration_panel = {
          button = false;
        };
        chat_panel = {
          button = "never";
        };
        notification_panel = {
          button = false;
        };
        agent = {
          version = "2";
          enabled = false;
        };
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        outline_panel = {
          button = false;
        };
        base_keymap = "VSCode";
        theme = "Ayu Dark";
        ui_font_size = 16;
        buffer_font_size = 16;
        restore_on_startup = "last_session";
      };
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
