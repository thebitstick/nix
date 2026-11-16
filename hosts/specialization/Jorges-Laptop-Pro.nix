{
  pkgs,
  ...
}:

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
        show-recents = false;
        tilesize = 40;
        persistent-apps = [
          "/System/Applications/iPhone Mirroring.app"
          "/System/Applications/Apps.app"
          "/System/Applications/Calendar.app"
          "/Applications/ConsoleLink.app"
          "/Applications/Discord.app"
          "/System/Applications/FindMy.app"
          "/Applications/Fluxer.app"
          "/Applications/Ghostty.app"
          "/Applications/Hermes.app"
          "/System/Applications/Home.app"
          "/System/Applications/Journal.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Maps.app"
          "/System/Applications/Messages.app"
          "/Applications/NetNewsWire.app"
          "/System/Applications/Notes.app"
          "/System/Applications/Photos.app"
          "/System/Applications/Reminders.app"
          "/Applications/Steam.app"
          "/Applications/Zed.app"
          "/Applications/Zen.app"
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

  security.pam.services = {
    sudo_local.touchIdAuth = true;
    sudo_local.watchIdAuth = false;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    gc.interval.Day = 7;
    package = pkgs.nix;
  };

  system.stateVersion = 5;
}
