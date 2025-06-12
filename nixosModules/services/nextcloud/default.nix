{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.services.nextcloud.enable {
    services.nextcloud = {
      hostName = "localhost";
      config = {
        dbtype = "sqlite";
        adminpassFile = "/etc/nextcloud-admin-pass";
      };
      settings = {
        trusted_domains = [ "nextcloud.evest.dev" ];
      };
      extraApps = {
        theming_customcss = pkgs.fetchNextcloudApp {
          url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.18.0/theming_customcss.tar.gz";
          hash = "sha256-MsF+im9yCt7bRNIE8ait0wxcVzMXsHMNbp+IIzY/zJI=";
          license = "agpl3Plus";
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 ];
  };
}
