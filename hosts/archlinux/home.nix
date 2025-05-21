{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  modules = {
    hyprland.enable = true;
  };

  programs = {
    hyprlock.package = null;
    ghostty.package = null;
    zed-editor.package = pkgs.emptyDirectory;
  };
}
