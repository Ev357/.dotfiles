{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./plugins
    ./keymaps.nix
  ];

  programs.nixvim = {
    defaultEditor = true;
    opts = {
      number = true;
      relativenumber = true;
      splitright = true;
      splitbelow = true;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      inccommand = "split";
      scrolloff = 16;
      conceallevel = 1;
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
        transparent_background = true;
      };
    };
    clipboard.register = "unnamedplus";
    performance.byteCompileLua.enable = true;
    vimAlias = true;

    plugins = {
      comment.enable = true;
      sleuth.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      oil.enable = true;
      neogit.enable = true;
      obsidian.enable = true;
      snacks.enable = true;
      mini.enable = true;
      which-key.enable = true;
      lsp.enable = true;
      blink-cmp.enable = true;
      conform-nvim.enable = true;
      flash.enable = true;
      gitsigns.enable = true;
      todo-comments.enable = true;
      undotree.enable = true;
      dap.enable = true;
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
      fidget.enable = true;
    };

    autoCmd = [
      {
        event = "TextYankPost";
        desc = "Highlight when yanking (copying) text";
        callback.__raw = /*lua*/ ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];

    userCommands = {
      FormatDisable = {
        bang = true;
        desc = "Disable autoformat-on-save";
        command.__raw = /*lua*/ ''
          function(args)
            if args.bang then
              vim.b.disable_autoformat = true
            else
              vim.g.disable_autoformat = true
            end
          end
        '';
      };

      FormatEnable = {
        desc = "Re-enable autoformat-on-save";
        command.__raw = /*lua*/ ''
          function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
          end
        '';
      };
    };

    extraPackages = with pkgs; [
      prettierd
      stylua
      csharpier
      imagemagick
    ];

    extraPlugins = with pkgs.vimPlugins; [
      supermaven-nvim
    ];

    extraConfigLua = /*lua*/ ''
      require('mini.statusline').section_location = function()
        return '%2l:%-2v'
      end

      require('supermaven-nvim').setup({ log_level = 'off' })

      require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
      require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
      require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
    '';
  };
}
