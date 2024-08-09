{ config, pkgs, ... }:

{
  networking = {
    hostName = "Jorges-Laptop-Pro";
    computerName = "Jorge’s Laptop Pro";
    localHostName = "Jorges-Laptop-Pro";
    knownNetworkServices = [
      "Wi-Fi"
      "USB 10/100/1000 LAN"
    ];
    dns = [
      # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
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
      "protonvpn" # work Wi-Fi sucks
      "raycast" # way better than spotlight sometimes
      "swiftbar"

      # macOS Background Apps
      "keka" # archive utility doesn't support many formats
      "mountain-duck" # Finder FTP is only read-only

      # macOS Graphical Apps (commercial)
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "microsoft-excel"
      "microsoft-remote-desktop"
      "microsoft-word"
      "mp3tag"

      # macOS Graphical Apps
      "firefox@nightly"
      "grandperspective"
      "iina"
      "keepassxc"
      "netnewswire"
      "nvidia-geforce-now"
      "openscad" # not notarized
      "playcover-community@beta"
      "prismlauncher"
      "zulu@21" # OpenJDK for prismlauncher
      "retroactive"
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
      #"Xcode" = 497799835;
      "Apple Configurator" = 1037126344;

      # Third-Party Apps
      "DaVinci Resolve" = 571213070;
      "MusicBox" = 1614730313;
      "VIGIL Client Lite" = 1387350823;

      # Safari Extensions
      "SponsorBlock" = 1573461917;
      "10ten Japanese Reader" = 1573540634;
      "Dark Reader for Safari" = 1438243180;
      "AdGuard for Safari" = 1440147259;

      # Background Apps
      "OneDrive" = 823766827;
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
        "com.apple.trackpad.scaling" = 0.875;
      };
      ".GlobalPreferences"."com.apple.mouse.scaling" = 0.875;

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

      trackpad = {
        Clicking = true;
        FirstClickThreshold = 2;
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
