{ config, pkgs, ... }:

{
  networking = {
    hostName = "Jorges-Laptop-Pro";
    computerName = "Jorge’s Laptop Pro";
    localHostName = "Jorges-Laptop-Pro";
  };

  users.users.thebitstick = {
    home = "/Users/thebitstick";
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
    onActivation.cleanup = "uninstall";
    caskArgs.appdir = "/Users/thebitstick/Applications/Homebrew Apps";
    casks = [
      # macOS Background Apps (always-on)
      "itsycal" # no built-in multi-month calendar in macOS
      "linearmouse" # decoupling scroll direction with mouse and trackpad still not possible in macOS 26
      "protonvpn" # work Wi-Fi sucks

      # macOS Background Apps
      "altserver"
      # 'immersed' # not on Homebrew yet
      "keka" # Archive Utility isn't very good
      "mountain-duck" # Finder FTP is only read-only

      # macOS Graphical Apps
      "arc"
      "crossover"
      "discord"
      "grandperspective"
      "iina"
      "keyboardcleantool"
      "macpass"
      "musicbrainz-picard"
      "netnewswire"
      "nvidia-geforce-now"
      "obs"
      "openscad" # not notarized
      "orion"
      "prismlauncher"
      "sensei"
      "transmission"
      "ultimaker-cura"
      "zen"

      # macOS Dev Apps
      "arduino-ide"
      "playdate-mirror"
      "playdate-simulator"
      "zed"
    ];

    masApps = {
      # Apple Apps
      "Apple Configurator" = 1037126344;
      "iMovie" = 408981434;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Xcode" = 497799835;

      # Safari Extensions
      "Bitwarden" = 1352778147;

      # Microsoft Apps
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft To Do" = 1274495053;
      "Microsoft Word" = 462054704;
      "OneDrive" = 823766827;
      "Windows App" = 1295203466;

      # Third-Party Apps
      "DaVinci Resolve" = 571213070;
      "Canva" = 897446215;
      "ConsoleLink" = 6448843682;
      "Pixen" = 525180431;
      "Steam Link" = 1246969117;
      "VIGIL Client Lite" = 1387350823;

      # Background Apps
      "Tailscale" = 1475387142;
    };
  };

  system = {
    primaryUser = "thebitstick";
    defaults = {
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        ApplePressAndHoldEnabled = true;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleTemperatureUnit = "Celsius";
        AppleWindowTabbingMode = "always";
        InitialKeyRepeat = 25;
        KeyRepeat = 5;
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
	  "/System/Applications/Apps.app"

	  # Work
          "/Applications/Canva.app"
          "/Applications/Microsoft Outlook.app"
          "/Applications/Microsoft To Do.app"
          "/Applications/VIGIL Client Lite.app"

	  # Main
	  "/Users/thebitstick/Applications/Homebrew Apps/Arc.app"
          "/System/Applications/Calendar.app"
	  "/Applications/ConsoleLink.app"
          "/Users/thebitstick/Applications/Homebrew Apps/Discord.app"
          "/System/Applications/FindMy.app"
          "/System/Applications/Home.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Messages.app"
          "/Users/thebitstick/Applications/Homebrew Apps/NetNewsWire.app"
          "/System/Applications/Notes.app"
          "/System/Applications/Photos.app"
          "/System/Applications/Reminders.app"
          "/System/Applications/Utilities/Terminal.app"
	  "/Users/thebitstick/Applications/Homebrew Apps/Zen.app"
        ];
      };

      finder = {
        AppleShowAllExtensions = true;
        CreateDesktop = true;
        FXPreferredViewStyle = "clmv";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
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

  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    gc.interval.Day = 7;
    package = pkgs.nix;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.stateVersion = 4;
}
