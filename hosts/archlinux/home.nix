{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  wayland.windowManager.hyprland = rec {
    mainMonitorName = "eDP-1";
    settings.monitor = [
      "${mainMonitorName}, preferred, auto, 1"
      ", preferred, auto-up, 1"
    ];
  };

  modules = {
    hyprland.enable = true;
    shell.enable = true;
    applications.enable = true;
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
