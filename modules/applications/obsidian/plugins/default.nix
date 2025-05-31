{ pkgs, ... }:

{
  programs.obsidian.defaultSettings.communityPlugins = [
    {
      pkg = pkgs.callPackage ./cmdr/package { };
      settings = builtins.fromJSON (builtins.readFile ./cmdr/data.json);
    }
    {
      pkg = pkgs.callPackage ./obsidian-excalidraw-plugin/package { };
      settings = builtins.fromJSON (builtins.readFile ./obsidian-excalidraw-plugin/data.json);
    }
    {
      pkg = pkgs.callPackage ./obsidian-git/package { };
      settings = builtins.fromJSON (builtins.readFile ./obsidian-git/data.json);
    }
    {
      pkg = pkgs.callPackage ./obsidian-relative-line-numbers/package { };
    }
    {
      pkg = pkgs.callPackage ./obsidian-scroll-offset/package { };
    }
    {
      pkg = pkgs.callPackage ./obsidian-vim-yank-highlight/package { };
    }
    {
      pkg = pkgs.callPackage ./obsidian-vimrc-support/package { };
    }
  ];
}
