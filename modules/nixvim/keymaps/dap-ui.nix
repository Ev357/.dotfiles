[
  {
    mode = "n";
    key = "<F7>";
    action.__raw = /*lua*/ ''
      function()
        require('dapui').toggle()
      end
    '';
    options.desc = "Debug: See last session result.";
  }
]
