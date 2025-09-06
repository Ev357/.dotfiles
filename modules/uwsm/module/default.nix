{
  lib,
  config,
  ...
}: let
  cfg = config.modules.uwsm;
in {
  options.modules.uwsm = {
    enable = lib.mkEnableOption "enables uwsm";
    environmentVariables = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Environment variables to export in uwsm/env config file";
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."uwsm/env".text = let
      envVars = cfg.environmentVariables;
      exportLines = lib.mapAttrsToList (name: value: "export ${name}=\"${value}\"") envVars;
    in
      lib.concatStringsSep "\n" exportLines + "\n";
  };
}
