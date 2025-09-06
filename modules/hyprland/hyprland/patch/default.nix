{lib, ...}: {
  options.wayland.windowManager.hyprland = {
    mainMonitorName = lib.mkOption {
      type = lib.types.str;
      default = "eDP-1";
      description = "The name of the main monitor.";
    };
    mainMonitorScaling = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "The scaling of the main monitor.";
    };
  };
}
