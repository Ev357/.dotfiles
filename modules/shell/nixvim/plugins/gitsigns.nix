{
  programs.nixvim = {
    plugins.gitsigns.settings = {
      signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "]c";
        action.__raw = /*lua*/ ''
          function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              require("gitsigns").nav_hunk 'next'
            end
          end
        '';
        options.desc = "Jump to next git [c]hange";
      }
      {
        mode = "n";
        key = "[c";
        action.__raw = /*lua*/ ''
          function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              require("gitsigns").nav_hunk 'prev'
            end
          end
        '';
        options.desc = "Jump to previous git [c]hange";
      }
      {
        mode = "v";
        key = "<leader>hs";
        action.__raw = /*lua*/ ''
          function()
            require("gitsigns").stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end
        '';
        options.desc = "git [s]tage hunk";
      }
      {
        mode = "v";
        key = "<leader>hr";
        action.__raw = /*lua*/ ''
          function()
            require("gitsigns").reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end
        '';
        options.desc = "git [r]eset hunk";
      }
      {
        mode = "n";
        key = "<leader>hs";
        action.__raw = /*lua*/ ''
          require("gitsigns").stage_hunk
        '';
        options.desc = "git [s]tage hunk";
      }
      {
        mode = "n";
        key = "<leader>hr";
        action.__raw = /*lua*/ ''
          require("gitsigns").reset_hunk
        '';
        options.desc = "git [r]eset hunk";
      }
      {
        mode = "n";
        key = "<leader>hS";
        action.__raw = /*lua*/ ''
          require("gitsigns").stage_buffer
        '';
        options.desc = "git [S]tage buffer";
      }
      {
        mode = "n";
        key = "<leader>hR";
        action.__raw = /*lua*/ ''
          require("gitsigns").reset_buffer
        '';
        options.desc = "git [R]eset buffer";
      }
      {
        mode = "n";
        key = "<leader>hp";
        action.__raw = /*lua*/ ''
          require("gitsigns").preview_hunk
        '';
        options.desc = "git [p]review hunk";
      }
      {
        mode = "n";
        key = "<leader>hb";
        action.__raw = /*lua*/ ''
          require("gitsigns").blame_line
        '';
        options.desc = "git [b]lame line";
      }
      {
        mode = "n";
        key = "<leader>hd";
        action.__raw = /*lua*/ ''
          require("gitsigns").diffthis
        '';
        options.desc = "git [d]iff against index";
      }
      {
        mode = "n";
        key = "<leader>hD";
        action.__raw = /*lua*/ ''
          function()
            require("gitsigns").diffthis '@'
          end
        '';
        options.desc = "git [D]iff against last commit";
      }
      {
        mode = "n";
        key = "<leader>tb";
        action.__raw = /*lua*/ ''
          require("gitsigns").toggle_current_line_blame
        '';
        options.desc = "[T]oggle git show [b]lame line";
      }
      {
        mode = "n";
        key = "<leader>tD";
        action.__raw = /*lua*/ ''
          require("gitsigns").preview_hunk_inline
        '';
        options.desc = "[T]oggle git show [D]eleted";
      }
    ];
  };
}
