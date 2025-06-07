{ lib, config, ... }:

{
  imports = [
    ./hyprcursor
    ./hypridle
    ./hyprland
    ./hyprlock
    ./hyprpaper
    ./hyprsunset
  ];

  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    modules.hyprland.hyprcursor.enable = lib.mkDefault true;
    programs.hyprlock.enable = lib.mkDefault true;
    services = {
      hypridle.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      hyprpolkitagent.enable = lib.mkDefault true;
      hyprsunset.enable = lib.mkDefault true;
    };
  };
}
