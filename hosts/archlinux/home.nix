{
  imports = [
    ../../modules
  ];

  modules = {
    hyprland.enable = true;
  };

  programs = {
    hyprlock.enable = false;
    ghostty.package = null;
    zed-editor.package = null;
  };
}
