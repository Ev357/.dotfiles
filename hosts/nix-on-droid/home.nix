{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  home = {
    username = "nix-on-droid";
    homeDirectory = "/data/data/com.termux.nix/files/home";
    stateVersion = "24.05";
  };

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
      cp -aL $HOME/Documents/obsidian/. .
    '';
  };
}
