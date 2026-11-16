{
  ...
}:

{
  services.openhop-repeater = {
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
}
