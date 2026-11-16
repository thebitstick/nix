{
  ...
}:

{
  services.nginx = {
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
}
