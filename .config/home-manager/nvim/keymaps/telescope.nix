[
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
]
