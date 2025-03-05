[
  {
    mode = "n";
    key = "<leader>f";
    action.__raw = /*lua*/ ''
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end
    '';
    options.desc = "[F]ormat buffer";
  }
]
