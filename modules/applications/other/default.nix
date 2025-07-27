{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.modules.applications.other = {
    enable = lib.mkEnableOption "enables other applications";
    disableOpenGLApps = lib.mkEnableOption "disables OpenGL applications.";
  };

  config = lib.mkIf config.modules.applications.other.enable {
    home.packages =
      with pkgs;
      [
        cosmic-files
        loupe
        fragments
        easytag
        session-desktop
        libreoffice-qt6-fresh
        system-config-printer
        bitwarden-desktop
      ]
      ++ lib.optionals (!config.modules.applications.other.disableOpenGLApps) [
        krita
        anki-bin
      ];
  };
}
