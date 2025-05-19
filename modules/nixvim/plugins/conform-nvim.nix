{
  conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft.__raw = /*lua*/ ''
        (function()
          local config = {
            lua = { 'stylua' },
            arduino = { 'clang-format' },
            cs = { 'csharpier' },
            nix = { 'nixpkgs_fmt' },
            html = { 'prettierd' },
            htmlangular = { 'prettierd' },
          }

          local formatters = { 'biome', 'prettierd' }

          local function reorder_formatters()
            if vim.fs.find({
              '.prettierrc',
            }, { upward = true, stop = vim.loop.os_homedir() })[1] then
              return { 'prettierd', 'biome' }
            end
            return formatters
          end

          for _, lang in ipairs { 'javascript', 'typescript', 'vue', 'css', 'scss', 'json', 'typescriptreact', 'yaml' } do
            config[lang] = reorder_formatters()
            config[lang].stop_after_first = true
          end

          return config
        end)()
      '';

      format_on_save = /*lua*/ ''
        function(bufnr)
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = 'never'
          else
            lsp_format_opt = 'fallback'
          end
          return { timeout_ms = 10000, lsp_format = lsp_format_opt }
        end
      '';
    };
  };
}
