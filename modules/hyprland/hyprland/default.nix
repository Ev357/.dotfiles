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

    home.sessionVariables = {
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_ENABLE_HIGHDPI_SCALING = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      NIXOS_OZONE_WL = "1";
      AMD_VULKAN_ICD = "RADV";

      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };

    xdg.configFile = {
      "hypr/hyprland/colors.conf".source = ./colors.conf;
      "hypr/hyprtoolkit.conf".source = ./hyprtoolkit.conf;
      "uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
    };
  };
}
