{ lib, config, pkgs, ... }:

{
  options.modules.applications.other = {
    enable = lib.mkEnableOption "enables other applications";
    disableOpenGLApps = lib.mkEnableOption "disables OpenGL applications.";
  };

  config = lib.mkIf config.modules.applications.other.enable {
    home.packages = with pkgs; [
      nautilus
      loupe
      fragments
      easytag
      session-desktop
      libreoffice-qt6-fresh
      krita
      system-config-printer
    ] ++ lib.optionals (!config.modules.applications.other.disableOpenGLApps) [
      anki-bin
    ];

    wayland.windowManager.hyprland.settings.env = [
      "ANKI_WAYLAND,1"
    ];
  };
}
