{
  imports = [
    ../../modules
  ];

  home = {
    username = "evest";
    homeDirectory = "/home/evest";
    stateVersion = "25.11";
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
    applications.enable = true;
  };

  programs = {
    waybar.enable = true;
    gemini-cli.enable = true;
    nixvim.configNames = {
      homeManager = "evest@lucasgager";
      nixos = "lucasgager";
    };
  };

  services.swaync.enable = true;
}
