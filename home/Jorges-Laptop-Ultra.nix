{ config, pkgs, ... }:

{
  imports = [ ./Home.nix ];

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
    # GNOME Extensions
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.window-is-ready-remover

    # NixOS Graphical Apps
    baobab
    celluloid
    # cura # broken python packages?
    discord
    firefox
    openscad
    transmission_4-gtk

    # NixOS Gaming Apps
    obs-studio
    prismlauncher
    tetrio-desktop
  ];

  programs = {
    nushell = {
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
        editv = "zeditor";
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
        collaboration_panel = {
          button = false;
        };
        notification_panel = {
          button = false;
        };
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        base_keymap = "VSCode";
        theme = "Ayu";
        ui_font_size = 16;
        buffer_font_size = 16;
        restore_on_startup = "last_session";
      };
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
