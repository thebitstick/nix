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
      "altserver"
      "alt-tab"
      "bartender"
      "choosy"
      "cleanshot"
      "deepl"
      # "immersed" # not on Homebrew yet
      "itsycal"
      "linearmouse"
      "ollama"
      "raycast"
      "reminders-menubar"
      "swiftbar"

      # macOS Background Apps
      "apparency"
      "keka"
      "microsoft-auto-update"
      "mountain-duck"
      "qlmarkdown" # not notarized
      "syntax-highlight" # not notarized

      # macOS Graphical Apps
      "arc"
      "arduino-ide"
      "audacity"
      "discord"
      "element"
      "firefox"
      "grandperspective"
      "iina"
      "keepassxc"
      "keyboardcleantool"
      "microsoft-excel"
      "microsoft-outlook"
      "microsoft-powerpoint"
      "microsoft-remote-desktop"
      "microsoft-word"
      "mochi-diffusion"
      "netnewswire"
      "obs"
      "obsidian"
      "orion"
      "openscad" # not notarized
      "prismlauncher"
      "sensei"
      "sidequest"
      "tetrio" # not notarized
      "toontown-rewritten"
      "transmission"
      "ultimaker-cura"
      "utm"
      "zed"
    ];

    masApps = {
      # Apple Apps
      "Keynote" = 409183694;
      "GarageBand" = 682658836;
      "Xcode" = 497799835;
      "Pages" = 409201541;
      "Numbers" = 409203825;
      "Apple Configurator" = 1037126344;

      # Third-Party Apps
      "PCalc" = 403504866;
      "DaVinci Resolve" = 571213070;
      "Canva" = 897446215;
      "Mini Metro" = 1047760200;
      "Plash" = 1494023538;
      "VIGIL Client Lite" = 1387350823;
      "MusicBox" = 1614730313;
      "Steam Link" = 1246969117;

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
        AppleInterfaceStyle = "Dark";
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
        show-recents = true;
        tilesize = 65;
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
