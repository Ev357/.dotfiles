{ pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    package = null;
    portalPackage = null;
    systemd.enable = false;
  };

  home = {
    file.".config/hypr/hyprland/colors.conf".source = ./colors.conf;
    packages = with pkgs; [
      hyprshot
    ];
  };
}
