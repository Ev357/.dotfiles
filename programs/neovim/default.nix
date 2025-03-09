{ pkgs, ... }:

{
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
  };
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
    };
  };
  clipboard.register = "unnamedplus";
  performance.byteCompileLua.enable = true;
  vimAlias = true;

  keymaps = [ ]
    ++ import ./keymaps/keymaps.nix
    ++ import ./keymaps/telescope.nix
    ++ import ./keymaps/oil.nix
    ++ import ./keymaps/lsp.nix
    ++ import ./keymaps/conform-nvim.nix
    ++ import ./keymaps/neogit.nix
    ++ import ./keymaps/flash.nix
    ++ import ./keymaps/gitsigns.nix
    ++ import ./keymaps/undotree.nix;

  plugins = {
    comment.enable = true;
    fidget.enable = true;
    sleuth.enable = true;
  } // (
    (import ./plugins/telescope.nix)
      // (import ./plugins/treesitter.nix)
      // (import ./plugins/oil.nix)
      // (import ./plugins/neogit.nix)
      // (import ./plugins/mini.nix)
      // (import ./plugins/which-key.nix)
      // (import ./plugins/lsp.nix)
      // (import ./plugins/blink-cmp.nix)
      // (import ./plugins/conform-nvim.nix)
      // (import ./plugins/flash.nix)
      // (import ./plugins/gitsigns.nix)
      // (import ./plugins/todo-comments.nix)
      // (import ./plugins/undotree.nix)
  );

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

  extraPackages = with pkgs; [
    prettierd
    stylua
    csharpier
  ];

  extraPlugins = with pkgs.vimPlugins; [
    supermaven-nvim
  ];

  extraConfigLua = /*lua*/ ''
    require('mini.statusline').section_location = function()
      return '%2l:%-2v'
    end

    require('supermaven-nvim').setup({ log_level = 'off' })
  '';
}
