{ config, lib, ... }:

{
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.anki-sync-server.enable {
    services.anki-sync-server = {
      address = "0.0.0.0";
      openFirewall = true;
      baseDirectory = "/data/anki";
      users = [
        {
          username = "evest";
          passwordFile = "/etc/anki-sync-server/evest";
        }
      ];
      environment = {
        PASSWORDS_HASHED = "1";
      };
    };

    networking.firewall.allowedTCPPorts = [
      config.services.anki-sync-server.port
    ];
  };
}
