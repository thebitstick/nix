{ inputs, config, pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        gfxmodeEfi = "1600x1200";
        theme = inputs.nixos-grub-themes.packages.${pkgs.system}.nixos;
      };
    };
    initrd.kernelModules = [ "amdgpu" ];
    plymouth.enable = true;
  };

  networking = {
    hostName = "Jorges-Laptop-Ultra";
    networkmanager.enable = true;
  };

  users.users.thebitstick = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    description = "TheBitStick";
    shell = pkgs.nushell;
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "America/Chicago";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      gnome-maps
      gnome-music
      gnome-software
      gnome-tour
      simple-scan
      totem
      xterm
      yelp
    ];

    systemPackages = with pkgs; [
      (pkgs.hiPrio uutils-coreutils-noprefix)
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
      vistafonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
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

  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    flatpak.enable = true;
    fprintd.enable = true;
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
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "us";
      displayManager.gdm = {
        enable = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
      videoDrivers = [ "amdgpu" ];
    };
  };

  security.rtkit.enable = true;
  powerManagement.enable = true;

  nix.gc.dates = "weekly";
  system.stateVersion = "24.11";
}
