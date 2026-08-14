{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.tdarr;
in {
  options.services.tdarr = {
    extraReadWritePaths = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };

    npmCacheDir = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services = let
      enabledNodes = lib.filterAttrs (_: nodeCfg: nodeCfg.enable) cfg.nodes;
    in
      {
        tdarr-server = lib.mkIf cfg.server.enable {
          serviceConfig.ReadWritePaths = cfg.extraReadWritePaths;
        };
      }
      // lib.mapAttrs' (
        nodeId: nodeCfg:
          lib.nameValuePair "tdarr-node-${nodeId}" {
            path = [pkgs.nodejs];

            serviceConfig = {
              ReadWritePaths = cfg.extraReadWritePaths;
              ProtectSystem = lib.mkForce false;
              ProtectHome = lib.mkForce false;
              PrivateTmp = lib.mkForce false;
              NoNewPrivileges = lib.mkForce false;
            };

            environment = lib.mkIf (cfg.npmCacheDir != null) {
              npm_config_cache = cfg.npmCacheDir;
              HOME = cfg.npmCacheDir;
            };
          }
      )
      enabledNodes;
  };
}
