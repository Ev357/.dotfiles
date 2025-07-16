{
  imports = [
    ../../modules
  ];

  home = {
    username = "evest";
    homeDirectory = "/home/evest";
    stateVersion = "24.11";
  };

  wayland.windowManager.hyprland = rec {
    enable = true;
    mainMonitorName = "eDP-1";
    mainMonitorScaling = 2;
    settings = {
      monitor = [
        "${mainMonitorName}, highres, auto, ${toString mainMonitorScaling}"
        ", preferred, auto-up, 1"
      ];
    };
  };

  modules = {
    shell.enable = true;
    applications.enable = true;
    games.enable = true;
    ai.enable = true;
  };

  services.swaync.enable = true;
  programs.waybar.enable = true;
}
