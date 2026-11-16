{
  ...
}:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [
        "--force-cleanup"
      ];
    };

    brews = [
      # Innioasis Updater dependencies
      "python@3.13"
      "libusb"
      "openssl"
      "libffi"
      "rust"
      "cmake"
      "pkg-config"

      # MiniDisc project dependencies
      "keystone"
      "libusb"
      "cmake"
      "ffmpeg"

      "mole" # SnazzyLabs recommendation
    ];

    casks = [
      # macOS Background Services
      "itsycal" # no built-in multi-month calendar in macOS
      "linearmouse" # decoupling scroll direction with mouse and trackpad still not natively possible in macOS 27
      "nextdns-app"
      "rustdesk"

      # macOS Utilities
      "crystalfetch"
      "grandperspective"
      "iloader"
      # "immersed" # not on Homebrew yet
      "keyboardcleantool"
      "macpacker"
      "macusb"
      "mountain-duck" # Finder FTP is only read-only

      # macOS Apps
      "cog-app"
      "crossover"
      "discord"
      "element"
      # "fluxer" # not yet available
      "helium-browser"
      "iina"
      "libreoffice"
      "macpass"
      "musicbrainz-picard"
      "netnewswire"
      "obs"
      "prismlauncher"
      "roblox"
      "sensei"
      "sidequest"
      "signal"
      "steam"
      "transmission"
      "ultimaker-cura"
      "utm"
      "zen"
      "zoom"

      # macOS Development Tools
      "android-platform-tools"
      "arduino-ide"
      "base"
      "ghostty"
      "hermes-desktop"
      "hex-fiend"
      "ollama-app"
      "openmtp"
      "playdate-mirror"
      "playdate-simulator"
      "zed"
    ];

    masApps = {
      # iWork
      "Keynote" = 361285480;
      "Numbers" = 361304891;
      "Pages" = 361309726;
      "Xcode" = 497799835;

      # Safari Extensions
      "10ten Japanese Reader" = 1573540634;
      "Bitwarden" = 1352778147;
      "Consent-O-Matic" = 1606897889;
      "Dark Reader for Safari" = 1438243180;
      "SponsorBlock" = 1573461917;
      "uBlock Origin Lite" = 6745342698;

      # Background Apps
      "Tailscale" = 1475387142;

      # Apps
      "DaVinci Resolve" = 571213070;
      "ConsoleLink" = 6448843682;
      "Mactracker" = 430255202;
      "Pixen" = 525180431;

      # Games
      "DeathStranding" = 6449748961;
      "Mini Metro" = 1047760200;
      #"Resident Evil 4" = 6462360082;
      #"Resident Evil Village" = 1640627334;
    };
  };
}
