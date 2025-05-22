{
  programs.nixvim = {
    plugins.lsp = {
      inlayHints = true;

      servers = {
        gopls.enable = true;
        volar.enable = true;
        ts_ls.enable = true;
        angularls.enable = true;
        tailwindcss.enable = true;
        biome.enable = true;
        cssls.enable = true;
        emmet_language_server.enable = true;
        html.enable = true;
        lua_ls.enable = true;
        svelte.enable = true;
        dockerls.enable = true;
        golangci_lint_ls.enable = true;
        jsonls.enable = true;
        omnisharp.enable = true;
        tinymist.enable = true;

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        nixd = {
          enable = true;

          settings = {
            formatting.command = [ "nixpkgs-fmt" ];
            nixpkgs.expr = "import <nixpkgs> {}";
          };
        };
        yamlls = {
          enable = true;
          filetypes = [ "yaml" ];
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>rn";
        action.__raw = /*lua*/ ''
          function()
           local lsp_priority = {
             rename = {
               'angularls',
             },
           }

           local lsp_have_feature = {
             rename = function(client)
               return client.supports_method 'textDocument/rename'
             end,
             inlay_hint = function(client)
               return client.supports_method 'textDocument/inlayHint'
             end,
           }

           local function get_lsp_client_names(have_feature)
             local client_names = {}
             local attached_clients = vim.lsp.get_clients { bufnr = 0 }
             for _, client in ipairs(attached_clients) do
               if have_feature(client) then
                 table.insert(client_names, client.name)
               end
             end
             return client_names
           end

           local function lsp_buf_rename(client_name)
             vim.lsp.buf.rename(nil, { name = client_name })
           end

           local function lsp_buf_rename_use_one(fallback)
             local client_names = get_lsp_client_names(lsp_have_feature.rename)
             if #client_names == 1 then
               lsp_buf_rename(client_names[1])
               return
             end
             if fallback then
               fallback()
             end
           end

           local function lsp_buf_rename_use_select(fallback)
             local client_names = get_lsp_client_names(lsp_have_feature.rename)
             local prompt = 'Select lsp client for rename operation'
             local function on_choice(client_name)
               if client_name then
                 lsp_buf_rename(client_name)
                 return
               end
               if fallback then
                 fallback()
               end
             end
             vim.ui.select(client_names, { prompt = prompt }, on_choice)
           end

           local function lsp_buf_rename_use_priority(fallback)
             local client_names = get_lsp_client_names(lsp_have_feature.rename)
             for _, client_priority_name in ipairs(lsp_priority.rename) do
               for _, client_name in ipairs(client_names) do
                 if client_priority_name == client_name then
                   lsp_buf_rename(client_priority_name)
                   return
                 end
               end
             end
             if fallback then
               fallback()
             end
           end

           lsp_buf_rename_use_one(function()
             lsp_buf_rename_use_priority(function()
               lsp_buf_rename_use_select()
             end)
           end)
          end
        '';
        options.desc = "[R]e[n]ame";
      }
      {
        mode = [ "n" "x" ];
        key = "<leader>ca";
        action.__raw = /*lua*/ ''
          vim.lsp.buf.code_action
        '';
        options.desc = "[C]ode [A]ction";
      }
      {
        mode = "n";
        key = "gd";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').lsp_definitions
        '';
        options.desc = "[G]oto [D]efinition";
      }
      {
        mode = "n";
        key = "gr";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').lsp_references
        '';
        options.desc = "[G]oto [R]eferences";
      }
      {
        mode = "n";
        key = "gI";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').lsp_implementations
        '';
        options.desc = "[G]oto [I]mplementation";
      }
      {
        mode = "n";
        key = "<leader>D";
        action.__raw = /*lua*/ ''
          require('telescope.builtin').lsp_type_definitions
        '';
        options.desc = "Type [D]efinition";
      }
      {
        mode = "n";
        key = "<leader>e";
        action.__raw = /*lua*/ ''
          vim.diagnostic.open_float
        '';
        options.desc = "[E]rror diagnostics";
      }
      {
        mode = "n";
        key = "<leader>q";
        action.__raw = /*lua*/ ''
          vim.diagnostic.setloclist
        '';
        options.desc = "Open diagnostic [Q]uickfix list";
      }
    ];
  };
}
