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
    meshcore-bot = {
      enable = false;
      webviewer.enable = true;
      settings = {
        Connection = {
          connection_type = "tcp";
          hostname = "0.0.0.0";
          tcp_port = "5060";
        };
        Bot = {
          bot_name = "ORD-COOK-WOLF-BOT";
          enabled = true;
          per_user_rate_limit_seconds = 10;
          per_user_rate_limit_enabled = true;
          timezone = "America/Chicago";
          bot_latitude = 41.97682;
          bot_longitude = -87.90566;
          max_channels = 40;
          advert_interval_hours = 4;
          startup_advert = "flood";
          prefix_bytes = 3;
        };
        Channels.monitor_channels = [ "bot" ];
        Admin_ACL = {
          admin_pubkeys = "0B84E765039948B5BAE90111EE83633F0141A62905DF2B7C8257E90631583970";
          admin_commands = [
            "repeater"
            "webviewer"
            "reload"
            "channelpause"
            "neighbors"
          ];
        };
        Keyboards = {
          test = "Ack @[{sender}] | {path}";
          ping = "Pong!";
          pong = "Ping!";
        };
        Prefix_Command = {
          enabled = true;
          channels = [ "#test" ];
        };
        Weather = {
          default_state = "IL";
          default_country = "US";
          temperature_unit = "fahrenheit";
          wind_speed_unit = "mph";
          precipitation_unit = "inch";
          default_city = "Chicago, IL";
        };
        Aurora_Command = {
          enabled = true;
          default_lat = 41.97682;
          default_lon = -87.90566;
          channels = [ "#weather" ];
        };
        Rain_Command = {
          enabled = true;
          default_lat = 41.97682;
          default_lon = -87.90566;
          channels = [ "#weather" ];
        };
        Channels_List = {
          # General
          public = "8B4B705B080C0D943B1C80F6B3EF6B6D";
          chat = "D0BDD6D71538138ED979EEC00D98AD97";
          emergency = "E1AD578D25108E344808F30DFDAAF926";

          # Chicagoland
          chicago = "C1C289B131E5222370CBC2048445844B";
          chimesh = "869D8AE6F43E99F7EF463027F916F1FC";

          # Regional -> Suburbia
          suburbs = "428A0416C430927E63D01A5DA35839F0";
          northburbs = "8335AC4590C5E47EFC45D0F95A433416";
          nshore = "5E4DC642EC1C7567F58E8356201DE580";
          neburbs = "17F8D36FD0C91A6008288B4326B08926";
          nwburbs = "988239D85DAC1C5F3805976B4FAE1E17";
          westburbs = "61CF1C9E7FCCC2DF4704864CCF8FE306";
          southburbs = "58CA156A0B1DABD28E7BC6F20411438C";
          swburbs = "B9AA614333E2383A86ED37AD6526E709";
          seburbs = "2A9CACE768A60A58C08EE6F759D9C114";
          farwestburbs = "80CD1DBA03CD70AC219407D31350C6C2";
          farnorthburbs = "0D2351FE272DFF112E1C0980F813424D";
          farsouthburbs = "ACE50FC831BCCD92F26C1529E3ADC4D5";

          # Regional -> Counties
          cookcounty = "0325125FE35567CC44BACF6BED8747FB";
          dupagecounty = "AB5B36AE7C50BD90DD3E444EB4D547F8";
          lakecounty = "AA0D82401F5248F1402EFAB7CFA8743E";
          mchenrycounty = "C8B00C62315FEB971CACAC033EB6BFC4B";
          willcounty = "5AC5B043654B75EF16862C62BB583AC7";
          kanecounty = "35C830C021C8267CBCAF78328A71CA13";

          # Regional -> Citywide
          downtown = "31AAFFC36782C7761C8D93DD06686510";
          loop = "D41673EB4BAE7C3955EB55928783A515";
          southloop = "6ACB46B1E07EA6056AB5B4615212872B";
          westloop = "72A79D0A6E492381CE453F075DF3A629";
          northside = "B9053B9857296C9D1DFD5F965F377A5F";
          southside = "D340BF424024085C02A4F7BC685894D2";
          westside = "5127C8D00849A07CCFEC637D2B8240F3";
          farnorthside = "713AC0D13C5D4A3B23E81C2E67C8D061";
          northwestside = "9AC489FF2888FBC97C33D6306F051FED";
          southwestside = "58EEF26BA16E46FC2E6145D380DB595D";

          # Interests
          hamradio = "83C8B01997654265938DA8765CBC7DB9";
          jokes = "ABE610D61DEE508C0AC18793C36C41C3";
          weather = "88F502554FEE92A1625CFB311546E7CB";

          # Chicago Sports
          sports = "E8EE81F3ABBF105D9BA2D2D4BD94FE4A";
          cubs = "567F84D8CD91406E7D84F962DC810522";
          whitesox = "ADEB8F2EA5CCA1624BBEB684821DC846";
          bears = "E328BD6007F137D540491E0B98C0EF49";
          bulls = "1E223BD0935A1983832435B8B876F97D";
          blackhawks = "8F84F0A243AD2854C923D154D9C7FBE5";
          sky = "CAA8572648096DF8DE3FAAFB0677F04";

          # Topical
          traffic = "93C7E543CF5A2C658DC81E9A1655400C";
          events = "12535A3F2B86D9164F1D849FEB26EA5D";
          transit = "3C1EBFB8D64AFFBCB375E6F31C5FCC48";
          tech = "9D7B23A57DE521D424B41C130CC45BCE";

          # Utility & Testing
          bot = "EB50A1BCB3E4E5D7BF69A57C9DADA211";
          test = "9CD8FCF22A47333B591D96A2B848B73F";
          healthcheck = "3AE59C2CDA86744C75E68B3975A902AE";
          wardriving = "E3C26491E9CD321E3A6BE50D57D54ACF";
        };
        Sports_Command = {
          enabled = true;
          teams = [
            "cubs"
            "whitesox"
            "bears"
            "bulls"
            "blackhawks"
            "sky"
          ];
          channel_override = [
            "#cubs=cubs"
            "#whitesox=whitesox"
            "#bears=bears"
            "#bulls=bulls"
            "#blackhawks=blackhawks"
            "#sky=sky"
          ];
          channels = [ "#sports" ];
        };
        Worldcup_Command = {
          enabled = true;
          channels = [ "#sports" ];
        };
        Stats_Command.enabled = true;
        Path_Command = {
          enabled = true;
          channels = [ "#test" ];
        };
        Joke_Command = {
          enabled = true;
          channels = [ "#jokes" ];
        };
        DadJoke_Command = {
          enabled = true;
          channels = [ "#jokes" ];
        };
        Hacker_Command.enabled = false;
        Multitest_Command = {
          enabled = true;
          channels = [ "#test" ];
        };
        Greeter_Command.enabled = false;
        Alert_Command = {
          enabled = true;
          channels = [ "#weather" ];
        };
        Announcements_Command.enabled = false;
        Airplanes_Command.enabled = true;
        Wx_Command = {
          enabled = true;
          temperature_unit = "fahrenheit";
          wind_speed_unit = "mph";
          channels = [ "#weather" ];
        };
        WebViewer_Command.enabled = true;
        Sun_Command = {
          enabled = true;
          channels = [ "#weather" ];
        };
        Solar_Command = {
          enabled = true;
          channels = [ "#weather" ];
        };
        Solarforecast_Command = {
          enabled = true;
          channels = [ "#weather" ];
        };
        Satpass_Command.enabled = true;
        Roll_Command.enabled = true;
        Repeater_Command.enabled = true;
        Ping_Command = {
          enabled = true;
          channels = [ "#test" ];
        };
        Version_Command.enabled = true;
        Moon_Command = {
          enabled = true;
          channels = [ "#weather" ];
        };
        Magic8_Command.enabled = true;
        Hfcond_Command.enabled = true;
        Help_Command.enabled = true;
        Hello_Command = {
          enabled = true;
          include_sender = true;
        };
        Dice_Command.enabled = true;
        Contact_Command.enabled = true;
        Cmd_Command.enabled = true;
        Channels_Command.enabled = true;
        Catfact_Command.enabled = true;
        Aqi_Command = {
          enabled = true;
          channels = [ "#weather" ];
        };
        Advert_Command.enabled = true;
        Neighbors_Command.enabled = true;
        Test_Command = {
          enabled = true;
          channels = [ "#test" ];
        };
        Trace_Command = {
          enabled = true;
          channels = [ "#test" ];
        };
        Feed_Manager.feed_manager_enabled = false;
        Feed_Command.enabled = false;
        PacketCapture.enabled = false;
        MapUploader.enabled = false;
        Weather_Service = {
          enabled = true;
          weather_alarm = "sunrise";
          my_position_lat = 41.97682;
          my_position_lon = -87.90566;
          weather_channel = "#weather";
          alerts_channel = "#weather";
          weather_alerts_enabled = true;
          rain_nowcast_enabled = true;
          rain_channel = "#weather";
        };
        MqttWeather.enabled = false;
        Earthquake_Service = {
          enabled = true;
          channel = [
            "#weather"
            "#emergency"
          ];
          min_magnitude = 3.0;
          minlatitude = 40.0;
          maxlatitude = 45.0;
          minlongitude = -90.0;
          maxlongitude = -85.0;
        };
        Worldcup_Service.enabled = false;
        Webhook.enabled = false;
        RepeaterPrefixCollision_Service.enabled = false;
        DiscordBridge.enabled = false;
        TelegramBridge.enabled = false;
        DARC_MoWaS_Service.enabled = false;
      };
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
    openhop-repeater = {
      enable = true;
      openFirewall = true;
      repeater = {
        name = "ORD-COOK-WOLF-RO-BIT";
        latitude = 41.9288597;
        longitude = -87.9040832;
        ownerInfo = "Bluesky: @bitstick.rip|Twitter: @thebitstick|Website: https://bitstick.rip";
        mode = "monitor";
        sendAdvertIntervalHours = 4;
        identityKeyFile = "/var/lib/openhop-secrets/identity.key";
        security = {
          adminPasswordFile = "/var/lib/openhop-secrets/adminPwd";
          guestPasswordFile = "/var/lib/openhop-secrets/guestPwd";
          jwtSecretFile = "/var/lib/openhop-secrets/jwtSecret";
        };
      };
      radio = {
        preset = "usa-canada-recommended";
        txPower = 22;
        type = "modem_usb";
        modemUsb = {
          port = "/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0";
          baudrate = 921600;
        };
      };
      mesh = {
        pathHashMode = 2;
        loopDetect = "minimal";
      };
      mqtt = {
        iataCode = "ORD";
        owner = "E8AEBA33E9054C7E427A8AC2A9517857AD782379DB9B01A464589E8ECBDB4ACE";
        brokers = [
          { preset = "chimesh"; }
          { preset = "letsmesh"; }
          { name = "Europe (LetsMesh v1)"; enabled = false; }
          { preset = "meshmapper"; }
          { preset = "waev"; }
        ];
      };
      companions."ORD-COOK-WOLF-BOT" = {
        identityKeyFile = "/var/lib/openhop-secrets/BOT.key";
        bindAddress = "0.0.0.0";
        port = 5060;
        openFirewall = false;
      };
      settings = {
        setup_completed = true;
        web.site_name = "Leyden Mesh";
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
  users.users.nginx.extraGroups = [ "acme" ];

  nix.gc.dates = "weekly";
  system.stateVersion = "24.11";
}
