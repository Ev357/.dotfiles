{ pkgs, ... }:

{
  programs.obsidian.defaultSettings.themes = [
    {
      pkg = pkgs.callPackage ./package { };
    }
  ];
}
