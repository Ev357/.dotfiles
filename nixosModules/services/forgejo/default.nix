{ config, lib, ... }:

let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in
{
  config = lib.mkIf config.services.forgejo.enable {
    services.forgejo = {
      database.type = "postgres";
      lfs.enable = true;
      settings = {
        server = {
          DOMAIN = "git.ts.evest.dev";
          ROOT_URL = "https://${srv.DOMAIN}/";
          HTTP_PORT = 3081;
        };
        service.DISABLE_REGISTRATION = true;
        actions = {
          ENABLED = true;
          DEFAULT_ACTIONS_URL = "github";
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ srv.HTTP_PORT ];
  };
}
