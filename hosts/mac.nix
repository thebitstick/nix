{ config, pkgs, ... }:

{
  networking = {
    computerName = "Jorge’s Laptop Pro";
    localHostName = "Jorges-Laptop-Pro";
    knownNetworkServices = [
      "Wi-Fi"
      "USB 10/100/1000 LAN"
    ];
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
      "rewind"
      "swiftbar"
      "tailscale"

      # macOS Background Apps
      "apparency"
      "keka"
      "microsoft-auto-update"
      "mountain-duck"
      "qlmarkdown"
      "syntax-highlight"

      # macOS Graphical Apps
      "arc"
      "arduino-ide"
      "audacity"
      "clone-hero"
      "discord"
      "firefox"
      "grandperspective"
      "iina"
      "iterm2"
      "keyboardcleantool"
      "macpass"
      "microsoft-excel"
      "microsoft-outlook"
      "microsoft-powerpoint"
      "microsoft-remote-desktop"
      "microsoft-word"
      "mochi-diffusion"
      "netnewswire"
      "obs"
      "obsidian"
      "openscad"
      "prismlauncher"
      "sensei"
      "sidequest"
      "tetrio"
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
      "Disk Speed Test" = 425264550;
      "PCalc" = 403504866;
      "DaVinci Resolve" = 571213070;
      "Canva" = 897446215;
      "Speedtest" = 1153157709;
      "Mini Metro" = 1047760200;
      "Plash" = 1494023538;
      "VIGIL Client Lite" = 1387350823;
      "MusicBox" = 1614730313;
      "Steam Link" = 1246969117;

      # Background Apps
      "OneDrive" = 823766827;
      "WaterMinder" = 1415257369;

      # Safari Extensions
      "StreetPass for Mastodon" = 6446224821;
      "SponsorBlock" = 1573461917;
      "10ten Japanese Reader" = 1573540634;
      "Consent-O-Matic" = 1606897889;
      "Mapper" = 1589391989;
      "Tampermonkey" = 1482490089;
      "Dark Reader for Safari" = 1438243180;
      "Bitwarden" = 1352778147;
      "AdGuard for Safari" = 1440147259;
      "Baking Soda" = 1601151613;
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
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Fahrenheit"; # I'm so sorry
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
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "bottom";
        show-recents = false;
        tilesize = 65;
      };

      finder = {
        AppleShowAllExtensions = true;
        CreateDesktop = true;
        FXPreferredViewStyle = "clmv";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = true;
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
}
