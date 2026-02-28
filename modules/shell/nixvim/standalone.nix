{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./plugins
    ./keymaps.nix
    ./config-names.nix
  ];

  package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;

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
    laststatus = 0;
    ruler = false;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };
    inccommand = "split";
    scrolloff = 16;
  };
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    omni_sql_default_compl_type = "syntax";
  };
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
      transparent_background = true;
      float.transparent = true;
    };
  };
  diagnostic.settings = {
    update_in_insert = false;
    severity_sort = true;
    float = {
      border = "rounded";
      source = "if_many";
    };
    underline = {severity.__raw = "vim.diagnostic.severity.ERROR";};
    virtual_text = true;
    virtual_lines = false;
    jump = {float = true;};
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
    # ghostty crashes for some reason, needs a fix
    # snacks.enable = true;
    mini.enable = true;
    lsp.enable = true;
    blink-cmp.enable = true;
    conform-nvim.enable = true;
    flash.enable = true;
    gitsigns.enable = true;
    undotree.enable = true;
    dap.enable = true;
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
    fidget.enable = true;
    diffview.enable = true;
  };

  autoCmd = [
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      callback.__raw =
        # lua
        ''
          function()
            vim.highlight.on_yank()
          end
        '';
    }
    {
      event = "CmdlineLeave";
      desc = "Clear command line message after it's displayed";
      callback.__raw =
        # lua
        ''
          function()
            vim.defer_fn(function()
              vim.cmd("echon \'\'")
            end, 1000)
          end
        '';
    }
  ];

  userCommands = {
    FormatDisable = {
      bang = true;
      desc = "Disable autoformat-on-save";
      command.__raw =
        # lua
        ''
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
      command.__raw =
        # lua
        ''
          function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
          end
        '';
    };
  };

  extraPackages = with pkgs; [
    ripgrep
    prettierd
    stylua
    csharpier
    imagemagick
    (pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-gust
        standalone
        varwidth
        preview
        mathtools
        xcolor
        ;
    })
    ghostscript
    sql-formatter
    black
    isort
  ];

  extraPlugins = with pkgs.vimPlugins; [
    supermaven-nvim
    blink-cmp-avante
  ];

  extraConfigLua =
    # lua
    ''
      local binary_handler = require("supermaven-nvim.binary.binary_handler")
      local original_open_popup = binary_handler.open_popup

      local using_free_version = false
      function binary_handler:open_popup(message, include_free)
        if using_free_version then
          return
        end

        if include_free then
          using_free_version = true
          self:use_free_version()
          return
        end

        original_open_popup(self, message, include_free)
      end

      require('supermaven-nvim').setup({ log_level = 'off' })

      require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
      require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
      require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close

      local hover = vim.lsp.buf.hover
      vim.lsp.buf.hover = function()
        return hover({
          border = "rounded",
        })
      end

      -- https://github.com/neovim/neovim/issues/34731#issuecomment-3169771547
      vim.lsp.config("pyright", {
        handlers = {
          [vim.lsp.protocol.Methods.textDocument_rename] = function(err, result, ctx)
            if err then
              vim.notify('Pyright rename failed: ' .. err.message, vim.log.levels.ERROR)
              return
            end

            ---@cast result lsp.WorkspaceEdit
            for _, change in ipairs(result.documentChanges or {}) do
              for _, edit in ipairs(change.edits or {}) do
                if edit.annotationId then
                  edit.annotationId = nil
                end
              end
            end

            local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
            vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
          end,
        },
      })
    '';
}
