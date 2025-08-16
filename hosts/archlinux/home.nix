{pkgs, ...}: {
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
  };

  programs = {
    waybar.enable = true;
    hyprlock.package = null;
    ghostty.package = null;
    zed-editor.package = pkgs.emptyDirectory;
    obsidian.package = pkgs.emptyDirectory;
    nixvim.configNames.homeManager = "evest@lucas.gager";
  };

  services.swaync.enable = true;
}
