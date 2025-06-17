{
  imports = [
    ./plugins
    ./theme
    ./patch
  ];

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
      hotkeys = {
        "editor:delete-paragraph" = [ ];
      };
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

    extraSettings = {
      frame = "native";
    };
  };
}
