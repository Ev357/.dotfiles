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

  home.activation = {
    obsidian = /* bash */ ''
      cd /storage/emulated/0/Documents/Obsidian
      ${pkgs.git}/bin/git clean -fdX
      cp -aL $HOME/Documents/Obsidian/. .
    '';
  };
}
