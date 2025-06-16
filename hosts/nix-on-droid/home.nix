{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  modules.shell.enable = true;

  programs.obsidian = {
    enable = true;
    package = pkgs.emptyDirectory;
  };

  dconf.enable = false;
}
