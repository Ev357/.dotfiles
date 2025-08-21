{
  lib,
  config,
  ...
}: let
  cfg = config.wayland.windowManager.hyprland;
in {
  options.wayland.windowManager.hyprland = {
    mainMonitorName = lib.mkOption {
      type = lib.types.str;
      default = "eDP-1";
      description = "The name of the main monitor.";
    };
    mainMonitorScaling = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "The scaling of the main monitor.";
    };
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

    nixpkgs.overlays = [
      (final: prev: {
        hyprshot = prev.hyprshot.overrideAttrs {
          src = prev.fetchFromGitHub {
            owner = "Gustash";
            repo = "hyprshot";
            rev = "f95068db7765b85a2bbae0f083e29074d7bee027";
            hash = "sha256-9vsBNe6qTvbw2rgf1y5MIxN1eZzdCtimMvEXF8M36cQ=";
          };
        };
      })
    ];
  };
}
