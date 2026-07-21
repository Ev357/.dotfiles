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
            url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.20.0/theming_customcss.tar.gz";
            hash = "sha256-Fgu31s+K4MFUgvNe9mAVHi9C0iJnv40v1onUMk+lFZk=";
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
