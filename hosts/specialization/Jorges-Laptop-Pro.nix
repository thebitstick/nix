{ config, pkgs, ... }:

let
  user = "thebitstick";
in
{
  networking = {
    applicationFirewall = {
      enable = true;
      enableStealthMode = false;
      allowSigned = true;
      allowSignedApp = true;
    };
    hostName = "Jorges-Laptop-Pro";
    computerName = "Jorge’s Laptop Pro";
    localHostName = "Jorges-Laptop-Pro";
  };

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.nushell;
  };

  environment = {
    systemPackages = with pkgs; [
      fish
      mas
    ];
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    caskArgs.appdir = "/Users/${user}/Applications/Homebrew Apps";
    casks = [
      # Background Services
      "itsycal" # no built-in multi-month calendar in macOS
      "linearmouse" # decoupling scroll direction with mouse and trackpad still not natively possible in macOS 26
      "ollama-app"
      "bingokingo/bingokingo/soduto" # pulls from sannidhyaroy/soduto
      "syncthing-app"

      # macOS Background Apps
      "altserver"
      # "immersed" # not on Homebrew yet
      "keka"
      "mountain-duck" # Finder FTP is only read-only

      # macOS Apps
      "cog-app"
      "grandperspective"
      "iina"
      "keyboardcleantool"
      "libreoffice"
      "macpass"
      "netnewswire"
      "sensei"
      "transmission"
      "utm"
      "zen"

      # Internetslop
      "element"
      # "fluxer" # not yet available
      "musicbrainz-picard"
      "notesnook"
      "rustdesk"
      "signal"
      "zoom"

      # Googleslop
      "android-file-transfer"
      "google-drive"
      "helium-browser"

      # Gamingslop
      "crossover"
      "nvidia-geforce-now"
      "obs"
      "prismlauncher"
      "roblox"
      "sidequest"
      "steam"

      # Devslop
      "arduino-ide"
      "base"
      "crystalfetch"
      "ghostty"
      "hex-fiend"
      "playdate-mirror"
      "playdate-simulator"
      "zed"
    ];

    masApps = {
      # Appleslop
      "Keynote" = 361285480;
      "Numbers" = 361304891;
      "Pages" = 361309726;
      "Xcode" = 497799835;

      # Safari Extensions
      "Bitwarden" = 1352778147;
      "uBlock Origin Lite" = 6745342698;

      # Third-Party Apps
      "DaVinci Resolve" = 571213070;
      "ConsoleLink" = 6448843682;
      "Pixen" = 525180431;

      # Games
      "DeathStranding" = 6449748961;
      "Mini Metro" = 1047760200;
      #"Resident Evil 4" = 6462360082;
      #"Resident Evil Village" = 1640627334;

      # Background Apps
      "Tailscale" = 1475387142;
    };
  };

  system = {
    primaryUser = user;
    defaults = {
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        ApplePressAndHoldEnabled = true;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
        AppleMeasurementUnits = "Inches";
        AppleMetricUnits = 0;
        AppleTemperatureUnit = "Fahrenheit";
        AppleWindowTabbingMode = "always";
        InitialKeyRepeat = 25;
        KeyRepeat = 5;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };

      dock = {
        autohide = false;
        autohide-delay = 0.0;
        expose-group-apps = true;
        mineffect = "genie";
        minimize-to-application = false;
        mru-spaces = false;
        orientation = "bottom";
        show-recents = true;
        tilesize = 40;
        persistent-apps = [
          "/System/Applications/Calendar.app"
          "/Applications/ConsoleLink.app"
          "/System/Applications/FindMy.app"
          "/Users/${user}/Applications/Fluxer.app"
          "/Users/${user}/Applications/Homebrew Apps/Ghostty.app"
          "/Users/${user}/Applications/Homebrew Apps/Helium.app"
          "/System/Applications/Home.app"
          "/System/Applications/Journal.app"
          "/System/Applications/Mail.app"
          "/Users/${user}/Applications/Homebrew Apps/NetNewsWire.app"
          "/Users/${user}/Applications/Homebrew Apps/Notesnook.app"
          "/System/Applications/Photos.app"
          "/Users/${user}/Applications/Homebrew Apps/Zed.app"
          "/Users/${user}/Applications/Homebrew Apps/Zen.app"
        ];
        persistent-others = [
          {
            folder = {
              path = "/Applications";
              arrangement = "name";
              displayas = "stack";
              showas = "grid";
            };
          }
          {
            folder = {
              path = "/Users/${user}/Applications";
              arrangement = "name";
              displayas = "stack";
              showas = "grid";
            };
          }
          {
            folder = {
              path = "/Users/${user}/Downloads";
              arrangement = "date-created";
              displayas = "stack";
              showas = "fan";
            };
          }
        ];
      };

      finder = {
        AppleShowAllExtensions = true;
        CreateDesktop = true;
        FXPreferredViewStyle = "Nlsv";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      CustomSystemPreferences = {
        "com.apple.DiskArbitration.diskarbitrationd" = {
          DADisableEjectNotification = true;
        };
      };

      menuExtraClock.IsAnalog = true;

      spaces = {
        spans-displays = false;
      };

      screencapture = {
        disable-shadow = false;
        location = null;
        type = "png";
      };
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    gc.interval.Day = 7;
    package = pkgs.nix;
  };

  system.stateVersion = 5;
}
