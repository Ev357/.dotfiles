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
        target = "Documents/obsidian";
      };
    };

    defaultSettings = {
      app = {
        vimMode = true;
        spellcheck = false;
        showLineNumber = true;
        propertiesInDocument = "hidden";
      };
      appearance = {
        cssTheme = "Catppuccin";
        theme = "obsidian";
        showRibbon = false;
        nativeMenus = false;
        showInlineTitle = false;
      };
      hotkeys = {
        "editor:delete-paragraph" = [];
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
