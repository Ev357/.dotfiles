{ lib, config, pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

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
  };

  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    wayland.windowManager.hyprland = {
      package = null;
      portalPackage = null;
      systemd.enable = false;
    };

    home = {
      file.".config/hypr/hyprland/colors.conf".source = ./colors.conf;
      packages = with pkgs; [
        hyprshot
      ];
    };
  };
}
