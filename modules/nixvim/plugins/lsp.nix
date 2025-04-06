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
      cssls.enable = true;
      emmet_language_server.enable = true;
      html.enable = true;
      lua_ls.enable = true;
      pylsp.enable = true;
      svelte.enable = true;
      dockerls.enable = true;
      golangci_lint_ls.enable = true;
      jsonls.enable = true;
      omnisharp.enable = true;
      pylyzer.enable = true;

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
}
