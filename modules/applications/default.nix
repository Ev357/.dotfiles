{ lib, config, ... }:

{
  imports = [
    ./ghostty
    ./keepassxc
    ./mpv
    ./rofi
    ./zed-editor
    ./other
    ./zen-browser
    ./teams-fox-linux
    ./vesktop
    ./opentabletdriver
    ./obsidian
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
        teams-fox-linux.enable = lib.mkDefault true;
      };

      electron-flags.enable = true;
    };
    programs = {
      ghostty.enable = lib.mkDefault true;
      rofi.enable = lib.mkDefault true;
      keepassxc.enable = lib.mkDefault true;
      zed-editor.enable = lib.mkDefault true;
      vesktop.enable = lib.mkDefault true;
      zen-browser.enable = lib.mkDefault true;
      obsidian.enable = lib.mkDefault true;
    };

    stylix.enable = true;

    services.gnome-keyring = {
      enable = lib.mkDefault true;
      components = [ "secrets" ];
    };
  };
}
