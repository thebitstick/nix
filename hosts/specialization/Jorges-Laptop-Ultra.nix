{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.kernelModules = [ "amdgpu" ];
    plymouth.enable = true;
  };

  networking = {
    hostName = "Jorges-Laptop-Ultra";
    networkmanager.enable = true;
    firewall.enable = true;
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
      evince
      geary
      gnome-calendar
      gnome-characters
      gnome-clocks
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-tour
      gnome-weather
      simple-scan
      totem
      xterm
      yelp
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "codium";
    };
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
    resolved = {
      enable = true;
      extraConfig = "
      DNS=45.90.28.0#Jorges-Laptop-Ultra-73952a.dns.nextdns.io
      DNS=2a07:a8c0::#Jorges-Laptop-Ultra-73952a.dns.nextdns.io
      DNS=45.90.30.0#Jorges-Laptop-Ultra-73952a.dns.nextdns.io
      DNS=2a07:a8c1::#Jorges-Laptop-Ultra-73952a.dns.nextdns.io
      DNSOverTLS=yes
      ";
    };
    spice-vdagentd.enable = true;
    #tailscale.enable = true;
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
