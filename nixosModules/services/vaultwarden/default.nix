{ config, lib, ... }:

{
  config = lib.mkIf config.services.vaultwarden.enable {
    networking.firewall.allowedTCPPorts = [ 8222 ];

    services.vaultwarden.config = {
      ROCKET_ADDRESS = "::1";
      ROCKET_PORT = 8222;
      SIGNUPS_ALLOWED = false;
    };
  };
}
