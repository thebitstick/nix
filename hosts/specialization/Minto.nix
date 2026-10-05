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
    hostName = "minto";
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

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
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
    openhop-repeater = {
      enable = true;
      openFirewall = true; # dashboard on 8000; reachable on the LAN and Tailscale only (no port forwarding)

      # ChiMesh's openHop guide: 910.525 MHz/62.5 kHz/SF7/CR5/22 dBm, 3-byte path hashes,
      # 4 h advert interval, minimal loop detection, MQTT to LetsMesh + ChiMesh (ORD)
      chicagolandMesh.enable = true;

      repeater = {
        name = "ORD-COOK-WOLF-RO-BIT";
        latitude = 41.9288597;
        longitude = -87.9040832;
        ownerInfo = "Bluesky: @bitstick.rip|Twitter: @thebitstick|Website: https://bitstick.rip";
        mode = "monitor";
        identityKeyFile = "/var/lib/openhop-secrets/identity.key";
        security = {
          adminPasswordFile = "/var/lib/openhop-secrets/admin";
          guestPasswordFile = "/var/lib/openhop-secrets/guest";
          jwtSecretFile = "/var/lib/openhop-secrets/jwt";
        };
      };

      radio = {
        type = "modem_usb";
        modemUsb = {
          port = "/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0";
          baudrate = 921600;
        };
      };

      companions."TheBitStick 🐧" = {
        identityKeyFile = "/var/lib/openhop-secrets/companion-key";
        bindAddress = "0.0.0.0";
        port = 5050;
        openFirewall = true;
      };

      settings = {
        setup_completed = true;
        web.site_name = "Leyden Mesh";
        # Public key of the companion, links the observer to it on the analyzers
        mqtt_brokers.owner = "E8AEBA33E9054C7E427A8AC2A9517857AD782379DB9B01A464589E8ECBDB4ACE";
      };
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
  users.users.nginx.extraGroups = [ "acme" ];

  nix.gc.dates = "weekly";
  system.stateVersion = "24.11";
}
