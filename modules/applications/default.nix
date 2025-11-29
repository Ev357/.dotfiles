{
  lib,
  config,
  ...
}: {
  imports = [
    ./chromium
    ./easyeffects
    ./ghostty
    ./gnome-keyring
    ./mpv
    ./obsidian
    ./opentabletdriver
    ./other
    ./rofi
    ./vesktop
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
      chromium.enable = lib.mkDefault true;
      ghostty.enable = lib.mkDefault true;
      rofi.enable = lib.mkDefault true;
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
  };
}
