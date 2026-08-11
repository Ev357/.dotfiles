{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.nextcloud.enable {
    services = {
      nextcloud = {
        extraApps = {
          theming_customcss = pkgs.fetchNextcloudApp {
            url = "https://github.com/nextcloud-releases/theming_customcss/releases/download/v1.21.0/theming_customcss-v1.21.0.tar.gz";
            hash = "sha256-gJcQJv0tD7lykS+26cLr5zlujJjajNqITWmTv0ki2T0=";
            license = "agpl3Plus";
          };
        };
      };

      nginx.virtualHosts.${config.services.nextcloud.hostName} = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 3080;
          }
        ];
      };
    };

    networking.firewall.allowedTCPPorts = [3080];
  };
}
