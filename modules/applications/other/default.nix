{
  lib,
  config,
  pkgs,
  ...
}: {
  options.modules.applications.other = {
    enable = lib.mkEnableOption "enables other applications";
    disableOpenGLApps = lib.mkEnableOption "disables OpenGL applications.";
  };

  config = lib.mkIf config.modules.applications.other.enable {
    home.packages = with pkgs;
      [
        loupe
        fragments
        easytag
        session-desktop
        libreoffice-qt6-fresh
        system-config-printer
        gnome-console
        bitwarden-desktop
        dbeaver-bin
        winbox4
        localsend
        nautilus
        gimp3
        # DMCA takedown
        # nur.repos.Ev357.hayase
        nur.repos.Ev357.shiru
      ]
      ++ lib.optionals (!config.modules.applications.other.disableOpenGLApps) [
        krita
        anki-bin
        cosmic-files
      ];
  };
}
