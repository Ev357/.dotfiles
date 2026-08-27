{
  plugins.blink-cmp.settings = {
    snippets.preset = "mini_snippets";
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
      "<C-k>" = ["show" "show_documentation" "hide_documentation"];
    };
  };
}
