{ config, pkgs, ... }:

{
  boot.loader = {
    grub.enable = false;
    generic-extlinux-compatible.enable = true;
  };

  networking = {
    hostName = "pomu";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
    };
    nameservers = [
      # Cloudflare DNS
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
  };

  users.users.admin = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      description = "Administrator";
      shell = pkgs.nushell;
    };

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  environment = {
    systemPackages = with pkgs; [
      git
      mcrcon
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  services = {
    nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts = {
        "bitstick.rip" = {
          forceSSL = true;
          enableACME = true;
          root = "/var/www/bitstick.rip";
        };
        "huicochea.moe" = {
          forceSSL = true;
          enableACME = true;
          root = "/var/www/huicochea.moe";
        };
        "whitehouse.rip" = {
          forceSSL = true;
          enableACME = true;
          root = "/var/www/whitehouse.rip";
        };
        "www.bitstick.rip" = {
          forceSSL = true;
          enableACME = true;
          globalRedirect = "bitstick.rip";
        };
        "www.huicochea.moe" = {
          forceSSL = true;
          enableACME = true;
          globalRedirect = "huicochea.moe";
        };
        "www.whitehouse.rip" = {
          forceSSL = true;
          enableACME = true;
          globalRedirect = "whitehouse.rip";
        };
      };
    };
    minecraft-server = {
      enable = true;
      eula = true;
      openFirewall = true;

      serverProperties = {
        server-port = 25565;
        gamemode = "survival";
        motd = "\\u00a7l\\u00a7o\\u00a7nDeclarative Server\\u00a7r\\u00a7l\\u00a7n powered by NixOS";
        max-players = 5;
        level-seed = "nixos";
        enable-rcon = true;
        "rcon.password" = "nixos";
      };
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "the@bitstick.rip";
    defaults.group = "nginx";
  };

  users.users.nginx.extraGroups = [ "acme" ];

  nix.gc.dates = "weekly";
  system.stateVersion = "24.11";
}
