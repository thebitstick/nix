{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking.networkmanager.enable = true;
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
  };

  networking = {
    firewall = {
      enable = true;
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
}