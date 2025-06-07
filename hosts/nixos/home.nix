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
      env = [
        "QT_SCALE_FACTOR,${builtins.toString mainMonitorScaling}"
        "GDK_SCALE,${builtins.toString mainMonitorScaling}"
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
