{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  modules = {
    hyprland.enable = true;
    shell.enable = true;
    applications.enable = true;
  };

  programs = {
    hyprlock.package = null;
    ghostty.package = null;
    zed-editor.package = pkgs.emptyDirectory;
  };
}
