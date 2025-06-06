{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  wayland.windowManager.hyprland = rec {
    enable = true;
    mainMonitorName = "eDP-1";
    mainMonitorScaling = 1;
    settings.monitor = [
      "${mainMonitorName}, preferred, auto, ${builtins.toString mainMonitorScaling}"
      ", preferred, auto-up, 1"
    ];
  };

  modules = {
    shell.enable = true;
    applications = {
      enable = true;
      other.disableOpenGLApps = true;
    };
    games = {
      enable = true;
      osu.noInstall = true;
    };
  };

  programs = {
    hyprlock.package = null;
    ghostty.package = null;
    zed-editor.package = pkgs.emptyDirectory;
    obsidian.package = pkgs.emptyDirectory;
  };

  services.swaync.enable = true;
}
