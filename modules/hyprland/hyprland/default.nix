{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.wayland.windowManager.hyprland;
in {
  imports = [
    ./patch
    ./settings.nix
  ];

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      package = null;
      portalPackage = null;
      systemd.enable = false;
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
      ];
    };

    modules.uwsm.enable = true;

    xdg.configFile = {
      "hypr/hyprland/colors.conf".source = ./colors.conf;
      "hypr/hyprtoolkit.conf".source = ./hyprtoolkit.conf;
    };
  };
}
