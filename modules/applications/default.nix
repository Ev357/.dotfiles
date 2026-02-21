{
  lib,
  config,
  ...
}: {
  imports = [
    ./anki
    ./chromium
    ./easyeffects
    ./ghostty
    ./gnome-keyring
    ./gnome-keyring
    ./keepassxc
    ./mpv
    ./obsidian
    ./opentabletdriver
    ./other
    ./remmina
    ./teams-for-linux
    ./vesktop
    ./xdg
    ./zed-editor
    ./zen-browser
  ];

  options.modules.applications = {
    enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.modules.applications.enable {
    modules = {
      applications = {
        other.enable = lib.mkDefault true;
        mpv.enable = lib.mkDefault true;
        opentabletdriver.enable = lib.mkDefault true;
      };

      electron-flags.enable = true;
    };

    programs = {
      anki.enable = lib.mkDefault true;
      chromium.enable = lib.mkDefault true;
      ghostty.enable = lib.mkDefault true;
      zed-editor.enable = lib.mkDefault true;
      vesktop.enable = lib.mkDefault true;
      zen-browser.enable = lib.mkDefault true;
      obsidian.enable = lib.mkDefault true;
    };

    services = {
      gnome-keyring.enable = lib.mkDefault true;
      easyeffects.enable = lib.mkDefault true;
    };

    stylix.enable = true;

    xdg = {
      mimeApps.enable = true;
      autostart.enable = true;
    };
  };
}
