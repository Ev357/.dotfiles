{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  modules = {
    hyprland.enable = true;
    shell.enable = true;
    applications.enable = true;
    games = {
      enable = true;
      osu.noInstall = true;
    };
  };

  programs = {
    hyprlock.package = null;
    ghostty.package = null;
    zed-editor.package = pkgs.emptyDirectory;
    obsidian.package = pkgs.emptyDirectory;
  };

  services.swaync.enable = true;
}
