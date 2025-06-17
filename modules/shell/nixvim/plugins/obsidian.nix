{
  programs.nixvim.plugins.obsidian = {
    settings = {
      workspaces = [
        {
          name = "Obsidian";
          path = "~/Documents/Obsidian";
        }
      ];
      completion = {
        blink = true;
        min_chars = 2;
      };
    };
  };
}
