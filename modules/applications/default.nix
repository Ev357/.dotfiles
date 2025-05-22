{ lib, config, ... }:

{
  imports = [
    ./general
    ./ghostty
    ./mpv
    ./rofi
    ./zed-editor
    ./zen-browser
    ./opentabletdriver
  ];

  options.modules.applications = {
    enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.modules.applications.enable {
    modules = {
      applications = {
        general.enable = lib.mkDefault true;
        mpv.enable = lib.mkDefault true;
        opentabletdriver.enable = lib.mkDefault true;
      };

      electron-flags.enable = true;
    };
    programs = {
      ghostty.enable = lib.mkDefault true;
      rofi.enable = lib.mkDefault true;
      zed-editor.enable = lib.mkDefault true;
      zen-browser.enable = lib.mkDefault true;
    };
  };
}
