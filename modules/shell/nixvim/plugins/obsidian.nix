{
  programs.nixvim.plugins.obsidian = {
    settings = {
      workspaces = [
        {
          name = "Obsidian";
          path = "~/Documents/obsidian";
        }
      ];
      completion = {
        blink = true;
        min_chars = 2;
      };
    };
  };
}
