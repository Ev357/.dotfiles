{
  config,
  lib,
  ...
}: let
  cfg = config.programs.hyprland;
in {
  config = lib.mkIf cfg.enable (lib.mkIf cfg.withUWSM {
    programs.uwsm.waylandCompositors.hyprland.binPath = lib.mkForce "/run/current-system/sw/bin/start-hyprland";
  });
}
