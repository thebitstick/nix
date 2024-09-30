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
    ];
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    caskArgs.appdir = "/Users/thebitstick/Applications/Homebrew Apps";
    casks = [
      # macOS Background Apps (always-on)
      # "immersed" # not on Homebrew yet
      "itsycal" # no built-in multi-month calendar in macOS
      "linearmouse" # decoupling scroll direction with mouse and trackpad still not possible in macOS 15
      "maccy" # should be built-in
      "protonvpn" # work Wi-Fi sucks
      "swiftbar"

      # macOS Background Apps
      "keka" # archive utility doesn't support many formats
      "mountain-duck" # Finder FTP is only read-only

      # macOS Graphical Apps
      "android-file-transfer" # for TCL Flip 3 and Cat S22 Flip
      "discord"
      "firefox"
      "grandperspective"
      "iina"
      "keepassxc"
      "keyboardcleantool"
      "localsend"
      "musicbrainz-picard"
      "netnewswire"
      "nvidia-geforce-now"
      "openscad" # not notarized
      "playcover-community@beta"
      "prismlauncher"
      "zulu@21" # OpenJDK for prismlauncher
      "sensei"
      "steam"
      "transmission"
      "ultimaker-cura"
      "utm"
      "whisky"

      # macOS Dev Apps
      "arduino-ide"
      "playdate-mirror"
      "playdate-simulator"
      "zed"
    ];

    masApps = {
      # Apple Apps
      "Keynote" = 409183694;
      "Pages" = 409201541;
      "Numbers" = 409203825;
      "Xcode" = 497799835;
      "Apple Configurator" = 1037126344;

      # Microsoft Apps
      "Microsoft Word" = 462054704;
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft To Do" = 1274495053;
      "OneDrive" = 823766827;
      "Windows App" = 1295203466;

      # Third-Party Apps
      "DaVinci Resolve" = 571213070;
      "Canva" = 897446215;
      "LINE" = 539883307;
      "MusicBox" = 1614730313;
      "Pixen" = 525180431;
      "VIGIL Client Lite" = 1387350823;

      # Background Apps
      "Tailscale" = 1475387142;
    };
  };

  security = {
    pam.enableSudoTouchIdAuth = true;
  };

  system = {
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
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        expose-group-by-app = true;
        mineffect = "genie";
        minimize-to-application = false;
        mru-spaces = false;
        orientation = "bottom";
        show-recents = false;
        tilesize = 40;
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
  services.nix-daemon.enable = true;
  nix = {
    gc.interval.Day = 7;
    package = pkgs.nix;
  };

  system.stateVersion = 4;
}
