{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking = {
    hostName = "Jorges-Laptop-Ultra";
    networkmanager.enable = true;
    firewall.enable = true;
    nameservers = [
      # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  users.users.thebitstick = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    description = "TheBitStick";
    shell = pkgs.nushell;
  };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  environment = {
    gnome.excludePackages = with pkgs.gnome; [
      gnome-calendar
      gnome-contacts
      gnome-maps
      gnome-music
      totem
      yelp
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "codium";
    };
  };

  services = {
    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "us";
      libinput = {
        enable = true;
        touchpad.tapping = true;
      };
      displayManager.gdm = {
        enable = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
    tailscale.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;
  };

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  powerManagement.enable = true;

  nix.gc.dates = "weekly";
  system.stateVersion = "23.11";
}
