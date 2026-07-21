{
  config,
  lib,
  ...
}: let
  cfg = config.services.anki-sync-server;
in {
  options.services.anki-sync-server = {
    environment = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Additional environment variables.";
    };
    group = lib.mkOption {
      type = lib.types.str;
      default = "anki";
      description = "The group anki sync server should run as.";
    };
  };

  config = lib.mkIf config.services.anki-sync-server.enable {
    systemd.services.anki-sync-server = {
      serviceConfig = {
        User = "anki";
        DynamicUser = lib.mkForce false;
      };
      environment = cfg.environment;
    };

    users.users."anki" = {
      isSystemUser = true;
      group = cfg.group;
    };
  };
}
