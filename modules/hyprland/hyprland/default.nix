{
  lib,
  config,
  pkgs,
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

      environmentVariables = {
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

        HYPRSHOT_DIR = "$HOME/Pictures/screenshots";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        ANKI_WAYLAND = "1";
      };
    };

    xdg.configFile."hypr/hyprland/colors.conf".source = ./colors.conf;

    home.packages = with pkgs; [
      nur.repos.Ev357.hyprshot
    ];
  };
}
