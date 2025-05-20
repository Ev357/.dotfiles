{
  home.file.".config/hypr/hyprland/colors.conf".source = ./colors.conf;

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = import ./settings.nix;
  };
}
