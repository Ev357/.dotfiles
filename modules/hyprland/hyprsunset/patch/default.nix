{ config, lib, pkgs, ... }:

let
  cfg = config.services.hyprsunset;
in
{
  disabledModules = [ "services/hyprsunset.nix" ];

  options.services.hyprsunset = {
    enable = lib.mkEnableOption "Hyprsunset, Hyprland's blue-light filter";
    extraArgs = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Additional command-line arguments to pass to `hyprsunset`.";
    };
    transitions = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            calendar = lib.mkOption {
              type = lib.types.str;
              description = "Systemd calendar expression for when to run this transition.";
            };

            requests = lib.mkOption {
              type = lib.types.listOf (lib.types.listOf lib.types.str);
              default = [ ];
              description = "List of requests to pass to `hyprctl hyprsunset` for this transition. Each inner list represents a separate command.";
            };
          };
        }
      );
      default = { };
      description = "Set of transitions for different times of day (e.g., sunrise, sunset)";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user =
      let
        transitionServices = lib.mapAttrs'
          (
            name: transitionCfg:
              lib.nameValuePair "hyprsunset-${name}" {
                Install = { };

                Unit = {
                  ConditionEnvironment = "WAYLAND_DISPLAY";
                  Description = "hyprsunset transition for ${name}";
                  After = [ "hyprsunset.service" ];
                  Requires = [ "hyprsunset.service" ];
                };

                Service = {
                  Type = "oneshot";
                  ExecStart = lib.concatMapStringsSep " && "
                    (
                      cmd:
                      "${lib.getExe' pkgs.hyprland "hyprctl"} hyprsunset ${lib.escapeShellArgs cmd}"
                    )
                    transitionCfg.requests;
                };
              }
          )
          cfg.transitions;
      in
      {
        services = {
          hyprsunset = {
            Install = {
              WantedBy = [ config.wayland.systemd.target ];
            };

            Unit = {
              ConditionEnvironment = "WAYLAND_DISPLAY";
              Description = "hyprsunset - Hyprland's blue-light filter";
              After = [ config.wayland.systemd.target ];
              PartOf = [ config.wayland.systemd.target ];
            };

            Service = {
              ExecStart = "${lib.getExe pkgs.hyprsunset} ${lib.escapeShellArgs cfg.extraArgs}";
              Restart = "always";
              RestartSec = "10";
            };
          };
        } // transitionServices;

        timers = lib.mapAttrs'
          (
            name: transitionCfg:
              lib.nameValuePair "hyprsunset-${name}" {
                Install = {
                  WantedBy = [ config.wayland.systemd.target ];
                };

                Unit = {
                  Description = "Timer for hyprsunset transition (${name})";
                };

                Timer = {
                  OnCalendar = transitionCfg.calendar;
                  Persistent = true;
                };
              }
          )
          cfg.transitions;
      };
  };
}
