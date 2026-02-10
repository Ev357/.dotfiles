{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.nextcloud.enable {
    services = {
      nextcloud = {
        package = let
          nextcloud = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nextcloud32;
        in
          nextcloud
          // {
            override = args: nextcloud.override (removeAttrs args ["caBundle"]);
          };
        hostName = "nextcloud";
        config = {
          dbtype = "sqlite";
          adminpassFile = "/etc/nextcloud-admin-pass";
        };
        settings = {
          trusted_domains = [
            "nextcloud.evest.dev"
            "nextcloud.local.evest.dev"
            "nextcloud.ts.evest.dev"
            "raspberrypi"
          ];
        };
        extraApps = {
          theming_customcss = pkgs.fetchNextcloudApp {
            url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.19.0/theming_customcss.tar.gz";
            hash = "sha256-tDU6GIGX5PFr6+iBYjUl4iGcZKUmc/3MUBt5xD561uw=";
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
