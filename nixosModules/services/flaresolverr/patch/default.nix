{
  lib,
  config,
  ...
}: let
  cfg = config.services.flaresolverr;
in {
  options.services.flaresolverr = {
    settings = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Environment variables.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.flaresolverr.environment = cfg.settings;
  };
}
