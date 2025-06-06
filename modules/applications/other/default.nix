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
      remmina
      fragments
      evolutionWithPlugins
      easytag
      beekeeper-studio
      session-desktop
      libreoffice-qt6-fresh
      pidgin
      dbeaver-bin
      krita
    ] ++ lib.optionals (!config.modules.applications.other.disableOpenGLApps) [
      anki-bin
    ];

    wayland.windowManager.hyprland.settings.env = [
      "ANKI_WAYLAND,1"
    ];
  };
}
