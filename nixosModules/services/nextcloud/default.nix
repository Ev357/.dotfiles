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
            url = "https://github.com/nextcloud-releases/theming_customcss/releases/download/v1.22.0/theming_customcss-v1.22.0.tar.gz";
            hash = "sha256-CUE7rV1yVIzRH8mogwGxuMB2Che3vRPbadTz0o3tgTE=";
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
