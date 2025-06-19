{
  programs.nixvim.plugins.obsidian = {
    settings = {
      workspaces = [
        {
          name = "no-vault";
          path.__raw = /* lua */ ''
            function()
              return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
            end
          '';
          overrides = {
            new_notes_location = "current_dir";
            disable_frontmatter = true;
          };
        }
      ];
      completion = {
        blink = true;
        min_chars = 2;
      };
    };
  };
}
