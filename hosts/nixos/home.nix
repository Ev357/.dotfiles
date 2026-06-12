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
    mainMonitorScaling = 2;
    settings.config = {
      monitor = [
        {
          output = mainMonitorName;
          mode = "highres";
          position = "auto";
          scale = mainMonitorScaling;
        }
        {
          output = "";
          mode = "preferred";
          position = "auto-up";
          scale = 1;
        }
      ];
    };
  };

  modules = {
    shell.enable = true;
    applications.enable = true;
    games.enable = true;
    ai.enable = true;
  };

  nixpkgs.config.rocmSupport = true;

  home.packages = with pkgs; [
    blender
    eduvpn-client
    slack
  ];

  services = {
    swaync.enable = true;
    mpris-proxy.enable = true;
    blueman-applet.enable = true;
    batsignal.enable = true;
    ollama = {
      acceleration = "rocm";
    };
  };

  programs = {
    waybar.enable = true;
    vicinae.enable = true;
  };

  i18n.inputMethod.enable = true;
}
