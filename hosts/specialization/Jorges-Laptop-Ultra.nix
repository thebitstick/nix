{
  inputs,
  config,
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
    plymouth.enable = true;
  };

  networking = {
    hostName = "Jorges-Laptop-Ultra";
    networkmanager.enable = true;
  };

  users.users.thebitstick = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    description = "TheBitStick";
    shell = pkgs.nushell;
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "America/Chicago";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-console
      gnome-tour
      showtime
      xterm
      yelp
    ];

    systemPackages = with pkgs; [
      (lib.hiPrio uutils-coreutils-noprefix)
      ghostty
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "zeditor";
    };
  };

  fonts = {
    fontconfig.useEmbeddedBitmaps = true;
    fontDir.enable = true;
    packages = with pkgs; [
      corefonts
      vista-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      carlito
      dejavu_fonts
      ipafont
      kochi-substitute
      source-code-pro
      ttf_bitstream_vera
    ];
  };

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    flatpak.enable = true;
    fprintd.enable = false;
    fwupd.enable = true;
    libinput = {
      enable = true;
      touchpad.tapping = true;
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    tailscale.enable = true;
  };

  security.rtkit.enable = true;
  powerManagement.enable = true;

  nix.gc.dates = "weekly";
  system.stateVersion = "24.11";
}
