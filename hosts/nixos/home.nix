{
  imports = [
    ../../modules
  ];

  modules = {
    hyprland.enable = true;
    shell.enable = true;
    applications.enable = true;
    games.enable = true;
  };

  services.swaync.enable = true;
  programs.ags.enable = true;
}
