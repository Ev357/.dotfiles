{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.services.vaultwarden.enable {
    services.vaultwarden.config = {
      ROCKET_ADDRESS = "::1";
      ROCKET_PORT = 8222;
      SIGNUPS_ALLOWED = false;
    };

    networking.firewall.allowedTCPPorts = [
      config.services.vaultwarden.config.ROCKET_PORT
    ];
  };
}
