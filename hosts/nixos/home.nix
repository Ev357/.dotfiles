{
  imports = [
    ../../modules
  ];

  wayland.windowManager.hyprland = rec {
    enable = true;
    mainMonitorName = "eDP-1";
    mainMonitorScaling = 2;
    settings = {
      monitor = [
        "${mainMonitorName}, preferred, auto, ${builtins.toString mainMonitorScaling}"
        ", preferred, auto-up, 1"
      ];
    };
  };

  modules = {
    shell.enable = true;
    applications.enable = true;
    games.enable = true;
  };

  services.swaync.enable = true;
  programs.ags.enable = true;
}
