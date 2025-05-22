{
  programs.nixvim = {
    plugins.telescope.settings = {
      pickers = {
        buffers = {
          sort_mru = true;
          sort_lastused = true;
        };
      };
      keymaps = {
        "<leader>sf" = {
          action = "find_files";
          options.desc = "[S]earch [F]iles";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "[S]earch by [G]rep";
        };
        "<leader>sd" = {
          action = "diagnostics";
          options.desc = "[S]earch [D]iagnostics";
        };
        "<leader><leader>" = {
          action = "buffers";
          options.desc = "[ ] Find existing buffers";
        };
        "<leader>gb" = {
          action = "git_branches";
          options.desc = "[G]it [b]ranches";
        };
        "<leader>/" = {
          action = "current_buffer_fuzzy_find";
          options.desc = "[/] Fuzzily search in current buffer";
        };
      };
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>sn";
        action.__raw = /*lua*/ ''
          function()
            require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config'), follow = true })
          end
        '';
        options.desc = "[S]earch [N]eovim files";
      }
    ];
  };
}
