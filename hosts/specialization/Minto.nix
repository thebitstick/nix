{
  pkgs,
  ...
}:

let
  user = "admin";
in
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
    plymouth.enable = false;
  };

  networking = {
    hostName = "Minto";
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
    networkmanager.enable = true;
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
      "docker"
    ];
    description = "Administrator";
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
    systemPackages = with pkgs; [
      (lib.hiPrio uutils-coreutils-noprefix)
      git
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  services = {
    fwupd.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };
    nginx = {
      enable = false;
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
        "www.bitstick.rip" = {
          forceSSL = true;
          enableACME = true;
          globalRedirect = "bitstick.rip";
        };
        "huicochea.moe" = {
          forceSSL = true;
          enableACME = true;
          root = "/var/www/huicochea.moe";
        };
        "www.huicochea.moe" = {
          forceSSL = true;
          enableACME = true;
          globalRedirect = "huicochea.moe";
        };
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

  security = {
    acme = {
      acceptTerms = true;
      defaults.email = "the@bitstick.rip";
      defaults.group = "nginx";
    };
    sudo-rs.enable = true;
    sudo.enable = false;
  };

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  powerManagement.enable = false;
  virtualisation.docker.enable = true;
  # users.users.nginx.extraGroups = [ "acme" ];

  nix.gc.dates = "weekly";
  system.stateVersion = "24.11";
}
