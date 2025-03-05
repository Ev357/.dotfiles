{
  lsp = {
    enable = true;
    inlayHints = true;

    servers = {
      gopls.enable = true;
      volar.enable = true;
      ts_ls.enable = true;
      angularls.enable = true;
      tailwindcss.enable = true;
      biome.enable = true;
      csharp_ls.enable = true;
      # csharpier.enable = true;
      cssls.enable = true;
      emmet_language_server.enable = true;
      html.enable = true;
      lua_ls.enable = true;
      # omnisharp.enable = true;
      pylsp.enable = true;
      # stylua3p_ls.enable = true;
      svelte.enable = true;
      dockerls.enable = true;
      golangci_lint_ls.enable = true;
      jsonls.enable = true;
      pylyzer.enable = false;

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
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
}
