{ pkgs, ... }:

let
  obsidian-plugins = {
    obsidian-vim-yank-highlight = pkgs.callPackage ./plugins/obsidian-vim-yank-highlight { };
    obsidian-scroll-offset = pkgs.callPackage ./plugins/obsidian-scroll-offset { };
    obsidian-relative-line-numbers = pkgs.callPackage ./plugins/obsidian-relative-line-numbers { };
  };
in
{
  programs.obsidian = {
    vaults = {
      Obsidian = {
        enable = true;
        target = "Documents/Obsidian";
      };
    };

    defaultSettings = {
      app = {
        vimMode = true;
        spellcheck = false;
        showLineNumber = true;
      };
      appearance = {
        cssTheme = "Catppuccin";
        theme = "obsidian";
        showRibbon = false;
        nativeMenus = false;
      };
      communityPlugins = [
        {
          pkg = obsidian-plugins.obsidian-vim-yank-highlight;
        }
        {
          pkg = obsidian-plugins.obsidian-scroll-offset;
        }
        {
          pkg = obsidian-plugins.obsidian-relative-line-numbers;
        }
      ];
      cssSnippets = [
        {
          name = "stop-blinking-cursor";
          source = ./snippets/stop-blinking-cursor.css;
        }
      ];
      extraFiles = {
        ".obsidian.vimrc" = {
          source = ./.obsidian.vimrc;
          target = "../.obsidian.vimrc";
        };
      };
    };
  };
}
