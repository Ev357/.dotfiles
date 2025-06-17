{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  modules.shell.enable = true;

  programs.obsidian = {
    enable = true;
    package = pkgs.emptyDirectory;
    vaults = {
      Obsidian.target = "/storage/emulated/0/Documents/Obsidian";
    };
  };

  dconf.enable = false;
}
