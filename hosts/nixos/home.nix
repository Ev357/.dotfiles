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
  programs = {
    waybar.enable = true;
    # until https://github.com/nix-community/home-manager/issues/7327 is fixed
    zed-editor.enable = false;
  };
}
