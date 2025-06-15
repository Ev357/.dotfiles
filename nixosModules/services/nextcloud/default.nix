{ config, lib, pkgs, ... }:

{
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.nextcloud.enable {
    services = {
      nextcloud = {
        hostName = "nextcloud";
        config = {
          dbtype = "sqlite";
          adminpassFile = "/etc/nextcloud-admin-pass";
        };
        settings = {
          trusted_domains = [
            "nextcloud.evest.dev"
            "nextcloud.local.evest.dev"
            "raspberrypi"
          ];
        };
        extraApps = {
          theming_customcss = pkgs.fetchNextcloudApp {
            url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.18.0/theming_customcss.tar.gz";
            hash = "sha256-MsF+im9yCt7bRNIE8ait0wxcVzMXsHMNbp+IIzY/zJI=";
            license = "agpl3Plus";
          };
        };
      };

      nginx.virtualHosts.${config.services.nextcloud.hostName} = {
        listen = [
          { addr = "0.0.0.0"; port = 3080; }
        ];
      };
    };

    networking.firewall.allowedTCPPorts = [ 3080 ];
  };
}
