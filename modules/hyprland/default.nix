{ lib, config, ... }:

{
  imports = [
    ./hyprcursor
    ./hypridle
    ./hyprland
    ./hyprlock
    ./hyprpaper
  ];

  options.modules.hyprland = {
    enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.modules.hyprland.enable {
    modules.hyprland.hyprcursor.enable = lib.mkDefault true;
    programs.hyprlock.enable = lib.mkDefault true;
    services = {
      hypridle.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      hyprpolkitagent.enable = lib.mkDefault true;
    };
    wayland.windowManager.hyprland.enable = lib.mkDefault true;
  };
}
