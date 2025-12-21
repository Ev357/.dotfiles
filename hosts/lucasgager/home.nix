{
  pkgs,
  lib,
  ...
}: {
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
    applications = {
      enable = true;
      teams-for-linux.enable = true;
    };
  };

  home.packages = with pkgs; [
    dbeaver-bin
  ];

  programs = {
    waybar.enable = true;
    gemini-cli.enable = true;
    keepassxc.enable = true;
    pidgin.enable = true;
    nixvim.configNames = {
      homeManager = "evest@lucasgager";
      nixos = "lucasgager";
    };
  };

  services = {
    swaync.enable = true;
    gnome-keyring.enable = true;
    remmina.enable = true;
  };
}
