{
  programs.nixvim = {
    plugins.telescope.settings = {
      pickers = {
        buffers = {
          sort_mru = true;
          sort_lastused = true;
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
      {
        mode = "n";
        key = "<leader>sf";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').find_files
        '';
        options.desc = "[S]earch [F]iles";
      }
      {
        mode = "n";
        key = "<leader>sg";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').live_grep
        '';
        options.desc = "[S]earch by [G]rep";
      }
      {
        mode = "n";
        key = "<leader>sd";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').diagnostics
        '';
        options.desc = "[S]earch [D]iagnostics";
      }
      {
        mode = "n";
        key = "<leader><leader>";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').buffers
        '';
        options.desc = "[ ] Find existing buffers";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').git_branches
        '';
        options.desc = "[G]it [b]ranches";
      }
      {
        mode = "n";
        key = "<leader>/";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').current_buffer_fuzzy_find
        '';
        options.desc = "[/] Fuzzily search in current buffer";
      }
    ];
  };
}
