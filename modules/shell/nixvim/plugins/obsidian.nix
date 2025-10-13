{
  plugins.obsidian = {
    settings = {
      workspaces = [
        {
          name = "no-vault";
          path.__raw =
            # lua
            ''
              function()
                return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
              end
            '';
          overrides = {
            new_notes_location = "current_dir";
            frontmatter.enabled.__raw =
              # lua
              ''
                function()
                  local buf_path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
                  local obsidian_path = vim.fn.expand("~/Documents/obsidian")
                  return vim.fn.stridx(buf_path, obsidian_path) == 0
                end
              '';
          };
        }
      ];
      ui.enable = false;
      completion = {
        blink = true;
        min_chars = 2;
      };
      legacy_commands = false;
      footer.enabled = false;
    };
  };
}
