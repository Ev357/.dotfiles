{
  plugins.blink-cmp.settings = {
    snippets.preset = "mini_snippets";
    sources = {
      default = [
        "lsp"
        "path"
        "snippets"
        "buffer"
        "avante"
      ];
      providers = {
        avante = {
          module = "blink-cmp-avante";
          name = "Avante";
        };
      };
    };
    completion = {
      menu = {
        border = "rounded";
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None";
      };
      documentation = {
        window = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None";
        };
      };
    };
    keymap = {
      "<C-space>" = false;
      "<C-m>" = ["show" "show_documentation" "hide_documentation"];
    };
  };
}
