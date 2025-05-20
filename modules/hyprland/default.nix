{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = import ./settings.nix;
  };

  home = {
    file.".config/hypr/hyprland/colors.conf".source = ./colors.conf;
    packages = with pkgs; [
      hyprshot
    ];
  };
}
