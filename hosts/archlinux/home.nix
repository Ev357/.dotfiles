{
  imports = [
    ../../modules
  ];

  modules = {
    hyprland.enable = true;
  };

  services.hyprlock.enable = false;
  programs.ghostty.enable = false;
}
